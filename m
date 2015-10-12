Content-Type: multipart/mixed; boundary="===============5479085757391692585=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [string] 5f6f0801f5: BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at addr ffff88011a666ee0
Date: Mon, 12 Oct 2015 10:13:35 +0200
Message-ID: <20151012081334.GA23595@gmail.com>
In-Reply-To: <87y4f88rc8.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5479085757391692585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Huang, Ying <ying.huang@linux.intel.com> wrote:

> Ingo Molnar <mingo@kernel.org> writes:
> =

> > * kernel test robot <ying.huang@linux.intel.com> wrote:
> >
> >> FYI, we noticed the below changes on
> >> =

> >> git://internal_mailing_list_patch_tree Ingo-Molnar/string-Improve-the-=
generic-strlcpy-implementation
> >> commit 5f6f0801f5fdfce4984c6a14f99dbfbb417acb66 ("string: Improve the =
generic strlcpy() implementation")
> >
> > Hm, there's no such commit ID anywhere I can see - did you rebase my tr=
ee perhaps?
> =

> The test is for patch from LKML instead of git tree.  That is, you patch
> is tested via applying it to a -rc kernel.
> =

> Do you have a commit in your tree for this?  We can test that to confirm.

Yeah, I just made a merge that includes just to strscpy() related bits:

b94371b0917a Merge tag 'v4.3-rc5' into core/strings, to pick up strscpy() f=
ixes

(Note, it might take a few minutes for korg git mirrors to pick up this mer=
ge.)

All that tree does is that it makes strlcpy() use strscpy():

> > +size_t strlcpy(char *dst, const char *src, size_t dst_size)
> > +{
> > +	int ret =3D strscpy(dst, src, dst_size);
> > +
> > +	/* Handle the insane and broken strlcpy() overflow return value: */
> > +	if (ret < 0)
> > +		return dst_size + strlen(src+dst_size);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(strlcpy);

Do you see the same KASAN failure with that commit? If my analysis below is =

correct, then the failure should go away.

Analysis:

The stack dump:

[   22.242067]  [<ffffffff8177a3e8>] strlcpy+0xc8/0x250
[   22.242067]  [<ffffffff8117b1b7>] cgroup_release_agent_write+0x67/0xa0
[   22.242067]  [<ffffffff81179925>] cgroup_file_write+0x75/0x180
[   22.242067]  [<ffffffff812af81e>] kernfs_fop_write+0x17e/0x210
[   22.242067]  [<ffffffff8121cf67>] __vfs_write+0x57/0x170
[   22.242067]  [<ffffffff8121d2bb>] vfs_write+0xeb/0x240

Implicates this strlcpy():

        spin_lock(&release_agent_path_lock);
        strlcpy(cgrp->root->release_agent_path, strstrip(buf),
                sizeof(cgrp->root->release_agent_path));
        spin_unlock(&release_agent_path_lock);

where:

include/linux/cgroup-defs.h:    char release_agent_path[PATH_MAX];

the target buffer sizing looks pretty robust (because simple).

And the input buffer side looks safe as well, by my reading:

'buf' here seems like a regular write operation, with a 'buf' and a 'size' =

parameter - layered in through various layers of abstraction:

 struct cftype::write, used in kernel/cgroup.c: cgroup_file_write()

 - no size checks, no guarantee that we have a string

this is called via:

 struct kernfs_ops::write via kernfs

which guarantees string termination in fs/kernfs/file.c's kernfs_fop_write(=
):

        buf[len] =3D '\0';        /* guarantee string termination */

        ops =3D kernfs_ops(of->kn);
        if (ops->write)
                len =3D ops->write(of, buf, len, *ppos);

and that's a stable, private string local to the calling task.

So my guess is that this is the bug that got fixed by:

  990486c8af04 ("strscpy: zero any trailing garbage bytes in the destinatio=
n")

that that systemd passed in a string with leading whitespace, thus strtrim(=
) =

created an unaligned string, which caused the strscpy() to access past the =
end of =

the kmalloc() buffer.

Thanks,

	Ingo

--===============5479085757391692585==--


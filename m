Content-Type: multipart/mixed; boundary="===============7611823684248640078=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Mon, 04 Mar 2019 10:14:34 +0900
Message-ID: <20190304101434.8429ffffb17813c0e7930130@kernel.org>
In-Reply-To: <CAHk-=wij8VLupHh1U-fFhFBjin9Fch3mG2_2=aL9h1L+WBvm2g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7611823684248640078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Mar 2019 11:53:58 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, Mar 3, 2019 at 9:40 AM kernel test robot <lkp@intel.com> wrote:
> >
> > commit: 780464aed08ad00aa6d5f81ac8bef2e714dc8b06 ("[PATCH v5 2/6] uacce=
ss: Use user_access_ok() in user_access_begin()")
> =

> Hmm. Not an upstream commit ID, so this is presumably a backport.
> =

> Ok, let's see what it is using the web link:
> =

> > url: https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/tracing-=
probes-uaccess-Add-support-user-space-access/20190303-203749
> =

> Yeah, that just gives a github 404 error.
> =

> I'm _assuming_ it's the WARN_ON_IN_IRQ() in the access_ok().

I think it comes from WARN_ON_ONCE(!segment_eq(get_fs(), USER_DS)) in =

user_access_ok(). The call trace shows that strndup_user might be called
from kernel daemon context.

[    4.003505] Call Trace:
[    4.003505]  strndup_user+0x14/0x60
[    4.003505]  ksys_mount+0x30/0xd0
[    4.003505]  ? handle_create+0x1f0/0x1f0
[    4.003505]  devtmpfsd+0x9c/0x190

I guess devtmpfsd has not set USER_DS. Hmm, in that case, how ksys_*()
parameters should be treated? Those APIs will take __user pointers, but
actually, in-kernel callers call ksys_*() with non __user variables.

For example,

static int devtmpfsd(void *p)
{
        char options[] =3D "mode=3D0755";
        int *err =3D p;
        *err =3D ksys_unshare(CLONE_NEWNS);
        if (*err)
                goto out;
        *err =3D ksys_mount("devtmpfs", "/", "devtmpfs", MS_SILENT, options=
);
        if (*err)
...

__force __user casting doesn't help, because these parameters are in kernel
memory, not in user memory. I think if we forcibly set USER_DS, it should
fail on some arch.

Peter, I think we can remove that WARN_ON_ONCE() from user_access_ok(),
since user_access_begin() is not only actually start accessing user, but it
also accessing kernel memory.

> Which doesn't much make sense either (why wouldn't it happen in
> mainline)? But without a useful web link to see what is actually being
> tested, I guess it's not something I can even look at...


Yeah, we need working web link on the report...

Thank you,


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============7611823684248640078==--


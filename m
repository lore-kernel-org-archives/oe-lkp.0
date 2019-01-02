Content-Type: multipart/mixed; boundary="===============8858455759917789504=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mtd] c4dfa25ab3: kernel_BUG_at_fs/sysfs/file.c
Date: Wed, 02 Jan 2019 11:53:34 -0800
Message-ID: <CAHk-=wh2sparb1qw4h5QTCR+YF7xsssLgZtNtthRA6QiJjKfbA@mail.gmail.com>
In-Reply-To: <20190102005704.GC17624@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8858455759917789504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hmm..

Adding a few more mtd people to the cc.

On Tue, Jan 1, 2019 at 4:57 PM kernel test robot <rong.a.chen@intel.com> =
wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: c4dfa25ab307a277eafa7067cd927fbe4d9be4ba ("mtd: add support for r=
eading MTD devices via the nvmem API")
>
> [   81.780248] kernel BUG at fs/sysfs/file.c:328!
> [   81.781914] Call Trace:
> [   81.781914]  sysfs_create_files+0x60/0x180
> [   81.781914]  mtd_add_partition_attrs+0x14/0x30
> [   81.781914]  add_mtd_partitions+0x11f/0x260
> [   81.781914]  mtd_device_parse_register+0x38d/0x4c0
> [   81.781914]  ns_init_module+0x1033/0x117d
> [   81.781914]  do_one_initcall+0x18f/0x39e
> [   81.781914]  kernel_init_freeable+0x2b4/0x353
> [   81.781914]  kernel_init+0xa/0x120

This actually looks like a very old bug, just exposed by a new error case.

In particular, the mtd code seems to do this in mtd_add_partition():

        int ret =3D 0;
     ...
        add_mtd_device(&new->mtd);

        mtd_add_partition_attrs(new);

        return ret;

where 'ret' is actually never set to anything but that initial zero.

And in fact, it looks like it never was used.

I _think_ that what's going on is that "add_mtd_device()" historically
never really failed (although it *can* fail), and then
mtd_add_partition_attrs() is called on something that doesn't really
exist.

It looks like the error handling for the add_mtd_device() case nmever
actually existed, and now the nvmem patch makes that fail in the
test-case, and the lack of error handling is exposed.

There is another call-site of add_mtd_device() (in
add_mtd_partitions() - same pattern, notice the "s" at the end of the
function name) that also lacks the error handling.

Both cases go back to 2010.

Greg, Rafael: it does strike me that the "BUG_ON()" in
sysfs_create_file_ns() could easily have been a

        if (WARN_ON(..))
                return -EINVAL;

which would have made the machine boot and probably make things easier
for normal users to report. The kernel test robot doesn't care, but
non-booting kernels are usually not nice to debug or report for normal
human beings..

                 Linus

--===============8858455759917789504==--


Content-Type: multipart/mixed; boundary="===============8190318102574513461=="
MIME-Version: 1.0
From: Boris Brezillon <bbrezillon@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mtd] c4dfa25ab3: kernel_BUG_at_fs/sysfs/file.c
Date: Mon, 07 Jan 2019 11:25:08 +0100
Message-ID: <20190107112459.2fcdebaf@bbrezillon>
In-Reply-To: <CAHk-=wh2sparb1qw4h5QTCR+YF7xsssLgZtNtthRA6QiJjKfbA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8190318102574513461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Linus,

On Wed, 2 Jan 2019 11:53:34 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Hmm..
> =

> Adding a few more mtd people to the cc.

Sorry for the late reply, I don't have access to my @bootlin.com
address anymore and it took me some time to realize you had replied to
this bug report.

> =

> On Tue, Jan 1, 2019 at 4:57 PM kernel test robot <rong.a.chen@intel.com=
> wrote:
> >
> > FYI, we noticed the following commit (built with gcc-7):
> >
> > commit: c4dfa25ab307a277eafa7067cd927fbe4d9be4ba ("mtd: add support for=
 reading MTD devices via the nvmem API")
> >
> > [   81.780248] kernel BUG at fs/sysfs/file.c:328!
> > [   81.781914] Call Trace:
> > [   81.781914]  sysfs_create_files+0x60/0x180
> > [   81.781914]  mtd_add_partition_attrs+0x14/0x30
> > [   81.781914]  add_mtd_partitions+0x11f/0x260
> > [   81.781914]  mtd_device_parse_register+0x38d/0x4c0
> > [   81.781914]  ns_init_module+0x1033/0x117d
> > [   81.781914]  do_one_initcall+0x18f/0x39e
> > [   81.781914]  kernel_init_freeable+0x2b4/0x353
> > [   81.781914]  kernel_init+0xa/0x120  =

> =

> This actually looks like a very old bug, just exposed by a new error case.
> =

> In particular, the mtd code seems to do this in mtd_add_partition():
> =

>         int ret =3D 0;
>      ...
>         add_mtd_device(&new->mtd);
> =

>         mtd_add_partition_attrs(new);
> =

>         return ret;
> =

> where 'ret' is actually never set to anything but that initial zero.
> =

> And in fact, it looks like it never was used.
> =

> I _think_ that what's going on is that "add_mtd_device()" historically
> never really failed (although it *can* fail), and then
> mtd_add_partition_attrs() is called on something that doesn't really
> exist.
> =

> It looks like the error handling for the add_mtd_device() case nmever
> actually existed, and now the nvmem patch makes that fail in the
> test-case, and the lack of error handling is exposed.
> =

> There is another call-site of add_mtd_device() (in
> add_mtd_partitions() - same pattern, notice the "s" at the end of the
> function name) that also lacks the error handling.

Yep, I fixed the root cause of the crash here [1] and plan to queue the
patch to the mtd/fixes branch soon.

Regards,

Boris

[1]http://patchwork.ozlabs.org/patch/1020008

--===============8190318102574513461==--


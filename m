Content-Type: multipart/mixed; boundary="===============8743350028682554321=="
MIME-Version: 1.0
From: Christian Brauner <christian.brauner@ubuntu.com>
To: lkp@lists.01.org
Subject: Re: [fs] 3ce4ce38a2: Kernel_panic-not_syncing:Cannot_create_bdev_pseudo-fs
Date: Fri, 16 Jul 2021 09:58:14 +0200
Message-ID: <20210716075814.mnxnzyyo4kl4tm5y@wittgenstein>
In-Reply-To: <20210716074529.GB1230@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8743350028682554321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2021 at 03:45:29PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 3ce4ce38a292c006cdf7645bc2cff88df7d990fc ("fs: add vfs_parse_fs_p=
aram_source() helper")
> https://git.kernel.org/cgit/linux/kernel/git/brauner/linux.git syzbot+538=
97bcb31b82c7a08fe

Thanks for reporting this but this is the wrong patch. The version that
made it into mainline is

commit: d1d488d813703618f0dd93f0e4c4a05928114aa8 ("fs: add vfs_parse_fs_par=
am_source() helper")

Thanks!
Christian
--===============8743350028682554321==--


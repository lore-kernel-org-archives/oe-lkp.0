Content-Type: multipart/mixed; boundary="===============4238033932413828321=="
MIME-Version: 1.0
From: Chao Yu <chao2.yu@samsung.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] 75cd4e098d: xfstests.generic.042.fail
Date: Thu, 31 Dec 2015 18:16:37 +0800
Message-ID: <012001d143b4$6eca21d0$4c5e6570$@samsung.com>
In-Reply-To: <8737un4ahx.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4238033932413828321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying,

> -----Original Message-----
> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> Sent: Monday, December 28, 2015 9:40 AM
> To: Chao Yu
> Cc: lkp(a)01.org; LKML; Jaegeuk Kim
> Subject: [lkp] [f2fs] 75cd4e098d: xfstests.generic.042.fail
> =

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 75cd4e098d178433436abce08146a21647bb4585 ("f2fs: support FALLOC_FL=
_ZERO_RANGE")
> =

> We found after your commit, the xfstests test case 009/042 failed.

Thank you for the report, 042 is a known issue, IIRC, the reason is f2fs
will flush inode page with last i_size in ioctl(F2FS_IOC_SHUTDOWN, 0x01),
but 042 expects an zero-sized inode. So I supposed it happened due to the
different semantics of metadata flushing between f2fs and xfs.

For 009, I haven't saw it failed for long time, did you test with last f2fs?

Thanks,

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
> =

> gcc-4.9/4HDD/f2fs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/vm-kbuild-4G/g=
eneric-quick/xfst
> ests
> =

> commit:
>   b4ace33703243fed56f8bfc80a001533acb9decb
>   75cd4e098d178433436abce08146a21647bb4585
> =

> b4ace33703243fed 75cd4e098d178433436abce081
> ---------------- --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :18          94%          17:18    xfstests.generic.009.fail
>            :18          94%          17:18    xfstests.generic.042.fail
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Ying Huang


--===============4238033932413828321==--


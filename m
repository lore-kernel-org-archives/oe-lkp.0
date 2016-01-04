Content-Type: multipart/mixed; boundary="===============2061955527313358786=="
MIME-Version: 1.0
From: Chao Yu <chao2.yu@samsung.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] 75cd4e098d: xfstests.generic.042.fail
Date: Mon, 04 Jan 2016 09:12:09 +0800
Message-ID: <000401d1468d$05bbecb0$1133c610$@samsung.com>
In-Reply-To: <87egdyqjty.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2061955527313358786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying,

> -----Original Message-----
> From: Huang, Ying [mailto:ying.huang(a)intel.com]
> Sent: Monday, January 04, 2016 8:17 AM
> To: Chao Yu
> Cc: 'Jaegeuk Kim'; lkp(a)01.org; 'LKML'
> Subject: Re: [LKP] [lkp] [f2fs] 75cd4e098d: xfstests.generic.042.fail
> =

> Hi, Yu,
> =

> Chao Yu <chao2.yu@samsung.com> writes:
> =

> > Hi Ying,
> >
> >> -----Original Message-----
> >> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> >> Sent: Monday, December 28, 2015 9:40 AM
> >> To: Chao Yu
> >> Cc: lkp(a)01.org; LKML; Jaegeuk Kim
> >> Subject: [lkp] [f2fs] 75cd4e098d: xfstests.generic.042.fail
> >>
> >> FYI, we noticed the below changes on
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
> >> commit 75cd4e098d178433436abce08146a21647bb4585 ("f2fs: support FALLOC=
_FL_ZERO_RANGE")
> >>
> >> We found after your commit, the xfstests test case 009/042 failed.
> >
> > Thank you for the report, 042 is a known issue, IIRC, the reason is f2fs
> > will flush inode page with last i_size in ioctl(F2FS_IOC_SHUTDOWN, 0x01=
),
> > but 042 expects an zero-sized inode. So I supposed it happened due to t=
he
> > different semantics of metadata flushing between f2fs and xfs.
> >
> > For 009, I haven't saw it failed for long time, did you test with last =
f2fs?
> =

> We tested the specified commit,

Alright, I will have a look at 009 testcase to make sure whether it is
an unfixed issue?

so you mean the latest f2fs-tools?

I mean last f2fs kernel code.

Thanks,

> =

> Best Regards,
> Huang, Ying
> =

> > Thanks,
> >
> >>
> >>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> compiler/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
> >>
> >>
> gcc-4.9/4HDD/f2fs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/vm-kbuild-4G/g=
eneric-quick/xfst
> >> ests
> >>
> >> commit:
> >>   b4ace33703243fed56f8bfc80a001533acb9decb
> >>   75cd4e098d178433436abce08146a21647bb4585
> >>
> >> b4ace33703243fed 75cd4e098d178433436abce081
> >> ---------------- --------------------------
> >>        fail:runs  %reproduction    fail:runs
> >>            |             |             |
> >>            :18          94%          17:18    xfstests.generic.009.fail
> >>            :18          94%          17:18    xfstests.generic.042.fail
> >>
> >>
> >> To reproduce:
> >>
> >>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lk=
p-tests.git
> >>         cd lkp-tests
> >>         bin/lkp install job.yaml  # job file is attached in this email
> >>         bin/lkp run     job.yaml
> >>
> >>
> >>
> >> Thanks,
> >> Ying Huang
> >
> > _______________________________________________
> > LKP mailing list
> > LKP(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/lkp


--===============2061955527313358786==--


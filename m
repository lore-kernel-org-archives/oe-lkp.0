Content-Type: multipart/mixed; boundary="===============8782272402955247623=="
MIME-Version: 1.0
From: Chao Yu <chao2.yu@samsung.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] 9f88450ff1: stderr.mount:wrong_fs_type, bad_option, bad_superblock_on/dev/sda3
Date: Mon, 14 Dec 2015 15:57:38 +0800
Message-ID: <005401d13645$330f2950$992d7bf0$@samsung.com>
In-Reply-To: <877fkhechk.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8782272402955247623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying Huang,

> -----Original Message-----
> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> Sent: Monday, December 14, 2015 3:06 PM
> To: Chao Yu
> Cc: lkp(a)01.org; LKML; 0day robot
> Subject: [lkp] [f2fs] 9f88450ff1:
> stderr.mount:wrong_fs_type,bad_option,bad_superblock_on/dev/sda3
> =

> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux
> Chao-Yu/f2fs-clean-up-node-page-updating-flow/20151211-161235
> commit 9f88450ff18d8bd577ff431318f7ae00034465c0 ("f2fs: do more integrity=
 verification for
> superblock")
> =

> =

> After your commit, our mounting f2fs partition operations will fail with
> following error message.  But I have no dmesg now.  Do you need it?

Thanks for the report! Could you please share dmesg and some info (e.g. siz=
e..)
about storage device '/dev/sda3'.

Thanks,

> =

> mount: wrong fs type, bad option, bad superblock on /dev/sda3,
>        missing codepage or helper program, or other error
> =

>        In some cases useful info is found in syslog - try
>        dmesg | tail or so.
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


--===============8782272402955247623==--


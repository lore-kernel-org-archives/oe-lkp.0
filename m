Content-Type: multipart/mixed; boundary="===============6883165717558122903=="
MIME-Version: 1.0
From: Chao Yu <chao2.yu@samsung.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] 9f88450ff1: stderr.mount:wrong_fs_type, bad_option, bad_superblock_on/dev/sda3
Date: Tue, 15 Dec 2015 13:53:20 +0800
Message-ID: <00ff01d136fd$0056a840$0103f8c0$@samsung.com>
In-Reply-To: <87zixcpd8w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6883165717558122903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying Huang,

> -----Original Message-----
> From: Huang, Ying [mailto:ying.huang(a)linux.intel.com]
> Sent: Tuesday, December 15, 2015 12:06 PM
> To: Chao Yu
> Cc: lkp(a)01.org; 'LKML'; '0day robot'
> Subject: Re: [lkp] [f2fs] 9f88450ff1:
> stderr.mount:wrong_fs_type,bad_option,bad_superblock_on/dev/sda3
> =

> Chao Yu <chao2.yu@samsung.com> writes:
> =

> > Hi Ying Huang,
> >
> >> -----Original Message-----
> >> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> >> Sent: Monday, December 14, 2015 3:06 PM
> >> To: Chao Yu
> >> Cc: lkp(a)01.org; LKML; 0day robot
> >> Subject: [lkp] [f2fs] 9f88450ff1:
> >> stderr.mount:wrong_fs_type,bad_option,bad_superblock_on/dev/sda3
> >>
> >> FYI, we noticed the below changes on
> >>
> >> https://github.com/0day-ci/linux
> >> Chao-Yu/f2fs-clean-up-node-page-updating-flow/20151211-161235
> >> commit 9f88450ff18d8bd577ff431318f7ae00034465c0 ("f2fs: do more integr=
ity verification for
> >> superblock")
> >>
> >>
> >> After your commit, our mounting f2fs partition operations will fail wi=
th
> >> following error message.  But I have no dmesg now.  Do you need it?
> >
> > Thanks for the report! Could you please share dmesg and some info (e.g.=
 size..)
> > about storage device '/dev/sda3'.
> >
> =

> The dmesg is attached.

Thanks very much for your help. :) I have already fixed this issue and rese=
nt
v2 patch.

Thanks,

> =

> Best Regards,
> Huang, Ying


--===============6883165717558122903==--


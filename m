Content-Type: multipart/mixed; boundary="===============7124746001193572220=="
MIME-Version: 1.0
From: Steven Noonan <steven@uplinklabs.net>
To: lkp@lists.01.org
Subject: Re: [compiler/gcc4] a9f180345f5: -100.0% last_state.is_incomplete_run
Date: Thu, 02 Oct 2014 17:46:34 -0700
Message-ID: <CAKbGBLhyXOdy9cbyabDRf0RQEinzz5nqqhh7FVfrs9sWDTmu0A@mail.gmail.com>
In-Reply-To: <20140930081412.GF9561@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7124746001193572220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 1:14 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Steven,
>
> FYI, we noticed that your commit a9f180345f5378ac87d80ed0bea55ba421d83859
> ("compiler/gcc4: Make quirk for asm_volatile_goto() unconditional") fixed
> a number of machine boot failures in our LKP test farm. This is really he=
lpful!
> Our gcc version is 4.9.1 (Debian 4.9.1-11).

Hey cool, that's good news!

I rather wish we could find the root cause of the miscompiles, though,
so we could conditionalize the quirk on something again. I'm terrible
at debugging GCC behavior, though, so I'm not the right person for it.

- Steven

>
> 569d6557ab957d6  a9f180345f5378ac87d80ed0b
> ---------------  -------------------------
>      %stddev        %change               %stddev
>             \          |                 /
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5=
m-11HDD-RAID5-cfq-btrfs-100dd
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.kernel_=
BUG_at_fs/nfs/pagelist.c
>
> 569d6557ab957d6  a9f180345f5378ac87d80ed0b
> ---------------  -------------------------
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5=
m-11HDD-RAID5-cfq-btrfs-100dd
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.Kernel_=
panic-not_syncing:Fatal_exception
>
> 569d6557ab957d6  a9f180345f5378ac87d80ed0b
> ---------------  -------------------------
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5=
m-11HDD-RAID5-cfq-btrfs-100dd
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.invalid=
_opcode
>
> 569d6557ab957d6  a9f180345f5378ac87d80ed0b
> ---------------  -------------------------
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb42/will-it-scale=
/futex4
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-1t-=
1HDD-xfs-4M-60G-NoSync
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-64t=
-1BRD_48G-btrfs-4M-40G-fsyncBeforeClose
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-bdw01/blogbench=
/1SSD-btrfs
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-hsw01/vm-scalab=
ility/300s-anon-rx-rand-mt
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-s=
cale/futex3
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-s=
cale/page_fault3
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5=
m-11HDD-RAID5-cfq-btrfs-100dd
>          8 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL last_state.is=
_incomplete_run
>
> 569d6557ab957d6  a9f180345f5378ac87d80ed0b
> ---------------  -------------------------
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb42/will-it-scale=
/futex4
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-1t-=
1HDD-xfs-4M-60G-NoSync
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-64t=
-1BRD_48G-btrfs-4M-40G-fsyncBeforeClose
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-bdw01/blogbench=
/1SSD-btrfs
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-hsw01/vm-scalab=
ility/300s-anon-rx-rand-mt
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-s=
cale/futex3
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-s=
cale/page_fault3
>          1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5=
m-11HDD-RAID5-cfq-btrfs-100dd
>          8 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL last_state.bo=
oting
>
> Thanks,
> Fengguang

--===============7124746001193572220==--


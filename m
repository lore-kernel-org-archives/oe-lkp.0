Content-Type: multipart/mixed; boundary="===============1213074709426446725=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [compiler/gcc4] a9f180345f5: -100.0% last_state.is_incomplete_run
Date: Tue, 30 Sep 2014 16:14:12 +0800
Message-ID: <20140930081412.GF9561@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1213074709426446725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Steven,

FYI, we noticed that your commit a9f180345f5378ac87d80ed0bea55ba421d83859
("compiler/gcc4: Make quirk for asm_volatile_goto() unconditional") fixed
a number of machine boot failures in our LKP test farm. This is really help=
ful!
Our gcc version is 4.9.1 (Debian 4.9.1-11).

569d6557ab957d6  a9f180345f5378ac87d80ed0b
---------------  -------------------------
     %stddev        %change               %stddev
            \          |                 /
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5m-=
11HDD-RAID5-cfq-btrfs-100dd
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.kernel_BU=
G_at_fs/nfs/pagelist.c

569d6557ab957d6  a9f180345f5378ac87d80ed0b
---------------  -------------------------
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5m-=
11HDD-RAID5-cfq-btrfs-100dd
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.Kernel_pa=
nic-not_syncing:Fatal_exception

569d6557ab957d6  a9f180345f5378ac87d80ed0b
---------------  -------------------------
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5m-=
11HDD-RAID5-cfq-btrfs-100dd
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL dmesg.invalid_o=
pcode

569d6557ab957d6  a9f180345f5378ac87d80ed0b
---------------  -------------------------
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb42/will-it-scale/f=
utex4
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-1t-1H=
DD-xfs-4M-60G-NoSync
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-64t-1=
BRD_48G-btrfs-4M-40G-fsyncBeforeClose
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-bdw01/blogbench/1=
SSD-btrfs
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-hsw01/vm-scalabil=
ity/300s-anon-rx-rand-mt
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-sca=
le/futex3
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-sca=
le/page_fault3
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5m-=
11HDD-RAID5-cfq-btrfs-100dd
         8 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL last_state.is_i=
ncomplete_run

569d6557ab957d6  a9f180345f5378ac87d80ed0b
---------------  -------------------------
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb42/will-it-scale/f=
utex4
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-1t-1H=
DD-xfs-4M-60G-NoSync
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  ivb44/fsmark/1x-64t-1=
BRD_48G-btrfs-4M-40G-fsyncBeforeClose
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-bdw01/blogbench/1=
SSD-btrfs
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-hsw01/vm-scalabil=
ity/300s-anon-rx-rand-mt
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-sca=
le/futex3
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-sbx04/will-it-sca=
le/page_fault3
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/5m-=
11HDD-RAID5-cfq-btrfs-100dd
         8 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL last_state.boot=
ing

Thanks,
Fengguang

--===============1213074709426446725==--


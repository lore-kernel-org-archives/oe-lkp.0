Content-Type: multipart/mixed; boundary="===============2987732267651176308=="
MIME-Version: 1.0
From: Bruno Goncalves <bgoncalv@redhat.com>
To: lkp@lists.01.org
Subject: Re: [fs] 37da949345: xfstests.generic.374.fail
Date: Tue, 29 Mar 2022 12:26:43 +0200
Message-ID: <CA+QYu4osuzA+V5Th29SOsS1FnAZgdsaTc_qNPyPp=GH+q1LZYQ@mail.gmail.com>
In-Reply-To: <20220311032233.GD18612@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2987732267651176308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 4:23 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 37da9493451c35886a11bfe45d62adc27d9c46b3 ("fs: allow cross-vfsmou=
nt reflink/dedupe")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: xfstests
> version: xfstests-x86_64-1de1db8-1_20220217
> with following parameters:
>
>         disk: 4HDD
>         fs: btrfs
>         test: generic-group-18
>         ucode: 0xec
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz with=
 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
> 2022-03-10 14:43:23 export TEST_DIR=3D/fs/sda1
> 2022-03-10 14:43:23 export TEST_DEV=3D/dev/sda1
> 2022-03-10 14:43:23 export FSTYP=3Dbtrfs
> 2022-03-10 14:43:23 export SCRATCH_MNT=3D/fs/scratch
> 2022-03-10 14:43:23 mkdir /fs/scratch -p
> 2022-03-10 14:43:23 export SCRATCH_DEV_POOL=3D"/dev/sda2 /dev/sda3 /dev/s=
da4"
> 2022-03-10 14:43:23 sed "s:^:generic/:" //lkp/benchmarks/xfstests/tests/g=
eneric-group-18
> 2022-03-10 14:43:23 ./check generic/360 generic/361 generic/362 generic/3=
63 generic/364 generic/365 generic/366 generic/367 generic/368 generic/369 =
generic/370 generic/371 generic/372 generic/373 generic/374 generic/375 gen=
eric/376 generic/377 generic/378 generic/379
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 lkp-skl-d06 5.17.0-rc7-00085-g37da9493451c =
#1 SMP Thu Mar 10 21:42:40 CST 2022
> MKFS_OPTIONS  -- /dev/sda2
> MOUNT_OPTIONS -- /dev/sda2 /fs/scratch
>
> generic/360      1s
> generic/361      12s
> generic/362     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/363     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/364     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/365     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/366     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/367     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/368     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/369     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/370     [not run] this test requires richacl support on $SCRATCH_=
DEV
> generic/371      68s
> generic/372     [not run] Explicit SHARED flag reporting not support by f=
ilesystem type: btrfs
> generic/373     - output mismatch (see /lkp/benchmarks/xfstests/results//=
generic/373.out.bad)
>     --- tests/generic/373.out   2022-02-17 11:55:00.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/373.out.bad   2022-03-1=
0 14:44:54.201679653 +0000
>     @@ -3,7 +3,6 @@
>      Mount otherdir
>      Create file
>      Reflink one file to another
>     -cp: failed to clone 'OTHER_DIR/test-373/otherfiles' from 'SCRATCH_MN=
T/test-373/file': Invalid cross-device link
>      Check output
>      2d61aa54b58c2e94403fb092c3dbc027  SCRATCH_MNT/test-373/file
>      Unmount otherdir
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/373.out /lkp/ben=
chmarks/xfstests/results//generic/373.out.bad'  to see the entire diff)
> generic/374     - output mismatch (see /lkp/benchmarks/xfstests/results//=
generic/374.out.bad)
>     --- tests/generic/374.out   2022-02-17 11:55:00.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/374.out.bad   2022-03-1=
0 14:44:55.890679630 +0000
>     @@ -3,7 +3,8 @@
>      Mount otherdir
>      Create file
>      Dedupe one file to another
>     -XFS_IOC_FILE_EXTENT_SAME: Invalid cross-device link
>     +deduped 65536/65536 bytes at offset 0
>     +64 KiB, 1 ops; 0.0018 sec (33.967 MiB/sec and 543.4783 ops/sec)
>      Check output
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/374.out /lkp/ben=
chmarks/xfstests/results//generic/374.out.bad'  to see the entire diff)
> generic/375      1s
> generic/376      2s
> generic/377      1s
> generic/378      1s
> generic/379     [not run] disk quotas not supported by this filesystem ty=
pe: btrfs
> Ran: generic/360 generic/361 generic/362 generic/363 generic/364 generic/=
365 generic/366 generic/367 generic/368 generic/369 generic/370 generic/371=
 generic/372 generic/373 generic/374 generic/375 generic/376 generic/377 ge=
neric/378 generic/379
> Not run: generic/362 generic/363 generic/364 generic/365 generic/366 gene=
ric/367 generic/368 generic/369 generic/370 generic/372 generic/379
> Failures: generic/373 generic/374
> Failed 2 of 20 tests
>
>

We are also able to reproduce this on mainline kernel with gcc12, the
problem seems to have been introduced by [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D5191290407668028179f2544a11ae9b57f0bcf07

Bruno
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0-DAY CI Kernel Test Service
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>
> Thanks,
> Oliver Sang
>

--===============2987732267651176308==--


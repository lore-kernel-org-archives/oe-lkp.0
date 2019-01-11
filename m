Content-Type: multipart/mixed; boundary="===============7057536681996885477=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.de>
To: lkp@lists.01.org
Subject: Re: [btrfs] 05a37c4860: kmsg.BTRFS_error(device_vdd):failed_to_verify_dev_extents_against_chunks
Date: Fri, 11 Jan 2019 22:39:45 +0800
Message-ID: <819023c9-a7f1-44be-6e8d-5525eb6b0fc9@suse.de>
In-Reply-To: <20190111140312.GM17624@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7057536681996885477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2019/1/11 =E4=B8=8B=E5=8D=8810:03, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 05a37c48604c19b50873fd9663f9140c150469d1 ("btrfs: volumes: Make s=
ure no dev extent is beyond device boundary")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-group1
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

For the LKP tests, would you please not bind all fstests test cases into
one LKP test case?

That's pretty hard for us to locate the problem. not to mention there
will be tons of generic tests, and new tests could easily screw up your
existing result.

It will make more sense to generate test cases based on
fstests/tests/btrfs/group, and save their result for each fstests test case.

> =

> =

> =

> =

> 2019-01-09 07:40:26 export TEST_DIR=3D/fs/vda
> 2019-01-09 07:40:26 export TEST_DEV=3D/dev/vda
> 2019-01-09 07:40:26 export FSTYP=3Dbtrfs
> 2019-01-09 07:40:26 export SCRATCH_MNT=3D/fs/scratch
> 2019-01-09 07:40:26 mkdir /fs/scratch -p
> 2019-01-09 07:40:26 export SCRATCH_DEV_POOL=3D"/dev/vdb /dev/vdc /dev/vdd=
 /dev/vde /dev/vdf"
> 2019-01-09 07:40:26 sed "s:^:btrfs/:" /lkp/lkp/src/pack/xfstests-addon/te=
sts/btrfs-group1 | grep -F -f merged_ignored_files
> ignored by lkp: btrfs/145
> ignored by lkp: btrfs/147
> ignored by lkp: btrfs/149
> ignored by lkp: btrfs/153
> ignored by lkp: btrfs/155
> 2019-01-09 07:40:26 sed "s:^:btrfs/:" /lkp/lkp/src/pack/xfstests-addon/te=
sts/btrfs-group1 | grep -v -F -f merged_ignored_files
> 2019-01-09 07:40:26 ./check btrfs/010 btrfs/026 btrfs/027 btrfs/028 btrfs=
/116 btrfs/117 btrfs/118 btrfs/119 btrfs/120 btrfs/121 btrfs/122 btrfs/123 =
btrfs/124 btrfs/125 btrfs/126 btrfs/127 btrfs/128 btrfs/129 btrfs/131 btrfs=
/132 btrfs/133 btrfs/134 btrfs/135 btrfs/136 btrfs/137 btrfs/138 btrfs/139 =
btrfs/140 btrfs/141 btrfs/142 btrfs/143 btrfs/144 btrfs/146 btrfs/148 btrfs=
/150 btrfs/151 btrfs/152 btrfs/154 btrfs/156 btrfs/157 btrfs/158 btrfs/159 =
btrfs/160 btrfs/161 btrfs/162 btrfs/163 btrfs/164 btrfs/165 btrfs/166 btrfs=
/167 btrfs/168 btrfs/169 btrfs/170 btrfs/171
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 vm-snb-4G-105 4.20.0-rc7-00010-g05a37c4
> MKFS_OPTIONS  -- /dev/vdb
> MOUNT_OPTIONS -- /dev/vdb /fs/scratch
> =

> btrfs/010	 157s
> btrfs/026	 4s
> btrfs/027	 7s
> btrfs/028	 31s
> btrfs/116	[not run] FITRIM not supported on /fs/scratch
> btrfs/117	 6s
> btrfs/118	 1s
> btrfs/119	 1s
> btrfs/120	 1s
> btrfs/121	 1s
> btrfs/122	 8s
> btrfs/123	 2s
> btrfs/124	 25s
> btrfs/125	 15s
> btrfs/126	 0s
> btrfs/127	 1s
> btrfs/128	 0s
> btrfs/129	 1s
> btrfs/131	 1s
> btrfs/132	 32s
> btrfs/133	 2s
> btrfs/134	 1s
> btrfs/135	 1s
> btrfs/136	 91s
> btrfs/137	 0s
> btrfs/138	 80s
> btrfs/139	- output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/=
139.out.bad)
>     --- tests/btrfs/139.out	2018-09-19 20:13:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//btrfs/139.out.bad	2019-01-09 07=
:48:30.619000000 +0000
>     @@ -1,4 +1,616 @@
>      QA output created by 139
>     +pwrite: Disk quota exceeded
>     +/fs/scratch/subvol/file_26: Disk quota exceeded
>     +/fs/scratch/subvol/file_27: Disk quota exceeded
>     +/fs/scratch/subvol/file_28: Disk quota exceeded
>     +/fs/scratch/subvol/file_29: Disk quota exceeded
>     +/fs/scratch/subvol/file_30: Disk quota exceeded

That's a known regression, it's recommended to blacklist this test case.
We know the cause, but find it pretty tricky to fix.

>     ...
>     (Run 'diff -u tests/btrfs/139.out /lkp/benchmarks/xfstests/results//b=
trfs/139.out.bad'  to see the entire diff)
> btrfs/140	 6s
> btrfs/141	 1s
> btrfs/142	 0s
> btrfs/143	 2s
> btrfs/144	 1s
> btrfs/146	 1s
> btrfs/148	 1s
> btrfs/150	 0s
> btrfs/151	 3s
> btrfs/152	 3s
> btrfs/154	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/x=
fstests/results//btrfs/154.out.bad)
>     --- tests/btrfs/154.out	2018-09-19 20:13:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//btrfs/154.out.bad	2019-01-09 07=
:48:51.928000000 +0000
>     @@ -6,5 +6,5 @@
>      scan missing dev and write
>      =

>      run balance
>     -
>     -mount reconstructed dev only and check md5sum
>     +failed: '/bin/btrfs balance start --full-balance -dconvert=3Draid1 -=
mconvert=3Draid1 /fs/scratch'
>     +(see /lkp/benchmarks/xfstests/results//btrfs/154.full for details)
>     ...
>     (Run 'diff -u tests/btrfs/154.out /lkp/benchmarks/xfstests/results//b=
trfs/154.out.bad'  to see the entire diff)
> btrfs/156	[not run] FITRIM not supported on /fs/scratch
> btrfs/157	 1s
> btrfs/158	 0s
> btrfs/159	 10s
> btrfs/160	 1s
> btrfs/161	 0s
> btrfs/162	 1s
> btrfs/163	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/x=
fstests/results//btrfs/163.out.bad)
>     --- tests/btrfs/163.out	2018-09-19 20:13:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//btrfs/163.out.bad	2019-01-09 07=
:49:07.384000000 +0000
>     @@ -3,7 +3,5 @@
>      0000000 abab abab abab abab abab abab abab abab
>      *
>      1000000
>     --- sprout --
>     -0000000 abab abab abab abab abab abab abab abab
>     -*
>     -1000000
>     ...
>     (Run 'diff -u tests/btrfs/163.out /lkp/benchmarks/xfstests/results//b=
trfs/163.out.bad'  to see the entire diff)

This error is already fixed by patch "btrfs: Use real device structure
to verify dev extent".

Maintainer has merged that patch, so it would be fixed in v5.0-rcs.

Thanks,
Qu

> btrfs/164	 1s
> btrfs/165	 1s
> btrfs/166	 0s
> btrfs/167	 1s
> btrfs/168	 1s
> btrfs/169	 0s
> btrfs/170	 1s
> btrfs/171	 0s
> Ran: btrfs/010 btrfs/026 btrfs/027 btrfs/028 btrfs/116 btrfs/117 btrfs/11=
8 btrfs/119 btrfs/120 btrfs/121 btrfs/122 btrfs/123 btrfs/124 btrfs/125 btr=
fs/126 btrfs/127 btrfs/128 btrfs/129 btrfs/131 btrfs/132 btrfs/133 btrfs/13=
4 btrfs/135 btrfs/136 btrfs/137 btrfs/138 btrfs/139 btrfs/140 btrfs/141 btr=
fs/142 btrfs/143 btrfs/144 btrfs/146 btrfs/148 btrfs/150 btrfs/151 btrfs/15=
2 btrfs/154 btrfs/156 btrfs/157 btrfs/158 btrfs/159 btrfs/160 btrfs/161 btr=
fs/162 btrfs/163 btrfs/164 btrfs/165 btrfs/166 btrfs/167 btrfs/168 btrfs/16=
9 btrfs/170 btrfs/171
> Not run: btrfs/116 btrfs/156
> Failures: btrfs/139 btrfs/154 btrfs/163
> Failed 3 of 54 tests
> =

> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

> =

> =

> Thanks,
> Rong Chen
> =



--===============7057536681996885477==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVMZDl5NWFXbFc2
aWRxa0xod2oyUjg2RWwvcWdGQWx3NHFyRUFDZ2tRd2oyUjg2RWwKL3FoVnpBZi9ZNWkyK1Q3MHp0
dmhWYzhqNWpFd0hzN2RFTUQ2emxoT3gySW5uZnllOWFrWGUzSVFSUEcybnJlQwpzR1o1UnVMOXgy
N1FJYTN0NWVsMjlUUlZiRjJoN0ovZUNKSkZSYWwvajlqb09jL240bG0wNzMvSmxLbFN2bmJjCmVB
VGNnTmg5ZUtGcFJ5RmNpK2dqWDdBYTh4Q0JNVU1RMHpXVE16ODZyQVNuTFhHMmUvWStmdGtOT2Uw
cUI3VjMKYkVodWZXSHBxUVpNRzAzeEZTOEYweFdlU040bjFUUGJOeE8vVGNrajVQWUhlekFITnVt
K0I3NnoxY0Flb2FnMgpzaUJLWnoxSXBUOWRuaTYrdTFaTDg1d3htR1p5KzMzZUI5QkM4K0o0M2dO
YWVCMnB6NkFOdVFNOXFIaTJlaGJJCnRRRC9oWlVGNTJycDAzMHZXQXo4Y091b1l4OXZIQT09Cj14
UTdlCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7057536681996885477==--


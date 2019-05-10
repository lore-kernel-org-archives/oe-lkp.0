Content-Type: multipart/mixed; boundary="===============1603428161393575318=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.de>
To: lkp@lists.01.org
Subject: Re: [btrfs] ddf30cf03f: xfstests.generic.102.fail
Date: Fri, 10 May 2019 12:04:08 +0800
Message-ID: <05989d59-fa43-24f2-fd47-6099ec9273bd@suse.de>
In-Reply-To: <20190510031904.GC31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1603428161393575318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2019/5/10 =E4=B8=8A=E5=8D=8811:19, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: ddf30cf03fb53b9a0ad0f355a69dbedf416edde9 ("btrfs: extent-tree: Us=
e btrfs_ref to refactor add_pinned_bytes()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Thanks for the info.

This explains why I have some unexpected ENOSPC error.
The cause is pretty aweful.

The offending patch relies completely btrfs_ref, but forgot that pinned
bytes can be minus, thus causing strange behavior.

I'll fix it soon.

Thanks for reporting again,
Qu

> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: btrfs
> 	test: generic-quick2
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
> =

> =

> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 vm-snb-4G-727 5.1.0-rc7-00188-gddf30cf
> MKFS_OPTIONS  -- /dev/vdb
> MOUNT_OPTIONS -- /dev/vdb /fs/scratch
> =

> generic/088 2s
> generic/089 14s
> generic/090 1s
> generic/091 19s
> generic/092 3s
> generic/098 4s
> generic/100 18s
> generic/101 0s
> generic/102- output mismatch (see /lkp/benchmarks/xfstests/results//gener=
ic/102.out.bad)
>     --- tests/generic/102.out2019-05-09 15:46:08.000000000 +0800
>     +++ /lkp/benchmarks/xfstests/results//generic/102.out.bad2019-05-10 0=
9:32:39.267250059 +0800
>     @@ -1,21 +1,21 @@
>      QA output created by 102
>      wrote 838860800/838860800 bytes at offset 0
>      XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>     -wrote 838860800/838860800 bytes at offset 0
>     +wrote 109576192/838860800 bytes at offset 0
>      XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>      wrote 838860800/838860800 bytes at offset 0
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/102.out /lkp/ben=
chmarks/xfstests/results//generic/102.out.bad'  to see the entire diff)
> generic/103 1s
> generic/104 1s
> generic/105 0s
> generic/106 1s
> generic/107 1s
> generic/109 1s
> generic/120 16s
> generic/123  1s
> generic/124  4s
> generic/126  1s
> generic/129  6s
> generic/130 13s
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.1.0-rc7-00188-gddf30cf .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 	bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is atta=
ched in this email
> =

> =

> =

> =

> Thanks,
> Rong Chen
>=20

--===============1603428161393575318==--


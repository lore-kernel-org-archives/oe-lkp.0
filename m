Content-Type: multipart/mixed; boundary="===============3238892038761320794=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 618b4d07a4: xfstests.generic.484.fail
Date: Tue, 17 Mar 2020 15:41:26 +0800
Message-ID: <531bbf4b-221c-5d42-e04f-6b15b6d27e35@intel.com>
In-Reply-To: <1584368247.14250.17.camel@mtksdccf07>
List-Id: <oe-lkp.lists.linux.dev>

--===============3238892038761320794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/16/2020 10:17 PM, Stanley Chu wrote:
> Hi,
>
> On Mon, 2020-03-16 at 21:41 +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 618b4d07a4420ca9f01837f183ce7b1ac0b31307 ("scsi: ufs: ufs-mediat=
ek: fix TX LCC disabling timing")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
> The modified file in above commit is /drivers/scsi/ufs/ufs-mediatek.c
> which shall not be built according to the kernel configuration used by
> the robot.
>
> Could this possibly be a false alarm?
>
> Thanks,
> Stanley Chu

Hi Stanley,

Sorry for the inconvenience, it's a false positive, the =

xfstests.generic.484 test
didn't run successfully in the parent commit.

Best Regards,
Rong Chen


>
>
>> in testcase: xfstests
>> with following parameters:
>>
>> 	disk: 4HDD
>> 	fs: xfs
>> 	test: generic-group11
>>
>> test-description: xfstests is a regression test suite for xfs and other =
files ystems.
>> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>> 2020-03-16 18:33:34 export TEST_DIR=3D/fs/vda
>> 2020-03-16 18:33:34 export TEST_DEV=3D/dev/vda
>> 2020-03-16 18:33:34 export FSTYP=3Dxfs
>> 2020-03-16 18:33:34 export SCRATCH_MNT=3D/fs/scratch
>> 2020-03-16 18:33:34 mkdir /fs/scratch -p
>> 2020-03-16 18:33:34 export SCRATCH_DEV=3D/dev/vdd
>> 2020-03-16 18:33:34 export SCRATCH_LOGDEV=3D/dev/vdb
>> meta-data=3D/dev/vda               isize=3D512    agcount=3D4, agsize=3D=
16777216 blks
>>           =3D                       sectsz=3D512   attr=3D2, projid32bit=
=3D1
>>           =3D                       crc=3D1        finobt=3D1, sparse=3D=
0, rmapbt=3D0, reflink=3D1
>> data     =3D                       bsize=3D4096   blocks=3D67108864, ima=
xpct=3D25
>>           =3D                       sunit=3D0      swidth=3D0 blks
>> naming   =3Dversion 2              bsize=3D4096   ascii-ci=3D0 ftype=3D1
>> log      =3Dinternal log           bsize=3D4096   blocks=3D32768, versio=
n=3D2
>>           =3D                       sectsz=3D512   sunit=3D0 blks, lazy-=
count=3D1
>> realtime =3Dnone                   extsz=3D4096   blocks=3D0, rtextents=
=3D0
>> 2020-03-16 18:33:35 export MKFS_OPTIONS=3D-mreflink=3D1
>> 2020-03-16 18:33:35 sed "s:^:generic/:" //lkp/benchmarks/xfstests/tests/=
generic-group11
>> 2020-03-16 18:33:35 ./check generic/015 generic/056 generic/092 generic/=
124 generic/160 generic/192 generic/222 generic/254 generic/287 generic/319=
 generic/350 generic/381 generic/416 generic/446 generic/484 generic/519 ge=
neric/550 generic/580
>> FSTYP         -- xfs (debug)
>> PLATFORM      -- Linux/x86_64 vm-snb-15 5.6.0-rc1-00021-g618b4d07a4420 #=
1 SMP Mon Mar 16 17:42:08 CST 2020
>> MKFS_OPTIONS  -- -f -mreflink=3D1 /dev/vdd
>> MOUNT_OPTIONS -- /dev/vdd /fs/scratch
>>
>> generic/015	 2s
>> generic/056	 3s
>> generic/092	 2s
>> generic/124	 5s
>> generic/160	 2s
>> generic/192	 7s
>> generic/222	 5s
>> generic/254	 4s
>> generic/287	 4s
>> generic/319	 2s
>> generic/350	 2s
>> generic/381	 2s
>> generic/416	 157s
>> generic/446	 9s
>> generic/484	- output mismatch (see /lkp/benchmarks/xfstests/results//gen=
eric/484.out.bad)
>>      --- tests/generic/484.out	2020-03-05 16:38:54.000000000 +0800
>>      +++ /lkp/benchmarks/xfstests/results//generic/484.out.bad	2020-03-1=
6 18:37:07.484545261 +0800
>>      @@ -1,2 +1,3 @@
>>       QA output created by 484
>>      +record lock is not preserved across execve(2)
>>       Silence is golden
>>      ...
>>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/484.out /lkp/b=
enchmarks/xfstests/results//generic/484.out.bad'  to see the entire diff)
>> generic/519	 2s
>> generic/550	[not run] xfs_io set_encpolicy  support is missing
>> generic/580	[not run] xfs_io set_encpolicy  support is missing
>> Ran: generic/015 generic/056 generic/092 generic/124 generic/160 generic=
/192 generic/222 generic/254 generic/287 generic/319 generic/350 generic/38=
1 generic/416 generic/446 generic/484 generic/519 generic/550 generic/580
>> Not run: generic/550 generic/580
>> Failures: generic/484
>> Failed 1 of 18 tests
>>
>>
>>
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.6.0-rc1-00021-g618b4d07a4420 .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare modul=
es_prepare bzImage modules
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-in=
stall-dir> modules_install
>> 	cd <mod-install-dir>
>> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>>
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scrip=
t is attached in this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>

--===============3238892038761320794==--


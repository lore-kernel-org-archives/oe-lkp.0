Content-Type: multipart/mixed; boundary="===============6837001970399968103=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: 4f4fd7c579: mdadm-selftests.10ddf-fail-two-spares.fail
Date: Fri, 12 Apr 2019 05:51:01 +0000
Message-ID: <09AFFAAC-F1D8-4854-9120-BE9DEFBBD89E@fb.com>
In-Reply-To: <20190412023814.GI17122@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6837001970399968103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Apr 11, 2019, at 7:38 PM, kernel test robot <rong.a.chen@intel.com> =
wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 4f4fd7c5798bbdd5a03a60f6269cf1177fbd11ef ("Don't jump to compute_=
result state from check_result state")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: mdadm-selftests
> with following parameters:
> =

> 	disk: 1HDD
> 	test_prefix: 10
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 81ba6abd2b | 4f4fd7c5=
79 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 1          | 0       =
   |
> | boot_failures                                   | 3          | 4       =
   |
> | BUG:kernel_reboot-without-warning_in_test_stage | 3          | 4       =
   |
> | mdadm-selftests.10ddf-fail-two-spares.fail      | 0          | 4       =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> [  165.841336 ] Testing on linux-5.1.0-rc3-00023-g4f4fd7c kernel
> [  165.841339 ]
> [  167.302289 ] md/raid:md126: not clean -- starting background reconstru=
ction
> [  167.304321 ] md/raid:md126: device loop13 operational as raid disk 3
> [  167.306055 ] md/raid:md126: device loop12 operational as raid disk 2
> [  167.308044 ] md/raid:md126: device loop11 operational as raid disk 1
> [  167.309522 ] md/raid:md126: device loop10 operational as raid disk 0
> [  167.320733 ] md/raid:md126: raid level 6 active with 4 out of 4 device=
s, algorithm 10
> [  167.327158 ] md126: detected capacity change from 0 to 33554432
> [  167.409736 ] md: resync of RAID array md126
> [  167.561148 ] md/raid10:md125: not clean -- starting background reconst=
ruction
> [  167.563142 ] md/raid10:md125: active with 4 out of 4 devices
> [  167.568822 ] md125: detected capacity change from 0 to 33554432
> [  167.588867 ] md: delaying resync of md125 until md126 has finished (th=
ey share one or more physical units)
> [  168.171556 ] md: md126: resync done.
> [  168.202995 ] md: resync of RAID array md125
> [  168.438884 ] md: md125: resync done.
> [  168.998162 ] md/raid10:md125: Disk failure on loop11, disabling device.
> [  168.998162 ] md/raid10:md125: Operation continuing on 3 devices.
> [  169.044560 ] md/raid:md126: Disk failure on loop11, disabling device.
> [  169.044560 ] md/raid:md126: Operation continuing on 3 devices.
> [  169.104982 ] md: recovery of RAID array md125
> [  169.129051 ] md: delaying recovery of md126 until md125 has finished (=
they share one or more physical units)
> [  170.016071 ] md/raid10:md125: Disk failure on loop12, disabling device.
> [  170.016071 ] md/raid10:md125: Operation continuing on 2 devices.
> [  170.031796 ] md/raid:md126: Disk failure on loop12, disabling device.
> [  170.031796 ] md/raid:md126: Operation continuing on 2 devices.
> [  170.123425 ] md: md125: recovery interrupted.
> [  170.127705 ] md: recovery of RAID array md126
> [  170.132003 ] md: delaying recovery of md125 until md126 has finished (=
they share one or more physical units)
> [  177.280292 ] md: md126: recovery done.
> [  177.286369 ] md: recovery of RAID array md125
> [  177.304563 ] md: delaying recovery of md126 until md125 has finished (=
they share one or more physical units)
> [  183.347549 ] md: md125: recovery done.
> [  183.350452 ] md: recovery of RAID array md126
> [  183.368340 ] md: delaying recovery of md125 until md126 has finished (=
they share one or more physical units)
> [  190.512654 ] md: md126: recovery done.
> [  190.519633 ] md: recovery of RAID array md125
> [  197.641803 ] md: md125: recovery done.
> [  198.039343 ] tests/10ddf-fail-two-spares... FAILED - see /var/tmp/log =
for details
> =

> =

> To reproduce:
> =

>        # build kernel
> 	cd linux
> 	cp config-5.1.0-rc3-00023-g4f4fd7c .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
> =

> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 	bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is atta=
ched in this email
> =

> =

> =

> =

> Thanks,
> Rong Chen
> =

> <config-5.1.0-rc3-00023-g4f4fd7c><job-script.txt><dmesg.xz><mdadm-selftes=
ts.txt>

Thanks for the report. We are discussing this patch. We may
revert it. =


Song


--===============6837001970399968103==--


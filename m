Content-Type: multipart/mixed; boundary="===============6572677021832894472=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: [md] e1a86dbbbd: mdadm-selftests.enchmarks/mdadm-selftests/tests/07layouts.fail
Date: Mon, 03 Aug 2020 05:52:02 +0000
Message-ID: <C6E82A56-754C-4FA3-A15B-6A6F80A9457D@fb.com>
In-Reply-To: <20200729090451.GK23458@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6572677021832894472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Jul 29, 2020, at 2:04 AM, kernel test robot <rong.a.chen@intel.com> =
wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: e1a86dbbbd6a77f73c3d099030495fa31f181e2f ("md: fix deadlock causi=
ng by sysfs_notify")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: mdadm-selftests
> with following parameters:
> =

> 	disk: 1HDD
> 	test_prefix: 07layout
> 	ucode: 0x21
> =

> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4=
G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> =

> 2020-07-29 01:06:34 mkdir -p /var/tmp
> 2020-07-29 01:06:34 mke2fs -t ext3 -b 4096 -J size=3D4 -q /dev/sda3
> 2020-07-29 01:07:36 mount -t ext3 /dev/sda3 /var/tmp
> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> -e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
> /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d/=
01-md-raid-creating.rules
> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63=
-md-raid-arrays.rules
> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/=
64-md-raid-assembly.rules
> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/ud=
ev/rules.d/69-md-clustered-confirm-device.rules
> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> Testing on linux-5.8.0-rc4-00129-ge1a86dbbbd6a7 kernel
> /lkp/benchmarks/mdadm-selftests/tests/07layouts... FAILED - see /var/tmp/=
07layouts.log and /var/tmp/fail07layouts.log for details
> 07layouts TIMEOUT
> =

> =

> =

> To reproduce:
> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
> =

> <config-5.8.0-rc4-00129-ge1a86dbbbd6a7><job-script.txt><kmsg.xz><mdadm-se=
lftests.txt><job.yaml><reproduce.txt><07layouts.log>

Hi Junxiao, =


Could you please look into this issue? =


Thanks,
Song

--===============6572677021832894472==--


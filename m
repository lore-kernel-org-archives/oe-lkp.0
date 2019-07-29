Content-Type: multipart/mixed; boundary="===============2547687068159470556=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [compat_ioctl] 97ca70e16d: mdadm-selftests.enchmarks/mdadm-selftests/tests/06name.fail
Date: Mon, 29 Jul 2019 13:48:29 +0200
Message-ID: <CAK8P3a02URMNkQfckV4yY+xERjBetzzmVW9suzvm1B3WE5NkgA@mail.gmail.com>
In-Reply-To: <20190729094708.GO22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2547687068159470556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 11:47 AM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 97ca70e16dc76bad69ad774cf0bd0286c97d63b4 ("compat_ioctl: scsi: mo=
ve ioctl handling into drivers")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/arnd/playground.=
git to-build
>
> in testcase: mdadm-selftests
> with following parameters:
>
>         disk: 1HDD
>         test_prefix: 06
>
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>

Thanks for the detailed report. I don't immediately see where my patch
went wrong,
so I tried to reproduce the steps below, and ran into multiple
problems with the job
script:


1. /osimage/deps/debian-x86_64-2018-04-03.cgz/mdadm-selftests_2019-06-26.cgz
could not be found on the server. I tried replacing it with
mdadm-selftests_2019-04-29.cgz,
which seems to be the latest version on in that directory.

2. -cpu SandyBridge did not work for me, as I'm on an AMD machine.
I used "-cpu host" instead.

3. error "qemu: linux kernel too old to load a ram disk". I tried
leaving out the
  initramfs, knowing that this would finally break things if I still
had a chance of
  reproducing the bug at this point.

4. qemu-system-x86_64: -append root=3D/dev/ram0: Could not open
'user=3Dlkp': No such
   file or directory. No idea. I tried removing this.

5. Could not open
'job=3D/lkp/jobs/scheduled/vm-snb-4G-55ee9590a4b9/mdadm-selftests-1HDD-06-d=
ebian-x86_64-2018-04-03.cgz-97ca70e16dc76ba-20190728-5974-13wd49f-3.yaml':
That directory does not exist,
and I could not find the file elsewhere.

Any suggestions?

        Arnd


> Welcome to fdisk (util-linux 2.29.2).
> Changes will remain in memory only, until you decide to write them.
> Be careful before using the write command.
>
> Device does not contain a recognized partition table.
> Created a new DOS disklabel with disk identifier 0x8b600b10.
>
> Command (m for help): Partition type
>    p   primary (0 primary, 0 extended, 4 free)
>    e   extended (container for logical partitions)
> Select (default p): Partition number (1-4, default 1): First sector (2048=
-536870911, default 2048): Last sector, +sectors or +size{K,M,G,T,P} (2048-=
536870911, default 536870911):
> Created a new partition 1 of type 'Linux' and of size 5 GiB.
>
> Command (m for help): The partition table has been altered.
> Calling ioctl() to re-read partition table.
> Syncing disks.
>
> 2019-07-28 07:22:06 mkdir -p /var/tmp
> 2019-07-28 07:22:06 mke2fs -t ext3 -b 1024 -J size=3D1 -q /dev/vda1
> 2019-07-28 07:22:08 mount -t ext3 /dev/vda1 /var/tmp
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
> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
> /lkp/benchmarks/mdadm-selftests/tests/06name... FAILED - see /var/tmp/06n=
ame.log and /var/tmp/fail06name.log for details
> 06name TIMEOUT
> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
> /lkp/benchmarks/mdadm-selftests/tests/06sysfs... succeeded
> 06sysfs TIMEOUT
> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
> /lkp/benchmarks/mdadm-selftests/tests/06wrmostly... FAILED - see /var/tmp=
/06wrmostly.log and /var/tmp/fail06wrmostly.log for details
> 06wrmostly TIMEOUT
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.3.0-rc1-g97ca70e16dc76b .config
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare=
 modules_prepare bzImage modules
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<=
mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>
>
> Thanks,
> Rong Chen
>

--===============2547687068159470556==--


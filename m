Content-Type: multipart/mixed; boundary="===============4679060066776453876=="
MIME-Version: 1.0
From: Shaohua Li <shli@kernel.org>
To: lkp@lists.01.org
Subject: Re: [MD] d595567dc4: mdadm-selftests.02lineargrow.fail
Date: Sun, 14 Oct 2018 17:14:19 -0700
Message-ID: <20181015001419.GA12053@kernel.org>
In-Reply-To: <20181012085844.GN13396@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4679060066776453876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2018 at 04:58:44PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: d595567dc4f0c1d90685ec1e2e296e2cad2643ac ("MD: fix invalid stored=
 role for a disk")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: mdadm-selftests
> with following parameters:
> =

> 	disk: 1HDD
> 	test_prefix: 02
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> =

> Welcome to fdisk (util-linux 2.29.2).
> Changes will remain in memory only, until you decide to write them.
> Be careful before using the write command.
> =

> Device does not contain a recognized partition table.
> Created a new DOS disklabel with disk identifier 0xd50ae9f0.
> =

> Command (m for help): Partition type
>    p   primary (0 primary, 0 extended, 4 free)
>    e   extended (container for logical partitions)
> Select (default p): Partition number (1-4, default 1): First sector (2048=
-536870911, default 2048): Last sector, +sectors or +size{K,M,G,T,P} (2048-=
536870911, default 536870911): =

> Created a new partition 1 of type 'Linux' and of size 5 GiB.
> =

> Command (m for help): The partition table has been altered.
> Calling ioctl() to re-read partition table.
> Syncing disks.
> =

> 2018-10-12 11:05:55 mkdir -p /var/tmp
> 2018-10-12 11:05:55 mke2fs -t ext3 -b 1024 -J size=3D1 -q /dev/vda1
> 2018-10-12 11:06:00 mount -t ext3 /dev/vda1 /var/tmp
> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> -e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63=
-md-raid-arrays.rules
> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/=
64-md-raid-assembly.rules
> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> Testing on linux-4.19.0-rc5-00182-gd595567 kernel
> tests/02lineargrow... FAILED - see /var/tmp/log for details
> Testing on linux-4.19.0-rc5-00182-gd595567 kernel
> tests/02r1add... succeeded
> Testing on linux-4.19.0-rc5-00182-gd595567 kernel
> tests/02r1grow... succeeded
> Testing on linux-4.19.0-rc5-00182-gd595567 kernel
> tests/02r5grow... succeeded
> Testing on linux-4.19.0-rc5-00182-gd595567 kernel
> tests/02r6grow... succeeded
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 	bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is atta=
ched in this email

Thanks for reporting, I fixed it in md-next tree.

Thanks,
Shaohua

--===============4679060066776453876==--


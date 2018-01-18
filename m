Content-Type: multipart/mixed; boundary="===============7720430211328820093=="
MIME-Version: 1.0
From: Anand Jain <anand.jain@oracle.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] d1f6ad52c3: BTRFS error (device md0): SUPER_FLAG_CHANGING_FSID is set
Date: Thu, 18 Jan 2018 11:34:42 +0800
Message-ID: <e105cef6-6fef-71fb-4736-0ae7f6f916cc@oracle.com>
In-Reply-To: <20180117124559.GB3474@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7720430211328820093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


This seems to have picked up wrong patch for testing, it should use [1],
a set of 3 patches.

[1]
   [PATCH V4 0/3] Add missing flags in the kernel

Thanks, Anand

On 01/17/2018 08:45 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: d1f6ad52c3f93a9da45e11001e0a0be8f3c31e9e ("btrfs: add support for=
 SUPER_FLAG_CHANGING_FSID in btrfs.ko")
> url: https://github.com/0day-ci/linux/commits/Anand-Jain/btrfs-add-missin=
g-BTRFS_SUPER_FLAG-define/20180109-041023
> base: https://git.kernel.org/cgit/linux/kernel/git/mason/linux-btrfs.git =
next
> =

> in testcase: aim7
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID1
> 	fs: btrfs
> 	test: disk_src
> 	load: 500
> 	cpufreq_governor: performance
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> =

> =

> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> [   25.285253] BTRFS error (device md0): SUPER_FLAG_CHANGING_FSID is set
> [   25.285255] BTRFS error (device md0): superblock contains fatal errors
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong
>=20

--===============7720430211328820093==--


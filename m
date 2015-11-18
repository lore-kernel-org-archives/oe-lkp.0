Content-Type: multipart/mixed; boundary="===============0219776868488605031=="
MIME-Version: 1.0
From: Brian Foster <bfoster@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] a45086e27d: -100.0% xfstests.xfs.033.seconds
Date: Wed, 18 Nov 2015 09:31:45 -0500
Message-ID: <20151118143145.GA44298@bfoster.bfoster>
In-Reply-To: <87d1v7aj72.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0219776868488605031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

cc linux-xfs

On Wed, Nov 18, 2015 at 02:57:21PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit a45086e27dfa21a4b39134f7505c8f60a3ecdec4 ("xfs: validate metadata =
LSNs against log on v5 superblocks")
> =

> 2015-11-17 05:11:29 export TEST_DIR=3D/fs/sdd1
> 2015-11-17 05:11:29 export TEST_DEV=3D/dev/sdd1
> 2015-11-17 05:11:29 export FSTYP=3Dxfs
> 2015-11-17 05:11:29 export SCRATCH_MNT=3D/fs/scratch
> 2015-11-17 05:11:29 mkdir /fs/scratch -p
> 2015-11-17 05:11:29 export SCRATCH_DEV=3D/dev/sdg1
> 2015-11-17 05:11:29 export SCRATCH_LOGDEV=3D/dev/sdh1
> 2015-11-17 05:11:29 ./check xfs/004 xfs/010 xfs/011 xfs/013 xfs/017 xfs/0=
20 xfs/026 xfs/027 xfs/028 xfs/031 xfs/032 xfs/033 xfs/041 xfs/042 xfs/046 =
xfs/047 xfs/049 xfs/050 xfs/054 xfs/056 xfs/059 xfs/060 xfs/061 xfs/063 xfs=
/064 xfs/065 xfs/066 xfs/068 xfs/073 xfs/076
> FSTYP         -- xfs (non-debug)
> PLATFORM      -- Linux/x86_64 lkp-ws02 4.3.0-rc2-00002-ga45086e
> MKFS_OPTIONS  -- -f -bsize=3D4096 /dev/sdg1
> MOUNT_OPTIONS -- /dev/sdg1 /fs/scratch
> =

> xfs/004	 3s
> xfs/010	 13s
> xfs/011	 19s
> xfs/013	 318s
> xfs/017	 15s
> xfs/020	 82s
> xfs/026	 14s
> xfs/027	 15s
> xfs/028	 25s
> xfs/031	 58s
> xfs/032	 14s
> xfs/033	 - output mismatch (see /lkp/benchmarks/xfstests/results//xfs/033=
.out.bad)
>     --- tests/xfs/033.out	2015-11-12 16:56:51.000000000 +0800
>     +++ /lkp/benchmarks/xfstests/results//xfs/033.out.bad	2015-11-17 05:2=
1:38.091589526 +0800
>     @@ -38,7 +38,19 @@
>      Phase 7 - verify and correct link counts...
>      resetting inode INO nlinks from 1 to 2
>      done
>     +mount: wrong fs type, bad option, bad superblock on /dev/sdg1,
>     +       missing codepage or helper program, or other error
>     +
>     +       In some cases useful info is found in syslog - try
>     ...
>     (Run 'diff -u tests/xfs/033.out /lkp/benchmarks/xfstests/results//xfs=
/033.out.bad'  to see the entire diff)

I reproduced this running xfs/033 directly on a 4.3.0-rc2+ kernel
(linux-xfs tree) and xfsprogs-3.2.2 from fedora. The problem here is
that the mount complains about an invalid metadata LSN. Via dmesg:

...
XFS (dm-3): Mounting V5 Filesystem
XFS (dm-3): Corruption warning: Metadata has LSN (1:16) ahead of current LS=
N (1:2). Please unmount and run xfs_repair (>=3D v4.3) to resolve.
XFS (dm-3): log mount/recovery failed: error -22
XFS (dm-3): log mount failed
...

This occurs because older versions of xfs_repair unconditionally zero
out the log, which can lead to corruption after a crash on v5 superblock
(-m crc=3D1) filesystems. Therefore, the invalid log state is detected in
the kernel as of the commit referenced above and ultimately fixed in
xfsprogs v4.3. In other words, XFS on a v4.4 kernel requires xfsprogs
v4.3 or newer.

I'm not sure what the xfsprogs release status is (tot looks like it's at
4.3.0-rc2), but the fix is ultimately to upgrade to a supported
userspace.

Brian

> xfs/041	 18s
> xfs/042	 14s
> xfs/046	 15s
> xfs/047	 25s
> xfs/049	 48s
> xfs/050	 23s
> xfs/054	 15s
> xfs/056	 14s
> xfs/059	 18s
> xfs/060	 16s
> xfs/061	 14s
> xfs/063	 14s
> xfs/064	 228s
> xfs/065	 35s
> xfs/066	 28s
> xfs/068	 25s
> xfs/073	 16s
> xfs/076	 53s
> Ran: xfs/004 xfs/010 xfs/011 xfs/013 xfs/017 xfs/020 xfs/026 xfs/027 xfs/=
028 xfs/031 xfs/032 xfs/033 xfs/041 xfs/042 xfs/046 xfs/047 xfs/049 xfs/050=
 xfs/054 xfs/056 xfs/059 xfs/060 xfs/061 xfs/063 xfs/064 xfs/065 xfs/066 xf=
s/068 xfs/073 xfs/076
> Failures: xfs/033
> Failed 1 of 30 tests
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
>   lkp-ws02/xfstests/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4HDD=
/xfs/xfs-mid1
> =

> commit: =

>   b7cdc66be54b64daef593894d12ecc405f117829
>   a45086e27dfa21a4b39134f7505c8f60a3ecdec4
> =

> b7cdc66be54b64da a45086e27dfa21a4b39134f750 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4          100%           4:4     last_state.xfstests.exit_co=
de.1
>            :4          100%           4:4     xfstests.nr_fail
>            :4          100%           4:4     xfstests.xfs.033.fail
>            :4           25%           1:4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#-#f7b-b747-f26a6b2b589b-can't_mount
>            :4           25%           1:4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#c55-#af8-a93b-#c6382174ba-can't_mount
>           1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#d5c-#dd8-#c4c-#b9758dd7946-can't_mount
>           1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#d8b-#bd0-bd22-be703a050d73-can't_mount
>            :4           25%           1:4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#e49-#-#f14-c1f5b7a39914-can't_mount
>            :4           25%           1:4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#f2c-#ba-#-#a8309204098-can't_mount
>           1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-#f88-#-a30c-f7972224a2c2-can't_mount
>           1:4          -25%            :4     kmsg.XFS(loop0):Filesystem_=
has_duplicate_UUID#-a0f8-#-b678-a0e21fca1aea-can't_mount
>            :4          100%           4:4     kmsg.XFS(sdg1):log_mount/re=
covery_failed:error
> =

> lkp-ws02: Westmere-EP
> Memory: 16G
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Ying Huang

> ---
> LKP_SERVER: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> testcase: xfstests
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   vmstat:
>     interval: 10
> default-watchdogs:
>   oom-killer: =

>   watchdog: =

> commit: 96a2f2162deb97760a44ad8558e374342260cee6
> model: Westmere-EP
> memory: 16G
> nr_hdd_partitions: 11
> hdd_partitions: "/dev/disk/by-id/scsi-35000c500*-part1"
> swap_partitions: =

> rootfs_partition: "/dev/disk/by-id/ata-WDC_WD1002FAEX-00Z3A0_WD-WCATR5408=
564-part3"
> cpufreq_governor: =

> category: functional
> disk: 4HDD
> fs: xfs
> xfstests:
>   test: xfs-mid1
> queue: cyclic
> testbox: lkp-ws02
> tbox_group: lkp-ws02
> kconfig: x86_64-rhel
> enqueue_time: 2015-11-14 09:35:40.999257430 +08:00
> id: 37df3a54bced8a69c8daf7c99bfff44d990622e7
> user: lkp
> compiler: gcc-4.9
> head_commit: 96a2f2162deb97760a44ad8558e374342260cee6
> base_commit: 6a13feb9c82803e2b815eca72fa7a9f5561d7861
> branch: linux-devel/devel-hourly-2015111410
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/96a2f2162deb97760a44ad8558e374342=
260cee6/vmlinuz-4.3.0-bochs-virtio-gpu-wl-ath-16719-g96a2f21"
> rootfs: debian-x86_64-2015-02-07.cgz
> result_root: "/result/xfstests/4HDD-xfs-xfs-mid1/lkp-ws02/debian-x86_64-2=
015-02-07.cgz/x86_64-rhel/gcc-4.9/96a2f2162deb97760a44ad8558e374342260cee6/=
0"
> job_file: "/lkp/scheduled/lkp-ws02/cyclic_xfstests-4HDD-xfs-xfs-mid1-x86_=
64-rhel-CYCLIC_HEAD-96a2f2162deb97760a44ad8558e374342260cee6-20151114-75902=
-1fjjdep-0.yaml"
> dequeue_time: 2015-11-14 12:49:18.590161421 +08:00
> nr_cpu: "$(nproc)"
> max_uptime: 3600
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/lkp-ws02/cyclic_xfstests-4HDD-xfs-xfs-mid1-x86_64-=
rhel-CYCLIC_HEAD-96a2f2162deb97760a44ad8558e374342260cee6-20151114-75902-1f=
jjdep-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2015111410
> - commit=3D96a2f2162deb97760a44ad8558e374342260cee6
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/96a2f2162deb97760a44ad8558e=
374342260cee6/vmlinuz-4.3.0-bochs-virtio-gpu-wl-ath-16719-g96a2f21
> - max_uptime=3D3600
> - RESULT_ROOT=3D/result/xfstests/4HDD-xfs-xfs-mid1/lkp-ws02/debian-x86_64=
-2015-02-07.cgz/x86_64-rhel/gcc-4.9/96a2f2162deb97760a44ad8558e374342260cee=
6/0
> - LKP_SERVER=3Dinn
> - |-
>   ipmi_watchdog.start_now=3D1
> =

>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0
>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
> =

>   rw
> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/96a2f2162deb97760a44ad855=
8e374342260cee6/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/fs.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/xfstest=
s.cgz,/lkp/benchmarks/xfstests.cgz"
> job_state: finished
> loadavg: 0.66 0.72 0.56 1/350 26465
> start_time: '1447476647'
> end_time: '1447477486'
> version: "/lkp/lkp/.src-20151113-180526"

> mkfs -t xfs /dev/sdd1
> mkfs -t xfs /dev/sdk1
> mkfs -t xfs /dev/sdg1
> mkfs -t xfs /dev/sdh1
> mount -t xfs -o nobarrier,inode64 /dev/sdd1 /fs/sdd1
> mount -t xfs -o nobarrier,inode64 /dev/sdh1 /fs/sdh1
> mount -t xfs -o nobarrier,inode64 /dev/sdk1 /fs/sdk1
> mount -t xfs -o nobarrier,inode64 /dev/sdg1 /fs/sdg1
> export TEST_DIR=3D/fs/sdd1
> export TEST_DEV=3D/dev/sdd1
> export FSTYP=3Dxfs
> export SCRATCH_MNT=3D/fs/scratch
> mkdir /fs/scratch -p
> export SCRATCH_DEV=3D/dev/sdg1
> export SCRATCH_LOGDEV=3D/dev/sdh1
> ./check xfs/004 xfs/010 xfs/011 xfs/013 xfs/017 xfs/020 xfs/026 xfs/027 x=
fs/028 xfs/031 xfs/032 xfs/033 xfs/041 xfs/042 xfs/046 xfs/047 xfs/049 xfs/=
050 xfs/054 xfs/056 xfs/059 xfs/060 xfs/061 xfs/063 xfs/064 xfs/065 xfs/066=
 xfs/068 xfs/073 xfs/076



--===============0219776868488605031==--


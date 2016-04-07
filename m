Content-Type: multipart/mixed; boundary="===============5143949196082059860=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] ad68972acb: xfstests.time.file_system_outputs -6.0% improvement
Date: Thu, 07 Apr 2016 09:38:14 +0800
Message-ID: <20160407013813.GB1904@yexl-desktop>
In-Reply-To: <20160407011245.GC12139@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5143949196082059860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Please ignore this report, we just found that it was tested on a virtual
machine, its result is not so reliable. Sorry for that.

On Thu, Apr 07, 2016 at 09:12:45AM +0800, kernel test robot wrote:
>FYI, we noticed that xfstests.time.file_system_outputs -6.0% improvement on
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>commit ad68972acb82c3e8bba316d542ab204984cb1f1c ("xfs: xfs_cluster_write i=
s redundant")
>
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>compiler/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
>  gcc-4.9/4HDD/xfs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/vm-kbuild-4G/g=
eneric-127/xfstests
>
>commit: =

>  fbcc025613590d7b1d15521555dcc6393a148a6b
>  ad68972acb82c3e8bba316d542ab204984cb1f1c
>
>fbcc025613590d7b ad68972acb82c3e8bba316d542 =

>---------------- -------------------------- =

>         %stddev     %change         %stddev
>             \          |                \  =

>   8055643 =C2=B1  0%      -6.0%    7568459 =C2=B1  0%  xfstests.time.file=
_system_outputs
>     11.74 =C2=B1  2%     +28.9%      15.13 =C2=B1 21%  xfstests.time.user=
_time
>     11.74 =C2=B1  2%     +28.9%      15.13 =C2=B1 21%  time.user_time
>
>
>vm-kbuild-4G: qemu-system-x86_64 -enable-kvm -cpu qemu64,+ssse3
>Memory: 4G
>
>
>
>                          xfstests.time.file_system_outputs
>
>  9e+06 ++----------------------------------------------------------------=
--+
>        *.*.*.*.*.*.*.*.*.*.*.*   *.*.*.*.*.*.*.*.*.*.*.*.*   *.*.*.*.*.*.=
*.*
>  8e+06 O+O         O O O O O O O O O O O O O O O O O O O O O :           =
  |
>  7e+06 ++                    :   :                       :   :           =
  |
>        |                     :   :                       :   :           =
  |
>  6e+06 ++                     : :                         : :            =
  |
>  5e+06 ++                     : :                         : :            =
  |
>        |                      : :                         : :            =
  |
>  4e+06 ++                     : :                         : :            =
  |
>  3e+06 ++                     : :                         : :            =
  |
>        |                      : :                         : :            =
  |
>  2e+06 ++                      :                           :             =
  |
>  1e+06 ++                      :                           :             =
  |
>        |                       :                           :             =
  |
>      0 ++--O-O-O-O-------------*---------------------------*-------------=
--+
>
>
>
>	[*] bisect-good sample
>	[O] bisect-bad  sample
>
>To reproduce:
>
>        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-te=
sts.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
>
>
>Disclaimer:
>Results have been estimated based on internal Intel analysis and are provi=
ded
>for informational purposes only. Any difference in system hardware or soft=
ware
>design or configuration may affect actual performance.
>
>
>Thanks,
>Xiaolong Ye

>---
>LKP_SERVER: inn
>LKP_CGI_PORT: 80
>LKP_CIFS_PORT: 139
>testcase: xfstests
>default-monitors:
>  wait: activate-monitor
>  kmsg: =

>  heartbeat:
>    interval: 10
>default-watchdogs:
>  oom-killer: =

>  watchdog: =

>cpufreq_governor: =

>model: qemu-system-x86_64 -enable-kvm -cpu qemu64,+ssse3
>nr_vm: 6
>nr_cpu: 4
>memory: 4G
>rootfs: debian-x86_64-2015-02-07.cgz
>hdd_partitions: "/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf"
>swap_partitions: "/dev/vdg"
>ssh_base_port: 23032
>category: functional
>disk: 4HDD
>fs: xfs
>xfstests:
>  test: generic-127
>branch: scsi/misc
>commit: ad68972acb82c3e8bba316d542ab204984cb1f1c
>queue: bisect
>repeat_to: 2
>testbox: vm-kbuild-4G-3
>tbox_group: vm-kbuild-4G
>kconfig: x86_64-rhel
>enqueue_time: 2016-04-02 17:18:10.328935599 +08:00
>compiler: gcc-4.9
>id: 12de6ecf92d02c668f45f8c0c55ae8b553c74100
>user: lkp
>head_commit: 00e8a46b50f800991e89446fb98dcad5f72e786f
>base_commit: f55532a0c0b8bb6148f4e07853b876ef73bc69ca
>result_root: "/result/xfstests/4HDD-xfs-generic-127/vm-kbuild-4G/debian-x8=
6_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba316d542ab204984c=
b1f1c/0"
>job_file: "/lkp/scheduled/vm-kbuild-4G-3/bisect_xfstests-4HDD-xfs-generic-=
127-debian-x86_64-2015-02-07.cgz-x86_64-rhel-ad68972acb82c3e8bba316d542ab20=
4984cb1f1c-20160402-87765-161tnhy-0.yaml"
>max_uptime: 3600
>initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
>bootloader_append:
>- root=3D/dev/ram0
>- user=3Dlkp
>- job=3D/lkp/scheduled/vm-kbuild-4G-3/bisect_xfstests-4HDD-xfs-generic-127=
-debian-x86_64-2015-02-07.cgz-x86_64-rhel-ad68972acb82c3e8bba316d542ab20498=
4cb1f1c-20160402-87765-161tnhy-0.yaml
>- ARCH=3Dx86_64
>- kconfig=3Dx86_64-rhel
>- branch=3Dscsi/misc
>- commit=3Dad68972acb82c3e8bba316d542ab204984cb1f1c
>- BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba316d542ab=
204984cb1f1c/vmlinuz-4.5.0-rc2-00004-gad68972
>- max_uptime=3D3600
>- RESULT_ROOT=3D/result/xfstests/4HDD-xfs-generic-127/vm-kbuild-4G/debian-=
x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba316d542ab20498=
4cb1f1c/0
>- LKP_SERVER=3Dinn
>- |2-
>
>
>  earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>  debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>  panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_r=
amdisk=3D2 prompt_ramdisk=3D0
>  console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
>
>  rw
>lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
>modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba316d542=
ab204984cb1f1c/modules.cgz"
>bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/de=
ps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_6=
4-2015-02-07.cgz/fs.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/xfstests=
.cgz,/lkp/benchmarks/xfstests.cgz"
>linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba3=
16d542ab204984cb1f1c/linux-headers.cgz"
>kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/ad68972acb82c3e8bba316d542ab204984=
cb1f1c/vmlinuz-4.5.0-rc2-00004-gad68972"
>dequeue_time: 2016-04-02 17:22:24.997334668 +08:00
>job_state: finished
>loadavg: 0.92 0.99 0.93 1/116 2273
>start_time: '1459588990'
>end_time: '1459591516'
>version: "/lkp/lkp/.src-20160401-231508"

>2016-04-02 17:23:01 mkfs -t xfs /dev/vdb
>2016-04-02 17:23:01 mkfs -t xfs /dev/vda
>2016-04-02 17:23:01 mkfs -t xfs /dev/vdc
>2016-04-02 17:23:01 mkfs -t xfs /dev/vdd
>2016-04-02 17:23:09 mount -t xfs -o nobarrier,inode64 /dev/vda /fs/vda
>2016-04-02 17:23:09 mount -t xfs -o nobarrier,inode64 /dev/vdb /fs/vdb
>2016-04-02 17:23:09 mount -t xfs -o nobarrier,inode64 /dev/vdc /fs/vdc
>2016-04-02 17:23:09 mount -t xfs -o nobarrier,inode64 /dev/vdd /fs/vdd
>2016-04-02 17:23:10 export TEST_DIR=3D/fs/vda
>2016-04-02 17:23:10 export TEST_DEV=3D/dev/vda
>2016-04-02 17:23:10 export FSTYP=3Dxfs
>2016-04-02 17:23:10 export SCRATCH_MNT=3D/fs/scratch
>2016-04-02 17:23:10 mkdir /fs/scratch -p
>2016-04-02 17:23:10 export SCRATCH_DEV=3D/dev/vdd
>2016-04-02 17:23:10 export SCRATCH_LOGDEV=3D/dev/vdb
>2016-04-02 17:23:10 ./check generic/127


--===============5143949196082059860==--


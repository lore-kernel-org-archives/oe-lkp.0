Content-Type: multipart/mixed; boundary="===============2231164082875463934=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] dfbd72d0d6: -100.0% xfstests.ext4.001.seconds
Date: Tue, 10 Nov 2015 09:50:21 +0100
Message-ID: <20151110085021.GC26699@quack.suse.cz>
In-Reply-To: <87twoubf1g.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2231164082875463934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 10-11-15 13:26:51, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Jan-Kara/ext4-Fix-races-between-page-fau=
lts-and-hole-punching/20151105-002716
> commit dfbd72d0d6f10086064b918419fb2094ff9fbdb6 ("ext4: Fix races between=
 page faults and hole punching")

Yeah, test ext4/001 starts failing with the patch but it is the test that
needs updating. Updates to xfstests are pending for this...

								Honza

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
>   vm-kbuild-2G/xfstests/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
4HDD/ext4/ext4
> =

> commit: =

>   32b88194f71d6ae7768a29f87fbba454728273ee
>   dfbd72d0d6f10086064b918419fb2094ff9fbdb6
> =

> 32b88194f71d6ae7 dfbd72d0d6f10086064b918419 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4          100%           4:4     last_state.xfstests.exit_co=
de.1
>            :4          100%           4:4     xfstests.ext4.001.fail
>            :4          100%           4:4     xfstests.nr_fail
> =

> vm-kbuild-2G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
> Memory: 2G
> =

> The output of xfstests is as follow:
> =

> 2015-11-09 01:42:14 export TEST_DIR=3D/fs/vda
> 2015-11-09 01:42:14 export TEST_DEV=3D/dev/vda
> 2015-11-09 01:42:14 export FSTYP=3Dext4
> 2015-11-09 01:42:14 export SCRATCH_MNT=3D/fs/scratch
> 2015-11-09 01:42:14 mkdir /fs/scratch -p
> 2015-11-09 01:42:14 export SCRATCH_DEV=3D/dev/vdd
> 2015-11-09 01:42:14 ./check ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 =
ext4/006 ext4/007 ext4/008 ext4/009 ext4/010 ext4/011 ext4/012 ext4/013 ext=
4/014 ext4/015 ext4/016 ext4/017 ext4/018 ext4/019 ext4/271 ext4/301 ext4/3=
05 ext4/306 ext4/307 ext4/308
> FSTYP         -- ext4
> PLATFORM      -- Linux/x86_64 vm-kbuild-2G-3 4.3.0-rc7-00001-gdfbd72d
> MKFS_OPTIONS  -- /dev/vdd
> MOUNT_OPTIONS -- -o acl,user_xattr /dev/vdd /fs/scratch
> =

> ext4/001	 - output mismatch (see /lkp/benchmarks/xfstests/results//ext4/0=
01.out.bad)
>     --- tests/ext4/001.out	2015-11-04 17:39:25.000000000 +0800
>     +++ /lkp/benchmarks/xfstests/results//ext4/001.out.bad	2015-11-09 01:=
42:55.408281000 +0800
>     @@ -131,14 +131,10 @@
>      2: [32..39]: hole
>      daa100df6e6711906b61c9ab5aa16032
>      	11. data -> hole -> data
>     -0: [0..7]: data
>     -1: [8..31]: unwritten
>     -2: [32..39]: data
>     +0: [0..39]: data
>     ...
>     (Run 'diff -u tests/ext4/001.out /lkp/benchmarks/xfstests/results//ex=
t4/001.out.bad'  to see the entire diff)
> ext4/002	 16s
> ext4/003	 17s
> ext4/004	 13s
> ext4/005	 7s
> ext4/006	 [not run] Couldn't find e2fuzz
> ext4/007	 [not run] metadata_csum not supported by this filesystem
> ext4/008	 [not run] metadata_csum not supported by this filesystem
> ext4/009	 [not run] metadata_csum not supported by this filesystem
> ext4/010	 [not run] metadata_csum not supported by this filesystem
> ext4/011	 [not run] metadata_csum not supported by this filesystem
> ext4/012	 [not run] metadata_csum not supported by this filesystem
> ext4/013	 [not run] metadata_csum not supported by this filesystem
> ext4/014	 [not run] metadata_csum not supported by this filesystem
> ext4/015	 [not run] metadata_csum not supported by this filesystem
> ext4/016	 [not run] metadata_csum not supported by this filesystem
> ext4/017	 [not run] metadata_csum not supported by this filesystem
> ext4/018	 [not run] metadata_csum not supported by this filesystem
> ext4/019	 [not run] metadata_csum not supported by this filesystem
> ext4/271	 17s
> ext4/301	 114s
> ext4/305	 40s
> ext4/306	 18s
> ext4/307	 50s
> ext4/308	 22s
> Ran: ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ext4/271 ext4/301 ext4/=
305 ext4/306 ext4/307 ext4/308
> Not run: ext4/006 ext4/007 ext4/008 ext4/009 ext4/010 ext4/011 ext4/012 e=
xt4/013 ext4/014 ext4/015 ext4/016 ext4/017 ext4/018 ext4/019
> Failures: ext4/001
> Failed 1 of 11 tests
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

> cpufreq_governor: =

> model: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
> nr_vm: 16
> nr_cpu: 2
> memory: 2G
> rootfs: debian-x86_64-2015-02-07.cgz
> hdd_partitions: "/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf"
> swap_partitions: "/dev/vdg"
> ssh_base_port: 23016
> category: functional
> disk: 4HDD
> fs: ext4
> xfstests:
>   test: ext4
> enqueue_time: 2015-11-08 02:34:21.338609409 +08:00
> branch: linux-devel/devel-hourly-2015110701
> commit: c92379c0a7bd67599a212f14965bd9be428489e2
> queue: rand
> repeat_to: 2
> compiler: gcc-4.9
> testbox: vm-kbuild-2G-11
> tbox_group: vm-kbuild-2G
> kconfig: x86_64-rhel
> id: eaeeea6886a18b83c9c72417c99f09e6288770d5
> user: lkp
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/c92379c0a7bd67599a212f14965bd9be4=
28489e2/vmlinuz-4.3.0-bochs-virtio-gpu-wl-ath-10735-gc92379c"
> result_root: "/result/xfstests/4HDD-ext4-ext4/vm-kbuild-2G/debian-x86_64-=
2015-02-07.cgz/x86_64-rhel/gcc-4.9/c92379c0a7bd67599a212f14965bd9be428489e2=
/0"
> job_file: "/lkp/scheduled/vm-kbuild-2G-11/rand_xfstests-4HDD-ext4-ext4-de=
bian-x86_64.cgz-x86_64-rhel-c92379c0a7bd67599a212f14965bd9be428489e2-201511=
08-26595-pp3gmx-0.yaml"
> dequeue_time: 2015-11-08 02:35:10.193800957 +08:00
> max_uptime: 3600
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/vm-kbuild-2G-11/rand_xfstests-4HDD-ext4-ext4-debia=
n-x86_64.cgz-x86_64-rhel-c92379c0a7bd67599a212f14965bd9be428489e2-20151108-=
26595-pp3gmx-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2015110701
> - commit=3Dc92379c0a7bd67599a212f14965bd9be428489e2
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/c92379c0a7bd67599a212f14965=
bd9be428489e2/vmlinuz-4.3.0-bochs-virtio-gpu-wl-ath-10735-gc92379c
> - max_uptime=3D3600
> - RESULT_ROOT=3D/result/xfstests/4HDD-ext4-ext4/vm-kbuild-2G/debian-x86_6=
4-2015-02-07.cgz/x86_64-rhel/gcc-4.9/c92379c0a7bd67599a212f14965bd9be428489=
e2/0
> - LKP_SERVER=3Dinn
> - |2-
> =

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
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/c92379c0a7bd67599a212f149=
65bd9be428489e2/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/fs.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/xfstest=
s.cgz,/lkp/benchmarks/xfstests.cgz"
> job_state: finished
> loadavg: 2.45 2.92 1.68 1/99 13724
> start_time: '1446921501'
> end_time: '1446921894'
> version: "/lkp/lkp/.src-20151106-190021"

> mkfs -t ext4 -q -F /dev/vdc
> mkfs -t ext4 -q -F /dev/vdb
> mkfs -t ext4 -q -F /dev/vdd
> mkfs -t ext4 -q -F /dev/vda
> mount -t ext4 /dev/vda /fs/vda
> mount -t ext4 /dev/vdb /fs/vdb
> mount -t ext4 /dev/vdc /fs/vdc
> mount -t ext4 /dev/vdd /fs/vdd
> export TEST_DIR=3D/fs/vda
> export TEST_DEV=3D/dev/vda
> export FSTYP=3Dext4
> export SCRATCH_MNT=3D/fs/scratch
> mkdir /fs/scratch -p
> export SCRATCH_DEV=3D/dev/vdd
> ./check ext4/001 ext4/002 ext4/003 ext4/004 ext4/005 ext4/006 ext4/007 ex=
t4/008 ext4/009 ext4/010 ext4/011 ext4/012 ext4/013 ext4/014 ext4/015 ext4/=
016 ext4/017 ext4/018 ext4/019 ext4/271 ext4/301 ext4/305 ext4/306 ext4/307=
 ext4/308

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============2231164082875463934==--


Content-Type: multipart/mixed; boundary="===============3390652114642520665=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [block] c1a6680dfd: OOM possibility increased from 50%-83%
Date: Tue, 10 Nov 2015 09:42:17 +0800
Message-ID: <87mvumd406.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3390652114642520665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.infradead.org/users/hch/block.git nvme-loop.2
commit c1a6680dfd43af25bdfd5a22a7fe6efc16ba56f6 ("block: defer timeouts to =
a workqueue")

As below, just FYI.  Although the memory size of virtual machine is too
small, your commit may increased memory usage.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-intel12-openwrt-i386/boot/openwrt-i386.cgz/i386-randconfig-a0-201545/g=
cc-5/1

commit: =

  344c23116aa2003811927925a8462e57311e6467
  c1a6680dfd43af25bdfd5a22a7fe6efc16ba56f6

344c23116aa20038 c1a6680dfd43af25bdfd5a22a7 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :30          50%          15:30    kmsg.Kernel_Offset:disabled
          1:30          -3%            :30    kmsg.hrtimer:interrupt_took#ns
           :30          50%          15:30    dmesg.Kernel_panic-not_syncin=
g:Out_of_memory_and_no_killable_processes
           :30          50%          15:30    dmesg.Mem-Info
           :30          50%          15:30    dmesg.invoked_oom-killer:gfp_=
mask=3D0x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-kbuild-yocto-i386/boot/yocto-minimal-i386.cgz/i386-randconfig-a0-20154=
5/gcc-5/1

commit: =

  344c23116aa2003811927925a8462e57311e6467
  c1a6680dfd43af25bdfd5a22a7fe6efc16ba56f6

344c23116aa20038 c1a6680dfd43af25bdfd5a22a7 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :36          72%          26:36    kmsg.Kernel_Offset:disabled
           :36          72%          26:36    dmesg.Kernel_panic-not_syncin=
g:Out_of_memory_and_no_killable_processes
           :36          72%          26:36    dmesg.Mem-Info
           :36          72%          26:36    dmesg.invoked_oom-killer:gfp_=
mask=3D0x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-vp-quantal-i386/boot/quantal-core-i386.cgz/i386-randconfig-a0-201545/g=
cc-5/1

commit: =

  344c23116aa2003811927925a8462e57311e6467
  c1a6680dfd43af25bdfd5a22a7fe6efc16ba56f6

344c23116aa20038 c1a6680dfd43af25bdfd5a22a7 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :12          83%          10:12    kmsg.Kernel_Offset:disabled
           :12          83%          10:12    dmesg.Kernel_panic-not_syncin=
g:Out_of_memory_and_no_killable_processes
           :12          83%          10:12    dmesg.Mem-Info
           :12          83%          10:12    dmesg.invoked_oom-killer:gfp_=
mask=3D0x


vm-intel12-openwrt-i386: qemu-system-i386 -enable-kvm
Memory: 192M

vm-kbuild-yocto-i386: qemu-system-i386 -enable-kvm
Memory: 320M

vm-vp-quantal-i386: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 360M




Thanks,
Ying Huang

--===============3390652114642520665==--


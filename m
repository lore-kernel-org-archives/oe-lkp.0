Content-Type: multipart/mixed; boundary="===============1947505761215639847=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ocfs2] e2ac55b6a8e: ocfs2_init:1612 ERROR: Unable to create ocfs2 debugfs root
Date: Mon, 20 Apr 2015 12:32:17 +0800
Message-ID: <1429504337.7977.30.camel@intel.com>
In-Reply-To: <465C1C8A-0819-4253-9525-6168CCCA133A@gatech.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============1947505761215639847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2015-04-19 at 23:45 -0400, Chengyu Song wrote:
> Hi Ying,
> =

> As suggested in the patch,  -19 (-ENODEV) happens when debugfs is not con=
figured (see include/linux/debugfs.h). So if debugfs is necessary for the f=
unctionality, in Kconfig, we should either declare it as a dependency, or a=
uto select it.

I see.  Thanks for explanation!

Best Regards,
Huang, Ying

> Chengyu
> =

> > On Apr 19, 2015, at 11:25 PM, Huang Ying <ying.huang@intel.com> wrote:
> > =

> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit e2ac55b6a8e337fac7cc59c6f452caac92ab5ee6 ("ocfs2: incorrect chec=
k for debugfs returns")
> > =

> > We found something as below in dmesg.
> > =

> > [    1.225136] VFS: Disk quotas dquot_6.5.2
> > [    1.225814] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096=
 bytes)
> > [    1.228207] (swapper/0,1,0):ocfs2_init:1612 ERROR: Unable to create =
ocfs2 debugfs root.
> > [    1.232445] (swapper/0,1,0):ocfs2_init:1634 ERROR: status =3D -19
> > [    1.233223] ocfs2: Registered cluster interface o2cb
> > [    1.233994] OCFS2 User DLM kernel interface loaded
> > [    1.234618] (swapper/0,1,0):o2hb_debug_init:1318 ERROR: status =3D -=
19
> > [    1.236183] gfs2: GFS2 installed
> > [    1.238123] Key type asymmetric registered
> > =

> > BUG: kernel boot hang
> > Elapsed time: 310
> > qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -kernel /kernel/i=
386-randconfig-ib0-04172352/e2ac55b6a8e337fac7cc59c6f452caac92ab5ee6/vmlinu=
z-4.0.0-02646-ge2ac55b -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/sche=
duled/vm-vp-quantal-i386-23/rand_boot-1-quantal-core-i386.cgz-i386-randconf=
ig-ib0-04172352-e2ac55b6a8e337fac7cc59c6f452caac92ab5ee6-1-20150418-31554-1=
woqtdb.yaml ARCH=3Di386 kconfig=3Di386-randconfig-ib0-04172352 branch=3Dlin=
us/master commit=3De2ac55b6a8e337fac7cc59c6f452caac92ab5ee6 BOOT_IMAGE=3D/k=
ernel/i386-randconfig-ib0-04172352/e2ac55b6a8e337fac7cc59c6f452caac92ab5ee6=
/vmlinuz-4.0.0-02646-ge2ac55b RESULT_ROOT=3D/result/vm-vp-quantal-i386/boot=
/1/quantal-core-i386.cgz/i386-randconfig-ib0-04172352/e2ac55b6a8e337fac7cc5=
9c6f452caac92ab5ee6/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 rd.udev.l=
og-priority=3Derr systemd.log_target=3Djournal systemd.log_level=3Dwarning =
debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ra=
mdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dno=
rmal rw ip=3D::::vm-vp-quantal-i386-23::dhcp drbd.minor_count=3D8'  -initrd=
 /fs/sde1/initrd-vm-vp-quantal-i386-23 -m 360 -smp 1 -device e1000,netdev=
=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300e=
sb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-vm-vp-quantal-i386-23 =
-serial file:/dev/shm/kboot/serial-vm-vp-quantal-i386-23 -daemonize -displa=
y none -monitor null =

> > =

> > Thanks,
> > Ying Huang
> > =

> > <config-4.0.0-02646-ge2ac55b><.dmesg.txt>______________________________=
_________________
> > LKP mailing list
> > LKP(a)linux.intel.com
> > =

> =




--===============1947505761215639847==--


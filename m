Content-Type: multipart/mixed; boundary="===============3793812765738702858=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 5b3e3964db: torture_init_begin: refusing rcu init: spin_lock running
Date: Mon, 21 Mar 2016 07:59:05 -0700
Message-ID: <20160321145905.GO4287@linux.vnet.ibm.com>
In-Reply-To: <20160321064507.GD32569@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3793812765738702858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 02:45:07PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu=
/dev
> commit 5b3e3964dba5f5a3210ca931d523c1e1f3119b31 ("rcutorture: Add RCU gra=
ce-period performance tests")
> =

> As below, the log "torture_init_begin: refusing rcu init: spin_lock runni=
ng" showed with your commit.

This is the expected result if you try to run two torture tests at the
same time.  You only get one of locktorture, rcutorture, or rcuperf
at any given time.

							Thanx, Paul

> [    3.310757] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    3.310757] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    3.318722] spin_lock-torture: Creating torture_shuffle task
> [    3.318722] spin_lock-torture: Creating torture_shuffle task
> [    3.350213] spin_lock-torture: Creating torture_stutter task
> [    3.350213] spin_lock-torture: Creating torture_stutter task
> [    3.353000] spin_lock-torture: torture_shuffle task started
> [    3.353000] spin_lock-torture: torture_shuffle task started
> [    3.355562] spin_lock-torture: Creating lock_torture_writer task
> [    3.355562] spin_lock-torture: Creating lock_torture_writer task
> [    3.358373] spin_lock-torture: torture_stutter task started
> [    3.358373] spin_lock-torture: torture_stutter task started
> [    3.361060] spin_lock-torture: lock_torture_writer task started
> [    3.361060] spin_lock-torture: lock_torture_writer task started
> [    3.370011] spin_lock-torture: Creating lock_torture_writer task
> [    3.370011] spin_lock-torture: Creating lock_torture_writer task
> [    3.372856] spin_lock-torture: Creating lock_torture_writer task
> [    3.372856] spin_lock-torture: Creating lock_torture_writer task
> [    3.375817] spin_lock-torture: lock_torture_writer task started
> [    3.375817] spin_lock-torture: lock_torture_writer task started
> [    3.378697] spin_lock-torture: Creating lock_torture_writer task
> [    3.378697] spin_lock-torture: Creating lock_torture_writer task
> [    3.380049] spin_lock-torture: lock_torture_writer task started
> [    3.380049] spin_lock-torture: lock_torture_writer task started
> [    3.410169] spin_lock-torture: Creating lock_torture_stats task
> [    3.410169] spin_lock-torture: Creating lock_torture_stats task
> [    3.413129] spin_lock-torture: lock_torture_writer task started
> [    3.413129] spin_lock-torture: lock_torture_writer task started
> [    3.420137] torture_init_begin: refusing rcu init: spin_lock running
> [    3.420137] torture_init_begin: refusing rcu init: spin_lock running
> =

> [    3.430064] spin_lock-torture: lock_torture_stats task started
> [    3.430064] spin_lock-torture: lock_torture_stats task started
> [    3.441101] futex hash table entries: 16 (order: -1, 2048 bytes)
> [    3.441101] futex hash table entries: 16 (order: -1, 2048 bytes)
> [    3.443791] audit: initializing netlink subsys (disabled)
> [    3.443791] audit: initializing netlink subsys (disabled)
> [    3.446329] audit: type=3D2000 audit(1458435960.381:1): initialized
> [    3.446329] audit: type=3D2000 audit(1458435960.381:1): initialized
> [    3.470185] zbud: loaded
> [    3.470185] zbud: loaded
> =

> =

> FYI, raw QEMU command line is:
> =

> 	qemu-system-x86_64 -enable-kvm -cpu Nehalem -kernel /pkg/linux/x86_64-ra=
ndconfig-i0-201612/gcc-5/5b3e3964dba5f5a3210ca931d523c1e1f3119b31/vmlinuz-4=
.5.0-rc1-00035-g5b3e396 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/sch=
eduled/vm-intel12-yocto-x86_64-6/bisect_boot-1-yocto-minimal-x86_64.cgz-x86=
_64-randconfig-i0-201612-5b3e3964dba5f5a3210ca931d523c1e1f3119b31-20160320-=
8459-1gazcic-1.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-i0-201612 bra=
nch=3Dlinux-devel/devel-spot-201603200631 commit=3D5b3e3964dba5f5a3210ca931=
d523c1e1f3119b31 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-i0-201612/gcc-5/=
5b3e3964dba5f5a3210ca931d523c1e1f3119b31/vmlinuz-4.5.0-rc1-00035-g5b3e396 m=
ax_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-intel12-yocto-x86_64/yocto-=
minimal-x86_64.cgz/x86_64-randconfig-i0-201612/gcc-5/5b3e3964dba5f5a3210ca9=
31d523c1e1f3119b31/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.lo=
g_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stal=
l_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=
=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=
=3Dtty0 vga=3Dnormal rw ip=3D::::vm-intel12-yocto-x86_64-6::dhcp drbd.minor=
_count=3D8'  -initrd /fs/KVM/initrd-vm-intel12-yocto-x86_64-6 -m 320 -smp 2=
 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-re=
boot -watchdog i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/KVM/disk0-v=
m-intel12-yocto-x86_64-6,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/KVM/dis=
k1-vm-intel12-yocto-x86_64-6,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kbo=
ot/pid-vm-intel12-yocto-x86_64-6 -serial file:/dev/shm/kboot/serial-vm-inte=
l12-yocto-x86_64-6 -daemonize -display none -monitor null =

> =

> Thanks,
> Xiaolong Ye.



--===============3793812765738702858==--


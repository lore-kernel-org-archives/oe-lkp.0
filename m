Content-Type: multipart/mixed; boundary="===============0472757197405941154=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/smpboot] f5d6a52f511: BUG: kernel boot hang
Date: Wed, 13 May 2015 08:47:31 +0200
Message-ID: <20150513064731.GC24538@gmail.com>
In-Reply-To: <1431496414.5148.222.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0472757197405941154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Huang Ying <ying.huang@intel.com> wrote:

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/apic
> commit f5d6a52f511157c7476590532a23b5664b1ed877 ("x86/smpboot: Skip delay=
s during SMP initialization similar to Xen")
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 19e3d60d49 | f5d6a52f5=
1 |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 20         | 10       =
  |
> | boot_failures                                  | 2          | 12       =
  |
> | IP-Config:Auto-configuration_of_network_failed | 2          | 2        =
  |
> | BUG:kernel_boot_hang                           | 0          | 10       =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> =

> [    0.000000] Initializing CPU#1
> [    1.586595] kvm-clock: cpu 1, msr 0:13fdf041, secondary cpu clock
> =

> BUG: kernel boot hang
> Elapsed time: 305
> qemu-system-i386 -enable-kvm -kernel /pkg/linux/i386-randconfig-c0-051110=
38/gcc-4.9/be67584d15684730aeed88cab355c5de8b0491fe/vmlinuz-4.1.0-rc3-01147=
-gbe67584 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-kbui=
ld-yocto-i386-3/rand_boot-1-yocto-minimal-i386.cgz-i386-randconfig-c0-05111=
038-be67584d15684730aeed88cab355c5de8b0491fe-1-20150512-31766-1fzr1qi.yaml =
ARCH=3Di386 kconfig=3Di386-randconfig-c0-05111038 branch=3Dlinux-devel/deve=
l-cairo-smoke-201505120219 commit=3Dbe67584d15684730aeed88cab355c5de8b0491f=
e BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c0-05111038/gcc-4.9/be67584d15684=
730aeed88cab355c5de8b0491fe/vmlinuz-4.1.0-rc3-01147-gbe67584 max_uptime=3D6=
00 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz=
/i386-randconfig-c0-05111038/gcc-4.9/be67584d15684730aeed88cab355c5de8b0491=
fe/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr de=
bug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 =
panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramd=
isk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnorm=
al rw ip=3D::::vm-kbuild-yocto-i386-3::dhcp drbd.minor_count=3D8'  -initrd =
/fs/sdc1/initrd-vm-kbuild-yocto-i386-3 -m 320 -smp 2 -device e1000,netdev=
=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300e=
sb -rtc base=3Dlocaltime -drive file=3D/fs/sdc1/disk0-vm-kbuild-yocto-i386-=
3,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-i386=
-3 -serial file:/dev/shm/kboot/serial-vm-kbuild-yocto-i386-3 -daemonize -di=
splay none -monitor null =


Hm, so in hindsight the commit, contrary to the changelog, not only =

changed delays, but also changed the APIC_DM_INIT logic from:

	...
	apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT, phys_apicid);
	...

to:

	if (!cpu_has_x2apic) {
		...
		apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT, phys_apicid);
		...
	}

i.e. in the x2apic case it not only skips the delays, but skips the =

INIT IPI deassertion as well!

So I think this change was poorly tested (and the semantic change =

slipped through my review as well), in a very fragile piece of =

historic code, so I've reverted it.

Len's 10 msec delay optimization for modern x86 CPUs is kept intact.

Thanks,

	Ingo

--===============0472757197405941154==--


Content-Type: multipart/mixed; boundary="===============1604218615626151550=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 00:53:31 +0900
Message-ID: <20160223155331.GA448@swordfish>
In-Reply-To: <20160223131538.GA2048@swordfish>
List-Id: <oe-lkp.lists.linux.dev>

--===============1604218615626151550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/23/16 22:15), Sergey Senozhatsky wrote:
> On (02/23/16 08:55), kernel test robot wrote:
> > [   33.497678] ### dt-test ### of_unittest_destroy_tracked_overlays: ov=
erlay destroy failed for #6
> > [   33.497693] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [s=
wapper:1]
> > [   33.497693] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [s=
wapper:1]
> > [   33.497695] Modules linked in:
> > [   33.497695] Modules linked in:
> > [   33.497696] irq event stamp: 69018756
> > [   33.497696] irq event stamp: 69018756
> =

> how may consoles do you have registered? is it possible that your
> call_console_drivers() loop push the same data to different consoles,
> but the messages end up in one place (serial port, etc... dunno)?
> does it happen to all of the messages?

oh... didn't notice there was a dmesg.xz attached.


ok, so everything is "doubled" in your dmesg, starting from "console [ttyS0=
] enabled" line

 254 [    0.000000]     vmalloc : 0xc47e0000 - 0xff7fe000   ( 944 MB)
 255 [    0.000000]     lowmem  : 0xb0000000 - 0xc3fe0000   ( 319 MB)
 256 [    0.000000]       .init : 0xc0dc4000 - 0xc0e3a000   ( 472 kB)
 257 [    0.000000]       .data : 0xc0a0a040 - 0xc0dc2560   (3809 kB)
 258 [    0.000000]       .text : 0xc0600000 - 0xc0a0a040   (4136 kB)
 259 [    0.000000] Checking if this processor honours the WP bit even in s=
upervisor mode...Ok.
 260 [    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1, Nodes=3D1
 261 [    0.000000] Running RCU self tests
 262 [    0.000000] NR_IRQS:2304 nr_irqs:256 16
 263 [    0.000000] CPU 0 irqstacks, hard=3Db002a000 soft=3Db002c000
 264 [    0.000000] console [ttyS0] enabled
 265 [    0.000000] console [ttyS0] enabled
 266 [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, =
Inc., Ingo Molnar
 267 [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, =
Inc., Ingo Molnar
 268 [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
 269 [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
 270 [    0.000000] ... MAX_LOCK_DEPTH:          48
 271 [    0.000000] ... MAX_LOCK_DEPTH:          48
 272 [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
 273 [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
 274 [    0.000000] ... CLASSHASH_SIZE:          4096
 275 [    0.000000] ... CLASSHASH_SIZE:          4096
 276 [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
 277 [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
 278 [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
 279 [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
 280 [    0.000000] ... CHAINHASH_SIZE:          32768
 281 [    0.000000] ... CHAINHASH_SIZE:          32768
 282 [    0.000000]  memory used by lock dependency info: 5167 kB
 283 [    0.000000]  memory used by lock dependency info: 5167 kB
 284 [    0.000000]  per task-struct memory footprint: 2112 bytes
 285 [    0.000000]  per task-struct memory footprint: 2112 bytes
 286 [    0.000000] ------------------------
 287 [    0.000000] ------------------------
 288 [    0.000000] | Locking API testsuite:
 289 [    0.000000] | Locking API testsuite:
 290 [    0.000000] -------------------------------------------------------=
---------------------
 291 [    0.000000] -------------------------------------------------------=
---------------------
 292 [    0.000000]                                  | spin |wlock |rlock |=
mutex | wsem | rsem |
 293 [    0.000000]                                  | spin |wlock |rlock |=
mutex | wsem | rsem |
 294 [    0.000000]   -----------------------------------------------------=
---------------------
 295 [    0.000000]   -----------------------------------------------------=
---------------------


looking at your Kernel command line

[    0.000000] Kernel command line: root=3D/dev/ram0 user=3Dlkp job=3D/lkp/=
scheduled/vm-kbuild-yocto-i386-53/bisect_boot-1-yocto-minimal-i386.cgz-i386=
-randconfig-h1-02192137-34578dc67f38c02ccbe696e4099967884caa8e15-20160220-7=
2722-vao2m5-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-h1-02192137 branch=
=3Dlinux-next/master commi     t=3D34578dc67f38c02ccbe696e4099967884caa8e15=
 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02c=
cbe696e4099967884caa8e15/vmlinuz-4.5.0-rc4-00295-g34578dc max_uptime=3D600 =
RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz/i3=
86-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe69     6e4099967884caa8e=
15/9 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr de=
bug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 =
panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramd=
isk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnorm=
al rw ip=3D::::vm-kbuild-yo     cto-i386-53::dhcp drbd.minor_count=3D8


- earlyprintk=3DttyS0,115200
- console=3DttyS0,115200
- console=3Dtty0


so you have two consoles: ttyS0 and tty0?


and I see "bootconsole [earlyser0] enabled" but no "bootconsole [earlyser0]=
 disabled" message, which
I'd expect to see...

So how may consoles do you have? 2 or 3? so call_console_drivers() has to -=
>write()
every log line N times; at least to ttyS0->write() and to tty0->write()?

	-ss

--===============1604218615626151550==--


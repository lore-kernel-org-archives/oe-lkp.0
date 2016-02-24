Content-Type: multipart/mixed; boundary="===============2553287824754211987=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 12:46:14 +0100
Message-ID: <20160224114614.GY3305@pathway.suse.cz>
In-Reply-To: <20160224011941.GA7683@swordfish>
List-Id: <oe-lkp.lists.linux.dev>

--===============2553287824754211987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 2016-02-24 10:19:41, Sergey Senozhatsky wrote:
> =

> Hello,
> =

> Cc Rob, Frank, Grant
> =

> On (02/24/16 00:53), Sergey Senozhatsky wrote:
> [..]
> >  284 [    0.000000]  per task-struct memory footprint: 2112 bytes
> >  285 [    0.000000]  per task-struct memory footprint: 2112 bytes
> >  286 [    0.000000] ------------------------
> >  287 [    0.000000] ------------------------
> >  288 [    0.000000] | Locking API testsuite:
> >  289 [    0.000000] | Locking API testsuite:
> >  290 [    0.000000] ---------------------------------------------------=
-------------------------
> >  291 [    0.000000] ---------------------------------------------------=
-------------------------
> >  292 [    0.000000]                                  | spin |wlock |rlo=
ck |mutex | wsem | rsem |
> >  293 [    0.000000]                                  | spin |wlock |rlo=
ck |mutex | wsem | rsem |
> >  294 [    0.000000]   -------------------------------------------------=
-------------------------
> >  295 [    0.000000]   -------------------------------------------------=
-------------------------
> > =

> > =

> > looking at your Kernel command line
> > =

> > [    0.000000] Kernel command line: root=3D/dev/ram0 user=3Dlkp job=3D/=
lkp/scheduled/vm-kbuild-yocto-i386-53/bisect_boot-1-yocto-minimal-i386.cgz-=
i386-randconfig-h1-02192137-34578dc67f38c02ccbe696e4099967884caa8e15-201602=
20-72722-vao2m5-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-h1-02192137 br=
anch=3Dlinux-next/master commi     t=3D34578dc67f38c02ccbe696e4099967884caa=
8e15 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-h1-02192137/gcc-5/34578dc67f38=
c02ccbe696e4099967884caa8e15/vmlinuz-4.5.0-rc4-00295-g34578dc max_uptime=3D=
600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cg=
z/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe69     6e4099967884c=
aa8e15/9 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Der=
r debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D=
100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3D=
normal rw ip=3D::::vm-kbuild-yo     cto-i386-53::dhcp drbd.minor_count=3D8
> > =

> > =

> > - earlyprintk=3DttyS0,115200
> > - console=3DttyS0,115200
> > - console=3Dtty0
> > =

> > and I see "bootconsole [earlyser0] enabled" but no "bootconsole [earlys=
er0] disabled" message, which
> > I'd expect to see...
> > =

> =

> =

> and you get the NMI watchdog softlockup because you have a whole bunch of
> =

>    "of_overlay_destroy: Could not find overlay #6"
>    "### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy=
 failed for #6"
> =

> messages to print. seems that somehitng just pushes them in a loop.
> there are too many of them:

This sounds like a reasonable explanation. It seems that
of_unittest_destroy_tracked_overlays() really ended in an infinite
loop.

But I am still curious why the softlookup points to

[   33.497718] EIP is at vprintk_emit+0x1ea/0x600

Also there is on the stack

[   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
[   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
[   33.497744]  [<c06fdf6e>] printk+0x11/0x13
[   33.497744]  [<c06fdf6e>] printk+0x11/0x13
[   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
[   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
[   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
[   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d

I would expect that the soft lookup happens in console_unlock()
called with IRQs disabled. It seems to me that of_unittest_overlay()
is called with IRQs enabled.

I want to be sure that the patch in printk() did not introduce
a deadlock that is visible only under a high printk load.

I guess that the softlookup was not visible before the
printk patch was applied. I wonder if the patch made something
worse. It was supposed to improve things but...

Do I miss something, please?

Best Regards,
Petr

--===============2553287824754211987==--


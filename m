Content-Type: multipart/mixed; boundary="===============2060227067424196133=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86, static_call] ee88d363d1: WARNING:at_arch/x86/kernel/alternative.c:#apply_returns
Date: Wed, 13 Jul 2022 11:44:14 -0700
Message-ID: <202207131136.AFA428CA@keescook>
In-Reply-To: <Ys66hwtFcGbYmoiZ@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2060227067424196133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 02:28:55PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 13, 2022 at 04:02:15PM +0800, kernel test robot wrote:
> =

> > [   22.065014][    T0] ------------[ cut here ]------------
> > [ 22.066738][ T0] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative=
.c:557 apply_returns (arch/x86/kernel/alternative.c:557 (discriminator 1)) =

> > [   22.069534][    T0] Modules linked in:
> > [   22.070738][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0=
-rc4-00008-gee88d363d156 #1
> > [   22.072739][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> > [ 22.074741][ T0] RIP: 0010:apply_returns (arch/x86/kernel/alternative.=
c:557 (discriminator 1)) =

> > [ 22.076739][ T0] Code: ff ff 74 cb 48 83 c5 04 49 39 ee 0f 87 81 fe ff=
 ff e9 22 ff ff ff 0f 0b 48 83 c5 04 49 39 ee 0f 87 6d fe ff ff e9 0e ff ff=
 ff <0f> 0b 48 83 c5 04 49 39 ee 0f 87 59 fe ff ff e9 fa fe ff ff 48 89
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	ff                   	(bad)  =

> >    1:	ff 74 cb 48          	pushq  0x48(%rbx,%rcx,8)
> >    5:	83 c5 04             	add    $0x4,%ebp
> >    8:	49 39 ee             	cmp    %rbp,%r14
> >    b:	0f 87 81 fe ff ff    	ja     0xfffffffffffffe92
> >   11:	e9 22 ff ff ff       	jmpq   0xffffffffffffff38
> >   16:	0f 0b                	ud2    =

> >   18:	48 83 c5 04          	add    $0x4,%rbp
> >   1c:	49 39 ee             	cmp    %rbp,%r14
> >   1f:	0f 87 6d fe ff ff    	ja     0xfffffffffffffe92
> >   25:	e9 0e ff ff ff       	jmpq   0xffffffffffffff38
> >   2a:*	0f 0b                	ud2    		<-- trapping instruction
> >   2c:	48 83 c5 04          	add    $0x4,%rbp
> >   30:	49 39 ee             	cmp    %rbp,%r14
> >   33:	0f 87 59 fe ff ff    	ja     0xfffffffffffffe92
> >   39:	e9 fa fe ff ff       	jmpq   0xffffffffffffff38
> >   3e:	48                   	rex.W
> >   3f:	89                   	.byte 0x89
> > =

> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	0f 0b                	ud2    =

> >    2:	48 83 c5 04          	add    $0x4,%rbp
> >    6:	49 39 ee             	cmp    %rbp,%r14
> >    9:	0f 87 59 fe ff ff    	ja     0xfffffffffffffe68
> >    f:	e9 fa fe ff ff       	jmpq   0xffffffffffffff0e
> >   14:	48                   	rex.W
> >   15:	89                   	.byte 0x89
> > [   22.078738][    T0] RSP: 0000:ffffffffa2807dc0 EFLAGS: 00010202
> > [   22.080737][    T0] RAX: 0000000000000000 RBX: ffffffffa1b8fe05 RCX:=
 0000000000000000
> > [   22.082546][    T0] RDX: 000000000000000f RSI: ffffffffa184a3e0 RDI:=
 ffffffffa1b8fe05
> > [   22.083738][    T0] RBP: ffffffffa42851e8 R08: 0000000000000001 R09:=
 ffffffffa1b8fe05
> > [   22.086491][    T0] R10: 0000000000000000 R11: 0000000000000000 R12:=
 ffffffffa1b8fe00
> > [   22.087738][    T0] R13: dffffc0000000000 R14: ffffffffa4299890 R15:=
 1ffffffff4500fbb
> > [   22.089739][    T0] FS:  0000000000000000(0000) GS:ffff888396600000(=
0000) knlGS:0000000000000000
> > [   22.091743][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   22.093738][    T0] CR2: ffff88843ffff000 CR3: 00000003a562a000 CR4:=
 00000000000006f0
> > [   22.095753][    T0] Call Trace:
> > [   22.097742][    T0]  <TASK>
> > [ 22.098765][ T0] ? rwlock_bug+0xc0/0xc0 =

> > [ 22.100230][ T0] ? apply_retpolines (arch/x86/kernel/alternative.c:538=
) =

> > [ 22.101791][ T0] ? int3_exception_notify (arch/x86/kernel/alternative.=
c:849) =

> > [ 22.103261][ T0] ? check_bugs (arch/x86/kernel/cpu/bugs.c:149) =

> > [ 22.104751][ T0] alternative_instructions (arch/x86/kernel/alternative=
.c:932) =

> > [ 22.106766][ T0] check_bugs (arch/x86/kernel/cpu/bugs.c:159) =

> > [ 22.108244][ T0] start_kernel (init/main.c:1132) =

> > [ 22.109747][ T0] secondary_startup_64_no_verify (arch/x86/kernel/head_=
64.S:358) =

> > [   22.111300][    T0]  </TASK>
> > [   22.112742][    T0] irq event stamp: 87769
> > [ 22.113741][ T0] hardirqs last enabled at (87781): __up_console_sem (a=
rch/x86/include/asm/irqflags.h:45 (discriminator 1) arch/x86/include/asm/ir=
qflags.h:80 (discriminator 1) arch/x86/include/asm/irqflags.h:138 (discrimi=
nator 1) kernel/printk/printk.c:264 (discriminator 1)) =

> > [ 22.115740][ T0] hardirqs last disabled at (87794): __up_console_sem (=
kernel/printk/printk.c:262 (discriminator 1)) =

> > [ 22.117739][ T0] softirqs last enabled at (2774): cgroup_idr_alloc+0x5=
b/0x1c0 =

> > [ 22.119739][ T0] softirqs last disabled at (2772): cgroup_idr_alloc+0x=
2e/0x1c0 =

> > [   22.121741][    T0] ---[ end trace 0000000000000000 ]---
> =

> =

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index d6858533e6e5..ff309e829192 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -555,8 +555,10 @@ void __init_or_module noinline apply_returns(s32 *st=
art, s32 *end)
>  			dest =3D addr + insn.length + insn.immediate.value;
>  =

>  		if (__static_call_fixup(addr, op, dest) ||
> -		    WARN_ON_ONCE(dest !=3D &__x86_return_thunk))
> +		    WARN_ON_ONCE(dest !=3D &__x86_return_thunk)) {
> +			printk("XXX: %pS %pS : %*ph", addr, dest, 5, addr);
>  			continue;
> +		}
>  =

>  		DPRINTK("return thunk at: %pS (%px) len: %d to: %pS",
>  			addr, addr, insn.length,
> =

> Gets me:
> =

> [    2.559091][    T0] ---[ end trace 0000000000000000 ]---
> [    2.561092][    T0] XXX: lkdtm_rodata_do_nothing+0x0/0x1240 lkdtm_roda=
ta_do_nothing+0x5/0x1240 : e9 00 00 00 00
> =

> which is a result of:
> =

> drivers/misc/lkdtm/Makefile:OBJCOPYFLAGS_rodata_objcopy.o   :=3D \
> drivers/misc/lkdtm/Makefile:                        --rename-section .noi=
nstr.text=3D.rodata,alloc,readonly,load,contents
> =

> which makes that:
> =

> 0000000000000000 <lkdtm_rodata_do_nothing>:
>    0:   e9 00 00 00 00          jmp    5 <lkdtm_rodata_do_nothing+0x5>  1=
: R_X86_64_PLT32       __x86_return_thunk-0x4
> =

> remains unresolved.
> =

> Kees, what's up with that thing, this is 'weird' at best.

Whee. Yeah, this is a regression test for validating that the .data
section is not executable. It's designed to be arch-agnostic to avoid
needing to know how to return from a function call.

Is there some way for this to opt out of the thunk and leave it a bare
"ret"?

-- =

Kees Cook
--===============2060227067424196133==--


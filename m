Content-Type: multipart/mixed; boundary="===============4367832107163139161=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [locking/paravirt] 9043442b43: WARNING:at_kernel/jump_label.c:#static_key_disable_cpuslocked
Date: Wed, 18 Oct 2017 16:22:00 +0200
Message-ID: <20171018142159.hesobm5arrjvexoj@pd.tnic>
In-Reply-To: <20171012074717.jejrvn7q4gvyzg43@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4367832107163139161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 09:47:17AM +0200, Peter Zijlstra wrote:
> Urgh.. I always get lost in that whole patching maze :/ Unless Juergen
> can move it later, I think the below should also work. Moving
> jump_label_init() before smp_prepare_boot_cpu() might not work for all
> architectures, but it should work for x86 (and we explicitly allow for
> archs to initialize this early).
> =

> ---
>  arch/x86/kernel/smpboot.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =

> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index aed1460135e6..93b42d9d9d4f 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1350,6 +1350,17 @@ void __init native_smp_prepare_boot_cpu(void)
>  	/* already set me in cpu_online_mask in boot_cpu_init() */
>  	cpumask_set_cpu(me, cpu_callout_mask);
>  	cpu_set_state_online(me);
> +
> +	/*
> +	 * native_pv_lock_init() needs jump_labels to work. Moving
> +	 * jump_label_init() in generic code requires auditing all archs for
> +	 * their text_poke requirements.
> +	 *
> +	 * The x86 version really only depends on ideal_nops[] which is
> +	 * initialized at the end of setup_arch(). So doing an arch specific
> +	 * early init of jump-labels here is fine.
> +	 */
> +	jump_label_init();
>  	native_pv_lock_init();
>  }

This fixes the jump_label thing I'm seeing too but it causes:

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:712 =
text_poke+0x214/0x220
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-rc5-bdw+ #5
[    0.000000] Hardware name: SGI.COM C2112-4GP3/X10DRT-P-Series, BIOS 2.0a=
 05/09/2016
[    0.000000] task: ffffffff81c0e480 task.stack: ffffffff81c00000
[    0.000000] RIP: 0010:text_poke+0x214/0x220
[    0.000000] RSP: 0000:ffffffff81c03e28 EFLAGS: 00010046 ORIG_RAX: 000000=
0000000000
[    0.000000] RAX: 001fffff80000000 RBX: ffffffff810b6615 RCX: ffffffff810=
b661a
[    0.000000] RDX: 0000000000000000 RSI: ffffffff81c03e77 RDI: ffffffff810=
b6615
[    0.000000] RBP: 0000000000000001 R08: 0000000000000000 R09: 00000000000=
00000
[    0.000000] R10: 0000000000000000 R11: 0000000000000400 R12: ffffffff81c=
03e77
[    0.000000] R13: ffffffff810b6616 R14: ffffea0000042d80 R15: 00000000000=
00008
[    0.000000] FS:  0000000000000000(0000) GS:ffff883f7f400000(0000) knlGS:=
0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff88807ffff000 CR3: 0000000001c09000 CR4: 00000000000=
606b0
[    0.000000] Call Trace:
[    0.000000]  ? queued_spin_lock_slowpath+0x5/0x1a0
[    0.000000]  ? queued_spin_lock_slowpath+0x6/0x1a0
[    0.000000]  text_poke_bp+0x45/0xc0
[    0.000000]  ? queued_spin_lock_slowpath+0x5/0x1a0
[    0.000000]  arch_jump_label_transform+0x87/0xf0
[    0.000000]  __jump_label_update+0x72/0x80
[    0.000000]  static_key_disable_cpuslocked+0x51/0x80
[    0.000000]  static_key_disable+0x16/0x20
[    0.000000]  start_kernel+0x15a/0x45d
[    0.000000]  ? load_ucode_intel_bsp+0x11/0x2d
[    0.000000]  secondary_startup_64+0xa5/0xb0
[    0.000000] Code: 35 a9 00 e9 6c ff ff ff 48 89 df e8 c7 81 19 00 48 8d =
bb 00 10 00 00 49 89 c6 e8 b8 81 19 00 49 89 c7 e
9 90 fe ff ff 0f 0b 0f 0b <0f> ff e9 4c fe ff ff 0f 1f 44 00 00 e8 7b 45 60=
 00 41 57 49 89 =

[    0.000000] ---[ end trace c235f19da78fc7fc ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:712 =
text_poke+0x214/0x220
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W       4.14.0=
-rc5-bdw+ #5
[    0.000000] Hardware name: SGI.COM C2112-4GP3/X10DRT-P-Series, BIOS 2.0a=
 05/09/2016
[    0.000000] task: ffffffff81c0e480 task.stack: ffffffff81c00000
[    0.000000] RIP: 0010:text_poke+0x214/0x220
[    0.000000] RSP: 0000:ffffffff81c03e28 EFLAGS: 00010046 ORIG_RAX: 000000=
0000000000
[    0.000000] RAX: 001fffff80000000 RBX: ffffffff810b6616 RCX: 00000000000=
00050
[    0.000000] RDX: 0000000000000000 RSI: ffffffff81c03ea4 RDI: ffffffff810=
b6616
[    0.000000] RBP: 0000000000000004 R08: 0000000000000001 R09: 00000000000=
00000
[    0.000000] R10: 0000000000000000 R11: 0000000000000400 R12: ffffffff81c=
03ea4
[    0.000000] R13: ffffffff810b6616 R14: ffffea0000042d80 R15: 00000000000=
00008
[    0.000000] FS:  0000000000000000(0000) GS:ffff883f7f400000(0000) knlGS:=
0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff88807ffff000 CR3: 0000000001c09000 CR4: 00000000000=
606b0
[    0.000000] Call Trace:
[    0.000000]  ? queued_spin_lock_slowpath+0x5/0x1a0
[    0.000000]  ? queued_spin_lock_slowpath+0x6/0x1a0
[    0.000000]  text_poke_bp+0x6f/0xc0
[    0.000000]  ? queued_spin_lock_slowpath+0x5/0x1a0
[    0.000000]  arch_jump_label_transform+0x87/0xf0
[    0.000000]  __jump_label_update+0x72/0x80
[    0.000000]  static_key_disable_cpuslocked+0x51/0x80
[    0.000000]  static_key_disable+0x16/0x20
[    0.000000]  start_kernel+0x15a/0x45d
[    0.000000]  ? load_ucode_intel_bsp+0x11/0x2d
[    0.000000]  secondary_startup_64+0xa5/0xb0
[    0.000000] Code: 35 a9 00 e9 6c ff ff ff 48 89 df e8 c7 81 19 00 48 8d =
bb 00 10 00 00 49 89 c6 e8 b8 81 19 00 49 89 c7 e
9 90 fe ff ff 0f 0b 0f 0b <0f> ff e9 4c fe ff ff 0f 1f 44 00 00 e8 7b 45 60=
 00 41 57 49 89 =

[    0.000000] ---[ end trace c235f19da78fc7fd ]---
...

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============4367832107163139161==--


Content-Type: multipart/mixed; boundary="===============4155588108735872767=="
MIME-Version: 1.0
From: Miroslav Benes <mbenes@suse.cz>
To: lkp@lists.01.org
Subject: Re: [rcu] INFO: rcu_sched stall on CPU (30000 ticks this GP) idle=140000000000001 (t=30000 jiffies q=1)
Date: Mon, 15 Jun 2015 15:13:43 +0200
Message-ID: <alpine.LNX.2.00.1506151505520.11068@pobox.suse.cz>
In-Reply-To: <20150615124402.GA25015@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4155588108735872767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

On Mon, 15 Jun 2015, Fengguang Wu wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit ec1fe396ff42e240c9b32111ee53665c5916fe5e
> Author:     Miroslav Benes <mbenes@suse.cz>
> AuthorDate: Mon Dec 22 11:10:12 2014 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Thu Jan 15 23:33:16 2015 -0800
> =

>     rcu: Fix RCU CPU stall detection in tiny implementation
>     =

>     The tiny RCU CPU stall detection depends on *rcp->curtail not being
>     NULL. It is however a tail pointer and thus NULL by definition. Inste=
ad we
>     should check rcp->rcucblist for the presence of pending callbacks whi=
ch
>     need to be processed. With this fix INFO about the stall is printed a=
nd
>     jiffies_stall (jiffies at next stall) correctly updated.
>     =

>     Note that the check for pending callback is necessary to avoid spurio=
us
>     warnings if there are no pendings callbacks.
>     =

>     Signed-off-by: Miroslav Benes <mbenes@suse.cz>
>     [ paulmck: Fused identical "if" statements, ported to -rcu. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

This is really weird. The patch is only diagnostics and should not cause =

anything like this. I think that the real culprit is different and this =

patch only revealed it. Note that it was merged only a few months ago and =

you bisect against 2.6.39, so it is not that strange that this patch is =

the result of the bisection. Also it must be something new because =

otherwise someone would have already seen that.

Could you run the bisection again and add this rcu patch also to the =

branches where it is not present? We could find the real problem by doing =

this?

Do you agree, Paul? I might be wrong.

[...]
> =

> [  562.081441] IRQ7 -> 0:7
> [  563.699875] IRQ8 -> 0:8
> [  565.408902] IRQ9 -> 0:9
> [  566.726987] INFO: rcu_sched stall on CPU (30000 ticks this GP) idle=3D=
140000000000001 (t=3D30000 jiffies q=3D1)
> [  566.726992] CPU: 0 PID: 1 Comm: swapper Not tainted 3.19.0-rc1-00010-g=
ec1fe39 #1
> [  566.726994] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [  566.727000]  0000000000000000 ffffffff836dfed8 ffffffff8297e6d5 ffffff=
ff836dfef8
> [  566.727004]  ffffffff8112f00e 0000000000000001 0000000000000000 ffffff=
ff836dff18
> [  566.727007]  ffffffff8112fc68 ffff88000ee48010 ffff88000ee48010 ffffff=
ff836dff38
> [  566.727008] Call Trace:
> [  566.727032]  <IRQ>  [<ffffffff8297e6d5>] dump_stack+0x19/0x1b
> [  566.727041]  [<ffffffff8112f00e>] check_cpu_stall+0x8e/0xf0
> [  566.727044]  [<ffffffff8112fc68>] rcu_check_callbacks+0x28/0xa0
> [  566.727048]  [<ffffffff811353e8>] update_process_times+0x38/0x80
> [  566.727052]  [<ffffffff811471f3>] tick_periodic+0xc3/0xd0
> [  566.727055]  [<ffffffff811473d6>] ? tick_handle_periodic+0x96/0xb0
> [  566.727059]  [<ffffffff811473d6>] tick_handle_periodic+0x96/0xb0
> [  566.727063]  [<ffffffff8105705e>] local_apic_timer_interrupt+0x3e/0x70
> [  566.727068]  [<ffffffff829b672f>] smp_apic_timer_interrupt+0x3f/0x60
> [  566.727071]  [<ffffffff829b4bd0>] apic_timer_interrupt+0x70/0x80
> [  566.727077]  <EOI>  [<ffffffff8111cadd>] ? console_unlock+0x6dd/0x720
> [  566.727080]  [<ffffffff8111b0b0>] ? __down_trylock_console_sem+0x60/0x=
70
> [  566.727083]  [<ffffffff8111cf17>] ? vprintk_emit+0x3f7/0x860
> [  566.727086]  [<ffffffff8111cf4c>] vprintk_emit+0x42c/0x860
> [  566.727091]  [<ffffffff843eba0c>] ? apic_set_eoi_write+0x72/0x90
> [  566.727093]  [<ffffffff8111d56f>] vprintk_default+0x1f/0x30
> [  566.727096]  [<ffffffff8297809f>] printk+0x45/0x47
> [  566.727099]  [<ffffffff843ed13c>] print_IO_APICs+0x37a/0x3a6
> [  566.727102]  [<ffffffff8114fa00>] ? free_dma+0x70/0x80
> [  566.727104]  [<ffffffff843eba0c>] ? apic_set_eoi_write+0x72/0x90
> [  566.727107]  [<ffffffff843ebdae>] print_ICs+0x305/0x316
> [  566.727109]  [<ffffffff843ebaa9>] ? setup_show_lapic+0x7f/0x7f
> [  566.727113]  [<ffffffff843d277e>] do_one_initcall+0x1b9/0x2d6
> [  566.727117]  [<ffffffff810efd00>] ? parse_args+0x520/0x750
> [  566.727121]  [<ffffffff843d29b1>] kernel_init_freeable+0x116/0x1db
> [  566.727125]  [<ffffffff829694e0>] ? rest_init+0xd0/0xd0
> [  566.727128]  [<ffffffff829694ee>] kernel_init+0xe/0x180
> [  566.727130]  [<ffffffff829b3aba>] ret_from_fork+0x7a/0xb0
> [  566.727133]  [<ffffffff829694e0>] ? rest_init+0xd0/0xd0

Hm, something wrong in printk?

Thanks,
Miroslav

--===============4155588108735872767==--


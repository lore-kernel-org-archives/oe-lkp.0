Content-Type: multipart/mixed; boundary="===============7922487333099222907=="
MIME-Version: 1.0
From: Johan Hovold <johan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [serial] 75f4e830fa: WARNING:inconsistent_lock_state
Date: Mon, 12 Jul 2021 16:39:37 +0200
Message-ID: <YOxUKTHlLa8ViPUh@hovoldconsulting.com>
In-Reply-To: <20210712143414.GB13620@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7922487333099222907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 10:34:14PM +0800, kernel test robot wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-13):
> =

> commit: 75f4e830fa9c47637054a3b7201765f2a314bda2 ("serial: do not restore=
 interrupt state in sysrq helper")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

> [  208.007748]  Possible unsafe locking scenario:
> [  208.007748] =

> [  208.008411]        CPU0
> [  208.008682]        ----
> [  208.008955]   lock(&port_lock_key);
> [  208.009398]   <Interrupt>
> [  208.009703]     lock(&port_lock_key);
> [  208.010122] =

> [  208.010122]  *** DEADLOCK ***
> [  208.010122] =

> [  208.010790] 1 lock held by rngd/341:
> [  208.011190]  #0: ffff9e8ec0e6fd80 ((&up->timer)){+.-.}-{0:0}, at: call=
_timer_fn+0x48/0x2eb
> [  208.012101] =

> [  208.012101] stack backtrace:
> [  208.012579] CPU: 1 PID: 341 Comm: rngd Not tainted 5.12.0-rc6+ #1
> [  208.013253] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  208.014128] Call Trace:
> [  208.014406]  dump_stack+0x8b/0xdc
> [  208.014776]  mark_lock_irq+0x5b9/0x6f3
> [  208.015175]  ? stack_trace_save+0x50/0x6e
> [  208.015615]  ? save_trace+0x4d/0x30d
> [  208.016001]  mark_lock+0x121/0x1a3
> [  208.016378]  __lock_acquire+0x645/0x2ca8
> [  208.016807]  ? lockdep_unlock+0x8f/0x113
> [  208.017256]  ? __lock_acquire+0x133e/0x2ca8
> [  208.017707]  ? lock_is_held_type+0x102/0x15d
> [  208.018175]  lock_acquire+0x1a1/0x2ab
> [  208.018590]  ? serial8250_handle_irq+0x1a/0xdb
> [  208.019072]  ? serial8250_handle_irq+0x1a/0xdb
> [  208.019560]  _raw_spin_lock+0x34/0x67
> [  208.019956]  ? serial8250_handle_irq+0x1a/0xdb
> [  208.020444]  ? univ8250_console_match+0x130/0x130
> [  208.020951]  serial8250_handle_irq+0x1a/0xdb
> [  208.021444]  ? univ8250_console_match+0x130/0x130
> [  208.021950]  serial8250_default_handle_irq+0x3b/0x4a

Bah, the interrupt handler can end up being called by a timer callback
in some setups.

I'll prepare a patch.

> [  208.022492]  serial8250_timeout+0x17/0x42
> [  208.022933]  call_timer_fn+0x145/0x2eb
> [  208.023349]  ? univ8250_console_match+0x130/0x130
> [  208.023854]  run_timer_softirq+0x281/0x33e
> [  208.024308]  __do_softirq+0x28f/0x50b
> [  208.024716]  ? asm_sysvec_apic_timer_interrupt+0xa/0x20
> [  208.025389]  __irq_exit_rcu+0xb7/0xbe
> [  208.025817]  irq_exit_rcu+0x5/0x19
> [  208.026211]  sysvec_apic_timer_interrupt+0x3e/0xa3
> [  208.026781]  asm_sysvec_apic_timer_interrupt+0x12/0x20

Thanks for the report.

Johan
--===============7922487333099222907==--


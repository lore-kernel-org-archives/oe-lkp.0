Content-Type: multipart/mixed; boundary="===============6798305530898759577=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] fbd5188493: WARNING:inconsistent_lock_state
Date: Thu, 05 Jul 2018 10:58:33 +0200
Message-ID: <0ac4845e-cf6b-c5e3-a16c-f2fc457c5ef5@arm.com>
In-Reply-To: <20180705080227.GH23907@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6798305530898759577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 07/05/2018 10:02 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: fbd51884933192c9cada60628892024495942482 ("[PATCH] sched/fair: Av=
oid divide by zero when rebalancing domains")
> url: https://github.com/0day-ci/linux/commits/Matt-Fleming/sched-fair-Avo=
id-divide-by-zero-when-rebalancing-domains/20180705-024633
> =

> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G

[...]

> [    0.335612] WARNING: inconsistent lock state

I get the same on arm64 (juno r0) during boot consistently:

[    1.458414] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.462641] WARNING: inconsistent lock state
[    1.466870] 4.18.0-rc3-00016-g1b05c8317958 #2 Not tainted
[    1.472215] --------------------------------
[    1.476440] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[    1.482389] rcu_preempt/10 [HC0[0]:SC0[0]:HE1:SE1] takes:
[    1.487733] (____ptrval____) (&rq->lock){?.-.}, at: pick_next_task_fair+=
0x234/0x8e8
[    1.495342] {IN-HARDIRQ-W} state was registered at:
[    1.500174]   lock_acquire+0xc8/0x290
[    1.503802]   _raw_spin_lock+0x44/0x58
[    1.507517]   scheduler_tick+0x5c/0x118
[    1.511316]   update_process_times+0x48/0x60
[    1.515545]   tick_periodic+0x50/0x108
[    1.519256]   tick_handle_periodic+0x38/0xa8
[    1.523485]   arch_timer_handler_phys+0x3c/0x50
[    1.527973]   handle_percpu_devid_irq+0xcc/0x4a0
[    1.532543]   generic_handle_irq+0x34/0x50
[    1.536598]   __handle_domain_irq+0x68/0xc0
[    1.540738]   gic_handle_irq+0x60/0xb8
[    1.544448]   el1_irq+0xb4/0x130
[    1.547644]   start_kernel+0x34c/0x490
[    1.551353] irq event stamp: 1601
[    1.554637] hardirqs last  enabled at (1601): [<ffff000008d64764>] _raw_=
spin_unlock_irqrestore+0x74/0xa8
[    1.564026] hardirqs last disabled at (1600): [<ffff000008d64514>] _raw_=
spin_lock_irqsave+0x2c/0x70
[    1.572986] softirqs last  enabled at (0): [<ffff0000080e9c20>] copy_pro=
cess.isra.4.part.5+0x430/0x18f0
[    1.582285] softirqs last disabled at (0): [<0000000000000000>]         =
  (null)
[    1.589606] =

[    1.589606] other info that might help us debug this:
[    1.596067]  Possible unsafe locking scenario:
[    1.596067] =

[    1.601926]        CPU0
[    1.604344]        ----
[    1.606761]   lock(&rq->lock);
[    1.609788]   <Interrupt>
[    1.612377]     lock(&rq->lock);
[    1.615576] =

[    1.615576]  *** DEADLOCK ***
[    1.615576] =

[    1.621438] no locks held by rcu_preempt/10.
[    1.625661] =

[    1.625661] stack backtrace:
[    1.629977] CPU: 2 PID: 10 Comm: rcu_preempt Not tainted 4.18.0-rc3-0001=
6-g1b05c8317958 #2
[    1.638160] Hardware name: ARM Juno development board (r0) (DT)
[    1.644018] Call trace:
[    1.646439]  dump_backtrace+0x0/0x170
[    1.650063]  show_stack+0x24/0x30
[    1.653345]  dump_stack+0xac/0xe4
[    1.656625]  print_usage_bug+0x208/0x2a8
[    1.660506]  mark_lock+0x5c0/0x668
[    1.663871]  __lock_acquire+0x550/0x1990
[    1.667752]  lock_acquire+0xc8/0x290
[    1.671290]  _raw_spin_lock+0x44/0x58
[    1.674914]  pick_next_task_fair+0x234/0x8e8
[    1.679142]  __schedule+0x160/0xc40
[    1.682595]  schedule+0x50/0xc0
[    1.685702]  schedule_timeout+0x1f4/0x568
[    1.689673]  rcu_gp_kthread+0x4fc/0x860
[    1.693470]  kthread+0x100/0x130
[    1.696664]  ret_from_fork+0x10/0x1c



--===============6798305530898759577==--


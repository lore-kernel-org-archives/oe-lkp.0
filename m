Content-Type: multipart/mixed; boundary="===============2158027777658557103=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [pktgen_thread_worker] WARNING: CPU: 0 PID: 89 at kernel/sched/core.c:7094 __might_sleep()
Date: Tue, 05 Aug 2014 17:33:20 -0400
Message-ID: <CAPDOMVgd0y66hFZBPMaQ2MX6pNQP5ZQ7g1uHBY0=VEXCwwRwXw@mail.gmail.com>
In-Reply-To: <20140805141049.GD5593@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2158027777658557103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2014 at 10:10 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> Here is a pktgen error triggered by this debug check.
>
> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wait
> commit 64c2181bc433b17f04da8fe8592aa83cceac9606
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Mon Aug 4 11:14:16 2014 +0200
> Commit:     Peter Zijlstra <a.p.zijlstra@chello.nl>
> CommitDate: Mon Aug 4 13:29:59 2014 +0200
>
>     sched: Debug nested sleeps
>
>     Validate we call might_sleep() with TASK_RUNNING, which catches places
>     where we nest blocking primitives, eg. mutex usage in a wait loop.
>
>     Since all blocking is arranged through task_struct::state, nesting
>     this is going to cause two distinct issues:
>
>      - the inner primitive will set TASK_RUNNING and the outer will not
>        block
>
>      - the outer sets !TASK_RUNNING and the inner expects to be called
>        with TASK_RUNNING and blocks forever (mutex_lock).
>
>     Signed-off-by: Peter Zijlstra <peterz@infradead.org>
>     Link: http://lkml.kernel.org/n/tip-0hge361rozfbng4z2t64t217(a)git.ker=
nel.org
>
> [    1.604869] gre: GRE over IPv4 demultiplexor driver
> [    1.606178] ip_gre: GRE over IPv4 tunneling driver
> [    1.608031] ------------[ cut here ]------------
> [    1.609370] WARNING: CPU: 0 PID: 89 at kernel/sched/core.c:7094 __migh=
t_sleep+0x6f/0x1f8()
> [    1.611875] do not call blocking ops when !TASK_RUNNING; state=3D1 set=
 at [<ffffffff8153f80c>] pktgen_thread_worker.part.36+0x5/0x769
> [    1.618496] tcp_probe: probe registered (port=3D0/fwmark=3D0) bufsize=
=3D4096
> [    1.620291] Modules linked in:
> [    1.621568] CPU: 0 PID: 89 Comm: kpktgend_0 Not tainted 3.16.0-00053-g=
64c2181 #1
> [    1.624084] TCP: bic registered
> [    1.625297] TCP: cubic registered
> [    1.626488] TCP: westwood registered
> [    1.627749] TCP: highspeed registered
> [    1.629117] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    1.630928]  0000000000000000 ffff880013b53d48 ffffffff8153cc4f ffff88=
0013b53d80
> [    1.633938]  ffffffff8105fa45 ffffffff810856f3 0000000000000001 000000=
0000000000
> [    1.636942]  ffffffff81420801 00000000000000a9 ffff880013b53de0 ffffff=
ff8105faaa
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu Haswell,+smep,+smap
>         -kernel $kernel
>         -initrd $initrd
>         -m 320
>         -smp 2
>         -net nic,vlan=3D1,model=3De1000
>         -net user,vlan=3D1
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D10
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         prompt_ramdisk=3D0
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>

Hey guys,
I don't expect you to trust me after what the other developers are
calling me a troll.
But I can trace this to a few lines.
1, pr_debug("starting pktgen/%d:  pid=3D%d\n", cpu, task_pid_nr(current));

 set_current_state(TASK_INTERRUPTIBLE);

 set_freezable();
this is in the function, pktgen_thread_worker and looks somewhat suspicious.
2. I hit this lines next
167 bool set_freezable(void)
168 {
169 might_sleep();
170
171 /*
172 * Modify flags while holding freezer_lock.  This ensures the
173 * freezer notices that we aren't frozen yet or the freezing
174 * condition is visible to try_to_freeze() below.
175 */
176 spin_lock_irq(&freezer_lock);
177 current->flags &=3D ~PF_NOFREEZE;
178 spin_unlock_irq(&freezer_lock);
179
180 return try_to_freeze();
181 }
182 EXPORT_SYMBOL(set_freezable);
3. After tracing the call we hit this ,

void __might_sleep(const char *file, int line, int preempt_offset)
7044 {
7045 static unsigned long prev_jiffy; /* ratelimiting */
7046
7047 rcu_sleep_check(); /* WARN_ON_ONCE() by default, no rate limit reqd. */
7048 if ((preempt_count_equals(preempt_offset) && !irqs_disabled() &&
7049     !is_idle_task(current)) ||
7050    system_state !=3D SYSTEM_RUNNING || oops_in_progress)
7051 return;
7052 if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
7053 return;
7054 prev_jiffy =3D jiffies;
7055
7056 printk(KERN_ERR
7057 "BUG: sleeping function called from invalid context at %s:%d\n",
7058 file, line);
7059 printk(KERN_ERR
7060 "in_atomic(): %d, irqs_disabled(): %d, pid: %d, name: %s\n",
7061 in_atomic(), irqs_disabled(),
7062 current->pid, current->comm);
7063
7064 debug_show_held_locks(current);
7065 if (irqs_disabled())
7066 print_irqtrace_events(current);
7067 #ifdef CONFIG_DEBUG_PREEMPT
7068 if (!preempt_count_equals(preempt_offset)) {
7069 pr_err("Preemption disabled at:");
7070 print_ip_sym(current->preempt_disable_ip);
7071 pr_cont("\n");
7072 }
7073 #endif
7074 dump_stack();

I am new so unfortunately , this is probably wrong and bad.
Nick

--===============2158027777658557103==--


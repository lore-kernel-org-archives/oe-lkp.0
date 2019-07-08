Content-Type: multipart/mixed; boundary="===============7461093085417511850=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Mon, 08 Jul 2019 13:04:18 +0200
Message-ID: <CACT4Y+aJYy-aRCAArTEsTKSz1NPE2JONk68P67qPb=7iun3uwQ@mail.gmail.com>
In-Reply-To: <20190708105533.GH3402@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7461093085417511850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2019 at 12:55 PM Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Mon, Jul 08, 2019 at 08:47:29AM +0800, kernel test robot wrote:
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> >
> > commit 7457c0da024b181a9143988d740001f9bc98698d
> > Author:     Peter Zijlstra <peterz@infradead.org>
> > AuthorDate: Fri May 3 12:22:47 2019 +0200
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Tue Jun 25 10:23:50 2019 +0200
> >
> >     x86/alternatives: Add int3_emulate_call() selftest
> >
> >     Given that the entry_*.S changes for this functionality are somewhat
> >     tricky, make sure the paths are tested every boot, instead of on the
> >     rare occasion when we trip an INT3 while rewriting text.
> >
> >     Requested-by: Andy Lutomirski <luto@kernel.org>
> >     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >     Reviewed-by: Josh Poimboeuf <jpoimboe@redhat.com>
> >     Acked-by: Andy Lutomirski <luto@kernel.org>
> >     Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Thomas Gleixner <tglx@linutronix.de>
> >     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> >
> > faeedb0679  x86/stackframe/32: Allow int3_emulate_push()
> > 7457c0da02  x86/alternatives: Add int3_emulate_call() selftest
> > +-------------------------------------------------------+------------+-=
-----------+
> > |                                                       | faeedb0679 | =
7457c0da02 |
> > +-------------------------------------------------------+------------+-=
-----------+
> > | boot_successes                                        | 33         | =
8          |
> > | boot_failures                                         | 2          | =
4          |
> > | WARNING:possible_circular_locking_dependency_detected | 2          | =
           |
> > | BUG:KASAN:unknown-crash_in_u                          | 0          | =
4          |
> > +-------------------------------------------------------+------------+-=
-----------+
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> >
> > [    0.726834] CPU: GenuineIntel Intel Core Processor (Haswell) (family=
: 0x6, model: 0x3c, stepping: 0x1)
> > [    0.728007] Spectre V2 : Spectre mitigation: kernel not compiled wit=
h retpoline; no mitigation available!
> > [    0.728009] Speculative Store Bypass: Vulnerable
> > [    0.729969] MDS: Vulnerable: Clear CPU buffers attempted, no microco=
de
> > [    0.732269] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    0.733186] BUG: KASAN: unknown-crash in unwind_next_frame+0x3f6/0x4=
90
>
> This is a bit of a puzzle; I'm not sure what KASAN is trying to tell us
> here, also isn't the unwinder expected to go off into the weeds at times
> and 'expected' to cope with that? I'm also very much unsure how the
> fingered commit would lead to this, the below splat is in a lockdep
> unwind from completely unrealted code (pageattr).
>
> Josh, Andrey, any clues?

+kasan-dev(a)googlegroups.com

Frame pointer unwinder is supposed to be precise for the current task,
it should not touch random memory. This is thoroughly tested. If we
start giving up on this property, we will open door for lots of bugs.
Don't know about ORC, I guess it also meant to be precise, but we just
never stressed it.
I don't see what unwinder is involved here.


> > [    0.734146] Read of size 8 at addr ffffffff84007db0 by task swapper/0
> > [    0.734963]
> > [    0.735168] CPU: 0 PID: 0 Comm: swapper Tainted: G                T =
5.2.0-rc6-00013-g7457c0d #1
> > [    0.736266] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [    0.737374] Call Trace:
> > [    0.737697]  dump_stack+0x19/0x1b
> > [    0.738129]  print_address_description+0x1b0/0x2b2
> > [    0.738745]  ? unwind_next_frame+0x3f6/0x490
> > [    0.739370]  __kasan_report+0x10f/0x171
> > [    0.739959]  ? unwind_next_frame+0x3f6/0x490
> > [    0.739959]  kasan_report+0x12/0x1c
> > [    0.739959]  __asan_load8+0x54/0x81
> > [    0.739959]  unwind_next_frame+0x3f6/0x490
> > [    0.739959]  ? unwind_dump+0x24e/0x24e
> > [    0.739959]  unwind_next_frame+0x1b/0x23
> > [    0.739959]  ? create_prof_cpu_mask+0x20/0x20
> > [    0.739959]  arch_stack_walk+0x68/0xa5
> > [    0.739959]  ? set_memory_4k+0x2a/0x2c
> > [    0.739959]  stack_trace_save+0x7b/0xa0
> > [    0.739959]  ? stack_trace_consume_entry+0x89/0x89
> > [    0.739959]  save_trace+0x3c/0x93
> > [    0.739959]  mark_lock+0x1ef/0x9b1
> > [    0.739959]  ? sched_clock_local+0x86/0xa6
> > [    0.739959]  __lock_acquire+0x3ba/0x1bea
> > [    0.739959]  ? __asan_loadN+0xf/0x11
> > [    0.739959]  ? mark_held_locks+0x8e/0x8e
> > [    0.739959]  ? mark_lock+0xb4/0x9b1
> > [    0.739959]  ? sched_clock_local+0x86/0xa6
> > [    0.739959]  lock_acquire+0x122/0x221
> > [    0.739959]  ? _vm_unmap_aliases+0x141/0x183
> > [    0.739959]  __mutex_lock+0xb6/0x731
> > [    0.739959]  ? _vm_unmap_aliases+0x141/0x183
> > [    0.739959]  ? sched_clock_cpu+0xac/0xb1
> > [    0.739959]  ? __mutex_add_waiter+0xae/0xae
> > [    0.739959]  ? lock_downgrade+0x368/0x368
> > [    0.739959]  ? _vm_unmap_aliases+0x40/0x183
> > [    0.739959]  mutex_lock_nested+0x16/0x18
> > [    0.739959]  _vm_unmap_aliases+0x141/0x183
> > [    0.739959]  ? _vm_unmap_aliases+0x40/0x183
> > [    0.739959]  vm_unmap_aliases+0x14/0x16
> > [    0.739959]  change_page_attr_set_clr+0x15e/0x2f2
> > [    0.739959]  ? __set_pages_p+0x111/0x111
> > [    0.739959]  ? alternative_instructions+0xd8/0x118
> > [    0.739959]  ? arch_init_ideal_nops+0x181/0x181
> > [    0.739959]  set_memory_4k+0x2a/0x2c
> > [    0.739959]  check_bugs+0x11fd/0x1298
> > [    0.739959]  ? l1tf_cmdline+0x1dc/0x1dc
> > [    0.739959]  ? proc_create_single_data+0x5f/0x6e
> > [    0.739959]  ? cgroup_init+0x2b1/0x2f6
> > [    0.739959]  start_kernel+0x793/0x7eb
> > [    0.739959]  ? thread_stack_cache_init+0x2e/0x2e
> > [    0.739959]  ? idt_setup_early_handler+0x70/0xb1
> > [    0.739959]  x86_64_start_reservations+0x55/0x76
> > [    0.739959]  x86_64_start_kernel+0x87/0xaa
> > [    0.739959]  secondary_startup_64+0xa4/0xb0
> > [    0.739959]
> > [    0.739959] Memory state around the buggy address:
> > [    0.739959]  ffffffff84007c80: 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 f1 f1 f1
> > [    0.739959]  ffffffff84007d00: f1 00 00 00 00 00 00 00 00 00 f2 f2 f=
2 f3 f3 f3
> > [    0.739959] >ffffffff84007d80: f3 79 be 52 49 79 be 00 00 00 00 00 0=
0 00 00 f1

--===============7461093085417511850==--


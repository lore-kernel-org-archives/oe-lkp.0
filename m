Content-Type: multipart/mixed; boundary="===============9149418351515192579=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 11:28:15 -0500
Message-ID: <20171003162815.2eatamg4h3tpsypl@treble>
In-Reply-To: <20171003150538.57dq7xe6afikpzyp@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============9149418351515192579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 10:05:38AM -0500, Josh Poimboeuf wrote:
> I don't know the lockdep code, but one more comment from the peanut
> gallery.  This code looks suspect to me:
> =

> =

> 			/*
> 			 * Stop saving stack_trace if save_trace() was
> 			 * called at least once:
> 			 */
> 			if (save && ret =3D=3D 2)
> 				save =3D NULL;
> =

> =

> From looking at check_prev_add(), a return value of 2 doesn't
> necessarily imply that save_trace() was called.  If the
> check_redundant() call returns 0, then check_prev_add() can return 2,
> and the trace will still be uninitialized, but save will be set to NULL
> even though save_trace() hasn't been called.  Then a subsequent call to
> check_prev_add() could add an uninitialized stack_trace struct to the
> dependency list.
> =

> I could be wrong, but it's at least something the lockdep folks might
> want to look at.

[ Different manifestations of this bug have been discussed in several
  different threads.  Bringing partipants from those threads onto CC. ]

So, looking at the actual panic:

  BUG: unable to handle kernel NULL pointer dereference at 000001f2
  IP: update_stack_state+0xd4/0x340
  *pde =3D 00000000 =

  =

  Oops: 0000 [#1] PREEMPT SMP
  CPU: 0 PID: 18728 Comm: 01-cpu-hotplug Not tainted 4.13.0-rc4-00170-gb09b=
e67 #592
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-2016102=
5_171302-gandalf 04/01/2014
  task: bb0b53c0 task.stack: bb3ac000
  EIP: update_stack_state+0xd4/0x340
  EFLAGS: 00010002 CPU: 0
  EAX: 0000a570 EBX: bb3adccb ECX: 0000f401 EDX: 0000a570
  ESI: 00000001 EDI: 000001ba EBP: bb3adc6b ESP: bb3adc3f
   DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
  CR0: 80050033 CR2: 000001f2 CR3: 0b3a7000 CR4: 00140690
  DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
  DR6: fffe0ff0 DR7: 00000400
  Call Trace:
   ? unwind_next_frame+0xea/0x400
   ? __unwind_start+0xf5/0x180
   ? __save_stack_trace+0x81/0x160
   ? save_stack_trace+0x20/0x30
   ? __lock_acquire+0xfa5/0x12f0
   ? lock_acquire+0x1c2/0x230
   ? tick_periodic+0x3a/0xf0
   ? _raw_spin_lock+0x42/0x50
   ? tick_periodic+0x3a/0xf0
   ? tick_periodic+0x3a/0xf0
   ? debug_smp_processor_id+0x12/0x20
   ? tick_handle_periodic+0x23/0xc0
   ? local_apic_timer_interrupt+0x63/0x70
   ? smp_trace_apic_timer_interrupt+0x235/0x6a0
   ? trace_apic_timer_interrupt+0x37/0x3c
   ? strrchr+0x23/0x50
  Code: 0f 95 c1 89 c7 89 45 e4 0f b6 c1 89 c6 89 45 dc 8b 04 85 98 cb 74 b=
c 88 4d e3 89 45 f0 83 c0 01 84 c9 89 04 b5 98 cb 74 bc 74 3b <8b> 47 38 8b=
 57 34 c6 43 1d 01 25 00 00 02 00 83 e2 03 09 d0 83
  EIP: update_stack_state+0xd4/0x340 SS:ESP: 0068:bb3adc3f
  CR2: 00000000000001f2
  ---[ end trace 0d147fd4aba8ff50 ]---
  Kernel panic - not syncing: Fatal exception in interrupt

There are two bugs:

1) Somebody -- presumably lockdep -- is corrupting the stack.  Need the
   lockdep people to look at that.

2) The 32-bit FP unwinder isn't handling the corrupt stack very well,
   It's blindly dereferencing untrusted data:

	/* Is the next frame pointer an encoded pointer to pt_regs? */
	regs =3D decode_frame_pointer(next_bp);
	if (regs) {
		frame =3D (unsigned long *)regs;
		len =3D regs_size(regs);
		state->got_irq =3D true;

  On 32-bit, regs_size() dereferences the regs pointer before we know it
  points to a valid stack.  I'll fix that, along with the other unwinder
  improvements I discussed with Linus.

-- =

Josh

--===============9149418351515192579==--


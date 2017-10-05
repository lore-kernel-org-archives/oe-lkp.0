Content-Type: multipart/mixed; boundary="===============2041104187210930033=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 05 Oct 2017 20:02:33 +0900
Message-ID: <201710052002.HIH12957.JOFFSMOVFHLOtQ@I-love.SAKURA.ne.jp>
In-Reply-To: <20171004224008.3gbwuzn3zfwpidh3@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============2041104187210930033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Josh Poimboeuf wrote:
> On Wed, Oct 04, 2017 at 06:44:50AM +0900, Tetsuo Handa wrote:
> > Josh Poimboeuf wrote:
> > > On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> > > > There are two bugs:
> > > > =

> > > > 1) Somebody -- presumably lockdep -- is corrupting the stack.  Need=
 the
> > > >    lockdep people to look at that.
> > > > =

> > > > 2) The 32-bit FP unwinder isn't handling the corrupt stack very wel=
l,
> > > >    It's blindly dereferencing untrusted data:
> > > > =

> > > > 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> > > > 	regs =3D decode_frame_pointer(next_bp);
> > > > 	if (regs) {
> > > > 		frame =3D (unsigned long *)regs;
> > > > 		len =3D regs_size(regs);
> > > > 		state->got_irq =3D true;
> > > > =

> > > >   On 32-bit, regs_size() dereferences the regs pointer before we kn=
ow it
> > > >   points to a valid stack.  I'll fix that, along with the other unw=
inder
> > > >   improvements I discussed with Linus.
> > > =

> > > Tetsuo and/or Fengguang,
> > > =

> > > Would you mind testing with this patch?  It should at least prevent t=
he
> > > unwinder panic and should hopefully print a useful unwinder dump
> > > instead.
> > > =

> > Here are two outputs.
> =

> Tetsuo, would you mind trying the following patch?
> =

Here are two outputs. Same kernel with different host hardware.

[    6.406040] io scheduler noop registered
[    6.406971] io scheduler deadline registered (default)
[    6.432992] io scheduler cfq registered
[    6.433275] io scheduler mq-deadline registered
[    6.433905] io scheduler kyber registered
[    6.557705] WARNING: kernel stack regs at f60bbe5c in swapper:1 has bad =
'bp' value 00000001
[    6.557705] unwind stack type:0 next_sp:  (null) mask:0x2 graph_idx:0
[    6.557705] f60bbd04: f60bbd54 (0xf60bbd54)
[    6.557705] f60bbd08: c1020d6f (__save_stack_trace+0x6f/0xd0)
[    6.557705] f60bbd0c: f60bbd54 (0xf60bbd54)
[    6.557705] f60bbd10: 000c8040 (0xc8040)
[    6.557705] f60bbd14: 00000000 ...
[    6.557705] f60bbd18: f60ba000 (0xf60ba000)
[    6.557705] f60bbd1c: f60bc000 (0xf60bc000)
[    6.557705] f60bbd20: 00000000 ...
[    6.557705] f60bbd24: 00000002 (0x2)
[    6.557705] f60bbd28: f60c8040 (0xf60c8040)
[    6.557705] f60bbd2c: 00000000 ...
[    6.557705] f60bbd30: 00000101 (0x101)
[    6.557705] f60bbd34: 00000000 ...
[    6.557705] f60bbd38: f60bbd04 (0xf60bbd04)
[    6.557705] f60bbd3c: c133a73d (atomic64_add_unless_cx8+0x21/0x38)
[    6.557705] f60bbd40: f60bbe5c (0xf60bbe5c)
[    6.557705] f60bbd44: 08e6d238 (0x8e6d238)
[    6.557705] f60bbd48: 000371e0 (0x371e0)
[    6.557705] f60bbd4c: d3eb9d15 (0xd3eb9d15)
[    6.557705] f60bbd50: f60c8040 (0xf60c8040)
[    6.557705] f60bbd54: f60bbd60 (0xf60bbd60)
[    6.557705] f60bbd58: c1020dea (save_stack_trace+0x1a/0x20)
[    6.557705] f60bbd5c: 00000000 ...
[    6.557705] f60bbd60: f60bbdc4 (0xf60bbdc4)
[    6.557705] f60bbd64: c1072676 (__lock_acquire+0xb56/0x1110)
[    6.557705] f60bbd68: 00000000 ...
[    6.557705] f60bbd6c: c1d86c44 (tk_core+0x4/0xf8)
[    6.557705] f60bbd70: f60bbd8c (0xf60bbd8c)
[    6.557705] f60bbd74: c106ee3c (find_held_lock+0x2c/0xa0)
[    6.557705] f60bbd78: 00000001 (0x1)
[    6.557705] f60bbd7c: f60c8438 (0xf60c8438)
[    6.557705] f60bbd80: f60c8040 (0xf60c8040)
[    6.557705] f60bbd84: c1d86c44 (tk_core+0x4/0xf8)
[    6.557705] f60bbd88: d3eb9d15 (0xd3eb9d15)
[    6.557705] f60bbd8c: c19b82f0 (chainhash_table+0x18ff0/0x20000)
[    6.557705] f60bbd90: 21c04619 (0x21c04619)
[    6.557705] f60bbd94: 00000001 (0x1)
[    6.557705] f60bbd98: f60c8438 (0xf60c8438)
[    6.557705] f60bbd9c: 000063fc (0x63fc)
[    6.557705] f60bbda0: 00000000 ...
[    6.557705] f60bbda8: 08e6d238 (0x8e6d238)
[    6.557705] f60bbdac: 00200046 (0x200046)
[    6.557705] f60bbdb0: f60bbdb8 (0xf60bbdb8)
[    6.557705] f60bbdb4: 08e6d238 (0x8e6d238)
[    6.557705] f60bbdb8: f60c8040 (0xf60c8040)
[    6.557705] f60bbdbc: c14e6670 (hrtimer_bases+0x10/0x100)
[    6.557705] f60bbdc0: 00000000 ...
[    6.557705] f60bbdc4: f60bbdf8 (0xf60bbdf8)
[    6.557705] f60bbdc8: c107338a (lock_acquire+0x7a/0xa0)
[    6.557705] f60bbdcc: 00000000 ...
[    6.557705] f60bbdd0: 00000001 (0x1)
[    6.557705] f60bbdd4: 00000001 (0x1)
[    6.557705] f60bbdd8: 00000000 ...
[    6.557705] f60bbddc: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    6.557705] f60bbde0: 00000000 ...
[    6.557705] f60bbde8: 00200046 (0x200046)
[    6.557705] f60bbdec: c14e6660 (hrtimer_debug_descr+0x20/0x20)
[    6.557705] f60bbdf0: 00000003 (0x3)
[    6.557705] f60bbdf4: 00000000 ...
[    6.557705] f60bbdf8: f60bbe14 (0xf60bbe14)
[    6.557705] f60bbdfc: c1341d63 (_raw_spin_lock+0x33/0x40)
[    6.557705] f60bbe00: 00000000 ...
[    6.557705] f60bbe04: 00000001 (0x1)
[    6.557705] f60bbe08: 00000000 ...
[    6.557705] f60bbe0c: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    6.557705] f60bbe10: 00000000 ...
[    6.557705] f60bbe14: f60bbe40 (0xf60bbe40)
[    6.557705] f60bbe18: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    6.557705] f60bbe1c: 00000000 ...
[    6.557705] f60bbe20: 00000003 (0x3)
[    6.557705] f60bbe24: f60bbec8 (0xf60bbec8)
[    6.557705] f60bbe28: f60bbe54 (0xf60bbe54)
[    6.557705] f60bbe2c: c10904eb (hrtimer_interrupt+0xbb/0x1c0)
[    6.557705] f60bbe30: c14e6758 (hrtimer_bases+0xf8/0x100)
[    6.557705] f60bbe34: 00200046 (0x200046)
[    6.557705] f60bbe38: f60bbec8 (0xf60bbec8)
[    6.557705] f60bbe3c: 00000000 ...
[    6.557705] f60bbe40: f60bbe54 (0xf60bbe54)
[    6.557705] f60bbe44: c13435b4 (smp_apic_timer_interrupt+0x44/0x80)
[    6.557705] f60bbe48: c1000f2f (trace_hardirqs_off_thunk+0xc/0x1d)
[    6.557705] f60bbe4c: 000000e0 (0xe0)
[    6.557705] f60bbe50: c001d00e (0xc001d00e)
[    6.557705] f60bbe54: 760bbe5c (0x760bbe5c)
[    6.557705] f60bbe58: c1342e81 (apic_timer_interrupt+0x41/0x48)
[    6.557705] f60bbe5c: c001d00e (0xc001d00e)
[    6.557705] f60bbe60: aaa31337 (0xaaa31337)
[    6.557705] f60bbe64: aaa31337 (0xaaa31337)
[    6.557705] f60bbe68: f60bbec8 (0xf60bbec8)
[    6.557705] f60bbe6c: 00000000 ...
[    6.557705] f60bbe70: 00000001 (0x1)
[    6.557705] f60bbe74: c001d00d (0xc001d00d)
[    6.557705] f60bbe78: 0000007b (0x7b)
[    6.557705] f60bbe7c: 0000007b (0x7b)
[    6.557705] f60bbe80: 00000000 ...
[    6.557705] f60bbe84: 000000e0 (0xe0)
[    6.557705] f60bbe88: ffffff10 (0xffffff10)
[    6.557705] f60bbe8c: c133a73d (atomic64_add_unless_cx8+0x21/0x38)
[    6.557705] f60bbe90: 00000060 (0x60)
[    6.557705] f60bbe94: 002002c2 (0x2002c2)
[    6.557705] f60bbe98: deafcafe (0xdeafcafe)
[    6.557705] f60bbe9c: deadbeef (0xdeadbeef)
[    6.557705] f60bbea0: c001d00d (0xc001d00d)
[    6.557705] f60bbea4: f60bbee4 (0xf60bbee4)
[    6.557705] f60bbea8: c154c837 (test_atomic64+0x1f15/0x2064)
[    6.557705] f60bbeac: 0000007b (0x7b)
[    6.557705] f60bbeb0: 00000000 ...
[    6.557705] f60bbeb4: 000000e0 (0xe0)
[    6.557705] f60bbeb8: ffffff10 (0xffffff10)
[    6.557705] f60bbebc: c154a805 (test_atomic+0xbd9/0xcf6)
[    6.557705] f60bbec0: deafcafe (0xdeafcafe)
[    6.557705] f60bbec4: deadbeef (0xdeadbeef)
[    6.557705] f60bbec8: c001d00e (0xc001d00e)
[    6.557705] f60bbecc: aaa31337 (0xaaa31337)
[    6.557705] f60bbed0: c145ec9e (.LC7+0x69b7/0x391d8)
[    6.557705] f60bbed4: 08e6d238 (0x8e6d238)
[    6.557705] f60bbed8: c154c986 (test_atomic64+0x2064/0x2064)
[    6.557705] f60bbedc: 00000006 (0x6)
[    6.557705] f60bbee0: 00000000 ...
[    6.557705] f60bbee4: f60bbefc (0xf60bbefc)
[    6.557705] f60bbee8: c154c996 (test_atomics_init+0x10/0x4d)
[    6.557705] f60bbeec: f60bbefc (0xf60bbefc)
[    6.557705] f60bbef0: c15498fa (crc_t10dif_mod_init+0x14/0x53)
[    6.557705] f60bbef4: 08e6d238 (0x8e6d238)
[    6.557705] f60bbef8: c154c986 (test_atomic64+0x2064/0x2064)
[    6.557705] f60bbefc: f60bbf70 (0xf60bbf70)
[    6.557705] f60bbf00: c1000470 (do_one_initcall+0x40/0x17a)
[    6.557705] f60bbf04: f60bbf14 (0xf60bbf14)
[    6.557705] f60bbf08: c152a650 (repair_env_string+0x12/0x51)
[    6.557705] f60bbf0c: c14b8a94 (__param_emulate_3button+0x14/0x14)
[    6.557705] f60bbf10: c152a63e (set_debug_rodata+0xf/0xf)
[    6.557705] f60bbf14: f60bbf70 (0xf60bbf70)
[    6.557705] f60bbf18: c105e9e0 (parse_args+0x220/0x3e0)
[    6.557705] f60bbf1c: 00000000 ...
[    6.557705] f60bbf24: 760bbf3c (0x760bbf3c)
[    6.557705] f60bbf28: c1000f1f (trace_hardirqs_on_thunk+0xc/0x10)
[    6.557705] f60bbf2c: f60c8040 (0xf60c8040)
[    6.557705] f60bbf30: 00000000 ...
[    6.557705] f60bbf34: 00060006 (0x60006)
[    6.557705] f60bbf38: 00000000 ...
[    6.557705] f60bbf3c: c152a63e (set_debug_rodata+0xf/0xf)
[    6.557705] f60bbf40: c14b7db0 (x86_hyper_kvm+0x18/0x18)
[    6.557705] f60bbf44: c1482238 (.LC7+0x29f51/0x391d8)
[    6.557705] f60bbf48: f77fdbf0 (0xf77fdbf0)
[    6.557705] f60bbf4c: 00000200 (0x200)
[    6.557705] f60bbf50: f77fdbfe (0xf77fdbfe)
[    6.557705] f60bbf54: f77fdbe8 (0xf77fdbe8)
[    6.557705] f60bbf58: f77fdbf0 (0xf77fdbf0)
[    6.557705] f60bbf5c: 08e6d238 (0x8e6d238)
[    6.557705] f60bbf60: 08e6d238 (0x8e6d238)
[    6.557705] f60bbf64: c159d66c (__initcall_test_atomics_init6+0x4/0x4)
[    6.557705] f60bbf68: 00000006 (0x6)
[    6.557705] f60bbf6c: 000000a5 (0xa5)
[    6.557705] f60bbf70: f60bbf98 (0xf60bbf98)
[    6.557705] f60bbf74: c152ad84 (kernel_init_freeable+0xf4/0x186)
[    6.557705] f60bbf78: 000000a5 (0xa5)
[    6.557705] f60bbf7c: 00000006 (0x6)
[    6.557705] f60bbf80: 00000006 (0x6)
[    6.557705] f60bbf84: 00000000 ...
[    6.557705] f60bbf88: c152a63e (set_debug_rodata+0xf/0xf)
[    6.557705] f60bbf8c: c133c0d0 (rest_init+0xd0/0xd0)
[    6.557705] f60bbf90: 00000000 ...
[    6.557705] f60bbf98: f60bbfac (0xf60bbfac)
[    6.557705] f60bbf9c: c133c0db (kernel_init+0xb/0xf0)
[    6.557705] f60bbfa0: f60bbfac (0xf60bbfac)
[    6.557705] f60bbfa4: c1342511 (schedule_tail_wrapper+0x9/0xc)
[    6.557705] f60bbfa8: c14c5dc0 (cpu_loops_per_jiffy+0x38/0x38)
[    6.557705] f60bbfac: 00000000 ...
[    6.557705] f60bbfb0: c134252d (ret_from_fork+0x19/0x24)
[    6.557705] f60bbfb4: 00000000 ...
[    6.585626] atomic64_test: passed for i586+ platform with CX8 and with S=
SE
[    6.704834] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    6.710650] ACPI: Power Button [PWRF]
[    6.773959] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    6.809210] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    6.901913] Non-volatile memory driver v1.3
[    6.909764] Linux agpgart interface v0.103
[    6.955967] rdac: device handler registered
[    6.960868] hp_sw: device handler registered
[    6.961143] emc: device handler registered
[    6.966146] alua: device handler registered
[    6.975668] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x6=
0,0x64 irq 1,12
[    6.992053] serio: i8042 KBD port at 0x60,0x64 irq 1
[    6.994638] serio: i8042 AUX port at 0x60,0x64 irq 12
[    7.018788] mousedev: PS/2 mouse device common for all mice



[    3.193750] io scheduler noop registered
[    3.193992] io scheduler deadline registered (default)
[    3.209702] io scheduler cfq registered
[    3.209926] io scheduler mq-deadline registered
[    3.210047] io scheduler kyber registered
[    3.260891] atomic64_test: passed for i586+ platform with CX8 and with S=
SE
[    3.304700] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    3.309880] ACPI: Power Button [PWRF]
[    3.334798] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    3.364646] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    3.412718] Non-volatile memory driver v1.3
[    3.417854] Linux agpgart interface v0.103
[    3.444024] rdac: device handler registered
[    3.447445] WARNING: kernel stack regs at f59b7f74 in kthreadd:29 has ba=
d 'bp' value   (null)
[    3.447445] unwind stack type:0 next_sp:  (null) mask:0x2 graph_idx:0
[    3.447445] f59b7e1c: f59b7e6c (0xf59b7e6c)
[    3.447445] f59b7e20: c1020d6f (__save_stack_trace+0x6f/0xd0)
[    3.447445] f59b7e24: f59b7e6c (0xf59b7e6c)
[    3.447445] f59b7e28: 00000008 (0x8)
[    3.447445] f59b7e2c: 00000000 ...
[    3.447445] f59b7e30: f59b6000 (0xf59b6000)
[    3.447445] f59b7e34: f59b8000 (0xf59b8000)
[    3.447445] f59b7e38: 00000000 ...
[    3.447445] f59b7e3c: 00000002 (0x2)
[    3.447445] f59b7e40: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7e44: 00000000 ...
[    3.447445] f59b7e48: 00000101 (0x101)
[    3.447445] f59b7e4c: 00000000 ...
[    3.447445] f59b7e50: f59b7e1c (0xf59b7e1c)
[    3.447445] f59b7e54: c105efe0 (kthread_create_on_node+0x30/0x30)
[    3.447445] f59b7e58: f59b7f74 (0xf59b7f74)
[    3.447445] f59b7e5c: 2b95399d (0x2b95399d)
[    3.447445] f59b7e60: 00000001 (0x1)
[    3.447445] f59b7e64: d3eb9d15 (0xd3eb9d15)
[    3.447445] f59b7e68: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7e6c: f59b7e78 (0xf59b7e78)
[    3.447445] f59b7e70: c1020dea (save_stack_trace+0x1a/0x20)
[    3.447445] f59b7e74: 00000000 ...
[    3.447445] f59b7e78: f59b7edc (0xf59b7edc)
[    3.447445] f59b7e7c: c1072676 (__lock_acquire+0xb56/0x1110)
[    3.447445] f59b7e80: f59b7ec8 (0xf59b7ec8)
[    3.447445] f59b7e84: 00000000 ...
[    3.447445] f59b7e8c: f59b6000 (0xf59b6000)
[    3.447445] f59b7e90: f59b8000 (0xf59b8000)
[    3.447445] f59b7e94: 00000000 ...
[    3.447445] f59b7e98: 00000002 (0x2)
[    3.447445] f59b7e9c: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7ea0: d3eb9d15 (0xd3eb9d15)
[    3.447445] f59b7ea4: c19b82f0 (chainhash_table+0x18ff0/0x20000)
[    3.447445] f59b7ea8: 21c04619 (0x21c04619)
[    3.447445] f59b7eac: 00000001 (0x1)
[    3.447445] f59b7eb0: f61b3f38 (0xf61b3f38)
[    3.447445] f59b7eb4: 000063fc (0x63fc)
[    3.447445] f59b7eb8: 00000000 ...
[    3.447445] f59b7ec0: e7c80e95 (0xe7c80e95)
[    3.447445] f59b7ec4: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7ec8: f59b7ed4 (0xf59b7ed4)
[    3.447445] f59b7ecc: 2b95399d (0x2b95399d)
[    3.447445] f59b7ed0: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7ed4: c14e6670 (hrtimer_bases+0x10/0x100)
[    3.447445] f59b7ed8: 00000000 ...
[    3.447445] f59b7edc: f59b7f10 (0xf59b7f10)
[    3.447445] f59b7ee0: c107338a (lock_acquire+0x7a/0xa0)
[    3.447445] f59b7ee4: 00000000 ...
[    3.447445] f59b7ee8: 00000001 (0x1)
[    3.447445] f59b7eec: 00000001 (0x1)
[    3.447445] f59b7ef0: 00000000 ...
[    3.447445] f59b7ef4: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    3.447445] f59b7ef8: 00000000 ...
[    3.447445] f59b7f00: 00200046 (0x200046)
[    3.447445] f59b7f04: c14e6660 (hrtimer_debug_descr+0x20/0x20)
[    3.447445] f59b7f08: 00000003 (0x3)
[    3.447445] f59b7f0c: f595c440 (0xf595c440)
[    3.447445] f59b7f10: f59b7f2c (0xf59b7f2c)
[    3.447445] f59b7f14: c1341d63 (_raw_spin_lock+0x33/0x40)
[    3.447445] f59b7f18: 00000000 ...
[    3.447445] f59b7f1c: 00000001 (0x1)
[    3.447445] f59b7f20: 00000000 ...
[    3.447445] f59b7f24: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    3.447445] f59b7f28: 00000000 ...
[    3.447445] f59b7f2c: f59b7f58 (0xf59b7f58)
[    3.447445] f59b7f30: c1090469 (hrtimer_interrupt+0x39/0x1c0)
[    3.447445] f59b7f34: f61b3b40 (0xf61b3b40)
[    3.447445] f59b7f38: c1341f52 (_raw_spin_unlock_irq+0x22/0x30)
[    3.447445] f59b7f3c: 00000102 (0x102)
[    3.447445] f59b7f40: f59b7f58 (0xf59b7f58)
[    3.447445] f59b7f44: c10717ac (trace_hardirqs_on_caller+0xec/0x180)
[    3.447445] f59b7f48: 00200046 (0x200046)
[    3.447445] f59b7f4c: 00200046 (0x200046)
[    3.447445] f59b7f50: 00000000 ...
[    3.447445] f59b7f54: f595c440 (0xf595c440)
[    3.447445] f59b7f58: f59b7f6c (0xf59b7f6c)
[    3.447445] f59b7f5c: c13435b4 (smp_apic_timer_interrupt+0x44/0x80)
[    3.447445] f59b7f60: c1000f2f (trace_hardirqs_off_thunk+0xc/0x1d)
[    3.447445] f59b7f64: 000000e0 (0xe0)
[    3.447445] f59b7f68: c105efe0 (kthread_create_on_node+0x30/0x30)
[    3.447445] f59b7f6c: 759b7f74 (0x759b7f74)
[    3.447445] f59b7f70: c1342e81 (apic_timer_interrupt+0x41/0x48)
[    3.447445] f59b7f74: c105efe0 (kthread_create_on_node+0x30/0x30)
[    3.447445] f59b7f78: 00000001 (0x1)
[    3.447445] f59b7f7c: 00000001 (0x1)
[    3.447445] f59b7f80: 00000000 ...
[    3.447445] f59b7f84: f595c440 (0xf595c440)
[    3.447445] f59b7f88: 00000000 ...
[    3.447445] f59b7f8c: f595c440 (0xf595c440)
[    3.447445] f59b7f90: 0000007b (0x7b)
[    3.447445] f59b7f94: 0000007b (0x7b)
[    3.447445] f59b7f98: 00000000 ...
[    3.447445] f59b7f9c: 000000e0 (0xe0)
[    3.447445] f59b7fa0: ffffff10 (0xffffff10)
[    3.447445] f59b7fa4: c105efe0 (kthread_create_on_node+0x30/0x30)
[    3.447445] f59b7fa8: 00000060 (0x60)
[    3.447445] f59b7fac: 00200282 (0x200282)
[    3.447445] f59b7fb0: c134252d (ret_from_fork+0x19/0x24)
[    3.447445] f59b7fb4: 00000000 ...
[    3.458703] hp_sw: device handler registered
[    3.459042] emc: device handler registered
[    3.464120] alua: device handler registered
[    3.470099] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x6=
0,0x64 irq 1,12
[    3.484179] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.486939] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.504879] mousedev: PS/2 mouse device common for all mice

--===============2041104187210930033==--


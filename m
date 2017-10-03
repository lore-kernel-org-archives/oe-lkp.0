Content-Type: multipart/mixed; boundary="===============6590873379139239555=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 06:44:50 +0900
Message-ID: <201710040644.GJE89219.FOHMFSFOVtOQLJ@I-love.SAKURA.ne.jp>
In-Reply-To: <20171003173402.hq4aviy5hztgauyt@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============6590873379139239555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Josh Poimboeuf wrote:
> On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> > There are two bugs:
> > =

> > 1) Somebody -- presumably lockdep -- is corrupting the stack.  Need the
> >    lockdep people to look at that.
> > =

> > 2) The 32-bit FP unwinder isn't handling the corrupt stack very well,
> >    It's blindly dereferencing untrusted data:
> > =

> > 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> > 	regs =3D decode_frame_pointer(next_bp);
> > 	if (regs) {
> > 		frame =3D (unsigned long *)regs;
> > 		len =3D regs_size(regs);
> > 		state->got_irq =3D true;
> > =

> >   On 32-bit, regs_size() dereferences the regs pointer before we know it
> >   points to a valid stack.  I'll fix that, along with the other unwinder
> >   improvements I discussed with Linus.
> =

> Tetsuo and/or Fengguang,
> =

> Would you mind testing with this patch?  It should at least prevent the
> unwinder panic and should hopefully print a useful unwinder dump
> instead.
> =

Here are two outputs.

[    0.550226] ACPI: bus type PCI registered
[    0.551118] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.564798] PCI: PCI BIOS revision 2.10 entry at 0xfd54b, last bus=3D0
[    0.565121] PCI: Using configuration type 1 for base access
[    0.757556] ACPI: Added _OSI(Module Device)
[    0.757720] ACPI: Added _OSI(Processor Device)
[    0.758094] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.758234] ACPI: Added _OSI(Processor Aggregator Device)
[    1.203043] ACPI: Interpreter enabled
[    1.205699] ACPI: (supports S0 S5)
[    1.207264] ACPI: Using IOAPIC for interrupt routing
[    1.209000] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    1.234458] ACPI: Enabled 16 GPEs in block 00 to 0F
[    1.275000] WARNING: kernel stack regs at f60bb9c8 in swapper:1 has bad =
'bp' value 0ba00000
[    1.275000] unwind stack type:0 next_sp:  (null) mask:0x2 graph_idx:0
[    1.275000] f60bb9c8: 0bba19f6 (0xbba19f6)
[    1.275000] f60bb9cc: 020d4bf6 (0x20d4bf6)
[    1.275000] f60bb9d0: 0bba19c1 (0xbba19c1)
[    1.275000] f60bb9d4: 0000e1f6 (0xe1f6)
[    1.275000] f60bb9d8: 00000000 ...
[    1.275000] f60bb9dc: 0ba00000 (0xba00000)
[    1.275000] f60bb9e0: 0bc000f6 (0xbc000f6)
[    1.275000] f60bb9e4: 000000f6 (0xf6)
[    1.275000] f60bb9e8: 00000200 (0x200)
[    1.275000] f60bb9ec: 0c804000 (0xc804000)
[    1.275000] f60bb9f0: 000000f6 (0xf6)
[    1.275000] f60bb9f4: 00010100 (0x10100)
[    1.275000] f60bb9f8: 00000000 ...
[    1.275000] f60bb9fc: 0bb9c800 (0xbb9c800)
[    1.275000] f60bba00: 000000f6 (0xf6)
[    1.275000] f60bba04: 0bb9c800 (0xbb9c800)
[    1.275000] f60bba08: e6d238f6 (0xe6d238f6)
[    1.275000] f60bba0c: 00e12a08 (0xe12a08)
[    1.275000] f60bba10: 78122b00 (0x78122b00)
[    1.275000] f60bba14: 0c8040c7 (0xc8040c7)
[    1.275000] f60bba18: 0bba25f6 (0xbba25f6)
[    1.275000] f60bba1c: 020deaf6 (0x20deaf6)
[    1.275000] f60bba20: 000000c1 (0xc1)
[    1.275000] f60bba24: 0bba8900 (0xbba8900)
[    1.275000] f60bba28: 072696f6 (0x72696f6)
[    1.275000] f60bba2c: 000000c1 (0xc1)
[    1.275000] f60bba30: 00000008 (0x8)
[    1.275000] f60bba34: f60bbae0 (0xf60bbae0)
[    1.275000] f60bba38: f60bbe6c (0xf60bbe6c)
[    1.275000] f60bba3c: 08e6d238 (0x8e6d238)
[    1.275000] f60bba40: 00000002 (0x2)
[    1.275000] f60bba44: 00000001 (0x1)
[    1.275000] f60bba48: f6000690 (0xf6000690)
[    1.275000] f60bba4c: 78122b68 (0x78122b68)
[    1.275000] f60bba50: 9b43ccc7 (0x9b43ccc7)
[    1.275000] f60bba54: a9bcbec1 (0xa9bcbec1)
[    1.275000] f60bba58: 0000017b (0x17b)
[    1.275000] f60bba5c: 0c845800 (0xc845800)
[    1.275000] f60bba60: 005433f6 (0x5433f6)
[    1.275000] f60bba64: 00000100 (0x100)
[    1.275000] f60bba68: f60bba00 (0xf60bba00)
[    1.275000] f60bba6c: 00200046 (0x200046)
[    1.275000] f60bba70: f60bba80 (0xf60bba80)
[    1.275000] f60bba74: f60c8458 (0xf60c8458)
[    1.275000] f60bba78: e6d2385a (0xe6d2385a)
[    1.275000] f60bba7c: 0c804008 (0xc804008)
[    1.275000] f60bba80: 4e6d28f6 (0x4e6d28f6)
[    1.275000] f60bba84: 000000c1 (0xc1)
[    1.275000] f60bba88: 0bbabd00 (0xbbabd00)
[    1.275000] f60bba8c: 0733aaf6 (0x733aaf6)
[    1.275000] f60bba90: 000000c1 (0xc1)
[    1.275000] f60bba94: 00000100 (0x100)
[    1.275000] f60bba98: 00000100 (0x100)
[    1.275000] f60bba9c: 00000000 ...
[    1.275000] f60bbaa0: 09d84200 (0x9d84200)
[    1.275000] f60bbaa4: 000000c1 (0xc1)
[    1.275000] f60bbaa8: 00000000 ...
[    1.275000] f60bbaac: 20004600 (0x20004600)
[    1.275000] f60bbab0: 4e6d1800 (0x4e6d1800)
[    1.275000] f60bbab4: ffffffc1 (0xffffffc1)
[    1.275000] f60bbab8: ffffffff (0xffffffff)
[    1.275000] f60bbabc: 0bbad97f (0xbbad97f)
[    1.275000] f60bbac0: 341d83f6 (0x341d83f6)
[    1.275000] f60bbac4: 000000c1 (0xc1)
[    1.275000] f60bbac8: 00000100 (0x100)
[    1.275000] f60bbacc: 00000000 ...
[    1.275000] f60bbad0: 09d84200 (0x9d84200)
[    1.275000] f60bbad4: 4da8c0c1 (0x4da8c0c1)
[    1.275000] f60bbad8: 0bbaf1c1 (0xbbaf1c1)
[    1.275000] f60bbadc: 09d842f6 (0x9d842f6)
[    1.275000] f60bbae0: f60bbac1 (0xf60bbac1)
[    1.275000] f60bbae4: c1020dea (save_stack_trace+0x1a/0x20)
[    1.275000] f60bbae8: 00000000 ...
[    1.275000] f60bbaec: f60bbb10 (0xf60bbb10)
[    1.275000] f60bbaf0: 0bbb0959 (0xbbb0959)
[    1.275000] f60bbaf4: 09d8e6f6 (0x9d8e6f6)
[    1.275000] f60bbaf8: 000000c1 (0xc1)
[    1.275000] f60bbafc: 00000003 (0x3)
[    1.275000] f60bbb00: 17f00c00 (0x17f00c00)
[    1.275000] f60bbb04: 1791c9f6 (0x1791c9f6)
[    1.275000] f60bbb08: 0bbb1df6 (0xbbb1df6)
[    1.275000] f60bbb0c: 343594f6 (0x343594f6)
[    1.275000] f60bbb10: 000f2fc1 (0xf2fc1)
[    1.275000] f60bbb14: 0000e0c1 (0xe0c1)
[    1.275000] f60bbb18: 00000000 ...
[    1.275000] f60bbb1c: 0bbb2500 (0xbbb2500)
[    1.275000] f60bbb20: 342e8ef6 (0x342e8ef6)
[    1.275000] f60bbb24: 000000c1 (0xc1)
[    1.275000] f60bbb28: 00000000 ...
[    1.275000] f60bbb2c: 17f00400 (0x17f00400)
[    1.275000] f60bbb30: 17f00cf6 (0x17f00cf6)
[    1.275000] f60bbb34: 1791c9f6 (0x1791c9f6)
[    1.275000] f60bbb38: 0bbb70f6 (0xbbb70f6)
[    1.275000] f60bbb3c: 1791c8f6 (0x1791c8f6)
[    1.275000] f60bbb40: 00007bf6 (0x7bf6)
[    1.275000] f60bbb44: 00007b00 (0x7b00)
[    1.275000] f60bbb48: 00000000 ...
[    1.275000] f60bbb4c: 0000e000 (0xe000)
[    1.275000] f60bbb50: ffff1000 (0xffff1000)
[    1.275000] f60bbb54: 24a2bcff (0x24a2bcff)
[    1.275000] f60bbb58: 000060c1 (0x60c1)
[    1.275000] f60bbb5c: 20029300 (0x20029300)
[    1.275000] f60bbb60: 00010400 (0x10400)
[    1.275000] f60bbb64: f61791c0 (0xf61791c0)
[    1.275000] f60bbb68: 00000003 (0x3)
[    1.275000] f60bbb6c: 00000019 (0x19)
[    1.275000] f60bbb70: f60bbba4 (0xf60bbba4)
[    1.275000] f60bbb74: c1249de7 (acpi_rs_convert_aml_to_resource+0x249/0x=
411)
[    1.275000] f60bbb78: 00000019 (0x19)
[    1.275000] f60bbb7c: 0000000c (0xc)
[    1.275000] f60bbb80: 0000000d (0xd)
[    1.275000] f60bbb84: 05010340 (0x5010340)
[    1.275000] f60bbb88: f617f008 (0xf617f008)
[    1.275000] f60bbb8c: f61791c8 (0xf61791c8)
[    1.275000] f60bbb90: 0001000d (0x1000d)
[    1.275000] f60bbb94: c14f4d14 (acpi_rs_convert_general_flags+0x4/0x18)
[    1.275000] f60bbb98: f61791c0 (0xf61791c0)
[    1.275000] f60bbb9c: f617f008 (0xf617f008)
[    1.275000] f60bbba0: 00000006 (0x6)
[    1.275000] f60bbba4: f60bbbb4 (0xf60bbbb4)
[    1.275000] f60bbba8: c1249155 (acpi_rs_get_address_common+0x1f/0x4f)
[    1.275000] f60bbbac: f61791c0 (0xf61791c0)
[    1.275000] f60bbbb0: 00000000 ...
[    1.275000] f60bbbb4: f60bbbe4 (0xf60bbbe4)
[    1.275000] f60bbbb8: c1249e6c (acpi_rs_convert_aml_to_resource+0x2ce/0x=
411)
[    1.275000] f60bbbbc: 0000000c (0xc)
[    1.275000] f60bbbc0: 0000000d (0xd)
[    1.275000] f60bbbc4: 030000c0 (0x30000c0)
[    1.275000] f60bbbc8: f617f008 (0xf617f008)
[    1.275000] f60bbbcc: f61791c0 (0xf61791c0)
[    1.275000] f60bbbd0: 0000000d (0xd)
[    1.275000] f60bbbd4: c14f4d6c (acpi_rs_convert_address16+0x8/0x14)
[    1.275000] f60bbbd8: f61791c0 (0xf61791c0)
[    1.275000] f60bbbdc: f617f008 (0xf617f008)
[    1.275000] f60bbbe0: f60bbc44 (0xf60bbc44)
[    1.275000] f60bbbe4: f60bbbfc (0xf60bbbfc)
[    1.275000] f60bbbe8: c1249a5e (acpi_rs_convert_aml_to_resources+0x82/0x=
b6)
[    1.275000] f60bbbec: 00000018 (0x18)
[    1.275000] f60bbbf0: f617f008 (0xf617f008)
[    1.275000] f60bbbf4: c12499dc (acpi_rs_create_aml_resources+0x62/0x62)
[    1.275000] f60bbbf8: f60bbc44 (0xf60bbc44)
[    1.275000] f60bbbfc: f60bbc30 (0xf60bbc30)
[    1.275000] f60bbc00: c124f8a6 (acpi_ut_walk_aml_resources+0x88/0x100)
[    1.275000] f60bbc04: 00000018 (0x18)
[    1.275000] f60bbc08: f60bbc44 (0xf60bbc44)
[    1.275000] f60bbc0c: 00000000 ...
[    1.275000] f60bbc10: 00000010 (0x10)
[    1.275000] f60bbc14: f617f076 (0xf617f076)
[    1.275000] f60bbc18: 00000000 ...
[    1.275000] f60bbc1c: 00791824 (0x791824)
[    1.275000] f60bbc20: 08e6d238 (0x8e6d238)
[    1.275000] f60bbc24: f617f008 (0xf617f008)
[    1.275000] f60bbc28: 0000006e (0x6e)
[    1.275000] f60bbc2c: f60bbc74 (0xf60bbc74)
[    1.275000] f60bbc30: f60bbc58 (0xf60bbc58)
[    1.275000] f60bbc34: c1249762 (acpi_rs_create_resource_list+0x5c/0x77)
[    1.275000] f60bbc38: c12499dc (acpi_rs_create_aml_resources+0x62/0x62)
[    1.275000] f60bbc3c: f60bbc44 (0xf60bbc44)
[    1.275000] f60bbc40: 000000e0 (0xe0)
[    1.275000] f60bbc44: f61791c0 (0xf61791c0)
[    1.275000] f60bbc48: 08e6d238 (0x8e6d238)
[    1.275000] f60bbc4c: f60bbc74 (0xf60bbc74)
[    1.275000] f60bbc50: c1228ed0 (acpi_dev_resource_interrupt+0xf0/0xf0)
[    1.275000] f60bbc54: f60bbca0 (0xf60bbca0)
[    1.275000] f60bbc58: f60bbc6c (0xf60bbc6c)
[    1.275000] f60bbc5c: c124a57a (acpi_rs_get_method_data+0x32/0x54)
[    1.275000] f60bbc60: f6081d28 (0xf6081d28)
[    1.275000] f60bbc64: 08e6d238 (0x8e6d238)
[    1.275000] f60bbc68: 00000000 ...
[    1.275000] f60bbc6c: f60bbc8c (0xf60bbc8c)
[    1.275000] f60bbc70: c124a991 (acpi_walk_resources+0x5b/0x99)
[    1.275000] f60bbc74: 000000e0 (0xe0)
[    1.275000] f60bbc78: f61791c0 (0xf61791c0)
[    1.275000] f60bbc7c: 08e6d238 (0x8e6d238)
[    1.275000] f60bbc80: f60bbd04 (0xf60bbd04)
[    1.275000] f60bbc84: f60c2ba0 (0xf60c2ba0)
[    1.275000] f60bbc88: c146ac61 (.LC7+0x1299a/0x391d8)
[    1.275000] f60bbc8c: f60bbcc4 (0xf60bbcc4)
[    1.275000] f60bbc90: c1228c2a (__acpi_dev_get_resources+0x9a/0xd0)
[    1.275000] f60bbc94: f60bbca0 (0xf60bbca0)
[    1.275000] f60bbc98: f60bbd00 (0xf60bbd00)
[    1.275000] f60bbc9c: c1225690 (acpi_dma_deconfigure+0x10/0x10)
[    1.275000] f60bbca0: f60bbd04 (0xf60bbd04)
[    1.275000] f60bbca4: c1225690 (acpi_dma_deconfigure+0x10/0x10)
[    1.275000] f60bbca8: f60bbd00 (0xf60bbd00)
[    1.275000] f60bbcac: 00000000 ...
[    1.275000] f60bbcb4: 08e6d238 (0x8e6d238)
[    1.275000] f60bbcb8: f60bbd00 (0xf60bbd00)
[    1.275000] f60bbcbc: f60bbd04 (0xf60bbd04)
[    1.275000] f60bbcc0: f60c2bdc (0xf60c2bdc)
[    1.275000] f60bbcc4: f60bbcd8 (0xf60bbcd8)
[    1.275000] f60bbcc8: c1228c7a (acpi_dev_get_resources+0x1a/0x20)
[    1.275000] f60bbccc: f60bbd00 (0xf60bbd00)
[    1.275000] f60bbcd0: c146ac61 (.LC7+0x1299a/0x391d8)
[    1.275000] f60bbcd4: f60c2ba0 (0xf60c2ba0)
[    1.275000] f60bbcd8: f60bbd24 (0xf60bbd24)
[    1.275000] f60bbcdc: c1226e0d (acpi_init_device_object+0x2ed/0x640)
[    1.275000] f60bbce0: f60bbd00 (0xf60bbd00)
[    1.275000] f60bbce4: c1227199 (acpi_add_single_object+0x39/0x5c0)
[    1.275000] f60bbce8: 00000000 ...
[    1.275000] f60bbcf0: f60c2bf0 (0xf60c2bf0)
[    1.275000] f60bbcf4: f60bbd0f (0xf60bbd0f)
[    1.275000] f60bbcf8: f60724e8 (0xf60724e8)
[    1.275000] f60bbcfc: f60720d8 (0xf60720d8)
[    1.275000] f60bbd00: f617f200 (0xf617f200)
[    1.275000] f60bbd04: f60bbd04 (0xf60bbd04)
[    1.275000] f60bbd08: f60bbd04 (0xf60bbd04)
[    1.275000] f60bbd0c: 500c2ba0 (0x500c2ba0)
[    1.275000] f60bbd10: 00304943 (0x304943)
[    1.275000] f60bbd14: 08e6d238 (0x8e6d238)
[    1.275000] f60bbd18: f60c2ba0 (0xf60c2ba0)
[    1.275000] f60bbd1c: 00000000 ...
[    1.275000] f60bbd24: f60bbd7c (0xf60bbd7c)
[    1.275000] f60bbd28: c12271bc (acpi_add_single_object+0x5c/0x5c0)
[    1.275000] f60bbd2c: 0000000f (0xf)
[    1.275000] f60bbd30: 00000000 ...
[    1.275000] f60bbd38: f60bbd6c (0xf60bbd6c)
[    1.275000] f60bbd3c: c121fae5 (acpi_evaluate_integer+0x45/0x90)
[    1.275000] f60bbd40: f60bbda0 (0xf60bbda0)
[    1.275000] f60bbd44: f60724e8 (0xf60724e8)
[    1.275000] f60bbd48: f60bbd4c (0xf60bbd4c)
[    1.275000] f60bbd4c: c106dc55 (up+0x25/0x40)
[    1.275000] f60bbd50: 00000010 (0x10)
[    1.275000] f60bbd54: ffffffff (0xffffffff)
[    1.275000] f60bbd58: 00000000 ...
[    1.275000] f60bbd5c: c121f4de (acpi_os_signal_semaphore+0x2e/0x40)
[    1.275000] f60bbd60: 08e6d238 (0x8e6d238)
[    1.275000] f60bbd64: f60bbda8 (0xf60bbda8)
[    1.275000] f60bbd68: f60724e8 (0xf60724e8)
[    1.275000] f60bbd6c: 08e6d238 (0x8e6d238)
[    1.275000] f60bbd70: f60bbe7c (0xf60bbe7c)
[    1.275000] f60bbd74: f60724e8 (0xf60724e8)
[    1.275000] f60bbd78: 00000000 ...
[    1.275000] f60bbd7c: f60bbe04 (0xf60bbe04)
[    1.275000] f60bbd80: c12277df (acpi_bus_check_add+0xbf/0x3e0)
[    1.275000] f60bbd84: 0000000f (0xf)
[    1.275000] f60bbd88: 00000000 ...
[    1.275000] f60bbd8c: f60c8438 (0xf60c8438)
[    1.275000] f60bbd90: 00000000 ...
[    1.275000] f60bbd94: f60c8040 (0xf60c8040)
[    1.275000] f60bbd98: f60bbdb4 (0xf60bbdb4)
[    1.275000] f60bbd9c: c10716bd (mark_held_locks+0x5d/0x80)
[    1.275000] f60bbda0: 00000000 ...
[    1.275000] f60bbda4: 00000006 (0x6)
[    1.275000] f60bbda8: 0000000f (0xf)
[    1.275000] f60bbdac: 00000000 ...
[    1.275000] f60bbdb0: f60720d8 (0xf60720d8)
[    1.275000] f60bbdb4: f60bbdcc (0xf60bbdcc)
[    1.275000] f60bbdb8: c10717cc (trace_hardirqs_on_caller+0xec/0x180)
[    1.275000] f60bbdbc: 00200046 (0x200046)
[    1.275000] f60bbdc0: 00000001 (0x1)
[    1.275000] f60bbdc4: 00200286 (0x200286)
[    1.275000] f60bbdc8: f60183e8 (0xf60183e8)
[    1.275000] f60bbdcc: f60bbdd4 (0xf60bbdd4)
[    1.275000] f60bbdd0: c107186b (trace_hardirqs_on+0xb/0x10)
[    1.275000] f60bbdd4: f60bbde4 (0xf60bbde4)
[    1.275000] f60bbdd8: 00200286 (0x200286)
[    1.275000] f60bbddc: f60183e8 (0xf60183e8)
[    1.275000] f60bbde0: 00000000 ...
[    1.275000] f60bbde4: f60bbdf4 (0xf60bbdf4)
[    1.275000] f60bbde8: c106dc55 (up+0x25/0x40)
[    1.275000] f60bbdec: 00000010 (0x10)
[    1.275000] f60bbdf0: f60c8040 (0xf60c8040)
[    1.275000] f60bbdf4: 08e6d238 (0x8e6d238)
[    1.275000] f60bbdf8: f60724e8 (0xf60724e8)
[    1.275000] f60bbdfc: 00000000 ...
[    1.275000] f60bbe00: f60720d8 (0xf60720d8)
[    1.275000] f60bbe04: f60bbe38 (0xf60bbe38)
[    1.275000] f60bbe08: c124657e (acpi_ns_walk_namespace+0xb1/0x161)
[    1.275000] f60bbe0c: f60bbe7c (0xf60bbe7c)
[    1.275000] f60bbe10: 00000000 ...
[    1.275000] f60bbe18: ffffffff (0xffffffff)
[    1.275000] f60bbe1c: 00000001 (0x1)
[    1.275000] f60bbe20: 00000000 ...
[    1.275000] f60bbe28: 00000002 (0x2)
[    1.275000] f60bbe2c: 00000000 ...
[    1.275000] f60bbe30: ffffffff (0xffffffff)
[    1.275000] f60bbe34: ffffffff (0xffffffff)
[    1.275000] f60bbe38: f60bbe64 (0xf60bbe64)
[    1.275000] f60bbe3c: c1246a51 (acpi_walk_namespace+0x68/0x99)
[    1.275000] f60bbe40: 00000001 (0x1)
[    1.275000] f60bbe44: c1227720 (acpi_add_single_object+0x5c0/0x5c0)
[    1.275000] f60bbe48: 00000000 ...
[    1.275000] f60bbe50: f60bbe7c (0xf60bbe7c)
[    1.275000] f60bbe54: 00000000 ...
[    1.275000] f60bbe58: ffffffff (0xffffffff)
[    1.275000] f60bbe5c: f60bbe7c (0xf60bbe7c)
[    1.275000] f60bbe60: f60bbef0 (0xf60bbef0)
[    1.275000] f60bbe64: f60bbe8c (0xf60bbe8c)
[    1.275000] f60bbe68: c1227b7f (acpi_bus_scan+0x7f/0x90)
[    1.275000] f60bbe6c: c1227720 (acpi_add_single_object+0x5c0/0x5c0)
[    1.275000] f60bbe70: 00000000 ...
[    1.275000] f60bbe78: f60bbe7c (0xf60bbe7c)
[    1.275000] f60bbe7c: f60c22e8 (0xf60c22e8)
[    1.275000] f60bbe80: 08e6d238 (0x8e6d238)
[    1.275000] f60bbe84: 00000000 ...
[    1.275000] f60bbe88: 00000004 (0x4)
[    1.275000] f60bbe8c: f60bbeb4 (0xf60bbeb4)
[    1.275000] f60bbe90: c154f5ca (acpi_scan_init+0xee/0x234)
[    1.275000] f60bbe94: 08e6d238 (0x8e6d238)
[    1.275000] f60bbe98: 00000000 ...
[    1.275000] f60bbea4: 08e6d238 (0x8e6d238)
[    1.275000] f60bbea8: 00000000 ...
[    1.275000] f60bbeac: 00000004 (0x4)
[    1.275000] f60bbeb0: f60bbef0 (0xf60bbef0)
[    1.275000] f60bbeb4: f60bbefc (0xf60bbefc)
[    1.275000] f60bbeb8: c154f2c3 (acpi_init+0x2cb/0x325)
[    1.275000] f60bbebc: 00000000 ...
[    1.275000] f60bbec4: f60bbee8 (0xf60bbee8)
[    1.275000] f60bbec8: c154db65 (fb_console_init+0xd8/0x112)
[    1.275000] f60bbecc: f60720d8 (0xf60720d8)
[    1.275000] f60bbed0: 00000001 (0x1)
[    1.275000] f60bbed4: 0000009e (0x9e)
[    1.275000] f60bbed8: c14f3f60 (acpi_bus_type+0x60/0x60)
[    1.275000] f60bbedc: 00000001 (0x1)
[    1.275000] f60bbee0: 00000008 (0x8)
[    1.275000] f60bbee4: f60bbed0 (0xf60bbed0)
[    1.275000] f60bbee8: ffffffff (0xffffffff)
[    1.275000] f60bbeec: 00000000 ...
[    1.275000] f60bbef0: 08e6d238 (0x8e6d238)
[    1.275000] f60bbef4: c154eff8 (acpi_sleep_proc_init+0x22/0x22)
[    1.275000] f60bbef8: 00000000 ...
[    1.275000] f60bbefc: f60bbf70 (0xf60bbf70)
[    1.275000] f60bbf00: c1000470 (do_one_initcall+0x40/0x17a)
[    1.275000] f60bbf04: f60bbf14 (0xf60bbf14)
[    1.275000] f60bbf08: c152a650 (repair_env_string+0x12/0x51)
[    1.275000] f60bbf0c: c14b8a94 (__param_emulate_3button+0x14/0x14)
[    1.275000] f60bbf10: c152a63e (set_debug_rodata+0xf/0xf)
[    1.275000] f60bbf14: f60bbf70 (0xf60bbf70)
[    1.275000] f60bbf18: c105ea00 (parse_args+0x220/0x3e0)
[    1.275000] f60bbf1c: 00000000 ...
[    1.275000] f60bbf20: c14de700 (usermodehelper_table+0x80/0x80)
[    1.275000] f60bbf24: 00000001 (0x1)
[    1.275000] f60bbf28: f60bbf54 (0xf60bbf54)
[    1.275000] f60bbf2c: 00200246 (0x200246)
[    1.275000] f60bbf30: 00000000 ...
[    1.275000] f60bbf34: 00040004 (0x40004)
[    1.275000] f60bbf38: 00000000 ...
[    1.275000] f60bbf3c: c152a63e (set_debug_rodata+0xf/0xf)
[    1.275000] f60bbf40: c14b7db0 (x86_hyper_kvm+0x18/0x18)
[    1.275000] f60bbf44: c1435dc6 (inat_primary_table+0xa2fe6/0xab72c)
[    1.275000] f60bbf48: f77fdbf0 (0xf77fdbf0)
[    1.275000] f60bbf4c: 00000200 (0x200)
[    1.275000] f60bbf50: f77fdbfe (0xf77fdbfe)
[    1.275000] f60bbf54: f77fdbe8 (0xf77fdbe8)
[    1.275000] f60bbf58: f77fdbf0 (0xf77fdbf0)
[    1.275000] f60bbf5c: 08e6d238 (0x8e6d238)
[    1.275000] f60bbf60: 08e6d238 (0x8e6d238)
[    1.275000] f60bbf64: c159d45c (__initcall_acpi_init4+0x4/0x4)
[    1.275000] f60bbf68: 00000004 (0x4)
[    1.275000] f60bbf6c: 000000a5 (0xa5)
[    1.275000] f60bbf70: f60bbf98 (0xf60bbf98)
[    1.275000] f60bbf74: c152ad84 (kernel_init_freeable+0xf4/0x186)
[    1.275000] f60bbf78: 000000a5 (0xa5)
[    1.275000] f60bbf7c: 00000004 (0x4)
[    1.275000] f60bbf80: 00000004 (0x4)
[    1.275000] f60bbf84: 00000000 ...
[    1.275000] f60bbf88: c152a63e (set_debug_rodata+0xf/0xf)
[    1.275000] f60bbf8c: c133c0f0 (rest_init+0xd0/0xd0)
[    1.275000] f60bbf90: 00000000 ...
[    1.275000] f60bbf98: f60bbfac (0xf60bbfac)
[    1.275000] f60bbf9c: c133c0fb (kernel_init+0xb/0xf0)
[    1.275000] f60bbfa0: f60bbfac (0xf60bbfac)
[    1.275000] f60bbfa4: c1342531 (schedule_tail_wrapper+0x9/0xc)
[    1.275000] f60bbfa8: c14c5dc0 (cpu_loops_per_jiffy+0x38/0x38)
[    1.275000] f60bbfac: 00000000 ...
[    1.275000] f60bbfb0: c134254d (ret_from_fork+0x19/0x24)
[    1.275000] f60bbfb4: 00000000 ...
[    1.882726] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.884121] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MS=
I]
[    1.886852] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
[    1.887000] acpi PNP0A03:00: fail to add MMCONFIG information, can't acc=
ess extended PCI configuration space under this bridge.



[    0.504000] ACPI: bus type PCI registered
[    0.505223] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.515000] PCI: PCI BIOS revision 2.10 entry at 0xfd54b, last bus=3D0
[    0.515131] PCI: Using configuration type 1 for base access
[    0.682659] ACPI: Added _OSI(Module Device)
[    0.682810] ACPI: Added _OSI(Processor Device)
[    0.682917] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.683000] ACPI: Added _OSI(Processor Aggregator Device)
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#1] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bba97 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bba6b ESP: f60bba47
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#2] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bb86f ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bb813 ESP: f60bb7ef
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#3] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bb617 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bb5bb ESP: f60bb597
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#4] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bb3bf ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bb363 ESP: f60bb33f
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#5] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bb167 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bb10b ESP: f60bb0e7
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#6] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60baf0f ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60baeb3 ESP: f60bae8f
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#7] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60bacb7 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60bac5b ESP: f60bac37
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#8] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60baa5f ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60baa03 ESP: f60ba9df
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#9] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60ba807 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60ba7ab ESP: f60ba787
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Oops: 0000 [#10] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60ba5af ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60ba553 ESP: f60ba52f
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Thread overran stack, or stack corrupted
[    0.789000] Oops: 0000 [#11] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60ba357 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60ba2fb ESP: f60ba2d7
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Thread overran stack, or stack corrupted
[    0.789000] Oops: 0000 [#12] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60ba0ff ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60ba0a3 ESP: f60ba07f
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000] BUG: unable to handle kernel NULL pointer dereference at   (=
null)
[    0.789000] IP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] *pde =3D 00000000
[    0.789000] Thread overran stack, or stack corrupted
[    0.789000] Oops: 0000 [#13] DEBUG_PAGEALLOC
[    0.789000] Modules linked in:
[    0.789000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc3+ #170
[    0.789000] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[    0.789000] task: f60c8040 task.stack: f60ba000
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0
[    0.789000] EFLAGS: 00200046 CPU: 0
[    0.789000] EAX: 00000000 EBX: f60b9ea7 ECX: 00000000 EDX: f60bbfa0
[    0.789000] ESI: f60c8040 EDI: f60bbfac EBP: f60b9e4b ESP: f60b9e27
[    0.789000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[    0.789000] CR0: 80050033 CR2: 00000000 CR3: 015aa000 CR4: 000006d0
[    0.789000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.789000] DR6: 00000000 DR7: 00000000
[    0.789000] Call Trace:
[    0.789000]  ? __kernel_text_address+0xb/0x30
[    0.789000]  ? check_bytes_and_report+0x1e/0xf0
[    0.789000]  ? check_object+0x209/0x250
[    0.789000]  ? __free_slab+0x72/0x190
[    0.789000]  ? free_slab+0xe/0x20
[    0.789000]  ? __slab_free+0x346/0x400
[    0.789000]  ? acpi_os_release_object+0x8/0x10
[    0.789000]  ? __debug_check_no_obj_freed+0xed/0x1b0
[    0.789000]  ? kmem_cache_free+0x10d/0x160
[    0.789000]  ? acpi_os_release_object+0x8/0x10
[    0.789000]  ? acpi_os_release_object+0x8/0x10
[    0.789000]  ? acpi_os_release_object+0x8/0x10
[    0.789000]  ? acpi_ps_free_op+0x1a/0x1c
[    0.789000]  ? acpi_ps_delete_parse_tree+0x24/0x4b
[    0.789000]  ? acpi_ds_execute_arguments+0x93/0x115
[    0.789000]  ? acpi_ds_get_package_arguments+0x3f/0x4a
[    0.789000]  ? acpi_ns_init_one_object+0xb8/0x116
[    0.789000]  ? acpi_ns_walk_namespace+0xb1/0x161
[    0.789000]  ? acpi_walk_namespace+0x68/0x99
[    0.789000]  ? acpi_ns_exec_module_code_list+0x135/0x135
[    0.789000]  ? acpi_ns_initialize_objects+0x33/0x67
[    0.789000]  ? acpi_ns_exec_module_code_list+0x135/0x135
[    0.789000]  ? acpi_initialize_objects+0x2e/0x4e
[    0.789000]  ? acpi_sleep_proc_init+0x22/0x22
[    0.789000]  ? acpi_init+0xca/0x325
[    0.789000]  ? fb_console_init+0xd8/0x112
[    0.789000]  ? fbmem_init+0xb8/0xd6
[    0.789000]  ? acpi_sleep_proc_init+0x22/0x22
[    0.789000]  ? do_one_initcall+0x40/0x17a
[    0.789000]  ? repair_env_string+0x12/0x51
[    0.789000]  ? set_debug_rodata+0xf/0xf
[    0.789000]  ? parse_args+0x220/0x3e0
[    0.789000]  ? set_debug_rodata+0xf/0xf
[    0.789000]  ? kernel_init_freeable+0xf4/0x186
[    0.789000]  ? set_debug_rodata+0xf/0xf
[    0.789000]  ? rest_init+0xd0/0xd0
[    0.789000]  ? kernel_init+0xb/0xf0
[    0.789000]  ? schedule_tail_wrapper+0x9/0xc
[    0.789000]  ? ret_from_fork+0x19/0x24
[    0.789000] Code: 03 0f 85 db fe ff ff 8b 45 f0 c7 43 20 00 00 00 00 c7 =
43 28 00 00 00 00 89 43 2c 83 c4 18 b8 01 00 00 00 5b 5e 5f 5d c3 8d 76 00 =
<8b> 31 e9 fa fe ff ff 80 3d 58 bd 51 c1 00 75 83 89 74 24 10 8b
[    0.789000] EIP: unwind_next_frame.part.5+0x168/0x1f0 SS:ESP: 0068:f60b9=
e27
[    0.789000] CR2: 0000000000000000
[    0.789000] ---[ end trace 4fa7c6fbde147f19 ]---
[    0.789000] Kernel panic - not syncing: Fatal exception in interrupt

--===============6590873379139239555==--


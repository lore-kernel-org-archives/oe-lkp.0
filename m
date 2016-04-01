Content-Type: multipart/mixed; boundary="===============6237391365515538205=="
MIME-Version: 1.0
From: Toshi Kani <toshi.kani@hpe.com>
To: lkp@lists.01.org
Subject: Re: [x86/mtrr] edfe63ec97: kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 01 Apr 2016 13:44:40 -0600
Message-ID: <1459539880.3085.32.camel@hpe.com>
In-Reply-To: <877fgigh9t.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6237391365515538205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-04-01 at 11:05 +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
> commit edfe63ec97ed8d4496225f7ba54c9ce4207c5431 ("x86/mtrr: Fix Xorg
> crashes in Qemu sessions")
> =

> =

> [=C2=A0=C2=A0=C2=A010.429879] hgafb: HGA card not detected.
> [=C2=A0=C2=A0=C2=A010.430521] hgafb: probe of hgafb.0 failed with error -=
22
> [=C2=A0=C2=A0=C2=A010.434199] ------------[ cut here ]------------
> [=C2=A0=C2=A0=C2=A010.434889] kernel BUG at arch/x86/mm/physaddr.c:79!
> [=C2=A0=C2=A0=C2=A010.435784] invalid opcode: 0000 [#1] DEBUG_PAGEALLOC=
=C2=A0
> [=C2=A0=C2=A0=C2=A010.436627] CPU: 0 PID: 117 Comm: v86d Not tainted 4.6.=
0-rc1-00015-
> gedfe63e #1
> [=C2=A0=C2=A0=C2=A010.437696] Hardware name: QEMU Standard PC (i440FX + P=
IIX, 1996),
> BIOS Debian-1.8.2-1 04/01/2014
> [=C2=A0=C2=A0=C2=A010.438929] task: cf91d900 ti: cf8fa000 task.ti: cf8fa0=
00
> [=C2=A0=C2=A0=C2=A010.439664] EIP: 0060:[<c1033290>] EFLAGS: 00010206 CPU=
: 0
> [=C2=A0=C2=A0=C2=A010.440409] EIP is at __phys_addr+0x80/0x90
> [=C2=A0=C2=A0=C2=A010.441022] EAX: 13fe0000 EBX: 13fe0000 ECX: 00000000 E=
DX: 13fe0000
> [=C2=A0=C2=A0=C2=A010.441975] ESI: 00000000 EDI: 00000000 EBP: cf8fbe4c E=
SP: cf8fbe48
> [=C2=A0=C2=A0=C2=A010.442804]=C2=A0=C2=A0DS: 007b ES: 007b FS: 0000 GS: 0=
0e0 SS: 0068
> [=C2=A0=C2=A0=C2=A010.443534] CR0: 80050033 CR2: 08063e48 CR3: 0f9f8f20 C=
R4: 000006b0
> [=C2=A0=C2=A0=C2=A010.444362] Stack:
> [=C2=A0=C2=A0=C2=A010.444772]=C2=A0=C2=A0cf9e4dfc cf8fbe60 c1031eef 00000=
001 00001000 00000000
> cf8fbea8 c15952d1
> [=C2=A0=C2=A0=C2=A010.446322]=C2=A0=C2=A0cf9e4dfc d3a23518 c10fce12 02408=
0c0 024080c0 d2b05c80
> 00000000 00000000
> [=C2=A0=C2=A0=C2=A010.447870]=C2=A0=C2=A0d15da220 cf9e4dd8 00001000 00001=
000 00000000 cf9ed790
> b7752000 cf9ed788
> [=C2=A0=C2=A0=C2=A010.449424] Call Trace:
> [=C2=A0=C2=A0=C2=A010.449877]=C2=A0=C2=A0[<c1031eef>] phys_mem_access_pro=
t_allowed+0xaf/0xf0
> [=C2=A0=C2=A0=C2=A010.450670]=C2=A0=C2=A0[<c15952d1>] mmap_mem+0xa1/0x170
> [=C2=A0=C2=A0=C2=A010.451308]=C2=A0=C2=A0[<c10fce12>] ? mmap_region+0x242=
/0x510
> [=C2=A0=C2=A0=C2=A010.451993]=C2=A0=C2=A0[<c10fce9a>] mmap_region+0x2ca/0=
x510
> [=C2=A0=C2=A0=C2=A010.452657]=C2=A0=C2=A0[<c10fd30d>] do_mmap+0x22d/0x300
> [=C2=A0=C2=A0=C2=A010.453313]=C2=A0=C2=A0[<c10e7d74>] vm_mmap_pgoff+0x54/=
0x80
> [=C2=A0=C2=A0=C2=A010.453985]=C2=A0=C2=A0[<c10fb211>] SyS_mmap_pgoff+0xa1=
/0x100
> [=C2=A0=C2=A0=C2=A010.454665]=C2=A0=C2=A0[<c10013c3>] do_int80_syscall_32=
+0x63/0x150
> [=C2=A0=C2=A0=C2=A010.455396]=C2=A0=C2=A0[<c1b2684e>] entry_INT80_32+0x36=
/0x36

In short, this is a bug in previously (and unintentionally) deadcode.=C2=A0

After commit edfe63ec97, PAT is now set to disable properly when MTRRs are
disabled. =C2=A0This led the following deadcode to resurrect on x86/32.

phys_mem_access_prot_allowed()
=C2=A0:
#ifdef CONFIG_X86_32
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* On the PPro and suc=
cessors, the MTRRs are used to set
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* memory types for ph=
ysical addresses outside main memory,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* so blindly setting =
UC or PWT on those pages is wrong.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* For Pentiums and ea=
rlier, the surround logic should disable
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* caching for the hig=
h addresses through the KEN pin, but
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* we maintain the tra=
dition of paranoia in this code.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!pat_enabled() &&
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0!(b=
oot_cpu_has(X86_FEATURE_MTRR) ||
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0boot_cpu_has(X86_FEATURE_K6_MTRR) ||
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0boot_cpu_has(X86_FEATURE_CYRIX_ARR) ||
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0boot_cpu_has(X86_FEATURE_CENTAUR_MCR)) &&
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(pf=
n << PAGE_SHIFT) >=3D __pa(high_memory)) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pcm =3D _PAGE_CACHE_MODE_UC;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
#endif

When the system does not have much memory, 'high_memory' points to the
maximum memory address + 1, which is empty. =C2=A0When CONFIG_DEBUG_VIRTUAL=
 is
also set, __pa() calls=C2=A0__phys_addr(), which in turn
calls=C2=A0slow_virt_to_phys() for high_memory. =C2=A0Because high_memory d=
oes not
point to a valid memory address, this address is not mapped. =C2=A0Hence,
BUG_ON.

This can be fixed by changing it to either __pa(high_memory-1)
or=C2=A0__pa_nodebug(high_memory). =C2=A0Since the code does not expect a v=
alid
virtual address for high_memory, I think using __pa_nodebug() is
appropriate here. =C2=A0I am going to send a patch with this change.

Note, the code should not use high_memory for this check. =C2=A0I have a
separate patch for the /dev/mem driver to check if a target address is
backed by any memory (Ingo, any update on this one?). =C2=A0I consider it as
enhancement, so I am not going to replace the high_memory check for this
bug fix, though.
https://lkml.org/lkml/2016/2/9/935
https://lkml.org/lkml/2016/2/17/493

Thanks,
-Toshi

--===============6237391365515538205==--


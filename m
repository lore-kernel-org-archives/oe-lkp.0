Content-Type: multipart/mixed; boundary="===============0821790433393477636=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Sat, 18 Dec 2021 12:00:16 +0100
Message-ID: <Yb2/QCOExDEsj47w@zn.tnic>
In-Reply-To: <YbzRHXEMnZjyXzWa@archlinux-ax161>
List-Id: <oe-lkp.lists.linux.dev>

--===============0821790433393477636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 11:04:13AM -0700, Nathan Chancellor wrote:
> This is GCOV, -fprofile-arcs.

Aha, and no_profile_instrument_function disables that.

> I am not reallys ure how exactly GCOV works under the hood so I cannot
> really comment on it (Nick might); it seems like llvm_gcov_init needs to
> get called for __llvm_gcov_ctr to get set up properly and maybe that
> hasn't happened at the point.

Hmm, right, there is a

        .p2align        4, 0x90                         # -- Begin function=
 __llvm_gcov_init
        .type   __llvm_gcov_init,@function
__llvm_gcov_init:                       # @__llvm_gcov_init

in arch/x86/kernel/cpu/common.s which contains native_write_cr4() which does

	jmp     llvm_gcov_init(a)PLT

and that function is part of initcalls:

	.section	.init_array.0,"aw",@init_array
	.p2align	3
	.quad	__llvm_gcov_init
	.section	.init_array.1,"aw",@init_array
	.p2align	3
	.quad	asan.module_ctor
	.section	.fini_array.1,"aw",@fini_array
	.p2align	3
	.quad	asan.module_dtor
	.type	.L___asan_gen_.313,@object      # @___asan_gen_.313
	.section	.rodata.str1.1,"aMS",@progbits,1

which, AFAICT, gets called by kernel_init_freeable->do_basic_setup->do_ctor=
s()

which is a lot later than x86_64_start_kernel() so I guess the
__no_profile tag for that function probably makes sense as a fix.

> This is a bit of a brain dump, apologies for not offering much upfront
> analysis, I am not as familiar with LLVM internals as Nick but this
> might help others look into the problem.

No, this is still highly appreciated - thanks for taking the time!

> I ended up seeing this thread yesterday through a lore filter that I
> have

Nice filtering. :-)

I did Cc llvm(a)lists.linux.dev in the hope that you guys would see it.

> and I bisected LLVM based on the fact that it happened with
> clang-13 but not clang-12; that bisect pointed out Nick's commit in LLVM
> that added the no profile attribute, which means that GCOV and KASAN
> need to be enabled to see this bug. I was not able to reproduce it with
> just one of them enabled at a time.

Ah, that's an interesting point:

$ grep -E "(GCOV|KASAN)" /tmp/config-5.16.0-rc3-00003-gf154f290855b | grep =
-v "^#"
CONFIG_KASAN_SHADOW_OFFSET=3D0xdffffc0000000000
CONFIG_GCOV_KERNEL=3Dy
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
CONFIG_GCOV_PROFILE_ALL=3Dy
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
CONFIG_CC_HAS_KASAN_SW_TAGS=3Dy
CONFIG_KASAN=3Dy
CONFIG_KASAN_GENERIC=3Dy
CONFIG_KASAN_INLINE=3Dy
CONFIG_KASAN_VMALLOC=3Dy

> With that, I removed the no profile attribute dependency on GCOV_KERNEL
> and bisected again, landing on the commit in LLVM 13 that enables the
> new pass manager, which fundamentally changes how LLVM transforms its
> IR. Whenever that has happened in the past, it usually points to a
> pre-existing issue; if I go back to clang-11 (the current minimum of
> -next) and enable the NPM there with -fexperimental-new-pass-manager, I
> see this hang so it seems like there might be some issue how GCOV and
> KASAN are manipulated together in the context of the NPM that was not
> present with the legacy pass manager.

Aha, so it used to work, apparently. Or the NPM is adding additional
code which needs to be initialized because it works ok after the
constructors have run.

> I do see tests in LLVM that test to make sure __llvm_gcov_ctr does not
> get instrumented with KASAN, maybe there is another interaction that
> should not be happening between those two?

Right.

Ok, thanks for the insights, let's see what Nick figures out here.

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG N=C3=BCr=
nberg
--===============0821790433393477636==--


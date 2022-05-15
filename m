Content-Type: multipart/mixed; boundary="===============0189040321881856417=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 9c5743dff4: WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore
Date: Sun, 15 May 2022 10:25:01 +0200
Message-ID: <8735hbryn6.ffs@tglx>
In-Reply-To: <CAHk-=wjDE7tWc5k81P41AKw9b13ehrTX8XawgnP-wa6fA57kuA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0189040321881856417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 13 2022 at 09:52, Linus Torvalds wrote:
> On Fri, May 13, 2022 at 1:55 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> But considering that the fail:runs thing is 41:52, I suspect it's
> something very timing-dependent and who knows how reliable the
> bisection has been.

This smells very much like the issue which got fixed with

     59f5ede3bc0f ("x86/fpu: Prevent FPU state corruption")

which resulted in the very same stack trace pattern because the restore
detects the fpstate corruption. The sigframe setup does:

     if (TIF_NEED_FPU_LOAD)
           restore();
     save_to_sigframe();

But yes, in theory it might be caused by ptrace as well. See below.

>>   24:   89 c2                   mov    %eax,%edx
>>   26:   48 0f ae 2f             xrstor64 (%rdi)
>>   2a:*  48 c7 c7 58 47 2b 8c    mov    $0xffffffff8c2b4758,%rdi         =
<-- trapping instruction
>
> Seems to be just the exception stack chain (ie notice how it's
> pointing to the instruction after the xrstor64, it's not that the
> immediate register move really trapped).

which is caused by ex_handler_fprestore() itself because it stupidly
fixes up regs->ip _before_ the warning. This should obviously be done
afterwards. Without that fixup it would point at xrstor64.

>>   28:   0f 05                   syscall
>>   2a:*  48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax         =
<-- trapping instruction
>
> and again, it's just pointing back to after the 'syscall' instruction
> that caused this whole chain of events.
>
> Anyway, I *think* that what may be going on is some ptrace thing, but
> let's bring in other people. Because I don't think that "x86/uaccess:
> fix code generation in put_user()" commit is what triggered this, but
> who knows.. The x86 FP code can be very grotty.

Courtesy to the corresponding hardware...

The code which copies the ptrace supplied state has a pile of sanity
checks to catch invalid state, but I wouldn't bet my hat on it that it's
100% complete. We can be more defensive here, but I would be surprised.

Something like the untested below. I'll expose it to some testing to see
what explodes.

Thanks,

        tglx
---

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 39e1c8626ab9..c1228d6391c8 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1248,7 +1248,48 @@ static int copy_uabi_to_xstate(struct fpstate *fpsta=
te, const void *kbuf,
  */
 int copy_uabi_from_kernel_to_xstate(struct fpstate *fpstate, const void *k=
buf)
 {
-	return copy_uabi_to_xstate(fpstate, kbuf, NULL);
+	struct fpstate *tmpfps;
+	unsigned int fpsize;
+	int ret;
+
+	/* This cannot operate on current's fpstate */
+	if (WARN_ON_ONCE(fpstate =3D=3D current->thread.fpu.fpstate))
+		return -EPERM;
+
+	/* Use a temporary fpstate for the xrstor validation below */
+	fpsize =3D fpstate->size + ALIGN(offsetof(struct fpstate, regs), 64);
+	tmpfps =3D vmalloc(fpsize);
+	if (!tmpfps)
+		return -ENOMEM;
+	memcpy(tmpfps, fpstate, fpstate->size);
+
+	ret =3D copy_uabi_to_xstate(tmpfps, kbuf, NULL);
+	if (ret)
+		goto out;
+	/*
+	 * Ensure right here that the user space provided xstate content is
+	 * correct. Save current's fpstate and invalidate the per-CPU FPU
+	 * state.
+	 */
+	kernel_fpu_begin_mask(0);
+	/*
+	 * Limit the restore attempt to the user features as fpstate
+	 * is not current's fpstate. So current's supervisor state
+	 * has to be preserved and the target's supervisor state was
+	 * not touched in copy_uabi_to_xstate().
+	 */
+	ret =3D os_xrstor_safe(tmpfps, tmpfps->user_xfeatures);
+	kernel_fpu_end();
+	/*
+	 * If the restore succeeded, copy the state. Otherwise
+	 * keep the previous content.
+	 */
+	if (!ret)
+		memcpy(fpstate, tmpfps, fpstate->size);
+
+out:
+	vfree(tmpfps);
+	return ret;
 }
 =

 /*
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index dba2197c05c3..c0d852998d18 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -68,11 +68,10 @@ static bool ex_handler_sgx(const struct exception_table=
_entry *fixup,
 static bool ex_handler_fprestore(const struct exception_table_entry *fixup,
 				 struct pt_regs *regs)
 {
-	regs->ip =3D ex_fixup_addr(fixup);
-
 	WARN_ONCE(1, "Bad FPU state detected at %pB, reinitializing FPU registers=
.",
 		  (void *)instruction_pointer(regs));
 =

+	regs->ip =3D ex_fixup_addr(fixup);
 	fpu_reset_from_exception_fixup();
 	return true;
 }





--===============0189040321881856417==--


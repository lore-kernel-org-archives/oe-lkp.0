Content-Type: multipart/mixed; boundary="===============1749232982362790922=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 16:25:32 +0200
Message-ID: <20160615142532.GE32588@pd.tnic>
In-Reply-To: <57614955.l3IQMtSfaGPEBdCy%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1749232982362790922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 08:25:57PM +0800, kernel test robot wrote:
> [    0.556833] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.559888] ------------[ cut here ]------------
> [    0.559888] ------------[ cut here ]------------
> [    0.561405] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_hand=
ler_rdmsr_unsafe+0x44/0x70
> [    0.561405] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_hand=
ler_rdmsr_unsafe+0x44/0x70
> [    0.567649] unchecked MSR access error: RDMSR from 0x1b0
> [    0.567649] unchecked MSR access error: RDMSR from 0x1b0

Btw, Andy, this error message is completely useless - I
wanna know *where* the RDMSR in the code is, not point me at
ex_handler_rdmsr_unsafe().

IOW, I wanna convert the current thing into this:

[    0.028003] unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xfffff=
fff81026d9f
[    0.030343] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.032003] ENERGY_PERF_BIAS: View and update with x86_energy_perf_polic=
y(8)
[    0.036003] unchecked MSR access error: WRMSR to 0x1b0 (tried to write 0=
x0000000000000006) at rIP: 0xffffffff81026de1

i.e.,

---
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 4bb53b89f3c5..2028a5ad3433 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -46,8 +46,8 @@ EXPORT_SYMBOL(ex_handler_ext);
 bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
 			     struct pt_regs *regs, int trapnr)
 {
-	WARN_ONCE(1, "unchecked MSR access error: RDMSR from 0x%x\n",
-		  (unsigned int)regs->cx);
+	pr_warn_once("unchecked MSR access error: RDMSR from 0x%x at rIP: 0x%lx\n=
",
+		     (unsigned int)regs->cx, regs->ip);
 =

 	/* Pretend that the read succeeded and returned 0. */
 	regs->ip =3D ex_fixup_addr(fixup);
@@ -60,9 +60,9 @@ EXPORT_SYMBOL(ex_handler_rdmsr_unsafe);
 bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *fixup,
 			     struct pt_regs *regs, int trapnr)
 {
-	WARN_ONCE(1, "unchecked MSR access error: WRMSR to 0x%x (tried to write 0=
x%08x%08x)\n",
-		  (unsigned int)regs->cx,
-		  (unsigned int)regs->dx, (unsigned int)regs->ax);
+	pr_warn_once("unchecked MSR access error: WRMSR to 0x%x (tried to write 0=
x%08x%08x) at rIP: 0x%lx\n",
+		     (unsigned int)regs->cx, (unsigned int)regs->dx,
+		     (unsigned int)regs->ax,  regs->ip);
 =

 	/* Pretend that the write succeeded. */
 	regs->ip =3D ex_fixup_addr(fixup);
---

Ok?

As to the error message, dear LKP friends, it happens because -cpu kvm64
on native Intel hands in CPUID bits of the host, i.e., if you do this in
the guest:

$ grep epb /proc/cpuinfo
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx lm constant_tsc nopl ea=
gerfpu pni cx16 x2apic hypervisor epb
					  ^^^

you should have "epb" there too which is among those bits.

I can reproduce the same issue on an AMD host too by booting my guest
with

"-cpu kvm64,vendor=3DGenuineIntel"

Paolo, Eduardo, question: can we hide certain CPUID bits from the guest
when booting with -cpu kvm64?

In general, is there a way I can set or clear arbitrary CPUID bits so
that the guest sees what I want it to see?

And I don't mean the predefined CPUID flags which you toggle with "+" or
"-" followed by flag name. Because -cpu kvm64,-epb doesn't work.

Is there a way to make this work or should we hack it into qemu so that
we are able to do that? I.e., something like

-cpu=3Dkvm64,cpuid=3Dleaf6_ecx_bit3=3D0,...

or something smarter. But you get the idea...

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============1749232982362790922==--


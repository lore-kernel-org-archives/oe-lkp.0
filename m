Content-Type: multipart/mixed; boundary="===============2392561310366655812=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 22:32:12 +0100
Message-ID: <58C1C9DC.7070509@iogearbox.net>
In-Reply-To: <58C19F67.3040509@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2392561310366655812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ + Borislav ]

On 03/09/2017 07:31 PM, Daniel Borkmann wrote:
> On 03/09/2017 07:15 PM, Linus Torvalds wrote:
>> On Thu, Mar 9, 2017 at 10:10 AM, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> Very odd. We should always have PGE (0x0080) set in cr4 (if the CPU
>>> supports it).
>>
>> Daniel, do you see the code in probe_page_size_mask() triggering?
>>
>>          /* Enable PGE if available */
>>          if (boot_cpu_has(X86_FEATURE_PGE)) {
>>                  cr4_set_bits_and_update_boot(X86_CR4_PGE);
>>                  __supported_pte_mask |=3D _PAGE_GLOBAL;
>
> We do have boot_cpu_has(X86_FEATURE_PGE) and go indeed into this
> branch here. So it seems something must be clearing it later, hmm.
>
>>          } else
>>                  __supported_pte_mask &=3D ~_PAGE_GLOBAL;
>>
>> but maybe there's something wrong with the percpu cr4 caching?

So, I think I got a little bit further. To the printk's I added
previously in the test_setmem code that run on the problematic
kernel, I now extended them into:

   printk("static_cpu X86_FEATURE_PGE:%u\n",     static_cpu_has(X86_FEATURE=
_PGE));
   printk("boot_cpu   X86_FEATURE_PGE:%u\n",       boot_cpu_has(X86_FEATURE=
_PGE));
   printk("static_cpu X86_FEATURE_INVPCID:%u\n", static_cpu_has(X86_FEATURE=
_INVPCID));
   printk("boot_cpu   X86_FEATURE_INVPCID:%u\n",   boot_cpu_has(X86_FEATURE=
_INVPCID));

And here's what I get in the log:

"-cpu kvm64" gives:

[    8.426865] static_cpu X86_FEATURE_PGE:1
[    8.427148] boot_cpu   X86_FEATURE_PGE:0
[    8.427428] static_cpu X86_FEATURE_INVPCID:0
[    8.427732] boot_cpu   X86_FEATURE_INVPCID:0

"-cpu host" gives:

[    8.426408] static_cpu X86_FEATURE_PGE:1
[    8.426726] boot_cpu   X86_FEATURE_PGE:0
[    8.427037] static_cpu X86_FEATURE_INVPCID:1
[    8.427375] boot_cpu   X86_FEATURE_INVPCID:1

This means at that point in time static_cpu_has(X86_FEATURE_PGE) is
not the same as boot_cpu_has(X86_FEATURE_PGE).

The code that switches this off is in lguest_arch_host_init(). Right
before that, both are X86_FEATURE_PGE:1, X86_FEATURE_INVPCID:0 for
the "-cpu kvm64" case.

Then, the lguest code does:

	get_online_cpus();
	if (boot_cpu_has(X86_FEATURE_PGE)) { /* We have a broader idea of "global"=
. */
		/* Remember that this was originally set (for cleanup). */
		cpu_had_pge =3D 1;
		/*
		 * adjust_pge is a helper function which sets or unsets the PGE
		 * bit on its CPU, depending on the argument (0 =3D=3D unset).
		 */
		on_each_cpu(adjust_pge, (void *)0, 1);
		/* Turn off the feature in the global feature set. */
		clear_cpu_cap(&boot_cpu_data, X86_FEATURE_PGE);
	}
	put_online_cpus();

So, adjust_pge() clears X86_CR4_PGE, and boot cpu has X86_FEATURE_PGE
unset. This means, with static_cpu_has(X86_FEATURE_PGE) still 1, we
run into using cr4 for TLB flushing with no X86_CR4_PGE bit set (which
doesn't trigger the flush), whereas we should be using cr3 for flushing
from that point onwards instead.

I tried with this one, and things seem to work again:

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index 6fa8594..fc5abff 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -188,7 +188,7 @@ static inline void __native_flush_tlb_single(unsigned l=
ong addr)

  static inline void __flush_tlb_all(void)
  {
-       if (static_cpu_has(X86_FEATURE_PGE))
+       if (boot_cpu_has(X86_FEATURE_PGE))
                 __flush_tlb_global();
         else
                 __flush_tlb();

Presumably coming from c109bf95992b ("x86/cpufeature: Remove cpu_has_pge")?

Thanks,
Daniel

--===============2392561310366655812==--


Content-Type: multipart/mixed; boundary="===============3003606699271393346=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 09:48:20 -0800
Message-ID: <CA+55aFyxvUx0J=p8jh8N1a80Vt+f6M-rg=L3zxyiv69bOYhkKQ@mail.gmail.com>
In-Reply-To: <58C16C6A.2060400@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3003606699271393346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2017 at 6:53 AM, Daniel Borkmann <daniel@iogearbox.net> wr=
ote:
>
> Fwiw, I tried switching from using cr4
> (__native_flush_tlb_global_irq_disabled())
> to slower cr3 (__native_flush_tlb()) in "-cpu kvm64" mode, and it looks l=
ike
> it also lets all test cases pass (rodata_test, test_setmem, test_bpf), no
> corruption happening, etc.

Ok. I think this is conclusive: the qemu "-cpu kvm64" case is
definitely broken, since changing CR4.PGE is definitely
architecturally defined to flush all TLB entries.

This is not a guest kernel bug.

Of course, the bug may still be in the *host* kernel. Maybe the
emulation does something wrong. I see

        if (((cr4 ^ old_cr4) & pdptr_bits) ||
            (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
                kvm_mmu_reset_context(vcpu);

(where pdptr_bits includes the PGE bit), but I'm not sure if emulation
is supposed to do something else too.

                   Linus

--===============3003606699271393346==--


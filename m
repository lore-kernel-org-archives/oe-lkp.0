Content-Type: multipart/mixed; boundary="===============0056330878142995482=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 14:09:00 +0100
Message-ID: <alpine.DEB.2.20.1703091248410.3521@nanos>
In-Reply-To: <CA+55aFy97mLPLb4WXmRn-xLMNt+bNkrb_vaBsh+HOMLLnKPv7Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0056330878142995482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Mar 2017, Linus Torvalds wrote:

> Adding x86 people too, since this seems to be something off about
> ARCH_HAS_SET_MEMORY for x86-32.
> =

> The code seems to be shared between x86-32 and 64, I'm not seeing why
> set_memory_r[ow]() should fail on one but not the other.

Indeed.

> Considering that it seems to be flaky even on 32-bit, maybe it's
> timing-related, or possibly related to TLB sizes or whatever (ie more
> likely hidden by a larger TLB on more modern hardware?)

The only difference I can see is the way how __tlb_flush_all() is
happening. We have 3 variants:

   invpcid_flush_all()  - depends on X86_FEATURE_INVPCID and X86_FEATURE_PGE
   cr4 based flush	- depends on X86_FEATURE_PGE
   cr3 based flush

No idea which variant is used in that failure case.

> Anyway, just looking at change_page_attr_set_clr(), I notice that the
> page alias checking treats NX specially:
> =

>         /* No alias checking for _NX bit modifications */
>         checkalias =3D (pgprot_val(mask_set) | pgprot_val(mask_clr)) !=3D=
 _PAGE_NX;
> =

> which seems insane. Why would NX be different from other protection
> bits (like _PAGE_RW)?

The reason is that the alias mapping should never be executable at all.

Thanks,

	tglx


--===============0056330878142995482==--


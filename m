Content-Type: multipart/mixed; boundary="===============6332173660198360449=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Fri, 10 Mar 2017 00:44:11 +0100
Message-ID: <20170309234411.wec53iexfz6skmpl@pd.tnic>
In-Reply-To: <CA+55aFy5vi3af5VBuG6ZOdTeKNxqGSq64J-EkrjaRhGVKXPy0A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6332173660198360449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 03:26:02PM -0800, Linus Torvalds wrote:
> So should all of commit ("c109bf95992b x86/cpufeature: Remove
> cpu_has_pge") just be reverted (and then marked for stable)?
> =

> Or do we have some alternate plan?

I think we want to do this:

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index 6fa85944af83..fc5abff9b7fd 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -188,7 +188,7 @@ static inline void __native_flush_tlb_single(unsigned l=
ong addr)
 =

 static inline void __flush_tlb_all(void)
 {
-	if (static_cpu_has(X86_FEATURE_PGE))
+	if (boot_cpu_has(X86_FEATURE_PGE))
 		__flush_tlb_global();
 	else
 		__flush_tlb();
---

but it is late here so I'd prefer to do a real patch tomorrow when I'm
not almost sleeping on the keyboard. Unless Daniel wants to write one
and test it now.

> This has apparently been going on for a long while (it got merged into
> 4.7), but presumably it only actually _matters_ if lguest is enabled
> and used and we've triggered that lguest_arch_host_init() code.

That's what I gather too, yes.

What sane code would go and clear X86_FEATURE_PGE?!? :-)))

> Maybe it's the lguest games with PGE that need to be removed?

Well, as far as I can read the comment in lguest_arch_host_init(), it
does some monkey business with switching to the guest kernel where
global pages are not present anymore... or something. So it sounds to me
like lguest would break if we removed the games but I have no idea what
it does with that.

And besides, the small hunk above restores the situation before
("c109bf95992b x86/cpufeature: Remove cpu_has_pge") so applying it would
actually be a no-brainer.

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============6332173660198360449==--


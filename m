Content-Type: multipart/mixed; boundary="===============0529243727719571551=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 15:26:02 -0800
Message-ID: <CA+55aFy5vi3af5VBuG6ZOdTeKNxqGSq64J-EkrjaRhGVKXPy0A@mail.gmail.com>
In-Reply-To: <20170309224820.5invcnhvr2tl3ges@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0529243727719571551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2017 at 2:48 PM, Borislav Petkov <bp@suse.de> wrote:
>
> I guess we could return to doing boot_cpu_has() in __flush_tlb_all()
> then. I mean, the timing-sensitivity argument is meh - killing global
> TLB entries a bit faster doesn't bring me a whole lot when I have to go
> and walk pagetable and reestablish them, which is the real price to pay
> anyway.

So should all of commit ("c109bf95992b x86/cpufeature: Remove
cpu_has_pge") just be reverted (and then marked for stable)?

Or do we have some alternate plan?

This has apparently been going on for a long while (it got merged into
4.7), but presumably it only actually _matters_ if lguest is enabled
and used and we've triggered that lguest_arch_host_init() code.

Maybe it's the lguest games with PGE that need to be removed?

                Linus

--===============0529243727719571551==--


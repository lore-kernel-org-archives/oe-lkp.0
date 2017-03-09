Content-Type: multipart/mixed; boundary="===============6634379119157545662=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 10:15:22 -0800
Message-ID: <CA+55aFyu-LHqMaZBaa7VNamxhUR99F4Xr+nL9esLDUBhotopVg@mail.gmail.com>
In-Reply-To: <CA+55aFyxM--wyvxXGhBOqdJHcdC_kKvGYpv-C5SpYvRNkbEmGw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6634379119157545662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2017 at 10:10 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Very odd. We should always have PGE (0x0080) set in cr4 (if the CPU
> supports it).

Daniel, do you see the code in probe_page_size_mask() triggering?

        /* Enable PGE if available */
        if (boot_cpu_has(X86_FEATURE_PGE)) {
                cr4_set_bits_and_update_boot(X86_CR4_PGE);
                __supported_pte_mask |=3D _PAGE_GLOBAL;
        } else
                __supported_pte_mask &=3D ~_PAGE_GLOBAL;

but maybe there's something wrong with the percpu cr4 caching?

               Linus

--===============6634379119157545662==--


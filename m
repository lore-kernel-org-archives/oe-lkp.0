Content-Type: multipart/mixed; boundary="===============4787304916082477645=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 10:10:33 -0800
Message-ID: <CA+55aFyxM--wyvxXGhBOqdJHcdC_kKvGYpv-C5SpYvRNkbEmGw@mail.gmail.com>
In-Reply-To: <58C19607.6000605@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4787304916082477645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2017 at 9:51 AM, Daniel Borkmann <daniel@iogearbox.net> wr=
ote:
>
> What I see is that original cr4 is 0x610. The cpu_tlbstate.cr4 is
> consistent to native_read_cr4() and since cr4 is !=3D 0, it tells me
> based on the comment in native_read_cr4() that cr4 seems to be
> supported. Thus, meaning we end up with writing ...
>
>   native_write_cr4(0x610);
>   native_write_cr4(0x610);
>
> ... twice, and this just doesn't trigger the desired TLB flush.

Very odd. We should always have PGE (0x0080) set in cr4 (if the CPU
supports it).

But yes, if PGE is clear then that certainly explains the bug, and
it's not an emulation issue.

> I changed the code into the following ...
>
>         cr4 =3D this_cpu_read(cpu_tlbstate.cr4);
>         /* clear PGE */
> -       native_write_cr4(cr4 & ~X86_CR4_PGE);
> +       native_write_cr4(cr4 ^ X86_CR4_PGE);
>         /* write old PGE again and flush TLBs */
>         native_write_cr4(cr4);

Yeah, good for debugging, but not a good patch in general. The only
valid reason for not having PGE enabled would be that the CPU doesn't
support PGE at all.

                    Linus

--===============4787304916082477645==--


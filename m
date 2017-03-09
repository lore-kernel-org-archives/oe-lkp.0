Content-Type: multipart/mixed; boundary="===============4981404791208914947=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 23:48:20 +0100
Message-ID: <20170309224820.5invcnhvr2tl3ges@pd.tnic>
In-Reply-To: <58C1D305.8090802@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4981404791208914947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 11:11:17PM +0100, Daniel Borkmann wrote:
> Yeah, I just tried that out and it had no effect unfortunately, the
> static_cpu_has() was still 1.

Right, just as I thought.

I guess we could return to doing boot_cpu_has() in __flush_tlb_all()
then. I mean, the timing-sensitivity argument is meh - killing global
TLB entries a bit faster doesn't bring me a whole lot when I have to go
and walk pagetable and reestablish them, which is the real price to pay
anyway.

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============4981404791208914947==--


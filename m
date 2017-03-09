Content-Type: multipart/mixed; boundary="===============8481862689916554306=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 10:08:30 -0800
Message-ID: <20170309.100830.994695882061843653.davem@davemloft.net>
In-Reply-To: <58C19607.6000605@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8481862689916554306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Daniel Borkmann <daniel@iogearbox.net>
Date: Thu, 09 Mar 2017 18:51:03 +0100

> I added some debugging around __native_flush_tlb_global_irq_disabled()
> and if I understand it correctly, the idea of cr4 is that we need to
> toggle X86_CR4_PGE in order to trigger a TLB flush.
> =

> What I see is that original cr4 is 0x610. The cpu_tlbstate.cr4 is
> consistent to native_read_cr4() and since cr4 is !=3D 0, it tells me
> based on the comment in native_read_cr4() that cr4 seems to be
> supported. Thus, meaning we end up with writing ...
> =

>   native_write_cr4(0x610);
>   native_write_cr4(0x610);
> =

> ... twice, and this just doesn't trigger the desired TLB flush. I
> changed the code into the following ...
> =

>         cr4 =3D this_cpu_read(cpu_tlbstate.cr4);
>         /* clear PGE */
> -       native_write_cr4(cr4 & ~X86_CR4_PGE);
> +       native_write_cr4(cr4 ^ X86_CR4_PGE);
>         /* write old PGE again and flush TLBs */
>         native_write_cr4(cr4);
> =

> ... and the test cases seem to be working for me now with "-cpu
> kvm64",
> so that seems to trigger the TLB we were missing.

Great detective work Daniel.

--===============8481862689916554306==--


Content-Type: multipart/mixed; boundary="===============0423008685896870973=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Mon, 13 Jun 2022 10:10:57 -0700
Message-ID: <CANn89i+9Vq7Kiusp1jJBLgGMprb=psrVaWwz5u4F3dunw2vR3Q@mail.gmail.com>
In-Reply-To: <20220613020943.GD75244@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0423008685896870973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2022 at 7:09 PM Feng Tang <feng.tang@intel.com> wrote:
>
> Hi,
>
> On Wed, Jun 08, 2022 at 09:34:41AM +0200, Willy Tarreau wrote:
> > On Wed, Jun 08, 2022 at 10:26:12AM +0300, Moshe Kol wrote:
> > > Hmm, How is the ICMP flood stress test related to TCP connections?
> >
> > To me it's not directly related, unless the test pre-establishes many
> > connections, or is affected in a way or another by a larger memory
> > allocation of this part.
>
> Fengwei and I discussed and thought this could be a data alignment
> related case, that one module's data alignment change affects other
> modules' alignment, and we had a patch for detecting similar cases [1]
>
> After some debugging, this could be related with the bss section
> alignment changes, that if we forced all module's bss section to be
> 4KB aligned, then the stress-ng icmp-flood case will have almost no
> performance difference for the 2 commits:
>
> 10025135            +0.8%   10105711 =C2=B1  2%  stress-ng.icmp-flood.ops=
_per_sec
>
> The debug patch is:
>
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 7fda7f27e7620..7eb626b98620c 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -378,7 +378,9 @@ SECTIONS
>
>         /* BSS */
>         . =3D ALIGN(PAGE_SIZE);
> -       .bss : AT(ADDR(.bss) - LOAD_OFFSET) {
> +       .bss : AT(ADDR(.bss) - LOAD_OFFSET)
> +       SUBALIGN(PAGE_SIZE)
> +       {
>                 __bss_start =3D .;
>                 *(.bss..page_aligned)
>                 . =3D ALIGN(PAGE_SIZE);
>
> The 'table_perturb[]' used to be in bss section, and with the commit
> of moving it to runtime allocation, other data structures following it
> in the .bss section will get affected accordingly.
>

As the 'regression' is seen with ICMP workload, can you please share with us
the symbols close to icmp_global (without your align patch)

I suspect we should move icmp_global to a dedicated cache line.

$ nm -v vmlinux|egrep -8 "icmp_global$"
ffffffff835bc490 b tcp_cong_list_lock
ffffffff835bc494 b fastopen_seqlock
ffffffff835bc49c b tcp_metrics_lock
ffffffff835bc4a0 b tcpmhash_entries
ffffffff835bc4a4 b tcp_ulp_list_lock
ffffffff835bc4a8 B raw_v4_hashinfo
ffffffff835bccc0 B udp_memory_allocated      << Note sure why it is
not already in a dedicated cache line>>
ffffffff835bccc8 B udp_encap_needed_key
ffffffff835bccd8 b icmp_global                               <<<HERE>>
ffffffff835bccf0 b inet_addr_lst
ffffffff835bd4f0 b inetsw_lock
ffffffff835bd500 b inetsw
ffffffff835bd5b0 b fib_info_lock
ffffffff835bd5b4 b fib_info_cnt
ffffffff835bd5b8 b fib_info_hash_size
ffffffff835bd5c0 b fib_info_hash
ffffffff835bd5c8 b fib_info_laddrhash
--===============0423008685896870973==--


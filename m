Content-Type: multipart/mixed; boundary="===============7033466718078160697=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Fri, 13 Oct 2017 11:19:16 -0500
Message-ID: <20171013161916.pnezqxc5omfy35vh@treble>
In-Reply-To: <9a1c3232-86e3-7301-23f8-50116abf37d3@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7033466718078160697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 04:56:43PM +0300, Andrey Ryabinin wrote:
> On 10/13/2017 07:45 AM, Josh Poimboeuf wrote:
> > On Thu, Oct 12, 2017 at 12:05:04PM -0500, Christopher Lameter wrote:
> >> On Wed, 11 Oct 2017, Josh Poimboeuf wrote:
> >>
> >>> I failed to add the slab maintainers to CC on the last attempt.  Tryi=
ng
> >>> again.
> >>
> >>
> >> Hmmm... Yea. SLOB is rarely used and tested. Good illustration of a si=
mple
> >> allocator and the K&R mechanism that was used in the early kernels.
> >>
> >>>> Adding the slub maintainers.  Is slob still supposed to work?
> >>
> >> Have not seen anyone using it in a decade or so.
> >>
> >> Does the same config with SLUB and slub_debug on the commandline run
> >> cleanly?
> >>
> >>>> I have no idea how that crypto panic could could be related to slob,=
 but
> >>>> at least it goes away when I switch to slub.
> >>
> >> Can you run SLUB with full debug? specify slub_debug on the commandlin=
e or
> >> set CONFIG_SLUB_DEBUG_ON
> > =

> > Oddly enough, with CONFIG_SLUB+slub_debug, I get the same crypto panic I
> > got with CONFIG_SLOB.  The trapping instruction is:
> > =

> >   vmovdqa 0x140(%rdi),%xmm0
> =

> =

> It's unaligned access. Look at %rdi. vmovdqa requires 16-byte alignment.
> Apparently, something fed kmalloc()'ed data here. But kmalloc() guarantee=
s only sizeof(unsigned long)
> alignment. slub_debug changes slub's objects layout, so what happened to =
be 16-bytes aligned
> without slub_debug, may become 8-byte aligned with slub_debg on.
> =

>    =

> > I'll try to bisect it tomorrow.  It at least goes back to v4.10.
> =

> Probably no point. I bet this bug always was here (since this code added).
> =

> This could be fixed by s/vmovdqa/vmovdqu change like bellow, but maybe th=
e right fix
> would be to align the data properly?
> =

> ---
>  arch/x86/crypto/sha256-mb/sha256_mb_mgr_flush_avx2.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/x86/crypto/sha256-mb/sha256_mb_mgr_flush_avx2.S b/arch/=
x86/crypto/sha256-mb/sha256_mb_mgr_flush_avx2.S
> index 8fe6338bcc84..7fd5d9b568c7 100644
> --- a/arch/x86/crypto/sha256-mb/sha256_mb_mgr_flush_avx2.S
> +++ b/arch/x86/crypto/sha256-mb/sha256_mb_mgr_flush_avx2.S
> @@ -155,8 +155,8 @@ LABEL skip_ %I
>  .endr
>  =

>  	# Find min length
> -	vmovdqa _lens+0*16(state), %xmm0
> -	vmovdqa _lens+1*16(state), %xmm1
> +	vmovdqu _lens+0*16(state), %xmm0
> +	vmovdqu _lens+1*16(state), %xmm1
>  =

>  	vpminud %xmm1, %xmm0, %xmm2		# xmm2 has {D,C,B,A}
>  	vpalignr $8, %xmm2, %xmm3, %xmm3	# xmm3 has {x,x,D,C}
> @@ -176,8 +176,8 @@ LABEL skip_ %I
>  	vpsubd	%xmm2, %xmm0, %xmm0
>  	vpsubd	%xmm2, %xmm1, %xmm1
>  =

> -	vmovdqa	%xmm0, _lens+0*16(state)
> -	vmovdqa	%xmm1, _lens+1*16(state)
> +	vmovdqu	%xmm0, _lens+0*16(state)
> +	vmovdqu	%xmm1, _lens+1*16(state)
>  =

>  	# "state" and "args" are the same address, arg1
>  	# len is arg2
> -- =

> 2.13.6

Makes sense.  I can confirm that the above patch fixes the panic.

-- =

Josh

--===============7033466718078160697==--


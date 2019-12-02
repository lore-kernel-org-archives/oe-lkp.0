Content-Type: multipart/mixed; boundary="===============4937202303287540226=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
Date: Mon, 02 Dec 2019 16:31:52 +0800
Message-ID: <45ca8086-b7ce-1561-c7d1-3580872d2ba8@intel.com>
In-Reply-To: <20191201144947.GA4167@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4937202303287540226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

The patch fixes the regression reported by 0day-CI.

 =C2=A0=C2=A0 "[LKP] [x86/mm/pat] 8d04a5f97a: phoronix-test-suite.glmark2.0=
.score =

-23.7% regression": =

https://lkml.kernel.org/r/20191127005312.GD20422(a)shao2-debian

Best Regards,
Rong Chen

On 12/1/19 10:49 PM, Ingo Molnar wrote:
> * Ingo Molnar <mingo@kernel.org> wrote:
>
>> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>> But the final difference is a real difference where it used to be WC,
>>> and is now UC-:
>>>
>>>      -write-combining @ 0x2000000000-0x2100000000
>>>      -write-combining @ 0x2000000000-0x2100000000
>>>      +uncached-minus @ 0x2000000000-0x2100000000
>>>      +uncached-minus @ 0x2000000000-0x2100000000
>>>
>>> which certainly could easily explain the huge performance degradation.
>> It's not an unconditional regression, as both Boris and me tried to
>> reproduce it on different systems that do ioremap_wc() as well and didn't
>> measure a slowdown, but something about the memory layout probably
>> triggers the tree management bug.
> Ok, I think I found at least one bug in the new PAT code, the conversion
> of memtype_check_conflict() is buggy I think:
>
>     8d04a5f97a5f: ("x86/mm/pat: Convert the PAT tree to a generic interva=
l tree")
>
>          dprintk("Overlap at 0x%Lx-0x%Lx\n", match->start, match->end);
>          found_type =3D match->type;
>   =

> -       node =3D rb_next(&match->rb);
> -       while (node) {
> -               match =3D rb_entry(node, struct memtype, rb);
> -
> -               if (match->start >=3D end) /* Checked all possible matche=
s */
> -                       goto success;
> -
> -               if (is_node_overlap(match, start, end) &&
> -                   match->type !=3D found_type) {
> +       match =3D memtype_interval_iter_next(match, start, end);
> +       while (match) {
> +               if (match->type !=3D found_type)
>                          goto failure;
> -               }
>   =

> -               node =3D rb_next(&match->rb);
> +               match =3D memtype_interval_iter_next(match, start, end);
>          }
>
>
> Note how the '>=3D end' condition to end the interval check, got converted
> into:
>
> +       match =3D memtype_interval_iter_next(match, start, end);
>
> This is subtly off by one, because the interval trees interfaces require
> closed interval parameters:
>
>    include/linux/interval_tree_generic.h
>
>   /*                                                                     =
       \
>    * Iterate over intervals intersecting [start;last]                    =
       \
>    *                                                                     =
       \
>    * Note that a node's interval intersects [start;last] iff:            =
       \
>    *   Cond1: ITSTART(node) <=3D last                                    =
         \
>    * and                                                                 =
       \
>    *   Cond2: start <=3D ITLAST(node)                                    =
         \
>    */                                                                    =
       \
>
>    ...
>
>                  if (ITSTART(node) <=3D last) {            /* Cond1 */   =
        \
>                          if (start <=3D ITLAST(node))      /* Cond2 */   =
        \
>                                  return node;    /* node is leftmost matc=
h */  \
>
> [start;last] is a closed interval (note that '<=3D last' check) - while t=
he
> PAT 'end' parameter is 1 byte beyond the end of the range, because
> ioremap() and the other mapping APIs usually use the [start,end)
> half-open interval, derived from 'size'.
>
> This is what ioremap() does for example:
>
>          /*
>           * Mappings have to be page-aligned
>           */
>          offset =3D phys_addr & ~PAGE_MASK;
>          phys_addr &=3D PHYSICAL_PAGE_MASK;
>          size =3D PAGE_ALIGN(last_addr+1) - phys_addr;
>
>          retval =3D reserve_memtype(phys_addr, (u64)phys_addr + size,
>                                                  pcm, &new_pcm);
>
>
> phys_addr+size will be on a page boundary, after the last byte of the
> mapped interval.
>
> So the correct parameter to use in the interval tree searches is not
> 'end' but 'end-1'.
>
> This could have relevance if conflicting PAT ranges are exactly adjacent,
> for example a future WC region is followed immediately by an already
> mapped UC- region - in this case memtype_check_conflict() would
> incorrectly deny the WC memtype region and downgrade the memtype to UC-.
>
> BTW., rather annoyingly this downgrading is done silently in
> memtype_check_insert():
>
> int memtype_check_insert(struct memtype *new,
>                           enum page_cache_mode *ret_type)
> {
>          int err =3D 0;
>
>          err =3D memtype_check_conflict(new->start, new->end, new->type, =
ret_type);
>          if (err)
>                  return err;
>
>          if (ret_type)
>                  new->type =3D *ret_type;
>
>          memtype_interval_insert(new, &memtype_rbroot);
>          return 0;
> }
>
>
> So on such a conflict we'd just silently get UC- in *ret_type, and write
> it into the new region, never the wiser ...
>
> So assuming that the patch below fixes the primary bug the diagnostics
> side of ioremap() cache attribute downgrades would be another thing to
> fix.
>
> Anyway, I checked all the interval-tree iterations, and most of them are
> off by one - but I think the one related to memtype_check_conflict() is
> the one causing this particular performance regression.
>
> The only correct interval-tree searches were these two:
>
> arch/x86/mm/pat_interval.c:     match =3D memtype_interval_iter_first(&me=
mtype_rbroot, 0, ULONG_MAX);
> arch/x86/mm/pat_interval.c:             match =3D memtype_interval_iter_n=
ext(match, 0, ULONG_MAX);
>
> The ULONG_MAX was hiding the off-by-one in plain sight. :-)
>
> So it would be nice if everyone who is seeing this bug could test the
> patch below against Linus's latest tree - does it fix the regression?
>
> If not then please send the before/after dump of
> /sys/kernel/debug/x86/pat_memtype_list - and even if it works please send
> the dumps so we can double check it all.
>
> Note that the bug was benign in the sense of implementing a too strict
> cache attribute conflict policy and downgrading cache attributes - so
> AFAICS the worst outcome of this bug would be a performance regression.
>
> Patch is only lightly tested, so take care. (Patch is emphatically not
> signed off yet, because I spent most of the day on this and I don't yet
> trust my fix - all of the affected sites need to be reviewed more
> carefully.)
>
> Thanks,
>
> 	Ingo
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> From: Ingo Molnar <mingo@kernel.org>
> Date: Sun, 1 Dec 2019 15:25:50 +0100
> Subject: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
>
> NOT-Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>   arch/x86/mm/pat_interval.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/mm/pat_interval.c b/arch/x86/mm/pat_interval.c
> index 47a1bf30748f..6855362eaf21 100644
> --- a/arch/x86/mm/pat_interval.c
> +++ b/arch/x86/mm/pat_interval.c
> @@ -56,7 +56,7 @@ static struct memtype *memtype_match(u64 start, u64 end=
, int match_type)
>   {
>   	struct memtype *match;
>   =

> -	match =3D memtype_interval_iter_first(&memtype_rbroot, start, end);
> +	match =3D memtype_interval_iter_first(&memtype_rbroot, start, end-1);
>   	while (match !=3D NULL && match->start < end) {
>   		if ((match_type =3D=3D MEMTYPE_EXACT_MATCH) &&
>   		    (match->start =3D=3D start) && (match->end =3D=3D end))
> @@ -66,7 +66,7 @@ static struct memtype *memtype_match(u64 start, u64 end=
, int match_type)
>   		    (match->start < start) && (match->end =3D=3D end))
>   			return match;
>   =

> -		match =3D memtype_interval_iter_next(match, start, end);
> +		match =3D memtype_interval_iter_next(match, start, end-1);
>   	}
>   =

>   	return NULL; /* Returns NULL if there is no match */
> @@ -79,7 +79,7 @@ static int memtype_check_conflict(u64 start, u64 end,
>   	struct memtype *match;
>   	enum page_cache_mode found_type =3D reqtype;
>   =

> -	match =3D memtype_interval_iter_first(&memtype_rbroot, start, end);
> +	match =3D memtype_interval_iter_first(&memtype_rbroot, start, end-1);
>   	if (match =3D=3D NULL)
>   		goto success;
>   =

> @@ -89,12 +89,12 @@ static int memtype_check_conflict(u64 start, u64 end,
>   	dprintk("Overlap at 0x%Lx-0x%Lx\n", match->start, match->end);
>   	found_type =3D match->type;
>   =

> -	match =3D memtype_interval_iter_next(match, start, end);
> +	match =3D memtype_interval_iter_next(match, start, end-1);
>   	while (match) {
>   		if (match->type !=3D found_type)
>   			goto failure;
>   =

> -		match =3D memtype_interval_iter_next(match, start, end);
> +		match =3D memtype_interval_iter_next(match, start, end-1);
>   	}
>   success:
>   	if (newtype)
> @@ -160,7 +160,7 @@ struct memtype *memtype_erase(u64 start, u64 end)
>   struct memtype *memtype_lookup(u64 addr)
>   {
>   	return memtype_interval_iter_first(&memtype_rbroot, addr,
> -					   addr + PAGE_SIZE);
> +					   addr + PAGE_SIZE-1);
>   }
>   =

>   #if defined(CONFIG_DEBUG_FS)

--===============4937202303287540226==--


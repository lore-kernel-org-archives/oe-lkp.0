Content-Type: multipart/mixed; boundary="===============3946796040900486397=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [slab] a1fd55538c: WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 trace_hardirqs_on_caller()
Date: Mon, 01 Feb 2016 07:34:22 +1100
Message-ID: <20160201073422.6dd72721@canb.auug.org.au>
In-Reply-To: <20160131194048.6f7add16@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3946796040900486397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

On Sun, 31 Jan 2016 19:40:48 +0100 Jesper Dangaard Brouer <brouer@redhat.=
com> wrote:
>
> On Sun, 31 Jan 2016 13:15:06 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> =

> > On Sat, 30 Jan 2016 18:46:46 +0100 Jesper Dangaard Brouer <brouer@red=
hat.com> wrote:  =

> > >
> > > Let me know, if the linux-next tree need's an explicit fix?    =

> > =

> > It would be a good idea if you could send a fix against linux-next to
> > me as Andrew is currently travelling.  =

> =

> My analysis before was wrong, the fix was much simpler. No need to
> revert my FAILSLAB patch.  Just forgot to mask flags with gfp_allowed_mas=
k.
> =

> I expect AKPM can pickup these two small fixes to my patches.
> =

> Below is a patch for linux-next. =

> =

> - - =

> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   Author of http://www.iptv-analyzer.org
>   LinkedIn: http://www.linkedin.com/in/brouer
> =

> =

> [PATCH] mm: temporary fix for SLAB in linux-next
> =

> From: Jesper Dangaard Brouer <brouer@redhat.com>
> =

> This is only for linux-next, until AKPM pickup fixes two patches:
>  base url: http://ozlabs.org/~akpm/mmots/broken-out/
>  [1] mm-fault-inject-take-over-bootstrap-kmem_cache-check.patch
>  [2] slab-use-slab_pre_alloc_hook-in-slab-allocator-shared-with-slub.patch
> =

> First fix is for compiling with CONFIG_FAILSLAB. The linux-next commit
> needing this fix is 074b6f53c320 ("mm: fault-inject take over
> bootstrap kmem_cache check").
> =

> Second fix is for correct masking of allowed GFP flags (gfp_allowed_mask),
> in SLAB allocator.  This triggered a WARN, by percpu_init_late ->
> pcpu_mem_zalloc invoking kzalloc with GFP_KERNEL flags. The linux-next
> commit needing this fix is a1fd55538cae ("slab: use
> slab_pre_alloc_hook in SLAB allocator shared with SLUB").
> =

> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> ---
>  mm/failslab.c |    1 +
>  mm/slab.c     |    2 ++
>  2 files changed, 3 insertions(+)
> =

> diff --git a/mm/failslab.c b/mm/failslab.c
> index 0c5b3f31f310..b0fac98cd938 100644
> --- a/mm/failslab.c
> +++ b/mm/failslab.c
> @@ -1,5 +1,6 @@
>  #include <linux/fault-inject.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>  #include "slab.h"
>  =

>  static struct {
> diff --git a/mm/slab.c b/mm/slab.c
> index e90d259b3242..ddd974e6b3bb 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3190,6 +3190,7 @@ slab_alloc_node(struct kmem_cache *cachep, gfp_t fl=
ags, int nodeid,
>  	void *ptr;
>  	int slab_node =3D numa_mem_id();
>  =

> +	flags &=3D gfp_allowed_mask;
>  	cachep =3D slab_pre_alloc_hook(cachep, flags);
>  	if (unlikely(!cachep))
>  		return NULL;
> @@ -3268,6 +3269,7 @@ slab_alloc(struct kmem_cache *cachep, gfp_t flags, =
unsigned long caller)
>  	unsigned long save_flags;
>  	void *objp;
>  =

> +	flags &=3D gfp_allowed_mask;
>  	cachep =3D slab_pre_alloc_hook(cachep, flags);
>  	if (unlikely(!cachep))
>  		return NULL;

Applied to linux-next today.

-- =

Cheers,
Stephen Rothwell

--===============3946796040900486397==--


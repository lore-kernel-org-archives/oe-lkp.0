Content-Type: multipart/mixed; boundary="===============5138404500456019480=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/sl[au]b] 3c4cafa313: canonical_address#:#[##]
Date: Wed, 14 Sep 2022 08:42:38 +0100
Message-ID: <YyGF7rHetCp0mWhV@casper.infradead.org>
In-Reply-To: <YyF1zgAC2GBdW3Bk@hyeyoo>
List-Id: <oe-lkp.lists.linux.dev>

--===============5138404500456019480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 03:33:50PM +0900, Hyeonggon Yoo wrote:
> On Fri, Sep 09, 2022 at 11:16:51PM +0200, Vlastimil Babka wrote:
> > On 9/9/22 16:32, Hyeonggon Yoo wrote:
> > > On Fri, Sep 09, 2022 at 03:44:19PM +0200, Vlastimil Babka wrote:
> > >> On 9/9/22 13:05, Hyeonggon Yoo wrote:
> > >> >> ----8<----
> > >> >> From d6f9fbb33b908eb8162cc1f6ce7f7c970d0f285f Mon Sep 17 00:00:00=
 2001
> > >> >> From: Vlastimil Babka <vbabka@suse.cz>
> > >> >> Date: Fri, 9 Sep 2022 12:03:10 +0200
> > >> >> Subject: [PATCH 2/3] mm/migrate: make isolate_movable_page() skip=
 slab pages
> > >> >> =

> > >> >> In the next commit we want to rearrange struct slab fields to all=
ow a
> > >> >> larger rcu_head. Afterwards, the page->mapping field will overlap
> > >> >> with SLUB's "struct list_head slab_list", where the value of prev
> > >> >> pointer can become LIST_POISON2, which is 0x122 + POISON_POINTER_=
DELTA.
> > >> >> Unfortunately the bit 1 being set can confuse PageMovable() to be=
 a
> > >> >> false positive and cause a GPF as reported by lkp [1].
> > >> >> =

> > >> >> To fix this, make isolate_movable_page() skip pages with the Page=
Slab
> > >> >> flag set. This is a bit tricky as we need to add memory barriers =
to SLAB
> > >> >> and SLUB's page allocation and freeing, and their counterparts to
> > >> >> isolate_movable_page().
> > >> > =

> > >> > Hello, I just took a quick grasp,
> > >> > Is this approach okay with folio_test_anon()?
> > >> =

> > >> Not if used on a completely random page as compaction scanners can, =
but
> > >> relies on those being first tested for PageLRU or coming from a page=
 table
> > >> lookup etc.
> > >> Not ideal huh. Well I could improve also by switching 'next' and 'sl=
abs'
> > >> field and relying on the fact that the value of LIST_POISON2 doesn't=
 include
> > >> 0x1, just 0x2.
> > > =

> > > What about swapping counters and freelist?
> > > freelist should be always aligned.  =

> > =

> > Great suggestion, thanks!
> > =

> > Had to deal with SLAB too as there was list_head.prev also aliasing
> > page->mapping. Wanted to use freelist as well, but turns out it's not
> > aligned, so had to use s_mem instead.
> > =

> > The patch that isolate_movable_page() skip slab pages was thus dropped.=
 The
> > result is in slab.git below and if nothing blows up, will restore it to=
 -next
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=
=3Dfor-6.1/fit_rcu_head
> =

> I realized that there is also relevant comment in
> include/linux/mm_types.h:
> =

> >  62  * SLUB uses cmpxchg_double() to atomically update its freelist and=
 counters.
> >  63  * That requires that freelist & counters in struct slab be adjacen=
t and
> >  64  * double-word aligned. Because struct slab currently just reinterp=
rets the
> >  65  * bits of struct page, we align all struct pages to double-word bo=
undaries,
> >  66  * and ensure that 'freelist' is aligned within struct slab.
> >  67  */
> =

> Also we may add a comment,
> something like this?
> =

> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -79,6 +79,9 @@ struct page {
>          * WARNING: bit 0 of the first word is used for PageTail(). That
>          * means the other users of this union MUST NOT use the bit to
>          * avoid collision and false-positive PageTail().
> +        *
> +        * WARNING: lower two bits of third word is used for PAGE_MAPPING=
_FLAGS.
> +        * using those bits can lead compaction code to general protectio=
n fault.

I'm really not comfortable with adding that documentation.  I feel the
compaction code should be fixed.
--===============5138404500456019480==--


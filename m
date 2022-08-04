Content-Type: multipart/mixed; boundary="===============0731291296623682300=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Thu, 04 Aug 2022 12:47:58 +0200
Message-ID: <CACT4Y+Zzzj7+LwUwyMoBketXFBHRksnx148B1aLATZ48AU9o3w@mail.gmail.com>
In-Reply-To: <YutnCD5dPie/yoIk@feng-clx>
List-Id: <oe-lkp.lists.linux.dev>

--===============0731291296623682300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

 On Thu, 4 Aug 2022 at 08:29, Feng Tang <feng.tang@intel.com> wrote:
> > > > .On Tue, 2 Aug 2022 at 11:43, Vlastimil Babka <vbabka@suse.cz> wr=
ote:
> > > > >
> > > > > On 8/2/22 09:06, Dmitry Vyukov wrote:
> > > > > > On Tue, 2 Aug 2022 at 08:55, Feng Tang <feng.tang@intel.com> =
wrote:
> > > > > >>
> > > > > >> On Mon, Aug 01, 2022 at 10:23:23PM +0800, Vlastimil Babka wrot=
e:
> > > > > >> > On 8/1/22 08:21, Feng Tang wrote:
> > > > > >> [snip]
> > > > > >> > > Cc kansan  mail list.
> > > > > >> > >
> > > > > >> > > This is really related with KASAN debug, that in free path=
, some
> > > > > >> > > kmalloc redzone ([orig_size+1, object_size]) area is writt=
en by
> > > > > >> > > kasan to save free meta info.
> > > > > >> > >
> > > > > >> > > The callstack is:
> > > > > >> > >
> > > > > >> > >   kfree
> > > > > >> > >     slab_free
> > > > > >> > >       slab_free_freelist_hook
> > > > > >> > >           slab_free_hook
> > > > > >> > >             __kasan_slab_free
> > > > > >> > >               ____kasan_slab_free
> > > > > >> > >                 kasan_set_free_info
> > > > > >> > >                   kasan_set_track
> > > > > >> > >
> > > > > >> > > And this issue only happens with "kmalloc-16" slab. Kasan =
has 2
> > > > > >> > > tracks: alloc_track and free_track, for x86_64 test platfo=
rm, most
> > > > > >> > > of the slabs will reserve space for alloc_track, and reuse=
 the
> > > > > >> > > 'object' area for free_track.  The kasan free_track is 16 =
bytes
> > > > > >> > > large, that it will occupy the whole 'kmalloc-16's object =
area,
> > > > > >> > > so when kmalloc-redzone is enabled by this patch, the 'ove=
rwritten'
> > > > > >> > > error is triggered.
> > > > > >> > >
> > > > > >> > > But it won't hurt other kmalloc slabs, as kasan's free met=
a won't
> > > > > >> > > conflict with kmalloc-redzone which stay in the latter par=
t of
> > > > > >> > > kmalloc area.
> > > > > >> > >
> > > > > >> > > So the solution I can think of is:
> > > > > >> > > * skip the kmalloc-redzone for kmalloc-16 only, or
> > > > > >> > > * skip kmalloc-redzone if kasan is enabled, or
> > > > > >> > > * let kasan reserve the free meta (16 bytes) outside of ob=
ject
> > > > > >> > >   just like for alloc meta
> > > > > >> >
> > > > > >> > Maybe we could add some hack that if both kasan and SLAB_STO=
RE_USER is
> > > > > >> > enabled, we bump the stored orig_size from <16 to 16? Simila=
r to what
> > > > > >> > __ksize() does.
> > > > > >>
> > > > > >> How about the following patch:
> > > > > >>
> > > > > >> ---
> > > > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > > > >> index added2653bb0..33bbac2afaef 100644
> > > > > >> --- a/mm/slub.c
> > > > > >> +++ b/mm/slub.c
> > > > > >> @@ -830,6 +830,16 @@ static inline void set_orig_size(struct k=
mem_cache *s,
> > > > > >>         if (!slub_debug_orig_size(s))
> > > > > >>                 return;
> > > > > >>
> > > > > >> +#ifdef CONFIG_KASAN
> > > > > >> +       /*
> > > > > >> +        * When kasan is enabled, it could save its free meta =
data in the
> > > > > >> +        * start part of object area, so skip the kmalloc redz=
one check
> > > > > >> +        * for small kmalloc slabs to avoid the data conflict.
> > > > > >> +        */
> > > > > >> +       if (s->object_size <=3D 32)
> > > > > >> +               orig_size =3D s->object_size;
> > > > > >> +#endif
> > > > > >> +
> > > > > >>         p +=3D get_info_end(s);
> > > > > >>         p +=3D sizeof(struct track) * 2;
> > > > > >>
> > > > > >> I extend the size to 32 for potential's kasan meta data size i=
ncrease.
> > > > > >> This is tested locally, if people are OK with it, I can ask fo=
r 0Day's
> > > > > >> help to verify this.
> > > > >
> > > > > Is there maybe some KASAN macro we can use instead of hardcoding =
32?
> > > >
> > > > kasan_free_meta is placed in the object data after freeing, so it c=
an
> > > > be sizeof(kasan_free_meta)
> > >
> > > 'kasan_free_meta' is defined in mm/kasan/kasan.h, to use it we need to
> > > include "../kasan/kasan.h" in slub.c, or move its definition to
> > > "include/linux/kasan.h"
> > >
> > > Another idea is to save the info in kasan_info, like:
> > >
> > > ---
> > > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > > index b092277bf48d..97e899948d0b 100644
> > > --- a/include/linux/kasan.h
> > > +++ b/include/linux/kasan.h
> > > @@ -100,6 +100,7 @@ static inline bool kasan_has_integrated_init(void)
> > >  struct kasan_cache {
> > >         int alloc_meta_offset;
> > >         int free_meta_offset;
> > > +       int free_meta_size;
> >
> > Storing it here looks fine to me.
> > But I would name it based on the meaning for external users (i.e. that
> > many bytes are occupied by kasan in freed objects). For some caches
> > KASAN does not store anything in freed objects at all.
>
> OK, please review the below patch, thanks!
>
> - Feng
>
> ---8<---
> From c4fc739ea4d5222f0aba4b42b59668d64a010082 Mon Sep 17 00:00:00 2001
> From: Feng Tang <feng.tang@intel.com>
> Date: Thu, 4 Aug 2022 13:25:35 +0800
> Subject: [PATCH] mm: kasan: Add free_meta size info in struct kasan_cache
>
> When kasan is enabled for slab/slub, it may save kasan' free_meta
> data in the former part of slab object data area in slab object
> free path, which works fine.
>
> There is ongoing effort to extend slub's debug function which will
> redzone the latter part of kmalloc object area, and when both of
> the debug are enabled, there is possible conflict, especially when
> the kmalloc object has small size, as caught by 0Day bot [1]
>
> For better information for slab/slub, add free_meta's data size
> info 'kasan_cache', so that its users can take right action to
> avoid data conflict.
>
> [1]. https://lore.kernel.org/lkml/YuYm3dWwpZwH58Hu(a)xsang-OptiPlex-9020/
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Feng Tang <feng.tang@intel.com>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

I assume there will be a second patch that uses
free_meta_size_in_object  in slub debug code.

> ---
>  include/linux/kasan.h | 2 ++
>  mm/kasan/common.c     | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index b092277bf48d..293bdaa0ba09 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -100,6 +100,8 @@ static inline bool kasan_has_integrated_init(void)
>  struct kasan_cache {
>         int alloc_meta_offset;
>         int free_meta_offset;
> +       /* size of free_meta data saved in object's data area */
> +       int free_meta_size_in_object;
>         bool is_kmalloc;
>  };
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 78be2beb7453..a627efa267d1 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -201,6 +201,8 @@ void __kasan_cache_create(struct kmem_cache *cache, u=
nsigned int *size,
>                         cache->kasan_info.free_meta_offset =3D KASAN_NO_F=
REE_META;
>                         *size =3D ok_size;
>                 }
> +       } else {
> +               cache->kasan_info.free_meta_size_in_object =3D sizeof(str=
uct kasan_free_meta);
>         }
>
>         /* Calculate size with optimal redzone. */
> --
> 2.27.0
--===============0731291296623682300==--


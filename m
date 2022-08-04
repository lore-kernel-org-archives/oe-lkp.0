Content-Type: multipart/mixed; boundary="===============7050343567535215414=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Thu, 04 Aug 2022 20:22:31 +0800
Message-ID: <Yuu6B0vUuXvtEG8b@feng-clx>
In-Reply-To: <CACT4Y+Zzzj7+LwUwyMoBketXFBHRksnx148B1aLATZ48AU9o3w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7050343567535215414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2022 at 06:47:58PM +0800, Dmitry Vyukov wrote:
>  On Thu, 4 Aug 2022 at 08:29, Feng Tang <feng.tang@intel.com> wrote:
[...]
> >
> > ---8<---
> > From c4fc739ea4d5222f0aba4b42b59668d64a010082 Mon Sep 17 00:00:00 2001
> > From: Feng Tang <feng.tang@intel.com>
> > Date: Thu, 4 Aug 2022 13:25:35 +0800
> > Subject: [PATCH] mm: kasan: Add free_meta size info in struct kasan_cac=
he
> >
> > When kasan is enabled for slab/slub, it may save kasan' free_meta
> > data in the former part of slab object data area in slab object
> > free path, which works fine.
> >
> > There is ongoing effort to extend slub's debug function which will
> > redzone the latter part of kmalloc object area, and when both of
> > the debug are enabled, there is possible conflict, especially when
> > the kmalloc object has small size, as caught by 0Day bot [1]
> >
> > For better information for slab/slub, add free_meta's data size
> > info 'kasan_cache', so that its users can take right action to
> > avoid data conflict.
> >
> > [1]. https://lore.kernel.org/lkml/YuYm3dWwpZwH58Hu(a)xsang-OptiPlex-902=
0/
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Signed-off-by: Feng Tang <feng.tang@intel.com>
> =

> Acked-by: Dmitry Vyukov <dvyukov@google.com>
 =

Thanks for your suggestion and review!

> I assume there will be a second patch that uses
> free_meta_size_in_object  in slub debug code.
 =

Yes, it will be called in the slub kmalloc object redzone debug code.

Thanks,
Feng

> > ---
> >  include/linux/kasan.h | 2 ++
> >  mm/kasan/common.c     | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index b092277bf48d..293bdaa0ba09 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -100,6 +100,8 @@ static inline bool kasan_has_integrated_init(void)
> >  struct kasan_cache {
> >         int alloc_meta_offset;
> >         int free_meta_offset;
> > +       /* size of free_meta data saved in object's data area */
> > +       int free_meta_size_in_object;
> >         bool is_kmalloc;
> >  };
> >
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 78be2beb7453..a627efa267d1 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -201,6 +201,8 @@ void __kasan_cache_create(struct kmem_cache *cache,=
 unsigned int *size,
> >                         cache->kasan_info.free_meta_offset =3D KASAN_NO=
_FREE_META;
> >                         *size =3D ok_size;
> >                 }
> > +       } else {
> > +               cache->kasan_info.free_meta_size_in_object =3D sizeof(s=
truct kasan_free_meta);
> >         }
> >
> >         /* Calculate size with optimal redzone. */
> > --
> > 2.27.0
>=20
--===============7050343567535215414==--


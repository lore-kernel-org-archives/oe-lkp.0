Content-Type: multipart/mixed; boundary="===============0689954332410403969=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Mon, 15 Aug 2022 15:27:43 +0800
Message-ID: <Yvn1b8y20Mr0gfUQ@feng-clx>
In-Reply-To: <Yuu6B0vUuXvtEG8b@feng-clx>
List-Id: <oe-lkp.lists.linux.dev>

--===============0689954332410403969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

Could you help to check if the below combined patch fix the problem
you reported? thanks!

- Feng

---

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b092277bf48d6..293bdaa0ba09c 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -100,6 +100,8 @@ static inline bool kasan_has_integrated_init(void)
 struct kasan_cache {
 	int alloc_meta_offset;
 	int free_meta_offset;
+	/* size of free_meta data saved in object's data area */
+	int free_meta_size_in_object;
 	bool is_kmalloc;
 };
 =

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index c40c0e7b3b5f1..9d2994dbe4e7a 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -200,6 +200,8 @@ void __kasan_cache_create(struct kmem_cache *cache, uns=
igned int *size,
 			cache->kasan_info.free_meta_offset =3D KASAN_NO_FREE_META;
 			*size =3D ok_size;
 		}
+	} else {
+		cache->kasan_info.free_meta_size_in_object =3D sizeof(struct kasan_free_=
meta);
 	}
 =

 	/* Calculate size with optimal redzone. */
diff --git a/mm/slub.c b/mm/slub.c
index added2653bb03..272dcdbaaa03b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_cache *s,
 	if (!slub_debug_orig_size(s))
 		return;
 =

+#ifdef CONFIG_KASAN_GENERIC
+	/*
+	 * kasn could save its free meta data in the start part of object
+	 * area, so skip the redzone check if kasan's meta data size is
+	 * bigger enough to possibly overlap with kmalloc redzone
+	 */
+	if (s->kasan_info.free_meta_size_in_object * 2 > s->object_size)
+		orig_size =3D s->object_size;
+#endif
+
 	p +=3D get_info_end(s);
 	p +=3D sizeof(struct track) * 2;
 =

On Thu, Aug 04, 2022 at 08:22:31PM +0800, Tang, Feng wrote:
> On Thu, Aug 04, 2022 at 06:47:58PM +0800, Dmitry Vyukov wrote:
> >  On Thu, 4 Aug 2022 at 08:29, Feng Tang <feng.tang@intel.com> wrote:
> [...]
> > >
> > > ---8<---
> > > From c4fc739ea4d5222f0aba4b42b59668d64a010082 Mon Sep 17 00:00:00 2001
> > > From: Feng Tang <feng.tang@intel.com>
> > > Date: Thu, 4 Aug 2022 13:25:35 +0800
> > > Subject: [PATCH] mm: kasan: Add free_meta size info in struct kasan_c=
ache
> > >
> > > When kasan is enabled for slab/slub, it may save kasan' free_meta
> > > data in the former part of slab object data area in slab object
> > > free path, which works fine.
> > >
> > > There is ongoing effort to extend slub's debug function which will
> > > redzone the latter part of kmalloc object area, and when both of
> > > the debug are enabled, there is possible conflict, especially when
> > > the kmalloc object has small size, as caught by 0Day bot [1]
> > >
> > > For better information for slab/slub, add free_meta's data size
> > > info 'kasan_cache', so that its users can take right action to
> > > avoid data conflict.
> > >
> > > [1]. https://lore.kernel.org/lkml/YuYm3dWwpZwH58Hu(a)xsang-OptiPlex-9=
020/
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Signed-off-by: Feng Tang <feng.tang@intel.com>
> > =

> > Acked-by: Dmitry Vyukov <dvyukov@google.com>
>  =

> Thanks for your suggestion and review!
> =

> > I assume there will be a second patch that uses
> > free_meta_size_in_object  in slub debug code.
>  =

> Yes, it will be called in the slub kmalloc object redzone debug code.
> =

> Thanks,
> Feng
> =

> > > ---
> > >  include/linux/kasan.h | 2 ++
> > >  mm/kasan/common.c     | 2 ++
> > >  2 files changed, 4 insertions(+)
> > >
> > > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > > index b092277bf48d..293bdaa0ba09 100644
> > > --- a/include/linux/kasan.h
> > > +++ b/include/linux/kasan.h
> > > @@ -100,6 +100,8 @@ static inline bool kasan_has_integrated_init(void)
> > >  struct kasan_cache {
> > >         int alloc_meta_offset;
> > >         int free_meta_offset;
> > > +       /* size of free_meta data saved in object's data area */
> > > +       int free_meta_size_in_object;
> > >         bool is_kmalloc;
> > >  };
> > >
> > > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > > index 78be2beb7453..a627efa267d1 100644
> > > --- a/mm/kasan/common.c
> > > +++ b/mm/kasan/common.c
> > > @@ -201,6 +201,8 @@ void __kasan_cache_create(struct kmem_cache *cach=
e, unsigned int *size,
> > >                         cache->kasan_info.free_meta_offset =3D KASAN_=
NO_FREE_META;
> > >                         *size =3D ok_size;
> > >                 }
> > > +       } else {
> > > +               cache->kasan_info.free_meta_size_in_object =3D sizeof=
(struct kasan_free_meta);
> > >         }
> > >
> > >         /* Calculate size with optimal redzone. */
> > > --
> > > 2.27.0
> >=20
--===============0689954332410403969==--


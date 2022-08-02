Content-Type: multipart/mixed; boundary="===============0645514274902507357=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Tue, 02 Aug 2022 21:36:36 +0800
Message-ID: <YukoZEm4Q6CSEKKj@feng-skl>
In-Reply-To: <CACT4Y+asjzrBu8ogRDt9hYYaAB3tZ2pK5HBkzkuMp106vQwKWQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0645514274902507357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 06:30:44PM +0800, Dmitry Vyukov wrote:
> .On Tue, 2 Aug 2022 at 11:43, Vlastimil Babka <vbabka@suse.cz> wrote:
> >
> > On 8/2/22 09:06, Dmitry Vyukov wrote:
> > > On Tue, 2 Aug 2022 at 08:55, Feng Tang <feng.tang@intel.com> wrote:
> > >>
> > >> On Mon, Aug 01, 2022 at 10:23:23PM +0800, Vlastimil Babka wrote:
> > >> > On 8/1/22 08:21, Feng Tang wrote:
> > >> [snip]
> > >> > > Cc kansan  mail list.
> > >> > >
> > >> > > This is really related with KASAN debug, that in free path, some
> > >> > > kmalloc redzone ([orig_size+1, object_size]) area is written by
> > >> > > kasan to save free meta info.
> > >> > >
> > >> > > The callstack is:
> > >> > >
> > >> > >   kfree
> > >> > >     slab_free
> > >> > >       slab_free_freelist_hook
> > >> > >           slab_free_hook
> > >> > >             __kasan_slab_free
> > >> > >               ____kasan_slab_free
> > >> > >                 kasan_set_free_info
> > >> > >                   kasan_set_track
> > >> > >
> > >> > > And this issue only happens with "kmalloc-16" slab. Kasan has 2
> > >> > > tracks: alloc_track and free_track, for x86_64 test platform, mo=
st
> > >> > > of the slabs will reserve space for alloc_track, and reuse the
> > >> > > 'object' area for free_track.  The kasan free_track is 16 bytes
> > >> > > large, that it will occupy the whole 'kmalloc-16's object area,
> > >> > > so when kmalloc-redzone is enabled by this patch, the 'overwritt=
en'
> > >> > > error is triggered.
> > >> > >
> > >> > > But it won't hurt other kmalloc slabs, as kasan's free meta won't
> > >> > > conflict with kmalloc-redzone which stay in the latter part of
> > >> > > kmalloc area.
> > >> > >
> > >> > > So the solution I can think of is:
> > >> > > * skip the kmalloc-redzone for kmalloc-16 only, or
> > >> > > * skip kmalloc-redzone if kasan is enabled, or
> > >> > > * let kasan reserve the free meta (16 bytes) outside of object
> > >> > >   just like for alloc meta
> > >> >
> > >> > Maybe we could add some hack that if both kasan and SLAB_STORE_USE=
R is
> > >> > enabled, we bump the stored orig_size from <16 to 16? Similar to w=
hat
> > >> > __ksize() does.
> > >>
> > >> How about the following patch:
> > >>
> > >> ---
> > >> diff --git a/mm/slub.c b/mm/slub.c
> > >> index added2653bb0..33bbac2afaef 100644
> > >> --- a/mm/slub.c
> > >> +++ b/mm/slub.c
> > >> @@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_ca=
che *s,
> > >>         if (!slub_debug_orig_size(s))
> > >>                 return;
> > >>
> > >> +#ifdef CONFIG_KASAN
> > >> +       /*
> > >> +        * When kasan is enabled, it could save its free meta data i=
n the
> > >> +        * start part of object area, so skip the kmalloc redzone ch=
eck
> > >> +        * for small kmalloc slabs to avoid the data conflict.
> > >> +        */
> > >> +       if (s->object_size <=3D 32)
> > >> +               orig_size =3D s->object_size;
> > >> +#endif
> > >> +
> > >>         p +=3D get_info_end(s);
> > >>         p +=3D sizeof(struct track) * 2;
> > >>
> > >> I extend the size to 32 for potential's kasan meta data size increas=
e.
> > >> This is tested locally, if people are OK with it, I can ask for 0Day=
's
> > >> help to verify this.
> >
> > Is there maybe some KASAN macro we can use instead of hardcoding 32?
> =

> kasan_free_meta is placed in the object data after freeing, so it can
> be sizeof(kasan_free_meta)

'kasan_free_meta' is defined in mm/kasan/kasan.h, to use it we need to
include "../kasan/kasan.h" in slub.c, or move its definition to
"include/linux/kasan.h"

Another idea is to save the info in kasan_info, like:

---
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b092277bf48d..97e899948d0b 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -100,6 +100,7 @@ static inline bool kasan_has_integrated_init(void)
 struct kasan_cache {
 	int alloc_meta_offset;
 	int free_meta_offset;
+	int free_meta_size;
 	bool is_kmalloc;
 };
 =

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index c40c0e7b3b5f..7bd82c5ec264 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -178,6 +178,8 @@ void __kasan_cache_create(struct kmem_cache *cache, uns=
igned int *size,
 		return;
 	}
 =

+	cache->kasan_info.free_meta_size =3D sizeof(struct free_meta_offset);
+
 	/*
 	 * Add free meta into redzone when it's not possible to store
 	 * it in the object. This is the case when:

Thanks,
Feng
--===============0645514274902507357==--


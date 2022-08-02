Content-Type: multipart/mixed; boundary="===============2347942146433609659=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Tue, 02 Aug 2022 16:38:59 +0200
Message-ID: <CACT4Y+Y6M5MqSGC0MERFqkxgKYK+LrMYvW5xPH5kUA2mFh5_Xw@mail.gmail.com>
In-Reply-To: <YukoZEm4Q6CSEKKj@feng-skl>
List-Id: <oe-lkp.lists.linux.dev>

--===============2347942146433609659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Aug 2022 at 15:37, Feng Tang <feng.tang@intel.com> wrote:
>
> On Tue, Aug 02, 2022 at 06:30:44PM +0800, Dmitry Vyukov wrote:
> > .On Tue, 2 Aug 2022 at 11:43, Vlastimil Babka <vbabka@suse.cz> wrote:
> > >
> > > On 8/2/22 09:06, Dmitry Vyukov wrote:
> > > > On Tue, 2 Aug 2022 at 08:55, Feng Tang <feng.tang@intel.com> wrot=
e:
> > > >>
> > > >> On Mon, Aug 01, 2022 at 10:23:23PM +0800, Vlastimil Babka wrote:
> > > >> > On 8/1/22 08:21, Feng Tang wrote:
> > > >> [snip]
> > > >> > > Cc kansan  mail list.
> > > >> > >
> > > >> > > This is really related with KASAN debug, that in free path, so=
me
> > > >> > > kmalloc redzone ([orig_size+1, object_size]) area is written by
> > > >> > > kasan to save free meta info.
> > > >> > >
> > > >> > > The callstack is:
> > > >> > >
> > > >> > >   kfree
> > > >> > >     slab_free
> > > >> > >       slab_free_freelist_hook
> > > >> > >           slab_free_hook
> > > >> > >             __kasan_slab_free
> > > >> > >               ____kasan_slab_free
> > > >> > >                 kasan_set_free_info
> > > >> > >                   kasan_set_track
> > > >> > >
> > > >> > > And this issue only happens with "kmalloc-16" slab. Kasan has 2
> > > >> > > tracks: alloc_track and free_track, for x86_64 test platform, =
most
> > > >> > > of the slabs will reserve space for alloc_track, and reuse the
> > > >> > > 'object' area for free_track.  The kasan free_track is 16 bytes
> > > >> > > large, that it will occupy the whole 'kmalloc-16's object area,
> > > >> > > so when kmalloc-redzone is enabled by this patch, the 'overwri=
tten'
> > > >> > > error is triggered.
> > > >> > >
> > > >> > > But it won't hurt other kmalloc slabs, as kasan's free meta wo=
n't
> > > >> > > conflict with kmalloc-redzone which stay in the latter part of
> > > >> > > kmalloc area.
> > > >> > >
> > > >> > > So the solution I can think of is:
> > > >> > > * skip the kmalloc-redzone for kmalloc-16 only, or
> > > >> > > * skip kmalloc-redzone if kasan is enabled, or
> > > >> > > * let kasan reserve the free meta (16 bytes) outside of object
> > > >> > >   just like for alloc meta
> > > >> >
> > > >> > Maybe we could add some hack that if both kasan and SLAB_STORE_U=
SER is
> > > >> > enabled, we bump the stored orig_size from <16 to 16? Similar to=
 what
> > > >> > __ksize() does.
> > > >>
> > > >> How about the following patch:
> > > >>
> > > >> ---
> > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > >> index added2653bb0..33bbac2afaef 100644
> > > >> --- a/mm/slub.c
> > > >> +++ b/mm/slub.c
> > > >> @@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_=
cache *s,
> > > >>         if (!slub_debug_orig_size(s))
> > > >>                 return;
> > > >>
> > > >> +#ifdef CONFIG_KASAN
> > > >> +       /*
> > > >> +        * When kasan is enabled, it could save its free meta data=
 in the
> > > >> +        * start part of object area, so skip the kmalloc redzone =
check
> > > >> +        * for small kmalloc slabs to avoid the data conflict.
> > > >> +        */
> > > >> +       if (s->object_size <=3D 32)
> > > >> +               orig_size =3D s->object_size;
> > > >> +#endif
> > > >> +
> > > >>         p +=3D get_info_end(s);
> > > >>         p +=3D sizeof(struct track) * 2;
> > > >>
> > > >> I extend the size to 32 for potential's kasan meta data size incre=
ase.
> > > >> This is tested locally, if people are OK with it, I can ask for 0D=
ay's
> > > >> help to verify this.
> > >
> > > Is there maybe some KASAN macro we can use instead of hardcoding 32?
> >
> > kasan_free_meta is placed in the object data after freeing, so it can
> > be sizeof(kasan_free_meta)
>
> 'kasan_free_meta' is defined in mm/kasan/kasan.h, to use it we need to
> include "../kasan/kasan.h" in slub.c, or move its definition to
> "include/linux/kasan.h"
>
> Another idea is to save the info in kasan_info, like:
>
> ---
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index b092277bf48d..97e899948d0b 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -100,6 +100,7 @@ static inline bool kasan_has_integrated_init(void)
>  struct kasan_cache {
>         int alloc_meta_offset;
>         int free_meta_offset;
> +       int free_meta_size;

Storing it here looks fine to me.
But I would name it based on the meaning for external users (i.e. that
many bytes are occupied by kasan in freed objects). For some caches
KASAN does not store anything in freed objects at all.



>         bool is_kmalloc;
>  };
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index c40c0e7b3b5f..7bd82c5ec264 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -178,6 +178,8 @@ void __kasan_cache_create(struct kmem_cache *cache, u=
nsigned int *size,
>                 return;
>         }
>
> +       cache->kasan_info.free_meta_size =3D sizeof(struct free_meta_offs=
et);
> +
>         /*
>          * Add free meta into redzone when it's not possible to store
>          * it in the object. This is the case when:
--===============2347942146433609659==--


Content-Type: multipart/mixed; boundary="===============7926697815670483045=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Tue, 16 Aug 2022 22:12:15 +0800
Message-ID: <Yvulv68VmqCJFVJq@feng-clx>
In-Reply-To: <YvubS48W0dE7uA4E@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7926697815670483045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 09:27:39PM +0800, Sang, Oliver wrote:
> Hi Feng,
> =

> On Mon, Aug 15, 2022 at 03:27:43PM +0800, Feng Tang wrote:
> > Hi Oliver,
> > =

> > Could you help to check if the below combined patch fix the problem
> > you reported? thanks!
> =

> I applied below patch upon 3616799128:
> 28b34693c816e9 (linux-devel/fixup-3616799128) fix for 3616799128: BUG_kma=
lloc-#(Not_tainted):kmalloc_Redzone_overwritten
> 3616799128612e (linux-review/Feng-Tang/mm-slub-some-debug-enhancements/20=
220727-151318) mm/slub: extend redzone check to cover extra allocated kmall=
oc space than requested
> acc77d62f91ccc mm/slub: only zero the requested size of buffer for kzalloc
> =

> =

> confirmed the issue gone:

Many thanks for helping testing!

- Feng


> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/rootfs/sleep/tbox_group/testcase:
>   gcc-11/x86_64-randconfig-a005-20220117/debian-11.1-x86_64-20220510.cgz/=
300/vm-snb/boot
> =

> =

> acc77d62f91ccca2 3616799128612e04ed919579e2c 28b34693c816e9fcbe42bdd341e
> ---------------- --------------------------- ---------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>            |             |             |             |             |
>            :20          95%          19:20           0%            :22   =
 dmesg.BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
>            :20          95%          19:20           0%            :22   =
 dmesg.BUG_kmalloc-#(Tainted:G_B):kmalloc_Redzone_overwritten
> =

> =

> =

> > =

> > - Feng
> > =

> > ---
> > =

> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index b092277bf48d6..293bdaa0ba09c 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -100,6 +100,8 @@ static inline bool kasan_has_integrated_init(void)
> >  struct kasan_cache {
> >  	int alloc_meta_offset;
> >  	int free_meta_offset;
> > +	/* size of free_meta data saved in object's data area */
> > +	int free_meta_size_in_object;
> >  	bool is_kmalloc;
> >  };
> >  =

> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index c40c0e7b3b5f1..9d2994dbe4e7a 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -200,6 +200,8 @@ void __kasan_cache_create(struct kmem_cache *cache,=
 unsigned int *size,
> >  			cache->kasan_info.free_meta_offset =3D KASAN_NO_FREE_META;
> >  			*size =3D ok_size;
> >  		}
> > +	} else {
> > +		cache->kasan_info.free_meta_size_in_object =3D sizeof(struct kasan_f=
ree_meta);
> >  	}
> >  =

> >  	/* Calculate size with optimal redzone. */
> > diff --git a/mm/slub.c b/mm/slub.c
> > index added2653bb03..272dcdbaaa03b 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_cache=
 *s,
> >  	if (!slub_debug_orig_size(s))
> >  		return;
> >  =

> > +#ifdef CONFIG_KASAN_GENERIC
> > +	/*
> > +	 * kasn could save its free meta data in the start part of object
> > +	 * area, so skip the redzone check if kasan's meta data size is
> > +	 * bigger enough to possibly overlap with kmalloc redzone
> > +	 */
> > +	if (s->kasan_info.free_meta_size_in_object * 2 > s->object_size)
> > +		orig_size =3D s->object_size;
> > +#endif
> > +
> >  	p +=3D get_info_end(s);
> >  	p +=3D sizeof(struct track) * 2;
> > =20
--===============7926697815670483045==--


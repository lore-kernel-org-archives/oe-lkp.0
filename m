Content-Type: multipart/mixed; boundary="===============3174702099008958139=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Tue, 02 Aug 2022 16:44:31 +0800
Message-ID: <Yujj76AGNMXOQIsN@feng-skl>
In-Reply-To: <CACT4Y+YEtmvR2KOW5P0VtbHatxdY7MT22hp9FrUOyjZiKR+BJw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3174702099008958139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 03:59:00PM +0800, Dmitry Vyukov wrote:
> On Tue, 2 Aug 2022 at 09:47, Feng Tang <feng.tang@intel.com> wrote:
> > > > On Mon, Aug 01, 2022 at 10:23:23PM +0800, Vlastimil Babka wrote:
> > > > > On 8/1/22 08:21, Feng Tang wrote:
> > > > [snip]
> > > > > > Cc kansan  mail list.
> > > > > >
> > > > > > This is really related with KASAN debug, that in free path, some
> > > > > > kmalloc redzone ([orig_size+1, object_size]) area is written by
> > > > > > kasan to save free meta info.
> > > > > >
> > > > > > The callstack is:
> > > > > >
> > > > > >   kfree
> > > > > >     slab_free
> > > > > >       slab_free_freelist_hook
> > > > > >           slab_free_hook
> > > > > >             __kasan_slab_free
> > > > > >               ____kasan_slab_free
> > > > > >                 kasan_set_free_info
> > > > > >                   kasan_set_track
> > > > > >
> > > > > > And this issue only happens with "kmalloc-16" slab. Kasan has 2
> > > > > > tracks: alloc_track and free_track, for x86_64 test platform, m=
ost
> > > > > > of the slabs will reserve space for alloc_track, and reuse the
> > > > > > 'object' area for free_track.  The kasan free_track is 16 bytes
> > > > > > large, that it will occupy the whole 'kmalloc-16's object area,
> > > > > > so when kmalloc-redzone is enabled by this patch, the 'overwrit=
ten'
> > > > > > error is triggered.
> > > > > >
> > > > > > But it won't hurt other kmalloc slabs, as kasan's free meta won=
't
> > > > > > conflict with kmalloc-redzone which stay in the latter part of
> > > > > > kmalloc area.
> > > > > >
> > > > > > So the solution I can think of is:
> > > > > > * skip the kmalloc-redzone for kmalloc-16 only, or
> > > > > > * skip kmalloc-redzone if kasan is enabled, or
> > > > > > * let kasan reserve the free meta (16 bytes) outside of object
> > > > > >   just like for alloc meta
> > > > >
> > > > > Maybe we could add some hack that if both kasan and SLAB_STORE_US=
ER is
> > > > > enabled, we bump the stored orig_size from <16 to 16? Similar to =
what
> > > > > __ksize() does.
> > > >
> > > > How about the following patch:
> > > >
> > > > ---
> > > > diff --git a/mm/slub.c b/mm/slub.c
> > > > index added2653bb0..33bbac2afaef 100644
> > > > --- a/mm/slub.c
> > > > +++ b/mm/slub.c
> > > > @@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_c=
ache *s,
> > > >         if (!slub_debug_orig_size(s))
> > > >                 return;
> > > >
> > > > +#ifdef CONFIG_KASAN
> > > > +       /*
> > > > +        * When kasan is enabled, it could save its free meta data =
in the
> > > > +        * start part of object area, so skip the kmalloc redzone c=
heck
> > > > +        * for small kmalloc slabs to avoid the data conflict.
> > > > +        */
> > > > +       if (s->object_size <=3D 32)
> > > > +               orig_size =3D s->object_size;
> > > > +#endif
> =

> I think this can be done only when CONFIG_KASAN_GENERIC.
> Only CONFIG_KASAN_GENERIC stores free meta info in objects:
> https://elixir.bootlin.com/linux/latest/source/mm/kasan/common.c#L176

Thanks for the catch!  will change.

> And KASAN_HW_TAGS has chances of being enabled with DEBUG_SLUB in
> real-world uses (with Arm MTE).

I only have device to test the kasan-generic mode, and not SW/HW tag.
But if there is conflict, we may have to apply the similar solution :)

> =

> > > > +
> > > >         p +=3D get_info_end(s);
> > > >         p +=3D sizeof(struct track) * 2;
> > > >
> > > > I extend the size to 32 for potential's kasan meta data size increa=
se.
> > > > This is tested locally, if people are OK with it, I can ask for 0Da=
y's
> > > > help to verify this.
> > >
> > > Where is set_orig_size() function defined? Don't see it upstream nor
> > > in linux-next.
> > > This looks fine but my only concern is that this should not increase
> > > memory consumption when slub debug tracking is not enabled, which
> > > should be the main operation mode when KASAN is enabled. But I can't
> > > figure this out w/o context.
> >
> > Yes, the patchset was only posted on LKML, and not in any tree now.
> > The link to the original patches is:
> >
> > https://lore.kernel.org/lkml/20220727071042.8796-1-feng.tang(a)intel.co=
m/t/
> =

> Lots of code...
> =

> This SLAB_STORE_USER seems to be set on all kmalloc slabs by default
> when CONFIG_SLUB_DEBUG is enabled, right?

Christoph has explained in one earlier mail that CONFIG_SLUB_DEBUG only
compile in the debug support but not activate it. Option CONFIG_SLUB_DEBUG_=
ON
will enable it, and each slub debug flag bits can also be enabled =

by changing kernel cmdline for some or all slabs.  =


> And KASAN enables CONFIG_SLUB_DEBUG, this means that this is stored
> always when KASAN is enabled? Looks wrong.

Thanks,
Feng
--===============3174702099008958139==--


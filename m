Content-Type: multipart/mixed; boundary="===============3768335262177629526=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 555b8c8cb3: WARNING:at_lib/stackdepot.c:#stack_depot_fetch
Date: Tue, 05 Apr 2022 11:00:58 +0900
Message-ID: <Ykui2prpzkMvaWBa@hyeyoo>
In-Reply-To: <CANpmjNMupGGbTDD-ZEY=acTbqguvWgLzb1ZVRbG9TyuF50Ch+Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3768335262177629526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 05:18:16PM +0200, Marco Elver wrote:
> On Mon, 4 Apr 2022 at 16:20, Vlastimil Babka <vbabka@suse.cz> wrote:
> >
> > On 4/4/22 10:10, Marco Elver wrote:
> > > On Mon, Apr 04, 2022 at 12:05PM +0900, Hyeonggon Yoo wrote:
> > > (Maybe CONFIG_KCSAN_STRICT=3Dy is going to yield something? I still d=
oubt
> > > it thought, this bug is related to corrupted stackdepot handle
> > > somewhere...)
> > >
> > >> I noticed that it is not reproduced when KASAN=3Dy and KFENCE=3Dn (r=
eproduced 0 of 181).
> > >> and it was reproduced 56 of 196 when KASAN=3Dn and KFENCE=3Dy
> > >>
> > >> maybe this issue is related to kfence?
> >
> > Hmm kfence seems to be a good lead. If I understand kfence_guarded_allo=
c()
> > correctly, it tries to set up something that really looks like a normal=
 slab
> > page? Especially the part with comment /* Set required slab fields. */
> > But it doesn't seem to cover the debugging parts that SLUB sets up with
> > alloc_debug_processing(). This includes alloc stack saving, thus, after
> > commit 555b8c8cb3, a stackdepot handle setting. It probably normally do=
esn't
> > matter as is_kfence_address() redirects processing of kfence-allocated
> > objects so we don't hit any slub code that expects the debugging parts =
to be
> > properly initialized.
> >
> > But here we are in mem_dump_obj() -> kmem_dump_obj() -> kmem_obj_info().
> > Because kmem_valid_obj() returned true, fooled by folio_test_slab()
> > returning true because of the /* Set required slab fields. */ code.
> > Yet the illusion is not perfect and we read garbage instead of a valid
> > stackdepot handle.
> >
> > IMHO we should e.g. add the appropriate is_kfence_address() test into
> > kmem_valid_obj(), to exclude kfence-allocated objects? Sounds much simp=
ler
> > than trying to extend the illusion further to make kmem_dump_obj() work?
> > Instead kfence could add its own specific handler to mem_dump_obj() to =
print
> > its debugging data?
> =

> I think this explanation makes sense!  Indeed, KFENCE already records
> allocation stacks internally anyway, so it should be straightforward
> to convince it to just print that.
>

Thank you both! Yeah the explanation makes sense... thats why KASAN/KCSAN c=
ouldn't yield anything -- it was not overwritten.

I'm writing a fix and will test if the bug disappears.
This may take few days.

Thanks!
Hyeonggon

> Thanks,
> -- Marco
--===============3768335262177629526==--


Content-Type: multipart/mixed; boundary="===============7740637541150591693=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 555b8c8cb3: WARNING:at_lib/stackdepot.c:#stack_depot_fetch
Date: Wed, 06 Apr 2022 20:50:37 +0900
Message-ID: <Yk1+jZjfaJK3Jwwf@hyeyoo>
In-Reply-To: <Yk1Qf73cufW6LjOW@elver.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7740637541150591693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 10:34:07AM +0200, Marco Elver wrote:
> On Wed, Apr 06, 2022 at 07:47AM +0900, Hyeonggon Yoo wrote:
> > On Tue, Apr 05, 2022 at 01:07:53PM +0200, Marco Elver wrote:
> > > On Tue, Apr 05, 2022 at 11:00AM +0900, Hyeonggon Yoo wrote:
> > > > On Mon, Apr 04, 2022 at 05:18:16PM +0200, Marco Elver wrote:
> > > > > On Mon, 4 Apr 2022 at 16:20, Vlastimil Babka <vbabka@suse.cz> w=
rote:
> > > [...]
> > > > > > But here we are in mem_dump_obj() -> kmem_dump_obj() -> kmem_ob=
j_info().
> > > > > > Because kmem_valid_obj() returned true, fooled by folio_test_sl=
ab()
> > > > > > returning true because of the /* Set required slab fields. */ c=
ode.
> > > > > > Yet the illusion is not perfect and we read garbage instead of =
a valid
> > > > > > stackdepot handle.
> > > > > >
> > > > > > IMHO we should e.g. add the appropriate is_kfence_address() tes=
t into
> > > > > > kmem_valid_obj(), to exclude kfence-allocated objects? Sounds m=
uch simpler
> > > > > > than trying to extend the illusion further to make kmem_dump_ob=
j() work?
> > > > > > Instead kfence could add its own specific handler to mem_dump_o=
bj() to print
> > > > > > its debugging data?
> > > > > =

> > > > > I think this explanation makes sense!  Indeed, KFENCE already rec=
ords
> > > > > allocation stacks internally anyway, so it should be straightforw=
ard
> > > > > to convince it to just print that.
> > > > >
> > > > =

> > > > Thank you both! Yeah the explanation makes sense... thats why KASAN=
/KCSAN couldn't yield anything -- it was not overwritten.
> > > > =

> > > > I'm writing a fix and will test if the bug disappears.
> > > > This may take few days.
> > >
> > =

> > I did check the bug is not reproduced after simple fix. (reproduced 0 o=
f 373)
> > This approach was right.
> > =

> > > The below should fix it -- I'd like to make kmem_obj_info() do someth=
ing
> > > useful for KFENCE objects.
> > >
> > =

> > Agreed.
> > =

> [...]
> > > +	i =3D get_stack_skipnr(track->stack_entries, track->num_stack_entri=
es, NULL);
> > > +	for (j =3D 0; i < track->num_stack_entries && j < KS_ADDRS_COUNT - =
1; ++i, ++j)
> > =

> > why KS_ADDRS_COUNT - 1 instead of KS_ADDRS_COUNT?
> =

> For `kp_stack[j] =3D NULL` because KFENCE's stack_entries does not have a
> NULL-delimiter (we have num_stack_entries). But it seems for kp_stack
> it's only added if `j < KS_ADDR_COUNT`, so I've fixed that.
>

Okay.

> > > +		kp_stack[j] =3D (void *)track->stack_entries[i];
> > > +	kp_stack[j] =3D NULL;
> [...]
> > > +	kpp->kp_objp =3D (void *)meta->addr;
> > > +
> > =

> > no need to take meta->lock here?
> =

> Yes, in case state is KFENCE_OBJECT_FREED there could be a race.
>

dumping object that is freed sounds like a bug?
but seems it's better to avoid a race in that case too.

> > > +	kfence_to_kp_stack(&meta->alloc_track, kpp->kp_stack);
> > > +	if (meta->state =3D=3D KFENCE_OBJECT_FREED)
> > > +		kfence_to_kp_stack(&meta->free_track, kpp->kp_free_stack);
> > > +	/* get_stack_skipnr() ensures the first entry is outside allocator.=
 */
> > > +	kpp->kp_ret =3D kpp->kp_stack[0];
> > > +
> > > +	return true;
> > > +}
> > =

> > kfence_kmem_obj_info() does not set kp_data_offset. kp_data_offset
> > may not be zero when e.g.) mem_dump_obj(&rhp->func); in rcutorture case=
. =

> =

> kp_data_offset is the offset e.g. when SLUB has added a redzone:
> =

> |		objp0 =3D kasan_reset_tag(object);
> |	#ifdef CONFIG_SLUB_DEBUG
> |		objp =3D restore_red_left(s, objp0);
> |	#else
> |		objp =3D objp0;
> |	#endif
> |		objnr =3D obj_to_index(s, slab, objp);
> |		kpp->kp_data_offset =3D (unsigned long)((char *)objp0 - (char *)objp);
> =

> In !CONFIG_SLUB_DEBUG and !(s->flags & SLAB_RED_ZONE) cases it's always
> 0, and otherwise it's
> =

> 	`objp0 - restore_red_left(objp0)` =3D=3D
> 	`object - (object - s->red_left_pad)` =3D=3D
> 	`s->red_left_pad`.
> =

> This matters if kp_objp is not the object start accessible by the user.
> But in the KFENCE case this is always the case so kp_data_offset=3D0.
>

Ah, right. confused "pointer offset" with "data offset".
it's always 0 in kfence case.

> > BTW, I would prefer implementing something like kfence_obj_info()
> > (called by kmem_dump_obj() and called instead of kmem_obj_info())
> > for better readability.
> =

> Hmm, I guess that saves us from having to fix up both slab.c/slub.c. But
> it makes kmem_obj_info() error-prone to use. What if someone calls
> kmem_obj_info() in future somewhere else? That caller then would have to
> remember to also call kfence_obj_info().
>

Valid point.

> I'd prefer fixing it as close to the root-cause (in kmem_obj_info()) to
> avoid that.
> =

> What do you prefer?

Then what about something like this?

kmem_obj_info(object) {
	if (object is from kfence)
		__kfence_obj_info()
	else
		__kmem_obj_info()
}

> =

> > And when mem_dump_obj() is called, I guess it's for debugging purpose.
> > I think it would be better to let user know the object is allocated
> > from kfence pool. maybe adding if (is_kfence_address(object)) pr_cont("=
 kfence");
> > in kmem_dump_obj() would be enough?
> =

> We can add that.
> =

> Thanks,
> -- Marco

-- =

Thanks,
Hyeonggon
--===============7740637541150591693==--


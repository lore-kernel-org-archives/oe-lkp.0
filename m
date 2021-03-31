Content-Type: multipart/mixed; boundary="===============5013950520264928965=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH mmotm] mm: vmscan: fix shrinker_rwsem in free_shrinker_info()
Date: Wed, 31 Mar 2021 14:12:46 -0700
Message-ID: <alpine.LSU.2.11.2103311340080.1201@eggly.anvils>
In-Reply-To: <CAHbLzkqDAOUjhV0-M-Mv6z7yKHk-WmuHHwJse4vvo82nJscTcA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5013950520264928965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Mar 2021, Yang Shi wrote:
> On Wed, Mar 31, 2021 at 6:54 AM Shakeel Butt <shakeelb@google.com> wrot=
e:
> > On Tue, Mar 30, 2021 at 4:44 PM Hugh Dickins <hughd@google.com> wrote:
> > >
> > > Lockdep warns mm/vmscan.c: suspicious rcu_dereference_protected() usa=
ge!
> > > when free_shrinker_info() is called from mem_cgroup_css_free(): there=
 it
> > > is called with no locking, whereas alloc_shrinker_info() calls it with
> > > down_write of shrinker_rwsem - which seems appropriate.  Rearrange th=
at
> > > so free_shrinker_info() can manage the shrinker_rwsem for itself.
> > >
> > > Link: https://lkml.kernel.org/r/20210317140615.GB28839(a)xsang-OptiPl=
ex-9020
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Signed-off-by: Hugh Dickins <hughd@google.com>
> > > Cc: Yang Shi <shy828301@gmail.com>
> > > ---
> > > Sorry, I've made no attempt to work out precisely where in the series
> > > the locking went missing, nor tried to fit this in as a fix on top of
> > > mm-vmscan-add-shrinker_info_protected-helper.patch
> > > which Oliver reported (and which you notated in mmotm's "series" file=
).
> > > This patch just adds the fix to the end of the series, after
> > > mm-vmscan-shrink-deferred-objects-proportional-to-priority.patch
> >
> > The patch "mm: vmscan: add shrinker_info_protected() helper" replaces
> > rcu_dereference_protected(shrinker_info, true) with
> > rcu_dereference_protected(shrinker_info,
> > lockdep_is_held(&shrinker_rwsem)).
> >
> > I think we don't really need shrinker_rwsem in free_shrinker_info()
> > which is called from css_free(). The bits of the map have already been
> > 'reparented' in css_offline. I think we can remove
> > lockdep_is_held(&shrinker_rwsem) for free_shrinker_info().
> =

> Thanks, Hugh and Shakeel. I missed the report.
> =

> I think Shakeel is correct, shrinker_rwsem is not required in css_free
> path so Shakeel's proposal should be able to fix it.

Yes, looking at it again, I am sure that Shakeel is right, and
that my patch was overkill - no need for shrinker_rwsem there.

Whether it's RCU-safe to free the info there, I have not reviewed at
all: but shrinker_rwsem would not help even if there were an issue.

> I prepared a patch:

Unsigned, white-space damaged, so does not apply.

> =

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 64bf07cc20f2..7348c26d4cac 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -251,7 +251,12 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>         for_each_node(nid) {
>                 pn =3D memcg->nodeinfo[nid];
> -               info =3D shrinker_info_protected(memcg, nid);
> +               /*
> +                * Don't use shrinker_info_protected() helper since
> +                * free_shrinker_info() could be called by css_free()
> +                * without holding shrinker_rwsem.
> +                */

Just because I mis-inferred from the use of shrinker_info_protected()
that shrinker_rwsem was needed here, is no reason to add that comment:
imagine how unhelpfully bigger the kernel source would be if we added
a comment everywhere I had misunderstood something!

> +               info =3D rcu_dereference_protected(pn->shrinker_info, tru=
e);
>                 kvfree(info);
>                 rcu_assign_pointer(pn->shrinker_info, NULL);
>         }

That does it, but I bikeshedded with myself in the encyclopaedic
rcupdate.h, and decided rcu_replace_pointer(pn->shrinker_info, NULL, true)
would be best.  But now see that patch won't fit so well into your series,
and I can't spend more time writing up a justification for it.

I think Andrew should simply delete my fix patch from his queue,
and edit out the
@@ -232,7 +239,7 @@ void free_shrinker_info(struct mem_cgrou
 =

 	for_each_node(nid) {
 		pn =3D memcg->nodeinfo[nid];
-		info =3D rcu_dereference_protected(pn->shrinker_info, true);
+		info =3D shrinker_info_protected(memcg, nid);
 		kvfree(info);
 		rcu_assign_pointer(pn->shrinker_info, NULL);
 	}
hunk from your mm-vmscan-add-shrinker_info_protected-helper.patch
which will then restore free_shrinker_info() to what you propose above.

Thanks,
Hugh
--===============5013950520264928965==--


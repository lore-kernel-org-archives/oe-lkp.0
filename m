Content-Type: multipart/mixed; boundary="===============0874704942872692256=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: relocate 'write_protect_seq' in struct mm_struct
Date: Wed, 16 Jun 2021 09:51:17 +0800
Message-ID: <20210616015117.GA55795@shbuild999.sh.intel.com>
In-Reply-To: <YMj3AeGMzEme/tcp@t490s>
List-Id: <oe-lkp.lists.linux.dev>

--===============0874704942872692256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, Jun 15, 2021 at 02:52:49PM -0400, Peter Xu wrote:
> On Tue, Jun 15, 2021 at 09:11:03AM +0800, Feng Tang wrote:
> > On Mon, Jun 14, 2021 at 11:27:39AM +0800, Feng Tang wrote:
> > > > =

> > > > It seems Ok to me, but didn't we earlier add the has_pinned which
> > > > would have changed the layout too? Are we chasing performance delta=
's
> > > > nobody cares about?
> > > =

> > > Good point! I checked my email folder for 0day's reports, and haven't
> > > found a report related with Peter's commit 008cfe4418b3 ("mm: Introdu=
ce
> > > mm_struct.has_pinned) which adds 'has_pinned' field. =

> > > =

> > > Will run the same test for it and report back.
> > =

> > I run the same will-it-scale/mmap1 case for Peter's commit 008cfe4418b3
> > and its parent commit, and there is no obvious performance diff:
> > =

> > a1bffa48745afbb5 008cfe4418b3dbda2ff820cdd7b =

> > ---------------- --------------------------- =

> > =

> >     344353            -0.4%     342929        will-it-scale.48.threads
> >       7173            -0.4%       7144        will-it-scale.per_thread_=
ops
> > =

> > And from the pahole info for the 2 kernels, Peter's commit adds the
> > 'has_pinned' is put into an existing 4 bytes hole, so all other followi=
ng =

> > fields keep their alignment unchanged. Peter may do it purposely =

> > considering the alignment. So no performance change is expected.
> =

> Thanks for verifying this.  I didn't do it on purpose at least for the in=
itial
> version, but I do remember some comment to fill up that hole, so it may h=
ave
> got moved around.
> =

> Also note that if nothing goes wrong, has_pinned will be gone in the next
> release with commit 3c0c4cda6d48 ("mm: gup: pack has_pinned in MMF_HAS_PI=
NNED",
> 2021-05-26); it's in -mm-next but not reaching the main branch yet.  So t=
hen I
> think the 4 bytes hole should come back to us again, with no perf loss ei=
ther.
 =

Thanks for the heads up.

> What I'm thinking is whether we should move some important (and especially
> CONFIG_* irrelevant) fields at the top of the whole struct define, make s=
ure
> they're most optimal for the common workload and make them static.  Then
> there'll be less or no possibility some new field regress some common wor=
kload
> by accident.  Not sure whether it makes sense to do so.

Yep, it makes sense to me, as it makes the alignment more predictable and
controllable.  But usually we dare not to move the fields around, as it cou=
ld
cause improvments to some cases and regressions to other cases, given diffe=
rent
benchmarks can see different hotspots.  And most of our patches changing =

data structure's layout are mostly regression driven :)

Thanks,
Feng

> Thanks,
> =

> -- =

> Peter Xu
--===============0874704942872692256==--


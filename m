Content-Type: multipart/mixed; boundary="===============2563167442944216265=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: relocate 'write_protect_seq' in struct mm_struct
Date: Tue, 15 Jun 2021 14:52:49 -0400
Message-ID: <YMj3AeGMzEme/tcp@t490s>
In-Reply-To: <20210615011102.GA38780@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2563167442944216265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 09:11:03AM +0800, Feng Tang wrote:
> On Mon, Jun 14, 2021 at 11:27:39AM +0800, Feng Tang wrote:
> > > =

> > > It seems Ok to me, but didn't we earlier add the has_pinned which
> > > would have changed the layout too? Are we chasing performance delta's
> > > nobody cares about?
> > =

> > Good point! I checked my email folder for 0day's reports, and haven't
> > found a report related with Peter's commit 008cfe4418b3 ("mm: Introduce
> > mm_struct.has_pinned) which adds 'has_pinned' field. =

> > =

> > Will run the same test for it and report back.
> =

> I run the same will-it-scale/mmap1 case for Peter's commit 008cfe4418b3
> and its parent commit, and there is no obvious performance diff:
> =

> a1bffa48745afbb5 008cfe4418b3dbda2ff820cdd7b =

> ---------------- --------------------------- =

> =

>     344353            -0.4%     342929        will-it-scale.48.threads
>       7173            -0.4%       7144        will-it-scale.per_thread_ops
> =

> And from the pahole info for the 2 kernels, Peter's commit adds the
> 'has_pinned' is put into an existing 4 bytes hole, so all other following =

> fields keep their alignment unchanged. Peter may do it purposely =

> considering the alignment. So no performance change is expected.

Thanks for verifying this.  I didn't do it on purpose at least for the init=
ial
version, but I do remember some comment to fill up that hole, so it may have
got moved around.

Also note that if nothing goes wrong, has_pinned will be gone in the next
release with commit 3c0c4cda6d48 ("mm: gup: pack has_pinned in MMF_HAS_PINN=
ED",
2021-05-26); it's in -mm-next but not reaching the main branch yet.  So the=
n I
think the 4 bytes hole should come back to us again, with no perf loss eith=
er.

What I'm thinking is whether we should move some important (and especially
CONFIG_* irrelevant) fields at the top of the whole struct define, make sure
they're most optimal for the common workload and make them static.  Then
there'll be less or no possibility some new field regress some common workl=
oad
by accident.  Not sure whether it makes sense to do so.

Thanks,

-- =

Peter Xu

--===============2563167442944216265==--


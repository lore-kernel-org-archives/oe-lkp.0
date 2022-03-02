Content-Type: multipart/mixed; boundary="===============2204059454622640244=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [srcu] 1385139340: will-it-scale.per_process_ops -6.4% regression
Date: Wed, 02 Mar 2022 13:10:48 -0800
Message-ID: <20220302211048.GX4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220302061845.GK4548@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2204059454622640244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Dropping CC. ]

OK, so one obstacle is gone.  Whew!

And please accept my apologies for not having gotten to your most
excellent emails on SRCU resizing.  Fleet issues thus far this week.

							Thanx, Paul

On Wed, Mar 02, 2022 at 02:18:45PM +0800, Feng Tang wrote:
> Hi Paul,
> =

> On Wed, Feb 23, 2022 at 01:40:46PM +0800, Oliver Sang wrote:
> > > > > It is quite possible that this performance shortfall is due to the
> > > > > memory leak present in that version of the commit.  This leak has=
 since
> > > > > been fixed, for example, in the most recent version in -rcu:
> > > > > =

> > > > > 010d3077d17b ("srcu: Dynamically allocate srcu_node array")
> > > > > =

> > > > > Does the new version work better for you?
> > > > =

> > > > =

> > > > by testing 010d3077d17b and its parent, we found the regression sti=
ll exists.
> > > > detail as below [1]
> > > > the config used in tests is attached.
> > > > =

> > > > =

> > > > > Yes, this change does move from an in-srcu_struct array to a poin=
ted-to
> > > > > array for the srcu_node tree, but I am having a very hard time co=
nvincing
> > > > > myself that this would cause a problem.
> > > > =

> > > > yeah, before we sending out the original report, we also had some h=
ard time
> > > > to understand how it relevant. finally we decided to send out for i=
nformation.
> > > > =

> > > > we could support further tests if, say, you have new version. Thanks
> > > =

> > > If I am reading your .config correctly, you are building for 8192 CPU=
s.
> > > This means that with the parent commit, you had multiple statically
> > > allocated arrays each with 8,000+ srcu_node structures.  With the chi=
ld
> > > commit, these arrays became dynamically allocated and much smaller.
> > > =

> > > Might the resulting difference in memory layout be responsible for the
> > > difference in performance?  Yes, normally we think in terms of smaller
> > > memory being faster, but cachelines, caches, TLBs, and soforth mean t=
hat
> > > pretty much anything could happen.
> > > =

> > > Thoughts?
> > =

> > Thanks for information!
> > =

> > we tried to rebuild kernel with only 256CPUs. but the regression still =
exist.
> =

> We've also done some further check, like adding more forced alignment to
> kernel text/code, and adding padding into struct 'srcu_struct' to
> restore the previous alignments of internal members, but none can heal =

> this 6.4% change.
> =

> Meanwhile we did some other checks:
> =

> * This is found on one generation of Xeon platform, and we tried on 2
>   other generations of Xeon where this regression can't be reproduced.
> =

> * The test is starting 16 processes on a 2 Socket 128 CPU platform,
>   and if we change parameter to test 32/64/128 processes, there are
>   no regressions.
> =

> So this looks to be very specific for some case, and my personal thought
> is this is not a critical blocking issue.
> =

> Thanks,
> Feng
> =

> =

>=20
--===============2204059454622640244==--


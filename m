Content-Type: multipart/mixed; boundary="===============5456365681175871292=="
MIME-Version: 1.0
From: Darrick J. Wong <djwong@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Thu, 21 Jul 2022 14:38:51 -0700
Message-ID: <YtnHa/IbHyD1QPh0@magnolia>
In-Reply-To: <20220721213337.GV3861211@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============5456365681175871292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 07:33:37AM +1000, Dave Chinner wrote:
> On Thu, Jul 21, 2022 at 11:08:38PM +0800, kernel test robot wrote:
> > =

> > (just FYI for the possible performance impact of disabling large folios,
> > our config, as attached, set default N to XFS_LARGE_FOLIOS)
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -91.7% regression of vm-scalability.throughput due to=
 commit:
> > =

> > =

> > commit: 345a4666a721a81c343186768cdd95817767195f ("xfs: disable large f=
olios except for developers")
> =

> Say what? I've never seen that change go past on a public list...
> =

> > https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs-5=
.20-merge
> =

> Oh, it's in a developer's working tree, not something that has been
> proposed for review let alone been merged.

Correct, djwong-dev has a patch so that I can disable multipage folios
so that I could get other QA work done while willy and I try to sort out
the generic/522 corruption problems.

> So why is this report being sent to lkml, linux-xfs, etc as if it
> was a change merged into an upstream tree rather than just the
> developer who owns the tree the commit is in?

I was wondering that myself.

--D

> -Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
--===============5456365681175871292==--


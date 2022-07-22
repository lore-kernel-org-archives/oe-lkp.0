Content-Type: multipart/mixed; boundary="===============4155069605269728274=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Fri, 22 Jul 2022 13:23:02 +1000
Message-ID: <20220722032302.GT3600936@dread.disaster.area>
In-Reply-To: <YtoRZkEHj+FaafTm@magnolia>
List-Id: <oe-lkp.lists.linux.dev>

--===============4155069605269728274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 07:54:30PM -0700, Darrick J. Wong wrote:
> On Fri, Jul 22, 2022 at 10:34:38AM +0800, Oliver Sang wrote:
> > =

> > (removed public list)
> > =

> > Hi Darrick, Hi Dave,
> > =

> > On Thu, Jul 21, 2022 at 02:38:51PM -0700, Darrick J. Wong wrote:
> > > On Fri, Jul 22, 2022 at 07:33:37AM +1000, Dave Chinner wrote:
> > > > On Thu, Jul 21, 2022 at 11:08:38PM +0800, kernel test robot wrote:
> > > > > =

> > > > > (just FYI for the possible performance impact of disabling large =
folios,
> > > > > our config, as attached, set default N to XFS_LARGE_FOLIOS)
> > > > > =

> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -91.7% regression of vm-scalability.throughput =
due to commit:
> > > > > =

> > > > > =

> > > > > commit: 345a4666a721a81c343186768cdd95817767195f ("xfs: disable l=
arge folios except for developers")
> > > > =

> > > > Say what? I've never seen that change go past on a public list...
> > =

> > we actually not only monitor mailing list, we also monitor public repos,
> > such like this report is upon
> >    https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git
> > =

> > and currently it seems hard to us to differentiate if new changes in a =
repo
> > will go to a public list. any suggestion?
> =

> Hm...  I was under the impression that the stuff under
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/$PERSON/
> =

> are all personal repos.
> =

> For XFS, the official repos that the XFS maintainers use to corral
> patches for for-next are all in separate areas:
> =

> https://git.kernel.org/pub/scm/fs/xfs/*
> =

> Build and testing problems with anything under there should continue to
> go to the public list, patch authors, etc. as they do now.
> =

> But perhaps XFS is the only project that doesn't mix the public repo and
> the maintainer's private repo in this manner?

Pretty much.

XFS is kinda special in that regard, as the official XFS repos were
specifically set up to allow for rotating group maintainership.
i.e. the repo belongs to the project, not the maintainer, and so the
location of the repo doesn't change as maintainers come and go.

This is in stark contrast to the rest of the Linux kernel community,
where we typically see the "Maintainer for Life" pattern of a
personal repo becoming the public dev tree for a given subsystem.

IOWs, XFS can change maintainers at will, have multiple people
committing to the official project trees, etc, but no-one downstream
needs to be aware of who is actually acting as maintainer or change
anything when the maintainers swap around.

However, for pretty much any other kernel subsystem, the change of a
maintainer means a change of source repo location and there is now a
downstream update problem....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============4155069605269728274==--


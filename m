Content-Type: multipart/mixed; boundary="===============1828586752577313157=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Mon, 15 Aug 2022 16:47:38 +0800
Message-ID: <YvoIKvr/h1KqkP49@xsang-OptiPlex-9020>
In-Reply-To: <20220722032302.GT3600936@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1828586752577313157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave, Hi Darrick,

On Fri, Jul 22, 2022 at 01:23:02PM +1000, Dave Chinner wrote:
> On Thu, Jul 21, 2022 at 07:54:30PM -0700, Darrick J. Wong wrote:
> > On Fri, Jul 22, 2022 at 10:34:38AM +0800, Oliver Sang wrote:
> > > =

> > > we actually not only monitor mailing list, we also monitor public rep=
os,
> > > such like this report is upon
> > >    https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git
> > > =

> > > and currently it seems hard to us to differentiate if new changes in =
a repo
> > > will go to a public list. any suggestion?
> > =

> > Hm...  I was under the impression that the stuff under
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/$PERSON/
> > =

> > are all personal repos.
> > =

> > For XFS, the official repos that the XFS maintainers use to corral
> > patches for for-next are all in separate areas:
> > =

> > https://git.kernel.org/pub/scm/fs/xfs/*
> > =

> > Build and testing problems with anything under there should continue to
> > go to the public list, patch authors, etc. as they do now.
> > =

> > But perhaps XFS is the only project that doesn't mix the public repo and
> > the maintainer's private repo in this manner?
> =

> Pretty much.
> =

> XFS is kinda special in that regard, as the official XFS repos were
> specifically set up to allow for rotating group maintainership.
> i.e. the repo belongs to the project, not the maintainer, and so the
> location of the repo doesn't change as maintainers come and go.
> =

> This is in stark contrast to the rest of the Linux kernel community,
> where we typically see the "Maintainer for Life" pattern of a
> personal repo becoming the public dev tree for a given subsystem.
> =

> IOWs, XFS can change maintainers at will, have multiple people
> committing to the official project trees, etc, but no-one downstream
> needs to be aware of who is actually acting as maintainer or change
> anything when the maintainers swap around.
> =

> However, for pretty much any other kernel subsystem, the change of a
> maintainer means a change of source repo location and there is now a
> downstream update problem....

Thanks a lot for information!

we refined our process to avoid sending report to lkml or linux-xfs for
djwong/xfs-linux.git.

one recent report is:

[xfs]  49dd4a937d: INFO:task_blocked_for_more_than#seconds

which sends to:

TO: Darrick J. Wong <djwong@kernel.org>
CC: Darrick J. Wong <darrick.wong@oracle.com>, lkp(a)lists.01.org, lkp(a)=
intel.com

lkp(a)intel.com is just our internal team faceless account so very small au=
dience

lkp(a)lists.01.org is a public mailing list so if someone register it, she/=
he
will also receive the mail. we also use this mailing list to archive all our
reports for such like statistic purpose. if you still have some concern abo=
ut
this, could you let us know? Thanks a lot!



> =

> Cheers,
> =

> Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
--===============1828586752577313157==--


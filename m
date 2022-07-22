Content-Type: multipart/mixed; boundary="===============5825519188536582971=="
MIME-Version: 1.0
From: Darrick J. Wong <djwong@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Thu, 21 Jul 2022 19:54:30 -0700
Message-ID: <YtoRZkEHj+FaafTm@magnolia>
In-Reply-To: <YtoMvmz21pM2LUsR@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5825519188536582971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 10:34:38AM +0800, Oliver Sang wrote:
> =

> (removed public list)
> =

> Hi Darrick, Hi Dave,
> =

> On Thu, Jul 21, 2022 at 02:38:51PM -0700, Darrick J. Wong wrote:
> > On Fri, Jul 22, 2022 at 07:33:37AM +1000, Dave Chinner wrote:
> > > On Thu, Jul 21, 2022 at 11:08:38PM +0800, kernel test robot wrote:
> > > > =

> > > > (just FYI for the possible performance impact of disabling large fo=
lios,
> > > > our config, as attached, set default N to XFS_LARGE_FOLIOS)
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -91.7% regression of vm-scalability.throughput du=
e to commit:
> > > > =

> > > > =

> > > > commit: 345a4666a721a81c343186768cdd95817767195f ("xfs: disable lar=
ge folios except for developers")
> > > =

> > > Say what? I've never seen that change go past on a public list...
> =

> we actually not only monitor mailing list, we also monitor public repos,
> such like this report is upon
>    https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git
> =

> and currently it seems hard to us to differentiate if new changes in a re=
po
> will go to a public list. any suggestion?

Hm...  I was under the impression that the stuff under

https://git.kernel.org/pub/scm/linux/kernel/git/$PERSON/

are all personal repos.

For XFS, the official repos that the XFS maintainers use to corral
patches for for-next are all in separate areas:

https://git.kernel.org/pub/scm/fs/xfs/*

Build and testing problems with anything under there should continue to
go to the public list, patch authors, etc. as they do now.

But perhaps XFS is the only project that doesn't mix the public repo and
the maintainer's private repo in this manner?

> > > =

> > > > https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git x=
fs-5.20-merge
> > > =

> > > Oh, it's in a developer's working tree, not something that has been
> > > proposed for review let alone been merged.
> > =

> > Correct, djwong-dev has a patch so that I can disable multipage folios
> > so that I could get other QA work done while willy and I try to sort out
> > the generic/522 corruption problems.
> =

> we monitor all branches on
>    https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git
> now.
> =

> any branch pattern you could kindly share with us that we could ignore?
> or should we only send reports to limited person (such like repo owner, p=
atch
> autor, etc.) for some particular branches?

At least for pub/scm/linux/kernel/git/djwong/, you can send all the
reports to me and only me. :)

> it's kind of hard for us to determine from branch names for now, since
> this repo has lots of branches:
> =

> djwong-xfs$ git branch | wc -l
> 295

Yeah, I should clean out some of the old ones.

Thanks for your help sorting this out. :)

--D

> =

> > =

> > > So why is this report being sent to lkml, linux-xfs, etc as if it
> > > was a change merged into an upstream tree rather than just the
> > > developer who owns the tree the commit is in?
> > =

> > I was wondering that myself.
> =

> sorry for this, if you could give us some guidances based on above questi=
ons,
> we could refine our report process to avoid this happen again. Thanks a l=
ot!
> =

> > =

> > --D
> > =

> > > -Dave.
> > > -- =

> > > Dave Chinner
> > > david(a)fromorbit.com
--===============5825519188536582971==--


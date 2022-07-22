Content-Type: multipart/mixed; boundary="===============6363674486179114372=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Fri, 22 Jul 2022 10:10:02 +0800
Message-ID: <YtoG+kcaC8yfMEZW@xsang-OptiPlex-9020>
In-Reply-To: <YtnHa/IbHyD1QPh0@magnolia>
List-Id: <oe-lkp.lists.linux.dev>

--===============6363674486179114372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Darrick, Hi Dave, and all,

sorry for this report is annoying according to Darrick and Dave's comments
below.
we will investigate this case and refine our report process.


On Thu, Jul 21, 2022 at 02:38:51PM -0700, Darrick J. Wong wrote:
> On Fri, Jul 22, 2022 at 07:33:37AM +1000, Dave Chinner wrote:
> > On Thu, Jul 21, 2022 at 11:08:38PM +0800, kernel test robot wrote:
> > > =

> > > (just FYI for the possible performance impact of disabling large foli=
os,
> > > our config, as attached, set default N to XFS_LARGE_FOLIOS)
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -91.7% regression of vm-scalability.throughput due =
to commit:
> > > =

> > > =

> > > commit: 345a4666a721a81c343186768cdd95817767195f ("xfs: disable large=
 folios except for developers")
> > =

> > Say what? I've never seen that change go past on a public list...
> > =

> > > https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs=
-5.20-merge
> > =

> > Oh, it's in a developer's working tree, not something that has been
> > proposed for review let alone been merged.
> =

> Correct, djwong-dev has a patch so that I can disable multipage folios
> so that I could get other QA work done while willy and I try to sort out
> the generic/522 corruption problems.
> =

> > So why is this report being sent to lkml, linux-xfs, etc as if it
> > was a change merged into an upstream tree rather than just the
> > developer who owns the tree the commit is in?
> =

> I was wondering that myself.
> =

> --D
> =

> > -Dave.
> > -- =

> > Dave Chinner
> > david(a)fromorbit.com
--===============6363674486179114372==--


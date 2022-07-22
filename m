Content-Type: multipart/mixed; boundary="===============2911463543427474636=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Fri, 22 Jul 2022 10:34:38 +0800
Message-ID: <YtoMvmz21pM2LUsR@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2911463543427474636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


(removed public list)

Hi Darrick, Hi Dave,

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

we actually not only monitor mailing list, we also monitor public repos,
such like this report is upon
   https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git

and currently it seems hard to us to differentiate if new changes in a repo
will go to a public list. any suggestion?

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

we monitor all branches on
   https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git
now.

any branch pattern you could kindly share with us that we could ignore?
or should we only send reports to limited person (such like repo owner, pat=
ch
autor, etc.) for some particular branches?

it's kind of hard for us to determine from branch names for now, since
this repo has lots of branches:

djwong-xfs$ git branch | wc -l
295

> =

> > So why is this report being sent to lkml, linux-xfs, etc as if it
> > was a change merged into an upstream tree rather than just the
> > developer who owns the tree the commit is in?
> =

> I was wondering that myself.

sorry for this, if you could give us some guidances based on above question=
s,
we could refine our report process to avoid this happen again. Thanks a lot!

> =

> --D
> =

> > -Dave.
> > -- =

> > Dave Chinner
> > david(a)fromorbit.com
--===============2911463543427474636==--


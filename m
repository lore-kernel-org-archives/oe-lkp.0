Content-Type: multipart/mixed; boundary="===============3993388250987989695=="
MIME-Version: 1.0
From: Darrick J. Wong <djwong@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Thu, 21 Jul 2022 19:21:39 -0700
Message-ID: <YtoJs8mv7vle8Mhh@magnolia>
In-Reply-To: <YtoG+kcaC8yfMEZW@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3993388250987989695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 10:10:02AM +0800, Oliver Sang wrote:
> Hi Darrick, Hi Dave, and all,
> =

> sorry for this report is annoying according to Darrick and Dave's comments
> below.
> we will investigate this case and refine our report process.

FWIW, you can still send /me/ reports about the xfs development patches
I post to djwong/xfs-linux.git, but it's not necessary to cc linux-xfs
with that, since most of those patches are still under development
and/or working their way through patch review.

--D

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
> > =

> > > So why is this report being sent to lkml, linux-xfs, etc as if it
> > > was a change merged into an upstream tree rather than just the
> > > developer who owns the tree the commit is in?
> > =

> > I was wondering that myself.
> > =

> > --D
> > =

> > > -Dave.
> > > -- =

> > > Dave Chinner
> > > david(a)fromorbit.com
--===============3993388250987989695==--


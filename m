Content-Type: multipart/mixed; boundary="===============6121046003234451047=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 345a4666a7: vm-scalability.throughput -91.7% regression
Date: Fri, 22 Jul 2022 07:33:37 +1000
Message-ID: <20220721213337.GV3861211@dread.disaster.area>
In-Reply-To: <Ytlr9vZbF4SOfA2n@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6121046003234451047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:08:38PM +0800, kernel test robot wrote:
> =

> (just FYI for the possible performance impact of disabling large folios,
> our config, as attached, set default N to XFS_LARGE_FOLIOS)
> =

> =

> Greeting,
> =

> FYI, we noticed a -91.7% regression of vm-scalability.throughput due to c=
ommit:
> =

> =

> commit: 345a4666a721a81c343186768cdd95817767195f ("xfs: disable large fol=
ios except for developers")

Say what? I've never seen that change go past on a public list...

> https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs-5.2=
0-merge

Oh, it's in a developer's working tree, not something that has been
proposed for review let alone been merged.

So why is this report being sent to lkml, linux-xfs, etc as if it
was a change merged into an upstream tree rather than just the
developer who owns the tree the commit is in?

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============6121046003234451047==--


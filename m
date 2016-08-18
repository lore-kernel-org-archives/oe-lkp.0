Content-Type: multipart/mixed; boundary="===============6305227136371194260=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 18 Aug 2016 12:44:28 +1000
Message-ID: <20160818024427.GC22388@dastard>
In-Reply-To: <20160817154907.GI8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6305227136371194260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> On Tue, Aug 16, 2016 at 10:47:36AM -0700, Linus Torvalds wrote:
> > I've always preferred to see direct reclaim as the primary model for
> > reclaim, partly in order to throttle the actual "bad" process, but
> > also because "kswapd uses lots of CPU time" is such a nasty thing to
> > even begin guessing about.
> > =

> =

> While I agree that bugs with high CPU usage from kswapd are a pain,
> I'm reluctant to move towards direct reclaim being the primary mode. The
> stalls can be severe and there is no guarantee that the process punished
> is the process responsible. I'm basing this assumption on observations
> of severe performance regressions when I accidentally broke kswapd during
> the development of node-lru.
> =

> > So I have to admit to liking that "make kswapd sleep a bit if it's
> > just looping" logic that got removed in that commit.
> > =

> =

> It's primarily the direct reclaimer that is affected by that patch.
> =

> > And looking at DaveC's numbers, it really feels like it's not even
> > what we do inside the locked region that is the problem. Sure,
> > __delete_from_page_cache() (which is most of it) is at 1.86% of CPU
> > time (when including all the things it calls), but that still isn't
> > all that much. Especially when compared to just:
> > =

> >    0.78%  [kernel]  [k] _raw_spin_unlock_irqrestore
> > =

> =

> The profile is shocking for such a basic workload. I automated what Dave
> described with xfs_io except that the file size is 2*RAM. The filesystem
> is sized to be roughly the same size as the file to minimise variances
> due to block layout. A call-graph profile collected on bare metal UMA with
> numa=3Dfake=3D4 and paravirt spinlocks showed
> =

>      1.40%     0.16%  kswapd1          [kernel.vmlinux]            [k] _r=
aw_spin_lock_irqsave
>      1.36%     0.16%  kswapd2          [kernel.vmlinux]            [k] _r=
aw_spin_lock_irqsave
>      1.21%     0.12%  kswapd0          [kernel.vmlinux]            [k] _r=
aw_spin_lock_irqsave
>      1.12%     0.13%  kswapd3          [kernel.vmlinux]            [k] _r=
aw_spin_lock_irqsave
>      0.81%     0.45%  xfs_io           [kernel.vmlinux]            [k] _r=
aw_spin_lock_irqsave
> =

> Those contention figures are not great but they are not terrible either. =
The
> vmstats told me there was no direct reclaim activity so either my theory
> is wrong or this machine is not reproducing the same problem Dave is seei=
ng.

No, that's roughly the same un-normalised CPU percentage I am seeing
in spinlock contention. i.e. take way the idle CPU in the profile
(probably upwards of 80% if it's a 16p machine), and instead look at
that figure as a percentage of total CPU used by the workload. Then
you'll that it's 30-40% of the total CPU consumed by the workload.

> I have partial results from a 2-socket and 4-socket machine. 2-socket spe=
nds
> roughtly 1.8% in _raw_spin_lock_irqsave and 4-socket spends roughtly 3%,
> both with no direct reclaim. Clearly the problem gets worse the more NUMA
> nodes there are but not to the same extent Dave reports.
> =

> I believe potential reasons why I do not see the same problem as Dave are;
> =

> 1. Different memory sizes changing timing
> 2. Dave has fast storage and I'm using a spinning disk

This particular is using an abused 3 year old SATA SSD that still
runs at 500MB/s on sequential writes. This is "cheap desktop"
capability these days and is nowhere near what I'd call "fast".

> 3. Lock contention problems are magnified inside KVM
> =

> I think 3 is a good possibility if contended locks result in expensive
> exiting and reentery of the guest. I have a vague recollection that a
> spinning vcpu exits the guest but I did not confirm that.

I don't think anything like that has been implemented in the pv
spinlocks yet. They just spin right now - it's the same lock
implementation as the host. Also, Context switch rates measured on
the host are not significantly higher than what is measured in the
guest, so there doesn't appear to be any extra scheduling on the
host side occurring.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============6305227136371194260==--


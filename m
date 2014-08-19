Content-Type: multipart/mixed; boundary="===============1460907868925031192=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] f7b5d647946: -3.0% dbench.throughput-MB/sec
Date: Tue, 19 Aug 2014 20:11:51 +0100
Message-ID: <20140819191139.GG10146@suse.de>
In-Reply-To: <20140819154351.GA2697@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1460907868925031192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 11:43:51PM +0800, Fengguang Wu wrote:
> On Tue, Aug 19, 2014 at 03:34:28PM +0100, Mel Gorman wrote:
> > On Tue, Aug 19, 2014 at 12:41:34PM +0800, Fengguang Wu wrote:
> > > Hi Mel,
> > > =

> > > We noticed a minor dbench throughput regression on commit
> > > f7b5d647946aae1647bf5cd26c16b3a793c1ac49 ("mm: page_alloc: abort fair
> > > zone allocation policy when remotes nodes are encountered").
> > > =

> > > testcase: ivb44/dbench/100%
> > > =

> > > bb0b6dffa2ccfbd  f7b5d647946aae1647bf5cd26
> > > ---------------  -------------------------
> > >      25692 =C2=B1 0%      -3.0%      24913 =C2=B1 0%  dbench.throughp=
ut-MB/sec
> > >    6974259 =C2=B1 6%     -12.1%    6127616 =C2=B1 0%  meminfo.DirectM=
ap2M
> > >      18.43 =C2=B1 0%      -4.6%      17.59 =C2=B1 0%  turbostat.RAM_W
> > >       9302 =C2=B1 0%      -3.6%       8965 =C2=B1 1%  time.user_time
> > >    1425791 =C2=B1 1%      -2.0%    1396598 =C2=B1 0%  time.involuntar=
y_context_switches
> > > =

> > > Disclaimer:
> > > Results have been estimated based on internal Intel analysis and are =
provided
> > > for informational purposes only. Any difference in system hardware or=
 software
> > > design or configuration may affect actual performance.
> > > =

> > =

> > DirectMap2M changing is a major surprise and doesn't make sense for this
> > machine.
> =

> The ivb44's hardware configuration is
> =

>         model: Ivytown Ivy Bridge-EP
>         nr_cpu: 48
>         memory: 64G
> =

> And note that this is an in-memory dbench run, which is why
> dbench.throughput-MB/sec is so high.
> =


Ok, it's a NUMA machine. I expect in this case that prior to the patch more
local memory would have been used on node 0 due to the fair zone allocation
policy skipping remote nodes. The patch corrects the behaviour of zonelist
but the downside is more remote accesses for processes running on node 0. T=
he
behaviour is correct although not necessarily desirable from a performance
point of view.  Users should boot with numa_zonelist_order=3Dnode if it's
a problem.

-- =

Mel Gorman
SUSE Labs

--===============1460907868925031192==--


Content-Type: multipart/mixed; boundary="===============5465015497307962630=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Mon, 18 May 2020 15:00:46 +0800
Message-ID: <20200518070046.GA23559@xsang-OptiPlex-9020>
In-Reply-To: <20200515141226.17700-1-hdanton@sina.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5465015497307962630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 10:12:26PM +0800, Hillf Danton wrote:
> =

> On Fri, 15 May 2020 09:43:39 +0800 Oliver Sang wrote:
> > On Thu, May 14, 2020 at 07:09:35PM +0200, Vincent Guittot wrote:
> > > Hi Oliver,
> > > =

> > > On Thu, 14 May 2020 at 16:05, kernel test robot <oliver.sang@intel.=
com> wrote:
> > > >
> > > > Hi Vincent Guittot,
> > > >
> > > > Below report FYI.
> > > > Last year, we actually reported an improvement "[sched/fair] 0b0695=
f2b3:
> > > > vm-scalability.median 3.1% improvement" on link [1].
> > > > but now we found the regression on pts.compress-gzip.
> > > > This seems align with what showed in "[v4,00/10] sched/fair: rework=
 the CFS
> > > > load balance" (link [2]), where showed the reworked load balance co=
uld have
> > > > both positive and negative effect for different test suites.
> > > =

> > > We have tried to run  all possible use cases but it's impossible to
> > > covers all so there were a possibility that one that is not covered,
> > > would regressed.
> > > =

> > > > And also from link [3], the patch set risks regressions.
> > > >
> > > > We also confirmed this regression on another platform
> > > > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > > > below is the data (lower is better).
> > > > v5.4    4.1
> > > > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > > > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > > > v5.5    5.18
> > > > v5.6    4.62
> > > > v5.7-rc2    4.53
> > > > v5.7-rc3    4.59
> > > >
> > > > It seems there are some recovery on latest kernels, but not fully b=
ack.
> =

> Hi
> =

> Here is a tiny diff for growing balance in the over loaded case. Wish it's
> likely going to help you spot the factors behind the regression.

Thanks Hillf!
just wondering what's the target release of below patch?

> =

> Hillf
> =

> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8683,15 +8683,12 @@ find_idlest_group(struct sched_domain *s
>  	struct sched_group *idlest =3D NULL, *local =3D NULL, *group =3D sd->gr=
oups;
>  	struct sg_lb_stats local_sgs, tmp_sgs;
>  	struct sg_lb_stats *sgs;
> -	unsigned long imbalance;
> +	unsigned long hal, lal;
>  	struct sg_lb_stats idlest_sgs =3D {
>  			.avg_load =3D UINT_MAX,
>  			.group_type =3D group_overloaded,
>  	};
>  =

> -	imbalance =3D scale_load_down(NICE_0_LOAD) *
> -				(sd->imbalance_pct-100) / 100;
> -
>  	do {
>  		int local_group;
>  =

> @@ -8744,31 +8741,26 @@ find_idlest_group(struct sched_domain *s
>  =

>  	switch (local_sgs.group_type) {
>  	case group_overloaded:
> -	case group_fully_busy:
> -		/*
> -		 * When comparing groups across NUMA domains, it's possible for
> -		 * the local domain to be very lightly loaded relative to the
> -		 * remote domains but "imbalance" skews the comparison making
> -		 * remote CPUs look much more favourable. When considering
> -		 * cross-domain, add imbalance to the load on the remote node
> -		 * and consider staying local.
> -		 */
> -
> -		if ((sd->flags & SD_NUMA) &&
> -		    ((idlest_sgs.avg_load + imbalance) >=3D local_sgs.avg_load))
> -			return NULL;
> +		if (idlest_sgs.avg_load < local_sgs.avg_load) {
> +			hal =3D local_sgs.avg_load;
> +			lal =3D idlest_sgs.avg_load;
> +		} else {
> +			lal =3D local_sgs.avg_load;  /*  low avg load */
> +			hal =3D idlest_sgs.avg_load; /* high avg load */
> +		}
>  =

> -		/*
> -		 * If the local group is less loaded than the selected
> -		 * idlest group don't try and push any tasks.
> -		 */
> -		if (idlest_sgs.avg_load >=3D (local_sgs.avg_load + imbalance))
> +		/* No push if groups are balanced in terms of load */
> +		if (100 * hal <=3D sd->imbalance_pct * lal)
>  			return NULL;
>  =

> -		if (100 * local_sgs.avg_load <=3D sd->imbalance_pct * idlest_sgs.avg_l=
oad)
> +		/* No push if it only grows imbalance */
> +		if (hal =3D=3D idlest_sgs.avg_load)
>  			return NULL;
>  		break;
>  =

> +	case group_fully_busy:
> +		/* No push because groups are unusually balanced */
> +		return NULL;
>  	case group_imbalanced:
>  	case group_asym_packing:
>  		/* Those type are not used in the slow wakeup path */
> --
> =

> > > > We were just wondering whether you could share some lights the furt=
her works
> > > > on the load balance after patch set [2] which could cause the perfo=
rmance
> > > > change?
> > > > And whether you have plan to refine the load balance algorithm furt=
her?
> > > =

> > > I'm going to have a look at your regression to understand what is
> > > going wrong and how it can be fixed
> > =

> > Thanks a lot!
> > =

> > > =

> > > Thanks
> > > Vincent
> > > =

> > =

>=20
--===============5465015497307962630==--


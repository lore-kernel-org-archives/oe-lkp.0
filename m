Content-Type: multipart/mixed; boundary="===============7108670775162405682=="
MIME-Version: 1.0
From: Sang, Oliver <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 6499b1b2dd: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Fri, 06 Mar 2020 14:22:29 +0000
Message-ID: <F09C421E5D2EBE40AFD7EEA977444DDC4D5D6DC7@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <20200306072827.14452-1-hdanton@sina.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7108670775162405682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Hillf Danton <hdanton@sina.com>
> Sent: Friday, March 6, 2020 3:28 PM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>; Ingo Molnar
> <mingo@kernel.org>; Mel Gorman <mgorman@techsingularity.net>; Peter
> Zijlstra <a.p.zijlstra@chello.nl>; Juri Lelli <juri.lelli@redhat.com>=
; Valentin
> Schneider <valentin.schneider@arm.com>; Phil Auld <pauld@redhat.com>;=
 Hillf
> Danton <hdanton@sina.com>; LKML <linux-kernel@vger.kernel.org>; Andrew
> Morton <akpm@linux-foundation.org>; Stephen Rothwell
> <sfr@canb.auug.org.au>; lkp(a)lists.01.org
> Subject: Re: [sched/numa] 6499b1b2dd: phoronix-test-suite.aom-
> av1.0.frames_per_second -25.0% regression
> =

> =

> On Fri, 6 Mar 2020 10:35:51 +0800 from kernel test robot
> <oliver.sang@intel.com>
> >
> > Greeting,
> >
> > FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-
> av1.0.frames_per_second due to commit:
> >
> >
> > commit: 6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa:
> Replace
> > runnable_load_avg by load_avg")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
> > master
> >
> Hi Oliver
> =

> Thanks for your report.
> =

> It's fixed in fb86f5b21192 ("sched/numa: Use similar logic to the load ba=
lancer
> for moving between domains with spare capacity") and if you're curious, s=
ee the
> force of that cure using the following diff.
> =

> Hillf

Thanks a lot for information!

> --
> =

> =

> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1594,11 +1594,6 @@ static bool load_too_imbalanced(long src
>  	long orig_src_load, orig_dst_load;
>  	long src_capacity, dst_capacity;
> =

> -
> -	/* If dst node has spare capacity, there is no real load imbalance */
> -	if (env->dst_stats.node_type =3D=3D node_has_spare)
> -		return false;
> -
>  	/*
>  	 * The load is corrected for the CPU capacity available on each node.
>  	 *
> --

--===============7108670775162405682==--


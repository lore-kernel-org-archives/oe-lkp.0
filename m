Content-Type: multipart/mixed; boundary="===============3256800807640238868=="
MIME-Version: 1.0
From: Preeti U Murthy <preeti@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Tue, 12 Aug 2014 09:29:19 +0530
Message-ID: <53E99117.9010500@linux.vnet.ibm.com>
In-Reply-To: <20140811133352.GC9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3256800807640238868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/11/2014 07:03 PM, Peter Zijlstra wrote:
> =

> Now I think I see why this is; we've reduced load balancing frequency
> significantly on this machine due to:

We have also changed the value of busy_factor to 32 from 64 across all
domains. This would contribute to increased frequency of load balancing?

Regards
Preeti U Murthy
> =

> =

> -#define SD_SIBLING_INIT (struct sched_domain) {                         =
       \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 2,                                   =
 \
> =

> =

> -#define SD_MC_INIT (struct sched_domain) {                             \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 4,                                   =
 \
> =

> =

> -#define SD_CPU_INIT (struct sched_domain) {                            \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 4,                                   =
 \
> =

> =

>         *sd =3D (struct sched_domain){
>                 .min_interval           =3D sd_weight,
>                 .max_interval           =3D 2*sd_weight,
> =

> Which both increased the min and max value significantly for all domains
> involved.
> =

> That said; I think we might want to do something like the below; I can
> imagine decreasing load balancing too much will negatively impact other
> workloads.
> =

> Maybe slightly modified to make sure the first domain has a min_interval
> of 1.
> =

> ---
>  kernel/sched/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1211575a2208..67ed5d854da1 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6049,8 +6049,8 @@ sd_init(struct sched_domain_topology_level *tl, int=
 cpu)
>  		sd_flags &=3D ~TOPOLOGY_SD_FLAGS;
>  =

>  	*sd =3D (struct sched_domain){
> -		.min_interval		=3D sd_weight,
> -		.max_interval		=3D 2*sd_weight,
> +		.min_interval		=3D max(1, sd_weight/2),
> +		.max_interval		=3D sd_weight,
>  		.busy_factor		=3D 32,
>  		.imbalance_pct		=3D 125,
>  =

> @@ -6076,7 +6076,7 @@ sd_init(struct sched_domain_topology_level *tl, int=
 cpu)
>  					,
>  =

>  		.last_balance		=3D jiffies,
> -		.balance_interval	=3D sd_weight,
> +		.balance_interval	=3D max(1, sd_weight/2),
>  		.smt_gain		=3D 0,
>  		.max_newidle_lb_cost	=3D 0,
>  		.next_decay_max_lb_cost	=3D jiffies,
> =



--===============3256800807640238868==--


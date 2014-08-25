Content-Type: multipart/mixed; boundary="===============8706461851640189824=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Mon, 25 Aug 2014 15:47:39 +0200
Message-ID: <CAKfTPtBnyeO1+1=Sbf6On-eXRG3th=0gsfhDectyQQuMCLeP-g@mail.gmail.com>
In-Reply-To: <20140811133352.GC9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8706461851640189824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11 August 2014 15:33, Peter Zijlstra <peterz@infradead.org> wrote:

[snip]

>
>
> Now I think I see why this is; we've reduced load balancing frequency
> significantly on this machine due to:

I agree with you about the root cause

>
>
> -#define SD_SIBLING_INIT (struct sched_domain) {                         =
       \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 2,                                   =
 \
>
>
> -#define SD_MC_INIT (struct sched_domain) {                             \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 4,                                   =
 \
>
>
> -#define SD_CPU_INIT (struct sched_domain) {                            \
> -       .min_interval           =3D 1,                                   =
 \
> -       .max_interval           =3D 4,                                   =
 \
>
>
>         *sd =3D (struct sched_domain){
>                 .min_interval           =3D sd_weight,
>                 .max_interval           =3D 2*sd_weight,
>
> Which both increased the min and max value significantly for all domains
> involved.
>
> That said; I think we might want to do something like the below; I can
> imagine decreasing load balancing too much will negatively impact other
> workloads.
>
> Maybe slightly modified to make sure the first domain has a min_interval
> of 1.
>
> ---
>  kernel/sched/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1211575a2208..67ed5d854da1 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6049,8 +6049,8 @@ sd_init(struct sched_domain_topology_level *tl, int=
 cpu)
>                 sd_flags &=3D ~TOPOLOGY_SD_FLAGS;
>
>         *sd =3D (struct sched_domain){
> -               .min_interval           =3D sd_weight,
> -               .max_interval           =3D 2*sd_weight,
> +               .min_interval           =3D max(1, sd_weight/2),
> +               .max_interval           =3D sd_weight,

What about using ilog2 like the default scaling mode of other
scheduler tunables ?

Regards,
Vincent

>                 .busy_factor            =3D 32,
>                 .imbalance_pct          =3D 125,
>
> @@ -6076,7 +6076,7 @@ sd_init(struct sched_domain_topology_level *tl, int=
 cpu)
>                                         ,
>
>                 .last_balance           =3D jiffies,
> -               .balance_interval       =3D sd_weight,
> +               .balance_interval       =3D max(1, sd_weight/2),
>                 .smt_gain               =3D 0,
>                 .max_newidle_lb_cost    =3D 0,
>                 .next_decay_max_lb_cost =3D jiffies,

--===============8706461851640189824==--


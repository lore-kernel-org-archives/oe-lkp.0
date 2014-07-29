Content-Type: multipart/mixed; boundary="===============1821855080745262571=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Tue, 29 Jul 2014 10:17:12 +0200
Message-ID: <20140729081712.GS20603@laptop.programming.kicks-ass.net>
In-Reply-To: <20140729023940.37b6aebc@annuminas.surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1821855080745262571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
> Subject: sched,numa: prevent task moves with marginal benefit
> =

> Commit a43455a1d57 makes task_numa_migrate() always check the
> preferred node for task placement. This is causing a performance
> regression with hackbench, as well as SPECjbb2005.
> =

> Tracing task_numa_compare() with a single instance of SPECjbb2005
> on a 4 node system, I have seen several thread swaps with tiny
> improvements. =

> =

> It appears that the hysteresis code that was added to task_numa_compare
> is not doing what we needed it to do, and a simple threshold could be
> better.
> =

> Reported-by: Aaron Lu <aaron.lu@intel.com>
> Reported-by: Jirka Hladky <jhladky@redhat.com>
> Signed-off-by: Rik van Riel <riel@redhat.com>
> ---
>  kernel/sched/fair.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> =

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4f5e3c2..bedbc3e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -924,10 +924,12 @@ static inline unsigned long group_faults_cpu(struct=
 numa_group *group, int nid)
>  =

>  /*
>   * These return the fraction of accesses done by a particular task, or
> - * task group, on a particular numa node.  The group weight is given a
> - * larger multiplier, in order to group tasks together that are almost
> - * evenly spread out between numa nodes.
> + * task group, on a particular numa node.  The NUMA move threshold
> + * prevents task moves with marginal improvement, and is set to 5%.
>   */
> +#define NUMA_SCALE 1000
> +#define NUMA_MOVE_THRESH 50

Please make that 1024, there's no reason not to use power of two here.
This base 10 factor thing annoyed me no end already, its time for it to
die.

--===============1821855080745262571==--


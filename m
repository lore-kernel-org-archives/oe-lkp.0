Content-Type: multipart/mixed; boundary="===============4781016104208826550=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 12:47:56 +0200
Message-ID: <YwNe3HBxzF+fWb2n@dhcp22.suse.cz>
In-Reply-To: <20220822001737.4120417-4-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4781016104208826550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 00:17:37, Shakeel Butt wrote:
> For several years, MEMCG_CHARGE_BATCH was kept at 32 but with bigger
> machines and the network intensive workloads requiring througput in
> Gbps, 32 is too small and makes the memcg charging path a bottleneck.
> For now, increase it to 64 for easy acceptance to 6.0. We will need to
> revisit this in future for ever increasing demand of higher performance.

Yes, the batch size has always been an arbitrary number. I do not think
there have ever been any solid grounds for the value we have now except
we need something and SWAP_CLUSTER_MAX was a good enough template.

Increasing it to 64 sounds like a reasonable step. It would be great to
have it scale based on the number of CPUs and potentially other factors
but that would be hard to get right and actually hard to evaluate
because it will depend on the specific workload.
 =

> Please note that the memcg charge path drain the per-cpu memcg charge
> stock, so there should not be any oom behavior change.

It will have an effect on other stuff as well like high limit reclaim
backoff and stast flushing.
 =

> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy with top
> level having min and low setup appropriately. More specifically
> memory.min equal to size of netperf binary and memory.low double of
> that.

a similar feedback to the test case description as with other patches.
> =

>  $ netserver -6
>  # 36 instances of netperf with following params
>  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> =

> Results (average throughput of netperf):
> Without (6.0-rc1)       10482.7 Mbps
> With patch              17064.7 Mbps (62.7% improvement)
> =

> With the patch, the throughput improved by 62.7%.
> =

> Signed-off-by: Shakeel Butt <shakeelb@google.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>

Anyway
Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  include/linux/memcontrol.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 4d31ce55b1c0..70ae91188e16 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -354,10 +354,11 @@ struct mem_cgroup {
>  };
>  =

>  /*
> - * size of first charge trial. "32" comes from vmscan.c's magic value.
> - * TODO: maybe necessary to use big numbers in big irons.
> + * size of first charge trial.
> + * TODO: maybe necessary to use big numbers in big irons or dynamic base=
d of the
> + * workload.
>   */
> -#define MEMCG_CHARGE_BATCH 32U
> +#define MEMCG_CHARGE_BATCH 64U
>  =

>  extern struct mem_cgroup *root_mem_cgroup;
>  =

> -- =

> 2.37.1.595.g718a3a8f04-goog

-- =

Michal Hocko
SUSE Labs
--===============4781016104208826550==--


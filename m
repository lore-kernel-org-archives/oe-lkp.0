Content-Type: multipart/mixed; boundary="===============2710730732555774923=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/migrate] 9eeb73028c: stress-ng.memhotplug.ops_per_sec -53.8% regression
Date: Thu, 21 Oct 2021 22:29:37 +0800
Message-ID: <20211021142937.GC16330@xsang-OptiPlex-9020>
In-Reply-To: <87a6kbq4ek.fsf@yhuang6-desk2.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2710730732555774923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, All,

we confirmed this regression was fixed by
commit: 295be91f7ef0027fca2f2e4788e99731aa931834 ("mm/migrate: optimize hot=
plug-time demotion order updates")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

the report link is:
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/4KKRZ7CSIPKM=
D3Q43GZTGQXA6WBJM2XO/

On Fri, Sep 17, 2021 at 11:14:59AM +0800, Huang, Ying wrote:
> Hi, Oliver,
> =

> kernel test robot <oliver.sang@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed a -53.8% regression of stress-ng.memhotplug.ops_per_sec=
 due to commit:
> >
> >
> > commit: 9eeb73028cfb54eb06efe87c50cc014d3f1ff43e ("[patch 174/212] mm/m=
igrate: update node demotion order on hotplug events")
> > url: https://github.com/0day-ci/linux/commits/Andrew-Morton/ia64-fix-ty=
po-in-a-comment/20210903-065028
> >
> >
> > in testcase: stress-ng
> > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =
2.10GHz with 192G memory
> > with following parameters:
> >
> > 	nr_threads: 10%
> > 	disk: 1HDD
> > 	testtime: 60s
> > 	fs: ext4
> > 	class: os
> > 	test: memhotplug
> > 	cpufreq_governor: performance
> > 	ucode: 0x5003006
> >
> =

> Can you help to test whether the following patch can recover the
> regression?
> =

> Best Regards,
> Huang, Ying
> =

> ----------------------------8<--------------------------------------
> From 5d3e18a9f083954584932a20233ef489d9398342 Mon Sep 17 00:00:00 2001
> From: Huang Ying <ying.huang@intel.com>
> Date: Thu, 16 Sep 2021 16:51:44 +0800
> Subject: [PATCH] mm/migrate: recover hotplug performance regression
> =

> 0-Day kernel test robot reported a -53.8% performance regression for
> stress-ng memhotplug test case.  This patch is to recover the
> regression via avoid updating the demotion order if not necessary.
> =

> Refer: https://lore.kernel.org/lkml/20210905135932.GE15026(a)xsang-OptiPl=
ex-9020/
> Fixes: 884a6e5d1f93 ("mm/migrate: update node demotion order on hotplug e=
vents")
> Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Cc: Yang Shi <shy828301@gmail.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Wei Xu <weixugc@google.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Greg Thelen <gthelen@google.com>
> Cc: Keith Busch <kbusch@kernel.org>
> ---
>  mm/migrate.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> =

> diff --git a/mm/migrate.c b/mm/migrate.c
> index 77d107a4577f..20d803707497 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1145,6 +1145,8 @@ static int __unmap_and_move(struct page *page, stru=
ct page *newpage,
>  static int node_demotion[MAX_NUMNODES] __read_mostly =3D
>  	{[0 ...  MAX_NUMNODES - 1] =3D NUMA_NO_NODE};
>  =

> +static bool node_demotion_disabled __read_mostly;
> +
>  /**
>   * next_demotion_node() - Get the next node in the demotion path
>   * @node: The starting node to lookup the next node
> @@ -1158,6 +1160,8 @@ int next_demotion_node(int node)
>  {
>  	int target;
>  =

> +	if (node_demotion_disabled)
> +		return NUMA_NO_NODE;
>  	/*
>  	 * node_demotion[] is updated without excluding this
>  	 * function from running.  RCU doesn't provide any
> @@ -3198,13 +3202,26 @@ static void __set_migration_target_nodes(void)
>  		goto again;
>  }
>  =

> +static int nr_node_has_cpu;
> +static int nr_node_has_mem;
> +
> +static void check_set_migration_target_nodes(void)
> +{
> +	if (num_node_state(N_MEMORY) !=3D nr_node_has_mem ||
> +	    num_node_state(N_CPU) !=3D nr_node_has_cpu) {
> +		__set_migration_target_nodes();
> +		nr_node_has_mem =3D num_node_state(N_MEMORY);
> +		nr_node_has_cpu =3D num_node_state(N_CPU);
> +	}
> +}
> +
>  /*
>   * For callers that do not hold get_online_mems() already.
>   */
>  static void set_migration_target_nodes(void)
>  {
>  	get_online_mems();
> -	__set_migration_target_nodes();
> +	check_set_migration_target_nodes();
>  	put_online_mems();
>  }
>  =

> @@ -3249,7 +3266,7 @@ static int __meminit migrate_on_reclaim_callback(st=
ruct notifier_block *self,
>  		 * will leave migration disabled until the offline
>  		 * completes and the MEM_OFFLINE case below runs.
>  		 */
> -		disable_all_migrate_targets();
> +		node_demotion_disabled =3D true;
>  		break;
>  	case MEM_OFFLINE:
>  	case MEM_ONLINE:
> @@ -3257,14 +3274,15 @@ static int __meminit migrate_on_reclaim_callback(=
struct notifier_block *self,
>  		 * Recalculate the target nodes once the node
>  		 * reaches its final state (online or offline).
>  		 */
> -		__set_migration_target_nodes();
> +		check_set_migration_target_nodes();
> +		node_demotion_disabled =3D false;
>  		break;
>  	case MEM_CANCEL_OFFLINE:
>  		/*
>  		 * MEM_GOING_OFFLINE disabled all the migration
>  		 * targets.  Reenable them.
>  		 */
> -		__set_migration_target_nodes();
> +		node_demotion_disabled =3D false;
>  		break;
>  	case MEM_GOING_ONLINE:
>  	case MEM_CANCEL_ONLINE:
> -- =

> 2.30.2
>=20
--===============2710730732555774923==--


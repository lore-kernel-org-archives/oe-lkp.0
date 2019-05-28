Content-Type: multipart/mixed; boundary="===============7304122372473860829=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: memcontrol: don't batch updates of local VM stats and events
Date: Tue, 28 May 2019 09:00:05 -0700
Message-ID: <CALvZod5KFJvfBfTZKWiDo_ux_OkLKK-b6sWtnYeFCY2ARiiKwQ@mail.gmail.com>
In-Reply-To: <20190521151647.GB2870@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7304122372473860829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 8:16 AM Johannes Weiner <hannes@cmpxchg.org> wrot=
e:
>
> The kernel test robot noticed a 26% will-it-scale pagefault regression
> from commit 42a300353577 ("mm: memcontrol: fix recursive statistics
> correctness & scalabilty"). This appears to be caused by bouncing the
> additional cachelines from the new hierarchical statistics counters.
>
> We can fix this by getting rid of the batched local counters instead.
>
> Originally, there were *only* group-local counters, and they were
> fully maintained per cpu. A reader of a stats file high up in the
> cgroup tree would have to walk the entire subtree and collect each
> level's per-cpu counters to get the recursive view. This was
> prohibitively expensive, and so we switched to per-cpu batched updates
> of the local counters during a983b5ebee57 ("mm: memcontrol: fix
> excessive complexity in memory.stat reporting"), reducing the
> complexity from nr_subgroups * nr_cpus to nr_subgroups.
>
> With growing machines and cgroup trees, the tree walk itself became
> too expensive for monitoring top-level groups, and this is when the
> culprit patch added hierarchy counters on each cgroup level. When the
> per-cpu batch size would be reached, both the local and the hierarchy
> counters would get batch-updated from the per-cpu delta simultaneously.
>
> This makes local and hierarchical counter reads blazingly fast, but it
> unfortunately makes the write-side too cache line intense.
>
> Since local counter reads were never a problem - we only centralized
> them to accelerate the hierarchy walk - and use of the local counters
> are becoming rarer due to replacement with hierarchical views (ongoing
> rework in the page reclaim and workingset code), we can make those
> local counters unbatched per-cpu counters again.
>
> The scheme will then be as such:
>
>    when a memcg statistic changes, the writer will:
>    - update the local counter (per-cpu)
>    - update the batch counter (per-cpu). If the batch is full:
>    - spill the batch into the group's atomic_t
>    - spill the batch into all ancestors' atomic_ts
>    - empty out the batch counter (per-cpu)
>
>    when a local memcg counter is read, the reader will:
>    - collect the local counter from all cpus
>
>    when a hiearchy memcg counter is read, the reader will:
>    - read the atomic_t
>
> We might be able to simplify this further and make the recursive
> counters unbatched per-cpu counters as well (batch upward propagation,
> but leave per-cpu collection to the readers), but that will require a
> more in-depth analysis and testing of all the callsites. Deal with the
> immediate regression for now.
>
> Fixes: 42a300353577 ("mm: memcontrol: fix recursive statistics correctnes=
s & scalabilty")
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Tested-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  include/linux/memcontrol.h | 26 ++++++++++++++++--------
>  mm/memcontrol.c            | 41 ++++++++++++++++++++++++++------------
>  2 files changed, 46 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index bc74d6a4407c..2d23ae7bd36d 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -126,9 +126,12 @@ struct memcg_shrinker_map {
>  struct mem_cgroup_per_node {
>         struct lruvec           lruvec;
>
> +       /* Legacy local VM stats */
> +       struct lruvec_stat __percpu *lruvec_stat_local;
> +
> +       /* Subtree VM stats (batched updates) */
>         struct lruvec_stat __percpu *lruvec_stat_cpu;
>         atomic_long_t           lruvec_stat[NR_VM_NODE_STAT_ITEMS];
> -       atomic_long_t           lruvec_stat_local[NR_VM_NODE_STAT_ITEMS];
>
>         unsigned long           lru_zone_size[MAX_NR_ZONES][NR_LRU_LISTS];
>
> @@ -274,17 +277,18 @@ struct mem_cgroup {
>         atomic_t                moving_account;
>         struct task_struct      *move_lock_task;
>
> -       /* memory.stat */
> +       /* Legacy local VM stats and events */
> +       struct memcg_vmstats_percpu __percpu *vmstats_local;
> +
> +       /* Subtree VM stats and events (batched updates) */
>         struct memcg_vmstats_percpu __percpu *vmstats_percpu;
>
>         MEMCG_PADDING(_pad2_);
>
>         atomic_long_t           vmstats[MEMCG_NR_STAT];
> -       atomic_long_t           vmstats_local[MEMCG_NR_STAT];
> -
>         atomic_long_t           vmevents[NR_VM_EVENT_ITEMS];
> -       atomic_long_t           vmevents_local[NR_VM_EVENT_ITEMS];
>
> +       /* memory.events */
>         atomic_long_t           memory_events[MEMCG_NR_MEMORY_EVENTS];
>
>         unsigned long           socket_pressure;
> @@ -576,7 +580,11 @@ static inline unsigned long memcg_page_state(struct =
mem_cgroup *memcg, int idx)
>  static inline unsigned long memcg_page_state_local(struct mem_cgroup *me=
mcg,
>                                                    int idx)
>  {
> -       long x =3D atomic_long_read(&memcg->vmstats_local[idx]);
> +       long x =3D 0;
> +       int cpu;
> +
> +       for_each_possible_cpu(cpu)
> +               x +=3D per_cpu(memcg->vmstats_local->stat[idx], cpu);
>  #ifdef CONFIG_SMP
>         if (x < 0)
>                 x =3D 0;
> @@ -650,13 +658,15 @@ static inline unsigned long lruvec_page_state_local=
(struct lruvec *lruvec,
>                                                     enum node_stat_item i=
dx)
>  {
>         struct mem_cgroup_per_node *pn;
> -       long x;
> +       long x =3D 0;
> +       int cpu;
>
>         if (mem_cgroup_disabled())
>                 return node_page_state(lruvec_pgdat(lruvec), idx);
>
>         pn =3D container_of(lruvec, struct mem_cgroup_per_node, lruvec);
> -       x =3D atomic_long_read(&pn->lruvec_stat_local[idx]);
> +       for_each_possible_cpu(cpu)
> +               x +=3D per_cpu(pn->lruvec_stat_local->count[idx], cpu);
>  #ifdef CONFIG_SMP
>         if (x < 0)
>                 x =3D 0;
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index e50a2db5b4ff..8d42e5c7bf37 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -700,11 +700,12 @@ void __mod_memcg_state(struct mem_cgroup *memcg, in=
t idx, int val)
>         if (mem_cgroup_disabled())
>                 return;
>
> +       __this_cpu_add(memcg->vmstats_local->stat[idx], val);
> +
>         x =3D val + __this_cpu_read(memcg->vmstats_percpu->stat[idx]);
>         if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
>                 struct mem_cgroup *mi;
>
> -               atomic_long_add(x, &memcg->vmstats_local[idx]);

I was suspecting the following for-loop+atomic-add for the regression.
Why the above atomic-add is the culprit?

>                 for (mi =3D memcg; mi; mi =3D parent_mem_cgroup(mi))
>                         atomic_long_add(x, &mi->vmstats[idx]);
>                 x =3D 0;
> @@ -754,11 +755,12 @@ void __mod_lruvec_state(struct lruvec *lruvec, enum=
 node_stat_item idx,
>         __mod_memcg_state(memcg, idx, val);
>
>         /* Update lruvec */
> +       __this_cpu_add(pn->lruvec_stat_local->count[idx], val);
> +
>         x =3D val + __this_cpu_read(pn->lruvec_stat_cpu->count[idx]);
>         if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
>                 struct mem_cgroup_per_node *pi;
>
> -               atomic_long_add(x, &pn->lruvec_stat_local[idx]);
>                 for (pi =3D pn; pi; pi =3D parent_nodeinfo(pi, pgdat->nod=
e_id))
>                         atomic_long_add(x, &pi->lruvec_stat[idx]);
>                 x =3D 0;
> @@ -780,11 +782,12 @@ void __count_memcg_events(struct mem_cgroup *memcg,=
 enum vm_event_item idx,
>         if (mem_cgroup_disabled())
>                 return;
>
> +       __this_cpu_add(memcg->vmstats_local->events[idx], count);
> +
>         x =3D count + __this_cpu_read(memcg->vmstats_percpu->events[idx]);
>         if (unlikely(x > MEMCG_CHARGE_BATCH)) {
>                 struct mem_cgroup *mi;
>
> -               atomic_long_add(x, &memcg->vmevents_local[idx]);
>                 for (mi =3D memcg; mi; mi =3D parent_mem_cgroup(mi))
>                         atomic_long_add(x, &mi->vmevents[idx]);
>                 x =3D 0;
> @@ -799,7 +802,12 @@ static unsigned long memcg_events(struct mem_cgroup =
*memcg, int event)
>
>  static unsigned long memcg_events_local(struct mem_cgroup *memcg, int ev=
ent)
>  {
> -       return atomic_long_read(&memcg->vmevents_local[event]);
> +       long x =3D 0;
> +       int cpu;
> +
> +       for_each_possible_cpu(cpu)
> +               x +=3D per_cpu(memcg->vmstats_local->events[event], cpu);
> +       return x;
>  }
>
>  static void mem_cgroup_charge_statistics(struct mem_cgroup *memcg,
> @@ -2200,11 +2208,9 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
>                         long x;
>
>                         x =3D this_cpu_xchg(memcg->vmstats_percpu->stat[i=
], 0);
> -                       if (x) {
> -                               atomic_long_add(x, &memcg->vmstats_local[=
i]);
> +                       if (x)
>                                 for (mi =3D memcg; mi; mi =3D parent_mem_=
cgroup(mi))
>                                         atomic_long_add(x, &memcg->vmstat=
s[i]);
> -                       }
>
>                         if (i >=3D NR_VM_NODE_STAT_ITEMS)
>                                 continue;
> @@ -2214,12 +2220,10 @@ static int memcg_hotplug_cpu_dead(unsigned int cp=
u)
>
>                                 pn =3D mem_cgroup_nodeinfo(memcg, nid);
>                                 x =3D this_cpu_xchg(pn->lruvec_stat_cpu->=
count[i], 0);
> -                               if (x) {
> -                                       atomic_long_add(x, &pn->lruvec_st=
at_local[i]);
> +                               if (x)
>                                         do {
>                                                 atomic_long_add(x, &pn->l=
ruvec_stat[i]);
>                                         } while ((pn =3D parent_nodeinfo(=
pn, nid)));
> -                               }
>                         }
>                 }
>
> @@ -2227,11 +2231,9 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
>                         long x;
>
>                         x =3D this_cpu_xchg(memcg->vmstats_percpu->events=
[i], 0);
> -                       if (x) {
> -                               atomic_long_add(x, &memcg->vmevents_local=
[i]);
> +                       if (x)
>                                 for (mi =3D memcg; mi; mi =3D parent_mem_=
cgroup(mi))
>                                         atomic_long_add(x, &memcg->vmeven=
ts[i]);
> -                       }
>                 }
>         }
>
> @@ -4492,8 +4494,15 @@ static int alloc_mem_cgroup_per_node_info(struct m=
em_cgroup *memcg, int node)
>         if (!pn)
>                 return 1;
>
> +       pn->lruvec_stat_local =3D alloc_percpu(struct lruvec_stat);
> +       if (!pn->lruvec_stat_local) {
> +               kfree(pn);
> +               return 1;
> +       }
> +
>         pn->lruvec_stat_cpu =3D alloc_percpu(struct lruvec_stat);
>         if (!pn->lruvec_stat_cpu) {
> +               free_percpu(pn->lruvec_stat_local);
>                 kfree(pn);
>                 return 1;
>         }
> @@ -4515,6 +4524,7 @@ static void free_mem_cgroup_per_node_info(struct me=
m_cgroup *memcg, int node)
>                 return;
>
>         free_percpu(pn->lruvec_stat_cpu);
> +       free_percpu(pn->lruvec_stat_local);
>         kfree(pn);
>  }
>
> @@ -4525,6 +4535,7 @@ static void __mem_cgroup_free(struct mem_cgroup *me=
mcg)
>         for_each_node(node)
>                 free_mem_cgroup_per_node_info(memcg, node);
>         free_percpu(memcg->vmstats_percpu);
> +       free_percpu(memcg->vmstats_local);
>         kfree(memcg);
>  }
>
> @@ -4553,6 +4564,10 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
>         if (memcg->id.id < 0)
>                 goto fail;
>
> +       memcg->vmstats_local =3D alloc_percpu(struct memcg_vmstats_percpu=
);
> +       if (!memcg->vmstats_local)
> +               goto fail;
> +
>         memcg->vmstats_percpu =3D alloc_percpu(struct memcg_vmstats_percp=
u);
>         if (!memcg->vmstats_percpu)
>                 goto fail;
> --
> 2.21.0
>

--===============7304122372473860829==--


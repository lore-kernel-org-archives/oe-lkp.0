Content-Type: multipart/mixed; boundary="===============6733915903962083219=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 18:25:59 +0200
Message-ID: <CANn89iLSWm-c4XE79rUsxzOp3VwXVDhOEPTQnWgeQ48UwM=u7Q@mail.gmail.com>
In-Reply-To: <20220627144822.GA20878@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6733915903962083219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 4:48 PM Feng Tang <feng.tang@intel.com> wrote:
>
> On Mon, Jun 27, 2022 at 04:07:55PM +0200, Eric Dumazet wrote:
> > On Mon, Jun 27, 2022 at 2:34 PM Feng Tang <feng.tang@intel.com> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 10:46:21AM +0200, Eric Dumazet wrote:
> > > > On Mon, Jun 27, 2022 at 4:38 AM Feng Tang <feng.tang@intel.com> w=
rote:
> > > [snip]
> > > > > > >
> > > > > > > Thanks Feng. Can you check the value of memory.kmem.tcp.max_u=
sage_in_bytes
> > > > > > > in /sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service a=
fter making
> > > > > > > sure that the netperf test has already run?
> > > > > >
> > > > > > memory.kmem.tcp.max_usage_in_bytes:0
> > > > >
> > > > > Sorry, I made a mistake that in the original report from Oliver, =
it
> > > > > was 'cgroup v2' with a 'debian-11.1' rootfs.
> > > > >
> > > > > When you asked about cgroup info, I tried the job on another tbox=
, and
> > > > > the original 'job.yaml' didn't work, so I kept the 'netperf' test
> > > > > parameters and started a new job which somehow run with a 'debian=
-10.4'
> > > > > rootfs and acutally run with cgroup v1.
> > > > >
> > > > > And as you mentioned cgroup version does make a big difference, t=
hat
> > > > > with v1, the regression is reduced to 1% ~ 5% on different genera=
tions
> > > > > of test platforms. Eric mentioned they also got regression report,
> > > > > but much smaller one, maybe it's due to the cgroup version?
> > > >
> > > > This was using the current net-next tree.
> > > > Used recipe was something like:
> > > >
> > > > Make sure cgroup2 is mounted or mount it by mount -t cgroup2 none $=
MOUNT_POINT.
> > > > Enable memory controller by echo +memory > $MOUNT_POINT/cgroup.subt=
ree_control.
> > > > Create a cgroup by mkdir $MOUNT_POINT/job.
> > > > Jump into that cgroup by echo $$ > $MOUNT_POINT/job/cgroup.procs.
> > > >
> > > > <Launch tests>
> > > >
> > > > The regression was smaller than 1%, so considered noise compared to
> > > > the benefits of the bug fix.
> > >
> > > Yes, 1% is just around noise level for a microbenchmark.
> > >
> > > I went check the original test data of Oliver's report, the tests was
> > > run 6 rounds and the performance data is pretty stable (0Day's report
> > > will show any std deviation bigger than 2%)
> > >
> > > The test platform is a 4 sockets 72C/144T machine, and I run the
> > > same job (nr_tasks =3D 25% * nr_cpus) on one CascadeLake AP (4 nodes)
> > > and one Icelake 2 sockets platform, and saw 75% and 53% regresson on
> > > them.
> > >
> > > In the first email, there is a file named 'reproduce', it shows the
> > > basic test process:
> > >
> > > "
> > >   use 'performane' cpufre  governor for all CPUs
> > >
> > >   netserver -4 -D
> > >   modprobe sctp
> > >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K =
 &
> > >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K =
 &
> > >   netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K =
 &
> > >   (repeat 36 times in total)
> > >   ...
> > >
> > > "
> > >
> > > Which starts 36 (25% of nr_cpus) netperf clients. And the clients num=
ber
> > > also matters, I tried to increase the client number from 36 to 72(50%=
),
> > > and the regression is changed from 69.4% to 73.7%"
> > >
> >
> > This seems like a lot of opportunities for memcg folks :)
> >
> > struct page_counter has poor field placement [1], and no per-cpu cache.
> >
> > [1] "atomic_long_t usage" is sharing cache line with read mostly fields.
> >
> > (struct mem_cgroup also has poor field placement, mainly because of
> > struct page_counter)
> >
> >     28.69%  [kernel]       [k] copy_user_enhanced_fast_string
> >     16.13%  [kernel]       [k] intel_idle_irq
> >      6.46%  [kernel]       [k] page_counter_try_charge
> >      6.20%  [kernel]       [k] __sk_mem_reduce_allocated
> >      5.68%  [kernel]       [k] try_charge_memcg
> >      5.16%  [kernel]       [k] page_counter_cancel
>
> Yes, I also analyzed the perf-profile data, and made some layout changes
> which could recover the changes from 69% to 40%.
>
> 7c80b038d23e1f4c 4890b686f4088c90432149bd6de 332b589c49656a45881bca4ecc0
> ---------------- --------------------------- ---------------------------
>      15722           -69.5%       4792           -40.8%       9300       =
 netperf.Throughput_Mbps
>
>
> diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
> index 1bfcfb1af352..aa37bd39116c 100644
> --- a/include/linux/cgroup-defs.h
> +++ b/include/linux/cgroup-defs.h
> @@ -179,14 +179,13 @@ struct cgroup_subsys_state {
>         atomic_t online_cnt;
>
>         /* percpu_ref killing and RCU release */
> -       struct work_struct destroy_work;
>         struct rcu_work destroy_rwork;
> -
> +       struct cgroup_subsys_state *parent;
> +       struct work_struct destroy_work;
>         /*
>          * PI: the parent css.  Placed here for cache proximity to follow=
ing
>          * fields of the containing structure.
>          */
> -       struct cgroup_subsys_state *parent;
>  };
>
>  /*
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 9ecead1042b9..963b88ab9930 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -239,9 +239,6 @@ struct mem_cgroup {
>         /* Private memcg ID. Used to ID objects that outlive the cgroup */
>         struct mem_cgroup_id id;
>
> -       /* Accounted resources */
> -       struct page_counter memory;             /* Both v1 & v2 */
> -
>         union {
>                 struct page_counter swap;       /* v2 only */
>                 struct page_counter memsw;      /* v1 only */
> @@ -251,6 +248,9 @@ struct mem_cgroup {
>         struct page_counter kmem;               /* v1 only */
>         struct page_counter tcpmem;             /* v1 only */
>
> +       /* Accounted resources */
> +       struct page_counter memory;             /* Both v1 & v2 */
> +
>         /* Range enforcement for interrupt charges */
>         struct work_struct high_work;
>
> @@ -313,7 +313,6 @@ struct mem_cgroup {
>         atomic_long_t           memory_events[MEMCG_NR_MEMORY_EVENTS];
>         atomic_long_t           memory_events_local[MEMCG_NR_MEMORY_EVENT=
S];
>
> -       unsigned long           socket_pressure;
>
>         /* Legacy tcp memory accounting */
>         bool                    tcpmem_active;
> @@ -349,6 +348,7 @@ struct mem_cgroup {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>         struct deferred_split deferred_split_queue;
>  #endif
> +       unsigned long           socket_pressure;
>
>         struct mem_cgroup_per_node *nodeinfo[];
>  };
>

I simply did the following and got much better results.

But I am not sure if updates to ->usage are really needed that often...


diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 679591301994d316062f92b275efa2459a8349c9..e267be4ba849760117d9fd041e2=
2c2a44658ab36
100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -3,12 +3,15 @@
 #define _LINUX_PAGE_COUNTER_H

 #include <linux/atomic.h>
+#include <linux/cache.h>
 #include <linux/kernel.h>
 #include <asm/page.h>

 struct page_counter {
-       atomic_long_t usage;
-       unsigned long min;
+       /* contended cache line. */
+       atomic_long_t usage ____cacheline_aligned_in_smp;
+
+       unsigned long min ____cacheline_aligned_in_smp;
        unsigned long low;
        unsigned long high;
        unsigned long max;
@@ -27,12 +30,6 @@ struct page_counter {
        unsigned long watermark;
        unsigned long failcnt;

-       /*
-        * 'parent' is placed here to be far from 'usage' to reduce
-        * cache false sharing, as 'usage' is written mostly while
-        * parent is frequently read for cgroup's hierarchical
-        * counting nature.
-        */
        struct page_counter *parent;
 };



> And some of these are specific for network and may not be a universal
> win, though I think the 'cgroup_subsys_state' could keep the
> read-mostly 'parent' away from following written-mostly counters.
>
> Btw, I tried your debug patch which compiled fail with 0Day's kbuild
> system, but it did compile ok on my local machine.
>
> Thanks,
> Feng
>
> >
> > > Thanks,
> > > Feng
> > >
> > > > >
> > > > > Thanks,
> > > > > Feng
--===============6733915903962083219==--


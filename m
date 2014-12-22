Content-Type: multipart/mixed; boundary="===============5681242110060944912=="
MIME-Version: 1.0
From: Jacob Pan <jacob.jun.pan@intel.com>
To: lkp@lists.01.org
Subject: Re: [RFC PATCH] drivers/intel_powerclamp : Redesign implementation of idle injection
Date: Mon, 22 Dec 2014 10:16:09 -0800
Message-ID: <20141222101609.620e1ce7@jacob-VirtualBox>
In-Reply-To: <5497E222.8090001@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5681242110060944912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Dec 2014 14:49:30 +0530
Preeti U Murthy <preeti@linux.vnet.ibm.com> wrote:

> On 12/22/2014 12:07 PM, Amit Kucheria wrote:
> > On Sun, Dec 21, 2014 at 3:59 PM, Preeti U Murthy
> > <preeti@linux.vnet.ibm.com> wrote:
> > =

> > <snip>
> > =

> >> This patch is compile tested only. The goal is to get a consensus
> >> on the design first. There are some points that need to be given a
> >> thought as far as I can see:
> >>
> >> 1. The idle task chosen during the idle injection period needs to
> >> enter a specific mwait state. The cpuidle governors cannot choose
> >> any idle state like they do generally for idle tasks.
> > =

> > That information should be hidden in the platform-specific driver
> > (intel_idle in this case?) through some flag and not in sched core
> > which is gradually learning to driving idle directly.
> =

> Hmm? How do we communicate the clamping information to the cpuidle
> driver ? Will not a pm_qos_add_request() to initialize the
> PM_QOS_CPU_DMA_LATENCY class to the value 0 from the powerclamp driver
> during throttling periods suffice? The governor will read this value
> anyway.
> =

+rafael

or we can use this call to bypass governor and system qos.
diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index 125150d..5de79c2 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -79,6 +79,7 @@ void cpuidle_use_deepest_state(bool enable)
 {
        use_deepest_state =3D enable;
 }
+EXPORT_SYMBOL_GPL(cpuidle_use_deepest_state);


> > =

> >> 2. We throttle runqueue when the bandwidth is available. We do not
> >> touch any parameters around the cfs_rq bandwidth in this patch. It
> >> is supposed to bypass the bandwidth checks entirely. But will
> >> there be any serious consequence as a result?
> > =

> >> 3. There can be cases when the runqueues are throttled when
> >> bandwidths are exceeded too. What are the consequences of the
> >> powerclamp driver running parallely?
> >>
> >> 4. The idle periods should stand synchronized across all cpus
> >> because the change in the design is to start timers to expire
> >> immediately instead of waking up kthreads. The only concern is cpu
> >> hotplug operations when the cpu coming online can go out of sync
> >> with the idle periods. But that situation exists today as well.
> > =

> >   5. Will the maintainers be horrified if this throttle_rq API is
> > used to wean users off hotplug? What are the consequences of
> > "permanent throttling"? IOW, some platform drivers could throttle
> > the rqs of an entire cpu cluster until the right usecase comes by
> > when that processing power is needed.
> =

> This bothers me as well. As of now I am unable to see how else we can
> enable the powerclamp driver to throttle runqueues.
> Need some pointers here.
> =

> > =

> >> Signed-off-by: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> >> ---
> >>
> >>  drivers/thermal/intel_powerclamp.c |  227
> >> ++++++++++++++----------------------
> >> include/linux/sched.h              |    2
> >> kernel/sched/fair.c                |   29 ++++- 3 files changed,
> >> 117 insertions(+), 141 deletions(-)
> > =

> > <snip>
> > =

> >> diff --git a/include/linux/sched.h b/include/linux/sched.h
> >> index 5e344bb..5843b7e 100644
> >> --- a/include/linux/sched.h
> >> +++ b/include/linux/sched.h
> >> @@ -2075,9 +2075,11 @@ static inline int
> >> set_cpus_allowed_ptr(struct task_struct *p, #ifdef
> >> CONFIG_NO_HZ_COMMON void calc_load_enter_idle(void);
> >>  void calc_load_exit_idle(void);
> >> +void throttle_rq(int cpu, int throttle);
> >>  #else
> >>  static inline void calc_load_enter_idle(void) { }
> >>  static inline void calc_load_exit_idle(void) { }
> >> +static inline void throttle_rq(int cpu, int throttle);
> >>  #endif /* CONFIG_NO_HZ_COMMON */
> >>
> >>  #ifndef CONFIG_CPUMASK_OFFSTACK
> >> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >> index ef2b104..01785cb 100644
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -3417,8 +3417,15 @@ static void throttle_cfs_rq(struct cfs_rq
> >> *cfs_rq)
> >>          * distribute_cfs_runtime will not see us
> >>          */
> >>         list_add_rcu(&cfs_rq->throttled_list,
> >> &cfs_b->throttled_cfs_rq);
> >> -       if (!cfs_b->timer_active)
> >> +
> >> +       /*
> >> +        * Check if the cfs_rq is throttled inspite of having
> >> sufficient
> >> +        * bandwidth. If so, do not meddle with the bandwidth
> >> since this
> >> +        * is a case of forced idle injection
> >> +        */
> >> +       if (cfs_rq_throttled(cfs_rq) && !cfs_b->timer_active)
> >>                 __start_cfs_bandwidth(cfs_b, false);
> >> +
> >>         raw_spin_unlock(&cfs_b->lock);
> >>  }
> >>
> >> @@ -3469,6 +3476,17 @@ void unthrottle_cfs_rq(struct cfs_rq
> >> *cfs_rq) resched_curr(rq);
> >>  }
> >>
> >> +void throttle_rq(int cpu, int throttle)
> > =

> > Suggest renaming to force_throttle_rq to make it clear this this is
> > being forced upon us externally.
> =

> Sure, thanks!
> =

> Regards
> Preeti U Murthy
> =


[Jacob Pan]

--===============5681242110060944912==--


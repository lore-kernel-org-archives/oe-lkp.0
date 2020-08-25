Content-Type: multipart/mixed; boundary="===============4920672801283696455=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Tue, 25 Aug 2020 14:23:05 +0800
Message-ID: <20200825062305.GA83850@shbuild999.sh.intel.com>
In-Reply-To: <20200824161238.GI4794@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4920672801283696455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 06:12:38PM +0200, Borislav Petkov wrote:
> > -DEFINE_PER_CPU(struct mce, injectm);
> > +DEFINE_PER_CPU_ALIGNED(struct mce, injectm);
> >  EXPORT_PER_CPU_SYMBOL_GPL(injectm);
> =

> I don't think this is the right fix.

Agreed :) This is a debug patch, what we want is to root cause this
strange performance bump, as we've seen many other reports that the
culprit commit has no direct relation with the benchmark at all,
and want to find their pattern.

> Lemme quote Tony from a previous
> email:
> =

> "The answer isn't to tinker with "struct mce". Other changes could
> trigger this same change in alignment. Anything that is this perfomance
> sensitive needs to have some "__attribute__((aligned(64)))" (or
> whatever) to make sure arbitrary changes elsewhere don't do this."
> =

> And yes, your diff is not tinkering with struct mce but it is tinkering
> with percpu vars which are of type struct mce.
> =

> However, the proper fix is...
> =

> > :)  Right, this is what I'm doing right now. Some test job is queued on
> > the test box, and it may needs some iterations of new patch. Hopefully =
we
> > can isolate some specific variable given some luck.
> =

> ... yes, exactly, you need to identify the contention where this
> happens, causing a cacheline to bounce or a variable straddles across a
> cacheline boundary, causing the read to fetch two cachelines and thus
> causes that slowdown. And then align that var to the beginning of a
> cacheline.
> =

> Also, maybe I missed this but, do you trigger this only on Xeon Phi or
> on "normal" x86 too?
> =

> Because if it is Xeon Phi only, then that might explain the size of the
> slowdown and that it happens only there because it is a, well, "strange"
> machine. :-)

Good point! This is only reproduced on Xeon Phi, and can't be seen on
other Skylake/Cascade Lake/Icelake platforms.

The hotspots for this Xeon Phi is even different from other platforms,
while other platforms share the same hotspot.

Also one good news is, we seem to identify the 2 key percpu variables
out of the list mentioned in previous email:  =

	'arch_freq_scale'
	'tsc_adjust'

These 2 variables are accessed in 2 hot call stacks (for this 288 CPU
Xeon Phi platform):

  - arch_freq_scale is accessed in scheduler tick =

	  arch_scale_freq_tick+0xaf/0xc0
	  scheduler_tick+0x39/0x100
	  update_process_times+0x3c/0x50
	  tick_sched_handle+0x22/0x60
	  tick_sched_timer+0x37/0x70
	  __hrtimer_run_queues+0xfc/0x2a0
	  hrtimer_interrupt+0x122/0x270
	  smp_apic_timer_interrupt+0x6a/0x150
	  apic_timer_interrupt+0xf/0x20

  - tsc_adjust is accessed in idle entrance
	  tsc_verify_tsc_adjust+0xeb/0xf0
	  arch_cpu_idle_enter+0xc/0x20
	  do_idle+0x91/0x280
	  cpu_startup_entry+0x19/0x20
	  start_kernel+0x4f4/0x516
	  secondary_startup_64+0xb6/0xc0

>From systemmap file, for bad kernel these 2 sit in one cache line, while
for good kernel they sit in 2 separate cache lines.

It also explains why it turns from a regression to an improvement with
updated gcc/kconfig, as the cache line sharing situation is reversed.

The direct patch I can think of is to make 'tsc_adjust' cache aligned
to separate these 2 'hot' variables. How do you think?

--- a/arch/x86/kernel/tsc_sync.c
+++ b/arch/x86/kernel/tsc_sync.c
@@ -29,7 +29,7 @@ struct tsc_adjust {
 	bool		warned;
 };
 =

-static DEFINE_PER_CPU(struct tsc_adjust, tsc_adjust);
+static DEFINE_PER_CPU_ALIGNED(struct tsc_adjust, tsc_adjust);


Thanks,
Feng
--===============4920672801283696455==--


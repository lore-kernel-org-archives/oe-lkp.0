Content-Type: multipart/mixed; boundary="===============7617626242245074417=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 31 Aug 2020 16:23:06 +0800
Message-ID: <20200831082306.GA61340@shbuild999.sh.intel.com>
In-Reply-To: <20200831075611.GA2976@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7617626242245074417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 08:56:11AM +0100, Mel Gorman wrote:
> On Mon, Aug 31, 2020 at 10:16:38AM +0800, Feng Tang wrote:
> > > So why don't you define both variables with DEFINE_PER_CPU_ALIGNED and
> > > check if all your bad measurements go away this way?
> > =

> > For 'arch_freq_scale', there are other percpu variables in the same
> > smpboot.c: 'arch_prev_aperf' and 'arch_prev_mperf', and in hot path
> > arch_scale_freq_tick(), these 3 variables are all accessed, so I didn't =

> > touch it. Or maybe we can align the first of these 3 variables, so
> > that they sit in one cacheline.
> > =

> > > You'd also need to check whether there's no detrimental effect from
> > > this change on other, i.e., !KNL platforms, and I think there won't
> > > be because both variables will be in separate cachelines then and all
> > > should be good.
> > =

> > Yes, these kind of changes should be verified on other platforms.
> > =

> > One thing still puzzles me, that the 2 variables are per-cpu things, and
> > there is no case of many CPU contending, why the cacheline layout matte=
rs?
> > I doubt it is due to the contention of the same cache set, and am trying
> > to find some way to test it.
> > =

> =

> Because if you have two structures that are per-cpu and not cache-aligned
> then a write in one can bounce the cache line in another due to
> cache coherency protocol. It's generally called "false cache line
> sharing". https://en.wikipedia.org/wiki/False_sharing has basic examples
> (lets not get into whether wikipedia is a valid citation source, there
> are books on the topic if someone really cared).

For 'arch_freq_scale' and 'tsc_adjust' percpu variable, they are only
accessed by their own CPU, and usually no other CPU will touch them, the
hot node path only use this_cpu_read/write/ptr. And each CPU's static
percpu variables are all packed together in one area (256KB for one CPU on
this test box), so I don't think there is multiple CPUs accessing one cache
line scenario, which is easy to trigger false sharing.

Also our different test shows the test score is higher if 'arch_freq_scale'
and 'tsc_adjust' are in 2 separate cachelines.


> While it's in my imagination, this should happen with the page allocator
> pcpu structures because the core structure is 1.5 cache lines on 64-bit
> currently and not aligned.  That means that not only can two CPUs interfe=
re
> with each others lists and counters but that could happen cross-node.
> =

> The hypothesis can be tested with perf looking for abnormal cache
> misses. In this case, an intense allocating process bound to one CPU
> with intermittent allocations on the adjacent CPU should show unexpected
> cache line bounces. It would not be perfect as collisions would happen
> anyway when the pcpu lists spill over on either the alloc or free side
> to the the buddy lists but in that case, the cache misses would happen
> on different instructions.
> =

> -- =

> Mel Gorman
> SUSE Labs

Thanks,
Feng
--===============7617626242245074417==--


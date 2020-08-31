Content-Type: multipart/mixed; boundary="===============6392617758108594843=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 31 Aug 2020 08:56:11 +0100
Message-ID: <20200831075611.GA2976@suse.com>
In-Reply-To: <20200831021638.GB65971@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6392617758108594843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 10:16:38AM +0800, Feng Tang wrote:
> > So why don't you define both variables with DEFINE_PER_CPU_ALIGNED and
> > check if all your bad measurements go away this way?
> =

> For 'arch_freq_scale', there are other percpu variables in the same
> smpboot.c: 'arch_prev_aperf' and 'arch_prev_mperf', and in hot path
> arch_scale_freq_tick(), these 3 variables are all accessed, so I didn't =

> touch it. Or maybe we can align the first of these 3 variables, so
> that they sit in one cacheline.
> =

> > You'd also need to check whether there's no detrimental effect from
> > this change on other, i.e., !KNL platforms, and I think there won't
> > be because both variables will be in separate cachelines then and all
> > should be good.
> =

> Yes, these kind of changes should be verified on other platforms.
> =

> One thing still puzzles me, that the 2 variables are per-cpu things, and
> there is no case of many CPU contending, why the cacheline layout matters?
> I doubt it is due to the contention of the same cache set, and am trying
> to find some way to test it.
> =


Because if you have two structures that are per-cpu and not cache-aligned
then a write in one can bounce the cache line in another due to
cache coherency protocol. It's generally called "false cache line
sharing". https://en.wikipedia.org/wiki/False_sharing has basic examples
(lets not get into whether wikipedia is a valid citation source, there
are books on the topic if someone really cared).

While it's in my imagination, this should happen with the page allocator
pcpu structures because the core structure is 1.5 cache lines on 64-bit
currently and not aligned.  That means that not only can two CPUs interfere
with each others lists and counters but that could happen cross-node.

The hypothesis can be tested with perf looking for abnormal cache
misses. In this case, an intense allocating process bound to one CPU
with intermittent allocations on the adjacent CPU should show unexpected
cache line bounces. It would not be perfect as collisions would happen
anyway when the pcpu lists spill over on either the alloc or free side
to the the buddy lists but in that case, the cache misses would happen
on different instructions.

-- =

Mel Gorman
SUSE Labs
--===============6392617758108594843==--


Content-Type: multipart/mixed; boundary="===============8039130137437610610=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 31 Aug 2020 20:53:00 +0800
Message-ID: <20200831125300.GB61340@shbuild999.sh.intel.com>
In-Reply-To: <20200831085516.GE2976@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8039130137437610610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 09:55:17AM +0100, Mel Gorman wrote:
> On Mon, Aug 31, 2020 at 04:23:06PM +0800, Feng Tang wrote:
> > On Mon, Aug 31, 2020 at 08:56:11AM +0100, Mel Gorman wrote:
> > > On Mon, Aug 31, 2020 at 10:16:38AM +0800, Feng Tang wrote:
> > > > > So why don't you define both variables with DEFINE_PER_CPU_ALIGNE=
D and
> > > > > check if all your bad measurements go away this way?
> > > > =

> > > > For 'arch_freq_scale', there are other percpu variables in the same
> > > > smpboot.c: 'arch_prev_aperf' and 'arch_prev_mperf', and in hot path
> > > > arch_scale_freq_tick(), these 3 variables are all accessed, so I di=
dn't =

> > > > touch it. Or maybe we can align the first of these 3 variables, so
> > > > that they sit in one cacheline.
> > > > =

> > > > > You'd also need to check whether there's no detrimental effect fr=
om
> > > > > this change on other, i.e., !KNL platforms, and I think there won=
't
> > > > > be because both variables will be in separate cachelines then and=
 all
> > > > > should be good.
> > > > =

> > > > Yes, these kind of changes should be verified on other platforms.
> > > > =

> > > > One thing still puzzles me, that the 2 variables are per-cpu things=
, and
> > > > there is no case of many CPU contending, why the cacheline layout m=
atters?
> > > > I doubt it is due to the contention of the same cache set, and am t=
rying
> > > > to find some way to test it.
> > > > =

> > > =

> > > Because if you have two structures that are per-cpu and not cache-ali=
gned
> > > then a write in one can bounce the cache line in another due to
> > > cache coherency protocol. It's generally called "false cache line
> > > sharing". https://en.wikipedia.org/wiki/False_sharing has basic examp=
les
> > > (lets not get into whether wikipedia is a valid citation source, there
> > > are books on the topic if someone really cared).
> > =

> > For 'arch_freq_scale' and 'tsc_adjust' percpu variable, they are only
> > accessed by their own CPU, and usually no other CPU will touch them,
> =

> Read "false sharing again". Two adjacent per-CPU structures can still
> interfere with each other if the structures happen to cross a cache line
> boundary and are not cache aligned.
 =

Sure, will recheck that wiki, thanks.

Some cache info about the test box is, it's the Xeon Phi platform with
72 cores, and each core has 4 HT threads, so there are 288 CPUs. The L1
D-cache and I-cache are both 32KB. There is no L3 cache, and every 2
cores share one 1MB L2 cache. The L1 D-cache is 64 sets, 8 ways, and the
L2 cache is 1024 sets, 16 ways.

Thanks,
Feng

> > the
> > hot node path only use this_cpu_read/write/ptr. And each CPU's static
> > percpu variables are all packed together in one area (256KB for one CPU=
 on
> > this test box),
> =

> If the structure is not cache aligned (probably 64KB) then there is a
> boundary when cache line bounces can occur.
> =

> -- =

> Mel Gorman
> SUSE Labs
--===============8039130137437610610==--


Content-Type: multipart/mixed; boundary="===============5348027813122745849=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Tue, 25 Aug 2020 14:49:26 +0800
Message-ID: <20200825064926.GB83850@shbuild999.sh.intel.com>
In-Reply-To: <20200824165653.GQ2976@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5348027813122745849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 05:56:53PM +0100, Mel Gorman wrote:
> On Mon, Aug 24, 2020 at 06:12:38PM +0200, Borislav Petkov wrote:
> > =

> > > :)  Right, this is what I'm doing right now. Some test job is queued =
on
> > > the test box, and it may needs some iterations of new patch. Hopefull=
y we
> > > can isolate some specific variable given some luck.
> > =

> > ... yes, exactly, you need to identify the contention where this
> > happens,
> > causing a cacheline to bounce or a variable straddles across a
> > cacheline boundary, causing the read to fetch two cachelines and thus
> > causes that slowdown. And then align that var to the beginning of a
> > cacheline.
> > =

> =

> Given the test is malloc1, it *may* be struct per_cpu_pages embedded with=
in
> per_cpu_pageset. The cache characteristics of per_cpu_pageset are terrible
> because of how it mixes up zone counters and per-cpu lists. However, if
> the first per_cpu_pageset is cache-aligned then every second per_cpu_pages
> will be cache-aligned and half of the lists will fit in one cache line. If
> the whole structure gets pushed out of alignment then all per_cpu_pages
> straddle cache lines, increase the overall cache footprint and potentially
> cause problems if the cache is not large enough to hold hot structures.
> =

> The misses could potentially be inferred without c2c from looking at
> perf -e cache-misses on a good and bad kernel and seeing if there is a
> noticable increase in misses in mm/page_alloc.c with a focus on anything
> using per-cpu lists.
 =

Thanks for the tip, which is useful for Xeon-Phi. I ran it with 'cache-miss=
es'
instead of default 'cycles', and the 2 versions of perf data show similar h=
otspots:

    92.62%    92.62%  [kernel.kallsyms]   [k] native_queued_spin_lock_slowp=
ath              -      -            =

46.20% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;release_page=
s;tlb_flush_mmu;tlb_finish_mmu;unmap_region;__do_munmap;__vm_munmap;__x64_s=
ys_munmap;do_syscall_64;entry_SYSCALL_64_after_hwframe;munmap
46.13% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;pagevec_lru_=
move_fn;lru_add_drain_cpu;lru_add_drain;unmap_region;__do_munmap;__vm_munma=
p;__x64_sys_munmap;do_syscall_64;entry_SYSCALL_64_after_hwframe;munmap
 =

> Whether the problem is per_cpu_pages or some other structure, it's not
> struct mce's fault in all likelihood -- it's just the messenger.

Agreed. The mce patch itself is innocent, it just changes other domains'
variables' alignment indeliberately. =


Thanks,
Feng

> -- =

> Mel Gorman
> SUSE Labs
--===============5348027813122745849==--


Content-Type: multipart/mixed; boundary="===============3698355108148190604=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 11:38:46 -0700
Message-ID: <c85ae95a-6603-ca0d-a653-b3f2f7069e20@intel.com>
In-Reply-To: <20220317090415.GE735@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3698355108148190604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/22 02:04, kernel test robot wrote:
> FYI, we noticed a -13.2% regression of will-it-scale.per_thread_ops due t=
o commit:
...
> commit: 6035152d8eebe16a5bb60398d3e05dc7799067b0 ("x86/mm/tlb: Open-code =
on_each_cpu_cond_mask() for tlb_is_not_lazy()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
...
>      24.77 =C2=B1  2%      +8.1       32.86 =C2=B1  3%  perf-profile.self=
.cycles-pp.llist_add_batch


tl;dr: This commit made the tlb_is_not_lazy() check happen earlier.
That earlier check can miss threads _going_ lazy because if mmap_lock
contention.  Fewer lazy threads means more IPIs and lower performance.

=3D=3D=3D

There's a lot of noise in that profile, but I filtered most of it out.
The main thing is that, somehow the llist_add() in
smp_call_function_many_cond() got more expensive.  Either we're doing
more of them or the cacheline is bouncing around more.

Turns out that we're sending *more* IPIs with this patch applied than
without.  That shouldn't happen since the old code did the same exact
logical check:

	if (cond_func && !cond_func(cpu, info))
        	continue;

and the new code does:

	if (tlb_is_not_lazy(cpu))
		...

where cond_func=3D=3Dtlb_is_not_lazy.

So, what's the difference?  Timing.  With the old scheme, if a CPU
enters lazy mode between native_flush_tlb_others() and
the loop in smp_call_function_many_cond(), it won't get an IPI and won't
need to do the llist_add().

I stuck some printk()s in there and can confirm that the
earlier-calculated mask always seems to have more bits set, at least
when running will-it-scale tests that induce TLB flush IPIs.

I was kinda surprised that there were so many threads going idle with a
cpu-eating micro like this.  But, it makes sense since they're
contending on mmap_lock.  Basically, since TLB-flushing operations like
mmap() hold mmap_lock for write they tend to *force* other threads into
idle.  Idle threads are lazy and they tend to _become_ lazy around the
time that the flushing starts.

This new "early lazy check" behavior could theoretically work both ways.
 If threads tended to be waking up from idle when TLB flushes were being
sent, this would tend to reduce the number of IPIs.  But, since they
tend to be going to sleep it increases the number of IPIs.

Anybody have a better theory?  I think we should probably revert the commit.
--===============3698355108148190604==--


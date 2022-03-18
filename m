Content-Type: multipart/mixed; boundary="===============1177516722202466100=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Fri, 18 Mar 2022 03:02:49 +0000
Message-ID: <DB87059A-66EC-43A6-82C5-2D890F7A02AF@vmware.com>
In-Reply-To: <d4f62008-faa7-2931-5690-f29f9544b81b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1177516722202466100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Mar 17, 2022, at 5:45 PM, Dave Hansen <dave.hansen@intel.com> wrote:
> =

> On 3/17/22 17:20, Nadav Amit wrote:
>> I don=E2=80=99t have other data right now. Let me run some measurements =
later
>> tonight. I understand your explanation, but I still do not see how
>> much =E2=80=9Clater=E2=80=9D can the lazy check be that it really matter=
s. Just
>> strange.
> =

> These will-it-scale tests are really brutal.  They're usually sitting in
> really tight kernel entry/exit loops.  Everything is pounding on kernel
> locks and bouncing cachelines around like crazy.  It might only be a few
> thousand cycles between two successive kernel entries.
> =

> Things like the call_single_queue cacheline have to be dragged from
> other CPUs *and* there are locks that you can spin on.  While a thread
> is doing all this spinning, it is forcing more and more threads into the
> lazy TLB state.  The longer you spin, the more threads have entered the
> kernel, contended on the mmap_lock and gone idle.
> =

> Is it really surprising that a loop that can take hundreds of locks can
> take a long time?
> =

>                for_each_cpu(cpu, cfd->cpumask) {
>                        csd_lock(csd);
> 			...
> 		}

Thanks for the clarification. It took me some time to rehash. Yes, my patch
should get reverted.

So I think I now get what you are talking about: this loop can take a lot
of time, which beforehand I did not see. But I am not sure it is exactly as
you describe (unless I am missing something). So I guess you are right, but=
 I
am sharing my understanding.

So let=E2=80=99s go over what overheads are induced (or not) in the loop:

(1) Contended csd_lock(): csd_lock() is not a cross-core lock. In this
workload, which does not use asynchronous IPIs, it is not contended.

(2) Cache-misses on csd_lock(). I am not sure this really induces overheads=
 or
at least has to induce overhead.

On one hand, although two CSDs can reside in the same cacheline, we run
csd_lock_wait() eventually to check our smp-call was served. So the cacheli=
ne
of the CSD should eventually be present in the IPI-initiator's cache
(ready for the next invocation). On the other hand, as there is no write
access by csd_lock_wait(), then due to MESI, the CSD cache-line might still
be shared, and would require invalidation on the next csd_lock() invocation.

I would presume that as there are no data dependencies the CPU can continue
speculatively continue execution past csd_lock() even if there is a
cache-miss. So I don=E2=80=99t see it really induing an overhead.

(3) Cache-line misses on llist_add(). This makes perfect sense, and I don=
=E2=80=99t
see a easy way around, especially that apparently on x86 FAA and CAS
latency is similar.

(4) cpu_tlbstate_shared.is_lazy - well, this is only added once you revert =
the
patch.

One thing to note, although I am not sure it is really relevant here
(because your explanation on core stuck on mmap_lock makes sense), is that
there are two possible reasons for fewer IPIs:

(a) Skipping shootdowns (i.e., you find remote CPUs to be lazy); and
(b) Save IPIs (i.e. llist_add() finds that another IPI is already pending).

I have some vague ideas how to shorten the loop in
smp_call_function_many_cond(), but I guess for now revert is the way to
go.

Thanks for you patience. Yes, revert.
--===============1177516722202466100==--


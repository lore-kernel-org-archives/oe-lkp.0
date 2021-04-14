Content-Type: multipart/mixed; boundary="===============1914774484416891266=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 12:45:12 -0600
Message-ID: <CAOUHufY_++Zr3uN=RCjj22qZHE=650eihyAFWnaPSSC3jS1Xhg@mail.gmail.com>
In-Reply-To: <93308ea276cfe7997c29ce7132516e830e8fec40.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1914774484416891266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 7:52 AM Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2021-04-14 at 16:27 +0800, Huang, Ying wrote:
> > Yu Zhao <yuzhao@google.com> writes:
> >
> > > On Wed, Apr 14, 2021 at 12:15 AM Huang, Ying <ying.huang@intel.com>
> > > wrote:
> > > >
> > > NUMA Optimization
> > > -----------------
> > > Support NUMA policies and per-node RSS counters.
> > >
> > > We only can move forward one step at a time. Fair?
> >
> > You don't need to implement that now definitely.  But we can discuss
> > the
> > possible solution now.
>
> That was my intention, too. I want to make sure we don't
> end up "painting ourselves into a corner" by moving in some
> direction we have no way to get out of.
>
> The patch set looks promising, but we need some plan to
> avoid the worst case behaviors that forced us into rmap
> based scanning initially.

Hi Rik,

By design, we voluntarily fall back to the rmap when page tables of a
process are too sparse. At the moment, we have

bool should_skip_mm()
{
    ...
    /* leave the legwork to the rmap if mapped pages are too sparse */
    if (RSS < mm_pgtables_bytes(mm) / PAGE_SIZE)
        return true;
    ....
}

So yes, I agree we have more work to do in this direction, the
fallback should be per VMA and NUMA aware. Note that once the fallback
happens, it shares the same path with the existing implementation.

Probably I should have clarified that this patchset does not replace
the rmap with page table scanning. It conditionally uses page table
scanning when it thinks most of the pages on a system could have been
referenced, i.e., when it thinks walking the rmap would be less
efficient, based on generations.

It *unconditionally* walks the rmap to scan each of the pages it
eventually tries to evict, because scanning page tables for a small
batch of pages it wants to evict is too costly.

One of the simple ways to look@how the mixture of page table
scanning and the rmap works is:
  1) it scans page tables (but might fallback to the rmap) to
deactivate pages from the active list to the inactive list, when the
inactive list becomes empty
  2) it walks the rmap (not page table scanning) when it evicts
individual pages from the inactive list.
Does it make sense?

I fully agree "the mixture" is currently statistically decided, and it
must be made worst-case scenario proof.

> > Note that it's possible that only some processes are bound to some
> > NUMA
> > nodes, while other processes aren't bound.
>
> For workloads like PostgresQL or Oracle, it is common
> to have maybe 70% of memory in a large shared memory
> segment, spread between all the NUMA nodes, and mapped
> into hundreds, if not thousands, of processes in the
> system.

I do plan to reach out to the PostgreSQL community and ask for help to
benchmark this patchset. Will keep everybody posted.

> Now imagine we have an 8 node system, and memory
> pressure in the DMA32 zone of node 0.
>
> How will the current VM behave?

At the moment, we don't plan to make the DMA32 zone reclaim a
priority. Rather, I'd suggest
  1) stay with the existing implementation
  2) boost the watermark for DMA32

> What will the virtual scanning need to do?

The high priority items are:

To-do List
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
KVM Optimization
----------------
Support shadow page table scanning.

NUMA Optimization
-----------------
Support NUMA policies and per-node RSS counters.

We are just trying to focus our resources on the trending use cases. Reason=
able?

> If we can come up with a solution to make virtual
> scanning scale for that kind of workload, great.

It won't be easy, but IMO nothing worth doing is easy :)

> If not ... if it turns out most of the benefits of
> the multigeneratinal LRU framework come from sorting
> the pages into multiple LRUs, and from being able
> to easily reclaim unmapped pages before having to
> scan mapped ones, could it be an idea to implement
> that first, independently from virtual scanning?

This option is on the table considering the possibilities
  1) there are unforeseeable problems we couldn't solve
  2) sorting pages alone has demonstrated its standalone value

I guess 2) alone will help people heavily using page cache. Google
isn't one of them though. Personally I'm neutral (at least trying to
be), and my goal is to accommodate everybody as best as I can.

> I am all for improving
> our page reclaim system, I
> just want to make sure we don't revisit the old traps
> that forced us where we are today :)

Yeah, I do see your concerns and we need more data. Any suggestions on
benchmarks you'd be interested in?

Thanks.
--===============1914774484416891266==--


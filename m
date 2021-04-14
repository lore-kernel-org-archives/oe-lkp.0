Content-Type: multipart/mixed; boundary="===============0048406909259738833=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Tue, 13 Apr 2021 21:40:12 -0600
Message-ID: <CAOUHufa7RCK6gcYSeLv98w3_NY-TUpUNkDS0p_W4u5_ZfSXTsg@mail.gmail.com>
In-Reply-To: <20210413231436.GF63242@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============0048406909259738833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 5:14 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Tue, Apr 13, 2021 at 10:13:24AM -0600, Jens Axboe wrote:
> > On 4/13/21 1:51 AM, SeongJae Park wrote:
> > > From: SeongJae Park <sjpark@amazon.de>
> > >
> > > Hello,
> > >
> > >
> > > Very interesting work, thank you for sharing this :)
> > >
> > > On Tue, 13 Apr 2021 00:56:17 -0600 Yu Zhao <yuzhao@google.com> wrot=
e:
> > >
> > >> What's new in v2
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> Special thanks to Jens Axboe for reporting a regression in buffered
> > >> I/O and helping test the fix.
> > >
> > > Is the discussion open?  If so, could you please give me a link?
> >
> > I wasn't on the initial post (or any of the lists it was posted to), but
> > it's on the google page reclaim list. Not sure if that is public or not.
> >
> > tldr is that I was pretty excited about this work, as buffered IO tends
> > to suck (a lot) for high throughput applications. My test case was
> > pretty simple:
> >
> > Randomly read a fast device, using 4k buffered IO, and watch what
> > happens when the page cache gets filled up. For this particular test,
> > we'll initially be doing 2.1GB/sec of IO, and then drop to 1.5-1.6GB/sec
> > with kswapd using a lot of CPU trying to keep up. That's mainline
> > behavior.
>
> I see this exact same behaviour here, too, but I RCA'd it to
> contention between the inode and memory reclaim for the mapping
> structure that indexes the page cache. Basically the mapping tree
> lock is the contention point here - you can either be adding pages
> to the mapping during IO, or memory reclaim can be removing pages
> from the mapping, but we can't do both at once.
>
> So we end up with kswapd spinning on the mapping tree lock like so
> when doing 1.6GB/s in 4kB buffered IO:
>
> -   20.06%     0.00%  [kernel]               [k] kswapd                  =
                                                                           =
           =E2=96=92
>    - 20.06% kswapd                                                       =
                                                                           =
           =E2=96=92
>       - 20.05% balance_pgdat                                             =
                                                                           =
           =E2=96=92
>          - 20.03% shrink_node                                            =
                                                                           =
           =E2=96=92
>             - 19.92% shrink_lruvec                                       =
                                                                           =
           =E2=96=92
>                - 19.91% shrink_inactive_list                             =
                                                                           =
           =E2=96=92
>                   - 19.22% shrink_page_list                              =
                                                                           =
           =E2=96=92
>                      - 17.51% __remove_mapping                           =
                                                                           =
           =E2=96=92
>                         - 14.16% _raw_spin_lock_irqsave                  =
                                                                           =
           =E2=96=92
>                            - 14.14% do_raw_spin_lock                     =
                                                                           =
           =E2=96=92
>                                 __pv_queued_spin_lock_slowpath           =
                                                                           =
           =E2=96=92
>                         - 1.56% __delete_from_page_cache                 =
                                                                           =
           =E2=96=92
>                              0.63% xas_store                             =
                                                                           =
           =E2=96=92
>                         - 0.78% _raw_spin_unlock_irqrestore              =
                                                                           =
           =E2=96=92
>                            - 0.69% do_raw_spin_unlock                    =
                                                                           =
           =E2=96=92
>                                 __raw_callee_save___pv_queued_spin_unlock=
                                                                           =
           =E2=96=92
>                      - 0.82% free_unref_page_list                        =
                                                                           =
           =E2=96=92
>                         - 0.72% free_unref_page_commit                   =
                                                                           =
           =E2=96=92
>                              0.57% free_pcppages_bulk                    =
                                                                           =
           =E2=96=92
>
> And these are the processes consuming CPU:
>
>    5171 root      20   0 1442496   5696   1284 R  99.7   0.0   1:07.78 fio
>    1150 root      20   0       0      0      0 S  47.4   0.0   0:22.70 ks=
wapd1
>    1146 root      20   0       0      0      0 S  44.0   0.0   0:21.85 ks=
wapd0
>    1152 root      20   0       0      0      0 S  39.7   0.0   0:18.28 ks=
wapd3
>    1151 root      20   0       0      0      0 S  15.2   0.0   0:12.14 ks=
wapd2
>
> i.e. when memory reclaim kicks in, the read process has 20% less
> time with exclusive access to the mapping tree to insert new pages.
> Hence buffered read performance goes down quite substantially when
> memory reclaim kicks in, and this really has nothing to do with the
> memory reclaim LRU scanning algorithm.
>
> I can actually get this machine to pin those 5 processes to 100% CPU
> under certain conditions. Each process is spinning all that extra
> time on the mapping tree lock, and performance degrades further.
> Changing the LRU reclaim algorithm won't fix this - the workload is
> solidly bound by the exclusive nature of the mapping tree lock and
> the number of tasks trying to obtain it exclusively...
>
> > The initial posting of this patchset did no better, in fact it did a bit
> > worse. Performance dropped to the same levels and kswapd was using as
> > much CPU as before, but on top of that we also got excessive swapping.
> > Not at a high rate, but 5-10MB/sec continually.
> >
> > I had some back and forths with Yu Zhao and tested a few new revisions,
> > and the current series does much better in this regard. Performance
> > still dips a bit when page cache fills, but not nearly as much, and
> > kswapd is using less CPU than before.
>
> Profiles would be interesting, because it sounds to me like reclaim
> *might* be batching page cache removal better (e.g. fewer, larger
> batches) and so spending less time contending on the mapping tree
> lock...
>
> IOWs, I suspect this result might actually be a result of less lock
> contention due to a change in batch processing characteristics of
> the new algorithm rather than it being a "better" algorithm...

I appreciate the profile. But there is no batching in
__remove_mapping() -- it locks the mapping for each page, and
therefore the lock contention penalizes the mainline and this patchset
equally. It looks worse on your system because the four kswapd threads
from different nodes were working on the same file.

And kswapd is only one of two paths that could affect the performance.
The kernel context of the test process is where the improvement mainly
comes from.

I also suspect you were testing a file much larger than your memory
size. If so, sorry to tell you that a file only a few times larger,
e.g. twice, would be worse.

Here is my take:

Claim
-----
This patchset is a "better" algorithm. (Technically it's not an
algorithm, it's a feedback loop.)

Theoretical basis
-----------------
An open-loop control (the mainline) can only be better if the margin
of error in its prediction of the future events is less than that from
the trial-and-error of a closed-loop control (this patchset). For
simple machines, it surely can. For page reclaim, AFAIK, it can't.

A typical example: when randomly accessing a (not infinitely) large
file via buffered io long enough, we're bound to hit the same blocks
multiple times. Should we activate the pages containing those blocks,
i.e., to move them to the active lru list?  No.

RCA
---
For the fio/io_uring benchmark, the "No" is the key.

The mainline activates pages accessed multiple times. This is done in
the buffered io access path by mark_page_accessed(), and it takes the
lru lock, which is contended under memory pressure. This contention
slows down both the access path and kswapd. But kswapd is not the
problem here because we are measuring the io_uring process, not kswap.

For this patchset, there are no activations since the refault rates of
pages accessed multiple times are similar to those accessed only once
-- activations will only be done to pages from tiers with higher
refault rates.

If you wish to debunk
---------------------
git fetch https://linux-mm.googlesource.com/page-reclaim refs/changes/73/11=
73/1

CONFIG_LRU_GEN=3Dy
CONFIG_LRU_GEN_ENABLED=3Dy

Run your benchmarks

Profiles (200G mem + 400G file)
-------------------------------
A quick test from Jens' fio/io_uring:

-rc7
    13.30%  io_uring  xas_load
    13.22%  io_uring  _copy_to_iter
    12.30%  io_uring  __add_to_page_cache_locked
     7.43%  io_uring  clear_page_erms
     4.18%  io_uring  filemap_get_read_batch
     3.54%  io_uring  get_page_from_freelist
     2.98%  io_uring  ***native_queued_spin_lock_slowpath***
     1.61%  io_uring  page_cache_ra_unbounded
     1.16%  io_uring  xas_start
     1.08%  io_uring  filemap_read
     1.07%  io_uring  ***__activate_page***

lru lock: 2.98% (lru addition + activation)
activation: 1.07%

-rc7 + this patchset
    14.44%  io_uring  xas_load
    14.14%  io_uring  _copy_to_iter
    11.15%  io_uring  __add_to_page_cache_locked
     6.56%  io_uring  clear_page_erms
     4.44%  io_uring  filemap_get_read_batch
     2.14%  io_uring  get_page_from_freelist
     1.32%  io_uring  page_cache_ra_unbounded
     1.20%  io_uring  psi_group_change
     1.18%  io_uring  filemap_read
     1.09%  io_uring  ****native_queued_spin_lock_slowpath****
     1.08%  io_uring  do_mpage_readpage

lru lock: 1.09% (lru addition only)

And I plan to reach out to other communities, e.g., PostgreSQL, to
benchmark the patchset. I heard they have been complaining about the
buffered io performance under memory pressure. Any other benchmarks
you'd suggest?

BTW, you might find another surprise in how less frequently slab
shrinkers are called under memory pressure, because this patchset is a
lot better at finding pages to reclaim and therefore doesn't overkill
slabs.

Thanks.
--===============0048406909259738833==--


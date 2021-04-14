Content-Type: multipart/mixed; boundary="===============2579184042334878469=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 08:43:36 -0600
Message-ID: <91146ee7-3054-a81a-296e-e75c24f4e290@kernel.dk>
In-Reply-To: <20210413231436.GF63242@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============2579184042334878469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/13/21 5:14 PM, Dave Chinner wrote:
> On Tue, Apr 13, 2021 at 10:13:24AM -0600, Jens Axboe wrote:
>> On 4/13/21 1:51 AM, SeongJae Park wrote:
>>> From: SeongJae Park <sjpark@amazon.de>
>>>
>>> Hello,
>>>
>>>
>>> Very interesting work, thank you for sharing this :)
>>>
>>> On Tue, 13 Apr 2021 00:56:17 -0600 Yu Zhao <yuzhao@google.com> wrote:
>>>
>>>> What's new in v2
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> Special thanks to Jens Axboe for reporting a regression in buffered
>>>> I/O and helping test the fix.
>>>
>>> Is the discussion open?  If so, could you please give me a link?
>>
>> I wasn't on the initial post (or any of the lists it was posted to), but
>> it's on the google page reclaim list. Not sure if that is public or not.
>>
>> tldr is that I was pretty excited about this work, as buffered IO tends
>> to suck (a lot) for high throughput applications. My test case was
>> pretty simple:
>>
>> Randomly read a fast device, using 4k buffered IO, and watch what
>> happens when the page cache gets filled up. For this particular test,
>> we'll initially be doing 2.1GB/sec of IO, and then drop to 1.5-1.6GB/sec
>> with kswapd using a lot of CPU trying to keep up. That's mainline
>> behavior.
> =

> I see this exact same behaviour here, too, but I RCA'd it to
> contention between the inode and memory reclaim for the mapping
> structure that indexes the page cache. Basically the mapping tree
> lock is the contention point here - you can either be adding pages
> to the mapping during IO, or memory reclaim can be removing pages
> from the mapping, but we can't do both at once.
> =

> So we end up with kswapd spinning on the mapping tree lock like so
> when doing 1.6GB/s in 4kB buffered IO:
> =

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
> =

> And these are the processes consuming CPU:
> =

>    5171 root      20   0 1442496   5696   1284 R  99.7   0.0   1:07.78 fio
>    1150 root      20   0       0      0      0 S  47.4   0.0   0:22.70 ks=
wapd1
>    1146 root      20   0       0      0      0 S  44.0   0.0   0:21.85 ks=
wapd0
>    1152 root      20   0       0      0      0 S  39.7   0.0   0:18.28 ks=
wapd3
>    1151 root      20   0       0      0      0 S  15.2   0.0   0:12.14 ks=
wapd2

Here's my profile when memory reclaim is active for the above mentioned
test case. This is a single node system, so just kswapd. It's using around
40-45% CPU:

    43.69%  kswapd0  [kernel.vmlinux]  [k] xas_create
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               shrink_page_list
               __delete_from_page_cache
               xas_store
               xas_create

    16.88%  kswapd0  [kernel.vmlinux]  [k] queued_spin_lock_slowpath
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               |          =

                --16.82%--shrink_inactive_list
                          |          =

                           --16.55%--shrink_page_list
                                     |          =

                                      --16.26%--_raw_spin_lock_irqsave
                                                queued_spin_lock_slowpath

     9.89%  kswapd0  [kernel.vmlinux]  [k] shrink_page_list
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               shrink_page_list

     5.46%  kswapd0  [kernel.vmlinux]  [k] xas_init_marks
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               shrink_page_list
               |          =

                --5.41%--__delete_from_page_cache
                          xas_init_marks

     4.42%  kswapd0  [kernel.vmlinux]  [k] __delete_from_page_cache
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               |          =

                --4.40%--shrink_page_list
                          __delete_from_page_cache

     2.82%  kswapd0  [kernel.vmlinux]  [k] isolate_lru_pages
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               |          =

               |--1.43%--shrink_active_list
               |          isolate_lru_pages
               |          =

                --1.39%--shrink_inactive_list
                          isolate_lru_pages

     1.99%  kswapd0  [kernel.vmlinux]  [k] free_pcppages_bulk
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               shrink_page_list
               free_unref_page_list
               free_unref_page_commit
               free_pcppages_bulk

     1.79%  kswapd0  [kernel.vmlinux]  [k] _raw_spin_lock_irqsave
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               |          =

                --1.76%--shrink_node
                          shrink_lruvec
                          shrink_inactive_list
                          |          =

                           --1.72%--shrink_page_list
                                     _raw_spin_lock_irqsave

     1.02%  kswapd0  [kernel.vmlinux]  [k] workingset_eviction
            |
            ---ret_from_fork
               kthread
               kswapd
               balance_pgdat
               shrink_node
               shrink_lruvec
               shrink_inactive_list
               |          =

                --1.00%--shrink_page_list
                          workingset_eviction

> i.e. when memory reclaim kicks in, the read process has 20% less
> time with exclusive access to the mapping tree to insert new pages.
> Hence buffered read performance goes down quite substantially when
> memory reclaim kicks in, and this really has nothing to do with the
> memory reclaim LRU scanning algorithm.
> =

> I can actually get this machine to pin those 5 processes to 100% CPU
> under certain conditions. Each process is spinning all that extra
> time on the mapping tree lock, and performance degrades further.
> Changing the LRU reclaim algorithm won't fix this - the workload is
> solidly bound by the exclusive nature of the mapping tree lock and
> the number of tasks trying to obtain it exclusively...

I've seen way worse than the above as well, it's just my go-to easy test
case for "man I wish buffered IO didn't suck so much".

>> The initial posting of this patchset did no better, in fact it did a bit
>> worse. Performance dropped to the same levels and kswapd was using as
>> much CPU as before, but on top of that we also got excessive swapping.
>> Not at a high rate, but 5-10MB/sec continually.
>>
>> I had some back and forths with Yu Zhao and tested a few new revisions,
>> and the current series does much better in this regard. Performance
>> still dips a bit when page cache fills, but not nearly as much, and
>> kswapd is using less CPU than before.
> =

> Profiles would be interesting, because it sounds to me like reclaim
> *might* be batching page cache removal better (e.g. fewer, larger
> batches) and so spending less time contending on the mapping tree
> lock...
> =

> IOWs, I suspect this result might actually be a result of less lock
> contention due to a change in batch processing characteristics of
> the new algorithm rather than it being a "better" algorithm...

See above - let me know if you want to see more specific profiling as
well.

-- =

Jens Axboe

--===============2579184042334878469==--


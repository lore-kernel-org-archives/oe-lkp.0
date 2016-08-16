Content-Type: multipart/mixed; boundary="===============4144218313591792688=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:19:42 +1000
Message-ID: <20160816001942.GF16044@dastard>
In-Reply-To: <CA+55aFzOAorMxCsv3uyyyhS8c5xteVnZVEm+bGyBjkjWVT5Zag@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4144218313591792688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:20:55PM -0700, Linus Torvalds wrote:
> On Mon, Aug 15, 2016 at 3:42 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >
> >   31.18%  [kernel]  [k] __pv_queued_spin_lock_slowpath
> >    9.90%  [kernel]  [k] copy_user_generic_string
> >    3.65%  [kernel]  [k] __raw_callee_save___pv_queued_spin_unlock
> >    2.62%  [kernel]  [k] __block_commit_write.isra.29
> >    2.26%  [kernel]  [k] _raw_spin_lock_irqsave
> >    1.72%  [kernel]  [k] _raw_spin_lock
> =

> Ok, this is more like it.
> =

> I'd still like to see it on raw hardware, just to see if we may have a
> bug in the PV code. Because that code has been buggy before. I
> *thought* we fixed it, but ...
> =

> In fact, you don't even need to do it outside of virtualization, but
> with paravirt disabled (so that it runs the native non-pv locking in
> the virtual machine).
> =

> >    36.60%     0.00%  [kernel]            [k] kswapd
> >    - 30.29% kswapd
> >       - 30.23% shrink_node
> >          - 30.07% shrink_node_memcg.isra.75
> >             - 30.15% shrink_inactive_list
> >                - 29.49% shrink_page_list
> >                   - 22.79% __remove_mapping
> >                      - 22.27% _raw_spin_lock_irqsave
> >                           __pv_queued_spin_lock_slowpath
> =

> How I dislike the way perf shows the call graph data... Just last week
> I was talking to Arnaldo about how to better visualize the cost of
> spinlocks, because the normal way "perf" shows costs is so nasty.

Do not change it - it's the way call graph profiles have been
presented for the past 20 years. I hate it when long standing
conventions are changed because one person doesn't like them and
everyone else has to relearn skills the haven't had to think about
for years....

> What happens is that you see that 36% of CPU time is attributed to
> kswapd, and then you can drill down and see where that 36% comes from.
> So far so good, and that's what perf does fairly well.
> =

> But then when you find the spinlock, you actually want to go the other
> way, and instead ask it to show "who were the callers to this routine
> and what were the percentages", so that you can then see whether (for
> example) it's just that __remove_mapping() use that contends with
> itself, or whether it's contending with the page additions or
> whatever..

Um, perf already does that:

-   31.55%    31.55%  [kernel]            [k] __pv_queued_spin_lock_slowpath
   - 19.83% ret_from_fork
      - kthread
         - 18.55% kswapd
              shrink_node
              shrink_node_memcg.isra.75
              shrink_inactive_list
           1.76% worker_thread
              process_one_work
              wb_workfn =

              wb_writeback
              __writeback_inodes_wb
              writeback_sb_inodes         =

              __writeback_single_inode
              do_writepages
              xfs_vm_writepages
              write_cache_pages
              xfs_do_writepage
   + 5.95% __libc_pwrite

I have that right here because *it's a view of the profile I've
already looked at*. I didn't post it because, well, it's shorter to
simply say "contention is from in kswapd".

> So what I'd like to see (and this is where it becomes *so* much more
> useful to be able to recreate it myself so that I can play with the
> perf data several different ways) is to see what the profile looks
> like in that spinlocked region.

Boot your machine with "fake_numa=3D4", and play till you heart is
content. That's all I do with my test VMs to make them exercise NUMA
paths.

> None of this code is all that new, which is annoying. This must have
> gone on forever,

Yes, it has been. Just worse than I've notice before, probably
because of all the stuff put under the tree lock in the past couple
of years.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============4144218313591792688==--


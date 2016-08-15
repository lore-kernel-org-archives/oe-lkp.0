Content-Type: multipart/mixed; boundary="===============6016386367178339329=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 08:42:59 +1000
Message-ID: <20160815224259.GB19025@dastard>
In-Reply-To: <20160815222211.GA19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============6016386367178339329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 08:22:11AM +1000, Dave Chinner wrote:
> On Sun, Aug 14, 2016 at 10:12:20PM -0700, Linus Torvalds wrote:
> > On Aug 14, 2016 10:00 PM, "Dave Chinner" <david@fromorbit.com> wrote:
> > >
> > > > What does it say if you annotate that _raw_spin_unlock_irqrestore()
> > function?
> > > ....
> > >        =C2=BF
> > >        =C2=BF    Disassembly of section load0:
> > >        =C2=BF
> > >        =C2=BF    ffffffff81e628b0 <load0>:
> > >        =C2=BF      nop
> > >        =C2=BF      push   %rbp
> > >        =C2=BF      mov    %rsp,%rbp
> > >        =C2=BF      movb   $0x0,(%rdi)
> > >        =C2=BF      nop
> > >        =C2=BF      mov    %rsi,%rdi
> > >        =C2=BF      push   %rdi
> > >        =C2=BF      popfq
> > >  99.35 =C2=BF      nop
> > =

> > Yeah, that's a good disassembly of a non-debug spin unlock, and the sym=
bols
> > are fine, but the profile is not valid. That's an interrupt point, right
> > after the popf that enables interiors again.
> > =

> > I don't know why 'perf' isn't working on your machine, but it clearly
> > isn't.
> > =

> > Has it ever worked on that machine?
> =

> It's working the same as it's worked since I started using it many
> years ago.
> =

> > What cpu is it?
> =

> Intel(R) Xeon(R) CPU E5-4620 0 @ 2.20GHz
> =

> > Are you running in some
> > virtualized environment without performance counters, perhaps?
> =

> I've mentioned a couple of times in this thread that I'm testing
> inside a VM. It's the same VM I've been running performance tests in
> since early 2010. Nobody has complained that the profiles I've
> posted are useless before, and not once in all that time have they
> been wrong in indicating a spinning lock contention point.
> =

> i.e. In previous cases where I've measured double digit CPU usage
> numbers in a spin_unlock variant, it's always been a result of
> spinlock contention. And fixing the algorithmic problem that lead to
> the spinlock showing up in the profile in the first place has always
> substantially improved performance and scalability.
> =

> As such, I'm always going to treat a locking profile like that as
> contention because even if it isn't contending *on my machine*,
> that amount of work being done under a spinning lock is /way too
> much/ and it *will* cause contention problems with larger machines.

And, so, after helpfully being pointed at the magic kvm "-cpu host"
flag to enable access to the performance counters from the guest
(using "-e cycles", because more precise counters aren't available),
the profile looks like this:

  31.18%  [kernel]  [k] __pv_queued_spin_lock_slowpath
   9.90%  [kernel]  [k] copy_user_generic_string
   3.65%  [kernel]  [k] __raw_callee_save___pv_queued_spin_unlock
   2.62%  [kernel]  [k] __block_commit_write.isra.29
   2.26%  [kernel]  [k] _raw_spin_lock_irqsave
   1.72%  [kernel]  [k] _raw_spin_lock    =

   1.33%  [kernel]  [k] __wake_up_bit
   1.20%  [kernel]  [k] __radix_tree_lookup
   1.19%  [kernel]  [k] __remove_mapping  =

   1.12%  [kernel]  [k] __delete_from_page_cache
   0.97%  [kernel]  [k] xfs_do_writepage  =

   0.91%  [kernel]  [k] get_page_from_freelist
   0.90%  [kernel]  [k] up_write          =

   0.88%  [kernel]  [k] clear_page_dirty_for_io
   0.83%  [kernel]  [k] radix_tree_tag_set
   0.81%  [kernel]  [k] radix_tree_tag_clear
   0.80%  [kernel]  [k] down_write
   0.78%  [kernel]  [k] _raw_spin_unlock_irqrestore
   0.77%  [kernel]  [k] shrink_page_list
   0.76%  [kernel]  [k] ___might_sleep
   0.76%  [kernel]  [k] unlock_page
   0.74%  [kernel]  [k] __list_del_entry
   0.67%  [kernel]  [k] __add_to_page_cache_locked
   0.65%  [kernel]  [k] node_dirty_ok
   0.61%  [kernel]  [k] __rmqueue
   0.61%  [kernel]  [k] __block_write_begin_int
   0.61%  [kernel]  [k] cancel_dirty_page
   0.61%  [kernel]  [k] __test_set_page_writeback
   0.59%  [kernel]  [k] page_mapping
   0.57%  [kernel]  [k] __list_add
   0.56%  [kernel]  [k] free_pcppages_bulk
   0.54%  [kernel]  [k] _raw_spin_lock_irq
   0.54%  [kernel]  [k] generic_write_end
   0.51%  [kernel]  [k] drop_buffers

The call graph should be familiar by now:

   36.60%     0.00%  [kernel]            [k] kswapd
   - 30.29% kswapd  =

      - 30.23% shrink_node
         - 30.07% shrink_node_memcg.isra.75
            - 30.15% shrink_inactive_list
               - 29.49% shrink_page_list
                  - 22.79% __remove_mapping
                     - 22.27% _raw_spin_lock_irqsave
                          __pv_queued_spin_lock_slowpath
                     + 1.86% __delete_from_page_cache
                     + 1.27% _raw_spin_unlock_irqrestore
                  + 4.31% try_to_release_page
                  + 1.21% free_hot_cold_page_list
                    0.56% page_evictable
                 0.77% isolate_lru_pages.isra.72

That sure looks like spin lock contention to me....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============6016386367178339329==--


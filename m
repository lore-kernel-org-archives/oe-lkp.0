Content-Type: multipart/mixed; boundary="===============0119715310510275653=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 10:48:26 +1000
Message-ID: <20160815004826.GW19025@dastard>
In-Reply-To: <CA+55aFwYcjXn7kpLFWQ=jF0sSrhEfZhqNsjR+6O89OOH9qRNOw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0119715310510275653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 11:03:33AM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2016 at 8:56 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> > On Thu, Aug 11, 2016 at 07:27:52PM -0700, Linus Torvalds wrote:
> >>
> >> I don't recall having ever seen the mapping tree_lock as a contention
> >> point before, but it's not like I've tried that load either. So it
> >> might be a regression (going back long, I suspect), or just an unusual
> >> load that nobody has traditionally tested much.
> >>
> >> Single-threaded big file write one page at a time, was it?
> >
> > Yup. On a 4 node NUMA system.
> =

> Ok, I can't see any real contention on my single-node workstation
> (running ext4 too, so there may be filesystem differences), but I
> guess that shouldn't surprise me. The cacheline bouncing just isn't
> expensive enough when it all stays on-die.
> =

> I can see the tree_lock in my profiles (just not very high), and at
> least for ext4 the main caller ssems to be
> __set_page_dirty_nobuffers().
> =

> And yes, looking at that, the biggest cost by _far_ inside the
> spinlock seems to be the accounting.
> =

> Which doesn't even have to be inside the mapping lock, as far as I can
> tell, and as far as comments go.
> =

> So a stupid patch to just move the dirty page accounting to outside
> the spinlock might help a lot.
> =

> Does this attached patch help your contention numbers?

No. If anything, it makes it worse. Without the patch, I was
measuring 36-37% in _raw_spin_unlock_irqrestore. With the patch, it
is 42-43%. Write throughtput is the same at ~505MB/s.

There's a couple of interesting things showing up in the profile:

  41.64%  [kernel]  [k] _raw_spin_unlock_irqrestore
   7.92%  [kernel]  [k] copy_user_generic_string
   5.87%  [kernel]  [k] _raw_spin_unlock_irq
   3.18%  [kernel]  [k] do_raw_spin_lock
   2.51%  [kernel]  [k] cancel_dirty_page         <<<<<<<<<<<<<<<
   2.35%  [kernel]  [k] get_page_from_freelist
   2.22%  [kernel]  [k] shrink_page_list
   2.04%  [kernel]  [k] __block_commit_write.isra.30
   1.40%  [kernel]  [k] xfs_vm_releasepage
   1.21%  [kernel]  [k] free_hot_cold_page
   1.17%  [kernel]  [k] delay_tsc
   1.12%  [kernel]  [k] __wake_up_bit
   0.92%  [kernel]  [k] __slab_free
   0.91%  [kernel]  [k] clear_page_dirty_for_io
   0.82%  [kernel]  [k] __radix_tree_lookup
   0.76%  [kernel]  [k] node_dirty_ok
   0.68%  [kernel]  [k] page_evictable
   0.63%  [kernel]  [k] do_raw_spin_unlock
   0.62%  [kernel]  [k] up_write
.....

Why are we even calling into cancel_dirty_page() if the page isn't
dirty? xfs_vm_release_page() won't let dirty pages through to
try_to_free_buffers(), so all this is just pure overhead for XFS.


FWIW, this is not under the mapping->tree_lock, but the profile shows
that reclaiming bufferheads is roughly 20% of all the work kswapd is
doing. If we take away the mapping->tree_lock contention from the
usage totals, it's actually closer to 50% of the real work kswapd is
doing. The call graph profile is pretty grim:

-   41.89%     0.00%  [kernel]          [k] kswapd
   - kswapd
      - 41.84% shrink_node
         - 41.61% shrink_node_memcg.isra.75
            - 41.50% shrink_inactive_list
               - 40.21% shrink_page_list
                  - 26.47% __remove_mapping
                       26.30% _raw_spin_unlock_irqrestore
                  + 9.03% try_to_release_page
                     - 8.82% try_to_release_page
                        - 8.80% xfs_vm_releasepage
                             7.55% try_to_free_buffers
                  + 1.56% free_hot_cold_page_list
                    0.73% page_evictable
                 0.88% _raw_spin_unlock_irq

I guess now that the iomap code is in and we no longer really depend
on bufferheads in the writeback path, it's time to take the next
step in removing bufferheads from XFS altogether....

> I realize that this has nothing to do with the AIM7 regression (the
> spinlock just isn't high enough in that profile), but your contention
> numbers just aren't right, and updating accounting statistics inside a
> critical spinlock when not needed is just wrong.

Yup, but the above profile shows that the lock contention is mainly
coming from concurrent access in memory reclaim so I don't think the
accounting has anything to do with it.

Perhaps some kind of per-mapping reclaim batching reduce the
__remove_mapping() locking overhead is in order here. Especially as
this problem will only get worse on larger NUMA machines....

Cheers,

Dave.

-- =

Dave Chinner
david(a)fromorbit.com

--===============0119715310510275653==--


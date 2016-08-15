Content-Type: multipart/mixed; boundary="===============6793663265028412791=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 12:28:08 +1000
Message-ID: <20160815022808.GX19025@dastard>
In-Reply-To: <CA+55aFy8-biqTbDwwTqOPALAD+WN_PgDBK6HPTxTRiVgj5bA8Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6793663265028412791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 06:37:33PM -0700, Linus Torvalds wrote:
> On Sun, Aug 14, 2016 at 5:48 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >>
> >> Does this attached patch help your contention numbers?
> >
> > No. If anything, it makes it worse. Without the patch, I was
> > measuring 36-37% in _raw_spin_unlock_irqrestore. With the patch, it
> > is 42-43%. Write throughtput is the same at ~505MB/s.
> =

> Not helping any I can see, but I don't see how it could hurt...
> =

> Did you perhaps test it together with the other patches that improved
> xfs performance? If other things improve, then I'd expect the
> contention to get worse.
> =

> Not that it matters. Clearly that patch isn't even a stop-gap solution.

Tried it with and without. Same result.

> > There's a couple of interesting things showing up in the profile:
> >
> >   41.64%  [kernel]  [k] _raw_spin_unlock_irqrestore
> =

> Actually, you didn't point this one out, but *this* is the real kicker.
> =

> There's no way a *unlock* should show up that high. It's not spinning.
> It's doing a single store and a pushq/popfq sequence.
> =

> Sure, it's going to take a cross-node cachemiss in the presence of
> contention, but even then it should never be more expensive than the
> locking side - which will *also* do the node changes.
> =

> So there's something really odd in your profile. I don't think that's val=
id.
> =

> Maybe your symbol table came from a old kernel, and functions moved
> around enough that the profile attributions ended up bogus.

No, I don't think so. I don't install symbol tables on my test VMs,
I let /proc/kallsyms do that work for me. From an strace of 'perf
top -U -g":

18916 open("vmlinux", O_RDONLY)         =3D -1 ENOENT (No such file or dire=
ctory)
18916 open("/boot/vmlinux", O_RDONLY)   =3D -1 ENOENT (No such file or dire=
ctory)
18916 open("/boot/vmlinux-4.8.0-rc1-dgc+", O_RDONLY) =3D -1 ENOENT (No such=
 file or directory)
18916 open("/usr/lib/debug/boot/vmlinux-4.8.0-rc1-dgc+", O_RDONLY) =3D -1 E=
NOENT (No such file or directory)
18916 open("/lib/modules/4.8.0-rc1-dgc+/build/vmlinux", O_RDONLY) =3D -1 EN=
OENT (No such file or directory)
18916 open("/usr/lib/debug/lib/modules/4.8.0-rc1-dgc+/vmlinux", O_RDONLY) =
=3D -1 ENOENT (No such file or directory)
18916 open("/usr/lib/debug/boot/vmlinux-4.8.0-rc1-dgc+.debug", O_RDONLY) =
=3D -1 ENOENT (No such file or directory)
18916 open("/root/.debug/.build-id/63/aab665ce90bd81763b90ff2cf103d8e8e823b=
c", O_RDONLY) =3D -1 ENOENT (No such file or directory)
18916 open("/sys/kernel/notes", O_RDONLY) =3D 56
18916 read(56, "\4\0\0\0\24\0\0\0\3\0\0\0", 12) =3D 12
18916 read(56, "GNU\0", 4)              =3D 4
18916 read(56, "c\252\266e\316\220\275\201v;\220\377,\361\3\330\350\350#\27=
4", 20) =3D 20
18916 close(56)                         =3D 0
18916 open("/root/.debug/[kernel.kcore]/63aab665ce90bd81763b90ff2cf103d8e8e=
823bc", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) =3D -1 ENOENT (No such f=
ile or directory)
18916 open("/proc/kallsyms", O_RDONLY)  =3D 56
18916 fstat(56, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
18916 read(56, "0000000000000000 A irq_stack_uni"..., 1024) =3D 1024
18916 read(56, "a\n000000000000b8c0 A rsp_scratch"..., 1024) =3D 1024
18916 read(56, "0000000c6e0 A cmci_storm_state\n0"..., 1024) =3D 1024
18916 read(56, "000000ccd8 A sd_llc_id\n000000000"..., 1024) =3D 1024

You can see that perf is pulling the symbol table from the running
kernel, so I don't think there's a symbol mismatch here at all.

> I suspect it's actually supposed to be _raw_spin_lock_irqrestore()
> which is right next to that function. Although I'd actually expect
> that if it's lock contention, you should see the contention mostly in
> queued_spin_lock_slowpath().
> =

> Unless you have spinlock debugging turned on, in which case your
> contention is all from *that*. That's possible, of course.

$ grep SPINLOCK .config
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
CONFIG_QUEUED_SPINLOCKS=3Dy
CONFIG_PARAVIRT_SPINLOCKS=3Dy
CONFIG_DEBUG_SPINLOCK=3Dy
$

So, turn off CONFIG_DEBUG_SPINLOCK, and:

  41.06%  [kernel]  [k] _raw_spin_unlock_irqrestore
   7.68%  [kernel]  [k] copy_user_generic_string
   4.52%  [kernel]  [k] _raw_spin_unlock_irq
   2.78%  [kernel]  [k] _raw_spin_lock
   2.30%  [kernel]  [k] get_page_from_freelist
   2.21%  [kernel]  [k] native_queued_spin_lock_slowpath
   2.16%  [kernel]  [k] __slab_free
   2.12%  [kernel]  [k] __block_commit_write.isra.29
   1.55%  [kernel]  [k] __list_add
   1.49%  [kernel]  [k] shrink_page_list
   1.23%  [kernel]  [k] free_hot_cold_page
   1.14%  [kernel]  [k] __wake_up_bit
   1.01%  [kernel]  [k] try_to_release_page
   1.00%  [kernel]  [k] page_evictable
   0.90%  [kernel]  [k] cancel_dirty_page
   0.80%  [kernel]  [k] unlock_page
   0.80%  [kernel]  [k] up_write
   0.73%  [kernel]  [k] ___might_sleep
   0.68%  [kernel]  [k] clear_page_dirty_for_io
   0.64%  [kernel]  [k] __radix_tree_lookup
   0.61%  [kernel]  [k] __block_write_begin_int
   0.60%  [kernel]  [k] xfs_do_writepage
   0.59%  [kernel]  [k] node_dirty_ok
   0.55%  [kernel]  [k] down_write
   0.50%  [kernel]  [k] page_mapping
   0.47%  [kernel]  [k] iomap_write_actor


-   38.29%     0.01%  [kernel]            [k] kswapd
   - 38.28% kswapd
      - 38.23% shrink_node
         - 38.14% shrink_node_memcg.isra.75
            - 38.09% shrink_inactive_list
               - 36.90% shrink_page_list
                  - 24.41% __remove_mapping
                       24.16% _raw_spin_unlock_irqrestore
                  - 7.42% try_to_release_page
                     - 6.77% xfs_vm_releasepage
                        - 4.76% try_to_free_buffers
                           - 2.05% free_buffer_head
                              - 2.01% kmem_cache_free
                                   1.94% __slab_free
                           - 1.24% _raw_spin_lock
                                native_queued_spin_lock_slowpath
                             0.89% cancel_dirty_page
                          1.61% _raw_spin_lock
                  + 1.53% free_hot_cold_page_list
                    1.03% __list_add
                    0.74% page_evictable
                 0.86% _raw_spin_unlock_irq

No change in behaviour, and there's no obvious problems with the
call chain.

> >    7.92%  [kernel]  [k] copy_user_generic_string
> >    5.87%  [kernel]  [k] _raw_spin_unlock_irq
> >    3.18%  [kernel]  [k] do_raw_spin_lock
> >    2.51%  [kernel]  [k] cancel_dirty_page         <<<<<<<<<<<<<<<
> ...
> > Why are we even calling into cancel_dirty_page() if the page isn't
> > dirty? xfs_vm_release_page() won't let dirty pages through to
> > try_to_free_buffers(), so all this is just pure overhead for XFS.
> =

> See above: there's something screwy with your profile, you should
> check that first. Maybe it's not actually cancel_dirty_page() but
> something close-by.

No. try_to_free_buffers() calls drop_buffers(), which returns 1 when
the buffers are to be dropped. And when that happens, it *always*
calls cancel_dirty_page(), regardless of whether the page is
actually dirty or not.

fmeh. This was all screwed up by the memcg aware writeback. Starting
with commit 11f81be ("page_writeback: revive cancel_dirty_page() in a
restricted form") and then adding unconditional functionality that
can, in fact, *take the mapping->tree_lock* under the covers. i.e
unlocked_inode_to_wb_begin() hides that gem, which appears to be
neceessary for the accounting done when cleaning up a dirty page in
this location.

Still, why is it doing all this work on *clean pages*?

> > FWIW, this is not under the mapping->tree_lock, but the profile shows
> > that reclaiming bufferheads is roughly 20% of all the work kswapd is
> > doing.
> =

> Well, that may not actually be wrong. That's the most expensive part
> of reclaiming memory.

All the more reason for not using them.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============6793663265028412791==--


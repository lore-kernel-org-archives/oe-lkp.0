Content-Type: multipart/mixed; boundary="===============8016997901133928856=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:44:23 +1000
Message-ID: <20160816004423.GH16044@dastard>
In-Reply-To: <CA+55aFwp-Aeu-6j2MfMgEDoUwq+1vThL4nBdMj-p5TqDMA5RrA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8016997901133928856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:48:36PM -0700, Linus Torvalds wrote:
> On Mon, Aug 15, 2016 at 4:20 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > None of this code is all that new, which is annoying. This must have
> > gone on forever,
> =

> ... ooh.
> =

> Wait, I take that back.
> =

> We actually have some very recent changes that I didn't even think
> about that went into this very merge window.
....
> Mel? The issue is that Dave Chinner is seeing some nasty spinlock
> contention on "mapping->tree_lock":
> =

> >   31.18%  [kernel]  [k] __pv_queued_spin_lock_slowpath
> =

> and one of the main paths is this:
> =

> >    - 30.29% kswapd
> >       - 30.23% shrink_node
> >          - 30.07% shrink_node_memcg.isra.75
> >             - 30.15% shrink_inactive_list
> >                - 29.49% shrink_page_list
> >                   - 22.79% __remove_mapping
> >                      - 22.27% _raw_spin_lock_irqsave
> >                           __pv_queued_spin_lock_slowpath
> =

> so there's something ridiculously bad going on with a fairly simple bench=
mark.
> =

> Dave's benchmark is literally just a "write a new 48GB file in
> single-page chunks on a 4-node machine". Nothing odd - not rewriting
> files, not seeking around, no nothing.
> =

> You can probably recreate it with a silly
> =

>   dd bs=3D4096 count=3D$((12*1024*1024)) if=3D/dev/zero of=3Dbigfile
> =

> although Dave actually had something rather fancier, I think.

16p, 16GB RAM, fake_numa=3D4. Overwrite a 47GB file on a 48GB
filesystem:

# mkfs.xfs -f -d size=3D48g /dev/vdc
# mount /dev/vdc /mnt/scratch
# xfs_io -f -c "pwrite 0 47g" /mnt/scratch/fooey

Wait for memory to fill and reclaim to kick in, then look at the
profile. If you run it a second time, reclaim kicks in straight
away.

It's not the new code in 4.8 - it reproduces on 4.7 just fine, and
probably will reproduce all the way back to when the memcg-aware
writeback code was added....

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============8016997901133928856==--


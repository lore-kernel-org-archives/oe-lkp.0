Content-Type: multipart/mixed; boundary="===============2330923375142882954=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 16:48:36 -0700
Message-ID: <CA+55aFwp-Aeu-6j2MfMgEDoUwq+1vThL4nBdMj-p5TqDMA5RrA@mail.gmail.com>
In-Reply-To: <CA+55aFzOAorMxCsv3uyyyhS8c5xteVnZVEm+bGyBjkjWVT5Zag@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2330923375142882954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 4:20 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> None of this code is all that new, which is annoying. This must have
> gone on forever,

... ooh.

Wait, I take that back.

We actually have some very recent changes that I didn't even think
about that went into this very merge window.

In particular, I wonder if it's all (or at least partly) due to the
new per-node LRU lists.

So in shrink_page_list(), when kswapd is encountering a page that is
under page writeback due to page reclaim, it does:

                        if (current_is_kswapd() &&
                            PageReclaim(page) &&
                            test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
                                nr_immediate++;
                                goto keep_locked;

which basically ignores that page and puts it back on the LRU list.

But that "is this node under writeback" is new - it now does that per
node, and it *used* to do it per zone (so it _used_ to test "is this
zone under writeback").

All the mapping pages used to be in the same zone, so I think it
effectively single-threaded the kswapd reclaim for one mapping under
reclaim writeback. But in your cases, you have multiple nodes...

Ok, that's a lot of hand-wavy new-age crystal healing thinking.

Really, I haven't looked at it more than "this is one thing that has
changed recently, I wonder if it changes the patterns and could
explain much higher spin_lock contention on the mapping->tree_lock".

I'm adding Mel Gorman and his band of miscreants to the cc, so that
they can tell me that I'm full of shit, and completely missed on what
that zone->node change actually ends up meaning.

Mel? The issue is that Dave Chinner is seeing some nasty spinlock
contention on "mapping->tree_lock":

>   31.18%  [kernel]  [k] __pv_queued_spin_lock_slowpath

and one of the main paths is this:

>    - 30.29% kswapd
>       - 30.23% shrink_node
>          - 30.07% shrink_node_memcg.isra.75
>             - 30.15% shrink_inactive_list
>                - 29.49% shrink_page_list
>                   - 22.79% __remove_mapping
>                      - 22.27% _raw_spin_lock_irqsave
>                           __pv_queued_spin_lock_slowpath

so there's something ridiculously bad going on with a fairly simple benchma=
rk.

Dave's benchmark is literally just a "write a new 48GB file in
single-page chunks on a 4-node machine". Nothing odd - not rewriting
files, not seeking around, no nothing.

You can probably recreate it with a silly

  dd bs=3D4096 count=3D$((12*1024*1024)) if=3D/dev/zero of=3Dbigfile

although Dave actually had something rather fancier, I think.

             Linus

--===============2330923375142882954==--


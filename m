Content-Type: multipart/mixed; boundary="===============3273956374945751790=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 17:15:47 -0700
Message-ID: <CA+55aFznUMMtRbhE40gXke2XAV2EqKUYBfFsfLoJ5TRw7UeZ-Q@mail.gmail.com>
In-Reply-To: <CA+55aFzOAorMxCsv3uyyyhS8c5xteVnZVEm+bGyBjkjWVT5Zag@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3273956374945751790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 4:20 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But I'll try to see what happens
> on my profile, even if I can't recreate the contention itself, just
> trying to see what happens inside of that region.

Yeah, since I run my machines on encrypted disks, my profile shows 60%
kthread, but that's just because 55% is crypto.

I only have 5% in kswapd. And the spinlock doesn't even show up for me
(but "__delete_from_page_cache()" does, which doesn't look
unreasonable).

And while the biggest reason the spinlock doesn't show up is likely
simply my single-node "everything is on one die", I still think the
lower kswapd CPU use might be partly due to the node-vs-zone thing.

For me, with just one node, the new

            test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {

ends up being very similar to what we used to have before, ie

            test_bit(ZONE_WRITEBACK, &zone->flags)) {

but on a multi-node machine it would be rather different.

So I might never see contention anyway.

The basic logic in shrink_swap_list() goes back to commit 283aba9f9e0
("mm: vmscan: block kswapd if it is encountering pages under
writeback") but it has been messed around with a lot (and something
else existed there before - we've always had some "throttle kswapd so
that it doesn't use insane amounts of CPU time").

DaveC - does the spinlock contention go away if you just go back to
4.7? If so, I think it's the new zone thing. But it would be good to
verify - maybe it's something entirely different and it goes back much
further.

Mel - I may be barking up entirely the wrong tree, but it would be
good if you could take a look just in case this is actually it.

                  Linus

--===============3273956374945751790==--


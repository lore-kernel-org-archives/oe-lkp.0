Content-Type: multipart/mixed; boundary="===============6774635770781291987=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 18:51:42 -0700
Message-ID: <CA+55aFwmRPuhLLqN8D-3pcbkqoC05t=1dtnsv8k074uD7QNxBg@mail.gmail.com>
In-Reply-To: <20160816001942.GF16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============6774635770781291987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 5:19 PM, Dave Chinner <david@fromorbit.com> wrote:
>
>> None of this code is all that new, which is annoying. This must have
>> gone on forever,
>
> Yes, it has been. Just worse than I've notice before, probably
> because of all the stuff put under the tree lock in the past couple
> of years.

So this is where a good profile can matter.

Particularly if it's all about kswapd, and all the contention is just
from __remove_mapping(), what should matter is the "all the stuff"
added *there* and absolutely nowhere else.

Sadly (well, not for me), in my profiles I have

 --3.37%--kswapd
   |
    --3.36%--shrink_node
      |
      |--2.88%--shrink_node_memcg
      |  |
      |   --2.87%--shrink_inactive_list
      |     |
      |     |--2.55%--shrink_page_list
      |     |  |
      |     |  |--0.84%--__remove_mapping
      |     |  |  |
      |     |  |  |--0.37%--__delete_from_page_cache
      |     |  |  |  |
      |     |  |  |   --0.21%--radix_tree_replace_clear_tags
      |     |  |  |     |
      |     |  |  |      --0.12%--__radix_tree_lookup
      |     |  |  |
      |     |  |   --0.23%--_raw_spin_lock_irqsave
      |     |  |     |
      |     |  |      --0.11%--queued_spin_lock_slowpath
      |     |  |
   ................


which is rather different from your 22% spin-lock overhead.

Anyway, including the direct reclaim call paths gets
__remove_mapping() a bit higher, and _raw_spin_lock_irqsave climbs to
0.26%. But perhaps more importlantly, looking at what __remove_mapping
actually *does* (apart from the spinlock) gives us:

 - inside remove_mapping itself (0.11% on its own - flat cost, no
child accounting)

    48.50 =E2=94=82       lock   cmpxchg %edx,0x1c(%rbx)

    so that's about 0.05%

 - 0.40% __delete_from_page_cache (0.22%
radix_tree_replace_clear_tags, 0.13%__radix_tree_lookup)

 - 0.06% workingset_eviction()

so I'm not actually seeing anything *new* expensive in there. The
__delete_from_page_cache() overhead may have changed a bit with the
tagged tree changes, but this doesn't look like memcg.

But we clearly have very different situations.

What does your profile show for when you actually dig into
__remove_mapping() itself?, Looking at your flat profile, I'm assuming
you get

   1.31%  [kernel]  [k] __radix_tree_lookup
   1.22%  [kernel]  [k] radix_tree_tag_set
   1.14%  [kernel]  [k] __remove_mapping

which is higher (but part of why my percentages are lower is that I
have that "50% CPU used for encryption" on my machine).

But I'm not seeing anything I'd attribute to "all the stuff added".
For example, originally I would have blamed memcg, but that's not
actually in this path at all.

I come back to wondering whether maybe you're hitting some PV-lock problem.

I know queued_spin_lock_slowpath() is ok. I'm not entirely sure
__pv_queued_spin_lock_slowpath() is.

So I'd love to see you try the non-PV case, but I also think it might
be interesting to see what the instruction profile for
__pv_queued_spin_lock_slowpath() itself is. They share a lot of code
(there's some interesting #include games going on to make
queued_spin_lock_slowpath() actually *be*
__pv_queued_spin_lock_slowpath() with some magic hooks), but there
might be issues.

For example, if you run a virtual 16-core system on a physical machine
that then doesn't consistently give 16 cores to the virtual machine,
you'll get no end of hiccups.

Because as mentioned, we've had bugs ("performance anomalies") there before.

               Linus

--===============6774635770781291987==--


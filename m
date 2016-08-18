Content-Type: multipart/mixed; boundary="===============5667649735392652747=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 18 Aug 2016 15:25:40 -0700
Message-ID: <CA+55aFzqmNRWyczFHDCgjv2w6ZyD_AUJL1O1ZRmDs+DHT2=2cQ@mail.gmail.com>
In-Reply-To: <20160818211949.GE22388@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============5667649735392652747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 2:19 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> For streaming or use-once IO it makes a lot of sense to restrict the
> locality of the page cache. The faster the IO device, the less dirty
> page buffering we need to maintain full device bandwidth. And the
> larger the machine the greater the effect of global page cache
> pollution on the other appplications is.

Yes. But I agree with you that it might be very hard to actually get
something that does a good job automagically.

>> In fact, looking at the __page_cache_alloc(), we already have that
>> "spread pages out" logic. I'm assuming Dave doesn't actually have that
>> bit set (I don't think it's the default), but I'm also envisioning
>> that maybe we could extend on that notion, and try to spread out
>> allocations in general, but keep page allocations from one particular
>> mapping within one node.
>
> CONFIG_CPUSETS=3Dy
>
> But I don't have any cpusets configured (unless systemd is doing
> something wacky under the covers) so the page spread bit should not
> be set.

Yeah, but even when it's not set we just do a generic alloc_pages(),
which is just going to fill up all nodes. Not perhaps quite as "spread
out", but there's obviously no attempt to try to be node-aware either.

So _if_ we come up with some reasonable way to say "let's keep the
pages of this mapping together", we could try to do it in that
numa-aware __page_cache_alloc().

It *could* be as simple/stupid as just saying "let's allocate the page
cache for new pages from the current node" - and if the process that
dirties pages just stays around on one single node, that might already
be sufficient.

So just for testing purposes, you could try changing that

        return alloc_pages(gfp, 0);

in __page_cache_alloc() into something like

        return alloc_pages_node(cpu_to_node(raw_smp_processor_id())), gfp, =
0);

or something.

>> The fact that zone_reclaim_mode really improves on Dave's numbers
>> *that* dramatically does seem to imply that there is something to be
>> said for this.
>>
>> We do *not* want to limit the whole page cache to a particular node -
>> that sounds very unreasonable in general. But limiting any particular
>> file mapping (by default - I'm sure there are things like databases
>> that just want their one DB file to take over all of memory) to a
>> single node sounds much less unreasonable.
>>
>> What do you guys think? Worth exploring?
>
> The problem is that whenever we turn this sort of behaviour on, some
> benchmark regresses because it no longer holds it's working set in
> the page cache, leading to the change being immediately reverted.
> Enterprise java benchmarks ring a bell, for some reason.

Yeah. It might be ok if we limit the new behavior to just new pages
that get allocated for writing, which is where we want to limit the
page cache more anyway (we already have all those dirty limits etc).

But from a testing standpoint, you can probably try the above
"alloc_pages_node()" hack and see if it even makes a difference. It
might not work, and the dirtier might be moving around too much etc.

             Linus

--===============5667649735392652747==--


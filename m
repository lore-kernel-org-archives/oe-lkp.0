Content-Type: multipart/mixed; boundary="===============1915708180320757124=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:47:36 -0700
Message-ID: <CA+55aFxCSU=Hy7OqRxHoJDx1ruMD3H2qvmy4hdZ0Bjx94dwDug@mail.gmail.com>
In-Reply-To: <20160816150500.GH8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1915708180320757124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel,
 thanks for taking a look. Your theory sounds more complete than mine,
and since Dave is able to see the problem with 4.7, it would be nice
to hear about the 4.6 behavior and commit ede37713737 in particular.

That one seems more likely to affect contention than the zone/node one
I found during the merge window anyway, since it actually removes a
sleep in kswapd during congestion.

I've always preferred to see direct reclaim as the primary model for
reclaim, partly in order to throttle the actual "bad" process, but
also because "kswapd uses lots of CPU time" is such a nasty thing to
even begin guessing about.

So I have to admit to liking that "make kswapd sleep a bit if it's
just looping" logic that got removed in that commit.

And looking at DaveC's numbers, it really feels like it's not even
what we do inside the locked region that is the problem. Sure,
__delete_from_page_cache() (which is most of it) is at 1.86% of CPU
time (when including all the things it calls), but that still isn't
all that much. Especially when compared to just:

   0.78%  [kernel]  [k] _raw_spin_unlock_irqrestore

from his flat profile. That's not some spinning wait, that's just
releasing the lock with a single write (and the popf, but while that's
an expensive instruction, it's just tens of cpu cycles).

So I'm more and more getting the feeling that it's not what we do
inside the lock that is problematic. I started out blaming memcg
accounting or something, but none of the numbers seem to back that up.
So it's primarily really just the fact that kswapd is simply hammering
on that lock way too much.

So yeah, I'm blaming kswapd itself doing something wrong. It's not a
problem in a single-node environment (since there's only one), but
with multiple nodes it clearly just devolves.

Yes, we could try to batch the locking like DaveC already suggested
(ie we could move the locking to the caller, and then make
shrink_page_list() just try to keep the lock held for a few pages if
the mapping doesn't change), and that might result in fewer crazy
cacheline ping-pongs overall. But that feels like exactly the wrong
kind of workaround.

I'd much rather re-instate some "if kswapd is just spinning on CPU
time and not actually improving IO parallelism, kswapd should just get
the hell out" logic.

Adding Michal Hocko to the participant list too, I think he's one of
the gang in this area. Who else should be made aware of this thread?
Minchan? Vladimir?

[ I'm assuming the new people can look up this thread on lkml. Note to
new people: the subject line (and about 75% of the posts) are about an
unrelated AIM7 regression, but there's this sub-thread about nasty
lock contention on mapping->tree_lock within that bigger context ]

              Linus

On Tue, Aug 16, 2016 at 8:05 AM, Mel Gorman <mgorman@techsingularity.net>=
 wrote:
>
> However, historically there have been multiple indirect throttling mechan=
ism
> that were branded as congestion control but basically said "I don't know
> what's going on so it's nap time". Many of these have been removed over
> time and the last major one was ede37713737 ("mm: throttle on IO only when
> there are too many dirty and writeback pages").
>
> Before that commit, a process that entered direct reclaim and failed to m=
ake
> progress would sleep before retrying. It's possible that sleep was enough
> to reduce contention by temporarily stalling the writer and letting recla=
im
> make progress. After that commit, it may only do a cond_resched() check
> and go back to allocating/reclaiming as quickly as possible. This active
> writer may be enough to increase contention. If so, it also means it
> stops kswapd making forward progress, leading to more direct reclaim and
> more contention.
>
> It's not a perfect theory and assumes;
>
> 1. The writer is direct reclaiming
> 2. The writer was previously failing to __remove_mapping
> 3. The writer calling congestion_wait due to __remove_mapping failing
>    was enough to allow kswapd or writeback to make enough progress to
>    avoid contention
> 4. The writer staying awake allocating and dirtying pages is keeping all
>    the kswapd instances awake and writeback continually active and
>    increasing the contention overall.
>
> If it was possible to trigger this problem in 4.7 then it would also be
> worth checking 4.6. If 4.6 is immune, check that before and after commit
> ede37713737.
>
> --
> Mel Gorman
> SUSE Labs

--===============1915708180320757124==--


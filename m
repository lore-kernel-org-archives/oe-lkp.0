Content-Type: multipart/mixed; boundary="===============8127062389161767723=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 21:27:08 +0200
Message-ID: <20220510192708.GQ76023@worktop.programming.kicks-ass.net>
In-Reply-To: <CAHk-=wjguW5nxjagV99GHvc_-E_7mSg+LMvGtFjJ9LUSx4Skig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8127062389161767723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 11:05:01AM -0700, Linus Torvalds wrote:

> I think from a pure lock standpoint, it's the right thing to do (no
> unnecessary bouncing, with the lock releaser doing just one write, and
> the head waiter spinning on it is doing the right thing).
> =

> But I think this is an example of where you end up having that
> spinning on the lock possibly then being a disturbance on the other
> fields around the lock.
> =

> I wonder if Waiman / PeterZ / Will have any comments on that. Maybe
> that "spin on the lock itself" is just fundamentally the only correct
> thing, but since my initial reaction was "no, we're spinning on the
> mcs node", maybe that would be _possible_?
> =

> We do have a lot of those spinlocks embedded in other data structures
> cases. And if "somebody else is waiting for the lock" contends badly
> with "the lock holder is doing a lot of writes close to the lock",
> then that's not great.

The immediate problem is that we don't always have a node. Notably we
only do the whole MCS queueing thing when there's more than 1 contender.

Always doing the MCS thing had a hefty performance penalty vs the
simpler spinlock implementations for the uncontended and light contended
lock cases (by far the most common scenario) due to the extra cache-miss
of getting an MCS node.

--===============8127062389161767723==--


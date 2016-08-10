Content-Type: multipart/mixed; boundary="===============1393313800271915860=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 16:51:05 -0700
Message-ID: <CA+55aFyR3DxeQimeU+j4gEXku0WJhEuDZPr7PNSDRUQHTaTAXA@mail.gmail.com>
In-Reply-To: <20160810230840.GS16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1393313800271915860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 4:08 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> That, to me, says there's a change in lock contention behaviour in
> the workload (which we know aim7 is good at exposing). i.e. the
> iomap change shifted contention from a sleeping lock to a spinning
> lock, or maybe we now trigger optimistic spinning behaviour on a
> lock we previously didn't spin on at all.

Hmm. Possibly. I reacted to the lower cpu load number, but yeah, I
could easily imagine some locking primitive difference too.

> We really need instruction level perf profiles to understand
> this - I don't have a machine with this many cpu cores available
> locally, so I'm not sure I'm going to be able to make any progress
> tracking it down in the short term. Maybe the lkp team has more
> in-depth cpu usage profiles they can share?

Yeah, I've occasionally wanted to see some kind of "top-25 kernel
functions in the profile" thing. That said, when the load isn't all
that familiar, the profiles usually are not all that easy to make
sense of either. But comparing the before and after state might give
us clues.

Fengguang?

           Linus

--===============1393313800271915860==--


Content-Type: multipart/mixed; boundary="===============2908339411034328363=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 21:23:21 -0700
Message-ID: <alpine.LSU.2.11.1706212050330.19676@eggly.anvils>
In-Reply-To: <20170621193338.GA29222@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2908339411034328363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2017, Oleg Nesterov wrote:
> On 06/21, Linus Torvalds wrote:
> >
> > Hugh, Michal - I also merged Helge's drop-up cleanup, is there
> > anything I've missed? I think Oleg had something, but I can't recall
> > right now, and I might just have missed it.
> =

> Well, I meant, perhaps we need a bit more changes to ensure that a new
> GROWSDOWN vma can't come without a gap below. But this is really minor,
> we can do this later even if I am right.

I'm mortified.  At last I understand you, and see that you spelt it out
perfectly clearly in your "unmapped_gap" mail earlier in another thread,
when I was in a rush to prioritize what bugs needed looking at first,
and brusquely persuaded you to say that this is only a minor defect.

Well, yes, it's not a new vulnerability and it's not a new regression,
and the users of MAP_GROWSDOWN are few and far between, and often the
assignment of holes will work out just fine; but it's an embarrassing
oversight on my part, that everything was geared to inflating the
size of the existing VM_GROWS vmas, completely forgetting to inflate
the size of the area to be added.

Without reading you thoroughly (and all the fault mine not yours),
I had thought you were referring to the way that a MAP_GROWSDOWN
area may be assigned a place in which the stack_guard_gap would
immediately prevent it from growing down afterwards (and I'm not
sure what to do about that).  But your point is that it may be
assigned a place in which there is not even a stack_guard_gap
below it.  (And so the bug that trinity found would not even
depend upon MAP_FIXED.)

I'll go back to read you again and think on the best way to
correct that, I hope it won't need lots of plumbing through
different levels.

Hugh

--===============2908339411034328363==--


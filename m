Content-Type: multipart/mixed; boundary="===============7766128255377144831=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 16:23:04 -0700
Message-ID: <CA+55aFyj6jidaFyCg3wXAMJJQJ1M1F_UmxzbJd5JPEwb2WfX5g@mail.gmail.com>
In-Reply-To: <20160816220250.GI16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7766128255377144831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 3:02 PM, Dave Chinner <david@fromorbit.com> wrote:
>>
>> What does your profile show for when you actually dig into
>> __remove_mapping() itself?, Looking at your flat profile, I'm assuming
>> you get
>
> -   22.26%     0.93%  [kernel]          [k] __remove_mapping
>    - 3.86% __remove_mapping
>       - 18.35% _raw_spin_lock_irqsave
>            __pv_queued_spin_lock_slowpath
>         1.32% __delete_from_page_cache
>       - 0.92% _raw_spin_unlock_irqrestore
>            __raw_callee_save___pv_queued_spin_unlock

Ok, that's all very consistent with my profiles, except - obviously -
for the crazy spinlock thing.

One difference is that your unlock has that PV unlock thing - on raw
hardware it's just a single store. But I don't think I saw the
unlock_slowpath in there.

There's nothing really expensive going on there that I can tell.

> And the instruction level profile:

Yup. The bulk is in the cmpxchg and a cache miss (it just shows up in
the instruction after it: you can use "cycles:pp" to get perf to
actually try to fix up the blame to the instruction that _causes_
things rather than the instruction following, but in this case it's
all trivial).

> It's the same code AFAICT, except the pv version jumps straight to
> the "queue" case.

Yes. Your profile looks perfectly fine. Most of the profile is rigth
after the 'pause', which you'd expect.

>From a quick look, it seems like only about 2/3rd of the time is
actually spent in the "pause" loop, but the control flow is complex
enough that maybe I didn't follow it right. The native case is
simpler. But since I suspect that it's not so much about the
spinlocked region being too costly, but just about locking too damn
much), that 2/3rds actually makes sense: it's not that it's
necessarily spinning waiting for the lock all that long in any
individual case, it's just that the spin_lock code is called so much.

So I still kind of just blame kswapd, rather than any new expense. It
would be interesting to hear if Mel is right about that kswapd
sleeping change between 4.6 and 4.7..

               Linus

--===============7766128255377144831==--


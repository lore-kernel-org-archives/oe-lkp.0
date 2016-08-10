Content-Type: multipart/mixed; boundary="===============2953112894966067373=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 16:58:17 -0700
Message-ID: <87eg5w18iu.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <CA+55aFyR3DxeQimeU+j4gEXku0WJhEuDZPr7PNSDRUQHTaTAXA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2953112894966067373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Linus,

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Aug 10, 2016 at 4:08 PM, Dave Chinner <david@fromorbit.com> wro=
te:
>>
>> That, to me, says there's a change in lock contention behaviour in
>> the workload (which we know aim7 is good at exposing). i.e. the
>> iomap change shifted contention from a sleeping lock to a spinning
>> lock, or maybe we now trigger optimistic spinning behaviour on a
>> lock we previously didn't spin on at all.
>
> Hmm. Possibly. I reacted to the lower cpu load number, but yeah, I
> could easily imagine some locking primitive difference too.
>
>> We really need instruction level perf profiles to understand
>> this - I don't have a machine with this many cpu cores available
>> locally, so I'm not sure I'm going to be able to make any progress
>> tracking it down in the short term. Maybe the lkp team has more
>> in-depth cpu usage profiles they can share?
>
> Yeah, I've occasionally wanted to see some kind of "top-25 kernel
> functions in the profile" thing. That said, when the load isn't all
> that familiar, the profiles usually are not all that easy to make
> sense of either. But comparing the before and after state might give
> us clues.

I have started perf-profile data collection, will send out the
comparison result soon.

Best Regards,
Huang, Ying

--===============2953112894966067373==--


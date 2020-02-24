Content-Type: multipart/mixed; boundary="===============5091204496985224907=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 09:58:09 +0800
Message-ID: <87lfosd9vy.fsf@yhuang-dev.intel.com>
In-Reply-To: <CAHk-=whi87NNOnNXJ6CvyyedmhnS8dZA2YkQQSajvBArH5XOeA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5091204496985224907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Sun, Feb 23, 2020 at 4:33 PM Feng Tang <feng.tang@intel.com> wrote:
>>
>> From the perf c2c data, and the source code checking, the conflicts
>> only happens for root_user.__count, and root_user.sigpending, as
>> all running tasks are accessing this global data for get/put and
>> other operations.
>
> That's odd.
>
> Why? Because those two would be guaranteed to be in the same cacheline
> _after_ you've aligned that user_struct.
>
> So if it were a false sharing issue between those two, it would
> actually get _worse_ with alignment. Those two fields are basically
> next to each other.
>
> But maybe it was straddling a cacheline before, and it caused two
> cache accesses each time?
>
> I find this as confusing as you do.
>
> If it's sigpending vs the __refcount, then we almost always change
> them together. sigpending gets incremented by __sigqueue_alloc() -
> which also does a "get_uid()", and then we decrement it in
> __sigqueue_free() - which also does a "free_uid().
>

One way to verify this is to change the layout of user_struct (or
root_user) to make __count and sigpending fields to be in 2 separate
cache lines explicitly.

Best Regards,
Huang, Ying
--===============5091204496985224907==--


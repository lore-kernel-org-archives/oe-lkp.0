Content-Type: multipart/mixed; boundary="===============3028829114019600112=="
MIME-Version: 1.0
From: Sandeep Patil <sspatil@android.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3a34b13a88: hackbench.throughput -12.6% regression
Date: Wed, 11 Aug 2021 15:46:15 +0000
Message-ID: <f3c614bd-a8a4-55f8-98c5-bfa3065e24b1@android.com>
In-Reply-To: <CAHk-=whr-zgf41B0BPsWnL-WWqhdk71rKffhV0fzdCuem3=SCQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3028829114019600112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/2/21 5:06 PM, Linus Torvalds wrote:
> On Sun, Aug 1, 2021 at 7:31 PM kernel test robot <oliver.sang@intel.com=
> wrote:
>>
>> FYI, we noticed a -12.6% regression of hackbench.throughput due to commi=
t:
> =

> I had already forgotten how sensitive hackbench is to pipe wakeups.
> =

> I think it's all good for stable, and we can live with this -
> particularly since I'm not sure how much hackbench really matters.
> =

> But it might be one of those things where it is a good idea to make
> the crazy epoll case explicitly special.
> =

> Sandeep, does something like the attached patch (written to be on top
> of the existing one) work for you?
> =

> It's not a great patch - I'd like to catch _just_ the broken EPOLLET
> case, but this patch triggers on any select/poll usage - but it might
> be a good idea to do it this way simply because it now separates out
> the "ok, now we need to do stupid things" logic, so that we *could*
> make that "stupid things" test tighter some day.
> =

> And I think it's actually better to make sure that the unnecessary
> extra wakeup be the _last_ one a write() system call does, not the
> first one. So this may be the way to go for that reason too.

So the patch works for Android apps that I could test like
the last one did.

Also, the way that library was using pipes, I think first/last write
doesn't matter since the kernel will only see one small write afaict.
So, if this change helps with performance, it LGTM.

I can make sure its picked up for Android if you decide to merge in
your tree and report if something breaks happens again (I don't expect
anything)

> =

> This all probably doesn't matter one whit, but hey, I love how the
> kernel test robot gives us heads-up about performance anomalies, so I
> try to take them seriously when they aren't totally strange (which
> happens sometimes: some of the benchmarks end up having subtle cache
> placement effects)
> =


Thanks for sending this and sorry for the delay again.

- ssp


--===============3028829114019600112==--


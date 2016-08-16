Content-Type: multipart/mixed; boundary="===============1524670144010122437=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 17:45:17 -0700
Message-ID: <CA+55aFyiAmCPnwp-g3yF5b6pJ0-9i51wsoL+wMCLLd25JoQBKw@mail.gmail.com>
In-Reply-To: <20160816001721.GC19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1524670144010122437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 5:17 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> Read the code, Linus?

I am. It's how I came up with my current pet theory.

But I don't actually have enough sane numbers to make it much more
than a cute pet theory. It *might* explain why you see tons of kswap
time and bad lock contention where it didn't use to exist, but ..

I can't recreate the problem, and your old profiles were bad enough
that they aren't really worth looking at.

> Except they *aren't broken*. They are simply *less accurate* than
> they could be.

They are so much less accurate that quite frankly, there's no point in
looking at them outside of "there is contention on the lock".

And considering that the numbers didn't even change when you had
spinlock debugging on, it's not the lock itself that causes this, I'm
pretty sure.

Because when you have normal contention due to the *locking* itself
being the problem, it tends to absolutely _explode_ with the debugging
spinlocks, because the lock itself becomes much more expensive.
Usually super-linearly.

But that wasn't the case here. The numbers stayed constant.

So yeah, I started looking at bigger behavioral issues, which is why I
zeroed in on that zone-vs-node change. But it might be a completely
broken theory. For example, if you still have the contention when
running plain 4.7, that theory was clearly complete BS.

And this is where "less accurate" means that they are almost entirely usele=
ss.

More detail needed. It might not be in the profiles themselves, of
course. There might be other much more informative sources if you can
come up with anything...

               Linus

--===============1524670144010122437==--


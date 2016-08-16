Content-Type: multipart/mixed; boundary="===============0710504734441102897=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:17:21 +1000
Message-ID: <20160816001721.GC19025@dastard>
In-Reply-To: <CA+55aFyy1Q95mk48rnoDAPs00s5OL+OOuqJBBwRy-M43H=jDYw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0710504734441102897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:01:00PM -0700, Linus Torvalds wrote:
> On Mon, Aug 15, 2016 at 3:22 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >
> > Right, but that does not make the profile data useless,
> =

> Yes it does. Because it basically hides everything that happens inside
> the lock, which is what causes the contention in the first place.

Read the code, Linus?

> So stop making inane and stupid arguments, Dave.

We know what happens inside the lock, and we know exactly how much
it is supposed to cost. And it isn't anywhere near as much as the
profiles indicate the function that contains the lock is costing.

Occam's Razor leads to only one conclusion, like it or not....

> Your profiles are shit. Deal with it, or accept that nobody is ever
> going to bother working on them because your profiles don't give
> useful information.
> =

> I see that you actually fixed your profiles, but quite frankly, the
> amount of pure unadulterated crap you posted in this email is worth
> reacting negatively to.

I'm happy to be told that I'm wrong *when I'm wrong*, but you always
say "read the code to understand a problem" rather than depending on
potentially unreliable tools and debug information that is gathered.

Yet when I do that using partial profile information, your reaction
is to tell me I am "full of shit" because my information isn't 100%
reliable? Really, Linus?

> You generally make so much sense that it's shocking to see you then
> make these crazy excuses for your completely broken profiles.

Except they *aren't broken*. They are simply *less accurate* than
they could be. That does not invalidate the profile nor does it mean
that the insight it gives us into the functioning of the code is
wrong.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============0710504734441102897==--


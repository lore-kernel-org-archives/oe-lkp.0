Content-Type: multipart/mixed; boundary="===============0862406069790271852=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 14:48:01 +0900
Message-ID: <20171010054801.GD3323@X58A-UD3R>
In-Reply-To: <CA+55aFz2dfH69tUX4GBWmU14=uMseLd_21dAvjohOtJYnfoe7A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0862406069790271852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 09:57:02AM -0700, Linus Torvalds wrote:
> On Tue, Oct 3, 2017 at 9:54 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Can we consider just reverting the crossrelease thing?
> >
> > The apparent stack corruption really worries me [...]
> =

> Side note: I also think the thing is just broken.
> =

> Any actual cross-releaser should be way more annotated than just "set
> cross to 1" in the lockdep map.
> =

> The place where the release is done should simply be special.
> =

> Because we should *not* encourage the whole "acquire by one context,
> release by another" as being something normal and "just set the flag
> to let lockdep know".

Could you explain it more? Please let me apply what you point out. Now,
I don't understand your intention.

> So that commit is apparently buggy, but I think it might be more
> fundamentally the wrong model too.

It would be appriciated if you let me know what is buggy wrt
crossrelease and the model, then I will do my best to fix it.

But I believe the model crossrelease uses is what lockdep should have
adopted before.

Anyway, I might be wrong. It would be appriciated if you tell me why you
think so.

Thank you.

--===============0862406069790271852==--


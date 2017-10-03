Content-Type: multipart/mixed; boundary="===============7848068983867630119=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 09:57:02 -0700
Message-ID: <CA+55aFz2dfH69tUX4GBWmU14=uMseLd_21dAvjohOtJYnfoe7A@mail.gmail.com>
In-Reply-To: <CA+55aFxa_1pCMt-GQmBZUzRbc8_UY9sacmEaCqkDM1_=sq8y_A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7848068983867630119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2017 at 9:54 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Can we consider just reverting the crossrelease thing?
>
> The apparent stack corruption really worries me [...]

Side note: I also think the thing is just broken.

Any actual cross-releaser should be way more annotated than just "set
cross to 1" in the lockdep map.

The place where the release is done should simply be special.

Because we should *not* encourage the whole "acquire by one context,
release by another" as being something normal and "just set the flag
to let lockdep know".

So that commit is apparently buggy, but I think it might be more
fundamentally the wrong model too.

               Linus

--===============7848068983867630119==--


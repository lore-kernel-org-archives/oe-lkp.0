Content-Type: multipart/mixed; boundary="===============7435389362928614995=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Tue, 25 Jul 2017 17:11:42 -0700
Message-ID: <CA+55aFwZUzAkiv4tkO1r9eoqQcO9uyFnqQbMp=QKRvhCbR-FfQ@mail.gmail.com>
In-Reply-To: <CAGXu5jKxBsJGQHx4Wx24iOBZy5raf0s0iDJ2J+EQOGTrVx9-nw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7435389362928614995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 4:35 PM, Kees Cook <keescook@chromium.org> wrote:
>
> In this case, there isn't a sensible way to continue.

Kees, stop this idiocy already.

These have been FALSE POSITIVES. They haven't actually been bugs in
the code, they have been bugs in the *checking* code.

In two years, when this code is actually trusted, that would be one thing.

But right now, it's a f*cking disgrace that you are in denial about
the fact that it's the *checking* that is broken, not the code, and
are making excuses for shit.

That BUG() is broken. Claiming that there was no sane way to continue
is complete and utter bullshit.

Seriously, this is the kind of utter garbage that drives me bonkers.
Introducing new code that kills a machine, and then not owning the
fact that it was *your* code that was broken, and instead saying "but
but we HAD to kill the machine".

So get rid of the BUG(), and get rid of the excuses.

We *know* this code is likely to find these kinds of "not really a
bug, but the checker code does something we didn't used to do"
situations.

And even *if* it is a bug, right now we're so much better off having
it *reported* even if you don't have a serial console, that it's not
even funny. We want things like abortd (or whatever that thing is
called) gather reports and sending them to vendors. We want people to
be able to just run "dmesg" and get the information. We do *not* want
to possibly have a dead machine that took a BUG in an interrupt, and
as a result nothing works any more.

So instead of killing the machine, the code should damn well *warn*
(and be rate-limited about it too!).  That way we're going to actually
get reports that can improve the code, instead of having people

 (a) with dead machines and no idea why

 (b) nervous about enabling the debug code that can make things so much wor=
se.

Comprende?

None of this "there is no way to continue" bullshit. Because it is
pure and utter SHIT.

                  Linus

--===============7435389362928614995==--


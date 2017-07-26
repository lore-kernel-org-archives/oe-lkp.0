Content-Type: multipart/mixed; boundary="===============5210211872719828325=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Tue, 25 Jul 2017 17:38:11 -0700
Message-ID: <CAGXu5j+=WqBwLu3L8Um=5jfT=KOZX-GP0Nn1A9b8VZrYgiE+8Q@mail.gmail.com>
In-Reply-To: <CA+55aFwZUzAkiv4tkO1r9eoqQcO9uyFnqQbMp=QKRvhCbR-FfQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5210211872719828325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 5:11 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jul 25, 2017 at 4:35 PM, Kees Cook <keescook@chromium.org> wrot=
e:
>>
>> In this case, there isn't a sensible way to continue.
>
> Kees, stop this idiocy already.
>
> These have been FALSE POSITIVES. They haven't actually been bugs in
> the code, they have been bugs in the *checking* code.
>
> In two years, when this code is actually trusted, that would be one thing.

Okay, fair enough. As long as there is a time horizon where this can
operate as an actual runtime protection, I can accept that.

> But right now, it's a f*cking disgrace that you are in denial about
> the fact that it's the *checking* that is broken, not the code, and
> are making excuses for shit.

I'm not in denial about that -- I think we just have very different
perspectives on this. I sent a bunch of patches to fix all the places
where there were false positives being found before this landed; I'm
not making excuses and I'm obviously interested in fixing it.

> So get rid of the BUG(), and get rid of the excuses.

I'll get it fixed up.

> We *know* this code is likely to find these kinds of "not really a
> bug, but the checker code does something we didn't used to do"
> situations.

Yup, agreed. We've already fixed a bunch of these, and while this
checking would catch some actual security vulnerabilities from the
past, I can see your point about its "newness" being too great a risk.

-Kees

-- =

Kees Cook
Pixel Security

--===============5210211872719828325==--


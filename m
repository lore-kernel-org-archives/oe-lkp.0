Content-Type: multipart/mixed; boundary="===============7828156637127385774=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3b844826b6: stress-ng.sigio.ops_per_sec -99.3% regression
Date: Tue, 24 Aug 2021 09:22:25 -0700
Message-ID: <CAHk-=wjEdeNW8bPNhwRCkMu6zLKjE2vQ=WL_6bQtc9YnaKt0bw@mail.gmail.com>
In-Reply-To: <20210824151337.GC27667@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7828156637127385774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 7:56 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> FYI, we noticed a -99.3% regression of stress-ng.sigio.ops_per_sec due to=
 commit:

Well, that's bad.

> commit: 3b844826b6c6 ("pipe: avoid unnecessary EPOLLET wakeups under norm=
al loads")

You fix one benchmark, you break another..

What's a bit odd is that this commit basically reverts commit
3a34b13a88ca ("pipe: make pipe writes always wake up readers") which
did *not* result in any kernel test robot report.

It's not a pure revert, because it adds that 'poll_usage' case (for
EPOLLET), but the stress-ng.sigio test doesn't even use select or poll
(ok, there's a select() call with an empty file descriptor set, which
seems to be just an odd way to spell "usleep()").

So it _looks_ to me like it's a 100% revert in practice for that test.
I strace'd the "stress-ng --sigio" case just to make sure I didn't
miss anything.

But I'm clearly missing something. Can anybody see what I'm missing,
and hit me over the head with the clue-bat?

                      Linus
--===============7828156637127385774==--


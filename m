Content-Type: multipart/mixed; boundary="===============2824404435846516445=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3a34b13a88: hackbench.throughput -12.6% regression
Date: Mon, 02 Aug 2021 10:06:59 -0700
Message-ID: <CAHk-=whr-zgf41B0BPsWnL-WWqhdk71rKffhV0fzdCuem3=SCQ@mail.gmail.com>
In-Reply-To: <20210802024945.GA8372@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2824404435846516445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 1, 2021 at 7:31 PM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed a -12.6% regression of hackbench.throughput due to commit:

I had already forgotten how sensitive hackbench is to pipe wakeups.

I think it's all good for stable, and we can live with this -
particularly since I'm not sure how much hackbench really matters.

But it might be one of those things where it is a good idea to make
the crazy epoll case explicitly special.

Sandeep, does something like the attached patch (written to be on top
of the existing one) work for you?

It's not a great patch - I'd like to catch _just_ the broken EPOLLET
case, but this patch triggers on any select/poll usage - but it might
be a good idea to do it this way simply because it now separates out
the "ok, now we need to do stupid things" logic, so that we *could*
make that "stupid things" test tighter some day.

And I think it's actually better to make sure that the unnecessary
extra wakeup be the _last_ one a write() system call does, not the
first one. So this may be the way to go for that reason too.

This all probably doesn't matter one whit, but hey, I love how the
kernel test robot gives us heads-up about performance anomalies, so I
try to take them seriously when they aren't totally strange (which
happens sometimes: some of the benchmarks end up having subtle cache
placement effects)

                 Linus
--===============2824404435846516445==--


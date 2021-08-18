Content-Type: multipart/mixed; boundary="===============2368639073096824486=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3a34b13a88: hackbench.throughput -12.6% regression
Date: Wed, 18 Aug 2021 11:17:59 -0700
Message-ID: <CAHk-=wjuCQSmpMA8HiGNHx3XVVFwEONQWydH2yrnzoT_ZDksGw@mail.gmail.com>
In-Reply-To: <20210818153155.GL6464@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2368639073096824486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 8:31 AM Mel Gorman <mgorman@techsingularity.net> =
wrote:
>
> I know hackbench is not particularly interesting but it's used often
> enough when comparing kernels and patches that commit 3a34b13a88 will be
> a regression magnet.

Fair enough.

And I like that patch anyway because of how it makes that EPOLLET
behaviour much more explicit, so I just committed it.

               Linus
--===============2368639073096824486==--


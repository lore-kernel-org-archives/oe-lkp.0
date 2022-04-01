Content-Type: multipart/mixed; boundary="===============1205815695889218814=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [NUMA Balancing] e39bb6be9f: will-it-scale.per_thread_ops 64.4% improvement
Date: Fri, 01 Apr 2022 09:35:24 -0700
Message-ID: <CAHk-=wg+mJrTvun6qkdEnkZk9FSyj6vNYU2j7QY-iPn0g_y1nw@mail.gmail.com>
In-Reply-To: <20220401094214.GA8368@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1205815695889218814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2022 at 2:42 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed a 64.4% improvement of will-it-scale.per_thread_ops due t=
o commit:
> e39bb6be9f2b ("NUMA Balancing: add page promotion counter")

That looks odd and unlikely.

That commit only modifies some page counting statistics. Sure, it
could be another cache layout thing, and maybe it's due to the subtle
change in how NUMA_PAGE_MIGRATE gets counted, but it still looks a bit
odd.

               Linus
--===============1205815695889218814==--


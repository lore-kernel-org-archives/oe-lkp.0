Content-Type: multipart/mixed; boundary="===============3399618944118705342=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] mm: fs: invalidate bh_lrus for only cold path
Date: Mon, 20 Sep 2021 16:29:52 -0700
Message-ID: <CAHk-=wh2_yEuAC5=9VWefK+0JD9pAKf8qL-vpSmS7MtLA8SZEA@mail.gmail.com>
In-Reply-To: <20210907212347.1977686-1-minchan@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3399618944118705342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 2:24 PM Minchan Kim <minchan@kernel.org> wrote:
>
> kernel test robot reported the regression of fio.write_iops[1]
> with [2].
>
> Since lru_add_drain is called frequently, invalidate bh_lrus
> there could increase bh_lrus cache miss ratio, which needs
> more IO in the end.
>
> This patch moves the bh_lrus invalidation from the hot path(
> e.g., zap_page_range, pagevec_release) to cold path(i.e.,
> lru_add_drain_all, lru_cache_disable).

Was this confirmed to fix the regression?

I only see the "tested with 5.14" that the regression was still there

   https://lore.kernel.org/lkml/034fc860-d0d0-0c61-09d2-3c41c4f020c6(a)inte=
l.com/

I don't see a confirmation that this patch fixed it.

It looks likely, but if you have the confirmation somewhere, it would
help to link that too.

Or did I miss it?

           Linus
--===============3399618944118705342==--


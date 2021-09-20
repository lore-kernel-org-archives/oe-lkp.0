Content-Type: multipart/mixed; boundary="===============4300929737392459986=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] mm: fs: invalidate bh_lrus for only cold path
Date: Mon, 20 Sep 2021 16:50:16 -0700
Message-ID: <YUkeOB3GfK6KO8KG@google.com>
In-Reply-To: <CAHk-=wh2_yEuAC5=9VWefK+0JD9pAKf8qL-vpSmS7MtLA8SZEA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4300929737392459986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 04:29:52PM -0700, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 2:24 PM Minchan Kim <minchan@kernel.org> wrote:
> >
> > kernel test robot reported the regression of fio.write_iops[1]
> > with [2].
> >
> > Since lru_add_drain is called frequently, invalidate bh_lrus
> > there could increase bh_lrus cache miss ratio, which needs
> > more IO in the end.
> >
> > This patch moves the bh_lrus invalidation from the hot path(
> > e.g., zap_page_range, pagevec_release) to cold path(i.e.,
> > lru_add_drain_all, lru_cache_disable).
> =

> Was this confirmed to fix the regression?
> =

> I only see the "tested with 5.14" that the regression was still there
> =

>    https://lore.kernel.org/lkml/034fc860-d0d0-0c61-09d2-3c41c4f020c6(a)in=
tel.com/
> =

> I don't see a confirmation that this patch fixed it.
> =

> It looks likely, but if you have the confirmation somewhere, it would
> help to link that too.
> =

> Or did I miss it?

I have no idea why I couldn't find the reply from lore.kernel.org/lkml/
The message id was 89e2b66b-c706-c020-bff5-b815dcd5c461(a)intel.com
in the thread(https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-O=
ptiPlex-9020/)

Xing, Zhengjun zhengjun.xing(a)intel.com confirmed =


Quote -
```
Hi Minchan,

...

I test the patch, the regression reduced to -2.9%.
```
Since then, I modified the patch a little more and couldn't find the
message from the public URL. Thus, do we need to confirm it again against
latest kernel?

Xing, could you confirm whether this patch fixes the regression?
--===============4300929737392459986==--


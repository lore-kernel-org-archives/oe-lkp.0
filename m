Content-Type: multipart/mixed; boundary="===============3317072492238875098=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] mm: fs: invalidate bh_lrus for only cold path
Date: Tue, 01 Jun 2021 16:15:40 -0700
Message-ID: <20210601161540.9f449314965bd94c84725481@linux-foundation.org>
In-Reply-To: <20210601145425.1396981-1-minchan@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3317072492238875098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 07:54:25 -0700 Minchan Kim <minchan@kernel.org> wrote:

> kernel test robot reported the regression of fio.write_iops[1]
> with [2].
> =

> Since lru_add_drain is called frequently, invalidate bh_lrus
> there could increase bh_lrus cache miss ratio, which needs
> more IO in the end.
> =

> This patch moves the bh_lrus invalidation from the hot path(
> e.g., zap_page_range, pagevec_release) to cold path(i.e.,
> lru_add_drain_all, lru_cache_disable).

This code is starting to hurt my brain.

What are the locking/context rules for invalidate_bh_lrus_cpu()? =

AFAICT it offers no protection against two CPUs concurrently running
__invalidate_bh_lrus() against the same bh_lru.

So when CONFIG_SMP=3Dy, invalidate_bh_lrus_cpu() must always and only be
run on the cpu which owns the bh_lru.  In which case why does it have
the `cpu' arg?

Your new lru_add_and_bh_lrus_drain() follows these rules by calling
invalidate_bh_lrus_cpu() from a per-cpu worker or when CONFIG_SMP=3Dn.

I think.  It's all as clear as mud and undocumented.  Could you please
take a look at this?  Comment the locking/context rules thoroughly and
check that they are being followed?  Not forgetting cpu hotplug...  See if
there's a way of simplifying/clarifying the code?

The fact that swap.c has those #ifdef CONFIG_SMPs in there is a hint
that we're doing something wrong (or poorly) in there.  Perhaps that's
unavoidable because of all the fancy footwork in __lru_add_drain_all().

--===============3317072492238875098==--


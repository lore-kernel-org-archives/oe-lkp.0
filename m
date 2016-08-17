Content-Type: multipart/mixed; boundary="===============1264752532010870314=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 17 Aug 2016 17:48:26 +0200
Message-ID: <20160817154825.GC20719@dhcp22.suse.cz>
In-Reply-To: <CA+55aFxCSU=Hy7OqRxHoJDx1ruMD3H2qvmy4hdZ0Bjx94dwDug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1264752532010870314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 16-08-16 10:47:36, Linus Torvalds wrote:
> Mel,
>  thanks for taking a look. Your theory sounds more complete than mine,
> and since Dave is able to see the problem with 4.7, it would be nice
> to hear about the 4.6 behavior and commit ede37713737 in particular.
> =

> That one seems more likely to affect contention than the zone/node one
> I found during the merge window anyway, since it actually removes a
> sleep in kswapd during congestion.

Hmm, the patch removes a short sleep from wait_iff_congested for
kworkers but that cannot affect kswapd context. Then it removes
wait_iff_congested from should_reclaim_retry but that is not kswapd path
and the sleep was added in the same merge window so it wasn't in 4.6 so
it shouldn't make any difference as well.

So I am not really sure how it could make any difference.

I will try to catch up with the rest of the email thread but from a
quick glance it just feels like we are doing more more work under the
lock.

-- =

Michal Hocko
SUSE Labs

--===============1264752532010870314==--


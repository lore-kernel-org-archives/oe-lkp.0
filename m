Content-Type: multipart/mixed; boundary="===============3356716855003222307=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Wed, 06 Jul 2022 15:52:41 +0100
Message-ID: <20220706145241.GG27531@techsingularity.net>
In-Reply-To: <YsWacP1k8wMgGfXx@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3356716855003222307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 10:21:36PM +0800, Oliver Sang wrote:
> > I tried reproducing this on a 2-socket machine with Xeon
> > Gold Gold 5218R CPUs. It was necessary to set timeouts in both
> > vm/settings and kselftest/runner.sh to avoid timeouts. Testing with
> > a standard config on my original 5.19-rc3 baseline and the baseline
> > b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3 both passed. I tried your kern=
el
> > config with i915 disabled (would not build) and necessary storage drive=
rs
> > and network drivers enabled (for boot and access). The kernel log shows
> > a bunch of warnings related to USBAN during boot and during some of the
> > tests but otherwise compaction_test completed successfully as well as
> > the other VM tests.
> > =

> > Is this always reproducible?
> =

> not always but high rate.
> we actually also observed other dmesgs stats for both 2bd8eec68f74 and its
> parent

Ok, it's unclear what the "other dmesg stats" are but given that it happens
for the parent. Does 5.19-rc2 (your baseline) have the same messages as
2bd8eec68f74^? Does the kselftests vm suite always pass but sometimes
fails with 2bd8eec68f74?

> but those dmesg.BUG:sleeping_function_called_from_invalid_context_at*
> seem only happen on 2bd8eec68f74 as well as the '-fix' commit.
> =


And roughly how often does it happen? I'm running it in a loop now to
see if I can trigger it locally.

-- =

Mel Gorman
SUSE Labs
--===============3356716855003222307==--


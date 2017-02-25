Content-Type: multipart/mixed; boundary="===============7941405453002207706=="
MIME-Version: 1.0
From: Marc Zyngier <marc.zyngier@arm.com>
To: lkp@lists.01.org
Subject: Re: [Merge branch 'core-debugobjects-for-linus' of git] 575260e3f8: WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrtimer_init
Date: Sat, 25 Feb 2017 11:06:02 +0000
Message-ID: <87r32m4jj9.fsf@on-the-bus.cambridge.arm.com>
In-Reply-To: <20170225015416.vulyx65vr63lvhhj@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7941405453002207706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25 2017 at  1:54:16 am GMT, Fengguang Wu <wfg@linux.intel.com=
> wrote:
> Hi Linus,
>
> On Fri, Feb 24, 2017 at 02:37:04PM -0800, Linus Torvalds wrote:
>>This looks like two -tip trees together show some issue - the timer
>>updates from Thomas triggering a debugobjects check from Ingo, thus
>>fingering my merge as the culprit.
>>
>>Added Thomas/Ingo to the cc, leaving everything quoted for their
>>edification and enjoyment.
>
> The call trace looks similar to the below bug, so CC mac80211
> maintainer and Marc.
>
> The discussed fix patch is for drivers/net/wireless/mac80211_hwsim.c
> and is not mainlined yet due to in a different tree.

I enjoy running jokes as much as the next guy, but this one is starting
to get long in the tooth (I have 4 separate reports of it, and patches
have been proposed at least twice). Can someone please apply the below
patch or anything to the same effect?

Thanks,

	M.

>From 8a2c82e1024caab5155db4cccbfe20b42f80acd1 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Sat, 25 Feb 2017 10:42:36 +0000
Subject: [PATCH] mac80211_hwsim: Do not use undefined clockids

Since 336a9cde10d6 ("hrtimer: Catch invalid clockids again"),
we spit out a warning at runtime when an illegal clockid is used,
catching the offender red handed, and falling back to CLOCK_MONOTONIC.

mac80211_hwsim is trying to use CLOCK_MONOTONIC_RAW, which doesn't
exist in the kernel. Before the above fix, we would have used
clockid 0, which happens to be CLOCK_MONOTONIC. This patch simply
makes this behaviour the expected one.

Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Fixes: 1d940aaab881 ("mac80211_hwsim: use CLOCK_MONOTONIC_RAW")
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/net/wireless/mac80211_hwsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/m=
ac80211_hwsim.c
index 1620a5d2757d..0889fc81ce9e 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -2671,7 +2671,7 @@ static int mac80211_hwsim_new_radio(struct genl_info =
*info,
 =

 	tasklet_hrtimer_init(&data->beacon_timer,
 			     mac80211_hwsim_beacon,
-			     CLOCK_MONOTONIC_RAW, HRTIMER_MODE_ABS);
+			     CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
 =

 	spin_lock_bh(&hwsim_radio_lock);
 	list_add_tail(&data->list, &hwsim_radios);
-- =

2.11.0


-- =

Jazz is not dead, it just smell funny.

--===============7941405453002207706==--


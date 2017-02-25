Content-Type: multipart/mixed; boundary="===============4281881836928180888=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [Merge branch 'core-debugobjects-for-linus' of git] 575260e3f8: WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrtimer_init
Date: Sat, 25 Feb 2017 11:27:37 +0100
Message-ID: <alpine.DEB.2.20.1702251117460.4323@nanos>
In-Reply-To: <CA+55aFyB9eYm+DB_nDONh-T93pBYF1gLoGrDy_qMFMuRfV6-_g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4281881836928180888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Feb 2017, Linus Torvalds wrote:

> This looks like two -tip trees together show some issue - the timer
> updates from Thomas triggering a debugobjects check from Ingo, thus
> fingering my merge as the culprit.

Nah. The bisect is bogus.

> Added Thomas/Ingo to the cc, leaving everything quoted for their
> edification and enjoyment.

This has crept up in next already and I explained it a more than once to
0-day folks, that this is caused by the wireless stuff and now catched by
the sanity check of the clockids for hrtimers which got in via timers/core.

It catches the bogus hrtimer_init(CLOCK_MONOTONIC_RAW) in the wireless
code. =


> > [    6.591473] WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrt=
imer_init+0x11f/0x199
> > [    6.592949] Invalid clockid 4. Using MONOTONIC

    	 	   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^	   =


> > [    6.599748]  hrtimer_init+0x11f/0x199
> > [    6.600372]  ? mac80211_hwsim_get_tsf+0x1d/0x1d
> > [    6.601089]  tasklet_hrtimer_init+0x1b/0x4f
> > [    6.601758]  mac80211_hwsim_new_radio+0x7fe/0x916
> > [    6.602491]  ? set_debug_rodata+0x12/0x12
> > [    6.603149]  init_mac80211_hwsim+0x138/0x29f

I've sent the patch 3 times already. Here it is once more.

Thanks,

	tglx
	=

8<-----------------

Subject: mac80211_hwsim: Replace bogus hrtimer clockid

mac80211_hwsim initializes a hrtimer with clockid
CLOCK_MONOTONIC_RAW. That's not supported.

Use CLOCK_MONOTNIC instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
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


--===============4281881836928180888==--


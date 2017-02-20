Content-Type: multipart/mixed; boundary="===============5122717240717628009=="
MIME-Version: 1.0
From: Marc Zyngier <marc.zyngier@arm.com>
To: lkp@lists.01.org
Subject: Re: [hrtimer] 336a9cde10: WARNING:at_kernel/time/hrtimer.c:#hrtimer_init
Date: Mon, 20 Feb 2017 09:26:53 +0000
Message-ID: <1d697e31-ec4c-4abd-c602-20e022dcb127@arm.com>
In-Reply-To: <20170219210659.GA95441@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5122717240717628009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/02/17 21:06, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 336a9cde10d641e70bac67d90ae91b3190c3edca ("hrtimer: Catch invalid=
 clockids again")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

This is indeed the expected effect: mac80211_hwsim is using an illegal
clockid, and we're letting the world now about it. The obvious
workaround is the following patch:

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

which suppresses the warning and preserves the current behaviour,
but doesn't provide what the author expected (the kernel never
pretended to support CLOCK_MONOTONIC_RAW though).

Thanks,

	M.
-- =

Jazz is not dead. It just smells funny...

--===============5122717240717628009==--


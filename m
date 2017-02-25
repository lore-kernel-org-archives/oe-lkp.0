Content-Type: multipart/mixed; boundary="===============1467835066844384936=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [Merge branch 'core-debugobjects-for-linus' of git] 575260e3f8: WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrtimer_init
Date: Sat, 25 Feb 2017 09:54:16 +0800
Message-ID: <20170225015416.vulyx65vr63lvhhj@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFyB9eYm+DB_nDONh-T93pBYF1gLoGrDy_qMFMuRfV6-_g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1467835066844384936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Feb 24, 2017 at 02:37:04PM -0800, Linus Torvalds wrote:
>This looks like two -tip trees together show some issue - the timer
>updates from Thomas triggering a debugobjects check from Ingo, thus
>fingering my merge as the culprit.
>
>Added Thomas/Ingo to the cc, leaving everything quoted for their
>edification and enjoyment.

The call trace looks similar to the below bug, so CC mac80211
maintainer and Marc.

The discussed fix patch is for drivers/net/wireless/mac80211_hwsim.c
and is not mainlined yet due to in a different tree.

Regards,
Fengguang

----- Forwarded message from Marc Zyngier <marc.zyngier@arm.com> -----

Date: Fri, 17 Feb 2017 10:09:06 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <fengguang.wu=
@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Nowicki <tn(a=
)semihalf.com>, Christoffer Dall
	<christoffer.dall@linaro.org>, Sasha Levin <alexander.levin@verizon.co=
m>, "linux-wireless(a)vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Johannes Berg <johannes.berg@intel.c=
om>
Subject: Re: [linux-stable] 4fc2942b6e kernel BUG at kernel/time/hrtimer.c:=
109!
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Icedove=
/45.6.0

On 17/02/17 09:28, Thomas Gleixner wrote:
> On Fri, 17 Feb 2017, kernel test robot wrote:
>
>> Hi Marc,
>>
>> We find this oops in linux-4.4.y. The gcc-6 compiled mainline kernel is =
fine.

The last bit is worrying, as mainline has the exact same bug. Has it
been tested the same way?

>>
>> commit 4fc2942b6e2de2efc8a9d3784d4b0d3543149613
>>      hrtimer: Catch illegal clockids
>
> And that commit is doing what the subject line says. Catch illegal usage.
>
>> [   38.101342] Call Trace:
>> [   38.101342] Call Trace:
>> [   38.102045]  [<ffffffff8109aee1>] tasklet_hrtimer_init+0x16/0x52
>> [   38.102045]  [<ffffffff8109aee1>] tasklet_hrtimer_init+0x16/0x52
>> [   38.103698]  [<ffffffff81c767c7>] mac80211_hwsim_new_radio+0x766/0x84d
>
> The real bug is in this code:
>
> drivers/net/wireless/mac80211_hwsim.c
>
> mac80211_hwsim_new_radio()
>
>         tasklet_hrtimer_init(&data->beacon_timer,
>                              mac80211_hwsim_beacon,
>                              CLOCK_MONOTONIC_RAW, HRTIMER_MODE_ABS);
>
> CLOCK_MONOTONIC_RAW is not a supported clockid for hrtimers. Sigh.
>
> Fix below.
>
> Thanks,
>
> 	tglx
>
> 8<------------------
>
> diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless=
/mac80211_hwsim.c
> index 0cd95120bc78..da363ec91a1c 100644
> --- a/drivers/net/wireless/mac80211_hwsim.c
> +++ b/drivers/net/wireless/mac80211_hwsim.c
> @@ -2535,9 +2535,8 @@ static int mac80211_hwsim_new_radio(struct genl_inf=
o *info,
>  				    data->debugfs,
>  				    data, &hwsim_simulate_radar);
>
> -	tasklet_hrtimer_init(&data->beacon_timer,
> -			     mac80211_hwsim_beacon,
> -			     CLOCK_MONOTONIC_RAW, HRTIMER_MODE_ABS);
> +	tasklet_hrtimer_init(&data->beacon_timer, mac80211_hwsim_beacon,
> +			     CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
>
>  	spin_lock_bh(&hwsim_radio_lock);
>  	list_add_tail(&data->list, &hwsim_radios);
>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- =

Jazz is not dead. It just smells funny...

----- End forwarded message -----

--===============1467835066844384936==--


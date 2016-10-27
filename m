Content-Type: multipart/mixed; boundary="===============3699065840345300054=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/platform/UV] 71854cb812: will-it-scale.per_thread_ops -2.3% regression
Date: Fri, 28 Oct 2016 00:37:45 +0200
Message-ID: <alpine.DEB.2.20.1610280030460.4913@nanos>
In-Reply-To: <20161027015508.GG21890@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3699065840345300054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Oct 2016, Ye Xiaolong wrote:
> Yes, this is weird, the per_thread_ops change is small and should be run
> to run variation, the actual significant change is will-it-scale.time.use=
r_time
> -27% decrease, but the patch seems not relevant, we can't interpret it. :(
> =

> We've tried to queue the jobs (4 times) for
> 71854cb812ec23bfe5f63d52217e6b9e6cb901f5 and v4.9-rc1 with new kconfig
> (added CONFIG_DEBUG_INFO_REDUCED), and result shows user_time change is
> quite stable.

>         v4.9-rc1 71854cb812ec23bfe5f63d5221
> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \
>    1670068 =C2=B1  0%      -3.8%    1606650 =C2=B1  1%  will-it-scale.per=
_thread_ops
>       9749 =C2=B1  2%   +1328.0%     139222 =C2=B1105%  will-it-scale.tim=
e.involuntary_context_switches

	     	     		  ^^^^^^ This is massive

I have no explanation for this either, but you really should try to figure
out what's going on here.

The only difference between plain rc1 and rc + this patch is the resulting
text size and therefor some other unrelated stuff moving to different
places in memory which has some yet to figure out side effects.

Thanks,

	tglx

--===============3699065840345300054==--


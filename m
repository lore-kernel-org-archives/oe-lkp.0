Content-Type: multipart/mixed; boundary="===============5396484346304901538=="
MIME-Version: 1.0
From: John Stultz <john.stultz@linaro.org>
To: lkp@lists.01.org
Subject: Re: [time] WARNING: CPU: 0 PID: 1 at kernel/time/timekeeping.c:1337 update_wall_time()
Date: Wed, 26 Nov 2014 13:28:11 -0800
Message-ID: <CALAqxLU-AU3M4w1zwdfqZHuOJ6Q6_Qx2LzpiFAG9twdteFuC1Q@mail.gmail.com>
In-Reply-To: <20141126200023.GC22400@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5396484346304901538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2014 at 12:00 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit 6067dc5a8c2b1b57e67eaf1125db1d63c1ed6361
> Author:     pang.xunlei <pang.xunlei@linaro.org>
> AuthorDate: Wed Oct 8 15:03:34 2014 +0800
> Commit:     John Stultz <john.stultz@linaro.org>
> CommitDate: Fri Nov 21 11:59:56 2014 -0800
>
>     time: Avoid possible NTP adjustment mult overflow.
>
>     Ideally, __clocksource_updatefreq_scale, selects the largest shift
>     value possible for a clocksource. This results in the mult memember of
>     struct clocksource being particularly large, although not so large
>     that NTP would adjust the clock to cause it to overflow.
>
>     That said, nothing actually prohibits an overflow from occuring, its
>     just that it "shouldn't" occur.
>
>     So while very unlikely, and so far never observed, the value of
>     (cs->mult+cs->maxadj) may have a chance to reach very near 0xFFFFFFFF,
>     so there is a possibility it may overflow when doing NTP positive
>     adjustment
>
>     See the following detail: When NTP slewes the clock, kernel goes
>     through update_wall_time()->...->timekeeping_apply_adjustment():
>         tk->tkr.mult +=3D mult_adj;
>
>     Since there is no guard against it, its possible tk->tkr.mult may
>     overflow during this operation.
>
>     This patch avoids any possible mult overflow by judging the overflow
>     case before adding mult_adj to mult, also adds the WARNING message
>     when capturing such case.
>
>     Signed-off-by: pang.xunlei <pang.xunlei@linaro.org>
>     [jstultz: Reworded commit message]
>     Signed-off-by: John Stultz <john.stultz@linaro.org>


So you caught this false-positive issue in my tree, unfortunately just
mintes before it was pulled into -tip. :)

I've since submitted a fix which was pulled into -tip just the other
day, but looks like it isn't yet in the current -next.
See:
http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=3Dtimers/=
core&id=3Dcb2aa63469f81426c7406227be70b628b42f7a05

It should go away as soon as that patch lands in -next, but do let me
know if you continue to see this.

thanks
-john

--===============5396484346304901538==--


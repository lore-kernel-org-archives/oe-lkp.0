Content-Type: multipart/mixed; boundary="===============5303783773731033345=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [clockevents] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:281 clockevents_program_event()
Date: Mon, 30 Jun 2014 10:10:08 +0530
Message-ID: <CAKohpomfxodayivDUriZKKgvQ7NnWGAYXc=2tAjMe9x2F8JfkA@mail.gmail.com>
In-Reply-To: <20140629145858.GC9134@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5303783773731033345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29 June 2014 20:28, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://bee.sh.intel.com/git/tchen37/linux.git test
> commit 2f89103f5b85386245b434e8e9f66d25df929e65
> Author:     Viresh Kumar <viresh.kumar@linaro.org>
> AuthorDate: Tue Jun 10 13:52:25 2014 +0530
> Commit:     Viresh Kumar <viresh.kumar@linaro.org>
> CommitDate: Tue Jun 24 10:54:12 2014 +0530
>
>     clockevents: x86: add support for ONESHOT_STOPPED mode
>
>     Clockevent devices can be stopped from core (hrtimers/tick) when they=
 aren't
>     used anymore. This will mostly happen on a idle or tickless cpu. This=
 is done to
>     avoid getting spurious interrupts when core doesn't want to handle th=
em anymore.
>
>     For stopping clockevent devices, core requests drivers to switch to a=
 special
>     optional mode: CLOCK_EVT_MODE_ONESHOT_STOPPED. At this time platforms=
 can also
>     save some power by disabling these devices.
>
>     This patch adds support for handling CLOCK_EVT_MODE_ONESHOT_STOPPED m=
ode for x86
>     drivers.
>
>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Hmm, I have made some changes and pushed stuff again, please see if it
still breaks:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
tick/oneshot-stopped

Thanks.

--===============5303783773731033345==--


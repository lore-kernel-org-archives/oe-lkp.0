Content-Type: multipart/mixed; boundary="===============0796911163418558544=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Tue, 27 Apr 2021 23:09:49 +0200
Message-ID: <87y2d3mo2q.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210427175027.GA945820@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============0796911163418558544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Paul,

On Tue, Apr 27 2021 at 10:50, Paul E. McKenney wrote:
> On Tue, Apr 27, 2021 at 06:37:46AM -0700, Paul E. McKenney wrote:
>> I suppose that I give it (say) 120 seconds instead of the current 60,
>> which might be the right thing to do, but it does feel like papering
>> over a very real initramfs problem.  Alternatively, I could provide a
>> boot parameter allowing those with slow systems to adjust as needed.
>
> OK, it turns out that there are systems for which boot times in excess
> of one minute are expected behavior.  They are a bit rare, though.
> So what I will do is keep the 60-second default, add a boot parameter,
> and also add a comment by the warning pointing out the boot parameter.

Oh, no. This starts to become yet another duct tape horror show.

I'm not at all against a more robust and resilent watchdog mechanism,
but having a dozen knobs to tune and heuristics which are doomed to fail
is not a solution at all.

Thanks,

        tglx
--===============0796911163418558544==--


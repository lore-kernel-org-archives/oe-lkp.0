Content-Type: multipart/mixed; boundary="===============8089983698362879883=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Fri, 23 Apr 2021 21:14:49 +0200
Message-ID: <87tunwvmmu.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210422142454.GD975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============8089983698362879883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22 2021 at 07:24, Paul E. McKenney wrote:
> On Thu, Apr 22, 2021 at 03:41:26PM +0800, Feng Tang wrote:
> So what are our options?
>
> 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
>
> 2.	#1, but add tsc-early into the watchdog list and set
> 	CLOCK_SOURCE_MUST_VERIFY once it is better calibrated.
>
> 3.	Add a field to struct clocksource that, if non-zero, gives
> 	the maximum drift in nanoseconds per half second (AKA
> 	WATCHDOG_INTERVAL).  If zero, the WATCHDOG_MAX_SKEW value
> 	is used.  Set this to (say) 150,000ns for tsc-early.
>
> 4.	As noted earlier, increase WATCHDOG_MAX_SKEW to 150 microseconds,
> 	which again is not a good approach given the real-world needs
> 	of real-world applications.
>
> 5.	Your ideas here.

#3 or add a flag to the clocksource which says 'frequency is guesswork' and
increase the threshold based on that.

If that flag is still set max_drift is !=3D 0 after 20 seconds yell.

Thanks,

        tglx


--===============8089983698362879883==--


Content-Type: multipart/mixed; boundary="===============4328375503672264556=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Wed, 28 Apr 2021 12:14:49 +0200
Message-ID: <87czuen2au.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210428014819.GA965980@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============4328375503672264556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27 2021 at 18:48, Paul E. McKenney wrote:
> On Tue, Apr 27, 2021 at 11:09:49PM +0200, Thomas Gleixner wrote:
>> Paul,
>> =

>> On Tue, Apr 27 2021 at 10:50, Paul E. McKenney wrote:
>> > On Tue, Apr 27, 2021 at 06:37:46AM -0700, Paul E. McKenney wrote:
>> >> I suppose that I give it (say) 120 seconds instead of the current 60,
>> >> which might be the right thing to do, but it does feel like papering
>> >> over a very real initramfs problem.  Alternatively, I could provide a
>> >> boot parameter allowing those with slow systems to adjust as needed.
>> >
>> > OK, it turns out that there are systems for which boot times in excess
>> > of one minute are expected behavior.  They are a bit rare, though.
>> > So what I will do is keep the 60-second default, add a boot parameter,
>> > and also add a comment by the warning pointing out the boot parameter.
>> =

>> Oh, no. This starts to become yet another duct tape horror show.
>> =

>> I'm not at all against a more robust and resilent watchdog mechanism,
>> but having a dozen knobs to tune and heuristics which are doomed to fail
>> is not a solution at all.
>
> One problem is that I did the .max_drift patch backwards.  I tightened
> the skew requirements on all clocks except those specially marked, and
> I should have done the reverse.  With that change, all of the clocks
> except for clocksource_tsc would work (or as the case might be, fail to
> work) in exactly the same way that they do today, but still rejecting
> false-positive skew events due to NMIs, SMIs, vCPU preemption, and so on.
>
> Then patch v10 7/7 can go away completely, and patch 6/7 becomes much
> smaller (and gets renamed), for example, as shown below.
>
> Does that help?

No. Because the problem is on both ends. We have TSC early which has
inaccurate frequency and we have watchdogs which are inaccurate,
i.e. refined jiffies.

So the threshold has to take both into account.

Thanks,

        tglx
--===============4328375503672264556==--


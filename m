Content-Type: multipart/mixed; boundary="===============3095489892167300818=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Thu, 29 Apr 2021 19:30:20 +0200
Message-ID: <87lf91f177.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210429142641.GU975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3095489892167300818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Paul,

On Thu, Apr 29 2021 at 07:26, Paul E. McKenney wrote:
> On Thu, Apr 29, 2021 at 10:27:09AM +0200, Thomas Gleixner wrote:
>> > Or are you saying that the checks should be in the host OS rather than
>> > in the guests?
>> =

>> Yes. That's where it belongs. The host has to make sure that TSC is usab=
le
>> otherwise it should tell the guest not to use it. Anything else is
>> wishful thinking and never reliable.
>
> Thank you for the confirmation.  I will look into this.

So the guest might need at least some basic sanity checking unless we
declare that hypervisors are always working correctly :)

Which is admittedly more likely than making the same assumption about
BIOS and hardware.

>> > In addition, breakage due to age and environmentals is possible, and if
>> > you have enough hardware, probable.  In which case it would be good to
>> > get a notification so that the system in question can be dealt with.
>> =

>> Are you trying to find a problem for a solution again?
>
> We really do see this thing trigger. > I am trying to get rid of one
> class of false positives that might be afflicting us.  Along the way,
> I am thinking aloud about what might be the cause of any remaining
> skew reports that might trigger in the future.

Fair enough. Admittedly this has at least entertainment value :)

>> Well, you might then also build safety nets for interrupts, exceptions
>> and if you go fully paranoid for every single CPU instruction. :)
>
> Fair, and I doubt that looking at failure data across a large fleet of
> systems has done anything to reduce my level of paranoia.  ;-)

You should have known better than opening Pandoras box.

>> Sure. If you have a seperate module then you can add module params to it
>> obviously. But you don't need any of the muck in the actual watchdog
>> code because the watchdog::read() function in that module will simply
>> handle the delay injection. Hmm?
>
> OK, first let me make sure I understand what you are suggesting.
>
> The idea is to leave the watchdog code in kernel/time/clocksource.c,
> but to move the fault injection into kernel/time/clocksourcefault.c or
> some such.  In this new file, new clocksource structures are created that
> use some existing timebase/clocksource under the covers.  These then
> inject delays based on module parameters (one senstive to CPU number,
> the other unconditional).  They register these clocksources using the
> normal interfaces, and verify that they are eventually marked unstable
> when the fault-injection parameters warrant it.  This is combined with
> the usual checking of the console log.
>
> Or am I missing your point?

That's what I meant.

Thanks,

        tglx
--===============3095489892167300818==--


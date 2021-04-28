Content-Type: multipart/mixed; boundary="===============3594322243874829317=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Wed, 28 Apr 2021 15:34:52 +0200
Message-ID: <87a6pimt1f.ffs@nanos.tec.linutronix.de>
In-Reply-To: <87y2d3mo2q.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3594322243874829317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Paul,

On Tue, Apr 27 2021 at 23:09, Thomas Gleixner wrote:
> On Tue, Apr 27 2021 at 10:50, Paul E. McKenney wrote:
>> OK, it turns out that there are systems for which boot times in excess
>> of one minute are expected behavior.  They are a bit rare, though.
>> So what I will do is keep the 60-second default, add a boot parameter,
>> and also add a comment by the warning pointing out the boot parameter.
>
> Oh, no. This starts to become yet another duct tape horror show.
>
> I'm not at all against a more robust and resilent watchdog mechanism,
> but having a dozen knobs to tune and heuristics which are doomed to fail
> is not a solution at all.

That said, let's take a step back and look at the trainwreck from a
different POV.

Let's start with the easy part: Virtualization

 While I'm still convinced that virt creates more problems than it
 solves, in this particular case, the virt solution is actually
 halfways trivial.

 1) If the host does not trust the TSC then it clearly wants the guest
    to use KVM clock and not TSC. KVM clock is still utilizing TSC, but
    it's a host controlled and assisted mechanism.

 2) If the host has clear indications that TSC can be trusted, then it
    can tell the guest that TSC is trustworthy. A synthesized CPU
    feature bit is the obvious solution for this.

    That solves several virt problems at once:

     - The watchdog issue

     - The fact that TSC synchronization checks between two vCPUs
       cannot ever work reliably.

Now for the bare metal case. We have to distinguish the following
scenarios:

 1) CPU does not advertise X86_FEATURE_CONSTANT_TSC

    That's a lost case and only relevant for really old hardware.

 2) CPU does advertise X86_FEATURE_CONSTANT_TSC, but does not
    have X86_FEATURE_NONSTOP_TSC

    Mostly a lost case as well unless you disable the C-states in which
    TSC stops working.

 3) CPU does advertise X86_FEATURE_CONSTANT_TSC and X86_FEATURE_NONSTOP_TSC

    That's the point where usable starts, which is around 2007/2008

 4) CPU has X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC and
    TSC_ADJUST

    That's anything Intel starting from Haswell - not sure about the
    ATOM parts though.

    Non-Intel CPUs lack this completely.

 5) CPU has X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC and
    TSC_ADJUST and the not yet existing feature TSC_LOCKDOWN

    We're asking for this for at least 15 years now, but we also had to
    wait 10+ years to get a halfways usable TSC, so why am I
    complaining?

So we really care about #3 and #4.

#4 is the easy case because we can check MSR_TSC_ADJUST to figure out
   whether something has written to MSR_TSC or MSR_TSC_ADJUST and undo
   the damage in a sane way.

   That's currently only done when a CPU goes idle, but there are
   options to do that differently (timer, TIF flag ...)

   This allows to disable the clocksource watchdog completely and based
   on Fengs work we are going to do so sooner than later.


The problematic case is #3 because that affects any Non-Intel CPUs
and the pre Haswell Intel ones.

The approach we have taken so far is the clocksource watchdog in the
form in which it exists today with the known limitations:

  a) Broken watchdog clocksource. Not that I care much, because then
     all bets are off.

     This includes the jiffies based watchdog which is the worst bandaid
     which we have, though that can be made 'work' by some definition of
     work.

  b) Long delays which prevent the watchdog from running
     which in the worst case let the watchdog wrap around.

     For ACPI_PMTIMER that's ~4.69 seconds and for HPET ~300 seconds.

     Anything which keeps the watchdog timer from running for that long
     is broken and trying to fix that at the watchdog level is putting
     the cart before the horse.

     Ignore virt here. See above.

  c) vCPUs scheduled out between the watchdog and the TSC read

     Cannot be mitigated reliably under all circumstances. See the virt
     section above.

  d) Long lasting NMI/SMI's between watchdog and TSC read

     Can be mitigated with reread/retry as you demonstrated.

  e) A too large threshold, which if reduced causes other problems as
     you figured out already.

Unfortunately there is no other way than using the watchdog mechanism,
simply because we need hardware assistance for detection and a reliable
way to undo the damage, which is what we have with TSC_ADJUST. Of course
the best case would be a mechanism to prevent writes to TSC/TSC_ADJUST
completely after boot.

Now let's look at the cases which cause TSC problems in the real world:

    1) Boot time (or resume time) TSC inconsistency

       That's the major problem today, but that's not a watchdog issue.

       On TSC_ADJUST equipped machines we fix the wreckage up, on others
       we give up. For the latter case we don't need a watchdog :)

    2) Runtime wreckage caused by BIOS/SMM

       That used to be a wide spread problem 10 years ago and today it's
       only a sporadic issue, but it's not eliminated completely which
       is why we have this discussion at all.

As we have no reliable indicator whether a BIOS can be trusted and
history taught us that it can't be trusted, we need to have this
trainwreck until hardware people actually come to senses and fix the
root cause once and forever.

So let's look at the issues a - e above:

   a) Is not fixable though the hillarious refined-jiffies case can
      be handled to some degree. But I really don't care much about
      it because it's a lost case.

   b) Not interesting at all. If that ever happens, then sure the
      TSC will be marked unstable for the wrong reasons, but that's
      the least of the problems in that case.

      And that includes virt because virt should not use the watchdog
      ever.

   c) Not relevant because virt has to solve the problems which virt
      causes at the virt level and not here.

   d) The reread/retry mechanism is sensible.

      Though all the command line knobs for delay injection are really
      horrible. If at all this can be avoided by having a special
      watchdog clocksource module which registers a 'preferred' watchdog
      clocksource and hides all the magic outside of the actual watchdog
      code.

      Neither I'm sure whether this IPI collect data muck is adding much
      value, but shrug.

   e) As I said elsewhere already this is an issue which has two
      components if we want to handle the refined-jiffies case:

      clocksource frequency is not accurate: early-TSC
      watchdog is not accurate: refined-jiffies

      So the threshold wants to be:

         max(cs->uncertainty_margin, wd->uncertainty_margin)

      So the right thing to do here is to set a small and reasonable
      default margin ($N us) in the clock source registration code if
      cs->uncertainty_margin =3D=3D 0 and add the larger margins to
      early-TSC and refined-jiffies.


The only other option to handle this mess is to declare the watchdog
experiment as failed, rip it out completely and emit a fat warning on
boot when a non-trustable TSC is detected:

     HARDWARE-BUG: Untrusted TSC detected. For further information see:
     https://www.kernel.org/doc/html/latest/admin-guide/hw-trainwrecks/tsc.=
html

I can live with that and maybe we should have done that 15 years ago
instead of trying to work around it at the symptom level.

In case we agree on that option, I'm volunteering to write the
documentation.

Thanks,

        tglx
--===============3594322243874829317==--


Content-Type: multipart/mixed; boundary="===============6086113317485985701=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: [BUG] kvm: APIC emulation problem - was Re: [x86/hotplug] ...
Date: Tue, 02 Jul 2019 00:41:40 +0200
Message-ID: <alpine.DEB.2.21.1907012011460.1802@nanos.tec.linutronix.de>
In-Reply-To: <d08d55c5-bb02-f832-4306-9daf234428a8@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6086113317485985701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

after chasing a 0-day test failure for a couple of days, I was finally able
to reproduce the issue.

Background:

   In preparation of supporting IPI shorthands I changed the CPU offline
   code to software disable the local APIC instead of just masking it.
   That's done by clearing the APIC_SPIV_APIC_ENABLED bit in the APIC_SPIV
   register.

Failure:

   When the CPU comes back online the startup code triggers occasionally
   the warning in apic_pending_intr_clear(). That complains that the IRRs
   are not empty.

   The offending vector is the local APIC timer vector who's IRR bit is set
   and stays set.

It took me quite some time to reproduce the issue locally, but now I can
see what happens.

It requires apicv_enabled=3D0, i.e. full apic emulation. With apicv_enabled=
=3D1
(and hardware support) it behaves correctly.

Here is the series of events:

    Guest CPU

    goes down

      native_cpu_disable()		=


	apic_soft_disable();

    play_dead()

    ....

    startup()

      if (apic_enabled())
        apic_pending_intr_clear()	<- Not taken

     enable APIC

        apic_pending_intr_clear()	<- Triggers warning because IRR is stale

When this happens then the deadline timer or the regular APIC timer -
happens with both, has fired shortly before the APIC is disabled, but the
interrupt was not serviced because the guest CPU was in an interrupt
disabled region at that point.

The state of the timer vector ISR/IRR bits:

    	     	       	      ISR     IRR
before apic_soft_disable()    0	      1
after apic_soft_disable()     0	      1

On startup		      0	      1

Now one would assume that the IRR is cleared after the INIT reset, but this
happens only on CPU0.

Why?

Because our CPU0 hotplug is just for testing to make sure nothing breaks
and goes through an NMI wakeup vehicle because INIT would send it through
the boots-trap code which is not really working if that CPU was not
physically unplugged.

Now looking@a real world APIC the situation in that case is:

    	     	       	      ISR     IRR
before apic_soft_disable()    0	      1
after apic_soft_disable()     0	      1

On startup		      0	      0

Why?

Once the dying CPU reenables interrupts the pending interrupt gets
delivered as a spurious interupt and then the state is clear.

While that CPU0 hotplug test case is surely an esoteric issue, the APIC
emulation is still wrong, Even if the play_dead() code would not enable
interrupts then the pending IRR bit would turn into an ISR .. interrupt
when the APIC is reenabled on startup.

Thanks,

	tglx

 =





	=

     =

    =

  =20

--===============6086113317485985701==--


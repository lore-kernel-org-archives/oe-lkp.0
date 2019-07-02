Content-Type: multipart/mixed; boundary="===============3508413116810149672=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [BUG] kvm: APIC emulation problem - was Re: [x86/hotplug] ...
Date: Tue, 02 Jul 2019 08:40:32 +0200
Message-ID: <alpine.DEB.2.21.1907020837020.1802@nanos.tec.linutronix.de>
In-Reply-To: <CANRm+CyQy+=fzY7jn6Q=q6C4ucHS-Z37rq87sOJT-yO0ECiHFw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3508413116810149672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Wanpeng,

On Tue, 2 Jul 2019, Wanpeng Li wrote:
> On Tue, 2 Jul 2019 at 06:44, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > While that CPU0 hotplug test case is surely an esoteric issue, the APIC
> > emulation is still wrong, Even if the play_dead() code would not enable
> > interrupts then the pending IRR bit would turn into an ISR .. interrupt
> > when the APIC is reenabled on startup.
> =

> >From SDM 10.4.7.2 Local APIC State After It Has Been Software Disabled
> * Pending interrupts in the IRR and ISR registers are held and require
> masking or handling by the CPU.

Correct.
 =

> In your testing, hardware cpu will not respect soft disable APIC when
> IRR has already been set or APICv posted-interrupt is in flight, so we
> can skip soft disable APIC checking when clearing IRR and set ISR,
> continue to respect soft disable APIC when attempting to set IRR.
> Could you try below fix?

> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 05d8934..f857a12 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -2376,7 +2376,7 @@ int kvm_apic_has_interrupt(struct kvm_vcpu *vcpu)
>      struct kvm_lapic *apic =3D vcpu->arch.apic;
>      u32 ppr;
> =

> -    if (!apic_enabled(apic))
> +    if (!kvm_apic_hw_enabled(apic))
>          return -1;
> =

>      __apic_update_ppr(apic, &ppr);

Yes. That fixes it and works as expected. Thanks for the quick
resolution. I surely stared at that function, but was not sure how to fix
it proper.

Tested-by: Thomas Gleixner <tglx@linutronix.de>

Please add a Cc: stable... tag when you post the patch.

Thanks,

	tglx

--===============3508413116810149672==--


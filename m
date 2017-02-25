Content-Type: multipart/mixed; boundary="===============2975013008577106771=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Sat, 25 Feb 2017 10:07:41 +0100
Message-ID: <20170225090741.GA20463@gmail.com>
In-Reply-To: <CA+55aFytXj+TZ_TanbxcY0KgRTrV7Vvr=fWON8tioUGmYHYiNA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2975013008577106771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I'm pretty sure that the thing that triggered this is once more commit
> a9b4f08770b4 ("x86/ioapic: Restore IO-APIC irq_chip retrigger
> callback") which seems to retrigger stale irqs that simply should not
> be retriggered.
> =

> They aren't actually active any more, if they ever were.
> =

> So that commit seems to act like a random CONFIG_DEBUG_SHIRQ. It's
> good for testing, but not good for actual users.

Yeah, so some distros like Fedora already have CONFIG_DEBUG_SHIRQ=3Dy enabl=
ed, but =

part of the problem is that CONFIG_DEBUG_SHIRQ=3Dy has this:

#ifdef CONFIG_DEBUG_SHIRQ_FIXME
        if (!retval && (irqflags & IRQF_SHARED)) {
                /*
                 * It's a shared IRQ -- the driver ought to be prepared for=
 it
                 * to happen immediately, so let's make sure....
                 * We disable the irq to make sure that a 'real' IRQ doesn't
                 * run in parallel with our fake.
                 */
                unsigned long flags;

                disable_irq(irq);
                local_irq_save(flags);

                handler(irq, dev_id);

                local_irq_restore(flags);
                enable_irq(irq);
        }
#endif

Note that the '_FIXME' postfix effectively turns off this particular debug =
check =

...

Thomas and me realized this risk a week ago ago, and tried to resurrect ful=
l =

CONFIG_DEBUG_SHIRQ=3Dy functionality to more reliably trigger these problem=
s:

  https://lkml.org/lkml/2017/2/15/341

... but were forced to revert that fix because it's not working on x86 yet =
(it's =

crashing). We also thought we fixed the problems exposed in drivers, as the =

retrigger changes have been in -tip and -next for some time, but were clear=
ly too =

optimistic about that.

So, should we revert the hw-retrigger change:

  a9b4f08770b4 x86/ioapic: Restore IO-APIC irq_chip retrigger callback

... until we managed to fix CONFIG_DEBUG_SHIRQ=3Dy? If you'd like to revert=
 it =

upstream straight away:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

--===============2975013008577106771==--


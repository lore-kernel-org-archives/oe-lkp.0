Content-Type: multipart/mixed; boundary="===============5273427291354111842=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Sun, 09 Apr 2017 12:12:30 +0200
Message-ID: <20170409101230.GB27363@amd>
In-Reply-To: <20170407151306.GA384@tigerII.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============5273427291354111842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat 2017-04-08 00:13:06, Sergey Senozhatsky wrote:
> On (04/07/17 14:44), Pavel Machek wrote:
> [..]
> > > [..]
> > > > I believe "spend at most 2 seconds in printk(), then print a warning
> > > > and offload" is a solution closer to what we had before.
> > > =

> > > a warning here can be very noisy.
> > =

> > Well, on normally-configured it should be ok. We don't commonly see
> > printk problems... If it is too noisy, perhaps we should increase from
> > 2 seconds, but I don't think it will be problem.
> =

> we are looking at different typical setups :) serial console being 45
> seconds behind logbuf does not surprise me anymore.
> =

> [..]
> > > what we have been thinking about is something like printk-stall detec=
tion.
> > > we probably (there are some if-s) can detect in printk() that offload=
ing
> > > does not work and we must automatically switch to printk_emergency mo=
de.
> > > that, in theory, can relax our dependency on printk_emergency_begin/e=
nd
> > > being in the right place at the right time. need to think more about =
it.
> > =

> > So... I don't really like the begin/end interface. I would rather have
> > printk_emergency(KERN_ ...).
> =

> you mean a single printk_emergency() switches printk to emergency mode
> or printk_emergency(KERN_ ... ) is a single message that must be printed
> in emergency mode?

The latter. Having state is ugly.

> printk() depends on console_trylock(). we can't expect printk_emergency(K=
ERN_ ...)
> to always do more than just log_store().
> =

> the idea behind begin/end interface is that you can do
> =

> 	emergency_begin
> 	printk
> 	pr_cont
> 	pr_cont
> 	pr_cont
> 	printk
> 	dump_stack
> 	emergency_end
> =

> with out the need of rewriting dump_stack() or anything else to use
> printk_emergency(). we, for example, do this in sysrq patch from this
> series.

Well.. I guess it is less work to include emergency_begin/end() but I
also believe result will state-less solution will be cleaner.

> > Second... I don't think "stuck detector" is that helpful. What I
> > usually seen was some rather innocent kernel message followed by
> > hard-lock. That's where "message delayed" is useful..
> =

> a side note,
> that's rather unclear to me how would "message delayed" really help.
> if your system hard-lockup so badly and there are no printk messages
> even from NMI watchdog, then we won't be able to print that message.

We are talking about

   printk("unusual condition");
   do_something_clever(); /* Which unfortunately hard-crashes the machine */

that works with my proposal, but not with yours. Seen it happen many
times before.

									Pavel

-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============5273427291354111842==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsanFDUTRBQ2drUU1PZndhcFhiK3ZKSFlRQ2dzNzlzTnFlN21rQlE3QUtPRjBBWjN3Nm0K
RERFQW4xMGF4K3FBcTNDSnZITVRrUS9yL2tVVnhZU3QKPWNNbnEKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============5273427291354111842==--


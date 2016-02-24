Content-Type: multipart/mixed; boundary="===============8232252958771662041=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 21:50:22 +0900
Message-ID: <20160224125022.GA516@swordfish>
In-Reply-To: <20160224114614.GY3305@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8232252958771662041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (02/24/16 12:46), Petr Mladek wrote:
[..]
> > and you get the NMI watchdog softlockup because you have a whole bunch =
of
> > =

> >    "of_overlay_destroy: Could not find overlay #6"
> >    "### dt-test ### of_unittest_destroy_tracked_overlays: overlay destr=
oy failed for #6"
> > =

> > messages to print. seems that somehitng just pushes them in a loop.
> > there are too many of them:
> =

> This sounds like a reasonable explanation. It seems that
> of_unittest_destroy_tracked_overlays() really ended in an infinite
> loop.
> =

> But I am still curious why the softlookup points to
> =

> [   33.497718] EIP is at vprintk_emit+0x1ea/0x600
> =

> Also there is on the stack
> =

> [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> =

> I would expect that the soft lookup happens in console_unlock()
> called with IRQs disabled. It seems to me that of_unittest_overlay()
> is called with IRQs enabled.

watchdog has two different parts: hrtimer part (via IRQ) checks the
touch_ts and wakeups the updater smpboot kthread; and updater kthread,
that updates touch_ts. to get a lockup you can just keep the preemption
disabled for 20+ seconds, so updater kthread will not update touch_ts.
the next hrtimer irq will detect lockup. and the .config we have is

CONFIG_PREEMPT_NONE=3Dy
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

that can add up to the issue.

(well, at least watchdog was working this way the last time I saw it).


> I want to be sure that the patch in printk() did not introduce
> a deadlock that is visible only under a high printk load.

sure. I did additional intensive tests today, and saw no issues.
schematically, something like this:

	u64 start =3D local_lock() >> 31UL:

	{ preempt_disable(), local_irq_save() }
	while (1) {
		u64 now =3D local_clock() >> 31UL;
		if (now - start > TIMEOUT)
			goto out;
		pr_err(">>>>>\n");
	}
out:
	{ preempt_enable(), local_irq_restore() }


> I guess that the softlookup was not visible before the
> printk patch was applied. I wonder if the patch made something
> worse. It was supposed to improve things but...

I think the softlockup under the given conditions (endless printk and
no preemption) will show up regardless the patches being applied; but
I see you point, of course.

	-ss

--===============8232252958771662041==--


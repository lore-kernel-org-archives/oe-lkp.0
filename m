Content-Type: multipart/mixed; boundary="===============4669120227514720132=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [tty] 0b4f83d510: INFO:task_blocked_for_more_than#seconds
Date: Mon, 10 Sep 2018 14:14:52 +0900
Message-ID: <20180910051452.GA518@jagdpanzerIV>
In-Reply-To: <d5d23bc5-0e11-5cee-6d66-514dfc4fc25b@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4669120227514720132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/07/18 08:39), Jiri Slaby wrote:
> > [  244.944070] =

> > [  244.944070] Showing all locks held in the system:
> > [  244.945558] 1 lock held by khungtaskd/18:
> > [  244.946495]  #0: (____ptrval____) (rcu_read_lock){....}, at: debug_s=
how_all_locks+0x16/0x190
> > [  244.948503] 2 locks held by askfirst/235:
> > [  244.949439]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_l=
disc_ref_wait+0x25/0x50
> > [  244.951762]  #1: (____ptrval____) (&ldata->atomic_read_lock){+.+.}, =
at: n_tty_read+0x13d/0xa00
> =

> Here, it just seems to wait for input from the user.
> =

> > [  244.953799] 1 lock held by validate_data/655:
> > [  244.954814]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_l=
disc_ref_wait+0x25/0x50
> > [  244.956764] 1 lock held by dnsmasq/668:
> > [  244.957649]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_l=
disc_ref_wait+0x25/0x50
> > [  244.959598] 1 lock held by dropbear/734:
> > [  244.967564]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_l=
disc_ref_wait+0x25/0x50
> =

> Hmm, I assume there is another task waiting for write_ldsem and that one
> prevents these readers to proceed. Unfortunately, due to the defunct
> __ptrval__ pointer hashing crap, we do not see who is waiting for what.
> But I am guessing all are the same locks.

Hmm, interesting. Am I getting it right that the test did pass before.
And now we see that sort of/smells like live-lock right after the
introduction of tty_ldisc_lock() to tty_reopen().

> So I think, we are forced to limit the waiting to 5 seconds in reopen in
> the end too (the same as we do for new open in tty_init_dev).

If I got it right, LKP did test the 5*HZ patch

	retval =3D tty_ldisc_lock(tty, 5 * HZ);

At least it's
 In-Reply-To: <20180829022353.23568-3-dima@arista.com>

and
 Message-Id: <20180829022353.23568-3-dima@arista.com>

is the patch which does the 5*HZ lock timeout thing.

	-ss

--===============4669120227514720132==--


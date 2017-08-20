Content-Type: multipart/mixed; boundary="===============8276907289880875152=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: 71acb768f5 ("timers: Fix excessive granularity of new timers .."): watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [ksoftirqd/0:7]
Date: Sun, 20 Aug 2017 09:33:53 -0700
Message-ID: <20170820163353.GK11320@linux.vnet.ibm.com>
In-Reply-To: <20170820203943.1c16a036@roar.ozlabs.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8276907289880875152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 20, 2017 at 08:39:43PM +1000, Nicholas Piggin wrote:
> On Sun, 20 Aug 2017 16:55:11 +0800
> kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Another approach I looked at first was to note
> >     if the base was idle but not yet run or forwarded, however this just
> >     seemed to add more branches and complexity when it seems we can just
> >     cover it with this test.
> =

> [...]
> =

> > [   28.023029] RIP: 0010:can_stat_update+0xe/0x23e
> > [   28.023030] RSP: 0018:ffff880000103d48 EFLAGS: 00000246 ORIG_RAX: ff=
ffffffffffff10
> > [   28.023032] RAX: 0000000000000000 RBX: ffffffff820a60f0 RCX: 0000000=
000000002
> > [   28.023034] RDX: 0000000000000000 RSI: ffffffff81742fc6 RDI: fffffff=
f820a4f00
> > [   28.023035] RBP: ffff880000103d50 R08: ffffffff82048368 R09: fffffff=
f82049560
> > [   28.023036] R10: ffff880000103de8 R11: ffffffff820a60f0 R12: 0000000=
000000100
> > [   28.023037] R13: ffffffff81742fc6 R14: ffffffff820a60f0 R15: fffffff=
f820a4f00
> > [   28.023039] FS:  0000000000000000(0000) GS:ffffffff8202f000(0000) kn=
lGS:0000000000000000
> > [   28.023041] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   28.023042] CR2: 00007f3aeeb41000 CR3: 000000001da89000 CR4: 0000000=
0000406b0
> > [   28.023046] Call Trace:
> > [   28.023051]  ? calc_rate+0x6a/0x6a
> > [   28.023056]  call_timer_fn+0x8c/0x1e3
> > [   28.023059]  expire_timers+0x12c/0x150
> =

> Ah well that answers that question :P Must not try to forward from
> within a timer function it while expire_timers is currently running!
> =

> I'm just re-testing my original approach and will send it out. Sorry
> guys I'm a timer noob, you might want to wait until that one gets some
> reviews...:)

Hey, at least you were willing to dig into it and find a problem!

							Thanx, Paul


--===============8276907289880875152==--


Content-Type: multipart/mixed; boundary="===============6454507730328924925=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Wed, 29 Nov 2017 11:08:19 -0800
Message-ID: <20171129190819.GA18159@linux.vnet.ibm.com>
In-Reply-To: <20171128210810.GA22726@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6454507730328924925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 01:08:10PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 28, 2017 at 12:46:19PM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 28, 2017 at 09:35:54AM -0800, Paul E. McKenney wrote:
> > > On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> > > > On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > > > > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> > > > > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > > > > index db774b0f217e..a3321bb565db 100644
> > > > > --- a/kernel/time/timer.c
> > > > > +++ b/kernel/time/timer.c
> > > > > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed=
 long timeout)
> > > > >  		idx =3D timer_get_idx(&timer.timer);
> > > > >  		idx_now =3D calc_wheel_index(j, base->clk);
> > > > >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > > > > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, =
idx, idx_now);
> > > > > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base=
->next_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now: =
%u\n", __func__, base->clk, j, base->next_expiry, timer.timer.flags, timer.=
timer.expires, idx, idx_now);
> > > > =

> > > > Please print idx and idx_now as hex values. It's simpler to decode =
that way.
> > > =

> > > Here you go!  Starting tests at this end, focusing on TREE01 and TREE=
04.
> > > BTW, TREE04 doesn't do any CPU hotplug, providing a counterexample to
> > > my long-held assumption that this only happened in the presence of CPU
> > > hotplug operations.
> > =

> > And here is output with changes discussed on IRC.  TREE04 managed to
> > have not one but two overlapping RCU CPU stall warnings, one for RCU-bh
> > and the second for RCU-sched.  TREE04 and TREE04.  HZ=3D1000.
> =

> And here is the full patch, in all its lack of aesthetic appeal.

And here is the list of waylaid timers from last night's testing.  The big
pile of them from TREE01 at the end is due to wakeups from kthread_stop(),
I am guessing.  The TREE04 run only had two of them, but they seem reliable
enough that I just might be able to bisect.  I will try that.

Did your setup reproduce the problem?

							Thanx, Paul

------------------------------------------------------------------------

TREE01:

[12447.750662] schedule_timeout: Waylayed timer base->clk: 0x100b909c5 jiff=
ies: 0x100b95c25 base->next_expiry: 0x100b909c5 timer->flags: 0x1400006 tim=
er->expires 0x100b909c4 idx: 5 idx_now: ef base->pending_map 00000000000000=
200000000000000000000000000000000000000080200000000000000000000000100000000=
0000000000000000000000000000000000000000000000000000000
[12839.521300] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100bf5680 base->next_expiry: 0x100b93a00 timer->flags: 0x5fc00006 ti=
mer->expires 0x100bf0404 idx: 17f idx_now: 17f base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000000000000000000000000000000000000000000000000000000
[12849.768036] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100bf7e86 base->next_expiry: 0x100b93a00 timer->flags: 0x5fc00006 ti=
mer->expires 0x100bf2c0b idx: 17f idx_now: 17f base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000000000000000000000000000000000000000000000000000000
[12902.415748] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c04c2e base->next_expiry: 0x100b93a00 timer->flags: 0x5fc00006 ti=
mer->expires 0x100bf5683 idx: 17f idx_now: 141 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000000000000000000000000000000000000000000000000000000
[12912.667890] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c0743a base->next_expiry: 0x100b93a00 timer->flags: 0x5fc00006 ti=
mer->expires 0x100bf7e89 idx: 17f idx_now: 141 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000002000000000000000000000000000000000000000000000000
[12923.529767] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c09ea8 base->next_expiry: 0x100b93a00 timer->flags: 0x50400006 ti=
mer->expires 0x100c04c31 idx: 141 idx_now: 142 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000002000000000000000000000000000000000000000000000000
[12933.785252] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c0c6b8 base->next_expiry: 0x100b93a00 timer->flags: 0x50400006 ti=
mer->expires 0x100c0743d idx: 141 idx_now: 142 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000006000000000000000000000000000000000000000000000000
[12986.430188] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c1945d base->next_expiry: 0x100b93a00 timer->flags: 0x50800006 ti=
mer->expires 0x100c09eab idx: 142 idx_now: 144 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000004000000000000000000000000000000000000000000000000
[12996.683775] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c1bc6a base->next_expiry: 0x100b93a00 timer->flags: 0x50800006 ti=
mer->expires 0x100c0c6bb idx: 142 idx_now: 144 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000004000000000000000000000000000000000000000000000000
[13044.415296] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c276de base->next_expiry: 0x100b93a00 timer->flags: 0x51400006 ti=
mer->expires 0x100c2245e idx: 145 idx_now: 145 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000030000000000000000000000000000000000000000000000000
[13067.862295] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c2d275 base->next_expiry: 0x100b93a00 timer->flags: 0x51800006 ti=
mer->expires 0x100c28046 idx: 146 idx_now: 146 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000070000000000000000000000000000000000000000000000000
[13107.309977] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c36c8c base->next_expiry: 0x100b93a00 timer->flags: 0x51400006 ti=
mer->expires 0x100c276e1 idx: 145 idx_now: 147 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000070000000000000000000000000000000000000000000000000
[13128.447323] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c3bf1d base->next_expiry: 0x100b93a00 timer->flags: 0x51c00006 ti=
mer->expires 0x100c36c8f idx: 147 idx_now: 148 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
000000000d0000000000000000000000000000000000000000000000000
[13130.869610] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c3c894 base->next_expiry: 0x100b93a00 timer->flags: 0x51800006 ti=
mer->expires 0x100c2d27d idx: 146 idx_now: 148 base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000150000000000000000000000000000000000000000000000000
[13191.327334] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c4b4be base->next_expiry: 0x100b93a00 timer->flags: 0x52000006 ti=
mer->expires 0x100c3bf21 idx: 148 idx_now: 14a base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000110000000000000000000000000000000000000000000000000
[13233.069442] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x100c557cc base->next_expiry: 0x100b93a00 timer->flags: 0x52c00006 ti=
mer->expires 0x100c5054a idx: 14b idx_now: 14b base->pending_map 0000000000=
00000000000000000000000000000000000000082080802010000000030040c000000090000=
00000000c10000000000000000000000000000000000000000000000000
[18001.892904] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c03 base->next_expiry: 0x100b93a00 timer->flags: 0x3ec00006 ti=
mer->expires 0x100b97401 idx: fb idx_now: 184 base->pending_map 00000000000=
0000000000000000000000000000000000000082080802000000000030040c0000000100000=
0000000410000000000000001000000000000000000000000000000000
[18001.902273] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c0d base->next_expiry: 0x100b93a00 timer->flags: 0x52800006 ti=
mer->expires 0x100c4dc01 idx: 14a idx_now: 184 base->pending_map 0000000000=
00000000000000000000000000000000000000000080802000000000030040c000000010000=
00000000410000000000000001000000000000000000000000000000000
[18001.911774] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c16 base->next_expiry: 0x100b93a00 timer->flags: 0x47c00006 ti=
mer->expires 0x100b9ec04 idx: 11f idx_now: 184 base->pending_map 0000000000=
00000000000000000000000000000000000000000080802000000000030040c000000010000=
00000000010000000000000001000000000000000000000000000000000
[18001.921158] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c20 base->next_expiry: 0x100b93a00 timer->flags: 0x4c400006 ti=
mer->expires 0x100bb0404 idx: 131 idx_now: 184 base->pending_map 0000000000=
000000000000000000000000000000000000000000808020000000000300400000000010000=
00000000010000000000000001000000000000000000000000000000000
[18001.930462] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c29 base->next_expiry: 0x100b93a00 timer->flags: 0x39c00006 ti=
mer->expires 0x100b94c24 idx: e7 idx_now: 184 base->pending_map 00000000000=
000000000000000000000000000000000000000008080200000000000004000000000100000=
0000000010000000000000001000000000000000000000000000000000
[18001.941092] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c34 base->next_expiry: 0x100b93a00 timer->flags: 0x3bc00006 ti=
mer->expires 0x100b95cf7 idx: ef idx_now: 184 base->pending_map 00000000000=
000000000000000000000000000000000000000008000200000000000004000000000100000=
0000000010000000000000001000000000000000000000000000000000
[18001.952082] schedule_timeout: Waylayed timer base->clk: 0x100b93a00 jiff=
ies: 0x1010e1c3f base->next_expiry: 0x100b93a00 timer->flags: 0x49800006 ti=
mer->expires 0x100ba5484 idx: 126 idx_now: 184 base->pending_map 0000000000=
000000000000000000000000000000000000000000000020000000000000400000000010000=
00000000010000000000000000000000000000000000000000000000000

TREE04:

[   28.300162] schedule_timeout: Waylayed timer base->clk: 0xfffb888e jiffi=
es: 0xfffbdaac base->next_expiry: 0xfffb888e timer->flags: 0x3800007 timer-=
>expires 0xfffb888d idx: e idx_now: ee base->pending_map 000000000000400000=
000000000000000000000000000000000000000000404000000000000000000000000000000=
002000000000000000000000000000000000000000000000000
[   96.507058] schedule_timeout: Waylayed timer base->clk: 0xfffc933f jiffi=
es: 0xfffce51b base->next_expiry: 0xfffc930e timer->flags: 0x800003 timer->=
expires 0xfffc9341 idx: 2 idx_now: f3 base->pending_map 0000000000000005000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
02000000000000000000000000000000000000000000000000


--===============6454507730328924925==--


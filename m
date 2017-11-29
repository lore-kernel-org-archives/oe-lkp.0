Content-Type: multipart/mixed; boundary="===============3156449320039556488=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Wed, 29 Nov 2017 14:07:03 -0800
Message-ID: <20171129220703.GA12908@linux.vnet.ibm.com>
In-Reply-To: <20171129190819.GA18159@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3156449320039556488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2017 at 11:08:19AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 28, 2017 at 01:08:10PM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 28, 2017 at 12:46:19PM -0800, Paul E. McKenney wrote:
> > > On Tue, Nov 28, 2017 at 09:35:54AM -0800, Paul E. McKenney wrote:
> > > > On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> > > > > On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > > > > > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> > > > > > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > > > > > index db774b0f217e..a3321bb565db 100644
> > > > > > --- a/kernel/time/timer.c
> > > > > > +++ b/kernel/time/timer.c
> > > > > > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(sign=
ed long timeout)
> > > > > >  		idx =3D timer_get_idx(&timer.timer);
> > > > > >  		idx_now =3D calc_wheel_index(j, base->clk);
> > > > > >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > > > > > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__=
, idx, idx_now);
> > > > > > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx ba=
se->next_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now=
: %u\n", __func__, base->clk, j, base->next_expiry, timer.timer.flags, time=
r.timer.expires, idx, idx_now);
> > > > > =

> > > > > Please print idx and idx_now as hex values. It's simpler to decod=
e that way.
> > > > =

> > > > Here you go!  Starting tests at this end, focusing on TREE01 and TR=
EE04.
> > > > BTW, TREE04 doesn't do any CPU hotplug, providing a counterexample =
to
> > > > my long-held assumption that this only happened in the presence of =
CPU
> > > > hotplug operations.
> > > =

> > > And here is output with changes discussed on IRC.  TREE04 managed to
> > > have not one but two overlapping RCU CPU stall warnings, one for RCU-=
bh
> > > and the second for RCU-sched.  TREE04 and TREE04.  HZ=3D1000.
> > =

> > And here is the full patch, in all its lack of aesthetic appeal.
> =

> And here is the list of waylaid timers from last night's testing.  The big
> pile of them from TREE01 at the end is due to wakeups from kthread_stop(),
> I am guessing.  The TREE04 run only had two of them, but they seem reliab=
le
> enough that I just might be able to bisect.  I will try that.

And it converged to 5c4991e24c69 ("sched/isolation: Split out new
CONFIG_CPU_ISOLATION=3Dy config from CONFIG_NO_HZ_FULL"), which is a bit
hard to believe.  Please see below for the log.  I will be retesting
some of the allegedly good commits, just in case.

> Did your setup reproduce the problem?

							Thanx, Paul

------------------------------------------------------------------------

# bad: [4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323] Linux 4.15-rc1
# good: [bebc6082da0a9f5d47a1ea2edc099bf671058bd4] Linux 4.14
git bisect start 'v4.15-rc1' 'v4.14'
# bad: [1be2172e96e33bfa22a5c7a651f768ef30ce3984] Merge tag 'modules-for-v4=
.15' of git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux
git bisect bad 1be2172e96e33bfa22a5c7a651f768ef30ce3984
# bad: [2cd83ba5bede2f72cc6c79a19a1bddf576b50e88] Merge tag 'iommu-v4.15-rc=
1' of git://github.com/awilliam/linux-vfio
git bisect bad 2cd83ba5bede2f72cc6c79a19a1bddf576b50e88
# bad: [449fcf3ab0baf3dde9952385e6789f2ca10c3980] Merge tag 'staging-4.15-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad 449fcf3ab0baf3dde9952385e6789f2ca10c3980
# bad: [43ff2f4db9d0f76452b77cfa645f02b471143b24] Merge branch 'x86-platfor=
m-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 43ff2f4db9d0f76452b77cfa645f02b471143b24
# good: [f08d8bcc12de5a153e587027e77de83662eefb8a] Merge tag 'please-pull-g=
ettime_vsyscall_update' of git://git.kernel.org/pub/scm/linux/kernel/git/ae=
gl/linux
git bisect good f08d8bcc12de5a153e587027e77de83662eefb8a
# good: [31486372a1e9a66ec2e9e2903b8792bba7e503e1] Merge branch 'perf-core-=
for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 31486372a1e9a66ec2e9e2903b8792bba7e503e1
# good: [9275b933d409d3a4efa08102ca813557b93fb0b9] resource: Fix resource_s=
ize.cocci warnings
git bisect good 9275b933d409d3a4efa08102ca813557b93fb0b9
# bad: [765cc3a4b224e22bf524fabe40284a524f37cdd0] sched/core: Optimize sche=
d_feat() for !CONFIG_SCHED_DEBUG builds
git bisect bad 765cc3a4b224e22bf524fabe40284a524f37cdd0
# good: [93824900a2e242766f5fe6ae7697e3d7171aa234] sched/fair: Search a tas=
k from the tail of the queue
git bisect good 93824900a2e242766f5fe6ae7697e3d7171aa234
# good: [7863406143d8bbbbda07a61285c5f4c217908dfd] sched/isolation: Move ho=
usekeeping related code to its own file
git bisect good 7863406143d8bbbbda07a61285c5f4c217908dfd
# bad: [de201559df872f83d0c08fb4effe3efd28e6cbc8] sched/isolation: Introduc=
e housekeeping flags
git bisect bad de201559df872f83d0c08fb4effe3efd28e6cbc8
# good: [7e56a1cf4b28f5739526877b8dbad623fae2e4e7] sched/isolation: Make th=
e housekeeping cpumask private
git bisect good 7e56a1cf4b28f5739526877b8dbad623fae2e4e7
# good: [204c083a009378dfa751175b5fcddc75988bab6c] sched/isolation: Rename =
is_housekeeping_cpu() to housekeeping_cpu()
git bisect good 204c083a009378dfa751175b5fcddc75988bab6c
# bad: [5c4991e24c69737bd41fc2737b1e3980abbf73f9] sched/isolation: Split ou=
t new CONFIG_CPU_ISOLATION=3Dy config from CONFIG_NO_HZ_FULL
git bisect bad 5c4991e24c69737bd41fc2737b1e3980abbf73f9
# first bad commit: [5c4991e24c69737bd41fc2737b1e3980abbf73f9] sched/isolat=
ion: Split out new CONFIG_CPU_ISOLATION=3Dy config from CONFIG_NO_HZ_FULL


--===============3156449320039556488==--


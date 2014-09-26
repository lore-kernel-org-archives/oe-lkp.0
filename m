Content-Type: multipart/mixed; boundary="===============5669287826684784932=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [torture] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Fri, 26 Sep 2014 00:42:23 -0700
Message-ID: <20140926074223.GN4723@linux.vnet.ibm.com>
In-Reply-To: <20140918131751.GA8797@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5669287826684784932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2014 at 09:17:51PM +0800, Fengguang Wu wrote:
> Hi Paul,
> =

> > > > > plymouth-upstart-bridge: ply-event-loop.c:497: ply_event_loop_new=
: Assertion `loop->epoll_fd >=3D 0' failed.
> > > > > /etc/lsb-base-logging.sh: line 5:  2580 Aborted                 p=
lymouth --ping > /dev/null 2>&1
> > > > > /etc/lsb-base-logging.sh: line 5:  2585 Aborted                 p=
lymouth --ping > /dev/null 2>&1
> > > > > mount: proc has wrong device number or fs type proc not supported
> > > > > /etc/lsb-base-logging.sh: line 5:  2601 Aborted                 p=
lymouth --ping > /dev/null 2>&1
> > > > > /etc/rc6.d/S40umountfs: line 20: /proc/mounts: No such file or di=
rectory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > cat: /proc/1/maps: No such file or directory
> > > > > umount: /var/run: not mounted
> > > > > umount: /var/lock: not mounted
> > > > > umount: /dev/shm: not mounted
> > > > > mount: / is busy
> > > > >  * Will now restart
> > =

> > Are these expected behavior?
> =

> Yes, because it's randconfig boot tests, the user space may well
> complain about random stuff and I'll ignore them all as long as it
> will eventually call the shutdown command to finish the test in time.  :)
> =

> > So again, I can invoke this commit without losing much (sendkey
> > alt-sysrq-z is after all my friend), but it is not clear to me that we
> > have gotten to the root of this problem.
> =

> Sorry about that! If you see any debug tricks that I can try, or
> information I can collect, please let me know.

Hmmm...

Looks like rcutorture might be starting too soon.  With all the selftests,
it is taking 3-4 minutes to boot.  One approach would be to set
rcutorture.stat_interval=3D200 or whatever the duration of boot is.
Another would be to set rcutorture.torture_runnable=3D0, and to change:

	int rcutorture_runnable =3D RCUTORTURE_RUNNABLE_INIT;
	module_param(rcutorture_runnable, int, 0444);
	MODULE_PARM_DESC(rcutorture_runnable, "Start rcutorture at boot");

To:

	int rcutorture_runnable =3D RCUTORTURE_RUNNABLE_INIT;
	module_param(rcutorture_runnable, int, 0644);
	MODULE_PARM_DESC(rcutorture_runnable, "Start rcutorture at boot");

In kernel/rcu/rcutorture.c.

Then have your scripts set rcutorture_runnable=3D1 from sysfs once boot
completes.

Alternatively, if poking sysfs is not reasonable (and it
would not be in my test scripts), put a delay just after the
rcutorture_record_test_transition() in rcu_torture_init().  For example,
schedule_timeout_interruptible(200 * HZ) to delay 200 seconds.

Another approach would be for me to figure out some way for rcutorture
to figure out that boot was not far enough along for it to safely
do much, probably enabled by a third value of rcutorture_runnable.

One more approach would be to replace DUMP_ALL with DUMP_NONE in
kernel/rcu/rcutorture.c's rcutorture_trace_dump() function.  Or
to remove the ftrace_dump() statement entirely.  (The question that
this might help answer is which part of rcutorture_trace_dump() is
causing the problem.)

Any of these approaches seem reasonable?

							Thanx, Paul


--===============5669287826684784932==--


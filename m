Content-Type: multipart/mixed; boundary="===============3744089869642785325=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [torture] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 30 Sep 2014 10:27:40 +0800
Message-ID: <20140930022740.GA4723@wfg-t540p.sh.intel.com>
In-Reply-To: <20140926074223.GN4723@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3744089869642785325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2014 at 12:42:23AM -0700, Paul E. McKenney wrote:
> On Thu, Sep 18, 2014 at 09:17:51PM +0800, Fengguang Wu wrote:
> > Hi Paul,
> > =

> > > > > > plymouth-upstart-bridge: ply-event-loop.c:497: ply_event_loop_n=
ew: Assertion `loop->epoll_fd >=3D 0' failed.
> > > > > > /etc/lsb-base-logging.sh: line 5:  2580 Aborted                =
 plymouth --ping > /dev/null 2>&1
> > > > > > /etc/lsb-base-logging.sh: line 5:  2585 Aborted                =
 plymouth --ping > /dev/null 2>&1
> > > > > > mount: proc has wrong device number or fs type proc not support=
ed
> > > > > > /etc/lsb-base-logging.sh: line 5:  2601 Aborted                =
 plymouth --ping > /dev/null 2>&1
> > > > > > /etc/rc6.d/S40umountfs: line 20: /proc/mounts: No such file or =
directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > cat: /proc/1/maps: No such file or directory
> > > > > > umount: /var/run: not mounted
> > > > > > umount: /var/lock: not mounted
> > > > > > umount: /dev/shm: not mounted
> > > > > > mount: / is busy
> > > > > >  * Will now restart
> > > =

> > > Are these expected behavior?
> > =

> > Yes, because it's randconfig boot tests, the user space may well
> > complain about random stuff and I'll ignore them all as long as it
> > will eventually call the shutdown command to finish the test in time.  =
:)
> > =

> > > So again, I can invoke this commit without losing much (sendkey
> > > alt-sysrq-z is after all my friend), but it is not clear to me that we
> > > have gotten to the root of this problem.
> > =

> > Sorry about that! If you see any debug tricks that I can try, or
> > information I can collect, please let me know.
> =

> Hmmm...
> =

> Looks like rcutorture might be starting too soon.  With all the selftests,
> it is taking 3-4 minutes to boot.

Sorry my scripts reboot the machine quickly, there is no logic to wait for =
the
completion of rcutorture tests.  Looking at the dmesg, the BUG shows up dur=
ing
the shutdown stage:

=3D=3D>     Sending all processes the TERM signal...
        mount: mounting proc on /proc failed: No such device
        [  121.930088] Dumping ftrace buffer:
        [  121.930453] ---------------------------------
        [  121.930865] BUG: unable to handle kernel NULL pointer dereferenc=
e at           (null)
        [  121.931644] IP: [<ffffffff8959b074>] print_trace_line+0x2b0/0x38a

> One approach would be to set
> rcutorture.stat_interval=3D200 or whatever the duration of boot is.
> Another would be to set rcutorture.torture_runnable=3D0, and to change:
> =

> 	int rcutorture_runnable =3D RCUTORTURE_RUNNABLE_INIT;
> 	module_param(rcutorture_runnable, int, 0444);
> 	MODULE_PARM_DESC(rcutorture_runnable, "Start rcutorture at boot");
> =

> To:
> =

> 	int rcutorture_runnable =3D RCUTORTURE_RUNNABLE_INIT;
> 	module_param(rcutorture_runnable, int, 0644);
> 	MODULE_PARM_DESC(rcutorture_runnable, "Start rcutorture at boot");
> =

> In kernel/rcu/rcutorture.c.
> =

> Then have your scripts set rcutorture_runnable=3D1 from sysfs once boot
> completes.

That looks suitable to run as a functional test case in LKP.

I can enable the below options in the LKP test kernel (hope they will not
bring noticeable runtime overheads when not insmod):

CONFIG_TORTURE_TEST=3Dm
CONFIG_RCU_TORTURE_TEST=3Dm
CONFIG_LOCK_TORTURE_TEST=3Dm
 =

and write a simple test case for it. To start the torture test,
it should be as simple as

         modproble rcutorture
         echo 1 > /proc/sys/kernel/rcutorture_runnable

To determine if the test has finished, will this do the job in the
normal cases?

         dmesg | grep "--- End of test:"

Can I reasonably set the max test timeout to 5 or 10 or more minutes?
When exceeded, LKP will assume the machine is dead and need a force reboot.

> Alternatively, if poking sysfs is not reasonable (and it
> would not be in my test scripts), put a delay just after the
> rcutorture_record_test_transition() in rcu_torture_init().  For example,
> schedule_timeout_interruptible(200 * HZ) to delay 200 seconds.

I'd prefer the boot test to complete sooner than later, which helps
improve the test efficiency. :)

The 0day boot tests works by running this in a init.d script

        run CPU hotplug tests in the background
        enable tracing events [optional]
        run trinity for 100 seconds
        ### if feasible, we can add a wait-for-rcutorture-finish here
        reboot
 =

> Another approach would be for me to figure out some way for rcutorture
> to figure out that boot was not far enough along for it to safely
> do much, probably enabled by a third value of rcutorture_runnable.

Will it be *easy* to have a blockable syswrite to "stop rcutorture tests",
which will return when all tests have been stopped?

Anyway, I'm already happy with the above two options (where the kernel
printk some test completion message for the user space to grep).
 =

> One more approach would be to replace DUMP_ALL with DUMP_NONE in
> kernel/rcu/rcutorture.c's rcutorture_trace_dump() function.  Or
> to remove the ftrace_dump() statement entirely.  (The question that
> this might help answer is which part of rcutorture_trace_dump() is
> causing the problem.)

It should be unnecessary in testing POV. Unless if it is a bug.

Thanks,
Fengguang

--===============3744089869642785325==--


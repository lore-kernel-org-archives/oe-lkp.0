Content-Type: multipart/mixed; boundary="===============6728139165059314562=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 15693f040b: WARNING:at_kernel/locking/lockdep.c:#lockdep_free_key_range
Date: Mon, 17 Dec 2018 09:27:37 -0800
Message-ID: <1545067657.185366.433.camel@acm.org>
In-Reply-To: <20181217084128.GE23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6728139165059314562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-12-17 at 16:41 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-4.9):
> =

> commit: 15693f040b149ffff598cc048c2697b258d3901c ("locking/lockdep: Free =
lock classes that are no longer in use")
> https://github.com/bvanassche/linux for-next
> =

> in testcase: locktorture
> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> =

> test-description: This torture test consists of creating a number of kern=
el threads which acquire the lock and hold it for specific amount of time, =
thus simulating different critical region
> behaviors.
> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------------------+----------=
--+------------+
> >                                                             | b7001c6cc=
e | 15693f040b |
> =

> +-------------------------------------------------------------+----------=
--+------------+
> > boot_successes                                              | 0        =
  | 0          |
> > boot_failures                                               | 394      =
  | 396        |
> > WARNING:at_lib/debugobjects.c:#__debug_object_init          | 394      =
  | 396        |
> > EIP:__debug_object_init                                     | 394      =
  | 396        |
> > WARNING:possible_circular_locking_dependency_detected       | 370      =
  | 375        |
> > WARNING:at_kernel/locking/lockdep.c:#lock_downgrade         | 145      =
  | 159        |
> > EIP:lock_downgrade                                          | 145      =
  | 159        |
> > BUG:soft_lockup-CPU##stuck_for#s                            | 24       =
  | 21         |
> > EIP:thread_lookup_test                                      | 12       =
  | 9          |
> > Kernel_panic-not_syncing:softlockup:hung_tasks              | 24       =
  | 21         |
> > EIP:memcmp                                                  | 3        =
  | 3          |
> > EIP:threadfunc                                              | 4        =
  | 2          |
> > EIP:lock_acquire                                            | 3        =
  | 1          |
> > EIP:lock_is_held_type                                       | 2        =
  | 2          |
> > WARNING:at_net/sched/sch_generic.c:#dev_watchdog            | 1        =
  |            |
> > EIP:dev_watchdog                                            | 1        =
  |            |
> > WARNING:at_kernel/locking/lockdep.c:#lockdep_free_key_range | 0        =
  | 22         |
> > EIP:lockdep_free_key_range                                  | 0        =
  | 22         |
> > EIP:lock_release                                            | 0        =
  | 2          |
> > EIP:rht_deferred_worker                                     | 0        =
  | 2          |
> =

> +-------------------------------------------------------------+----------=
--+------------+

The WARNING:at_kernel/locking/lockdep.c:#lockdep_free_key_range warnings we=
re caused by the
following code:

	pf =3D get_pending_free_lock(&flags);
	if (WARN_ON_ONCE(!pf))
		return;

Before this report was produced I had already pushed out a new version of m=
y lockdep patch
series to the for-next branch of my github repository in which that code ha=
d been modified
into the following:

	pf =3D get_pending_free_lock(&flags);
	if (!pf)
		return;

Since the above report refers to a WARN_ON_ONCE() statement that has been r=
emoved, I think
that this report can be ignored.

Bart.


--===============6728139165059314562==--


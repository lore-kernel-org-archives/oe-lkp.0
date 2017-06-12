Content-Type: multipart/mixed; boundary="===============8424603865716001610=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [random] 2beeae6409:
Date: Mon, 12 Jun 2017 11:08:06 -0400
Message-ID: <20170612150806.roubtzjg42hcgm4a@thunk.org>
In-Reply-To: <593dfa0c.AkVW3rCMG0uslM/w%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8424603865716001610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 10:18:52AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 2beeae6409f4de00545ce0ff7fb0653d4559aa4c
	...
> +-------------------------------------------------+------------+---------=
---+---------------+
> |                                                 | ee415ae09e | 2beeae64=
09 | next-20170609 |
> +-------------------------------------------------+------------+---------=
---+---------------+
> | boot_successes                                  | 33         | 4       =
   | 0             |
> | boot_failures                                   | 0          | 0       =
   | 7             |
> | BUG:kernel_reboot-without-warning_in_test_stage | 0          | 0       =
   | 7             |
> +-------------------------------------------------+------------+---------=
---+---------------+

Hi Fungguang,

I'm confused.  The attached dmesg shows the following, but none of
this looks like it has anything to do with changes to
drivers/char/random.c:

Kernel tests: Boot OK!
[   19.211173] rcu-perf: rcu_perf_writer 0 has 100 measurements
[   19.211173] rcu-perf: rcu_perf_writer 0 has 100 measurements
[   19.331072] rcu-perf: Test complete
[   19.331072] rcu-perf: Test complete
Sending all processes the KILL signal...
Unmounting remote filesystems...
Deactivating swap...
Unmounting local filesystems...
Rebooting...
[   83.132709] Unregister pv shared memory for cpu 0
[   83.132709] Unregister pv shared memory for cpu 0
[   83.133794] rcu-torture: Unscheduled system shutdown detected
[   83.133794] rcu-torture: Unscheduled system shutdown detected
[   83.136197] reboot: Restarting system
[   83.136197] reboot: Restarting system
[   83.136949] reboot: machine restart
[   83.136949] reboot: machine restart

Elapsed time: 90

None of the changes in the random tree should be affecting when the
test scripts decide to kick off a shutdown, and this looks like it was
initiated by the init scripts deciding it was time to shut down.

	     	      	      	       - Ted

--===============8424603865716001610==--


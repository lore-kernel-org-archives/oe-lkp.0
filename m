Content-Type: multipart/mixed; boundary="===============4226446018426031362=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [task_work] 46a4746d9a: inconsistent{IN-HARDIRQ-W}->{HARDIRQ-ON-W}usage
Date: Fri, 30 Jun 2017 05:52:17 -0700
Message-ID: <20170630125217.GV2393@linux.vnet.ibm.com>
In-Reply-To: <20170630084558.GA9726@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4226446018426031362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 09:45:58AM +0100, Will Deacon wrote:
> On Fri, Jun 30, 2017 at 02:19:20PM +0800, kernel test robot wrote:
> > =

> > FYI, we noticed the following commit:
> > =

> > commit: 46a4746d9a364a9b0267c19be0f8419e9b72ad37 ("task_work: Replace s=
pin_unlock_wait() with lock/unlock pair")
> > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git spin=
_unlock_wait_no.2017.06.29c
> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +-------------------------------------------------+------------+-------=
-----+
> > |                                                 | ee4c0fbd46 | 46a474=
6d9a |
> > +-------------------------------------------------+------------+-------=
-----+
> > | boot_successes                                  | 6          | 0     =
     |
> > | boot_failures                                   | 0          | 10    =
     |
> > | inconsistent{IN-HARDIRQ-W}->{HARDIRQ-ON-W}usage | 0          | 8     =
     |
> > | inconsistent{IN-SOFTIRQ-W}->{SOFTIRQ-ON-W}usage | 0          | 2     =
     |
> > +-------------------------------------------------+------------+-------=
-----+
> > =

> > =

> > =

> > [    4.784726] WARNING: inconsistent lock state
> > [    4.785206] 4.12.0-rc4-00090-g46a4746 #86 Not tainted
> > [    4.785733] --------------------------------
> > [    4.786203] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> > [    4.786815] modprobe/143 [HC0[0]:SC0[0]:HE1:SE1] takes:
> > [    4.787377]  (&p->pi_lock){?.-.-.}, at: [<ffffffffb31016b7>] task_wo=
rk_run+0x6e/0xa8
> > [    4.788202] {IN-HARDIRQ-W} state was registered at:
> > [    4.788711]   __lock_acquire+0x3a9/0xed4
> > [    4.789151]   lock_acquire+0x125/0x1be
> > [    4.789571]   _raw_spin_lock_irqsave+0x49/0x84
> > [    4.790048]   try_to_wake_up+0x35/0x25b
> =

> D'oh... so that's another difference between spin_unlock_wait and spin_lo=
ck;
> spin_unlock. The former doesn't care about being interrupted, since there=
's
> no scope for deadlock when you're not actually taking the lock.
> =

> So the easy fix here is to use the irqsave/irqrestore variants in
> task_work_run, but it does mean we need to be a little bit careful when
> doing the conversion.

Indeed, very stupid mistake on my part.  Hurray for 0day Test Robot!  ;-)

I will recheck the others.

							Thanx, Paul


--===============4226446018426031362==--


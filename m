Content-Type: multipart/mixed; boundary="===============1410280046350214230=="
MIME-Version: 1.0
From: Will Deacon <will.deacon@arm.com>
To: lkp@lists.01.org
Subject: Re: [task_work] 46a4746d9a: inconsistent{IN-HARDIRQ-W}->{HARDIRQ-ON-W}usage
Date: Fri, 30 Jun 2017 09:45:58 +0100
Message-ID: <20170630084558.GA9726@arm.com>
In-Reply-To: <20170630061920.GA61856@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1410280046350214230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 02:19:20PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 46a4746d9a364a9b0267c19be0f8419e9b72ad37 ("task_work: Replace spi=
n_unlock_wait() with lock/unlock pair")
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git spin_u=
nlock_wait_no.2017.06.29c
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | ee4c0fbd46 | 46a4746d=
9a |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 6          | 0       =
   |
> | boot_failures                                   | 0          | 10      =
   |
> | inconsistent{IN-HARDIRQ-W}->{HARDIRQ-ON-W}usage | 0          | 8       =
   |
> | inconsistent{IN-SOFTIRQ-W}->{SOFTIRQ-ON-W}usage | 0          | 2       =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> =

> =

> [    4.784726] WARNING: inconsistent lock state
> [    4.785206] 4.12.0-rc4-00090-g46a4746 #86 Not tainted
> [    4.785733] --------------------------------
> [    4.786203] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> [    4.786815] modprobe/143 [HC0[0]:SC0[0]:HE1:SE1] takes:
> [    4.787377]  (&p->pi_lock){?.-.-.}, at: [<ffffffffb31016b7>] task_work=
_run+0x6e/0xa8
> [    4.788202] {IN-HARDIRQ-W} state was registered at:
> [    4.788711]   __lock_acquire+0x3a9/0xed4
> [    4.789151]   lock_acquire+0x125/0x1be
> [    4.789571]   _raw_spin_lock_irqsave+0x49/0x84
> [    4.790048]   try_to_wake_up+0x35/0x25b

D'oh... so that's another difference between spin_unlock_wait and spin_lock;
spin_unlock. The former doesn't care about being interrupted, since there's
no scope for deadlock when you're not actually taking the lock.

So the easy fix here is to use the irqsave/irqrestore variants in
task_work_run, but it does mean we need to be a little bit careful when
doing the conversion.

Will

--===============1410280046350214230==--


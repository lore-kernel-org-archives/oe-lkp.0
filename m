Content-Type: multipart/mixed; boundary="===============0109157875812913075=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [d_alloc_parallel] WARNING: bad unlock balance detected!
Date: Tue, 07 Nov 2017 12:03:29 +0800
Message-ID: <20171107040329.yftf6ceduet4zaph@wfg-t540p.sh.intel.com>
In-Reply-To: <20171107023328.GU21978@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0109157875812913075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC locking people.

On Tue, Nov 07, 2017 at 02:33:28AM +0000, Al Viro wrote:
>On Tue, Nov 07, 2017 at 10:01:13AM +0800, Fengguang Wu wrote:
>> Hi,
>>
>> Here is a warning in v4.14-rc8 -- it's not necessarily a new bug.
>
>Why is it a bug at all?
>
>> [  428.512005] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Co=
ntrol: RX
>> LKP: HOSTNAME vm-lkp-wsx03-openwrt-i386-8, MAC , kernel 4.14.0-rc8 158, =
serial console /dev/ttyS0
>> [  429.798345] Kernel tests: Boot OK!
>> [  430.761760] [  430.766166] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [  430.775297] WARNING: bad unlock balance detected!
>> [  430.784342] 4.14.0-rc8 #158 Not tainted
>> [  430.792153] -------------------------------------
>> [  430.801319] pidof/1024 is trying to release lock (rcu_preempt_state) =
at:
>> [  430.813514] [<c10e4348>] rcu_read_unlock_special+0x5f8/0x620
>> [  430.824041] but there are no more locks to release!
>
>Er... yes?  What of that?  Since when is rcu_read_lock() not allowed to
>be used under an rwsem?
>
>> [  430.833342] [  430.833342] other info that might help us debug this:
>> [  430.845985] 2 locks held by pidof/1024:
>> [  430.853826]  #0:  (&sb->s_type->i_mutex_key){....}, at: [<c1266efa>] =
lookup_slow+0x8a/0x310
>> [  430.869344]  #1:  (rcu_read_lock){....}, at: [<c128094e>] d_alloc_par=
allel+0x7e/0xd10
>
>No shit - we are doing RCU cache chain walk while holding ->i_rwsem.  As in
>	down_read(&rwsem);
>	...
>	rcu_read_lock();
>	...
>	rcu_read_unlock();
>
>Why is that a problem?  If we are suddenly not allowed to have an RCU read=
er
>section while holding any kind of a blocking lock, a *lot* of places in the
>kernel are screwed.
>
>Please, explain.

Good question! Actually it's not only you.

There are dozens of occurrences for this "unlock balance" warning
in RC8:

  ((console_sem).lock){-...}, at:  up
  (gcov_lock){+.+.}, at:  gcov_enable_events
  (&mm->mmap_sem){....}, at:  __do_page_fault
  (node_lock){+.+.}, at:  gcov_event
  (&p->pi_lock){-.-.}, at:  try_to_wake_up
  (rcu_read_lock){....}, at:  aa_file_perm
  (rcu_read_lock){....}, at:  copy_namespaces
  (rcu_read_lock){....}, at:  d_alloc_parallel
  (rcu_read_lock){....}, at:  __d_lookup
  (rcu_read_lock){....}, at:  dput
  (rcu_read_lock){....}, at:  find_get_entry
  (rcu_read_lock){....}, at:  insert_retry
  (rcu_read_lock){....}, at:  mntput_no_expire
  (rcu_read_lock){....}, at:  netlink_insert
  (rcu_read_lock){....}, at:  rcu_read_lock
  (rcu_read_lock){....}, at:  rcu_torture_read_lock
  (rcu_read_lock){....}, at:  rhashtable_insert_slow
  (rcu_read_lock){....}, at:  rhashtable_walk_start
  (rcu_read_lock){....}, at:  sock_def_readable
  (rcu_read_lock){....}, at:  SyS_setpriority
  (rcu_read_lock){....}, at:  T.947
  (rcu_read_lock){....}, at:  T.949
  (rcu_read_lock){....}, at:  test_rhashtable
  (rcu_read_lock){....}, at:  test_rht_lookup
  (rcu_read_lock){....}, at:  threadfunc
  (rcu_read_lock){....}, at:  thread_lookup_test
  (rcu_read_lock){....}, at:  watchdog
  (rcu_sched_state.exp_mutex){+.+.}, at:  _synchronize_rcu_expedited
  (&sb->s_type->i_mutex_key#3){+.+.}, at:  start_creating
  (&sb->s_type->i_mutex_key){....}, at:  lookup_slow
  (&sig->cred_guard_mutex){....}, at:  prepare_bprm_creds
  (sk_lock-AF_NETLINK){....}, at:  netlink_insert
  (tasklist_lock){....}, at:  debug_show_all_locks
  (tasklist_lock){.+.+}, at:  debug_show_all_locks
  (tty_mutex){....}, at:  tty_open
  (tty_mutex){+.+.}, at:  tty_open
  (tty_mutex){+.+.}, at:  tty_release_struct

Maybe some recent core locking changes triggered this warning.
In particular, some warnings show up since this commit.

commit cde50a67397c0da7d11795d4b4418384022ab8e6
Author:     Levin, Alexander (Sasha Levin) <alexander.levin@verizon.com>
AuthorDate: Sun Jun 18 14:06:01 2017 +0000
Commit:     Ingo Molnar <mingo@kernel.org>
CommitDate: Tue Jun 20 11:53:09 2017 +0200

    locking/rtmutex: Don't initialize lockdep when not required

    pi_mutex isn't supposed to be tracked by lockdep, but just
    passing NULLs for name and key will cause lockdep to spew a
    warning and die, which is not what we want it to do.

    Skip lockdep initialization if the caller passed NULLs for
    name and key, suggesting such initialization isn't desired.

    Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Fixes: f5694788ad8d ("rt_mutex: Add lockdep annotations")
    Link: http://lkml.kernel.org/r/20170618140548.4763-1-alexander.levin(a)=
verizon.com
    Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/locking/rtmutex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 43123533e9b10..78069895032a9 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1661,6 +1661,7 @@ void __rt_mutex_init(struct rt_mutex *lock, const cha=
r *name,
        lock->waiters =3D RB_ROOT;
        lock->waiters_leftmost =3D NULL;

+       if (name && key)
                debug_rt_mutex_init(lock, name, key);
 }
 EXPORT_SYMBOL_GPL(__rt_mutex_init);

018956d641  locking/selftest: Add RT-mutex support
cde50a6739  locking/rtmutex: Don't initialize lockdep when not required
+-------------------------------------------------------+------------+-----=
-------+
|                                                       | 018956d641 | cde5=
0a6739 |
+-------------------------------------------------------+------------+-----=
-------+
| boot_successes                                        | 60         | 22  =
       |
| boot_failures                                         | 42         | 15  =
       |
| WARNING:at_kernel/locking/lockdep.c:#lockdep_init_map | 42         |     =
       |
| is_trying_to_release_lock(rcu_preempt_state)at        | 0          | 15  =
       |
+-------------------------------------------------------+------------+-----=
-------+

[    8.863582]
[    8.863770] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    8.864214] WARNING: bad unlock balance detected!
[    8.864704] 4.12.0-rc4-00028-gcde50a6 #1 Not tainted
[    8.865223] -------------------------------------
[    8.865718] swapper/1 is trying to release lock (rcu_preempt_state) at:
[    8.866385] [<ffffffff810b9a93>] rcu_read_unlock_special+0x253/0x2c0
[    8.867097] but there are no more locks to release!
[    8.867659]
[    8.867659] other info that might help us debug this:
[    8.868546] 1 lock held by swapper/1:
[    8.869141]  #0:  (rcu_read_lock){......}, at: [<ffffffff8124c1a3>] inse=
rt_retry+0x23/0x520
[    8.870608]
[    8.870608] stack backtrace:
[    8.871299] CPU: 0 PID: 1 Comm: swapper Not tainted 4.12.0-rc4-00028-gcd=
e50a6 #1
[    8.872510] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.9.3-20161025_171302-gandalf
04/01/2014
[    8.874123] Call Trace:
[    8.874559]  dump_stack+0x19/0x1b
[    8.875151]  print_unlock_imbalance_bug+0xd7/0xe0
[    8.875947]  lock_release+0x352/0x390
[    8.876579]  rt_mutex_unlock+0x27/0x60
[    8.877208]  ? _raw_spin_unlock_irqrestore+0x56/0x70
[    8.877998]  rcu_read_unlock_special+0x253/0x2c0
[    8.878766]  __rcu_read_unlock+0x3f/0x60
[    8.879388]  insert_retry+0x207/0x520
[    8.880173]  ? do_early_param+0x8f/0x8f
[    8.880838]  test_rht_init+0x144/0x9f6
[    8.881493]  ? kstrtol_from_user+0xa0/0xa0
[    8.882184]  ? __test_string_get_size+0x87/0xa8
[    8.882975]  ? test_string_helpers_init+0x197/0x197
[    8.883807]  ? do_early_param+0x8f/0x8f
[    8.884456]  do_one_initcall+0x95/0x180
[    8.885130]  ? do_early_param+0x8f/0x8f
[    8.885778]  kernel_init_freeable+0x1bd/0x247
[    8.886511]  ? rest_init+0x130/0x130
[    8.887133]  kernel_init+0x9/0xf0
[    8.887703]  ret_from_fork+0x2a/0x40

Regards,
Fengguang

--===============0109157875812913075==--


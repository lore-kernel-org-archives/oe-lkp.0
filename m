Content-Type: multipart/mixed; boundary="===============9039540892729105160=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 857811a371 BUG: kernel hang in boot stage
Date: Fri, 31 Mar 2017 14:46:41 +0800
Message-ID: <20170331064641.wxxnmil4ub2wkyxh@tardis>
In-Reply-To: <20170328090709.fhv6y4maxu7nje42@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9039540892729105160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 05:07:09PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 857811a37129f5d2ba162d7be3986eff44724014
> Author:     Boqun Feng <boqun.feng@gmail.com>
> AuthorDate: Wed Mar 1 23:01:38 2017 +0800
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Thu Mar 2 09:00:39 2017 +0100
> =

>      locking/ww_mutex: Adjust the lock number for stress test
>      =

>      Because there are only 12 bits in held_lock::references, so we only
>      support 4095 nested lock held in the same time, adjust the lock numb=
er
>      for ww_mutex stress test to kill one lockdep splat:
>      =

>        [ ] [ BUG: bad unlock balance detected! ]
>        [ ] kworker/u2:0/5 is trying to release lock (ww_class_mutex) at:
>        [ ] ww_mutex_unlock()
>        [ ] but there are no more locks to release!
>        ...
>      =

>      Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>      Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>      Cc: Andrew Morton <akpm@linux-foundation.org>
>      Cc: Chris Wilson <chris@chris-wilson.co.uk>
>      Cc: Fengguang Wu <fengguang.wu@intel.com>
>      Cc: Linus Torvalds <torvalds@linux-foundation.org>
>      Cc: Nicolai H=C3=A4hnle <Nicolai.Haehnle@amd.com>
>      Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>      Cc: Peter Zijlstra <peterz@infradead.org>
>      Cc: Thomas Gleixner <tglx@linutronix.de>
>      Link: http://lkml.kernel.org/r/20170301150138.hdixnmafzfsox7nn(a)tar=
dis.cn.ibm.com
>      Signed-off-by: Ingo Molnar <mingo@kernel.org>
> =

> 7fb4a2cea6  locking/lockdep: Add nest_lock integrity test
> 857811a371  locking/ww_mutex: Adjust the lock number for stress test
> c02ed2e75e  Linux 4.11-rc4
> 7f0c4a163a  Add linux-next specific files for 20170327
> +-----------------------------------------------------+------------+-----=
-------+-----------+---------------+
> |                                                     | 7fb4a2cea6 | 8578=
11a371 | v4.11-rc4 | next-20170327 |
> +-----------------------------------------------------+------------+-----=
-------+-----------+---------------+
> | boot_successes                                      | 0          | 16  =
       | 29        | 1             |
> | boot_failures                                       | 221        | 42  =
       | 64        | 9             |
> | WARNING:at_kernel/locking/lockdep.c:#__lock_acquire | 221        |     =
       |           |               |
> | BUG:kernel_hang_in_boot_stage                       | 0          | 42  =
       | 60        | 9             |
> | BUG:kernel_hang_in_test_stage                       | 0          | 0   =
       | 4         |               |
> +-----------------------------------------------------+------------+-----=
-------+-----------+---------------+
> =

> [  319.426004] CPU 0 is now offline
> [  319.426004] CPU 0 is now offline
> [  319.427670] =

> <kernel hangs here>
> =


Hmm.. with the same reproduce script, I'm able to reproduce the hang
even with CONIFG_WW_MUTEX_SELFTEST=3DN. Fengguang, could you try to verify
whether ww_mutex test is related to this hang?

Regards,
Boqun

--===============9039540892729105160==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVqNUlvc1FUUHo4
WFUxd1JIU1hub3c3VUgrcmdGQWxqZCswd0FDZ2tRU1hub3c3VUgKK3JpUVVBZ0FoQndPNnY3aWVM
UW1iWTRzeUlCMGFqMi9mQjhrUjluMlluYmZ5UWtTdVJGL3Uxejhna3RSYVJsVwp2aFpHekVpUG8x
L3I1WVdaaUUvYzdqZUdvTndEUnloditGb2NDNjJpczU2VTlxRk52T1JhTmoxRTJYQnR2NThhCmtP
eitTb3dGbGk4YUYzWkdOM0orZkhSYk1ndENGSGlNSXdnOWs1ZStyVXNLcWIwSlpkczh2K3RFOWEr
aVJOYjQKQjNnb0RLMiszcGFOU0FBdUFHYVo4NEwvMHRFOCsxRWhNc2Z6WnI1aEV3QlhvZllLaHJP
ZDBrQkZrclBramkvTQowVGJ5UFphVWEreVNUNERqYWVwZEFqcWo4Y1hLY2VhR0ZibVVmUVdVRUhQ
Q3cxSTM1SlRORkVJWmJHY0FrUzU3Ck1oQnFyRyt6cmthcVRWeW9rS0REWWFGVHJWYnFJdz09Cj1C
M0l1Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============9039540892729105160==--


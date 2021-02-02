Content-Type: multipart/mixed; boundary="===============0876052863523469932=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Tue, 02 Feb 2021 18:19:40 +0106
Message-ID: <8735yev1dn.fsf@jogness.linutronix.de>
In-Reply-To: <20210122081311.GA12834@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0876052863523469932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-22, kernel test robot <oliver.sang@intel.com> wrote:
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: b031a684bfd01d633c79d281bd0cf11c2f834ada ("printk: remove logbuf_=
lock writer-protection of ringbuffer")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I am still investigating this in my spare cycles. I have tried to reduce
the changes to determine what is causing the problem.

For example, instead of applying the problematic commit, I can reproduce
the problem with:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 150bfde41ba1..17a92a76cae2 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1943,7 +1943,10 @@ int vprintk_store(int facility, int level,
 	 * prb_reserve_in_last() and prb_reserve() purposely invalidate the
 	 * structure when they fail.
 	 */
-	prb_rec_init_wr(&r, text_len);
+	if (text_len < 200)
+		prb_rec_init_wr(&r, 200);
+	else
+		prb_rec_init_wr(&r, text_len);
 	if (!prb_reserve(&e, prb, &r)) {
 		/* truncate the message if it is too long for empty buffer */
 		truncate_msg(&text_len, &trunc_msg_len);

which simply makes sure@least 200-byte datablocks are allocated. This
totally different change causes the _exact_ same rcu stall
behavior/pattern as the problematic commit that is removing spinlock
usage. That pattern is:

1. printk() is getting called about 65 times a second with:

   "tasks-torture:torture_onoff task: online 0 failed: errno -5"

2. About 60 seconds after "rmmod rcutorture" is called, the following
ruc warning appears:

[  390.440235] ??? Writer stall state RTWS_SYNC(7) g0 f0x0 ->state 0x2 cpu 1
[  390.441250] task:rcu_torture_wri state:D stack:    0 pid:  505 ppid:    =
 2 flags:0x00004000
[  390.442473] Call Trace:
[  390.442938]  __schedule+0xa12/0xab5
[  390.443495]  ? firmware_map_remove+0xd1/0xd1
[  390.444151]  ? ttwu_do_wakeup+0x1d/0x2dd
[  390.444764]  schedule+0x16c/0x1df
[  390.445311]  schedule_timeout+0x77/0x1b4
[  390.445911]  ? usleep_range+0x130/0x130
[  390.446522]  ? do_raw_spin_lock+0x74/0xbf
[  390.447180]  ? queued_read_unlock+0x19/0x19
[  390.447825]  ? __prepare_to_swait+0xa4/0x141
[  390.448491]  __wait_for_common+0x22d/0x337
[  390.449139]  ? usleep_range+0x130/0x130
[  390.450860]  ? _raw_spin_lock_irqsave+0x81/0xd1
[  390.451543]  ? bit_wait_io_timeout+0x8a/0x8a
[  390.452196]  __wait_rcu_gp+0x20d/0x229
[  390.452788]  synchronize_rcu_tasks_generic.isra.0+0x7e/0xb2
[  390.453604]  ? rcu_tasks_rude_wait_gp+0x3d/0x3d
[  390.454334]  ? call_rcu_tasks_generic+0x134/0x134
[  390.455055]  ? rcu_torture_alloc+0x50/0xbc [rcutorture]
[  390.455847]  ? rcu_unexpedite_gp+0x19/0x19
[  390.456488]  ? delay_tsc+0x41/0x7c
[  390.457053]  rcu_torture_writer+0x815/0xaea [rcutorture]
[  390.457889]  ? rcu_torture_pipe_update+0x100/0x100 [rcutorture]
[  390.458801]  ? test_bit+0x15/0x1f
[  390.459349]  ? __kthread_parkme+0xb2/0x142
[  390.459968]  kthread+0x2ff/0x30e
[  390.460539]  ? rcu_torture_pipe_update+0x100/0x100 [rcutorture]
[  390.461408]  ? kthread_create_worker_on_cpu+0xce/0xce
[  390.462171]  ret_from_fork+0x22/0x30

3. About 9 minutes later, 2 stalls are reported:

[  926.880657] INFO: rcu_tasks detected stalls on tasks:
[  926.881387] 000000003a288f24: .. nvcsw: 0/0 holdout: 1 idle_cpu: -1/1
[  926.882313] task:dmesg           state:R  running task     stack:    0 p=
id: 1717 ppid:   497 flags:0x20020000
[  926.883727] Call Trace:
[  926.884148]  __schedule+0xa12/0xab5
[  926.884706]  ? firmware_map_remove+0xd1/0xd1
[  926.885355]  ? ksys_read+0x116/0x150
[  926.885930]  schedule+0x16c/0x1df
[  926.886458]  exit_to_user_mode_loop+0x28/0x84
[  926.887123]  exit_to_user_mode_prepare+0x1d/0x4a
[  926.887823]  syscall_exit_to_user_mode+0x41/0x4f
[  926.888513]  entry_INT80_compat+0x71/0x76
[  926.889131] RIP: 0023:0xf7fcca02
[  926.889658] RSP: 002b:00000000ffd230c4 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000003
[  926.890780] RAX: 0000000000000050 RBX: 0000000000000004 RCX: 00000000566=
01234
[  926.891720] RDX: 0000000000001fff RSI: 00000000000001e0 RDI: 00000000566=
01234
[  926.892724] RBP: 00000000ffd231d8 R08: 0000000000000000 R09: 00000000000=
00000
[  926.893733] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[  926.894745] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000

and

[  926.931950] 00000000a4109e4e: .. nvcsw: 21326/21326 holdout: 1 idle_cpu:=
 -1/1
[  926.932883] task:dmesg           state:R  running task     stack:    0 p=
id:  447 ppid:   442 flags:0x20020000
[  926.934286] Call Trace:
[  926.934714]  __schedule+0xa12/0xab5
[  926.935268]  ? firmware_map_remove+0xd1/0xd1
[  926.935919]  ? ksys_read+0x116/0x150
[  926.936478]  schedule+0x16c/0x1df
[  926.937012]  exit_to_user_mode_loop+0x28/0x84
[  926.937674]  exit_to_user_mode_prepare+0x1d/0x4a
[  926.938363]  syscall_exit_to_user_mode+0x41/0x4f
[  926.939059]  entry_INT80_compat+0x71/0x76
[  926.939680] RIP: 0023:0xf7f9da02
[  926.940193] RSP: 002b:00000000ffdb2864 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000003
[  926.941301] RAX: ffffffffffffffe0 RBX: 0000000000000003 RCX: 00000000566=
59234
[  926.942307] RDX: 0000000000001fff RSI: 00000000000001e0 RDI: 00000000566=
59234
[  926.943312] RBP: 00000000ffffffff R08: 0000000000000000 R09: 00000000000=
00000
[  926.944313] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[  926.945314] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000

This pattern is _always_ the same (using either my simple change or with
the problematic commit applied). Obviously the removal of the spinlock
usage is not the issue. But I am concerned that the ringbuffer is
somehow involved. I have tried to reproduce this problem doing
non-ringbuffer activity, but have not had success.

Also, the problem disappears if a newer kernel is used. So maybe there
was something fixed in rcu or an rcu user. But still, it is very odd
that the ringbuffer is triggering it.

I will continue investigating this.

Also, I plan to send a patch to lkp so that the test script is not
doing:

    dmesg > /dev/kmsg

Although this may be a great test for printk, for rcutorture it would be
more appropriate to do something like:

    dmesg > /tmpfile
    cat /tmpfile > /dev/kmsg

to avoid the endless read/feed cycle.

John Ogness
--===============0876052863523469932==--


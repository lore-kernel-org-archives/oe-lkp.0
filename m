Content-Type: multipart/mixed; boundary="===============6105342772738347256=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [RING_BUFFER_BENCHMARK] INFO: task rb_producer:73 blocked for more than 120 seconds.
Date: Tue, 21 Nov 2017 21:28:55 +0800
Message-ID: <20171121132855.ajdv4k6swzhvktl6@wfg-t540p.sh.intel.com>
In-Reply-To: <20171121121233.3pvkb34tci47n634@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6105342772738347256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 08:12:33PM +0800, Fengguang Wu wrote:
>Hello,
>
>FYI this happens in mainline kernel 4.14.0-10087-g8c60969.
>It happens since 4.11.

Sorry it occurs once in 4.10, too.

/pkg/linux/i386-randconfig-sb0-10121726/gcc-5/c470abd4fde40ea6a0846a2beab64=
2a578c0b8cd/dmesg-vm-lkp-wsx03-openwrt-i386-23:20171016024929:i386-randconf=
ig-sb0-10121726:4.10.0:1

[  363.022350] CE: Reprogramming failure. Giving up
[  373.638060] INFO: task rb_producer:43 blocked for more than 120 seconds.
[  373.638158]       Not tainted 4.10.0 #1
[  373.638189] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  373.638216] rb_producer     D 7500    43      2 0x00000000
[  373.639902] Call Trace:
[  373.640643]  __schedule+0xde8/0x118f
[  373.651470]  ? rewind_stack_do_exit+0x12/0x12
[  373.651510]  schedule+0x4e/0xc0
[  373.651566]  schedule_timeout+0x2a/0x6d9
[  373.651597]  ? wait_for_common+0x4e/0x2cb
[  373.651631]  ? _raw_spin_unlock_irq+0x60/0x16f
[  373.651666]  ? trace_hardirqs_on_caller+0x36b/0x3b1
[  373.651698]  ? preempt_count_sub+0xdd/0xf7
[  373.652222]  ? native_irq_disable+0x22/0x22
[  373.683202]  wait_for_common+0x250/0x2cb
[  373.706893]  ? do_task_dead+0xad/0xad
[  373.732749]  wait_for_completion+0x25/0x35
[  373.732785]  ring_buffer_producer+0x26a/0x818
[  373.758544]  ? do_task_dead+0xad/0xad
[  373.767747]  ring_buffer_producer_thread+0xa0/0x1b2
[  373.767806]  kthread+0x1b1/0x1c4
[  373.767846]  ? wait_to_die+0xaa/0xaa
[  373.767880]  ? __kthread_create_on_node+0x2c7/0x2c7
[  373.796586]  ret_from_fork+0x21/0x30
[  373.796617]
[  373.796617] Showing all locks held in the system:
[  373.798861] 2 locks held by khungtaskd/17:
[  373.800187]  #0:  (rcu_read_lock){......}, at: [<81172016>] watchdog+0x1=
24/0x6d1
[  373.800287]  #1:  (tasklist_lock){.+.+..}, at: [<810e574a>] debug_show_a=
ll_locks+0x72/0x2d3
[  373.800702] 2 locks held by askfirst/123:
[  373.802453]  #0:  (&tty->ldisc_sem){.+.+.+}, at: [<819b98ac>] ldsem_down=
_read+0x46/0x58
[  373.802546]  #1:  (&ldata->atomic_read_lock){+.+...}, at: [<81565de8>] n=
_tty_read+0x115/0xbe4
[  373.804460]
[  373.804465] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  373.804465]
[  373.831299] Kernel panic - not syncing: hung_task: blocked tasks
[  373.831358] CPU: 0 PID: 17 Comm: khungtaskd Not tainted 4.10.0 #1
[  373.831363] Call Trace:
[  373.831720]  dump_stack+0x40/0x5e
[  373.831809]  panic+0x1b5/0x4a3
[  373.831849]  check_hung_task+0x3d4/0x51d
[  373.831882]  watchdog+0x269/0x6d1
[  373.831936]  kthread+0x1b1/0x1c4
[  373.831979]  ? check_hung_task+0x51d/0x51d
[  373.832038]  ? __kthread_create_on_node+0x2c7/0x2c7
[  373.832230]  ret_from_fork+0x21/0x30
[  373.832400] Kernel Offset: disabled
[  376.677470] Rebooting in 3 seconds..

Fengguang

--===============6105342772738347256==--


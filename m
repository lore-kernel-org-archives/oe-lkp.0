Content-Type: multipart/mixed; boundary="===============3422124519440897755=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [IB/srpt] c804af2c1d: last_state.test.blktests.exit_code.143
Date: Sun, 02 Aug 2020 08:05:34 -0700
Message-ID: <f8ef3284-4646-94d9-7eea-14ac0873b03b@acm.org>
In-Reply-To: <20200802060925.GW23458@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3422124519440897755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-08-01 23:09, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: c804af2c1d3152c0cf877eeb50d60c2d49ac0cf0 ("IB/srpt: use new share=
d CQ mechanism")
> https://git.kernel.org/cgit/linux/kernel/git/rdma/rdma.git for-next
> =

> =

> in testcase: blktests
> with following parameters:
> =

> 	test: srp-group1
> 	ucode: 0x21
> =

> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4=
G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> user  :notice: [   44.688140] 2020-08-01 16:10:22 ./check srp/001 srp/002=
 srp/003 srp/004 srp/005 srp/006 srp/007 srp/008 srp/009 srp/010 srp/011 sr=
p/012 srp/013 srp/015
> user  :notice: [   44.706657] srp/001 (Create and remove LUNs)           =
                 =

> user  :notice: [   44.718405] srp/001 (Create and remove LUNs)           =
                  [passed]
> user  :notice: [   44.729902]     runtime  ...  1.972s
> user  :notice: [   99.038748] IPMI BMC is not supported on this machine, =
skip bmc-watchdog setup!
> user  :notice: [ 3699.039790] Sat Aug  1 17:11:22 UTC 2020 detected soft_=
timeout
> user  :notice: [ 3699.060341] kill 960 /usr/bin/time -v -o /tmp/lkp/blkte=
sts.time /lkp/lkp/src/tests/blktests =


Yamin and Max, can you take a look at this? The SRP tests from the
blktests repository pass reliably with kernel version v5.7 and before.
With label next-20200731 from linux-next however that test triggers the
following hang:

sd 8:0:0:0: [sda] Synchronizing SCSI cache
rdma_rxe: not configured on eth0
rdma_rxe: not configured on lo
INFO: task modprobe:1894 blocked for more than 122 seconds.
      Not tainted 5.8.0-rc7-next-20200731-dbg+ #3
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
modprobe        D27624  1894   1081 0x00004000
Call Trace:
 __schedule+0x4ee/0x1170
 schedule+0x7f/0x170
 schedule_timeout+0x453/0x6f0
 wait_for_completion+0x126/0x1b0
 disable_device+0x12a/0x1c0 [ib_core]
 __ib_unregister_device+0x64/0x100 [ib_core]
 ib_unregister_driver+0x11c/0x180 [ib_core]
 rxe_module_exit+0x1e/0x36 [rdma_rxe]
 __x64_sys_delete_module+0x22a/0x310
 do_syscall_64+0x36/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f8d0e0c8a3b
Code: Bad RIP value.
RSP: 002b:00007ffe8238f798 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
RAX: ffffffffffffffda RBX: 000055a2c7d9be80 RCX: 00007f8d0e0c8a3b
RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000055a2c7d9bee8
RBP: 000055a2c7d9be80 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f8d0e144ac0 R11: 0000000000000206 R12: 000055a2c7d9bee8
R13: 0000000000000000 R14: 000055a2c7d9bee8 R15: 000055a2c7d9be80

Showing all locks held in the system:
1 lock held by khungtaskd/53:
 #0: ffffffff82895880 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks=
+0x37/0x20f
1 lock held by modprobe/1894:
 #0: ffff8881c5e8c660 (&device->unregistration_lock){+.+.}-{3:3}, at: __ib_=
unregister_device+0x23/0x100 [ib_core]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
INFO: task modprobe:1894 blocked for more than 245 seconds.
      Not tainted 5.8.0-rc7-next-20200731-dbg+ #3
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
modprobe        D27624  1894   1081 0x00004000
Call Trace:
 __schedule+0x4ee/0x1170
 schedule+0x7f/0x170
 schedule_timeout+0x453/0x6f0
 wait_for_completion+0x126/0x1b0
 disable_device+0x12a/0x1c0 [ib_core]
 __ib_unregister_device+0x64/0x100 [ib_core]
 ib_unregister_driver+0x11c/0x180 [ib_core]
 rxe_module_exit+0x1e/0x36 [rdma_rxe]
 __x64_sys_delete_module+0x22a/0x310
 do_syscall_64+0x36/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f8d0e0c8a3b
Code: Bad RIP value.
RSP: 002b:00007ffe8238f798 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
RAX: ffffffffffffffda RBX: 000055a2c7d9be80 RCX: 00007f8d0e0c8a3b
RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000055a2c7d9bee8
RBP: 000055a2c7d9be80 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f8d0e144ac0 R11: 0000000000000206 R12: 000055a2c7d9bee8
R13: 0000000000000000 R14: 000055a2c7d9bee8 R15: 000055a2c7d9be80

Showing all locks held in the system:
1 lock held by khungtaskd/53:
 #0: ffffffff82895880 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks=
+0x37/0x20f
no locks held by systemd-journal/241.
1 lock held by modprobe/1894:
 #0: ffff8881c5e8c660 (&device->unregistration_lock){+.+.}-{3:3}, at: __ib_=
unregister_device+0x23/0x100 [ib_core]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--===============3422124519440897755==--


Content-Type: multipart/mixed; boundary="===============2414021621907311948=="
MIME-Version: 1.0
From: Sudeep Holla <sudeep.holla@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm] e7c1db75fe: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 30 Nov 2016 12:28:01 +0000
Message-ID: <20161130122801.GA455@e107155-lin>
In-Reply-To: <20161130074014.GN3924@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2414021621907311948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30/11/16 07:40, Paul E. McKenney wrote:
> On Wed, Nov 30, 2016 at 08:16:02AM +0100, Michal Hocko wrote:
>> On Tue 29-11-16 11:14:48, Paul E. McKenney wrote:
>>> On Tue, Nov 29, 2016 at 05:21:19PM +0000, Sudeep Holla wrote:
>>>> On Sun, Nov 27, 2016 at 6:16 PM, kernel test robot
>>>> <xiaolong.ye@intel.com> wrote:
>>>>>
>>>>> FYI, we noticed the following commit:
>>>>>
>>>>> commit e7c1db75fed821a961ce1ca2b602b08e75de0cd8 ("mm: Prevent __alloc=
_pages_nodemask() RCU CPU stall warnings")
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git=
 rcu/next
>>>>>
>>>>> in testcase: boot
>>>>>
>>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -=
m 1G
>>>>>
>>>>> caused below changes:
>>>>>
>>>> [...]
>>>>
>>>>> [    8.953192] BUG: sleeping function called from invalid context at =
mm/page_alloc.c:3746
>>>>> [    8.956353] in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swap=
per/0
>>>>
>>>> I am observing similar BUG/backtrace even on ARM64 platform.
>>>
>>> Does the (untested) patch below help?

Yes it didn't work for me either. Adding the log from my setup(in case
it's useful)

Regards,
Sudeep


--->8

BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
1 lock held by swapper/0/1:
 #0:   (&sig->cred_guard_mutex ){+.+.+.}, at:   prepare_bprm_creds+0x2c/0x70
irq event stamp: 508063
hardirqs last  enabled at (508062):  __netdev_alloc_skb+0x11c/0x160
hardirqs last disabled at (508063):  __slab_alloc.isra.22.constprop.26+0x30=
/0x90
softirqs last  enabled at (508052):  xprt_end_transmit+0x4c/0x60
softirqs last disabled at (508053):  do_softirq.part.4+0x7c/0x98
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-rc7-next-20161130-00010-ga0=
f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 new_slab+0xa4/0x558
 ___slab_alloc.constprop.27+0x2f8/0x378
 __slab_alloc.isra.22.constprop.26+0x4c/0x90
 kmem_cache_alloc+0x388/0x430
 __build_skb+0x34/0xc0
 __netdev_alloc_skb+0xf0/0x160
 smsc911x_poll+0x9c/0x280
 net_rx_action+0x200/0x510
 __do_softirq+0x12c/0x6fc
 do_softirq.part.4+0x7c/0x98
 __local_bh_enable_ip+0x110/0x138
 _raw_spin_unlock_bh+0x40/0x50
 xprt_end_transmit+0x4c/0x60
 call_transmit_status+0x58/0x100
 call_transmit+0x178/0x1e8
 __rpc_execute+0xa0/0x680
 rpc_execute+0xb4/0x298
 rpc_run_task+0x11c/0x168
 nfs4_call_sync_sequence+0x6c/0x98
 _nfs4_proc_access+0xe8/0x170
 nfs4_proc_access+0x88/0x2a0
 nfs_do_access+0x458/0x778
 nfs_permission+0x2c8/0x2f8
 __inode_permission+0xa0/0x100
 inode_permission+0x2c/0x70
 link_path_walk+0x98/0x518
 path_openat+0x74/0x340
 do_filp_open+0x70/0xf8
 do_open_execat+0x70/0x1a0
 do_execveat_common.isra.14+0x288/0x998
 do_execve+0x44/0x58
 run_init_process+0x38/0x48
 try_to_run_init_process+0x20/0x58
 kernel_init+0xb4/0x108
 ret_from_fork+0x10/0x30
BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 98, name: kworker/0:1
3 locks held by kworker/0:1/98:
 #0: ("rpciod" ){.+.+..} , at: process_one_work+0x198/0x818
 #1: ((&task->u.tk_work)){+.+...}, at: process_one_work+0x198/0x818
 #2: (&(&clnt->cl_lock)->rlock){+.+...}, at: rpc_task_release_client+0x38/0=
xb0
irq event stamp: 31359
hardirqs last  enabled at (31358):  _raw_spin_unlock_irqrestore+0x84/0x90
hardirqs last disabled at (31359):  __netdev_alloc_skb+0xa8/0x160
softirqs last  enabled at (31252):  rpc_wake_up_first_on_wq+0x84/0x200
softirqs last disabled at (31255):  irq_exit+0xe8/0x148
CPU: 0 PID: 98 Comm: kworker/0:1 Tainted: G        W       4.9.0-rc7-next-2=
0161130-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Workqueue: rpciod rpc_async_schedule
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 __alloc_page_frag+0xa8/0x158
 __netdev_alloc_skb+0xcc/0x160
 smsc911x_poll+0x9c/0x280
 net_rx_action+0x200/0x510
 __do_softirq+0x12c/0x6fc
 irq_exit+0xe8/0x148
 __handle_domain_irq+0x6c/0xc0
 gic_handle_irq+0x5c/0xb0
BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 1326, name: kworker/0:1H
4 locks held by kworker/0:1H/1326:
 #0: ("xprtiod"){.+.+.+}, at: process_one_work+0x198/0x818
 #1: ((&transport->recv_worker)){+.+...}, at: process_one_work+0x198/0x818
 #2: (&new->recv_mutex){+.+...}, at: xs_tcp_data_receive_workfn+0x4c/0x2f8
 #3:  (sk_lock-AF_INET-RPC){+.+...}, at: xs_tcp_data_receive_workfn+0x74/0x=
2f8
irq event stamp: 41851
hardirqs last  enabled at (41850):  _raw_spin_unlock_irqrestore+0x84/0x90
hardirqs last disabled at (41851):  __netdev_alloc_skb+0xa8/0x160
softirqs last  enabled at (41836):  xs_tcp_data_recv+0x580/0x960
softirqs last disabled at (41843):  irq_exit+0xe8/0x148
CPU: 0 PID: 1326 Comm: kworker/0:1H Tainted: G        W       4.9.0-rc7-nex=
t-20161130-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Workqueue: xprtiod xs_tcp_data_receive_workfn
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 __alloc_page_frag+0xa8/0x158
 __netdev_alloc_skb+0xcc/0x160
 smsc911x_poll+0x9c/0x280
 net_rx_action+0x200/0x510
 __do_softirq+0x12c/0x6fc
 irq_exit+0xe8/0x148
 __handle_domain_irq+0x6c/0xc0
 gic_handle_irq+0x5c/0xb0
Exception stack(0xffff800974d4b9e0 to 0xffff800974d4bb10)
b9e0: ffff800974c59600 000000000001fc5a 0000800976db6000 fffffffffffffe50
ba00: 0000000000000004 0000000000000040 0000800976db6000 ffff000009353c38
ba20: 0000000000000001 00010643c0000000 c000000000100400 0010080000012144
ba40: 00012145c0000000 c000000000101000 0010180000010646 0000000000000000
ba60: 0000000000000000 0000000000000000 0000000000000000 ffff7e0025d34600
ba80: 00000000009f4d18 0000000000000040 0000000000000003 0000000000000000
baa0: ffff7e0025d34800 0000000000000001 000000000018bce1 ffff800974c0c830
bac0: 0000000000000000 ffff800974d4bb10 ffff00000821b9bc ffff800974d4bb10
bae0: ffff00000821b9c0 0000000060000045 0000000000000040 0000000000000000
bb00: ffffffffffffffff ffff00000821b9bc
 el1_irq+0xb8/0x130
 __free_pages_ok+0x1d0/0x4b0
 __free_page_frag+0x78/0x88
 skb_free_head+0x3c/0x48
 skb_release_data+0xd0/0xf8
 skb_release_all+0x30/0x40
 __kfree_skb+0x20/0x38
 tcp_read_sock+0x118/0x1d8
 xs_tcp_data_receive_workfn+0x84/0x2f8
 process_one_work+0x248/0x818
 worker_thread+0x54/0x438
 kthread+0xe0/0xf8
 ret_from_fork+0x10/0x30
BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 6, name: ksoftirqd/0
no locks held by ksoftirqd/0/6.
irq event stamp: 76667
hardirqs last  enabled at (76666):   _raw_spin_unlock_irqrestore+0x84/0x90
hardirqs last disabled at (76667):   __netdev_alloc_skb+0xa8/0x160
softirqs last  enabled at (76506):   __do_softirq+0x5f4/0x6fc
softirqs last disabled at (76511):   run_ksoftirqd+0x40/0xb0
CPU: 0 PID: 6 Comm: ksoftirqd/0 Tainted: G        W       4.9.0-rc7-next-20=
161130-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 __alloc_page_frag+0xa8/0x158
 __netdev_alloc_skb+0xcc/0x160
 smsc911x_poll+0x9c/0x280
 net_rx_action+0x200/0x510
 __do_softirq+0x12c/0x6fc
 run_ksoftirqd+0x40/0xb0
 smpboot_thread_fn+0x1d4/0x308
 kthread+0xe0/0xf8
 ret_from_fork+0x10/0x30
BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 6, name: ksoftirqd/0
no locks held by ksoftirqd/0/6.
irq event stamp: 121831
hardirqs last  enabled at (121830):   _raw_spin_unlock_irqrestore+0x84/0x90
hardirqs last disabled at (121831):   __netdev_alloc_skb+0xa8/0x160
softirqs last  enabled at (121742):   __do_softirq+0x5f4/0x6fc
softirqs last disabled at (121747):   run_ksoftirqd+0x40/0xb0
CPU: 0 PID: 6 Comm: ksoftirqd/0 Tainted: G        W       4.9.0-rc7-next-20=
161130-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 __alloc_page_frag+0xa8/0x158
 __netdev_alloc_skb+0xcc/0x160
 smsc911x_poll+0x9c/0x280
 net_rx_action+0x200/0x510
 __do_softirq+0x12c/0x6fc
 run_ksoftirqd+0x40/0xb0
 smpboot_thread_fn+0x1d4/0x308
 kthread+0xe0/0xf8
 ret_from_fork+0x10/0x30
NET: Registered protocol family 10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
suspicious RCU usage. ]
4.9.0-rc7-next-20161130-00010-ga0f9af725c5d #218 Tainted: G        W
-------------------------------
kernel/sched/core.c:7747 Illegal context switch in RCU-bh read-side critica=
l section!

other info that might help us debug this:

rcu_scheduler_active =3D 1, debug_locks =3D 1
3 locks held by systemd/1:
 #0: (rtnl_mutex ){+.+.+.}, at: rtnl_lock+0x20/0x28
 #1: (rcu_read_lock_bh){......}, at: ipv6_add_addr+0x70/0x548 [ipv6]
 #2: (addrconf_hash_lock){+.....}, at: ipv6_add_addr+0x194/0x548 [ipv6]

stack backtrace:
CPU: 3 PID: 1 Comm: systemd Tainted: G        W       4.9.0-rc7-next-201611=
30-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 lockdep_rcu_suspicious+0xcc/0x110
 ___might_sleep+0x1e0/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 new_slab+0xa4/0x558
 ___slab_alloc.constprop.27+0x2f8/0x378
 __slab_alloc.isra.22.constprop.26+0x4c/0x90
 kmem_cache_alloc+0x388/0x430
 dst_alloc+0x5c/0xb0
 __ip6_dst_alloc+0x3c/0xa0 [ipv6]
 ip6_dst_alloc+0x38/0x108 [ipv6]
 addrconf_dst_alloc+0x4c/0x130 [ipv6]
 ipv6_add_addr+0x274/0x548 [ipv6]
 add_addr+0x4c/0xd8 [ipv6]
 addrconf_notify+0x5c4/0xa98 [ipv6]
 register_netdevice_notifier+0x1e0/0x1e8
 addrconf_init+0xb8/0x270 [ipv6]
 inet6_init+0x180/0x330 [ipv6]
 do_one_initcall+0x44/0x138
 do_init_module+0x64/0x1d0
 load_module+0x1230/0x1560
 SyS_finit_module+0x120/0x130
 el0_svc_naked+0x24/0x28
BUG: sleeping function called from invalid context at mm/page_alloc.c:3775
in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: systemd
3 locks held by systemd/1:
 #0:   (rtnl_mutex){+.+.+.} , at:   rtnl_lock+0x20/0x28
 #1:   (rcu_read_lock_bh){......}, at:   ipv6_add_addr+0x70/0x548 [ipv6]
 #2:   (addrconf_hash_lock){+.....}, at: ipv6_add_addr+0x194/0x548 [ipv6]
irq event stamp: 619543
hardirqs last  enabled at (619541):   __local_bh_enable_ip+0x88/0x138
hardirqs last disabled at (619543):   __slab_alloc.isra.22.constprop.26+0x3=
0/0x90
softirqs last  enabled at (619540):   ipv6_mc_up+0x4c/0x58 [ipv6]
softirqs last disabled at (619542):   ipv6_add_addr+0x70/0x548 [ipv6]
CPU: 3 PID: 1 Comm: systemd Tainted: G        W       4.9.0-rc7-next-201611=
30-00010-ga0f9af725c5d #218
Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development P=
latform, BIOS EDK II Nov 29 2016
Call trace:
 dump_backtrace+0x0/0x260
 show_stack+0x24/0x30
 dump_stack+0xac/0xe8
 ___might_sleep+0x14c/0x1f8
 __alloc_pages_nodemask+0x414/0xef0
 new_slab+0xa4/0x558
 ___slab_alloc.constprop.27+0x2f8/0x378
 __slab_alloc.isra.22.constprop.26+0x4c/0x90
 kmem_cache_alloc+0x388/0x430
 dst_alloc+0x5c/0xb0
 __ip6_dst_alloc+0x3c/0xa0 [ipv6]
 ip6_dst_alloc+0x38/0x108 [ipv6]
 addrconf_dst_alloc+0x4c/0x130 [ipv6]
 ipv6_add_addr+0x274/0x548 [ipv6]
 add_addr+0x4c/0xd8 [ipv6]
 addrconf_notify+0x5c4/0xa98 [ipv6]
 register_netdevice_notifier+0x1e0/0x1e8
 addrconf_init+0xb8/0x270 [ipv6]
 inet6_init+0x180/0x330 [ipv6]
 do_one_initcall+0x44/0x138
 do_init_module+0x64/0x1d0
 load_module+0x1230/0x1560
 SyS_finit_module+0x120/0x130
 el0_svc_naked+0x24/0x28

--===============2414021621907311948==--


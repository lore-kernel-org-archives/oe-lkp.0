Content-Type: multipart/mixed; boundary="===============8436371430332730712=="
MIME-Version: 1.0
From: Baowen Zheng <baowen.zheng@corigine.com>
To: lkp@lists.01.org
Subject: Re: [flow_offload] 28798f55fe: WARNING:suspicious_RCU_usage
Date: Thu, 23 Dec 2021 06:42:48 +0000
Message-ID: <
 <DM5PR1301MB21721A449C25961B2009ABE2E77E9@DM5PR1301MB2172.namprd13.prod.outlook.com>>
In-Reply-To: <20211223063453.GC33629@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8436371430332730712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver Sang, thanks for bring this issue to us, we have got this issue a=
nd post the patch to fix this issue, the patch link is:
https://lore.kernel.org/netdev/1640147146-4294-1-git-send-email-baowen.zhen=
g(a)corigine.com/T/#u

on December 23, 2021 2:35 PM, Oliver Sang wrote:
>Greeting,
>
>FYI, we noticed the following commit (built with gcc-9):
>
>commit: 28798f55fed6319f8ffc4e29889fedbf48414368 ("[PATCH v8 net-next
>06/13] flow_offload: allow user to offload tc action to net device")
>url: https://github.com/0day-ci/linux/commits/Simon-Horman/allow-user-to-
>offload-tc-action-to-net-device/20211218-022033
>base: https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git
>86df8be67f6ca85d14fd469f1d1bcc3eee8f713e
>patch link: https://lore.kernel.org/lkml/20211217181629.28081-7-
>simon.horman(a)corigine.com
>
>in testcase: kernel-selftests
>version: kernel-selftests-x86_64-a1616593-1_20211221
>with following parameters:
>
>	group: tc-testing
>	ucode: 0xe2
>
>test-description: The kernel contains a set of "self tests" under the
>tools/testing/selftests/ directory. These are intended to be small unit te=
sts to
>exercise individual code paths in the kernel.
>test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
>on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G
>memory
>
>caused below changes (please refer to attached dmesg/kmsg for entire
>log/backtrace):
>
>
>
>If you fix the issue, kindly add following tag
>Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>[  267.826422][T12702] WARNING: suspicious RCU usage
>[  267.831169][T12702] 5.16.0-rc5-01343-g28798f55fed6 #1 Not tainted
>[  267.837331][T12702] ----------------------------- [  267.842078][T12702]
>include/net/tc_act/tc_tunnel_key.h:33 suspicious rcu_dereference_protected=
()
>usage!
>[  267.851547][T12702]
>[  267.851547][T12702] other info that might help us debug this:
>[  267.851547][T12702]
>[  267.861709][T12702]
>[  267.861709][T12702] rcu_scheduler_active =3D 2, debug_locks =3D 1
>[  267.869694][T12702] 1 lock held by tc/12702:
>[267.874017][T12702] #0: ffffffff85e87d08 (rtnl_mutex){+.+.}-{3:3}, at:
>tc_action_load_ops (net/sched/act_api.c:1071) [  267.883433][T12702]
>[  267.883433][T12702] stack backtrace:
>[  267.889224][T12702] CPU: 2 PID: 12702 Comm: tc Not tainted 5.16.0-rc5-
>01343-g28798f55fed6 #1 [  267.897730][T12702] Hardware name: Dell Inc.
>OptiPlex 7040/0Y7WYT, BIOS 1.8.1 12/05/2017 [  267.905867][T12702] Call
>Trace:
>[  267.909029][T12702]  <TASK>
>[267.911840][T12702] dump_stack_lvl (lib/dump_stack.c:107)
>[267.916228][T12702] tcf_tunnel_key_offload_act_setup
>(include/net/tc_act/tc_tunnel_key.h:33 net/sched/act_tunnel_key.c:832)
>act_tunnel_key [267.923847][T12702] tcf_action_offload_add
>(net/sched/act_api.c:152 net/sched/act_api.c:185) [267.929098][T12702] ?
>tc_lookup_action_n (net/sched/act_api.c:173) [267.934028][T12702] ?
>rcu_read_lock_sched_held (kernel/rcu/update.c:306) [267.939629][T12702] ?
>__nla_validate_parse (include/net/netlink.h:1159 (discriminator 1)
>lib/nlattr.c:576 (discriminator 1)) [267.944805][T12702] tcf_action_init
>(net/sched/act_api.c:1198) [267.949455][T12702] ? tcf_action_init_1
>(net/sched/act_api.c:1161) [267.954445][T12702] ?
>lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4885)
>[267.960380][T12702] ? __lock_acquire (arch/x86/include/asm/bitops.h:214
>(discriminator 9) include/asm-generic/bitops/instrumented-non-atomic.h:135
>(discriminator 9) kernel/locking/lockdep.c:199 (discriminator 9)
>kernel/locking/lockdep.c:5024 (discriminator 9)) [267.965240][T12702]
>tcf_action_add (net/sched/act_api.c:1605) [267.969712][T12702] ?
>tca_action_gd (net/sched/act_api.c:1596) [267.974364][T12702] ? __alloc_skb
>(net/core/skbuff.c:414) [267.978873][T12702] ? memset
>(mm/kasan/shadow.c:44) [267.982732][T12702] ? __nla_validate_parse
>(include/net/netlink.h:1159 (discriminator 1) lib/nlattr.c:576 (discrimina=
tor 1))
>[267.987905][T12702] tc_ctl_action (net/sched/act_api.c:1664)
>[267.992388][T12702] ? tcf_action_add (net/sched/act_api.c:1630)
>[267.997123][T12702] ? lock_is_held_type (kernel/locking/lockdep.c:438
>kernel/locking/lockdep.c:5681) [268.002033][T12702] rtnetlink_rcv_msg
>(net/core/rtnetlink.c:5570) [268.006852][T12702] ? rtnl_calcit+0x380/0x380
>[268.011935][T12702] ? lock_is_held_type (kernel/locking/lockdep.c:438
>kernel/locking/lockdep.c:5681) [268.016839][T12702] ? netlink_deliver_tap
>(include/linux/rcupdate.h:720 net/netlink/af_netlink.c:336)
>[268.022009][T12702] netlink_rcv_skb (net/netlink/af_netlink.c:2492)
>[268.026648][T12702] ? rtnl_calcit+0x380/0x380 [268.031727][T12702] ?
>netlink_ack (net/netlink/af_netlink.c:2469) [268.036198][T12702] ?
>netlink_deliver_tap (include/linux/rcupdate.h:273
>include/linux/rcupdate.h:721 net/netlink/af_netlink.c:336)
>[268.041360][T12702] ? _copy_from_iter (lib/iov_iter.c:767 (discriminator =
8))
>[268.046183][T12702] netlink_unicast (net/netlink/af_netlink.c:1316
>net/netlink/af_netlink.c:1341) [268.050827][T12702] ? netlink_attachskb
>(net/netlink/af_netlink.c:1326) [268.055819][T12702] ? __check_object_size
>(mm/usercopy.c:240 mm/usercopy.c:286 mm/usercopy.c:256)
>[268.060987][T12702] netlink_sendmsg (net/netlink/af_netlink.c:1917)
>[268.065632][T12702] ? netlink_unicast (net/netlink/af_netlink.c:1837)
>[268.070448][T12702] ? __import_iovec (lib/iov_iter.c:1949)
>[268.075093][T12702] ? netlink_unicast (net/netlink/af_netlink.c:1837)
>[268.079910][T12702] sock_sendmsg (net/socket.c:704 net/socket.c:724)
>[268.084204][T12702] ____sys_sendmsg (net/socket.c:2409)
>[268.088849][T12702] ? kernel_sendmsg (net/socket.c:2356)
>[268.093416][T12702] ? __copy_msghdr_from_user (net/socket.c:2338)
>[268.098935][T12702] ? filemap_map_pages (mm/filemap.c:3347)
>[268.104022][T12702] ___sys_sendmsg (net/socket.c:2465)
>[268.108493][T12702] ? sendmsg_copy_msghdr (net/socket.c:2452)
>[268.113492][T12702] ? lock_is_held_type (kernel/locking/lockdep.c:438
>kernel/locking/lockdep.c:5681) [268.118395][T12702] ? do_user_addr_fault
>(arch/x86/mm/fault.c:1423) [268.123473][T12702] ?
>rcu_read_lock_sched_held (include/linux/lockdep.h:283
>kernel/rcu/update.c:125) [268.128984][T12702] ? rcu_read_lock_bh_held
>(kernel/rcu/update.c:120) [268.134154][T12702] ? find_held_lock
>(kernel/locking/lockdep.c:5130) [268.138805][T12702] ? lock_release
>(kernel/locking/lockdep.c:438 kernel/locking/lockdep.c:5659)
>[268.143370][T12702] ? lock_downgrade (kernel/locking/lockdep.c:5645)
>[268.148107][T12702] ? __fget_light (arch/x86/include/asm/atomic.h:29
>include/linux/atomic/atomic-instrumented.h:28 fs/file.c:1003)
>[268.152584][T12702] ? sockfd_lookup_light (net/socket.c:550)
>[268.157677][T12702] __sys_sendmsg (include/linux/file.h:32
>net/socket.c:2494) [268.162064][T12702] ? __sys_sendmsg_sock
>(net/socket.c:2480) [268.166970][T12702] ? syscall_enter_from_user_mode
>(kernel/entry/common.c:107) [268.172754][T12702] ? lock_is_held_type
>(kernel/locking/lockdep.c:438 kernel/locking/lockdep.c:5681)
>[268.177658][T12702] ? lockdep_hardirqs_on_prepare
>(kernel/locking/lockdep.c:438 kernel/locking/lockdep.c:4293
>kernel/locking/lockdep.c:4244) [268.183521][T12702] ?
>syscall_enter_from_user_mode (arch/x86/include/asm/irqflags.h:45
>arch/x86/include/asm/irqflags.h:80 kernel/entry/common.c:107)
>[268.189315][T12702] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4356)
>[268.194395][T12702] do_syscall_64 (arch/x86/entry/common.c:50
>arch/x86/entry/common.c:80) [268.198690][T12702] ? asm_exc_page_fault
>(arch/x86/include/asm/idtentry.h:568)
>[268.203593][T12702] ? asm_exc_page_fault
>(arch/x86/include/asm/idtentry.h:568)
>[268.208420][T12702] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4356)
>[268.213496][T12702] entry_SYSCALL_64_after_hwframe
>(arch/x86/entry/entry_64.S:113) [  268.219266][T12702] RIP:
>0033:0x7fb425eb6914 [ 268.223558][T12702] Code: 00 f7 d8 64 89 02 48 c7 c0
>ff ff ff ff eb b5 0f 1f 80 00 00 00 00 48 8d 05 e9 5d 0c 00 8b 00 85 c0 75=
 13 b8 2e
>00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 41 54 41 89 d4 55 48 =
89 f5 53
>All code =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 f7                	add    %dh,%bh
>   2:	d8 64 89 02          	fsubs  0x2(%rcx,%rcx,4)
>   6:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
>   d:	eb b5                	jmp    0xffffffffffffffc4
>   f:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
>  16:	48 8d 05 e9 5d 0c 00 	lea    0xc5de9(%rip),%rax        # 0xc5e06
>  1d:	8b 00                	mov    (%rax),%eax
>  1f:	85 c0                	test   %eax,%eax
>  21:	75 13                	jne    0x36
>  23:	b8 2e 00 00 00       	mov    $0x2e,%eax
>  28:	0f 05                	syscall
>  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<--
>trapping instruction
>  30:	77 54                	ja     0x86
>  32:	c3                   	retq
>  33:	0f 1f 00             	nopl   (%rax)
>  36:	41 54                	push   %r12
>  38:	41 89 d4             	mov    %edx,%r12d
>  3b:	55                   	push   %rbp
>  3c:	48 89 f5             	mov    %rsi,%rbp
>  3f:	53                   	push   %rbx
>
>Code starting with the faulting instruction
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
>   6:	77 54                	ja     0x5c
>   8:	c3                   	retq
>   9:	0f 1f 00             	nopl   (%rax)
>   c:	41 54                	push   %r12
>   e:	41 89 d4             	mov    %edx,%r12d
>  11:	55                   	push   %rbp
>  12:	48 89 f5             	mov    %rsi,%rbp
>  15:	53                   	push   %rbx
>
>
>To reproduce:
>
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        sudo bin/lkp install job.yaml           # job file is attached in =
this email
>        bin/lkp split-job --compatible job.yaml # generate the yaml file f=
or lkp run
>        sudo bin/lkp run generated-yaml-file
>
>        # if come across any failure that blocks the test,
>        # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
>---
>0DAY/LKP+ Test Infrastructure                   Open Source Technology Cen=
ter
>https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpor=
ation
>
>Thanks,
>Oliver Sang


--===============8436371430332730712==--


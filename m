Content-Type: multipart/mixed; boundary="===============7722916497648457301=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [thp] kernel BUG at mm/swap.c:122!
Date: Sat, 02 Aug 2014 11:21:04 +0800
Message-ID: <20140802032104.GA11701@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7722916497648457301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed BUG on

git://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git thp/refcounting=
/v2
commit b944f9cf9953291c5309ac4132c5ce2b38e740b0 ("thp: implement new split_=
huge_page()")

[  254.545352] page flags: 0x100000000008004(referenced|tail)
[  254.546641] page dumped because: VM_BUG_ON_PAGE(page_mapcount(page) !=3D=
 0)
[  254.547846] ------------[ cut here ]------------
[  254.548811] kernel BUG at mm/swap.c:122!
[  254.548811] invalid opcode: 0000 [#1] SMP =

[  254.548811] Modules linked in: snd_pcsp
[  254.548811] CPU: 0 PID: 6213 Comm: psock_tpacket Not tainted 3.16.0-rc4-=
next-20140709-00023-gb944f9c #676
[  254.548811] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
[  254.548811] task: ffff88003d260000 ti: ffff88003df84000 task.ti: ffff880=
03df84000
[  254.548811] RIP: 0010:[<ffffffff81148c2a>]  [<ffffffff81148c2a>] put_com=
pound_page+0x8e/0xfc
[  254.548811] RSP: 0018:ffff880038203d70  EFLAGS: 00010246
[  254.548811] RAX: 000000000000003d RBX: ffff88003dcad8c0 RCX: ffffffff810=
b2047
[  254.548811] RDX: 0000000000000003 RSI: ffff88003d260870 RDI: 00000000000=
00246
[  254.548811] RBP: ffff880038203d70 R08: 0000000000000001 R09: 00000000000=
00000
[  254.548811] R10: 0000000000021700 R11: 0000000000000000 R12: 00000000000=
00001
[  254.548811] R13: ffffffff81a39de0 R14: 0000000000000008 R15: ffff88003dc=
ad8c0
[  254.548811] FS:  00007f1a79e94700(0000) GS:ffff880038200000(0000) knlGS:=
0000000000000000
[  254.548811] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[  254.548811] CR2: 00007f1a79a43060 CR3: 000000003d04a000 CR4: 00000000000=
006f0
[  254.548811] DR0: 0000000000602118 DR1: 0000000000000000 DR2: 00000000000=
00000
[  254.548811] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 00000000000=
00600
[  254.548811] Stack:
[  254.548811]  ffff880038203d80 ffffffff8114902d ffff880038203da0 ffffffff=
819dde37
[  254.548811]  ffff88003dcad8c0 ffff88003dcad8c0 ffff880038203db8 ffffffff=
819ddeba
[  254.548811]  ffff88003dcad8c0 ffff880038203dd0 ffffffff819dded3 ffff8800=
3dcad8c0
[  254.548811] Call Trace:
[  254.548811]  <IRQ> =

[  254.548811]  [<ffffffff8114902d>] put_page+0x17/0x3d
[  254.548811]  [<ffffffff819dde37>] skb_release_data+0x9e/0xfd
[  254.548811]  [<ffffffff819ddeba>] skb_release_all+0x24/0x27
[  254.548811]  [<ffffffff819dded3>] __kfree_skb+0x16/0x6d
[  254.548811]  [<ffffffff819ddf77>] kfree_skb+0x4d/0x80
[  254.548811]  [<ffffffff81a39de0>] ip_rcv+0x2d2/0x2df
[  254.548811]  [<ffffffff819e8061>] __netif_receive_skb_core+0x3ef/0x4af
[  254.548811]  [<ffffffff819e7cff>] ? __netif_receive_skb_core+0x8d/0x4af
[  254.548811]  [<ffffffff819e84fc>] __netif_receive_skb+0x1d/0x5f
[  254.548811]  [<ffffffff819e982d>] process_backlog+0xba/0x15b
[  254.548811]  [<ffffffff819e9659>] net_rx_action+0xf6/0x210
[  254.548811]  [<ffffffff8107d5b5>] ? __do_softirq+0xa4/0x2b1
[  254.548811]  [<ffffffff8107d627>] __do_softirq+0x116/0x2b1
[  254.548811]  [<ffffffff81b3045c>] do_softirq_own_stack+0x1c/0x30
[  254.548811]  <EOI> =

[  254.548811]  [<ffffffff8107d867>] do_softirq+0x40/0x68
[  254.548811]  [<ffffffff819eb1be>] ? __dev_queue_xmit+0x520/0x5b5
[  254.548811]  [<ffffffff8107d934>] __local_bh_enable_ip+0xa5/0xbe
[  254.548811]  [<ffffffff819eb1e7>] __dev_queue_xmit+0x549/0x5b5
[  254.548811]  [<ffffffff819eaca3>] ? __dev_queue_xmit+0x5/0x5b5
[  254.548811]  [<ffffffff819eb263>] dev_queue_xmit+0x10/0x12
[  254.548811]  [<ffffffff81ace5c4>] packet_sendmsg+0x6de/0xcbe
[  254.548811]  [<ffffffff819d2e49>] sock_sendmsg+0x6e/0x7f
[  254.548811]  [<ffffffff8106a39f>] ? kvm_clock_read+0x27/0x31
[  254.548811]  [<ffffffff81041474>] ? sched_clock+0x9/0xd
[  254.548811]  [<ffffffff811a366d>] ? __fdget+0x13/0x15
[  254.548811]  [<ffffffff819d3447>] ? sockfd_lookup_light+0x17/0x60
[  254.548811]  [<ffffffff819d598f>] SyS_sendto+0x111/0x142
[  254.548811]  [<ffffffff8106a39f>] ? kvm_clock_read+0x27/0x31
[  254.548811]  [<ffffffff8106a3b2>] ? kvm_clock_get_cycles+0x9/0xb
[  254.548811]  [<ffffffff81b2e815>] ? sysret_check+0x22/0x5d
[  254.548811]  [<ffffffff810b4c54>] ? trace_hardirqs_on_caller+0x17f/0x19b
[  254.548811]  [<ffffffff8149548b>] ? trace_hardirqs_on_thunk+0x3a/0x3f
[  254.548811]  [<ffffffff81b2e7e9>] system_call_fastpath+0x16/0x1b
[  254.548811] Code: c0 00 00 74 14 48 8b 17 48 89 f9 80 e6 80 74 04 48 8b =
4f 30 8b 51 48 ff c2 01 f2 ff c2 74 0e 48 c7 c6 08 cc f6 81 e8 24 a3 ff ff =
<0f> 0b 8b 50 1c 85 d2 75 11 48 c7 c6 c3 c4 f6 81 48 89 c7 e8 0c =

[  254.548811] RIP  [<ffffffff81148c2a>] put_compound_page+0x8e/0xfc
[  254.548811]  RSP <ffff880038203d70>
[  254.628679] ---[ end trace df8c79f4ef8d3beb ]---
[  254.629595] Kernel panic - not syncing: Fatal exception in interrupt

Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============7722916497648457301==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWFrZSBydW5fdGVzdHMgLUMgYnJlYWtwb2ludHMKbWFrZSBydW5fdGVzdHMgLUMgaXBjCm1ha2Ug
cnVuX3Rlc3RzIC1DIGtjbXAKbWFrZSBydW5fdGVzdHMgLUMgbXF1ZXVlCm1ha2UgcnVuX3Rlc3Rz
IC1DIG5ldAo=

--===============7722916497648457301==--


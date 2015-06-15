Content-Type: multipart/mixed; boundary="===============6321630854070677345=="
MIME-Version: 1.0
From: Tom Herbert <tom@herbertland.com>
To: lkp@lists.01.org
Subject: Re: [flow_dissector] 6a74fcf426f: RIP: 0010:[<ffffffff8177ffc9>] [<ffffffff8177ffc9>] __skb_flow_dissect+0x659/0x830
Date: Mon, 15 Jun 2015 11:12:18 -0700
Message-ID: <CALx6S35uiGYw3_LNbb=UE8CWFOo+W4V8bsL+7phCZbt8FoO5JA@mail.gmail.com>
In-Reply-To: <557E6CB2.5050909@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6321630854070677345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2015 at 11:12 PM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> git://flatbed.openfabrics.org/~amirv/linux.git for-upstream
> commit 6a74fcf426f51aaa569f0b973d10ac20468df238 ("flow_dissector: add sup=
port for dst, hop-by-hop and routing ext hdrs")
>
Fix was pushed to net-next, commit
1e98a0f08abddde87f0f93237f10629ecb4880ef ("flow_dissector: fix ipv6
dst, hop-by-hop and routing ext hdrs")

Thanks

>
> +------------------------------------------------+------------+----------=
--+
> |                                                | 611d23c559 | 6a74fcf42=
6 |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 13         | 14       =
  |
> | boot_failures                                  | 0          | 12       =
  |
> | RIP:__skb_flow_dissect                         | 0          | 8        =
  |
> | Kernel_panic-not_syncing:softlockup:hung_tasks | 0          | 12       =
  |
> | RIP:skb_copy_bits                              | 0          | 4        =
  |
> +------------------------------------------------+------------+----------=
--+
>
>
> [   10.691510] random: systemd urandom read with 16 bits of entropy avail=
able
> [   30.147484] random: nonblocking pool is initialized
> [   38.270110] NMI watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [swa=
pper/7:0]
> [   38.278272] Modules linked in:
> [   38.281688] CPU: 7 PID: 0 Comm: swapper/7 Not tainted 4.1.0-rc7-05001-=
gd94988d #1
> [   38.290042] Hardware name: Intel Corporation S5520UR/S5520UR, BIOS S55=
00.86B.01.00.0050.050620101605 05/06/2010
> [   38.301305] task: ffff8801e86258e0 ti: ffff8801e8634000 task.ti: ffff8=
801e8634000
> [   38.309660] RIP: 0010:[<ffffffff8177ffc9>]  [<ffffffff8177ffc9>] __skb=
_flow_dissect+0x659/0x830
> [   38.319415] RSP: 0000:ffff88036fac39b8  EFLAGS: 00000292
> [   38.325343] RAX: 00000000fffffff2 RBX: 000000000000dd86 RCX: 000000000=
0000002
> [   38.333307] RDX: ffff88036fac39e0 RSI: 000000003388fa16 RDI: ffff88008=
299a400
> [   38.341273] RBP: ffff88036fac3a38 R08: 000000000000dd86 R09: 000000003=
388fa16
> [   38.349238] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88036=
fac3928
> [   38.357202] R13: ffffffff818d123e R14: ffff88036fac3a38 R15: ffffffff8=
1e688d0
> [   38.365175] FS:  0000000000000000(0000) GS:ffff88036fac0000(0000) knlG=
S:0000000000000000
> [   38.374209] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [   38.380621] CR2: 0000000000000000 CR3: 000000036ecaf000 CR4: 000000000=
00006e0
> [   38.388584] Stack:
> [   38.390825]  223080006fac39f8 ffff88000000dd86 ffffc9003388fa16 ffff88=
036fac3a64
> [   38.399121]  000000035eb53802 2230000000000000 0000000000000000 ffff88=
008299a400
> [   38.407416]  ffff88036fac3ad0 0000000000000000 ffff88036fac3ac8 ffff88=
008299a400
> [   38.415712] Call Trace:
> [   38.418441]  <IRQ>
> [   38.420585]  [<ffffffff8178022a>] __skb_get_hash+0x8a/0x2f0
> [   38.427011]  [<ffffffff8178a584>] ? dev_hard_start_xmit+0x274/0x400
> [   38.434006]  [<ffffffff81782f79>] __skb_tx_hash+0x99/0xb0
> [   38.440030]  [<ffffffff817830e6>] __netdev_pick_tx+0x156/0x170
> [   38.446541]  [<ffffffff8178a82b>] netdev_pick_tx+0xab/0xf0
> [   38.452662]  [<ffffffff8178a901>] __dev_queue_xmit+0x91/0x550
> [   38.459077]  [<ffffffff8178add3>] dev_queue_xmit_sk+0x13/0x20
> [   38.465491]  [<ffffffff8183dddc>] ip6_finish_output2+0x2dc/0x490
> [   38.472196]  [<ffffffff813b38aa>] ? selinux_ipv6_postroute+0x1a/0x20
> [   38.479290]  [<ffffffff817bddf7>] ? nf_iterate+0x57/0x80
> [   38.485220]  [<ffffffff8184030f>] ip6_finish_output+0x8f/0xf0
> [   38.491634]  [<ffffffff818403b8>] ip6_output+0x48/0xf0
> [   38.497368]  [<ffffffff81840280>] ? ip6_fragment+0xaa0/0xaa0
> [   38.503688]  [<ffffffff81862747>] NF_HOOK_THRESH+0x27/0x80
> [   38.511071]  [<ffffffff8184e9e1>] ? icmp6_dst_alloc+0x121/0x190
> [   38.517679]  [<ffffffff8186290c>] mld_sendpack+0x16c/0x270
> [   38.523802]  [<ffffffff81863d2d>] mld_ifc_timer_expire+0x19d/0x2f0
> [   38.530701]  [<ffffffff81863b90>] ? mld_dad_timer_expire+0x70/0x70
> [   38.537601]  [<ffffffff810e2dc9>] call_timer_fn+0x39/0x140
> [   38.543724]  [<ffffffff81863b90>] ? mld_dad_timer_expire+0x70/0x70
> [   38.550624]  [<ffffffff810e4c7f>] run_timer_softirq+0x26f/0x340
> [   38.557232]  [<ffffffff8107bff9>] __do_softirq+0x119/0x2e0
> [   38.563355]  [<ffffffff8107c3f5>] irq_exit+0x125/0x130
> [   38.569091]  [<ffffffff818d3176>] smp_apic_timer_interrupt+0x46/0x60
> [   38.576182]  [<ffffffff818d123e>] apic_timer_interrupt+0x6e/0x80
> [   38.582886]  <EOI>
> [   38.585032]  [<ffffffff810f234b>] ? clockevents_switch_state+0x1b/0x60
> [   38.592525]  [<ffffffff8174004c>] ? cpuidle_enter_state+0xac/0x210
> [   38.599414]  [<ffffffff8174001f>] ? cpuidle_enter_state+0x7f/0x210
> [   38.606312]  [<ffffffff817401e7>] cpuidle_enter+0x17/0x20
> [   38.612338]  [<ffffffff810bdb4e>] cpu_startup_entry+0x38e/0x410
> [   38.618948]  [<ffffffff8104bde3>] start_secondary+0x143/0x170
> [   38.625360] Code: 32 4d 85 ed 74 2d 48 8d 55 a8 44 89 ce b9 02 00 00 0=
0 4c 89 ef 44 89 45 88 44 88 55 8c 44 89 4d 90 e8 4c 2f ff ff 44 0f b6 55 8=
c <44> 8b 45 88 44 8b 4d 90 0f b6 45 a9 44 0f b6 5d a8 8d 04 c5 08
> [   38.647067] Kernel panic - not syncing: softlockup: hung tasks
> [   38.653576] CPU: 7 PID: 0 Comm: swapper/7 Tainted: G             L  4.=
1.0-rc7-05001-gd94988d #1
> [   38.663288] Hardware name: Intel Corporation S5520UR/S5520UR, BIOS S55=
00.86B.01.00.0050.050620101605 05/06/2010
> [   38.674552]  000000000000000d ffff88036fac3750 ffffffff818c800a 000000=
00000045e8
> [   38.682848]  ffffffff81b9945c ffff88036fac37d0 ffffffff818c46bf 000000=
00000045d6
> [   38.691141]  0000000000000008 ffff88036fac37e0 ffff88036fac3780 ffff88=
036fac37d0
> [   38.699437] Call Trace:
> [   38.702165]  <IRQ>  [<ffffffff818c800a>] dump_stack+0x4c/0x65
> [   38.708590]  [<ffffffff818c46bf>] panic+0xc1/0x1f5
> [   38.713938]  [<ffffffff81126085>] watchdog_timer_fn+0x1f5/0x200
> [   38.720545]  [<ffffffff81125e90>] ? watchdog+0x50/0x50
> [   38.726279]  [<ffffffff810e5cd8>] __hrtimer_run_queues+0xd8/0x280
> [   38.733079]  [<ffffffff810e6078>] hrtimer_interrupt+0xa8/0x1c0
> [   38.739591]  [<ffffffff8104dc6c>] local_apic_timer_interrupt+0x3c/0x70
> [   38.746876]  [<ffffffff818d3171>] smp_apic_timer_interrupt+0x41/0x60
> [   38.753968]  [<ffffffff818d123e>] apic_timer_interrupt+0x6e/0x80
> [   38.760674]  [<ffffffff8177ffc9>] ? __skb_flow_dissect+0x659/0x830
> [   38.767572]  [<ffffffff8177ffc4>] ? __skb_flow_dissect+0x654/0x830
> [   38.774469]  [<ffffffff8178022a>] __skb_get_hash+0x8a/0x2f0
> [   38.780690]  [<ffffffff8178a584>] ? dev_hard_start_xmit+0x274/0x400
> [   38.787685]  [<ffffffff81782f79>] __skb_tx_hash+0x99/0xb0
> [   38.793710]  [<ffffffff817830e6>] __netdev_pick_tx+0x156/0x170
> [   38.800221]  [<ffffffff8178a82b>] netdev_pick_tx+0xab/0xf0
> [   38.806380]  [<ffffffff8178a901>] __dev_queue_xmit+0x91/0x550
> [   38.812794]  [<ffffffff8178add3>] dev_queue_xmit_sk+0x13/0x20
> [   38.819207]  [<ffffffff8183dddc>] ip6_finish_output2+0x2dc/0x490
> [   38.825910]  [<ffffffff813b38aa>] ? selinux_ipv6_postroute+0x1a/0x20
> [   38.833004]  [<ffffffff817bddf7>] ? nf_iterate+0x57/0x80
> [   38.838933]  [<ffffffff8184030f>] ip6_finish_output+0x8f/0xf0
> [   38.845346]  [<ffffffff818403b8>] ip6_output+0x48/0xf0
> [   38.851080]  [<ffffffff81840280>] ? ip6_fragment+0xaa0/0xaa0
> [   38.857398]  [<ffffffff81862747>] NF_HOOK_THRESH+0x27/0x80
> [   38.864781]  [<ffffffff8184e9e1>] ? icmp6_dst_alloc+0x121/0x190
> [   38.871388]  [<ffffffff8186290c>] mld_sendpack+0x16c/0x270
> [   38.877510]  [<ffffffff81863d2d>] mld_ifc_timer_expire+0x19d/0x2f0
> [   38.884407]  [<ffffffff81863b90>] ? mld_dad_timer_expire+0x70/0x70
> [   38.891305]  [<ffffffff810e2dc9>] call_timer_fn+0x39/0x140
> [   38.897428]  [<ffffffff81863b90>] ? mld_dad_timer_expire+0x70/0x70
> [   38.904327]  [<ffffffff810e4c7f>] run_timer_softirq+0x26f/0x340
> [   38.910935]  [<ffffffff8107bff9>] __do_softirq+0x119/0x2e0
> [   38.917058]  [<ffffffff8107c3f5>] irq_exit+0x125/0x130
> [   38.922792]  [<ffffffff818d3176>] smp_apic_timer_interrupt+0x46/0x60
> [   38.929885]  [<ffffffff818d123e>] apic_timer_interrupt+0x6e/0x80
> [   38.936588]  <EOI>  [<ffffffff810f234b>] ? clockevents_switch_state+0x=
1b/0x60
> [   38.944563]  [<ffffffff8174004c>] ? cpuidle_enter_state+0xac/0x210
> [   38.951463]  [<ffffffff8174001f>] ? cpuidle_enter_state+0x7f/0x210
> [   38.958362]  [<ffffffff817401e7>] cpuidle_enter+0x17/0x20
> [   38.964389]  [<ffffffff810bdb4e>] cpu_startup_entry+0x38e/0x410
> [   38.970997]  [<ffffffff8104bde3>] start_secondary+0x143/0x170
> [   38.977777] Kernel Offset: disabled
> ACPI MEMORY or I/O RESET_REG.
>
>
>
> Thanks,
> Ying Huang
> -------------------------------------
> lkp(a)eclists.intel.com
> https://eclists.intel.com/sympa/info/lkp
> Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "U=
nsubscribe lkp"
>
>

--===============6321630854070677345==--


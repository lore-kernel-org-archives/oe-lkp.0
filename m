Content-Type: multipart/mixed; boundary="===============6871026687193096851=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: [ 53.230885] RIP: 0010:[<ffffffff811b3557>] [<ffffffff811b3557>] qlink_free
Date: Mon, 01 Aug 2016 13:59:30 +0200
Message-ID: <CAG_fn=W0m8NgJuh2EEbsBr9kdrmkyjtmrxORygfNVsx2VkuQsA@mail.gmail.com>
In-Reply-To: <20160801014333.GC27215@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6871026687193096851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,


On Mon, Aug 1, 2016 at 3:43 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hi Alexander,
>
> FYI, your patch seems to disclose a bug.
>
> https://github.com/0day-ci/linux Alexander-Potapenko/mm-kasan-stackdepot-=
and-quarantine-for-SLUB/20160713-021523
>
> commit 85d9adbf58cdb6eb9101f64e99e10aed5271bbef
> Author:     Alexander Potapenko <glider@google.com>
> AuthorDate: Tue Jul 12 20:12:45 2016 +0200
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Jul 13 02:15:27 2016 +0800
>
>      mm, kasan: switch SLUB to stackdepot, enable memory quarantine for S=
LUB
>
>      For KASAN builds:
>       - switch SLUB allocator to using stackdepot instead of storing the
>         allocation/deallocation stacks in the objects;
>       - change the freelist hook so that parts of the freelist can be put
>         into the quarantine.
>
>      Signed-off-by: Alexander Potapenko <glider@google.com>
>
> +-----------------------------------------------------------+------------=
--------+-------------------+--------------------+
> |                                                           |     c840cd9=
07d     |    85d9adbf58     |  v4.7-rc7_072217   |
> +-----------------------------------------------------------+------------=
--------+-------------------+--------------------+
> | boot_successes                                            | 172        =
        | 12                | 1                  |
> | boot_failures                                             | 149        =
        | 74                | 31                 |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 147      =
          | 45                | 4                  |
> | timestamp.last                                            | 6784.847561=
0000005 | 6338.260496000002 | 1703.2160550000003 |
> | RIP:_raw_spin_unlock_irqrestore                           | 1          =
        |                   |                    |
> | Kernel_panic-not_syncing:softlockup:hung_tasks            | 2          =
        | 27                | 25                 |
> | backtrace:__pci_register_driver                           | 2          =
        | 27                | 25                 |
> | backtrace:virtio_pci_driver_init                          | 2          =
        | 27                | 25                 |
> | backtrace:do_basic_setup                                  | 2          =
        | 27                | 25                 |
> | backtrace:kernel_init_freeable                            | 2          =
        | 27                | 25                 |
> | RIP:T                                                     | 1          =
        | 7                 | 8                  |
> | IP-Config:Auto-configuration_of_network_failed            | 0          =
        | 2                 | 2                  |
> | RIP:qlink_free                                            | 0          =
        | 6                 | 6                  |
> | RIP:fgraph_trace                                          | 0          =
        | 4                 | 2                  |
> | RIP:print_context_stack                                   | 0          =
        | 3                 |                    |
> | RIP:save_stack_address                                    | 0          =
        | 1                 |                    |
> | RIP:is_module_text_address                                | 0          =
        | 2                 | 2                  |
> | RIP:__kernel_text_address                                 | 0          =
        | 4                 | 3                  |
> | RIP:ftrace_stub                                           | 0          =
        | 0                 | 1                  |
> | RIP:__module_text_address                                 | 0          =
        | 0                 | 1                  |
> | RIP:__module_address                                      | 0          =
        | 0                 | 2                  |
> +-----------------------------------------------------------+------------=
--------+-------------------+--------------------+
>
> [   25.468156] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
a2e6a714ac, max_idle_ns: 440795306413 ns
> [   25.472330] virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy dr=
iver
> [   53.184191] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swa=
pper:1]
> [   53.186917] Modules linked in:
> [   53.188237] irq event stamp: 4826090
> [   53.189543] hardirqs last  enabled at (4826089): [<ffffffff811b3544>] =
qlink_free+0xb4/0xf0
> [   53.192339] hardirqs last disabled at (4826090): [<ffffffff818dc8e5>] =
apic_timer_interrupt+0x85/0x90
> [   53.206320] softirqs last  enabled at (4825910): [<ffffffff818de09e>] =
__do_softirq+0x3ee/0x44c
> [   53.209186] softirqs last disabled at (4825903): [<ffffffff8107fe92>] =
irq_exit+0x52/0xa0
> [   53.211949] CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0-rc7-00002-g8=
5d9adb #1
> [   53.214479] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   53.228319] task: ffff88000c9d0040 ti: ffff88000c9d8000 task.ti: ffff8=
8000c9d8000
> [   53.230885] RIP: 0010:[<ffffffff811b3557>]  [<ffffffff811b3557>] qlink=
_free+0xc7/0xf0
> [   53.233602] RSP: 0000:ffff88000c9df2a8  EFLAGS: 00000282
> [   53.235189] RAX: ffff88000c9d0040 RBX: ffff880009e281a0 RCX: 000000000=
0000028
> [   53.237071] RDX: 0000000000000006 RSI: 0000000000000001 RDI: 000000000=
0000282
> [   53.238962] RBP: ffff88000c9df2c8 R08: 0000000000000001 R09: 000000000=
0000000
> [   53.251888] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88000=
c95fbc0
> [   53.253785] R13: 0000000000000282 R14: ffff880009e28318 R15: ffff88000=
c9df2d8
> [   53.255672] FS:  0000000000000000(0000) GS:ffffffff81e2e000(0000) knlG=
S:0000000000000000
> [   53.258328] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   53.259977] CR2: 0000000000000000 CR3: 0000000001e15000 CR4: 000000000=
00006f0
> [   53.272898] Stack:
> [   53.273946]  0000000000000000 ffff880009e28998 ffff88000c9df328 000000=
0080000000
> [   53.276900]  ffff88000c9df318 ffffffff811b3603 ffffea00002873e0 ffffff=
ff81e72f60
> [   53.279869]  ffff88000c9df2f8 ffff88000c9df328 0000000000000000 ffff88=
000c9df348
> [   53.282801] Call Trace:
> [   53.294954]  [<ffffffff811b3603>] qlist_free_all+0x83/0xc0
> [   53.296564]  [<ffffffff811b3988>] quarantine_reduce+0x248/0x260
> [   53.298247]  [<ffffffff810bbaee>] ? do_raw_spin_unlock+0xe/0x90
> [   53.299927]  [<ffffffff818dbc3b>] ? _raw_spin_unlock+0x2b/0x40
> [   53.301597]  [<ffffffff811ac9c3>] ? deactivate_slab+0x7d3/0x800
> [   53.303284]  [<ffffffff811b26e8>] kasan_kmalloc+0x38/0x170
> [   53.304898]  [<ffffffff81015b8b>] ? dump_trace+0x20b/0x270
> [   53.317543]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.319377]  [<ffffffff810211fe>] ? save_stack_trace+0x2e/0x50
> [   53.321045]  [<ffffffff811ad9f7>] ? set_track+0x77/0x110
> [   53.322637]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.324466]  [<ffffffff811ab797>] ? init_object+0x87/0xa0
> [   53.326058]  [<ffffffff811adfbb>] ? alloc_debug_processing+0x12b/0x1a0
> [   53.327842]  [<ffffffff811afedf>] ? T.1964+0x33f/0x370
> [   53.329390]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.331229]  [<ffffffff81581dcc>] ? bus_add_driver+0xfc/0x200
> [   53.332881]  [<ffffffff81583935>] ? driver_register+0x95/0xd0
> [   53.334544]  [<ffffffff814ab548>] ? __pci_register_driver+0x68/0x70
> [   53.336280]  [<ffffffff811b0161>] ? T.1965+0x91/0xc0
> [   53.337799]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.339643]  [<ffffffff810b6873>] ? trace_hardirqs_on_caller+0x193/0x1=
f0
> [   53.341456]  [<ffffffff810b68dd>] ? trace_hardirqs_on+0xd/0x10
> [   53.343118]  [<ffffffff811b28bf>] kasan_slab_alloc+0xf/0x20
> [   53.344737]  [<ffffffff811b0274>] kmem_cache_alloc+0xe4/0x200
> [   53.346385]  [<ffffffff818dbbe5>] ? _raw_spin_unlock_irqrestore+0x55/0=
x80
> [   53.348198]  [<ffffffff810b6873>] ? trace_hardirqs_on_caller+0x193/0x1=
f0
> [   53.350004]  [<ffffffff814fea4b>] acpi_ut_create_generic_state+0x47/0x=
52
> [   53.351806]  [<ffffffff814fead1>] acpi_ut_create_update_state+0x17/0x2e
> [   53.353607]  [<ffffffff814fd500>] acpi_ut_create_update_state_and_push=
+0x20/0x3b
> [   53.356132]  [<ffffffff814fc25e>] acpi_ut_update_object_reference+0xd3=
/0x1b7
> [   53.358011]  [<ffffffff814fc374>] acpi_ut_remove_reference+0x32/0x36
> [   53.359764]  [<ffffffff814e253a>] acpi_ds_clear_implicit_return+0x2b/0=
x3a
> [   53.361602]  [<ffffffff814e297e>] acpi_ds_do_implicit_return+0x46/0x65
> [   53.363385]  [<ffffffff814e29e4>] acpi_ds_is_result_used+0x47/0x105
> [   53.365118]  [<ffffffff814e2ae6>] acpi_ds_delete_result_if_not_used+0x=
44/0x67
> [   53.367005]  [<ffffffff814e4202>] ? acpi_ds_result_push+0x7e/0x138
> [   53.368724]  [<ffffffff814e3168>] acpi_ds_exec_end_op+0x3b7/0x3dc
> [   53.370432]  [<ffffffff814f5ebc>] acpi_ps_parse_loop+0x2b2/0x325
> [   53.372136]  [<ffffffff814f678b>] acpi_ps_parse_aml+0x9d/0x279
> [   53.373806]  [<ffffffff814f7245>] acpi_ps_execute_method+0x163/0x1c8
> [   53.375566]  [<ffffffff814f1594>] acpi_ns_evaluate+0x1d8/0x263
> [   53.377238]  [<ffffffff814fc74d>] acpi_ut_evaluate_object+0x87/0x1b0
> [   53.378987]  [<ffffffff814f876f>] acpi_rs_get_prt_method_data+0x26/0x4c
> [   53.380791]  [<ffffffff814f8c56>] ? acpi_rs_validate_parameters+0x3f/0=
x56
> [   53.382621]  [<ffffffff814f8d74>] acpi_get_irq_routing_table+0x2a/0x31
> [   53.384407]  [<ffffffff814dc712>] acpi_pci_irq_find_prt_entry+0x99/0x1=
b5
> [   53.386229]  [<ffffffff814dc85b>] acpi_pci_irq_lookup+0x2d/0x164
> [   53.387914]  [<ffffffff814dca84>] acpi_pci_irq_enable+0x6d/0x1a4
> [   53.389611]  [<ffffffff8177e3e3>] pcibios_enable_device+0x23/0x30
> [   53.391319]  [<ffffffff814aa84e>] do_pci_enable_device+0x4e/0xd0
> [   53.393008]  [<ffffffff814aa995>] pci_enable_device_flags+0xc5/0xe0
> [   53.394766]  [<ffffffff810bbd4b>] ? __raw_spin_lock_init+0x3b/0x60
> [   53.396497]  [<ffffffff814aa9c3>] pci_enable_device+0x13/0x20
> [   53.398159]  [<ffffffff8151da5b>] virtio_pci_probe+0x9b/0x110
> [   53.399806]  [<ffffffff814aad69>] ? pci_match_id+0x9/0x80
> [   53.401404]  [<ffffffff814ab107>] ? pci_match_device+0x107/0x110
> [   53.403090]  [<ffffffff814ab173>] local_pci_probe+0x23/0x60
> [   53.404717]  [<ffffffff814ab406>] pci_device_probe+0x76/0xb0
> [   53.406357]  [<ffffffff81582f53>] ? driver_sysfs_add+0x73/0xa0
> [   53.408007]  [<ffffffff81583207>] really_probe+0xf7/0x230
> [   53.409616]  [<ffffffff814aad69>] ? pci_match_id+0x9/0x80
> [   53.411219]  [<ffffffff814ab107>] ? pci_match_device+0x107/0x110
> [   53.412926]  [<ffffffff81583362>] driver_probe_device+0x22/0x30
> [   53.414619]  [<ffffffff815833f1>] __driver_attach+0x81/0xb0
> [   53.416267]  [<ffffffff81583370>] ? driver_probe_device+0x30/0x30
> [   53.417983]  [<ffffffff81583370>] ? driver_probe_device+0x30/0x30
> [   53.419702]  [<ffffffff815813a4>] bus_for_each_dev+0x64/0xb0
> [   53.421345]  [<ffffffff81582e6e>] driver_attach+0x1e/0x20
> [   53.422940]  [<ffffffff81581dcc>] bus_add_driver+0xfc/0x200
> [   53.424568]  [<ffffffff81583935>] driver_register+0x95/0xd0
> [   53.426206]  [<ffffffff814ab548>] __pci_register_driver+0x68/0x70
> [   53.427913]  [<ffffffff81f9dcec>] ? hidma_driver_init+0x14/0x14
> [   53.429599]  [<ffffffff81f9dd05>] virtio_pci_driver_init+0x19/0x1b
> [   53.431338]  [<ffffffff810003f5>] do_one_initcall+0xa5/0x190
> [   53.432980]  [<ffffffff81f61b00>] ? kernel_init_freeable+0xa2/0xf0
> [   53.434711]  [<ffffffff81f61a3b>] do_basic_setup+0xba/0xdd
> [   53.436329]  [<ffffffff81f61b4e>] ? kernel_init_freeable+0xf0/0xf0
> [   53.438075]  [<ffffffff81f61ad4>] kernel_init_freeable+0x76/0xf0
> [   53.439786]  [<ffffffff818d3b5e>] kernel_init+0xe/0x100
> [   53.441373]  [<ffffffff818dc00f>] ret_from_fork+0x1f/0x40
> [   53.442971]  [<ffffffff818d3b50>] ? rest_init+0x140/0x140
> [   53.444565] Code: eb fe 4c 89 ef 57 9d 0f 1f 44 00 00 e8 a3 18 f0 ff e=
b 1d e8 8c 33 f0 ff 48 83 3d 9c 54 c8 00 00 75 04 0f 0b eb fe 4c 89 ef 57 9=
d <0f> 1f 44 00 00 48 8b 1c 24 4c 8b 64 24 08 4c 8b 6c 24 10 4c 8b
> [   53.456407] Kernel panic - not syncing: softlockup: hung tasks
> [   53.458116] CPU: 0 PID: 1 Comm: swapper Tainted: G             L  4.7.=
0-rc7-00002-g85d9adb #1
> [   53.460839] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   53.463680]  ffff88000c9d0040 ffffffff81e35d48 ffffffff814710db ffffff=
ff81e35dc8
> [   53.482354]  ffffffff8115bdf6 ffff880000000008 ffffffff81e35dd8 ffffff=
ff81e35d78
> [   53.485366]  0000000000000000 ffffffff81e35dc8 00000000ffffffff ffff88=
000c9d0040
> [   53.488365] Call Trace:
> [   53.489479]  <IRQ>  [<ffffffff814710db>] dump_stack+0x19/0x1e
> [   53.491259]  [<ffffffff8115bdf6>] panic+0xd8/0x243
> [   53.492765]  [<ffffffff8110e668>] watchdog_timer_fn+0x1a8/0x1e0
> [   53.494461]  [<ffffffff810cece2>] T.866+0x272/0x3c0
> [   53.495976]  [<ffffffff810cee62>] ? hrtimer_run_queues+0x32/0xe0
> [   53.497683]  [<ffffffff810d450c>] ? ktime_get_update_offsets_now+0xbc/=
0x1b0
> [   53.499538]  [<ffffffff81037cf6>] ? kvm_clock_read+0x16/0x20
> [   53.501194]  [<ffffffff81037d09>] ? kvm_clock_get_cycles+0x9/0x10
> [   53.513930]  [<ffffffff810d455a>] ? ktime_get_update_offsets_now+0x10a=
/0x1b0
> [   53.515813]  [<ffffffff810bbbd9>] ? do_raw_spin_lock+0x19/0xf0
> [   53.517497]  [<ffffffff810ceed4>] hrtimer_run_queues+0xa4/0xe0
> [   53.519176]  [<ffffffff810cda7e>] run_local_timers+0xe/0x20
> [   53.520805]  [<ffffffff810cdac0>] update_process_times+0x30/0x70
> [   53.522514]  [<ffffffff810ddcd8>] tick_nohz_handler+0x98/0xe0
> [   53.535190]  [<ffffffff81001036>] ? trace_hardirqs_off_thunk+0x1a/0x1c
> [   53.536980]  [<ffffffff8102d220>] local_apic_timer_interrupt+0x40/0x50
> [   53.538773]  [<ffffffff818ddc8f>] smp_apic_timer_interrupt+0x3f/0x52
> [   53.540533]  [<ffffffff818dc8ea>] apic_timer_interrupt+0x8a/0x90
> [   53.542238]  <EOI>  [<ffffffff811b3557>] ? qlink_free+0xc7/0xf0
> [   53.544038]  [<ffffffff811b3603>] qlist_free_all+0x83/0xc0
> [   53.545664]  [<ffffffff811b3988>] quarantine_reduce+0x248/0x260
> [   53.558392]  [<ffffffff810bbaee>] ? do_raw_spin_unlock+0xe/0x90
> [   53.560080]  [<ffffffff818dbc3b>] ? _raw_spin_unlock+0x2b/0x40
> [   53.561758]  [<ffffffff811ac9c3>] ? deactivate_slab+0x7d3/0x800
> [   53.563450]  [<ffffffff811b26e8>] kasan_kmalloc+0x38/0x170
> [   53.565068]  [<ffffffff81015b8b>] ? dump_trace+0x20b/0x270
> [   53.566686]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.579573]  [<ffffffff810211fe>] ? save_stack_trace+0x2e/0x50
> [   53.581263]  [<ffffffff811ad9f7>] ? set_track+0x77/0x110
> [   53.582843]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.584745]  [<ffffffff811ab797>] ? init_object+0x87/0xa0
> [   53.586351]  [<ffffffff811adfbb>] ? alloc_debug_processing+0x12b/0x1a0
> [   53.588160]  [<ffffffff811afedf>] ? T.1964+0x33f/0x370
> [   53.589730]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.602613]  [<ffffffff81581dcc>] ? bus_add_driver+0xfc/0x200
> [   53.604286]  [<ffffffff81583935>] ? driver_register+0x95/0xd0
> [   53.605949]  [<ffffffff814ab548>] ? __pci_register_driver+0x68/0x70
> [   53.607694]  [<ffffffff811b0161>] ? T.1965+0x91/0xc0
> [   53.609267]  [<ffffffff814fea4b>] ? acpi_ut_create_generic_state+0x47/=
0x52
> [   53.611115]  [<ffffffff810b6873>] ? trace_hardirqs_on_caller+0x193/0x1=
f0
> [   53.623966]  [<ffffffff810b68dd>] ? trace_hardirqs_on+0xd/0x10
> [   53.625650]  [<ffffffff811b28bf>] kasan_slab_alloc+0xf/0x20
> [   53.627273]  [<ffffffff811b0274>] kmem_cache_alloc+0xe4/0x200
> [   53.628926]  [<ffffffff818dbbe5>] ? _raw_spin_unlock_irqrestore+0x55/0=
x80
> [   53.630752]  [<ffffffff810b6873>] ? trace_hardirqs_on_caller+0x193/0x1=
f0
> [   53.632566]  [<ffffffff814fea4b>] acpi_ut_create_generic_state+0x47/0x=
52
> [   53.645413]  [<ffffffff814fead1>] acpi_ut_create_update_state+0x17/0x2e
> [   53.647237]  [<ffffffff814fd500>] acpi_ut_create_update_state_and_push=
+0x20/0x3b
> [   53.649783]  [<ffffffff814fc25e>] acpi_ut_update_object_reference+0xd3=
/0x1b7
> [   53.651660]  [<ffffffff814fc374>] acpi_ut_remove_reference+0x32/0x36
> [   53.653425]  [<ffffffff814e253a>] acpi_ds_clear_implicit_return+0x2b/0=
x3a
> [   53.655252]  [<ffffffff814e297e>] acpi_ds_do_implicit_return+0x46/0x65
> [   53.668059]  [<ffffffff814e29e4>] acpi_ds_is_result_used+0x47/0x105
> [   53.669811]  [<ffffffff814e2ae6>] acpi_ds_delete_result_if_not_used+0x=
44/0x67
> [   53.671698]  [<ffffffff814e4202>] ? acpi_ds_result_push+0x7e/0x138
> [   53.673435]  [<ffffffff814e3168>] acpi_ds_exec_end_op+0x3b7/0x3dc
> [   53.675156]  [<ffffffff814f5ebc>] acpi_ps_parse_loop+0x2b2/0x325
> [   53.676858]  [<ffffffff814f678b>] acpi_ps_parse_aml+0x9d/0x279
> [   53.689564]  [<ffffffff814f7245>] acpi_ps_execute_method+0x163/0x1c8
> [   53.691332]  [<ffffffff814f1594>] acpi_ns_evaluate+0x1d8/0x263
> [   53.693005]  [<ffffffff814fc74d>] acpi_ut_evaluate_object+0x87/0x1b0
> [   53.694773]  [<ffffffff814f876f>] acpi_rs_get_prt_method_data+0x26/0x4c
> [   53.696571]  [<ffffffff814f8c56>] ? acpi_rs_validate_parameters+0x3f/0=
x56
> [   53.698403]  [<ffffffff814f8d74>] acpi_get_irq_routing_table+0x2a/0x31
> [   53.715224]  [<ffffffff814dc712>] acpi_pci_irq_find_prt_entry+0x99/0x1=
b5
> [   53.717046]  [<ffffffff814dc85b>] acpi_pci_irq_lookup+0x2d/0x164
> [   53.718757]  [<ffffffff814dca84>] acpi_pci_irq_enable+0x6d/0x1a4
> [   53.720466]  [<ffffffff8177e3e3>] pcibios_enable_device+0x23/0x30
> [   53.722195]  [<ffffffff814aa84e>] do_pci_enable_device+0x4e/0xd0
> [   53.723924]  [<ffffffff814aa995>] pci_enable_device_flags+0xc5/0xe0
> [   53.735898]  [<ffffffff810bbd4b>] ? __raw_spin_lock_init+0x3b/0x60
> [   53.737642]  [<ffffffff814aa9c3>] pci_enable_device+0x13/0x20
> [   53.739312]  [<ffffffff8151da5b>] virtio_pci_probe+0x9b/0x110
> [   53.740983]  [<ffffffff814aad69>] ? pci_match_id+0x9/0x80
> [   53.742590]  [<ffffffff814ab107>] ? pci_match_device+0x107/0x110
> [   53.744292]  [<ffffffff814ab173>] local_pci_probe+0x23/0x60
> [   53.745917]  [<ffffffff814ab406>] pci_device_probe+0x76/0xb0
> [   53.758611]  [<ffffffff81582f53>] ? driver_sysfs_add+0x73/0xa0
> [   53.760286]  [<ffffffff81583207>] really_probe+0xf7/0x230
> [   53.761890]  [<ffffffff814aad69>] ? pci_match_id+0x9/0x80
> [   53.763498]  [<ffffffff814ab107>] ? pci_match_device+0x107/0x110
> [   53.765203]  [<ffffffff81583362>] driver_probe_device+0x22/0x30
> [   53.766893]  [<ffffffff815833f1>] __driver_attach+0x81/0xb0
> [   53.779553]  [<ffffffff81583370>] ? driver_probe_device+0x30/0x30
> [   53.781281]  [<ffffffff81583370>] ? driver_probe_device+0x30/0x30
>
> git bisect start de9e203841254d3eee5e10458714f7f7e4392b82 92d21ac74a9e3c0=
9b0b01c764e530657e4c85c49 --
> git bisect  bad 180c0989372f6a358a6d75860237ace415cdf528  # 05:57     33-=
     46  Merge 'linux-review/William-Wu/support-rockchip-dwc3-driver/201607=
14-170524' into devel-hourly-2016072217
> git bisect  bad 04f0a8f114cf67ab06bf853418df6d1a576d7486  # 06:06     14-=
     20  Merge 'linux-review/Vinod-Koul/dmaengine-ioat-statify-symbol/20160=
716-222642' into devel-hourly-2016072217
> git bisect good e0e414702ea3460c3633c78da48cc701f0799cca  # 06:19     79+=
     16  Merge 'linux-review/Nicholas-Piggin/powerpc-tm-do-not-use-r13-for-=
tabort_syscall/20160722-170704' into devel-hourly-2016072217
> git bisect good 3e285e0e883d0f397b155e0eb8e92beb5a7a50af  # 06:29     79+=
     73  Merge 'linux-review/Christoph-Hellwig/scsi-remove-current_cmnd-fie=
ld-from-struct-scsi_device/20160711-123831' into devel-hourly-2016072217
> git bisect good b641e029a29a8345bcfc2c89a7133cb87b0897fd  # 06:42     76+=
     51  Merge 'mbroz-linux/dm-integrity' into devel-hourly-2016072217
> git bisect good 818cf195f78d78f364b790068487dcf67f2f3573  # 06:59     82+=
     55  Merge 'jkirsher-next-queue/40GbE' into devel-hourly-2016072217
> git bisect good 876cfd77f56176f7ae8be9f16c534aa0268dfd4f  # 07:11     78+=
     78  Merge 'luto/x86/vdso' into devel-hourly-2016072217
> git bisect  bad dcaffd8bb1be42f76a884512654f482836f89f11  # 07:16     13-=
     18  Merge 'linux-review/Alexander-Potapenko/mm-kasan-stackdepot-and-qu=
arantine-for-SLUB/20160713-021523' into devel-hourly-2016072217
> git bisect good 287349f5b60eeb9f5a2502f5adcb472ac767ef97  # 07:28     81+=
     67  Merge 'linux-review/Dmitry-Tunin/Bluetooth-Add-support-of-13d3-349=
0-AR3012-device/20160712-063922' into devel-hourly-2016072217
> git bisect  bad 85d9adbf58cdb6eb9101f64e99e10aed5271bbef  # 07:33      5-=
      8  mm, kasan: switch SLUB to stackdepot, enable memory quarantine for=
 SLUB
> git bisect good c840cd907d663667b32ec6ebfa2e32dac77504c6  # 07:44     77+=
     62  mm, kasan: account for object redzone in SLUB's nearest_obj()
> # first bad commit: [85d9adbf58cdb6eb9101f64e99e10aed5271bbef] mm, kasan:=
 switch SLUB to stackdepot, enable memory quarantine for SLUB
> git bisect good c840cd907d663667b32ec6ebfa2e32dac77504c6  # 07:50    232+=
    146  mm, kasan: account for object redzone in SLUB's nearest_obj()
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 85d9adbf58cdb6eb9101f64e99e10aed5271bbef  # 07:56      4-=
      4  mm, kasan: switch SLUB to stackdepot, enable memory quarantine for=
 SLUB
> # extra tests on HEAD of linux-devel/devel-hourly-2016072217
> git bisect  bad de9e203841254d3eee5e10458714f7f7e4392b82  # 07:57      0-=
     31  0day head guard for 'devel-hourly-2016072217'
> # extra tests on tree/branch linux-review/Alexander-Potapenko/mm-kasan-st=
ackdepot-and-quarantine-for-SLUB/20160713-021523
> git bisect  bad 85d9adbf58cdb6eb9101f64e99e10aed5271bbef  # 08:31      0-=
     74  mm, kasan: switch SLUB to stackdepot, enable memory quarantine for=
 SLUB
> # extra tests with first bad commit reverted
> git bisect good 615b8e438ac646ab73d040830619fa6f0b81b257  # 08:48    232+=
    138  Revert "mm, kasan: switch SLUB to stackdepot, enable memory quaran=
tine for SLUB"
> # extra tests on tree/branch linus/master
> git bisect good 47ef4ad2684d380dd6d596140fb79395115c3950  # 08:59    231+=
    237  Merge tag 'for-linus-20160715' of git://git.infradead.org/linux-mtd
> # extra tests on tree/branch linux-next/master
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-minimal-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu Haswell,+smep,+smap
>         -kernel $kernel
>         -initrd $initrd
>         -m 256
>         -smp 1
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         systemd.log_level=3Derr
>         ignore_loglevel
>         earlyprintk=3DttyS0,115200
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
When I build the kernel with your config and run the script, QEMU
bails out with an error message:
  qemu: linux kernel too old to load a ram disk
Any idea how to work around that?
> -------------------------------------------------------------------------=
---
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============6871026687193096851==--


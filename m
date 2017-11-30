Content-Type: multipart/mixed; boundary="===============8317145776104006616=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: dd: page allocation failure: order:0, mode:0x1080020(GFP_ATOMIC), nodemask=(null)
Date: Thu, 30 Nov 2017 22:01:03 +0800
Message-ID: <20171130140103.arapa4qphgtmjyqm@wfg-t540p.sh.intel.com>
In-Reply-To: <20171130135016.dfzj2s7ngz55tfws@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8317145776104006616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 02:50:16PM +0100, Michal Hocko wrote:
>On Thu 30-11-17 21:38:40, Wu Fengguang wrote:
>> Hello,
>>
>> It looks like a regression in 4.15.0-rc1 -- the test case simply run a
>> set of parallel dd's and there seems no reason to run into memory proble=
m.
>>
>> It occurs in 1 out of 4 tests.
>
>This is an atomic allocations. So the failure really depends on the
>state of the free memory and that can vary between runs depending on
>timing I guess. So I am not really sure this is a regression. But maybe
>there is something reclaim related going on here.

Yes, it does depend on how the drivers rely on atomic allocations.
I just wonder if any changes make the pressure more tight than before.
It may not even be a MM change -- in theory drivers might also use atomic
allocations more aggressively than before.

>[...]
>> [   71.088242] dd: page allocation failure: order:0, mode:0x1080020(GFP_=
ATOMIC), nodemask=3D(null)
>> [   71.098654] dd cpuset=3D/ mems_allowed=3D0-1
>> [   71.104460] CPU: 0 PID: 6016 Comm: dd Tainted: G           O     4.15=
.0-rc1 #1
>> [   71.113553] Call Trace:
>> [   71.117886]  <IRQ>
>> [   71.121749]  dump_stack+0x5c/0x7b:
>> 						dump_stack at lib/dump_stack.c:55
>> [   71.126785]  warn_alloc+0xbe/0x150:
>> 						preempt_count at arch/x86/include/asm/preempt.h:23
>> 						 (inlined by) should_suppress_show_mem at mm/page_alloc.c:3244
>> 						 (inlined by) warn_alloc_show_mem at mm/page_alloc.c:3254
>> 						 (inlined by) warn_alloc at mm/page_alloc.c:3293
>> [   71.131939]  __alloc_pages_slowpath+0xda7/0xdf0:
>> 						__alloc_pages_slowpath at mm/page_alloc.c:4151
>> [   71.138110]  ? xhci_urb_enqueue+0x23d/0x580:
>> 						xhci_urb_enqueue at drivers/usb/host/xhci.c:1389
>> [   71.143941]  __alloc_pages_nodemask+0x269/0x280:
>> 						__alloc_pages_nodemask at mm/page_alloc.c:4245
>> [   71.150167]  page_frag_alloc+0x11c/0x150:
>> 						__page_frag_cache_refill at mm/page_alloc.c:4335
>> 						 (inlined by) page_frag_alloc at mm/page_alloc.c:4364
>> [   71.155668]  __netdev_alloc_skb+0xa0/0x110:
>> 						__netdev_alloc_skb at net/core/skbuff.c:415
>> [   71.161386]  rx_submit+0x3b/0x2e0:
>> 						rx_submit at drivers/net/usb/usbnet.c:488
>> [   71.166232]  rx_complete+0x196/0x2d0:
>> 						rx_complete at drivers/net/usb/usbnet.c:659
>> [   71.171354]  __usb_hcd_giveback_urb+0x86/0x100:
>> 						arch_local_irq_restore at arch/x86/include/asm/paravirt.h:777
>> 						 (inlined by) __usb_hcd_giveback_urb at drivers/usb/core/hcd.c:1769
>> [   71.177281]  xhci_giveback_urb_in_irq+0x86/0x100
>> [   71.184107]  xhci_td_cleanup+0xe7/0x170:
>> 						xhci_td_cleanup at drivers/usb/host/xhci-ring.c:1924
>> [   71.189457]  handle_tx_event+0x297/0x1190:
>> 						process_bulk_intr_td at drivers/usb/host/xhci-ring.c:2267
>> 						 (inlined by) handle_tx_event at drivers/usb/host/xhci-ring.c:2598
>> [   71.194905]  ? reweight_entity+0x145/0x180:
>> 						enqueue_runnable_load_avg at kernel/sched/fair.c:2742
>> 						 (inlined by) reweight_entity at kernel/sched/fair.c:2810
>> [   71.200466]  xhci_irq+0x300/0xb80:
>> 						xhci_handle_event at drivers/usb/host/xhci-ring.c:2676
>> 						 (inlined by) xhci_irq at drivers/usb/host/xhci-ring.c:2777
>> [   71.205195]  ? scheduler_tick+0xb2/0xe0:
>> 						rq_last_tick_reset at kernel/sched/sched.h:1643
>> 						 (inlined by) scheduler_tick at kernel/sched/core.c:3036
>> [   71.210407]  ? run_timer_softirq+0x73/0x460:
>> 						__collect_expired_timers at kernel/time/timer.c:1375
>> 						 (inlined by) collect_expired_timers at kernel/time/timer.c:1609
>> 						 (inlined by) __run_timers at kernel/time/timer.c:1656
>> 						 (inlined by) run_timer_softirq at kernel/time/timer.c:1688
>> [   71.215905]  __handle_irq_event_percpu+0x3a/0x1a0:
>> 						__handle_irq_event_percpu at kernel/irq/handle.c:147
>> [   71.221975]  handle_irq_event_percpu+0x20/0x50:
>> 						handle_irq_event_percpu at kernel/irq/handle.c:189
>> [   71.227641]  handle_irq_event+0x3d/0x60:
>> 						handle_irq_event at kernel/irq/handle.c:206
>> [   71.232682]  handle_edge_irq+0x71/0x190:
>> 						handle_edge_irq at kernel/irq/chip.c:796
>> [   71.237715]  handle_irq+0xa5/0x100:
>> 						handle_irq at arch/x86/kernel/irq_64.c:78
>> [   71.242326]  do_IRQ+0x41/0xc0:
>> 						do_IRQ at arch/x86/kernel/irq.c:241
>> [   71.246472]  common_interrupt+0x96/0x96:
>> 						ret_from_intr at arch/x86/entry/entry_64.S:611
>> [   71.251509]  </IRQ>
>
>Ugh, this looks unreadable... Inlining information can be helpful
>sometime, alright but I find the below much more readable.

Heh, agreed.

>> [   78.848629] dd: page allocation failure: order:0, mode:0x1080020(GFP_=
ATOMIC), nodemask=3D(null)
>> [   78.857841] dd cpuset=3D/ mems_allowed=3D0-1
>> [   78.862502] CPU: 0 PID: 6131 Comm: dd Tainted: G           O     4.15=
.0-rc1 #1
>> [   78.870437] Call Trace:
>> [   78.873610]  <IRQ>
>> [   78.876342]  dump_stack+0x5c/0x7b
>> [   78.880414]  warn_alloc+0xbe/0x150
>> [   78.884550]  __alloc_pages_slowpath+0xda7/0xdf0
>> [   78.889822]  ? xhci_urb_enqueue+0x23d/0x580
>> [   78.894713]  __alloc_pages_nodemask+0x269/0x280
>> [   78.899891]  page_frag_alloc+0x11c/0x150
>> [   78.904471]  __netdev_alloc_skb+0xa0/0x110
>> [   78.909277]  rx_submit+0x3b/0x2e0
>> [   78.913256]  rx_complete+0x196/0x2d0
>> [   78.917560]  __usb_hcd_giveback_urb+0x86/0x100
>> [   78.922681]  xhci_giveback_urb_in_irq+0x86/0x100
>> [   78.928769]  ? ip_rcv+0x261/0x390
>> [   78.932739]  xhci_td_cleanup+0xe7/0x170
>> [   78.937308]  handle_tx_event+0x297/0x1190
>> [   78.941990]  xhci_irq+0x300/0xb80
>> [   78.945968]  ? pciehp_isr+0x46/0x320
>> [   78.950870]  __handle_irq_event_percpu+0x3a/0x1a0
>> [   78.956311]  handle_irq_event_percpu+0x20/0x50
>> [   78.961466]  handle_irq_event+0x3d/0x60
>> [   78.965962]  handle_edge_irq+0x71/0x190
>> [   78.970480]  handle_irq+0xa5/0x100
>> [   78.974565]  do_IRQ+0x41/0xc0
>> [   78.978206]  ? pagevec_move_tail_fn+0x350/0x350
>> [   78.983412]  common_interrupt+0x96/0x96
>
>Unfortunatelly we are missing the most imporatant information, the
>meminfo. We cannot tell much without it. Maybe collecting /proc/vmstat
>during the test will tell us more.

Attached the JSON format per-second vmstat records.
It feels more readable than the raw dumps.

Thanks,
Fengguang

--===============8317145776104006616==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="proc-vmstat.json.gz"

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
//4qB87A3/7v/wFZHJ7qFKkAAA==
--===============8317145776104006616==--


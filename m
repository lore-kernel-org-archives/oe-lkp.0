Content-Type: multipart/mixed; boundary="===============1840619182808711048=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: dd: page allocation failure: order:0, mode:0x1080020(GFP_ATOMIC), nodemask=(null)
Date: Thu, 30 Nov 2017 22:08:04 +0800
Message-ID: <20171130140804.74lgpkvmvnzx4dlm@wfg-t540p.sh.intel.com>
In-Reply-To: <20171130140103.arapa4qphgtmjyqm@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1840619182808711048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>> [   78.848629] dd: page allocation failure: order:0, mode:0x1080020(GFP=
_ATOMIC), nodemask=3D(null)
>>> [   78.857841] dd cpuset=3D/ mems_allowed=3D0-1
>>> [   78.862502] CPU: 0 PID: 6131 Comm: dd Tainted: G           O     4.1=
5.0-rc1 #1
>>> [   78.870437] Call Trace:
>>> [   78.873610]  <IRQ>
>>> [   78.876342]  dump_stack+0x5c/0x7b
>>> [   78.880414]  warn_alloc+0xbe/0x150
>>> [   78.884550]  __alloc_pages_slowpath+0xda7/0xdf0
>>> [   78.889822]  ? xhci_urb_enqueue+0x23d/0x580
>>> [   78.894713]  __alloc_pages_nodemask+0x269/0x280
>>> [   78.899891]  page_frag_alloc+0x11c/0x150
>>> [   78.904471]  __netdev_alloc_skb+0xa0/0x110
>>> [   78.909277]  rx_submit+0x3b/0x2e0
>>> [   78.913256]  rx_complete+0x196/0x2d0
>>> [   78.917560]  __usb_hcd_giveback_urb+0x86/0x100
>>> [   78.922681]  xhci_giveback_urb_in_irq+0x86/0x100
>>> [   78.928769]  ? ip_rcv+0x261/0x390
>>> [   78.932739]  xhci_td_cleanup+0xe7/0x170
>>> [   78.937308]  handle_tx_event+0x297/0x1190
>>> [   78.941990]  xhci_irq+0x300/0xb80
>>> [   78.945968]  ? pciehp_isr+0x46/0x320
>>> [   78.950870]  __handle_irq_event_percpu+0x3a/0x1a0
>>> [   78.956311]  handle_irq_event_percpu+0x20/0x50
>>> [   78.961466]  handle_irq_event+0x3d/0x60
>>> [   78.965962]  handle_edge_irq+0x71/0x190
>>> [   78.970480]  handle_irq+0xa5/0x100
>>> [   78.974565]  do_IRQ+0x41/0xc0
>>> [   78.978206]  ? pagevec_move_tail_fn+0x350/0x350
>>> [   78.983412]  common_interrupt+0x96/0x96
>>
>>Unfortunatelly we are missing the most imporatant information, the
>>meminfo. We cannot tell much without it. Maybe collecting /proc/vmstat
>>during the test will tell us more.
>
>Attached the JSON format per-second vmstat records.
>It feels more readable than the raw dumps.

And here is the meminfo lines.

Thanks,
Fengguang


--===============1840619182808711048==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="meminfo.json.gz"

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
--===============1840619182808711048==--


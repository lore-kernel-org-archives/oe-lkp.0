Content-Type: multipart/mixed; boundary="===============7362037188442737947=="
MIME-Version: 1.0
From: Du, Changbin <changbin.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [usb] 22bf2bb019: WARNING: CPU: 0 PID: 0 at include/linux/usb/gadget.h:405 composite_ep0_queue+0xad/0xd0()
Date: Mon, 14 Dec 2015 10:13:14 +0000
Message-ID: <0C18FE92A7765D4EB9EE5D38D86A563A01DF62B4@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <87oadt4dhc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7362037188442737947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux changbin-du-intel-com/usb-gadget-forbid-
> queuing-request-to-a-disabled-ep/20151214-115939
> commit 22bf2bb019c7f92cda32c46b95715b0b208052d0 ("usb: gadget: forbid
> queuing request to a disabled ep")
> =

> =

> [    8.157994] dummy_hcd dummy_hcd.0: port status 0x00100503 has changes
> [    8.209686] usb 1-1: new high-speed USB device number 2 using
> dummy_hcd
> [    8.211689] ------------[ cut here ]------------
> [    8.212267] WARNING: CPU: 0 PID: 0 at include/linux/usb/gadget.h:405
> composite_ep0_queue+0xad/0xd0()
> [    8.213684] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.4.0-rc4-00001-
> g22bf2bb #1
> [    8.214580]  00000000 00000000 54407de4 4125cd9f 00000000 54407e14
> 4109e21e 420f34b4
> [    8.215626]  00000000 00000000 421bdc84 00000195 41761a1d 41761a1d
> 4d810ea8 4d810ea8
> [    8.216679]  ffffff94 54407e24 4109e2eb 00000009 00000000 54407e48
> 41761a1d 00000001
> [    8.217726] Call Trace:
> [    8.218029]  [<4125cd9f>] dump_stack+0x48/0x69
> [    8.218570]  [<4109e21e>] warn_slowpath_common+0x7e/0xb0
> [    8.219204]  [<41761a1d>] ? composite_ep0_queue+0xad/0xd0
> [    8.219972]  [<41761a1d>] ? composite_ep0_queue+0xad/0xd0
> [    8.220741]  [<4109e2eb>] warn_slowpath_null+0x1b/0x20
> [    8.221362]  [<41761a1d>] composite_ep0_queue+0xad/0xd0
> [    8.222105]  [<41762055>] composite_setup+0x615/0x19e0
> [    8.222723]  [<41769eba>] ? dummy_timer+0x4a/0xe30
> [    8.223299]  [<4176a86d>] dummy_timer+0x9fd/0xe30
> [    8.223872]  [<41769e70>] ? dummy_start+0x140/0x140
> [    8.224461]  [<410f2cef>] call_timer_fn+0x6f/0xf0
> [    8.225025]  [<410f2cb2>] ? call_timer_fn+0x32/0xf0
> [    8.225612]  [<410f2eb1>] run_timer_softirq+0x141/0x1d0
> [    8.226234]  [<41769e70>] ? dummy_start+0x140/0x140
> [    8.226827]  [<410a0d8d>] __do_softirq+0xbd/0x1c0
> [    8.227397]  [<410a0cd0>] ? _local_bh_enable+0x50/0x50
> [    8.228013]  [<4104f376>] do_softirq_own_stack+0x26/0x40
> [    8.228651]  <IRQ>  [<410a1085>] irq_exit+0x65/0x70
> [    8.229258]  [<4107ea7e>] smp_trace_apic_timer_interrupt+0x5e/0x90
> [    8.229993]  [<4107eab8>] smp_apic_timer_interrupt+0x8/0x10
> [    8.230666]  [<41d78a5d>] apic_timer_interrupt+0x2d/0x34
> [    8.231309]  [<410861f5>] ? native_safe_halt+0x5/0x10
> [    8.231917]  [<41055198>] default_idle+0x8/0x10
> [    8.232467]  [<41055919>] arch_cpu_idle+0x9/0x10
> [    8.233016]  [<410d55d3>] default_idle_call+0x23/0x30
> [    8.233627]  [<410d573c>] cpu_startup_entry+0x15c/0x240
> [    8.234260]  [<41d6f31a>] rest_init+0xaa/0xb0
> [    8.234782]  [<42327b05>] start_kernel+0x3df/0x3e4
> [    8.235363]  [<423272c3>] i386_start_kernel+0x91/0x95
> [    8.235971] ---[ end trace a9973fc5ac55cb31 ]---
> [    8.236529] g_ether gadget: ep_queue --> -108
> =

> =

> Thanks,
> Ying Huang
Hmm, it because the ep0 'enabled' is not set. Ep0 is not enabled by usb_ep_=
enable, but in UDC driver.
It need a fix.
This is an interesting robot testing tool. Thanks!

Du, Changbin

--===============7362037188442737947==--


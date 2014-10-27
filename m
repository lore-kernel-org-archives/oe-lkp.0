Content-Type: multipart/mixed; boundary="===============6377089615437220412=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 0 PID: 95 at kernel/sched/core.c:7312 __might_sleep()
Date: Mon, 27 Oct 2014 22:03:25 +0800
Message-ID: <20141027140325.GA15725@wfg-t540p.sh.intel.com>
In-Reply-To: <20141027133627.GH3337@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6377089615437220412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 02:36:27PM +0100, Peter Zijlstra wrote:
> On Mon, Oct 27, 2014 at 09:06:21PM +0800, Fengguang Wu wrote:
> > Hi Peter,
> > =

> > FYI, this bug seems still there on v3.18-rc2.
> =

> Oh, right, I commented out that patch and the audit one because I was
> waiting for some feedback. Lemme go prod people.

One more warning, looks like triggered by thermal_apic_exit. Authors CCed.

[   29.107798] Running tests on trace events:
[   29.108302] Testing event thermal_apic_exit: =

[   29.143786] ------------[ cut here ]------------
[   29.144489] WARNING: CPU: 1 PID: 101 at kernel/sched/core.c:7187 __might=
_sleep+0xb9/0x100()
[   29.145781] do not call blocking ops when !TASK_RUNNING; state=3D1 set a=
t [<c1e62e65>] event_test_thread+0x58/0x92
[   29.147139] Modules linked in:
[   29.147604] CPU: 1 PID: 101 Comm: test-events Not tainted 3.17.0-rc6-018=
72-ga0d2c46 #17
[   29.148646] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[   29.149969]  00000001 00000000 ffffffff cbc4fe5c c17ef50f cbc4fea4 00000=
001 00000065
[   29.151143]  cbc4fe78 c10689d7 00001c13 c10a5f59 00000001 00000000 00000=
029 cbc4fe90
[   29.152343]  c1068a1b 00000009 cbc4fe88 c1b5cc24 cbc4fea4 cbc4fec4 c10a5=
f59 c1b5c9b0
[   29.153511] Call Trace:
[   29.153859]  [<c17ef50f>] dump_stack+0x78/0xa8
[   29.154448]  [<c10689d7>] warn_slowpath_common+0x87/0xa0
[   29.155119]  [<c10a5f59>] ? __might_sleep+0xb9/0x100
[   29.155706]  [<c1068a1b>] warn_slowpath_fmt+0x2b/0x30
[   29.164357]  [<c10a5f59>] __might_sleep+0xb9/0x100
[   29.164935]  [<c1e62e65>] ? event_test_thread+0x58/0x92
[   29.165541]  [<c1e62e65>] ? event_test_thread+0x58/0x92
[   29.166154]  [<c17f8d4c>] down_read+0x1c/0x50
[   29.166660]  [<c1083a6f>] exit_signals+0x1f/0x1d0
[   29.167215]  [<c106bc1f>] do_exit+0x1bf/0x13a0
[   29.167748]  [<c1e62e0d>] ? event_test_stuff+0x6c/0x6c
[   29.168434]  [<c109bea8>] ? kthread_should_stop+0x8/0x20
[   29.169145]  [<c1e62e0d>] ? event_test_stuff+0x6c/0x6c
[   29.169829]  [<c109c3d4>] kthread+0xe4/0x110
[   29.170397]  [<c1e62e0d>] ? event_test_stuff+0x6c/0x6c
[   29.171082]  [<c10d0000>] ? push_dl_task+0x50/0x5a0
[   29.171759]  [<c17fbf21>] ret_from_kernel_thread+0x21/0x30
[   29.172496]  [<c109c2f0>] ? insert_kthread_work+0x110/0x110
[   29.173234] ---[ end trace 12bb28a4b269a09b ]---
[   29.173913] test-events (101) used greatest stack depth: 6712 bytes left

Thanks,
Fengguang

--===============6377089615437220412==--


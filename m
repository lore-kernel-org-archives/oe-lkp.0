Content-Type: multipart/mixed; boundary="===============5258640850837019227=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [microcode/load_module] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7094 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 12:41:40 +0200
Message-ID: <20140807104140.GN19379@twins.programming.kicks-ass.net>
In-Reply-To: <20140805211224.GA13480@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5258640850837019227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 05:12:24AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> Here is a microcode/load_module error triggered by debug check commit
> 64c2181bc433b17f04da8fe8592aa83cceac9606 ("sched: Debug nested sleeps"):
> =

> [    6.010476] microcode: CPU0 sig=3D0x106a3, pf=3D0x1, revision=3D0x1
> [    6.011896] microcode: CPU1 sig=3D0x106a3, pf=3D0x1, revision=3D0x1
> [    6.020554] ------------[ cut here ]------------
> [    6.021988] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7094 __mi=
ght_sleep+0x51/0x16f()
> [    6.024909] do not call blocking ops when !TASK_RUNNING; state=3D1 set=
 at [<ffffffff81111e4c>] prepare_to_wait_event+0xb2/0xee
> [    6.026998] Modules linked in: microcode(+)
> [    6.027998] CPU: 0 PID: 1444 Comm: modprobe Not tainted 3.16.0-02034-g=
f5d04af #1
> [    6.029603] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    6.030674]  0000000000000000 ffff88003da2bd00 ffffffff819c7cb6 ffff88=
003da2bd48
> [    6.032577]  ffff88003da2bd38 ffffffff810e1dd0 ffffffff810ff665 ffff88=
003d91b7e0
> [    6.034417]  ffffffff81cd5c89 0000000000000061 0000000000000000 ffff88=
003da2bd98
> [    6.036236] Call Trace:
> [    6.036908]  [<ffffffff819c7cb6>] dump_stack+0x4d/0x66
> [    6.037894]  [<ffffffff810e1dd0>] warn_slowpath_common+0x7f/0x98
> [    6.038601] microcode: Microcode Update Driver: v2.00 <tigran@aivazi=
an.fsnet.co.uk>, Peter Oruba
> [    6.040761]  [<ffffffff810ff665>] ? __might_sleep+0x51/0x16f
> [    6.041861]  [<ffffffff810e1e35>] warn_slowpath_fmt+0x4c/0x4e
> [    6.043034]  [<ffffffff811c06d7>] ? __vmalloc_node_range+0x18d/0x1f1
> [    6.044270]  [<ffffffff81141bf6>] ? module_alloc_update_bounds+0x14/0x=
5f
> [    6.045458]  [<ffffffff81111e4c>] ? prepare_to_wait_event+0xb2/0xee
> [    6.046592]  [<ffffffff81111e4c>] ? prepare_to_wait_event+0xb2/0xee
> [    6.048258]  [<ffffffff810ff665>] __might_sleep+0x51/0x16f
> [    6.049501]  [<ffffffff819cda15>] mutex_lock+0x20/0x42
> [    6.050601]  [<ffffffff811403c0>] finished_loading+0x19/0x63
> [    6.051823]  [<ffffffff8114217d>] load_module+0x522/0x1f0a
> [    6.053086]  [<ffffffff81492e1b>] ? trace_hardirqs_on_thunk+0x3a/0x3c
> [    6.054498]  [<ffffffff819d0564>] ? retint_restore_args+0x13/0x13
> [    6.055607]  [<ffffffff81111f6c>] ? wait_woken+0x69/0x69
> [    6.056645]  [<ffffffff81143c2f>] SyS_init_module+0xca/0xd9
> [    6.057637]  [<ffffffff819cfa29>] system_call_fastpath+0x16/0x1b
> [    6.058751] ---[ end trace ee9cd23bc6a36c85 ]---
> [    6.098452] ------------[ cut here ]------------

That looks like a genuine bug; add_unformed_module() calls
wait_event_interruptible(.condition =3D finished_loading()), and
finished_loading() takes a mutex.

Compile tested only.. will stuff in the next tree.

---
Subject: module: Fix nested sleep
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu Aug 7 12:38:16 CEST 2014


Cc: Rusty Russell <rusty@rustcorp.com.au>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Link: http://lkml.kernel.org/n/tip-xtd4qlahotb7ar4bmo9lapz8(a)git.kernel.org
---
 kernel/module.c |   26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3094,6 +3094,28 @@ static int may_init_module(void)
 	return 0;
 }
 =

+int wait_finished_loading(struct module *mod)
+{
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+	int ret =3D 0;
+
+	add_wait_queue(&module_wq, &wait);
+	for (;;) {
+		if (finished_loading(mod->name))
+			break;
+
+		if (signal_pending_state(TASK_INTERRUPTIBLE, current)) {
+			ret =3D -ERESTARTSYS;
+			break;
+		}
+
+		wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
+	}
+	remove_wait_queue(&module_wq, &wait);
+
+	return ret;
+}
+
 /*
  * We try to place it in the list now to make sure it's unique before
  * we dedicate too many resources.  In particular, temporary percpu
@@ -3114,8 +3136,8 @@ static int add_unformed_module(struct mo
 		    || old->state =3D=3D MODULE_STATE_UNFORMED) {
 			/* Wait in case it fails to load. */
 			mutex_unlock(&module_mutex);
-			err =3D wait_event_interruptible(module_wq,
-					       finished_loading(mod->name));
+
+			err =3D wait_finished_loading(mod);
 			if (err)
 				goto out_unlocked;
 			goto again;

--===============5258640850837019227==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJYkJBRUJBZ0FHQlFKVDQxZmtBQW9KRUhaSDRhUkx3T1M2VDdNUDlqc2RQdXBv
aFBubE5STEk2QzRtdjJGMgpEOVlVK0drL05hUkZ1RVNHT2JnU1hSRGErLzlpUEpYK0NVYjBYcDN1
eWJDdnE2bWdxU1BOZ1JJZ1IrTDJ3UXpsCmRhWG05VTJvbmRtcHpkeWtPV3J5a0xaayt3OENYRWV2
RnQzbkNZY24xT2Ryamg0cU1UV1BUOHlpYXorTzgzZEkKYjNHWlN0VS9Jc2hSYmhMOElSRWNuTC9W
ZVl5aXh1djRWelZWV3JkWEVycHVRcjh1YTJKYkpJbkdmb3hoMDlNdQorbDBsZHRMc0NQSlVveU44
RFpsa01SK0p3NW1zbkovaXF3RTczMU5ZR2RTK1hQUUxuSEx0UUw5ek1vVXhSbHVUCm5WMEdvaWUr
UndObnNFNVp6ZlpueDZWS3A5SU1zem8wdW9kTVpwd0pvZ0VGZDV6cG1OaXlBWDc5UFhQakk4dWQK
anBQQ1JRSGdzaGRWaGcrZ1hhMjVsOUFZdklwNnBra3FhczlDcWNXV1BlOVMzTlJsR1lqL3gwUFNR
SE5Ba2tHQQpPTTVYNDhmS0xUNyttRGtrdFYwOXhtalh5QVpmOEFNVmhBK3hwTHZ5R2NFUTRBcUc4
cE9ZNUw0NFhpcWZVb0ZOCnhhaExrbFdsN2JEK3dFMmdQZEY0ejA4RC9yK3BwT3BSdWFleW1sMGNy
ZDVNMUFPUVFaQjMxZ3B6SzBSVWR5M1cKZUt5dThGUHJERi9STkZVUHJxTkEvOWZMN3kzMkljaVZy
MmNxTWZ6ajVxOWtrQmdQV08wYS9ETWl0dWVieXhSawp2b1M0Z0x6UHRwNnJOKzRMR1V0T0dDNG5x
MVlMbmMxMXcyUmRzVXA4K001UUswODJrcTFoOEYxanpwclEvY3duCkROcHZodlNUNSs5QmZwMHBm
ZWM9Cj16b3FwCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5258640850837019227==--


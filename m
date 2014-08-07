Content-Type: multipart/mixed; boundary="===============7582163203588230503=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [setsockopt] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7088 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 17:17:41 +0200
Message-ID: <20140807151741.GP19379@twins.programming.kicks-ass.net>
In-Reply-To: <20140805214624.GA9973@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7582163203588230503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 05:46:24AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> Here is a microcode/load_module error triggered by debug check commit
> 64c2181bc433b17f04da8fe8592aa83cceac9606 ("sched: Debug nested sleeps"):
> =

> [main] Setsockopt(1 8 80d1000 4) on fd 21 [1:2:1]
> [main] Setsockopt(1 2f 80d1000 4) on fd 22 [4:2:60]
> [   14.027148] ------------[ cut here ]------------
> [   14.027864] WARNING: CPU: 0 PID: 210 at kernel/sched/core.c:7088 __mig=
ht_sleep+0x40/0x68()
> [   14.029295] do not call blocking ops when !TASK_RUNNING; state=3D2 set=
 at [<c144e379>] prepare_to_wait+0x35/0x56
> [   14.030590] Modules linked in:
> [   14.031136] CPU: 0 PID: 210 Comm: trinity-main Not tainted 3.16.0-0216=
7-g254135e #972
> [   14.032263]  00000000 c0f4de4c c0f4de24 c196630c c0f4de3c c142f01a c14=
47632 c0f1dbb0
> [   14.033480]  00000002 b0066140 c0f4de54 c142f057 00000009 c0f4de4c c1b=
3bac8 c0f4de68
> [   14.034640]  c0f4de88 c1447632 c1b3bb12 00001bb0 c1b3bac8 00000002 c14=
4e379 c144e379
> [   14.035983] Call Trace:
> [   14.036355]  [<c196630c>] dump_stack+0x16/0x18
> [   14.037005]  [<c142f01a>] warn_slowpath_common+0x55/0x6c
> [   14.037715]  [<c1447632>] ? __might_sleep+0x40/0x68
> [   14.038372]  [<c142f057>] warn_slowpath_fmt+0x26/0x2a
> [   14.039097]  [<c1447632>] __might_sleep+0x40/0x68
> [   14.039787]  [<c144e379>] ? prepare_to_wait+0x35/0x56
> [   14.040595]  [<c144e379>] ? prepare_to_wait+0x35/0x56
> [   14.041272]  [<c14a837e>] kmem_cache_alloc+0x39/0xb0
> [   14.041934]  [<c18fa2de>] ? __alloc_skb+0x3c/0x154
> [   14.042572]  [<c18fa2de>] __alloc_skb+0x3c/0x154
> [   14.043339]  [<c145117a>] ? mark_held_locks+0x44/0x60
> [   14.044141]  [<c1946093>] sigd_enq2+0x2a/0xff
> [   14.044836]  [<c1946188>] sigd_enq+0x20/0x2a
> [   14.045405]  [<c19467fb>] svc_listen+0x8b/0x11f
> [   14.046009]  [<c144e5a6>] ? __wake_up_sync+0xd/0xd
> [   14.046653]  [<c18f4132>] SyS_listen+0x37/0x51
> [   14.047423]  [<c18f4ce5>] SyS_socketcall+0x90/0x1c0
> [   14.048328]  [<c145136e>] ? trace_hardirqs_on+0xb/0xd
> [   14.049061]  [<c19729f6>] ? restore_all+0xf/0xf
> [   14.049665]  [<c19729bd>] syscall_call+0x7/0x7
> [   14.050253]  [<c1970000>] ? __ww_mutex_lock_interruptible+0x165/0x573
> [   14.051147] ---[ end trace 6f1365c63eafedde ]---
> [main] Setsockopt(1 2d 80d1000 f0) on fd 25 [1:1:1]

---
Subject: atm: Fix blocking in wait loop

One should not call blocking primitives inside a wait loop, since both
require task_struct::state to sleep, so the inner will destroy the outer
state.

In this instance sigd_enq() will possible sleep for alloc_skb(), now if
I understand the code right, we do not actually need to call sigd_enq()
after the initial prepare_to_wait(), because we test the termination
condition before schedule() anyhow.

So we can simply move it up a bit and avoid the entire confusion.

Signed-off-by: Peter Zijlstra <peterz@infradead.org>
---
 net/atm/svc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/atm/svc.c b/net/atm/svc.c
index d8e5d0c2ebbc..445ac238b69b 100644
--- a/net/atm/svc.c
+++ b/net/atm/svc.c
@@ -297,8 +297,8 @@ static int svc_listen(struct socket *sock, int backlog)
 		goto out;
 	}
 	set_bit(ATM_VF_WAITING, &vcc->flags);
-	prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);
 	sigd_enq(vcc, as_listen, NULL, NULL, &vcc->local);
+	prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);
 	while (test_bit(ATM_VF_WAITING, &vcc->flags) && sigd) {
 		schedule();
 		prepare_to_wait(sk_sleep(sk), &wait, TASK_UNINTERRUPTIBLE);

--===============7582163203588230503==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDQ1aVZBQW9KRUhaSDRhUkx3T1M2V29vUC8xZC8vMExJ
RVE5bm5ac2pybGl2RjJ5NgprdDlQSjJISEVtZDk5RFN5TkF2Z0RQNFlLWkx2Zy9SR3hJdVM5alg4
dUxsckZFL0ZDckhqLzhDMmMvOWYrMmtGCnE4RXNjVy8vazVMQUx2SDE1QjZLY2srS3hBSWt1OFNq
NW9kNkNCTStLdXYyTkVwSzAyTUZyTmN6Y1ZRNUljdzcKWVFBbkgrb3JXS1IwRHZDRlBFc3piUWVj
dzU2NUJnVzc3T0pEaktlT3UzOEpIbGhuaWhrZ3p4bURoTjI2SGpHeApHQzZIcWYvQUF6cWxUTkcv
Y2c0Vzh1OCtJcUpaRzdkakszY09NWmMzdnR3ZkNicHJCN2RnYnlzbC9pcHJ2YlpjCk0xRVgvaC8x
WWJIcjVEMCsyNVZDd3BlcUIrOTBBbkRuQkc5VEFwVSttVUZIaktGNzRjRml4L0Z1am5ZQlZ2SU0K
U0hCQmRrY2xSNWlXblZpdDFWZ1JUN3FjSkFteGY1Tk1Ua2FKTFM3ODl6bS91SEJWRmgrcnV5TlNw
aDAwRFZQUQp0SXJqTU1ZR3Z4QXNad3Z5ZTlYcHlCaVNhQmZmMTh2eVVTWm14b28ycGpnSVRNTVls
ZE5LZVdpbHJFaSt4QVRxCm1vTzRacGNHY2xIU0NBTE9jOUU0YUpCSTRBVXNINDd4VXhjYTJzVjAx
Z0xYTnl1RnhFR05VRW9BNTN1bTliQlkKZ1ViKzV1RDNpcldob1NkT0NzRFprd1lkNWM5dzVBdkFY
bm9UMUlwdVN4cTNtMmpYTitaU2RXM204L0o0d2twcgpjQThybURlWDk0UTFOdS9STlJmLzNNNFBU
bm92SVdHQW9LV2FmdEpkUlM3VmhaQzdHNHpBM2JyK0ttTWhOQWRKClBqMCt2QlRxNzhHWklpU1h5
dGw5Cj1FWkh2Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7582163203588230503==--


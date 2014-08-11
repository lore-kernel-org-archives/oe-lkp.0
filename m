Content-Type: multipart/mixed; boundary="===============0879131729560294922=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 096aa33863a: -21.4% hackbench.throughput, -20.2% netperf.Throughput_Mbps
Date: Mon, 11 Aug 2014 16:17:36 +0200
Message-ID: <20140811141736.GD9918@twins.programming.kicks-ass.net>
In-Reply-To: <53E3C270.1010302@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0879131729560294922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 02:16:16PM -0400, Rik van Riel wrote:
> On 08/07/2014 06:53 AM, Fengguang Wu wrote:
> > Hi Rik,
> > =

> > We noticed the below performance regression in commit
> > 096aa33863a5e48de52d2ff30e0801b7487944f4 ("sched/numa: Decay
> > ->wakee_flips instead of zeroing")
> > =

> > b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
> > ---------------  -------------------------  ---------------------------
> >     122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  lkp-snb01/hackben=
ch/50%-process-pipe
> >     122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  TOTAL hackbench.t=
hroughput
> =

> I guess the performance of that benchmark depends on it
> "slipping under the wire" after each time the kernel
> zeroes out ->wakee_flips.
> =

> Depending on repeatedly pulling the wakee back to the same
> node as the waker suggests something else in the kernel may
> be pulling the wakee to another place in the system repeatedly,
> as well, just at a lower frequency (load balancer?).
> =

> I have also noticed that select_idle_sibling often fails to
> find an idle sibling within the LLC domain, even when it
> exists. Fixing that bug sometimes results in lower performance.
> =

> It appears that some of the performance results of the scheduler
> appear on the code acting in an opposite way to its documented
> intention.
> =

> It may be best to revert 096aa33863a for now...

Does something like so cure anything? Is that a 'normal' hackbench run?
lemme see if I can reproduce on anything.

---
 kernel/sched/fair.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bfa3c86d0d68..13f00daf8028 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4098,14 +4098,19 @@ static unsigned long cpu_avg_load_per_task(int cpu)
 =

 static void record_wakee(struct task_struct *p)
 {
+	unsigned long now =3D jiffies;
 	/*
 	 * Rough decay (wiping) for cost saving, don't worry
 	 * about the boundary, really active task won't care
 	 * about the loss.
 	 */
-	if (time_after(jiffies, current->wakee_flip_decay_ts + HZ)) {
+	if (time_after(now, current->wakee_flip_decay_ts + BITS_PER_LONG * HZ)) {
+		current->wakee_flips =3D 0;
+		current->wakee_flip_decay_ts =3D now;
+	} else while (time_after(now, current->wakee_flip_decay_ts + HZ) && =

+		      current->wakee_flips) {
 		current->wakee_flips >>=3D 1;
-		current->wakee_flip_decay_ts =3D jiffies;
+		current->wakee_flip_decay_ts +=3D HZ;
 	}
 =

 	if (current->last_wakee !=3D p) {

--===============0879131729560294922==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDZOQ0FBQW9KRUhaSDRhUkx3T1M2QXRvUC8wN05QZGl6
c2tXeURNdVB0R3RXbVZHRwpoVnBFYVZEMTV3bzNrTVBlVXdwRWtYVmVWS1RZTTJTYUpWM1dHSmFJ
UGlkajlNNEd3QmxxRnBXUDUwZUtTUHBKCmQvQ05NOWRKWEtGWmE2bllKWi80V2FDVzJLNWNhbkto
Qm9VN3pRTElzalZ6M2ZmR2N1K3pVZlQ3dDgvVENVNWkKdWNsUFJwWm9FMUNxOEVici91ZnEvMEJp
dmErZDJMcytGc08rSTlzcW5xUk1lK3pvM1FUMmxWRW9zWTRTbzkvSQo2MHg5M25CeEV5OEtNU05Z
b280UWpIQkZ6ZEpvd240aHJYZDJsanZ5eWlmd2tXenVwUFJrQjZUeEdSR0l0M2ZLCmE1MXJYTFdP
bHEwUjhqUHh4bEExaXFtbWkvYyt5TVcxV09Dd0pJTmFja2ZhSk9nWVAyUi96ZnhpMnc5enZFc2YK
cHk5NFR4ekYxU0I2aVVuZjNsdGdaRHozYU1KWW1iaXdaSGdmQWdObnlIQ3RZUDYweXVvUFVhMllr
enMrUmdMeApTbmRUdGd2S0JmcjVvOG9kaUN2aXY1N01zNjhvNmswc3hRbWJJbWh4OC9aZ1lubGxM
aTlyY2hRWEkzd3NYdlkwCmQrOExoZFFzVUgvOXpKcGVKRG1KdGl2VjB0OW80Q2E1MFRGdEVKUHhH
NU1ySk1hdFA5M0lwaElGMkR2YWRlUkIKWUhzZzliUVNHbTZpZHhXU05wbHNSdTVxOFgxOXJQQnlr
M1UyaTdZZmk0aEtQSk9XNnpMYUl4TGtLMjBqRnZMQQo0WGg1VlNKb2ZMNTNVUjN6SmtUN0xQK1Y2
dHZCeEFuOFlwZmZFVVI4bmYweUt6ZGF4RWlrOUZ0My85d1piTjY4CjFkSFQ4S0FOMG03amJpY1Qr
bjNmCj10L08rCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0879131729560294922==--


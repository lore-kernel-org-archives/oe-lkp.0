Content-Type: multipart/mixed; boundary="===============4881236822413710109=="
MIME-Version: 1.0
From: pang.xunlei <pang.xunlei@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH] time: Avoid possible NTP adjustment mult overflow
Date: Tue, 25 Nov 2014 09:16:20 +0800
Message-ID: <1416878180-25312-1-git-send-email-pang.xunlei@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4881236822413710109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ideally, __clocksource_updatefreq_scale, selects the largest shift
value possible for a clocksource. This results in the mult memember
of struct clocksource being particularly large, although not so large
that NTP would adjust the clock to cause it to overflow.

That said, nothing actually prohibits an overflow from occurring, its
just that it "shouldn't" occur.

So while very unlikely, and so far never observed, the value of
(cs->mult+cs->maxadj) may have a chance to reach very near 0xFFFFFFFF,
so there is a possibility it may overflow when doing NTP positive
adjustment

See the following detail: When NTP slewes the clock, kernel goes
through update_wall_time()->...->timekeeping_apply_adjustment():
		 tk->tkr.mult +=3D mult_adj;

Since there is no guard against it, its possible tk->tkr.mult may
overflow during this operation.

This patch avoids any possible mult overflow by judging the overflow
case before adding mult_adj to mult, also adds the WARNING message
when capturing such case.

Signed-off-by: pang.xunlei <pang.xunlei@linaro.org>
---
Fix the problem in the former patch catched by Fengguang's 0day robot:
[time] WARNING: CPU: 0 PID: 1 at kernel/time/timekeeping.c:1337 update_wall=
_time()

 kernel/time/timekeeping.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 0aef92a..9a1482e 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1390,6 +1390,12 @@ static __always_inline void timekeeping_apply_adjust=
ment(struct timekeeper *tk,
 	 *
 	 * XXX - TODO: Doc ntp_error calculation.
 	 */
+	if (mult_adj > 0 && (tk->tkr.mult + mult_adj < mult_adj)) {
+		/* NTP adjustment caused clocksource mult overflow */
+		WARN_ON_ONCE(1);
+		return;
+	}
+
 	tk->tkr.mult +=3D mult_adj;
 	tk->xtime_interval +=3D interval;
 	tk->tkr.xtime_nsec -=3D offset;
-- =

1.7.9.5


--===============4881236822413710109==--


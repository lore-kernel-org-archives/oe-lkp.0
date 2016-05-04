Content-Type: multipart/mixed; boundary="===============7479674465191610911=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: [PATCH] intel_pstate: Fix intel_pstate_get()
Date: Wed, 04 May 2016 14:01:10 +0200
Message-ID: <54177738.QIcPrzf0Y7@vostro.rjw.lan>
In-Reply-To: <20160503083231.GG3430@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7479674465191610911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

After commit 8fa520af5081 "intel_pstate: Remove freq calculation from
intel_pstate_calc_busy()" intel_pstate_get() calls get_avg_frequency()
to compute the average frequency, which is problematic for two reasons.

First, intel_pstate_get() may be invoked before the driver reads the
CPU feedback registers for the first time and if that happens,
get_avg_frequency() will attempt to divide by zero.

Second, the get_avg_frequency() call in intel_pstate_get() is racy
with respect to intel_pstate_sample() and it may end up returning
completely meaningless values for this reason.

Moreover, after commit 7349ec0470b6 "intel_pstate: Move
intel_pstate_calc_busy() into get_target_pstate_use_performance()"
sample.core_pct_busy is never computed on Atom, but it is used in
intel_pstate_adjust_busy_pstate() in that case too.

To address those problems notice that if sample.core_pct_busy
was used in the average frequency computation carried out by
get_avg_frequency(), both the divide by zero problem and the
race with respect to intel_pstate_sample() would be avoided.

Accordingly, move the invocation of intel_pstate_calc_busy() from
get_target_pstate_use_performance() to intel_pstate_update_util(),
which also will take care of the uninitialized sample.core_pct_busy
on Atom, and modify get_avg_frequency() to use sample.core_pct_busy
as per the above.

Reported-by: kernel test robot <ying.huang@linux.intel.com>
Link: http://marc.info/?l=3Dlinux-kernel&m=3D146226437623173&w=3D4
Fixes: 8fa520af5081 "intel_pstate: Remove freq calculation from intel_pstat=
e_calc_busy()"
Fixes: 7349ec0470b6 "intel_pstate: Move intel_pstate_calc_busy() into get_t=
arget_pstate_use_performance()"
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/cpufreq/intel_pstate.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

Index: linux-pm/drivers/cpufreq/intel_pstate.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-pm.orig/drivers/cpufreq/intel_pstate.c
+++ linux-pm/drivers/cpufreq/intel_pstate.c
@@ -928,8 +928,9 @@ static inline bool intel_pstate_sample(s
 =

 static inline int32_t get_avg_frequency(struct cpudata *cpu)
 {
-	return div64_u64(cpu->pstate.max_pstate_physical * cpu->sample.aperf *
-		cpu->pstate.scaling, cpu->sample.mperf);
+	return fp_toint(mul_fp(cpu->sample.core_pct_busy,
+			       int_tofp(cpu->pstate.max_pstate_physical *
+						cpu->pstate.scaling / 100)));
 }
 =

 static inline int32_t get_target_pstate_use_cpu_load(struct cpudata *cpu)
@@ -972,8 +973,6 @@ static inline int32_t get_target_pstate_
 	int32_t core_busy, max_pstate, current_pstate, sample_ratio;
 	u64 duration_ns;
 =

-	intel_pstate_calc_busy(cpu);
-
 	/*
 	 * core_busy is the ratio of actual performance to max
 	 * max_pstate is the max non turbo pstate available
@@ -1056,8 +1055,11 @@ static void intel_pstate_update_util(str
 	if ((s64)delta_ns >=3D pid_params.sample_rate_ns) {
 		bool sample_taken =3D intel_pstate_sample(cpu, time);
 =

-		if (sample_taken && !hwp_active)
-			intel_pstate_adjust_busy_pstate(cpu);
+		if (sample_taken) {
+			intel_pstate_calc_busy(cpu);
+			if (!hwp_active)
+				intel_pstate_adjust_busy_pstate(cpu);
+		}
 	}
 }
 =



--===============7479674465191610911==--


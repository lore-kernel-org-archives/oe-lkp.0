Content-Type: multipart/mixed; boundary="===============7826851892218221310=="
MIME-Version: 1.0
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH] powercap/drivers/dtpm_cpu: Fix suspend failure and kernel warning
Date: Mon, 08 Nov 2021 07:23:44 +0100
Message-ID: <20211108062345.273855-1-daniel.lezcano@linaro.org>
In-Reply-To: <20211107095001.GC11442@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7826851892218221310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When the ENERGY_MODEL and DTPM_CPU are enabled but actually without
any energy model, at cpu hotplug time, the dead cpuhp callback fails
leading to the warning.

Actually, the check could be simplified and we only do an action if
the dtpm cpu is enabled, otherwise we bail out without error.

Fixes: 7a89d7eacf8e ("powercap/drivers/dtpm: Simplify the dtpm table")
Reported-by: Kenneth R. Crudup <kenny@panix.com>
Tested-by: Kenneth R. Crudup <kenny@panix.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Cc: lkp(a)lists.01.org
Cc: lkp(a)intel.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/powercap/dtpm_cpu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 69eb5101b5c7..477042199d90 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -166,16 +166,13 @@ static struct dtpm_ops dtpm_ops =3D {
 =

 static int cpuhp_dtpm_cpu_offline(unsigned int cpu)
 {
-	struct em_perf_domain *pd;
 	struct dtpm_cpu *dtpm_cpu;
 =

-	pd =3D em_cpu_get(cpu);
-	if (!pd)
-		return -EINVAL;
-
 	dtpm_cpu =3D per_cpu(dtpm_per_cpu, cpu);
+	if (dtpm_cpu)
+		dtpm_update_power(&dtpm_cpu->dtpm);
 =

-	return dtpm_update_power(&dtpm_cpu->dtpm);
+	return 0;
 }
 =

 static int cpuhp_dtpm_cpu_online(unsigned int cpu)
-- =

2.25.1

--===============7826851892218221310==--


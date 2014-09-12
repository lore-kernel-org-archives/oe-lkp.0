Content-Type: multipart/mixed; boundary="===============4242384799476634123=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Unable to change cpufreq governor
Date: Fri, 12 Sep 2014 13:22:54 +0800
Message-ID: <5412832E.7000406@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4242384799476634123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

The script used in LKP to change cpufreq governor triggered a lot of
errors on different test boxes with your branch:
https://git.linaro.org/people/vireshk/linux cpufreq/governor-fixes

[root(a)localhost cpufreq]# pwd
/sys/devices/system/cpu/cpu3/cpufreq
[root(a)localhost cpufreq]# echo ondemand > scaling_governor =

bash: echo: write error: Device or resource busy

This only occurs for acpi-cpufreq scaling driver.

After turned on the debug level:
[root(a)localhost ~]# echo 'module cpufreq +pft' > /sys/kernel/debug/dynami=
c_debug/control
And added a little more debug statements:

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 051d566dc522..4175b1cf7995 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2009,7 +2009,7 @@ EXPORT_SYMBOL_GPL(cpufreq_driver_target);
 static int __cpufreq_governor(struct cpufreq_policy *policy,
 					unsigned int event)
 {
-	int ret, state;
+	int ret, state, busy;
 =

 	/* Only must be defined when default governor is known to have latency
 	   restrictions, like e.g. conservative or ondemand.
@@ -2046,9 +2046,12 @@ static int __cpufreq_governor(struct cpufreq_policy =
*policy,
 =

 	mutex_lock(&cpufreq_governor_lock);
 	state =3D get_governor_state(policy);
+	pr_debug("state=3D%u\n", state);
 =

 	/* Check if operation is permitted or not */
-	if (is_governor_busy(policy)
+	busy =3D is_governor_busy(policy);
+	pr_debug("busy=3D%d\n", busy);
+	if (busy
 	    || (state =3D=3D CPUFREQ_GOV_START && event !=3D CPUFREQ_GOV_LIMITS &=
& event !=3D CPUFREQ_GOV_STOP)
 	    || (state =3D=3D CPUFREQ_GOV_STOP && event !=3D CPUFREQ_GOV_START && =
event !=3D CPUFREQ_GOV_POLICY_EXIT)
 	    || (state =3D=3D CPUFREQ_GOV_POLICY_INIT && event !=3D CPUFREQ_GOV_ST=
ART && event !=3D CPUFREQ_GOV_POLICY_EXIT)


the following output is printed with the above echo command:
[   61.869713] [1263] cpufreq_set_policy: cpufreq: setting new policy for C=
PU 3: 1600000 - 3401000 kHz
[   61.869732] [1263] cpufreq_set_policy: cpufreq: new min and max freqs ar=
e 1600000 - 3401000 kHz
[   61.869734] [1263] cpufreq_set_policy: cpufreq: governor switch
[   61.869736] [1263] __cpufreq_governor: cpufreq: __cpufreq_governor for C=
PU 3, event 2
[   61.869739] [1263] __cpufreq_governor: cpufreq: state=3D5
[   61.869741] [1263] __cpufreq_governor: cpufreq: busy=3D0

Please let me know if you need more information, thanks.

-Aaron

--===============4242384799476634123==--


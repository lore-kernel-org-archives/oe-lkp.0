Content-Type: multipart/mixed; boundary="===============8698663015115122705=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/aperfmperf] adabc53c25: WARNING:at_arch/x86/kernel/cpu/aperfmperf.c:#freq_invariance_enable
Date: Wed, 27 Apr 2022 16:51:39 +0200
Message-ID: <8735hyy3yc.ffs@tglx>
In-Reply-To: <20220426072238.GA613@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8698663015115122705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26 2022 at 15:22, kernel test robot wrote:
> [ 11.086251][ T1] WARNING: CPU: 4 PID: 1 at arch/x86/kernel/cpu/aperfmper=
f.c:431 freq_invariance_enable (arch/x86/kernel/cpu/aperfmperf.c:431) =

> [ 11.227178][ T1] init_freq_invariance_cppc (arch/x86/kernel/acpi/cppc.c:=
82 arch/x86/kernel/acpi/cppc.c:96) =

> [ 11.232574][ T1] acpi_cppc_processor_probe (drivers/acpi/cppc_acpi.c:832=
) =


Bah, the commit in question assumed that the CPPC muck is AMD only....

Fix below.

Thanks,

        tglx
---
--- a/arch/x86/kernel/acpi/cppc.c
+++ b/arch/x86/kernel/acpi/cppc.c
@@ -91,6 +91,9 @@ void init_freq_invariance_cppc(void)
 	if (!cpu_feature_enabled(X86_FEATURE_APERFMPERF))
 		return;
 =

+	if (boot_cpu_data.x86_vendor !=3D X86_VENDOR_AMD)
+		return;
+
 	mutex_lock(&freq_invariance_lock);
 	if (!init_done)
 		amd_set_max_freq_ratio();
--===============8698663015115122705==--


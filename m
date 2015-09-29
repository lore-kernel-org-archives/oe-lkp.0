Content-Type: multipart/mixed; boundary="===============4968386730173904590=="
MIME-Version: 1.0
From: Jani Nikula <jani.nikula@intel.com>
To: lkp@lists.01.org
Subject: [PATCH] drm/i915: disable CPU PWM also on LPT/SPT backlight disable
Date: Tue, 29 Sep 2015 15:41:48 +0300
Message-ID: <1443530508-12112-1-git-send-email-jani.nikula@intel.com>
In-Reply-To: <87y4fpmyqi.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4968386730173904590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Although we don't support or enable CPU PWM with LPT/SPT based systems,
it may have been enabled prior to loading the driver. Disable the CPU
PWM on LPT/SPT backlight disable to avoid warnings on LCPLL disable.

The issue has been present on BDW since BDW enabling, but was recently
introduced on HSW with

commit 437b15b8017e0d946453c10794b0c5d4591cf180
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 4 16:55:13 2015 +0300

    drm/i915: use pch backlight override on hsw too

Reference: http://mid.gmane.org/87y4frhwsn.fsf(a)yhuang-dev.intel.com
Reported-by: kernel test robot <ying.huang@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_panel.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_panel.c b/drivers/gpu/drm/i915/inte=
l_panel.c
index dd71e7f139e3..c9c94d05f3dd 100644
--- a/drivers/gpu/drm/i915/intel_panel.c
+++ b/drivers/gpu/drm/i915/intel_panel.c
@@ -731,6 +731,20 @@ static void lpt_disable_backlight(struct intel_connect=
or *connector)
 =

 	intel_panel_actually_set_backlight(connector, 0);
 =

+	/*
+	 * Although we don't support or enable CPU PWM with LPT/SPT based
+	 * systems, it may have been enabled prior to loading the
+	 * driver. Disable to avoid warnings on LCPLL disable.
+	 *
+	 * This needs rework if we need to add support for CPU PWM on PCH split
+	 * platforms.
+	 */
+	tmp =3D I915_READ(BLC_PWM_CPU_CTL2);
+	if (tmp & BLM_PWM_ENABLE) {
+		DRM_DEBUG_KMS("cpu backlight was enabled, disabling\n");
+		I915_WRITE(BLC_PWM_CPU_CTL2, tmp & ~BLM_PWM_ENABLE);
+	}
+
 	tmp =3D I915_READ(BLC_PWM_PCH_CTL1);
 	I915_WRITE(BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
 }
-- =

2.1.4


--===============4968386730173904590==--


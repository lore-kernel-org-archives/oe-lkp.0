Content-Type: multipart/mixed; boundary="===============4357885114787632878=="
MIME-Version: 1.0
From: Antoine, Peter <peter.antoine@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/huc] 0a9a963e36: [drm:intel_uc_fw_fetch [i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_1398.bin (error -2)
Date: Mon, 11 Jul 2016 07:17:01 +0000
Message-ID: <C182EC90AE29B54BB712270726FAFA75145B43BB@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <20160711013931.GH26840@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4357885114787632878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do you have the firmware package for the SKL huc?

Peter
-----Original Message-----
From: lkp-request(a)eclists.intel.com [mailto:lkp-request(a)eclists.intel.c=
om] On Behalf Of Ye, Xiaolong
Sent: Monday, July 11, 2016 2:40 AM
To: Antoine, Peter <peter.antoine@intel.com>
Cc: Wu, Fengguang <fengguang.wu@intel.com>; Alex Dai <yu.dai@intel.com>=
; LKML <linux-kernel@vger.kernel.org>; lkp(a)01.org
Subject: [lkp] [drm/i915/huc] 0a9a963e36: [drm:intel_uc_fw_fetch [i915]] *E=
RROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_1398.bin (err=
or -2)


FYI, we noticed the following commit:

https://github.com/0day-ci/linux Peter-Antoine/drm-i915-guc-Make-the-GuC-fw=
-loading-helper-functions-general/20160706-223108
commit 0a9a963e364435950699fee4b8e76cd9b01889f4 ("drm/i915/huc: Add HuC fw =
loading support")

in testcase: xsave-test
with following parameters: =


on test machine: 8 threads Skylake with 8G memory

caused below changes:



[  204.239941] i915 0000:00:02.0: Failed to load DMC firmware [https://01.o=
rg/linuxgraphics/intel-linux-graphics-firmwares], disabling runtime power m=
anagement.
[  204.240249] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[  204.240749] i915 0000:00:02.0: Direct firmware load for i915/skl_huc_ver=
01_07_1398.bin failed with error -2 [  204.240775] [drm:intel_uc_fw_fetch [=
i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_1398=
.bin (error -2) [  204.240780] i915 0000:00:02.0: Direct firmware load for =
i915/skl_guc_ver6_1.bin failed with error -2 [  204.240797] [drm:intel_uc_f=
w_fetch [i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_guc_ver6=
_1.bin (error -2) [  204.263705] [drm] GuC firmware load failed: -5 [  204.=
263705] [drm] Falling back from GuC submission to execlist mode [  204.2865=
39] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)



To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml



Thanks,
Xiaolong

--===============4357885114787632878==--


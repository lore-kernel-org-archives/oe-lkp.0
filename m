Content-Type: multipart/mixed; boundary="===============4511427669993592980=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/huc] 0a9a963e36: [drm:intel_uc_fw_fetch [i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_1398.bin (error -2)
Date: Mon, 11 Jul 2016 22:05:47 +0800
Message-ID: <20160711140547.GA27324@yexl-desktop>
In-Reply-To: <C182EC90AE29B54BB712270726FAFA75145B43BB@IRSMSX102.ger.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4511427669993592980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 03:17:01PM +0800, Antoine, Peter wrote:
>Do you have the firmware package for the SKL huc?

Sorry, no, is this error log due to lack of the firmware?

Thanks,
Xiaolong
>
>Peter
>-----Original Message-----
>From: lkp-request(a)eclists.intel.com [mailto:lkp-request(a)eclists.intel.=
com] On Behalf Of Ye, Xiaolong
>Sent: Monday, July 11, 2016 2:40 AM
>To: Antoine, Peter <peter.antoine@intel.com>
>Cc: Wu, Fengguang <fengguang.wu@intel.com>; Alex Dai <yu.dai@intel.com=
>; LKML <linux-kernel@vger.kernel.org>; lkp(a)01.org
>Subject: [lkp] [drm/i915/huc] 0a9a963e36: [drm:intel_uc_fw_fetch [i915]] *=
ERROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_1398.bin (er=
ror -2)
>
>
>FYI, we noticed the following commit:
>
>https://github.com/0day-ci/linux Peter-Antoine/drm-i915-guc-Make-the-GuC-f=
w-loading-helper-functions-general/20160706-223108
>commit 0a9a963e364435950699fee4b8e76cd9b01889f4 ("drm/i915/huc: Add HuC fw=
 loading support")
>
>in testcase: xsave-test
>with following parameters: =

>
>on test machine: 8 threads Skylake with 8G memory
>
>caused below changes:
>
>
>
>[  204.239941] i915 0000:00:02.0: Failed to load DMC firmware [https://01.=
org/linuxgraphics/intel-linux-graphics-firmwares], disabling runtime power =
management.
>[  204.240249] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
>[  204.240749] i915 0000:00:02.0: Direct firmware load for i915/skl_huc_ve=
r01_07_1398.bin failed with error -2 [  204.240775] [drm:intel_uc_fw_fetch =
[i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_huc_ver01_07_139=
8.bin (error -2) [  204.240780] i915 0000:00:02.0: Direct firmware load for=
 i915/skl_guc_ver6_1.bin failed with error -2 [  204.240797] [drm:intel_uc_=
fw_fetch [i915]] *ERROR* Failed to fetch GuC firmware from i915/skl_guc_ver=
6_1.bin (error -2) [  204.263705] [drm] GuC firmware load failed: -5 [  204=
.263705] [drm] Falling back from GuC submission to execlist mode [  204.286=
539] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
>
>
>
>To reproduce:
>
>        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-te=
sts.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
>
>
>
>Thanks,
>Xiaolong

--===============4511427669993592980==--


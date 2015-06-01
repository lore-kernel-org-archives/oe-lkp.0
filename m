Content-Type: multipart/mixed; boundary="===============4724272416578359519=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 1/2] Disable turbostat monitoring if no MSR in cpu
Date: Mon, 01 Jun 2015 13:46:04 +0300
Message-ID: <1433155565-24724-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4724272416578359519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

turbostat depends on MSR, which is X86 specific.
Avoid building and running on other architectures,
by checking for the presence of MSR bit for cpuinfo.
A check against RAPL support would be even better,
but unfortunely there doesn't seem to be flag for
rapl in cpuinfo

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 monitors/turbostat | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/monitors/turbostat b/monitors/turbostat
index b9d22c9..b3b4bf1 100755
--- a/monitors/turbostat
+++ b/monitors/turbostat
@@ -1,5 +1,8 @@
 #!/bin/sh
 =

+# skip if cpu doesn't have msr
+grep flags /proc/cpuinfo|grep -q ' msr ' || exit 0
+
 # skip unreliable machines
 [ "${HOSTNAME#*lkp-a0[1-9]}"	!=3D "$HOSTNAME" ] && exit 0
 [ "${HOSTNAME#*snb-drag}"	!=3D "$HOSTNAME" ] && exit 0
-- =

2.1.4


--===============4724272416578359519==--


Content-Type: multipart/mixed; boundary="===============3976592094740189276=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 1/2] detect-system: add arm and arm64
Date: Fri, 29 May 2015 14:01:29 +0300
Message-ID: <1432897290-7364-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3976592094740189276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Add the architectures to allow running LKP on
arm based architectures. The actual information
doesn't seem to be used (no use on _system_arch
or systemArch found with grep), so alternative
could be the entire detection logic.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 lib/detect-system.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/detect-system.sh b/lib/detect-system.sh
index 65de2ee..7460c15 100755
--- a/lib/detect-system.sh
+++ b/lib/detect-system.sh
@@ -25,6 +25,10 @@ parse_executable_arch()
 			_system_arch=3Dx86_64;;
 		*80[3456]86)
 			_system_arch=3Di386;;
+		*AArch64)
+			_system_arch=3Daarch64;;
+		*ARM)
+			_system_arch=3Darm;;
 		*)
 			_system_arch=3Dunknown
 			return 1;;
-- =

2.1.4


--===============3976592094740189276==--


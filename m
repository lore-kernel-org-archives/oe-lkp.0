Content-Type: multipart/mixed; boundary="===============0728695802072678849=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 3/3] sockperf: update to git
Date: Fri, 05 Jun 2015 15:01:38 +0300
Message-ID: <1433505698-5883-3-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0728695802072678849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Update to git version for ARM/Aarch64 support. We
need to switch branch since master on github is pointing
to wrong version.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 pack/sockperf | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/pack/sockperf b/pack/sockperf
index d1e80f2..45745a2 100755
--- a/pack/sockperf
+++ b/pack/sockperf
@@ -1,7 +1,19 @@
 #!/bin/bash
 =

-VERSION=3D"2.5.241"
-WEB_URL=3D"http://sockperf.googlecode.com/files/${BM_NAME}-${VERSION}.tar.=
gz"
+download()
+{
+	git_clone_update https://github.com/Mellanox/sockperf.git
+	source_dir=3Dsockperf
+}
+
+build()
+{
+	cd "$source_dir"
+	git checkout -b build origin/sockperf_v2
+	./autogen.sh
+	./configure
+	make
+}
 =

 install()
 {
-- =

2.1.4


--===============0728695802072678849==--


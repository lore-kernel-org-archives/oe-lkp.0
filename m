Content-Type: multipart/mixed; boundary="===============4179289205553600370=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 2/3] update configs for aarch64
Date: Fri, 05 Jun 2015 15:01:37 +0300
Message-ID: <1433505698-5883-2-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4179289205553600370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

These tests have outdated config.sub config.guess files that don't know
aarch64. Update them before configure.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 pack/blogbench | 8 ++++++++
 pack/netperf   | 7 +++++++
 pack/thrulay   | 7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/pack/blogbench b/pack/blogbench
index 3311666..d23cce7 100755
--- a/pack/blogbench
+++ b/pack/blogbench
@@ -3,6 +3,14 @@
 VERSION=3D1.1
 WEB_URL=3D"http://download.pureftpd.org/pub/blogbench/blogbench-${VERSION}=
.tar.gz"
 =

+build()
+{
+    cd "$source_dir"
+    cp /usr/share/misc/config.{guess,sub} .
+    ./configure $CONFIGURE_FLAGS
+    make
+}
+
 install()
 {
 	cp -af src/blogbench ${BM_ROOT}
diff --git a/pack/netperf b/pack/netperf
index 610d06a..16e1a24 100755
--- a/pack/netperf
+++ b/pack/netperf
@@ -3,3 +3,10 @@
 VERSION=3D"2.6.0"
 WEB_URL=3D"ftp://ftp.netperf.org/netperf/netperf-${VERSION}.tar.gz"
 CONFIGURE_FLAGS=3D"--prefix=3D$BM_ROOT --enable-demo --enable-unixdomain -=
-enable-sctp --enable-dccp --enable-burst"
+build()
+{
+    cd "$source_dir"
+    cp /usr/share/misc/config.{guess,sub} .
+    ./configure $CONFIGURE_FLAGS
+    make
+}
diff --git a/pack/thrulay b/pack/thrulay
index 70d2623..7aaa45d 100755
--- a/pack/thrulay
+++ b/pack/thrulay
@@ -3,3 +3,10 @@
 VERSION=3D"0.9"
 WEB_URL=3D"http://jaist.dl.sourceforge.net/project/${BM_NAME}/${BM_NAME}/$=
{VERSION}/${BM_NAME}-${VERSION}.tar.gz"
 CONFIGURE_FLAGS=3D"--prefix=3D$BM_ROOT"
+build()
+{
+    cd "$source_dir"
+    cp /usr/share/misc/config.{guess,sub} .
+    ./configure $CONFIGURE_FLAGS
+    make
+}
-- =

2.1.4


--===============4179289205553600370==--


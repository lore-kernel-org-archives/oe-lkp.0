Content-Type: multipart/mixed; boundary="===============0862138501946367292=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 2/2] ebizzy: patch for modern toolchains
Date: Fri, 29 May 2015 14:01:30 +0300
Message-ID: <1432897290-7364-2-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0862138501946367292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Gcc prefers -pthread over -lpthread. On some legacy-free systems
like Aarch64, compile and link with -lpthread doesn't work.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 pack/ebizzy.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/pack/ebizzy.patch b/pack/ebizzy.patch
index ef3477f..55c0c48 100644
--- a/pack/ebizzy.patch
+++ b/pack/ebizzy.patch
@@ -1,4 +1,15 @@
 # patch from Mel Gorman's MMTests
+--- ebizzy-0.3/configure        2007-10-02 05:49:45.000000000 +0300
++++ ebizzy-0.3-fix/configure    2015-05-29 12:43:41.973028023 +0300
+@@ -16,7 +16,7 @@
+        exit 1
+ fi
+ =

+-LIBS=3D"-lpthread"
++LIBS=3D"-pthread"
+ FLAGS=3D""
+ =

+ case "$OS" in
 diff --git a/ebizzy.c b/ebizzy.c
 index 76c7492..3e7644f 100644
 --- a/ebizzy.c
-- =

2.1.4


--===============0862138501946367292==--


Content-Type: multipart/mixed; boundary="===============1209708979383492073=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 2/2] setup-local: treat ubuntu as debian
Date: Mon, 01 Jun 2015 13:46:05 +0300
Message-ID: <1433155565-24724-2-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1209708979383492073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Most of the ubuntu packages come from debian anyways, so assuming
universe is in the sources.list, you can treat ubuntu as debian.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 bin/setup-local | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/setup-local b/bin/setup-local
index 7783fcb..d1726b5 100755
--- a/bin/setup-local
+++ b/bin/setup-local
@@ -127,7 +127,7 @@ end
 =

 distroInfo =3D LKP::DistroInfo.instance
 =

-if distroInfo.systemNameL =3D=3D "debian"
+if distroInfo.systemNameL =3D=3D "debian" or distroInfo.systemNameL =3D=3D=
 "ubuntu"
 	distro =3D "debian"
 else
 	puts "Not a Debian system, cannot install packages under #{LKP_SRC}/distr=
o/debian"
-- =

2.1.4


--===============1209708979383492073==--


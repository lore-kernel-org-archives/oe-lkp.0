Content-Type: multipart/mixed; boundary="===============0946349055652658095=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH] nepim: workaround for ubuntu builds
Date: Wed, 10 Jun 2015 10:34:55 +0300
Message-ID: <1433921695-3944-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0946349055652658095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Ubuntu uses --as-needed by default, which means one has to
change the order of linking with libraries last. In order to
avoid having to patch the makefile, just use the --no--as-needed
LDFLAG to disable the behaviour change.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 pack/nepim | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pack/nepim b/pack/nepim
index 49a9a82..3a8dee6 100755
--- a/pack/nepim
+++ b/pack/nepim
@@ -6,7 +6,7 @@ WEB_URL=3D"http://download.savannah.gnu.org/releases/${BM_N=
AME}/${BM_NAME}-${VERSI
 build()
 {
 	cd $source_dir/src
-	make
+	LDFLAGS=3D"-Wl,--no-as-needed" make
 }
 =

 install()
-- =

2.1.4


--===============0946349055652658095==--


Content-Type: multipart/mixed; boundary="===============3846194410423037672=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: [PATCH] EDAC, ghes: Do not enable it by default
Date: Wed, 26 Apr 2017 12:27:02 +0200
Message-ID: <20170426102702.jooqmb2tvoonelrb@pd.tnic>
In-Reply-To: <20170426100824.xch6zokrsmpjelbg@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3846194410423037672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now as a proper patch:

From: Borislav Petkov <bp@suse.de>
Date: Wed, 26 Apr 2017 12:22:08 +0200
Subject: [PATCH] EDAC, ghes: Do not enable it by default

Leave it to the user to decide whether to enable this or not. Otherwise,
platform-specific drivers won't initialize (currently, EDAC supports
only a single platform driver loaded).

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/edac/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 27337ef9874b..96afb2aeed18 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -55,7 +55,6 @@ config EDAC_DECODE_MCE
 config EDAC_GHES
 	bool "Output ACPI APEI/GHES BIOS detected errors via EDAC"
 	depends on ACPI_APEI_GHES && (EDAC=3Dy)
-	default y
 	help
 	  Not all machines support hardware-driven error report. Some of those
 	  provide a BIOS-driven error report mechanism via ACPI, using the
-- =

2.11.0

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============3846194410423037672==--


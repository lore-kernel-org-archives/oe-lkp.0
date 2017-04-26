Content-Type: multipart/mixed; boundary="===============2320320784725476165=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] e3c4ff6d8c: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Wed, 26 Apr 2017 12:08:24 +0200
Message-ID: <20170426100824.xch6zokrsmpjelbg@pd.tnic>
In-Reply-To: <20170426072005.y3u3aiqojccop5ow@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============2320320784725476165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Btw,

the least we should do before the merge window is below because
otherwise now with CONFIG_EDAC=3Dy, apei_ghes will be always builtin.

---
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

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============2320320784725476165==--


Content-Type: multipart/mixed; boundary="===============0658183333762178761=="
MIME-Version: 1.0
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: lkp@lists.01.org
Subject: [PATCH 1/1] ACPI: property: Fix error handling in acpi_init_properties()
Date: Tue, 09 Aug 2022 00:12:13 +0300
Message-ID: <20220808211213.1055148-1-sakari.ailus@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0658183333762178761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

buf.pointer, memory for storing _DSD data and nodes, was released if either
parsing properties or, as recently added, attaching data node tags failed.
Alas, properties were still left pointing to this memory if parsing
properties were successful but attaching data node tags failed.

Fix this by separating error handling for the two, and leaving properties
intact if data nodes cannot be tagged for a reason or another.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: 1d52f10917a7 ("ACPI: property: Tie data nodes to acpi handles")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Rafael,

This should fix the immediate problem. It needs to be figured out why data
node tagging doesn't work sometimes but that can wait.

 drivers/acpi/property.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 9711482014a6..201a5a9b2671 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -566,13 +566,13 @@ void acpi_init_properties(struct acpi_device *adev)
 					&adev->data, acpi_fwnode_handle(adev)))
 		adev->data.pointer =3D buf.pointer;
 =

-	if (!adev->data.pointer ||
-	    !acpi_tie_nondev_subnodes(&adev->data)) {
-		acpi_untie_nondev_subnodes(&adev->data);
+	if (!adev->data.pointer) {
 		acpi_handle_debug(adev->handle, "Invalid _DSD data, skipping\n");
 		ACPI_FREE(buf.pointer);
+	} else {
+		if (!acpi_tie_nondev_subnodes(&adev->data))
+			acpi_untie_nondev_subnodes(&adev->data);
 	}
-
  out:
 	if (acpi_of && !adev->flags.of_compatible_ok)
 		acpi_handle_info(adev->handle,
-- =

2.30.2

--===============0658183333762178761==--


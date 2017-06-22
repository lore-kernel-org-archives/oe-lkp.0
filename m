Content-Type: multipart/mixed; boundary="===============6104330049147623593=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: [PATCH 3/3] Enable security.selinux in user namespaces
Date: Thu, 22 Jun 2017 14:59:49 -0400
Message-ID: <1498157989-11814-4-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1498157989-11814-1-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6104330049147623593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Before the current modifications, SELinux extended attributes were
visible inside the user namespace but changes in patch 1 hid them.
This patch enables security.selinux in user namespaces and allows
them to be written to in the same way as security.capability.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 fs/xattr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/xattr.c b/fs/xattr.c
index 045be85..37686ee 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -138,6 +138,7 @@ xattr_permission(struct inode *inode, const char *name,=
 int mask)
  */
 static const char *const userns_xattrs[] =3D {
 	XATTR_NAME_CAPS,
+	XATTR_NAME_SELINUX,
 	NULL
 };
 =

-- =

2.7.4


--===============6104330049147623593==--


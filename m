Content-Type: multipart/mixed; boundary="===============7404350568379671058=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH] bootconfig: Fix to check the xbc_node is used before free it
Date: Mon, 13 Sep 2021 09:56:45 +0900
Message-ID: <163149460533.291098.7342418455457691240.stgit@devnote2>
In-Reply-To: <20210912140820.GD25450@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7404350568379671058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix to check the xbc_node is used before calling memblock_free()
because passing NULL to phys_addr() will cause a panic.
This will happen if user doesn't pass any bootconfig to the
kernel, because kernel will call xbc_destroy_all() after
booting.

Fixes: 40caa127f3c7 ("init: bootconfig: Remove all bootconfig data when the=
 init memory is removed")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 lib/bootconfig.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index f8419cff1147..4f8849706ef6 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -792,7 +792,8 @@ void __init xbc_destroy_all(void)
 	xbc_data =3D NULL;
 	xbc_data_size =3D 0;
 	xbc_node_num =3D 0;
-	memblock_free(__pa(xbc_nodes), sizeof(struct xbc_node) * XBC_NODE_MAX);
+	if (xbc_nodes)
+		memblock_free(__pa(xbc_nodes), sizeof(struct xbc_node) * XBC_NODE_MAX);
 	xbc_nodes =3D NULL;
 	brace_index =3D 0;
 }

--===============7404350568379671058==--


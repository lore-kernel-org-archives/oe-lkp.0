Content-Type: multipart/mixed; boundary="===============6436485420469079528=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: [PATCH nf] netfilter: nft_compat: remove flush counter optimization
Date: Sun, 09 Aug 2020 20:28:01 +0200
Message-ID: <20200809182801.9315-1-fw@strlen.de>
In-Reply-To: <20200809063030.GA1538@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6436485420469079528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

WARNING: CPU: 1 PID: 16059 at lib/refcount.c:31 refcount_warn_saturate+0xdf=
/0xf
[..]
 __nft_mt_tg_destroy+0x42/0x50 [nft_compat]
 nft_target_destroy+0x63/0x80 [nft_compat]
 nf_tables_expr_destroy+0x1b/0x30 [nf_tables]
 nf_tables_rule_destroy+0x3a/0x70 [nf_tables]
 nf_tables_exit_net+0x186/0x3d0 [nf_tables]

Happens when a compat expr is destoyed from abort path.
There is no functional impact; after this work queue is flushed
unconditionally if its pending.

This removes the waitcount optimization.  Test of repeated
iptables-restore of a ~60k kubernetes ruleset doesn't indicate
a slowdown.  In case the counter is needed after all for some workloads
we can revert this and increment the refcount for the
!=3D NFT_PREPARE_TRANS case to avoid the increment/decrement imbalance.

While at it, also flush for match case, this was an oversight
in the original patch.

Fixes: ffe8923f109b7e ("netfilter: nft_compat: make sure xtables destructor=
s have run")
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Florian Westphal <fw@strlen.de>
---
 net/netfilter/nft_compat.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/net/netfilter/nft_compat.c b/net/netfilter/nft_compat.c
index 6428856ccbec..8e56f353ff35 100644
--- a/net/netfilter/nft_compat.c
+++ b/net/netfilter/nft_compat.c
@@ -27,8 +27,6 @@ struct nft_xt_match_priv {
 	void *info;
 };
 =

-static refcount_t nft_compat_pending_destroy =3D REFCOUNT_INIT(1);
-
 static int nft_compat_chain_validate_dependency(const struct nft_ctx *ctx,
 						const char *tablename)
 {
@@ -215,6 +213,17 @@ static int nft_parse_compat(const struct nlattr *attr,=
 u16 *proto, bool *inv)
 	return 0;
 }
 =

+static void nft_compat_wait_for_destructors(void)
+{
+	/* xtables matches or targets can have side effects, e.g.
+	 * creation/destruction of /proc files.
+	 * The xt ->destroy functions are run asynchronously from
+	 * work queue.  If we have pending invocations we thus
+	 * need to wait for those to finish.
+	 */
+	nf_tables_trans_destroy_flush_work();
+}
+
 static int
 nft_target_init(const struct nft_ctx *ctx, const struct nft_expr *expr,
 		const struct nlattr * const tb[])
@@ -238,14 +247,7 @@ nft_target_init(const struct nft_ctx *ctx, const struc=
t nft_expr *expr,
 =

 	nft_target_set_tgchk_param(&par, ctx, target, info, &e, proto, inv);
 =

-	/* xtables matches or targets can have side effects, e.g.
-	 * creation/destruction of /proc files.
-	 * The xt ->destroy functions are run asynchronously from
-	 * work queue.  If we have pending invocations we thus
-	 * need to wait for those to finish.
-	 */
-	if (refcount_read(&nft_compat_pending_destroy) > 1)
-		nf_tables_trans_destroy_flush_work();
+	nft_compat_wait_for_destructors();
 =

 	ret =3D xt_check_target(&par, size, proto, inv);
 	if (ret < 0)
@@ -260,7 +262,6 @@ nft_target_init(const struct nft_ctx *ctx, const struct=
 nft_expr *expr,
 =

 static void __nft_mt_tg_destroy(struct module *me, const struct nft_expr *=
expr)
 {
-	refcount_dec(&nft_compat_pending_destroy);
 	module_put(me);
 	kfree(expr->ops);
 }
@@ -468,6 +469,8 @@ __nft_match_init(const struct nft_ctx *ctx, const struc=
t nft_expr *expr,
 =

 	nft_match_set_mtchk_param(&par, ctx, match, info, &e, proto, inv);
 =

+	nft_compat_wait_for_destructors();
+
 	return xt_check_match(&par, size, proto, inv);
 }
 =

@@ -716,14 +719,6 @@ static const struct nfnetlink_subsystem nfnl_compat_su=
bsys =3D {
 =

 static struct nft_expr_type nft_match_type;
 =

-static void nft_mt_tg_deactivate(const struct nft_ctx *ctx,
-				 const struct nft_expr *expr,
-				 enum nft_trans_phase phase)
-{
-	if (phase =3D=3D NFT_TRANS_COMMIT)
-		refcount_inc(&nft_compat_pending_destroy);
-}
-
 static const struct nft_expr_ops *
 nft_match_select_ops(const struct nft_ctx *ctx,
 		     const struct nlattr * const tb[])
@@ -762,7 +757,6 @@ nft_match_select_ops(const struct nft_ctx *ctx,
 	ops->type =3D &nft_match_type;
 	ops->eval =3D nft_match_eval;
 	ops->init =3D nft_match_init;
-	ops->deactivate =3D nft_mt_tg_deactivate,
 	ops->destroy =3D nft_match_destroy;
 	ops->dump =3D nft_match_dump;
 	ops->validate =3D nft_match_validate;
@@ -853,7 +847,6 @@ nft_target_select_ops(const struct nft_ctx *ctx,
 	ops->size =3D NFT_EXPR_SIZE(XT_ALIGN(target->targetsize));
 	ops->init =3D nft_target_init;
 	ops->destroy =3D nft_target_destroy;
-	ops->deactivate =3D nft_mt_tg_deactivate,
 	ops->dump =3D nft_target_dump;
 	ops->validate =3D nft_target_validate;
 	ops->data =3D target;
@@ -917,8 +910,6 @@ static void __exit nft_compat_module_exit(void)
 	nfnetlink_subsys_unregister(&nfnl_compat_subsys);
 	nft_unregister_expr(&nft_target_type);
 	nft_unregister_expr(&nft_match_type);
-
-	WARN_ON_ONCE(refcount_read(&nft_compat_pending_destroy) !=3D 1);
 }
 =

 MODULE_ALIAS_NFNL_SUBSYS(NFNL_SUBSYS_NFT_COMPAT);
-- =

2.26.2

--===============6436485420469079528==--


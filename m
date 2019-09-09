Content-Type: multipart/mixed; boundary="===============1012934598984530045=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 8bb3c61baf: vm-scalability.median -23.7% regression
Date: Sun, 08 Sep 2019 20:10:17 -0700
Message-ID: <alpine.LSU.2.11.1909081953360.1134@eggly.anvils>
In-Reply-To: <20190908234722.GE1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1012934598984530045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Sep 2019, Al Viro wrote:
> On Sun, Sep 08, 2019 at 10:46:01PM +0100, Al Viro wrote:
> > On Tue, Sep 03, 2019 at 04:41:22PM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -23.7% regression of vm-scalability.median due to c=
ommit:
> > > =

> > > =

> > > commit: 8bb3c61bafa8c1cd222ada602bb94ff23119e738 ("vfs: Convert ramfs=
, shmem, tmpfs, devtmpfs, rootfs to use the new mount API")
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/viro/vfs.git=
 work.mount
> > > =

> > > in testcase: vm-scalability
> > > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 128G memory
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > 	size: 16G
> > > 	test: shm-pread-rand
> > > 	cpufreq_governor: performance
> > > 	ucode: 0xb000036
> > =

> > That thing loses size=3D... option.  Both size=3D and nr_blocks=3D affe=
ct the
> > same thing (->max_blocks), but the parser keeps track of the options
> > it has seen and applying the parsed data to superblock checks only
> > whether nr_blocks=3D had been there.  IOW, size=3D gets parsed, but the
> > result goes nowhere.
> > =

> > I'm not sure whether it's better to fix the patch up or redo it from
> > scratch - it needs to be carved up anyway and it's highly non-transpare=
nt,
> > so I'm probably going to replace the damn thing entirely with something
> > that would be easier to follow.
> =

> ... and this
> +       { Opt_huge,     "deny",         SHMEM_HUGE_DENY },
> +       { Opt_huge,     "force",        SHMEM_HUGE_FORCE },
> had been wrong - huge=3Ddeny and huge=3Dforce should not be accepted _and_
> fs_parameter_enum is not suitable for negative constants right now
> anyway.

Sorry you've been spending time redisovering these, Al: I sent David
the tmpfs fixes (Cc'ing you and Andrew and lists) a couple of weeks
ago - but had no idea until your mail that the "loss of size" was
behind this vm-scalability regression report.

Ah, not for the first time, I missed saying "[PATCH]" in the subject:
sorry, that may have rendered it invisible to many eyes.

Here's what Andrew has been carrying in the mmotm tree since I sent it:
I'm sure we'd both be happy for you to take it into your tree.  I had
expected it to percolate through from mmotm to linux-next by now,
but apparently not.

From: Hugh Dickins <hughd@google.com>
Subject: tmpfs: fixups to use of the new mount API

Several fixups to shmem_parse_param() and tmpfs use of new mount API:

mm/shmem.c manages filesystem named "tmpfs": revert "shmem" to "tmpfs"
in its mount error messages.

/sys/kernel/mm/transparent_hugepage/shmem_enabled has valid options
"deny" and "force", but they are not valid as tmpfs "huge" options.

The "size" param is an alternative to "nr_blocks", and needs to be
recognized as changing max_blocks.  And where there's ambiguity, it's
better to mention "size" than "nr_blocks" in messages, since "size" is
the variant shown in /proc/mounts.

shmem_apply_options() left ctx->mpol as the new mpol, so then it was
freed in shmem_free_fc(), and the filesystem went on to use-after-free.

shmem_parse_param() issue "tmpfs: Bad value for '%s'" messages just
like fs_parse() would, instead of a different wording.  Where config
disables "mpol" or "huge", say "tmpfs: Unsupported parameter '%s'".

Link: http://lkml.kernel.org/r/alpine.LSU.2.11.1908191503290.1253(a)eggly.a=
nvils
Fixes: 144df3b288c41 ("vfs: Convert ramfs, shmem, tmpfs, devtmpfs, rootfs t=
o use the new mount API")
Signed-off-by: Hugh Dickins <hughd@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/shmem.c |   80 ++++++++++++++++++++++++++-------------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

--- a/mm/shmem.c~tmpfs-fixups-to-use-of-the-new-mount-api
+++ a/mm/shmem.c
@@ -3432,13 +3432,11 @@ static const struct fs_parameter_enum sh
 	{ Opt_huge,	"always",	SHMEM_HUGE_ALWAYS },
 	{ Opt_huge,	"within_size",	SHMEM_HUGE_WITHIN_SIZE },
 	{ Opt_huge,	"advise",	SHMEM_HUGE_ADVISE },
-	{ Opt_huge,	"deny",		SHMEM_HUGE_DENY },
-	{ Opt_huge,	"force",	SHMEM_HUGE_FORCE },
 	{}
 };
 =

 const struct fs_parameter_description shmem_fs_parameters =3D {
-	.name		=3D "shmem",
+	.name		=3D "tmpfs",
 	.specs		=3D shmem_param_specs,
 	.enums		=3D shmem_param_enums,
 };
@@ -3448,9 +3446,9 @@ static void shmem_apply_options(struct s
 				unsigned long inodes_in_use)
 {
 	struct shmem_fs_context *ctx =3D fc->fs_private;
-	struct mempolicy *old =3D NULL;
 =

-	if (test_bit(Opt_nr_blocks, &ctx->changes))
+	if (test_bit(Opt_nr_blocks, &ctx->changes) ||
+	    test_bit(Opt_size, &ctx->changes))
 		sbinfo->max_blocks =3D ctx->max_blocks;
 	if (test_bit(Opt_nr_inodes, &ctx->changes)) {
 		sbinfo->max_inodes =3D ctx->max_inodes;
@@ -3459,8 +3457,11 @@ static void shmem_apply_options(struct s
 	if (test_bit(Opt_huge, &ctx->changes))
 		sbinfo->huge =3D ctx->huge;
 	if (test_bit(Opt_mpol, &ctx->changes)) {
-		old =3D sbinfo->mpol;
-		sbinfo->mpol =3D ctx->mpol;
+		/*
+		 * Update sbinfo->mpol now while stat_lock is held.
+		 * Leave shmem_free_fc() to free the old mpol if any.
+		 */
+		swap(sbinfo->mpol, ctx->mpol);
 	}
 =

 	if (fc->purpose !=3D FS_CONTEXT_FOR_RECONFIGURE) {
@@ -3471,8 +3472,6 @@ static void shmem_apply_options(struct s
 		if (test_bit(Opt_mode, &ctx->changes))
 			sbinfo->mode =3D ctx->mode;
 	}
-
-	mpol_put(old);
 }
 =

 static int shmem_parse_param(struct fs_context *fc, struct fs_parameter *p=
aram)
@@ -3498,7 +3497,7 @@ static int shmem_parse_param(struct fs_c
 			rest++;
 		}
 		if (*rest)
-			return invalf(fc, "shmem: Invalid size");
+			goto bad_value;
 		ctx->max_blocks =3D DIV_ROUND_UP(size, PAGE_SIZE);
 		break;
 =

@@ -3506,55 +3505,59 @@ static int shmem_parse_param(struct fs_c
 		rest =3D param->string;
 		ctx->max_blocks =3D memparse(param->string, &rest);
 		if (*rest)
-			return invalf(fc, "shmem: Invalid nr_blocks");
+			goto bad_value;
 		break;
+
 	case Opt_nr_inodes:
 		rest =3D param->string;
 		ctx->max_inodes =3D memparse(param->string, &rest);
 		if (*rest)
-			return invalf(fc, "shmem: Invalid nr_inodes");
+			goto bad_value;
 		break;
+
 	case Opt_mode:
 		ctx->mode =3D result.uint_32 & 07777;
 		break;
+
 	case Opt_uid:
 		ctx->uid =3D make_kuid(current_user_ns(), result.uint_32);
 		if (!uid_valid(ctx->uid))
-			return invalf(fc, "shmem: Invalid uid");
+			goto bad_value;
 		break;
 =

 	case Opt_gid:
 		ctx->gid =3D make_kgid(current_user_ns(), result.uint_32);
 		if (!gid_valid(ctx->gid))
-			return invalf(fc, "shmem: Invalid gid");
+			goto bad_value;
 		break;
 =

 	case Opt_huge:
-#ifdef CONFIG_TRANSPARENT_HUGE_PAGECACHE
-		if (!has_transparent_hugepage() &&
-		    result.uint_32 !=3D SHMEM_HUGE_NEVER)
-			return invalf(fc, "shmem: Huge pages disabled");
-
 		ctx->huge =3D result.uint_32;
+		if (ctx->huge !=3D SHMEM_HUGE_NEVER &&
+		    !(IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE) &&
+		      has_transparent_hugepage()))
+			goto unsupported_parameter;
 		break;
-#else
-		return invalf(fc, "shmem: huge=3D option disabled");
-#endif
-
-	case Opt_mpol: {
-#ifdef CONFIG_NUMA
-		struct mempolicy *mpol;
-		if (mpol_parse_str(param->string, &mpol))
-			return invalf(fc, "shmem: Invalid mpol=3D");
-		mpol_put(ctx->mpol);
-		ctx->mpol =3D mpol;
-#endif
-		break;
-	}
+
+	case Opt_mpol:
+		if (IS_ENABLED(CONFIG_NUMA)) {
+			struct mempolicy *mpol;
+			if (mpol_parse_str(param->string, &mpol))
+				goto bad_value;
+			mpol_put(ctx->mpol);
+			ctx->mpol =3D mpol;
+			break;
+		}
+		goto unsupported_parameter;
 	}
 =

 	__set_bit(opt, &ctx->changes);
 	return 0;
+
+unsupported_parameter:
+	return invalf(fc, "tmpfs: Unsupported parameter '%s'", param->key);
+bad_value:
+	return invalf(fc, "tmpfs: Bad value for '%s'", param->key);
 }
 =

 /*
@@ -3572,14 +3575,15 @@ static int shmem_reconfigure(struct fs_c
 	unsigned long inodes_in_use;
 =

 	spin_lock(&sbinfo->stat_lock);
-	if (test_bit(Opt_nr_blocks, &ctx->changes)) {
+	if (test_bit(Opt_nr_blocks, &ctx->changes) ||
+	    test_bit(Opt_size, &ctx->changes)) {
 		if (ctx->max_blocks && !sbinfo->max_blocks) {
 			spin_unlock(&sbinfo->stat_lock);
-			return invalf(fc, "shmem: Can't retroactively limit nr_blocks");
+			return invalf(fc, "tmpfs: Cannot retroactively limit size");
 		}
 		if (percpu_counter_compare(&sbinfo->used_blocks, ctx->max_blocks) > 0) {
 			spin_unlock(&sbinfo->stat_lock);
-			return invalf(fc, "shmem: Too few blocks for current use");
+			return invalf(fc, "tmpfs: Too small a size for current use");
 		}
 	}
 =

@@ -3587,11 +3591,11 @@ static int shmem_reconfigure(struct fs_c
 	if (test_bit(Opt_nr_inodes, &ctx->changes)) {
 		if (ctx->max_inodes && !sbinfo->max_inodes) {
 			spin_unlock(&sbinfo->stat_lock);
-			return invalf(fc, "shmem: Can't retroactively limit nr_inodes");
+			return invalf(fc, "tmpfs: Cannot retroactively limit inodes");
 		}
 		if (ctx->max_inodes < inodes_in_use) {
 			spin_unlock(&sbinfo->stat_lock);
-			return invalf(fc, "shmem: Too few inodes for current use");
+			return invalf(fc, "tmpfs: Too few inodes for current use");
 		}
 	}
 =

_

--===============1012934598984530045==--


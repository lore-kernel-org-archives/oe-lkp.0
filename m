Content-Type: multipart/mixed; boundary="===============1836078844059480226=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 8bb3c61baf: vm-scalability.median -23.7% regression
Date: Tue, 10 Sep 2019 20:05:38 -0700
Message-ID: <alpine.LSU.2.11.1909101930140.1518@eggly.anvils>
In-Reply-To: <alpine.LSU.2.11.1909092301120.1267@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============1836078844059480226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Sep 2019, Hugh Dickins wrote:
> On Mon, 9 Sep 2019, Al Viro wrote:
> > =

> > Anyway, see vfs.git#uncertain.shmem for what I've got with those folded=
 in.
> > Do you see any problems with that one?  That's the last 5 commits in th=
ere...
> =

> It's mostly fine, I've no problem with going your way instead of what
> we had in mmotm; but I have seen some problems with it, and had been
> intending to send you a fixup patch tonight (shmem_reconfigure() missing
> unlock on error is the main problem, but there are other fixes needed).
> =

> But I'm growing tired. I've a feeling my "swap" of the mpols, instead
> of immediate mpol_put(), was necessary to protect against a race with
> shmem_get_sbmpol(), but I'm not clear-headed enough to trust myself on
> that now.  And I've a mystery to solve, that shmem_reconfigure() gets
> stuck into showing the wrong error message.

On my "swap" for the mpol_put(): no, the race against shmem_get_sbmpol()
is safe enough without that, and what you have matches what was always
done before. I rather like my "swap", which the previous double-free had
led me to, but it's fine if you prefer the ordinary way. I was probably
coming down from some over-exposure to iput() under spinlock, but there's
no such complications here.

> =

> Tomorrow....
> =

> Oh, and my first attempt to build and boot that series over 5.3-rc5
> wouldn't boot. Luckily there was a tell-tale "i915" in the stacktrace,
> which reminded me of the drivers/gpu/drm/i915/gem/i915_gemfs.c fix
> we discussed earlier in the cycle.  That is of course in linux-next
> by now, but I wonder if your branch ought to contain a duplicate of
> that fix, so that people with i915 doing bisections on 5.4-rc do not
> fall into an unbootable hole between vfs and gpu merges.

Below are the fixups I arrived at last night (I've not rechecked your
tree today, to see if you made any changes since).  But they're not
enough: I now understand why shmem_reconfigure() got stuck showing
the wrong error message, but I'll have to leave it to you to decide
what to do about it, because I don't know whether it's just a mistake,
or different filesystem types have different needs there.

My /etc/fstab has a line in for one of my test mounts:
tmpfs                /tlo                 tmpfs      size=3D4G             =
  0 0
and that "size=3D4G" is what causes the problem: because each time
shmem_parse_options(fc, data) is called for a remount, data (that is,
options) points to a string starting with "size=3D4G,", followed by
what's actually been asked for in the remount options.

So if I try
mount -o remount,size=3D0 /tlo
that succeeds, setting the filesystem size to 0 meaning unlimited.
So if then as a test I try
mount -o remount,size=3D1M /tlo
that correctly fails with "Cannot retroactively limit size".
But then when I try
mount -o remount,nr_inodes=3D0 /tlo
I again get "Cannot retroactively limit size",
when it should have succeeded (again, 0 here meaning unlimited).

That's because the options in shmem_parse_options() are
"size=3D4G,nr_inodes=3D0", which indeed looks like an attempt to
retroactively limit size; but the user never asked "size=3D4G" there.

I think this problem, and some of what's fixed below, predate your
rework, and would equally affect the version in mmotm: I just didn't
discover these issues when I was testing that before.

Hugh

--- aviro/mm/shmem.c	2019-09-09 14:10:34.379832855 -0700
+++ hughd/mm/shmem.c	2019-09-09 23:29:28.467037895 -0700
@@ -3456,7 +3456,7 @@ static int shmem_parse_one(struct fs_con
 		ctx->huge =3D result.uint_32;
 		if (ctx->huge !=3D SHMEM_HUGE_NEVER &&
 		    !(IS_ENABLED(CONFIG_TRANSPARENT_HUGE_PAGECACHE) &&
-		    has_transparent_hugepage()))
+		      has_transparent_hugepage()))
 			goto unsupported_parameter;
 		ctx->seen |=3D SHMEM_SEEN_HUGE;
 		break;
@@ -3532,26 +3532,26 @@ static int shmem_reconfigure(struct fs_c
 =

 	spin_lock(&sbinfo->stat_lock);
 	inodes =3D sbinfo->max_inodes - sbinfo->free_inodes;
-	if (ctx->seen & SHMEM_SEEN_BLOCKS) {
+	if ((ctx->seen & SHMEM_SEEN_BLOCKS) && ctx->blocks) {
+		if (!sbinfo->max_blocks) {
+			err =3D "Cannot retroactively limit size";
+			goto out;
+		}
 		if (percpu_counter_compare(&sbinfo->used_blocks,
 					   ctx->blocks) > 0) {
 			err =3D "Too small a size for current use";
 			goto out;
 		}
-		if (ctx->blocks && !sbinfo->max_blocks) {
-			err =3D "Cannot retroactively limit nr_blocks";
+	}
+	if ((ctx->seen & SHMEM_SEEN_INODES) && ctx->inodes) {
+		if (!sbinfo->max_inodes) {
+			err =3D "Cannot retroactively limit inodes";
 			goto out;
 		}
-	}
-	if (ctx->seen & SHMEM_SEEN_INODES) {
 		if (ctx->inodes < inodes) {
 			err =3D "Too few inodes for current use";
 			goto out;
 		}
-		if (ctx->inodes && !sbinfo->max_inodes) {
-			err =3D "Cannot retroactively limit nr_inodes";
-			goto out;
-		}
 	}
 =

 	if (ctx->seen & SHMEM_SEEN_HUGE)
@@ -3574,6 +3574,7 @@ static int shmem_reconfigure(struct fs_c
 	spin_unlock(&sbinfo->stat_lock);
 	return 0;
 out:
+	spin_unlock(&sbinfo->stat_lock);
 	return invalf(fc, "tmpfs: %s", err);
 }
=20

--===============1836078844059480226==--


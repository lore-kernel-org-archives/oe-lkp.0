Content-Type: multipart/mixed; boundary="===============4862251263544651594=="
MIME-Version: 1.0
From: Alexey Gladkov <legion@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH v2 1/2] ucounts: Fix rlimit max values check
Date: Mon, 29 Nov 2021 21:37:25 +0100
Message-ID: <024ec805f6e16896f0b23e094773790d171d2c1c.1638218242.git.legion@kernel.org>
In-Reply-To: <cover.1638218242.git.legion@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4862251263544651594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The semantics of the rlimit max values differs from ucounts itself. When
creating a new userns, we store the current rlimit of the process in
ucount_max. Thus, the value of the limit in the parent userns is saved
in the created one.

The problem is that now we are taking the maximum value for counter from
the same userns. So for init_user_ns it will always be RLIM_INFINITY.

To fix the problem we need to check the counter value with the max value
stored in userns.

Reproducer:

su - test -c "ulimit -u 3; sleep 5 & sleep 6 & unshare -U --map-root-user s=
h -c 'sleep 7 & sleep 8 & date; wait'"

Before:

[1] 175
[2] 176
Fri Nov 26 13:48:20 UTC 2021
[1]-  Done                    sleep 5
[2]+  Done                    sleep 6

After:

[1] 167
[2] 168
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: retry: Resource temporarily unavailable
sh: fork: Interrupted system call
[1]-  Done                    sleep 5
[2]+  Done                    sleep 6

Fixes: c54b245d0118 ("Merge branch 'for-linus' of git://git.kernel.org/pub/=
scm/linux/kernel/git/ebiederm/user-namespace")
Reported-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 kernel/ucount.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/kernel/ucount.c b/kernel/ucount.c
index 4f5613dac227..7b32c356ebc5 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -264,15 +264,16 @@ void dec_ucount(struct ucounts *ucounts, enum ucount_=
type type)
 long inc_rlimit_ucounts(struct ucounts *ucounts, enum ucount_type type, lo=
ng v)
 {
 	struct ucounts *iter;
+	long max =3D LONG_MAX;
 	long ret =3D 0;
 =

 	for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-		long max =3D READ_ONCE(iter->ns->ucount_max[type]);
 		long new =3D atomic_long_add_return(v, &iter->ucount[type]);
 		if (new < 0 || new > max)
 			ret =3D LONG_MAX;
 		else if (iter =3D=3D ucounts)
 			ret =3D new;
+		max =3D READ_ONCE(iter->ns->ucount_max[type]);
 	}
 	return ret;
 }
@@ -312,15 +313,16 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, =
enum ucount_type type)
 {
 	/* Caller must hold a reference to ucounts */
 	struct ucounts *iter;
+	long max =3D LONG_MAX;
 	long dec, ret =3D 0;
 =

 	for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-		long max =3D READ_ONCE(iter->ns->ucount_max[type]);
 		long new =3D atomic_long_add_return(1, &iter->ucount[type]);
 		if (new < 0 || new > max)
 			goto unwind;
 		if (iter =3D=3D ucounts)
 			ret =3D new;
+		max =3D READ_ONCE(iter->ns->ucount_max[type]);
 		/*
 		 * Grab an extra ucount reference for the caller when
 		 * the rlimit count was previously 0.
@@ -339,15 +341,16 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, =
enum ucount_type type)
 	return 0;
 }
 =

-bool is_ucounts_overlimit(struct ucounts *ucounts, enum ucount_type type, =
unsigned long max)
+bool is_ucounts_overlimit(struct ucounts *ucounts, enum ucount_type type, =
unsigned long rlimit)
 {
 	struct ucounts *iter;
-	if (get_ucounts_value(ucounts, type) > max)
-		return true;
+	long max =3D rlimit;
+	if (rlimit > LONG_MAX)
+		max =3D LONG_MAX;
 	for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-		max =3D READ_ONCE(iter->ns->ucount_max[type]);
 		if (get_ucounts_value(iter, type) > max)
 			return true;
+		max =3D READ_ONCE(iter->ns->ucount_max[type]);
 	}
 	return false;
 }
-- =

2.33.0

--===============4862251263544651594==--


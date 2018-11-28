Content-Type: multipart/mixed; boundary="===============4309473970205684450=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: [PATCH] locks: fix performance regressions.
Date: Wed, 28 Nov 2018 11:53:48 +1100
Message-ID: <87k1kyowdf.fsf@notabene.neil.brown.name>
In-Reply-To: <87mupup0ot.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============4309473970205684450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


The kernel test robot reported two performance regressions
caused by recent patches.
Both appear to related to the global spinlock blocked_lock_lock
being taken more often.

This patch avoids taking that lock in the cases tested.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: NeilBrown <neilb@suse.com>
---

Hi Jeff,
 you might like to merge these back into the patches that introduced
 the problem.
 Or you might like me to re-send the series with these merged in,
 in which case, please ask.

 And a BIG thank-you to the kernel-test-robot team!!

Thanks,
NeilBrown

 fs/locks.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/fs/locks.c b/fs/locks.c
index f456cd3d9d50..67519a43e27a 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -444,6 +444,13 @@ static void locks_move_blocks(struct file_lock *new, s=
truct file_lock *fl)
 {
 	struct file_lock *f;
 =

+	/*
+	 * As ctx->flc_lock is held, new requests cannot be added to
+	 * ->fl_blocked_requests, so we don't need a lock to check if it
+	 * is empty.
+	 */
+	if (list_empty(&fl->fl_blocked_requests))
+		return;
 	spin_lock(&blocked_lock_lock);
 	list_splice_init(&fl->fl_blocked_requests, &new->fl_blocked_requests);
 	list_for_each_entry(f, &fl->fl_blocked_requests, fl_blocked_member)
@@ -749,6 +756,20 @@ int locks_delete_block(struct file_lock *waiter)
 {
 	int status =3D -ENOENT;
 =

+	/*
+	 * If fl_blocker is NULL, it won't be set again as this thread
+	 * "owns" the lock and is the only one that might try to claim
+	 * the lock.  So it is safe to test fl_blocker locklessly.
+	 * Also if fl_blocker is NULL, this waiter is not listed on
+	 * fl_blocked_requests for some lock, so no other request can
+	 * be added to the list of fl_blocked_requests for this
+	 * request.  So if fl_blocker is NULL, it is safe to
+	 * locklessly check if fl_blocked_requests is empty.  If both
+	 * of these checks succeed, there is no need to take the lock.
+	 */
+	if (waiter->fl_blocker =3D=3D NULL &&
+	    list_empty(&waiter->fl_blocked_requests))
+		return status;
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
-- =

2.14.0.rc0.dirty


--===============4309473970205684450==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWx2OTV4d0FDZ2tRT2V5ZTNWWmkKZ2JrMGpCQUFqRENCdGZIY2Ew
VzY0Y0QyU0g4V1JUbWJ3NEYwb0dWYnJTNjNnOTZ4VzhhcDZJa0tEUVlJVjJkMgpEMnlIT3l5U21B
aG1RcUtoRzJzZmN6NVczTXRpYjVGaWF1elZFUzdpeitvNWNBdkJFckN6QUxmcTNCNzZtQmxZClEz
TW5TR0xnZTQ2eE9wRU5zZlV4a3Vib0gvdjNmWUJJQmRCL2M3bEs0NVhVMzJjOENKNmZSWnpyQmhu
OWxWSTQKRWdlMVAxcnBKaVhNQUx1Ti9Dc2MwTHI5dVg5UE83ZlFkOW12WC83OW5vVjJMMDJoenU3
Vnl0WjhYRW9YbnpGTQpvLzJnZFNMbWxTZUNpakgvdDJsb3E4QTZEUHZ1QWhLVE9IZmtPNFFOWkZM
UTlONm45RWl6ZHBSaERiUXRYbGZaCmQzSHAzcDNtZjkvQnRyTmNZaU5XODVMRWJmZkxoUEg4bVdU
enQ2YVQ1b3dkM1h4MEtFeFFYUWpha3I3UmoyZnAKRURYQ3BuaWx6U3VoNUlhNTVuV0dtQkFBL2hN
ZUpZdEtxcDZtcEVyVmtFbEZmLzFxaDNMYkg3aXhobERKdStzcApBbU9RbStFMjZWOG5iVFVXc3Q0
ajh3SUVxL3V4NHV6a1JHbExxTEdIYkEwVDlUWmx5c2xHQnJJbDQvZWRKYlp6Cit1Y0Zyamx6eTFS
U203UDg2VXZ6VjFzMGNBZ2g5VlM4WXRvNS9PdTI2WlhySElmK0lqbkFLUHRGMXE3bGIrY28Kc0dE
eGJMdkhBQm1rVG1hTnMwTlM2REZNM1AybklPZ0ViNHBHQ2NZSThoSnR1K0tjdVRabEtSd01QNFBs
QUx6YwpmcmNGT05KWWRjd2w1QWQxWlkzMmhpMnY4cS9MZm5FWDZPQTM4bi9YSnhSNUt0Rno3WVk9
Cj1SNnRvCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============4309473970205684450==--


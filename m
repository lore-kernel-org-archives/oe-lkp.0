Content-Type: multipart/mixed; boundary="===============7238545673010355890=="
MIME-Version: 1.0
From: Josef Bacik <jbacik@fb.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 14:46:27 -0400
Message-ID: <e6fb50d4-2a27-13cd-02c8-5b8439a16b3f@fb.com>
In-Reply-To: <CA+55aFzdTMBc7f5=bQLRUtceu-Kg-MGmzWrAv1r96_ra8yutJA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7238545673010355890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/10/2016 02:25 PM, Linus Torvalds wrote:
> On Wed, Aug 10, 2016 at 11:22 AM, Josef Bacik <jbacik@fb.com> wrote:
>> On 08/10/2016 02:06 PM, Linus Torvalds wrote:
>>>
>>> More information in the original email on lkml.
>>
>> I'm not subscribed to lkml and for some reason I can't find the original
>> email in any of the lkml/linux-nfs archives.  Could you forward more of =
the
>> details?
>
> Done.
>

So my naive fix would be something like this


From: Josef Bacik <jbacik@fb.com>
Date: Wed, 10 Aug 2016 14:43:08 -0400
Subject: [PATCH] nfsd: fix dentry refcounting problem

b44061d0b9 introduced a dentry ref counting bug, previously we were grabbin=
g one
ref to dchild in nfsd_create(), but with the creation of nfsd_create_locked=
() we
have a ref for dchild from the lookup in nfsd_create(), and then another re=
f in
nfsd_create_locked().  The ref from the lookup in nfsd_create() is never dr=
opped
and results in dentries still in use at unmount.

Signed-off-by: Josef Bacik <jbacik@fb.com>
---
  fs/nfsd/vfs.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index ba944123..ff476e6 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1252,10 +1252,13 @@ nfsd_create(struct svc_rqst *rqstp, struct svc_fh *=
fhp,
  	if (IS_ERR(dchild))
  		return nfserrno(host_err);
  	err =3D fh_compose(resfhp, fhp->fh_export, dchild, fhp);
-	if (err) {
-		dput(dchild);
+	/*
+	 * We unconditionally drop our ref to dchild as fh_compose will have
+	 * already grabbed its own ref for it.
+	 */
+	dput(dchild);
+	if (err)
  		return err;
-	}
  	return nfsd_create_locked(rqstp, fhp, fname, flen, iap, type,
  					rdev, resfhp);
  }
-- =

2.5.5


--===============7238545673010355890==--


Content-Type: multipart/mixed; boundary="===============3622908817799295761=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ocfs2] e2ac55b6a8e: ocfs2_init:1612 ERROR: Unable to create ocfs2 debugfs root
Date: Mon, 20 Apr 2015 14:10:24 -0700
Message-ID: <20150420141024.1952c240f424f1416102fd86@linux-foundation.org>
In-Reply-To: <CA+55aFy7_RXZ-B=3kqtpkRTT8e1i0D9TC-FHDx5v+w1ija1=Tw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3622908817799295761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Apr 2015 13:50:38 -0700 Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:

> On Sun, Apr 19, 2015 at 8:45 PM, Chengyu Song <csong84@gatech.edu> wrot=
e:
> >
> > As suggested in the patch,  -19 (-ENODEV) happens when debugfs is not c=
onfigured (see include/linux/debugfs.h). So if debugfs is necessary for the=
 functionality, in Kconfig, we should either declare it as a dependency, or=
 auto select it.
> =

> That makes no sense.
> =

> If it used to work before that patch, then this is a regression and
> the patch needs to be reverted.
> =

> Yes, the old code apparently used to set "o2hb_debug_dir" to an error
> pointer when debugfs was compiled out, but since debugfs was compiled
> out, that error pointer was probably never actually *used*. So things
> presumably worked.
> =

> Now, it hangs, according to Huang Ying. If so, that's clearly a
> regression. That means that commit e2ac55b6a8e3 ("ocfs2: incorrect
> check for debugfs returns") needs to be reverted or fixed.
> =

> Andrew?
> =


Yes, that one snuck through.  I think a revert would be best at this
stage, please.



The debugfs interfaces are exceptional, and not very nice.  My
understanding of the general idea is:

- debugfs is just for debug and subsystems shouldn't care whether
  debugfs is present or not.

- if a debugfs call fails, the subsystem shouldn't care - don't log
  it, just ignore it.


The return semantics from things like debugfs_create_dir() are:

NULL: debugfs is available, but something went wrong.  We don't
      tell you what it was.

-ENODEV: debugfs isn't available

-Exxx:  I don't think other errnos are supposed to happen.


So the ofs2 code shouldn't log unless the debugfs calls return NULL. =

And really, they shouldn't log at all, due to the general debugfs
philosophy of "errors should be silently ignored".



A problem with functions like o2hb_debug_init() is that when
CONFIG_DEBUG_FS=3Dn they will still generate significant amounts of code.
 That's fixable with something like

--- a/fs/ocfs2/cluster/heartbeat.c~a
+++ a/fs/ocfs2/cluster/heartbeat.c
@@ -1312,12 +1312,8 @@ static int o2hb_debug_init(void)
 	int ret =3D -ENOMEM;
 =

 	o2hb_debug_dir =3D debugfs_create_dir(O2HB_DEBUG_DIR, NULL);
-	if (IS_ERR_OR_NULL(o2hb_debug_dir)) {
-		ret =3D o2hb_debug_dir ?
-			PTR_ERR(o2hb_debug_dir) : -ENOMEM;
-		mlog_errno(ret);
-		goto bail;
-	}
+	if (IS_ERR(o2hb_debug_dir))
+		return 0;
 =

 	o2hb_debug_livenodes =3D o2hb_debug_create(O2HB_DEBUG_LIVENODES,
 						 o2hb_debug_dir,

Here, the compiler shold see that the `return 0' is always taken (due
to the -ENODEV) and the rest of the function will be eliminated.

Or we wrap large pieces of code inside `#ifdef CONFIG_DEBUG_FS'.

Either way, a cleanup here needs some thought and study.  And better
testing, plesae.


--===============3622908817799295761==--


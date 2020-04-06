Content-Type: multipart/mixed; boundary="===============5634305485308385069=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [non] 2aa3847085: will-it-scale.per_process_ops -32.0% regression
Date: Mon, 06 Apr 2020 03:04:51 +0100
Message-ID: <20200406020451.GQ23230@ZenIV.linux.org.uk>
In-Reply-To: <20200406012539.GR8179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5634305485308385069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2020 at 09:25:39AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -32.0% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 2aa38470853a65dc9b1b4bd0989d34cd3fc57ebd ("non-RCU analogue of th=
e previous commit")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Arrgghh...  Could you check if vfs.git#fixes recovers that?  FWIW, proposed=
 fix
is this:

commit d98d78cd6ac9eb5ed0506140cc43432d7c7dd480
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Apr 5 21:59:55 2020 -0400

    fix braino in legitimize_path()
    =

    brown paperbag time... wrong order of arguments ended up confusing
    the values to check dentry and mount_lock seqcounts against.
    =

    Reported-by: kernel test robot <rong.a.chen@intel.com>
    Fixes: 2aa38470853a ("non-RCU analogue of the previous commit")
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

diff --git a/fs/namei.c b/fs/namei.c
index 61fdb77a7d58..a320371899cf 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -610,7 +610,7 @@ static bool __legitimize_path(struct path *path, unsign=
ed seq, unsigned mseq)
 static inline bool legitimize_path(struct nameidata *nd,
 			    struct path *path, unsigned seq)
 {
-	return __legitimize_path(path, nd->m_seq, seq);
+	return __legitimize_path(path, seq, nd->m_seq);
 }
 =

 static bool legitimize_links(struct nameidata *nd)
--===============5634305485308385069==--


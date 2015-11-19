Content-Type: multipart/mixed; boundary="===============5223686364333777918=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [vfs] BUG: sleeping function called from invalid context at arch/x86/mm/fault.c:1191
Date: Thu, 19 Nov 2015 11:39:47 +0000
Message-ID: <20151119113947.GH22011@ZenIV.linux.org.uk>
In-Reply-To: <20151119094214.GB18875@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5223686364333777918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 05:42:14PM +0800, Fengguang Wu wrote:
> Hi Al,
> =

> Here is another bisect result.

Umm...  Looks like bisect hazard - the chunk that should've gone into
ebd0bb376 went into 31d49afa22 instead.  Namely, this
-       struct pid_namespace *ns =3D dentry->d_sb->s_fs_info;
+       struct pid_namespace *ns =3D inode->i_sb->s_fs_info;
in proc_self_get_link()...  And similar in proc_thread_self_get_link(),
apparently.

Fixed (by moving these chunks into the previous commit, the final tree is
unchanged) and force-pushed...

--===============5223686364333777918==--


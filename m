Content-Type: multipart/mixed; boundary="===============0395453751780438125=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [namei] fda89e6574: kernel BUG at fs/namei.c:679!
Date: Mon, 14 Mar 2016 00:57:06 +0000
Message-ID: <20160314005706.GX17997@ZenIV.linux.org.uk>
In-Reply-To: <871t7dhokl.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0395453751780438125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 08:48:26AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.lookups
> commit fda89e65743179d09e55bc6c265d06fa5efa8803 ("namei: untanlge lookup_=
fast()")

Could you check if the diff below fixes it?

diff --git a/fs/namei.c b/fs/namei.c
index 35b10fa..428a34f 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1563,6 +1563,7 @@ static int lookup_fast(struct nameidata *nd,
 					dput(dentry);
 					return status;
 				}
+				goto l;
 			}
 		}
 		/*
@@ -1590,6 +1591,7 @@ static int lookup_fast(struct nameidata *nd,
 				return status;
 			}
 		}
+l:
 		if (unlikely(d_is_negative(dentry))) {
 			dput(dentry);
 			return -ENOENT;

--===============0395453751780438125==--


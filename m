Content-Type: multipart/mixed; boundary="===============1393084403075964626=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [vfs] b413afd673: kernel BUG at arch/x86/mm/physaddr.c:26!
Date: Tue, 19 Apr 2016 03:42:14 +0100
Message-ID: <20160419024214.GC25498@ZenIV.linux.org.uk>
In-Reply-To: <87zisqpgsj.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1393084403075964626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 08:45:48AM +0800, kernel test robot wrote:
> Hi,
> =

> Here is the test result for T3.
> =

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git T3
> commit b413afd67397cfc175a9656fc9e0444597a753e0 ("i_dir_seq (__d_add() on=
ly, with sanity checks for dir)")

Oh, I see...  Try to add this (to be folded into the commit in original
branch):

diff --git a/mm/shmem.c b/mm/shmem.c
index 00d5d02..50447e6 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3123,7 +3123,8 @@ static struct inode *shmem_alloc_inode(struct super_b=
lock *sb)
 static void shmem_destroy_callback(struct rcu_head *head)
 {
 	struct inode *inode =3D container_of(head, struct inode, i_rcu);
-	kfree(inode->i_link);
+	if (S_ISLNK(inode->i_mode))
+		kfree(inode->i_link);
 	kmem_cache_free(shmem_inode_cachep, SHMEM_I(inode));
 }
=20

--===============1393084403075964626==--


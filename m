Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A58462
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 23:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05956C433C8;
	Tue, 25 Jul 2023 23:06:19 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:06:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: shuah@kernel.org, mhiramat@kernel.org, chinglinyu@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, lkp@intel.com, namit@vmware.com,
 oe-lkp@lists.linux.dev, amakhalov@vmware.com, er.ajay.kaher@gmail.com,
 srivatsa@csail.mit.edu, tkundu@vmware.com, vsirnapalli@vmware.com
Subject: Re: [PATCH v5 02/10] eventfs: Implement tracefs_inode_cache
Message-ID: <20230725190617.14c85997@rorschach.local.home>
In-Reply-To: <1690054625-31939-3-git-send-email-akaher@vmware.com>
References: <1690054625-31939-1-git-send-email-akaher@vmware.com>
	<1690054625-31939-3-git-send-email-akaher@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Some more nits.

On Sun, 23 Jul 2023 01:06:57 +0530
Ajay Kaher <akaher@vmware.com> wrote:

> Create a kmem cache of tracefs_inodes. To be more efficient, as there are
> lots of tracefs inodes, create its own cache. This also allows to see how
> many tracefs inodes have been created.
> 
> Add helper functions:
> tracefs_alloc_inode()
> tracefs_free_inode()
> get_tracefs()
> 
> Signed-off-by: Ajay Kaher <akaher@vmware.com>
> Co-developed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Tested-by: Ching-lin Yu <chinglinyu@google.com>
> ---
>  fs/tracefs/inode.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  fs/tracefs/internal.h | 19 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 fs/tracefs/internal.h
> 
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 57ac8aa4a724..2508944cc4d8 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -21,13 +21,33 @@
>  #include <linux/parser.h>
>  #include <linux/magic.h>
>  #include <linux/slab.h>
> +#include "internal.h"
>  
>  #define TRACEFS_DEFAULT_MODE	0700
> +static struct kmem_cache *tracefs_inode_cachep __ro_after_init;
>  
>  static struct vfsmount *tracefs_mount;
>  static int tracefs_mount_count;
>  static bool tracefs_registered;
>  
> +static struct inode *tracefs_alloc_inode(struct super_block *sb)
> +{
> +	struct tracefs_inode *ti;
> +
> +	ti = kmem_cache_alloc(tracefs_inode_cachep, GFP_KERNEL);
> +	if (!ti)
> +		return NULL;
> +
> +	ti->flags = 0;
> +
> +	return &ti->vfs_inode;
> +}
> +
> +static void tracefs_free_inode(struct inode *inode)
> +{
> +	kmem_cache_free(tracefs_inode_cachep, get_tracefs(inode));
> +}
> +
>  static ssize_t default_read_file(struct file *file, char __user *buf,
>  				 size_t count, loff_t *ppos)
>  {
> @@ -346,6 +366,9 @@ static int tracefs_show_options(struct seq_file *m, struct dentry *root)
>  }
>  
>  static const struct super_operations tracefs_super_operations = {
> +	.alloc_inode    = tracefs_alloc_inode,
> +	.free_inode     = tracefs_free_inode,
> +	.drop_inode     = generic_delete_inode,
>  	.statfs		= simple_statfs,
>  	.remount_fs	= tracefs_remount,
>  	.show_options	= tracefs_show_options,
> @@ -628,10 +651,26 @@ bool tracefs_initialized(void)
>  	return tracefs_registered;
>  }
>  
> +static void init_once(void *foo)
> +{
> +	struct tracefs_inode *ti = (struct tracefs_inode *) foo;
> +
> +	inode_init_once(&ti->vfs_inode);
> +}
> +
>  static int __init tracefs_init(void)
>  {
>  	int retval;
>  
> +	tracefs_inode_cachep = kmem_cache_create("tracefs_inode_cache",
> +						 sizeof(struct tracefs_inode),
> +						 0, (SLAB_RECLAIM_ACCOUNT|
> +						     SLAB_MEM_SPREAD|
> +						     SLAB_ACCOUNT),
> +						 init_once);
> +	if (!tracefs_inode_cachep)
> +		return -ENOMEM;
> +
>  	retval = sysfs_create_mount_point(kernel_kobj, "tracing");
>  	if (retval)
>  		return -EINVAL;
> diff --git a/fs/tracefs/internal.h b/fs/tracefs/internal.h
> new file mode 100644
> index 000000000000..49b5e8949e1c
> --- /dev/null
> +++ b/fs/tracefs/internal.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _TRACEFS_INTERNAL_H
> +#define _TRACEFS_INTERNAL_H
> +
> +enum {
> +	TRACEFS_EVENT_INODE     = BIT(1),
> +};

Let's not introduce the enum until it is used.

-- Steve

> +
> +struct tracefs_inode {
> +	unsigned long           flags;
> +	void                    *private;
> +	struct inode            vfs_inode;
> +};
> +
> +static inline struct tracefs_inode *get_tracefs(const struct inode *inode)
> +{
> +	return container_of(inode, struct tracefs_inode, vfs_inode);
> +}
> +#endif /* _TRACEFS_INTERNAL_H */


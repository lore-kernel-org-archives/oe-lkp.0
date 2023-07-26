Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FA4CE68
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 20:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144D0C433C8;
	Wed, 26 Jul 2023 20:28:23 +0000 (UTC)
Date: Wed, 26 Jul 2023 16:28:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: shuah@kernel.org, mhiramat@kernel.org, chinglinyu@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, lkp@intel.com, namit@vmware.com,
 oe-lkp@lists.linux.dev, amakhalov@vmware.com, er.ajay.kaher@gmail.com,
 srivatsa@csail.mit.edu, tkundu@vmware.com, vsirnapalli@vmware.com
Subject: Re: [PATCH v5 06/10] eventfs: Implement eventfs lookup, read, open
 functions
Message-ID: <20230726162820.28e3a492@rorschach.local.home>
In-Reply-To: <1690054625-31939-7-git-send-email-akaher@vmware.com>
References: <1690054625-31939-1-git-send-email-akaher@vmware.com>
	<1690054625-31939-7-git-send-email-akaher@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Jul 2023 01:07:01 +0530
Ajay Kaher <akaher@vmware.com> wrote:

> Add the inode_operations, file_operations, and helper functions to eventfs:
> dcache_dir_open_wrapper()
> eventfs_root_lookup()
> eventfs_release()
> eventfs_set_ef_status_free()
> eventfs_post_create_dir()
> 
> The inode_operations and file_operations functions will be called from the
> VFS layer.
> 

I would add in this change log:

  create_file() and create_dir() are added as stub functions and will
  be filled in later.

> Signed-off-by: Ajay Kaher <akaher@vmware.com>
> Co-developed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Tested-by: Ching-lin Yu <chinglinyu@google.com>
> ---
>  fs/tracefs/event_inode.c | 312 +++++++++++++++++++++++++++++++++++++++
>  fs/tracefs/internal.h    |   2 +
>  2 files changed, 314 insertions(+)
> 

-- Steve

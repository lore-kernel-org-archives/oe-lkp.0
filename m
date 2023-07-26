Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E51BEE3
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 20:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5987C433C7;
	Wed, 26 Jul 2023 20:34:20 +0000 (UTC)
Date: Wed, 26 Jul 2023 16:34:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: shuah@kernel.org, mhiramat@kernel.org, chinglinyu@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, lkp@intel.com, namit@vmware.com,
 oe-lkp@lists.linux.dev, amakhalov@vmware.com, er.ajay.kaher@gmail.com,
 srivatsa@csail.mit.edu, tkundu@vmware.com, vsirnapalli@vmware.com
Subject: Re: [PATCH v5 07/10] eventfs: Implement functions to create files
 and dirs when accessed
Message-ID: <20230726163359.5c0f247b@rorschach.local.home>
In-Reply-To: <1690054625-31939-8-git-send-email-akaher@vmware.com>
References: <1690054625-31939-1-git-send-email-akaher@vmware.com>
	<1690054625-31939-8-git-send-email-akaher@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Jul 2023 01:07:02 +0530
Ajay Kaher <akaher@vmware.com> wrote:

> --- a/include/linux/tracefs.h
> +++ b/include/linux/tracefs.h
> @@ -23,6 +23,13 @@ struct file_operations;
>  
>  struct eventfs_file;
>  
> +struct dentry *eventfs_start_creating(const char *name,
> +				      struct dentry *parent);
> +
> +struct dentry *eventfs_failed_creating(struct dentry *dentry);
> +
> +struct dentry *eventfs_end_creating(struct dentry *dentry);
> +

These should go into the internal.h header and not be exposed to users
of tracefs.

-- Steve

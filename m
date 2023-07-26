Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678861BEE4
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 20:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF61C433C7;
	Wed, 26 Jul 2023 20:51:19 +0000 (UTC)
Date: Wed, 26 Jul 2023 16:51:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: shuah@kernel.org, mhiramat@kernel.org, chinglinyu@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, lkp@intel.com, namit@vmware.com,
 oe-lkp@lists.linux.dev, amakhalov@vmware.com, er.ajay.kaher@gmail.com,
 srivatsa@csail.mit.edu, tkundu@vmware.com, vsirnapalli@vmware.com
Subject: Re: [PATCH v5 06/10] eventfs: Implement eventfs lookup, read, open
 functions
Message-ID: <20230726165116.64664689@rorschach.local.home>
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

> +void eventfs_set_ef_status_free(struct dentry *dentry)
> +{
> +	struct tracefs_inode *ti_parent;
> +	struct eventfs_file *ef;
> +
> +	mutex_lock(&eventfs_mutex);
> +	ti_parent = get_tracefs(dentry->d_parent->d_inode);
> +	if (!ti_parent || !(ti_parent->flags & TRACEFS_EVENT_INODE))
> +		goto out;
> +
> +	ef = dentry->d_fsdata;
> +	if (!ef)
> +		goto out;
> +


> +	/*
> +	 * If ef was freed, then the LSB bit is set for d_fsdata.
> +	 * But this should not happen, as it should still have a
> +	 * ref count that prevents it. Warn in case it does.
> +	 */
> +	if (WARN_ON_ONCE((unsigned long)ef & 1))
> +		goto out;

Can you add this part to Patch 8: eventfs: Implement removal of meta data from eventfs ?

That way the pointer logic is all added together.

-- Steve


> +
> +	dentry->d_fsdata = NULL;
> +	ef->dentry = NULL;
> +out:
> +	mutex_unlock(&eventfs_mutex);
> +}
> +

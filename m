Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838683DD525
	for <oe-lkp@lists.linux.dev>; Sat, 10 Oct 2026 23:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791674184; cv=none; b=JFVzxkjJ8OiBHWXii2lExGCSTQg9QFpBMkY7R51tZlmBfJVmA2H1abe58zEqTLbC4cD+kSYzxfIyryKmVWCKM/lbRHpJHgj7bZ+bbFYNsUn6zIjbV7VwuemMsc7IbJ+IfyY56l5CPMn6H42NnNwftXFdY28t22m+n0dYLdPQv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791674184; c=relaxed/simple;
	bh=/5P12xE6lZ7u6ixFuPezKuZrv1oVeMSBwmAB7QDdVbA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SeGwMPArqdUeTZwALYIhLlK3B0CqH83aJFYVRH/2UCZx82H+6XJz/xRv2lhq0GFBxAlb+9GJ7UTzBUk4ySao/ntKnxU1HeyFMc6aqvVlDpRFDNjRidIm4g+P3fp645A9SNwbzb1VTosZv/kz4LhG6FvUp0tKAgN4CdOcgz2EXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VBlNlNSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VBlNlNSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29C71F000FF;
	Sat, 10 Oct 2026 23:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791674183;
	bh=b4FKaZsTFL7dv9xDZsglaUZE3yjODs2W8eaIAJRxFvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VBlNlNSMcmKRYn4t1jPWAfBrC/8zjJ3zbhiE1wLyOjGqOJ/WpGbdzTYCKsiKF4Xch
	 UnSDcj0Zrh8qc6LGV5MfUpz7otcaGLf25ZcRG1o/xrT6rbSgeczK9mVMThZvNpih0n
	 Dqiu+Hc00Oi80ajYya/KB2ywNbGDOP9GZ42lBy40=
Date: Sat, 10 Oct 2026 16:16:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Qi Zheng" <zhengqi.arch@bytedance.com>
Cc: "kernel test robot" <yi1.lai@intel.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>, "Muchun Song"
 <muchun.song@linux.dev>, "Roman Gushchin" <roman.gushchin@linux.dev>,
 "Shakeel Butt" <shakeel.butt@linux.dev>, "Qinyun Tan"
 <qinyuntan@linux.alibaba.com>, <linux-mm@kvack.org>
Subject: Re: [linux-next:master] [mm] b9b1861d4f:
 WARNING:possible_circular_locking_dependency_detected
Message-Id: <20261010161622.3a460fdbcd6765adb5c1eb7f@linux-foundation.org>
In-Reply-To: <36a0604d-b0ff-4f14-9203-0ffb36e0917b@bytedance.com>
References: <202610091403.d1d8080b-lkp@intel.com>
	<36a0604d-b0ff-4f14-9203-0ffb36e0917b@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 15:58:46 +0800 "Qi Zheng" <zhengqi.arch@bytedance.com> wrote:

> Could you please help test whether the following change makes the
> lockdep warning go away?
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5a9bcc7c66926..8ee767dccc1f6 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5162,6 +5162,8 @@ static const struct dentry_operations 
> shmem_ci_dentry_ops = {
>   };
>   #endif
> 
> +static struct lock_class_key shmem_unused_huge_lock_key;
> +

This could be local to shmem_fill_super().

And inside #ifdef CONFIG_TRANSPARENT_HUGEPAGE somehow.

>   static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
>   {
>          struct shmem_options *ctx = fc->fs_private;
> @@ -5243,7 +5245,8 @@ static int shmem_fill_super(struct super_block 
> *sb, struct fs_context *fc)
>                  goto failed;
> 
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -       if (list_lru_init_memcg(&sbinfo->shrinklist, sb->s_shrink))
> +       if (list_lru_init_memcg_key(&sbinfo->shrinklist, sb->s_shrink,
> +                                   &shmem_unused_huge_lock_key))
>                  goto failed;
>   #endif
> 

Thanks, I'll await a formal (non-wordwrapped!) patch.

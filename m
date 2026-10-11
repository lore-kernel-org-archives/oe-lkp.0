Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D554705E
	for <oe-lkp@lists.linux.dev>; Sun, 11 Oct 2026 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694281; cv=none; b=b9OxcMrbzO1J7CFogh/ZfeXh3WqfWXZim2OvPYujwaHAqgzFvhW9lGImwCcCfXoOfJPSE0vI580Nw/wm9DEUq4eO50K7azxrpmTFaBnFC2YY/RDmfS3fQ16O2rGkSWIE3kJ7/vIpdpuGwwwfkHLQbo1eO5iBqGhZvDvlU+iuJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694281; c=relaxed/simple;
	bh=6CnCLW9nYlZaQAyzM7Qqut2STJgIs7imD5NNVLqwQdc=;
	h=To:Mime-Version:Subject:In-Reply-To:Content-Type:From:References:
	 Cc:Date:Message-Id; b=aR3+L3XOF/KmXy9h9CmWUGTR+Sx5wpbgGXRK+s3j+kPIYpOHx5s5s9WKA+G7ObEfCqgHCtG2yGxs38SHFetoORRmTOa8PzppkhPbtbe/h91XFN9mSZEKS3ofcP5vkltH8NEezrwhaHc3/tKwCv7YTdRuBxhXFgBGA3wovZvtHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WGwhXIQz; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WGwhXIQz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791694273; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gA2+L86nsB8kyRStDUPQMM7xvGJxQ8tS6sPNcinMsus=;
 b=WGwhXIQzCIDydTUa1GADaUNCyhqy5h5oEkSJy6sBjuHEbLrEIZ1CGBE/smaFjZzr/uJXZj
 xwUZMiqm38as1Pqfevz9GlNG00BXKLxDmoITov0iIXwsipO8p2klR0Z7ySo+Mf5MZIDEBw
 Ja+DlD/5XKwwgjtY8ftIscsgC5LwUEzXLp1lm2Qm+iU4/keKLVeaexlsJyTvG35OmdzgNh
 YabKJ3OIYJhyZiNw/5tfjvXpe1FvsCgpX4jyyx7JrEi2HjhHMxWmH/+UTvtqoIzvsbXYeh
 /oVrVyGU0vLo+J/Sy+kJwSLA/+Rt5+rH7F8YgF0T6pdd3q3+g6WK6o2SrJTssA==
To: "Andrew Morton" <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-next:master] [mm] b9b1861d4f: WARNING:possible_circular_locking_dependency_detected
In-Reply-To: <20261010161622.3a460fdbcd6765adb5c1eb7f@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
References: <202610091403.d1d8080b-lkp@intel.com> <36a0604d-b0ff-4f14-9203-0ffb36e0917b@bytedance.com> <20261010161622.3a460fdbcd6765adb5c1eb7f@linux-foundation.org>
Cc: "kernel test robot" <yi1.lai@intel.com>, <oe-lkp@lists.linux.dev>, 
	<lkp@intel.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, 
	"Christian Brauner" <brauner@kernel.org>, 
	"David Hildenbrand" <david@kernel.org>, 
	"Hugh Dickins" <hughd@google.com>, 
	"Johannes Weiner" <hannes@cmpxchg.org>, 
	"Michal Hocko" <mhocko@kernel.org>, 
	"Muchun Song" <muchun.song@linux.dev>, 
	"Roman Gushchin" <roman.gushchin@linux.dev>, 
	"Shakeel Butt" <shakeel.butt@linux.dev>, 
	"Qinyun Tan" <qinyuntan@linux.alibaba.com>, <linux-mm@kvack.org>
Date: Sun, 11 Oct 2026 12:50:51 +0800
Message-Id: <1ada59d3-446e-441d-8ce3-6e2ee46785f1@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
X-Lms-Return-Path: <lba+26acb15bf+4b31ce+lists.linux.dev+zhengqi.arch@bytedance.com>

Hi Andrew,

On 10/11/26 7:16 AM, Andrew Morton wrote:
> On Fri, 9 Oct 2026 15:58:46 +0800 "Qi Zheng" <zhengqi.arch@bytedance.com> wrote:
> 
>> Could you please help test whether the following change makes the
>> lockdep warning go away?
>>
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 5a9bcc7c66926..8ee767dccc1f6 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -5162,6 +5162,8 @@ static const struct dentry_operations
>> shmem_ci_dentry_ops = {
>>    };
>>    #endif
>>
>> +static struct lock_class_key shmem_unused_huge_lock_key;
>> +
> 
> This could be local to shmem_fill_super().
> 
> And inside #ifdef CONFIG_TRANSPARENT_HUGEPAGE somehow.

Got it. Will do.

> 
>>    static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
>>    {
>>           struct shmem_options *ctx = fc->fs_private;
>> @@ -5243,7 +5245,8 @@ static int shmem_fill_super(struct super_block
>> *sb, struct fs_context *fc)
>>                   goto failed;
>>
>>    #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -       if (list_lru_init_memcg(&sbinfo->shrinklist, sb->s_shrink))
>> +       if (list_lru_init_memcg_key(&sbinfo->shrinklist, sb->s_shrink,
>> +                                   &shmem_unused_huge_lock_key))
>>                   goto failed;
>>    #endif
>>
> 
> Thanks, I'll await a formal (non-wordwrapped!) patch.

OK, I'll send a formal fix patch soon.

Thanks,
Qi

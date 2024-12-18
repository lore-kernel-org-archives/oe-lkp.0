Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03235970
	for <oe-lkp@lists.linux.dev>; Wed, 18 Dec 2024 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487279; cv=none; b=VZaYwdJz+O8uv2K0LSI9btePncUDA6mb8behVN0bt6Y/mzCnE8e7vkphTUpsH+9+5EFeFvV2DPQ3iOfp9hxChu6v5bi6QSlzlEVUXKJCFGWYqN1CtAY1sDO1teek7fhr/gyWuw1Lh/r1Jssl+YUziaKKZVDjwgd0JG3wTOvIp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487279; c=relaxed/simple;
	bh=zh7rkqsCSw5Arb6/dJAfSpTXav0f09k60tpR678lQSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6q3YrqbAsLnz1QuppRHZpCE7j6s5AQOXusOo2dVZgxYYTq6TG91LS2nDKf79M+wOrQrEaMVpimMeynwrNzrXEEz2tCrA+U1xz3/N/8VrCCapBXEEoT7VDNIb1JGJyWdt65lDTAcpMZHlgQ0CezZanbVwLk6aq0NeOyyZl4ij/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCKX1kER; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCKX1kER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734487276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BjAHD0qsQovEKAbmMVJhxhdPuD7DaVYyEVzO7Asas/M=;
	b=fCKX1kER9C9IJjPQf58kBYy87DaRqQiszjw42Eqcj9mSZ4MmUdf3oKm3YohmOvaxWnzU2h
	zwYPlSZdYq+7PxXr+WCJ3/rCC/5K3VwqNdLslwu+UZq8u/zPAnL6cpfHV5g1v3nou3a6bt
	uOiG/BuZ06BB5RMcTJmGjQBDZCkNGjc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-JEjJhOseP9a1kdLgt4pqFQ-1; Tue,
 17 Dec 2024 21:01:11 -0500
X-MC-Unique: JEjJhOseP9a1kdLgt4pqFQ-1
X-Mimecast-MFC-AGG-ID: JEjJhOseP9a1kdLgt4pqFQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2EAD219560A7;
	Wed, 18 Dec 2024 02:01:09 +0000 (UTC)
Received: from fedora (unknown [10.72.116.33])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D06BE19560AD;
	Wed, 18 Dec 2024 02:01:01 +0000 (UTC)
Date: Wed, 18 Dec 2024 10:00:56 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Peter Newman <peternewman@google.com>,
	Babu Moger <babu.moger@amd.com>, Luck Tony <tony.luck@intel.com>,
	linux-block@vger.kernel.org
Subject: Re: [linus:master] [blk]  22465bbac5:
 BUG:KASAN:slab-use-after-free_in__cpuhp_state_add_instance_cpuslocked
Message-ID: <Z2Is2Ee8Me8qRPR-@fedora>
References: <202412172217.b906db7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412172217.b906db7c-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Tue, Dec 17, 2024 at 10:20:47PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:KASAN:slab-use-after-free_in__cpuhp_state_add_instance_cpuslocked" on:
> 
> commit: 22465bbac53c821319089016f268a2437de9b00a ("blk-mq: move cpuhp callback registering out of q->sysfs_lock")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      231825b2e1ff6ba799c5eaf396d3ab2354e37c6b]
> [test failed on linux-next/master 3e42dc9229c5950e84b1ed705f94ed75ed208228]
> 
> in testcase: blktests
> version: blktests-x86_64-3617edd-1_20241105
> with following parameters:
> 
> 	disk: 1SSD
> 	test: block-group-01
> 
> 
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202412172217.b906db7c-lkp@intel.com
> 
> 
> [ 232.596698][ T3545] BUG: KASAN: slab-use-after-free in __cpuhp_state_add_instance_cpuslocked (include/linux/list.h:1026 kernel/cpu.c:2446)

Hello,

Thanks for the report!

Unfortunately I can't reproduce it in my test VM by running
'blktests block/030' with:

- two numa nodes
- enable CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION


But just figured out that one freed hctx still may stay in cpuhp cb list, can
you test the following patch?


diff --git a/block/blk-mq.c b/block/blk-mq.c
index 92e8ddf34575..f655b34efffe 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4421,7 +4421,8 @@ static struct blk_mq_hw_ctx *blk_mq_alloc_and_init_hctx(
 	/* reuse dead hctx first */
 	spin_lock(&q->unused_hctx_lock);
 	list_for_each_entry(tmp, &q->unused_hctx_list, hctx_list) {
-		if (tmp->numa_node == node) {
+		if (tmp->numa_node == node &&
+				hlist_unhashed(&tmp->cpuhp_online)) {
 			hctx = tmp;
 			break;
 		}


thanks,
Ming


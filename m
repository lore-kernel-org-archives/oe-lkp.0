Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A21DE3C4;
	Wed, 29 Jan 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167155; cv=none; b=JEgNUdj6ECDy0qsIOChVPedqw5/QEqGrVo74j6GW/ag6BpSqO684f8jV085FGau2FlO0Nn+A0Nb72+Z417tSAhAaRRDhx9zjDirWscXFr4ib3AOIiHRmr19i/xBcT9RFNxaL0BKxBFCB2myYteIok2Hf8mmIG4q7qogOaXKAUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167155; c=relaxed/simple;
	bh=uW26broI7Cxb3pjRNEB5p2rIQRFsA5heFBOLF8/fd6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNZ6Iy45IoxJsoGMHAWNTOHWCD/aFgQXJHS4mKPuylRkJlYbVrobC55ZqQmNTpsXzunmgfAqChO5BkKkai6rI5jqpt2Rc6BiqYEJY1hEZe/J3+lqg5Zdgrj+AWfRPWE4v5eZNrzeaADr6R0441JGvw8kjw98YkrUTS96J82gkVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bs7IZbeV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bs7IZbeV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j0HK5TPk6f0FjIshJMILoRCi38YHaBLxV0Gt/h+uZhY=; b=bs7IZbeVFgmwceOcggtT/HRrIr
	uobTN5xJm9M9SAL6EM3Hv72XVMQ1pBUrbvPxHrqLLtZ0odpX24Wfza/zM5f4QOEAxbPbKPoPlR5UP
	QDzyPvS2KprCUuCNToEFyDgy+n5uSZ/m8WYeEKU4hSh/PeH/DRzDTPQ22Kl506hNBsKAbJP2vQ4B9
	RCwuF3zq4YtWX4zDz6rnTZ7KC5hChyjrKmCNSe5BT1EW8+6v0lvy8eRLOpD8fUaq+7P8r/k5WeOCu
	AryS3i2zJU9PEdqTnngpUVBl4n/3OSMPzK+EDa1L+hll0gugvEs/w7SbpPl61ABsdHIvrt1fkoY69
	YURAAvAQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAfv-0000000CAuc-15P8;
	Wed, 29 Jan 2025 16:12:23 +0000
Date: Wed, 29 Jan 2025 16:12:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Rientjes <rientjes@google.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>,
	Zach O'Keefe <zokeefe@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <Z5pTZ0XLFzfM5dic@casper.infradead.org>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129105920.7a4bffa1@fangorn>

On Wed, Jan 29, 2025 at 10:59:20AM -0500, Rik van Riel wrote:
> Below is a tentative fix for the issue. It is kind of a big hammer,
> and maybe the RCU people have a better idea on how to solve this
> problem, but it may be worth giving this a try to see if it helps
> with the regression you identified.

Perhaps better to do:

+++ b/mm/page_alloc.c
@@ -97,8 +97,8 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
  * On SMP, spin_trylock is sufficient protection.
  * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
  */
-#define pcp_trylock_prepare(flags)     do { } while (0)
-#define pcp_trylock_finish(flag)       do { } while (0)
+#define pcp_trylock_prepare(flags)     rcu_read_lock()
+#define pcp_trylock_finish(flag)       rcu_reada_unlock()
 #else

 /* UP spin_trylock always succeeds so disable IRQs to prevent re-entrancy. */

with appropriate comment changes

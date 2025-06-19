Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E417494
	for <oe-lkp@lists.linux.dev>; Thu, 19 Jun 2025 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345767; cv=none; b=GYuMHZtbZL7JM7D38AADemdpNOyyjZw0Q6xdG9+XJfXDAs16Z1bibycFV0rAXU806QOIKYinbS9VrOk3etwuVcZAxQZ9plUXYep/oNXLEO+5vuv1urSmdV7XIQO25inE4yj3JapwFQmr2Moa/h6ssflagrxpRwwcWdY2MhcYLNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345767; c=relaxed/simple;
	bh=lCx5xNGrom/G8iFDz5pK63/T9nM9G5Kj32uUckHHDUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=THhI6EewO5RgeaBJyv3gU2TQ/XwOlQ1+Z6eXJP3gLd+IvtOEdx86oXAne2xemS6O8p72x9CwGFgCmlMLYiVmkB418tkwGYylXZD8DJ3B3bWq6OqTCQOvT3Db1LVp6/1MiY64KBrHE5pW90YZV8QDw4pgjQjeqNWpgFCiy+Ppu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=py/zawz7; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="py/zawz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dn
	I0saL/VnDxGEyhN0bnHVZ0uSc84Fgmk+s6JH/vwuo=; b=py/zawz7Cz6Ky77cGm
	ZWZW3s0GIz19TnAIgYlLoWTKOhx2Eun0i/arArOM+8Xlmxi/eYDwLwpIOVNFguUD
	zaukyoxwKXo5Vhfyv1sphdNtizuWyuT3ibeE5xigv0pDZvgeo95NbbKKfdMizHMR
	t0sjJPZge+0p3mJhNErBkIzNQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnLZ_dJ1RoTEbnAQ--.28406S4;
	Thu, 19 Jun 2025 23:08:29 +0800 (CST)
From: David Wang <00107082@163.com>
To: harry.yoo@oracle.com,
	surenb@google.com,
	cachen@purestorage.com
Cc: ahuang12@lenovo.com,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	hch@infradead.org,
	kent.overstreet@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lkp@intel.com,
	mjguzik@gmail.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	urezki@gmail.com
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when !mem_profiling_support?
Date: Thu, 19 Jun 2025 23:08:09 +0800
Message-Id: <20250619150809.69482-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <aFQaY4Bxle8-GT6O@harry>
References: <aFQaY4Bxle8-GT6O@harry>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnLZ_dJ1RoTEbnAQ--.28406S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rJr48tF4kZw13ZF4Utwb_yoW8uF47pF
	WrX34UGFZ8Jry7CFs2gr12vry0ga1UJw15KF4Y9ryF9rnIvF4UWrWrtrWaqFyxuF98K3Za
	qrsFyFyjk34UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6WlkUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBtxqmhUJTFZJAAAsF

> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > 
> > Hello,
> > 
> > for this change, we reported
> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > in
> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > 
> > at that time, we made some tests with x86_64 config which runs well.
> > 
> > now we noticed the commit is in mainline now.
> 
> (Re-sending due to not Ccing people and the list...)
> 
> Hi, I'm facing the same error on my testing environment.
> 
> I think this is related to memory allocation profiling & code tagging
> subsystems rather than vmalloc, so let's add related folks to Cc.
> 
> After a quick skimming of the code, it seems the condition
> to trigger this is that on 1) MEM_ALLOC_PROFILING is compiled but
> 2) not enabled by default. and 3) allocation somehow failed, calling
> alloc_tag_top_users().
> 
> I see "Memory allocation profiling is not supported!" in the dmesg,
> which means it did not alloc & inititialize alloc_tag_cttype properly,
> but alloc_tag_top_users() tries to acquire the semaphore.
> 
> I think the kernel should not call alloc_tag_top_users() at all (or it
> should return an error) if mem_profiling_support == false?
> 
> Does the following work on your testing environment?
> 
> (Only did very light testing on my QEMU, but seems to fix the issue for me.)
> 
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..57d4d5673855 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -134,7 +134,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
>  	struct codetag_bytes n;
>  	unsigned int i, nr = 0;
>  
> -	if (can_sleep)
> +	if (!mem_profiling_support)
> +		return 0;
> +	else if (can_sleep)
>  		codetag_lock_module_list(alloc_tag_cttype, true);
>  	else if (!codetag_trylock_module_list(alloc_tag_cttype))
>  		return 0;

I think you are correct, this was introduced/exposed by
commit 780138b1 ("alloc_tag: check mem_profiling_support in alloc_tag_init")
(Before the commit, the BUG would only be triggered when alloc_tag_init failed)


David


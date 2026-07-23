Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83DE35CBD7
	for <oe-lkp@lists.linux.dev>; Thu, 23 Jul 2026 02:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774793; cv=none; b=n2PZ4Ut4JSiP9p3KRzJGYcJWxSU8QhSL8WReLLe0SYwqtpFdpDADrWa8jZC/EmvPo6wjyvVqWQAedPt9V0lVLWZm0JoXB1j9BuyE+CRUHO+yNXyqcBRMiSPjIb3SV12JF5HebPuHw5mSJdppKzXJUZ/5FbfU9YXFXu3pRMr86+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774793; c=relaxed/simple;
	bh=d3L2V6nh+JrQJVrcctRD6BzD4rjO44Y3KV9LnP7t6fI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bm3D1xHtlf2e5KSgIvwesbY2UiWGTT6ROhFnb9gFs6E4A/lYKXnSKU6OKiSpMYqUMjhV/lUnTbBinJftTSwS0sCYU3AM6GMAKpl4RgA70JeHn4lLi1pnmkPDkjvQz9lCpnmhLwAzIhArD3nVKl5hcfaiKg0iIABdi9XWtayv7S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ac5EfVkA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ac5EfVkA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so140200a91.3
        for <oe-lkp@lists.linux.dev>; Wed, 22 Jul 2026 19:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784774787; x=1785379587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Si8wKsJ7OZH8AFm088arDM3rFGkqQRF41Hdi0sqAHg=;
        b=Ac5EfVkAj98xOeYVglm4ZoTMAiVG60CL3bd5zG/uo6hI2ObzNyZ/z9eb4xYpJpeAV6
         FOZGTAX/JWB6dp+hKVUpHLnnFnQcCrRh5/2Hs0JLKMWpQoF3w6ux1ymLLYmdyZYDwXXI
         AxPJnZCOSkTfa2/2YXMzr2hl5CDMEdNyQ1zksOFk2+vld/GJ550F7NMAAGknZMzrOAIP
         0VR3ODsnJKDrIWh7RGfJee0Db67HbIPMQSJDbwWnoJ0jV7/w0aGxtmO0F2Ti07gQal6h
         dpVXLg+urS0H4dliDNfQ8vjSzCWiG7nd7y+nXvYdIQprMgPHBhmsrw3b7ldDl/12TfrN
         wYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784774787; x=1785379587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Si8wKsJ7OZH8AFm088arDM3rFGkqQRF41Hdi0sqAHg=;
        b=CijT3Gs0xh/PLmcsBQ2+xj9+Lu9gPPzeiGxnQO6yc427eKKcHkPefwPXtWmOKSVmHh
         7xJbl8c3PhQJBA9gTYLXKQst2w6QR+jWlktHeo6ahjWL9usTj0CoA+kv7bnGU5H194sj
         24gIZMtpr3aguoL/HgMYyY4e71H2IlK9MTX+AjLu7MvgiGvVbv6lZATVVA0P8rGbkYO8
         4ltqM7Mi1VbesH5zEviJnIFvZb4MNG/OlN0a2IOGm8zfCIDneh6E7U1mD8c0+efsSXUy
         yt0s4fubJJyXehd3QIusl4kJ0sVxZ0CfsK70Pjkib1Oiwg4YPk2huYztc715Rz48TG1w
         o14A==
X-Forwarded-Encrypted: i=1; AHgh+RrnJGth+8f6mZMAIUi89ttQPspVdDT7xLR+km1/E35hw3sEEQJ2fqmpLqP87OrOybs2FKkqGVw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx52SgXucI3b03JibAPzDBMAyG36vmtIrgFHoZJ9xdiapAIy+GW
	28R3At9K1hRYVoLcw6RC7OPe4H1V8KV8Tpz/w/bkpK9vVxemK2HfQovZ
X-Gm-Gg: AR+sD13WrCn+itcmf0ZwOD8UferZzi4q+eWesGscdNderjWrd+LmyVGTOVq77JSRq4E
	rkNyOGw1QCHhTGRXGyNT6VC6i5lbZXPrsQgLCfm1DgFTMtDUJopexnG1QQCtRAH9MO65ktQjlPt
	qWSfm7n5cEextsiDmH53JbFpur5D6YtB7+7ykK9r4MfDtBNmI1EtFqR/BzpgBmbsVb6JupXpjZ/
	qSvx9f2DrF2ncG3HpiUYBcIlWFQGhUMhg4mU3LjIDMBtcKPcTioARmaf1XT300J12OLH1DjDpVb
	vMmyVHUfs4DQx5giDfQTyoe5jYq6sMBKClhTYhRreU9NIRU/F52SDlCb0sl/5n1YcjvqsLVTdCy
	qjNnzO/Oinc5U86AghTQk9/okLrAZyPRENHoletBAxoDeOj3evY2I41EeyB72vMp5npkiSQi6It
	lCcefGvBOwWACWIjM3poM=
X-Received: by 2002:a17:90b:2ecd:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38ec64dc738mr1269231a91.14.1784774787060;
        Wed, 22 Jul 2026 19:46:27 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecab80efdsm114436a91.6.2026.07.22.19.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:46:26 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: oliver.sang@intel.com
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	fmayle@google.com,
	kaleshsingh@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	surenb@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	zhangbo56 <zhangbo56@xiaomi.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second 45.8% regression
Date: Thu, 23 Jul 2026 10:45:27 +0800
Message-Id: <20260723024527.2822383-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202606181547.617a6967-lkp@intel.com>
References: <202606181547.617a6967-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhangbo56 <zhangbo56@xiaomi.com>

On Thu 18-06-26 16:00:42, kernel test robot wrote:
> kernel test robot noticed a 45.8% regression of
> pts.svt-av1.Preset13.Bosphorus4K.frames_per_second on:
>
> commit: 7b32f64bc512b40b268776c5ac4d354b325b3197
> ("mm: limit filemap_fault readahead to VMA boundaries")
>
>     169.95 +/- 6%     -45.8%      92.15 +/- 10%  pts.svt-av1.Preset13.Bosphorus4K.frames_per_second
>     220.57 +/- 3%    +870.9%       2141        pts.time.major_page_faults

Hi Oliver,

Could you help test if the below patch fixes the regression?

The 870% increase in major faults suggests that readahead is being cut
short too aggressively. The current approach unconditionally sets
_max_index on every fault, which likely prevents readahead from
prefetching ahead effectively for sequential access patterns.

The fix: only limit readahead when the fault is close to the VMA end --
if there are fewer pages remaining in the VMA than ra_pages, set
_max_index. Otherwise, do nothing.

For a 4MB VMA with ra_pages=32, only faults in the last 32 pages (128KB)
trigger the limit. The other 99.9% of faults see no change at all.

Similarly, only clamp the read-around start when the fault is near the
VMA beginning.

This applies on top of 7b32f64bc512 and can be applied with git am.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/filemap.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 97772a05a18e..9f1e1c9ea6df 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3313,8 +3313,11 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 	vm_flags_t vm_flags = vmf->vma->vm_flags;
 	bool force_thp_readahead = false;
 	unsigned short mmap_miss;
+	unsigned long vma_end_pgoff = vmf->vma->vm_pgoff + vma_pages(vmf->vma);
+	unsigned long vma_pages_left = vma_end_pgoff - vmf->pgoff;
 
-	ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
+	if (vma_pages_left < ra->ra_pages)
+		ractl._max_index = vma_end_pgoff - 1;
 
 	/* Use the readahead code, even if readahead is disabled */
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
@@ -3398,7 +3401,8 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 		 * mmap read-around
 		 */
 		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
-		ra->start = max(ra->start, vmf->vma->vm_pgoff);
+		if (vmf->pgoff - vmf->vma->vm_pgoff < ra->ra_pages / 2)
+			ra->start = max(ra->start, vmf->vma->vm_pgoff);
 		ra->size = ra->ra_pages;
 		ra->async_size = ra->ra_pages / 4;
 		ra->order = 0;
@@ -3441,7 +3445,12 @@ static struct file *do_async_mmap_readahead(struct vm_fault *vmf,
 	}
 
 	if (folio_test_readahead(folio)) {
-		ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
+		unsigned long vma_end_pgoff = vmf->vma->vm_pgoff +
+					     vma_pages(vmf->vma);
+		unsigned long vma_pages_left = vma_end_pgoff - vmf->pgoff;
+
+		if (vma_pages_left < ra->ra_pages)
+			ractl._max_index = vma_end_pgoff - 1;
 		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
 		page_cache_async_ra(&ractl, folio, ra->ra_pages);
 	}
-- 
2.34.1


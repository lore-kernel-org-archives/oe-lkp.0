Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25331B807
	for <oe-lkp@lists.linux.dev>; Wed, 26 Nov 2025 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150559; cv=none; b=tr30ehk7OZZEGtoxmGo11yL1e9FLvGCQGoeWm2d7VlSlWezfI59SzZynllkXoqhXQ7x/xQwNxhiXS9yjGjr+Mdh7ulSb0CJ+qgJvMD1JVqPErckjrduV5IS+Pi8WXOlqSpNH4PYS3KB0A2msuKM5ce8XFWrwD8eUXvfwX7Ts6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150559; c=relaxed/simple;
	bh=cGK1V5cr2XtVBUIwxDOJ1VtDwImhH9JCyGkX+QSHrAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iH+xNxo5b13Pc7797rzdczoDx4Z/ypRlQM+eGslfD6j3RIIGzc2o8EeyRv6X6JzS+uwFHrJavoM602LUTbqIPtwhF0LhU6YOQFbhq4P2TwIDh+6k97B8K1UXoObrbhQYKPsX2h7Lmcrp5kwPV9m0eYiTDfUM8wl8nZK7xPjXMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7uytnyb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7uytnyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75150C113D0;
	Wed, 26 Nov 2025 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764150559;
	bh=cGK1V5cr2XtVBUIwxDOJ1VtDwImhH9JCyGkX+QSHrAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K7uytnybsQ+iB+pXK7FSU23a44D0slh30ic/Mgcvibmyqq8lNuMOmLfTdpFKHvGDr
	 qzvcyxgovIPuzNa9eHN8p3DQdbvr+upZbn5SklLVGY6nT3shefbLVzrBq2l6ZSsRAJ
	 I8oFmC0t2ohpHUi9wj54qsU0tofRwgDVBHL76khriWLT0cCAQvVWt9L8Trg1QS8DRI
	 yzaEKS5km8gWcIv+1dUYLy1S6ZU6OYQdTPGq1h0748Yo+cSWKnu/wxXuwac9e95tVd
	 YTq6nRZ4xj/Hfh5BmCn1V+GfsYFnRhBb/T9SDBBxqNTmgE4C3Itc54r6nrqHJx/aQ2
	 agegWz5R/FcBQ==
Message-ID: <16995732-b7b9-4121-be36-e912a4154958@kernel.org>
Date: Wed, 26 Nov 2025 10:49:14 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] f66e2727dd:
 stress-ng.rawsock.ops_per_sec 46.9% regression
To: kernel test robot <oliver.sang@intel.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
 Liam Howlett <liam.howlett@oracle.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <202511252236.33b899b3-lkp@intel.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <202511252236.33b899b3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/25 15:46, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 46.9% regression of stress-ng.rawsock.ops_per_sec on:
> 
> 
> commit: f66e2727ddfcbbe3dbb459e809824f721a914464 ("mm: huge_memory: use folio_can_map_prot_numa() for pmd folio")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Unexpected, but maybe simple a symptom of doing the right thing?

"which skips unsuitable folio, i.e.  zone device, shared folios (KSM, 
CoW), non-movable dma pinned, dirty file folio and folios that already 
have the expected node affinity."

I suspect skipping shared folios or dirty file folios might make the 
difference. The benchmark results would be misleading in that case: as 
we shouldn't have migrated these pages in the first place beforehand.

-- 
Cheers

David

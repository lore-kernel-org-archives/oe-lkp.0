Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A81C9851
	for <oe-lkp@lists.linux.dev>; Tue,  3 Sep 2024 12:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367461; cv=none; b=Hi3OaUm3yCSaw0M4aoi66+Bzh47Q5f8zp7aWduLkpXyIiYcb+9SPQTthTpIhN8+k1X2Lyoox9M80+/0JpOCVjEC1FineJR/duQ1ayk532g5dSzOkswUYwxr5l5YsQuHzZ3xI1O2UHIsSDd39YC45wDrvC2NDIgoQjWS598z5ps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367461; c=relaxed/simple;
	bh=hi31tewvzf+9Y3PxZ6H/moeIt7F6QV+7CCnLM9WLtCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu4ADI+U08Q8CfEABuHPKboaXNPXgrmgr9Gim37/jaO2vDlaaj+cLcGGtR1rqOi60HQKker9VviZBqcToBjdBPiloDAAQ1W/inwmfOkl73MDB9ngnTO8B4l/hh3QwIlUSohBdTozpsBjfVT8z/pMIXtaqgao1HvYlS+k6eT6I4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEBA7FEC;
	Tue,  3 Sep 2024 05:44:44 -0700 (PDT)
Received: from [10.162.40.33] (e116581.arm.com [10.162.40.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9F783F73B;
	Tue,  3 Sep 2024 05:44:09 -0700 (PDT)
Message-ID: <f260abb4-660f-4d16-b243-b89ed734e492@arm.com>
Date: Tue, 3 Sep 2024 18:14:02 +0530
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: Allocate THP on hugezeropage wp-fault
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@redhat.com,
 willy@infradead.org, kirill.shutemov@linux.intel.com, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, cl@gentwo.org,
 vbabka@suse.cz, mhocko@suse.com, apopple@nvidia.com,
 dave.hansen@linux.intel.com, will@kernel.org, baohua@kernel.org,
 jack@suse.cz, mark.rutland@arm.com, hughd@google.com,
 aneesh.kumar@kernel.org, yang@os.amperecomputing.com, peterx@redhat.com,
 ioworker0@gmail.com, jglisse@google.com, linux-arm-kernel@lists.infradead.org
References: <202409031602.14479174-lkp@intel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <202409031602.14479174-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/3/24 14:15, kernel test robot wrote:
>
> Hello,
>
> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/memory.c" on:
>
> commit: c636ba74f021bfe8d72845f9e53ee2b8ea16f5f8 ("[PATCH 2/2] mm: Allocate THP on hugezeropage wp-fault")
> url: https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Abstract-THP-allocation/20240830-164300
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/all/20240830084117.4079805-3-dev.jain@arm.com/
> patch subject: [PATCH 2/2] mm: Allocate THP on hugezeropage wp-fault
>
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
>
> 	runtime: 600s
>
>
>
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202409031602.14479174-lkp@intel.com
>
>
> [  189.202955][T15284] BUG: sleeping function called from invalid context at mm/memory.c:6690
> [  189.203611][T15284] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 15284, name: trinity-c6

I guess, since thp_fault_alloc() may sleep due to folio_zero_user(), I need to call it before
do_huge_zero_wp_pmd_locked(). I will send a v2 since I also need to clean up the lock/unlock sites.

>
>

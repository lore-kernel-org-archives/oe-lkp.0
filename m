Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7B2F31
	for <oe-lkp@lists.linux.dev>; Thu, 27 Oct 2022 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666883551; x=1698419551;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8A/YviDx8iqyRdDwX9h7ESPZbhw7TVDZ5xd3lzXfDHw=;
  b=XFQBQuOxhjPOJP3Jb3Iv5PM76jpZRcCF9ZPsIT1W+QOAUdMKzVzH4KwV
   0hTrlj9hu0aYYJOKeypmZLTssbETfSVKycVVXjn/zzqPqzBtgYb8gWlK9
   /eQx2+sVT1Tc8GDn4Y9fov2Fkyyb4/r9cpmsANUfmUFcDtf5OjJr9CfME
   pyL1RUoqextgRPtZidRuhlUsHwpnPupHbzzNsueb2OKuexMpWa2AmtwWR
   vvHipOlV+CfJZkTK/EmC34hNx3wIv2EMqtzlX3GZpsbV4qOka17cpHZH/
   PyYzm7uSyXVega4apzENkpVNXpS+nO0bjdTayciglmwWO5sOANidQTR2O
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295659611"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="295659611"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 08:12:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="701378321"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="701378321"
Received: from vstelter-mobl.amr.corp.intel.com (HELO [10.212.214.108]) ([10.212.214.108])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 08:12:28 -0700
Message-ID: <864b4fbe-4462-9962-7afd-9140d5165cdb@intel.com>
Date: Thu, 27 Oct 2022 08:12:26 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [tip:x86/mm] [x86/mm] 1248fb6a82:
 Kernel_panic-not_syncing:kasan_populate_pmd:Failed_to_allocate_page
Content-Language: en-US
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Seth Jenkins <sethjenkins@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 "Yin, Fengwei" <fengwei.yin@intel.com>
References: <202210241508.2e203c3d-yujie.liu@intel.com>
 <Y1e7kgKweck6S954@hirez.programming.kicks-ass.net>
 <278cc353-6289-19e8-f7a9-0acd70bc8e11@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <278cc353-6289-19e8-f7a9-0acd70bc8e11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/22 08:39, Andrey Ryabinin wrote:
> KASAN tries to allocate shadow memory for the whole cpu entry area.
> The size is CPU_ENTRY_AREA_MAP_SIZE/8 and this is obviously fails after your patch.
> The fix this might be something like this:
> 
> ---
>  arch/x86/include/asm/kasan.h |  2 ++
>  arch/x86/mm/cpu_entry_area.c |  3 +++
>  arch/x86/mm/kasan_init_64.c  | 16 +++++++++++++---
>  3 files changed, 18 insertions(+), 3 deletions(-)

Andrey, if you have a minute, could you send this as a real patch, with
a SoB?

Alternatively, do you have any issues if we add your SoB and apply it?

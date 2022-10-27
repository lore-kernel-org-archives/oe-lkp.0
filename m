Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842327B
	for <oe-lkp@lists.linux.dev>; Thu, 27 Oct 2022 21:35:45 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g12so4977871lfh.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Oct 2022 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DLMSX5xAv8Of0i26zhWYF6rLIZWMK34svw6mTWTkhA0=;
        b=k76nKuwuAv2/FX6e0asrhgtq+Zaezq8dDXRxUYPw8WXy0lRzqXw4z/udSZSBZDsEOL
         vNMGvR7jVzQZs6khH+kl+Gm3M8aACk2+j2Yk/CNCpWdIMpDTL/ITB2i2LUjIM/IOmbdE
         bl0AXFMLe0pldjS1m7pj8IXCry1oLJKX3P8/CbZGGbUr0fihMvuXSG0b9cHQidZ24qBh
         e+u0BKUFkMJ/pTjL+0RvHEQFQzMpTbZREXQds8rzhufKhspiyGlDef6jEwuG3pwfPIER
         hc3oZdh5gbGEZhddyIg/EXeLacbfHAtgBU8ngguLXLnfHv601Y6x+54cSblsjYjqNBNg
         1iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLMSX5xAv8Of0i26zhWYF6rLIZWMK34svw6mTWTkhA0=;
        b=UFqR5pI1VCBqSKgfMGsyL5yQjWKLoywDJ3JrgvWsHuKgOs4FMzbjD7QNolKwX6jPqZ
         tMw5jCwaLrjr5hZgRsLLKQUVF/ejNmeJ5ktClpEyNH0B+CbQ5l0xYqG4CFktUK/+RNRZ
         PgNpBS0tZQAeE8Dw/tRlPsvjIoCzZPqFHu7SqQmMWOuSG2+qOPJmPZT3Us2qV3rqhRMW
         Y2+KR39qIEmnEDzv9uYBF3WvJNlcwdFDGWmOfL41Jf/l+gdUCsxxltC/0rHo9Ka4ZuE3
         i6agPWzfwnQiLCLCdIEZyAz0gYBYiHGNdNvWOLyKY1ZJqogJEjR13zHAGcW9w6jsC9Iq
         f73w==
X-Gm-Message-State: ACrzQf2D4nrq0Kx2eZkt41zxJES7b/Uwkw/cAcV2M3GoBXTD0M2FE42J
	zij7IR0RkxjhjQcw9EAM6MI=
X-Google-Smtp-Source: AMsMyM6Qs3AoWb6vrKWJ9H8UiVK9vcnmwQDjZpxxZN6/65eM9FeASSG+D+Mg8/KCEPpsrXgl3XJovA==
X-Received: by 2002:a05:6512:2983:b0:4a0:5745:f7ca with SMTP id du3-20020a056512298300b004a05745f7camr21096993lfb.116.1666906543496;
        Thu, 27 Oct 2022 14:35:43 -0700 (PDT)
Received: from [192.168.31.203] ([5.19.98.172])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00492ce573726sm318308lfs.47.2022.10.27.14.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:35:43 -0700 (PDT)
Message-ID: <1c3209e7-a184-22f7-096c-874a2f77ce55@gmail.com>
Date: Fri, 28 Oct 2022 00:35:44 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [tip:x86/mm] [x86/mm] 1248fb6a82:
 Kernel_panic-not_syncing:kasan_populate_pmd:Failed_to_allocate_page
To: Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, kernel test robot <yujie.liu@intel.com>
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
 <864b4fbe-4462-9962-7afd-9140d5165cdb@intel.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <864b4fbe-4462-9962-7afd-9140d5165cdb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/27/22 18:12, Dave Hansen wrote:
> On 10/25/22 08:39, Andrey Ryabinin wrote:
>> KASAN tries to allocate shadow memory for the whole cpu entry area.
>> The size is CPU_ENTRY_AREA_MAP_SIZE/8 and this is obviously fails after your patch.
>> The fix this might be something like this:
>>
>> ---
>>  arch/x86/include/asm/kasan.h |  2 ++
>>  arch/x86/mm/cpu_entry_area.c |  3 +++
>>  arch/x86/mm/kasan_init_64.c  | 16 +++++++++++++---
>>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> Andrey, if you have a minute, could you send this as a real patch, with
> a SoB?

Done, It slightly different because there was a bug in vaddr->nid calculation.

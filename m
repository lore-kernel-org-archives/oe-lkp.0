Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22567E
	for <oe-lkp@lists.linux.dev>; Mon, 21 Nov 2022 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669017665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0AQyYFfo+9gxGliawJp4LGdOeDV+4qepnwYb6KBjwmI=;
	b=OIJKTikzlC7Jh0SFK50q+prNKV8ajOtQkNvL+62QBxZj1PoYytVACuGQFqxbMuGGgIWh7x
	3M3Mjap/KIjz4oiuTDQepMndYWSpbim20ZpsH/Wt972iRDHMOt1j+vfkv7hSAlU9ll9pLW
	T7R/sip4FLgXv1euoW96c2LBwiOCGhg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-4og5xeaKP7CLkE22APM7Ag-1; Mon, 21 Nov 2022 03:01:03 -0500
X-MC-Unique: 4og5xeaKP7CLkE22APM7Ag-1
Received: by mail-wr1-f72.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso2877020wra.1
        for <oe-lkp@lists.linux.dev>; Mon, 21 Nov 2022 00:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AQyYFfo+9gxGliawJp4LGdOeDV+4qepnwYb6KBjwmI=;
        b=RmBgAMufdpUtAZ0rKrybNj2CJ5MDEGlv96fCENqkQ0+Jwk8PPk8c4QfdceM0Kn0kga
         7XgMBUQs9tyGnBCz1RVmNah4xqlVNR2Vz2xwMu7Eou+hiwMF/P1AOLYYGhwcApEXJUMl
         junQPqLzRNbBSga7trDUayxTD76mkePArQnFdIOzHSC7T8O4JnhSYlRzV0zbFuYbNbez
         EXr9MgjXVZ5tVyzrNM/kmuKNqLZzpcVtMGecfGUHZUURskK5+mkPaBve9TvfWyqBjgXK
         okSKlFZ5oJ7UJSgBjxzZKRQ0h+c45IpFfU2TxSeaHaB/HAexv1yGjWdWXOFjkuMJ55u1
         bfPA==
X-Gm-Message-State: ANoB5pnmX7baW7txA7wY26W0rcQiMp72CHgX9Jrvv8l+3oKezvwdUtMp
	J210E8bWFr7vj+SPX72d50AKp+nrBb6ha3oRI9h1MB+ZOWjaPQBBNDuHF0mQMlg9+qsSW0JdIF3
	PWJ4kU9xkk5cIGFuK
X-Received: by 2002:adf:eb0c:0:b0:236:6deb:4498 with SMTP id s12-20020adfeb0c000000b002366deb4498mr10407202wrn.52.1669017661915;
        Mon, 21 Nov 2022 00:01:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77j1WiPf/k1EzdHh95eZGoSHc+IIaDgk6glybs/fguxmE2Lp2ljuzCpa/dLBDvV3elHKQL7A==
X-Received: by 2002:adf:eb0c:0:b0:236:6deb:4498 with SMTP id s12-20020adfeb0c000000b002366deb4498mr10407175wrn.52.1669017661507;
        Mon, 21 Nov 2022 00:01:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:dc00:2571:c3c2:c6ea:84ef? (p200300cbc702dc002571c3c2c6ea84ef.dip0.t-ipconnect.de. [2003:cb:c702:dc00:2571:c3c2:c6ea:84ef])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm19240074wms.5.2022.11.21.00.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:01:01 -0800 (PST)
Message-ID: <7b2055f2-f5ce-be01-7c39-edcc4be6a7aa@redhat.com>
Date: Mon, 21 Nov 2022 09:00:59 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Nadav Amit <namit@vmware.com>,
 Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Michal Hocko <mhocko@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>,
 Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Christoph von Recklinghausen <crecklin@redhat.com>,
 Don Dutile <ddutile@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com,
 zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
References: <202211211037.2b2e5e1f-yujie.liu@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [linus:master] [mm] 088b8aa537: vm-scalability.throughput -6.5%
 regression
In-Reply-To: <202211211037.2b2e5e1f-yujie.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.11.22 04:03, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed a -6.5% regression of vm-scalability.throughput due to commit:
> 
> commit: 088b8aa537c2c767765f1c19b555f21ffe555786 ("mm: fix PageAnonExclusive clearing racing with concurrent RCU GUP-fast")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> in testcase: vm-scalability
> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz (Cascade Lake) with 128G memory
> with following parameters:
> 
> 	thp_enabled: never
> 	thp_defrag: never
> 	nr_task: 1
> 	nr_pmem: 2
> 	priority: 1
> 	test: swap-w-seq
> 	cpufreq_governor: performance
> 
> test-description: The motivation behind this suite is to exercise functions and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability.git/
> 

Yes, page_try_share_anon_rmap() might now be a bit more expensive now, 
turning try_to_unmap_one() a bit more expensive. However, that patch 
also changes the unconditional TLB flush into a conditional TLB flush, 
so results might vary heavily between machines/architectures.

smp_mb__after_atomic() is a NOP on x86, so the smp_mb() before the 
page_maybe_dma_pinned() check would have to be responsible.

While there might certainly be ways for optimizing that further (e.g., 
if the ptep_get_and_clear() already implies a smp_mb()), the facts that:

(1) It's a swap micro-benchmark
(2) We have 3% stddev

Don't make me get active now ;)

-- 
Thanks,

David / dhildenb


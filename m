Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5F1A8BFF
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413798; cv=none; b=UU2/H1y+VT1YqsMyvYS+bbpn4srcJevzvdjA3huNnbwmEG70BtPuLfZSIZ/eAnFQ2uE6UY65ctsdOY+FA3XGPv7zy5jD+fMKKfCBYD92Vt7E4z94t5HvhazAZ9NCu8TwwcoYYdtwRnUkHC+xPGRhAyk3BXAZMU7qUhc013tH0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413798; c=relaxed/simple;
	bh=Q8DE9qWq2PXaRyuXWi61dkLmyWBE147p1fVhCm00z1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZb8mex8gFqHYFZVq5Ezy+8riU2NhkGKieWAMmHiewEsglNp0JCwq87P6fZAAHi+cMEJT0lqv20lLNSeVZHZbrwCxPb2NZpe0VVcQ1ZhDqXyfUM4NfYUi4wsZGRScxHQ3SGYvcJG+OuxTN8BzujW9YL2lQrYuysSILaYUsPivw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bL1A9gzx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bL1A9gzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722413794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gDr5eH1Au+gxvp7nyEZ2y49/jxR83JxdbV6gAuGRL5M=;
	b=bL1A9gzxtpMu4L6lhVoPBAkCrdTuIaOsfmqIJgKbqoPg1hQuUAxpYoL/Xtoiu0qwaLITcD
	rpYY8IUCEEglt/Awn/O5E/thPy4bNtevMzosdMTa6ZuA3uwPdRlKnf2LHazSAW+0oDXOnx
	oh2Mcws4vYJ3DYloz5N/w3BQjJBPeOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-BF7vnBaoPJWhxUkoMgG8iA-1; Wed, 31 Jul 2024 04:16:31 -0400
X-MC-Unique: BF7vnBaoPJWhxUkoMgG8iA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4280e1852f3so36543455e9.3
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 01:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413790; x=1723018590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDr5eH1Au+gxvp7nyEZ2y49/jxR83JxdbV6gAuGRL5M=;
        b=lcV3HLJ+3mO2NN9ZkVta1iObxpIJ4NENNoKt4yFnVzhAmsEet7AbEmSKrna559uD6x
         e/vAXk6PMhYnJz4pdYYo20ND0Qe/7DpGYH3ZXxXToTVeGr1z6JGSghTrauB00WPU7FXz
         bBRM2T3nhU9U2uyRpWg5MUJdH3FKI0DvsNQMuc2Q092IKxivUHmw2eioxHA0zJTDxjpE
         z2N3rT7gPyrrKwPnAVh3nCLEL319QRAQMZLfMiTHPVaSpeQ2XPTdACVkj8qB1335MH8v
         8UmZbhkcCefhXU2MTswIYAwjjZiHZSgO8Mqq1RGfnu61r9bHI84VePdK3N5QoULfFSl3
         gcKg==
X-Gm-Message-State: AOJu0YycPQ1VBt8w4cb33qjmkLKyZ+pl31KI94xKFXiPLvHhweJ1CaHX
	BdBH2iMLV9DjUB98l0aNokCXOo6iH3Y1nsdJgrzwHSO5RDM/dqYCWqOEONaYze4uxF/mqbJax1N
	SGlEAuKKysyL1oKT64nSLo3vQ7qXSt4bGCxI+8iVBL0WceFQFajYP9xZqykrOzw==
X-Received: by 2002:a05:600c:35d5:b0:426:61af:e1d6 with SMTP id 5b1f17b1804b1-42811e131aamr88366455e9.29.1722413790414;
        Wed, 31 Jul 2024 01:16:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq/URpIiai9g4wlSEuILZLpXnEc6c8H4gAOVtevTppTaG5HNBqxG1kaEWgLRVFENm9U6APXQ==
X-Received: by 2002:a05:600c:35d5:b0:426:61af:e1d6 with SMTP id 5b1f17b1804b1-42811e131aamr88366205e9.29.1722413789919;
        Wed, 31 Jul 2024 01:16:29 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23427.dip0.t-ipconnect.de. [79.242.52.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367f0e26sm16417595f8f.47.2024.07.31.01.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:16:29 -0700 (PDT)
Message-ID: <ff8619f5-7506-455d-ae13-124a4e87aa02@redhat.com>
Date: Wed, 31 Jul 2024 10:16:28 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:pending-fixes] [mm/hugetlb] d3fe1a0a02:
 WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
References: <202407311421.95f5c759-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202407311421.95f5c759-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 09:20, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr" on:
> 
> commit: d3fe1a0a0272723474056e3000717d69923ad901 ("mm/hugetlb: fix hugetlb vs. core-mm PT locking")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending-fixes
> 
> [test failed on linux-next/master cd19ac2f903276b820f5d0d89de0c896c27036ed]
> 
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-00
> 	nr_groups: 5
> 
> 
> 
> compiler: gcc-11
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +------------------------------------------------------+------------+------------+
> |                                                      | e98970a1d2 | d3fe1a0a02 |
> +------------------------------------------------------+------------+------------+
> | WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr | 0          | 12         |
> | EIP:huge_pte_lockptr                                 | 0          | 12         |
> +------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202407311421.95f5c759-lkp@intel.com
> 
> 
> [   39.570466][ T3479] ------------[ cut here ]------------
> [ 39.570921][ T3479] WARNING: CPU: 0 PID: 3479 at include/linux/hugetlb.h:948 huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1))

Helpful! Likely triggers because in that kernel cfg P4D_SIZE is 0.

-- 
Cheers,

David / dhildenb


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D949F23DE
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754591486; cv=none; b=no6x1HykoeZJECX0TYGA+Z0OpVBFM8WjTFzfjPToDRFzzy0Z1F1ltr2vP8xh0BTb6OhXvlnQUKPcT7WLFizyvuS0FPthqevL2uS882AdpACR7Iw+hYD9GDoK2Ils7f80t2ZBppGSuljM/+nHqV3MItI4mH9LmIYRcdlULvRzfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754591486; c=relaxed/simple;
	bh=+oV9pogg4ryVli/mSRgnaTylIBOo15LZ6OgukibWb4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy9w/OdpYMBBPrE/OUq+4uX8/z50wSKLbDD6tAkPL3cYYxTktIStCaMgeVDmL8jMGvZrPIz08acE/rUAAHjTwDXJy4KbHHwus+5sxTCh3YuFk/zyk7TscVmohzx4zMFQl2Cso4ENc+KPVtn0pTVp+8gVlh6X//MF4fw4T0Nc9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVb3qu5k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVb3qu5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754591483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KGmN9lP6LEPTy0/2PWA9RBpQSkFT5t9b0NPy5GoZR3g=;
	b=IVb3qu5k2lDinMp7nR0sGeysGkdEE7u8hHnNvVPAkoBcQe4E24wYNvP1DOc/5z45v18qD3
	GE16g9cgcFp6diZXD1tm+Rv9yMsckzloorkchpiHOhRZJpHiucqxjR/kMvHjhIrVooXiV7
	GidlDmtLXQKwR1h8UfibjfWDXVYnqrc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-j8qtCwVtM7-ATCNGHsDb5Q-1; Thu, 07 Aug 2025 14:31:22 -0400
X-MC-Unique: j8qtCwVtM7-ATCNGHsDb5Q-1
X-Mimecast-MFC-AGG-ID: j8qtCwVtM7-ATCNGHsDb5Q_1754591481
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-459de0d5fb1so12082565e9.0
        for <oe-lkp@lists.linux.dev>; Thu, 07 Aug 2025 11:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754591481; x=1755196281;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KGmN9lP6LEPTy0/2PWA9RBpQSkFT5t9b0NPy5GoZR3g=;
        b=NtMgwnc6GtXgm+Ca++zHvJrscWwnT28442SeMJSzj4SmYqc5i8EQfPTlpdPvGyfO4B
         72OyYK7nUyvF3B2XNGZpzD8/3BpG1QVn7jxnd9Gt8IqNLZPudxyBCU1T+QXwAetLqxTr
         NzzAfavKNzub76lJmQMWoYqsqUgdHCal48meGNURkPJfbi+/aSGlLQY9K9J/8Vj/SMJE
         QYgq37uv/VPsFUeDrRHznLOoWrWaWK8EcEhNY7xlEn6mJuA5wMZN8+4fzCQ6ELaUSEpG
         c7+dXjdqI/EGx3s/wCvltfJEEs1WjcnY92uLyBAxzQeJ7lg9KlIXnEDF+bYxnlaA1oba
         P4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUSroNY1+hz37ExChsIlI8PN92Agb1wSdEgELgUP2KyMXnZZ1hVOzFrw2csXX6s3LtofrYPHzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpvmLzh00hV0I7SLZoEfSHEPtadqWLrEcnCewNb/Zz9fDfjq04
	6QllV6hN4CmmUEuYCnQpw4c/yEyPmnO7H2eAYeOM8yO7IyAWmD6e4an0xvyVeTorggRfQsmAy6o
	jFGg24JSHgyVOEmBWCQ+RMv4QFzGOlxHFyI4uuyr8Tt/twRyWgJ7uVO2a2U4AwisQ0FQa
X-Gm-Gg: ASbGncscFK0DcZPOTlryo4Mdyd6KxOwDodHb/tOCs4RCYhLaQ0erljTlI0PTkm4ZJiq
	eucV+rwBM9DiurVl8DVY1shW9Xenz94zrkHRDj8g88tKVL8nU/8vVHenz36Dp1ezLkqHIyBLOfj
	W6w3D7yZfpjTjBg8dwoMj5F+B3tDM7Odw3U+ixgOIxSW5zin/q67BUF9lbYrVN9UQDXZpam+Yhv
	uzKXOBlQDKoY9dZ5TqQhenjzfeb1XsycVoS8GQEtcvsCba5mLL2/agDlcb7fORPVHZNe8E7ne7o
	Vn/XgtgStKqom/2QMQrUY9h73W6JqUrk0A/5M0l0u8ZKzQQMLOX7TLrdDRF9x3rSmlsKMLS6PFS
	40+Zw9So5lBc0TfVzxdb1JzJZHPXMnSINnIaSOEYUW1OUsVqBhe78OE19LmjiZewxIL4=
X-Received: by 2002:a05:600c:5247:b0:455:f59e:fdaa with SMTP id 5b1f17b1804b1-459f43a4749mr5556935e9.21.1754591481270;
        Thu, 07 Aug 2025 11:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlVUVzU01otc201eEZRdR02nVj3vIy+zsvwd5ZkfIQZ4SwnsMVJ+JmZ0EIACIPaQFKidS96g==
X-Received: by 2002:a05:600c:5247:b0:455:f59e:fdaa with SMTP id 5b1f17b1804b1-459f43a4749mr5556795e9.21.1754591480838;
        Thu, 07 Aug 2025 11:31:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f49:bc00:12fa:1681:c754:1630? (p200300d82f49bc0012fa1681c7541630.dip0.t-ipconnect.de. [2003:d8:2f49:bc00:12fa:1681:c754:1630])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533e6sm28362386f8f.35.2025.08.07.11.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 11:31:20 -0700 (PDT)
Message-ID: <d8e0f3b3-6ea7-492b-bb94-4f5d1ab28ef2@redhat.com>
Date: Thu, 7 Aug 2025 20:31:18 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm] f822a9a81a:
 stress-ng.bigheap.realloc_calls_per_sec 37.3% regression
To: Jann Horn <jannh@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 kernel test robot <oliver.sang@intel.com>, Dev Jain <dev.jain@arm.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>,
 Pedro Falcato <pfalcato@suse.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Bang Li <libang.li@antgroup.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, bibo mao <maobibo@loongson.cn>,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@kernel.org>,
 Lance Yang <ioworker0@gmail.com>, Liam Howlett <liam.howlett@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Shi <yang@os.amperecomputing.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <202508071609.4e743d7c-lkp@intel.com>
 <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
 <CAG48ez3=8f3eShjAe9hrvivP+Dvyisw=X_Tr_phc-OX_4MzeDw@mail.gmail.com>
 <be074809-e1fd-43a2-9396-8f7264532c4d@lucifer.local>
 <CAG48ez3=kLL4wBxAVSa2Ugrws+-RFQMdNY9jx5FAdbhpNt8fGg@mail.gmail.com>
 <e4f5faea-ccec-4cc7-83de-1a3c7013b81b@lucifer.local>
 <cbc2e23d-69ab-4820-9942-c7abf2066ff7@redhat.com>
 <CAG48ez1vM35DZ=kTSd4+ndgR6y33AodLLC2KbfbhGrkDaqdnNQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAG48ez1vM35DZ=kTSd4+ndgR6y33AodLLC2KbfbhGrkDaqdnNQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D5UOQitfb8R8ZNDgX8yvFQeRm8N4Wmg1-NYjG-ihGpw_1754591481
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.08.25 20:07, Jann Horn wrote:
> On Thu, Aug 7, 2025 at 8:02 PM David Hildenbrand <david@redhat.com> wrote:
>> Sure, we could use pte_batch_hint(), but I'm curious if x86 would also
>> benefit with larger folios (e.g., 64K, 128K) with this patch.
> 
> Where would you expect such a benefit to come from? This function is
> more or less a memcpy(), except it has to read PTEs with xchg(), write
> them atomically, and set softdirty flags. For x86, what the associated
> folios look like and whether the PTEs are contiguous shouldn't matter.
> 

Good point, I was assuming TLB flushing as well, but that doesn't really 
apply here because we are already batching that.

-- 
Cheers,

David / dhildenb


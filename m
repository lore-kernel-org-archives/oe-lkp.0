Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6525E473
	for <oe-lkp@lists.linux.dev>; Mon, 24 Mar 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817243; cv=none; b=istS0iZSqeEWFrD1vowYyIcOK2rDZSaVGkS8kJ8+CB03qUMAddyHrhbFKaDqDC6pJKiRVsENRSXh9vcRposc7xZGseBcJbzt5tmXahEa+N2jKQ01yp7jT9rEc9TaaKOV4el3YDfbuSKIEENIIBt4t9dZrLNOC0E7AYgCcP687zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817243; c=relaxed/simple;
	bh=f6PCMGxlR7PIv/WE7VQYyDd7YyTdYI1Uvqb6UHVthuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gywyibx5i4SKV+rI4pmj7RW3kCj0AhKlqQhcomo22O2x37z5NMCTDnZ553dX62pT9Er3BGp89hKKMqrQDzjpYVzbpRE1Pvp2GDQK/5hvrgzZztpzNOm9WuYyEwabJyRNEY0e1kr9rpPHosgwRquIS+/Gw8ksDfwzNqeWq6kJdwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XgXOwHC/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XgXOwHC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742817239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C2sfeu8L38fTcPcGuMWEFZogzyzrv4bdx0MHI8FDP0g=;
	b=XgXOwHC/YMotbYEuD8q8mbcW0t4kF2jqFHofySFA0QdY/RhjSw20SFHk2/zr0Tlk4D4CNi
	u7VC/aYREpUZn3ucNQkthmOCHrsRo9Tvm2prTQjp4+gYiiu0if2WWfxnCNXRHdRkL/AxKi
	Uk2gRXCQTyp9Q18UuJLWrP1I4ajGBSw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-J0hXbUXYNkuYbOil9fhE2A-1; Mon, 24 Mar 2025 07:53:58 -0400
X-MC-Unique: J0hXbUXYNkuYbOil9fhE2A-1
X-Mimecast-MFC-AGG-ID: J0hXbUXYNkuYbOil9fhE2A_1742817238
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768656f608so90743781cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 24 Mar 2025 04:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742817238; x=1743422038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2sfeu8L38fTcPcGuMWEFZogzyzrv4bdx0MHI8FDP0g=;
        b=kcJ7XMmYjknu8naqzvcmDTz42ygpBgtJVah4Xh+Z7p8UaaRrUHYlwhSOsRIiDVv2c1
         EMKp9HTLMfc8Kd6DBHP7zEbt2ufaBzW6ylKw0o6dzJO7URbQnk9dM25jc4tVoYwSPU8H
         TThCh++qWgvwPJt+RIlP55r8BIS5xk2Kl0SPgbEj4HHqIpG6dr9g+j8QQD5BRc6yo/dW
         zxMKY7/qSZMD55sm86r9n+kID+ZSeuqTId9A+M+87pulz9sBrNMQsgKjk7JeAvpwfZrx
         0usAyovBHpKUQv073BR9wfe7CqFkhCVbX80Gnl+pvNNZY/QdsoT1hulE7j4dUabb1sCM
         7U6A==
X-Gm-Message-State: AOJu0YzyXhgSVgeQhlQjeNBcsOptCfGXUt5Og9x72Ur+yUpmNQAfbmhr
	tOU5hYbTAt3OfDvQo+dLOXOi3uXYfiTqZ5jdp+hxiCI0geQ9X3QunhWtZvqWFj3IIROzN9GsBkS
	TAd2piYck75AblprDh2QsdjY6BLRwNlHXoidFSLKGjEECFulcSZsCsg==
X-Gm-Gg: ASbGncsGVgGddfhVd0n1zSX8VNBObMx9H4mkMiVYYO+7Y9AEQOjPrCsi5//l8HTSfBd
	c93sPFK+iTxi0FZTtFV4xcJRuTfhPZ+L6MWNZGJdsGy8H+LuMwSD7/N+qipSrvExTUHVVOb2v/d
	OsSKVc3Xf4Rdw1QimAWV7nERu73qZ9SKGbjHhh0nRLrIr4wkqNnwp7VPCDufarLRoVj/Z3ZCBnZ
	bCfrKDdZYar8+/bXdM33TmErjrVaz7bEU+bl7yAyPmBve988aXEAB2JKlKdFS6WV2l5HqcyvTLa
	WLY6wFE58ml3
X-Received: by 2002:a05:622a:1345:b0:477:1f59:2876 with SMTP id d75a77b69052e-4771f592a4dmr160265071cf.28.1742817238192;
        Mon, 24 Mar 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJX1ZUsULbp6GUHAiEzkOwnrqQhf5LhF8C61B07lJEt8sE2bo3aPiY2wZwMlVNZp1+6u1IWA==
X-Received: by 2002:a05:622a:1345:b0:477:1f59:2876 with SMTP id d75a77b69052e-4771f592a4dmr160264461cf.28.1742817237670;
        Mon, 24 Mar 2025 04:53:57 -0700 (PDT)
Received: from [172.20.3.205] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d176093sm46156621cf.19.2025.03.24.04.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 04:53:57 -0700 (PDT)
Message-ID: <73bea938-15a2-4b4a-8d31-0db9f9c476e0@redhat.com>
Date: Mon, 24 Mar 2025 12:53:55 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-stable] [mm] c25465eb76: ltp.swapon03.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Alistair Popple
 <apopple@nvidia.com>, Alex Shi <alexs@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, Karol Herbst <kherbst@redhat.com>,
 Liam Howlett <liam.howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Lyude <lyude@redhat.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 SeongJae Park <sj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Yanteng Si <si.yanteng@linux.dev>, Barry Song <v-songbaohua@oppo.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ltp@lists.linux.it
References: <202503241635.4c94156d-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202503241635.4c94156d-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2qcmoEEqgG7Yvm8fNL6QKAvi0r39YLss_7NDNuwAcnU_1742817238
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.03.25 09:49, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "ltp.swapon03.fail" on:
> 
> commit: c25465eb7630ffcadaab29c1010071512f8c9621 ("mm: use single SWP_DEVICE_EXCLUSIVE entry type")
> https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-stable
> 
> 
> in testcase: ltp
> version: ltp-x86_64-042eff32a-1_20250322
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: btrfs
> 	test: syscalls-04/swapon03
> 
> 
> 
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-12
> test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

LTP needs fixing.

tst_max_swapfiles() detects the number of supported swapfiles by parsing 
the kernel config, expecting that with CONFIG_DEVICE_PRIVATE we'd use 4 
on newer kernels.

Now it's "3", and consequently we support one more swapfile which the 
test cannot deal with (expecting a failure)

So, all good from a kernel perspective.

-- 
Cheers,

David / dhildenb


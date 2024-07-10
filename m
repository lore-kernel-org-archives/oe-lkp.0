Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23F19347B
	for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638160; cv=none; b=XiiJ4VItfYJk9EE8bMhHQWsEO+NOMH9FBJtvd6IkobOKAwusHM82HFC4NKnmUajjYrGJ2uU8hKTGuAnDNtb2pMKCYxNrfZ6//jzKv9XHyg6YlUJBm7SXFQtNhFP7RngY9hne5LBfnsjrzRICxOF03v5kLxC3atv86ahFDzkmP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638160; c=relaxed/simple;
	bh=PswQct0HzHiKHP29eqvg8c9/qemV3myFQvNJF13f+H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+4EvSKmGPs2vqk/9awPXi/hP2YVSQJZftYg93NDGWjGHrZkV/1pMkkhYOgytNckoBFfa+wqAgAYBHu4l9iE1He/KkkXm7iFSy2UO0UQmUcg6kOcR492SYFI4zn+AnljhvBwyn1HJ69BMvMZaR6bxOrk49vX6DeYTpa/IlnQyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki8UiFri; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ki8UiFri"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee920b0781so786971fa.1
        for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 12:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720638157; x=1721242957; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPZ60RuL6ih0QLl/o8/14hY+krd4EK1oz7htgw57d1A=;
        b=ki8UiFriiYFhqHZasrVQ9IQvUvQPEQLLvNnq/nY+lYypDwnlVh2x5aD4aYVPewSVut
         p4my0ubobiAhNM6zeHD4VxptXkosXY+Z6VYeWwLX7CFQMreaCOMYNfB6vPhvun5UAHox
         MexwClfZUMGQWYHf3uuybW6Q0IbEfSFSP8WeixaYCatWMwhvrpn4Yjl4iJVHjCVWcohK
         IUTmfM7esrUCioW1OCAgHzLermBZG9QYcT7o2EH4vhHLvVijtz3FjNGQH8TWT1bgxgnH
         dxoexMJW2D86+PviYjM8zJj+c/i9h6QfNmOJBO1RDNbQ0d4o2+4vw98tuFrSf1CefQrh
         hkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638157; x=1721242957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPZ60RuL6ih0QLl/o8/14hY+krd4EK1oz7htgw57d1A=;
        b=ULM1NcktraK2RSam2ptyZbZGd6ojPAtudwUJPF+bFn03WPmzXWHHshrEiJECD05m/N
         EZCyUI4nZw0s7lujYpzR3Kf+4XJ0IRZ9IXx/NBldeMFPAvalYaPS64MEYDgQsco3KPo6
         /pJZ4Q3IhUqoPSI75hjUiLFB1binu2cmuJqWT2/bUm6JTyA06j9tOf01s7gFhOw58o5D
         axYR6AhSOiU2g3nV02KT3ihXQFSrI8OeP1oYIU5uvwWTU8CiWgm0u7iQszeVdgFkHbA/
         QyF/RiQPqD5VfStuC1V+2DUcefwme0vFA1jOjjMpzEOxXiFsd3BLU+LvIoF+NjJXhTqW
         QMYw==
X-Forwarded-Encrypted: i=1; AJvYcCVTpOfguZTSgAKP61GzrSi3bkpC2aOGo6yDp/Cm8lZ+3xBnzze0H1587iaqgKXz4pILD2tf0r7hvh+7N/nf3XSdru1rLFXT
X-Gm-Message-State: AOJu0YzGVfM+XNT1bPzYg44GNX6dNrCp1l2flT8p8c9MfmvYbhe5nvnp
	COt0iMzTl0yWXuR7DbsmqXyzsBHmy88+Ax+zxnwNkDbeIoOCA0uI
X-Google-Smtp-Source: AGHT+IG1L8BlhXFrRo5w/hZ2v8OTkzJw0dc162nd8YCUmtKMgy4icMkIxWKQCufiuhXBIwUNvFBW+Q==
X-Received: by 2002:a2e:80cd:0:b0:2ee:974c:596f with SMTP id 38308e7fff4ca-2eeb30feba0mr38435041fa.28.1720638156546;
        Wed, 10 Jul 2024 12:02:36 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1490:6cc2:4d06:940f? ([2a01:4b00:b211:ad00:1490:6cc2:4d06:940f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426615876bbsm178014455e9.6.2024.07.10.12.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 12:02:36 -0700 (PDT)
Message-ID: <2fe63ea9-613a-4904-8b68-134442c43261@gmail.com>
Date: Wed, 10 Jul 2024 20:02:35 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 47325a5c88:
 WARNING:at_mm/slub.c:#free_large_kmalloc
To: Hugh Dickins <hughd@google.com>
Cc: kernel test robot <oliver.sang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it
References: <202407101031.c6c3c651-lkp@intel.com>
 <dd08adbb-6df5-4556-9fc4-cf37b6234aa1@gmail.com>
 <053bd429-ae19-4beb-a733-a7a838b1e010@gmail.com>
 <4bc6400e-6199-4147-9399-4a54c94613fd@gmail.com>
 <612af749-0a59-f91d-693a-43d6217ffebb@google.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <612af749-0a59-f91d-693a-43d6217ffebb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/07/2024 21:49, Hugh Dickins wrote:
> It's a long time since I was active hereabouts, but the bot report
> and your flurry of updates make me think that you should step back,
> slow down, and look more carefully at the precedents here.
> 
> IIRC, the main problem is that parts of the swap_info_struct can
> still be in use from before while you're wanting to set up new values.
> Observe how alloc_swap_info() may return a fresh or an old allocation.
> Observe how enable_swap_info() is called after getting swapon_mutex
> late in swapon(), once past all possiblities of error.
> 
> I expect that your new zeromap needs to be taking the same care as is
> taken with swap_map and cluster_info: to be safe, follow their example
> in both swapon() and swapoff().
> 
> Hugh

Thanks, yeah sent too many in quick succession :). Will be more careful next time.

Both the 2nd and 3rd version are careful to solve the problem of using old allocation
which you described.

The 2nd one takes care of it in the same way as swap_map.

But I believe its unnecessary to do all that change in the 2nd version, when you can just
set it to NULL after kvfree, which is a much smaller change and takes care of reusing old
allocation equally well.

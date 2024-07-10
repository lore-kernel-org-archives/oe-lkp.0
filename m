Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABEE5028C
	for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720637363; cv=none; b=nDXMyJNeEFbEsg8W4Kot698wjcS9D4Z6LhN8sLR9EUU7nkvDM1+wLakZbJyt/nJFoeuDMYpyiiGD91CIyB6SC0NJOoalajEXWOPgFGItsUSzXztFxKewv54+jvnohk3xp2WR8wENnsLEjtUiZCgmwFjg4q/BvsAshzBIov5mBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720637363; c=relaxed/simple;
	bh=CDzDoDBPrI9O45fu4nDGF7EewD4QPEbaHsgpGnRS9bA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=naUfXVECZjMO+qefxwLE+l4T/QpuqOscMaKIK0Z74TtP9YQxYGE3qIfKmic9Nvzfuz3hG4iMSgDRpvHh/HPLys9szX0cd3B9Hsuk0aDLagE4/dTe8CI/+gzdizzvR/zunAcUtDsDfakr+k1/qcOsIbU68a4QwvcAXqjcNuWmlFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QO7k0s1q; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QO7k0s1q"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25e43dda1edso90657fac.0
        for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720637360; x=1721242160; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDzDoDBPrI9O45fu4nDGF7EewD4QPEbaHsgpGnRS9bA=;
        b=QO7k0s1q5EchXqHwweAxMQD69Xb7oPntVtdqf4uYg/b0ciUP1LhEWIFLxS9wuZIw1H
         DIP3uMUQXSWQe2m2lWibp7DEGtsNLWoY/WzIJCqyRxEIzco+nmrazYFPAC6302Vq58+J
         gJIGNY4GsWRuyiXfSzckMB7LnPpi84fJuQLAqiB+sNJCIsVDy/LOFMV3VTNB4HU7NQ+F
         3rfFrs8i7QYIOF6rUubef9FeQwJIyHsw7GxZmJQZfc34v9ZA9No+/5ARIlsyAZSi07xb
         J/sZ7Vhd9gLVO6n9+yuVzg45WptNljpPdxKKUS5Pcjr07C4LCwytdpPHVPkxPTazjD0Y
         /svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720637360; x=1721242160;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDzDoDBPrI9O45fu4nDGF7EewD4QPEbaHsgpGnRS9bA=;
        b=rjszgUscvGu8HadC/Fv5Q7Da0h1X6f0EpcHbSby5C89QZndQgz7grk5dkUf/Lrcx+l
         hWawTrErESpxOWNLK0NLc+PwjtsZwibrccvtJSbphobMVsn19zUVAg8tycchg/uuZIZm
         LvPjEjTBdUit92HA+zaKJBJLVAvfeRIjgXxAFm6G29MOBQrlU0+3puvG2eg+pqvLmM0u
         geB+4yxaHZOd9zU2XRBc0yPWOA9IWNstV1EuGKp+VcozpMiOLmar+X9rQhemFRssIf/z
         l6cBg9uYnC345dcmjWfQT9RYrh7TpEWWaVes2LPjEAvXmxngLaoQI/+gKCrvoU/kkXXW
         0AFg==
X-Forwarded-Encrypted: i=1; AJvYcCXEMzsTX5qqiWrxRpsQgfla0lDE3zO6MCbdefYK8rjFI0xhy64jpXazrzI51FfsygOm6kNKqPviYw6XnCn7fVmoT44bQKVP
X-Gm-Message-State: AOJu0Yy0sCqJhZjkXh9Qs9Nv0P/1spNgWhqNYYwG/KaMXiBh8y23HOa8
	VUJjKhzBLoh3Y6kYUBCmC5KNCTUgchD8gC067kvdyv0mZHeOxtSFU89iynFSPA==
X-Google-Smtp-Source: AGHT+IGpNu9mEuoMmeAlVedGx8Nyw0EmBMtvokuZhBygl5S2JzWgS4Wea6kyWyOlMeLcWyY/SXZaig==
X-Received: by 2002:a05:6870:71c4:b0:254:d147:f256 with SMTP id 586e51a60fabf-25eae749f6dmr5489335fac.8.1720637360470;
        Wed, 10 Jul 2024 11:49:20 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa078407sm1336933fac.27.2024.07.10.11.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 11:49:19 -0700 (PDT)
Date: Wed, 10 Jul 2024 11:49:09 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Usama Arif <usamaarif642@gmail.com>
cc: kernel test robot <oliver.sang@intel.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Johannes Weiner <hannes@cmpxchg.org>, oe-lkp@lists.linux.dev, 
    lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
    Chengming Zhou <chengming.zhou@linux.dev>, 
    Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>, 
    David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, 
    Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>, 
    linux-kernel@vger.kernel.org, ltp@lists.linux.it
Subject: Re: [linux-next:master] [mm] 47325a5c88:
 WARNING:at_mm/slub.c:#free_large_kmalloc
In-Reply-To: <4bc6400e-6199-4147-9399-4a54c94613fd@gmail.com>
Message-ID: <612af749-0a59-f91d-693a-43d6217ffebb@google.com>
References: <202407101031.c6c3c651-lkp@intel.com> <dd08adbb-6df5-4556-9fc4-cf37b6234aa1@gmail.com> <053bd429-ae19-4beb-a733-a7a838b1e010@gmail.com> <4bc6400e-6199-4147-9399-4a54c94613fd@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

It's a long time since I was active hereabouts, but the bot report
and your flurry of updates make me think that you should step back,
slow down, and look more carefully at the precedents here.

IIRC, the main problem is that parts of the swap_info_struct can
still be in use from before while you're wanting to set up new values.
Observe how alloc_swap_info() may return a fresh or an old allocation.
Observe how enable_swap_info() is called after getting swapon_mutex
late in swapon(), once past all possiblities of error.

I expect that your new zeromap needs to be taking the same care as is
taken with swap_map and cluster_info: to be safe, follow their example
in both swapon() and swapoff().

Hugh

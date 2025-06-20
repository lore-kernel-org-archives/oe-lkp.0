Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C667C8FE
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 02:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385665; cv=none; b=tWiFU15u7rb0n3TKyzaqny9n2uG/hcZb/mDYxSb1P46Z39CzLUG4EwtNMAGLMrvZCXXlpekGzV+uOE6fcaz1EGhMuastDg+nduzn/m549wzykQTpJgLWTbU05Bl/WUALSAdMSQIsMNvd1jxilgBYQHa2otIe8P9zih1S7XGi3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385665; c=relaxed/simple;
	bh=++ra03kqCBDXVbYrROmsXJTd8pBTYSdEsS5DG6/5ikE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZZ1ABUCgpg8YcHETAtc8ENMwptlhnLlhDKLn4M146CeUuFQEmBIiE5KgSyxqgLZGd4OdfWlnbDRVZ5h+/7VxQLKPp2v6BU/r7k1AL6pL9IejVxFBBhuzgXfrArMvEcoDnL1hpj6+LoETMf7iMhl0QWduedziXTK1+woCfeAmLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fu1XhhhK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu1XhhhK"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso255961366b.3
        for <oe-lkp@lists.linux.dev>; Thu, 19 Jun 2025 19:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750385662; x=1750990462; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEIhfxXJ4mKmJo/0kctFLR+8uENtUACzQhaNn55bks4=;
        b=Fu1XhhhKsOc7dCbgX8L88QHWCQL7TFipPZW1/fPMrL84xlHFWdVmggNVd0cwR83sY6
         Z5j26mjgEyXFjXQZ5vv9wG8IF40LojkwsK/BrsU0ZvZmp1M/k/1bTqANgvgTCs7UZyuu
         CBf//o4cPnUv04QvSKVKC+MaTsaeelf9lQjeX0KyVBF1OLgfEi9PtOFwHJIePkA9fsEA
         7p4oXkavZXXNuljZzt/T1yNQBNY/yCHmZ1c/R1xpKfXbxpHzHrcdiNApNEbKpFGR4hs9
         ZESsTdrkxuxbFwK++h3iJ+tHPdZEtzBsn8d/xp2JtRPsDKC/3n/aofEATruOprG/EMtq
         wWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750385662; x=1750990462;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lEIhfxXJ4mKmJo/0kctFLR+8uENtUACzQhaNn55bks4=;
        b=DMyH8C3abStXki9+0mI73OR2pbuGB8WzKp0Sy2XTrnEARWv+DIhPrwLs2dxvMZX+lc
         j6iq6ip5+ATm54EISP7/CgKJb+x3lIZai8zotZFzalQFKI37UCPdpq2GY4XZLVHm1cgm
         Xg7Gys9m+ErIten5kCv9tF/rXc3HO/Chk5QUyLKAs0UNtDhKhAV9meYmR1CfIPpCXOIX
         S3cDRmbom2VFmXYzKFmf5ElMPpiWRtOU09tYHwse7LZaVHq315g+2khZ+vO8K6xuvuWS
         WUAgHXPiMsr0N8elJAUL/tSBhGBofKdRJ4l8lAlQhpPEUi1lvdkmjBaDcHMrkCjyyb7u
         6dmw==
X-Forwarded-Encrypted: i=1; AJvYcCWCsxHVBxMzoqy0PI4PKoFpY45xPAxszxiQjeH6LkZJzEHscojHgm6RigJBt6eCTbfX7yAS7hI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEjxvrhzfgK6GpD5XeNnkFQw3BEO4yQkDjUdoEGbVz3yjz69Rj
	/wshpQEGAD93Rd+FlttmrKlohrDwL6YJgXwgL2CSc8IygiFQwmnuaeeK
X-Gm-Gg: ASbGncvSqCgQaNjAVrleDFuYJ74Co5kDinG9evAvalvK8/Qfi8oRtECjaUc1xiMnXUf
	4GtwehHEhLYShfZpJpDxjfGBxQnyhZnvY1nQSgUk3bz92eXOSL09TRKVpCXEpS72UtBj0FuwkZu
	RM16dNj4B2HiQe7w3vBb7tVPrxMaEwB0yimivutyV83JwycKJtQPNZ0NRIxbCa0BaKOsAikdCDH
	B0/bXsplLOC2+3DvzI/Yipd6onlokd9//U7OIy9JLSFdmTRxosNcrcPvDg9l4dOBveE0BVURMHE
	CLvG7w1FYP1I1/7DAraX4hlrGjnO3IxT7NRm0qZZBO4N2H6xYfjlCFw8A/+xzYQwgtqs6g4H
X-Google-Smtp-Source: AGHT+IEajYSmfm6+sTAO05W2RF67E4/SY7yYteVk+jnAzCNEgdFMvxNCdSZPTnS8jXIdNlXGMDA1HQ==
X-Received: by 2002:a17:907:ea7:b0:adf:d157:4331 with SMTP id a640c23a62f3a-ae057bc80e1mr96216866b.44.1750385661683;
        Thu, 19 Jun 2025 19:14:21 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504ef4sm684042a12.15.2025.06.19.19.14.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 19:14:21 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:14:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Wei Yang <richard.weiyang@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [linux-next:master] [maple_tree]  540335e987:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <20250620021420.7rgehvgrveyagqdd@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202506191556.6bfc7b93-lkp@intel.com>
 <20250619154446.e9543f52bbc47e4bbd2cec29@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619154446.e9543f52bbc47e4bbd2cec29@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jun 19, 2025 at 03:44:46PM -0700, Andrew Morton wrote:
>On Thu, 19 Jun 2025 15:32:12 +0800 kernel test robot <oliver.sang@intel.com> wrote:
>
>> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
>> 
>> commit: 540335e9878005bf238ab4e1f91e8df0e3091a03 ("maple_tree: restart walk on correct status")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>> 
>> [test failed on linux-next/master 6e5ab6fee68df8c40b338baeae6e269fa25a7e25]
>> 
>> ...
>>
>> [ 85.008687][ T5293] RIP: 0010:mtree_range_walk (lib/maple_tree.c:2773) 
>
>Seems this is
>
>		if (pivots[0] >= mas->index) {
>
>It seems odd that mtree_range_walk() doesn't (and didn't) check for
>ma_pivots() returning NULL.
>
>Oh well, thanks, the report is solid - I'll drop the series.

Sorry for the trouble. It is better to drop it.

-- 
Wei Yang
Help you, Help me

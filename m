Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D85310629
	for <oe-lkp@lists.linux.dev>; Wed, 17 Dec 2025 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972391; cv=none; b=bcB9HO2RjX4su7iX8i//dulLJx1D+lZUX3VrUBPbu9CxFyVz2VNBoeJz0F4Ei3iC124hqWzIqPEdWsPqw7JU14+Xt4EXyz4MrThlIDC30fwqqluvwxxNUmkBuZTC2io2ltFrW5E77VrkzgqpAvz84YuIVAkIAGfuce1Ro34d9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972391; c=relaxed/simple;
	bh=x98IMU/Hs8rURZmGWe6qHj5o5wjDGNendmkGvxGA0U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BefgOWxp03zoI3Gu1zPiAlJANakQL+IqI28BaEauenDJJJ1bIMYJYatPruJn7MC2JAUV9NrqtBWwuWDAL9gWba1RdleHHTEiesWz4tf71V+DOe+gXwKQRzI9oGJW4ScM4RxWs4tB7uY5wh2kDjHZ5D18L8VAZkaQqE8tOuU92Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwyMOQ7d; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwyMOQ7d"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b73161849e1so1325932766b.2
        for <oe-lkp@lists.linux.dev>; Wed, 17 Dec 2025 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765972388; x=1766577188; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oliDIUiEaAM81fXPI/jGxdfC+4cPbCHWAn9+NEqY32c=;
        b=VwyMOQ7d8T+Cy/M78NVQs3RynJCI04n8qmQKslitoft+zWWQqGzEfuNHh4ypLlxf/r
         d1j6GPSBuhXymrwWrKOvnQP7VaYFNnqbR/HFDmfl2Fa3SKgDr+r95phn8hff5/YD3eoC
         2hrkphTVcZh6x7zusx91F+0jL84560FpUH6XE+AMhw18r+u5pzj4nLsjBM//cUQW/ZNG
         SvAIoRSMW1En1IMSzFwzH/h2vgjYsX/UQdYhnvOMkQ3NVJe1W33JAoaEt+wNJMcLG6c+
         Uz9LCBP/IVcrkBnFxsbt4vgI86kEC1aUtbIHXHu3XQM/vsUUPXP/HsJtM5/bY05ULJ9X
         9X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972388; x=1766577188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oliDIUiEaAM81fXPI/jGxdfC+4cPbCHWAn9+NEqY32c=;
        b=SXkHS1CuGOZ28dYJds0PcIkLjW2rE29/KNvlPLghCZKkYTdQrqI7XEOVWh6yucBzJz
         l2PMalk9wAXhwU2aTMbXz60okiqcabsN5xd7P80WspqLRTgOzeMfDsKAEJ0zxcv7/Ppb
         /Bf06LfYjDyiA3SRs7SMZjjGrQdLgj5kLDQOwAA0/EgCTmbQD6paJ4BtWWBgL2hhex5+
         4ymNyOoTIH6ArPOkigYXOptTX50zTBCeLyjytQJA/8UdhZsHZhZ3oW5HTzRxl7oastHi
         icCIAv/+8gNdSFRpw630bc4Wsz2b4V6IPB0/14gM6BA0v9EOldIbK8hQ/DIdedP4DHBn
         5yJw==
X-Forwarded-Encrypted: i=1; AJvYcCVoJ77/Zf3WAnhsnAYfEzFtU2jRmqzrmIghg8bvYEumcnzP1ywZUa3LCXHiJKdoXTKw8C72tiM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qG1YLC+5DikXVa8UVVQ855tUaeBo1rTS/wLpOuW2h1gUENrR
	HB6kdRnePODP1QNMY7gJYNcoJDkk4RFcFr4rok3ONWhoe53KRDkVk2ht
X-Gm-Gg: AY/fxX5KEUZBXdAHJlSnHe9/BFkARDw/NV3dW7PBa2A4ayMMXVzPj/fQf493Xo1FQnj
	szZx/ByzIZYbXeCr5k/t1MFsKtwRdIaNtwpONVg0Y6gghlyX/QC/p/fQTTyj3j9tLmP7LMwPFdH
	stAwl6Qo+N0s43Hdc/THINzCjS0Wq9+kXARc+CJBDLUao4mDjtHk8q4DUwcBFTCkSW0SQ3nYszg
	GETSyadq3x13QyMnpjxe2WmQCYcIfCvQFf2CRGi/4s6cSZRoj+pnel0Mm5xmiSMUDh624GJgjAL
	F6H+54nwTWA4c7bFUIDa8JJTs1Dj6lsgrH66/5yyJN5WN1Q2P9vSyJMU548DSI1gD5rzRBWLTdu
	tMOarKXtS8XvGdxtxc1ZprHastL0vs5ujwlkC8w0KCh7FcqZ0w9nHlilVpy4ExaGwNPfllS+/Xq
	znFpCsnS7byo6o1xpB0X4hP+VEo3nodaNpy8tF5xdiBpGvh1SEOAmWPbcHXwmZG05kawAZuQ==
X-Google-Smtp-Source: AGHT+IHRKWPWVx0T5T2V5i4he1Sc1dU48282q7ThJX1s1zq7LXBYN6/i0oWEP8PfTNAxBdnlUdN2/w==
X-Received: by 2002:a17:907:6e9f:b0:b73:79e9:7d3b with SMTP id a640c23a62f3a-b7d236637d3mr1852932266b.25.1765972387802;
        Wed, 17 Dec 2025 03:53:07 -0800 (PST)
Received: from f (cst-prg-23-145.cust.vodafone.cz. [46.135.23.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff7e5e79esm429244666b.46.2025.12.17.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:53:07 -0800 (PST)
Date: Wed, 17 Dec 2025 12:52:55 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  9c47753167:
 stress-ng.bigheap.realloc_calls_per_sec 21.3% regression
Message-ID: <e4b6sjeh22uqhxhxudsbanlnyo2potwowuy7mkrp6tvxnftjn4@mcjyes2s3eu6>
References: <202512121138.986f6a6b-lkp@intel.com>
 <aT_8woTbtklin3Bh@milan>
 <aUI/MZ8sGDt8toOC@xsang-OptiPlex-9020>
 <aUKONAP3CZn1kZw6@milan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUKONAP3CZn1kZw6@milan>

On Wed, Dec 17, 2025 at 12:04:20PM +0100, Uladzislau Rezki wrote:
> Hello, Oliver.
> 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed a 21.3% regression of stress-ng.bigheap.realloc_calls_per_sec on:
> > > > 
> > > > 
> > > > commit: 9c47753167a6a585d0305663c6912f042e131c2d ("mm/vmalloc: defer freeing partly initialized vm_struct")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > > 
> > > > [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]
> > > > [still regression on linux-next/master 008d3547aae5bc86fac3eda317489169c3fda112]
> > > > 
> > > > testcase: stress-ng
> > > > config: x86_64-rhel-9.4
> > > > compiler: gcc-14
> > > > test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
> > > > parameters:
> > > > 
> > > > 	nr_threads: 100%
> > > > 	testtime: 60s
> > > > 	test: bigheap
> > > > 	cpufreq_governor: performance
> > > > 
> > > > 
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202512121138.986f6a6b-lkp@intel.com
> > > > 
> > > > 
> > 
> > [...]
> > 
> > > > 
> > > Could you please test below patch and confirm if it solves regression:
> > 
> > we directly apply the patch upon 9c47753167, so our test branch looks like below
> > 
> > * f7991e8a0136cb <---- below patch from you
> > * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> > * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()
> > 
> > but found it has little performance impacts
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> >   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/bigheap/stress-ng/60s
> > 
> > 86e968d8ca6dc823 9c47753167a6a585d0305663c69 f7991e8a0136cb0fdf35f11e28a
> > ---------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \
> >   48320196           -10.9%   43072080           -10.8%   43116499        stress-ng.bigheap.ops
> >     785159            -9.8%     708390            -9.7%     708644        stress-ng.bigheap.ops_per_sec
> >     879805           -21.3%     692805           -20.7%     697312        stress-ng.bigheap.realloc_calls_per_sec
> > 
> Thank you for testing. I had same expectations. No difference.
> Honestly i can not figure out how: 
> 
> * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()
> 
> can effect performance. I am not doing anything related to performance.
> I would like to ask you if you could test one more thing. I see that
> 
> [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]
> 
> contains also below patch:
> 
> <snip>
> commit a0615780439938e8e61343f1f92a4c54a71dc6a5
>     mm/vmalloc: request large order pages from buddy allocator
> <snip>
> 
> where we try to use larger order for vmalloc. Could you please revert
> it and rerun same tests?
> 

This being stress-ng it is not doing what you think it is doing.

Profile shows increased contention on swapinfo spinlock:

        %stddev     %change         %stddev
             \          |                \
     40.08 ±  2%      +9.8       49.92 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.si_swapinfo.do_sysinfo.__do_sys_sysinfo

The spinlock and the data it operates on are not annotated.

The commit deferring freeing adds 2 global vars which most likely
shifted things around to add cacheline bouncing.

That's a 3rd case in last few weeks that I know of.

I asked gcc people to do osmething about it, so far no takers:  https://gcc.gnu.org/pipermail/gcc/2024-October/245004.html

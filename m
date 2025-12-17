Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C8033A6E5
	for <oe-lkp@lists.linux.dev>; Wed, 17 Dec 2025 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969466; cv=none; b=C89OVgyz4pPlMJ02/k5SSviXk7ym5DAJTwixFvPh6fXrlnoQyUTCEjXncNxdWV54mAj+UdfQVpxezCn3SJ/G95byGEOb/VW3ueC70wclDi/GhkurKf90J3y7b2l7gLtlHYTwOztvAXlzIna8Jd+UhP+2tdODTCLG1TMdfufSJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969466; c=relaxed/simple;
	bh=+iHaZH06PU8izeB20r56aXoXFpd104S3KfM0bBnQims=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROwSUpmnvNd8dQO6IzDBj4hnCIUTd9igsNAxR4Z0DJsVLx4EMgsXp1u3t5DhIdOQD5XcF2jkdX1tNZwjoJzKEUR84AnC0s2zmtpd2l7IpsnvOGGTPA9yZbA3yQMMPS7HACPMV1MVfODS2wZXFssSNC6JO7To6DLRHKFFsXhJ7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2mG7uRl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2mG7uRl"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59581e32163so6544240e87.1
        for <oe-lkp@lists.linux.dev>; Wed, 17 Dec 2025 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765969463; x=1766574263; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=co5bqN6kREXERHH8TrrKVTVAstb5nlivTIfAC6X/KgY=;
        b=D2mG7uRl+o8NsngweZmgn+6V1HmcdCMIUXQr0CMvvi5e0M8bYJAley2NyiVFeGntZq
         6KwZYIF2ngRm3R1rdaP9E66hP35NJZQHCUSTA65JMNwWea5PQ4FJvjPgog4O3gjUpMon
         B9oxrSgYUU3wFWax5Qk5CwVFX6EFHbGtSfDjjByY+Kgg82ztb50KsLjonbiN+TMgf0LI
         oweIx/3FtpQpZ9APj5gAcGUQPNIAM8J00yyTm2LVcQKMZREPfBxbMbJ5DlKVFVo/c+QC
         270bvxHOAyv23ym+SuaqDVTcGFa/0T+qpVpklq7nrt1qiyCD9FcHXSg6u/R1YS6n9fdF
         BpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969463; x=1766574263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=co5bqN6kREXERHH8TrrKVTVAstb5nlivTIfAC6X/KgY=;
        b=afWXb/whCcMKJx4wRUEeHQ2RCPzt0xDhvVj4KAbwIURFSl7x+iEE0HI4UhprklFcon
         JYVtKDRieMF4ubYQi9na0wcab41tOYkeQpzj9uMOKGC/BGwcGV6TVMLBv9On8OODLkrj
         lzRAJlpZ1InSsUBua9+L/7zuhgSE8slwk1hgi5Tu4eYWlBTr+umouYKDyRWOAn984KlJ
         L1YyBd1DZNiM+FnXHj3gv63yLSsmar6zGJKnBzHG57jI+O5LD51oILSdNupVDYnzKXi3
         NLmK05oe1gnJc5pu+xEaPdPFjJuqUBp9k+czozxvTMM9yq6BlOYjPkuTs/vHYVl8CnmP
         AA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWWbB0bcyWJ1xRoK0YBNryJtQE4Z59aW76wq28sCFWRak1Ygj9ALCiFAhc3rvKTr4GEs2HAc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhVx/4zoSvkj7LUWXxOwpZFtP/74++ZvsvN1Pba+/MXwx2GM6s
	cBSVdpwc7rfwXlD++EfKT7QKUIkvvTW5hjffPl3+yCGkVtZVlvKbY+Kw
X-Gm-Gg: AY/fxX50mJYeXEg1XTISQlmriZ3gggAuOfJhzM6Ch3lKIxFeNhxUrlR4iVhuGA+56uD
	LYKa+P9YXofhHu/jXzBTFHlARbvs0VFEOyIg9GgGhTCB8JtqX7KA7CGqPaqo6pgN8mlxNeE+Fsi
	dFNcmy7ObqhT+A+bamJRsDzuXH4Yk56hOQxFObmzB7LOcvoFrgmfz6hwevdb1UicCgOwTFkPLrI
	kpqGK6fleSNc20CjPcOTZwt4sdarsSlDImF6TKgLRZZXW3bao8nIoiFfphADwjgH6yExIxlthlb
	rPqlY0m6F20HCDLczQJETFuZrp1gFSJUchHPtNOzNGKJtcbscWv9wZEu7hdGK0FKUXsIsWxEdM/
	BbBA+utE1KLhg7zWQbRdFWUOm7Qaf4YRLreh4eOwgJ01ifhXwyMy+qsfDSqFAlxw=
X-Google-Smtp-Source: AGHT+IGwmBTrcaUkgLgTqFamHpZt37FpUgqWXiF0Z9Bu9X6OCslunvuq7V7Di81hDIqdtVK1vASruQ==
X-Received: by 2002:a05:6512:3da3:b0:594:2dbb:723a with SMTP id 2adb3069b0e04-598faa886f3mr6420599e87.39.1765969462791;
        Wed, 17 Dec 2025 03:04:22 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da78be6sm2290460e87.98.2025.12.17.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:04:22 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 17 Dec 2025 12:04:20 +0100
To: Oliver Sang <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  9c47753167:
 stress-ng.bigheap.realloc_calls_per_sec 21.3% regression
Message-ID: <aUKONAP3CZn1kZw6@milan>
References: <202512121138.986f6a6b-lkp@intel.com>
 <aT_8woTbtklin3Bh@milan>
 <aUI/MZ8sGDt8toOC@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUI/MZ8sGDt8toOC@xsang-OptiPlex-9020>

Hello, Oliver.

> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed a 21.3% regression of stress-ng.bigheap.realloc_calls_per_sec on:
> > > 
> > > 
> > > commit: 9c47753167a6a585d0305663c6912f042e131c2d ("mm/vmalloc: defer freeing partly initialized vm_struct")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > 
> > > [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]
> > > [still regression on linux-next/master 008d3547aae5bc86fac3eda317489169c3fda112]
> > > 
> > > testcase: stress-ng
> > > config: x86_64-rhel-9.4
> > > compiler: gcc-14
> > > test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
> > > parameters:
> > > 
> > > 	nr_threads: 100%
> > > 	testtime: 60s
> > > 	test: bigheap
> > > 	cpufreq_governor: performance
> > > 
> > > 
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202512121138.986f6a6b-lkp@intel.com
> > > 
> > > 
> 
> [...]
> 
> > > 
> > Could you please test below patch and confirm if it solves regression:
> 
> we directly apply the patch upon 9c47753167, so our test branch looks like below
> 
> * f7991e8a0136cb <---- below patch from you
> * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()
> 
> but found it has little performance impacts
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/bigheap/stress-ng/60s
> 
> 86e968d8ca6dc823 9c47753167a6a585d0305663c69 f7991e8a0136cb0fdf35f11e28a
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>   48320196           -10.9%   43072080           -10.8%   43116499        stress-ng.bigheap.ops
>     785159            -9.8%     708390            -9.7%     708644        stress-ng.bigheap.ops_per_sec
>     879805           -21.3%     692805           -20.7%     697312        stress-ng.bigheap.realloc_calls_per_sec
> 
Thank you for testing. I had same expectations. No difference.
Honestly i can not figure out how: 

* 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
* 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()

can effect performance. I am not doing anything related to performance.
I would like to ask you if you could test one more thing. I see that

[still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]

contains also below patch:

<snip>
commit a0615780439938e8e61343f1f92a4c54a71dc6a5
    mm/vmalloc: request large order pages from buddy allocator
<snip>

where we try to use larger order for vmalloc. Could you please revert
it and rerun same tests?

Thank you in advance!

--
Uladzislau Rezki

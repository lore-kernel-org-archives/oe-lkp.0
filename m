Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477591E5205
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741625575; cv=none; b=avjd6LYoO7XfXBEHipBwlBSBwolHj1Z3r6FewFDYNxiQnmoAhgTkxQ56LCplBx6p97KwGbF8BxSoYT/rREiYx1enjPy68wtFtDlGK67Nkpc9yVC0cFDTlkofmyPD2hkC5M9RWhHEC35MMg9smjZn2VZWjPqgck1JLI8QLWw5WBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741625575; c=relaxed/simple;
	bh=CygB72uhgizYQcfIG8TCjeocqHUtVM2PHCsjIL1FXIo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bot4Sa3oMeXvD/QMN7EfBRhJ0jgr3Nmxci7nonD8rjpZqABmXheN8a7/PRE6w2wEZ1XcpQ/r5BfMPlNYx+OiG7zT7vh8B4+1SYrIQrOeO429/MDeiTpvrwKm5mN6MaAuzns09HpNJ27ZnWNxd9GADjk8YKJn+1SYixcpOUiy9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX/YDtvD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX/YDtvD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54963160818so5227723e87.2
        for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 09:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741625571; x=1742230371; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hqzm3YDh0Dmu4WiyshUyFvmRxt/1G3zatmGG/ppP4I=;
        b=WX/YDtvD7w0EU4C5a7hj2WrL+oxAeqXuRj2+j3gkokUeNC4ofbDsil8TmHqBmVz6nD
         F0vbxJarCoIKptMwEhbmK3CXkz0BXMLH8Pq883r7vvwv2e9FV96Q/iA3Vqu1IftLtauM
         YYB6HMx5HtRV+37QWoi/K6CSwMCgHCV573sVFvuBVQS81f0fGbx+CDN69RnTt7y5sI1M
         XmOzjkdrZKvgFzw+Ax61TmHS13SPbFk7JaCqKrc5zhS70amB2OtWIdwGGR8MLDJYGU1t
         hipliqNC9laQbZIozUBQBdJsgXqK1x2sWOEKIbOLRWvMm7t884q6uOWq5nvVZioqcPjb
         59PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741625571; x=1742230371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Hqzm3YDh0Dmu4WiyshUyFvmRxt/1G3zatmGG/ppP4I=;
        b=IMYp37GL7zXzHPT5ehFuWFzMIYwDQo95bzct8R7WkRn7g9fdwMzhczX5kOGC/PlToH
         +u9OoUjrdxGbDU4f5BKYZVbtc76iO6XQYlFGhooIghTAusm9HXIoXw2G1bsZCKVbiiDF
         aZLp1AC3z7Q1f6DNMZMBo7urBKT+VUV2YYWxpb2scog72B9BfepcEpD7IGuXNG7QujYf
         uZhQqAdpblszBD9QUfuGukt2NTbh016TfubmjtDCiwjBeJJCdvhe5SPtvJIfarUsoyWC
         ww4jKte6asdzQRBFuc8qJY9CAie7AjRH3EhMCgJncyb3fjNLtshei2iXZgZaJH0fOZe5
         UF5A==
X-Gm-Message-State: AOJu0YxYGKhpv1KpFoY2ReuRBvx7p6pnII7gl1KpWG2JZu47D4th7S19
	Z/AXxO+BSynuvKNlSBHtmsjLDS2JgnMLvwGYyjasdEx32p5qONmVZ/hr4Q==
X-Gm-Gg: ASbGncuek5DEUOk09zRUX7mzIE1hMWaA9vbsg85pFdHGFpAQ+nbIQE0Prq0KtDyNqIc
	NiPKAVuUcuK54K7j4awMdtD7+G4UFNQ4ATXJxcm24Z5kNOS1+P71d3agjgWAiqNf6pGlc7BfkiZ
	0xYaL7OKhzxR34RipXCXtPzWBvtCKQ4Ea9IDSXSkPJ45VNK8bIDEXomTEtR+N5pSX1NU9LIGIyO
	AmWCyhhHIYA72VeX3wivObOXbAoK6Otx2cjjpgW/Z/x5nxZNbD75k3msdSWQo/bInjHrSqNSsZK
	WsbYDNI7oNT8hLd3RhAodIFh1vAqpckKyOD16azXfJOYteXA3HeE/cdOAOLs1BAyoeI=
X-Google-Smtp-Source: AGHT+IGoH6YtfV7nOzsPI+6iIx3aoe54gR+xH8kR3xd/zXrtBaIzhkOOFF2K23Utu/wr4pLZSMn2lw==
X-Received: by 2002:a05:6512:224f:b0:549:70ea:27a1 with SMTP id 2adb3069b0e04-54990e67248mr5119839e87.23.1741625570942;
        Mon, 10 Mar 2025 09:52:50 -0700 (PDT)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd148sm1520811e87.139.2025.03.10.09.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:52:50 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 10 Mar 2025 17:52:48 +0100
To: Andrew Morton <akpm@linux-foundation.org>, Liu Ye <liuye@kylinos.cn>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Uladzislau Rezki <urezki@gmail.com>,
	Christop Hellwig <hch@infradead.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/vmalloc]  ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-ID: <Z88Y4KcvjcskC5TW@pc636>
References: <202503101629.7289b1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503101629.7289b1-lkp@intel.com>

Hello, Andrew, Liu Ye.

>
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/fork.c:#vm_area_init_from" on:
> 
> commit: ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]
> 
> in testcase: trinity
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-02
> 	nr_groups: 5
> 
> 
> 
> config: x86_64-randconfig-101-20250306
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +-------------------------------------------------------------+------------+------------+
> |                                                             | fb8faf4337 | ff6f2b81ea |
> +-------------------------------------------------------------+------------+------------+
> | boot_successes                                              | 9          | 0          |
> | boot_failures                                               | 0          | 6          |
> | WARNING:at_kernel/fork.c:#vm_area_init_from                 | 0          | 6          |
> | RIP:vm_area_init_from                                       | 0          | 6          |
> | BUG:KASAN:slab-use-after-free_in__vmalloc_node_range_noprof | 0          | 5          |
> | WARNING:at_mm/vmalloc.c:#remove_vm_area                     | 0          | 5          |
> | RIP:remove_vm_area                                          | 0          | 5          |
> | kernel_BUG_at_mm/vmalloc.c                                  | 0          | 5          |
> | Oops:invalid_opcode:#[##]PREEMPT_KASAN                      | 0          | 5          |
> | RIP:__vmalloc_node_range_noprof                             | 0          | 5          |
> | Kernel_panic-not_syncing:Fatal_exception                    | 0          | 5          |
> +-------------------------------------------------------------+------------+------------+
> 
The patch that is in question, indeed, looks buggy. At least i can see
how a use-after-free can occur:

<snip>
static void *__vmalloc_area_node(...)
...
fail:
	vfree(area->addr);
	return NULL;
}
<snip>

<snip>
...
ret = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
if (!ret) {
  free_vm_area(area);
  goto fail;
}
...
<snip>

vfree() - __also__ frees "vm_struct" where "area" points to. A NULL is
returned and free_vm_area() is invoked one more time on already freed
"area". 

Probably it is better to drop the below patch:

ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")

--
Uladzislau Rezki

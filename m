Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAAA233737
	for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688706; cv=none; b=UeoSpHIEmk850zirTRN4wi2auwatEcfHQutMfug7A4hLyXBHx4U9fpgtKGHzI9pwV4tplO2OUX70VZYRhN3kQw1JDXVxnRgbeiMxLwNZZPD6BjfU/QKOojLyDnxZVmTz3culv6LHAHlOHoncx7uR4YwTnS48nw6PK9i9RnMo/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688706; c=relaxed/simple;
	bh=eDgq6JXqoZ8TDqPqb3LsjrjdX0fEl/p8NNVfCpfdP/g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HC+5VHjQYfwfmv0/o+y1H8WCI9EPx8+s8WkotC5L9qE75EiFrZ4PeKFez4vNSZ8Z3xuYOQjbjADVHYTuPSNu+htkLs7fqrCssElVFvmW003FfNGEJxDn8e8i4bKa+SFY6S3Unlr3OuoFGMzvS7UnStAR7K9yolX+F6wea8xJnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoPF/1sN; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoPF/1sN"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c05fd126cso25246171fa.3
        for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 03:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741688703; x=1742293503; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQ9QHu9OwuR/HOCYxmuFMkfIcaT2lB/BHKzVqZDxMW4=;
        b=XoPF/1sNd6SyTvXGvkUGr14zFyAhzVEcmd5B0+vQ6bHSqDQdxw5AIoYcKxnVcf5BKC
         2hF1OC72VANW1hLPe1Kj3XeIaJIOr6eubzeEwkTGRfpXZ8KCd5rmGYnZBabV5xkocw1f
         Wb5YfeNgAjoaTEyaYqmcKDzPuXAH39gJvDAgVcPHBYCCbKxce2NqNlh9cRYvmgptFtBY
         z4j7cRfcd2cknJPdejIf+3YHmQubrbfXHk2mwRU5MLIUZLo83zCkltPpv+eckaGRUQhz
         wpYbAVVV9vbp3btfkadO8mSv3gafM+Fl7HY/Zd7r0MPpA0Zo/KD9w18Z7ouP9JJCUIbF
         ej6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688703; x=1742293503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ9QHu9OwuR/HOCYxmuFMkfIcaT2lB/BHKzVqZDxMW4=;
        b=ngw4D47z6S0YMI7NlX63dw8mNsFLILqnYLj4Q9QOyIAvHuHkbvRuxrLMxjNqnDq0LT
         BZKivvOQJkYI1SLGgq2Sw1DPGDeY6rGl8Gq+o7pK78JExiUrd4KUpHXGFy+ga05BAhuV
         xfn1teEWK6VFtyPOHOZtZd1FsKvZVobVL/2S7As6ykIlk1mcwUJVt0T4ynLZgr1JF9fr
         e9EQBgVHyqhsuhsQ+H5/nnyj0fp8OwPWI7g0XRdxz6+gzQtQBafoonwxQ0sH4zWxF/lV
         EybsUHlsvvvXqvSPf4L01LecaIXDQ0cdxZ0IDtPTaEkMdnzCkomGmd5RQYNt7urh36Jg
         K1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUnTOG+1VcxJkjQDNLpTpGFMU27lXIvcRgaxXUHgo4q7nbs6lQbqSPhE8c8/uk6FzTgzbr9Vsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXk19UAtfQHBypGxK8E0srxOmiJcfAFLCTqOiQKs8QiRbuaNRl
	WaHs8/F9e+ai9+pTw5yL1hbMF/h9uRP9GC/1JDNnaAK5ldzkqX3F
X-Gm-Gg: ASbGncupyX9dm4ZgiDDrkfYpBcB10ItBEYvR+Kv1AR5JJ3saC8w6YrsJtEaqQQ4gEpp
	PxdTrB3cYR6ozloHg1l0oJv6HUVze4XZg3k+WlLkxBDMG+gs6yTEBVUZ7/QctG5BH7L2hTXYb6k
	GeFR6RtczqrO7fVicj/j/hZK5RQSYErHokVgVQtc1SfxRaet9eMBzwH66Tetupnm/Z3+/UbNt+V
	l39ntW4+6cfM0w/xBxSYysYMeLh9+1M0H1dDgE0DmHcTK1vxIybquKA9fc7OG/y+Sg1ydPyPdTW
	3W0STVzVN8mmSyA/WgydeDpmxSGLix0Q/wqgOGm58EFhvpIf2TI/vUJL3Qxz2ufIC1Y=
X-Google-Smtp-Source: AGHT+IHZ491cWXLpS+dqT3PInxZGFT9Hawkj2mUnUkO88aGsnJ/1oIGYlFx6eiFALRnYsmrDGwS0fw==
X-Received: by 2002:a2e:bea2:0:b0:30b:bfca:bbf2 with SMTP id 38308e7fff4ca-30bf44e60d1mr57376651fa.7.1741688702288;
        Tue, 11 Mar 2025 03:25:02 -0700 (PDT)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bffe3a2b5sm14425671fa.32.2025.03.11.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:25:01 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 11 Mar 2025 11:24:58 +0100
To: liuye <liuye@kylinos.cn>, Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Christop Hellwig <hch@infradead.org>,
	linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/vmalloc] ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-ID: <Z9APeowHOXe-MkV2@pc636>
References: <202503101629.7289b1-lkp@intel.com>
 <Z88Y4KcvjcskC5TW@pc636>
 <e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>

On Tue, Mar 11, 2025 at 03:26:59PM +0800, liuye wrote:
> 
> 
> 在 2025/3/11 00:52, Uladzislau Rezki 写道:
> > Hello, Andrew, Liu Ye.
> > 
> >>
> >> Hello,
> >>
> >> kernel test robot noticed "WARNING:at_kernel/fork.c:#vm_area_init_from" on:
> >>
> >> commit: ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")
> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >>
> >> [test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]
> >>
> >> in testcase: trinity
> >> version: 
> >> with following parameters:
> >>
> >> 	runtime: 300s
> >> 	group: group-02
> >> 	nr_groups: 5
> >>
> >>
> >>
> >> config: x86_64-randconfig-101-20250306
> >> compiler: gcc-12
> >> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> >>
> >> (please refer to attached dmesg/kmsg for entire log/backtrace)
> >>
> >>
> >> +-------------------------------------------------------------+------------+------------+
> >> |                                                             | fb8faf4337 | ff6f2b81ea |
> >> +-------------------------------------------------------------+------------+------------+
> >> | boot_successes                                              | 9          | 0          |
> >> | boot_failures                                               | 0          | 6          |
> >> | WARNING:at_kernel/fork.c:#vm_area_init_from                 | 0          | 6          |
> >> | RIP:vm_area_init_from                                       | 0          | 6          |
> >> | BUG:KASAN:slab-use-after-free_in__vmalloc_node_range_noprof | 0          | 5          |
> >> | WARNING:at_mm/vmalloc.c:#remove_vm_area                     | 0          | 5          |
> >> | RIP:remove_vm_area                                          | 0          | 5          |
> >> | kernel_BUG_at_mm/vmalloc.c                                  | 0          | 5          |
> >> | Oops:invalid_opcode:#[##]PREEMPT_KASAN                      | 0          | 5          |
> >> | RIP:__vmalloc_node_range_noprof                             | 0          | 5          |
> >> | Kernel_panic-not_syncing:Fatal_exception                    | 0          | 5          |
> >> +-------------------------------------------------------------+------------+------------+
> >>
> > The patch that is in question, indeed, looks buggy. At least i can see
> > how a use-after-free can occur:
> > 
> > <snip>
> > static void *__vmalloc_area_node(...)
> > ...
> > fail:
> > 	vfree(area->addr);
> > 	return NULL;
> > }
> > <snip>
> > 
> > <snip>
> > ...
> > ret = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
> > if (!ret) {
> >   free_vm_area(area);
> >   goto fail;
> > }
> > ...
> > <snip>
> > 
> > vfree() - __also__ frees "vm_struct" where "area" points to. A NULL is
> > returned and free_vm_area() is invoked one more time on already freed
> > "area". 
> > 
> > Probably it is better to drop the below patch:
> > 
> > ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")
> > 
> 
> If drop this commit, then the two “goto fail; ”in the __vmalloc_area_node function will cause area memory leaks in the __vmalloc_area_node function  when returning.
> 
It does not leak. On a fail case we release everything including "area":

fail:
    vfree(area->addr);
    return NULL;

this is how vfree() works.

> Perhaps the following changes should be added.
> 
> If the following changes should fix all issues I will send a new patch.
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 61981ee1c9d2..1826f3d70885 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3697,7 +3697,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>                         warn_alloc(gfp_mask, NULL,
>                                 "vmalloc error: size %lu, failed to allocate pages",
>                                 area->nr_pages * PAGE_SIZE);
> -               goto fail;
> +               return NULL;
>         }
>  
>         /*
> @@ -3725,14 +3725,10 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>                 warn_alloc(gfp_mask, NULL,
>                         "vmalloc error: size %lu, failed to map pages",
>                         area->nr_pages * PAGE_SIZE);
> -               goto fail;
> +               return NULL;
>         }
>  
>         return area->addr;
> -
> -fail:
> -       vfree(area->addr);
> -       return NULL;
>  }
>  
It is better to drop the patch. It does not fix anything, instead it
has introduced a degrade.

--
Uladzislau Rezki

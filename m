Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9251DA32
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250006; cv=none; b=pJUf/r3XauyYPz1o2cm/8SHksaZooEGZe2HI7B3ZTWnkx+KXU9qS/S/fS6tdr6ja6pOig3dRgRd8DfkuPES3XeazZtnGc9hxjwH5g6/GChkaK1QM3NMeGnf66EF5pveItBDCDQHsLgc4WFRcd58XVfcjhFwHGdZ8T6Dj+ILAa5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250006; c=relaxed/simple;
	bh=8WBsHr+/U0gPukS1DlHvQ0jQLtwGsvE19wwN4GIOeFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsU8987FzVy9vgMrupl5b5k729DJeOj0PFSkeHTwm+d5Zh2F43NMlMVCNfX6wBIWDX7I35IZXW0Tg20rUzXWuTcJiX6I71IwM8VghvQ3/UPhEtlnEOPl/Ibdpf6Q+TK4a/r0q+QdYuA1EMWNzlyZsou+uBlSd5F2/OTPoGiYp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5OE8ztL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5OE8ztL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4249196a361so9167215e9.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719250003; x=1719854803; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0zJj0i6Eef+mmmoD7VtRkp40psXLNI3uhnA1z5IfCo=;
        b=i5OE8ztL/4ay1F1q0HGJTWAgYe46rjwhQBUxDdmZfvUyC9b9Aimz4raCiOVDJE7iZi
         bC88pqPi9V3BKiOvnHanM2wm+ntzFCMSKeDJqxJSk7/47H4SzDIskFdfgxzSehJgcEMP
         RUQnNA4px18U7BMTkhq8LpvPrCHi9YXD+QHpKp00QNGoUnGPbawgNAi3nBO7mIyTCHy7
         AdwAiegO9lDB+JTRjxmPCjc4nlJVURVezHei2X7wbX1qpqYBJIecgplfb4yV7zoyZiGN
         uUry2sOhijaGVpRvWI6D47RWGRbW4NvvlELw1V5sf4DySCYSBhXSZLu9jz9RGFV9sgRd
         /qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250003; x=1719854803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0zJj0i6Eef+mmmoD7VtRkp40psXLNI3uhnA1z5IfCo=;
        b=qZ4Ct0DLoYqVSwIjOyEo9SN6u6Yg1bHUgrWzSbpmGZzwFMz5h/p15+yAlbBAnvgnY6
         dSiNhUuQiTsj5Cg4vASaFovhO4AlJfLcHtYkMe3ll+jJ8/iWFd4D0g9v3vtfolt3QAdd
         XJpHo4xn1DjoeeS0dCBtK2Rfvz+DUtPkNQ9fDAKb7uj9G/mz8biln8+vGzfyQEg/TQUZ
         2r4N6Y87Ihio9KGGrn00wnb1a/0JaL6/GX1EfH3KqHKTKQaXuNxM+FqUUFapy04uezL2
         dnIhcxwgwoqEVl7UvLtUTK76x/1kgaRG7xlAo3n77qRyrudIarzzxDSXrZeM5bQfQQ/K
         HNKw==
X-Forwarded-Encrypted: i=1; AJvYcCVmZtPQ/bFOVZqUCBM5nXkq1qo6wsYGFA1BpWuJCrOgn2NpdgAOhA2xj+pPUNQ8Hb1y29FCXgc9/FRYx3KQFF1t9N01RGf6
X-Gm-Message-State: AOJu0YyX4pvx5sdQpxeBBPZ/r90zWM5M22hviN4MFW5bkoTX4bXygiiG
	sL6Lvzv3Rm+j0z0K0qc7NA7aEPYzD92W4Vr5upSa7zazfEvIJuo4
X-Google-Smtp-Source: AGHT+IGxeNceUKaNcYx2Jxfd1Gj6bqVSWIOz94FDHmzgiaSghAMdf3VqII30KozGWxqHRnwKYMUtJw==
X-Received: by 2002:a05:600c:4f96:b0:422:683b:df57 with SMTP id 5b1f17b1804b1-4248cc33ce7mr33926975e9.21.1719250003304;
        Mon, 24 Jun 2024 10:26:43 -0700 (PDT)
Received: from ?IPV6:2001:16a2:df66:b900:46d:aa3:6645:bcd8? ([2001:16a2:df66:b900:46d:aa3:6645:bcd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b3dsm184640765e9.34.2024.06.24.10.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 10:26:42 -0700 (PDT)
Message-ID: <cacd14a9-01fc-4844-9ac6-2e797af13c36@gmail.com>
Date: Mon, 24 Jun 2024 20:26:39 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Yosry Ahmed <yosryahmed@google.com>, Hugh Dickins <hughd@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>,
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <202406241651.963e3e78-oliver.sang@intel.com>
 <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com>
 <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
 <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
 <CAJD7tkYJVa=dd=hwqhJ8_-uzxFDaP6-GcTk3RdG_3DJouJ61AQ@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJD7tkYJVa=dd=hwqhJ8_-uzxFDaP6-GcTk3RdG_3DJouJ61AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/06/2024 19:56, Yosry Ahmed wrote:
> [..]
>>>> -       p->zeromap = bitmap_zalloc(maxpages, GFP_KERNEL);
>>>> +       p->zeromap = kvzalloc(DIV_ROUND_UP(maxpages, 8), GFP_KERNEL);
>>> No, 8 is not right for 32-bit kernels. I think you want
>>>        p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
>>> but please check it carefully, I'm easily confused by such conversions.
>>>
>>> Hugh
>> Ah yes, didnt take into account 32-bit kernel. I think its supposed to be
>>
>>    p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages) * sizeof(unsigned long),
>> GFP_KERNEL);
> You can do something similar to bitmap_zalloc() and use:
>
> kvmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long), GFP_KERNEL
> | __GFP_ZERO)
>
> I don't see a kvzalloc_array() variant to use directly, but it should
> be trivial to add it. I can see other users of kvmalloc_array() that
> pass in __GFP_ZERO (e.g. fs/ntfs3/bitmap.c).
>
> , or you could take it a step further and add bitmap_kvzalloc(),
> assuming the maintainers are open to that.

Thanks! bitmap_kvzalloc makes most sense to me. It doesnt make sense 
that bitmap should only be limited to MAX_PAGE_ORDER size. I can add 
this patch below at the start of the series and use it in the patch for 
zeropage swap optimization.


     bitmap: add support for virtually contiguous bitmap

     The current bitmap_zalloc API limits the allocation to MAX_PAGE_ORDER,
     which prevents larger order bitmap allocations. Introduce
     bitmap_kvzalloc that will allow larger allocations of bitmap.
     kvmalloc_array still attempts to allocate physically contiguous memory,
     but upon failure, falls back to non-contiguous (vmalloc) allocation.

     Suggested-by: Yosry Ahmed <yosryahmed@google.com>
     Signed-off-by: Usama Arif <usamaarif642@gmail.com>

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 8c4768c44a01..881c2ff2e834 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -131,9 +131,11 @@ struct device;
   */
  unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
  unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
+unsigned long *bitmap_kvzalloc(unsigned int nbits, gfp_t flags);
  unsigned long *bitmap_alloc_node(unsigned int nbits, gfp_t flags, int 
node);
  unsigned long *bitmap_zalloc_node(unsigned int nbits, gfp_t flags, int 
node);
  void bitmap_free(const unsigned long *bitmap);
+void bitmap_kvfree(const unsigned long *bitmap);

  DEFINE_FREE(bitmap, unsigned long *, if (_T) bitmap_free(_T))

diff --git a/lib/bitmap.c b/lib/bitmap.c
index b97692854966..eabbfb85fb45 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -727,6 +727,13 @@ unsigned long *bitmap_zalloc(unsigned int nbits, 
gfp_t flags)
  }
  EXPORT_SYMBOL(bitmap_zalloc);

+unsigned long *bitmap_kvzalloc(unsigned int nbits, gfp_t flags)
+{
+       return kvmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long),
+                             flags | __GFP_ZERO);
+}
+EXPORT_SYMBOL(bitmap_zalloc);
+
  unsigned long *bitmap_alloc_node(unsigned int nbits, gfp_t flags, int 
node)
  {
         return kmalloc_array_node(BITS_TO_LONGS(nbits), sizeof(unsigned 
long),
@@ -746,6 +753,12 @@ void bitmap_free(const unsigned long *bitmap)
  }
  EXPORT_SYMBOL(bitmap_free);

+void bitmap_kvfree(const unsigned long *bitmap)
+{
+       kvfree(bitmap);
+}
+EXPORT_SYMBOL(bitmap_kvfree);
+
  static void devm_bitmap_free(void *data)
  {
         unsigned long *bitmap = data;


>
> The main reason I want to avoid doing the multiplication inline is
> because kvmalloc_array() has a check_mul_overflow() check, and I
> assume it must have been added for a reason.

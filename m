Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58A19412F
	for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693093; cv=none; b=eGST0A+4j1vTylArebHyrefdyhQwELkdBZBQdbWnBBnCKkfmYUzblvurfrhupbNGJ5Enhj5GiVAb3LBgp3zXIkf+jm7Cg1UHlgNhP8CGWCuFBW2XqvPQO5FSFfwT8ufOr+dAIUSw4+y30tWpUzelD1BScezyfzaJqsuvE9M9+N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693093; c=relaxed/simple;
	bh=ejJtFVCnON3GffDopatlLjODagv8cgjQQWc0CRP0AHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKG7TDk8HMS0z+YBxI7y6lucqVnCdvAz5BH11TP3zkv1D6fDeB6ugP6OFdzZ5ck0TQqvadt4IjBgmuO19+FcBtgc2pLIsvoC4r49fICpk28Vl09qNKZ/G+B4IdekP0Cukt1qn3cmHYpuc3KAF+PNOyI0P0ONVZ5tTQxp/uV4bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLLUKoiC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLLUKoiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724693090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=obXt6F5Wn0Jv9CB8/5Hu+bkdqaGb4CXTsjwCY9uX+1A=;
	b=OLLUKoiC/hDA3wCvjGPAZuR6RKRrPB7QtUr1e2968cPOFbVWQgYe17MQyrZ0c7/O0PQJD1
	OU34KTDf7rqYUZmo1gkoY7j8ji84pvGhxCJb3M1XZdR2JGSWPUKyiP+8KEvwxcjtHvz82Y
	NO013Zsoyd2Tu9obe7398UELtfsVmMA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-MwpsMhifPIKaLEBQkJgCKw-1; Mon, 26 Aug 2024 13:24:49 -0400
X-MC-Unique: MwpsMhifPIKaLEBQkJgCKw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3718d9d9267so2648383f8f.0
        for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 10:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724693088; x=1725297888;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=obXt6F5Wn0Jv9CB8/5Hu+bkdqaGb4CXTsjwCY9uX+1A=;
        b=sPQw3NrJXZAVwJk6dO0lUpaHfCBP6nI7OYhyQHkke72V4OuEC0SMHjHlIg2F5FHDuY
         EKUqqtrk3dK9dpSzoxB+aergwYAruM23Uwh46y1J5cix4zQmfEx4XtOA3IJSRHlu6vCE
         qDuSXzpRefatgPp5O3Ho7fHK6xJTsOKeHREl1q8izyAy5HWmu0jsarlx3GXErgZDNQmB
         e9yL9LMkhb1KuEo1wW7lzV5kzvXAxJcCKUi0fucR7r4Z3F3D1ukJwoQhsX6UDVa7fRRK
         MZwpnBwiALAIJdjcRF55o58OoovE1AHMKBZDwmJB+RT4dqZBDUyAZQatktPzXTjDRIM5
         JCFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5GkpLgYJUfoVPEFLNHO6SI3KF3i1ylFDLwdcUNHiIiJ0uUVjPf21t6Iq3rSQN5W5zCV48AzY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVQaOCqVmVQ99iRPj8jIt7s+uHJ854lxyMFzV8GgyK8SCno9b8
	IlRzM6wHLiD2OKvF812NzjbgzH5Sw0298fQTGpPWqo5rp4aR6WDyFaxASZe1Nv+nVNwzJZxbISb
	hXjKYgLU0zpxh2RBy8iQ1au9XuUOQgaWOQ4125S9m8cCQiSk0Tk+y7g==
X-Received: by 2002:adf:facc:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-37311840eaamr7150042f8f.9.1724693087882;
        Mon, 26 Aug 2024 10:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDo7bJqArpktgD9WBbejrA8BU79+6UmIN/MzzEst31a93fSbdYgdU+3cv+jmEriVxDoNuoxQ==
X-Received: by 2002:adf:facc:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-37311840eaamr7150025f8f.9.1724693086996;
        Mon, 26 Aug 2024 10:24:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:1900:16b0:8dc:77e:31af? (p200300cbc737190016b008dc077e31af.dip0.t-ipconnect.de. [2003:cb:c737:1900:16b0:8dc:77e:31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37307c0c9c7sm11307672f8f.0.2024.08.26.10.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 10:24:46 -0700 (PDT)
Message-ID: <2f19c2ff-66b2-4860-a870-a1bffe73320c@redhat.com>
Date: Mon, 26 Aug 2024 19:24:45 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vma remove the unneeded avc bound with non-CoWed folio
To: Zhiguo Jiang <justinjiang@vivo.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, oe-lkp@lists.linux.dev, oliver.sang@intel.com
Cc: opensource.kernel@vivo.com
References: <20240823140139.263-1-justinjiang@vivo.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240823140139.263-1-justinjiang@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.08.24 16:01, Zhiguo Jiang wrote:
> After CoWed by do_wp_page, the vma established a new mapping relationship
> with the CoWed folio instead of the non-CoWed folio. However, regarding
> the situation where vma->anon_vma and the non-CoWed folio's anon_vma are
> not same, the avc binding relationship between them will no longer be
> needed, so it is issue for the avc binding relationship still existing
> between them.
> 
> This patch will remove the avc binding relationship between vma and the
> non-CoWed folio's anon_vma, which each has their own independent
> anon_vma. It can also alleviates rmap overhead simultaneously.
> 
> Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
> ---
> -v2:
>   * Solve the kernel test robot noticed "WARNING"
>     Reported-by: kernel test robot <oliver.sang@intel.com>
>     Closes: https://lore.kernel.org/oe-lkp/202408230938.43f55b4-lkp@intel.com
>   * Update comments to more accurately describe this patch.
> 
> -v1:
>   https://lore.kernel.org/linux-mm/20240820143359.199-1-justinjiang@vivo.com/
> 
>   include/linux/rmap.h |  1 +
>   mm/memory.c          |  8 +++++++
>   mm/rmap.c            | 53 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 91b5935e8485..8607d28a3146
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -257,6 +257,7 @@ void folio_remove_rmap_ptes(struct folio *, struct page *, int nr_pages,
>   	folio_remove_rmap_ptes(folio, page, 1, vma)
>   void folio_remove_rmap_pmd(struct folio *, struct page *,
>   		struct vm_area_struct *);
> +void folio_remove_anon_avc(struct folio *, struct vm_area_struct *);
>   
>   void hugetlb_add_anon_rmap(struct folio *, struct vm_area_struct *,
>   		unsigned long address, rmap_t flags);
> diff --git a/mm/memory.c b/mm/memory.c
> index 93c0c25433d0..4c89cb1cb73e
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3428,6 +3428,14 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>   			 * old page will be flushed before it can be reused.
>   			 */
>   			folio_remove_rmap_pte(old_folio, vmf->page, vma);
> +
> +			/*
> +			 * If the new_folio's anon_vma is different from the
> +			 * old_folio's anon_vma, the avc binding relationship
> +			 * between vma and the old_folio's anon_vma is removed,
> +			 * avoiding rmap redundant overhead.
> +			 */
> +			folio_remove_anon_avc(old_folio, vma);

... by increasing write fault latency, introducing an RMAP walk (!)? Hmm?

On the reuse path, we do a folio_move_anon_rmap(), to optimize that.

-- 
Cheers,

David / dhildenb


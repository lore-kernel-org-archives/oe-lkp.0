Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722547D3F1
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724817099; cv=none; b=uFC5jHki3GzgDe7uvQjZ7y7X4rTCuoN7BQUFFLbdaNLfdJDKLS04Q5Rbvz+IEqvwKdcL0r+1FV+FSj7Rk4MSjVtG67/XjA+yYyIAV+Pg8RfIlnj/ck6KAh7l3MJcDoznoTLB4i+iUDdS0UCmrIURuV53qc7pWiNlU9eKdWlsruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724817099; c=relaxed/simple;
	bh=X9VpCH4mmRGV8sop8sHJluqGfyo7L8s9UgztsPfGWBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+4Ish+RlbtwYijIek5RFaQdvgFmR3ThR7ioWK95VA8VR78qCYmuD+Lt4IhB2Z3+7lSFHXqVAt73gDPQqpfFtHXw8nEZHGXc0Xmjc3v+zmTu8bUVE0wsOihBmh5H4nbFpz2EfsDjCc+NOhPbCsX1P6RPnV85dnxWeTEdfZZas8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ESC3wDKZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ESC3wDKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724817096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9VpCH4mmRGV8sop8sHJluqGfyo7L8s9UgztsPfGWBM=;
	b=ESC3wDKZBvo8638xdZgjXz8Rao/jcVl7/dd/yQ6xphNYzpY7wiDEO7tX4bcYAccRYO9Y4f
	Hg2R1EOLCu3O8lWvfREAWJiPgMkY8u+0GKUfofI53g5igB3hawySLDB7xLCDKpMdrESG5X
	P3BE5d+28PZ/PfOeO26Q6vKZMeAR2Ew=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-BY_8vrQbOYG-1NMo6eVMsA-1; Tue, 27 Aug 2024 23:51:34 -0400
X-MC-Unique: BY_8vrQbOYG-1NMo6eVMsA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f3f6d581fbso72164891fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 27 Aug 2024 20:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724817093; x=1725421893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9VpCH4mmRGV8sop8sHJluqGfyo7L8s9UgztsPfGWBM=;
        b=iXv9rAi6vpc/bLakWJ9Aj3yihHDPBYT+iOFgShtPuWECQrX4hj9VmeLh3EHtrRIt6V
         4dRz2dIve2mSdk1R3m9kNZV+bzbz63fuL3Xn6qoIOdAJDgnWmj+CUAaQgG1hml0Aw17N
         HUgGTdwq0s5rdrS5w9Cpv9ou+Xd9KZK4ss6NbGrYmYnKPUfVY8k+FlPEQMgljiXBtuLZ
         ZQr7TQ7m61cyYCDKEaCjWh2D0eJWxfo69j/4K8nLZ/RXpxABpPRYgnFvB8iMpqc1fpte
         hK4spYBwhPRh0ovuM7SCxkKsFcTIcfNZ5ABiFnnlT+lIn4Bt3WvcNxgp5gdMq8k/i7ca
         WRNg==
X-Forwarded-Encrypted: i=1; AJvYcCVvmrGQGvN7zUJqdkbFEYRjBwbveQqx49QRtt7FQl5Mr8GdAB/d6mvgOIFEiZIxLoq7gqJ4O58=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ9JQpF3by4EPqJCt8Uny478EbFch0WaUcxvDB82h0oI38w5/u
	52twEsd98Ygmz4VTSbC6sYlyu3fCAja81/3pjHze8Nq9bGuyL3vm0Ah1gY/lSxIgBWs4k0V/+EV
	o7bDRrzEn9eayDiH+8EfDz5If/+G+hhZQ04c4oOZWyJrY3GU/eotz
X-Received: by 2002:a2e:a168:0:b0:2ef:17ee:62a2 with SMTP id 38308e7fff4ca-2f4f574f76fmr112604141fa.14.1724817092580;
        Tue, 27 Aug 2024 20:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7+IV46vQ8pctb7YqbUkP1jVndBl0vdjs0DAHSmhRtspCou0VwevbaM/BtwVuQWg609keFrQ==
X-Received: by 2002:a2e:a168:0:b0:2ef:17ee:62a2 with SMTP id 38308e7fff4ca-2f4f574f76fmr112603901fa.14.1724817091605;
        Tue, 27 Aug 2024 20:51:31 -0700 (PDT)
Received: from [192.168.1.86] (82-181-87-79.bb.dnainternet.fi. [82.181.87.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047dcfe3sm17731291fa.56.2024.08.27.20.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 20:51:30 -0700 (PDT)
Message-ID: <25d25633-0bf4-452c-b665-354a5aaa5d0c@redhat.com>
Date: Wed, 28 Aug 2024 06:51:29 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vma remove the unneeded avc bound with non-CoWed folio
To: zhiguojiang <justinjiang@vivo.com>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, oe-lkp@lists.linux.dev, oliver.sang@intel.com
Cc: opensource.kernel@vivo.com
References: <20240823140139.263-1-justinjiang@vivo.com>
 <2f19c2ff-66b2-4860-a870-a1bffe73320c@redhat.com>
 <d7978429-7875-423e-8c95-f81137a4e6cd@vivo.com>
 <1e95a6e4-9993-40ae-b563-44b7024da25c@redhat.com>
 <5b56e76b-cf73-4cfd-b4c5-03fdece234fd@vivo.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <5b56e76b-cf73-4cfd-b4c5-03fdece234fd@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/28/24 04:14, zhiguojiang wrote:
>
>
> 在 2024/8/28 1:35, David Hildenbrand 写道:
>> On 27.08.24 03:50, zhiguojiang wrote:
>>>
>>>
>>> 在 2024/8/27 1:24, David Hildenbrand 写道:
>>>> On 23.08.24 16:01, Zhiguo Jiang wrote:
>>>>> After CoWed by do_wp_page, the vma established a new mapping
>>>>> relationship
>>>>> with the CoWed folio instead of the non-CoWed folio. However,
>>>>> regarding
>>>>> the situation where vma->anon_vma and the non-CoWed folio's
>>>>> anon_vma are
>>>>> not same, the avc binding relationship between them will no longer be
>>>>> needed, so it is issue for the avc binding relationship still
>>>>> existing
>>>>> between them.
>>>>>
>>>>> This patch will remove the avc binding relationship between vma
>>>>> and the
>>>>> non-CoWed folio's anon_vma, which each has their own independent
>>>>> anon_vma. It can also alleviates rmap overhead simultaneously.
>>>>>
>>>>> Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
>>>>> ---
>>>>> -v2:
>>>>>    * Solve the kernel test robot noticed "WARNING"
>>>>>      Reported-by: kernel test robot <oliver.sang@intel.com>
>>>>>      Closes:
>>>>> https://lore.kernel.org/oe-lkp/202408230938.43f55b4-lkp@intel.com
>>>>>    * Update comments to more accurately describe this patch.
>>>>>
>>>>> -v1:
>>>>> https://lore.kernel.org/linux-mm/20240820143359.199-1-justinjiang@vivo.com/
>>>>>
>>>>>
>>>>>    include/linux/rmap.h |  1 +
>>>>>    mm/memory.c          |  8 +++++++
>>>>>    mm/rmap.c            | 53
>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>    3 files changed, 62 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>> index 91b5935e8485..8607d28a3146
>>>>> --- a/include/linux/rmap.h
>>>>> +++ b/include/linux/rmap.h
>>>>> @@ -257,6 +257,7 @@ void folio_remove_rmap_ptes(struct folio *,
>>>>> struct page *, int nr_pages,
>>>>>        folio_remove_rmap_ptes(folio, page, 1, vma)
>>>>>    void folio_remove_rmap_pmd(struct folio *, struct page *,
>>>>>            struct vm_area_struct *);
>>>>> +void folio_remove_anon_avc(struct folio *, struct vm_area_struct *);
>>>>>      void hugetlb_add_anon_rmap(struct folio *, struct
>>>>> vm_area_struct *,
>>>>>            unsigned long address, rmap_t flags);
>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>> index 93c0c25433d0..4c89cb1cb73e
>>>>> --- a/mm/memory.c
>>>>> +++ b/mm/memory.c
>>>>> @@ -3428,6 +3428,14 @@ static vm_fault_t wp_page_copy(struct vm_fault
>>>>> *vmf)
>>>>>                 * old page will be flushed before it can be reused.
>>>>>                 */
>>>>>                folio_remove_rmap_pte(old_folio, vmf->page, vma);
>>>>> +
>>>>> +            /*
>>>>> +             * If the new_folio's anon_vma is different from the
>>>>> +             * old_folio's anon_vma, the avc binding relationship
>>>>> +             * between vma and the old_folio's anon_vma is removed,
>>>>> +             * avoiding rmap redundant overhead.
>>>>> +             */
>>>>> +            folio_remove_anon_avc(old_folio, vma);
>>>>
>>>> ... by increasing write fault latency, introducing an RMAP walk
>>>> (!)? Hmm?
>>>>
>>>> On the reuse path, we do a folio_move_anon_rmap(), to optimize that.
>>>>
>>> Thanks for your comments. This may not be a good fixup patch. The
>>> resue patch folio_move_anon_rmap() seems to be exclusive or
>>> _refcount = 1 folios. The fork() path seems to clear exclusive flag
>>> in copy_page_range() --> ... --> __folio_try_dup_anon_rmap(). However,
>>> I observed lots of orphan avcs by the above debug trace logs in
>>> wp_page_copy(). But they may be not removed by discussing with Mika.
>>
>> Was this patch ever tested? I cannot even boot a simple VM without an
>> endless stream of
>>
>> [    5.804598] ------------[ cut here ]------------
>> [    5.805494] WARNING: CPU: 11 PID: 595 at mm/rmap.c:443
>> unlink_anon_vmas+0x19b/0x1d0
>> [    5.806962] Modules linked in: qemu_fw_cfg
>> [    5.807762] CPU: 11 UID: 0 PID: 595 Comm: dracut-rootfs-g Tainted:
>> G        W          6.11.0-rc4+ #72
>> [    5.809546] Tainted: [W]=WARN
>> [    5.810127] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
>> BIOS 1.16.3-2.fc40 04/01/2014
>> [    5.811753] RIP: 0010:unlink_anon_vmas+0x19b/0x1d0
>> [    5.812680] Code: b0 00 00 00 00 75 1f f0 ff 8f a0 00 00 00 75 a2
>> e8 8a fd ff ff eb 9b 5b 5d 41 5c 41 5d 41 5e 41 5f e9 d4 82 d0 00 0f
>> 0b eb dd <0f> 0b eb cf 0f 0b 48 83 c7 08 e8 16 40 d7 ff e9 ea fe ff
>> ff 48 8b
>> [    5.816247] RSP: 0018:ffffa19f43bb78d0 EFLAGS: 00010286
>> [    5.817258] RAX: ffff8a71c1bdd2d0 RBX: ffff8a71c1bdd2c0 RCX:
>> ffff8a71c27a86c8
>> [    5.818624] RDX: 0000000000000001 RSI: ffff8a71c2771b28 RDI:
>> ffff8a71c27a9e60
>> [    5.820011] RBP: dead000000000122 R08: 0000000000000000 R09:
>> 0000000000000001
>> [    5.821380] R10: 0000000000000200 R11: 0000000000000001 R12:
>> ffff8a71c2771b28
>> [    5.822748] R13: dead000000000100 R14: ffff8a71c2771b18 R15:
>> ffff8a71c27a9e60
>> [    5.824122] FS:  0000000000000000(0000) GS:ffff8a7337980000(0000)
>> knlGS:0000000000000000
>> [    5.825665] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    5.826775] CR2: 00007fca7f70ac58 CR3: 00000001027b2004 CR4:
>> 0000000000770ef0
>> [    5.828146] PKRU: 55555554
>> [    5.828686] Call Trace:
>> [    5.829169]  <TASK>
>> [    5.829594]  ? __warn.cold+0xb1/0x13e
>> [    5.830312]  ? unlink_anon_vmas+0x19b/0x1d0
>> [    5.831118]  ? report_bug+0xff/0x140
>> [    5.831840]  ? handle_bug+0x3c/0x80
>> [    5.832524]  ? exc_invalid_op+0x17/0x70
>> [    5.833262]  ? asm_exc_invalid_op+0x1a/0x20
>> [    5.834086]  ? unlink_anon_vmas+0x19b/0x1d0
>> [    5.834908]  free_pgtables+0x130/0x290
>> [    5.835661]  exit_mmap+0x19a/0x460
>> [    5.836351]  __mmput+0x4b/0x120
>> [    5.836965]  do_exit+0x2e1/0xac0
>> [    5.837601]  ? lock_release+0xd5/0x2c0
>> [    5.838343]  do_group_exit+0x36/0xa0
>> [    5.839035]  __x64_sys_exit_group+0x18/0x20
>> [    5.839866]  x64_sys_call+0x14b4/0x14c0
> Arm64 machine tested it and no crashes detected. You may try the
> attachment modifition provided by Lorenzo Stoakes. Can you please
> check if there are any opportunities for further improvement?


This patch is still wrong afaics in the main logic, you can not remove
the avc because the non cowed folios of child are not reached then.


>>
>>
>> Andrew, please remove this from mm-unstable.
>
> Thanks
> Zhiguo


Thanks,

Mika



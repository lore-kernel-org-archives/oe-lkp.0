Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE394CA288
	for <oe-lkp@lists.linux.dev>; Tue,  8 Sep 2026 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909055; cv=none; b=NSZ+5t4NyB/Xi5gc9rvvDmGxC+nXPMZFHr1hK3kK5D8P3NuTujI4ZaI0L08bDteK9DGD8CML98nnNZOxyZYWjqSa4yD1yAfaRCx8KpcDInSTK9mBVXke9/9AJoqZjolNR1zN6uXBiwMM+1dNfMEuEVvgUHVjQ/yydcw6zs4lYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909055; c=relaxed/simple;
	bh=7kdKAv1UutyivaCl7H1vS0Jdc3NzhJZAlxtP4jKPHik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8z8NDiolACeyhpDDHDv+jHxIuIBhvNah094SIGDJiZrP/toQoIHq2Ar51OVKcVUQZdeTldJeSL5GSWrqj8W7WP2Lyu++68/XjjOyzUiBLR8f4AcTbXtUzpAh+W49Ti4ow66sSNZf9XyqkC6SuTIvQ0B7WRb3Sbbw1p8LymElhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dj5Jryrm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dj5Jryrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788909052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHZMGWGGrZxmd1plGNxBzFOjbHBtD/NVRGD+NRqVMTQ=;
	b=Dj5JryrmFNdRykxG/33Wz+3g+4bwsBomODn0RdI1PJtvmfp+BWPKy45MGI0UA9uVwyaovN
	GiNvAmsSg9uy8eS82UZKcP1a5w9/1mCnG4WBbQ9A4YfkCQaCIOYe0Y5t1ApAD1OecIAcZR
	MDcfvqxo/osIYDilOR8a+xC5qP1AtD0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-IF8G_XjxMAu4UfhMQA1ozQ-1; Tue, 08 Sep 2026 19:10:50 -0400
X-MC-Unique: IF8G_XjxMAu4UfhMQA1ozQ-1
X-Mimecast-MFC-AGG-ID: IF8G_XjxMAu4UfhMQA1ozQ_1788909050
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso829902185a.2
        for <oe-lkp@lists.linux.dev>; Tue, 08 Sep 2026 16:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909050; x=1789513850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHZMGWGGrZxmd1plGNxBzFOjbHBtD/NVRGD+NRqVMTQ=;
        b=i84X0jg5EK1w73MDZEF4aQth76G+lSlHTIRJ/UAXv6XoxadtxAJmPVahzyo5X19gl5
         dRGbt/yjfhHHY+18MSO5XvOUYUIEvBe7pZHYSRtINFOrfC7HYB9ijnfQlAHoffCIUSgL
         JCppMTazyLHLdHzLvlhbU0QHF7mTHi0dCesGP0gvYeVIJFiFrNkVhiuTF4jL+KTQl129
         JsjnBlNzisuhRIMVS+4U5lGNs5o+6G1B5Bdw7dzBy/Lg60BEZVEBWw5yQ+WTWq9hk3P/
         H8GsxJKG4PV1GakR6zTj6wTy8HSa2BeLJCMpvdtuf4Gp6/ysKn+HX8CwgR/3E/gErE/Y
         VxKw==
X-Forwarded-Encrypted: i=1; AKwUvBxLtUdexxJDM7XXqkvtNQDa6HzheEhQTHurFHVnV+45ik7YwmSnXK1E5QXvH00tXloAa3q72zA=@lists.linux.dev
X-Gm-Message-State: AFuF++nHe2CqEBvV+ZbSzpjayScWXC/pxy/8GeFKTWx6c2NAlbpoKSTb
	AZHEEjfR4yknN8Wrg1S5nUFzo/66exA+2ObFn7Lyv2InTTCaKyJIbxLnjB2E8hZkr59wNcoFA9C
	rR1yHprY872x5iAxb5tjojwm3ww/MXe5OS/xFiHdXrcPn/TypFlup4ZJcUg==
X-Gm-Gg: AYBFou3HXxEV6YSRB3MKLqnf9N4q0zI8RYO8rSxU+3zLvG5J7D1apych/rStsMneDyB
	7YOMWk38aYPQP3TgYIS4S65ZZt3N6nfqD+vX7db6Nkxrq1vXj73y7Dbd4Kko7cyOn0xk3Wnls9J
	pQBN1KNKk4K63h8eQ/V97CaASKduIdp7oXzNOAFT2blgpQoQQ7I0O7ifBh36hf4jtRLN2SEgw9N
	ie8YjasBS5MdKzJFrkrreK8GO5ntPdbad++YrwrSsl0tVThF2FnXi1xDPD8qgfNvmRQjYtOU4gm
	Pl9eald38H0gmQ1aYICWZCXyptTNy3fau+4nlODCVuAQlPYzQObyfTZZ+Ud3tJZaH1d78AGDyl8
	uOgebozmAOjwI4Xcv9KhNsAAfy6VYUNFnieOmmRoZ0w==
X-Received: by 2002:a05:620a:691a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939802fa452mr3511633185a.10.1788909050224;
        Tue, 08 Sep 2026 16:10:50 -0700 (PDT)
X-Received: by 2002:a05:620a:691a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939802fa452mr3511625685a.10.1788909049657;
        Tue, 08 Sep 2026 16:10:49 -0700 (PDT)
Received: from [10.0.4.228] (97-127-68-83.mpls.qwest.net. [97.127.68.83])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm1246505785a.32.2026.09.08.16.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 16:10:48 -0700 (PDT)
Message-ID: <fb4bcf42-cb41-4a1e-b307-78dfdc914e00@redhat.com>
Date: Tue, 8 Sep 2026 18:10:47 -0500
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct
 file_system_type
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 David Howells <dhowells@redhat.com>, lkp@intel.com, oe-lkp@lists.linux.dev,
 Alexander Viro <aviro@redhat.com>
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
 <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if>
 <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
 <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ATultQ37BKQaj2LJn7oVEE4LQg2A4jyB3bROPUmWaqw_1788909050
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hohum, well I spent a bunch of tokens in claude/opus and basically got

¯\_(ツ)_/¯ 

I could be wrong but I'm not sure sashiko would do a deep dive across
all the involved code.

I was going to paste the summary of the AI analysis which I generally
dislike but tbh there's just nothing to go on :(

It did point out that s_lock_key seems dead/unused and thought removing
it might magically fix the problem as well.

-Eric

On 9/8/26 3:07 AM, Mateusz Guzik wrote:
> While I'm not convinced spending time on the resulting bug is
> worthwhile, with the arrival of sashiko I think you should rebase &
> resend -- it very well might just point out the problem with 0 human
> effort.
> 
> On Tue, Dec 30, 2025 at 11:45 PM Eric Sandeen <sandeen@redhat.com> wrote:
>>
>> On 12/30/25 4:04 PM, Mateusz Guzik wrote:
>>> On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
>>>> LKP reported that one of their tests was failing to even boot with my
>>>> "old mount API code" removal patch. The test was booting an i386 kernel
>>>> under QEMU, with lockdep enabled. Rather than a functional failure, it
>>>> seemed to have been slowed to a crawl and eventually timed out.
>>>>
>>>> I narrowed the problem down to the removal of the ->mount op from
>>>> file_system_type, which changed structure alignment and seems to have
>>>> caused cacheline issues with this structure. Annotating the alignment
>>>> fixes the problem for me.
>>>>
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
>>>> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
>>>> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
>>>> ---
>>>>
>>>> RFC because I honestly don't understand why this should be so critical,
>>>> especially the structure was not explicitly (or even very well) aligned
>>>> before. I would welcome insights from folks who are smarter than me!
>>>>
>>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>>> index 9949d253e5aa..b3d8cad15de1 100644
>>>> --- a/include/linux/fs.h
>>>> +++ b/include/linux/fs.h
>>>> @@ -2279,7 +2279,7 @@ struct file_system_type {
>>>>      struct file_system_type * next;
>>>>      struct hlist_head fs_supers;
>>>>
>>>> -    struct lock_class_key s_lock_key;
>>>> +    struct lock_class_key s_lock_key ____cacheline_aligned;
>>>>      struct lock_class_key s_umount_key;
>>>>      struct lock_class_key s_vfs_rename_key;
>>>>      struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
>>>>
>>>
>>> There is no way is about cacheline bouncing. According to the linked
>>> thread the test vm has only 2 vcpus:
>>>> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>>>
>>> Even if the vcpu count was in hundreds and the ping pong was a problem it
>>> still would not have prevented bootup.
>>
>> Fair enough, it really didn't make sense to me.
>>
>>> Instead something depends on the old layout for correctness.
>>
>> If I add ->mount back to the /end/ of the structure, it boots fine again,
>> so I guess nothing is expecting specific offsets within the structure
>> at least.
>>
>> (If I turn off lockdep in the kernel config, it boots fine again too,
>> FWIW.)
>>
>>> By any chance is this type-punned somewhere?
>>
>> I don't think so...
>>
>>> While I can't be bothered to investigate, I *suspect* the way to catch
>>> this would patch out all of the lock_class_key vars & uses and boot with
>>> KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
>>> access is oob.
>>
>> Can't do KASAN or KMSAN on i386, AFAIK. :(
>>
>> I suppose I could try such things on x86_64 just in case something shows
>> up...
>>
>> Thanks!
>>
>> -Eric
>>
> 


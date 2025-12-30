Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E3F1A267
	for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 22:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134734; cv=none; b=lpG3kOZ1/YmDLXHZ94lrTOb7Uap3Ik/BMKPcrCK/6ztLRVQo9iQjSQX3Q5o7KeKJ5xd+ZrFE/asYT3c4POZdD9K3nwxNy4qYN/GXfnQeeKRoPiJHPM+xpOQgin/kWEy6wp69EOBTKEBqK2CLz2WkhlFedZW67r+XSPhOLfIkAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134734; c=relaxed/simple;
	bh=eDvWa2VJe9lB6ijY6V2CsFsjFWajd38whDgN/+2Ttfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AExdlkYWdWKK6lgVvCRdUHKf3RYvqNDPG569wlrejRGCkQwGfnSbR1wYyg7by6xqY+K6uchiua2t7uKu0ZmtYi4SROoXWSrWPuSNXrKYRdGWpo1KMjxHYx+dj9b2rqpY4QYZKTR5Swcqw8LUgzcLBAFNzZdRA4oj0wpB5/RaBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uzf2M0ZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uzf2M0ZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767134730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3SJyXv/bGprmgznxb/DfZxykKGqJjlUpVS8LQMq/sY4=;
	b=Uzf2M0ZB2SIAC0qjPW2Lrt2Mf3DeULk40X1KT4fbEJYm4hSSWDSpajFsbRkwhkxcVUv3rp
	sriEL628LHbuGwo97He4BZQUGcB0T+VU59P1x4eXAwAhImRFv1l7x+vHFHaWE3u9c7ok4e
	IXK4m5pHn9MOcayCmXO7LPlbOJwyvdU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-WZeH1HhLO5-gKncqdM0YSA-1; Tue, 30 Dec 2025 17:45:29 -0500
X-MC-Unique: WZeH1HhLO5-gKncqdM0YSA-1
X-Mimecast-MFC-AGG-ID: WZeH1HhLO5-gKncqdM0YSA_1767134729
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0488e746so226153641cf.0
        for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 14:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134729; x=1767739529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SJyXv/bGprmgznxb/DfZxykKGqJjlUpVS8LQMq/sY4=;
        b=sv9qCcpySODl4ZdJrgKYRvMvLhjAKA4D8nqHZWMp2JSDX16puT448DHL4Du2jfvas6
         46OcBjQn66xahGDeL0OQWbmRQ6+rCTK26VlKymXOERmBxejc1M3J8bXqHf1WoY113rrQ
         KNpzA6ldE77rN6Niky4jTRON/2q55bW6iMX1WsUouCe3mjK2N7CGGLHgLrwsa3ZXIVd/
         ZMB8uNOZQyEKIdNJTo4L8mc6kVLVdkVcWLx52W0/Rj6i5qKttXIdjeIIvYsbUnz+tM9E
         qq9XBBymCAA+FyaEuJswKEYvCZPHQJJ1RqkD/PeaN33KrYVYxQ/zwvl9XjcTCZ10jy79
         KLSg==
X-Forwarded-Encrypted: i=1; AJvYcCUkT9/gfBVJV6AFmrd+w9Uw+GQuZSYifkrtblCaxF0n0eV8b0SycnBjixuqLlx5evgRiItAxSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQPw6bxTk6OyY56DOvz7mg1SSiUoJ8SsQN+FSrc/RzegkOvEBK
	7bDCZSXdfp+imbYe9kTTpFJ/SYDdZyp0VzazjSSwMozMQLP3F9YZZYx1ZJVwWtRbEWXAzSf7z05
	rqrHQnmoubo+01iDIkylYRgWv/jlPoqpd1X8mBocBc4UsZALydwFw38KbEQ==
X-Gm-Gg: AY/fxX66zEfJ2Z/VEZrH+Hb6+wIgQlsddaJR+/6PKw6TVW+HyOW0XJqGZyWoub+AtV5
	BxJuQfMLSXonUzxPg/Wouicl5ZmpWYiCfOiDyw3ZqhQqLnc0qE/qwlllXI5rJ424GbjpxLaQ9uF
	dnuy4D1rJBql3eziQPKqZaUtoXfxtNfpw4L+umkbuA+8WW8xiufMdNHizdsZwMoZZc1IgyxeesL
	IQXT7eW8xTcyizsDjU0dlDlSrs8HC1gU3jbDzNwwRaw0RoFq7j4BxQa2feKZKG7jInBI7uUmYSV
	K9/lxw1nEFyH1q3ZGBn3mwV4BNx4tWZkEQxYZprMhtWTjax+QkeVZWLeLhvb9uEUq8QuvMxx74w
	cAvu/rjvM7XD2U9f+EHHAIr0q1wmsnxa0jCt8eX1CEstFTvBP4umt
X-Received: by 2002:a05:622a:199d:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f35f3a0267mr525795971cf.5.1767134728727;
        Tue, 30 Dec 2025 14:45:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/WUjGMG+vgFqxqR+gAUNbwR+a/ocaYU4UpFUbesLSCsG9fPvBLnEgNjci2CiKFig6Wxjpsg==
X-Received: by 2002:a05:622a:199d:b0:4f1:af84:387a with SMTP id d75a77b69052e-4f35f3a0267mr525795741cf.5.1767134728403;
        Tue, 30 Dec 2025 14:45:28 -0800 (PST)
Received: from [10.0.0.82] (97-127-77-149.mpls.qwest.net. [97.127.77.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm250027921cf.28.2025.12.30.14.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 14:45:27 -0800 (PST)
Message-ID: <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
Date: Tue, 30 Dec 2025 16:45:26 -0600
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
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AqsgS-vZwUH3lTLLXXCNzMtrj8AoqgNBrCc4e-_cQzU_1767134729
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/30/25 4:04 PM, Mateusz Guzik wrote:
> On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
>> LKP reported that one of their tests was failing to even boot with my
>> "old mount API code" removal patch. The test was booting an i386 kernel
>> under QEMU, with lockdep enabled. Rather than a functional failure, it
>> seemed to have been slowed to a crawl and eventually timed out.
>>
>> I narrowed the problem down to the removal of the ->mount op from
>> file_system_type, which changed structure alignment and seems to have
>> caused cacheline issues with this structure. Annotating the alignment
>> fixes the problem for me.
>>
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
>> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
>> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
>> ---
>>
>> RFC because I honestly don't understand why this should be so critical,
>> especially the structure was not explicitly (or even very well) aligned
>> before. I would welcome insights from folks who are smarter than me!
>>
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 9949d253e5aa..b3d8cad15de1 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -2279,7 +2279,7 @@ struct file_system_type {
>>  	struct file_system_type * next;
>>  	struct hlist_head fs_supers;
>>  
>> -	struct lock_class_key s_lock_key;
>> +	struct lock_class_key s_lock_key ____cacheline_aligned;
>>  	struct lock_class_key s_umount_key;
>>  	struct lock_class_key s_vfs_rename_key;
>>  	struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
>>
> 
> There is no way is about cacheline bouncing. According to the linked
> thread the test vm has only 2 vcpus:
>> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> Even if the vcpu count was in hundreds and the ping pong was a problem it
> still would not have prevented bootup.

Fair enough, it really didn't make sense to me.

> Instead something depends on the old layout for correctness.

If I add ->mount back to the /end/ of the structure, it boots fine again,
so I guess nothing is expecting specific offsets within the structure
at least.

(If I turn off lockdep in the kernel config, it boots fine again too,
FWIW.)

> By any chance is this type-punned somewhere?

I don't think so... 

> While I can't be bothered to investigate, I *suspect* the way to catch
> this would patch out all of the lock_class_key vars & uses and boot with
> KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
> access is oob.

Can't do KASAN or KMSAN on i386, AFAIK. :(

I suppose I could try such things on x86_64 just in case something shows
up...

Thanks!

-Eric


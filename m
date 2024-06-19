Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCC1422A2
	for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718810737; cv=none; b=YdQMNBudQhPNuVmJCK0CamAGH26aY4MpvGLVcgoXowQTeSujG5qs+iqCCgR9T972YMlNrj6Ur2T8+dAl/AGcmHsfN+yCxEie/BNNmQUrjC5RI0vVb9gAkuhkFau6WQMMYv8x2cNXmN8lMM9DygqOske+mmQfPgPJbcYIrMYObBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718810737; c=relaxed/simple;
	bh=7lLHL7WbtmnVTokudSZCsjF75Xj14OPUUSGO5t3o/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2SdI1kZMSEHNxGUh9fxF96ptuncc7fXGrE8+9za9+wf8cU8B1HDE4f97M00Y/6Dd7WN2LyVY5Ke4i3B7TUiTidJWdVtobsRVkUjNoDYDNn3UQQ9ULc0YEOSxbyd9fCs2WzzOEAYi9CIWUUiRhSCASl6IT7eimgreeQz/A5zGeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f1c7d1286so510511f8f.3
        for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 08:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810734; x=1719415534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzIZgoUq63mX73VxCwwJIV3CEA76deHPFGsC3cFCI3w=;
        b=sNPy1PJeCvS0yNFmOi2zOpnArGSew4a1pR8BfaALU4aihato2PxjXL0AB/zourJD4m
         Jad+d4d1Ggc6FcLp2fHBKTBtJKeTuaOhgcp4gU6Zcd3Rh+ktXDfmS8ZKRhkw5ZN2W34H
         ZH7mx3UfXttziEJtXZmJDfizXbRG09JsJWqWQh4uKW2y5k62H+/7GMoLdMq3PixPXGXI
         OmeqiPBVjlKD0c0Ky4jajrbnK7G//uoRhEbmZfle7xmlsvigTx5YFMNJeARKB561E8xu
         D9LmS4x4wV0Qc5VjVJ9mFSI6Os7SevDHpZwCrl9BWdZuSGoF4cTbLQPkdTiil4m19CuN
         RXrA==
X-Forwarded-Encrypted: i=1; AJvYcCVb30PiIDbAtNrg6Azz8eUmrU4wdZFakxMN4TQM7ZmLeUj79RxRkp5l81ImULyC+5CYDH7BNDoiNZFGJviJG3bf+8H20pyu
X-Gm-Message-State: AOJu0YyYA2pMAkjqG2j6raFhzjTIqQXEdI4kxpZK2YBsJ7Pnzck/9DMR
	tX5KSoKbTUpurfiepYpcC7gGiieP4OjUfpzgPdxWMNHHt4fLNkRf
X-Google-Smtp-Source: AGHT+IEf3sBjCXzX93lySh/7g4Tm+IBr0zNaAnkDAVMjgUhsUo+S1T8n1ms7EyN4QACfrLyfXjDyrg==
X-Received: by 2002:a05:6000:18a2:b0:35f:2584:76e9 with SMTP id ffacd0b85a97d-36316ff7978mr2237855f8f.2.1718810733768;
        Wed, 19 Jun 2024 08:25:33 -0700 (PDT)
Received: from [10.50.4.180] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33bcfsm230292215e9.1.2024.06.19.08.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 08:25:33 -0700 (PDT)
Message-ID: <e26bf274-8600-4862-ab3c-9ce6df7d86e9@grimberg.me>
Date: Wed, 19 Jun 2024 18:25:32 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
To: Eric Dumazet <edumazet@google.com>
Cc: David Howells <dhowells@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, netdev@vger.kernel.org
References: <20240617095852.66c96be9@kernel.org>
 <202406161539.b5ff7b20-oliver.sang@intel.com>
 <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me>
 <Zm9fju2J6vBvl-E0@casper.infradead.org>
 <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me>
 <407790.1718801177@warthog.procyon.org.uk>
 <0aaaeabc-6f65-4e5d-bdb1-aa124ed08e8b@grimberg.me>
 <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/06/2024 17:51, Eric Dumazet wrote:
> On Wed, Jun 19, 2024 at 3:54 PM Sagi Grimberg <sagi@grimberg.me> wrote:
>>
>>
>> On 19/06/2024 15:46, David Howells wrote:
>>> Jakub Kicinski <kuba@kernel.org> wrote:
>>>
>>>> On Mon, 17 Jun 2024 09:29:53 +0300 Sagi Grimberg wrote:
>>>>>> Probably because kmap() returns page_address() for non-highmem pages
>>>>>> while kmap_local_page() actually returns a kmap address:
>>>>>>
>>>>>>            if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !PageHighMem(page))
>>>>>>                    return page_address(page);
>>>>>>            return __kmap_local_pfn_prot(page_to_pfn(page), prot);
>>>>>>
>>>>>> so if skb frags are always lowmem (are they?) this is a false positive.
>>>>> AFAIR these buffers are coming from the RX ring, so they should be
>>>>> coming from a page_frag_cache,
>>>>> so I want to say always low memory?
>>>>>
>>>>>> if they can be highmem, then you've uncovered a bug that nobody's
>>>>>> noticed because nobody's testing on 32-bit any more.
>>>>> Not sure, Jakub? Eric?
>>>> My uneducated guess would be that until recent(ish) sendpage rework
>>>> from David Howells all high mem pages would have been single pages.
>>> Um.  I touched the Tx side, not the Rx side.
>>>
>>> I also don't know whether all high mem pages would be single pages.  I'll have
>>> to defer that one to the MM folks.
>> What prevents from gro to expand frags from crossing PAGE_SIZE?
>>
>> btw, at least from the code in skb_gro_receive() it appears that
>> page_address() is called directly,
>> which suggest that these netmem pages are lowmem?
> GRO should only be fed with lowmem pages.
>
> But the trace involves af_unix, not GRO ?
>
> I guess that with splice games, it is possible to add high order pages to skbs.
>
> I think skb_frag_foreach_page() could be used to fix this issue.

Thanks Eric, that is indeed the missing piece.

I'll give it go.

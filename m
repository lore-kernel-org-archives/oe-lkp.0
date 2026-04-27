Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303D3890F1
	for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280037; cv=none; b=ePHIj+eNvzlHhWu9VgnxbkhcThSgpShnRk1RO37ZKyKFLlBpyTkdzhsH6Yc/DA90u0rL5bMkQX7GGJIMz6pIThgOO3MSb5ibg5tu7A+j/D6Shfq1FHuW5BSQnVlO0kpZdvNcJHRHfAAW6X2/4yX/IPeYxhbo/b3z/ZxgbEy0w8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280037; c=relaxed/simple;
	bh=QHXOWtnq9cgmubmDixNzL0+Z3UtjTagU1DyYkog4n7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6TxkN9IDj3TKfOMJPdtVK45eCCfTBAxHk1UzgfzcZQNYrGv9qoTaKTLE1g94VWLjW9RJ4mW6yyL7DRB/aDP3d4KL+xc6AxMsQ8jvZpgTg0Phk2YS1VPSTBlybbzfOXmFsiOXhSujgwrUGaVP5Q4hwBVDidRKKEoHLI+pnZ0zxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R0zcB4JH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R0zcB4JH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe5574cb9so626036f8f.3
        for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777280034; x=1777884834; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nn2wJIGRY+crFZKAPwjDcRgbUW7V+wi7su4exIbXb2M=;
        b=R0zcB4JHg4sRaqDZ+8DGDRV8hO3K3fCmPsGLUv1fwESj4+jRhyMT20Tht6FAjwxqtg
         armV75UWK4cDcpAkgjvCM6+iVA2ZDfuFO8fGbaKiyoo1i1RECYGkCVBUTM7D4fMPKUHe
         f25oohFOzNw0V1L9KK2mjBVwLWgtT4ZqJZVht+mlQfVmDBKy/AKck+mBsHsma76zGsmd
         PgLAsr4XILsAX1VxzO8mCDHcp+yKOo+A9GuVTqpzRB4B0hMebiAzyZmMK2MWxl2OWKYz
         0h8sLsfXo+RxWHE4EGhet+XzAuzfVYnMN1a7iWhRe8mQ2PydHfNhmicLB0riknAFChxN
         QVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280034; x=1777884834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn2wJIGRY+crFZKAPwjDcRgbUW7V+wi7su4exIbXb2M=;
        b=AXfk/YvEjYvjxN+18mX7ovDRWuKk4zWR05uc3CMq53C4j4fOS6tQRFquDGaYAo5XgG
         0Nd4EkNGjbVhVWu7Vhel2CYnX++eW2uedG1BJMhEbxEndkwIj6DAfgdNIQKzaZnsst9N
         lzh1KFjOLFSbYNFrrxFj/PhMInUGB/FiuTr2J2N7WdNNusUTfJWBxDAWJ2u22xzvQWYY
         qEuhf2uw97VU9usP2E4vTCf7lr32hspo24aF3oAh3vEOO2f3Ag78byeH11XEZd9rrBu2
         OED3eov6ZNnQdnH9i2aCXxkg99QnIGdIOHo840faEaN9NMJzdS1EgOv3Q4m1i4hnZ1zS
         +sQw==
X-Forwarded-Encrypted: i=1; AFNElJ+MZWyMaoYs68dJA3p2ahbyk3RM6iVM1ZsO2+TO2qrsghveyOMFvA6GG3wGyNKtFGcdHinAUdI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4akXorZaUSRKf6ip76OUsUQNf1wWuzVvv1F3muVWFtgYcnzSW
	Bl4dN4CbVnced+f4OtbqBLG7RCJvvv/z61k+0LNTVIun5suSsvlTTwe8lVTRq4syKZ4=
X-Gm-Gg: AeBDieub+u8hE4CzedXj4vO9Se9GYYS/HgTKui580S3VJvLhIJwBSOmb4xCKQQ3Fnlm
	3MaBRHYyWHJk/zY+4qUJ9BFzVZuEevZfMc7I/3wTQShQFRGXM2sunuDKVOqmc9L9dpZ8DSg0kT0
	kfF73y9G0ewz1IesI6w8h4F3KF//waGjbc1MYbzHwYBdzZ5Awnw5sk11VLGnfFFrliAQeQbyizs
	M9Ey+Sxj92DCG6o2c7tamtRHkfgUc3GCqF7/Ol/nVkMlZsinbQkQZKlignseJLEoV5COe+9vRM5
	OvfdaJvQmjQRlp/dfEV0el+Futba005D+l9hddtWT4PvAYGWObBTpUymHWJRxx4IypySxxU6rgF
	3XpphFsiTK0tt+Em8/rB3/j/kt0Ap9b00k0w02baabVQavSOUuSOEfCCz1yfddF4lJnLOXDe66M
	VqofDv9e+WGCikWU7F01VxUViDGWWECF1yA9/mGaAd1gphuGNNYM6gjDzHxi62qLsgXt1/
X-Received: by 2002:a05:600c:154e:b0:487:17d:d0bf with SMTP id 5b1f17b1804b1-488fb769fb4mr267995825e9.6.1777280034268;
        Mon, 27 Apr 2026 01:53:54 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm248233245e9.30.2026.04.27.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:53:53 -0700 (PDT)
Message-ID: <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>
Date: Mon, 27 Apr 2026 10:53:52 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm] c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Uladzislau Rezki <urezki@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
 Hao Li <hao.li@linux.dev>
Cc: Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org
References: <202604211323.fac1b29e-lkp@intel.com> <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au> <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au> <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/26 05:34, Herbert Xu wrote:
> On Wed, Apr 22, 2026 at 10:32:16AM +0200, Uladzislau Rezki wrote:
>>
>> We have added non-sleeping flags for vmalloc() to extend kvmalloc()
>> functionality as folk need those.
>>  
>> Another option, would be: always use vfree_atomic() from the kvfree()
>> path.
>>  
>> Any thoughts?
> 
> Perhaps add a kvfree_atomic that just calls vfree_atomic?

kvfree()'s comment says

" * Context: Either preemptible task context or not-NMI interrupt."

so this is neither. It might be ok then to create kvfree_atomic(). Always
using vfree_atomic() from kvfree() might be wasteful.

> For rhashtable it really makes no difference either way.  But it
> would eliminate the unsightly call to is_vmalloc_addr in rhashtable.
> 
> Thanks,


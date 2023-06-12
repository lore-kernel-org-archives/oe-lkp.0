Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9218AF3
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686574799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MHUCM5KT8vM2xB13XAxxl/4rNAKHKdVp2VNq4kQ1aI=;
	b=PJnTVZGLzRDFQrJKTLrDpK6mIKC+UfhBybrW/1JTHQ98Voeo5WwrTYkEd8lholoXclkpL/
	vQUSnjs8j5/XP/+hQUbIPX7M80VwO8peaiJIg6EluiiU0l4bobmDCypPjFINv3rPv7wQtY
	jqA1EeK7UO7jMcrm7I8QTKodNwQyQsk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-w34wH9zkOTyc67Uuq3FKbw-1; Mon, 12 Jun 2023 08:59:57 -0400
X-MC-Unique: w34wH9zkOTyc67Uuq3FKbw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f7eb415010so19357515e9.0
        for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 05:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574796; x=1689166796;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MHUCM5KT8vM2xB13XAxxl/4rNAKHKdVp2VNq4kQ1aI=;
        b=jWZJWHP/6kHmodcMxzeU8DPCzdm9QRP1VGhuAWlHVC7J/peh3990Z+uKSDucW2F8e7
         qVKvzR1xyy5jSycqJD/MKIw9r1VxiXLZxVQD85NvbSHqpcPaxYNDwX+o59xTLo9ojIXK
         haDQg/Y3POrvuzu5ABL7oj+kKW70UZvdOHZXcJMcX5iG81Lbf0r2fzVVAUUVXaVJW8LN
         4m1/WgbpTzPANTgdZLKHEQOQozf1UoDpdXQbC4mrhaWokdcR6EiUAr6UK50UhwYTuJsQ
         DSnFcdGX47AVX70TuMLNPLiLUZqWjl0jka5rJRpgreWC2nhZpd5MpPd/XCtnb8dhgWlp
         aMGg==
X-Gm-Message-State: AC+VfDxgwEP3sbuG90C+LorTuhuzH50QPDORjlSbgLpVzNGiNQcceIW/
	pKY5ct60Q1WJex5+q+cjdfFpBiYr5KP1UoQr6GgZm7pOCK5OP+6BY9ez9/HhvSD5p3UnV6vMeq1
	AKtJDplrCsm235rTf
X-Received: by 2002:a05:600c:254:b0:3f7:16dd:1c3b with SMTP id 20-20020a05600c025400b003f716dd1c3bmr9611754wmj.10.1686574795974;
        Mon, 12 Jun 2023 05:59:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7t7eCEsEhz8aFffMmzZUfTSv7eBfjsqj66k61LJGWeNANSXO2kcMvJLq8CANmmXe5IWR0rCA==
X-Received: by 2002:a05:600c:254:b0:3f7:16dd:1c3b with SMTP id 20-20020a05600c025400b003f716dd1c3bmr9611730wmj.10.1686574795586;
        Mon, 12 Jun 2023 05:59:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e? (p200300cbc74e16004f6725b23e8c2a4e.dip0.t-ipconnect.de. [2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c22ca00b003f427687ba7sm11309701wmg.41.2023.06.12.05.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:59:55 -0700 (PDT)
Message-ID: <080538f2-defc-2000-c9f2-fb520448c93c@redhat.com>
Date: Mon, 12 Jun 2023 14:59:53 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [axboe-block:for-6.5/block] [block] 1ccf164ec8:
 WARNING:at_mm/gup.c:#try_get_folio
To: David Howells <dhowells@redhat.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>,
 Hillf Danton <hdanton@sina.com>, Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org
References: <202306120931.a9606b88-oliver.sang@intel.com>
 <108491.1686573741@warthog.procyon.org.uk>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <108491.1686573741@warthog.procyon.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.23 14:42, David Howells wrote:
> The attached test reproduces the problem on a loop-back mounted file
> containing a UDF filesystem.  The key appears to be the consecutive DIOs to
> the same page.

The first DIO messes up the refcount (double-unpin?) such that the 
second one detects the refcount underflow when trying to pin the page again?

-- 
Cheers,

David / dhildenb


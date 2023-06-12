Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252121CF2
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686593750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5DZgHucTuBubeLhV3T9WqifJUJkPozlNW7FILd0G0A=;
	b=SdMkpigAwcDPvpXRDF1hefiFaEFLM4muavi5Df9ud3sniZbDgcL9eYEL4yiSwTJ0Jj6lro
	Xp23KPuck3yMknTx6dhjrIkqgiSHEP5HgXbpevNXTLSIfcPxPMw9an06rElpvgP3LWK884
	ea0mf2rIGJ6/trgDNAlwwq22C5omNO8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-aPOcyqL_Ou6q0KI-XWTWMg-1; Mon, 12 Jun 2023 14:15:47 -0400
X-MC-Unique: aPOcyqL_Ou6q0KI-XWTWMg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30fb891c5e3so3374100f8f.2
        for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 11:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593746; x=1689185746;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5DZgHucTuBubeLhV3T9WqifJUJkPozlNW7FILd0G0A=;
        b=VK4DczmC24XH46kGH0M9wz+v3rmEFR3GO7XxY8CxConkQP0iBUT0vFAntqrx7FcZrF
         MdEf5G+XtVpGvYCTr/6ewMY2AnqrtODYMXtI9Xa4ZjgRb1qqTjMUsfQ6OxkXmX2mOKNz
         WZ+4UKM/Gj3kT+5+CU9lHsU454ArdxEKSZXBZ9WsOprO0REos/P3eXM96yHUoAupftoz
         SD3Jl/jBugdzzMdiEjmoTxD05CW9R7US3ua/CS7yaqhGDtKelTzNdU8sbRyPeXovMzdi
         3YrUfakDKQ0z217lH5cPDN5iYkghnWdBHEzpJZslxRefMxyTx5QzxbO3ljdZyvUc9kqr
         M0Ag==
X-Gm-Message-State: AC+VfDw0LnuaVbm4jdhaJi+p3r7U3Sblj74Go8W0pjc5NhmtI36JqxDB
	a3e7IRuYIdus1dF5nUG1dxEJNnuymbbm43H8J0/4bmkSRLrJ3Jm/3sQxf1sgi+BZIyPLVVUBnHB
	c8MB4BZzHekUwGvii
X-Received: by 2002:a5d:6b8c:0:b0:30a:c35d:25d3 with SMTP id n12-20020a5d6b8c000000b0030ac35d25d3mr6431413wrx.52.1686593746407;
        Mon, 12 Jun 2023 11:15:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vSJr5Y6QIGD0ooXcXeEUw4NT/u47qGHunnQVuPOGrua/j9c7bMtcp+N6ji7WfRrnO5DpVNA==
X-Received: by 2002:a5d:6b8c:0:b0:30a:c35d:25d3 with SMTP id n12-20020a5d6b8c000000b0030ac35d25d3mr6431395wrx.52.1686593746063;
        Mon, 12 Jun 2023 11:15:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e? (p200300cbc74e16004f6725b23e8c2a4e.dip0.t-ipconnect.de. [2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d4d4a000000b0030fc079b7f3sm4262655wru.73.2023.06.12.11.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 11:15:45 -0700 (PDT)
Message-ID: <f50b438f-90bc-36b1-c943-18d7a4b3f441@redhat.com>
Date: Mon, 12 Jun 2023 20:15:44 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] block: Fix dio_bio_alloc() to set BIO_PAGE_PINNED
To: David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 kernel test robot <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>,
 Hillf Danton <hdanton@sina.com>, Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org
References: <431929.1686588681@warthog.procyon.org.uk>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <431929.1686588681@warthog.procyon.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.23 18:51, David Howells wrote:
>      
> Fix dio_bio_alloc() to set BIO_PAGE_PINNED, not BIO_PAGE_REFFED, so that
> the bio code unpins the pinned pages rather than putting a ref on them.
> 
> The issue was causing:
> 
>          WARNING: CPU: 6 PID: 2220 at mm/gup.c:76 try_get_folio
> 
> This can be caused by creating a file on a loopback UDF filesystem, opening
> it O_DIRECT and making two writes to it from the same source buffer.
> 
> Fixes: 1ccf164ec866 ("block: Use iov_iter_extract_pages() and page pinning in direct-io.c")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202306120931.a9606b88-oliver.sang@intel.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Christoph Hellwig <hch@infradead.org>
> cc: David Hildenbrand <david@redhat.com>
> cc: Andrew Morton <akpm@linux-foundation.org>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Al Viro <viro@zeniv.linux.org.uk>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: Jan Kara <jack@suse.cz>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Jason Gunthorpe <jgg@nvidia.com>
> cc: Logan Gunthorpe <logang@deltatee.com>
> cc: Hillf Danton <hdanton@sina.com>
> cc: Christian Brauner <brauner@kernel.org>
> cc: Linus Torvalds <torvalds@linux-foundation.org>
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-block@vger.kernel.org
> cc: linux-kernel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>   fs/direct-io.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 14049204cac8..04e810826ee8 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -415,7 +415,8 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
>   	else
>   		bio->bi_end_io = dio_bio_end_io;
>   	/* for now require references for all pages */

Does the comment still hold?

> -	bio_set_flag(bio, BIO_PAGE_REFFED);
> +	if (dio->need_unpin)
> +		bio_set_flag(bio, BIO_PAGE_PINNED);
>   	sdio->bio = bio;
>   	sdio->logical_offset_in_bio = sdio->cur_page_fs_offset;
>   }
> 

-- 
Cheers,

David / dhildenb


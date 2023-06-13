Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E933C2A
	for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686641467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0vScxj5YMa+K+40jeVOVL1oOtwkyiQd/IWuuzvGGDI=;
	b=Gp5ygcAlbCjRHkGSTI7VccPp519efH7NcerVI8W3+2IvE4MIp5KwFEkD8qir5WRgBXAIj+
	mPGS0IUtYrjtrif3pXW1yV/tfg9Ldhdlzwds0gh5isCGT5wHtdD1K05SXd4IRD2GUbh5iM
	cVrFqqdk+7jQd0jVcRmCgcEC3zbKDuY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-6anKtuw9M0qzEHEUQZ1LFQ-1; Tue, 13 Jun 2023 03:31:03 -0400
X-MC-Unique: 6anKtuw9M0qzEHEUQZ1LFQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30e3fb5d1a4so1990305f8f.3
        for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 00:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641462; x=1689233462;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0vScxj5YMa+K+40jeVOVL1oOtwkyiQd/IWuuzvGGDI=;
        b=iV9/vFCowWsE7IC95h8oY8cYI1/APSc2t91Kfc3VreUECJXbe/BRyrCLG6enoG7h2n
         04S/avArrIv6m429q7Ol++nKwK/dmj0Tv7Lcw/5GLl8tkPyOW9qprwIJ3fiiPOI388NF
         W5AXhgadvBoy7hjJai0NbmzC6JDjnVWDMr1FyvuF0vgeNQaBikHTtVRWs5w8eGBGYW1g
         S6TE8BuU8A0x6gSBDHt4ls+FXT1QA85G6viYP7i+hcuXXM4bf90PNXtsIhXa+1EWwUsJ
         EkOD8JkL4z3uM3fG2l5DKiiT59M++ejnmvtBPfW0PnMAxgex2NqRYkaRINb1a6vagQM2
         ++Jg==
X-Gm-Message-State: AC+VfDyUuaXUOPnDfpm5YaaUFnsGcu5JXGorPOsC6/mlQ0xq1/bYFfQT
	12hN4PZIox9YGDSIVWJYkHgN9rcOaTVErxCzUm6v4fkeeC/tUCc+SQvrAbBJwX57NgUkUJc+SmV
	e3OqOtwHimedW8q2v
X-Received: by 2002:adf:f042:0:b0:30f:cf6b:4982 with SMTP id t2-20020adff042000000b0030fcf6b4982mr261180wro.62.1686641462575;
        Tue, 13 Jun 2023 00:31:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5CTFZVdIdiMBJTa4yPNgw1OdLhPXmCNTDxDHv57xIkOk0hRvQBsdz1yvdn7YhXRQMeaWwtxg==
X-Received: by 2002:adf:f042:0:b0:30f:cf6b:4982 with SMTP id t2-20020adff042000000b0030fcf6b4982mr261154wro.62.1686641462242;
        Tue, 13 Jun 2023 00:31:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:ff00:1a06:80f:733a:e8c6? (p200300cbc710ff001a06080f733ae8c6.dip0.t-ipconnect.de. [2003:cb:c710:ff00:1a06:80f:733a:e8c6])
        by smtp.gmail.com with ESMTPSA id b10-20020adfe30a000000b00300aee6c9cesm14561038wrj.20.2023.06.13.00.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:31:01 -0700 (PDT)
Message-ID: <5aed54c8-45e3-e05e-ccfd-a177df41c4a9@redhat.com>
Date: Tue, 13 Jun 2023 09:31:00 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] block: Fix dio_bio_alloc() to set BIO_PAGE_PINNED
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
References: <545463.1686601473@warthog.procyon.org.uk>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <545463.1686601473@warthog.procyon.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.23 22:24, David Howells wrote:
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
> 
> Notes:
>      ver #2)
>       - Remove comment on requiring references for all pages.
> 
>   fs/direct-io.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 14049204cac8..5d4c5be0fb41 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -414,8 +414,8 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
>   		bio->bi_end_io = dio_bio_end_aio;
>   	else
>   		bio->bi_end_io = dio_bio_end_io;
> -	/* for now require references for all pages */
> -	bio_set_flag(bio, BIO_PAGE_REFFED);
> +	if (dio->need_unpin)
> +		bio_set_flag(bio, BIO_PAGE_PINNED);
>   	sdio->bio = bio;
>   	sdio->logical_offset_in_bio = sdio->cur_page_fs_offset;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


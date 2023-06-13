Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217A23DB
	for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 15:48:21 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33bcc8f0d21so3739175ab.1
        for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1686671300; x=1689263300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSrctI8rg8I7twHK6Nil4YKzI1pYE/l9OdmquxynZq4=;
        b=1IxMrX8EdCYYXT8z4R8g5xqadrCypUsYWgg41u3N/dlybwXZJu7zAUDrBeN4GL449o
         +8RfTGMi6r5QikoO/a1XC8JEDxdc4ILd/eIp3FOAFEcyMBjAKLVIAkG6aaCp1B/0GAh5
         h4DCxWuoSl72Xf9hJ3tYHUmZxuCN11luuhQkBuupPRWrUiybaDDE83+lfAmhfszwQVZC
         tYqtRCdXcBg8+M/hPoMUyTQcoGw2bipRmg3f7WRV2QYo7ekDRaCHO+HWJdf5M1zAQKRy
         wsaurWEurnvuCie8fqVMgUxsHgVftMVS9XSbnCorlXIG/gNuD/libC/nNCKEBg/dxtq/
         JoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686671300; x=1689263300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSrctI8rg8I7twHK6Nil4YKzI1pYE/l9OdmquxynZq4=;
        b=lREqd24H6d4Kywd7Gk4IJgHJAWIS2h51XeM+wNmfne7+RJvwolG5U/12pOkgBcb40j
         AiX7YQacc2d/ENANU1c4usKZ1XXM91r6aFAMe1ioLCQThqp9Pxbwl5fPRXS/hBPWdZdU
         y2D12TGEFiw65UhCAKFh+lCDFZ3OdnUGvKXZiLGr/br8WLdEWuqJeh/EtVh6NGtI5ird
         9cUzVPAwzJpyn5oLp/2Pz18f1iMuJPngl3Xs0/REeX1fKNiv3GxjhJJLWkj43AcE6BFt
         /DwUC+D7oSS4N65Z/wzUYRl+TniMZg23y4qDUCwyvw7kpwttLEHU4zfHOOMJ28i/PNm6
         Ekbw==
X-Gm-Message-State: AC+VfDxQL91di5JsO7stF39OIgX8sQsRky8eOWmPiABQBB0LAnF66Ab6
	LANOhjjd+Net8dfDjLG0rg3r4g==
X-Google-Smtp-Source: ACHHUZ5StGBwUyOjFSA4oiFTpuXR+sgEyx4jlxweuyIJg1gEkVnyybc/DjDXsTvbpm397ZVPBanKkQ==
X-Received: by 2002:a05:6602:1789:b0:777:b456:abbe with SMTP id y9-20020a056602178900b00777b456abbemr7180557iox.0.1686671300719;
        Tue, 13 Jun 2023 08:48:20 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id h24-20020a02cd38000000b004145ebbf193sm3468444jaq.51.2023.06.13.08.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 08:48:20 -0700 (PDT)
Message-ID: <491da795-e9e0-1d84-558b-df09063228cb@kernel.dk>
Date: Tue, 13 Jun 2023 09:48:18 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] block: Fix dio_bio_alloc() to set BIO_PAGE_PINNED
Content-Language: en-US
To: David Howells <dhowells@redhat.com>, David Hildenbrand
 <david@redhat.com>, kernel test robot <oliver.sang@intel.com>
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
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <545463.1686601473@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/23 2:24 PM, David Howells wrote:
>     
> Fix dio_bio_alloc() to set BIO_PAGE_PINNED, not BIO_PAGE_REFFED, so that
> the bio code unpins the pinned pages rather than putting a ref on them.
> 
> The issue was causing:
> 
>         WARNING: CPU: 6 PID: 2220 at mm/gup.c:76 try_get_folio
> 
> This can be caused by creating a file on a loopback UDF filesystem, opening
> it O_DIRECT and making two writes to it from the same source buffer.

What is this against?

-- 
Jens Axboe



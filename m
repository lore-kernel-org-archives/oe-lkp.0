Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F013C3B
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 06:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686550747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zR6k3vMJTPH3xKL4v/z/wsx8OedHdvcs9Mf/qAS1BEg=;
	b=LrGHA6v7GluKUEHrSfoDICiWghZz1G1BY5ms+tro2piVK57Rqv/YP6hN+zj0OUc/jA31Km
	ah1QWoMUVaPZBf6/NzOLGKwASRB6QlQlQb4q8eIN3MljHkFBAwlkcRRUnE9gVVmoC2RCvs
	9ygqzfbcE31sUVYYoP47zMwH9g4Php8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-fAAhX15MO0KuycMcRaSQTw-1; Mon, 12 Jun 2023 02:19:06 -0400
X-MC-Unique: fAAhX15MO0KuycMcRaSQTw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30e4d11a413so1513765f8f.1
        for <oe-lkp@lists.linux.dev>; Sun, 11 Jun 2023 23:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686550745; x=1689142745;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR6k3vMJTPH3xKL4v/z/wsx8OedHdvcs9Mf/qAS1BEg=;
        b=Jj5LnVLPwCc8iSLM/Lx/iybcWHYRzOWzk2B4TjPSC0lj8fJ/fo0EfjLpj9TcVAE6ad
         6DtRuwSWVrfja3qwMkeiCdvguvWlV2FaIkx0tKetRDzjTCQhRiYjCg0191Mnh7rkh4E2
         ykWADLKsAu7ih9Au5w4zvbzDIOxeAxO/BCkOAKJhSkSXSynyxT0Yza9UIdG6WiIqy8xA
         oq5DN6NcLV5gmRHDlFfEnTY0z5V6tFJRW5fh6WpXAtZvvMCkHp5U+7IfIzq+nBgjNMvG
         31iQyuVhs52PZ81L8AqGgbNZ29bUuDIL6lOeRFMMYqgq5DERoVq2ui6W1HjrSYiSR3VM
         MGDQ==
X-Gm-Message-State: AC+VfDz+57XNdsGWsZhmIeO/piorHa7X+nEi6rsEmkgNoTkABjLGBsjl
	3UOYBBskFcmHtkAulhw+Ot/ii2I3WXMIPVrxeJwW/NP0aMoI97wsulWJ4+nUNvD/fvtDyraYSYd
	brn2bJeV3SsAbFfED
X-Received: by 2002:adf:e252:0:b0:30c:2b30:ec82 with SMTP id bl18-20020adfe252000000b0030c2b30ec82mr4158698wrb.18.1686550745451;
        Sun, 11 Jun 2023 23:19:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aYWnu9qdVctep8Bbpospy3q7fEGmG/5MsIKhesIiZ7Y+14Yic8NJNBcLrDmAeKAb7BOv68w==
X-Received: by 2002:adf:e252:0:b0:30c:2b30:ec82 with SMTP id bl18-20020adfe252000000b0030c2b30ec82mr4158669wrb.18.1686550745031;
        Sun, 11 Jun 2023 23:19:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e? (p200300cbc74e16004f6725b23e8c2a4e.dip0.t-ipconnect.de. [2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e])
        by smtp.gmail.com with ESMTPSA id d8-20020a5d6dc8000000b0030aec5e020fsm11324649wrz.86.2023.06.11.23.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 23:19:04 -0700 (PDT)
Message-ID: <63868def-9a92-3b0f-4369-160a18b447ee@redhat.com>
Date: Mon, 12 Jun 2023 08:19:02 +0200
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
To: kernel test robot <oliver.sang@intel.com>,
 David Howells <dhowells@redhat.com>
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <202306120931.a9606b88-oliver.sang@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.23 03:54, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_mm/gup.c:#try_get_folio" on:
> 
> commit: 1ccf164ec866cb8575ab9b2e219fca875089c60e ("block: Use iov_iter_extract_pages() and page pinning in direct-io.c")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-6.5/block
> 
> [test failed on linux-next/master 53ab6975c12d1ad86c599a8927e8c698b144d669]
> 
> in testcase: xfstests
> version: xfstests-x86_64-06c027a-1_20230529
> with following parameters:
> 
> 	disk: 4HDD
> 	fs: udf
> 	test: generic-group-45
> 
> 
> 
> compiler: gcc-12
> test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202306120931.a9606b88-oliver.sang@intel.com
> 
> 
> [  121.986791][ T2220] ------------[ cut here ]------------
> [ 121.992093][ T2220] WARNING: CPU: 6 PID: 2220 at mm/gup.c:76 try_get_folio (mm/gup.c:76 (discriminator 1))

I assume we have a refcount underflow (but could be an overflow?). Maybe 
we used unpin_user_page() on a page not pinned via pin_user_pages() ?

-- 
Cheers,

David / dhildenb


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92073D3A7
	for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686692037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sq4Gobht14PLhIrlUF3qoMat2z47BnhfNavxp+vbMx8=;
	b=K3FCIKNEW63PzhYuejzivwTMYKrhSiz/UafoJ7g4cGxw2F5fIw7B5d/zRoDqJkjayZXQv5
	JBiAdu9FuNsUu+tJzEuXUxTKzryZEKuVc1pTskITVtK0980PT9TcVy0140WOnZMvdkEgcJ
	70R2xbg19Urk2EeKauL8dRuT7E29ShM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-n-lhBdEfO5-ebbjiGfLzWQ-1; Tue, 13 Jun 2023 17:33:52 -0400
X-MC-Unique: n-lhBdEfO5-ebbjiGfLzWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5184F1C0512F;
	Tue, 13 Jun 2023 21:33:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7C0B140E951;
	Tue, 13 Jun 2023 21:33:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <f50b438f-90bc-36b1-c943-18d7a4b3f441@redhat.com>
References: <f50b438f-90bc-36b1-c943-18d7a4b3f441@redhat.com> <431929.1686588681@warthog.procyon.org.uk>
To: David Hildenbrand <david@redhat.com>
Cc: dhowells@redhat.com, Jens Axboe <axboe@kernel.dk>,
    kernel test robot <oliver.sang@intel.com>,
    Christoph Hellwig <hch@infradead.org>,
    Andrew Morton <akpm@linux-foundation.org>,
    Al Viro <viro@zeniv.linux.org.uk>,
    Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
    Jeff Layton <jlayton@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
    Logan Gunthorpe <logang@deltatee.com>,
    Hillf Danton <hdanton@sina.com>,
    Christian Brauner <brauner@kernel.org>,
    Lorenzo Stoakes <lstoakes@gmail.com>, linux-fsdevel@vger.kernel.org,
    linux-block@vger.kernel.org, linux-mm@kvack.org,
    oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: Fix dio_bio_alloc() to set BIO_PAGE_PINNED
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1156282.1686692027.1@warthog.procyon.org.uk>
Date: Tue, 13 Jun 2023 22:33:47 +0100
Message-ID: <1156283.1686692027@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Okay, it isn't this.  The problem appears to be that __blockdev_direct_IO()
calls dio_cleanup() twice if do_direct_IO() fails.

David


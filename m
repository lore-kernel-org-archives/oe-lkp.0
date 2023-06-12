Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3F11C83
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686573752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ulHVPL3pXPIo5RmxEBnndl9GfORZdMhAtvNQZYsRb4=;
	b=POAL5Dznb0URbg/eyq4kzYc6cXniAypvXPSV6eDz6sJCqgzMiq/09kBDCgjl9/GxEFe7QH
	/SnFgTuE4j6teIiFoxpLT051wZaeb0/pLe9/80rpAf3pAdShCI4oFqcMjGlwvFHLHeOjfr
	tWoi5zth17lNkpJB8/rYhn2t6ltX6fM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-0Iji5oMiMg2ltILwVs-T_Q-1; Mon, 12 Jun 2023 08:42:28 -0400
X-MC-Unique: 0Iji5oMiMg2ltILwVs-T_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EBD21019CA2;
	Mon, 12 Jun 2023 12:42:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9059F40D1B60;
	Mon, 12 Jun 2023 12:42:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202306120931.a9606b88-oliver.sang@intel.com>
References: <202306120931.a9606b88-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: dhowells@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com,
    Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
    David Hildenbrand <david@redhat.com>,
    Lorenzo Stoakes <lstoakes@gmail.com>,
    Andrew Morton <akpm@linux-foundation.org>,
    Al Viro <viro@zeniv.linux.org.uk>,
    "Matthew
 Wilcox" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
    Jeff Layton <jlayton@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
    Logan Gunthorpe <logang@deltatee.com>,
    Hillf Danton <hdanton@sina.com>,
    Christian Brauner <brauner@kernel.org>,
    Linus Torvalds <torvalds@linux-foundation.org>,
    Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org
Subject: Re: [axboe-block:for-6.5/block] [block] 1ccf164ec8: WARNING:at_mm/gup.c:#try_get_folio
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <108490.1686573741.1@warthog.procyon.org.uk>
Date: Mon, 12 Jun 2023 13:42:21 +0100
Message-ID: <108491.1686573741@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

The attached test reproduces the problem on a loop-back mounted file
containing a UDF filesystem.  The key appears to be the consecutive DIOs to
the same page.

David
---
#define __USE_GNU
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <err.h>
# define O_DIRECT      040000

static char buf[256 * 1024] __attribute__((aligned(512)));
static char *filename;

static void cleanup(void)
{
	if (unlink(filename) == -1)
		err(1, "unlink");
}

int main(int argc, char **argv)
{
	size_t page = 4096;
	int fd;

	if (argc != 2) {
		fprintf(stderr, "Format: %s <file>\n", argv[1]);
		exit(2);
	}

	filename = argv[1];

	fd = open(filename, O_RDWR | O_CREAT | O_EXCL | O_DIRECT, 0666);
	if (fd == -1)
		err(1, "%s", filename);

	atexit(cleanup);

	if (pwrite(fd, buf, page, 0) != page)
		err(1, "pwrite/1");

	if (pwrite(fd, buf, page, page) != page)
		err(1, "pwrite/2");

	if (close(fd) == -1)
		err(1, "close");

	return 0;
}


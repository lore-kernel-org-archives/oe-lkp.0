Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935C156FE
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQs875zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700052529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFEdAC3yS3fukStfiQ/KxalSWdJSJaS6HL2miwuT1M8=;
	b=DQs875zRpQcUPLoDHX1IZHyXIce3ZRFyImU/wT0ghLsyewfEAjRbFlVc3O3rZRn4jsyB4U
	fdupsL7XrkOnCDOxuedK9zsRt7uoz+hOzoKVaF7FEf8DwUCEb+uB6QVfKSccBmDojLWyqe
	sPH/M7GbCu4wI5FB3nJahKi4kTxl6tY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-SjmSY5dlMEGHutWxNc2ztQ-1; Wed,
 15 Nov 2023 07:48:45 -0500
X-MC-Unique: SjmSY5dlMEGHutWxNc2ztQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2A7C2808FC3;
	Wed, 15 Nov 2023 12:48:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF78C492BFD;
	Wed, 15 Nov 2023 12:48:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202311061616.cd495695-oliver.sang@intel.com>
References: <202311061616.cd495695-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: dhowells@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com,
    linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
    Christian Brauner <christian@brauner.io>,
    Matthew Wilcox <willy@infradead.org>,
    Linus Torvalds <torvalds@linux-foundation.org>,
    "David
 Laight" <David.Laight@aculab.com>, ying.huang@intel.com,
    feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput -16.9% regression
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3851105.1700052520.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Nov 2023 12:48:40 +0000
Message-ID: <3851106.1700052520@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

I can't run the test program:

andromeda1# bin/lkp run ./job-300s-256G-msync.yaml
grep: /root/lkp-tests/hosts/andromeda.procyon.org.uk: No such file or dire=
ctory
/root/lkp-tests/bin/run-local:121:in `<main>': undefined method `chomp' fo=
r nil:NilClass (NoMethodError)

job['memory'] ||=3D `grep -w '^memory:' #{LKP_SRC}/hosts/#{HOSTNAME}`.spli=
t(' ')[1].chomp
                                                                          =
       ^^^^^^

David


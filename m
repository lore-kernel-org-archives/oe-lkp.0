Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA202CCAD
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyeLf+R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700129653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/qSf17nLKwBzvhXGOsVf7cFolqlSlgq1S8Xm68Mw6Xg=;
	b=hyeLf+R4rDMgBo07tU9eg0BwfioTv8ZmJfI4Z3OdL2ezUwNuRdVR/lOAWxDjdDFVza9xsE
	kdxxdeMzLbNNHGylQtPI+29xbzN8GZwtptO9dfmKT04fUV0bAjsQZ4hNMdAkV5vNVduyzJ
	A27OkM/rUZIR1G4Ujd/Cf2dlhDxzHKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-dMjoYVQONpiGjZaMrqRBHA-1; Thu, 16 Nov 2023 05:14:08 -0500
X-MC-Unique: dMjoYVQONpiGjZaMrqRBHA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07D0C101A529;
	Thu, 16 Nov 2023 10:14:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99618492BFD;
	Thu, 16 Nov 2023 10:14:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <4c0c3ee6cfa84d21a807055bc1aa27b8@AcuMS.aculab.com>
References: <4c0c3ee6cfa84d21a807055bc1aa27b8@AcuMS.aculab.com> <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk> <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com> <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com> <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com> <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local> <CAHk-=whFW+uWOmOtRNh0What_fu8Xo8KF2+EeUH1kn4qFxGAhA@mail.gmail.com> <CAHk-=whrc-ruKs4Kt90EGzKd+pYhZFKs6bgBVCV=55BK+p1nzg@mail.gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: dhowells@redhat.com,
    'Linus Torvalds' <torvalds@linux-foundation.org>,
    Borislav Petkov <bp@alien8.de>,
    kernel test robot <oliver.sang@intel.com>,
    "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
    "lkp@intel.com" <lkp@intel.com>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
    Christian Brauner <brauner@kernel.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
    Christian Brauner <christian@brauner.io>,
    Matthew Wilcox <willy@infradead.org>,
    "ying.huang@intel.com" <ying.huang@intel.com>,
    "feng.tang@intel.com" <feng.tang@intel.com>,
    "fengwei.yin@intel.com" <fengwei.yin@intel.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput -16.9% regression
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <97467.1700129643.1@warthog.procyon.org.uk>
Date: Thu, 16 Nov 2023 10:14:03 +0000
Message-ID: <97468.1700129643@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

David Laight <David.Laight@ACULAB.COM> wrote:

> On haswell (which is now quite old) both 'rep movsb' and
> 'rep movsq' copy 16 bytes/clock unless the destination
> is 32 byte aligned when they copy 32 bytes/clock.
> Source alignment make no different, neither does byte
> alignment.

I think the i3-4170 cpu I'm using is Haswell.  Does that mean for my
particular cpu, just using inline "rep movsb" is the best choice?

David


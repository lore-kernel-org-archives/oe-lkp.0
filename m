Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00B4156C6
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZ7IYgJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700084627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0sd3KVgqm2Hr+/w0M78+lQuRWNqCNiH7NNttu2olag=;
	b=GZ7IYgJqP04NaiArDOCOyOJ6bCQUwaScIjBVXZyznJtjKuo5SYtIJyhHFPwbuzQ7516iN7
	3sHRjto6QI0gsCgmhrfOmR/kCwuLIL8AhQslHK2WR1Ia0abf5R7gjBPnRp/ihwEm4wnLCo
	8qNl2ZREqX2VfRMihuuvvShKg6boB1I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-roBR4RgdPHOO-T9YuhAVqw-1; Wed,
 15 Nov 2023 16:43:43 -0500
X-MC-Unique: roBR4RgdPHOO-T9YuhAVqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46BF38062A6;
	Wed, 15 Nov 2023 21:43:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE6E2492BE0;
	Wed, 15 Nov 2023 21:43:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
References: <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com> <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk> <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com> <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: dhowells@redhat.com, Borislav Petkov <bp@alien8.de>,
    kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
    lkp@intel.com, linux-kernel@vger.kernel.org,
    Christian Brauner <brauner@kernel.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
    Christian Brauner <christian@brauner.io>,
    Matthew Wilcox <willy@infradead.org>,
    David Laight <David.Laight@aculab.com>, ying.huang@intel.com,
    feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput -16.9% regression
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4097022.1700084620.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Nov 2023 21:43:40 +0000
Message-ID: <4097023.1700084620@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

I get:

  LD      arch/x86/purgatory/purgatory.chk
ld: arch/x86/purgatory/purgatory.ro:(.altinstr_replacement+0x1): undefined=
 reference to `rep_movs_alternative'
ld: arch/x86/purgatory/purgatory.ro:(.altinstr_replacement+0x6): undefined=
 reference to `rep_movs_alternative'

The symbol is available in the arch lib directory:

warthog>nm build3/arch/x86/lib/copy_user_64.o =

0000000000000000 r __export_symbol_rep_movs_alternative
0000000000000000 T rep_movs_alternative
                 U __x86_return_thunk

so I'm not sure what's going on there.

David


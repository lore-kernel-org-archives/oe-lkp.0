Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C630345
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BoTWjFUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700223011;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=FxZeqSyzArBoXMRwOJE+Ura8EkE7wjC2PJj+X2FJmxE=;
	b=BoTWjFUw9tCOpwDVJZbrN4v2FzPQVf3p9XngdDZBD5vCK+B22RB9NZ4YgcQqoOiNZ/rgOW
	Jm66d0Lo9mXvU67V/CCf2IleVfK2pVTWL3tNiY54/mv5qIoRF43p301GdCcHKzG1uoD8ZO
	5Xl2b9XpbZJ76ZM+oy1N+pmsy4r6fT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-_-crp8HjN-a76gkW3SOucA-1; Fri, 17 Nov 2023 07:10:06 -0500
X-MC-Unique: _-crp8HjN-a76gkW3SOucA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88896101A53B;
	Fri, 17 Nov 2023 12:10:05 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.39.194.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 031D1C1290F;
	Fri, 17 Nov 2023 12:10:04 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
	by tucnak.zalov.cz (8.17.1/8.17.1) with ESMTPS id 3AHCA0F12487662
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 13:10:00 +0100
Received: (from jakub@localhost)
	by tucnak.zalov.cz (8.17.1/8.17.1/Submit) id 3AHC9uis2485185;
	Fri, 17 Nov 2023 13:09:56 +0100
Date: Fri, 17 Nov 2023 13:09:55 +0100
From: Jakub Jelinek <jakub@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, linux-kernel@vger.kernel.org,
        Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Christian Brauner <christian@brauner.io>,
        Matthew Wilcox <willy@infradead.org>,
        David Laight <David.Laight@aculab.com>, ying.huang@intel.com,
        feng.tang@intel.com, fengwei.yin@intel.com,
        linux-toolchains ML <linux-toolchains@vger.kernel.org>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
Message-ID: <ZVdYE3haicxr1lF/@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <202311061616.cd495695-oliver.sang@intel.com>
 <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
 <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
 <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local>
 <CAHk-=wjGQh3ucZFmFR0evbKu2OyEuue-bOjsrnCvxSQdj8x6aw@mail.gmail.com>
 <20231117114421.GCZVdSFZ7DKtBol821@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117114421.GCZVdSFZ7DKtBol821@fat_crate.local>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

On Fri, Nov 17, 2023 at 12:44:21PM +0100, Borislav Petkov wrote:
> Might as well Cc toolchains...
> 
> On Thu, Nov 16, 2023 at 11:48:18AM -0500, Linus Torvalds wrote:
> > Hmm. I know about the '-mstringop-strategy' flag because of the fairly
> > recently discussed bug where gcc would create a byte-by-byte copy in
> > some crazy circumstances with the address space attributes:
> > 
> >     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111657
> 
> I hear those stringop strategy heuristics are interesting. :)
> 
> > But I incorrectly thought that "-mstringop-strategy=libcall" would
> > then *always* do library calls.
> 
> That's how I understood it too. BUT, reportedly, small and known sizes
> are still optimized, which is exactly what we want.

Sure.  -mstringop-strategy affects only x86 expansion of the stringops
from GIMPLE to RTL, while for small constant sizes some folding can happen
far earlier in generic code.  Similarly, the copy/store by pieces generic
handling (straight-line code expansion of the builtins) is done in some
cases without invoking the backend optabs which is the only expansion
affected by the strategy.
Note, the default strategy depends on the sizes, -mtune= in effect,
whether it is -Os or -O2 etc.  And the argument for -mmemcpy-strategy=
or -mmemset-strategy= can include details on what sizes should be handled
by which algorithm, not everything needs to be done the same.

> > IOW, my assumption was just broken, and using
> > "-mstringop-strategy=libcall" may well be the right thing to do.
> 
> And here's where I'm wondering whether we should enable it for x86 only
> or globally. I think globally because those stringop heuristics happen,
> AFAIU, in the general optimization stage and thus target agnostic.

-mstringop-strategy= option is x86 specific, so I don't see how you could
enable it on other architectures.

Anyway, if you are just trying to work-around bugs in specific compilers,
please limit it to the affected compilers, overriding kernel makefiles
forever with the workaround would mean you force perhaps suboptimal
expansion in various cases.

	Jakub


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCF468E
	for <oe-lkp@lists.linux.dev>; Wed,  7 Jun 2023 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686126748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CML4ab6B58M9ev6BpdLEEY4A76luqMMPJKhl0+/qfpg=;
	b=DDCZ3d8n3LOFaFDFOEZmwpaXX7NEhFu16PfA4cTzWW6jmnWIvwTG5SS387L+6UpwetD88D
	wIgF/hKAg5tzhkB/8sDBcYHATDbai6uOY3ayfv1XFNKw7jRVQKjIXtpLcnVruPhb3YgDEb
	5IQAp3rNSRYwP+zlmbHw5I9PTwTrbjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-NRO6IdReNw67FASQeh4QKQ-1; Wed, 07 Jun 2023 04:32:24 -0400
X-MC-Unique: NRO6IdReNw67FASQeh4QKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B50393802609;
	Wed,  7 Jun 2023 08:32:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4014C40D1B66;
	Wed,  7 Jun 2023 08:32:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZIA2L76MUoBLyfQf@xsang-OptiPlex-9020>
References: <ZIA2L76MUoBLyfQf@xsang-OptiPlex-9020> <202305260951.338c3bfe-oliver.sang@intel.com> <521116.1685091071@warthog.procyon.org.uk>
To: Oliver Sang <oliver.sang@intel.com>
Cc: dhowells@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com,
    Eric Dumazet <edumazet@google.com>,
    "David S. Miller" <davem@davemloft.net>,
    David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>, Jens Axboe <axboe@kernel.dk>,
    Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org,
    ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [dhowells-fs:sendpage-1] [tcp] 77f5a42b2d: netperf.Throughput_Mbps -14.6% regression
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2003297.1686126739.1@warthog.procyon.org.uk>
Date: Wed, 07 Jun 2023 09:32:19 +0100
Message-ID: <2003298.1686126739@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Oliver Sang <oliver.sang@intel.com> wrote:

> > Could you try running this branch through your tests?
> 
> sorry for late.
> 
> we tested the tip of below branch, as you said, it has better performance
> even comparing to the parent of 77f5a42b2d

Many thanks!

David


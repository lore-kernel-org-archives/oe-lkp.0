Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B349101CB
	for <oe-lkp@lists.linux.dev>; Fri, 26 May 2023 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685091076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgtGObo7MVZEjCL6pka0stFh+LUjlR7+Ct1D/LRpVyM=;
	b=NxCYf2b86MMH88qwHeBF6lhBH0YBEvGzJgaPbvqZUechu/35Eu9T+wrnB5rmqZigD70uup
	wSqgjnJ6VIaAZjL/Y8iYfBYlGh1kiw/40GkM+7miZVv0gjlPPoQmuG/+jSU+TZwlh6mwZu
	SFO6Bs5PNhbpNz9iG6Sy3X2IkW2FhDc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-m_jPuWO1M7KYCocyss31pg-1; Fri, 26 May 2023 04:51:14 -0400
X-MC-Unique: m_jPuWO1M7KYCocyss31pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B6E101A585;
	Fri, 26 May 2023 08:51:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C286E140E961;
	Fri, 26 May 2023 08:51:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202305260951.338c3bfe-oliver.sang@intel.com>
References: <202305260951.338c3bfe-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
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
Content-ID: <521115.1685091071.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 May 2023 09:51:11 +0100
Message-ID: <521116.1685091071@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed a -14.6% regression of netperf.Throughput_Mbps=
 on:

Okay, yes, I see something similar on my test machine.  Loopback throughpu=
t
drops from ~32Gbit/s to ~26Gbit/s with the Convert do_tcp_sendpages patch.

But! The complete set of patches is not yet fully applied.  If you look at=
 the
two patches I've put on my sendpage-1 branch[1], the first brings the
performance back to where it was before and the second bumps it up to
~43Gbit/s.

However, I don't want to push those into the network tree until support fo=
r
MSG_SPLICE_PAGES is added to all the network protocols that support splici=
ng.
I have two more patchsets in the queue and there will be a third before I =
can
get to that point.

Could you try running this branch through your tests?

Thanks,
David

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/=
log/?h=3Dsendpage-1


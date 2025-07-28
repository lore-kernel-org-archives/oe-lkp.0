Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04580B
	for <oe-lkp@lists.linux.dev>; Mon, 28 Jul 2025 20:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753735622; cv=none; b=YT0oesD0cWmKmGGe+Nu652+Jx/XqruCupBWC0tiLmSGUYDtkEfwTHPTbAbVkeiQZ6imE7XADQCHD7pelWz4IfPn+pO1krK5SdmrZOOk4qr5k5f8DSnV77Cjjfyc+h74UIcAwP+7MNvyrjBkyUNg70ab/px3jLMA5eEoEJGL9SJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753735622; c=relaxed/simple;
	bh=tihoSXX8s4sz2pnu+WV53WFHdBrRrO3an4Kd/50e7uI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=HnChW5WPwL15LhKDnoL9C8bCJaRZ+7F9A8n9fyDTUqoQptQ7V5xZ8Q4cCPhs4sTnz2Mx0djHtO7wdoL9pjeoKoBzU5k0H22Q3IE/cweawDZSTYazbYX8wEH6zwCUjOljPqk4HJ/GTbpZx7YxxvONa98BjItjXwMiyqGLM3/hixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnbeqgpM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnbeqgpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753735618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wg5ivtWALNkMBQeNS8mFnEKygIvKZPICqN0FK/djSfk=;
	b=bnbeqgpMVA6SY9QNc8IgBerlOEAXRoN3CDFHDJhD8FfPUghmKUF9efbIwUkw9S0o0APPBy
	772XlyCsJ9fXYzw5ZsV7Vdscxr+dV9Tobphp5hGS/MdYWSN8ERB6W7xBk08h2U1zC7nmw5
	CqRvHRNNhdQImvVE27iX3MbNuh5x2uo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-VGIc3EEJN_O97Psf8GkLKA-1; Mon,
 28 Jul 2025 16:46:54 -0400
X-MC-Unique: VGIc3EEJN_O97Psf8GkLKA-1
X-Mimecast-MFC-AGG-ID: VGIc3EEJN_O97Psf8GkLKA_1753735613
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F421019560AF;
	Mon, 28 Jul 2025 20:46:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.11])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 017E91800359;
	Mon, 28 Jul 2025 20:46:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <jehx7y7mwer77d2rrx323qixc456ffod3qrcssemkebjotstbh@fpklsa72lzky>
References: <jehx7y7mwer77d2rrx323qixc456ffod3qrcssemkebjotstbh@fpklsa72lzky> <202507220801.50a7210-lkp@intel.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: dhowells@redhat.com, kernel test robot <oliver.sang@intel.com>,
    Vlastimil Babka <vbabka@suse.cz>, oe-lkp@lists.linux.dev,
    lkp@intel.com, Roman Gushchin <roman.gushchin@linux.dev>,
    Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm, slab] 5660ee54e7: BUG:KASAN:stack-out-of-bounds_in_copy_from_iter
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 28 Jul 2025 21:46:48 +0100
Message-ID: <659285.1753735608@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sxkTL3UcsPDYeO7pWSDFY16bs_mfGcI6SVSGnT_-ias_1753735613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <659284.1753735608.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Pedro Falcato <pfalcato@suse.de> wrote:

> --- a/drivers/infiniband/sw/siw/siw_qp_tx.c
> +++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
> @@ -332,11 +332,11 @@ static int siw_tcp_sendpages(struct socket *s, stru=
ct page **page, int offset,
>                 if (!sendpage_ok(page[i]))
>                         msg.msg_flags &=3D ~MSG_SPLICE_PAGES;
>                 bvec_set_page(&bvec, page[i], bytes, offset);
> -               iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size)=
;
> +               iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, bytes=
);
>=20
>  try_page_again:
>                 lock_sock(sk);
> -               rv =3D tcp_sendmsg_locked(sk, &msg, size);
> +               rv =3D tcp_sendmsg_locked(sk, &msg, bytes);
>                 release_sock(sk);
>=20
>                 if (rv > 0) {

Looks good.

Reviewed-by: David Howells <dhowells@redhat.com>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51642E419
	for <oe-lkp@lists.linux.dev>; Fri, 13 Sep 2024 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214369; cv=none; b=ra28opVAd1CY4uWWCUGIerrtAtDoneSfdmolLU6oay/ivyrUYXmdWkwcnnTlFz/32NI02mhKqWkuNFxkPWO4bNKSS8ny2ELq6mMWA/WezLhyA9eqqn7GwWhitVVOyo/ckTOlR0FbPnAPIvehacoFT/yETQBgP05XTpjGjwgDPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214369; c=relaxed/simple;
	bh=kgtxvsYQ+THuJREDp/R0kMk6JWPfaY7Kq1aHhRJ3s8E=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Fl34o3L1WOIWpWCsC3syrsI2M+6U1L/xq6S35DUdUlAp/G2OIbJk/wWuUHqQz8+zTEVC6TQeomrWl4UpXtfXU6ChdmQVmSNnq7UewCRVSqFWjIKfWlFDqlyxVf1MtmgPj4t5Ms7Znw3wjAq9zkNmWjciZt5J/pWC6mVFjWXmKG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZrWw9P+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZrWw9P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726214366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyeF+/WYzR3SYi9omjxf05OynwYJxePvZ/auujDdqu4=;
	b=YZrWw9P+u1gMenN2NCaWAM6+qjo278LJbVdCNT3YfcLcmW2krBX2g14X+Zg5Q6cpFVOuEg
	el89/LLeI9RY/guSC4jKja8m0UKN4k8QFg9paRHODm90UtwCquHJ4t2AZMESt2oNDsRqnD
	LOhs2IPbSrZ3c4eNaf9PzAjMVJhWQeY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-OrTa6mQ8NEiM4VnKY-WhyQ-1; Fri,
 13 Sep 2024 03:59:25 -0400
X-MC-Unique: OrTa6mQ8NEiM4VnKY-WhyQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A94211956077;
	Fri, 13 Sep 2024 07:59:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0215C30001AB;
	Fri, 13 Sep 2024 07:59:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202409131438.3f225fbf-oliver.sang@intel.com>
References: <202409131438.3f225fbf-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: dhowells@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com,
    Linux Memory Management List <linux-mm@kvack.org>,
    Christian Brauner <brauner@kernel.org>,
    Jeff Layton <jlayton@kernel.org>, netfs@lists.linux.dev,
    linux-fsdevel@vger.kernel.org
Subject: Re: [linux-next:master] [netfs] a05b682d49: BUG:KASAN:slab-use-after-free_in_copy_from_iter
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1263137.1726214359.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Sep 2024 08:59:19 +0100
Message-ID: <1263138.1726214359@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Can you try with the attached change?  It'll get folded into Christian's
vfs.netfs branch at some point.

David
---
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 84a517a0189d..97003155bfac 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1026,7 +1026,7 @@ static ssize_t iter_folioq_get_pages(struct iov_iter=
 *iter,
 		iov_offset +=3D part;
 		extracted +=3D part;
 =

-		*pages =3D folio_page(folio, offset % PAGE_SIZE);
+		*pages =3D folio_page(folio, offset / PAGE_SIZE);
 		get_page(*pages);
 		pages++;
 		maxpages--;


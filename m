Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17AF176ADA
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jun 2024 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718956469; cv=none; b=g+zePqqsiHPAiCNjvTqeAGe8xfl2IU60EQ435KJoDKcNYn9c18JAvE7q3UiKsDABsdutf3zAJidar6/QJbI5qyPQSQzrdBXBoPJ13sQdpnhat2henQUuhehtGNfTAT5kTJdWncZoJwx6TFCawR1yppZ2BD2Z6/h6jJ/7CIyqK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718956469; c=relaxed/simple;
	bh=b9KM8dzf7dW2K9SiAyjPCtcC+FVi0XacVojqZ2RlJ6Y=;
	h=In-Reply-To:References:To:Cc:Subject:MIME-Version:Content-Type:
	 From:Date:Message-ID; b=IU6EEShPWQFEfhXvLZTdaf1J6vlWYdcz7Yh2LEju7NfppY343wGHwgPi8vhbU/K94Nx35YyXgmPRsocN0t52bQNTak1yLre85ZAiVnogh2IZJo6gsKRkM/srqKh4HrYKl+Npiv+l0Fxa8FsxPk+3eoWxuixPXQDRD4vud4IGeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8NnbqIw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8NnbqIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718956466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oDP0Ze6rJBHjNUlj9cWtihXVpgdyu03o5dDG7lNl2Ko=;
	b=I8NnbqIwyyc/vRrUXdfyeTxvbYRoRb5CKA8kZQmoo+3y5NS1bUXSAcv7v0vHRMuvxoMJrf
	tJ0GbqsYF79fh3bre/w6+znPIrlHKhAM+wJfGpHnysNriqKUAWFF+GKh+hI7iKDhlrloxU
	8NryQz4CcIro0djUgseM9OLboYUAhEs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-bYVENPH9MUSKny0J4Y60Xg-1; Fri,
 21 Jun 2024 03:54:23 -0400
X-MC-Unique: bYVENPH9MUSKny0J4Y60Xg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C7B119560A5;
	Fri, 21 Jun 2024 07:54:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E8F6B1956048;
	Fri, 21 Jun 2024 07:54:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
References: <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com> <20240617095852.66c96be9@kernel.org> <202406161539.b5ff7b20-oliver.sang@intel.com> <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me> <Zm9fju2J6vBvl-E0@casper.infradead.org> <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me> <407790.1718801177@warthog.procyon.org.uk> <0aaaeabc-6f65-4e5d-bdb1-aa124ed08e8b@grimberg.me>
To: Eric Dumazet <edumazet@google.com>
Cc: dhowells@redhat.com, Sagi Grimberg <sagi@grimberg.me>,
    Jakub Kicinski <kuba@kernel.org>,
    Matthew Wilcox <willy@infradead.org>,
    kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
    lkp@intel.com, netdev@vger.kernel.org
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <117594.1718956419.1@warthog.procyon.org.uk>
From: David Howells <dhowells@redhat.com>
Date: Fri, 21 Jun 2024 08:54:17 +0100
Message-ID: <117689.1718956457@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Eric Dumazet <edumazet@google.com> wrote:

> But the trace involves af_unix, not GRO ?

Ah.  splice()/vmsplice() can feed multipage folios into the socket.  Possibly
those can be in highmem.

David


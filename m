Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494321;
	b=jfkYaYQnIW/dPAu3GyHzUiw2vN+2lXg3HS5HX2QbUYr8/isa1/MKoIlqqIsqULolJHU6
	 LKNwhTa68vT6zTNavjc/mU0jdyDHPaokVmY6j3WmsAoywk8R71FEzdcQINg9dBZ5yfTxG
	 CqRf7uGBSwFjwz4zyTpAK+JHZzbIFSwjxg5HEsL94zeaRq/b/PeZCGByC9MJobq7r1wNL
	 pjFW3We/33DGpmHhkofFW5gcoPzay5EAXctiN/i9QY8sMx/o4oRA76dwLeHm/QUVwhmdJ
	 L0Vjcto293yRwspwi5G/j78/ovB9t8XD8Zlp9DyNRETCJMFcUwGS14HezrI0QZY6qEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494321;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=fLmuyTfd7g4VErTxnTfok7Jz/5L33bdb9HtzrWwzsMQ=;
	b=4j10+O4J1d7zQaydgb/791VkzMGxzZy9EotRRRsf2ZT8w9GWRBtYyiRAINHZUYnrcp4e
	 oaXtwAXQfL3AgXD5ieOsIUWq+9Z3vazz4Sk2OZmgYeXkJ26INxj3fv+oMq3b2rRYA6Sx8
	 D9d2BUJZxwTIOH0Yx7zuqsJ4J/TgeZ0WYc09xzW1ZEfaGfcXdyEl4MVnwYgiwfWA5eNrN
	 yoV4swW8AszheTPac1SXU1LkeLp5iMCd7zPkDgXv74omwlPeWkcteomaJa9xRESt6FHTn
	 EjRvZBFTebaKbPr2jVEzpEbiLmEAwOCpbJyPBWMipAWSvgfFsxPzZCdoAonWOF+ol2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv+IvQPP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9B606A31C
	for <oe-lkp@lists.linux.dev>; Tue, 20 Oct 2026 11:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A9B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv+IvQPP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792494315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fLmuyTfd7g4VErTxnTfok7Jz/5L33bdb9HtzrWwzsMQ=;
	b=Fv+IvQPPKCzN3V7pNMM5h5rWlWvVrtJ/Pqob+ct/k3zj9CjPV9XfA7ctNGqhKenHygYdx7
	n46lab7j1d06SgGqLtL8ka2Ji/ufKxEIdXFxY98MYY+wtFOHq7mvCX+imEQx3HOZC7kndB
	J6bQUpgAQQAvzYvyeVjCWBExb65ypGE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-m21zt0reOCemHoMKFmPGmQ-1; Tue,
 20 Oct 2026 11:05:08 +0000
X-MC-Unique: m21zt0reOCemHoMKFmPGmQ-1
X-Mimecast-MFC-AGG-ID: m21zt0reOCemHoMKFmPGmQ_1792494306
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F981180256B;
	Tue, 20 Oct 2026 11:05:06 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8D09318002B1;
	Tue, 20 Oct 2026 11:05:02 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 20 Oct 2026 13:05:05 +0200 (CEST)
Date: Tue, 20 Oct 2026 13:05:01 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Allison Henderson <achender@kernel.org>,
	kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
Message-ID: <atdK3ZkT4YqjGICq@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com>
 <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes>
 <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdE-TB8hkqcwp6g@hobbes>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atdE-TB8hkqcwp6g@hobbes>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 5veiKc9ajtWYaqU5svkN7KHjUzihbPK33kiTCB4NbxM_1792494306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/20, Joel Granados wrote:
>
> On Mon, Oct 19, 2026 at 12:52:58PM -0700, Allison Henderson wrote:
> >
> > CONFIG_SYSCTL=n.  A simpler fix might be to just handle the NULL at the
> > three call sites, e.g.:
> >
> >         rds_sysctl_reg_table =
> >                 register_net_sysctl(&init_net, "net/rds", rds_sysctl_rds_table);
> >         if (!rds_sysctl_reg_table && IS_ENABLED(CONFIG_SYSCTL))
> >                 return -ENOMEM;
> >
>
> Remember to NULL check rds_sysctl_reg_table in rds_sysctl_exit(). You
> might hit another UAF on exit if you don't.

Why? unregister_sysctl_table(header) does nothing if header == NULL.

Oleg.


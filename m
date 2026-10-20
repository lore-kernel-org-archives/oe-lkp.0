Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501799;
	b=KQSbsfdKFAiU8VLuCGDLIzSVhLhIJEHm9clXVOQJv3N06WanCpFG+EXlDHS0urE1qtWI
	 FXBKfZ+sigTmlM7Hiz42N3f2hspBWHKOoC6XNt3MW47lUI/Svygz0JdsXRW3utJCloDFC
	 2aSTpILgAKxmnc0oVLT52GES77ctRgAs1LbVhVHbHQ90X/BFeY4+pIaTCut/DCxD29Z/C
	 7bWvhv81lPqKha9iUq7jh+KHccgBO1q0hxW9ZEchlhkXR7Ol429tWyU/xlcCQwmqdBiEM
	 vrcqrjYU/7IP16f9Y3eRTAZ5RESR+HhwYs0g/rjNMhSSowKYkX8KW1DHN4U8WXSNCrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501799;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=r7db5+BopgpcFDUxO3SJq0ATIR0htP6s/SGZniIH6PQ=;
	b=idDmg5R9iCFj/6rwFKyalrDCTcMsfcJb8iqLlR8pXERY6qxbfiHWbLU2/QS7e9u+LRqX
	 C9IySV1yZETwx0xAr0tz7wprmRTVSJq3KYtFCWEIPd/RfUoMa3R0Qf3QJOAssY4hOi1yH
	 gsI8JaGVh+BR//SZrmPdPPY/raguGnFsBQrKVOTrScOIC/aWxdEhYogpo7B8ORgz3doyJ
	 nGwTjJYkNJRZWRzvvPlEHda56NNPGfKeJjRNr5xpQSlYIemJQSUeDuixnAKKkY4f2lLJu
	 9AgWMPg1EB0MEBlsFFoMs0MEnHtWEc+Cql074lBsC4phVTDZC8kBkVwJmdk5RtwOtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="E+jqSW/t";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9B606A31D
	for <oe-lkp@lists.linux.dev>; Tue, 20 Oct 2026 13:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD9B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+jqSW/t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792501797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r7db5+BopgpcFDUxO3SJq0ATIR0htP6s/SGZniIH6PQ=;
	b=E+jqSW/tFnyhl8oQW42X5FBHi8aFnsN+oKNEBakDpbjuemVOgapS0puoX8pZxnJM7dIYjW
	6NaGr5nH50J6e9xZ5JIT2aTL1d+7FFic9LQMaeqsDD/FGWUyvQUQa+Y4QMcdus9yQUV2No
	rqs4dc3GOH9QEfkymWxUwMOXTmREiUw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-GjRzZyDDNB-mlwpQ4uaVZg-1; Tue,
 20 Oct 2026 13:09:53 +0000
X-MC-Unique: GjRzZyDDNB-mlwpQ4uaVZg-1
X-Mimecast-MFC-AGG-ID: GjRzZyDDNB-mlwpQ4uaVZg_1792501791
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2A641954B14;
	Tue, 20 Oct 2026 13:09:50 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5CDEB362;
	Tue, 20 Oct 2026 13:09:47 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 20 Oct 2026 15:09:50 +0200 (CEST)
Date: Tue, 20 Oct 2026 15:09:46 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Allison Henderson <achender@kernel.org>
Cc: Joel Granados <joel.granados@kernel.org>,
	kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: rds_wq UAF
Message-ID: <atdoGiW_sHlWgOwt@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com>
 <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes>
 <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: FuRRWsThtyupv7LYUvFIc6aPwqOHBI6yiSibYybuJqE_1792501791
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

(change subject)

On 10/19, Allison Henderson wrote:
>
> On Mon, 2026-10-19 at 17:35 +0200, Oleg Nesterov wrote:
> > >
> > > But. rds_init() can also fail even if CONFIG_SYSCTL=y, after
> > > rds_sysctl_init(), so to me this looks like a bug in net/rds/.
> > >
>
> Yes that's a separate bug, so I'll send a separate fix for that.

Let me try to summarize.

If rds_init() fails after rds_threads_init() for any reason,
rds_threads_exit() will destroy/free rds_wq.

If rds_rdma_init() is called after that, and rds_ib_init() fails
after rds_ib_mr_init(), rds_ib_unregister_client() will try to
flush the already freed rds_wq.

But we have

	module_init(rds_init);		// net/rds/af_rds.c
	module_init(rds_rdma_init);	// net/rds/rdma_transport.c

and IIUC the order of these initcalls is not defined. So if
rds_rdma_init() -> rds_ib_init() is called before rds_init(), it
can do flush_workqueue(rds_wq) when rds_wq == NULL on failure.

With or without CONFIG_SYSCTL. Right?

But it seems that rds_ib_init() doesn't need to flush rds_wq on failure,
so how about the patch below? Of course, I have no idea if net/rds has
more similar issues with rds_wq.

Oleg.
---

diff --git a/net/rds/ib.c b/net/rds/ib.c
index 786f39169bc1..cde2d1bfabbd 100644
--- a/net/rds/ib.c
+++ b/net/rds/ib.c
@@ -619,7 +619,7 @@ int rds_ib_init(void)
 out_sysctl:
 	rds_ib_sysctl_exit();
 out_ibreg:
-	rds_ib_unregister_client();
+	ib_unregister_client(&rds_ib_client);
 out_mr_exit:
 	rds_ib_mr_exit();
 out:


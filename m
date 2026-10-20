Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488292;
	b=SLLmVOUytOdVKTXU/cjdJZJ3FuqKrVIRtQyV3X4VNrWudcnGMV6xsY9EphHMwFhNa/WK
	 oKxdPNGgFPVhZB2r7mEKemnJqQ8Py8sJrX66gImn28bKjhEguY6oG4afUqNeSMPMJkU0U
	 AzMxKRgAopc3Ygeg3gzTUnhMb3gi8SFhkIkSVkTq/FprycdgSMNPjvE30CL/vFwM74rkj
	 0jiXBvBeo06LUqAsNWGcC/bBMO/SWZB5v4vRAfRXScvDm5t5fB9uvNMSC+YBl41UHDynp
	 x55cVgCgPBK3nWgGnrnqB0Y3VBFUrXsAMU9gc2u2/W95abJ4zqm1j/VDJQriEJ/nBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488292;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=BznN/lY8tjRKb0k1WwnLhH6cM8dWen14mRHzzd6dYZk=;
	b=nGqMePwZcsNMMnJaZ4OYuCP0xe6kigA+50Kt8WQNzivL9Y/Uj+uCNg7Eqw78FD8RzF73
	 xwDEZoNYiQY3o0TPo1vwbQeDjUJtoBfww5/zB9QLmgwd+vAt3OsRmeJSMWvksxAp9YHte
	 6Dx86uye2mY4PL7Ulwxc96XoKUEZbOM4CpWSS6BEbannFl8v49WLXXoLsiTBlk5gRMePI
	 G7bHju2TYVmMQljEMKzZOENXbh8QecE1ZoP3YY+rrJKMnJuGg0afmdi0r++KDJCUxN+/B
	 xlwTz4EuBIOvHKA72k3AIsS8j6WWIWNb/FhkzP9fTHVjhFvfWD1mLgUZSf8UffEfutw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYVytYc+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6E60A2637
	for <oe-lkp@lists.linux.dev>; Tue, 20 Oct 2026 09:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B6E60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYVytYc+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792488290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BznN/lY8tjRKb0k1WwnLhH6cM8dWen14mRHzzd6dYZk=;
	b=JYVytYc+c+HbuuPufs/GHbVmMhIPeuepUlGMhJIb/qkkbq1Pa77Y9tLnp3LlU6XpnRDpOB
	fzPJ+Kbrr6myD1WODknYpXF8FOJdEEicO1mrDYoeM8ZzuZKzkiRIDTfUNgV7rh+UVN8tFg
	n5ADDGZcdOH6cL+jedAHnry3Mxnx6yY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-yQTXnxNLNOSym5LCND7XSQ-1; Tue,
 20 Oct 2026 09:24:47 +0000
X-MC-Unique: yQTXnxNLNOSym5LCND7XSQ-1
X-Mimecast-MFC-AGG-ID: yQTXnxNLNOSym5LCND7XSQ_1792488285
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1459F18007F6;
	Tue, 20 Oct 2026 09:24:45 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B3A68418;
	Tue, 20 Oct 2026 09:24:41 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 20 Oct 2026 11:24:44 +0200 (CEST)
Date: Tue, 20 Oct 2026 11:24:40 +0200
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
Message-ID: <atczWEzYbWO67aNd@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com>
 <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes>
 <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <atctwUB5NlRLk4Wy@hobbes>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atctwUB5NlRLk4Wy@hobbes>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: _Cvndx3xVmsSHMEh84MIRw5suM6SS7QlqBp-x9EiG2o_1792488285
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/20, Joel Granados wrote:
>
> You can also do this (also untested and not compiled):
>
> diff --git i/net/rds/ib_sysctl.c w/net/rds/ib_sysctl.c
> index 2af678e71e3c6..bc97a3eecad69 100644
> --- i/net/rds/ib_sysctl.c
> +++ w/net/rds/ib_sysctl.c
> @@ -114,7 +114,7 @@ void rds_ib_sysctl_exit(void)
>  int rds_ib_sysctl_init(void)
>  {
>         rds_ib_sysctl_hdr = register_net_sysctl(&init_net, "net/rds/ib", rds_ib_sysctl_table);
> -       if (!rds_ib_sysctl_hdr)
> +       if (!rds_ib_sysctl_hdr && IS_ENABLED(CONFIG_SYSCTL))
>                 return -ENOMEM;
>         return 0;
>  }
> diff --git i/net/rds/sysctl.c w/net/rds/sysctl.c
> index 025f518a43495..41c65b98c94bd 100644
> --- i/net/rds/sysctl.c
> +++ w/net/rds/sysctl.c
> @@ -93,7 +93,8 @@ static struct ctl_table rds_sysctl_rds_table[] = {
>
>  void rds_sysctl_exit(void)
>  {
> -       unregister_net_sysctl_table(rds_sysctl_reg_table);
> +       if (rds_sysctl_reg_table)
> +               unregister_net_sysctl_table(rds_sysctl_reg_table);

Yes, this is what Allison suggested too. But he also pointed out that
the changes in _exit() are not strictly needed, unregister_net_sysctl_table
is nop if !CONFIG_SYSCTL. Plus we also need to change rds_tcp_init_net()
the same way, see register_net_sysctl_sz().

So, let me repeat, I agree in advance with anything you and Allison prefer.

Oleg.


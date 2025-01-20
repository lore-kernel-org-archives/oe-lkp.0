Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26EE1DFE14
	for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376968; cv=none; b=NHsDA1msGk8p2AVHanJiuvQWK3D1/x20rfTC/wlj4ckiRjFoykZCCMsYrKrrVd4ZWlfA97YdTv7eZmgJxjd3tTA/AGDzzGqxENqkUfeeoYWBtayEpDmiclBs0QUsvwn6vk8rFmVrXYEkMbfFdHdXPuIgDpAHENo1jTNsg6cysxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376968; c=relaxed/simple;
	bh=ljOvUhnQMd/bR+2NO4+rfciOdIOy6YM2mR6nKravZng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAailMqose12NSn16YWCwmCjPOaQCSVoTxPIkwmRyPaJTdvN1nio7VlizayfuOLo2/W0/PGD8EQYFChJP4se1Bx1Q1YI6bzDCDKL5IQG3TJjk1E4PliJbp/AReHDvX1+VCPozV067m98YzwgMUypyFr8odAizLwgsBl47FqqC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PNGhTxmx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNGhTxmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737376965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljOvUhnQMd/bR+2NO4+rfciOdIOy6YM2mR6nKravZng=;
	b=PNGhTxmxP85l1J7flMh015Y90N7K5smbxye/9ivzAV6X5bNtdIFeWS+1EjVsqCAxbMelWc
	wUogcSm26qCFybY4ELJt+XTy1Wz3hWtSVP+gpUk5RI5q08+YJJLorfam+ApfxpMM9afEAP
	EjiL2pawU0kTy0HJjMvhSO+YWnMkqLU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-DuTuzjEFNteS6GqyxJJMrg-1; Mon,
 20 Jan 2025 07:42:42 -0500
X-MC-Unique: DuTuzjEFNteS6GqyxJJMrg-1
X-Mimecast-MFC-AGG-ID: DuTuzjEFNteS6GqyxJJMrg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BAD21955D89;
	Mon, 20 Jan 2025 12:42:40 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 220E019560A3;
	Mon, 20 Jan 2025 12:42:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 13:42:15 +0100 (CET)
Date: Mon, 20 Jan 2025 13:42:10 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Christian Brauner <brauner@kernel.org>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org
Subject: Re: [linux-next:master] [pipe_read]  aaec5a95d5:
 stress-ng.poll.ops_per_sec 11.1% regression
Message-ID: <20250120124209.GB7432@redhat.com>
References: <202501201311.6d25a0b9-lkp@intel.com>
 <leot53sdd6es2xsnljub4rr4n3xgusft6huntr437wmaoo5rob@hhbtzrwgxel2>
 <20250120121928.GA7432@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120121928.GA7432@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Forgot to mention...

On 01/20, Oleg Nesterov wrote:
>
> On 01/20, Mateusz Guzik wrote:
> >
> > Whatever the long term fate of the patch I think it would be prudent to
> > skip it in this merge window.
>
> Perhaps... I'll try to take another look tomorrow.
>
> Just one note right now.
>
> > First two notes:
> > 1. the change only considers performing a wake up if the current
> > source buf got depleted -- if there is a blocked writer and there is at
> > least one byte in the current buf nothing happens, which is where the
> > difference in results is coming from
>
> Sorry I don't understand. Unless this patch is buggy, pipe_read() must
> always wakeup a blocked writer if the writer can write at least one byte.
>
> The writer can't write to "current" buf = pipe->bufs[tail & mask] if
> pipe_full() is still true.

But I'll recheck this logic once again tomorrow, perhaps I misread
pipe_write() when I made this patch.

Oleg.


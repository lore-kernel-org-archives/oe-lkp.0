Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBFED5
	for <oe-lkp@lists.linux.dev>; Tue, 23 May 2023 22:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684881175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfRD3GZSe/po2Yvx+fZzXZZZfdk+kXJVJcq8DZsV4Kg=;
	b=SWeMM9uIZ87+OfcHXjxLW3sTk0Oivf6NwKwZuiayZLoQsCsZjWErIBrBgyFpc3x3LULjKf
	SFcoe5Y/tlGP1geVYsU5+wMZgX9QcN5mzmxwniXyGmkHYAi8srjxcgbs6EELuQHRvimoSV
	De+WNDMnCGrpWVomR/lvV8u5dES4RXY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-mSY-E4UePbSCudRsYnUVtA-1; Tue, 23 May 2023 18:32:53 -0400
X-MC-Unique: mSY-E4UePbSCudRsYnUVtA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-624b4176bf7so1191386d6.1
        for <oe-lkp@lists.linux.dev>; Tue, 23 May 2023 15:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684881172; x=1687473172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfRD3GZSe/po2Yvx+fZzXZZZfdk+kXJVJcq8DZsV4Kg=;
        b=a0y+8DwzeNtvWiz45/THhRabzCyX5xbzCfUB7qbDbJ855P0OAB7A0bcSg39CP0MupM
         bN5ul+ZK4MdB4pHdexzGT8a4Xk/oMmfRd/G8+CYtXmJL14hck4nw4HE3XUb/2+4I8oFf
         4WMyciNoJzBrp75LWGHmZf79o3Pr5k7uXlD8ddO8rqqRZ7eTdNR5CMQ4KF0wlNc9VLpf
         WpI9IZcJ9gvi5WS0yDQOkEJN67sKtHFtS2WOrL4jc8ANSbyv4DjdTIfXzBCeB8lcV0AP
         rH1nCbwEfmB0XKLnADHUM1tHbX8i0DBb04gzDXtZNETGFHj/BV43Bu5hkdX4T+QGhO1q
         LBpQ==
X-Gm-Message-State: AC+VfDxxaB6fDF/TQQ2QRBMFdctme5oQBHd+5EaiGMrDcrWrKEe90Q6b
	5KxmLFYTcncVs3vmxMezQ2zcO5Tr5MWDGQx9ify4KI8rGx5dr8IuKvzhos/74U6vPpypZ1/J8tW
	BWxSUmsQT2Wrj7sAg
X-Received: by 2002:a05:6214:1251:b0:623:690c:3cd7 with SMTP id r17-20020a056214125100b00623690c3cd7mr26478324qvv.47.1684881172544;
        Tue, 23 May 2023 15:32:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pYBvrUPTIq4QFiKkKAkrD+OA0TF1qdjuEuroSHzONcos03Kg+SYc3DmzKyVVjvCUN1HrLag==
X-Received: by 2002:a05:6214:1251:b0:623:690c:3cd7 with SMTP id r17-20020a056214125100b00623690c3cd7mr26478302qvv.47.1684881172259;
        Tue, 23 May 2023 15:32:52 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v16-20020a0ccd90000000b00604ee171d99sm3043919qvm.106.2023.05.23.15.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 15:32:51 -0700 (PDT)
Date: Tue, 23 May 2023 15:32:50 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Lino Sanfilippo <LinoSanfilippo@gmx.de>, peterhuewe@gmx.de, 
	jgg@ziepe.ca, hdegoede@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	peter.ujfalusi@linux.intel.com, peterz@infradead.org, linux@mniewoehner.de, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, l.sanfilippo@kunbus.com, 
	lukas@wunner.de, p.rosenberger@kunbus.com
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
Message-ID: <kxb36qqgtnyqed4cgd5fpvmwway2v4watcfg3vdj3okm76scsy@prcbk5pjv4gk>
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <CSTVVFNKUVJW.P69FKI6IF3ZN@suppilovahvero>
 <CSTW9UX4ERDZ.VBD1QIWLBM75@suppilovahvero>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CSTW9UX4ERDZ.VBD1QIWLBM75@suppilovahvero>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 10:12:49PM +0300, Jarkko Sakkinen wrote:
> On Tue May 23, 2023 at 9:53 PM EEST, Jarkko Sakkinen wrote:
> > On Mon May 22, 2023 at 5:31 PM EEST, Lino Sanfilippo wrote:
> > > From: Lino Sanfilippo <l.sanfilippo@kunbus.com>
> > >
> > > Commit e644b2f498d2 ("tpm, tpm_tis: Enable interrupt test") enabled
> > > interrupts instead of polling on all capable TPMs. Unfortunately, on some
> > > products the interrupt line is either never asserted or never deasserted.
> > >
> > > The former causes interrupt timeouts and is detected by
> > > tpm_tis_core_init(). The latter results in interrupt storms.
> > >
> > > Recent reports concern the Lenovo ThinkStation P360 Tiny, Lenovo ThinkPad
> > > L490 and Inspur NF5180M6:
> > >
> > > https://lore.kernel.org/linux-integrity/20230511005403.24689-1-jsnitsel@redhat.com/
> > > https://lore.kernel.org/linux-integrity/d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org/
> > >
> > > The current approach to avoid those storms is to disable interrupts by
> > > adding a DMI quirk for the concerned device.
> > >
> > > However this is a maintenance burden in the long run, so use a generic
> > > approach:
> >
> > I'm trying to comprehend how you evaluate, how big maintenance burden
> > this would be. Adding even a few dozen table entries is not a
> > maintenance burden.

I do worry about how many cases will be reported once 6.4 is released,
and this eventually makes its way into distributions. In either case
the dmi table will need to be maintained. The UPX-11i case is a
different issue, and IIRC the L490 it needed a DMI entry, because
trying to catch the irq storm wasn't solving the issue there. I
imagine other odd cases will be popping up as well.

So far we have 2 irq storm reports with peterz's P360 Tiny, and I
guess that Inspur system reported by the kernel test robot. Then there
is whatever is going on with Peter Ujfalusi's UPX-11i.

> >
> > On the other hand any new functionality is objectively a maintanance
> > burden of some measure (applies to any functionality). So how do we know
> > that taking this change is less of a maintenance burden than just add
> > new table entries, as they come up?
> >
> > > Detect an interrupt storm by counting the number of unhandled interrupts
> > > within a 10 ms time interval. In case that more than 1000 were unhandled
> > > deactivate interrupts, deregister the handler and fall back to polling.
> >
> > I know it can be sometimes hard to evaluate but can you try to explain
> > how you came up to the 10 ms sampling period and 1000 interrupt
> > threshold? I just don't like abritrary numbers.
> 
> Also here I wonder how you came up with this computational model. This
> is not same as saying it is wrong. There's just whole stack of options.
> 
> Out of top of my head you could e.g. window average the duration between
> IRQs. When the average goes beyond threshold, then you shutdown
> interrupts.

Just to make sure I have it clear in my head, you mean when the
average is shorter than the threshold duration between interrupts,
yes? My brain wants to read 'When the average goes beyond threshold'
as 'threshold < average'.

Does the check need to be a rolling window like 1/2 currently has? I
expect that if the problem exists it will be noticed in the first
window checked. I think what I originally tried was to check over some
interval from when the handler first ran, disable interrupts if
needed, and then skip the check from then on when the handler ran.

Regards,
Jerry

> 
> The pro I would see in this that it is much easier intuitively discuss
> how much there should be time in-between interrupts that the kernel
> handles it, than how many IRQs you can stack into time interval, which
> blows my head tbh.
> 
> BR, Jarkko


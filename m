Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EAA629
	for <oe-lkp@lists.linux.dev>; Thu, 11 May 2023 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683817166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GHBw4+cTweg81q2LmlP9R18yygpPwcxBNpR1jxTxX0=;
	b=DOQpMKoeAWE+6w+0mJ/Q/Y5OLUppluA0Bg/+vtzRUqg6oVkppKMLtm5uwkCKeX7KqoE/bc
	thJuzIKo/i/Dwd6FbrZArmtIu5c/DZoKASDEr+2ayOVvardaLCmiLLKktGfbsOwdd3SRvP
	NIWo9DCZV4F/ESdb1k2NhEvD9vJx5sk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-qzp6BtnAM1ueYFMefDPqgQ-1; Thu, 11 May 2023 10:59:24 -0400
X-MC-Unique: qzp6BtnAM1ueYFMefDPqgQ-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1ab0527b01bso51751965ad.1
        for <oe-lkp@lists.linux.dev>; Thu, 11 May 2023 07:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683817163; x=1686409163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GHBw4+cTweg81q2LmlP9R18yygpPwcxBNpR1jxTxX0=;
        b=LByI2eK2FBVbnHBiUzw53zVEjQbHQolGI5VNsPp5ZSuQXlpXwZKCFgGLyjB81hRDSp
         RWGYXgnYGjCCRT6REE9pU0mIPgzb+48q/89PQ6oIEaGfQwysHYNxAgQHWlh0aUHwCBAn
         MCNtrnnSX0IPS0+ltMfUr6F/5VfA5S9LyXu5obbAWXnFpnzGZWgY3P+UDpvuS2ONdZxU
         1lAEfZmddbgryLfQJ5brbwzC+xrGTWzTWZDptHlmnuSYSpGtRptliX3uxnSzvb65YMfx
         w/+84byUmKnJbnw5bemS0FvIqSnRazzZH7Ds1dzqWmv8F/Eg6VW9AuiPsdpFkwnw3ZbY
         IEtg==
X-Gm-Message-State: AC+VfDyAVeN9zRJMKqJDajlbiuaoPIs8IwKNum2swRMU4crjCvnoOOrW
	DIDdyy3wKIlSajocaxs59iHURzUVJ1y6TF0pLpBkJDltpMEGvCqs9vs7skg8sIGhKPjRA0nU3Jw
	kt43TAvjHtkR++qTa
X-Received: by 2002:a17:902:dac3:b0:1ad:b459:a7e4 with SMTP id q3-20020a170902dac300b001adb459a7e4mr7029554plx.7.1683817163114;
        Thu, 11 May 2023 07:59:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YCfc8zzwbI8QtHHj7/8f5p4ttf/0yu00ibk/HvuJpRlFLqY+/A509IGdHATqJr0F4f+7exw==
X-Received: by 2002:a17:902:dac3:b0:1ad:b459:a7e4 with SMTP id q3-20020a170902dac300b001adb459a7e4mr7029525plx.7.1683817162756;
        Thu, 11 May 2023 07:59:22 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001a9a8983a15sm6006481plb.231.2023.05.11.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:59:22 -0700 (PDT)
Date: Thu, 11 May 2023 07:59:21 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lino Sanfilippo <l.sanfilippo@kunbus.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Michael =?utf-8?Q?Niew=C3=B6hner?= <linux@mniewoehner.de>, linux-integrity@vger.kernel.org, 
	Philipp Rosenberger <p.rosenberger@kunbus.com>, peterz@infradead.org
Subject: Re: [linus:master] [tpm, tpm_tis] e644b2f498: RIP:acpi_safe_halt
Message-ID: <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
References: <202305041325.ae8b0c43-yujie.liu@intel.com>
 <d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org>
 <42ea93a1-3186-b8ff-c317-d51f3e13856e@kunbus.com>
 <20230511141607.GA32208@wunner.de>
 <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 11, 2023 at 04:22:02PM +0200, Lino Sanfilippo wrote:
> 
> Hi Lukas,
> 
> On 11.05.23 16:16, Lukas Wunner wrote:
> > ATTENTION: This e-mail is from an external sender. Please check attachments and links before opening e.g. with mouseover.
> > 
> > 
> > On Thu, May 11, 2023 at 01:22:19PM +0200, Lino Sanfilippo wrote:
> >> Since beside the one reported by Peter Zijlstra
> >> (https://lore.kernel.org/linux-integrity/CSJ0AD1CFYQP.T6T68M6ZVK49@suppilovahvero/T/#t)
> >> we have another interrupt storm here, it is probably the best to handle those in general
> >> and to disable interrupts in this case to fall back to polling (this is also what Jerry
> >> suggested in the thread above).
> >>
> >> I will try to provide a patch for this.
> > 
> > In tpm_tis_probe_irq_single(), after you've requested the irq,
> > you could convert it to a struct irq_desc (via irq_to_desc()
> > from <linux/irqnr.h>) and cache that pointer in priv.
> > 
> > Then in tis_int_handler(), you could access the irqs_unhandled
> > member of struct irq_desc (from <linux/irqdesc.h>) and check
> > if it exceeds, say, 5000.
> 
> This is the solution I am currently working on, but thanks for confirming that 
> I am on the right track with this :)
> 
> > 
> > If it does, schedule a work_struct which calls disable_interrupts().
> > You can't call that from the IRQ handler because devm_free_irq()
> > waits for the IRQ handler to finish, so you'd deadlock.  You *can*
> > of course clear the TPM_GLOBAL_INT_ENABLE bit from the IRQ handler,
> > though it's unclear to me if that's sufficient to quiesce the
> > interrupt line.
> > 
> 
> Will try this, thx.
> 
> > By reusing the genirq subsystem's irqs_unhandled infrastructure,
> > you avoid having to reimplement all of that.
> > 
> 
> Agreed.
> 
> Regards,
> Lino
> 

Thanks for finishing this off Lino.

IIRC trying to catch the irq storm didn't work in the L490 case for
some reason, so we might still need the dmi entry for that one.

The info that the T490s had a pin wired up wrong came from Lenovo, but
this one even looks to be a different vendor so I wonder how often
this happens or if there is something else going on. Is it possible to
get info about the tpm used in the Inspur system? The datasheet online
doesn't mention it.

Regards,
Jerry

> > Thanks,
> > 
> > Lukas


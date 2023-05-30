Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC617AD4
	for <oe-lkp@lists.linux.dev>; Tue, 30 May 2023 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685464038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOIVzrI3vKBP/A6R0sJIuBO8sqm5648YHnsZrR5hri0=;
	b=C+IzeIjhQPpewaEu6xMZACrYSviVK30qu6ktP5ZJM5i4rhFqphlfDYxahzmyaOJ5KXs7tP
	VpldO8hvUsDK1cilWk3oZ+RFp5p0QUI9+l7dZpIhSDfJnbJLI7SBz5Mn9Sl/3kkZmN5/dE
	XDMMDlI5lLFnJiJDjd+VHOVSibrll2I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-nPbM5D_kO1mJDgSLv6fPkA-1; Tue, 30 May 2023 12:27:17 -0400
X-MC-Unique: nPbM5D_kO1mJDgSLv6fPkA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-75b67a4f16aso311233085a.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 May 2023 09:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464036; x=1688056036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOIVzrI3vKBP/A6R0sJIuBO8sqm5648YHnsZrR5hri0=;
        b=EE6y9LDm7v10NDUymNyUkWqRGBlEueO+ggvyp9jCtP4PTPLIsxrFvFaXUKqLUvnAln
         wVQVaQZQ1W6DZ5mRYmxEeylfDA7ydVdFIhiJIyulggGp6ri/IKmNv9wGOb3jm3X+REWM
         nKP2adWVgH/SuL2U4+43W3u/ispNAg8z7ItqKj1QK6u8RQPGm/AI8b9JBN/S4Tl9J9NA
         QO2qR/UJVvST91qFaXrysHjgqZeSKaCCqTB8wwWhdSdkjV+QBHNuBzGqgUhB3ytwkXcn
         Hdc0xC6uCUSV7gnxVqAMsuoSJ1Pnrt9dDlns2MJ3XLajsCfKEzvxHcmV/0dz0ZUPi4xf
         FJGg==
X-Gm-Message-State: AC+VfDym2M8GDShHY7Y9Hkf4t2IGSJq+SCXcqrR50OlJRuNeCBia4QtY
	s8sSorJmjjUnACjClQik4toiiy2lNKXmw0uKDbBNnrOPXlo7CIE0lXp8rxFjTTNfFZG0tH+4p7D
	aI9vsr8kKw2Mrn/gj
X-Received: by 2002:a05:620a:2617:b0:75b:23a0:e7e7 with SMTP id z23-20020a05620a261700b0075b23a0e7e7mr2242375qko.72.1685464036593;
        Tue, 30 May 2023 09:27:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7oC9aEVSBKMtLklQXrBPZMeMm21vFrPEYngDHux4hIbwN0xr0b2MneGdGNx1VH/PM57TmiVg==
X-Received: by 2002:a05:620a:2617:b0:75b:23a0:e7e7 with SMTP id z23-20020a05620a261700b0075b23a0e7e7mr2242356qko.72.1685464036338;
        Tue, 30 May 2023 09:27:16 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a4-20020a05620a124400b0075b1c6f9628sm4202904qkl.71.2023.05.30.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 09:27:15 -0700 (PDT)
Date: Tue, 30 May 2023 09:27:14 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Michael =?utf-8?Q?Niew=C3=B6hner?= <linux@mniewoehner.de>
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>, 
	Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	Philipp Rosenberger <p.rosenberger@kunbus.com>, peterz@infradead.org
Subject: Re: [linus:master] [tpm, tpm_tis] e644b2f498: RIP:acpi_safe_halt
Message-ID: <kjcmnmspnpzp7j64msdeygfv76fah5whslldczlfzlk57cxp7b@myllnwmy43vo>
References: <202305041325.ae8b0c43-yujie.liu@intel.com>
 <d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org>
 <42ea93a1-3186-b8ff-c317-d51f3e13856e@kunbus.com>
 <20230511141607.GA32208@wunner.de>
 <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
 <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
 <fcdc5a27817b17d91df84bb06ad5d382829d5467.camel@mniewoehner.de>
 <6hbzssr2byskuiznx6vvatcuvjkrbhscvorzm4qcheh3n6n4zj@2nrfawn6rbst>
 <0e837a2e859b4c633b068368f3c28ba30fc1af70.camel@mniewoehner.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0e837a2e859b4c633b068368f3c28ba30fc1af70.camel@mniewoehner.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 30, 2023 at 04:40:26PM +0200, Michael Niewöhner wrote:
> On Mon, 2023-05-29 at 13:58 -0700, Jerry Snitselaar wrote:
> > On Mon, May 29, 2023 at 05:07:54PM +0200, Michael Niewöhner wrote:
> > > Hi Jerry,
> > > 
> > > On Thu, 2023-05-11 at 07:59 -0700, Jerry Snitselaar wrote:
> > > > 
> > > > IIRC trying to catch the irq storm didn't work in the L490 case for
> > > > some reason, so we might still need the dmi entry for that one.
> > > > 
> > > > The info that the T490s had a pin wired up wrong came from Lenovo, but
> > > > this one even looks to be a different vendor so I wonder how often
> > > > this happens or if there is something else going on. Is it possible to
> > > > get info about the tpm used in the Inspur system? The datasheet online
> > > > doesn't mention it.
> > > 
> > > Are you sure about T490s? To me the wiring looks right on both s and non-s:
> > > Pin
> > > 18 / PIRQ# goes to PIRQA# of the PCH/SoC.
> > > 
> > > However on L490 Pin 18 / PIRQ# is wired wrongly to SERIRQ, which probably is
> > > the
> > > reason that catching the interrupt storm didn't work: I guess this
> > > completely
> > > messes up LPC communication and causes way more problems. In this case only
> > > a
> > > DMI quirk can help.
> > > 
> > > BR
> > > Michael
> > > 
> > 
> > I'm searching to see if I can find the old bug/email where that info
> > from Lenovo originated.  It could be that the info was wrong, and
> > it was some firmware issue instead. IIRC the the T490s issue could be
> > solved with the code looking for the irq storm, but the L490 needed
> > the dmi check even with the irq storm checking code.
> 
> Tbh I wonder why the T490s suffers from that interrupt storm at all, but that
> might be a FW bug (it's not handling the interrupt). L490 definitely needs that
> DMI check, right.
> 
> > 
> > 
> > I haven't found the info yet, but I did find some other reports from back
> > then.
> > 
> > Spurious irq reported with 5.5.7, so after the irq reverts in v5.5:
> > 
> > tpm_tis IFX0785:00: 2.0 TPM
> > Hardware name: Entroware Proteus/Proteus, BIOS 1.07.07TE0 11/15/2019
> 
> That's actually a Clevo N151CU. According to schematics it's wired correctly to
> PIRQA#, so probably a FW bug as well.
> 
> > 
> > Thinkpad P53
> > tpm_tis STM7308:00: 2.0 TPM
> > Hardware name: LENOVO 20QNCTO1WW/20QNCTO1WW, BIOS N2NET34W (1.19 ) 11/28/2019
> > 
> > 
> > 
> > Reports from before the 5.5 reverts:
> > 
> > tpm_tis MSFT0101:00: 2.0 TPM
> > Hyperbook NH5/Clevo NH55RCQ
> 
> PIRQ# wired to GPP_B0 - needs correct setup in firmware -> probably a firmware
> bug.
> 
> > 
> > tpm_tis IFX0785:00: 2.0 TPM 
> > Clevo N151CU-derived notebook
> 
> Same device as Entroware Proteus.
> 

Hi Michael,

Out of curiousity, where are you grabbing the schematics from?

Regards,
Jerry


> > 
> > 
> > Regards,
> > Jerry
> > 
> > > > 
> > > > Regards,
> > > > Jerry
> > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > Lukas
> > > > 
> > > 
> > 
> 


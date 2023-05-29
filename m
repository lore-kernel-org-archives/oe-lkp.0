Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD528E7
	for <oe-lkp@lists.linux.dev>; Mon, 29 May 2023 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685393894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mV2kHVRcfcyRbrdpPRjIZ0JKYy4IfekVjpRlLT3ji4M=;
	b=gGKD5gA1OiKBiKUSJT3clZXepL+TQ6RVH9RtUi63u1SkHUkFHBoL4ergqkh1RscweKxrSx
	ndKqCojTE5UJ5AZXLvaQwblZl6iljkiGrs+3BNi6QDRP1YNLfHgCdljr5lucI4GMLUROs8
	n5ZcLOXOlwiOEzRtN5uvgeEMjK+9FEg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-vkbnRSgzPReQ8DFVMkBfWw-1; Mon, 29 May 2023 16:58:12 -0400
X-MC-Unique: vkbnRSgzPReQ8DFVMkBfWw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-62628df5347so5992406d6.2
        for <oe-lkp@lists.linux.dev>; Mon, 29 May 2023 13:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685393892; x=1687985892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV2kHVRcfcyRbrdpPRjIZ0JKYy4IfekVjpRlLT3ji4M=;
        b=Twijoc31GHF2z5nrA35q0e8yXOI/36KPJjfr6Jl64w1EXLmudsAQ2yI6isX3L0+gRR
         s8Nltd38qFCT7cVC5wC5owy9RdKuI7hPDKFx+ok+nRveTqmVltEzWvTut/tIxTjgwmn5
         FmMOX4SgfJe4/m2Lyg8tdjiC4l9IdDMNQbDZfeSJcJpw7RcmZVZ/AMfMaFfj5JzIFbZ/
         hLZljCEGkanCLfPefvBV79E98DJAPv7yqO9g1FxqndvFENoyr0duZD/iQMjiLqAGyU3S
         FP0n59hO0p4OIUnuzwudpeGD1NaagiBpYnMSFZoBfmHfg1k/9rHQnHLV0rXCrgd1DCjE
         oOQA==
X-Gm-Message-State: AC+VfDxBlQLiRtXBc074JzN4TCEr9NauWKE5owimUjWvZOC4QwgITfYD
	BcdNWSyeooK09y4LG6CU54DDfXb3SSMoVzd8iNiETwX2unhV1Nz+pho9AF/l2kd8h8wM0r0ii6P
	ISa13f4VVlRqagVGG
X-Received: by 2002:a05:6214:212e:b0:621:6548:d192 with SMTP id r14-20020a056214212e00b006216548d192mr14671150qvc.49.1685393892317;
        Mon, 29 May 2023 13:58:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62pZJSF9EG0XG2rv8Pp9vsLFjquc2gpXw/2+onp7YrQzk59kKXZlVMqOssTBoCVkFXIL04Dw==
X-Received: by 2002:a05:6214:212e:b0:621:6548:d192 with SMTP id r14-20020a056214212e00b006216548d192mr14671137qvc.49.1685393892080;
        Mon, 29 May 2023 13:58:12 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id ej14-20020ad45a4e000000b00606750abaf9sm1851949qvb.136.2023.05.29.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 13:58:11 -0700 (PDT)
Date: Mon, 29 May 2023 13:58:09 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Michael =?utf-8?Q?Niew=C3=B6hner?= <linux@mniewoehner.de>
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>, 
	Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	Philipp Rosenberger <p.rosenberger@kunbus.com>, peterz@infradead.org
Subject: Re: [linus:master] [tpm, tpm_tis] e644b2f498: RIP:acpi_safe_halt
Message-ID: <6hbzssr2byskuiznx6vvatcuvjkrbhscvorzm4qcheh3n6n4zj@2nrfawn6rbst>
References: <202305041325.ae8b0c43-yujie.liu@intel.com>
 <d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org>
 <42ea93a1-3186-b8ff-c317-d51f3e13856e@kunbus.com>
 <20230511141607.GA32208@wunner.de>
 <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
 <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
 <fcdc5a27817b17d91df84bb06ad5d382829d5467.camel@mniewoehner.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fcdc5a27817b17d91df84bb06ad5d382829d5467.camel@mniewoehner.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 29, 2023 at 05:07:54PM +0200, Michael Niewöhner wrote:
> Hi Jerry,
> 
> On Thu, 2023-05-11 at 07:59 -0700, Jerry Snitselaar wrote:
> > 
> > IIRC trying to catch the irq storm didn't work in the L490 case for
> > some reason, so we might still need the dmi entry for that one.
> > 
> > The info that the T490s had a pin wired up wrong came from Lenovo, but
> > this one even looks to be a different vendor so I wonder how often
> > this happens or if there is something else going on. Is it possible to
> > get info about the tpm used in the Inspur system? The datasheet online
> > doesn't mention it.
> 
> Are you sure about T490s? To me the wiring looks right on both s and non-s: Pin
> 18 / PIRQ# goes to PIRQA# of the PCH/SoC.
> 
> However on L490 Pin 18 / PIRQ# is wired wrongly to SERIRQ, which probably is the
> reason that catching the interrupt storm didn't work: I guess this completely
> messes up LPC communication and causes way more problems. In this case only a
> DMI quirk can help.
> 
> BR
> Michael
> 

I'm searching to see if I can find the old bug/email where that info
from Lenovo originated.  It could be that the info was wrong, and
it was some firmware issue instead. IIRC the the T490s issue could be
solved with the code looking for the irq storm, but the L490 needed
the dmi check even with the irq storm checking code.


I haven't found the info yet, but I did find some other reports from back
then.

Spurious irq reported with 5.5.7, so after the irq reverts in v5.5:

tpm_tis IFX0785:00: 2.0 TPM
Hardware name: Entroware Proteus/Proteus, BIOS 1.07.07TE0 11/15/2019

Thinkpad P53
tpm_tis STM7308:00: 2.0 TPM
Hardware name: LENOVO 20QNCTO1WW/20QNCTO1WW, BIOS N2NET34W (1.19 ) 11/28/2019



Reports from before the 5.5 reverts:

tpm_tis MSFT0101:00: 2.0 TPM
Hyperbook NH5/Clevo NH55RCQ

tpm_tis IFX0785:00: 2.0 TPM 
Clevo N151CU-derived notebook


Regards,
Jerry

> > 
> > Regards,
> > Jerry
> > 
> > > > Thanks,
> > > > 
> > > > Lukas
> > 
> 


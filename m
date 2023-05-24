Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EBC15F
	for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684919311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ba3cVMN5JYb7eY+YLCMjuGa5u5FrljiykCHYgPsetc=;
	b=a3+Aul89pcXvgAKpAMe45AAp0+jvERzjvsRA/DPLOfH5qSlfkOTxAoP24XSIIBAM3OWZyE
	Gh8tx7mZpdx85oukIpM8lFOrX2XGXkYfl5zeU5OBctGy7yPFxOoQfRqYAZAbE6wgJno4bS
	ydgiUfI+NlbkizdXuhy1IZFWDrKmyoE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-FUIse-I1NYmDqkHIxQfjWg-1; Wed, 24 May 2023 05:08:30 -0400
X-MC-Unique: FUIse-I1NYmDqkHIxQfjWg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-96fe603151eso74140866b.0
        for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 02:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684919309; x=1687511309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ba3cVMN5JYb7eY+YLCMjuGa5u5FrljiykCHYgPsetc=;
        b=M8fZhGG1rMr0OTkOi31UL2T3qsW4e4JtYsASUZMa0cVjCnyC5EjUxI1Lj3DEqTemQF
         yWhV7WX7t2TzbXo4svPC25SPFKTC/y4e1wf+svPE/cRsKSTqYYsyFwH2FS/g8pXre08d
         FX5kfQREvAZBXdns+IZUi8gHXa/peD8TL3XGp0DXyS2x/1/08H/vT+HrT0i8RHhJ228K
         vIPp5s8sGHx0AGXLBrbUmgoDUjWvipC5XKT+iU1sN4orqAIuom6fCn0RKQ8GuRSV+TUP
         Q0wCuSBt0U5yWHx9z+j74dZlFww80eDuJdywMznmjUB1tnquh3cFZ3zoISM9p8aPeP07
         s9IQ==
X-Gm-Message-State: AC+VfDx+nBnlbqIkB6cMyuyK/T3OYQU9/fp19M7PhUtDMeafAn/3tW8M
	lRSaj9voBHVNtCGvKmvaAXlgrKStqSuuQpvhUddGcXUxvZNpXmYLGftEgOYfS/Abak9jmw1BNSG
	rOdTcEdnpYSL5nZYA
X-Received: by 2002:a17:907:7ea3:b0:96a:57fe:3bfb with SMTP id qb35-20020a1709077ea300b0096a57fe3bfbmr17636592ejc.26.1684919309223;
        Wed, 24 May 2023 02:08:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73F3kbO0SmGWBsYMmVzety237b+nVthkK/CLP2W6JhWQfl6pbCE7hOBDeO04CB7wWiFaOCXg==
X-Received: by 2002:a17:907:7ea3:b0:96a:57fe:3bfb with SMTP id qb35-20020a1709077ea300b0096a57fe3bfbmr17636561ejc.26.1684919308953;
        Wed, 24 May 2023 02:08:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m13-20020a17090607cd00b0096f603dc8ddsm5561226ejc.142.2023.05.24.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 02:08:28 -0700 (PDT)
Message-ID: <4f9e3da1-5cfa-c3cd-a8e5-f97a2dd1cede@redhat.com>
Date: Wed, 24 May 2023 11:08:27 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
To: Lukas Wunner <lukas@wunner.de>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Lino Sanfilippo <LinoSanfilippo@gmx.de>, peterhuewe@gmx.de,
 jarkko@kernel.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 oe-lkp@lists.linux.dev, lkp@intel.com, peterz@infradead.org,
 linux@mniewoehner.de, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org, l.sanfilippo@kunbus.com,
 p.rosenberger@kunbus.com
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <c772bcdf-8256-2682-857c-9a6d344606d0@linux.intel.com>
 <20230523074443.GA21236@wunner.de>
 <98f7dc1a-6bed-a66f-650e-10caeb7d0bca@linux.intel.com>
 <20230523151642.GA31298@wunner.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230523151642.GA31298@wunner.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lukas,

On 5/23/23 17:16, Lukas Wunner wrote:
> On Tue, May 23, 2023 at 12:14:28PM +0300, Péter Ujfalusi wrote:
>> On 23/05/2023 10:44, Lukas Wunner wrote:

<snip>

>>> The corresponding message emitted in tpm_tis_core_init() for
>>> an interrupt that's *never* asserted uses dev_err(), so using
>>> dev_err() here as well serves consistency:
>>>
>>> 	dev_err(&chip->dev, FW_BUG
>>> 		"TPM interrupt not working, polling instead\n");
>>>
>>> That way the same severity is used both for the never asserted and
>>> the never deasserted interrupt case.
>>
>> Oh, OK.
>> Is there anything the user can do to have a ERROR less boot?
> 
> You're right that the user can't do anything about it and that
> toning the message down to KERN_WARN or even KERN_NOTICE severity
> may be appropriate.
> 
> However the above-quoted message for the never asserted interrupt
> in tpm_tis_core_init() should then likewise be toned down to the
> same severity.
> 
> I'm wondering why that message uses FW_BUG.  That doesn't make any
> sense to me.  It's typically not a firmware bug, but a hardware issue,
> e.g. an interrupt pin may erroneously not be connected or may be
> connected to ground.  Lino used HW_ERR, which seems more appropriate
> to me.

This issue seems to have mostly been seen on x86/ACPI systems and
the issue seems to mostly be a misconfiguration of the IOAPIC
(e.g. wrong trigger type).

Besides this, the IRQ info always comes from either the ACPI tables
or from devicetree both of which are firmware and if the IRQ does not
work on a specific board then the firmware should simply not provide
any IRQ info to the driver rather the pointing to a broken IRQ.

Hence my suggestion to use dev_warn(dev, FW_BUG "....", ...);

Regards,

Hans



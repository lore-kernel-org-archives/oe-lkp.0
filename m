Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E522A1D2A8
	for <oe-lkp@lists.linux.dev>; Tue, 23 May 2023 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684833607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fn6/Mg38CazICzLvvCRl9KTjMS04MbP9e/f9SZahjis=;
	b=iB4lH1GofgLOJH7MWZN3wbAnWw1BzlRMxObp97SJ9BnK+z2aDdg2bxWpraveQyn/3lJRba
	eZCPW1DrfzlXyyxGT061G1lkINP2t/wtEnPj6KTg/0YLyyqYhUgEWp3J/pn5UV1KRNzwVt
	NQJbdqlKG0IW5MgalMsNfL/kmaPUGq8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-U9T5aP71PxesbHmKeTpT1Q-1; Tue, 23 May 2023 05:20:06 -0400
X-MC-Unique: U9T5aP71PxesbHmKeTpT1Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96f83033b48so452644466b.3
        for <oe-lkp@lists.linux.dev>; Tue, 23 May 2023 02:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833605; x=1687425605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fn6/Mg38CazICzLvvCRl9KTjMS04MbP9e/f9SZahjis=;
        b=JLvHVV6K1ZkY9hDIA65gxZMwoPa1Yfh0ZbrMK55e01rrRQ1RhLZVQPXnWgUqiT3Tih
         4QB57XFkpK9Yda57bM9xclfIjoAHr4hs46pwiEq18UETRvlswl8+BTIiQqng5YKiHLu6
         e8b9jFIwGZg1pVyt5NJ9ATci+VaOik5o3pwWoldbvhIxYOJs0ouZkM2eF1E1iFPZAt9n
         ubc3JOVHykD5tXzgZdKYgWEwpL+c29owDPkieSp3nYDgGeOr8B2TfiVBoDrfd+u8DIaU
         WFg4sw9h8nysUT5avqlExujINHuIVvAWOh5HPbgMDolaTFnvkJwAuWP483Z0B/ZMtpB4
         yw0Q==
X-Gm-Message-State: AC+VfDx4fBa7GhZiYtNkHbaSMtXkX7I2OudikBL+H8q+oFE7lGxVIakD
	x1JwFT5YcgNF7as6WF7bKVL4iXJsqOFWg3DguHkR+fJY0N1u4qXFmzvmtz3Flyvd6bXhivIPXGF
	vctJL/OQZ/EPGIEEn
X-Received: by 2002:a17:906:dc90:b0:96f:cf04:82a3 with SMTP id cs16-20020a170906dc9000b0096fcf0482a3mr7124243ejc.70.1684833604953;
        Tue, 23 May 2023 02:20:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QVxXgvr8hupi6y88smfN74RETs+4H065rSKm8uwDXUIIaBa/cxhH4Mj1EY+5no2GOcncMNA==
X-Received: by 2002:a17:906:dc90:b0:96f:cf04:82a3 with SMTP id cs16-20020a170906dc9000b0096fcf0482a3mr7124217ejc.70.1684833604525;
        Tue, 23 May 2023 02:20:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y2-20020a170906914200b0094e597f0e4dsm4152574ejw.121.2023.05.23.02.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:20:03 -0700 (PDT)
Message-ID: <2fae3c48-c9d6-7251-1692-7365f9d0cfa7@redhat.com>
Date: Tue, 23 May 2023 11:20:03 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <98f7dc1a-6bed-a66f-650e-10caeb7d0bca@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/23/23 11:14, Péter Ujfalusi wrote:
> 
> 
> On 23/05/2023 10:44, Lukas Wunner wrote:
>> On Tue, May 23, 2023 at 09:48:23AM +0300, Péter Ujfalusi wrote:
>>> On 22/05/2023 17:31, Lino Sanfilippo wrote:
>> [...]
>>> This looked promising, however it looks like the UPX-i11 needs the DMI
>>> quirk.
>>
>> Why is that?  Is there a fundamental problem with the patch or is it
>> a specific issue with that device?
> 
> The flood is not detected (if there is a flood at all), interrupt stops
> working after about 200 interrupts - in the latest boot at 118th.
> I can check this later, likely tomorrow.
> 
>>>> --- a/drivers/char/tpm/tpm_tis_core.c
>>>> +++ b/drivers/char/tpm/tpm_tis_core.c
>>>> @@ -752,6 +752,55 @@ static bool tpm_tis_req_canceled(struct tpm_chip *chip, u8 status)
>>>>  	return status == TPM_STS_COMMAND_READY;
>>>>  }
>>>>  
>>>> +static void tpm_tis_handle_irq_storm(struct tpm_chip *chip)
>>>> +{
>>>> +	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
>>>> +	int intmask = 0;
>>>> +
>>>> +	dev_err(&chip->dev, HW_ERR
>>>> +		"TPM interrupt storm detected, polling instead\n");
>>>
>>> Should this be dev_warn or even dev_info level?
>>
>> The corresponding message emitted in tpm_tis_core_init() for
>> an interrupt that's *never* asserted uses dev_err(), so using
>> dev_err() here as well serves consistency:
>>
>> 	dev_err(&chip->dev, FW_BUG
>> 		"TPM interrupt not working, polling instead\n");
>>
>> That way the same severity is used both for the never asserted and
>> the never deasserted interrupt case.
> 
> Oh, OK.
> Is there anything the user can do to have a ERROR less boot?

That is a good point. Even though the typical dmesg has at least some false-positive error messages I believe we should still strive to not log errors in cases where there is not e.g. an actual error which the user needs to care about (e.g. disk IO errors).

Usually in similar cases like this, where we are basically correcting for firmware bugs (1) we use:

	dev_warn(dev, FW_BUG "...", ...);

maybe we should switch both messages here to this ?

FW_BUG is: defined in linux/printk as:

#define FW_BUG		"[Firmware Bug]: "

And we are trying to use this in places like this both for uniformity of reporting these kinda bugs and to allow grepping for it.

Regards,

Hans



1) providing wrong / non working ACPI IRQ resources in this case


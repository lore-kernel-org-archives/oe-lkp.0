Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D1171A4
	for <oe-lkp@lists.linux.dev>; Mon, 22 May 2023 22:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684795535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0FtagtMPCZhdjQLxkhVALS9CtFRmmMprPy30yXuFW40=;
	b=FDpoKfNcJ1vEOLdNCMNT+HOjmTggwvdf31V1l+SyZnsCaM0u5EzXq4gxMefxtKo45KLj0S
	Eowkb0P8wEs5wAaaQ9lGhPoGxbu896MvfkjmE1PVSyFj/SnQEGW1nOriyR6O4voZkvvN7D
	Od2eH8Ve5rZ/K3KWPedKCxRaRpoWLCI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-M9PgSwkvPnK5Adm8fW84jQ-1; Mon, 22 May 2023 18:45:33 -0400
X-MC-Unique: M9PgSwkvPnK5Adm8fW84jQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f45ddadc74so41642571cf.2
        for <oe-lkp@lists.linux.dev>; Mon, 22 May 2023 15:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684795533; x=1687387533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FtagtMPCZhdjQLxkhVALS9CtFRmmMprPy30yXuFW40=;
        b=iShZHQqryEPsKO83ZODXidiut1RmtO7sUWQ8s7u3Q4ojwZ5obKMyhg0BkgXR+B6hIV
         CW6zgBl0+ZXqyvMK9a0AthVb/OscjdzxQinhKGUBFJvi0s5VyurlWoJqrJ3AYZSjXSJx
         hSwL7tr6WGEY84jw/WdzpBRaq0MteI2AhV4mIy7hquXR1hVXz+8keqUL91z0oXHXKqKn
         lpJdLgHsi0QS/EjhSpQxtcO4ugwW2002/05v1ajJi82OPDR+XG0jHQJOL5ju5mWXksdM
         col0EnY20i+MEPbz12dewB76EaY+yxIezJ+ou3yIoCRPe8lmm6jQTh/w3JUrgcMaB/qU
         yLoA==
X-Gm-Message-State: AC+VfDwtFkG2q7s905Hh8L+PEzcWaWrNKr90BSQt+ATehsT6JtS2VE7u
	ciGr9Tvz3EUIkVdu5OwJ2RdI8oK/L94dztFZRUSo4hdpBVl8EZbqYRwVH0i8eJumOHPIeR/V3KK
	7iimkycBnDzyMyfEM
X-Received: by 2002:ac8:5bcc:0:b0:3f4:dc79:1a6e with SMTP id b12-20020ac85bcc000000b003f4dc791a6emr18815214qtb.19.1684795533407;
        Mon, 22 May 2023 15:45:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QoB9ZN08YxUWKinY5Qg4xARLp2kT9AyL+I8LQV/JUP1TiW3Tb0GizkkcYu8GU+rMO3Zid1w==
X-Received: by 2002:ac8:5bcc:0:b0:3f4:dc79:1a6e with SMTP id b12-20020ac85bcc000000b003f4dc791a6emr18815203qtb.19.1684795533194;
        Mon, 22 May 2023 15:45:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id c14-20020ac84e0e000000b003ef13aa5b0bsm2413063qtw.82.2023.05.22.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 15:45:32 -0700 (PDT)
Date: Mon, 22 May 2023 15:45:31 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, 
	hdegoede@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	peter.ujfalusi@linux.intel.com, peterz@infradead.org, linux@mniewoehner.de, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, l.sanfilippo@kunbus.com, 
	lukas@wunner.de, p.rosenberger@kunbus.com
Subject: Re: [PATCH 2/2] tpm, tpm_tis: reuse code in disable_interrupts()
Message-ID: <sjuno2nngrloge53ypxgn36ptbuwr2m3wouxt3nwmatux27pyb@vi5hadhrljgt>
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <20230522143105.8617-2-LinoSanfilippo@gmx.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230522143105.8617-2-LinoSanfilippo@gmx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 22, 2023 at 04:31:05PM +0200, Lino Sanfilippo wrote:
> From: Lino Sanfilippo <l.sanfilippo@kunbus.com>
> 
> Avoid code redundancy by shifting part of the code in disable_interrupts()
> into a subfunction and reusing this function in tpm_tis_handle_irq_storm().
> Make sure that in the subfunction the INT_ENABLE register is written with a
> claimed locality even if the caller did not claim it before.
> 
> In the shifted code get rid of the variable "rc" by initializing the
> interrupt mask to zero at variable declaration.
> 
> Signed-off-by: Lino Sanfilippo <l.sanfilippo@kunbus.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> ---
>  drivers/char/tpm/tpm_tis_core.c | 36 ++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
> index 458ebf8c2f16..8f4f2cb5520f 100644
> --- a/drivers/char/tpm/tpm_tis_core.c
> +++ b/drivers/char/tpm/tpm_tis_core.c
> @@ -468,25 +468,32 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
>  	return rc;
>  }
>  
> +static void __tpm_tis_disable_interrupts(struct tpm_chip *chip)
> +{
> +	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
> +	u32 intmask = 0;
> +
> +	tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &intmask);
> +	intmask &= ~TPM_GLOBAL_INT_ENABLE;
> +
> +	tpm_tis_request_locality(chip, 0);
> +	tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), intmask);
> +	tpm_tis_relinquish_locality(chip, 0);
> +
> +	chip->flags &= ~TPM_CHIP_FLAG_IRQ;
> +}
> +
>  static void disable_interrupts(struct tpm_chip *chip)
>  {
>  	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
> -	u32 intmask;
> -	int rc;
>  
>  	if (priv->irq == 0)
>  		return;
>  
> -	rc = tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &intmask);
> -	if (rc < 0)
> -		intmask = 0;
> -
> -	intmask &= ~TPM_GLOBAL_INT_ENABLE;
> -	rc = tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), intmask);
> +	__tpm_tis_disable_interrupts(chip);
>  
>  	devm_free_irq(chip->dev.parent, priv->irq, chip);
>  	priv->irq = 0;
> -	chip->flags &= ~TPM_CHIP_FLAG_IRQ;
>  }
>  
>  /*
> @@ -755,20 +762,11 @@ static bool tpm_tis_req_canceled(struct tpm_chip *chip, u8 status)
>  static void tpm_tis_handle_irq_storm(struct tpm_chip *chip)
>  {
>  	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
> -	int intmask = 0;
>  
>  	dev_err(&chip->dev, HW_ERR
>  		"TPM interrupt storm detected, polling instead\n");
>  
> -	tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &intmask);
> -
> -	intmask &= ~TPM_GLOBAL_INT_ENABLE;
> -
> -	tpm_tis_request_locality(chip, 0);
> -	tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), intmask);
> -	tpm_tis_relinquish_locality(chip, 0);
> -
> -	chip->flags &= ~TPM_CHIP_FLAG_IRQ;
> +	__tpm_tis_disable_interrupts(chip);
>  
>  	/*
>  	 * We must not call devm_free_irq() from within the interrupt handler,
> -- 
> 2.40.1
> 


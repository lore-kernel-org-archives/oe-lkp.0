Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007EE1FA2
	for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 07:29:33 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 9C6F230025BE0;
	Wed, 24 May 2023 09:29:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8DF7A31373E; Wed, 24 May 2023 09:29:31 +0200 (CEST)
Date: Wed, 24 May 2023 09:29:31 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Lino Sanfilippo <LinoSanfilippo@gmx.de>, peterhuewe@gmx.de,
	jgg@ziepe.ca, jsnitsel@redhat.com, hdegoede@redhat.com,
	oe-lkp@lists.linux.dev, lkp@intel.com,
	peter.ujfalusi@linux.intel.com, peterz@infradead.org,
	linux@mniewoehner.de, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, l.sanfilippo@kunbus.com,
	p.rosenberger@kunbus.com
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
Message-ID: <20230524072931.GA31483@wunner.de>
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <CSU7G2UZSZ8K.22EGXU5CJTZBB@suppilovahvero>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CSU7G2UZSZ8K.22EGXU5CJTZBB@suppilovahvero>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 24, 2023 at 06:58:08AM +0300, Jarkko Sakkinen wrote:
> On Mon May 22, 2023 at 5:31 PM EEST, Lino Sanfilippo wrote:
> > +	/*
> > +	 * The worker to free the TPM interrupt (free_irq_work) may already
> > +	 * be scheduled, so make sure it is not scheduled again.
> > +	 */
> > +	if (!(chip->flags & TPM_CHIP_FLAG_IRQ))
> > +		return;
> > +
> > +	if (time_after(jiffies, priv->last_unhandled_irq + HZ/10))
> > +		priv->unhandled_irqs = 1;
> > +	else
> > +		priv->unhandled_irqs++;
> > +
> > +	priv->last_unhandled_irq = jiffies;
> > +
> > +	if (priv->unhandled_irqs > MAX_UNHANDLED_IRQS)
> > +		tpm_tis_handle_irq_storm(chip);
> 
> Why wouldn't we switch to polling mode even when there is a single
> unhandled IRQ?

An unhandled IRQ can be legitimate if the interrupt is shared
with other devices and the IRQ was raised by one of them.

So you only want to switch to polling if there's a significant
amount of unhandled IRQs in a short period of time.

Thanks,

Lukas

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDF1360
	for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 01:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E09C433D2;
	Wed, 24 May 2023 01:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684892821;
	bh=htgz3lE0eVnzLvjwGvmrJfm7OK1JybKFXOYQ7Xp39ss=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=SEvFtRJtMmkOmkKvuPr/zaDgPpJrI8zw/hpDkXgc/wR8OM6kpA3DvvqxK40cdYvP+
	 2i4K4SPtyFbTkvj7wFOKdmxFN0v0L0GrnhdQpKF8epb6Yy+PX7HEKchKY7UrLkCXB0
	 6HJibV7PwCWvLTSsxswEOMMojol3YXNSVfhi430G15i3+LMuC1B8gzgF206Dr/ARvM
	 NAEwwGm6Z4+hjx8zGRCE3ki3UZ9xJKPpyueV8xSGokJXfmgiUgzbL2cAXGU0pv9FzY
	 KSSnpb1Mcz1KBXA66AseQ1FHZsJL6aBqz79PO8nW5ZUbXGjf6LkZW/szUv+wdb3R8i
	 IlvCaWhcQ5zSw==
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 May 2023 04:46:57 +0300
Message-Id: <CSU4NMPD9WK6.YQ329KQG7PSF@suppilovahvero>
Cc: "Lino Sanfilippo" <LinoSanfilippo@gmx.de>, <peterhuewe@gmx.de>,
 <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <hdegoede@redhat.com>,
 <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <peter.ujfalusi@linux.intel.com>, <peterz@infradead.org>,
 <linux@mniewoehner.de>, <linux-integrity@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <l.sanfilippo@kunbus.com>,
 <p.rosenberger@kunbus.com>
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>
X-Mailer: aerc 0.14.0
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <CSTVVFNKUVJW.P69FKI6IF3ZN@suppilovahvero>
 <20230523193745.GA5820@wunner.de>
In-Reply-To: <20230523193745.GA5820@wunner.de>

On Tue May 23, 2023 at 10:37 PM EEST, Lukas Wunner wrote:
> > > +unhandled:
> > > +	tpm_tis_process_unhandled_interrupt(chip);
> > > +	return IRQ_HANDLED;
> >=20
> > Shouldn't the return value be IRQ_NONE?
>
> No, absolutely not.  If you return IRQ_NONE here then genirq code
> will increase the spurious interrupt counter.  That's bad because
> the IRQ storm detection tpm_tis_core.c would race with the IRQ storm
> detection in genirq code:
>
> Note that disablement of the interrupt must happen in a work_struct
> here to avoid a deadlock. (The deadlock would occur because
> devm_free_irq() waits for the interrupt handler to finish.)
>
> Now, let's say the 1000 unhandled interrupts limit has been reached
> and the work_struct is scheduled.  If the work_struct isn't run
> quickly enough, you may reach the 99900 limit in note_interrupt()
> (see kernel/irq/spurious.c) and then genirq code will force the
> interrupt off completely.
>
> To avoid that you *have* to return IRQ_HANDLED here and thus pretend
> towards genirq code that the interrupt was not spurious.

This would deserve an inline comment.

> > >  struct tpm_tis_data {
> > > +	struct tpm_chip *chip;
> > >  	u16 manufacturer_id;
> > >  	struct mutex locality_count_mutex;
> > >  	unsigned int locality_count;
> > >  	int locality;
> > > +	/* Interrupts */
> >=20
> > Not relevant change for a bug fix.
>
> But not harmful either, is it?

No but it is still spurious change in this context.

> Thanks,
>
> Lukas

BR, Jarkko

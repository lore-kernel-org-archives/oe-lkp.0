Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6FA53
	for <oe-lkp@lists.linux.dev>; Mon, 29 May 2023 10:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685357075; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mfYwKZkWnSyQxAG/hx8hnijLYjSP8vNivWOMWCtmLeuphfDNUwr/Nfp/TLyHFU2D8yy6dTwZjX7xRBroWnTkX96jDQPDerM10XPESXNQQEHtJl535RqAUkZMKb15+bhRUZ07ry2HDPPnCmmHTg97BNOnDD0q2TFXcxMtaydFZ78=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685357075; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=sYJRyoaWNedAUlsFNHANGDhH65d5Kl1FWDQqvTjTZEU=; 
	b=Sbf8LLAMsS1nxRbMk6UsDLAdbTjo1688hbxHU409NuE9KBlK7mpiKdVESir5ub7qG5+XDZO2bc+92sMulGVmKbbVdGpWRV6/zW24ykbCLbd01YgZ8PBZ5xwXnLeFwfN1CB5PwxdjVLeFZkDR5jvgzrFnDtOh9MZQ2uDpah9Bjmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=linux@mniewoehner.de;
	dmarc=pass header.from=<linux@mniewoehner.de>
Received: from z3r0.lan (31.187.91.190 [31.187.91.190]) by mx.zohomail.com
	with SMTPS id 168535707300856.57943381929772; Mon, 29 May 2023 03:44:33 -0700 (PDT)
Message-ID: <5bdbf3cc3335e1de1f7c13dc79a6d48b65b9d81a.camel@mniewoehner.de>
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
From: Michael =?ISO-8859-1?Q?Niew=F6hner?= <linux@mniewoehner.de>
To: Lukas Wunner <lukas@wunner.de>, =?ISO-8859-1?Q?P=E9ter?= Ujfalusi
	 <peter.ujfalusi@linux.intel.com>
Cc: Lino Sanfilippo <LinoSanfilippo@gmx.de>, peterhuewe@gmx.de, 
	jarkko@kernel.org, jgg@ziepe.ca, jsnitsel@redhat.com, hdegoede@redhat.com, 
	oe-lkp@lists.linux.dev, lkp@intel.com, peterz@infradead.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	l.sanfilippo@kunbus.com, p.rosenberger@kunbus.com
In-Reply-To: <20230523151642.GA31298@wunner.de>
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
	 <c772bcdf-8256-2682-857c-9a6d344606d0@linux.intel.com>
	 <20230523074443.GA21236@wunner.de>
	 <98f7dc1a-6bed-a66f-650e-10caeb7d0bca@linux.intel.com>
	 <20230523151642.GA31298@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 12:44:28 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.44.4 
X-ZohoMailClient: External

On Tue, 2023-05-23 at 17:16 +0200, Lukas Wunner wrote:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(&chip->dev, HW=
_ERR
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0"TPM interrupt storm detected, polling instead\n=
");
> > > >=20
> > > > Should this be dev_warn or even dev_info level?
> > >=20
> > > The corresponding message emitted in tpm_tis_core_init() for
> > > an interrupt that's *never* asserted uses dev_err(), so using
> > > dev_err() here as well serves consistency:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(&chip->dev, F=
W_BUG
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0"TPM interrupt not working, polling instead\n");
> > >=20
> > > That way the same severity is used both for the never asserted and
> > > the never deasserted interrupt case.
> >=20
> > Oh, OK.
> > Is there anything the user can do to have a ERROR less boot?
>=20
> You're right that the user can't do anything about it and that
> toning the message down to KERN_WARN or even KERN_NOTICE severity
> may be appropriate.
>=20
> However the above-quoted message for the never asserted interrupt
> in tpm_tis_core_init() should then likewise be toned down to the
> same severity.
>=20
> I'm wondering why that message uses FW_BUG.=C2=A0 That doesn't make any
> sense to me.=C2=A0 It's typically not a firmware bug, but a hardware issu=
e,
> e.g. an interrupt pin may erroneously not be connected or may be
> connected to ground.=C2=A0 Lino used HW_ERR, which seems more appropriate
> to me.

Firmware is responsible for configuring gpios and interrupts correctly,
independently of it being a design decision or a mistake. AIUI any interrup=
t
storm could be prevented by firmware in any case by simply disabling that
interrupt. Thus, FW_BUG is the right thing to use here IMO.



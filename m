Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D619E42
	for <oe-lkp@lists.linux.dev>; Tue, 30 May 2023 14:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685457632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NodDAN8jT2f3ZiV5uM1Sf1F2TeqLOOf1uMtemS/b2+xWk2M667hrwH5NRLG5oYgqn4zU9Ic2eJi6wJM68wATTj1IWUi4LXTYO6Vt/gmdgPscl8/WOt3t2O0paXShabvMd4EJY2wnRB+iLTYEhly086sTtrZXg3xkYcVfLoX7u3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685457632; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=V1GWmIY+CwXqmNGcS38lD96AhFE4C+yB1cMB5Uk2MWc=; 
	b=NqNW5iwvFO3KyRvwxfdV87L9+h79C3vge95/cUbGDEWXTaR62B1XA1iMU+CfRiSjEhhiwIIvIBJkPrYJ24n4YepZm7makTXISsGGQxCCglqkLRlPVrHPxrMBPd2YYUchL7oWwcrY2og/yNRxxAyWz8wS+5NBfc6lAk2WxErdLWk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=linux@mniewoehner.de;
	dmarc=pass header.from=<linux@mniewoehner.de>
Received: from z3r0.lan (31.187.91.190 [31.187.91.190]) by mx.zohomail.com
	with SMTPS id 1685457630706946.7287440721707; Tue, 30 May 2023 07:40:30 -0700 (PDT)
Message-ID: <0e837a2e859b4c633b068368f3c28ba30fc1af70.camel@mniewoehner.de>
Subject: Re: [linus:master] [tpm, tpm_tis] e644b2f498: RIP:acpi_safe_halt
From: Michael =?ISO-8859-1?Q?Niew=F6hner?= <linux@mniewoehner.de>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>, Lukas Wunner
 <lukas@wunner.de>,  Jarkko Sakkinen <jarkko@kernel.org>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, Philipp Rosenberger
 <p.rosenberger@kunbus.com>,  peterz@infradead.org
In-Reply-To: <6hbzssr2byskuiznx6vvatcuvjkrbhscvorzm4qcheh3n6n4zj@2nrfawn6rbst>
References: <202305041325.ae8b0c43-yujie.liu@intel.com>
	 <d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org>
	 <42ea93a1-3186-b8ff-c317-d51f3e13856e@kunbus.com>
	 <20230511141607.GA32208@wunner.de>
	 <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
	 <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
	 <fcdc5a27817b17d91df84bb06ad5d382829d5467.camel@mniewoehner.de>
	 <6hbzssr2byskuiznx6vvatcuvjkrbhscvorzm4qcheh3n6n4zj@2nrfawn6rbst>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 16:40:26 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.44.4 
X-ZohoMailClient: External

On Mon, 2023-05-29 at 13:58 -0700, Jerry Snitselaar wrote:
> On Mon, May 29, 2023 at 05:07:54PM +0200, Michael Niew=C3=B6hner wrote:
> > Hi Jerry,
> >=20
> > On Thu, 2023-05-11 at 07:59 -0700, Jerry Snitselaar wrote:
> > >=20
> > > IIRC trying to catch the irq storm didn't work in the L490 case for
> > > some reason, so we might still need the dmi entry for that one.
> > >=20
> > > The info that the T490s had a pin wired up wrong came from Lenovo, bu=
t
> > > this one even looks to be a different vendor so I wonder how often
> > > this happens or if there is something else going on. Is it possible t=
o
> > > get info about the tpm used in the Inspur system? The datasheet onlin=
e
> > > doesn't mention it.
> >=20
> > Are you sure about T490s? To me the wiring looks right on both s and no=
n-s:
> > Pin
> > 18 / PIRQ# goes to PIRQA# of the PCH/SoC.
> >=20
> > However on L490 Pin 18 / PIRQ# is wired wrongly to SERIRQ, which probab=
ly is
> > the
> > reason that catching the interrupt storm didn't work: I guess this
> > completely
> > messes up LPC communication and causes way more problems. In this case =
only
> > a
> > DMI quirk can help.
> >=20
> > BR
> > Michael
> >=20
>=20
> I'm searching to see if I can find the old bug/email where that info
> from Lenovo originated.=C2=A0 It could be that the info was wrong, and
> it was some firmware issue instead. IIRC the the T490s issue could be
> solved with the code looking for the irq storm, but the L490 needed
> the dmi check even with the irq storm checking code.

Tbh I wonder why the T490s suffers from that interrupt storm at all, but th=
at
might be a FW bug (it's not handling the interrupt). L490 definitely needs =
that
DMI check, right.

>=20
>=20
> I haven't found the info yet, but I did find some other reports from back
> then.
>=20
> Spurious irq reported with 5.5.7, so after the irq reverts in v5.5:
>=20
> tpm_tis IFX0785:00: 2.0 TPM
> Hardware name: Entroware Proteus/Proteus, BIOS 1.07.07TE0 11/15/2019

That's actually a Clevo N151CU. According to schematics it's wired correctl=
y to
PIRQA#, so probably a FW bug as well.

>=20
> Thinkpad P53
> tpm_tis STM7308:00: 2.0 TPM
> Hardware name: LENOVO 20QNCTO1WW/20QNCTO1WW, BIOS N2NET34W (1.19 ) 11/28/=
2019
>=20
>=20
>=20
> Reports from before the 5.5 reverts:
>=20
> tpm_tis MSFT0101:00: 2.0 TPM
> Hyperbook NH5/Clevo NH55RCQ

PIRQ# wired to GPP_B0 - needs correct setup in firmware -> probably a firmw=
are
bug.

>=20
> tpm_tis IFX0785:00: 2.0 TPM=20
> Clevo N151CU-derived notebook

Same device as Entroware Proteus.

>=20
>=20
> Regards,
> Jerry
>=20
> > >=20
> > > Regards,
> > > Jerry
> > >=20
> > > > > Thanks,
> > > > >=20
> > > > > Lukas
> > >=20
> >=20
>=20


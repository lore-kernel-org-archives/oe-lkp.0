Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C63FD4
	for <oe-lkp@lists.linux.dev>; Mon, 29 May 2023 15:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685372879; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PsHWBH37boivgn6l9SUGcHMBUDCneiCPydEetLZAgB4ZzXa4W2ayvWo9L++tKZL6wtMWvV3VR1oa4eGELpQisEQhFlrKfx+t3xuxe/LAZzg5l3J9qmwcxCh+L+83LeeyWJue9GfZr5HQPEi3jahuDlqqFX8C2spw+Gwz+MgG/N4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685372879; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DYXckkWz6vk81Z+sSLyNx7SrZW5XbG3DNStLiANmp9g=; 
	b=dqnjpdiwSy5UAWRTWYDfZJhKunusJQ+jZ/+Wembg8tmivCytRSidFD2Vk42teEGomUbsAiDa5XsQdbt2d0vJzqblH9RPne4xyAtIRpX6LUvacbn4GlkrOT8m2Fwcg/hy91l/sDzmtHe5jpwq/r6Ksy0+4gzJfFdUYQMI6I84TyU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=linux@mniewoehner.de;
	dmarc=pass header.from=<linux@mniewoehner.de>
Received: from z3r0.lan (31.187.91.190 [31.187.91.190]) by mx.zohomail.com
	with SMTPS id 1685372878497518.3575553410253; Mon, 29 May 2023 08:07:58 -0700 (PDT)
Message-ID: <fcdc5a27817b17d91df84bb06ad5d382829d5467.camel@mniewoehner.de>
Subject: Re: [linus:master] [tpm, tpm_tis] e644b2f498: RIP:acpi_safe_halt
From: Michael =?ISO-8859-1?Q?Niew=F6hner?= <linux@mniewoehner.de>
To: Jerry Snitselaar <jsnitsel@redhat.com>, Lino Sanfilippo
	 <l.sanfilippo@kunbus.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, Philipp Rosenberger
 <p.rosenberger@kunbus.com>,  peterz@infradead.org
In-Reply-To: <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
References: <202305041325.ae8b0c43-yujie.liu@intel.com>
	 <d80b180a569a9f068d3a2614f062cfa3a78af5a6.camel@kernel.org>
	 <42ea93a1-3186-b8ff-c317-d51f3e13856e@kunbus.com>
	 <20230511141607.GA32208@wunner.de>
	 <1a8ecf90-80a4-9aac-95e1-9ce0c4e09ba5@kunbus.com>
	 <6nf5n6fdnkhx6taa2mecnsmyw7sdgaz6fbvkqy7jqkyd7jq2u7@ogsi6ije32in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 17:07:54 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.44.4 
X-ZohoMailClient: External

Hi Jerry,

On Thu, 2023-05-11 at 07:59 -0700, Jerry Snitselaar wrote:
>=20
> IIRC trying to catch the irq storm didn't work in the L490 case for
> some reason, so we might still need the dmi entry for that one.
>=20
> The info that the T490s had a pin wired up wrong came from Lenovo, but
> this one even looks to be a different vendor so I wonder how often
> this happens or if there is something else going on. Is it possible to
> get info about the tpm used in the Inspur system? The datasheet online
> doesn't mention it.

Are you sure about T490s? To me the wiring looks right on both s and non-s:=
 Pin
18 / PIRQ# goes to PIRQA# of the PCH/SoC.

However on L490 Pin 18 / PIRQ# is wired wrongly to SERIRQ, which probably i=
s the
reason that catching the interrupt storm didn't work: I guess this complete=
ly
messes up LPC communication and causes way more problems. In this case only=
 a
DMI quirk can help.

BR
Michael

>=20
> Regards,
> Jerry
>=20
> > > Thanks,
> > >=20
> > > Lukas
>=20


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B01360
	for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 01:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6D3C433D2;
	Wed, 24 May 2023 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684891745;
	bh=L8rNn85YTf6zDLUEoc9Hm5F9QIebVUAKQ95REQj8Ctg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=F3sq/CyWzbUgVWCxGrl0nwSVGS9Sa9NE8DhNz2S92oZSWwYpTL8nkvKxTBSEDQe+f
	 T4f6oO1YO8l8pm2oEAcdRraMFpM0LFQwYSGOjCYY8TVuBeOUVxkso4pOasbnvgYQ3u
	 RkW+kIuGqX7lWykISd49dUGZGZ/OFvC/X0R3+HVOepV9YpTSBp4x2zXMZ002ZNmbou
	 UTz2IFJpixhkiHIPd0y3YWs+idmMorzszWrCuM/hjeITa1FzS+Kn4J7MUdPTJ8llV1
	 HWnwfMJoPZ+WAU/tXddFyYpSDH61ChRrAzRVze9BVdTX2qCBk3H9YVXx1Hr2qOGKnp
	 fvXu0568HjbSQ==
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 May 2023 04:29:00 +0300
Message-Id: <CSU49W63M584.3VBYBMYWJZ3H5@suppilovahvero>
Cc: <jsnitsel@redhat.com>, <hdegoede@redhat.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, <peter.ujfalusi@linux.intel.com>, <peterz@infradead.org>,
 <linux@mniewoehner.de>, <linux-integrity@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lukas@wunner.de>,
 <p.rosenberger@kunbus.com>
Subject: Re: [PATCH 2/2] tpm, tpm_tis: reuse code in disable_interrupts()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lino Sanfilippo" <l.sanfilippo@kunbus.com>, "Lino Sanfilippo"
 <LinoSanfilippo@gmx.de>, <peterhuewe@gmx.de>, <jgg@ziepe.ca>
X-Mailer: aerc 0.14.0
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <20230522143105.8617-2-LinoSanfilippo@gmx.de>
 <CSTW5YGZ50O1.16RYO14HOQRH2@suppilovahvero>
 <f22d2c28-5934-a989-3aea-4ff4d20b6326@kunbus.com>
In-Reply-To: <f22d2c28-5934-a989-3aea-4ff4d20b6326@kunbus.com>

On Tue May 23, 2023 at 11:52 PM EEST, Lino Sanfilippo wrote:
>
>
> On 23.05.23 21:07, Jarkko Sakkinen wrote:
>
> >=20
> > NAK as invidual change w/o further discussion.
> >=20
> > Would need to be seen in context. This does not change kernel for
> > better.
> >=20
> > If you want to wrap, please do it in 1/2 and then we can evaluate
> > whether it makes sense or not.
> >=20
>
> Ok, will do so.

And generally: keep it *minimal* :-) We want to exactly fix the bug,
and take absolutely no other action.

BR, Jarkko

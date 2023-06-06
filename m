Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9DA19915
	for <oe-lkp@lists.linux.dev>; Tue,  6 Jun 2023 16:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD03C433D2;
	Tue,  6 Jun 2023 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686069728;
	bh=j1m4n2Ft+Okmau+IY+Kq7vY9Ls9xpmV6RhwDX07Oe10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpCebbSXqe7rCxSSKi8VxZhoONsd+ZPxJQO5KyAk/KNmGMx4Ry7ExyC1qrrnb1reG
	 t1hRLj2ewsrwNjDK0byKugqoA609VyqhKy0egcHCfF7GJQCpLAo7B7lctxt9rg3rqO
	 aQp3A3KGie33fnuSVMoBqRKtr7qi6fzuKDAooWe5R8GCeno4LmUseur0H4XFuG3ATd
	 yRuUXlFz0YNkWCuM0mnB0wIxSf0Dl+ftt98/HArJ0pocLJNMVvSf+40Plnxacp1jQ2
	 DXT52cJovReLE3bGtoPHQghBMwVpjUHufaWvb0Sm9Z+UX5ngbt4J0WfTC6fUzns9Tc
	 n4DgCVCk6alGQ==
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 19:42:03 +0300
Message-Id: <CT5PU1RV2X20.3AYQOV5CF0EIH@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lino Sanfilippo" <LinoSanfilippo@gmx.de>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Lino
 Sanfilippo" <l.sanfilippo@kunbus.com>, <peterhuewe@gmx.de>, <jgg@ziepe.ca>
Cc: <jsnitsel@redhat.com>, <hdegoede@redhat.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, <peterz@infradead.org>, <linux@mniewoehner.de>,
 <linux-integrity@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lukas@wunner.de>, <p.rosenberger@kunbus.com>
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
X-Mailer: aerc 0.15.2-33-gedd4752268b2
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <CSTVVFNKUVJW.P69FKI6IF3ZN@suppilovahvero>
 <da435e0d-5f22-fac7-bc10-96a0fd4c6d54@kunbus.com>
 <a84c447f-cdfb-d33c-62cb-bb5d9aa8510b@linux.intel.com>
 <3d350827-795e-8277-a209-1c1d33ca57fa@gmx.de>
In-Reply-To: <3d350827-795e-8277-a209-1c1d33ca57fa@gmx.de>

On Mon May 29, 2023 at 4:15 PM EEST, Lino Sanfilippo wrote:
> > Except that if the line got the spurious designation in core, the
> > interrupt line will be disabled while the TPM driver will think that it
> > is still using IRQ mode and will not switch to polling.
>
> In the case that an interrupt storm cant be detected (since there might n=
ot even
> be one) I am fine with adding a quirk.

Speaking of generic vs quirk (if storm can be detected): detection
should be eager as ever possible. Too eager does not cause systems
failing.

This way I think we can converge to stability fast as possible.

Then, later on, if a system where interrupts should work but the
detection disables interrupts we can either make the fixed threshold
less eager, or add a tuning parameter to sysfs.

BR, Jarkko

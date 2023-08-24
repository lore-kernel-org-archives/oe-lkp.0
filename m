Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0092890D
	for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 14:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95621C433C7;
	Thu, 24 Aug 2023 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692887177;
	bh=YMPIxCvyCLUmyZwI71t7N3ml0vkctUvAVh2phjfohoY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZLlXNaqcZm0HjZA4DXwZu3vUcdBCPaMJSiBdwrZq0cbNEOnVdQai9ZxWfV09LNh0T
	 bsO4Y6MWYGW/Nz7xb78W4yRfFJkeKgMJi9q8Uli2GwX8JrFMYzLonXEJAPEdRRD4Lt
	 aS6DpdFrvB4CYUNUZmFDZ8epDER9zkfV6FddP6j47yWlfmM4Fn6fsAUgAeNjw0mVpN
	 HGPfI/neyT+ZpUG/sBhJVT4r3mFn0IKBGQTynaVJ452GHU6lMnSkSthed7YzY0b24p
	 CyLmUV0VxaABaEwN6NCUYE118gVSIeQVBa7nGfg9EyMyXA1sFQXKz00PK1OwF9hYQT
	 QBkfuV/LFeG0w==
Message-ID: <29dec29c4a776db82406f272557f97cebabca963.camel@kernel.org>
Subject: Re: [linus:master] [NFSD]  39d432fc76:  fsmark.files_per_sec
 -100.0% regression
From: Jeff Layton <jlayton@kernel.org>
To: Benjamin Coddington <bcodding@redhat.com>, Chuck Lever
	 <chuck.lever@oracle.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Date: Thu, 24 Aug 2023 10:26:15 -0400
In-Reply-To: <D38094B9-CE6F-4BE1-9250-22073A1DD86E@redhat.com>
References: <202308241229.68396422-oliver.sang@intel.com>
	 <ZOdZ7DiQ4jqhoj0i@tissot.1015granger.net>
	 <D38094B9-CE6F-4BE1-9250-22073A1DD86E@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-08-24 at 10:12 -0400, Benjamin Coddington wrote:
> On 24 Aug 2023, at 9:23, Chuck Lever wrote:
>=20
> > On Thu, Aug 24, 2023 at 01:59:06PM +0800, kernel test robot wrote:
> > >=20
> > >=20
> > > hi, Chuck Lever,
> > >=20
> > > Fengwei (CCed) helped us review this astonishing finding by fsmark te=
sts,
> > > and doubt below part:
> > > -			nfsd4_end_grace(nn);
> > > +			trace_nfsd_end_grace(netns(file));
> > >=20
> > > and confirmed if adding back:
> > > 			nfsd4_end_grace(nn);
> > >=20
> > > the regression is gone and files_per_sec restore to 61.93.
> >=20
> > As always, thanks for the report. However, this result is not
> > plausible. "end_grace" happens only once after a server reboot.
> >=20
> > Can you confirm that the NFS server kernel is not crashing
> > during the test?
>=20
> Does the removal of nfsd4_end_grace() here disable the ability of nfsdclt=
rack to
> terminate the grace period early on a first start of the server?
>=20
>=20

Yes. That should be the only effect (which is why we didn't notice it).
--=20
Jeff Layton <jlayton@kernel.org>

Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798CC1AD403;
	Wed, 29 Jan 2025 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169858; cv=none; b=Hu3eWOp9YU3IvMvMmeZDJDhTYnTO2KRTt0s/GjmDswkDaZB2YxFu6ny2NfwCBBe6UYd7ClMh59csstID9BlhD1pqSrlStiNWNgz3W6TGgGq/5h7lMd4BuphFy9S0rITmpxb2qzUyEQnoYBGrlXtobaG6/vqv5npqeF1HruzGBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169858; c=relaxed/simple;
	bh=1B0A8mVN+V7iodxzUWsrhOgTlEF9R2VXKba/5gmeiuY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jlY0M4Q3+gFwnti5/4StSTcbuqFjQlQb+oP8ZD7vvl6j3FtzTBvuExY1Y8Z2F9qAhfiplNrrd88rDjYuiP9cHcvPs7auWOaUc2i52qWLn3ZWV2ZBEQcE8pXW3jypa85Ji5t88q6KQ2eqmDrVCADOH+q0zbK2rCTDKGQtxd21jJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tdBNP-000000000u3-1MOV;
	Wed, 29 Jan 2025 11:57:19 -0500
Message-ID: <13f95d28b0110a87b492d46e9810af51b33a23c8.camel@surriel.com>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
From: Rik van Riel <riel@surriel.com>
To: Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney"
	 <paulmck@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>,  Peter Zijlstra <peterz@infradead.org>, David
 Hildenbrand <david@redhat.com>, kernel test robot	 <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, 	linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Catalin
 Marinas	 <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>,
 Hugh Dickins	 <hughd@google.com>, Jann Horn <jannh@google.com>, Lorenzo
 Stoakes	 <lorenzo.stoakes@oracle.com>, Mel Gorman <mgorman@suse.de>, Muchun
 Song	 <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>, Will Deacon	
 <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>, Dan Carpenter	
 <dan.carpenter@linaro.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Date: Wed, 29 Jan 2025 11:57:19 -0500
In-Reply-To: <Z5pdF1w9Lcwpdixp@localhost.localdomain>
References: <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	 <20250128132847.GB505@noisy.programming.kicks-ass.net>
	 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
	 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
	 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
	 <20250129105920.7a4bffa1@fangorn> <Z5pTZ0XLFzfM5dic@casper.infradead.org>
	 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
	 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
	 <Z5pdF1w9Lcwpdixp@localhost.localdomain>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

On Wed, 2025-01-29 at 17:53 +0100, Frederic Weisbecker wrote:
> Le Wed, Jan 29, 2025 at 08:36:12AM -0800, Paul E. McKenney a =C3=A9crit :
> >=20
> > So it won't prevent RCU callbacks from being invoked.
> >=20
> > It *will* ensure that only a finite number of RCU callbacks get
> > invoked.
> > For some perhaps rather large value of "finite".
> >=20
> > Does that help, or is more required?
>=20
> I don't fully understand the issue either but would spin_lock_bh()
> help?

Was that a jinx, or an ack to that latest patch? ;)

--=20
All Rights Reversed.

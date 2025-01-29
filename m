Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6DA19D886;
	Wed, 29 Jan 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167292; cv=none; b=LUXBSW6mIGzKvXF/bIIz7/HgeGSogn7Kf8/DSd1BbpGGvTvbTXOGm061snPl3YzDc7SwnGN4C/WYh+wFsXpcX04xx7HvWqEItlVLUn3wmKnG0FQQf2QBN4ot941Q0cjQNtpPrrklCPGrz5nldu0RbBzpJfTaxbtj11YF3oum8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167292; c=relaxed/simple;
	bh=eOrkqF/jEbDwlVLCBKzcKz36pjkWmXUSVUkAlWZd/+o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tCebLJ00mKHz/k3+dApT1meDHffMO2ScOoovQfuNEqui7ViNgjkizE9ryDOvHTuHrhLcgGITtd8grntfelsWDT1fKJ8MszKHztzmz8b6RUB95rrEcMomy3YhbIrCi4dNNM66WDyffgCQbdp/2Mb1XFF+ASwlVe9E23upclw7wuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tdAhx-00000000093-2xkA;
	Wed, 29 Jan 2025 11:14:29 -0500
Message-ID: <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
From: Rik van Riel <riel@surriel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, Peter Zijlstra
 <peterz@infradead.org>,  David Hildenbrand	 <david@redhat.com>, kernel test
 robot <oliver.sang@intel.com>, 	oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, Andrew Morton	 <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, David
 Rientjes	 <rientjes@google.com>, Hugh Dickins <hughd@google.com>, Jann Horn
	 <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mel
 Gorman	 <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>, Peter Xu	
 <peterx@redhat.com>, Will Deacon <will@kernel.org>, Zach O'Keefe	
 <zokeefe@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay	 <neeraj.upadhyay@kernel.org>
Date: Wed, 29 Jan 2025 11:14:29 -0500
In-Reply-To: <Z5pTZ0XLFzfM5dic@casper.infradead.org>
References: <202501281734.d408a35b-lkp@intel.com>
	 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
	 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
	 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	 <20250128132847.GB505@noisy.programming.kicks-ass.net>
	 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
	 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
	 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
	 <20250129105920.7a4bffa1@fangorn> <Z5pTZ0XLFzfM5dic@casper.infradead.org>
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

On Wed, 2025-01-29 at 16:12 +0000, Matthew Wilcox wrote:
> On Wed, Jan 29, 2025 at 10:59:20AM -0500, Rik van Riel wrote:
> > Below is a tentative fix for the issue. It is kind of a big hammer,
> > and maybe the RCU people have a better idea on how to solve this
> > problem, but it may be worth giving this a try to see if it helps
> > with the regression you identified.
>=20
> Perhaps better to do:
>=20
> +++ b/mm/page_alloc.c
> @@ -97,8 +97,8 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
> =C2=A0 * On SMP, spin_trylock is sufficient protection.
> =C2=A0 * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
> =C2=A0 */
> -#define pcp_trylock_prepare(flags)=C2=A0=C2=A0=C2=A0=C2=A0 do { } while =
(0)
> -#define pcp_trylock_finish(flag)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do =
{ } while (0)
> +#define pcp_trylock_prepare(flags)=C2=A0=C2=A0=C2=A0=C2=A0 rcu_read_lock=
()
> +#define pcp_trylock_finish(flag)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcu=
_reada_unlock()
> =C2=A0#else
>=20
> =C2=A0/* UP spin_trylock always succeeds so disable IRQs to prevent re-
> entrancy. */
>=20
> with appropriate comment changes
>=20
Agreed. Assuming this change even works :)

Paul, does this look like it could do the trick,
or do we need something else to make RCU freeing
happy again?


--=20
All Rights Reversed.

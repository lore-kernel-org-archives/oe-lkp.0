Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04AEBE40;
	Tue, 28 Jan 2025 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738089413; cv=none; b=NqXEDDjX4uJox428+C/1j35zTkPCiKKGDM3l5Uf4bsiHZP2946T8TXQU8mEUz7VPK7kjXQi3m0q5p6SRSpUdJKHqw/gnOnbSrjJT5qbsIogssskeMlu05AQ2rGKf7931CWQN9KXUyiA35cnaOEmkNq+U1fXZ9tE5m5+N/Ve14Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738089413; c=relaxed/simple;
	bh=xE9oyUQW3CEmRFvnNDCHp3FvnY+QbHmQk4bVWLWdCu8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RK4gcx1x4Jhtc9IDrP25dndhTFXM5S+iGdZMaWEwXp3GBECTxs8j1ynGuI3IvEuXx4npGOTeYW851OKktg65GUAdAXg/Mlqcef6XzcmUIob7okPWoWuIYwFccglvFFMtQS1IxfHJCZ7MSldaC/tB0zByrbI/ujXwN9MincxZK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tcqR3-000000004uD-494G;
	Tue, 28 Jan 2025 13:35:42 -0500
Message-ID: <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
From: Rik van Riel <riel@surriel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>, David Hildenbrand
 <david@redhat.com>,  Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Andrew Morton	
 <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, David Rientjes	 <rientjes@google.com>, Hugh
 Dickins <hughd@google.com>, Jann Horn	 <jannh@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Mel
 Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,  Peter Xu
 <peterx@redhat.com>, Will Deacon <will@kernel.org>, Zach O'Keefe
 <zokeefe@google.com>,  Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 28 Jan 2025 13:35:41 -0500
In-Reply-To: <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
References: <202501281734.d408a35b-lkp@intel.com>
	 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
	 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
	 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	 <20250128132847.GB505@noisy.programming.kicks-ass.net>
	 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
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

On Wed, 2025-01-29 at 01:06 +0800, Qi Zheng wrote:
>=20
> I did reproduce the performance regression using the following test
> program:
>=20
> stress-ng --timeout 60 --times --verify --metrics --no-rand-seed=20
> --mmapaddr 64
>=20
> And its call stack is as follows:
>=20
> bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=3Dcount();}=
=20
> interval:s:1 {exit();}'
>=20
> @[
> _raw_spin_unlock_irqrestore+5
> free_one_page+85
> rcu_do_batch+424
> rcu_core+401
> handle_softirqs+204
> irq_exit_rcu+208

That looks like the RCU freeing somehow bypassing the
per-cpu-pages, and hitting the zone->lock at page free
time, while regular freeing usually puts pages in the
CPU-local free page cache, without the lock?

I'm not quite sure why this would be happening, though.

Maybe the RCU batches are too big for the PCPs to
hold them?

If that is the case, chances are more code paths are
hitting that issue, and we should just fix it, rather
than trying to bypass it.

Maybe the reason is more simple than that?

I have not found a place where it explicitly bypasses
the PCPs, but who knows?

--=20
All Rights Reversed.

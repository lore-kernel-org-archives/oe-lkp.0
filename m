Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624826;
	b=MIYa72RBiUtETHzeBYUW/1tQAalp95Q5I21GqN/vFX5g9gzxEuPg/Ie5L7CJdfoFUau8
	 dS0IudTEU8RAZPccGQ65DgGt1OVKQI1stOs3ZFLzQK7mTi2ARtRm2oYSnlcn4WLuTzRsX
	 QT/CdjpuCccdffZkF6x9TKMD4i7MTL1XLJAWJ/pWxlg0kzCaYt/mL1KhO0kkIJjru2BcW
	 yTu84CoY8H84AE4qEr0X/I9FuYy+tevtvl+6BqCUW3lJqenb6ihXo/PbQQU4SoKzjs1Go
	 CW3hQv25+RZASHSvUS6Vjik4RJmosKtTnArXRLnnpnVb2N5/V9oA0xVHgEulzHnXhuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M6si0L6IkcJTY0ySD5eo4lPaTuujwGDaAXZ2WV+4vPo=;
	b=JHbytHTZVEGU3DW6ngDQBj9cUyfzCiy/LhCtPFWO4MwRJwoKu8ny42iwSh/bjWM2uwL1
	 DZEb68NoTvI0oOKS11t0AMPcQNTD/m/SSnbiCG10rSWhBa5Lcw/utiboPPap0VuyUfSV3
	 ukjr8SThojV823LKlObUvttgQJqdlt94m41CULfV4phBVAUkRtu2hDptz7cSHHU0Bi6jW
	 FHsGkTDgKr+djnVQbX4gioKjnmijM/9kUPMkPVehbsS1BGjYSiexY4Hot/zujR+uQvvOE
	 TDOLD527pKbVRzGh9E5EMaABW84q/hJAD/xQ6d7eWNGJt2rqKLPVG8YzugXjezwBAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MT0lml1B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD64606A680
	for <oe-lkp@lists.linux.dev>; Wed, 25 Nov 2026 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MT0lml1B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D651F000EC;
	Wed, 25 Nov 2026 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795624826;
	bh=M6si0L6IkcJTY0ySD5eo4lPaTuujwGDaAXZ2WV+4vPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MT0lml1BD0MVaxFbYCiDa6kGf+Fufw7PmC4jRB79QEunJE75482OGgaJoDYKKfv1e
	 +iwUq2JFos4IsraaMWKkT2c96dgo97zc1qNNh7CRicufgDFQ0uFoKdGvlFb76Gs6/k
	 SilU/Ls3M+2pLkOgL8yFePBa5his73RZ+ljVELpROBw0hEJgwBbnQfGFgOMIO4iV0j
	 4IJuBjd66SuKcyOZauBOtomzA4bvzuswr84Hxo4GFmJDdWMac0k2dACyMQy6pOzzwL
	 ZND2KythHdD67E/S2Q1in7EwJfdiRBkLh0WpZbbHNcyRt3uuffNl/GHnvSbnFZwuVr
	 y+izVVUvotpSw==
Date: Wed, 25 Nov 2026 16:40:21 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	David Hildenbrand <david@kernel.org>, Eliav Farber <farbere@amazon.com>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/memory]  f8eca7ec1b:
 xfstests.generic.437.fail
Message-ID: <awcPZG-dG5DvT2o4@gremlin>
References: <202611252134.37a9cb7e-lkp@intel.com>
 <awbxo7VZyrECnFtj@gremlin>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awbxo7VZyrECnFtj@gremlin>

On Wed, Nov 25, 2026 at 02:34:15PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 25, 2026 at 09:47:05PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed "xfstests.generic.437.fail" on:
> >
> > commit: f8eca7ec1b368557613cc727abadc82546c1f46a ("mm/memory: do not report OOM if insert_pfn() races a huge fault") https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > [test failed on linux-next/master 3dd8c790a7b7027abdd568e36db5e82ffaea7c77]
> >
> > in testcase: xfstests
> > version: xfstests-x86_64-d07dca72-1_20261110
> > with following parameters:
> >
> > 	bp1_memmap: 4G!8G
> > 	bp2_memmap: 4G!10G
> > 	bp3_memmap: 4G!16G
> > 	bp4_memmap: 4G!22G
> > 	nr_pmem: 4
> > 	fs: ext4
> > 	test: generic-dax
>
> Ack let me fix this, I need to have this return -EBUSY not -EFAULT, meant to do
> this sooner but got so tied up with other fixes ugh.

Fix sent at https://lore.kernel.org/all/20261125-huge-pfnmap-fault-races-v3-3-bbc44489341b@kernel.org/

--
Cheers, Lorenzo

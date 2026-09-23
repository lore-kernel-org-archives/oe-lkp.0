Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300673BE635;
	Wed, 23 Sep 2026 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148006; cv=none; b=Pxa6GaGbQDsfJ0ngzsNGY5o79zLnznGPsgoBr5SC+IuJT9/Ck02DN0RlDGqbBB25/t1YJpKwvYeh/a7f6TKuzj+x3F/dV2kQrEa6IejEr2C0dbkAPM22UzLugf/+0DFDXWXvq3Up3ZZZ0wITNR9l5uuRMKUposSx4NJRzWGMuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148006; c=relaxed/simple;
	bh=gziUiBPvy7xlnA9Psh/XnuMh7PkIHbeXiu+KpjWd6go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhK8VliNmva2ozRkRNmD5VpDNbhwK8hm80rNj4TxIzyKbq9tV/g3BeYoMK09urSEj97hn5TYf1i0rI8EX+DLiVx6NbAL7jSHK+egrA0irKx7iA7KglKH+OQ/nq4YCH9Df8Bn65fNPjSQc2ItK9yLzfWMU0npM59mxy9w6AfHoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pjp16mZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pjp16mZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F2F1F000FF;
	Wed, 23 Sep 2026 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147998;
	bh=gziUiBPvy7xlnA9Psh/XnuMh7PkIHbeXiu+KpjWd6go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pjp16mZsVP5+uIktXkAWb55DfP3vzDdpoxGQASzoYolcqBMemw9oonzL8IBUYGRnk
	 ekxdXaZVkK34HQAlc6hY2aqFH+PmdtWeo1hBB0QnDq5yilA8uUqhKxaOGoq/PJZQQp
	 cnyVDJpmic/PRv6PaC7FkDs2PnWGVeT6AM7PvYm7BfCxZ9athTVXREu2RIp7CB8pU0
	 n8Z0c7LBPlb2eJmswE3Jm+jlRG71Ls2cTJwtJKVQvdzgNKpsGxmsntfxjD85mfm557
	 vfXzAJODkO0Qp3BJdTUAVR8W4knmv4REgN/mFN0+0h88Atr4I8A+aoFICQpSo4pRBo
	 pXCeKZw1kkSCg==
Date: Wed, 23 Sep 2026 08:19:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Daehyeon Ko <4ncienth@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Hagen Paul Pfeifer <hagen@jauu.net>, Jakub Kacinski <kuba@kernel.org>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/secretmem] 97d34aa65c:
 stress-ng.secretmem.ops_per_sec 99.5% regression
Message-ID: <arN9UtxVQpWqTZ8C@gremlin>
References: <202609230824.7a9189aa-lkp@intel.com>
 <7ea6e90a-e2fb-4793-b6ea-e292388bdfdf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ea6e90a-e2fb-4793-b6ea-e292388bdfdf@kernel.org>

On Wed, Sep 23, 2026 at 08:35:47AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/23/26 03:00, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 99.5% regression of stress-ng.secretmem.ops_per_sec on:
> >
> > commit: 97d34aa65c29cca85e3e9050f4c936389b38a054 ("mm/secretmem: properly account locked pages") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> Well maybe there is some inefficiency that can be fixed (haven't checked)
> but if it's the cost for proper accounting then so be it? I doubt creating
> secretmem pages is something userspace would have to do intensively enough
> to matter.

Yeah, exactly.

This isn't something that should be benchmarked, this is possibly the most
ludicrious benchmark I've ever seen :)

If establishing a secretmem region is on your hot path you have engineered your
software wrong.

This is effectively a security flaw so I'm afraid must remain.

--
Cheers, Lorenzo

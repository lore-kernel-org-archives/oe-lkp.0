Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710605;
	b=YrZZyYmgF5q5f0++tjdOOwcgHr2HdfeH2lB8qyYNK9Ec6u//lMXt+fNwdYsOwjgIWDlI
	 XfhECeESDFYeE1FKee4MA5sm4YhXAyANreQuuiSppM5kcM9ISckB7dWArmLhShnAWI7/j
	 TGTkdma+1GNdLIm+wC8XojZYtm6iBe15t9mCeSS2YMqbY7ugzuDMtRbncWsvCg7J5SnTn
	 zEgd/84da/1PirFlJ3a/RzsR4tchq3EZEgh+QdlT1YP/lCtpu8UZlYmJhGhJ/1JQ6dbMi
	 KRSqrcNpuPAXXpl7bql7s+FVTmPtnW490umf+wc0tEosz/5WP87JbgQx7F2fczDSt9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710605;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=550l5NSMeWOUt7dSUoYx2SoXWS5kNeVAAxHhUo7UaiA=;
	b=rEoiahAq9Ipcvu9MlAIiL+ki2tfn9SY+PvEVXRrBg+jODNA245mzPzvjzF7B2iPMQLz6
	 yRIqf4VdMnf4/Hb5E7M7jrkjZOmeFJ6mvNTdPaIrRowfBp+xenhHt2XVzNWHQcoRr3d+j
	 4mR7w6w7LpcxazCp4lNk4tEcmxIojqpVbk08Ia4oxlDZ3y4fiM3wtxJelt/3Fa2sd1GOp
	 KvVahouOqlubjpYPsY0n/isQLMtF1kRFYPonNMLqnE2p179xmpJKmXBGx1MC4HmygfF1c
	 IVVTpc8ht+3W7uZ/GEjNqf4XwFSjCGWTSRYr2LavKm8k/XO4VVNtWuyJdwN5Q34AcLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=epteBc3c;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07A606A328;
	Tue,  3 Nov 2026 12:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D07A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=epteBc3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=550l5NSMeWOUt7dSUoYx2SoXWS5kNeVAAxHhUo7UaiA=; b=epteBc3c0oZ2Npdn5lECSkbDTS
	FobmpV3xqhG7OFfwgB8aLkGeR8ld8/+b7zcIMyEzlnCwzm30dvjvEBNPCVZwU+IdtMUovIDxbiWGv
	X14cqkR5y8A9ESIkPEP/0/6VgzHuW31nu8AmU3Ssqsna3e/liMq4HbBbacIhKqOW3rpos8s6tbWWz
	zP90acGfsxti7EbzLW+52879NbHnKpR5G+n39Fr9+8TD+wAQ6Oiv44lEzW+RaDi5v76LbrVN+eH8Z
	+qT9ICB20WKnZIGx8uTMhEZ7uV4djBp2jCIPWJ02O49ZrEhBVhIqPc1abpfxE5pw1AexIRGkyxHau
	dkUHmZzg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE41-00000000SpM-1jHB;
	Tue, 03 Nov 2026 12:56:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85719300322; Tue, 03 Nov 2026 13:56:31 +0100 (CET)
Date: Tue, 3 Nov 2026 13:56:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkman <daniel@iogearbox.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Gary Guo <gary@garyguo.net>,
	Guo Ren <guoren@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>, KP Singh <kpsingh@kernel.org>,
	Marc Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Rich Felker <dalias@libc.org>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Will Deacon <will@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [linus:master] [atomic] 80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Message-ID: <20261103125631.GZ1779021@noisy.programming.kicks-ass.net>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103123508.3910990-1-sashal@kernel.org>
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
In-Reply-To: <20261103123508.3910990-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 07:35:08AM -0500, Sasha Levin wrote:
> On Tue, Nov 03, 2026 at 01:26:47PM +0100, Peter Zijlstra wrote:
> > The below 'fixes' it, but the question is of course, WTF are we using an
> > on-stack pmd value for set_pmd().
> 
> The split fills in the new PTE table before installing it, and uses a
> temporary pmd on the stack so pte_offset_map() can find the table:
> 
> 	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
> 	pmd_populate(mm, &_pmd, pgtable);
> 	pte = pte_offset_map(&_pmd, haddr);
> 
> __split_huge_zero_page_pmd() does the same thing.
> 
> I tried the typedef change. It works, but gcc ends up realigning the
> stack in a lot of pte/pmd code (126 more functions with Arnd's version
> in a small config, 204 with yours), including handle_mm_fault(). Just
> aligning the two locals seems simpler:

Does that matter though?

> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index bd44d58e86845..b8faa6df9bb14 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3132,7 +3132,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	pgtable_t pgtable;
> -	pmd_t _pmd, old_pmd;
> +	pmd_t _pmd __aligned(sizeof(pmd_t)), old_pmd;
>  	unsigned long addr;
>  	pte_t *pte;
>  	int i;
> @@ -3180,7 +3180,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	struct folio *folio;
>  	struct page *page;
>  	pgtable_t pgtable;
> -	pmd_t old_pmd, _pmd;
> +	pmd_t old_pmd, _pmd __aligned(sizeof(pmd_t));
>  	bool soft_dirty, uffd_wp = false, young = false, write = false;
>  	bool anon_exclusive = false, dirty = false;
>  	unsigned long addr;

This will work; but it feels more fragile.

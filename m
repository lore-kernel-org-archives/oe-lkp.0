Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717573;
	b=D7zC8koGXIgBTkhfu0cCPhmKV2KSIQE/RgcQo274hHuhZ0c3Ubrh+H0hEyPQS8/zHpaI
	 6U0rgyvo9M9nybWTjse+vfj1/36v5ieDLp5cr9q9GhgHspH9h5UXswFHhJ1qTvsU5xOov
	 MEkNX5RwX6GJEAKRGoqOGnbpC/iskY2dAaNyhWUlDd0Ry6y71DFVzZPqn0E6NJIh9e5ba
	 e8VMYaJdrqMi31C5wAVdpndQSp88tsEhwGk0YTAo1jPAS5ozzztW3vskCeYOzs2tZli78
	 3gGjqrtsgWkZLxvub3QWzpka1oQeT0ev0oOd6RnXQ38ml68bXBGHy3Fcwaz1F9T781g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717573;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=AZzVmOOfoRtDvZHpF7qwPdY9qMJ2XRmaKfYRT9GKTJM=;
	b=dU5U46tBPh8fcUzmXuYWZjtj+v6/vvzLR11vVDoY2UgCpWSHd3AlBi6RsAtwrqx8095w
	 yzcadsIN35AAjxpkImLO0mNjPTsWnvuce2pEgK/Vk/c7dAbDg4UAgXgNaB65MzkeCXS5V
	 Dd1+n86Wbw2Y1NsbKQzQMZM7Qh7yTiPPAaM2LWNNzEeXF9jgyE1BOaeJDlE3Y+ig95qvu
	 KsO4k3cZOgO5QUdzUqfeU7CAX+yyAZ1CvwA/u4EB8xw3E7iGB5eEvuEeEkVJr6xkK1Ck+
	 hGZtgVKHt4nC71EcmSMmrXULv4GGLrg+v5jWYRCHIz0XsvuVWZ6qXjHMLr/1f4b0ASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=skz89O6F;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84026606B24E;
	Tue,  3 Nov 2026 14:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84026606B24E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=skz89O6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AZzVmOOfoRtDvZHpF7qwPdY9qMJ2XRmaKfYRT9GKTJM=; b=skz89O6F8mEMMNAlN1u/nqq/Nd
	Am9hqZOCT8D63YyzHpNND8SaYE7BEFaMaPgSN1SXruvzs3jWwVbmwO15MPpWrpfUvhhVI6lh8oCQg
	vihlRywjPlCWqWXryCEux9ucABuQ3flQ4k1vEpsm19EAKcG/SD4lerWSD7aOspiW9J3PLKSqXTVQq
	DaVcLkgntHTCpDCQUzFG6cdwMuE1hupteVUPjtcatFiMXb3p+jprlXmi33oYgyKSVwip16YVuqbxv
	x/1UR+UqZpE0nX22ScRLXLcLFolszfJYW0mhkSyCLlm917oXRyvBenEHMqi97nC02kD7akamLQvu0
	W/ZJbZdQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFsD-0000000Ebhh-1pHh;
	Tue, 03 Nov 2026 14:52:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2505B301185; Tue, 03 Nov 2026 15:52:28 +0100 (CET)
Date: Tue, 3 Nov 2026 15:52:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <yi1.lai@intel.com>,
	oe-lkp@lists.linux.dev, kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Gary Guo <gary@garyguo.net>,
	guoren <guoren@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>, KP Singh <kpsingh@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20261103145228.GO2668804@noisy.programming.kicks-ass.net>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103123508.3910990-1-sashal@kernel.org>
 <e69e6690-cfc0-4ea8-83e1-5ad2d98b84d5@app.fastmail.com>
 <846703eb-111c-4376-a0ba-36bd3e13f632@app.fastmail.com>
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
In-Reply-To: <846703eb-111c-4376-a0ba-36bd3e13f632@app.fastmail.com>

On Tue, Nov 03, 2026 at 02:41:32PM +0100, Arnd Bergmann wrote:

> FWIW, I checked the other architectures that may be affected:
> 
> - 32-bit arm has transparent hugepages and a 64-bit pmd_t with lpae,
>   but that type has natural alignment, and pmd_populate is a
>   simple assignment.
> 
> - arc has transparent hugepages and a 32-bit pmd_t but a 64-bit
>   pte_t that is not naturally aligned. It probably should be
>   aligned, even though I don't see any actual bugs
> 
> - sh has a 64-bit pmd_t on sh4a CPUs that is not naturally
>   aligned and probably should be, but there are no transparent
>   hugepages.
> 
> All other 32-bit targets don't use transparent hugepages
> or 64-bit pmd_t. 
> 
> We probably only need to align p?d_t though, not p?dval_t.
> How about the version below?
> 
>     Arnd
> 
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index 9720fe6b2c24..af5303459d56 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -65,7 +65,7 @@ typedef struct {
>  
>  typedef struct {
>  #ifdef CONFIG_ARC_HAS_PAE40
> -	unsigned long long pte;
> +	unsigned long long pte __aligned(8);
>  #else
>  	unsigned long pte;
>  #endif
> diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
> index d1ce73f3bd85..6d5e2e3248f2 100644
> --- a/arch/sh/include/asm/pgtable-3level.h
> +++ b/arch/sh/include/asm/pgtable-3level.h
> @@ -33,7 +33,7 @@ typedef union {
>  		unsigned long pmd_low;
>  		unsigned long pmd_high;
>  	};
> -	unsigned long long pmd;
> +	unsigned long long pmd __aligned(8);
>  } pmd_t;
>  #define pmd_val(x)	((x).pmd)
>  #define __pmd(x)	((pmd_t) { .pmd = (x) } )
> diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
> index 580b09bf6a45..061283293341 100644
> --- a/arch/x86/include/asm/pgtable-3level_types.h
> +++ b/arch/x86/include/asm/pgtable-3level_types.h
> @@ -16,14 +16,14 @@ typedef union {
>  	struct {
>  		unsigned long pte_low, pte_high;
>  	};
> -	pteval_t pte;
> +	pteval_t pte __aligned(8);
>  } pte_t;
>  
>  typedef union {
>  	struct {
>  		unsigned long pmd_low, pmd_high;
>  	};
> -	pmdval_t pmd;
> +	pmdval_t pmd __aligned(8);
>  } pmd_t;
>  #endif	/* !__ASSEMBLER__ */
>  
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index 2ec250ba467e..5c028b3f59c4 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -292,7 +292,7 @@ enum page_cache_mode {
>  
>  typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;
>  
> -typedef struct { pgdval_t pgd; } pgd_t;
> +typedef struct { pgdval_t pgd __aligned(sizeof(pgdval_t)); } pgd_t;
>  
>  static inline pgprot_t pgprot_nx(pgprot_t prot)
>  {

This doesn't cover all of p?d_t, does it?

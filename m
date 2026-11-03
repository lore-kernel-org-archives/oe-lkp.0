Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720588;
	b=enT+tSnqo3wtc2eBICuOPXWeDl5oOo60ZZJjurXcW+Ukh9SncjqhQWuMrOgYYzO6FtF0
	 HdDAJvMYSjilDWpK6k+gzGCjbojN/usjG7Jtg9EMGHf5Nkus9RlRg3Hy00crK8JAQrkvF
	 xPaDIAeymVcTMWttYQWKOP+4CNm6Qpjd0AZsB7RPQQNEXN15px9Sbncznt3gAxXh0mTPd
	 /Bqzh1GJFeG61nuPU8ew+gq7osxd0S7ef8XYJnk2WKFC1xsFVtIgevb+BAFva4LWcaNiJ
	 EQkRQDeTtzdwPc0ff9L7fosa9mSGLDx/p438HlJsdO6H1OrznV7hnlQVHjfhMv1PQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720588;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i4fJC51SakXQSoMv4W0gZe8imiX8aLTsZgFNZLgUamE=;
	b=YoEuB8yonCGxaJ2N4pMOyRSJgqOe2zzv0RMIfbDoNeorkfZN23126KQbBZRqP7eNI9z0
	 5ISJg8ep4O8oXpXhkqmOJTYBUVVCdBsnp5Om5ga4n3PshVZVufsjW+hVDQ/NdOwE1rrhG
	 7JOdjDbtiEuv6mrd+f7y64DsXff8Ra3WpMZICcswRWUtwT/8jAIsa8gabP3rxZh6BvCAP
	 VallX2YA2M9l0VeO8kZeptFVV4BSRb9EWyu7EcIY68rdLSNsOvENytg/pz6Jme9Z70bDq
	 7IBHXuK7Hd8+/Wbic7IcGS4nzIYcwDwRGls6jyhDwCTS/V/Kse0kuMK4vy8ipwZdidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UCjviWiS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965B606A33B;
	Tue,  3 Nov 2026 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UCjviWiS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04811F00A02;
	Tue,  3 Nov 2026 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793720587;
	bh=i4fJC51SakXQSoMv4W0gZe8imiX8aLTsZgFNZLgUamE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UCjviWiS8yshXO04YqG9ypX9q1YAwlZ6pHx3KoVHbm0WWyzAs1aacTnOAadEgAQm+
	 o6Xgplp15fxgmnBPcGEgeGDy0reULXwcZNEAzQkT7+TA0beyRtHpBQP4i3KAKsZsRp
	 abPtxr/6Oa25GHfIlJHjHYFePuUfURhULZNvQ+P8=
Date: Tue, 3 Nov 2026 07:43:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, Finn Thain
 <fthain@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Sasha
 Levin <sashal@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Boqun
 Feng <boqun.feng@gmail.com>, Daniel Borkman <daniel@iogearbox.net>, Dinh
 Nguyen <dinguyen@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Gary
 Guo <gary@garyguo.net>, Guo Ren <guoren@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, KP Singh
 <kpsingh@kernel.org>, Marc Rutland <mark.rutland@arm.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Rich Felker <dalias@libc.org>, Song Liu
 <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Will Deacon <will@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, david@kernel.org,
 liam@infradead.org, kas@kernel.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [linus:master] [atomic]  80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Message-Id: <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
In-Reply-To: <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
References: <202611022259.def3e086-lkp@intel.com>
	<20261103122647.GL1813469@noisy.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 13:26:47 +0100 Peter Zijlstra <peterz@infradead.org> wrote:

> AFAICT this is pxx_xchg64() from the PAE code operating on an on-stack
> pmd value.
> 
> The below 'fixes' it, but the question is of course, WTF are we using an
> on-stack pmd value for set_pmd().
> 
> --- a/arch/x86/include/asm/pgtable-3level_types.h
> +++ b/arch/x86/include/asm/pgtable-3level_types.h
> @@ -5,12 +5,12 @@
>  #ifndef __ASSEMBLER__
>  #include <linux/types.h>
>  
> -typedef u64	pteval_t;
> -typedef u64	pmdval_t;
> -typedef u64	pudval_t;
> -typedef u64	p4dval_t;
> -typedef u64	pgdval_t;
> -typedef u64	pgprotval_t;
> +typedef u64 __aligned(8)	pteval_t;
> +typedef u64 __aligned(8)	pmdval_t;
> +typedef u64 __aligned(8)	pudval_t;
> +typedef u64 __aligned(8)	p4dval_t;
> +typedef u64 __aligned(8)	pgdval_t;
> +typedef u64 __aligned(8)	pgprotval_t;
>  

(cc Dave)

fwiw this was discussed a couple of years ago but nothing really came
of it.

https://lore.kernel.org/20240401185451.6897208962d3fc47a12ffb5a@otheo.eu

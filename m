Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708840;
	b=BMJFzZlvqS6ysPN/uwxl12HnhrnVu8icBeA5l+VtwhJnKGk1mGQUwGUikt+r8JICOdiI
	 5RJNt1HQYfwdPmcfpkD1357HjiaGJTrqe9SIqx0vpDRJmaqY7xFH2VEUAELJ1eh58wC5k
	 jPtvru2eDWQ9+tHj5sOHMYt6OHAMhAXJ8H7oU40zVi6NEeFVlG6OOxjyeI//bcKYMtzi5
	 I33ocRMRXGwrp+29wE6OeZDCpb6DNTZBjJZH2RJzCY/Ybp53FHM/jNlPlW4vBkoLPTkEj
	 WcwlALo5LOJNtRBvSKM4oNJvzss8jGed/l/N5sx0c3Mc84rSl95FvFUzPYDsT++rXnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708840;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DyJu+3/AT7hm4iQUNa2fs6Lr4tUQc1qSvYE1x28gUus=;
	b=DgVuznmCAcvFzxLT/nFmsp9Xql9nKXBIJysD2k16BscuIebYYnvCLQrxXOjqy2+miFRW
	 ElhTxb7lXQyW88WsA5VwC6Pe/eR5Z/kLLu7mYcVHZ7d1mEgrb/t785/q+I2Zt/C2IeyHt
	 R5A41SDrJlcFfcF20wt592lSwP/CAoKP+A5oxm2DTQReSiROq1IFUQ3SbQaRFUTosgtci
	 B/4hZONNJruriH0p/7NSHVqGo+s91t6KbNvrfeCwGetXgvi2t7bzVTNepusFVY7lW7os2
	 87VccE8f4sWDX/2Pdc10Et5UVL9L1bOCalWmmLRwRlpECBBlYlO8LA/9pYUlM/WxDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Obm3p5tJ;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647F606A326;
	Tue,  3 Nov 2026 12:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B647F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Obm3p5tJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DyJu+3/AT7hm4iQUNa2fs6Lr4tUQc1qSvYE1x28gUus=; b=Obm3p5tJ8cbPtFXgkX+mPa/AcV
	asrC8ICkIHF/9B3UbCD97jpK2r3DXjYM/y+dIInI1yLRB1TAOOOYAm2F3KbolOSwdcZ+QKxUjetVc
	xa8WX6ygpiPsGvuShwnR4PbpHB7z/EeptAejv2GUqNJFcKErWR/zKfb8eP0Pm3qDaFz7fg4mS49nx
	7+73ZAQjAf6tIsudraP/l4ht7iwueW9O1NWTa2CeZxXqpv27fK+50A7uOJlDc05vipvOVajEcGTVm
	Hi5oOZ+gZiBVqWu/kUdxOyk0jasqPLpf+3Y55f44zPLiCHX6GM4uyExjIINiLRnfZOkXH/o2g5V9v
	Pwj6mhdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODbG-00000000RDp-0n9y;
	Tue, 03 Nov 2026 12:26:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B3E11301185; Tue, 03 Nov 2026 13:26:47 +0100 (CET)
Date: Tue, 3 Nov 2026 13:26:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sasha Levin <sashal@kernel.org>,
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
	Yoshinori Sato <ysato@users.sourceforge.jp>, david@kernel.org,
	liam@infradead.org, kas@kernel.org
Subject: Re: [linus:master] [atomic]  80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Message-ID: <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
References: <202611022259.def3e086-lkp@intel.com>
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
In-Reply-To: <202611022259.def3e086-lkp@intel.com>

On Tue, Nov 03, 2026 at 08:58:07AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked" on:
> 
> commit: 80047d84eed25e9c92cfb9169980a0dfec110246 ("atomic: add alignment check to instrumented atomic operations") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]
> 
> in testcase: trinity
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-02
> 	nr_groups: 5
> 
> 
> config: i386-randconfig-1005-20261101
> compiler: gcc-14
> test machine: qemu-system-i386 -enable-kvm -cpu Icelake-Server-noTSX,enforce,lm=off -smp 4 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611022259.def3e086-lkp@intel.com
> 
> 
> [   18.704659][ T3738] ------------[ cut here ]------------
> [   18.706815][ T3738] WARNING: include/linux/instrumented.h:62 at __split_huge_pmd_locked+0x6d2/0xac0, CPU#0: trinity-c1/3738
> [   18.717796][ T3738] Modules linked in:
> [   18.719286][ T3738] CPU: 0 UID: 65534 PID: 3738 Comm: trinity-c1 Not tainted 6.19.0-rc6-00100-g80047d84eed2 #1 PREEMPT(lazy)
> [   18.723193][ T3738] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   18.726644][ T3738] EIP: __split_huge_pmd_locked (x86/include/asm/pgtable.h:228 (discriminator 1) huge_memory.c:3128 (discriminator 1))
> [   18.728717][ T3738] Code: dc 85 d2 75 0c c6 45 c2 00 85 c0 0f 84 ee fe ff ff f6 45 bc 03 0f 85 47 03 00 00 8b 45 bc 80 08 10 c6 45 c2 01 e9 d5 fe ff ff <0f> 0b 0f c7 4d ec 0f 84 34 fd ff ff eb f2 e8 db 58 40 01 85 c0 0f
> All code
> ========
>    0:	dc 85 d2 75 0c c6    	faddl  -0x39f38a2e(%rbp)
>    6:	45 c2 00 85          	rex.RB ret $0x8500
>    a:	c0 0f 84             	rorb   $0x84,(%rdi)
>    d:	ee                   	out    %al,(%dx)
>    e:	fe                   	(bad)
>    f:	ff                   	(bad)
>   10:	ff f6                	push   %rsi
>   12:	45 bc 03 0f 85 47    	rex.RB mov $0x47850f03,%r12d
>   18:	03 00                	add    (%rax),%eax
>   1a:	00 8b 45 bc 80 08    	add    %cl,0x880bc45(%rbx)
>   20:	10 c6                	adc    %al,%dh
>   22:	45 c2 01 e9          	rex.RB ret $0xe901
>   26:	d5 fe ff ff          	{rex2 0xfe} ud0 %r23,%r31
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	0f c7 4d ec          	cmpxchg8b -0x14(%rbp)
>   30:	0f 84 34 fd ff ff    	je     0xfffffffffffffd6a
>   36:	eb f2                	jmp    0x2a

AFAICT this is pxx_xchg64() from the PAE code operating on an on-stack
pmd value.

The below 'fixes' it, but the question is of course, WTF are we using an
on-stack pmd value for set_pmd().


---

diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index 580b09bf6a45..b1343a1dc55a 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -5,12 +5,12 @@
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 
-typedef u64	pteval_t;
-typedef u64	pmdval_t;
-typedef u64	pudval_t;
-typedef u64	p4dval_t;
-typedef u64	pgdval_t;
-typedef u64	pgprotval_t;
+typedef u64 __aligned(8)	pteval_t;
+typedef u64 __aligned(8)	pmdval_t;
+typedef u64 __aligned(8)	pudval_t;
+typedef u64 __aligned(8)	p4dval_t;
+typedef u64 __aligned(8)	pgdval_t;
+typedef u64 __aligned(8)	pgprotval_t;
 
 typedef union {
 	struct {

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713345;
	b=qRIjnHPIZU6vorZ7owS07K4ztxwfDfTZyL3lc06K4OghZvI3sJAb6DndcbeAqkmPyjWs
	 BIYU0uKpEZnFlZ4Sh+hTXeFXD1D32zPQ3vGhZk9Glc/8lvWX6IVLUguR/Cq2MJ3KBAgsR
	 1Qhl5M7db6zEltthJSbIw2c9wodvn8nIxqICvGN8nAa41PKlXOUXbpiaPjekapS+8PW8i
	 LNAOTNrybvCmPGNSsWd/8HL9cqHLY0JtDkIF7/elhh+GUySjGUZWW6Y1eLUmB9cVdNlkV
	 VLzxzVnYEll0zxCx3OASGt6DSnxffq4zJBG40Su4W8OF+TK/1qaxQ/8TSiqi19XJW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713345;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=C6BsRfaEgIRLQQWK6sElJj2ULb7RxiZTRv6a00pf8q4=;
	b=TZ5wCZmgkq7WbCfJnLUFyBNo7Gi2IOyrkSlisjuG1ZBKwUIOiI670sjM5ilDTLN8+iGe
	 fdt44Uz1ungwW3TS8e4lpcFn186jhnffHvaTyuhl065qYDOQ7Os+jXW4CwPOOSuY5I4wn
	 zQE4bibbbvNMOJNFHUsJI+YEvIHn2xH1l3DiWaWCOgdE+p6Ix78q0ZNDx5LAZBWgmUAej
	 LlAmf7H1sVKJDdJxH8i4S46DldImCiYTE+PKL0o+kVyvJgDGOhbyO4yaCzKNEAQj2BEc6
	 REQ/CNq2+yjbFc0YDGJha1iaCtUTiimUOKll0MP0RWa2yx73gYhZkUu3Jl+Rv6EYg2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="KkN/+8PM";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gsz0dw+7;
	arc=none smtp.remote-ip=103.168.172.137
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496D0606A327
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 13:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KkN/+8PM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gsz0dw+7
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 53DDD13808CA
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 08:42:24 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 03 Nov 2026 08:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793713327;
	 x=1793720527; bh=C6BsRfaEgIRLQQWK6sElJj2ULb7RxiZTRv6a00pf8q4=; b=
	KkN/+8PMCJmN9+oJDv1PT2v8YZWiIx0HgEHZi/kgNA/HhDba5WP1BuWQNOZOURbV
	Hrj/ZLB5gspp7ptXLCWd2/lcTCZvqc/UiLbYblYrtfSBf+oSCoLS9Yt3LCf1ulBj
	lg1TYfpqS16gvfgfu4EHr85s4ixt1DDrbKFtPydgVIzB9cPvJ5BmeNYM3yNu9Z0n
	FAXefH0FFZUkBX8NR+6WOj4j3rloPScdno3dG1HXBGsIv/fnPE3Kz/SGuwq3NtTI
	dudCN7ANM/SRMQf6LVw2OntByOGKb8K3+NWBsyIZjE0fc1ImLBgPxjPKGQopgLDz
	ruitXt5rpbx7Tq5bSgwmUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793713327; x=
	1793720527; bh=C6BsRfaEgIRLQQWK6sElJj2ULb7RxiZTRv6a00pf8q4=; b=g
	sz0dw+77oExHBK39kaNw32WrtTlwOJhqphNMVRGuWcrVG3KBO7SUns78QvkvuR1U
	ovHSscfd8k54mBoeP2/T1l1J0pfxstu/JooCt1G1kXyu6s6J5TU8AxiTdQ3pztNo
	1i83BBorBn5uaYx5ieRd3kmTsaIIqEDwSBmqZCXK479b2CQBdsSEVgAuXEhtj06g
	f2xYXuraOvh+cMnFS+sOgVd8XZ+DN493zKM1YLf2pr4N61dfphFj15e8MHu2eCcD
	er7TAc1AvgPhPTdWRzFFJc6ya0hvsc8C5ZOySQBplVAwy7Mlf3/XoaT+Yax0/SSF
	OB5b7Wc9BHM4pI2uH/4+g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793713327; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PG9lLWxrcEBsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:laEFMxTDJmD6BrerlvSeHnGI2cxcM1Ogt0pGtX3GpSKhxRu
	yYZHqpnLfCxQTTMaNRVOrlcpO7yctvSmftjjJ2NlffHtoLw3AfA5mDN0o5sCRJpB
	ORjvuoQwTKREd9r7hkf7swVaiGmZHhJFy+axllUnBZ/jxCEf2tkebUbE7VI0HXvH
	LPGLmH6Bag6d4skEmVpvW0NdmNPFsWhdwCsqB5jDcj2cNcVbo+LrXAR0chPMrSI5
	/uCXj9TEGK8F6bdH15YJsOnQ5M1DMFHz/+K8Bc99sZut5G1PlnMuslU5quHzdk9a
	KPtwBGU1JnHKBZPHPDRrE8O+G2n2tGLQUAHyBMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6lfwly49jdk/TRQzQzohVpgwjHD/wkTSstU+gGerY1o=:h/NM9bjvMaJEdmp3okr+dW8dFy0qHLVaOWeZgTL04zo=;
X-ME-Sender: <xms:oeTpatWZDpRRNZMWjhAskAQCMLqYvau0PUyGwPOYFLY0pY6Y9njaiQ>
    <xme:oeTpaoaxV4qoKNi5Ha6QuCd6u5HJZEERfSmA_tlbmn0FuwbNeMxgM4D80-yFTbUaX
    1cbqN1e5bOFSx23ABc5q4LlDVGSq1-KR4WsXI6AIE_4tL5z2z-EtEx7>
X-ME-Proxy-Cause: dmFkZTEA4KzNuwOsua5pffRMjkBOk8wzkxvQ/2CpeYBWTRKldBKNhQCsSJE8Uh9dEQ0Ef0
    GZHbXMgWrOiuBvBaWlxEbzf5C4JmAB81c5UxCXTIHaP/8pbXByeVsb/te6GpmqZXZlblAg
    cKGjztPo3uHjg+8wCId1LCLEttpHXAcoPDOOz/66xY7x28JRQSuiF2Kqea58r7ttfq13S3
    vy/rynGbxesfWoFi0HCPVVWm9XxX9JVLVWEhx/hoN7T4hNR+A0wUjV33nFR6E5KwtUgHee
    5HY5ePjyfCf2olwovw2KYth+I2fo+vLeN24GLXo3DbsdCMBSrrFPTbK5R3zN8lQ3nGBVRD
    7A4WcGepoqTPXzuv6+agcCPg7oTJe9F+HWtlF7Z4ISIU5FI04YMIQrBBNBu3NmBVQwwxeh
    kJlxgwLuCEvccGYTJOZI3KhHXSQfZ7r4qm8sFi73x/cP4J5H5gKnM2iNKfhWsNh3IDTvxP
    YKkWDuvUXsg9aFQEUPRjj6Ks8b1xBqLIr2L56C3vMDoJ3IEwEtMX5enoas8JQFqZDr+yL4
    yPtrobI2V9uesTkvFL1E3x0YPCUwvluj3uzHDLrERF0ZNYro2piN6RGU0NvkoUFSPSftdN
    rB8URlSfV0C2tKh9aRLdepIKneucn81ERHwkoQmItOqAMOOnShSiRfl/ESBQ
X-ME-Proxy: <xmx:p-TpampxcJCb0YP76X94qK88tf_J79dTHp214itTmMD_LbR71BcL0A>
    <xmx:p-TpapGUWlOsHG7W7wuO7uNqAusEcz8_mP2VgpOYxjzS8xfhgmVa1A>
    <xmx:p-Tpamic8G5a7o4akCQHtMOCub9DetJVBRrpWGFMVhanMfwGsFu4sA>
    <xmx:p-TpajO0fKvscWeKk5uMiINqSqzFYwLlqKRDd6c50uDQ5K5IY-z27g>
    <xmx:r-TpanHhEjtwrLSxgMyCywLuGWEPXQp6v4HPDY2KlB8m2jguXX7K5daW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 31DC432A0097; Tue,  3 Nov 2026 08:41:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AHCvEt5753PB
Date: Tue, 03 Nov 2026 14:41:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>
Cc: "kernel test robot" <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Kirill A. Shutemov" <kas@kernel.org>, "Finn Thain" <fthain@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, guoren <guoren@kernel.org>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Jonas Bonn" <jonas@southpole.se>, "KP Singh" <kpsingh@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Rich Felker" <dalias@libc.org>,
 "Song Liu" <song@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Will Deacon" <will@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>
Message-Id: <846703eb-111c-4376-a0ba-36bd3e13f632@app.fastmail.com>
In-Reply-To: <e69e6690-cfc0-4ea8-83e1-5ad2d98b84d5@app.fastmail.com>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103123508.3910990-1-sashal@kernel.org>
 <e69e6690-cfc0-4ea8-83e1-5ad2d98b84d5@app.fastmail.com>
Subject: Re: [linus:master] [atomic] 80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 3, 2026, at 14:13, Arnd Bergmann wrote:
> On Tue, Nov 3, 2026, at 13:35, Sasha Levin wrote:
>>
>> I tried the typedef change. It works, but gcc ends up realigning the
>> stack in a lot of pte/pmd code (126 more functions with Arnd's version
>> in a small config, 204 with yours), including handle_mm_fault(). Just
>> aligning the two locals seems simpler:
>
> The question is how many of the other functions may be affected by the
> same bug. I see a variation of the same code in vmemmap_split_pmd(),
> and aligning the types is clearly the safer option here, especially
> given that most 32-bit architectures already align u64 all the time
> the same way that 64-bit ones do.

FWIW, I checked the other architectures that may be affected:

- 32-bit arm has transparent hugepages and a 64-bit pmd_t with lpae,
  but that type has natural alignment, and pmd_populate is a
  simple assignment.

- arc has transparent hugepages and a 32-bit pmd_t but a 64-bit
  pte_t that is not naturally aligned. It probably should be
  aligned, even though I don't see any actual bugs

- sh has a 64-bit pmd_t on sh4a CPUs that is not naturally
  aligned and probably should be, but there are no transparent
  hugepages.

All other 32-bit targets don't use transparent hugepages
or 64-bit pmd_t. 

We probably only need to align p?d_t though, not p?dval_t.
How about the version below?

    Arnd

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 9720fe6b2c24..af5303459d56 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -65,7 +65,7 @@ typedef struct {
 
 typedef struct {
 #ifdef CONFIG_ARC_HAS_PAE40
-	unsigned long long pte;
+	unsigned long long pte __aligned(8);
 #else
 	unsigned long pte;
 #endif
diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
index d1ce73f3bd85..6d5e2e3248f2 100644
--- a/arch/sh/include/asm/pgtable-3level.h
+++ b/arch/sh/include/asm/pgtable-3level.h
@@ -33,7 +33,7 @@ typedef union {
 		unsigned long pmd_low;
 		unsigned long pmd_high;
 	};
-	unsigned long long pmd;
+	unsigned long long pmd __aligned(8);
 } pmd_t;
 #define pmd_val(x)	((x).pmd)
 #define __pmd(x)	((pmd_t) { .pmd = (x) } )
diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index 580b09bf6a45..061283293341 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -16,14 +16,14 @@ typedef union {
 	struct {
 		unsigned long pte_low, pte_high;
 	};
-	pteval_t pte;
+	pteval_t pte __aligned(8);
 } pte_t;
 
 typedef union {
 	struct {
 		unsigned long pmd_low, pmd_high;
 	};
-	pmdval_t pmd;
+	pmdval_t pmd __aligned(8);
 } pmd_t;
 #endif	/* !__ASSEMBLER__ */
 
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 2ec250ba467e..5c028b3f59c4 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -292,7 +292,7 @@ enum page_cache_mode {
 
 typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;
 
-typedef struct { pgdval_t pgd; } pgd_t;
+typedef struct { pgdval_t pgd __aligned(sizeof(pgdval_t)); } pgd_t;
 
 static inline pgprot_t pgprot_nx(pgprot_t prot)
 {

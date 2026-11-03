Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708354;
	b=JQls6LKWrLqzrvTtHb8aXexV1nZ709yMKc8VsPLLrQwx6dChPhpxo8IO8ycMRYDiTooA
	 we7TDbw6S9Cq0EF879M0qJud7Bgd1GNMmKbwvfzEQ/RTMk7Fu2VRANczUTFAQ7T+53Xf0
	 Sg3+mKuluKyEin0VdCRBVC8+hUVMMSNrOhubuOyEsW3grqZVXQlRxmI4Z14oT9eECCxIj
	 UzvnCqbI6hTTzv+vEkGQD2WjTnAOFZz3BF4HYO22PtJ1P5eAx7ogVxz7PSU0EOqRBdpW1
	 elaJnX1cBwQWzCIde3SN2s0boXwwIr6hxCrdjWthHX7kFFMiAmmsYxiSE8c9zkwJavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708354;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=QTA/8aqS3UQVMBO5mPFfmRbMeq/D+FGrY3Jal56YUeY=;
	b=KsSL5gtg2oRqh85nWbg/oNZIYU0SxypVcAVuENHso3YNczXpMNFh4/y1Ewhv6UJ5+LP/
	 +/0p7nsOlGTNwRgXF1kCFTf51y6KcRc/L3KeLLT9YZ2hpBmNFW1RgdYscUXwJ0dyicPMc
	 y5++SdZ43GXO2FBnw7wBQOrhp2qUnbdj11T6zsjIzEDYJP7YbpVm0J35UuoqZTmLTOCf2
	 3slHghb4UwDV1RzBXQrs3/7yqIhi2UC08HKan7hnMmrlH00trrWF9KqgWmRSCdmV8hnw6
	 BwQNlkyutBZ/vuA+Fb5/EOsYndcYHhizdk78YL+2PB7WE7P6b+r0VbdVqQE3z5vRCWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=IwIaXHeR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LmxBSw30;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A37606A326
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 12:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A37606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=IwIaXHeR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LmxBSw30
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C306C140017B
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 07:19:12 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 03 Nov 2026 07:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793708337;
	 x=1793794737; bh=QTA/8aqS3UQVMBO5mPFfmRbMeq/D+FGrY3Jal56YUeY=; b=
	IwIaXHeRPwogYpe2SECWYNWDubD8mhrhouAJHACeoZPlMR1d5Cz8usEUMvHo0wom
	G9mHs9D9HL/o8Jsb/DRLT01WbrK39hM9GiBD7qhyah9JoctC3KZwuWP+kqc+McQ2
	oSh6JYoWdTjCtIyAg6NsJuw2WrXsLDhZGFsw5XeU9JGJcVQeyR6fcuePVIAUGel5
	jY1AzI2v8bTsNHk4qFh6jljSmLg9kSfxCYIdI3Q0AYp14M+8wRNN6tGUAyVpWTb0
	QI5RIBZWnPajKIUOzOgoD7PqGLRQ8ntteY6WJ8/62/O1019wiWh49ZFyz3Q2twRv
	FCK89SFuQ+5E1PY+NVaH7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793708337; x=
	1793794737; bh=QTA/8aqS3UQVMBO5mPFfmRbMeq/D+FGrY3Jal56YUeY=; b=L
	mxBSw30OM6mLT6vbNHE4ftPHwUIUsorjT4tstYYuMX5ECZQ6Gm8PMeOA9m2Uj9yj
	eZXNoKbRcQ2bQLabSaFsBS+2WDXNSXWtXy7aEMESEztIh6cpIQXDdCDqCO/fJqb8
	INhSsoX2Aqw8ySeZL7cIxCMNs0ZIM4x4umq1Qwo6PRdwCzSy4TypmuLUHEjMHVYz
	xyM++Loe13vb4KYYjpniKa4BKtyi2YiUCi++hTOuQAUl65gO2nzMADnsgoYh51y6
	hLa7IPSTPsQIl0AKdI/5QinNP5qHFRtI/tAl2cmiZj6HxyLCJrvyp6fgbgZc/UEe
	gCOVOKT1YXLSugcn2fDFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793708337; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PG9lLWxrcEBsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:UBWMHIFDYA0IsW/tmoWl8Hfb2qugBQqnYqz418SEosMj/Fp
	loxNa0fURIC0a6UEk290AxMr77v0CG/v1KHzkREx/e8Dx1EVrmVW9E1I81p44HLw
	DLykxSSV9j5MpPPCChoGExuk4UKv4By4XWZeuYUIkkfiEBawt6CS1AgL+20RDGGp
	PsqW+5EgUIcTq2RdHknYHNkOfF1MCs3lthMYy7HQ8y+uFeFtY7uDySPfvIE22iu2
	nbsziqaMnGIVhrGx7ZSTDUDefSLnyWYrgRx8Hp2tNweLzYIOJGqbz5bvOTnQa4or
	PoXE/nzER1uLztwyrshoX8x2I8xVxWBPrDUvE0A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:En5Peq+Snfi/eaQUCZvq34DDOZ6Pz0xz4Kq5l1eou78=:FBQ7MOoqVPG/XUKFaKj7ep4eojBckJ5fp9oLmCC9eFQ=;
X-ME-Sender: <xms:I9HpavCnssS-rueYl71nrruFT-CteJ1Ijlgwr6vXDSrvLdAaxBxyFA>
    <xme:I9HpagX1wQ8tpiL7dWWByqG7pOLT4oJrEMOYZJzTkdnfPf5CXPBr4XL_8Yti9CGgV
    jMkgBQJzHx-a7zOr6nX63k9to3NylENRI1sVveeeL8T9iWBDg1dw6pjAw>
X-ME-Proxy-Cause: dmFkZTGjV0PeAloasTQ9SA4h/XW32kCZrPwzmd/ZG6fbFY4ucNLYWVQtUgWeBtrXjENBoS
    8emnuw3fu6rdLH0pE/Q5kssXkHl5IKL2h9VB0WL20QhZy+mAV6x4Iy9+6LcAJXj1QOcObD
    kGPv4XBcffTylnXLF11j08YTlaRDnVl/PPeFMa9oPB5FX3KP0YZt/xD6NZ5S3AyYxJSCMK
    nJvMMCZS4mSDuPqgLNW0dXLyrlVkGts23Tepl/97+aRYTkxb4NJ9MdemZlPnPKJgXv1tfg
    tJJ8bS90OCPQj1+VfaUWALLTAuri7Id9LQfQ/FxavaaV8GXuOHsYHbtxF2R3ShK0rDGjGi
    994iKaHegdWSk8tcm/f3JK+AEBq4kTnEdNvspsm8A2EdXeVbRdBUy1/rURYbpPPUAu3Uys
    Z3htXp/+gI2jd7oZw2PlxdGl8sXH8zJ0FSkeYJW2MGAG49tyyYXea2+qdtlyLQz5aspPp6
    sFkCLyjKjFcjoCfxGqOHmzjOXiLoKZrTOHzrYZ0Y1xP0qrhyIXGst2H8aVn0j1+aSZbYZS
    1RyputP2Find0IcGHbBBVO4hW89pydmfv28e4ZZwdHYp+CjUXyRvVcaq7GZDmBtAEjIfHc
    dto6aZVE1m1LVYqctXehuAaMJdjU0pLQtRZcN5TiTzq7S2jXyqmf7fHVgUTQ
X-ME-Proxy: <xmx:KdHpal4joqMsWHd8Qx9eZzOw0o6H1eR6K5plV9ihnSH5xrU-K-vIkA>
    <xmx:KdHpaucsr4T9NFNcq_dPYJdbIhlY-D4lA7a84PSRBs1dlTXdymW2ZQ>
    <xmx:KdHpajvysMyszNoWmIQxDFmDwIGsYLmqhWi_6_IUmfX-o7n75--adg>
    <xmx:KdHpamhoMOn680jQkJkkoar7H_CFd5yWlRCF1VfruPOsZTYZayV1sg>
    <xmx:MdHpamYj-ogDwKPGfKfeldNxfolqTO-PHI6kjT66s_0pjFax3eCHUs4R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3EA7E32A0093; Tue,  3 Nov 2026 07:18:43 -0500 (EST)
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
Date: Tue, 03 Nov 2026 13:18:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <yi1.lai@intel.com>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, "kernel test robot" <lkp@intel.com>,
 linux-kernel@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Finn Thain" <fthain@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Sasha Levin" <sashal@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
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
Message-Id: <250cd11a-d738-4211-8714-93f548114d79@app.fastmail.com>
In-Reply-To: <202611022259.def3e086-lkp@intel.com>
References: <202611022259.def3e086-lkp@intel.com>
Subject: Re: [linus:master] [atomic]  80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 3, 2026, at 01:58, kernel test robot wrote:
> Hello,
>
> kernel test robot noticed 
> "WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked" on:
>
> commit: 80047d84eed25e9c92cfb9169980a0dfec110246 ("atomic: add 
> alignment check to instrumented atomic operations") 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
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
> test machine: qemu-system-i386 -enable-kvm -cpu 
> Icelake-Server-noTSX,enforce,lm=off -smp 4 -m 4G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-lkp/202611022259.def3e086-lkp@intel.com
>
>
> [   18.704659][ T3738] ------------[ cut here ]------------
> [   18.706815][ T3738] WARNING: include/linux/instrumented.h:62 at 
> __split_huge_pmd_locked+0x6d2/0xac0, CPU#0: trinity-c1/3738
> [   18.717796][ T3738] Modules linked in:
> [   18.719286][ T3738] CPU: 0 UID: 65534 PID: 3738 Comm: trinity-c1 Not 
> tainted 6.19.0-rc6-00100-g80047d84eed2 #1 PREEMPT(lazy)
> [   18.723193][ T3738] Hardware name: QEMU Standard PC (i440FX + PIIX, 
> 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   18.726644][ T3738] EIP: __split_huge_pmd_locked 
> (x86/include/asm/pgtable.h:228 (discriminator 1) huge_memory.c:3128 
> (discriminator 1))
> [   18.728717][ T3738] Code: dc 85 d2 75 0c c6 45 c2 00 85 c0 0f 84 ee 
> fe ff ff f6 45 bc 03 0f 85 47 03 00 00 8b 45 bc 80 08 10 c6 45 c2 01 e9 
> d5 fe ff ff <0f> 0b 0f c7 4d ec 0f 84 34 fd ff ff eb f2 e8 db 58 40 01 
> 85 c0 0f
> All code
> ========
>    0:	dc 85 d2 75 0c c6    	faddl  -0x39f38a2e(%rbp)
>    6:	45 c2 00 85          	rex.RB ret $0x8500
>    a:	c0 0f 84             	rorb   $0x84,(%rdi)
>    d:	ee                   	out    %al,(%dx)/out
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
>   38:	e8 db 58 40 01       	call   0x1405918
>   3d:	85 c0                	test   %eax,%eax
>   3f:	0f                   	.byte 0xf

This is apparently how we got here:

static __always_inline void instrument_atomic_check_alignment(const volatile void *v, size_t size)
{
#ifndef __DISABLE_EXPORTS
        WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
#endif
}

static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
{
        kasan_check_write(v, size);
        kcsan_check_atomic_read_write(v, size);
        instrument_atomic_check_alignment(v, size);
}

#define try_cmpxchg64(ptr, oldp, ...) \ 
({ \
        typeof(ptr) __ai_ptr = (ptr); \
        typeof(oldp) __ai_oldp = (oldp); \
        kcsan_mb(); \
        instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
        instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
        raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
})

#define pxx_xchg64(_pxx, _ptr, _val) ({                                 \
        _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
        _pxx##val_t _o = *_p;                                           \
        do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
        native_make_##_pxx(_o);                                         \
})

static inline void native_set_pmd(pmd_t *pmdp, pmd_t pmd)
{
        pxx_xchg64(pmd, pmdp, native_pmd_val(pmd)); 
}

#define set_pmd(pmdp, pmd)              native_set_pmd(pmdp, pmd)

static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
                unsigned long haddr, bool freeze)
{
        pmd_t old_pmd, _pmd;
...
        /*
         * Withdraw the table only after we mark the pmd entry invalid.
         * This's critical for some architectures (Power).
         */
        pgtable = pgtable_trans_huge_withdraw(mm, pmd);
        pmd_populate(mm, &_pmd, pgtable);
...
}

So the cmpxchg8b() happens on local "_pmd" variable, which happens
to be unaligned on the stack in this configuration and could potentially
span a page boundary.

I don't know why if this has to use an atomic pmd_populate() here,
but if this is required, the patch below would ensure that the
cmpxchg8b operates on an aligned word.

       Arnd

diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index 580b09bf6a45..526986ba6b17 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -5,11 +5,11 @@
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 
-typedef u64	pteval_t;
-typedef u64	pmdval_t;
-typedef u64	pudval_t;
-typedef u64	p4dval_t;
-typedef u64	pgdval_t;
+typedef u64	pteval_t __aligned(8);
+typedef u64	pmdval_t __aligned(8);
+typedef u64	pudval_t __aligned(8);
+typedef u64	p4dval_t __aligned(8);
+typedef u64	pgdval_t __aligned(8);
 typedef u64	pgprotval_t;
 
 typedef union {


        Arnd

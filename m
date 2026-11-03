Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699210;
	b=VMaopl9l36O7GL3PrbvFhcc94FayQZU6E6LsnyFJ8+kHlGnKCTnigYAiqGEzqfti+TM0
	 mDyn1qHMy0tIa2KoP/GjWdXgzThHJqAmj5oAScIs/2phzmFVF30kBbbfMQXF1hrm0nRnr
	 TKdTy20bDOxmz6P/wnj5AYt/Vwuy6h2nCl95ImM3nFqoGyg+WZ+GHx8L32JGapZmP4BDG
	 3jYM5GYanr4L6kzPRNZygXhn6kxSQS4DDlr+X/Nw3efIyXgGgvs1KagSVQFpB5TjF+894
	 F7Ba7mAyTvBK8UrIQTWyJhkRuFkKRx/iTLyIrS+Gp7/MNDw14sS9xJ0S3aEgeyCX3Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699210;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=/IKeePEzkzQb0ij5rJyiMvvaU4VMD6EhYQBwHPP2ZQM=;
	b=IA4U4MfvHQZ6sZm6SjEbXBBRU8BbUlWuJ1uPVRYDKoYTtz2nTeGelDq5nzRXvogS1BBS
	 swNcAckCqJfeTy/wbBSdXPmi+esd2sprgz9uz7C2mx0B3L8CsmfeeljGLsJ/yatrBoRzh
	 OJ+oAc6qh16B+yU7la8opDFWVhgsNpDb4k/rOkj+REkqJoypzICcTzN0HvkaySsesqWTx
	 Os+UwSbNCEvftYVs4GKkJAWNmwzg72OadxWEYjVnsOAIMaGl62m5uIR2+kxFPdjQ1jWWG
	 BCBoBU8CQwu8y+aZ5btb5/emO4Fj6bmVm5vPNpMepWZfJt9nloozP9Eghsbz+8ZS2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE492606A32F
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 09:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE492606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 04A017A008F;
	Tue,  3 Nov 2026 04:46:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 03 Nov 2026 04:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793699204; x=1793785604; bh=/IKeePEzkzQb0ij5rJyiMvvaU4VMD6EhYQB
	wHPP2ZQM=; b=hwcOYUL6yDd71JGia5mt9XdEkl5igSIOSPcEZCYUmSq0pBCZPYS
	+bqrJvDQcJDFXJQu7ALZ9u9Z00jVaKSTSlyzODlvMiKxs1ixxzzijxzWOGBFirJ4
	LCWo199EPZvtoRb2PEEN3ilhsVGyPtFOhmR44yTjNcoZE3WmZYjlAhJHQxmLodUs
	oBHrESTKWM7t7/f57mj/vehCTP8iJNplCVGTxOO59YCMiwQp9VIBc8kaFliHEAR2
	On4Zke+ZMhkBW5KROEURMndOmONPvmEpbSdu2BnJeLxqkNTWOQRq0vUhD4Q69VJ0
	faq5kDgjCTksyTZBR0Si2pjYURb9rPRoJRA==
X-ME-Sender: <xms:g63pao1oXemuL-_ffQhBs_yx62UXFOVjkRzWI27LIuCeLYLpRA1kTg>
    <xme:g63pamZ2iUVFO4-9oPLQNC9JlHp0Kxe-qLOa7Zxp1WSvU6TVB0irDhNXXo2kRiN6b
    phXSOyVhnDo0RG2i8Z9PhyKooYH5P8U4ZrezqDDR4rGVpNJZHVdXkgdJg>
X-ME-Received: <xmr:g63pasv7gKy0kxOqQSNoyWuus8qBlg2sSuhgoHCVy1FFF-wKaqPVB_efBmOq8scn5Yu6V5Eb9-ViYJ9h0B86Gz8bQ-b6Xzq-CFU>
X-ME-Proxy-Cause: dmFkZTGsab++Yb187nq4D1T5x8jnxJ1X+qM2yU337wNKyg/7p/AZFEimtm/w/ej5BGPHh5
    jdVZ1lx05ifLTc80WlGqgvEyQBW93KVfuWHMBGQH0nRiKPv1sBpHlcNNu/r82osNl2UlzG
    P/uNVb2MlqBf/wb+gPI+q03IAtBsjpxsayKL4q/JWUj9WQgzLVIInu2VI1hYRhkdbOhAHU
    WkvBXSUXnOM6rkYRr5DiTj7aksnHRCf0dfuN9r1ymrfTaqoh8MKxPT1o9jg8bVPOUiCtia
    qy7AP4qT0uaRPBU9qa7bHI5H7UDYCRLJUOUhd44sTlVm1xkWLd45S4tj740ViSqWLnmEUT
    fo6u47Ob0pMttntHtGzqhCbeOGhLsBrs8XDwKLXq93UaCdCd1QVmvH1twQVEtThmpr+xuv
    +UbT2UCUbhUZYW4oOe/3b36/L7gUBA8oryNhJqJNd8xBOGx5PCdLFv4u1KyogHHLzNGdtw
    kIDzB5ScPgLNQOVgQ8dIYa7rviL32fVrIBn/ctTf3taDWXDK+vEBzCwdVFohLOZJKZ95g/
    GX6/sMP+FTtm/0Ky/yYnA3LrEQU3ZoB+7guD07Pn9J2lmzC+86zFhccITemct0RRYKZj9j
    xcs7mz6xosDFKwxlBdfZscmkvWys9LNSd+MDHanHdSWIWXALnXli+h3f15CQ
X-ME-Proxy: <xmx:g63palBBf4wc9Kag6Yv3st7h3K8ypt80VvukO_1N8frQp6cXRiv-KQ>
    <xmx:g63pavD4a_GBFH7TRGR6LPcyVbqcyZUKofI_hJDwAuvjXZ0L80vaKA>
    <xmx:g63pannhtLkDPR3Rt-qSZiJ8TaechLUDUGtgLSmUQyzfg1583E70vw>
    <xmx:g63paou899ZZnaoPgVKO1OjqWnvlqG80Jw5CyuMYXXU-9c0cLLfx5A>
    <xmx:hK3pahdr3F0oGXfZC6DJ6oveDNi6Y1Ut0m6lGSlZBZnz-pKMEC8KzNmA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:46:40 -0500 (EST)
Date: Tue, 3 Nov 2026 20:46:36 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: kernel test robot <yi1.lai@intel.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Andrew Morton <akpm@linux-foundation.org>
cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Sasha Levin <sashal@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    Ard Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
    Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
    Daniel Borkman <daniel@iogearbox.net>, Dinh Nguyen <dinguyen@kernel.org>, 
    Eduard Zingerman <eddyz87@gmail.com>, Gary Guo <gary@garyguo.net>, 
    Guo Ren <guoren@kernel.org>, Hao Luo <haoluo@google.com>, 
    Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Jonas Bonn <jonas@southpole.se>, KP Singh <kpsingh@kernel.org>, 
    Marc Rutland <mark.rutland@arm.com>, 
    Martin KaFai Lau <martin.lau@linux.dev>, Rich Felker <dalias@libc.org>, 
    Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>, 
    Stanislav Fomichev <sdf@fomichev.me>, 
    Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
    Will Deacon <will@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [linus:master] [atomic]  80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
In-Reply-To: <202611022259.def3e086-lkp@intel.com>
Message-ID: <13bdec81-18cb-4a1c-4932-41751346a621@linux-m68k.org>
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


On Tue, 3 Nov 2026, kernel test robot wrote:

> 
> kernel test robot noticed "WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked" on:
> 
> commit: 80047d84eed25e9c92cfb9169980a0dfec110246 ("atomic: add alignment check to instrumented atomic operations") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 

It appears that a misaligned lock was accessed in 
__split_huge_pmd_locked() back in 6.19.0-rc on i386.

And it appears that bisection landed on commit 80047d84eed2 ("atomic: add 
alignment check to instrumented atomic operations") because that's when 
the check got added to detect such accesses.

If the misaligned atomic operation is somehow normal in this situation (?) 
then I guess it's a false positive from DEBUG_ATOMIC=y.

But if it was unintentional, the next step would probably be to check 
whether the current mainline kernel has the same issue.

I have to confess to a state of ignorance about the mm subsystem so I 
don't know what to conclude here.

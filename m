Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724713;
	b=zySO9EVF5GC24dg64Hsz3jnbBURgRgDDq8CMwwkOec+lLJV4mHfJQDajzVzksxZKFEaw
	 jwDCI/nGH+IQc8Cs/5qlAXA4OlV9vjY2ReYMga/IoCbnXKZNxc+swJfWQWzHM829xezCr
	 zkdE2kj0t4ONoz5S7XpvN7jjNr5D4/Dh9SV3YzJ8ILXk/PLmkIkGfwcENdQTkP+53xnuV
	 YU/6ghYw8cAYnsxZ6VgtBG7MSoqkxs6QB8aEtUYiasNMtjoncZwWOy84Q6VYyGFnOmCOb
	 E61To6SweXU8ZhzhSsvKYAEO0uekjMDXx/Sm1n1vMQ1G9T37cIAOxvTjFVWNHd3u9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724713;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ww63b6rV9yLGr6fapOF9p7X8k1KrA76K+KqklPl6AUQ=;
	b=bS0wYE5tiUMyOP/HCRPIJdVfc6NSQMzIMIweXREIfLUs7aoX/HPuY08SZAFfTamwFkAr
	 ZCBf4lia+IHq5+Ei2C6tIy3oxzys+RtpSfo1976QhBUOlKh3W801xRKiexxulqzaWkaDc
	 Jj602dkGyzhzEyERDaz575zs2czOg453QD/oVAn+EyIqhgBMXFVhzHVocMB6VFv6dk8XC
	 D6qoOPgFC1o7F8VcxQZD/MAmgz8vFO0O0TZ4EWop4FSgYVykPIYPREjIZuM37sLiLQpqd
	 1oDQAT86LVrjNcV1IYo8JVQMXmkB6EP0kbg1OVNIn8khEyQdFs30Y7ndfu9adLHQbEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Dj1mbKNQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rsosKy56;
	arc=none smtp.remote-ip=103.168.172.142
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F539606A324
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 16:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F539606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Dj1mbKNQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rsosKy56
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 843C61380340
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 11:51:51 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 03 Nov 2026 11:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793724694;
	 x=1793731894; bh=ww63b6rV9yLGr6fapOF9p7X8k1KrA76K+KqklPl6AUQ=; b=
	Dj1mbKNQkPedGNpTexFP1K3JVjXipCe2Ass63vfq3BzhNfYgmm1lbHgGlRAcewDi
	6cyaTzIAvcjeOkBA3+iPPFBZicS1IyIvwNqy9ILTH8kqJtEjHIGXSFpWMQD8cLos
	Y0xtRElLt+78t9thJaSF2Ir5tSEsv+zcfWm6tiY89LkABEfCqU6ZdCou9avqsuVb
	ChMr5HzZPYwFWIlFDmv5TE7ZgGVb7pTkSG3cgPp7YEvqbCZXnWQQFpsKTe1ELiMN
	DwKWviW4idNoBlpVFf7vaxvU+pRCesXNQbQT8mIY4oTaRrUKyDgLe7iyTwkIHEfg
	G8fGQ/F75B+GcGaHfR7XXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793724694; x=
	1793731894; bh=ww63b6rV9yLGr6fapOF9p7X8k1KrA76K+KqklPl6AUQ=; b=r
	sosKy56SneyHtH2nPW51p8cAN59LV95v+1/5urbr/jjAR867qvrpE1JSxh2SlKc2
	SKpEPYMIF1WeMkYFLEJ08E9KsLcwGSaR0bHbPY4LJwOxpGUJ9N/JhMcMbMWByBgz
	KU9bvVu9moGqjQfEuTB/iRRknBHa9tgrXDjkDSTr+QYFvUl+c4quFtofYmVCsMxV
	3xPBsEAO+91i350q0c6utldFmchSR6POg8mhOECx4vNDunP2y0/ZM08b0FBC+bDX
	jSx3+fAlgyRfdyk3pHLz+O8KkvgsRP7nkQ56ciPjyWlMoDTogdnAgvlZQYe8WhaX
	dwmrgO9aCpSunQoTL/HBQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793724694; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PG9lLWxrcEBsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:BnmQavKJ326mPCdcfgEdCGLxPs8axyFqBauJWncs5FvlKHE
	s6Wk9uo5np11JInZF7U8fQ5qT31a5jvd22/naQurmLLbQHw+P+GK+9vZGTgCocoN
	azFtm5Gyo5LKTC2ulAffswCikGEUQ/EoD8ljxIR9lmqF/kYEinZB2J5GJyC6yAUF
	GTIqhQZn35DZhmV6fKkEy0mV+BWP8lQJgJFB8jNrw6Zbx9ntsDio1LRACxd7AE7W
	Qavy9QLywTXKN0AliUvc/K+sVGrE3PVbxKPCzMQpFn0zpDlRvQTJPuBdnCZENbuI
	oBXsA/HpBmEXiQMSUDKYTzYwPmMrZrhFQyqOBwg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uDppxkB2xuuUm25nkAmjihzTR+csjEN79VLU68Rp+J8=:uOLVkjm0R26ZnS3PGvJ6Yj/fso3xKOIZRBK+O6o6E78=;
X-ME-Sender: <xms:CRHqag6Epwu450deqUUCa36arqVQ6KYBLuyKn6TH_6oFCe8pLFdhww>
    <xme:CRHqasuhbjNNvmQ5SVEJBZJTrS2s5BeAcvXeTTmiI8AACp1APzoIvkbxFHl9pkHGQ
    x6QkSAs4G64peJVDed_tg-ht7u1XQi3o6CKAgDmkKbgaVMst9AmkP5M>
X-ME-Proxy-Cause: dmFkZTGfqj82wKuGk4ZI82BtEQxQjZDRlyz+yRbLWqC1zSuhUiHwg+/cbj2/EFVqOLQQf+
    BuK5wn/50lwSgUdi2d9L0V/R3Nk6RoX/EgjIGN2SEiYg+3TF1Nu+fxjkB/XhMRTEp0Tds/
    YFhPk0ufDWTaRRa3vNgw+M3LCFHdKAvy7KTLczH7G/Ug56TJZHtw2S/dxGAA83JMVHpwhm
    puH1D+ebRkLCQ1/tHDRIsjuj45ng2rxn8tTuvTP4sUjjN4j3257C8oLdOc3FtMJ7JZPSpa
    d6S7VTXfvpUjPM5zAV+AUjNEp3filhEjGtpcV3kiO2F1OGyUH2CWjqVtLMuOTyTHWR8YIL
    dzCTPJqSjFc6qReXfGvRNwlTmjJ62+HzuZsCBIhbtz9K/VBB8Dz8WNpNg0EvXgCwUTQ8gM
    TVET8lQbBzEfCyzOklQh54gNOcNNbKAdTk0w/Z6oVxk6IBDVDTKV9sgBDcHa17JUubuYR4
    fQLZAzAMOsyLPcFlbjShoaWxBpIT2+uVnJToDEF5pPXSsjHD0VeRh1IJnHxwFxeFoDRMs1
    ORf2E2D/FYBMvyhEYRyJSRl5saMxOrZYo+cvREwdiRTdbH8bXa/HIeyCe7Eeb6Kdcx1o+j
    KGK1pQhXntx6hMCl7nHvK6g85OvQqvDMicDiCuHAHyf4cnVhOvPmJ/VJY9gg
X-ME-Proxy: <xmx:DxHqavuSE4u_e1kR6xxC4Eryp_yZyV3MoMsHOSRZU99BvPz-ckiQRg>
    <xmx:DxHqak4lpEobbrRkbOxlGfmcrubO3rPLJ_eEJBMLdNWaqxT7bThmsA>
    <xmx:DxHqauEKiSUTmdtSL9jgQixKxnGNRCCxSPSVmVybs7vcwxNQbIFu0A>
    <xmx:DxHqarhzMCNPv8EP4OCb1ANP4q7mEBFhutkzNuU0CI841ygbAydx0A>
    <xmx:FhHqat7EK8FisL_DZW88ZBrWlI0bH6ejWRHHEbXMwovzujkNIvAMHgxV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6B31A32A0093; Tue,  3 Nov 2026 11:51:21 -0500 (EST)
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
Date: Tue, 03 Nov 2026 17:51:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Hansen" <dave.hansen@intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: "kernel test robot" <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
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
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, "Kirill A. Shutemov" <kas@kernel.org>
Message-Id: <e5b82b14-3d86-496e-ba7a-68e028c2da44@app.fastmail.com>
In-Reply-To: <3bf3f477-a048-457b-8032-43d8d1451e9e@intel.com>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
 <3bf3f477-a048-457b-8032-43d8d1451e9e@intel.com>
Subject: Re: [linus:master] [atomic] 80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 3, 2026, at 17:29, Dave Hansen wrote:
> On 11/3/26 07:43, Andrew Morton wrote:
>
> Heh, same code. Same basic problem. Two different detectors firing.
>
> But I also kinda feel like shooting the messenger on this one. The
> warnings are presumably to help us with performance problems. This is
> old, legacy code that nobody cares about running fast. So they're not
> actually helpful here. I don't think it's the craziest thing, at least
> on x86_32, to just turn the warnings off.
>
> Also, if there are plans to get all the pmd_t's off the stack, maybe we
> should just manually align them for now. 

I would still prefer to align the types than the objects, if only
for the reason that the interfaces that operate on the type clearly
expect it to be aligned.

> It wouldn't hurt to make the definitions uglier like:
>
>  #define pxx_xchg64(_pxx, _ptr, _val) ({
>    _pxx##val_t *_p = (_pxx##val_t *)_ptr;
> -  _pxx##val_t _o = *_p;
> +  _pxx##val_t _o __aligned(sizeof(_pxx##val_t)) = *_p;
>    do { } while (!try_cmpxchg64(_p, &_o, (_val)));
> 	native_make_##_pxx(_o);
>    })

I initially misread the code the same way. However, the warning
here is about _p being misaligned, not &_o, so Sasha's patch
would be the one that aligns the objects.

      Arnd

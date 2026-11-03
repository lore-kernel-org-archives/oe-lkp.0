Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721506;
	b=kgVyDV3DSu4VBMpU2wM2hicjvOOr4d+hBEYwAhctva3LmmJuoALbmW5SxlIrtZNEH7Nk
	 qnI1JLLXTIzgVX1+3Jf0Ri48w5jY/J8aeMAm0fW9rRmCGT36BIFsvBPeABZcrQXVCJshu
	 jKjLM2dECaRrS7gW4ZcpUaUaK1ox3gwgCevq3IMkoTYGVccT/CHH1dq/2TshkjvD9zrR9
	 368KAQ82D0sBMxATvwYgRuOsg9rv+vHcYitFW5cQrsHxFDjet65pdfr6jt7pzqj8cxP/k
	 fAuwK54XifrjBR0sVWThE3mIdcHNmLAHHpLVrGrYwggRSI1mCb3Fc7kBP+WY3ANEjzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721506;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JqAbBArnfd9sGvHzBu7RCGdZFbliWnjLETcd43LEOk0=;
	b=H7dUeweaaCKmVG9zKBOFo0tUK/u9QcBDFGhsVCTJuWa3AsNp+SRFyEZ8cH8gMxPplbkM
	 UXNjhVVkQCgDXU/lRavopByNnpNHqAr2NsyzCAnu/+6J8ZAxMOUW/Dy8NtXWrFxIy4TsA
	 K+GtynadaXVJhQnKhb0cAG2MWIT1Z4EDpssTQnxX9Y4lOs0gghoeTvUr9B4AvEIzj8S10
	 fyUA7EeZB9Rh8jrZ7spkHkEREc6I9FZ67gY1Wz67oSBXTx0danFerqh7p3HGxDKSIoqTq
	 YHtnyRAp5xxOn1rUDGNWonux77ahOQCtN10HrkHvX1C+0Puha5k50VyQKN1L00YtaJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DM/7hmIN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20A6082BC0;
	Tue,  3 Nov 2026 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DM/7hmIN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1516F1F000C1;
	Tue,  3 Nov 2026 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721505;
	bh=JqAbBArnfd9sGvHzBu7RCGdZFbliWnjLETcd43LEOk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DM/7hmINCL+8X0W3ZvLL0XvE9tV8CvUnxlEsjtRGHUGbpVMpfbkJUYvIPDQppZ7R5
	 VTnveTCAQOO60eLu7ghdrvvXi2sglUoQQgtiLVvNOUJErdmv+YrUSWo1qtINUKO1zn
	 Dk4+3GrccAEKF7NVSV8zEfWvEvMn1y5fMvUSegc2EymARq3X/wRsXDHp70FoaHXSD9
	 wr2VgziPHejBsSgp/RCXnHqyvEdOJ6iDV59uU6sSqIa+Y4tfVXjbhMNS8cxrCMmRlV
	 poYLZgAhU4H+rf5J5/RnxL/MZkzOovIzGsHkjtV9u7q5wI9Re5Z1scO1Rh/LTEe3hN
	 vBLMh3IFx/kmA==
Message-ID: <1dbf6b30-15c7-4371-9711-c658a0fc1b50@kernel.org>
Date: Tue, 3 Nov 2026 16:58:09 +0100
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [atomic] 80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
To: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Sasha Levin <sashal@kernel.org>,
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
 Marc Rutland <mark.rutland@arm.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Rich Felker <dalias@libc.org>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Will Deacon <will@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, liam@infradead.org,
 kas@kernel.org, Dave Hansen <dave.hansen@intel.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 16:43, Andrew Morton wrote:
> On Tue, 3 Nov 2026 13:26:47 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
> 
>> AFAICT this is pxx_xchg64() from the PAE code operating on an on-stack
>> pmd value.
>>
>> The below 'fixes' it, but the question is of course, WTF are we using an
>> on-stack pmd value for set_pmd().
>>
>> --- a/arch/x86/include/asm/pgtable-3level_types.h
>> +++ b/arch/x86/include/asm/pgtable-3level_types.h
>> @@ -5,12 +5,12 @@
>>  #ifndef __ASSEMBLER__
>>  #include <linux/types.h>
>>  
>> -typedef u64	pteval_t;
>> -typedef u64	pmdval_t;
>> -typedef u64	pudval_t;
>> -typedef u64	p4dval_t;
>> -typedef u64	pgdval_t;
>> -typedef u64	pgprotval_t;
>> +typedef u64 __aligned(8)	pteval_t;
>> +typedef u64 __aligned(8)	pmdval_t;
>> +typedef u64 __aligned(8)	pudval_t;
>> +typedef u64 __aligned(8)	p4dval_t;
>> +typedef u64 __aligned(8)	pgdval_t;
>> +typedef u64 __aligned(8)	pgprotval_t;
>>  
> 
> (cc Dave)
> 
> fwiw this was discussed a couple of years ago but nothing really came
> of it.
> 
> https://lore.kernel.org/20240401185451.6897208962d3fc47a12ffb5a@otheo.eu

IIUC Usama has some things in the works that will avoid on-stack pmds.

-- 
Cheers,

David

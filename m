Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723390;
	b=bgrdew7xWbS+lee2hLkAPPwk/ENY3hS5rkszOFOndnRFOouPq68IcI7sjp413tZF+2Ma
	 IqDZvFCZHlx97cwM5m8W1JMLXPR/5gCCtFYh9kn1CUlnajdWfwUuBbBlKnTlS+OCdePbz
	 Ope0/r3Opg3vN5LC1F6/2IHQt3WmKUnIm78TzHOljUjY++0UnqlFNZ1x1WBzSF4voOi6E
	 F1YOlIKsYrtNBJfruzSMy8P61XRklM+Xt/ceHMZIuF+XLlajSWLmwdsfqgvauoQeJdNOt
	 l1ETUe3hCZ6TBwwKY6GkvNVKNUDxg3Y2Tt26bIsGx4SxuNzpHa+Wmc5MFQGONqBk/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mWWFXq51a4tuEF3t5BzvXPZdY4SURX+chEeKKoBwNZQ=;
	b=l9VAFxDfkIs2qYPXHbQ+uOzkv5SR4+Z490LFqXeU8MA4yXr5AZxlTO+DN4LF+w5wJjd7
	 BYCcXZXGrWwrl51VpFm4nBipMmXvYgc4rbgM+xNzjmYCk3m3NI4m4uNp4yVAlloRyYoey
	 DrfD+4R1tg8apE7ZE5rNLkVHAy52J0MZzcuCXm0Qp8Vkw0BiqzCVtGBocrxl/wBMszFq6
	 I290u28oC9PKom5vByt6cOV18wqRuCP12WIWOY7CIgTxjZ/ef5E8KGnZs7aZKeE6T9sl9
	 4qlhCmsPBPVbdv2jwLDWnaU1uo1R1Mr2psePAuck8dMHPrMt3wSajV3+wVIFgGqup1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUQY6JPS;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DB606A327
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 16:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUQY6JPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793723390; x=1825259390;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=714QTWIHzvPtjBpuIiHQjy5En0jo2MT/fx6yBd5vVO4=;
  b=LUQY6JPS8R+AMNtA/PjcilV0vK90ll8A8B5cm+RvbM/SF03hNNUIztvU
   +lRTul9ASf5SQzlNkmNP9vbaB4YG/amSiVsHMiqAZYlPwflV1xKtOE716
   4nbUIGTOYgXP7PhpIfpHV9Ugre4Vv4rxuYQy0dqg6H3xOQxdWkb19NqBr
   Euu0lXPXosrH4/QseNlcjOhL8RaungBzdaCB0uyhZ85ErPInjBxD56vHh
   zBsPjgi3EjS79hrJ+6gTcu8gL9EKMnkjmkBC56wb/T/aNTChsedQ6X8IF
   HTbsxWrfhqabI9uvsPHc+Lit0KZxeOc3eSRqN9kPeonK0HO7D1JLX5Ary
   A==;
X-CSE-ConnectionGUID: KA/TFa2FRxCK/d/BKc0juw==
X-CSE-MsgGUID: rkAr9P+tSPiZyux7XboNtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2546537"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2546537"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:29:49 -0800
X-CSE-ConnectionGUID: RuQBG6ivSJeRp1R+xYbxhg==
X-CSE-MsgGUID: wb79OYl6S2+vT8jlBp6pjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8312133"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.109.226]) ([10.125.109.226])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:29:46 -0800
Message-ID: <3bf3f477-a048-457b-8032-43d8d1451e9e@intel.com>
Date: Tue, 3 Nov 2026 08:29:44 -0800
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
 Yoshinori Sato <ysato@users.sourceforge.jp>, david@kernel.org,
 liam@infradead.org, kas@kernel.org
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <20261103074305.27bfc570fb81346860867bdc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 07:43, Andrew Morton wrote:
>> +typedef u64 __aligned(8)	pteval_t;
>> +typedef u64 __aligned(8)	pmdval_t;
>> +typedef u64 __aligned(8)	pudval_t;
>> +typedef u64 __aligned(8)	p4dval_t;
>> +typedef u64 __aligned(8)	pgdval_t;
>> +typedef u64 __aligned(8)	pgprotval_t;
>>  
> (cc Dave)
> 
> fwiw this was discussed a couple of years ago but nothing really came
> of it.
> 
> https://lore.kernel.org/20240401185451.6897208962d3fc47a12ffb5a@otheo.eu

Heh, same code. Same basic problem. Two different detectors firing.

But I also kinda feel like shooting the messenger on this one. The
warnings are presumably to help us with performance problems. This is
old, legacy code that nobody cares about running fast. So they're not
actually helpful here. I don't think it's the craziest thing, at least
on x86_32, to just turn the warnings off.

Also, if there are plans to get all the pmd_t's off the stack, maybe we
should just manually align them for now. It wouldn't hurt to make the
definitions uglier like:

 #define pxx_xchg64(_pxx, _ptr, _val) ({
   _pxx##val_t *_p = (_pxx##val_t *)_ptr;
-  _pxx##val_t _o = *_p;
+  _pxx##val_t _o __aligned(sizeof(_pxx##val_t)) = *_p;
   do { } while (!try_cmpxchg64(_p, &_o, (_val)));
	native_make_##_pxx(_o);
   })

or

 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, ...
 {
-        pmd_t __pmd;
+        pmd_t __pmd __aligned(sizeof(pmd_t));




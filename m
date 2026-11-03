Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709314;
	b=dVee8U94nSSmj47Dn6AZWOUIxLUwO+Yl9mLTxc1q+MFMoO16jPWZKQKGb1C6VqbiSY/w
	 oErTptBh1AfvcZOXx0gFoKYhofqcUHGvzxIp/6qaCaVV6nNMkWvn9JROTONKGHl1wH0zc
	 SFcK1JuSR898sLTCoJymL2miA+pFx+uXs5HtI465qMsyXeoKo0REj4eGQjMQY1oOi4mKx
	 Wc1Baq/GEYSy3qa+6Dpdhsc0RH6OGXnlu6IydbRSJgFXyxCzt072a7GtCmxoJVCIWrMLx
	 7D+6aQAPF8jzQFr5dPdk0z8zVK05KBCRGg3o7m0+2zqDSeG8U9Z1vCfCdm3SJWnxt6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709314;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0zLRVusHuFyKUoOOjchq0acuBxOTUBp4h2LAp6Ua7q8=;
	b=mypZqqRiIm3lCXJZHnSIJyMWTtmsV7/hg0eQKtDoeulmt1Fzv4ErTKi0LDV3PbCF9hW2
	 yVkShH6s2lm+gJMgZh+wyhfruUgDEIm6pE/Ff12E84RbR2Yn9XpoT5B6x2re/mWkLCwDL
	 ek4glzYKJLftt8z8mVap8s+KYURDeIZbPXe/i1rMieLMdeaphhcegpPxWpaQ65rHy4zuk
	 9qzpq2D4QfVR1IiGRwebulwmhBmrH8lvf6sOqyYnGUPshI5eTpk1KFZZDOWnKrQlkhRtO
	 ZCoehTCJp5zeP5PnDlV0P5CPJEFHWA7uv2F3AkILIcopUln8N8tCPHU8w/jTxHfCL4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiXBTPt5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2ED606A332;
	Tue,  3 Nov 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiXBTPt5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9533D1F000C1;
	Tue,  3 Nov 2026 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793709313;
	bh=0zLRVusHuFyKUoOOjchq0acuBxOTUBp4h2LAp6Ua7q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KiXBTPt5ex20f8NL5JSpBt5DJO4H6Qkh5P6mO7qoW2S0+f1fGw6juKMolBA0Qkrcw
	 0Vwm+vxcaXe41UfPrtoz8NhlpvwhoAlf0JSuC9TWV/VXJ0SHh7viVJIXTuqsdKal8i
	 HHtLqyB1H5jiRbpGyYH25VTlFKu5A3JaV/EVsvy+AOQFYF0JVOF4L4h1Pl6wOyyBXZ
	 4FxMhVKAZmSZrY1mlIIIp3px+w/z5CAokn7Dmf/EoFV3C12IQfPy3gDzg6F2oDtaZ/
	 l5fDl64NlxyT5eu+8jdI29O79aIjYtWzwgPK3toVgu7Z55OHF+TISE9F0eOvIdeeZA
	 OQ1LAITZkGh7g==
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <yi1.lai@intel.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkman <daniel@iogearbox.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Guo Ren <guoren@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	KP Singh <kpsingh@kernel.org>,
	Marc Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Rich Felker <dalias@libc.org>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Will Deacon <will@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [linus:master] [atomic] 80047d84ee: WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Date: Tue,  3 Nov 2026 07:35:08 -0500
Message-ID: <20261103123508.3910990-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
References: <202611022259.def3e086-lkp@intel.com> <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 01:26:47PM +0100, Peter Zijlstra wrote:
> The below 'fixes' it, but the question is of course, WTF are we using an
> on-stack pmd value for set_pmd().

The split fills in the new PTE table before installing it, and uses a
temporary pmd on the stack so pte_offset_map() can find the table:

	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
	pmd_populate(mm, &_pmd, pgtable);
	pte = pte_offset_map(&_pmd, haddr);

__split_huge_zero_page_pmd() does the same thing.

I tried the typedef change. It works, but gcc ends up realigning the
stack in a lot of pte/pmd code (126 more functions with Arnd's version
in a small config, 204 with yours), including handle_mm_fault(). Just
aligning the two locals seems simpler:

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e86845..b8faa6df9bb14 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3132,7 +3132,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pgtable_t pgtable;
-	pmd_t _pmd, old_pmd;
+	pmd_t _pmd __aligned(sizeof(pmd_t)), old_pmd;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
@@ -3180,7 +3180,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct folio *folio;
 	struct page *page;
 	pgtable_t pgtable;
-	pmd_t old_pmd, _pmd;
+	pmd_t old_pmd, _pmd __aligned(sizeof(pmd_t));
 	bool soft_dirty, uffd_wp = false, young = false, write = false;
 	bool anon_exclusive = false, dirty = false;
 	unsigned long addr;

Tested in qemu, the warning is gone. I can send it properly if this
works for you.

-- 
Thanks,
Sasha

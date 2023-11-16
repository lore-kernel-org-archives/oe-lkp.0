Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46050358BA
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CXYY0ltL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0F83340E0176;
	Thu, 16 Nov 2023 15:44:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HXWmMaMJPo2s; Thu, 16 Nov 2023 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700149467; bh=jpCy4psk+nUXJweH0L0uiKhQyDuBDi2Ykp2k2WbbHI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXYY0ltLQtkXtptWPuwhGxhbdNuu7QJFs8t/4zZK0CUpFvSXiBpNTyUTCB3AnS+pw
	 mfC24fKiJrlEJa+69OXs50hvFfg/MGFtzF/97PrcnyxXz1l+V6kAUYrzGxX2iWly9T
	 mbGLhua+20VPF2bjwJQRhZBOwanbFbjZXCAr0NWRv3ENHbHoDSOQB5JE9bbl9p3uPW
	 65+JynYGQuT7+nt4GWQfhFsROFbt9aFjcCUxGqq4nyaT1lmA/4EGMMBnYdYuxQCd0H
	 4X6urr0t2/myhd4TixCPcqRaBgq5r/RQadrfj3XzD9nc+/ZlahH5b1frr7DEKiyf6G
	 EjvdWlfAVu92DfufzO88SshyOVxG88Sfqrq2i5jmxkq4feg/66xs+TgaCgrXP1oVv8
	 bG+nUq1i0A7Cp4Qh2F698eNYxFXCjzA9SfEAk0iAdwwXdlV5yVQ6pU4GBejy/HcWkF
	 xbUowGsn7Wo8ADygjqbc0bDIgvYkWI7fVJLuTEWOqI//mBlIwTLVTFpcXGkHGCY1Hz
	 98bsRHPenJ1FGK4cVZXkJw9fI7nKGsWeHXcqecEDZSQQI80cwet1YgyzAqwV2wsUqs
	 yRmpUOZjL3545n+5h+HqoPbSS4criBG3lQ2/3rSeKqTcAQq/l71hBdJ/lZJnGYORsq
	 poSd3A7X3sAvwH9WYiv0jelM=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 92D1A40E0032;
	Thu, 16 Nov 2023 15:44:11 +0000 (UTC)
Date: Thu, 16 Nov 2023 16:44:06 +0100
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Howells <dhowells@redhat.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Christian Brauner <christian@brauner.io>,
	Matthew Wilcox <willy@infradead.org>,
	David Laight <David.Laight@aculab.com>, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
Message-ID: <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local>
References: <202311061616.cd495695-oliver.sang@intel.com>
 <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
 <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>

On Wed, Nov 15, 2023 at 02:26:02PM -0500, Linus Torvalds wrote:
> So the real issue is that we don't want an inlined memcpy at all,
> unless it's the simple constant-sized case that has been turned into
> individual moves with no loop.
> 
> Or it's a "rep movsb" with FSRM as a CPUID-based alternative, of course.

Reportedly and apparently, this pretty much addresses the issue at hand.
However, I'd still like for the compiler to handle the small length
cases by issuing plain MOVs instead of blindly doing "call memcpy".

Lemme see how it would work with your patch...


diff --git a/Makefile b/Makefile
index ede0bd241056..94d93070d54a 100644
--- a/Makefile
+++ b/Makefile
@@ -996,6 +996,8 @@ endif
 # change __FILE__ to the relative path from the srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
+KBUILD_CFLAGS	+= $(call cc-option,-mstringop-strategy=libcall)
+
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
 include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89543ACA
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gtyjtEkz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 795AD40E0199;
	Wed, 15 Nov 2023 21:59:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cS1EHJFxfxSI; Wed, 15 Nov 2023 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700085574; bh=gnQc3JN9v8kA6tZGKxO8vOCK2sDLkjsw7bhunBDg00M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtyjtEkzOK8TSa9Q6BymFEgAejpTzQH++8sGhLM7nW89BoZiRIqYv/oQ0uQfHd6QH
	 8hgvAw2xf73O/kO5fRQlg41P9CYBA+KuS8Lre6NQQxUX2fnbu9sRwY4E2bQQsqj4hA
	 fK2Rkgdlea1lx7fjGCTASJFm7UzG6Scrx+YzL4I4zlodCCLjq9cVABI097NSf3WyNh
	 MZYsGeMAxOVyg6JTKe0NugY76PC9+hZDhvDvvCO/LqiF5hZ7abB+5TnJ8p+shBiK+q
	 zH83wVWlxWZbF0IpABxqlszUk2EBrKtjDJajC+h68raQo0EC8UacqZjq7gJ9Ez4yfy
	 7n6UEIwF1XimU6dUAzWm+xdUPAJRXsJJNJLD2QswvgMmDNfedl7V7sWbeMXF8iRFJo
	 uBaMwjhDnBUQ/nP8VzBwAjhAbTT6nvIApqz+1UwkdgL5t2aDAnYwOTcqetTOt6AHgl
	 RLFfLCe5e/h7ZrAS6+VfFdwZm75CWF3wZGOii97+UNPLEJlWMV/KktD7cXji5AO3it
	 71+7TZNKfgJzVtsghAOKnec5MrO6YVM02+SsqZv/wExkHJaAL86cDNG6L3MZSG8LDZ
	 1/5/kAhwP9H9U14PYsPfpQmBnOfLuBG1gnzqQAeCLmpDowdH7yFRxuGKdHbRwp5QnF
	 9J1JlehoJkUOeFu4bvjUxSdI=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 224E440E0032;
	Wed, 15 Nov 2023 21:59:18 +0000 (UTC)
Date: Wed, 15 Nov 2023 22:59:17 +0100
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
Message-ID: <20231115215917.GKZVU/NXl5BkyCPt/M@fat_crate.local>
References: <202311061616.cd495695-oliver.sang@intel.com>
 <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <4097023.1700084620@warthog.procyon.org.uk>
 <CAHk-=wgR3Mw2-8k2O3S10T-f4oz8FNfg7aziLU_6pbx0qowxew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgR3Mw2-8k2O3S10T-f4oz8FNfg7aziLU_6pbx0qowxew@mail.gmail.com>

On Wed, Nov 15, 2023 at 04:50:06PM -0500, Linus Torvalds wrote:
> Sadly, we don't seem to have any obvious #define for "this is not real
> kernel code". We just have a lot of ad-hoc tricks, like removing
> compiler flags and disabling things like KASAN etc on a file-by-file
> (or directory) basis.

Yeah, "untangling" memcpy() has always been a PITA, every time I tried
it. So I'd need to come up with a somewhat sensible scheme of "use this
special memcpy() only in kernel code proper and fallback to the library
version or gcc builtin otherwise"...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

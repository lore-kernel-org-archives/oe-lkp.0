Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573A4502F
	for <oe-lkp@lists.linux.dev>; Fri, 21 Mar 2025 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565336; cv=none; b=iWB2vyQH7qlXFyjab9/ufwmKp/dn5PFr3pdYTYMDeWpmr0bz0PDBty+u5Jf1DMNYv0VfNCF2cs06FkvbQrSy7XmSQFFB7mzoy7OIaKA9oxXwEf5HSEUjOntmac4WtrC5hE+g3EsljIBPrgtcPssFCaN/rDx0EtLoEEG9PZrYmgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565336; c=relaxed/simple;
	bh=AdJuexWRzfAz86oxnne/IW4kJwTlZlMmB/BbN8hoPs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciuVZmqo4bxtfaLqipbWdopraUEIwBfj0RAnd9ahuBXC0ZG4FdJM2ddPtEETntrcVcbLVR5pBEjAFKUB+XiCKXhg7VQzS3tKqhgIP9lfIIPsBqjma+MKTXWksRD0gorFzSqsgxGeFMF7P9v3+mAyuw8VRB9H/jjRFbc/7JfEWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=TYLdU3LE; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="TYLdU3LE"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476f4e9cf92so13696141cf.3
        for <oe-lkp@lists.linux.dev>; Fri, 21 Mar 2025 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1742565330; x=1743170130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zkaw5iQ5n3Q/0Lpyrz/8zsFxGsxzzffjeg2zbqFtr2Y=;
        b=TYLdU3LEB7d+q3fqKAVTnmNCw2ZQII26zXvV3HSNgvia0/tH9zGgtf/+/y7NNYoQe4
         pkCwipBG5nNIcIrdiavmApJlL+jf4FLNocL3a92WINJ42/LtrQpgXVJV/iH8zQxpBuA+
         MIM99Mg9xSh1+/8240X2BgMcs5gJaaHXkutFknetgr/MTPYew7QHW0hVMy8G17OaQfUK
         XsI8MtlYpENCTlHc5O+pw5iIkiT5BxkKjA6dYIV6fbvMUapNGFEN9Kmc+rnRe0UnZHAS
         FUPeKTU5wzJLhms7ywz/QQOMwFwucyxnajlr+xg8Yv1aNwMRqobXCuEInItYfgwYVIXM
         Febg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565330; x=1743170130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkaw5iQ5n3Q/0Lpyrz/8zsFxGsxzzffjeg2zbqFtr2Y=;
        b=r1XmGfG3FLRYU1/i1nvQLNjWWaf1VoF15TwoYJ+yRvdqxoT5llt0k43CRIxFsRpjpj
         Po+ujU6GmVAkCgcZk+eq3BKQ3UwxQBTMcuVq7hFGQJ7FifKbSHR1jcUnS6FZkQH2Yzog
         Phrh2+C0KDuRoR/JaereY3ecYCWwfwJ503oTSYPVhoVjgJoqJpwfzWlKOmcdl/RqbbEV
         tzWsWJ/fJiTvSIZ3ul1LpA+Pr8CApDwF0+TtpdldYiv0atUG4ytOmnpKcLSnA8ew2Yz/
         nVv0yM3eQDnCOS2griMWmnIWdfK0vPbG7hu/NY/tXwNFIq+2kjp7zALWVwKzIfh9Et3N
         YXAg==
X-Gm-Message-State: AOJu0Yx/bzsKSkyUkQFquHCKJQoTM5+0aPn+gtZUkTJvlumSJPGHMXmQ
	sINIwjXu8ncsLlyzTvVuJIQYb0dnHB9yD0WYF8MdOlQvS5nJtRM3SKo+cSmc5XM=
X-Gm-Gg: ASbGncuJWDsWP/FAXDs0b1ryqPOzrtAIqhGKULqBY8BjZMIjnchWG5lbp95JhXFxjzx
	dYKf6AOAUB37PojsrX+hZpeLGsGPicPIyNhGie7loorJGAv5TCeloKtAhvyIAhRH9GiOAJgd2G7
	Bic5fpGU7gJUsDr6pxQBvjm+j7JrM46xy5i0D7F1KZCvekBEUG4RMp/gqXCAiT3xAEnmHht1+DJ
	1kj/6OBySbhZTlq/gZon7l3csnuWD9LAhDj8R15vHgVZnwIr185VFdyo+tEM77EV9TkfpACXWrg
	vJ89j3BnAkMCFbnpAOeMT4F68zXdzONMIRRGFtTBPTc=
X-Google-Smtp-Source: AGHT+IEbXh5FE8O7VAveIGhz62AHSuu58vMlCms/I/PLbVH2bCgBpWKIinMzMYIWRzFsFMsCidgO4g==
X-Received: by 2002:a05:622a:2b0b:b0:476:8e85:2a2f with SMTP id d75a77b69052e-4771dd943f4mr53309741cf.20.1742565330289;
        Fri, 21 Mar 2025 06:55:30 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4771d64d5f6sm12262101cf.81.2025.03.21.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:55:29 -0700 (PDT)
Date: Fri, 21 Mar 2025 09:55:24 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 1/5] mm: compaction: push watermark into
 compaction_suitable() callers
Message-ID: <20250321135524.GA1888695@cmpxchg.org>
References: <20250313210647.1314586-2-hannes@cmpxchg.org>
 <202503201604.a3aa6a95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503201604.a3aa6a95-lkp@intel.com>

On Fri, Mar 21, 2025 at 02:21:20PM +0800, kernel test robot wrote:
> commit: 6304be90cf5460f33b031e1e19cbe7ffdcbc9f66 ("[PATCH 1/5] mm: compaction: push watermark into compaction_suitable() callers")
> url: https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-compaction-push-watermark-into-compaction_suitable-callers/20250314-050839
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/all/20250313210647.1314586-2-hannes@cmpxchg.org/
> patch subject: [PATCH 1/5] mm: compaction: push watermark into compaction_suitable() callers

> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

> [   24.321289][   T36] BUG: unable to handle page fault for address: ffff88844000c5f8
> [   24.322631][   T36] #PF: supervisor read access in kernel mode
> [   24.323577][   T36] #PF: error_code(0x0000) - not-present page
> [   24.324482][   T36] PGD 3a01067 P4D 3a01067 PUD 0
> [   24.325301][   T36] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> [   24.326157][   T36] CPU: 1 UID: 0 PID: 36 Comm: kcompactd0 Not tainted 6.14.0-rc6-00559-g6304be90cf54 #1
> [   24.327631][   T36] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 24.329194][ T36] RIP: 0010:__zone_watermark_ok (mm/page_alloc.c:3256) 
> [ 24.330125][ T36] Code: 84 c0 78 14 4c 8b 97 48 06 00 00 45 31 db 4d 85 d2 4d 0f 4f da 4c 01 de 49 29 f1 41 f7 c0 38 02 00 00 0f 85 92 00 00 00 48 98 <48> 03 54 c7 38 49 39 d1 7e 7e b0 01 85 c9 74 7a 83 f9 0a 7f 73 48
> All code
> ========
>    0:	84 c0                	test   %al,%al
>    2:	78 14                	js     0x18
>    4:	4c 8b 97 48 06 00 00 	mov    0x648(%rdi),%r10
>    b:	45 31 db             	xor    %r11d,%r11d
>    e:	4d 85 d2             	test   %r10,%r10
>   11:	4d 0f 4f da          	cmovg  %r10,%r11
>   15:	4c 01 de             	add    %r11,%rsi
>   18:	49 29 f1             	sub    %rsi,%r9
>   1b:	41 f7 c0 38 02 00 00 	test   $0x238,%r8d
>   22:	0f 85 92 00 00 00    	jne    0xba
>   28:	48 98                	cltq
>   2a:*	48 03 54 c7 38       	add    0x38(%rdi,%rax,8),%rdx		<-- trapping instruction

That would be the zone->lowmem_reserve[highest_zoneidx] deref:

        long int                   lowmem_reserve[4];    /*  0x38  0x20 */

>   2f:	49 39 d1             	cmp    %rdx,%r9
>   32:	7e 7e                	jle    0xb2
>   34:	b0 01                	mov    $0x1,%al
>   36:	85 c9                	test   %ecx,%ecx
>   38:	74 7a                	je     0xb4
>   3a:	83 f9 0a             	cmp    $0xa,%ecx
>   3d:	7f 73                	jg     0xb2
>   3f:	48                   	rex.W
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 03 54 c7 38       	add    0x38(%rdi,%rax,8),%rdx
>    5:	49 39 d1             	cmp    %rdx,%r9
>    8:	7e 7e                	jle    0x88
>    a:	b0 01                	mov    $0x1,%al
>    c:	85 c9                	test   %ecx,%ecx
>    e:	74 7a                	je     0x8a
>   10:	83 f9 0a             	cmp    $0xa,%ecx
>   13:	7f 73                	jg     0x88
>   15:	48                   	rex.W
> [   24.333001][   T36] RSP: 0018:ffffc90000137cd0 EFLAGS: 00010246
> [   24.334003][   T36] RAX: 00000000000036a8 RBX: 0000000000000001 RCX: 0000000000000000
> [   24.335270][   T36] RDX: 0000000000000006 RSI: 0000000000000000 RDI: ffff88843fff1080

and %rax and %rdx look like the swapped watermark and zoneidx (36a8 is
14k pages, or 54M, which matches a min watermark on a 16G system).

So this is the bug that Hugh fixed here:

https://lore.kernel.org/all/005ace8b-07fa-01d4-b54b-394a3e029c07@google.com/

It's resolved in the latest version of the patch in -mm.

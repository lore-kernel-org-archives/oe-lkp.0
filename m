Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3101B4F09
	for <oe-lkp@lists.linux.dev>; Thu, 30 Apr 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537561; cv=none; b=SJE6WWs026DXztPQeLKPThilxMD+6IG8jbTSqfol3W7wG/+dqeflX4Qha0ugSHZsK8XQO9DJwhPcUj2IEmrqZG6UGCf/qWdLhpPFo5Joc5RxEilus1WM/UBMHvGZ2COXgU2mUa4HrDmYtMaiV5HyD5Z+2i7xLqPjQoEiExeX/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537561; c=relaxed/simple;
	bh=K9S9uwO2yrGO4RfEcT5Gp3/LBXAS59rAKuY5z62CGsw=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=C+FcrUZOv5YZnH4+9jvJxZY1Pv4wndlnH0kxZ9ZYUXv8OxrTeDsR48KcTizUcPMxuAFo+0i8zWOW9+N4EH+dhrYXk84KO4jxUOX3yBAoAJ4Kfi/4vwqrwjsBe7BUV+H4wmGFgAyDu8twvpB7lu7bUVO/kMjrMAAekUKCibtDeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4g5nLT07pxz51SdS;
	Thu, 30 Apr 2026 16:25:53 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 63U8Pi5x028825;
	Thu, 30 Apr 2026 16:25:44 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 30 Apr 2026 16:25:47 +0800 (CST)
X-Zmail-TransId: 2afa69f3120b3f9-e662e
X-Mailer: Zmail v1.0
Message-ID: <20260430162547059Z-TF70sIkLfTkkfnWeGjJ@zte.com.cn>
In-Reply-To: <4sw3gj2ugc4v5ek3jv4h3da2r5lnrsio44kcpqf5cw7ncjeofu@wqyp5tavlq3w>
References: 202604301428.e2b8d3dd-lkp@intel.com,4sw3gj2ugc4v5ek3jv4h3da2r5lnrsio44kcpqf5cw7ncjeofu@wqyp5tavlq3w
Date: Thu, 30 Apr 2026 16:25:47 +0800 (CST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <harry@kernel.org>
Cc: <oliver.sang@intel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
        <vbabka@kernel.org>, <hao.li@linux.dev>, <linux-mm@kvack.org>
Subject: =?UTF-8?B?UmU6IFtsaW51eC1uZXh0Om1hc3Rlcl0gW21tL3NsdWJdICA4OTUyNzI4NjQxOiBCVUdfa21lbV9jYWNoZTpGcmVlcG9pbnRlcl9jb3JydXB0?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 63U8Pi5x028825
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Thu, 30 Apr 2026 16:25:53 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69F31211.000/4g5nLT07pxz51SdS

Harry wrote:
> Taking a quick look...
>
> On Thu, Apr 30, 2026 at 02:16:37PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed "BUG_kmem_cache:Freepointer_corrupt" on:
> >
> > commit: 8952728641305ebcd03e80f79b8d31bb41d6d95f ("mm/slub: defer freelist construction until after bulk allocation from a new slab")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > [test failed on linux-next/master 9974969c14031a097d6b45bcb7a06bb4aa525c40]
> >
> > in testcase: boot
> >
> > config: x86_64-randconfig-001-20251114
> > compiler: gcc-14
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
>
> [...]
>
> > [   53.929047][    T0] =============================================================================
> > [   53.931786][    T0] BUG kmem_cache (Tainted: G                T  ): Freepointer corrupt
> > [   53.934858][    T0] -----------------------------------------------------------------------------
> > [   53.934858][    T0]
> > [   53.934858][    T0] -----------------------------------------------------------------------------
> > [   53.934858][    T0]
> > [   53.939608][    T0] Slab 0xffffea0004001040 objects=9 used=1 fp=0xffff888100041200 flags=0x4000000000000000(zone=2)
> > [   53.944008][    T0] Object 0xffff888100041040 @offset=64 fp=0x64ae22a70baa83ae
> > [   53.944008][    T0]
> > [   53.944008][    T0] Object 0xffff888100041040 @offset=64 fp=0x64ae22a70baa83ae
> > [   53.944008][    T0]
> > [   53.950913][    T0] Redzone  ffff888100041000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
> > [   53.954703][    T0] Redzone  ffff888100041010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
> > [   53.957662][    T0] Redzone  ffff888100041020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
> > [   53.960527][    T0] Redzone  ffff888100041030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
> > [   53.963607][    T0] Object   ffff888100041040: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.966785][    T0] Object   ffff888100041050: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.969753][    T0] Object   ffff888100041060: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.972621][    T0] Object   ffff888100041070: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.975559][    T0] Object   ffff888100041080: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.978756][    T0] Object   ffff888100041090: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.981898][    T0] Object   ffff8881000410a0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.985140][    T0] Object   ffff8881000410b0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.988289][    T0] Object   ffff8881000410c0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.991279][    T0] Object   ffff8881000410d0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.993987][    T0] Object   ffff8881000410e0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.996539][    T0] Object   ffff8881000410f0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   53.999493][    T0] Object   ffff888100041100: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
> > [   54.002253][    T0] Object   ffff888100041110: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
> > [   54.005170][    T0] Redzone  ffff888100041120: bb bb bb bb bb bb bb bb                          ........
> > [   54.007879][    T0] Padding  ffff888100041180: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> > [   54.010661][    T0] Padding  ffff888100041190: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> > [   54.013403][    T0] Padding  ffff8881000411a0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> > [   54.016151][    T0] Padding  ffff8881000411b0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>
> the object content has 0x6b (POISON_FREE) and there is no free pointer
> because we skipped it when allocating objects from a new slab.
>

Hi Harry,
Many thanks for the quick review and catching this!

> > [   54.019282][    T0] Disabling lock debugging due to kernel taint
> > [   54.021208][    T0] ------------[ cut here ]------------
> > [   54.022797][    T0] WARNING: mm/slub.c:1231 at object_err+0x6c/0x7f, CPU#0: swapper/0
> > [   54.077963][    T0]  <TASK>
> > [   54.079139][    T0]  check_object.cold+0x4b/0x50
> > [   54.080583][    T0]  alloc_debug_processing+0x9b/0x180
>
> But alloc_debug_processing() always expect a valid free pointer (within
> the slab or NULL.
>
> I think it can be fixed by initializing the free pointer in
> before calling alloc_debug_processing() in alloc_single_from_new_slab().
> (with a comment explaining why)
>
> Could you respin the patch with the issue addressed, Shengming?
>

I have just finished creating the patch and running the tests. I was about to send the patch
with the fix you suggested.I’ll include the change where the free pointer is initialized before
calling alloc_debug_processing() in alloc_single_from_new_slab(), along with a comment
explaining why it's necessary.

> > [   54.082495][    T0]  alloc_single_from_new_slab+0x82/0x200
> > [   54.084323][    T0]  ? alloc_slab_obj_exts_early+0x5/0x2c0
> > [   54.086455][    T0]  ? allocate_slab+0x11b/0x380
> > [   54.087892][    T0]  ___slab_alloc+0x1ad/0x340
> > [   54.089129][    T0]  ? bootstrap+0x20/0xb0
> > [   54.090520][    T0]  kmem_cache_alloc_noprof+0x30b/0x540
> > [   54.092010][    T0]  ? bootstrap+0x20/0xb0
> > [   54.093328][    T0]  bootstrap+0x20/0xb0
> > [   54.094484][    T0]  kmem_cache_init+0xbb/0x330
> > [   54.095786][    T0]  ? preallocate_vmalloc_pages+0x1a4/0x2b0
> > [   54.097485][    T0]  mm_core_init+0x12b/0x170
> > [   54.098935][    T0]  start_kernel+0x173/0x370
> > [   54.100291][    T0]  x86_64_start_reservations+0x28/0x30
> > [   54.101912][    T0]  x86_64_start_kernel+0x131/0x140
> > [   54.103325][    T0]  common_startup_64+0xbd/0xc8
> > [   54.131853][    T0] FIX kmem_cache: Marking all objects used
>
> --
> Cheers,
> Harry / Hyeonggon

--
With Best Regards,
Shengming

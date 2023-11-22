Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140275B5A2
	for <oe-lkp@lists.linux.dev>; Wed, 22 Nov 2023 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=devkernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devkernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devkernel.io header.i=@devkernel.io header.b="kB6PqRHM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RwghFZzl"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 414C93200B57;
	Wed, 22 Nov 2023 12:19:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 22 Nov 2023 12:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devkernel.io; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1700673594; x=1700759994; bh=HB
	A8/PFg10ymZNJDZ693U+tza3MBCER8GemTUdFxOSY=; b=kB6PqRHMuOJq8+yRwk
	Apu+hG7KQ+/+RHI96oE3S0StgmKqV5mmf22tZOYHgW9hRlZpNdIkgzfLfY5fJLKY
	9P2zfPVBksW6U1pW2cmnlctW8bGx/o5h3Gw0VjIfjKGRThaDcPgDRNGqlsjMNcty
	Dh5qD/Z/HqG20rhZM41Pt+LaeaxmdI+VC0n97IFgo6S1i+22SLTKZ4zssVKemROE
	4vbp830JmNxWbSYcUlRBjx5dfciVR9erOEvF6wmTb/ecb8nYX2+wGSYTQgr5SOAO
	qeJuPvbmyS2VTTNO86Fvx3hitJhu0xaCPL4z5nU1qm9zzngdLJEGzhb+5RT6o/b2
	NwiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700673594; x=1700759994; bh=HBA8/PFg10ymZ
	NJDZ693U+tza3MBCER8GemTUdFxOSY=; b=RwghFZzluA72h5rDesMsi5YLfssF1
	3QpqmD0qIBO6NwG3K27ii6vjYDhnf6dW3PbdCKsOJ1ZroqZFSSdlX/RFcn5bKfbD
	ADMkrUqWLSlNYcfErGTuW8NAbmf5MraM/qHMWEYeQMkHWSi8GaqRJsvymIhOx+0K
	9cDgwzOrodGUDtoFom9ndeyL9gQc8KHWWhk7SottR/8CRYQQTyDTTeS4L4Xk0N8t
	hk21090Sxex9EvyQ9+D+ZvEw+tvErD1R0zCBaKMST9tAvrmLNP9yCPtwVFxiWK0F
	RO9c2KRqkEU6UXRYa8gUXUV6h+wQ9M/ftfjW+sEr5jBklvUYMu8ulOyrQ==
X-ME-Sender: <xms:ODheZSK711yXzfijKj2B_yBjTSUX16HiWl3r4oIc6IXHwZVVAp7mvA>
    <xme:ODheZaJVSaGM9PXw3T9h2rw3ILQwiQp1sZ9nZMn0ypbs9w01PmgJT39dAbDnOvzoQ
    -8r-41C8o5gx2LO9Cw>
X-ME-Received: <xmr:ODheZSta4fNxw3YCa6Z0iFf09Mu_g3zq0gQWkBiTatoRe7_fgB_sN_oX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goteeftdduqddtudculdduhedmnecujfgurhepfhgfhffvvefuffgjkfggtgesthdtredt
    tdertdenucfhrhhomhepufhtvghfrghnucftohgvshgthhcuoehshhhrseguvghvkhgvrh
    hnvghlrdhioheqnecuggftrfgrthhtvghrnhepvdduhfdvffduvedvkedvffejvdejuedv
    feejtdejtefffeejgfelhfetkedtgeeknecuffhomhgrihhnpehkshhmtddupgdurdhfrg
    hilhdpkhgvrhhnvghlrdhorhhgpdhkshhmtddurdhfrghilhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehshhhrseguvghvkhgvrhhnvghlrd
    hioh
X-ME-Proxy: <xmx:ODheZXZyffz4GkJdkTUFiCUsEVMAvWwdNM91jQU5dVZZ6BhNiNI7ww>
    <xmx:ODheZZaES0sNWBYMcb-ilagzdRnfsfZUYQy1w38KAjHImlfD_ocwrA>
    <xmx:ODheZTDUdLdzHlDIx0CQqQXkW1DGhjL7xcT7qRhvB94K-FNsmFS-WQ>
    <xmx:OjheZbkcTFFOEdBWdMYskZszXXXzSl9agWrw8pvICwlJTQPTzHQFDQ>
Feedback-ID: i84614614:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 12:19:50 -0500 (EST)
References: <202311161132.13d8ce5a-oliver.sang@intel.com>
 <3540fd3e-88dd-462b-88ce-df28b7b5b148@redhat.com>
 <87edgo8gq7.fsf@devkernel.io>
User-agent: mu4e 1.10.3; emacs 29.1
From: Stefan Roesch <shr@devkernel.io>
To: Stefan Roesch <shr@devkernel.io>
Cc: David Hildenbrand <david@redhat.com>, kernel test robot
 <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Rik van  Riel <riel@surriel.com>,
 linux-mm@kvack.org, ltp@lists.linux.it
Subject: Re: [linus:master] [mm/ksm] 5e924ff54d: ltp.ksm01.fail
Date: Wed, 22 Nov 2023 09:16:47 -0800
In-reply-to: <87edgo8gq7.fsf@devkernel.io>
Message-ID: <877cm9so25.fsf@devkernel.io>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Stefan Roesch <shr@devkernel.io> writes:

> David Hildenbrand <david@redhat.com> writes:
>
>> On 16.11.23 05:39, kernel test robot wrote:
>>> hi, Stefan Roesch,
>>> we reported
>>> "[linux-next:master] [mm/ksm]  5e924ff54d: ltp.ksm01_1.fail"
>>> in
>>> https://lore.kernel.org/all/202311031548.66780ff5-oliver.sang@intel.com/
>>> when this commit is in linux-next/master.
>>> now we noticed this commit is merged in mainline, and we still observed
>>> same issue. just FYI.
>>> Hello,
>>> kernel test robot noticed "ltp.ksm01.fail" on:
>>> commit: 5e924ff54d088828794d9f1a4d5bf17808f7270e ("mm/ksm: add "smart" page
>>> scanning mode")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>> [test failed on linus/master 3ca112b71f35dd5d99fc4571a56b5fc6f0c15814]
>>> [test failed on linux-next/master 8728c14129df7a6e29188a2e737b4774fb200953]
>>> in testcase: ltp
>>> version: ltp-x86_64-14c1f76-1_20230715
>>> with following parameters:
>>> 	disk: 1HDD
>>> 	test: mm-00/ksm01
>>> compiler: gcc-12
>>> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (Kaby Lake) with 32G memory
>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version
>>> of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202311161132.13d8ce5a-oliver.sang@intel.com
>>> Running tests.......
>>> <<<test_start>>>
>>> tag=ksm01 stime=1699563923
>>> cmdline="ksm01"
>>> contacts=""
>>> analysis=exit
>>> <<<test_output>>>
>>> tst_kconfig.c:87: TINFO: Parsing kernel config '/proc/config.gz'
>>> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
>>> mem.c:422: TINFO: wait for all children to stop.
>>> mem.c:388: TINFO: child 0 stops.
>>> mem.c:388: TINFO: child 1 stops.
>>> mem.c:388: TINFO: child 2 stops.
>>> mem.c:495: TINFO: KSM merging...
>>> mem.c:434: TINFO: resume all children.
>>> mem.c:422: TINFO: wait for all children to stop.
>>> mem.c:344: TINFO: child 1 continues...
>>> mem.c:347: TINFO: child 1 allocates 128 MB filled with 'a'
>>> mem.c:344: TINFO: child 2 continues...
>>> mem.c:347: TINFO: child 2 allocates 128 MB filled with 'a'
>>> mem.c:344: TINFO: child 0 continues...
>>> mem.c:347: TINFO: child 0 allocates 128 MB filled with 'c'
>>> mem.c:400: TINFO: child 1 stops.
>>> mem.c:400: TINFO: child 0 stops.
>>> mem.c:400: TINFO: child 2 stops.
>>> ksm_helper.c:36: TINFO: ksm daemon takes 2s to run two full scans
>>> mem.c:264: TINFO: check!
>>> mem.c:255: TPASS: run is 1.
>>> mem.c:255: TPASS: pages_shared is 2.
>>> ....
>>> mem.c:255: TPASS: pages_shared is 1.
>>> mem.c:255: TPASS: pages_sharing is 98302.
>>> mem.c:252: TFAIL: pages_volatile is not 0 but 1.     <-----
>>> mem.c:252: TFAIL: pages_unshared is not 1 but 0.     <-----
>>
>> @Stefan, is this simply related to the new scanning optimization (skip and
>> eventually not merge a pages within the "2 scans" windows, whereby previously,
>> they would have gotten merged)?
>>
>> If so, we might just want to disable that optimization for that test case?
>>
>> Alternatively, maybe we have to wait for "more" scan cycles instead of only 2?
>
> I'd expect this is caused by "smart scan", where we can skip pages.
> The best is probably to disable the smart scan feature for this test.
> The smart scan feature can be disabled by:
>
>     echo 0 > /sys/kernel/mm/ksm/smart_scan
>
> I'll have a look at it today.
>

If I disable "smart scan", the testcase completes successully. This is
simply the case that for the testcase, it can "skip" a page (as the
"smart scan" feature is enabled).

The easiest fix is to disable smart scan for the ksm cases. I'll send an
ltp patch a bit later to address this issue.

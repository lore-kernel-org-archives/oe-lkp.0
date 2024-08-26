Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E806F2E0
	for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724703381; cv=none; b=tn3sLP6KwPB8LXE8+4+Sa2uq6rstymQBLlSu4EiL46bhN2iRf3WKVgIiQnLXhFPhDFgf9LR7zXUpDc/lweafGXqQ+wQl2OVzSVuZCBSBHeLMcLPhuCl/lNCVLHv3ctykyhBsQc5x4VKsSSZ6IHyZRhmnlPyNqL7ynwC+AhmEsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724703381; c=relaxed/simple;
	bh=9UPqPowlAdUfkBaH3/nOGrVaPKH3Ei0SqqnV8Dmd0T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCDSyKgt8jH1vrVTKmLnF65Mt1WcGrf1/TWrMqwmyWlqAafGnRhjEDjSaNVJtG14xD2uVFqmGYH+Iugmm5bP2ackOndlMjIn2bPf4BynkmA0JLM4xkrPOrZhrtbp14DukVUpNThhl3rHewWhnbBcUah5FCIr/Sk4tK/muOZ6Yok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cpfPXADs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=4WdmPyJG; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wt7TmSm+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=xz12XVqg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cpfPXADs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="4WdmPyJG";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wt7TmSm+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="xz12XVqg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A5EF51F8AE;
	Mon, 26 Aug 2024 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724703377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pI/jyIrtPaEmbStKVtuunJ5n4+ozSzU6r3tapoA0Qrg=;
	b=cpfPXADsYlFWRK5+KoPsbXbDkaItOw9FTUR0GI3aQ53hkZMHIT4wMoJc8FDqVM188gu0cb
	WsMreyFug/x/wnHzJKnvSx4w+eJhdEfkDTgf28G6hTU0WQ41Df6MDMqYVFhGxxh0MZZzR9
	wwB7qf6RD05ymPfTIB3KYX8uwnWTZ3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724703377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pI/jyIrtPaEmbStKVtuunJ5n4+ozSzU6r3tapoA0Qrg=;
	b=4WdmPyJGyJQmFRVNaXgoURsaEnj8ryUVjNlKPqXUAeS8cgXCuZEvLT7sFpdbAAj7mCSiPI
	ajX/g+4wheKMwMAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=wt7TmSm+;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=xz12XVqg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724703376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pI/jyIrtPaEmbStKVtuunJ5n4+ozSzU6r3tapoA0Qrg=;
	b=wt7TmSm+Dj/XWkbgJNzse0xbFT4y2ZP5dl3z6F6NGAdpqcszcyemrboN71is/7qq4dGMTM
	UfnOAf5GsKLUw/tLOyLKBAvRpVB8fCYFwDS406YdbtwTZ1kiwfKGvPFUQdlGEuMz2bMpwH
	M6aD8SqswEZzE1kGk/E23xkO5p3FRJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724703376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pI/jyIrtPaEmbStKVtuunJ5n4+ozSzU6r3tapoA0Qrg=;
	b=xz12XVqgYAm2ONU9cEJI0yzzbIVm9YoSJXo3RxaPpaaM4jqUepfZ7dJXW7A29fdh79QQ+v
	dd2whrkLEocMoiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 906AD13724;
	Mon, 26 Aug 2024 20:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4xziIpDizGZTRAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 26 Aug 2024 20:16:16 +0000
Message-ID: <2386c86f-d356-4782-b091-4007ee684e19@suse.cz>
Date: Mon, 26 Aug 2024 22:16:16 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [slub] 3a34e8ea62:
 BUG:KASAN:slab-use-after-free_in_kmem_cache_rcu_uaf
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>, Jann Horn <jannh@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>,
 kasan-dev@googlegroups.com
References: <202408251741.4ce3b34e-oliver.sang@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <202408251741.4ce3b34e-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A5EF51F8AE
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,intel.com,kvack.org,gmail.com,google.com,googlegroups.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,intel.com:email,01.org:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 8/25/24 11:45, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed "BUG:KASAN:slab-use-after-free_in_kmem_cache_rcu_uaf" on:
> 
> commit: 3a34e8ea62cdeba64a66fa4489059c59ba4ec285 ("slub: Introduce CONFIG_SLUB_RCU_DEBUG")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master c79c85875f1af04040fe4492ed94ce37ad729c4d]
> 
> in testcase: kunit
> version: 
> with following parameters:
> 
> 	group: group-00
> 
> 
> 
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)

It seems to me the kunit test produces the expected output and kasan doesn't
suppress dmesg output in kunit test context? So lkp probably already has all
the other kasan tests in some kind of allow filter, and this one would need
to be added as well?

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202408251741.4ce3b34e-oliver.sang@intel.com
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240825/202408251741.4ce3b34e-oliver.sang@intel.com
> 
> 
> kern  :err   : [  359.476745] ==================================================================
> kern  :err   : [  359.479027] BUG: KASAN: slab-use-after-free in kmem_cache_rcu_uaf+0x377/0x490 [kasan_test]
> kern  :err   : [  359.480349] Read of size 1 at addr ffff888361948840 by task kunit_try_catch/4608
> 
> kern  :err   : [  359.482361] CPU: 29 UID: 0 PID: 4608 Comm: kunit_try_catch Tainted: G    B            N 6.11.0-rc2-00010-g3a34e8ea62cd #1
> kern  :err   : [  359.484487] Tainted: [B]=BAD_PAGE, [N]=TEST
> kern  :err   : [  359.485478] Hardware name: Gigabyte Technology Co., Ltd. X299 UD4 Pro/X299 UD4 Pro-CF, BIOS F8a 04/27/2021
> kern  :err   : [  359.486969] Call Trace:
> kern  :err   : [  359.487837]  <TASK>
> kern  :err   : [  359.488673]  dump_stack_lvl+0x53/0x70
> kern  :err   : [  359.489634]  print_address_description+0x2c/0x3a0
> kern  :err   : [  359.490788]  ? kmem_cache_rcu_uaf+0x377/0x490 [kasan_test]
> kern  :err   : [  359.491900]  print_report+0xb9/0x2b0
> kern  :err   : [  359.492830]  ? kasan_addr_to_slab+0xd/0xb0
> kern  :err   : [  359.493806]  ? kmem_cache_rcu_uaf+0x377/0x490 [kasan_test]
> kern  :err   : [  359.494882]  kasan_report+0xe8/0x120
> kern  :err   : [  359.495797]  ? kmem_cache_rcu_uaf+0x377/0x490 [kasan_test]
> kern  :err   : [  359.496862]  kmem_cache_rcu_uaf+0x377/0x490 [kasan_test]
> kern  :err   : [  359.497927]  ? __pfx_kmem_cache_rcu_uaf+0x10/0x10 [kasan_test]
> kern  :err   : [  359.499020]  ? __schedule+0x7ec/0x1950
> kern  :err   : [  359.499929]  ? ktime_get_ts64+0x7f/0x230
> kern  :err   : [  359.500843]  kunit_try_run_case+0x1b0/0x490
> kern  :err   : [  359.501772]  ? __pfx_kunit_try_run_case+0x10/0x10
> kern  :err   : [  359.502735]  ? set_cpus_allowed_ptr+0x85/0xc0
> kern  :err   : [  359.503662]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
> kern  :err   : [  359.504629]  ? __pfx_kunit_try_run_case+0x10/0x10
> kern  :err   : [  359.505579]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> kern  :err   : [  359.506640]  kunit_generic_run_threadfn_adapter+0x7d/0xe0
> kern  :err   : [  359.507642]  kthread+0x2d8/0x3c0
> kern  :err   : [  359.508468]  ? __pfx_kthread+0x10/0x10
> kern  :err   : [  359.509337]  ret_from_fork+0x31/0x70
> kern  :err   : [  359.510185]  ? __pfx_kthread+0x10/0x10
> kern  :err   : [  359.511042]  ret_from_fork_asm+0x1a/0x30
> kern  :err   : [  359.511912]  </TASK>
> 
> kern  :err   : [  359.513276] Allocated by task 4608:
> kern  :warn  : [  359.514082]  kasan_save_stack+0x33/0x60
> kern  :warn  : [  359.514917]  kasan_save_track+0x14/0x30
> kern  :warn  : [  359.515748]  __kasan_slab_alloc+0x89/0x90
> kern  :warn  : [  359.516595]  kmem_cache_alloc_noprof+0x10e/0x380
> kern  :warn  : [  359.517499]  kmem_cache_rcu_uaf+0x10d/0x490 [kasan_test]
> kern  :warn  : [  359.518464]  kunit_try_run_case+0x1b0/0x490
> kern  :warn  : [  359.519323]  kunit_generic_run_threadfn_adapter+0x7d/0xe0
> kern  :warn  : [  359.520274]  kthread+0x2d8/0x3c0
> kern  :warn  : [  359.521040]  ret_from_fork+0x31/0x70
> kern  :warn  : [  359.521825]  ret_from_fork_asm+0x1a/0x30
> 
> kern  :err   : [  359.523201] Freed by task 0:
> kern  :warn  : [  359.523891]  kasan_save_stack+0x33/0x60
> kern  :warn  : [  359.524646]  kasan_save_track+0x14/0x30
> kern  :warn  : [  359.525384]  kasan_save_free_info+0x3b/0x60
> kern  :warn  : [  359.526154]  __kasan_slab_free+0x51/0x70
> kern  :warn  : [  359.526901]  slab_free_after_rcu_debug+0xf8/0x2a0
> kern  :warn  : [  359.527711]  rcu_do_batch+0x388/0xde0
> kern  :warn  : [  359.528433]  rcu_core+0x419/0xea0
> kern  :warn  : [  359.529120]  handle_softirqs+0x1d3/0x630
> kern  :warn  : [  359.529858]  __irq_exit_rcu+0x125/0x170
> kern  :warn  : [  359.530584]  sysvec_apic_timer_interrupt+0x6f/0x90
> kern  :warn  : [  359.531389]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
> 
> kern  :err   : [  359.532754] Last potentially related work creation:
> kern  :warn  : [  359.533562]  kasan_save_stack+0x33/0x60
> kern  :warn  : [  359.534283]  __kasan_record_aux_stack+0xad/0xc0
> kern  :warn  : [  359.535063]  kmem_cache_free+0x337/0x4c0
> kern  :warn  : [  359.535794]  kmem_cache_rcu_uaf+0x14b/0x490 [kasan_test]
> kern  :warn  : [  359.536644]  kunit_try_run_case+0x1b0/0x490
> kern  :warn  : [  359.537394]  kunit_generic_run_threadfn_adapter+0x7d/0xe0
> kern  :warn  : [  359.538244]  kthread+0x2d8/0x3c0
> kern  :warn  : [  359.538917]  ret_from_fork+0x31/0x70
> kern  :warn  : [  359.539616]  ret_from_fork_asm+0x1a/0x30
> 
> kern  :err   : [  359.540850] The buggy address belongs to the object at ffff888361948840
>                                which belongs to the cache test_cache of size 200
> kern  :err   : [  359.542668] The buggy address is located 0 bytes inside of
>                                freed 200-byte region [ffff888361948840, ffff888361948908)
> 
> kern  :err   : [  359.545021] The buggy address belongs to the physical page:
> kern  :warn  : [  359.545911] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x361948
> kern  :warn  : [  359.547012] head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> kern  :warn  : [  359.548094] flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
> kern  :warn  : [  359.549131] page_type: 0xfdffffff(slab)
> kern  :warn  : [  359.549918] raw: 0017ffffc0000040 ffff88821419ca00 dead000000000122 0000000000000000
> kern  :warn  : [  359.551034] raw: 0000000000000000 00000000801f001f 00000001fdffffff 0000000000000000
> kern  :warn  : [  359.552151] head: 0017ffffc0000040 ffff88821419ca00 dead000000000122 0000000000000000
> kern  :warn  : [  359.553278] head: 0000000000000000 00000000801f001f 00000001fdffffff 0000000000000000
> kern  :warn  : [  359.554406] head: 0017ffffc0000001 ffffea000d865201 ffffffffffffffff 0000000000000000
> kern  :warn  : [  359.555532] head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
> kern  :warn  : [  359.556660] page dumped because: kasan: bad access detected
> 
> kern  :err   : [  359.558233] Memory state around the buggy address:
> kern  :err   : [  359.559130]  ffff888361948700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> kern  :err   : [  359.560238]  ffff888361948780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> kern  :err   : [  359.561344] >ffff888361948800: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
> kern  :err   : [  359.562451]                                            ^
> kern  :err   : [  359.563410]  ffff888361948880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> kern  :err   : [  359.564535]  ffff888361948900: fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> kern  :err   : [  359.565661] ==================================================================
> kern  :info  : [  359.982162]     ok 38 kmem_cache_rcu_uaf
> 
> 
> 


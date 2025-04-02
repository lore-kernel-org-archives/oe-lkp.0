Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C8219306
	for <oe-lkp@lists.linux.dev>; Wed,  2 Apr 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604390; cv=none; b=UqPjIAvdwf3z/wrZbay48VpfveNQNpNfbG04s3KuEsBqhXakp/9Ky+/kj4COCPMAZHev6TydjVXLjd4v56gxk9uJYeyuEWSJwH6SxA8xO6MT0WyDNnCubuCgge6I7AiUEqvowNCmNYmKQWc6sQ7Z2lLbYzx3hmZOHnV4Hr/JOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604390; c=relaxed/simple;
	bh=U3EpRNMDmu4Z8Mg9OBfpuaNGvxSzMEURk/5yMJ2CuTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkCxKCupO6+EuPeYmSCPCfkxNUsL5p4/H5cQXlL6e57tJwAMqmY++zyU7RAjAUnDIKRY7zlZwLZqn60pxJFRiE7LfFJLM5+Kr8QXhW93y9L4A69tkJRvGXb8gTmmWD4ebXEMtXkgxnknyT1mfTc+PRMJ0Jn0J6Lsfs8yIX7AVy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=os1mNnLm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=k1SuRFq5; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=os1mNnLm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=k1SuRFq5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="os1mNnLm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="k1SuRFq5";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="os1mNnLm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="k1SuRFq5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2CA661F38E;
	Wed,  2 Apr 2025 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743604386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HikcY/xawSJssaCln1AvTwKvffpa8NAYabxOMBjk7ak=;
	b=os1mNnLmiTOoKDsGDMhR25mb8n5hzoClJUqmnC766Kw/FK+xcs88Y559eKcIL3gGhqVgq3
	rM5lDex217g99TAX/V5u6Mq4knh7djZanJ/ep9YB/t4VlpnoRQHCTjTdQN7o6m41mQYJkv
	MTG4N1FhmoGVWN0ut3vHX4Ua5U5TJJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743604386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HikcY/xawSJssaCln1AvTwKvffpa8NAYabxOMBjk7ak=;
	b=k1SuRFq5ia2/UycVJXDOHCJXvH//u6Uqv8cjdNOHeVjg71LNjQV1rXBK2OQmYN+0pyjHbH
	W0dIi059R/bluZDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743604386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HikcY/xawSJssaCln1AvTwKvffpa8NAYabxOMBjk7ak=;
	b=os1mNnLmiTOoKDsGDMhR25mb8n5hzoClJUqmnC766Kw/FK+xcs88Y559eKcIL3gGhqVgq3
	rM5lDex217g99TAX/V5u6Mq4knh7djZanJ/ep9YB/t4VlpnoRQHCTjTdQN7o6m41mQYJkv
	MTG4N1FhmoGVWN0ut3vHX4Ua5U5TJJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743604386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HikcY/xawSJssaCln1AvTwKvffpa8NAYabxOMBjk7ak=;
	b=k1SuRFq5ia2/UycVJXDOHCJXvH//u6Uqv8cjdNOHeVjg71LNjQV1rXBK2OQmYN+0pyjHbH
	W0dIi059R/bluZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11595137D4;
	Wed,  2 Apr 2025 14:33:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QFmwA6JK7WepLgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 14:33:06 +0000
Message-ID: <e378b43f-487e-46c2-a33f-e8e1f12bfb07@suse.cz>
Date: Wed, 2 Apr 2025 16:33:05 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:slub-percpu-sheaves-v3] [slab] c19bb08297:
 BUG:kernel_NULL_pointer_dereference,address
Content-Language: en-US
To: Harry Yoo <harry.yoo@oracle.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org
References: <202503241413.afff5aa1-lkp@intel.com> <Z-1IU2OXez-I5H0t@harry>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Z-1IU2OXez-I5H0t@harry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/2/25 16:23, Harry Yoo wrote:
> On Mon, Mar 24, 2025 at 02:18:53PM +0800, kernel test robot wrote:
>> 
>> 
>> Hello,
>> 
>> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
>> 
>> commit: c19bb0829736a5c7abe1d1b70d013489d720bb54 ("slab: add opt-in caching layer of percpu sheaves")
>> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3
> 
> If HEAD is commit c19bb0829, no user enables sheaves.
> That means it's trying to flush sheaves when no users enabled sheaves yet.
> 
> #syz test: https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3

Uh this is lkp not syzbot so likely won't do anything.

> diff --git a/mm/slub.c b/mm/slub.c
> index 2c7b2a85c628..dfd301ce4c76 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3853,7 +3853,8 @@ static int slub_cpu_dead(unsigned int cpu)
>  	mutex_lock(&slab_mutex);
>  	list_for_each_entry(s, &slab_caches, list) {
>  		__flush_cpu_slab(s, cpu);
> -		__pcs_flush_all_cpu(s, cpu);
> +		if (s->cpu_sheaves)
> +			__pcs_flush_all_cpu(s, cpu);
>  	}
>  	mutex_unlock(&slab_mutex);
>  	return 0;

Thanks Harry! Will apply it and push a new branch probably called
slub-percpu-sheaves-v4r0 for now.

>> 
>> in testcase: rcutorture
>> version: 
>> with following parameters:
>> 
>> 	runtime: 300s
>> 	test: cpuhotplug
>> 	torture_type: srcud
>> 
>> 
>> 
>> config: i386-randconfig-005-20250321
>> compiler: gcc-12
>> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>> 
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>> 
>> 
>> +---------------------------------------------+------------+------------+
>> |                                             | d52c71b1f1 | c19bb08297 |
>> +---------------------------------------------+------------+------------+
>> | boot_successes                              | 6          | 0          |
>> | boot_failures                               | 0          | 6          |
>> | BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
>> | Oops                                        | 0          | 6          |
>> | EIP:slub_cpu_dead                           | 0          | 6          |
>> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
>> +---------------------------------------------+------------+------------+
>> 
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202503241413.afff5aa1-lkp@intel.com
>> 
>> 
>> [  100.813833][    T6] BUG: kernel NULL pointer dereference, address: 00000008
>> [  100.814405][    T6] #PF: supervisor read access in kernel mode
>> [  100.814830][    T6] #PF: error_code(0x0000) - not-present page
>> [  100.815260][    T6] *pde = 00000000
>> [  100.815526][    T6] Oops: Oops: 0000 [#1] SMP
>> [  100.815856][    T6] CPU: 0 UID: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.14.0-rc1-00007-gc19bb0829736 #1
>> [  100.816542][    T6] Workqueue: events work_for_cpu_fn
>> [ 100.816933][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
>> [ 100.817301][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
>> All code
>> ========
>>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
>>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
>>    b:	74 72                	je     0x7f
>>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
>>   10:	8d 76 00             	lea    0x0(%rsi),%esi
>>   13:	8b 1e                	mov    (%rsi),%ebx
>>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
>>   19:	77 7a                	ja     0x95
>>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
>>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
>>   25:	01 cb                	add    %ecx,%ebx
>>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
>>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
>>   2d:	85 d2                	test   %edx,%edx
>>   2f:	74 11                	je     0x42
>>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>>   34:	89 f0                	mov    %esi,%eax
>>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
>>   3b:	c7                   	.byte 0xc7
>>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
>> 	...
>> 
>> Code starting with the faulting instruction
>> ===========================================
>>    0:	8b 57 08             	mov    0x8(%rdi),%edx
>>    3:	85 d2                	test   %edx,%edx
>>    5:	74 11                	je     0x18
>>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>>    a:	89 f0                	mov    %esi,%eax
>>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
>>   11:	c7                   	.byte 0xc7
>>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
>> 	...
>> [  100.819393][    T6] EAX: 00000001 EBX: a9148000 ECX: a9148000 EDX: 00000000
>> [  100.819900][    T6] ESI: 40392e80 EDI: 00000000 EBP: 401cfe78 ESP: 401cfe68
>> [  100.820414][    T6] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [  100.820969][    T6] CR0: 80050033 CR2: 00000008 CR3: 7c8e9000 CR4: 00040690
>> [  100.821493][    T6] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>> [  100.822008][    T6] DR6: fffe0ff0 DR7: 00000400
>> [  100.822356][    T6] Call Trace:
>> [ 100.822609][ T6] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
>> [ 100.822935][ T6] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
>> [ 100.823237][ T6] ? page_fault_oops (arch/x86/mm/fault.c:709) 
>> [ 100.823596][ T6] ? kernelmode_fixup_or_oops+0x58/0x70 
>> [ 100.824081][ T6] ? __bad_area_nosemaphore+0x10f/0x1f0 
>> [ 100.824560][ T6] ? hrtimer_interrupt (kernel/time/hrtimer.c:1877) 
>> [ 100.824934][ T6] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
>> [ 100.825309][ T6] ? do_user_addr_fault (arch/x86/mm/fault.c:1451) 
>> [ 100.825686][ T6] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
>> [ 100.826123][ T6] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
>> [ 100.826474][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
>> [ 100.826923][ T6] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
>> [ 100.827294][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
>> [ 100.827737][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
>> [ 100.828071][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
>> [ 100.828520][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
>> [ 100.828861][ T6] ? cpuhp_invoke_callback (kernel/cpu.c:194) 
>> [ 100.829258][ T6] ? __wait_for_common (kernel/sched/completion.c:122) 
>> [ 100.829631][ T6] ? hrtimer_nanosleep_restart (kernel/time/sleep_timeout.c:62) 
>> [ 100.830069][ T6] ? kfree (mm/slub.c:3777) 
>> [ 100.830367][ T6] ? __cpuhp_invoke_callback_range (kernel/cpu.c:967) 
>> [ 100.830805][ T6] ? _cpu_down+0xf9/0x390 
>> [ 100.831205][ T6] ? __cpu_down_maps_locked (kernel/cpu.c:1475) 
>> [ 100.831611][ T6] ? work_for_cpu_fn (kernel/workqueue.c:6731) 
>> [ 100.831966][ T6] ? process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3241) 
>> [ 100.832338][ T6] ? worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398) 
>> [ 100.832694][ T6] ? kthread (kernel/kthread.c:464) 
>> [ 100.833001][ T6] ? rescuer_thread (kernel/workqueue.c:3344) 
>> [ 100.833356][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
>> [ 100.833733][ T6] ? ret_from_fork (arch/x86/kernel/process.c:154) 
>> [ 100.838377][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
>> [ 100.838752][ T6] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
>> [ 100.839109][ T6] ? entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
>> [  100.839472][    T6] Modules linked in: rcutorture torture
>> [  100.839877][    T6] CR2: 0000000000000008
>> [  100.840173][    T6] ---[ end trace 0000000000000000 ]---
>> [ 100.840547][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
>> [ 100.840886][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
>> All code
>> ========
>>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
>>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
>>    b:	74 72                	je     0x7f
>>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
>>   10:	8d 76 00             	lea    0x0(%rsi),%esi
>>   13:	8b 1e                	mov    (%rsi),%ebx
>>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
>>   19:	77 7a                	ja     0x95
>>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
>>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
>>   25:	01 cb                	add    %ecx,%ebx
>>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
>>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
>>   2d:	85 d2                	test   %edx,%edx
>>   2f:	74 11                	je     0x42
>>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>>   34:	89 f0                	mov    %esi,%eax
>>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
>>   3b:	c7                   	.byte 0xc7
>>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
>> 	...
>> 
>> Code starting with the faulting instruction
>> ===========================================
>>    0:	8b 57 08             	mov    0x8(%rdi),%edx
>>    3:	85 d2                	test   %edx,%edx
>>    5:	74 11                	je     0x18
>>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>>    a:	89 f0                	mov    %esi,%eax
>>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
>>   11:	c7                   	.byte 0xc7
>>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
>> 
>> 
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250324/202503241413.afff5aa1-lkp@intel.com
>> 
>> 
>> 
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>> 
> 


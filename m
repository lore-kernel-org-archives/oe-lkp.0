Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726D6184109
	for <oe-lkp@lists.linux.dev>; Mon, 15 Jul 2024 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028055; cv=none; b=XvD3qdB5SAyedy5x/sz81BTB7J98tF3VzAIqOtdLatpTIehGEYQuYAsFU4gR77aSZ1CcnuHVticK0rbsSc7r0raRc/tRSn6BK2IdZkYWXqcctSwWS+wjk3z1hiSou/rWZZ3DzC8bCptNZZ4xlfwnGKwkozKeRNn+9DaFCttdnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028055; c=relaxed/simple;
	bh=+uxGN2CNCaIDNkKTVWo8BwoRt2COqJ4lry0hN0gALCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfw1hTMCLEVdMXhUhdhlYSp+Z389bsPVmYO3nKS79WcMYvZkTY/3Ha1I+/UMlFOwHoLRtx7VuqS4WgqQZf2uXfsSTzDMwTsipU71iyTPQTDN2cvklQdeGZolY3waoxUsLa0o2yRCuiRMHNEfbtQVzfvbXnvphqBoMZvaokib9hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vGtjbyF8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CC8lSt+V; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vGtjbyF8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CC8lSt+V; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vGtjbyF8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CC8lSt+V";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vGtjbyF8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CC8lSt+V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FE151F7B2;
	Mon, 15 Jul 2024 07:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721028051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z54OZiXbN49bljcbNPUGHnUBWxHuCfI8C2acEjwuB1M=;
	b=vGtjbyF8hLGLLF1250DllfiYlcq6gF+oW+kNEYMDDH1T7vNQyJp9lsQ7kg8en0wbNOaawM
	oxdFH9khfip3Y3l2zqSz6PSjsBRjmORmPzgWOGqGjjBGn+zlUm/QwgvzDVwYbMrRPbH5km
	uFDRzGiITeSOXW/tKr61IqG1C7IEVnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721028051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z54OZiXbN49bljcbNPUGHnUBWxHuCfI8C2acEjwuB1M=;
	b=CC8lSt+VAAKNCcFlk/rOhm+bEReL9XUluNOhKPN4wbK4mvJVfucoID0r35/iEo6VP6B9aq
	lufI381Ty8ZS+DAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721028051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z54OZiXbN49bljcbNPUGHnUBWxHuCfI8C2acEjwuB1M=;
	b=vGtjbyF8hLGLLF1250DllfiYlcq6gF+oW+kNEYMDDH1T7vNQyJp9lsQ7kg8en0wbNOaawM
	oxdFH9khfip3Y3l2zqSz6PSjsBRjmORmPzgWOGqGjjBGn+zlUm/QwgvzDVwYbMrRPbH5km
	uFDRzGiITeSOXW/tKr61IqG1C7IEVnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721028051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z54OZiXbN49bljcbNPUGHnUBWxHuCfI8C2acEjwuB1M=;
	b=CC8lSt+VAAKNCcFlk/rOhm+bEReL9XUluNOhKPN4wbK4mvJVfucoID0r35/iEo6VP6B9aq
	lufI381Ty8ZS+DAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83028134AB;
	Mon, 15 Jul 2024 07:20:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rMilH9PNlGZ4ZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 15 Jul 2024 07:20:51 +0000
Message-ID: <67feff57-759a-41d3-89f2-1de7d136ac71@suse.cz>
Date: Mon, 15 Jul 2024 09:20:51 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:slub-percpu-sheaves-v1r0] [TESTING, HACK] 9cb4096680:
 BUG:unable_to_handle_page_fault_for_address
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
References: <202407141855.53dbebec-oliver.sang@intel.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <202407141855.53dbebec-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -0.29
X-Spamd-Result: default: False [-0.29 / 50.00];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Level: 

On 7/14/24 1:10 PM, kernel test robot wrote:
> 
> hi, Vlastimil Babka,
> 
> we noticed this is a 'TESTING, HACK' patch, however, we are not sure if this
> report could supply some hints or information to you, so just report FYI.

Yes thanks for reporting. The commit was actually intended to get more
stress on the new code, although it's not for later inclusion.

Vlastimil

> Hello,
> 
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:
> 
> commit: 9cb4096680ee90fe6be1b22ff3961174fa8e3ee4 ("TESTING, HACK: sheaves for everyone")
> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r0
> 
> in testcase: boot
> 
> compiler: gcc-10
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +-------------------------------------------------------+------------+------------+
> |                                                       | 7e57e2483a | 9cb4096680 |
> +-------------------------------------------------------+------------+------------+
> | boot_successes                                        | 6          | 0          |
> | boot_failures                                         | 0          | 6          |
> | BUG:unable_to_handle_page_fault_for_address           | 0          | 3          |
> | Oops                                                  | 0          | 6          |
> | EIP:refill_obj_stock                                  | 0          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 6          |
> | BUG:kernel_NULL_pointer_dereference,address           | 0          | 3          |
> +-------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202407141855.53dbebec-oliver.sang@intel.com
> 
> 
> [    9.827171][    C0] BUG: unable to handle page fault for address: 6b6b6b6b
> [    9.828805][    C0] #PF: supervisor read access in kernel mode
> [    9.830174][    C0] #PF: error_code(0x0000) - not-present page
> [    9.830821][    C0] *pde = 00000000
> [    9.830821][    C0] Oops: Oops: 0000 [#1] PREEMPT
> [    9.830821][    C0] CPU: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.10.0-rc1-00012-g9cb4096680ee #1
> [    9.830821][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 9.830821][ C0] EIP: refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
> [ 9.830821][ C0] Code: ff 31 c9 31 d2 b8 d0 a8 92 c3 68 6c e5 24 c1 6a 00 6a 00 6a 02 e8 66 7e e7 ff e8 89 7d 2f 01 83 c4 10 85 c0 0f 85 ae 01 00 00 <8b> 03 a8 03 0f 85 f4 01 00 00 ff 00 e8 6d 7d 2f 01 85 c0 0f 85 75
> All code
> ========
>    0:	ff 31                	pushq  (%rcx)
>    2:	c9                   	leaveq 
>    3:	31 d2                	xor    %edx,%edx
>    5:	b8 d0 a8 92 c3       	mov    $0xc392a8d0,%eax
>    a:	68 6c e5 24 c1       	pushq  $0xffffffffc124e56c
>    f:	6a 00                	pushq  $0x0
>   11:	6a 00                	pushq  $0x0
>   13:	6a 02                	pushq  $0x2
>   15:	e8 66 7e e7 ff       	callq  0xffffffffffe77e80
>   1a:	e8 89 7d 2f 01       	callq  0x12f7da8
>   1f:	83 c4 10             	add    $0x10,%esp
>   22:	85 c0                	test   %eax,%eax
>   24:	0f 85 ae 01 00 00    	jne    0x1d8
>   2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
>   2c:	a8 03                	test   $0x3,%al
>   2e:	0f 85 f4 01 00 00    	jne    0x228
>   34:	ff 00                	incl   (%rax)
>   36:	e8 6d 7d 2f 01       	callq  0x12f7da8
>   3b:	85 c0                	test   %eax,%eax
>   3d:	0f                   	.byte 0xf
>   3e:	85                   	.byte 0x85
>   3f:	75                   	.byte 0x75
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	8b 03                	mov    (%rbx),%eax
>    2:	a8 03                	test   $0x3,%al
>    4:	0f 85 f4 01 00 00    	jne    0x1fe
>    a:	ff 00                	incl   (%rax)
>    c:	e8 6d 7d 2f 01       	callq  0x12f7d7e
>   11:	85 c0                	test   %eax,%eax
>   13:	0f                   	.byte 0xf
>   14:	85                   	.byte 0x85
>   15:	75                   	.byte 0x75
> [    9.830821][    C0] EAX: 00000001 EBX: 6b6b6b6b ECX: 00000001 EDX: 23d164d6
> [    9.830821][    C0] ESI: 000000c4 EDI: 00000000 EBP: c4bc1e54 ESP: c4bc1e3c
> [    9.830821][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010002
> [    9.830821][    C0] CR0: 80050033 CR2: 6b6b6b6b CR3: 2b0e7000 CR4: 000406d0
> [    9.830821][    C0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    9.830821][    C0] DR6: fffe0ff0 DR7: 00000400
> [    9.830821][    C0] Call Trace:
> [ 9.830821][ C0] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
> [ 9.830821][ C0] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
> [ 9.830821][ C0] ? page_fault_oops (arch/x86/mm/fault.c:715) 
> [ 9.830821][ C0] ? kernelmode_fixup_or_oops+0x64/0x70 
> [ 9.830821][ C0] ? __bad_area_nosemaphore+0x10d/0x1a8 
> [ 9.830821][ C0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
> [ 9.830821][ C0] ? do_user_addr_fault (arch/x86/mm/fault.c:1452) 
> [ 9.830821][ C0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
> [ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
> [ 9.830821][ C0] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
> [ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
> [ 9.830821][ C0] ? refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
> [ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
> [ 9.830821][ C0] ? refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
> [ 9.830821][ C0] __memcg_slab_free_hook (mm/slab.h:599 mm/memcontrol.c:3804) 
> [ 9.830821][ C0] __rcu_free_sheaf_prepare (mm/slub.c:5049) 
> [ 9.830821][ C0] rcu_free_sheaf (mm/slub.c:5072) 
> [ 9.830821][ C0] rcu_do_batch+0x17b/0x588 
> [ 9.830821][ C0] rcu_core (kernel/rcu/tree.c:2812) 
> [ 9.830821][ C0] rcu_core_si (kernel/rcu/tree.c:2828) 
> [ 9.830821][ C0] handle_softirqs (include/linux/jump_label.h:207 include/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:555) 
> [ 9.830821][ C0] run_ksoftirqd (kernel/softirq.c:411 kernel/softirq.c:929) 
> [ 9.830821][ C0] smpboot_thread_fn (kernel/smpboot.c:164 (discriminator 3)) 
> [ 9.830821][ C0] kthread (kernel/kthread.c:389) 
> [ 9.830821][ C0] ? sort_range (kernel/smpboot.c:107) 
> [ 9.830821][ C0] ? kthread_park (kernel/kthread.c:342) 
> [ 9.830821][ C0] ret_from_fork (arch/x86/kernel/process.c:153) 
> [ 9.830821][ C0] ? kthread_park (kernel/kthread.c:342) 
> [ 9.830821][ C0] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
> [ 9.830821][ C0] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
> [    9.830821][    C0] Modules linked in:
> [    9.830821][    C0] CR2: 000000006b6b6b6b
> [    9.830821][    C0] ---[ end trace 0000000000000000 ]---
> [ 9.830821][ C0] EIP: refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
> [ 9.830821][ C0] Code: ff 31 c9 31 d2 b8 d0 a8 92 c3 68 6c e5 24 c1 6a 00 6a 00 6a 02 e8 66 7e e7 ff e8 89 7d 2f 01 83 c4 10 85 c0 0f 85 ae 01 00 00 <8b> 03 a8 03 0f 85 f4 01 00 00 ff 00 e8 6d 7d 2f 01 85 c0 0f 85 75
> All code
> ========
>    0:	ff 31                	pushq  (%rcx)
>    2:	c9                   	leaveq 
>    3:	31 d2                	xor    %edx,%edx
>    5:	b8 d0 a8 92 c3       	mov    $0xc392a8d0,%eax
>    a:	68 6c e5 24 c1       	pushq  $0xffffffffc124e56c
>    f:	6a 00                	pushq  $0x0
>   11:	6a 00                	pushq  $0x0
>   13:	6a 02                	pushq  $0x2
>   15:	e8 66 7e e7 ff       	callq  0xffffffffffe77e80
>   1a:	e8 89 7d 2f 01       	callq  0x12f7da8
>   1f:	83 c4 10             	add    $0x10,%esp
>   22:	85 c0                	test   %eax,%eax
>   24:	0f 85 ae 01 00 00    	jne    0x1d8
>   2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
>   2c:	a8 03                	test   $0x3,%al
>   2e:	0f 85 f4 01 00 00    	jne    0x228
>   34:	ff 00                	incl   (%rax)
>   36:	e8 6d 7d 2f 01       	callq  0x12f7da8
>   3b:	85 c0                	test   %eax,%eax
>   3d:	0f                   	.byte 0xf
>   3e:	85                   	.byte 0x85
>   3f:	75                   	.byte 0x75
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	8b 03                	mov    (%rbx),%eax
>    2:	a8 03                	test   $0x3,%al
>    4:	0f 85 f4 01 00 00    	jne    0x1fe
>    a:	ff 00                	incl   (%rax)
>    c:	e8 6d 7d 2f 01       	callq  0x12f7d7e
>   11:	85 c0                	test   %eax,%eax
>   13:	0f                   	.byte 0xf
>   14:	85                   	.byte 0x85
>   15:	75                   	.byte 0x75
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240714/202407141855.53dbebec-oliver.sang@intel.com
> 
> 
> 


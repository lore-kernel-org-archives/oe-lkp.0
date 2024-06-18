Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138C4C6D
	for <oe-lkp@lists.linux.dev>; Tue, 18 Jun 2024 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718683087; cv=none; b=ryBqChwO9p1IalXJNEDnjPAV96i/UIh6I1Avw1Qd0Ebb0tgzdpMg5LqDUqn4MeNH1qBnt1OH5lbw5FmhGGmSvLVspe6J8+ne8xmeNPXdNUmJQdTkqn/4d0bSa3mvFyHQ9JQiFJanuuUk8KYuDeUB7UgXnMUap6bK0n+m1cifRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718683087; c=relaxed/simple;
	bh=B451/ADFlh8wXjOt980F+zr5Ii8wg44Ztu4gItrAlt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wp521zTomjIWGvmloR8Jk1pWMUe3OpUfd3bzKpM9iv9Ri3u3AAQ/IobN1vDyUfFDfXanXRkOygbZgggeut9k2yo7D3qWarWzjCCB9doCo6jb6c+kKt0RtRUUfDGMOgYZjiFIUIeQJP8BnbM0DAavBuUuoKfQlBmjK/2RFlUzzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4W3CYd73TRzPr6S;
	Tue, 18 Jun 2024 11:54:29 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (unknown [7.185.36.114])
	by mail.maildlp.com (Postfix) with ESMTPS id 56B0D140361;
	Tue, 18 Jun 2024 11:58:01 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 11:58:01 +0800
Message-ID: <a16d0746-ada0-e50d-520b-70aad5dc8d5c@huawei.com>
Date: Tue, 18 Jun 2024 11:58:00 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [linux-next:master] [mm/hugetlb_cgroup] 11308a02a5:
 BUG:key#has_not_been_registered
To: kernel test robot <oliver.sang@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
References: <202406181046.8d8b2492-oliver.sang@intel.com>
Content-Language: en-US
From: xiujianfeng <xiujianfeng@huawei.com>
In-Reply-To: <202406181046.8d8b2492-oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)

Hi,

On 2024/6/18 10:42, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:key#has_not_been_registered" on:
> 
> commit: 11308a02a56ccd8b3523d5472bd89bc91888edfb ("mm/hugetlb_cgroup: switch to the new cftypes")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Thanks, the fix patch has already been sent out:

https://lore.kernel.org/all/20240618034723.2122429-1-xiujianfeng@huawei.com/

> 
> in testcase: boot
> 
> compiler: clang-18
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +------------------------------------------------------------+------------+------------+
> |                                                            | e18df2889f | 11308a02a5 |
> +------------------------------------------------------------+------------+------------+
> | BUG:key#has_not_been_registered                            | 0          | 6          |
> | WARNING:at_kernel/locking/lockdep.c:#lockdep_init_map_type | 0          | 6          |
> | EIP:lockdep_init_map_type                                  | 0          | 6          |
> +------------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202406181046.8d8b2492-oliver.sang@intel.com
> 
> 
> [   17.312964][    T1] BUG: key c3daa090 has not been registered!
> [   17.313956][    T1] ------------[ cut here ]------------
> [   17.314778][    T1] DEBUG_LOCKS_WARN_ON(1)
> [ 17.314828][ T1] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:4895 lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
> [   17.317059][    T1] Modules linked in:
> [   17.317706][    T1] CPU: 1 PID: 1 Comm: init Not tainted 6.10.0-rc3-00221-g11308a02a56c #1
> [   17.319005][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 17.320620][ T1] EIP: lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
> [ 17.321551][ T1] Code: 93 62 c3 00 75 d7 e8 e2 71 4b 00 85 c0 74 ce 83 3d ec c4 e8 c2 00 75 c5 68 bb ef 81 c2 68 ed f4 8c c2 e8 26 74 f8 ff 83 c4 08 <0f> 0b eb af 51 68 e8 f8 8c c2 e8 f8 4d 0a 01 83 c4 08 83 3d 80 93
> All code
> ========
>    0:	93                   	xchg   %eax,%ebx
>    1:	62 c3                	(bad)
>    3:	00 75 d7             	add    %dh,-0x29(%rbp)
>    6:	e8 e2 71 4b 00       	call   0x4b71ed
>    b:	85 c0                	test   %eax,%eax
>    d:	74 ce                	je     0xffffffffffffffdd
>    f:	83 3d ec c4 e8 c2 00 	cmpl   $0x0,-0x3d173b14(%rip)        # 0xffffffffc2e8c502
>   16:	75 c5                	jne    0xffffffffffffffdd
>   18:	68 bb ef 81 c2       	push   $0xffffffffc281efbb
>   1d:	68 ed f4 8c c2       	push   $0xffffffffc28cf4ed
>   22:	e8 26 74 f8 ff       	call   0xfffffffffff8744d
>   27:	83 c4 08             	add    $0x8,%esp
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	eb af                	jmp    0xffffffffffffffdd
>   2e:	51                   	push   %rcx
>   2f:	68 e8 f8 8c c2       	push   $0xffffffffc28cf8e8
>   34:	e8 f8 4d 0a 01       	call   0x10a4e31
>   39:	83 c4 08             	add    $0x8,%esp
>   3c:	83                   	.byte 0x83
>   3d:	3d                   	.byte 0x3d
>   3e:	80                   	.byte 0x80
>   3f:	93                   	xchg   %eax,%ebx
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	eb af                	jmp    0xffffffffffffffb3
>    4:	51                   	push   %rcx
>    5:	68 e8 f8 8c c2       	push   $0xffffffffc28cf8e8
>    a:	e8 f8 4d 0a 01       	call   0x10a4e07
>    f:	83 c4 08             	add    $0x8,%esp
>   12:	83                   	.byte 0x83
>   13:	3d                   	.byte 0x3d
>   14:	80                   	.byte 0x80
>   15:	93                   	xchg   %eax,%ebx
> [   17.324581][    T1] EAX: b42eb320 EBX: c4e60000 ECX: c29aae84 EDX: 00000000
> [   17.325660][    T1] ESI: c3daa090 EDI: c510dea8 EBP: c3ac7c68 ESP: c3ac7c50
> [   17.326730][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010296
> [   17.327901][    T1] CR0: 80050033 CR2: b7f2c844 CR3: 03e01de0 CR4: 000406b0
> [   17.329065][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [   17.330100][    T1] DR6: fffe0ff0 DR7: 00000400
> [   17.330786][    T1] Call Trace:
> [ 17.331280][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
> [ 17.331925][ T1] ? __warn (kernel/panic.c:239 kernel/panic.c:693) 
> [ 17.332528][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
> [ 17.333339][ T1] ? report_bug (lib/bug.c:199) 
> [ 17.333992][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
> [ 17.334646][ T1] ? handle_bug (arch/x86/kernel/traps.c:?) 
> [ 17.335274][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
> [ 17.335969][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
> [ 17.336724][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
> [ 17.337392][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
> [ 17.338183][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
> [ 17.338837][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
> [ 17.339631][ T1] __kernfs_create_file (include/linux/lockdep.h:135 include/linux/lockdep.h:142 include/linux/lockdep.h:148 fs/kernfs/file.c:1046) 
> [ 17.340358][ T1] cgroup_addrm_files (kernel/cgroup/cgroup.c:4201) 
> [ 17.341105][ T1] css_populate_dir (kernel/cgroup/cgroup.c:?) 
> [ 17.341806][ T1] cgroup_apply_control_enable (kernel/cgroup/cgroup.c:3226) 
> [ 17.342663][ T1] cgroup_apply_control (kernel/cgroup/cgroup.c:3300) 
> [ 17.343398][ T1] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:? kernel/locking/lockdep.c:4359) 
> [ 17.347609][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
> [ 17.348416][ T1] ? rebind_subsystems (include/linux/spinlock.h:? kernel/cgroup/cgroup.c:1861) 
> [ 17.349188][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
> [ 17.349921][ T1] rebind_subsystems (kernel/cgroup/cgroup.c:1880) 
> [ 17.350650][ T1] cgroup_setup_root (kernel/cgroup/cgroup.c:2118) 
> [ 17.351383][ T1] cgroup1_get_tree (kernel/cgroup/cgroup-v1.c:1225) 
> [ 17.352116][ T1] vfs_get_tree (fs/super.c:1781) 
> [ 17.352808][ T1] do_new_mount (fs/namespace.c:3352) 
> [ 17.353490][ T1] ? security_capable (security/security.c:1036) 
> [ 17.354209][ T1] path_mount (fs/namespace.c:3679) 
> [ 17.354846][ T1] __ia32_sys_mount (fs/namespace.c:3692 fs/namespace.c:3898 fs/namespace.c:3875 fs/namespace.c:3875) 
> [ 17.355575][ T1] ? __might_fault (mm/memory.c:?) 
> [ 17.356258][ T1] ia32_sys_call (arch/x86/entry/syscall_32.c:42) 
> [ 17.356960][ T1] __do_fast_syscall_32 (arch/x86/entry/common.c:?) 
> [ 17.357718][ T1] ? irqentry_exit_to_user_mode (kernel/entry/common.c:234) 
> [ 17.358564][ T1] ? irqentry_exit (kernel/entry/common.c:367) 
> [ 17.359249][ T1] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
> [ 17.360017][ T1] do_SYSENTER_32 (arch/x86/entry/common.c:449) 
> [ 17.360693][ T1] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836) 
> [   17.361438][    T1] EIP: 0xb7f5a539
> [ 17.361997][ T1] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 0f 1f 00 58 b8 77 00 00 00 cd 80 90 0f 1f
> All code
> ========
>    0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
>    4:	10 07                	adc    %al,(%rdi)
>    6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
>    a:	10 08                	adc    %cl,(%rax)
>    c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
> 	...
>   20:	00 51 52             	add    %dl,0x52(%rcx)
>   23:	55                   	push   %rbp
>   24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
>   26:	0f 34                	sysenter
>   28:	cd 80                	int    $0x80
>   2a:	5d                   	pop    %rbp
>   2b:	5a                   	pop    %rdx
>   2c:	59                   	pop    %rcx
>   2d:	c3                   	ret
>   2e:	90                   	nop
>   2f:	90                   	nop
>   30:	90                   	nop
>   31:	90                   	nop
>   32:	0f 1f 00             	nopl   (%rax)
>   35:	58                   	pop    %rax
>   36:	b8 77 00 00 00       	mov    $0x77,%eax
>   3b:	cd 80                	int    $0x80
>   3d:	90                   	nop
>   3e:	0f                   	.byte 0xf
>   3f:	1f                   	(bad)
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	5d                   	pop    %rbp
>    1:	5a                   	pop    %rdx
>    2:	59                   	pop    %rcx
>    3:	c3                   	ret
>    4:	90                   	nop
>    5:	90                   	nop
>    6:	90                   	nop
>    7:	90                   	nop
>    8:	0f 1f 00             	nopl   (%rax)
>    b:	58                   	pop    %rax
>    c:	b8 77 00 00 00       	mov    $0x77,%eax
>   11:	cd 80                	int    $0x80
>   13:	90                   	nop
>   14:	0f                   	.byte 0xf
>   15:	1f                   	(bad)
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240618/202406181046.8d8b2492-oliver.sang@intel.com
> 
> 
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402562;
	b=P7+MevTL4No/wfJxuYSjcQz8eLy5mDhDUxpJ/KGKdPBZFp48sfhDJ1xovqbDSy+pNToI
	 HoNAsg0Rjs33VjNVA1K+NmONBV4GGs/7b9JXoLbDuBXsMZ2tYV80mG6Sf/KdaDigswvSA
	 7q5/vBLfWjL+pdhoi0uI8b8Krsvdj3V9qpt5lOtNXAIcSTsu3d2SRGNio6maqfPGes7eI
	 pXvaIw6V8Qc0mWd8ggargiflCK3rnSyv5MtHfTQ1VYIw1/F4yMAtz3l9+/ZLVml0ui5CQ
	 bIjO+V551w09qq9ysVeM5YXUt/VW6/hScOVRn83niLnQxnXXq17VXwS6eOPr0uiGYsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YFSznwul4THjiRPoamb1lX23kbVJJNs3MzKLdDW2q64=;
	b=5FfBqCICzQGaEekgBH14WsaA59NaTQMyjpoIQV75vSgAUb+QZkKtvCAfFesxJswo/+JK
	 oZ/qm9t/ehyMOZ0qudsRR1OL8Xvb41u0X25Hf3VNx2JmrSxlowGWKfkRO819eEUwvvlWa
	 b+ABvgNTDoROLa0511Fq9ZJPbj8xQLhAwNPeEqZv+mrCothGPnZW0kbtEi+LdCEiS2ISo
	 PqFO52hgkQtdiGwtyzFhEjUwmGzywy7IfRCt0bx+vnhTx6bvjRK22OL2WweOcGUZHvoc9
	 ekvz/ndm+w84EbQbMyKkYNuBFq/v70Jl+YLWAYkmWCq+dZwo76p/rRDxnzKYSHybfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thnyPV7n;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC48606A31A
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 02:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thnyPV7n
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN057hI708047;
	Mon, 23 Nov 2026 02:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YFSznw
	ul4THjiRPoamb1lX23kbVJJNs3MzKLdDW2q64=; b=thnyPV7n4lxnB53k1W+8k7
	Zh22DgL2x4kpzxCU4n8h98ZgdUTT29ZQmvugRgrBJyAhwCUcM0zbThhlmlyIGMwt
	QPUwTHUQJ6FFEdmZLFe6Piluw2FA/AFJ4L/au6ss3mI3hImP+J2AoI0uPNaDnCEw
	skH4qxzysDaTmomtULCPY8Bay2b72tqjyLZdGtBxM+seX7+flerMI0U9nCfxu6yM
	biXemCw1/kVFJXwMCyJFKIZaYL7SaMxRYcFwy2FVQCHnYnd+7vqwVyt3xm5QshjF
	Hvj7pzsZKWeTfz9pn3kKZjwnaj22FmsRTwiFKfKEVQi+2BBmBrczhjpt6UZF2kZQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p48y12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 02:55:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN04Ier2492322;
	Mon, 23 Nov 2026 02:55:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3pmjw4mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 02:55:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN2toC148890356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 02:55:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B181F2004E;
	Mon, 23 Nov 2026 02:55:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B92552004B;
	Mon, 23 Nov 2026 02:55:48 +0000 (GMT)
Received: from [9.124.222.251] (unknown [9.124.222.251])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 02:55:48 +0000 (GMT)
Message-ID: <7446f558-5cbe-4efc-b6bb-686d0dca9f42@linux.ibm.com>
Date: Mon, 23 Nov 2026 08:25:47 +0530
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [virt/steal_governor] 1fb28c664a:
 WARNING:at_kernel/sched/core.c:#set_task_cpu
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Yury Norov <yury.norov@gmail.com>, Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <202611230353.1fedceba-lkp@intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <202611230353.1fedceba-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxMCBTYWx0ZWRfX0v3I1rnqiqPT
 LarYbEp5VfXMe+9g001tqkysy95On7woTE0Byy6R2DDoOwGCOSTDH0C0D9v8hknZgyPIMQ+gVrR
 JmyZUwR3mFy2oWztfNN/RcHscro6yFI=
X-Proofpoint-GUID: bD7wYORhpYACfIPFGE1PpanjkWif1fc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxMCBTYWx0ZWRfX9NXgGu5yiOgc
 TQV/LHUT1oBfLhkVz9t5A/glICSohW5RUA8mbwV7t4RzGPHP0txAA9fzKGoD5qBDA5a+JWK06x1
 Yo1ymvxCnwwfgXVnA6HoH3vPSrZkpCNMJvVDY6P2JpBcCXstwfZ6p6PE+ePE33/2utmuk8FbgAB
 SwpP8MEPHQuMxxtpORslFd5OgGt/tQ2pJpeou+Z/eXDS2uW4lfaZIFcNpw5U2Rw9A3DYvg7R/Ub
 FrlNizbg6wc4K0D0gCplBVJbzo/n9BZeuMj96MrBE4enPpmvbf44XLf3bKRjfxdtwahfrid+0AP
 +jzRzGlwgM2weQp6jA7PPbVYP9S11w8moTnMEKa3zWPDJcACdYMz5Q+oI9oL9DHm3VTcUBQ1yoy
 x/YGgWF1HUCsCGwihdqSh/cy7RLNxIarCvRDUSOtsQCyw9Dqft29uLetYJorwGJDVNnoqlJskdP
 fnmqY6p6NPvm2fv9uiQ==
X-Proofpoint-ORIG-GUID: HnhvroMrt56rqqaZH5zbMCxsznf6p5so
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b03ab39 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=NEAV23lmAAAA:8 a=fFnH5_pNhh8L5P8pgyUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230010

Hi.

On 11/23/26 8:17 AM, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/sched/core.c:#set_task_cpu" on:
> 
> commit: 1fb28c664a19df8d45a6afa04d28d102b04ea680 ("virt/steal_governor: Enable the driver") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 909ef7a9a30fa139e69e555e3606680f5cca7726]
> 
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429 with following parameters:
> 
> 	runtime: 300s
> 	group: group-00
> 	nr_groups: 5
> 
> 
> config: i386-randconfig-2105-20261109
> compiler: gcc-14
> test machine: qemu-system-i386 -enable-kvm -cpu Haswell-noTSX,enforce,lm=off -smp 4 -m 4G
> 
> Additional analysis by LLM: This commit only adds Kconfig/Makefile wiring for the STEAL_GOVERNOR driver. It contains no scheduler logic changes. Its effect is to flip on CONFIG_PREFERRED_CPU for the first time in the series, which activates a block of previously-dead code under #ifdef CONFIG_PREFERRED_CPU in core.c that had been unreachable until now. The commit to be blamed should be 74699f56ebcf — "sched/core: Push current task from non preferred CPU".
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611230353.1fedceba-lkp@intel.com
> 
> 
> [   61.829095][   T33] ------------[ cut here ]------------
> [   61.830984][   T33] is_migration_disabled(p)
> [   61.830988][   T33] WARNING: kernel/sched/core.c:3422 at set_task_cpu+0xb7/0x180, CPU#3: migration/3/33
> [   61.834561][   T33] Modules linked in:
> [   61.835867][   T33] CPU: 3 UID: 0 PID: 33 Comm: migration/3 Not tainted 7.3.0-rc1-00053-g1fb28c664a19 #1 PREEMPT(full)
> [   61.838952][   T33] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   61.852825][   T33] Stopper: sched_non_preferred_cpu_push_stop+0x0/0x120 <- sched_push_current_non_preferred_cpu (sched/core.c:11340)
> [   61.859715][   T33] EIP: set_task_cpu (sched/core.c:3422 (discriminator 2))
> [   61.861346][   T33] Code: 6c 08 00 00 83 c0 28 83 c0 10 e8 a4 a9 ff ff 85 c0 75 02 0f 0b 0f a3 35 5c 65 60 b4 72 02 0f 0b 66 83 bb 5c 02 00 00 00 74 02 <0f> 0b 3e 8d 74 26 00 eb 32 64 a1 14 50 7e b4 0f a3 05 5c 65 60 b4
> All code
> ========
>     0:	6c                   	insb   (%dx),%es:(%rdi)
>     1:	08 00                	or     %al,(%rax)
>     3:	00 83 c0 28 83 c0    	add    %al,-0x3f7cd740(%rbx)
>     9:	10 e8                	adc    %ch,%al
>     b:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
>     c:	a9 ff ff 85 c0       	test   $0xc085ffff,%eax
>    11:	75 02                	jne    0x15
>    13:	0f 0b                	ud2
>    15:	0f a3 35 5c 65 60 b4 	bt     %esi,-0x4b9f9aa4(%rip)        # 0xffffffffb4606578
>    1c:	72 02                	jb     0x20
>    1e:	0f 0b                	ud2
>    20:	66 83 bb 5c 02 00 00 	cmpw   $0x0,0x25c(%rbx)
>    27:	00
>    28:	74 02                	je     0x2c
>    2a:*	0f 0b                	ud2		<-- trapping instruction
>    2c:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
>    31:	eb 32                	jmp    0x65
>    33:	64 a1 14 50 7e b4 0f 	movabs %fs:0x5c05a30fb47e5014,%eax
>    3a:	a3 05 5c
>    3d:	65 60                	gs (bad)
>    3f:	b4                   	.byte 0xb4
> 
> Code starting with the faulting instruction ===========================================
>     0:	0f 0b                	ud2
>     2:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
>     7:	eb 32                	jmp    0x3b
>     9:	64 a1 14 50 7e b4 0f 	movabs %fs:0x5c05a30fb47e5014,%eax
>    10:	a3 05 5c
>    13:	65 60                	gs (bad)
>    15:	b4                   	.byte 0xb4
> [   61.870903][   T33] EAX: 00000002 EBX: f5381300 ECX: 00000000 EDX: 00000003
> [   61.873346][   T33] ESI: 00000003 EDI: b614bf00 EBP: b614bebc ESP: b614beac
> [   61.875803][   T33] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010002
> [   61.882493][   T33] CR0: 80050033 CR2: a6af0000 CR3: 45267000 CR4: 001506d0
> [   61.884849][   T33] Call Trace:
> [   61.889217][   T33]  move_queued_task (sched/core.c:2596)
> [   61.890818][   T33]  __migrate_task (sched/core.c:2644)
> [   61.892297][   T33]  sched_non_preferred_cpu_push_stop (sched/core.c:11292)
> [   61.897538][   T33]  ? tracer_preempt_off (trace/trace_irqsoff.c:692 (discriminator 1))
> [   61.899325][   T33]  ? trace_preempt_off (trace/trace_preemptirq.c:127)
> [   61.901048][   T33]  ? preempt_count_add (sched/core.c:6056)
> [   61.906016][   T33]  ? __balance_push_cpu_stop (sched/core.c:8397)
> [   61.907819][   T33]  ? preempt_latency_start (sched/core.c:6030 (discriminator 1) sched/core.c:6023 (discriminator 1))
> [   61.909635][   T33]  ? __balance_push_cpu_stop (sched/core.c:8397)
> [   61.911466][   T33]  cpu_stopper_thread (stop_machine.c:510)
> [   61.913093][   T33]  smpboot_thread_fn (smpboot.c:160)
> [   61.917838][   T33]  kthread (kthread.c:436)
> [   61.919260][   T33]  ? sort_range (??:?)
> [   61.920703][   T33]  ? kthread_affine_node (kthread.c:378)
> [   61.925663][   T33]  ret_from_fork (x86/kernel/process.c:158)
> [   61.927228][   T33]  ? kthread_affine_node (kthread.c:378)
> [   61.928980][   T33]  ret_from_fork_asm (x86/entry/entry_32.S:736)
> [   61.933831][   T33]  entry_INT80_32 (x86/entry/entry_32.S:940)
> [   61.935410][   T33] irq event stamp: 108
> [   61.936744][   T33] hardirqs last  enabled at (107): _raw_spin_unlock_irqrestore (linux/spinlock_api_smp.h:210 (discriminator 1) locking/spinlock.c:221 (discriminator 1))
> [   61.943224][   T33] hardirqs last disabled at (108): __schedule (sched/core.c:7225 (discriminator 1))
> [   61.946108][   T33] softirqs last  enabled at (0): copy_process (fork.c:2239 (discriminator 1))
> [   61.948970][   T33] softirqs last disabled at (0): 0x0
> [   61.955261][   T33] ---[ end trace 0000000000000000 ]---
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261123/202611230353.1fedceba-lkp@intel.com
> 
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 


Could you please try with below patch included?
Symptoms seems to be similar.

https://lore.kernel.org/all/179538776083.92412.4311246927428883759.tip-bot2@tip-bot2/

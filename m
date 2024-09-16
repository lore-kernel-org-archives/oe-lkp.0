Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83705149E09
	for <oe-lkp@lists.linux.dev>; Mon, 16 Sep 2024 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477445; cv=none; b=e+Eg3/RiIW25XCiYiEGdWysFprzCUewhtm6cDQn1N3ZOTDbC0nRBT7dGPRE7kQ4Ltu/fensKrlycZgkQAb5bIs5DM6oOMyi1nplZtUrdQW2Lpw+dWFlIcs/FRPW9egpCVyhZYh0BzeDD5n+jB6UqQOWjBsxUorujC7JkP6QEqL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477445; c=relaxed/simple;
	bh=ltXRzzqGHK2I1VWlxdaIO8AmrrRRPfezmnDEumjgQVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wejf02Qr/HnrbGh+Ns9b1Hqwr/s1uFlRmYNUXn1I21t7UavLU3jbUTLmH1eksF08JXGWKOftA2Emvo4Q/uOngBNaEN06wuQdrpy1PeNrs0vEUuYUIIiqt1anZXRl997mKqlGeLx3rMhbgbETDk1maAGLVVhy86MRXho4yOHCUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MLaTx563; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MLaTx563"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-710f0415ac8so2422553a34.1
        for <oe-lkp@lists.linux.dev>; Mon, 16 Sep 2024 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726477441; x=1727082241; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PneH6+4Gvl4GEC4ps7XkWbMJOS+6FGutybZJb2zKUIg=;
        b=MLaTx563A4SqpYWl/6AWeb9MJNLV0drFDYkypC58LKTSO/qAQ4Cp5ppnCfV4P6Y909
         aA9hf3ZUfdi44fklh0UsvH2R+RLWL/WsxNPNCPe2AC+cF/gUqBPNGewO89Pa3BcPPY+H
         jVfhlZTYTPt6lVA3rHZqIgDfgROsFF6uFWvXMj4ojnDbLyfukqBGHtdgrX1J7ZjNhHwu
         qwq65OlOkbSJCeRwKPb4TjUrhwFydrs39lR8gdj4mo1fhR1Cu4zCv9YVn+IWSMDrIFho
         yPU4hYSp2NjtVRSFo8YCTONgz2L2VL4Y1Ne6o2ove1k0RMtiPq70PIpUtd7j8PLvur9a
         3UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726477441; x=1727082241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PneH6+4Gvl4GEC4ps7XkWbMJOS+6FGutybZJb2zKUIg=;
        b=w8TBS/AS61pWRPZeLHeebp3CpZJWVNXv4iKTXBjy60YJslcIDa1IqglTLCUUN12orw
         OQ1o+2BNjNt8gYWBP9irfLh3Xx7wyTkBDzkqug89VP30Ku0eKIOm08FMZt+D8o17jV6W
         1sGSdfA12cfVwYLt1BulLM0X5To3brAR+0F2XiI+UCxC7aXcp9biz+SPZ4mAXdcr13FS
         qN6dfufyODwtgk1Yto/wV3tLr5ZAZxXgWSRy+ghxXMTTLaIx0aGzHzhYIwsWT9/wGNA9
         PSndkHF2u943a2j6ygOKnaAegnjIP20KOjzcI9wuI1v8Cl4/1sN3v6k5Ex7ZzU1Iv/k/
         WbKQ==
X-Gm-Message-State: AOJu0YyLM16x2KqjrVE3rn8zusSBQWaOjmMDUwjvUABkwqwfPvmHJYZs
	vMU89cKERUsJjZK9Lwc0rjYR6CRKCCg/g+eTM0tjcuEe7PWxX0HvVjewvY22sI0=
X-Google-Smtp-Source: AGHT+IFZLTegXbtHkqRNzKqCTdCuTKA3tJ+/cTgHei+KxQloixW9J5CIeO8OApFUY6dHCXgwt3Kcxg==
X-Received: by 2002:a05:6830:2713:b0:710:a7e7:f206 with SMTP id 46e09a7af769-7110946ec33mr8783534a34.11.1726477441039;
        Mon, 16 Sep 2024 02:04:01 -0700 (PDT)
Received: from ?IPV6:2600:380:6345:6937:6815:e2a7:e82c:fd22? ([2600:380:6345:6937:6815:e2a7:e82c:fd22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71239e9f1d3sm1036500a34.24.2024.09.16.02.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 02:04:00 -0700 (PDT)
Message-ID: <59e44de9-8194-4817-b910-0de89fea1452@kernel.dk>
Date: Mon, 16 Sep 2024 03:03:57 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.12/io_uring] [io_uring/sqpoll] f011c9cf04:
 BUG:KASAN:slab-out-of-bounds_in_io_sq_offload_create
To: kerne test robot <oliver.sang@intel.com>,
 Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, io-uring@vger.kernel.org
References: <202409161632.cbeeca0d-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202409161632.cbeeca0d-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/24 2:35 AM, kerne test robot wrote:
> [ 155.627997][ T6168] BUG: KASAN: slab-out-of-bounds in io_sq_offload_create (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:562 io_uring/sqpoll.c:469) 
> [  155.628787][ T6168] Read of size 8 at addr ffff888138ecf948 by task trinity-c3/6168
> [  155.629542][ T6168]
> [  155.629806][ T6168] CPU: 1 UID: 4294967291 PID: 6168 Comm: trinity-c3 Not tainted 6.11.0-rc5-00027-gf011c9cf04c0 #1 074b2dc9794d1910767b5e24d1a9cb7061a66647
> [  155.631255][ T6168] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  155.632276][ T6168] Call Trace:
> [  155.632627][ T6168]  <TASK>
> [ 155.632952][ T6168] dump_stack_lvl (lib/dump_stack.c:122) 
> [ 155.633418][ T6168] print_address_description+0x51/0x3a0 
> [ 155.634147][ T6168] ? io_sq_offload_create (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:562 io_uring/sqpoll.c:469) 
> [ 155.634671][ T6168] print_report (mm/kasan/report.c:489) 
> [ 155.635119][ T6168] ? lock_acquired (include/trace/events/lock.h:85 kernel/locking/lockdep.c:6039) 
> [ 155.635596][ T6168] ? kasan_addr_to_slab (include/linux/mm.h:1283 mm/kasan/../slab.h:206 mm/kasan/common.c:38) 
> [ 155.636243][ T6168] ? io_sq_offload_create (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:562 io_uring/sqpoll.c:469) 
> [ 155.636890][ T6168] kasan_report (mm/kasan/report.c:603) 
> [ 155.637320][ T6168] ? io_sq_offload_create (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:562 io_uring/sqpoll.c:469) 
> [ 155.637873][ T6168] kasan_check_range (mm/kasan/generic.c:183 mm/kasan/generic.c:189) 
> [ 155.638384][ T6168] io_sq_offload_create (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:562 io_uring/sqpoll.c:469) 
> [ 155.638921][ T6168] ? __pfx_io_sq_offload_create (io_uring/sqpoll.c:413) 
> [ 155.639501][ T6168] ? __lock_acquire (kernel/locking/lockdep.c:5142) 
> [ 155.640040][ T6168] ? io_pages_map (include/linux/gfp.h:269 include/linux/gfp.h:296 include/linux/gfp.h:313 io_uring/memmap.c:28 io_uring/memmap.c:72) 
> [ 155.640495][ T6168] ? io_allocate_scq_urings (io_uring/io_uring.c:3441) 
> [ 155.641079][ T6168] io_uring_create (io_uring/io_uring.c:3606) 
> [ 155.641591][ T6168] io_uring_setup (io_uring/io_uring.c:3715) 
> [ 155.642185][ T6168] ? __pfx_io_uring_setup (io_uring/io_uring.c:3693) 
> [ 155.642698][ T6168] ? do_int80_emulation (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/entry/common.c:251) 
> [ 155.643206][ T6168] do_int80_emulation (arch/x86/entry/common.c:165 arch/x86/entry/common.c:253) 
> [ 155.643675][ T6168] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 

The fix for the cpusets dropped checking if the value was sane to begin
with... I've fixed it up with the patch below.

commit 827e3ea024a4facf1d6c8969ae95de939890039e
Author: Jens Axboe <axboe@kernel.dk>
Date:   Mon Sep 16 02:58:06 2024 -0600

    io_uring/sqpoll: retain test for whether the CPU is valid
    
    A recent commit ensured that SQPOLL cannot be setup with a CPU that
    isn't in the current tasks cpuset, but it also dropped testing whether
    the CPU is valid in the first place. Without that, if a task passes in
    a CPU value that is too high, the following KASAN splat can get
    triggered:
    
    BUG: KASAN: stack-out-of-bounds in io_sq_offload_create+0x858/0xaa4
    Read of size 8 at addr ffff800089bc7b90 by task wq-aff.t/1391
    
    CPU: 4 UID: 1000 PID: 1391 Comm: wq-aff.t Not tainted 6.11.0-rc7-00227-g371c468f4db6 #7080
    Hardware name: linux,dummy-virt (DT)
    Call trace:
     dump_backtrace.part.0+0xcc/0xe0
     show_stack+0x14/0x1c
     dump_stack_lvl+0x58/0x74
     print_report+0x16c/0x4c8
     kasan_report+0x9c/0xe4
     __asan_report_load8_noabort+0x1c/0x24
     io_sq_offload_create+0x858/0xaa4
     io_uring_setup+0x1394/0x17c4
     __arm64_sys_io_uring_setup+0x6c/0x180
     invoke_syscall+0x6c/0x260
     el0_svc_common.constprop.0+0x158/0x224
     do_el0_svc+0x3c/0x5c
     el0_svc+0x34/0x70
     el0t_64_sync_handler+0x118/0x124
     el0t_64_sync+0x168/0x16c
    
    The buggy address belongs to stack of task wq-aff.t/1391
     and is located at offset 48 in frame:
     io_sq_offload_create+0x0/0xaa4
    
    This frame has 1 object:
     [32, 40) 'allowed_mask'
    
    The buggy address belongs to the virtual mapping at
     [ffff800089bc0000, ffff800089bc9000) created by:
     kernel_clone+0x124/0x7e0
    
    The buggy address belongs to the physical page:
    page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff0000d740af80 pfn:0x11740a
    memcg:ffff0000c2706f02
    flags: 0xbffe00000000000(node=0|zone=2|lastcpupid=0x1fff)
    raw: 0bffe00000000000 0000000000000000 dead000000000122 0000000000000000
    raw: ffff0000d740af80 0000000000000000 00000001ffffffff ffff0000c2706f02
    page dumped because: kasan: bad access detected
    
    Memory state around the buggy address:
     ffff800089bc7a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     ffff800089bc7b00: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
    >ffff800089bc7b80: 00 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
                             ^
     ffff800089bc7c00: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
     ffff800089bc7c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f3
    
    Reported-by: kernel test robot <oliver.sang@intel.com>
    Closes: https://lore.kernel.org/oe-lkp/202409161632.cbeeca0d-lkp@intel.com
    Fixes: f011c9cf04c0 ("io_uring/sqpoll: do not allow pinning outside of cpuset")
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index 272df9d00f45..7adfcf6818ff 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -465,6 +465,8 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
 			int cpu = p->sq_thread_cpu;
 
 			ret = -EINVAL;
+			if (cpu >= nr_cpu_ids || !cpu_online(cpu))
+				goto err_sqpoll;
 			cpuset_cpus_allowed(current, &allowed_mask);
 			if (!cpumask_test_cpu(cpu, &allowed_mask))
 				goto err_sqpoll;

-- 
Jens Axboe

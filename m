Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CFE17EF
	for <oe-lkp@lists.linux.dev>; Wed, 11 Jan 2023 09:44:12 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y5so10980010pfe.2
        for <oe-lkp@lists.linux.dev>; Wed, 11 Jan 2023 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vL0wvIF2RqhmSNfyYokdjrls3ezSq7et5Rg7ifpCeJ8=;
        b=qwFg0DxgLKLDVLEwDYfmm0kiiz2eYQDNtmXbVupZ+VvYu2tCBUnOzKwd+rmS6ZMvGG
         iDHUc5hZBF/fTFzQ/cYH8jdqs+TimStkoLTlpuzBPpITw0juYDix2PREiRYjPzfPy+4O
         o19zG34ietQD5LzuHcB4MUUDHOhxZXPqbzG2odFSzUhCGXBrynuGBzXciFwr6bBvRpNW
         71m2pgDO80zxDCIdQdxdHmQb/qBPiJuhfxY1goAlD7MXDlTrSN6fIuIV0kwtatL8vFnN
         36IHGfaUDzNYY6Zs68myHRG+3nvi0mvg3MehfVtt9y6OpRefgWunPTFvVPvhixUkRIby
         JLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL0wvIF2RqhmSNfyYokdjrls3ezSq7et5Rg7ifpCeJ8=;
        b=dLgryToznO/zFBI8zOWnGx+eY49tiNZ6jiLpLcPiidoenk4QlkfKz4s72ep1tO+3Bx
         E34ZGUmoJTi1isMIsjagqdWRRR9lcQvThOXf2uNhZLH5JcE8PcCjTfAJJSXIFktNvykY
         Q7ubd6r7RP555u4XNUsd5VU/JF7ove2oXaA/VGFlN9SrlB1pwQf68YD9hsEp75C2GauO
         S7c19IdUuDaIUPVAvntZ5I1g8hzU4kt5BSyFYjD6fL0J0r/zSqtuxvYvtb5NWu/JkdMI
         LsGzTt3EeJmSuzXZ7LOpvlsfFZSbvJOmYKmW6QIZ4z9zBEf+tdL7mPpkr+Wu1ao5unlS
         aa2A==
X-Gm-Message-State: AFqh2koKeeGpyQQBHuerdO2KOA3DQpLZYFz/zZo6gMrJ+n+TbNXL2UAO
	2MuOu1KJ2+ADcdy30c7pC1M=
X-Google-Smtp-Source: AMrXdXtiF3aD39sMHqdVVfJz89IV5IgRWbG1Hz4FccFuOxItSosS9Ad4uDHKhJDeUL74WlHk4HmG1g==
X-Received: by 2002:aa7:9703:0:b0:589:d850:7ea5 with SMTP id a3-20020aa79703000000b00589d8507ea5mr6986750pfg.6.1673430251727;
        Wed, 11 Jan 2023 01:44:11 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id z5-20020aa79905000000b00574ee8cfdabsm9864379pff.148.2023.01.11.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:44:09 -0800 (PST)
Date: Wed, 11 Jan 2023 09:44:05 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Mike Rapoport <rppt@linux.ibm.com>,
	Christoph Lameter <cl@linux.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: BUG: unable to handle page fault for address: f6ffe000
Message-ID: <Y76E5WPTP86nUezT@localhost>
References: <202212312021.bc1efe86-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212312021.bc1efe86-oliver.sang@intel.com>

On Sat, Dec 31, 2022 at 11:26:25PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed kernel_BUG_at_include/linux/mm.h due to commit (built with gcc-11):
> 
> commit: 0af8489b0216fa1dd83e264bef8063f2632633d7 ("mm, slub: remove percpu slabs with CONFIG_SLUB_TINY")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master c76083fac3bae1a87ae3d005b5cb1cbc761e31d5]
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: default
> 	torture_type: tasks-tracing
> 
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> 
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202212312021.bc1efe86-oliver.sang@intel.com
> 
> 
> [   25.804432][  T214] ------------[ cut here ]------------
> [   25.804917][  T214] kernel BUG at include/linux/mm.h:825!
> [   25.805402][  T214] invalid opcode: 0000 [#1] SMP
> [   25.805820][  T214] CPU: 0 PID: 214 Comm: udevadm Tainted: G S                 6.1.0-rc2-00014-g0af8489b0216 #2 1c4d7707ec0ce574ed62a77e82a8580202758048
> [ 25.806944][ T214] EIP: __dump_page.cold (include/linux/mm.h:825 mm/debug.c:97) 
> [ 25.807376][ T214] Code: ff ff 83 05 e8 5d bb c5 01 ba 4c c4 2f c4 89 f8 83 15 ec 5d bb c5 00 e8 f2 92 ed fd 83 05 f8 5d bb c5 01 83 15 fc 5d bb c5 00 <0f> 0b 83 05 00 5e bb c5 01 b8 ac 85 a3 c4 83 15 04 5e bb c5 00 e8


FYI, I found a panic from trying to read non-present page,
on the same commit.

I'm not sure if this BUG is related to what we're looking at.

[   26.970492][  T180] systemd-journald[180]: Received request to flush runtime journal from PID 1
[   28.117157][  T187] BUG: unable to handle page fault for address: f6ffe000
[   28.117686][  T187] #PF: supervisor read access in kernel mode
[   28.117686][  T187] #PF: error_code(0x0000) - not-present page
[   28.117686][  T187] *pde = 065b9067 *pte = 00000000 
[   28.117686][  T187] Oops: 0000 [#1] SMP
[   28.117686][  T187] CPU: 0 PID: 187 Comm: udevadm Tainted: G S                 6.1.0-rc2-00014-g0af8489b0216 #13 6ab653106aca2d29fecfea6da29eac9984fd4186
[   28.117686][  T187] EIP: kernfs_name_hash+0x60/0xe0
[   28.117686][  T187] Code: c6 01 83 d7 00 31 d2 01 c6 89 c8 89 75 ec 11 d7 8b 35 f0 9e c1 c5 89 7d f0 8b 3d f4 9e c1 c5 29 f0 8d b4 26 00 00 00 00 66 90 <0f> be 0c 30 89 ca c1 e2 04 c1 e9 04 01 d1 01 cb 8b 4d f0 83 c6 01
[   28.117686][  T187] EAX: f0eadd57 EBX: ec9ced85 ECX: 05c29e82 EDX: 05c29e82
[   28.117686][  T187] ESI: 061502a9 EDI: 00000000 EBP: f5fe1c88 ESP: f5fe1c70
[   28.117686][  T187] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010206
[   28.117686][  T187] CR0: 80050033 CR2: f6ffe000 CR3: 35f29000 CR4: 000406d0
[   28.117686][  T187] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   28.117686][  T187] DR6: fffe0ff0 DR7: 00000400
[   28.117686][  T187] Call Trace:
[   28.117686][  T187]  kernfs_find_ns+0xb3/0x200
[   28.117686][  T187]  ? kernfs_iop_lookup+0x3c/0x1a0
[   28.117686][  T187]  kernfs_iop_lookup+0x76/0x1a0
[   28.117686][  T187]  lookup_open+0x308/0x970
[   28.117686][  T187]  open_last_lookups+0xa4/0x680
[   28.117686][  T187]  path_openat+0xa9/0x410
[   28.117686][  T187]  do_filp_open+0x99/0x180
[   28.117686][  T187]  ? lock_release+0xe8/0x350
[   28.117686][  T187]  ? _raw_spin_unlock+0x50/0x90
[   28.117686][  T187]  ? alloc_fd+0x252/0x3e0
[   28.117686][  T187]  do_sys_openat2+0xf3/0x2e0
[   28.117686][  T187]  ? find_held_lock+0x37/0x110
[   28.117686][  T187]  do_sys_open+0x8e/0xe0
[   28.117686][  T187]  __ia32_sys_open+0x2a/0x40
[   28.117686][  T187]  __do_fast_syscall_32+0x72/0xd0
[   28.117686][  T187]  ? lockdep_hardirqs_on_prepare+0x232/0x3f0
[   28.117686][  T187]  ? syscall_exit_to_user_mode+0x35/0x50
[   28.117686][  T187]  ? __do_fast_syscall_32+0x7c/0xd0
[   28.117686][  T187]  ? lockdep_hardirqs_on_prepare+0x232/0x3f0
[   28.117686][  T187]  ? irqentry_exit_to_user_mode+0x23/0x30
[   28.117686][  T187]  ? irqentry_exit+0x7d/0xc0
[   28.117686][  T187]  do_fast_syscall_32+0x32/0x70
[   28.117686][  T187]  do_SYSENTER_32+0x15/0x20
[   28.117686][  T187]  entry_SYSENTER_32+0xa2/0xfb
[   28.117686][  T187] EIP: 0xb7f26549
[   28.117686][  T187] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
[   28.117686][  T187] EAX: ffffffda EBX: bf83a680 ECX: 00088000 EDX: 000001b6
[   28.117686][  T187] ESI: 00ab30b0 EDI: 00000008 EBP: b7e31000 ESP: bf83a4c8
[   28.117686][  T187] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
[   28.117686][  T187] Modules linked in:
[   28.117686][  T187] CR2: 00000000f6ffe000
[   28.117686][  T187] ---[ end trace 0000000000000000 ]---
[   28.117686][  T187] EIP: kernfs_name_hash+0x60/0xe0
[   28.117686][  T187] Code: c6 01 83 d7 00 31 d2 01 c6 89 c8 89 75 ec 11 d7 8b 35 f0 9e c1 c5 89 7d f0 8b 3d f4 9e c1 c5 29 f0 8d b4 26 00 00 00 00 66 90 <0f> be 0c 30 89 ca c1 e2 04 c1 e9 04 01 d1 01 cb 8b 4d f0 83 c6 01

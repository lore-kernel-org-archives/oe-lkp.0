Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD942C0269
	for <oe-lkp@lists.linux.dev>; Thu,  6 Nov 2025 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762465645; cv=none; b=IWn2PwP125nJK7bJ9CAYiV8XrsUrsixLtckvjHdkDKNN3zhaSw9WD+azJCKLwK0Wo3KrrDnGs12NNz14t/iGM4Plj8Nu6zdHUMw96iN9frSKzPpa8CaixvxVg5ik2TvoU3eCxk2DKK+SPTZoU4NWFliLTm5r00wndXAnHhLXa8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762465645; c=relaxed/simple;
	bh=O/8OX5iyk86NdEcEAcOFKW5pSA3loMKbLqzOvsujzHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=no+m69wQLHoO0VrovXFNoqHDPOVgd89nuYIk8ReOadoR2wgKOL7d5kqSuHv/pKrh7McKZ5YZRpSY7FGOxwV0mRYG/8sHq7qjjNCFDujCZYHPdfDCa+WKsuJt2DIks0+dlF/MyfLCbBBZOWtELllGQwFxbnYIDzPpX0EA3DpLFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gGWJdGM+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gGWJdGM+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so175469a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 06 Nov 2025 13:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762465642; x=1763070442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02h/jaqXtQazuotbYZfe9QZHtoBjCSks7eXHqs3Jx1s=;
        b=gGWJdGM+M9TvoUiAsOw33s5UdPX/3hOp4pU5xJLz+eCsW5HVCc8yRQcALlW9YZsJd9
         /gLp75mcuNz4hf0leLnmY4xQ5wFjCA1YK3QDp9Gu8AwL7GAlr0/5JVwsm5MDt9nA3bV7
         gFXMkO/ALXazyTUw7cbo6H11vXNSZIlCvCxQpiusbkBXx1X11tbuTle/cuFVJeYHJbko
         DFJ+42nHDXXCQUmpaFA5KoL/5SbVvECq34g1RhMxST5P1KOpSZb6z3ErkRdwgGN0CnoB
         O1TXbOlJ/UNXXlKN3LxL+C1e5lz+OvZctLpQXyZuOpLAkh1e2fPylBvNmgBEb82qqaO2
         /yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762465642; x=1763070442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02h/jaqXtQazuotbYZfe9QZHtoBjCSks7eXHqs3Jx1s=;
        b=Jy9H2vrCKYylKUiGyrfSPYC/OFS6Kzrct1wOdiEDANO/NM0JFFgcPZz4GtmWd5vifD
         OF6TZju0NgWtVVcdJlzxE50uf1Ns8lV5NjTvfAL3OM4R4Fk1RDySHiFZeY+3NwpgXPrf
         uPTLILiH2n0JzCBBSWW/wZOfkOfQdiEx7PDMoaM2srIVPHnRFepiJocvJ48kUc00qmKD
         qN5SqFOsjkPTJE0eOytb0tdJolO6XN0luf9Zc/8DrKwniWNfkte3nDLtRPL3dThxiHbU
         8JrtjhPa39p/MhoQn1fDBxgAak+1te43fA/gF0WRy10cakoR9aywgUgG5Q7jpjmXYcrc
         ZDRA==
X-Gm-Message-State: AOJu0Yy2+WLGbiBZxYZ4m9L/YmWP5rFT8R6+hjpvD/G371lQ3fucqC5X
	FLUeahBGb4DznBO0vi19l3d9NbH9M/z0FX6yPhL7i7/yFLl6Z8V63mfYYnWmpv4RZTdZPGlbhi3
	4zKGMsa1uIhwgBakgf2vl+X6xf/UvE+kTDfZd6ixOqA==
X-Gm-Gg: ASbGncsw4WiOZO96OM+JJ8SED5x4x7YtcO01p2GkdhO9Na46PEmP3FcnxT5wnwzGAdS
	f1YVBvJHFRKlRsCPsNTnK+thClI9BZKWVLoYYbO0qZM2Z9+/egRITfNHY9gIdrnvzbpcP2hTTBp
	+J4jtngjdpjbCxsQ1sF4jJoI9zSFaBcgn/xy2nYqa43nrRdSMrHctkrZXrdj2LP7cyLouZ6Gx/W
	Xs5TdUMLo1Fip4gTj/eINA9sug3k3zb/KWHCWyisTZ71mVLbadoCKJz6g==
X-Google-Smtp-Source: AGHT+IFo46Xrzcbvk8PkRzKo85psUmSlmxVy8tIXuLMksSdo/WqEtnPunt8wGd/144Hc9ZR86pLwPbihvr+oz1VEGqc=
X-Received: by 2002:a05:6402:2750:b0:640:f481:984 with SMTP id
 4fb4d7f45d1cf-6413eeba6bcmr884727a12.2.1762465641705; Thu, 06 Nov 2025
 13:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101142325.1326536-3-pasha.tatashin@soleen.com> <202511061629.e242724-lkp@intel.com>
In-Reply-To: <202511061629.e242724-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 6 Nov 2025 16:46:45 -0500
X-Gm-Features: AWmQ_bnBcUoQ6kz2qfTxUp33sTBb3pkUDTuWqmu-lkbGpJ38ocasUPeJWD7QEi8
Message-ID: <CA+CK2bCUWuK4fmuz5Us_mS1ByGy5SjaedVEquj1WxN8JUPsJaw@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] kho: drop notifiers
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kexec@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	brauner@kernel.org, corbet@lwn.net, graf@amazon.com, jgg@ziepe.ca, 
	linux-kselftest@vger.kernel.org, masahiroy@kernel.org, ojeda@kernel.org, 
	pratyush@kernel.org, rdunlap@infradead.org, rppt@kernel.org, tj@kernel.org, 
	yanjun.zhu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The bug is in lib/test_kho.c, when KHO is not enabled, it should not
run KHO commands, there is a function to test that: kho_is_enabled().
So, KHO is disabled and kho_add_subtree() which calles add debugfs
entry, and the list is not initialized, because KHO is disabled. The
fix is:

diff --git a/lib/test_kho.c b/lib/test_kho.c
index 025ea251a186..85b60d87a50a 100644
--- a/lib/test_kho.c
+++ b/lib/test_kho.c
@@ -315,6 +315,9 @@ static int __init kho_test_init(void)
        phys_addr_t fdt_phys;
        int err;

+       if (!kho_is_enabled())
+               return 0;
+
        err =3D kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys);
        if (!err)
                return kho_test_restore(fdt_phys);

On Thu, Nov 6, 2025 at 3:41=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_kernel/kexec_handover.c:#kho_add_su=
btree" on:
>
> commit: e44a700c561d1e892a8d0829d557e221604a7b93 ("[PATCH v9 2/9] kho: dr=
op notifiers")
> url: https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/kho-ma=
ke-debugfs-interface-optional/20251101-222610
> patch link: https://lore.kernel.org/all/20251101142325.1326536-3-pasha.ta=
tashin@soleen.com/
> patch subject: [PATCH v9 2/9] kho: drop notifiers
>
> in testcase: boot
>
> config: x86_64-randconfig-001-20251015
> compiler: gcc-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +--------------------------------------------------------+------------+--=
----------+
> |                                                        | 93e4b3b2e9 | e=
44a700c56 |
> +--------------------------------------------------------+------------+--=
----------+
> | WARNING:at_kernel/kexec_handover.c:#kho_add_subtree    | 0          | 8=
          |
> | RIP:kho_add_subtree                                    | 0          | 8=
          |
> +--------------------------------------------------------+------------+--=
----------+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202511061629.e242724-lkp@intel.c=
om
>
>
> [   13.620111][    T1] ------------[ cut here ]------------
> [   13.620739][    T1] WARNING: CPU: 1 PID: 1 at kernel/kexec_handover.c:=
704 kho_add_subtree (kernel/kexec_handover.c:704)
> [   13.621665][    T1] Modules linked in:
> [   13.622090][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6=
.18.0-rc3-00211-ge44a700c561d #1 VOLUNTARY
> [   13.623073][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   13.624054][    T1] RIP: 0010:kho_add_subtree (kernel/kexec_handover.c=
:704)
> [   13.624596][    T1] Code: c7 38 b4 ac 85 31 ed e8 01 1c 00 00 48 c7 c7=
 70 5a ca 86 85 c0 89 c3 40 0f 95 c5 31 c9 31 d2 89 ee e8 37 b5 0a 00 85 db=
 74 02 <0f> 0b b9 01 00 00 00 31 d2 89 ee 48 c7 c7 40 5a ca 86 e8 1c b5 0a
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   c7 38 b4 ac 85          xbegin 0xffffffff85acb43d,(bad)
>    5:   31 ed                   xor    %ebp,%ebp
>    7:   e8 01 1c 00 00          call   0x1c0d
>    c:   48 c7 c7 70 5a ca 86    mov    $0xffffffff86ca5a70,%rdi
>   13:   85 c0                   test   %eax,%eax
>   15:   89 c3                   mov    %eax,%ebx
>   17:   40 0f 95 c5             setne  %bpl
>   1b:   31 c9                   xor    %ecx,%ecx
>   1d:   31 d2                   xor    %edx,%edx
>   1f:   89 ee                   mov    %ebp,%esi
>   21:   e8 37 b5 0a 00          call   0xab55d
>   26:   85 db                   test   %ebx,%ebx
>   28:   74 02                   je     0x2c
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   b9 01 00 00 00          mov    $0x1,%ecx
>   31:   31 d2                   xor    %edx,%edx
>   33:   89 ee                   mov    %ebp,%esi
>   35:   48 c7 c7 40 5a ca 86    mov    $0xffffffff86ca5a40,%rdi
>   3c:   e8                      .byte 0xe8
>   3d:   1c b5                   sbb    $0xb5,%al
>   3f:   0a                      .byte 0xa
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   b9 01 00 00 00          mov    $0x1,%ecx
>    7:   31 d2                   xor    %edx,%edx
>    9:   89 ee                   mov    %ebp,%esi
>    b:   48 c7 c7 40 5a ca 86    mov    $0xffffffff86ca5a40,%rdi
>   12:   e8                      .byte 0xe8
>   13:   1c b5                   sbb    $0xb5,%al
>   15:   0a                      .byte 0xa
> [   13.626370][    T1] RSP: 0018:ffffc9000001fca0 EFLAGS: 00010286
> [   13.626951][    T1] RAX: dffffc0000000000 RBX: 00000000ffffffff RCX: 0=
000000000000000
> [   13.627737][    T1] RDX: 1ffffffff0d94b52 RSI: 0000000000000001 RDI: f=
fffffff86ca5a90
> [   13.628523][    T1] RBP: 0000000000000001 R08: 0000000000000008 R09: f=
ffffbfff0dfac4c
> [   13.629330][    T1] R10: 0000000000000000 R11: ffffffff86fd6267 R12: f=
fff888133ee2000
> [   13.630101][    T1] R13: ffffffff85acb340 R14: ffff888117a5f988 R15: d=
ffffc0000000000
> [   13.630869][    T1] FS:  0000000000000000(0000) GS:ffff888426ea0000(00=
00) knlGS:0000000000000000
> [   13.631727][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   13.632370][    T1] CR2: 00007f586df260ac CR3: 00000000054ea000 CR4: 0=
0000000000406f0
> [   13.633154][    T1] Call Trace:
> [   13.633506][    T1]  <TASK>
> [   13.633833][    T1]  kho_test_prepare_fdt+0x145/0x180
> [   13.634446][    T1]  ? kho_test_save_data+0x210/0x210
> [   13.635097][    T1]  ? csum_partial (lib/checksum.c:123)
> [   13.635546][    T1]  kho_test_init (lib/test_kho.c:177 lib/test_kho.c:=
284)
> [   13.636018][    T1]  ? vmalloc_test_init (lib/test_kho.c:271)
> [   13.636508][    T1]  ? add_device_randomness (drivers/char/random.c:94=
4)
> [   13.637485][    T1]  ? mix_pool_bytes (drivers/char/random.c:944)
> [   13.637955][    T1]  ? trace_initcall_start (include/trace/events/init=
call.h:27 (discriminator 3))
> [   13.638498][    T1]  ? vmalloc_test_init (lib/test_kho.c:271)
> [   13.638989][    T1]  do_one_initcall (init/main.c:1284)
> [   13.639477][    T1]  ? trace_initcall_start (init/main.c:1274)
> [   13.639998][    T1]  ? parse_one (kernel/params.c:143)
> [   13.640455][    T1]  ? kasan_save_track (mm/kasan/common.c:69 (discrim=
inator 1) mm/kasan/common.c:78 (discriminator 1))
> [   13.640948][    T1]  ? __kmalloc_noprof (mm/slub.c:5659)
> [   13.641465][    T1]  do_initcalls (init/main.c:1344 (discriminator 3) =
init/main.c:1361 (discriminator 3))
> [   13.641924][    T1]  kernel_init_freeable (init/main.c:1595)
> [   13.642441][    T1]  ? rest_init (init/main.c:1475)
> [   13.642891][    T1]  kernel_init (init/main.c:1485)
> [   13.643345][    T1]  ? rest_init (init/main.c:1475)
> [   13.643788][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
> [   13.644256][    T1]  ? rest_init (init/main.c:1475)
> [   13.644703][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> [   13.645213][    T1]  </TASK>
> [   13.645540][    T1] irq event stamp: 132025
> [   13.645971][    T1] hardirqs last  enabled at (132035): __up_console_s=
em (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 =
arch/x86/include/asm/irqflags.h:151 kernel/printk/printk.c:345)
> [   13.646887][    T1] hardirqs last disabled at (132046): __up_console_s=
em (kernel/printk/printk.c:343 (discriminator 3))
> [   13.648253][    T1] softirqs last  enabled at (131286): handle_softirq=
s (kernel/softirq.c:469 (discriminator 1) kernel/softirq.c:650 (discriminat=
or 1))
> [   13.649690][    T1] softirqs last disabled at (131281): __irq_exit_rcu=
 (kernel/softirq.c:496 kernel/softirq.c:723)
> [   13.651128][    T1] ---[ end trace 0000000000000000 ]---
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251106/202511061629.e242724-lkp=
@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

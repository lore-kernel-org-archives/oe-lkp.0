Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47631B122
	for <oe-lkp@lists.linux.dev>; Thu,  6 Nov 2025 22:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762467310; cv=none; b=q+/TIY6H8KzXJFBC5YIv0g351zTso3HL/pwffL4sYvuHoAbjbZavqjiz3li8oB2ms7lSdBWT1KJ5vDH104s5q6uuUa5rAyGeuH4KM4IzV1MwPpMKUtQLIoNknqQWGAgP3Wa2kzggyeCGOEX29ic/XisN02Rj7WZBHoojw3QfE+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762467310; c=relaxed/simple;
	bh=HUyJsMoU7vKGcC46di7f4HcprOlRD7DP810v6feRbK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8f929nZ6duIJQ4W99JiRmDzzmgXOMnyixciM7QVbYTACvK9/5bbKX8nSYNaxnHrG9mhA8hNgPcmD+577KfRuPDOty/r1twGrnY7muTd+d/F+G8oeaxemt90m4axyWRSchq0D3QtuTJWnIXf4JrSXqGklD3gCjlJ+//47GmDNOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cRwa8xxL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cRwa8xxL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-641018845beso183368a12.3
        for <oe-lkp@lists.linux.dev>; Thu, 06 Nov 2025 14:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762467305; x=1763072105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f81U5/79UyOAGW6VXn6pxFacbUSlx5ZrI8Z3RpSpADo=;
        b=cRwa8xxL3Rb2iu/rJki/e7s5AFfXgy3QjiaX0mC9Rbpt5Edy1viUYvy3f8a4UF/DWt
         +qI9OtHGD0zmw3f68LypMkGcwefSggD9IkY/F6U0iPpB93aTMU2KiMGpmaGy4V6mNPNz
         vuFMfTnyVIhFIyn2eKpvEiWJ1EVNyD03qa5lNI1AriFv4GUWUEMaG4c1cWD39uauYNzz
         tC1h1kLeXhE5rDDYM2N7qXBSihRmoofg/cQR7NXFV06DOXm52AYFbxEKO+aEXHmyCb5c
         kUpvjYA/ocIxhZkbVBDBrQOzyi8d/QCIyLb7HMbw174yCMP9IOF0Fke8wyJfXdGdb3gQ
         j7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762467305; x=1763072105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f81U5/79UyOAGW6VXn6pxFacbUSlx5ZrI8Z3RpSpADo=;
        b=mKLly3tp/boJmqXLuHg5d3PikqRfH8JOVynoXje/vpxrHDBotDHsmaHcYvbvHDvkJo
         yIMPpxANMPT0IsuETNLm8Bfilz0lAmPLnppVD9XGwrUmNT3JqYbJMhc8RnRSgkZFurpZ
         JV2n8gu8vcryFdurhyR1vq4vyva/vDKXAT/NPp0g00rSyOg4HuAWIuhgzmrQFJnKI8ev
         XojE5VUIMjmquLrkoiMf/zS/OX7P2irE7KDZTm4PPceht2/yUcLweKPuEsw9K2ScI9JR
         lvPYwBH39It86rWF1X47lGY3jubJU2CFpRHq/fTd7g9uTtbEx/O11aXSyOsF7MZ+wDdK
         es6A==
X-Gm-Message-State: AOJu0YyVV8OhlaCmXzapRXAiE9/bEjtBrMYOp/XA9f+1BFj4MSmLGNTm
	wUKbTuRy/sLQ9omSsgib9vNJMaS13zVyw02aVBHTXFRtqAfQ5RsV6NGnqLdkTZ91YvRDX+5v3FP
	SmXRimoODh/+Hm/7NMC/SVEqoQn8jEOCIe2yOnEMLzg==
X-Gm-Gg: ASbGncvTD1HGRc3k/rpeH/LzHl7AJ6mKUpLAQDx19ikThP42SetSTUKtT6HvdERPC17
	hzzLu4+8TeQ77u59qQxE/piG70fqG3JPdWsa2hboqvH3UMhHz9C9fVdF7epq0lQqJMffMP1U0N3
	7XnO4kQiSmG6waCgBCkGbCrV9lVGrr3IWZ4yvdL+eJKuHn8vW45ex/2pxl5ouXehiGR0DeQX+j9
	Fpb4SQvlEwWiS1d/wKnC88qlLrUS1NZc/SlJh7lQ2gjPMSDcEsRuD67556ZwFndpy8J
X-Google-Smtp-Source: AGHT+IFMNxw/R1yQ2ypKv/nek+CS+Dt0g6lco0tSe4JF0aLBw9GdvNDeY3wOMxlums/5C8vWYWYunbR1HZth+5+nSYU=
X-Received: by 2002:a05:6402:3590:b0:638:74dc:cf78 with SMTP id
 4fb4d7f45d1cf-6413f08ef69mr1005608a12.34.1762467305387; Thu, 06 Nov 2025
 14:15:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101142325.1326536-3-pasha.tatashin@soleen.com>
 <202511061629.e242724-lkp@intel.com> <CA+CK2bCUWuK4fmuz5Us_mS1ByGy5SjaedVEquj1WxN8JUPsJaw@mail.gmail.com>
In-Reply-To: <CA+CK2bCUWuK4fmuz5Us_mS1ByGy5SjaedVEquj1WxN8JUPsJaw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 6 Nov 2025 17:14:28 -0500
X-Gm-Features: AWmQ_bkf90cd7vGfxxwFQfOgh84qLMbCwawCMq5n9jVWpcK7oaXbMt6knSHxPMQ
Message-ID: <CA+CK2bCSv99byZ-mc8bdoqfbp7qZTS9anky6oh=5ptg=MWPgxA@mail.gmail.com>
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

On Thu, Nov 6, 2025 at 4:46=E2=80=AFPM Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
>
> The bug is in lib/test_kho.c, when KHO is not enabled, it should not
> run KHO commands, there is a function to test that: kho_is_enabled().
> So, KHO is disabled and kho_add_subtree() which calles add debugfs
> entry, and the list is not initialized, because KHO is disabled. The
> fix is:

Sent it as a patch:
https://lore.kernel.org/all/20251106220635.2608494-1-pasha.tatashin@soleen.=
com

>
> diff --git a/lib/test_kho.c b/lib/test_kho.c
> index 025ea251a186..85b60d87a50a 100644
> --- a/lib/test_kho.c
> +++ b/lib/test_kho.c
> @@ -315,6 +315,9 @@ static int __init kho_test_init(void)
>         phys_addr_t fdt_phys;
>         int err;
>
> +       if (!kho_is_enabled())
> +               return 0;
> +
>         err =3D kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys);
>         if (!err)
>                 return kho_test_restore(fdt_phys);
>
> On Thu, Nov 6, 2025 at 3:41=E2=80=AFAM kernel test robot <oliver.sang@int=
el.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed "WARNING:at_kernel/kexec_handover.c:#kho_add_=
subtree" on:
> >
> > commit: e44a700c561d1e892a8d0829d557e221604a7b93 ("[PATCH v9 2/9] kho: =
drop notifiers")
> > url: https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/kho-=
make-debugfs-interface-optional/20251101-222610
> > patch link: https://lore.kernel.org/all/20251101142325.1326536-3-pasha.=
tatashin@soleen.com/
> > patch subject: [PATCH v9 2/9] kho: drop notifiers
> >
> > in testcase: boot
> >
> > config: x86_64-randconfig-001-20251015
> > compiler: gcc-14
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m=
 16G
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > +--------------------------------------------------------+------------+=
------------+
> > |                                                        | 93e4b3b2e9 |=
 e44a700c56 |
> > +--------------------------------------------------------+------------+=
------------+
> > | WARNING:at_kernel/kexec_handover.c:#kho_add_subtree    | 0          |=
 8          |
> > | RIP:kho_add_subtree                                    | 0          |=
 8          |
> > +--------------------------------------------------------+------------+=
------------+
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202511061629.e242724-lkp@intel=
.com
> >
> >
> > [   13.620111][    T1] ------------[ cut here ]------------
> > [   13.620739][    T1] WARNING: CPU: 1 PID: 1 at kernel/kexec_handover.=
c:704 kho_add_subtree (kernel/kexec_handover.c:704)
> > [   13.621665][    T1] Modules linked in:
> > [   13.622090][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted=
 6.18.0-rc3-00211-ge44a700c561d #1 VOLUNTARY
> > [   13.623073][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > [   13.624054][    T1] RIP: 0010:kho_add_subtree (kernel/kexec_handover=
.c:704)
> > [   13.624596][    T1] Code: c7 38 b4 ac 85 31 ed e8 01 1c 00 00 48 c7 =
c7 70 5a ca 86 85 c0 89 c3 40 0f 95 c5 31 c9 31 d2 89 ee e8 37 b5 0a 00 85 =
db 74 02 <0f> 0b b9 01 00 00 00 31 d2 89 ee 48 c7 c7 40 5a ca 86 e8 1c b5 0=
a
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   c7 38 b4 ac 85          xbegin 0xffffffff85acb43d,(bad)
> >    5:   31 ed                   xor    %ebp,%ebp
> >    7:   e8 01 1c 00 00          call   0x1c0d
> >    c:   48 c7 c7 70 5a ca 86    mov    $0xffffffff86ca5a70,%rdi
> >   13:   85 c0                   test   %eax,%eax
> >   15:   89 c3                   mov    %eax,%ebx
> >   17:   40 0f 95 c5             setne  %bpl
> >   1b:   31 c9                   xor    %ecx,%ecx
> >   1d:   31 d2                   xor    %edx,%edx
> >   1f:   89 ee                   mov    %ebp,%esi
> >   21:   e8 37 b5 0a 00          call   0xab55d
> >   26:   85 db                   test   %ebx,%ebx
> >   28:   74 02                   je     0x2c
> >   2a:*  0f 0b                   ud2             <-- trapping instructio=
n
> >   2c:   b9 01 00 00 00          mov    $0x1,%ecx
> >   31:   31 d2                   xor    %edx,%edx
> >   33:   89 ee                   mov    %ebp,%esi
> >   35:   48 c7 c7 40 5a ca 86    mov    $0xffffffff86ca5a40,%rdi
> >   3c:   e8                      .byte 0xe8
> >   3d:   1c b5                   sbb    $0xb5,%al
> >   3f:   0a                      .byte 0xa
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   0f 0b                   ud2
> >    2:   b9 01 00 00 00          mov    $0x1,%ecx
> >    7:   31 d2                   xor    %edx,%edx
> >    9:   89 ee                   mov    %ebp,%esi
> >    b:   48 c7 c7 40 5a ca 86    mov    $0xffffffff86ca5a40,%rdi
> >   12:   e8                      .byte 0xe8
> >   13:   1c b5                   sbb    $0xb5,%al
> >   15:   0a                      .byte 0xa
> > [   13.626370][    T1] RSP: 0018:ffffc9000001fca0 EFLAGS: 00010286
> > [   13.626951][    T1] RAX: dffffc0000000000 RBX: 00000000ffffffff RCX:=
 0000000000000000
> > [   13.627737][    T1] RDX: 1ffffffff0d94b52 RSI: 0000000000000001 RDI:=
 ffffffff86ca5a90
> > [   13.628523][    T1] RBP: 0000000000000001 R08: 0000000000000008 R09:=
 fffffbfff0dfac4c
> > [   13.629330][    T1] R10: 0000000000000000 R11: ffffffff86fd6267 R12:=
 ffff888133ee2000
> > [   13.630101][    T1] R13: ffffffff85acb340 R14: ffff888117a5f988 R15:=
 dffffc0000000000
> > [   13.630869][    T1] FS:  0000000000000000(0000) GS:ffff888426ea0000(=
0000) knlGS:0000000000000000
> > [   13.631727][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
> > [   13.632370][    T1] CR2: 00007f586df260ac CR3: 00000000054ea000 CR4:=
 00000000000406f0
> > [   13.633154][    T1] Call Trace:
> > [   13.633506][    T1]  <TASK>
> > [   13.633833][    T1]  kho_test_prepare_fdt+0x145/0x180
> > [   13.634446][    T1]  ? kho_test_save_data+0x210/0x210
> > [   13.635097][    T1]  ? csum_partial (lib/checksum.c:123)
> > [   13.635546][    T1]  kho_test_init (lib/test_kho.c:177 lib/test_kho.=
c:284)
> > [   13.636018][    T1]  ? vmalloc_test_init (lib/test_kho.c:271)
> > [   13.636508][    T1]  ? add_device_randomness (drivers/char/random.c:=
944)
> > [   13.637485][    T1]  ? mix_pool_bytes (drivers/char/random.c:944)
> > [   13.637955][    T1]  ? trace_initcall_start (include/trace/events/in=
itcall.h:27 (discriminator 3))
> > [   13.638498][    T1]  ? vmalloc_test_init (lib/test_kho.c:271)
> > [   13.638989][    T1]  do_one_initcall (init/main.c:1284)
> > [   13.639477][    T1]  ? trace_initcall_start (init/main.c:1274)
> > [   13.639998][    T1]  ? parse_one (kernel/params.c:143)
> > [   13.640455][    T1]  ? kasan_save_track (mm/kasan/common.c:69 (discr=
iminator 1) mm/kasan/common.c:78 (discriminator 1))
> > [   13.640948][    T1]  ? __kmalloc_noprof (mm/slub.c:5659)
> > [   13.641465][    T1]  do_initcalls (init/main.c:1344 (discriminator 3=
) init/main.c:1361 (discriminator 3))
> > [   13.641924][    T1]  kernel_init_freeable (init/main.c:1595)
> > [   13.642441][    T1]  ? rest_init (init/main.c:1475)
> > [   13.642891][    T1]  kernel_init (init/main.c:1485)
> > [   13.643345][    T1]  ? rest_init (init/main.c:1475)
> > [   13.643788][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
> > [   13.644256][    T1]  ? rest_init (init/main.c:1475)
> > [   13.644703][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:25=
5)
> > [   13.645213][    T1]  </TASK>
> > [   13.645540][    T1] irq event stamp: 132025
> > [   13.645971][    T1] hardirqs last  enabled at (132035): __up_console=
_sem (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:10=
9 arch/x86/include/asm/irqflags.h:151 kernel/printk/printk.c:345)
> > [   13.646887][    T1] hardirqs last disabled at (132046): __up_console=
_sem (kernel/printk/printk.c:343 (discriminator 3))
> > [   13.648253][    T1] softirqs last  enabled at (131286): handle_softi=
rqs (kernel/softirq.c:469 (discriminator 1) kernel/softirq.c:650 (discrimin=
ator 1))
> > [   13.649690][    T1] softirqs last disabled at (131281): __irq_exit_r=
cu (kernel/softirq.c:496 kernel/softirq.c:723)
> > [   13.651128][    T1] ---[ end trace 0000000000000000 ]---
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20251106/202511061629.e242724-l=
kp@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >

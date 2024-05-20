Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D8136E28
	for <oe-lkp@lists.linux.dev>; Mon, 20 May 2024 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716237028; cv=none; b=tnQxO9PNYl7pwnwMt9DipyiJGjIFmQdgU7Rh8bewqWk3Wi3rVL5UJXGY9h9ZoTxt/ppf96HQbDDKtlL4azyBe5+hkQbYg3zvTcPqOJf0c72IMYu1LoXnTNNbFcRmyKgAZfCZI6sNKKEGlWv96WF4gnQns6pLkhCjT5ZTQjqVkfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716237028; c=relaxed/simple;
	bh=Ptbvsvv1iFSn6e+gnNfL8Y/SAbeA54mrnweItI8dNxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuYgjaVSNDPpqibGfWQc6ELkRhD9ThbMotOXM+QomXtopYdAexgsPox+1nkmNoj20BXxExR+H61oTLn+L3fKIvheZ2QMdvVp7oLQq+wvTlRASMJT15o451rr8n9MMsyISx0TRRd2pOGQS3NG2fPCCjgGRN44BJyPOctuXmzzaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaAF2Spp; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaAF2Spp"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-47f39711c94so583505137.1
        for <oe-lkp@lists.linux.dev>; Mon, 20 May 2024 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716237025; x=1716841825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWTMNjhjoLwOoBqk8l8S+TTmWUJefiMOrsxulVowdxI=;
        b=kaAF2Spp48PwEMpJ6JDcW45ILWlaQSGcYeIXGfNs49bqyedXI1W7Z+b+ls4gynVCyK
         spaW3UZbGase5DzrMM4HVPMST4SwKdV2FOLHU6bNG+WOywPbhYNN9bKcOvWthOwpq79d
         oR1yL1YtiEza6/munLEAi+2Wh+UfhU8zBDrh7eS4ofhp26eMMNgeDLGGAzaQrACv0jKb
         ogM1j7N8kHN5hzOVXeIt1ruwBjgTybCxcfoukp6XkSUAIR0DHuWSpQ02e5YNsH6N8VMY
         oxE5mNFYW0/blPQRAZpAwFxOsaoe0+/gkppmLaalzUE1OraFVBUh/Xmfgf+JclMlz9qJ
         kYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716237025; x=1716841825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWTMNjhjoLwOoBqk8l8S+TTmWUJefiMOrsxulVowdxI=;
        b=S0fM8bhcfNeHHQoQbLITknMNEQ3W5E9W1xUVuoRBitZRBljh5EO16OJAj0y7U5dy36
         f3WLjjepPDpJz6mLH8601BkVYnRRTJgJDyy6Ag0bhkgSTmm+cnel1l7BO4oLlZEyOrKg
         PmngHnh4XCbI7PmeMtk/4YpgndhfXyZrc5Ey+unSsOdTO1EsWml7szNNmVlMvlgvQU26
         rRYWw9o1Ep8DFvbrVs0kKhrf+NlDUDChm0cxr9h3ixWoQznG2hZVAb1JTW3aGzm3M4cf
         gC45/BlOFZ0dDBlFOucHigplHl+3MYOwntTtxOzRdVWS5iAdlF4pi8cm1l6ueGfqt1tT
         dUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzCusK6bTvxa6K5RnKc0enymQGbFQBwWs7Tb09orvUlEJtXbVXWkd6rW69jASNm9YjCPqfLn7008fwNTYRgLSwMIrjEU9n
X-Gm-Message-State: AOJu0YxbNNpVJJoZQ9ZvAmT3PTATKGKu7QhvLvxx7qGAMvCAurHqE0RL
	NsU65f2WGfOKVY4pG8UHzBd43V0v2QsTu0nUiMT1w5MkCN74PC2Gp79f1hCfQv57V9eM4eFeJl6
	ywwQQX07vaAKIBSSZ0eTUukvseQo=
X-Google-Smtp-Source: AGHT+IFnEWYniVSq1mlOql0hj32HzNbWrWFVexWrLJWKjLjgvlS3HTWE4uGpTId7ucp59t0f7pW5cnoUfhc3FCqHF8I=
X-Received: by 2002:a05:6102:c48:b0:47e:f1c2:6ed2 with SMTP id
 ada2fe7eead31-48077dcfc23mr26336118137.7.1716237025220; Mon, 20 May 2024
 13:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405202239.f4a4041c-oliver.sang@intel.com>
In-Reply-To: <202405202239.f4a4041c-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Mon, 20 May 2024 14:29:58 -0600
Message-ID: <CAJfuBxyks0cfbi4TxYFffRr1r6n3N=GSAxVT=C_DK7MBvRjZcQ@mail.gmail.com>
Subject: Re: [jimc:dd-shrink-4b] [drm] 4558a76031: canonical_address#:#[##]
To: kernel test robot <oliver.sang@intel.com>
Cc: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 8:56=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
> hi, Jim Cromie,
>
> we noticed this commit mentions "Time for some quality CI".

your results suggest that my concern was well placed :-}


>
> in our builds, with this commit, there is below config diff comparing to =
parent
>
> @@ -3809,6 +3809,7 @@ CONFIG_CHARLCD_BL_FLASH=3Dy
>  CONFIG_DRM=3Dy
>  CONFIG_DRM_MIPI_DSI=3Dy
>  CONFIG_DRM_DEBUG_MM=3Dy
> +CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy
>  CONFIG_DRM_KMS_HELPER=3Dy
>  CONFIG_DRM_FBDEV_EMULATION=3Dy
>  CONFIG_DRM_FBDEV_OVERALLOC=3D100
>
> seems this is expected, however, our tests crashed very early in this vm =
boot
> test. just FYI.

it is expected.  just not the crash.

>
>
> Hello,
>
> kernel test robot noticed "canonical_address#:#[##]" on:
>
> commit: 4558a76031a9eeb67145f098930ab93ad66915e3 ("drm: restore CONFIG_DR=
M_USE_DYNAMIC_DEBUG un-BROKEN")
> https://github.com/jimc/linux.git dd-shrink-4b
>
> in testcase: boot
>
> compiler: gcc-8
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>

thats an old compiler.
does this failure mean that it passed with newer compilers ?

your reproduce scripts used to have a make-cross script
that would download compilers from 0day into ~/0day/
I have: $ ls ~/0day/
clang  gcc-11.2.0-nolibc  gcc-11.3.0-nolibc  gcc-12.1.0-nolibc
gcc-12.3.0-nolibc

has that fallen out of favor/practice ?
I always had to fiddle a bit, partly to get it working in a
$src/builds/foobar build dir
but it was valuable enough to work thru,
it often helped to recapitulate the error.

I will see if I have it laying about here, and give it a try if so.



> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +------------------------------------------------+------------+----------=
--+
> |                                                | 4b46e0eb84 | 4558a7603=
1 |
> +------------------------------------------------+------------+----------=
--+
> | canonical_address#:#[##]                       | 0          | 5        =
  |
> | KASAN:null-ptr-deref_in_range[#-#]             | 0          | 5        =
  |
> | RIP:strcmp                                     | 0          | 5        =
  |
> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 5        =
  |
> +------------------------------------------------+------------+----------=
--+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405202239.f4a4041c-oliver.san=
g@intel.com
>
>
> [    2.369822][    T1] Performance Events: unsupported p6 CPU model 42 no=
 PMU driver, software events only.
> [    2.371877][    T1] signal: max sigframe size: 1776
> [    2.374336][    T1] rcu: Hierarchical SRCU implementation.
> [    2.375469][    T1] rcu:     Max phase no-delay instances is 1000.
> [    2.379182][   T14] Callback from call_rcu_tasks_trace() invoked.
> [    2.404850][    T1] general protection fault, probably for non-canonic=
al address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> [    2.405774][    T1] KASAN: null-ptr-deref in range [0x0000000000000000=
-0x0000000000000007]
> [    2.405774][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc=
7-00032-g4558a76031a9 #1 b53ab647344fd548777e89e94e688e5f78e75cb7
> [    2.405774][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 2.405774][ T1] RIP: 0010:strcmp (kbuild/src/consumer/lib/string.c:265)
> [ 2.405774][ T1] Code: 83 ec 08 49 bd 00 00 00 00 00 fc ff df eb 0a 48 89=
 ef 84 db 74 5a 4c 89 e6 48 89 f8 48 89 fa 48 8d 6f 01 48 c1 e8 03 83 e2 07=
 <42> 0f b6 04 28 38 d0 7f 04 84 c0 75 50 48 89 f0 48 89 f2 0f b6 5d
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   83 ec 08                sub    $0x8,%esp
>    3:   49 bd 00 00 00 00 00    movabs $0xdffffc0000000000,%r13
>    a:   fc ff df
>    d:   eb 0a                   jmp    0x19
>    f:   48 89 ef                mov    %rbp,%rdi
>   12:   84 db                   test   %bl,%bl
>   14:   74 5a                   je     0x70
>   16:   4c 89 e6                mov    %r12,%rsi
>   19:   48 89 f8                mov    %rdi,%rax
>   1c:   48 89 fa                mov    %rdi,%rdx
>   1f:   48 8d 6f 01             lea    0x1(%rdi),%rbp
>   23:   48 c1 e8 03             shr    $0x3,%rax
>   27:   83 e2 07                and    $0x7,%edx
>   2a:*  42 0f b6 04 28          movzbl (%rax,%r13,1),%eax               <=
-- trapping instruction
>   2f:   38 d0                   cmp    %dl,%al
>   31:   7f 04                   jg     0x37
>   33:   84 c0                   test   %al,%al
>   35:   75 50                   jne    0x87
>   37:   48 89 f0                mov    %rsi,%rax
>   3a:   48 89 f2                mov    %rsi,%rdx
>   3d:   0f                      .byte 0xf
>   3e:   b6 5d                   mov    $0x5d,%dh
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   42 0f b6 04 28          movzbl (%rax,%r13,1),%eax
>    5:   38 d0                   cmp    %dl,%al
>    7:   7f 04                   jg     0xd
>    9:   84 c0                   test   %al,%al
>    b:   75 50                   jne    0x5d
>    d:   48 89 f0                mov    %rsi,%rax
>   10:   48 89 f2                mov    %rsi,%rdx
>   13:   0f                      .byte 0xf
>   14:   b6 5d                   mov    $0x5d,%dh
> [    2.405774][    T1] RSP: 0000:ffff888100a37c50 EFLAGS: 00010246
> [    2.405774][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: f=
fffffff81501477
> [    2.405774][    T1] RDX: 0000000000000000 RSI: ffffffff84755280 RDI: 0=
000000000000000
> [    2.405774][    T1] RBP: 0000000000000001 R08: 0000000000000001 R09: 0=
00000009999999b
> [    2.405774][    T1] R10: fffffbfff0c356d8 R11: ffffffff861ab6c7 R12: f=
fffffff86191610
> [    2.405774][    T1] R13: dffffc0000000000 R14: 0000000000000000 R15: f=
fff888100a37d74
> [    2.405774][    T1] FS:  0000000000000000(0000) GS:ffff8883af000000(00=
00) knlGS:0000000000000000
> [    2.405774][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.405774][    T1] CR2: ffff88843ffff000 CR3: 00000000050ed000 CR4: 0=
0000000000406f0
> [    2.405774][    T1] Call Trace:
> [    2.405774][    T1]  <TASK>
> [ 2.405774][ T1] ? show_regs (kbuild/src/consumer/arch/x86/kernel/dumpsta=
ck.c:479)
> [ 2.405774][ T1] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpst=
ack.c:421)
> [ 2.405774][ T1] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstac=
k.c:461)
> [ 2.405774][ T1] ? exc_general_protection (kbuild/src/consumer/arch/x86/k=
ernel/traps.c:702 kbuild/src/consumer/arch/x86/kernel/traps.c:644)
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240520/202405202239.f4a4041c-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

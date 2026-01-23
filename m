Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F9E27470
	for <oe-lkp@lists.linux.dev>; Fri, 23 Jan 2026 19:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197535; cv=pass; b=P+Z0ZZdGGl6HG0MzlRC++WjX1/V1CElZaGt1qERp6VEsKeIuBDIwBQ2A1Ofwmy3fRXGtMG+XvSNwNXKa99cZYeIo7p9k+1by/ZmSWx7mxleY3X81R+rV6A8QLXoK8W3nAQ1qLuD3Pi+eTicjRN8PtgcGonjHN3dfJyF3cGBvNLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197535; c=relaxed/simple;
	bh=blNDMQ72O7NiZwaB/1j+EJBX0TL0rz0tuDTOW2bfdLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UazZtF9UdVfJ28opHTUhJSlssukg88R4VT8evfQBNPQTXuW0CIL4euIHUdmiNdQqL+K0bXOfjp0Bs3kfxhLo5HiRHJZo4jZncOVdS2+jUMMIi6xqsC4Swp7cpYNH+N38uPh5eI+FIN6iywxsk7aQK8hMK7OEEVTAX6xfXyyKc9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcimtGNw; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcimtGNw"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649523de977so2306472d50.0
        for <oe-lkp@lists.linux.dev>; Fri, 23 Jan 2026 11:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769197532; cv=none;
        d=google.com; s=arc-20240605;
        b=i4bVc5fOrQxItrFgDXUqF1cCWjMLro3xy3wjvOPyFiRtSXSulHbL8gDHmrNajbI7XL
         W9m9GkAgfWAfCqRrVAxKwwnXMET3MdNXrLg/kXU1ifCYuCS5tWIPZIbVOvuZc0zOAGJd
         9pOVGNInmupngJfyKEENAYmbcsXc/H+eqLxT2tgz63XNTeO5mos9s7vMRluGLdtZjJ/g
         GCcqO1dPcgjlexB/lM3CsTxe7zV5RtXQJx0WKh8ISQqttCqeZIIa5dL8s2qNYK5LgwQ/
         CbqJUYcCXjZK2+y+kZ88701/rpDlcuH7KBItQC2duN9d5LWQ/6Zpt8XxXXcPlc0aGOZ2
         PYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASfq35FOcJ8RVt0sH2rmdPoKJho6BAcaErDRKGM9VaU=;
        fh=ASSFPBOw2f5H/ZE+oKnGY44ZLFgt/TFfZiULeQnhPmg=;
        b=TQXqB7u03Attf4SxnHVFlGDZNt7b9G5uQ3joqWCqOxP2cOQTDbl5RZyvs2jUwy1Act
         5SWetM+SXyvqLC1LtTHam+mjJy+mtRGo4kaAtRKr1vp0hIEqWeBGj/lUZDKcumWlSGCZ
         SxYwTMywIQwVKqQ1FxDUq8jvBPAcnoOl3eG3nsXiqY3q0ROfZjNz5TBg4b8b9ehQB1BN
         iG3IVIRRRgFXl2kdTVOIbKTHUcpC1J8xfYeI0JWZuLh8rhxVVNJAtq1yTp9VixDjIivC
         5cVnp4xn1cwFR6ysz/E2N1Keb2TvTyn+p4rhRq2O5DWp0jXqDC73CQycYOrqVi8zT2GK
         GxzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769197532; x=1769802332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASfq35FOcJ8RVt0sH2rmdPoKJho6BAcaErDRKGM9VaU=;
        b=WcimtGNwnqQia1/ejxFHLFepXkU9x84M9I/XxGrKl3Oe2LLdnkI5lu1en7j7p4O5Bx
         ynh6qIuXb2wAktsIcYErf44Nt1FMqv9K3G470vUbkwHlbmPBsvUteawYd0Mggoq1jVR2
         MsrdmaWmThAMFYOCnVElJhch0VLAvfgFFCAa6Ty2+TSk/faLiIjTCLWEXecM2uYIX/Ma
         SmYSOqkG7efye7wddQvPCYtQ4eiy3UDX5P+N/fSabXbGv9ITwL8XInYSPzXswMkka3NC
         4VffeZOiVs4tCrAaL651kGUoSfnFHYwPkzymBYc2V4/7AxE7Q4HuT/d6K316ASJrvnGy
         DSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197532; x=1769802332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASfq35FOcJ8RVt0sH2rmdPoKJho6BAcaErDRKGM9VaU=;
        b=Neo6OmsrjjpRM7UD+gZ8Wq/Xrt2g+scRXmmE7U3VM8kOknpd1uB0TbwV8WzxvfddFG
         2CARH/ssrbuz4s7HYhqy9YzJvWSIVylbvV7D7rcKduTD1Qkyvl19SKrS3eWnGvvG/yva
         zsLsmJmvoS6O8MVzH/jbthiWwTwYsHl9mVN5Xh/2GsvFwkDXaWxZnKWmDKQwCugfEj/6
         F9j9MiuMWGjNsOQa+kaRsh5xqDAQBmMmLMHyoERmsHyVcdePhfuPIAm1775Glw6Vdk6T
         TfQfdEVe7M5Luk7CDvZzCx8q3yruVJC1cl5O2TLVaJpBuutGts3IRZTqmoaGtxhV4lbO
         yOCg==
X-Forwarded-Encrypted: i=1; AJvYcCUITcAoRvByk2fvEfvbr3hVNmmr2aRa1isJLOFX9+OKholTTg+TB3yLdwF3lw8eN7crvhDB60I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYROG66eQRMpLbN2TqPVxnZkufo6S4icqbgwFkSZY3vNz7UHWK
	KZsM/HW+k58Bl9iP8Wdg6lb9f6wgcunNmNfN2UA7RmHGk3z6MiwuawoUpkqIO2VofHEcdq1rQWd
	AytBv455vwhNdqNRk0rMZ/LIkF6jbcy4=
X-Gm-Gg: AZuq6aKQvkwJoZq8dh+CVrM3ADRxrXn5PPIukO3tDQLdu15EPOeaATAzSySCLbA0O4x
	cjvtcGL4gSAXWLTcFBQZWDoJYk8PkmXI6+X4K5WsYLmuohcRXWPGGhTEOZev0B4jmXLnP2G4bH9
	AhaeXtUzzjFOvdBnx4gZs5wBMxW72fPPaRHTIzHp6nGKKDmpPS2m0JfuJwAt3qswM2VobOOIQJR
	QvD0gjka3mAaaxC0oFJvAjJepvEOpoG4/woKsfkC44hmjSERas4eqb3BBT4dPCeTZ0Y
X-Received: by 2002:a05:690e:12c1:b0:63e:2b26:a8ad with SMTP id
 956f58d0204a3-6495bee31d2mr2956907d50.38.1769197527889; Fri, 23 Jan 2026
 11:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601211325.7e1f336-lkp@intel.com>
In-Reply-To: <202601211325.7e1f336-lkp@intel.com>
From: jim.cromie@gmail.com
Date: Fri, 23 Jan 2026 12:45:02 -0700
X-Gm-Features: AZwV_QhMufCtyLVL9Ght7zZS8puQS7LHhB5ZpYHTOyvnJ2RZofuZu27xL3QKNJo
Message-ID: <CAJfuBxw-ZYCqq2DQnnfhNcXu7Jhy3V9Mkt82TjZ55+_AZfbbAg@mail.gmail.com>
Subject: Re: [jimc:dd-shrink] [dyndbg] 1663ffb9c1: BUG:kernel_NULL_pointer_dereference,address
To: kernel test robot <oliver.sang@intel.com>
Cc: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks for this report.

I tracked it down to a section alignment issue on i386, fixed in vmlinux.ld=
s.h
Since the bug is present in master, Ive fixed it in a separate patch,
with the reported-by and closes tags.

thanks.





On Tue, Jan 20, 2026 at 11:08=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" o=
n:
>
> commit: 1663ffb9c19cba56a091fac48e06e248f009be26 ("dyndbg: resolve "prote=
ction" of class'd pr_debug")
> https://github.com/jimc/linux.git dd-shrink
>
> in testcase: boot
>
> config: i386-randconfig-015-20260120
> compiler: clang-20
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +---------------------------------------------+------------+------------+
> |                                             | 9d6b17ecee | 1663ffb9c1 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 12         | 0          |
> | boot_failures                               | 0          | 12         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 12         |
> | Oops                                        | 0          | 12         |
> | EIP:strcmp                                  | 0          | 12         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
> +---------------------------------------------+------------+------------+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202601211325.7e1f336-lkp@intel.c=
om
>
>
>
> [    1.266156][    T1] BUG: kernel NULL pointer dereference, address: 000=
00000
> [    1.267870][    T1] #PF: supervisor read access in kernel mode
> [    1.269056][    T1] #PF: error_code(0x0000) - not-present page
> [    1.269056][    T1] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff=
53
> [    1.269056][    T1] Oops: Oops: 0000 [#1] SMP
> [    1.269056][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G   =
             T   6.19.0-rc6-00029-g1663ffb9c19c #1 PREEMPT(lazy)  d32193f03=
a93c27f95904822137a3e5139e15ea4
> [    1.269056][    T1] Tainted: [T]=3DRANDSTRUCT
> [    1.269056][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [    1.269056][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
> [    1.269056][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04=
 5e 5f 5b 5d 31 c9 31 d2 c3 90 90 90 90 90 90 90 90 90 55 89 e5 57 56 89 d7=
 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   06                      (bad)
>    1:   ac                      lods   %ds:(%rsi),%al
>    2:   aa                      stos   %al,%es:(%rdi)
>    3:   84 c0                   test   %al,%al
>    5:   75 f7                   jne    0xfffffffffffffffe
>    7:   31 c0                   xor    %eax,%eax
>    9:   aa                      stos   %al,%es:(%rdi)
>    a:   89 d8                   mov    %ebx,%eax
>    c:   83 c4 04                add    $0x4,%esp
>    f:   5e                      pop    %rsi
>   10:   5f                      pop    %rdi
>   11:   5b                      pop    %rbx
>   12:   5d                      pop    %rbp
>   13:   31 c9                   xor    %ecx,%ecx
>   15:   31 d2                   xor    %edx,%edx
>   17:   c3                      ret
>   18:   90                      nop
>   19:   90                      nop
>   1a:   90                      nop
>   1b:   90                      nop
>   1c:   90                      nop
>   1d:   90                      nop
>   1e:   90                      nop
>   1f:   90                      nop
>   20:   90                      nop
>   21:   55                      push   %rbp
>   22:   89 e5                   mov    %esp,%ebp
>   24:   57                      push   %rdi
>   25:   56                      push   %rsi
>   26:   89 d7                   mov    %edx,%edi
>   28:   89 c6                   mov    %eax,%esi
>   2a:*  ac                      lods   %ds:(%rsi),%al           <-- trapp=
ing instruction
>   2b:   ae                      scas   %es:(%rdi),%al
>   2c:   75 08                   jne    0x36
>   2e:   84 c0                   test   %al,%al
>   30:   75 f8                   jne    0x2a
>   32:   31 c0                   xor    %eax,%eax
>   34:   eb 04                   jmp    0x3a
>   36:   19 c0                   sbb    %eax,%eax
>   38:   0c 01                   or     $0x1,%al
>   3a:   5e                      pop    %rsi
>   3b:   5f                      pop    %rdi
>   3c:   5d                      pop    %rbp
>   3d:   31 d2                   xor    %edx,%edx
>   3f:   c3                      ret
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   ac                      lods   %ds:(%rsi),%al
>    1:   ae                      scas   %es:(%rdi),%al
>    2:   75 08                   jne    0xc
>    4:   84 c0                   test   %al,%al
>    6:   75 f8                   jne    0x0
>    8:   31 c0                   xor    %eax,%eax
>    a:   eb 04                   jmp    0x10
>    c:   19 c0                   sbb    %eax,%eax
>    e:   0c 01                   or     $0x1,%al
>   10:   5e                      pop    %rsi
>   11:   5f                      pop    %rdi
>   12:   5d                      pop    %rbp
>   13:   31 d2                   xor    %edx,%edx
>   15:   c3                      ret
> [    1.269056][    T1] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 000=
00000
> [    1.269056][    T1] ESI: 00000000 EDI: 00000000 EBP: 46981c84 ESP: 469=
81c7c
> [    1.269056][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010246
> [    1.269056][    T1] CR0: 80050033 CR2: 00000000 CR3: 05e58000 CR4: 000=
406b0
> [    1.269056][    T1] Call Trace:
> [    1.269056][    T1]  ? dynamic_debug_init (lib/dynamic_debug.c:1651)
> [    1.269056][    T1]  ? rest_init (init/main.c:1570)
> [    1.269056][    T1]  ? do_one_initcall (init/main.c:1378)
> [    1.269056][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
> [    1.269056][    T1]  ? xas_create (include/linux/xarray.h:1217 (discri=
minator 2))
> [    1.269056][    T1]  ? lock_acquire (kernel/locking/lockdep.c:5868)
> [    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:=
1399)
> [    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:=
1399)
> [    1.269056][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.=
h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
> [    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:=
1399)
> [    1.269056][    T1]  ? rest_init (init/main.c:1570)
> [    1.269056][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1612)
> [    1.269056][    T1]  ? rest_init (init/main.c:1570)
> [    1.269056][    T1]  ? do_pre_smp_initcalls (init/main.c:1483 (discrim=
inator 2))
> [    1.269056][    T1]  ? rest_init (init/main.c:1570)
> [    1.269056][    T1]  ? kernel_init_freeable (init/main.c:1678)
> [    1.269056][    T1]  ? kernel_init (init/main.c:1580)
> [    1.269056][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:164)
> [    1.269056][    T1]  ? rest_init (init/main.c:1570)
> [    1.269056][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_32.S:73=
7)
> [    1.269056][    T1]  ? entry_INT80_32 (arch/x86/entry/entry_32.S:945)
> [    1.269056][    T1] Modules linked in:
> [    1.269056][    T1] CR2: 0000000000000000
> [    1.269056][    T1] ---[ end trace 0000000000000000 ]---
> [    1.269056][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
> [    1.269056][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04=
 5e 5f 5b 5d 31 c9 31 d2 c3 90 90 90 90 90 90 90 90 90 55 89 e5 57 56 89 d7=
 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   06                      (bad)
>    1:   ac                      lods   %ds:(%rsi),%al
>    2:   aa                      stos   %al,%es:(%rdi)
>    3:   84 c0                   test   %al,%al
>    5:   75 f7                   jne    0xfffffffffffffffe
>    7:   31 c0                   xor    %eax,%eax
>    9:   aa                      stos   %al,%es:(%rdi)
>    a:   89 d8                   mov    %ebx,%eax
>    c:   83 c4 04                add    $0x4,%esp
>    f:   5e                      pop    %rsi
>   10:   5f                      pop    %rdi
>   11:   5b                      pop    %rbx
>   12:   5d                      pop    %rbp
>   13:   31 c9                   xor    %ecx,%ecx
>   15:   31 d2                   xor    %edx,%edx
>   17:   c3                      ret
>   18:   90                      nop
>   19:   90                      nop
>   1a:   90                      nop
>   1b:   90                      nop
>   1c:   90                      nop
>   1d:   90                      nop
>   1e:   90                      nop
>   1f:   90                      nop
>   20:   90                      nop
>   21:   55                      push   %rbp
>   22:   89 e5                   mov    %esp,%ebp
>   24:   57                      push   %rdi
>   25:   56                      push   %rsi
>   26:   89 d7                   mov    %edx,%edi
>   28:   89 c6                   mov    %eax,%esi
>   2a:*  ac                      lods   %ds:(%rsi),%al           <-- trapp=
ing instruction
>   2b:   ae                      scas   %es:(%rdi),%al
>   2c:   75 08                   jne    0x36
>   2e:   84 c0                   test   %al,%al
>   30:   75 f8                   jne    0x2a
>   32:   31 c0                   xor    %eax,%eax
>   34:   eb 04                   jmp    0x3a
>   36:   19 c0                   sbb    %eax,%eax
>   38:   0c 01                   or     $0x1,%al
>   3a:   5e                      pop    %rsi
>   3b:   5f                      pop    %rdi
>   3c:   5d                      pop    %rbp
>   3d:   31 d2                   xor    %edx,%edx
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260121/202601211325.7e1f336-lkp=
@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

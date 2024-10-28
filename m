Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4115EFA1
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104444; cv=none; b=aGl/Gqe4Hzwl3BO44tEfYetZcK1O6HeUY9mKpYSPGRu8WdocDS97H2i2u4yU69H17TuY6jrEMDwTi3uU+mnwJAPOdnEmgGxvXBkCITFxyeqou1v47M6d5G4lOD2APL3hBQ3E+kVqMebNJwX1nGNvTAw+Ej4ne3tW5bL0t43db8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104444; c=relaxed/simple;
	bh=7xBhN1hK0Naqouer7nvQT+R0LBWkZ7owhWGfIIfaUyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3QACr9IEIP0eXtbmzxT49/Y2uEGfRPnd2CUF+zDBuTEbUUmlyFTSG+FjSiRiwbEQYyTsodwoJqpNzmycvseril7jBifr9UaTtMtS439t35eSFGjbeWaf4JxsRC/pfDpJ6e+63QQnS34S7CXVlHT8r+uc43SOq6iOHJ6DigKlUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzLUx9jV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzLUx9jV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so3021701f8f.1
        for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730104440; x=1730709240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ8wzWMZqjyVwTsdsvR7ERIdMbnPKfoMzg39AAK0G4E=;
        b=lzLUx9jVE53XIt4pCyt3TeQvmowB3MAcbx1TISYJQk1G4zfZNcgDGbzf5yHgpG+gpZ
         4YT/7YdefGBGw5MpISSdquBLb11oXESs+2/YARp4c4YdlPiS3UPd6HXvK18EploW5Ib8
         ioikLt24K1ueSEyoHHgPr8w62QvLV0XadPNQ7U6RcOx+djUmSlakgDyCSq1OGz/dOS8R
         pPtdBDVwqKNOBy44x72f9Kt7sncdAbfreQleerf/aDQBK3t14xO/1ZSXyti/z6gpMnH3
         I+lRuwDpKaydWuAq57C8AH2/FLGuPrWgYQJMpg88KL7x+oY+5OB0lV/1+qWAyNiz+TUQ
         tBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104440; x=1730709240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ8wzWMZqjyVwTsdsvR7ERIdMbnPKfoMzg39AAK0G4E=;
        b=X06hKGAHdinQDwueemIGdvlB+LDzgDBTM+9T71bxmnDFlExxQENKKl16+mLnatFHue
         gL6lOZjbHkanJi1foIRlY6HVNsqmytEH9cWjZMlhEEz+Cf1H9si1/3k5p6ZETlXA/d56
         Efl+OwP0vzDQGncrUDxQYjO1EVzqQuE/0APQy7+1tmKAA6eGcDuB5oCB0QELxZ4fmDna
         ZgvhyGxxRjTosjapCPU5K3nRE7Z5cg0kDBpz2Z/9yxcUz4ESZFzq0cEDPKKj9NQKwVxk
         PiMWk/ThY+KlJHEpVF+E3Sjsn6IHSDK/EABzAUOCRj3O2Yp/TOVlA5i7kim1nDZLNnD8
         HZSA==
X-Gm-Message-State: AOJu0YzsU681CvGvuIZ+8JzB93bEyIiixkKvPO3lBYu40Rk4GDfw2VHF
	uxaDg52XiZWQZw2aMFHJLO0BJEyZcocXnCL8o/aFtiD19Hpjc7BAYztRkyQYya58R2vZvxrpK63
	+NNQJrGJ1p4+U+PPwD3f5xSzX1GkdUWX6HO5O
X-Google-Smtp-Source: AGHT+IHfvuw8hB4nT6dPGVL4huJ7JSw35zxtJuGuRWINUjqyuiqUHMsFYeR8VWgUseHiMfkFXx9YQcTvl9YsjN4qnZI=
X-Received: by 2002:a5d:6145:0:b0:37c:d12c:17e5 with SMTP id
 ffacd0b85a97d-3806112307fmr5675482f8f.23.1730104439898; Mon, 28 Oct 2024
 01:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com>
In-Reply-To: <202410281414.c351044e-oliver.sang@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Oct 2024 09:33:47 +0100
Message-ID: <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 7:24=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> Hello,
>
> by this change, the config has below difference with parent after buildin=
g.
>
> --- /pkg/linux/x86_64-randconfig-003-20241025/clang-19/af0121c2d303111d36=
3c62e40413ffb39d5dc0f1/.config 2024-10-26 03:31:02.494416152 +0800
> +++ /pkg/linux/x86_64-randconfig-003-20241025/clang-19/8b8ca9c25fe69c2162=
e3235c7d6c341127abeed6/.config 2024-10-25 23:52:03.899366299 +0800
> @@ -661,6 +661,8 @@ CONFIG_LTO_NONE=3Dy
>  CONFIG_ARCH_SUPPORTS_CFI_CLANG=3Dy
>  CONFIG_ARCH_USES_CFI_TRAPS=3Dy
>  CONFIG_CFI_CLANG=3Dy
> +CONFIG_CFI_ICALL_NORMALIZE_INTEGERS=3Dy
> +CONFIG_HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG=3Dy
>  # CONFIG_CFI_PERMISSIVE is not set
>  CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>  CONFIG_HAVE_CONTEXT_TRACKING_USER=3Dy
>
> then we noticed the boot jobs which can pass on parent, failed now.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/sleep:
>   vm-snb/boot/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig-003-202=
41025/clang-19/1
>
> af0121c2d303111d 8b8ca9c25fe69c2162e3235c7d6
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     dmesg.CFI_failure_at_do_bas=
ic_setup
>            :6          100%           6:6     dmesg.Kernel_panic-not_sync=
ing:Fatal_exception
>            :6          100%           6:6     dmesg.Oops:invalid_opcode:#=
[##]PREEMPT_KASAN
>            :6          100%           6:6     dmesg.RIP:do_basic_setup
>            :6          100%           6:6     dmesg.boot_failures
>
>
> below report just FYI what we observed in our tests. thanks
>
>
> kernel test robot noticed "CFI_failure_at_do_basic_setup" on:
>
> commit: 8b8ca9c25fe69c2162e3235c7d6c341127abeed6 ("cfi: fix conditions fo=
r HAVE_CFI_ICALL_NORMALIZE_INTEGERS")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      c71f8fb4dc911022748a378b16aad1cc9b43aad=
8]
> [test failed on linux-next/master a39230ecf6b3057f5897bc4744a790070cfbe7a=
8]
>
> in testcase: boot
>
> config: x86_64-randconfig-003-20241025
> compiler: clang-19
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410281414.c351044e-oliver.san=
g@intel.com
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241028/202410281414.c351044e-ol=
iver.sang@intel.com
>
>
>
> [    7.616732][    T1] CFI failure at do_basic_setup+0x5b/0x90 (target: a=
san.module_ctor+0x0/0x20; expected type: 0xe5c47d60)
> [    7.617229][    T1] Oops: invalid opcode: 0000 [#1] PREEMPT KASAN
> [    7.617952][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.1=
2.0-rc2-00005-g8b8ca9c25fe6 #1 c804d49ce32901c4caca8ebfe1766898b63e48de
> [    7.619334][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    7.620488][    T1] RIP: 0010:do_basic_setup+0x5b/0x90
> [    7.620842][    T1] Code: 00 fc ff df 48 89 d8 48 c1 e8 03 42 80 3c 38=
 00 74 08 48 89 df e8 6d 85 50 fb 4d 8b 5e f8 41 ba a0 82 3b 1a 45 03 53 fc=
 74 02 <0f> 0b 41 ff d3 49 81 fe 68 10 7e be 73 0f e8 8a eb 12 fb 48 83 c3
> [    7.620842][    T1] RSP: 0000:ffffc9000001fed0 EFLAGS: 00010286
> [    7.620842][    T1] RAX: 1ffffffff7cfb6de RBX: ffffffffbe7db6f0 RCX: 0=
000000000000000
> [    7.620842][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000000
> [    7.620842][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0=
000000000000000
> [    7.620842][    T1] R10: 00000000bf7be9ac R11: ffffffffbbdc9360 R12: f=
fffffffbd039fc0
> [    7.620842][    T1] R13: 0000000000000000 R14: ffffffffbe7db6f8 R15: d=
ffffc0000000000
> [    7.620842][    T1] FS:  0000000000000000(0000) GS:ffffffffbd0dc000(00=
00) knlGS:0000000000000000
> [    7.620842][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    7.620842][    T1] CR2: ffff88843ffff000 CR3: 000000042529e000 CR4: 0=
0000000000406f0
> [    7.620842][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [    7.620842][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [    7.620842][    T1] Call Trace:
> [    7.620842][    T1]  <TASK>
> [    7.620842][    T1]  ? __die_body+0x16/0x68
> [    7.620842][    T1]  ? die+0x34/0x58
> [    7.620842][    T1]  ? do_trap+0x111/0x1e8
> [    7.620842][    T1]  ? do_basic_setup+0x5b/0x90
> [    7.620842][    T1]  ? do_error_trap+0x11a/0x190
> [    7.620842][    T1]  ? do_basic_setup+0x5b/0x90
> [    7.620842][    T1]  ? handle_invalid_op+0x34/0x50
> [    7.620842][    T1]  ? do_basic_setup+0x5b/0x90
> [    7.620842][    T1]  ? exc_invalid_op+0x32/0x48
> [    7.620842][    T1]  ? asm_exc_invalid_op+0x16/0x20
> [    7.620842][    T1]  ? __cfi_asan.module_ctor+0x10/0x10
> [    7.620842][    T1]  ? do_basic_setup+0x5b/0x90
> [    7.620842][    T1]  kernel_init_freeable+0xf0/0x190
> [    7.620842][    T1]  ? __cfi_kernel_init+0x8/0x8
> [    7.620842][    T1]  kernel_init+0x19/0x198
> [    7.620842][    T1]  ? __cfi_kernel_init+0x8/0x8
> [    7.620842][    T1]  ret_from_fork+0x5a/0x88
> [    7.620842][    T1]  ? __cfi_kernel_init+0x8/0x8
> [    7.620842][    T1]  ret_from_fork_asm+0x11/0x20
> [    7.620842][    T1]  </TASK>
> [    7.620842][    T1] Modules linked in:
> [    7.620846][    T1] ---[ end trace 0000000000000000 ]---
> [    7.621487][    T1] RIP: 0010:do_basic_setup+0x5b/0x90
> [    7.622107][    T1] Code: 00 fc ff df 48 89 d8 48 c1 e8 03 42 80 3c 38=
 00 74 08 48 89 df e8 6d 85 50 fb 4d 8b 5e f8 41 ba a0 82 3b 1a 45 03 53 fc=
 74 02 <0f> 0b 41 ff d3 49 81 fe 68 10 7e be 73 0f e8 8a eb 12 fb 48 83 c3
> [    7.624206][    T1] RSP: 0000:ffffc9000001fed0 EFLAGS: 00010286
> [    7.624847][    T1] RAX: 1ffffffff7cfb6de RBX: ffffffffbe7db6f0 RCX: 0=
000000000000000
> [    7.625768][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000000
> [    7.626696][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0=
000000000000000
> [    7.627602][    T1] R10: 00000000bf7be9ac R11: ffffffffbbdc9360 R12: f=
fffffffbd039fc0
> [    7.628513][    T1] R13: 0000000000000000 R14: ffffffffbe7db6f8 R15: d=
ffffc0000000000
> [    7.629316][    T1] FS:  0000000000000000(0000) GS:ffffffffbd0dc000(00=
00) knlGS:0000000000000000
> [    7.630979][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    7.632216][    T1] CR2: ffff88843ffff000 CR3: 000000042529e000 CR4: 0=
0000000000406f0
> [    7.633336][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [    7.634842][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [    7.636376][    T1] Kernel panic - not syncing: Fatal exception
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Hmm. This config has:

CONFIG_CLANG_VERSION=3D190102

Sami, is the fix not available as of llvm 19?


Alice

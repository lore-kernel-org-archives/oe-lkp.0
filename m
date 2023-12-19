Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999338DEF
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjitHJ9b"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbd4608121fso1897432276.0
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703013520; x=1703618320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk2WOblYJMsl3hzTJZL7x+a3eKwopbV7abftu0jaO3o=;
        b=qjitHJ9bbZCv6ubhAgeXJrwihj8T1Mcts7V5yEIDgvUVtWzGutg29ALxgJxbTc8/D9
         p4IfY+cTo4sEGNj+G2Wl+4pWV3npWOKc8rXQipHAKfUmzAdaRtySTMp9gSJEbsgExrzg
         TflIxA3wm13tANNMxmtySZVVavaACHGNy2IkPJFVq9SvFZkxXIATFTaaYtsRpJau7UJZ
         asBIvGMFJMyk4Rn31KXHwNZlP6Ac3RexR1B2Gs3Dd4Sbu/jAPXEXhfHCZgmx6y4b9cMa
         lmuOO5/j5d6KidHzLxtYc99eF5WZkfcUxdasozJmUt/UeLCSJ85Mt48n61hqVdP9ITlr
         rwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703013520; x=1703618320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk2WOblYJMsl3hzTJZL7x+a3eKwopbV7abftu0jaO3o=;
        b=txk8V30n0kjH+l45pTVQdrj+OYVDfREffjcmYdhiLNnEFJ9pQCMPGVaKCeI3St8Wrk
         AAgrkXl7kIfb0VVUT3W9zELhLhQvf4nywEPTeq8i+OpxbGABt4CuERuz40kG8Hg9NY2i
         hyvu6wSSaLXWmzMMzlBcdoXwv8fHzuhJZgndioeI5VMM8O1M1/dGBVHjYD6FSaDlPy/m
         HguwyhM/NdN1xkF0eKMAnuC27V0fDEgcjWWp/2E8nrbHzH3cf9e26szy2TyCTQT7SHLj
         C/0RCZH6Zz/qIn3JmsAv6YeoUsYhkiodZDOEwyn1mZs2o5rSOttnYH2DXmIlR7Dgqngb
         SuwQ==
X-Gm-Message-State: AOJu0YwF2n9dIjHgSFn/MrytGKtqJPsaxNzABSFGBZN1tdkCZGOZD/o/
	X7ydsVLsZyA/13dnuXs7sl1AZDA7THfVmPBkDlw/sA==
X-Google-Smtp-Source: AGHT+IEQnJH2FyDceXOzOBMy4ilQPUAbQxXDL6OLSAh4zACKDqdNbLqCjwWUh4R2wa3Q2YxVRYIHrhk3t3bA+xnDWvc=
X-Received: by 2002:a25:fc20:0:b0:dbc:dea7:19a8 with SMTP id
 v32-20020a25fc20000000b00dbcdea719a8mr6143146ybd.121.1703013520291; Tue, 19
 Dec 2023 11:18:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
In-Reply-To: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 19 Dec 2023 11:18:02 -0800
Message-ID: <CABCJKufi2_BcSwc+j=L9VMwGVteSFX509RO6QCC3g-ZtRo5cGQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <oliver.sang@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 10:21=E2=80=AFAM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 19 Dec 2023 at 01:58, Borislav Petkov <bp@alien8.de> wrote:
> >
> > Looking at the dmesg, I think you missed the most important part - the
> > preceding line:
> >
> > [   13.480504][   T48] CFI failure at int80_emulation+0x67/0xb0 (target=
: sys_ni_posix_timers+0x0/0x70; expected type: 0xb02b34d9)
> >                         ^^^^^^^^^^^
>
> So I think the issue here is that sys_ni_posix_timers is just linker
> alias that is used for any non-implemented posix timer system call.
>
> See:
>
>   #define __SYS_NI(abi, name)                                            =
 \
>         SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);
>
> and this all worked fine when the actual call to this was done in
> assembly code that happily just called that function directly and
> didn't care about any argument types.

Yes, that's exactly the issue.

> But commit be5341eb0d43 ("x86/entry: Convert INT 0x80 emulation to
> IDTENTRY") moved that call from assembly into C, and in the process
> ended up enabling CFI for it all, and now the compiler will check that
> the function types match. Which they don't, because we use that dummy
> function (I don't think they do in general).
>
> I don't know what the best fix is. Either CFI should be turned off for
> that call, or we should make sure to generate those NI system calls
> with the proper types.

Probably the easiest fix would be to use SYSCALL_DEFINE0 for
sys_ni_posix_timers, and for architectures that implement syscall
wrappers, change sys_ni_posix_timers references to
__<abi>_sys_ni_posix_timers.

Something like this should fix the issue for x86, but it looks like
arm64, riscv, and s390 would need similar syscall wrapper changes:

diff --git a/arch/x86/include/asm/syscall_wrapper.h
b/arch/x86/include/asm/syscall_wrapper.h
index fd2669b1cb2d..ed38265cad27 100644
--- a/arch/x86/include/asm/syscall_wrapper.h
+++ b/arch/x86/include/asm/syscall_wrapper.h
@@ -87,7 +87,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *r=
egs);
        }

 #define __SYS_NI(abi, name)                                            \
-       SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);
+       SYSCALL_ALIAS(__##abi##_##name, __##abi##_sys_ni_posix_timers);

 #ifdef CONFIG_X86_64
 #define __X64_SYS_STUB0(name)                                          \
diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
index 828aeecbd1e8..d58f976ec926 100644
--- a/kernel/time/posix-stubs.c
+++ b/kernel/time/posix-stubs.c
@@ -22,7 +22,7 @@
 #include <asm/syscall_wrapper.h>
 #endif

-asmlinkage long sys_ni_posix_timers(void)
+SYSCALL_DEFINE0(ni_posix_timers)
 {
        pr_err_once("process %d (%s) attempted a POSIX timer syscall "
                    "while CONFIG_POSIX_TIMERS is not set\n",

Sami

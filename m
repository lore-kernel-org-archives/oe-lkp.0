Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082A37D17
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ARcXwgbj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso8763447a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703010077; x=1703614877; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEyPrJfFY8wsnlnRqNTI0PF/m1A8xGUMS6bKe4vqiaM=;
        b=ARcXwgbjT6Aem+RsBU0KYIkkhtErYWm66ZCM3MZNuRqoFRtZoRqajqKczbmlZ9P8uO
         kbt7oztvmmrt0CG9/AlFSYnglFcw1nOy8SVjDTDBKanEC++ftp3zyHpp6/mqd1F9D8MA
         DsP5EtNx95WRnIAA5ZgQe2fTJR3JftO9kVN+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703010077; x=1703614877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEyPrJfFY8wsnlnRqNTI0PF/m1A8xGUMS6bKe4vqiaM=;
        b=j69LDQ3a0K3FI6SFEBnR4matQpZ4d6zPdnATqLMgr+M4VtMj1vKUPCuf5C/UO+lllZ
         wnGMUm1SYU/7htUqxn+rQsSD+2ANkQ4Vg35dagZ3P7cRlhs3ton7uHuXnFXNE2haHSoB
         StltgaiAbGZFiyJZimFYcPDOPbPt3/W1QseqdHdph6dh0aFD/j1glk6Wqd8i54FPbeJs
         q24H92/YKtcgWQu+ivk+6uCdSln5oI0+UhQ0ZlvE3donrk5ID7QlGx5U1ijeJZXhBlO6
         P7rYowo2vqbO4QcsJ5juIajjWA4yrILMS6iyCqMZPT5X6CwUxpVL6mBN0i8/1/AVsyw1
         0n7A==
X-Gm-Message-State: AOJu0YzgHnP94frbfRqfbFY3aq/odfNibx6FIpSagWousgZz1QxxUFXb
	0tE/Bhn/SXBxXVH7Orh219GWjCTtSsBQySZSD3U8lPQI
X-Google-Smtp-Source: AGHT+IGqoEdtpEHHgtfn0nJX7v255qXPO/XMFB4B6XlefpGQN28cpYI0VrbNvCJvZIr8Nf0sr7tIyw==
X-Received: by 2002:a17:906:7190:b0:a1c:a542:2fcb with SMTP id h16-20020a170906719000b00a1ca5422fcbmr1690371ejk.31.1703010077405;
        Tue, 19 Dec 2023 10:21:17 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709063bd600b00a23596d256esm2678772ejf.84.2023.12.19.10.21.16
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 10:21:16 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2370535060so302307366b.1
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 10:21:16 -0800 (PST)
X-Received: by 2002:a17:907:76f9:b0:a23:48d2:8314 with SMTP id
 kg25-20020a17090776f900b00a2348d28314mr1593362ejc.42.1703010076267; Tue, 19
 Dec 2023 10:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
In-Reply-To: <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 19 Dec 2023 10:20:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
Message-ID: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 01:58, Borislav Petkov <bp@alien8.de> wrote:
>
> Looking at the dmesg, I think you missed the most important part - the
> preceding line:
>
> [   13.480504][   T48] CFI failure at int80_emulation+0x67/0xb0 (target: sys_ni_posix_timers+0x0/0x70; expected type: 0xb02b34d9)
>                         ^^^^^^^^^^^

So I think the issue here is that sys_ni_posix_timers is just linker
alias that is used for any non-implemented posix timer system call.

See:

  #define __SYS_NI(abi, name)                                             \
        SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);

and this all worked fine when the actual call to this was done in
assembly code that happily just called that function directly and
didn't care about any argument types.

But commit be5341eb0d43 ("x86/entry: Convert INT 0x80 emulation to
IDTENTRY") moved that call from assembly into C, and in the process
ended up enabling CFI for it all, and now the compiler will check that
the function types match. Which they don't, because we use that dummy
function (I don't think they do in general).

I don't know what the best fix is. Either CFI should be turned off for
that call, or we should make sure to generate those NI system calls
with the proper types.

The asm didn't care - as long as the function put -ENOSYS in %rax, it
did the right thing - but the kCFI stuff means that the C code now
cares (and checks) that prototypes etc really match.

Maybe we should just get rid of SYS_NI() _entirely_.

I think the only user is the posix-timers stuff, and everything else
uses COND_SYSCALL(), which actually *generates* all the proper weak
functions with all the proper function signatures, instead of playing
around with linker aliases that don't have them.

Afaik, the only reason the posix timers do that odd alias is because
they want to have that

        pr_err_once("process %d (%s) attempted a POSIX timer syscall "
                    "while CONFIG_POSIX_TIMERS is not set\n",
                    current->pid, current->comm);

which I don't think is really worth it. It goes back to 2016 when the
posix timers subsystem became configurable, and I doubt it is worth it
any more (and it was probably of dubious use even at the time).

But I've not had anything to do with the low-level kCFI stuff, and
I'll leave it to Thomas whether that SYS_NI() mess should just be
removed.

I do like the notion of just removing SYS_NI entirely, replacing it
with the standard COND_SYSCALL() thing (and same for the COMPAT
variables, of course).

Thomas?

               Linus

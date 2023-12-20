Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393341EA95
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 23:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hA6mnn3l"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbaf976c80so119163a34.2
        for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 15:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703115618; x=1703720418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT9ddCwESgsBoC0klthrCGoZVKiU2GhW3IYmRpWSVN4=;
        b=hA6mnn3l2/NGS9aGLlRsvWkA4U6YeThqW2SBJ4tBaC054GE/dvUD0eZVMiC32WLX8I
         RveWhfazAr22jtSLvOUb9gR5TyzsyczUK1pu75MzOT30GMhCE251cBrIBYOC2ExzA5Er
         m83IXRtSqhWl11agV0EuTiZ+Z0aot40miu3HoORus08Yung9hRb/MpD4sG3j4Vzg5QtY
         6yhLZy/KXTQ1d8CaNQMI9lMWeLaFvYYQy4oVXFQ5JC5crCEsYeftZ1cDJO/8P6fIO6XC
         DaGgPEpX2sWEixl7NKv3OrSizFfodVAhiGhiuaHbCE4NdXOuzhUGf5qsaqBV0vcHxXxN
         jsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115618; x=1703720418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT9ddCwESgsBoC0klthrCGoZVKiU2GhW3IYmRpWSVN4=;
        b=fFl1z5qJUPSeeEr4osgLeRHcFQtQYrP+n3iqO6rlt//jPYoOztOBYhRAw/WS8n4K37
         0kTrD4OD62wKWppHhx4t/5cdJdALgipq1Ue0Qjw/UrVfc3AUMGKfaJw5/QxE1DSK+0yU
         xlwJm9/ur7/W8HDnwFpkJ028ng/Qd/sVXEl55IRCd4VC6oRGZ6yw4bSnbhDGsiFAbxAJ
         d3rlf5S8mhaxOpnwkELWlLiwZJwSy7iZOccUEx7efU/RZU3IsM4Pu8sKwUTD97eipepW
         wzbatWCxFJi63VtC/xu0+1oQW9/kVnw26u66uNQftkvJF2tdW5Bud341vMoeni8kmRyD
         rfqg==
X-Gm-Message-State: AOJu0Yw/pOxqQtP9XitjUvEnTchqJN9lzja3LtdgrI+sBG/wNM03XUDw
	y7kRxcL0F1EwxKE0s0yAs70F/e8d2zKQMA57QN1Vkw==
X-Google-Smtp-Source: AGHT+IFl1yH9HmEtW/GRt/3W2yqcGB7F1oFfk9bZiSKJ12kXycsrXzJ5TDlaI7WhVRoyr+AHA0ljXKlr1IzXq/x2Slk=
X-Received: by 2002:a05:6830:18c2:b0:6d9:f031:4e76 with SMTP id
 v2-20020a05683018c200b006d9f0314e76mr20116594ote.69.1703115618088; Wed, 20
 Dec 2023 15:40:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
 <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com> <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
 <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com>
In-Reply-To: <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 20 Dec 2023 15:39:40 -0800
Message-ID: <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>, 
	kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 3:15=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 19 Dec 2023 at 12:17, Linus Torvalds
> <torvalds@linuxfoundation.org> wrote:
> >
> > That said, I still think that just getting rid of this horrid special
> > case for posix timers is the right thing, and we should just remove
> > that SYS_NI() alias thing entirely.
>
> IOW, something like the attached patch.
>
> It's not extensively tested, but hey, the diffstat looks nice:
>
>   arch/arm64/include/asm/syscall_wrapper.h |  4 ---
>   arch/riscv/include/asm/syscall_wrapper.h |  5 ----
>   arch/s390/include/asm/syscall_wrapper.h  | 13 +--------
>   arch/x86/include/asm/syscall_wrapper.h   | 34 +++---------------------
>   kernel/sys_ni.c                          | 14 ++++++++++
>   kernel/time/posix-stubs.c                | 45 -------------------------=
-------
>   6 files changed, 19 insertions(+), 96 deletions(-)
>
> and it builds in at least a *couple* of configurations, including with
> CONFIG_POSIX_TIMERS disabled.
>
> I did *not* check whether it might fix the warning, since I doubt my
> user space would even boot without that posix timer support (actually,
> honestly, because I'm just lazy and "it _looks_ fine to me" was the
> main real thing).

I tested the patch with the 0-day bot reproducer and it does fix the
warning. My usual arm64 and riscv configs also seem to build and boot
just fine.

> But that SYS_NI() thing really does deserve to die, as it was purely
> used as a hack for some random timer system calls.
>
> Comments?

Removing the SYS_NI bits is definitely a cleaner solution. Looks good to me=
.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C239AC2
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IEZvJr9B"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so561258266b.1
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 12:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703017079; x=1703621879; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2YQISh9f/hMVihywyg7rkbccdS6kJ5BjuKERfau1fMo=;
        b=IEZvJr9Bd9Y3iUcQF21pmcLGtO7hmQu+qk9XpGFKqvRsIy11rp9mp8xJynK2+JiWUe
         NPKy0DteA8H1xgJquqYqSxbGROj+oX8YRD7i/LgdUkhg/nd8HdoDghjhjVUxaLrkJjDu
         6WZxb5Tz800u3dCzhveyF+0pPOUmnwl+Q5lyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703017079; x=1703621879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YQISh9f/hMVihywyg7rkbccdS6kJ5BjuKERfau1fMo=;
        b=REuQngfbZ4xtu2PMxmAfDgqNb3Mh0ytyk2Q+9vOzlGAcT7nzX4fK8oIcDaST31lLO2
         yEstK0CM1qQS7bWuKbXnomK/Iz41Ghe29t+rvQUsLyPX/IEHLK7owazhmi84/6khUzgr
         4OZ+/IAVUPbjCbotilcHp9lc2wcG94flVilV133GV7LEYOCmwR/eu+ggbCaatvw/xRaN
         kbdfXdy+zPOCKf2uJAp7Ep1fr9tQprcjSd6SWpxEVKP50R9WprlffyfmX2p99+MZMC3x
         2UL1J5ICP8UcIcAlCZy74xGdGp+gR3DeyZVFfMWarR2QnilCLJTDlkOBleFEYb49ETpf
         QaHg==
X-Gm-Message-State: AOJu0YwoRH8NYbQ7mW2zAXgdFpAgBUqRWvjqiu8FQhYMcV3eMqCUQOYQ
	bOUfxRNUs5OslUp17ys5rhKIAdSt0/0Cgh7a6rYdWTlq
X-Google-Smtp-Source: AGHT+IG0KCfzgJf8Dqvck97U4rnBpl1OEteg23XU4PH3uFGOFwcSlLqk3lvv2k1710THHlg5TQYz/g==
X-Received: by 2002:a17:906:f901:b0:a23:321f:4185 with SMTP id lc1-20020a170906f90100b00a23321f4185mr2493228ejb.26.1703017078831;
        Tue, 19 Dec 2023 12:17:58 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id v16-20020a170906339000b00a233515c39esm4013184eja.67.2023.12.19.12.17.58
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 12:17:58 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5532b348d30so3649945a12.1
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 12:17:58 -0800 (PST)
X-Received: by 2002:a17:906:aed8:b0:a23:7576:3551 with SMTP id
 me24-20020a170906aed800b00a2375763551mr696466ejb.109.1703017078207; Tue, 19
 Dec 2023 12:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com> <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com>
In-Reply-To: <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 19 Dec 2023 12:17:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
Message-ID: <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <oliver.sang@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 11:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> -asmlinkage long sys_ni_posix_timers(void);
> +asmlinkage long sys_ni_posix_timers(const struct pt_regs *regs);

I don't think it should be asmlinkage. That means "use legacy asm
calling conventions", and for x86-32 that means pass on stack. Which I
don't think these actually are.

I think it's an old artefect, and it doesn't matter for something that
doesn't take any arguments, but when you add an argument it's actively
wrong.

Of course, that argument isn't _used_, so it still doesn't matter, but
if the point is to use the right prototype, I think we should just
make it be

    long sys_ni_posix_timers(const struct pt_regs *regs);

although I think Sami's suggestion is probably nicer.

That said, I still think that just getting rid of this horrid special
case for posix timers is the right thing, and we should just remove
that SYS_NI() alias thing entirely.

          Linus

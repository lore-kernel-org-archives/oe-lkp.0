Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9151B641
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SS7Cf1jz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e593c756dso528876e87.2
        for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 21:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703137151; x=1703741951; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Z30xKd74ObUozsJeNEksBVIOfy4kYjAEpzTgDQdMk=;
        b=SS7Cf1jzNuIi28AhdwhJ3/iangvLMLVR8YOPb+x2M++nB7pHccqApkmC19AohNJkNk
         DBGTL4UfwXc089L7E9/qeiCqYXUMOBMWoNrmd56eWmwGDMuW8yq6w/Xt8BCMVrQyQZp3
         OzAdcK01dnZqWbhodSKorBOqghOnb4fyCcago=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703137151; x=1703741951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Z30xKd74ObUozsJeNEksBVIOfy4kYjAEpzTgDQdMk=;
        b=bcje2iu533LTwYtUnY9u/Bv0nP7xM9bASJ2fp3WnUDVrlTrgrLOZBYAvYfLIACYe7P
         zMlMUbRpZ0Ed5ln2MhdJ3/gmSJSn5bwv8pvrBvvwVnFnjnctbcyeV1QKLe8eiGmTaTA7
         I+uR0FUqqwnWMbu6GIBTvD7RecK9NC6nityshn2I04e7+g/2zKlwehW8Pf9V5hxkDYpW
         Oi+absv6LhQujndcOuolHkRG2wKBeOih9YYIYOoreBlx7bwwRI6K1wU6DmjfE86D7qWl
         37pViQilmkFMG3cMJXCyE6siVW2f586kOTbT8BKi8F3qLNhixhNDZsPDRAKCHFGJ7poC
         6CdA==
X-Gm-Message-State: AOJu0YwD8BEy7yNp0mkMhei3jIjTrnmYZIZEdnld9uuzEWXmWaHuiAW2
	65lbyhRnwp9fGlQXB/JsNNwM+4Qf+j2XuuT1BnYtP9eo
X-Google-Smtp-Source: AGHT+IHbIJICSQQ+EJtdrsfEtkgppv1bAmR77VtUdQuL7O0e8rjcRDQHIrIt1RUOBaIhTHGuph/PNg==
X-Received: by 2002:a05:6512:a8d:b0:50e:2fee:21c8 with SMTP id m13-20020a0565120a8d00b0050e2fee21c8mr4385300lfu.77.1703137151586;
        Wed, 20 Dec 2023 21:39:11 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id ba15-20020a0564021acf00b0054dc979e31fsm694047edb.2.2023.12.20.21.39.09
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 21:39:09 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso402909a12.3
        for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 21:39:09 -0800 (PST)
X-Received: by 2002:a17:906:27d4:b0:a23:6493:7211 with SMTP id
 k20-20020a17090627d400b00a2364937211mr2723108ejc.114.1703137148904; Wed, 20
 Dec 2023 21:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
 <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com> <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
 <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com> <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
In-Reply-To: <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 20 Dec 2023 21:38:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQvNhB+7nwUkWs8jkh8qbd0nipotYhhghFSVBNNoagcQ@mail.gmail.com>
Message-ID: <CAHk-=wgQvNhB+7nwUkWs8jkh8qbd0nipotYhhghFSVBNNoagcQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>, 
	kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 15:40, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> I tested the patch with the 0-day bot reproducer and it does fix the
> warning. My usual arm64 and riscv configs also seem to build and boot
> just fine.

Thanks. I've been running it on my machine too, and still don't see
anything wrong with it..

I suspect all sane people are already on xmas break, which explains
why people are being quiet. They _should_ be.

But since I'm not in that sane group, I decided to just bypass the
normal channels and apply it directly.

It really isn't all that critical, since I don't expect anybody to
actually disable the posix timer subsystem: I think the config
variable came out of the kernel minimization project, and it's
probably much more likely that people turn off CFI (particularly since
you afaik still need to build with clang to get it) than that they'd
turn off the posix timer support.

But I think it's a worthy cleanup of some messy system call macros, so
I wanted to put this behind us whether it truly matters or not.

            Linus

Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593D199E88
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714506667; cv=none; b=kWfpzq7CUwSJEVvKTKDk3uyiHQRML/D+MwfpnuszoHLsR2inR+CC4uSk4ZVWf3WwsqgXMOeBOeCMM/1TY3ku6/970gNbcIPr+rhQnl8/cWlimCC5Spty6sRBb+nnrcrIIxtF82ATfVk0hFt8zwq1zyZdZI6LY8QJ7tEwQqtwBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714506667; c=relaxed/simple;
	bh=pZkNSqQimNQ+c8QfbZSIETCjRj3NWobbupgjMbXV758=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=huCwkh2/WXSpP3Qdp5ffqWXWT78FyiZG3bdNr/IygNfxBA2t39G9owuCUjoRG2thp+vC77SkZ/0xgIBKcRpwZBBitkjSdATC9HAUDw87zy1bO4Nbuu2nfzTsygreR9g4SdWIv+ee3uLqRzzFCWGAUWslGkYWk17EODmY1xEWljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wzcgAzil; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wzcgAzil"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de54be7066bso10919319276.0
        for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714506664; x=1715111464; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRW5S0ts0YJ1jBUFnS/VETT+cE0ujqNsSJB9yVriaWg=;
        b=wzcgAzill/pm2mc3nissKipIKf+2Dm1LxQg7GdaQT2UFj/7QixY7W1twF7g0TB5N34
         f0/53VftHZU9zpLXGj7iGQWOj9kBEnzF/6/pXJTthgxk4reLqxTn6VdWvoy5u8cz9BLD
         I6tN6Hr4xRqv4ILrafFSZqw2fuLZFFb14ToDRJ8mr8rb5dz1HWRzCJ1rPQIYb091Cpe+
         Q9XjfDt6sWj59FnWd4U2ZfuoZN9uZs2ZZsCVz6HtE3kH4oE4LXa8urup0kk2O20+bCqt
         TK9tR17/nXQOl9sNWZfLaEk+cllym5CHAv/ZGcX6/Mn6j+HEUMrDuusMLWlcRFQLq+dk
         +R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714506664; x=1715111464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRW5S0ts0YJ1jBUFnS/VETT+cE0ujqNsSJB9yVriaWg=;
        b=t7aQnSNT5fJQ/43katQwDW40B3E7HDOFjIItb3+2f0xD3Up61Rdci0Kbtbi4i9E4K3
         PTtCYKp0ZBFsBWI04DWuKIqK4GUY6a4W/NqssII94AdBhf19v1tXSLxui4AmWVRNTSK3
         3fEJXwd1SNz4yHXT6hNRqAFUB+VnD890Eplz0XBNiuky4TqnS9I8rr54fTLBLx7U4aBp
         fUfAMrFHk2/ydWuYV8JnAmok7gPRpiDVSFiLj4HtLOvH0ygPiuwljA5UWWi84dkdtJ0p
         FeoplZdabH3DpVpVBmnfIH7o2CoMP1lqCyYHqrVYYh8/I6jH0iAp+ly0nnWLOBFgW3yA
         LObQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQUaEE7RGhE52S+g7cW0uwCNefVnhOT3jEDIKI20GNkjuNzpoB22kRoAJytNViovMSoifPhkHKyXj6XKvoIPUY+am+IhNN
X-Gm-Message-State: AOJu0YxraE7lwrKL+XZEHEUi6849LNXAYCULgidJf20ptY73PFqULOlo
	K9K/N7a5uxJl8GODR/b2uxAsv65MdCbs4GmMNMJ68h+DQ8Ig7R9ortpDnIVoUdRvpbO/lmynlYW
	JHg==
X-Google-Smtp-Source: AGHT+IF4RivS1EjTDpEBzk4powVofAbI6FibOEO3YCH+mzhy8p2ZRX8re13LLSKcvM/uElHlANx+oqumZuY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c584:0:b0:dcc:6065:2b3d with SMTP id
 v126-20020a25c584000000b00dcc60652b3dmr138504ybe.8.1714506664545; Tue, 30 Apr
 2024 12:51:04 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:51:02 -0700
In-Reply-To: <20240430193211.GEZjFHO0ayDXtgvbE7@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202404302233.f27f91b2-oliver.sang@intel.com> <20240430172313.GCZjEpAfUECkEZ9S5L@fat_crate.local>
 <ZjE7DkTBSbPlBN8k@google.com> <20240430193211.GEZjFHO0ayDXtgvbE7@fat_crate.local>
Message-ID: <ZjFLpkgI3Zl4dsXs@google.com>
Subject: Re: [tip:x86/alternatives] [x86/alternatives] ee8962082a: WARNING:at_arch/x86/kernel/cpu/cpuid-deps.c:#do_clear_cpu_cap
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Srikanth Aithal <sraithal@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 30, 2024, Borislav Petkov wrote:
> On Tue, Apr 30, 2024 at 11:40:14AM -0700, Sean Christopherson wrote:
> > Hmm, I don't think the problem is that init_ia32_feat_ctl() is called too late.
> > It too is called from the BSP prior to alternative_instructions():
> > 
> >   arch_cpu_finalize_init()
> >   |
> >   -> identify_boot_cpu()
> >      |
> >      -> identify_cpu()
> >         |
> >         -> .c_init() => init_intel()
> 
> Yeah, but look at the his stacktrace:
> 
> [ 0.055225][ T0] init_intel (arch/x86/include/asm/msr.h:146 arch/x86/include/asm/msr.h:300 arch/x86/kernel/cpu/intel.c:583
> +arch/x86/kernel/cpu/intel.c:687)
> [ 0.055225][ T0] identify_cpu (arch/x86/kernel/cpu/common.c:1824)
> [ 0.055225][ T0] identify_secondary_cpu (arch/x86/kernel/cpu/common.c:1949)
> [ 0.055225][ T0] smp_store_cpu_info (arch/x86/kernel/smpboot.c:333)
> 
> That's after alternatives.
>
> > Ah, and the WARN even specifically checks for the case where there's divergence
> > from the boot CPU:
> > 
> > 	if (boot_cpu_has(feature))
> > 		WARN_ON(alternatives_patched);
> 
> Funny you should mention that - I have this check in
> setup_force_cpu_cap() too which works on boot_cpu_data *BUT*, actually,
> the test in do_clear_cpu_cap() should be:
> 
>         if (c && cpu_has(c, feature))
>                 WARN_ON(alternatives_patched);
> 
> because setting a feature flag in *any* CPU's cap field is wrong after
> alternatives because as explained earlier.
> 
> I know, our feature flags handling is a major mess.

...

> my guess would be no and that init_ia32_feat_ctl() really needs to go
> before alternatives have been patched because it clears flags.

But that would just mask the underlying problem, it wouldn't actually fix anything
other than making the WARN go away.  Unless I'm misreading the splat+code, the
issue isn't that init_ia32_feat_ctl() clears VMX late, it's that the BSP sees
VMX as fully enabled, but at least one AP sees VMX as disabled.

I don't see how the kernel can expect to function correctly with divergent feature
support across CPUs, i.e. the WARN is a _good_ thing in this case, because it
alerts the user that their system is messed up, e.g. has a bad BIOS or something.

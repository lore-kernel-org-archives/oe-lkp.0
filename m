Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED454BEA
	for <oe-lkp@lists.linux.dev>; Tue,  7 May 2024 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715101787; cv=none; b=rHyP1WATSklQ60QNIFUnZ9hFlZNjzQsq2LPmSZjxJ96o+fekajtEnG0ngQXQH2188DKv81GleCTif5XQJkZU1sTzpk2bhg1KUdhCy4sSthoA28YM1Jw6CZduGWxnE+BdjXLAhbw/SMnWhiIAeEwF2UchbziF5SGTVq1BXtvfiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715101787; c=relaxed/simple;
	bh=cxBnI0V+A77Y2HA8nkpU/SoRJL2gunBwBElfZQaz99I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ubSjvejtE+nulRsd4K+d6+8uiPgZir7XNPNLWc/VjiPgnpfpHM8DgFgY96Tn1Gj4LeLVewfp0YH5+zh2pnsQMIGMPeRGaPkcm2lGLOWYYM5Nz5uanu41lZXjaJyI+6+THhtZ9h3o6WOnd80d6jPZbf07Bmcpb+KZ78e4vAWkz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CkL5Ozxh; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CkL5Ozxh"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc647f65573so7814244276.2
        for <oe-lkp@lists.linux.dev>; Tue, 07 May 2024 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715101784; x=1715706584; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SG1rzAoM8uY88FvswpqM+Szlp+5zBUjcIa4szFSpCo=;
        b=CkL5OzxhB+zJtgHLjoyG59etZt18V9xafNuqLOySMXpnXEKQvWEhyftn39C+k9FapW
         b/Ro57lUHAc7J+e7U/EXZVLPrM4s5WSdpPKDQXPeV5005tpAJBX4QkZ2uv76dXxgBVkG
         MMAvlrtBvzl/YntkN1f1tGhjY/KqfZ21y6kpwtph3MyDvpmPtTA14LmoHuhM4o03eQjW
         uG5N5eXkeMKdriUwKsIYknwaffPRXWah2TGUC+q+GKhbUgavLs/Mbb+6qjFEFuVBtoF/
         3EdfccRKz+tDDLLB8vMV6w6M2kqj2+7LCR+IETqkDDeuNW/VFWx80VCvYDOnESQPfqja
         SaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715101784; x=1715706584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SG1rzAoM8uY88FvswpqM+Szlp+5zBUjcIa4szFSpCo=;
        b=Ne3aAAgkwbOkTqmGMO83ANeSJSFI6mXqyqFT+AxeH+39yobbuzQy/cwEvVB2TBbont
         pxgDeALUHGNmrEvxID4ypBe4T+2yfOvBtZ00xzEocJMnxwRIItyFDESbq152+kfpfFsi
         Zlssq6exwl0Ev1lUSA+rTWfuy8uoY1TzrFM/cxMRm51gqguko8WVFqCBxriK5614e4mZ
         9WZM0rejt9Ox79Ou1nlxbFTJL4RnKKeTOyGTXi6zZ/iaN4b8Ee6Qid50vHC+TkQIUHsB
         YCNgZ+ZmjPAhxbD3zAXR4DmMHCfZKTc1XxDjMjge0LHj+qrqYhXhoOrMNvib4FFgSBVe
         UI4g==
X-Forwarded-Encrypted: i=1; AJvYcCV5YznuLGCrRXR+VVKxstjOIZQU/2lkXa4SmhNIp5QFQbVgEPX73My7PwVZKoD+lzC6ugytRHiJRB8vbo4B/ESr4r3gN3fc
X-Gm-Message-State: AOJu0YyJY8huFwqUYmLyGzQSZ0bnBiZ5AB4OqGqNJOmeOEMwNeuWI3oG
	jKbDyAythmvcbvNKvLUiI35cTQ9KpizdApreK/ycm0GgjctLklgGBXMFvthGOoW9+4aovZLUMF/
	JkQ==
X-Google-Smtp-Source: AGHT+IHae491wrusprky728M5llnp1S0vUofuj0e6wCJ8itraYOwy9j7fA4JfRi45Q/XtiuCFnR0clXdXnY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:dc82:0:b0:deb:8bc4:e27f with SMTP id
 3f1490d57ef6-debb9db1ffdmr56200276.6.1715101784626; Tue, 07 May 2024 10:09:44
 -0700 (PDT)
Date: Tue, 7 May 2024 10:09:43 -0700
In-Reply-To: <20240507114814.GBZjoU_u5kYBhLips3@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZjE7DkTBSbPlBN8k@google.com> <20240430193211.GEZjFHO0ayDXtgvbE7@fat_crate.local>
 <ZjFLpkgI3Zl4dsXs@google.com> <20240430223305.GFZjFxoSha7S5BYbIu@fat_crate.local>
 <20240504124822.GAZjYulrGPPX_4w4zK@fat_crate.local> <ZjiCJz4myN2DLnZ5@xsang-OptiPlex-9020>
 <Zjj3Lrv2NNHLEzzk@google.com> <20240506155759.GOZjj-B_Qrz4DCXwmb@fat_crate.local>
 <ZjnTW4XQwVHEiSaW@xsang-OptiPlex-9020> <20240507114814.GBZjoU_u5kYBhLips3@fat_crate.local>
Message-ID: <ZjpgV-_bjOQh1SL3@google.com>
Subject: Re: [tip:x86/alternatives] [x86/alternatives] ee8962082a: WARNING:at_arch/x86/kernel/cpu/cpuid-deps.c:#do_clear_cpu_cap
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Srikanth Aithal <sraithal@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 07, 2024, Borislav Petkov wrote:
> From: Borislav Petkov <bp@alien8.de>
> To: Oliver Sang <oliver.sang@intel.com>
> Cc: Sean Christopherson <seanjc@google.com>, oe-lkp@lists.linux.dev,
> 	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
> 	Ingo Molnar <mingo@kernel.org>, Srikanth Aithal <sraithal@amd.com>
> Bcc: bp@alien8.de
> Subject: Re: [tip:x86/alternatives] [x86/alternatives] ee8962082a:
>  WARNING:at_arch/x86/kernel/cpu/cpuid-deps.c:#do_clear_cpu_cap
> Reply-To: 
> In-Reply-To: <ZjnTW4XQwVHEiSaW@xsang-OptiPlex-9020>
> 
> On Tue, May 07, 2024 at 03:08:11PM +0800, Oliver Sang wrote:
> > I applied the debug pach ontop of lastest Linus master:
> > 
> > 1621a826233a7 debug patch from Boris for ee8962082a
> > dccb07f2914cd (HEAD, linus/master) Merge tag 'for-6.9-rc7-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > 
> > attached dmesg and cpuinfo (a little diff, so I attached it again)
> 
> Thanks, now what are we seeing here:
> 
> [    0.763720][    T0] x86/cpu: init_ia32_feat_ctl: CPU0: FEAT_CTL: 0x5, tboot: 0

...

> FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX, bit 2 is set. So that conditional is
> not true either. And the pr_err_once() doesn't appear in dmesg.
> 
> BUT(!), look what the original dmesg said:
> 
> [    0.055225][    T0] x86/cpu: VMX (outside TXT) disabled by BIOS
> 
> So that FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX bit was not set back then. Why?
> 
> Oliver, have you done any BIOS config changes in the meantime?
> 
> This all looks really weird.
> 
> The other possibility would be if something changed between -rc3
> (the branch x86/alternatives is based on) and -rc7. Unlikely but by now
> everything's possible.
>
> What could also be the case is, the BSP's FEAT_CTL is 0x0 (unconfigured,
> whatever), we'd go in, set FEAT_CTL_LOCKED and that'll lock the bit in
> all FEAT_CTLs on all cores, then it'll set
> FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX.o

I would say it's beyond unlikely that a kernel change is responsible.  In both
traces, FEAT_CTL.LOCKED is '1' before init_ia32_feat_ctl() runs, i.e. the MSR was
already locked by BIOS.  And that is by far the most common scenario, it's all
but unheard of for BIOS to leave FEAT_CTL unlocked.

For giggles, I hacked QEMU to simulate FEAT_CTL being (a) unlocked by BIOS and
(b) locked with VMX disabled.  For both (a) and (b), an -rc3 based kernel behaves
as expected, i.e. configures the MSR correctly for (a), and complains once on the
BSP about VMX being disabled for (b).  Neither case triggers the WARN_ON()
alternatives being applied.

Oliver, are you able to reproduce the WARN using the "original" kernel?  If not,
then I don't think it's more time looking at this from a kernel perspective, as
it's more or less guaranteed to be some sort of environmental issue.

Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E0B13D895
	for <oe-lkp@lists.linux.dev>; Mon,  6 May 2024 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715009330; cv=none; b=oPHzbGGKXgFpvTcTOePg8g47SW1t/2kShHVV8e1hqrkknRtMe7eTg8n7F+rPBRCIekj/YPcmGRg7QyJVAohOESLT4AKO4kS4ZpFWjkjao4sa7VHruto9+AbmfaJqGfk5b7sPFGnBaWqkqP3TpF38Qq8AQ7gGv8KprnwZjGG5tu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715009330; c=relaxed/simple;
	bh=s2JCz/dxID1s0heeyoyh9Z/VX4F91mpYqgGKTN2Pz14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EhPTE52q1Ls5rhvHoZ0T962By0up3bv1IZgGXgaYkKte9LjmNgWa02zZZZ+YBnC9oJV9ByW4FCGOEVy6or5X3o9kPnVypcyUiZ8qDmVhJ2dF2UQeRg4v2qZwZw+0fv8o4e60YCb9rPPH1DLgXiBDx66+c3DXbyljkPLTPCDxxRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d385hwdy; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d385hwdy"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61dfa4090c1so35258467b3.3
        for <oe-lkp@lists.linux.dev>; Mon, 06 May 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715009328; x=1715614128; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SzRKJKTryCwaPCxTu2t8Et86gsCQMDMlHJIYmQAL6Jc=;
        b=d385hwdy/eF4eq0oCnN7rrkIXAbBkCnSTSyt9JdE/m9uJkqx7F8pijzYXh2lYXcQ6m
         GY1pD6eBXymBhJRT6LtUt7GhbL9hReTVvhxr+s25BFvhX7L2dSrFuJ+Ih87R72ejNgtd
         rBbgvB6TE5z56VGpNR8KA+d5OeStd4NdEKx3r1f595eVTVCzCbx/oUNF4K2hrDB+ql9z
         94527xaryX97+9QkK2V7czp7mPPRE7h8DNGui9DR06Q0wzBSdFpmFtYy2BLPf7mXqpID
         +nyQYrwOjvXBdYF8NtgazN1DR95qZCEE2w1MPayaSn6QHEaAhNpjDZBvi2On7jfLBB3M
         MI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009328; x=1715614128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzRKJKTryCwaPCxTu2t8Et86gsCQMDMlHJIYmQAL6Jc=;
        b=KBIgCdyu5oWtTuJkvyuAVcg0cdjrLV9T6uG4DRSX+ewKQ5ISqbHY2cviziZb2v74LM
         M0y9r3Vr3atSRG6abeSgNSWPqSi28zVB++BAY4aT6gAlt0QXPMiaY72ahJYVmhJyvinP
         jILe6LgEPSrsTkcsM2oiIxFwv5w8BOAvUApaUJ1DCw7fLIGHxnVsjUnNKh0gKB8AGApN
         3X/guPHg6a2DXlhe+Aqs3t/6CmZg52cWO3jhx14llA2w96kDz66ZtdA+ef2zHMapZMmi
         gfcJ6B8wpZ6ztHLCsfCNihV6xd0xVuunPFEr1d33dB7aZ0va4qfHDF7t9c8FkpMdLWbm
         0KYw==
X-Forwarded-Encrypted: i=1; AJvYcCU1GDEhY/Bl16UQ21XoFkKKvhfZOIPqQP682+ZQSVqQ98YHT4JyE2pokfl0EjMwWDXan9+6x1nh71UOibIbzM8TlMajhCIS
X-Gm-Message-State: AOJu0YwmyK4+I7/ashUA0SsOOyoYNQ+s3WqLskqtKQvpshVYuHF57aOy
	9+JW2WhX4kcJtXb92EbW1xAYmjT6pdtp8Dkq37KqmX9+Rk1/oOUZVxgraH49iM5FuIMJt54v9Mh
	PBA==
X-Google-Smtp-Source: AGHT+IEA1zlfe5rAXt33idOvPm7EGcmGm+2I5fvsX/Rvf4OmmpgXB1xVKI7wf6wSuCMOf0BME2S16N5J/2A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d817:0:b0:61b:e165:44ba with SMTP id
 a23-20020a0dd817000000b0061be16544bamr2589268ywe.1.1715009328144; Mon, 06 May
 2024 08:28:48 -0700 (PDT)
Date: Mon, 6 May 2024 08:28:46 -0700
In-Reply-To: <ZjiCJz4myN2DLnZ5@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202404302233.f27f91b2-oliver.sang@intel.com> <20240430172313.GCZjEpAfUECkEZ9S5L@fat_crate.local>
 <ZjE7DkTBSbPlBN8k@google.com> <20240430193211.GEZjFHO0ayDXtgvbE7@fat_crate.local>
 <ZjFLpkgI3Zl4dsXs@google.com> <20240430223305.GFZjFxoSha7S5BYbIu@fat_crate.local>
 <20240504124822.GAZjYulrGPPX_4w4zK@fat_crate.local> <ZjiCJz4myN2DLnZ5@xsang-OptiPlex-9020>
Message-ID: <Zjj3Lrv2NNHLEzzk@google.com>
Subject: Re: [tip:x86/alternatives] [x86/alternatives] ee8962082a: WARNING:at_arch/x86/kernel/cpu/cpuid-deps.c:#do_clear_cpu_cap
From: Sean Christopherson <seanjc@google.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Srikanth Aithal <sraithal@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 06, 2024, Oliver Sang wrote:
> hi, Boris,
> 
> On Sat, May 04, 2024 at 02:48:22PM +0200, Borislav Petkov wrote:
> > On Wed, May 01, 2024 at 12:33:05AM +0200, Borislav Petkov wrote:
> > > On Tue, Apr 30, 2024 at 12:51:02PM -0700, Sean Christopherson wrote:
> > > > But that would just mask the underlying problem, it wouldn't actually fix anything
> > > > other than making the WARN go away.  Unless I'm misreading the splat+code, the
> > > > issue isn't that init_ia32_feat_ctl() clears VMX late, it's that the BSP sees
> > > > VMX as fully enabled, but at least one AP sees VMX as disabled.
> > > > 
> > > > I don't see how the kernel can expect to function correctly with divergent feature
> > > > support across CPUs, i.e. the WARN is a _good_ thing in this case, because it
> > > > alerts the user that their system is messed up, e.g. has a bad BIOS or something.
> > > 
> > > Yes, and yes.
> > > 
> > > There are two issues. Clearing feature flags after alternatives have
> > > been applied should not happen, and this particular issue with that box.
> > > 
> > > Lemme cook up something in the coming days for the former.
> > 
> > Two simple patches as a reply to this.
> > 
> > Oliver, can you run them on your box pls?
> 
> we confirmed after applying them upon ee8962082a, the WARNING which was reported
> in our original report cannot be reproduced any longer.

I am so confused.  With both patches applied, simulating VMX being disabled by
BIOS, which is a _legal_ configuration, yields:

 ------------[ cut here ]------------
 WARNING: CPU: 1 PID: 0 at arch/x86/kernel/cpu/cpuid-deps.c:118 do_clear_cpu_cap+0xf6/0x120
 Modules linked in:
 CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.9.0-rc3-28ed6849f6ae-rev/boris-vm #389
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
 RIP: 0010:do_clear_cpu_cap+0xf6/0x120
 Call Trace:
  <TASK>
  init_ia32_feat_ctl+0x133/0x420
  init_intel+0x11/0x330
  identify_cpu+0x242/0x670
  identify_secondary_cpu+0xe/0x40
  smp_store_cpu_info+0x48/0x60
  start_secondary+0x73/0x120
  common_startup_64+0x13b/0x141
  </TASK>
 ---[ end trace 0000000000000000 ]---

That's completely expected (by me at least), because as I said in the original
thread, secondary CPUs are identified after alternatives are applied, and when VMX
is disabled by BIOS, the feature flag will be initially set based on CPUID, and
then cleared by init_ia32_feat_ctl().  I.e. patch 1 is wrong on multiple levels.

And without _either_ patch applied, no WARN occurs, which is again expected (by
me), because init_ia32_feat_ctl() runs _before_ alternative_instructions() on the
boot CPU, i.e. alternatives_patched will be false when do_clear_cpu_cap() is
called by the boot CPU, and the boot_cpu_has(feature) that guards the WARN will
be false when do_clear_cpu_cap() is called by secondary CPUs.

The only way the WARN could have fired without this series is if VMX is enabled
in BIOS on the boot CPU, but disabled by BIOS on one more secondary CPUs.  And
_that_ is a bogus setup that (a) the kernel absolutely should WARN about, and
(b) _still_ occurs with one or both patches applied.

So I don't see how this series could possibly have fixed the issue Oliver
encountered, nor do I see any value in moving init_ia32_feat_ctl() into
early_init_intel().

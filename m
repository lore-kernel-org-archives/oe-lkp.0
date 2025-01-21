Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93F188006
	for <oe-lkp@lists.linux.dev>; Tue, 21 Jan 2025 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737476035; cv=none; b=nD2qoK875LQvgCT4e1w/Bc70fpIUJmjNRSxSq4k2WP1Wk+aRs7rimg42RvRyhZ1DcIlelnVL+0g82F3FKs3s6eu+oPM54IDxIm4Axw2cZG5370UroCrH7brYh2PSrNyMRrwliY3Che35sC2rQ2fF4k2q4Zq2rk3QAjbdiLUrg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737476035; c=relaxed/simple;
	bh=GM7czy+zZ2a/15ERxKVya+gt4AqfDlPsdy7sFT1UIxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=beELwPnK4N5eu1O69Yp8v17NFC1ldfr41KUnmLVadSTF7i73uLCERZDhiI4q0Tp6OhaDsFVGgV1pH+9oPemTcrksZL8HSM7vZOKNq3QnuIdFSWRjviHDy1j+T7cpBVW9DZuV4uErEACLyraZ64b+bGnHvb82o+KaRTNdiZ8Oivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hKTtPfU3; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKTtPfU3"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so8045267a91.0
        for <oe-lkp@lists.linux.dev>; Tue, 21 Jan 2025 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737476033; x=1738080833; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BvpriF+2u2s9kkp5NUdJHhbThP0v/VNSPepec3ecsfs=;
        b=hKTtPfU3okk1roX/a6wLU5dkR75XDwh7VjUOmk3Rd6Wopa18ExkV40gDZ8/qqXaZNV
         K8eymp4rKBMLHU8ZRz7rtGKdS5c5OnIyzqJ87lbeELKU+I6a6EXq3/L9elCYJ9anpwJW
         CSHDo0hd17GppyNOKJ9MviC1SagSYVvQp0Ci9pXFAQFKUtjkdvTpi4+FhQbPF4cXhRcx
         Op3dXSLaajhxU7LkvjU2YCylq1FHrT2yUGclToKE2wEFJGcD0+PjjQwWElSogTZDXWI5
         omUSFZJNADIbUPv7QsCx1+grtqBaeGRdHbh9IXBIt4i8v+2MBJetHTQ+7xlxJKZCOKlR
         +uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737476033; x=1738080833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvpriF+2u2s9kkp5NUdJHhbThP0v/VNSPepec3ecsfs=;
        b=t0qzSvSVAuoPB1hAyW/d5Hsl41CrOy3tPay2bKAGPkoK2MCS3w07+VYoa6R3dKdUYW
         h2EA/vvJ7VQ2P6m3XMUySqrJeXR/3TbZouFjHLnfbIAGzo7Ok7XRNiHRTUlUG6S32+PO
         vnXHNdJWlf54+e+vaHV2OrPSASx6XV0KqfnDFfg9dzGeNBxpwYaKyuDnYK+dCLQlfkCk
         /K5usLIM1WvEBILcn1co2X15JiDeBTzPm+WdYQLFlOtnaLEF8ad21QNQvr1Nfpv+Bm0c
         eRx92/DWz5RfZ5kXd4aH4157LhnKES8iHDQt2PotYdv25wlKw4xW6v12yQmoSJOhv2iQ
         ZLSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/s0xryb4CqHsr9mKwpeIGgsj8mgYo43720gLbzavHQ3m7FHhgqWOOrmDawQODckwslilZSTs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIt/nVChGUFpM5pk7CwVAVo1E7oOp19irlgKOY1MCljd2FHFBe
	ICIkeXCC/ho68muSEdQA+fY+NwP9xNosKZT4suJon4BcrRazQAqkymGxNzCLzDj5awIL8Mo8pcr
	3Ag==
X-Google-Smtp-Source: AGHT+IHfNc3oTB8Nb5L5q4f7wjaoPuPv56eNR/pXP8N9c2jx8SbzgPgfcQWIeZ9uEUsm66SqLt//O2HeyS4=
X-Received: from pfbch12.prod.google.com ([2002:a05:6a00:288c:b0:725:f14a:b57c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8013:b0:725:8c0f:6fa3
 with SMTP id d2e1a72fcca58-72dafbaae38mr24391174b3a.22.1737476032849; Tue, 21
 Jan 2025 08:13:52 -0800 (PST)
Date: Tue, 21 Jan 2025 08:13:51 -0800
In-Reply-To: <c1ce77cd-8921-402d-87b2-fd3fa11add4d@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202501141009.30c629b4-lkp@intel.com> <Z4a_PmUVVmUtOd4p@google.com>
 <a2adf1b8-c394-4741-a42b-32288657b07e@linux.intel.com> <6c23d536-484f-4c4b-aa85-3e0b9544611a@linux.intel.com>
 <Z4qPWNscnU9-b30n@google.com> <c1ce77cd-8921-402d-87b2-fd3fa11add4d@linux.intel.com>
Message-ID: <Z4_HvwSYX592oQ5s@google.com>
Subject: Re: [linux-next:master] [KVM] 7803339fa9: kernel-selftests.kvm.pmu_counters_test.fail
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, g@google.com, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	xudong.hao@intel.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 20, 2025, Dapeng Mi wrote:
> On 1/18/2025 1:11 AM, Sean Christopherson wrote:
> > @@ -98,14 +149,12 @@ static uint8_t guest_get_pmu_version(void)
> >   * Sanity check that in all cases, the event doesn't count when it's disabled,
> >   * and that KVM correctly emulates the write of an arbitrary value.
> >   */
> > -static void guest_assert_event_count(uint8_t idx,
> > -				     struct kvm_x86_pmu_feature event,
> > -				     uint32_t pmc, uint32_t pmc_msr)
> > +static void guest_assert_event_count(uint8_t idx, uint32_t pmc, uint32_t pmc_msr)
> >  {
> >  	uint64_t count;
> >  
> >  	count = _rdpmc(pmc);
> > -	if (!this_pmu_has(event))
> > +	if (!(hardware_pmu_arch_events & BIT(idx)))
> >  		goto sanity_checks;
> >  
> >  	switch (idx) {
> > @@ -126,7 +175,9 @@ static void guest_assert_event_count(uint8_t idx,
> >  		GUEST_ASSERT_NE(count, 0);
> >  		break;
> >  	case INTEL_ARCH_TOPDOWN_SLOTS_INDEX:
> > -		GUEST_ASSERT(count >= NUM_INSNS_RETIRED);
> > +		__GUEST_ASSERT(count < NUM_INSNS_RETIRED,
> 
> shouldn't be "__GUEST_ASSERT(count >= NUM_INSNS_RETIRED," ?

Yes.  I had intentionally inverted the check to verify the assert message and
forgot to flip it back before hitting "send".  Thankfully, I didn't forget before
posting formally[*].  Ugh, but I did forget to Cc you on that series, sorry :-/

[*] https://lore.kernel.org/all/20250117234204.2600624-6-seanjc@google.com

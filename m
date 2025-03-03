Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900D211261
	for <oe-lkp@lists.linux.dev>; Mon,  3 Mar 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741015353; cv=none; b=KNfz9zkhEeJVCP2dj1g6iBKzEEtuH7j1SOURofpImUfZ4arIrT1AgkWQ72HSrMME35r47swc5z9r5u/2TLMXloLjQf8/CBO2i/6uqIcahx6vly1Jq8ky5NkfN9/fDvFIDfCZQDEvV7OxSEi1Nfd9TiQeS/iZspH16gpvMG3I2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741015353; c=relaxed/simple;
	bh=1GJMzL1JCfD1of+CdpWKHBCwpGULIi+nH9B6YQ4M1zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GdnIz5kQl1fHj5FiFUqDYwKB4V2wOEqsmhrUBfyw1V+OuUHUrCLYEYfIJnDr+wMYyd6XwadR4MFAU96sQr1QhkFWGSGWEt5U4jgqVOPunttoDNQLT1m4BzKmskCO3a7LtWoasIii1Wr7Q90bbEwnto1Ip2aSkJM5+aYT1CDE0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cm/RY1LS; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cm/RY1LS"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fee7f85d03so5406032a91.3
        for <oe-lkp@lists.linux.dev>; Mon, 03 Mar 2025 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741015350; x=1741620150; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMGTphITkQdxhY2pPCzGCe412KH9D06U0hlG+OB42HI=;
        b=Cm/RY1LSXkQ95gGm/BxGOcgNMjXATf7uTjystvlaNPUuCqWfc7HM+m8pmAt0rxzpxN
         uYlslq4pV4PUT6U7tgPLFg4E1lEfwEUrOQICTEBbsWwmfSPuQnAE69vtj/oBbYXPtz2w
         jYsEyV/VNqiaYo0r7U3kT70c+kr92dcEVngZm85/4bK/iYH2UyfTlzlQQ9JUchv0NBfN
         p0qIX1WFb1r4hHEdK5AVabt912TPCaruXNaiuVwaLd9EUaGYuIq/WyaO1F0ZHB69K6D2
         qfUZQ8GFFgawa7PmrHW2Tz/oGNMMVJ2+lGVnIIpFE6XPSulYnApKpmUYKf7rPlT3KlbM
         42rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015350; x=1741620150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMGTphITkQdxhY2pPCzGCe412KH9D06U0hlG+OB42HI=;
        b=R3ynr3CDAuwYnrELJnlfpASNgzpiCZJw4v/U+qKSg6htqmNaYfdkP+tATcNpJsNlA+
         cyscfMmtcr3v3qw5guKvNm9hdtgQK/curIAsXDvGyZvunuYtfxDddIgv+H/07wxnnD37
         c2gHYmYkcOtTdOVn3e2MzkCR6OZMTSq7I8o4ewOMeyz4/ttBikwDjSg+LprgLYk8U/9P
         2zQ5qPM5SBgUZm6Gm4XIEveYiFA6w9zp0vcW0UDdvDEfzxOE5xCWA/4BlPCmUIyK4o+R
         n1VKefU5ARDubB8n0t/sJ0/6oiLzqaatfeQkP9p5m/uzOP6zktmQ9mW8C147Gi3HD8RK
         zTAg==
X-Forwarded-Encrypted: i=1; AJvYcCXlQPHHQu9NmMJjHYdBRGbhhravWZuq8aHTpfe3d0XKPsLZtYPjUo+LOKHmX/BkH3EyYXE/mZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyukIzdkIwJ2bNpaQosnXhxZBx5BBlFsFnFG8sSgVAXUhn+hztC
	tuV39uuz4FOZ1nE24Eq/+yHCJXwzUd1XcHYniPjWJl+rGhd11b3dNZxsQpW8wmhijyZPBcIWxrB
	npQ==
X-Google-Smtp-Source: AGHT+IHvVroj58g38Bhwial1jgUOWY2xT0+A3ebuimFp+WwwaSWOqv1ssW/wZoApYGVvPw9TTxNKsvTpG4A=
X-Received: from pjboe14.prod.google.com ([2002:a17:90b:394e:b0:2ef:8a7b:195c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0a:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-2febab7459bmr24737076a91.17.1741015350383; Mon, 03
 Mar 2025 07:22:30 -0800 (PST)
Date: Mon, 3 Mar 2025 07:22:28 -0800
In-Reply-To: <202502271500.28201544-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202502271500.28201544-lkp@intel.com>
Message-ID: <Z8XJNEIEBtBggM44@google.com>
Subject: Re: [linux-next:master] [KVM]  4cad9f8787: kvm-unit-tests.vmx_apic_passthrough_tpr_threshold_test.fail
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Liam Ni <zhiguangni01@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 03, 2025, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kvm-unit-tests.vmx_apic_passthrough_tpr_threshold_test.fail" on:
> 
> commit: 4cad9f87876a943d018ad73ec3919215fb756d2d ("KVM: x86: Wake vCPU for PIC interrupt injection iff a valid IRQ was found")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

...
 
> Test suite: vmx_apic_passthrough_tpr_threshold_test
> PASS: TPR was zero by guest
> FAIL: self-IPI fired

Known issue, (should be) fixed by commit 982caaa11504 ("KVM: nVMX: Process events
on nested VM-Exit if injectable IRQ or NMI is pending") in Paolo's and Linus' trees.

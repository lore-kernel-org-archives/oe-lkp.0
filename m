Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F816C692
	for <oe-lkp@lists.linux.dev>; Fri, 14 Jun 2024 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378163; cv=none; b=sJthDpHKJNe1T2g+kzPKs7yI20xTHw9cDmR8o3rfVlnEUzGrxx69+jI1lg5fZbUneHf6/wjdZaEb8yjPEOegkiUIR+7QlQSLXzuhFZvVGorLqbEFGHOBV/PRkEDz3zVzREvcYh8aB0mkAOJd3RaBKIuVk2qKoTg2hHn3CY4ggjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378163; c=relaxed/simple;
	bh=tB3nksv5OSh4yrXHNAhUFm7LpoPTAB3Ap17apW8jA+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AFOandrFfCRtUU4GC80w6zy10G6mztCwTy+QA1qYYedhK28YF1chcomze87Bw6wu1LMhtN6Vj2KlIOjLZhthhm0jyxPOp3F8rJYTQtKSCA6zblVDtW3o4rjW1G2rlwywuAseXUX1ZCI/u/TM3XcCokIOeof4rb2qyPe8QPL3Uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ROQLSlJi; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ROQLSlJi"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7048ac4dcc5so1803834b3a.2
        for <oe-lkp@lists.linux.dev>; Fri, 14 Jun 2024 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718378161; x=1718982961; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHPuM4ujkTNiXqDIHccUGDrfT6731iKfSe0PJxgTmiM=;
        b=ROQLSlJif59LLoPcUvdPAhU1Th9PaCStIrfTIJr/CCG7IglBZj+TzrThGCKeu92ei3
         x/DQR+AGBhm4tolOH/eC2HY59YRQKEp+oRGwY1jD35T9N76cojqeMvkqH1Hl4xtJwx4D
         0YOxL6ggXM7kXFMy2rCS/3q5k11ENMoM0cJW6vHqKzkN34kOqV2AgPQld3b4fXzerPXk
         GE6qO3UW49EC/7zSFxdgptkjsa4KMLofBDyvE7UDVdALJp0oUfwkGfDMtjWJivj0LxX/
         lNrj66QzFGTr1B/euMXNmHPQHz8Iy5tNbM1/BcH/hv7l6jWC0Z68bZFCsBmfyEipEpwF
         HFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718378161; x=1718982961;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mHPuM4ujkTNiXqDIHccUGDrfT6731iKfSe0PJxgTmiM=;
        b=XjkHayfp/gxK0Dx5LH+aKDCt2a02tVZoLEYvtx3epg20H+ytCryY2fp9u6TzCeJugC
         sqyS8Za3f6StQpemg/zRJdCw8PDXZ0j8TeDdraDJhewwXncE67S3thBcax9E6efDsJIb
         lsGoEBEpwuP2XZ6+408xWVWWcZL8uHjcj35BBNxi57SViVF5Bsz6aXCgT6IThLwKr+0/
         X2YbHmqb3N//jsWiyUh7lEb2z/1a+tQEz67D0E1NnVP3niMXD//IbY3A0raRaRLYV5GZ
         771zfEMr492s4YaSdpPlJDljBwixV0DDbBQszqV2TkYiN9eZ8QNjSIXTbl7mo672diDM
         mvvg==
X-Gm-Message-State: AOJu0Yz2Y5XeEoNFhxuzA1wiqIiB2g39Iw9qp4MVornaV+CYypsq/2W6
	Za8eTfNSvQWVc0v8GbX1p1sGS5U7WXD7L+JlFPm8TgRR55+MSV3K/2Wy146YbrMD+Ir5DTN5F8j
	8Jw==
X-Google-Smtp-Source: AGHT+IFKIvdPIamcWVj7sl1pHtgnxN9+JPMpgnYU9nJ0W82OOraRH92HNicd4LkutYUqaYREbwJdPrbFqAE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2e0f:b0:705:d750:83f5 with SMTP id
 d2e1a72fcca58-705d7508833mr21600b3a.3.1718378160960; Fri, 14 Jun 2024
 08:16:00 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:15:59 -0700
In-Reply-To: <202406141424.5053d640-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202406141424.5053d640-oliver.sang@intel.com>
Message-ID: <Zmxer_-PSqxisgti@google.com>
Subject: Re: [linux-next:master] [KVM]  377b2f359d: kvm-unit-tests-qemu.vmx.fail
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Yiwei Zhang <zzyiwei@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xiangfei Ma <xiangfeix.ma@intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024, kernel test robot wrote:
> =1B[31mFAIL=1B[0m vmx (65128 tests, 2 unexpected failures, 2 expected fai=
lures, 5 skipped)

This is a known issue, one of the VMX subtests clobbers PAT and causes subs=
equent
subtests to run with UC memory.  I'll sent a pull request to Paolo today.

https://lore.kernel.org/all/20240605224527.2907272-1-seanjc@google.com

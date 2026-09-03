Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA84F6466
	for <oe-lkp@lists.linux.dev>; Thu,  3 Sep 2026 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457993; cv=none; b=Aoy5lmv9P4aLNXsbCKliqPBGdGuphHfkm/BvhEPgj0v+u4BPLFpO96yjdaTqAO/Lo+g0bUCUVDOmjmrs+UHEVPQr/TR6WzENPGPIK1blL7Tb+JWUXMcCDiHW39/u5UmhztmKPuyKcBoWTG5VWD7ru3vybWxBJpbSVp+qze+vsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457993; c=relaxed/simple;
	bh=qmvSYOj93Rj2lnHMFkCIXw86uphqZdKfuXvnifx9U18=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=skUPBvOOQLFEzQ13duFyzWEulsYGhRJakHOy5o0EtWf4GSf5VLAFEPoezGiZXbUn79hTzoWLCt1Y0w9VlkkTfj/8U9bMgQBkt1GyIBfHL6OtaJepI7u2ptp6ZoMzdw3BBy6hKznYdv6KjkmbIINIVg8EOJe5jBmE0ej5F6osXd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJNhVws9; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJNhVws9"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso77411b3a.0
        for <oe-lkp@lists.linux.dev>; Thu, 03 Sep 2026 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788457991; x=1789062791; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yf858VmSM4H/VduQMmnZj+hAnDJWsph1+mnhHN8bJIA=;
        b=BJNhVws9la2Cz2vYaB7DcBhR4M1tXr3DMsYrA5RgroksOp44Q87Nc4Oi2wfW14W2h6
         Ea9NCBMLZIvn1tXgAzeImMjXC6D343goIIjvo+MvrOah1gNLEE6LVlPJzJys5/H9PfgL
         I2yvOMpnNBjbMHKrpUvrmq0pYZawBFpRF9CjL9c3Yq0yeMoBlD/QS+mXB/xE9DfHRSut
         PNBP0ryoZC/bSamWFFcBLL5h8HcSUcl1Rg83BBvgFCh7chY/6AnbzkfKhxODNNjzVkrN
         Nsi7vMmQ4k7lHnT7/VTOY7Uc9TCkk6t+vIAUk420kUPFBHSLpmCbHBz3dS+o2GuGlzGm
         6i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457991; x=1789062791;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yf858VmSM4H/VduQMmnZj+hAnDJWsph1+mnhHN8bJIA=;
        b=Z+5uPp/5IJlc/5FeZFmkaFbknZhK1/amomLpRuTS+mPm8mvUu0LF2MNGlPxg0ZzaBx
         ON23iD5jOHATrrm7EYbi+Q8crlIIs7EyMckGwvXwJOLg15qPmtLL6YQVIiUxjWRQuQUY
         T/RsrIzuM0n62a4WV03UYewWZVS1WYgWdBTMuAioRLczKftrOWEd2OLcjhov4bptZeA7
         hQg4y/MfRSWcRW5EcA4/H1vf+y7dm1VI3U+bzcBeooSOju8ZoHLh8YRqwXhn1ehwgwfS
         yC7p0jZMLPaDq//y2XTiU83A0J783S46M6it/Vs4KRCpqA/PJ/YVTx1IgZyUajdNcF61
         LRYg==
X-Gm-Message-State: AFuF++l3semIAKtqsHcBnc+pW/cigvzsDNFqtS4zHdoNIf+SPeSAuroR
	4e8DtvFu4mmH6cFUql2LY+m8Y8tyH063CxqSZyvCjnbkP4yTGrsFxno1OOUUICryN2XODWAvLTp
	HuMi6Jw==
X-Received: from pfbeq4.prod.google.com ([2002:a05:6a00:37c4:b0:848:487e:d23c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2c97:b0:857:7337:5db9
 with SMTP id d2e1a72fcca58-8616af6486fmr919512b3a.23.1788457991212; Thu, 03
 Sep 2026 10:53:11 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:53:10 -0700
In-Reply-To: <202609030248.b516759d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202609030248.b516759d-lkp@intel.com>
Message-ID: <apm0BpPvMZZWYthw@google.com>
Subject: Re: [sean-jc:x86/evmcs_vmptrldst] [KVM]  7fecb27e8d: bunch of
 kselftests.kvm failures
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Yosry Ahmed <yosry@kernel.org>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 03, 2026, kernel test robot wrote:
> kernel test robot noticed "kselftests.kvm.hyperv_evmcs.fail" on:
> 
> commit: 7fecb27e8d353adda91989eb01b3ae200b846a42 ("KVM: selftests: Always assert that vmwrite() succeeds") https://github.com/sean-jc/linux x86/evmcs_vmptrldst
> 
> in testcase: kselftests
> version: kselftests-x86_64-f5098b6bae76-1_20260727
> with following parameters:
> 
> 	group: kvm
> 
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-14
> test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202609030248.b516759d-lkp@intel.com
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260903/202609030248.b516759d-lkp@intel.com
> 
> Detailed log:
> # selftests: kvm: evmcs_smm_controls_test
> # Random seed: 0x7ad5b4f9
> # 
> # ==== Test Assertion Failure ====
> #   include/x86/vmx.h:434: __vmwrite(encoding, value)
> #   pid=5240 tid=5240 errno=4 - Interrupted system call
> #      1	0x0000000000412f61: assert_on_unhandled_exception at processor.c:781
> #      2	0x0000000000406f86: _vcpu_run at kvm_util.c:1687
> #      3	 (inlined by) vcpu_run at kvm_util.c:1698
> #      4	0x0000000000402cc6: main at evmcs_smm_controls_test.c:93
> #      5	0x00007f0a85d39ca7: ?? ??:0
> #      6	0x00007f0a85d39d64: ?? ??:0
> #      7	0x00000000004030c0: _start at ??:?
> #   vmwrite[0x0] = 0x0 hit VM-Fail

/facepalm

I managed to *repeatedly* not update the repository I was using to build selftests.
Thank you friendly kernel test robot for saving me from major embarassment!

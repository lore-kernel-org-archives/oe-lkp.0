Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47B15B0EC
	for <oe-lkp@lists.linux.dev>; Thu, 26 Jun 2025 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750908797; cv=none; b=d3+jdaYfcR1aXKOeGvHISmJ03ROpmJHJ6ot/LL+1R84AD3YfB0MZ5UTx8zGzKUch7tJOThohkP+gS8j3qYmJhZ43l2JH2n9BP4s9/NNQyDBZb+A9vfsB1au5kr3nSzMOgOfvO4apd5LScWcDEAvjGafA3ixD9j2xAJKV9bfnu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750908797; c=relaxed/simple;
	bh=Bc2g+Qu3c72u4kqoqbEKhlGpqe+fDkexOaK2Un4tJzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdBxGH/2hEA5vIRi9u3jMXm15YTF++AGgP29wRvpwtSbTlpGPWzKWPvm+4GeleLeCT83DhuVtQsniTj1AiHrr/jOBaZR/7VBjERy3zFJHJC1H2oq7y5q9e7bvK1kpz9QnZir560nCmIyxa7zWg2Bh+jpyLryZ+8vtryXqssUPrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=Zdn17Nmf; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="Zdn17Nmf"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bSPQt4NNWz9tn2;
	Thu, 26 Jun 2025 05:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1750908790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Umn1ROjvUXlv/wGvRDtBfHo7v/yJB8VRm6XCMCTobg=;
	b=Zdn17Nmf0RDg7J2Sudpz+52US2tzglAcsLPXE+tbezdAo84N0hOM5kOtNQntgiY7IU2Hsp
	mSH4vRJJHe++YGwSj6XCXx621G8muD+/DFjxr7wQo53MnafeieH1C4UqSO+CLiJtuNYWbu
	K8QXTY7afEkZ5B7YQfqPtpSKV2XO+hEzDBks2WNagCF4wcQBPkcldre6+hP8B3odD8KsXL
	gOFTaZ7VhmQueUKkO2bBuIbaTKEXVkBbL3lulP4/WSVBLmxs3YNIOBY+EYhZjV2xA3MlqW
	suZM0Pi6u1S16D0OEhKK0NnzFyq0vJnStZ4y/sxOADmneu9L+uu+sCkbC1ZJ2w==
Date: Thu, 26 Jun 2025 09:03:01 +0530
From: Brahmajit Das <listout@listout.xyz>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-acpi@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@kernel.org, lenb@kernel.org, 
	lv.zheng@intel.com, kees@kernel.org, rui.zhang@intel.com, len.brown@intel.com
Subject: Re: [PATCH] ACPI / sysfs: Replace deprecated and unsafe functions
 with sysfs_emit
Message-ID: <z7agzq4gie7no2k4qevpt6j2xkefq3xzoi42sy52zger5jazjs@lbwp4qusghgi>
References: <20250624133739.25215-1-listout@listout.xyz>
 <202506261036.895ef959-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202506261036.895ef959-lkp@intel.com>

On 26.06.2025 10:51, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_fs/sysfs/file.c:#sysfs_emit" on:
> 
> commit: 74191212ddb1a82ed54ddd75fcd820f3df79abef ("[PATCH] ACPI / sysfs: Replace deprecated and unsafe functions with sysfs_emit")
> url: https://github.com/intel-lab-lkp/linux/commits/Brahmajit-Das/ACPI-sysfs-Replace-deprecated-and-unsafe-functions-with-sysfs_emit/20250624-213919
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
> patch link: https://lore.kernel.org/all/20250624133739.25215-1-listout@listout.xyz/
> patch subject: [PATCH] ACPI / sysfs: Replace deprecated and unsafe functions with sysfs_emit
> 

Please do not use this patch.
-- 
Regards,
listout

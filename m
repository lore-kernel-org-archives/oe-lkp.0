Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED511E1A17
	for <oe-lkp@lists.linux.dev>; Thu, 27 Nov 2025 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208258; cv=none; b=YA29c5o4r6TM3hVzN9XothelROfKzWCZpQpIlTZCfTyCYLTnmaYikpxE0vqLvV+OZdCrU9Mp0x0IKS1kw7JZ7Ni4oNONeCgeYsQ81LHF023/Jek7xZPFcHu5jZ9hvQqZ3XjJQ1so4Ltsm4XFHZLJKs6mQF184oM0yhIBK+W30Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208258; c=relaxed/simple;
	bh=ZdmqS9hhrfqhIWJ7RxVbgZ4nHksmwGAq7i7nhI9kZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncxlF1y0oeViP/LiMIfCTSbrgX00qKAh0K4NN8k4ynEsEAVDYdneZXzxbgOoMjUSm6ACdXq2Hwu8boFjXfDEchkaPwmyEvRbN1dLfKBi3QnhfYWtY6ZFJxRNWnrhWmeCNr63RbArpFPJIjuIwmtDnUkmTFoP2+oH0ap1i5j1u+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f6V7bhPI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f6V7bhPI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso8227665e9.0
        for <oe-lkp@lists.linux.dev>; Wed, 26 Nov 2025 17:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764208254; x=1764813054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7f/NGt9PhiKtLJCrxLaPZKHO0hccYH7c0Hd/TG5qT70=;
        b=f6V7bhPIgtIf+qsX/n1aLiH1QYPZOtcOPpJIzfGAcMUq+BIKRfNgz8BRptrBI1+Bbz
         o69Pm1ZfgOQaCxFhmZXd1zQ9lRHP3WQt8SJ3qCAITRh6ub9daFtIEH4jSHFyFf8rYMTo
         sB/6xRO7owdKVl6syTuXDwaU8/pVMkfEZbOerK66hj+ocDumnt/pyI1ZCafGWP26a1xP
         +Og+RVQ4wSAIBL3VoKq8OV5+YajBtQW/IM0vAe4zp81cJHfIVWqpT16u14WPtUUdWjjq
         hWk4Dx+zB5pY4mW4Sn/Sm/XJUTLfUn5Sp6o8JZF0sGFDZbk4Oa05PeWtMWDeRLudDVFK
         2ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764208254; x=1764813054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7f/NGt9PhiKtLJCrxLaPZKHO0hccYH7c0Hd/TG5qT70=;
        b=In9JdXDWo/Wn9xgj88/T4tpIhS64Dg7UVFdY6fAcMgjzc5cA8yyLcwncvVvBvV5dGs
         7FQUFCKfosTzk+QQG88LvYH6AWwpu0FtKX2W3IAzhM2RH/UlOfmN3da/8Opf3/DrO9SP
         Zc6eyk480imcXjCWZ9G/GeaLeEcBrkQQOop4/wBEA0Lm1D/C7S+7s7BGeC/+Ah+ZBvcO
         /NIxqaDzsZeEHHpuI9giZLXZg+9rNwm4SCimMyp1J+no1Vq6J4ubh1zqJWpGdcNL/axV
         ATm8UP07k2LtkMqdQCtMyH2aGaosylcMYWXdP0h+bJnpLthhtsVKUGdbew3/w9/b6/oe
         RgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs6zW/9kWz2amtN0grwswAhn/RqnXIK6iwENY88i3yPXeHWnb2O519JraRddd+pppR7HYB4vA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8g2Smphkil10PFnzktBxvnHQ4rfC6QKYaAKaWyEqBchctpAgH
	5+DE2upd8drSZ+Pg9wH4aS0VPhwIqY03Bfzx5cs9w/30JeTa8xWKo0ZsaLM/rej8R2lzW5oi9dB
	1ww4=
X-Gm-Gg: ASbGncvLFwsj7N0a2woCskDGq1p4v+RvP4zx1pOGqgDvLFlb032k2tT9qUjnPSTayKU
	TloZZc3Cteyhk9QXTWZuRNr0vvZmgZIDb64C0C1rQx9dJXUKwoDq7X8orgjES7iOsKJEz99byLG
	LgxtppOCl0GOeOcTGlndqU2kWppydHagjzxq+ImeeUYpsWmyGikSzWxKvtfK/nmntWz+9MKFc6k
	WpyZKrVraHRB6k+BWpD5DndKgvvZ8gwGjD9qRO0akVN9bHBl1lwwHIyz4QI7aLHzH97L91POEuj
	I0tbZK+56T8SSExv92EzlbmPVAHLuS7w3pHWByrOJzuA9X4keVh84rMvH/kc1O/F0mvRnqjm/ol
	NUKxpP7dEJCn6rWUG7OEGCcXPI22O3q6kWLdC1xNkxw/B0lKlTPU+1K0VVuMFa2H07I5jmK5XW6
	X5A5JYT+/8d0/V95KWRBHiZL2qpAdG
X-Google-Smtp-Source: AGHT+IGqCP3dOwbVcqjH02MwzgXNn1K1WcY5QlK3LzfxtqgvJWUDJ6ePKE/B0PPmZH/5i943qt1wYA==
X-Received: by 2002:a05:600c:3ba7:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-477c05139c2mr280548915e9.11.1764208254168;
        Wed, 26 Nov 2025 17:50:54 -0800 (PST)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm5285835e9.5.2025.11.26.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 17:50:53 -0800 (PST)
Date: Thu, 27 Nov 2025 01:50:51 +0000
From: Wei Gao <wegao@suse.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Andrei Vagin <avagin@google.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev,
	ltp@lists.linux.it
Subject: Re: [LTP] [linus:master] [fs/namespace] 78f0e33cd6:
 ltp.listmount04.fail
Message-ID: <aSeue5UPBm3QGH8-@autotest-wegao.qe.prg2.suse.org>
References: <202511251629.ccc5680d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511251629.ccc5680d-lkp@intel.com>

On Tue, Nov 25, 2025 at 04:33:35PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "ltp.listmount04.fail" on:
> 
> commit: 78f0e33cd6c939a555aa80dbed2fec6b333a7660 ("fs/namespace: correctly handle errors returned by grab_requested_mnt_ns")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on      linus/master fd95357fd8c6778ac7dea6c57a19b8b182b6e91f]
> [test failed on linux-next/master d724c6f85e80a23ed46b7ebc6e38b527c09d64f5]
> 
> in testcase: ltp
> version: 
> with following parameters:
> 
> 	disk: 1SSD
> 	fs: btrfs
> 	test: syscalls-06/listmount04
> 
> 
> 
LTP patch:
https://patchwork.ozlabs.org/project/ltp/patch/20251127143959.9416-1-wegao@suse.com/

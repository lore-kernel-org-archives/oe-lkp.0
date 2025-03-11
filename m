Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDB825BAB1
	for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741724807; cv=none; b=gHDPXF2xB4JmjkAw4JKRksF1Qsay+TA5RXrTdd2GviLyhkWucrrN4sLCAEtj7J8iyrsclE2OwCoxmxX2d5LZ8oD/UxpwzXznKzmSGqZ6PToFVjYPkAjLd6NtwmSgrHsNu3f7/QtvfgGG5Jk8zHm1YD2HxUj+uBUwsVfskSutZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741724807; c=relaxed/simple;
	bh=m50ftLv102iZ+oXasLDGl0g4wrXDjViIEYK+5Alcy+E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPdP/NjCa3TjeZXCXzilB7eGUKkGVz2H1fL5wuiwK7mfbTGSsPY0E2AMg6bcgWUwN0hWzpDvTxzsklX26ageFwRrdZubJ/qsT1HW9MtG2uOWrkujTT9q5Lw1KQFWCGq60uZgrRxEXoQ//Lkte7q7pSknKbg+tllygxHq+aQ2Tzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8ZCVsFH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8ZCVsFH"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so65783691fa.0
        for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741724803; x=1742329603; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AahSKJVgI/pi08MdkK0DJyWDSRLW4fh2EkDnIVgqOZE=;
        b=O8ZCVsFHADgWBVdcGcMufqPbgXUlLQmfuo5azXswa4lf8Yp3kCF1J//TYmKhsuGog2
         RvW70btiwPmlhudcmTXZsbDtZO7nHzLc5MHX43bCfgdbVox0TeAcgPZBucWdhK9XoRPk
         r9iI+XdPpthMN9NxDN8L3aae/nqyS6MM56bcQtuphQfIl48ibklKEIkskTWB87Ir5NXp
         aiikAXBPA0zT5FRz2uvErrSWNEken0Aare4/JpXWR5zr3EgTRydnWYmbMret5yUjMOHR
         VAgQPmZA/tjFWkgbb0HVoc/aPHXtqyeF9SNZIV7Qjxyjn+fGU38KzjZoLHFS3alyjr4Y
         nW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741724803; x=1742329603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AahSKJVgI/pi08MdkK0DJyWDSRLW4fh2EkDnIVgqOZE=;
        b=ihbOc6KjpI83RrQZeg5FlFom8j5uBhhenAw+AhtnDS/ZUP2B6WxqCVHL8l/+QnWcgK
         BdRKVH1WU50ccED17Zh9QL1iO+p8Rjq8tI8sPMwKwjDorArJq20xVIQsJD/JfHyxifpx
         CnD72y9wulWZbLI3+Q0Ev7HCgizyf1GTE/fScpeG2tNWogi2ZUe+Gl5DUdnqjB2Aotx0
         lognDx/bWcSpxOGJMcIB/cozW8c18eniyTY1OwYPAuFJ/cGRq1hbhCnlAZhFzhqKeJnq
         sJpCT1ciBwHHwMqMcH02T7M9puTvCuusFoJ4DSU97Q/MOrhSfL3y5aI2ooSsIzfuhjqz
         8Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCVmcVibSj4bJR5rj9DDbDLrK/GKrunpZ6XbvHvdw7crGQFtZgrlFFAaS9XLU3hdn6kIyllu/40=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlugECLmq7CX1RbzY4mM5+dT8KmaoDDNrV9EuBs3TIw7GsjnbV
	PCov90QBtTZHD71X6/lIHdV39VahDNkAh8xvsiZP4+WdYd/+scQ3
X-Gm-Gg: ASbGncvRsiKWOhinTnLcoHcYh9yjt5ZpxP2SFYDHgS3ohknRZ8+FW6unRs9SugEdc0W
	3GGug9f3JYVUe7/Z5k/gMILRlh6w/gXioGDyI5pHCkP+ZKvo0K02G2uXCGGdHSH8Qj/oB1Fmx9O
	XSunHmHggqlbRR9TKAshdO2zwT5TxMFJQ6r3ZdbGlsmDD6rN/2jGVh4Q1lutEbSxpQ/bVz40zLN
	E2Yitmrn4HcRcPU7sB5Q4WDTm4p0ShI2U3aXUsvitKlsVJvEdhbD8BbYXJ06Dit86MTOeEXPCZO
	dr/i4vqJFCI=
X-Google-Smtp-Source: AGHT+IEH2DE5DnmsyAIiy3U/MIxWnrBXiXqD0KluC3NvZJc3U+m2N4UXxe7iAtAZL/xvbs5abc+q6A==
X-Received: by 2002:a05:651c:198a:b0:308:e5e8:9d4c with SMTP id 38308e7fff4ca-30bf46071f4mr60240811fa.28.1741724803202;
        Tue, 11 Mar 2025 13:26:43 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfead2e76sm15709241fa.7.2025.03.11.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 13:26:42 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 11 Mar 2025 21:26:41 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, liuye <liuye@kylinos.cn>,
	oe-lkp@lists.linux.dev, lkp@intel.com,
	Christop Hellwig <hch@infradead.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/vmalloc] ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-ID: <Z9CcgQYZdzHXKRoT@pc636>
References: <202503101629.7289b1-lkp@intel.com>
 <Z88Y4KcvjcskC5TW@pc636>
 <e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>
 <Z9APeowHOXe-MkV2@pc636>
 <Z9AwAKYI92AgIJ8M@pc636>
 <20250311111828.10b30576b9392e56d2c3f963@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311111828.10b30576b9392e56d2c3f963@linux-foundation.org>

On Tue, Mar 11, 2025 at 11:18:28AM -0700, Andrew Morton wrote:
> On Tue, 11 Mar 2025 13:43:44 +0100 Uladzislau Rezki <urezki@gmail.com> wrote:
> 
> > > > >> config: x86_64-randconfig-101-20250306
> > > > >> compiler: gcc-12
> > > > >> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > > > >>
> > > > >> (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > > >>
> > >
> > Could you please share your view what we should do with the patch in
> > question? I mean we can drop it, since it is broken and there is also
> > another option - it is to fix the broken patch.
> 
> I dropped it.  This can be addressed in the next version, if there is one.
>
Thank you!

--
Uladzislau Rezki

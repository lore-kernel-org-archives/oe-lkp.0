Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471D27A93B
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409262; cv=none; b=e0St48ia4e+hf1Q5dYmajVhOKhpnWkkIf6zQnm5eImef7p4Ip+RMLO80l0WYTeJO4c83r8D7RKNe+aLUvmz9q2ozppCuePm7uHgDOEKK4LolUYy8lIFoZWJrd99U3qsqP6GaOwnc5Gf3aL046zvM9EpaPC8kldbHdSfmn6BWMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409262; c=relaxed/simple;
	bh=SGobpLuVUs7D23HfBqLMyecSiLQVVDb3avZcnsTrn9o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAXutLXf1ktkb2ehrGpcnIgYxj49xc/vGMcXN2ykJdI/i3CT08yd8xCxDKl/0wJhMf6lTreQ64T4/X7VC5D9iFOyYozvNUNXEIJ/a21h4Fzy0ogctQPfnc1qWgFZnlgYP5T7fmr7M+wd9fEAOCQYNZ/Jm2bJdqp6bBDiQXoor10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPGZA2iU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPGZA2iU"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1866805e87.1
        for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750409259; x=1751014059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NaWs4xvvPpeaCjJCWs098f2+kCHkcJzonLJVPQ9irHg=;
        b=kPGZA2iUx/hCAgZVUbSoHGUAFi7fgcHpfyAJONAZqr9Izn+lQ6srxBhSHvd0GNy42d
         WyOkvuNhNvBiE9BfGHPZtaDj/s5ksAO/OKXQnvtwJS4FhkuothJwNe3tsf89MyxJDnDx
         9eKsdJCzvuC+nr1LtF70S3KydujHSZwlkXo1jJWIulpWDZLF7XLmhQ+iMGTC4Uan95z7
         H8xBR7KaRfRy+Q+E30zfUF3iEkBy1H2nXdYZE0FX5e5jF2P/SQOX9OsDRzSJ1nRnq/83
         pNZcSc/idJkpJYsMvKqZ4bJS1L+qiAJEuCDa/P8OSA6+O8plNxWSYuFrvlBmInX03VN7
         8JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409259; x=1751014059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaWs4xvvPpeaCjJCWs098f2+kCHkcJzonLJVPQ9irHg=;
        b=mpiHrQWLR0IpggFNdNXGXPUWT+6CWaFhDO60XuX5AZB/49CPDmHzO0AF/h/9M3McAG
         R03aHLCjxvgTPnCQO6Oy2+xkxpYBJZJbuIyVca6TQvx1L+e1gpn8rOwGKplV8Uk7riUH
         l2uFMECL33Jeq+1dPGUZoz8K9k8NW7wEfYjrPVBgop4I+UVRp0OqeGWuxWMckiOMuDwP
         oNcBYf5oXbECrtRPV65oC/T4hQqVcqM25c2cqyWcclZ5Qyu42/k8wozAahzNSsFj3B2T
         J/VoQ+KgLy0cPpTD1clcbfcxCDjFZJzKNuFbfllgeqoJcXRGuQkbCl//sRuSADvEpUyB
         h9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2hCepy07eSWVe/foNZOet/KzSP+CtDu6NJquy0bGtRq52w7DnJkgQkAVs+bsd4YLky1ce0bU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAbFHoCDDlFk1DoeSbfGEg4bQhYiINgQrPhdpDRJ+f17h1tb/I
	lzFP7O8Q9ZYLtSMXFzPXTx0x0QGDL4s+3zYOG7UG5JRixEIutM4sDdsL
X-Gm-Gg: ASbGncsLlnTADvt6eQSCVm4Cap1wDeFNXx8Uiw8egwoV2ndnnhf//uiWYxc1SFOTsT3
	/UcKN4snvd3BGOyNE6Q36jHUliUpPhrTb/w4IO83kAe9WELGMD4uU56y+vt9BkFa2LJcCeeZ41D
	Kk8fhDGCEIq0ooOAKEFFGnr1q2yyqN+8E7K5RzI/28d/BxeYHCQUKXi0n/cOW4dwAJHoVGb9kFK
	xQhpzC8pSL9DZvE1Mh4i2Ded5nQqiyXkYskqo252LpTIVswNeNhORqgh/E9fGVNnH3q6n7lfO0N
	rSiOlhscQ/0uQjaCV33Eh8Ql4xtdShl/7mckuypk/pbh8aQF3/wswHKqoU3f5vkqBz099+RClfa
	88bbCwcZFNjsiFxg3
X-Google-Smtp-Source: AGHT+IFOvPmfqOBZOG5VL73wW51rn1KE6VYniA2GZLKFP8gJr25s/3ya10MiUT7/JdsCkGykUpR+/A==
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id 2adb3069b0e04-553e3ba865emr810575e87.17.1750409258480;
        Fri, 20 Jun 2025 01:47:38 -0700 (PDT)
Received: from pc636 (host-95-193-182-189.mobileonline.telia.com. [95.193.182.189])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d73f9sm204956e87.252.2025.06.20.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:47:37 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 20 Jun 2025 10:47:34 +0200
To: Harry Yoo <harry.yoo@oracle.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Adrian Huang <ahuang12@lenovo.com>,
	Christop Hellwig <hch@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
	Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFUgJgrc_eIHRy5-@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <aFQaY4Bxle8-GT6O@harry>
 <aFQnEj0UASzl2Lxa@hyeyoo>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQnEj0UASzl2Lxa@hyeyoo>

On Fri, Jun 20, 2025 at 12:04:50AM +0900, Harry Yoo wrote:
> On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > 
> > > Hello,
> > > 
> > > for this change, we reported
> > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > in
> > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > 
> > > at that time, we made some tests with x86_64 config which runs well.
> > > 
> > > now we noticed the commit is in mainline now.
> > 
> > (Re-sending due to not Ccing people and the list...)
> > 
> > Hi, I'm facing the same error on my testing environment.
> 
> I should have clarified that the reason the kernel failed to allocate
> memory on my machine was due to running out of memory, not because of the
> vmalloc test module.
> 
> But based on the fact that the test case (align_shift_alloc_test) is
> expected to fail, the issue here is not memory allocation failure
> itself, but rather that the kernel crashes when the allocation fails.
> 
It looks someone tries to test the CONFIG_TEST_VMALLOC=y as built-in
approach test-cases. Yes, it will trigger a lot of warnings as some
use cases are supposed to be failed. This will trigger a lot of kernel
warnings which can be considered by test-robot or people as problem.

In this case i can exclude those use cases or even not run at all unless
boot-parameters properly sets if built-in.

--
Uladzislau Rezki

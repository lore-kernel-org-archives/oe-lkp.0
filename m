Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26024A05
	for <oe-lkp@lists.linux.dev>; Thu, 16 Jan 2025 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020161; cv=none; b=K/VZ/a7DFIrJdUoEAJwsR9NMpW6CmS0LXRdPwV+/0cl9lDS3KP46M3CnGC3wGQfn/wJgwkrqhocYiWnlRhl9bbq/ybXJr6ESMbQVTEc+sUcAYRm81ACK824+IcNTHAUgLW8rlO6CkJHnBrNrCLVaHwyDNWbaB53q5U+4Lx0iCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020161; c=relaxed/simple;
	bh=qNCrKkINH3eN8H0PdAAPZDPDSrVWUy/f5GPyB19BZmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8n6NTKC5ByOh3j2ZhjjTg5QdVkD3pmEqgdU3Mx6vTpYvFm1tMbhyhGgWMjHTZ8cpXBUWHGwroJyET+rn8tVHxSJVx3461p01vRoBdbJ3hyUPSmL6uBgJ0eZ6eXsI19Q5ZmzeWMj3uSvXa33UPWcBok3z6E97/BFc6lSW5AsaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso111806566b.2
        for <oe-lkp@lists.linux.dev>; Thu, 16 Jan 2025 01:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020158; x=1737624958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZw6tEH8ZaJV6zFkhXU9f3b/ffuWvIQ/M+PHpA7VL7s=;
        b=SZ871/SJhSEg508j3z3Vhr60CKOY8Wkt0Xdt+ac46ULTlypW9Jl9PoN17qiiJrf1rk
         LIxKwMzPKc2ITeXNtzw/RUM9Q/rGnlZouw5XoQ7c7pe788RhLnoGPhd4Nj73rXuGm1p9
         e4RS6E8fxPisLWuHbtnTBdkUE6tKTJ1Vn2QVuEV89jF9nEIJrgB9SMWbkx/mqcpjZgdS
         8D8ERPXBfy2pgdVi+4ANoVe3jehEzlWhWAhqOUA8FZRVcDxVjC8f1se0C8qiADxQpZUR
         kuIqG5I5FxRp3fqeMaz3PM5wdQDB38hX/gdPnXnMnyg5+DhS9kF4mvlowLEBBCvZUFl4
         0Shw==
X-Gm-Message-State: AOJu0Yy/Ys67U9G9MW342UQz/aJ/KXxDWyk8SBiqo8799CXjS9hq9JhC
	5/ag3+TfL2tEvlXm2q4veyg/rOw0JhYbWuTQyesPTBPOyCmN7ulH
X-Gm-Gg: ASbGncub5cTGWLoLwrqap/zFz75fxX7HxVq9UMdsYD1Ywaq7m8YhuiWF0D28+tQwDZk
	lfEzbW057JNtIqExuz03CLStej10K2P91KYtB6pboa7mMg+tHzHORo/1z45HDERGXvmE4+Ibe7s
	h8Nu7zTa5x7Mxc0Qd9Fi1GGcRJKRiEWQOxK8R9d2h747aQSidHVmN3d40fWO/iuXiHqN2f8c8My
	CNqSnpuCkfVn3Dk1mM+IcfqQ/85jxNg4FvzZYn6Rgsy1u0=
X-Google-Smtp-Source: AGHT+IFVPMOtw4kf6s6wse3Ocg01Zwg4InWz3KmGzO4AJAmV3tsR3Sd9pL6Mu+jlBDY5BDZY/a4Thg==
X-Received: by 2002:a05:6402:35ca:b0:5d0:d818:559d with SMTP id 4fb4d7f45d1cf-5d972e0b955mr633223a12.11.1737020158123;
        Thu, 16 Jan 2025 01:35:58 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9064070sm883891366b.37.2025.01.16.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:35:57 -0800 (PST)
Date: Thu, 16 Jan 2025 01:35:55 -0800
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>,
	netdev@vger.kernel.org
Subject: Re: [linux-next:master] [rhashtable]  e1d3422c95:
 xfstests.generic.417.fail
Message-ID: <20250116-expert-stimulating-chicken-e1ef07@leitao>
References: <202501161047.39c960cb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501161047.39c960cb-lkp@intel.com>

On Thu, Jan 16, 2025 at 01:15:21PM +0800, kernel test robot wrote:
> 
> hi, Breno Leitao,
> 
> FYI. we noticed this commit is in linux-next/master. now we noticed some
> xfstests tests failed randomly while pass on parent.
> 
> xfstests.generic.417 seems have higher rate to fail.
> we also noticed a "Corruption of in-memory data" while running this case.

Thanks for the report. This is a real issue and there is a fix under
review now:

https://lore.kernel.org/all/Z4XWx5X0doetOJni@gondor.apana.org.au/


--breno

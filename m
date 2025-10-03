Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B981B6D06
	for <oe-lkp@lists.linux.dev>; Fri,  3 Oct 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759498722; cv=none; b=qURoGmcLpZZObIJI01iOIqG6oTXDFeVgT0CiFN3z3/JCrF2YHC6GobkmyHqGZz5NRstzuqyYW/lfF2KDQTRgYeUaTruZQDyvw+YMC1KuCd052i5BtH/GeodqYvO5DgWgY3McZ4PMC4BhQQWx66maeRO33sro1piS4iWZhUyV2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759498722; c=relaxed/simple;
	bh=HchU8f4EgzCIclHzMtEp4ytQk6iEU1OkJuge3NDZgkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK+RHz3olVeADc/B4vPr74BePgUOdRkVL4UJBjk2pr9qbsI4FJCLdTc17aIOoeFdZ4Gtjvzl0t7nLjzJ1d787pqzjNjnJ5j2umGZRUPWhQ/v76+OxaenwytYQLsDrCQCeVdtFwf4mYRhka2Jh5pJu60NpZd8kbZdwsNzej4SqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGCYct95; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGCYct95"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so13837925e9.1
        for <oe-lkp@lists.linux.dev>; Fri, 03 Oct 2025 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759498719; x=1760103519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zjd42OOVf+WajS57RrAMPmwuVCYgfRwVOtOJ5YCKMLU=;
        b=hGCYct95Ncl6HtgB7p5X7BkrFLGOE60qHQKA7xFAXL+jb+0KtpOTKX0gJ7CWVFGAnQ
         ygdBI8xhZKdjCPPLwuzQLzpE3HegfM+2Z5HW4Z2regxyhxxOhMUZQHZ4JXKOpt1eJT7r
         FnHALBp/CfuTbdZl2biep5aeUunx0h23Y73sr8ik9qgRK9Zm7uT337jWpajxaJkT41p2
         LbzP5B94skwmLKSgCBWI+0MRs7rASYRgoew4wiFYFqA7RXqm5cKE8EyqAN5LLx9+0NIi
         rk/IrFyDEp87fBWbxMepOdCk7JwLB/7eWxrZVgUl6iHyWPBR6U52E1qkzqbzL+YCZEAD
         HZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498719; x=1760103519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjd42OOVf+WajS57RrAMPmwuVCYgfRwVOtOJ5YCKMLU=;
        b=bcUoZzEM9deEmnkpQU7SOQcRQGinxwC9dR/MpW9oFpvWle+4SROAXo+gD0apyp2B9G
         nUycJ9XIeXIXj3JsRyEaVfrFyqslNnolZQ9gNdf//wPU6Iz2qIshDwNmfXibJxtIHolG
         YcYLxGFyu9soeMjX40IZGtn+gFBbfXSRNloFRmyMjq0oI2OlFavQbEDiSjZwhNZCP9nl
         Gjtf15XVGXiVUuYAD5R03T3fup2irXd4TNxnweahszWyyu3xZqxPrhH/DLoLi3NLydsc
         DnGaCJN8J/V+g4J0cEi5bblvD7t8sJcz2qLrJc0HBrycxt0OSsMbNVxOsXuRIxfDmznw
         jnFA==
X-Forwarded-Encrypted: i=1; AJvYcCVXS0mFlVaKkx087lStkgfhdeZ7+lymF0ZUELSN0yVh2iYp51YNvzSXZJQrnrJSVDNywS8jO2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsipCgHopnQzDOXgPAZZTNUjhqbHyVF/wvSU80EovRqaWwBp0n
	6oGXNX7OLCAYZjzRVxheRPfZhxl4cxAwUF+lMoUxoHaD29w2iRR3WTyf
X-Gm-Gg: ASbGncu4oP+5c7aZHtdo0OjpUQ+trXQBN4YcXx3tKeHnCTbv5Ee2KU7UmQKwbvN6GhQ
	niqzIhAJa2EsbHZM+omgoPcf2nDSE0DTzhWUXdfLDEjyidVA8Y0HWQRLaKR4mzJREqjgHNWKhbo
	5E9e8yLO2x6q8wMolvL12toZwM68O/DxvwtilOIKtagPXWbC1Xd//gohbqk6JbIcsJ701Jh/DX7
	eEVydYNfnv5dgt3YOZh4eUpD3XDfsRFwj1Kjo6wHKwsSuY6mB8/G26p7fPnowUo7excOiKgvwi8
	JOHZp1EOFprAbKfOvgejBlJFyMwoGw7ICH2wH5tZWFxSIA9M5SUyRmP5VuX3Ajgr8lXGvb4jrhz
	VN7FVmHQv5ZdF7zXbE5/sBbRWKP23cbM3IaZzAM4mHjWfRD0yav6UVMjsauzGo73361iot1Gjiw
	mh0B7R9hCBgwQcxsgb
X-Google-Smtp-Source: AGHT+IE2d2+VTZ/oWXOczMKDIO72TpVL76DePnGYNZ6TZ9XC7xNSiQbSXq1QW7v89ZQFfAk81Twbfw==
X-Received: by 2002:a05:600c:1f8d:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-46e71145d77mr24764275e9.25.1759498719134;
        Fri, 03 Oct 2025 06:38:39 -0700 (PDT)
Received: from f (cst-prg-21-74.cust.vodafone.cz. [46.135.21.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a020a3sm130655105e9.10.2025.10.03.06.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:38:38 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:38:28 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <oliver.sang@intel.com>, 
	Dave Chinner <dchinner@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-xfs@vger.kernel.org
Subject: Re: [linus:master] [xfs]  c91d38b57f:  stress-ng.chown.ops_per_sec
 70.2% improvement
Message-ID: <nfqwkcdbd5xawykrtb5nrhvmpfimtry6qyuig5p7qmlehc7itl@utic4l437gwn>
References: <202510020917.2ead7cfe-lkp@intel.com>
 <20251003075615.GA13238@lst.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251003075615.GA13238@lst.de>

On Fri, Oct 03, 2025 at 09:56:15AM +0200, Christoph Hellwig wrote:
> On Thu, Oct 02, 2025 at 04:11:29PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 70.2% improvement of stress-ng.chown.ops_per_sec on:
> 
> I wonder what stress-ng shown is doing, because unless it is mixing fsync
> and ilock-heavy operations on the same node this would be highly
> unexpected.
> 

According to my strace there is no fsync, instead all of the worker
threads are issuing chown, lchown and fchown on the same inode.

As far as *benchmarking* goes this is useless.

Note stress-ng does not claim to be a benchmarking suite, but a stress
test suite which can also report ops/s for whatever it did.

This bit does not look particularly useful for stress testing either tbh.

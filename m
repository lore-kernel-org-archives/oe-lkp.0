Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9423FA5CD
	for <oe-lkp@lists.linux.dev>; Tue, 28 Apr 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377894; cv=none; b=L9gMVwTj5TGr+6fHmpReLnqXdyUlNzJhkMvY+CHVbPWMBt65kEffplp9csf2b4jT4zN5bcS+Gt6YmhdQB6Q28Mq96LMBCT+p0QMCOTkSDqtLM7bRNllOpV3OODpUSuaesutzV5BYYmqrYeeMMK492gxGDwm3tF8jWuWtqqwbxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377894; c=relaxed/simple;
	bh=Qe8lH81+TFQrJm8oLahDMI0BulLsED2wmMMfGVxRDrs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ci7pU5n5ZdOBLmY8G500Uxklt0ZQRPxmVHM0PqYd2rQo88osNxTGaQK/1qmEn/OhqDcMRlwgRLcQciEIiMhzkTSW7gNUBdmVevRNg8zJIbPhkRiOSOjZtVIkfGnKaUWHYzY3n5Y9derbBHmN/R/sqW/3nGv/o0Mhfffp9Yt0kI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSngqXxk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSngqXxk"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a337552604so10408972e87.2
        for <oe-lkp@lists.linux.dev>; Tue, 28 Apr 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377886; x=1777982686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8ao8CvWAerDIeNFQGwuEph7L8QgC5GvfoBjZJNskVw=;
        b=nSngqXxkkKq8Y0i1J63ZC90X9vBR4CKO5yF8Op/VnAWjtr0bghFGw0oY1oD9MLMUOb
         8iS9Mm1Dwb97yy4LxFHJPyHFCs325nJSTBhAA1mOAXv1mhYNououPiL1G/KTPv+qiVmF
         WYxjRbVBwc5RSci+7WkQBFW9/FHcg8UM/Z13DqPfzrfp218IfA0JEcSJcjlrHVeAD3EE
         Z6mSFGY1csCrSwcdBkgGiJgHOl7NL7n/dKvqx5ZEqBu/w9b0Zn2nBMegFK/bGM5AZLaD
         9CC9cnM/7yQI26LJ7H24NqQqdJsEhBCp21gEPC5f9lrk7rGyg2iVK9k2PHuAgeWE4ZvT
         KYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377886; x=1777982686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8ao8CvWAerDIeNFQGwuEph7L8QgC5GvfoBjZJNskVw=;
        b=dhsirLBW9vSwRAHJLMzFuSQwSwb70mp+ddFkMzoXJLEr9KzQPbccdQaU2/pQD6LeF0
         UROpznUuJrR/0KvdLTywt6rKqLCa4pKZ13H9S4lQSvq3juJjVrQTtd/zc/J/81H8/Rqn
         oCGTJSAspX0X0FFP1FVbAGc725cGTAkS+mZVuCYZAUqfsMUNP72jrroyR26aiEtxmEtm
         r1+WhCgkD6OGC+aVbw9VeYleKU14QYb/fi4WMou+hiQzp7fhGKDqYAozO4HWBBFXFM7d
         jorOvUARvXxR7qPGPgsbrsbuZwCY/EyEth34tLfDZT5L5f5vJ+Y/Ra3sszf4ky1CZoFF
         BNjg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZMJIgP/Suh2f1/GNyIId3ZqFjZ5q6NYUfLa62RHGuVbx4NnYNinWlFCLLyk8Xa/pawHKtCh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCUqmhW68/tGTXt+9h57MjhfpU0WiMg63dDMYFjMEGBpYqiIk1
	hBWD0xV6HBuTkEx1z23FxuwDAE6Mb8pN12RMv77LbdQ4znkT+ZiTzJ5k
X-Gm-Gg: AeBDietykWKS4L5XfCCXvDHVsnOjPySwMUcWuj8YaI0N6fQ8V+3PPFDqNLG5e9KjguR
	nv/gCg99sqBD19DTaj22PZ726X2Acaqp4s2jo6geaM0C0HRMUU5mkHeP84AibgG4IP7gMUUvrlt
	WblZEoH5WXNTQvc1Q25qyOzkXTLiMIciaVuoWOz0VtEuUaNDOulha2dYPMdqBTT6Mcy0yZl287Z
	XBrv/jgiT6r70t3z/JWL3FmpYmiE/Myhlyk0aTzHFmkuRSZfUv9OPvuFesdUWO6Dtp/E+QNGCC5
	gh/LK+Isg/LvznUmPtNF9wizmaXg4Ye8Q2LlujeWtPXrk/csNyKEngFEwlGsb2Ubp9XtMtyCqhr
	gRi9YEKHYuVmFZzum3H4J1pyRiflSK3yV/NgcEKp59n8l3icpApyc+XUkrtFbHYpASPbCYm0Uqy
	n5fDJxQe2jRg==
X-Received: by 2002:a05:6512:2256:b0:5a4:1a2:1d39 with SMTP id 2adb3069b0e04-5a7464108a0mr1125592e87.6.1777377885750;
        Tue, 28 Apr 2026 05:04:45 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5e38sm572663e87.52.2026.04.28.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:04:45 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 28 Apr 2026 14:04:43 +0200
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, Vlastimil Babka <vbabka@suse.com>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm] c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <afCiWw1Wb9zDBdOV@milan>
References: <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
 <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
 <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com>
 <ae9wFZp7dS8QF8br@milan>
 <6cae0418-eabe-4864-b87f-b1f953de06b0@suse.com>
 <ae-MdIOcSkfphbHM@milan>
 <afANly2Br1kIBPOs@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afANly2Br1kIBPOs@gondor.apana.org.au>

On Tue, Apr 28, 2026 at 09:29:59AM +0800, Herbert Xu wrote:
> On Mon, Apr 27, 2026 at 06:19:00PM +0200, Uladzislau Rezki wrote:
> >
> > Like below:
> > 
> > rhashtable_try_insert()
> >   rhashtable_insert_rehash()
> >     bucket_table_free_atomic(new_tbl);
> > 
> > the patch for rhashtable.c can look like:
> > 
> > <snip>
> 
> If you want to send that as a submission you can add my ack:
> 
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> Alternatively, could you send both patches to linux-crypto and
> I can push them through my tree.
> 
I will send out to the linux-crypto mailing list.

--
Uladzislau Rezki

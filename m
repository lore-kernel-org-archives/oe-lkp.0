Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2B1F7586
	for <oe-lkp@lists.linux.dev>; Fri, 27 Dec 2024 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318144; cv=none; b=n/shE3GDXgC0in+9pDur32WgdGYQZuc2TnSltbylyo6YzF2CegDpqF7bxrkq5fFsiZqpTUqSrYrSJuaz6j1jraiEVUvUaq8oGIBETQfGiIO94ATXlkkx/KEVssaDvalANtsWGVR0hNIQk0/T5wW2uQhd7jswIupyqGhHw/Ccd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318144; c=relaxed/simple;
	bh=cUbRlrmJaDowA3+0e/GzX0odLxp4ii45ascWC52bCfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n13USgOuHsdjiaMCNX9b1HuIjLEaIjfueJxEbJ8ip1m9Y1ZPnslsaKzZMlAZ1orqW+EaBGLUbaWDl7mfSaZmDzYIcjEfyMNkboKlKibDW9W/o7fpXCNF7U4jsvtnojWXQ7FQQ5Vbxmt1IEQEQ4+xVuKCRGB19RkanSJ46ahKHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ZsfFV5Xb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ZsfFV5Xb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso107066455ad.1
        for <oe-lkp@lists.linux.dev>; Fri, 27 Dec 2024 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735318140; x=1735922940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOFVHWIUljpjD18W0hdwXZLMLgClsEXUtHSnNyv4bZM=;
        b=ZsfFV5Xb0UvGYv7ZziqFg6Zjl4z9KAOEFtptEmJG1EgQhZr4JEf5NATC1jBpP0R54F
         uEyYqeNp15abBxvbKFwRZqyUDrjj89Sf7fT5hcY/KRLJ1GauSQMiMrCu6Rn5mtK1/POG
         gZBeC2P7t39G1uEtW8L0bycVAC4XTlotm9Z25ezZeO7xI/MD7ZZNVCR/cozLBb6UJZbE
         bG2TF6BUGY6CuWEMZ7gC3QnCrCku267ElVxQNKTCmpdz9MU1XI+AqGPaXCeCFKmwUFIM
         /PnUue/8AntYJ2AE7o3uFPCXB0+MeZXPYfLtWLxd72RQbEueXP+//GVSZTsftR0HXALi
         0hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318140; x=1735922940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOFVHWIUljpjD18W0hdwXZLMLgClsEXUtHSnNyv4bZM=;
        b=ggpYmXhMWzNYNenhVApNi5+HYXpS0HetngPvbnfpZOEddv0rMl41R0tOi8NS560B5k
         InIPA5tJZAocwJwo/sS9AWWOPnR5zqZpprEUUWYtN1TAf9i91WBmU4VD+Qw9bl4jllm2
         6Ucc8hgYQws9WWgpfEyOhGSjlh9CGmG0RW7KOyqIsp0UEr0o3Z26nH3pKZ8w/TuwvW4v
         pKvHdWHU0OWcHADIP9RNW9WfoEEgyxMb6jIM61vJpDVptXlOXc33jKHkGlaR2GLtfwkw
         D2PpTRoJr0lWzkWvQshdHYenx0nnciCm/MYZZFHLhzOUxJhBIzHOshmNk4qTonuGm9V+
         uzYw==
X-Gm-Message-State: AOJu0Yxp4m/A83i76hDI+FL02HDaBHBJ6S93tQ6ZQH0KJkyRyHpmqdEH
	1ZIfmcTCL7JRgDu2/FvWsNx47GCOoBLjaaZPOyyDCk8Wo6Ja2Zx7ygv6cBjuW0A=
X-Gm-Gg: ASbGncub9l1XEdG3N0M+kPTHiE2Y4Z6JC6fUme4HOlMP8VQS0Or5pzRtxFjNrfZrl/3
	ApcBCxn/Knvfc/3uv1z5/nZRErDPOZd7sjnTlaMJ0+51mr7QkWiOaciXcHCfOqien9lBb9KHIen
	cXLr//S/xQ63/TeRov1tx74WiXK77G0KSgjZlophljw2Lzu69MIP2mAlCzUTerLvep/LGpQxOXs
	wl629O3SzgkDwSHhYMLRHU+kdviWGXVTdKOQ2OdVdM1WTKf2RkFTA==
X-Google-Smtp-Source: AGHT+IEmxFknk/Ao6JdtIasdWMlVJa37hoobmtWDdnGc3OsknWkChk/bTC9H4tGWspLzxIAmwxuQxg==
X-Received: by 2002:a05:6a21:3997:b0:1e0:c9a9:a950 with SMTP id adf61e73a8af0-1e5e081cb96mr44076885637.39.1735318140116;
        Fri, 27 Dec 2024 08:49:00 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb0d1sm14733525b3a.137.2024.12.27.08.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 08:48:59 -0800 (PST)
Message-ID: <98fc1d1e-2b39-4628-a209-a76407130f6c@kernel.dk>
Date: Fri, 27 Dec 2024 09:48:58 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [io_uring/rw] 8cf0c45999: fio.read_bw_MBps
 51.1% regression
To: kernel test robot <oliver.sang@intel.com>,
 Gabriel Krisman Bertazi <krisman@suse.de>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, io-uring@vger.kernel.org
References: <202412271132.a09c3500-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202412271132.a09c3500-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/26/24 8:13 PM, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 51.1% regression of fio.read_bw_MBps on:
> 
> 
> commit: 8cf0c459993ee2911f4f01fba21b1987b102c887 ("io_uring/rw: Allocate async data through helper")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

Took a quick look, and I think that patch forgets to clear ->bytes_done
when we don't have a free_iovec. That looks like a mistake, it should
always get cleared, it has no dependence on ->free_iovec.

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 75f70935ccf4..ca1b19d3d142 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -228,8 +228,8 @@ static int io_rw_alloc_async(struct io_kiocb *req)
 		kasan_mempool_unpoison_object(rw->free_iovec,
 					      rw->free_iov_nr * sizeof(struct iovec));
 		req->flags |= REQ_F_NEED_CLEANUP;
-		rw->bytes_done = 0;
 	}
+	rw->bytes_done = 0;
 	return 0;
 }
 

-- 
Jens Axboe

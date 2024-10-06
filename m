Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498AD74C08
	for <oe-lkp@lists.linux.dev>; Sun,  6 Oct 2024 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728249068; cv=none; b=FhExQRxJJdZ3xPjS/KR2/JBLf38F36rZaoRmXcVCAt7gXckIiJ3WAoJMU7uTK2Ge9gZweQ3xUCNKaVAcOhE3AT6wCemOlB5Vbp0LmfwYlprSgJwLisjVzVsSipbld1i9qM8vKfk3XoVebRLFjioJ24xom0yiHkqEeexlj/iw9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728249068; c=relaxed/simple;
	bh=+eFNjWgForNGlvpFra2igXT/QVdi0Sq1+iPGE7JoouQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8ovq2eja6Q1JzkBRCkk/fZXxg9aF0IXqPgxfyKjE2jrTiAlMmnA5w+rUPtBEnJF0niB6/64H6sqtldEdGpJioEzHRWOcoPU1VADYCf2R0nWDownWjyGyJZieKkqiLZKkILYhdHeuu19OiR42MIjyQG7USkwT0c5ZZFkrANR+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Y6Q6a0k2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Y6Q6a0k2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b6458ee37so43059755ad.1
        for <oe-lkp@lists.linux.dev>; Sun, 06 Oct 2024 14:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728249063; x=1728853863; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dloADBbuZWGn70AvE4DrbcMS4omNC91HnOyXDRn/hGE=;
        b=Y6Q6a0k2nERlMvkmLnV68U8zUzI1+F8xio+YOrzLuh/sX7V6ls58CmUL5cFSmpzn7J
         CdKcdiw2JlTYZ09M0wXGPMb9iITjyJyrKK4rXHrRQAMdzvVy7HmUJOuOTFD+XW60O0rz
         wldQBh901syQWt/FllnIW/fwzinakXexE4eJa8IJjDouOSa/aWZE/dO/0jLfWYUaZgbp
         Or0WSxTfq8exMm3tm8CyVaG3QrfWjaOvChVZldYw5hF30AUkv2JND+0PKVRmSBQq58TF
         3lybLQjIKpSmyQmCveU2VEVzrigL35ob4+MqKkgdADG6q91bLfRap6oD0Fw1mRVPGKoj
         DOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728249063; x=1728853863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dloADBbuZWGn70AvE4DrbcMS4omNC91HnOyXDRn/hGE=;
        b=NLQnTZsQyTwmc8zDtzOj4JP3rmFti6To+Lfu5j4M6RDF33NZ5VKSdAPC2RCnEP4LkL
         P5nT/Wkxdt759G5H9x+SFwLdkHNCy5bVP6H4vwlmWW/KL4QarKOXwiHGikoZkuPH7Zt0
         IaLCqL5qINC2ATokInPMl+vfhVCfIlIOLbY5koNEeRLIJna8f3NgJ8yfauesV4oWyDqZ
         T9pRsAL335oXXjTZRfJD5iZHpTr1DVaqvdEr3sT833/PNRMqlQSnSIrAk2rTuOLdwmh9
         /zGwjj9mmHHovwmrLOR4gseH3+xWH2n9BfYN4E2kKWoHB/DilnQJckEU17UzbkPvG8vy
         O5cw==
X-Gm-Message-State: AOJu0YyWaiC7pn/GolKtQsH8gpvE5SC7CatStXXkRUPI/u6iSVrWUTjb
	N8TgGOBiGB1NGFO3G5jxJ7feytY7keHlLnS07+Jx6wx5WaXAyHIQ7hFVgQxJhKo=
X-Google-Smtp-Source: AGHT+IH5NNQf1Ie+vUj3S5amCK5fUOP7CYBZC8wQD1o0NC1Am1NwNpRLmuyhZ7iS6+THJDSgH8BYHg==
X-Received: by 2002:a17:902:cec7:b0:20b:b238:9d25 with SMTP id d9443c01a7336-20bfe2a4109mr165129215ad.38.1728249063495;
        Sun, 06 Oct 2024 14:11:03 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13969477sm28488985ad.194.2024.10.06.14.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 14:11:02 -0700 (PDT)
Message-ID: <d2f5b906-d721-426f-a469-891eb2220eff@kernel.dk>
Date: Sun, 6 Oct 2024 15:11:01 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: move iostat check into blk_acount_io_start()
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-block@vger.kernel.org
References: <202410062110.512391df-oliver.sang@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202410062110.512391df-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/24 8:07 AM, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "blktests.block/024.fail" on:
> 
> commit: 5b0b8be85f1ca1c11566890f5d4564ee97cf2d41 ("[PATCH] block: move iostat check into blk_acount_io_start()")
> url: https://github.com/intel-lab-lkp/linux/commits/Jens-Axboe/block-move-iostat-check-into-blk_acount_io_start/20241003-032648
> base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next
> patch link: https://lore.kernel.org/all/550fc8a0-3461-49ac-879e-32908870f007@kernel.dk/
> patch subject: [PATCH] block: move iostat check into blk_acount_io_start()
> 
> in testcase: blktests
> version: blktests-x86_64-80430af-1_20240910
> with following parameters:
> 
> 	disk: 1HDD
> 	test: block-024

This should fix it:

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 8e75e3471ea5..9cbc0262ad19 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -331,7 +331,7 @@ EXPORT_SYMBOL(blk_rq_init);
 /* Set start and alloc time when the allocated request is actually used */
 static inline void blk_mq_rq_time_init(struct request *rq, u64 alloc_time_ns)
 {
-	if (blk_mq_need_time_stamp(rq))
+	if (blk_queue_io_stat(rq->q))
 		rq->start_time_ns = blk_time_get_ns();
 	else
 		rq->start_time_ns = 0;

-- 
Jens Axboe

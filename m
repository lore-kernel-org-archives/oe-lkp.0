Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA78808
	for <oe-lkp@lists.linux.dev>; Mon,  1 May 2023 16:33:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b8b19901fso3168303b3a.3
        for <oe-lkp@lists.linux.dev>; Mon, 01 May 2023 09:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682958818; x=1685550818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wvXgmXTcoqinXgmTcZbLJeJ+cVt/9/6nawvCb/0Ccc=;
        b=HX1GyjYKVWGSahNnFAHUakLd5u6/hiJDTJvlaqMjPkhm6mP2V4YD2sAYifli9xJHVF
         JBQoyxHiX6ORWzPp2ZXs9b2UPYCJWjocDXX4LzvPQZ60i9GvjOjpC9ctscIh3TSMQ31Y
         2crDB4bBzfIqHIpU+oIQ2pgDYJWPqsbMD45ILSG95SVdVM55bXRutRxMbYe5tV3hbIBa
         IDHqufnvYde1vbHmG84gLIWG4lPr+xenPQ36s3YutowY1kayrkR8+q/dayjeVHVcUg+3
         DlVeJSvriueX61wQOgbAobEusXdjd17MmCQ/ua4eb2hLPRYToSRuBckE0UA5e+z5V5No
         uhZA==
X-Gm-Message-State: AC+VfDxXPTwlF6yZnPiXSiHQV9IXMp8QzucsOJKEoz61oy6cVSMq7cv/
	3SKsxySFrreYdrPEZeKs/p0=
X-Google-Smtp-Source: ACHHUZ4vkJ0fYm8o2BnyyfAkFbxvYe/seRtXqWqRzXk7q8DoFUff84cr5BgmMUNcRiGa9CS20pAdPA==
X-Received: by 2002:a05:6a00:2d84:b0:63b:e4:554 with SMTP id fb4-20020a056a002d8400b0063b00e40554mr22821985pfb.4.1682958817749;
        Mon, 01 May 2023 09:33:37 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:eba5:79b2:92dd:67e? ([2620:15c:211:201:eba5:79b2:92dd:67e])
        by smtp.gmail.com with ESMTPSA id t5-20020a628105000000b0063b73e69ea2sm20114934pfd.42.2023.05.01.09.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 09:33:37 -0700 (PDT)
Message-ID: <e561f3c5-f7ec-f343-5bd9-75919f079515@acm.org>
Date: Mon, 1 May 2023 09:33:34 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [bvanassche:block-for-next] [block] 4cf040452d:
 INFO:task_blocked_for_more_than#seconds
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ming Lei <ming.lei@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-block@vger.kernel.org
References: <202305012131.8562d30d-oliver.sang@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202305012131.8562d30d-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/23 07:00, kernel test robot wrote:
> kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:
> 
> commit: 4cf040452d1cb0a66a6cac74066b1d2cd2190e53 ("block: Send requeued requests to the I/O scheduler")
> https://github.com/bvanassche/linux block-for-next
> 
> in testcase: blktests
> version: blktests-x86_64-c1da4a2-1_20230425
> with following parameters:
> 
> 	disk: 1SSD
> 	test: block-027

That commit is from an old branch that I forgot to delete from my github
account (April 7, 2023). Let's see whether the kernel test robot reports
anything for the more recent patches that have been posted on the linux-block
mailing list.

Bart.


Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E6E568
	for <oe-lkp@lists.linux.dev>; Thu, 17 Aug 2023 14:50:40 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-565ea1088fbso2041600a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 17 Aug 2023 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692283840; x=1692888640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Swe7qS1gWsrm3LERSWVriC7BNsYVaHQ/NWIJOtLygzE=;
        b=XTdrF+6CmV79XT/cds+zVDuVB4E6WAwKZrzGBjBg/I5rZtzE5TpWjXS8qNjDBKaJjp
         Ou+OejQhwzzqcimgNzoMx43mcFNXyqzZSi77EdlpqiHtQs0DNhRvMlXLL/qD3MrgwVrB
         1Ju8jAK/FF0i6sMo1CioR+KpRoD2JIm+Kb0Zrw+5k06LfIiu3bDCp5UlgtlKDmi58C0S
         sw8wY8daVDiv8aAu9X8dB6FpI5RkZyi5jX5Um9xQYFYGTgumr6ru2pDeDTLLEbknmFm3
         bSwuimvXo85bFjxj9gh14xIW/6fD/wlff9u/xhhCEsYTJG26GhxJYICHeRSRjJgfIXvm
         F/UQ==
X-Gm-Message-State: AOJu0YwCTynt86ANGwqwvAhpx0PgSw2aClfpAYJ6clbMldmEOkEgvVh7
	bUJc9+PknAXyztOIbX2oBbw=
X-Google-Smtp-Source: AGHT+IFixLVVwRoS+ebQdkKmKGR5+zSOuE1vDbyNm+1B3b/hEgjshhzCxdl3EVfg+K86FX4nwiVxtQ==
X-Received: by 2002:a17:90a:fc95:b0:268:52a6:103d with SMTP id ci21-20020a17090afc9500b0026852a6103dmr4656895pjb.9.1692283839903;
        Thu, 17 Aug 2023 07:50:39 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:dfd:6f25:f7be:a9ca? ([2620:15c:211:201:dfd:6f25:f7be:a9ca])
        by smtp.gmail.com with ESMTPSA id fv23-20020a17090b0e9700b0025645ce761dsm1663238pjb.35.2023.08.17.07.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 07:50:39 -0700 (PDT)
Message-ID: <af61c72c-b3ec-ce7a-4f41-bce9a9844baf@acm.org>
Date: Thu, 17 Aug 2023 07:50:38 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2] blk-mq: release scheduler resource when request
 complete
Content-Language: en-US
To: chengming.zhou@linux.dev
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Chuck Lever <chuck.lever@oracle.com>, linux-block@vger.kernel.org,
 axboe@kernel.dk, hch@lst.de, cel@kernel.org, linux-kernel@vger.kernel.org,
 zhouchengming@bytedance.com, kernel test robot <oliver.sang@intel.com>
References: <202308172100.8ce4b853-oliver.sang@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202308172100.8ce4b853-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/23 07:41, kernel test robot wrote:
> [  222.622837][ T2216] statistics for priority 1: i 276 m 0 d 276 c 278
> [ 222.629307][ T2216] WARNING: CPU: 0 PID: 2216 at block/mq-deadline.c:680 dd_exit_sched (block/mq-deadline.c:680 (discriminator 3))

The above information shows that dd_inserted_request() has been called
276 times and also that dd_finish_request() has been called 278 times.
Calling dd_finish_request() more than once per request breaks the code
for priority handling since that code checks how many requests are
pending per priority level by subtracting the number of completion calls
from the number of insertion calls (see also dd_queued()). I think the
above output indicates that this patch introduced a regression.

Bart.


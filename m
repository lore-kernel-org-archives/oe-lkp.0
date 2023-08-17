Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8714AA6
	for <oe-lkp@lists.linux.dev>; Thu, 17 Aug 2023 17:24:52 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6874a386ec7so3081b3a.1
        for <oe-lkp@lists.linux.dev>; Thu, 17 Aug 2023 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1692293092; x=1692897892;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vHHVkxWW04IoUZrYFRpOEcAsjjg8V3LWudLTC9GREA=;
        b=QYVrl6FujIq30u7lKbb0YTqb9pdMFvQv2J3WVa07YyWOZKIgoaBlzAvTb5pTrRVof8
         cwaXMhFmAQivePfOEM2qJ1y8z0bqwqTpZht34ALsShKn9IuvFbFXCOzTBFla6NxdbKst
         BsKg5muo7QMuu7YzP4ETLd43HAQxN/vFhVEjAhdDzERTuWkPcuCYLgK4Llj7TR1TjTof
         Tgw/8zqqHFI+SSJ9G0N8nKDzsz/agYbRuCP3h53Ul7UwUO6DnIo7p82KqZj2piOqkIFU
         NT4dyeVLATqeeBqGekxu6Z+immD3fVmqbXI+OOWTTkNil4G/VfzFFxLwrn/RWxrdawve
         j7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692293092; x=1692897892;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vHHVkxWW04IoUZrYFRpOEcAsjjg8V3LWudLTC9GREA=;
        b=N4rQaYoVI10rRNqKR/rc8qJQZ49x36zWHF40bBc8/8WLvb0kd3NdTy45fadFQuxdkb
         q22UYOucDTFfUAscLzx3rM0CABzlq/76Y91NGO3xLVI99vitAV6YqFqoazAjuPZCWZ4A
         8kqfqL7FTCi0oRDYNNq+Nguj2lopIciED6qMSJC7kV+Zr3MGSGf/xfQ+77cxORd3Sm4q
         ZfbosDpcByUsgOzISbK3Mf6ZNPu3EzxgyzBKJsvoSw0AFVdSb4x3NhTxRbvTXs7xeOul
         mX3QzelKjRBCrx0l0yGFqD8sMSUQ8PqDXnlombdDoPZDMJr7u7bGekTUr+P/fJRF9xOm
         kRpA==
X-Gm-Message-State: AOJu0YwMhWQ/sRiPTFmKpKfMroKTCjQQu3N+1UDDv3q9AWHAPFljtd0C
	2k6C6xq44gQ+WNt9mq+bqt9ZWw==
X-Google-Smtp-Source: AGHT+IER3moHf5FdPQm18isIK0ga5d2T5yo9hxPQGIExbRChtG44xh6QtgSsZYySjPATDDv02NbsQA==
X-Received: by 2002:a17:903:22ce:b0:1b8:17e8:547e with SMTP id y14-20020a17090322ce00b001b817e8547emr70150plg.1.1692293092439;
        Thu, 17 Aug 2023 10:24:52 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902d3c600b001bdf45eb5b6sm12246plb.284.2023.08.17.10.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 10:24:51 -0700 (PDT)
Message-ID: <12ecac8d-1837-4083-a7e9-efe826d9ae7f@kernel.dk>
Date: Thu, 17 Aug 2023 11:24:50 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] blk-mq: release scheduler resource when request
 complete
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Chengming Zhou <chengming.zhou@linux.dev>,
 Bart Van Assche <bvanassche@acm.org>, hch@lst.de
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Chuck Lever <chuck.lever@oracle.com>, linux-block@vger.kernel.org,
 cel@kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>
References: <202308172100.8ce4b853-oliver.sang@intel.com>
 <af61c72c-b3ec-ce7a-4f41-bce9a9844baf@acm.org>
 <317715dc-f6e4-1847-5b78-b2d8184b446a@linux.dev>
 <8c262b00-9856-49fa-b425-da863efdff7d@kernel.dk>
In-Reply-To: <8c262b00-9856-49fa-b425-da863efdff7d@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/23 11:20 AM, Jens Axboe wrote:
> On 8/17/23 9:29 AM, Chengming Zhou wrote:
>> On 2023/8/17 22:50, Bart Van Assche wrote:
>>> On 8/17/23 07:41, kernel test robot wrote:
>>>> [  222.622837][ T2216] statistics for priority 1: i 276 m 0 d 276 c 278
>>>> [ 222.629307][ T2216] WARNING: CPU: 0 PID: 2216 at block/mq-deadline.c:680 dd_exit_sched (block/mq-deadline.c:680 (discriminator 3))
>>>
>>> The above information shows that dd_inserted_request() has been called
>>> 276 times and also that dd_finish_request() has been called 278 times.
>>
>> Thanks much for your help.
>>
>> This patch indeed introduced a regression, postflush requests will be completed
>> twice, so here dd_finish_request() is more than dd_inserted_request().
>>
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index a8c63bef8ff1..7cd47ffc04ce 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -686,8 +686,10 @@ static void blk_mq_finish_request(struct request *rq)
>>  {
>>         struct request_queue *q = rq->q;
>>
>> -       if (rq->rq_flags & RQF_USE_SCHED)
>> +       if (rq->rq_flags & RQF_USE_SCHED) {
>>                 q->elevator->type->ops.finish_request(rq);
>> +               rq->rq_flags &= ~RQF_USE_SCHED;
>> +       }
>>  }
>>
>>
>> Clear RQF_USE_SCHED flag here should fix this problem, which should be ok
>> since finish_request() is the last callback, this flag isn't needed anymore.
>>
>> Jens, should I send this diff as another patch or resend updated v3?
> 
> I don't think this is the right solution, it makes all kinds of
> assumptions on what that flag is and when it's safe to clear it. It's a
> very fragile fix, I think we need to do better than that.

Well maybe this is actually fine, since we're freeing the request now
anyway. I can fold it in the fix, I'll add a comment as well. If this is
subtle enough that it caused this issue, we definitely should have a
comment on why we're clearing this flag.

-- 
Jens Axboe


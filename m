Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923B38F
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 02:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689905637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5cvfWxs/yR9W6uL+jRzWQcVmSMb7972R59EHtR/P4s=;
	b=WaEItzHn4XsXHO3gIoy7uTZN8kwZeVfNbwn0h+zspUMEI3EGQp03ZBTx/EMcEocOgesuYi
	3AJl/ew+j5C8NfdhSndwcCtxrVC/OomfmdaX/r/qrlDxnWJ5P1PFvueelnDf7/d9A604Pg
	8psq/l7UhaTNK+8jXSC1flL913TSbRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-jg2TEHzgMwOoz5utQqGPyA-1; Thu, 20 Jul 2023 22:13:50 -0400
X-MC-Unique: jg2TEHzgMwOoz5utQqGPyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 239D4858290;
	Fri, 21 Jul 2023 02:13:50 +0000 (UTC)
Received: from [10.22.17.23] (unknown [10.22.17.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9FC9C57969;
	Fri, 21 Jul 2023 02:13:48 +0000 (UTC)
Message-ID: <bd976e78-953c-68cb-291f-7ad2188aa3fb@redhat.com>
Date: Thu, 20 Jul 2023 22:13:48 -0400
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [LTP] [PATCH] sched/core: Use empty mask to reset cpumasks in
 sched_setaffinity()
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>, kernel test robot <oliver.sang@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Brent Rowsell <browsell@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, Phil Auld <pauld@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, yu.c.chen@intel.com,
 Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Peter Hunt <pehunt@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 oe-lkp@lists.linux.dev, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, ltp@lists.linux.it,
 lkp@intel.com
References: <20230628211637.1679348-1-longman@redhat.com>
 <202307171539.3d8d0e8-oliver.sang@intel.com> <ZLVS_ANORaZO_ZIE@yuki>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZLVS_ANORaZO_ZIE@yuki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On 7/17/23 10:41, Cyril Hrubis wrote:
> Hi!
>> Running tests.......
>> <<<test_start>>>
>> tag=sched_setaffinity01 stime=1689382567
>> cmdline="sched_setaffinity01"
>> contacts=""
>> analysis=exit
>> <<<test_output>>>
>> tst_test.c:1558: TINFO: Timeout per run is 0h 02m 30s
>> sched_setaffinity01.c:83: TPASS: sched_setaffinity() failed: EFAULT (14)
>> sched_setaffinity01.c:73: TFAIL: sched_setaffinity() succeded unexpectedly
>> tst_test.c:1612: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
>> tst_test.c:1614: TBROK: Test killed! (timeout?)
> So what the test does is that it sets empty affinity mask to
> sched_setaffinity() and expects EINVAL. Instead it looks like the call
> now succeeeds, the test stops getting schedulled and is killed by
> timeout.
>
I had sent out a v2 patch should not fail the LTP's sched_setaffinity() 
test.

Cheers,
Longman


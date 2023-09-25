Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C04118AE7
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 11:07:13 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c038a1e2e6so93893851fa.2
        for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695640032; x=1696244832; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwoKKDz7PFuhCsGgBGv/macPzEyZeZss0ErZH7Fj3bA=;
        b=XErH+r2sjvRuJi9fzn3BkVkfTQVqWNKwS44Dw+Yplenkq7YBJPbWZSztyf7ksD24tI
         PaAB2blhMQXge7bhtYOK1NDbkn4f24Jk46Z7IO9wm89bX7p3bSEpCrjWaoBJ7PAQGDps
         wpQ1EOlsU5AtbT/iFcGyB5FKfzoy09Yyqn/kVTSbART1zM967o91jR8qUG3XDzUzSWiX
         Sw8Tbc5H0y79+1tlxgyyfQ8uf46m2fXRXLgWiBLnEZwlGluRRSqFp29PV0wbOHJVoEtG
         QJMQVqd4tEh/Z2cU9GC315g9iLbbHh2oFdD4/YRdsz4NyKaQ1atJfb1FujjjzOpL1SkF
         NgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695640032; x=1696244832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwoKKDz7PFuhCsGgBGv/macPzEyZeZss0ErZH7Fj3bA=;
        b=S/7OxMACOm5k0Pv5bkX7qG+p/RuOscd/gYXZzEhDyX+/nqL7xkDH4N66J0qSA24v1G
         A7piBQwB3uOj8wjgBm2qz8GASLvZozmHqTLcUeJPNYaTp7pMf22DBIKoW8/Kp9D9Qgbj
         1cRTV+OguSJjKkuYMtYot59aStQTafHTneZEA2QCBQteUlVa0J36vb083D9exgLHnYya
         O2n2eaxwJFRBoGI+Whx2HGZ9iUg73ljOJcA3Ds2mcBwtsDz9gcg36huDZqFBlLlphZPE
         iFqSTUSxddhtidWIJSVVuJIeTt390gmYfMfK4ody0sm+4fKq/LfaVYwtCBIPovUs9E8N
         rKYA==
X-Gm-Message-State: AOJu0YwTGEuyot2EpwYgxSmR+lGApW3lVS4ZCYj9auw8oxkaX2x/Ery6
	DU2y6OUe3ic57JEEshfaxls=
X-Google-Smtp-Source: AGHT+IGgo4ldpuJySiGdM4mYj2o+lTju6PG/SZZ6Y1W43nWulrR8PpEcBgAgQD3tRKGy+KsBVWeuSw==
X-Received: by 2002:a2e:9845:0:b0:2bf:ff17:811e with SMTP id e5-20020a2e9845000000b002bfff17811emr5041152ljj.14.1695640031811;
        Mon, 25 Sep 2023 04:07:11 -0700 (PDT)
Received: from gmail.com (195-38-113-94.pool.digikabel.hu. [195.38.113.94])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906681400b0099bd046170fsm6093814ejr.104.2023.09.25.04.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:07:10 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Mon, 25 Sep 2023 13:07:08 +0200
From: Ingo Molnar <mingo@kernel.org>
To: kernel test robot <oliver.sang@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com,
	Mike Galbraith <efault@gmx.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-tip-commits@vger.kernel.org, x86@kernel.org,
	Gautham Shenoy <gautham.shenoy@amd.com>
Subject: Re: [PATCH] sched/fair: Do not wakeup-preempt same-prio SCHED_OTHER
 tasks
Message-ID: <ZRFp3EO2JUXtK6XB@gmail.com>
References: <ZQljoiSBhZLEFI/G@gmail.com>
 <202309221758.d655aa5b-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202309221758.d655aa5b-oliver.sang@intel.com>


* kernel test robot <oliver.sang@intel.com> wrote:

> Hello,
> 
> kernel test robot noticed a -19.0% regression of stress-ng.filename.ops_per_sec on:

Thanks for the testing, this is useful!

So I've tabulated the results into a much easier to read format:

> | testcase: change | stress-ng: stress-ng.filename.ops_per_sec                                      -19.0% regression
> | testcase: change | stress-ng: stress-ng.lockbus.ops_per_sec                                        -6.0% regression 
> | testcase: change | stress-ng: stress-ng.sigfd.ops_per_sec                                          17.6% improvement
> | testcase: change | phoronix-test-suite: phoronix-test-suite.darktable.Masskrug.CPU-only.seconds    -5.3% improvement
> | testcase: change | lmbench3: lmbench3.TCP.socket.bandwidth.64B.MB/sec                              11.5% improvement
> | testcase: change | phoronix-test-suite: phoronix-test-suite.darktable.Boat.CPU-only.seconds        -3.5% improvement
> | testcase: change | stress-ng: stress-ng.sigrt.ops_per_sec                                         100.2% improvement
> | testcase: change | stress-ng: stress-ng.sigsuspend.ops_per_sec                                    -93.9% regression
> | testcase: change | stress-ng: stress-ng.sigsuspend.ops_per_sec                                    -82.1% regression
> | testcase: change | stress-ng: stress-ng.sock.ops_per_sec                                           59.4% improvement
> | testcase: change | blogbench: blogbench.write_score                                               -35.9% regression
> | testcase: change | hackbench: hackbench.throughput                                                 -4.8% regression
> | testcase: change | blogbench: blogbench.write_score                                               -59.3% regression
> | testcase: change | stress-ng: stress-ng.exec.ops_per_sec                                          -34.6% regression
> | testcase: change | netperf: netperf.Throughput_Mbps                                                60.6% improvement
> | testcase: change | hackbench: hackbench.throughput                                                 19.1% improvement
> | testcase: change | stress-ng: stress-ng.dnotify.ops_per_sec                                       -15.7% regression

And then sorted them along the regression/improvement axis:

> | testcase: change | stress-ng: stress-ng.sigsuspend.ops_per_sec                                    -93.9% regression
> | testcase: change | stress-ng: stress-ng.sigsuspend.ops_per_sec                                    -82.1% regression
> | testcase: change | blogbench: blogbench.write_score                                               -59.3% regression
> | testcase: change | blogbench: blogbench.write_score                                               -35.9% regression
> | testcase: change | stress-ng: stress-ng.exec.ops_per_sec                                          -34.6% regression
> | testcase: change | stress-ng: stress-ng.filename.ops_per_sec                                      -19.0% regression
> | testcase: change | stress-ng: stress-ng.dnotify.ops_per_sec                                       -15.7% regression
> | testcase: change | stress-ng: stress-ng.lockbus.ops_per_sec                                        -6.0% regression
> | testcase: change | hackbench: hackbench.throughput                                                 -4.8% regression
> | testcase: change | phoronix-test-suite: phoronix-test-suite.darktable.Masskrug.CPU-only.seconds    +5.3% improvement
> | testcase: change | phoronix-test-suite: phoronix-test-suite.darktable.Boat.CPU-only.seconds        +3.5% improvement
> | testcase: change | lmbench3: lmbench3.TCP.socket.bandwidth.64B.MB/sec                              11.5% improvement
> | testcase: change | stress-ng: stress-ng.sigfd.ops_per_sec                                          17.6% improvement
> | testcase: change | hackbench: hackbench.throughput                                                 19.1% improvement
> | testcase: change | stress-ng: stress-ng.sock.ops_per_sec                                           59.4% improvement
> | testcase: change | netperf: netperf.Throughput_Mbps                                                60.6% improvement
> | testcase: change | stress-ng: stress-ng.sigrt.ops_per_sec                                         100.2% improvement

Testing results notes:

    - the '+' denotes an inverted improvement. The mixing of signs in the output of the 
      ktest robot is arguably confusing.

    - Any hope getting similar summary format by default? It's much more informative than 
      just picking up the biggest regression, which wasn't even done correctly AFAICT.

Summary:

While there's a lot of improvements, it is primarily the nature of performance
regressions that dictate the way forward:

 - stress-ng.sigsuspend.ops_per_sec regressions, -93%:

    Clearly signal delivery performance hurts from delayed preemption, but
    that should be straightforward to resolve, if we are willing to commit
    to adding a high-prio insta-wakeup variant API ...

 - stress-ng.exec.ops_per_sec -34% regression:

    Likewise this possibly expresses that it's better to immediately reschedule
    during exec() - but maybe it's more and reflects some unfavorable migration,
    as suggested by the NUMA locality figures:

                     %change         %stddev
                        |                \                                         
  79317172           -34.2%   52217838 ±  3%  numa-numastat.node0.local_node
  79360983           -34.2%   52240348 ±  3%  numa-numastat.node0.numa_hit                            
  77971050           -33.2%   52068168 ±  3%  numa-numastat.node1.local_node
  78009071           -33.2%   52089987 ±  3%  numa-numastat.node1.numa_hit
     88287           -45.7%      47970 ±  2%  vmstat.system.cs

 - 'blogbench' regression of -59%:

    It too has a very large reduction in context switches:

         %stddev     %change         %stddev
             \          |                \  
     30035           -49.7%      15097 ±  3%  vmstat.system.cs
   2243545 ±  2%      -4.1%    2152228        blogbench.read_score
  52412617           -28.3%   37571769        blogbench.time.file_system_outputs
   2682930           -74.1%     694136        blogbench.time.involuntary_context_switches
   2369329           -50.0%    1184098 ±  5%  blogbench.time.voluntary_context_switches
      5851           -35.9%       3752 ±  2%  blogbench.write_score

    It's unclear to me what's happening with this one, just from these stats,
    but it's "write_score" that hurts most.
 
 - 'stress-ng.filename.ops_per_sec' regression of -19%:

    This test suffered from an *increase* in context-switching, and a large
    increase in CPU-idle:

         %stddev     %change         %stddev
             \          |                \  
   4641666           +19.5%    5545394 ±  2%  cpuidle..usage
     90589 ±  2%     +70.5%     154471 ±  2%  vmstat.system.cs
    628439           -19.2%     507711        stress-ng.filename.ops
     10317           -19.0%       8355        stress-ng.filename.ops_per_sec

    171981           -59.7%      69333 ±  3%  stress-ng.time.involuntary_context_switches
    770691 ±  3%    +200.9%    2319214        stress-ng.time.voluntary_context_switches

Anyway, it's clear from these results that while many workloads hurt
from our notion of wake-preemption, there's several ones that benefit
from it, especially generic ones like phoronix-test-suite - which have
no good way to turn off wakeup preemption (SCHED_BATCH might help though).

One way to approach this would be to instead of always doing
wakeup-preemption (our current default), we could turn it around and
only use it when it is clearly beneficial - such as signal delivery,
or exec().

The canonical way to solve this would be give *userspace* a way to
signal that it's beneficial to preempt immediately, ie. yield(),
but right now that interface is hurting tasks that only want to
give other tasks a chance to run, without necessarily giving up
their own right to run:

        se->deadline += calc_delta_fair(se->slice, se);

Anyway, my patch is obviously a no-go as-is, and this clearly needs more work.

Thanks,

	Ingo

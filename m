Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433115B4
	for <oe-lkp@lists.linux.dev>; Thu, 23 Mar 2023 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679536471; x=1711072471;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=CwS67PYYqH0PatMp8p449KP+I7kSWUyHQOcV0z+jSpk=;
  b=bAENDn5sCG2HY6kg5lQCYLlKY8p47oNvA8jgR8+GP/TXHapnbtqq3dis
   33w8qB2nbvBUdN8vbE5+9/9dviu73FD0p/LtFAubNYHsArhtbDRYSMkG1
   JUrCxcodSqUP0kWgxWz/QKgPFOw9rhC4ev7Ybm8xeaArbYLFJg5/5C7zl
   L/AR/7k7hT0mTARKjSw96Tjgb3yDCtgl6lUipk8yAdBgfbwZXpMKSev9t
   sN5rnIw7WbFwN4rfFit8MmLbLaCXqXF890/FTz9hnDthzVtHHODlganoG
   gHWKYn0qakMNPj6v21FMSaaoq8AzGDc+X2xb+2Kr4f/bYXnt5XLWnm+L7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339410415"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="339410415"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714618278"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714618278"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:54:25 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,  "bharata@amd.com" <bharata@amd.com>,  "Yin,
 Fengwei" <fengwei.yin@intel.com>,  "willy@infradead.org"
 <willy@infradead.org>,  "mike.kravetz@oracle.com"
 <mike.kravetz@oracle.com>,  "shy828301@gmail.com" <shy828301@gmail.com>,
  "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,  "Tang, Feng"
 <feng.tang@intel.com>,  "linux-mm@kvack.org" <linux-mm@kvack.org>,
  "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,  "ziy@nvidia.com"
 <ziy@nvidia.com>,  "zhengjun.xing@linux.intel.com"
 <zhengjun.xing@linux.intel.com>,  "osalvador@suse.de" <osalvador@suse.de>,
  "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
  "minchan@kernel.org" <minchan@kernel.org>,  "42.hyeyoo@gmail.com"
 <42.hyeyoo@gmail.com>,  "apopple@nvidia.com" <apopple@nvidia.com>
Subject: Re: [linus:master] [migrate_pages] 7e12beb8ca:
 vm-scalability.throughput -3.4% regression
References: <202303192325.ecbaf968-yujie.liu@intel.com>
	<87o7onua4t.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<ab92aaddf1b52ede15e2c608696c36765a2602c1.camel@intel.com>
	<87h6ueu0ae.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<ce5e09c3a2eceb40048afbad5e6b6856f62d815a.camel@intel.com>
Date: Thu, 23 Mar 2023 09:53:23 +0800
In-Reply-To: <ce5e09c3a2eceb40048afbad5e6b6856f62d815a.camel@intel.com> (Yujie
	Liu's message of "Wed, 22 Mar 2023 13:17:54 +0800")
Message-ID: <87zg84s06k.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Liu, Yujie" <yujie.liu@intel.com> writes:

> On Tue, 2023-03-21 at 13:43 +0800, Huang, Ying wrote:
>> "Liu, Yujie" <yujie.liu@intel.com> writes:
>>
>> > Hi Ying,
>> >
>> > On Mon, 2023-03-20 at 15:58 +0800, Huang, Ying wrote:
>> > > Hi, Yujie,
>> > >
>> > > kernel test robot <yujie.liu@intel.com> writes:
>> > >
>> > > > Hello,
>> > > >
>> > > > FYI, we noticed a -3.4% regression of vm-scalability.throughput du=
e to commit:
>> > > >
>> > > > commit: 7e12beb8ca2ac98b2ec42e0ea4b76cdc93b58654 ("migrate_pages: =
batch flushing TLB")
>> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git ma=
ster
>> > > >
>> > > > in testcase: vm-scalability
>> > > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 82=
60L CPU @ 2.40GHz (Cascade Lake) with 128G memory
>> > > > with following parameters:
>> > > >
>> > > >         runtime: 300s
>> > > >         size: 512G
>> > > >         test: anon-cow-rand-mt
>> > > >         cpufreq_governor: performance
>> > > >
>> > > > test-description: The motivation behind this suite is to exercise =
functions and regions of the mm/ of the Linux kernel which are of interest =
to us.
>> > > > test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scal=
ability.git/
>> > > >
>> > > >
>> > > > If you fix the issue, kindly add following tag
>> > > > > Reported-by: kernel test robot <yujie.liu@intel.com>
>> > > > > Link: https://lore.kernel.org/oe-lkp/202303192325.ecbaf968-yujie=
.liu@intel.com
>> > > >
>> > >
>> > > Thanks a lot for report!  Can you try whether the debug patch as
>> > > below can restore the regression?
>> >
>> > We've tested the patch and found the throughput score was partially
>> > restored from -3.6% to -1.4%, still with a slight performance drop.
>> > Please check the detailed data as follows:
>>
>> Good!  Thanks for your detailed data!
>>
>> >       0.09 =C2=B1 17%      +1.2        1.32 =C2=B1  7%      +0.4      =
  0.45 =C2=B1 21%  perf-profile.children.cycles-pp.flush_tlb_func
>>
>> It appears that we can reduce the unnecessary TLB flushing effectively
>> with the previous debug patch.  But the batched flush (full flush) is
>> still slower than the non-batched flush (flush one page).
>>
>> Can you try the debug patch as below to check whether it can restore the
>> regression completely?  The new debug patch can be applied on top of the
>> previous debug patch.
>
> The second debug patch got a -0.7% performance change. The data have
> some fluctuations from test to test, and the standard deviation is even
> a bit larger than 0.7%, which make the performance score not very
> convincing. Please check other metrics to see if the regression is
> fully restored. Thanks.

Thanks for testing!

>       0.09 =C2=B1 17%      +0.4        0.45 =C2=B1 21%      +0.0        0=
.09 =C2=B1 12%  perf-profile.children.cycles-pp.flush_tlb_func

From the profiling data, the TLB flushing overhead has been restored.
So I think the remaining 0.7% regression should be at noise level.  I
will prepare the fixing patch based on the test results.

Best Regards,
Huang, Ying

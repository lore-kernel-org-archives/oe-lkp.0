Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00062EB8
	for <oe-lkp@lists.linux.dev>; Fri, 22 Dec 2023 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMMFuhMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703211921; x=1734747921;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=FjqEvmq/Y9TwBKRAtFmD++n/yKpu1Fq5H0w9jU7Ox9I=;
  b=HMMFuhMs95PXSzo66/HyeO/qk0nlMDsrPmJcaTz33M8rHnt5001stYwq
   oKHhPUMxJNVgx4SA5X4AmAjwQ+E4QIvFqUnAcRcVBtJtsgxYykKLaRC6Y
   pTFRvqGuSlEgaC65xjVA+91R0qpIHPjyBmJa8Rzlnng9tVuBLJBIiz2UW
   5o/czSe5z1YnY3k3tCPVA3W+qxNnWn0sckgqA/WNad22loyLRGUpqG+Us
   Gm5ioAnran5Q6LiaQdHQ3lq9S7ghUfiKcB+oc70g0CrpxYLtUZGnCZDV1
   a5COo0tby0M/rw8g6yBysR35tj+2uYM/OfTBuJ7hqXovi4UVFsuiLVhWA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="375551169"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="375551169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 18:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="726645167"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="726645167"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 18:25:13 -0800
From: "Huang, Ying" <ying.huang@intel.com>
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>,  Yang Shi <shy828301@gmail.com>,
  kernel test robot <oliver.sang@intel.com>,  Rik van Riel
 <riel@surriel.com>,  <oe-lkp@lists.linux.dev>,  <lkp@intel.com>,  "Linux
 Memory Management List" <linux-mm@kvack.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Christopher Lameter <cl@linux.com>,
  <feng.tang@intel.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
In-Reply-To: <ef768b7e-0c91-4ccc-b083-42e05da752f6@intel.com> (Fengwei Yin's
	message of "Fri, 22 Dec 2023 09:06:03 +0800")
References: <202312192310.56367035-oliver.sang@intel.com>
	<CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
	<ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
	<CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
	<CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
	<b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
	<ZYPDwCcAjX+r+g6s@casper.infradead.org>
	<CAHbLzkpX29RGTrRwVpK+nh5uWyC9pJnyCjQcjjreEy2N=4QsqA@mail.gmail.com>
	<ZYSAcThKd/FbH/Bt@casper.infradead.org>
	<ef768b7e-0c91-4ccc-b083-42e05da752f6@intel.com>
Date: Fri, 22 Dec 2023 10:23:14 +0800
Message-ID: <87y1dngelp.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Yin, Fengwei" <fengwei.yin@intel.com> writes:

> On 12/22/2023 2:14 AM, Matthew Wilcox wrote:
>> On Thu, Dec 21, 2023 at 10:07:09AM -0800, Yang Shi wrote:
>>> On Wed, Dec 20, 2023 at 8:49=E2=80=AFPM Matthew Wilcox <willy@infradead=
.org> wrote:
>>>>
>>>> On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
>>>>> Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
>>>>> filter out of the MAP_STACK mapping based on this patch. The regressi=
on
>>>>> in stress-ng.pthread was gone. I suppose this is kind of safe because
>>>>> the madvise call is only applied to glibc allocated stack.
>>>>>
>>>>>
>>>>> But what I am not sure was whether it's worthy to do such kind of cha=
nge
>>>>> as the regression only is seen obviously in micro-benchmark. No evide=
nce
>>>>> showed the other regressionsin this report is related with madvise. At
>>>>> least from the perf statstics. Need to check more on stream/ramspeed.
>>>>
>>>> FWIW, we had a customer report a significant performance problem when
>>>> inadvertently using 2MB pages for stacks.  They were able to avoid it =
by
>>>> using 2044KiB sized stacks ...
>>>
>>> Thanks for the report. This provided more justification regarding
>>> honoring MAP_STACK on Linux. Some applications, for example, pthread,
>>> just allocate a fixed size area for stack. This confuses kernel
>>> because kernel tell stack by VM_GROWSDOWN | VM_GROWSUP.
>>>
>>> But I'm still a little confused by why THP for stack could result in
>>> significant performance problems. Unless the applications resize the
>>> stack quite often.
>> We didn't delve into what was causing the problem, only that it was
>> happening.  The application had many threads, so it could have been as
>> simple as consuming all the available THP and leaving fewer available
>> for other uses.  Or it could have been a memory consumption problem;
>> maybe the app would only have been using 16-32kB per thread but was
>> now using 2MB per thread and if there were, say, 100 threads, that's an
>> extra 199MB of memory in use.
> One thing I know is related with the memory zeroing. This is from
> the perf data in this report:
>
>       0.00           +16.7       16.69 =C2=B1  7%
>       perf-profile.calltrace.cycles-pp.clear_page_erms.clear_huge_page.__=
do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
>
> Zeroing 2M memory costs much more CPU than zeroing 16-32KB memory if
> there are many threads.

Using 2M stack may hurt performance of short-live threads with shallow
stack depth.  Imagine a network server which creates a new thread for
each incoming connection.  I understand that the performance will not be
great in this way anyway.  IIUC we should not make it too bad.

But, whether this is import depends on whether the use case is
important.  TBH, I don't know that.

--
Best Regards,
Huang, Ying

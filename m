Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367471172E
	for <oe-lkp@lists.linux.dev>; Fri, 11 Aug 2023 17:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3F3C433C8;
	Fri, 11 Aug 2023 17:34:52 +0000 (UTC)
Date: Fri, 11 Aug 2023 13:34:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Ajay Kaher <akaher@vmware.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, Linux Memory Management List <linux-mm@kvack.org>,
 Ching-lin Yu <chinglinyu@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <ying.huang@intel.com>,
 <feng.tang@intel.com>, <fengwei.yin@intel.com>
Subject: Re: [linux-next:master] [eventfs]  27152bceea:
 stress-ng.getdent.ops_per_sec -8.4% regression
Message-ID: <20230811133450.08cfa609@gandalf.local.home>
In-Reply-To: <202308101425.8416d10d-oliver.sang@intel.com>
References: <202308101425.8416d10d-oliver.sang@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Aug 2023 16:35:17 +0800
kernel test robot <oliver.sang@intel.com> wrote:

> Hello,
> 
> kernel test robot noticed a -8.4% regression of stress-ng.getdent.ops_per_sec on:
> 
> 
> commit: 27152bceea1df27ffebb12ac9cd9adbf2c4c3f35 ("eventfs: Move tracing/events to eventfs")

This is a feature ;-)

Looking at what stress-ng --getdent does (from the man page:)

       --getdent N
              start N workers that recursively read directories /proc, /dev/, /tmp, /sys and /run
              using getdents and getdents64 (Linux only).

So when it looks at /sys/kernel/tracing/events

The event inodes and dentries are now dynamically created (like /proc
does), and thus will take more time to look up. This is expected behavior
as the pro to doing this is the 20 megs of memory saved (per tracing
instance). And this savings will grow as more events are introduced.

-- Steve


> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: stress-ng
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: xfs
> 	class: filesystem
> 	test: getdent
> 	cpufreq_governor: performance
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202308101425.8416d10d-oliver.sang@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->  
> 
> 

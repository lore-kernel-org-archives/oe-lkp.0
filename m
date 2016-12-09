Content-Type: multipart/mixed; boundary="===============3969072379508590006=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm] 4193eeece1: BUG:sleeping_function_called_from_invalid_context_at_arch/x86/include/asm/uaccess.h
Date: Fri, 09 Dec 2016 17:19:29 +0000
Message-ID: <20161209171929.awtphdjhtlcrbsmk@techsingularity.net>
In-Reply-To: <20161209161744.GA108952@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3969072379508590006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2016 at 12:17:44AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 4193eeece130f270e400b479131badbf6e8a6618 ("mm: page_alloc: High-o=
rder per-cpu page allocator v7")
> https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git mm-pageallo=
c-highorder-percpu-v7r1
> =

> in testcase: vm-scalability
> with following parameters:
> =

> 	runtime: 300
> 	thp_enabled: never
> 	thp_defrag: never
> 	nr_task: 16
> 	nr_pmem: 1
> 	test: swap-w-rand
> 	cpufreq_governor: performance
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
> =


This was reported before and I did look at it. However, there is nothing
int he warning that indicates the path was hit due to this patch. The
patch only affects the page allocator and this triggers accessing kcore.
Has this warning been seen in other contexts *without* the patch?

-- =

Mel Gorman
SUSE Labs

--===============3969072379508590006==--


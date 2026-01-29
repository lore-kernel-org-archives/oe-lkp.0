Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5B3783B2
	for <oe-lkp@lists.linux.dev>; Thu, 29 Jan 2026 07:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670365; cv=none; b=OlRgkA8wzvKHWo8i4L59KEAgwVzBpSopEBkf0DbtMHPxpYJwOzvDU4mhTpeYchfQ5T9qOfeSKJ+sshAXFJc6P1QikyM9ayAWtdGYXE9gIg8AsovE6h3oIxONR0ZUQHgpBYmCAIcVrIks5Un0u9sfav8TKyMs97A01wrgNcS/agI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670365; c=relaxed/simple;
	bh=gxXNpX04m5cB9RaHM1On1fqSuPSPrzmiTmNWKUr8dSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnhtpbNCusa4zOLXim5zt0+xvF+FvfuOe4VNyn2EIQCfNCCu1rEwNpn9YY7qg5wza/fyVlEsDwclaZmRRXzAEc/XArNVJIaHVCn70YPIB0wxlYWAHmbvTFwR3e2qK5dXsI4Gtr95ux8jFIbNeKAFcBUIquNd5djlI0Bz/HRs5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eKdHgyCc; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eKdHgyCc"
Date: Thu, 29 Jan 2026 15:05:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769670361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpde8NfYAjvI3580RUrDb+tTppwK0FRkYSV6YQwNQPo=;
	b=eKdHgyCc+D+KcI7/vZwQUb3b+cxCU1Me035IWcYFuXz07dcAb3P81R2GmrsGRS3HxS+RFj
	P4HgFJJIP7NVv5hMTMzp6oUU39gJGYyhkw3e4XgX3Dkrczfx7aLuCbQlKA1+YhnXZBpFHa
	QsUwgZWOJxRzOm5KEysOrPBmKSXIKJI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-mm@kvack.org, Harry Yoo <harry.yoo@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [vbabka:b4/sheaves-for-all-rebased] [slab] aa8fdb9e25:
 will-it-scale.per_process_ops 46.5% regression
Message-ID: <rsfdl2u4zjec5s4f46ubsr3phjkdhq4jajgwimbml7mq6yy2lg@krjc6oobmkwz>
References: <202601132136.77efd6d7-lkp@intel.com>
 <3dfb6857-3705-4042-9a30-da488434d9e3@suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dfb6857-3705-4042-9a30-da488434d9e3@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Wed, Jan 28, 2026 at 11:31:59AM +0100, Vlastimil Babka wrote:
> On 1/13/26 14:57, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 46.5% regression of will-it-scale.per_process_ops on:
> > 
> > 
> > commit: aa8fdb9e2516055552de11cabaacde4d77ad7d72 ("slab: refill sheaves from all nodes")
> > https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all-rebased
> > 
> > testcase: will-it-scale
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
> > parameters:
> > 
> > 	nr_task: 100%
> > 	mode: process
> > 	test: mmap2
> > 	cpufreq_governor: performance
> > 
> > 
> > In addition to that, the commit also has significant impact on the following tests:
> > 
> > +------------------+----------------------------------------------------------------------------------------------------+
> > | testcase: change | stress-ng: stress-ng.pkey.ops_per_sec  28.4% regression                                            |
> > | test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory        |
> > | test parameters  | cpufreq_governor=performance                                                                       |
> > |                  | nr_threads=100%                                                                                    |
> > |                  | test=pkey                                                                                          |
> > |                  | testtime=60s                                                                                       |
> > +------------------+----------------------------------------------------------------------------------------------------+
> > | testcase: change | will-it-scale: will-it-scale.per_process_ops  32.8% regression                                     |
> > | test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
> > | test parameters  | cpufreq_governor=performance                                                                       |
> > |                  | mode=process                                                                                       |
> > |                  | nr_task=100%                                                                                       |
> > |                  | test=brk2                                                                                          |
> > +------------------+----------------------------------------------------------------------------------------------------+
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202601132136.77efd6d7-lkp@intel.com
> > 
> > 
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20260113/202601132136.77efd6d7-lkp@intel.com
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
> >   gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmap2/will-it-scale
> > 
> > commit: 
> >   6a67958ab0 ("slab: remove unused PREEMPT_RT specific macros")
> >   aa8fdb9e25 ("slab: refill sheaves from all nodes")
> 
> Hi,
> 
> as discussed at [1] this particular commit restores a behavior analogical to
> one that existed before sheaves, so while it may show a regression in
> isolation, there should hopefully be also corresponding improvement in an
> earlier commit, and those two more or less cancelled out.
> 
> What would be more useful is to know the whole series effect (excluding some
> preparatory patches). Could you please compare that if anything stands out?
> In next-20260127 that would be:
> 
> before: d86c9915f4b5 ("mm/slab: make caches with sheaves mergeable")
> 
> after: ca43eb67282a ("mm/slub: cleanup and repurpose some stat items")
> 
> Additionally, does the patch below improve anything? (on top of
> ca43eb67282a). Thanks!
> 
> [1] https://lore.kernel.org/all/85d872a3-8192-4668-b5c4-c81ffadc74da@suse.cz/
> 
> ----8<----
> From 5ac96a0bde0c3ea5cecfb4e478e49c9f6deb9c19 Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Tue, 27 Jan 2026 22:40:26 +0100
> Subject: [PATCH] slub: avoid list_lock contention from __refill_objects_any()
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/slub.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Hi Vlastimil,

I conducted a few performance tests on my machine, and I'd like to share my
findings. While I'm not an expert in LKP-style performance testing, I hope these
results can still serve as a useful reference.

Machine Configuration:
- CPU: AMD, 2 sockets, 2 nodes per socket, total 192 CPUs
- SMT: Disabled

Kernel Version:
All tests were based on modifications to the 6.19-rc5 kernel.

Test Scenarios:
0. 6.19-rc5 + Completely disabled the sheaf mechanism
    - This was done by set s->cpu_sheaves to NULL
1. Unmodified 6.19-rc5
2. 6.19-rc5 + sheaves-for-all patchset
3. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch
4. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch + increased
   the maple node sheaf capacity to 128.

Results:

- Performance change of 1 relative to 0:

```
will-it-scale.64.processes  -25.3%
will-it-scale.128.processes -22.7%
will-it-scale.192.processes -24.4%
will-it-scale.per_process_ops -24.2%
```

- Performance change of 2 relative to 1:

```
will-it-scale.64.processes  -34.2%
will-it-scale.128.processes -32.9%
will-it-scale.192.processes -36.1%
will-it-scale.per_process_ops -34.4%
```

- Performance change of 3 relative to 1:

```
will-it-scale.64.processes  -24.8%
will-it-scale.128.processes -26.5%
will-it-scale.192.processes -29.24%
will-it-scale.per_process_ops -26.7%
```

- Performance change of 4 relative to 1:

```
will-it-scale.64.processes  +18.0%
will-it-scale.128.processes +22.4%
will-it-scale.192.processes +26.9%
will-it-scale.per_process_ops +22.2%
```

- Performance change of 4 relative to 0:

```
will-it-scale.64.processes  -11.9%
will-it-scale.128.processes -5.3%
will-it-scale.192.processes -4.1%
will-it-scale.per_process_ops -7.3%
```

From these results, enabling sheaves and increasing the sheaf capacity to 128
seems to bring the behavior closer to the old percpu partial list mechanism.

However, I previously noticed differences[1] between my results on the AMD
platform and Zhao Liu's results on the Intel platform. This leads me to consider
the possibility of other influencing factors, such as CPU architecture
differences or platform-specific behaviors, that might be impacting the
performance results.

I hope these results are helpful. I'd be happy to hear any feedback or
suggestions for further testing.

[1]: https://lore.kernel.org/linux-mm/3ozekmmsscrarwoa7vcytwjn5rxsiyxjrcsirlu3bhmlwtdxzn@s7a6rcxnqadc/


---

The original testing data are shown below.

0. 6.19-rc5 + Completely disabled the sheaf mechanism

  "time.elapsed_time": 93.85333333333334,
  "time.elapsed_time.max": 93.85333333333334,
  "time.file_system_inputs": 56,
  "time.file_system_outputs": 128,
  "time.involuntary_context_switches": 2698703.3333333335,
  "time.major_page_faults": 50.333333333333336,
  "time.maximum_resident_set_size": 90016,
  "time.minor_page_faults": 80592,
  "time.page_size": 4096,
  "time.percent_of_cpu_this_job_got": 5772,
  "time.system_time": 5265.683333333333,
  "time.user_time": 152.25666666666666,
  "time.voluntary_context_switches": 2453,
  "will-it-scale.128.processes": 49465360,
  "will-it-scale.128.processes_idle": 33.25,
  "will-it-scale.192.processes": 71529124,
  "will-it-scale.192.processes_idle": 1.2666666666666668,
  "will-it-scale.64.processes": 27582414.666666668,
  "will-it-scale.64.processes_idle": 66.57,
  "will-it-scale.per_process_ops": 396656.3333333333,
  "will-it-scale.time.elapsed_time": 93.85333333333334,
  "will-it-scale.time.elapsed_time.max": 93.85333333333334,
  "will-it-scale.time.file_system_inputs": 56,
  "will-it-scale.time.file_system_outputs": 128,
  "will-it-scale.time.involuntary_context_switches": 2698703.3333333335,
  "will-it-scale.time.major_page_faults": 50.333333333333336,
  "will-it-scale.time.maximum_resident_set_size": 90016,
  "will-it-scale.time.minor_page_faults": 80592,
  "will-it-scale.time.page_size": 4096,
  "will-it-scale.time.percent_of_cpu_this_job_got": 5772,
  "will-it-scale.time.system_time": 5265.683333333333,
  "will-it-scale.time.user_time": 152.25666666666666,
  "will-it-scale.time.voluntary_context_switches": 2453,
  "will-it-scale.workload": 148576898.66666666

1. Unmodified 6.19-rc5

  "time.elapsed_time": 93.86000000000001,
  "time.elapsed_time.max": 93.86000000000001,
  "time.file_system_inputs": 1952,
  "time.file_system_outputs": 160,
  "time.involuntary_context_switches": 766225,
  "time.major_page_faults": 50.666666666666664,
  "time.maximum_resident_set_size": 90012,
  "time.minor_page_faults": 80635,
  "time.page_size": 4096,
  "time.percent_of_cpu_this_job_got": 5738,
  "time.system_time": 5251.88,
  "time.user_time": 134.57666666666665,
  "time.voluntary_context_switches": 2539,
  "will-it-scale.128.processes": 38223543.333333336,
  "will-it-scale.128.processes_idle": 33.833333333333336,
  "will-it-scale.192.processes": 54039039,
  "will-it-scale.192.processes_idle": 1.26,
  "will-it-scale.64.processes": 20579207.666666668,
  "will-it-scale.64.processes_idle": 66.74333333333334,
  "will-it-scale.per_process_ops": 300541,
  "will-it-scale.time.elapsed_time": 93.86000000000001,
  "will-it-scale.time.elapsed_time.max": 93.86000000000001,
  "will-it-scale.time.file_system_inputs": 1952,
  "will-it-scale.time.file_system_outputs": 160,
  "will-it-scale.time.involuntary_context_switches": 766225,
  "will-it-scale.time.major_page_faults": 50.666666666666664,
  "will-it-scale.time.maximum_resident_set_size": 90012,
  "will-it-scale.time.minor_page_faults": 80635,
  "will-it-scale.time.page_size": 4096,
  "will-it-scale.time.percent_of_cpu_this_job_got": 5738,
  "will-it-scale.time.system_time": 5251.88,
  "will-it-scale.time.user_time": 134.57666666666665,
  "will-it-scale.time.voluntary_context_switches": 2539,
  "will-it-scale.workload": 112841790

2. 6.19-rc5 + sheaves-for-all patchset

  "time.elapsed_time": 93.88,
  "time.elapsed_time.max": 93.88,
  "time.file_system_outputs": 128,
  "time.involuntary_context_switches": 450569.6666666667,
  "time.major_page_faults": 49.333333333333336,
  "time.maximum_resident_set_size": 90012,
  "time.minor_page_faults": 80581,
  "time.page_size": 4096,
  "time.percent_of_cpu_this_job_got": 5580,
  "time.system_time": 5162.076666666667,
  "time.user_time": 76.91666666666667,
  "time.voluntary_context_switches": 2467.6666666666665,
  "will-it-scale.128.processes": 25617118,
  "will-it-scale.128.processes_idle": 33.839999999999996,
  "will-it-scale.192.processes": 34502474,
  "will-it-scale.192.processes_idle": 1.3133333333333335,
  "will-it-scale.64.processes": 13540542.333333334,
  "will-it-scale.64.processes_idle": 66.74000000000001,
  "will-it-scale.per_process_ops": 197134.33333333334,
  "will-it-scale.time.elapsed_time": 93.88,
  "will-it-scale.time.elapsed_time.max": 93.88,
  "will-it-scale.time.file_system_outputs": 128,
  "will-it-scale.time.involuntary_context_switches": 450569.6666666667,
  "will-it-scale.time.major_page_faults": 49.333333333333336,
  "will-it-scale.time.maximum_resident_set_size": 90012,
  "will-it-scale.time.minor_page_faults": 80581,
  "will-it-scale.time.page_size": 4096,
  "will-it-scale.time.percent_of_cpu_this_job_got": 5580,
  "will-it-scale.time.system_time": 5162.076666666667,
  "will-it-scale.time.user_time": 76.91666666666667,
  "will-it-scale.time.voluntary_context_switches": 2467.6666666666665,
  "will-it-scale.workload": 73660134.33333333

3. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch

  "time.elapsed_time": 93.86666666666667,
  "time.elapsed_time.max": 93.86666666666667,
  "time.file_system_inputs": 1800,
  "time.file_system_outputs": 149.33333333333334,
  "time.involuntary_context_switches": 421120,
  "time.major_page_faults": 37,
  "time.maximum_resident_set_size": 90016,
  "time.minor_page_faults": 80645,
  "time.page_size": 4096,
  "time.percent_of_cpu_this_job_got": 5714.666666666667,
  "time.system_time": 5256.176666666667,
  "time.user_time": 108.88333333333333,
  "time.voluntary_context_switches": 2513,
  "will-it-scale.128.processes": 28067051.333333332,
  "will-it-scale.128.processes_idle": 33.82,
  "will-it-scale.192.processes": 38232965.666666664,
  "will-it-scale.192.processes_idle": 1.2733333333333334,
  "will-it-scale.64.processes": 15464041.333333334,
  "will-it-scale.64.processes_idle": 66.76333333333334,
  "will-it-scale.per_process_ops": 220009.33333333334,
  "will-it-scale.time.elapsed_time": 93.86666666666667,
  "will-it-scale.time.elapsed_time.max": 93.86666666666667,
  "will-it-scale.time.file_system_inputs": 1800,
  "will-it-scale.time.file_system_outputs": 149.33333333333334,
  "will-it-scale.time.involuntary_context_switches": 421120,
  "will-it-scale.time.major_page_faults": 37,
  "will-it-scale.time.maximum_resident_set_size": 90016,
  "will-it-scale.time.minor_page_faults": 80645,
  "will-it-scale.time.page_size": 4096,
  "will-it-scale.time.percent_of_cpu_this_job_got": 5714.666666666667,
  "will-it-scale.time.system_time": 5256.176666666667,
  "will-it-scale.time.user_time": 108.88333333333333,
  "will-it-scale.time.voluntary_context_switches": 2513,
  "will-it-scale.workload": 81764058.33333333

4. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch + increased
   the maple node sheaf capacity to 128

  "time.elapsed_time": 93.85000000000001,
  "time.elapsed_time.max": 93.85000000000001,
  "time.file_system_inputs": 1832,
  "time.file_system_outputs": 149.33333333333334,
  "time.involuntary_context_switches": 208686.33333333334,
  "time.major_page_faults": 57.666666666666664,
  "time.maximum_resident_set_size": 90016,
  "time.minor_page_faults": 80622,
  "time.page_size": 4096,
  "time.percent_of_cpu_this_job_got": 5788.333333333333,
  "time.system_time": 5295.993333333333,
  "time.user_time": 136.89333333333332,
  "time.voluntary_context_switches": 2521.3333333333335,
  "will-it-scale.128.processes": 46820500.666666664,
  "will-it-scale.128.processes_idle": 33.806666666666665,
  "will-it-scale.192.processes": 68584324.33333333,
  "will-it-scale.192.processes_idle": 1.2566666666666668,
  "will-it-scale.64.processes": 24292108.666666668,
  "will-it-scale.64.processes_idle": 66.74,
  "will-it-scale.per_process_ops": 367519.3333333333,
  "will-it-scale.time.elapsed_time": 93.85000000000001,
  "will-it-scale.time.elapsed_time.max": 93.85000000000001,
  "will-it-scale.time.file_system_inputs": 1832,
  "will-it-scale.time.file_system_outputs": 149.33333333333334,
  "will-it-scale.time.involuntary_context_switches": 208686.33333333334,
  "will-it-scale.time.major_page_faults": 57.666666666666664,
  "will-it-scale.time.maximum_resident_set_size": 90016,
  "will-it-scale.time.minor_page_faults": 80622,
  "will-it-scale.time.page_size": 4096,
  "will-it-scale.time.percent_of_cpu_this_job_got": 5788.333333333333,
  "will-it-scale.time.system_time": 5295.993333333333,
  "will-it-scale.time.user_time": 136.89333333333332,
  "will-it-scale.time.voluntary_context_switches": 2521.3333333333335,
  "will-it-scale.workload": 139696933.66666666


> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 7d7e1ae1922f..3458dfbab85d 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3378,7 +3378,8 @@ static inline bool pfmemalloc_match(struct slab *slab, gfp_t gfpflags);
>  
>  static bool get_partial_node_bulk(struct kmem_cache *s,
>  				  struct kmem_cache_node *n,
> -				  struct partial_bulk_context *pc)
> +				  struct partial_bulk_context *pc,
> +				  bool allow_spin)
>  {
>  	struct slab *slab, *slab2;
>  	unsigned int total_free = 0;
> @@ -3390,7 +3391,10 @@ static bool get_partial_node_bulk(struct kmem_cache *s,
>  
>  	INIT_LIST_HEAD(&pc->slabs);
>  
> -	spin_lock_irqsave(&n->list_lock, flags);
> +	if (allow_spin)
> +		spin_lock_irqsave(&n->list_lock, flags);
> +	else if (!spin_trylock_irqsave(&n->list_lock, flags))
> +		return false;
>  
>  	list_for_each_entry_safe(slab, slab2, &n->partial, slab_list) {
>  		struct freelist_counters flc;
> @@ -6544,7 +6548,8 @@ EXPORT_SYMBOL(kmem_cache_free_bulk);
>  
>  static unsigned int
>  __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min,
> -		      unsigned int max, struct kmem_cache_node *n)
> +		      unsigned int max, struct kmem_cache_node *n,
> +		      bool allow_spin)
>  {
>  	struct partial_bulk_context pc;
>  	struct slab *slab, *slab2;
> @@ -6556,7 +6561,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
>  	pc.min_objects = min;
>  	pc.max_objects = max;
>  
> -	if (!get_partial_node_bulk(s, n, &pc))
> +	if (!get_partial_node_bulk(s, n, &pc, allow_spin))
>  		return 0;
>  
>  	list_for_each_entry_safe(slab, slab2, &pc.slabs, slab_list) {
> @@ -6650,7 +6655,8 @@ __refill_objects_any(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min
>  					n->nr_partial <= s->min_partial)
>  				continue;
>  
> -			r = __refill_objects_node(s, p, gfp, min, max, n);
> +			r = __refill_objects_node(s, p, gfp, min, max, n,
> +						  /* allow_spin = */ false);
>  			refilled += r;
>  
>  			if (r >= min) {
> @@ -6691,7 +6697,8 @@ refill_objects(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min,
>  		return 0;
>  
>  	refilled = __refill_objects_node(s, p, gfp, min, max,
> -					 get_node(s, local_node));
> +					 get_node(s, local_node),
> +					 /* allow_spin = */ true);
>  	if (refilled >= min)
>  		return refilled;
>  
> -- 
> 2.52.0
> 
> 

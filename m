Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612AD443AB8;
	Wed, 23 Sep 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145363; cv=none; b=s91MviKZPUAFUaOc9+K9/HGk3cV7+ud7kF0OAiGKU4VZX/LNFXrCCtYgkHrvSoaS9beWCk9IQSesYvMuiHHQ13RfX2+F9StCt4/ev8BqS0eaYKnk4jPQ8KpvPs1a9UxTQPd7ElCZ0aKHJw9SkaQ44Zjp36yF+oMrqQs0M56GA20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145363; c=relaxed/simple;
	bh=e3EV+bgTQMNIGaDDugrfwsPK65Buz/F2IuA6IxfKJ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsCBT1UbgUExHmCtaC5SIpJuV3ObO/sWJfqqA0aPxTDmJIGV80So5QYSYrd6ggh4lVoZHoG274lO6A4A91NUfzvUjdvTYnoWjLF+g+DiS95wqu/tOZcfNzboPT8lGPSzRSLWFfeT0JBsHz6o6U1ozg42grussnk844EfdZmzUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6nkKtCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6nkKtCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F34E1F000FF;
	Wed, 23 Sep 2026 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790145353;
	bh=0lkUVys8gvUjF/9PcP1iToEGr3wc3OwcQw4hSpUPIN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y6nkKtCzEeqId9jMLa0VpqG7vVmn6qXI47fFEsnF917E5SKaQy8E14ioPXN/eoegQ
	 CfgIhwCcqL1okZeQtygWog5zd0RFe+uSsZXrzBmPHzWXEJtXG4ypSy+1uD5rFx9Cj7
	 l/9d6pUxhAMnzY4DpakXGPQ7BZPsnQECF3dV0jopfD4LGmhoEGsvCxRlCxIert7RYm
	 IE2KgQ2Xs93KwTdDGmGbOPGanWdhNR0wzp8hJs1oXu/lL57s9Qm0trbH93804Yz3oh
	 kTdqLdQ5HpGG0fDu+C+Zc5TGoeH2uT3I0dfV6+9T45m+fCB7i6NV574TgvmTMJisBa
	 ruNJ0CX+0KYVA==
Message-ID: <7ea6e90a-e2fb-4793-b6ea-e292388bdfdf@kernel.org>
Date: Wed, 23 Sep 2026 08:35:47 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm/secretmem] 97d34aa65c:
 stress-ng.secretmem.ops_per_sec 99.5% regression
Content-Language: en-US
To: kernel test robot <yi1.lai@intel.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Daehyeon Ko <4ncienth@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Jakub Kacinski <kuba@kernel.org>,
 James Bottomley <james.bottomley@hansenpartnership.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Suren Baghdasaryan
 <surenb@google.com>, linux-mm@kvack.org
References: <202609230824.7a9189aa-lkp@intel.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <202609230824.7a9189aa-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/23/26 03:00, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 99.5% regression of stress-ng.secretmem.ops_per_sec on:
> 
> commit: 97d34aa65c29cca85e3e9050f4c936389b38a054 ("mm/secretmem: properly account locked pages") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Well maybe there is some inefficiency that can be fixed (haven't checked)
but if it's the cost for proper accounting then so be it? I doubt creating
secretmem pages is something userspace would have to do intensively enough
to matter.

> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: secretmem
> 	cpufreq_governor: performance
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202609230824.7a9189aa-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260923/202609230824.7a9189aa-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/secretmem/stress-ng/60s
> 
> commit: 
>   35b0fb391b ("mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP")
>   97d34aa65c ("mm/secretmem: properly account locked pages")
> 
> 35b0fb391b0df573 97d34aa65c29cca85e3e9050f4c
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>    6080503           -99.6%      23092 ±  3%  stress-ng.secretmem.ops
>      85584           -99.5%     385.28 ±  3%  stress-ng.secretmem.ops_per_sec
>      71.48           -16.0%      60.07        stress-ng.time.elapsed_time
>      71.48           -16.0%      60.07        stress-ng.time.elapsed_time.max
>      97435 ±  2%   +1276.4%    1341103        stress-ng.time.involuntary_context_switches
>     230308           -96.1%       9096        stress-ng.time.maximum_resident_set_size
>   18401243         +3349.6%  6.348e+08        stress-ng.time.minor_page_faults
>      20417            -8.7%      18639        stress-ng.time.percent_of_cpu_this_job_got
>      14581           -25.0%      10937        stress-ng.time.system_time
>      13.34         +1858.5%     261.33        stress-ng.time.user_time
>       6898 ±  2%  +96037.7%    6631576 ±  3%  stress-ng.time.voluntary_context_switches
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 


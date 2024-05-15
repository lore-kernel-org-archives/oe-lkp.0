Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5C39FF2
	for <oe-lkp@lists.linux.dev>; Wed, 15 May 2024 04:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749094; cv=none; b=j2+NvsGABAFw6duZNwoNjxju9h7JLYdzN5sUL08GyBKYAHSwJlxoi1WqktCgP1JpZRV5cWoANkptRlTOvUBZ4NE0Aqp51t2Sq40bztX2p41TBIFB4SQ2yi0Id+1yA+ak2qLFEkvRU0pd9X2tBb8L9k67UFK31f0TBe03OWs2qPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749094; c=relaxed/simple;
	bh=MZv8vVkxWt843xgGuDyV8nKiUPVS7Es5oBBBIszxCyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XPThx+B34oigD/XftxGXBXGzMuE5av+erxZjELS/tEF4ncbcJbNKtwYLVMWialNPQsnzJsjd0LzWuVstPq1yl277DR6CwtFtxgVuUbm5gDR4x27zwE/+ALKiFsAmwyd05oRxo7Iv4CWBt3/GRGZa5IF4jBdz8AYdko8iKsbrXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af258.dynamic.kabel-deutschland.de [95.90.242.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7C45461E5FE07;
	Wed, 15 May 2024 06:57:40 +0200 (CEST)
Message-ID: <23f86436-cd8a-45b0-9378-1ec3adecfc82@molgen.mpg.de>
Date: Wed, 15 May 2024 06:57:39 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [linus:master] [e1000e] 861e808602:
 suspend-stress.fail (e1000e: move force SMBUS from enable ulp function to
 avoid PHY loss issue)
To: Oliver Sang <oliver.sang@intel.com>
Cc: Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Naama Meir <naamax.meir@linux.intel.com>, oliver.sang@intel.com,
 linux-kernel@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>,
 yu.c.chen@intel.com, oe-lkp@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, rui.zhang@intel.com,
 Dima Ruinskiy <dima.ruinskiy@intel.com>
References: <202405150942.f9b873b1-oliver.sang@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <202405150942.f9b873b1-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Oliver,


Thank you for the report.

Am 15.05.24 um 03:50 schrieb kernel test robot:

> kernel test robot noticed "suspend-stress.fail" on:
> 
> commit: 861e8086029e003305750b4126ecd6617465f5c7 ("e1000e: move force SMBUS from enable ulp function to avoid PHY loss issue")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master a7c840ba5fa78d7761b9fedc33d69cef44986d79]
> [test failed on linux-next/master 6ba6c795dc73c22ce2c86006f17c4aa802db2a60]
> 
> in testcase: suspend-stress
> version:
> with following parameters:
> 
> 	mode: freeze
> 	iterations: 10
> 
> 
> 
> compiler: gcc-13
> test machine: 4 threads (Broadwell) with 8G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405150942.f9b873b1-oliver.sang@intel.com
> 
> test started
> 
> <--- but cannot really run suspend-stress tests successfully
> 
> 
> as a contrast, for parent, we always noticed the jobs run smoothly
> 
> SUSPEND RESUME TEST STARTED
> Suspend to freeze 1/10:
> /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-bdw-nuc1/suspend-stress-10-freeze-debian-x86_64-20180403.cgz-6dbdd4de0362-20240406-63993-p7cw6d-0.yaml&job_state=suspending-1/10 -O /dev/null
> Done
> Sleep for 10 seconds
> 
> ...
> 
> Suspend to freeze 10/10:
> /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-bdw-nuc1/suspend-stress-10-freeze-debian-x86_64-20180403.cgz-6dbdd4de0362-20240406-63993-p7cw6d-0.yaml&job_state=suspending-10/10 -O /dev/null
> Done
> Sleep for 10 seconds
> SUSPEND RESUME TEST SUCCESS
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240515/202405150942.f9b873b1-oliver.sang@intel.com
> 
> 
> if you need more information, please let us know. Thanks!

Can you please share on what test system this fails, and provide the 
hardware information?

Also, do you have Linux logs until starting the tests?


Kind regards,

Paul


PS: In the Cc: header field, your address misses an l in domain part 
intel.com.

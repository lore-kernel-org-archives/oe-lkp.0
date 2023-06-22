Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DACF34CE2
	for <oe-lkp@lists.linux.dev>; Thu, 22 Jun 2023 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D458C433C8;
	Thu, 22 Jun 2023 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687422625;
	bh=+3bhOWdKmIVFqafQUQ3k3iMy77jkrN8TVbh6Ta1cvm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=swD3m5EWDl4TeE08aha6k14r+CzeNS98ISMVIImQCiWY4fZgJpxcvSurpqSY1+LEl
	 7NiAiwb3HBKpwcbVZuAeXJKPUJltsbAoPpXPvAkv6y4XjRtzTN7zpMviRmiOx1d5df
	 IdL99l9mr3HxDjGmtm2djfXVrZponB9kvpV1MTrI8v76T+KaNCmQwuBVlRxk+IpP7L
	 Ng1HmC73zbodBiEty7+7XIKOJGoi3deth90qcGji1dksXIatsU1ZmfsEGl7UygRLj1
	 arFwRHNcNiAHjWPOESKLP0O9iKWQjdpiGkYliNdySaYuij6L4sJIzjIaTKRPHXJhnm
	 p1uRx+8gnTKkg==
Message-ID: <09815276-c515-7f3b-e81c-6c60e9ebfe4c@kernel.org>
Date: Thu, 22 Jun 2023 17:30:22 +0900
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [LTP] [linux-next:master] [scsi] eca2040972:
 ltp.ioprio_set03.fail
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Cyril Hrubis <chrubis@suse.cz>, kernel test robot
 <oliver.sang@intel.com>, "lkp@intel.com" <lkp@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Hannes Reinecke <hare@suse.de>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 Christoph Hellwig <hch@lst.de>, "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <202306192248.1ece4c29-oliver.sang@intel.com>
 <61f22c1d-6b04-d193-57c9-8cad1c555e4b@kernel.org> <ZJLxbwCno-it2xBB@yuki>
 <ZJMYP/CCVviG6IMq@x1-carbon> <20230622073256.GA482307@pevik>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230622073256.GA482307@pevik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/23 16:32, Petr Vorel wrote:
>> On Wed, Jun 21, 2023 at 02:47:43PM +0200, Cyril Hrubis wrote:
>>> Hi!
>>>>> kernel test robot noticed "ltp.ioprio_set03.fail" on:
> 
>>>> LTP maintainers,
> 
>>>> Patches have been submitted to fix this issue. Were these patches applied ?
> 
>>> Looks like they are in, at least these two:
> 
>>>     ioprio: use ioprio.h kernel header if it exists
>>>     ioprio: Use IOPRIO_PRIO_NUM to check prio range
> 
>>> And there does not seem to be anything ioprio related haning in the LTP
>>> patchwork.
> 
> Hi Niklas,
> 
>> Hello Cyril, Petr, Damien,
> 
> 
>> I just ran LTP master + linux-next and the test case passes for me.
> 
> 
>> Although, note that even if you are using LTP master,
>> the way that the LTP header:
>> testcases/kernel/syscalls/ioprio/ioprio.h
>> is written, you will need to run
> 
>> make headers_install
>> with linux-next kernel source,
> 
>> before running
>> make autotools && ./configure
>> in LTP.
> 
>> Otherwise LTP will use the kernel uapi headers from your distro,
>> which does not perform the new checks for the IOPRIO_PRIO_VALUE()
>> macro. (It requires linux uapi headers from linux-next.)
> 
> Yes, it should do otherwise more tests would be often broken.
> 
> 
>> Does the linux kernel test robot not run
>> make headers_install
>> before running
>> make autotools && ./configure
>> in LTP?
> 
> I guess that's the question for Damien (I and Cyril have nothing to do with
> kernel test robot). I wonder myself.

Sorry, but I have nothing to do with the kernel robot either. I am only acting
when I get notified of a problem due to one of my patches.

-- 
Damien Le Moal
Western Digital Research


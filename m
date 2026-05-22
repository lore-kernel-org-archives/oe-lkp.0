Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4C44CAC6
	for <oe-lkp@lists.linux.dev>; Fri, 22 May 2026 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461070; cv=none; b=NErdzGWMfyvN5YO+qPdCJ0G11leY8ifvSWe/JOzTs2QO0wC7E+4A1gvWtOFMXFDjsKF39lix3vSIvMU/uNa4DZxgQZjBIsLka25LVa/SwE43X8x2C3rRMrwa1kueNh91oSVRBhMp2MTgZf/MWPbgX5Qd5VnYFwdQ6tOjvPjQ2DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461070; c=relaxed/simple;
	bh=rLBthh7zxEiPnzhGQRjAgnmltqBkDyRp+cpWWzNFaP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+YR/brgZVcJF4hVBWiXSH+EpQdZ8kJefQsJFz5RVSlXLV8uKqnHSxeDcflmpUbpxdncYbEzMPDCYUMjp7VzFgXti8WM31SdwnawY/XLs4lJscOVk8yQ0Eiy1hRX4uba9ukCD+iv7ACfXxeuUYwWyM+3DzxDw+r/01jnYd7+ihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0xk8tYT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0xk8tYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B6B1F000E9;
	Fri, 22 May 2026 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779461068;
	bh=8DF/A+szhwbuz+2nSWgzzrz066HQqGdxgJmdWKxjCuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i0xk8tYTlnWycUambv6K+eaDirNs91oo/9bqoHEVJrWXsZF6necPPcXFDXqYoUQKV
	 Vbf7u8j/Xq7olgoib1EOlWPXuCPt7t+ftRFi7r/iYy5f7dnSlmtuFjZ+nlI71CTG0d
	 pE13nZMlZDWLc/+h+4j8vZlJ/i65Fj0IfUMdJj8IR5FUVbGqUoAMYT5lQLjA0aMe9/
	 +Melr4BVyao+Xe1uXmUk867+EeEjIDeVebjX+KFUIssNwftgjnti6z8fp0byFQ/3gg
	 K3UmjyDiIazNeZy2lM3FhWe+rCSGRXLBbqRvyqECIrOaH/GmDqjBWNTbqtpqzXQsyK
	 5a04dTMHSDrfQ==
Message-ID: <e14c0efe-1b4b-4331-934d-162449fb7291@kernel.org>
Date: Fri, 22 May 2026 16:44:25 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm, slab] 298cdbf5f7:
 will-it-scale.per_process_ops 6.3% regression
Content-Language: en-US
To: Oliver Sang <oliver.sang@intel.com>
Cc: "Harry Yoo (Oracle)" <harry@kernel.org>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Hao Li <hao.li@linux.dev>, linux-mm@kvack.org
References: <202605112204.9382cecf-lkp@intel.com>
 <90bf195e-45fb-423c-b686-49be9cadbd11@kernel.org>
 <eda98e7b-67fd-4a36-9d39-3de26827599b@kernel.org>
 <d28b4a2f-501a-45dc-8589-acc41633e2e3@kernel.org>
 <agp1kUJSzZqyJO81@xsang-OptiPlex-9020>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <agp1kUJSzZqyJO81@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 04:12, Oliver Sang wrote:
> hi, Vlastimil Babka,
> 
> On Thu, May 14, 2026 at 06:02:59PM +0200, Vlastimil Babka (SUSE) wrote:
>> On 5/14/26 18:00, Vlastimil Babka (SUSE) wrote:
>> > On 5/14/26 16:45, Vlastimil Babka (SUSE) wrote:
>> >> On 5/11/26 16:45, kernel test robot wrote:
>> >>> 
>> >>> 
>> >>> Hello,
>> >>> 
>> >>> kernel test robot noticed a 6.3% regression of will-it-scale.per_process_ops on:
>> >> 
>> >> Yay for an optimization that was supposed to have no tradeoffs :)
>> > 
>> > Does this help? I don't expect much, but perhaps...
>> 
>> And a separate measurement with this on top of the previous one, plase?
> 
> we applied previous one in [1] on top of 298cdbf5f7, then applied this one on
> top of [1], the git tree is as below:
> 
> * 487ba8f16af85 mm, slab: ADD_TO_TAIL in __refill_objects_node
> * 200ca7702bc5a mm, slab: simplify __refill_objects_node
> * 298cdbf5f7c9e mm, slab: add an optimistic __slab_try_return_freelist()
> * 1f7c8e1d52428 mm/slub: defer freelist construction until after bulk allocation from a new slab
> 
> in our tests, it seems 200ca7702bc5a have little impact as you expected.
> but 487ba8f16af85 not only recovered the performance regression, it now makes
> the results a little better than 1f7c8e1d52428.

Thanks a lot! I've reshuffled things a bit here, to put the changes that
were not impactful as a cleanup after fixed up version of the original patch.

https://lore.kernel.org/all/20260522-b4-refill-optimistic-return-v3-0-2ba78ec1c6ed@kernel.org/



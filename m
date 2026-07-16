Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AEA411678
	for <oe-lkp@lists.linux.dev>; Thu, 16 Jul 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197981; cv=none; b=f/zOYkhxcM+ZbMxxlYth2Lq2z2/iXnILYxIUJ5SQ7f3dBUx1+8HA5OR2Dq1yp53UXKijCV6eRTSfYGBUpvqkxIyvh0iShAZkkP2JM1BfN/7F58KmrdabPgcfCUaEbOpDkGusgbiQmB85LIX/byN0ERVXXIvPMo+G8H086Cg5poU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197981; c=relaxed/simple;
	bh=rkjv/SpOifKyavZEEIA9tjwYr5i07IoORLOPhKOxurU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NowBCczIR1gn6REJfirs0oBNaGlGrR9wt/q+Uf2B4kb15/ANkllSExMj2hm2cyaIK2wVns+pgt9Lpa8UL2sy9Hvxe26K4foafHyGoMZoTL1VPOvhNq+xC4RFT7l1pYb7EnuWGWshEfIqu9HVlBAHDCkJFmrrpopf/wVrLnpN8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBMhMZpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBMhMZpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775CA1F00A3D;
	Thu, 16 Jul 2026 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784197979;
	bh=ABaZ+YcrtNMNCAwicFRs1ZvuJFo8JyIItRGawnP1JNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XBMhMZpZWSt7gZDfuKvLQ715QK7nv0dLuG7vQftxEMaBGraCxU+NPf22zwRv+r6fU
	 vfQQ39aPb0vsMLr5t//3nsew+G/hDq072aIMGKYjho0kgVOJ6Mb4mSY7VQPLeDp7sx
	 1mSip7a1FmDHddAtR+9Y549puaxC5eGU1AGycKh9wz42MOYl9O7fnZKPDbtlQAgrm4
	 DwidfaKVLlKfnUy0HHAooLdb4abHnVnII8B1dzEUdZzDcZP00yuyESbqokzju+ZnYa
	 ISdIIMUH+vjER+Tthwa+OxJZWZGjrX3ETklHBVsM2YqHVCvB+7NxH6A0LYDP9071sb
	 lped5wPDlr6LA==
Message-ID: <040d41e3-26c2-4f69-b02e-41a814804d94@kernel.org>
Date: Thu, 16 Jul 2026 19:32:56 +0900
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r3] [mm/slab] d6967566f4:
 RIP:mark_obj_codetag_empty
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Danielle Costantino <dcostantino@meta.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org
References: <202607142131.f70bbad3-lkp@intel.com>
 <7bdfdc92-7e75-4dc6-9549-e75b46218b93@kernel.org>
 <aliMiGyj4cgBNIzQ@xsang-OptiPlex-9020>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <aliMiGyj4cgBNIzQ@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oliver,

On 7/16/26 4:47 PM, Oliver Sang wrote:
> hi, Harry,
> 
> On Thu, Jul 16, 2026 at 11:27:11AM +0900, Harry Yoo wrote:
>>
>> Thanks for reporting!
>>
>> Indeed I've seen this false warning and it was fixed in v2.
>>
> 
> thanks a lot for information!
> 
> I remember I checked if the branch is latest when reporting, now I check again:
> 
>   kmalloc-no-objext-rfc-v1r2
>   kmalloc-no-objext-rfc-v1r3
>   kmalloc-no-objext-v2r1    <-----
>   kmalloc-no-objext-v2r2
>   kmalloc-no-objext-v3r1
> 
> oh, I guess kmalloc-no-objext-v* is the following version to kmalloc-no-objext-rfc-v*,
> am I right?

That's correct.

It usually starts w/ RFC, then at some point I drop RFC and
advance the version number.

For example,

<name>-rfc-v1r1,
<name>-rfc-v2r1
<name>-rfc-v2r2 # drop RFC in the next version
<name>-v3r1,
<name>-v4r1,
<name>-v4r2,

[...]

> will be more careful in the future. sorry for noise.

No worries, and thanks for testing, as always!

-- 
Cheers,
Harry / Hyeonggon

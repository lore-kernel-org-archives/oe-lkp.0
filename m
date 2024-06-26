Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5992B9C0
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jun 2024 02:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719369832; cv=none; b=KSIq1UoV/7sYcwNubY9QgNnfEVfJ1mwlBItbJdejt6jr62yXvYfKnyiYqkwhjresWPgjoE/bJvpx+KiririDSWyzQOnteOAfSY+coOQHoFXBpFjK+eTRRQZgYyx+bmX0WGnCeBpdYH1eEjZcbeasrfLsImfj+49xkUvDl5P3tXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719369832; c=relaxed/simple;
	bh=TzY9oXfU4TeXQZB7XaW00qJcluE2fxDXhq6G00qJFl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqZqHBu3ZHdzeWUMGqhQ3wL6XkMbVPSor7gCw2rtSXbp4GjJ8w0BjwWPxLvOg0IqgUy0QkbmkFML4P42q6/IEPfmUh6MjT7WRFPF18awIoesPze+QC4MGAlmZHd7bruiPR8xum8mVGBTa+ikC8E+ScjMncXhE5YqZ1R1QEWlD3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aeh/3v/N; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aeh/3v/N"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5c20995d038so1149031eaf.3
        for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719369830; x=1719974630; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG3w2INBk5u/Jo1IIm6PkNLzmbMpq9WYWJppu8bUdBY=;
        b=Aeh/3v/NsPrBBxEUMbtmQD+Os50Jukyafpi5MTKOaWrOnN0cjjLPG4OQpOOcDzisk+
         q94qDsnlm5T7kMynKDostadnAulPlRB0eH5ubBMYzm7hdXw3KpqWiCsz0dAhNuBN+9CG
         ZSNFupgXu5rJ4gQbDfkGh3hWy5HwmlOfKXXRM1xJTPbXXLVxZyFOHTtc4fWmXMu7VBw/
         YiR477oZS6r/59Mb9JYErcargK1nFHBHb31W0Uej4lyEvBeUsnZm2UYhfIJFcFjii66b
         JoNX+EPPNnuYJqFi3PnJpTQBZKYQRAKpcL42HLjEnnTZgkhd8pPGVkcuXFK6wUfDycw4
         m9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719369830; x=1719974630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rG3w2INBk5u/Jo1IIm6PkNLzmbMpq9WYWJppu8bUdBY=;
        b=I8ygYEXTLLw7zdZMgAahPzPpZkN/MHnhWr/j0VhTjBp6xCbDhMh21gLouzx3K4J4sY
         faXXG+krgs8k+Djo4yCcAclR0OCGHiRZlteg8rGOeRrdl1EcfkyuiLKK+nyphJQLfhgt
         i8LZuUOhyXprTmiNYFzPUXxLsFwR37IUS7ucVUwoq/N6Wo71IS+T9O4h+EqwJutdz5sd
         8EYCMJNqlQiy0rTvX/kbgMXFk03KNa0Zz0rDnqUy6IDeYhm37U/iv9+1a8MAWatv8U+J
         fLODw1bNjvoYMPikoSsAky8Kl5qWvIWDyULqr46LD4cVVQ95s8BLzPTqtxrQxAqDHWx+
         C4Aw==
X-Gm-Message-State: AOJu0YzHs++DMsCfw1r8ES+eIqRSKHVvZLgxDoX+po74hngwPtLkHIF3
	zzVZ/9D0LjRUlXOXw8jSo/CEPGsMpbSXL2OFkJwLqKZi6vO4Ku9V
X-Google-Smtp-Source: AGHT+IEjxmrGj+JcppGKsHuvAml5K0hl12hsilsm8VxYcrA9SLuZHhJ4SZn30SN7L3TgCQBWYTWv2A==
X-Received: by 2002:a05:6359:5fa9:b0:1a5:b0f7:259 with SMTP id e5c5f4694b2df-1a5b0f706b4mr62750055d.21.1719369829652;
        Tue, 25 Jun 2024 19:43:49 -0700 (PDT)
Received: from [10.22.68.7] ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b36487a9sm7856921a12.2.2024.06.25.19.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 19:43:49 -0700 (PDT)
Message-ID: <e84c7233-70cf-42d8-87f6-6ed6e40087c7@gmail.com>
Date: Wed, 26 Jun 2024 10:43:45 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [bpf, x64] f663a03c8e:
 test-bpf.Tail_call_count_preserved_across_function_calls.fail
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
References: <202406251415.c51865bc-oliver.sang@intel.com>
 <ac402815-923c-49ec-b027-4f99b55c895e@gmail.com>
 <Znt6wPH24lQlbYrO@xsang-OptiPlex-9020>
Content-Language: en-US
From: Leon Hwang <hffilwlqm@gmail.com>
In-Reply-To: <Znt6wPH24lQlbYrO@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/6/24 10:19, Oliver Sang wrote:
> hi, Leon Hwang,
> 
> On Tue, Jun 25, 2024 at 04:25:00PM +0800, Leon Hwang wrote:
>>
>>
>> On 25/6/24 14:55, kernel test robot wrote:
>>>
>>>
>>> Hello,
>>>
>>> kernel test robot noticed "test-bpf.Tail_call_count_preserved_across_function_calls.fail" on:
>>>
>>> commit: f663a03c8e35c5156bad073a4a8f5e673d656e3f ("bpf, x64: Remove tail call detection")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> [test failed on linux-next/master 62c97045b8f720c2eac807a5f38e26c9ed512371]
>>>
>>> in testcase: test-bpf
>>> version: 
>>> with following parameters:
>>>
>>> 	test: non-jit
>>>
>>>
>>>
>>> compiler: gcc-13
>>> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory
>>>
>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>>
>>>
>>>
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202406251415.c51865bc-oliver.sang@intel.com
>>>
>>>
>>>
>>> [   43.913560] test_bpf: #0 Tail call leaf jited:1 5 PASS
>>> [   43.913572] test_bpf: #1 Tail call 2 jited:1 ret -1 != 3 FAIL
>>> [   43.914138] test_bpf: #2 Tail call 3 jited:1 ret -1 != 6 FAIL
>>> [   43.914756] test_bpf: #3 Tail call 4 jited:1 ret -1 != 10 FAIL
>>> [   43.915374] test_bpf: #4 Tail call load/store leaf jited:1 5 PASS
>>> [   43.915993] test_bpf: #5 Tail call load/store jited:1 ret -1 != 0 FAIL
>>> [   43.916636] test_bpf: #6 Tail call error path, max count reached jited:1 ret 1000 != 34000 FAIL
>>> [   43.917319] test_bpf: #7 Tail call count preserved across function calls jited:1 ret 1000 != 34000 FAIL
>>> [   43.918799] test_bpf: #8 Tail call error path, NULL target jited:1 5 PASS
>>> [   43.919720] test_bpf: #9 Tail call error path, index out of range jited:1 5 PASS
>>> [   43.920474] test_bpf: test_tail_calls: Summary: 4 PASSED, 6 FAILED, [10/10 JIT'ed]
>>>
>>
>> Hi,
>>
>> May I request the source code of these test cases?
>> I do not find them in lkp-tests.
> 
> test-bpf doesn't have source code.
> 
> you could refer to
> https://github.com/intel/lkp-tests/blob/master/programs/test-bpf/run
> to see how it runs.
> 
> then
> https://github.com/intel/lkp-tests/blob/master/programs/test-bpf/parse
> to see how the results are parsed.
> 

I found their source code. Then I fixed it by "bpf: Fix tailcall cases
in test_bpf"[0].

[0] https://lore.kernel.org/bpf/20240625145351.40072-1-hffilwlqm@gmail.com/

Thanks,
Leon

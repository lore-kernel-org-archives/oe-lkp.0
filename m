Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C5148307
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303908; cv=none; b=U9gDOE/Y3YjPM0VRME632smTv3SSnNdclaZPt8CIMqyXC84Lyh5DIczX9kX+FC+vRp4/GY6uyV1NOhDEb6gGmuYOiXjM8MYXQaS43mkcyiQCZXaOSKQfRsR8eO2U/2bV0QUwtGVwB+iDoFxj8pRcQ5w5mfLQn5+MOLA8xGiniqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303908; c=relaxed/simple;
	bh=x9Xq4nJRhjjFa5IMN1qjncFsaG0ztpmFcergDKd1o2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azMfQZuE3kMzKdD5bSwGSjQaLTt/ICpDyVKCPh936VpCg7Jr7ZcsFeYQH+JlY5fk+i6qE9LF9m+wYRlSAWWKNRC8IZ4X07wzlQil7WU7wOobXV7kPpMfC3nutwwVtnYs12KywcHTd3dzteilICk4ScM3QRI5OGUtj/DnH3VAuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHJ3KlE4; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHJ3KlE4"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5c1b27e0a34so2541840eaf.2
        for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303905; x=1719908705; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ic0gR8lv1bzgi74/8//kPAW6gA0eMoG+p7FcgAs/fPw=;
        b=LHJ3KlE4w1FB2uKk/HmWvCaTQKCu2khYzV8ZzyIoEaAyMx9mDCfBKXVNh1eKz3EfEK
         gBSEWIgYLHyV9lTwtS94xGhnM5oByM6GHtpY2lHflJF+a8aBntLpP/1DhnLD4DEZIak4
         OHESBl73NQAPzBXXjMLXpqOA2v1KK6U/JLn1R+B29fb+Dy3Q7HWw8uqYH9uwAX97Ccoc
         NPEtsw4H59zekmghl7gRuIZeVwPYUPIQlXg6oDxpvxflmL7NL54ncu+vXqxqWHO7vxyw
         fw+J6+VFfMCTqfrXeugfCpV4ntrFm8Hd8gUzwJXvWkXz3L+fuWrbu6tzUsICXj65hFMX
         wufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303905; x=1719908705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ic0gR8lv1bzgi74/8//kPAW6gA0eMoG+p7FcgAs/fPw=;
        b=gIoPVAQSfUfpcsg6czdrZc1L3tQRUPpac2OKkkgRELj+Mw68SGDBMwKVh5q1mVcPhh
         orgxnzVuK3KeUlM1GmK0Zf8NwEDNTq66suOn3c1z1eq9QZTSCVkXx7OJXP4i8QWUIg1E
         jR8wWYFS/2FTPflMPv1ACwSKBWEmQSq3qQqSKli+OVpuaJtzj9Ztgbw2Kf86U0BAzVCc
         1lNmFYRaK4CzekAsN15VeIIEAGUSe9uaGzJOt9052LEtWTIm3ZZG0K0+EAxD9PnZnK3O
         7q6E2LHbx3V+DTe+jTJ8GfUXokDjgYBW5wkiYclh1VJb2XJQoUYK3K4r53m3+yjzxZhj
         Y1mg==
X-Gm-Message-State: AOJu0YxTPijBOuPzxDpIkXK1DJh5xaiSQ74Z22ZjUZ3VK8V8maWbfeiR
	GsnunGPjz86gtA8qkS4L3v5TUn0RPUCR2UN4rW7ySlbludZgU3MK
X-Google-Smtp-Source: AGHT+IHHtCpPitKeFignih/Zbj7MxleXlHtKMu6APKY8FCO4SUGxC+GN7Lm7vSGr6hOFkVSmcD67Fw==
X-Received: by 2002:a05:6358:7e88:b0:1a4:617d:6fea with SMTP id e5c5f4694b2df-1a4617d7377mr119874755d.6.1719303904573;
        Tue, 25 Jun 2024 01:25:04 -0700 (PDT)
Received: from [10.22.68.7] ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716bb041180sm6664845a12.80.2024.06.25.01.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 01:25:03 -0700 (PDT)
Message-ID: <ac402815-923c-49ec-b027-4f99b55c895e@gmail.com>
Date: Tue, 25 Jun 2024 16:25:00 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [bpf, x64] f663a03c8e:
 test-bpf.Tail_call_count_preserved_across_function_calls.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
References: <202406251415.c51865bc-oliver.sang@intel.com>
Content-Language: en-US
From: Leon Hwang <hffilwlqm@gmail.com>
In-Reply-To: <202406251415.c51865bc-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/6/24 14:55, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "test-bpf.Tail_call_count_preserved_across_function_calls.fail" on:
> 
> commit: f663a03c8e35c5156bad073a4a8f5e673d656e3f ("bpf, x64: Remove tail call detection")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 62c97045b8f720c2eac807a5f38e26c9ed512371]
> 
> in testcase: test-bpf
> version: 
> with following parameters:
> 
> 	test: non-jit
> 
> 
> 
> compiler: gcc-13
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202406251415.c51865bc-oliver.sang@intel.com
> 
> 
> 
> [   43.913560] test_bpf: #0 Tail call leaf jited:1 5 PASS
> [   43.913572] test_bpf: #1 Tail call 2 jited:1 ret -1 != 3 FAIL
> [   43.914138] test_bpf: #2 Tail call 3 jited:1 ret -1 != 6 FAIL
> [   43.914756] test_bpf: #3 Tail call 4 jited:1 ret -1 != 10 FAIL
> [   43.915374] test_bpf: #4 Tail call load/store leaf jited:1 5 PASS
> [   43.915993] test_bpf: #5 Tail call load/store jited:1 ret -1 != 0 FAIL
> [   43.916636] test_bpf: #6 Tail call error path, max count reached jited:1 ret 1000 != 34000 FAIL
> [   43.917319] test_bpf: #7 Tail call count preserved across function calls jited:1 ret 1000 != 34000 FAIL
> [   43.918799] test_bpf: #8 Tail call error path, NULL target jited:1 5 PASS
> [   43.919720] test_bpf: #9 Tail call error path, index out of range jited:1 5 PASS
> [   43.920474] test_bpf: test_tail_calls: Summary: 4 PASSED, 6 FAILED, [10/10 JIT'ed]
> 

Hi,

May I request the source code of these test cases?
I do not find them in lkp-tests.

Thanks,
Leon

> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240625/202406251415.c51865bc-oliver.sang@intel.com
> 
> 
> 

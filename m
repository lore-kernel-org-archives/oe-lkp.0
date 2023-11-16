Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72BC31752
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="Vxo9PPNi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6bd73395bceso663870b3a.0
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700144198; x=1700748998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ElVUWhYwhjUaz+i5fxEQgGZtu9viVprV+RDlHgmr48=;
        b=Vxo9PPNibFge+K0yxqSVepP0yliLGkQaAgueh/A8hgmw3oM+j+vyOkTarymmZefHIY
         8FygoX7BlrWQxTo2hzYdrBpr9rX4vsTdKMsbGS6ueSA2QolcYzQjjB86iU5GkexE0+36
         ZeqOQ0b3mCi21cGCSVCRj+8hGkl0P7XLPlj0ad4MFnwZCPWDURpr762XeTy9IoCVA/6d
         crDgqoEudENO1N5xJ2OHRDYHne5hsnGx9ETI6G2qwCeS+RsaEQYXvNpnjbIRuWvcr05Q
         f0Y6D8S2dkHBWsMRq8z1+LNf+Td11WjZIGpWiVZSVg5wOFT3HDHEfrei7qDFvcG5B1yF
         gL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700144198; x=1700748998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ElVUWhYwhjUaz+i5fxEQgGZtu9viVprV+RDlHgmr48=;
        b=q7fptmntYlPbXDui461xH6RIuEnJqi/qwvP+XStOjMMmcRc8lNVCdw7Hb5qUgsYHmz
         LkMuYW0vGLIa4QLq/rEHmFU9Dh0XcCiW0aqzaa/L6Qe8mKxHLHwtpaYySVMi8h81J5Bz
         7xrQGGZWPwzAWkvCku3hl1x2KU1KKxtF+8sWnndlFHtTcxf4fLtE15WxQAATwk3KhNZH
         UkVXRwBKMeHdzR7vVlMMJoP63Ooqg08xyFcmDu4bDMFuHjSJI4UtHuPm2/dNq+jN/zkc
         2PUWxzPWayh+sFmT5n4jcuHVAv1pwegdcLq++etoVj9cRChRkdGUrLxqxiiv2sGHKk47
         9leQ==
X-Gm-Message-State: AOJu0YxCscmqenC9a6sIJiUbNRuWLSyesS4LtHsJKZtD69DFo0iTtRj6
	wWaa4uDhWQptKyOmFwB9/AWz4A==
X-Google-Smtp-Source: AGHT+IHDYa9f557GBCK0UPvCuPl32X8DJWwFlfDMqHlVxXeXT1+T6P8lzVTGSa1++YUZJ4RgeZzmLw==
X-Received: by 2002:a05:6a00:2d04:b0:6c3:3cb0:d85 with SMTP id fa4-20020a056a002d0400b006c33cb00d85mr3029770pfb.0.1700144198163;
        Thu, 16 Nov 2023 06:16:38 -0800 (PST)
Received: from ?IPV6:2804:14d:5c5e:44fb:1a83:7b97:b72d:6c9a? ([2804:14d:5c5e:44fb:1a83:7b97:b72d:6c9a])
        by smtp.gmail.com with ESMTPSA id c15-20020a62e80f000000b0068ffd56f705sm4560377pfi.118.2023.11.16.06.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:16:37 -0800 (PST)
Message-ID: <f9f772dd-5708-4823-9a7f-20ae8536b5e5@mojatatu.com>
Date: Thu, 16 Nov 2023 11:16:33 -0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [selftests/tc] d227cc0b1e:
 kernel-selftests.tc-testing.tdc.sh.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Davide Caratti <dcaratti@redhat.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org
References: <202311161129.3b45ed53-oliver.sang@intel.com>
Content-Language: en-US
From: Pedro Tammela <pctammela@mojatatu.com>
In-Reply-To: <202311161129.3b45ed53-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/11/2023 03:42, kernel test robot wrote:
> 
> hi, Pedro Tammela,
> 
> we reported
> "[linux-next:master] [selftests/tc]  d227cc0b1e: kernel-selftests.tc-testing.tdc.sh.fail"
> in
> https://lore.kernel.org/all/202310251624.5ce67bed-oliver.sang@intel.com/
> when this commit is in linux-next/master
> 
> now we noticed this commit is in mainline, and we observed same issue.
> 
> we noticed test can pass upon parent commit, looks like:
> 
> # timeout set to 900
> # selftests: tc-testing: tdc.sh
> # considering category actions
> #  -- scapy/SubPlugin.__init__
> #  -- buildebpf/SubPlugin.__init__
> #  -- ns/SubPlugin.__init__
> # Setting up namespaces and devices...
> # Test d959: Add cBPF action with valid bytecode
> # Test f84a: Add cBPF action with invalid bytecode
> ...
> #
> ok 1 selftests: tc-testing: tdc.sh
> 
> but after this commit, seems test cannot start as below details.
> want to consult if there is any prerequisite to run
>      kernel-selftests.tc-testing.tdc.sh
> after this commit?
> 
> 
> Hello,
> 
> kernel test robot noticed "kernel-selftests.tc-testing.tdc.sh.fail" on:
> 
> commit: d227cc0b1ee12560f7489239fc69ba6a10b14607 ("selftests/tc-testing: update test definitions for local resources")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 8728c14129df7a6e29188a2e737b4774fb200953]
> 
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-60acb023-1_20230329
> with following parameters:
> 
> 	group: tc-testing
> 
> 
> 
> compiler: gcc-12
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
> | Closes: https://lore.kernel.org/oe-lkp/202311161129.3b45ed53-oliver.sang@intel.com
> 
> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607
> 2023-11-15 20:15:35 ln -sf /usr/sbin/iptables-nft /usr/bin/iptables
> 2023-11-15 20:15:35 ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables
> 2023-11-15 20:15:35 sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
> LKP WARN miss config CONFIG_ATM= of tc-testing/config
> LKP WARN miss config CONFIG_PTP_1588_CLOCK_MOCK= of tc-testing/config
> 2023-11-15 20:15:39 make -j36 -C tc-testing
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607/tools/testing/selftests/tc-testing'
> clang -I. -I/include/uapi -idirafter /opt/cross/clang-4a5ac14ee9/lib/clang/17/include -idirafter /usr/local/include -idirafter /usr/lib/gcc/x86_64-linux-gnu/12/../../../../x86_64-linux-gnu/include -idirafter /usr/include/x86_64-linux-gnu -idirafter /usr/include -Wno-compare-distinct-pointer-types \
> 	 -O2 --target=bpf -emit-llvm -c action.c -o - |      \
> llc -march=bpf -mcpu=probe  -filetype=obj -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607/tools/testing/selftests/tc-testing/action.o
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607/tools/testing/selftests/tc-testing'
> 2023-11-15 20:15:44 make quicktest=1 run_tests -C tc-testing
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607/tools/testing/selftests/tc-testing'
> TAP version 13
> 1..1
> # timeout set to 900
> # selftests: tc-testing: tdc.sh
> #
> not ok 1 selftests: tc-testing: tdc.sh # TIMEOUT 900 seconds
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d227cc0b1ee12560f7489239fc69ba6a10b14607/tools/testing/selftests/tc-testing'
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231116/202311161129.3b45ed53-oliver.sang@intel.com
> 
> 
> 

Hi!
Thanks for the report.
I'm trying to address this issue and others in this series:
[PATCH net-next 0/4] selftests: tc-testing: updates to tdc

I have seen this timeout in other CIs as well, but I cannot reproduce 
locally, even with the CI build running on my laptop. I did notice in my 
local tests that KVM is a big factor for test completion, so it begs the 
question, is it running on a KVM enabled instance?

If there's any document describing the runner instances I would be 
interested too.

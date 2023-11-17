Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82E1368
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 01:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="lBFh3exn"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1f54c538869so787414fac.2
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 17:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700184440; x=1700789240; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aKf/LZV/kvSMDigtlOXJdd990tp8RAjm519fFm7u9Sc=;
        b=lBFh3exnqZlWlkMJMCVYKB3+AAkE+0tX+cf3pavDD3aGwwl1FyoX11OyTCQwL91lG1
         M/7Or05PeuJSbUbJCjsA1p0634XHI5Y+nCMpyNztXoVYm8HWucSybwqo9YMwN3QY92LE
         +D9dAdjU7hpjRxMgm7c10vxpmkOX3Nuxx3eEB+zEFM0jWSy8kVf8bAcXfzl5PNNLRg7r
         lRSomKzdE/NHPtxJiqMRupmjX5YlYje4yawHjqpHX/P4Fh+eSQ0UhdGlyxbxAvuBv8nt
         G2LQ0yOvhjx7Iv4xnqrBMgbe7b083hmWzAlujnpmXeE27xqqpHX97m47TuxHtI3VX6bu
         97DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700184440; x=1700789240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKf/LZV/kvSMDigtlOXJdd990tp8RAjm519fFm7u9Sc=;
        b=PKdZTc90Mg2VsL9V32FefIRzS+LfJJIANukdmed9PIwgKC2C1up3CAGPzFY7LuKSQE
         ruRcGYIS9e7IqKaMKL+5J3xCl+f1WjiSjM0bieIpm7nzgWy8+KYRZPZGmgrhat8C5w1I
         EvilQxI+wG2ewzN5cn9gfqk4uW8+sdlSXdW0ppwubwsvqiyHRVCYzbOXNp811pySc6Dx
         EziCc2waavQbeqnHIJupuoX8GRQAfjH69Udg0d+/AUfq3y0qHG+ZE+PK8g1yL+WBVBvM
         wWVCs2D7cIgl+aeklbLUWw6Q2lcPVYpyEXU475yKPdHXDobv4nHzXSKsrIHqA8RwgGRu
         Z1Rg==
X-Gm-Message-State: AOJu0YyO7ThgoVIiafN8jekYx7hg7gNrMR6mx67yFzlY9zgSXJ40BVo6
	r6dRolQSrpCCVA47rkuNXvSLvg==
X-Google-Smtp-Source: AGHT+IHe+gWJw0AKxuVcbBIXwt32o0SzEtp1hkMypo+gLCWDCnHgrd9UcktssVj7AN6A8lUEGQalJA==
X-Received: by 2002:a05:6870:d210:b0:1f0:630c:a58a with SMTP id g16-20020a056870d21000b001f0630ca58amr21197727oac.51.1700184440236;
        Thu, 16 Nov 2023 17:27:20 -0800 (PST)
Received: from ?IPV6:2804:14d:5c5e:44fb:7741:c354:44be:5c3f? ([2804:14d:5c5e:44fb:7741:c354:44be:5c3f])
        by smtp.gmail.com with ESMTPSA id y19-20020a056a00191300b0069ee4242f89sm372131pfi.13.2023.11.16.17.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 17:27:19 -0800 (PST)
Message-ID: <8c0bc61e-c0f1-49d8-8696-812c336fb74b@mojatatu.com>
Date: Thu, 16 Nov 2023 22:27:15 -0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [selftests/tc] d227cc0b1e:
 kernel-selftests.tc-testing.tdc.sh.fail
From: Pedro Tammela <pctammela@mojatatu.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Davide Caratti <dcaratti@redhat.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org
References: <202311161129.3b45ed53-oliver.sang@intel.com>
 <f9f772dd-5708-4823-9a7f-20ae8536b5e5@mojatatu.com>
Content-Language: en-US
In-Reply-To: <f9f772dd-5708-4823-9a7f-20ae8536b5e5@mojatatu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/11/2023 11:16, Pedro Tammela wrote:
> On 16/11/2023 03:42, kernel test robot wrote:
>> [...]
> 
> Hi!
> Thanks for the report.
> I'm trying to address this issue and others in this series:
> [PATCH net-next 0/4] selftests: tc-testing: updates to tdc
> 
> I have seen this timeout in other CIs as well, but I cannot reproduce 
> locally, even with the CI build running on my laptop. I did notice in my 
> local tests that KVM is a big factor for test completion, so it begs the 
> question, is it running on a KVM enabled instance?
> 
> If there's any document describing the runner instances I would be 
> interested too.

OK, I was finally able to reproduce the timeout.
I have some fixes prepared, will post them tomorrow after more testing!

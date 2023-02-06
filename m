Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84F3D75
	for <oe-lkp@lists.linux.dev>; Mon,  6 Feb 2023 15:25:28 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id o13so976911ilt.4
        for <oe-lkp@lists.linux.dev>; Mon, 06 Feb 2023 07:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AHshO7tL5g++yp1aZ2oXZ/XmXe6IfT5xoJU8UHEGqA=;
        b=T+WgJ8grO9mCDK5EghbmMyWnXbWIOoMZkf0RXGqbl/CRYUcND/G0eVg3nLDwx2vMg7
         cvA8jc0E7LWURFOcom7zk3i8oSwvTbaqYI7dyRo9JprGMz7XjK9xFKuDZiQ96N4UNt8w
         +Z6RPjeLWuw9pWwGP7gOxFB0z90YN0UkGw0PdkgrxuMJLsMP2sG0OBs6fMRZf0i5e+Gs
         EG+bm5WWCS7Q3O19U2LFQ8KKkNvp/OUmy/aWmyZbad66vwiLNJ5iktpxgDE1lKep766c
         VrlCgB3tDBzz1TxY7GKQso73QC8+zIo9Q6aP13A3bBof+AXkWkX8Qy4MtdT5yQmdJlZr
         9uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AHshO7tL5g++yp1aZ2oXZ/XmXe6IfT5xoJU8UHEGqA=;
        b=f1XWsdLxIkDqIHeRrHlKiZl0cE2zzH/VmqzH+pc1I4kYZdcAcll4pP1xl23QohiAe3
         y9CHTKCDDNSL4CYaXdeZI4QXVytRDc/wM2yqcOezhYHbaJAEh3+y4jxn+m+qYtJBIwAw
         iPvV5JEoZshC5ZzRyZhK4XV1rrHyv1rwmdRVUT477kfuYO4WbdyxjQLu/naLYUd2CwUZ
         8v32Pj65msIqMMT6yeRL7YJ9Abijy9SHdZ7pQ8/WM3e8TTNxiPVZC8ovzu3qLFnFQvzZ
         AILlTUyw63zeA/jyrjNE+BnRnHMCc2zHty5fhwOmpQhwDy+DEc9WEbrqlbQvZTrkxVRL
         eryQ==
X-Gm-Message-State: AO0yUKVR+0ACqhORCFHLpVbkiWdmy8mEMvYTQUX9d4ogGxH6/dp55Teq
	mPhDNdI3JrWbA2/VCleA+RvfUQ==
X-Google-Smtp-Source: AK7set8El1ISHVD0wWuRfONY/Pgg8qw9HyPfzK0rjMWhlgiI226sJ/YrDjftbT86pKmBTm0BsqUHug==
X-Received: by 2002:a92:330c:0:b0:313:d6b8:dc30 with SMTP id a12-20020a92330c000000b00313d6b8dc30mr641110ilf.0.1675697127825;
        Mon, 06 Feb 2023 07:25:27 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id x2-20020a056e021ca200b003129e9480ebsm3331936ill.47.2023.02.06.07.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 07:25:27 -0800 (PST)
Message-ID: <bb47bbcd-7708-cefa-86aa-8ecd0b466ac3@kernel.dk>
Date: Mon, 6 Feb 2023 08:25:25 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-next:master] [io_uring] b5d3ae202f:
 WARNING:at_kernel/sched/core.c:#__might_sleep
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>, io-uring@vger.kernel.org
References: <202302062208.24d3e563-oliver.sang@intel.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202302062208.24d3e563-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/6/23 7:38 AM, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed WARNING:at_kernel/sched/core.c:#__might_sleep due to commit (built with gcc-11):
> 
> commit: b5d3ae202fbfe055aa2a8ae8524531ee1dcab717 ("io_uring: handle TIF_NOTIFY_RESUME when checking for task_work")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 4fafd96910add124586b549ad005dcd179de8a18]

Sent out and queued up a fix for this, thanks for the report.

-- 
Jens Axboe



Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD58358AB
	for <oe-lkp@lists.linux.dev>; Tue, 19 Sep 2023 08:43:29 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7aae6440a91so551804241.1
        for <oe-lkp@lists.linux.dev>; Tue, 19 Sep 2023 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695113009; x=1695717809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7XikjWd3jwDbO28i8wYpygIPE/xIN558cD7Z/sU1GI=;
        b=mvPkAxA5E/uAE7Fb3AHkmtWP3LG5uNuM/Niu/lQy7zkGCvJVsy2HrPTL+bHXND2/XC
         qqz2kbJpP/XPjfi3YfKGnkQknFqs9OmwCh7TPFPAuVpp+1u+eySkq5+0VLnYvcprZvPT
         cMb9JbasSzXu9GbyNlebdwj1NAkg4/8ApyZVNNS2y6vP8e3tbxSuzQM48kW6tDeKKVz9
         KN9LloC/R/cTMSNCQ0hwNSVEmTL8CnTB+GLmg8rA3/M3tT8Ul6gOkUUS97iYKwR4kePo
         SXMet9vFyR/y3oiqNYWElBPhIVsiEJxEqN3GM3Woacwzv2ektyt1mhN555lWTUyz39/A
         8PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695113009; x=1695717809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7XikjWd3jwDbO28i8wYpygIPE/xIN558cD7Z/sU1GI=;
        b=QueamJoNs2oQOQvGJqgK5W5IPDTLU2xflaQraiprNX8CORfDRHc3iwmapaJQuNw14e
         5lXUzo5pQz5nt+2Ra1imO085DpREaatT4odbcz6G/OiDyk6lwStJ7HXrdfe6og+a6wkk
         KbLibji/yK+K03FnLa0dSbdYZX1K7zUjCS9xXPtpfoYpfXq8BxZUSqzrZedQX1InIYco
         YkgVTZkZ/Ca3UJMW6u4o5bb5NXXDQCqBFZQTxKsfLl7y0DtY3iQDprdl0bMBS+3qB1U/
         zAUJVlI58nAWHbbqmYVhz21q0aEz0C1llldmYlY1ZL5Tf59JPwSf6brv2LjLznTF+xhQ
         HmRg==
X-Gm-Message-State: AOJu0YzRGAM1C9D5CoZLgIBOyP6oP3qrtt5hSAGsjNQVMM8haoBcnHf1
	02HI2XTjP65y2WD6SyegCDdnbbI0fn+ApGrAe24=
X-Google-Smtp-Source: AGHT+IEA2AHn2sZDufX/u73qRXw+p3X79qC9hLOanykfA+/LaMJ3rW8wL179S0KG55Jcb6xkEveQzUbC9hBjqGLDb4s=
X-Received: by 2002:a1f:c684:0:b0:493:8019:ea65 with SMTP id
 w126-20020a1fc684000000b004938019ea65mr6227078vkf.6.1695113008811; Tue, 19
 Sep 2023 01:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230909043806.3539-1-reubenhwk@gmail.com> <202309191018.68ec87d7-oliver.sang@intel.com>
In-Reply-To: <202309191018.68ec87d7-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 Sep 2023 11:43:17 +0300
Message-ID: <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
Subject: Re: [PATCH] vfs: fix readahead(2) on block devices
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, ltp@lists.linux.it, mszeredi@redhat.com, 
	willy@infradead.org, viro@zeniv.linux.org.uk, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 5:47=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "ltp.readahead01.fail" on:
>
> commit: f49a20c992d7fed16e04c4cfa40e9f28f18f81f7 ("[PATCH] vfs: fix reada=
head(2) on block devices")
> url: https://github.com/intel-lab-lkp/linux/commits/Reuben-Hawkins/vfs-fi=
x-readahead-2-on-block-devices/20230909-124349
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 32b=
f43e4efdb87e0f7e90ba3883e07b8522322ad
> patch link: https://lore.kernel.org/all/20230909043806.3539-1-reubenhwk@g=
mail.com/
> patch subject: [PATCH] vfs: fix readahead(2) on block devices
>
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20230715
> with following parameters:
>
>         disk: 1HDD
>         fs: ext4
>         test: syscalls-00/readahead01
>
>
>
> compiler: gcc-12
> test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz=
 (Ivy Bridge) with 8G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202309191018.68ec87d7-oliver.san=
g@intel.com
>
>
>
> COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 3917     -n 3917=
 -p -f /fs/sdb2/tmpdir/ltp-R8Bqhtsv5t/alltests -l /lkp/benchmarks/ltp/resul=
ts/LTP_RUN_ON-2023_09_13-20h_17m_53s.log  -C /lkp/benchmarks/ltp/output/LTP=
_RUN_ON-2023_09_13-20h_17m_53s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN=
_ON-2023_09_13-20h_17m_53s.tconf
> LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2023_09_13-20h_17m_53s.l=
og
> FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2023_09_13-20h=
_17m_53s.failed
> TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2023_09_13-20h_=
17m_53s.tconf
> Running tests.......
> <<<test_start>>>
> tag=3Dreadahead01 stime=3D1694636274
> cmdline=3D"readahead01"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1558: TINFO: Timeout per run is 0h 02m 30s
> readahead01.c:36: TINFO: test_bad_fd -1
> readahead01.c:37: TPASS: readahead(-1, 0, getpagesize()) : EBADF (9)
> readahead01.c:39: TINFO: test_bad_fd O_WRONLY
> readahead01.c:45: TPASS: readahead(fd, 0, getpagesize()) : EBADF (9)
> readahead01.c:54: TINFO: test_invalid_fd pipe
> readahead01.c:56: TPASS: readahead(fd[0], 0, getpagesize()) : EINVAL (22)
> readahead01.c:60: TINFO: test_invalid_fd socket
> readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
>

Reuben,

This report is on an old version of your patch.
However:
1. LTP test readahead01 will need to be fixed to accept also ESPIPE
2. I am surprised that with the old patch readahead on socket did not
    fail. Does socket have aops?

Please try to run LTP test readahead01 on the patch that Christian queued
and see how it behaves and if anything needs to be fixed wrt sockets.

Thanks,
Amir.

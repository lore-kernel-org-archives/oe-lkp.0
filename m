Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01F25DD1E
	for <oe-lkp@lists.linux.dev>; Mon,  9 Mar 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042068; cv=pass; b=nmkfJkzuG2ISRSH4jWMoUhzBOc7zUs5OuIYK4AZ435KrlIcQWfVC84kiwnure1Y57cy7uAKu++4n6/S42vP6zGlVGzlCYG8/YBb3w7u8rmxOa4LrTq1/ucCUi2W8oDNM9zyDs8ZARh5PXQ1nd3FezqVxCpivuPBZsRabboSEYZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042068; c=relaxed/simple;
	bh=DRPq3QzMqBw8oGsLpnJb3UdQp3S1Qo2F5VuF9aWlHmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKuWHQShWJk20xHsWkGa8EOg1RXF+CGUDNpl/Jt1UA/mS6ry3Jm3AuJy9s434gND2qZwBfopknfRCUETGd7mXoQX2D4IrrcwTGS1SXHX7hirt5aSVkFuGJLo1DGxGemTsIvqik/PHuQmqGhKNwxRA1IzeBuwZlOc7AvQLLN/nAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GObVAv+k; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GObVAv+k"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89a018cbbf8so94191516d6.0
        for <oe-lkp@lists.linux.dev>; Mon, 09 Mar 2026 00:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773042066; cv=none;
        d=google.com; s=arc-20240605;
        b=Vr4LrR9urX10Vgs+qC7EFAoXF4H7EZ46ROV2o9aRACm2jQ6FQx8UMmJQTaG02xM+DA
         zj889l/ogFwATET+3PP0eTqOAv9nLu1bvlf2AVbvobb4UqE3BrEBiU95cFFbeFGmxKGz
         2mY8+Y5HV87fkDLTAEXLj/dUB68Zg88qO7FfwqohsHDg+7zudGBTe4tN79rZdyVk8qy8
         C75D8T/mnq5xPXs4qvAieDwudPqudl8aFvlW63ahVD6vJOE8P63iVVVbn+aVxrmoM3KH
         Nj7jG2l05QlQcFF7/BhnBEuqIv1e/vcLlMqvFU9ukRFg6gAVfTk7Ny53ZUZKB+mUg4WX
         +j8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAKZFKUgV2Kry6TWY43OgsLi7TZBVu+cqXSmsBbAF98=;
        fh=8l1yvbjb0d/YAwm1i/Eol/vIC3ZUILZy+DjbjL9fpGg=;
        b=YopEp/Vm+/1cG9MAx4gtQ9q1cgLKqx6OXlMhn1wi4ZCF8NPI22vkrBlSrydjx8Y4EA
         /Hp7+LIPtxbFW0UnvBePnM8+W9Yk/lSuvus6Fayrrlkg/Tun95VDvtj3HZbYgTNGb2j+
         dRVwJKiNh7eO1/s4tGMMysNZLxT3Z6MuGue5Gs2vaLrB5pVVe71SgQezORgnqUn7RdrD
         xeQZ8Yu23pSrabERpEa1jLlE/w9Z01ue/6sNkuNpbn7wQXh5QxFgCOOURE2et6GJ22hB
         W9GhAd+K/LAzyyoylGudn3A4r35ISalGUDOPrdWHLlxSYvl4l3BaXzqPRPjLQCumeZKJ
         pEkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773042066; x=1773646866; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAKZFKUgV2Kry6TWY43OgsLi7TZBVu+cqXSmsBbAF98=;
        b=GObVAv+kEDEyZCBatTDSIT+HB1zzbwNqqB+i2UPKGGJrZYwhopYwYlFdAeM8muGyka
         a5tBVk/Y1veT0WHI88lfZOYeICKU/0epfpJ72sy0iu78wEhxawtWu7Vcl6h4k5ganH1+
         KnLyfKHGRLzivRFf3zByJioVBLxaPERSLuvwOWNkdcxk53Ux0adjylEkyCl0weB40aEz
         2VO7mdU0uUZEMfgrMqNSTmAX4egfIoEZOzL6diFwIUnLBtMzh4wr6KtfzwNknogDOJFZ
         ZBltZLf2HUSTr2JJkhamOJmKH4e8b/xcz7ZoWEwd5VQ/5KExljrQnzHG52aGcYb+TFx5
         qFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042066; x=1773646866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAKZFKUgV2Kry6TWY43OgsLi7TZBVu+cqXSmsBbAF98=;
        b=kvHq5b3QbhCREzgnj0viSjxnsNqA09OesVTPflDq2rDGOesZpMrGYUahvtioOQs1+Z
         SAC9WldlBNAB/CNceTPfFyUfIYNWOnBJDBalzqKn+YhbqLnj2xsB3moHrNmQpRi2CbaG
         SqVnP6W24dEV9KD3WA9GNa0D30Yf2H5Mw0mh6ffY65yvfaw1+g2Mh2KQ/LbJvYddVZTZ
         4wdpVIyiqUAAiaaCvnxXVQTQI4Az+lTvO5C45VNt/cXfTl6HNZtJQhA/5YmO0+yvshjF
         UI8H2PUZY5Nspl41Q1ULNDg2ytC7cBESxrz4SeVeNp2juj787PgJp5RSRl4AFhXKnQ9M
         FZaw==
X-Gm-Message-State: AOJu0YwxptlSlSIFjCmxJUa7ziqP63LCKd4EQlNN0u49wns5+cKGMdbE
	68MYbJGvLWSYc6iimU1t7+OfC1XQ2eHtA/hZu5lqPl2SGRAtvlMHpXj2y6YfMGXMZw7KudxBQRh
	bRjGm3l9AszSl7uRYckbslBMLurWP88MM3ZMWFCeq
X-Gm-Gg: ATEYQzy2WQTA4ommEeYCDrEcNZBvJa8o4oRLZ2hx4NhSEPTAtVwBym9W+nUDHkp5Xr7
	wwjLIQKQqcsb3jJDEn9RSplbdbPerDdj+lm5w1TPSv3SfXRsY0lfyEp4UB3zBA4P26HH05es6NN
	SoJf6iZvcGHkfTYK0+3EZipTw1ynK7Iy0NffUKLfuovMpIJ0uv7hOEj6vJlKdjwvNG6utAv1M6g
	5pTi2ft82aQOHmgjJSpE2kUihcS3uR04YNjmfotwpEQ2tYRuJX8ZAQaKwvFdttWXz3Ee1jax9p+
	5UFLgGc=
X-Received: by 2002:a05:6214:2a85:b0:89a:e8:d181 with SMTP id
 6a1803df08f44-89a24581926mr210589386d6.10.1773042065361; Mon, 09 Mar 2026
 00:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603091409.866c520c-lkp@intel.com>
In-Reply-To: <202603091409.866c520c-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 08:40:53 +0100
X-Gm-Features: AaiRm50iN2kdxTDIK_N5_LqpaEGQz0R0-2xH8Tt8AzxK8jPQWFw8kUuyjDsbjHQ
Message-ID: <CANn89iKUdtWw4ptM8ZreRP0a2FuvQOJ5FgE3o4q-zTRTmt1Umg@mail.gmail.com>
Subject: Re: [linux-next:master] [icmp] 64db5933c7: ltp.cve-2020-25705.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 7:42=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "ltp.cve-2020-25705.fail" on:
>
> commit: 64db5933c7adcdc4dd8f5ef6506cc998ecbe63ac ("icmp: increase net.ipv=
4.icmp_msgs_{per_sec,burst}")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master a0ae2a256046c0c5d3778d1a194ff2e171f16e5=
f]
>
> in testcase: ltp
> version:
> with following parameters:
>
>         test: cve-06/cve-2020-25705
>
>
>
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GH=
z (Haswell) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202603091409.866c520c-lkp@intel.=
com
>
>
> PATH=3D/lkp/benchmarks/ltp:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/=
bin:/lkp/lkp/src/bin
> 2026-03-06 06:12:16 cd /lkp/benchmarks/ltp
> 2026-03-06 06:12:16 export LTP_RUNTIME_MUL=3D2
> 2026-03-06 06:12:16 export LTPROOT=3D/lkp/benchmarks/ltp
> 2026-03-06 06:12:16 kirk -f temp_single_test
> Host information
>         Hostname:   lkp-hsw-d05
>         Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
>         Directory:  /tmp/kirk.root/tmpyus4a2ag
>
> Connecting to SUT: default
>
> Suite: temp_single_test
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>  [1;37mcve-2020-25705:  [0m [1;31mfail [0m |  [1;33mtainted [0m  (16.104s=
)
>
> Execution time: 16.158s
>
> Disconnecting from SUT: default
>
> Target information
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80
> Kernel:   Linux 6.19.0-11801-g64db5933c7ad #1 SMP PREEMPT_DYNAMIC Fri Mar=
  6 13:49:07 CST 2026
> Cmdline:  ip=3D::::lkp-hsw-d05::dhcp
>           root=3D/dev/ram0
>           RESULT_ROOT=3D/result/ltp/cve-06_cve-2020-25705/lkp-hsw-d05/deb=
ian-13-x86_64-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/64db5933c7adcdc4dd8f5=
ef6506cc998ecbe63ac/0
>           BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/64db5933c7ad=
cdc4dd8f5ef6506cc998ecbe63ac/vmlinuz-6.19.0-11801-g64db5933c7ad
>           branch=3Dlinux-devel/devel-hourly-20260302-003818
>           job=3D/lkp/jobs/scheduled/lkp-hsw-d05/ltp-cve-06_cve-2020-25705=
-debian-13-x86_64-20250902.cgz-64db5933c7ad-20260306-21371-13x9t7k-1.yaml
>           user=3Dlkp
>           ARCH=3Dx86_64
>           kconfig=3Dx86_64-rhel-9.4-ltp
>           commit=3D64db5933c7adcdc4dd8f5ef6506cc998ecbe63ac
>           intremap=3Dposted_msi
>           max_uptime=3D14400
>           LKP_SERVER=3Dinternal-lkp-server
>           nokaslr
>           selinux=3D0
>           debug
>           apic=3Ddebug
>           sysrq_always_enabled
>           rcupdate.rcu_cpu_stall_timeout=3D100
>           net.ifnames=3D0
>           printk.devkmsg=3Don
>           panic=3D-1
>           softlockup_panic=3D1
>           nmi_watchdog=3Dpanic
>           oops=3Dpanic
>           load_ramdisk=3D2
>           prompt_ramdisk=3D0
>           drbd.minor_count=3D8
>           systemd.log_level=3Derr
>           ignore_loglevel
>           console=3Dtty0
>           earlyprintk=3DttyS0,115200
>           console=3DttyS0,115200
>           vga=3Dnormal
>           rw
>           keep_initrds=3D/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x=
86_64-92ea0639e-1_20260301.cgz
> Machine:  unknown
> Arch:     x86_64
> RAM:      14040916 kB
> Swap:     0 kB
> Distro:   debian 13
>
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>       TEST SUMMARY
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> Suite:   temp_single_test
> Runtime: 16.104s
> Runs:    1
>
> Results:
>     Passed:   0
>     Failed:   1
>     Broken:   0
>     Skipped:  0
>     Warnings: 0
>
>  [1;31mFailures: [0m
>     =E2=80=A2 cve-2020-25705
>
> Session stopped
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260309/202603091409.866c520c-lk=
p@intel.com
>
>

I do not want to know what this test is doing or expecting.

If it expects sysctls to have a precise value, it should set them ?

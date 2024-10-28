Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC418C03B
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104346; cv=none; b=CQLxHZFGHLC+RjM7ZiDNrU8Gg6e9qAluDDEdP0zCVQ8NgjoVCo+wV7ciLZdZjSvzquVUo2YZQnCmiWDlodEv7NYfetyPuYrHAqhtXlQMeh9v+VoLh6bWEaVRGREffWyqERWqFpLDVCqGtXQDiA2uAzxnUuSUiC86omzigBsUYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104346; c=relaxed/simple;
	bh=0yj6bhQEp+kWmIjdpdPipTMt8Fmv7ovryC/J3vHslMk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=O7ao0BJbJApT1ksCMufLSMKC+G97A8bOuc4iGzZn30aWKiBtHWIfAkmzlta1ZfSrUF6RDkZoyOxFk+3JzWBbtQDjOeOkbjcOpzF1gYfoG/HsHajMpPP8E3ky1bM0oewVO6+0uJSFx8ApKPf3UKLNAiJJ5qrF2m4mpKEuHtqlGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn9q/N5N; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn9q/N5N"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cf6eea3c0so30878615ad.0
        for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730104344; x=1730709144; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OC+c0PsfdivKLBJeEElxzmwOKA1NA02owu+MfWcBYkE=;
        b=Nn9q/N5Nc0KW9R2V3UKzNyDydmqnGbdS8usd8f0fz+ExAUv0B4BlE7fGiNPnMfS44x
         STsDVjwQrJ2R57aITuEojoyWGftwRTBerK1h1QYZs11qa/0YAzyaTba5H65XW9YSgg1q
         mxu2toAGXmy3KGYmDtNnN3MlvWPYTj3Yr5ji0VUh3ll+DphE1dBeQN7mPAi/Wxt88InP
         uplLIWZHPY/wcrkD/0dynnB7TujtoYbY/6YkTTXJm0aT95mkO/Ztl410frLtBGbFUwlu
         d1//A41PPVCzYhoG84BLJsZZm4zqm8hwx4Oq4dNqjoU0dEuK3S7I4H2NjXo5iylEvg07
         6GxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104344; x=1730709144;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC+c0PsfdivKLBJeEElxzmwOKA1NA02owu+MfWcBYkE=;
        b=XE5RHSUq4nKwcSr6p8L1/9dzkVAUQ9+GhFLTZFVeuZ38TEFWWRzv1fkcfNedwTGUP6
         E9Yri0S2cTNlqyllcCPUMx6TYnMwopGOWGHJ1s39et1TrYYJXbGYRu0PzRnx4VimKePk
         8BEMcYD9KI1+fjNYY+0ekmwaGD5I8GwzeoIUFN5yQWYyPfyyUr6/ThLmzwyjLgPSLclO
         Dq7yJh7OLnYq3derJr+xhy/xFmSdl7Yzal+8h/mA7zTbfHSchz3QCSNC75yLkmBVkS1P
         k4eSRTNEclmPK+wL2LyigSQEy2JhIf2s69Fcotjc+MupF6IOteUJg8F/usU5fe1zHIuW
         dXlQ==
X-Gm-Message-State: AOJu0YwdETRoOvZHAGnLXV0JPKBNSYoAEn69t7EM/Cmjoj/Kbcp0U+ni
	syR+CI8GCxsNTojjaV36SDUXZtQ7mnwtqDIZFucEJF43NhWElKv8r5dEuQ==
X-Google-Smtp-Source: AGHT+IEayZAUFijf83xv2n7MsDVHi+S37dcV4LD0U0A3qAyxqBGt68DjymfCDURrf3M0uv7E+iPcJQ==
X-Received: by 2002:a17:903:244d:b0:20c:bb35:dae2 with SMTP id d9443c01a7336-210c69e1c8emr85536385ad.28.1730104343873;
        Mon, 28 Oct 2024 01:32:23 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082cc0sm45533275ad.291.2024.10.28.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:32:23 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, oliver.sang@intel.com
Subject: Re: [riteshharjani:atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1] 2eda7299be: xfstests.generic.350.fail
In-Reply-To: <202410281346.cfd98861-oliver.sang@intel.com>
Date: Mon, 28 Oct 2024 13:53:45 +0530
Message-ID: <87frogmy9a.fsf@gmail.com>
References: <202410281346.cfd98861-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>

kernel test robot <oliver.sang@intel.com> writes:

> Hello,
>
>
> it seems a debug patch to us, below report just FYI what we observed in our
> tests.
>
>
> kernel test robot noticed "xfstests.generic.350.fail" on:
>
> commit: 2eda7299be1daa307b815b480cb9dd0b14ad062b ("scsi debug 350mb device and 2x shosts and DEF_PER_HOST_STORE=true")
> https://github.com/riteshharjani/linux atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1

yes. I thought *wip* does not gets tested by default?

I did submit a patch to only allow for certain branches -
https://github.com/intel/lkp-tests/commit/3a68b7ad329bea895c3d2c31a6b93a99d2eca536 

It has some "integration_testing_branches" and "branch_allowlist". But what
I was looking for was, is there any report for what all gets tested, what
tests passed, how does it decides what tests to run? 
(Note I am aware of build success test report which gets generated which
is quite useful too.)

-ritesh

>
> in testcase: xfstests
> version: xfstests-x86_64-f71228e3-1_20240930
> with following parameters:
>
> 	disk: 4HDD
> 	fs: ext4
> 	fs2: smbv3
> 	test: generic-350
>
>
>
> config: x86_64-rhel-8.3-func
> compiler: gcc-12
> test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410281346.cfd98861-oliver.sang@intel.com
>
> 2024-10-24 11:26:11 mount /dev/sda1 /fs/sda1
> 2024-10-24 11:26:12 mkdir -p /smbv3//cifs/sda1
> 2024-10-24 11:26:12 export FSTYP=cifs
> 2024-10-24 11:26:12 export TEST_DEV=//localhost/fs/sda1
> 2024-10-24 11:26:12 export TEST_DIR=/smbv3//cifs/sda1
> 2024-10-24 11:26:12 export CIFS_MOUNT_OPTIONS=-ousername=root,password=pass,noperm,vers=3.0,mfsymlinks,actimeo=0
> 2024-10-24 11:26:12 echo generic/350
> 2024-10-24 11:26:12 ./check -E tests/cifs/exclude.incompatible-smb3.txt -E tests/cifs/exclude.very-slow.txt generic/350
> FSTYP         -- cifs
> PLATFORM      -- Linux/x86_64 lkp-skl-d05 6.12.0-rc2-00029-g2eda7299be1d #1 SMP PREEMPT_DYNAMIC Thu Oct 24 12:37:44 CST 2024
>
> generic/350       - output mismatch (see /lkp/benchmarks/xfstests/results//generic/350.out.bad)
>     --- tests/generic/350.out	2024-09-30 21:13:44.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/350.out.bad	2024-10-24 11:26:14.507852855 +0000
>     @@ -1,10 +1,13 @@
>      QA output created by 350
>      Create and format
>      Zero punch
>     +fallocate: Operation not supported
>      Punch range past EOD
>     +fallocate: Operation not supported
>      Check contents
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/350.out /lkp/benchmarks/xfstests/results//generic/350.out.bad'  to see the entire diff)
> Ran: generic/350
> Failures: generic/350
> Failed 1 of 1 tests
>
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241028/202410281346.cfd98861-oliver.sang@intel.com
>
>
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C934A3A5
	for <oe-lkp@lists.linux.dev>; Wed, 21 Jan 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010751; cv=pass; b=lttK13mXSoH1f6/CeZEiu+1kdQ21KCfPnkotLBw/IBzYH2xA0kUJrMovOmUcUASu0BX/74P8xhFRncW4wU4DoBXZZgCUQAtwiNCg4/rQFF6CKsp01jD9QBboUz8UfZs7KnM6/9XC1e58iINixghkGEnBUMZkA1ih7/Fvk1D4wC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010751; c=relaxed/simple;
	bh=sp9lVOVgrCwa+GC2LA8cImW8uEZ8E+UM4nbD/5yMiis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTJc5cgslUTNoN/NhMTQlvlNHMJuw4gux736fgCzBfZx74CvnpbG7byIyc0Vkp1UAmeOsct7M2118YU5sKLsXCd7B2etDjIfbg7Lh1hjQEYzFSZJ1ak5wBncv03Eb+/a9d4ep4/RTfw4OWx61tDPeg89sOAgAvszSErREnicRMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zYW14jAb; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zYW14jAb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a76b39587aso99385ad.0
        for <oe-lkp@lists.linux.dev>; Wed, 21 Jan 2026 07:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769010748; cv=none;
        d=google.com; s=arc-20240605;
        b=TLUv1BK8/9nsOiz8LIA4hg8kNkcsFgJti+FOnL6I4pZUznL/OeHAkzVz6oDyYPTZ9r
         Y4czvrTd21/EorhKX3MaGrWAJ+zyQBq5XMazVyYqD0jtZGbvNOA03RtUUx9c3Dr3GFcJ
         1OmMsnltwRJjQ0Cw9xasZlTCLvfHasHsozXQuz/DvhRMM9ys1yD4WX3jgRLnAdnZ31JO
         LHpb43VL6V//0VjYnVD6mde4hD/VKGWNkurhKp2qpOhIK2UEhAvaKGMsLyz3IxHD7isx
         YVsqt2QpsQPOX3LK19R2xE9iHj+hcLJd1LncpdZjAbWzQQuqZnqWz8rZvc1Pzfm8Ygkt
         LYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0O2fp8A64qYqm8pwFgzTtPg0CXEySON6wKIA5P4ADvE=;
        fh=u/mfoTRdYMGLhnoGBB72kIzWKsuqSlzAekCX+dMm+NE=;
        b=cE9vQ27xFYyFdFjIej9EWMbF/ZS/2IBt5hhDFaZmLjYdM8vnrR6htepuF97tavZFvn
         JbCUe5GnW8q/2Rngn7pr+0rt0nObDlpLP+b0tCp9RJkkaYF6N/YxyLCQ7+g4iGqbDzTW
         bIRHjrrJrO0tzF/TgOSBTLN3hiB1omcK5iUOhbHTaPEbTETBdPqN/K1vdX85uTK0rRFO
         kVixuAm8bSuuZhuRJtIuigEDnvl6M5V3RfP4H84PnQTSvI1VxuG4KTTUhZ9u6qs/uvXP
         Mrcs+jSdGlSS2XXQbhd1UlErUDu88MLtn4mz2lasHIV59mx52PwdeB22KYAUrIRNdqB5
         I/BA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769010748; x=1769615548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O2fp8A64qYqm8pwFgzTtPg0CXEySON6wKIA5P4ADvE=;
        b=zYW14jAbZVnQxOqI2iroXGoYOIjIic+oiizPHvDU0Qb6A6ZQaH0RrkFFaD8hQelKFX
         dVWBDsClvh35iJKaFcGXX3wI1Jqo6S6hF+OnDDFkg/M094UbvcykVOKvcxQaIPbcioLY
         Wvln3q3xYmN9fr5Md6hxxTPrO3KSO2E1ypmXnAU6ubxQ70aUOhqda7KSaO31wzXLo8aV
         /eshOrZJr8HT+wTsvYVbmNcjmefFJPoKzQLOKD9uUbqkh+I4opC9QwYuGo3UGnG799Bz
         Z0tkgwgg749g//eBgFQANFZHBxCCJIaNQVLu6HL1Q8gdbd98vT3JcVu/fxk+CcJHoN6u
         vEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769010748; x=1769615548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0O2fp8A64qYqm8pwFgzTtPg0CXEySON6wKIA5P4ADvE=;
        b=fzi1d1gxNmcqceoCnx/L3jRUibT0p0nBJ8QVw/j9bJzRxlilyPiXNONythQS7Pcoij
         I9gnQjE95Ip7DrzHejY527PrbyApqnqGm7d/DvwC98vHFPzxkIX66+Fca/mdlaYm/Z/Y
         Em5xFEqmUxhIPCq2fYUwD9yK8uKkHX4j0qg5G8OGr6dCIh2vOrvPykkQOsfJaitsaYwT
         1P8AsjbznC769403NaBpdLwUIlizOIdXt4/PqL+1BkkoaJixBftoEvuIArdboTxB5AU1
         uwlWHq1MSiwHCQsQQJhq4GRUDLSJMUNHCjIsQi+xokLgsAFndv2Nyr+Dn41uwvmP6/gG
         7mBg==
X-Gm-Message-State: AOJu0YxHOpNDLHhKgMiblaC8wFZq8DfHIPio3ptqBybH6Z/2jFKGtvob
	8Jfl+MKXqDsMZpxFDaXuESaV3j9u4ePcddyFk6omJeZlpwigHGOiwSqlNYCHANI7ZD9a+r/o1Pq
	nLmJ++BPGPXjD4yudTQR2Nwz7nKgCNszq9CkYzGbZ
X-Gm-Gg: AZuq6aL7iitU4mdlCGTxW4KCMvuRFouI301Bjzu4vnl7meIx8Yrjc/R4C1+ACUkMLs2
	Qq5I/EzT4Ffm6lnk5R9hXMT4yaPXrx5WTrwwFRB6bfB636vkIsQGd4untIi9zxiR8ln1R9hJilW
	gAuxaLgDoFgSmAsRjixjaIYcSFOCrVRQCUOnom/PbFfbrQ+ncOEt6jHOnycSRxKPn6eGUsg9jp3
	qWx97eUnh5Xtnbo7qqJ2fZsgc6yiJIFzGQvaA64Csac+dqCz0LMRsqymffRdsED1jGIXY2Q1wUh
	C1cXR9QyrgbU9dVVRBUY7YHl5Q==
X-Received: by 2002:a17:903:acd:b0:29e:27f4:bac0 with SMTP id
 d9443c01a7336-2a79a61d716mr3015795ad.16.1769010747897; Wed, 21 Jan 2026
 07:52:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601201519.ce4c3ab3-lkp@intel.com>
In-Reply-To: <202601201519.ce4c3ab3-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 Jan 2026 07:52:15 -0800
X-Gm-Features: AZwV_Qh98e04YDZFFaxkVB-W7l3tozUgfMUKiMM2Yyutk-HVwNDWVgfCxG7ECV8
Message-ID: <CAP-5=fVyGswdFrEw7=P8RGPJP+2wW3qQhzCfz1BoJ9Uvg4iKDg@mail.gmail.com>
Subject: Re: [linux-next:master] [perf test subcmd help] ef92c4351e: kmsg.sanitizer.indirect_leak/malloc/___interceptor_backtrace/child_test_sig_handler/raise/abort
To: kernel test robot <oliver.sang@intel.com>, Thomas Richter <tmricht@linux.ibm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Sri Jayaramappa <sjayaram@akamai.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Guilherme Amadio <amadio@gentoo.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 11:58=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "kmsg.sanitizer.indirect_leak/malloc/___interce=
ptor_backtrace/child_test_sig_handler/raise/abort" on:
>
> commit: ef92c4351ec75bcfb8a1cc3a88109b5339f296ef ("perf test subcmd help:=
 Add exclude disjoint subcmd names")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master d08c85ac8894995d4b0d8fb48d2f6a3e53cd79a=
b]
>
> in testcase: perf-sanity-tests
> version:
> with following parameters:
>
>         perf_compiler: clang
>         group: group-02
>
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10G=
Hz (Ice Lake) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202601201519.ce4c3ab3-lkp@intel.=
com
>
>
> --- start ---
> test child forked, pid 11710
> perf: help.c:107: exclude_cmds: Assertion `cmds->names[ci] =3D=3D NULL' f=
ailed.
>
> ---- unexpected signal (6) ----
>     #0 0x7f7688c77403 in ___interceptor_backtrace.part.0 sanitizer_common=
_interceptors.inc:4358
>     #1 0x55f34adb6c34 in child_test_sig_handler builtin-test.c:312
>     #2 0x7f767ea2bdf0 libc.so.6[3fdf0]
>     #3 0x7f767ea8095c libc.so.6[9495c]
>     #4 0x7f767ea2bcc2 in raise libc.so.6[3fcc2]
>     #5 0x7f767ea144ac in abort libc.so.6[284ac]
>     #6 0x7f767ea14420 in __assert_perror_fail libc.so.6[28420]
>     #7 0x55f34acf4e70 in exclude_cmds help.c:106
>     #8 0x55f34ae9a646 in test__exclude_cmdnames_no_overlap subcmd-help.c:=
112
>     #9 0x55f34adb74c5 in run_test_child builtin-test.c:340
>     #10 0x55f34ad08db3 in start_command run-command.c:128
>     #11 0x55f34adb99a1 in start_test builtin-test.c:546
>     #12 0x55f34adba90d in __cmd_test builtin-test.c:648
>     #13 0x55f34adbd2c0 in cmd_test builtin-test.c:850
>     #14 0x55f34acc2a45 in run_builtin perf.c:349
>     #15 0x55f34acc3336 in handle_internal_command perf.c:401
>     #16 0x55f34acc388c in run_argv perf.c:448
>     #17 0x55f34acc4033 in main perf.c:555
>     #18 0x7f767ea15ca8 libc.so.6[29ca8]
>     #19 0x7f767ea15d65 in __libc_start_main libc.so.6[29d65]
>     #20 0x55f34aa28241 in _start perf[102f241]

I believe this is resolved by:
https://lore.kernel.org/lkml/20260121082402.2311962-1-tmricht@linux.ibm.com=
/

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D11710=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 30952 byte(s) in 3 object(s) allocated from:
>     #0 0x7f7688ced610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x7f7688ace808  (/lib/x86_64-linux-gnu/libelf.so.1+0x3808) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>
> Indirect leak of 9280 byte(s) in 3 object(s) allocated from:
>     #0 0x7f7688cedc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x7f7688ad6550  (/lib/x86_64-linux-gnu/libelf.so.1+0xb550) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>
> Indirect leak of 1873 byte(s) in 3 object(s) allocated from:
>     #0 0x7f7688cedc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x7f7688ad73fa  (/lib/x86_64-linux-gnu/libelf.so.1+0xc3fa) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>
> SUMMARY: AddressSanitizer: 42105 byte(s) leaked in 9 allocation(s).
>  68.4: Exclude disjoint subcmd names                                 : FA=
ILED!

To better diagnose these leaks could you disable the fast asan stack unwind=
er:
ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0

Thanks,
Ian

> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260120/202601201519.ce4c3ab3-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

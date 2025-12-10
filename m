Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C72EBDCD
	for <oe-lkp@lists.linux.dev>; Wed, 10 Dec 2025 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393446; cv=pass; b=Uu3DZV4EKdWI46DGinjo3abk1/d85GtV+bR27YA/uQOkptmwdEWnQl408rT+LdRE8UgyId1TJHUsdPI0aDBhIG3zP4RR2sMHYnLEBKyqRoT01ysOR9fv6EhGobjVuNWWGp8vIGnP5n639S+2TuZWfwUa+C664LowqN+eN7DcY1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393446; c=relaxed/simple;
	bh=Sc9TTyn1dGTg9IGilKJEzhrVRHXnAW5Eq9JJHTJZXFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mk5O6AyFXgQaWWxiE8/pou6M4Uvo3jiRk/esV98AZMPazostYn1ulAdtzbcc/KUpTjs2rDl3RrtjoCu/2cLgK8+qFCDrU/tuEVIuvwcWr1cUbibYErhtBfLLNEKcs9COpRBHqxRpqNp4hau4OzjanG7ctKLWZe0ONDyQUvffFlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLu7TX8+; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLu7TX8+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29e7ec26e3dso21615ad.0
        for <oe-lkp@lists.linux.dev>; Wed, 10 Dec 2025 11:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765393443; cv=none;
        d=google.com; s=arc-20240605;
        b=F87knkX8qq6YIvD/8PG+T80fOt1s3WdhBz+cwwQfz3LQT3q6DFzdk8A5f4OpQUk6q6
         xLy7rIUqbPX5vz9jb/ToVfvM471mEs7ygEA1icwOJ7VsieDip+j4g+cyXn9qFPJEu8zi
         e2eEWQiUkbnfvBhUmFPryiBrFssjmGpUAKWvSnqsG2YOo46pN1H0n2xfo2JYHd/PcyuG
         eruNrHT4AT10Ie0FHlmeorWk0C2oZ1WLwbVD/iy01s+0WctsDotFZhMzzlVBVobQfy7K
         yxOAGi3YsrYFq+82MA82uNZtEmK1iP+UKyBUZuRvDlzvnWcEKRC1KpHPLzf00t4bPB/U
         oaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjMbajRZHQK4q2oeOhzXh+hyw+4D3o92ugguBehohuk=;
        fh=kzyeX3ojdZqRdsfGwI1Bp5oWu2DY9pu2CBIgxiNA0EU=;
        b=SLD+OoUoX/CiGG5kWGiuW6gN2m3/WA3vURuJ5c/uikYl/u0AyyzEg9aKLg94tnGhRK
         JGdcVlVI5fY7euQ7CZwFn4/jcEg73dsLiFwyEB6G40xUxCsJasbc3B1vBOhlYIvOc3Mj
         3bD4kc0ni0Bsu+T5FyG6H1Ai72IXA0ykF/VwEVgvCOcZ1HE94aNnD9cXio4oD9AmKc0V
         t4/izI2qqwDf3uc1Pi/UMy39bv6gwCn0Xo2mmI00fd7JyBfw1/HDBv5wkUJrFI7Oht4A
         /zsXgZPzI1g3B4RlZSnu9+Qy4SAIw5tIjAvajC1Qndtf2Z/3U5eE51VHkxhB688rDJ+4
         1+rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765393443; x=1765998243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjMbajRZHQK4q2oeOhzXh+hyw+4D3o92ugguBehohuk=;
        b=gLu7TX8+L9gOd1MXmQDh+6KUcMePiKRTp9wyDJVPGsa7B8BRZDSqA7Wnfp7FVsR5Jc
         RVUF1MVG7Uv9KS8ahEiAMS55eO3SYjLQb4zqcXAH/oImbk35Urio78c837wctYZPGcYT
         tn3LZejdxBjfxY0d8KZtl6JLKfbj+Y4qSzwFIUs0SazMEZfgPM2zugkcrN2uYcleZ1VB
         tE54K9jYPGTs4AngsECM6QB8N6Qjb74nzzDBENxQuy2muDIM5a920Dn6hAhKlHoZ7mVA
         WXLmkf8sy6MmLEGpL5UXhBIu0W7IOwactAEsNqSefYHAdv+DWG4ekxTzN5g3OQyMyScU
         RnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393443; x=1765998243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjMbajRZHQK4q2oeOhzXh+hyw+4D3o92ugguBehohuk=;
        b=NzTptr9B9pULCsjfY1DqcJhPg/dmMS+vPQAVbLusQSSAMB5n+cBY+tEred2qpe0SQt
         UJnCoNDSv+gYyTkAKT633LV9NldhgWMI2bzsH1rkLdDjCnrtehbcYhOFQq4k2HtWK9pK
         gMVVDC08ZHG/YFNyXOOnvMEv1c7yuxXYLh8ogxfJAamzOH4CTtxYrUC54vaw4Uh0Dpuc
         sBTQBHuKcFyBBbW2dujQI1h34dhcVdvifaA6Sc91xQBJSH53J4cdv/xQDnaP/5dO3o4h
         Ku5qBycIad+uCvdhLIpD+K5dZ+AlCpmgVSxM1N/437w4sbEVKWiHZqI5QlN07CI1SlAz
         EZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+TOA5ZTM4qU0YTrIfjxpGlJTVaOyqdZSYQsoDYJFfCygSSSIJT2ClHqUw6iTzf4dIDKLUS9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdkyfhjrCju7dy5OrKLiWQQTLy5yXQ/p/yEiDv7agetMXf7nKM
	DvPPHpstenZAzQ16c0LHu4Ef6lxlZ4Yl5GDRYWNL+4SmjCn+glVHupsOdtkZrNf+Eh4rNmEzcNy
	0jKocWZJdlqkfGP6SadbF5Cf7n0Uu5PJaqjBlOjvL
X-Gm-Gg: AY/fxX4joqSHz25Bh0T1aU1Z56xbpJeOfDGNNjnhg45/dUbamf5bUFeTIFW2Vly+EOE
	YJ3mp9TXTpD0qzCmxTVh4URq38dxVo3gnD/hgZJs+s52wjfMaih5LNZYi/FfO7QWJ2Ep719BkBI
	ru1LnEyVoBZt1f6q2nucZcgvz2CHwgbUahdbJWXsivkcPgq2YZ25fcGLYanin8bSm24ZysTQPCJ
	y63MYKltk0Dsu0XIxw5IKgtOIDfQS9uCH3vnK/GXZQT8oRC7QAgjgbMK0OVj1sFqmBB+Xncaxb1
	yfpG1StSW75cI/5ryzF495DnRg==
X-Google-Smtp-Source: AGHT+IGtHeC8733UvPqO1jOzDofCqrTfuKtmpmWxtjbth0Nf3hs3Qp2Iw6u+OKSsFmBQFc21BTzvZhxc1m+xZ4+D5gE=
X-Received: by 2002:a17:903:1a84:b0:297:f0aa:d466 with SMTP id
 d9443c01a7336-29eea1f8a47mr274095ad.8.1765393443133; Wed, 10 Dec 2025
 11:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512101502.f3819cd3-lkp@intel.com>
In-Reply-To: <202512101502.f3819cd3-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 10 Dec 2025 11:03:52 -0800
X-Gm-Features: AQt7F2q-jiP_E9suh0wGMOq3C1D1AhdZx2TeP9vPnjNQcYkjqGay1HRBlJIJOQw
Message-ID: <CAP-5=fW68j1tCH7_r=y7Mp1OAnWgJfZQ9hF0FvVkW9pThE_+NA@mail.gmail.com>
Subject: Re: [linus:master] [perf test] 34e271ae55: kmsg.sanitizer.indirect_leak/calloc/zalloc/dso__new_id/__dsos__addnew_id/__dsos__findnew_id/dsos__findnew_id
To: kernel test robot <oliver.sang@intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 12:09=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
>
> besides the indirect_leak mentioned in title, we also observe below diffe=
rence
> if comparing to parent commit.
>
>
> 4fba95fc383f9231 34e271ae55382fbdb04f3e13e85
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :8           75%           6:6     kmsg.sanitizer.direct_leak/=
malloc/map__get/maps__find_symbol_by_name_cb/maps__for_each_map/maps__find_=
symbol_by_name/machine__find_kernel_symbol_by_name
>            :8           75%           6:6     kmsg.sanitizer.indirect_lea=
k/calloc/map__new2/__machine__create_kernel_maps/machine__create_kernel_map=
s/test__kallsyms_split/run_test_child
>            :8           75%           6:6     kmsg.sanitizer.indirect_lea=
k/calloc/symbol__new/map__process_kallsym_symbol/kallsyms__parse/dso__load_=
all_kallsyms/__dso__load_kallsyms
>            :8           75%           6:6     kmsg.sanitizer.indirect_lea=
k/calloc/zalloc/dso__new_id/__dsos__addnew_id/__dsos__findnew_id/dsos__find=
new_id
>            :8           75%           6:6     kmsg.sanitizer.indirect_lea=
k/malloc/dso__get/map__init/map__new2/__machine__create_kernel_maps/machine=
__create_kernel_maps
>            :8           75%           6:6     kmsg.sanitizer.indirect_lea=
k/malloc/symbols__sort_by_name/dso__sort_by_name/map__find_symbol_by_name_i=
dx/map__find_symbol_by_name/maps__find_symbol_by_name_cb
>
>
> but we don't have enough knowledge to understand if they are expected by =
the
> change is 34e271ae55, so just make out below report FYI.
>
>
> kernel test robot noticed "kmsg.sanitizer.indirect_leak/calloc/zalloc/dso=
__new_id/__dsos__addnew_id/__dsos__findnew_id/dsos__findnew_id" on:
>
> commit: 34e271ae55382fbdb04f3e13e856457d8e0dee45 ("perf test: Add kallsym=
s split test")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 6987d58a9cbc5bd57c983baa514474a86c945d5=
6]
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
> test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz=
 (Coffee Lake-E) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202512101502.f3819cd3-lkp@intel.=
com

Thanks! Reproduced and posted a fix:
https://lore.kernel.org/linux-perf-users/20251210190141.12725-1-irogers@goo=
gle.com/

Ian

>
> Indirect leak of 386 byte(s) in 1 object(s) allocated from:
>     #0 0x7f0248972610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x561eb21740b6 in zalloc ../../lib/zalloc.c:8
>     #2 0x561eb2529d8f in dso__new_id util/dso.c:1527
>     #3 0x561eb25327bb in __dsos__addnew_id util/dsos.c:329
>     #4 0x561eb253287d in __dsos__findnew_id util/dsos.c:351
>     #5 0x561eb2532907 in dsos__findnew_id util/dsos.c:358
>     #6 0x561eb25d267f in machine__findnew_dso_id util/machine.c:3191
>     #7 0x561eb25d26ce in machine__findnew_dso util/machine.c:3196
>     #8 0x561eb252778e in machine__findnew_kernel util/dso.c:1338
>     #9 0x561eb25bbfe0 in machine__get_kernel util/machine.c:969
>     #10 0x561eb25c0d10 in machine__create_kernel_maps util/machine.c:1545
>     #11 0x561eb231f3be in test__kallsyms_split tests/kallsyms-split.c:117
>     #12 0x561eb223b4d8 in run_test_child tests/builtin-test.c:340
>     #13 0x561eb218d899 in start_command /usr/src/perf_selftests-x86_64-rh=
el-9.4-bpf-34e271ae55382fbdb04f3e13e856457d8e0dee45/tools/lib/subcmd/run-co=
mmand.c:128
>     #14 0x561eb223d9b4 in start_test tests/builtin-test.c:545
>     #15 0x561eb223e920 in __cmd_test tests/builtin-test.c:648
>     #16 0x561eb22412d3 in cmd_test tests/builtin-test.c:850
>     #17 0x561eb214751d in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-34e271ae55382fbdb04f3e13e856457d8e0dee45/tools/perf/perf.c:349
>     #18 0x561eb2147e0e in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-34e271ae55382fbdb04f3e13e856457d8e0dee45/tools/perf/pe=
rf.c:401
>     #19 0x561eb2148364 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-34e271ae55382fbdb04f3e13e856457d8e0dee45/tools/perf/perf.c:445
>     #20 0x561eb2148b0b in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-34e271ae55382fbdb04f3e13e856457d8e0dee45/tools/perf/perf.c:553
>     #21 0x7f023e69aca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>
>
> more details are in below link.
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251210/202512101502.f3819cd3-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

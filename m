Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069926;
	b=ygHAvKt4pLM0Kb7eOb/WizPqD2KNhJrER5OK+ogbelHdPZb59sc55dMlrouYFy86NFEF
	 mVtErNavC4PYQjgek17OmbQv5IXfqxcUUD+BeN0KmRQ2IHnPNIQzb+s7drn3vGNorPeqx
	 7H+zmh4T4GO/TNfXkkKAzq8R0X4NvbrhUxPTVRCn/J9ZocG+6lOSUJ5Krwqr5SFilHu2P
	 ArCdvZxacJfVwJeC4Tyjr0/XX9JfMQkSuyUQBn0bXtx4Tz+XUf4mdsV/aBf3BcWF4pba9
	 H4IluogbL+SdRrfLTpEW8g3ZqTQ5XXrfnSqK6oLqE2pH/eaXRr64peg0i5YfGnTlLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069926;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LHj3dpiOEHeWThVmDG4/ErTtGI5tqYkReM3/zTDeKD0=;
	b=4ecK4zXNtFqFM5hb0kwSs+9LiC5yu3GqDEWHAAT6n4VD6246mWe+0KTdXij9VSv77jhR
	 hzTJWO3ChEnsfVkV6yGXRsPn1xbl5yi52/BWAZY2IrKsdqHUlgxJiJ9g6Gn2NZklwykMz
	 vYa7BP+oGlVtOtXDq4oAjt7n/OudQLdAqaYG1j5vh0cbiIAZKX5IAAEKS9H7cZyrSe9qe
	 b6c5HH/Cx47EV6G4n1Ml0nd68o3x9uhrFOnRGRZvMev3T6NZ8G1Lv3A3JcyJAqDhpFDFN
	 Wjv/SQtywHVE9MUZB3c6BpOuvNFWmoFF4g/Aw3xduETRKHCHVjjpafGCYOMOllDS0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fOcgGP4s;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66009606A321
	for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 02:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66009606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fOcgGP4s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793069925; x=1824605925;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=eCiI7o2t0XbFM58qMLr33ebJIB2N8TI9bAvNikXpoYM=;
  b=fOcgGP4sdfrMonNRbUkjO3xjiiXS14aOPRuvzArPl+qjT+5HSTAFoeml
   ysBT8hLlXz5jL9SILZiJFO7D+/N7hXy0UcXxX1fqh+4PljXK+gzKgotw/
   YCXhtR6yiDFV+m/C7B4AWdpB/JO4oO6nnM0sOSmS7vAiIzanwmufR8xkq
   Wgzp1C9ftJmfd1Py9RnOYWgTp8cq7TeEpHEp2E3tUUHHogPH2D2jUMYE4
   p5fIaEldkWGzMcPAlhU0Ahr0v9b79+nL9ejcRutSO+unXpvED9FTin3R1
   nVMRBfqbZ+UTW819fU8akfpqzU9oHLNhqRlsyng4TUjNB7uxikn0tbnva
   g==;
X-CSE-ConnectionGUID: wiVPi1OQSV6boDqGrskfRQ==
X-CSE-MsgGUID: J2Y2j0NMTzS1ozJl3abQow==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1636089"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1636089"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:58:45 -0700
X-CSE-ConnectionGUID: IYecuHH7R7S93/j8VxFMhA==
X-CSE-MsgGUID: gvr9i+26Q3qyD48d2Vyj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6180282"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:58:41 -0700
Date: Tue, 27 Oct 2026 10:58:37 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Ivan Shapovalov <intelfx@intelfx.name>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
	Ivan Shapovalov <intelfx@intelfx.name>, yi1.lai@intel.com
Subject: Re: [PATCH 4/4] perf: support zstd-compressed kernel modules
Message-ID: <202610271022.fab706ea-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-perf-zstd-v1-4-9652727886fa@intelfx.name>


Hello,

kernel test robot noticed "perf-sanity-tests.kmod_path_parse.fail" on:

commit: de7d5e445f2f9dfc4186dc2bd86287d27c9e00bd ("[PATCH 4/4] perf: support zstd-compressed kernel modules")
url: https://github.com/intel-lab-lkp/linux/commits/Ivan-Shapovalov/perf-zstd-zstd_decompress_stream-zstd_decompress_buffer/20261014-203407
patch link: https://lore.kernel.org/all/20261014-perf-zstd-v1-4-9652727886fa@intelfx.name/
patch subject: [PATCH 4/4] perf: support zstd-compressed kernel modules

in testcase: perf-sanity-tests
with following parameters:

	perf_compiler: gcc
	group: group-01


config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake-E) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610271022.fab706ea-lkp@intel.com


2026-10-25 22:43:28 sudo ASAN_OPTIONS=fast_unwind_on_malloc=0 /usr/src/linux-perf-x86_64-rhel-9.4-bpf-de7d5e445f2f9dfc4186dc2bd86287d27c9e00bd/tools/perf/perf test 34 -v
 34: kmod_path__parse                                                                                          : Running (1 active)
---- start ----
...
FAILED tests/kmod-path.c:23 wrong kmod
FAILED tests/kmod-path.c:63 failed
---- end(-1) ----
...
==11697==ERROR: LeakSanitizer: detected memory leaks

...
    #17 0x7f7a0d1b9d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x29d64) (BuildId: 5e5b51f4c39af9ac589408c1dc432ba390a273cc)
    #18 0x5569eccabb90 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-de7d5e445f2f9dfc4186dc2bd86287d27c9e00bd/tools/perf/perf+0x11edb90) (BuildId: c1567a8473607a54274bd80d073619ea9cdc5d77)

SUMMARY: AddressSanitizer: 8 byte(s) leaked in 1 allocation(s).
 34: kmod_path__parse                                                                                          : FAILED!


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261027/202610271022.fab706ea-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



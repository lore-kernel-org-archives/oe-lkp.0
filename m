Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337177;
	b=2Co7e/EHRnKoDkOxiXTi1kMv6j2HoRqk4BkoTohJx4Y9cWgZE9kJrkzorWQc+oMZJNhZ
	 LebtCdlWVD0z5cyJOiDkOMox4Tvx/Y99x3SZ+rgUZvquUCWPxL8EXUWG/xoMJbkmUyoX0
	 L+LRqyTWr0D6gFAzqwnN2wIrw5aYeolXlF/0wXccNXe1/CgACKrnZWqUXPH1eI+0Z20gs
	 /gHMBpqKLu4mtQmgyEiOXUnnYWCeBhXccq2RuGfd2CKlr+T5VwlCBROAgpOmaOKbd5mbN
	 aic+ClmdQXbSwHHA7aq4q7EQ3J5LV7svScHDmpMjzjcaurS7c0BJjfN/ByNESzFdBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337177;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QBaHKNj4jblHhF4v5geYPLLScB23jE/W8QM7XjBR/Vw=;
	b=j0Z1Dkd4XcrZqTRr4zLsgMj0EebAicX3Ffgz+pKfjDcS/B4rRyS5SPwwSpD62RyCBcxb
	 CAzcT++FxjX4HTNYA+H+nsgi6vEQ8t5fXQtO4sBGMmF0TgP1NZnPcOc9eVlNKpJhnA/4k
	 Ta0hn0ONHjE0vrYzn554xTo1YMVIOsv9WQ7PQOCcCY2yqXxT4Vqq3BsKRtOrm9VUNj6gj
	 h07E7kL+is3ghelCyzQHT2DgqI1JBqMT6EQziNHeSs04Bzz5nWQC3r5JmZrJGsrPYx/yf
	 HkqluKvgmysUn0ojmQOhkm8xplwUy+tZo4etuOVyrU+gjCFxdQVw/cmqrS3v+P4P/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTgjMidM;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6936606A337
	for <oe-lkp@lists.linux.dev>; Sun, 22 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6936606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTgjMidM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795337177; x=1826873177;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ui1GA+v5cTSaQ85lo7b0GU51nfczNOxijfJoUkbMx8A=;
  b=HTgjMidM2HiKU41FM+wfkWuoxqx7ISO/5FaE7zRdTBAP/srxzjUy0N+1
   2bWtpx3kjxPdKVAsOCEWFNJgg4cSzWBw1Id/UTLamjOCM0NfFzpa03SyH
   Y4oW3EHoZwZam4PBhITObhdlQNS3g5hHxexMcB+r3hrbD1BWFKWhDQXlI
   FSZVP8RvRCMwTlInCXrZMzf6VUhGrF/+sHiYsyE1z4oV0Hjtn6YS5tQxN
   luSFez8V0fKsFVY6qv8D+SwIfEe2HRCPnlLOs6qf/jbASqK7m/OEGYYPe
   HJ3wEhi37QRCx96ufj8ic++WEhFTISsipehQYiU9QS1MtGSd2cXdaR+E8
   Q==;
X-CSE-ConnectionGUID: SKpXrtKPSy+panZUAVCQpQ==
X-CSE-MsgGUID: UUGQyDICRBi8mh6HMd9/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4195507"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4195507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 00:45:03 -0800
X-CSE-ConnectionGUID: C5YXt7O9QI2uZ/j+/b+5HQ==
X-CSE-MsgGUID: Ba1drWq6QqmB4aUB3vQaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11338019"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 00:44:59 -0800
Date: Sun, 22 Nov 2026 16:44:56 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, yi1.lai@intel.com
Subject: Re: [PATCH v2 11/11] perf tests: Add namespace, nsinfo, and boot ID
 tests
Message-ID: <202611221114.fdeef11c-lkp@intel.com>
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
In-Reply-To: <20261116055731.707164-12-namhyung@kernel.org>


Hello,

kernel test robot noticed "kmsg.sanitizer.direct_leak" on:

commit: b369290e30c535a00527ded3f917c3ad6bb39e5f ("[PATCH v2 11/11] perf tests: Add namespace, nsinfo, and boot ID tests")
url: https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/perf-tools-Add-HEADER_BOOT_ID-feature/20261115-215721
base: https://git.kernel.org/cgit/linux/kernel/git/perf/perf-tools-next.git perf-tools-next patch link: https://lore.kernel.org/all/20261116055731.707164-12-namhyung@kernel.org/
patch subject: [PATCH v2 11/11] perf tests: Add namespace, nsinfo, and boot ID tests

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: gcc
	group: group-02


config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake-E) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611221114.fdeef11c-lkp@intel.com


2026-11-20 18:33:36 sudo ASAN_OPTIONS=fast_unwind_on_malloc=0 /usr/src/linux-perf-x86_64-rhel-9.4-bpf-b369290e30c535a00527ded3f917c3ad6bb39e5f/tools/perf/perf test 74 -v
Not taking turns using the perf mlock budget: nothing can exhaust it
 74: Namespace and nsinfo tests                                                                                :
 74.1: boot_id                                                                                                 : Running (5 active)
 74.1: boot_id                                                                                                 : Ok
 74.2: init_and_copy                                                                                           : Ok
 74.3: proc_and_recycled_tid                                                                                   : Ok
 74.4: thread_liveness                                                                                         : Ok
 74.5: dso_needs_ns                                                                                            : Ok
---- start ----
test child forked, pid 11783
perf: util/dso.c:551: dso__list_add: Assertion `dso__dsos(dso)' failed.
---- unexpected signal (6) ----
mutex_lock error: 'Resource deadlock avoided'
...
=================================================================
==11783==ERROR: LeakSanitizer: detected memory leaks
Direct leak of 8 byte(s) in 1 object(s) allocated from:
...
Direct leak of 8 byte(s) in 1 object(s) allocated from:
...
SUMMARY: AddressSanitizer: 16 byte(s) leaked in 2 allocation(s).
 74.6: mountns_and_chroot                                                                                      : FAILED!

=== Test Summary ===
Passed main tests : 0
Passed subtests   : 5
Skipped tests     : 0
Timed out tests   : 0
Failed tests      : 1
List of failed tests:
   74.6: mountns_and_chroot


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261122/202611221114.fdeef11c-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



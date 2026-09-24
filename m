Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25F6FC5
	for <oe-lkp@lists.linux.dev>; Thu, 24 Sep 2026 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219379; cv=none; b=oQH7b5kI4FEHsBQJjhkTU2cHqWYHLrvaHqRQ4Ge88rkod8vAvdtuLsgMUGW2KSUJch7yfLK8+dAFFHEdTKJAIfOpfOw5UWMvHn5koEPTUGx0yvOZeI642aH7kh1yYYe0YYyNfeGM//01SMeOoaYpJZuDw3dolXJL/pZasyiV5W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219379; c=relaxed/simple;
	bh=PU5uGbDNK3hIBk11jJ1EaIVazKSFemBYQrmpGx2+Mzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGAPw4Hn4s55CJCiC6A1SikFZkIZsypx3Q7U/r57oLg8YTfUu/n63p5wtFZYj/tq4J4tRehu3tyPnaI65y1rWiGzq2GctFPf+JaqLusA8DkUmz5/YF+WN1ptwPZuILQbfIZsi+cXJB8iOcbGnyBm3u11szI45NwtVZ994sW54u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrwN//PD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrwN//PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790219377; x=1821755377;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PU5uGbDNK3hIBk11jJ1EaIVazKSFemBYQrmpGx2+Mzk=;
  b=KrwN//PDiCGHO3hwR2kIHAF9OnEJPmGdDO82mZ8W85y/lOlqiZRV7kHh
   /kJ5/ewE0+4U4bV0eezX96PtarKHkChrmnC/Mjrq0UjpIiQpmTeYs+VEf
   YdxxUi+3kNB4wwPh1t6j2g29FXbp4N8hMmxyacLS7RYscsUUBGlsNadGO
   +E+R2xGqwu3/aZ7En+n95i5GGAx+QDWFKNAQgbEfIdSPEXEpr8ynZ6vyO
   wTUfegUOZKLGer+au3rJFCIFUHD+T2+NVBzBLWDzZXy1SC0BXedfwq+AE
   Ms3idRtiftDUsggqC6rfrZ+RCKZ/LhnnicpKpFv2zewb2+/Ucbwd9RqbN
   A==;
X-CSE-ConnectionGUID: odQfJDSfShm5lBT0ak5jng==
X-CSE-MsgGUID: 1U2kVNvoQli7T1LVD7sh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116499684"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="116499684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:09:36 -0700
X-CSE-ConnectionGUID: cNL2ddMBT1a7YGIN3GxqrQ==
X-CSE-MsgGUID: qxnBPTtlTDmitJczK21CIA==
X-ExtLoop1: 1
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:09:35 -0700
Date: Thu, 24 Sep 2026 11:09:32 +0800
From: kernel test robot <yi1.lai@intel.com>
To: linux+lkp@weissschuh.net
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [thomas-weissschuh:b4/vdso-test-axuclocks] [selftests]  7c376295d5:
 kselftests.vDSO.vdso_test_abi.fail
Message-ID: <202609240418.5f86c307-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed "kselftests.vDSO.vdso_test_abi.fail" on:

commit: 7c376295d55853520104dcb3bf25c2fc7e4655eb ("selftests: vDSO: vdso_test_abi: Add tests for auxiliary clocks") https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-test-axuclocks

in testcase: kselftests
version: kselftests-x86_64-f5098b6bae76-1_20260727
with following parameters:

	group: vDSO

config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

This patch adds new tests for CLOCK_AUX0–AUX7. Those aux clocks may just be inactive here, in which case a # SKIP might be more appropriate than not ok — flagging in case it's expected.


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202609240418.5f86c307-lkp@intel.com


# selftests: vDSO: vdso_test_abi
# TAP version 13
# 1..70
# # [vDSO kselftest] VDSO_VERSION: LINUX_2.6
# # The time is 1790087326.984874
# ok 1 __vdso_gettimeofday
# # clock_id: CLOCK_REALTIME
# # The time is 1790087326.984877034
# ok 2 __vdso_clock_gettime CLOCK_REALTIME
# # Couldn't find __vdso_clock_gettime64
# ok 3 # SKIP __vdso_clock_gettime64 CLOCK_REALTIME
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 4 __vdso_clock_getres CLOCK_REALTIME
# ok 5 # SKIP __vdso_clock_getres_time64 CLOCK_REALTIME
# # clock_id: CLOCK_BOOTTIME
# # The time is 96.383277257
# ok 6 __vdso_clock_gettime CLOCK_BOOTTIME
# # Couldn't find __vdso_clock_gettime64
# ok 7 # SKIP __vdso_clock_gettime64 CLOCK_BOOTTIME
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 8 __vdso_clock_getres CLOCK_BOOTTIME
# ok 9 # SKIP __vdso_clock_getres_time64 CLOCK_BOOTTIME
# # clock_id: CLOCK_TAI
# # The time is 1790087326.984890319
# ok 10 __vdso_clock_gettime CLOCK_TAI
# # Couldn't find __vdso_clock_gettime64
# ok 11 # SKIP __vdso_clock_gettime64 CLOCK_TAI
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 12 __vdso_clock_getres CLOCK_TAI
# ok 13 # SKIP __vdso_clock_getres_time64 CLOCK_TAI
# # clock_id: CLOCK_REALTIME_COARSE
# # The time is 1790087326.983926073
# ok 14 __vdso_clock_gettime CLOCK_REALTIME_COARSE
# # Couldn't find __vdso_clock_gettime64
# ok 15 # SKIP __vdso_clock_gettime64 CLOCK_REALTIME_COARSE
# # The vdso resolution is 0 1000000
# # The syscall resolution is 0 1000000
# ok 16 __vdso_clock_getres CLOCK_REALTIME_COARSE
# ok 17 # SKIP __vdso_clock_getres_time64 CLOCK_REALTIME_COARSE
# # clock_id: CLOCK_MONOTONIC
# # The time is 96.383295122
# ok 18 __vdso_clock_gettime CLOCK_MONOTONIC
# # Couldn't find __vdso_clock_gettime64
# ok 19 # SKIP __vdso_clock_gettime64 CLOCK_MONOTONIC
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 20 __vdso_clock_getres CLOCK_MONOTONIC
# ok 21 # SKIP __vdso_clock_getres_time64 CLOCK_MONOTONIC
# # clock_id: CLOCK_MONOTONIC_RAW
# # The time is 95.932597086
# ok 22 __vdso_clock_gettime CLOCK_MONOTONIC_RAW
# # Couldn't find __vdso_clock_gettime64
# ok 23 # SKIP __vdso_clock_gettime64 CLOCK_MONOTONIC_RAW
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 24 __vdso_clock_getres CLOCK_MONOTONIC_RAW
# ok 25 # SKIP __vdso_clock_getres_time64 CLOCK_MONOTONIC_RAW
# # clock_id: CLOCK_MONOTONIC_COARSE
# # The time is 96.382318981
# ok 26 __vdso_clock_gettime CLOCK_MONOTONIC_COARSE
# # Couldn't find __vdso_clock_gettime64
# ok 27 # SKIP __vdso_clock_gettime64 CLOCK_MONOTONIC_COARSE
# # The vdso resolution is 0 1000000
# # The syscall resolution is 0 1000000
# ok 28 __vdso_clock_getres CLOCK_MONOTONIC_COARSE
# ok 29 # SKIP __vdso_clock_getres_time64 CLOCK_MONOTONIC_COARSE
# # clock_id: CLOCK_PROCESS_CPUTIME_ID
# # The time is 0.15759893
# ok 30 __vdso_clock_gettime CLOCK_PROCESS_CPUTIME_ID
# # Couldn't find __vdso_clock_gettime64
# ok 31 # SKIP __vdso_clock_gettime64 CLOCK_PROCESS_CPUTIME_ID
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 32 __vdso_clock_getres CLOCK_PROCESS_CPUTIME_ID
# ok 33 # SKIP __vdso_clock_getres_time64 CLOCK_PROCESS_CPUTIME_ID
# # clock_id: CLOCK_THREAD_CPUTIME_ID
# # The time is 0.15769024
# ok 34 __vdso_clock_gettime CLOCK_THREAD_CPUTIME_ID
# # Couldn't find __vdso_clock_gettime64
# ok 35 # SKIP __vdso_clock_gettime64 CLOCK_THREAD_CPUTIME_ID
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 36 __vdso_clock_getres CLOCK_THREAD_CPUTIME_ID
# ok 37 # SKIP __vdso_clock_getres_time64 CLOCK_THREAD_CPUTIME_ID
# # clock_id: CLOCK_AUX0
# not ok 38 __vdso_clock_gettime CLOCK_AUX0
# # Couldn't find __vdso_clock_gettime64
# ok 39 # SKIP __vdso_clock_gettime64 CLOCK_AUX0
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 40 __vdso_clock_getres CLOCK_AUX0
# ok 41 # SKIP __vdso_clock_getres_time64 CLOCK_AUX0
# # clock_id: CLOCK_AUX1
# not ok 42 __vdso_clock_gettime CLOCK_AUX1
# # Couldn't find __vdso_clock_gettime64
# ok 43 # SKIP __vdso_clock_gettime64 CLOCK_AUX1
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 44 __vdso_clock_getres CLOCK_AUX1
# ok 45 # SKIP __vdso_clock_getres_time64 CLOCK_AUX1
# # clock_id: CLOCK_AUX2
# not ok 46 __vdso_clock_gettime CLOCK_AUX2
# # Couldn't find __vdso_clock_gettime64
# ok 47 # SKIP __vdso_clock_gettime64 CLOCK_AUX2
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 48 __vdso_clock_getres CLOCK_AUX2
# ok 49 # SKIP __vdso_clock_getres_time64 CLOCK_AUX2
# # clock_id: CLOCK_AUX3
# not ok 50 __vdso_clock_gettime CLOCK_AUX3
# # Couldn't find __vdso_clock_gettime64
# ok 51 # SKIP __vdso_clock_gettime64 CLOCK_AUX3
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 52 __vdso_clock_getres CLOCK_AUX3
# ok 53 # SKIP __vdso_clock_getres_time64 CLOCK_AUX3
# # clock_id: CLOCK_AUX4
# not ok 54 __vdso_clock_gettime CLOCK_AUX4
# # Couldn't find __vdso_clock_gettime64
# ok 55 # SKIP __vdso_clock_gettime64 CLOCK_AUX4
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 56 __vdso_clock_getres CLOCK_AUX4
# ok 57 # SKIP __vdso_clock_getres_time64 CLOCK_AUX4
# # clock_id: CLOCK_AUX5
# not ok 58 __vdso_clock_gettime CLOCK_AUX5
# # Couldn't find __vdso_clock_gettime64
# ok 59 # SKIP __vdso_clock_gettime64 CLOCK_AUX5
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 60 __vdso_clock_getres CLOCK_AUX5
# ok 61 # SKIP __vdso_clock_getres_time64 CLOCK_AUX5
# # clock_id: CLOCK_AUX6
# not ok 62 __vdso_clock_gettime CLOCK_AUX6
# # Couldn't find __vdso_clock_gettime64
# ok 63 # SKIP __vdso_clock_gettime64 CLOCK_AUX6
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 64 __vdso_clock_getres CLOCK_AUX6
# ok 65 # SKIP __vdso_clock_getres_time64 CLOCK_AUX6
# # clock_id: CLOCK_AUX7
# not ok 66 __vdso_clock_gettime CLOCK_AUX7
# # Couldn't find __vdso_clock_gettime64
# ok 67 # SKIP __vdso_clock_gettime64 CLOCK_AUX7
# # The vdso resolution is 0 1
# # The syscall resolution is 0 1
# ok 68 __vdso_clock_getres CLOCK_AUX7
# ok 69 # SKIP __vdso_clock_getres_time64 CLOCK_AUX7
# # The time in hours since January 1, 1970 is 497246
# ok 70 __vdso_time
# # 34 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# # Totals: pass:28 fail:8 xfail:0 xpass:0 skip:34 error:0
not ok 3 selftests: vDSO: vdso_test_abi # exit=1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260924/202609240418.5f86c307-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



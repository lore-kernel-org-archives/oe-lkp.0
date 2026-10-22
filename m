Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669807;
	b=5ll3P2WyB5jdi+R0xBSsRKvf6rnC6R7zwkbag4eSaFKRBr9udVuboFnPpw9gq4u6agbI
	 IfgDNPwg2i6Kq6eXK0HwVaQXs+sY7OY8i9Alx7jkdKJtS173XufpbourxpCaNtWRqr4Bv
	 hoD0xb+AtnA2E3omEBDfIljcSt0ahZmCS85a2k/ZYoJHZg/CuhNySd7fgRIX1AHQRnOGx
	 cm7rz2/wVi32F8MiQvpfSyk5Bxqml7nMlnJ+wT2P1oSEqdiVcJeiXYZu31Ss50Dmgase/
	 0AGd2LFkNixh/6+JPez8UZ8sJ8djUHTmIDJ5T36zllKu9KflZM/xHBD7R8knPCCDtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=iLUqibiwK3FxvsTU5Nsm7GhHMalzQ1/ODjyCmbCtqDw=;
	b=dpSe+986h3NjpWimCHuxCjbb9pLawX8kn4dCfwHhbGKED8QZIBzYOR9tuP1mm49y6J2I
	 nNoAwbjklAa0O5Y4g4ZDa72Pg6S3ymlC03+pjValhC++zLoVIB4N0KLu2j18hH6WbxHC0
	 6CMOwksifRlQ2Gxwi9KaUIKwzYuXsWh5JjrhjS48+lAwdODJS+pDe1PwpkMpIQA7iN4u7
	 isb99Ym/QYk2iKt6vKK28uYwqR4KAF8yWG6mVZiQt/cd/PiPgMr0iTYHl2bZfSLyAQgPA
	 +N7ZXhNCY06lO4xnLsRegsb+33hp/en+S60hNiP+OIEnSjyxt/qKobPZtElVAC3rxnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWIixEBq;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01A606A31B
	for <oe-lkp@lists.linux.dev>; Thu, 22 Oct 2026 11:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B01A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWIixEBq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792669807; x=1824205807;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=2DrVNaultXTc1qQbNwuEhIGizd9g653dYUGKXABLVkM=;
  b=WWIixEBqDu+f684CdpeC/SXgj1fiyTID+GjtcIcxpV42uDLfgn8QMe33
   Kbr7Zqm6fTvZ8Eucoer3yA/k3hWJ6MgUnOzE/hnnHOZLgPEU1TF1DqVF4
   zvCn18W8maSQmtiNpiWRdm1LnEw+XNzGRYp4XrraPtrpX+jhQndN16UUa
   HL/2qNk2hhaLjIhFsJv4mJMuyaMLtdV1rp0EQ62OK8qn1ozs/CUb7Y4xM
   qW1Waj54GOY8d/n+kBf6ghgnwu+3j8JJyN5fyLMk/oooKxtynnG1fT91g
   kcLSRnRqScb/HkxPGHSw7FNB+TCc0Hw5jHpMOBFc/i3mADWa8QXuz5Y9J
   A==;
X-CSE-ConnectionGUID: TPqeBXWOTB+tMtRSVncLSg==
X-CSE-MsgGUID: +Z+DL90zRjKVZn8S0Xb93w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1424581"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1424581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:50:06 -0700
X-CSE-ConnectionGUID: f4ACdk9iSEKaX/l8gm+dSA==
X-CSE-MsgGUID: rW4AbCNxTTqgfeKYUSIrrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3734970"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:50:03 -0700
Date: Thu, 22 Oct 2026 19:50:00 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jackie Liu <liu.yun@linux.dev>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, ltp@lists.linux.it, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, yi1.lai@intel.com
Subject: Re: [PATCH] cpufreq: Avoid fallback values in cpuinfo_avg_freq
Message-ID: <202610221936.40b4334f-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019065358.66115-1-liu.yun@linux.dev>


Hello,

kernel test robot noticed "ltp.runpwtests03.fail" on:

commit: e5f9d99762e285664eea5ecbab004c8444930f22 ("[PATCH] cpufreq: Avoid fallback values in cpuinfo_avg_freq")
url: https://github.com/intel-lab-lkp/linux/commits/Jackie-Liu/cpufreq-Avoid-fallback-values-in-cpuinfo_avg_freq/20261019-145358
base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next patch link: https://lore.kernel.org/all/20261019065358.66115-1-liu.yun@linux.dev/
patch subject: [PATCH] cpufreq: Avoid fallback values in cpuinfo_avg_freq

in testcase: ltp
version: ltp-x86_64-1255a3be5-1_20261017 with following parameters:

	test: power_management_tests


config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610221936.40b4334f-lkp@intel.com


PATH=/lkp/benchmarks/ltp:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/lkp/lkp/src/bin
2026-10-21 16:24:03 cd /lkp/benchmarks/ltp
2026-10-21 16:24:03 export LTP_RUNTIME_MUL=2
2026-10-21 16:24:03 export LTPROOT=/lkp/benchmarks/ltp
2026-10-21 16:24:03 kirk -f power_management_tests Host information
	Hostname:   lkp-hsw-d05
	Python:     3.13.5 (main, Jun 13 2026, 14:18:01) [GCC 14.2.0]
	Directory:  /tmp/kirk.root/tmp_2s1ns12

Connecting to SUT: default

Suite: power_management_tests
─────────────────────────────
 [1;37mcpufreq_intel:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.282s)
 [1;37mrfim01:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.017s)
 [1;37mhigh_freq_hwp_cap_cppc:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.015s)
 [1;37mrunpwtests03:  [0m [1;31mfail [0m |  [1;33mtainted [0m  (0.532s)
 [1;37mrunpwtests04:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.011s)
 [1;37mrunpwtests06:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.048s)

Execution time: 1.103s

Disconnecting from SUT: default

Target information
──────────────────
Kernel:   Linux 7.3.0-rc7+ #1 SMP PREEMPT_DYNAMIC Thu Oct 22 00:04:36 CST 2026
Cmdline:  ip=::::lkp-hsw-d05::dhcp
          root=/dev/ram0
          RESULT_ROOT=/result/ltp/power_management_tests/lkp-hsw-d05/debian-13-x86_64-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/e5f9d99762e285664eea5ecbab004c8444930f22/0
          BOOT_IMAGE=/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/e5f9d99762e285664eea5ecbab004c8444930f22/vmlinuz-7.3.0-rc7+
          branch=internal-devel/devel-hourly-20261020-060911
          job=/lkp/jobs/scheduled/lkp-hsw-d05/ltp-power_management_tests-debian-13-x86_64-20250902.cgz-e5f9d99762e2-20261022-15031-ddtgwr-1.yaml
          user=lkp
          ARCH=x86_64
          kconfig=x86_64-rhel-9.4-ltp
          commit=e5f9d99762e285664eea5ecbab004c8444930f22
          intremap=posted_msi
          max_uptime=7200
          LKP_SERVER=internal-lkp-server
          nokaslr
          selinux=0
          debug
          apic=debug
          sysrq_always_enabled
          rcupdate.rcu_cpu_stall_timeout=100
          net.ifnames=0
          printk.devkmsg=on
          panic=-1
          softlockup_panic=1
          nmi_watchdog=panic
          oops=panic
          load_ramdisk=2
          prompt_ramdisk=0
          drbd.minor_count=8
          systemd.log_level=err
          ignore_loglevel
          console=tty0
          earlyprintk=ttyS0,115200
          console=ttyS0,115200
          vga=normal
          rw
          keep_initrds=/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x86_64-1255a3be5-1_20261017.cgz
Machine:  unknown
Arch:     x86_64
RAM:      14035028 kB
Swap:     0 kB
Distro:   debian 13

────────────────────────
      TEST SUMMARY
────────────────────────
Suite:   power_management_tests
Runtime: 0.905s
Runs:    6

Results:
    Passed:   194
    Failed:   1
    Broken:   0
    Skipped:  2
    Warnings: 0

 [1;31mFailures: [0m
    • runpwtests03

Session stopped
LTP test details
----------------
runpwtests03: Power_Management03 1 TFAIL: CPUFREQ sysfs tests



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261022/202610221936.40b4334f-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



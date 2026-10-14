Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9D2D876B
	for <oe-lkp@lists.linux.dev>; Wed, 14 Oct 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791942756; cv=none; b=grLgFFCOwkJtpvS7L3kOU0KG9FjWUFNW+gh3ESLRSinNhMSdHknm0BF8zw1uBnSaHoGXY4u2yU/7I49eOrmUyshTpQRjsF4HbZEcGLmouLdU+CAEbmbh9d6V4maLp6jzbfaMhYOLJ2YKWV51g8/KkAxXLsZaaVOR5ayoMtl9//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791942756; c=relaxed/simple;
	bh=SzfhGHld7uDUyllDSTm+LGWLxxboH5vHOcTI3Ebr+4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSFHymlKysr2hltMISwbeuDVIn5M0JV1PyjyK62kC2rPgd5rGOyuMgPIIgD6PyAz+VL8JkbJF7zq80Eicq0JHTimYcNyKX1spWW3a/NdhrZKb6q6DPm45RHjy/ulWJcfxw2hZBPx11yn85e/3hQLdu9uIuqjJHWhbRVmWyjNf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSMcA42O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSMcA42O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791942752; x=1823478752;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SzfhGHld7uDUyllDSTm+LGWLxxboH5vHOcTI3Ebr+4Y=;
  b=SSMcA42OfFWsQU/VpuEcGvzv2c4ANaEKAwHLB5HCZ+FjSGROAlLHjA9G
   FtG9dDN0kwAsKMa1B4Z3RRIOWJn++TyMhil5lIt0EKB3X4f9trafoQ0Kr
   Y3MY3mh9Y8+qXZoxquTT5QqjvKQ3iLfdZgpCD2li+EBQGOhgN6jTZTD+E
   W3ikfJQ9rlRqFutpqtxRT13MXELsLqxQZirpcohNFg4QDEPAEZAZp1uH5
   pgTOhJeMhheRlRgIUrT3jZpLeFP8TJXFRBjVxOZwczeeJoM3WkaJf5TBw
   FZ2zSSUMqd8Si+v8XtJx9QJTCifjKag/RLP79aZkt8Smm7yQ9+mQfmhgh
   w==;
X-CSE-ConnectionGUID: o+NiQjj5RxaocHUa8f7iNg==
X-CSE-MsgGUID: N+icvBopQo2f4cclyhWG8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="581494"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="581494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:52:32 -0700
X-CSE-ConnectionGUID: jP/I8/cpTfewxwao0WlDYg==
X-CSE-MsgGUID: sB0JH8WST96/t4TeWovz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1322118"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:52:29 -0700
Date: Wed, 14 Oct 2026 09:52:26 +0800
From: kernel test robot <yi1.lai@intel.com>
To: linux+lkp@weissschuh.net
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [thomas-weissschuh:b4/module-hashes] [module]  83aef29871:
 ltp.lock_torture.fail
Message-ID: <202610140326.7af39394-lkp@intel.com>
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

kernel test robot noticed "ltp.lock_torture.fail" on:

commit: 83aef298714afd0a25be0fe27bf55a877fef917c ("module: Introduce hash-based integrity checking") https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes

in testcase: ltp
version: ltp-x86_64-113594f53-1_20261010 with following parameters:

  test: kernel_misc



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610140326.7af39394-lkp@intel.com


Suite: kernel_misc
──────────────────
 [1;37mcn_pec_sh:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.222s)
 [1;37mkmsg01:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (4.730s)
 [1;37mfw_load01:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.015s)
 [1;37mfw_load02:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.016s)
 [1;37mrtc01:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (9.368s)
 [1;37mrtc02:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.011s)
 [1;37mblock_dev:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.251s) Restarting SUT: default
 [1;37mtpci:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (2.358s)
 [1;37mtbio:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.002s)
 [1;37mltp_acpi:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.909s)
 [1;37mcpufreq_boost:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (1.496s)
 [1;37muaccess:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.084s)
 [1;37mrcu_torture:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (2m 18s)
 [1;37mlock_torture:  [0m [1;31mfail [0m |  [1;33mtainted [0m  (6m 2s)
 [1;37mzram02:  [0m [1;36mskip [0m |  [1;33mtainted [0m  (0.334s)
 [1;37mzram03:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.813s)
 [1;37mumip_basic_test:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.020s)
 [1;37maslr01:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (5.538s)
 [1;37mcoredump01:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.021s)
 [1;37mcoredump02:  [0m [1;32mpass [0m |  [1;33mtainted [0m  (0.013s)
 [1;37mirqbalance01:  [0m [1;31mfail [0m |  [1;33mtainted [0m  (0.009s)

Execution time: 8m 46s

Disconnecting from SUT: default

Target information
──────────────────
Kernel:   Linux 7.3.0-rc5+ #1 SMP PREEMPT_DYNAMIC Tue Oct 13 13:37:23 CEST 2026
Cmdline:  ip=10.250.17.22::10.250.17.2:255.255.255.0:lkp-rpl-d01::off
          root=/dev/ram0
          RESULT_ROOT=/result/ltp/kernel_misc/lkp-rpl-d01/debian-13-x86_64-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/83aef298714afd0a25be0fe27bf55a877fef917c/0
          BOOT_IMAGE=/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/83aef298714afd0a25be0fe27bf55a877fef917c/vmlinuz-7.3.0-rc5+
          branch=internal-devel/devel-hourly-20261007-072235
          job=/lkp/jobs/scheduled/lkp-rpl-d01/ltp-kernel_misc-debian-13-x86_64-20250902.cgz-83aef298714a-20261013-98700-i1guvr-0.yaml
          user=lkp
          ARCH=x86_64
          kconfig=x86_64-rhel-9.4-ltp
          commit=83aef298714afd0a25be0fe27bf55a877fef917c
          intremap=posted_msi
          acpi_rsdp=0x3f88a014
          kho=off
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
          earlyprintk=ttyUSB0,115200
          console=ttyUSB0,115200
          vga=normal
          rw
          keep_initrds=/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x86_64-113594f53-1_20261010.cgz
          acpi_rsdp=0x3f88a014
Machine:  unknown
Arch:     x86_64
RAM:      28235532 kB
Swap:     0 kB
Distro:   debian 13

────────────────────────
      TEST SUMMARY
────────────────────────
Suite:   kernel_misc
Runtime: 8m 46s
Runs:    21

Results:
    Passed:   305
    Failed:   7
    Broken:   0
    Skipped:  6
    Warnings: 0

 [1;31mFailures: [0m
    • lock_torture
    • irqbalance01

Session stopped

Dmesg details:
[  305.944962][ T6954] /lkp/benchmarks/ltp/kirk[4895]: lock_torture: start (command: lock_torture.sh)
[  305.957887][ T6960] finit_module: fd=3, uargs=0000000069e374dd, flags=0
[  305.959564][ T6960] ==>mod_verify_sig(,244021)
[  305.961526][ T6960] Core section allocation order for torture:
[  305.962667][ T6960] #011.text
[  305.963841][ T6960] #011__ksymtab
[  305.965043][ T6960] #011__kflagstab
[  305.966271][ T6960] #011.rodata
[  305.967345][ T6960] #011__mcount_loc
[  305.968447][ T6960] #011__param
[  305.969566][ T6960] #011.retpoline_sites
[  305.970696][ T6960] #011.return_sites
[  305.971846][ T6960] #011.call_sites
[  305.973075][ T6960] #011.orc_unwind
[  305.974290][ T6960] #011.orc_unwind_ip
[  305.975477][ T6960] #011.note.gnu.build-id
[  305.976594][ T6960] #011.note.Linux
[  305.977716][ T6960] #011.orc_header
[  305.978857][ T6960] #011__ksymtab_strings
[  305.980019][ T6960] #011__jump_table
[  305.981208][ T6960] #011.static_call_sites
[  305.982259][ T6960] #011__bug_table
[  305.983463][ T6960] #011__patchable_function_entries
[  305.984592][[  305.991423][ T6960] #011.init_array
[  305.992482][ T6960] #011.symtab
[  305.993548][ T6960] #011.strtab
[  305.995031][ T6960] Final section addresses for torture:
[  305.996185][ T6960] #0110xffffffffc35da000 0x00000168 __ksymtab
[  305.997362][ T6960] #0110xf[  306.014494][ T6960] #0110xffffffffc35dcc04 0x00000090 .return_sites
[  306.015546][ T6960] #0110xffffffffc35dcc94 0x00000440 .call_sites
[  306.016613][ T6960] #0110xffffffffc35dd0d4 0x000006d2 .orc_unwind
[  306.017683][ T6960] #0110xffffffffc35dd7a6 0x0000048c[  306.036629][ T6960] Failed to find symbol torture_hrtimeout_ns
[  306.037665][ T6960] Failed to find symbol torture_hrtimeout_s
[  306.038705][ T6960] Failed to find symbol torture_hrtimeout_us
[  306.039752][ T6960] Failed to find symbol torture_ini[  306.060049][ T6960] finit_module: fd=4, uargs=0000000069e374dd, flags=0
[  306.061169][ T6960] ==>mod_verify_sig(,305525)
[  306.062935][ T6960] Core section allocation order for locktorture:
[  306.063953][ T6960] #011.text
[  306.064946][ T6960] #011.ro[  306.080817][ T6960] #011.printk_index
[  306.081688][ T6960] #011.fini_array
[  306.082541][ T6960] #011.gnu.linkonce.this_module
[  306.083372][ T6960] Init section allocation order for locktorture:
[  306.084183][ T6960] #011.init.text
[  306.085094][ T6960][  306.103359][ T6960] #0110xffffffffc35ed98c 0x00000b7c .orc_unwind
[  306.104020][ T6960] #0110xffffffffc35ee508 0x000007a8 .orc_unwind_ip
[  306.104728][ T6960] #0110xffffffffc35eecb0 0x00000024 .note.gnu.build-id
[  306.105415][ T6960] #0110xffffffffc35eecd4 0x[  306.125143][ T6982] spin_lock-torture: lock_torture_writer task started
[  306.126025][ T6960] spin_lock-torture: Creating lock_torture_writer task
[  306.126027][ T6983] spin_lock-torture: lock_torture_writer task started
[  306.128526][ T6960] spin[  306.147289][ T6960] spin_lock-torture: Creating lock_torture_writer task
[  306.147292][ T7017] spin_lock-torture: lock_torture_writer task started
[  306.150336][ T7018] spin_lock-torture: lock_torture_writer task started
[  306.154738][ T6960] spin[  306.178048][ T7039] spin_lock-torture: lock_torture_writer task started
[  306.178086][ T6960] spin_lock-torture: Creating lock_torture_writer task
[  306.178092][ T7041] spin_lock-torture: lock_torture_writer task started
[  306.181427][ T6960] spin[  306.193460][ T6960] spin_lock-torture: Creating lock_torture_writer task
[  306.193498][ T7057] spin_lock-torture: lock_torture_writer task started
[  306.194374][ T6960] spin_lock-torture: Creating lock_torture_writer task
[  306.194382][ T7058] spi[  306.222873][ T7068] spin_lock-torture: Stopping torture_shuffle task
[  306.224064][ T6964] spin_lock-torture: torture_shuffle is stopping
[  306.225204][ T7068] spin_lock-torture: Stopping torture_stutter task
[  306.226271][ T6965] spin_lock-tortur[  306.227555][ T6971] spin_lock-torture: lock_torture_writer is stopping
[  306.227555][ T7018] spin_lock-torture: lock_torture_writer is stopping
[  306.227555][ T7006] spin_lock-torture: lock_torture_writer is stopping
[  306.227555][ T7003] spin_loc[  306.260520][ T7068] spin_lock-torture: Stopping lock_torture_writer task
[  306.261269][ T7068] spin_lock-torture: Stopping lock_torture_writer task
[  306.262009][ T7068] spin_lock-torture: Stopping lock_torture_writer task
[  306.262937][ T7068] sp[  306.281882][ T7068] Writes:  Total: 574656  Max/Min: 48792/2 ???  Fail: 0 
[  306.282557][ T7068] spin_lock-torture:--- End of test: SUCCESS: acq_writer_lim=0 bind_readers=0-15 bind_writers=0-15 call_rcu_chains=0 long_hold=100 nested_locks=0 nreaders_s[  306.319028][ T7145] finit_module: fd=3, uargs=00000000915ecb7f, flags=0
[  306.320155][ T7145] ==>mod_verify_sig(,305525)
[  306.321754][ T7145] Core section allocation order for locktorture:
[  306.322585][ T7145] #011.text
[  306.323409][ T7145] #011.ro[  306.326921][ T7145] #011.call_sites
[  306.327613][ T7145] #011.orc_unwind
[  306.328269][ T7145] #011.orc_unwind_ip
[  306.328920][ T7145] #011.note.gnu.build-id
[  306.329608][ T7145] #011.note.Linux
[  306.330271][ T7145] #011.orc_header
[  306.330920][ T7145] #011[  306.349173][ T7145] #0110xffffffffc27fc000 0x00000070 .static_call_sites
[  306.349893][ T7145] #0110xffffffffc35e4c40 0x00000500 .gnu.linkonce.this_module
[  306.350575][ T7145] #0110xffffffffc35ea000 0x00002d7d .rodata
[  306.351205][ T7145] #0110xffffffffc35e[  306.369519][ T7158] spin_lock-torture: lock_torture_writer task started
[  306.371796][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.371803][ T7162] spin_lock-torture: lock_torture_writer task started
[  306.372554][ T7145] spin[  306.393579][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.393584][ T7195] spin_lock-torture: lock_torture_writer task started
[  306.394372][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.394377][ T7196] spi[  306.425526][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.425615][ T7222] spin_lock-torture: lock_torture_writer task started
[  306.426675][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.426718][ T7223] spi[  306.441831][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.441834][ T7234] spin_lock-torture: lock_torture_writer task started
[  306.443022][ T7145] spin_lock-torture: Creating lock_torture_writer task
[  306.443029][ T7235] spi[  307.421389][ T7201] torture_spin_lock_write_delay: delay = 100 jiffies.
[  308.858165][ T7156] torture_spin_lock_write_delay: delay = 100 jiffies.
[  309.167003][ T7195] torture_spin_lock_write_delay: delay = 100 jiffies.
[  310.365649][ T7181] torture_spin_lock_write_delay: delay = 100 jiffies.
[  310.505297][ T7156] torture_spin_lock_write_delay: delay = 100 jiffies.
[  311.414559][ T7180] torture_spin_lock_write_delay: delay = 100 jiffies.
[  311.969732][ T7213] torture_spin_lock_write_delay: delay = 100 jiffies.
[  315.541414][ T7192] torture_spin_lock_write_delay: delay = 100 jiffies.
[  317.803594][ T7162] torture_spin_lock_write_delay: delay = 100 jiffies.
[  318.260614][ T7202] torture_spin_lock_write_delay: delay = 100 jiffies.
[  319.551466][ T7249] torture_spin_lock_write_delay: delay = 100 jiffies.
[  320.508176][ T7156] torture_spin_lock_write_delay: delay = 100 jiffies.
[  323.301282][ T7156] torture_spin_lock_write_delay: delay = 100 jiffies.
[  323.421616][ T7181] torture_spin_lock_write_delay: delay = 100 jiffies.
[  323.690383][ T7163] torture_spin_lock_write_delay: delay = 100 jiffies.
[  323.901869][ T7216] torture_spin_lock_write_delay: delay = 100 jiffies.
[  324.333253][ T7228] torture_spin_lock_write_delay: delay = 100 jiffies.
[  325.813727][ T7168] torture_spin_lock_write_delay: delay = 100 jiffies.
[  326.081040][ T7222] torture_spin_lock_write_delay: delay = 100 jiffies.
[  326.745630][ T7216] torture_spin_lock_write_delay: delay = 100 jiffies.
[  327.311213][ T7163] torture_spin_lock_write_delay: delay = 101 jiffies.
[  327.634198][ T7196] torture_spin_lock_write_delay: delay = 100 jiffies.
[  329.419788][ T7174] torture_spin_lock_write_delay: delay = 100 jiffies.
[  329.791786][ T7186] torture_spin_lock_write_delay: delay = 100 jiffies.
[  331.632868][ T7163] torture_spin_lock_write_delay: delay = 100 jiffies.
[  332.173203][ T7156] torture_spin_lock_write_delay: delay = 100 jiffies.
[  337.372592][ T7163] torture_spin_lock_write_delay: delay = 100 jiffies.
[  338.160409][ T7186] torture_spin_lock_write_delay: delay = 100 jiffies.
[  341.433594][ T7216] torture_spin_lock_write_delay: delay = 100 jiffies.
[  342.199255][ T7202] torture_spin_lock_write_delay: delay = 100 jiffies.
[  345.337444][ T7223] torture_spin_lock_write_delay: delay = 100 jiffies.
[  345.700345][ T7249] torture_spin_lock_write_delay: delay = 100 jiffies.
[  345.863002][ T7228] torture_spin_lock_write_delay: delay = 100 jiffies.
[  347.175216][ T7235] torture_spin_lock_write_delay: delay = 101 jiffies.
[  347.904213][ T7170] torture_spin_lock_write_delay: delay = 101 jiffies.
[  348.889593][ T7170] torture_spin_lock_write_delay: delay = 100 jiffies.
[  349.005867][ T7192] torture_spin_lock_write_delay: delay = 100 jiffies.
[  350.237821][ T7234] torture_spin_lock_write_delay: delay = 100 jiffies.
[  353.656281][ T7162] torture_spin_lock_write_delay: delay = 100 jiffies.
[  355.125248][ T7235] torture_spin_lock_write_delay: delay = 100 jiffies.
[  356.661177][ T7168] torture_spin_lock_write_delay: delay = 100 jiffies.
[  357.281641][ T7213] torture_spin_lock_write_delay: delay = 100 jiffies.
[  OK  ] Started rc-local.service - /etc/rc.local Compatibility.
[  357.686311][ T7246] torture_spin_lock_write_delay: delay = 100 jiffies.
[  OK  ] Started getty@tty1.service - Getty on tty1.
[  OK  ] Started getty@tty2.service - Getty on tty2.
[  OK  ] Started getty@tty3.service - Getty on tty3.
[  OK  ] Started getty@tty4.service - Getty on tty4.
[  358.451515][ T7158] torture_spin_lock_write_delay: delay = 100 jiffies.
[  OK  ] Started getty@tty5.service - Getty on tty5.
[  OK  ] Started getty@tty6.service - Getty on tty6.
[  OK  ] Reached target getty.target - Login Prompts.
[  OK  ] Reached target multi-user.target - Multi-User System.
         Starting watchdog.service - watchdog daemon...
[  OK  ] Started watchdog.service - watchdog daemon.
[  OK  ] Reached target graphical.target - Graphical Interface.
[  359.767836][ T7192] torture_spin_lock_write_delay: delay = 100 jiffies.
[  360.623078][ T7223] torture_spin_lock_write_delay: delay = 100 jiffies.
[  360.872590][ T7170] torture_spin_lock_write_delay: delay = 100 jiffies.
[  363.094866][ T7180] torture_spin_lock_write_delay: delay = 100 jiffies.
[  363.786653][ T7170] torture_spin_lock_write_delay: delay = 100 jiffies.
[  365.071608][ T7249] torture_spin_lock_write_delay: delay = 100 jiffies.
[  365.899833][ T7163] torture_spin_lock_write_delay: delay = 100 jiffies.
[  366.464145][ T7228] spin_lock-torture: lock_torture_writer is stopping
[  366.464145][ T7213] spin_lock-torture: lock_torture_writer is stopping
[  366.464145][ T7186] spin_lock-torture: lock_torture_writer is stopping
[  366.464145][ T7192] spin_lock-torture: lock_torture_writer is stopping
[  366.464145][ T7156] spin_lock-torture: lock_torture_writer is stopping
[  366.464145][ T7249] spin_lock-torture: lock_torture_writer is stopping
[  366.464147][ T7158] spin_lock-torture: lock_torture_writer is stopping
[  366.464147][ T7175] spin_lock-torture: lock_torture_writer is stopping
[  366.464147][ T7240] spin_lock-torture: lock_torture_writer is stopping
[  366.464147][ T7235] spin_lock-torture: lock_torture_writer is stopping
[  366.464148][ T7246] spin_lock-torture: lock_torture_writer is stopping
[  366.464148][ T7180] spin_lock-torture: lock_torture_writer is stopping
[  366.464148][ T7153] spin_lock-torture: torture_stutter is stopping
[  366.464149][ T7174] spin_lock-torture: lock_torture_writer is stopping
[  366.464150][ T7216] spin_lock-torture: lock_torture_writer is stopping
[  366.464153][ T7162] spin_lock-torture: lock_torture_writer is stopping
[  366.464155][ T7230] spin_lock-torture: lock_torture_writer is stopping
[  366.464158][ T7168] spin_lock-torture: lock_torture_writer is stopping
[  366.464160][ T7222] spin_lock-torture: lock_torture_writer is stopping
[  366.464160][ T7196] spin_lock-torture: lock_torture_writer is stopping
[  366.464160][ T7163] spin_lock-torture: lock_torture_writer is stopping
[  366.464161][ T7202] spin_lock-torture: lock_torture_writer is stopping
[  366.464162][ T7241] spin_lock-torture: lock_torture_writer is stopping
[  366.464163][ T7223] spin_lock-torture: lock_torture_writer is stopping
[  366.464165][ T7207] spin_lock-torture: lock_torture_writer is stopping
[  366.464165][ T7217] spin_lock-torture: lock_torture_writer is stopping
[  366.464166][ T7201] spin_lock-torture: lock_torture_writer is stopping
[  366.464166][ T7147] spin_lock-torture: torture_shuffle is stopping
[  366.464166][ T7195] spin_lock-torture: lock_torture_writer is stopping
[  366.464167][ T7189] spin_lock-torture: lock_torture_writer is stopping
[  366.464169][ T7181] spin_lock-torture: lock_torture_writer is stopping
[  366.464169][ T7170] spin_lock-torture: lock_torture_writer is stopping
[  366.464170][ T7208] spin_lock-torture: lock_torture_writer is stopping
[  366.464173][ T7234] spin_lock-torture: lock_torture_writer is stopping
[  366.464229][ T7537] spin_lock-torture: Stopping torture_shuffle task
[  366.464650][ T7537] spin_lock-torture: Stopping torture_stutter task
[  366.464841][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.464965][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.464982][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465125][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465305][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465333][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465383][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465400][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465414][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465477][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465491][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465546][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465605][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465622][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465687][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465704][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465759][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465775][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465921][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465937][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465972][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.465993][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.466010][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.466025][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.466081][ T7537] spin_lock-torture: Stopping lock_torture_writer task
[  366.466145][ T7537] spin_lock-torture: Stopping lock_torture_writer[  366.471391][ T7537] locktorture unusing torture
[  366.503624][ T7612] finit_module: fd=3, uargs=00000000737de995, flags=0
[  366.503731][ T7612] ==>mod_verify_sig(,305525)
[  366.504768][ T7612] Core section allocation order for locktorture:
[  366.504795][ T7612] #011.text
[  366.504802][ T7612] #011.rodata
[  366.504808][ T7612] #011__mcount_loc
[  366.504814][ T7612] #011__param
[  366.504820][ T7612] #011.retpoline_sites
[  366.504826][ T7612] #011.return_sites
[  366.504832][ T7612] #011.call_sites
[  366.50[  366.515817][ T7612] spin_lock_irq-torture: Creating torture_shuffle task
[  366.516804][ T7612] spin_lock_irq-torture: Creating torture_stutter task
[  366.516815][ T7616] spin_lock_irq-torture: torture_shuffle task started
[  366.517712][ T7612] spi[  366.537251][ T7655] spin_lock_irq-torture: lock_torture_writer task started
[  366.539162][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.539164][ T7658] spin_lock_irq-torture: lock_torture_writer task started
[  366.539200][[  366.560682][ T7679] spin_lock_irq-torture: lock_torture_writer task started
[  366.563132][ T7680] spin_lock_irq-torture: lock_torture_writer task started
[  366.566482][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.566755][[  366.586235][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.587145][ T7701] spin_lock_irq-torture: lock_torture_writer task started
[  366.697351][ T7700] torture_spin_lock_write_delay: delay = 100 jiffies.
[  366.701664][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.701699][ T7708] spin_lock_irq-torture: lock_torture_writer task started
[  366.703050][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.703052][ T7710] spin_lock_irq-torture: lock_torture_writer task started
[  366.706296][ T7612] spin_lock_irq-torture: Creating lock_torture_writer task
[  366.706303][ T7716] spin_lock_irq-torture: lock_torture_writer task started
[  366.711283][ T7612] spin_lock_irq-torture: Creating lock_torture_stats task
[  366.711288][ T7717] spin_lock_irq-torture: lock_torture_writer task started
[  366.712163][ T7718] spin_lock_irq-torture: lock_torture_stats task started
[  368.471362][ T7710] torture_spin_lock_write_delay: delay = 4 jiffies.
[  368.803713][ T7701] torture_spin_lock_write_delay: delay = 0 jiffies.
[  369.027235][ T7665] torture_spin_lock_write_delay: delay = 0 jiffies.
[  369.280654][ T7620] torture_spin_lock_write_delay: delay = 0 jiffies.
[  369.706785][ T7658] torture_spin_lock_write_delay: delay = 0 jiffies.
[  369.950477][ T7674] torture_spin_lock_write_delay: delay = 5 jiffies.
[  372.451008][ T7700] torture_spin_lock_write_delay: delay = 37 jiffies.
[  372.576690][ T7710] torture_spin_lock_write_delay: delay = 0 jiffies.
[  372.679010][ T7652] torture_spin_lock_write_delay: delay = 0 jiffies.
[  373.295406][ T7659] torture_spin_lock_write_delay: delay = 86 jiffies.
[  373.850994][ T7659] torture_spin_lock_write_delay: delay = 0 jiffies.
[  374.659080][ T7655] torture_spin_lock_write_delay: delay = 0 jiffies.
[  377.214559][ T7655] torture_spin_lock_write_delay: delay = 0 jiffies.
[  377.675870][ T7716] torture_spin_lock_write_delay: delay = 0 jiffies.
[  377.990583][ T7669] torture_spin_lock_write_delay: delay = 0 jiffies.
[  378.335682][ T7679] torture_spin_lock_write_delay: delay = 0 jiffies.
[  379.872341][ T7716] torture_spin_lock_write_delay: delay = 0 jiffies.
[  381.414715][ T7649] torture_spin_lock_write_delay: delay = 89 jiffies.
[  384.669977][ T7631] torture_spin_lock_write_delay: delay = 0 jiffies.
[  386.204575][ T7659] torture_spin_lock_write_delay: delay = 0 jiffies.
[  386.374935][ T7700] torture_spin_lock_write_delay: delay = 0 jiffies.
[  389.112558][ T7716] torture_spin_lock_write_delay: delay = 0 jiffies.
[  394.226397][ T7619] torture_spin_lock_write_delay: delay = 0 jiffies.
[  394.486664][ T7674] torture_spin_lock_write_delay: delay = 0 jiffies.
[  395.263772][ T7717] torture_spin_lock_write_delay: delay = 0 jiffies.
[  395.492432][ T7716] torture_spin_lock_write_delay: delay = 0 jiffies.
[  396.067782][ T7708] torture_spin_lock_write_delay: delay = 0 jiffies.
[  397.095313][ T7689] torture_spin_lock_write_delay: delay = 0 jiffies.
[  397.909725][ T7644] torture_spin_lock_write_delay: delay = 53 jiffies.
[  398.020231][ T7655] torture_spin_lock_write_delay: delay = 0 jiffies.
[  400.298164][ T7694] torture_spin_lock_write_delay: delay = 0 jiffies.
[  401.112719][ T7644] torture_spin_lock_write_delay: delay = 99 jiffies.
[  402.528461][ T7716] torture_spin_lock_write_delay: delay = 99 jiffies.
[  403.807473][ T7665] torture_spin_lock_write_delay: delay = 0 jiffies.
[  405.445645][ T7680] torture_spin_lock_write_delay: delay = 0 jiffies.
[  406.011081][ T7689] torture_spin_lock_write_delay: delay = 0 jiffies.
[  406.950307][ T7638] torture_spin_lock_write_delay: delay = 0 jiffies.
[  408.352150][ T7658] torture_spin_lock_write_delay: delay = 0 jiffies.
[  409.305075][ T7620] torture_spin_lock_write_delay: delay = 0 jiffies.
[  410.067480][ T7620] torture_spin_lock_write_delay: delay = 0 jiffies.
[  411.379558][ T7619] torture_spin_lock_write_delay: delay = 0 jiffies.
[  411.812664][ T7673] torture_spin_lock_write_delay: delay = 0 jiffies.
[  412.016030][ T7679] torture_spin_lock_write_delay: delay = 0 jiffies.
[  412.451070][ T7643] torture_spin_lock_write_delay: delay = 0 jiffies.
[  412.650624][ T7631] torture_spin_lock_write_delay: delay = 0 jiffies.
[  413.055534][ T7664] torture_spin_lock_write_delay: delay = 0 jiffies.
[  415.804726][ T7619] torture_spin_lock_write_delay: delay = 84 jiffies.
[  419.302460][ T7649] torture_spin_lock_write_delay: delay = 0 jiffies.
[  420.327661][ T7649] torture_spin_lock_write_delay: delay = 0 jiffies.
[  421.015153][ T7659] torture_spin_lock_write_delay: delay = 0 jiffies.
[  421.485036][ T7619] torture_spin_lock_write_delay: delay = 0 jiffies.
[  423.827172][ T7665] torture_spin_lock_write_delay: delay = 0 jiffies.
[  426.718848][ T7664] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718848][ T7643] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718848][ T7716] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718848][ T7679] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718848][ T7673] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718849][ T7649] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718849][ T7658] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718848][ T7655] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718850][ T7717] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718851][ T7644] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718852][ T7680] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718852][ T7682] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718853][ T7681] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718853][ T7689] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718853][ T7631] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718855][ T7694] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718856][ T7619] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718856][ T7637] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718856][ T7669] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718858][ T7665] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718860][ T7674] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718860][ T7632] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718860][ T7710] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718861][ T7638] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718861][ T7695] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718861][ T7620] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718864][ T7700] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718867][ T7701] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718868][ T7622] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718869][ T7659] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718872][ T7652] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718873][ T7708] spin_lock_irq-torture: lock_torture_writer is stopping
[  426.718899][ T7975] spin_lock_irq-torture: Stopping torture_shuffle task
[  426.720215][ T7616] spin_lock_irq-torture: torture_shuffle is stopping
[  426.722208][ T7617] spin_lock_irq-torture: torture_stutter is stopping
[  426.723175][ T7975] spin_lock_irq-torture: Stopping torture_stutter task
[  426.745849][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.746512][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.747184][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.747907][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.748588][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.749252][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.749974][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.750625][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.751293][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.751932][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.752570][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.753193][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.753851][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.754469][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.755066][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.755804][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.756392][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.756983][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.757598][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.758178][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.758814][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.759391][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.760060][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.760673][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.761260][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.761833][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.762393][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.762947][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.763520][ T7975] spin_lock_irq-torture: Stopping lock_torture_writer task
[  426.764090][ T7975] spin_lock_irq-torture: Stopping loc[  426.778422][ T7975] locktorture unusing torture
[  426.817495][ T8049] finit_module: fd=3, uargs=000000008a9f0954, flags=0
[  426.818281][ T8049] ==>mod_verify_sig(,305525)
[  426.819730][ T8049] Core section allocation order for locktorture:
[  426.820456][ T8049] #011.text
[  426.821166][ T8049] #011.rodata
[  426.821914][ T8049] #011__mcount_loc
[  426.822642][ T8049] #011__param
[  426.823347][ T8049] #011.retpoline_sites
[  426.824038][ T8049] #011.return_sites
[  426.824764][ T8049] #011.call_sites
[  426.825466][ T8049] #011.orc_unwind
[  426.826094][ T8049] #011.orc_unwind_ip
[  426.826765][ T8049] #011.note.gnu.build-id
[  426.827417][ T8049] #011.note.Linux
[  426.828045][ T8049] #011.orc_header
[  426.828721][ T8049] #011.static_call_sites
[  426.829367][ T8049] #011__[  426.841214][ T8049] #0110xffffffffc35df050 0x00000248 __patchable_function_entries
[  426.841862][ T8049] #0110xffffffffc3874000 0x00003a61 .text
[  426.842545][ T8049] #0110xffffffffc0567000 0x00000919 .init.text
[  426.843191][ T8049] #0110xffffffffc35df2a0 0x[  426.862752][ T8053] rw_lock-torture: torture_shuffle task started
[  426.863521][ T8049] rw_lock-torture: Creating lock_torture_writer task
[  426.863522][ T8055] rw_lock-torture: torture_stutter task started
[  426.865791][ T8049] rw_lock-torture: C[  426.884511][ T8093] rw_lock-torture: lock_torture_writer task started
[  426.887030][ T8049] rw_lock-torture: Creating lock_torture_writer task
[  426.887032][ T8098] rw_lock-torture: lock_torture_reader task started
[  426.889320][ T8049] rw_lock-to[  426.908050][ T8049] rw_lock-torture: Creating lock_torture_reader task
[  426.908052][ T8125] rw_lock-torture: lock_torture_writer task started
[  426.912100][ T8126] rw_lock-torture: lock_torture_reader task started
[  426.912106][ T8049] rw_lock-to[  426.932055][ T8049] rw_lock-torture: Creating lock_torture_writer task
[  426.933207][ T8049] rw_lock-torture: Creating lock_torture_reader task
[  426.933218][ T8148] rw_lock-torture: lock_torture_writer task started
[  426.934110][ T8049] rw_lock-t
[  486.952236][ T8358] rw_lock-torture: Stopping torture_shuffle task
[  486.953315][ T8053] rw_lock-torture: torture_shuffle is stopping
[  486.954311][ T8055] rw_lock-torture: torture_stutter is stopping
[  486.954536][ T8358] rw_lock-torture: Stopping torture_stutter task
[  486.955144][ T8131] rw_lock-torture: lock_torture_writer is stopping
[  486.955147][ T8065] rw_lock-torture: lock_torture_writer is stopping
[  486.955148][ T8093] rw_lock-torture: lock_torture_writer is stopping
[  486.955153][ T8101] rw_lock-torture: lock_torture_writer is stopping
[  486.955157][ T8083] rw_lock-torture: lock_torture_writer is stopping
[  486.955169][ T8117] rw_lock-torture: lock_torture_writer is stopping
[  486.955174][ T8122] rw_lock-torture: lock_torture_reader is stopping
[  486.955184][ T8116] rw_lock-torture: lock_torture_reader is stopping
[  486.955188][ T8085] rw_lock-torture: lock_torture_reader is stopping
[  486.955190][ T8110] rw_lock-torture: lock_torture_reader is stopping
[  486.955214][ T8141] rw_lock-torture: lock_torture_writer is stopping
[  486.955217][ T8072] rw_lock-torture: lock_torture_reader is stopping
[  486.955218][ T8071] rw_lock-torture: lock_torture_writer is stopping
[  486.955226][ T8125] rw_lock-torture: lock_torture_writer is stopping
[  486.955229][ T8077] rw_lock-torture: lock_torture_writer is stopping
[  486.955229][ T8134] rw_lock-torture: lock_torture_reader is stopping
[  486.955231][ T8126] rw_lock-torture: lock_torture_reader is stopping
[  486.955231][ T8137] rw_lock-torture: lock_torture_writer is stopping
[  486.955231][ T8098] rw_lock-torture: lock_torture_reader is stopping
[  486.955232][ T8152] rw_lock-torture: lock_torture_reader is stopping
[  486.955236][ T8107] rw_lock-torture: lock_torture_writer is stopping
[  486.955239][ T8148] rw_lock-torture: lock_torture_writer is stopping
[  486.955240][ T8060] rw_lock-torture: lock_torture_reader is stopping
[  486.955249][ T8146] rw_lock-torture: lock_torture_reader is stopping
[  486.955265][ T8078] rw_lock-torture: lock_torture_reader is stopping
[  486.955270][ T8112] rw_lock-torture: lock_torture_writer is stopping
[  486.955273][ T8059] rw_lock-torture: lock_torture_writer is stopping
[  486.955325][ T8140] rw_lock-torture: lock_torture_reader is stopping
[  486.955485][ T8103] rw_lock-torture: lock_torture_reader is stopping
[  486.955493][ T8086] rw_lock-torture: lock_torture_writer is stopping
[  486.955515][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.955536][ T8066] rw_lock-torture: lock_torture_reader is stopping
[  486.955537][ T8092] rw_lock-torture: lock_torture_reader is stopping
[  486.982917][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.983723][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.984518][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.985334][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.986077][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.986949][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.987775][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.988559][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.989292][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.990050][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.990861][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.991654][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.992385][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.993200][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.994040][ T8358] rw_lock-torture: Stopping lock_torture_writer task
[  486.994877][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.995654][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.996368][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.997113][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.997917][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.998685][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  486.999409][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.000138][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.000940][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.001692][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.002394][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.003090][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.003839][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.004494][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.005145][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.005843][ T8358] rw_lock-torture: Stopping lock_torture_reader task
[  487.006488][ T8358] rw_lock-torture: Stopping lock_torture_stats task
[  487.007149][ T8155] Writes:  Total: 10289598  Max/Min: 658463/627673   Fail: 0 
[  487.007956][ T8155] Reads :  Total: 2907575  Max/Min: 202830/158543   Fail: 0 
[  487.008734][ T8155] rw_lock-t[  487.026418][ T8358] locktorture unusing torture
[  487.061441][ T8439] finit_module: fd=3, uargs=00000000f0297ff5, flags=0
[  487.062495][ T8439] ==>mod_verify_sig(,305525)
[  487.064102][ T8439] Core section allocation order for locktorture:
[  487.065005][ T8439] #011.text
[  487.065914][ T8439] #011.rodata
[  487.066711][ T8439] #011__mcount_loc
[  487.067405][ T8439] #011__param
[  487.068064][ T8439] #011.retpoline_sites
[  487.068793][ T8439] #011.return_sites
[  487.069485][ T8439] #011.call_sites
[  487.070140][ T8439] #011.orc_unwind
[  487.070878][ T8439] #011.orc_unwind_ip
[  487.071575][ T8439] #011.note.gnu.build-id
[  487.072250][ T8439] #011.note.Linux
[  487.072931][ T8439] #011.orc_header
[  487.073656][ T8439] #011.static_call_sites
[  487.074352][ T8439] #011__[  487.079101][ T8439] #011.gnu.linkonce.this_module
[  487.079814][ T8439] Init section allocation order for locktorture:
[  487.080501][ T8439] #011.init.text
[  487.081143][ T8439] #011.init_array
[  487.081860][ T8439] #011.init.data
[  487.082551][ T8439] #011.[  487.101546][ T8439] #0110xffffffffc35f2ea8 0x00001ec1 .strtab
[  487.102207][ T8439] Absolute symbol: 0x00000000 locktorture.c
[  487.102851][ T8439] Absolute symbol: 0x00000000 locktorture.mod.c
[  487.103634][ T8439] Absolute symbol: 0x00000000 module[  487.122369][ T8468] rw_lock_irq-torture: lock_torture_reader task started
[  487.124932][ T8439] rw_lock_irq-torture: Creating lock_torture_reader task
[  487.124934][ T8473] rw_lock_irq-torture: lock_torture_writer task started
[  487.125789][ T8474[  487.146188][ T8439] rw_lock_irq-torture: Creating lock_torture_reader task
[  487.146277][ T8509] rw_lock_irq-torture: lock_torture_writer task started
[  487.147464][ T8439] rw_lock_irq-torture: Creating lock_torture_writer task
[  487.147467][ T851[  487.168859][ T8536] rw_lock_irq-torture: lock_torture_reader task started
[  487.168859][ T8439] rw_lock_irq-torture: Creating lock_torture_writer task
[  487.168912][ T8439] rw_lock_irq-torture: Creating lock_torture_reader task
[  487.168916][ T853
[  547.184696][ T8747] rw_lock_irq-torture: Stopping torture_shuffle task
[  547.185734][ T8441] rw_lock_irq-torture: torture_shuffle is stopping
[  547.186239][ T8446] rw_lock_irq-torture: torture_stutter is stopping
[  547.186952][ T8747] rw_lock_irq-torture: Stopping torture_stutter task
[  547.187238][ T8527] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187238][ T8461] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187239][ T8500] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187239][ T8536] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187286][ T8467] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187291][ T8478] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187296][ T8455] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187299][ T8515] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187299][ T8501] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187308][ T8542] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187314][ T8473] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187330][ T8537] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187335][ T8521] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187335][ T8462] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187337][ T8449] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187338][ T8506] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187340][ T8495] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187340][ T8484] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187347][ T8456] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187347][ T8524] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187367][ T8450] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187367][ T8480] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187387][ T8509] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187390][ T8533] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187396][ T8530] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187856][ T8512] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187859][ T8474] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187877][ T8476] rw_lock_irq-torture: lock_torture_writer is stopping
[  547.187908][ T8482] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187911][ T8493] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187929][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.187973][ T8468] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187973][ T8516] rw_lock_irq-torture: lock_torture_reader is stopping
[  547.187978][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.187989][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.188005][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.188014][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.188023][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.220135][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.221030][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.221956][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.222745][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.223602][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.224358][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.225178][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.226109][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.226955][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.227749][ T8747] rw_lock_irq-torture: Stopping lock_torture_writer task
[  547.228485][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.229256][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.229962][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.230736][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.231463][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.232193][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.233020][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.233885][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.234644][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.235345][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.236047][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.236809][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.237486][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.238108][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.238820][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.239460][ T8747] rw_lock_irq-torture: Stopping lock_torture_reader task
[  547.240106][ T8747] rw[  547.255702][ T8747] locktorture unusing torture
[  547.289130][ T8826] finit_module: fd=3, uargs=00000000444a7b0e, flags=0
[  547.290133][ T8826] ==>mod_verify_sig(,305525)
[  547.291735][ T8826] Core section allocation order for locktorture:
[  547.292563][ T8826] #011.text
[  547.293388][ T8826] #011.rodata
[  547.294183][ T8826] #011__mcount_loc
[  547.294927][ T8826] #011__param
[  547.295625][ T8826] #011.retpoline_sites
[  547.296280][ T8826] #011.return_sites
[  547.296925][ T8826] #011.call_sites
[  547.297617][ T8826] #011.orc_unwind
[  547.298282][ T8826] #011.orc_unwind_ip
[  547.298932][ T8826] #011.note.gnu.build-id
[  547.299629][ T8826] #011.note.Linux
[  547.300298][ T8826] #011.orc_header
[  547.300948][ T8826] #011.static_call_sites
[  547.301645][ T8826] #011__[  547.313861][ T8826] #0110xffffffffc35df050 0x00000248 __patchable_function_entries
[  547.314546][ T8826] #0110xffffffffc3874000 0x00003a61 .text
[  547.315191][ T8826] #0110xffffffffc0567000 0x00000919 .init.text
[  547.315913][ T8826] #0110xffffffffc35df2a0 0x[  547.336195][ T8826] mutex_lock-torture: Creating torture_shuffle task
[  547.337096][ T8826] mutex_lock-torture: Creating torture_stutter task
[  547.337102][ T8827] mutex_lock-torture: torture_shuffle task started
[  547.337954][ T8826] mutex_lock-t[  547.356929][ T8867] mutex_lock-torture: lock_torture_writer task started
[  547.360826][ T8826] mutex_lock-torture: Creating lock_torture_writer task
[  547.360829][ T8872] mutex_lock-torture: lock_torture_writer task started
[  547.362265][ T8826] m[  547.380841][ T8826] mutex_lock-torture: Creating lock_torture_writer task
[  547.380847][ T8899] mutex_lock-torture: lock_torture_writer task started
[  547.381782][ T8826] mutex_lock-torture: Creating lock_torture_writer task
[  547.381820][ T8900] [  547.411864][ T8826] mutex_lock-torture: Creating lock_torture_writer task
[  547.411868][ T8917] mutex_lock-torture: lock_torture_writer task started
[  547.413081][ T8826] mutex_lock-torture: Creating lock_torture_writer task
[  547.413094][ T8918] [  547.426237][ T8826] mutex_lock-torture: Creating lock_torture_stats task
[  547.426241][ T8927] mutex_lock-torture: lock_torture_writer task started
[  547.427443][ T8930] mutex_lock-torture: lock_torture_stats task started
[  607.432663][ T8872] mutex_lock-torture: lock_torture_writer is stopping
[  607.432665][ T8918] mutex_lock-torture: lock_torture_writer is stopping
[  607.432665][ T8878] mutex_lock-torture: lock_torture_writer is stopping
[  607.432665][ T8917] mutex_lock-torture: lock_torture_writer is stopping
[  607.432665][ T8912] mutex_lock-torture: lock_torture_writer is stopping
[  607.432666][ T8896] mutex_lock-torture: lock_torture_writer is stopping
[  607.432667][ T8836] mutex_lock-torture: lock_torture_writer is stopping
[  607.432667][ T8899] mutex_lock-torture: lock_torture_writer is stopping
[  607.432667][ T8855] mutex_lock-torture: lock_torture_writer is stopping
[  607.432669][ T8866] mutex_lock-torture: lock_torture_writer is stopping
[  607.432669][ T8905] mutex_lock-torture: lock_torture_writer is stopping
[  607.432669][ T8887] mutex_lock-torture: lock_torture_writer is stopping
[  607.432670][ T8854] mutex_lock-torture: lock_torture_writer is stopping
[  607.432670][ T8860] mutex_lock-torture: lock_torture_writer is stopping
[  607.432672][ T8875] mutex_lock-torture: lock_torture_writer is stopping
[  607.432674][ T8888] mutex_lock-torture: lock_torture_writer is stopping
[  607.432674][ T8927] mutex_lock-torture: lock_torture_writer is stopping
[  607.432675][ T8867] mutex_lock-torture: lock_torture_writer is stopping
[  607.432677][ T8906] mutex_lock-torture: lock_torture_writer is stopping
[  607.432679][ T8926] mutex_lock-torture: lock_torture_writer is stopping
[  607.432680][ T8911] mutex_lock-torture: lock_torture_writer is stopping
[  607.432680][ T8900] mutex_lock-torture: lock_torture_writer is stopping
[  607.432681][ T8849] mutex_lock-torture: lock_torture_writer is stopping
[  607.432681][ T8861] mutex_lock-torture: lock_torture_writer is stopping
[  607.432682][ T8845] mutex_lock-torture: lock_torture_writer is stopping
[  607.432683][ T8848] mutex_lock-torture: lock_torture_writer is stopping
[  607.432684][ T8893] mutex_lock-torture: lock_torture_writer is stopping
[  607.432684][ T8842] mutex_lock-torture: lock_torture_writer is stopping
[  607.432685][ T8882] mutex_lock-torture: lock_torture_writer is stopping
[  607.432686][ T8923] mutex_lock-torture: lock_torture_writer is stopping
[  607.432687][ T8881] mutex_lock-torture: lock_torture_writer is stopping
[  607.432687][ T8837] mutex_lock-torture: lock_torture_writer is stopping
[  607.432725][ T9141] mutex_lock-torture: Stopping torture_shuffle task
[  607.432789][ T8827] mutex_lock-torture: torture_shuffle is stopping
[  607.434364][ T8833] mutex_lock-torture: torture_stutter is stopping
[  607.435191][ T9141] mutex_lock-torture: Stopping torture_stutter task
[  607.462817][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.463608][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.464427][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.465322][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.466167][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.467019][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.467835][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.468614][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.469329][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.470071][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.470875][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.471636][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.472342][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.473149][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.473931][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.474707][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.475415][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.476129][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.476921][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.477664][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.478351][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.479079][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.479859][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.480597][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.481278][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.482060][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.482814][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.483488][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.484136][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.484911][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.485573][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.486218][ T9141] mutex_lock-torture: Stopping lock_torture_writer task
[  607.486826][ T9141] mutex_lock-torture: Stopping lock_torture_stats task
[  607.487442][ T8930] Writes:  Total: 153794920  Max/Min: 5156119/4445864   Fail: 0 
[  607.4881[  607.508712][ T9141] locktorture unusing torture
[  607.545043][ T9216] finit_module: fd=3, uargs=00000000241c3913, flags=0
[  607.546065][ T9216] ==>mod_verify_sig(,305525)
[  607.547719][ T9216] Core section allocation order for locktorture:
[  607.548557][ T9216] #011.text
[  607.549382][ T9216] #011.rodata
[  607.550176][ T9216] #011__mcount_loc
[  607.550942][ T9216] #011__param
[  607.551630][ T9216] #011.retpoline_sites
[  607.552300][ T9216] #011.return_sites
[  607.552945][ T9216] #011.call_sites
[  607.553626][ T9216] #011.orc_unwind
[  607.554270][ T9216] #011.orc_unwind_ip
[  607.554903][ T9216] #011.note.gnu.build-id
[  607.555576][ T9216] #011.note.Linux
[  607.556219][ T9216] #011.orc_header
[  607.556850][ T9216] #011.static_call_sites
[  607.557509][ T9216] #011__[  607.568974][ T9216] #0110xffffffffc35df000 0x00000050 __bug_table
[  607.569641][ T9216] #0110xffffffffc35df050 0x00000248 __patchable_function_entries
[  607.570269][ T9216] #0110xffffffffc3874000 0x00003a61 .text
[  607.570887][ T9216] #0110xffffffffc0567000 0[  607.590886][ T9216] rwsem_lock-torture: Creating torture_shuffle task
[  607.591728][ T9216] rwsem_lock-torture: Creating torture_stutter task
[  607.591734][ T9220] rwsem_lock-torture: torture_shuffle task started
[  607.592555][ T9216] rwsem_lock-t[  607.611671][ T9258] rwsem_lock-torture: lock_torture_reader task started
[  607.614109][ T9216] rwsem_lock-torture: Creating lock_torture_reader task
[  607.614121][ T9262] rwsem_lock-torture: lock_torture_writer task started
[  607.615017][ T9216] r[  607.625668][ T9293] rwsem_lock-torture: lock_torture_writer task started
[  607.625712][ T9216] rwsem_lock-torture: Creating lock_torture_writer task
[  607.625715][ T9296] rwsem_lock-torture: lock_torture_reader task started


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261014/202610140326.7af39394-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



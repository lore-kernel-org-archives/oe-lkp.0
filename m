Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C260466B5F
	for <oe-lkp@lists.linux.dev>; Tue, 28 Apr 2026 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382419; cv=fail; b=LKw5VJ8XaMnAWaSEs/2gf5UDhsybS+vh8Psk6nXxUS22GFno1fBBVwwVsw657Okbq8lHEC2lr196qSZcaXboYG69YbyO7vXT7Tf0jDvkuvrW4Snwm9PnWCsx9mjxAaJxN4DarmyxhkLAIghPPcNPbURle/6LadCYH4fzSJow/Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382419; c=relaxed/simple;
	bh=OQw+3ktsFei2BaRHC5MAuJr3MJrb3xy0QNy656zrcJo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=q3z3zfieYV3wDy3HFLKUGV5M6UhpJoBhi6qAzNlvo9i1eDIgCKswi7K04PiwMHU3oamf31lEIa73BtYhZDFPv8dZK++9Il8ZMwdlNJfoiRNxb++vsxypTMavgL0dCuxNjb3qrV9aregkHKP9zoOTtDtEEfWRMdPZ8JsJKSRraQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRVX2v3z; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRVX2v3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777382417; x=1808918417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQw+3ktsFei2BaRHC5MAuJr3MJrb3xy0QNy656zrcJo=;
  b=gRVX2v3zUYgi9bxViBEQTie7RH4zKQhFppRBx55jPQsLMNiKYl77OSjT
   +ZZKaDH7q1imPXfSPGTZF6f2LvDaAc5BUUhnyPto0sQ5WB08HkOFw1/KZ
   Dj1SO4V59/AN5isUXyIswKkMbuiOBlAF6B06XqMdRI15vcxtolnOm7DvW
   Pd+SU6Wxf6lzL2QoGkXXmMowdCqBOudOx/eook2looS8PSOEHf2IuY5aX
   y/sNRv7gdvK3ppdWLpUpNfG8f4SUpmQRujxl+frosJRK5K5ybOFTGyaut
   A7tqtsHN8LmmxQ+bjXOkgHbgRhwFGRnKbD54Th16aE+fH9V8Yo8jCMhsw
   w==;
X-CSE-ConnectionGUID: yPJIDhFRS0GUr9lulX0wbg==
X-CSE-MsgGUID: uPptmqJPQw2q8vLd6U3KQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103747192"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="103747192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 06:20:17 -0700
X-CSE-ConnectionGUID: k9JCiacQQFicbCgZtdQW/A==
X-CSE-MsgGUID: 5LJOybpjSaCfpA072A2ucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="257273155"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 06:20:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 06:20:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 06:20:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 06:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kl+8wnevY6MZ6So47XRlwQvxxQbb0duQl2MlyHxxIB0A3Ks939WAWtr8/YUQfMOfzJS1cHef7WhuMXkmCJEWnOxokeHIGa8AXacolG+ICdqIQyo+69EO4jFB3sAdFRIBQJCY1Nn/O1lxlrz7CWTtj+tMoaY7nFItzd4EQ531C4wXn0UK5kHWvI/wbUW8nE2/VA9pLPX8wbG6EQ4KvlXqjPBi6350PXBczdVCCizBkFfsCpq0v3NS7O4N/DjX8NHuVYll6zCRDtrDltmT6S4QtotoZQFRrL5yNvomWVt6nXeRz5QGlGYFro3PiboKgEr8McXCT3nlbqUf4mr/jyIi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDFipYc2/ocrid1dBEhbKndZRTkqxG5F3s+vgM6Qjfo=;
 b=FX+3JYnz2sJAL6iRYMw95QrIlaVDDQDlAWE56xtKP2fGtk3T+L1pQghC7TVsO+2PqohOJBj8Hn9eCTUCn65/HGrr4bwfrSeZLPdMr+yL/X7d37uXp1Zc2KUcXqYG1t8TykO7u01W0Ytb1ThRLxltxiMBs3KfjpYRUd8cue2RQRl6GKA96AeuKgBqLcKkH35ubtn4FVgZ1gfANbkTcqVospQ1UTIvpMGuPGdS2zeuQSe4NNAkxRV0Tyu01CuL5IZ4a19rs1Y9U+DkpvpM1q0mnHOuyyRZWG3PsajLZk4ZQZUBP/3Hkmz9+A4u4m8flFhR9h9SAZ0hOvfHNnTLgnY7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM3PR11MB8715.namprd11.prod.outlook.com (2603:10b6:0:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.18; Tue, 28 Apr 2026 13:20:13 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 13:20:13 +0000
Date: Tue, 28 Apr 2026 21:20:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:jump-batch] [drm]  a3facbf7db:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202604282018.c2caa8e7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM3PR11MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: e8709d8f-4af3-4794-0913-08dea528e19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: XkwRekrcKO4ldlJ8EH/yW+7pY61TbNzNPgxzzo9k0NX9sCN0JBMup84NBpcnMxCoBs86Py91DULq/NO1oXfkvEorNifd1HHgWdr83Z0BDjeT5hPZT1KcvSs3qrwsLPISzsUr1FmCdVMaVWqgscm1ya7NN3Q4Np5RdCuGoX7sWv8Tjss7vS0PGMnqOvfyMmP4QXKzFvAmWY/Z2b1UTjHBmPZYBK2HjMw6YqHpH1gH4u5V8k47NWICE/JABYMPcSc/K3UqVoQISF4ulAEU9eE1PCEXV5T2kd4F0vruofkHe30zbbLyxeceJ8cGFRbn6+8tfmF3P1fM/ajpPoChouPp7/iDf3G/sT2R1zHQrDUmyatMykwTmJ+Ncnvw1clIyZhVsqST7zu9ChDpqZAWxO8wsg8ti5fHR9qrPiVtEWOc6V1ELp0P4JhDhyfkObpS/MnkcjLdx7e8pYvvc6iZQiL3zxXbHqU/2rrkQ2Fxdd1/D3hIefol722auOrYv3IDOTPVizbtC947dDnn0lxC+Y4Vxa2bUEyTCKqQUQxpydvtXOx+3cOSuwFtt/OxrPU1X3WCa+JYidBfYMAbR5FReAJQQqz63VUBnZSJ0WWhJ7od+OBUspPDK7Epb3FsJzJPJHyE4D3NeKDjUpd2eOvWEeJnU76ZUsKO+rgULNJemEfPeLC5+I26irYdEwnq6+qwCOTS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZ1CfHF+y6C97dcnGDD5pKUXDTJaq5+IzsWHx07OqiRv2PzMgG53agA7cHfj?=
 =?us-ascii?Q?HTtRob7J2weqSC6iuKqrY9WZjX6kqDmw7DWHd4cSVNttqhOi0wCSkAIjiYYh?=
 =?us-ascii?Q?y9DR10u6ZCFLKCHbCt4z/INBLkTiJHwnVLVSv1mwXOnn3zoPKwC9v1anwlzT?=
 =?us-ascii?Q?PIggeRwTt46c9002lwSZoppRhPXGrrLJx/+Elw8sYAlhKSd3+exK4ZgK1S1J?=
 =?us-ascii?Q?c659GJjOL4BE2DSoW6QBm6w3EB/mj5BrGZjnoazv9x8f4SvxmROOen2R4iTF?=
 =?us-ascii?Q?OmxQEoynZNVzmsYugDqd4Be9tg90//XczTcg3tsQGDHh24HMnRSNdDh5aZfk?=
 =?us-ascii?Q?TYGBv0zjfahDaGAMKNBP9oad9uNDQcTmzb/urKe3aU0OMASM1MvN9PDI0dEX?=
 =?us-ascii?Q?fU4j1J3KLuBTlR9A8W7yGp2Eq7qes0150WJ3a2JEsmLGQugeqazXldI/ZJhg?=
 =?us-ascii?Q?oc7XaMqPzXopnSdue8DT2Nq66xlKFc1Vmb9TIqeHnzydSJr4cN3YHdx9btFd?=
 =?us-ascii?Q?/jsFm1Xoyz2T9R6IcFeHkArLomgZohBFa0ATFonVc3dgyyC/a82dUW3Vzw4+?=
 =?us-ascii?Q?QQmf9/hq9bTQT2+gNBRcEmpMFmKEoAoD2y7Iqa9R++Yj8una0jLPxF8MVEyA?=
 =?us-ascii?Q?TYMvzt+x03VWo47TIsyPGYampFjzkFuibjjLkqDYnuqn4XUntxEmCewBdwrN?=
 =?us-ascii?Q?JUp+eKqgJkrz0M8yzU6r0h56r6vz6qUT8RVyNlk/yvyyFbFylpcS+XqxKTj6?=
 =?us-ascii?Q?qFU9fgqxqMsMvKHE2TOHt93/1lupnTwKOkY49LMkpKcaPy3enVWvmfdgc75o?=
 =?us-ascii?Q?DdUrzJhTp4mViEb9aZ5h+ddRa57Hb3pAwV0ol4hSbmxsQsHrnb7NB0uWsTn1?=
 =?us-ascii?Q?GapOJp+F7w/QIDdEkXBHJnA5BWYA+t/c1nMtjvEr3fU0TK9jSR7wIBRs4T30?=
 =?us-ascii?Q?z6g3Dg9T6n9A96znflBdB4a+UmCeQmjfHPrBxaHAL1uTZ7xvECkyMLFTzATx?=
 =?us-ascii?Q?TmVOoLji5jYe6W+obBFeStU3omjGX0VzuVaWf8f2Hem+xk8j4tCISbduAr5c?=
 =?us-ascii?Q?0D4NTrM23THC5XwqzQlDHMyb1qZrUt+HRfhwJtanTI64YmkCH1KCYXw9QnKX?=
 =?us-ascii?Q?JhwVksltTPD77NbsyKX7znHiMhRn5J93nNEJAxHNDagFnkyP8kLtnoJHm0MQ?=
 =?us-ascii?Q?mC1bv2BSb+E1Bm6qmC18SNeVUwxv0Qibjor2opxw8lGvw4qvTTj37fUBpqS+?=
 =?us-ascii?Q?jDJKQ08LPSlyLdzB5ifiejeRi0Ipn02lWBP2DTaNYUc8dLT4jqC6gdk2IBvM?=
 =?us-ascii?Q?Dz2e5UnyIi9Vpr6HHfQRoIEGauPSidpsKbRip0T+neu/7ZQ0zCNHPnew0se/?=
 =?us-ascii?Q?Xa105HZzJlP3jeP3NVGkWToOCfnqRFicPtfeRh9oixiHxVaaqMqWnu9iRpdk?=
 =?us-ascii?Q?aOlpFKm03jCLY6s1lkudTMUcNGlJFiVytE1SfsYSKR6JLGB0Nn2kKTObHEi3?=
 =?us-ascii?Q?FjNkxGVPsBOhRpybaPnPaWgYhROR/EwcHItboWL5m48gGI6y8+Mgd64CX1cv?=
 =?us-ascii?Q?phTH4VLwIEjrrrrD8F/gZf9nniMu15XudFYzRlQo3RzTelNvf6JiUlfY9MYh?=
 =?us-ascii?Q?JT2jYjWtNliirIf37lufH6OQXzdsACyHjGY02WZLPBBp50/oE2FExBfWrVJb?=
 =?us-ascii?Q?vbHPDdK8/rMpdbqT3wwQ1W0dbmL4yXw/j41nLIFEjVHygGA7DjXS6Hkk+6bF?=
 =?us-ascii?Q?k5ChYVGJSA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Z+TFzyW7vruFYLOAn8epwBe8LUdP3FrolqjD31mpdZdNIAfX1YX/8/5KL14+U1c7Xkh82gij9wUnqC1gQwc4nTZ1XJy5cLOoe40rziBEMK6cV4ta/AFgBGFNR8Qyb2p+NLX0PaKazGQxPoXI0iw5s9Wu3OSc3yRTkypSXoiLRqUtXvfZt82c0F+iFi0GLQgb17T2C9eD5CZHlOAHWuIXFC30wrhtLcKwSgeezIN9UnfaUk0FH3A7nqWmc+KRHvNgumLPOkp7tkf6dPcprO7KdHST84iOO2ja38d1xk8keKAT8yT0ovD+TNspu3gBhnYMeQWCHat/pxyWWPF26aqOHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8709d8f-4af3-4794-0913-08dea528e19b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:20:13.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5ZD6zKxU2c/RmkKDlLtVPJNUz1vrkOFltsJ879P54AzolHj++jgsWI/fvM5BYJvrE/5ZNyNAYS8m0D0PKsiuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8715
X-OriginatorOrg: intel.com



Hello,


this report is just FYI.

the randconfig we used in this test has the expected difference.

==================== PARENT FIRST_BAD KCONFIGS bc7cb75552bb5191e9ac9f20e310d9b1858bc4aa ====================
--- /pkg/linux/i386-randconfig-015-20260120/gcc-14/bc7cb75552bb5191e9ac9f20e310d9b1858bc4aa/.config     2026-04-25 03:39:53.302787330 +0800
+++ /pkg/linux/i386-randconfig-015-20260120/gcc-14/a3facbf7db65b559049a9e91ad6fc70a62e99311/.config     2026-04-25 04:18:41.893668590 +0800
@@ -4210,7 +4210,7 @@ CONFIG_DRM=y
 #
 # DRM debugging options
 #
-# CONFIG_DRM_USE_DYNAMIC_DEBUG is not set
+CONFIG_DRM_USE_DYNAMIC_DEBUG=y
 # CONFIG_DRM_WERROR is not set
 CONFIG_DRM_DEBUG_MM=y
 CONFIG_DRM_KUNIT_TEST_HELPERS=m

after CONFIG_DRM_USE_DYNAMIC_DEBUG enabled, we noticed crash mentioned in below
report.


kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: a3facbf7db65b559049a9e91ad6fc70a62e99311 ("drm-dyndbg: set CONFIG_DRM_USE_DYNAMIC_DEBUG=y")
https://github.com/jimc/linux.git jump-batch

in testcase: boot

config: i386-randconfig-015-20260120
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604282018.c2caa8e7-lkp@intel.com



[    0.362826][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    0.363389][    T1] #PF: supervisor read access in kernel mode
[    0.363855][    T1] #PF: error_code(0x0000) - not-present page
[    0.364322][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
[    0.364864][    T1] Oops: Oops: 0000 [#1] SMP
[    0.365217][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.0.0-rc5-00065-ga3facbf7db65 #1 PREEMPT(lazy)  d5dc0e24f12a8efb7de0b5a998078c56d56aaad7
[    0.365732][    T1] Tainted: [T]=RANDSTRUCT
[    0.365732][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.365732][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
[    0.365732][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d 31 d2 31 c9 c3 8d 76 00 2e 8d b4 26 00 00 00 00 8d 74 26 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
All code
========
   0:	84 c0                	test   %al,%al
   2:	75 f7                	jne    0xfffffffffffffffb
   4:	31 c0                	xor    %eax,%eax
   6:	aa                   	stos   %al,%es:(%rdi)
   7:	89 d8                	mov    %ebx,%eax
   9:	5b                   	pop    %rbx
   a:	5e                   	pop    %rsi
   b:	5f                   	pop    %rdi
   c:	5d                   	pop    %rbp
   d:	31 d2                	xor    %edx,%edx
   f:	31 c9                	xor    %ecx,%ecx
  11:	c3                   	ret
  12:	8d 76 00             	lea    0x0(%rsi),%esi
  15:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  1c:	00 
  1d:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	31 d2                	xor    %edx,%edx
  3f:	c3                   	ret

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	31 d2                	xor    %edx,%edx
  15:	c3                   	ret
[    0.365732][    T1] EAX: 00000000 EBX: 467dad14 ECX: 00000015 EDX: 45b9de29
[    0.365732][    T1] ESI: 00000000 EDI: 45b9de29 EBP: 4762de70 ESP: 4762de68
[    0.365732][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010293
[    0.365732][    T1] CR0: 80050033 CR2: 00000000 CR3: 06999000 CR4: 000406b0
[    0.365732][    T1] Call Trace:
[    0.365732][    T1]  ? ddebug_add_module (lib/dynamic_debug.c:1473 (discriminator 8))
[    0.365732][    T1]  ? __lock_release+0x43/0x140
[    0.365732][    T1]  ? blocking_notifier_chain_register (kernel/notifier.c:265 kernel/notifier.c:282)
[    0.365732][    T1]  ? up_write (kernel/locking/rwsem.c:1643)
[    0.365732][    T1]  ? blocking_notifier_chain_register (kernel/notifier.c:265 kernel/notifier.c:282)
[    0.365732][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1669)
[    0.365732][    T1]  ? dynamic_debug_init (lib/dynamic_debug.c:1716)
[    0.365732][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1669)
[    0.365732][    T1]  ? do_one_initcall (init/main.c:1382)
[    0.365732][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:389 fs/proc/proc_sysctl.c:1403)
[    0.365732][    T1]  ? __register_sysctl_init (fs/proc/proc_sysctl.c:1436 fs/proc/proc_sysctl.c:1465)
[    0.365732][    T1]  ? init_mm_internals (mm/vmstat.c:2295)
[    0.365732][    T1]  ? rest_init (init/main.c:760)
[    0.365732][    T1]  ? kernel_init_freeable (init/main.c:1488 (discriminator 1) init/main.c:1681 (discriminator 1))
[    0.365732][    T1]  ? kernel_init (init/main.c:1582)
[    0.365732][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:158)
[    0.365732][    T1]  ? rest_init (init/main.c:760)
[    0.365732][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_32.S:736)
[    0.365732][    T1]  ? entry_INT80_32 (arch/x86/entry/entry_32.S:940)
[    0.365732][    T1] Modules linked in:
[    0.365732][    T1] CR2: 0000000000000000
[    0.365732][    T1] ---[ end trace 0000000000000000 ]---
[    0.365732][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
[    0.365732][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d 31 d2 31 c9 c3 8d 76 00 2e 8d b4 26 00 00 00 00 8d 74 26 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
All code
========
   0:	84 c0                	test   %al,%al
   2:	75 f7                	jne    0xfffffffffffffffb
   4:	31 c0                	xor    %eax,%eax
   6:	aa                   	stos   %al,%es:(%rdi)
   7:	89 d8                	mov    %ebx,%eax
   9:	5b                   	pop    %rbx
   a:	5e                   	pop    %rsi
   b:	5f                   	pop    %rdi
   c:	5d                   	pop    %rbp
   d:	31 d2                	xor    %edx,%edx
   f:	31 c9                	xor    %ecx,%ecx
  11:	c3                   	ret
  12:	8d 76 00             	lea    0x0(%rsi),%esi
  15:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  1c:	00 
  1d:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	31 d2                	xor    %edx,%edx
  3f:	c3                   	ret

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	31 d2                	xor    %edx,%edx
  15:	c3                   	ret


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260428/202604282018.c2caa8e7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


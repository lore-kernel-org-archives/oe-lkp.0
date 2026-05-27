Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F83150997
	for <oe-lkp@lists.linux.dev>; Wed, 27 May 2026 05:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858219; cv=fail; b=gUmOh13m/aInMZYJSz5P2zxOpfsGBZmwKV3AQ1LP8CqUCdpb2RjgSaVnWAgxdsDAevzf2DWuPXrvhXADW8VgZKWJjvDAdPl0Roy/LLiSqIc1YnThYpJV21FJkvRoEBw1jQmzdgUgV5+aEh1f7RSQV2bN4NoGcdJVAqe60DPQK+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858219; c=relaxed/simple;
	bh=hYVOk3wAswENDMbOHMEePKli8395Kj2Ja41fUNwtMFw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JFDRbunPeukdpxJv/4Kj8Pe/i7NxyAQwuAkB5a1buqgBu8JFldLcmzXZnJ2S8v2SGOJcpwPIiL4fg9GgO6rRth6pHNtJ01k8GHH2hs4A8mh2c6msJZ3Yg8QsL0DdCl13sOXx2pBuMM1TsMxwBedeyoN/uuaM+ezks32YGZoY8e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hN95uyeF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hN95uyeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779858218; x=1811394218;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hYVOk3wAswENDMbOHMEePKli8395Kj2Ja41fUNwtMFw=;
  b=hN95uyeFa7YnDzIw+uZ5FCuydhhbpiLBN6g3VKjkbqHDxyV+BrN4kKZB
   GGIs4+Z8eCC+F2moCzUAzGm1t1p0YisRsQkuXQwrqxiiYAotqryyi0uRH
   02jnbUNO0Ut44x4ra52QUhMJtxKIkPOCKD3sMpLpKjgXjMogjgzS1/qjL
   r1qRaXnakS55JQoT46XTGva4u+vKt4FSi0j9wXaFdGUIsvEHHT1R++H7q
   N7CHTAi1iSp3qkP3jptkpju7OC2JLKXhlVVMiX/Hlgt4XYJqupJTkRgsU
   nMy9nmQi+GqDCL55zDfWXOvcJEmZazFcgGCUcF+1BWryMs0m+ZGkd32x0
   Q==;
X-CSE-ConnectionGUID: Rr7Z/8hjQvCVIOfn0gB49w==
X-CSE-MsgGUID: KJGBVIc5SLqTrz08mp+hzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103354799"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="103354799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 22:03:37 -0700
X-CSE-ConnectionGUID: +n+5vYv2RFqUdNT1YocArw==
X-CSE-MsgGUID: D9Dmn1GESAm6E4iY9JPx0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241079085"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 22:03:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 22:03:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 22:03:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 22:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3Xes4PxgCDVLyrQf5+NYlVw61oG1RnHNs2WbMZxmJHfKzZag7VfP+aIFdfB5THOCqmKTihe1dODraoYxqUzBGTGJy7DZoHi0w4vM+QsHLwI5GQSzZjTL9Jeb1DjxhOM4YWDsjFRdSQ8wg14H4ILtDEM2Yw1FdWSgdi6M1Kz9FLJNCoelWb6tOyZL/ooQDiYkveNsYZEXu7yRYZmApV8rzGcAsPWVbaXbflUpnLgA9DEdyQ/0lx7HytdtNA1DsjcuvvcOa6ff111svCp9wuH3ltzW5PmIEc0iAk4I/+OnmVl5D+GNOEsKkYkFiQmMfXWO+69qkwOpYwDjp51/L7t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKl70yg6I4jM75hPD58aymms3djhg/6Cqd/YjPScBNw=;
 b=KxRLCEKeky/WkLptAP0bRIvDLZeejhNBEG3HT1b+pVJCGVUAXHI6Hhln/wJ3VfdiRd+eBErbvWvigtF7sLJTVvuHeh0lJLZOa2WsZDgO8tpzyP93dvSboAV6VGU/im35PnaQKzPPYBcwGeNP9Oo6lx/w0plporje87yoNRCnEeRXezbqRpfHhJLVZaQkKx0sN2fYFEbNqUTM7xtOK3jTfBjlhJPW1a7FS3KLrafz14PLUJvz1fnjIsHUl8HzVRQkYhoeLKzJDsau72PxDSqbQxVXqAays23JthxJ9gmLDJKokYHy/ob8wGHjOyI7X7//t+qgzo4egDyP2YSa5c1dQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 05:03:31 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 05:03:31 +0000
Date: Wed, 27 May 2026 13:03:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:locking/futex] [x86/vdso]  698a86a85c:
 stress-ng.priv-instr.ops_per_sec 5.8% improvement
Message-ID: <202605271217.16dfca4d-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e9d607-ff7c-4b41-6a2c-08debbad4bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|18002099003|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: h6VYJRLWvgRAVlOedA+yN78tZSqOYilfsEkq3XFlvqwmf+jtCZqMyXqfw0nRvU59sDqTljfQATSDHaAC2L+uCxb9r78vS22f8mkbys1Knxphm8HznzMjJmkE7XTNkdtjZam7j1vVaQRijB2pwczQClxbgE12HM+vtXristDkwNrOX/SqMytw4P+4i9QVdtfchJqa7Bs71x5Iuac279aUKzGgZtWJlkHN3m6GQ5cOf+M3r7N8ZMunz9m4Reh7xM5XXqm+jG9rdo4KhMVsqOLGJprE4PPftQnoPSLvoSxvyEcRt323jCU72T02P+jXEK4AfauYGBAXd97njbeyICnepn24W7DwIxmz22jxUIw/0e5iL4Sx9CLAIL3hCnhGthR7SepYL5Drbm40Pst6tPHa/Xp9RIq9euAVmobQpql4bNXZeRL2/IUrfF+r2jlUcOvcFrqJV86jWutgo9nbJUXQyOvlDQylh5VV3PXNo0IBnbiwCzruc4D4qNg+Es38opiSAoG9C4YPatfueXRLy4mOI6kuZRq44rctRW9A55mYKnXuj7YLzcwkSpcX8MQdE7jos0hPgaVOkMFNbt/rCVtgK+/skQg0xJFqlZBDiIGZwT815JzdQwahBLH2+wpjxjGYjzulwKVDu3qTcJl4eYr1OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(18002099003)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5d4ekoGuDBgfvh1H3zDnYpR8TZ89AmseugjtZJi8bLb9iyYJY/RSteTWc8?=
 =?iso-8859-1?Q?MXNXv/RChImOuLPylgE/xrVvW4j2XOy5wN4FHyFkOKeEnuHQKlgtwxtLJL?=
 =?iso-8859-1?Q?C4QcpesEBRJEjqOusGH0xfrObmARQsbx2lcDGMk0iHzsLp1vAeQL0/Cfvj?=
 =?iso-8859-1?Q?SzG4WX6DKTSB6fQ33aZiVjt58P3hWNXfHeMV/diDQaSY0Ol6ZgpwyQPdtf?=
 =?iso-8859-1?Q?NKpTW6KJSeSpYgZE7o9x8ZXqB4TDiSfQirmPu6RgE0vsMwI+SYY+gU49A2?=
 =?iso-8859-1?Q?pcQNzi+lqiifYSSQms417iwS+yfXUU1HlGwf2Fk/VWDMW2PITDBnWG1cPu?=
 =?iso-8859-1?Q?MF9Zjohmoh3Kv3JvFC+e7AYuHbWBhPFxiwnx5CYz8NrY6lzZNlMio1srYE?=
 =?iso-8859-1?Q?D010fwfhiVtZvcu+8KRI/sjCPBbcQye/b3fDx6g6XgEKykQS5UITRkm7kV?=
 =?iso-8859-1?Q?yhaabXGwl7U+TDPegU0Kpp3XNEmr5a/z4sEDeWnzS5FjbHfcDZXvZJ+zIW?=
 =?iso-8859-1?Q?wzVpCqpscPmYpO8IFIIIK/8BAo93aqiSGRSxQ8qZWIcu6fd6MS7L2Dp0Ot?=
 =?iso-8859-1?Q?xSupsM6H9DA/DZV7eKdCTczj5BWUkCnV68tqoAPZEHEz8uhZbln6cVtJfZ?=
 =?iso-8859-1?Q?ga3177qfigzmwqKmNcUnD0ZBbhvoHLMNDlHarOUnpq5lJQS5un66TpvWTw?=
 =?iso-8859-1?Q?Gw9wn5JREbvl9pesBn5tO6Bbt02MLQyJumTHZrqz12ustGAGME2S5ovkBJ?=
 =?iso-8859-1?Q?nNmFHEMcVTgAGh1o+p/lpGMfzC0NWgGKQCEnlb+5c4EsEKdTPhvv1S2n3b?=
 =?iso-8859-1?Q?BVDwYwCH+Ew3VeuRWqBMpaZDVSnJRXUY+J69neg4uBkyYmCNwO38OoUb3v?=
 =?iso-8859-1?Q?IJGP6QA3NufxazLcESIJb6OuF7Z5jxw21Xpl2coLomJJiMwJOXDz4R6cPc?=
 =?iso-8859-1?Q?pLYB0oVx6DzSFXzzH0u81xN4VgcajUIzvd530TKDEil9qrt90gDL2lo43c?=
 =?iso-8859-1?Q?nIy6sXhQlctiGfq5KgiCqcQkLbnsEOEt40A9MkmUXNl6MSV8NvFur5oTFP?=
 =?iso-8859-1?Q?oSia8jV+z48LhdLwOh98m6uM+ztnMZj4vwI91OYUcxQ2gFsq7Ezm1+MWm4?=
 =?iso-8859-1?Q?BpkcvWVYIFytTsZa2GTOq07KdHJQeyPqYEish1h4by1/EAi42Uw4xAAGEB?=
 =?iso-8859-1?Q?XBed5S8bYlHmJ0DMiFLB0vKu7rUT1e+Fwj3DYRg8n/d9HZAvwtoxUdIiew?=
 =?iso-8859-1?Q?1S3Jh5rYDQnwD/wLNSBCtY/mImHK57flaBKpqchcam22cBpU/AfmHwzdCO?=
 =?iso-8859-1?Q?JeOAGSKPIqO1OmJ502QMRzFsJdSvKkdNsbM6xxogA8eDzE/YM7muPONJXf?=
 =?iso-8859-1?Q?dwj0TJVB3kSwBL+EA/FpYOcVEQH4ubmFkNuie4K5V3gtbC9ygFUG8viPq+?=
 =?iso-8859-1?Q?eLpoc05zAgSXhHPkkeKUNQWjR+OdzAGMXOlNAQLcVJXVbql26zfi4PdNSL?=
 =?iso-8859-1?Q?V5jG9NVF6oXDet0Qi6XjubdX/kePsGV+8SdU3c1/9kx/f6skCe23tU/e+e?=
 =?iso-8859-1?Q?DLoKws20GldrkB/o8wBD9KQE0ZsniCewgF02XJkLbgMwkQO5xkkZkOfVqk?=
 =?iso-8859-1?Q?+iJ8AhjsfnxTkcnRr7WnXJLA2pTQj2hjw4VUJTMFgnSxNMNPl4RNzOPqSR?=
 =?iso-8859-1?Q?WDJxEZmfuv6LgZcaBfwOWamDvaxqQ7xYQ7mqxpLhCiRu34pA697A81sArJ?=
 =?iso-8859-1?Q?ykbtuqFmaK8NR6d491KWeGb6aQT745azWQru+QU9xswCqb3GBZ7vltD0eh?=
 =?iso-8859-1?Q?N/Seq/xB/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: MgLHNpaLNBNvA1T7H+lA6cSkDEZZboJdWWkkDe/xNlAhWEwmVhlyMYDBPDmUHfvanWGmGFR+IorYtaK9ovBzdWqF9ywkgZMC6hFAPsL6zMyQ5LRFlnJhVy5ymMdYzkW7uDVTzyu9n5Pu2LAr1/KoT5qrvZVd1Cc1gQRsrpspSVDRZjqtOOPnNzcDj8M11cjFPi2XJ/iOQUwKJtkxdi49I+Jr4d8lMmP1wGkYlQCCFRmF4OZHvnDvwzyI39NgN2uOpxO/SUuVpdXXl576kSCfr/zO6+VTB0h1qU5qWAH7cZRk7OZhtlriFPPb0AQsfXU4tMFBzIwoLidU4F0LCjtySA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e9d607-ff7c-4b41-6a2c-08debbad4bd0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:03:31.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhlKM5sySFCsrTwohmehY0m7QZajG4tkv0Ziw/tCr0LKCRWrotMFk8BngZ1qi5QCNmgCewf0UWgZc88Px9nTtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.8% improvement of stress-ng.priv-instr.ops_per_sec on:


commit: 698a86a85c4db4b800faa8a2890810ff9cec2f79 ("x86/vdso: Implement __vdso_futex_robust_try_unlock()")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git locking/futex

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: priv-instr
	cpufreq_governor: performance


we notice the config diff which seems reasonable:

--- /pkg/linux/x86_64-rhel-9.4/gcc-14/35b728574c5b70b8223b53787bdbc40e55ca8ac4/.config  2026-05-25 13:01:14.615107724 +0800
+++ /pkg/linux/x86_64-rhel-9.4/gcc-14/698a86a85c4db4b800faa8a2890810ff9cec2f79/.config  2026-05-25 11:39:09.283994568 +0800
@@ -281,6 +281,8 @@ CONFIG_FUTEX=y
 CONFIG_FUTEX_PI=y
 CONFIG_FUTEX_PRIVATE_HASH=y
 CONFIG_FUTEX_MPOL=y
+CONFIG_HAVE_FUTEX_ROBUST_UNLOCK=y
+CONFIG_FUTEX_ROBUST_UNLOCK=y
 CONFIG_EPOLL=y
 CONFIG_SIGNALFD=y
 CONFIG_TIMERFD=y



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260527/202605271217.16dfca4d-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/priv-instr/stress-ng/60s

commit: 
  35b728574c ("x86/vdso: Prepare for robust futex unlock support")
  698a86a85c ("x86/vdso: Implement __vdso_futex_robust_try_unlock()")

35b728574c5b70b8 698a86a85c4db4b800faa8a2890 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     28468            -5.6%      26878        stress-ng.priv-instr.nanosecs_per_privileged_op_trap
 3.983e+08            +5.8%  4.214e+08        stress-ng.priv-instr.ops
   6643685            +5.8%    7028732        stress-ng.priv-instr.ops_per_sec
     60.10            +0.0%      60.10        stress-ng.time.elapsed_time
     60.10            +0.0%      60.10        stress-ng.time.elapsed_time.max
     47894            -0.0%      47889        stress-ng.time.involuntary_context_switches
      7847            +0.0%       7848        stress-ng.time.maximum_resident_set_size
     18927 ±  2%      +0.7%      19061 ±  2%  stress-ng.time.minor_page_faults
      4096            +0.0%       4096        stress-ng.time.page_size
     19086            +0.0%      19087        stress-ng.time.percent_of_cpu_this_job_got
     11320            -0.1%      11312        stress-ng.time.system_time
    150.74            +5.9%     159.68        stress-ng.time.user_time
    671.60            +1.0%     678.17 ±  3%  stress-ng.time.voluntary_context_switches
      0.00         +3e+102%       3.00 ±107%  perf-c2c.DRAM.local
      0.00       +8.5e+103%      85.33 ±111%  perf-c2c.DRAM.remote
      0.00       +6.6e+104%     660.17 ±100%  perf-c2c.HITM.local
      0.00       +8.2e+103%      81.83 ±110%  perf-c2c.HITM.remote
      0.00       +7.4e+104%     742.00 ±101%  perf-c2c.HITM.total
    247011 ± 28%      -8.9%     225103 ± 35%  numa-numastat.node0.local_node
    373383 ± 15%      -1.0%     369611 ± 13%  numa-numastat.node0.numa_hit
    126371 ± 47%     +14.4%     144508 ± 30%  numa-numastat.node0.other_node
    367783 ± 18%      +5.5%     387890 ± 20%  numa-numastat.node1.local_node
    440260 ± 12%      +0.5%     442288 ± 11%  numa-numastat.node1.numa_hit
     72476 ± 81%     -24.9%      54397 ± 80%  numa-numastat.node1.other_node
      3.27            -0.0        3.26        mpstat.cpu.all.idle%
      0.09            +0.0        0.09 ±  3%  mpstat.cpu.all.irq%
      0.00 ± 52%      +0.0        0.00 ± 31%  mpstat.cpu.all.soft%
     95.15            -0.1       95.08        mpstat.cpu.all.sys%
      1.49            +0.1        1.56        mpstat.cpu.all.usr%
      3.00            +0.0%       3.00        mpstat.max_utilization.seconds
    100.00            +0.0%     100.00        mpstat.max_utilization_pct
     60.10            +0.0%      60.10        time.elapsed_time
     60.10            +0.0%      60.10        time.elapsed_time.max
     47894            -0.0%      47889        time.involuntary_context_switches
      7847            +0.0%       7848        time.maximum_resident_set_size
     18927 ±  2%      +0.7%      19061 ±  2%  time.minor_page_faults
      4096            +0.0%       4096        time.page_size
     19086            +0.0%      19087        time.percent_of_cpu_this_job_got
     11320            -0.1%      11312        time.system_time
    150.74            +5.9%     159.68        time.user_time
    671.60            +1.0%     678.17 ±  3%  time.voluntary_context_switches
      6.08 ±  9%      -7.8%       5.61 ± 13%  vmstat.cpu.id
     92.50            +0.5%      92.93        vmstat.cpu.sy
      1.42            +2.0%       1.45 ±  2%  vmstat.cpu.us
      0.33            +0.5%       0.33        vmstat.io.bi
      4.00            +0.0%       4.00        vmstat.memory.buff
   4549331            -0.0%    4547648        vmstat.memory.cache
 2.514e+08            -0.0%  2.514e+08        vmstat.memory.free
    181.12            +0.9%     182.71        vmstat.procs.r
      2505 ±  2%      -3.0%       2430 ±  2%  vmstat.system.cs
    443254            +0.4%     445179        vmstat.system.in
      0.07 ±  5%      -3.7%       0.07 ±  4%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     10.80 ± 42%      -6.8%      10.06 ± 38%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.07 ±  5%      -3.7%       0.07 ±  4%  perf-sched.total_sch_delay.average.ms
     10.80 ± 42%      -6.8%      10.06 ± 38%  perf-sched.total_sch_delay.max.ms
    176.52 ±  2%      -0.6%     175.50 ±  5%  perf-sched.total_wait_and_delay.average.ms
      7255 ±  2%      +1.9%       7392 ±  6%  perf-sched.total_wait_and_delay.count.ms
      4979            +0.0%       4981        perf-sched.total_wait_and_delay.max.ms
    176.45 ±  2%      -0.6%     175.43 ±  5%  perf-sched.total_wait_time.average.ms
      4979            +0.0%       4981        perf-sched.total_wait_time.max.ms
    176.52 ±  2%      -0.6%     175.50 ±  5%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      7255 ±  2%      +1.9%       7392 ±  6%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      4979            +0.0%       4981        perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    176.45 ±  2%      -0.6%     175.43 ±  5%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      4979            +0.0%       4981        perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2004            -0.3%       1999        perf-stat.i.context-switches
    192058            -0.0%     192055        perf-stat.i.cpu-clock
    311.00            -0.7%     308.78        perf-stat.i.cpu-migrations
      0.02 ± 99%     +23.7%       0.02 ± 93%  perf-stat.i.major-faults
      3937 ±  3%      +2.8%       4049 ±  4%  perf-stat.i.minor-faults
      3937 ±  3%      +2.8%       4049 ±  4%  perf-stat.i.page-faults
    192058            -0.0%     192055        perf-stat.i.task-clock
      1972            -0.2%       1968        perf-stat.ps.context-switches
    188859            -0.0%     188847        perf-stat.ps.cpu-clock
    305.80            -0.7%     303.61        perf-stat.ps.cpu-migrations
      0.02 ± 96%     +25.7%       0.02 ± 92%  perf-stat.ps.major-faults
      3872 ±  3%      +2.8%       3979 ±  4%  perf-stat.ps.minor-faults
      3872 ±  3%      +2.8%       3979 ±  4%  perf-stat.ps.page-faults
    188859            -0.0%     188847        perf-stat.ps.task-clock
      1852 ± 81%     +66.9%       3093        turbostat.Avg_MHz
     57.87 ± 81%     +38.8       96.62        turbostat.Busy%
      1920 ± 81%     +66.7%       3201        turbostat.Bzy_MHz
      1.99 ± 82%      +1.2        3.15 ±  5%  turbostat.C1%
      1.99 ± 82%     +58.0%       3.14 ±  5%  turbostat.CPU%c1
     30.20 ± 81%     +68.3%      50.83        turbostat.CoreTmp
      0.03 ± 81%     +66.7%       0.05        turbostat.IPC
  16893263 ± 81%     +66.7%   28163412        turbostat.IRQ
   4937639 ± 81%     +66.8%    8234664        turbostat.NMI
     30.60 ± 81%     +66.1%      50.83        turbostat.PkgTmp
    171.65 ± 81%     +67.0%     286.58        turbostat.PkgWatt
      9.03 ± 81%     +66.6%      15.05        turbostat.RAMWatt
      0.01 ± 81%     +66.7%       0.02        turbostat.SysWatt
      1440 ± 81%     +66.7%       2400        turbostat.TSC_MHz
      1584 ±  6%      -8.7%       1447        sched_debug.cfs_rq:/.runnable_avg.max
    162.28 ±  5%      -8.7%     148.14 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
      1025 ±  4%      +7.6%       1103 ±  4%  sched_debug.cfs_rq:/.util_avg.max




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


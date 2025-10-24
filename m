Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B51D6AA
	for <oe-lkp@lists.linux.dev>; Fri, 24 Oct 2025 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284553; cv=fail; b=ca0wiDxoemmy/HWNAY0PpvYEttcrIkn+3jrZGJmyM13UpRJ0lVjZWp+UAjnIcSeqneRffLkf+0KdyLciYudwVdVRxmz2MMdb6qvE2jNpQwd4tDRd/L2UMIJi0EIbdekES9xKuqFf6ITVEsa0lQc9gtdfY6rqswKJc0EsL68PlvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284553; c=relaxed/simple;
	bh=3QJkl5O657EFH9nnXmHWoG/EraAwdMIcxLnjRHG7PNQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=idUx23vSlQa5LO9gcFzo+Q/ZnkBQucBG+NZoUlLOEJguJOrPZcdElgCALSEHfdBgxiTyCxag8vYiP89gg8H2jE9hD2WWcS+SfNmYkVLyQbwTyuehXaRt8yrhYF3MAc/c7zUcD0afSj+C+DpMznKev7c/lYZIpB32v42vICoHRig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TryUCJBT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TryUCJBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761284550; x=1792820550;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=3QJkl5O657EFH9nnXmHWoG/EraAwdMIcxLnjRHG7PNQ=;
  b=TryUCJBTN7uO07G0MeOZjAxo+UzyQjlgUl/xEVxcq5ZDoQnzpr+To6aV
   q78naDj663q3hRjg3cSyZK2nT+UdDUKvmLrPxu/e8mNWHJCd/Bb0FhHjQ
   RzT5Ne4XjgkspDFQQ2ivQe6Bo9vsdlEjbZ2VPqN2VSeyVfkkRm6nyKWuq
   elXsOlM9wESI9pA9z2M5J41Nz6BvWO4moJSSh61SrR7NyLRobnuS76MYX
   PrT0HBFf6Zf0jiXvo+Er1g4p5pxmobPPsRqr55Y2Dlk3PLLzuVrLZD9CL
   Z9vSKFJD6WZEV5AamcaOG2zX5UVI5I/rLxeh6QjM1efcPXpiP7Xyp/PdH
   A==;
X-CSE-ConnectionGUID: T+jXmtPqRSqwbye0ZbW9IA==
X-CSE-MsgGUID: cgcy87HEQeClpX+ilQDstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66079939"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="66079939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:42:29 -0700
X-CSE-ConnectionGUID: rx6wWwjhSJuQrlV9Gam0oA==
X-CSE-MsgGUID: zhbuCJlIRIOPZAKHxkPbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="183521080"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:42:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:42:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 22:42:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv8YKdri6AEg3qs73R7oNgYA28UCFeyv4jEC+PtQNup10kxwy8D8/u0fTCkHLV3h3gGwNKdE6RAJnodAIhCt1F6yZ+GnCSyxj6rxTKT0fiYCsBGdE011cRVc5rHvsuCJLbAUIS9zbiQEJ/PFJce09ftKWeWnAavdPZkma1jgApba3ECIyVYEOrqTse0BIk5i57FJ5ZGkYGV6nKGrqSgExf3EJ2neWFf3tb3d83+U7TLz/ua0qeDtRr+MHIFcC7EsOwAE9D5PR6fVDqAMk5vBetkVg6OWVfhn0G7WwmgNL7JnhNbH7c0VJsjLy0jQVyltwvxp2+lAThWmri10//P9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Otiay3t8wcWuXKMKIj6Kss6XO8DEKAiqEM+dOZSYLY=;
 b=pbu8hr6phzV2Dfz5jlKIkZ7m6gSUGVk2BdGyqJAeE4RWCeyhl5hx3j/Z/lDcDzCqplipb48dd06y9IeOFYyivqJcU0a8OtVUMUxOQ3dBbXIK02LW/pQSKErvRbg9OzKXKHbb6sX3uZd37Yh2fCuVUfn6V0k3j2mglsGxJDLFcuOXuboNfRzupMSFkIYNq1h6gYhsecoombz6c2j8Elzj99pXW/h/hlTzCt/cPWzKLdZrOMEjFhEm0iROGLA2bPUkmO5jx746/KJYHB5PEKBPiX5eQtFtZ8K3xX8rbXXfSimCjGXQqTe4HC1iF+QOsc96mn3g10xbTHlkAgW65pbnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 05:42:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 05:42:23 +0000
Date: Fri, 24 Oct 2025 13:42:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [sched/pelt]  fd03afd28f:
 netperf.Throughput_tps 26.8% regression
Message-ID: <202510241322.80a9e175-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbca16e-6515-4a93-6f0d-08de12c01a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aOuEGWtX+WLdRf/3S3mWLZkixw9gciQKUtn58ZqildPkaav3vZWymSvifq?=
 =?iso-8859-1?Q?oYqMPy+dY+v7SlMmBDjRK3mNDNlfBmQmPmDH9gQZdoKgXjysF1329kfZWR?=
 =?iso-8859-1?Q?ItaoO1JKrYEhP1w1GcDK/JTPw1C64w2K1cnVCgdruu/OW12drZXUbINl0Q?=
 =?iso-8859-1?Q?dCKpYYWbcMnv4LK9sy2DKcdAe6FC7DNZ0c8ue+anOxI9N4ZkV2USm8F973?=
 =?iso-8859-1?Q?WyXI1uQSgGMf2ixKm3sVfeDzR83HRjYPuJZkvCYV56BtNecvd3BUEGejIQ?=
 =?iso-8859-1?Q?pWYc/lskTTIHZO6CZBy3Y+pXGk5SFKmNqgFXh2ypiJxpuRrZo/1ooR22lF?=
 =?iso-8859-1?Q?xdLXQJekmurR9mAC+mnJauCen0aFlhA6FO5c/8WysxCwoFOb2KPXyPfzQ5?=
 =?iso-8859-1?Q?h2EOQjlxUeSPRkp1MN7pP1merrTPShkPut3Uv+LsnSgKBfoDtdG7r+yv8L?=
 =?iso-8859-1?Q?GQuIW1U9/MmmR8OXbbuXGnjLYCfXcED3Uo1c2/+ZMKMSZSlwQvgX8/3wAV?=
 =?iso-8859-1?Q?67ijz/8rnbFUv8F4TyrGksslZoq2kCKhSqnym5opYptVMiJUI+yK2DpsSC?=
 =?iso-8859-1?Q?mLGuS6JRwGb1eVH2kCIvaZatKPNsWEc+ugLOpCww9dL8NW48GQiprAHJfb?=
 =?iso-8859-1?Q?sf9Flk3ZCYIbkUTS2hJv6I8KTRihPz+rdyk154+vgtr+KASo+u3Y5UtQRW?=
 =?iso-8859-1?Q?FDylnZ8JpB/5samAgCM+34aYiyxLFnYftx2nac5O0ul88pAQnT3m+/98H5?=
 =?iso-8859-1?Q?QqlG8F4nqHmD/O15FFlazfSxcbwlipp7aUegS8SyZP331S9ZuYltJQeYfU?=
 =?iso-8859-1?Q?v9yo/B9NXiHw8aCwh4Y4cX8rbw7ubmVZNgTmU3qYvA1JQPEoV4y/B3M7yD?=
 =?iso-8859-1?Q?Ctp+D3uVKmMQQPJ2h2kYqzs7G4Ugb1oV5yCGLYYltJhAzNs/yPpOIhCEOv?=
 =?iso-8859-1?Q?1O4sglFWmxFArWlLzk8lLm/VNTXvvWS7QTd9di/TuJyGcg3pOFyUqAZUi9?=
 =?iso-8859-1?Q?1d1JQYUl/+5tWlBvrZRb21VsB9iW943O7VYW5MIuppCk4W0M0IZp6EXF8h?=
 =?iso-8859-1?Q?1NlOI8ZyV/5VbRUQWKwiubrcemNSZWY8ySZfciFGFRD09lgOtdgZOQWcZx?=
 =?iso-8859-1?Q?aGflmIDFFXpSbi11RY/dSi4BlGN/kOZImyhWf8gLfP4yksp4mo2T/2XyMe?=
 =?iso-8859-1?Q?3NcpXnyknljmKygP9FMZr//oetFmfOr+p64TXVW0qGFHnxKf7hjYI+oCz0?=
 =?iso-8859-1?Q?W9zl2U5M8nd6m7y14a1GOJpBTyNSNYErvsENcULJeZk9s/6jb/533JSnx8?=
 =?iso-8859-1?Q?+72QYKvkW0UP1qruyczGtHEZoX6uP/BRDzjdjOUqQk6L3t9wJ12AVXRJmA?=
 =?iso-8859-1?Q?bFbza+6kV6fUmtjXZYSlTdlt1NV7eBhaFp/PXOHeY5G6XALvhdsfNER72v?=
 =?iso-8859-1?Q?LJkv3TBK+IRreXombEtf8Zwj3s+4tF4uraQKqwD7W934/UsSFsYc8/nw28?=
 =?iso-8859-1?Q?NQYwREvOj22tBVYJa3lxkpAMmOhFWAkokgVjHBNp1S5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JuwEG/8b3Y9dLL1+XKP8UUrODlI38Zzlw5dQ83c7bUbV1Td+8I8sy1zAwD?=
 =?iso-8859-1?Q?ccH8/LGEAvqfdw5AV4t1iH1mHb1xD6RbbVCy8qudK3MdLrlI1JqE14h/jC?=
 =?iso-8859-1?Q?cDzlh7v6YpDde+EKCkuLOoRx4hWgZ1RUfXrnrQYnVSVnVdRXhFBToKMjph?=
 =?iso-8859-1?Q?VuKVqJNy0rewI/rVMMnXI//d3Et+GeiPY+U4tsToftGsFqTG/+7t2oS/fz?=
 =?iso-8859-1?Q?OoVGtcfnRxa780MzrvFYhC+kcElVryVdwE51AyaDht+rxpoU8XAAKvpYxk?=
 =?iso-8859-1?Q?TP+/t/AsGvqjakkdFq/3TuqqClqczE2wc88R2g1TFs9Tl+yu2r+oJGtWli?=
 =?iso-8859-1?Q?ilGqFXO6baDvPVXUwtIxLXxMIKrxq8S2VcOGD3s+2av8qP8UcZwnYfNYHj?=
 =?iso-8859-1?Q?69IEw+0AjA1ThdLCKoVabd1lYIOspWj+i/mnU9enyOXWxxHLnmB9fv8ILk?=
 =?iso-8859-1?Q?VMmXacCtQQem33BT5ujm8fmTqbsjw9qNqaV9OMJ2yBIdToqFlnjC1OyrUP?=
 =?iso-8859-1?Q?tGgO25QD4tikyvSGfM4CcSu652kH/ivqo6ck1tvaiDOBLaNp66zp5uuNTL?=
 =?iso-8859-1?Q?ubkCJTWtF1csYhUj/Cnn1guoFG9zNsxXClApBcKBHJa7kSAn0jIEhAkQom?=
 =?iso-8859-1?Q?AM36qcVBo8s1mqPZ7w3ieoEMtZu4WdBOv5bnBpFgpMPobVgAm9C6rgou0Z?=
 =?iso-8859-1?Q?CSiJYeI8r0xM1o/tbh34RIsqGYmAhAFAI8LOjn2sqXQPthIlSDSroekU6a?=
 =?iso-8859-1?Q?lUiX+LMtZfJNBtu2ufk2k4KlOCUepU4wekOPxV8l9YcJBBhWHe5jpwKRXg?=
 =?iso-8859-1?Q?CVeFlOJGqatLf8qteZZrBrAQwWgFRZasHAL87yzkqOfn40xjE4NiEsUhhH?=
 =?iso-8859-1?Q?Vr1MyZzEH3MbOV3nfXaDckoiguvpbJZLbZQxjdROmCix53TPm849eTjXhY?=
 =?iso-8859-1?Q?UV/BthyifMITFLq9Z2Q62fNzTj9/eY62JnZbEwo3y4tGwZaaGuAsx05UYW?=
 =?iso-8859-1?Q?sR8czu9BHzAmTlp8bYa60A8cloeFJGAnimGf5eMVZgcehEokHv9/K37s5z?=
 =?iso-8859-1?Q?49B3qW/tbqLRFE/iTZuzc4aNs6qHK3bck4t+votNzPJ+vS1dgLW4p8Z+7t?=
 =?iso-8859-1?Q?BZF8VUNwft8KmsNc55Ab6HBTJhctKBW0yZpwzovNdhJAqHgJi9DzCSg1AD?=
 =?iso-8859-1?Q?4qRdAJgPel6h9lozQO6gk6cpoKvLwnFVZ5HiBNiIYfIzQTGFfRJm6PseSb?=
 =?iso-8859-1?Q?FRD/b6TZhON4ArkJmBh7Bv2jzLHmCI5pf8wYuLCwbc922C26jp4TQU6aDB?=
 =?iso-8859-1?Q?gvlFnHzuf1cfQRmr16PQLAm35MQEHnsUltEy/FLYwG1/3SdtZF/3DfbuLX?=
 =?iso-8859-1?Q?486VKCJf3+ToTOBcG8rCC/PLSsPLkZusadGosDA726ZEqZDywQBOZfivPW?=
 =?iso-8859-1?Q?CE6W9PKQ8cBsa/c4CBwRxXEflgD1JdWZih4qJe8408IvzWmUbiLAQScE/g?=
 =?iso-8859-1?Q?XDHlt9sasqozDJJcGjqmx4LA9kCsl2ICl8iphfN1yrwXqOzR+qFwrPVbse?=
 =?iso-8859-1?Q?MY0dNX2buYJyvB+yPbOykETfmxd5trmGDVqx/DmCiV+o5mrjaKhLGlL7g5?=
 =?iso-8859-1?Q?ld5sj4vEqnwA9IPHkwdYN4ZxWiTCodRDAN0+W9R612obj0RKCNIj/Zag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbca16e-6515-4a93-6f0d-08de12c01a14
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 05:42:23.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYpbZTgZmzSNZoyj4+dyXnEWWCXAOwuU1su9cwe964PZ/QCCZ79cdkVkmTtdCmUqjBkTCJnHgAkWTuTz1jBHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 26.8% regression of netperf.Throughput_tps on:


commit: fd03afd28f8f66d16fc2f492540b9cd99541cbd0 ("sched/pelt: Relax the sync of load_sum with load_avg")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	test: TCP_RR
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510241322.80a9e175-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241322.80a9e175-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/200%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp3/TCP_RR/netperf

commit: 
  8d55550814 ("sched/pelt: Relax the sync of runnable_sum with runnable_avg")
  fd03afd28f ("sched/pelt: Relax the sync of load_sum with load_avg")

8d555508146ff22d fd03afd28f8f66d16fc2f492540 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.953e+09 ± 27%    +121.3%  8.751e+09 ±  8%  cpuidle..time
 4.012e+08 ± 35%    +155.0%  1.023e+09 ±  8%  cpuidle..usage
      4.28 ± 26%      +4.9        9.18 ±  8%  mpstat.cpu.all.idle%
     59.31 ±  2%      -7.6       51.72        mpstat.cpu.all.sys%
      9635 ± 13%   +1831.5%     186119        perf-c2c.HITM.local
     11985 ±  9%   +1471.2%     188310        perf-c2c.HITM.total
      3248            +4.2%       3385        turbostat.Bzy_MHz
      4.98 ± 27%      +6.1       11.09 ±  8%  turbostat.C1%
      1.42 ±  9%     +24.5%       1.77 ±  5%  turbostat.CPU%c1
      1.07 ±  6%     -22.8%       0.82 ±  4%  turbostat.IPC
 6.262e+08 ± 29%    +129.0%  1.434e+09 ±  8%  turbostat.IRQ
      0.01 ± 44%      +0.0        0.02        turbostat.POLL%
  24920617 ±  6%     -26.8%   18231655 ±  4%  netperf.ThroughputBoth_total_tps
     48673 ±  6%     -26.8%      35608 ±  4%  netperf.ThroughputBoth_tps
  24920617 ±  6%     -26.8%   18231655 ±  4%  netperf.Throughput_total_tps
     48673 ±  6%     -26.8%      35608 ±  4%  netperf.Throughput_tps
     12130            -7.3%      11246        netperf.time.percent_of_cpu_this_job_got
     33908            -8.4%      31064        netperf.time.system_time
      3012            +5.1%       3166        netperf.time.user_time
 6.592e+09 ±  6%     -27.4%  4.785e+09 ±  3%  netperf.time.voluntary_context_switches
 7.476e+09 ±  6%     -26.8%  5.469e+09 ±  4%  netperf.workload
      0.06 ± 14%     +24.7%       0.08 ±  7%  perf-stat.i.MPKI
 1.705e+11 ±  6%     -22.4%  1.323e+11 ±  4%  perf-stat.i.branch-instructions
      0.61            +0.0        0.66        perf-stat.i.branch-miss-rate%
 1.024e+09 ±  4%     -15.7%  8.638e+08 ±  2%  perf-stat.i.branch-misses
     11.20 ± 14%      -9.0        2.22 ± 71%  perf-stat.i.cache-miss-rate%
 1.222e+09 ± 28%    +121.6%  2.707e+09 ±  8%  perf-stat.i.cache-references
  50500697 ±  5%     -21.6%   39573466 ±  3%  perf-stat.i.context-switches
      1.00 ±  6%     +25.7%       1.25 ±  3%  perf-stat.i.cpi
   2344880 ± 34%    +145.4%    5754330 ±  9%  perf-stat.i.cpu-migrations
 8.547e+11 ±  6%     -22.6%  6.612e+11 ±  4%  perf-stat.i.instructions
      1.06 ±  6%     -23.0%       0.81 ±  4%  perf-stat.i.ipc
    206.22 ±  3%     -14.2%     176.95 ±  2%  perf-stat.i.metric.K/sec
      0.04 ± 20%     +41.6%       0.06 ±  8%  perf-stat.overall.MPKI
      0.60            +0.1        0.65        perf-stat.overall.branch-miss-rate%
      3.04 ± 18%      -1.6        1.44 ± 18%  perf-stat.overall.cache-miss-rate%
      0.95 ±  6%     +30.0%       1.23 ±  3%  perf-stat.overall.cpi
      1.06 ±  6%     -23.2%       0.81 ±  4%  perf-stat.overall.ipc
     34832            +5.5%      36743        perf-stat.overall.path-length
 1.701e+11 ±  6%     -22.7%  1.316e+11 ±  3%  perf-stat.ps.branch-instructions
 1.021e+09 ±  4%     -15.8%  8.596e+08 ±  2%  perf-stat.ps.branch-misses
 1.197e+09 ± 28%    +125.3%  2.697e+09 ±  8%  perf-stat.ps.cache-references
  50376102 ±  5%     -21.8%   39377190 ±  3%  perf-stat.ps.context-switches
   2288801 ± 34%    +150.4%    5731013 ±  8%  perf-stat.ps.cpu-migrations
 8.525e+11 ±  6%     -22.8%  6.578e+11 ±  4%  perf-stat.ps.instructions
 2.603e+14 ±  6%     -22.8%  2.009e+14 ±  4%  perf-stat.total.instructions
  19293606 ± 48%    +121.7%   42775417 ± 10%  sched_debug.cfs_rq:/.MIN_vruntime.max
   3355873 ± 42%    +132.2%    7791150 ± 19%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      3.89 ±  9%     +41.9%       5.53 ± 13%  sched_debug.cfs_rq:/.h_nr_running.max
      0.40 ± 30%     -93.1%       0.03 ±223%  sched_debug.cfs_rq:/.h_nr_running.min
      0.77 ±  9%     +43.3%       1.10 ±  9%  sched_debug.cfs_rq:/.h_nr_running.stddev
    726.56 ± 38%     -93.1%      49.86 ±223%  sched_debug.cfs_rq:/.load.min
      5.77 ± 11%     +24.0%       7.16 ±  4%  sched_debug.cfs_rq:/.load_avg.avg
      0.54 ± 18%    +188.7%       1.56 ± 10%  sched_debug.cfs_rq:/.load_avg.min
  19293606 ± 48%    +121.7%   42775417 ± 10%  sched_debug.cfs_rq:/.max_vruntime.max
   3355873 ± 42%    +132.2%    7791150 ± 19%  sched_debug.cfs_rq:/.max_vruntime.stddev
      0.40 ± 30%     -93.1%       0.03 ±223%  sched_debug.cfs_rq:/.nr_running.min
      0.15 ± 25%     +79.4%       0.27 ±  8%  sched_debug.cfs_rq:/.nr_running.stddev
      2827 ±  4%     +21.6%       3439 ±  5%  sched_debug.cfs_rq:/.runnable_avg.max
    539.49 ±  7%     +30.9%     706.36 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    381.61 ± 11%     -28.2%     273.99 ± 15%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1143 ±  4%     -14.5%     976.89 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.max
     68.34 ± 44%    -100.0%       0.00        sched_debug.cfs_rq:/.util_est_enqueued.min
    179.55 ± 13%     +48.5%     266.56 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
      4394 ± 29%     -95.0%     221.19 ±223%  sched_debug.cpu.curr->pid.min
      1773 ± 17%     +66.9%       2960 ±  9%  sched_debug.cpu.curr->pid.stddev
      3.96 ± 13%     +32.7%       5.25 ± 14%  sched_debug.cpu.nr_running.max
      0.49 ± 25%     -94.3%       0.03 ±223%  sched_debug.cpu.nr_running.min
      0.71 ± 10%     +43.5%       1.01 ±  8%  sched_debug.cpu.nr_running.stddev
  16342812 ± 20%     -37.5%   10216246 ± 10%  sched_debug.cpu.nr_switches.min
   5654327 ± 26%     +78.1%   10070007 ±  3%  sched_debug.cpu.nr_switches.stddev
     93.41 ±  2%      -5.6       87.80        perf-profile.calltrace.cycles-pp.main
     44.56 ±  2%      -3.1       41.49        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_rr.main
     52.50            -3.1       49.44        perf-profile.calltrace.cycles-pp.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     44.53 ±  2%      -3.0       41.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child.accept_connection
     46.38 ±  2%      -2.9       43.44        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     46.38 ±  2%      -2.9       43.44        perf-profile.calltrace.cycles-pp.accept_connections.main
     46.38 ±  2%      -2.9       43.44        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     46.38 ±  2%      -2.9       43.44        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     44.06 ±  2%      -2.9       41.15        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_rr.main
     46.22 ±  2%      -2.9       43.33        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     44.04 ±  2%      -2.9       41.16        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child
     51.65            -2.8       48.87        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     46.55 ±  2%      -2.8       43.80        perf-profile.calltrace.cycles-pp.send_tcp_rr.main
     46.35 ±  2%      -2.7       43.64        perf-profile.calltrace.cycles-pp.send_omni_inner.send_tcp_rr.main
     28.66 ±  3%      -2.4       26.22        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.34 ±  3%      -2.3       26.02        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
      4.89 ± 21%      -2.3        2.61 ±  5%  perf-profile.calltrace.cycles-pp.dst_release.skb_release_head_state.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg
     27.99 ±  3%      -2.2       25.74        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     26.95 ±  3%      -2.2       24.73        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      5.19 ± 14%      -1.7        3.45 ±  2%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     26.93            -1.7       25.26        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_rr
     26.85            -1.6       25.22        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
     26.94            -1.5       25.40        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
     26.87            -1.5       25.35        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
      6.41 ±  8%      -1.3        5.07 ±  4%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable
      6.33 ±  8%      -1.3        5.02 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lock
      2.56 ± 22%      -1.3        1.28 ±  6%  perf-profile.calltrace.cycles-pp.ipv4_mtu.tcp_current_mss.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg
      2.90 ± 19%      -1.3        1.65 ±  5%  perf-profile.calltrace.cycles-pp.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      2.18 ± 22%      -1.3        0.92 ± 45%  perf-profile.calltrace.cycles-pp.ip_rcv_finish_core.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll
     43.36            -1.2       42.11        perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      2.59 ± 21%      -1.2        1.35 ±  5%  perf-profile.calltrace.cycles-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      2.80 ± 19%      -1.2        1.56 ±  5%  perf-profile.calltrace.cycles-pp.tcp_current_mss.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
     43.26            -1.2       42.05        perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      2.08 ± 16%      -0.8        1.29 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.08 ± 16%      -0.8        1.29 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.04 ± 12%      -0.8        1.27 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      1.86 ± 17%      -0.8        1.10 ±  6%  perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.86 ± 17%      -0.8        1.10 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.76 ± 17%      -0.7        1.04 ±  6%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_timeout.wait_woken
      1.59 ± 18%      -0.7        0.92 ±  7%  perf-profile.calltrace.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__schedule.schedule.schedule_timeout
      1.93 ± 12%      -0.5        1.40        perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.schedule_timeout.wait_woken
      4.40 ±  4%      -0.4        3.94 ±  6%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_up_common
      1.58 ±  6%      -0.2        1.36        perf-profile.calltrace.cycles-pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb
      1.48 ±  6%      -0.2        1.30        perf-profile.calltrace.cycles-pp.xmit_one.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit
      1.33 ±  7%      -0.1        1.20        perf-profile.calltrace.cycles-pp.loopback_xmit.xmit_one.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2
      1.39 ±  2%      +0.1        1.44        perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.55 ±  2%      +0.1        1.60        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.69 ±  3%      +0.1        1.80        perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.10 ±  7%      +0.2        1.32        perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.96 ± 13%      +0.3        1.24        perf-profile.calltrace.cycles-pp.__switch_to_asm
      1.46 ± 11%      +0.5        1.93        perf-profile.calltrace.cycles-pp.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      1.42 ± 12%      +0.5        1.89        perf-profile.calltrace.cycles-pp.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt
      1.43 ± 18%      +0.6        1.99 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
      0.00            +0.6        0.58 ±  2%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.11 ±223%      +0.7        0.82 ±  3%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending
      0.08 ±223%      +1.0        1.04        perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.18 ±223%      +1.1        1.25 ±  3%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single
      0.22 ±223%      +1.2        1.41        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      3.25 ± 15%      +1.2        4.46 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.wait_woken
      0.23 ±223%      +1.2        1.44        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.24 ±223%      +1.3        1.52        perf-profile.calltrace.cycles-pp.kfree.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack
      0.22 ±223%      +1.3        1.50 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single
      0.22 ±223%      +1.3        1.51 ±  2%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      0.32 ±223%      +1.8        2.12        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt
      0.40 ±223%      +2.3        2.71        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry
      0.44 ±223%      +2.5        2.97        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.48 ±223%      +2.8        3.26        perf-profile.calltrace.cycles-pp.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.61 ±223%      +3.2        3.80        perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      0.70 ±223%      +4.3        5.04 ±  2%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.71 ±223%      +4.3        5.04 ±  2%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.72 ±223%      +4.4        5.16 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.72 ±223%      +4.4        5.17 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.89 ±223%      +4.5        5.37        perf-profile.calltrace.cycles-pp.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      0.77 ±223%      +4.7        5.47 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.89 ±223%      +5.6        6.53 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.13 ±223%      +6.7        7.81        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      1.13 ±223%      +6.7        7.83        perf-profile.calltrace.cycles-pp.cpu_startup_entry.secondary_startup_64_no_verify
      1.14 ±223%      +6.7        7.88        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     91.57 ±  2%      -6.9       84.65        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     90.60 ±  2%      -6.6       83.98        perf-profile.children.cycles-pp.do_syscall_64
     93.49 ±  2%      -5.6       87.92        perf-profile.children.cycles-pp.main
     53.90            -3.2       50.68        perf-profile.children.cycles-pp.__x64_sys_sendto
     53.77            -3.2       50.60        perf-profile.children.cycles-pp.__sys_sendto
     52.55            -3.1       49.47        perf-profile.children.cycles-pp.tcp_sendmsg
     30.36 ±  4%      -3.0       27.32        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     46.40 ±  2%      -2.9       43.45        perf-profile.children.cycles-pp.recv_omni
     46.38 ±  2%      -2.9       43.44        perf-profile.children.cycles-pp.accept_connection
     46.38 ±  2%      -2.9       43.44        perf-profile.children.cycles-pp.accept_connections
     46.38 ±  2%      -2.9       43.44        perf-profile.children.cycles-pp.process_requests
     46.38 ±  2%      -2.9       43.44        perf-profile.children.cycles-pp.spawn_child
     30.06 ±  4%      -2.9       27.13        perf-profile.children.cycles-pp.__sys_recvfrom
     51.75            -2.8       48.93        perf-profile.children.cycles-pp.tcp_sendmsg_locked
     46.53 ±  2%      -2.8       43.77        perf-profile.children.cycles-pp.send_omni_inner
     46.55 ±  2%      -2.8       43.80        perf-profile.children.cycles-pp.send_tcp_rr
     28.72 ±  3%      -2.5       26.27        perf-profile.children.cycles-pp.sock_recvmsg
     28.38 ±  3%      -2.3       26.05        perf-profile.children.cycles-pp.inet_recvmsg
      4.90 ± 21%      -2.3        2.62 ±  5%  perf-profile.children.cycles-pp.dst_release
     28.07 ±  3%      -2.3       25.80        perf-profile.children.cycles-pp.tcp_recvmsg
     27.03 ±  3%      -2.3       24.78        perf-profile.children.cycles-pp.tcp_recvmsg_locked
      5.26 ± 14%      -1.8        3.50 ±  2%  perf-profile.children.cycles-pp.__dev_queue_xmit
      2.56 ± 22%      -1.3        1.28 ±  6%  perf-profile.children.cycles-pp.ipv4_mtu
      2.93 ± 19%      -1.3        1.67 ±  5%  perf-profile.children.cycles-pp.tcp_send_mss
     43.38            -1.3       42.12        perf-profile.children.cycles-pp.__tcp_push_pending_frames
      2.62 ± 21%      -1.3        1.36 ±  5%  perf-profile.children.cycles-pp.ip_rcv
      2.83 ± 19%      -1.3        1.58 ±  5%  perf-profile.children.cycles-pp.tcp_current_mss
     43.34            -1.2       42.10        perf-profile.children.cycles-pp.tcp_write_xmit
      2.17 ± 21%      -1.1        1.07 ±  7%  perf-profile.children.cycles-pp.ipv4_dst_check
      2.19 ± 22%      -1.1        1.09 ±  6%  perf-profile.children.cycles-pp.ip_rcv_finish_core
      1.57 ± 22%      -0.8        0.76 ±  7%  perf-profile.children.cycles-pp.__sk_dst_check
      2.66 ± 13%      -0.8        1.88 ±  5%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      2.59 ± 12%      -0.8        1.81 ±  6%  perf-profile.children.cycles-pp.update_curr
      1.81 ± 15%      -0.6        1.20 ±  7%  perf-profile.children.cycles-pp.load_new_mm_cr3
      1.79 ± 15%      -0.6        1.19 ±  2%  perf-profile.children.cycles-pp.psi_task_change
      0.76 ± 12%      -0.4        0.37 ± 70%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      1.11 ± 10%      -0.3        0.84 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      1.60 ±  6%      -0.2        1.37        perf-profile.children.cycles-pp.dev_hard_start_xmit
      0.72 ± 12%      -0.2        0.52 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      1.50 ±  6%      -0.2        1.31        perf-profile.children.cycles-pp.xmit_one
      0.41 ± 16%      -0.2        0.25 ±  4%  perf-profile.children.cycles-pp.__ip_finish_output
      0.33 ± 20%      -0.2        0.17 ±  4%  perf-profile.children.cycles-pp.check_preempt_wakeup
      1.37 ±  7%      -0.1        1.23        perf-profile.children.cycles-pp.loopback_xmit
      1.25 ±  3%      -0.1        1.12 ±  3%  perf-profile.children.cycles-pp.sockfd_lookup_light
      0.32 ± 17%      -0.1        0.19 ±  5%  perf-profile.children.cycles-pp.ip_skb_dst_mtu
      0.24 ± 18%      -0.1        0.14 ±  8%  perf-profile.children.cycles-pp.account_run_delay_time
      0.76 ±  4%      -0.1        0.68 ±  2%  perf-profile.children.cycles-pp.set_next_entity
      1.06 ±  2%      -0.1        0.98 ±  3%  perf-profile.children.cycles-pp.__fget_light
      0.14 ± 16%      -0.1        0.08 ±  5%  perf-profile.children.cycles-pp.sk_free
      0.10 ± 22%      -0.1        0.05        perf-profile.children.cycles-pp.blkcg_maybe_throttle_current
      0.20 ±  9%      -0.1        0.15 ±  2%  perf-profile.children.cycles-pp.sock_put
      0.19 ±  4%      -0.0        0.16        perf-profile.children.cycles-pp.psi_flags_change
      0.12 ±  5%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.__send
      0.48 ±  3%      +0.0        0.52 ±  2%  perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.02 ±141%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.send@plt
      0.01 ±223%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.01 ±223%      +0.1        0.06        perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.87 ±  2%      +0.1        0.93        perf-profile.children.cycles-pp.release_sock
      0.49 ±  5%      +0.1        0.55 ±  3%  perf-profile.children.cycles-pp.ip_finish_output
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.newidle_balance
      0.18 ± 13%      +0.1        0.24        perf-profile.children.cycles-pp.tcp_update_pacing_rate
      0.09 ±  7%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.check_spread
      0.01 ±223%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.native_write_msr
      0.01 ±223%      +0.1        0.09        perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.47 ±  6%      +0.1        0.55        perf-profile.children.cycles-pp.__skb_clone
      0.25 ± 16%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.tcp_skb_entail
      1.71 ±  3%      +0.1        1.81        perf-profile.children.cycles-pp.switch_fpu_return
      0.02 ±223%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.62 ±  7%      +0.1        0.72        perf-profile.children.cycles-pp.tcp_check_space
      0.02 ±223%      +0.1        0.12 ±  9%  perf-profile.children.cycles-pp.cpus_share_cache
      0.02 ±223%      +0.1        0.13        perf-profile.children.cycles-pp.irq_exit_rcu
      0.30 ± 14%      +0.1        0.41        perf-profile.children.cycles-pp.__ksize
      0.03 ±223%      +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.irqentry_enter
      0.03 ±223%      +0.2        0.19 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.03 ±223%      +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.resched_curr
      0.10 ± 72%      +0.2        0.28        perf-profile.children.cycles-pp.rb_first
      0.03 ±223%      +0.2        0.20 ±  2%  perf-profile.children.cycles-pp.menu_select
      0.42 ± 17%      +0.2        0.60        perf-profile.children.cycles-pp.slab_free_freelist_hook
      0.46 ± 14%      +0.2        0.64        perf-profile.children.cycles-pp.finish_task_switch
      1.13 ±  7%      +0.2        1.34        perf-profile.children.cycles-pp.rseq_ip_fixup
      0.27 ± 34%      +0.2        0.50        perf-profile.children.cycles-pp.kfree_skbmem
      0.39 ± 26%      +0.2        0.63        perf-profile.children.cycles-pp.remove_wait_queue
      0.32 ±  9%      +0.2        0.57 ± 14%  perf-profile.children.cycles-pp.recv
      0.67 ± 16%      +0.3        0.94        perf-profile.children.cycles-pp.__inet_lookup_established
      0.16 ± 62%      +0.3        0.44 ±  2%  perf-profile.children.cycles-pp.tcp_release_cb
      1.00 ± 13%      +0.3        1.30        perf-profile.children.cycles-pp.__switch_to_asm
      0.06 ±223%      +0.3        0.37        perf-profile.children.cycles-pp.llist_reverse_order
      0.06 ±223%      +0.3        0.41 ±  2%  perf-profile.children.cycles-pp.llist_add_batch
      0.70 ± 21%      +0.4        1.05        perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.06 ±223%      +0.4        0.42        perf-profile.children.cycles-pp.__smp_call_single_queue
      0.07 ±223%      +0.4        0.45        perf-profile.children.cycles-pp.__slab_free
      0.62 ± 25%      +0.4        1.00        perf-profile.children.cycles-pp.__get_user_8
      1.67 ±  8%      +0.4        2.05        perf-profile.children.cycles-pp.skb_release_data
      0.68 ± 23%      +0.4        1.06 ±  4%  perf-profile.children.cycles-pp.recv_data
      0.09 ±223%      +0.5        0.60 ±  2%  perf-profile.children.cycles-pp.flush_smp_call_function_from_idle
      1.49 ± 17%      +0.5        2.03 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
      0.10 ±223%      +0.5        0.64        perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.23 ±108%      +0.6        0.81        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.84 ± 35%      +0.7        1.55        perf-profile.children.cycles-pp.kfree
     13.49 ±  3%      +0.8       14.30        perf-profile.children.cycles-pp.__schedule
      4.66 ±  8%      +0.8        5.51 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      3.29 ± 15%      +1.2        4.49 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.23 ±223%      +1.2        1.45        perf-profile.children.cycles-pp.schedule_idle
      0.39 ±223%      +2.2        2.61        perf-profile.children.cycles-pp.sched_ttwu_pending
      0.44 ±223%      +2.4        2.88        perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.48 ±223%      +2.7        3.16        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.77 ±215%      +3.8        4.55        perf-profile.children.cycles-pp.available_idle_cpu
      0.71 ±223%      +4.3        5.04 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.71 ±223%      +4.3        5.05 ±  2%  perf-profile.children.cycles-pp.native_safe_halt
      0.71 ±223%      +4.4        5.06 ±  2%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.71 ±223%      +4.4        5.07 ±  2%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.73 ±223%      +4.5        5.19 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.73 ±223%      +4.5        5.20 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
      0.90 ±223%      +4.5        5.44        perf-profile.children.cycles-pp.select_idle_core
      0.78 ±223%      +4.7        5.51 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.14 ±223%      +6.7        7.86        perf-profile.children.cycles-pp.do_idle
      1.14 ±223%      +6.7        7.88        perf-profile.children.cycles-pp.cpu_startup_entry
      1.14 ±223%      +6.7        7.88        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      4.86 ± 21%      -2.3        2.60 ±  5%  perf-profile.self.cycles-pp.dst_release
      3.03 ± 22%      -1.5        1.54 ±  5%  perf-profile.self.cycles-pp.__dev_queue_xmit
      2.54 ± 22%      -1.3        1.27 ±  7%  perf-profile.self.cycles-pp.ipv4_mtu
      2.14 ± 21%      -1.1        1.06 ±  7%  perf-profile.self.cycles-pp.ipv4_dst_check
      2.17 ± 22%      -1.1        1.08 ±  6%  perf-profile.self.cycles-pp.ip_rcv_finish_core
      1.80 ± 15%      -0.6        1.19 ±  7%  perf-profile.self.cycles-pp.load_new_mm_cr3
      0.54 ± 18%      -0.2        0.31 ±  7%  perf-profile.self.cycles-pp.ip_finish_output2
      0.39 ± 38%      -0.2        0.17 ±  2%  perf-profile.self.cycles-pp._copy_to_iter
      0.83 ±  8%      -0.2        0.67 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.44 ± 13%      -0.1        0.30 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.22 ± 42%      -0.1        0.08        perf-profile.self.cycles-pp.loopback_xmit
      0.31 ± 17%      -0.1        0.18 ±  5%  perf-profile.self.cycles-pp.ip_skb_dst_mtu
      0.23 ± 21%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.31 ± 10%      -0.1        0.22 ±  4%  perf-profile.self.cycles-pp.select_task_rq_fair
      1.03 ±  2%      -0.1        0.96 ±  3%  perf-profile.self.cycles-pp.__fget_light
      0.14 ± 16%      -0.1        0.08        perf-profile.self.cycles-pp.sk_free
      0.18 ±  8%      -0.0        0.14        perf-profile.self.cycles-pp.sock_put
      0.18 ±  7%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.set_next_entity
      0.12 ±  7%      -0.0        0.10        perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.15 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.psi_flags_change
      0.40 ±  2%      +0.0        0.44 ±  2%  perf-profile.self.cycles-pp.reweight_entity
      0.19 ±  9%      +0.0        0.24 ±  3%  perf-profile.self.cycles-pp.tcp_event_new_data_sent
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.menu_select
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      1.38 ±  2%      +0.1        1.44        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.newidle_balance
      1.14 ±  2%      +0.1        1.20        perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.01 ±223%      +0.1        0.08        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.01 ±223%      +0.1        0.08        perf-profile.self.cycles-pp.flush_smp_call_function_from_idle
      0.17 ± 14%      +0.1        0.24        perf-profile.self.cycles-pp.tcp_update_pacing_rate
      0.01 ±223%      +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.native_write_msr
      0.07 ± 14%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.check_spread
      0.33 ±  8%      +0.1        0.41        perf-profile.self.cycles-pp.dequeue_task_fair
      0.01 ±223%      +0.1        0.09 ± 14%  perf-profile.self.cycles-pp.set_task_cpu
      0.91 ±  4%      +0.1        1.01        perf-profile.self.cycles-pp.tcp_ack
      0.02 ±223%      +0.1        0.12 ±  7%  perf-profile.self.cycles-pp.cpus_share_cache
      0.60 ±  8%      +0.1        0.71        perf-profile.self.cycles-pp.tcp_check_space
      0.25 ± 18%      +0.1        0.36        perf-profile.self.cycles-pp.finish_task_switch
      0.19 ± 24%      +0.1        0.31 ±  3%  perf-profile.self.cycles-pp.tcp_skb_entail
      0.98 ±  3%      +0.1        1.10        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      0.28 ± 16%      +0.1        0.40        perf-profile.self.cycles-pp.__ksize
      0.49 ±  8%      +0.1        0.62 ±  4%  perf-profile.self.cycles-pp.recv_omni
      0.02 ±223%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.irqentry_enter
      0.30 ± 19%      +0.1        0.45        perf-profile.self.cycles-pp.__skb_clone
      0.03 ±223%      +0.2        0.19        perf-profile.self.cycles-pp.resched_curr
      0.03 ±223%      +0.2        0.19 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.03 ±223%      +0.2        0.19 ± 10%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.44 ± 14%      +0.2        0.60        perf-profile.self.cycles-pp.send_omni_inner
      0.36 ± 20%      +0.2        0.53        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.08 ± 89%      +0.2        0.26 ±  2%  perf-profile.self.cycles-pp.rb_first
      0.12 ± 60%      +0.2        0.30        perf-profile.self.cycles-pp.tcp_rcv_space_adjust
      0.03 ±223%      +0.2        0.21 ±  3%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.40 ± 18%      +0.2        0.58        perf-profile.self.cycles-pp.slab_free_freelist_hook
      1.02 ±  7%      +0.2        1.20        perf-profile.self.cycles-pp.tcp_recvmsg_locked
      0.70 ± 10%      +0.2        0.91 ±  6%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.38 ± 22%      +0.2        0.60        perf-profile.self.cycles-pp.schedule_timeout
      0.04 ±223%      +0.2        0.27        perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.25 ± 38%      +0.2        0.48        perf-profile.self.cycles-pp.kfree_skbmem
      0.30 ±  9%      +0.2        0.53 ± 16%  perf-profile.self.cycles-pp.recv
      0.14 ± 72%      +0.3        0.42 ±  3%  perf-profile.self.cycles-pp.tcp_release_cb
      0.55 ± 17%      +0.3        0.83 ±  3%  perf-profile.self.cycles-pp.tcp_rcv_established
      0.99 ± 13%      +0.3        1.29        perf-profile.self.cycles-pp.__switch_to_asm
      0.06 ±223%      +0.3        0.37        perf-profile.self.cycles-pp.llist_reverse_order
      0.20 ± 67%      +0.3        0.51        perf-profile.self.cycles-pp.__wake_up_common
      0.52 ± 25%      +0.3        0.85        perf-profile.self.cycles-pp.__inet_lookup_established
      0.06 ±223%      +0.3        0.41 ±  2%  perf-profile.self.cycles-pp.llist_add_batch
      0.07 ±223%      +0.4        0.44        perf-profile.self.cycles-pp.__slab_free
      0.61 ± 26%      +0.4        0.99        perf-profile.self.cycles-pp.__get_user_8
      1.10 ± 29%      +0.8        1.86 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.22 ±223%      +1.6        1.78 ±  4%  perf-profile.self.cycles-pp.native_safe_halt
      0.76 ±216%      +3.8        4.51        perf-profile.self.cycles-pp.available_idle_cpu




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CF47884E
	for <oe-lkp@lists.linux.dev>; Tue, 14 Jul 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037276; cv=fail; b=V2RVqOcCaWryudyOLjktl3MUfsJyeZblAa8P9Ww7bzXOkkPI9nNeQgUVrnFk8WerEiobZlrNkeBevxWKCEkYY71AhGX42ENlT9rIf4PADFFaw8lg/JzYnEmVRwlQymdy3deS+s2pcoaa9iW6nivqmnh7u1jBEPQLSy81pGdi2FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037276; c=relaxed/simple;
	bh=jell8umKLGLoPuCeuMHv+onYOv7Gq7Y3W13NDq+W6Ro=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Z5m25UCWn6WmQNv3bgZUl6wR6F+qcyF/JbvpLpyfKSayYolrOO8Ymjou22TsdMeHGZtUuK9gwtUNCCOO3eM3mSD9GkJo6ll7Wd4xuH3uhPeReNB18nOy/z0VwtE7VUxnF5Ujs/OMXdidDi/uLe8zw+5Or0W2lbZbtCjUFQ/DVas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eyu5GFv/; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eyu5GFv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784037274; x=1815573274;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jell8umKLGLoPuCeuMHv+onYOv7Gq7Y3W13NDq+W6Ro=;
  b=Eyu5GFv/PG4tDcgLC6WvZLu00XCLlz0H82QSxiEPJU7PCQjGc1XoB4Cz
   l3NYw2NjEvg09D3X7btgFklcxE7YP29npeERc8GCvJr1aWnzfkd4YynbN
   F+Dde3ORx6ue/JQPt1iK1pXP3YTNK+kqKuuBgQXy6gm4/OFtaLPm99AjP
   6cSBT+bKK5OEJ9yml4GX9fPw8Oy9m6N1y6bfDOlGp21qQq1g2RxVLXRO8
   0/hle5XgIAnj9vipnGlPWbVfqglesCcYQA6Fu8Nh8UKRu14Qcyq+sUsNk
   45dlejMSfF7W2fqjoZrQu/6yJ+fVTsT8Kn77f/eU71SOWS99pyBGNc5P5
   w==;
X-CSE-ConnectionGUID: AfHmyEt0TTKwdGu2+M1bEw==
X-CSE-MsgGUID: RetJwZOCQQa1zihZ2WIjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="72182171"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="72182171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:54:34 -0700
X-CSE-ConnectionGUID: GJbGa7jLTeOsgsMynpyeag==
X-CSE-MsgGUID: vfpEvf5sSt61TuL1wcjxGw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:54:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:54:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 06:54:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaVbZWtBpvfPMFFXK0ieNesdc7rfJCNrcAu8fvpHcHIhOf8eFrr6KY5Faou3DKtPDIFo9vYkpHf+5aOe5U38mzN2KZzk+yxByS8SyE7jp5ltNhr1R7wwHG5mhOUU+9HKtjDrDObVh8OTSN5f3siEcdsx6/AEQuTrfTMTpMuQ8zNP4jKB8FQOXHzRZGDdjNRk6GrBezZoEJplOo8SyHqKgxeCW1JNkBILJRj6IJGmu8QuGfq4tfuMydtHQ3A/MkJFT9BmrldQ1lLNHse19QxgE9Miiqx64krwMqcDQFBlpmBPgJTHAm4QRP7ZzFQQRtqotMlR9hobfkH0zPmvR/dZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJanPM6gRV/68KiZaU4NS3ttfxMDc9dCJw8EkcPD3es=;
 b=CSr1VOTeIry2FGvMlh1909GKsb2cvYsIgVEdfggJTKA6iWvmq126tbQE3jtkV5nVU8MIw5m9+L1qBB18YXG9moMVOJ84FJTwDF9qEJ3pOKAo0LzLLPLnIia9QziafKYtLnjnjzXZJI41N3L+UxQ/VOHyiq0HMm0hYblMYDnfOjRVWZYDJFSVqaaqiOMKhOU+rXbFOj1EqyJkWBQvYi0t3mM2XPuBb0lmDci99h6BUvv+bdUQVOHHyKJC95WmilWqqw5ODpDJZhreMhWntlT3SD41eB5CHBf6zNxLjuP5f9g7jGXUd5YW6DC0FG9ZBfi//CvzBFWDqp/Si0GoGtyCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 13:54:22 +0000
Received: from SJ0PR11MB5815.namprd11.prod.outlook.com
 ([fe80::7c33:9702:ea7:13d7]) by SJ0PR11MB5815.namprd11.prod.outlook.com
 ([fe80::7c33:9702:ea7:13d7%3]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 13:54:21 +0000
Date: Tue, 14 Jul 2026 21:54:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/module-hashes] [module]  1fdeb8b27d:
 ltp.lock_torture.fail
Message-ID: <202607141502.24469228-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::17) To SJ0PR11MB5815.namprd11.prod.outlook.com
 (2603:10b6:a03:426::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5815:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: d84557bf-5fe7-4dd7-f66f-08dee1af679e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: miF9+mUTKSaFbon7337FQOAP9mB7de2QyNG0V/ur2tD0x0spmoqwjeEh3Ik9dPUGBas93Mc5MXOW1vKJVGIJyWTQUJoBy/lnNq36XoOhIw76fVuZAdCobnn6OGZH4AdXSAUA2jiThEB+aStJQ3XozoMwFg7N8AY1mAFc2jIP/vDfoSG+MjfOTOlFHGy/KMAJVBLB/l+Lc5cmgJzjpl7k3SVcp94wQ9HiIrEax/tNOFnH6+L33zd/8ltpnI1Rb9StCXpaeL0KHLCAsvjK4UQLCRW8ZvmPSZJAI/R7/4T78aDyGcchY7KlxKBeCHvQKMsTwLYT7eIj4/8e2Xfxlg4GWx6WcZzhMUfyFHpbI/PF1w+f4N5Tt+X80d1K691Kgza1aJjBIzX+9E2fRnFbGRQnPPFhUzTuf6HvE5yHHcsuujSLDKIstTm+69J+qmPtxSBiOEURsgV0/Eqm+IBbADqMkkKxTuMJWKpz8PJHk3SJUkD8N+nxb9GnfbToUhCEHIxb1urf6HjkiAfZvRxuiXM0CrfSidB2psW4GaD9q3DvllRe/sRsdU42B7eKjKsse/H5UVXqa/z5KKEi1p4LEmuOcU26PFzzcorbnj33NedYjgx5lbbOdAtPmNsro9kNzzlI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5815.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZhZEg5ajlLdHA5NTBIWG9iM2pJcVBVN1VFMkFsS04wZTZ6RE5TR2Uvd01S?=
 =?utf-8?B?bVl4cWtjangxdXBlRy9FSisxdDdweFRPa3dzTFlXL01BZkEvd2hUWG5hcnVk?=
 =?utf-8?B?N2N2SS9JSUxURTBkTTBJUGRkeTlqZnFxVzhld1Vyd3U1TC9xNDU2VFhDc3BO?=
 =?utf-8?B?MHp5U09LV3Jqc3BXNUZ3a2RjSCtkTWZ5SDFvM1d0QXBGa3o5cUVEWnduVy8v?=
 =?utf-8?B?b3NFckJkWnFscTNLU3ovZ2p3dnVIMkRiazg0eGVySC9FVXRGNEZ1S3VsWDd5?=
 =?utf-8?B?VWRwY2R2VFVBL2liOUhmSzdKZGEvQkE4ME1BOVVvMlJoOVJ4d1lNU0RnNTVV?=
 =?utf-8?B?N3BQMXl5UTRtdFBDOHRwZlVkMVpqUkYzYmZWMFVPdmYxZFgvUkF2bG1xU21W?=
 =?utf-8?B?MmQwNGJ6K21ocExGZVdoRVNGekxDOUlBQ1dGeC93c2JpRGFvOWdVc0xQN0Nt?=
 =?utf-8?B?NzV3TXkyZ2ZJUTR1WkN6dkJXVTY4WHlpSTNLWlpQa0ExM2pYdVF6dzJ2YkJR?=
 =?utf-8?B?K2N4cjAzNnhVbEEvbk9WcUtJelNtOXBQcnBwd3BLSXk1ZVh4eWFtbFIxN2kv?=
 =?utf-8?B?R3pSOWR6cktMcVhLclpQRTBCTlhUZzZUZmhLK2pQLzgzUHpEdDB4MTRDdm51?=
 =?utf-8?B?Ukt0T1c3dDBVOTcwR3BnQjBoS3dzYTNra3hGRlJOVjZnNEVvT0lROUp6SWRi?=
 =?utf-8?B?amJZL3pFdVZLbHp0WmE3TFRyV3V4Ly9ZY1prVEdTTTh0Y0tPV1RTRW9lZlRu?=
 =?utf-8?B?TU9wdWo2ckhjeFFKMnkwYklUM0tmaTZsTlRkeVQ2MWZ2QmdrQmlWeStyY0p2?=
 =?utf-8?B?NWt1MTY0U1pESDJvNUlmMDdabmt6L1hpMk1TVWJVd2hCcTJoa3A4bEVmZllU?=
 =?utf-8?B?T1VvM1VXZHF6RzdxQjhZdHdQTUdwYkowS1J0NVorSWRoamZwZDZ0OXk1MlhV?=
 =?utf-8?B?NEIrN29hMko2RzFIVlhRaENBWFZ6R2tQamIydVdhSUlKRFBjOUg1WTVWNU15?=
 =?utf-8?B?U1RMb2taNmhOcy9DTzYrVldMMDFQcVNpZXR5OFg0Q2lqVjB6MlJ4M3p6L0o3?=
 =?utf-8?B?RjQ5c0hteDhkTHdIMUxRU0VaQTYvWGpPWUxmM01sNmFUWmkyTFlxb0kvMWFG?=
 =?utf-8?B?TmYvdzV3cFFXYXpidXJuOCtmTEhVSmZPTThEaEdxWW9WOEJ5bmVJRzhiOU04?=
 =?utf-8?B?dnlwSUUzRUU2YmhjVFRtcG1VcmtJc3hJTDlzVktHTnFiMnBhTy9QODNhTTlq?=
 =?utf-8?B?WDNMaGpWMTRZWENzanBmclFSS1BhQ3BWM3FMaU85eE41a2lRVGIyT1Z2UXpq?=
 =?utf-8?B?ZVR2dGZWOGF1bkhUYTR4MWl0ZlFla24yd2x2VDBTV0dONldGTTRLUjY1bjJP?=
 =?utf-8?B?ZjQraDF6STBlNWRreE5LWDF4bEZaRHFpNnF2cmtmK3BNNVEyaFZqdzRZSTJQ?=
 =?utf-8?B?aFVOUHEydkFLSUlIMFpRSDgybzhHbktHdDRScDZnUWx2amUyL3ZMTlYyQ3Bp?=
 =?utf-8?B?ZTdhNFUxUi9XZVlyc1dFMElQRGF6VmxVeGVMZUNYamd5TkNhQmV1aWpNSG5C?=
 =?utf-8?B?QktVckxCbzRvWEdldGlvV0kxdjg1UFYweFJsS3ZhTDdNdXVuV25xbU83VGpU?=
 =?utf-8?B?VjFFUDRNNGVDY2ZZS1dRa2Y5ZmRHYmM4MUhhblBnQkdGdFRraDM2S2x5T21T?=
 =?utf-8?B?T0RPVVFGTFEzd1pBTXp2UC94TytZbTBFZTNXQVE2LzJ1VTJxd3o3bGEvTVZo?=
 =?utf-8?B?c0tSaDQxMFBIempBR2s2ZXgyeEhCbjg0WjFDZHV3UDVaSFRhZ3Q5cVIvT3BT?=
 =?utf-8?B?eTcwL1VUZzRlYkRURWZyWjFQWFpwZ3dhWkNLS3M3eVZNendBME1lS2g2Zkc3?=
 =?utf-8?B?UXJpQ0xMYk5PZ2xmRmNZRXJQQzc4cU5DMllsdnkwNzYxT2Y2VndzOXlPdUpY?=
 =?utf-8?B?MWs0UFRBcS8rWThqSEJHSHQwNklzQnl1eGNTZHFlNlFIYmdZUFRKVUw3Y1pp?=
 =?utf-8?B?ZXhQd0FiTmRaanM3d3NTbHRqSGdwZktSSEFkbkgyWnd0dUIvL0JlR0pFTU9Y?=
 =?utf-8?B?OVhDcHhERGs0R2VoL1FrS1N2YWQ1emVSaW1wOWlBNWxUeW44dFM4Ym8zaFhX?=
 =?utf-8?B?b2JTOURjUVMxblJzSncxWVNzWDhRRUVBRy9QS29sd3ArMGhjMEFybzgwU3lP?=
 =?utf-8?B?WDAvL1dCb1A0QjRPWlBIQWJENllvSXk3enVGSE55YUlRQy9oemdMTEF1RXlT?=
 =?utf-8?B?Y0xpZWJadE5yUmpTWklweTczTm5sVzR2QWVYYnRJVGNOZUVIQ0VuZ0U3TGRs?=
 =?utf-8?B?TmlCcEZ5bnAwb0x1OXorM1AzMkVXamRGdE5NZlJvQ3JqL284bENwUT09?=
X-Exchange-RoutingPolicyChecked: GCjpHxQFvRGebfcoFFMLLoxa5zo4QIvyL90gAl1erkbKjfINeSs7iMBk0378n1gzKTRX/VbYFUQyD4uJBDMlKWv2TbtPwdU7veBLFTAavbKs0sE/IWqIvOAJDe3dOLb84k6Is2A+37yZjJisM0/ecObuwgWH16pUDRINRhlZBzCf9VVOPayvqyqcPl5fsDh/L0ZVcgddwkdGSxj6qVfhpXjUfgSuQekRpgqlLRKxCDVvjWRqOarTo+JrqvCzsh6QqZabdGKozdDWOvgnd0n1wE25F999OruEC3JQeoHhn7gabRe814PjVbQeJA9xWkfHOsqiApE6qQPz5Byk85VErw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d84557bf-5fe7-4dd7-f66f-08dee1af679e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5815.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:54:21.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C76OmH65Taw/GoHUjzxwAFClYU/DBNN1+Ldeqqj1nHy6jagxGt35pQROcfwtN8NRexL7wHGG7dNbfU++carFQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.lock_torture.fail" on:

commit: 1fdeb8b27d0a69d9b8062f6776c5026abada40f2 ("module: Introduce hash-b=
ased integrity checking")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4=
/module-hashes

in testcase: ltp
version:=20
with following parameters:

	test: kernel_misc



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G=
 memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607141502.24469228-lkp@intel.co=
m


2026-07-07 07:27:29 export LTP_RUNTIME_MUL=3D2
2026-07-07 07:27:29 export LTPROOT=3D/lkp/benchmarks/ltp
2026-07-07 07:27:29 kirk -f kernel_misc
Host information
	Hostname:   igk-rpl-d01
	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
	Directory:  /tmp/kirk.root/tmpus1h83ua

Connecting to SUT: default

Suite: kernel_misc
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80
=1B[1;37mcn_pec_sh: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (0.=
206s)
=1B[1;37mkmsg01: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (4.834=
s)
=1B[1;37mfw_load01: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (0.=
014s)
=1B[1;37mfw_load02: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (0.=
016s)
=1B[1;37mrtc01: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (9.815s=
)
=1B[1;37mrtc02: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (0.009s=
)
=1B[1;37mblock_dev: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (0.=
251s)
Restarting SUT: default
=1B[1;37mtpci: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (2.097s)
=1B[1;37mtbio: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (0.002s)
=1B[1;37mltp_acpi: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (0.9=
07s)
=1B[1;37mcpufreq_boost: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m =
 (1.497s)
=1B[1;37muaccess: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (0.07=
2s)
=1B[1;37mrcu_torture: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (=
2m 21s)
=1B[1;37mlock_torture: =1B[0m=1B[1;31mfail=1B[0m | =1B[1;33mtainted=1B[0m  =
(6m 2s)      <------------
=1B[1;37mzram02: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (0.323=
s)
=1B[1;37mzram03: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0m  (1.561=
s)
=1B[1;37mumip_basic_test: =1B[0m=1B[1;32mpass=1B[0m | =1B[1;33mtainted=1B[0=
m  (0.021s)
=1B[1;37maslr01: =1B[0m=1B[1;36mskip=1B[0m | =1B[1;33mtainted=1B[0m  (5.082=
s)

Execution time: 8m 50s

Disconnecting from SUT: default

Target information
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80
Kernel:   Linux 7.2.0-rc1+ #1 SMP PREEMPT_DYNAMIC Tue Jul  7 09:08:41 CEST =
2026
Cmdline:  ip=3D10.250.17.22::10.250.17.2:255.255.255.0:igk-rpl-d01::static
          root=3D/dev/ram0
          RESULT_ROOT=3D/result/ltp/kernel_misc/igk-rpl-d01/debian-13-x86_6=
4-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/1fdeb8b27d0a69d9b8062f6776c5026ab=
ada40f2/0
          BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/1fdeb8b27d0a69=
d9b8062f6776c5026abada40f2/vmlinuz-7.2.0-rc1+
          branch=3Dlinux-devel/devel-hourly-20260703-172419
          job=3D/lkp/jobs/scheduled/igk-rpl-d01/ltp-kernel_misc-debian-13-x=
86_64-20250902.cgz-1fdeb8b27d0a-20260707-177688-1q1sa6e-0.yaml
          user=3Dlkp
          ARCH=3Dx86_64
          kconfig=3Dx86_64-rhel-9.4-ltp
          commit=3D1fdeb8b27d0a69d9b8062f6776c5026abada40f2
          intremap=3Dposted_msi
          acpi_rsdp=3D0x3f88a014
          max_uptime=3D7200
          LKP_SERVER=3Dinternal-lkp-server
          nokaslr
          selinux=3D0
          debug
          apic=3Ddebug
          sysrq_always_enabled
          rcupdate.rcu_cpu_stall_timeout=3D100
          net.ifnames=3D0
          printk.devkmsg=3Don
          panic=3D-1
          softlockup_panic=3D1
          nmi_watchdog=3Dpanic
          oops=3Dpanic
          load_ramdisk=3D2
          prompt_ramdisk=3D0
          drbd.minor_count=3D8
          systemd.log_level=3Derr
          ignore_loglevel
          console=3Dtty0
          earlyprintk=3DttyUSB0,115200
          console=3DttyUSB0,115200
          vga=3Dnormal
          rw
          keep_initrds=3D/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x86=
_64-ae4a01208-1_20260704.cgz
          acpi_rsdp=3D0x3f88a014
Machine:  unknown
Arch:     x86_64
RAM:      28236296 kB
Swap:     0 kB
Distro:   debian 13

=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
      TEST SUMMARY
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
Suite:   kernel_misc
Runtime: 8m 49s
Runs:    18

Results:
    Passed:   288
    Failed:   6
    Broken:   0
    Skipped:  7
    Warnings: 0

=1B[1;31mFailures:=1B[0m
    =E2=80=A2 lock_torture

Session stopped
LTP test details
----------------
fw_load01: tst_module.c:72: TCONF: Failed to find module 'ltp_fw_load.ko'
fw_load02: tst_module.c:72: TCONF: Failed to find module 'ltp_fw_load.ko'
block_dev: block_dev.c:60: TCONF: Skipped n =3D 8
block_dev: block_dev.c:60: TCONF: Skipped n =3D 9
tpci: test_pci   32  TCONF  :  tpci.c:71: PCI bus 00 slot 20 : Test-case '1=
6'
tpci: test_pci   80  TCONF  :  tpci.c:71: PCI bus 00 slot 68 : Test-case '1=
6'
tpci: test_pci   96  TCONF  :  tpci.c:71: PCI bus 00 slot a0 : Test-case '1=
6'
tpci: test_pci  112  TCONF  :  tpci.c:71: PCI bus 00 slot b0 : Test-case '1=
6'
tpci: test_pci  128  TCONF  :  tpci.c:71: PCI bus 00 slot b8 : Test-case '1=
6'
tpci: test_pci  160  TCONF  :  tpci.c:71: PCI bus 00 slot f0 : Test-case '1=
6'
tpci: test_pci  176  TCONF  :  tpci.c:71: PCI bus 00 slot f3 : Test-case '1=
6'
tpci: test_pci  192  TCONF  :  tpci.c:71: PCI bus 00 slot fb : Test-case '1=
6'
tpci: test_pci  208  TCONF  :  tpci.c:71: PCI bus 00 slot fc : Test-case '1=
6'
tbio: ltp_tbio    1  TCONF  :  tst_module.c:72: Failed to find module 'ltp_=
tbio.ko'
tbio: ltp_tbio    2  TCONF  :  tst_module.c:72: Remaining cases not appropr=
iate for configuration
lock_torture: lock_torture 1 TFAIL: spin_lock: , see dmesg
lock_torture: lock_torture 2 TFAIL: spin_lock_irq: , see dmesg
lock_torture: lock_torture 3 TFAIL: rw_lock: , see dmesg
lock_torture: lock_torture 4 TFAIL: rw_lock_irq: , see dmesg
lock_torture: lock_torture 5 TFAIL: mutex_lock: , see dmesg
lock_torture: lock_torture 6 TFAIL: rwsem_lock: , see dmesg
zram02: zram02 1 TCONF: The device attribute max_comp_streams was introduce=
d in kernel 3.15 and deprecated in 4.7
aslr01: aslr01.c:159: TCONF: The largest dynamic library is smaller than hu=
gepage size, please use LD_PRELOAD to add larger library



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260714/202607141502.24469228-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


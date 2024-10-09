Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86D17BB06
	for <oe-lkp@lists.linux.dev>; Wed,  9 Oct 2024 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459537; cv=fail; b=JMroe2iwiYlW7BJAPOLCXSiyhAR46z9ml2OJ1pwZme3tRll862mqzmEZxder6mek+voFzzO+lEli7MYX8L9dtUXZS/JNq8lZPqeyX/w1xanHtApJABAdUO30at8lic6oxS93VBbmRDj10bUKvf/x8H6Gkt1aHQUlA01BLqZIyI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459537; c=relaxed/simple;
	bh=N4SimSXxFruBxPDlEhpU5PuqrtG4ttrt074+QVZnvcE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Z0O8qrbeQ26SkUu45eNcy7iQLZc+Djn0VWQwFpTGoWIQVQUy44sZnWfCOx531YAsVQWrQeN0ZkgpWtNmwN/1FHzBx0hsaWI9INpEgVH15QHtNMmkHCdZ1DnU515mE7wYiq7/F1Ge6UvvHZF1Fq2eqEHHECYTjQh/Ws6NfXXBB7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd6Hf1gx; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd6Hf1gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728459536; x=1759995536;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=N4SimSXxFruBxPDlEhpU5PuqrtG4ttrt074+QVZnvcE=;
  b=Jd6Hf1gxJT1RGPcCQA69XmUZmGxO/hA7boO8CnX8O3qUWoUtV84UiTkh
   YZx4cOID9rlkL6ZHchutu4z/uM8M7uya/V3CRINjPa7jHMUsDFpgDrAqP
   TWJoqhrV1mRkf328pbmxdhhx520IdCFy7fjhSAplxfJ31lBKPmVYKj0bD
   zGe5/IywqhthPpLG+oiLOYK+NqQDgVwj0pKDlYTnpgdRrZYaPJ8Ub/eTl
   lxPALalApIBBn6ATU6OGKuH5MBJh/p6Lqh+w2dif3H6Tzwwv67gkQdYMg
   a9sOqgZSRCcR/+q/kKWvDK2ApQrxKk8qE9kD+fpBcVftghzIRrpdeEr0E
   w==;
X-CSE-ConnectionGUID: 9NBjoiC8SDObCNrBhxJHfA==
X-CSE-MsgGUID: jZxXci0AT8mRl0hcvFnjeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50276484"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="50276484"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 00:38:55 -0700
X-CSE-ConnectionGUID: wIoUR5iORgupkxBzUTu0pA==
X-CSE-MsgGUID: aTOkULs6Q4S5SiDmuU6r3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80672850"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2024 00:38:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:38:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 00:38:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 00:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSNqzs74x/8S9PUVqe7Oni/RkXak0gE2YhHacNzs4Z+h4Jgb3Egbbvc5Yy+V2avlnS5Q4YCD6B8BjzYNy/Vct0I71jkbsB+UF71nezy3liilKkSbmQUqjQt0IlCssLyaoOs0ta4wtXDf1LTS0EpvODOeFVgcTdf/tXvTNPvkdbWKO5reOewu1WXi9M9NB0oNdp2EjANGAfxaq8Z/3ydICVTG9Bl34stkUoysvOx3ciSYMiYInQfzpwOMikYxe9REFTMm4kKHtSUm1iL2n+l/oH8aeleB5SlnbBCOcj6ZO217gejKVS6BI0A+e1VLNpozao//Nos3n2X9oUzP/oD+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4SimSXxFruBxPDlEhpU5PuqrtG4ttrt074+QVZnvcE=;
 b=qn80MEi1MSDDo3kM3HEUgS0Ncx7awVQI/CdRzCcKQ+/QPpwY3QmowmxhNGZM9AfsvFIJkaH1SZ40h6KTIKkKQWHhQBpks6PR+hbxJYxbMU21O7B0bOIkNvrhE8MouTxpMeDNudMQ8kKYX8hw8krNoZhPMqUNI+i738kBQeQIv1qvnxH8zQsKHhQvWj3OPXPhbYevTUli58fZ+pyEpQoWERIVwoAwHWz9xNuf1qMmTWz+pWUjhWjUzMqn/HAKfM3o5bRkK/ku28yhIYvtxqJmJUwK6dVbzUG1IW2KrIo+FGyZ0FdjAbq47UPfrJO2eKrzJv26wbeDBgdAJwpKAO6ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 07:38:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:38:52 +0000
Date: Wed, 9 Oct 2024 15:38:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Xin3 Li <xin3.li@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [xinli-intel-fred-public:fix_sp_calculation] [KVM]  cae69f2ca7:
 kvm-unit-tests.vmx.fail
Message-ID: <202410091517.b899eb28-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: KL1PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: f31247cc-d983-403a-3cd8-08dce8356bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M1OixOTOqKQ6M+jsCkcTug+lc5J9eBP3PQbCCZoNj+egehWhwj7gOyVYaRbF?=
 =?us-ascii?Q?xjd2keNM2r0L5OnHjdAPbH+y3uBSXrItKvxlZQeWBttJI8AFJGynMjzOSh4w?=
 =?us-ascii?Q?yyx9uSFqnRvPSfpHKePwvFmpXcvVYeVm+4DsGgiNfO/Uu8iFBoOWJOB6xaMc?=
 =?us-ascii?Q?4EB2Q0GLjDrfeD9tvayTyJvqOvx1oNKee0/1tCMtxXeEeMo+7Nm1phPsv4Ob?=
 =?us-ascii?Q?klAo4smUtdAudIkEMpI2xRvyWA4aFjz6/TU4DKA4wcHrMCaJSq4HRMeoEZJn?=
 =?us-ascii?Q?Q5yzUbtSq0qz0OaElKdduD8TFuqWy0bFmu10FA8skH8LsANzuDdRsW33DAhH?=
 =?us-ascii?Q?TleKH8mplPQ1TrkZjYqh1AkepFYXjE4H+K0X57M6JL+oAQ5tmgY978SOQknw?=
 =?us-ascii?Q?DUCATadMOi7dDm7rRT5uFy3FyWmq457Vpj8406AjmHhWu2ca2GM07VDkyxxn?=
 =?us-ascii?Q?XFhmKVBtORT8bYcFzBGWiZ3KdUUp0O15OGS0FID2mfeqOPXO7EdkP5YrQkdR?=
 =?us-ascii?Q?D9zUJ5o+BJSD1fthydLRq0NOgqMVNjZvyCoYdn7g9H1i30UDb1EzwyX612NV?=
 =?us-ascii?Q?oEL3Asbe421O/le6W4HCwTI5Qiph2jzE6zt3s+mRBo0Xvn2qRZdppeir7ERm?=
 =?us-ascii?Q?ypkssuGex8u4o5aMotfzBMbV17PJiK+eUNEawXKWzlxucZxda1HuWySnDjlz?=
 =?us-ascii?Q?eMJpT4ZlENuhyQB3gz6sf0oItMs7lIUolCniuN1gfP3lijwfsaqVVYtBvJ1N?=
 =?us-ascii?Q?5b11r0wKszZ/H056DyVCXfWgrzKQm24RbvengP3apMsdD3nRbELpKwlnIIv0?=
 =?us-ascii?Q?iHhJm0I5/qRiaO6PWiA40/hiEi9FTuENo44/eKO8QNTlAPlUmiSgscqyk8H6?=
 =?us-ascii?Q?/FwvLN/1lPQ+EycxWIcwn+5gDMn7LFzrDqiu6efy7d6eAPkRRm0XohnIfjsT?=
 =?us-ascii?Q?meG9fw2WRhUlLgXlW6iErQd1zdOV7XNEuIFmVmY1ibKD3I1zqgr2m3vDyaMX?=
 =?us-ascii?Q?/Ca9da64nCbnS0SqZpJSxpr77PaLhtpI7jKE575TnfXuSGhbvz+svqWdsgEt?=
 =?us-ascii?Q?CnOsv6WWdRpfh3uU7pRp8rPt9TFWe/VQQU12zJLNFDaVpe+EvxIQHnKoh52P?=
 =?us-ascii?Q?J+zZE0obU0ntJ+DVv0YQhqvwJ/wFjaLaX4DeVF9pL1ldC8FJUQg9mA2FWm83?=
 =?us-ascii?Q?o8MrzSdHRrWYbyVSnzkvBMi/7urodHfJ445EqJW2C1ZKYX80Vsv4MIGfXBcN?=
 =?us-ascii?Q?Jta1Vr/9N8Cts0edmBb9qZtP9s/pbrecRWSxgz1tVBI79EBVWJQEnPAkNRVv?=
 =?us-ascii?Q?lQs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTsM3wrL4ey78TXn7nlZTgjugbEgb1zaeG1DiTcc0ar689TPoCliSWDN4cAY?=
 =?us-ascii?Q?QK0v8AnOWq5Wq/ZjGSkwC0V0tJzSpBZQ480uNGcd5PfPwKRiJo0luslz3P2w?=
 =?us-ascii?Q?Y00WxKXhrR92a/bYaUep1q/k78zcRgdOFQAXuo6oHbcwkCluvo9Apk5b3N0S?=
 =?us-ascii?Q?FeVy0qIXoA1JfXUiJtuYb78osV3kOp46RpsJv+e8hmIYANAcky/MkKxV+qY5?=
 =?us-ascii?Q?YQf/ZmjhLSlKdC35zFXKi+SIL5ZqIwRwVtdhWBVK6msQLu0muzDtFEDWwUa1?=
 =?us-ascii?Q?IM6TcOvvO6rzcGB1P3i6uRHGezWgxVTeBSGD2dfc3rSYG3JsntirtVmIvSLZ?=
 =?us-ascii?Q?HUxXBLVPsEeDGRAw9fxSD3k8ZreJKGtcLvXjbXJrYDKYuYTpiorO5WHKR6t5?=
 =?us-ascii?Q?vo4ldtmTEU+Y7KZF///ROasBFtoIUqWgV3cbeFBQzZRsXoqZlhVwbfahYMkj?=
 =?us-ascii?Q?4korLJfj/3BrisI4AYdENnxMTadb6EocmZ7W4pzZRucQtkh1FjjexU2Zf05T?=
 =?us-ascii?Q?80Aj7LW/2/1mai+analTj7JMx97+wixqeE2WthB7zB+fqNtyabLVHF5OLN3w?=
 =?us-ascii?Q?+lq+RMqn7/Xuvg/8Swt0zSr9QXlAdeT5Hf0DAnYBF505h97w2J+cZ72hHku+?=
 =?us-ascii?Q?w1kGefKWuxaj3raNjiEX8Las2t6+/Vl0r8A+G8MfmGle/+wRdOMrAnr7YdVF?=
 =?us-ascii?Q?XVSWOQQdZ71A/ksKPXMmeqLSVXSZZ4HyPfUMLTk7Zz8XMmGV8uBE49KVQZr1?=
 =?us-ascii?Q?t0TTlM7HxCwn6PZ+KGsVCa9yZ4tP0+oYA4MrSXNFtaHUETjuFVRUROymxldC?=
 =?us-ascii?Q?wiL8UEGyIPFrMrQwzHWZrwBejDPAOd+4TbG/XXrAsstoNcbRGCtjyVl22Vda?=
 =?us-ascii?Q?wMDsLOzM5Ggt1sQ3hQpYr1K9qH2Kxjh8N/bxMcCld/OQHiTAWSUPx929e+xH?=
 =?us-ascii?Q?v4W2bt9wdm6+VQlWLe9IrZcWVv+Cw3L4wJPDm4Du+CN4wN7Krehu2frqeSAy?=
 =?us-ascii?Q?cMl1XkjKCFLwl9pBD9iGOdJzQvdCk1qO+keNflQzvofjXQ6KuUtPrSLgGnKX?=
 =?us-ascii?Q?XVNRfXIXyyuvOKfSXKPxxAn+7cANdDRgUjFLMRBFn5SvrMEGkB0MoVEI/YYc?=
 =?us-ascii?Q?3Ds84mn0hsx9X78y0q+5tgRLlPsGBIWrHfhMehp+mvu+ECKLSsyh0A7mh/Ak?=
 =?us-ascii?Q?BHw7wKNeha6T3bnix0nJxTTlNhi2Jqba/8ng3wIq4y4DCUWcSv0uXrHyY1Ld?=
 =?us-ascii?Q?c8pnB5w8m5MX4vuhxqYFYOiLaboTnW284qOtLzDOsMIRDbzHOEdkQwE4X95o?=
 =?us-ascii?Q?Z9vj3OGgAeJleqmz0e7mFuhkBErD3o8tzBTr85bFF8b/bHjFnJHDvIwzpoqB?=
 =?us-ascii?Q?CVwJuQWQjffOAEugtZn6pRkgfQBOKfKxIvSi8igAGxU19FkUtGq8dZTjO7vc?=
 =?us-ascii?Q?Kd/p08T9Ij4Aima0sS8RVx3qwPAvB1m5iVbJ1BEKTqLLXiqwd2XXRapm3ZKd?=
 =?us-ascii?Q?bAvRJ+D4Y3VSexGGnmfR++2KwEecH60PNL9C6KP0W/Vxntg6+eoYtyUzOgja?=
 =?us-ascii?Q?yp5aok9PVPXLw4ZT+11Kf9OHyZi4RVFkLXZOfTCsaaLZAt1gihAo1AisbV4+?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f31247cc-d983-403a-3cd8-08dce8356bf7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:38:52.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1b1PbxaJDQdIhzYwOap+mhjwOQECNtWY+Lm8AzuugxJHV5dV5zKTsHb/PqPRO1szKUDVP1YxGB5MHa/InAecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kvm-unit-tests.vmx.fail" on:

commit: cae69f2ca7daf587bc5b9369193a3aa056251164 ("KVM: nVMX: Add support f=
or the secondary VM exit controls")
https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation

in testcase: kvm-unit-tests
version: kvm-unit-tests-x86_64-8d615ae2-1_20240830
with following parameters:




compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphi=
re Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091517.b899eb28-oliver.sang@=
intel.com



=1B[33mSKIP=1B[0m la57 (i386 only)
=1B[31mFAIL=1B[0m vmx (430081 tests, 1 unexpected failures, 2 expected fail=
ures, 5 skipped) <--
=1B[32mPASS=1B[0m ept (6564 tests)
=1B[32mPASS=1B[0m vmx_eoi_bitmap_ioapic_scan (7 tests)
=1B[32mPASS=1B[0m vmx_hlt_with_rvi_test (7 tests)
...



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091517.b899eb28-oliv=
er.sang@intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


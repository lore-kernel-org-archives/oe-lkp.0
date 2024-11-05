Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031031FE109
	for <oe-lkp@lists.linux.dev>; Tue,  5 Nov 2024 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791665; cv=fail; b=LR52TI5tCLV7fjSzTccUmKPTIBFVSjF/9RcO71Rh4jT5SILpHb1KpkY7V5P5XvV6Giumr41h2eP8SAhASKSQZQsyQr0Hqa5OYLPeeEFl6fTdL5RG84kbIXEtBs2uoVgIUS8vwNA24gixaBbcqzk+bFOry004OjDqQFEa0O/GYH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791665; c=relaxed/simple;
	bh=pjtxnErIz7gYeNa4FguFyxKEN5zCykj6WkS6lSwj5Aw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=I0+WnvdBLQRN3DyDrTQUM8TWzBoEAbnoSTJixSSwNq/S16y3IWtRKpBPWE3FuZKEQ1qcvm1GDwxqx4oVvjpt8qh4s42t5zWrlkcWXHa2WEECW5Ak4U1EXFa8QLFaLkAeR4tQR3R7D55Zpl255CEGqrenRt7wo90mXcopiWlO330=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbzmNgxf; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbzmNgxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791662; x=1762327662;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=pjtxnErIz7gYeNa4FguFyxKEN5zCykj6WkS6lSwj5Aw=;
  b=kbzmNgxfgh8WVj9EWD9HjmL8kBv6gg2Edf4pZ0GPpdG+X9uViUcQAfql
   oAezQ3R3Ttxam1zsLgLX1dHJmgTokNbf8GhcnS4Cl3mUsKc4NEFDdOhfi
   BWlp0h0KpUF5S3X8wxblTpKoIuEu17XT8O1nVPmEm4xhVigvxqgeQ6/nl
   xWctMOrHwuXlb4UHqdCz4uoGCZn4JEV0kJngmOiAzarpB16KKGhHCdxeo
   r8K8A+gCeEt0wR+poaDYhjzpAeI945a2n8Tp+KoHZajeHSxY8XzFUwZnj
   afHHlHCyf/KaQqIJhjoKzILT7ovSnIPkU6ZB70+zz6ZUpwkFL7J75RqNc
   Q==;
X-CSE-ConnectionGUID: fbn0HLzcTc2UAcLcjBRYLQ==
X-CSE-MsgGUID: TIuWOhkCRBGd7gbiOJPJzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30368803"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30368803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:27:41 -0800
X-CSE-ConnectionGUID: OkzcnSq/Sv2oWn/MXfwMIw==
X-CSE-MsgGUID: sSzAJO9ES02Pn7ajSkLtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88472885"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 23:27:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 23:27:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 23:27:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 23:27:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeZCWkDyL7LsBx32KCZsNMryqDWfnWXEx8bhAau2/jDyqMP0OwUlScSu143WmHzICklZGXfKeGU0VoUNgEDdBxznhLj92vqz8OI/iAUjpLDw6KgGfHhU4OfQ/cJNUyy0Eth0Cb6GK2s73j3bIr6rT822yN4qtM9AiQDTsaqDGaauOzwoijqVorjff6AN15LABhkvjS8eV7JMKVzeH1ZMTUytFZUnBpvIQWL0uv3q64lI4rWipI9JUgPRlVsQevockMGhJenxUVBi2Q5X64x3h9YDInFtZiJhvePNVl3zTquZdtFA5vfN1kiXOmu/mSV3cRKEmjYdn1yo3K1Y21esWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nWF3+X582jqow1X3aMRTjqHPdgOgg2GI5BoMPsz5A0=;
 b=fmGR/aECkrWRyqJe7QsYqOY+wNupBXjjjnAX0kaoeOvgipgmfFxa14zqRdGcYx5aQzpWGvwRgj4jeTlREOJp5j/G8Q9SZk+u0aswCFsGJHUex0qwxEhHcD21YXcOLwjLY6WOh0GBePlsizQOdLTy0DPoto6jdxFCkk2Qe2zx/EskYSSj2vBgod4G2ckWxqa4LJ+ap8rIb01xeK7wikGRgOsE7O2GPUhHj57bmsAQwRSI4WiVhgwQrWmlvAMErfUhEyWuiM1fSpVxhHld06t9pwNpPwPhgIveclXBGU2ijbEuXx2A2hfjOFT/NVvGTUtExsWIMup2UZyeEPs/LI48/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 07:27:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:27:36 +0000
Date: Tue, 5 Nov 2024 15:27:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:kthread/affinity-v5] [kthread]  cd28de79b6:
 stress-ng.priv-instr.ops_per_sec 4.9% regression
Message-ID: <202411051514.5ce58505-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1217ed-8110-4e01-e287-08dcfd6b51cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?54hE5/TBBggOOVeUxaKQEJi9UhmjjOg4UIp9IbiUS+n89TnbY3cmWCWcML?=
 =?iso-8859-1?Q?ErCKo+jYKpYvW54aDUnI2qtAKrrp1Ch7jMwKjOUTkpjcGfsdI3vE9RPDtf?=
 =?iso-8859-1?Q?OCJDoAXfsz8/Pr5Do3dcfhXAjmTd7mzPqly4QYDhVDJO83YBYLGYxRGydj?=
 =?iso-8859-1?Q?XBkTDsXawE4HzYEvYx8CAOdy1dexZ+m8s90s8Q2PLvL6FxZXZSU/dMAg0X?=
 =?iso-8859-1?Q?+Kgj4RJFp7bf+OrR5yIOW8+olm0eVrOf+8J1L11Kivc+ssdyp8RksMCN1v?=
 =?iso-8859-1?Q?fOC2rHWESuTCw0VB/dcQaluV/eK8jHFJXiQCZflZFSrUEN5L09Vrw/R+IT?=
 =?iso-8859-1?Q?7YfvAh2p39SpEGelhiKeeL/w1dDb2TPJdqCJbeUDLFe90RTgNX+CWwLdql?=
 =?iso-8859-1?Q?GMYVzSpq9xu1UmGM06PH62RAj4Sn3WnSNVj+PlYM77w3riY+/fOa6xZ2qS?=
 =?iso-8859-1?Q?FoBQm70H2JL5MT6jGtyNKnKRoSYr/AFOGg9jjzzT7V28NX7L8ZZAOxsrxi?=
 =?iso-8859-1?Q?TM+JmJgl8pFFJuqLBZH9LUKfz/4W6Wwe/lDBDQUj5WX6yc0/x1ZI55BfCY?=
 =?iso-8859-1?Q?4DG5BJHDa3U51zDtvnFU4vEQE+jXctXyDkUBKunGXUEG+jyQmRq+OHmgcl?=
 =?iso-8859-1?Q?0jdznQnQpgkGxD59Y6sTpqMdqkupYwWPfBc7TvOlZO2Z8J8deUa+ASuVMW?=
 =?iso-8859-1?Q?j8n2zGHL8o9wHSDBgycRlSx+unxQTH7Cy3nL98hpXJ5r/8gyrtEdOZmdbw?=
 =?iso-8859-1?Q?/faARG20fBX4oIUnL7B5xTkR47wI4zX8VZS6VtvGkGXbBA8+V9/jfYYVey?=
 =?iso-8859-1?Q?dcvydr9feX0bT0PzXT0KooQspu4KTvzLLHTVXfrvHdOzcds7VleyuZEZGC?=
 =?iso-8859-1?Q?RMawBt2NRmUL1+3EdUUvJ/MqYwWD9X3R5Km5PLVU9mj0f28oU61q8MkiB/?=
 =?iso-8859-1?Q?lDQU4o1Hmm6p5vG4DrWu/1gTu0YgnL5UHU5olPKdRGhz0Yq56RHcgMIIAX?=
 =?iso-8859-1?Q?pSk4rAcccnrYuW25VuigWjHpiRi1iYE8qKKMo9FCktPveiYTS6zINVp8Up?=
 =?iso-8859-1?Q?Mxv9Yz/2Yeqfp2yAzt6xInvFk67DqFQa7nfDnBZNcY2Lljrgcptiql901l?=
 =?iso-8859-1?Q?SiegcSjxZ3QKF69StIh3ND6sPwSNsUgMpFJqmb5QGLxWEF3hGt44xUGtED?=
 =?iso-8859-1?Q?u4yy82W8ZxzbhGufO5Be4/LOoOojJ9HxyXcGyrTELb2JAUDpLm35mk/I5H?=
 =?iso-8859-1?Q?JK7TEPteQUpfjRgy+2Cb5tMNAJlsXRyE3RMacRt1OjhYhb4c+LdK+0oNTI?=
 =?iso-8859-1?Q?Kw9/su4AK0Hyh5AjlwVQzrG8gA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4arj3EFGPELBuB+/ggJGL1hvyaHdH3hyioneVn+N8G/VEnJ8tYhTecG8lw?=
 =?iso-8859-1?Q?v43+FrU/LSZEA+I8FidnnB3V94w9qKEMrMQkdkO8iNRs+sdGzhVLXxQUAI?=
 =?iso-8859-1?Q?6mq6i19wLwJzW/Sw6i79vyZsHV7CUpFPmXic3MirCsLQQpQq2uUz73ywef?=
 =?iso-8859-1?Q?8UJ8lU3pbI6sNdMza/2zr9u+w5COvgW6e0GeSOkE3qKnMDGuzFAuUoJOwC?=
 =?iso-8859-1?Q?BbrYtYTSEFdk9Ilvx3w9LKC0GTaF27iv5ZBLXIzn7cbTx31vwgyxIx72NL?=
 =?iso-8859-1?Q?blrZbZyIh668KU7MKb5eguX0003FUDmR+kqYScCqnsCQy5g68mGsKv9qtB?=
 =?iso-8859-1?Q?m9QLALK4Sxqq2tJYdzZYZCRcERw3tS+dTibTskrsQDgxvQXmID8tW1R0MK?=
 =?iso-8859-1?Q?RfhIIP2a8Wy5Bo7vx0j7g6qbK+m75QcvQ4JFzXzHWRkDcPA7tPUk2Opl75?=
 =?iso-8859-1?Q?VPxb7TmQJFUjWrFFTF/3b2AzNWmvobbHZk7VG6B7zKrzOtRnD+egL/NXQ3?=
 =?iso-8859-1?Q?V6+Bd026mv9NUUxIx9XmGRrT5RIYg17s2mirmLKebwUMR2BQxysm08fWh+?=
 =?iso-8859-1?Q?sj0SNJQFed9SdngxQOOsxxz3Jzf/xstNxkX4/r7aI9mgU6K1rokOAj5Hfz?=
 =?iso-8859-1?Q?/LXVXOiiaB9jEI9R8mrbHmdCLGnPqOVUeLFlQwY5nz4LM/sLtonxYPPqlS?=
 =?iso-8859-1?Q?lmCND0+/ymEA1B+MP0ghxmOf0oWj10Jibw6FNpcfAM9xJD6s9i39nN+au7?=
 =?iso-8859-1?Q?IQdMgXHSroY3O8TzcWpOQhov1JjGC6rtKDljzunzOLGUQLnk2hIBS+dpUq?=
 =?iso-8859-1?Q?UCednWcVKmEpvuWVAwQx31yDDeeC7b/jYxfIiMXEiwm5GxEF9prqnTm7UA?=
 =?iso-8859-1?Q?Q651dATN+nLDdi9Q77pitYtXhGj4g/ysCk1EXkJpY/LpLeBaNUVok2Z0Pb?=
 =?iso-8859-1?Q?+W6YFutr84vCa4f9T81BdTZJaR9FxpyxAS4+3zsvoOEhUb/lqRnl1gSBbb?=
 =?iso-8859-1?Q?qVjmnJrLfLV1uHfnnOSDC1Qlr4Yjk0hvzwnUkVzL4vsv5WsJcX9ycODmUu?=
 =?iso-8859-1?Q?K7jyKmjyYGUQlTdMFiIyi7b7Ykpx+K8IAhvvaTYyDfEAT+VABuugyfdrMW?=
 =?iso-8859-1?Q?QeMf+FOChtNNu/fmCVHFeG3CWA21Co/s6AkQZgKeDy1xpFLSK3WO5hqlT9?=
 =?iso-8859-1?Q?9o1ReWnJjgRa4kXVXeeTbuRYi9AOx1WD/Rlq7sDjBYJJ2sd6UW+15JTKv3?=
 =?iso-8859-1?Q?8cLCXB/mu8kbaKEPQAbbut21ZHf0h7cCkD44066MkZxpnEpbDtLfLQaTiw?=
 =?iso-8859-1?Q?dKwUIaAOwbvSDBhnHR+bfdzD9y5bewntSoNZqrrDe3iLc47RzD6s9kOOjE?=
 =?iso-8859-1?Q?XsOJiKChKOBgmXqNtz99N9YucFdiNM+E3EZn2loXU5iMbKunJkl3LDMvsq?=
 =?iso-8859-1?Q?Sx0EG1NEp42GFf4LYKiBI1HFVpJfl8bztQbZlemjrG+OloiY67VbseG+n2?=
 =?iso-8859-1?Q?3sov/ExFWn3VC5iJqkYt8ZE6JhxNdnG/mwcany52ht+B1FDBFzEGUxFdqE?=
 =?iso-8859-1?Q?pWDhMnzJI3sJWQcsHv0ppA+Bw8qlNNYzv/OKA78bYdl6sqak0JlslQrnwu?=
 =?iso-8859-1?Q?sQenyM6JBpCjiXr1C3TdRnf5VXxh/6/k+7W0xbVdsleFbqc5qSLkngbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1217ed-8110-4e01-e287-08dcfd6b51cb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:27:35.9607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc13XmaJJCUgbw4Ggf08vTJY9wC2P9CDoLpvgVve8zZGk8WllE/BQUtVNHiByzsb6KvdGen0sDRgB+aYkWq6oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.9% regression of stress-ng.priv-instr.ops_per_sec on:


commit: cd28de79b6107158b9d3390eaf829ed778e6d839 ("kthread: Default affine kthread to its preferred NUMA node")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity-v5

testcase: stress-ng
config: x86_64-rhel-8.3
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: priv-instr
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sigsegv.ops_per_sec 4.9% regression                                    |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=sigsegv                                                                                |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411051514.5ce58505-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241105/202411051514.5ce58505-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-spr-r02/priv-instr/stress-ng/60s

commit: 
  f92d081a18 ("kthread: Make sure kthread hasn't started while binding it")
  cd28de79b6 ("kthread: Default affine kthread to its preferred NUMA node")

f92d081a181fa4af cd28de79b6107158b9d3390eaf8 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    810828 ± 10%     -10.2%     728220 ±  6%  proc-vmstat.pgfree
      6162 ± 15%     -49.1%       3136 ± 53%  numa-meminfo.node0.Active
      6135 ± 15%     -49.3%       3109 ± 54%  numa-meminfo.node0.Active(anon)
      1580 ± 15%     -46.6%     843.93 ± 60%  numa-vmstat.node0.nr_active_anon
      1581 ± 15%     -46.6%     843.93 ± 60%  numa-vmstat.node0.nr_zone_active_anon
      4786 ±  3%     +15.7%       5538 ±  4%  perf-c2c.DRAM.remote
      3702 ±  2%     +18.1%       4372 ±  4%  perf-c2c.HITM.remote
     62.38 ± 20%     +58.1%      98.61 ± 28%  sched_debug.cfs_rq:/.util_est.stddev
     25493 ±  2%     +30.1%      33178 ± 32%  sched_debug.cpu.clock_task.min
     30717            +5.4%      32383        stress-ng.priv-instr.nanosecs_per_privileged_op_trap
 4.294e+08            -4.9%  4.081e+08        stress-ng.priv-instr.ops
   7156044            -4.9%    6802200        stress-ng.priv-instr.ops_per_sec
     21.95 ±  3%      +1.4       23.37 ±  3%  perf-stat.i.cache-miss-rate%
     20.02 ±  2%      +5.6%      21.13        perf-stat.i.cpi
      0.19 ±  3%      +7.3%       0.21        perf-stat.overall.MPKI
     20.41            +4.8%      21.39        perf-stat.overall.cpi
      0.05            -4.6%       0.05        perf-stat.overall.ipc
 5.698e+09            -4.0%  5.469e+09        perf-stat.ps.branch-instructions
 2.979e+10            -4.0%  2.859e+10        perf-stat.ps.instructions
 1.893e+12            -4.3%  1.811e+12        perf-stat.total.instructions
      0.73 ±102%    +136.4%       1.71 ± 18%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_fault.__handle_mm_fault
      3.42 ±  7%     -46.3%       1.84 ± 60%  perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      1.80 ± 12%     +26.5%       2.28 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.91 ± 60%     +99.1%       1.80 ± 25%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      3.16 ± 13%     -25.0%       2.37 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.27 ± 11%     +42.2%       3.22 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.47 ±  6%     -22.8%       2.68 ± 21%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.57 ±129%    +185.4%       1.63 ± 62%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.73 ±102%    +136.4%       1.71 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_fault.__handle_mm_fault
      3.42 ±  7%     -46.3%       1.84 ± 60%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.91 ± 60%     +99.1%       1.80 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      3.16 ± 13%     -25.0%       2.37 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.22 ± 11%     +44.9%       3.22 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.47 ±  6%     -22.8%       2.68 ± 21%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.53 ± 10%     +16.4%       1.79 ±  8%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    169.64 ±218%    +197.1%     503.99 ± 99%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.98 ±  3%      -0.3        2.67 ±  4%  perf-profile.calltrace.cycles-pp.pthread_sigmask
      0.99 ±  3%      -0.1        0.84 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      0.93 ±  3%      -0.1        0.79 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      0.78 ±  4%      -0.1        0.66 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      4.04            -0.1        3.92        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_lmsw
      4.04            -0.1        3.92        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_lldt
      4.03            -0.1        3.91        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_mov_cr0
      4.02            -0.1        3.92        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_invlpg
      4.04            -0.1        3.93        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_lgdt
      4.01            -0.1        3.91        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_mov_dr0
      3.92            -0.1        3.82        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_wrmsr
      4.02            -0.1        3.92        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_clts
      3.93            -0.1        3.83        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_rdmsr
      4.00            -0.1        3.91        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_invd
      3.92            -0.1        3.84        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_rdpmc
      3.99            -0.1        3.91        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_x86_hlt
      3.56            +0.1        3.66        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_wrmsr
      3.56            +0.1        3.66        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_wrmsr
      3.64            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_hlt
      3.63            +0.1        3.74        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_invd
      3.65            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_clts
      3.65            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_hlt
      3.64            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_invd
      3.64            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_mov_cr0
      3.64            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_clts
      3.63            +0.1        3.74        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_mov_cr0
      3.55            +0.1        3.67        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_rdmsr
      3.56            +0.1        3.68        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_rdmsr
      3.56            +0.1        3.67        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_rdpmc
      3.64            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_mov_dr0
      3.63            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_mov_dr0
      3.56            +0.1        3.68        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_rdpmc
      3.62            +0.1        3.74        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_invlpg
      3.62            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lldt
      3.62            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_invlpg
      3.62            +0.1        3.74        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lmsw
      3.63            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lldt
      3.63            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lmsw
      3.62            +0.1        3.75        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lgdt
      3.63            +0.1        3.76        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_x86_lgdt
      3.46            +0.1        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invd
      3.32            +0.1        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invd
      3.46            +0.1        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invd
      3.45            +0.1        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_dr0
      3.45            +0.1        3.59        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_dr0
      3.46            +0.1        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_hlt
      3.45            +0.1        3.59        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_cr0
      3.31            +0.1        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_dr0
      3.46            +0.1        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_hlt
      3.31            +0.1        3.45        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_cr0
      3.45            +0.1        3.59        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_mov_cr0
      3.45            +0.1        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invlpg
      3.32            +0.1        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_hlt
      3.45            +0.1        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invlpg
      3.45            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_clts
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_invlpg
      3.45            +0.2        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_clts
      3.31            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_clts
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lgdt
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_wrmsr
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lgdt
      3.45            +0.2        3.61        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdpmc
      3.45            +0.2        3.61        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_wrmsr
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdpmc
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdmsr
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lgdt
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdpmc
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_wrmsr
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lldt
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdmsr
      3.44            +0.2        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lldt
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_rdmsr
      3.43            +0.2        3.60        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lmsw
      3.30            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lldt
      3.43            +0.2        3.60        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lmsw
      3.29            +0.2        3.46        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_x86_lmsw
     42.40            +1.5       43.86        perf-profile.calltrace.cycles-pp.__send_signal_locked.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection
     39.45            +1.6       41.08        perf-profile.calltrace.cycles-pp.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig.exc_general_protection
     37.42            +1.8       39.25        perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig
     36.75            +2.0       38.71        perf-profile.calltrace.cycles-pp.do_dec_rlimit_put_ucounts.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection
      3.63 ±  3%      -2.1        1.53 ±  3%  perf-profile.children.cycles-pp.fixup_umip_exception
      3.42 ±  3%      -2.1        1.34 ±  4%  perf-profile.children.cycles-pp.insn_decode_from_regs
      2.58 ±  3%      -1.7        0.85 ±  4%  perf-profile.children.cycles-pp.insn_get_modrm
      2.60 ±  3%      -1.7        0.87 ±  4%  perf-profile.children.cycles-pp.insn_get_displacement
      2.62 ±  3%      -1.7        0.92 ±  4%  perf-profile.children.cycles-pp.insn_get_immediate
      2.64 ±  3%      -1.7        0.95 ±  4%  perf-profile.children.cycles-pp.insn_get_length
     48.00            -1.3       46.74        perf-profile.children.cycles-pp.exc_general_protection
      1.59 ±  4%      -0.9        0.70 ±  4%  perf-profile.children.cycles-pp.insn_get_opcode
      0.73 ±  4%      -0.4        0.33 ±  8%  perf-profile.children.cycles-pp.insn_get_prefixes
      0.72 ±  6%      -0.4        0.34 ±  7%  perf-profile.children.cycles-pp.insn_get_code_seg_params
      0.40 ±  6%      -0.3        0.15 ±  7%  perf-profile.children.cycles-pp.show_signal
      0.24 ±  7%      -0.2        0.08 ±  6%  perf-profile.children.cycles-pp.unhandled_signal
      0.22 ±  4%      -0.1        0.08        perf-profile.children.cycles-pp.prepare_signal
      0.79 ±  4%      -0.1        0.66 ±  5%  perf-profile.children.cycles-pp.__x64_sys_rt_sigprocmask
      0.26 ±  4%      -0.1        0.15 ±  5%  perf-profile.children.cycles-pp.fixup_vdso_exception
      0.50 ±  5%      -0.1        0.41 ±  7%  perf-profile.children.cycles-pp._copy_to_user
      0.16 ±  4%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.send_signal_locked
      0.17 ±  8%      -0.1        0.12 ±  5%  perf-profile.children.cycles-pp.inat_get_escape_attribute
      0.23 ±  2%      -0.0        0.18 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.17 ±  2%      -0.0        0.16        perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.27 ±  2%      +0.0        0.29 ±  3%  perf-profile.children.cycles-pp.task_work_run
      0.04 ± 44%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.31 ±  2%      +0.0        0.35 ±  6%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.30 ±  2%      +0.0        0.34 ±  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.34 ±  2%      +0.0        0.38 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.get_desc
      2.42            +0.1        2.49        perf-profile.children.cycles-pp.complete_signal
     43.34            +1.4       44.72        perf-profile.children.cycles-pp.force_sig_info_to_task
     43.42            +1.4       44.83        perf-profile.children.cycles-pp.force_sig
     42.40            +1.5       43.87        perf-profile.children.cycles-pp.__send_signal_locked
     39.48            +1.6       41.09        perf-profile.children.cycles-pp.__sigqueue_alloc
     37.42            +1.8       39.25        perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
     39.68            +1.9       41.54        perf-profile.children.cycles-pp.get_signal
     36.75            +2.0       38.71        perf-profile.children.cycles-pp.do_dec_rlimit_put_ucounts
     43.78            +2.0       45.75        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     43.96            +2.0       45.94        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.80 ±  4%      -0.7        0.12 ±  5%  perf-profile.self.cycles-pp.insn_get_modrm
      0.69 ±  4%      -0.5        0.24 ±  4%  perf-profile.self.cycles-pp.insn_get_opcode
      0.67 ±  6%      -0.4        0.28 ±  7%  perf-profile.self.cycles-pp.insn_get_code_seg_params
      0.28 ±  8%      -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.exc_general_protection
      0.50 ±  5%      -0.2        0.31 ±  8%  perf-profile.self.cycles-pp.insn_get_prefixes
      0.22 ±  4%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.prepare_signal
      0.20 ±  6%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.unhandled_signal
      0.20 ±  6%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp.__sigqueue_alloc
      0.20 ±  4%      -0.1        0.09 ± 10%  perf-profile.self.cycles-pp.show_signal
      0.25 ±  4%      -0.1        0.14 ±  6%  perf-profile.self.cycles-pp.fixup_vdso_exception
      0.50 ±  5%      -0.1        0.40 ±  8%  perf-profile.self.cycles-pp._copy_to_user
      0.25 ±  5%      -0.1        0.19 ±  6%  perf-profile.self.cycles-pp.__send_signal_locked
      0.16 ±  7%      -0.1        0.12 ±  4%  perf-profile.self.cycles-pp.inat_get_escape_attribute
      0.22 ±  3%      -0.0        0.18 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.12 ±  3%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.07 ±  6%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.__x64_sys_rt_sigprocmask
      0.51            -0.0        0.49        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      0.17 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.x64_setup_rt_frame
      0.13            -0.0        0.12        perf-profile.self.cycles-pp.save_xstate_epilog
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.__put_user_8
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.stress_x86_hlt
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.stress_x86_mov_dr0
      0.26 ±  2%      +0.0        0.28        perf-profile.self.cycles-pp.task_mm_cid_work
      0.08            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.force_sig
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.get_desc
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.force_sig_info_to_task
      0.02 ±141%      +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      2.34            +0.1        2.41        perf-profile.self.cycles-pp.complete_signal
     37.39            +1.8       39.24        perf-profile.self.cycles-pp.inc_rlimit_get_ucounts
     36.75            +1.9       38.70        perf-profile.self.cycles-pp.do_dec_rlimit_put_ucounts


***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-spr-r02/sigsegv/stress-ng/60s

commit: 
  f92d081a18 ("kthread: Make sure kthread hasn't started while binding it")
  cd28de79b6 ("kthread: Default affine kthread to its preferred NUMA node")

f92d081a181fa4af cd28de79b6107158b9d3390eaf8 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 8.859e+08 ± 23%     -25.0%   6.64e+08 ± 10%  cpuidle..time
      0.03 ± 44%     +92.3%       0.05 ± 11%  vmstat.procs.b
      0.02 ±  6%      +0.0        0.02 ±  3%  mpstat.cpu.all.soft%
      4.83 ±  8%      -0.8        4.08 ±  2%  mpstat.cpu.all.usr%
      8948 ± 16%     +33.6%      11954 ± 21%  numa-meminfo.node1.Active
      8932 ± 16%     +33.7%      11943 ± 21%  numa-meminfo.node1.Active(anon)
      2231 ± 17%     +33.9%       2987 ± 21%  numa-vmstat.node1.nr_active_anon
      2231 ± 17%     +33.9%       2987 ± 21%  numa-vmstat.node1.nr_zone_active_anon
     34.50 ± 29%     +51.7%      52.33 ± 19%  sched_debug.cpu.nr_uninterruptible.max
      4.30 ±  5%     +22.2%       5.25 ±  7%  sched_debug.cpu.nr_uninterruptible.stddev
     14196 ±  2%     +16.2%      16492 ± 10%  meminfo.Active
     14163 ±  2%     +16.2%      16460 ± 10%  meminfo.Active(anon)
    825730 ±  5%      -8.2%     757765 ±  6%  meminfo.Shmem
  4.39e+08            -4.9%  4.174e+08        stress-ng.sigsegv.ops
   7316803            -4.9%    6956564        stress-ng.sigsegv.ops_per_sec
    572.66 ± 10%     -22.1%     445.92 ±  4%  stress-ng.time.user_time
      3538 ±  2%     +16.3%       4113 ± 10%  proc-vmstat.nr_active_anon
    970940            -1.7%     954299        proc-vmstat.nr_file_pages
    206117 ±  5%      -8.1%     189475 ±  6%  proc-vmstat.nr_shmem
      3538 ±  2%     +16.3%       4113 ± 10%  proc-vmstat.nr_zone_active_anon
   1326698 ±  2%      -3.1%    1285981 ±  2%  proc-vmstat.numa_hit
   1094810 ±  2%      -3.7%    1053996 ±  3%  proc-vmstat.numa_local
    840975            -4.3%     804587 ±  2%  proc-vmstat.pgfault
      0.15            +7.2%       0.17 ±  2%  perf-stat.i.MPKI
 7.988e+09            -3.5%  7.711e+09        perf-stat.i.branch-instructions
     21.36            +1.6       22.92 ±  2%  perf-stat.i.cache-miss-rate%
   5933677            +5.1%    6236141        perf-stat.i.cache-misses
      3600            +3.7%       3731        perf-stat.i.context-switches
     15.41            +5.7%      16.29        perf-stat.i.cpi
    126332            -3.7%     121701        perf-stat.i.cycles-between-cache-misses
 4.067e+10            -3.4%  3.927e+10        perf-stat.i.instructions
      9.12            -4.2%       8.73        perf-stat.i.metric.K/sec
   2066531            -3.5%    1994897        perf-stat.i.page-faults
      0.09 ± 70%     +64.9%       0.16 ±  2%  perf-stat.overall.MPKI
     14.66 ± 70%      +9.0       23.66 ±  3%  perf-stat.overall.cache-miss-rate%
     10.44 ± 70%     +57.2%      16.41        perf-stat.overall.cpi
   3759041 ± 70%     +57.7%    5926934 ±  2%  perf-stat.ps.cache-misses
    196.04 ± 70%     +53.1%     300.18 ±  2%  perf-stat.ps.cpu-migrations
      1.65 ± 23%     +23.4%       2.04 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.mmap_region
      3.49 ±  9%     -21.3%       2.75 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.20 ± 27%     +83.3%       0.37 ± 51%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      2.14 ± 17%     -54.7%       0.97 ± 78%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      0.34 ±133%     -95.4%       0.02 ±145%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      1.77 ± 16%     +29.3%       2.29 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.mmap_region.do_mmap
      0.04 ± 68%     -49.2%       0.02 ± 14%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.40 ±  8%     -19.1%       4.37 ± 11%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      1.51 ± 47%     +50.4%       2.26 ± 12%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_brk_flags.elf_load.load_elf_binary
      2.29 ± 12%     -54.7%       1.04 ± 78%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      0.62 ±144%     -97.1%       0.02 ±150%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.92 ± 13%     +98.6%       1.82 ± 63%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    141.59 ±  3%      -8.0%     130.32 ±  4%  perf-sched.total_wait_time.average.ms
      1836 ± 12%     -18.4%       1497 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    133.67 ± 20%     -23.9%     101.67 ± 21%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    172.00 ± 21%     -24.6%     129.67 ± 20%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     34.50 ± 16%     -23.7%      26.33 ± 19%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2644 ± 13%     -18.1%       2164 ± 13%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1005           -83.4%     167.26 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      1.65 ± 23%     +23.4%       2.04 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.mmap_region
      2.14 ± 17%     -54.7%       0.97 ± 78%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      1.75 ± 17%     +31.0%       2.29 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.mmap_region.do_mmap
      1.51 ± 47%     +50.4%       2.26 ± 12%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_brk_flags.elf_load.load_elf_binary
      2.29 ± 12%     -54.7%       1.04 ± 78%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      1005           -83.4%     167.25 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      5.34 ±  6%      -0.7        4.69 ±  5%  perf-profile.calltrace.cycles-pp.__libc_sigaction
      1.30 ±  8%      -0.6        0.66 ±  6%  perf-profile.calltrace.cycles-pp.insn_decode_from_regs.fixup_umip_exception.exc_general_protection.asm_exc_general_protection.stress_sigsegv
      1.38 ±  7%      -0.6        0.75 ±  6%  perf-profile.calltrace.cycles-pp.fixup_umip_exception.exc_general_protection.asm_exc_general_protection.stress_sigsegv
      0.98 ±  6%      -0.3        0.71 ±  4%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_sigsegv
      4.45            -0.1        4.38        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_int88.stress_sigsegv
      4.44            -0.1        4.38        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_trap.stress_sigsegv
      4.52            -0.0        4.47        perf-profile.calltrace.cycles-pp.exc_general_protection.asm_exc_general_protection.clock_gettime
      8.49            +0.1        8.59        perf-profile.calltrace.cycles-pp.stress_sigsegv_x86_int88.stress_sigsegv
      8.48            +0.1        8.59        perf-profile.calltrace.cycles-pp.asm_exc_general_protection.stress_sigsegv_x86_int88.stress_sigsegv
      8.98            +0.1        9.11        perf-profile.calltrace.cycles-pp.clock_gettime
      3.48            +0.1        3.60        perf-profile.calltrace.cycles-pp.__bad_area_nosemaphore.exc_page_fault.asm_exc_page_fault.stress_sigsegv
      8.48            +0.1        8.60        perf-profile.calltrace.cycles-pp.stress_sigsegv_x86_trap.stress_sigsegv
      8.46            +0.1        8.60        perf-profile.calltrace.cycles-pp.asm_exc_general_protection.stress_sigsegv_x86_trap.stress_sigsegv
      4.04            +0.1        4.18        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_trap.stress_sigsegv
      4.03            +0.1        4.18        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_trap
      4.02            +0.1        4.16        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_int88
      8.50            +0.1        8.65        perf-profile.calltrace.cycles-pp.asm_exc_general_protection.clock_gettime
      4.03            +0.1        4.18        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv_x86_int88.stress_sigsegv
      3.37            +0.2        3.53        perf-profile.calltrace.cycles-pp.__send_signal_locked.force_sig_info_to_task.force_sig_fault.__bad_area_nosemaphore.exc_page_fault
      3.41            +0.2        3.57        perf-profile.calltrace.cycles-pp.force_sig_fault.__bad_area_nosemaphore.exc_page_fault.asm_exc_page_fault.stress_sigsegv
      3.40            +0.2        3.56        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig_fault.__bad_area_nosemaphore.exc_page_fault.asm_exc_page_fault
      3.90            +0.2        4.07        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_int88.stress_sigsegv
      3.90            +0.2        4.07        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_int88.stress_sigsegv
      3.72            +0.2        3.89        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_int88
      3.86            +0.2        4.05        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.clock_gettime
      3.86            +0.2        4.05        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.clock_gettime
      3.68            +0.2        3.87        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.clock_gettime
      3.88            +0.2        4.08        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_trap.stress_sigsegv
      3.88            +0.2        4.08        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_trap.stress_sigsegv
      3.97            +0.2        4.17        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.clock_gettime
      3.98            +0.2        4.18        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.clock_gettime
      3.70            +0.2        3.90        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv_x86_trap
      8.11            +0.3        8.36        perf-profile.calltrace.cycles-pp.__bad_area_nosemaphore.bad_area_access_error.exc_page_fault.asm_exc_page_fault.stress_sigsegv
      8.15            +0.3        8.41        perf-profile.calltrace.cycles-pp.bad_area_access_error.exc_page_fault.asm_exc_page_fault.stress_sigsegv
      7.78            +0.3        8.12        perf-profile.calltrace.cycles-pp.__send_signal_locked.force_sig_info_to_task.force_sig_fault.__bad_area_nosemaphore.bad_area_access_error
      7.89            +0.3        8.22        perf-profile.calltrace.cycles-pp.force_sig_fault.__bad_area_nosemaphore.bad_area_access_error.exc_page_fault.asm_exc_page_fault
      7.85            +0.3        8.20        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig_fault.__bad_area_nosemaphore.bad_area_access_error.exc_page_fault
     10.34            +0.5       10.86        perf-profile.calltrace.cycles-pp.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig_fault.__bad_area_nosemaphore
      9.83            +0.5       10.35        perf-profile.calltrace.cycles-pp.do_dec_rlimit_put_ucounts.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_page_fault
     11.07            +0.5       11.61        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_page_fault.stress_sigsegv
     11.08            +0.5       11.62        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault.stress_sigsegv
      9.83            +0.5       10.38        perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig_fault
     10.54            +0.5       11.09        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_page_fault.stress_sigsegv
     34.43            +0.6       35.03        perf-profile.calltrace.cycles-pp.asm_exc_general_protection.stress_sigsegv
     23.93            +0.6       24.53        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_sigsegv
     16.44            +0.7       17.12        perf-profile.calltrace.cycles-pp.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv
     16.40            +0.7       17.07        perf-profile.calltrace.cycles-pp.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection.stress_sigsegv
     16.00            +0.7       16.75        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv
     16.01            +0.7       16.76        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv
     15.25            +0.8       16.01        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection.stress_sigsegv
     77.05            +0.8       77.88        perf-profile.calltrace.cycles-pp.stress_sigsegv
     27.82            +1.2       29.00        perf-profile.calltrace.cycles-pp.__send_signal_locked.force_sig_info_to_task.force_sig.exc_general_protection.asm_exc_general_protection
     26.03            +1.2       27.28        perf-profile.calltrace.cycles-pp.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig.exc_general_protection
     24.50            +1.3       25.80        perf-profile.calltrace.cycles-pp.do_dec_rlimit_put_ucounts.get_signal.arch_do_signal_or_restart.irqentry_exit_to_user_mode.asm_exc_general_protection
     24.78            +1.3       26.09        perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.__sigqueue_alloc.__send_signal_locked.force_sig_info_to_task.force_sig
      2.31 ±  7%      -1.1        1.17 ±  6%  perf-profile.children.cycles-pp.insn_decode_from_regs
      2.44 ±  7%      -1.1        1.31 ±  6%  perf-profile.children.cycles-pp.fixup_umip_exception
      1.43 ±  7%      -0.9        0.50 ±  8%  perf-profile.children.cycles-pp.insn_get_modrm
      1.53 ±  7%      -0.9        0.63 ±  7%  perf-profile.children.cycles-pp.insn_get_immediate
      1.48 ±  7%      -0.9        0.58 ±  7%  perf-profile.children.cycles-pp.insn_get_displacement
      1.55 ±  7%      -0.9        0.66 ±  7%  perf-profile.children.cycles-pp.insn_get_length
      5.62 ±  6%      -0.7        4.95 ±  5%  perf-profile.children.cycles-pp.__libc_sigaction
      6.04 ±  4%      -0.5        5.54 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.93 ±  4%      -0.5        5.44 ±  4%  perf-profile.children.cycles-pp.do_syscall_64
      0.82 ±  7%      -0.5        0.36 ±  6%  perf-profile.children.cycles-pp.insn_get_opcode
      0.57 ±  4%      -0.3        0.29 ±  4%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      1.02 ±  6%      -0.3        0.76 ±  4%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.72 ±  9%      -0.3        0.46 ±  7%  perf-profile.children.cycles-pp.insn_get_code_seg_params
      0.35 ± 11%      -0.2        0.14 ±  5%  perf-profile.children.cycles-pp.insn_get_prefixes
      0.56 ±  5%      -0.2        0.37 ±  3%  perf-profile.children.cycles-pp.prctl
      0.34 ±  2%      -0.2        0.15 ±  6%  perf-profile.children.cycles-pp.mas_walk
      0.23 ± 19%      -0.2        0.05 ±  7%  perf-profile.children.cycles-pp.inat_get_opcode_attribute
      0.40 ±  6%      -0.2        0.22 ±  6%  perf-profile.children.cycles-pp.__do_sys_prctl
      0.96 ±  8%      -0.1        0.82 ±  3%  perf-profile.children.cycles-pp.sync_regs
      0.24 ±  9%      -0.1        0.12 ± 12%  perf-profile.children.cycles-pp.show_signal
      0.18 ± 11%      -0.1        0.07 ± 20%  perf-profile.children.cycles-pp.unhandled_signal
      0.19 ±  9%      -0.1        0.09 ±  8%  perf-profile.children.cycles-pp.fixup_vdso_exception
      0.17 ±  6%      -0.1        0.09 ±  8%  perf-profile.children.cycles-pp.security_task_prctl
      0.19 ± 17%      -0.1        0.12 ±  7%  perf-profile.children.cycles-pp.x64_sys_call
      0.14 ±  7%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.set_tsc_mode
      0.13 ±  8%      -0.0        0.09 ±  7%  perf-profile.children.cycles-pp.disable_TSC
      0.10 ±  6%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.prepare_signal
      0.12 ±  8%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.inat_get_escape_attribute
      0.21 ±  6%      -0.0        0.17 ±  4%  perf-profile.children.cycles-pp.lock_mm_and_find_vma
      0.11 ±  6%      -0.0        0.07        perf-profile.children.cycles-pp.send_signal_locked
      0.62            -0.0        0.59        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.17 ±  5%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.signal_setup_done
      0.12 ±  5%      -0.0        0.10 ±  9%  perf-profile.children.cycles-pp.find_vma
      0.11 ±  7%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.mt_find
      0.08 ±  5%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.25 ±  4%      +0.0        0.28 ±  2%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.14 ± 10%      +0.0        0.17 ±  7%  perf-profile.children.cycles-pp.get_desc
      0.33 ±  5%      +0.0        0.37 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.42 ±  2%      +0.1        1.48 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      1.59            +0.1        1.65 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.irqentry_enter_from_user_mode
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.is_prefetch
      1.53 ±  2%      +0.1        1.59 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      8.61            +0.1        8.70        perf-profile.children.cycles-pp.stress_sigsegv_x86_int88
      0.00            +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.irqentry_enter
      8.98            +0.1        9.11        perf-profile.children.cycles-pp.clock_gettime
      8.55            +0.1        8.67        perf-profile.children.cycles-pp.stress_sigsegv_x86_trap
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.commit_tail
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.09 ± 72%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.memcpy_toio
      0.09 ± 72%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.10 ± 73%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.process_one_work
      0.09 ± 72%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.09 ± 72%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.09 ± 72%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.09 ± 72%      +0.1        0.23 ± 21%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.10 ± 72%      +0.1        0.24 ± 21%  perf-profile.children.cycles-pp.worker_thread
      0.12 ± 59%      +0.1        0.27 ± 19%  perf-profile.children.cycles-pp.ret_from_fork
      0.12 ± 59%      +0.1        0.27 ± 19%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.12 ± 58%      +0.1        0.27 ± 18%  perf-profile.children.cycles-pp.kthread
      8.15            +0.3        8.41        perf-profile.children.cycles-pp.bad_area_access_error
     11.60            +0.4       11.98        perf-profile.children.cycles-pp.__bad_area_nosemaphore
     11.30            +0.5       11.80        perf-profile.children.cycles-pp.force_sig_fault
     25.62            +0.6       26.19        perf-profile.children.cycles-pp.asm_exc_page_fault
     78.46            +0.8       79.26        perf-profile.children.cycles-pp.stress_sigsegv
     62.88            +0.9       63.74        perf-profile.children.cycles-pp.asm_exc_general_protection
     28.49            +1.2       29.66        perf-profile.children.cycles-pp.force_sig
     39.69            +1.7       41.35        perf-profile.children.cycles-pp.force_sig_info_to_task
     38.98            +1.7       40.65        perf-profile.children.cycles-pp.__send_signal_locked
     36.41            +1.7       38.14        perf-profile.children.cycles-pp.__sigqueue_alloc
     34.32            +1.8       36.16        perf-profile.children.cycles-pp.do_dec_rlimit_put_ucounts
     34.61            +1.9       36.47        perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
     36.91            +1.9       38.78        perf-profile.children.cycles-pp.get_signal
     41.06            +1.9       42.92        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     41.23            +1.9       43.12        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      2.18 ±  6%      -0.6        1.58 ±  2%  perf-profile.self.cycles-pp.stress_sigsegv
      0.52 ±  9%      -0.4        0.11 ± 11%  perf-profile.self.cycles-pp.insn_get_modrm
      1.05 ± 35%      -0.3        0.70 ±  3%  perf-profile.self.cycles-pp.__libc_sigaction
      0.58 ±  9%      -0.3        0.28 ±  7%  perf-profile.self.cycles-pp.insn_get_code_seg_params
      0.32 ±  8%      -0.2        0.10 ±  9%  perf-profile.self.cycles-pp.exc_general_protection
      0.34 ±  6%      -0.2        0.14 ±  9%  perf-profile.self.cycles-pp.insn_get_opcode
      0.30 ±  2%      -0.2        0.15 ±  7%  perf-profile.self.cycles-pp.mas_walk
      0.22 ± 21%      -0.2        0.06 ±  7%  perf-profile.self.cycles-pp.__x64_sys_rt_sigaction
      0.32 ± 11%      -0.1        0.17 ± 14%  perf-profile.self.cycles-pp.do_sigaction
      0.95 ±  7%      -0.1        0.81 ±  3%  perf-profile.self.cycles-pp.sync_regs
      0.22 ±  3%      -0.1        0.09 ±  7%  perf-profile.self.cycles-pp.__bad_area_nosemaphore
      0.18 ±  7%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__sigqueue_alloc
      0.18 ±  7%      -0.1        0.08 ± 11%  perf-profile.self.cycles-pp.fixup_vdso_exception
      0.19 ±  5%      -0.1        0.09 ±  5%  perf-profile.self.cycles-pp.insn_get_prefixes
      0.14 ±  9%      -0.1        0.06 ± 19%  perf-profile.self.cycles-pp.unhandled_signal
      0.18 ± 16%      -0.1        0.10 ± 10%  perf-profile.self.cycles-pp.x64_sys_call
      0.15 ±  3%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.19 ±  6%      -0.1        0.14 ±  6%  perf-profile.self.cycles-pp.__send_signal_locked
      0.10 ±  9%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.__x64_sys_rt_sigprocmask
      0.10 ±  4%      -0.0        0.05        perf-profile.self.cycles-pp.__do_sys_prctl
      0.10 ±  4%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.prepare_signal
      0.11 ±  6%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.inat_get_escape_attribute
      0.10 ±  9%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp.show_signal
      0.12 ±  6%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp.disable_TSC
      0.12 ±  4%      -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.20 ±  4%      -0.0        0.18 ±  3%  perf-profile.self.cycles-pp.get_signal
      0.12 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.stress_sigsegv_x86_int88
      0.08 ±  5%      -0.0        0.07        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.08 ±  5%      -0.0        0.07        perf-profile.self.cycles-pp.stress_sigsegv_x86_trap
      0.23            -0.0        0.22        perf-profile.self.cycles-pp.pthread_sigmask
      0.14 ±  9%      +0.0        0.17 ±  7%  perf-profile.self.cycles-pp.get_desc
      1.42 ±  2%      +0.1        1.48 ±  2%  perf-profile.self.cycles-pp.refill_obj_stock
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.is_prefetch
      0.08 ± 19%      +0.1        0.15 ±  7%  perf-profile.self.cycles-pp.___perf_sw_event
      0.09 ± 72%      +0.1        0.22 ± 22%  perf-profile.self.cycles-pp.memcpy_toio
     34.32            +1.8       36.15        perf-profile.self.cycles-pp.do_dec_rlimit_put_ucounts
     34.56            +1.9       36.46        perf-profile.self.cycles-pp.inc_rlimit_get_ucounts





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


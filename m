Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51C2FF151
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437633; cv=fail; b=BnJWatp0BY/OzeDl0X/CrTijpjnRIKOYolWdOx/HEgowGTY6WGH7rd2cd5KpmAAvuOvwqWXl7DyyizHIc6WRhjpB7RwTzc6BxwLwv70OErq9nXIMxuraEm/8vfEw8xEAgpMOKwR+9rKtwv8GJC++ilpCMvT4U6G+HmXC0KCcxBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437633; c=relaxed/simple;
	bh=KWvWK0xMlSOGGyJoQVeLGP+qVGhFmdt6gwIG/mN7T78=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=k//YepNFL9faEpaYU60HvrWBzKvyRvrqofX4xg2esSPJ0Zm+05eVoJUQLj+GlDqZPoLPNa83RXDykYo9NH3MkKbK6A8dcwlehFvx3taMweegeibkPP526cK3wrLKkZS9wtBC5y7aI35OKvX2bvG5r5YUquZBGFeiMX1ueZINGQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY8ka7sF; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY8ka7sF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437632; x=1800973632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWvWK0xMlSOGGyJoQVeLGP+qVGhFmdt6gwIG/mN7T78=;
  b=DY8ka7sFOMOvzdg42jLOnIjvUgCD+ooJRNYPo0FeKreGJM/k5c1ZF9pV
   QSf4++8l4b2Jak2D0GCGjC/5NZ4d2SEPqs5EPf3gEg+51q7YQeACD/1xj
   UAnVUlkaycTttbyIjHLzhnxMT7nwrkuAf+s8ijXPcICwAsLQcLivYwKsK
   gtEXTPKJFmWr+W5ULd6QRDIMRcpcKUNJlGKNbIIo0srKjVV5yOLuc56kT
   1FpUMHGyuIlVpTExbCuaSi9hl0NeE9fIfOnDfMLcxw05dVya2L5IplPIE
   okhElD0rNzeB4U2WhaoAcpe39ZAoRPzovSjLphZvMb93ZLD/O6ZC1KV+A
   g==;
X-CSE-ConnectionGUID: EjDS7gzRShOMYuywvxIrJg==
X-CSE-MsgGUID: qpEuF8LJQ9SROqj0XSZMuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70512487"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70512487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:27:11 -0800
X-CSE-ConnectionGUID: hDjmZZ2uQ6WnLrZXFzj/OQ==
X-CSE-MsgGUID: 37x7qTXgTziod5ntzw7LlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212675925"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:27:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 06:27:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 06:27:11 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 06:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsiwAW0RxviOQwo5Uu35JPVWf3O7zqKrGw+4POPEVui4Bz3ahRxPfQbpaJUufbcIJ0YH5QGzKQDbKVIf4TVoF+V27AGpHq5SEeRvthomkpGbNwC4TpsLBBPZC4lZLSyO9Tk2MGCsbe7kVjV5hznDdMlgjsKWflaA9GPAp1/59bXll+nxxg9WxtrsJJE3BgbL65EEA912e7XZ4CfLn2riuVg+4cLo8yqi1YQe5O9jjIUjLbTiI+4hpP1ccFURSpD1ADLPFO9iy4uEU6AMMsds8IajgdaNVYKwVnymHBwuE3Us4mSZ9njsDaUrFKJpGD61naATUh/SY8RJFDvrYUgTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld/EuoyBJ27ccBBR4rSpc0cm35LwdLBvM3xVykYzmao=;
 b=YvPaztN2XG/YJroWf5HFnoxNxIecXvuZSHEAZkmnPw6KPWo830SNexzNgnrQspmTfB5/kn7F1d55DgDpFmA5n2E07pQ7rSCM68JIQCSDrVk/lhJ3LMRcK2FoyrBNif2fqZKrQ8jGdDBLnc9kE+CbO3eLcfM9u3l9gDinEkffCTlwo2yW9KjNm3AkAw4VmI4cxTylA47HJPWOTvNUCRkD7cCSqqFCxD994GCFC4CgMFr9EkQmbulZGqVjyeoOAiJ1jcz3FhJKtBzA3DIHwPXQ5fZL8uUIn8yPh/7t1QxntOhUzQ5AZ2kUQvaMAhH+g+QbHHrMbk1LMidUqSK4qNN5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 14:27:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 14:27:08 +0000
Date: Mon, 26 Jan 2026 22:27:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:timers/core-v2] [sched/cputime] 241fb10a88:
 WARNING:possible_recursive_locking_detected
Message-ID: <202601262235.d81e30e3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cf380e-2679-4276-ebbe-08de5ce6fcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8tcNXgr1J+0mD7b/jtaMkbCJo9bxmvaEbAZwfv8kLM/gog8pDN92Ya8f2abf?=
 =?us-ascii?Q?ydprB4bCwKxmS/IDhghq7fe00yTrZeYvbMaEUgtT5gWbmOY6oO3t1fWkFQul?=
 =?us-ascii?Q?uL4peQLJaOP3jyIKYiGxizdkYFbGeLSSZgfiscVSqsF1GOe+HPNAWx0kHRU4?=
 =?us-ascii?Q?gqGL4FbkhbxcYw3dyEWtZjQS5+UYWBFJIeL/hKCnfZCJ3eXGCV5QTskRqhgk?=
 =?us-ascii?Q?JG5ZzPweF0DZnfFikNQdIxCG8gEHlHq/VieHshgHEGw10T8IaYgQueJ8XAyf?=
 =?us-ascii?Q?Xki50MQkrehGVNa8cLJ8QTK+DSysa+3UBLNrpQ+2rt5z2U6AUAuxhvb4PF/b?=
 =?us-ascii?Q?pwhUerTgQmu4sl8FxqSqfivc2tBVSzOilwyugRJ6PNpK0P5TqTe+nr8FreeO?=
 =?us-ascii?Q?ragrbo+qMBoP+U+NKZJtRotHTyz1zRXruzq1mcVpXa3TEWtB9ueLBP5K6kD2?=
 =?us-ascii?Q?2jFJjsZgZtQVYZIbAgVW+N0lKLQTu5nURozwMtAW8ctsDeLSJWwVqykx1ERs?=
 =?us-ascii?Q?N/lCl/xT5WeZR2BE3/nZa8IUozTFVVn65teWhtWKnA94FgG9ZBRXSGZA2HB4?=
 =?us-ascii?Q?Xpe/5UVsyla0nuldVD/8bUxGvCB1xviZAOsXvJ45fNy0XE1THD6nckyTaoYg?=
 =?us-ascii?Q?OMRDCuSIpIyWdFo1mPWBkmkmSz2+1mZdQsu1g/7cDhG9zQGAS2/ndTsqLSiO?=
 =?us-ascii?Q?8ao/0mSYQGycVYqy6zt1G/eERI5LKTdscD3ZXH8dENJYjt3uAe31/Q3sGvkl?=
 =?us-ascii?Q?IiuigEFBRT5t66MMoU15Krw3XKZIV+5X1g/ux2vQpFTfDWI3t+zHNOb/+KWc?=
 =?us-ascii?Q?2zF6REMxXop5aNE5YnlROzPBHAxHVQUcsCuX8dlOUc4xVxCtjTDTWgJpEeMp?=
 =?us-ascii?Q?HIGPHuRh9cyZ+qmL4yyEOTVRuPKd5+VhugP1TyjzdM8A9q1dNofw6niWImLW?=
 =?us-ascii?Q?SBBuRRtxvbKuU1kxZmqUsTflSB4RQFLataxFCBHiWbhr2Re9SSvxbBd3HmX5?=
 =?us-ascii?Q?Cis+KCQfwTI58APx4SdQahtSSjkhgl6ZCRZ04iMU1GYUfJNCdgpDLnsWgpWX?=
 =?us-ascii?Q?03pEC2Y4jQyW2e2LpeSoBe13VILeU4QPSIHS2tDIBRBgZAMLPcdtLDsPpnM5?=
 =?us-ascii?Q?lPeM3vDPBzZ3co24d1GZt9htavAMY517OeWBdDWQ+BStppMpOACr78E2Qm0C?=
 =?us-ascii?Q?HTBh+eZCMV+lVMQBiUiMP0J6daAd4qUD+935E1g1beS9d8ujTix/eHazknM5?=
 =?us-ascii?Q?Pay2q4WN546R3lUFbyuap8awYLXmP25/44ielE5kmiejlX89qsfqpJZ2eY6/?=
 =?us-ascii?Q?zW1dKS7CkijSfQUw93HfMx5Qi46wJrRxSbW+1kRwTIRy+SPsLqzjdZp2ncWg?=
 =?us-ascii?Q?YMhaNaGo1y5oWc0tkh13e11NpbdjUINM3KU8XXTW48n2gx5V1zvM0ecRvpxf?=
 =?us-ascii?Q?dmVugIDip2m/Jhk2BIwwsS0UTlgR95Qb6SPfFnl+s7ZGuQB6BUo17lSp1I0z?=
 =?us-ascii?Q?vmNoKEfjK5OCuLt/mvmTa9NHfrpymLZctPJ4KcjUGp2KzKfynWHfku+NIBf0?=
 =?us-ascii?Q?Np0lXM+b2XilazWE1xdKdy6xwn2f0f2M77JfVE4n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1vApn/wwmsRd75kRU7XB90tPPFGkJjwtDiZYV4KvNnRQ9XIPrD++4Uc+c0q?=
 =?us-ascii?Q?y7WyQB9W4H01VsA0H+p90w6TVRvb98xnN/YSNYrxL24f6xdbSBxrOmmazIQd?=
 =?us-ascii?Q?yWR+dz2069/I49mDfNzbdWCba+f8gIBRFgGTUMsmjgjf4lExZEojkrW1Dx0Z?=
 =?us-ascii?Q?h2Fh82F+jZgqku0GBzLM730MkeHXXNcI3UboatTVINjT/jAfzlRrOWHXHD3t?=
 =?us-ascii?Q?qDSvNLGcAKPEP+ft+Qw5y+zQ1PGFIkW9BX8XX6KreV/RafB5HHr2eq1T+3oj?=
 =?us-ascii?Q?kQS8UrX5q135TsONAMSUlOvplyXbF7BegbgNrymcmlvvOWKV5cqcVn9Pxtdn?=
 =?us-ascii?Q?VqEedX5AA+EaFHbgyL0NxScCBy+wJ9UCGc0A1XtwGm63JtDb9m2rcBqYvxca?=
 =?us-ascii?Q?6hPDDpwNVa5hTY1lchcqnXPWWVbp8omKqMAdNJ4BcBRQM6w+KtTvVxGAFytl?=
 =?us-ascii?Q?y+fy2mGqaARRakMzvVSqHAnIZ/3oWReM5VXxCZa/cSWYFELXkSgAr5+5C7sL?=
 =?us-ascii?Q?1MIQaWFHclvYnPET3Ac+9Izrxyrfs2w+5cPoTBlutSJ+jUMX5zEpsGvzgq6P?=
 =?us-ascii?Q?cCnTZJi4a9c/AgK9L/swt4he2u9esTIk3FF8B6FYWOL1+O1TTK1N70nuyCOF?=
 =?us-ascii?Q?IPMB91LjLuPSzMwBWRJEuJPaNOB+aM/jrLKqqzEbvDMexvjask53ivQN8BNQ?=
 =?us-ascii?Q?fNB0AxesK/lP/uodeoG7vSVZ46FPCTh1zuYrA8HIKyM1gRMjNtPGWFZG68h5?=
 =?us-ascii?Q?7hgW6fZnDZt6Zh4Xf/WR032j/Ckwmg5Q3T9CqJZyoNaZr5Rm33AAzWNa/ibf?=
 =?us-ascii?Q?MHAK9Z3kU6Ze33We14WYZc9n0UCyeuTXUIjO3Mm8eFb3xNbet4BSokK3hq+o?=
 =?us-ascii?Q?DVnXng7pEsihMgePxEK0XAmCxzyMdwKjoK5m9SvqCDN71BMpHN4AOTihUv3Y?=
 =?us-ascii?Q?o0Rc40rEmhjZXL5+coZJAi/YBN7KxEKF7V3psNbMmlOpYxSs3OK53sbS0Ngt?=
 =?us-ascii?Q?n5hdYX4oFYSVLxRsVoz8s3Wl7FHTcceR0LWpPJqX+zluRPWHC3OQnmpymz4G?=
 =?us-ascii?Q?MP+f81TXrhFvjHZv3s0oDCkEDZTAnzkUoLFukfLuMO5ZX3+mU7A/xewywvxz?=
 =?us-ascii?Q?ftvF2i59OP8ISv6cQi/8zo1ClhkrFSHX1fphDkBIWfi34bQVzwZ9xF/p9UI2?=
 =?us-ascii?Q?dHkUYKUkNpqjhms4OSg68i6hZZBCE9MxsWIqJQojpTDweINn3dOgsUtsUlgQ?=
 =?us-ascii?Q?+ZHpP4M1VJ1i0gQ7xNDwc4kLrZvyEOfOjMZsgfrRjrnsZ98cDWxtZdlvNGb9?=
 =?us-ascii?Q?x4DA/SPHGCJYhVOMlA4wbSSTkQ8JJwtted7Y/wIEqaKmrzVwNQNyJ+JeS0L+?=
 =?us-ascii?Q?aTCd9wmkiU17bYUzuXDpoqIb/6MUAAdorNK9MFOfMdTshsouzCu9fmBDugja?=
 =?us-ascii?Q?KRTiyjw5tBSr71mpdUruygrouOAjn63mJ9+mp1IKpWsLlfYxijS+iSS0e9Sh?=
 =?us-ascii?Q?prbF1yuYC4cm6mD85w4xWLapavQXDVbmE5Rc5F5notahREpJbe5xOI3ULHnE?=
 =?us-ascii?Q?m+H71mwdgb63e5lAL/3fCQGC41G47GD9NsCW8/SMnXPfb4/7X8n8etm2FD+9?=
 =?us-ascii?Q?tjTDlk5uM/k5LKYMxXPwzh/WZGuvZXFbV9/1Wxc3VxPGhT8T2XLVJVBFjBps?=
 =?us-ascii?Q?CjYGF4p3xjS87wmJ5IkKjgs+vzDJiCByn3kOh0PZL2xrMXHh3gcOmA24O4Z9?=
 =?us-ascii?Q?Cb8Qw+FTSg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cf380e-2679-4276-ebbe-08de5ce6fcd4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:27:08.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG+oJi/ZhxGENVpFljtOzD14ylorM+q/aosuAUFZhqM5Kk3YsKgCyNb5SWxdwP84r3NbuwfBQNCfXOlkDCL72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: 241fb10a88a04a5e3170333823d38159e97a5383 ("sched/cputime: Correctly support generic vtime idle time")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git timers/core-v2

in testcase: boot

config: x86_64-randconfig-075-20250826
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601262235.d81e30e3-lkp@intel.com



[   14.567495][    T1] WARNING: possible recursive locking detected
[   14.567495][    T1] 6.19.0-rc2-00003-g241fb10a88a0 #1 Not tainted
[   14.567495][    T1] --------------------------------------------
[   14.567495][    T1] swapper/0/1 is trying to acquire lock:
[   14.567495][    T1] ffffffff86423ce8 (init_task.vtime_seqcount){....}-{0:0}, at: vtime_account_idle (kernel/sched/cputime.c:767)
[   14.567495][    T1]
[   14.567495][    T1] but task is already holding lock:
[   14.567495][    T1] ffffffff86423ce8 (init_task.vtime_seqcount){....}-{0:0}, at: vtime_task_switch_generic (kernel/sched/cputime.c:776)
[   14.567495][    T1]
[   14.567495][    T1] other info that might help us debug this:
[   14.567495][    T1]  Possible unsafe locking scenario:
[   14.567495][    T1]
[   14.567495][    T1]        CPU0
[   14.567495][    T1]        ----
[   14.567495][    T1]   lock(init_task.vtime_seqcount);
[   14.567495][    T1]
[   14.567495][    T1]  *** DEADLOCK ***
[   14.567495][    T1]
[   14.567495][    T1]  May be due to missing lock nesting notation
[   14.567495][    T1]
[   14.567495][    T1] 1 lock held by swapper/0/1:
[   14.567495][    T1]  #0: ffffffff86423ce8 (init_task.vtime_seqcount){....}-{0:0}, at: vtime_task_switch_generic (kernel/sched/cputime.c:776)
[   14.567495][    T1]
[   14.567495][    T1] stack backtrace:
[   14.567495][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc2-00003-g241fb10a88a0 #1 PREEMPT(lazy)
[   14.567495][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   14.567495][    T1] Call Trace:
[   14.567495][    T1]  <TASK>
[   14.567495][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[   14.567495][    T1]  print_deadlock_bug (kernel/locking/lockdep.c:3044)
[   14.567495][    T1]  validate_chain (kernel/locking/lockdep.c:3897)
[   14.567495][    T1]  __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   14.567495][    T1]  ? vtime_account_idle (kernel/sched/cputime.c:767)
[   14.567495][    T1]  lock_acquire (include/trace/events/lock.h:24 (discriminator 1) kernel/locking/lockdep.c:5831 (discriminator 1))
[   14.567495][    T1]  ? vtime_account_idle (kernel/sched/cputime.c:767)
[   14.567495][    T1]  ? lock_acquire (include/trace/events/lock.h:24 (discriminator 2) kernel/locking/lockdep.c:5831 (discriminator 2))
[   14.567495][    T1]  do_write_seqcount_begin (include/linux/seqlock.h:431 include/linux/seqlock.h:478 include/linux/seqlock.h:503)
[   14.567495][    T1]  ? vtime_account_idle (kernel/sched/cputime.c:767)
[   14.567495][    T1]  vtime_account_idle (kernel/sched/cputime.c:767)
[   14.567495][    T1]  vtime_task_switch_generic (kernel/sched/cputime.c:777)
[   14.567495][    T1]  finish_task_switch+0x11e/0x4a0
[   14.567495][    T1]  ? rest_init (init/main.c:1570)
[   14.567495][    T1]  schedule_tail (kernel/sched/core.c:5185)
[   14.567495][    T1]  ? rest_init (init/main.c:1570)
[   14.567495][    T1]  ret_from_fork (arch/x86/kernel/process.c:157 (discriminator 1))
[   14.567495][    T1]  ? arch_exit_to_user_mode_prepare+0xe0/0xe0
[   14.567495][    T1]  ? __switch_to (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) include/linux/thread_info.h:131 (discriminator 1) include/linux/sched.h:2018 (discriminator 1) arch/x86/include/asm/fpu/sched.h:34 (discriminator 1) arch/x86/kernel/process_64.c:619 (discriminator 1))
[   14.567495][    T1]  ? rest_init (init/main.c:1570)
[   14.567495][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[   14.567495][    T1]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260126/202601262235.d81e30e3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


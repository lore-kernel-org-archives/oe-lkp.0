Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DEC2D8363
	for <oe-lkp@lists.linux.dev>; Mon, 27 Oct 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546190; cv=fail; b=BodYM+Z1KFwMNqxFaV46Sij6a4rUn/f06UPd4inNND/sm0a3MMwQBjmKcsrV3n8XvdAO4J7R+2pC+r75wbZlbTLteCN/PwJfc+1NWHypTpdJNB/YUZbtUHNR5htZL/VcF/lMZG/QQ9iQn1Tt95uyiSDomQ7fKCbUXYLN0GcQqgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546190; c=relaxed/simple;
	bh=N/gpbGhEKmmjORf+uN9F1Olv4CxEHAap7cGjtuRUJuc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kQ7xwZj6OBKSkH4HRuolWi5cwcIK81sAXXx1sTXdMI0ZRe4aPM3n6oTgs2MP7nuiXhX/O4mi/9KkxNrBqnoxfMI4d1fDfK6XO6nIu23N1YshSIFLQ00zZhI/ycip2ibtNVgNM2eaoebO297wnrB+S3OHmu4TbVIo6qqQsVmq6Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEl0qspT; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEl0qspT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761546189; x=1793082189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/gpbGhEKmmjORf+uN9F1Olv4CxEHAap7cGjtuRUJuc=;
  b=FEl0qspTs1sHmAf8CKA9Byww+cOtmDYqbA3jbWEqbErFnBDwigeFOjP9
   uHMBWWgty5dWed+vHBdpLbyez4m5te9uKB/uoK/tOdVzSs/XyLF147nwZ
   8EfBbjpndc3+7UiWdrNuUw6D7WG+jvAq2iV1PmwHCjO/cgkhEH5EKQV6v
   pcWsKcwiDcbZ3OapIvT/ppi8nlKaGF04JYEjMXEICrYE2wIvgE4/eb2lt
   jKPAGmU5r5CGPwLPe++ONTOvUKH7H+sG0MXcg8cCfLznhCsfWJYLZMHhZ
   R1+X75YYDZrnoXDBjnR7poRAaLKQaknbVMqIgDumEmxspj84vuufY+qdn
   g==;
X-CSE-ConnectionGUID: 5m9ROKBESaaC105Lhju0Yg==
X-CSE-MsgGUID: /MSiBfipScS52+evIuNOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67485437"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="67485437"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:23:08 -0700
X-CSE-ConnectionGUID: CGRz+1s5QT+Ce0tQpYeEaQ==
X-CSE-MsgGUID: 762+ytnvQbaLHLSVZ45AGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185716831"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:23:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:23:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 23:23:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsFcdGETGQF36n+AeaNj2U+SBzJsYWb8tz9XMwzoZO8siWu7Ox9cjByBv34l0hFkFgzHozGSDB1HW1Td677yBohqt1lD7Fv0N0MaI+QC+EumAm2MEnCJc5PqMqVb31EOEKiDY5iHJxELdJuj1ZW3L6IELCKipjEWp3iHO7F6DdUAgCJr0UEzM6BhXlTDQJVmVaxO/MGJmVrlEl2YmGqhocstuffDFZVx6UMKUhIBcWdB0wsRdpIVhrwOScI9WKlGqGaFsNrmAEdqm3pXJ4trvaVUmvE1iERt2Gdbwx1Yyq7S9rZtw/JNv9SE5hFWNrQbZmZdSi3X/VJGsbxQoxzVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EKicLhs/pGugqZWnoVO/APzJRh+7LaHvNsyzPsJtyg=;
 b=JJaxhxxmk/t/u9i1e+oWXLXCa/GQlrYenEsDlFkJDtRRleMaSs7rm7AH0tA7teYgTQH6m+o2OM8l24B5RSp3zD6F3VqyJMbEFO6fQNIwtGHYfifelTi5um5JkFMInmeUtN34qru3CVgffZ8LUCCe/ROdVpGDczcrJfv0k+AI59bPraBucD1OpPsuCGsELtkk+r94c4A2EA+xCBm5I1CKzBmSA3c75rRAxD/rr9Qo8UVK28SDbLz6sHzdkBvsmqMJX8N7LMUWpqkFdX3xfmGhbNvh+lDehoZ3s/NoLBrpXGqEFYc2b1zdS+xxEJ9Acp+etWbLK4FVosvQcVOv2huu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by DS7PR11MB9452.namprd11.prod.outlook.com (2603:10b6:8:263::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 06:23:06 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 06:23:06 +0000
Date: Mon, 27 Oct 2025 14:22:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <oliver.sang@intel.com>
Subject: [rgushchin:bpfoom.2.8] [sched]  ce6754ecb8:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202510271323.9a3f4564-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|DS7PR11MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 682de86d-e9bd-47d1-2064-08de152149f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LzLw5DJHZH6i9WALGWi3sCLKKSVceGIMsphX/Ix8fTnAeS+i1eTCEOp+aifE?=
 =?us-ascii?Q?JDHaO1mgGyKVmk3J/5xWvUQrihFjsa2e0BcR/2+c2aWIxIlxk2UgTgTSIseD?=
 =?us-ascii?Q?F3MtOL4DfwffWuceJVb/Ek6YwIvszYAOFwFHQ+OGYpUFXbxUJlJTe36BpvgM?=
 =?us-ascii?Q?TSrF6KkkKO0i538w+l58+i/wHVDTaaGgrdth6mpWe1DvJDQZFBf29MKoKlYg?=
 =?us-ascii?Q?MZypAs+5Md15Z927MEC94LeX509eAN1u+P1LfcZGvW4kynJ8/hc6d4B9hJpW?=
 =?us-ascii?Q?qEcmIznEm9fVwPpuv0o5kqd+nVdDC21kon3fIDmYs+/xgD0hY1Td4IHaXy6W?=
 =?us-ascii?Q?d0WJDZmgk52D946+AURtrwCrBmnJ9R+YXA3esD3Y6ASEZzJ5jdzHclmUjFdX?=
 =?us-ascii?Q?+OAJi5TeHFNomt8I24H6M/xmEQY+2PmD0HJRKR/jHqpv83jpZzTO4MUaeuvG?=
 =?us-ascii?Q?kPkvGWT9Shj97O9d/EaG7dvcoB8/xpKb0hGM+EsRetlo3t050GfkrlvssUXf?=
 =?us-ascii?Q?6Wqa+DoTsXKVp5PgWtm1RGO8rkyFMlZtqyDtqgNTfJ9ztPerjle1PW/P154Z?=
 =?us-ascii?Q?t3SvOx/oiF5EVOOhCMC27/sICxMsH+PykQbNE67qpAZSHV6nUE+nYVdnEsHy?=
 =?us-ascii?Q?NVti+VL/8GjgGStW81asDh95VCpSfTaxr8DWWWYseXYQncXaBYsv6oqnZ3Tp?=
 =?us-ascii?Q?zf/zsiNjHDEEjfzSSdoXdbd7grquQ0LeSpbafw/yfdnFb2uuuK4xscnAj/2D?=
 =?us-ascii?Q?E/0jAz1XY/oxEUVatd+HlWo27qZIzuetphZJ/NgBTcx1ADmg1DvTgVV5W01+?=
 =?us-ascii?Q?x40lxPY+9Og3xyjspanvQSgEvyGFNx5nCw4OWw0TCz/2WjPXgB6V50YSAxAy?=
 =?us-ascii?Q?ctH631kRRNTicXbuJnnVkGyenHyBwEg23+GYPdLhtdFW26Cm/2uQFJkmOdbp?=
 =?us-ascii?Q?BY4PgsbO2GdETftA6r0wTfSR7+DvzCILVD1V/MTZTRSUXxUFXxPOGpGSfcZh?=
 =?us-ascii?Q?Dk6qR+L+xN69VJ3raZxv71G3P1RBP5xwdKrcavb1f0+eJWOD+zs4zJEpivLy?=
 =?us-ascii?Q?dYe4QGHEVCDpknQNu0DpZP5osFNQDgUkRucZ72i7a45RppdjggwCGoQKLpcC?=
 =?us-ascii?Q?ZGPut0F5Fji8iruZmLz576Y2Xh5a/+DGqW1ezzhhUGGzhy6CAQAQGW/xmkye?=
 =?us-ascii?Q?6d7xNQ1XxTA5IIaNSFqGYQ51WNz+7Fogs4up8N2HHVVzM2mBeGyya895fuQz?=
 =?us-ascii?Q?sHP4qlkexlal/ls6AJpxpV5qWw+lOrcXmx8rOQ4XbvpKrj8veC/8O8eGfSHH?=
 =?us-ascii?Q?VOWBocmyY7u4vUwWimNfBqa7cL9vlG0HLk5dLIPLVcrILvBxBxiMw5eYERk1?=
 =?us-ascii?Q?SwcKgANeK3FigHb9alJbZXb5QRXTzYV4I+OyRZI1MXjkNFQkvaoiM5YHo1ZL?=
 =?us-ascii?Q?b2etI9tmEx1QDxUCFo31nlFPH0N5O2kJ37ce4Jvadrx+3EI1USZk2Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Dgj34/QWTXvzgrofba6YF68KxD9A3QhVQCsR620MU1aN9FdY3Qydgdk3YLZ?=
 =?us-ascii?Q?uTR2VjtAaF+82vZteC3oVDGWq1dQiCjj/ftIkKReY5i2/yo89vzrX9uZK3Hg?=
 =?us-ascii?Q?Gtq0hK07Bqk9gRZzpl3zxCx5e27RNNHg6M+SE2whd718/88AxWtlyYPSoZbK?=
 =?us-ascii?Q?aL1Rj2p3pMnrfqBILnsg2PzU0UvnwoKpTOR5v6ZHxOH3GIsfeH8xEc42uNac?=
 =?us-ascii?Q?LucERBqKS22sd+UwtfZdA5OdRpzqgdv4eghy5AZBUexmD4kcG+LYIb5WbJp4?=
 =?us-ascii?Q?GID1i4fy4iIaYnCnZO4BbZggvnABGduZdvbPU1TDD4oaCC/nznKG6PnHJt/I?=
 =?us-ascii?Q?kb0AeCaO3W5nh30DGohF1hmFejULbqRyWp4lLPloOFS7BPVc4Y2wRpsw4nAO?=
 =?us-ascii?Q?f5TGrKpSrpayYz5O/pLdEaS383faSkrwfg98lYR0XUQRVhyrmPskIor6TVqo?=
 =?us-ascii?Q?lomJzhxpEauWZvlCE3+UQR3emIwzWonICqco0v2YAliOSr024YxhSeNgX7BK?=
 =?us-ascii?Q?lOgIQcJxeWV8iJmmxPJZOk+JLsSNnJqlXMmd+OVjBxVChUBUcw/qXurq9l7y?=
 =?us-ascii?Q?m7IwlW/tsQXHS34m7kLb9uDJwW+Lz4/r3+mM78CjQwQOaktznDNMXDETtL6H?=
 =?us-ascii?Q?NVNjeZChrjOJTCR9iXf8L3wlDQrDDU9CP3CFJ5MgxTPW9z9LcCvGAjIwJq0R?=
 =?us-ascii?Q?poVGcPe1eAUnt25xDCYccoxeJrwSWZRuj9lEc6Kz/9qItQvU3Cv64QrhelQO?=
 =?us-ascii?Q?QG+zKhGo36CeRJjvQFZtYQo7CxZJLgI/xl/duYBJZYNnqpHN1SegEj89md8e?=
 =?us-ascii?Q?7YKS2nDavGKemH/sVoGL1D6GwFVpV+pLPLtyyuYEZq++Un+K0mDM7Rc+RqBp?=
 =?us-ascii?Q?ubhNZXxMGUvjrmN5yD229p/bIpXq9TPnjLaWsrma1//TLt+k1S6EDqDADoFj?=
 =?us-ascii?Q?2YyAcjgEmTvbR6Hh3LNGkm8bEGzERNiYziUxjQ2EJGCY2yUIW5mKhUq86xUR?=
 =?us-ascii?Q?dKhqPusEXR9OwylvZ2YaMiaK/EbM0JJ/891Mexmi2ZKJIBbC6ipuyk3uQLAI?=
 =?us-ascii?Q?/23MLpB4JFgPKGH5W9ghw1cxJAO1Mq78jE0xLAZzuVw9iLVD1Pkx23zNQgqe?=
 =?us-ascii?Q?TkzFsPpomamI9cpk9pbCAdawElfEuPG0ZnrnKKqVGuCT90ocfhzc6r9z1evD?=
 =?us-ascii?Q?UgkE5drlrzylSIzw+DY0FLVdqlhmOW/wM7r6bkQH02g+9IPxDyYAjsBgblNr?=
 =?us-ascii?Q?meuyAIk4i69SggSrVeDF8hPE+A7K0de+4EuPR8XXmdyZuCWvHU6GGUWTsaZ6?=
 =?us-ascii?Q?yDlMu9Di6OQVZOu4IMBQL5sI8o5f6FQbGL6UCaVSLdOB80x59tyD5QpjVJuY?=
 =?us-ascii?Q?2YlWjubTNMiaPVZQAVIQUKX6bL9aEVT1jJSpWSGsq08/RzD59+WGnL4X0r31?=
 =?us-ascii?Q?PiaMByBPSk+IKWdj0+lqsLsTv3keW6SWoGlG9cNOZE2tGbggBb1xKkMkpT0Y?=
 =?us-ascii?Q?nd7LjGLYzhNNHXhCZmSjxDx/bFEjUJpac3cZHAVFIsyBgII0Qpf+kEcoYerG?=
 =?us-ascii?Q?xh4w3rT836ZG3qPzgOfUqp2veznuzV9rcGtTy/g8w98m4HENSVjyx8RgzUcm?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 682de86d-e9bd-47d1-2064-08de152149f6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:23:06.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylwFHfJm8qJ1khsat2/HK+krhKwWB6gLHbFuOZfsE0BQuKjbCQPvwhS1EEnJ06bTSi2bpxXQWWXntESIlVPRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9452
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: ce6754ecb85b633f15ba3c00f622d224880c3d9a ("sched: psi: implement bpf_psi struct ops")
https://github.com/rgushchin/linux.git bpfoom.2.8

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 4e20a42af9 | ce6754ecb8 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 9          | 0          |
| boot_failures                               | 0          | 9          |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 9          |
| Oops                                        | 0          | 9          |
| RIP:_raw_spin_lock                          | 0          | 9          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 9          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510271323.9a3f4564-lkp@intel.com


[   29.467629][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000310
[   29.468978][    T1] #PF: supervisor write access in kernel mode
[   29.469912][    T1] #PF: error_code(0x0002) - not-present page
[   29.470795][    T1] PGD 0 P4D 0
[   29.471424][    T1] Oops: Oops: 0002 [#1] SMP PTI
[   29.472213][    T1] CPU: 0 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc1-00405-gce6754ecb85b #1 PREEMPT(voluntary)
[   29.473795][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   29.475165][    T1] RIP: 0010:_raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
[   29.475948][    T1] Code: 00 00 e8 c0 14 1f ff 31 d2 89 d0 e9 d7 1c 00 00 cc 66 0f 1f 44 00 00 0f 1f 44 00 00 65 ff 05 54 ba 90 01 b9 01 00 00 00 31 c0 <f0> 0f b1 0f 75 06 c3 cc cc cc cc cc 89 c6 e8 0a 06 00 00 90 c3 cc
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	e8 c0 14 1f ff       	call   0xffffffffff1f14c7
   7:	31 d2                	xor    %edx,%edx
   9:	89 d0                	mov    %edx,%eax
   b:	e9 d7 1c 00 00       	jmp    0x1ce7
  10:	cc                   	int3
  11:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  17:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1c:	65 ff 05 54 ba 90 01 	incl   %gs:0x190ba54(%rip)        # 0x190ba77
  23:	b9 01 00 00 00       	mov    $0x1,%ecx
  28:	31 c0                	xor    %eax,%eax
  2a:*	f0 0f b1 0f          	lock cmpxchg %ecx,(%rdi)		<-- trapping instruction
  2e:	75 06                	jne    0x36
  30:	c3                   	ret
  31:	cc                   	int3
  32:	cc                   	int3
  33:	cc                   	int3
  34:	cc                   	int3
  35:	cc                   	int3
  36:	89 c6                	mov    %eax,%esi
  38:	e8 0a 06 00 00       	call   0x647
  3d:	90                   	nop
  3e:	c3                   	ret
  3f:	cc                   	int3

Code starting with the faulting instruction
===========================================
   0:	f0 0f b1 0f          	lock cmpxchg %ecx,(%rdi)
   4:	75 06                	jne    0xc
   6:	c3                   	ret
   7:	cc                   	int3
   8:	cc                   	int3
   9:	cc                   	int3
   a:	cc                   	int3
   b:	cc                   	int3
   c:	89 c6                	mov    %eax,%esi
   e:	e8 0a 06 00 00       	call   0x61d
  13:	90                   	nop
  14:	c3                   	ret
  15:	cc                   	int3
[   29.483546][    T1] RSP: 0018:ffffcec000013b08 EFLAGS: 00010246
[   29.484363][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000001
[   29.485407][    T1] RDX: ffff8e4753c86000 RSI: 0000000000000001 RDI: 0000000000000310
[   29.486654][    T1] RBP: ffffcec000013c88 R08: 0000000000000001 R09: 0000000791e08fbd
[   29.487805][    T1] R10: 0000000000000004 R11: ffffffffb1ae21e0 R12: 0000000000000002
[   29.488939][    T1] R13: 0000000000000000 R14: 0000000000000310 R15: 0000000000000001
[   29.490060][    T1] FS:  00007f60eff37e00(0000) GS:ffff8e4a3bc32000(0000) knlGS:0000000000000000
[   29.491319][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   29.492221][    T1] CR2: 0000000000000310 CR3: 0000000101856000 CR4: 00000000000406f0
[   29.493352][    T1] Call Trace:
[   29.493917][    T1]  <TASK>
[   29.494385][    T1]  bpf_psi_cgroup_offline (kernel/sched/bpf_psi.c:119)
[   29.495165][    T1]  ? call_rcu (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 kernel/rcu/rcu_segcblist.h:52 kernel/rcu/tree.c:2994 kernel/rcu/tree.c:3004 kernel/rcu/tree.c:3147 kernel/rcu/tree.c:3243)
[   29.495790][    T1]  cgroup_bpf_lifetime_notify (include/linux/cgroup_refcnt.h:10)
[   29.496606][    T1]  ? kernfs_remove_by_name_ns (fs/kernfs/dir.c:1727)
[   29.497373][    T1]  ? cgroup_addrm_files (include/linux/kernfs.h:? kernel/cgroup/cgroup.c:1761 kernel/cgroup/cgroup.c:4496)
[   29.498001][    T1]  ? down_write (arch/x86/include/asm/preempt.h:80 kernel/locking/rwsem.c:1315 kernel/locking/rwsem.c:1326 kernel/locking/rwsem.c:1591)
[   29.498411][    T1]  blocking_notifier_call_chain (kernel/notifier.c:90 kernel/notifier.c:380)
[   29.498915][    T1]  cgroup_destroy_locked (include/linux/notifier.h:207 kernel/cgroup/cgroup.c:6228)
[   29.499387][    T1]  cgroup_rmdir (kernel/cgroup/cgroup.c:6245)
[   29.499791][    T1]  kernfs_iop_rmdir (arch/x86/include/asm/atomic.h:85 include/linux/atomic/atomic-arch-fallback.h:787 include/linux/atomic/atomic-arch-fallback.h:1238 include/linux/atomic/atomic-instrumented.h:611 fs/kernfs/dir.c:474 fs/kernfs/dir.c:1288)
[   29.500229][    T1]  vfs_rmdir (fs/namei.c:4549)
[   29.500624][    T1]  do_rmdir (fs/namei.c:4603)
[   29.501023][    T1]  __x64_sys_rmdir (fs/namei.c:4622 fs/namei.c:4620 fs/namei.c:4620)
[   29.501449][    T1]  do_syscall_64 (arch/x86/entry/syscall_64.c:?)
[   29.504438][    T1]  ? __x64_sys_getdents64 (fs/readdir.c:? fs/readdir.c:396 fs/readdir.c:396)
[   29.504918][    T1]  ? filldir (fs/readdir.c:350)
[   29.505318][    T1]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[   29.505760][    T1]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[   29.506202][    T1]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[   29.506633][    T1]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[   29.507073][    T1]  ? __x64_sys_close (fs/open.c:1591)
[   29.507508][    T1]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[   29.508034][    T1] RIP: 0033:0x7f60f0ab3f17
[   29.508448][    T1] Code: f0 ff ff 73 01 c3 48 8b 0d de 2e 0e 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 54 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 b1 2e 0e 00 f7 d8 64 89 02 b8
All code
========
   0:	f0 ff                	lock (bad)
   2:	ff 73 01             	push   0x1(%rbx)
   5:	c3                   	ret
   6:	48 8b 0d de 2e 0e 00 	mov    0xe2ede(%rip),%rcx        # 0xe2eeb
   d:	f7 d8                	neg    %eax
   f:	64 89 01             	mov    %eax,%fs:(%rcx)
  12:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  16:	c3                   	ret
  17:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  1e:	00 00 00 
  21:	66 90                	xchg   %ax,%ax
  23:	b8 54 00 00 00       	mov    $0x54,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 01                	ja     0x33
  32:	c3                   	ret
  33:	48 8b 15 b1 2e 0e 00 	mov    0xe2eb1(%rip),%rdx        # 0xe2eeb
  3a:	f7 d8                	neg    %eax
  3c:	64 89 02             	mov    %eax,%fs:(%rdx)
  3f:	b8                   	.byte 0xb8

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 01                	ja     0x9
   8:	c3                   	ret
   9:	48 8b 15 b1 2e 0e 00 	mov    0xe2eb1(%rip),%rdx        # 0xe2ec1
  10:	f7 d8                	neg    %eax
  12:	64 89 02             	mov    %eax,%fs:(%rdx)
  15:	b8                   	.byte 0xb8


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251027/202510271323.9a3f4564-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


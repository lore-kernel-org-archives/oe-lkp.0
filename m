Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CB319859
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jan 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204119; cv=fail; b=q/JB73c3siqChbZ0mlcK6JnSMxw95RjbzFBf8HKAoNWhYXswzg6YylIbwacuuOtVuRxxzdzlUMhclTtwso7FwiMyxIq+0EefajysB9kLGj85RG1TIr3elv3KVdQy9q5xzBHZDBhDmLFx94kRk+gR7wuD/PkX8vDisqT9FcE4jCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204119; c=relaxed/simple;
	bh=m9tZi47aS/mpjkq59+VvaRle5nWsLA1MMLKMXSmdiAc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mdM2mXB2mycK2+VI3SoX2IlQvKByNar4K0WE1MWX5LBqYwHtEnvlbHe0gJpDQ/8MUOVzx9XsNBqvZDcZ8Z4et5SvROBTWSBk6N6vwQnjDPriJBc3L4gNNmouwLla/ff6/hR93PJ6KxTkM0dUMBLXxSiZLyhKuZ9gcjCndJdN2AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kr9C7S3Y; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kr9C7S3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768204118; x=1799740118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9tZi47aS/mpjkq59+VvaRle5nWsLA1MMLKMXSmdiAc=;
  b=Kr9C7S3Y3X3/qB1/Kzv+xBrcAOWcl+XziWXpMdby2jYru8L8MEhmkAgw
   ETszX/xFUXio+Wigboax8eS6Ar3BQfsNAd87fNdZJF7kl7vYHgTOINA0+
   0b8jO+JflHM/DVM5UHCgQTtl7jswfDWLspMQ5XiM5F8gh5pZ6EhDLwmjd
   /O/JtWLYLjILZY4dBf17M5coS8tELNrLfsj5U2Zz7OcNwdYOtZjOIwAWB
   ++fhPD7OSx4DLoU35YYtx6+5g/TJXHWoJ4V/Fo0Lg0ZFd1OP9icEPOmzD
   STanGZSZeD7SJCUjhcHP9gYa7PxXkMZLlt3FlYLym/usOI3sx8aBsg0L5
   Q==;
X-CSE-ConnectionGUID: 3KxabNipS5iem7UC19HFnQ==
X-CSE-MsgGUID: A7XqrAHJSTyWFZl+fFA1dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69372979"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69372979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:48:38 -0800
X-CSE-ConnectionGUID: gfkslTxRTrKuyuFun5GtGg==
X-CSE-MsgGUID: vQAIhUsWTwa5XJDI2GV27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203655191"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:48:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:48:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 23:48:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:48:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdif0vw8RG6ojIuKwgjnEDYVsjObM+Rrj6c7oz9llZEZaNrBdPQGPejkifmZ2SFzmtPHlncXSGyXljEZwrqZjUXZAfN569hcXyZxfGoqONnOXPiOpT9gHf/adc7az/DbtEOwgZtX2PgqwtwZaZPcC0zkTBpOuQscdEkCVga/5EmkcJeUzPrR4jbL9eaKV2KK9P+kcJ2+vJF8aClfVT14E+GUMvfMrAf3XCZktTpcqFg6umDJ2Cpk3rKZALwRd/f4lzDTov1yilKWngNNlmNBFoGu/Viu+nPTtEhdC9EQrlAWBdIs2853dZl8niXeEPELj7RuqjMyEdzllpUWRKm4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3mPA4/vOdiaBHLq79CwY+5H/5Yq655cSegp+YKiZ50=;
 b=UOSMhvmBtIKW3jZMw77k/12DDzHGr403OlIoEB77FMkmUaAWL9O2R6Oz+Z7zIW/z6nHtFMJcubxv/6HCcGD0ZF5Jis90V3CD553SkpP4Z/o7idNNeZMz7J6Gt9iHbBuOXL/qZKJHARhcbxSVdrHj+ZAuvWxZg5Kc/4iwadAuMR46z7e5jhCR3shRTIyg7HNvY95jESPxCZJSEiBV4LP2favuoZLVjCChOllyvjSTGq+cH/xkAjtUZ1GRTXbQFf1+TEZsPK1Z6ML+9semOzbVynNu6r1dWGLFvFb1oWKtkKscuiKS8q2MYaDsKmkwpUVm5OFJbtexdDIOhP19uJtymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:48:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 07:48:35 +0000
Date: Mon, 12 Jan 2026 15:48:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gregory Price <gourry@gourry.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Gregory Price
	<gourry@gourry.net>, <oliver.sang@intel.com>
Subject: [gourryinverse:scratch/gourry/isolation/v2] [mm] da80cfb7e2:
 page_allocation_failure:order:#,mode:#(__GFP_ZERO|__GFP_COMP),nodemask=(null),cpuset=(null),mems_allowed=
Message-ID: <202601121442.caec9510-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0049.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: e26e6754-0f83-441d-1302-08de51aefd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lYwVTssMjyWtFKKksQup3eBcqdxVTXz7Xl/bVhsShUbdGWEnce9i8EgH32ir?=
 =?us-ascii?Q?mork4Ie4nSXyk3UtHoGnIQCCjuEZ/YalcS6gsID89yfgqQMHColSpNpP4KvH?=
 =?us-ascii?Q?zeg6udGI+y1Dag01Qdk8nBYX7EHDtRpVXzLdjiKkqPxRslvWdZK/hVt+mZ6P?=
 =?us-ascii?Q?GdrRAIs76HGfpC8PGTwH4C9+6wZgne4mgy0o9mt30ECGxvepdT2gABuxPwbl?=
 =?us-ascii?Q?A9y9Fu+e1ufFRWG2A0MV1wT1V+zuexjC03EAx9kJBpQys+Afp0TW6aXCZxHg?=
 =?us-ascii?Q?0psXHkh3shRVOn0oQGI0k4u2Sq6waw3koEnWrkvB7Y1rszZ4gWpx05lchuwD?=
 =?us-ascii?Q?7/RtTIV5cZc5PCxvzY+a/uMUDOYzcD6NjZHiTO+te9BP0+vgw/DmPZ7oxFt2?=
 =?us-ascii?Q?kLNxOTFtkewCXLgRrJChDgZZq7+kqH95/Q5QQk0KVBADbllRTLflCuZIuHkY?=
 =?us-ascii?Q?0qGnkIcEWCpPBgsvFpSGQOT0AyOkY1HDIWM0JesWtujHmZ37Hw9eJiyirXZi?=
 =?us-ascii?Q?hHQidSCcFkIxIMPdleAtC4SQ2vx9F7JOy+2gAP8KaEzLwBCegjxRWmNRtHvb?=
 =?us-ascii?Q?DJ8PmxSEYAfNL1F7xNZjj1cc00033pl0KBvMfOx1veXFIAt42Bj4ozr+nYl8?=
 =?us-ascii?Q?dEMGeEl1oAuR6sboP0bbGCq4nzM6FKF87oLo6P2cNaDlU5vMiYllwnlsm2+/?=
 =?us-ascii?Q?LoUCqSgz/kTE2hkgQeXFNymNmhbxRa+isJhmi/hix1+D+xOl1F/aqxPVZF2J?=
 =?us-ascii?Q?5yJa9x+vSC8PMrbsr8QSpXvECvQmqtgY3FyZCq7P0HsocVkM1o2I4muAKORS?=
 =?us-ascii?Q?u1O90NEYw0HMT0oC75ayry+Nm01N7dnC+xml79zjHROmCr5odi6eqhcybEVL?=
 =?us-ascii?Q?DRMjTgKR14VoskQrc1mI+YnbnK5xuUhIzYhOh9TiYJS7HnxdpStGTXbd2kvZ?=
 =?us-ascii?Q?3pDjPt6b5Xkeq+nVql1FXw8wdbO1FeRAgoMTXMS2+zNUhZq7KuJcBkTH7oMt?=
 =?us-ascii?Q?eF5oZQhSVL6YviABWcSOt8/wUr1T9yENXWdA4zYoKMyBy7qk3YrJJftB7amK?=
 =?us-ascii?Q?1rSMRDBonYKd+r+WrTWxw9ffBWvIlHDeY23zkkBP4ZVX+01BXQe0wag3MlZH?=
 =?us-ascii?Q?ZDD6OVCrn7NsJsOb0nfM2ZwkvLHzY5jvLsrbGKYZ6iLxrHYcgfERJ8t6lkP9?=
 =?us-ascii?Q?vs1W6/wHOyLb4YSYqk4418YBqUV3Hoztaix7KBD8aKL41jcSMk0hXYFgLXFv?=
 =?us-ascii?Q?J9KcQNJcMheg9bGjiVwAbKbe5HpceJYBzR3PMDKN3dqbz/1Tlg5kTybazNyh?=
 =?us-ascii?Q?IBejSnoexQpSD/c3x2S0qEjVf8h/74awVIf4O5Oey61XrSlJkLkgLVEP0wDi?=
 =?us-ascii?Q?0Gn3YStSH1YFUDf2VqHUDNfvQ1TxMGfkDmMVP0sCsqnf4j8sZBD9uiDW2WKf?=
 =?us-ascii?Q?8lN86UTMPDz7FfNYAvodNWb4ctGxyrD+DjBjex20w90mLnf+JqnCjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eJyoPhX5F8RFuo6Sz23sTUNS6gj+f9MckfKRwdduN/VhHPbJMR318elbJHB1?=
 =?us-ascii?Q?1KO9Q7IS63dJp61zc2P6X/PeE38woKCo6yChzjP1gYZDgpeZ3KCztq3E+KOt?=
 =?us-ascii?Q?Pr2ZIDvKDEj0tpcdhAK9LmUvxLRfzwcdAbbyqdfihlvOVZPgSNs/eJOgWG1j?=
 =?us-ascii?Q?fDoxHeRjNt1fuWNnuDLBGAZZ6Ii7QIwLeRG8I6krzmdsnRjzH2h0KoBmjjuF?=
 =?us-ascii?Q?9ISj9LY/JXHUT7tbjnOpQnlhb8jIiqqHhET6MsIRCAR/vlkjE9Y82VrXurox?=
 =?us-ascii?Q?4iNiHO81fMY6BFpPxaPqCNnWAKBAKiWp0STmVdnZSI60dRzOtfpRi217DOtF?=
 =?us-ascii?Q?i4TmbHEgpHYMiMVgEPgWFy69Tv+8zTN7mdhwXD22FULg7ks0j4WbkLbnb2Qp?=
 =?us-ascii?Q?SSMOX7gTUZPXYrFjrJdDq2+WKJWBNLv7eD04AAuc4DDp4e7rEhy87q8mfuWn?=
 =?us-ascii?Q?Mxha2qEZ5Ve+odFB0P89L4KwJCf+w3RiJMrhXhugINKkxrVm2yr4wAD5ItMh?=
 =?us-ascii?Q?Qd6BbByeTN4Wub0eSv6Xc6sJrrJTeVbf9pWp2FqiXsfEAPOJ51/jhdzzfFQD?=
 =?us-ascii?Q?iJQbCX0pxJj0Jv6CowGzaslCX4nPt+JA7mKDLUdUIAK1+nfahpKcpLGlSXHj?=
 =?us-ascii?Q?1gBDqfW4E3L+CWg7gqHMAwGJyp1gPtwGtEGx6oQENWe8nRd1dccMI5gycV4J?=
 =?us-ascii?Q?CNnZ2rUgG32Hu2aEUGRShhcjFgWhLLQCJyVXlUXnbeOjbhSA4Ll637wjop2l?=
 =?us-ascii?Q?taIsGUaDFxrqgnn95gQtlhNvUQry59E5IiR8eTMwMVkdh6owXocXus/F6ZQm?=
 =?us-ascii?Q?7u62PsH2bbOvcKS0YEDTqSWjn1nPVZIvajnCtHYefAIXh2M8yw5RVLaKaA1U?=
 =?us-ascii?Q?8LmB9HoNL95y7WFFNs+IkA+hEs9DnZm0k3u4JTDLbhd53OcNqllx3CXm4S2t?=
 =?us-ascii?Q?+KFIX0F56V1EcGWfT6R5yXe6PG5iRI4F6dDAn3TLREZTe4oC6Y/QIaC/7zcY?=
 =?us-ascii?Q?fmxvOux1/+DHeOiui7lGlsKTAs0lSSuDPd2xgNZET4adg7Ylm0rDhLLL7zp3?=
 =?us-ascii?Q?DSUiG9S/B2zA4rj8/vf+yqaFuygJIOo/ImCIpbYjtt7Vowza1DpNXpQrUfVd?=
 =?us-ascii?Q?L3EAfJ5UEqhbYFRWjY4VqhsI6sNxN3OxxgfUKOKUK4lyzBE7j2oD7j1zuCQM?=
 =?us-ascii?Q?KavaSu3g4pY9Myd6gelofTSmtU+n3BVU49EutfGQyfLAMkv8aICAz1xlpR7x?=
 =?us-ascii?Q?0u2yAzwA7eo9K7ZBx2rs7aY+lYctVQPJNsJ0AnJuLZXZVOCr2UUsaK8zg8ZH?=
 =?us-ascii?Q?RONzfn15Jma5HdsA3MzW/AkhIN/SEp/tBxl1GoIRPhgydCVZmQeikPuFIS8o?=
 =?us-ascii?Q?iPkAcabbGmEAdQU8XyNnknNA3NyQd3lMvESa8LAyk7Q6yqKE8tieEevd/z6J?=
 =?us-ascii?Q?Ux4bwoR+cbU/5anQs3ifD4DZ0EVSs2gvUco7wW/UmCsA8n55gXuGyecLgzP5?=
 =?us-ascii?Q?Q/nO7+tKogVRIVNfLUwEoDuJIE/GgH0d6k/c/jlOTCn4M9sB2EKRQi0WbOJZ?=
 =?us-ascii?Q?Iehi6M7OH2MROtht8Z69RXUCLXP4sSREDlio8fc4zlU6Hle0nuPkvnLeFFGz?=
 =?us-ascii?Q?cfGpf5UzJl2RE4/6vW8WLz1e9FWoCRMZFtD3ewon8pG2828GzCgloU2h37d3?=
 =?us-ascii?Q?SPaKDJosIlnEXxAqmr/+7eT/pfA+Z5EeHjbRTyZlRCXBbvwsbAX1QkaEw0eV?=
 =?us-ascii?Q?TgchOmFAZw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e26e6754-0f83-441d-1302-08de51aefd79
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:48:35.4338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djzU6U7RhnTcDTQ06sMwCMAlPyy7qDr8fVds+jvKOoUG+WgbAhFY/mLlFGe5Vxr2dix9tssVq7Bt9g3yaUfssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "page_allocation_failure:order:#,mode:#(__GFP_ZERO|__GFP_COMP),nodemask=(null),cpuset=(null),mems_allowed=" on:

commit: da80cfb7e23e7d84297f9d24a2a70a014daa0a0c ("mm: restrict slub, compaction, and page_alloc to sysram")
https://github.com/gourryinverse/linux scratch/gourry/isolation/v2

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------------------------------------------------------------+------------+------------+
|                                                                                                           | 71291215b3 | da80cfb7e2 |
+-----------------------------------------------------------------------------------------------------------+------------+------------+
| boot_successes                                                                                            | 15         | 0          |
| boot_failures                                                                                             | 0          | 15         |
| page_allocation_failure:order:#,mode:#(__GFP_ZERO|__GFP_COMP),nodemask=(null),cpuset=(null),mems_allowed= | 0          | 15         |
| Mem-Info                                                                                                  | 0          | 15         |
| BUG:kernel_NULL_pointer_dereference,address                                                               | 0          | 15         |
| Oops                                                                                                      | 0          | 15         |
| RIP:mem_cgroup_show_protected_memory                                                                      | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception                                                                  | 0          | 15         |
+-----------------------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601121442.caec9510-lkp@intel.com


[    0.189983][    T0] software IO TLB: area num 2.
[    0.221422][    T0] Fallback order for Node 0: 0
[    0.221429][    T0] Built 1 zonelists, mobility grouping on.  Total pages: 8388478
[    0.223346][    T0] Policy zone: Normal
[    0.223999][    T0] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.247639][    T0] swapper: page allocation failure: order:0, mode:0x40100(__GFP_ZERO|__GFP_COMP), nodemask=(null),cpuset=(null),mems_allowed=0-1023
[    0.250008][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc3-00002-gda80cfb7e23e #1 PREEMPT(undef)
[    0.250015][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.250019][    T0] Call Trace:
[    0.250024][    T0]  <TASK>
[    0.250029][    T0]  dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:123)
[    0.250040][    T0]  warn_alloc (kbuild/src/consumer/mm/page_alloc.c:4005)
[    0.250068][    T0]  __alloc_pages_slowpath (kbuild/src/consumer/mm/page_alloc.c:?)
[    0.250073][    T0]  __alloc_frozen_pages_noprof (kbuild/src/consumer/mm/page_alloc.c:?)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260112/202601121442.caec9510-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


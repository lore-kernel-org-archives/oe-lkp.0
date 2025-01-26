Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829FF25A624
	for <oe-lkp@lists.linux.dev>; Sun, 26 Jan 2025 05:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737868672; cv=fail; b=f1jkY3ypwGfQ3qsNHgZcJEAWGw088l2WceK+dRWlwIZHu5zkNBqbLFzvJfV2uHe1Hu6WPEoEJDA+GWifZhp0CIIoViMmjNOovzwyZwJ+0pLx/JH0ymhDr6WJl15mBX1hzsd6xm4KcNEEvIMdCYApEV2dQbRHPaJSqmVgBpwXLPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737868672; c=relaxed/simple;
	bh=s8o1VG7YfdNQk9+HiXPa3Y/hAIRJn17TeQrKOOuG05g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dlNU6LlhlnjrRAqPzOV2D6FSGm7I+3QSRgR41ZP3HfKx2XpTrI6vGpS4WiaCDjtj1xZp8U8u+zZ+xD2MpW4VLLZrybvfgqQxeBOv29SImeil9mWjAAujXY4LGeYayyPhdr3M3CyZER+ZGaOjWTK3s9C7OKytLwe/vMC2p/Luk60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5p6yk3G; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5p6yk3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737868670; x=1769404670;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=s8o1VG7YfdNQk9+HiXPa3Y/hAIRJn17TeQrKOOuG05g=;
  b=f5p6yk3GBZqo/VZmOMdnssgj2StHnHZkYD8DDQS885kfcDZfS+PqXrXh
   BwXH4cMn2D2Pwtw6LVbIMeLzUrnL0aefqwfWPq4lLpbuYW5ju4HfM2RO3
   a8WjMdGESW+L6b3QLYrRcWvRXk28dhERbqrCCyn4aMmAPlWJZBcy1HApq
   oPcWtc5fRNhWeiEp8ISfNwcAXVSE7d6bMFa2DskYMKWswtJFZNA8WtAbt
   wQUYybunkmRH2M1FVG8WlZjMr6zfK9gXwkhe7tIQqTXz3wpl2kdLgmaIl
   DU8NpTaUr/eSKqbLmFMQSSkyNTpSQMiVB8xYtKhScmWJPiAjm0BcKxl9A
   g==;
X-CSE-ConnectionGUID: yLXB6IXkSs+02MHGusk7lg==
X-CSE-MsgGUID: yX1OMUR1QSuD4MGlaKMt9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="55898679"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="55898679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 21:17:50 -0800
X-CSE-ConnectionGUID: 8kOTSkUJSI6w0cQ05r0vxg==
X-CSE-MsgGUID: 2U1FQOF1SK2vq7RRMsrgnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138991604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2025 21:17:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 21:17:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 21:17:49 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 21:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMwMA8DgHM3FDKMy1tWrVGRL3BjhmpiVkRkMx76NiuM4Ov3dBUpgnB7JEy1SDqfOTlRqYZKgSmppCI1zKmE8FkS2QKtC8VkNZXELSEceSTyt2NG1SSTkXMca4skrhZQ74+cZpEcMDbMlVxX/Ya45nfVyACGLQGyACsdb0vUKAO9d0RiItPZJw1P7heWKxdwaxTDKRh1IchFD6R2yKSDKdCbuF/kgB9fPVA33w9Iz7I5nAA7vP8MkYDqChmRYNTkXfnk0p4VDXb2kB7Z5ApyBa9D9K3FkCgAbTxaEC1TzbhpjWmoPpZcqGPTneKlvNimIv6amybqyFF4gB8+r9dPB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GV872AC/G7Od2UIonRX/S7FncLn2+sYaDbHdHa4Kqw=;
 b=oWL+u3K6xDRffpAup6o+Q9YJvNtsrZ/jVlP/7x4ms9rYQJICtrcAPFelbYgghVUqcBBDX+A38thmr1PhPzxnU7GBEOwwpqI1zeIAIfBFmZMSlSX0wXdi1WbkCA2VvEYiaBTF6z5IRz2v+t7iXgjfFSS7kHgHUzuAsnj4WFf1XN3zujBgLCAs6FNi2CGTUj8Y7Lku9Jgq1jJQ006AdS+6iRzqUNSg+6VZKoZuv4aju0yeR77rQDRdYMW1ZBMi8wA5xUPqgKXTGZSKfecLyOhnJfxBEVrKZrTZa1fgj4h4LKrxBxtZT2picF6PNiur9U0ETlIr92JfVocVufU5hDJigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 05:17:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.009; Sun, 26 Jan 2025
 05:17:46 +0000
Date: Sun, 26 Jan 2025 13:17:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:module_v3] [bpf]  1c7701f3dd:
 WARNING:at_kernel/module/main.c:#module_put
Message-ID: <202501260918.fb95ce00-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: KL1PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c07046f-4fa6-4a91-dbce-08dd3dc8c4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G6EbCDIuy7xK1c6wUN7eekBVO/YVmXmDM0513lkg26oY6hZMM3cruhFxYNy/?=
 =?us-ascii?Q?5BqgZCzYNxvK+EOCuT3uT1G/AbQ0CdVLrm8HdAAvuxAKgujlRCTYp+O/YiOM?=
 =?us-ascii?Q?mH6zNtqYpU1pFV4HwStcDcxaEUQZgVisIvLj5rsan4axkcEPpbutoJRMtIBq?=
 =?us-ascii?Q?bklOlGIt2jMQXILD78xbC9FTMYmTBBAVOQ7dGTF+6HFX514Sxy4jHsMz6bgn?=
 =?us-ascii?Q?xeH9pHztNaTFa7MiCuLSZj44HQFlBwGXX4zD7g/IPMJYg7M5K3yH1nGti9lm?=
 =?us-ascii?Q?EOyax6HJu4MisdzHdRkWXXWfMyIWM/mF7DzbgOnG9i0dwQG6eDlt9TeQP7IB?=
 =?us-ascii?Q?ibTnd4wKaUQ+tlrMjSAaBeCavr/YpS1OSaofFMOssf84yyjTBeSjorZDLBnj?=
 =?us-ascii?Q?jUvaAvMJmuQjnkSNpzm/YrGWOnYq54rWqpol0/gmpKXTk8yeIHAhsPwrDCVT?=
 =?us-ascii?Q?PiFHeuipm7/bs69BVcMr2SZMSTyc/quhECrdjqOU6hRtaMA9FfERjJPN3po4?=
 =?us-ascii?Q?DJIzkCEnS+yXHM82aN0WCEzVc4owut2b208uuWR7ZmK7j3Y66X3K8ENwV9zg?=
 =?us-ascii?Q?7RVXG3YjEb89hpdp6CCBbB/98ijLEbVvYBYfi30A+9NqLigr/7RGlWgAQkNQ?=
 =?us-ascii?Q?/1EiTJDboQsC8CqcAOLFHOOfVovxwwbAjPdQanZNCygYN9l1Bl3E2/DWMfLF?=
 =?us-ascii?Q?hUldZoRs9oFM7O9niTC1uJVKwBHhjvivaO2wonIkE2Yxqge3OZzVQoehtXlR?=
 =?us-ascii?Q?TY1MYovEVm/DsTTn0Ug+XsXOosKZdLQExLU0+8uZwWIlF+RWXKTnkZ6vhG4w?=
 =?us-ascii?Q?3M3SvaRyt1eGg43xmwcXxu7MtTMRkgPhD+fqqBTU7VkA4j9VDBT0Z/8VwEpa?=
 =?us-ascii?Q?JWuXaYdLw/BNRJIfzoiscy6DfSt/URjiOf5KV3CihlTcsajAft8R3lBaGZ9A?=
 =?us-ascii?Q?k1vLyxsJEyCqLtBoRBM9oL6GvP++S/XF098toQflVBe+mP4erdW4Eo39w6VU?=
 =?us-ascii?Q?Pjl0RAHDByMLZX2vmT1qTN2tBQEf92xdpQo7iFenVud/vgBtxJGeT5kAzC8u?=
 =?us-ascii?Q?K9aGi5gGXnfhwSfFlZkUx/FbUiqfCcuP/QadoR28YGPrH84B/asYAW/0bt9F?=
 =?us-ascii?Q?JWhdc2dXxjYkjsiIEP4FF5IU3ABOnVUt1hSGMPwC4UJVJx54CvTooZitQA+7?=
 =?us-ascii?Q?JNNd2Iif8BkCYqZiMZhsZgvkb7rmucdf3ijeTdUj8azJ4N+dKXfctxfw44d0?=
 =?us-ascii?Q?2Q1gdPtvftTN1ggj5FQp/yqqanLRMZNvQa/QxZuxnL7dQVANz1smho2cgNH/?=
 =?us-ascii?Q?2VUHfbjlw6RBOYS4oAhF43f2e5BrF4YTTTdUdiwftgfyyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WDUA/UJEG9bwCpAcren5/yUWTORo2UriKb7gB3B73a69i76YJwMg7r4Cppjc?=
 =?us-ascii?Q?6SA9tP+q1bvDjSRRzpswFnwvBWF4idm3P3f0HOCvoh7RyLJR/X3r0B5EiIcl?=
 =?us-ascii?Q?d8JmEONuY/wsBrXkZKXsrcsEoFvOWhJQa+/23M2gBNEGaAHW+RbOdWSzI2RL?=
 =?us-ascii?Q?qA/cvj/PGS/L/s558U3SN4hHaDqi5PFsOoq1r6FZx4KNJ8Ro0iQ8C7zosvNP?=
 =?us-ascii?Q?RO9+5AHjkYWsrlaW1eMpdIm8rUSybF1QqHM8cIh+vRDpxNmJY7qPJ7zzo8ia?=
 =?us-ascii?Q?2LPei+k4FhZ6ksf7Txbkw6oucVonK53bwYZuiTBaLnCLKAF+Q22rjHiAuSe4?=
 =?us-ascii?Q?tlzsOGMTzt72y3x7bWVLffyuR8yN2olhLCXwZQa4u9gx/wj2lJLzQJApqiMB?=
 =?us-ascii?Q?YdIoI4Kjo7P9hh72HG10YI+xKoWwW7rdyr6BlqA1nPzAP5bwYvPAwYkhIMCK?=
 =?us-ascii?Q?MU1Gb2QJi3xLXI3jB6k2Oo4AVUzeVQOVvGiT2WrVG6qS41VO2Q/HQmmldVes?=
 =?us-ascii?Q?J4sNyQk3hmn6DBFNiFj/VUSKu/md50Ej8NZaywf/15LJInsMmyuCnTFignO3?=
 =?us-ascii?Q?cH4/IwYFZfLNtJHZcyZEASeRV1cxT6SVhpLB8MSoNsjV5Z80rrlnt9OqbI34?=
 =?us-ascii?Q?u/Qz6FSBInJvsHKyScZJlnZ0T8kIz9NZCTxe1pyehx4lyCXHDZPmBAIG/Vpn?=
 =?us-ascii?Q?5GhKlrTxCaQZ0RMJJ9i+WCGHr3P8Sp38bicuehHL3U765FLPSmzI9MfmZWUe?=
 =?us-ascii?Q?FBvMXhQXQFjP6282GVcY+zR51VUpdvgA5XB7PrSECIrMEIEu+bAh/JETi3/o?=
 =?us-ascii?Q?W0b2E71VPztqbOBrMxkMCfXOYZ0QmDMZXpP1pLP7Z77sAPloWEiHXv6s74CI?=
 =?us-ascii?Q?w0kvdyiCHVhJu/gqB3suDrZj6B2nfyfm2Yvw5LfmTx5//gLRJBUIwKzvkMAo?=
 =?us-ascii?Q?ZinSqORWh5Ub2NSWEeOO/WyZm5cLZiDwIuiDubYybC29pddhwv+dIkArh1Mr?=
 =?us-ascii?Q?NZRRz7ETsza0JpS/d0eHyyxwS9WhIa8QusOl69wjp13Xk0orJiPqBvvFuwzL?=
 =?us-ascii?Q?rWDn4k5f26D3H0uXRPq8dpgtNJl36Kr05Trqs4jQ7ZOwGGs5yEMTCLm3d/8A?=
 =?us-ascii?Q?0pCCtYdh5x1dN1L5HI55hVzDUe+tpG+hPexpuS85jJeZaCE4kl6LgwR9SH8T?=
 =?us-ascii?Q?sQQxBDGFYn8Mo/RxSWWL7byCXu/2/EZudMu7bbkTM1t9UzmnE6GXtp3WrMWo?=
 =?us-ascii?Q?WX99PxVGM4T3bgSM8waypuplaWncBc7s6wv9jmcF5kvsfgYImdCywaE5t3gr?=
 =?us-ascii?Q?h9iFiY27Pu5tERrs6CsWe3cAQOJdGpdzxaMhQGzkc/17avWlejeZaXDH1KTk?=
 =?us-ascii?Q?B2VJeu9bAej4uon7YJzH7MqfNKe7IFGpJyKL7G0Z0S8432nwqZp0P1ialZhr?=
 =?us-ascii?Q?GMDkuN0x5giuZPa4F8qR8Mb9Znccu/mVqsmyx2UFe2j98G3GvtMFJpsuk+Ti?=
 =?us-ascii?Q?UBCl9IXdVamzY+Smkb6Ygp8rfuHSQOzEDq15KIibXBZ4LD9BB7n64qAW5zGr?=
 =?us-ascii?Q?3M4VVQ3Nwx9wAeEnoe5rAmuL11ekUwHt8edzI01pcUsnOefV7HkHFeLuybVY?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c07046f-4fa6-4a91-dbce-08dd3dc8c4c8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 05:17:46.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GplZr70ipaz6gOXDi6PHqQSE8/7gz5kI322aTUVmM+hVfJPrLcIYKCxy2Rl6d04b6ocMlNntYvK9lpCz+QpHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/module/main.c:#module_put" on:

commit: 1c7701f3dda185212b05ce57b783ec9f40d599ee ("bpf: Use RCU in all user=
s of __module_text_address().")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git module_v3

in testcase: kernel-selftests-bpf
version:=20
with following parameters:

	group: bpf



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (=
Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501260918.fb95ce00-lkp@intel.co=
m



[ 2192.902410][T62425] ------------[ cut here ]------------
[ 2192.907741][T62425] WARNING: CPU: 5 PID: 62425 at kernel/module/main.c:8=
75 module_put+0x48/0x60
[ 2192.917080][T62425] Modules linked in: tun ipip tunnel4 ip_tunnel iptabl=
e_raw xt_connmark bpf_testmod(OE) veth cls_bpf sch_ingress rpcsec_gss_krb5 =
auth_rpcgss nfsv4 dns_resolver openvswitch nf_conncount nf_nat nf_conntrack=
 nf_defrag_ipv6 nf_defrag_ipv4 psample snd_hda_codec_hdmi snd_ctl_led snd_h=
da_codec_realtek snd_hda_codec_generic snd_hda_scodec_component intel_rapl_=
msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common =
btrfs blake2b_generic xor zstd_compress raid6_pq snd_soc_avs libcrc32c snd_=
soc_hda_codec snd_hda_ext_core x86_pkg_temp_thermal i915 intel_powerclamp s=
d_mod coretemp dell_pc dell_wmi snd_soc_core sg cec kvm_intel snd_compress =
dell_smbios drm_buddy kvm ttm snd_hda_intel snd_intel_dspcfg drm_display_he=
lper snd_intel_sdw_acpi crct10dif_pclmul snd_hda_codec crc32_pclmul ipmi_de=
vintf crc32c_intel drm_kms_helper ghash_clmulni_intel ipmi_msghandler snd_h=
da_core mei_wdt intel_gtt dell_wmi_aio wmi_bmof snd_hwdep agpgart rapl i2c_=
designware_platform sparse_keymap dell_wmi_descriptor
[ 2192.917382][T62425]  i2c_designware_core ahci snd_pcm intel_cstate video=
 platform_profile dcdbas snd_timer libahci mei_me intel_uncore pcspkr i2c_i=
801 intel_lpss_pci intel_pmc_core snd intel_lpss i2c_smbus soundcore libata=
 mei idma64 intel_vsec wmi pinctrl_sunrisepoint pmt_telemetry acpi_pad pmt_=
class binfmt_misc drm dm_mod ip_tables x_tables sch_fq_codel [last unloaded=
: bpf_test_modorder_x(OE)]
[ 2193.042104][T62425] CPU: 5 UID: 0 PID: 62425 Comm: test_progs Tainted: G=
 S      W  OE      6.13.0-rc6-00025-g1c7701f3dda1 #1
[ 2193.053378][T62425] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN, [O]=3DOO=
T_MODULE, [E]=3DUNSIGNED_MODULE
[ 2193.062114][T62425] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[ 2193.070263][T62425] RIP: 0010:module_put+0x48/0x60
[ 2193.075695][T62425] Code: 48 89 df e8 5a f1 3f 00 8b 85 80 05 00 00 89 c=
2 83 ea 01 78 15 f0 0f b1 13 75 f3 48 8b 74 24 10 48 89 ef 5b 5d e9 a8 fe f=
f ff <0f> 0b 48 8b 74 24 10 48 89 ef 5b 5d e9 97 fe ff ff 0f 1f 80 00 00
[ 2193.095187][T62425] RSP: 0018:ffff88826a227ac0 EFLAGS: 00010297
[ 2193.101136][T62425] RAX: 0000000000000000 RBX: ffffffffc13e1c40 RCX: dff=
ffc0000000000
[ 2193.108990][T62425] RDX: 00000000ffffffff RSI: ffffffff812c8e26 RDI: fff=
fffffc13e1c40
[ 2193.116847][T62425] RBP: ffffffffc13e16c0 R08: 0000000000000001 R09: fff=
ffbfff827c388
[ 2193.124718][T62425] R10: ffffffffc13e1c43 R11: 0000000000000000 R12: fff=
f8881827f5018
[ 2193.132575][T62425] R13: ffff8881886d1710 R14: 0000000000000010 R15: fff=
fffff82f9d240
[ 2193.140446][T62425] FS:  00007fe81554f0c0(0000) GS:ffff888733880000(0000=
) knlGS:0000000000000000
[ 2193.149261][T62425] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2193.155744][T62425] CR2: 000056474c61f000 CR3: 00000003c5a90005 CR4: 000=
00000003726f0
[ 2193.163599][T62425] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[ 2193.171467][T62425] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[ 2193.179320][T62425] Call Trace:
[ 2193.182504][T62425]  <TASK>
[ 2193.185328][T62425]  ? module_put+0x48/0x60
[ 2193.190150][T62425]  ? __warn+0x9d/0x140
[ 2193.194104][T62425]  ? module_put+0x48/0x60
[ 2193.198934][T62425]  ? report_bug+0x1a6/0x1d0
[ 2193.203331][T62425]  ? handle_bug+0x53/0xa0
[ 2193.207544][T62425]  ? exc_invalid_op+0x13/0x40
[ 2193.212106][T62425]  ? asm_exc_invalid_op+0x16/0x20
[ 2193.217030][T62425]  ? module_put+0x26/0x60
[ 2193.221855][T62425]  ? module_put+0x48/0x60
[ 2193.226682][T62425]  bpf_kprobe_multi_link_release+0x50/0x60
[ 2193.232375][T62425]  bpf_link_free+0x79/0x110
[ 2193.236763][T62425]  bpf_link_release+0x31/0x40
[ 2193.241324][T62425]  __fput+0x1eb/0x4b0
[ 2193.245205][T62425]  __x64_sys_close+0x50/0x90
[ 2193.249695][T62425]  do_syscall_64+0x8c/0x170
[ 2193.254088][T62425]  ? lock_acquire+0x123/0x2e0
[ 2193.258670][T62425]  ? __might_fault+0x74/0xc0
[ 2193.263153][T62425]  ? find_held_lock+0x83/0xa0
[ 2193.267716][T62425]  ? __might_fault+0x74/0xc0
[ 2193.272195][T62425]  ? __lock_release+0x130/0x260
[ 2193.277536][T62425]  ? __might_fault+0x74/0xc0
[ 2193.282018][T62425]  ? __pfx___lock_release+0x10/0x10
[ 2193.287728][T62425]  ? __might_fault+0x74/0xc0
[ 2193.292211][T62425]  ? rcu_is_watching+0x1c/0x50
[ 2193.296872][T62425]  ? trace_rseq_update+0xb9/0xf0
[ 2193.301700][T62425]  ? __rseq_handle_notify_resume+0x321/0x3a0
[ 2193.307578][T62425]  ? __pfx___rseq_handle_notify_resume+0x10/0x10
[ 2193.313791][T62425]  ? __x64_sys_close+0x50/0x90
[ 2193.318483][T62425]  ? rcu_is_watching+0x1c/0x50
[ 2193.323132][T62425]  ? mark_held_locks+0x24/0x90
[ 2193.327787][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 2193.333655][T62425]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 2193.339262][T62425]  ? do_syscall_64+0x98/0x170
[ 2193.343829][T62425]  ? mark_held_locks+0x24/0x90
[ 2193.348481][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 2193.354346][T62425]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 2193.359949][T62425]  ? do_syscall_64+0x98/0x170
[ 2193.364512][T62425]  ? mark_held_locks+0x24/0x90
[ 2193.369163][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 2193.375031][T62425]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 2193.380822][T62425] RIP: 0033:0x7fe81564898a
[ 2193.385122][T62425] Code: 48 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 0=
0 48 83 ec 18 89 7c 24 0c e8 a3 ce f8 ff 8b 7c 24 0c 89 c2 b8 03 00 00 00 0=
f 05 <48> 3d 00 f0 ff ff 77 36 89 d7 89 44 24 0c e8 03 cf f8 ff 8b 44 24
[ 2193.404603][T62425] RSP: 002b:00007ffd9c026160 EFLAGS: 00000293 ORIG_RAX=
: 0000000000000003
[ 2193.412908][T62425] RAX: ffffffffffffffda RBX: 00007ffd9c026578 RCX: 000=
07fe81564898a
[ 2193.420776][T62425] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
000000000002c
[ 2193.428632][T62425] RBP: 00007ffd9c026190 R08: 0027c793795a4932 R09: 000=
0000000000064
[ 2193.436485][T62425] R10: 00007fe815a96000 R11: 0000000000000293 R12: 000=
0000000000000
[ 2193.444339][T62425] R13: 00007ffd9c026588 R14: 0000564738b8b110 R15: 000=
07fe815ace020
[ 2193.452238][T62425]  </TASK>
[ 2193.455144][T62425] irq event stamp: 21447965
[ 2193.459529][T62425] hardirqs last  enabled at (21447977): [<ffffffff8126=
1e72>] __up_console_sem+0x52/0x60
[ 2193.469127][T62425] hardirqs last disabled at (21447994): [<ffffffff8126=
1e57>] __up_console_sem+0x37/0x60
[ 2193.478724][T62425] softirqs last  enabled at (21447990): [<ffffffff8115=
4a85>] handle_softirqs+0x255/0x370
[ 2193.488423][T62425] softirqs last disabled at (21447985): [<ffffffff8115=
4d39>] __irq_exit_rcu+0x129/0x150
[ 2193.498016][T62425] ---[ end trace 0000000000000000 ]---
[ 2193.503378][T62425] ------------[ cut here ]------------
[ 2193.508718][T62425] WARNING: CPU: 5 PID: 62425 at kernel/module/main.c:8=
75 module_put+0x48/0x60
[ 2193.518100][T62425] Modules linked in: tun ipip tunnel4 ip_tunnel iptabl=
e_raw xt_connmark bpf_testmod(OE) veth cls_bpf sch_ingress rpcsec_gss_krb5 =
auth_rpcgss nfsv4 dns_resolver openvswitch nf_conncount nf_nat nf_conntrack=
 nf_defrag_ipv6 nf_defrag_ipv4 psample snd_hda_codec_hdmi snd_ctl_led snd_h=
da_codec_realtek snd_hda_codec_generic snd_hda_scodec_component intel_rapl_=
msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common =
btrfs blake2b_generic xor zstd_compress raid6_pq snd_soc_avs libcrc32c snd_=
soc_hda_codec snd_hda_ext_core x86_pkg_temp_thermal i915 intel_powerclamp s=
d_mod coretemp dell_pc dell_wmi snd_soc_core sg cec kvm_intel snd_compress =
dell_smbios drm_buddy kvm ttm snd_hda_intel snd_intel_dspcfg drm_display_he=
lper snd_intel_sdw_acpi crct10dif_pclmul snd_hda_codec crc32_pclmul ipmi_de=
vintf crc32c_intel drm_kms_helper ghash_clmulni_intel ipmi_msghandler snd_h=
da_core mei_wdt intel_gtt dell_wmi_aio wmi_bmof snd_hwdep agpgart rapl i2c_=
designware_platform sparse_keymap dell_wmi_descriptor


... <very long similar dmesg here>


[ 3821.303878][T62425] ------------[ cut here ]------------
[ 3821.309187][T62425] WARNING: CPU: 5 PID: 62425 at kernel/module/main.c:8=
75 module_put+0x48/0x60
[ 3821.318480][T62425] Modules linked in: tun ipip tunnel4 ip_tunnel iptabl=
e_raw xt_connmark bpf_testmod(OE) veth cls_bpf sch_ingress rpcsec_gss_krb5 =
auth_rpcgss nfsv4 dns_resolver openvswitch nf_conncount nf_nat nf_conntrack=
 nf_defrag_ipv6 nf_defrag_ipv4 psample snd_hda_codec_hdmi snd_ctl_led snd_h=
da_codec_realtek snd_hda_codec_generic snd_hda_scodec_component intel_rapl_=
msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common =
btrfs blake2b_generic xor zstd_compress raid6_pq snd_soc_avs libcrc32c snd_=
soc_hda_codec snd_hda_ext_core x86_pkg_temp_thermal i915 intel_powerclamp s=
d_mod coretemp dell_pc dell_wmi snd_soc_core sg cec kvm_intel snd_compress =
dell_smbios drm_buddy kvm ttm snd_hda_intel snd_intel_dspcfg drm_display_he=
lper snd_intel_sdw_acpi crct10dif_pclmul snd_hda_codec crc32_pclmul ipmi_de=
vintf crc32c_intel drm_kms_helper ghash_clmulni_intel ipmi_msghandler snd_h=
da_core mei_wdt intel_gtt dell_wmi_aio wmi_bmof snd_hwdep agpgart rapl i2c_=
designware_platform sparse_keymap dell_wmi_descriptor
[ 3821.318709][T62425]  i2c_designware_core ahci snd_pcm intel_cstate video=
 platform_profile dcdbas snd_timer libahci mei_me intel_uncore pcspkr i2c_i=
801 intel_lpss_pci intel_pmc_core snd intel_lpss i2c_smbus soundcore libata=
 mei idma64 intel_vsec wmi pinctrl_sunrisepoint pmt_telemetry acpi_pad pmt_=
class binfmt_misc drm dm_mod ip_tables x_tables sch_fq_codel [last unloaded=
: bpf_test_modorder_x(OE)]
[ 3821.442859][T62425] CPU: 5 UID: 0 PID: 62425 Comm: test_progs Tainted: G=
 S      W  OE      6.13.0-rc6-00025-g1c7701f3dda1 #1
[ 3821.454053][T62425] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN, [O]=3DOO=
T_MODULE, [E]=3DUNSIGNED_MODULE
[ 3821.462742][T62425] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[ 3821.470839][T62425] RIP: 0010:module_put+0x48/0x60
[ 3821.476272][T62425] Code: 48 89 df e8 5a f1 3f 00 8b 85 80 05 00 00 89 c=
2 83 ea 01 78 15 f0 0f b1 13 75 f3 48 8b 74 24 10 48 89 ef 5b 5d e9 a8 fe f=
f ff <0f> 0b 48 8b 74 24 10 48 89 ef 5b 5d e9 97 fe ff ff 0f 1f 80 00 00
[ 3821.495686][T62425] RSP: 0018:ffff88826a227ac0 EFLAGS: 00010297
[ 3821.501603][T62425] RAX: 0000000000000000 RBX: ffffffffc06fae00 RCX: dff=
ffc0000000000
[ 3821.509424][T62425] RDX: 00000000ffffffff RSI: ffffffff812c8e26 RDI: fff=
fffffc06fae00
[ 3821.517273][T62425] RBP: ffffffffc06fa880 R08: 0000000000000001 R09: fff=
ffbfff80df5c0
[ 3821.525094][T62425] R10: ffffffffc06fae03 R11: 0000000000000000 R12: fff=
f8881827f5018
[ 3821.532915][T62425] R13: ffff8881886d1710 R14: 0000000000000010 R15: fff=
fffff82f9d240
[ 3821.540740][T62425] FS:  00007fe81554f0c0(0000) GS:ffff888733880000(0000=
) knlGS:0000000000000000
[ 3821.549511][T62425] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3821.555959][T62425] CR2: 000056474c61f000 CR3: 00000003c5a90005 CR4: 000=
00000003726f0
[ 3821.563798][T62425] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[ 3821.571635][T62425] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[ 3821.579460][T62425] Call Trace:
[ 3821.582610][T62425]  <TASK>
[ 3821.585415][T62425]  ? module_put+0x48/0x60
[ 3821.590212][T62425]  ? __warn+0x9d/0x140
[ 3821.594146][T62425]  ? module_put+0x48/0x60
[ 3821.598948][T62425]  ? report_bug+0x1a6/0x1d0
[ 3821.603345][T62425]  ? handle_bug+0x53/0xa0
[ 3821.607544][T62425]  ? exc_invalid_op+0x13/0x40
[ 3821.612088][T62425]  ? asm_exc_invalid_op+0x16/0x20
[ 3821.616998][T62425]  ? module_put+0x26/0x60
[ 3821.621804][T62425]  ? module_put+0x48/0x60
[ 3821.626616][T62425]  bpf_kprobe_multi_link_release+0x50/0x60
[ 3821.632316][T62425]  bpf_link_free+0x79/0x110
[ 3821.636684][T62425]  bpf_link_release+0x31/0x40
[ 3821.641223][T62425]  __fput+0x1eb/0x4b0
[ 3821.645085][T62425]  __x64_sys_close+0x50/0x90
[ 3821.649537][T62425]  do_syscall_64+0x8c/0x170
[ 3821.653911][T62425]  ? lock_acquire+0x123/0x2e0
[ 3821.658446][T62425]  ? __might_fault+0x74/0xc0
[ 3821.662902][T62425]  ? find_held_lock+0x83/0xa0
[ 3821.667443][T62425]  ? __might_fault+0x74/0xc0
[ 3821.671899][T62425]  ? __lock_release+0x130/0x260
[ 3821.677214][T62425]  ? __might_fault+0x74/0xc0
[ 3821.681670][T62425]  ? __pfx___lock_release+0x10/0x10
[ 3821.687364][T62425]  ? __might_fault+0x74/0xc0
[ 3821.691820][T62425]  ? rcu_is_watching+0x1c/0x50
[ 3821.696442][T62425]  ? trace_rseq_update+0xb9/0xf0
[ 3821.701276][T62425]  ? __rseq_handle_notify_resume+0x321/0x3a0
[ 3821.707117][T62425]  ? __pfx___rseq_handle_notify_resume+0x10/0x10
[ 3821.713338][T62425]  ? __x64_sys_close+0x50/0x90
[ 3821.717964][T62425]  ? rcu_is_watching+0x1c/0x50
[ 3821.722587][T62425]  ? mark_held_locks+0x24/0x90
[ 3821.727232][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 3821.733108][T62425]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 3821.738685][T62425]  ? do_syscall_64+0x98/0x170
[ 3821.743232][T62425]  ? mark_held_locks+0x24/0x90
[ 3821.747894][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 3821.753745][T62425]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[ 3821.759339][T62425]  ? do_syscall_64+0x98/0x170
[ 3821.763892][T62425]  ? mark_held_locks+0x24/0x90
[ 3821.768523][T62425]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[ 3821.774378][T62425]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 3821.780140][T62425] RIP: 0033:0x7fe81564898a
[ 3821.784430][T62425] Code: 48 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 0=
0 48 83 ec 18 89 7c 24 0c e8 a3 ce f8 ff 8b 7c 24 0c 89 c2 b8 03 00 00 00 0=
f 05 <48> 3d 00 f0 ff ff 77 36 89 d7 89 44 24 0c e8 03 cf f8 ff 8b 44 24
[ 3821.803863][T62425] RSP: 002b:00007ffd9c026160 EFLAGS: 00000293 ORIG_RAX=
: 0000000000000003
[ 3821.812146][T62425] RAX: ffffffffffffffda RBX: 00007ffd9c026578 RCX: 000=
07fe81564898a
[ 3821.819967][T62425] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
000000000002c
[ 3821.827803][T62425] RBP: 00007ffd9c026190 R08: 0027c793795a4932 R09: 000=
0000000000064
[ 3821.835628][T62425] R10: 00007fe815a96000 R11: 0000000000000293 R12: 000=
0000000000000
[ 3821.843457][T62425] R13: 00007ffd9c026588 R14: 0000564738b8b110 R15: 000=
07fe815ace020
[ 3821.851347][T62425]  </TASK>
[ 3821.854299][T62425] irq event stamp: 31037781
[ 3821.858666][T62425] hardirqs last  enabled at (31037799): [<ffffffff8126=
1e72>] __up_console_sem+0x52/0x60
[ 3821.868277][T62425] hardirqs last disabled at (31037828): [<ffffffff8126=
1e57>] __up_console_sem+0x37/0x60
[ 3821.877847][T62425] softirqs last  enabled at (31037842): [<ffffffff8115=
4a85>] handle_softirqs+0x255/0x370
[ 3821.887553][T62425] softirqs last disabled at (31037855): [<ffffffff8115=
4d39>] __irq_exit_rcu+0x129/0x150


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250126/202501260918.fb95ce00-lkp@=
intel.com


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


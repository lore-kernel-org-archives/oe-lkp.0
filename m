Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE5313E22
	for <oe-lkp@lists.linux.dev>; Fri, 21 Nov 2025 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763706285; cv=fail; b=lIbPTpeLdQhioxbTNzCg01j63u+JoJHNSmfljBgduf4+7ldOo03XOeVczuQqFt+JATsxWUTPb+3M/o3kO+M00+av2ppWpLIX1ZKnzge/r/eZ+6Lyf94mmWm20rdSk81jr/7u0x3vQJKNla8/dNyF3r/vXY4QCwxM2B6d+MIEYEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763706285; c=relaxed/simple;
	bh=tXcI3aRcAHe/gGQZZuj2azQeloZzoKYPqvKVS22MPVw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NKo6N0CdIT3jUOgHH5t4fH7RJnzSF6UE5LQE4AZez5KHxTK1GRWmy0BIVrQrcIaAe7sUqbaugVh0yXIr8o+VQDYL+e8/bHlL8tSl4/FOn1goYW5t3NPba3cuZ6nHBblQKP69wMkcmj79VOG0GdNn5LS4Jg4sDFqEs/gMXrBSSJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIb1nTR7; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIb1nTR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763706283; x=1795242283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXcI3aRcAHe/gGQZZuj2azQeloZzoKYPqvKVS22MPVw=;
  b=nIb1nTR77cobe7qDOC4VdZHUbq10bzgSOUh02YGJp4J5zg7/scp3rnNE
   mZ9qsdbay2k4bHwgnB3FFXilpSGbF7CkXUkBr+yJcpsbz8VgDAsaduM/G
   ZkjIpsuraTviKs2DJvQShb63jxOSfhUlA/SOHuJ29zfTSprMm35CKegg0
   AMn5ixVPKlS1so4KMtAXImMRpKKT1Lx72DNP7hV/qTLn5plB074JBEK4R
   vltMY9dXL6AGjrUpAW6ADy5wmarftbo6aG78AcynFE/H1z7bsBuG+IKzS
   mOyQ4Ow0/AFjreN9sncWlmDCjBbZ02p1m4AC4qRZKiQOEbLgm/O/D04PM
   Q==;
X-CSE-ConnectionGUID: 83vJSkhERsKtZ+11jGbZQA==
X-CSE-MsgGUID: 8RPmTZ+0S4G0DRix7bTQvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88444389"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="88444389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 22:24:41 -0800
X-CSE-ConnectionGUID: cckQ8Hf/SKWVSwZdJhDMYg==
X-CSE-MsgGUID: cBQAGG7KRiyCVwdLmoZ9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="196743894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 22:24:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:24:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:24:39 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:24:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdgNe5ZNE1mM0Y74YWZeeNjHdUlWyhClNNIVEtZKKYqvG/4j+8Owu4jGl3/5xE0YTn31AwE3UQ/VT2triOi3knD5GLg+BwfeGiMYZIK67jxHhVrKLoGJDvzUgld+IGqIUl+24WCPAraVZTzEmrml5a0arnj0D12e/yjSbdZKQdGAtGYigdSeVdYi9w5aaf+jhjgRAUdO4ga/fVOWeK3YKlTUCr5Xsg/be6e6ynVb2StMMm36fKnBb1fA0Vhasqtjt6xUwDa5WlSd4j6SJOh5b/V7jIJZWjgsXMBhNBn5QkMeeXavYwcvpgbmwEyzPpY9aK3/QWK7qdNmNb8YgHJn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aePYboP23IJl789MDqtZ9srlO4B08IsziL5H/gi3P3M=;
 b=vUIGPQIYUCGQrRntAgXOe6YA6jaKfIkY/ZQQiSrjiCKdPcWhUen+IDGolbSaTyNj8x6TktFl0WLTgBvbH82yN2C5bwChwRb7hhNDzXyBUQ2HrS/BRjyyLrBlVl331eb2xuziThP1+O89vm10rcziN9fOnpm0vfkBeYhqdMTPKjQ8iw7OXUTmHa4UNK4kPDrCLtIzwD3VZn5Uz98Wt2FTgZ5eTxJ3ZgK7ikWAgZmQV8lUggRlLNEGa9VZPAZ2hP1dhp29FnHeyF/3S6qhpNEbkwneFAWeGRi7vjv28oxtM9yLTK5xxtw3HDpkRm114mMQRaVwyGAs3/SFamBzbFT9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 06:24:31 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:24:31 +0000
Date: Fri, 21 Nov 2025 14:24:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:nfs-delegation-lru] [NFS]  7f634b9540:
 WARNING:suspicious_RCU_usage
Message-ID: <202511211332.c5d11bb6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: b437f075-f0e8-4263-dc61-08de28c6a155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hl27YkMdTDhrg+qZKanYR1GYJunQTi/HdxfcNUu3VAVKRiQc/zFcuol94Mbt?=
 =?us-ascii?Q?cIWJJQNiL0cx838zg50v76G4gsHReBdBG3Li7XEYxuCYA42NicFQNH4jAi0f?=
 =?us-ascii?Q?POzHqzvdKuAHPGWGgJGA68JiRoL0fS6GvVo9e9nm7FPvPJkEuuPF9Fimt88M?=
 =?us-ascii?Q?Q5uehNOeGx5MI+600PtOtf8bY4BAaxWvGvUzGz6WpBak+/FmlsDQqpZ2HUWi?=
 =?us-ascii?Q?ZUxNuiVMugoXK1W/tY5KIfEarbDagj7gjRh20ekgYwNK9RaJqxn4e/a1xoju?=
 =?us-ascii?Q?D/FC8uKgh1iYXwJp55Ow29UKu+HTv/ow8m1eSvHb3mJilQMZTUjkVcQxVSWS?=
 =?us-ascii?Q?vIuD/QhSy/mVMGN8lnv3zV2Oh1GmX37UCStTGmemfI1eij594C0kIOHrj+P7?=
 =?us-ascii?Q?elITv59j9I2WPOJoArRfT1rf99sMj22vERiagTuh4MSfmhTmuHWw1IYOy2Hs?=
 =?us-ascii?Q?4EMXwnu/ymT3OHsJT6XlE7SNFsNEgJ4VgGVGtg0ciljVcI5ru7+bO7c9akGD?=
 =?us-ascii?Q?fBcR0IgNJ+ijde5iiIbUOcZ6CbkK0VNZjVzkzhsyF+D7xUlJW/fGDA5eSbta?=
 =?us-ascii?Q?BSFW6/cRJ6xQTU03CSxQxYCfFI0SM02rfQZStPktPm0VJV6iGBXLaUFospHI?=
 =?us-ascii?Q?UNzkOVzIVYsR17eBMefGF9FWkH1J6IyRGnB7IQMEXIcJb6hQycqSY9k1wi4c?=
 =?us-ascii?Q?IoCW0VL2/TP+SX4sBs+Ro7mIyqHUhQbNfHzPrqrdyoWqp3MkT92gdst/Ofbu?=
 =?us-ascii?Q?O1BF/0SWEcpNNSDrjrpjHzAQKtyXTZfsOd05dpKiMXc8ASstJVYmOTnGKC6g?=
 =?us-ascii?Q?Dg26fFlpn8FL3up7OuVdiFgqfERBHHHwl8QHhXgTiCFIts4vNJ5UWmCnx9r5?=
 =?us-ascii?Q?BoYxKA7QgQhA8Dhyw/WbD8p+uT3cGu2Z5CpRdv4+aPF/jcUmp3DGf+me062c?=
 =?us-ascii?Q?GwGrvH59OcJqwTqQH3hoBzDR3VP5D0U8OcS8chpAREoSQpnFgc94TiZh0ieN?=
 =?us-ascii?Q?fMHIpdrT8oBtlRvQ+qu+nCUAt+MpuBx5VK45GdzukHicVxjwwDw5dS3e3Vs4?=
 =?us-ascii?Q?kHdV+Iig1VJYrHIhwQuwcncx/8vh9k6TMA+sVg54yp8iUT8LZ5C/KJ43cXAI?=
 =?us-ascii?Q?6sztP+t4jSnU2bw9H8fdE4v+wsQFwPzAeXYtgcxH1MJBTGWGWAKwnea7Auss?=
 =?us-ascii?Q?Dos4uGZAugtJZu6ZQoJHZllrE/fvUFyJx5JumJLZb4HNz6pC7UmRVmTauSiR?=
 =?us-ascii?Q?CRPNsf0TrUOwc+YnM50ovKiQZVZ16yFMMOE9ddZ20munyQ2yKgU1PkyS0wcD?=
 =?us-ascii?Q?RrglPkvF0H8kQJfCTHj9pAQsFtFOGbzlWxVjG3wDNLnLnOIyeIDvrmAxnIT/?=
 =?us-ascii?Q?xDvMaweIkR8HExWYTBtAnmGmG6hDWTzsOeaN72JylAwCpQcpna3+SOYCzdiQ?=
 =?us-ascii?Q?U3qiRPRGuVG0XsQ2owecr4DpgSSCUNIT94rp5CCsYxk0Q/t/e2V/kQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0knST/FovMc7E1Vtm2FIyu1xkVShq7CnRiU80dEvTAyLD/Pwv7+OLYEGiWd?=
 =?us-ascii?Q?jQfBM6LZeml526yf17klCf1oJKa0rJEuRt9zPXqHujSuWFiIVR2aXTNNR50c?=
 =?us-ascii?Q?atOF/g0UOGXrlojoUOKSjtEIvS2LYjfPmKaMteRhSXFmtS5mK49TdLoBiLoE?=
 =?us-ascii?Q?rMHs6G2UXkOvamJ/sHjiOk2qGO1IpTzm6P8RC/QocwbUuV86fhjoGirn2mQY?=
 =?us-ascii?Q?52yCUQnDjFjcyS3CF1WkCGZUglzJFdpH0xdNBbb6ja60rktUyXIt04yo469g?=
 =?us-ascii?Q?6486egI2bKStmBiUVQHKg3PbsYSf6TKiFwggNH4HJOk13x7uoNVPLGYLbp1s?=
 =?us-ascii?Q?Dypo3nx4tnF1ycDAyadqGH7OANh43XJc6nQ6aq9d0JhxHbkWX2ARGr2F37oG?=
 =?us-ascii?Q?QfPSUUChkq5r61K84kmtlPcA+Gjf6cgA5ixpWucbWdODDyS8Dx0zd9Lp0nr7?=
 =?us-ascii?Q?a1RtC5Mbf88aTrhYIeqMvw1TE3ZpQzrORC6b0csAizK1V0E6KdPsOlmrLOC2?=
 =?us-ascii?Q?hAXzb0Rbv/VKy9Rm+RCbxbXn8QDkDg8Z4pPjNHMSZV0C3KVuv4s3RoUrK1JL?=
 =?us-ascii?Q?wwbKkZSM3s4BIe+ax13cr0uBuroO8dwV92d4rDVnzN/xYEft1Fui1BQTB2b6?=
 =?us-ascii?Q?5yzkV2+Q0WzaTS1seWRXLozzWD4vZVdLypNsBH7dufDZz+nAlTTJRFZ58V9u?=
 =?us-ascii?Q?Fz7z9j4t4/p3JFzAdQ5viO/j/ypeJTFzzUVSh+WRi9WePJJjsveNgrnO/GBJ?=
 =?us-ascii?Q?a6DjAoZWEU8VrnCO18Y2zAUC3Q1Ap1Q1oxwE7se7hw9p+nRHV3T3O78PwmJG?=
 =?us-ascii?Q?1jclL+Khcx24lTX8ysLDz2lGuprA4SVU1C3SbdFvBAuB7//mFajXOueKLyby?=
 =?us-ascii?Q?Zp0qVxOB0kgCEQBns7+n/wOZUTM9IT1cRIz27/9fXsn7b+ql16YBIHh+obWw?=
 =?us-ascii?Q?RSJ+1qgkqx8lBFTddUTv4kxA6FjxClJICJBu5jwTH1phoW9zqFUHQ7Is7iNV?=
 =?us-ascii?Q?ekuizpT81wGaCOODZDvUVAsSDkFqVKtLRlrFjEz1U9M83h6VoGTMwz8yVENV?=
 =?us-ascii?Q?pzRQafAlD3ukS0wYtUKOcWfJEibcosSDikKUYLEgann9daGLdsmAZjgF7GgB?=
 =?us-ascii?Q?scoTCXMX4igUsysZQyPcN2ikNi3Rk0QLZTXSs7Xe/bTWfFhi+J/7e5LwgSEc?=
 =?us-ascii?Q?1kyjxxnY3jNG0yH0nqClsbTzAJi5WkcA+VbGph+EruhznBm0t0ggIt/RtoWz?=
 =?us-ascii?Q?b5bVOmEaAeN+/eiIbvuvP1v5maYM+0wr9q3nfQibq7t+CFuiik/VADLpLxtl?=
 =?us-ascii?Q?T/mR6Q3iC3/MGVpJT+0v35o5mMsnAXUsoqze9KyBtl1o0C434BN5ECGV2igt?=
 =?us-ascii?Q?AX7dH+4LQRyXE/dib+K8A5S1SG2bgQhA26qTRievMdoNi38gy5TVyWNZErJ5?=
 =?us-ascii?Q?NO6wECAY7asYeJTHG/Rned/cbaEcjHRYL+XYLapQgHdeSPDRQ5FztbXl/mFq?=
 =?us-ascii?Q?HGYckUOP0WBSssPUJshuLaEqvkC1TzSoer7rEw7yQ3k6tzkD6CVcasCbE2vy?=
 =?us-ascii?Q?zPuEgDR9VxjJMr67yEPZ4Q7HNMQj0SFVaRMfzITVCUeQgGSu5XNLhkxuXYHO?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b437f075-f0e8-4263-dc61-08de28c6a155
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:24:31.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmtLiGIM4tDrtXwDX2KqySd0wi6vStRqOagRNCrxcaK/cS2gw4w9vHopPM7B3XhakvLa85Dn4jqgIEodN0ng1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 7f634b9540f882dc4ec7a131c4e2571005457b3d ("NFS: take a delegation reference in nfs4_get_valid_delegation")
git://git.infradead.org/users/hch/misc.git nfs-delegation-lru

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: clang
	group: group-01



config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake-E) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511211332.c5d11bb6-lkp@intel.com


[  157.851875][T11003] WARNING: suspicious RCU usage
[  157.857927][T11003] 6.18.0-rc5-00346-g7f634b9540f8 #1 Tainted: G S
[  157.867085][T11003] -----------------------------
[  157.872699][T11003] fs/nfs/delegation.c:103 suspicious rcu_dereference_check() usage!
[  157.881467][T11003]
[  157.881467][T11003] other info that might help us debug this:
[  157.881467][T11003]
[  157.894190][T11003]
[  157.894190][T11003] rcu_scheduler_active = 2, debug_locks = 1
[  157.903901][T11003] no locks held by xz/11003.
[  157.909285][T11003]
[  157.909285][T11003] stack backtrace:
[  157.916841][T11003] CPU: 2 UID: 0 PID: 11003 Comm: xz Tainted: G S                  6.18.0-rc5-00346-g7f634b9540f8 #1 PREEMPT(full)
[  157.916846][T11003] Tainted: [S]=CPU_OUT_OF_SPEC
[  157.916848][T11003] Hardware name: Intel Corporation Mehlow UP Server Platform/Moss Beach Server, BIOS CNLSE2R1.R00.X188.B13.1903250419 03/25/2019
[  157.916850][T11003] Call Trace:
[  157.916852][T11003]  <TASK>
[  157.916855][T11003]  dump_stack_lvl (lib/dump_stack.c:122)
[  157.916862][T11003]  lockdep_rcu_suspicious.cold (kernel/locking/lockdep.c:6877)
[  157.916868][T11003] nfs4_get_valid_delegation (fs/nfs/delegation.c:103 (discriminator 9)) nfsv4
[  157.917012][T11003]  ? __pfx_nfs4_get_valid_delegation (fs/nfs/delegation.c:100) nfsv4
[  157.917153][T11003] _nfs4_do_open+0x155/0x720 nfsv4
[  157.917329][T11003]  ? __pfx__nfs4_do_open+0x10/0x10 nfsv4
[  157.917461][T11003]  ? kasan_save_stack (mm/kasan/common.c:58)
[  157.917464][T11003]  ? kasan_save_stack (mm/kasan/common.c:57)
[  157.917466][T11003]  ? kasan_save_track (mm/kasan/common.c:69 (discriminator 1) mm/kasan/common.c:78 (discriminator 1))
[  157.917469][T11003]  ? __kasan_kmalloc (mm/kasan/common.c:400 mm/kasan/common.c:417)
[  157.917473][T11003]  ? alloc_nfs_open_context (fs/nfs/inode.c:1212)
[  157.917480][T11003] nfs4_do_open (fs/nfs/nfs4proc.c:3343) nfsv4
[  157.917611][T11003]  ? __pfx_nfs4_do_open (fs/nfs/nfs4proc.c:3325) nfsv4
[  157.917744][T11003]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[  157.917748][T11003]  ? __memcg_slab_post_alloc_hook (include/linux/rcupdate.h:341 include/linux/rcupdate.h:897 include/linux/percpu-refcount.h:209 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:780 mm/memcontrol.c:3193)
[  157.917755][T11003]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[  157.917759][T11003]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  157.917762][T11003]  ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:441 (discriminator 1))
[  157.917769][T11003] nfs4_atomic_open (fs/nfs/nfs4proc.c:3919) nfsv4
[  157.917899][T11003]  ? __pfx_nfs4_atomic_open (fs/nfs/nfs4proc.c:3912) nfsv4
[  157.918029][T11003]  ? alloc_nfs_open_context (fs/nfs/inode.c:1215 (discriminator 1))
[  157.918033][T11003]  ? __lock_release+0x5d/0x180
[  157.918037][T11003]  ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751)
[  157.918041][T11003]  ? trace_preempt_on (include/trace/events/preemptirq.h:53 (discriminator 2) kernel/trace/trace_preemptirq.c:120 (discriminator 2))
[  157.918046][T11003]  ? preempt_count_sub (kernel/sched/core.c:5813 kernel/sched/core.c:5809 kernel/sched/core.c:5831)
[  157.918054][T11003] nfs4_file_open (fs/nfs/nfs4file.c:73 (discriminator 1)) nfsv4
[  157.918193][T11003]  ? __pfx_nfs4_file_open (fs/nfs/nfs4file.c:30) nfsv4
[  157.918368][T11003]  ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751)
[  157.918374][T11003]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  157.918378][T11003]  ? __bpf_tramp_exit (kernel/bpf/trampoline.c:1052)
[  157.918382][T11003]  ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:441 (discriminator 1))
[  157.918387][T11003]  ? bpf_trampoline_6442519885+0x9f/0xf1
[  157.918390][T11003]  ? fsnotify_open_perm_and_set_mode (include/linux/fsnotify_backend.h:579 (discriminator 2) include/linux/fsnotify.h:24 (discriminator 2) fs/notify/fsnotify.c:679 (discriminator 2))
[  157.918397][T11003]  do_dentry_open (fs/open.c:965)
[  157.918402][T11003]  ? __pfx_nfs4_file_open (fs/nfs/nfs4file.c:30) nfsv4
[  157.918540][T11003]  vfs_open (fs/open.c:1097)
[  157.918543][T11003]  ? security_inode_permission (security/security.c:2363 (discriminator 1))
[  157.918550][T11003]  do_open (fs/nfs/dir.c:2664)
[  157.918556][T11003]  path_openat (fs/namei.c:4135)
[  157.918560][T11003]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[  157.918564][T11003]  ? __pfx_path_openat (fs/namei.c:4116)
[  157.918573][T11003]  do_filp_open (fs/namei.c:4162 (discriminator 2))
[  157.918578][T11003]  ? __pfx_do_filp_open (fs/namei.c:4155)
[  157.918581][T11003]  ? lock_acquire (include/linux/preempt.h:471 (discriminator 2) include/trace/events/lock.h:24 (discriminator 2) include/trace/events/lock.h:24 (discriminator 2) kernel/locking/lockdep.c:5831 (discriminator 2))
[  157.918591][T11003]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[  157.918594][T11003]  ? alloc_fd (fs/file.c:613)
[  157.918599][T11003]  ? alloc_fd (fs/file.c:613)
[  157.918605][T11003]  ? preempt_count_sub (kernel/sched/core.c:5813 kernel/sched/core.c:5809 kernel/sched/core.c:5831)
[  157.918609][T11003]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 (discriminator 3) kernel/locking/spinlock.c:186 (discriminator 3))
[  157.918613][T11003]  ? alloc_fd (fs/file.c:613)
[  157.918620][T11003]  do_sys_openat2 (fs/open.c:1437)
[  157.918624][T11003]  ? __pfx_do_sys_openat2 (fs/open.c:1422)
[  157.918629][T11003]  ? preempt_count_sub (kernel/sched/core.c:5813 kernel/sched/core.c:5809 kernel/sched/core.c:5831)
[  157.918633][T11003]  ? _raw_spin_unlock_irq (include/linux/spinlock_api_smp.h:160 (discriminator 3) kernel/locking/spinlock.c:202 (discriminator 3))
[  157.918639][T11003]  __x64_sys_openat (fs/open.c:1463)
[  157.918643][T11003]  ? __pfx___x64_sys_openat (fs/open.c:1463)
[  157.918648][T11003]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  157.918653][T11003]  ? do_syscall_64 (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 include/linux/entry-common.h:124 arch/x86/entry/syscall_64.c:90)
[  157.918659][T11003]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[  157.918665][T11003]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[  157.918670][T11003]  ? lock_acquire (include/linux/preempt.h:471 (discriminator 2) include/trace/events/lock.h:24 (discriminator 2) include/trace/events/lock.h:24 (discriminator 2) kernel/locking/lockdep.c:5831 (discriminator 2))
[  157.918676][T11003]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[  157.918679][T11003]  ? __x64_sys_rt_sigprocmask (kernel/signal.c:3340 kernel/signal.c:3318 kernel/signal.c:3318)
[  157.918683][T11003]  ? __x64_sys_rt_sigprocmask (kernel/signal.c:3340 kernel/signal.c:3318 kernel/signal.c:3318)
[  157.918685][T11003]  ? __lock_release+0x5d/0x180
[  157.918689][T11003]  ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:751)
[  157.918693][T11003]  ? trace_preempt_on (include/trace/events/preemptirq.h:53 (discriminator 2) kernel/trace/trace_preemptirq.c:120 (discriminator 2))
[  157.918697][T11003]  ? preempt_count_sub (kernel/sched/core.c:5813 kernel/sched/core.c:5809 kernel/sched/core.c:5831)
[  157.918702][T11003]  ? _raw_spin_unlock_irq (include/linux/spinlock_api_smp.h:160 (discriminator 3) kernel/locking/spinlock.c:202 (discriminator 3))
[  157.918705][T11003]  ? __x64_sys_rt_sigprocmask (kernel/signal.c:3340 kernel/signal.c:3318 kernel/signal.c:3318)
[  157.918708][T11003]  ? __pfx___x64_sys_rt_sigprocmask (kernel/signal.c:3318)
[  157.918715][T11003]  ? __pfx___x64_sys_rt_sigaction (kernel/signal.c:4629)
[  157.918718][T11003]  ? __x64_sys_sched_getaffinity (kernel/sched/syscalls.c:1318)
[  157.918722][T11003]  ? do_syscall_64 (include/linux/irq-entry-common.h:257 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  157.918728][T11003]  ? do_syscall_64 (arch/x86/entry/syscall_64.c:113)
[  157.918732][T11003]  ? do_syscall_64 (include/linux/irq-entry-common.h:257 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  157.918736][T11003]  ? do_syscall_64 (include/linux/irq-entry-common.h:257 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  157.918741][T11003]  ? do_syscall_64 (arch/x86/entry/syscall_64.c:113)
[  157.918745][T11003]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  157.918750][T11003]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  157.918753][T11003] RIP: 0033:0x7f07ff473687
[  157.918770][T11003] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
All code
========
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	4c 89 df             	mov    %r11,%rdi
   6:	e8 58 b3 00 00       	call   0xb363
   b:	8b 93 08 03 00 00    	mov    0x308(%rbx),%edx
  11:	59                   	pop    %rcx
  12:	5e                   	pop    %rsi
  13:	48 83 f8 fc          	cmp    $0xfffffffffffffffc,%rax
  17:	74 1a                	je     0x33
  19:	5b                   	pop    %rbx
  1a:	c3                   	ret
  1b:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  22:	00 
  23:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  28:	0f 05                	syscall
  2a:*	5b                   	pop    %rbx		<-- trapping instruction
  2b:	c3                   	ret
  2c:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  33:	83 e2 39             	and    $0x39,%edx
  36:	83 fa 08             	cmp    $0x8,%edx
  39:	75 de                	jne    0x19
  3b:	e8 23 ff ff ff       	call   0xffffffffffffff63

Code starting with the faulting instruction
===========================================
   0:	5b                   	pop    %rbx
   1:	c3                   	ret
   2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   9:	83 e2 39             	and    $0x39,%edx
   c:	83 fa 08             	cmp    $0x8,%edx
   f:	75 de                	jne    0xffffffffffffffef
  11:	e8 23 ff ff ff       	call   0xffffffffffffff39


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251121/202511211332.c5d11bb6-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8452AEF1
	for <oe-lkp@lists.linux.dev>; Fri, 21 Feb 2025 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740126285; cv=fail; b=JdC/Rz2prHiKHFEO+T6qbxOQ8YaxzgmxmlhyqPhkEYvWr9uI3LE8+RspHkqKjYcRcslhFDU1zmVmCsoUktMR195rROtyTTM1yTBSoBjsu1COFPAZpzSgbx9qSnFFfNfPkyfTe+A8xCRVTxuZV2LBlnYYSFZxj/Y98bhx6Ehn7GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740126285; c=relaxed/simple;
	bh=yK5TMzJsokasNYpaKZTEkY5Idyakrc0b5cNYSFowJr4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kQTOTUqpjh216Qxdlyja/rb06Zp1TpMnhzjhqhPoWUBdJfNfBBHHeCx/TV1B79QfI2iJtF2HZXB358H4RRzHrbON9sPPA7g9REHdWfKkwXy3D8kDH6iACW6KwVdNW1SjUaoVHuH48gnVJjoddDW5i3VjjfI6eWvLAlzeO8qCLmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeJM31xJ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeJM31xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740126282; x=1771662282;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=yK5TMzJsokasNYpaKZTEkY5Idyakrc0b5cNYSFowJr4=;
  b=OeJM31xJJ/WMfD59mfUC8mvOi103J/pQUwo9SktXLkn9t0n0R2NpjpXb
   wUQk44Akj7qj1TJ4YH7oRUKuPIDOy++1LShKoyFURcW0YAHrXjJbv/F0Z
   HQBDpT4Sd/nuRcHDbXUE4NkDmfyo2vfQThEqb6on+lMdcz/OILeaFnHnf
   tsozY4uTZWIjH+6GmA1J1EyIACBTuYaT5MsHWjMn885ngbNpos38Zp0fz
   mviJb1wAK/htwVBGWmMhPW59ZPFmfCwOTdV5TcdEdJ0SRvxZn5pOyXjTf
   /drtdD9miGbsGj5vN8CzreHC/vsdI48jzd0tCx6rbDeRs516yRtzEYB8+
   Q==;
X-CSE-ConnectionGUID: 2Q4rkJz7ShGSZUdJSG68DQ==
X-CSE-MsgGUID: hCM0bMspTvGvQRw+gJNVTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41073173"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="41073173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:24:41 -0800
X-CSE-ConnectionGUID: OxoT0MysSAWIgfXbG6b9/A==
X-CSE-MsgGUID: baOKjDWoR9aaYnG5T32CXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115797309"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:24:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 00:24:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 00:24:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 00:24:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR4X04mUiIPheY2S6lu1iX674kWrGjRUO/vGbMerG4NlvZPP9Gt2hgNbx9SudMWv+rG3DQo5Kqm8Xt7V6e6qdTqpC9RTXXWfPCaUKGldU6qi29EfRUkFBwsLc1DUWOvemxqryD6O96QqAuaS5w20abYTDqVbAKhQrd6uGFk8d82z4yVmqn5reGbOxKRJ7CtBZuYlrxr6cjtlM84Ps+LD7yz7KeP9rTHQRI+jZWjN1mFYRVHsVuTa9+OuJCssZH2yOUj8JSBD5RT0YtmY1XDVXS1zJXj5xe2+WGH2rct6OPOf8cGGsxF0WhJJfnB93RBESbWWN02mJRa/r7efVbZ/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZbqPVmwA15ZHoaKH5WWC6XZeHLKFe7mDHbI+/axd40=;
 b=lznWzNbIx1F+87ykUc15W1K9RRToeGhdkdhcaybeJsQp01xO+SXPdSQguP/2DbxBWhG+nlwgunCxPvhn1Kn6OEpPl4uqGGfuBOf1HoxKXqBccTPFs9pMykRfNwUZZSyFeEaqjtKa3vWcCOswwnHL1y4oFjvxHTYvGiEWTD3Lk6FzI4Pl4K0Em3j9YBHacJFh7lq02NycrSuzT/uov8TsKH/21PhO0hn+Najfgfx3SjKSiaWpWtMs6tYTMQdHIqWxpbFhpNNAUzG4Vs2oNMVF67vO2MxlRst9hbBjj4jE42m/trh7D+4dYSGO04FGI7h9b1CTI7XD1GODRvIDgD8QDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB8863.namprd11.prod.outlook.com (2603:10b6:208:598::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 08:24:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:24:36 +0000
Date: Fri, 21 Feb 2025 16:24:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [mm, pcp]  844cbbbcb6:
 netperf.Throughput_Mbps 87.1% regression
Message-ID: <202502211544.6fa1d77f-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: 38962149-84e8-4707-1e0b-08dd52512d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eyhv9wIyOadmkxY+UDvgABd5KgQYTNN/IlecXrhgX9Tfp2ivQQPcnPuEN8?=
 =?iso-8859-1?Q?q9hMz9c8RCBXfJlpx0MObYxeTsk4stPPi0OUUa20Rg6t1BPDt2yhJYK+tj?=
 =?iso-8859-1?Q?U93vCvWCBdS6FqhPs4HUzq7WZ3pp7hqlxjr/zp0P9f01XOmyh1RcD/7hAL?=
 =?iso-8859-1?Q?TIDNvx09WV9tk6NSLU1p/v1S18I23J+DR5OWzb6S5AXyxqYAC3J3DBItAr?=
 =?iso-8859-1?Q?x5YkQeJvHy3aJs3Uj1mN5TX1m9Y4b94eMavKlgEnp2/s6SxhRxI6bDJzFz?=
 =?iso-8859-1?Q?SbX9CbyXfD5727W2Qx/ngFZ1ex1ciFeDIPUijGrnzr9CAszfCC7mnHZLmz?=
 =?iso-8859-1?Q?cOs0iVZFAv0wUi7JhHbDUHhE33rYNxdMpHmiLie7i3AyDvb3QmUPH+ohSB?=
 =?iso-8859-1?Q?Rrk+m3eJLwfsV244Xnranlpt4wobyY1XuXiN7fZb7Fs+3ZOQUWTQpjQwyo?=
 =?iso-8859-1?Q?JxE4Cwk1sA0ehzKix61vcgp1/6/gN39CkRTdJbexGhAr8Eajp3VJLUuxsT?=
 =?iso-8859-1?Q?Nty4MBxtWZe5Ozl9ZhstXS9rZjyDux7eHwKpJHEUKKnVSXfDNVAhSz5asu?=
 =?iso-8859-1?Q?ROHsCast6D9nxrReR7we5gRLu9a2I8qRtOHHTlVybJudhercjE9IpWrqml?=
 =?iso-8859-1?Q?wKqzJ9Agza0cnPVRfB6+9sZgwDkK9dyoS8OCl2vu/cOWFHy2DBUzm4AtO8?=
 =?iso-8859-1?Q?uXliW5qWYWFHvXCbAkOIrUGUVOcum6YyBM+F5IqHl024H55sgqF4nT08wX?=
 =?iso-8859-1?Q?UG1cNjuH96JWg5rBQ80s9Sagss3tjJyvRdw5rXe/D6liw+8qaOesisr3kx?=
 =?iso-8859-1?Q?laDBeNRoTjtIAulisycasb7BOeVL7dhddvFX5psLEFkD3ZUiFUd2GA2ie+?=
 =?iso-8859-1?Q?3929muRP6bTCjSFAvejvljktywlcBP0tK8pYW+q4oHh4Hoc8T1GnkQjl9W?=
 =?iso-8859-1?Q?Jfi194/8b2CL/ditBgHeQYAnZ542mj+MyKKXKwJQp0+0ikuadk5Lm7WOhF?=
 =?iso-8859-1?Q?41WNkdu03FO5Cbfu4tvnwbR9ZluI2LO3VbzxqkdQignA6w/BnNCa+/Js21?=
 =?iso-8859-1?Q?bmkyLKturZHxbz9cCI6oeN/6i4B9HccfFJLp3RYeSjCQaQpKg4eHkxVuB3?=
 =?iso-8859-1?Q?bMoqszAlt0HWd9DmejoZ81r53XK2J9mE7iDTWTgmtdnXHjD/hXPIuNTXIg?=
 =?iso-8859-1?Q?Ic7dkAhONRRFmkoV3IgRF5OOO8I5SizeMGOW0LlOdBkey3fypauRcecK+E?=
 =?iso-8859-1?Q?mN5o2krh1sjZTkI8Qz4eDJ4hvTtd0jmLyELGrae67oZ3sMbqQAAaLeufC3?=
 =?iso-8859-1?Q?fOWc1FydCEoU+UdeWlRTGMkRi0tVaT9LRycbDIvLHPOlUP4/OsDGNPESTw?=
 =?iso-8859-1?Q?+E9ND/Sri7CS9OG2jIwY5BDngrRJv6pw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rFJ+ZLo/nnXJLL2Ide/4MbiYn/qL/C4+hhEJ5n0oihBgLiwQyRMBC7+yGZ?=
 =?iso-8859-1?Q?sWJ0yxJioQjDC9Cp4IIzldPIBjzKDJeMoTlL7284yYRwm63lcR8IDvSoru?=
 =?iso-8859-1?Q?oaBoVJaS/4/mcutAvsy20QRSuxtrFZ5w60dy1g53DWXhWn89fb+R00pqjW?=
 =?iso-8859-1?Q?Xqa83DlBOXZd1iCn3s9/O9NAWLFMZvyh/0I+fDZ3l3M7FWRHeKgzqL17t+?=
 =?iso-8859-1?Q?2o/x/bI+SYoAcsdaEOqCScRRZDQ/C35pmQKG6Fmobgg8V+sM66RHpGFL0d?=
 =?iso-8859-1?Q?gKsXmKgJfjwwz0IsZkR+Bkay5UtDK1cZhMMk0Hk3Wd5KYIeWZVe9Dp/iNR?=
 =?iso-8859-1?Q?MS9JZtzihybzXwe+SdvIysjvwk2tPrEHdNPI42wzHGnVbzqB/5eKvmNJhm?=
 =?iso-8859-1?Q?lYrOpoJAKKGsTbobgAHP1/NLzwSnVIqUjyMm+uLgstHQAGuBXdDQg88lPA?=
 =?iso-8859-1?Q?y+ORByxoIYf8a4gvDd6PMoFrZPpNNJaj5xnvnatG5m6/HWIwHJ6RvjZhm5?=
 =?iso-8859-1?Q?q/UQ1w4Tu+B1B8PJcu42A4gbgXwqiXPq77R3LB7TFaINY9MfRYr1L03hiN?=
 =?iso-8859-1?Q?DFPxpvOX5XeIStrMjZZU/Y1qOhofXPPByD6mUTtBzsNpaIRWuChsL6bJfD?=
 =?iso-8859-1?Q?G5c+fXahQYbvY8FMQzaRaocriIbXN381cjgRtvTgSyW51i5vdBIOlwW19k?=
 =?iso-8859-1?Q?n5YSocMmotTk7VZvuLT6FqtGIvFiPPFWZTLoYI8S46n1pTU64Ztn2Xsh2H?=
 =?iso-8859-1?Q?8SDhSleQ9wQFUPsUgwCtUIR/LEz7og4QPeVb+xikd50VwKDOwwbYOGxDW7?=
 =?iso-8859-1?Q?0i3U4Jy0rPIUNuwhVmszfTjZir/9KetatTAsfmrhsN4AdK0lev4LXcXQi9?=
 =?iso-8859-1?Q?wXxZBB4HnF3F8uQ19MFTga8Pjk85ucshEPlJ0H9XQZUrQexKUPhtqB620U?=
 =?iso-8859-1?Q?ihBukEI6ZRB8YVC1WksZCQ0A97fclFvY2h9Y2x3TiBpXqBv3sDps3eBIxt?=
 =?iso-8859-1?Q?Po0+GhObdzgMTBCtfyspWdS/1yWY6r5yNM+QnEqngCKfPKK9uA13X+v41/?=
 =?iso-8859-1?Q?RJuSCZKXzHnop/Dqv6HZJpalWLTy7dxomVit+/NEsyAJo4J8AVC/Lz+CWr?=
 =?iso-8859-1?Q?Rcy5v+u6ElFJCz907JGxoblov8kiewTPYDn4XovpIIj1EWey1SJ3johZ5X?=
 =?iso-8859-1?Q?XedoYVg3+xz4LcUlG3T3kUq83h220l3fB6+XkBWwLAMn1VUNkzis6KsEsv?=
 =?iso-8859-1?Q?i8iHlKtgOLaKMm5sBnTvfjPw/On1YYMDo4reH42tMpmDsRqTk3ieOQ3RI9?=
 =?iso-8859-1?Q?inIcnaK5x6gLomCtiSsWdDbKN1fLlwZWPr4O4x7PE5u2wMRvTzk5aN+QG/?=
 =?iso-8859-1?Q?IjlM3C72wQAQ1yT0JYhy2BPaqigTzbrXNTAXT7bNF2EeTX/Bhzqu/o23Zr?=
 =?iso-8859-1?Q?iFDOJZJ04b3DwfmL7sqG86Rdx8jlnuawfdPocyTXuYAC3E8tigjclbdBmG?=
 =?iso-8859-1?Q?xjtZb+bhdhwLCT09Np/jEGo9dtnsf3ZPmmDe0MAt1M+Ng0wNUNQp/9FBvr?=
 =?iso-8859-1?Q?c7SLeoFki0MFp5trbWxuLFvhIoCyCWS/Ojpkk+lQJV17qwOnOP0462ayYT?=
 =?iso-8859-1?Q?JsvHblB/BFT8HHqw5FMdLaYAOjZFG6awaDrty/AbCj2qgYvyc33Knb4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38962149-84e8-4707-1e0b-08dd52512d3f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:24:36.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wabVXuedQ40Ai/Zaj4Jw5ocNqrPNYRGPY2NyCfcbJ8OAzo3FfUBaQDgMPidSV95n5I4lXi8VIAu5WojKe3xJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8863
X-OriginatorOrg: intel.com


hi, all,

though it is mentioned "87.1% regression" in title, it could be an improvement
actually.

for the upstream version, we reported
"[linus:master] [mm, pcp]  362d37a106:  netperf.Throughput_Mbps 14.5% improvement"
in
https://lore.kernel.org/all/202311141422.64f32250-oliver.sang@intel.com/

there is a note there:
"
when this commit is a review patch in
https://lore.kernel.org/all/20231016053002.756205-4-ying.huang@intel.com/

we made two reports

[1] 'a 14.6% improvement of netperf.Throughput_Mbps'
in https://lore.kernel.org/all/202310271441.71ce0a9-oliver.sang@intel.com/
now in mainline, we confirmed this commit cause similar performance change.

[2] 'a 60.4% regression of netperf.Throughput_Mbps'
in https://lore.kernel.org/all/202311061311.8d63998-oliver.sang@intel.com/
which per your education in
https://lore.kernel.org/all/87ttpzv11u.fsf@yhuang6-desk2.ccr.corp.intel.com/,
we know it's also an improvment in fact.
"

the test case for this report is also an UDP test. below is full report.



Hello,

kernel test robot noticed a 87.1% regression of netperf.Throughput_Mbps on:


commit: 844cbbbcb6322c37d4a8d814146ddee4020cb1d6 ("mm, pcp: reduce lock contention for draining high-order pages")
https://github.com/bytedance/kernel.git 6.6-velinux

testcase: netperf
config: x86_64-bytedance-6.6-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	test: UDP_STREAM
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250221/202502211544.6fa1d77f-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-6.6-velinux/50%/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-1ap1/UDP_STREAM/netperf

commit: 
  3a1ca3b9e9 ("cacheinfo: calculate size of per-CPU data cache slice")
  844cbbbcb6 ("mm, pcp: reduce lock contention for draining high-order pages")

3a1ca3b9e9076d07 844cbbbcb6322c37d4a8d814146 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.767e+09 ± 10%    +200.9%  5.317e+09 ± 12%  cpuidle..time
    516488 ± 38%   +9922.3%   51763954 ± 13%  cpuidle..usage
     33570 ± 46%   +1161.5%     423488 ±  7%  vmstat.system.cs
    313633           +22.7%     384750        vmstat.system.in
      2.27 ± 10%      +4.9        7.21 ± 11%  mpstat.cpu.all.idle%
      2.73 ±  6%      -2.3        0.47 ±  5%  mpstat.cpu.all.soft%
      0.41 ±  3%      -0.3        0.16 ±  5%  mpstat.cpu.all.usr%
     13.20 ±189%   +1141.7%     163.90 ± 17%  mpstat.max_utilization.seconds
   1451037 ±  2%     +37.2%    1990349 ±  4%  meminfo.Active
   1451037 ±  2%     +37.2%    1990349 ±  4%  meminfo.Active(anon)
   4995978           +11.7%    5582719        meminfo.Cached
   2467001           +23.9%    3056897 ±  2%  meminfo.Committed_AS
    156250 ±  6%     +49.9%     234214 ±  7%  meminfo.Mapped
   1490174 ±  2%     +39.4%    2076914 ±  3%  meminfo.Shmem
     54833 ±  3%     -78.2%      11961 ±  6%  netperf.ThroughputBoth_Mbps
   6580063 ±  3%     -78.2%    1435428 ±  6%  netperf.ThroughputBoth_total_Mbps
      1708 ±  4%    +200.0%       5127        netperf.ThroughputRecv_Mbps
    205075 ±  4%    +200.0%     615291        netperf.ThroughputRecv_total_Mbps
     53124 ±  3%     -87.1%       6834 ± 12%  netperf.Throughput_Mbps
   6374987 ±  3%     -87.1%     820137 ± 12%  netperf.Throughput_total_Mbps
     11790            +0.8%      11887        netperf.time.percent_of_cpu_this_job_got
    257.34 ±  4%     -85.7%      36.81 ± 10%  netperf.time.user_time
 3.767e+09 ±  3%     -78.2%  8.217e+08 ±  6%  netperf.workload
    362938 ±  2%     +37.0%     497108 ±  4%  proc-vmstat.nr_active_anon
   1249221           +11.7%    1395341        proc-vmstat.nr_file_pages
    207024            +6.4%     220206 ±  2%  proc-vmstat.nr_inactive_anon
     39522 ±  6%     +48.2%      58577 ±  7%  proc-vmstat.nr_mapped
    372770 ±  2%     +39.2%     518890 ±  3%  proc-vmstat.nr_shmem
    362938 ±  2%     +37.0%     497108 ±  4%  proc-vmstat.nr_zone_active_anon
    207024            +6.4%     220206 ±  2%  proc-vmstat.nr_zone_inactive_anon
 3.767e+09 ±  3%     -78.2%  8.223e+08 ±  6%  proc-vmstat.numa_hit
 3.767e+09 ±  3%     -78.2%  8.223e+08 ±  6%  proc-vmstat.numa_local
    215619 ±  9%     +51.9%     327546 ±  7%  proc-vmstat.pgactivate
  3.01e+10 ±  3%     -78.2%   6.56e+09 ±  6%  proc-vmstat.pgalloc_normal
   1112484           +13.1%    1257868        proc-vmstat.pgfault
  3.01e+10 ±  3%     -78.2%  6.559e+09 ±  6%  proc-vmstat.pgfree
     48331            -2.7%      47025        proc-vmstat.pgreuse
      0.09 ± 41%    -100.0%       0.00        sched_debug.cfs_rq:/.h_nr_running.min
      0.01 ± 17%    +212.1%       0.03 ±  6%  sched_debug.cfs_rq:/.h_nr_running.stddev
    399.18 ± 41%    -100.0%       0.00        sched_debug.cfs_rq:/.load.min
      0.42 ± 10%     -67.0%       0.14 ± 30%  sched_debug.cfs_rq:/.load_avg.min
      0.09 ± 41%    -100.0%       0.00        sched_debug.cfs_rq:/.nr_running.min
      0.01 ± 33%    +426.8%       0.03 ±  6%  sched_debug.cfs_rq:/.nr_running.stddev
     85.66 ± 41%     -84.2%      13.56 ± 78%  sched_debug.cfs_rq:/.runnable_avg.min
      9.55 ± 12%    +111.7%      20.21 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
     72.26 ± 41%     -83.5%      11.94 ± 86%  sched_debug.cfs_rq:/.util_avg.min
      8.05 ± 20%    +152.4%      20.32 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    109878 ± 10%     -62.6%      41047 ±  6%  sched_debug.cpu.avg_idle.avg
     45.57 ± 28%    +375.7%     216.75 ±  5%  sched_debug.cpu.curr->pid.stddev
      0.01 ± 17%    +213.9%       0.03 ±  5%  sched_debug.cpu.nr_running.stddev
      3084 ± 46%   +1118.2%      37577 ±  8%  sched_debug.cpu.nr_switches.avg
    150.83 ± 11%   +1573.7%       2524 ± 56%  sched_debug.cpu.nr_switches.min
      7153 ± 47%    +163.0%      18813 ±  9%  sched_debug.cpu.nr_switches.stddev
      0.10 ±153%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.15 ±  3%    +162.9%       0.38 ± 16%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.06 ±109%     -81.6%       0.01 ± 49%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.43 ± 41%     -87.4%       0.05 ± 24%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.09 ± 82%    +328.7%       0.40 ± 50%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.asix_check_host_enable.__asix_mdio_read
      0.02 ±  8%    +313.7%       0.08 ± 13%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.56 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      5.35 ± 49%     -69.7%       1.62 ± 55%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     18.33 ±126%    +448.0%     100.42 ± 18%  perf-sched.sch_delay.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
      0.28 ± 61%    +596.9%       1.93 ± 42%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_completion_timeout.usb_start_wait_urb.usb_control_msg
     50.51 ±137%     -94.4%       2.84 ± 10%  perf-sched.total_wait_and_delay.average.ms
    115144 ± 52%    +608.1%     815364 ± 10%  perf-sched.total_wait_and_delay.count.ms
     50.48 ±137%     -94.4%       2.82 ± 10%  perf-sched.total_wait_time.average.ms
     18.53 ±134%    +286.3%      71.58 ±  6%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    260.84 ± 45%     -60.7%     102.56 ± 17%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.03 ± 50%    +247.7%       0.11 ±  9%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
     57.80 ± 36%    +122.8%     128.80 ± 17%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     51447 ± 57%   +1432.8%     788592 ± 10%  perf-sched.wait_and_delay.count.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
      1829 ±  6%     +23.3%       2256 ±  4%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1237           -12.0%       1088        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     36.90 ±125%    +362.7%     170.74 ± 16%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
     18.53 ±134%    +286.3%      71.58 ±  6%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2.10 ±  6%     -34.6%       1.37 ±  9%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    260.41 ± 45%     -60.6%     102.51 ± 17%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.33 ± 18%    +127.6%       0.74 ± 26%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.asix_check_host_enable.__asix_mdio_read
      0.02 ± 50%    +403.6%       0.10 ±  9%  perf-sched.wait_time.avg.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
     18.60 ±124%    +390.3%      91.19 ± 15%  perf-sched.wait_time.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
      0.01 ±  4%     +56.3%       0.02 ±  2%  perf-stat.i.MPKI
 2.589e+10 ±  3%     -32.7%  1.743e+10        perf-stat.i.branch-instructions
      0.07 ±  3%      +0.1        0.12        perf-stat.i.branch-miss-rate%
  13640490 ±  3%     +36.5%   18613531        perf-stat.i.branch-misses
      0.14 ±  5%      -0.0        0.11 ±  3%  perf-stat.i.cache-miss-rate%
    615296 ±  2%     +38.7%     853112        perf-stat.i.cache-misses
 9.294e+08 ±  9%    +215.2%   2.93e+09 ±  2%  perf-stat.i.cache-references
     32970 ± 46%   +1189.0%     424977 ±  7%  perf-stat.i.context-switches
      6.02 ±  3%     +65.7%       9.97        perf-stat.i.cpi
 7.978e+11            -4.8%  7.596e+11        perf-stat.i.cpu-cycles
    256.89          +955.7%       2712 ± 23%  perf-stat.i.cpu-migrations
  27088580 ± 23%     -58.5%   11243498 ±  2%  perf-stat.i.cycles-between-cache-misses
 1.316e+11 ±  3%     -42.4%  7.576e+10        perf-stat.i.instructions
      0.17 ±  3%     -38.9%       0.11        perf-stat.i.ipc
      0.02 ± 32%    +346.7%       0.07 ± 41%  perf-stat.i.major-faults
      2.28           -22.0%       1.78 ±  7%  perf-stat.i.metric.K/sec
      3275           +20.5%       3947        perf-stat.i.minor-faults
      3275           +20.5%       3947        perf-stat.i.page-faults
      0.00 ±  4%    +139.0%       0.01 ±  2%  perf-stat.overall.MPKI
      0.05 ±  2%      +0.1        0.11        perf-stat.overall.branch-miss-rate%
      0.07 ± 10%      -0.0        0.03 ±  2%  perf-stat.overall.cache-miss-rate%
      6.07 ±  3%     +65.1%      10.02        perf-stat.overall.cpi
   1229111           -30.9%     849126        perf-stat.overall.cycles-between-cache-misses
      0.17 ±  3%     -39.5%       0.10        perf-stat.overall.ipc
     10676          +162.5%      28031 ±  5%  perf-stat.overall.path-length
 2.583e+10 ±  3%     -32.6%   1.74e+10        perf-stat.ps.branch-instructions
  13627561 ±  3%     +36.0%   18539008        perf-stat.ps.branch-misses
    647569           +37.8%     892562        perf-stat.ps.cache-misses
 9.269e+08 ±  9%    +214.9%  2.919e+09 ±  2%  perf-stat.ps.cache-references
     33672 ± 46%   +1164.1%     425654 ±  7%  perf-stat.ps.context-switches
 7.958e+11            -4.8%  7.578e+11        perf-stat.ps.cpu-cycles
    254.85          +971.0%       2729 ± 23%  perf-stat.ps.cpu-migrations
 1.313e+11 ±  3%     -42.4%  7.564e+10        perf-stat.ps.instructions
      0.02 ± 32%    +355.9%       0.07 ± 42%  perf-stat.ps.major-faults
      3220           +16.1%       3737        perf-stat.ps.minor-faults
      3220           +16.1%       3737        perf-stat.ps.page-faults
 4.021e+13 ±  3%     -42.9%  2.296e+13        perf-stat.total.instructions
     24.27 ±  3%     -24.3        0.00        perf-profile.calltrace.cycles-pp.__ip_make_skb.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
     24.12 ±  3%     -24.1        0.00        perf-profile.calltrace.cycles-pp.__ip_select_ident.__ip_make_skb.ip_make_skb.udp_sendmsg.__sys_sendto
     48.45            -6.5       41.97        perf-profile.calltrace.cycles-pp.__raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data.__consume_stateless_skb
     48.52            -6.4       42.11        perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page.skb_release_data.__consume_stateless_skb.udp_recvmsg
     48.34            -6.4       41.94        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.__raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data
     48.84            -6.4       42.47        perf-profile.calltrace.cycles-pp.skb_release_data.__consume_stateless_skb.udp_recvmsg.inet_recvmsg.sock_recvmsg
     48.84            -6.4       42.47        perf-profile.calltrace.cycles-pp.__consume_stateless_skb.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     48.66            -6.3       42.41        perf-profile.calltrace.cycles-pp.free_unref_page.skb_release_data.__consume_stateless_skb.udp_recvmsg.inet_recvmsg
      8.79 ±  5%      -5.9        2.88 ±  3%  perf-profile.calltrace.cycles-pp.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      8.62 ±  5%      -5.8        2.86 ±  3%  perf-profile.calltrace.cycles-pp._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg
      8.33 ±  5%      -5.6        2.77 ±  3%  perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb
      5.04 ±  7%      -4.4        0.61 ±  5%  perf-profile.calltrace.cycles-pp.udp_send_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      4.92 ±  8%      -4.3        0.60 ±  5%  perf-profile.calltrace.cycles-pp.ip_send_skb.udp_send_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
      4.59 ± 11%      -4.0        0.58 ±  5%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg.__sys_sendto
      4.51 ± 11%      -3.9        0.57 ±  5%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg
     49.61            -3.4       46.17        perf-profile.calltrace.cycles-pp.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     49.62            -3.4       46.17        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     49.62            -3.4       46.18        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     49.64            -3.4       46.24        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom
     49.64            -3.4       46.24        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni
     49.65            -3.4       46.27        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_requests
     49.66            -3.4       46.28        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_requests.spawn_child
     49.66            -3.4       46.31        perf-profile.calltrace.cycles-pp.recvfrom.recv_omni.process_requests.spawn_child.accept_connection
     49.68            -3.3       46.34        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     49.68            -3.3       46.34        perf-profile.calltrace.cycles-pp.accept_connections.main
     49.68            -3.3       46.34        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     49.68            -3.3       46.34        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     49.68            -3.3       46.34        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
      2.86 ±  5%      -2.5        0.32 ± 81%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_send_skb
      2.87 ±  5%      -2.5        0.37 ± 65%  perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_send_skb.udp_send_skb
     99.61            -0.4       99.17        perf-profile.calltrace.cycles-pp.main
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
      0.00            +0.8        0.76 ± 15%  perf-profile.calltrace.cycles-pp.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet_recvmsg
      0.00            +0.8        0.78 ± 15%  perf-profile.calltrace.cycles-pp.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet_recvmsg.sock_recvmsg
      0.00            +1.0        0.96 ± 12%  perf-profile.calltrace.cycles-pp.__skb_recv_udp.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      0.61 ±  9%      +1.8        2.41 ±  2%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg
      0.62 ±  9%      +1.8        2.43 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg
      0.67 ±  8%      +2.0        2.63 ±  2%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg
      0.67 ±  8%      +2.0        2.64 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     49.93            +2.9       52.83        perf-profile.calltrace.cycles-pp.send_udp_stream.main
     49.92            +2.9       52.83        perf-profile.calltrace.cycles-pp.send_omni_inner.send_udp_stream.main
     49.62            +3.2       52.79        perf-profile.calltrace.cycles-pp.sendto.send_omni_inner.send_udp_stream.main
     49.50            +3.3       52.77        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_udp_stream.main
     49.46            +3.3       52.76        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_udp_stream
     49.36            +3.4       52.74        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner
     49.34            +3.4       52.74        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto
     48.94            +3.7       52.68        perf-profile.calltrace.cycles-pp.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.24            +8.7       51.98        perf-profile.calltrace.cycles-pp.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     18.89 ±  3%     +32.9       51.82        perf-profile.calltrace.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
      9.11           +39.6       48.74        perf-profile.calltrace.cycles-pp.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      9.10           +39.6       48.74        perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg
      8.91           +39.8       48.69        perf-profile.calltrace.cycles-pp.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb
      8.81           +39.8       48.66        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data
      8.00           +40.4       48.44        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill
      6.78           +41.2       47.98        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.__raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist
      6.80           +41.2       48.01        perf-profile.calltrace.cycles-pp.__raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
      6.89           +41.4       48.32        perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill
     24.28 ±  3%     -24.1        0.15 ± 16%  perf-profile.children.cycles-pp.__ip_make_skb
     24.14 ±  3%     -24.0        0.12 ± 16%  perf-profile.children.cycles-pp.__ip_select_ident
     50.61            -8.1       42.51        perf-profile.children.cycles-pp.skb_release_data
     50.19            -7.8       42.44        perf-profile.children.cycles-pp.free_unref_page
     48.53            -6.4       42.11        perf-profile.children.cycles-pp.free_pcppages_bulk
     48.84            -6.4       42.47        perf-profile.children.cycles-pp.__consume_stateless_skb
      8.81 ±  5%      -5.9        2.89 ±  3%  perf-profile.children.cycles-pp.ip_generic_getfrag
      8.63 ±  5%      -5.8        2.86 ±  3%  perf-profile.children.cycles-pp._copy_from_iter
      8.52 ±  5%      -5.7        2.86 ±  3%  perf-profile.children.cycles-pp.copyin
      5.05 ±  7%      -4.4        0.61 ±  5%  perf-profile.children.cycles-pp.udp_send_skb
      4.92 ±  8%      -4.3        0.60 ±  5%  perf-profile.children.cycles-pp.ip_send_skb
      4.60 ± 11%      -4.0        0.58 ±  5%  perf-profile.children.cycles-pp.ip_finish_output2
      4.52 ± 11%      -3.9        0.57 ±  5%  perf-profile.children.cycles-pp.__dev_queue_xmit
     49.61            -3.4       46.17        perf-profile.children.cycles-pp.udp_recvmsg
     49.62            -3.4       46.18        perf-profile.children.cycles-pp.sock_recvmsg
     49.62            -3.4       46.17        perf-profile.children.cycles-pp.inet_recvmsg
     49.64            -3.4       46.24        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     49.64            -3.4       46.24        perf-profile.children.cycles-pp.__sys_recvfrom
     49.67            -3.3       46.32        perf-profile.children.cycles-pp.recvfrom
     49.68            -3.3       46.34        perf-profile.children.cycles-pp.accept_connection
     49.68            -3.3       46.34        perf-profile.children.cycles-pp.accept_connections
     49.68            -3.3       46.34        perf-profile.children.cycles-pp.process_requests
     49.68            -3.3       46.34        perf-profile.children.cycles-pp.recv_omni
     49.68            -3.3       46.34        perf-profile.children.cycles-pp.spawn_child
      2.88 ±  5%      -2.4        0.52 ±  5%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      2.87 ±  5%      -2.4        0.51 ±  5%  perf-profile.children.cycles-pp.do_softirq
      2.85 ±  5%      -2.3        0.54 ±  5%  perf-profile.children.cycles-pp.handle_softirqs
      2.79 ±  5%      -2.3        0.50 ±  4%  perf-profile.children.cycles-pp.net_rx_action
      2.73 ±  5%      -2.2        0.49 ±  4%  perf-profile.children.cycles-pp.__napi_poll
      2.72 ±  5%      -2.2        0.49 ±  4%  perf-profile.children.cycles-pp.process_backlog
      2.59 ±  5%      -2.1        0.47 ±  4%  perf-profile.children.cycles-pp.__netif_receive_skb_one_core
      2.39 ±  5%      -1.9        0.44 ±  4%  perf-profile.children.cycles-pp.ip_local_deliver_finish
      2.38 ±  5%      -1.9        0.44 ±  4%  perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
      2.32 ±  5%      -1.9        0.43 ±  4%  perf-profile.children.cycles-pp.__udp4_lib_rcv
      2.12 ±  5%      -1.7        0.40 ±  3%  perf-profile.children.cycles-pp.udp_unicast_rcv_skb
      2.10 ±  5%      -1.7        0.39 ±  3%  perf-profile.children.cycles-pp.udp_queue_rcv_one_skb
      1.24 ±  6%      -1.1        0.10 ± 11%  perf-profile.children.cycles-pp.free_unref_page_commit
     99.98            -0.4       99.55        perf-profile.children.cycles-pp.main
      0.50 ±  4%      -0.4        0.07 ± 12%  perf-profile.children.cycles-pp.ip_route_output_flow
      0.47 ±  6%      -0.4        0.11 ±  8%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.38 ±  5%      -0.3        0.08 ± 10%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.34 ±  5%      -0.3        0.05 ± 34%  perf-profile.children.cycles-pp.ip_route_output_key_hash_rcu
      0.30 ±  6%      -0.2        0.06 ±  7%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.29 ±  6%      -0.2        0.06 ±  7%  perf-profile.children.cycles-pp.__alloc_skb
      0.18 ±  4%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.21 ±  4%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      0.12 ±  5%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.check_heap_object
      0.22 ±  5%      +0.0        0.25 ±  2%  perf-profile.children.cycles-pp.vfs_write
      0.21 ±  4%      +0.0        0.24 ±  3%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.20 ±  4%      +0.0        0.23 ±  3%  perf-profile.children.cycles-pp.generic_perform_write
      0.00            +0.1        0.05 ±  5%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.06 ±  5%      +0.1        0.11        perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.activate_task
      0.05            +0.1        0.10 ±  8%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.08 ±  7%      +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.08 ±  7%      +0.1        0.14        perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.05            +0.1        0.11        perf-profile.children.cycles-pp.__folio_alloc
      0.05            +0.1        0.11        perf-profile.children.cycles-pp.shmem_alloc_and_acct_folio
      0.05            +0.1        0.11        perf-profile.children.cycles-pp.shmem_alloc_folio
      0.05            +0.1        0.11        perf-profile.children.cycles-pp.vma_alloc_folio
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.intel_idle
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.try_charge_memcg
      0.00            +0.1        0.07 ±  4%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.11 ±  8%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.12 ±  5%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.18 ±  4%      +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.1        0.09 ±  3%  perf-profile.children.cycles-pp.mem_cgroup_charge_skmem
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles-pp.udp_rmem_release
      0.08 ±  3%      +0.1        0.17 ±  3%  perf-profile.children.cycles-pp.tick_sched_timer
      0.08 ±  4%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.07            +0.1        0.17 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.07            +0.1        0.17 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.12 ±  8%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.10 ± 17%  perf-profile.children.cycles-pp.cpu_util
      0.12 ±  3%      +0.1        0.24 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
      0.00            +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.__sk_mem_schedule
      0.00            +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.00            +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.try_to_wake_up
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.__wake_up_common
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.schedule_idle
      0.00            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.simple_copy_to_iter
      0.00            +0.2        0.15 ±  6%  perf-profile.children.cycles-pp.sock_def_readable
      0.00            +0.2        0.18 ± 44%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.2        0.18 ± 44%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.09 ±  4%      +0.2        0.29 ±  4%  perf-profile.children.cycles-pp.__udp_enqueue_schedule_skb
      0.00            +0.2        0.21 ± 39%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.00            +0.4        0.42 ± 20%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.4        0.43 ± 20%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.4        0.43 ± 20%  perf-profile.children.cycles-pp.do_idle
      0.00            +0.4        0.43 ± 20%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.6        0.62 ± 18%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.7        0.66 ± 18%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.7        0.67 ± 18%  perf-profile.children.cycles-pp.find_busiest_group
      0.00            +0.7        0.69 ± 18%  perf-profile.children.cycles-pp.load_balance
      0.00            +0.7        0.71 ± 18%  perf-profile.children.cycles-pp.newidle_balance
      0.00            +0.7        0.72 ± 18%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.8        0.76 ± 15%  perf-profile.children.cycles-pp.schedule
      0.00            +0.8        0.76 ± 15%  perf-profile.children.cycles-pp.schedule_timeout
      0.00            +0.8        0.78 ± 15%  perf-profile.children.cycles-pp.__skb_wait_for_more_packets
      0.07 ±  7%      +0.9        0.96 ± 12%  perf-profile.children.cycles-pp.__skb_recv_udp
      0.00            +0.9        0.90 ± 14%  perf-profile.children.cycles-pp.__schedule
      0.61 ±  9%      +1.8        2.42 ±  2%  perf-profile.children.cycles-pp.copyout
      0.62 ±  9%      +1.8        2.43 ±  2%  perf-profile.children.cycles-pp._copy_to_iter
      0.67 ±  8%      +2.0        2.63 ±  2%  perf-profile.children.cycles-pp.__skb_datagram_iter
      0.67 ±  8%      +2.0        2.64 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
     49.93            +2.9       52.83        perf-profile.children.cycles-pp.send_udp_stream
     49.92            +2.9       52.83        perf-profile.children.cycles-pp.send_omni_inner
     49.75            +3.1       52.81        perf-profile.children.cycles-pp.sendto
     49.36            +3.4       52.74        perf-profile.children.cycles-pp.__x64_sys_sendto
     49.36            +3.4       52.74        perf-profile.children.cycles-pp.__sys_sendto
     48.95            +3.7       52.68        perf-profile.children.cycles-pp.udp_sendmsg
     43.25            +8.7       51.98        perf-profile.children.cycles-pp.ip_make_skb
     18.90 ±  3%     +32.9       51.82        perf-profile.children.cycles-pp.__ip_append_data
     55.34           +34.8       90.11        perf-profile.children.cycles-pp.__raw_spin_lock_irqsave
     55.16           +34.9       90.04        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      9.12           +39.6       48.74        perf-profile.children.cycles-pp.sk_page_frag_refill
      9.11           +39.6       48.74        perf-profile.children.cycles-pp.skb_page_frag_refill
      8.96           +39.8       48.80        perf-profile.children.cycles-pp.__alloc_pages
      8.87           +39.9       48.77        perf-profile.children.cycles-pp.get_page_from_freelist
      8.05           +40.5       48.55        perf-profile.children.cycles-pp.rmqueue
      6.93           +41.5       48.43        perf-profile.children.cycles-pp.rmqueue_bulk
     24.03 ±  3%     -23.9        0.11 ± 16%  perf-profile.self.cycles-pp.__ip_select_ident
      8.50 ±  5%      -5.7        2.85 ±  3%  perf-profile.self.cycles-pp.copyin
      1.24 ±  6%      -1.1        0.10 ± 12%  perf-profile.self.cycles-pp.free_unref_page_commit
      1.07 ±  6%      -1.0        0.11 ±  8%  perf-profile.self.cycles-pp.rmqueue
      0.59 ±  5%      -0.5        0.12 ±  5%  perf-profile.self.cycles-pp.__ip_append_data
      0.46 ±  5%      -0.4        0.11 ±  9%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.30 ±  4%      -0.2        0.09 ±  5%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.17 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__raw_spin_lock_irqsave
      0.11 ±  4%      -0.1        0.05 ±  9%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.04 ± 33%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock
      0.07 ±  6%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.check_heap_object
      0.00            +0.1        0.06 ±  4%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.intel_idle
      0.00            +0.1        0.08 ±  3%  perf-profile.self.cycles-pp.udp_recvmsg
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.1        0.10 ± 18%  perf-profile.self.cycles-pp.cpu_util
      0.06            +0.1        0.18        perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.4        0.45 ± 18%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.61 ±  9%      +1.8        2.41 ±  2%  perf-profile.self.cycles-pp.copyout
     55.16           +34.9       90.04        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


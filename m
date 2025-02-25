Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2C2512CD
	for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463740; cv=fail; b=Mi74GkMPYcAsH4MK9getWqV63DVbGnwbViCElMkPV8xHLnb9VTXEfKOH0qxhxhcTQPRaylRmtwC91cUAhDLTqC5SrAMPF0KcYgeBrAMycILs+pvW1MsgB+vjkky2OvqLGS3FcCk+ks+6ShjNip/aTPlZeARugzfwp39pyNTjwYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463740; c=relaxed/simple;
	bh=wVFtJyYG5NdaH2AzzbcHLAiChvyC8nxzDP3DoVy1fTo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eddkF681MD1Gfy7ro/9UTqGv9Du9awxBaXYD1Tvz6PyqSZFnt2MhBfNZfqtTC1AFZjv9ec7fYBnW8uFd7eAjDbGZ/J209eEBRx0/AA/3RqUqPHfFHGPI3X9fQsZTYiMt6n5BPcAR2UQ4+WoTwHdvIdhpMx5+IVgSIGEOhEWvvhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hH/peBaE; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hH/peBaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740463737; x=1771999737;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=wVFtJyYG5NdaH2AzzbcHLAiChvyC8nxzDP3DoVy1fTo=;
  b=hH/peBaEOGDXoZ66cGQQwq0xhNGUZQtcEtvWxyuJJ3sX1JDhYMOc1mUs
   ID2sRvhBZbU1m2q0KGzz20IxOYrEtrCbUNKkf8KsDfcj2ZlXZHF51z0ij
   q4EhhZp+DaSEIZwkSsN4NPi+tCCG0+tXajxlA99KCk17hc+0sF+/cgBll
   3AJbpYaTms84CcPcFBnqjMQVKdURunsGcjEipNPb0qZCEfcvNMs/I1wfD
   Br4JxC3t7jAi8w6/XAc5ZwIMRSQKOuofo7mn+n3UpeuG7Sh5uS0JdNdj7
   /VWHmVOlMxzlvJo7uS0y8kehMu0/qkNDzdUFWINW4hOKmiw5o0VFuzl1H
   Q==;
X-CSE-ConnectionGUID: 7LEFCj33QIylDOKagvs3Bg==
X-CSE-MsgGUID: eVU7i/koSV69/tQXFTRlmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52252254"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="52252254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 22:08:56 -0800
X-CSE-ConnectionGUID: pF3OdU/tT+KDLzTU1ytCcg==
X-CSE-MsgGUID: aTiordO3Qu62cSxi8hxCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="121227384"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Feb 2025 22:08:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 22:08:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 22:08:55 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 22:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKsBHx5E47MmyraYt6jLQjeFNFFIWDt90Bu/2xJNZkbfy8zMaZQFI4U5VglQll3hNrtdimLHgVBalP9XJrHnUUXzLTzxDuyYiml1896NXAWwbPYmAPECb6cpB+GuDksMO61XpxoJa9t9lzqnULQewcjy7E064NaQTqNBYmfX6sYrh3rCDHqfyoR2COCNiifMOyQkQWWd+lbQZ7ZSQV8+IYvXy1GgJKq5hhMUL8DsJ6y5a/kObWzzLZbk9hYurHdH4pAUE5xjMf2z2xgjifUkX/9VWwPqzu7y5jMwjkZKIPn1pcGeljUYaYdM/Zcliy+89N+/AzZSlrCNbdc50T89/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OResf/6bOgvmOxX7XsRNOSrKQzD/6z4pX/EWqrNzLm0=;
 b=tlRLHKC5ZsF6K0pQpx8zDAChTzeBEVEbR6/f2vqaOjxa8ui/ITHUjT10tEbnRlVuGimx9NDr8lIGMd5Qp2NTJzcLZABDzUfaSXsneexXloGdCd1QYoHrmLY5BR2/FjYS5wgSfPiFyLdYNGiCpkbMVK2etFjujFRqU03gGQd/BS94VdyP0EkJwhTBetq4876judab+nJLkYMbhj2kbNwCtD96u/bHcXDs2MEiHf+4Lj8/jAIg6fXyqujhwj5xu/6eM6JXX8307WkD8kpQkFIfvB9F4pkxtJtLpRDhxlQtTko7UOPEQaoTFseR5Ifs6uY5YNnu4D07ZMaLiDF/7xB0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 06:08:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 06:08:45 +0000
Date: Tue, 25 Feb 2025 14:08:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [mm]  601dc4addd:  stress-ng.tee.ops_per_sec
 90.7% regression
Message-ID: <202502251335.2e185aeb-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 213c72ac-66c8-4fbc-7771-08dd5562dc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?79JoWrh97tDTnGL7025xcB230ukIyeEcCwMDb4ZRc4q1iwgieScJzpD6Kn?=
 =?iso-8859-1?Q?f0tnZtTWUer8kYkSp6BhSh71FW/+fWokI1DVeRiYM0DzMt/YQNFD2tr3Ba?=
 =?iso-8859-1?Q?LBX/MzRPMha/l5RQSwkhgAmESvFzD3ayhPSl+cEPWfiepzx2OPjlZmjeZi?=
 =?iso-8859-1?Q?eRTnxE5XzaZuqGBWReyxRA6LtIAp9cnIraAFz1oXtUf/FBZyY7vJ3ebMnc?=
 =?iso-8859-1?Q?pqwjuRg3iFKHPXv8RrRvhYfqqUjoojhD56nV/t0Z4JpcHf4MuCGqhISGPc?=
 =?iso-8859-1?Q?ShNkk3emeev33MO8EnFArQprlvlZXDBFIaovw06Mzv+TqxdPsjvanFgcq6?=
 =?iso-8859-1?Q?rKdlGs5qtw3TsiksH3ZpPwGymXrmQBgMQ3v6JfH/JnI6q6NpIq5IWNWSSS?=
 =?iso-8859-1?Q?bQbXo+0rRfitFc+J5ldX6ownk7PdPaCtuJ/libF2sc60eYOybkknvmZOPE?=
 =?iso-8859-1?Q?xHSnnJNDbmQANqO6bVL6njX7NSvSP+SUPSN5iiED1XSkYHUAhKcd99ouYt?=
 =?iso-8859-1?Q?35LrX6AapB6sv+OXwWtt4jWbR7WGrHjC3WlhH+s165jAEAaSehcRG923yZ?=
 =?iso-8859-1?Q?aRH+EPofNOuJOfxxrgURYO5hr14dP+uwb5thQV1VqhLLRdooNxRxAzjLvs?=
 =?iso-8859-1?Q?vQwf24JWtUSAsXMw5vTWYMS8CnvW5rHtcETbi25h3AnrdYf1wfbatmQgoq?=
 =?iso-8859-1?Q?ccMsfFF881XivIH/ppO2tB5XNLseJE4FYQfZLsg2Nm7ph6u52oLlPmEyIz?=
 =?iso-8859-1?Q?QxDCPm4xY5MFdLDXm6J/jp1/kKVtiNn3eBFWclwNY1ZN77I6XHDYUoEtJK?=
 =?iso-8859-1?Q?+qfbuhRx5yGg0cQ3K0xXFUEMrvGX8xYuL4xYrFBUpy2be3Ub8MOG8C1gM7?=
 =?iso-8859-1?Q?gAFn4aITwOXzQICptRC2q7HMTnn6i+MGQOJRN7gILf876aMuxSPeboNVmb?=
 =?iso-8859-1?Q?ObqiHU08cvsuAHqdPLY7yKXr3QbTJ404oyZtDmGBy7z/xG5RYTeFsMV4OC?=
 =?iso-8859-1?Q?5ml7kO5YZrphmU8pCiy2fUlhmvSubfOM9+OSfhYzaFf1O+pkCjdVuz7k6N?=
 =?iso-8859-1?Q?TSFoGaMyZHl1rZYBYUFFLYbZjwRLTYLbx4ObbmsWBXgxlHZuzd1uqTE40s?=
 =?iso-8859-1?Q?/yDedJXJJw5FDNOHoq1b/b2Iss7mKASi7RMt2g+xgAos5i76bo16zBXd+H?=
 =?iso-8859-1?Q?eaQ9BjUsTiA3M4tmpFc6dJqYX2ufGAtb4umsdHgPNGQm8yE5di57q49Xc7?=
 =?iso-8859-1?Q?G2Y8cA2ZuEA2T0OQbzrlJqLT5my9uoNiri9727ufvRNOaw1LTn2nIXkE3U?=
 =?iso-8859-1?Q?2LVzsXyGTY7+5QziZiJzHpfGQsqbMQdEv8d2P7FTpQM1XTrMpc49n6H8Es?=
 =?iso-8859-1?Q?V0ygAMyRi33PGaKm82/EM/V4KGruCqWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NSzXn5XjV+OvPa3p7X9zIx2geZ06LXK1HRpW6GQmLyRchz8TOShbfBSDxO?=
 =?iso-8859-1?Q?b2YrUrdJaM6xmLswJ0OFPfEB5LG8VdaaGD+FxRKZSR01NFGJjGyShBt5Yc?=
 =?iso-8859-1?Q?dXd+x8mPnegxX+oDE9Nyu7sVUe2KbHkZ9JibTcrMscs5lQL7M7hnl8l1NM?=
 =?iso-8859-1?Q?sBs5yk/hOQ0hTsnBLG3c/yUEZPvBDYvfwraSfmtZXIaVkATTFyyVY9Esr9?=
 =?iso-8859-1?Q?mQenmchXiJgjLS215S8GKa/r/YIjoTMm4Uaq294O91q5Vm6qEonCeTYFnp?=
 =?iso-8859-1?Q?NKxXmyy99oanhdxwhReI4EW0uPExRDhRXh7cVzAyp7dXBXZVNkE4bHe530?=
 =?iso-8859-1?Q?1CJ3O8fDqx4kiJrh7LW96YwDgkHfRX9ul09T3dsrqQKpupWETzvfAHUTkZ?=
 =?iso-8859-1?Q?HQfD60dm/AqoQUKYSc6jKM+zi8KJmXyoSNeqGP07305Nt3FxkIILe+IXoq?=
 =?iso-8859-1?Q?D6IIL8j0Yze7i3h11ewwO/W16xSy6K7grIbiYC8yM/3q4zlNmbzKsZZEEJ?=
 =?iso-8859-1?Q?4YDCcdWx123XFVPJaGykzBPSBOVNqeQgCIzEkZTJPRFRokgC361NRIMEW0?=
 =?iso-8859-1?Q?h/UKxm8mIKo0bhw54NlOsxnFL9yUsefwRVjxf9J+++NFiw4IRyjH1+bFYL?=
 =?iso-8859-1?Q?2y8FtiSorP2ir7i9vCC4sfuBrOEwqfEzFlttfVapzeknIeflj76Wa8rBsM?=
 =?iso-8859-1?Q?q1nM9Psl1ujab0mlVOno3/EVs7dVToec5ynFV08dVm/RfUp0JfsIENHyNt?=
 =?iso-8859-1?Q?eB7LyTE9Sa2G14qdQZiPedoDtTY+DvLFrdxwdq0O+C1t8Huc4Hhsxyvgnq?=
 =?iso-8859-1?Q?s4Pmnv970R7gjriHEqMWavEywX8lyX/yQFi27lo5OlbgC45+1/mTcNkqkD?=
 =?iso-8859-1?Q?h86ZXHnJl7ZIxlX0/0cLqRiE5R6G0lC1ETHWmc98z6cwFX5CyVhjd0w7jx?=
 =?iso-8859-1?Q?HXfLGiSB8n3B+Yt0augJd1RGG8KNREa92GLO5WE1C0/RkkBKCQpK3zLYCk?=
 =?iso-8859-1?Q?MsZ7znFWUXG9rXC5ZrgCQZj0LeCWi2JuYeD2rj7Phc9B5G3CsBLNp+A8yB?=
 =?iso-8859-1?Q?X12flVkAYnvYUfeGkcGkDYRQzeIj3Q4U5xEON6PVVwqQkOCl8x/e5KMASz?=
 =?iso-8859-1?Q?vWIHIagOUFIuvTVB9g8yt2B99qx9WtvPmyquWZrRy5ZMo9e8CLQeE5vf5T?=
 =?iso-8859-1?Q?CB27oAu6ANC9J56goGrwz6JJkWyZewaRvaI5HltPoBUulcBcpXi3e0gTyO?=
 =?iso-8859-1?Q?i5Q9J533mdb2KgRyr6T7GMLWsXGHsgcE2+PGR78DA8f3zay0IJCLoN3D4h?=
 =?iso-8859-1?Q?FRlfvr++AZlz4QZu/6tUDmff+bRhd3aX2PxC9hUmNBRv2Ed71/k37AmEnq?=
 =?iso-8859-1?Q?fIzON5uJTTpypJeMs5q3bKewq8d95ARbHSggSJqRefOyTOZ6325Kqsu+qc?=
 =?iso-8859-1?Q?r7op7ntp7fBH9fJPtaWgton5k87lec3Tjo63qDCp8a3lHONqGP+Wus3Rfx?=
 =?iso-8859-1?Q?2YuVgdw57GQTBfKSeJW7kicfkMp+1+b83xsQujmiJ91F99zH5cJWgUorGw?=
 =?iso-8859-1?Q?WdUbbmo+htADw7ycN9RsBVZ4b8XfR2bk98Ci8S3OcoihH+yR2iPJWUkDzR?=
 =?iso-8859-1?Q?ILsOYQQAgFIYlWr92cYfegpXVzasShEPVPG/NIA8aMcgyJosko4rieEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 213c72ac-66c8-4fbc-7771-08dd5562dc4b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 06:08:45.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbvuYwW/hVqPLJ84qjgZjdqNl0DoC+g9AsWf/YYp53eybH4WfRHJRH5q0Fry8fcyoT8TBCYD9ee2xacj0DUF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 90.7% regression of stress-ng.tee.ops_per_sec on:


commit: 601dc4addd9d6b950a1fafb99343222e7a2b5070 ("mm: avoid leaving partial pfn mappings around in error case")
https://github.com/bytedance/kernel.git 6.6-velinux

testcase: stress-ng
config: x86_64-bytedance-6.6-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: tee
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502251335.2e185aeb-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250225/202502251335.2e185aeb-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-bytedance-6.6-velinux/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/tee/stress-ng/60s

commit: 
  68c53b7070 ("x86/hyperv: fix kexec crash due to VP assist page corruption")
  601dc4addd ("mm: avoid leaving partial pfn mappings around in error case")

68c53b70704664d1 601dc4addd9d6b950a1fafb9934 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     14.03            -4.4        9.61 ±  2%  mpstat.cpu.all.usr%
    156684 ± 11%     -43.7%      88139 ± 10%  sched_debug.cpu.nr_switches.stddev
  83575265 ±  2%     +11.6%   93230318 ±  2%  vmstat.system.cs
 1.022e+08 ±  2%     -32.7%   68732152        proc-vmstat.numa_hit
 1.022e+08 ±  2%     -32.7%   68731319        proc-vmstat.numa_local
 1.022e+08 ±  2%     -32.7%   68782633        proc-vmstat.pgalloc_normal
  99183980 ±  2%     -33.5%   65953617        proc-vmstat.pgfree
 1.846e+08 ±  3%     -90.7%   17252255 ±  4%  stress-ng.tee.ops
   3076269 ±  3%     -90.7%     287532 ±  4%  stress-ng.tee.ops_per_sec
  2.62e+09 ±  2%     +11.8%   2.93e+09 ±  2%  stress-ng.time.involuntary_context_switches
     12426            +5.5%      13113        stress-ng.time.system_time
      1923           -35.9%       1233 ±  2%  stress-ng.time.user_time
 2.652e+09 ±  2%     +11.3%  2.951e+09 ±  2%  stress-ng.time.voluntary_context_switches
      0.08 ± 34%    +325.9%       0.33 ± 10%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.15 ± 33%    +410.0%       0.76 ± 11%  perf-sched.sch_delay.avg.ms.pipe_wait_readable.ipipe_prep.part.0.do_tee
      0.04 ± 37%    +104.6%       0.08 ±  7%  perf-sched.sch_delay.avg.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
      0.37 ± 34%    +203.1%       1.11 ± 14%  perf-sched.sch_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    902.70 ± 37%    +105.1%       1851 ± 14%  perf-sched.sch_delay.max.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
    974.89 ± 33%     +56.8%       1529 ± 14%  perf-sched.sch_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.28 ± 34%    +156.7%       0.71 ±  9%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.32 ± 33%    +426.5%       1.69 ± 11%  perf-sched.wait_and_delay.avg.ms.pipe_wait_readable.ipipe_prep.part.0.do_tee
      0.10 ± 36%    +100.8%       0.19 ±  7%  perf-sched.wait_and_delay.avg.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
      0.78 ± 34%   +1141.5%       9.64 ±  8%  perf-sched.wait_and_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    199732 ± 36%   +2534.5%    5262015 ±  6%  perf-sched.wait_and_delay.count.pipe_wait_writable.opipe_prep.part.0.do_tee
      1805 ± 37%    +105.1%       3702 ± 14%  perf-sched.wait_and_delay.max.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
      1949 ± 33%     +56.8%       3058 ± 14%  perf-sched.wait_and_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.20 ± 34%     +92.6%       0.39 ±  8%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.17 ± 33%    +440.2%       0.93 ± 10%  perf-sched.wait_time.avg.ms.pipe_wait_readable.ipipe_prep.part.0.do_tee
      0.05 ± 35%     +98.0%       0.11 ±  7%  perf-sched.wait_time.avg.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
      0.41 ± 34%   +1976.8%       8.53 ±  9%  perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    933.44 ± 35%     +99.6%       1863 ± 13%  perf-sched.wait_time.max.ms.pipe_wait_writable.opipe_prep.part.0.do_tee
      1008 ± 34%     +79.6%       1810 ± 14%  perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
 2.369e+11           -12.0%  2.084e+11        perf-stat.i.branch-instructions
      0.25 ±  2%      +0.1        0.30        perf-stat.i.branch-miss-rate%
      5.15 ±  5%      -1.5        3.65 ±  4%  perf-stat.i.cache-miss-rate%
 1.588e+08 ±  3%     +32.5%  2.104e+08 ±  2%  perf-stat.i.cache-references
  85428822 ±  2%     +11.6%   95373015 ±  2%  perf-stat.i.context-switches
      0.66           +20.2%       0.80 ±  2%  perf-stat.i.cpi
 7.385e+11            +5.4%  7.786e+11        perf-stat.i.cpu-cycles
      4550 ± 30%     -40.2%       2722 ±  8%  perf-stat.i.cpu-migrations
   1553149 ±  7%     +24.7%    1937185 ±  4%  perf-stat.i.cycles-between-cache-misses
 1.122e+12           -12.0%  9.875e+11        perf-stat.i.instructions
      1.51           -16.5%       1.27 ±  2%  perf-stat.i.ipc
    355.97 ±  2%     +11.7%     397.57 ±  2%  perf-stat.i.metric.K/sec
      0.24 ±  2%      +0.1        0.29        perf-stat.overall.branch-miss-rate%
      5.94 ± 10%      -2.1        3.87 ±  6%  perf-stat.overall.cache-miss-rate%
      0.66           +19.8%       0.79 ±  2%  perf-stat.overall.cpi
     79456 ± 10%     +21.1%      96217 ±  7%  perf-stat.overall.cycles-between-cache-misses
      1.52           -16.5%       1.27 ±  2%  perf-stat.overall.ipc
 2.325e+11           -11.9%  2.047e+11        perf-stat.ps.branch-instructions
 1.556e+08 ±  3%     +33.1%  2.071e+08 ±  2%  perf-stat.ps.cache-references
  84795990 ±  2%     +11.7%   94711692 ±  2%  perf-stat.ps.context-switches
 7.263e+11            +5.6%  7.669e+11        perf-stat.ps.cpu-cycles
      4161 ± 29%     -38.5%       2559 ±  7%  perf-stat.ps.cpu-migrations
 1.101e+12           -11.9%  9.703e+11        perf-stat.ps.instructions
 6.744e+13           -12.3%  5.915e+13        perf-stat.total.instructions
     28.45 ±  2%     -10.8       17.64        perf-profile.calltrace.cycles-pp.write
     22.33 ±  2%      -8.6       13.69        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     21.08 ±  2%      -8.2       12.90        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     17.00 ±  2%      -6.3       10.73        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     14.82 ±  2%      -5.5        9.34        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     11.37 ±  2%      -4.3        7.12        perf-profile.calltrace.cycles-pp.pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.09 ±  2%      -2.6        5.49 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
      7.55 ±  2%      -2.6        4.97 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      3.62 ±  2%      -1.2        2.37        perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.vfs_write.ksys_write.do_syscall_64
      3.94 ±  2%      -1.2        2.76        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.93 ±  3%      -1.1        0.82        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      3.01 ±  2%      -1.0        1.96        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write.ksys_write
      3.31 ±  2%      -1.0        2.32        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read.ksys_read
      2.22 ±  2%      -0.9        1.36 ±  2%  perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.08 ±  2%      -0.7        1.36        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write
      1.78 ±  2%      -0.7        1.07 ±  2%  perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.pipe_write.vfs_write.ksys_write
      2.39 ±  2%      -0.7        1.68        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read
      1.56            -0.5        1.06        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.52 ±  2%      -0.5        1.04        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.99 ±  2%      -0.4        0.63        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.23 ±  2%      -0.3        0.90        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.pipe_read.vfs_read
      1.00 ±  2%      -0.3        0.69        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.86            -0.3        0.58        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.79 ±  2%      -0.3        0.54        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.74 ±  2%      -0.2        0.55        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.62            -0.2        0.43 ± 50%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.read
      0.88 ±  3%      -0.1        0.77 ±  4%  perf-profile.calltrace.cycles-pp.stress_tee_pipe_read
      0.63 ±  3%      +0.1        0.69 ±  4%  perf-profile.calltrace.cycles-pp.__switch_to_asm.read
      0.78 ±  4%      +0.1        0.85 ±  4%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.66 ±  4%      +0.1        0.74 ±  4%  perf-profile.calltrace.cycles-pp.os_xsave.read
      0.54 ±  5%      +0.1        0.65 ±  4%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      1.13 ±  4%      +0.1        1.26 ±  5%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.pipe_wait_writable.opipe_prep
      0.64 ±  5%      +0.1        0.77 ±  4%  perf-profile.calltrace.cycles-pp.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      1.34 ±  4%      +0.1        1.47 ±  4%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.60 ±  4%      +0.1        0.72 ±  4%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.pipe_wait_writable.opipe_prep
      0.67 ±  4%      +0.1        0.81 ±  5%  perf-profile.calltrace.cycles-pp.check_preempt_curr.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.29 ±  4%      +0.3        1.55 ±  5%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_change.activate_task.ttwu_do_activate.try_to_wake_up
      1.21 ±  4%      +0.3        1.49 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_wait_writable
      0.37 ± 65%      +0.3        0.65 ±  4%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      1.35 ±  4%      +0.3        1.64 ±  4%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule.pipe_wait_writable
      0.31 ± 81%      +0.3        0.60 ±  4%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_wait_writable.opipe_prep.do_tee.__x64_sys_tee
      1.42 ±  5%      +0.3        1.71 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.27 ±100%      +0.3        0.61 ±  5%  perf-profile.calltrace.cycles-pp.update_curr.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate
      1.71 ±  5%      +0.4        2.06 ±  4%  perf-profile.calltrace.cycles-pp.psi_task_change.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      1.72 ±  4%      +0.4        2.07 ±  4%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.pipe_wait_writable.opipe_prep
      1.70 ±  4%      +0.4        2.07 ±  4%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      1.85 ±  5%      +0.4        2.24 ±  4%  perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.pipe_wait_writable.opipe_prep
      0.00            +0.5        0.55 ±  3%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00            +0.7        0.74 ±  4%  perf-profile.calltrace.cycles-pp.reweight_entity.dequeue_task_fair.__schedule.schedule.pipe_wait_writable
      0.00            +0.7        0.75 ±  4%  perf-profile.calltrace.cycles-pp.reweight_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      6.14 ±  4%      +1.0        7.09 ±  4%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      6.57 ±  4%      +1.0        7.54 ±  4%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     10.26 ±  3%      +1.0       11.22 ±  4%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.18 ±  5%      +1.0        3.21 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_wait_writable.opipe_prep
      9.59 ±  4%      +1.1       10.67 ±  4%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.39 ±  5%      +1.1        3.48 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      4.28 ±  5%      +1.5        5.75 ±  4%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      5.02 ±  5%      +1.6        6.65 ±  4%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      7.07 ±  5%      +2.0        9.11 ±  4%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read
      7.18 ±  5%      +2.1        9.25 ±  4%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read.vfs_read
      7.78 ±  4%      +2.1        9.85 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_read.vfs_read.ksys_read.do_syscall_64
      7.35 ±  5%      +2.1        9.41 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_read.vfs_read.ksys_read
      9.72 ±  4%      +2.5       12.17 ±  4%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_wait_writable.opipe_prep.do_tee
     10.11 ±  4%      +2.5       12.64 ±  4%  perf-profile.calltrace.cycles-pp.schedule.pipe_wait_writable.opipe_prep.do_tee.__x64_sys_tee
     10.76 ±  4%      +2.6       13.41 ±  4%  perf-profile.calltrace.cycles-pp.pipe_wait_writable.opipe_prep.do_tee.__x64_sys_tee.do_syscall_64
     10.80 ±  4%      +2.7       13.46 ±  4%  perf-profile.calltrace.cycles-pp.opipe_prep.do_tee.__x64_sys_tee.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.54           +12.7       63.20        perf-profile.calltrace.cycles-pp.read
     42.26           +14.2       56.41 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     28.07           +14.2       42.30 ±  4%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     40.80           +14.5       55.32 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     25.97           +14.9       40.85 ±  4%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     22.18           +16.1       38.23 ±  4%  perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.91           +17.4       22.32 ± 10%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.46 ±  2%     +17.6       22.02 ± 10%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.pipe_read.vfs_read.ksys_read
     30.08 ±  2%     -11.3       18.76        perf-profile.children.cycles-pp.write
     17.39 ±  2%      -6.4       11.02        perf-profile.children.cycles-pp.ksys_write
     15.39 ±  2%      -5.6        9.75        perf-profile.children.cycles-pp.vfs_write
     11.81 ±  2%      -4.4        7.41        perf-profile.children.cycles-pp.pipe_write
      9.06 ±  2%      -3.1        5.96 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      3.98 ±  2%      -1.4        2.62        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.71 ±  2%      -1.3        2.43        perf-profile.children.cycles-pp.copy_page_from_iter
      4.08 ±  2%      -1.2        2.86        perf-profile.children.cycles-pp.copy_page_to_iter
      3.37 ±  2%      -1.1        2.25        perf-profile.children.cycles-pp.mutex_lock
     13.75            -1.1       12.63 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.12 ±  2%      -1.1        2.04        perf-profile.children.cycles-pp._copy_from_iter
      3.46 ±  2%      -1.0        2.43        perf-profile.children.cycles-pp._copy_to_iter
      2.46 ±  2%      -1.0        1.50 ±  2%  perf-profile.children.cycles-pp.file_update_time
      2.08 ±  2%      -0.8        1.26 ±  2%  perf-profile.children.cycles-pp.inode_needs_update_time
      2.31 ±  2%      -0.8        1.53        perf-profile.children.cycles-pp.copyin
      2.32 ±  2%      -0.8        1.54        perf-profile.children.cycles-pp.__fdget_pos
      2.58 ±  2%      -0.8        1.81        perf-profile.children.cycles-pp.copyout
     11.99 ±  2%      -0.6       11.38 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      1.70 ±  2%      -0.6        1.10        perf-profile.children.cycles-pp.x64_sys_call
      1.56 ±  2%      -0.5        1.01        perf-profile.children.cycles-pp.__fget_light
      1.73 ±  2%      -0.5        1.19        perf-profile.children.cycles-pp.mutex_unlock
      1.35 ±  2%      -0.5        0.87 ±  2%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      1.23            -0.4        0.80        perf-profile.children.cycles-pp.__cond_resched
      1.18 ±  2%      -0.4        0.79        perf-profile.children.cycles-pp.__get_task_ioprio
      1.37 ±  2%      -0.4        1.00        perf-profile.children.cycles-pp.current_time
      0.45 ±  6%      -0.4        0.10 ±  6%  perf-profile.children.cycles-pp.splice
      0.96 ±  2%      -0.3        0.63        perf-profile.children.cycles-pp.security_file_permission
      0.90 ±  2%      -0.3        0.58 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      1.17            -0.3        0.85 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.74 ±  2%      -0.3        0.44 ±  3%  perf-profile.children.cycles-pp.timestamp_truncate
      0.90 ±  2%      -0.3        0.62 ±  2%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.31 ±  6%      -0.2        0.07        perf-profile.children.cycles-pp.__x64_sys_splice
      0.65 ±  2%      -0.2        0.42        perf-profile.children.cycles-pp.rcu_all_qs
      0.70 ±  2%      -0.2        0.47        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.48            -0.2        0.26 ±  6%  perf-profile.children.cycles-pp.switch_fpu_return
      0.76            -0.2        0.54        perf-profile.children.cycles-pp.fpregs_assert_state_consistent
      0.27 ±  5%      -0.2        0.07 ±  5%  perf-profile.children.cycles-pp.do_splice
      0.62 ±  2%      -0.2        0.43 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.51 ±  2%      -0.2        0.33 ±  2%  perf-profile.children.cycles-pp.kill_fasync
      0.53            -0.2        0.37        perf-profile.children.cycles-pp.fsnotify_perm
      1.04 ±  2%      -0.2        0.88 ±  4%  perf-profile.children.cycles-pp.stress_tee_pipe_read
      0.21 ±  6%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.splice_from_pipe
      0.17 ±  6%      -0.1        0.06        perf-profile.children.cycles-pp.__splice_from_pipe
      0.46            -0.1        0.36        perf-profile.children.cycles-pp.amd_clear_divider
      0.24 ±  3%      -0.1        0.15 ±  2%  perf-profile.children.cycles-pp.__x64_sys_write
      0.30            -0.1        0.21        perf-profile.children.cycles-pp.make_vfsgid
      0.31 ±  2%      -0.1        0.23 ±  2%  perf-profile.children.cycles-pp.make_vfsuid
      0.24 ±  3%      -0.1        0.16        perf-profile.children.cycles-pp.__x64_sys_read
      0.23 ±  3%      -0.1        0.15 ±  6%  perf-profile.children.cycles-pp.read@plt
      0.47 ±  3%      -0.1        0.40        perf-profile.children.cycles-pp.stress_tee_pipe_write
      0.75 ±  4%      -0.1        0.68 ±  4%  perf-profile.children.cycles-pp.put_prev_entity
      0.19 ±  3%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.write@plt
      0.13 ±  4%      -0.1        0.08 ±  5%  perf-profile.children.cycles-pp.__alloc_pages
      0.69            -0.0        0.64 ±  3%  perf-profile.children.cycles-pp.__raw_spin_lock_irqsave
      0.11 ±  4%      -0.0        0.07 ±  8%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.26 ±  4%      -0.0        0.23 ±  5%  perf-profile.children.cycles-pp.__enqueue_entity
      0.18 ±  3%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.18 ±  3%      -0.0        0.15 ±  4%  perf-profile.children.cycles-pp.__folio_put
      0.16 ±  3%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.uncharge_batch
      0.23            -0.0        0.20 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.11 ±  4%      -0.0        0.09 ±  6%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.10 ±  4%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.30 ±  5%      +0.0        0.34 ±  3%  perf-profile.children.cycles-pp.place_entity
      0.29 ±  4%      +0.1        0.34 ±  4%  perf-profile.children.cycles-pp.entity_eligible
      0.23 ±  4%      +0.1        0.29 ±  5%  perf-profile.children.cycles-pp.__calc_delta
      0.73 ±  3%      +0.1        0.82 ±  4%  perf-profile.children.cycles-pp.pick_next_entity
      0.46 ±  6%      +0.1        0.57 ±  5%  perf-profile.children.cycles-pp.update_min_vruntime
      0.38 ±  8%      +0.1        0.50 ±  9%  perf-profile.children.cycles-pp.update_cfs_group
      0.36 ±  5%      +0.2        0.57 ±  4%  perf-profile.children.cycles-pp.avg_vruntime
      2.00 ±  3%      +0.2        2.25 ±  4%  perf-profile.children.cycles-pp.update_curr
      2.60 ±  3%      +0.7        3.29 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      2.80 ±  3%      +0.7        3.54 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      4.96 ±  3%      +0.9        5.83 ±  4%  perf-profile.children.cycles-pp.activate_task
      5.81 ±  3%      +0.9        6.73 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
      8.99 ±  3%      +1.0        9.98 ±  4%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.52 ±  2%      +1.0        1.55 ±  4%  perf-profile.children.cycles-pp.reweight_entity
      8.46 ±  3%      +1.0        9.50 ±  4%  perf-profile.children.cycles-pp.__wake_up_common
      8.21 ±  3%      +1.0        9.25 ±  4%  perf-profile.children.cycles-pp.try_to_wake_up
      8.28 ±  3%      +1.0        9.33 ±  4%  perf-profile.children.cycles-pp.autoremove_wake_function
     10.80 ±  4%      +2.7       13.46 ±  4%  perf-profile.children.cycles-pp.pipe_wait_writable
     10.80 ±  4%      +2.7       13.46 ±  4%  perf-profile.children.cycles-pp.opipe_prep
     78.70            +5.3       84.02        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     76.54            +6.0       82.56        perf-profile.children.cycles-pp.do_syscall_64
     52.48           +12.0       64.52        perf-profile.children.cycles-pp.read
     28.30           +14.2       42.46 ±  4%  perf-profile.children.cycles-pp.ksys_read
     26.31           +14.8       41.08 ±  4%  perf-profile.children.cycles-pp.vfs_read
     22.64           +15.9       38.55 ±  4%  perf-profile.children.cycles-pp.pipe_read
      5.05           +17.4       22.42 ± 10%  perf-profile.children.cycles-pp.touch_atime
      4.76           +17.5       22.22 ± 10%  perf-profile.children.cycles-pp.atime_needs_update
      3.86 ±  2%      -1.3        2.54        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.95            -1.2        2.70 ±  2%  perf-profile.self.cycles-pp.read
      3.53 ±  2%      -1.2        2.32        perf-profile.self.cycles-pp.write
      2.45 ±  2%      -0.8        1.60        perf-profile.self.cycles-pp.pipe_write
      2.24 ±  2%      -0.8        1.44 ±  2%  perf-profile.self.cycles-pp.vfs_write
      2.26 ±  2%      -0.8        1.49        perf-profile.self.cycles-pp.copyin
      2.28            -0.7        1.54        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.48 ±  2%      -0.7        1.74        perf-profile.self.cycles-pp.copyout
      2.11 ±  2%      -0.7        1.43        perf-profile.self.cycles-pp.entry_SYSCALL_64
      2.08 ±  2%      -0.7        1.41        perf-profile.self.cycles-pp.mutex_lock
      2.02 ±  2%      -0.6        1.38        perf-profile.self.cycles-pp.pipe_read
      2.00            -0.6        1.39        perf-profile.self.cycles-pp.vfs_read
      1.59 ±  2%      -0.5        1.10        perf-profile.self.cycles-pp.mutex_unlock
      1.37 ±  2%      -0.5        0.88        perf-profile.self.cycles-pp.x64_sys_call
      1.38 ±  2%      -0.5        0.90        perf-profile.self.cycles-pp.__fget_light
      1.57            -0.5        1.09 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      1.16 ±  2%      -0.4        0.75        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.98 ±  2%      -0.4        0.60 ±  2%  perf-profile.self.cycles-pp.inode_needs_update_time
      1.04 ±  2%      -0.3        0.70        perf-profile.self.cycles-pp.__get_task_ioprio
      0.91 ±  2%      -0.3        0.58 ±  2%  perf-profile.self.cycles-pp.ksys_write
      1.16            -0.3        0.85 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.85 ±  2%      -0.3        0.54 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
      1.08            -0.3        0.79 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.91 ±  2%      -0.3        0.63        perf-profile.self.cycles-pp.ksys_read
      0.80 ±  2%      -0.3        0.52        perf-profile.self.cycles-pp.security_file_permission
      0.81 ±  2%      -0.3        0.54        perf-profile.self.cycles-pp.__fdget_pos
      0.91 ±  2%      -0.3        0.64        perf-profile.self.cycles-pp.current_time
      0.87            -0.3        0.61        perf-profile.self.cycles-pp._copy_to_iter
      0.71 ±  2%      -0.2        0.46        perf-profile.self.cycles-pp.__cond_resched
      0.58 ±  2%      -0.2        0.35 ±  3%  perf-profile.self.cycles-pp.timestamp_truncate
      0.66 ±  2%      -0.2        0.43 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.94            -0.2        0.71 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.76 ±  3%      -0.2        0.53 ±  3%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.65            -0.2        0.46        perf-profile.self.cycles-pp.copy_page_to_iter
      0.58 ±  2%      -0.2        0.40        perf-profile.self.cycles-pp.copy_page_from_iter
      0.61 ±  2%      -0.2        0.43 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.46 ±  2%      -0.2        0.28 ±  2%  perf-profile.self.cycles-pp.file_update_time
      0.63 ±  2%      -0.2        0.45        perf-profile.self.cycles-pp.fpregs_assert_state_consistent
      0.86 ±  3%      -0.1        0.72 ±  5%  perf-profile.self.cycles-pp.stress_tee_pipe_read
      0.42 ±  2%      -0.1        0.28        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.39            -0.1        0.26        perf-profile.self.cycles-pp.rcu_all_qs
      0.45 ±  2%      -0.1        0.32        perf-profile.self.cycles-pp.fsnotify_perm
      0.31 ±  2%      -0.1        0.19 ±  3%  perf-profile.self.cycles-pp.kill_fasync
      0.30 ±  3%      -0.1        0.20 ±  2%  perf-profile.self.cycles-pp.touch_atime
      0.25 ±  2%      -0.1        0.18        perf-profile.self.cycles-pp.amd_clear_divider
      0.39 ±  3%      -0.1        0.33        perf-profile.self.cycles-pp.stress_tee_pipe_write
      0.22 ±  2%      -0.1        0.16        perf-profile.self.cycles-pp.make_vfsgid
      0.16 ±  3%      -0.1        0.10 ±  3%  perf-profile.self.cycles-pp.__x64_sys_write
      0.24 ±  2%      -0.1        0.18 ±  2%  perf-profile.self.cycles-pp.make_vfsuid
      0.16 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__x64_sys_read
      0.66            -0.0        0.61 ±  3%  perf-profile.self.cycles-pp.__raw_spin_lock_irqsave
      0.24 ±  4%      -0.0        0.20 ±  5%  perf-profile.self.cycles-pp.__enqueue_entity
      0.09 ±  4%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.18 ±  2%      -0.0        0.16 ±  5%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.17 ±  2%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.33 ±  2%      -0.0        0.31 ±  4%  perf-profile.self.cycles-pp.prepare_to_wait_event
      0.10 ±  4%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.07 ±  6%      +0.0        0.08        perf-profile.self.cycles-pp.perf_swevent_get_recursion_context
      0.11 ±  4%      +0.0        0.13 ±  5%  perf-profile.self.cycles-pp.check_preempt_curr
      0.10 ±  9%      +0.0        0.12 ±  7%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.15 ±  5%      +0.0        0.18 ±  7%  perf-profile.self.cycles-pp.resched_curr
      0.17 ±  5%      +0.0        0.21 ±  4%  perf-profile.self.cycles-pp.pipe_wait_writable
      0.40 ±  3%      +0.0        0.44 ±  4%  perf-profile.self.cycles-pp.___perf_sw_event
      0.26 ±  4%      +0.1        0.31 ±  4%  perf-profile.self.cycles-pp.entity_eligible
      0.21 ±  4%      +0.1        0.27 ±  5%  perf-profile.self.cycles-pp.__calc_delta
      0.41 ±  6%      +0.1        0.51 ±  5%  perf-profile.self.cycles-pp.update_min_vruntime
      0.90 ±  3%      +0.1        1.01 ±  4%  perf-profile.self.cycles-pp.update_curr
      0.35 ±  8%      +0.1        0.46 ±  9%  perf-profile.self.cycles-pp.update_cfs_group
      0.33 ±  5%      +0.2        0.53 ±  4%  perf-profile.self.cycles-pp.avg_vruntime
      0.22 ±  2%      +0.4        0.66 ±  4%  perf-profile.self.cycles-pp.reweight_entity
      2.93 ±  3%     +17.9       20.82 ± 11%  perf-profile.self.cycles-pp.atime_needs_update




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


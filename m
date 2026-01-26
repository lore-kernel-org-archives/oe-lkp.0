Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED6339867
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434189; cv=fail; b=eGkQFmx88IUZMYex4FTXJsNx4lnycXtqTLHbX3BjKPqBiUzw7joWkAiRtU4lG2h4kHAsNOzHn+qTXnBdbBApRv4jn/rmQUNzJd6GZiWOG1heJ7NcPqXhcT6VGzEazdkOgJnxrAvOng6HWw8rzC2TIJLNnUGdkQv06krFZGb8khw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434189; c=relaxed/simple;
	bh=+/FF4eDcTiEHs555Yi8AMka0ruy9uaawJ8ZOkhxUJLY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PLzUDU0dbk+54t3rLv9VDpiqni0hwZ1PLoZ676296WR//h2Nrk2FI4BI6EGs4mZXb5mZUFVtC0X0+w3PdYnJXR7iirgkRLY3Oogrfv4RvrILvgQ0HiTJT+sd/JB7DBvMhIXh5DLbm1R2PL3ku73d22Kps4er8arQO5RK0LyoWBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nx9pdUCT; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nx9pdUCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769434187; x=1800970187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/FF4eDcTiEHs555Yi8AMka0ruy9uaawJ8ZOkhxUJLY=;
  b=nx9pdUCTkJDlyVSJzguApIpIbPJqcbboDJMDF01i+nHy//rnOnff4G0g
   biY1+o4KxS582j3d+W7gYYQsTWKStsNA8wwHXNE+/HB7mOZn7b/hL5QZ2
   vVSGsD/LleglUJ6IQ24FCIDD5TTpmzz2tmGQbKeK2NRn6m5vAsNnVNiEM
   4SHOFj51xC3Vh9xJ1uFi/lKoFpzQoYWgv+yXyJiLfhmWYLbuoBDimYCf/
   mPIPMyeC3cNRqOLmAla709Gk/SLvFWmcn+2cgXE4hgYlrfa8n1rUujpZX
   RhqOMjwyHoXd7jzvySWWG9wxVoSfAm29rWK9lch19w/GLUrS0Pl5JiK/o
   g==;
X-CSE-ConnectionGUID: VKYtkUqJQ8aljTO9BMChyA==
X-CSE-MsgGUID: Rr+63SUMQemgrmkdALKg1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70513041"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70513041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:29:47 -0800
X-CSE-ConnectionGUID: Q1DuGUCXQN6WhVNwFedsrQ==
X-CSE-MsgGUID: AJwo9l37T+GDB6ggR+fyGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207563944"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:29:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 05:29:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 05:29:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 05:29:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR+0f1jGiNLp+zQ0sk0ZBkCeNt+r6okqoyDTPlsV00oHJOHXAHmkgqEgD/JMrN3+I9XS2F7pg9srjmMpAK822ig/DNMaHs17k+6aJK/iPYZQy2Pxujt33akahCgw2A+MMya2ib/qXyAKATBlb7uce8arSK8BCHzQ+sl0atjvQtLRbmrXURdPM8reWuExUcokQIBp9fm7PgZirhBYiLO3T8ilXlIxic+fgr7H6agU+2nEzaRgGj/sxNSrd4SrHxQZU2e2dXzE2ZXkzhz/uX9e6t3JnrvspRaLjVOH8nz2xjoqcTAz89LtVATNNUbbsX5v47jVtcvDlMgh55s9V4v94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oUKoqsV6UGSHWusaUU3BuXi2a6l3/g+Wn6mrfuf2aQ=;
 b=c/HHQqS3qmHl7FCJqtzkUrh3AO/AusedY9t7pxaeNUhyGkDH2sJW/HUY+iPqDY1Sf4kxxO1/nUIMzC2+Fo6bLRLISsO2iBK6SaFKjONeerQu7ACGFEaEGzPQomDs8jJ6o4O6LSi8OeGcPXH1cM022ZiHMHITL9OjlliI0SFx5KksvZqUD0RLcApWjRtwSLn0BdoLxrY21aXlhNPI1Q7jJ4j/62uZx/+7CrnC2yF/wMRR4+yUJboCgTy3HHgQF3P55hyU/eCXARbAo6r5fS467qrLa02nMckI8izxzoYPKioaI+UtU3Hu0nSVLeCzPHHD7Xqpyud0vI4uPrJJNW+wjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 13:29:42 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:29:42 +0000
Date: Mon, 26 Jan 2026 21:29:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:wk-modhash] [dyndbg]  37e1c3e5c7:
 UBSAN:shift-out-of-bounds_in_lib/dynamic_debug.c
Message-ID: <202601262104.7de47c0d-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a11473-8663-4e97-7a26-08de5cdef6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WgIXOfgq/IqzVKuXm8g4ch9XMm/Ny01857K4fZHYQr/17cnrL3Cooyi49ook?=
 =?us-ascii?Q?i0BbM8pQWQq2tWKJHeUYmhGHjhyK4faubVsKDPYrGu5xdC3kDqYfxdBmwDfQ?=
 =?us-ascii?Q?SaIGteojxy9xwplBNW8qdUzgGSkanZwki9B3ZePMepqCCkVqnRZVAyCkAvX8?=
 =?us-ascii?Q?E14DvODlO2WggIFkyX/d9S1wLrxLyA2T9+UeVjvBjGnx2WjXJffptBv6bHep?=
 =?us-ascii?Q?S67DRUwv1+MafEPu0JdjV9EDUTNFTiFjhcFTR7e4xE0ACrqr0QcOkxj+F9wC?=
 =?us-ascii?Q?xQ3WH6asO4c1hpCNZKC/7o6wpcJBpsxyJrz2KHJhfPGobLNLybhBDbRiKSM/?=
 =?us-ascii?Q?QT0AXOy+YvDkq39df4mJIA8mXeIK7rXvN4V+0YcDJnUFvynlLGu70yfdNSnz?=
 =?us-ascii?Q?+MFhL5e9TElyqeiScJ5RQXzwXSTp/r4Tktzu6aV7fdPoaHKXnTr0OVdd6S+u?=
 =?us-ascii?Q?HmsmJZmNjoOlWHq8+HCJBiDrF625X5GZ82fcTp3kn/hUAi4qL1TXsb8C+wWj?=
 =?us-ascii?Q?GJ1hUO+qo15h7PZ1wKeLBuiKQ8GenhpbYDTAGICYhoXhPHHkEBM8GWMvAZtQ?=
 =?us-ascii?Q?O4k3q8ZI5wSGmEbX8CMEgBi1AcDRqJiJJReRxlwdFNdG721wuErJyKFMla1F?=
 =?us-ascii?Q?4UzbtyY7iVXLJ/J36yN2ImxNELptzBaWYy4pXIol7QaG9uxKf71qhVpZG7+q?=
 =?us-ascii?Q?fze6sZUcuYH04VcCnHC1QQZ0gArYKKLLhjN5Kq/RhGZNQq8oPvLyezc/wOft?=
 =?us-ascii?Q?mWuC9aFEdsNQrKGYzIlWGWAG5jFDhtSSmiCCfDa40DGY0kAsKsCCs1VDUtid?=
 =?us-ascii?Q?4PRxMD/kZzzYCC4ImJvU/Eq9hJy/fj4gGM2K8n9daFunt4VzcKr6FHRsEVbw?=
 =?us-ascii?Q?StKcx5rwkOitrOFRvCYmRgRkDr6m57v8iUrarTlzj+Pl5aDf5i64V2GHWVsx?=
 =?us-ascii?Q?B0cHMoQ4IOcmuSuyU29K/L0WdLI+xDuW4TcMNIOqq/1aIfxlqPVU+oJPzbXg?=
 =?us-ascii?Q?A3vuSS13fe7u6qpYpdSrndmnJ2oDLohIVl5S/425FqwFxPQDtTPjbFLCURg1?=
 =?us-ascii?Q?/pO0k+IkyEwJ/dXohG+VdyU/7glhAF/9z8r4BcbGdBx2T32zATrilLD7T3WL?=
 =?us-ascii?Q?kjNhSsUL/BfGEV7D8WLN9suqqgjNIU5FyV4GADj91zEzJmZ1kwEvnA+SUnv2?=
 =?us-ascii?Q?sBjHRma0ZT51GcAbdaKO68jd6Fa9/uz6do7k8Zrglg5t9pJ7+H62trWOtmzt?=
 =?us-ascii?Q?F8NbcTcwPJ79N/M459QL6uoae3dkzOVAlL0/DDEEWr5lulqCTA4usbrpHit2?=
 =?us-ascii?Q?IMn6v76UFzzBed9khK096ikERcO/OUpsU/YY9ZQ7PGjIQC/ZBlrXizr/tXYD?=
 =?us-ascii?Q?83CmWtWtyTQJP3mpLq4LT1QbOl1zsOGAvF4NW0/HQKCuVgNvtulB06+Uemca?=
 =?us-ascii?Q?MB8Ms08KNetp61aF2tKni8jkYjUINhdX2+uGAyz7Xbl43oNhk8XpspjvZwQI?=
 =?us-ascii?Q?8T9afSgVaJqFgYTUFYSpQVsxst2xr4kLHFcvSO4MdWvGfhqAAT+uWi+lsvVr?=
 =?us-ascii?Q?0dyoUn91BszUeAoZzXaZnSzPZNnaWjb8EwLcMMO3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wBa2wGzEsQjnS3ILKHZWbFIaBKqSuXaqizYPEX2ZWiNa5lmKEq7xf7z+TY3v?=
 =?us-ascii?Q?fLQDIcXnJahrsKy4gh0etPtOVpjD5XJP36XJBaSS//VKrnaTBadJxqwllNIj?=
 =?us-ascii?Q?KS3rYl974+FIvh1DzF9AMRuWFAEavSKQPKSlFYSmDOnXxA7TguCX0py589wD?=
 =?us-ascii?Q?WAGrUd+2DrHZ4XARbM0J9rMmAxXNg7kF8lX/cTow7avjjXn0SAsDdHwI7EjP?=
 =?us-ascii?Q?EK2L2v+dj2l0/sbdXi/vD8//FTHu5NZwvqmfHkQaN5wKO99es/PLs0MlK40+?=
 =?us-ascii?Q?TojXcwIQM4AxViBHmCEDvOmk1wEk3yl245ZAhwPmGAgZXFDuivbydKpAclZr?=
 =?us-ascii?Q?7hgPNa18OnkRkjq/KrqJSZO1NsghOtw8U4FdtcgWag9SeQN6r+F9ns3lL8UH?=
 =?us-ascii?Q?9CvTm4XUc6OJRUKSES4ZMsPXqbIcZ/YZMnx1web0tenzQtqrfj+ASEHioaXQ?=
 =?us-ascii?Q?2Uz6UhcHJJ4HPcN+XrvOimJMyT8e/9q0pnqkldiyFGPH8agxSlwEv9tkPJp3?=
 =?us-ascii?Q?RuwIgZMhdokxz3vJ35KbFIYjLZQbvYgA8YrQPVTgJT2cBy+KkyMcxWqMgf7h?=
 =?us-ascii?Q?9hJQWdKxZDwb1BeBIcPTpMFil95+S2azSeSqPA/La0xCqQulnERhgOEvr4hi?=
 =?us-ascii?Q?1XRK85KnVTp38+NagkctUzaKY9WkCD1O87bElN/JGMd5wMvmrmXWnPqpJIe7?=
 =?us-ascii?Q?zs4RG5lXh/ZQYp9Ag021s2ufGMpgRf0ZODdDlsqa1dozfFDHBtTdxAdsq12B?=
 =?us-ascii?Q?59H/6CKfzQCojc6we8gjhHfukjhOT3VYp7eYB4Lnn2rTZtwIU3iu4eoxWO9Y?=
 =?us-ascii?Q?9KH9mjpNdTuxIpOGQUca3zjFDalXWD85pz5zB0LXJnNpW3v8pY5kR+rJwMvB?=
 =?us-ascii?Q?UkylAy74rB6aqZ02jiLeqqmZQ0WtaiAO65rAfoWv28XBGuLANdvxsQwAqvhJ?=
 =?us-ascii?Q?8NG4lSh/4L67Us9S7rinSol0gfU1A0MQWJI68NOXjHClITxqrAL4jgdNUvu9?=
 =?us-ascii?Q?RDFEQCxHbu7dLHHHHo5MLwIZAzpSlULqWKP+/KPMzP5+2leUOoFhUBzIQIdQ?=
 =?us-ascii?Q?gg18MS0fX/Zz7/oSM11sXl370tlI9WOCp3r6CMovC80vPSNpIKRYNVqAeSGn?=
 =?us-ascii?Q?b40TFlYT0SRSZMzo262t+7+iBQdd1GPcAzW481Zh6dJW1hR/DfqdJupJfSJm?=
 =?us-ascii?Q?FQYJXpBQuyCVz4nLN0sX1WrMJ+KsKu0myzna9R49mUboXyd5YyEFkpiotv0W?=
 =?us-ascii?Q?fghrRQziC3oXMEatuaXXy13UyHfuIzd/0qJPhD65P+vcRZgA0ZxTasfJZiR9?=
 =?us-ascii?Q?gbgvbj2P0PRLEPBglzigQsOuTiTBVV+9NQo/bsp5rrotERxkSYjoUnl6kahF?=
 =?us-ascii?Q?HJGRhrdLAG1jFpw91+iw+lqMIe0nEW9GorxT6ktUlX+S3rALvgG/6ypRpLnr?=
 =?us-ascii?Q?QVHxKiUUwGMsWvm9tUM0ax8InJgeHb+Fu47jZalCnPq2uB7syKEgl2S/D6L5?=
 =?us-ascii?Q?QMu3yVIz0AuCLbV9IId5DZAwjuaIVLQJ1g4peEwe1vaY2sgLjgIKbxMtm2KR?=
 =?us-ascii?Q?6LF82bqs7YWkTcdgqdVMEJ3YHkmI1bGn3bciwl10z/BmgMb06QsgFbMQeoge?=
 =?us-ascii?Q?FfFs2bG0YnC11dZyj1PVZ+SnMqKzcLfwgW+p32R8QjKNVFHzfkWyQmhWIepp?=
 =?us-ascii?Q?tRtdR2Ki4PumeDUkoPkcEHHv1F0ieOj5RrSJhUAkKXna4Cm4y8M/CwEqjJSm?=
 =?us-ascii?Q?lP9SrE8Wmg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a11473-8663-4e97-7a26-08de5cdef6c4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:29:42.7002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCZk44zDuqPAWW1rp/tcipB//MvXrzNJFEEFySmPJ+Fv6+oS1D2BLhUHcwItcjqsi0ppHRMG2h9OHfg5ZBd/eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_lib/dynamic_debug.c" on:

commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 ("dyndbg: cache the dynamic prefixes per callsite.")
https://github.com/jimc/linux.git wk-modhash

in testcase: boot

config: i386-randconfig-007-20260122
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601262104.7de47c0d-lkp@intel.com



[   14.780445][  T188] ------------[ cut here ]------------
[   14.781136][  T188] UBSAN: shift-out-of-bounds in lib/dynamic_debug.c:1829:32
[   14.782062][  T188] shift exponent 56 is too large for 32-bit type 'long unsigned int'
[   14.782876][  T188] CPU: 1 UID: 0 PID: 188 Comm: modprobe Tainted: G        W           6.19.0-rc6-00045-g37e1c3e5c714 #1 PREEMPT(voluntary)  2e75ccc13652b2427b0e513c9a339818f0710a46
[   14.782881][  T188] Tainted: [W]=WARN
[   14.782882][  T188] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   14.782887][  T188] Call Trace:
[   14.782888][  T188]  ? show_stack (arch/x86/kernel/dumpstack.c:338)
[   14.782897][  T188]  dump_stack_lvl (lib/dump_stack.c:122)
[   14.782903][  T188]  dump_stack (lib/dump_stack.c:130)
[   14.782906][  T188]  ubsan_epilogue (lib/ubsan.c:234 (discriminator 1))
[   14.782910][  T188]  __ubsan_handle_shift_out_of_bounds.cold (lib/ubsan.c:494)
[   14.782917][  T188]  ddebug_prefix_key (lib/dynamic_debug.c:1830)
[   14.782920][  T188]  ddebug_drop_cached_prefix (lib/dynamic_debug.c:1836)
[   14.782923][  T188]  ddebug_module_notify.cold (lib/dynamic_debug.c:1770 (discriminator 3) lib/dynamic_debug.c:1798 (discriminator 3))
[   14.782926][  T188]  notifier_call_chain (kernel/notifier.c:87)
[   14.782931][  T188]  blocking_notifier_call_chain (kernel/notifier.c:380 kernel/notifier.c:368)
[   14.782935][  T188]  do_init_module (kernel/module/main.c:3140)
[   14.782937][  T188]  load_module (kernel/module/main.c:3515)
[   14.782943][  T188]  init_module_from_file (kernel/module/main.c:3719)
[   14.782948][  T188]  __ia32_sys_finit_module (kernel/module/main.c:3730 kernel/module/main.c:3756 kernel/module/main.c:3740 kernel/module/main.c:3740)
[   14.782954][  T188]  ia32_sys_call (arch/x86/entry/syscall_32.c:50)
[   14.782956][  T188]  do_int80_syscall_32 (arch/x86/entry/syscall_32.c:83 (discriminator 1) arch/x86/entry/syscall_32.c:259 (discriminator 1))
[   14.782960][  T188]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[   14.782962][  T188] EIP: 0x37ee2092
[   14.782965][  T188] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   14.782967][  T188] EAX: ffffffda EBX: 00000003 ECX: 004a3214 EDX: 00000000
[   14.782969][  T188] ESI: 01ae5ef0 EDI: 01ae5530 EBP: 00000000 ESP: 3f958ca8
[   14.782970][  T188] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200216
[   14.782975][  T188] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260126/202601262104.7de47c0d-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


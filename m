Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C461EBFF7
	for <oe-lkp@lists.linux.dev>; Wed, 18 Feb 2026 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771387614; cv=fail; b=uSU8DX0x17GOhcbFWo3baT2xpPwyKBhwYuG9fSswYm9XN/ZeTnJtuPvyKzPAGiWvMbeXvtrfPpntIR+rNM676lAncqi4xYkl9MMo3QBpw6eRJJe90w2fVOW+E4MhjH2Y2BUubKk0o+ZMnA6H0ObP2mG9oGF28fJiXMh0jsfdnU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771387614; c=relaxed/simple;
	bh=JrcPooIPXUXUrbt6xzt+PophCmS1n1HFZwjfAxNvbHI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=P0b0KXQ+ZpCGCepGjqULRs2GT5f1uh64YE1eh/AoVH9YjC8/mtj9Y+xtvMYO7STPT25/B2DE2ihxQDk0fGgtIK2S7m2n1u3y08oaW3tz/oenLuP6jadXQfe4NEdjEbkMARUAgb4v9qN+KbfP11TnDDD1Pa2jC3Ia/4SXvyp/heM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUKoUMnU; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUKoUMnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771387613; x=1802923613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrcPooIPXUXUrbt6xzt+PophCmS1n1HFZwjfAxNvbHI=;
  b=EUKoUMnUddxD6GomQQggvmuUEk2yM4aHIRiT5Ex0O5wO6NPcXy8gYJe9
   nXELs0TIENhdIANvEgza91ICLPoy5zMNXeBNQg8ylBQqMryuYOWCRAWP7
   dgAOKKZYLYEXrCzl4T1PrZ1eV4UNO74Sw/q8lhLirET6MmMo9h2Y/4ro2
   COJZ9FssOaENSPPzmr8WiZ+P37OLzRTdZtV6k9v9v2jE38XMa6B+t5xdJ
   58ONu9MAfVAvFdJvCpJN9qAz+ENHleaR/sNQseDRrA5gzrQ2DMwONEgMq
   JH6Qe9BQoDwNrn7eD3K4qWDwBskvbmzstdfqLANV/avMBPPeboynBbdqs
   Q==;
X-CSE-ConnectionGUID: eIxld5xnTmqFFG8UoxqlBw==
X-CSE-MsgGUID: jEIO/TQoTne5Eg//xz4ovQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="89877239"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="89877239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:06:53 -0800
X-CSE-ConnectionGUID: 3jfpRGsIRXOr+KiEl9cf5g==
X-CSE-MsgGUID: hOp4wYs4RDOFhRiCNiJdhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="212478402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:06:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:06:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 20:06:51 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foonIaGthY7aBFPlpxTa2uMaA73BUc2f3cnQbVgfbEoLvi4vAscXlJN+1iNXYjr5ZDxPJ6AkJBRwBtBz/moPbEpEjxeNzmqSya2NlWKf14uYTu3F24ByBP8K5fT1ltkZCxp0cPpW9yJY9WgxwtgnrTxsDlEnQTdBfvRHeHUBCEN06DdF5AIkfJ2pvvVUSyubqoZocAbJNGMOpi0xUcG6aNC3hsnnc62ispclPgQGCqIygIzi5Dh3462d8PZt6gdILd4aj9AAvjybfIMTZOLPhPcgeR1KX5kvgIrPIQ/SP11ThM4WxD7FNutA0NpNFXDl2+nvCzWuG7T9cTCse37mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiE5Q8+oUE/YPlmB3BHb9pWAuwcZe5IGtiYyiQNN4M8=;
 b=kyhJMpH8OR0/R7uvCePpwi2LEj0qh/aR0xKHRv6fBL/LaornZQSyh8VO9CGlnu8bClCx+o3HmR+4F941IUkO7BNlaHsW+UmjauatoolYHJbWRZizLR+KBAjl0MdgDY+f2XrT6lTsN/jEW6CVt+TtDQzO7Untu4QIWn+mixZuMheNBBJobh9YDXLZ7xVIZplOUduZThC1R1307QhAt/Z4aqdjD1NUEseVOUnc/XlIbRLOr6epfgi20TgWCokx5LsTo8R8qkmFyCVLT50mvcRhuP12Fe+h02Fpgl2hq0CYtTdcp2BCtet1e/QEMQNoW8qSyVI4yNpp7Tee4vqgQpyZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB9496.namprd11.prod.outlook.com (2603:10b6:208:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 04:06:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:06:45 +0000
Date: Wed, 18 Feb 2026 12:06:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/auxclock-nanosleep] 3f30076c1d:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202602181128.ac178dea-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: adedc856-d702-4c69-f2ae-08de6ea320b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QZbDLywxhgh9P0/NhwX5ndtzT03eaDwoSLlqrY696pGH8qz8VDiWgpgX3OoG?=
 =?us-ascii?Q?GgIGtsQkaM9vDdZ0xbs8C7WSDdVMz/YysUBdB7FgShkwHyuQPugdvM+zFzjB?=
 =?us-ascii?Q?DTO+tObhUnVnSUV8NewtrvD1rHXONt31aBTzyGXX8i4rW5l7InUQq7ARuS8B?=
 =?us-ascii?Q?GA4UgAOXABhHQY82IVPGRh6xojxSE8kdiKXbdD3wES0MdpwDIk5Q40TboWQV?=
 =?us-ascii?Q?sz9FrrITu33gbdH5UgkF8v93ytb4p6Jjh6ELQfWnFwTLT4MO00tIQZ3EJwln?=
 =?us-ascii?Q?JEZ3pBz3OLTMEfDTNUDuMxRXX+l3ekaoGRmGPv/+6wokMKWp3tTa6rj1nxjm?=
 =?us-ascii?Q?HBvlghWDAvrlkxRm4+r1psx59LhX3g7I0HmEN11sG2FWvflj729ghrX9o1Ue?=
 =?us-ascii?Q?tEapI1ELZtoXaEhXiK2BsRK0GiuqngnXyBffzrVUno4o8+eElFWxDoDizrFf?=
 =?us-ascii?Q?hvnGvXeZHknPLSVO+B4vzbuUV883e5DlbWaEGkYsM8e16zHVJ+cBPvCuXvKz?=
 =?us-ascii?Q?BnBF2Q08rN/jiVgRl2LzNG0s/gUWbVe3YTyE1xXK6AUR7AN8A5zFfNrxziJQ?=
 =?us-ascii?Q?fUJkzE6c/ezzsrurWT+qDhGkoHgKVWw/F3USC2hQhZlNqLAHEz/Dl40xpryH?=
 =?us-ascii?Q?zHaodu5wTk+pWqIDLXTUY/q4FelMYjVAqju/4o1lnc5DMSGWa93fCB1czgzr?=
 =?us-ascii?Q?MPZuH6YqAenESTs8aVk9kXefwHl+/I7yADAjg1HwXHzkGEh8A67DNMtGlKDx?=
 =?us-ascii?Q?NNXPZo5mh7eht/Ud4k3t5cLuc6BWzFp2f8mzMf6m/1PqTbk4Bzk62pOB9Qm7?=
 =?us-ascii?Q?jKJNfEuxvcuP3pO5trp6BFTvLBf76EAPwbBPiJveVdglE2K0RedqQbuMEU0y?=
 =?us-ascii?Q?MsmMVezRbfkZQkcPfQ6eY8DZzpMUusYZdPizhzIecoKfBwG5qe5nxaW5YKs6?=
 =?us-ascii?Q?d0Z2HKQfUmA3g36utWQ33ejydr2BI1zFVVBizoBo5toxvTjm1OpRKxcUTXbo?=
 =?us-ascii?Q?1mU2eo9XC+tiD5zBcLilo0KZaOyMvJhz5tUu4X/NAsNAbOoILMNmGCek0Jlc?=
 =?us-ascii?Q?KRhdVjl3yimS6YRfsKcE1UAD/mTMHdfIPirs2OOgXzuPnI2HJkLlMO2XLSN2?=
 =?us-ascii?Q?yeMHye8rlGvE17HdW+9ttrYEspAbJokkCq8RmgkgLcjCKjKbWG8DHwGC9rl4?=
 =?us-ascii?Q?jfHPJkIr0PRIFNokstFQjfrX0G6jRuQAcx4nqsE188meGSVLx7jaQmproLc0?=
 =?us-ascii?Q?CiEfO90JgvxO9AwTENe3wu12MaGrytGtrae3coJMyGEVbkbz3Rr0AedGGphb?=
 =?us-ascii?Q?eh8cuWCQXAmnvv7UtQ29tli3k2M03h5YKM1xFUO6d29Wms6FVY9UMwsHL383?=
 =?us-ascii?Q?IQuWL8+GlXe5fRIkL9nM8MXGCTFNkZqbC9T9WXpIPFAQWs3nf/dsQIEnWaxw?=
 =?us-ascii?Q?3glqn2qC8uA9sLmQ+o18toU09SWv8xZv+gwBW7FjLypOoxF6XMGTn+6+pBHR?=
 =?us-ascii?Q?KH1M7+wJN/xBfTj36TXv89DLt5EVaiz34CJaQ+Z5slczXsMiTPmCcy/EL5SM?=
 =?us-ascii?Q?YAYE5sSdOTImBXJK0kLwol+Ln9oWio2aHtuyrFvo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qrD1kIIUtW+DfLjWO9FrgJLLC9UOHVierFcDKkRNEyeNTzVPUTfB4N0TTnzv?=
 =?us-ascii?Q?b774ubsjTu1+6hHlk8O6MicXnx93vdiR+zrmmiUDa3GIxcI3QZZgA8DH9gU3?=
 =?us-ascii?Q?k1kTHDXrFUs1bvRBvm1TqJAJdsnWqcRF+zYGjagXEuyj2gcglHAFYwAnMyl1?=
 =?us-ascii?Q?tRf7IkLt5mRBoYkr6OcvGuXsFtqZwLujU8nmb4tPCPf0U5MrJr9x+kTPdyaL?=
 =?us-ascii?Q?wl7oI5HdGZR7XMLnzfHG7kV0eEQTPiTlUThZuNKiW8MrYI6uoJ4l1UdQ+L+9?=
 =?us-ascii?Q?0VgNGP258dtwU9SXox4hYdENfGOpkA6f+NB5WApKlx6CyJl+A/R1Dj9KnQgt?=
 =?us-ascii?Q?pX3jJ9xypF/8d98NjN0yzOkrL7h7z82djpPpWz2eKypYeTwCg7XH6haM1rQT?=
 =?us-ascii?Q?NuycTzI70oANnUUIPIclJV3SFs6qL4sNlw1EfX9qeQz1Ffu0mV+j11ahwqJv?=
 =?us-ascii?Q?3TooxWfO83hzQfVe0hNruW7P0/m7OnDZW8Oo7EqQTyJe6o6GHsFmb/H4pQlA?=
 =?us-ascii?Q?Nn1O/BPQ7FcnCpAaRS/REKiA1fJ4ku0Uhxnh1eVDOayiadjbsKgYTz2AtZYG?=
 =?us-ascii?Q?y6Ie1W8BDEqyC1DuWC38obH2P/33GWQEl13LW2Pzu7hyWfOKSB8JgwHnqE8s?=
 =?us-ascii?Q?bcF0bW/LepXmOVoTd0NLjFVRTDYHR/HUMBoFWYmcImVb9miL34c+VIIl7XSl?=
 =?us-ascii?Q?4+ut18+b312oJ3/nhsSK2g16alIMTtqx1uuUbW+h2ZdzY809ihlbsq3qdKbx?=
 =?us-ascii?Q?IfwAp9LAunBH2Jfo16E+MqSg0KFDxzzm1ih2YGVH+xitfstKA9uCpaDZslG6?=
 =?us-ascii?Q?4YnBoOlJ482b6+xX6jrBAKqcksjOBLhO6e+5y7iTNXLRqJ37IcWuCvIEE/np?=
 =?us-ascii?Q?ClrJK1IueuT/kgMkXL8+TujdjkwDibbJ0qGZGJBc02OyhdOky6iBcqPEwfbd?=
 =?us-ascii?Q?xcH/8uYDKerKPEshIZdQbbTF/qtSzc/ZWqcvHm7qA1zUZDzZxGFKyKK2P+gi?=
 =?us-ascii?Q?0vGqETAQPKNxZDHJ5xGEO8mCOTV+Iy816TBW+DtyyWEbw+CElNz4r0vP+/5P?=
 =?us-ascii?Q?MzycTHZ36q7/CD3Lrn36QESs+vthm5Ovvd6eIQNaN5sXEHgROpSR3+H63dKv?=
 =?us-ascii?Q?LH2hvJ/ILFNwA3jIc21UEryycJgWBdNObkZkbcY7kWvS3JSK+rA1fIVw42Ad?=
 =?us-ascii?Q?rsjNcEe6TmwFESHreKBpg9Hc9AFhCrk9pSc9aoFOt0cknAMBjIn0Qm0yUyFR?=
 =?us-ascii?Q?+u9PIBWldTnjRWPg+rf9NWnWg4Z/AFcEgoUKOFI6qXjLq/t5p8Eil3SGZ2mU?=
 =?us-ascii?Q?35qytN5vBdOEeyJvBLr2gWSUzo3Qgf/uD83X71c6PXOwbx0zZ4IMnJ3h1tTb?=
 =?us-ascii?Q?fBD0Qaekk4vEeYgmdhjuH3GtdqzDuC9X4SW8kPsWe7Y+1532r/WHyD2ovtND?=
 =?us-ascii?Q?2MdmNFvRXdY66NuZNIXn8wPg3mNar/nFTerA0OBGNuelGaxOExhHestp+Tgd?=
 =?us-ascii?Q?5X7Oc5VppokH6LmRB2p3kBy79oDaHw89qct7yvrrQnV+octrZHYK3XJ27l3O?=
 =?us-ascii?Q?o1WiiaQVaA01t4M8wi4Ef2Ctgz7W7U8tjQqbxx4AjgsLPm9sNQBnLx6AJFhv?=
 =?us-ascii?Q?pxuSw89C5xbTPY+5DMgbbjMMboQ83PK3DUNc38dSjNN86FNjpfn0r59jwNGm?=
 =?us-ascii?Q?5oguhbP+lAsBAQ041jkv6BmB/hS1eUr1myDpsu+yn89cMw8I4KqrswzHV+9J?=
 =?us-ascii?Q?y6/XlpAUZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adedc856-d702-4c69-f2ae-08de6ea320b7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:06:45.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XJ3eJHiWRqKZdGddEwrBH6vtZPgn9MBKBnLkIAdgAYvnOEzhVEH0FpyK+KHqtSHKDXoY6dv10HZrOgSlbuGkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9496
X-OriginatorOrg: intel.com



Hello,

this change looks like a debug commit to us. but we don't have enough knowledge
what's the purpose of this. just report this to you FYI in case it could supply
some useful information.


kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: 3f30076c1d2735a7650c49350a7040d9dda57cb9 ("count wakeups")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep

in testcase: boot

config: x86_64-randconfig-014-20260217
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602181128.ac178dea-lkp@intel.com


[   33.863984][    C0] ======================================================
[   33.864539][    C0] WARNING: possible circular locking dependency detected
[   33.865113][    C0] 6.19.0-10451-g3f30076c1d27 #1 Tainted: G        W       T  
[   33.865703][    C0] ------------------------------------------------------
[   33.866154][    C0] lkp-setup-rootf/57 is trying to acquire lock:
[   33.866565][    C0] ffff9a71009b98e0 (&tty->write_wait){-...}-{3:3}, at: __wake_up_common_lock+0x20/0x80
[   33.867945][    C0] 
[   33.867945][    C0] but task is already holding lock:
[   33.868660][    C0] ffffffffa970b578 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave+0xf/0x40
[   33.869710][    C0] 
[   33.869710][    C0] which lock already depends on the new lock.
[   33.869710][    C0] 
[   33.876111][    C0] 
[   33.876111][    C0] the existing dependency chain (in reverse order) is:
[   33.877113][    C0] 
[   33.877113][    C0] -> #5 (&port_lock_key){-.-.}-{3:3}:
[   33.878065][    C0]        validate_chain+0x202/0x2c0
[   33.878663][    C0]        __lock_acquire+0x5fd/0x780
[   33.879268][    C0]        lock_acquire+0x105/0x240
[   33.879861][    C0]        _raw_spin_lock_irqsave+0x40/0x80
[   33.880513][    C0]        uart_port_lock_irqsave+0xf/0x40
[   33.881173][    C0]        serial8250_console_write+0xcb/0x580
[   33.881951][    C0]        univ8250_console_write+0x4d/0x80
[   33.882641][    C0]        console_emit_next_record+0x177/0x200
[   33.883349][    C0]        console_flush_all+0x114/0x200
[   33.884027][    C0]        console_unlock+0x8e/0x140
[   33.884598][    C0]        vprintk_emit+0x2e2/0x380
[   33.885201][    C0]        vprintk_default+0x12/0x40
[   33.885883][    C0]        vprintk+0x5/0x40
[   33.886421][    C0]        _printk+0x50/0x80
[   33.886943][    C0]        register_console+0x5ef/0x6c0
[   33.887579][    C0]        univ8250_console_init+0x2b/0x40
[   33.888287][    C0]        console_init+0x10b/0x1c0
[   33.888867][    C0]        start_kernel+0x3ed/0x5c0
[   33.889459][    C0]        x86_64_start_reservations+0x20/0x40
[   33.890223][    C0]        x86_64_start_kernel+0x11c/0x140
[   33.890887][    C0]        common_startup_64+0xbd/0xe8
[   33.891514][    C0] 
[   33.891514][    C0] -> #4 (console_owner){-.-.}-{0:0}:
[   33.892384][    C0]        validate_chain+0x202/0x2c0
[   33.892957][    C0]        __lock_acquire+0x5fd/0x780
[   33.893619][    C0]        lock_acquire+0x105/0x240
[   33.894195][    C0]        console_lock_spinning_enable+0x5e/0x80
[   33.894898][    C0]        console_emit_next_record+0x12d/0x200
[   33.895636][    C0]        console_flush_all+0x114/0x200
[   33.896282][    C0]        console_unlock+0x8e/0x140
[   33.896888][    C0]        vprintk_emit+0x2e2/0x380
[   33.897504][    C0]        vprintk_default+0x12/0x40
[   33.900681][    C0]        vprintk+0x5/0x40
[   33.901213][    C0]        _printk+0x50/0x80
[   33.901809][    C0]        __hrtimer_run_queues+0x78/0x140
[   33.902599][    C0]        hrtimer_run_queues+0xeb/0x140
[   33.903237][    C0]        update_process_times+0x2d/0x100
[   33.903893][    C0]        tick_nohz_handler+0x298/0x300
[   33.904522][    C0]        tick_nohz_lowres_handler+0x27/0x80
[   33.905226][    C0]        __sysvec_apic_timer_interrupt+0x110/0x1c0
[   33.906049][    C0]        sysvec_apic_timer_interrupt+0x78/0xc0
[   33.906764][    C0]        asm_sysvec_apic_timer_interrupt+0x16/0x40
[   33.907535][    C0]        kcsan_setup_watchpoint+0x374/0x3c0
[   33.908248][    C0]        plist_check_prev_next+0x20/0xc0
[   33.908908][    C0]        plist_check_list+0x3f/0x80
[   33.909507][    C0]        plist_check_head+0x25/0x40
[   33.910172][    C0]        plist_add+0x1f/0x1c0
[   33.910717][    C0]        plist_test+0x16d/0x3c0
[   33.911287][    C0]        do_one_initcall+0xb7/0x2c0
[   33.911904][    C0]        do_initcalls+0x18d/0x1c0
[   33.912536][    C0]        kernel_init_freeable+0x113/0x1c0
[   33.913215][    C0]        kernel_init+0x12/0x180
[   33.913875][    C0]        ret_from_fork+0x23/0x280
[   33.914487][    C0]        ret_from_fork_asm+0x19/0x80
[   33.915068][    C0] 
[   33.915068][    C0] -> #3 (hrtimer_bases.lock){-.-.}-{2:2}:
[   33.915865][    C0]        validate_chain+0x202/0x2c0
[   33.916436][    C0]        __lock_acquire+0x5fd/0x780
[   33.916963][    C0]        lock_acquire+0x105/0x240
[   33.917460][    C0]        _raw_spin_lock_irqsave+0x40/0x80
[   33.918144][    C0]        lock_hrtimer_base+0x17/0x40
[   33.918725][    C0]        hrtimer_start_range_ns+0x5e/0x1c0
[   33.919316][    C0]        start_dl_timer+0xa8/0xc0
[   33.919828][    C0]        enqueue_dl_entity+0x1f7/0x340
[   33.920381][    C0]        dl_server_start+0x59/0xc0
[   33.920898][    C0]        enqueue_task_fair+0x383/0x400
[   33.921454][    C0]        enqueue_task+0x37/0xc0
[   33.921986][    C0]        activate_task+0x21/0x80
[   33.922459][    C0]        ttwu_do_activate+0x6a/0x100
[   33.923096][    C0]        try_to_wake_up+0x27c/0x300
[   33.923630][    C0]        process_timeout+0x16/0x40
[   33.924150][    C0]        call_timer_fn+0x114/0x200
[   33.924655][    C0]        __run_timers+0x33d/0x380
[   33.925136][    C0]        __run_timer_base+0x49/0x80
[   33.925663][    C0]        run_timer_softirq+0x18/0x40
[   33.926087][    C0]        handle_softirqs+0x170/0x340
[   33.926530][    C0]        __irq_exit_rcu+0x40/0x100
[   33.926949][    C0]        irq_exit_rcu+0x5/0x40
[   33.927360][    C0]        sysvec_apic_timer_interrupt+0x7d/0xc0
[   33.927882][    C0]        asm_sysvec_apic_timer_interrupt+0x16/0x40
[   33.928516][    C0]        pv_native_safe_halt+0xb/0x40
[   33.929050][    C0]        default_idle+0x5/0x40
[   33.929495][    C0]        default_idle_call+0x74/0xc0
[   33.929955][    C0]        cpuidle_idle_call+0x51/0x100
[   33.930385][    C0]        do_idle+0x6a/0xc0
[   33.930740][    C0]        cpu_startup_entry+0x18/0x40
[   33.931178][    C0]        rest_init+0x1d1/0x200
[   33.931562][    C0]        start_kernel+0x585/0x5c0
[   33.932006][    C0]        x86_64_start_reservations+0x20/0x40
[   33.932549][    C0]        x86_64_start_kernel+0x11c/0x140
[   33.933000][    C0]        common_startup_64+0xbd/0xe8
[   33.933400][    C0] 
[   33.933400][    C0] -> #2 (&rq->__lock){-.-.}-{2:2}:
[   33.933909][    C0]        validate_chain+0x202/0x2c0
[   33.934271][    C0]        __lock_acquire+0x5fd/0x780
[   33.934636][    C0]        lock_acquire+0x105/0x240
[   33.934971][    C0]        _raw_spin_lock_nested+0x35/0x80
[   33.935343][    C0]        raw_spin_rq_lock_nested+0x22/0x40
[   33.935742][    C0]        ___task_rq_lock+0x36/0x80
[   33.936155][    C0]        wake_up_new_task+0x5b/0x140
[   33.936582][    C0]        kernel_clone+0x29a/0x380
[   33.936989][    C0]        user_mode_thread+0x90/0xc0
[   33.937395][    C0]        rest_init+0x1c/0x200
[   33.937748][    C0]        start_kernel+0x585/0x5c0
[   33.938081][    C0]        x86_64_start_reservations+0x20/0x40
[   33.938488][    C0]        x86_64_start_kernel+0x11c/0x140
[   33.938877][    C0]        common_startup_64+0xbd/0xe8
[   33.939227][    C0] 
[   33.939227][    C0] -> #1 (&p->pi_lock){-.-.}-{2:2}:
[   33.939734][    C0]        validate_chain+0x202/0x2c0
[   33.940118][    C0]        __lock_acquire+0x5fd/0x780
[   33.940533][    C0]        lock_acquire+0x105/0x240
[   33.940948][    C0]        _raw_spin_lock_irqsave+0x40/0x80
[   33.941389][    C0]        try_to_wake_up+0xa0/0x300
[   33.941769][    C0]        pollwake+0x9a/0x100
[   33.942081][    C0]        __wake_up_common+0x6c/0xc0
[   33.942453][    C0]        __wake_up_common_lock+0x39/0x80
[   33.942838][    C0]        pty_close+0x1a1/0x280
[   33.943160][    C0]        tty_release+0x1ee/0x640
[   33.943487][    C0]        __fput+0x272/0x400
[   33.943790][    C0]        ____fput+0x9/0x40
[   33.944136][    C0]        task_work_run+0xea/0x140
[   33.944545][    C0]        do_exit+0x499/0x580
[   33.944921][    C0]        do_group_exit+0x10c/0x140
[   33.945341][    C0]        __x64_sys_exit_group+0x1c/0x40
[   33.945793][    C0]        x64_sys_call+0x16f7/0x1b40
[   33.946136][    C0]        do_syscall_64+0x168/0x13c0
[   33.946481][    C0]        entry_SYSCALL_64_after_hwframe+0x75/0x7d
[   33.946899][    C0] 
[   33.946899][    C0] -> #0 (&tty->write_wait){-...}-{3:3}:
[   33.947419][    C0]        check_noncircular+0xa9/0xc0
[   33.947787][    C0]        check_prev_add+0xec/0x300
[   33.948179][    C0]        validate_chain+0x202/0x2c0
[   33.948598][    C0]        __lock_acquire+0x5fd/0x780
[   33.949011][    C0]        lock_acquire+0x105/0x240
[   33.949397][    C0]        _raw_spin_lock_irqsave+0x40/0x80
[   33.949807][    C0]        __wake_up_common_lock+0x20/0x80
[   33.950196][    C0]        tty_wakeup+0x8e/0xc0
[   33.950506][    C0]        tty_port_default_wakeup+0x1e/0x40
[   33.950890][    C0]        tty_port_tty_wakeup+0x2c/0x40
[   33.951268][    C0]        uart_write_wakeup+0x24/0x40
[   33.951612][    C0]        serial8250_tx_chars+0x21b/0x340
[   33.952029][    C0]        serial8250_handle_irq+0x14e/0x200
[   33.952496][    C0]        serial8250_default_handle_irq+0x1a/0x40
[   33.953008][    C0]        serial8250_interrupt+0x63/0x100
[   33.953436][    C0]        __handle_irq_event_percpu+0x13c/0x380
[   33.953880][    C0]        handle_irq_event_percpu+0xa/0x40
[   33.954268][    C0]        handle_irq_event+0x70/0xc0
[   33.954624][    C0]        handle_edge_irq+0xe7/0x140
[   33.954973][    C0]        __common_interrupt+0xe7/0x180
[   33.955348][    C0]        common_interrupt+0x8e/0xc0
[   33.955692][    C0]        asm_common_interrupt+0x22/0x40
[   33.956087][    C0]        _raw_spin_unlock_irqrestore+0x2f/0x80
[   33.956586][    C0]        uart_port_unlock_irqrestore+0x20/0x40
[   33.957086][    C0]        uart_port_unlock_deref+0xf/0x40
[   33.957511][    C0]        uart_write+0xac/0xc0
[   33.957871][    C0]        process_output_block+0x229/0x280
[   33.958267][    C0]        n_tty_write+0x172/0x400
[   33.958596][    C0]        iterate_tty_write+0x1ce/0x280
[   33.958970][    C0]        file_tty_write+0x120/0x140
[   33.959350][    C0]        tty_write+0x1a/0x40
[   33.959655][    C0]        vfs_write+0x1bd/0x240
[   33.959991][    C0]        ksys_write+0x8d/0x100
[   33.960401][    C0]        __x64_sys_write+0x38/0x80
[   33.960845][    C0]        x64_sys_call+0x10e4/0x1b40
[   33.961278][    C0]        do_syscall_64+0x168/0x13c0
[   33.961667][    C0]        entry_SYSCALL_64_after_hwframe+0x75/0x7d
[   33.962108][    C0] 
[   33.962108][    C0] other info that might help us debug this:
[   33.962108][    C0] 
[   33.962759][    C0] Chain exists of:
[   33.962759][    C0]   &tty->write_wait --> console_owner --> &port_lock_key
[   33.962759][    C0] 
[   33.963599][    C0]  Possible unsafe locking scenario:
[   33.963599][    C0] 
[   33.964128][    C0]        CPU0                    CPU1
[   33.964561][    C0]        ----                    ----
[   33.964982][    C0]   lock(&port_lock_key);
[   33.965334][    C0]                                lock(console_owner);
[   33.965825][    C0]                                lock(&port_lock_key);
[   33.966271][    C0]   lock(&tty->write_wait);
[   33.966590][    C0] 
[   33.966590][    C0]  *** DEADLOCK ***
[   33.966590][    C0] 
[   33.967113][    C0] 6 locks held by lkp-setup-rootf/57:
[   33.967462][    C0]  #0: ffff9a71009b9d60 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x26/0x40
[   33.968137][    C0]  #1: ffff9a71009b9ef0 (&tty->atomic_write_lock){+.+.}-{4:4}, at: tty_write_lock+0x15/0x80
[   33.969010][    C0]  #2: ffff9a71009b99b0 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9c/0x400
[   33.976613][    C0]  #3: ffffa6e8c0c33388 (&ldata->output_lock){+.+.}-{4:4}, at: process_output_block+0x3e/0x280
[   33.977944][    C0]  #4: ffff9a7100146cb0 (&i->lock){-...}-{3:3}, at: serial8250_interrupt+0x26/0x100
[   33.979050][    C0]  #5: ffffffffa970b578 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave+0xf/0x40
[   33.980234][    C0] 
[   33.980234][    C0] stack backtrace:
[   33.980860][    C0] CPU: 0 UID: 0 PID: 57 Comm: lkp-setup-rootf Tainted: G        W       T   6.19.0-10451-g3f30076c1d27 #1 PREEMPT 
[   33.982261][    C0] Tainted: [W]=WARN, [T]=RANDSTRUCT
[   33.982840][    C0] Call Trace:
[   33.983196][    C0]  <IRQ>
[   33.983548][    C0]  dump_stack_lvl+0x3e/0x80
[   33.984133][    C0]  dump_stack+0xc/0x40
[   33.984629][    C0]  print_circular_bug+0xb4/0x100
[   33.985253][    C0]  check_noncircular+0xa9/0xc0
[   33.985882][    C0]  ? add_chain_block+0x8c/0x100
[   33.986499][    C0]  check_prev_add+0xec/0x300
[   33.987071][    C0]  validate_chain+0x202/0x2c0
[   33.987649][    C0]  __lock_acquire+0x5fd/0x780
[   33.988214][    C0]  ? __wake_up_common_lock+0x20/0x80
[   33.988829][    C0]  lock_acquire+0x105/0x240
[   33.989384][    C0]  ? __wake_up_common_lock+0x20/0x80
[   33.990089][    C0]  ? lock_acquire+0x105/0x240
[   33.990663][    C0]  ? tty_port_tty_get+0x54/0x80
[   33.991263][    C0]  _raw_spin_lock_irqsave+0x40/0x80
[   33.991897][    C0]  ? __wake_up_common_lock+0x20/0x80
[   33.992550][    C0]  __wake_up_common_lock+0x20/0x80
[   33.993188][    C0]  tty_wakeup+0x8e/0xc0
[   33.993763][    C0]  tty_port_default_wakeup+0x1e/0x40
[   33.994400][    C0]  tty_port_tty_wakeup+0x2c/0x40
[   33.994990][    C0]  uart_write_wakeup+0x24/0x40
[   33.995560][    C0]  serial8250_tx_chars+0x21b/0x340
[   33.996221][    C0]  serial8250_handle_irq+0x14e/0x200
[   33.996870][    C0]  serial8250_default_handle_irq+0x1a/0x40
[   33.997631][    C0]  serial8250_interrupt+0x63/0x100
[   33.998288][    C0]  ? __pfx_serial8250_interrupt+0x40/0x40
[   33.998949][    C0]  __handle_irq_event_percpu+0x13c/0x380
[   33.999643][    C0]  ? handle_irq_event+0x68/0xc0
[   34.000246][    C0]  handle_irq_event_percpu+0xa/0x40
[   34.000858][    C0]  handle_irq_event+0x70/0xc0
[   34.001424][    C0]  handle_edge_irq+0xe7/0x140
[   34.002040][    C0]  __common_interrupt+0xe7/0x180
[   34.002618][    C0]  common_interrupt+0x8e/0xc0
[   34.003166][    C0]  </IRQ>
[   34.003510][    C0]  <TASK>
[   34.003897][    C0]  asm_common_interrupt+0x22/0x40
[   34.004488][    C0] RIP: 0010:_raw_spin_unlock_irqrestore+0x2f/0x80
[   34.005210][    C0] Code: 48 89 fb 48 8b 74 24 10 48 83 c7 18 e8 6a 73 f1 fe 48 89 df e8 62 bb f1 fe 0f ba e5 09 73 06 e8 57 fb 02 ff fb bf 01 00 00 00 <e8> 0c 9d ec fe 48 c7 c7 20 c0 81 a7 e8 00 d3 14 ff 83 3d 59 6e d6
[   34.007409][    C0] RSP: 0018:ffffa6e8c0c0fc08 EFLAGS: 00000206
[   34.008112][    C0] RAX: 0000000000003922 RBX: ffffffffa970b560 RCX: 0000000080000001
[   34.008999][    C0] RDX: 0000000000000040 RSI: ffffffffa766155a RDI: 0000000000000001
[   34.009931][    C0] RBP: 0000000000000286 R08: ffffffffa95a9860 R09: 0000000000000000
[   34.010814][    C0] R10: 0001ffffa7deddc0 R11: 0001ffffffffffff R12: ffffffffa970b560
[   34.011696][    C0] R13: 0000000000000040 R14: 0000000000000286 R15: ffff9a71029d8000
[   34.012682][    C0]  ? _raw_spin_unlock_irqrestore+0x29/0x80
[   34.013366][    C0]  uart_port_unlock_irqrestore+0x20/0x40
[   34.014078][    C0]  uart_port_unlock_deref+0xf/0x40
[   34.014672][    C0]  uart_write+0xac/0xc0
[   34.015172][    C0]  process_output_block+0x229/0x280
[   34.015796][    C0]  n_tty_write+0x172/0x400
[   34.016316][    C0]  ? __pfx_woken_wake_function+0x40/0x40
[   34.016962][    C0]  iterate_tty_write+0x1ce/0x280
[   34.017656][    C0]  ? __pfx_n_tty_write+0x40/0x40
[   34.018094][    C0]  file_tty_write+0x120/0x140
[   34.018545][    C0]  ? tty_write+0xe/0x40
[   34.019010][    C0]  ? __pfx_tty_write+0x40/0x40
[   34.019426][    C0]  tty_write+0x1a/0x40
[   34.019816][    C0]  vfs_write+0x1bd/0x240
[   34.020298][    C0]  ksys_write+0x8d/0x100
[   34.020822][    C0]  __x64_sys_write+0x38/0x80
[   34.021411][    C0]  x64_sys_call+0x10e4/0x1b40
[   34.022087][    C0]  do_syscall_64+0x168/0x13c0
[   34.022649][    C0]  entry_SYSCALL_64_after_hwframe+0x75/0x7d
[   34.023333][    C0] RIP: 0033:0x7f183e443100
[   34.023996][    C0] Code: 73 01 c3 48 8b 0d 40 0d 2d 00 31 d2 48 29 c2 64 89 11 48 83 c8 ff eb ea 90 90 83 3d dd 70 2d 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 de b0 01 00 48 89 04 24
[   34.025514][    C0] RSP: 002b:00007ffe98b9a688 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   34.026085][    C0] RAX: ffffffffffffffda RBX: 0000000000000041 RCX: 00007f183e443100
[   34.026597][    C0] RDX: 0000000000000041 RSI: 0000000023196808 RDI: 0000000000000001
[   34.027113][    C0] RBP: 0000000023196808 R08: 000000000000000a R09: 00007f183ed5b700
[   34.027618][    C0] R10: 6465696669636570 R11: 0000000000000246 R12: 00007f183e715260
[   34.028182][    C0] R13: 0000000000000041 R14: 0000000000000000 R15: 000000002327bb08
[   34.028826][    C0]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260218/202602181128.ac178dea-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


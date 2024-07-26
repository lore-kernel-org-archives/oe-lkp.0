Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3CA2F50A
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jul 2024 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721980617; cv=fail; b=YMZDVS14CmP3yUZQIWu2GWBXrvfsnTfJe2gQVpu9CjC2a1eewT8Wp/DIyO83tjzca9G6IERzwYPk8ERaBImFnVaJ4bViTfl8ki4yHovmbkaxIxtQYW8dSheCV8aJAt7HaidNmD+7uCPV9hiqded8tsMee84TDRdkvSmmKYDjnyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721980617; c=relaxed/simple;
	bh=w3c9KH+1WH7WLOaHka17v2ZDlvfAVPFAIYRt5uvtI6c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Y9RoN1MnI2HxfzpT7mcjcCyZNbHSxIJtmW34K4KvFt6XYr7wlDPyt9Xy7o1B3hywd1YUSHdjlRjOQTduA//jcIcDJ2VMDaDxHu1LweKdGnsyoNVU+FPdEErhL5If9/bwi/WMbnBpWVvgGM/ZoHbiZJefEqGVsa/CtxnibJPO030=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD7ZIhjL; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD7ZIhjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721980615; x=1753516615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3c9KH+1WH7WLOaHka17v2ZDlvfAVPFAIYRt5uvtI6c=;
  b=ZD7ZIhjLjLWNkwL/UpPi1TL8P5bvbkRkAmbUwqjWmCwKJXyAL9hswZAi
   ZA/DnvgwTcz2GspM2O13KBGxj6wWcZdnMn+BmS5aXdC2iXpkk3eJPu8WK
   ezs72mtpM7sN9b8MfTIqHnitbrPPeO8S9JIYHRy1c1zMLb5qvejvGfyQw
   wfyCoeWgMtAq4iTRQ55xWz2EACQxmzX7/LMO0fDd9C69HlJsxTuTEfnYB
   +RJg4lFuo6cySRJDBLTLVyIH1TjLfreFdtLl/7P6GJqIGhe1ntpHjJD1I
   kefCXEyf19EaFY7Sd7v27GHO6miL5FK+BPD5RtGbjhys0e+FOH30NzVv1
   Q==;
X-CSE-ConnectionGUID: dnhwlMyrTgeNIF/tMIOyWA==
X-CSE-MsgGUID: SlWxR3NZSBSSDdNW80wvKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19916247"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19916247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 00:56:37 -0700
X-CSE-ConnectionGUID: liw3Y1OXQHyXQ0Rj2/mzjg==
X-CSE-MsgGUID: DHbyYf8aSMOkQqibS0YdnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="57775690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Jul 2024 00:56:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 00:56:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 00:56:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 00:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6XueCM2uhn4OieLNhjfaaijQ/lofpibxyMcrtBPeZdbgI/X+X3Unjtv4qQ0rHcYdnWPcS7agrEOW86YBP43HnPmspTvPQuNZXwZzh33N5fTy1xyUGfXNc0kUH2y1hE3chselVfFd89wweEjV8+tYd9PqNs33d90qXxnaL4G0s34MrtQlQsbTXoGz5RIqgfRnZgaZreMKcFMbtLwaKsrgAyoBJbz/5lnpuBVy2Sk9VJcwsc7BJquhrN6Iw2UdVpgezZslo/FoymntIk6C7WoIV0L26il56vRivWjEvbpo9ULSptqF7ErrXGzHcx09ascaIpq1iGCbXjlR+lrl5SS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYSNMopJ6y8znREw4Gpl8hd+J6/wQDu1pYyspLeMANc=;
 b=lwRPQzQ3sEGccQBnDU3/4pdNXMGmw3N7CzYlYtJJhrB6W2HQqotTBKniWQfFmocaeRWfFwXTm5eAn79yzrsGooZHGaIm1cRRrIemOQ/E18N4ufwxk0AgkHcXbg1RfO5YPf1ZA3PkKPPaDB7DJewvMbIXcDDupj5Aq7K0K9tJoHYg30SocDSps7+Mzvr2ycOkeX8W80V47iYAdol7KKT5WA575kHW3Rhqq+2UGU2foiHOB7q24o457fZJ8j/tid/lamT7JSCgW2hVcbGRgTLqUe91SbA23Olmc13fZgPGq8snZ2svjbX75tJkDxQiGFRGpJuRpNvJYMN7mPolJv45ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 07:56:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 07:56:27 +0000
Date: Fri, 26 Jul 2024 15:56:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [chrome-os:chromeos-6.1] [FROMLIST]  b0b32be302:
 WARNING:bad_unlock_balance_detected
Message-ID: <202407261541.24455f54-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: a0512bf8-4fae-4a56-1632-08dcad4873d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QvGuy3tgncEHruGJr72MBtjXm0msL9IMi4J0J8dCMnOa1Vwg5hO5dvnyZhb+?=
 =?us-ascii?Q?/9MMY5i1XTQy7p5B17A5IkSVf8Fam52xRibfadN2NY2f5qoqaxZfYHSwxyTv?=
 =?us-ascii?Q?3S3zWUpkhA2bpE3My3J++H0Xl7Nr/++bF87MKbyWt3nkRjGBZXwZaiPa0coM?=
 =?us-ascii?Q?1HccgiAvB2Unylhb802WKaHschF4YideXc4S++OBuaAQyqEPZQs1+772ESbV?=
 =?us-ascii?Q?KPZrH1HxhSjzKtzPH/dNLJpckNOgL0BASL5javJYCiPkOcYwjBO03IVif8Zp?=
 =?us-ascii?Q?S7bmFRJMt0ihfOrm9KPZUd5KDHwYkbJqFgJCnPbbtjGBe++MpZxRGfqnRTHt?=
 =?us-ascii?Q?py0fTCdMBcd1a+USJCoSvk05kDNfiU41bY9aU+JD8Hpg9Lddz8WZGl9p7M37?=
 =?us-ascii?Q?4HWsXI7lBgoZNUDDGIou3B2WzenXQPWYKWjYD/u8Q+v9TJ1DHnwVRM7izHAn?=
 =?us-ascii?Q?U3fhXpM1nb695hIrX1hCfhzaQOMDO3iCOJm5KEhWbWqyfa89qQEWp+/vILGj?=
 =?us-ascii?Q?LIJmGjvMyCR9bi+Ni1YBc4o40nz8QJ2COtUbW33I25eCisYuOcPBArkt1IkB?=
 =?us-ascii?Q?HbCqGUj30umup03x6wSHRI7omXWBhevEd92ojXvBnZdYRxHVnTJKrvCgxZq6?=
 =?us-ascii?Q?s8QUw8e4kgQvpELtSEhO7bu8V66IjF4fbQ7HP3x84a5WnVVCPFppFFcmvO2J?=
 =?us-ascii?Q?XAJGQtPMjJFR+u5fcqsGYYSpTqLvB8yL4sqb/W1XQda9pu2nBHARlPx1Lncg?=
 =?us-ascii?Q?MRiofUKFQd1n2j3pH+TBquMgUovkSAYqDjoE7bwvSxCORhrddL77crrS9pqM?=
 =?us-ascii?Q?OJ1MTQ3/uvIjkzCF/P9L92VHN/MGKke6eRLUoPaDtrvVAYpEc/Q7iNiMttvm?=
 =?us-ascii?Q?jN8niKe7+5iOzGwx76CXeewztkXFSF10dOmtGVlha6eNdHd1hFPAn8nsEf+U?=
 =?us-ascii?Q?LiAvtxefYB4GdcKM5PBo0EvzayXJ2Xx8gEJiYeZuTYcNxMGBajbtaR8zZj/J?=
 =?us-ascii?Q?mumXJEoPb/+h5Nsdowe7itSyDa0ZE8P7E+qamwStPIRcYscQqCO/aigeC8kV?=
 =?us-ascii?Q?pouk8HkW6Ieu7kHhR0Dmp+AcJ3TvOEJq6CiP/Ob/lawl3QKC+R3m3iy5oZo4?=
 =?us-ascii?Q?3E5S6uP7rtF0QrpGZw66n9oeDFH7ntU+jtGwN29yFU1a1AbGIhIXYL9B2TZr?=
 =?us-ascii?Q?Dq7nsnNMVewkU8Gco64msIiNwT/W0UBYRvFyxD1qnoYuw1/AgKrkASYf198b?=
 =?us-ascii?Q?Fs8qoxY0Due1R4wUky6g77bD4T0aV6UNNXQh4ThPA77GIRYKtwAPSvpWLO1a?=
 =?us-ascii?Q?xu6fDWRE/3qvJ0oQ7UiaCYPP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MrwddTdCcwvEPBNW2JEh2zo9QRVHLa1WLVYrIdYYwqn769D+z48znpoDHLqd?=
 =?us-ascii?Q?4xuuEch/DtErRrZMsvQ0Dw8AZWKbHNcxIMmWV/f7kgczTArjJ1hR9XLCZU1P?=
 =?us-ascii?Q?0WA3X82WmSlJiEGfVbiUl/y3of89H/0fgENga3oebMeRUsyPpd4Isw/X1M3M?=
 =?us-ascii?Q?sU4+af2SxNhzA0VAiR3LjtjIeXrBMY3R1sEWir/x8fHHB6etv6xUBPEV6cyF?=
 =?us-ascii?Q?LnPsqvN3JAiRRcoyqTZJuiTr1Y5V/maJQfyHbatxlaXSWP3/d0n2hSzJUoUl?=
 =?us-ascii?Q?0Wp4s9JtcjnlhO9+dW84bwaN8JjUfcwPG30kLTFVYTt+4G5ri3ffW3n3Z4lZ?=
 =?us-ascii?Q?DyTtvS7SuEMVI8Rnmy/dNmaRBDvv5O8nAqLErdNDH/TSZYIp46z/13m2/aKc?=
 =?us-ascii?Q?ikngYnZcyuHHjobkJLy9nIKiLUdgvk5iJRTF0LiBZl1NukZr7jUao4dL5Ric?=
 =?us-ascii?Q?gwxmwfbM/UL2t02CrgamG3lNdrK5YLcu1J5HIXsmyk9Wbt/tnXL0Y6wVR25z?=
 =?us-ascii?Q?fkYrvo/FuoTtYSOAI+AdAeL3qQ9zQoxApGkOEanoQR8efNCIZgQL8x5uwK21?=
 =?us-ascii?Q?TXAryxZGuyCOaiYYeCLcejOMyeHuH4PkpUaZgIQnkO6A6xZmeBsOyoNR0yUP?=
 =?us-ascii?Q?BcIodb3YyQBSwBRW5wvBJY+C3vYS7sRatIh4e6zVe7nScoLmIYi8CFKnYePL?=
 =?us-ascii?Q?gBEeXZnudOS+j60ZX2gcQ/jk2fUuFAXqJk2PZd7ZijN1hUfZz20VSetxMqtD?=
 =?us-ascii?Q?hw/6L1jXqzbPzR9DH1/501tTCEGM4PDAOhbyB/OXrQJfNOcbaDqtDsclHTO6?=
 =?us-ascii?Q?GfUHG35zv6yGSgECYCuGOdhmBGYpUUe8e4rXSH9qWI5ASFwPg6HMvtEi/R+g?=
 =?us-ascii?Q?y5fmMexMuvB8e7CGGd1om4RdDGKRuwCQB2DFIXldKKiRRK4/H4WdU1jNBHpJ?=
 =?us-ascii?Q?IPjzpa8jmOnNTeLyVxOREfTg7ExrHLRtb/o61tYPpIXqg9qnIfXqvjPXxO5R?=
 =?us-ascii?Q?8qAMpeaDonVN5Ph80x6wjxakPIRkPxqkHceBJLEEGTcfgD3tc1YBt2xwLHyD?=
 =?us-ascii?Q?Bo0WZgkjijDjXWPtN/X1i172GAk6Vc4Ko1Ucw6BnDu06qe0G4E7Y6VF/z0Vi?=
 =?us-ascii?Q?s9sgjK0whD2jG+yH9VjwxJMx+qA1OMrYUDduZNkYjg9RXMMXYVpsGhlpBraU?=
 =?us-ascii?Q?I/+PT4XSFIgnbZ1krWtNyzWup7dEGN2rKe3yIjJoUMZCn9+S0+0llYcIPmPH?=
 =?us-ascii?Q?+JLrDeJwwLiBn69zly6qwwzrRVLcI+m//sUhp8gTYnDasiEU/kp0JkiObwpR?=
 =?us-ascii?Q?lh3PqkPRBabT1xki204DmUYO6rLGjYI8KLkVvGjY/XAraC9J5dAPR81bP18+?=
 =?us-ascii?Q?XSyL0Mh/YxnwI0xbylivC0MPi4CY2hJBTv0I3L316BXD67ZFUSbn6b/MNqLF?=
 =?us-ascii?Q?riTEz4QzpMP6GKUHvTxXjwo6EVhyMyUrV1sS713BhKuZtaBSjMaODFPx8A06?=
 =?us-ascii?Q?hjlkQlIaMMdi5oxSToQjCbBaO616DwWVvyu1ZR1y8wZCkmc7ZvPAGtlskVN/?=
 =?us-ascii?Q?pZLcEnJo2gXIV5KQsDqhv69cCoZV9CVZAiI7Vu42rrYI4nrWhvlahdnDaZke?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0512bf8-4fae-4a56-1632-08dcad4873d8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 07:56:27.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BHFlCWbNqPpDLo8c9ce3ju6uLCq3FIioddchhQIiBLLI/PIr8Dw8dG91e9b3uH9u07uGAVdrpDKJKP1lHIAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:bad_unlock_balance_detected" on:

commit: b0b32be302dbb7b522082e7b1fb466a9f28fdbf9 ("FROMLIST: drm/vkms: Back VKMS with DRM memory management instead of static objects")
https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1

in testcase: boot

compiler: gcc-7
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------+------------+------------+
|                                                      | da61910bb2 | b0b32be302 |
+------------------------------------------------------+------------+------------+
| WARNING:bad_unlock_balance_detected                  | 0          | 6          |
| is_trying_to_release_lock(&vkms_out->enabled_lock)at | 0          | 6          |
+------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407261541.24455f54-oliver.sang@intel.com


[   10.604358][    C0] WARNING: bad unlock balance detected!
[   10.604846][    C0] 6.1.49-05307-gb0b32be302db #1 Not tainted
[   10.605356][    C0] -------------------------------------
[   10.605831][    C0] sed/249 is trying to release lock (&vkms_out->enabled_lock) at:
[ 10.606507][ C0] vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[   10.607069][    C0] but there are no more locks to release!
[   10.607558][    C0]
[   10.607558][    C0] other info that might help us debug this:
[   10.608244][    C0] 1 lock held by sed/249:
[ 10.608631][ C0] #0: ca47dcf0 (&mm->mmap_lock){++++}-{3:3}, at: lock_mm_and_find_vma (include/linux/mmap_lock.h:136 mm/memory.c:5273 mm/memory.c:5335) 
[   10.609429][    C0]
[   10.609429][    C0] stack backtrace:
[   10.609937][    C0] CPU: 0 PID: 249 Comm: sed Not tainted 6.1.49-05307-gb0b32be302db #1
[   10.610635][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   10.611521][    C0] Call Trace:
[ 10.611813][ C0] dump_stack_lvl (lib/dump_stack.c:107) 
[ 10.612211][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 10.612685][ C0] dump_stack (lib/dump_stack.c:114) 
[ 10.613037][ C0] print_unlock_imbalance_bug (kernel/locking/lockdep.c:5109) 
[ 10.613514][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 10.613968][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 10.614432][ C0] lock_release (kernel/locking/lockdep.c:5346 kernel/locking/lockdep.c:5689) 
[ 10.614824][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 10.615279][ C0] __mutex_unlock_slowpath (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-long.h:523 include/linux/atomic/atomic-instrumented.h:1266 kernel/locking/mutex.c:916) 
[ 10.615743][ C0] mutex_unlock (kernel/locking/mutex.c:544) 
[ 10.616117][ C0] vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 10.616566][ C0] ? vkms_disable_vblank (drivers/gpu/drm/vkms/vkms_crtc.c:13) 
[ 10.617007][ C0] __hrtimer_run_queues+0x4a/0x260 
[ 10.617545][ C0] hrtimer_run_queues (kernel/time/hrtimer.c:1925) 
[ 10.617972][ C0] update_process_times (kernel/time/timer.c:2049 kernel/time/timer.c:2070) 
[ 10.618404][ C0] tick_nohz_handler (kernel/time/tick-sched.c:255 kernel/time/tick-sched.c:1387) 
[ 10.618825][ C0] ? sysvec_hyperv_stimer0 (arch/x86/kernel/apic/apic.c:1106) 
[ 10.619280][ C0] __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1095 include/linux/jump_label.h:207 arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/kernel/apic/apic.c:1113) 
[ 10.619784][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1106) 
[ 10.620267][ C0] handle_exception (arch/x86/entry/entry_32.S:1076) 
[ 10.620699][ C0] EIP: native_flush_tlb_one_user (arch/x86/include/asm/cpufeature.h:176 arch/x86/mm/tlb.c:1126) 
[ 10.621204][ C0] Code: c3 00 10 00 00 e8 bb ff ff ff 39 5e 08 77 ee 5b 5e 5d c3 66 90 3e 8d 74 26 00 55 89 e5 83 ec 10 66 8b 15 08 ac d5 c3 0f 01 38 <eb> 3a 8d 76 00 8b 0d e0 f4 d8 c3 81 e1 80 00 00 00 74 29 66 81 fa
All code
========
   0:	c3                   	retq   
   1:	00 10                	add    %dl,(%rax)
   3:	00 00                	add    %al,(%rax)
   5:	e8 bb ff ff ff       	callq  0xffffffffffffffc5
   a:	39 5e 08             	cmp    %ebx,0x8(%rsi)
   d:	77 ee                	ja     0xfffffffffffffffd
   f:	5b                   	pop    %rbx
  10:	5e                   	pop    %rsi
  11:	5d                   	pop    %rbp
  12:	c3                   	retq   
  13:	66 90                	xchg   %ax,%ax
  15:	3e 8d 74 26 00       	lea    %ds:0x0(%rsi,%riz,1),%esi
  1a:	55                   	push   %rbp
  1b:	89 e5                	mov    %esp,%ebp
  1d:	83 ec 10             	sub    $0x10,%esp
  20:	66 8b 15 08 ac d5 c3 	mov    -0x3c2a53f8(%rip),%dx        # 0xffffffffc3d5ac2f
  27:	0f 01 38             	invlpg (%rax)
  2a:*	eb 3a                	jmp    0x66		<-- trapping instruction
  2c:	8d 76 00             	lea    0x0(%rsi),%esi
  2f:	8b 0d e0 f4 d8 c3    	mov    -0x3c270b20(%rip),%ecx        # 0xffffffffc3d8f515
  35:	81 e1 80 00 00 00    	and    $0x80,%ecx
  3b:	74 29                	je     0x66
  3d:	66                   	data16
  3e:	81                   	.byte 0x81
  3f:	fa                   	cli    

Code starting with the faulting instruction
===========================================
   0:	eb 3a                	jmp    0x3c
   2:	8d 76 00             	lea    0x0(%rsi),%esi
   5:	8b 0d e0 f4 d8 c3    	mov    -0x3c270b20(%rip),%ecx        # 0xffffffffc3d8f4eb
   b:	81 e1 80 00 00 00    	and    $0x80,%ecx
  11:	74 29                	je     0x3c
  13:	66                   	data16
  14:	81                   	.byte 0x81
  15:	fa                   	cli    
[   10.622864][    C0] EAX: fffba000 EBX: fffba000 ECX: fffba000 EDX: c3f20000
[   10.623469][    C0] ESI: ec3fcdc0 EDI: fffbb000 EBP: ca47fddc ESP: ca47fdcc
[   10.624074][    C0] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000286
[ 10.624740][ C0] ? sysvec_hyperv_stimer0 (arch/x86/kernel/apic/apic.c:1106) 
[ 10.625197][ C0] ? sysvec_hyperv_stimer0 (arch/x86/kernel/apic/apic.c:1106) 
[ 10.625652][ C0] ? native_flush_tlb_one_user (arch/x86/include/asm/cpufeature.h:176 arch/x86/mm/tlb.c:1126) 
[ 10.626135][ C0] ? __kmap_local_pfn_prot (mm/highmem.c:551) 
[ 10.626596][ C0] flush_tlb_one_kernel (arch/x86/include/asm/paravirt.h:81 arch/x86/mm/tlb.c:1141 arch/x86/mm/tlb.c:1103) 
[ 10.627024][ C0] kunmap_local_indexed (arch/x86/include/asm/current.h:15 (discriminator 3) mm/highmem.c:615 (discriminator 3)) 
[ 10.627458][ C0] prep_new_page (mm/page_alloc.c:1397 mm/page_alloc.c:2529 mm/page_alloc.c:2541) 
[ 10.627851][ C0] get_page_from_freelist (mm/page_alloc.c:4299) 
[ 10.628331][ C0] __alloc_pages (mm/page_alloc.c:5564) 
[ 10.628741][ C0] __folio_alloc (mm/page_alloc.c:5598) 
[ 10.629127][ C0] handle_mm_fault (include/linux/gfp.h:246 include/linux/gfp.h:275 include/linux/gfp.h:284 mm/memory.c:4141 mm/memory.c:4980 mm/memory.c:5124 mm/memory.c:5245) 
[ 10.629541][ C0] do_user_addr_fault (include/linux/sched/signal.h:433 arch/x86/mm/fault.c:1382) 
[ 10.629976][ C0] exc_page_fault (arch/x86/include/asm/irqflags.h:29 arch/x86/include/asm/irqflags.h:70 arch/x86/include/asm/irqflags.h:130 arch/x86/mm/fault.c:1479 arch/x86/mm/fault.c:1527) 
[ 10.630375][ C0] ? paravirt_BUG (arch/x86/mm/fault.c:1484) 
[ 10.630765][ C0] handle_exception (arch/x86/entry/entry_32.S:1076) 
[   10.631186][    C0] EIP: 0xb7d8293e
[ 10.631501][ C0] Code: 04 00 00 89 4c 24 60 2b 4c 24 38 01 f2 39 c7 89 57 30 8b 7c 24 38 0f 95 c0 0f b6 c0 83 c9 01 c1 e0 02 83 cf 01 09 c7 89 7e 04 <89> 4a 04 e9 f1 fc ff ff 89 4c 24 60 8b 8b 04 ff ff ff 8b 6c 24 38
All code
========
   0:	04 00                	add    $0x0,%al
   2:	00 89 4c 24 60 2b    	add    %cl,0x2b60244c(%rcx)
   8:	4c 24 38             	rex.WR and $0x38,%al
   b:	01 f2                	add    %esi,%edx
   d:	39 c7                	cmp    %eax,%edi
   f:	89 57 30             	mov    %edx,0x30(%rdi)
  12:	8b 7c 24 38          	mov    0x38(%rsp),%edi
  16:	0f 95 c0             	setne  %al
  19:	0f b6 c0             	movzbl %al,%eax
  1c:	83 c9 01             	or     $0x1,%ecx
  1f:	c1 e0 02             	shl    $0x2,%eax
  22:	83 cf 01             	or     $0x1,%edi
  25:	09 c7                	or     %eax,%edi
  27:	89 7e 04             	mov    %edi,0x4(%rsi)
  2a:*	89 4a 04             	mov    %ecx,0x4(%rdx)		<-- trapping instruction
  2d:	e9 f1 fc ff ff       	jmpq   0xfffffffffffffd23
  32:	89 4c 24 60          	mov    %ecx,0x60(%rsp)
  36:	8b 8b 04 ff ff ff    	mov    -0xfc(%rbx),%ecx
  3c:	8b 6c 24 38          	mov    0x38(%rsp),%ebp

Code starting with the faulting instruction
===========================================
   0:	89 4a 04             	mov    %ecx,0x4(%rdx)
   3:	e9 f1 fc ff ff       	jmpq   0xfffffffffffffcf9
   8:	89 4c 24 60          	mov    %ecx,0x60(%rsp)
   c:	8b 8b 04 ff ff ff    	mov    -0xfc(%rbx),%ecx
  12:	8b 6c 24 38          	mov    0x38(%rsp),%ebp


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240726/202407261541.24455f54-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


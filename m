Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4F38B130
	for <oe-lkp@lists.linux.dev>; Wed, 13 May 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656116; cv=fail; b=kFdBqoXhYXegKLuSvFehjS/2Zttej6hWryKIRQ+mFYDrund+xxZIeZaU5rvT22yLycHGw9rL0KKJyaKBrYE3C98pHkl76cYBkczIWSzGymnQ3tRfw2/Pf05wtskzWkPQgZFa1fCrizLKhjCqq/uvvKZ8rt7XjFxzo0BsufBT+ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656116; c=relaxed/simple;
	bh=GJMJJyPgwwoNw1RfaBYhtZyTx8oMd/kurVnK3R2dRn8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GVmoXonyS18SrKnY2RTPTMZf3nzDuVlja3lwblF5jJSJ7YxFuTR3ycuQAZLq7gnKEqVbCWAfPyLrjyqmOr/6GMPDUqnWDSJhOTaZaHO5gWubyDvVQ+bRnDsnMJ1BEKHit1z8yHGBIMpSrsoHkG54UIJ0hmToOsPuDWFM2oHz4ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkVKF2R3; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkVKF2R3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778656115; x=1810192115;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=GJMJJyPgwwoNw1RfaBYhtZyTx8oMd/kurVnK3R2dRn8=;
  b=KkVKF2R3N7rEdI7KxNzZEMuxNCPlx2d1Z3ugl3QloN/jXLlW88WIlLKj
   tKGQXHktVeQNM/x0yrpt0qdGwDV2AZYP9ZuL8FVc0BuPLZzEKkN4pj8BU
   aXHdqUuxsWdJww/XVsAxy/Mo88QpVlQfOLJujCH9BeBHYZPIhkm9nsSK7
   ORT4W9rVbfAnDdLTByk/Jw5n9OD2FXezC+INhFAkfDq9sb1BjxLAJwT8x
   AzEOCjyNIFeaVqJAe0uofrIuhQxB58BdNYdU+G4apdLHv3PPKx52RZG66
   cOxpnIY7PG/mXD6shUSIyp8pXK5iCm6ZB7Yutzbyj0c6OMfTx6ktPTVnb
   g==;
X-CSE-ConnectionGUID: tdLovITiS76MtFrhIAEEoQ==
X-CSE-MsgGUID: su5ijWURT+CNnQBZ2yMJvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79558565"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79558565"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:08:34 -0700
X-CSE-ConnectionGUID: GsWyY9rqQ5CAsHEhzhTsGw==
X-CSE-MsgGUID: O6TNqTpMQ66r+ac0OBJT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="235333735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:08:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 00:08:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 00:08:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 00:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddet6TZn8fI+I5odkCiwkMWvVNnBnPYCr1VZ2sRlxkAl22o7+H1D7T8VWQc+MHObD+KhLUb9RxmJzCEE4+pyk7nC/CfOdCQYmlVcfz1iXzA8LIoKle4Rg6a2VUwkpHPjtDSlmtaiqizDzHgaD3EJ5R+wf0Gz+t0SRr9tx9+p6dYVj59w6l+xaO9sOnGZDQBlBLDk1W/72HO/0KGvnvFSGHdu/PTTCvPbgk93wHzTNiwBDDR1L9tJy579+wawQrUI0UtCXjwXSrPg7JAIa+YV/FoDttVHhGi1KzCYuzbulADDCky3VNSVVWwHbsYM9JZo3rwEnOczd0nU7+OMk2hhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEyhDVqy2riPL/goAstoDg0FPot0YqQKi6NegxRQlhU=;
 b=WfBlW91dWZzmgbDbXXUYnR+9iZdxKeNezgU5Kh8YJQ7RdO+fbuuD4stTu9pq6LV9Lok6s6DWo+LIsuDrzr98vJ4rjdlawBWFsCB0Y/pf7BGsa4guhAF/o6c8Mn30X2rTlXqrFitNDJGNV3YWeE3O7dzEqTvZ6yBfae92+6rTl9RB0Hz3W+Ulfc9w58iLUlY2Te1wi9RrBepNg7hn0Czt2+JX2tzN72XynoNS36CXujIAGYkQw9yL3C0oB90ZC7gruJPntSSaIh4fHwwES5Odq/p25AW4UIRivU+1QbVs8cgW1AAgbUSVODp/5b6tPkaCs6/G4xs7zDmL/cIjMWhEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:08:26 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.019; Wed, 13 May 2026
 07:08:26 +0000
Date: Wed, 13 May 2026 15:08:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/module-hashes] [module]  967cf780de:
 ltp.lock_torture.fail
Message-ID: <202605131448.9fc0ef33-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: dd981904-1bb1-438f-3c3d-08deb0be6d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|11063799003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: JALuNfyYXT1iW7j4iiN3CRuzE2b6tarlK+uPia6BRFtDn9OcdMO926Kicc8QTwp/DnU/J4E28tzHrZjRKD7PB+InnigdAEOMj9fgDcLerL5y7v05EH+dJCysjY7HI9iVg7eeXXo8q0tgTWBoxfzGT4c65C9zIPcYTUPQM80Ph0BOgcbz1jKgCbDuR9jt6L/TM8MRw4n3y+lKS5/9B5PfZLaKIjQeVZXJevp8ZA9ho7YcClyZLk8eB7P3VvcUfneqRIVUzF0bAhp3n9ih4TIoJSLAWLQSb9mchbPmG5BbQARLM6KigGhprS4C+v59cMZrtkP/UU/QZC0gYkZbAG+7sFijSteJVX20EzsxnK/e26rVZwaCG5WbioqFiSmD7hABCahYCqMAkS8+/3xTPS5i8GbvCVUnHutTzPSqx9z/9jYtgkIcbp81T+ghRvYmqHLvalvlQiCh8xB/tW+jyImd4UfGQa9HAPm/06RImkfkbGvK0Opdnl4DPFXvV77GFeuMk8Q7eZ2ExS1VQpM+Fm7Qz09ker1GWqEeCKhgqyM19FPRvegKVkkYhGXP3HqCp1vJuJoksdmui9YEz4qZLi3qg2Js8bb0/4TgXdddCPrSv3Bjo9HiMPjPSe1CuoyfeA8D1W1z56Y77w0K2XFqGr6Q0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGdObnRHbDBuTXNsODJ2MzVQQi9sZEI5dUxQOGZncXFyaWdRUVZVN1V2ODNX?=
 =?utf-8?B?L2g0eVFGRjdYbXJ5YmpueWNtTko0YU9lYVdNVTBrQUxnM2o3WGxNaHNvYk9V?=
 =?utf-8?B?T2hmcCt6SW5YRm9SeVBKQVdiZTZXSEpZNHlXMjlNVW5naTNoT0diNHllZVV4?=
 =?utf-8?B?Tnk4TlFjRk5aY1pOTDY1ZWsrTno2d3lucVlGNjlIRjBwOHp6anlBTDFpemJw?=
 =?utf-8?B?RkozbzJ1VFJyakdJU0t6OG1QOEt3YmRmMHFmYU1OdlVNSTVhTGV3WlNVcGwv?=
 =?utf-8?B?QXFuaENibkxUZXZVSU5GOEpWYlRqL1BuVnNTNlBZOEg5dzBKT3VUMjNlcHBx?=
 =?utf-8?B?cW4vQTFCVTc5bE9sVGdEam1RRTllY0hRTjJwQjRXeDBpM0VpOU4zVXlzZ3Va?=
 =?utf-8?B?NkhocFBhZ2NTYnZsU0g0a1lEUXcyU1hUREZvVWFRcDh2blViRWNTSWVFcGl0?=
 =?utf-8?B?YmRnUmhCZitwTHVwSkJjSkgvc3VDSDZHaUhDTjB0bmRpSWMzWDBNaUZQYVNI?=
 =?utf-8?B?Z0NIajRnL2Fkc3lFN2ZYUnJDWFo1dlhhMElqWGtpRmFZam5PR0c2cDJBaDFm?=
 =?utf-8?B?M3pzOGFaVmNLcjdMWmhQM24vZlBZUUI2REN1UFlRYi9rZmxDanc0akNldkFD?=
 =?utf-8?B?RnZYSVYyU0U0am5oeEtUVFIrNU1nOVBYbnlNNHVaSmJSM0QvNkxYMHNwOFh6?=
 =?utf-8?B?TFIzMjhKSVh5djFoZnY3dDQ5NjhwNE1mRkFZalplK3QxNEtiODhTZmFObnNn?=
 =?utf-8?B?aDJKUzJXR0pvZllUWUJKY2VqaWlxbkpFV25wOGx5a3dvd1hTTGVDYWx0ZlJH?=
 =?utf-8?B?UnIyQmtLemoydHhRK0NNNlpsRC9IWGgvS1UvRjB2T0t5T1BjcHJPTUlQNk83?=
 =?utf-8?B?RG5NUmdvUjFRbGRia1ArcWxuckpTMTJ3aThMMXRIcE5hQVY4eE1NaUZBa3g5?=
 =?utf-8?B?Z0JDNkErR1Q0Q0ZOcHZXT0NDZkE4N2lYZlRUZWt1SXZ5ZjRtR29hL0cyZHlt?=
 =?utf-8?B?dTdqbHJvc1RmSkxlang5d0FYUXA3UUUybWFobHpXSFNKZSs2L0dhTC9pN0hW?=
 =?utf-8?B?R2ZoU0N5bFlvYXpnYTQwMEJkM3VZcnBVSjJ2U2R4eW9INDd5S3RXKy9xOThm?=
 =?utf-8?B?TnFNNStvbTN3TEFvaW9QRTBVa3hFY2s4TnhKVzBsbEZwdlpzSUhFc3BuVE5I?=
 =?utf-8?B?dHdQUTBUbDN2TjJabUdpZTJ0TVR3VDFQQmlMbjBtcEQrbTVKUytVUXBsbUxa?=
 =?utf-8?B?cnppL2IyUHhNTU1rS1pVQjFaa0l0TG8rR3cvS3pRTExkMGFaWU5jQnBURngz?=
 =?utf-8?B?ODczNW13RmFWb1lUL2w1TmNRVXdKbVM4dGo1YXpOZmIzRFNTQzJTb2hGdEZl?=
 =?utf-8?B?YmZhNitEUXNRQ2M2TGd4SEQ4aVFrT1hFU0Vpd3FYcE15Zmg1N1Izc3Bmb3Nn?=
 =?utf-8?B?U1NyWmE4bVFWNGY3YlV2UW5hRjBSWWQ5YkI1dkdVVklpR2tPeTY4WVhteDNh?=
 =?utf-8?B?TlYzbGk0T2xYSUlpeTB5OEJITHBmYjhNeXpONUw0c1pPWTdpSHBpRnpBaTVX?=
 =?utf-8?B?MXJ1NTVDZmRGTXU4WUpRUXZiUXJPcjNnNkltN3JjM1BjbEVJdTlCZWF1N0pt?=
 =?utf-8?B?UUh0OWJKdlFIQnZ4bUdTZEE2eDI4T1dVd0Z4bnJaMk9weW9HN1pCeXpXNWdl?=
 =?utf-8?B?V0hRdFBuR21rK1pzUTRmWS9oaVlTdkUwVlZTRkRoSGsvMlZNSzNWNmk2enQz?=
 =?utf-8?B?dVhXY0QyTEh1Ymw3QkF6TkdrS1M3UGxUUlJjdnJuT2xDWmJ1VXhHQXBFOGVQ?=
 =?utf-8?B?TysxVVE5WkM5bTNXS1EzazBoYmFHbVVaejJzMWFZdEFzUFFPV090SDVTUW02?=
 =?utf-8?B?eGhrWjQ3bGlDak9FbGhYdXRqeFlHNjY3L2czL1B0TjhpSkZRNDc5K3BaZkdw?=
 =?utf-8?B?clA1Mnd2d2tiWUNOZ3VQQlF1MFRnZFJmTnQwc0Mra21ic1dEalB5NDRRcTM5?=
 =?utf-8?B?VmEwWFhXNWd4dG5DMFFXQ3dPL0szRDZhR0xpeS9qSjNncTVzWHZjZkpIUjhZ?=
 =?utf-8?B?Z0FnRDFDRTJjV3Y0QlJqenNlRFd4MkpueG1LTmgvckxMdTZOTzV1TDhMOEcw?=
 =?utf-8?B?aGg3RFpSbUxtdFhHL1EyVm1qcGE0T3htbndwN1lLVXZqdkhGMHp1UktSRW8x?=
 =?utf-8?B?aWNQRFl1S2tPMEJqZWdvOXpDblp0R281c2VTZTFaOHJ0VzNSbGo3RGxmVThZ?=
 =?utf-8?B?czJtbHY1alRzTFBzeGxyUkZWTld0am9xbkRyUk1Gc253N1d0UUpCVTUxeHc1?=
 =?utf-8?B?UG5VK2Y5aVF4MVB2YW41Y0dZRkQyenlnZ0gvN0UzK2pCcXhqOXArZz09?=
X-Exchange-RoutingPolicyChecked: WYx/XOk78vTXJyh7xsMFX65L58hFhC7rJDPIlCiZ9kqsKXHejVA63fp907AtDd4vnfXWk5+hqSz6TxRpHwLqu5fODd8gkl2q8XQs2kOhuEyJQsgRt1rr80qjPvaO3Iz/Zg/G0k1a8LNBqzvorS51bPeLttKqMlfesKsNF78owM1jaETXlCJ5ClrFCgef64nKAzBNBiHdim4/yILIGs9PbnOiqAj7Y56dCj6RJg1IPOZQN2n5EDCelw4AOSczLkAy6pUakwImIYbKaa3y6PyN8GKXwDZ3nxoEgExUrApHgcECI5ib5ruj8As74ATPUbiF7x8uX4lob94kwDLeJpvV6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd981904-1bb1-438f-3c3d-08deb0be6d68
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:08:26.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf/06f2UzMPuusAUteJ04QJ1NWQyO8CCQGIYdAwO/O7w+pkdKmKxF69+V9n3+H/OKmOHwcgWiBctMpL5/U8Fjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.lock_torture.fail" on:

commit: 967cf780de6fd48a69e8096342cf0f9b9292ee7b ("module: Introduce hash-b=
ased integrity checking")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4=
/module-hashes

in testcase: ltp
version:=20
with following parameters:

	test: kernel_misc/lock_torture



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz =
(Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605131448.9fc0ef33-lkp@intel.co=
m


2026-05-09 19:10:48 export LTP_RUNTIME_MUL=3D2
2026-05-09 19:10:48 export LTPROOT=3D/lkp/benchmarks/ltp
2026-05-09 19:10:48 kirk -f temp_single_test
Host information
	Hostname:   lkp-hsw-d05
	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
	Directory:  /tmp/kirk.root/tmpav49d11b

Connecting to SUT: default

Suite: temp_single_test
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
=1B[1;37mlock_torture: =1B[0m=1B[1;31mfail=1B[0m | =1B[1;33mtainted=1B[0m  =
(6m 8s)

Execution time: 6m 8s

Disconnecting from SUT: default

Target information
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80
Kernel:   Linux 7.1.0-rc1+ #1 SMP PREEMPT_DYNAMIC Sun May 10 02:46:19 CST 2=
026
Cmdline:  ip=3D::::lkp-hsw-d05::dhcp
          root=3D/dev/ram0
          RESULT_ROOT=3D/result/ltp/kernel_misc_lock_torture/lkp-hsw-d05/de=
bian-13-x86_64-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/967cf780de6fd48a69e8=
096342cf0f9b9292ee7b/0
          BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/967cf780de6fd4=
8a69e8096342cf0f9b9292ee7b/vmlinuz-7.1.0-rc1+
          branch=3Dlinux-devel/devel-hourly-20260508-100921
          job=3D/lkp/jobs/scheduled/lkp-hsw-d05/ltp-kernel_misc_lock_tortur=
e-debian-13-x86_64-20250902.cgz-967cf780de6f-20260510-27890-1e8k4j9-0.yaml
          user=3Dlkp
          ARCH=3Dx86_64
          kconfig=3Dx86_64-rhel-9.4-ltp
          commit=3D967cf780de6fd48a69e8096342cf0f9b9292ee7b
          intremap=3Dposted_msi
          max_uptime=3D14400
          LKP_SERVER=3Dinternal-lkp-server
          nokaslr
          selinux=3D0
          debug
          apic=3Ddebug
          sysrq_always_enabled
          rcupdate.rcu_cpu_stall_timeout=3D100
          net.ifnames=3D0
          printk.devkmsg=3Don
          panic=3D-1
          softlockup_panic=3D1
          nmi_watchdog=3Dpanic
          oops=3Dpanic
          load_ramdisk=3D2
          prompt_ramdisk=3D0
          drbd.minor_count=3D8
          systemd.log_level=3Derr
          ignore_loglevel
          console=3Dtty0
          earlyprintk=3DttyS0,115200
          console=3DttyS0,115200
          vga=3Dnormal
          rw
          keep_initrds=3D/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x86=
_64-92ea0639e-1_20260301.cgz
Machine:  unknown
Arch:     x86_64
RAM:      14040280 kB
Swap:     0 kB
Distro:   debian 13

=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
      TEST SUMMARY
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
Suite:   temp_single_test
Runtime: 6m 8s
Runs:    1

Results:
    Passed:   0
    Failed:   6
    Broken:   0
    Skipped:  0
    Warnings: 0

=1B[1;31mFailures:=1B[0m
    =E2=80=A2 lock_torture

Session stopped



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260513/202605131448.9fc0ef33-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


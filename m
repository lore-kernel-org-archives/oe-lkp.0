Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035AA944F
	for <oe-lkp@lists.linux.dev>; Thu,  9 Jan 2025 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736388210; cv=fail; b=u0ymzmz2AQhJmjtdEbADfPdJCP8HO68b7N2bWVTHyner1EIF2VHWGAun9cjmSjBorhpFXEYiln5frH+sXTuAaPCAsa/lBAv22a1XVhoOkHoIq4gq2qcG2YLw9ix9aYcnOow/jnY8VMCKo+3lH4I3wMHb3Ro7OSew2TB8kTB/c1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736388210; c=relaxed/simple;
	bh=eeLj3GfPFX+t9Q91Q2bn+kNbvkwRTaSejbL8cNusTZM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uaUENRoIjDufXD1xmwEGB/aRGHXtngW91OhcDkGtRR2K8FcgDRAfTnzp+JwyqHivCB52kjuxQjXoInCuJjx2hQ/abwUzRSxzMdUx7i5IdDEDjWqU5M2sJbHEgNpZhEpcIOFHhbUIaoDe6zn/yBsDv6pD0B7nH1aZsLwAh/T+/c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEVKJBYx; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEVKJBYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736388209; x=1767924209;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eeLj3GfPFX+t9Q91Q2bn+kNbvkwRTaSejbL8cNusTZM=;
  b=BEVKJBYxCDHA2JO0L1BBAIXZ+HEoboQnPMbFa2M5WqCH+7UySrV5Pr0C
   hZ72cvCDUnHmEWq9P0A+fNRQWZd27Hi6gmWTgLpOpPT8N4sPmZgiGl6ul
   AQ0gD/P42Uww1ryRqpVOp9XNBoNGjk1FOBXktDzmLA6H1HzfK6ZerPVlg
   LAFSbu47cvcdlo+HhP0hZb8wj/Burn+SUZnpirhW3Ga4bO8CU14g0L425
   hLsVr4GdooPZzDonY5N66KuAZY2DZb491SNtosasfvh7Ny8zgnH9lBSMR
   DTNrJihdz2CCw9xuEXXG/4+/1axpwL4UajRdQjZTbaOVukOr6saVDqAkV
   w==;
X-CSE-ConnectionGUID: 47nWxW8AT8qlY8jcGYgYVA==
X-CSE-MsgGUID: X+jO7dnaTAmG4caNp9qRuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36517856"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36517856"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 18:03:29 -0800
X-CSE-ConnectionGUID: 9YczL4khQNuXPYjjB2hwFg==
X-CSE-MsgGUID: gGz18UCeT0itJR8CLSseaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107870727"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jan 2025 18:03:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 18:03:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 18:03:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 18:03:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCpR4LCvcBPzzLziVM5A2K+ZmR6rUB4gqLaW+qGawVYItzYuc2UY9/jWY3uxk9C40LWObpjeAq20j7pSt7Ra2tOFKk0SImlpNuOOWue4ps22XFGU6YTxKWkHc8OS6QHupcY07kgmQtVgmiI+Zdao/Oa2P2DENnnC2JJ7QRMJ4Naz9dL/5YrR5P3xH4JMHX1DlchjfL+KrpSOg0Ys5kyPiqAzf201EXPTsUz4XzcksIx/obvlVeXmnll62RzcCutoVqsO+ifCfmobDHzjlbqIir0dbW4aBIl2WmARBCjjhVHAMpkGd8vLFFtHlxQYDuBYjZgBAU7Mi6CuyOwwEenoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3jdtxNIkFmXRuWDpcTpdk6mMhhE8mhBRjRTqUZ4tXg=;
 b=p/W65/EY2zHgX2CIOAzUB37azo+LRNNHvSgeszRcPEg4nk+tGSKCQYcMsYAJbVyoydDLF0MyCpiq2I9hxkkWE75cV07VMd8EIMZBc0Rv//2KI5db/qp4xOZjiplfRX3t0cUc890K/IKJ0cZMyk8AIzz+rwAjKqPJ4FRVy8VfqGKFfxECwvl6C+JSoamwz93mtB3VcqSSZUyhbP6Oh9q/VI2LTV9c+hWiRSz4sbmZtSLfbVAwa9jqVnafupGtORavH7Elb+Y/SJ26aAWUE9OvH+KBJz8ZY2Suz3NfJ4zl5sWJ+Qz+mJ6I0nEVcVpBAeQYDuT1ZjtNqVO80TeESlbPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH2PR11MB8865.namprd11.prod.outlook.com (2603:10b6:610:282::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 02:02:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 02:02:58 +0000
Date: Thu, 9 Jan 2025 10:02:48 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Alexander Potapenko <glider@google.com>
CC: Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>,
	Nihar Chaithanya <niharchaithanya@gmail.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	"Dmitry Vyukov" <dvyukov@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
	<kasan-dev@googlegroups.com>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [kasan] 3738290bfc: kunit.kasan.fail
Message-ID: <Z38uSJ0ut2XikMYj@xsang-OptiPlex-9020>
References: <202501081209.b7d8b735-lkp@intel.com>
 <CA+fCnZfkMuk8dtk+5_7DK_h0Pxv_JNgJDL3D-8pBXOByzVOtzQ@mail.gmail.com>
 <CAG_fn=UKrpQCQu__nJ74C4xqn5VOcYRc+hbXX5wwmLcR3oKdeQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=UKrpQCQu__nJ74C4xqn5VOcYRc+hbXX5wwmLcR3oKdeQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH2PR11MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b6f45a-460e-4405-6171-08dd3051bd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eElqcDU0UlVLQ3d1QnpoTU1ZdkdTQVNxWTJaWkNOeSsralFIS3NZVXRVUU42?=
 =?utf-8?B?ZEJBbU50TUJidEJzb2RRNzN1VEsweFpkeFE0NE96cTBsVzFVcXUreDB4K3VV?=
 =?utf-8?B?M0o3U2YrZG9hU1VMMEtKYnYyV1R0UGY3dU90Q2RwVEU4cHU5UWFGTjNxNTlF?=
 =?utf-8?B?MUo1dWk4QlBLU0J1Q3BqWTc1ODFJanlDckNRaE1peWMvT1Rib1FJYU5YQU9Y?=
 =?utf-8?B?bEVFdnVybE9sTVZKK1lyME1wYnZqQktCQk1Pd1NEcGhmSkc5eFVMdWRzL1d1?=
 =?utf-8?B?MnV0Rzlwcy91aXZ3QTRaZGRQSnVDeGx3ZGJweHg4Y0xkY3lXWGpka0pXQjF4?=
 =?utf-8?B?VkVReld3bnB1NzhKNVJQQ1RRaHc0eEl5akhTZWNlUjgvaWlqOFVxTXkwdmp5?=
 =?utf-8?B?M0FnVkJIMmdUa0pjVmtXRVhuckNUa1JRcHk4SzBjei9lTmlGVjRsV0pwMjRB?=
 =?utf-8?B?YjNUOWxPdDNIMnRWeitiV28yYzBrMDZ5KzAvd3ZVZTExNFRiOURETC9JZzBB?=
 =?utf-8?B?YVpaTHdMQmszTHl2d3VGQmtxc3FYWTQvdmpzZkJpUC8xb20yc2RmWVFNMlg2?=
 =?utf-8?B?aEFKU1dJUk9vNXQxNUdoelhTZjR6REovazc2VGVNbisxeTA3NithbzgzMUFu?=
 =?utf-8?B?TVR5K1lZUHRNN3BVSW5ZR3B0WU00SmFDQmxhUWJ4U3hHdXhRMzNSWmp1eHBO?=
 =?utf-8?B?TkxwYVVKWEd0Q1JNbzFKREp1R3Y5RGhVUEZyYTBWRVJpMUUyQWZJS0gzWkpN?=
 =?utf-8?B?UTE3Mmt3dmNkOU9RMmR5cjZ3TDh1YkRhVGRqdnpaNFNKQkVDVjdpcFA1MHln?=
 =?utf-8?B?Y2hYMTV0c1dhVG9Qd1VBL3RZMlBpRzlHZExnclJYaUlDTm8wMEQxYmVmV0Zy?=
 =?utf-8?B?ZlJCWUpvV3Z4bk1OSENHWlRZS01KbzB1VloxZVJISnBVWGNJM3NQWTRFK1Nt?=
 =?utf-8?B?Y3VBdWZhTWpMcmRxYmtxZStuRVMxOGtVbXZkSENFeXRTdjJJTnRnek1sOXZz?=
 =?utf-8?B?ZjdCZitGMGJ1TUdZYTlUSXc1SWFxSWRjWDFsMy9TaERXaVpoUlZVcDBtYlI0?=
 =?utf-8?B?SG1nTy9oN2dNRFBhV2NCeWpRaTQ0ZGdaL09USjdMMFdlMHc2ZkRVNEkyb0xw?=
 =?utf-8?B?enZMb2VjWXN5WGQ5bXFVNElhMmd2N29SOWpFMnk4THBFY1VIL05hL1FFdjhE?=
 =?utf-8?B?Y1huSEhERm1Tdm5xUGF5U0dFZVRqN2ZoSElOb0tiejJ0RUVYUkRsVnI2SkZy?=
 =?utf-8?B?UVNrVm5lcmF2SklCNXVrclpvK05UYnNiNDBEMFJuZ0xnazM1R3F2ZUp1akVr?=
 =?utf-8?B?cDkvWVd0RElERTUxWVQ5ckVUOUhCc0dna1ZuUTNhZ2tremtBUlFWeHh4UXph?=
 =?utf-8?B?YWVWSmd5MmI4ZlNYYXREWlh1U2xPZHdzMzZrRkFodWhvdEphTFU2YkRaWHEv?=
 =?utf-8?B?MEhRYncxL204a2ZtOUloZldHYTJtVHRxalNiS2lPUzdVVWxEYmkxbzR4bEFP?=
 =?utf-8?B?UlB5My96b2dINEVFdmNPeG0wK2dtYzlZbnRWSlkzOThpUG1iNDk2Q2grTC81?=
 =?utf-8?B?OVlnTnRQWjIxRFdtaXJKOVlaZnBYS1JQOSs3cWtQZ3djaE9ueWd6ZjVOdkxP?=
 =?utf-8?B?N3RDWnp0SmtYYjQ3d09hNk9mbWtXQnhvazFsYnJ3ekZqN1U3ZSszV2lsUkRk?=
 =?utf-8?B?a0hsQ1dOUTZNdVU5SmF6M054MmRDVlMxOVhkQTNTSmhvakJ2b1lSRzNOZEIv?=
 =?utf-8?B?ak9xclQ4OGpETStETEJZQTN6OThxTDNDMGJPWHB1NDI0MXN2T1FsYjNIVGFD?=
 =?utf-8?B?ZVRkNXFEYkFveUFGYUlNMyszOEExYTEyMkVjUXhORlBRV0pIa1FNWEo0b1Nz?=
 =?utf-8?Q?2fAhNoJrhcZyp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FnY20va1ZRL0JHMFJhZ2hMKzhQMWFBVnQwcFdKNVB3VkplV2MxZllDWFNN?=
 =?utf-8?B?MnBaT0l0bDVaQWtoTDdqYWM5QUw5MDg0Z1BBOU1EZkJiR2tjV0NYd0p3OUlr?=
 =?utf-8?B?MzFyNHUzSm1xdDVxZTI3d3JXV0s0ZDkxYXFHWS8rdWxvOFpCdDNPZHZwMVND?=
 =?utf-8?B?WXFaRUd2V2ZTZ2dvSDlkUVN2UFZtTFRXdVpJRmRveGVOR3pVcENkdG1qN29y?=
 =?utf-8?B?UitoeGlJSTluSm9RQkw0c3B2YzVvSG9ubjl0T2ZzZWd6MldiR1ZYUFhjRWRO?=
 =?utf-8?B?dFZ4d2JCaGdscnpmUm9aMkVSTzV3UW1KZ3pTN3JKZjNoMy9XNlJwcVQ5bHZs?=
 =?utf-8?B?RGNnRm9sS2xGMEJxcEdRYzhINGQrQXIvRmNJcWt0dGl0STl1VE1wSmRFZmxJ?=
 =?utf-8?B?UmhUc001RGRSS1BwbEhWQ3JUbmIzVnRSQXMyRThORjZzQytxZ1pHWDAvQS9Z?=
 =?utf-8?B?QThzeDBEYmphMjg3cUlKTXlVTXUzOVBURmt4ZkFBVUVrRTRPMUFqVkp3WW50?=
 =?utf-8?B?ejJqVW1PZFZXR1BhVmRpWmRNOUZrZ1BEZFlGY09hRlc2aFZZenBuWmhBc1Jx?=
 =?utf-8?B?a0d4d284eDhhc1JTR2xOY1BHUE1GOHRFSzhLM1Fkak93YXNEQ3JBdmg3MCtF?=
 =?utf-8?B?NWl2RnJEODlzNWpUdkZ0MDcwcFlGRUVMMWZkUld6SXIxMkVEek1xU3dwSXNG?=
 =?utf-8?B?cS8veXN6S0I1M2huZ2xGWm91cVRMbXdBZnBtcU1TNjZjaEdiK0g5Rm4wZ2ZM?=
 =?utf-8?B?ODZjcG9uZWRyOG9tTDllbTNSZWRCWHE2b0VOK1RhaS95dmV0eWpPWjd2bUo3?=
 =?utf-8?B?WnE3NVhzRUpSQ0RDVFNxckNoUDBlTkdkNjg2bkRXMGVXbXNjdmo1VWVCV0ZF?=
 =?utf-8?B?SlJRQmZwdURuRVVzRjRDc2J3SUFodk8vMkI3UHNUbzFOQUdBM21JZXNDVE1J?=
 =?utf-8?B?bDZrcDg2WWk1THhtRUpyQ0RLWTQ1RG9DQlRTZjdLNnpuQy9uVk5TbCtXVXgr?=
 =?utf-8?B?b3FrTjNiTmRxbkt2YTZ5bllDSkR5eDF1eGVJMlU2UTNNaWkrdThVQ3k4eXZL?=
 =?utf-8?B?aTJEQjFDSjRmV3Zoem1VR2MvM0o3eW9jZUNHQU1EaEVsMS9uSG9xN2ZrSWRK?=
 =?utf-8?B?cFFGTTkzVFlrZWpwVlVma25IbUNFSVFTTXdhVWlKaUNOY2d6UE5KTXQwNTFB?=
 =?utf-8?B?UUNJR2Q5d0ptU0E3SExHdmtRbnJReG1xNXd5bDgvbXhWd0xOVHUzSVNtbDRF?=
 =?utf-8?B?REFGR0NZTEJZdXd3V3Q3bTJkK3hGWTMxSm9rQWdaMEgzNWxhMXYzcFR2K2NZ?=
 =?utf-8?B?dnVVU1RPVTdxZnFsVzdpMDZHMkZ3RGlrL0lRdlNVWHZrR2c4Uk90bElkeDFi?=
 =?utf-8?B?emJ4R0QxRVNwMEU1NVU4SXVvaVBZTFk0cFpMMjVhY1hZc3lhNWg0QTVQTkJO?=
 =?utf-8?B?UisxakIrQUdaTnhHcXQ2QUI0bCtXQzBrZlBodnB5OVJMb1h2NDRsOC8wOGpS?=
 =?utf-8?B?RkQ3Q0w5N1Nxa2VvRGpDbzd1STNkbG0vSVBiTHduTlgzQmEwdFkvZWpBYU5H?=
 =?utf-8?B?bk9jN0pWUHZoR1IvSjg3VmVRajdScU9nTCtQVW0vY3puREFncG13ZTVmVlNM?=
 =?utf-8?B?Z0x1WkVaRFI0WEhTVVdRQVk2YVhiNHlYUzFrak54Z3pUQU9KcnJIMDZ3bnZY?=
 =?utf-8?B?U3dTUGJHbndCRUVFblN4dmVmOUgyZUl0amhQNEFycHpkSmxLaEl5MThDazVk?=
 =?utf-8?B?VXJ4aFZNR0Q0QUU0UlR5UHowRklMY3N4T0dzVDFYcDlJS0VZYUdzT09YeGJp?=
 =?utf-8?B?VnhSamJXY1pscHJ3STFQRUwrWHlrT1V4K2lzQ3ZnNzU5K1pRZFhEY1lFK1Rh?=
 =?utf-8?B?RzNqdUpZeGlDNEMyT05vMEZWcXc0Ujc3VmwvYThzcUErdVdXWTVIcEd1UWJr?=
 =?utf-8?B?OUtoRGJEdExJbjBOUjJxUkphZ0JoelRBK1ZMbS9NSTJwTjFvOFAyQncyRG9h?=
 =?utf-8?B?bDc0bTNSTHUzRStrYk50SXA3TFZjelRmV080cHRWTlppZzVtRzlsTGg1UEdE?=
 =?utf-8?B?SzFJVm9BVGQvV0Nrb2pqNkE1N2Y5eXdvNTBKY1MvZlh1cW1KT09CV2ZQMWZr?=
 =?utf-8?B?em11SGo2ckhOWXIrMUZJbmZQd1hjalVIV21OS0pnQytIWXE0OHVMeStaazFj?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b6f45a-460e-4405-6171-08dd3051bd2d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 02:02:58.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQmobgB4LUnY7TKTSfIAbegypcQDGIfpUvXJb80Bap/cZrMfe2zBxeFhKAmKF4HIn1rEpUNXK/gA3QR50v4XlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8865
X-OriginatorOrg: intel.com

hi, Alexander Potapenko, hi, Andrey Konovalov,
On Wed, Jan 08, 2025 at 05:17:55PM +0100, Alexander Potapenko wrote:
> On Wed, Jan 8, 2025 at 5:03 PM Andrey Konovalov <andreyknvl@gmail.com> wrote:
> >
> 
> > > [  118.348258] CPU: 7 UID: 0 PID: 3613 Comm: kunit_try_catch Tainted: G    B   W        N 6.12.0-rc6-00221-g3738290bfc99 #1
> > > [  118.359770] Tainted: [B]=BAD_PAGE, [W]=WARN, [N]=TEST
> > > [  118.365490] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 12/22/2016
> > > [  118.373542] ==================================================================
> > > [  118.381677]     not ok 4 kmalloc_track_caller_oob_right
> >
> > +Marco and Alexander
> >
> > Looks like KFENCE hijacked the allocation and reported the OOB instead
> > of KASAN. There's a KASAN issue filed for this problem [1], but no
> > solution implemented in the kernel so far.
> 
> If for some reason we want to keep both KFENCE and KASAN enabled on
> that machine, we can use is_kfence_address() to check if an allocation
> in a KASAN test was made from the KFENCE pool, and repeat it. This
> won't look nice though, because we have several different allocation
> APIs in the C test module alone, not to mention Rust.
> 
> > Perhaps, it makes sense to disable KFENCE when running the KASAN test
> > suite on kernel test robot for now?
> 
> Looks like the simplest solution for now.

thanks a lot for information! we will update the bot to do this disable.

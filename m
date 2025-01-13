Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CAF1AAC4
	for <oe-lkp@lists.linux.dev>; Mon, 13 Jan 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774829; cv=fail; b=DEUT8tFvynUgQc3AE8K4JsMUKjwUmDREN0GJDoxJsC829QxT/+XljrhdzqGckfz4/eOakSyEwAgTf+a4oX8PrVvgFN7e1OrkI5lzR4FZF/FqLqpDvzGxO9PX4u/p7a4WI5K7o4I7NOkLxdtFr7pqwO/R6NSU6K/nMkH6nhABNpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774829; c=relaxed/simple;
	bh=ZE/FK1xnbmFcW2YIAt0O4VQkHVC/QIaP0EHqRGpWJoo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kdl+DSFxCSqREw4aDAcaM5i/reLUshlr87Y4ZTiIeCVhgwghKqdKkq15iMSl8h9FWTEX4MZ481TQPZx2D10oSc+2ktyySQ8s5akPNNLaPUpn4gt6uIbR3pUsCs3GyTG3hqZjXkw+fwlPrH3MxwfZEUl1xWn3/ZA+yrzVPc0S8g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqXUhbLO; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqXUhbLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736774826; x=1768310826;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZE/FK1xnbmFcW2YIAt0O4VQkHVC/QIaP0EHqRGpWJoo=;
  b=ZqXUhbLOnNkEVhW9LvLgFvYqL36JV4jDpPyIjDYLXKLoMaipdTV0K/Zg
   Nxq13sjDhv4Fimu8MnIOjPWQVOf6Xm8DpyLj0TEB29M1wgm8ZmSr0Ra1O
   wbvi6u1QiQspmN1piBdHePBYWiK5m7Rz+dngIapy/ZkAQQHG59yk+z4XY
   NwSVcPgaZq4FUp8gt6s2URTNmiC2kerN7H/9wNdv/0JHtSmWli7in6yxP
   ScjnOn2OKZmYhZIeaFy6F67R8+i4ntMT5v5WQ5habRp9af4OLOFRgRRTF
   LlqHat8r3vY2W6H3rUW/L1PlFC+ddYE/PW7Nt9n5lsPnqL2b1vGCa65kF
   Q==;
X-CSE-ConnectionGUID: VO/mWo8XSoSLtSgvuFW5zA==
X-CSE-MsgGUID: CXpC7/RBRsuSYheUGa6TQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37266438"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37266438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 05:27:06 -0800
X-CSE-ConnectionGUID: +cyc98AUQ/uUyJorQNxHBw==
X-CSE-MsgGUID: YOQcTYCMRZuRAdAO3sREng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104993682"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 05:27:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 05:27:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 05:27:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 05:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2jLS5lLLBlp3s4fDc10Rw2Zt8+RBvD7XAGHEHspsfIjVA0BdzZXPKAryGDnNnJMkveg+u8Tp/AhpZhdvJ5/j3ePSPL4Tq1rhGOEUSPcaKxqeVllizunp30mEdGguxXCp5QlshE/fn6c9DugpRtD8rmFHVKbUQ3OSUvZSfZdEek76v4eA28Cyjofey5hr1B0N6LrGK0ukx5QkHYHOc97oOFh5jgQYLG9myUlBM/SiH/ly0A/1AcHPBsC9o9EQI5qNE3Ownui7ezyQ4hLSsgl1Eeh/shodSe9dSGN4iT+PVxmh/xgE/YJbrrpJPF7gtrhCLlmBSrTJhgFFWRLj+oYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxZruSsaakrL/FDdTZKYvvTCRagt/Rn4sLXAg5ZjS34=;
 b=vIT86tvF4z3izXNymm4r2gon2cHwbtKthfoAREDVdfbGIDpoPrykkfOOChEq/dcWemRpjCE1dTf4tdCU2rzDWC+7qWwkTof8ltGrZDl4NsQG3MpptN+qvN2gM8w8zo0OCDu91HU7JCTlc2+fCQwc5/FtQd4S+NJ1VqIfQED46jsng+mx64O1NldZnEAZQ0WvNXaDK3UuLtN9iferGsGfKR2DRt3PkMP0shwpfGVIu4lA5ZOg75+Q0Qw+CQ9cDZvhV1qlamgZEj7v4sSroLBkhHehPfo4AzOBWFcscjDWtcTNSCAtCwpQETLLDSEMcJ2RbasAmOtg1Pb/rcVsxZ6w3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Mon, 13 Jan
 2025 13:27:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 13:27:02 +0000
Date: Mon, 13 Jan 2025 21:26:54 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [vsnprintf] 8d4826cc8a:
 BUG:KASAN:global-out-of-bounds_in_number
Message-ID: <Z4UUnsL85EN/f0BK@xsang-OptiPlex-9020>
References: <202501131352.e226f995-lkp@intel.com>
 <CAHk-=wi4sW7Zc2jVsFo5dzmZ9bcrWqCNaoACqZ5AkO+zL1UcZw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wi4sW7Zc2jVsFo5dzmZ9bcrWqCNaoACqZ5AkO+zL1UcZw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 252c6564-a35e-4cdd-8b8c-08dd33d5f73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AIVHdrBRCc4ofAgvMwRLNJOFsH4DmESVg4Gu9MVh4kiBV3VKhLzG1l5ZfxTw?=
 =?us-ascii?Q?OpsrFPM1tdfciat9kx24Sg/wOWKqfP04CwB96+kH9856JLMnURfGGcGoej5l?=
 =?us-ascii?Q?FJZ3kEr2NCfJ5kPHJBHEFdFLy02Qn6E+KzvE9IAyZ4ms/h+kYgvNTt8Adlim?=
 =?us-ascii?Q?tB3l/FjXlKZ9o0FMTJTk4AwvKiFwT0DMoVUMkSursV8AHlynoEjYYSe0Qsuh?=
 =?us-ascii?Q?rhkT3Tfi0OUq7GGvnLW1Cou6eGWMeJLAp+JYukbdDfYWp9fm1WtXREwxJDdu?=
 =?us-ascii?Q?PF8joZYO7xXmYcU3j+BBqO+lNA51lQsuGXUWLIHqU8aEsTeCO8g6ZN1wgz4J?=
 =?us-ascii?Q?sQkl9yCVPd6FTzTT0Eif2sC90EkSOpuOcrrtgilDMmX5s9cKqmGCLQEE2yHm?=
 =?us-ascii?Q?+czUJguNX4cv77o5FSrHtqWL1Yr9P1AoEUrfBSlppdrH8Mh8EBYR0Xytcdtc?=
 =?us-ascii?Q?a7DHvP1ovC/O3AoVmt+vkCdG+7yM3LNW4d9/y9AMjeBnPe8YChOs4UOl8Zg9?=
 =?us-ascii?Q?huGKlvVbRFbz7yXGpU/IwR6efcT6VTEaVOGw24w57smYhJn9wddYf/alGZSf?=
 =?us-ascii?Q?sUOA9becx7evTQh7afTf7o01V8SVYfuPHm3g8SBs4lMr0sqI9IcdcMRK1z48?=
 =?us-ascii?Q?313DwwEAW7+R0d90MTrsrgYUHag5FQ+MUcqIYqgL5gzKSI2P18XF3mUm57sg?=
 =?us-ascii?Q?pX3mADKPsfK4jGAepN+YN7hhvahCc6zqnVhgvCuClEW6x79IejzMNxK7ieb2?=
 =?us-ascii?Q?BriOJ81kjzld/p0fmfoEKCyMz+stvfDLIqMKWrrkoKUxXTm4amy6SpZWVOJf?=
 =?us-ascii?Q?QusX1o+pZrOnuww358XuAbJkg8DO/u2d7HDItTHmIXDYPfw05fRsqMfpGR+Q?=
 =?us-ascii?Q?2xQJ5Jd/UdrYQnK3lkqDuTMBZllYb+Vduy7vGFuYosYJPvSzXMfkw0QDM6LR?=
 =?us-ascii?Q?mpvLmaj37J14vqRYX7/UUWPGsUY+jzjvE6YOP6OaMySaKT69fADlYEGLIEDu?=
 =?us-ascii?Q?z0up8D12DYMHqRjizm87xY3xp7fMt4VuDtVyonhazRvj070CdQZX0SsM3ZKK?=
 =?us-ascii?Q?8dVoyTxp6/aKBXhGt4TR/aNmfpSXbOghKkgYXAQsEmE4+CyjKU/aEO9o8q3h?=
 =?us-ascii?Q?/Cb9w2RYSeSPrRTBm16rdO1VDUOBHZfcPb+HDFrHykg+oNCLwp4BWlwxXwHX?=
 =?us-ascii?Q?x/XhtOzSrFYrm3POI0uERkq/zgvhqzceUl4lC9CbA+W4P6iOIrtnjGThgZX1?=
 =?us-ascii?Q?unTlBt3SE1DVdgFJLNonB6wnQQyFcgaL/1m4uOZVSaAL7KDgqCeyfNntGGkL?=
 =?us-ascii?Q?RrI2akNJjNQoAm31mXre6eDrWCkDcseFCs5QoZQL6Xufhmp42JEbpMH8qVwS?=
 =?us-ascii?Q?qbDr7D2oV5eLHMidEpjxoQXhC7ck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X5qY1rrAyKZL8ORL4DM6oiwodaQD4XuukQfQIAqNeOtNDWS5BVbvTGitrGG/?=
 =?us-ascii?Q?ZsiYbmaGATIsvvwmw1EmFnJI/C3lpJ5aNGdrpJkDc+0vygc4R6p18SowDSne?=
 =?us-ascii?Q?RLzuueOyJPn7Gx+GgklMwvt44d+k3JxvjqBLq89+lkKqtU78Am6OvLD8/D5Y?=
 =?us-ascii?Q?eDHdvhOM/N6AcMztYU7ljJWAqvDBKUKsfBlLVuj6ed62vPnS27Wy2tYAq6CA?=
 =?us-ascii?Q?igiSmEAvl6bMhE1xzcxLzzSJlCirIVoFiMbL1Xh6/5Yx7nDClaTbAUtNx2ms?=
 =?us-ascii?Q?IK/D7/7DxldwfDLzMpo0kP6JFcS9XHBslvVheKuyUxmdIBMnZ7uADJJUqcHa?=
 =?us-ascii?Q?9NJwOtOVyO2dXRNq0mA+WRbqqxiWeoueN5l8VSNFtloBG9Xzr+c8z2yX2ese?=
 =?us-ascii?Q?VH6IVjSTUUTQxn/JVkb2ntjPY/lFDk25AdAXEmezMSbl1t1iZI73q2XohIxT?=
 =?us-ascii?Q?+a8dVzGbCUHysrUC1d0Ecph1z4ujTxLd7ToBDT3JAqEXhg/kGcGB5x3edQrI?=
 =?us-ascii?Q?XxTT7WWDEXi725PvPq9EFjaPRm8fm0hpNjpd+hI4yrmh6Jzy9CySMlgYf3AV?=
 =?us-ascii?Q?CKuBAnZFRBH1clYJZ7XljBGKWNAt+S/juH4GTnbQjLurjNSBhxYMPiUw34Z9?=
 =?us-ascii?Q?tT81m4e3yH3AKq50JZSJkB9nS3oG8Wzhc7541hX1fWj1iu7KCOJKC/HeqHXO?=
 =?us-ascii?Q?VeSRu9sUuBWbh2AXCo6PijmWFQHFIBx/AJ1KykHIgDIU2r+T/45uB/icyXcn?=
 =?us-ascii?Q?T8g5m69FBQRjrRNDR9xddv3s9a0/BAKizc0s4amb4Z1I2HTuUia/BjOQqrgi?=
 =?us-ascii?Q?P0Epc3TX/0yUE6pFFhWGYA1vLxzCGLYAgjZli74qF16JvuCMzSNz9oSmSfgX?=
 =?us-ascii?Q?cO4taWIcG+g+SJSX1UH79BNQm6PkunPCY9Vnz9LFoYmJYH3t/g2pPFHBxs7R?=
 =?us-ascii?Q?kp/IoQZjp0M1nOFr3Slkbr+nERXf/LUIZuhreYKEDGoDUFO2r3I/xkyWNMjK?=
 =?us-ascii?Q?cMAqlEcJ8kyacgSD42/KZs1xaCw/purQm223bfC0BU3UuUvkBlvE8e6JnFy6?=
 =?us-ascii?Q?AIIuwRjW4Q8QJZQHDFquBdOsiTYZxVe9LqmxLEjZLdfCzNL5vkpVKjUYDnO2?=
 =?us-ascii?Q?KGyQskSxHD6QAReoqeL47quJ05xLrM0l56VayyBf5zhFsP1pCuQlbF0V9fMQ?=
 =?us-ascii?Q?oceBHtiPCV96D4j7xm+qix6/6GjFbaekvcfy6c8s+7t52hsPUR8uuexLny5G?=
 =?us-ascii?Q?50zHo0b9xT79EbSqor77puOW+c2NBgma0qHxY0UuW82sTJaTUVsDpQ6XoNPZ?=
 =?us-ascii?Q?3zAcyVyC/yvbklrox0KNINZPfSjkdJsewj0F2AnYcco8/O0fnVWrUPB1rTGf?=
 =?us-ascii?Q?WmUf80msQrWDDQ+2ZasD5ciXt8MJGDSu60vVyj3+vlY0jxFS4Te3PkD8SYpa?=
 =?us-ascii?Q?W3s1UFQ+IP0MwcNIasd4L3sqiScmK/hyye9soCpgaQwXxuhFYSnHyYDQ5O7R?=
 =?us-ascii?Q?7Grn9K2Ocwf9hE9JPbanmxFOhQNWMeA68q48xCuQGfD+dKiHIxjQk60syJ5N?=
 =?us-ascii?Q?dCN6pH+C+SbDvEZFoq7wT0ixcEY6ZV3CYjBlm5Rh3aS6/nVKyDOnSm4bM4R9?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 252c6564-a35e-4cdd-8b8c-08dd33d5f73d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 13:27:02.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kc0IeIejdze4KmKeMqKHWzcCdQMaUjdAZLx0WW0Ss8AP95ciFDe+PnnZve9dwQnhr5GN6Wyaq963V165/gGHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
X-OriginatorOrg: intel.com

hi, Linus,

On Sun, Jan 12, 2025 at 11:07:02PM -0800, Linus Torvalds wrote:
> On Sun, 12 Jan 2025 at 22:11, kernel test robot <oliver.sang@intel.com> wrote:
> >
> > [ 53.288261][ T1140] BUG: KASAN: global-out-of-bounds in number (lib/vsprintf.c:494)
> > [   53.295106][ T1140] Read of size 1 at addr ffffffff843035c8 by task ln/1140
> 
> Bah. That's this:
> 
>     494                         tmp[i++] = (hex_asc_upper[((unsigned
> char)num) & mask] | locase);
> 
> and the one-byte read is that
> 
>     hex_asc_upper[((unsigned char)num) & mask]
> 
> access.
> 
> And 'mask' is supposed to be either 7 or 15 (for base 8 or 16
> respectively), but it turns out that this all comes from (I think)
> 
>             pr_info("enabling port %d (%pISpcs)\n",
>                     le16_to_cpu(nport->disc_addr.portid),
>                     (struct sockaddr *)&port->addr);
> 
> in nvmet_rdma_add_port(), and that commit 8d4826cc8a8a ("vsnprintf:
> collapse the number format state into one single state") doesn't set
> the number base for non-numeric formats (like the 'p').
> 
> Or rather, it sets the base to zero.
> 
> The '%pISpcs' causes the call chain to be pointer() ->
> ip_addr_string() -> ip4_addr_string_sa() -> number(), and there the
> number base being zero confuses things terminally.
> 
> And then when the 'p' logic calls 'number()' with  zero base then
> confuses number printing and the 'mask' logic.
> 
> Most other number() callers - for example special_hex_number - will
> set the base explicitly, but several of the more specialized pointer
> things seem to just pass in the 'spec' from the original pointer
> format, and expects the "base" of a pointer spec to be 10.
> 
> Which wasn't very obvious, butused to be the default, and that commit
> broke that.
> 
> Does this trivial one-liner (sorry, whitespace-damaged) fix it?

yes, below diff fixes the issue we reported. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
>   --- a/lib/vsprintf.c
>   +++ b/lib/vsprintf.c
>   @@ -2682,7 +2682,7 @@ struct fmt format_decode(struct fmt fmt,
> struct printf_spec *spec)
>                 p = lookup_state + *fmt.str;
>         }
>         if (p->state) {
>   -             spec->base = p->base;
>   +             if (p->base) spec->base = p->base;
>                 spec->flags |= p->flags_or_double_size;
>                 fmt.state = p->state;
>                 fmt.str++;
> 
> so that the format decoding will only set the spec base to something
> else than 10 if the format actually has a base (i.e. is a
> FORMAT_STATE_NUM).
> 
>                 Linus

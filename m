Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC709213236
	for <oe-lkp@lists.linux.dev>; Fri, 28 Mar 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154009; cv=fail; b=MmnZNcH61k6XecCU8845hyG76IooFdm1R/8CpSl0c8mwuOZQSU9oZMjcytIn7fWLSFeBK3CQaDgGxfykSZ9Xisithivw9aoCdD+7baWcvA7p7OS1hmtQweTF0K4Jd+UVdTqlC4k4HuXMqvaEhxXxSGJ7WhBa2xcE6S6aDDHVbMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154009; c=relaxed/simple;
	bh=xvZCD54nZN4X0uYb89zg15nZvRQWaaFejkzWkixwnkM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G3UprPwhBhvoouTa5lkErMcXy5TDAYxd2W9gOe9UywL1oFmEhAv4EyxLeLr5MzvXeeCwCJxnDwCrGxLaXmY5FwFd1ff7ahhzOk8SvIFrq01fk4gP8yXQGGnL2JIzISTVoqRNFuN1TgHIXb465jY6Ooxx9lgJAK1LhLlxPM0kCKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7cAmfqP; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7cAmfqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743154007; x=1774690007;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xvZCD54nZN4X0uYb89zg15nZvRQWaaFejkzWkixwnkM=;
  b=a7cAmfqPX6u1EW2CB+kzxWLjVlSnBzT3GVEsqjmtFsYBscC6CjgnZFbA
   ct+vn8Po4Og7Fxc4W4Y2ZcB89w7KJc0CK7ODePQ3DZW3xBmMVL5t26jmk
   gZLNs+mNL1UXF/Or/lEvc8l/m+rTxpWoVfOD/D7nAm+AKQYFWYM3Q81vC
   faNxjW4mpXDJNVHmSN9bySvOxS7sIhgtw64KN8CsT/WHrLUAZL/X5g0T0
   N97z2fD1sFMx+Rjs2Uu3anR2K2z59S9fVUxJKf/7AG20oOieBQmTnfXa5
   B7ZGMXP5hoH2TeXsFeCIB/2rWd2QzyX9gl6rxadxjbFIvM2smPLHzPkCG
   w==;
X-CSE-ConnectionGUID: nhXFT+/3QCOsv4Ypr+xzHA==
X-CSE-MsgGUID: TUb67oM4S+GQ9EPtRww5aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44402869"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="44402869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:26:45 -0700
X-CSE-ConnectionGUID: 9BQfyeRURBqpwgzUelCBMw==
X-CSE-MsgGUID: WgUs48CyRQampRWcktdMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125624011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:26:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 02:26:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 02:26:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 02:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERL5pqG8QSEVbrUxBCmUqoHGcm3rR8c804ccUoaLmbmXvjRII+JuMXu1awNGlxM0GxXMmpFWLKW4L/LPTR/WqCCKsAJSljwMEiFUq3QHnUmcJa7biQwzpooVJBw7oY/Y3nCagNrp1MONVTJKU9VC8+2abkJJq6U9F20GMUVEaUSU+7Nlus31yJ/QNuYtkQ7e2hQcXO7CB3+2mIIyl82zlmdH8zGbB32Byo7wNvc63GueShuhylHMIbPPTizUKw2L0evEZ9ZJO+mXfrXFyqxqs8YhLm5CKx2IYigveFt+ueyAgjsQEpw5Mne5wpZF1ATbHOZmLKQ7BXvciAmZnA7YBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjn6nJNZnEaFBPITYaY72PHnTow04tFewr/PvqlWHrs=;
 b=R1+YjnczFkQYBMZp9y7gUe/ntzcn+lgnBTkqZU/n/HMgJp1M4ZCrs64KbT6XneVbjLEhjvLSu9vXLfiVy66vykHRZxB5W/enDme8KftDdntx8grwdsWmAn24b72O6RVlvjWsO0KOBDLyMJcIsrmVUx4y0tg1Ybxg5jo09zcwRgWtd8iMTsVYPZFyTqTQKVaXUiqR8m/cS77Vgrz+Ci2FosoxuGpO7eVEYSVsiv/bLUyIUVMb87FO9YE6qn2+aSDYdmbwGWMdP4VaZsGwwZyrWhIU6TDHOvRMRd1Oy2lTOIrB9EW82GMcZB+KkL4NbjqurRo/eTfdCFCkebQYQVa/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:26:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:26:40 +0000
Date: Fri, 28 Mar 2025 17:26:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [landlock]  9d65581539:
 WARNING:suspicious_RCU_usage
Message-ID: <Z+ZrSPZph9cDvUR4@xsang-OptiPlex-9020>
References: <202503261510.f9652c11-lkp@intel.com>
 <20250327.ahthiSoh4Nec@digikod.net>
 <Z+YQ1Un2QgAYvmos@xsang-OptiPlex-9020>
 <Z+Y8R5AEXabED4FD@xsang-OptiPlex-9020>
 <20250328.raitee2Ciepe@digikod.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328.raitee2Ciepe@digikod.net>
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: da3c9304-0fb1-4a48-b6e6-08dd6ddaa5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?a04yUrgOoVycGTlKs/7x8eyZxb2n/A50IRc8ROgfAyUzwytOrR2q7ntAbM?=
 =?iso-8859-1?Q?0p3s9Onsr+fpJo+G4dNdNDJ/8P8a8sue81AxxJcu/pY9SyoYlEDN8yD6kc?=
 =?iso-8859-1?Q?Y9zTv789iD7qubp6b00I7D8DXAAiGxLmpbb1pWv4DW3TFNBrZjCXxZYksY?=
 =?iso-8859-1?Q?Iqy+9Zog7A5Ta5wehA+DJcI6t4RJFReKIU98V4xDp9rt82Z951A7NbcXRr?=
 =?iso-8859-1?Q?gSIvRV1lH1Jkin69iODHl/vvA+o5hD8Eo1CgezLicrqCF46g5ufqf1zLxU?=
 =?iso-8859-1?Q?S1SXcDR4B4jchMho5jhAtdHyJMnSWnS5Ui18IjkvExydy6A/7RhWAXIQLr?=
 =?iso-8859-1?Q?8s9aZC8/u2oiSFu7W/sUwrrCfZm7+FmKdwAk/RypoIPCSHz7QEA/QAo0k7?=
 =?iso-8859-1?Q?sl0NF18nLVx4Bo/q+VHhNkXDKs8nV/pnYnLhuxF0YhalaBQI23nh57WA7h?=
 =?iso-8859-1?Q?+RCvj58OZba0Uks8tETziwZrM95guqAHykeHZa0ocvkH10vOO07gFOtqNd?=
 =?iso-8859-1?Q?UoVumTzTHhhwa4QRSqtq2JjJ1byBjCTpz/QZa7NPM8483dZ5RE9j66LTae?=
 =?iso-8859-1?Q?XE8bqIas9O98Wvk7ftU7X9ZWcU3umuhM8hqLKrZRTimtiJgzuXZ4nWT2wB?=
 =?iso-8859-1?Q?z/fjMe4j67uq8T/gdXABTgTRHCfACHOCdAMBVK1dh19vA/OpFN5kx3piCL?=
 =?iso-8859-1?Q?USRekRiuyWScvBFCWMB3XoHwC0dGB04pbe7QgMCK4Mb7kMo6Em1VtfsO6U?=
 =?iso-8859-1?Q?E6cOsK07G/MAtUk/UtWwlfgIpRltPsyryBXdr3XsQHtU3Wo8krX0z5kffp?=
 =?iso-8859-1?Q?Fj/KFhlfIxg39vnmyO9CtJwhRABV6Kp5sCLm/YQvOywT73SgCrH9Wi0i8i?=
 =?iso-8859-1?Q?1JOJaYNYGLJkFNr3yiLtKlRgprbR2nI0Dympi78UN31kax42sO79I4f85v?=
 =?iso-8859-1?Q?d45XIFc2lmI8IpadOrOJez7jwDeU0VQWGd5nBAksMHRFrd7LmrYwk4NE+W?=
 =?iso-8859-1?Q?Uzp6q5ywwe334++b5t57QJkEyn2jSX5QGjrVomnqcRU6eh/0206MkLbkWt?=
 =?iso-8859-1?Q?Dahx7ktcDgYYMAzeX//XK5kPIpxGSVVaG5JFdMjRZawHD7QgqNkA4aMh7D?=
 =?iso-8859-1?Q?yTYYoAEGNpClmG/YK39o3lSh1NlE8V8jz6JnKl5jUWnFmBJh/rNtN4Pucu?=
 =?iso-8859-1?Q?BYwyMLeemRr3HPGLhE5OIgPITKhkPoyLqVeUOXS+HJ9Pbpm9vFvwaMkQRP?=
 =?iso-8859-1?Q?6VSCP6o/1vZ8mgN8VZCYS0NmPmUGCnAdzNt5E2dYqJsuvzv+a4CbdS8Ogt?=
 =?iso-8859-1?Q?yp2XB/8tvB0V++dBCcJM9JTNgKgdb99q5YErJifIiTvmIPShXl/m3YOdeT?=
 =?iso-8859-1?Q?sZGXw+McgshHhvQMIjE62c/4XGEmi8Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4hHkpqGrh7cejY1U/r+xESG143eViMe5MQGq5dWPnnkNre7PyLDZzBtEHe?=
 =?iso-8859-1?Q?baxeY+s93jXHMlocBKDFQPeOC67H3oi2oo1guYeNajTL2YBXeMM/JxR3oL?=
 =?iso-8859-1?Q?A3qFYt3eIWzSLtesQNUUKEsaOtyWCs7buMEs/TfSr2V7M2/JLzxjrHuwXu?=
 =?iso-8859-1?Q?UVVxMgtjkr6clxiyjBMsJyJ6o0/ciheCxjoRfVILPCPx+F/5FXaEAKqgyE?=
 =?iso-8859-1?Q?CkY39Gw/VGpUdGKW9tuVajFkV4wzvNnNo5EC5clLjc0G//E9EZe3Wsbyay?=
 =?iso-8859-1?Q?VY4vDbGTJ+vVJREj/qT9ZQ4Jy/KJxbCJoEBBqp1G4DVMJLTrcHBH9cXFmf?=
 =?iso-8859-1?Q?IymQ5hhJNstTCf5C5HTFfHI3aCSTBZYCU5qURXlfuoIcKHCck2i+wsrlEA?=
 =?iso-8859-1?Q?elZQ1YOjvLGCODXlIVOee68zbLmRIsCT3wzcY4B7ePOjvwBl+w5s8t0dOR?=
 =?iso-8859-1?Q?l63f1sZ80pQxQFum79rE0/EYHR2og/R21cB/NN4H7SmI8eZiKGcaRiiunJ?=
 =?iso-8859-1?Q?ah2LSwhcEUBN5vLCuK9FTt7/AfoDdWHDbHHgr4rETP+Rbl8mJz007c4ogT?=
 =?iso-8859-1?Q?OLWomj5kJHW7NvpUOafFP4q6vPeuihj7M/LSyibXb+EA+JEZnIFKUjmzXm?=
 =?iso-8859-1?Q?LFdTmqLbNksT+KJvsAptkntkktOILQW9X9yedWBYoCHIGD7ToHiX/EloD3?=
 =?iso-8859-1?Q?6x0wgXn453wfxcl/XMRGxlIudI9D8nx50DSA9nem4x8KHL5A7wnMA9U7jQ?=
 =?iso-8859-1?Q?To+UefesVk00S34dW8wbqVRwBpFh3EyaWynsQHYgFnQTcMV6T3ARiOFJ0r?=
 =?iso-8859-1?Q?JCfTYTMMnlVilM9eJut6BcAToT/onPXDeZh6/azVXg4TI2KgMy5xovFbwx?=
 =?iso-8859-1?Q?/maCFYaPK0jJzPdv6nFP71j/HSwp23KRzCUM5vL5l7sIRPZaqtVQqlbtaB?=
 =?iso-8859-1?Q?8qJocE+4EeDgPy9VsuUGJY/9DKmJ7mg/CHdEkhOlMvvWxFI6Ebp6YEetGj?=
 =?iso-8859-1?Q?/pHSo+WMy5nx0D447OB5oSmREKugAHLuNO18uuuo/Hihquojqorzv1Ccjq?=
 =?iso-8859-1?Q?MNG47p29WJdS1KH+DOJnpqsFuuJGPA+2jVPUadk4hb9k581z2rsGs2iHV0?=
 =?iso-8859-1?Q?V4mjaKVCG3ygxwkUwz9cuMNJEKRMXogmvwQqL9WtNBMx1n/9nBOVSYPk0B?=
 =?iso-8859-1?Q?C0V0LxujE4bUDPka4Rs4oeWwyWdWvMqdH8qABpsW5159keoeOpHXzC8xGt?=
 =?iso-8859-1?Q?T8wZQh83c5UfYV8cPoDH/HLTySYbl3yjYeYSe4f0XU92uk8aSAps109NFE?=
 =?iso-8859-1?Q?SBVOejg6uppwfGsoteqq6f2sAl+83h1vU7aAw5JKbTQ72d1zXYjEHkdaE+?=
 =?iso-8859-1?Q?6wPB5MxlJTZO5/m5HsILrrpyvNmF17loUF39gNav1soe92hOQOfOFVOap6?=
 =?iso-8859-1?Q?ac2GbjWwgWNrr8l+A0lksjXC2tKqxKVcYLInbgs40qdU97rjekMZyqHohB?=
 =?iso-8859-1?Q?fMqu4UD3rNCVCWqFALNAg9s7Lvkk7MQ7kV0UhFxQiXGh9oDshO9uV56q20?=
 =?iso-8859-1?Q?vqJNK+4gTvd6EWGJfyptGIDfPFtcuJSHu3TlC83x09YMBzZEVvzPS2ItTV?=
 =?iso-8859-1?Q?JNjysGku6N6XsPFG0ipxbwIJvDH85aeBgD4swxC6QXni6detm1KfkDyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da3c9304-0fb1-4a48-b6e6-08dd6ddaa5a7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:26:40.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjnhES8d3HgXaC3wcdHhUnLEWtTRRAoF7EpwKPF/Emwt7YLkJYJ/u+/YLTRvghhD9JZRr8Opvsf4A7AzdPvp7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-OriginatorOrg: intel.com

hi, Mickaël Salaün,

On Fri, Mar 28, 2025 at 09:31:15AM +0100, Mickaël Salaün wrote:
> On Fri, Mar 28, 2025 at 02:05:59PM +0800, Oliver Sang wrote:
> > hi, Mickaël Salaün,
> > 
> > On Fri, Mar 28, 2025 at 11:00:37AM +0800, Oliver Sang wrote:
> > > hi, Mickaël Salaün,
> > > 
> > > On Thu, Mar 27, 2025 at 07:41:08PM +0100, Mickaël Salaün wrote:
> > > > Hi Olivier,
> > > > 
> > > > I pushed an updated yesterday in linux-next that should fix this issue
> > > > and this other issue too:
> > > > https://lore.kernel.org/all/20250326.yee0ba6Yai3m@digikod.net/
> > > > 
> > > > Could you please confirm that these issues are really fixed? Or
> > > > otherwise, please let me know when I should expect (or not) an email
> > > > from kernel test robot. :)
> > > 
> > > ok, we've started the tests for both issues. upon the commit:
> > > db8da9da41bce (tag: next-20250327, linux-next/master) Add linux-next specific files for 20250327
> > 
> > sorry that due to unknown reason, we cannot build sucessfully upon db8da9da41bce
> > for both tests (which are using randconfig). could you give us the commit-id
> > of your fix? we could try test upon that fix commit again.
> 
> The new commit is 18eb75f3af40 ("landlock: Always allow signals between
> threads of the same process").

it turned out the build failure is due to my typo. shamed...

we finished tests still upon db8da9da41bce, for the WARNING:suspicious_RCU_usage
issue in this report, we run the tests 20 times, cannot reproduce now.

for the random issues we reported in
https://lore.kernel.org/all/202503261534.22d970e8-lkp@intel.com/
now we cannot reproduce it with db8da9da41bce by 500 runs.

we think both issues are solved.

and since db8da9da41bce includes the 18eb75f3af40, we won't test again upon
18eb75f3af40. thanks!


> 
> > 
> > > 
> > > if this is not the correct commit to check, please let us know. thanks!
> > > 
> > > > 
> > > > Regards,
> > > >  Mickaël
> > > > 
> > > > On Wed, Mar 26, 2025 at 04:00:12PM +0800, kernel test robot wrote:
> > > > > 
> > > > > hi, Mickaël Salaün,
> > > > > 
> > > > > we just reported a random
> > > > > "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN"
> > > > > issue in
> > > > > https://lore.kernel.org/all/202503261534.22d970e8-lkp@intel.com/
> > > > > 
> > > > > now we noticed this commit is also in linux-next/master.
> > > > > 
> > > > > we don't have enough knowledge to check the difference, but we found a
> > > > > persistent issue for this commit.
> > > > > 
> > > > > 6d9ac5e4d70eba3e 9d65581539252fdb1666917a095
> > > > > ---------------- ---------------------------
> > > > >        fail:runs  %reproduction    fail:runs
> > > > >            |             |             |
> > > > >            :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage
> > > > >            :6          100%           6:6     dmesg.boot_failures
> > > > >            :6          100%           6:6     dmesg.kernel/pid.c:#suspicious_rcu_dereference_check()usage
> > > > > 
> > > > > below full report FYI.
> > > > > 
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > kernel test robot noticed "WARNING:suspicious_RCU_usage" on:
> > > > > 
> > > > > commit: 9d65581539252fdb1666917a09549c13090fe9e5 ("landlock: Always allow signals between threads of the same process")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > > > > 
> > > > > [test failed on linux-next/master eb4bc4b07f66f01618d9cb1aa4eaef59b1188415]
> > > > > 
> > > > > in testcase: trinity
> > > > > version: trinity-x86_64-ba2360ed-1_20241228
> > > > > with following parameters:
> > > > > 
> > > > > 	runtime: 300s
> > > > > 	group: group-00
> > > > > 	nr_groups: 5
> > > > > 
> > > > > 
> > > > > 
> > > > > config: x86_64-randconfig-101-20250325
> > > > > compiler: gcc-12
> > > > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > > > > 
> > > > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > > > 
> > > > > 
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202503261510.f9652c11-lkp@intel.com
> > > > > 
> > > > > 
> > > > > [  166.893101][ T3747] WARNING: suspicious RCU usage
> > > > > [  166.893462][ T3747] 6.14.0-rc5-00006-g9d6558153925 #1 Not tainted
> > > > > [  166.893895][ T3747] -----------------------------
> > > > > [  166.894239][ T3747] kernel/pid.c:414 suspicious rcu_dereference_check() usage!
> > > > > [  166.894747][ T3747]
> > > > > [  166.894747][ T3747] other info that might help us debug this:
> > > > > [  166.894747][ T3747]
> > > > > [  166.895450][ T3747]
> > > > > [  166.895450][ T3747] rcu_scheduler_active = 2, debug_locks = 1
> > > > > [  166.896030][ T3747] 3 locks held by trinity-c2/3747:
> > > > > [ 166.896415][ T3747] #0: ffff888114a5a930 (&group->mark_mutex){+.+.}-{4:4}, at: fcntl_dirnotify (include/linux/sched/mm.h:332 include/linux/sched/mm.h:386 include/linux/fsnotify_backend.h:279 fs/notify/dnotify/dnotify.c:329) 
> > > > > [ 166.897165][ T3747] #1: ffff888148bbea60 (&mark->lock){+.+.}-{3:3}, at: fcntl_dirnotify (fs/notify/dnotify/dnotify.c:349) 
> > > > > [ 166.897831][ T3747] #2: ffff888108a53220 (&f_owner->lock){....}-{3:3}, at: __f_setown (fs/fcntl.c:137) 
> > > > > [  166.898481][ T3747]
> > > > > [  166.898481][ T3747] stack backtrace:
> > > > > [  166.898901][ T3747] CPU: 0 UID: 65534 PID: 3747 Comm: trinity-c2 Not tainted 6.14.0-rc5-00006-g9d6558153925 #1
> > > > > [  166.898908][ T3747] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > > > [  166.898912][ T3747] Call Trace:
> > > > > [  166.898916][ T3747]  <TASK>
> > > > > [ 166.898921][ T3747] dump_stack_lvl (lib/dump_stack.c:123) 
> > > > > [ 166.898932][ T3747] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6848) 
> > > > > [ 166.898945][ T3747] pid_task (kernel/pid.c:414 (discriminator 11)) 
> > > > > [ 166.898954][ T3747] hook_file_set_fowner (security/landlock/fs.c:1651 (discriminator 9)) 
> > > > > [ 166.898963][ T3747] security_file_set_fowner (arch/x86/include/asm/atomic.h:23 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:457 (discriminator 4) include/linux/jump_label.h:262 (discriminator 4) security/security.c:3062 (discriminator 4)) 
> > > > > [ 166.898969][ T3747] __f_setown (fs/fcntl.c:145) 
> > > > > [ 166.898980][ T3747] fcntl_dirnotify (fs/notify/dnotify/dnotify.c:233 fs/notify/dnotify/dnotify.c:371) 
> > > > > [ 166.898996][ T3747] do_fcntl (fs/fcntl.c:539) 
> > > > > [ 166.899002][ T3747] ? f_getown (fs/fcntl.c:448) 
> > > > > [ 166.899007][ T3747] ? check_prev_add (kernel/locking/lockdep.c:3862) 
> > > > > [ 166.899011][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > > > [ 166.899023][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > > > > [ 166.899038][ T3747] __x64_sys_fcntl (fs/fcntl.c:591 fs/fcntl.c:576 fs/fcntl.c:576) 
> > > > > [ 166.899050][ T3747] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
> > > > > [ 166.899062][ T3747] ? find_held_lock (kernel/locking/lockdep.c:5341) 
> > > > > [ 166.899072][ T3747] ? __lock_release+0x10b/0x440 
> > > > > [ 166.899076][ T3747] ? __task_pid_nr_ns (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 kernel/pid.c:514) 
> > > > > [ 166.899082][ T3747] ? reacquire_held_locks (kernel/locking/lockdep.c:5502) 
> > > > > [ 166.899087][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > > > > [ 166.899093][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > > > [ 166.899099][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > > > [ 166.899111][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > > > > [ 166.899119][ T3747] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:469 kernel/locking/lockdep.c:4409) 
> > > > > [ 166.899124][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > > > [ 166.899129][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > > > > [ 166.899134][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > > > [ 166.899139][ T3747] ? do_int80_emulation (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 arch/x86/entry/common.c:230) 
> > > > > [ 166.899149][ T3747] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > > > > [  166.899155][ T3747] RIP: 0033:0x7f55ad007719
> > > > > [ 166.899159][ T3747] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
> > > > > All code
> > > > > ========
> > > > >    0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
> > > > >    6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
> > > > >    d:	00 00 00 
> > > > >   10:	90                   	nop
> > > > >   11:	48 89 f8             	mov    %rdi,%rax
> > > > >   14:	48 89 f7             	mov    %rsi,%rdi
> > > > >   17:	48 89 d6             	mov    %rdx,%rsi
> > > > >   1a:	48 89 ca             	mov    %rcx,%rdx
> > > > >   1d:	4d 89 c2             	mov    %r8,%r10
> > > > >   20:	4d 89 c8             	mov    %r9,%r8
> > > > >   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
> > > > >   28:	0f 05                	syscall
> > > > >   2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
> > > > >   30:	73 01                	jae    0x33
> > > > >   32:	c3                   	ret
> > > > >   33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
> > > > >   3a:	f7 d8                	neg    %eax
> > > > >   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
> > > > >   3f:	48                   	rex.W
> > > > > 
> > > > > Code starting with the faulting instruction
> > > > > ===========================================
> > > > >    0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
> > > > >    6:	73 01                	jae    0x9
> > > > >    8:	c3                   	ret
> > > > >    9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
> > > > >   10:	f7 d8                	neg    %eax
> > > > >   12:	64 89 01             	mov    %eax,%fs:(%rcx)
> > > > >   15:	48                   	rex.W
> > > > > [  166.899164][ T3747] RSP: 002b:00007ffff6eefb48 EFLAGS: 00000246 ORIG_RAX: 0000000000000048
> > > > > [  166.899168][ T3747] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f55ad007719
> > > > > [  166.899172][ T3747] RDX: 0000000000000027 RSI: 0000000000000402 RDI: 0000000000000043
> > > > > [  166.899174][ T3747] RBP: 00007f55ab92f058 R08: 0000000099999999 R09: 00000000377dd000
> > > > > [  166.899177][ T3747] R10: 0000000084848484 R11: 0000000000000246 R12: 0000000000000048
> > > > > [  166.899180][ T3747] R13: 00007f55acf036c0 R14: 00007f55ab92f058 R15: 00007f55ab92f000
> > > > > [  166.899203][ T3747]  </TASK>
> > > > > 
> > > > > 
> > > > > The kernel config and materials to reproduce are available at:
> > > > > https://download.01.org/0day-ci/archive/20250326/202503261510.f9652c11-lkp@intel.com
> > > > > 
> > > > > 
> > > > > 
> > > > > -- 
> > > > > 0-DAY CI Kernel Test Service
> > > > > https://github.com/intel/lkp-tests/wiki
> > > > > 
> > > > > 

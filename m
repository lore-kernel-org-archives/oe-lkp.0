Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F72701B6
	for <oe-lkp@lists.linux.dev>; Sun, 12 Jul 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844076; cv=fail; b=cNGvjKdywd0ra37fdYgG8WP7pnoRPpDm/n/o9ziYz2sqOJtsOLwGaWrttgW4NX+t2/SLw2/m9njLMsGwPtmRd6P8rR9pCCNkBhhnPjRwWbQl2lJcaKNDA1/DWIXAxSiHU/PNWCourBmIYnkXYszZ+w0VHyTN9ctzWwI3HAcBDSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844076; c=relaxed/simple;
	bh=SC7OTf3A30vc3Wu9/anAci6m5PzuCeHBTorkXdFPMpc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gYZJtENf636LE5PQ52gpkovGNWN3zNbLIimySVPNp8CXFEb67ohde9z+Pvp8eMsxeiUKbvR8NKflbc/8qgyKn4mSfZAjLiCgncrOl36B46jsXjk3uBMYeN0VklBctPhJE7JPV/Ah6mYsd7Cu8h635QTysDgf0pVvtfvKgdCWXgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmBpuLz/; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmBpuLz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783844073; x=1815380073;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SC7OTf3A30vc3Wu9/anAci6m5PzuCeHBTorkXdFPMpc=;
  b=cmBpuLz/52TRBfU/STuUXspkGjJTrrxQMWZLfLTRwoZg8r96A8acsTv4
   C6wGQBgPZCLdRklzNMg2rSiBtkfMgauUEsJgzYE05Ar1t7mHOu+3Ssyeu
   UokFfGGz/p7Xf5fyIDEWWmKibsNx2nWfeqhEBCQ+tzTnoWfod/3HXUPmQ
   lICkli4pZ4VTdk5deAfGHuyqqeGFAaSfYEHFjRo7uJ+WsbffW25awSAc5
   W9zIVANHRyWwcLiL28NNqb7Go37EBfjnzYCfWgTQZ0u/th2Xp2CXLqG5q
   vozKDhWyRVDULvakRvy1V1B9T4zcU/C+Qmkse9GnGuFxYf+0SwZ1kOc6X
   A==;
X-CSE-ConnectionGUID: Uf/d4LNKQLmBMg2uKePP3w==
X-CSE-MsgGUID: mdn6weffSESByIUShem1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88392520"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88392520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 01:14:32 -0700
X-CSE-ConnectionGUID: 07NlAXRtRtCphhTMSA3lsA==
X-CSE-MsgGUID: Acws5uGOSrqzBp7F1CBRaQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 01:14:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 01:14:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 01:14:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 01:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zeva5FfIDE5+LplhnaLyUrFtETOq102UZrpKJ/xF+dDhnJdgCVEUAdvocWpjyq1I3vNF1t7r7qUI4xs3EXLPyQX5YIHQa/Whn+JQJp2xbNUMgfm7tT6Iu5Cl9JH1YqJX/50C4mqiE9GIN3PXIMskwwAJ9wGsXwTnQp1kYWzNG4on7mxGukzTir2ZKpxkdqGcj7eWi8SNxPwVZbDGxO2lvuu+euxQAEXEBuGTBWmDI7vxKIAbF3d1tULlx09pGJhMxNkk581vqWbhDSLDsGL0citJSoAtOY9YEQwXYzBFCF9ys7scJCSOMktN2U1nEB/gxOVOXVnSJN6VxeeHnxv9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbEA5BMnZC4e/GmDJu5PBFB/lUrrlHoqxyiU6sCQU9w=;
 b=dF+vrSKdqCYo6B+L0Iq1IBKhrQGHmmVdnPlosM00jOVtYCrbiGWp7OG4Gy8O3uUKg5pzZQ0wkduawha8XEAtKdqFX0z1t/VjRvCdoZ4/To9cslC6yOLJUT3sqRfJ3z92S5dbAVK2DaRKgqPY6CDTsDcAda3rD0M7ksTlyxYn/35lpFsNB+UR1x/yQk+F7wbxaQmfFXN9vmiMc+hg1xPb432Zx7bI7taEky9orEWSq8zOpHMl53s8hw2mC0V9MSw8rkxQmVjmh1iFaZXX4D/rX/q/RGL/jAzIUFn5qaUM9eQzfmo2BoKI3NPd26OKfA9Tsox6tCEDDfpy1M1LM1hpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Sun, 12 Jul
 2026 08:14:28 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 08:14:28 +0000
Date: Sun, 12 Jul 2026 16:14:20 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Harry Yoo <harry@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Danielle Constantino
	<dconstantino@meta.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r1] [mm/slab] 6bc21472e7:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <alNM3IrEyzGkn3Rn@xsang-OptiPlex-9020>
References: <202607091002.cdfe5a08-lkp@intel.com>
 <afe80d38-950e-44d4-a729-61aa65d3c117@kernel.org>
 <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>
 <292ffec0-6a6b-451d-8977-3a5217c65d2c@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <292ffec0-6a6b-451d-8977-3a5217c65d2c@kernel.org>
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH0PR11MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 0921da7a-464b-47ad-252a-08dedfed97c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1j4mVue2XMlwpgZqJ3eFiqBG5CH7IF2tOb3m5/HjkQmbMl/WZGLXZIjce1j6VO+qem364qzw1x5lrTURK/cBStOXg9AtxPJhEgsprm4VVMxPhcCJBV8TxYL/Oh0mzljjf9JAV1Zz/9NZbtLPHQo4BFIzyR7GlieXTmO3miGZonslQ4e9U4CHyT5bw/wlUn/4KSHgIjqKc6pTs7kKDQXbLtyo9EqXsH+3ntuDxUmTcf3hHFmkelSWhO6yXYfQ8IXecxVVy90c+lmsLTndIr1YoFe5Wvyhi4X3kQMU5gTHCc+snegoB6kxu2jLN+jFNQacasKEWupNrK1GgEkbSdC3y8hdpQLo7pNIdAtwenbPJt2gb7L5Txgc9pvYBxClIkxreYdCVtH4QQBSbRLxilOTJsaOPwNfrfuWKH+JbCE5M4A9m0w+2mtbJKUotywOqqC+abPB48lc88BJ8ob9fiwRnMc82boynmv/IpPaPnOBrtyfwyXHzCOTu/0WjxDeBmjrREWJ2dKozb+Q6CpSM1uVveoOoEa2IlqwZ7S2+2bTPza7L828elKtJzUjon5ngiwCxhbvKdvNCg6Dh+UrU1FTIzCYE4/0Y7mAR3ZANGZ+O/uFxe853tCZWApCldiU3JJP00DV5HhNv/aoOvo/xEE2ny/nTwiXpMcBZ5N7K/jUFxE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xqwFqZX55qZk7CJXK0lk3h/kZNz5jfLivP/KIcT/v80zb/iUJvSHgk5NmTJP?=
 =?us-ascii?Q?3iAkRir/5hNophSQeUw9+I70fP+1wSRKj0dwzp2erVBRlukfLk/lvwDAwhuK?=
 =?us-ascii?Q?8FeIjMPLP23azTQ9lzpVfFj/4W/57WtO9bZ3FtBmMZssIN2y9StFZgD1FlWB?=
 =?us-ascii?Q?CRPxgPlDM0uz2DlbOpHKPXL4jIyroDgK179JRZzzvLyOzGVKrIxdjWPR+AXL?=
 =?us-ascii?Q?wJerA7EET5IHSZJXPmDfF2g3uiFu1S4XHnyZT4Fz6sLofcfi6vyP+m3g+ZxD?=
 =?us-ascii?Q?D4bm2CvxnAVh1M0oHttAMudBmwOdkWMWsyaB2w1jiu7KG70AdzOkW2n8o7X7?=
 =?us-ascii?Q?giCSqnOVSyl4zS2w+p5QZNyY1kgCRbZRzEZdjwZIAScPbegJwWyIUWfLITkZ?=
 =?us-ascii?Q?wkZcsD+kA/8AOe61XLZukIVZCRm9kju4BVOZY22TXsdrHrHx6yklBKo+gbQu?=
 =?us-ascii?Q?URQX+3LkylUIjeJMDyjURCvmG0fDDM3gDTrBBKlv3ssnPKc/cKS5uZuTqZZ6?=
 =?us-ascii?Q?WxKD0DFQCMVRUEV2kyBEb6ZV+VRFzzlpYCTQABAUne3O34Da2E0bkDUBkd26?=
 =?us-ascii?Q?oe0CfKvVDOD5s7slBYHiqY3rLGAT7J86CUnBIRUdqmTepAXBnxw3Kl9mPyse?=
 =?us-ascii?Q?1ENDdYKi/TiwaWyLAyZXULNDpCkcoTRSbpUrMCEcXdb7LEv+1LMmnqmVm7+0?=
 =?us-ascii?Q?MwVGh2f6zVv2rNguvzHEbPRuGn9C6ZQyjz9GMqETc1kCv6LfDqVcvIJcHqQb?=
 =?us-ascii?Q?dW5hDPpoXegRcON5nMBlcILnlIpZ4BmKEKYyDUZXt49WBrRP5Jkq8UOWFy6H?=
 =?us-ascii?Q?xTBLJZp7bs0vum2EmnxDf/aLAFMF5s7STr1uF+aqpbxWn0jPrGnIBcFxC61Y?=
 =?us-ascii?Q?81IcLN6tRAjdgl2wgde0RDcSfonVvIkhqqfCAyQzTQThUDZtNdnb+ZzjXF/g?=
 =?us-ascii?Q?HRD+ZZG69ZrSELp3r10409AelXABXTBbuNckzljmNlqpaWGfveZxBFGeHDlL?=
 =?us-ascii?Q?WwIYX7CK5MXSQZWfX51vWcAaggF9vPTGv1JxfCzHlVDWUdnrV33XZdGCFaC5?=
 =?us-ascii?Q?7H+Dqwnish4nV8ZsdXK1p8YBenHJR/ipKYclHfVu7A9JgblN57e97OVSSBr1?=
 =?us-ascii?Q?XT8YDNP6Hw+9FfCJRfghG4rs4lWvAes8d60yMoyetE05lmxRmfp9S7fSdBYE?=
 =?us-ascii?Q?WoNhwcN9+LHgtHdmkMQ6LvGIHqdmVmKuGMSE/89LpLBFT9CYxOHb7JUu0Kgx?=
 =?us-ascii?Q?AoiPv33V1hPAVJX6sJtXtf+dHMU6LtAdCcHrMloP9xaqh72nicAUOF67mKnm?=
 =?us-ascii?Q?aJU2M+R6Aj7sYCZfJzrz7CTS2LuuLkdEjoqbY4tsMTmShPfR9DD4N7XjSo4F?=
 =?us-ascii?Q?CYHZbe5SPPyY4SUjYdnV48NsSDfWCpUMcfhpxjhKvODXFcEJd1Dqsll532sX?=
 =?us-ascii?Q?uALrcdMrw4GlBox/bGQv+9BHbDOXrgJnfzx/Rqjq98azch+SlUT1wVVnsP88?=
 =?us-ascii?Q?rhzq2V2v3Yj3xb96u9lOtTX+E8F78t2tjpYU2ITKIspVe9kG+dLA7ZEUPni0?=
 =?us-ascii?Q?hcxzvorHX0EzOcb+lfbjJeWIax72d2gkSj++ULNGwUD1LEMRcXz7mbl2NWrI?=
 =?us-ascii?Q?OwaGDEGYfyBJNrsTtAtNHQVFy2m5GrQYhvV4UxTKaK4DCVUTI3JNny+CXgT3?=
 =?us-ascii?Q?fY3dNUcoV1laVEBVg2Q6qL3M3loyxt7ftbPKAjqWie3KvfmqERLj/5f8nKfO?=
 =?us-ascii?Q?f6aKscz7ZQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: aCA2FO+yesfs3wH14PzIN0XRyQ4KA4bIujrT/fGFT+WIAItsmPiLzPXl4rPRSjRUyvlu0tuPHfvql/dxcPamqdu+4TrKQctndetqKd+vr5hqSFxpmUtN4XrwTTvOPnQX4pDi0UtPas0G5Kq3TvpHcsZwoklKDxz/UBbRxmAYjzhCk88SeeejPBaDZULH2F0N8bBQrzzy9rfiqpWruVn1fIHPTglD8dkd5bqvkJ9GckvKrzcOpHgSeCO9sMBxrDoUzxjgxf6P+SOTJ16pIfY6yS/xiCTd2DIQ5VeQFB7wkAEWnqhWsd7g9AqDsh7CJTfu+nTmdf3S9JIGzHWeGof/Cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0921da7a-464b-47ad-252a-08dedfed97c1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 08:14:28.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXkcwOXdPZA5kxQjT6pkSILnyyYRVMUFjU1HGwkkJ1ogV851rH0OBoLXa0NHK97aiJp//sGQuc2IH5Dms+ABrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
X-OriginatorOrg: intel.com

hi, Harry Yoo,

On Fri, Jul 10, 2026 at 07:04:50PM +0900, Harry Yoo wrote:
> 
> 
> On 7/10/26 4:21 PM, Oliver Sang wrote:
> > hi, Harry Yoo,
> 
> Hi Oliver,
> 
> > On Thu, Jul 09, 2026 at 06:26:54PM +0900, Harry Yoo wrote:
> >> On 7/9/26 5:48 PM, kernel test robot wrote:
> >>>
> >>>
> >>> Hello,
> >>>
> >>> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> >>>
> >>> commit: 6bc21472e7eb9f8c771ffdf86266aa6d9dcb1dac ("mm/slab: prevent unbounded recursion due to obj_exts in free path")
> >>> https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r1
> >>
> >> This is v1r1, and I posted v1r3, because it was bootstrapping sheaves
> >> for normal kmalloc only. This crashed the kernel but was fixed in v1r2.
> >>
> >> Apologies for the confusion, I discovered bugs after exposing it in my
> >> tree (force pushing isn't great, you know...) I should probably have
> >> deleted that broken one, though. :)
> >>
> >> Will be posting v2 that fixes false warnings w/ memalloc profiling
> >> debug shortly.
> > 
> > thanks a lot for information! sorry that our bot still cannot analyze branch
> > version so far.
> 
> No worries :)
> 
> Is there any way to tell the bot that a branch is broken,
> e.g.) deleting a broken branch from the repository?

yeah, deleting the broken branch could be a simple approach.
bot checks if the branch still exists before final reporting.

thanks!

> 
> > we will check the latest branch in your repo before reporting
> > in the future.
> 
> Thanks!
> 
> -- 
> Cheers,
> Harry / Hyeonggon




Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F27E
	for <oe-lkp@lists.linux.dev>; Fri,  3 Nov 2023 02:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+y/kFE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698979066; x=1730515066;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7IrISC3+9n8SmVuFxjig71ZQXhWQ233hD0x6bxfy0q4=;
  b=E+y/kFE29GHj5DEBfy76pVrLJYSngTIWFTMVOlfWFGlZ2SV/KI2fvln5
   yGrWGvCA4rHcoO2gOK0+LDeTapu5m3tVCFnNMpZn3fd3a1QF8hPmZJesX
   1InUfxNBtldGhqpbqwgYEwccx8v2o/6jgJk6bFaZ8hehHh02AGsCi6dG3
   Wny8kaOAzeWZfrWEiMUllJlc/jafTWyjCLzfN+4EASvHlk9Zj1C5tpYXN
   F7hVAEK+QzXiTvp4X3cuHH3SBkz95toBzD4/+ziWQnQs7XTPku+uHis3S
   ZzqUP2xdqhXsRg1n9O0BA4KvgePmbSCAki954X39nRyE6z0WBb2cL4Hjc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369069625"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="369069625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 19:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="755006325"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="755006325"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 19:37:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 19:37:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 19:37:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 19:37:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 19:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbCzppYfjTZkcJYod95MopON1EjeuIXKNl3DlmeGIWb8FNbxOlu/gn69U+nWiiedlXN8WC7UJYO3IOkz7mLombkJif85LXfMzuOQwxg8sf/ct4asMXKi30KrOsyPhc5jY1d3YMTNjtE6Np0eFj5IpeRGSoi9JSRHZeqcDengn4PnvLuu4rPv+svOOdXAKH8l056X0X3wRyNl5XQ3QgS4PMgrt+uBHbFwWCL6geXT0HgAExWUCc8+IFNxMxHFZoxxMdCT2GynEFgjBz4FLZULCsAlxYcuH2QvOPv6L1Aa7gO7EgLpk+KNTlwl4dvjWSYHu8u3F5zCDwA4PdmkZ3tgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b6ioJFGHqD4teq0t958JJRkv44Y5QpDDIZuImcCA7Y=;
 b=DZCfR/uPHvnZ9wT0Ewir6jlfEm3fbDHhsdsmK2Q6BuluqQaxp5bUsRTXM+qCtroJmRq7LpULEPk+Pp8M1L3vo07g8dbqnRd+eV328OiOMwKYz9xf6rMmvOZ+ODIfc3IrcLjp+x0V01Il2Rm1wcgMULIaI8yfbw34ALpzzVF2tLlS8UARm906Lwm64hSuyQ7e+Pym40JLKk+bjZTK7UFHJr0gUdPWgFWJIoSZzsF7f9Kgoibcszct6eab/uxkUqUfq9nwsvzUlNoenIuhmN/cq9p/u4eEoLftJ0CRd5KIVvhVXUBWOKtIbGkhVz95ivAUJBRHWOy8TdZEGsDXjSUUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH0PR11MB7634.namprd11.prod.outlook.com (2603:10b6:510:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 02:37:25 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 02:37:25 +0000
Date: Fri, 3 Nov 2023 10:37:18 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH 2/3] maple_tree: use preallocations in mas_store_gfp()
Message-ID: <ZURc3u2BdMWulbpr@xsang-OptiPlex-9020>
References: <20231009201639.920512-3-sidhartha.kumar@oracle.com>
 <202310251706.6e6f6c4a-oliver.sang@intel.com>
 <20231026171635.3xmpba2cuzjhkcxg@revolver>
 <ZTtRqO+lddA+7nRv@xsang-OptiPlex-9020>
 <20231101165914.3bqsjmfbqwktlalz@revolver>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231101165914.3bqsjmfbqwktlalz@revolver>
X-ClientProxiedBy: KL1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:820:c::12) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH0PR11MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 424e6367-6574-4128-02b1-08dbdc15d034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2Y8iKAGCcDEgcShtdxP+DHvqyRH/ZQjjz4gI1KSBuWOMcwprqYrm1JH2HWmLhxWV/wqsxmHDrts/Cm1yM68r+m9vebPj8tB3D/PmNdIrg23oYhXnzoc9Q9LjIS8ldH17bDhzi7yEcaE0OEVuRdqoUhdeNR2NWLIjIkca6OUoleyoIgmLTbPa/Hbo+Jk6UmUrtogGZ4sskkvnlA8EMFaVOG7Uf8IC1XyYcZ4Y31mF2JYSK6J1lJ2qEOT3N0D/+hf0Y2RLaT2tuBKgqmC+jjQDNoZdqscE0r8lIBUetSsip/bFlramz2HetiTk3b29tPfv+w0Y4I88L08MVUF9owEiPrWrZ2aa1u9oGTcUqW7Ddj+pPF3Ku3R8mUblJE1rsEsXR1yEbxLpYgmMFJCB29cNIGzwciZlx1X3aJXp7D/2ciGJIIPzabLlnWD88Qq3gexyqZUbqZmrBVTxDkCVyUkRAR74fIwhRt2rLmnRuh43s9zKFZujZgGnJQI4hveS+0K2YhSRH033K4pmrrArCgkW17YZYzfC0/qNTK2KY9FX6mSe5tTJC2h6PWP1UmPNJFv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6512007)(9686003)(478600001)(6666004)(5660300002)(44832011)(33716001)(66946007)(41300700001)(8936002)(6486002)(66556008)(4744005)(4326008)(107886003)(316002)(6916009)(66476007)(8676002)(2906002)(6506007)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGZ3LYGLUEdFiz0IOBj3S+h5gUYBGBxwtWJfeH31OCrB+IZVkBJoSA7GTlWT?=
 =?us-ascii?Q?FwNCW1JnZgi2dnEdEBEs0H6/5z5w3Q/X/Zil/vLtDhG9W4yOp7ObLCbVuFuG?=
 =?us-ascii?Q?tAiquT3fwFPCttj8qwsH+QfcYcX8fdtkmrOcGIQZq6OcuZjckCpbd0glmrvu?=
 =?us-ascii?Q?Kb/0Zu0XXbjXw+Vr205JVaANYtiwBawI9r24KAxZL97Ei2G92w+6U769nLKV?=
 =?us-ascii?Q?tGld40oZWFWCDa0gsa9nEigXU1mg0rp1D27sWisUGCj7nqXP7VTI2RCcoPTU?=
 =?us-ascii?Q?UphxtFOchAaXk+Z+YFTkAimAAEQ9g3cpvoPRFj1k2tFF5LylTsYEfEyC2BmI?=
 =?us-ascii?Q?hT6hCSwew2VRd0GiyHKk5EU5xe0ICH28HUNv5/o0H7rgKn9dFakotWccP26Q?=
 =?us-ascii?Q?LAVxlfCzll7Y+OdupA6/RPLXmbDkY1RDpWSNYdEci7mRDC1SmQWWU+vcrEqs?=
 =?us-ascii?Q?Y0WDRLr0UcbyKh9LRu2v8sCdh7Q+nV980QAMRgJSAAOBGWj+nx0tOwFYZd7m?=
 =?us-ascii?Q?hBASvVSs0VMmtYj6I9TnXOKSEyccZfFniPcAG10oTG+XDsGD6G2LmhZ6X+wm?=
 =?us-ascii?Q?+hqaHIpTKkb8PDoPOOAuOF44IjlK7/h8eHxJWO9fg8P23/07MUxfT9RjUYNh?=
 =?us-ascii?Q?s1y6x4AUtU/V6lj7qeZ0wuTqU6PoUaafrkg37nEhr3G/16aCsLklC3xHSaKr?=
 =?us-ascii?Q?o3wti1QtjavtXUJ6l9v90zu4kjWKAtngVh4f0mmd4SmmgfWBZhmulAiHK0ey?=
 =?us-ascii?Q?Sc9rI+scgKvkyZrZ5Hlgd5My+CHo6L74D6s4HgBnZbX1JwqQWete5F/NpzJ2?=
 =?us-ascii?Q?vAX9Qf+YZPBuJOfOHkZHDN6eQLLbC1Ttj/HwBJdGn25kdv8DvxSEHL7+oUCk?=
 =?us-ascii?Q?TBGBMMbgAD22UFlw7TPWSPazyfnZsuuWU/voKh0FhToqQUC4LDSeoMg0QbgI?=
 =?us-ascii?Q?RwzMlyE0eTsYZd/kDWuPh3jAMGyM/9gU6qLgBSZ4yei3dxV1gsCMmOEXbq5a?=
 =?us-ascii?Q?SbJj70gDfiWz7jVC9m1jiyvYNsT90DO6X9zEAhinuu2H2YeB3yoLKZsbXl5V?=
 =?us-ascii?Q?utqu+qJfFD6dQHsinKo3HeWHP7FbRHxz9kOiEcPzNib7bUNOcibGnEY6SrqV?=
 =?us-ascii?Q?SVbBS5GcJYgdmqeMgzqwwsm+NNIJmufhvR/ftlw33vkOJR5YYLmtRJbi6LKQ?=
 =?us-ascii?Q?COxlVKLpZdWKSOLb+qxqV64b9tLpA6nyTPGfGKVkxMucxwPynQAnxwGptyA2?=
 =?us-ascii?Q?BdWAVDaINH3Qf0r6k/BpDCNLCy9QTTBtkHGhDCxFa7kl57lT47LRQ6Cyyszv?=
 =?us-ascii?Q?2qOOybeXsjAji6+oEHjeGWfCw9Qk/jQNHDr7oLP5tnHDI+wYQQGEysiBGiuA?=
 =?us-ascii?Q?KVcuIzrqb2+DSpnezzs8tdXYaWNUYj7Y2zgMVhjq2kLpwo0vNVdSKEKCo6zD?=
 =?us-ascii?Q?aG+Ag9KTUS7lbuvEjBQ+daEbvpkEdDRyL6PTweo0cuE9OtRsA3nB4GOTEtVs?=
 =?us-ascii?Q?5+BF3pNPmODM8OYWHbA5maHcGxbtAVgxf2kd5U2e/t3txjljXrljIzBJ8mxS?=
 =?us-ascii?Q?tF04naCWd5hC8z+aMwcLfUhnkLfHprUXtY4CZUZGUAgoKelMUhil4JNldmxe?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 424e6367-6574-4128-02b1-08dbdc15d034
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 02:37:25.0330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r5f+uytFkV5MWrRkLsM4RqnQ3OGBSR3DTu+a1IxS+WYikMcSSGgeB80pl9vXtrQGiBJ9AyIjeZlv9URdruFiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
X-OriginatorOrg: intel.com

hi, Liam,

On Wed, Nov 01, 2023 at 12:59:14PM -0400, Liam R. Howlett wrote:
> * Oliver Sang <oliver.sang@intel.com> [231027 01:59]:
> > hi, Liam,

...

> > want to consult if it's ok to send to the mailing list but not cc any
> > individual mail in case we find regression for future version?
> 
> No, no change needed.  I can NACK in the future.
> 
> Would it stop if I replied:
> 
> NACK - Stopping the bot from testing this further.

got it. Thanks!

> 
> Thanks,
> Liam

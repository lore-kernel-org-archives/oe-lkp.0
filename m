Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15900155C98
	for <oe-lkp@lists.linux.dev>; Fri, 22 Nov 2024 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732254978; cv=fail; b=R8mOl0h1Y3qZ8FE3imopazu1kHWhQJrCrYCTkNvykldObULQHsOj0l8YQZ8/NG0DnsuD2HHakHixbz9U8E4fz+3EtW6vHCv5WZEiAEqYmfgh3s34Kg0gfYLXFFF1ROeS9NfjJw27uS2tZmG1QCCj6qKpfVrqX7nh09l1RHMSXBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732254978; c=relaxed/simple;
	bh=sXhVEiXRmh9w65lt4U7qoITKolR6JL8OYw4GT5XG80Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PngSxlbwTT9WYWhC7j/KeTnhuMDNTMVwAp5Qk4+A9RgLkMLvlG2esdsR9StIkqx16sZawkUc6BgUwFyMqdWoyMkg4JwRAwcLUfWdnpGEi90EgCoWpybTxfnOKQgo7YslcpMZZcF7sZt46zG30gaAjnr9wbL3+MB/ZnaZAD9IFqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMXYr/xR; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMXYr/xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732254978; x=1763790978;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sXhVEiXRmh9w65lt4U7qoITKolR6JL8OYw4GT5XG80Y=;
  b=dMXYr/xRoqybY9wXmR1gXi3yo6EbUMQgNc0UI38/66o/p9zSgKtY8w8O
   bFFhSAc0FzW5aV1fK5WD4Ne1tc1YJrbLMHFs0Gh6cJCBnqIzaOS9G0jZ0
   2mUEmeXIOuW+ezj8yNZeZCFaTRcanstaCdhcMl+Oh9ERM08Eqy/v4GIW8
   hH7UxaKzyK1+zQGgWVXbc07GAUk33lEWLt1bbQqJE2lckD5Z+4DjDnyJD
   NDsGHpBSLSWrC7yHfBW/ZEHCsZ3skbR+8fzpM70UR5SBXvt2QeLNoeSdr
   RYVsi7Fg5mD2I5CAECWs5z7/CUkZUbIICA+pjQ6nr75A8DF3jjtHzBqZ5
   A==;
X-CSE-ConnectionGUID: DsXVjAtxR+ecXtRBPmkq6Q==
X-CSE-MsgGUID: bk7JEedMQk6x1MZuGfJQdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32324665"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="32324665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 21:56:18 -0800
X-CSE-ConnectionGUID: EP32XGOOS/+utVMSjZbyjg==
X-CSE-MsgGUID: 5fgiurEtRDCawg49T7utdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="121348858"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2024 21:56:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 21:56:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 21:56:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 21:56:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlDiNdTGdQDXIUx2N2PHV5LTl1aoQYPil96HGNOKKKGA0tSJvqY7WOlSxSHvqr3hWl8th7XnFMkUBaILv7NRlG7mEQtaRvQkbPmGYWuNCmp2DSSOadRZctUzmmB5rcKNCx18qURsm0mDo1y3JCUUM8k4Sa9/bFjOLHbK6MwgaB3TBe5TAaM0fhExIIgJWQ2f+77KHJ+aRB9KKs0QrW2KISLGuZqUV+ywdVnT2k6uziF5q9JJUaWVzJEI71p8Nrn6siPcsmLIivBXmbzqnYBLByEfKAx2YDnd+Go2AtqMy8FE0s17kwn4dLypNXR6dDQP4mZihJWRgylAGBEwqa8Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCpv6TqyypUhoFdWVNZ3Pi3eUwPfDt4JY4WI5Zqz4OI=;
 b=p4u18wFpNsLNqlXkhsXPHaYuDe/kvMv4TPSloosKo18Wn+83UlpD6hu/sFNLZzj3FLlhzlzVZSkELpp3OA3AlicqLNdEWTjWfjplvN3pJW+Mx3wJTZsGEP/okBItwo0VM6XvGfphu2pRrXgwZcjUgxHQtMYbXFLIivtZIFPMVBunkEVlbXdtvvZymhAoYvC2ZuomWZy/sIDxSSnVgAxqzL/MIjU8gcu6rBGkJpMI8RLQ22SsXK9G87V7e7Zv8FP8N+xdX5mXAY1lH8soa7GtbnxjX6MkV+V7Q9cXLm1ErcJjnwWC4kG4AXG9ZOmVGUxFU394gBftKSYzUVCLW5TrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 05:56:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 05:56:12 +0000
Date: Fri, 22 Nov 2024 13:56:05 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
CC: Frederic Weisbecker <fweisbec@gmail.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [frederic-dynticks:kthread/affinity-v5] [kthread]  cd28de79b6:
 stress-ng.priv-instr.ops_per_sec 4.9% regression
Message-ID: <Z0Ac9dfXzhuHQb22@xsang-OptiPlex-9020>
References: <202411051514.5ce58505-oliver.sang@intel.com>
 <Zz34FneFIJpZpi_p@localhost.localdomain>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz34FneFIJpZpi_p@localhost.localdomain>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e63a5e-8d93-4e38-3c0c-08dd0aba5ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xNhg1ZHsuZn4To65OYovI8J6UWJXzMFlshM666SjgdfCf9Z8FedxnXiivt?=
 =?iso-8859-1?Q?r6EJOh4WEnygN40UWdNH+ZX8a1WukRolANtFo15VCoSfNwDkiBjmVPKDL2?=
 =?iso-8859-1?Q?GEEBicXtR9TQ8Su6klVkvApaozSI/OcTxX79Kmq8Mviy8srRvggRIkSpx2?=
 =?iso-8859-1?Q?bg7ivhYLzjGw6KEaQXcH+9FBxnica7boAoSk6qIkOZwFyWTemdORyO7Rvr?=
 =?iso-8859-1?Q?zU/79jS9JhjEPAUC5vxuGse9eRSINJAbj1slyx3AVdj1K0dVyoU3rTn0ow?=
 =?iso-8859-1?Q?Pi1iyW4WlczSz9AWO5sa2eU/LP6lSFLUW0mj4W1vrUld1sGEwrkT+iNoEI?=
 =?iso-8859-1?Q?Kk/4fqJNWWaxI3apOUdP8w7xaUj6Xcx4ApGEa6kowJiCyS91BmxQ4asoaA?=
 =?iso-8859-1?Q?yMTxIko6N5aw7O3F3T8FK+iFrGeYPkP7jjeDQk2DPQtzIIIdIedCs+8r87?=
 =?iso-8859-1?Q?0vCrKInwr3qZxLfTUCguAsCskHbNjFXxHs+oVWkPSVvekZlQ0NhklSP9Fe?=
 =?iso-8859-1?Q?TrfWgiA7C8gAtmNwKRlI36Zvj4lRoEb06i5Usr8kTSQqGue2dd0+PyWnvL?=
 =?iso-8859-1?Q?Ch6RCmOXYd/lmddkrphafxA9yJUHwrd6y6ziAEJqvj6g642twI/wzRtVa0?=
 =?iso-8859-1?Q?3IfGdg0xqGlYvECr6G3HmaHPt0D2Pr/APIHZ5aOy4ZTkxJJjLqOyHzpF6p?=
 =?iso-8859-1?Q?CNgLUBbvk6hHljRrcAtRN2jzEyz8v/4wr17BZiZUGNQ3P8AEH5VL+pTmsz?=
 =?iso-8859-1?Q?vjK2mD9gsOJxAoIMNAjdRJ7fGDRarsqVh/QSBIu9YRTSJFpubm3kiTY3wt?=
 =?iso-8859-1?Q?BtLGzngUHv7wwu5fHv8yhD8jpP67RDhRBUlVozBmOQ1H/5+CfoG1VV0iGZ?=
 =?iso-8859-1?Q?lekN/gMg+qg6oW8ga679G445wJB/cirhcldUPCLkhN2wrlspVSmY9GD/w8?=
 =?iso-8859-1?Q?UlL3xZsIczSmouWF0MajsCtgx229cbQdrudOv890xGIkkcfwBoW+MTdLbu?=
 =?iso-8859-1?Q?hDPSeMPMebHIt7ofu3h1p9UZ6oUZq13ojxq/VvrhLGPWVdIlGwXbpAKGGg?=
 =?iso-8859-1?Q?ZF/GAnou7cVCD5fnl2ChM4v+qV/JDOGVGdg7Og7L3JcWnldvvLHmX1KuQY?=
 =?iso-8859-1?Q?7RrYg9htDljwIFUTwytO5pFNIaV97VMdkCHiofj9JdznDZHXvcxB5jKuIH?=
 =?iso-8859-1?Q?juz0KyCa7YMaoCw+dCIz/j3uhUHARsQe5YBjFIr+Y3dW2T8WtD7Q7uBnQI?=
 =?iso-8859-1?Q?8e9F7hwTFuFsKW4qgWwm5rgIhHT/wuD5y3EM3tExuJz58AfHclKY+ougF+?=
 =?iso-8859-1?Q?rlmkzhHq/y8S7pn/0RHaPb1hkqN7oheMqmQcY3IQxfmM+XTb/HFHqup9BP?=
 =?iso-8859-1?Q?4zSsJN7WTR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xSh3PmIYiEFy+5IPJ2+HPZtFBMHrc5bQx1excPoE4ng7EFouR+IFLC1Udm?=
 =?iso-8859-1?Q?wRVqwnwEmeHM4LHJ3JioQTvlZcXDUJcozY91xEXlXHzI4e3sr0S9mo+LVp?=
 =?iso-8859-1?Q?xBGp9ZjuEMXSw8zzOFoOr9pZRH6E2ZFd30r9T4qUVP/J1P9dmO+eSmHyse?=
 =?iso-8859-1?Q?+FEBtdIQDClSzd8bB1mWT2vi72XmhzLWtsSe1Wk7iurr1YvrrQSf2DeF4u?=
 =?iso-8859-1?Q?YCJLt8tMvqxiq9IPJqT1wVQI4Rah+2z6aJm42DDu4e4ZB/eHZk0+t/ISRo?=
 =?iso-8859-1?Q?42Q32XT99+r2G05C0VbmiFH5gRKCnoXhORX2q7SZcknWEgHMa9AtssJTj8?=
 =?iso-8859-1?Q?sO0XDdLwos7hcRv4EkUVg5WltyjUsaiBi1m/TfKI1dC5CUthDJhXFznYlA?=
 =?iso-8859-1?Q?fjHJ+7jf9IjuAyiYs8DQDEjGC82VinEtIJH1a0/9+l6Ty7KCbvyTXU+Ael?=
 =?iso-8859-1?Q?8yp54dru2s/W9qcdXMMPMD+g89M1T2blsQFHza6+SzsB2NU5q0GXy+PpSq?=
 =?iso-8859-1?Q?mzN6pH068kMI7b2bwNR80UzOt8xUXUikn5FAwGJp/crWU4V71v/n4/D3J9?=
 =?iso-8859-1?Q?WMyRGh8e1oXM2vg3zxsxxOLlCHVBW7h3UCLvjPKvuJJDOVMGCKsuwhIPEa?=
 =?iso-8859-1?Q?dse6t4ob2tOaNHtLN+63TCDtvmJ0nVgoqt7z9ZasLr3oL/sp04/qrV89NP?=
 =?iso-8859-1?Q?JUJZEtN8mzA+kCiPlzgxcLp1qLgWBTyLGpTZopJhaUW+wIn0lZ/eTTKRYT?=
 =?iso-8859-1?Q?/mAWJo33tA+VRVMH55Wav6rXPGWMTFJKJ9/s78jts4BAdghjmLbQOSLafF?=
 =?iso-8859-1?Q?4hErMMcK69FjvhC0PsbJNsMG9wFjydn6nzJtr77hJSR1PnTe1VIbzEEgXe?=
 =?iso-8859-1?Q?/kllYlhRAwHIKO+4w+kUhphw2HGcBbtlDdk7yQ8C/Oj7ungw9KblKo20VS?=
 =?iso-8859-1?Q?+aLzslFeBEXj/TK7fB1d42uBSI2X8H+I9yOvLGyGn0hPu5MOttAMK7ffhb?=
 =?iso-8859-1?Q?u50W4djsR82cb2bz4rP0AiGIMZ6AhLaFthGcF1PdoUJm9NhoSF9lOU20MU?=
 =?iso-8859-1?Q?38hBaxf9U1miN/NpXCOuugkfW+1HKLEk+2rgdIN4nftHpv7bzRhN+fXbpw?=
 =?iso-8859-1?Q?dlAld3MzesW9Ps355VYhDlLpN0zm8K01uQ+T+oxfZfRmRPaSkNT/MCpwuH?=
 =?iso-8859-1?Q?P24K8dSAlBMJlZvfLuMLjkpnIzloLXrfaLL4I2W8Fn4mzpU+TPRHu+X9dK?=
 =?iso-8859-1?Q?mIzOl7svH1D4rlLdfc+mQBr9XImbpUHn7cYcvj2QgQChPi6nMo4Ju8yHgW?=
 =?iso-8859-1?Q?Qfk2OJivtIRbN/QM6gjR9biGF1MRL37Ppv6dgHo2ThYLUXUG81RbfKG6U9?=
 =?iso-8859-1?Q?GosEM9PT9/sCohPuC+3RoaJ+tQwAxLoON+C7CkesqZ24P3YQ8wej3icfSz?=
 =?iso-8859-1?Q?j/ULXVpcGacRdyN8VqoLQ7HdNcSuUnpqSI1bvNjy6ZOCErbG9vsTsDQbcL?=
 =?iso-8859-1?Q?oRIJ3aIBrmDe17gFVSsfOm+E864lHzjUGwpVSQUtEoJSV3IK6OKLR3ww7S?=
 =?iso-8859-1?Q?Gy2WeYon4zLypgRA98AljgrGmdowR5O3r6tb6rKWDunISc53II8GxtbMVd?=
 =?iso-8859-1?Q?Jb50f5mgUyD88J1gZdZa2iR1UrT6T0sVo+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e63a5e-8d93-4e38-3c0c-08dd0aba5ece
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 05:56:12.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bqc3NUHtidWS/+aQUm+RAmWGEdtOhifQSmR70gpNK8E1CpBgGzUTRiyz0gwB44dq0qxKPTTaX+D0Z+AntV2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com

hi, Frederic Weisbecker,

On Wed, Nov 20, 2024 at 03:54:14PM +0100, Frederic Weisbecker wrote:
> Le Tue, Nov 05, 2024 at 03:27:27PM +0800, kernel test robot a écrit :
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 4.9% regression of stress-ng.priv-instr.ops_per_sec on:
> > 
> > 
> > commit: cd28de79b6107158b9d3390eaf829ed778e6d839 ("kthread: Default affine kthread to its preferred NUMA node")
> > https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity-v5
> > 
> > testcase: stress-ng
> > config: x86_64-rhel-8.3
> > compiler: gcc-12
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > parameters:
> > 
> > 	nr_threads: 100%
> > 	testtime: 60s
> > 	test: priv-instr
> > 	cpufreq_governor: performance
> 
> Just so I understand correctly the output of stress-ng. Having a higher value on
> bogo ops/s (real time) means better performance, right?

you are right.

> 
> Because then I would actually be seeing 6% improvement between before and after
> this patchset when I try to reproduce.

yeah, it's possible that have different even opposite results on different env.
our report is only FYI what we observed in our tests with our platforms.


> 
> Thanks.
> 

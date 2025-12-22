Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB02322C97
	for <oe-lkp@lists.linux.dev>; Mon, 22 Dec 2025 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383196; cv=fail; b=J5Awjflg3bYYfIZ4ePrhp4mANfhe4ywlR/5HTmUQdnHZpyy5ZwQkB3gQdeWRk7C+oi2h6NkCYXZIGydlX1vG9NzUl3xHQqtpGj227kJn+Z8qDxzJvDYTufHIvzJ5FYW2Ljvjuhmh+Mjq+ovCxkW/ofxMfura/rZH/jOa9itaYBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383196; c=relaxed/simple;
	bh=rDmBjHg6e7wVVm9w+gVvH/wg9j5RGZ9bvYAvtW5OV2g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HLt/nFDs8NrtCzYiyRmeDwMKmoR0qKxIuWDKFyUy/vBuMl13tC3uV5vdxFUH+z5Oawt0cJmpVMDE295QJVLZg7LNgpr0pxvaIJV38coVe9LYA57j8yuFkAY9bHl5U32sUDpLswpk4Bd5pTgb79IsHfNOKq3cw4Tb8dPIoaWOvlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6Yvm/hv; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6Yvm/hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766383194; x=1797919194;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=rDmBjHg6e7wVVm9w+gVvH/wg9j5RGZ9bvYAvtW5OV2g=;
  b=m6Yvm/hvgprmRqaiMznY+TBkSWsrkOeyCakiKwgX4IqvZrNXGZ0N6vre
   abDhHVCvpCNvwoeqsRqoPrCtZtsCAQiXjes4fz3bVNifLr1OMVZ5SGCkT
   V0KGcSY+w4os7wgJ8s5HukB01ByIUjBzbOhHoITL5xnc4rpWZFvknuEfp
   uysdV2j6KXa2mYEsyds5Qha46r2M+xqv+O821s1y81htYX10XHW0hBBO6
   qcnFnDCYAIYfcXTHXxlgSMnCJ6v0GZbZ6g3UV/45fCbGPUD4btnab73i8
   m81eZ61xnPNzdXgY79BABDYKstsaB7BygPajmLR/j4kSvim5hdRs4GPNF
   A==;
X-CSE-ConnectionGUID: 8GaH43VMQbKWhM6col7YKg==
X-CSE-MsgGUID: wSqyYhqrS0Or/ivITfCWNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72096001"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72096001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 21:59:53 -0800
X-CSE-ConnectionGUID: TCPMtgucSce0IU+ZVoWNHQ==
X-CSE-MsgGUID: 1OtWLBgMSyKtwYPZ7pJazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199194853"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 21:59:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 21:59:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 21:59:51 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 21:59:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRZTyvSEwllp4YctTc4WXk92EjjVCY6d45OViJAPBP6q2q79a3pBK6PSh14imyKeelJOeiGhyPscr66lQtwNPjWgs692CQ59z4y8xWhdEJ6K4Mo8aibWNARrrd4mjHm4lEHLmopqRvf5jDGX3zHTEDeB8al6Y+dX07nUxPjopKfPB6Vg9wS5MwlV+Qmb3yjzCc8gMI8DdhoE2xGBuL7t+Kn5MStQefYX3gP0Fyqo09cAMKefdofONpkcGZ+anklCbVz2n08ozxu7usl+k1IlTenvoWCsSwIst6beca1gJqnmJt1d5totv7xW9lNLIBv3WRAS56qiZH8ub7056+TU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4QU4Kh8BnM3SAkQVSD1n3r4suyz3wsaL92llu7BZY8=;
 b=uGE0qfSeQrPtxDIY3xevmXy/bY0ubViviUUpVPFf6584lvIvnNSlIm9YB07c8ntuh+o43R8QV1SZQT8QQd6BOQev7Y2W/dNiiJH5pcxeqK2xeRIJs/5pAvd952MgqFoESR1OS7BWTbWrTW0eNG1BOBM536XiUYqhp+jr8sKwhFxFA4nqAW4fNCNLW3EguXFg+hiuXVB5KqpQmgMu0gVtC3zuDzKg9Hj04OGEbdDa2HZBNab4+guEPqjChkP+COmFlGMl3Bbu6/b92FLb4vFYh4WqFKWPLhK7AooRBsq4Z7YhGHE7jOVqMzltdkvGCXnv5wau7GexCzVQDKAJv84+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 05:59:50 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 05:59:49 +0000
Date: Mon, 22 Dec 2025 13:59:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Chris Mason <clm@meta.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  33cf66d883: hackbench.throughput 17.8%
 regression
Message-ID: <202512221355.7a45e5d4-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KUZPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: cf30fe7a-c564-4b68-a812-08de411f513d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IUS78BxOnEaTr5KD0GXU+YrFgvOgarzVriyqZ7++QCiNQh/yZCr0FkKbmB?=
 =?iso-8859-1?Q?7Z+/LxdVchuDrTCgpMIu3EEu9Jpn8Sn8y4hS8b9pH8eK8dYlW44kgeQ8Sc?=
 =?iso-8859-1?Q?Hk3xijd9s553wRcFohxcdg5aY0Mwi/Xw5zFiKEnZ4s1O+5w7WLm1Tp01Kl?=
 =?iso-8859-1?Q?JSfX8b7HmTwwL970CR97niyc9LVDVRgZ6PnxTayKKKCWo7oMrHFmByJC3g?=
 =?iso-8859-1?Q?xZHgid1ZJmOwo85fqd5dHy06lHV/uEuDt7vFadk4dkKkf1aQ25F6d88NFm?=
 =?iso-8859-1?Q?PN3OSXu3Ccrmkb7niAZbD7CNsFj9UCyxBjziMb39RtN9apf8SKjQiMwDd/?=
 =?iso-8859-1?Q?/gc0SS+jB7Go3hqR8wTEPo8dOKWOzJ7RxHcGzqZCgE91mxkXK3VSSOyg6+?=
 =?iso-8859-1?Q?zAQuY6Yo5Ghg/NAQiK6TLz5X+hQty866fiOzDevvFqHqWy4BqrE2XqlqAK?=
 =?iso-8859-1?Q?yAhiOXImw1T64fxyXsKX02rSdWdSWwr/5BqIeSpKdyGGlRzlsFTyFsouBX?=
 =?iso-8859-1?Q?gSZf87adFlJH1/CQOYBRGjNV+Yo8pJuyyGJL3z7G4GnPucYWVKewbbhWQw?=
 =?iso-8859-1?Q?+cKhVjPsExUnCHGr8HEFyhzcfv614aDkxfAxMGK9nFt7YVBbKaO8pNuFvb?=
 =?iso-8859-1?Q?e/YUxL2iLTzzV1xlldbGPNgH15QaZAK/rnVQJtCEUDtonWrlpa1GAtzh3+?=
 =?iso-8859-1?Q?B9FSknykCvskNWIgG3FSXhY9v242/vJ9nPvK1lpGZl6PSL9NSb/uYu22Wa?=
 =?iso-8859-1?Q?MqzSH8Lez0qnJnQ6LsPakESRAJ/WxOtObCor/4xS+uW7Ym72zN9yCesNs3?=
 =?iso-8859-1?Q?M6KwBJJA3RoYN0c2voukXdXE/3hwiP9TBGxsI1UTiAMO9pKQ1xMxHeB9XT?=
 =?iso-8859-1?Q?zQi5rBKIyPY9TYAFK1uf1D/jr3aLNpAw/ige+JbliQEk35BWO4azLmA6uy?=
 =?iso-8859-1?Q?7mgGkhBwBQAbCn5pAcAAz4Py38iCQPIDKNYUMYVQF2bTb++fiFYSV0tnZx?=
 =?iso-8859-1?Q?cYpLi62bpoSldGP4aZxr8db0jIuqygIRPFNt5XM/bfmIaFesqvtXRiClZz?=
 =?iso-8859-1?Q?SYgdT7Ozf5UGovEul1fsgC+GYYbPvCkRcohTDErM9bUnysTgk9JsRTAVdN?=
 =?iso-8859-1?Q?hDT40PrSpx6orxvrvAMRKtQXLmCcgrn9caj8BhAnF/hwRSaI5B+Z07sc0h?=
 =?iso-8859-1?Q?Ly+bPTl2YwVlEWhjT6Lddvpi69bjNZLkf6qVPRVvMHs9o3YwCZYpOcesLK?=
 =?iso-8859-1?Q?LgqxwalhbGSPAVBnWmOWvGPJAgDHa6++EcB8/i9n2+R7QcbAjH7tcHWIUV?=
 =?iso-8859-1?Q?7p7fccw9Hif+dFPIdkfFnxZZ7NGHGxb6sK795BUKf+4t/YPn1gJoNhalxG?=
 =?iso-8859-1?Q?dmITbi8DRaKiZhZt70deV2mKcFcz4kC3MD7r6ClaNhYBq7XVliwKic5fBR?=
 =?iso-8859-1?Q?8Uv8LJqLuYrfQPz8k7nK0VFBxqCAP4pWGeWSvFar1lN1t9wGGaczFbqoaf?=
 =?iso-8859-1?Q?0IfcmbkAbOqUUAo0sKSqQMW1KkpOObe1Zl7ZfsaDQAwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?plQXmZTvEwcQg22hXR7DSrxGV+JKA8pUWP5x+NdOCUBZiD9p7g0NR3pAPf?=
 =?iso-8859-1?Q?3NT1m9yQPqYwiQ2sL3axqK+fCH0oG2GhoMVZQ8rruTHPTZhRJMUJHQjfM0?=
 =?iso-8859-1?Q?8krULRZ1iAtjoi6N6847k2FDK0p5SGOSKz+dJ0tMrQYABFPKjiKt6JnaRI?=
 =?iso-8859-1?Q?pn3mTa0/zIH4G4ZtISM3dBwJB/qlt2p+oqf1Q4oAjBD57xBytvX9sUyRum?=
 =?iso-8859-1?Q?Vo7YYAnRP8ZnSLoJpQBfG2i54fv01p2dOpf+Go2UDrSgPTk9zUO6CYKIQW?=
 =?iso-8859-1?Q?YNnwu0SR+MUTlkw8ae46862LAVDcTIh9vxS4BEE27uXPsKbZ/sJ+01/X78?=
 =?iso-8859-1?Q?lPgidbEs6MhxiArXJ5yedYcXRaahn2H5yAPSsDdZqARinnyZbM2MdpNKDp?=
 =?iso-8859-1?Q?4qX4eaR8mUwe+jn8jpE5IDQzEreetiJYKUvPGnO9K3GsDnExitWGnfmq2F?=
 =?iso-8859-1?Q?5AH/lXbbNLYTz1Zbi3pqX5vGLa9cX5vCX+SYAUjX76p5Sjlnj831VVmlbr?=
 =?iso-8859-1?Q?lqiKKJNxS66MMfZcyCPI0UhJbJQ338tJBj+tt/xSMFkv1gdfnvzQuiCdYw?=
 =?iso-8859-1?Q?WmvOIKR2m+YGbAmO0oMluOLw2E+4JEx4DPJ5uFnQI6JZDhgFBg60slwAJI?=
 =?iso-8859-1?Q?6Ru3UtFJ+GGEpgLGzHbcZLBv64zKlr9iTj6AF9i7DttCDOQcPh0c7j9plv?=
 =?iso-8859-1?Q?wz1NeQ/6YtHldXBegL3XSSYi35Qo7kwyfz0OYm7U7tnw6PrMTKOgWrMeAc?=
 =?iso-8859-1?Q?XSyZwJjBJqwka5/ADyGP/g7pZsg/jYYwODSDCLxcYxY7XVRifCDCzvGGqs?=
 =?iso-8859-1?Q?vUNM9xNqZUNaeTw0J9E7C5Z0fMCULS5Tsc/0I0EuovsxECPKaWV9+nxw8w?=
 =?iso-8859-1?Q?PxefQ5MQiq8wEC0vJKUsz2YX8TzVD+UaWAw4Bna4HcnS9OAua9UytgNx7z?=
 =?iso-8859-1?Q?a6jLgOOOEOU/0n1SNPyew4nWa4aHcDEm/7qAYXwgwn2UBIBgsHQBALvN3T?=
 =?iso-8859-1?Q?8rNA6khkp+s/S6cgzqz9OBBYxAovMkZB/axE2eNTawwlEhOvJwJiny8mo8?=
 =?iso-8859-1?Q?BcwDXZRQh3DkX8lJt+U0ycf9BZwOBVbU0ujb1/HLcjV6DYE5bURrKD6Lsn?=
 =?iso-8859-1?Q?F7gg7VSIKPo3LQ006RbevmBB6dMhdnv+3FoijT1Gtlwh5tbehP0lLi+1/w?=
 =?iso-8859-1?Q?7LddC4cUPHRa251Qg9MG1Waf9T/4/X+US+JopqyKuoSnNZqYS4PUDvkRdD?=
 =?iso-8859-1?Q?xoPtT0g4CZPSiNShpxBLwmPjegPd8RC57ipfnAbo0hrJ2zmfbzi/9RIEJe?=
 =?iso-8859-1?Q?qKdL2Xpobz4xU92H9aecQap4EZF0DrR3UEkJtkHmDYvd8ndqmLq/A6NieU?=
 =?iso-8859-1?Q?jkI6TgWRJt7WcRhsnTAcJOKAClGI98f5KtsfJU6l4s5UsGQHXG4Jmr5QVP?=
 =?iso-8859-1?Q?7/2dhOkxQERZroS+KVYn2ZpngqPQCfq/mdrcLZZL66W0q7+pdox0l4c31k?=
 =?iso-8859-1?Q?GbBk1yZoiWEYntyXHRMVCmr75Sv3oV2RE2RL/x2Q/Cwav4967swyfn9FzQ?=
 =?iso-8859-1?Q?9UTTTZex7npUBrTefmdhX74Lzg7EoVTQxmoZr2cph8mCy7i+OkiQ6EIKMp?=
 =?iso-8859-1?Q?0q6q341yG1paGsAEppL7kd7ruIU6IVoA19CrzcUhUIbJGWEuGY7P0FX4bI?=
 =?iso-8859-1?Q?Nl6I8Z+CJN560AWXB9wn6xXFc0iuv7lu5vRy36q9b3HcqdV87yab5J0zY/?=
 =?iso-8859-1?Q?+f4Qg9NJrEjWIKd3Wy8Lb6HfRIzXXrsulIBT0Pn3qqzfKA+6+hIBbuoTiW?=
 =?iso-8859-1?Q?h6E49sQY4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf30fe7a-c564-4b68-a812-08de411f513d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 05:59:49.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1QpBL1/qHHa5K7uNkfhsPWboAWEhOWOl9oZ+BHoGxsQOI/5T2oeS/yc2TYyF/v+41E6SrGkHUcppHyI2wf5OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
X-OriginatorOrg: intel.com



Hello,


we reported
"[tip:sched/core] [sched/fair]  33cf66d883: vm-scalability.throughput 3.9% improvement"
in
https://lore.kernel.org/all/202511251755.6e00cfb9-lkp@intel.com/

now the commit is in mainline, and we captured a regression from hackbench
tests. vm-scalability improvements are still included in the report. FYI.



kernel test robot noticed a 17.8% regression of hackbench.throughput on:


commit: 33cf66d88306663d16e4759e9d24766b0aaa2e17 ("sched/fair: Proportional newidle balance")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      dd9b004b7ff3289fb7bae35130c0a5c0537266af]
[still regression on linux-next/master cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

testcase: hackbench
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 4
	mode: threads
	ipc: pipe
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 3.9% improvement                                         |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | runtime=300s                                                                                       |
|                  | size=8T                                                                                            |
|                  | test=anon-w-seq-mt                                                                                 |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 6.9% improvement                                         |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | runtime=300s                                                                                       |
|                  | size=8T                                                                                            |
|                  | test=anon-w-seq                                                                                    |
+------------------+----------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512221355.7a45e5d4-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251222/202512221355.7a45e5d4-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/pipe/4/x86_64-rhel-9.4/threads/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp7/hackbench

commit: 
  08d473dd87 ("sched/fair: Small cleanup to update_newidle_cost()")
  33cf66d883 ("sched/fair: Proportional newidle balance")

08d473dd8718e4a4 33cf66d88306663d16e4759e9d2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   2796734 ± 55%     +32.9%    3716911 ± 45%  numa-meminfo.node1.MemUsed
      0.73 ±  3%      +0.3        1.01        mpstat.cpu.all.irq%
     13.17            -1.9       11.28        mpstat.cpu.all.usr%
      3.00         +1083.3%      35.50 ± 31%  mpstat.max_utilization.seconds
   3999110           +10.1%    4402258 ±  2%  vmstat.memory.cache
   4477499 ±  2%     +13.5%    5081114        vmstat.system.cs
    326244 ±  2%     +20.4%     392931        vmstat.system.in
     57.83 ± 25%   +7226.5%       4237 ± 24%  perf-c2c.DRAM.local
     49.17 ± 27%  +19835.9%       9801 ± 37%  perf-c2c.DRAM.remote
     13.00 ± 24%  +2.2e+05%      28779 ± 22%  perf-c2c.HITM.local
      7.67 ± 35%  +89197.8%       6846 ± 34%  perf-c2c.HITM.remote
     20.67 ± 21%  +1.7e+05%      35625 ± 22%  perf-c2c.HITM.total
    901800 ±  2%     +45.2%    1309416 ±  9%  meminfo.Active
    901784 ±  2%     +45.2%    1309400 ±  9%  meminfo.Active(anon)
     63230           +12.0%      70817        meminfo.AnonHugePages
   3898764           +10.1%    4291919 ±  2%  meminfo.Cached
   1045421 ±  2%     +39.3%    1456057 ±  8%  meminfo.Committed_AS
    248500 ±  3%    +158.2%     641664 ± 17%  meminfo.Shmem
      8.14 ±  3%     -51.4%       3.96 ± 45%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      8.14 ±  3%     -51.4%       3.96 ± 45%  perf-sched.total_sch_delay.average.ms
     22.81 ±  3%     -48.8%      11.67 ± 43%  perf-sched.total_wait_and_delay.average.ms
    946434 ±  2%     +88.9%    1788054 ± 18%  perf-sched.total_wait_and_delay.count.ms
     14.66 ±  3%     -47.4%       7.72 ± 43%  perf-sched.total_wait_time.average.ms
     22.81 ±  3%     -48.8%      11.67 ± 43%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    946434 ±  2%     +88.9%    1788054 ± 18%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     14.66 ±  3%     -47.4%       7.72 ± 43%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.13 ±  5%      -0.0        0.10 ±  3%  turbostat.C1%
      4.68            -0.5        4.18 ±  3%  turbostat.C6%
      2.53 ±  2%     -17.7%       2.08 ±  3%  turbostat.CPU%c6
      0.77           -10.9%       0.68        turbostat.IPC
  17255476 ±  2%     +43.7%   24791410        turbostat.IRQ
    219.17 ± 33%    +2e+05%     436508 ± 20%  turbostat.NMI
    273.53            -1.4%     269.67        turbostat.PkgWatt
     14.54            +2.0%      14.83        turbostat.RAMWatt
    630734           -17.8%     518722        hackbench.throughput
    605546           -17.0%     502866        hackbench.throughput_avg
    630734           -17.8%     518722        hackbench.throughput_best
    572043 ±  2%     -15.6%     482994        hackbench.throughput_worst
     50.31           +20.3%      60.50        hackbench.time.elapsed_time
     50.31           +20.3%      60.50        hackbench.time.elapsed_time.max
  67764693 ±  2%     +29.7%   87872106        hackbench.time.involuntary_context_switches
      2687           +22.9%       3302        hackbench.time.system_time
    413.13            +1.6%     419.62        hackbench.time.user_time
 1.678e+08 ±  3%     +37.9%  2.314e+08        hackbench.time.voluntary_context_switches
    225128 ±  2%     +45.8%     328204 ±  9%  proc-vmstat.nr_active_anon
    974391           +10.2%    1073782 ±  2%  proc-vmstat.nr_file_pages
     61824 ±  2%    +160.8%     161217 ± 18%  proc-vmstat.nr_shmem
     23019            +1.8%      23427        proc-vmstat.nr_slab_reclaimable
    225128 ±  2%     +45.8%     328204 ±  9%  proc-vmstat.nr_zone_active_anon
  58402359            -6.7%   54511492        proc-vmstat.numa_hit
  58336619            -6.7%   54440569        proc-vmstat.numa_local
  58443581            -6.6%   54564213        proc-vmstat.pgalloc_normal
    326135 ±  2%      +7.6%     350981 ±  2%  proc-vmstat.pgfault
  58074498            -7.0%   54016525        proc-vmstat.pgfree
     11225 ±  3%      +8.3%      12156 ±  2%  proc-vmstat.pgreuse
      5.25 ± 42%      -4.8        0.47 ±141%  perf-profile.calltrace.cycles-pp.cmd_record.perf_c2c__record.run_builtin.handle_internal_command.main
      5.25 ± 42%      -4.8        0.47 ±141%  perf-profile.calltrace.cycles-pp.perf_c2c__record.run_builtin.handle_internal_command.main
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.calltrace.cycles-pp.main
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      5.25 ± 42%      -4.8        0.47 ±141%  perf-profile.children.cycles-pp.perf_c2c__record
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.children.cycles-pp.handle_internal_command
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.children.cycles-pp.main
     12.52 ± 20%      -4.5        8.00 ± 18%  perf-profile.children.cycles-pp.run_builtin
      9.18 ± 11%      -2.2        6.94 ± 12%  perf-profile.children.cycles-pp.perf_mmap__push
      9.18 ± 11%      -2.2        6.94 ± 12%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      1.54 ± 31%      -0.8        0.76 ± 72%  perf-profile.children.cycles-pp.free_unref_folios
      0.31 ±  6%     +14.4%       0.35 ±  4%  perf-stat.i.MPKI
 3.574e+10           -11.6%  3.158e+10        perf-stat.i.branch-instructions
      0.29 ±  3%      +0.0        0.34 ±  2%  perf-stat.i.branch-miss-rate%
  87582769 ±  2%     +11.6%   97733339        perf-stat.i.branch-misses
     12.80 ±  2%      +0.7       13.48 ±  3%  perf-stat.i.cache-miss-rate%
  29195325 ±  4%     +21.0%   35312359 ±  2%  perf-stat.i.cache-misses
 2.274e+08           +20.1%  2.731e+08        perf-stat.i.cache-references
   4600492 ±  2%     +13.3%    5212966        perf-stat.i.context-switches
      1.38            +9.0%       1.50        perf-stat.i.cpi
    196117 ±  3%     +12.9%     221481        perf-stat.i.cpu-migrations
      8508 ±  4%     -22.0%       6639 ±  3%  perf-stat.i.cycles-between-cache-misses
 1.474e+11           -10.9%  1.314e+11        perf-stat.i.instructions
      0.77           -10.5%       0.69        perf-stat.i.ipc
     74.81 ±  2%     +13.6%      85.00        perf-stat.i.metric.K/sec
      4599            -5.9%       4326 ±  3%  perf-stat.i.minor-faults
      4599            -5.9%       4326 ±  3%  perf-stat.i.page-faults
      0.20 ±  4%     +35.5%       0.27 ±  2%  perf-stat.overall.MPKI
      0.24 ±  2%      +0.1        0.31        perf-stat.overall.branch-miss-rate%
      1.30           +12.5%       1.46        perf-stat.overall.cpi
      6585 ±  4%     -17.1%       5460 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.77           -11.1%       0.69        perf-stat.overall.ipc
  3.51e+10           -11.3%  3.112e+10        perf-stat.ps.branch-instructions
  85824759 ±  2%     +12.1%   96172996        perf-stat.ps.branch-misses
  28546162 ±  4%     +21.2%   34607348 ±  2%  perf-stat.ps.cache-misses
 2.226e+08           +20.6%  2.685e+08        perf-stat.ps.cache-references
   4503993 ±  2%     +13.8%    5125779        perf-stat.ps.context-switches
    190480 ±  3%     +13.9%     216966        perf-stat.ps.cpu-migrations
 1.448e+11           -10.6%  1.295e+11        perf-stat.ps.instructions
      4448 ±  2%      -5.7%       4194 ±  3%  perf-stat.ps.minor-faults
      4448 ±  2%      -5.7%       4194 ±  3%  perf-stat.ps.page-faults
 7.434e+12            +7.3%  7.977e+12        perf-stat.total.instructions
      4022 ± 11%  +19005.0%     768561        sched_debug.cfs_rq:/.avg_vruntime.avg
     63303 ± 20%   +1634.0%    1097703 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.max
     40.66 ± 55%  +1.5e+06%     626513 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.min
     10888 ± 12%    +729.2%      90287 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.26 ± 19%   +2662.0%       7.19 ± 10%  sched_debug.cfs_rq:/.h_nr_queued.avg
      1.17 ± 31%   +1328.6%      16.67 ±  9%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.44 ±  7%    +736.6%       3.69 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.26 ± 17%   +2683.2%       7.10 ± 10%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.00         +1558.3%      16.58 ±  9%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.43 ±  5%    +750.0%       3.68 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      6.24 ±191%  +3.3e+05%      20792 ± 60%  sched_debug.cfs_rq:/.left_deadline.avg
    285.31 ±179%  +2.2e+05%     630356 ± 45%  sched_debug.cfs_rq:/.left_deadline.max
     38.45 ±182%  +2.8e+05%     107740 ± 50%  sched_debug.cfs_rq:/.left_deadline.stddev
      5.13 ±209%  +4.1e+05%      20792 ± 60%  sched_debug.cfs_rq:/.left_vruntime.avg
    250.71 ±205%  +2.5e+05%     630327 ± 45%  sched_debug.cfs_rq:/.left_vruntime.max
     32.50 ±206%  +3.3e+05%     107737 ± 50%  sched_debug.cfs_rq:/.left_vruntime.stddev
      8047 ± 91%    +270.1%      29786 ± 25%  sched_debug.cfs_rq:/.load.avg
      2716 ±118%     -64.0%     977.67 ± 25%  sched_debug.cfs_rq:/.load_avg.max
    443.38 ± 81%     -50.2%     220.58 ± 13%  sched_debug.cfs_rq:/.load_avg.stddev
      0.26 ± 19%    +142.9%       0.63 ±  2%  sched_debug.cfs_rq:/.nr_queued.avg
      0.44 ±  7%     -35.7%       0.28 ± 12%  sched_debug.cfs_rq:/.nr_queued.stddev
      1023           -50.0%     512.00        sched_debug.cfs_rq:/.removed.load_avg.max
    242.76 ± 12%     -44.6%     134.43 ± 14%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    521.00 ±  3%     -56.5%     226.58 ± 18%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     89.43 ± 17%     -47.1%      47.29 ± 29%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    521.00 ±  3%     -56.5%     226.58 ± 18%  sched_debug.cfs_rq:/.removed.util_avg.max
     89.43 ± 17%     -47.2%      47.24 ± 29%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      5.13 ±209%  +4.1e+05%      20792 ± 60%  sched_debug.cfs_rq:/.right_vruntime.avg
    250.71 ±205%  +2.5e+05%     630327 ± 45%  sched_debug.cfs_rq:/.right_vruntime.max
     32.50 ±206%  +3.3e+05%     107737 ± 50%  sched_debug.cfs_rq:/.right_vruntime.stddev
    419.09 ±  3%   +1660.7%       7378 ± 10%  sched_debug.cfs_rq:/.runnable_avg.avg
      1116 ±  8%   +1012.4%      12414 ± 15%  sched_debug.cfs_rq:/.runnable_avg.max
    311.46 ±  6%    +537.6%       1985 ± 12%  sched_debug.cfs_rq:/.runnable_avg.stddev
    418.39 ±  3%     +68.9%     706.65        sched_debug.cfs_rq:/.util_avg.avg
    311.42 ±  6%     -27.4%     226.04 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
     48.78 ± 28%   +1188.5%     628.47 ± 11%  sched_debug.cfs_rq:/.util_est.avg
      1000 ±  2%    +153.4%       2534 ± 22%  sched_debug.cfs_rq:/.util_est.max
    165.60 ± 14%    +164.7%     438.41 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
      3880 ± 11%  +19675.4%     767426        sched_debug.cfs_rq:/.zero_vruntime.avg
     60092 ± 22%   +1721.9%    1094804 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.max
     40.66 ± 55%  +1.5e+06%     626014 ±  3%  sched_debug.cfs_rq:/.zero_vruntime.min
     10394 ± 12%    +766.1%      90022 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    689417           -28.0%     496499 ±  2%  sched_debug.cpu.avg_idle.avg
      4781 ±  8%    +748.8%      40585 ±  9%  sched_debug.cpu.avg_idle.min
    273724 ±  4%     -19.6%     220005 ±  5%  sched_debug.cpu.avg_idle.stddev
     53241           +57.1%      83652        sched_debug.cpu.clock.avg
     53245           +57.2%      83724        sched_debug.cpu.clock.max
     53236           +57.0%      83559        sched_debug.cpu.clock.min
      2.60 ±  7%   +1636.3%      45.23 ± 28%  sched_debug.cpu.clock.stddev
     52950           +56.8%      83049        sched_debug.cpu.clock_task.avg
     53211           +56.7%      83394        sched_debug.cpu.clock_task.max
     44851           +66.7%      74757        sched_debug.cpu.clock_task.min
      1218 ± 20%    +622.9%       8810        sched_debug.cpu.curr->pid.avg
      5793          +106.9%      11984        sched_debug.cpu.curr->pid.max
      2286 ±  7%     -23.5%       1748 ± 17%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 54%     +99.1%       0.00 ± 26%  sched_debug.cpu.next_balance.stddev
      0.24 ± 20%   +2853.8%       7.15 ± 10%  sched_debug.cpu.nr_running.avg
      1.17 ± 31%   +1328.6%      16.67 ±  9%  sched_debug.cpu.nr_running.max
      0.43 ±  8%    +764.5%       3.72 ±  7%  sched_debug.cpu.nr_running.stddev
      2270        +1.1e+05%    2434691        sched_debug.cpu.nr_switches.avg
      9778 ± 11%  +27615.8%    2710239        sched_debug.cpu.nr_switches.max
    279.33 ± 32%  +7.9e+05%    2202298 ±  2%  sched_debug.cpu.nr_switches.min
      2058 ±  9%   +4832.7%     101550 ± 10%  sched_debug.cpu.nr_switches.stddev
     12.33 ± 18%    +200.0%      37.00 ± 13%  sched_debug.cpu.nr_uninterruptible.max
    -10.67          +249.2%     -37.25        sched_debug.cpu.nr_uninterruptible.min
      4.51 ± 13%    +247.7%      15.68 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev
     53236           +56.9%      83553        sched_debug.cpu_clk
     52523           +57.7%      82840        sched_debug.ktime
     53984           +56.2%      84309        sched_debug.sched_clk
  32696319          +205.2%   99805183        sched_debug.sysctl_sched.sysctl_sched_features


***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/debian-13-x86_64-20250902.cgz/300s/8T/lkp-cpl-4sp2/anon-w-seq-mt/vm-scalability

commit: 
  08d473dd87 ("sched/fair: Small cleanup to update_newidle_cost()")
  33cf66d883 ("sched/fair: Proportional newidle balance")

08d473dd8718e4a4 33cf66d88306663d16e4759e9d2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    140169 ± 11%     +20.4%     168807 ± 11%  numa-meminfo.node0.Slab
     38.84            +3.1       41.95        turbostat.C1%
     35883 ± 16%     -38.7%      22013 ± 12%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.25 ± 33%     -55.9%       0.11 ± 58%  sched_debug.cpu.nr_uninterruptible.avg
    -89.12           -21.9%     -69.57        sched_debug.cpu.nr_uninterruptible.min
  32696319          +205.2%   99805183        sched_debug.sysctl_sched.sysctl_sched_features
     30.68            -0.4       30.28        perf-profile.calltrace.cycles-pp.do_rw_once
      0.59            -0.0        0.56        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_rw_once
      0.07 ±  8%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.schedule
      0.08 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.sched_balance_rq
      0.08 ±  8%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.___perf_sw_event
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.mas_walk
      0.08 ±  2%     -10.1%       0.07        vm-scalability.free_time
    348488            +1.7%     354569        vm-scalability.median
  93790815            +3.9%   97486053        vm-scalability.throughput
    383366 ±  5%     +27.3%     487878 ±  2%  vm-scalability.time.involuntary_context_switches
     13116            -5.1%      12451        vm-scalability.time.percent_of_cpu_this_job_got
     18386            -4.5%      17565        vm-scalability.time.system_time
     21178            -5.2%      20069        vm-scalability.time.user_time
    274218            -2.3%     267786        vm-scalability.time.voluntary_context_switches
   8334443            -6.2%    7821786        proc-vmstat.nr_active_anon
   8182472            -6.2%    7672252        proc-vmstat.nr_anon_pages
     15772            -6.3%      14776        proc-vmstat.nr_anon_transparent_hugepages
   3714681            +1.1%    3753946        proc-vmstat.nr_dirty_background_threshold
   7438445            +1.1%    7517071        proc-vmstat.nr_dirty_threshold
  37387239            +1.0%   37779422        proc-vmstat.nr_free_pages
  37148190            +1.1%   37546282        proc-vmstat.nr_free_pages_blocks
     17965            -5.9%      16898        proc-vmstat.nr_page_table_pages
   8334431            -6.2%    7821774        proc-vmstat.nr_zone_active_anon
      3.38            -2.0%       3.31        perf-stat.i.MPKI
 6.728e+10            -2.0%  6.591e+10        perf-stat.i.branch-instructions
      0.06            -0.0        0.06 ±  2%  perf-stat.i.branch-miss-rate%
  26644187           -11.1%   23698025 ±  2%  perf-stat.i.branch-misses
     66.58            -1.2       65.43        perf-stat.i.cache-miss-rate%
 7.144e+08            -3.9%  6.868e+08        perf-stat.i.cache-misses
  1.07e+09            -2.3%  1.045e+09        perf-stat.i.cache-references
      8866 ±  2%      +3.7%       9196        perf-stat.i.context-switches
      2.51            -4.4%       2.40        perf-stat.i.cpi
  5.33e+11            -6.2%  4.999e+11        perf-stat.i.cpu-cycles
    665.04            -8.8%     606.57        perf-stat.i.cpu-migrations
    743.32            -2.5%     724.57        perf-stat.i.cycles-between-cache-misses
 2.109e+11            -2.1%  2.066e+11        perf-stat.i.instructions
      0.40            +4.7%       0.42        perf-stat.i.ipc
      3.39            -2.0%       3.33        perf-stat.overall.MPKI
      0.03            -0.0        0.03        perf-stat.overall.branch-miss-rate%
     66.92            -1.2       65.75        perf-stat.overall.cache-miss-rate%
      2.53            -4.6%       2.42        perf-stat.overall.cpi
    746.31            -2.6%     726.93        perf-stat.overall.cycles-between-cache-misses
      0.39            +4.8%       0.41        perf-stat.overall.ipc
  22267708            -8.1%   20466034        perf-stat.ps.branch-misses
 6.891e+08            -2.4%  6.726e+08        perf-stat.ps.cache-misses
      8639            +3.3%       8927        perf-stat.ps.context-switches
 5.143e+11            -4.9%  4.889e+11        perf-stat.ps.cpu-cycles
    624.80            -6.6%     583.36        perf-stat.ps.cpu-migrations



***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/debian-13-x86_64-20250902.cgz/300s/8T/lkp-cpl-4sp2/anon-w-seq/vm-scalability

commit: 
  08d473dd87 ("sched/fair: Small cleanup to update_newidle_cost()")
  33cf66d883 ("sched/fair: Proportional newidle balance")

08d473dd8718e4a4 33cf66d88306663d16e4759e9d2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  12868898 ±  8%     -13.6%   11117210 ±  6%  meminfo.DirectMap2M
     22.51 ±  2%      +5.1       27.56        mpstat.cpu.all.idle%
      4570 ±  6%      -8.2%       4195 ±  5%  perf-c2c.DRAM.remote
  32696319          +205.2%   99805183        sched_debug.sysctl_sched.sysctl_sched_features
     25712           +13.8%      29272        uptime.idle
 1.544e+10 ±  2%     +22.7%  1.895e+10        cpuidle..time
  16705139 ±  2%     +21.5%   20304654        cpuidle..usage
   9686016 ±  9%     -11.2%    8601707 ± 10%  numa-meminfo.node0.AnonHugePages
   9810366 ±  9%     -11.5%    8680271 ± 10%  numa-meminfo.node0.AnonPages
      2.08 ± 10%     +38.9%       2.88 ± 14%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2.08 ± 10%     +38.9%       2.88 ± 14%  perf-sched.total_sch_delay.average.ms
     22.68 ±  2%      +5.2       27.82        turbostat.C1%
     22.38 ±  2%     +22.6%      27.43        turbostat.CPU%c1
   5618917            -8.7%    5131336 ±  3%  turbostat.NMI
    847.70            -1.8%     832.15        turbostat.PkgWatt
     43.20            -1.3%      42.66        turbostat.RAMWatt
      0.01            -7.0%       0.01        vm-scalability.free_time
    347285            +3.1%     358120        vm-scalability.median
      2.87 ±  5%      +0.5        3.42 ±  9%  vm-scalability.median_stddev%
      7.35 ±  6%      +1.6        8.98 ±  6%  vm-scalability.stddev%
  82530869            +6.9%   88238114        vm-scalability.throughput
    766040 ±  2%      +6.1%     812920        vm-scalability.time.involuntary_context_switches
     16652            -6.7%      15540        vm-scalability.time.percent_of_cpu_this_job_got
     23121            -6.3%      21670        vm-scalability.time.system_time
     27174            -7.0%      25266        vm-scalability.time.user_time
    108375            +3.4%     112073        vm-scalability.time.voluntary_context_switches
   9573443            -7.9%    8820226        proc-vmstat.nr_active_anon
   9381538            -7.9%    8641925        proc-vmstat.nr_anon_pages
     18112            -8.0%      16669        proc-vmstat.nr_anon_transparent_hugepages
   3615325            +1.6%    3673671        proc-vmstat.nr_dirty_background_threshold
   7239491            +1.6%    7356326        proc-vmstat.nr_dirty_threshold
  36406902            +1.6%   36983177        proc-vmstat.nr_free_pages
  36161545            +1.6%   36744053        proc-vmstat.nr_free_pages_blocks
     18649            -5.6%      17609        proc-vmstat.nr_page_table_pages
    145727            -4.0%     139928 ±  2%  proc-vmstat.nr_shmem
   9573428            -7.9%    8820214        proc-vmstat.nr_zone_active_anon
   4676636           -12.0%    4113946        proc-vmstat.numa_huge_pte_updates
 2.395e+09           -12.0%  2.106e+09        proc-vmstat.numa_pte_updates
      3.69            -2.6%       3.59        perf-stat.i.MPKI
  25933220 ±  2%      -7.5%   23983956        perf-stat.i.branch-misses
     72.64            -1.7       70.92        perf-stat.i.cache-miss-rate%
 8.254e+08            -3.3%  7.985e+08        perf-stat.i.cache-misses
      8791            +6.3%       9344        perf-stat.i.context-switches
      3.00            -6.3%       2.81        perf-stat.i.cpi
 6.733e+11            -7.0%  6.262e+11        perf-stat.i.cpu-cycles
    812.82            -3.9%     781.10        perf-stat.i.cycles-between-cache-misses
      0.34            +7.0%       0.36        perf-stat.i.ipc
      3.70            -2.5%       3.61        perf-stat.overall.MPKI
      0.03            -0.0        0.03        perf-stat.overall.branch-miss-rate%
     72.83            -1.7       71.16        perf-stat.overall.cache-miss-rate%
      3.01            -6.2%       2.83        perf-stat.overall.cpi
    814.12            -3.8%     783.11        perf-stat.overall.cycles-between-cache-misses
      0.33            +6.6%       0.35        perf-stat.overall.ipc
  22052951            -7.8%   20340363        perf-stat.ps.branch-misses
 7.949e+08            -2.8%  7.728e+08        perf-stat.ps.cache-misses
      8696            +4.7%       9105        perf-stat.ps.context-switches
 6.471e+11            -6.5%  6.052e+11        perf-stat.ps.cpu-cycles
    569.36            +1.4%     577.21        perf-stat.ps.cpu-migrations
     32.67            -0.9       31.80        perf-profile.calltrace.cycles-pp.do_rw_once
     44.13            -0.4       43.74        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     44.00            -0.4       43.62        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     44.00            -0.4       43.62        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     43.80            -0.4       43.41        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     43.86            -0.4       43.48        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     43.70            -0.4       43.32        perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     43.13            -0.4       42.77        perf-profile.calltrace.cycles-pp.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     39.61            -0.3       39.28        perf-profile.calltrace.cycles-pp.clear_page_erms.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault
     41.47            -0.3       41.16        perf-profile.calltrace.cycles-pp.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.33 ± 21%      +1.1        2.48 ± 17%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.34 ± 21%      +1.1        2.48 ± 17%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.33 ± 21%      +1.1        2.48 ± 16%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.33 ± 21%      +1.2        2.48 ± 17%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.33 ± 21%      +1.2        2.48 ± 17%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      1.35 ± 21%      +1.2        2.51 ± 16%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.calltrace.cycles-pp.common_startup_64
      2.50 ± 21%      +2.2        4.71 ± 16%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
     42.55            -0.5       42.01        perf-profile.children.cycles-pp.do_rw_once
     44.04            -0.4       43.65        perf-profile.children.cycles-pp.exc_page_fault
     44.19            -0.4       43.80        perf-profile.children.cycles-pp.asm_exc_page_fault
     44.04            -0.4       43.65        perf-profile.children.cycles-pp.do_user_addr_fault
     43.89            -0.4       43.51        perf-profile.children.cycles-pp.handle_mm_fault
     43.82            -0.4       43.44        perf-profile.children.cycles-pp.__handle_mm_fault
     43.70            -0.4       43.32        perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
     43.13            -0.4       42.77        perf-profile.children.cycles-pp.vma_alloc_anon_folio_pmd
     42.23            -0.3       41.88        perf-profile.children.cycles-pp.folio_zero_user
     39.95            -0.3       39.62        perf-profile.children.cycles-pp.clear_page_erms
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.___perf_sw_event
      0.45 ± 12%      +0.1        0.54 ± 12%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.45 ± 11%      +0.1        0.54 ± 12%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.48 ± 11%      +0.1        0.57 ± 13%  perf-profile.children.cycles-pp.worker_thread
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.47 ± 11%      +0.1        0.56 ± 12%  perf-profile.children.cycles-pp.process_one_work
      3.27 ±  9%      +1.1        4.34 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.pv_native_safe_halt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.34 ± 21%      +1.2        2.50 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter
      1.34 ± 21%      +1.2        2.50 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.children.cycles-pp.start_secondary
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.common_startup_64
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.do_idle
     40.98            -0.6       40.37        perf-profile.self.cycles-pp.do_rw_once
     39.02            -0.3       38.71        perf-profile.self.cycles-pp.clear_page_erms
      0.99            -0.0        0.94        perf-profile.self.cycles-pp.folio_zero_user
      0.44 ± 12%      +0.1        0.53 ± 12%  perf-profile.self.cycles-pp.memcpy_toio
      1.24 ± 21%      +1.1        2.34 ± 16%  perf-profile.self.cycles-pp.pv_native_safe_halt





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


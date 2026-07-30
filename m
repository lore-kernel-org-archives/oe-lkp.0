Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0852390CBA
	for <oe-lkp@lists.linux.dev>; Thu, 30 Jul 2026 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392145; cv=fail; b=ElRCNn3Aflq7srqL0qjX5LL42fU2HoXmWFJ/LE3sjAy88V0xNyUjWXH+akUuWlOXpJgMq/5OF7PRIgeo7Ovpvm2kOHi8SwO3VNSaDBGzneg0LVLpns4q3yz9cPN6DTv3mOy7qAIlMfj2gNbO7p4KDH2z8pRY4XubgSuN5asHUm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392145; c=relaxed/simple;
	bh=ypqgGMmfnEshRNM9EvMNxqvcAuLJ52uyRK7XfyIIZ50=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l171H2yjQDih5dJz75H+tstVbyQHbiwg2v6SSGWrB7JAi3NsDXNd8NlpxThILHIR/b6FLUhCbOxaYxJ3oR2eCK1kT/E4fqXvTwHmfHWnMWtZLJ778/igpa/5w4abZg3yEUyY3ht4ebeZulmUHaXC2BTCM3sWvZg5SN2B/epk/rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGcIV2gH; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGcIV2gH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785392116; x=1816928116;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ypqgGMmfnEshRNM9EvMNxqvcAuLJ52uyRK7XfyIIZ50=;
  b=bGcIV2gHCnCdD26rmn3jasjv3UmKv9CwXrQi/qqcpCezFBmLraruP7fd
   p2+8oQAgmGGDyUXA6txbA4DxcNTDoZC+N221PooVOcF3XySuOgvmOPnV9
   KEyvngpOvcB5nS0hnW0FmA+p7aPXPNLP10kRVYKgMnVkOlLd+Ou6yqd+5
   qV0sd74m3hxI1DBJ3/N0YHeR+KRSpqm7Q+a7A1pTjCFHTUHiXNJs0fsHC
   wplUY2vozc/R/G0HgkfKE4f99ONSt96CwSFEHZmtEHZoTeF2K8i7LCdhG
   X/GFfSrO35nCwatM/yC0niV7sFNajmIl8trr9I+JWHP8f2Ys5Ucjx95HU
   Q==;
X-CSE-ConnectionGUID: qbWt29T1QlSfyAK6MLMLow==
X-CSE-MsgGUID: CXjtxtH+QZKnookYcO0Aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103542707"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103542707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:15:07 -0700
X-CSE-ConnectionGUID: TQWCi3f4SwmvcY7py4zuMg==
X-CSE-MsgGUID: XZKAae0xSCScs6qpHI1QsQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:15:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 23:15:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 23:15:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 23:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoIotrFvnf/+TC5lQKomswCrL0tDr7ISdZFVGWImLi5O76RBAHUWs2IsuZdD67CiinwdY4tgluJta5RwPvx2SXum13tLWuqH6cCcHza/dAOMRAruXVvZghnwWXmUCeckym25XkXlP4m7N8erX6HyMUlfRFtMAtQRyC1+p2P4Zm1oDnZG9AU7xAXtC7FEAo+Q3Or5JPpvcAYt3ZmLlOxhIvsRHQSKE7udTv8HQN69QT3CxalzOLmZudEl1Oy7q6IZjdfzANuZpQqDCBeDG8TENPzVDa1ys26ANjQd2fOaglsowDNnpA8MTfpabxbGqM/UGuXqSFgg6xuDfFuOwH6UPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q60XM7grbBh2dlhVh0hiTb3rM7Ml9x7fyuUQZDlcfic=;
 b=nhYLGa/fBSfjFsvek0rX79vTGcdYb3PJye0aVV4Bqjf1imnblfng31HsILH8jtFbewRpXRRJa16L6cv5X2H4z9NCwGsBB+Oi+VsPsnaitpML43KMteQQGf/ZcFw0Yl0mGiXCGpR5khuhZyi2tyIBelZiC58UUVWfdYRJwBaGAwDazDtDlisgm23f00cmc799ApLkiG/95ljtZEQsASnBx46EaeL8oNqOnXCsewVcozDcPJ1RjtAvqQ4I0h3NWVPNODxMrxtg21BHpIT8RY3539TqmZo6AV+338HZ8ixcsOoKLD3ugYZy4ORQ2GNg1smr1//nFH3hDi9ySHncvBXzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 30 Jul
 2026 06:15:02 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 06:14:59 +0000
Date: Thu, 30 Jul 2026 14:14:21 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <tim.c.chen@intel.com>,
	<vinicius.gomes@intel.com>, <ehab.ababneh@intel.com>,
	<thomas.falcon@intel.com>, <philip.li@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [sched/fair]  fb1050ac8e:
 netperf.Throughput_Mbps 14.6% regression
Message-ID: <amrrvTgy/p6c6WbJ@xsang-desk>
References: <202607151644.d59b94e9-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202607151644.d59b94e9-lkp@intel.com>
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f6af4c-2deb-4b55-f578-08deee01e1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|6133799003|22082099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: DRh/vLbw1V+xD+T8mENDuNNoypDtW/zh4T5kPKqQBC9Dpwi8cc2fgRlz3ijijmc9bSyQ5QquxKp0bPDYQx2XTHlZ2cMzBiDBruClQKHF2GB6PvMjb87iajn9HkWXaC6zK6wQvmo2OkZdmQUoUS9m1FolAxnRXxKB2ZL0iYQAVGptUkPYDp5fN5+pXLMsZZ/+ykdekL2YtE3IDJsRH3rr2rjgVgCEjCL4Qz9CAwZ2UR/KfAK/1W7HxUvYjTo9FAm6aVZXLyDNH+1m9EW/ep5dfj527ZY/xeOp8B09xoaUu8my3sQHoO2ygSTno5v2tz4j8rk02UqOa7WEuQB/el/R05xscNIiP91wZbrnPsxffVkm/PqRv609FjtOWx4qGECVBNOcopiWYfD/kVX92952XL29QzKx3QFLaqw7KfeMlOJfzivvkN3FlnDKKZw1E1FucjqYOlQLeB6JEQ3e5WoiNVzHxW2w6qagCUXv5JSRLZu1fKhjdg9InCN8ZWXwmMplDtCnDk12F+lHaFGNvmk7VbOysMCQ3f33E/eaq0hhr/GNtY795SNOg1utmMLZFOf+vjchgCS44I5c8A2z4SeDyzALGnMx1byHflhIRKwu/4gFMCaTDLPjLUmK0eGZX/mTaVR7JP8tycH6gDeTb/ty7k4EK82+x/fzYsEtPJvEUs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(6133799003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eCtuQU16bDcxSytORHlkUHpNMXUrS052VDNPSU9pY3pXQmlOTk8vUVB1MFZU?=
 =?utf-8?B?Qm4za0tkbENZYUE4c1BRWm8ySWZPbnhuTG0yOGNxTHFVSzhEdFUxVVdmTEJk?=
 =?utf-8?B?d1c1VGhkZncyZ0dqWHN1SnJWZXR4RWdjREljL1hmR0ZCR0ZpRFlFMXpuL3RS?=
 =?utf-8?B?VWhYSVU4Ui9iQWp1Z1Z3TjcrUFg5QlpKMTVpVy9LSVJCaTJCOC84ajR5VCtQ?=
 =?utf-8?B?TFZ1UFZ6eEpzekFhT1RacHhoYSs4ZHdzUG53eFZQMmlsanVrTjF3K0owdEtx?=
 =?utf-8?B?WVVEci8zbUM4djl2QzlSRzF6R0lFbmo0anFXMDNIbnljYTJlN0crTk5CdFF3?=
 =?utf-8?B?bWxVTmNvVVA1M0dwMXpJaUpVVy83ZmIyeWFRSVZvanVxSk41Ynd4SjVYd2ZI?=
 =?utf-8?B?aWVQYVlQejBheUQ0TlNmckwvZ09RQlJpeThlWXJ1U0hUelh5OGgrWG9pR0JY?=
 =?utf-8?B?Q29HdmYxVEVOREUrT29HZlk0Nm83c3JOYmFwdTAzSFBsYjdDRk5DV1JoTkg1?=
 =?utf-8?B?cTI5SXlqNDdhTm56Rkx5d2JNWThmT1lrY2F5cDkybzZvMkk2MWp3T3VqMHNC?=
 =?utf-8?B?YUw0cWRxRXM0eHJFM1lTOXJrOTRYb2dIRzRYWmRWbWMrMHIvNE9uNWVSaTBP?=
 =?utf-8?B?VFl2YjVwT3czajRrV3RGbEMzSTl4d0lKVnZmbUF3ZnlsREFaNkdyN205bkxH?=
 =?utf-8?B?MEh3VzM4cnlLT2w2UGhWSjVyOE90aFk3TlBIeDl1cXlseTd0OVhMeThOR3J0?=
 =?utf-8?B?U3FtM1pPU3FUK0hXeVB2OTdVQUp2N1hRUVVHcG5NTVRpY0o2cUxCQjlWdWcx?=
 =?utf-8?B?WW0wSWVBK0FSRXJVTmFqQ1MxSGlRTzVZN0pFd09pMDNJTVMvN0JveEp3aFpk?=
 =?utf-8?B?N21CQXNNTDBrby9nc2xPZDFvc3FjdXFnNEJCZEhiTHVlNitRY3ZhQU5oVGth?=
 =?utf-8?B?ZlNTSHZhS2J2MFNRNE0rdHlHTzJVZWdyTE8vSlVXUWJCOUVmYWNtV0YwQjhQ?=
 =?utf-8?B?bE93L0JrV2tsYWhhVCs4QzZjdzhzNWMzV2g5bTNiTGFtU3BHQ2VicVR3Vyt2?=
 =?utf-8?B?UGU1ZnRJUDI4bU1TV3o5MHhJZElJQzF2Z090QVA2SDRZVElrbm5WWExMVlRm?=
 =?utf-8?B?b282UTFTRGxYYmI4MTFpYWNTZjcwN0N4ZGxJMitnOG9KQWJ3VUVxM09FQ1VI?=
 =?utf-8?B?L1NQMnlvSHFDZGU2NFZEMlVlVTZpRVdkNDgyZytSNmtKUlVwYm1WaXcyZVds?=
 =?utf-8?B?ZCtxNWR2OG43cjFXK2MrK3diUXBQSXhCRHJUdFNlR1E1VGVpN0RQZmdaQzVU?=
 =?utf-8?B?cnVTa3lzWFo3V3lRRlVxc0o3UkxHTXZ4eDBaSktPMDhBY1NQT01JUGZkRjNE?=
 =?utf-8?B?MVpvN0FSNlpzMjRVbzBjV0Iwbzl6dXhnOGRzRGI1NjB4SDNabW9rZlVnbEta?=
 =?utf-8?B?ZHEvTks4NFN4d2ViR2dCUjlMV1pha3grOFJKdEc1TEcwVXp5d1hrOFJ4WXdV?=
 =?utf-8?B?TlFmUmRQMmRvbDN0RG1qdUF2MnBNUmtMM1BGYUtNTFdwTFRCSFpyN05NY0hh?=
 =?utf-8?B?VTh2ZkNYR3o2T0l2Wm1Ic1k5U1NLcWhKZEhnWFRjSFBLeXJSQlI3bDNZZk0x?=
 =?utf-8?B?VXBiMWhlWC9YUldEeGhDY210Qndqd2hHVmIwYXUrbWgyTGF6STU1QmRCaGhE?=
 =?utf-8?B?TUJOeFV3dXUvVEFNV0RQY1FvSWd6QkNHZ3NsVWs2aXBNeFgyUVVwVGVoWHJ3?=
 =?utf-8?B?TVBBemlHUEJYYndidjRLdUtXNDJWWXNta3RSS3V2bHhlUzVoVFpJY2xMRTFz?=
 =?utf-8?B?ellqWEZGWlVDc3ByVDVxa3JFdk4ydWdNajZwNFlmZlUrZUlwRXZ4OHVBTXdE?=
 =?utf-8?B?Ullkd1VNS2hZY3pjUlNvQnVCek1TK0JIcGFuZFZUY2Z0NEZNTklGU2xkU25l?=
 =?utf-8?B?QUlkbnpoYkFlR3JURG5hdy8xUnNabGJxdUl3Q1NlcE4zRlExK3YwRXJ4aVJh?=
 =?utf-8?B?MUR0dkIvNmN6cUExd0JLSkFUZkdPTmt3bTREOW1PdDRDc3pvUVU0Z01RRzEz?=
 =?utf-8?B?UlRJcTRjd2JZejFvUjROQmtkbk5sQ0lsN1QxcHZCcXIzeDgzbWpSZ01OQnVJ?=
 =?utf-8?B?Ly9PL2hlSzhYeGJ2K21aOGxOS3hGeWNNbzRiMjZ2WWJlUHhFQ1lPMm1qVlMr?=
 =?utf-8?B?azhsSUd6bW1ZRzlrczlCQmtDZmlIdGF2UTNrT1ZPSzdlVW53VThmWmN5L0hI?=
 =?utf-8?B?WXlmWmJZMzRLV2F3amFZRVdhVGk5STIxQXE2K3JndzR0cTQ5alN5ellkV2Y5?=
 =?utf-8?B?UWN0cEo2VXRWYWNHSmdvL2ZDTGJVY1R1ZEVOb3pmSUN0M3YreXdEZz09?=
X-Exchange-RoutingPolicyChecked: Eatj7wYKKi9be/Dr8Rdi912SqgdoPs3eVGFxmf+UpS1TmwaaXkApovjoI7/5EMSn/UEIZgSrS+UuS0vcRSLf/Z32IvwqT04f1LXjS072O+PHnkYCPOqiw+Luu5cuHrLW5l/ztg9Nx7Ck5aaFYURc/9yC1IbMTBhJg9qKAxJjOkfg+OBKststNzVQwIRSP6NNVpgDC6uae8/RWsiHN6Ij96SwPnKZI/7XT1q4DsbE/qLhqBlXxIlQ7BlgYVdJxQC2VBK05vUBHpnvLjEzU3mQhBM9478EHi4fCWF858gTDtmaZ2L4QP7QQwvLY95KWmfUO/U8G+OMx4XuvuA2mgxnzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f6af4c-2deb-4b55-f578-08deee01e1c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:14:59.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4I0vyEX7xPHqRqNWzngle3R5M4xF+Z6A8vmkSI3eLayXHtTs4IH8AYds5F7g5A7IGVqb3kNXXI2FVUSuhkEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

we are currently piloting AI integrations to help enhance 0-Day's performance
analysis and regression-detection capabilities. Since this is in an early trial
phase, we want to ensure we build features that genuinely support your workflow.
We would love to hear what you would like to see from AI-assisted reports, whether
it's specific bottleneck explanations, a cleaner format, or filtering ideas.

Please share your thoughts and suggestions with us to help guide our development!


-----
Regression Report: netperf TCP_MAERTS throughput regression from
sched/fair cgroup_mode default change
====================================================================

Factual Summary
----------------

What this commit does:

  This commit flips the kernel-wide default for the cgroup-weight
  calculation function used by CONFIG_FAIR_GROUP_SCHED from "smp" mode
  (mode 1, flat per-taskgroup share) to "concur" mode (mode 2, share
  scaled by min(runnable tasks, cpus) in that taskgroup). It changes only
  two lines: the debugfs cgroup_mode default in kernel/sched/debug.c and
  the calc_group_shares static_call default in kernel/sched/fair.c
  (plus the corresponding case/default fallthrough in
  __sched_cgroup_mode_update()).

Code changes and measured impact:

  From kernel/sched/debug.c:

    -static int cgroup_mode = 1;
    +static int cgroup_mode = 2;

  From kernel/sched/fair.c:

    -DEFINE_STATIC_CALL(calc_group_shares, calc_smp_shares);
    +DEFINE_STATIC_CALL(calc_group_shares, calc_concur_shares);

     void __sched_cgroup_mode_update(int mode)
     {
             ...
             case 1:
    -        default:
                     func = &calc_smp_shares;
                     break;
             case 2:
    +        default:
                     func = &calc_concur_shares;
                     break;

  The two candidate functions (both present unchanged since the
  preceding patch in the series, kernel/sched/fair.c):

    static long calc_smp_shares(struct cfs_rq *cfs_rq)
    {
            struct task_group *tg = cfs_rq->tg;
            long tg_shares = READ_ONCE(tg->shares);
            return __calc_smp_shares(cfs_rq, tg_shares, tg_shares);
    }

    static long calc_concur_shares(struct cfs_rq *cfs_rq)
    {
            struct task_group *tg = cfs_rq->tg;
            int nr = min(tg_tasks(tg), tg_cpus(tg));
            long tg_shares = READ_ONCE(tg->shares);
            return __calc_smp_shares(cfs_rq, nr * tg_shares, nr * tg_shares);
    }

  calc_group_shares() feeds directly into update_cfs_group(), which is
  called on every enqueue/dequeue/tick for the group scheduling entity
  representing a cfs_rq in a taskgroup, and calls reweight_entity() when
  the computed shares differ from se->load.weight. Under concur mode the
  computed share for a taskgroup that is running tasks concurrently on
  multiple CPUs is now multiplied by nr = min(nr_tasks, nr_cpus), instead
  of being the flat tg->shares value smp mode used.

Measured deltas on the netperf localhost TCP_MAERTS test (comparing
  the parent commit 507f910a4e1f140a245b693441b42bcbc8128938 "sched/fair:
  Add cgroup_mode: tasks" against this FBC, both already carrying the
  calc_concur_shares/calc_smp_shares code, differing only in which mode
  is the active default):

    netperf.Throughput_Mbps               3403.37  ->  2907.66   (-15%)
    netperf.time.voluntary_context_switches
                                       382718343.50 -> 138221860.50 (-64%)
    vmstat.system.cs                     2514702.34 ->  903969.22 (-64%)
    perf-stat.i.context-switches         2530616.74 ->  907858.57 (-64%)
    sched_debug.cpu.nr_switches.avg      1997810.78 ->  712995.98 (-64%)
    cpuidle..usage                        726429.33 ->  477005.00 (-34%)
    sched_debug.cfs_rq:/.load.avg           6271.98 -> 943986.77 (+14951%)
    sched_debug.cfs_rq:/.load_avg.min          1.72 ->    492.25 (+28482%)
    sched_debug.cfs_rq:/.avg_vruntime.avg 27994620.07 -> 137492.38 (-100%)
    sched_debug.cfs_rq:/.zero_vruntime.avg 27994609.23 -> 137492.36 (-100%)

  The sched_debug.cfs_rq:/.load.avg and load_avg.min jumps by two to
  three orders of magnitude are consistent with the nr * tg_shares
  multiplication in calc_concur_shares() inflating group entity weight
  whenever more than one task/cpu is concurrently active in the
  taskgroup that wraps the netperf client/server processes.

  The regression is driven by a change in preemption behavior that
  follows from this weight inflation. Note that it is NOT explained by
  longer timeslices: in EEVDF the real-time slice length is
  weight-invariant, because vruntime accrues at delta_exec *
  NICE_0_LOAD/w while the deadline is set calc_delta_fair(slice, se) =
  slice * NICE_0_LOAD/w ahead, so update_deadline() (kernel/sched/fair.c)
  fires when delta_exec >= se->slice regardless of w; the same holds for
  set_protect_slice()/protect_slice(). What the nr factor actually
  changes is the group entity's RELATIVE weight against everything else
  on the root runqueue (kernel threads, ksoftirqd, other cgroups). A
  ~150x-heavier group entity dominates the root cfs_rq's V (the
  weighted-average virtual runtime / EEVDF zero-lag point), so sibling
  entities that would otherwise briefly preempt the netperf tasks stay
  ineligible (entity_eligible() := V >= v_i) for longer, and the wakeup
  preemption path (check_preempt_wakeup_fair() -> pick_next_entity()) is
  less likely to force a resched. Fewer preemptions of, and fewer
  wakeup-driven switches into and out of, the netperf group is the
  direct cause of the ~64% collapse in context switches across every
  related counter, and hence of the loopback ping-pong throughput loss.
  The avg_vruntime/zero_vruntime figures are a redundant symptom of the
  same weight inflation (a group entity's vruntime advances at 1/w, so
  its virtual clock crawls and its absolute V lands ~2 orders lower) and
  carry no information beyond the load.avg jump.

  The context-switch count and cpuidle usage both drop by roughly the
  same ~34-64% magnitude, but perf_profile.txt captured for this report
  is a userspace `perf` post-processing profile (process_simple,
  ordered_events__queue, callchain_cursor_append, do_sched_yield) rather
  than a kernel callgraph of the netperf/scheduler code path, so no
  function-level attribution within calc_concur_shares/update_cfs_group/
  reweight_entity is available, and the preemption mechanism above -
  though it follows directly from the EEVDF weight/eligibility math - is
  not confirmed cycle-for-cycle by callgraph evidence in this report.

  Evidence level: path-level perf-stat and sched_debug counters only.
  These establish that scheduling behavior on paths touching cfs_rq
  group-weight state changed materially (fewer voluntary context
  switches, radically different cfs_rq load/vruntime figures) between
  smp-default and concur-default kernels; they do not, by themselves,
  pinpoint which line inside calc_concur_shares/update_cfs_group is
  responsible cycle-for-cycle. No perf-record callgraph or perf-annotate
  data against the kernel scheduler code was available in this report.

Other impacts:

  A second bisect job, will-it-scale/performance-process-100%-sched_yield
  on lkp-ivb-2ep2, showed only noise-level deltas between the same two
  commits (turbostat.RAMWatt 10.92 -> 11.07, meminfo.AnonHugePages -5%,
  perf-c2c.HITM.local +65% ± 16-27%, cpu-migrations +4%); no
  will-it-scale throughput metric itself is reported as changed, so this
  secondary job does not show a comparable regression.

Contextual Analysis
--------------------

Patch series context:
  This commit is explicitly the last of a small series by Peter Zijlstra
  ("For all the reasons described in the preceding patches...") that
  introduces cgroup_mode as a debugfs-tunable (up/smp/concur/tasks/max)
  for how CONFIG_FAIR_GROUP_SCHED computes group share weight, then flips
  the shipped default from smp to concur. The commit message states the
  motivation directly: smp mode's flat tg->shares "infamously results in
  tiny shares when you have many CPUs," and concur mode is intended to
  fix that by scaling with concurrently-active task/cpu count. The
  commit also states this is preparatory work for "a flattened runqueue,
  where the hierarchical weight becomes far more important," i.e. this
  is an intentional, structural rebalancing of cgroup weight semantics,
  not an incidental default flip.

Subsystem status:
  This is a deliberate, described trade-off in the commit message
  itself: the author explicitly anticipates causing "trouble" for some
  users of the old smp-mode weight semantics and states the intent to
  "change the default and hope this serves more people than it hurts."
  Given that framing, a throughput regression on a workload whose
  netperf client/server processes run concurrently inside a cgroup
  taskgroup is plausibly exactly the kind of behavior change the author
  anticipated from the nr-scaled weight formula, rather than an
  unintended bug. Whether upstream has already weighed this specific
  netperf regression against the intended benefit (fixing "tiny shares"
  on many-CPU systems) could not be determined from available data.

Assessment:
  The regression correlates cleanly, at the path level, with the
  calc_concur_shares() nr-scaling formula: cfs_rq group load/weight
  figures move by orders of magnitude and voluntary context switches
  drop by roughly the same ~64% across every related counter
  (vmstat.system.cs, perf-stat context-switches,
  sched_debug.cpu.nr_switches.avg). The mechanism is a change in
  preemption behavior, not in timeslice length: the nr-inflated group
  entity now carries far more weight relative to other root-runqueue
  entities, dominates the runqueue's EEVDF eligibility ordering, and is
  therefore preempted far less often, at the expense of the fine-grained
  ping-pong scheduling that a loopback TCP_MAERTS stream needs for
  throughput. (The avg_vruntime/zero_vruntime collapse is a redundant
  bookkeeping-scale symptom of the same weight inflation, not an
  independent effect.) This is consistent with the commit's own stated
  trade-off (the "may hurt some, help others" default flip) rather than
  a memory-safety or correctness bug, so it appears intentional
  behavior change, not a defect — but no callgraph evidence isolates
  the exact instruction/cycle cost, and no independent maintainer
  acknowledgment of this specific netperf-class regression was found.


On Wed, Jul 15, 2026 at 09:39:32PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 14.6% regression of netperf.Throughput_Mbps on:
> 
> 
> commit: fb1050ac8e40aaa014291b5b53612d27890c2b09 ("sched/fair: Change the default cgroup_mode to concur")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [still regression on linux-next/master b9810cd75b9fb56a3425d391cba3f608502bd474]
> 
> testcase: netperf
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
> parameters:
> 
> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 200%
> 	cluster: cs-localhost
> 	test: TCP_MAERTS
> 	cpufreq_governor: performance
> 
> 
> In addition to that, the commit also has significant impact on the following tests:
> 
> +------------------+----------------------------------------------------+
> | testcase: change | netperf: netperf.Throughput_Mbps  15.9% regression |
> | test parameters  | cluster=cs-localhost                               |
> |                  | cpufreq_governor=performance                       |
> |                  | ip=ipv4                                            |
> |                  | nr_threads=200%                                    |
> |                  | runtime=300s                                       |
> |                  | test=TCP_STREAM                                    |
> +------------------+----------------------------------------------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202607151644.d59b94e9-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260715/202607151644.d59b94e9-lkp@intel.com
> 
> =========================================================================================
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
>   cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-srf-2sp3/TCP_MAERTS/netperf
> 
> commit: 
>   507f910a4e ("sched/fair: Add cgroup_mode: tasks")
>   fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
> 
> 507f910a4e1f140a fb1050ac8e40aaa014291b5b536 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>       3403           -14.6%       2907 ±  2%  netperf.ThroughputBoth_Mbps
>    1306892           -14.6%    1116542 ±  2%  netperf.ThroughputBoth_total_Mbps
>       3403           -14.6%       2907 ±  2%  netperf.Throughput_Mbps
>    1306892           -14.6%    1116542 ±  2%  netperf.Throughput_total_Mbps
>     211699            -3.1%     205223        netperf.time.minor_page_faults
>       6885            +1.7%       7004        netperf.time.percent_of_cpu_this_job_got
>      20717            +2.2%      21170        netperf.time.system_time
>     235.34           -30.7%     163.02        netperf.time.user_time
>  3.827e+08           -63.9%  1.382e+08 ±  2%  netperf.time.voluntary_context_switches
>  2.991e+09           -14.6%  2.556e+09 ±  2%  netperf.workload
>     726429 ± 21%     -34.3%     477005 ± 10%  cpuidle..usage
>    2514702 ±  2%     -64.1%     903969 ±  2%  vmstat.system.cs
>     579644            -4.8%     552002        meminfo.AnonHugePages
>   13229397 ±  8%     -29.0%    9388373 ± 17%  meminfo.DirectMap2M
>   7.12e+08 ±  4%     -11.7%  6.284e+08 ±  5%  numa-numastat.node1.local_node
>  7.121e+08 ±  4%     -11.7%  6.285e+08 ±  5%  numa-numastat.node1.numa_hit
>       0.51            +0.0        0.54 ±  2%  mpstat.cpu.all.irq%
>       3.77            -1.0        2.81 ±  5%  mpstat.cpu.all.soft%
>       1.38 ±  7%      -0.3        1.03 ±  7%  mpstat.cpu.all.usr%
>      15.67 ± 33%     -56.4%       6.83 ± 15%  mpstat.max_utilization.seconds
>    2530616 ±  2%     -64.1%     907858 ±  2%  perf-stat.i.context-switches
>    2514427 ±  2%     -64.0%     904092 ±  2%  perf-stat.ps.context-switches
>       3365 ±  2%      -4.5%       3214        perf-stat.ps.minor-faults
>       3365 ±  2%      -4.5%       3214        perf-stat.ps.page-faults
>      44464 ± 45%     -52.6%      21085 ± 39%  proc-vmstat.numa_hint_faults
>      33473 ± 56%     -53.1%      15699 ± 48%  proc-vmstat.numa_hint_faults_local
>  1.374e+09            -9.8%   1.24e+09 ±  2%  proc-vmstat.numa_hit
>  1.373e+09            -9.8%   1.24e+09 ±  2%  proc-vmstat.numa_local
>  1.097e+10            -9.8%  9.899e+09 ±  2%  proc-vmstat.pgalloc_normal
>    1163267 ±  2%      -3.8%    1119522        proc-vmstat.pgfault
>  1.097e+10            -9.8%  9.898e+09 ±  2%  proc-vmstat.pgfree
>    4061708 ±  2%     -77.8%     901816 ±157%  numa-meminfo.node0.FilePages
>      96650 ± 17%     -42.8%      55250 ± 45%  numa-meminfo.node0.KReclaimable
>       2076           -77.9%     458.92 ±133%  numa-meminfo.node0.Mlocked
>      96650 ± 17%     -42.8%      55250 ± 45%  numa-meminfo.node0.SReclaimable
>    4019895 ±  2%     -77.7%     897341 ±158%  numa-meminfo.node0.Unevictable
>    1676433 ± 14%    +196.1%    4964351 ± 28%  numa-meminfo.node1.FilePages
>    4213240 ±  8%     +80.2%    7592083 ± 20%  numa-meminfo.node1.MemUsed
>      54297 ±219%   +5750.8%    3176849 ± 44%  numa-meminfo.node1.Unevictable
>    1015390 ±  2%     -77.8%     225453 ±157%  numa-vmstat.node0.nr_file_pages
>     519.19           -77.9%     114.63 ±133%  numa-vmstat.node0.nr_mlock
>      24162 ± 17%     -42.8%      13812 ± 45%  numa-vmstat.node0.nr_slab_reclaimable
>    1004973 ±  2%     -77.7%     224335 ±158%  numa-vmstat.node0.nr_unevictable
>    1004973 ±  2%     -77.7%     224335 ±158%  numa-vmstat.node0.nr_zone_unevictable
>     419344 ± 14%    +195.8%    1240288 ± 28%  numa-vmstat.node1.nr_file_pages
>      13574 ±219%   +5750.8%     794212 ± 44%  numa-vmstat.node1.nr_unevictable
>      13574 ±219%   +5750.8%     794212 ± 44%  numa-vmstat.node1.nr_zone_unevictable
>  7.121e+08 ±  4%     -11.7%  6.285e+08 ±  5%  numa-vmstat.node1.numa_hit
>   7.12e+08 ±  4%     -11.7%  6.284e+08 ±  5%  numa-vmstat.node1.numa_local
>   27994620           -99.5%     137492        sched_debug.cfs_rq:/.avg_vruntime.avg
>   47828933 ±  3%     -99.7%     165353 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.max
>   22340066 ±  5%     -99.4%     125282 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
>    3719894 ±  9%     -99.8%       6807 ± 28%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       5.39 ±  3%     -21.1%       4.25 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.max
>       0.98 ±  4%     -39.0%       0.60 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
>       2.65            -6.7%       2.47 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.avg
>       5.06 ±  3%     -18.7%       4.11 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.max
>       0.89 ±  4%     -34.9%       0.58 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
>       6271 ± 23%  +14950.9%     943986        sched_debug.cfs_rq:/.load.avg
>     214887 ±108%    +653.9%    1620007 ±  5%  sched_debug.cfs_rq:/.load.max
>       1491 ± 23%  +32092.8%     480083 ± 17%  sched_debug.cfs_rq:/.load.min
>      16846 ±101%    +878.4%     164820 ±  8%  sched_debug.cfs_rq:/.load.stddev
>     217.79 ± 33%    +417.1%       1126 ±  5%  sched_debug.cfs_rq:/.load_avg.avg
>       1.72 ± 12%  +28482.3%     492.25 ± 17%  sched_debug.cfs_rq:/.load_avg.min
>       4620 ±  2%     -21.2%       3638 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
>     744.60 ±  4%     -53.1%     349.27 ± 11%  sched_debug.cfs_rq:/.runnable_avg.stddev
>     461.26 ±152%    +379.6%       2212 ± 58%  sched_debug.cfs_rq:/.sum_weight.avg
>       1410 ±  4%     -12.2%       1238 ±  3%  sched_debug.cfs_rq:/.util_avg.max
>       2001 ±  2%     -24.7%       1506 ±  5%  sched_debug.cfs_rq:/.util_est.avg
>       4231 ±  5%     -29.0%       3004 ±  6%  sched_debug.cfs_rq:/.util_est.max
>     697.09 ±  4%     -32.8%     468.49 ±  5%  sched_debug.cfs_rq:/.util_est.stddev
>   27994609           -99.5%     137492        sched_debug.cfs_rq:/.zero_vruntime.avg
>   47828866 ±  3%     -99.7%     165353 ±  2%  sched_debug.cfs_rq:/.zero_vruntime.max
>   22340061 ±  5%     -99.4%     125282 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.min
>    3719890 ±  9%     -99.8%       6807 ± 28%  sched_debug.cfs_rq:/.zero_vruntime.stddev
>     540017 ±  2%     -25.1%     404543 ±  2%  sched_debug.cpu.avg_idle.avg
>     245545 ±  3%     -17.0%     203708 ±  2%  sched_debug.cpu.avg_idle.stddev
>       1763 ±  4%     -61.3%     682.91 ±  9%  sched_debug.cpu.clock_task.stddev
>       5.39 ±  3%     -20.6%       4.28 ±  5%  sched_debug.cpu.nr_running.max
>       0.98 ±  3%     -39.2%       0.59 ±  7%  sched_debug.cpu.nr_running.stddev
>    1997810 ±  2%     -64.3%     712995 ±  2%  sched_debug.cpu.nr_switches.avg
>    7565068 ± 11%     -80.5%    1478272 ± 11%  sched_debug.cpu.nr_switches.max
>    1149303 ± 10%     -78.6%     245588 ± 37%  sched_debug.cpu.nr_switches.stddev
>       4.66 ± 17%     -68.7%       1.46 ±101%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       4.50 ± 16%     +47.5%       6.64 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>       4.50 ±  4%     +28.1%       5.77 ± 24%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_skb
>       5.95 ±  6%     -15.1%       5.05 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kfree_skb
>       6.81 ± 12%     -33.5%       4.52 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>       6.07 ±  9%     -21.9%       4.74 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       4.69 ±  3%     -16.4%       3.92 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      12.79 ±143%     -78.9%       2.69 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>       6.25 ± 22%     -27.4%       4.54 ± 13%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>       7.35 ± 17%     -43.0%       4.19 ± 16%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>       9.99 ± 80%     -55.0%       4.50        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>       5.26 ±  8%     -14.7%       4.49 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>       4.43 ±  8%     -16.1%       3.72 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       3.36 ± 37%     -86.4%       0.46 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_recvfrom
>       6.89 ±  8%     -22.8%       5.32 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_to_iter
>       5.88 ± 14%     -42.7%       3.37 ± 21%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
>       6.27 ± 19%     -28.7%       4.48 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_frozen_pages
>       6.40 ±  6%     -22.9%       4.94 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>       6.02 ±  2%     -17.6%       4.96 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>       7.62 ± 41%     -40.9%       4.50 ± 26%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>       4.59 ±  6%     -15.9%       3.86 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>       6.24 ±  8%     -20.1%       4.99 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>       4.51 ± 16%     -34.2%       2.97 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>       4.14 ± 33%     -95.0%       0.21 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       5.98 ±  8%     -40.9%       3.53 ± 71%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>       5.36 ± 17%     -59.9%       2.15 ± 72%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>       5.71 ±  7%     -16.7%       4.76 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       7.51 ± 46%     -54.3%       3.43 ± 71%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       4.50 ±  8%     -77.3%       1.02 ±106%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>       7.65 ± 22%     -31.0%       5.28 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack
>       6.70 ± 13%     -25.3%       5.00 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      22.26 ±155%     -91.2%       1.95 ±108%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       4.91 ± 34%     -79.9%       0.99 ±141%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>       6.11 ± 24%     -29.9%       4.28 ± 12%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>       5.30 ± 18%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>       6.03 ±  9%     -17.4%       4.98 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       5.07 ± 20%     -47.5%       2.66 ± 75%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       1.25 ±142%    +316.6%       5.20 ± 55%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_pacing_rate
>       5.95 ± 72%     -47.8%       3.10 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>       6.39 ± 42%     -99.9%       0.01 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>       5.23 ± 28%     -85.0%       0.78 ±147%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      10.56 ± 38%     -53.3%       4.93        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>       6.32 ±  5%     -24.4%       4.77 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>       5.48 ± 34%     -31.2%       3.77 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__virt_addr_valid.check_heap_object.__check_object_size
>       5.71 ± 10%     -18.1%       4.68 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>       4.48 ±  9%     -15.0%       3.81 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>       4.25 ±  3%     -15.2%       3.60 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>       4.48 ±  4%     -20.3%       3.57 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>       6.61 ±  4%     -22.9%       5.10 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>       6.61 ± 11%     -88.5%       0.76 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>       9.40 ± 52%     -60.0%       3.76 ± 18%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       4.34 ±  9%     -16.8%       3.61 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       3.73 ± 60%    +252.2%      13.15 ± 42%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
>       0.04 ± 37%     +93.2%       0.07 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
>       3.34 ± 64%    +133.0%       7.78 ± 28%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       5.58 ± 13%     +39.9%       7.81 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
>       2.18 ± 28%     -83.7%       0.36 ±136%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       8.95 ± 29%     -80.2%       1.77 ±110%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       9.10 ± 27%     -85.0%       1.36 ±206%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.send_omni_inner
>      74.70 ±181%     -91.2%       6.57 ± 28%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.send_omni_inner
>     240.78 ±141%    +333.9%       1044 ± 56%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>     181.30 ±206%     -96.1%       7.11 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_omni_inner.send_tcp_maerts
>     148.27 ±103%    +915.6%       1505 ± 28%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_skb
>     740.95 ±111%    +229.8%       2443 ± 28%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_put
>      12.68 ± 16%     -44.5%       7.04 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      10.48 ±  8%     -31.8%       7.15 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>     222.72 ±212%     -96.4%       7.91 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      10.21 ± 20%     -81.8%       1.86 ±140%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pi_memcpy
>     840.09 ±108%     -98.5%      12.68 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>     184.55 ±206%     -96.0%       7.39 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      13.54 ± 25%     -37.7%       8.43 ± 24%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      11.18 ± 30%     -61.3%       4.33 ± 85%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      12.08 ± 13%     -29.7%       8.49 ± 11%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      15.88 ± 13%     -34.3%      10.42 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       5.17 ± 71%     -90.5%       0.49 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_recvfrom
>      12.01 ±  8%     -29.1%       8.51 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_lock_irqsave
>      10.53 ± 13%     -32.0%       7.16 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>      12.37 ±  8%     -30.5%       8.59 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>      12.33 ± 14%     -26.6%       9.05 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>      12.31 ± 22%     -31.2%       8.47 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>     766.95 ± 98%     -71.5%     218.62 ±210%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>      13.79 ± 14%     -24.3%      10.44 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      10.12 ± 12%     -26.8%       7.41 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      15.13 ± 10%     -41.6%       8.84 ± 42%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>       9.65 ± 12%     -37.1%       6.07 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      12.71 ± 12%     -60.9%       4.97 ± 54%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      10.89 ± 22%     -69.8%       3.29 ±111%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      10.59 ± 12%     -23.3%       8.12 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>      12.34 ± 24%     -38.2%       7.63 ± 24%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       7.59 ± 43%     -96.7%       0.25 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      14.44 ± 12%     -56.7%       6.25 ± 73%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      12.30 ±  9%     -82.5%       2.15 ± 72%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>       9.70 ± 10%     -28.6%       6.93 ± 11%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>      87.12 ±195%     -94.4%       4.90 ± 72%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       9.98 ± 19%     -85.3%       1.47 ±100%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>       9.47 ± 12%     -35.6%       6.10 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      16.72 ± 47%     -42.5%       9.61 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>     276.44 ±214%     -99.1%       2.49 ±112%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       7.49 ± 38%     -86.8%       0.99 ±141%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>     890.86 ±103%     -83.1%     150.62 ±205%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>       8.34 ± 19%     -57.0%       3.59 ± 86%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>      64.81 ±184%     -91.6%       5.44 ± 52%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>       5.64 ± 16%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>      10.45 ± 15%     -59.1%       4.27 ± 73%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>       9.97 ±  6%     -26.6%       7.33 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>      11.16 ± 18%     -64.5%       3.97 ± 79%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>      13.21 ±  6%     -24.4%       9.99 ±  5%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_schedule_loss_probe
>      13.74 ± 27%     -36.0%       8.79 ± 24%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_send_mss
>      12.07 ± 12%     -28.9%       8.58 ± 15%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>      11.24 ± 19%     -26.8%       8.22 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      11.43 ±  9%     -31.8%       7.80 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_small_queue_check
>       1.25 ±142%    +363.6%       5.79 ± 47%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_pacing_rate
>     216.27 ±209%     -95.8%       9.00 ±  8%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>     491.03 ±102%    +195.4%       1450 ± 40%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_write_xmit
>       8.87 ± 43%     -99.9%       0.01 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>     106.76 ± 69%     -92.6%       7.87 ± 55%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>     836.00 ±121%     -98.7%      11.24 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
>       8.08 ± 36%     -87.8%       0.99 ±141%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>     849.83 ±106%     -98.8%      10.47 ±  8%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>      12.80 ±  8%     -48.8%       6.56 ± 44%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>     393.32 ±215%     -98.4%       6.34 ± 72%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>      13.02 ± 15%     -28.9%       9.25 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>       9.11 ±  6%     -35.2%       5.91 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      13.87 ± 10%     -76.2%       3.30 ±116%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      14.88 ±  7%     -20.5%      11.83 ±  2%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>      13.50 ±  6%     -19.1%      10.92 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>      11.76 ± 13%     -27.1%       8.57 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      14.49 ±  4%     -94.8%       0.76 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     581.80 ±155%     -98.1%      11.31 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      14.39 ±  8%     -29.6%      10.14 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       0.13 ± 89%    +297.7%       0.52 ± 47%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
>       3189 ± 35%     -79.1%     668.02 ±147%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       9.60 ± 16%     -63.0%       3.56 ±104%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       9.46 ± 16%     +40.5%      13.30 ± 20%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>      11.89 ±  6%     -15.1%      10.10 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kfree_skb
>      13.61 ± 12%     -33.5%       9.05 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      12.14 ±  9%     -21.9%       9.48 ± 10%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       9.68 ±  3%     -19.0%       7.84 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      25.87 ±141%     -84.6%       3.98 ± 71%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      12.50 ± 22%     -27.4%       9.08 ± 13%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>      14.98 ± 18%     -38.3%       9.23 ± 14%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>      19.99 ± 80%     -55.0%       9.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      10.77 ±  8%     -16.6%       8.98 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      21.05 ±103%     -79.0%       4.42 ±104%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       9.48 ± 10%     -21.3%       7.47 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>      11.88 ± 14%     -49.6%       5.99 ± 48%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
>       9.08 ± 15%     -44.8%       5.01 ± 74%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_lock_irqsave
>      12.55 ± 19%     -28.7%       8.95 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_frozen_pages
>      12.84 ±  6%     -23.1%       9.87 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>      12.05 ±  2%     -17.7%       9.92 ±  2%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>      15.54 ± 40%     -41.9%       9.02 ± 26%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>       9.44 ±  7%     -18.0%       7.74 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      12.52 ±  8%     -20.4%       9.97 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>       9.82 ± 12%     -35.2%       6.36 ± 45%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
>       9.33 ± 16%     -51.3%       4.55 ± 72%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>       9.12 ± 34%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      10.85 ± 17%     -57.4%       4.62 ± 72%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      11.57 ±  9%     -17.7%       9.52 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>      11.33 ± 12%     -19.2%       9.16 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_page_frag_refill
>      15.06 ± 46%     -54.1%       6.92 ± 71%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       9.24 ± 10%     -74.3%       2.37 ±149%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>      16.36 ± 18%     -35.4%      10.56 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack
>      13.39 ± 13%     -25.3%      10.00 ± 17%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      44.55 ±155%     -93.1%       3.09 ±143%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>      12.78 ± 24%     -32.9%       8.58 ± 12%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>      10.96 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>      12.06 ±  9%     -17.4%       9.96 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>      10.35 ± 21%     -46.6%       5.53 ± 76%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       9.71 ±  6%     -12.7%       8.48 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      10.05 ± 13%     -24.5%       7.58 ± 15%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_small_queue_check
>      12.02 ± 71%     -48.3%       6.21 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>      11.62 ± 14%     -23.1%       8.94 ± 16%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
>      14.92 ± 36%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>      11.58 ± 18%     -80.4%       2.27 ±141%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      21.14 ± 38%     -53.3%       9.86        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>      12.71 ±  5%     -24.3%       9.62 ±  2%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>      11.36 ± 33%     -33.0%       7.61 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__virt_addr_valid.check_heap_object.__check_object_size
>      11.42 ± 10%     -18.1%       9.35 ±  2%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>       9.36 ± 10%     -18.5%       7.63 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>       8.79 ±  4%     -18.0%       7.21 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>       9.33 ±  4%     -23.3%       7.16 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>      13.22 ±  4%     -22.9%      10.19 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      13.29 ± 12%     -84.9%       2.01 ±223%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>      18.99 ± 52%     -55.6%       8.43 ± 15%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       9.04 ± 11%     -20.0%       7.23 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>      10.76 ± 53%    +233.8%      35.90 ± 31%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
>     170.83 ± 12%     -88.1%      20.33 ± 49%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].send_omni_inner
>       6.83 ± 17%     -90.2%       0.67 ±111%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>      20.00 ± 18%     -96.7%       0.67 ±223%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.send_omni_inner
>      54.00 ± 16%     -91.4%       4.67 ± 60%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.send_omni_inner
>     494.50 ± 16%     -23.6%     377.67 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>      74.83 ±  9%     -90.2%       7.33 ± 65%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_omni_inner.send_tcp_maerts
>      25.17 ± 13%     -49.7%      12.67 ± 73%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      14.67 ± 52%     -96.6%       0.50 ±152%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pi_memcpy
>     473.83 ± 27%    +197.1%       1407 ± 31%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__refill_objects_node
>     512.00 ± 15%     +51.6%     776.33 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__release_sock
>     203.50 ± 17%     -49.5%     102.83 ± 20%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>     883.83 ± 20%     -88.6%     100.33 ± 60%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>      52.50 ± 11%     -44.4%      29.17 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      32.83 ± 30%     -85.8%       4.67 ± 42%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      18.83 ± 43%     -92.0%       1.50 ± 83%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>       1487 ± 12%     +32.5%       1970 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_transmit_skb
>     359.50 ± 16%     +29.1%     464.00 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__zone_watermark_ok
>     110357 ± 14%     +47.5%     162821 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
>      48511 ± 11%     -88.7%       5496 ± 57%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_to_iter
>       1805 ± 17%     -76.9%     416.83 ± 29%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_heap_object
>      13.33 ± 35%     -55.0%       6.00 ± 62%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>       1004 ± 13%     +52.5%       1531 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
>       4.17 ± 50%    +292.0%      16.33 ± 47%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_partial_node_bulk
>      89.17 ± 18%     +70.8%     152.33 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>     647.83 ± 18%     +39.3%     902.50 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kfree
>     253.00 ± 18%     +37.9%     349.00 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_free
>      27.50 ± 17%    +364.2%     127.67 ± 40%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>      48.33 ± 22%     -85.2%       7.17 ± 65%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>       1422 ± 17%     +37.7%       1958 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_erase
>       1.33 ± 82%    +525.0%       8.33 ± 81%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.refill_objects
>      24.50 ± 15%     -95.9%       1.00 ± 81%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>       5.33 ± 42%     -84.4%       0.83 ±128%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      28.33 ± 20%     -64.7%      10.00 ± 56%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       6.17 ± 36%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      13.33 ± 25%     -80.0%       2.67 ± 63%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>     705.00 ± 15%     +51.0%       1064 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_clone
>      17.67 ± 31%     -94.3%       1.00 ±100%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      13.33 ± 33%    +158.8%      34.50 ± 43%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>     494.83 ± 14%     -43.8%     278.00 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_page_frag_refill
>      94.00 ± 62%     -94.0%       5.67 ± 88%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       9.50 ± 37%     -94.7%       0.50 ±152%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>     383.50 ± 19%     -87.4%      48.17 ± 60%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>     523.83 ± 16%     +91.1%       1001 ± 29%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack
>       6282 ± 18%     +29.1%       8110 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_clean_rtx_queue
>      11.67 ± 48%     -90.0%       1.17 ±143%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>     114.00 ± 15%     +55.4%     177.17 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       6.00 ± 55%     -91.7%       0.50 ±100%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>     101.50 ± 78%     -94.7%       5.33 ± 91%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>       1.33 ± 55%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>     327.33 ± 18%     +62.4%     531.67 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mtu_probe
>      74.50 ±  9%     +40.9%     105.00 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>      10.33 ± 24%    +166.1%      27.50 ± 28%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push_one
>      11.17 ± 71%     -86.6%       1.50 ±113%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      29.83 ± 30%     -90.5%       2.83 ± 89%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       8.50 ± 43%     -94.1%       0.50 ±100%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>     403.17 ± 21%     -87.5%      50.33 ± 52%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>       5761 ± 14%     +49.9%       8638 ± 20%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg_locked
>      18.00 ± 71%     -94.4%       1.00 ±115%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>     660.33 ± 19%     +57.6%       1040 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>     228.67 ± 21%     +72.7%     394.83 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_validate_incoming
>       1139 ± 15%     +53.1%       1743 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_write_xmit
>       1411 ± 16%     +51.8%       2142 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
>       1.67 ± 28%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>      29.17 ± 32%     -78.3%       6.33 ± 83%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>       3093 ± 30%     -97.0%      92.00 ± 59%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
>       1164 ± 17%     -92.2%      91.00 ± 61%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
>      18016 ± 16%     +20.5%      21710 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
>       4.17 ± 50%     -80.0%       0.83 ±145%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>     187.17 ± 17%     +79.6%     336.17 ± 31%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>      68.67 ± 28%     -86.7%       9.17 ±102%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>       7.50 ± 42%    +206.7%      23.00 ± 36%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__pcs_replace_empty_main.kmem_cache_alloc_node_noprof.__alloc_skb
>      16.00 ±  7%    +242.7%      54.83 ± 40%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__pcs_replace_empty_main.kmem_cache_alloc_node_noprof.kmalloc_reserve
>      11.67 ± 34%    +164.3%      30.83 ± 38%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      28.83 ± 16%     -95.4%       1.33 ±103%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>       9.67 ± 36%     -98.3%       0.17 ±223%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     375.00 ± 24%     -84.0%      60.17 ± 62%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      14.50 ± 68%     -97.7%       0.33 ±223%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>      50886 ±  7%     -94.3%       2912 ± 54%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
>      17.90 ± 29%     -79.0%       3.76 ±107%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>      18.22 ± 27%     -86.0%       2.55 ±223%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.send_omni_inner
>     333.65 ±133%     -95.9%      13.79 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.send_omni_inner
>     481.56 ±141%    +333.9%       2089 ± 56%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>     362.61 ±206%     -95.9%      14.98 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_omni_inner.send_tcp_maerts
>     296.54 ±103%    +915.6%       3011 ± 28%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_skb
>       1645 ± 93%    +197.1%       4887 ± 28%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_put
>      25.36 ± 16%     -44.5%      14.08 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      20.96 ±  8%     -31.8%      14.30 ± 14%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>     445.45 ±212%     -97.4%      11.45 ± 72%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      20.42 ± 20%     -83.0%       3.47 ±154%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pi_memcpy
>       1682 ±108%     -96.9%      51.31 ±119%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>     369.10 ±206%     -96.0%      14.78 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      27.08 ± 25%     -37.1%      17.02 ± 24%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      22.35 ± 30%     -58.8%       9.21 ± 78%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      24.15 ± 13%     -29.7%      16.98 ± 11%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      49.06 ±132%     -85.6%       7.08 ±107%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>      57.04 ± 98%     -63.4%      20.85 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>      24.02 ±  8%     -51.6%      11.63 ± 74%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_lock_irqsave
>      21.06 ± 13%     -42.1%      12.20 ± 49%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>      24.75 ±  8%     -30.5%      17.19 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>      24.67 ± 14%     -26.6%      18.10 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>      24.63 ± 22%     -31.2%      16.93 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>       1533 ± 98%     -71.5%     437.24 ±210%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>      27.57 ± 14%     -24.3%      20.89 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      20.41 ± 12%     -27.4%      14.81 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      30.27 ± 10%     -39.3%      18.38 ± 34%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>      31.22 ± 38%     -47.7%      16.32 ± 49%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
>      19.30 ± 12%     -57.2%       8.26 ± 70%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      25.42 ± 12%     -69.4%       7.79 ± 80%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      21.77 ± 22%     -68.8%       6.78 ±109%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      22.22 ±  7%     -26.9%      16.24 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>      25.04 ± 23%     -46.5%      13.38 ± 51%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>      16.47 ± 38%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      28.88 ± 12%     -46.2%      15.55 ± 47%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      24.59 ±  9%     -81.2%       4.63 ± 72%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      19.40 ± 10%     -28.6%      13.86 ± 11%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>     174.25 ±195%     -94.4%       9.80 ± 72%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>      19.97 ± 19%     -87.4%       2.51 ±146%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>      18.94 ± 12%     -35.6%      12.19 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      33.44 ± 47%     -42.5%      19.23 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>     553.51 ±214%     -99.2%       4.16 ±142%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       1781 ±103%     -83.1%     301.23 ±205%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>      16.68 ± 19%     -60.8%       6.54 ±102%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>     129.62 ±184%     -91.6%      10.88 ± 52%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>      11.44 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>      20.90 ± 15%     -57.9%       8.80 ± 73%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      19.95 ±  6%     -26.6%      14.65 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>      22.33 ± 18%     -64.3%       7.98 ± 79%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>      26.42 ±  6%     -49.3%      13.40 ± 71%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_schedule_loss_probe
>      27.48 ± 27%     -36.0%      17.59 ± 24%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_send_mss
>      24.13 ± 12%     -28.9%      17.17 ± 15%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>      22.47 ± 19%     -26.8%      16.45 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      22.86 ±  9%     -31.8%      15.59 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_small_queue_check
>     432.54 ±209%     -95.8%      18.00 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>     984.55 ±102%    +194.6%       2900 ± 40%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_write_xmit
>      19.04 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>     263.13 ± 82%     -93.6%      16.75 ± 51%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>      16.67 ± 30%     -84.7%       2.54 ±141%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>       1700 ±106%     -98.8%      20.95 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>      26.03 ± 15%     -28.9%      18.51 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>      18.22 ±  6%     -35.2%      11.81 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      27.20 ± 10%     -38.2%      16.80 ± 15%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>      27.75 ± 10%     -76.2%       6.61 ±116%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      29.76 ±  7%     -20.5%      23.67 ±  2%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>      26.99 ±  6%     -19.1%      21.85 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>      23.52 ± 13%     -27.1%      17.14 ±  9%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      28.99 ±  4%     -93.1%       2.01 ±223%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>       1163 ±155%     -98.1%      22.63 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      28.78 ±  8%     -29.6%      20.27 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       4.50 ± 11%     -18.4%       3.67 ± 14%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__send.recv_omni
>       4.58 ±  9%     -19.2%       3.70 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__check_object_size
>       5.95 ±  6%     -15.1%       5.05 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kfree_skb
>       6.81 ± 12%     -33.5%       4.52 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>       6.07 ±  9%     -21.9%       4.74 ± 10%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       4.99 ±  3%     -21.4%       3.92 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      13.09 ±139%     -79.1%       2.74 ± 20%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>       6.25 ± 22%     -27.4%       4.54 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>       7.62 ± 19%     -33.9%       5.04 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>      10.00 ± 80%     -55.0%       4.50        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>       5.50 ±  7%     -18.4%       4.49 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      16.40 ±141%     -85.7%       2.34 ±101%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       5.05 ± 13%     -25.8%       3.75 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       6.00 ± 15%     -43.9%       3.37 ± 21%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
>       4.65 ± 15%     -26.9%       3.40 ± 22%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_lock_irqsave
>       6.32 ± 10%     -14.7%       5.39 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cubictcp_cwnd_event_tx_start
>       6.27 ± 19%     -28.7%       4.48 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_frozen_pages
>       6.43 ±  6%     -23.3%       4.94 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>       6.03 ±  2%     -17.8%       4.96 ±  2%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>       4.36 ±  8%     -16.8%       3.63 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_alloc_node_noprof
>       7.92 ± 40%     -43.0%       4.52 ± 26%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>       4.84 ±  8%     -20.0%       3.87 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>       6.29 ±  8%     -20.7%       4.99 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>       5.20 ± 10%     -32.0%       3.54 ± 19%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
>       4.82 ± 16%     -34.3%       3.17 ± 23%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>       7.60 ± 89%     -47.2%       4.01 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>       4.98 ± 12%     -23.7%       3.80 ± 10%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>       4.98 ± 35%     -95.8%       0.21 ±223%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       5.49 ± 17%     -55.0%       2.47 ± 75%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>       5.86 ± 11%     -18.6%       4.77 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       6.00 ± 11%     -23.2%       4.61 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_page_frag_refill
>       7.55 ± 46%     -53.8%       3.49 ± 71%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       8.71 ± 20%     -39.4%       5.28 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack
>       6.70 ± 13%     -25.3%       5.00 ± 17%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      22.30 ±155%     -91.2%       1.95 ±108%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       4.91 ± 34%     -79.9%       0.99 ±141%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>       6.67 ± 26%     -35.6%       4.29 ± 12%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>       5.66 ± 16%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>       4.92 ± 14%     -25.8%       3.66 ± 11%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_check_app_limited
>       6.03 ±  9%     -17.4%       4.98 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       5.28 ± 21%     -45.7%       2.87 ± 77%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       4.87 ± 16%     -25.9%       3.61 ± 18%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_send_mss
>       4.94 ±  7%     -14.1%       4.25 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>       5.10 ± 12%     -25.6%       3.79 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_small_queue_check
>       1.25 ±142%    +316.6%       5.20 ± 55%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_pacing_rate
>       6.07 ± 70%     -48.8%       3.11 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>       5.96 ± 14%     -24.8%       4.48 ± 16%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
>       1.12 ± 62%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vma_interval_tree_insert
>       8.54 ± 36%     -99.5%       0.04 ±223%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>       6.35 ± 13%     -76.7%       1.48 ±142%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      10.58 ± 38%     -53.3%       4.93        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>       6.39 ±  5%     -24.2%       4.85 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>       5.87 ± 32%     -34.7%       3.84 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__virt_addr_valid.check_heap_object.__check_object_size
>       5.71 ± 10%     -18.1%       4.68 ±  2%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>       4.88 ± 11%     -21.6%       3.82 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>       4.54 ±  5%     -20.7%       3.60 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>       4.85 ±  4%     -26.1%       3.59 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>       6.61 ±  4%     -22.9%       5.10 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>       9.59 ± 51%     -51.3%       4.67 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       4.70 ± 12%     -23.0%       3.62 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       7.48 ± 38%    +203.9%      22.75 ± 29%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
>       9.46 ± 24%     -76.8%       2.20 ±111%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       9.52 ± 24%     -85.6%       1.37 ±205%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.send_omni_inner
>     261.58 ±157%     -97.2%       7.35 ± 15%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.send_omni_inner
>     241.08 ±140%    +333.4%       1044 ± 56%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>     181.30 ±206%     -95.5%       8.13 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_omni_inner.send_tcp_maerts
>     148.27 ±103%    +915.6%       1505 ± 28%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_skb
>      11.28 ± 20%     -29.4%       7.96 ± 25%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__ip_queue_xmit
>      12.68 ± 16%     -44.5%       7.04 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      10.48 ±  8%     -31.8%       7.15 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>     222.72 ±212%     -96.4%       7.91 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      10.21 ± 20%     -83.0%       1.73 ±154%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pi_memcpy
>     842.24 ±108%     -95.1%      41.30 ±158%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>     184.55 ±206%     -96.0%       7.39 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      11.64 ± 28%     -52.2%       5.57 ± 54%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      12.08 ± 13%     -29.7%       8.49 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      40.92 ±167%     -90.7%       3.79 ±102%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>      43.72 ±141%     -76.2%      10.42 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>      12.01 ±  8%     -29.1%       8.51 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_lock_irqsave
>      10.53 ± 13%     -32.0%       7.16 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>       9.38 ± 16%     -26.9%       6.86 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cubictcp_cwnd_event_tx_start
>      12.37 ±  8%     -30.5%       8.59 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.free_tail_page_prepare
>      12.33 ± 14%     -26.6%       9.05 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>      12.31 ± 22%     -31.2%       8.47 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>     766.95 ± 98%     -71.5%     218.62 ±210%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get
>      13.79 ± 14%     -24.3%      10.44 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      10.43 ± 13%     -29.0%       7.41 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      16.30 ± 35%     -45.7%       8.85 ± 30%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
>       9.65 ± 12%     -32.1%       6.56 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      13.27 ± 13%     -62.6%       4.97 ± 54%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      11.16 ± 19%     -67.1%       3.67 ±100%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      11.62 ± 13%     -26.9%       8.50 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>      12.78 ± 23%     -40.3%       7.63 ± 24%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       9.19 ± 38%     -97.2%       0.25 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      12.30 ±  9%     -79.9%       2.48 ± 75%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      10.17 ± 19%     -31.9%       6.93 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>      87.12 ±195%     -94.4%       4.90 ± 72%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>      10.35 ± 22%     -77.6%       2.32 ±106%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>       9.47 ± 12%     -35.6%       6.10 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack_tstamp
>      16.72 ± 47%     -42.5%       9.61 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>     277.07 ±214%     -99.1%       2.49 ±112%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       7.49 ± 38%     -86.8%       0.99 ±141%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>       1018 ± 98%     -85.2%     150.62 ±205%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>       8.34 ± 19%     -57.0%       3.59 ± 86%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>      64.81 ±184%     -91.6%       5.44 ± 52%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>       5.91 ± 20%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mstamp_refresh
>      13.72 ± 15%     -22.2%      10.67 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>      10.45 ± 15%     -56.7%       4.53 ± 73%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>       9.97 ±  6%     -26.6%       7.33 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>      11.16 ± 18%     -63.2%       4.11 ± 80%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>      13.67 ± 11%     -23.6%      10.45 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rearm_rto
>      13.21 ±  6%     -24.4%       9.99 ±  5%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_schedule_loss_probe
>      13.74 ± 27%     -36.0%       8.79 ± 24%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_send_mss
>      12.07 ± 12%     -28.9%       8.58 ± 15%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>      11.24 ± 19%     -26.3%       8.28 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      11.43 ±  9%     -31.8%       7.80 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_small_queue_check
>       1.25 ±142%    +363.6%       5.79 ± 47%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_pacing_rate
>     216.27 ±209%     -95.8%       9.00 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>     493.78 ±101%    +193.7%       1450 ± 40%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_write_xmit
>       2.44 ± 14%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vma_interval_tree_insert
>      10.53 ± 34%     -99.6%       0.04 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.wait_woken
>       8.79 ± 22%     -79.6%       1.80 ±145%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>     850.98 ±106%     -98.8%      10.47 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>     393.32 ±215%     -98.2%       6.97 ± 71%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>      13.02 ± 15%     -28.8%       9.27 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_uncharge.__sk_mem_reduce_allocated
>       9.11 ±  6%     -35.2%       5.91 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      14.79 ± 10%     -43.2%       8.40 ± 15%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>      13.87 ± 10%     -74.0%       3.61 ±109%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      15.07 ±  6%     -21.5%      11.83 ±  2%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb
>      13.92 ±  7%     -21.5%      10.92 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.kmalloc_reserve.__alloc_skb
>      11.76 ± 13%     -27.1%       8.57 ±  9%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      14.49 ±  4%     -91.4%       1.25 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     581.81 ±155%     -98.0%      11.45 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      15.03 ±  6%     -32.6%      10.14 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
> 
> 
> ***************************************************************************************************
> 
> =========================================================================================
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
>   cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-srf-2sp3/TCP_STREAM/netperf
> 
> commit: 
>   507f910a4e ("sched/fair: Add cgroup_mode: tasks")
>   fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
> 
> 507f910a4e1f140a fb1050ac8e40aaa014291b5b536 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>       3415           -15.9%       2871        netperf.ThroughputBoth_Mbps
>    1311602           -15.9%    1102665        netperf.ThroughputBoth_total_Mbps
>       3415           -15.9%       2871        netperf.Throughput_Mbps
>    1311602           -15.9%    1102665        netperf.Throughput_total_Mbps
>  3.906e+08 ±  2%     -63.2%  1.439e+08 ±  2%  netperf.time.involuntary_context_switches
>     184303            -3.2%     178397        netperf.time.minor_page_faults
>      11296            +1.6%      11478        netperf.time.percent_of_cpu_this_job_got
>      33938            +2.0%      34626        netperf.time.system_time
>     444.02 ±  2%     -27.5%     321.87 ±  2%  netperf.time.user_time
>     425106 ± 27%     -48.3%     219585 ± 12%  netperf.time.voluntary_context_switches
>  3.002e+09           -15.9%  2.524e+09        netperf.workload
>    2305356 ± 21%     -58.8%     949461 ±  2%  vmstat.system.cs
>     586519 ±  2%      -6.9%     546337        meminfo.AnonHugePages
>   11484777 ±  5%      -6.5%   10733431 ±  2%  meminfo.max_used_kB
>    2312555 ± 22%     -58.8%     953006 ±  2%  perf-stat.i.context-switches
>    2305351 ± 21%     -58.8%     949985 ±  2%  perf-stat.ps.context-switches
>  6.875e+08 ±  6%     -10.6%  6.144e+08 ±  3%  numa-numastat.node0.local_node
>  6.877e+08 ±  6%     -10.6%  6.145e+08 ±  3%  numa-numastat.node0.numa_hit
>  6.895e+08 ±  6%     -12.1%  6.064e+08 ±  2%  numa-numastat.node1.local_node
>  6.896e+08 ±  6%     -12.1%  6.064e+08 ±  2%  numa-numastat.node1.numa_hit
>  6.877e+08 ±  6%     -10.6%  6.145e+08 ±  3%  numa-vmstat.node0.numa_hit
>  6.875e+08 ±  6%     -10.6%  6.144e+08 ±  3%  numa-vmstat.node0.numa_local
>  6.896e+08 ±  6%     -12.1%  6.064e+08 ±  2%  numa-vmstat.node1.numa_hit
>  6.895e+08 ±  6%     -12.1%  6.064e+08 ±  2%  numa-vmstat.node1.numa_local
>      61765 ± 27%     -45.3%      33775 ± 55%  proc-vmstat.numa_hint_faults
>  1.377e+09           -11.3%  1.221e+09        proc-vmstat.numa_hit
>  1.377e+09           -11.3%  1.221e+09        proc-vmstat.numa_local
>      36089 ± 72%     -49.6%      18197 ± 81%  proc-vmstat.numa_pages_migrated
>    1.1e+10           -11.4%  9.751e+09        proc-vmstat.pgalloc_normal
>    1309905 ± 23%     -13.9%    1128473        proc-vmstat.pgfault
>    1.1e+10           -11.4%   9.75e+09        proc-vmstat.pgfree
>      36089 ± 72%     -49.6%      18197 ± 81%  proc-vmstat.pgmigrate_success
>      93260 ± 19%     -14.8%      79425 ±  2%  proc-vmstat.pgreuse
>   30567010 ± 18%     -99.6%     137549        sched_debug.cfs_rq:/.avg_vruntime.avg
>   52038669 ± 13%     -99.7%     155636        sched_debug.cfs_rq:/.avg_vruntime.max
>   25036917 ± 20%     -99.5%     131487        sched_debug.cfs_rq:/.avg_vruntime.min
>    3813827 ± 13%     -99.9%       4431 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       0.72 ± 25%     +52.3%       1.10 ±  7%  sched_debug.cfs_rq:/.h_nr_queued.min
>       0.90 ± 15%     -36.4%       0.57 ±  7%  sched_debug.cfs_rq:/.h_nr_queued.stddev
>       0.72 ± 25%     +47.7%       1.07 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.min
>       0.81 ± 15%     -32.2%       0.55 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
>       5755 ±  5%  +15810.9%     915694 ±  5%  sched_debug.cfs_rq:/.load.avg
>     187789 ± 55%    +694.6%    1492199 ±  6%  sched_debug.cfs_rq:/.load.max
>       1468 ± 22%  +32787.2%     483043 ±  8%  sched_debug.cfs_rq:/.load.min
>      15048 ± 57%    +988.3%     163769 ± 11%  sched_debug.cfs_rq:/.load.stddev
>     259.63 ± 41%    +358.4%       1190 ± 12%  sched_debug.cfs_rq:/.load_avg.avg
>       1.60 ± 20%  +28101.0%     450.43 ±  6%  sched_debug.cfs_rq:/.load_avg.min
>     910.01 ± 20%     +50.9%       1373 ±  8%  sched_debug.cfs_rq:/.runnable_avg.min
>     677.09 ± 16%     -54.0%     311.62 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
>   30566998 ± 18%     -99.6%     137549        sched_debug.cfs_rq:/.zero_vruntime.avg
>   52038628 ± 13%     -99.7%     155636        sched_debug.cfs_rq:/.zero_vruntime.max
>   25036900 ± 20%     -99.5%     131487        sched_debug.cfs_rq:/.zero_vruntime.min
>    3813824 ± 13%     -99.9%       4431 ± 20%  sched_debug.cfs_rq:/.zero_vruntime.stddev
>     576947 ± 14%     -25.7%     428449 ±  7%  sched_debug.cpu.avg_idle.avg
>      41105 ±147%     -83.7%       6704 ± 23%  sched_debug.cpu.avg_idle.min
>      71.06 ± 31%    +126.3%     160.82 ± 26%  sched_debug.cpu.clock.stddev
>       1817 ± 10%     -59.8%     730.54 ± 15%  sched_debug.cpu.clock_task.stddev
>       0.00 ± 26%    +107.5%       0.00 ± 25%  sched_debug.cpu.next_balance.stddev
>       0.90 ± 15%     -36.2%       0.57 ±  6%  sched_debug.cpu.nr_running.stddev
>    2202054 ± 19%     -65.9%     750368 ±  2%  sched_debug.cpu.nr_switches.avg
>    8951264 ± 17%     -84.1%    1422266 ±  5%  sched_debug.cpu.nr_switches.max
>    1178409 ± 10%     -84.9%     177451 ± 17%  sched_debug.cpu.nr_switches.stddev
>       0.69 ± 17%     +45.9%       1.00 ± 12%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
>       5.18 ± 17%     -37.5%       3.24 ± 15%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>       4.77 ± 11%     -30.5%       3.31 ± 14%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>       6.54 ± 14%     -26.4%       4.81 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       4.57 ±  6%     -17.3%       3.78 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>       7.38 ± 11%     -40.6%       4.38 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>       6.42 ±  3%     -27.7%       4.64 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>       6.10 ±  8%     -28.4%       4.37 ± 12%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>       4.88 ± 11%     -38.5%       3.00 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>       4.99 ± 13%     -56.4%       2.18 ± 84%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>       5.45 ± 11%     -18.6%       4.44 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>       4.59 ± 28%     -71.2%       1.32 ± 68%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       4.33 ± 14%     -35.2%       2.81 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>       4.31 ±  6%     -18.3%       3.52 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       4.48 ± 12%     -30.4%       3.12 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>       4.70 ± 11%     -21.0%       3.71 ± 15%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>       6.29 ±  4%     -13.9%       5.42 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kfree_skbmem
>       4.33 ± 18%     -24.6%       3.26 ± 13%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>       5.73 ±  6%     -16.3%       4.79        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>       5.95 ± 13%     -16.1%       4.99 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>       5.78 ± 31%     -51.2%       2.82 ± 32%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.propagate_protected_usage
>       7.32 ± 81%     -45.8%       3.97 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_insert_color
>       6.02 ±  9%     -22.8%       4.65 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>       4.25 ±  3%     -11.9%       3.74 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>       6.12 ± 25%     -90.4%       0.58 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>       4.65 ± 12%     -24.4%       3.52 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>       4.60 ± 12%     -25.2%       3.44 ± 25%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       4.66 ± 22%     -35.1%       3.02 ± 42%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_reset_timer
>       4.60 ± 11%     -88.4%       0.53 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       5.34 ± 15%     -85.8%       0.76 ±199%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>       6.02 ± 10%     -21.8%       4.71 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       6.20 ± 23%     -72.9%       1.68 ±103%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>       6.87 ± 20%     -43.0%       3.92 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       4.56 ± 13%     -22.9%       3.52 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>       5.66 ± 10%     -80.3%       1.11 ±197%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       6.31 ± 22%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>       5.57           -18.3%       4.55        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       5.81 ± 18%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>       4.34 ±  7%     -20.0%       3.47 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>       5.57 ±  8%     -81.3%       1.04 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>       5.89 ±  6%     -22.2%       4.58 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       4.56 ± 23%     -61.7%       1.75 ±125%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>       6.42 ± 14%     -44.8%       3.55 ± 14%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>       5.70 ±  8%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>       6.30 ± 19%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>       5.79 ±  9%     +34.2%       7.76 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>       3.60 ± 10%     -20.1%       2.88 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>       6.52 ± 13%     -23.0%       5.02 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_v4_do_rcv
>       1.84 ± 33%     -79.0%       0.39 ± 96%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vma_interval_tree_insert
>       5.52 ± 19%     -96.0%       0.22 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>       3.96 ±  7%     -14.2%       3.40 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>       4.26 ±  4%     -13.8%       3.67 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       0.69 ± 31%     -80.2%       0.14 ±115%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
>       5.97 ±  7%     -21.0%       4.72        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>       6.49 ±  6%     -80.3%       1.28 ±122%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>       6.62 ±  5%     -33.7%       4.39 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>       5.72 ± 27%     -78.2%       1.25 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>       7.12 ± 28%     -52.0%       3.42 ± 12%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       6.23 ± 13%     -99.9%       0.01 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>       2.25 ± 72%    +227.3%       7.37 ± 28%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      69.99 ±177%     -90.0%       6.99 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>      25.45 ±119%     -68.7%       7.96 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__send.send_omni_inner
>      63.29 ±186%     -88.0%       7.58 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       8.24 ± 15%     -84.9%       1.24 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.recv_omni
>      10.68 ± 14%     -55.4%       4.77 ± 30%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.recv_omni
>      13.64 ± 11%     -51.3%       6.65 ± 31%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>       1000 ±100%    +136.6%       2368 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_put
>     853.07 ± 78%    +155.4%       2178 ± 31%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__free_frozen_pages
>     260.93 ±213%     -97.5%       6.48 ±  3%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      11.56 ± 32%     -44.5%       6.42 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>      14.25 ±  5%     -27.7%      10.30 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      11.68 ± 27%     -42.3%       6.74 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>       9.52 ± 13%     -40.4%       5.67 ± 23%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>      20.87 ± 71%     -58.7%       8.61 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>      14.38 ±  4%     -47.6%       7.54 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      14.54 ±  5%     -77.4%       3.28 ± 33%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      10.63 ± 22%     -73.4%       2.83 ± 88%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      12.99 ± 11%     -26.0%       9.61 ± 15%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_push_pending_frames
>      11.49 ± 17%     -27.2%       8.36 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>       8.59 ± 30%     -82.7%       1.49 ± 73%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>     841.73 ± 32%    +136.1%       1987 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_transmit_skb
>      11.54 ± 14%     -33.6%       7.67 ± 32%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>       5.45 ± 37%     -85.6%       0.79 ±199%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_recvfrom
>      12.25 ± 11%     -35.9%       7.85 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
>      11.71 ± 28%     -44.0%       6.56 ±  8%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
>      10.22 ± 26%     -37.6%       6.38 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_partial_node_bulk
>      17.00 ± 54%     -48.9%       8.68 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>      19.16 ± 89%     -48.2%       9.92 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_alloc_node_noprof
>      10.53 ±  7%     -24.0%       8.01 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>       9.59 ±  4%     -24.1%       7.28 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      18.33 ± 72%     -73.9%       4.78 ± 59%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>      10.35 ±  9%     -43.9%       5.80 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>       9.75 ± 26%     -38.8%       5.96 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.refill_stock
>       9.74 ±  5%     -38.2%       6.02 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      14.29 ± 12%     -22.3%      11.10 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>     193.18 ±210%     -97.6%       4.60 ± 56%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      10.68 ± 39%     -94.5%       0.58 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      14.45 ± 20%     -53.7%       6.68 ±  5%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       6.37 ± 24%     -83.4%       1.06 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       9.83 ± 20%     -91.4%       0.84 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      10.62 ± 17%     -86.2%       1.46 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      10.92 ± 16%     -37.2%       6.85 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       9.22 ± 26%     -40.9%       5.45 ± 12%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_release_head_state
>      11.33 ± 11%     -32.3%       7.67 ± 30%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>      12.09 ± 30%     -80.2%       2.39 ±104%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>     222.83 ±179%     -95.8%       9.34 ±  4%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       1016 ± 73%    +172.1%       2765 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_clean_rtx_queue
>      12.60 ±  9%     -37.6%       7.86 ± 15%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>       8.26 ± 18%     -83.0%       1.41 ±197%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       8.28 ± 25%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>      11.35 ±  5%     -18.1%       9.30 ±  6%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       8.04 ± 15%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>      57.43 ±182%     -91.0%       5.18 ± 59%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>      15.61 ± 10%     -39.1%       9.50 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>       8.59 ± 15%     -87.9%       1.04 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      11.03 ± 14%     -24.7%       8.30 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_check_app_limited
>      10.00 ±  9%     -42.2%       5.78 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       9.25 ±  7%     -68.3%       2.93 ±126%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       8.33 ± 38%     -79.0%       1.75 ±125%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>     144.59 ±156%     -94.1%       8.54 ± 27%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>      11.58 ±  5%     -15.5%       9.78 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_schedule_loss_probe
>      26.81 ±128%     -71.0%       7.77 ± 21%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>      54.46 ±179%     -85.5%       7.91 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>       8.68 ± 17%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>       7.65 ± 26%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>     159.73 ±198%   +1359.0%       2330 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>      12.64 ± 13%     -27.7%       9.14 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>       3.42 ± 27%     -73.0%       0.92 ±118%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vma_interval_tree_insert
>      26.34 ±115%     -62.5%       9.88 ±  4%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
>      52.26 ± 85%     -84.7%       7.98 ± 31%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>      11.09 ± 13%     +20.0%      13.31 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
>     920.98 ± 68%     -91.6%      77.58 ±166%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
>       8.58 ± 18%     -97.4%       0.22 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      13.25 ± 13%     -33.3%       8.84 ± 20%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>     344.92 ±105%     -98.3%       5.83 ± 51%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>      15.33 ± 10%     -31.2%      10.54 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>      21.55 ± 53%     -44.4%      11.98 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       2.91 ±  9%     -72.3%       0.81 ±129%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
>      10.49 ±  9%     -24.1%       7.96 ± 20%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      11.54 ± 15%     -25.1%       8.64 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>      14.04 ±  8%     -90.4%       1.34 ±122%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      10.35 ±  4%     -29.2%       7.33 ± 15%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      12.24 ± 22%     -89.8%       1.25 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     352.92 ±192%     -97.4%       9.30 ± 16%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       1175 ± 82%    +126.4%       2661 ± 11%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
>       9.21 ±  8%     -99.9%       0.01 ±200%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>      10.65 ± 16%     -21.4%       8.36 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>       9.10 ± 12%     -15.9%       7.66 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
>      13.08 ± 14%     -26.4%       9.63 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       9.38 ±  6%     -19.3%       7.57 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      14.76 ± 11%     -40.6%       8.76 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>      12.91 ±  3%     -27.7%       9.33 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>      12.28 ±  8%     -28.8%       8.74 ± 12%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      10.06 ± 10%     -44.0%       5.64 ± 53%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      10.20 ± 13%     -55.8%       4.51 ± 83%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>       9.21 ± 10%     -21.4%       7.24 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_push_pending_frames
>      11.04 ± 10%     -19.6%       8.88 ±  2%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      62.27 ±185%     -96.4%       2.26 ±123%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       9.09 ± 12%     -43.0%       5.18 ± 52%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>      10.45 ± 30%     -32.5%       7.06 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       9.33 ± 13%     -32.0%       6.34 ± 15%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>       9.73 ± 12%     -23.7%       7.43 ± 15%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>      25.01 ±105%     -71.5%       7.13 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.is_vmalloc_addr
>      12.64 ±  5%     -14.3%      10.84 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kfree_skbmem
>       9.09 ± 19%     -26.8%       6.66 ± 13%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>      11.45 ±  6%     -16.3%       9.58        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>       9.65 ± 21%     -25.3%       7.21 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      11.98 ± 12%     -16.1%      10.05 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      11.72 ± 31%     -64.7%       4.13 ± 83%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.propagate_protected_usage
>      14.84 ± 80%     -46.5%       7.95 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_insert_color
>      12.03 ±  9%     -22.8%       9.29 ±  4%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>       9.02 ±  3%     -16.9%       7.50 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>      12.71 ± 24%     -83.6%       2.09 ±200%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>       9.67 ± 14%     -27.3%       7.04 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>       9.65 ± 13%     -36.6%       6.12 ± 51%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       9.59 ± 21%     -41.1%       5.65 ± 57%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_reset_timer
>      10.98 ± 14%     -90.0%       1.09 ±199%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      10.81 ± 14%     -84.1%       1.71 ±200%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      12.10 ±  9%     -22.2%       9.42 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>      12.56 ± 22%     -67.6%       4.07 ± 96%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>      13.95 ± 20%     -38.9%       8.52 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       9.72 ± 13%     -26.9%       7.11 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>      11.32 ± 10%     -80.5%       2.20 ±200%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>      12.61 ± 22%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>      11.23           -18.9%       9.11        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>      11.74 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>       8.98 ±  6%     -22.6%       6.95 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>      11.17 ±  8%     -81.4%       2.08 ±200%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      11.77 ±  6%     -22.1%       9.16 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       9.81 ± 13%     -58.0%       4.12 ±122%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>      13.14 ± 14%     -39.5%       7.95 ± 13%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>      11.42 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>      12.80 ± 19%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>      11.65 ± 10%     +33.2%      15.52 ± 17%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>       7.30 ± 10%     -21.0%       5.76 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>      13.05 ± 13%     -23.0%      10.05 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_v4_do_rcv
>       9.47 ±  7%     -23.1%       7.28 ± 13%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_wmem_schedule
>      11.55 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>       8.26 ±  7%     -17.6%       6.81 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>       8.93 ±  4%     -17.6%       7.36 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>      11.95 ±  7%     -21.0%       9.44        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      13.19 ±  6%     -79.7%       2.68 ±122%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      13.24 ±  5%     -33.7%       8.77 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      11.51 ± 27%     -78.3%       2.50 ±200%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>      14.47 ± 28%     -45.7%       7.86 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      12.47 ± 13%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>      39.24 ±141%    +245.4%     135.50 ± 23%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>      15.46 ± 29%     +60.2%      24.78 ± 18%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      62.17 ± 33%     -51.4%      30.20 ± 42%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>     170.17 ± 29%     -90.8%      15.60 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>       1097 ±  7%     -26.0%     812.00 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].send_omni_inner
>      58.67 ± 13%     -40.0%      35.20 ± 29%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__send.send_omni_inner
>      24.50 ± 12%     -64.9%       8.60 ± 83%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>      12.00 ± 49%     -98.3%       0.20 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.recv_omni
>      47.00 ± 24%     -93.2%       3.20 ± 36%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.recv_omni
>      87.00 ± 33%     -92.4%       6.60 ± 36%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>     186.50 ± 12%     -35.7%     120.00 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_data.send_omni_inner
>     434.17 ±  7%     -22.1%     338.00 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.send_omni_inner.send_tcp_stream
>      54.17 ± 13%     -28.4%      38.80 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__check_object_size
>      24.50 ± 32%     -64.9%       8.60 ± 92%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>       2.17 ± 41%    +296.9%       8.60 ± 27%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pcs_replace_empty_main
>      19.67 ± 81%     -98.0%       0.40 ±122%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__pi_memcpy
>     536.83 ±  8%    +161.1%       1401 ± 22%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__refill_objects_node
>     513.00 ± 13%     +51.9%     779.00 ± 22%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__release_sock
>     167.00 ±  4%     -49.1%      85.00 ± 20%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>     804.17 ± 27%     -94.2%      46.80 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__skb_datagram_iter
>      35.00 ± 22%     -96.0%       1.40 ± 72%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      17.67 ± 45%     -89.8%       1.80 ±101%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>       5.67 ± 26%     -89.4%       0.60 ±133%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>     333.17 ±  4%     +24.1%     413.40 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__zone_watermark_ok
>     105548 ±  5%     +39.8%     147559 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
>      45912 ± 26%     -93.9%       2814 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_to_iter
>       1758 ± 36%     -82.9%     300.80 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_heap_object
>     581.83 ±  6%     -20.8%     460.60 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget
>     958.67 ±  5%     +48.7%       1425 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
>      79.00 ±  8%     +69.1%     133.60 ± 31%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_pfnblock_migratetype
>      26.67 ± 23%    +418.2%     138.20 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>     128.83 ± 14%     -28.4%      92.20 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.lock_sock_nested
>      70.50 ±104%     -97.2%       2.00 ± 70%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>       1282 ±  5%     +36.0%       1743 ± 22%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_erase
>      14.83 ± 31%     -31.2%      10.20 ± 20%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>      20.67 ± 21%     -92.3%       1.60 ± 50%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>       6.67 ± 36%     -97.0%       0.20 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      23.50 ±  8%     -57.4%      10.00 ± 68%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       3.50 ± 67%     -88.6%       0.40 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      14.17 ± 49%     -95.8%       0.60 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>     674.83 ±  4%     +41.1%     952.00 ± 20%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_clone
>      18.83 ± 27%     -98.9%       0.20 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      14.00 ± 31%    +141.4%      33.80 ± 31%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>     452.83 ±  2%     -45.9%     244.80 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_page_frag_refill
>     117.17 ±115%     -97.8%       2.60 ± 86%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>       7.17 ± 32%     -86.0%       1.00 ± 89%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>     347.33 ± 25%     -92.8%      25.00 ± 32%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>     570.67 ± 16%     +74.9%     998.20 ± 22%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_ack
>      14.17 ±114%     -97.2%       0.40 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       6.67 ± 87%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>     113.33 ±  6%     +49.3%     169.20 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       6.00 ± 66%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>     184.67 ±144%     -98.7%       2.40 ±100%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>     360.83 ± 10%     +50.9%     544.60 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_mtu_probe
>      14.17 ± 38%    +107.5%      29.40 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push_one
>      14.00 ±111%     -98.6%       0.20 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      27.00 ± 22%     -96.3%       1.00 ±154%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       7.33 ± 53%     -94.5%       0.40 ±122%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>     412.17 ± 30%     -93.4%      27.40 ± 32%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>       5508 ±  5%     +45.1%       7994 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg_locked
>      27.17 ± 17%     +57.5%      42.80 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      22.00 ±115%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>       2.67 ± 91%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>     653.83 ± 11%     +53.5%       1003 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>     242.00 ± 15%     +61.7%     391.40 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_validate_incoming
>       1090 ±  7%     +45.7%       1588 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_write_xmit
>      29.67 ± 24%     -85.8%       4.20 ± 50%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>       2936 ± 52%     -98.5%      42.60 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
>       1123 ± 26%     -96.5%      38.80 ± 34%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
>       5.17 ± 37%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>     190.83 ±  6%     +77.5%     338.80 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__release_sock.release_sock
>      65.83 ± 32%     -94.5%       3.60 ± 41%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>     722.83 ±168%     -99.7%       2.20 ± 78%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>       6.50 ± 40%    +241.5%      22.20 ± 27%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__pcs_replace_empty_main.kmem_cache_alloc_node_noprof.__alloc_skb
>      16.83 ± 14%    +199.4%      50.40 ± 23%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__pcs_replace_empty_main.kmem_cache_alloc_node_noprof.kmalloc_reserve
>      12.67 ±  8%    +162.1%      33.20 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      27.67 ± 19%     -97.8%       0.60 ±133%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>       8.00 ± 40%     -80.0%       1.60 ± 84%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_alloc_node_noprof.__alloc_skb.__tcp_send_ack
>      33.00 ± 12%     -43.0%      18.80 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      13.33 ± 34%     -98.5%       0.20 ±200%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     377.00 ± 27%     -93.2%      25.80 ± 22%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>      16.33 ±114%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>     410.33 ± 15%     -28.3%     294.40 ± 28%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      54.00 ± 29%     -53.3%      25.20 ± 34%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
>      47132 ± 20%     -96.9%       1442 ± 30%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
>     139.98 ±177%     -89.7%      14.42 ±  9%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>      50.90 ±119%     -68.7%      15.92 ± 14%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__send.send_omni_inner
>     127.99 ±183%     -91.9%      10.42 ± 82%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>      16.97 ± 11%     -85.4%       2.48 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.recv_omni
>      21.36 ± 14%     -48.8%      10.93 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.recv_omni
>      27.27 ± 11%     -43.5%      15.40 ± 24%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>       2001 ±100%    +136.6%       4736 ±  7%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_put
>       1706 ± 78%    +155.4%       4357 ± 31%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__free_frozen_pages
>     521.85 ±213%     -97.5%      12.97 ±  3%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      23.12 ± 32%     -44.5%      12.83 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>      28.50 ±  5%     -27.7%      20.61 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      23.36 ± 27%     -64.4%       8.32 ± 82%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>      19.04 ± 13%     -40.4%      11.35 ± 23%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>      41.75 ± 71%     -58.7%      17.23 ±  7%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>      28.76 ±  4%     -47.6%      15.07 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      29.08 ±  5%     -77.7%       6.48 ± 58%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      21.26 ± 22%     -70.2%       6.34 ± 90%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      25.97 ± 11%     -26.0%      19.21 ± 15%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_push_pending_frames
>      22.98 ± 17%     -27.2%      16.72 ± 17%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>     223.81 ±205%     -98.9%       2.53 ±126%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       1683 ± 32%    +136.1%       3975 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_transmit_skb
>      23.53 ± 12%     -39.9%      14.15 ± 51%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>      22.83 ±  9%   +8881.2%       2050 ± 62%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
>      24.49 ± 11%     -35.9%      15.71 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
>      20.44 ± 26%     -47.1%      10.82 ± 50%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_partial_node_bulk
>      34.01 ± 54%     -48.9%      17.37 ± 14%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>      38.31 ± 89%     -48.2%      19.84 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_alloc_node_noprof
>      21.07 ±  7%     -24.0%      16.02 ±  7%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>      68.57 ±144%     -71.8%      19.34 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>      19.18 ±  4%     -24.1%      14.56 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      36.66 ± 72%     -73.9%       9.57 ± 59%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>      20.69 ±  9%     -43.9%      11.61 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>      19.51 ± 26%     -38.8%      11.93 ± 13%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.refill_stock
>      19.47 ±  5%     -38.2%      12.04 ±  9%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      28.57 ± 12%     -22.3%      22.21 ±  9%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>     386.36 ±210%     -97.1%      11.10 ± 34%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      21.86 ± 36%     -90.4%       2.09 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      28.89 ± 20%     -62.7%      10.79 ± 50%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>      15.33 ± 23%     -85.9%       2.16 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>      19.65 ± 20%     -88.4%       2.28 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      21.24 ± 17%     -86.2%       2.93 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      21.84 ± 16%     -37.2%      13.71 ± 17%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>      18.45 ± 26%     -40.9%      10.91 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_release_head_state
>      22.67 ± 11%     -32.3%      15.35 ± 30%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>      24.19 ± 30%     -79.6%       4.93 ±102%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>     446.87 ±178%     -95.8%      18.67 ±  4%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       2032 ± 73%    +172.1%       5530 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_clean_rtx_queue
>      25.20 ±  9%     -37.6%      15.72 ± 15%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>      16.53 ± 18%     -83.1%       2.79 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>      16.56 ± 25%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>      22.70 ±  5%     -18.1%      18.60 ±  6%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>      16.08 ± 15%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>     114.86 ±182%     -91.0%      10.37 ± 59%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>      31.22 ± 10%     -39.1%      19.01 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>      17.17 ± 15%     -87.9%       2.08 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      22.06 ± 14%     -24.7%      16.60 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_check_app_limited
>      20.00 ±  9%     -42.2%      11.56 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>      18.50 ±  7%     -68.2%       5.88 ±126%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>      17.37 ± 29%     -76.3%       4.12 ±122%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>     315.53 ±139%     -94.5%      17.31 ± 27%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>      53.63 ±128%     -71.0%      15.54 ± 21%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>     108.92 ±179%     -85.5%      15.82 ± 14%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>      17.37 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>      15.29 ± 26%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>     319.47 ±198%   +1359.0%       4660 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>      25.28 ± 13%     -27.7%      18.28 ± 17%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>      54.23 ±118%     -63.5%      19.77 ±  4%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
>     226.00 ±117%     -92.3%      17.37 ± 25%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>      22.19 ± 13%     +20.0%      26.62 ±  7%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
>       2132 ± 56%     -92.7%     155.26 ±166%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
>      17.19 ± 18%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      26.50 ± 13%     -33.3%      17.67 ± 20%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>     691.46 ±105%     -98.3%      11.65 ± 51%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>      30.66 ± 10%     -31.2%      21.09 ±  9%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>      43.10 ± 53%     -44.4%      23.95 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       1337 ± 35%     +35.7%       1814 ± 22%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>      20.97 ±  9%     -24.1%      15.91 ± 20%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      23.08 ± 15%     -25.1%      17.28 ± 17%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>      28.08 ±  8%     -90.2%       2.76 ±122%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      20.70 ±  4%     -29.2%      14.65 ± 15%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      24.48 ± 22%     -89.8%       2.50 ±200%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     706.48 ±192%     -97.4%      18.60 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       2350 ± 82%    +126.4%       5322 ± 11%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
>      18.42 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>       7627 ± 31%     -28.6%       5445 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       4620 ± 12%     +38.2%       6386 ± 35%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       0.69 ± 17%     +45.9%       1.00 ± 12%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
>       4.75 ± 11%     -19.4%       3.83 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
>       6.54 ± 14%     -26.4%       4.81 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>       4.81 ±  7%     -21.3%       3.79 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>       7.38 ± 11%     -40.6%       4.38 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>       6.49 ±  3%     -27.7%       4.69 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>       6.17 ±  7%     -29.2%       4.37 ± 12%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>       5.19 ±  9%     -29.4%       3.66 ± 24%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>       5.22 ± 14%     -55.2%       2.34 ± 83%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>       4.74 ± 10%     -23.6%       3.62 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_push_pending_frames
>       5.59 ± 10%     -20.5%       4.44 ±  2%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>      57.68 ±201%     -96.6%       1.96 ± 70%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>       4.76 ± 10%     -41.0%       2.81 ± 33%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>       6.14 ± 53%     -42.3%       3.54 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__virt_addr_valid
>       4.03 ± 27%     -80.5%       0.79 ±199%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_recvfrom
>       4.02 ± 12%     -35.8%       2.58 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_sendto
>       4.74 ± 13%     -21.2%       3.74 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_mpol
>       4.62 ±  9%     -21.2%       3.64 ± 22%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
>       4.86 ± 14%     -33.6%       3.22 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.check_stack_object
>       5.03 ± 13%     -26.2%       3.71 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>      12.88 ±102%     -72.2%       3.58 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.is_vmalloc_addr
>       6.35 ±  5%     -14.6%       5.42 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kfree_skbmem
>       4.76 ± 21%     -28.7%       3.40 ± 14%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmalloc_reserve
>       4.27 ±  5%     -17.2%       3.54 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_alloc_node_noprof
>       5.73 ±  6%     -16.3%       4.79        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>       4.98 ± 22%     -27.5%       3.61 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>       6.03 ± 12%     -16.1%       5.06 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>       5.94 ± 30%     -52.5%       2.82 ± 32%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.propagate_protected_usage
>       7.52 ± 79%     -47.1%       3.98 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_insert_color
>       6.02 ±  9%     -22.8%       4.65 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>       4.77 ±  5%     -21.3%       3.75 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>       5.02 ± 15%     -29.9%       3.52 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_leave_memory_pressure
>       5.05 ± 15%     -31.9%       3.44 ± 25%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       4.93 ± 20%     -38.7%       3.02 ± 42%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_reset_timer
>       6.39 ± 24%     -91.2%       0.56 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       5.47 ± 13%     -82.5%       0.96 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>       6.08 ±  9%     -22.5%       4.71 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       6.36 ± 21%     -62.5%       2.39 ± 95%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>       7.08 ± 20%     -35.0%       4.60 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       5.16 ± 13%     -30.4%       3.59 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>       5.66 ± 10%     -80.3%       1.11 ±197%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       6.31 ± 22%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>       5.66           -19.4%       4.56 ±  2%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       5.50 ± 12%     -23.6%       4.20 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_event_new_data_sent
>       5.93 ± 15%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>       4.64 ±  5%     -25.1%       3.48 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>       5.60 ±  7%     -81.4%       1.04 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>       5.89 ±  6%     -22.2%       4.58 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       6.72 ± 14%     -34.5%       4.40 ± 12%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>       5.72 ±  8%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>       6.51 ± 19%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>       5.86 ± 10%     +32.3%       7.76 ± 17%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>       3.69 ± 10%     -21.9%       2.88 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>       6.52 ± 13%     -23.0%       5.02 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_v4_do_rcv
>       5.08 ±  7%     -28.3%       3.64 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_wmem_schedule
>       6.08 ± 13%     -24.7%       4.58 ± 19%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
>       6.02 ± 21%     -93.8%       0.38 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>       4.30 ±  7%     -20.7%       3.41 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>       4.67 ±  5%     -21.1%       3.68 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>       4.44 ±  9%     -16.0%       3.73 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__pcs_replace_empty_main.kmem_cache_alloc_node_noprof.kmalloc_reserve
>       5.97 ±  7%     -21.0%       4.72        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>       6.71 ±  6%     -79.1%       1.40 ±122%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>       6.62 ±  5%     -33.7%       4.39 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>       5.79 ± 27%     -78.4%       1.25 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>       7.35 ± 28%     -39.5%       4.44 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       5.42 ±  8%     -11.2%       4.81 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
>       6.23 ± 13%     -99.9%       0.01 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
>       4.79 ± 12%     -23.4%       3.67 ±  9%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>      39.58 ±139%    +241.5%     135.19 ± 23%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       1.49 ± 28%     +42.7%       2.12 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>       1879 ± 20%     +87.4%       3520 ± 39%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>      70.85 ±174%     -88.5%       8.12 ±  2%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].recv_omni
>      26.46 ±112%     -69.9%       7.96 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__send.send_omni_inner
>      64.92 ±180%     -88.3%       7.58 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.demo_interval_tick.send_omni_inner
>       8.80 ± 10%     -85.9%       1.24 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv.recv_omni
>      11.04 ± 13%     -41.3%       6.48 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_data.recv_omni
>      13.64 ± 11%     -32.2%       9.25 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.recv_omni.process_requests
>       1000 ±100%    +136.6%       2368 ±  7%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_put
>     939.41 ± 80%    +131.9%       2178 ± 31%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__free_frozen_pages
>     260.93 ±213%     -97.5%       6.48 ±  3%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__kmem_cache_free_bulk
>      11.56 ± 32%     -44.5%       6.42 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_uncharge
>      14.25 ±  5%     -27.7%      10.30 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_memcg_state
>      11.68 ± 27%     -42.1%       6.77 ±  7%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mod_timer
>       9.52 ± 13%     -40.4%       5.67 ± 23%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reclaim
>      20.87 ± 71%     -58.7%       8.61 ±  7%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sk_mem_reduce_allocated
>      14.38 ±  4%     -47.6%       7.54 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__slab_free
>      14.54 ±  5%     -70.6%       4.28 ± 40%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sys_recvfrom
>      10.63 ± 22%     -66.9%       3.52 ± 94%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_cleanup_rbuf
>      12.99 ± 11%     -26.0%       9.61 ± 15%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_push_pending_frames
>      11.50 ± 17%     -27.3%       8.36 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_select_window
>     216.07 ±213%     -99.0%       2.06 ± 74%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_send_ack
>     841.73 ± 32%    +136.1%       1987 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__tcp_transmit_skb
>      12.21 ± 11%     -37.2%       7.67 ± 32%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__usecs_to_jiffies
>       6.03 ± 42%     -87.0%       0.79 ±199%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_recvfrom
>      11.00 ± 26%     -38.4%       6.77 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x64_sys_sendto
>      11.41 ±  9%  +17832.5%       2046 ± 62%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
>      12.25 ± 11%     -35.9%       7.85 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
>       9.38 ± 25%     -41.6%       5.48 ±  6%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cubictcp_cwnd_event_tx_start
>      11.71 ± 28%     -44.0%       6.56 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
>      10.22 ± 26%     -37.6%       6.38 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_partial_node_bulk
>      17.00 ± 54%     -48.9%       8.68 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.inet_sendmsg
>      19.31 ± 88%     -48.6%       9.92 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kmem_cache_alloc_node_noprof
>      10.53 ±  7%     -24.0%       8.01 ±  7%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ktime_get_seconds
>      34.81 ±141%     -72.2%       9.67 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_charge
>       9.59 ±  4%     -24.1%       7.28 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mem_cgroup_sk_uncharge
>      18.33 ± 72%     -73.9%       4.79 ± 59%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_uncharge
>      10.35 ±  9%     -43.9%       5.80 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rb_next
>       9.75 ± 26%     -38.8%       5.96 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.refill_stock
>       9.74 ±  5%     -38.2%       6.02 ±  9%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.release_sock
>      15.28 ± 12%     -27.3%      11.12 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
>     194.15 ±209%     -96.5%       6.84 ± 27%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.schedule_timeout
>      11.18 ± 34%     -86.6%       1.50 ±199%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.simple_copy_to_iter
>      14.45 ± 20%     -53.7%       6.68 ±  5%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_page_frag_refill
>       9.51 ± 31%     -88.4%       1.11 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sk_stream_wait_memory
>       9.83 ± 20%     -85.3%       1.44 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_attempt_defer_free
>      10.62 ± 17%     -86.2%       1.46 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_copy_datagram_iter
>      11.05 ± 14%     -38.0%       6.85 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_free_head
>       9.22 ± 26%     -40.9%       5.45 ± 12%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_release_head_state
>      11.33 ± 11%     -32.3%       7.67 ± 30%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.skb_try_coalesce
>      12.09 ± 30%     -78.5%       2.60 ± 99%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_recvmsg
>     224.04 ±178%     -95.8%       9.45 ±  6%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.sock_rfree
>       1016 ± 73%    +172.1%       2765 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_clean_rtx_queue
>      12.83 ± 10%     -35.0%       8.34 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_current_mss
>       8.26 ± 18%     -83.0%       1.41 ±197%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_data_queue
>       8.28 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_delack_max
>      11.87 ±  8%     -21.7%       9.30 ±  6%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_established_options
>       8.04 ± 15%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_in_ack_event
>      57.43 ±182%     -91.0%       5.18 ± 59%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_measure_rcv_mss
>     121.96 ±175%     -94.8%       6.37        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_options_write
>      15.61 ± 10%     -39.1%       9.50 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_push
>       8.59 ± 15%     -87.9%       1.04 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_queue_rcv
>      11.03 ± 14%     -24.7%       8.30 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_check_app_limited
>      10.00 ±  9%     -42.2%       5.78 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rate_skb_delivered
>       9.89 ± 12%     -70.2%       2.94 ±126%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_rcv_space_adjust
>       9.20 ± 23%     -74.2%       2.37 ±124%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg
>     174.24 ±125%     -94.7%       9.27 ± 24%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_recvmsg_locked
>      11.96 ±  9%     -18.2%       9.78 ±  9%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_schedule_loss_probe
>      11.77 ± 15%     -33.8%       7.79 ± 30%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_send_mss
>      26.89 ±128%     -71.1%       7.77 ± 21%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_sendmsg
>      54.94 ±177%     -85.6%       7.91 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_skb_entail
>       8.68 ± 17%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_coalesce
>       7.65 ± 26%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_try_rmem_schedule
>     159.73 ±198%   +1359.0%       2330 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_tso_segs
>      12.69 ± 12%     -28.0%       9.14 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.tcp_update_skb_after_send
>      28.09 ±120%     -64.8%       9.88 ±  4%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
>     178.07 ±154%     -94.1%      10.44 ± 16%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_call_function_single._copy_to_iter
>      11.09 ± 13%     +20.0%      13.31 ±  7%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
>       1598 ± 64%     -95.1%      77.68 ±166%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
>       8.73 ± 18%     -95.7%       0.38 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.__alloc_skb.__tcp_send_ack
>      13.44 ± 11%     -33.9%       8.89 ± 20%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg.sock_recvmsg
>     346.54 ±105%     -98.3%       5.92 ± 51%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_recvmsg_locked.tcp_recvmsg
>      15.56 ±  8%     -32.3%      10.54 ±  9%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__local_bh_enable_ip.tcp_sendmsg.__sys_sendto
>      22.23 ± 50%     -45.8%      12.05 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.mem_cgroup_sk_charge.__sk_mem_raise_allocated
>      10.49 ±  9%     -24.1%       7.96 ± 20%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_dst_check.tcp_v4_do_rcv.__release_sock
>      11.54 ± 15%     -25.1%       8.64 ± 17%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.ipv4_mtu.tcp_current_mss.tcp_send_mss
>      14.04 ±  8%     -89.9%       1.42 ±122%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kfree.skb_release_data.skb_attempt_defer_free
>      10.35 ±  4%     -29.2%       7.33 ± 15%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_clean_rtx_queue.tcp_ack
>      12.24 ± 22%     -89.8%       1.25 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.kmem_cache_free.tcp_recvmsg_locked.tcp_recvmsg
>     353.56 ±192%     -97.2%       9.89 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
>       1175 ± 82%    +126.4%       2661 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
>       9.21 ±  8%     -99.9%       0.01 ±200%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.sock_def_readable.tcp_data_queue.tcp_rcv_established
> 
> 
> 
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

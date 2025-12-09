Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995A2FFF84
	for <oe-lkp@lists.linux.dev>; Tue,  9 Dec 2025 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765294919; cv=fail; b=bOTvu+WKmOyC95XYPp8U1a51TImbG+KV/rUoOmOGZPI9Fw22umv6KU0k3z9zXpEiM8HeRAWQEhAlyST+NnLlDCCkSpZLd1yc65tmjoVIuRDsxdVXJ17yvWB6W8nLnIRxOD0IimEgk6k4oYMAk3Zvm83P/3iD2fBoTGFVLmIcwDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765294919; c=relaxed/simple;
	bh=QS/k5Dcye8E7gMD0xJ+/MFI/y7haYTg0rbzMcMMBHyQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=G2JsVdu7l8wfjD7GPShYBQl5ZxRGpId32jCRMwjzRbNwVm8TcwuHekCIwsy+ai2/GUklFbu+LY8XIJcKhbvxsaZ8t5xfl3MdhjCY9ivkNUC+SLZcJrV54QWfrR2lOYhEOpOeBnXOgroRzGOdPt4fzOVHf3Ya4RIp8rmqfjrIbeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV6pRFvy; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV6pRFvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765294916; x=1796830916;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=QS/k5Dcye8E7gMD0xJ+/MFI/y7haYTg0rbzMcMMBHyQ=;
  b=hV6pRFvy8+jeU175hyN4bbcpBYClvGPMqF2/EFE0Pyua67owhOVbROtJ
   fxyeaYljA3WQrqjk0Vy2y2MZaXU8OTdZ2HQSgiSO+Ikky4HyKEjLLrFCv
   WwGYLVMtse2rEFTseS8wgW+NlFYbG4a0OJkD5WeYYqey7G58h/Q5ks+Sh
   0sxnCZDv02iFQ/cGyvg/TvxqYekCz5D7vwhWWBvxDg/UqDxa+e8dSiCgk
   JN9AbzIUFg2QNc/AVdpN6gywn8zjcJz2vZ0PKz2aEoN4qZ+Ttp07TJkhe
   6YSySAly8+x1BrH0+KTH/tEj/SOaRlZ2tJSbuXLe+26OYnVYI5S2Dwasg
   Q==;
X-CSE-ConnectionGUID: m4v/+yHrRKS+xnwVIYsKcw==
X-CSE-MsgGUID: Gmw0GA5BRwK1uI+6yvzhrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67304898"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67304898"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:41:55 -0800
X-CSE-ConnectionGUID: Tuz/MHvfTMuP05J0IXWKdg==
X-CSE-MsgGUID: nB5RMULkRgWaWsoR0eKC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196260316"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:41:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:41:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 07:41:54 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ3oc4e36eHmZrHI23n3Nmk3XOdz3Ny9pDzeoJFKgltAlWLv7QQFClYBMzQlNWKXyg46/96DkR1Z5r5R1iLfKp+sMpzR48wdfLPRN6LDWn9ycUh2P6SbWHGQqmv32ESdxkdwZi2+osXyeQobXgsYfYBSske6DFgzczRjZ3aQ83XVPRviBRQHIp87JUvNV+xGja1E392rtIzMiYJM8IPGE8O3NjYu/1XFO1I0MI3gJOtHpqW2p0+51ZkK4MzecTP9ENYM9V71tJheKclSTvWIjqShNPeJX5245QncQ7hz/7W699UL34jtu0v5IasBnuznJd5d1WYKujren6ML/YMjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIeIEJz9znachzyS3T0OdNrradd2vHZSe+JIv6hgjRo=;
 b=LnKiEH0G99iD627zh4k3dFGD5h1/jvKcDbwZqNzYO5umsbhXkIO4xOktqZHqYR2UrQJirs1PIxDacR3iQAiIHxJc29ptUWYAwiEHWbqQljTJ1X3gYEpbT6pmXpWotQScTAlxrj8d/3B3/5cxigQI8aOviu21QGeHSqLbBVrUYnukL+TfPOxZZTlQqGBfY89FK9jrXezME0g8tPBcsf2QtOiqwqb3LYnGb6J7xMz7BvRBddp7AdYbWbGoQXacMW7klL1W3HVxBNI6Y9OHge4uG7MTTkqkxEEdAbk3Dcr0g4mFBzF0yHNl3pP05vwUQJjzvTW/SYIW0HWCXv/H9N5Omg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6907.namprd11.prod.outlook.com (2603:10b6:510:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 15:41:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 15:41:47 +0000
Date: Tue, 9 Dec 2025 23:41:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, <oliver.sang@intel.com>
Subject: [linus:master] [rseq]  abc850e761:
 stress-ng.sem.sem_wait_calls_per_sec 3.1% improvement
Message-ID: <202512092342.3ee2de77-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: f31364e8-7845-4bc5-6474-08de3739768c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IvcTPf05hD/TkrOwfnVh4f9hgyDMYJSjBUfpRjlRs5YLDGPbvgLTbAp5rB?=
 =?iso-8859-1?Q?DFM1xzEr+tTczpWVd0qD9XfzCy3IinbkTw0VNvoG2R/YP3vQj+5Hd1FDT8?=
 =?iso-8859-1?Q?A7pICSCHsYMTLlkc5qh3VVNchpsLllSYFtmQoqiFnpXPSoqbqEdBe+B6mo?=
 =?iso-8859-1?Q?Z4CzQfz45AUPU6/H5GShlOu4ir6m9SqNj3yDIr9AXicy1otjXJ9c+Ltd5y?=
 =?iso-8859-1?Q?1K9Rug+OwyqysAtnEK7ZO5GwfK9J9flCr1NQBZWJL49SCi4tg0yyco5b8L?=
 =?iso-8859-1?Q?wj+23tVipGecVc200FF0KvteQu4DLlLaxMlLI0wtBfk27mqtOtuy7Rozqm?=
 =?iso-8859-1?Q?GSZfmvFyTtkPr0cMHMJ3RoBhJTZIzMOwUFSwoaauPOij1rggcTAsIvLuUd?=
 =?iso-8859-1?Q?AqAPXmHe7XydOV+8ZHEEUK3vafpWEbYtgu+KLVDe+Vfmd3hLjassSZvvDm?=
 =?iso-8859-1?Q?Q/ZsXgVBDhu73zNE7QUcDMHlMzzsDwTASH3VkyZ+k8xTOSrW/R9YzU4Y5i?=
 =?iso-8859-1?Q?47eOQENKpMMcppklT3Nl0seK3ONpORCPYOLD8P2Y1NpJubQf7Zl6fMBziy?=
 =?iso-8859-1?Q?wgMT5JlPJ0plvelxw7xxPriV6MYsMAE9PHE5X1+LLyQe9qkXwDKg0n0+mb?=
 =?iso-8859-1?Q?FZBWHobKDz0AzR8SoR4DxUMNlAmW13Mcayaok33gHTNvkFY/PicUzFpctj?=
 =?iso-8859-1?Q?QjQSd4Y8y4Y5m6axgrVhNEj5vIyvNyvnROI8LSPnwii5uWlLSSlOI3ulqA?=
 =?iso-8859-1?Q?joazp4raGmne+84+EWO63nmfthyNJNNlgjZ+WnuhhXjRfzu26m34bDw9X0?=
 =?iso-8859-1?Q?gAZkBGVXA78iODbpPD+8TieUa/d8GteUKOK7aydqs2MyK83jbn7Dh3XHQt?=
 =?iso-8859-1?Q?vYxHyvURNDe36FjJgznhD1mzFthHm7LCz7Ud+KZBlroSiVo9HrGG35cT73?=
 =?iso-8859-1?Q?zX+aziOK5rhd6t3QclOMbfRv0cQbJV7nd0pgumoH9gp55mnn8TBEe7nvGc?=
 =?iso-8859-1?Q?Pf6F2PgHAzmHUJcC3UfiC0BaNkdj+LWPtQ+tbpseF4nv58h1h2TGe6eGI5?=
 =?iso-8859-1?Q?EeVHr2kJtqPA9AFyrHHayZn/LfzWuoOZmKLqOf5xcMIHGOuZrhte/1NfK4?=
 =?iso-8859-1?Q?MMez40iZScDvgH/HbPZjrGltXULn+AsfyP+sesYBJkArF7VtOh/ZrN4ae1?=
 =?iso-8859-1?Q?gblnTfZ4eILRz221yhwL3FKzhpLzBHkboOr6rXMk1wvhRpjFcwg2CHBtcZ?=
 =?iso-8859-1?Q?LSwpaK1/DSzWh2e2y9GOhGYYGte6XlAI/WPfGtcs0G+oVIFs3t/EKdeMwO?=
 =?iso-8859-1?Q?DNebMfsfmjJvUf/tfS9EwifCNAObUhVc5DoJNz1my72i3Xz7vAWvVwm1SU?=
 =?iso-8859-1?Q?v7P9flbO6mrOjTwReRgVt4MLdO9dqKz6dh7tBUZqM2KWeb2D4zjhU2OhlT?=
 =?iso-8859-1?Q?0ATJvPpm7XnXCOMe5PKsz2OoARTFovnUTbl9RyRpbhblMgZwC8ed36vqhO?=
 =?iso-8859-1?Q?Nd4AmZCCxHhsLfSNc8Y4lK6O+4j0Jkh1xE8JegDaY+zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c91EzNBaE9JzSDnuM0GN/xP6dpbKFAIfXJDKDdUcpu8x6JJdIWAKnkuBkI?=
 =?iso-8859-1?Q?YVQdmyT5o/43bVVWtDsz2djoC0s8eCjb9ylbJp40TWPPTtiDboM7JqJ0OV?=
 =?iso-8859-1?Q?wyM5KCUDJqE03fl0KAwHbSiBrjkEtPNRwaaKx6xEthpxK9mDclvF/SR+7e?=
 =?iso-8859-1?Q?oOFn/0xnJZtrqZcSGtZw0ZwhXMekjV348ChqhoC2Y/Tc7oU+UHGaSl2NcG?=
 =?iso-8859-1?Q?pUd/NTwvyXppHxKeohXr/jdbuSHwDgL0M9AsWOejsXaG6p2wjR4S5VsV3t?=
 =?iso-8859-1?Q?TeBXOIbFGfFuMCXZURVoc9X4mP6EJDvx8aEDkpFUCxrwTP0MHb2Rxap5ch?=
 =?iso-8859-1?Q?6hu6iT6fdl328ihxnw/ofxpnI/T7/hETIbuWwW4Cp6MbgEPz9U84UsUMFc?=
 =?iso-8859-1?Q?Id3P/ATEMKjLzrM6GqC1O9tnKsv33/fMGFeQg9wsZjXP0H/JM3UDkAwvfn?=
 =?iso-8859-1?Q?FLGVXMEo9mtPHl/g8+oG9KTB68luWzMwnwhph3X59xpyd4M4cdbAwITZNJ?=
 =?iso-8859-1?Q?8EKKXuxWScYKFq/RmiOD94omhq8WvCE4ewHRwk6WX1qUhAUvxZEmHzL2R/?=
 =?iso-8859-1?Q?Eg+xn2gV/S794n5dUJLv3SkLWZyZyWDwCM0tlPvUZ47rD884QaWhTscMn3?=
 =?iso-8859-1?Q?ZhXabBRlHYzXVev35STQwwLlo9h2HfEpNJabWJ+kdjnOfd0zpcPPqv5LFI?=
 =?iso-8859-1?Q?Izkbxe9/IRYkkpXzIJFuPZdWdHiibtpT5z9P5jIFCO467tAUs+LGkGq4Vi?=
 =?iso-8859-1?Q?YFhUlN+7WSNSN5e9exZecYdTORnbCc5iR+9NuA9kqkwOaCypDNd5I83Vjf?=
 =?iso-8859-1?Q?ab93spKAMs+Z5qy4X8OyltUJNCPdJ/JLndLCtHMwyqtV6uNpmClhQTWe88?=
 =?iso-8859-1?Q?TOQ5DGJ5V9d+TJq5y+0baah3WxfDKy71+ZJBq8MS8u3QI1jchZszyltBKK?=
 =?iso-8859-1?Q?TuD/8fUFkGgf526Z86tPuKcDoPm52xS/+4ETc/B/Cxtn5HL5jyLvTGF6AN?=
 =?iso-8859-1?Q?5NM7itoyuyMU25XPFXQuDFKvAvEAbD0GJtfGF0A6K74mac2l4j3CFWZgec?=
 =?iso-8859-1?Q?7s5/Jtd+5l597oH4JARJfuNALp4DH9aj8Vo1X/yLeIUWyZlnKuDQl8OOaP?=
 =?iso-8859-1?Q?lGvHlbxsUBOT5WYa7to+InFnlYkTu9JCrEM68iIg/TZQslwIRiPgImU3gX?=
 =?iso-8859-1?Q?6LioybP+n3kTQA1FYfni2ARgxHKGAbzIhquqLFk26yquIRE3Rxy0cIcCUJ?=
 =?iso-8859-1?Q?4c2ZI4I3IE6JniHOMmutC5/Z09jtWwt/gx9f3XoOuxecl9ARyg3fbRt5Sb?=
 =?iso-8859-1?Q?C/oJVCERDfDJx/aWT0qXcoDAVAd/W0zePWo7rWTuprxdqM0Dyv4dVqeNLp?=
 =?iso-8859-1?Q?2R0VeJpMtTa0oQFE5Y4f+SRnHbs7LP7w75LpSfL5reqtjouAIA36lB189U?=
 =?iso-8859-1?Q?yaV48gpUNi/IjPJ3YOJW1uaNtlcEBlS3H/d8Zw7/4jjIiZ9h43Sn45nOs7?=
 =?iso-8859-1?Q?CW9rpqc0Z4Y/1urKWeahTR0ILr8oyx/TggafpXR+GFEXMQUzkelfXy+cxu?=
 =?iso-8859-1?Q?fLLhnEL3O3A1v95278BIKPhaMLMvfoWL/E5LcQspFxnGm9g0+ingUWROcP?=
 =?iso-8859-1?Q?1K04QmdjrxHJIJn5Rd7ZpeHwMD5AyUMOG2Deho+6jffJOfKBfGRFsBOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f31364e8-7845-4bc5-6474-08de3739768c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:41:47.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tan0H4rz5cY1KgayHw0FvTxcCIVC07/nRAeADps5t9CxX0CkLlPac9/+iYJLEWLmPpJdK5VW28H5VdIwkAPyOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6907
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.1% improvement of stress-ng.sem.sem_wait_calls_per_sec on:


commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 ("rseq: Provide and use rseq_update_user_cs()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sem
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251209/202512092342.3ee2de77-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/sem/stress-ng/60s

commit: 
  9c37cb6e80 ("rseq: Provide static branch for runtime debugging")
  abc850e761 ("rseq: Provide and use rseq_update_user_cs()")

9c37cb6e80b8fcdd abc850e7616c91ebaa3f5ba3617 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    713480 ± 29%     -24.9%     536114 ± 28%  meminfo.Mapped
  19261235 ± 14%     -28.3%   13815751 ± 45%  perf-sched.total_wait_and_delay.count.ms
  19261235 ± 14%     -28.3%   13815751 ± 45%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
    209285 ±  4%      -3.8%     201417 ±  3%  proc-vmstat.nr_anon_pages
    179839 ± 29%     -25.3%     134393 ± 28%  proc-vmstat.nr_mapped
      0.21            +0.0        0.22        perf-stat.i.branch-miss-rate%
 3.044e+08            +3.6%  3.154e+08        perf-stat.i.branch-misses
 1.933e+08            +3.5%  2.001e+08        perf-stat.i.context-switches
      0.93 ±  3%      +6.7%       0.99        perf-stat.i.metric.M/sec
      0.20            +0.0        0.21        perf-stat.overall.branch-miss-rate%
 2.996e+08            +3.6%  3.104e+08        perf-stat.ps.branch-misses
 1.903e+08            +3.5%   1.97e+08        perf-stat.ps.context-switches
 1.341e+10            +2.6%  1.377e+10        stress-ng.sem.ops
 2.235e+08            +2.6%  2.294e+08        stress-ng.sem.ops_per_sec
    374680            +3.1%     386364        stress-ng.sem.sem_timedwait_calls_per_sec
    374638            +3.2%     386525        stress-ng.sem.sem_trywait_calls_per_sec
    374649            +3.1%     386331        stress-ng.sem.sem_wait_calls_per_sec
 1.178e+10            +3.5%  1.219e+10        stress-ng.time.involuntary_context_switches
      7623            -1.2%       7530        stress-ng.time.system_time
      3803            +2.8%       3908        stress-ng.time.user_time
      8.44            -2.8        5.65        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      9.62            -2.6        7.02        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     59.80            -1.0       58.80        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     60.34            -1.0       59.38        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.83            +0.0        0.86        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.__x64_sys_sched_yield
      0.65            +0.0        0.68        perf-profile.calltrace.cycles-pp.__update_load_avg_se.update_load_avg.put_prev_entity.pick_next_task_fair.__pick_next_task
      1.00            +0.0        1.03        perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.pick_next_task_fair.__pick_next_task.__schedule
      1.11            +0.0        1.15        perf-profile.calltrace.cycles-pp.__enqueue_entity.put_prev_entity.pick_next_task_fair.__pick_next_task.__schedule
      1.56            +0.1        1.62        perf-profile.calltrace.cycles-pp.update_load_avg.put_prev_entity.pick_next_task_fair.__pick_next_task.__schedule
      1.73            +0.1        1.79        perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clock.sched_clock_cpu.update_rq_clock.yield_task_fair
      1.77            +0.1        1.84        perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.update_rq_clock.yield_task_fair.do_sched_yield
      2.13            +0.1        2.20        perf-profile.calltrace.cycles-pp.__rdgsbase_inactive.__sched_yield
      1.84            +0.1        1.90        perf-profile.calltrace.cycles-pp.sched_clock_cpu.update_rq_clock.yield_task_fair.do_sched_yield.__x64_sys_sched_yield
      1.95            +0.1        2.02        perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__pick_next_task.__schedule.schedule
      2.06            +0.1        2.14        perf-profile.calltrace.cycles-pp.update_rq_clock.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64
      2.38            +0.1        2.46        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      2.98            +0.1        3.08        perf-profile.calltrace.cycles-pp.__wrgsbase_inactive.__sched_yield
      3.26            +0.1        3.38        perf-profile.calltrace.cycles-pp.put_prev_entity.pick_next_task_fair.__pick_next_task.__schedule.schedule
      5.15            +0.2        5.32        perf-profile.calltrace.cycles-pp.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.45            +0.2        6.66        perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      3.28            +0.2        3.50        perf-profile.calltrace.cycles-pp.rseq_update_cpu_node_id.__rseq_handle_notify_resume.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.21            +0.3        9.50        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield
      9.41            +0.3        9.70        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     17.41            +0.5       17.88        perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.59            +0.5       18.07        perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     16.02            +0.6       16.60        perf-profile.calltrace.cycles-pp.os_xsave.__sched_yield
     24.16            +0.7       24.86        perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     20.98            +0.7       21.71        perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.42            +0.8       24.26        perf-profile.calltrace.cycles-pp.switch_fpu_return.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     25.22            +0.9       26.11        perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      8.52            -2.6        5.88        perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      9.64            -2.6        7.04        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     59.97            -1.0       58.99        perf-profile.children.cycles-pp.do_syscall_64
     60.46            -1.0       59.50        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.propagate_entity_load_avg
      0.12 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.clock_gettime
      1.12            +0.0        1.16        perf-profile.children.cycles-pp.__enqueue_entity
      1.14            +0.0        1.18        perf-profile.children.cycles-pp.__update_load_avg_se
      1.97            +0.1        2.04        perf-profile.children.cycles-pp.set_next_entity
      2.38            +0.1        2.46        perf-profile.children.cycles-pp.prepare_task_switch
      2.41            +0.1        2.49        perf-profile.children.cycles-pp.__rdgsbase_inactive
      2.67            +0.1        2.77        perf-profile.children.cycles-pp.update_load_avg
      3.26            +0.1        3.37        perf-profile.children.cycles-pp.__wrgsbase_inactive
      3.30            +0.1        3.41        perf-profile.children.cycles-pp.put_prev_entity
      5.17            +0.2        5.34        perf-profile.children.cycles-pp.yield_task_fair
      6.49            +0.2        6.70        perf-profile.children.cycles-pp.do_sched_yield
      3.45            +0.2        3.68        perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      9.24            +0.3        9.54        perf-profile.children.cycles-pp.pick_next_task_fair
      9.43            +0.3        9.73        perf-profile.children.cycles-pp.__pick_next_task
     17.48            +0.5       17.96        perf-profile.children.cycles-pp.__schedule
     17.61            +0.5       18.09        perf-profile.children.cycles-pp.schedule
     16.04            +0.6       16.61        perf-profile.children.cycles-pp.os_xsave
     24.18            +0.7       24.88        perf-profile.children.cycles-pp.__x64_sys_sched_yield
     21.01            +0.7       21.75        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
     23.44            +0.8       24.28        perf-profile.children.cycles-pp.switch_fpu_return
     25.24            +0.9       26.15        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.67            +0.0        0.70        perf-profile.self.cycles-pp.___perf_sw_event
      0.92            +0.0        0.95        perf-profile.self.cycles-pp.update_curr
      1.11            +0.0        1.15        perf-profile.self.cycles-pp.__enqueue_entity
      0.80            +0.0        0.84        perf-profile.self.cycles-pp.update_load_avg
      0.70            +0.0        0.73        perf-profile.self.cycles-pp.pick_next_task_fair
      1.04            +0.0        1.08        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      1.12            +0.1        1.17        perf-profile.self.cycles-pp.__update_load_avg_se
      1.78            +0.1        1.84        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      1.48            +0.1        1.54        perf-profile.self.cycles-pp.prepare_task_switch
      0.69            +0.1        0.75        perf-profile.self.cycles-pp.do_syscall_64
      2.40            +0.1        2.48        perf-profile.self.cycles-pp.__rdgsbase_inactive
      3.12            +0.1        3.23        perf-profile.self.cycles-pp.__wrgsbase_inactive
     16.02            +0.6       16.61        perf-profile.self.cycles-pp.os_xsave
     21.00            +0.7       21.74        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.37            +2.0        2.40        perf-profile.self.cycles-pp.__rseq_handle_notify_resume




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B9817
	for <oe-lkp@lists.linux.dev>; Tue,  3 Dec 2024 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202117; cv=fail; b=H5niA9GK7A5fCzOaWgsuIvW5vvUlMMGn7R2+W+lXDzxhKGqNG3UDMK5k63beaY68KyMeH9Lqi6bxr/NA8nonxFvC63Ncr1XvWq+yDQb3KSGdmLf3c4ESaTRvV+swzCfcKjxhWw8+cGm0LqITwB7a6J271DwIubMUj5UY33iCxw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202117; c=relaxed/simple;
	bh=J/QNQxnNwn874Y6hkkSEApZefjYwF9KKfF9Ngm5xpbM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uU8cgQ9l/LUCC6qVFockYZ4zPjZIBDNQ6MrZqh3QNuK7fC532CNYWeTJg5Y7BjBqPW3H6SUBmO3r2GrbaeFBuK2pZdpZk+tX6P6wB1N7hsTf9sBpunvVzuYFisGEVCbulF5TM3eXoHpLdbATHEwwma8Mpj4JhIZYPfTjR9LBkok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zv+qGG44; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zv+qGG44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733202116; x=1764738116;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J/QNQxnNwn874Y6hkkSEApZefjYwF9KKfF9Ngm5xpbM=;
  b=Zv+qGG44mWZ06PsFF5G3Kd5HC6tDG4FLVfiWRXvzgDmf3u8qwmmiQb3S
   SqO7L8MknSRlc/J0in5nZyIORHuCFTlCvFLOEqJFxeo6P2LSVySmBfdgh
   MoNXT/u6EUIkH2alC3KrQ0tvAx56krtjTTCinnV0KeiY47LNH3+LlkXYx
   dzDoc7RY4ul5LJIVaoOxQxFQABxPeySa5Eu/JmIRmJpD8j/4j3ZmxhvUp
   QCwPEUZPIXs3whsHIBLvzpMpnvaYpTGdJSILoH+4BFnKSfd/L6lL4ufvC
   Ld+iB61sIs/lOTmz57F6UJEszi5H01qDfwkaS4ghmKCKx9741hK3tyOSE
   w==;
X-CSE-ConnectionGUID: 2b/RurwJR4m5kzO4J7BlyQ==
X-CSE-MsgGUID: c9p8QuOrR2+8NiFwIvh6vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44011914"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44011914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 21:01:55 -0800
X-CSE-ConnectionGUID: BBLJIkUkSJ2v2t4DgjoY9w==
X-CSE-MsgGUID: H40OrlIrTrmB8I6shf9xqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93210218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Dec 2024 21:01:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 21:01:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 21:01:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 21:01:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx3CDsmFo0ugCxpsViizhKOr9bw9Uw9uMyfjSbFFos07BRhelVLXTPAFf5TsfOLDEZYf+iUeWS3Mib26t6dpsCZQsTHMxVDZG3N2mQgrm8icRQr7YPK37vjGKaDJdNCOXUeYdyxihU1lvVUd2u5HERrGvV4vJJz/tUKSYmSQEFeQAEzoD6jKNiX00/uWHuG++kJxdhcps+YkxgHyi+EViVwnpAqyfAQ8DUKeMdZM6BISv9C1ozlOp6q1H3PjdrqsYhfXuCJrcdzRbjRHROocGa9bIW65CdNmZvIw26klyyeF5xorKLt5YVVmPP25ZpKY5p2UghlXKhDG3V77P9BF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDAK7eNEfcnr2CvWhRcJ86nAKQVJHjjcPCNZC0x4Jco=;
 b=FEccyg2t4hHL6ogF97cF6DrP5NfTuUsyAAtiReISwTFROlewvK6fwB1kAiqkd4pTXtcsvs9dcLbBmta0KBZq1A50BRTKaV9aTWHCVjBs1rvHHqsSZ5UBJ11G3Q8CbhCEiZT1i9FTxFU10Glb+iOrZV7XDYSvJ7+ffOyKxrGOaAxX0U0AonG/Y0S1JM8zKzKOS368GPBN7aIwrihkJXKfI39SccXt+9vxvNabGncAHLL0mR/wqdzLbMa778igqGdD4FFbC14koVLH4h8KHG1pObKKGYO1JGjYBg+AaI7unWsAlmHWgBUZodLgDbLz7oX9uAsFmCXT7PftK+K6ic1leQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 05:01:48 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 05:01:48 +0000
Date: Tue, 3 Dec 2024 13:01:39 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Chuck Lever III <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 620ec925-a085-411f-cf54-08dd13579763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktqdGtQaTlDWldJM0Nrb2F4eUxSNTg0enI4UG5sWExHcFgra3ZJMmd2OHNk?=
 =?utf-8?B?NXYvZ25GY3p1Q04zaDF3QU9WVUowdVMvdEl2YXJ3QW1vM0EzRmxGUytGRkla?=
 =?utf-8?B?Ri91Zyt3d0t3SHhwa3NWS1d2bG1OUHNodlBpckpUZmE4M0JMbnEzenJEMTRr?=
 =?utf-8?B?ai9TYUVrQXZLS1Erc0Fnbjd5VDBsbGxGamQ2eC9GRUJnck5xeGRoTVF0S0N4?=
 =?utf-8?B?TDE1Y2IwWElLMzhuVXJRc04xdENJbEt0Z2tCY2ZDNVNZM01ON244OVNnbG1E?=
 =?utf-8?B?SXBCUG5DODY4VkJWUHI1dlMrUWM4eHJabXEzSVpHWUhneW50bTZOeHlpbnNM?=
 =?utf-8?B?bmptUXlEVEEwNVlocVdUN0RiSVBBVUpaSWlmQUdyWlV2b3R6TTZhTFU4NzdF?=
 =?utf-8?B?bUMxUGJRSWlycitMRVpzY0dYVE1OdHNRMVpnYUhFNFVWSnVvSGpUOUI3d3Ro?=
 =?utf-8?B?SG1YcVoyUkxQRmNMTVNZbnZ5aUFYVVZ6WkV6dGR3YVh2L09wQWpScjlXM0Ra?=
 =?utf-8?B?ckJLcHBuZ29VakdTd3lDdTdoZGd2NGFZbUJvNzZPOXJyMW92RnNicWRGL3ZW?=
 =?utf-8?B?SEQ1YkxXeWVTSEQyWis3dnlBREZFZzlka0lSZEh4ZXJFM3o2VGt6a3NlVDNY?=
 =?utf-8?B?dUtDYms0cURmOWxqaEw3Nm4rQm9xQlU1V3BXWkEwMk04UGdDNFpySDRGOFRh?=
 =?utf-8?B?R0lFaXNSSlVoMWRmc0xDRXBYUWgxdldNem9PNEdkN2JNZFhEVFc0elhUOGI4?=
 =?utf-8?B?bHFhSENMU2ROSmRkM0krTDA5OEVIVWdUTllqdVBWYmNyVURMcGhGV21Kd2dr?=
 =?utf-8?B?bXNFRUdJaDl5Q0xuSVM4UXExaWlyK2ZyVndxZ3BTUG9wZmdjeWM0NHNRaFdW?=
 =?utf-8?B?S0NyL1hGbmE4cEFXeHR6TFg3dE10OWxjWTlLZFQ4OUZlaU0xdThKbStSU0Iv?=
 =?utf-8?B?bEhKRHpqcVQ2eXRUNlAzdVR0NTNodEJoT1c0UXdRd2ltRktiMHZoWDdnM3JB?=
 =?utf-8?B?YzlyaE13OUlQTHh1Z1dlSHVUUEpsL2c3QnlZdlEvd09mdlg5c2FXanA0OXVI?=
 =?utf-8?B?Qjh6MWFrRlN3aTJFTmxFVGdWMXlobUNrR2FsQzZUV1phMVZtQmtpVDhzeDlm?=
 =?utf-8?B?LzViaWoycnpNN21FMk1iZEtCTDVGYTlDeTNCQUpYZGUvMCtkMDE5MXVNY1dX?=
 =?utf-8?B?dzM3MzQwbkpDTzhaRDVZS0RnenFwN0paam1QYWU0RzJZWVRTTG5IbkNFTmtZ?=
 =?utf-8?B?NzAvUm4zK3c4eGlUUXZhSUxXNld1ZDhJOXF6a2xnM1AzeFIxbzFLTGtnNzRp?=
 =?utf-8?B?UW5QUGJMUlI1TXUvSmQzbzJwZjMvOWs3QXQrRXRvc1czcnl5UDl5ZXJuMlRp?=
 =?utf-8?B?Z3FqVlNXa2pPM201Tjg4dTJyK1dhMWhOWi8rSWVqNzQxS0d6ekZ4d1UrdVg2?=
 =?utf-8?B?Q0kyS3R0YXdLRzI2Vy9JOVNLUFFmTGFqd0NPZmc5TVMwbnNqWGwyZ25rUWNV?=
 =?utf-8?B?VWF4TkFzZVAyUDU2dzBVamx5UnBvV0pLYzFxeWpNTVNQeUNEM1duWkFodDFE?=
 =?utf-8?B?Y0tYUEJCM1RKYkdKREZpK1dxS1Y4dzlycERadzVOS1pBNEFrN0haUEpFcHFX?=
 =?utf-8?B?aElWNElIYXlTampKcDlUQW45QUFZWWtxNUJSZ05rakNveC9QcTFUSkRtSGlW?=
 =?utf-8?B?RGZDUTZPellucm9QYkFsUjlsd2dUcjZOMmI0bjBkNmFydXdwaTVITVByZ0Vn?=
 =?utf-8?B?R3kwTm9oZmJWK25TNUw3QTcrTjFXVWlJUlVRcGFjNnF2UXZvcTAvTU1tNEkw?=
 =?utf-8?Q?eP4yxuj0yn3hFpCC0+Jum7G/xvRx8L2YuT+Fc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUVQTkNXVjgrRzhubDdjTGE4Y0Jmb3AxTGVlRVVmL04yb1BUcC9MV2Z3YjVD?=
 =?utf-8?B?YnU5c0ZReUlibWNOSk5aU0hWb3VKNlFsN1B0UTJyZlcrS3BpcVFpK3c5L3VI?=
 =?utf-8?B?b1FsM0NPN3lYNUs2RzJmQ3NEMkx4anNBM3BhVVFRUXFrUHVzNTRFUHpxU0dF?=
 =?utf-8?B?SWZERVFsR2MrNWMyTFQwekZtWGRwOCtsVVBqSHVPazJwZ1VFb0hGTVlaTVI5?=
 =?utf-8?B?T01PYndad2I0MkVkZGdUKzdJTGpyT2pOcjR3TW5JSmcvdkJpbklmZjFFZGh4?=
 =?utf-8?B?QXBkL0xWRjJHQm5PVThMSlorTUVDNDE3dm5TMFBhQUxlcjNnemVDRjFRcVh2?=
 =?utf-8?B?UFNxOGZPc3ZYWFZhWkhYT3djUjZQOEFLamNMN3IvbzNia2Z0WitYU0V0V3lq?=
 =?utf-8?B?bHU0YVdkZEptWFIwN0k3KytNMmx2RkY3YUhiMHkxTmZEaTFzQWVDRW1jdXN6?=
 =?utf-8?B?cTFQM3JEZGFFRzlRUGNKZ1BzOVFnRHJGZXhQSUlTeEpiUUwzZlBsMjZXNXJh?=
 =?utf-8?B?ejQ3MEphUkluRW9RY2dKbEMrWWNnSGtnTVhra1Vvb053bERnMkhrMmVObmlB?=
 =?utf-8?B?RzRSL1NYWVllWlgvRVRxUEJOMUZSL0xXcnU4WnYzcVh5Sm82VDF2N05ZRDJ5?=
 =?utf-8?B?N296M3VJd3JnV2NEbnE4b0wxSDd5MFZlQmZKcWtRU3JZbVlGZmU4NFZsTktO?=
 =?utf-8?B?Zi9yVnYrOHhiS0lrY2lWV3lLd01Qb2ZtSVpnei9ockJidUowaXcyeU5mNkEx?=
 =?utf-8?B?NVVySmNpZm5mSThFWnNOT0E3KzUrL2wwUnFuMFhBTkVGSXpQd3dPSi9veWZ0?=
 =?utf-8?B?OHFHVWFTeFBUUHprbm04UGYzcGJLV0tzUGpCeEQrSjJtemh4aUJuZ0YvMU1C?=
 =?utf-8?B?ZzJ0OUN5NFlnaHdVbmpqMzYxVkZCdi9YS01wZHl3Q1F3STV0aTNPUVB5UHJ4?=
 =?utf-8?B?MjBkeC9FejVvZHZ3ZmNLdGhXV2x3TnR0eVRNekJQUDJCU0pOa2prMHNqWHpU?=
 =?utf-8?B?OFFyTjAwM2xSUFR1SVJyZ2VrZFBtSWxZR3pPV1hzTWZFZjFvY0lNYmdGQlhq?=
 =?utf-8?B?WnVYR0FpNmc5eEZmTVdFWUprazdBUHFlZDdyZFRpY2tpbzBYdCsvdCtRSjla?=
 =?utf-8?B?L3JhcXpjd0xtbm45Y2pTMjA3czRJb1dDMnBPZ0hORUFOanZBdzNqdUY3bWx3?=
 =?utf-8?B?MUVoZGd4OEFmM2cxWnMxcndHNHd0YnZicG1zdm9ZTnpyaDhJNHZ1QjNyN2RD?=
 =?utf-8?B?QjhrN1dNVSs0SGxmT3BFS0JVa2ZkV2JpY1poaHRWenNqNEF6SzNzN3EwYWd4?=
 =?utf-8?B?SjJQVXJKNjRiN0pDTVJNT3F2Q3QwR3MxY0tJRkZQQU5hVWtjbHlDZks0WXdR?=
 =?utf-8?B?NXdZRlRJeVA4MHUya3hwblZBanh1Zmc1dzNUSHRsMUZkVlFrT2ZGQTdqZWtU?=
 =?utf-8?B?T2d2L2tOV3ZTMWJhOTdGRHBYUUN0Y1Z5YU5lYk9PN1Z0Q05vNUNEVFFkeWF2?=
 =?utf-8?B?SklNSVVKay94UzVlNlJyNlQ5S3FPd3RWRnNwNFdIazJmRGk5b3hOVnMxc3NB?=
 =?utf-8?B?c20vTVVKY1FwWW1zRkhYRE4wd2llV0ZuZjFvTm1DNVVjV21KdGNjekdodVBV?=
 =?utf-8?B?M3lKaG1NOU9pakhXcjc1a3dRL0VObEQ4YUkvM1lTemxpMXNoOTg3WlZ5ZGdZ?=
 =?utf-8?B?THdwOFBHQitEaSsxU0dwbGVKZ3pad0Q4N2tOMjdFNVk3UWlxUlZUMDNWUXFG?=
 =?utf-8?B?bUFIM3EvcE1UbjhRbkZhd0c2TkJaMU54SlBIZHV2cHRZZUg5d2FMRVMyYVlu?=
 =?utf-8?B?dHNEaS9vUkJSL2JudldGdXdMdldVZnp5NDlUR2h5K2xxMm1FelU4WmVyeEdY?=
 =?utf-8?B?SnZ0MDFESWlmWVoyOHFDazA0SWM1SjlvdW1vOUpBaGl2bys1SEk4WS9Qend1?=
 =?utf-8?B?UlpIbmFlRzZGeUlwRno0bGVnelp1dTg1a2o1YXRGSG5DTU5zM0pOYnNkSmNr?=
 =?utf-8?B?UDBjaWFKN2VMWkZmdmhlYjZUNmdIUXArSmVocFc1SVhQSHYwYUthZHlvVnlj?=
 =?utf-8?B?RU15bjUxajRXdVp6d25tZ0lKNi96UmNQdzNiWEw2QTBpeVNLTDFTYmRDKytn?=
 =?utf-8?B?YXgwNXVxcHBQdm5ZV1Y0REhmeExYaVpyZXlvZjJkK05KcGFEKzFMY2QxZVE1?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 620ec925-a085-411f-cf54-08dd13579763
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 05:01:48.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEi5ItySdX0CR610cOEgax4WrjoFIF6mb4rMa/d+/oaAxbsuSWJDtYqWKjzQlsqUS9KckBQHne0CJCbwjzqwOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
X-OriginatorOrg: intel.com

hi, Chuck Lever,

On Mon, Dec 02, 2024 at 03:40:49PM +0000, Chuck Lever III wrote:
> 
> 
> > On Nov 18, 2024, at 2:53 AM, Oliver Sang <oliver.sang@intel.com> wrote:
> > 
> > hi, Chuck Lever,
> > 
> > On Thu, Nov 14, 2024 at 09:37:30AM -0500, Chuck Lever wrote:
> >> On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wrote:
> >>> 
> >>> hi, Jeff Layton,
> >>> 
> >>> in commit message, it is mentioned the change is expected to solve the
> >>> "App Overhead" on the fs_mark test we reported in
> >>> https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
> >>> 
> >>> however, in our tests, there is sill similar regression. at the same
> >>> time, there is still no performance difference for fsmark.files_per_sec
> >>> 
> >>>   2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
> >>>     18.57            +0.0%      18.57        fsmark.files_per_sec
> >> 
> >> Because the most recent version of this commit does not appear to
> >> address the reported regression, Jeff suggested dropping it. I've
> >> done that in the branch below, which is being prepared for v6.13.
> >> 
> >> 
> >>> another thing is our bot bisect to this commit in repo/branch as below detail
> >>> information. if there is a more porper repo/branch to test the patch, could
> >>> you let us know? thanks a lot!
> >> 
> >> The proper branch to test is:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-next
> > 
> > thanks for information! this repo is under bot's monitoring.
> > unfortunately, our cluster run into problems these days and need some time
> > to full back. so if there is still regression reports, maybe will delay to
> > a later time.
> 
> Hello Oliver -
> 
> To avoid regressing v6.13, we postponed this series.
> 
> The series is now in 
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-testing
> 
> And I would like the robot to include that branch in regular
> test runs going forward. I will try to push new patches there
> first before pushing them to nfsd-next.

got it. this nfsd-testing is already in our monitor.

07b2337dc158fb (cel/nfsd-testing) nfsd: add support for FATTR4_OPEN_ARGUMENTS
54b0e9c3727d2f nfs_common: make include/linux/nfs4.h include generated nfs4_1.h
fcc756b92ce832 nfsd: fix handling of delegated change attr in CB_GETATTR
a354743d35b49b nfsd: trace: remove redundant stateid even deleg_recall
40384c840ea194 (tag: v6.13-rc1,

at the same time, I triggered same tests for original report upon 07b2337dc158fb
and v6.13-rc1, will update you results later.

> 
> --
> Chuck Lever
> 
> 

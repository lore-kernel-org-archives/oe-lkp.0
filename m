Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B5E2505AA
	for <oe-lkp@lists.linux.dev>; Wed,  7 Jan 2026 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768942; cv=fail; b=EIKta0Fobfj9RoMXk6VqoFhZpbAgq4q7A/BsoMQGyqWOwIGCdJiQzyfANCAGihcLnH0e6IygWT2rAvaxuIlpGs/WWETiRHV92rNvnTrjUWyoXT5e46YJusC64CbVv3/+mhiLPu7M/RIi9bMJRCSLUOjG0ti1SH79pvzAQW6Ek90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768942; c=relaxed/simple;
	bh=FILjjs0EgOz52znLem7ALuXMc9/BiK52qLanAtNYtbc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Idmntg5KxkhEVrFhkpPy+VFQ7W2PDQb4dP1SOy5CX39ns07+f0HOt0UA9wuO7cqAToDTDxTVJ7sEV9IWduRoZ/xdhRLywiQgJGqTa2ABzeY2ox/vXpIsCJtmBblFc2olcpr3P5n+M5fIdEK6W7LNsTDbVQZYnO6ulKR1BbNEJKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUzg4kUn; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUzg4kUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767768940; x=1799304940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FILjjs0EgOz52znLem7ALuXMc9/BiK52qLanAtNYtbc=;
  b=TUzg4kUnYAt9moUG1nxJFYmnSOHABJA70xTeaMKfld9wTXY9C35im9RB
   bOusM5SCMuRZShijGaV6xe676PqQaWpZjINt262NuYIDCmCoPSceLNBGB
   EO08dv2V6RNxAfWAOFti20sh3nozzDDGRjI2YlKurmIxP0yRLKNtLhz0A
   Y2Uw6FAeBz9LrIeBG1hVKe6Ivrjlkp4Oxv9WV5PeEp3f/3DNxtDkxAHb/
   egE4nd+n0XN7mVO/3bqjJFDKIRE9W2JiKmomw2SIJGZSVsqKv8pTwX2Fi
   losxYFGOnQyI5L2Hn+ZXB4vfVmGDL+SAONnbt35xqX8wCMgKUTCvLg4GK
   g==;
X-CSE-ConnectionGUID: efi96cOXR8msPBZogXFhVw==
X-CSE-MsgGUID: 4kKENW/wQ1uHmwzuESidLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79852837"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="79852837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:55:39 -0800
X-CSE-ConnectionGUID: KQtkeK2BTvWGd029t5rYTA==
X-CSE-MsgGUID: IqIUOd/TSz+QrM5NC6zvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203768343"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:55:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:55:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:55:38 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:55:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0ZPBko+HZrLCfxiAMySD4hvD2of8I9s/fDBRx2iZeQfkWE1eTVTc1bXvfPS7JjNnakZglfi5wKAl5SoJ2mx3v8qJ/1Gm12Nlg8GELGSbXomBL7kg3H/gQTJC8i8xhyJ1AwcTroRH6Tx//kqjgL41t6A9hVNkwOYY/KM7NBRo+J2bDYjr+WegJGblX9a3E3fOYZs3+SjK5nFRSeHUhqSG1tJUP64kl/C1XKWB0FZKDZO/YCOS5M86HreR+qxkLPQThOyqSwFePhB3jkZ8sPiM3fmvJbS0hVN+TjSN/+tlmklE8fTwkkA1OZQWgTLll9Ye8by5PMeeXDW65H8rE5Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahB6OBCZ9Op37ufQt7k4PKGGhVVzN0R6/dh/CF2PExg=;
 b=iQNrxUzjskA9hF4JUxRXF6bR6Yi7ba/Hi4qvaGbGLPY8IMFuJJD9DO/iT+678ECIHaI+IbYXtF4TH5Uu0hsdnupHAwIY4JdicNwZQGi1TNe2Cq8xNwCzDXWzOD6YsoRk24GhNpVtE+RN9oIo+yH7B0tsQLlhCJoDtjly4b42YOeYs912IN+1QqlYTJXgK2gEENm9UuPhtluijN+rzNfa8ZozckMIC8JsMtLiCLL5D3yGb+0nCMK4hQu6QTsoX83JAUt5pLoLtOvl5QkiWpIzilK3GhzOrTkm8+7PLSCmEdjGiRMPapz2tMVSde6RnTJjp9z0Am0JwIzua/Czkee7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:55:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:55:36 +0000
Date: Wed, 7 Jan 2026 14:55:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gregory Price <gourry@gourry.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Gregory Price
	<gourry@gourry.net>, <oliver.sang@intel.com>
Subject: [gourryinverse:scratch/gourry/isolation/v2] [mm] da80cfb7e2:
 page_allocation_failure:order:#,mode:#(__GFP_ZERO|__GFP_COMP),nodemask=(null),cpuset=(null),mems_allowed=
Message-ID: <202601070744.b186a98d-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4854d090-9019-42c2-ee56-08de4db9c253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a/mxCniBUeXxIyU6cvw8e8mEMhLQrA8UbMU6QQkcfRfnlNXohqaBX74qRswf?=
 =?us-ascii?Q?bRYuEKmpJm/eXyJQntJ/coAkmbZv26Tdab5N+nB9gota7TFQfMMjqW7XYTdu?=
 =?us-ascii?Q?z0ZisFYvNei2AIhCcLNSblqKg/WrC4eeRYPV9tVd4i3os+eeJ/ngwhOlxmLf?=
 =?us-ascii?Q?FfTE51xO4p9pJdS90o/KLFch87ztcR1ZFQUpFj9ciCDjQKwMVxWQXiwLR9Ih?=
 =?us-ascii?Q?WNrtm7iLoL5HswSqZl07CGcXWX6Nwm0+y2H/of79be4WDg4EBg/2VYlzR4BN?=
 =?us-ascii?Q?tMFmE825wE6I7d7KUgk+mY8WJ2s8aMjoXFCmJznc9r3x5hWHPDTP/6BMCX6d?=
 =?us-ascii?Q?WNt7Juxfy1nPBRdYHV/MYYedLPPlFh+9lfBqY1gNW2OFY63F+3ywM/o8yHjS?=
 =?us-ascii?Q?1CVmKYnoVKC8wvlms4qeY2+g0Pf92MOv7BsVD6kg7p5hOe0Gd3/bDJZsELTI?=
 =?us-ascii?Q?ngelTcU6vCUuiSZZmb8wmjSphoiiArjucENhIlOZayoolgGduZp81AyBe2fM?=
 =?us-ascii?Q?07OJOXWGxd+eHclbu3YcB7ZHNPFbubCvnvdcf34K1MCRfxxpG2T8A7uRzpaB?=
 =?us-ascii?Q?LfeUgNzcBQhyF/cJz1lbrl4iV21oTgq1QMvjp+iLAeXKak13F7vTIU4Ayg1O?=
 =?us-ascii?Q?UjtmrtsrRc4aO0TcGTXTKmWg7cOAel+UbKaCTirujngWeJZoHnd6fB5TMd6O?=
 =?us-ascii?Q?hVBad0sGV/E/2nhKbZIhw7QAIBJ3y5gWxeSmGFtQ14uUsFnBdD0rWCOXu8X7?=
 =?us-ascii?Q?LK47xH0ePvo/RK0vhsHd8/cMvWFsugsJR4572rIIDcrVQO8PoIEAPpSoLwuO?=
 =?us-ascii?Q?kuZgoR+dhSyGrLuoIbvuMs+4igqPwDvM2vJMGII8HiHj0S0uxTe9hKpDufZ3?=
 =?us-ascii?Q?jJ86t8sUZDVMvY7NOeexMkkhtjipPiCbC7zIQZBCAiBjMi5tJ3XkQum92x6O?=
 =?us-ascii?Q?tDnm+PI/Ij6D4/tnlM7/CCf8+mc8lK69ozvd7q0dkNow442L5d0p96UEgmN6?=
 =?us-ascii?Q?rp+2KLVWax4aY3svZ+KqZOc6BLzzDFC6zv80X13FGxfQNqKaFciO42fLtfs6?=
 =?us-ascii?Q?aLsoGvK63onSCCpz6CCVU0o1955HaqQxNnbfTII1ceZ40xeDXf8XaIc1CD3d?=
 =?us-ascii?Q?mylM1jHnvGr00Njnc0yyqnJlNi7r9APf7oJ7R59xBJjIhJcxJnGwuzoYw1uq?=
 =?us-ascii?Q?h/igvl9/jGAVmZaY1vWsPlmRwdr9kkgr81+UnvHPHSYkK2+wdMo3qOGi/ETx?=
 =?us-ascii?Q?vHCVQrSIxNmH+K/0EanH6T9F5Do11xcf4JLMUpnBabW81HDwpOqQu0LHd/TH?=
 =?us-ascii?Q?rYiot1tlAa8edWFAywQeh6Ays6zhjXWdnzLzQffVNMAd6tquivRMdZonfjoQ?=
 =?us-ascii?Q?/hfVGo4XqfKyaeOB4eqLJWdRzeiFwWJR2KfiRM7vrzjMd94M7/Rukdvt/DPr?=
 =?us-ascii?Q?1ZGrVv5TlfcGeaOOks+RjaKEXa8CSLq8EcivjN5cVLSFcd5OQB27Pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ux0Gbm1NnEY7Jdw8xLLzFD8HKeAfmG2HfvdivpUS3LZD4E2Yy/vtgjt6jh1n?=
 =?us-ascii?Q?vHsU3+EFyx6d5Cdz0/rzObhAWR+13nEkHiVemyNleR6rSIFGHaJMWzWCTcY1?=
 =?us-ascii?Q?H4NQC6jEscydvCKmNZTsuLlJt95w8+17f2mESK1qKuqzPIlfP2+X4Ruz5oiI?=
 =?us-ascii?Q?5vO+8A0kFiiRMRJRxeiZFGFw/cE88DxsGvjyfvb7x3HQh0EiwxUGUJXk5TnY?=
 =?us-ascii?Q?NIBAYW7xlLXCatUF4TmGTY/t02/DeGAgrR9BaB7HqwdLROB4bfDF9PCcsZue?=
 =?us-ascii?Q?Db80LSneiMyzGzJcX83+htjGq2zrlfydzB5iFTuMUbzS85hPf+HvRSRV6j+7?=
 =?us-ascii?Q?0arGhIo1EOcdXZ0j4zC4P+g06h/ZDEyewIeWVyQJ2L246t4UhFQ3P0vCj8Yy?=
 =?us-ascii?Q?cOEJG2entvdCmGdGqolQdPi5EjXpgvukLiNml7PniHBXwQ6q5bdLKMtEGI+I?=
 =?us-ascii?Q?mMm8XlA9zyHaK17t7d7V6oEXM6R2s+d48AizJ+L28cIfoXlxD5d7yIfI14yL?=
 =?us-ascii?Q?Q9wicL47RxqyNlACFGI7azOQLGGCjup9ShJTcC7K0pO13XJX9VcVOZT1bUmm?=
 =?us-ascii?Q?JAreZFnaKeWEYkMKlNTHX08qpsRt7gs7Sgz7kxZOsAbmipC1bjH/tuDlJP47?=
 =?us-ascii?Q?SltcU/0PGZkwzSypD9TAW6t1s7UFtzVwtmep9Z6Rpyc6NQXPGgvazv09BXSA?=
 =?us-ascii?Q?UBzHZO220dy5psuQX8aBIfwFUc+UONgpjS2/VZhCNo4wP4SMu7fO5JwMkHdj?=
 =?us-ascii?Q?yPYIJC13SBZRUgJFXT+VpG2FSdG2lgsUyh/hgV5Vlys1rTkqQHPbyG8+0Rro?=
 =?us-ascii?Q?mj9ezNd6jHU4QCqYZiwDtUiDL/vacuEsOBMMOhTp0g6hIusLo9RIPuVkAYIE?=
 =?us-ascii?Q?n7VLvznK4UbmWUqcoEGjDRORqoCQZILPlkJD6wUurmI3Jjm3/XG5XSq28FD6?=
 =?us-ascii?Q?NUZ7beixEHywU42zFKBXny1YD/UIM8m31CnqkMfg6tzm9gDt5CeAFdHzUtKt?=
 =?us-ascii?Q?KOenUUAKzGQcnHkF0Yi0Hx4Ef4p0kOTP0FO2SwrXeKJvDC7y6MWseS3JLGkI?=
 =?us-ascii?Q?MbtIlEJXZxXLHnrG/CdXMpAXZcycAHy1svc4fYdBtyQ4A+WR/JFHpxowoOWT?=
 =?us-ascii?Q?N1v8rWkprQhrE8A2PPx/NZZJIZLjNNYV2RYT42Qt3XnmQe8X1cv95ZYmR/So?=
 =?us-ascii?Q?4lVR6mQfR1/3QAf72+7fkrkiMmSMQu1UNPvhLYVMeUaMBlYzQRUru4K++Y7D?=
 =?us-ascii?Q?8dksg3NtSD4PC8OAT3Vg7oCL8Eh4Ufdk1cQfwrXOQXja8ABd6A5npA4N3BJ9?=
 =?us-ascii?Q?ZRF0qDlrlzG21UaP+TOtuAHqEkIEtSkP3UqqFsaSawc36f1BG9PThtkGJ4sT?=
 =?us-ascii?Q?bQHGcq0mT8cMsjWYHuIWkLkrXDBDxs5CC8ztZTNAeGpCBy0Sil0llxMHblHg?=
 =?us-ascii?Q?5QEQ0mNs5qhy5ZIIxHSnYwOattdoAbEVbUAn0SsfT+6WKldmYpthkA5pPL7h?=
 =?us-ascii?Q?S27mBy3vj/zGw3Ut3BIfm1rQhnSNePjfDbybr9PyeO9F+Nh/H+cMIt3Jzin6?=
 =?us-ascii?Q?KGvMIaPOZG/ttdRZV+PlJq16X9AnktzIcTQxzZsIP5+bw0W+zMfZl0cGZ03A?=
 =?us-ascii?Q?yte3L/2Sdo5+ujxcycsu51Vnp5rUMwMoeBGdzddOqwR1Stz1EM066k5Yc4QJ?=
 =?us-ascii?Q?82TC8g7dsAcDeVUpRmy+glFyIPXCdVLfdsbiQObgzYQnpanzEtgZWoLuHI7W?=
 =?us-ascii?Q?okc1cySqpg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4854d090-9019-42c2-ee56-08de4db9c253
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:55:36.1077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnkRrGI3qip/NAIMJdgsat9kuSo0omHTbX7iaJIdKY7+a2OmMuQExIopHV31dnuh91GodZCo/kIYniMMr06TdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "page_allocation_failure:order:#,mode:#(__GFP_ZERO|__GFP_COMP),nodemask=(null),cpuset=(null),mems_allowed=" on:

commit: da80cfb7e23e7d84297f9d24a2a70a014daa0a0c ("mm: restrict slub, compaction, and page_alloc to sysram")
https://github.com/gourryinverse/linux scratch/gourry/isolation/v2

in testcase: boot

config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601070744.b186a98d-lkp@intel.com


[    1.571716][    T0] Policy zone: Normal
[    1.572090][    T0] mem auto-init: stack:off, heap alloc:off, heap free:off
[    1.572767][    T0] stackdepot: allocating hash table via alloc_large_system_hash
[    1.573496][    T0] stackdepot hash table entries: 1048576 (order: 12, 16777216 bytes, linear)
[    1.579058][    T0] stackdepot: allocating space for 8192 stack pools via memblock
[    1.665046][    T0] swapper: page allocation failure: order:0, mode:0x40100(__GFP_ZERO|__GFP_COMP), nodemask=(null),cpuset=(null),mems_allowed=0-1023
[    1.666481][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc3-00002-gda80cfb7e23e #1 PREEMPT(undef)
[    1.666487][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    1.666490][    T0] Call Trace:
[    1.666497][    T0]  <TASK>
[    1.666503][    T0]  dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:122)
[    1.666514][    T0]  warn_alloc.cold (kbuild/src/consumer/mm/page_alloc.c:4005)
[    1.666520][    T0]  ? __pfx_warn_alloc (kbuild/src/consumer/mm/page_alloc.c:3984)
[    1.666525][    T0]  ? __asan_memcpy (kbuild/src/consumer/mm/kasan/shadow.c:105 (discriminator 1))


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260107/202601070744.b186a98d-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


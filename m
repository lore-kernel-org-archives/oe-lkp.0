Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101C247289
	for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462896; cv=fail; b=N84wTlo1B6UAM5YeNZEFEBzuMVDusuxm5MsqwKx3rWwwsZxi5WW/4ejJYKvy08EKn6tOX6Xnd0RhO+pzPlhd/4XDUFIxW3d0KkWaw3/Few4FTRwFk51SlnNqFNRWmsJf85wRCZGc7D8e1QMiokV7cw4rrVYzbqmDoNwVpbOG3Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462896; c=relaxed/simple;
	bh=X9IUPVElbqtkdSJiLXDWnGJ4u+6O0QU3rTHwBcktE6A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dZd7z9mVgsEYEl9zo4xBg1sOFpNtDDbeBF54ramupDR3Dg5g8Bc0syh9RnIic/27et+0e5gWy8YCWgtfPJjzzqTQjYM0PHTJTp1HS+n60IyPg6VvmPUW2fun/5Y/aoeOs8WzlVJOmAT+AMsZRSF3DlrslfO7wEfCFwaY2r6HN0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1hc2yh5; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1hc2yh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765462892; x=1796998892;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=X9IUPVElbqtkdSJiLXDWnGJ4u+6O0QU3rTHwBcktE6A=;
  b=F1hc2yh5ymeOD4wQyrj4AtKc5ZTBOl6pyDA9Qsa1CGg0eJcbVsEhJ3EY
   YzfIUs2i3+AvwqdSMqk0vcqv2eD4gMhckQB3CksK0RiBPQBJ8zFgRgwRX
   ChSwQX15YOW1XJB87Wc9nk37A0twx61emAFD6hRW6F6W01eoLW170x6uM
   zP02BBzz3XIzy0P9BbLy6VFoGbc+Pa142QTtDXrZE29JEcOQjRNi7o0/d
   UAQjuvTDZTKlxFkCJRhOi2fG3NrpWuRvY5h7DEJ2k5vjzoLcLhrVuLhaT
   Bgbdd7PBLLoOW7lmVbji+yRrBawKxhZJmkUVSKFFLfXqdXYfWJkRxmATh
   Q==;
X-CSE-ConnectionGUID: L/7wtLn/Q92ilywCJ4bQzA==
X-CSE-MsgGUID: oQ/J+oY6Spi55N0t0SEYfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67401868"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67401868"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:21:32 -0800
X-CSE-ConnectionGUID: CwBVa3hWQiq6QDsXv1yXNA==
X-CSE-MsgGUID: 2VbWg5XjTJqGOxJqhCl55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196811426"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:21:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:21:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 06:21:30 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:21:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR/M9jZnCIdZYd3L2xdPojZR9AcIhvgusqqXI0/G+JUr8D9RQZC/cI4pYO+cNlkkc53huygKYnnQwwCm5ESWoGVYfucjAUAQDk/4e7kjKdrBZNInVZUzSNWIcqiwElBACP16KbKtjmdOhBZWQ2KQ4OjSUIj4VHbZRqiYpGzEwBOdR1JFW2BNfoba9Mlway8KId2b/y7qL4wIqQ7PtPpWj7fpDBOEgnE1f+HR2NxPRt895G9vk7GgFUqddsKpkOQpiWvN4qeSAw/Q0zC48gbjMmrtRQERPpIQ5y3U5KZnEsX4SBTF1kaSLNeXshbM6ycJfyY2IwiUXd0IjHkgWQ3Zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZcR43tWuaHTACSzbjFRKnkCqYLa6C/kFlGwne9vO7U=;
 b=jI1bRSOcroaaCP9qwThG0lYvIEPj7haftsFPtakBYlpgD6NW97xLB1h7+Ax/+SJfWRNXONPt3VY4KqAjRljdow8qtAuVKSDvzc/s4VFNEiLhI+PYbh/F2iSYtU+3i+37ypVod2XEQGvouic3iPDJ9+aPLX1Ut21ChGbvlVHAqtMN0Lbns3LX8blCqnXy/v6TANvGmWsJ8waNVaBivm03xY1SD8u7k8ZVepD4V8L6d3UCifuIFaN9oQk8k5rVK+bL4TZe6zwY4nNghPya7MjdOHubeG8zbVVUzGkz2jRBRWT/4oTOShuz28dBYs7X/TCtUgeIb47ybngB1fTkpw2eOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 14:21:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:21:26 +0000
Date: Thu, 11 Dec 2025 22:21:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Fernand Sieber <sieberf@amazon.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  79104becf4:
 stress-ng.resched.ops_per_sec 44.6% regression
Message-ID: <202512112111.39299a7e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:820:f::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b1f745-7e50-4dd9-f451-08de38c09134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h4f0c9je5prO4nYBK6+KxrxekNfilEhnOYIMO3DGm5L2re2oSiD2cfFFJi?=
 =?iso-8859-1?Q?ijt7NKqPX0dg9p6kmDECA92FB/haHDRXPXAvLJkQaHanf+Zv9/Cdq89l9n?=
 =?iso-8859-1?Q?dltl3mrkKDqLE3VCGth5TaVfiUyGT8sjVWIabvdKSnRD7yxlQWHE+ZfO+u?=
 =?iso-8859-1?Q?W/6aXuubSWaRKMeAlNzXKP++DjXKZ2HL+Nsd20S1BguxpDE0q9Oy5Di2dy?=
 =?iso-8859-1?Q?yBXG5+g+MHcLTzKIpEe1jrJUaNVrMCMZb4N3dmz3CdJwnuB2NfH9TS4YKv?=
 =?iso-8859-1?Q?C3Q5lEuXByUd/1QYLp+fS+lXUrgrHxduULS7dBWboViVAO3tYbdLsmW6lc?=
 =?iso-8859-1?Q?dgOlp1rYXqvWxFF7RmGK+vQwBqCs2+OruKyzZpFn1X3cZw25epPRcGcZxH?=
 =?iso-8859-1?Q?sSdRlLF9BeN64PDEnhOZIO/Hh0VzRvfzwsGBCz4We9SVMtxeuYzoptCJml?=
 =?iso-8859-1?Q?cE5Gdo9M+PhMu6UPfUTQIVk9YfbHTYAaSelkhFMz6hgcB5K9td/pMzg+BA?=
 =?iso-8859-1?Q?EfOSYhz7NzjjUBb2HpL4H3LnfN7OkqrCJRSe6sDcOy9dm5xytHteeS+L3a?=
 =?iso-8859-1?Q?iDsSgPgegb8e2DwkjyqSdkwADdMvUIhvnpR4bAjm51qzTjXsx2J7ZFmwC+?=
 =?iso-8859-1?Q?vsgQlGIqY6R7h3JHCuyNDhV3mYrI+9X7uHWnhA2FJ8IA4aDERozy5BhfoH?=
 =?iso-8859-1?Q?dqdrm05WwE05IgbmmCvc0WNSSaibEHQ8mqP1tGlB2OLrqHajc1F+44jmuy?=
 =?iso-8859-1?Q?IWK5pKajS6yBHofXk65nAGyTwHEm3VnalzUAVtlPcJyTq/rXrKgdG4H+Q+?=
 =?iso-8859-1?Q?axwV8lkaHpMYXCdVIjG9U5H6lQ8GZqaQEb11/kg+gzL1kPZpuUVLzmXEOB?=
 =?iso-8859-1?Q?6vM0T0pOZroOmQkZbgZb8qRkNmSEm1bVB8tlVTwcsiIHmPZ5UWoHETtsAx?=
 =?iso-8859-1?Q?8lRrRJ4rbj9dDwZC9dsKXkQY7b8vw1743oz8ytHQ0ZfCkZpqVI9rpHAjYv?=
 =?iso-8859-1?Q?sC9Mg24Z87DBQoRkDB4Szz4KrlP+lcXur4SizyU6GfT/CT3vJLSLLdOowN?=
 =?iso-8859-1?Q?G48yGN1B3oXT0OCTmb0QddGO4r31LuwB17emCGOD6J4dNut4LWiXDJ2yfx?=
 =?iso-8859-1?Q?KEu0rGK1+Z/OafsuFCIq6ew0R1ZSu0w6DdKS6yQPvKOxv9ZL3MRYZhwwvv?=
 =?iso-8859-1?Q?Guh1G7fOP77QzQTGDnofxdlu8eGBG/bMqsN0zF9vJkxjnYkgDMvlcDTCgs?=
 =?iso-8859-1?Q?JvCEJzlZpOdyB/2pZ5t/q031tVnDGi968J+zX9NCP8REOFbQjxMlUr/8o4?=
 =?iso-8859-1?Q?gaWt9AkDE1SGYIP+ACj+PXCW+AJAgzAVDmzLKaBFNVQezvbqXZU/4/EhX2?=
 =?iso-8859-1?Q?kXtNmItsruAaOgf3BJ9p1j7p7K9dZBZzSjBTXkqwYH4MwGqPYcRMjOAosy?=
 =?iso-8859-1?Q?OFP4zYKxy2IT/Ir5kmEvUQL3/pUtW9SHqV2H85v4pRkMp0O2NjHZR/ahm1?=
 =?iso-8859-1?Q?ywy1gWa4llPozrRBmqsk5VgLnuw282BVKV4ErBrPj0Dg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EHBxCzaVcHxwQ75Ut+RIUfH1LOl+V5IP3Ihs3bjGd2Mv2x0rDWtqLST7x9?=
 =?iso-8859-1?Q?lNj8haFaYV+v/IALV/4aq/eJqo6bEVfMecUi/fb+CHiJ7IfqUkGdfN2xCq?=
 =?iso-8859-1?Q?WmIRFOcCOfvfBxApJ0PNAbll5hLKThCzWZVp6zBzlzlqBfNHBkuc9qTYP4?=
 =?iso-8859-1?Q?uOXnCXWJLONnd4rDBc7t/G8m8XHujX0lDpau98HGRJ2RYrBsVWOItnIrCH?=
 =?iso-8859-1?Q?C1y2uYSVHSpWG2ccYaC44lIKQ9I8EUlrGgi5MvACSfmqToSUehRwbmRCUj?=
 =?iso-8859-1?Q?M2wFNf0rHSiib73zECMH2tNpgfQpq3eqmmSpjOhP+j6pv2mG+NDaGy6esV?=
 =?iso-8859-1?Q?iq0SoZ4Wdd9cB/wzm9LcxxO+O5zSKSEOr5mhJVrXrm0+AjAy9GgQV9VdCk?=
 =?iso-8859-1?Q?hIBt2bts2GGKbuxw9uXgPZYwegv+20nIuGdgDoE80Jl9+hDiKuBtAbK87I?=
 =?iso-8859-1?Q?i9dHOv3q1cgYMkiWKi/3YAVQuaxjkc8h46il6qoTQZvQlWa88Jpel/e3l1?=
 =?iso-8859-1?Q?lvOZ//CfdItJOlmeDRIXcoof5A8uPLK3nNkuGvgnMdTjc3vGy+fi5KfcIW?=
 =?iso-8859-1?Q?OwhWT9+ujfiyOJIxLFwF/WQJaEXcXlw6bOJo+9OzgMruJQIZ5pNmTjTeQg?=
 =?iso-8859-1?Q?xXQvvCm4kPPhDg5C1rCH3QQkI/G1kg2uq2E9pNsr+bWbOgzZQjRHNPtLOm?=
 =?iso-8859-1?Q?LWAvk3Rd8fyJ7Wv0M8v8G6oZkQDsr73J1YKCtZ3+2p6i1QNsEgWYJ2Xz8e?=
 =?iso-8859-1?Q?12PoCsPFwR99ZqWBV54yEScvpKkzghIiFLlFg39y7PDuKGMuIss01JIGBQ?=
 =?iso-8859-1?Q?IysQob0bKFHWwfTvvTWnRgBwM6l8AleiwWHDmkfEpqPJN/QCYwJujxIDMZ?=
 =?iso-8859-1?Q?vlf5M/8wecFe/p9O3hBtstmi3EOw8v+rJDQaxEN3wX2qKIpFsL9a6/047u?=
 =?iso-8859-1?Q?XkSaXe0BEB679mj+fOB9gDqTHexK7ugX7umMo1K2B9gy64wdF4xQHwcQxT?=
 =?iso-8859-1?Q?XUmRG4jNRqUteI3QcpSWPcSLGSJrVw45xAWB08XgX2vKlptQgF3wwZA+YP?=
 =?iso-8859-1?Q?Uw368xzsaL33Yn11caRHmD5+YeFeN+JtE3h5sI6ZDT5WhOMDFJgzAXMhFX?=
 =?iso-8859-1?Q?01iaL0hgixdSFU5+CNVk9a9NLC8S/l9lYT1ceQaW5+bHvxe6zWLm2leKGD?=
 =?iso-8859-1?Q?k90M75Fe9QeWzLx67FkWFl/QK+GanJE1aVH/s0Onv4ztitFTbFt9prnnv0?=
 =?iso-8859-1?Q?CEVPPf43TKUKeJq0AsHpNLh7RyVbTJttym6fPw9rO/qmxXAz7jgE/nGhZZ?=
 =?iso-8859-1?Q?ECpVESU+tkqbPM4/e1e7EGMpdouDOxeF9SYPHjSNl/y99XRFOwHky+cZRl?=
 =?iso-8859-1?Q?+bX2SsFrzZO5biQ00Wg0//p+04UXzW3ET+WnweDoYWds0x48+SCVAXwXaH?=
 =?iso-8859-1?Q?wcdUubBRypFJQU27o+cqSXm1e1afYP9IwXo873JE1GMlD7U/5RtxYNByaX?=
 =?iso-8859-1?Q?JmMwQAYViEXUBOLM3EIOO6tsPhOc4IpkW7ClOdrAnNDZdgepnE8TZrdyce?=
 =?iso-8859-1?Q?BRt/AZcyaH1NQv79x3WhO5VJ0o+uz3d0UHRSxvIzkzu/8HzpOzhrRa3wMg?=
 =?iso-8859-1?Q?+fAeSD4mDtS/jSa4h+qvA4/wCq2GNUU73tYTTrNJwRIpbIsAeDT6sLtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b1f745-7e50-4dd9-f451-08de38c09134
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:21:26.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnNNgZZzHSi/RN5Q/AsH2pdXjWOTN3reiwEMDBelCaVLQt5lVXO88W8rfbVlntYsTOrgfMdqSUbxf6ipkUKaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 44.6% regression of stress-ng.resched.ops_per_sec on:


commit: 79104becf42baeeb4a3f2b106f954b9fc7c10a3c ("sched/fair: Forfeit vruntime on yield")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      cfd4039213e7b5a828c5b78e1b5235cac91af53d]
[still regression on linux-next/master 82bcd04d124a4d84580ea4a8ba6b120db5f512e7]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: resched
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512112111.39299a7e-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251211/202512112111.39299a7e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp7/resched/stress-ng/60s

commit: 
  v6.18-rc1
  79104becf4 ("sched/fair: Forfeit vruntime on yield")

       v6.18-rc1 79104becf42baeeb4a3f2b106f9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3.04            -0.8        2.27        mpstat.cpu.all.nice%
      0.50 ±  2%      +0.2        0.66        mpstat.cpu.all.soft%
      4.76            +1.1        5.89        mpstat.cpu.all.usr%
   2687824 ±  7%     +56.0%    4192827 ±  4%  numa-meminfo.node1.Active
   2687819 ±  7%     +56.0%    4192820 ±  4%  numa-meminfo.node1.Active(anon)
   2297207 ±  4%     +64.7%    3784422        numa-meminfo.node1.Shmem
   6119167           +24.5%    7619550        vmstat.memory.cache
   2707804           -24.2%    2053216        vmstat.system.cs
    189054            +7.5%     203319        vmstat.system.in
  25656307 ±  2%     +13.1%   29025962 ±  2%  numa-numastat.node0.local_node
  25696307 ±  2%     +13.1%   29065550 ±  2%  numa-numastat.node0.numa_hit
  25540729 ±  2%     +13.6%   29006036 ±  3%  numa-numastat.node1.local_node
  25569126 ±  2%     +13.6%   29035527 ±  3%  numa-numastat.node1.numa_hit
      0.55           -18.8%       0.45        turbostat.IPC
  12061633           +13.0%   13628090        turbostat.IRQ
    265.06            -4.3%     253.64        turbostat.PkgWatt
     17.26            +1.8%      17.57        turbostat.RAMWatt
   3123742 ±  3%     +47.5%    4607498        meminfo.Active
   3123726 ±  3%     +47.5%    4607481        meminfo.Active(anon)
   6007139           +24.7%    7493247        meminfo.Cached
  14701321           +10.8%   16285527        meminfo.Committed_AS
  10018821           +10.7%   11089155        meminfo.Memused
   2328253 ±  4%     +63.8%    3814316        meminfo.Shmem
  10056916           +10.5%   11117671        meminfo.max_used_kB
  25695324 ±  2%     +13.1%   29053555 ±  2%  numa-vmstat.node0.numa_hit
  25655324 ±  2%     +13.1%   29013967 ±  2%  numa-vmstat.node0.numa_local
    670642 ±  7%     +56.4%    1049021 ±  4%  numa-vmstat.node1.nr_active_anon
    573153 ±  4%     +65.2%     946736        numa-vmstat.node1.nr_shmem
    670640 ±  7%     +56.4%    1049020 ±  4%  numa-vmstat.node1.nr_zone_active_anon
  25567450 ±  2%     +13.5%   29025864 ±  3%  numa-vmstat.node1.numa_hit
  25539053 ±  2%     +13.5%   28996373 ±  3%  numa-vmstat.node1.numa_local
 6.141e+08           -44.6%  3.401e+08 ±  2%  stress-ng.resched.ops
  10219415           -44.6%    5659965 ±  2%  stress-ng.resched.ops_per_sec
 1.679e+08           -25.2%  1.257e+08 ±  2%  stress-ng.time.involuntary_context_switches
  67421791 ±  3%     +11.3%   75027832        stress-ng.time.minor_page_faults
      6133            -1.9%       6017        stress-ng.time.percent_of_cpu_this_job_got
    367.83 ±  4%     -17.5%     303.63 ±  4%  stress-ng.time.user_time
   2685958           +15.0%    3088587        stress-ng.time.voluntary_context_switches
    778745 ±  3%     +48.1%    1153101        proc-vmstat.nr_active_anon
   1499795           +25.0%    1874390        proc-vmstat.nr_file_pages
     36060            +2.5%      36963        proc-vmstat.nr_kernel_stack
    580073 ±  4%     +64.6%     954656        proc-vmstat.nr_shmem
     25107            +4.4%      26211        proc-vmstat.nr_slab_reclaimable
    109873            +3.8%     114037        proc-vmstat.nr_slab_unreclaimable
    778745 ±  3%     +48.1%    1153101        proc-vmstat.nr_zone_active_anon
  51213670 ±  2%     +13.5%   58103690        proc-vmstat.numa_hit
  51145273 ±  2%     +13.5%   58034611        proc-vmstat.numa_local
  51445244 ±  2%     +13.5%   58378951        proc-vmstat.pgalloc_normal
  67751297 ±  3%     +11.4%   75497726        proc-vmstat.pgfault
  50147402 ±  2%     +12.8%   56586836        proc-vmstat.pgfree
      3.11 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3138 ± 25%    -100.0%       0.00        perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3.11 ±  3%    -100.0%       0.00        perf-sched.total_sch_delay.average.ms
      3138 ± 25%    -100.0%       0.00        perf-sched.total_sch_delay.max.ms
      6.68 ±  3%    -100.0%       0.00        perf-sched.total_wait_and_delay.average.ms
   2011649 ±  4%    -100.0%       0.00        perf-sched.total_wait_and_delay.count.ms
      5991 ± 20%    -100.0%       0.00        perf-sched.total_wait_and_delay.max.ms
      3.57 ±  3%    -100.0%       0.00        perf-sched.total_wait_time.average.ms
      4709 ±  6%    -100.0%       0.00        perf-sched.total_wait_time.max.ms
      6.68 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   2011649 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      5991 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3.57 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      4709 ±  6%    -100.0%       0.00        perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   2348380           +12.7%    2647346        sched_debug.cfs_rq:/.avg_vruntime.avg
     29.30 ± 13%     +52.7%      44.75 ± 17%  sched_debug.cfs_rq:/.h_nr_idle.max
      7.38 ±  6%     +41.7%      10.46 ±  9%  sched_debug.cfs_rq:/.h_nr_idle.stddev
     32.20 ± 12%     +45.7%      46.90 ± 15%  sched_debug.cfs_rq:/.h_nr_queued.max
      7.99 ±  6%     +34.9%      10.78 ±  9%  sched_debug.cfs_rq:/.h_nr_queued.stddev
     32.10 ± 12%     +46.0%      46.85 ± 15%  sched_debug.cfs_rq:/.h_nr_runnable.max
      8.02 ±  6%     +34.6%      10.78 ±  9%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
   2348381           +12.7%    2647348        sched_debug.cfs_rq:/.min_vruntime.avg
      8069 ±  6%     +25.0%      10088 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    269.11 ±  6%     +19.7%     322.00 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
    202.12 ±  9%     -19.2%     163.26 ±  7%  sched_debug.cfs_rq:/.util_est.avg
     14.09 ± 21%     -55.6%       6.25 ±  8%  sched_debug.cpu.clock.stddev
    676823           +12.1%     758861        sched_debug.cpu.curr->pid.max
    314579 ±  2%     +15.0%     361865        sched_debug.cpu.curr->pid.stddev
     32.25 ± 12%     +45.4%      46.90 ± 15%  sched_debug.cpu.nr_running.max
      7.98 ±  6%     +35.1%      10.77 ±  9%  sched_debug.cpu.nr_running.stddev
   1307957           -24.3%     989961        sched_debug.cpu.nr_switches.avg
   1693062 ±  3%     -27.1%    1233735 ±  3%  sched_debug.cpu.nr_switches.max
    172899 ± 10%     -42.5%      99379 ± 12%  sched_debug.cpu.nr_switches.stddev
     21.70 ± 21%     +55.8%      33.80 ± 11%  sched_debug.cpu.nr_uninterruptible.max
      8.22 ± 12%     +68.4%      13.84 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev
      1.21           +39.9%       1.69        perf-stat.i.MPKI
 2.432e+10           -20.9%  1.924e+10        perf-stat.i.branch-instructions
      0.66            +0.1        0.77        perf-stat.i.branch-miss-rate%
 1.594e+08            -7.3%  1.478e+08 ±  2%  perf-stat.i.branch-misses
     25.54            -1.0       24.50        perf-stat.i.cache-miss-rate%
 1.295e+08           +13.1%  1.465e+08        perf-stat.i.cache-misses
 5.146e+08           +17.7%  6.058e+08        perf-stat.i.cache-references
   2790731           -24.4%    2108550        perf-stat.i.context-switches
      1.81           +23.7%       2.23        perf-stat.i.cpi
      5946          +379.4%      28505        perf-stat.i.cpu-migrations
      1500           -11.2%       1332        perf-stat.i.cycles-between-cache-misses
 1.081e+11           -19.0%  8.755e+10        perf-stat.i.instructions
      0.56           -19.0%       0.45        perf-stat.i.ipc
      0.57 ± 22%    +140.1%       1.38 ± 15%  perf-stat.i.major-faults
     78.37            -8.6%      71.63        perf-stat.i.metric.K/sec
   1112655 ±  3%     +11.4%    1239333        perf-stat.i.minor-faults
   1112656 ±  3%     +11.4%    1239334        perf-stat.i.page-faults
      1.20           +39.7%       1.67        perf-stat.overall.MPKI
      0.66            +0.1        0.77        perf-stat.overall.branch-miss-rate%
     25.15            -1.0       24.19        perf-stat.overall.cache-miss-rate%
      1.80           +23.5%       2.23        perf-stat.overall.cpi
      1505           -11.6%       1330        perf-stat.overall.cycles-between-cache-misses
      0.55           -19.0%       0.45        perf-stat.overall.ipc
 2.383e+10           -21.1%  1.881e+10        perf-stat.ps.branch-instructions
 1.562e+08            -7.6%  1.444e+08        perf-stat.ps.branch-misses
 1.269e+08           +13.0%  1.434e+08        perf-stat.ps.cache-misses
 5.045e+08           +17.5%  5.926e+08        perf-stat.ps.cache-references
   2735811           -24.4%    2068114 ±  2%  perf-stat.ps.context-switches
      5817          +377.5%      27779        perf-stat.ps.cpu-migrations
 1.059e+11           -19.1%  8.561e+10        perf-stat.ps.instructions
      0.56 ± 22%    +138.0%       1.34 ± 15%  perf-stat.ps.major-faults
   1090400 ±  3%     +11.2%    1212435        perf-stat.ps.minor-faults
   1090401 ±  3%     +11.2%    1212436        perf-stat.ps.page-faults
  6.49e+12           -19.6%   5.22e+12        perf-stat.total.instructions
     16.33            -8.1        8.27 ±  6%  perf-profile.calltrace.cycles-pp.__sched_setscheduler
     14.12            -7.6        6.51 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     14.08            -7.6        6.50 ±  6%  perf-profile.calltrace.cycles-pp.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     14.70            -7.2        7.50 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     14.61            -7.2        7.45 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     14.69            -6.0        8.70 ±  4%  perf-profile.calltrace.cycles-pp._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.25            -5.8        8.45 ±  4%  perf-profile.calltrace.cycles-pp.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
     11.02            -5.0        6.03 ±  5%  perf-profile.calltrace.cycles-pp.__sched_yield
      8.87            -4.0        4.91 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      8.77            -3.9        4.86 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      7.25            -3.4        3.84 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      4.75            -2.1        2.68 ±  5%  perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      5.04            -2.0        3.03 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      4.80            -1.9        2.86 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      3.81            -1.7        2.08 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_task.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      3.72            -1.7        2.03 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      2.44            -1.3        1.13 ±  6%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      5.79            -1.3        4.52 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.40            -1.3        1.13 ±  6%  perf-profile.calltrace.cycles-pp.__sched_getscheduler
      2.86            -0.9        2.00 ±  4%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.38            -0.8        0.54 ± 33%  perf-profile.calltrace.cycles-pp.update_curr.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64
      1.33            -0.8        0.49 ± 33%  perf-profile.calltrace.cycles-pp.set_next_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      1.44            -0.8        0.62 ±  7%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.__sched_setscheduler._sched_setscheduler
      2.66 ±  5%      -0.8        1.90 ±  4%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield
      1.10            -0.7        0.36 ± 65%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      1.17            -0.7        0.49 ± 33%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      2.00            -0.6        1.36 ± 15%  perf-profile.calltrace.cycles-pp.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.14            -0.6        0.52 ± 33%  perf-profile.calltrace.cycles-pp.pick_task_fair.pick_next_task_fair.__pick_next_task.__schedule.schedule
      1.29            -0.6        0.71 ±  4%  perf-profile.calltrace.cycles-pp.find_get_task.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.28            -0.6        0.72 ±  6%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_entities.dequeue_task_fair.__sched_setscheduler
      1.11            -0.5        0.63 ±  4%  perf-profile.calltrace.cycles-pp.find_task_by_vpid.find_get_task.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
      1.13 ±  5%      -0.4        0.72 ±  6%  perf-profile.calltrace.cycles-pp.stress_resched_child
      2.15            -0.3        1.82 ±  5%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.__sched_setscheduler._sched_setscheduler
      0.72 ±  2%      -0.3        0.44 ± 50%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.60            +0.0        0.64        perf-profile.calltrace.cycles-pp.wake_up_new_task.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.73            +0.1        0.79        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.53            +0.1        0.58 ±  2%  perf-profile.calltrace.cycles-pp.unlink_file_vma_batch_process.unlink_file_vma_batch_add.free_pgtables.exit_mmap.__mmput
      0.55            +0.1        0.60 ±  2%  perf-profile.calltrace.cycles-pp.unlink_file_vma_batch_add.free_pgtables.exit_mmap.__mmput.exit_mm
      0.52            +0.1        0.58        perf-profile.calltrace.cycles-pp.asm_exc_page_fault._Fork
      0.66            +0.1        0.73        perf-profile.calltrace.cycles-pp.refill_obj_stock.__memcg_slab_free_hook.kmem_cache_free.unlink_anon_vmas.free_pgtables
      0.76            +0.1        0.83 ±  2%  perf-profile.calltrace.cycles-pp.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.57            +0.1        0.64        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe._exit
      0.57            +0.1        0.64        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._exit
      0.58            +0.1        0.64        perf-profile.calltrace.cycles-pp._exit
      0.57            +0.1        0.64        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._exit
      0.57            +0.1        0.64        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe._exit
      0.70 ±  2%      +0.1        0.78 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm.copy_process
      0.96            +0.1        1.05        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap
      1.40            +0.1        1.49        perf-profile.calltrace.cycles-pp.__anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.92            +0.1        1.02        perf-profile.calltrace.cycles-pp.up_write.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.81 ±  6%      +0.1        0.91 ±  3%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.pte_alloc_one.__pte_alloc.copy_pte_range.copy_p4d_range
      0.82 ±  7%      +0.1        0.92 ±  3%  perf-profile.calltrace.cycles-pp.pte_alloc_one.__pte_alloc.copy_pte_range.copy_p4d_range.copy_page_range
      0.87 ±  2%      +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.exit_mmap.__mmput.exit_mm.do_exit
      1.32            +0.1        1.46        perf-profile.calltrace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.40 ± 50%      +0.1        0.55 ±  2%  perf-profile.calltrace.cycles-pp.__account_obj_stock.refill_obj_stock.__memcg_slab_free_hook.kmem_cache_free.unlink_anon_vmas
      1.33            +0.2        1.48        perf-profile.calltrace.cycles-pp.__vma_start_write.free_pgtables.exit_mmap.__mmput.exit_mm
      0.90 ±  3%      +0.2        1.06 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm.copy_process
      0.84 ±  2%      +0.2        1.03 ±  2%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap
      1.17 ±  2%      +0.2        1.37 ±  3%  perf-profile.calltrace.cycles-pp.vm_area_dup.dup_mmap.dup_mm.copy_process.kernel_clone
      1.60 ±  2%      +0.2        1.80 ±  2%  perf-profile.calltrace.cycles-pp.folio_remove_rmap_ptes.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
      0.61 ±  2%      +0.2        0.82 ±  2%  perf-profile.calltrace.cycles-pp.down_write.dup_mmap.dup_mm.copy_process.kernel_clone
      2.01 ±  3%      +0.2        2.26 ±  2%  perf-profile.calltrace.cycles-pp.__vma_start_write.dup_mmap.dup_mm.copy_process.kernel_clone
      0.82            +0.2        1.07 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables
      1.44            +0.3        1.72        perf-profile.calltrace.cycles-pp.vma_interval_tree_insert_after.dup_mmap.dup_mm.copy_process.kernel_clone
      0.37 ± 65%      +0.3        0.70 ±  4%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61            +0.3        0.94        perf-profile.calltrace.cycles-pp.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.93 ±  3%      +0.3        3.26 ±  4%  perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_pte_missing.__handle_mm_fault
      0.62            +0.3        0.96        perf-profile.calltrace.cycles-pp.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.13            +0.3        1.47 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork
      1.99 ±  2%      +0.3        2.33 ±  2%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      2.01 ±  2%      +0.3        2.36 ±  2%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput.exit_mm
      2.93            +0.4        3.28        perf-profile.calltrace.cycles-pp.copy_present_ptes.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      2.04 ±  2%      +0.4        2.40 ±  2%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.exit_mm.do_exit
      1.30            +0.4        1.68 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap
      3.79 ±  4%      +0.4        4.21 ±  3%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      3.79 ±  4%      +0.4        4.20 ±  3%  perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      3.66 ±  3%      +0.4        4.08 ±  4%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      4.09 ±  3%      +0.4        4.53 ±  4%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      4.20 ±  3%      +0.4        4.65 ±  4%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.10 ±200%      +0.5        0.56        perf-profile.calltrace.cycles-pp.mm_init.dup_mm.copy_process.kernel_clone.__do_sys_clone
      4.55 ±  3%      +0.5        5.03 ±  3%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      4.56 ±  3%      +0.5        5.04 ±  3%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      4.80 ±  3%      +0.5        5.30 ±  3%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.81 ±  2%      +0.5        1.33 ±  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.exit_mmap.__mmput.exit_mm
      4.13 ±  2%      +0.5        4.65        perf-profile.calltrace.cycles-pp.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap.dup_mm
      0.00            +0.5        0.54 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.dup_mmap.dup_mm.copy_process
      0.83 ±  2%      +0.6        1.39 ±  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables
      4.72 ±  2%      +0.6        5.30        perf-profile.calltrace.cycles-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
      4.79 ±  2%      +0.6        5.38        perf-profile.calltrace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
      0.00            +0.6        0.65 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.67 ±  6%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
      5.02            +0.7        5.71        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.00            +0.7        0.73 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
      0.00            +0.7        0.73        perf-profile.calltrace.cycles-pp.__do_wait.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.18 ±  4%      +0.8        1.93 ±  3%  perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.41 ±  2%      +0.8        2.21 ±  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap
      0.00            +0.9        0.86 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.01 ±  4%      +0.9        3.90 ±  3%  perf-profile.calltrace.cycles-pp.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.90            +0.9        2.78 ±  3%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      6.80 ±  2%      +0.9        7.68 ±  2%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      3.02 ±  4%      +0.9        3.91 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.11            +0.9        3.04 ±  3%  perf-profile.calltrace.cycles-pp.down_write.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      2.21            +0.9        3.14 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      1.70 ±  4%      +1.0        2.65 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.48            +1.0        3.47 ±  3%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      8.16            +1.0        9.21 ±  2%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      8.29            +1.1        9.35 ±  2%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      8.46            +1.1        9.54 ±  2%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      8.99            +1.1       10.12        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      3.07            +1.3        4.34 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap.dup_mm
      3.21 ±  2%      +1.3        4.50 ±  3%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_fork.dup_mmap.dup_mm.copy_process
      7.48            +1.4        8.93 ±  2%  perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.exit_mm
      9.60            +1.7       11.29        perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      9.66            +2.0       11.62        perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
     22.54            +3.4       25.95        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     22.41            +3.4       25.83        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     22.48            +3.4       25.91        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
     14.47            +3.5       17.97 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
     23.14            +3.6       26.76        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.18            +3.6       26.81        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.71            +3.7       27.38        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
     23.72            +3.7       27.40        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.51            +5.4       31.95        perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
     27.17            +5.5       32.69        perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
     28.33            +5.7       34.06        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.05            +5.7       34.78        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
     29.05            +5.7       34.78        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     29.00            +5.8       34.76        perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     29.00            +5.8       34.76        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     29.85            +5.9       35.73        perf-profile.calltrace.cycles-pp._Fork
     29.38            +6.8       36.19        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.44            +6.8       36.26        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     31.14           -14.1       17.00 ±  5%  perf-profile.children.cycles-pp.__sched_setscheduler
     17.16            -6.7       10.44 ±  4%  perf-profile.children.cycles-pp.__x64_sys_sched_setscheduler
     17.14            -6.7       10.42 ±  4%  perf-profile.children.cycles-pp.do_sched_setscheduler
     14.70            -6.0        8.71 ±  4%  perf-profile.children.cycles-pp._sched_setscheduler
     11.53            -5.2        6.33 ±  5%  perf-profile.children.cycles-pp.__sched_yield
      8.97            -2.5        6.50 ±  4%  perf-profile.children.cycles-pp.__x64_sys_sched_yield
      5.18            -1.9        3.23 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      4.94            -1.9        3.06 ±  4%  perf-profile.children.cycles-pp.dequeue_entities
      3.97            -1.7        2.28 ±  4%  perf-profile.children.cycles-pp.enqueue_task
      3.88            -1.6        2.24 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.68            -1.4        1.26 ±  6%  perf-profile.children.cycles-pp.__sched_getscheduler
      2.05            -1.2        0.89 ±  4%  perf-profile.children.cycles-pp.reweight_entity
      2.98            -1.1        1.85 ±  4%  perf-profile.children.cycles-pp.do_sched_yield
      4.51            -1.1        3.46 ±  4%  perf-profile.children.cycles-pp.update_curr
      2.44            -1.0        1.44 ±  5%  perf-profile.children.cycles-pp.yield_task_fair
      2.82            -1.0        1.86 ±  4%  perf-profile.children.cycles-pp.update_load_avg
      2.14            -0.9        1.21 ±  4%  perf-profile.children.cycles-pp.set_next_entity
      1.99            -0.8        1.19 ±  5%  perf-profile.children.cycles-pp.clear_bhb_loop
      2.74            -0.8        1.95 ±  4%  perf-profile.children.cycles-pp.dequeue_entity
      1.64            -0.8        0.87 ±  4%  perf-profile.children.cycles-pp.set_next_task_fair
      2.78            -0.8        2.01 ±  5%  perf-profile.children.cycles-pp.update_se
      1.90            -0.8        1.14 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
      1.54            -0.7        0.79 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.25            -0.7        1.54 ±  3%  perf-profile.children.cycles-pp.find_task_by_vpid
      1.23            -0.6        0.60 ±  4%  perf-profile.children.cycles-pp.__dequeue_entity
      1.20            -0.5        0.71 ±  3%  perf-profile.children.cycles-pp.__enqueue_entity
      0.62 ±  9%      -0.5        0.14 ± 80%  perf-profile.children.cycles-pp.process_simple
      0.60 ±  9%      -0.5        0.13 ± 79%  perf-profile.children.cycles-pp.ordered_events__queue
      0.60 ±  9%      -0.5        0.13 ± 80%  perf-profile.children.cycles-pp.queue_event
      1.20 ±  5%      -0.4        0.75 ±  5%  perf-profile.children.cycles-pp.stress_resched_child
      1.61            -0.4        1.17 ±  3%  perf-profile.children.cycles-pp.find_get_task
      0.96            -0.4        0.57 ±  5%  perf-profile.children.cycles-pp.__x64_sys_sched_getscheduler
      0.78            -0.4        0.38 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.90            -0.4        0.54 ±  4%  perf-profile.children.cycles-pp.idr_find
      0.69            -0.4        0.33 ±  5%  perf-profile.children.cycles-pp.update_entity_lag
      1.53            -0.4        1.17 ±  2%  perf-profile.children.cycles-pp.its_return_thunk
      0.82            -0.3        0.47 ±  4%  perf-profile.children.cycles-pp.__calc_delta
      1.32            -0.3        1.01 ±  4%  perf-profile.children.cycles-pp.put_prev_entity
      0.78            -0.3        0.47 ±  4%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.00            -0.3        0.71 ±  4%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.84            -0.3        0.54 ±  4%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.83            -0.3        0.54 ±  4%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.56            -0.3        0.27 ±  4%  perf-profile.children.cycles-pp.avg_vruntime
      2.99            -0.3        2.72 ±  4%  perf-profile.children.cycles-pp.__pick_next_task
      0.79 ±  2%      -0.3        0.52 ±  4%  perf-profile.children.cycles-pp.update_cfs_group
      0.76            -0.3        0.50 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      1.14            -0.2        0.89 ±  4%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      2.84            -0.2        2.61 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.45            -0.2        0.26 ±  5%  perf-profile.children.cycles-pp.set_load_weight
      0.69            -0.2        0.50 ±  5%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.62            -0.2        0.45 ±  4%  perf-profile.children.cycles-pp.__pick_eevdf
      1.00            -0.2        0.84 ±  2%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.62            -0.2        0.46 ±  4%  perf-profile.children.cycles-pp.update_rq_clock
      0.51 ±  5%      -0.2        0.36 ±  8%  perf-profile.children.cycles-pp._copy_from_user
      0.52            -0.2        0.37 ±  3%  perf-profile.children.cycles-pp.task_rq_lock
      0.36            -0.1        0.22 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.81            -0.1        0.67 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.38 ±  2%      -0.1        0.25 ±  5%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.44            -0.1        0.32 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.28            -0.1        0.17 ±  6%  perf-profile.children.cycles-pp.reweight_task_fair
      0.31 ±  2%      -0.1        0.19 ±  6%  perf-profile.children.cycles-pp.rt_mutex_adjust_pi
      0.40            -0.1        0.29 ±  4%  perf-profile.children.cycles-pp.sched_clock
      0.36            -0.1        0.25 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.35            -0.1        0.26 ±  5%  perf-profile.children.cycles-pp.strnlen
      0.35            -0.1        0.26 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.23            -0.1        0.15 ±  3%  perf-profile.children.cycles-pp.propagate_entity_load_avg
      0.15 ±  3%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.rwsem_wake
      0.23 ±  6%      -0.1        0.16 ±  7%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.24 ±  8%      -0.1        0.18 ±  9%  perf-profile.children.cycles-pp.cpuacct_charge
      0.15 ± 13%      -0.1        0.10 ±  6%  perf-profile.children.cycles-pp.sched_getscheduler@plt
      0.39 ±  3%      -0.0        0.34 ±  4%  perf-profile.children.cycles-pp.update_min_vruntime
      0.51            -0.0        0.47        perf-profile.children.cycles-pp.__rb_insert_augmented
      0.15            -0.0        0.11 ±  6%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.17 ±  2%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      1.38            -0.0        1.34        perf-profile.children.cycles-pp._raw_spin_lock
      0.14 ±  3%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.09 ±  4%      -0.0        0.05 ±  5%  perf-profile.children.cycles-pp.security_task_setscheduler
      0.06            -0.0        0.03 ± 81%  perf-profile.children.cycles-pp.dl_server_update
      0.34            -0.0        0.31 ±  4%  perf-profile.children.cycles-pp.prepare_task_switch
      0.09 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.08            -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.capable
      0.19 ±  2%      -0.0        0.16 ±  5%  perf-profile.children.cycles-pp.os_xsave
      0.26            -0.0        0.24        perf-profile.children.cycles-pp.__vmalloc_node_noprof
      0.11 ±  4%      -0.0        0.09 ±  6%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.25            -0.0        0.24        perf-profile.children.cycles-pp.__vmalloc_node_range_noprof
      0.07            -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.pick_next_task
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.__put_task_struct
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.perf_mmap__push
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.free_swap_cache
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.06 ±  7%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.free_pgd_range
      0.06 ±  8%      +0.0        0.07        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.09 ±  4%      +0.0        0.10 ±  2%  perf-profile.children.cycles-pp.do_task_dead
      0.11 ±  4%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.vm_normal_page
      0.09 ±  4%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.xas_load
      0.11            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.arch_dup_task_struct
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.__page_cache_release
      0.13 ±  2%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.mas_wr_store_type
      0.07 ±  4%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.14 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.__perf_sw_event
      0.13 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.vma_mark_detached
      0.08 ±  5%      +0.0        0.10        perf-profile.children.cycles-pp.__pi_memcpy
      0.19 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.mas_walk
      0.13 ±  3%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.sched_move_task
      0.18 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.alloc_pid
      0.26 ±  2%      +0.0        0.28 ±  2%  perf-profile.children.cycles-pp.sched_tick
      0.19 ±  2%      +0.0        0.21 ±  3%  perf-profile.children.cycles-pp.task_tick_fair
      0.04 ± 50%      +0.0        0.06        perf-profile.children.cycles-pp.mas_copy_node
      0.11 ±  2%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.__switch_to_asm
      0.04 ± 33%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.copy_signal
      0.35            +0.0        0.37        perf-profile.children.cycles-pp.alloc_thread_stack_node
      0.21 ±  3%      +0.0        0.23 ±  3%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.15 ±  3%      +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.10 ±  6%      +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.21 ±  2%      +0.0        0.24        perf-profile.children.cycles-pp.__mt_dup
      0.13 ±  4%      +0.0        0.16 ± 12%  perf-profile.children.cycles-pp.mod_memcg_state
      0.61            +0.0        0.64        perf-profile.children.cycles-pp.wake_up_new_task
      0.32 ±  2%      +0.0        0.35 ±  2%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.24 ±  5%      +0.0        0.28 ±  3%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
      0.07 ±  5%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.lru_add_drain
      0.07 ±  5%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.18 ±  2%      +0.0        0.22        perf-profile.children.cycles-pp.__put_user_4
      0.08 ±  6%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.wp_can_reuse_anon_folio
      0.16            +0.0        0.20 ±  6%  perf-profile.children.cycles-pp.vruntime_eligible
      0.25            +0.0        0.29        perf-profile.children.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.30 ±  7%      +0.0        0.34 ±  2%  perf-profile.children.cycles-pp.try_charge_memcg
      0.21 ±  4%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.__pcs_replace_full_main
      0.34 ±  2%      +0.0        0.37        perf-profile.children.cycles-pp.mas_store
      0.11 ±  4%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.wait_consider_task
      0.38 ±  2%      +0.0        0.42        perf-profile.children.cycles-pp.unmap_single_vma
      0.46            +0.0        0.50        perf-profile.children.cycles-pp.select_task_rq_fair
      0.25            +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.vm_area_init_from
      0.31 ±  2%      +0.0        0.36 ±  2%  perf-profile.children.cycles-pp.__mmdrop
      0.11 ±  4%      +0.0        0.15 ±  5%  perf-profile.children.cycles-pp.do_wp_page
      0.30 ±  3%      +0.0        0.34 ±  2%  perf-profile.children.cycles-pp.pcpu_alloc_noprof
      0.53 ±  2%      +0.0        0.57 ±  2%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.37            +0.0        0.42        perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.47            +0.0        0.51        perf-profile.children.cycles-pp.mas_next_slot
      0.47            +0.0        0.51        perf-profile.children.cycles-pp.acct_collect
      0.49            +0.0        0.54        perf-profile.children.cycles-pp.__rb_erase_color
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.lock_mm_and_find_vma
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.flush_tlb_func
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      0.56            +0.1        0.62        perf-profile.children.cycles-pp.mas_find
      0.40            +0.1        0.46 ±  2%  perf-profile.children.cycles-pp.fput
      0.04 ± 65%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__do_sys_prctl
      0.05            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.04 ± 50%      +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.try_to_block_task
      0.55            +0.1        0.61 ±  2%  perf-profile.children.cycles-pp.unlink_file_vma_batch_add
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.34 ±  4%      +0.1        0.40 ±  3%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.32 ±  3%      +0.1        0.38 ±  3%  perf-profile.children.cycles-pp.__get_user_8
      0.58            +0.1        0.64 ±  2%  perf-profile.children.cycles-pp.unlink_file_vma_batch_process
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.select_task_rq
      0.45            +0.1        0.51 ±  2%  perf-profile.children.cycles-pp.remove_vma
      0.20 ±  2%      +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.memset_orig
      0.50 ±  2%      +0.1        0.56        perf-profile.children.cycles-pp.mm_init
      0.58 ±  4%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.58            +0.1        0.64        perf-profile.children.cycles-pp._exit
      0.76            +0.1        0.83 ±  2%  perf-profile.children.cycles-pp.__put_anon_vma
      0.20            +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
      0.24            +0.1        0.31        perf-profile.children.cycles-pp.schedule_tail
      0.07 ± 15%      +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.path_from_stashed
      0.41            +0.1        0.49 ±  2%  perf-profile.children.cycles-pp.pthread_rwlock_unlock
      0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.proc_ns_get_link
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.walk_component
      0.31 ±  2%      +0.1        0.39 ±  2%  perf-profile.children.cycles-pp.prctl
      0.38 ±  2%      +0.1        0.46        perf-profile.children.cycles-pp.__slab_free
      0.34 ±  5%      +0.1        0.42 ±  7%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.08 ± 14%      +0.1        0.16 ± 10%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.16            +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.do_notify_parent
      0.01 ±299%      +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.map__clone
      0.59 ±  4%      +0.1        0.68 ±  4%  perf-profile.children.cycles-pp.___slab_alloc
      0.14            +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.__wake_up_sync_key
      0.14 ±  2%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.__wake_up_common
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.map__put
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.sched_balance_rq
      1.00 ±  5%      +0.1        1.09 ±  3%  perf-profile.children.cycles-pp.pte_alloc_one
      0.24 ±  2%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.release_task
      1.40            +0.1        1.50        perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.77            +0.1        0.87 ±  3%  perf-profile.children.cycles-pp.obj_cgroup_charge_account
      0.31 ±  3%      +0.1        0.41 ±  4%  perf-profile.children.cycles-pp.osq_unlock
      0.27            +0.1        0.37 ±  2%  perf-profile.children.cycles-pp.wait_task_zombie
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.__resched_curr
      0.86            +0.1        0.96        perf-profile.children.cycles-pp.refill_obj_stock
      0.01 ±299%      +0.1        0.11 ± 22%  perf-profile.children.cycles-pp.link_path_walk
      0.01 ±299%      +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.maps__copy_from
      0.01 ±299%      +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.pick_link
      0.01 ±299%      +0.1        0.11 ± 21%  perf-profile.children.cycles-pp.thread__delete
      0.01 ±299%      +0.1        0.11 ± 21%  perf-profile.children.cycles-pp.step_into
      0.83 ±  7%      +0.1        0.94 ±  3%  perf-profile.children.cycles-pp.__pte_alloc
      0.01 ±201%      +0.1        0.12 ± 20%  perf-profile.children.cycles-pp.machine__process_exit_event
      0.00            +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.00            +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.08 ±  6%      +0.1        0.19 ± 12%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.48 ±  3%      +0.1        0.60 ±  2%  perf-profile.children.cycles-pp.rcu_core
      0.46 ±  2%      +0.1        0.58        perf-profile.children.cycles-pp.finish_task_switch
      0.45 ±  3%      +0.1        0.57 ±  2%  perf-profile.children.cycles-pp.rcu_do_batch
      1.46 ±  4%      +0.1        1.60 ±  3%  perf-profile.children.cycles-pp.alloc_pages_mpol
      1.43 ±  4%      +0.1        1.56 ±  3%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      1.11            +0.1        1.25 ±  2%  perf-profile.children.cycles-pp.__account_obj_stock
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.sched_balance_domains
      1.56 ±  4%      +0.2        1.72 ±  3%  perf-profile.children.cycles-pp.alloc_pages_noprof
      0.01 ±299%      +0.2        0.16 ±  9%  perf-profile.children.cycles-pp.maps__put
      0.23            +0.2        0.39        perf-profile.children.cycles-pp.exit_notify
      0.09            +0.2        0.25 ±  2%  perf-profile.children.cycles-pp.queued_read_lock_slowpath
      0.51            +0.2        0.68        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.04 ±104%      +0.2        0.21 ± 20%  perf-profile.children.cycles-pp.path_lookupat
      0.04 ±104%      +0.2        0.22 ± 20%  perf-profile.children.cycles-pp.filename_lookup
      1.62            +0.2        1.80        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.11 ±  4%      +0.2        0.30 ±  2%  perf-profile.children.cycles-pp.queued_write_lock_slowpath
      0.00            +0.2        0.19 ± 39%  perf-profile.children.cycles-pp.add_callchain_ip
      1.12 ±  2%      +0.2        1.31 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.29            +0.2        1.48 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.04 ±104%      +0.2        0.23 ± 21%  perf-profile.children.cycles-pp.vfs_statx
      0.00            +0.2        0.20 ± 37%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      1.18 ±  2%      +0.2        1.38 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.88 ±  2%      +0.2        1.08 ±  2%  perf-profile.children.cycles-pp.folios_put_refs
      1.18 ±  2%      +0.2        1.38 ±  3%  perf-profile.children.cycles-pp.vm_area_dup
      0.04 ±104%      +0.2        0.25 ± 21%  perf-profile.children.cycles-pp.vfs_fstatat
      1.62 ±  2%      +0.2        1.82 ±  2%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.04 ±103%      +0.2        0.25 ± 22%  perf-profile.children.cycles-pp.__do_sys_newfstatat
      1.66            +0.2        1.89 ±  2%  perf-profile.children.cycles-pp.up_write
      0.05 ±104%      +0.2        0.28 ± 20%  perf-profile.children.cycles-pp.fstatat64
      0.05 ±104%      +0.2        0.28 ± 21%  perf-profile.children.cycles-pp.nsinfo__new
      0.05 ±105%      +0.2        0.29 ± 21%  perf-profile.children.cycles-pp.thread__new
      0.57 ±  2%      +0.2        0.82        perf-profile.children.cycles-pp.handle_softirqs
      0.05 ±105%      +0.2        0.30 ± 21%  perf-profile.children.cycles-pp.threads__findnew
      0.46            +0.3        0.73        perf-profile.children.cycles-pp.__do_wait
      0.05 ±104%      +0.3        0.33 ± 19%  perf-profile.children.cycles-pp.machine__findnew_thread
      0.23 ±  5%      +0.3        0.50 ± 19%  perf-profile.children.cycles-pp.kthread
      1.44            +0.3        1.72        perf-profile.children.cycles-pp.vma_interval_tree_insert_after
      0.00            +0.3        0.30 ± 39%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.42            +0.3        0.72 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.3        0.30 ± 39%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.00            +0.3        0.32 ± 39%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.61            +0.3        0.94        perf-profile.children.cycles-pp.do_wait
      2.44            +0.3        2.78 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      2.03 ±  2%      +0.3        2.36 ±  2%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.62            +0.3        0.96        perf-profile.children.cycles-pp.kernel_wait4
      2.03 ±  2%      +0.3        2.37 ±  2%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.51 ±  3%      +0.4        0.86 ± 11%  perf-profile.children.cycles-pp.ret_from_fork
      0.51 ±  3%      +0.4        0.86 ± 11%  perf-profile.children.cycles-pp.ret_from_fork_asm
      2.95            +0.4        3.30        perf-profile.children.cycles-pp.copy_present_ptes
      2.04 ±  2%      +0.4        2.40 ±  2%  perf-profile.children.cycles-pp.tlb_finish_mmu
      2.58            +0.4        2.94        perf-profile.children.cycles-pp.kmem_cache_free
      0.79 ±  7%      +0.4        1.18 ±  4%  perf-profile.children.cycles-pp.reader__read_event
      0.09 ±105%      +0.4        0.50 ± 22%  perf-profile.children.cycles-pp.machine__process_fork_event
      3.35 ±  2%      +0.4        3.76        perf-profile.children.cycles-pp.__vma_start_write
      4.07 ±  5%      +0.5        4.57 ±  4%  perf-profile.children.cycles-pp.next_uptodate_folio
      4.14 ±  2%      +0.5        4.67        perf-profile.children.cycles-pp.copy_pte_range
      4.72 ±  2%      +0.6        5.30        perf-profile.children.cycles-pp.copy_p4d_range
      4.80 ±  2%      +0.6        5.38        perf-profile.children.cycles-pp.copy_page_range
      5.06 ±  5%      +0.6        5.67 ±  3%  perf-profile.children.cycles-pp.filemap_map_pages
      5.06            +0.7        5.76        perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      6.20 ±  4%      +0.7        6.93 ±  3%  perf-profile.children.cycles-pp.__handle_mm_fault
      6.37 ±  4%      +0.7        7.12 ±  3%  perf-profile.children.cycles-pp.handle_mm_fault
      6.92 ±  4%      +0.8        7.73 ±  3%  perf-profile.children.cycles-pp.do_user_addr_fault
      6.94 ±  4%      +0.8        7.75 ±  3%  perf-profile.children.cycles-pp.exc_page_fault
      7.43 ±  4%      +0.9        8.30 ±  3%  perf-profile.children.cycles-pp.asm_exc_page_fault
      6.87 ±  2%      +0.9        7.77 ±  2%  perf-profile.children.cycles-pp.zap_present_ptes
      0.11 ±105%      +0.9        1.01 ±  7%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.12 ±105%      +0.9        1.04 ±  7%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.12 ±105%      +0.9        1.04 ±  7%  perf-profile.children.cycles-pp.perf_session__process_user_event
      1.15            +1.0        2.16 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      3.50            +1.0        4.54 ±  2%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
     84.12            +1.0       85.17        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      8.19            +1.1        9.24 ±  2%  perf-profile.children.cycles-pp.zap_pte_range
      8.30            +1.1        9.36 ±  2%  perf-profile.children.cycles-pp.zap_pmd_range
      8.48            +1.1        9.56 ±  2%  perf-profile.children.cycles-pp.unmap_page_range
      9.00            +1.1       10.13        perf-profile.children.cycles-pp.unmap_vmas
     83.77            +1.2       84.94        perf-profile.children.cycles-pp.do_syscall_64
      7.49            +1.4        8.94 ±  2%  perf-profile.children.cycles-pp.unlink_anon_vmas
      9.61            +1.7       11.31        perf-profile.children.cycles-pp.free_pgtables
      9.67            +2.0       11.63        perf-profile.children.cycles-pp.anon_vma_clone
      3.31 ±  2%      +2.0        5.29 ±  3%  perf-profile.children.cycles-pp.osq_lock
      7.87            +3.3       11.16 ±  2%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     22.56            +3.4       25.97        perf-profile.children.cycles-pp.exit_mm
     22.43            +3.4       25.85        perf-profile.children.cycles-pp.exit_mmap
     22.48            +3.4       25.91        perf-profile.children.cycles-pp.__mmput
      8.99            +3.5       12.45 ±  2%  perf-profile.children.cycles-pp.down_write
     14.48            +3.5       17.98 ±  2%  perf-profile.children.cycles-pp.anon_vma_fork
     23.94            +3.6       27.55        perf-profile.children.cycles-pp.x64_sys_call
     23.72            +3.7       27.40        perf-profile.children.cycles-pp.do_group_exit
     23.71            +3.7       27.39        perf-profile.children.cycles-pp.do_exit
     23.72            +3.7       27.40        perf-profile.children.cycles-pp.__x64_sys_exit_group
     26.65            +5.5       32.10        perf-profile.children.cycles-pp.dup_mmap
     27.17            +5.5       32.69        perf-profile.children.cycles-pp.dup_mm
     28.34            +5.7       34.06        perf-profile.children.cycles-pp.copy_process
     29.00            +5.8       34.76        perf-profile.children.cycles-pp.__do_sys_clone
     29.00            +5.8       34.76        perf-profile.children.cycles-pp.kernel_clone
     29.91            +5.9       35.78        perf-profile.children.cycles-pp._Fork
      1.97            -0.8        1.17 ±  5%  perf-profile.self.cycles-pp.clear_bhb_loop
      1.07            -0.6        0.46 ±  4%  perf-profile.self.cycles-pp.__dequeue_entity
      1.33            -0.5        0.82 ±  4%  perf-profile.self.cycles-pp.__sched_setscheduler
      1.17            -0.5        0.69 ±  3%  perf-profile.self.cycles-pp.__enqueue_entity
      0.58 ±  9%      -0.5        0.13 ± 79%  perf-profile.self.cycles-pp.queue_event
      0.81            -0.4        0.39 ±  5%  perf-profile.self.cycles-pp.reweight_entity
      1.46 ±  2%      -0.4        1.05 ±  6%  perf-profile.self.cycles-pp.update_se
      1.00 ±  2%      -0.4        0.59 ±  7%  perf-profile.self.cycles-pp.stress_resched_child
      0.88            -0.4        0.52 ±  4%  perf-profile.self.cycles-pp.idr_find
      1.06            -0.4        0.70 ±  4%  perf-profile.self.cycles-pp.update_load_avg
      0.74            -0.3        0.43 ±  4%  perf-profile.self.cycles-pp.__calc_delta
      0.76            -0.3        0.45 ±  5%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.98            -0.3        0.69 ±  5%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.51            -0.3        0.25 ±  4%  perf-profile.self.cycles-pp.avg_vruntime
      0.75            -0.3        0.49 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.76 ±  2%      -0.3        0.51 ±  4%  perf-profile.self.cycles-pp.update_cfs_group
      0.62            -0.2        0.38 ±  4%  perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.70            -0.2        0.46 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.58 ±  2%      -0.2        0.36 ±  4%  perf-profile.self.cycles-pp.__sched_yield
      0.89            -0.2        0.68 ±  3%  perf-profile.self.cycles-pp.update_curr
      0.63            -0.2        0.44 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      0.50            -0.2        0.31 ±  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.81            -0.2        0.63 ±  3%  perf-profile.self.cycles-pp.its_return_thunk
      0.47            -0.2        0.28 ±  5%  perf-profile.self.cycles-pp.enqueue_task_fair
      1.05            -0.2        0.88 ±  3%  perf-profile.self.cycles-pp.__schedule
      0.30            -0.2        0.14 ±  6%  perf-profile.self.cycles-pp.__sched_getscheduler
      0.41            -0.2        0.26 ±  4%  perf-profile.self.cycles-pp.dequeue_entities
      0.46            -0.1        0.31 ±  4%  perf-profile.self.cycles-pp.__pick_eevdf
      0.49 ±  5%      -0.1        0.35 ±  7%  perf-profile.self.cycles-pp._copy_from_user
      0.31            -0.1        0.16 ±  6%  perf-profile.self.cycles-pp.place_entity
      0.67            -0.1        0.54 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.35            -0.1        0.22 ±  3%  perf-profile.self.cycles-pp.set_next_entity
      0.35            -0.1        0.23 ±  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.27            -0.1        0.15 ±  6%  perf-profile.self.cycles-pp._sched_setscheduler
      0.30            -0.1        0.18 ±  5%  perf-profile.self.cycles-pp.do_sched_setscheduler
      0.32 ±  2%      -0.1        0.20 ±  5%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.35            -0.1        0.24 ±  5%  perf-profile.self.cycles-pp.dequeue_entity
      1.12            -0.1        1.02 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.30 ±  2%      -0.1        0.21 ±  3%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.32            -0.1        0.23 ±  6%  perf-profile.self.cycles-pp.do_perf_trace_sched_stat_runtime
      0.34 ±  2%      -0.1        0.25 ±  5%  perf-profile.self.cycles-pp.strnlen
      0.16 ±  2%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.update_entity_lag
      0.33            -0.1        0.25 ±  4%  perf-profile.self.cycles-pp.native_sched_clock
      0.26 ±  2%      -0.1        0.18 ±  4%  perf-profile.self.cycles-pp.enqueue_entity
      0.18            -0.1        0.10 ±  6%  perf-profile.self.cycles-pp.set_next_task_fair
      0.20 ±  2%      -0.1        0.13 ±  5%  perf-profile.self.cycles-pp.find_get_task
      0.15 ±  4%      -0.1        0.08 ±  7%  perf-profile.self.cycles-pp.set_load_weight
      0.23 ±  2%      -0.1        0.17 ±  4%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.20 ±  2%      -0.1        0.14 ±  5%  perf-profile.self.cycles-pp.x64_sys_call
      0.18 ±  2%      -0.1        0.12 ±  5%  perf-profile.self.cycles-pp.propagate_entity_load_avg
      0.14 ±  2%      -0.1        0.08 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.22 ±  8%      -0.1        0.17 ±  9%  perf-profile.self.cycles-pp.cpuacct_charge
      0.36            -0.0        0.31        perf-profile.self.cycles-pp.find_task_by_vpid
      0.16 ±  2%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.put_prev_entity
      0.13 ±  5%      -0.0        0.08 ±  7%  perf-profile.self.cycles-pp.yield_task_fair
      0.12 ±  3%      -0.0        0.08 ±  3%  perf-profile.self.cycles-pp.do_sched_yield
      0.26 ±  2%      -0.0        0.22 ±  4%  perf-profile.self.cycles-pp.pick_task_fair
      0.18            -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.update_rq_clock
      0.15 ±  2%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__pick_next_task
      0.35 ±  3%      -0.0        0.31 ±  4%  perf-profile.self.cycles-pp.update_min_vruntime
      0.13 ±  2%      -0.0        0.09 ±  6%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.12 ±  2%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.update_curr_dl_se
      0.47            -0.0        0.44        perf-profile.self.cycles-pp.__rb_insert_augmented
      0.12 ± 12%      -0.0        0.09 ± 11%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.08 ±  5%      -0.0        0.04 ± 33%  perf-profile.self.cycles-pp.task_rq_lock
      0.12 ±  3%      -0.0        0.09 ±  6%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.07            -0.0        0.04 ± 50%  perf-profile.self.cycles-pp.raw_spin_rq_unlock
      0.09 ±  4%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      0.18 ±  2%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.os_xsave
      0.07 ±  4%      -0.0        0.05 ± 34%  perf-profile.self.cycles-pp.rt_mutex_adjust_pi
      0.10 ±  4%      -0.0        0.09 ±  6%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.08 ±  5%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.schedule
      0.12 ±  4%      -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.08            -0.0        0.07 ±  4%  perf-profile.self.cycles-pp.__put_user_8
      0.05            +0.0        0.06        perf-profile.self.cycles-pp._raw_spin_trylock
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.pidfs_add_pid
      0.14 ±  2%      +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.__cond_resched
      0.08            +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.__pi_memcpy
      0.17 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.mas_store
      0.12            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.mas_wr_store_type
      0.11 ±  2%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__switch_to_asm
      0.12 ±  3%      +0.0        0.14        perf-profile.self.cycles-pp.vma_mark_detached
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.mas_walk
      0.04 ± 50%      +0.0        0.06        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.12 ±  4%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.25            +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge_account
      0.19 ±  2%      +0.0        0.22 ±  3%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.21 ±  3%      +0.0        0.23 ±  3%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.24 ±  3%      +0.0        0.27 ±  4%  perf-profile.self.cycles-pp.get_partial_node
      0.28 ±  2%      +0.0        0.31 ±  3%  perf-profile.self.cycles-pp.___slab_alloc
      0.14 ±  2%      +0.0        0.17 ±  4%  perf-profile.self.cycles-pp.vruntime_eligible
      0.31 ±  2%      +0.0        0.34        perf-profile.self.cycles-pp.mas_next_slot
      0.11 ±  4%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.finish_task_switch
      0.25            +0.0        0.28 ±  2%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.37 ±  2%      +0.0        0.40        perf-profile.self.cycles-pp.unmap_single_vma
      0.35 ±  2%      +0.0        0.39        perf-profile.self.cycles-pp.acct_collect
      0.17 ±  7%      +0.0        0.20 ±  3%  perf-profile.self.cycles-pp.__put_anon_vma
      0.28            +0.0        0.32        perf-profile.self.cycles-pp.refill_obj_stock
      0.10 ±  3%      +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.wait_consider_task
      0.43            +0.0        0.47        perf-profile.self.cycles-pp.__rb_erase_color
      0.05            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.queued_read_lock_slowpath
      0.24            +0.0        0.29 ±  2%  perf-profile.self.cycles-pp.vm_area_init_from
      0.35 ±  2%      +0.0        0.39        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.copy_process
      0.00            +0.1        0.05 ±  5%  perf-profile.self.cycles-pp.sched_balance_domains
      0.37 ±  2%      +0.1        0.43 ±  3%  perf-profile.self.cycles-pp.kmem_cache_free
      0.39            +0.1        0.45 ±  2%  perf-profile.self.cycles-pp.fput
      0.31 ±  4%      +0.1        0.37 ±  3%  perf-profile.self.cycles-pp.__get_user_8
      0.20 ±  2%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.memset_orig
      0.51 ±  2%      +0.1        0.58 ±  3%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.07 ±  6%      +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.queued_write_lock_slowpath
      0.60 ±  5%      +0.1        0.68 ±  3%  perf-profile.self.cycles-pp.filemap_map_pages
      0.75            +0.1        0.83        perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.36 ±  2%      +0.1        0.45        perf-profile.self.cycles-pp.__slab_free
      0.51 ±  2%      +0.1        0.59 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.08 ± 12%  perf-profile.self.cycles-pp.map__put
      1.37            +0.1        1.47        perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.31 ±  4%      +0.1        0.41 ±  3%  perf-profile.self.cycles-pp.osq_unlock
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__resched_curr
      0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.63 ±  2%      +0.1        0.74        perf-profile.self.cycles-pp.anon_vma_fork
      0.96            +0.1        1.07 ±  2%  perf-profile.self.cycles-pp.__account_obj_stock
      0.73            +0.1        0.86 ±  2%  perf-profile.self.cycles-pp.anon_vma_clone
      1.12 ±  2%      +0.1        1.27 ±  2%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      1.04 ±  2%      +0.2        1.21 ±  3%  perf-profile.self.cycles-pp.down_write
      0.76 ±  3%      +0.2        0.93 ±  2%  perf-profile.self.cycles-pp.folios_put_refs
      0.73 ±  2%      +0.2        0.91 ±  5%  perf-profile.self.cycles-pp.rwsem_down_write_slowpath
      1.57 ±  2%      +0.2        1.77 ±  2%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      1.22            +0.2        1.45        perf-profile.self.cycles-pp.dup_mmap
      1.42            +0.3        1.70        perf-profile.self.cycles-pp.vma_interval_tree_insert_after
      0.42            +0.3        0.72 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.49            +0.3        1.79 ±  2%  perf-profile.self.cycles-pp.up_write
      2.86            +0.3        3.20        perf-profile.self.cycles-pp.copy_present_ptes
      3.16 ±  2%      +0.4        3.54        perf-profile.self.cycles-pp.__vma_start_write
      3.90 ±  5%      +0.5        4.38 ±  4%  perf-profile.self.cycles-pp.next_uptodate_folio
      4.98 ±  2%      +0.7        5.64 ±  2%  perf-profile.self.cycles-pp.zap_present_ptes
      5.00            +0.7        5.68        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      3.46            +1.0        4.48 ±  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      3.27 ±  2%      +2.0        5.22 ±  3%  perf-profile.self.cycles-pp.osq_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


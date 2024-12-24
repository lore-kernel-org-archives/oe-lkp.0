Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A160183CD1
	for <oe-lkp@lists.linux.dev>; Tue, 24 Dec 2024 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029687; cv=fail; b=UsyGLx9X+8Ip9E+EYWc9i0BetFQk/SxO14mUafOy+GYoqXEdKWbXSYfw53jhjoLSuB2O5czJmYAmttSsG7q0lViYWHh/5ZeOb8bYxcUHZq0Nh/cWLpbK0QMUm2nhtjEczIMr+szdBMOj/QQaa5g/M4I1Xs5SD7niujTLug68fbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029687; c=relaxed/simple;
	bh=/btTMae8STvVr8+ZpVjXMDiYEHc7j4/OTpDsAI4cz+w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fhuuzMiFwzl2biKxKCQ3k1IbG7foEqmWZFf3DskOaTnwPB9C2WNyWEBnHDTqYC66zElz0+dFEkgcjeibyV2ENrXLB/zg/CYhaU4pKINUCqUhY9/fTudfpwz4lVfLjuIBHChOrg1xuAcIrdADdL+YFyb910eOlL8Q/OI+LwiVpIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpKT0F2x; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpKT0F2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735029683; x=1766565683;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=/btTMae8STvVr8+ZpVjXMDiYEHc7j4/OTpDsAI4cz+w=;
  b=FpKT0F2xgAGrVSI+4sfwy0kXzxXEer852Reas3E/FHuTlNdUQ2OaGNJu
   Fmoq7BhDawAXt6W8gu2pFHWoxmwnhPLzdGwkbLpQtie3Ppg5QcFMb2EAF
   8XCkQWfehUbvsA26YXfg1bPS0jCdXsqGCmWKt2EduRdMBcgEmypz9SYzp
   slzJGs4uwbrJbpudyTk7Sx688N8ol4DfQvM0FALpjX/LQuz+m4/l0ydQ7
   XlxF05WsS0usGHPnaI7NE7OU3PrdM7GNihBBf2j3yyCN3bFU7NMCjfRhL
   Hi4E302XT9mqDClmELzahWfU1ZxSB12gCSi0n4aP743kc+R/Zthr4CkzB
   A==;
X-CSE-ConnectionGUID: jbbM2RR4SEOQZfxOyCUN2Q==
X-CSE-MsgGUID: yUNgE16RR5SsRg2i9sLBnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46187238"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46187238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 00:41:15 -0800
X-CSE-ConnectionGUID: zENoeOmNQYyRyLim6yybaA==
X-CSE-MsgGUID: fG06e1jBQCyxfPOXxKgf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103525970"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Dec 2024 00:41:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 00:41:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 00:41:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 00:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkwDu+A4KuLlMeN5Zu+q682gkZlHKgvBZWYG+ljEM5ON9YvbCYBoI/o0iRKcoNKF+i+NwLWGyDHll0LsKvuAa/BElsOCcrDW0AV2t5qwG8qSPGSPF76S+j0KuW+bGxl+09zW9NToiJNj9thDpq+9w5YndRLWZa4OU4fwyEJO/r1Qeitjv3w6yogbWW7NbYGGyQEySGuP9/9qBzoDQ3nKr4xPVKGdAPcGoQ/VgEwn1MTYBP9Z1U/3X58Jw2n3Cmn0vaHmHiZS2i94gYeH/ZJ/z0h3ZQ0j8xA4Ac2RIgv0ygPflt7sqo1wPfMa1sne5f17T2OoRJJfpjTDhuZLF4OKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muVOtrWJHAhimxdf17HTn2GeBGBJOtG62mr95OC9wbo=;
 b=utSHia/4M5si6wh+VbE+bgNtV4ZJFhh/7RMoyW8kldCl8YJ9mZ+2QAU7UBv55Bga1DPMDukrjZG2dPRPRInuv/AOt1c6ZHkffX3h7vnzHUS9mY5kAwkxdIrxr6NOH2aHAePW4OT3hPMVvyc5QbTubOkeaUi+vuPfjCBNMKs2jE3purqJJVtZ5WvGkkYFE9huu/M1xL5Zh1z9XvxejHoQ0Zgz0rYCy8gXEW2XyBcGxSgNk4axi4f1JOWgP//7QKakU6d2D30FpS7Bu/8wSWjvZaBoJsjWerw+rrZa3A8kdCW/vd0N2R+kGe6suu/QGo8il3GzjqtOpUFFvs6ZFO47TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 08:40:57 +0000
Received: from SA1PR11MB8594.namprd11.prod.outlook.com
 ([fe80::72c7:2eb4:9341:3050]) by SA1PR11MB8594.namprd11.prod.outlook.com
 ([fe80::72c7:2eb4:9341:3050%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 08:40:57 +0000
Date: Tue, 24 Dec 2024 16:40:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, Yang Shi
	<yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, "Suren
 Baghdasaryan" <surenb@google.com>, Minchan Kim <minchan@kernel.org>, "Hans
 Boehm" <hboehm@google.com>, Lokesh Gidra <lokeshgidra@google.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  249608ee47:  stress-ng.mmap.ops_per_sec 13.1%
 regression
Message-ID: <202412241643.57d4b342-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8594:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: a33067ea-03d3-4e9a-d276-08dd23f6aec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oMtUDj5XIa7dA8r2Uu/xlxQtVsvdxIUdyjKhFmBhrd14EZxKGZx/GOxAW0?=
 =?iso-8859-1?Q?IKOjHytuxR4XBkgjvrNYf6GO/lCj0qJqqOOXieNtQCF9HISKLnLD4UTZY3?=
 =?iso-8859-1?Q?9lv+prEJh538QlxsrUQGwSJLoM4ix3ZREGyoqq+zPMHjt+wAbVz0riJq/Q?=
 =?iso-8859-1?Q?h5Qz9iDezO1KdwfiQajStLQ8efGfp5O+/J1NY7kUcqicNKRrQ+tiazI2vZ?=
 =?iso-8859-1?Q?Ylb31egDHEVU5JNU5OZa8QRcQD7kVyd1h+vCJlvhLCRzIlepQ6zPYvuWKD?=
 =?iso-8859-1?Q?7tNRhd4JOquKVgmj1mwB0/uEl9ejMCpkhwQJSwtg3KYjX+IX6AEfXXaRNY?=
 =?iso-8859-1?Q?2rVB8szykqCkhdsIy534ztW0vMdyQ0uwsrcsesUWHfsQskSxkPfTPmU3tb?=
 =?iso-8859-1?Q?NNPzTMCoXO5/PdXeUZNUYvs4aa1cFDj+d1QzHHwuqyk0bForUmJ7PTvQPl?=
 =?iso-8859-1?Q?d+O17pPRsSB9ozcOxsPlznWLMA6dApYv4lecogGpjAuzmi0kZ1dRPdVfI6?=
 =?iso-8859-1?Q?fHyRtZEbt0C7OLvDaSk3ykBDIcamQYP+VcOmxHMKA1/bt4SAmJfuWMoKpB?=
 =?iso-8859-1?Q?Xx40q1velqnZXgmFIlyo4XR0a9Zyb/xpuw1tiik2TzzJ07lPKpoPcqYJMi?=
 =?iso-8859-1?Q?htuRHVCla99E/TW5nHsHNCJX5MPc3OvSS5BSzAWB8voD8IXN0DZroSuomE?=
 =?iso-8859-1?Q?vneKOJ5zfLXLMHK+edegkjR3oLUhNzhAD28qOoXlTAzjUWx5y+S9twIt/S?=
 =?iso-8859-1?Q?ViteiK747TftLFXEYjhkzn84k6JREPNunY3glNPKTBRx/Xc8oIH4/vr9jt?=
 =?iso-8859-1?Q?WnZJzf+EgrQZtGg5d4sqzpWsZjckN9DijcavGzNeZ8ljAIpSzLk0vxLPi0?=
 =?iso-8859-1?Q?DPNvha6vFy/yXQG5tyZjokyjs+6EqGovglaPdY3XC2nfKzYxvOZ5DFlL8V?=
 =?iso-8859-1?Q?qgtIWtRiXfKVYhXQztuuwZLWCCbKihosUQi23TUuH3LCy9Jr3ppDQB+3qD?=
 =?iso-8859-1?Q?a0ei2pk5Wgxai8GKX4lmOblW1tjHvRd8j+k6wdZnTg8Jh24Hqk6DuhhkxM?=
 =?iso-8859-1?Q?ACGZoo2V9nDbM/hC+oMpreynxS8suskBPIS2n3VDg4ldiwtjGxc6DVaHns?=
 =?iso-8859-1?Q?9ALHXamOh+VQXiODg7Fp9hVIki3fyhldkbHeAYKJwSAE44zKdNTYC/XzQc?=
 =?iso-8859-1?Q?tPr7CCd0ygIiJ5OA+wCXkxkAnCfxjZfgpLt4iUZo6ttbaR390nuhiVtNsY?=
 =?iso-8859-1?Q?Q1WsNvg/S/g6/3gDPfKez5eTPDg0QByzPkRWkwsXaFOz5nSzMCN4ywIIQo?=
 =?iso-8859-1?Q?Smd6FGzO6tJEZV7MSub2LaICbL7/pn5p+CnnfRzCWHcMq2/hYeanDzC7Fk?=
 =?iso-8859-1?Q?2fNpHp+HBzW8iJn3dRliObjdA4kzcNYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1RUjvN+EGWw8+eL8lJCMuEoeEggO68Rl6GxI/BGXCbOTaVB8jPb9lAloWG?=
 =?iso-8859-1?Q?TXI6zAmLDRpz+dpwMqcwP2LJ9uLNYULMf5XbDqMB6q1yqikNPg/fE06E9C?=
 =?iso-8859-1?Q?KyMOgv/VIyg/VbpLKDDwkebKL3FLJJ+Sgbz7wGzcS0SKM+lW6Bmdrfb2Kn?=
 =?iso-8859-1?Q?rzRhJ7JDTjH64yPPQS9mzb3z1dHefOvb+PU/RXmuBjVath+6NfPxkxdo2P?=
 =?iso-8859-1?Q?E1BY+aPLzcVOpG6qxTCmNDMyx48JqZ4mMm+IX++CkrmP1bYqfOkRVj7Njg?=
 =?iso-8859-1?Q?cn5o6m5RLfrbXIyCu/n0nO/PO/9hP+EkcHpqhiXQDMO88EnClXnGeUh0Td?=
 =?iso-8859-1?Q?N1UrMCfdkDKdm732vlwHLtm7h4qyqsn27OFgY3UOqnknxR2zV/96fFEi9i?=
 =?iso-8859-1?Q?eneaJCDdwRLImI5Neb3bxFXK1PI0H5W+MSRvM1eJugGZbsummbwtu4ZEsD?=
 =?iso-8859-1?Q?ha/YQfg+V5g510CCidwVDUj0XUsj2Yg9gu+dcpizw8obJKGW3Z9Bfmq/ZU?=
 =?iso-8859-1?Q?x7Odkfi0t27UrXM8NbqYp6nbiK4BZHQAJez6U/OK07lYx+Y0C8J9IEnenL?=
 =?iso-8859-1?Q?Chouc2wtYy38AFZ9jzMsVmQ3dVzUX5SrHg95OsJLXX2cqUOB295zVKE/+0?=
 =?iso-8859-1?Q?xNzwAF/OvJhNruxo16YeVn2Vt6zFpM7ZRNou+R4FSTlK48Vu82VxzVsVRD?=
 =?iso-8859-1?Q?imy3mJSDz6wIzLERcsAJW6rXrtC1c8dm4q4HELCKWWuXdmDFY0kfx/iIFw?=
 =?iso-8859-1?Q?lxe959RMfFO36barnTXkn+bMjZ2Jww7G1H6CVJJkUoTKs5McgW7EXyXx0R?=
 =?iso-8859-1?Q?ynhq/7DftGsVTfZLDcL88Srlo07My62mgQhCvIcpkfvo2F6jR6W8JwCZtt?=
 =?iso-8859-1?Q?6UiXgzWEO2tqRHPcxVrPdujCZQU5SGWxiNW1dSyuJTBF8uJdJdVgw5E/Ys?=
 =?iso-8859-1?Q?IE3X1G2JmcOxdYmAMYbcbe6vAi3co5ccadXfWSL9UYMYdJnmoObzkfpqwO?=
 =?iso-8859-1?Q?HKKGbGBOewFV8/bExlbfV/l3y9cMtioWiJYyngTAF+hNgGYVBiVwSub76m?=
 =?iso-8859-1?Q?32Un0dicM+a3sB4IK3CzXmaEfxeNtbW9tgwAArquPvuIM97/VszLFcsuoF?=
 =?iso-8859-1?Q?R6sE1z0AGugl69IMmTLZdfQ66ppKSFilQwIKVsQflTGeEJHh6iZd/Zb+50?=
 =?iso-8859-1?Q?4sU/HnjFTq7YmzLPo8IglQvJUB76xrYXEHMB69WV7Suq1iGaM5nacx/8l2?=
 =?iso-8859-1?Q?px33kEoSz/VSZ+fjUMAeQbwoRezsJdldX2P3j4Bt8pdBacmaLFzlx89iUe?=
 =?iso-8859-1?Q?uyMSkppqXLN6qexrRZdZ3LXkWSCzJ6Yf/MU1vLbItUJ60LKK2Gd2rGtcbs?=
 =?iso-8859-1?Q?b1D+jet61meFd1627QpGMa4hJ7qwqsHLjbEV6tCFBDg5V9jI+5NNQ2D54v?=
 =?iso-8859-1?Q?ml9CuyBb1y9CPzvNZxzBUObMFY6Q9Jrhng9I00zc/zihVbodSrg7R5S/FF?=
 =?iso-8859-1?Q?1C/aNq7khrLx1jMPUEvDXWzDb7qEfiHPBjfRvL0GU0wXyEUB3mHR/xWyCJ?=
 =?iso-8859-1?Q?FwQ8YDuwV5GNyP3CVl6jfSEIG/4K8jLvftRvtkDW02KsvSJfzwfYjRmbSR?=
 =?iso-8859-1?Q?lZP2Mu1kXHgwzVO2LOx+qXFPzAq5THYb4AVz1L4yuGgdU2NMnlFdIqOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a33067ea-03d3-4e9a-d276-08dd23f6aec5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 08:40:57.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKKfRvQvk19uwiv+e2lO2vBIZvIOuIDdxAX9f/AVLxyFcDXnzKiP+o2MVXrvlXMfCq8PEOSmN/IuscB4q/EL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
X-OriginatorOrg: intel.com



Hello,

we reported
"[linus:master] [mm]  249608ee47:  will-it-scale.per_thread_ops 50.1% improvement"
in
https://lore.kernel.org/all/202412122346.ea54d461-lkp@intel.com/

now we noticed a regression from stress-ng.mmap tests. just FYI.


kernel test robot noticed a 13.1% regression of stress-ng.mmap.ops_per_sec on:


commit: 249608ee47132cab3b1adacd9e463548f57bd316 ("mm: respect mmap hint address when aligning for THP")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      f932fb9b40749d1c9a539d89bb3e288c077aafe5]
[test failed on linux-next/master 4176cf5c5651c33769de83bb61b0287f4ec7719f]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mmap
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 51.6% improvement |
| test machine     | 104 threads 2 sockets (Skylake) with 192G memory              |
| test parameters  | cpufreq_governor=performance                                  |
|                  | mode=thread                                                   |
|                  | nr_task=100%                                                  |
|                  | test=brk2                                                     |
+------------------+---------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 50.1% improvement |
| test machine     | 104 threads 2 sockets (Skylake) with 192G memory              |
| test parameters  | cpufreq_governor=performance                                  |
|                  | mode=thread                                                   |
|                  | nr_task=100%                                                  |
|                  | test=brk1                                                     |
+------------------+---------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412241643.57d4b342-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241224/202412241643.57d4b342-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/mmap/stress-ng/60s

commit: 
  89dd878282 ("mm: memcg: declare do_memsw_account inline")
  249608ee47 ("mm: respect mmap hint address when aligning for THP")

89dd878282881306 249608ee47132cab3b1adacd9e4 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      2875 ± 10%    +306.7%      11691 ± 30%  meminfo.Mlocked
      4187            -4.6%       3996        vmstat.system.cs
      0.36 ±  4%      -0.0        0.32 ±  4%  mpstat.cpu.all.irq%
     11.47            -1.5        9.98        mpstat.cpu.all.soft%
      1477 ± 12%    +303.6%       5961 ± 29%  numa-meminfo.node0.Mlocked
      1532 ± 16%    +273.3%       5722 ± 28%  numa-meminfo.node1.Mlocked
    356.07 ± 14%    +291.1%       1392 ± 29%  numa-vmstat.node0.nr_mlock
    375.78 ± 15%    +304.8%       1521 ± 24%  numa-vmstat.node1.nr_mlock
   8538445 ±  5%      -8.4%    7819829 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.avg
   8538448 ±  5%      -8.4%    7819830 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
    125824           -13.1%     109373        stress-ng.mmap.ops
      2096           -13.1%       1822        stress-ng.mmap.ops_per_sec
    100307            -3.7%      96634        stress-ng.time.involuntary_context_switches
 1.412e+08            +4.7%  1.478e+08        stress-ng.time.minor_page_faults
      5404            +1.9%       5508        stress-ng.time.percent_of_cpu_this_job_got
      3178            +2.2%       3248        stress-ng.time.system_time
     71.10           -10.4%      63.67        stress-ng.time.user_time
      3130 ±  4%     +14.8%       3594 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
    177.30 ±  9%     -21.3%     139.60 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.__split_vma.vms_gather_munmap_vmas
    120.50 ± 10%     -34.8%      78.60 ± 50%  perf-sched.wait_and_delay.count.__cond_resched.down_write.vma_expand.vma_merge_new_range.__mmap_region
    603.00 ±  6%     -35.9%     386.50 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault
    190.30 ±  6%     -20.7%     150.90 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
    869.80 ±  7%     -18.1%     712.20 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    347.50 ±  6%     -20.0%     277.90 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    217.40 ± 78%     -33.1%     145.50 ±  5%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    704.39 ± 15%    +305.6%       2856 ± 27%  proc-vmstat.nr_mlock
 3.029e+08           -12.8%  2.643e+08        proc-vmstat.pgalloc_normal
 1.417e+08            +4.7%  1.483e+08        proc-vmstat.pgfault
 3.025e+08           -12.8%  2.638e+08        proc-vmstat.pgfree
    228212           -34.6%     149297        proc-vmstat.thp_deferred_split_page
    228277           -34.6%     149362        proc-vmstat.thp_fault_alloc
    228276           -34.6%     149361        proc-vmstat.thp_split_pmd
  12441114           -14.2%   10672430        proc-vmstat.unevictable_pgs_culled
  12441103           -14.2%   10672446        proc-vmstat.unevictable_pgs_mlocked
  12441101           -14.2%   10672045        proc-vmstat.unevictable_pgs_munlocked
  12441100           -14.2%   10672016        proc-vmstat.unevictable_pgs_rescued
      5.22            -6.2%       4.90        perf-stat.i.MPKI
 1.477e+10            -7.4%  1.367e+10        perf-stat.i.branch-instructions
 1.137e+08 ±  3%     -10.0%  1.023e+08        perf-stat.i.branch-misses
     79.12            -1.7       77.44        perf-stat.i.cache-miss-rate%
 3.868e+08           -13.5%  3.346e+08        perf-stat.i.cache-misses
 4.885e+08           -11.6%  4.316e+08        perf-stat.i.cache-references
      4083            -5.1%       3876        perf-stat.i.context-switches
      2.63            +8.5%       2.85        perf-stat.i.cpi
    503.35           +15.6%     582.12        perf-stat.i.cycles-between-cache-misses
 7.402e+10            -7.8%  6.823e+10        perf-stat.i.instructions
      0.38            -7.8%       0.35        perf-stat.i.ipc
     72.64            +2.7%      74.59        perf-stat.i.metric.K/sec
   2325817            +2.6%    2387093        perf-stat.i.minor-faults
   2325817            +2.6%    2387093        perf-stat.i.page-faults
      5.22            -6.2%       4.90        perf-stat.overall.MPKI
     79.16            -1.7       77.50        perf-stat.overall.cache-miss-rate%
      2.63            +8.4%       2.86        perf-stat.overall.cpi
    504.25           +15.6%     582.68        perf-stat.overall.cycles-between-cache-misses
      0.38            -7.8%       0.35        perf-stat.overall.ipc
 1.452e+10            -7.4%  1.344e+10        perf-stat.ps.branch-instructions
  1.12e+08 ±  3%      -9.9%   1.01e+08        perf-stat.ps.branch-misses
 3.802e+08           -13.5%   3.29e+08        perf-stat.ps.cache-misses
 4.803e+08           -11.6%  4.245e+08        perf-stat.ps.cache-references
      4017            -5.0%       3817        perf-stat.ps.context-switches
 7.278e+10            -7.8%  6.711e+10        perf-stat.ps.instructions
   2286433            +2.7%    2347115        perf-stat.ps.minor-faults
   2286433            +2.7%    2347115        perf-stat.ps.page-faults
 4.455e+12            -7.7%  4.111e+12        perf-stat.total.instructions
     17.85            -2.1       15.72        perf-profile.calltrace.cycles-pp.stress_mmap_set_light
     16.59            -2.1       14.48        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_mmap_set_light
     16.56            -2.1       14.45        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_mmap_set_light
     15.84            -2.1       13.76        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_mmap_set_light
     15.59            -2.1       13.52        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      5.18            -2.0        3.19        perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     17.19            -2.0       15.21        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_mmap_set_light
      5.08            -2.0        3.11        perf-profile.calltrace.cycles-pp.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      4.88            -1.9        2.98        perf-profile.calltrace.cycles-pp.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
     10.48            -1.8        8.70        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      4.60            -1.8        2.82        perf-profile.calltrace.cycles-pp.clear_page_erms.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault
      9.96            -1.6        8.40        perf-profile.calltrace.cycles-pp.__mmap
      8.90            -1.5        7.36        perf-profile.calltrace.cycles-pp.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      8.78            -1.4        7.39        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
      8.76            -1.4        7.37        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      7.90            -1.4        6.53        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      8.58            -1.4        7.22        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      7.42            -1.3        6.12        perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.90            -1.0        5.91 ±  4%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.88            -1.0        5.89 ±  4%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.88            -1.0        5.89 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      6.92            -1.0        5.94 ±  4%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      6.88            -1.0        5.89 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      6.92            -1.0        5.94 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      6.92            -1.0        5.94 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      6.86            -1.0        5.87 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      5.09            -0.7        4.35 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      4.27            -0.7        3.54        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      3.10            -0.6        2.54        perf-profile.calltrace.cycles-pp.vma_merge_new_range.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      2.85            -0.5        2.35        perf-profile.calltrace.cycles-pp.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.70            -0.5        2.22        perf-profile.calltrace.cycles-pp.vma_expand.vma_merge_new_range.__mmap_region.do_mmap.vm_mmap_pgoff
      3.27            -0.4        2.84 ±  3%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      2.47            -0.4        2.04        perf-profile.calltrace.cycles-pp.commit_merge.vma_expand.vma_merge_new_range.__mmap_region.do_mmap
      2.42            -0.4        1.99        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      2.41            -0.4        2.00 ±  2%  perf-profile.calltrace.cycles-pp.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.35            -0.4        1.95        perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      2.28            -0.4        1.88        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      2.22            -0.4        1.83 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.62 ±  2%      -0.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas
      1.72 ±  2%      -0.3        1.42 ±  2%  perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas
      1.72            -0.3        1.44        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.58 ±  2%      -0.3        0.31 ± 81%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.vm_area_free_rcu_cb.rcu_do_batch.rcu_core
      1.68            -0.2        1.43        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.__mmap
      1.38 ±  2%      -0.2        1.15 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      1.45            -0.2        1.22        perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      1.40            -0.2        1.17        perf-profile.calltrace.cycles-pp.mas_store_prealloc.commit_merge.vma_expand.vma_merge_new_range.__mmap_region
      1.43 ±  2%      -0.2        1.22 ±  4%  perf-profile.calltrace.cycles-pp.anon_vma_clone.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1.07            -0.2        0.86        perf-profile.calltrace.cycles-pp.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      3.80            -0.2        3.59        perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      3.73            -0.2        3.53        perf-profile.calltrace.cycles-pp.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      3.72            -0.2        3.52        perf-profile.calltrace.cycles-pp.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page
      1.23            -0.2        1.03        perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      3.65            -0.2        3.45        perf-profile.calltrace.cycles-pp.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio
      1.22            -0.2        1.03        perf-profile.calltrace.cycles-pp.mas_store_prealloc.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
      3.53            -0.2        3.34        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.94 ±  2%      -0.2        0.77        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.90            -0.2        0.74        perf-profile.calltrace.cycles-pp.__mmap_prepare.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.87            -0.2        0.71        perf-profile.calltrace.cycles-pp.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.82            -0.2        0.67        perf-profile.calltrace.cycles-pp.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.08            -0.1        0.93 ±  2%  perf-profile.calltrace.cycles-pp.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      0.70            -0.1        0.56 ±  2%  perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.62 ±  2%      -0.1        0.49 ± 33%  perf-profile.calltrace.cycles-pp.rcu_cblist_dequeue.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      0.71 ±  2%      -0.1        0.58 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap
      0.84            -0.1        0.71        perf-profile.calltrace.cycles-pp.mas_wr_bnode.mas_store_prealloc.__mmap_new_vma.__mmap_region.do_mmap
      0.90 ±  4%      -0.1        0.77 ±  5%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.anon_vma_clone.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.78            -0.1        0.65        perf-profile.calltrace.cycles-pp.mas_split.mas_wr_bnode.mas_store_prealloc.__mmap_new_vma.__mmap_region
      0.88            -0.1        0.76 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs
      0.75            -0.1        0.63        perf-profile.calltrace.cycles-pp.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.73            -0.1        0.62        perf-profile.calltrace.cycles-pp.mas_wr_spanning_store.mas_store_prealloc.commit_merge.vma_expand.vma_merge_new_range
      0.77            -0.1        0.66        perf-profile.calltrace.cycles-pp.flush_tlb_func.flush_tlb_mm_range.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas
      0.67            -0.1        0.56        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff
      0.80 ±  2%      -0.1        0.70 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core
      0.65 ±  2%      -0.1        0.54 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas
      0.68            -0.1        0.58        perf-profile.calltrace.cycles-pp.native_flush_tlb_one_user.flush_tlb_func.flush_tlb_mm_range.tlb_finish_mmu.vms_clear_ptes
      2.55            -0.1        2.45        perf-profile.calltrace.cycles-pp.clear_page_erms.get_page_from_freelist.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof
      0.64            -0.1        0.54        perf-profile.calltrace.cycles-pp.mas_spanning_rebalance.mas_wr_spanning_store.mas_store_prealloc.commit_merge.vma_expand
      0.69 ±  3%      -0.1        0.60 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch
      0.73 ±  2%      -0.1        0.65 ±  3%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof
      0.64 ±  2%      -0.1        0.56 ±  3%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_noprof.alloc_pages_mpol_noprof
      1.32 ±  4%      +0.1        1.44 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      1.63 ±  4%      +0.1        1.76 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      1.65 ±  4%      +0.1        1.77 ±  4%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache
      1.64 ±  4%      +0.1        1.77 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.64 ±  4%      +0.1        1.77 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs
      1.72 ±  4%      +0.1        1.86 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      1.73 ±  4%      +0.1        1.87 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
      0.96 ±  3%      +0.3        1.25        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault
      0.93 ±  3%      +0.3        1.22        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move
      0.95 ±  3%      +0.3        1.25        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page
      1.50            +0.3        1.80        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.55            +0.3        1.86        perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.82 ±  5%      +0.4        2.19 ±  3%  perf-profile.calltrace.cycles-pp.__munlock_folio.mlock_folio_batch.munlock_folio.zap_present_ptes.zap_pte_range
      1.78 ±  5%      +0.4        2.15 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.folio_lruvec_lock_irq.__munlock_folio.mlock_folio_batch.munlock_folio
      1.79 ±  5%      +0.4        2.16 ±  4%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irq.__munlock_folio.mlock_folio_batch.munlock_folio.zap_present_ptes
      1.93 ±  5%      +0.4        2.30 ±  4%  perf-profile.calltrace.cycles-pp.munlock_folio.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
      1.91 ±  5%      +0.4        2.28 ±  4%  perf-profile.calltrace.cycles-pp.mlock_folio_batch.munlock_folio.zap_present_ptes.zap_pte_range.zap_pmd_range
      1.73 ±  5%      +0.4        2.11 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_lruvec_lock_irq.__munlock_folio.mlock_folio_batch
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.populate_vma_page_range.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     64.14            +4.7       68.84        perf-profile.calltrace.cycles-pp.__munmap
     63.37            +4.8       68.18        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     63.33            +4.8       68.14        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     62.96            +4.9       67.82        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     62.93            +4.9       67.81        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     62.63            +4.9       67.55        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     62.24            +5.0       67.21        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     31.45 ±  2%      +7.4       38.84        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
     32.36 ±  2%      +7.4       39.77        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
     32.32 ±  2%      +7.4       39.73        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache
     33.49 ±  2%      +7.4       40.92        perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
     47.19            +7.5       54.71        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     46.32            +7.7       53.97        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     38.42            +7.7       46.15        perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes
     40.48            +7.9       48.40        perf-profile.calltrace.cycles-pp.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     38.90            +8.2       47.07        perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
     38.74            +8.2       46.94        perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas
     18.73            -2.1       16.61        perf-profile.children.cycles-pp.stress_mmap_set_light
     16.65            -2.1       14.52        perf-profile.children.cycles-pp.exc_page_fault
     16.62            -2.1       14.50        perf-profile.children.cycles-pp.do_user_addr_fault
     18.10            -2.1       15.99        perf-profile.children.cycles-pp.asm_exc_page_fault
      5.64            -2.1        3.56        perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
      5.53            -2.1        3.48        perf-profile.children.cycles-pp.vma_alloc_anon_folio_pmd
     16.35            -2.0       14.30        perf-profile.children.cycles-pp.handle_mm_fault
     16.10            -2.0       14.06        perf-profile.children.cycles-pp.__handle_mm_fault
      5.34            -2.0        3.35        perf-profile.children.cycles-pp.folio_zero_user
      7.67            -1.9        5.72        perf-profile.children.cycles-pp.clear_page_erms
     10.52            -1.8        8.74        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
     12.77            -1.7       11.08        perf-profile.children.cycles-pp.rcu_core
     12.78            -1.7       11.10        perf-profile.children.cycles-pp.handle_softirqs
     12.76            -1.7       11.08        perf-profile.children.cycles-pp.rcu_do_batch
     12.35            -1.6       10.71        perf-profile.children.cycles-pp.kmem_cache_free
     10.03            -1.6        8.45        perf-profile.children.cycles-pp.__mmap
      8.94            -1.5        7.39        perf-profile.children.cycles-pp.__split_vma
      7.92            -1.4        6.55        perf-profile.children.cycles-pp.do_mmap
      8.60            -1.4        7.24        perf-profile.children.cycles-pp.vm_mmap_pgoff
      7.44            -1.3        6.15        perf-profile.children.cycles-pp.__mmap_region
      5.71            -1.0        4.69        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      6.90            -1.0        5.91 ±  4%  perf-profile.children.cycles-pp.smpboot_thread_fn
      6.88            -1.0        5.89 ±  4%  perf-profile.children.cycles-pp.run_ksoftirqd
      6.92            -1.0        5.94 ±  4%  perf-profile.children.cycles-pp.kthread
      6.92            -1.0        5.94 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
      6.92            -1.0        5.94 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
      6.07            -0.8        5.23        perf-profile.children.cycles-pp.__slab_free
      4.87            -0.8        4.03        perf-profile.children.cycles-pp.mas_wr_node_store
      4.86            -0.8        4.05        perf-profile.children.cycles-pp.mas_store_prealloc
      4.58            -0.8        3.81        perf-profile.children.cycles-pp.mas_store_gfp
      6.28            -0.7        5.54 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      6.23            -0.7        5.50 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.91            -0.7        5.21 ±  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
      3.12            -0.6        2.55        perf-profile.children.cycles-pp.vma_merge_new_range
      2.86            -0.5        2.36        perf-profile.children.cycles-pp.vm_area_dup
      2.36            -0.5        1.87 ±  2%  perf-profile.children.cycles-pp.___slab_alloc
      2.71            -0.5        2.23        perf-profile.children.cycles-pp.vma_expand
      2.36            -0.5        1.91        perf-profile.children.cycles-pp.mas_alloc_nodes
      2.48            -0.4        2.04        perf-profile.children.cycles-pp.commit_merge
      2.49            -0.4        2.06 ±  2%  perf-profile.children.cycles-pp.vma_complete
      2.63 ±  2%      -0.4        2.21 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      2.36            -0.4        1.96        perf-profile.children.cycles-pp.__mmap_new_vma
      2.00 ±  2%      -0.4        1.62        perf-profile.children.cycles-pp.mas_preallocate
      3.62 ±  2%      -0.4        3.24 ±  2%  perf-profile.children.cycles-pp.free_unref_page_commit
      3.54 ±  2%      -0.4        3.17 ±  2%  perf-profile.children.cycles-pp.free_unref_page
      3.50 ±  2%      -0.4        3.13 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
      2.81 ±  2%      -0.3        2.47 ±  3%  perf-profile.children.cycles-pp.__put_partials
      4.36            -0.3        4.07        perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
      1.75            -0.3        1.46        perf-profile.children.cycles-pp.free_pgtables
      4.27            -0.3        3.98        perf-profile.children.cycles-pp.__alloc_pages_noprof
      4.12            -0.3        3.84        perf-profile.children.cycles-pp.get_page_from_freelist
      1.84            -0.3        1.58        perf-profile.children.cycles-pp.vm_area_free_rcu_cb
      1.37            -0.3        1.11 ±  2%  perf-profile.children.cycles-pp.allocate_slab
      1.47            -0.2        1.23        perf-profile.children.cycles-pp.unlink_anon_vmas
      1.45            -0.2        1.22        perf-profile.children.cycles-pp.mas_find
      3.93            -0.2        3.71        perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      3.99            -0.2        3.77        perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      1.45 ±  2%      -0.2        1.23 ±  4%  perf-profile.children.cycles-pp.anon_vma_clone
      1.35            -0.2        1.14        perf-profile.children.cycles-pp.__call_rcu_common
      1.32 ±  2%      -0.2        1.10        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      1.25            -0.2        1.05        perf-profile.children.cycles-pp.flush_tlb_mm_range
      1.25            -0.2        1.06        perf-profile.children.cycles-pp.mas_wr_bnode
      0.82            -0.2        0.64 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      1.08 ±  2%      -0.2        0.89 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      1.14            -0.2        0.96 ±  2%  perf-profile.children.cycles-pp.down_write
      0.94            -0.2        0.76 ±  2%  perf-profile.children.cycles-pp.shuffle_freelist
      1.13            -0.2        0.96        perf-profile.children.cycles-pp.mas_spanning_rebalance
      0.91            -0.2        0.75        perf-profile.children.cycles-pp.__mmap_prepare
      0.88            -0.2        0.72 ±  2%  perf-profile.children.cycles-pp.__vmf_anon_prepare
      0.83            -0.2        0.67 ±  2%  perf-profile.children.cycles-pp.__anon_vma_prepare
      1.10 ±  3%      -0.2        0.95 ±  3%  perf-profile.children.cycles-pp.rmqueue
      0.99 ±  3%      -0.2        0.84 ±  3%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      1.03            -0.2        0.88        perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.96            -0.1        0.81        perf-profile.children.cycles-pp.mas_wr_spanning_store
      1.10            -0.1        0.96        perf-profile.children.cycles-pp.mas_walk
      0.72 ±  2%      -0.1        0.58 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk_noprof
      0.69 ±  2%      -0.1        0.56        perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.84            -0.1        0.70        perf-profile.children.cycles-pp.mas_split
      0.71 ±  4%      -0.1        0.58 ±  4%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.76            -0.1        0.63        perf-profile.children.cycles-pp.perf_event_mmap
      0.87 ±  4%      -0.1        0.75 ±  5%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.79            -0.1        0.67        perf-profile.children.cycles-pp.flush_tlb_func
      0.61 ±  2%      -0.1        0.49        perf-profile.children.cycles-pp.vma_prepare
      0.69            -0.1        0.58        perf-profile.children.cycles-pp.perf_event_mmap_event
      0.68            -0.1        0.58        perf-profile.children.cycles-pp.native_flush_tlb_one_user
      0.56            -0.1        0.46        perf-profile.children.cycles-pp.mas_wr_store_type
      0.56            -0.1        0.46        perf-profile.children.cycles-pp.vm_area_alloc
      0.43 ±  3%      -0.1        0.33 ±  2%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.58 ±  2%      -0.1        0.49 ±  2%  perf-profile.children.cycles-pp.mas_pop_node
      0.58            -0.1        0.49 ±  2%  perf-profile.children.cycles-pp.mas_prev_slot
      0.25 ±  4%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.get_partial_node
      0.47            -0.1        0.38        perf-profile.children.cycles-pp.mas_update_gap
      0.57 ±  2%      -0.1        0.48 ±  3%  perf-profile.children.cycles-pp.up_write
      0.47 ±  2%      -0.1        0.39        perf-profile.children.cycles-pp.perf_iterate_sb
      0.46            -0.1        0.38 ±  2%  perf-profile.children.cycles-pp.mas_push_data
      0.49            -0.1        0.42 ±  2%  perf-profile.children.cycles-pp.mas_next_slot
      0.48 ±  5%      -0.1        0.40 ±  3%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.46 ±  4%      -0.1        0.38 ±  3%  perf-profile.children.cycles-pp.__memcpy
      0.50            -0.1        0.43        perf-profile.children.cycles-pp.clear_bhb_loop
      0.47            -0.1        0.39 ±  2%  perf-profile.children.cycles-pp.mab_mas_cp
      0.45 ±  2%      -0.1        0.38 ±  2%  perf-profile.children.cycles-pp.mas_topiary_replace
      0.36 ±  2%      -0.1        0.29        perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.34 ±  2%      -0.1        0.28        perf-profile.children.cycles-pp.__put_anon_vma
      0.29 ±  2%      -0.1        0.23 ±  3%  perf-profile.children.cycles-pp.setup_object
      0.30 ±  2%      -0.1        0.24 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.19            -0.1        0.13 ±  3%  perf-profile.children.cycles-pp.vma_adjust_trans_huge
      0.33 ±  2%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.mas_rebalance
      0.33 ±  2%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.28            -0.0        0.23 ±  3%  perf-profile.children.cycles-pp.mas_destroy
      0.14 ±  3%      -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.__split_huge_pmd
      0.14 ±  2%      -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.__split_huge_pmd_locked
      0.12 ±  3%      -0.0        0.08 ±  3%  perf-profile.children.cycles-pp.folio_add_anon_rmap_ptes
      0.33 ±  5%      -0.0        0.28 ±  6%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.23 ±  3%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.32 ±  4%      -0.0        0.28 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.28 ±  2%      -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.26 ±  4%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.call_rcu
      0.26 ±  2%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.30 ±  2%      -0.0        0.26        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.38 ±  2%      -0.0        0.34 ±  2%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.21 ±  3%      -0.0        0.17 ±  3%  perf-profile.children.cycles-pp.mas_put_in_tree
      0.25 ±  4%      -0.0        0.21 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.24 ±  2%      -0.0        0.21 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.31 ±  2%      -0.0        0.27 ±  2%  perf-profile.children.cycles-pp.__free_one_page
      0.20 ±  2%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.mt_find
      0.22 ±  2%      -0.0        0.18 ±  4%  perf-profile.children.cycles-pp.find_mergeable_anon_vma
      0.14 ±  3%      -0.0        0.10 ±  2%  perf-profile.children.cycles-pp.prep_compound_page
      0.24            -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.18 ±  3%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.stress_mmap_child
      0.24 ±  4%      -0.0        0.20 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.15 ±  3%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.can_vma_merge_right
      0.22 ±  3%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.mas_mab_cp
      0.20 ±  2%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.stress_mmap_slow_munmap
      0.10 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.get_any_partial
      0.22            -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.mas_prev_node
      0.23 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.mas_ascend
      0.16 ±  3%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.mas_prev
      0.18 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.18 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.18 ±  3%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp._find_next_bit
      0.17 ±  4%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.down_write_killable
      0.11 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.can_vma_merge_after
      0.16 ±  2%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.__get_unmapped_area
      0.11 ±  2%      -0.0        0.09 ±  6%  perf-profile.children.cycles-pp.kmem_cache_free_bulk
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.mas_next_node
      0.13 ±  3%      -0.0        0.11 ±  2%  perf-profile.children.cycles-pp.mas_split_final_node
      0.14 ±  4%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.11 ±  2%      -0.0        0.09 ±  3%  perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      0.13 ±  2%      -0.0        0.11 ±  2%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.12 ±  4%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.mast_fill_bnode
      0.12 ±  4%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.40            -0.0        0.38        perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.10 ±  3%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.perf_output_begin
      0.11 ±  4%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.tlb_gather_mmu
      0.08 ±  3%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.mas_prev_setup
      0.13 ±  2%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.sched_tick
      0.11 ±  2%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.downgrade_write
      0.16 ±  3%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.12 ±  4%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.init_multi_vma_prep
      0.19            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.__perf_sw_event
      0.32 ±  2%      -0.0        0.30        perf-profile.children.cycles-pp.lru_add_drain
      0.09 ±  4%      -0.0        0.08 ±  3%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.07            -0.0        0.06 ±  5%  perf-profile.children.cycles-pp.kfree
      0.07            -0.0        0.06        perf-profile.children.cycles-pp.discard_slab
      0.46 ±  3%      +0.0        0.51        perf-profile.children.cycles-pp.__get_user_pages
      0.46 ±  3%      +0.0        0.51        perf-profile.children.cycles-pp.populate_vma_page_range
      0.46 ±  3%      +0.0        0.51        perf-profile.children.cycles-pp.__mm_populate
      1.61            +0.3        1.91        perf-profile.children.cycles-pp.__folio_batch_add_and_move
      1.64 ±  2%      +0.3        1.96        perf-profile.children.cycles-pp.folio_batch_move_lru
      1.93 ±  5%      +0.4        2.31 ±  3%  perf-profile.children.cycles-pp.munlock_folio
      0.00            +0.5        0.54 ±  4%  perf-profile.children.cycles-pp.mlock_drain_local
      1.81 ±  5%      +0.8        2.66 ±  3%  perf-profile.children.cycles-pp.folio_lruvec_lock_irq
      1.80 ±  5%      +0.9        2.66 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.82 ±  5%      +0.9        2.68 ±  3%  perf-profile.children.cycles-pp.__munlock_folio
      1.92 ±  5%      +0.9        2.82 ±  3%  perf-profile.children.cycles-pp.mlock_folio_batch
     72.44            +3.4       75.83        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     72.28            +3.4       75.69        perf-profile.children.cycles-pp.do_syscall_64
     64.28            +4.7       68.96        perf-profile.children.cycles-pp.__munmap
     62.96            +4.9       67.83        perf-profile.children.cycles-pp.__x64_sys_munmap
     62.95            +4.9       67.82        perf-profile.children.cycles-pp.__vm_munmap
     62.65            +4.9       67.56        perf-profile.children.cycles-pp.do_vmi_munmap
     62.25            +5.0       67.22        perf-profile.children.cycles-pp.do_vmi_align_munmap
     38.34 ±  2%      +7.1       45.41        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     33.52 ±  2%      +7.4       40.96        perf-profile.children.cycles-pp.__page_cache_release
     47.24            +7.5       54.75        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     46.34            +7.7       54.00        perf-profile.children.cycles-pp.vms_clear_ptes
     33.47 ±  2%      +7.7       41.19        perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     38.56            +7.7       46.30        perf-profile.children.cycles-pp.folios_put_refs
     40.50            +7.9       48.41        perf-profile.children.cycles-pp.tlb_finish_mmu
     38.93 ±  2%      +7.9       46.87        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     38.92            +8.2       47.09        perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
     38.76            +8.2       46.96        perf-profile.children.cycles-pp.free_pages_and_swap_cache
      7.11            -1.8        5.32        perf-profile.self.cycles-pp.clear_page_erms
      5.03            -0.7        4.34        perf-profile.self.cycles-pp.__slab_free
      2.38 ±  2%      -0.4        1.98 ±  2%  perf-profile.self.cycles-pp.mas_wr_node_store
      1.33 ±  4%      -0.2        1.13 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.98            -0.2        0.82 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.99            -0.2        0.83        perf-profile.self.cycles-pp.__call_rcu_common
      1.02            -0.2        0.87        perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.91 ±  2%      -0.1        0.76 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      0.81            -0.1        0.66 ±  2%  perf-profile.self.cycles-pp.shuffle_freelist
      0.88            -0.1        0.74 ±  2%  perf-profile.self.cycles-pp.down_write
      1.01            -0.1        0.88        perf-profile.self.cycles-pp.mas_walk
      0.84            -0.1        0.72        perf-profile.self.cycles-pp.kmem_cache_free
      0.73 ±  2%      -0.1        0.61        perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.48            -0.1        0.36        perf-profile.self.cycles-pp.__cond_resched
      0.62 ±  2%      -0.1        0.51        perf-profile.self.cycles-pp.___slab_alloc
      0.67            -0.1        0.58        perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.49            -0.1        0.40        perf-profile.self.cycles-pp.mas_wr_store_type
      0.52 ±  2%      -0.1        0.45 ±  3%  perf-profile.self.cycles-pp.mas_pop_node
      0.49 ±  2%      -0.1        0.42 ±  2%  perf-profile.self.cycles-pp.up_write
      0.49            -0.1        0.42        perf-profile.self.cycles-pp.clear_bhb_loop
      0.37 ±  2%      -0.1        0.30        perf-profile.self.cycles-pp.zap_present_ptes
      0.41 ±  4%      -0.1        0.34 ±  3%  perf-profile.self.cycles-pp.__memcpy
      0.35            -0.1        0.30        perf-profile.self.cycles-pp.mab_mas_cp
      0.36            -0.1        0.30        perf-profile.self.cycles-pp.mas_store_gfp
      0.37 ±  3%      -0.1        0.32 ±  4%  perf-profile.self.cycles-pp.vm_area_dup
      0.43 ±  5%      -0.1        0.37 ±  5%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.32 ±  2%      -0.1        0.26        perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.33            -0.1        0.28        perf-profile.self.cycles-pp.mas_prev_slot
      0.30            -0.0        0.25        perf-profile.self.cycles-pp.mas_next_slot
      0.23 ±  3%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.vma_prepare
      0.30            -0.0        0.25        perf-profile.self.cycles-pp.vm_area_free_rcu_cb
      0.32            -0.0        0.28        perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.27 ±  2%      -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.mas_store_prealloc
      0.30 ±  2%      -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.tlb_finish_mmu
      0.21 ±  2%      -0.0        0.17        perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.30 ±  2%      -0.0        0.26        perf-profile.self.cycles-pp.mas_topiary_replace
      0.27            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.anon_vma_clone
      0.28 ±  2%      -0.0        0.24        perf-profile.self.cycles-pp.mas_find
      0.11 ±  4%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.folio_add_anon_rmap_ptes
      0.25 ±  2%      -0.0        0.21 ±  2%  perf-profile.self.cycles-pp.mas_preallocate
      0.20 ±  3%      -0.0        0.16        perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      0.17 ±  3%      -0.0        0.13        perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.26            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.mas_spanning_rebalance
      0.24 ±  2%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.21 ±  3%      -0.0        0.17 ±  3%  perf-profile.self.cycles-pp.unmap_page_range
      0.19 ±  4%      -0.0        0.15 ±  4%  perf-profile.self.cycles-pp.mas_put_in_tree
      0.13 ±  3%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.prep_compound_page
      0.24 ±  2%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.30 ±  2%      -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.__free_one_page
      0.19 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.mt_find
      0.24            -0.0        0.21        perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.12 ±  3%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.get_partial_node
      0.17 ±  2%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.19 ±  3%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__split_vma
      0.16 ±  3%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.mas_update_gap
      0.20 ±  3%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.14 ±  2%      -0.0        0.11 ±  2%  perf-profile.self.cycles-pp.perf_iterate_sb
      0.18 ±  2%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.21 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.__mmap_region
      0.19 ±  2%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.13 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.can_vma_merge_right
      0.21            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.mas_ascend
      0.14 ±  5%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.15 ±  3%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp._find_next_bit
      0.15 ±  4%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.mas_alloc_nodes
      0.14 ±  3%      -0.0        0.11 ±  2%  perf-profile.self.cycles-pp.stress_mmap_child
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.refill_obj_stock
      0.17            -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.14 ±  2%      -0.0        0.12        perf-profile.self.cycles-pp.mas_mab_cp
      0.17            -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.stress_mmap_slow_munmap
      0.11            -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.vma_merge_new_range
      0.16 ±  2%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.15            -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.mas_push_data
      0.14 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.09 ±  3%      -0.0        0.07        perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.14 ±  5%      -0.0        0.12 ±  2%  perf-profile.self.cycles-pp.stress_munmap_retry_enomem
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.zap_pte_range
      0.10            -0.0        0.08        perf-profile.self.cycles-pp.can_vma_merge_after
      0.15 ±  3%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__vm_munmap
      0.13 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.lru_add_drain
      0.12 ±  3%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.09 ±  4%      -0.0        0.07 ±  4%  perf-profile.self.cycles-pp.perf_event_mmap_event
      0.09 ±  5%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.zap_pmd_range
      0.12 ±  3%      -0.0        0.10        perf-profile.self.cycles-pp.do_syscall_64
      0.09            -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.vma_complete
      0.10 ±  4%      -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.down_write_killable
      0.11 ±  3%      -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.init_multi_vma_prep
      0.11 ±  4%      -0.0        0.09 ±  3%  perf-profile.self.cycles-pp.mas_wr_store_entry
      0.09 ±  4%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.free_pgtables
      0.09 ±  5%      -0.0        0.08 ±  3%  perf-profile.self.cycles-pp.mas_prev
      0.06            -0.0        0.04 ± 33%  perf-profile.self.cycles-pp.mas_prev_setup
      0.09 ±  4%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.tlb_gather_mmu
      0.08 ±  3%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.unmap_vmas
      0.08 ±  5%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.vms_clear_ptes
      0.10 ±  4%      -0.0        0.09        perf-profile.self.cycles-pp.flush_tlb_func
      0.07            -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.__put_partials
      0.09 ±  5%      -0.0        0.08        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.09 ±  4%      -0.0        0.08 ±  3%  perf-profile.self.cycles-pp.do_mmap
      0.08 ±  5%      -0.0        0.07 ±  4%  perf-profile.self.cycles-pp.perf_output_begin
      0.09 ±  5%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.rcu_do_batch
      0.07 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.__mmap
      0.09 ±  4%      -0.0        0.08        perf-profile.self.cycles-pp.downgrade_write
      0.07            -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.mas_destroy
      0.12 ±  4%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.up_read
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.discard_slab
      0.17 ±  2%      +0.0        0.18        perf-profile.self.cycles-pp.lru_gen_add_folio
     38.93 ±  2%      +7.9       46.86        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-skl-fpga01: 104 threads 2 sockets (Skylake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/brk2/will-it-scale

commit: 
  89dd878282 ("mm: memcg: declare do_memsw_account inline")
  249608ee47 ("mm: respect mmap hint address when aligning for THP")

89dd878282881306 249608ee47132cab3b1adacd9e4 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.415e+09 ±  5%     -18.3%  2.791e+09 ±  8%  cpuidle..time
    117810            +2.1%     120255        vmstat.system.in
     10.66 ±  4%      -2.0        8.69 ±  8%  mpstat.cpu.all.idle%
      0.10            -0.0        0.08 ±  2%  mpstat.cpu.all.soft%
      0.31            +0.1        0.37 ±  2%  mpstat.cpu.all.usr%
   1679216 ±  5%     -30.5%    1166751 ±  9%  numa-numastat.node0.local_node
   1728543 ±  4%     -29.7%    1214908 ±  8%  numa-numastat.node0.numa_hit
   2318360 ±  3%     -30.9%    1600917 ±  6%  numa-numastat.node1.local_node
   2376686 ±  2%     -30.1%    1660471 ±  5%  numa-numastat.node1.numa_hit
   1726631 ±  4%     -29.7%    1214257 ±  8%  numa-vmstat.node0.numa_hit
   1677304 ±  5%     -30.5%    1166100 ±  9%  numa-vmstat.node0.numa_local
   2374815 ±  2%     -30.1%    1659314 ±  5%  numa-vmstat.node1.numa_hit
   2316489 ±  3%     -30.9%    1599760 ±  6%  numa-vmstat.node1.numa_local
    198860           +51.6%     301493 ±  2%  will-it-scale.104.threads
     10.10           -22.5%       7.82 ±  2%  will-it-scale.104.threads_idle
      1911           +51.6%       2898 ±  2%  will-it-scale.per_thread_ops
    198860           +51.6%     301493 ±  2%  will-it-scale.workload
    506.67 ±  6%     +50.9%     764.67 ±  3%  perf-c2c.DRAM.local
      5447           +27.1%       6925 ±  3%  perf-c2c.DRAM.remote
      5367 ±  2%     +18.6%       6364        perf-c2c.HITM.local
      3830           +17.8%       4513 ±  3%  perf-c2c.HITM.remote
      9197           +18.3%      10877 ±  2%  perf-c2c.HITM.total
     23736            -1.8%      23303        proc-vmstat.nr_mapped
    108712            -2.0%     106548        proc-vmstat.nr_slab_unreclaimable
   4105528           -30.0%    2875907        proc-vmstat.numa_hit
   3997875           -30.8%    2768196        proc-vmstat.numa_local
    236448 ± 14%     -25.0%     177254 ± 12%  proc-vmstat.numa_pte_updates
   7242851           -34.3%    4757136        proc-vmstat.pgalloc_normal
   7071106           -35.1%    4589946        proc-vmstat.pgfree
  19917807 ±  2%     +24.3%   24752419 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
  38832674 ±  6%     +31.8%   51167079 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.max
   5538759 ±  3%     +56.3%    8659607 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.stddev
  19917807 ±  2%     +24.3%   24752418 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
  38832674 ±  6%     +31.8%   51167093 ±  8%  sched_debug.cfs_rq:/.min_vruntime.max
   5538759 ±  3%     +56.3%    8659606 ± 16%  sched_debug.cfs_rq:/.min_vruntime.stddev
    894.81 ±  7%     +11.9%       1001 ±  8%  sched_debug.cfs_rq:/.util_est.max
      5560 ±  6%     -40.7%       3294 ±  3%  sched_debug.cpu.avg_idle.min
      0.52 ±  3%     +21.7%       0.63 ±  3%  perf-stat.i.MPKI
  17623556            -6.6%   16458641 ±  3%  perf-stat.i.branch-misses
     37.96            +3.6       41.59        perf-stat.i.cache-miss-rate%
  14340737 ±  3%     +22.2%   17528616 ±  2%  perf-stat.i.cache-misses
  38069590 ±  2%     +11.5%   42445235 ±  2%  perf-stat.i.cache-references
      9.24            +2.6%       9.48        perf-stat.i.cpi
 2.602e+11            +2.4%  2.665e+11        perf-stat.i.cpu-cycles
     18443 ±  3%     -17.1%      15286 ±  2%  perf-stat.i.cycles-between-cache-misses
      0.51 ±  2%     +22.2%       0.63 ±  2%  perf-stat.overall.MPKI
      0.32            -0.0        0.29 ±  2%  perf-stat.overall.branch-miss-rate%
     37.63            +3.6       41.25        perf-stat.overall.cache-miss-rate%
      9.28            +2.4%       9.50        perf-stat.overall.cpi
     18154 ±  2%     -16.2%      15205 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.11            -2.3%       0.11        perf-stat.overall.ipc
  42574383           -33.8%   28187632 ±  2%  perf-stat.overall.path-length
  17580646            -6.7%   16398374 ±  3%  perf-stat.ps.branch-misses
  14294844 ±  3%     +22.2%   17469729 ±  2%  perf-stat.ps.cache-misses
  37981661 ±  2%     +11.5%   42347645 ±  2%  perf-stat.ps.cache-references
 2.593e+11            +2.4%  2.655e+11        perf-stat.ps.cpu-cycles
      0.00 ±147%    +500.0%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.11 ±  8%     -32.5%       0.08 ± 23%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00 ±223%  +10641.7%       0.21 ± 55%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00 ±179%   +2890.9%       0.05 ± 53%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.01 ±135%    +390.2%       0.07 ±100%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.00 ±223%   +1475.0%       0.01 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±223%   +9837.5%       0.13 ±121%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.00 ± 14%   +1830.0%       0.06 ± 97%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ±  8%   +2452.0%       0.21 ± 64%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 16%    +870.6%       0.08 ± 84%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ±  6%    +823.9%       0.07 ± 31%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 ±100%    +411.1%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.02 ± 34%   +3178.5%       0.71 ± 32%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 ± 75%   +1602.7%       0.10 ±143%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.12 ±150%     -87.6%       0.02 ± 45%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00 ±150%   +1047.1%       0.03 ±105%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.00 ± 30%    +346.7%       0.01 ± 20%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.02 ± 68%   +1050.0%       0.19 ± 27%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.01 ± 14%    +376.8%       0.04 ±105%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±  9%    +138.9%       0.01 ± 12%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      0.01         +2033.3%       0.13 ± 33%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 11%    +216.7%       0.03 ± 83%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ±  5%    +172.1%       0.02 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 61%    +173.4%       0.03 ± 46%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±147%    +787.5%       0.01 ± 37%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.03 ±223%   +4840.4%       1.24 ± 64%  perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      0.00 ±223%  +41625.0%       0.83 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.16 ±213%    +813.2%       1.48 ± 78%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_expand.vma_merge_new_range.do_brk_flags
      0.00 ±167%  +43144.0%       1.80 ± 59%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00 ±223%  +22188.9%       0.33 ±216%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.fdget_pos.ksys_write.do_syscall_64
      0.00 ±223%   +2458.3%       0.05 ±154%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±223%  +68268.8%       1.82 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.00 ± 11%  +15918.5%       0.72 ±101%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ± 12%   +5779.5%       0.72 ± 50%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ± 53%   +2545.4%       0.48 ± 73%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.02 ± 18%  +15675.3%       2.45 ± 11%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 ±100%   +1100.0%       0.02 ± 76%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.22 ± 70%   +1725.7%       3.94 ±  4%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 ± 72%   +3737.3%       0.33 ±114%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.00 ±141%  +25095.7%       0.97 ±144%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.58 ± 79%    +423.4%       3.03 ± 43%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.91 ± 75%    +324.0%       3.84 ±  3%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.02 ± 49%  +18885.6%       3.51 ± 21%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.06 ±  5%   +3199.2%       2.01        perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.93 ±115%    +238.9%       3.16 ± 52%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      5.53 ±  3%     +35.2%       7.48 ±  3%  perf-sched.total_wait_and_delay.average.ms
    330090           -37.0%     207837 ±  4%  perf-sched.total_wait_and_delay.count.ms
      5.52 ±  3%     +35.2%       7.46 ±  3%  perf-sched.total_wait_time.average.ms
      6.70 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    167.82 ± 96%     -92.4%      12.75 ± 78%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.20 ±  4%     -58.9%       0.49 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
    280.09 ±  3%     +36.1%     381.15 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    606.50 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    320972           -38.3%     197924 ±  4%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      3118 ±  2%     -24.6%       2352 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    693.67            -9.8%     626.00        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1000          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    167.82 ± 96%     -91.5%      14.30 ± 56%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.55 ±223%    +762.9%       4.74 ±117%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.fdget_pos.ksys_write.do_syscall_64
      0.61 ±  3%     +24.0%       0.76 ±  8%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.26 ±221%   +3041.2%       8.22 ±129%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      1.20 ±  4%     -59.9%       0.48 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      0.91           +45.7%       1.32 ±  6%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    280.07 ±  3%     +36.1%     381.13 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.43 ±223%    +525.8%       2.69 ± 57%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      3.29 ±223%   +1258.4%      44.70 ± 98%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.fdget_pos.ksys_write.do_syscall_64
     29.75 ±  9%     +42.0%      42.24 ± 16%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.52 ±222%  +67466.8%     350.90 ±131%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      3.60 ±  5%    +106.8%       7.43 ± 11%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      5.04           +36.0%       6.86 ±  4%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1.72 ±  3%      -0.2        1.47 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.73 ±  3%      -0.2        1.48 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.72 ±  3%      -0.2        1.47 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.82 ±  3%      -0.2        1.57 ±  3%  perf-profile.calltrace.cycles-pp.common_startup_64
      1.80 ±  3%      -0.2        1.56 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.80 ±  3%      -0.2        1.56 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.80 ±  3%      -0.2        1.56 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.63 ±  3%      -0.2        0.43 ± 44%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable
      0.73            -0.1        0.59        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.82            -0.1        0.71        perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      0.63 ±  3%      -0.1        0.54 ±  4%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     97.85            +0.2       98.02        perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     97.87            +0.2       98.04        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     96.68            +0.2       96.85        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk.do_syscall_64
     97.90            +0.2       98.09        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
     96.79            +0.2       96.99        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     96.82            +0.2       97.04        perf-profile.calltrace.cycles-pp.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     95.68            +0.2       95.91        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
     98.06            +0.3       98.32        perf-profile.calltrace.cycles-pp.brk
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.56 ±  4%      -0.4        0.16 ±  4%  perf-profile.children.cycles-pp.intel_idle_irq
      1.06 ±  3%      -0.4        0.70 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.73 ±  3%      -0.2        1.49 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      1.73 ±  3%      -0.2        1.49 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.74 ±  3%      -0.2        1.50 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.82 ±  3%      -0.2        1.57 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      1.82 ±  3%      -0.2        1.57 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.82 ±  3%      -0.2        1.57 ±  3%  perf-profile.children.cycles-pp.do_idle
      1.80 ±  3%      -0.2        1.56 ±  3%  perf-profile.children.cycles-pp.start_secondary
      0.21            -0.2        0.05 ±  7%  perf-profile.children.cycles-pp.mas_store_gfp
      0.73            -0.1        0.59        perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.69 ±  2%      -0.1        0.56 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.58 ±  3%      -0.1        0.47 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.83            -0.1        0.72        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.17 ±  2%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.58 ±  3%      -0.1        0.47 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.17 ±  2%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.vma_complete
      0.49 ±  3%      -0.1        0.39 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.63 ±  4%      -0.1        0.55 ±  4%  perf-profile.children.cycles-pp.intel_idle_ibrs
      0.44 ±  4%      -0.1        0.36 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.39 ±  3%      -0.1        0.32 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.32            -0.0        0.28        perf-profile.children.cycles-pp.__split_vma
      0.36            -0.0        0.31        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      0.24 ±  4%      -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.sched_tick
      0.19 ±  7%      -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.task_tick_fair
      0.06 ±  6%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.12 ±  4%      -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.rcu_do_batch
      0.13 ±  3%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.rcu_core
      0.14 ±  2%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.handle_softirqs
      0.08 ±  4%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.get_jiffies_update
      0.08 ±  5%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.14 ±  2%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.kmem_cache_free
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.kthread
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.ret_from_fork
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.10 ±  7%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.update_cfs_group
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.__slab_free
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.commit_merge
      0.06 ±  9%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.06 ±  6%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.vma_expand
      0.08 ±  4%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.up_write
      0.06 ±  6%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.05 ±  7%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.anon_vma_clone
      0.07 ±  5%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.vma_merge_new_range
      0.06 ±  9%      +0.0        0.09        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.08 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.vms_clear_ptes
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.unlink_anon_vmas
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.11 ±  4%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.do_brk_flags
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.free_pgtables
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.vm_area_dup
      0.17 ±  2%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.mas_wr_node_store
      0.00            +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.poll_idle
      0.46 ±  4%      +0.1        0.60 ±  3%  perf-profile.children.cycles-pp.intel_idle
     97.85            +0.2       98.02        perf-profile.children.cycles-pp.__do_sys_brk
     97.90            +0.2       98.08        perf-profile.children.cycles-pp.do_syscall_64
     96.68            +0.2       96.86        perf-profile.children.cycles-pp.rwsem_optimistic_spin
     97.94            +0.2       98.12        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     96.79            +0.2       96.99        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     96.82            +0.2       97.04        perf-profile.children.cycles-pp.down_write_killable
     95.71            +0.2       95.94        perf-profile.children.cycles-pp.osq_lock
     98.06            +0.3       98.32        perf-profile.children.cycles-pp.brk
      0.54 ±  4%      -0.4        0.15 ±  3%  perf-profile.self.cycles-pp.intel_idle_irq
      0.82            -0.1        0.71        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.63 ±  4%      -0.1        0.55 ±  4%  perf-profile.self.cycles-pp.intel_idle_ibrs
      0.08 ±  4%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.get_jiffies_update
      0.10 ±  7%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.update_cfs_group
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.06 ±  9%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.06            +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.13 ±  3%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.up_write
      0.00            +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.poll_idle
      0.46 ±  4%      +0.1        0.60 ±  3%  perf-profile.self.cycles-pp.intel_idle
     95.11            +0.3       95.44        perf-profile.self.cycles-pp.osq_lock



***************************************************************************************************
lkp-skl-fpga01: 104 threads 2 sockets (Skylake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/brk1/will-it-scale

commit: 
  89dd878282 ("mm: memcg: declare do_memsw_account inline")
  249608ee47 ("mm: respect mmap hint address when aligning for THP")

89dd878282881306 249608ee47132cab3b1adacd9e4 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.271e+09 ± 11%     -23.6%  2.499e+09 ±  4%  cpuidle..time
    534782 ±  3%      -9.8%     482625        meminfo.Shmem
      7292 ± 10%     -16.8%       6068        uptime.idle
    117230            +3.0%     120705        vmstat.system.in
     10.21 ± 10%      -2.5        7.74 ±  4%  mpstat.cpu.all.idle%
      0.10            -0.0        0.08        mpstat.cpu.all.soft%
      0.30 ±  8%      +0.1        0.38 ±  2%  mpstat.cpu.all.usr%
   1562083 ±  5%     -28.9%    1111214 ±  6%  numa-numastat.node0.local_node
   1600171 ±  5%     -27.1%    1165935 ±  5%  numa-numastat.node0.numa_hit
   2469533 ±  5%     -36.7%    1562269 ±  7%  numa-numastat.node1.local_node
   2538689 ±  5%     -36.4%    1615104 ±  7%  numa-numastat.node1.numa_hit
   1599764 ±  5%     -27.2%    1165290 ±  5%  numa-vmstat.node0.numa_hit
   1561676 ±  5%     -28.9%    1110570 ±  6%  numa-vmstat.node0.numa_local
   2537854 ±  5%     -36.4%    1613883 ±  7%  numa-vmstat.node1.numa_hit
   2468697 ±  5%     -36.8%    1561112 ±  7%  numa-vmstat.node1.numa_local
    517.00 ±  6%     +44.8%     748.67 ±  5%  perf-c2c.DRAM.local
      5599 ±  3%     +22.8%       6877 ±  3%  perf-c2c.DRAM.remote
      5356 ±  2%     +17.2%       6277 ±  4%  perf-c2c.HITM.local
      3995 ±  3%     +12.9%       4512 ±  2%  perf-c2c.HITM.remote
    207757 ±  3%     +50.1%     311758 ±  4%  will-it-scale.104.threads
      9.27 ±  4%     -19.6%       7.45 ±  4%  will-it-scale.104.threads_idle
      1997 ±  3%     +50.1%       2997 ±  4%  will-it-scale.per_thread_ops
    207757 ±  3%     +50.1%     311758 ±  4%  will-it-scale.workload
  20771245 ±  7%     +19.8%   24875862 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.avg
   6013540 ±  9%     +29.6%    7795227 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.stddev
  20771245 ±  7%     +19.8%   24875862 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
   6013540 ±  9%     +29.6%    7795227 ± 15%  sched_debug.cfs_rq:/.min_vruntime.stddev
      5286 ±  5%     -32.3%       3580 ±  9%  sched_debug.cpu.avg_idle.min
    304791            -4.4%     291399        proc-vmstat.nr_active_anon
   1009858            -1.3%     996889        proc-vmstat.nr_file_pages
     23935            -4.3%      22912        proc-vmstat.nr_mapped
    133626 ±  3%      -9.7%     120653        proc-vmstat.nr_shmem
    108257            -1.7%     106463        proc-vmstat.nr_slab_unreclaimable
    304791            -4.4%     291399        proc-vmstat.nr_zone_active_anon
   4140560           -32.8%    2781620 ±  2%  proc-vmstat.numa_hit
   4033316           -33.7%    2674065 ±  2%  proc-vmstat.numa_local
   7314624 ±  2%     -37.7%    4554492 ±  3%  proc-vmstat.pgalloc_normal
   1102175            -2.4%    1075842        proc-vmstat.pgfault
   7136742 ±  2%     -38.5%    4391328 ±  3%  proc-vmstat.pgfree
      0.49 ±  6%     +23.1%       0.60 ±  6%  perf-stat.i.MPKI
     37.67            +4.2       41.92        perf-stat.i.cache-miss-rate%
  13495545 ±  3%     +26.4%   17064915 ±  6%  perf-stat.i.cache-misses
  36075782 ±  2%     +14.0%   41135363 ±  5%  perf-stat.i.cache-references
      9.29            +2.5%       9.52        perf-stat.i.cpi
 2.621e+11            +2.5%  2.685e+11        perf-stat.i.cpu-cycles
    212.81            -1.4%     209.80        perf-stat.i.cpu-migrations
     19736 ±  4%     -19.1%      15958 ±  7%  perf-stat.i.cycles-between-cache-misses
      0.11 ±  2%      -3.3%       0.11        perf-stat.i.ipc
      0.48 ±  4%     +25.9%       0.60 ±  6%  perf-stat.overall.MPKI
     37.35            +4.0       41.40        perf-stat.overall.cache-miss-rate%
      9.33            +2.0%       9.52        perf-stat.overall.cpi
     19440 ±  3%     -18.7%      15809 ±  7%  perf-stat.overall.cycles-between-cache-misses
      0.11            -2.0%       0.11        perf-stat.overall.ipc
  40994713 ±  3%     -33.4%   27301203 ±  4%  perf-stat.overall.path-length
  13453027 ±  3%     +26.4%   17009626 ±  6%  perf-stat.ps.cache-misses
  36008186 ±  2%     +14.0%   41056969 ±  5%  perf-stat.ps.cache-references
 2.612e+11            +2.5%  2.676e+11        perf-stat.ps.cpu-cycles
    212.16            -1.4%     209.13        perf-stat.ps.cpu-migrations
      0.00 ±143%    +614.3%       0.01 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.00 ±223%  +12311.1%       0.19 ±115%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00         +2575.0%       0.05 ± 92%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.04 ±175%    +275.8%       0.15 ± 89%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ±120%    +669.0%       0.15 ± 89%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ± 32%    +657.1%       0.07 ± 51%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.15 ±114%    +559.8%       1.00 ± 19%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00 ± 55%    +229.2%       0.01 ± 22%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.04 ± 61%    +378.2%       0.19 ± 15%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.01 ± 15%    +160.3%       0.03 ±109%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ± 30%    +216.1%       0.02 ± 12%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      0.03 ±163%    +448.7%       0.18 ± 24%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 30%     +96.7%       0.02 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 86%    +234.6%       0.05 ± 60%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±143%    +700.0%       0.01 ± 33%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.00 ±223%  +50788.9%       0.76 ±137%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      1.05 ±141%    +326.0%       4.46 ± 67%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_expand.vma_merge_new_range.do_brk_flags
      0.60 ±186%    +271.1%       2.25 ± 74%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.02 ± 97%  +14710.9%       2.72 ± 47%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.17 ±208%    +228.7%       0.54 ± 80%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.10 ±150%   +2829.8%       2.93 ± 34%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.73 ± 99%    +137.5%       4.10 ±  5%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.05 ±162%   +3038.5%       1.62 ± 72%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.18 ±174%   +1759.9%       3.30 ± 41%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      2.19 ± 69%     +74.8%       3.82 ±  6%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      1.16 ± 95%    +211.8%       3.61 ±  8%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 25%    +200.0%       0.02 ± 11%  perf-sched.total_sch_delay.average.ms
      5.20 ±  7%     +55.1%       8.06 ±  7%  perf-sched.total_wait_and_delay.average.ms
    338197 ±  7%     -43.5%     190977 ±  7%  perf-sched.total_wait_and_delay.count.ms
      5.19 ±  7%     +54.9%       8.04 ±  7%  perf-sched.total_wait_time.average.ms
      6.72 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     70.88 ±162%    +311.9%     292.00 ± 22%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.91 ± 15%     -43.6%       0.51 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
    279.25 ± 11%     +24.7%     348.09 ±  5%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    607.00 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    328796 ±  8%     -45.0%     180683 ±  7%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      3211 ±  6%     -20.9%       2541 ±  7%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1001          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00 ±223%  +52555.6%       0.79 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00 ±142%  +1.2e+05%       1.79 ± 90%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.commit_merge.vma_expand
     70.88 ±162%    +312.0%     291.99 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.91 ± 16%     -45.1%       0.50 ±  3%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
      0.98 ± 11%     +43.4%       1.40 ± 25%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    279.22 ± 11%     +24.7%     348.08 ±  5%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%  +1.5e+05%       2.21 ± 63%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00 ±145%  +2.2e+05%       3.74 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.commit_merge.vma_expand
      0.05 ±161%   +3018.3%       1.62 ± 72%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.59 ±  3%      -0.3        0.27 ±100%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable
      0.57 ±  6%      -0.3        0.26 ±100%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.70 ±  4%      -0.2        1.49 ±  3%  perf-profile.calltrace.cycles-pp.common_startup_64
      1.61 ±  4%      -0.2        1.40 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.61 ±  4%      -0.2        1.40 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.62 ±  4%      -0.2        1.42 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.68 ±  4%      -0.2        1.47 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.68 ±  4%      -0.2        1.48 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.68 ±  4%      -0.2        1.48 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.72            -0.1        0.58 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.81            -0.1        0.70        perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
     97.96            +0.1       98.08        perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     97.98            +0.1       98.11        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     96.80            +0.1       96.94        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk.do_syscall_64
     98.01            +0.1       98.16        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
     96.91            +0.2       97.07        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     96.94            +0.2       97.12        perf-profile.calltrace.cycles-pp.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     95.81            +0.2       96.00        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.__do_sys_brk
     98.17            +0.2       98.40        perf-profile.calltrace.cycles-pp.brk
      0.00            +0.6        0.59 ±  2%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.53 ±  6%      -0.4        0.17 ±  8%  perf-profile.children.cycles-pp.intel_idle_irq
      1.00 ±  4%      -0.3        0.70 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.70 ±  4%      -0.2        1.49 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      1.70 ±  4%      -0.2        1.49 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.63 ±  4%      -0.2        1.42 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      1.63 ±  4%      -0.2        1.42 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.64 ±  4%      -0.2        1.43 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.70 ±  4%      -0.2        1.49 ±  3%  perf-profile.children.cycles-pp.do_idle
      1.68 ±  4%      -0.2        1.48 ±  3%  perf-profile.children.cycles-pp.start_secondary
      0.21 ±  2%      -0.2        0.05        perf-profile.children.cycles-pp.mas_store_gfp
      0.72            -0.1        0.58 ±  2%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.82            -0.1        0.70        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.17 ±  2%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.17 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.vma_complete
      0.58 ±  6%      -0.1        0.49 ±  9%  perf-profile.children.cycles-pp.intel_idle_ibrs
      0.64 ±  3%      -0.1        0.56 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.54 ±  3%      -0.1        0.47 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.54 ±  4%      -0.1        0.47 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.45 ±  3%      -0.1        0.39 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.41 ±  4%      -0.1        0.36 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.35            -0.0        0.31 ±  3%  perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      0.32            -0.0        0.27 ±  3%  perf-profile.children.cycles-pp.__split_vma
      0.36 ±  2%      -0.0        0.31 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.14 ±  6%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.handle_softirqs
      0.23 ±  2%      -0.0        0.20 ±  4%  perf-profile.children.cycles-pp.sched_tick
      0.13 ±  6%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.rcu_core
      0.13 ±  5%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.rcu_do_batch
      0.15 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.kmem_cache_free
      0.06 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.06 ± 11%      -0.0        0.05        perf-profile.children.cycles-pp.kthread
      0.06 ± 11%      -0.0        0.05        perf-profile.children.cycles-pp.ret_from_fork
      0.06 ± 11%      -0.0        0.05        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.06 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.smpboot_thread_fn
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.__slab_free
      0.06 ±  7%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.vma_expand
      0.07 ±  7%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.08 ±  6%      +0.0        0.10        perf-profile.children.cycles-pp.vma_merge_new_range
      0.06 ±  9%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.anon_vma_clone
      0.08 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.up_write
      0.06 ±  8%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.05 ±  7%      +0.0        0.09 ±  7%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.08 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.vms_clear_ptes
      0.12 ±  4%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.do_brk_flags
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.unlink_anon_vmas
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.vm_area_dup
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.free_pgtables
      0.16 ±  4%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mas_wr_node_store
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.poll_idle
     97.96            +0.1       98.08        perf-profile.children.cycles-pp.__do_sys_brk
     98.02            +0.1       98.14        perf-profile.children.cycles-pp.do_syscall_64
     96.80            +0.1       96.94        perf-profile.children.cycles-pp.rwsem_optimistic_spin
     98.05            +0.1       98.19        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.45 ±  4%      +0.2        0.60 ±  2%  perf-profile.children.cycles-pp.intel_idle
     96.91            +0.2       97.07        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     96.94            +0.2       97.12        perf-profile.children.cycles-pp.down_write_killable
     95.84            +0.2       96.02        perf-profile.children.cycles-pp.osq_lock
     98.18            +0.2       98.40        perf-profile.children.cycles-pp.brk
      0.50 ±  6%      -0.3        0.16 ±  9%  perf-profile.self.cycles-pp.intel_idle_irq
      0.81            -0.1        0.70        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.58 ±  6%      -0.1        0.49 ±  9%  perf-profile.self.cycles-pp.intel_idle_ibrs
      0.06 ±  8%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.13 ±  2%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.up_write
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.poll_idle
      0.45 ±  4%      +0.2        0.60 ±  2%  perf-profile.self.cycles-pp.intel_idle
     95.28            +0.3       95.53        perf-profile.self.cycles-pp.osq_lock





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


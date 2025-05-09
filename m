Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15374846F
	for <oe-lkp@lists.linux.dev>; Fri,  9 May 2025 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757209; cv=fail; b=BJQbqNoQPKG9ANIk3J11iWdpa7z2aUbRv3jyOH2elPSvi35eFPnPpTZhemMArmjB+OVbrUM3ZY7eqTClXqR648I2c9noR9g2cms8jmOOILssgb0bFQ1jiwUEX8qxcg7dgm/lsmwya3kHiA7dAZVOKinFr8shTZyEBeGIJedpexc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757209; c=relaxed/simple;
	bh=jjIz9SXrOM4VjesPtlksPpUcZKRSpn7mun6hCQYLLRY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=W1Qa/vRlduJzLsGc6zgHtC/aPWeu70pNqg8Y37LCKazU0th0C1+yZe3BIBSwjbuW7XUCp2huhK0X3BezuqxgFvDW1TKQtkQpNFqk7AvOat56E0uB4LzyPd2gnwF3fmYRrY4kzvxcI6nhwW8TFzIt4jozFA5rGXXcW6KOlZGY6UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9kwAVKG; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9kwAVKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746757207; x=1778293207;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jjIz9SXrOM4VjesPtlksPpUcZKRSpn7mun6hCQYLLRY=;
  b=K9kwAVKGO3QYHW6xOtI5TK8b580fvTkMMJuMB8SxXXVAEZwr1+oWDDLn
   33z+CZDGKEhwhDItiP3qIFyyHx+2wpggxkI9VD5MFgE71s351zxax9lLF
   oVBZrjSTrdOB7KsTSLiPRQVdMkfZqrxIXdOY7rH89ZrQKu3x3Pikx6PZt
   MgQfec+oTOe+vmwxH1AXs32Roh85fhL70KHxLokMKy7kz0bTXWzV6kX95
   V2U7zxsDnD47Cmh+Cr1yE6zLrukiH4iIqrbNwIWoUj1PC22kHlU31N3ne
   6c+MmzuteNsIE8R2Xlc1SDy+7PlVlYnICJ/kOzvNI0iXWK+JepmzjCfZB
   w==;
X-CSE-ConnectionGUID: kz5sxbwUQaCSfhVNustXkg==
X-CSE-MsgGUID: +jEmE83ITKyds06lRHrx2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52376755"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="52376755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:20:06 -0700
X-CSE-ConnectionGUID: yrQ4sZfKRg29+ElHnKxpnQ==
X-CSE-MsgGUID: Ii0aCDcpQbWlbsVCV7GQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136411748"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:20:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 19:20:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 19:20:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 19:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGL5V1YzobnNnCxTjw1mVkL4bw1DZj3FzhxxGG+F2Kvb0TVVnVbJRtlk+pFORUE+rPXoMi8isGqDguBaZeq1yWJFov/VWncjQlfQ+NKP/A9oerFrr9d72ARZqLEsQlZ38vvlUrUZFbZZKSACTT/okrIdttyZnZ5nhJGPnXKvx5ABqzMCxjBHs64rb90O2ylYs+YqSk8vrHBf242UP+8lTxXc4KEZNafR1+VvyOFYWQ9Ciut6s1s5TFIKn32fJUOJrywQL8Qremo3LTOgeUiqR9mrIePmx31KmTUnQTwGA8egjgDRp3bkKC+UbWpfmjDZ7dbbkhZ2mHHRR5bJgObGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+zRljU3DqA1B+LkmoEedp9pkNdJKmej+TEesjVGNrg=;
 b=XjuTfxOB83OawJ4uxcQIKQp960s5rVNj/k476C8hzw/CE/+Re49RiDrZ1/6gjFOEqg2p2LaYdIVQpLisAL2WpTqlprtS9ApNn3zMdUXOppl2UydoWfMR+l4T9tT9WFcbQrnHigbGzp/U7vNJNiVr+yqF3d21MGw8sWMJmVbuEqhohMIirZarkuHexgercZ0vtUcujHDwT9CPqpsT2TnB1aJfG1kBqtEoLRE9KFrllcYly9EW6hsL+xrAoBh/XI77EUJWezeT9y259u4s5hUcYsvKovWxHq2CeIzK5SxBftMHOtf85oCsBjLfw8I3yQI12YZ2kJFuhUZeJa2oKm3p2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH3PPFA061B3868.namprd11.prod.outlook.com (2603:10b6:518:1::d3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 9 May
 2025 02:19:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 02:19:33 +0000
Date: Fri, 9 May 2025 10:19:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [anolis-intel-cloud:devel-5.10] [sched/fair]  476e0b2ef0:
 unixbench.throughput 7.9% regression
Message-ID: <202505091005.fc3cca48-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH3PPFA061B3868:EE_
X-MS-Office365-Filtering-Correlation-Id: 65492d14-d001-4c59-de69-08dd8e9fefe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HSilMLW/kbR2o6AwakDjwoBET1GOR1hTVp6sHIlmQqg44hc8HxFhxBnVbO?=
 =?iso-8859-1?Q?t0IEMHVzFtGJPYwO76oOgCiDrUWIDx59eP5drL/2ofXWomgVF9xWyRlDov?=
 =?iso-8859-1?Q?gKsLiDuSk9RnrpuzKbupC+GH0vvjuXBCS1yWkmsbrm53KMY0wXNeVVIHNG?=
 =?iso-8859-1?Q?Vcm8b8hlqQiuAPnxEUqUTO5guGr07A9LzOEekEcxXwo1146jd/+BLrD3J8?=
 =?iso-8859-1?Q?PcQB/qjhJEIh9SllNCUAJhZo0RUAOSy6toWjs/TPmI4LBF+oI8gM8R2mSh?=
 =?iso-8859-1?Q?L9Zxmfiz7DHdQ/AIqBdFKnlPUijpcAgHyZi1HDOSEEGHB9zPv3jigLf62S?=
 =?iso-8859-1?Q?E8xIOOw0udQNMzn/RHHreO7Q6QOrBZza+TTyxalUYsnP6ze5G+0TOQuR/d?=
 =?iso-8859-1?Q?QYQIi1a545n8apOwbu78e3fduubn4haYVROcOuJBH8sg8SRchNxbDBK7vQ?=
 =?iso-8859-1?Q?oAMYfoZEeEYFeRlS/XHG1E/re4CTcATvnrd+AMhp2c7ajn1CKw3xktlxcy?=
 =?iso-8859-1?Q?abAIGBAjdrsk39lOJaD/yEOWzPo2S3S87OTKZgHluZtC/X0/w0lcd1Zhup?=
 =?iso-8859-1?Q?YzEPVD6f1woQE34lH7r2it89DLAjGhk5tsCqO7mr3XqTDg9/gy5Jr35qMB?=
 =?iso-8859-1?Q?/JpOZTnWvN36FdUFJNwodAzsV5mp64yHOxQLGDIkq1IAVgnZKXVTqVhYUd?=
 =?iso-8859-1?Q?smU3WckhU24LEyv3ZROcMxNJV73u81fKw/HTxc4hxH9/S2Qw6NFcr2WKDZ?=
 =?iso-8859-1?Q?3o58W8xMraO+NSCc7TXUKgtcNFJnGvCz3cxPtYq9lykKEn7YQa42on5CBA?=
 =?iso-8859-1?Q?sODAxdqZrudW31qDX++OhpJC/JiyqQm0rQBlBg8T09MNhciUFmYdn8UiUN?=
 =?iso-8859-1?Q?S9TaLJFUZ//7clBUsbyUYnSJnTKzQ/vGwLLFkXRCBDa5fp92UjZU44zwZe?=
 =?iso-8859-1?Q?51+0lQM+fDCMJDlF8r7oauA2CPzq02mq61wXFUZOJxNmzW5Yp9EmvXn0i5?=
 =?iso-8859-1?Q?5e82sPK1SKI8+Cz4sGBeZ6fedbbmS24WFRUioIBx20JSVi2dDKUav+A8w3?=
 =?iso-8859-1?Q?qR7S0b/7SDx8kWuYFBOo8P02NvY1lWeOrrlTWtn3zlRwa4v6jImZO0EGhn?=
 =?iso-8859-1?Q?GKl5cq5wqUxIN40GrGTK3ZW5CVQce5SZbwEWUGrif1uzYjCiwIZ7BJdfUz?=
 =?iso-8859-1?Q?Gc8M/khKSL3f/t/SB/2u7kZTvpFEwFj//cWsrpPVwu0rzUuF73zof1HL+k?=
 =?iso-8859-1?Q?umuVPLrMwHYFrsr/2Xp6aW0BlBALvYJn5IF36cKKz4jLnZz9qcsYhHz09I?=
 =?iso-8859-1?Q?b2qgM7S7Qg3ibZSaaiO3UNFzNRTgD0dSjZU+UqALCLvkrbBjgeu1HmSB9U?=
 =?iso-8859-1?Q?aOiVnq9BcDpXH+EEhMV/CdmQDh9MQ8SnlpmFfUs1PgTLx1ifXvYcaYVL74?=
 =?iso-8859-1?Q?ffix2hcigapxPJzP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?phuv3BOqTgbpSNQUOILltkmFY4DDARNWT9u69Uo5P2F1IEq9tBRndTjoAG?=
 =?iso-8859-1?Q?CvLcTW2A0DfbD16JJJXuM0WhzPkzm9JVk2DQWlwOEJCBHjTQ55001F7ghb?=
 =?iso-8859-1?Q?/FXTVvxJe+dnujqsLYaNF3a/WuyAM/fe9OX9DhX4GMBbq6fHbMqYwg/e1b?=
 =?iso-8859-1?Q?XMJX5DDr+HFxl0umMPS5bgGEunw6mZXg+ELKjdgpt2M7eiQRBfwQPCxJUv?=
 =?iso-8859-1?Q?1XLujt75FaDkZ9VdDntTGsLZpK5ueaTiypUvGdYdUezVhr6Z9psWxiEYPP?=
 =?iso-8859-1?Q?qQ31g9LcDjhXTer0Bxt+JP6LQ9Oc4gswwZR1usbkVt5OL1XRe7tSXJslK0?=
 =?iso-8859-1?Q?ySWPHTIHQmlxIbVp/4VG9Y3gj9YV4Z4InGNQgz6sVfg/LajV9TQdfYw+6a?=
 =?iso-8859-1?Q?ECya0UH7njZ/pJs3QSju2sn8R2rvA3l8MFV12Peo2EDYgu9rMee4VPqpDq?=
 =?iso-8859-1?Q?W44TLid3I+YYYAqtug+Hm9rr9DVMl1b3RQtdrc6s0m7sCaflmgvTa+Lpmp?=
 =?iso-8859-1?Q?bvwqXy7VJVJFa8pooX6qXgkEImxNtL3sWC8d/qRTVzaMBz/LqXbaZ/h7cK?=
 =?iso-8859-1?Q?SqEPdHUsMeP/MxRL2WbTAeRKGwRvvsSgLi2wZrxGS1qhfVlbgLWopxHLcj?=
 =?iso-8859-1?Q?FuGJKetTwBgOEn2J1bi6m8UVQgNWUZoLrAMjS8JT9FSINQqJjyYw9XX8Xe?=
 =?iso-8859-1?Q?3Dh7Vdm/limf5+EeYgaUnvzT1y36aYQZoo7lG2206EB8SG+Z0QiVdl3kri?=
 =?iso-8859-1?Q?ZWrchUjj1ZOnXgecu92GbEaMDRC7UTnSTnXZtHoEnp5keDUW3h/XTWgpPk?=
 =?iso-8859-1?Q?xwImeiH1ZprPFdNdo30TEkaOlN1gj5TYT8yvk8H7ofSJMl0LbsM79UYUYn?=
 =?iso-8859-1?Q?+LVSr8A+KBQ+sBLf90GxRNmGYPTyVfVRUO6QqixiNx/KMQrLAs2/9ivlK3?=
 =?iso-8859-1?Q?P/K3Z4YQALostMbNrwQw84JX/0GCFViAztdOXaGESQlGVpJRLYHBE52LiP?=
 =?iso-8859-1?Q?xr8qMDkUxTRAOfQhygHEy8jnqOqdRiCSC5ZDz+SHFGXuUTc1b6sMkDqCfz?=
 =?iso-8859-1?Q?5+21X0WQSdz6+C5Qsk/D4s9qioNax+06uTzp/ak4waGTJYero+kss8kMOw?=
 =?iso-8859-1?Q?6DjaMlHmw19hFfESJdO1ddmD1yWNJnLuwKQY4R9Tugrl0Ua1SPi7GJ9x/l?=
 =?iso-8859-1?Q?SNC2IIyWNSxK9VfzBc1K5XdEdzZC1SNwjcM4DiBNmENG0v9JqLzFYpGkdW?=
 =?iso-8859-1?Q?E+KYrGs6IWgfxAU/QCS2Wk37z+pyVXiwP9xXe+GGzJCVAe1n73gMzuGivs?=
 =?iso-8859-1?Q?SdDE8n3FpxIeNNpSFJRj7BG5QSdyy0eE9u7JoT2hxN9jpZs9zqZNv/0V2L?=
 =?iso-8859-1?Q?yc8gUge29klmP9nJpsDlm+xM/NnQ7hA1mhucnmAyu/UndXFWEPicA08Qy8?=
 =?iso-8859-1?Q?/41p0/6DoqgiGPf/KveC15TIvBN/uN2e/7rIlHMka2lDU49PunQt/F1syU?=
 =?iso-8859-1?Q?FNj1HkjOlMu6S1ohzT4I/5r/up/Eaofk30m3g1xaN4bJbej447smkWYUdP?=
 =?iso-8859-1?Q?SwSn187vtUjmXgcMkAkKMXFUY1ic9/57rBRG/0JwFxCD0HPMjlSh7lpS/o?=
 =?iso-8859-1?Q?wHOyB5t4+JwGmnYL0TrPMozc6k+kev8hxjIVS/Qack2RL/HGUeIl6KJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65492d14-d001-4c59-de69-08dd8e9fefe5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:19:33.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL7oR1j3af5hd6wB1OnJsYTOaFlfSJ4CPkm7bqXja31LdE3BCcPQz0+Vj8zQKm4gUqSJNq6j8uJPN4Vb5RdIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA061B3868
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 7.9% regression of unixbench.throughput on:


commit: 476e0b2ef06626b59dcd0dbe683f18a3dcecf4c9 ("sched/fair: Remove select_idle_smt()")
https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10

testcase: unixbench
config: x86_64-anolis-intel-cloud-devel-5.10
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: context1
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505091005.fc3cca48-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250509/202505091005.fc3cca48-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-anolis-intel-cloud-devel-5.10/100%/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-1ap1/context1/unixbench

commit: 
  6b7fe4a1e3 ("sched/fair: Merge select_idle_core/cpu()")
  476e0b2ef0 ("sched/fair: Remove select_idle_smt()")

6b7fe4a1e321cd73 476e0b2ef06626b59dcd0dbe683 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.454e+09            -9.6%  4.932e+09        cpuidle..usage
    177523            +5.0%     186348        perf-c2c.HITM.total
  30847622            -9.1%   28033579        vmstat.system.cs
   1310619            -9.5%    1185933        vmstat.system.in
      9.21 ±  8%     -31.2%       6.33 ± 18%  sched_debug.cfs_rq:/.removed.util_avg.avg
     22.76 ±  7%     -30.1%      15.92 ± 12%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    230.56 ±  7%     -19.7%     185.13 ± 15%  sched_debug.cfs_rq:/.util_avg.min
     49.02 ±  3%     -22.9%      37.81 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     80.42 ±  6%     -21.0%      63.52 ± 11%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
     29091            -7.9%      26798        unixbench.score
  11636460            -7.9%   10719461        unixbench.throughput
    126612 ±  3%     -11.6%     111946 ±  2%  unixbench.time.involuntary_context_switches
      1796            +1.1%       1815        unixbench.time.user_time
 3.451e+09            -7.8%  3.183e+09        unixbench.time.voluntary_context_switches
 4.573e+09            -7.9%  4.213e+09        unixbench.workload
 4.181e+10            -7.0%  3.888e+10        perf-stat.i.branch-instructions
      1.21            +0.0        1.24        perf-stat.i.branch-miss-rate%
 4.967e+08            -5.0%  4.718e+08        perf-stat.i.branch-misses
 2.861e+09            +2.8%  2.942e+09        perf-stat.i.cache-references
  31029931            -9.1%   28204378        perf-stat.i.context-switches
      2.84            +6.5%       3.02 ±  2%  perf-stat.i.cpi
 5.137e+11            -1.5%   5.06e+11        perf-stat.i.cpu-cycles
   8028790            +4.0%    8352167        perf-stat.i.cpu-migrations
 2.061e+11            -6.9%   1.92e+11        perf-stat.i.instructions
      0.43            -5.0%       0.41        perf-stat.i.ipc
    162.73            -6.4%     152.31        perf-stat.i.metric.K/sec
      0.40           -14.9%       0.34 ± 33%  perf-stat.overall.ipc
 4.179e+10           -16.3%  3.498e+10 ± 33%  perf-stat.ps.branch-instructions
 4.964e+08           -14.5%  4.245e+08 ± 33%  perf-stat.ps.branch-misses
  31013669           -18.2%   25372624 ± 33%  perf-stat.ps.context-switches
 5.135e+11           -11.3%  4.554e+11 ± 33%  perf-stat.ps.cpu-cycles
  2.06e+11           -16.2%  1.727e+11 ± 33%  perf-stat.ps.instructions
 8.135e+13           -16.2%  6.819e+13 ± 33%  perf-stat.total.instructions
      2.42            -0.8        1.64        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     17.28            -0.5       16.83        perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
     18.39            -0.4       17.95        perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
     27.11            -0.4       26.68        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     19.78            -0.4       19.35        perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     26.96            -0.4       26.54        perf-profile.calltrace.cycles-pp.cpu_startup_entry.secondary_startup_64_no_verify
     26.90            -0.4       26.48        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     15.87            -0.3       15.55        perf-profile.calltrace.cycles-pp.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
     11.59            -0.3       11.32        perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
     14.58            -0.3       14.32        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     11.20            -0.2       10.99        perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
     10.97            -0.2       10.78        perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
      4.53            -0.1        4.40        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     12.66            -0.1       12.54        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      1.29            -0.1        1.17        perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      4.36            -0.1        4.25        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     12.58            -0.1       12.47        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.71            -0.1        0.64        perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.58            -0.1        1.52        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.pipe_read.new_sync_read
      1.17            -0.0        1.13        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.61            -0.0        0.59        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.pipe_read.new_sync_read
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.cmd_sched.run_builtin.handle_internal_command
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.cmd_record.cmd_sched.run_builtin.handle_internal_command.main
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.cmd_sched.run_builtin.handle_internal_command.main
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record.cmd_record.cmd_sched
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record.cmd_record.cmd_sched.run_builtin
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record.cmd_record
      0.72            +0.0        0.75        perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.76            +0.0        0.79        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.85            +0.0        0.88        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94            +0.0        0.98        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read
      1.33            +0.0        1.37        perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.86            +0.0        0.89        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.95            +0.0        0.98        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read.new_sync_read
      1.08            +0.0        1.12        perf-profile.calltrace.cycles-pp.__switch_to_asm
      2.54            +0.0        2.58        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
      1.25            +0.0        1.28        perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      1.21            +0.0        1.25        perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop
      3.20            +0.1        3.25        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
      1.26            +0.1        1.32        perf-profile.calltrace.cycles-pp.migrate_task_rq_fair.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.91            +0.1        1.97        perf-profile.calltrace.cycles-pp.llist_add_batch.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function
      1.93            +0.1        1.98        perf-profile.calltrace.cycles-pp.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.92            +0.1        0.98        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      1.18            +0.1        1.24        perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      2.30            +0.1        2.36        perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
      1.05            +0.1        1.12        perf-profile.calltrace.cycles-pp.llist_reverse_order.flush_smp_call_function_queue.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry
      0.94            +0.1        1.01        perf-profile.calltrace.cycles-pp.send_call_function_single_ipi.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.15            +0.1        1.22        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      1.83            +0.1        1.91        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      1.68            +0.1        1.76        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read
      1.69            +0.1        1.78        perf-profile.calltrace.cycles-pp.copyout.copy_page_to_iter.pipe_read.new_sync_read.vfs_read
      1.69            +0.1        1.78        perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      1.61            +0.1        1.70        perf-profile.calltrace.cycles-pp.copy_user_generic_unrolled.copyout.copy_page_to_iter.pipe_read.new_sync_read
      6.21            +0.1        6.31        perf-profile.calltrace.cycles-pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      2.29            +0.1        2.40        perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      4.71            +0.1        4.82        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      4.78            +0.1        4.90        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      2.42            +0.1        2.54        perf-profile.calltrace.cycles-pp.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      3.39            +0.1        3.53        perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     24.15            +0.3       24.43        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     23.93            +0.3       24.22        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     22.24            +0.3       22.54        perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.64            +0.3       23.95        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     32.15            +0.3       32.49        perf-profile.calltrace.cycles-pp.read
     29.21            +0.4       29.60        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     22.80            +0.5       23.27        perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
      8.89            +0.7        9.58        perf-profile.calltrace.cycles-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      8.90            +0.7        9.59        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.44            -0.8        1.65        perf-profile.children.cycles-pp.poll_idle
     17.36            -0.5       16.91        perf-profile.children.cycles-pp.select_idle_cpu
     18.41            -0.4       17.97        perf-profile.children.cycles-pp.select_idle_sibling
     27.11            -0.4       26.68        perf-profile.children.cycles-pp.cpu_startup_entry
     27.11            -0.4       26.68        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     19.80            -0.4       19.37        perf-profile.children.cycles-pp.select_task_rq_fair
     27.07            -0.4       26.64        perf-profile.children.cycles-pp.do_idle
     15.55            -0.3       15.22        perf-profile.children.cycles-pp.__schedule
     16.07            -0.3       15.76        perf-profile.children.cycles-pp.select_idle_core
     12.67            -0.3       12.35        perf-profile.children.cycles-pp.available_idle_cpu
     14.67            -0.3       14.40        perf-profile.children.cycles-pp.cpuidle_idle_call
      4.57            -0.1        4.44        perf-profile.children.cycles-pp.schedule_idle
      1.32            -0.1        1.20        perf-profile.children.cycles-pp.menu_select
     12.72            -0.1       12.60        perf-profile.children.cycles-pp.cpuidle_enter
     12.69            -0.1       12.58        perf-profile.children.cycles-pp.cpuidle_enter_state
      2.78            -0.1        2.68        perf-profile.children.cycles-pp.prepare_task_switch
      0.73            -0.1        0.66        perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.85 ±  2%      -0.1        0.78        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.91            -0.1        0.85        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.05            -0.1        0.98        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.07            -0.1        1.00        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.91 ±  2%      -0.1        0.84        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.83 ±  2%      -0.1        0.77        perf-profile.children.cycles-pp.tick_sched_timer
      1.07            -0.1        1.01        perf-profile.children.cycles-pp.__lock_text_start
      0.66 ±  3%      -0.1        0.60        perf-profile.children.cycles-pp.nohz_balancer_kick
      0.63            -0.1        0.57        perf-profile.children.cycles-pp.sched_clock_cpu
      1.71            -0.1        1.65        perf-profile.children.cycles-pp.asm_call_sysvec_on_stack
      0.34 ±  5%      -0.1        0.28 ±  3%  perf-profile.children.cycles-pp.nohz_balance_exit_idle
      0.55            -0.1        0.50        perf-profile.children.cycles-pp.sched_clock
      1.08            -0.0        1.03        perf-profile.children.cycles-pp.pick_next_task
      0.49            -0.0        0.44        perf-profile.children.cycles-pp.native_sched_clock
      0.41            -0.0        0.37        perf-profile.children.cycles-pp.tick_nohz_next_event
      2.54            -0.0        2.50        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.50            -0.0        0.46        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.44            -0.0        0.40        perf-profile.children.cycles-pp.nohz_run_idle_balance
      1.27            -0.0        1.24        perf-profile.children.cycles-pp.finish_task_switch
      0.35 ±  4%      -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.ktime_get
      0.86            -0.0        0.83        perf-profile.children.cycles-pp.pick_next_task_fair
      0.27            -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.30            -0.0        0.27        perf-profile.children.cycles-pp.get_next_timer_interrupt
      1.02            -0.0        1.00        perf-profile.children.cycles-pp._find_next_bit
      0.26            -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.34            -0.0        0.32        perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      2.76            -0.0        2.74        perf-profile.children.cycles-pp._raw_spin_lock
      0.26            -0.0        0.24        perf-profile.children.cycles-pp.rcu_idle_exit
      0.27            -0.0        0.25 ±  2%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.30            -0.0        0.28        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.59            -0.0        0.57        perf-profile.children.cycles-pp.id_idle_cpu
      0.61            -0.0        0.59        perf-profile.children.cycles-pp.cpumask_next_wrap
      0.18            -0.0        0.16        perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.21            -0.0        0.19        perf-profile.children.cycles-pp.read_tsc
      0.25            -0.0        0.23        perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.54            -0.0        0.52        perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.13            -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.rcu_eqs_exit
      0.34            -0.0        0.32        perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.19 ±  2%      -0.0        0.17        perf-profile.children.cycles-pp.__cond_resched
      0.59            -0.0        0.57        perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.16            -0.0        0.15        perf-profile.children.cycles-pp.ttwu_do_wakeup
      0.16            -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.14            -0.0        0.13        perf-profile.children.cycles-pp.current_time
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.rcu_dynticks_eqs_enter
      0.73            +0.0        0.74        perf-profile.children.cycles-pp.cmd_sched
      0.73            +0.0        0.74        perf-profile.children.cycles-pp.perf_session__process_events
      0.73            +0.0        0.74        perf-profile.children.cycles-pp.reader__read_event
      0.73            +0.0        0.74        perf-profile.children.cycles-pp.record__finish_output
      0.19 ±  2%      +0.0        0.21 ±  3%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.48            +0.0        0.50        perf-profile.children.cycles-pp.task_h_load
      0.48            +0.0        0.50        perf-profile.children.cycles-pp.load_new_mm_cr3
      2.11            +0.0        2.13        perf-profile.children.cycles-pp.update_load_avg
      0.18            +0.0        0.21        perf-profile.children.cycles-pp.place_entity
      0.12 ±  2%      +0.0        0.15        perf-profile.children.cycles-pp.check_spread
      1.26            +0.0        1.30        perf-profile.children.cycles-pp.rseq_get_rseq_cs
      2.60            +0.0        2.63        perf-profile.children.cycles-pp.dequeue_entity
      1.23            +0.0        1.27        perf-profile.children.cycles-pp.__get_user_8
      1.17            +0.0        1.21        perf-profile.children.cycles-pp.mutex_lock
      1.17            +0.0        1.22        perf-profile.children.cycles-pp.switch_mm_irqs_off
      3.21            +0.1        3.26        perf-profile.children.cycles-pp.dequeue_task_fair
      2.10            +0.1        2.15        perf-profile.children.cycles-pp.__switch_to_asm
      1.27            +0.1        1.32        perf-profile.children.cycles-pp.migrate_task_rq_fair
      1.94            +0.1        1.99        perf-profile.children.cycles-pp.__smp_call_single_queue
      1.91            +0.1        1.97        perf-profile.children.cycles-pp.llist_add_batch
      1.31            +0.1        1.37        perf-profile.children.cycles-pp.mutex_unlock
      2.32            +0.1        2.38        perf-profile.children.cycles-pp.prepare_to_wait_event
      0.94            +0.1        1.01        perf-profile.children.cycles-pp.send_call_function_single_ipi
      1.41            +0.1        1.49        perf-profile.children.cycles-pp.flush_smp_call_function_queue
      1.85            +0.1        1.92        perf-profile.children.cycles-pp.copy_page_to_iter
      3.08            +0.1        3.16        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.20            +0.1        1.28        perf-profile.children.cycles-pp.llist_reverse_order
      1.70            +0.1        1.79        perf-profile.children.cycles-pp.copyout
      1.70            +0.1        1.79        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      1.79            +0.1        1.88        perf-profile.children.cycles-pp.copy_user_generic_unrolled
      6.28            +0.1        6.38        perf-profile.children.cycles-pp.flush_smp_call_function_from_idle
      2.30            +0.1        2.40        perf-profile.children.cycles-pp.switch_fpu_return
      4.74            +0.1        4.85        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      4.88            +0.1        4.99        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.43            +0.1        2.55        perf-profile.children.cycles-pp.set_task_cpu
      3.41            +0.1        3.55        perf-profile.children.cycles-pp.ttwu_queue_wakelist
     23.97            +0.3       24.26        perf-profile.children.cycles-pp.ksys_read
     59.58            +0.3       59.88        perf-profile.children.cycles-pp.do_syscall_64
     22.26            +0.3       22.56        perf-profile.children.cycles-pp.new_sync_read
     23.66            +0.3       23.97        perf-profile.children.cycles-pp.vfs_read
     21.96            +0.3       22.28        perf-profile.children.cycles-pp.pipe_read
     32.50            +0.3       32.83        perf-profile.children.cycles-pp.read
     64.78            +0.4       65.18        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      8.93            +0.7        9.63        perf-profile.children.cycles-pp.mwait_idle_with_hints
      8.94            +0.7        9.64        perf-profile.children.cycles-pp.intel_idle
      2.27            -0.7        1.54        perf-profile.self.cycles-pp.poll_idle
     12.60            -0.3       12.29        perf-profile.self.cycles-pp.available_idle_cpu
      2.53            -0.1        2.45        perf-profile.self.cycles-pp.prepare_task_switch
      0.34 ±  5%      -0.1        0.28 ±  3%  perf-profile.self.cycles-pp.nohz_balance_exit_idle
      0.78            -0.1        0.73        perf-profile.self.cycles-pp.enqueue_entity
      0.47            -0.0        0.42        perf-profile.self.cycles-pp.native_sched_clock
      0.44            -0.0        0.40        perf-profile.self.cycles-pp.menu_select
      0.74            -0.0        0.70        perf-profile.self.cycles-pp.__lock_text_start
      0.38            -0.0        0.34        perf-profile.self.cycles-pp.do_idle
      0.41            -0.0        0.38        perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.26            -0.0        0.24        perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.29            -0.0        0.27        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.45            -0.0        0.42        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.88            -0.0        0.86        perf-profile.self.cycles-pp._find_next_bit
      0.34            -0.0        0.32        perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.20            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.read_tsc
      0.25            -0.0        0.23        perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.28            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.fsnotify
      0.53            -0.0        0.51        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.28            -0.0        0.27        perf-profile.self.cycles-pp.write
      0.11            -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.schedule_idle
      0.34            -0.0        0.33        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.34            -0.0        0.32        perf-profile.self.cycles-pp.cpumask_next_wrap
      0.15 ±  2%      -0.0        0.14        perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.17            -0.0        0.16        perf-profile.self.cycles-pp.ksys_read
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.cpu_startup_entry
      0.14            -0.0        0.13        perf-profile.self.cycles-pp.do_syscall_64
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.tracing_gen_ctx
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.ksys_write
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.rcu_dynticks_eqs_enter
      0.11            -0.0        0.10        perf-profile.self.cycles-pp.copy_page_to_iter
      0.09            -0.0        0.08        perf-profile.self.cycles-pp.current_time
      0.09            -0.0        0.08        perf-profile.self.cycles-pp.sched_clock_cpu
      0.15            -0.0        0.14        perf-profile.self.cycles-pp.pick_next_task
      0.47            +0.0        0.48        perf-profile.self.cycles-pp.select_idle_sibling
      0.56            +0.0        0.58        perf-profile.self.cycles-pp.dequeue_task_fair
      0.60            +0.0        0.62        perf-profile.self.cycles-pp.switch_fpu_return
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.18 ±  2%      +0.0        0.20 ±  3%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.47            +0.0        0.50        perf-profile.self.cycles-pp.task_h_load
      0.47            +0.0        0.50        perf-profile.self.cycles-pp.load_new_mm_cr3
      0.17            +0.0        0.20        perf-profile.self.cycles-pp.place_entity
      0.80            +0.0        0.83        perf-profile.self.cycles-pp.try_to_wake_up
      0.11            +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.check_spread
      0.80            +0.0        0.84        perf-profile.self.cycles-pp.flush_smp_call_function_from_idle
      1.20            +0.0        1.25        perf-profile.self.cycles-pp.__get_user_8
      1.00            +0.0        1.04        perf-profile.self.cycles-pp.sched_ttwu_pending
      1.06            +0.1        1.11        perf-profile.self.cycles-pp.mutex_lock
      2.09            +0.1        2.14        perf-profile.self.cycles-pp.__switch_to_asm
      0.88            +0.1        0.94        perf-profile.self.cycles-pp.migrate_task_rq_fair
      1.91            +0.1        1.96        perf-profile.self.cycles-pp.llist_add_batch
      1.28            +0.1        1.34        perf-profile.self.cycles-pp.mutex_unlock
      1.13            +0.1        1.19        perf-profile.self.cycles-pp.set_task_cpu
      1.68            +0.1        1.74        perf-profile.self.cycles-pp.main
      0.94            +0.1        1.01        perf-profile.self.cycles-pp.send_call_function_single_ipi
      1.19            +0.1        1.27        perf-profile.self.cycles-pp.llist_reverse_order
      3.03            +0.1        3.11        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.69            +0.1        1.78        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      1.75            +0.1        1.85        perf-profile.self.cycles-pp.copy_user_generic_unrolled
      1.59            +0.1        1.69        perf-profile.self.cycles-pp.__wake_up_common
      1.06            +0.1        1.20        perf-profile.self.cycles-pp.schedule
      4.07            +0.2        4.31        perf-profile.self.cycles-pp.pipe_read
      8.93            +0.7        9.62        perf-profile.self.cycles-pp.mwait_idle_with_hints




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


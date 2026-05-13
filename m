Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAD3D34A6
	for <oe-lkp@lists.linux.dev>; Wed, 13 May 2026 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655299; cv=fail; b=XHZJOWPEtP0ITSASMYe+MnzCg339LHcZmUaSMx6KzN28+dgS3OhgLePCY6gARE4ageewMV3W0fnKQzaPm5tNrQVx6rOcHfEcSbng7PpnKZB84bcNAVqsJp8v4d9Af+rzVrqhnFW/mgHU5pchQk0XmBYltggzzrHWDV/TqeT5dBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655299; c=relaxed/simple;
	bh=B17hQQUpVtFkXNiFEhNXJlAsOWrCrBTx/C68WsnUX6Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hdr1/M+g+kWslbUxyAw0A7fNUX1izPqu+qjbfcpV6BsSMF4C/CT0kqTdxwbSM3r3/Hd19EmvByEbFAQ0rESra89fVKJdccvXnscGlT6MoSQD17dsstLaWO7de9gfUhPchNVmjtoSqy2pSDEs76xedc1QdKKZbQ4DQMX4yjsqAv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGvzUxi2; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGvzUxi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778655293; x=1810191293;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=B17hQQUpVtFkXNiFEhNXJlAsOWrCrBTx/C68WsnUX6Q=;
  b=gGvzUxi2cQPI7SpoXnCzo5UvhRQHqaXWIDzTvOcPYqddfU9aL2/Pe2lS
   wYEEya0wpLYs97xA9YoW6dzulkOm1FUnYE3y5wYTKCEm60TGYGmhq+XZG
   jkgZeU+t/AdDkKy6O8iW7Ld3dJ7QBxU1h7ypCY3mMsEhvW6Oye2/1u1lW
   w4QXhvtS0j8k9ewfP+NwDpgsw0HRQSRLLaIzuvC1POT8QwR0KCTfDS1zP
   +Rnx6FC71dz/rxESMARQaCylM3aTwB6XoNm+rBpBNlI88UCMOSM5NxyWw
   VOwKmdQjjNhYaZ0sZfiudjO8l77aeb35vS9wLWBRDYZ7+3u6naftzjXe1
   g==;
X-CSE-ConnectionGUID: bKvj9YfHQZe4LiqVaEdpgQ==
X-CSE-MsgGUID: QgZHquSuS9uwfZkHOmQyXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83188396"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83188396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:54:52 -0700
X-CSE-ConnectionGUID: /rB+eJNNRgauLmZbnBNiEA==
X-CSE-MsgGUID: R5kG5VO4TrS5FWdiu2jXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231607879"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:54:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 23:54:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 23:54:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 23:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhF8fdILuokBYX5ACnWA+jadIg5CPapGcqTmBX7q5wKwZFaw0fGqfWjjLlOHabSRNa4SHjnRN/rr+onH3CJwda/Xlvh8mNgQqY42mIbqbT6x0Kf924M4VZ0QknxZfsDHqIOoSF1sxlxAxHbt3PejlmLf7OYhkszqklLP2YSVld5533+jAZostXNWSDt0NOQRXVDy2bEVfkbGLGcC60kYneyHgFpn3Aduh/q5kNzx5XwOtCV5yBXZXuaIAoLKVllpNj/UwPjsddvJkBNqz9GFtDTYQJxEs8oiDHzE/pOde8fc/nbpQvQlijG3Na2X7XkBXShk4A90jsbYQyR4Nwl0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g99ERVG9zJhkbp3InkU+S1ynm6YSIjFSVNrN9BO8lcU=;
 b=JOPf0uka1nJHqdvrsBsI4FNkd+1B7wu4WupIDiG3N4u4DrwHtf29CpBPJbFlSuMAgZe3hDjWI6YgyCpFQyMoCFkj1WgPAbb12ULbyWURhvB7OFLL0k8OvCaJNOMlNyinUqSiY4k6NNXxDlPqT0HPo1Vb/f34pFSQsC52WwPnKsA2vaIv96jbjVG3bL4qt/ZVXrOMiRKNK89vfXNAf3rgyAQMUdI1/3I8VVQmzpaDA9faA25q3YQG2/jHK2nih7QYfo4fq48EQuaiK0zQA1RK1y1VPcsRd8BLf84KvIA4MVBCRWGQUVMkZY8ykAP/KgjAQqkK0BTFDn3hJ53jZYONzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LVUPR11MB9565.namprd11.prod.outlook.com (2603:10b6:408:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 06:54:38 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.019; Wed, 13 May 2026
 06:54:38 +0000
Date: Wed, 13 May 2026 14:54:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Breno Leitao <leitao@debian.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Tejun Heo <tj@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [workqueue]  4cdc8a7389: stress-ng.ioprio.ops_per_sec
 75.6% regression
Message-ID: <202605131420.3b94d5d1-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LVUPR11MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: d21883bb-910c-44ef-2af8-08deb0bc7fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: /xmqeGlFN9fPYxqQIWanRDFoqY3rx3DsT7v9TiSwEeHSpJJ1d7g8evCtPAbtUYwwo2vqsdZU/iabc0YOAPz2yLn3xTQUwnpyKnY5nUZZVOrE9Xy7fKM6gIf0bVvCjUYMzYX+htezHo8zwgGaVEhQSH1AwU3EbADueRoQ187W6qTiuoyVvWVYfX1Db2rmqQpIcyU3lCIzUmRf4UzZAQuhgCzQm7qGX0YPDG3gWN/MrYKCpJrTOj9CRilQjj/IfhCNuf9UM3jnosevam9z5PCcQOK1KMe9senQKGb9uvsJTVvFZMgaiIDJjd9l795yScblM+0VR5x6HKol1NrYjHMLsfvjPC0gjopn3TotcWjf5Y7sm/SSVsxG+GrGiYuLAoLkIp2krfk+aIA/oRedum+/Fdn8Cm4BRquwTp3U9RHFLReWEl54+Zuw7ZO0X2n4OLFHMAoycxHK+/AjH7lM9kFuKOvfSkpPIUSfpC0CFd5FL2hT07HY7kJ1tHI9ZOSOmrvTtPNHym8KDNhrBAt6hYc1ffy8nNGuEHPRWYH2NJB4rbGECYcyNfkDKufDqdS7Ll6+NeM8LZQD8cuYDOcv5OnWUPNpJZ0ZubscObxJ+ob8XXbGljZVlTQZSU+xNc5JXiDkDhy0xYU+rBCCjfZAbgdOQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b1bA4QQJkBCbr5f04eMUhuu6uOlyLYHhg/jv6OJresRn8/Pt2nLKpGI+Ad?=
 =?iso-8859-1?Q?hve3xpY9Tw7EJdNqsXmC5arQQ5ExZb8yc6fgrldBYhfxCfGAdO/CT/jOWK?=
 =?iso-8859-1?Q?3NXnAdN0rS5f8VFsahZY/YAbOwh8z8+weuSoE40l0/zSzBuu/jrmEQ/yG0?=
 =?iso-8859-1?Q?in3OmtAxoI2iMVdeX9+lcM0dXjMJqzqZhkFdyP2FrV+dljd4oM16KSATv9?=
 =?iso-8859-1?Q?4SGy+I32ijZ0/PBgzrJeaiLQLM37zfWPyRcgDxnte86HF9tWOme1dZbSaD?=
 =?iso-8859-1?Q?DDpUqYTiDQM7TSTj/1w25BauQKJnh5ZWhwv79W8TzIdPPFMfurAt0zUb/k?=
 =?iso-8859-1?Q?8PblAWY2KoBjd9lja4dDuFhFbAas63RKOuMVi4RVG7ciT+eaFPK87mR1JL?=
 =?iso-8859-1?Q?f3F5g3FREKK2Miud83rXXm7bUZRCluxTj0AfCPUj07wcjeDhRVeDCZEKnb?=
 =?iso-8859-1?Q?NhDdEXFLVlQJ/ifOHJaqihv1uPAM4gJmHYYemEPaiHt7DpymBxP7FHr1dq?=
 =?iso-8859-1?Q?kVH1buJuHDMQVms24WapDfp6aVztcRCm84CnLWs6TMrfNN6NSdgCEhI/As?=
 =?iso-8859-1?Q?Di4KZrHwwa94JlzuoZN2OSvtmU8KzmlzPa5O73mk2s73JDiT2jcARiBnJ1?=
 =?iso-8859-1?Q?NvFF2gEkDE0QYsOHTaFGidPaOtfyG3pE4Ul4+z6cafYys3D9RBcGWKnMj9?=
 =?iso-8859-1?Q?3OwhRt6yQCUUBIF9OpJ4NyaFwSBuNQBuOzX0iis0totRuvvH1tGIkk4MVH?=
 =?iso-8859-1?Q?rlGfanCFOhcYITIAu/kNo4k8JXeYLRIwGMtEztKzqWpB908PqcCPXTNDuH?=
 =?iso-8859-1?Q?VPLFglQJsXLEsHeRgFj8Kz7tBsAQZwLNMMH7esUk7bcdJrEsshyH0rF5Pc?=
 =?iso-8859-1?Q?gTHVEZvaITOouGa/mbXb0Wl4lWWSelJXx631KPY9jS5I7V7jLgh7/kemlw?=
 =?iso-8859-1?Q?whkJBaFh0W45KZT2q+P49TFrKvFUFVJQE2u0B1MS3MTZ9KRh0HxISDsVcn?=
 =?iso-8859-1?Q?TVEwRgRaXLnj9ARZTtGS1mcbP/0L9ZXPj1KOqhaSZJZKACGh+jdo7wOUng?=
 =?iso-8859-1?Q?n+D2YyZcreTlCMfnL7+1N1Vf0oUZ8SXTSvMOQq+cKCE6sJFRcYoSUCFg3j?=
 =?iso-8859-1?Q?2AmrOyYdIHgcK47Bc/8yzPTvU+C5tQ9Brj6ScqtlgD/qmbRFW3QkVo1FMt?=
 =?iso-8859-1?Q?98Sba3ZFDSQHRAFMxjNdONVndqcQ85qF3wq4B33fcNCoG+vmu+vqKO0lJy?=
 =?iso-8859-1?Q?F7ATkjb2y4lcJKk10FxOZooZ4PnhQ6bmGUs1RUFJUY7xShgj5p5H1XoqTJ?=
 =?iso-8859-1?Q?EAaRG7Eb+CWP5ABuABqUa45FvYpD4n26nqZt6MF+EdjC78M4p8mLo4vmQ4?=
 =?iso-8859-1?Q?44RSM9OpKj7u6mWywN+0G03s0fz52KVpYSfWuPh9y7Jvzmhv1iZJImxs1u?=
 =?iso-8859-1?Q?AiylCNnEd5I35Rb3TCZT9vsXCQ1Q+7u8Jrk2QrzUenRwaDpGSUoKMr3DEf?=
 =?iso-8859-1?Q?bAb6AMw2HfndCWnUdg0NvSlZo0rQXc3Bsz4ynMRV/UO2EM0CPQJBUwzhHC?=
 =?iso-8859-1?Q?6l1QjFPQHoQc9NarsfVln4LhDxClnXEUJBnqRpComlN7GhYZHG+s/mahf4?=
 =?iso-8859-1?Q?gEcQA/Vxdka2VwOwoU7av9IohuixundrytC3dxZMYqsDnYgmLeNV/cW5dZ?=
 =?iso-8859-1?Q?SRSg4Ku3Mwxmd59R+q4V37JR9h9S5P0dPvrbZL1lvY+pC8TI/a5WE4Sw0U?=
 =?iso-8859-1?Q?AExODMY0RTk8Pmo5Q/5XhT9PgdtCC8JFsJLWzsRbCysKP2t8IEMSeVX7z1?=
 =?iso-8859-1?Q?99ZZEzpPdA=3D=3D?=
X-Exchange-RoutingPolicyChecked: USjQiypAeQkebDs2i90l6nCGX1IfdZRpzcKtYz2zKWwXW0vZyl5lR/LYa/wtcCQQCjl+8/SkDV24PKNUxvYyugMKw7JuM9OxZ2QJqc8g3IsxNmuS2ZAC9X+2MarhsbXuNQz1VaZQD5HHuyKVtLdtaQK5/UGd5a27GJf4Ws33zqh4PyNpZbcuTkXAvOzYj84mnQ1j9sS9ngaCRIGo33ooU8dXhqhhcBhXXDk33SfikEBPKoFMRqwTzrslaDp0On+htNKQd8c3KfnMFsnOPHdrZEFLGwnwqmfBcs/BlyniNP6E0R9+pNwrtwsQ+vi0xYz/4a8g6s1h6ijAddfZ0AeZnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d21883bb-910c-44ef-2af8-08deb0bc7fa6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:54:37.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLph7XZ7nEi7yoaD1cYeZ1VX7QweG2Wk0hIyubxJV0hAGdiOZK55zPNbJraWz7ChYDAYFLbLcEsNhhejzx5zGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9565
X-OriginatorOrg: intel.com



Hello,

below report is just FYI.

as we understand, 4cdc8a7389 only changes the default affinity scope. we don't
have enough knowledge to analyze the connection to stress-ng.ioprio performance
changes. so just report out what we observed in our tests.


kernel test robot noticed a 75.6% regression of stress-ng.ioprio.ops_per_sec on:


commit: 4cdc8a7389d5025051f6c4a60fb5b7cb9b7960bb ("workqueue: set WQ_AFFN_CACHE_SHARD as the default affinity scope")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      5d6919055dec134de3c40167a490f33c74c12581]
[still regression on linux-next/master e98d21c170b01ddef366f023bbfcf6b31509fa83]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory
parameters:

	nr_threads: 100%
	disk: 1SSD
	testtime: 60s
	fs: ext4
	test: ioprio
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605131420.3b94d5d1-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260513/202605131420.3b94d5d1-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/1SSD/ext4/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp4/ioprio/stress-ng/60s

commit: 
  5920d046f7 ("workqueue: add WQ_AFFN_CACHE_SHARD affinity scope")
  4cdc8a7389 ("workqueue: set WQ_AFFN_CACHE_SHARD as the default affinity scope")

5920d046f7ae3bf9 4cdc8a7389d5025051f6c4a60fb 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    127273 ±  3%     -75.8%      30760 ± 25%  stress-ng.ioprio.ops
      2088 ±  3%     -75.6%     510.47 ± 24%  stress-ng.ioprio.ops_per_sec
  18359430 ±  3%     -75.7%    4458308 ± 25%  stress-ng.time.file_system_outputs
      7826 ±  4%     -86.8%       1030 ± 20%  stress-ng.time.involuntary_context_switches
     95114           -11.9%      83760 ±  3%  stress-ng.time.minor_page_faults
      4602           -97.0%     137.33 ± 50%  stress-ng.time.percent_of_cpu_this_job_got
      2810 ±  2%     -97.1%      80.40 ± 51%  stress-ng.time.system_time
     16.87 ±  4%     -80.2%       3.33 ± 34%  stress-ng.time.user_time
   6844199 ±  2%     -74.9%    1720699 ± 39%  stress-ng.time.voluntary_context_switches
 1.292e+10           +22.1%  1.578e+10        cpuidle..time
   8728994 ±  2%     -60.8%    3422264 ± 25%  cpuidle..usage
      5.41 ±  5%    +376.9%      25.79 ± 22%  iostat.cpu.iowait
     18.18 ±  2%     -95.2%       0.87 ± 39%  iostat.cpu.system
   1736075 ±  4%     -62.2%     656465 ± 30%  numa-numastat.node0.local_node
   1876262 ±  2%     -57.8%     791368 ± 28%  numa-numastat.node0.numa_hit
   1863627 ±  6%     -60.2%     741620 ± 24%  numa-numastat.node1.local_node
   1987470 ±  4%     -56.2%     870821 ± 26%  numa-numastat.node1.numa_hit
    843.00 ±  4%     -91.2%      73.83 ± 91%  perf-c2c.DRAM.local
      6969 ±  2%     -92.4%     529.00 ±113%  perf-c2c.DRAM.remote
      5935 ±  2%     -94.4%     331.50 ± 36%  perf-c2c.HITM.local
      3494 ±  3%     -92.9%     249.00 ±114%  perf-c2c.HITM.remote
      9429 ±  2%     -93.8%     580.50 ± 67%  perf-c2c.HITM.total
      5.57 ±  5%     +21.0       26.61 ± 22%  mpstat.cpu.all.iowait%
      0.72 ±  3%      -0.6        0.08 ± 25%  mpstat.cpu.all.irq%
      0.16 ±  2%      -0.1        0.04 ± 23%  mpstat.cpu.all.soft%
     17.85 ±  2%     -17.1        0.76 ± 42%  mpstat.cpu.all.sys%
      0.45 ±  3%      -0.4        0.07 ± 21%  mpstat.cpu.all.usr%
     80.00           -95.5%       3.63 ± 47%  mpstat.max_utilization_pct
      7.10 ±  3%    +149.4%      17.71 ± 18%  perf-sched.total_wait_and_delay.average.ms
    521578 ±  4%     -64.6%     184722 ± 30%  perf-sched.total_wait_and_delay.count.ms
      6.95 ±  4%    +152.7%      17.56 ± 18%  perf-sched.total_wait_time.average.ms
      7.10 ±  3%    +149.4%      17.71 ± 18%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    521578 ±  4%     -64.6%     184722 ± 30%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      6.95 ±  4%    +152.7%      17.56 ± 18%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5503 ±  4%     -51.5%       2669 ± 39%  numa-meminfo.node0.Dirty
   1488299 ±  5%     -62.6%     556596 ± 89%  numa-meminfo.node0.Inactive
   1488299 ±  5%     -62.6%     556596 ± 89%  numa-meminfo.node0.Inactive(file)
    134114 ± 83%     -94.0%       8039 ± 43%  numa-meminfo.node0.Shmem
      5604 ±  3%     -47.4%       2947 ± 38%  numa-meminfo.node1.Dirty
   1505432           -54.9%     678339 ± 69%  numa-meminfo.node1.Inactive
   1505432           -54.9%     678339 ± 69%  numa-meminfo.node1.Inactive(file)
    235622 ± 19%     -74.4%      60404 ± 66%  numa-meminfo.node1.Mapped
    429330 ± 27%     -67.3%     140508 ± 29%  numa-meminfo.node1.Shmem
      5.35 ±  5%    +381.3%      25.77 ± 22%  vmstat.cpu.wa
    385214 ±  3%     -48.7%     197600 ± 18%  vmstat.io.bo
     95273 ±  2%    +312.4%     392918 ± 15%  vmstat.memory.buff
   7551965           -33.0%    5059648 ±  4%  vmstat.memory.cache
  53891342            +5.4%   56804055        vmstat.memory.free
     15.13 ± 15%   +1427.7%     231.18 ±  3%  vmstat.procs.b
     31.56 ± 12%     -91.7%       2.63 ± 40%  vmstat.procs.r
    220333 ±  2%     -63.7%      80070 ± 26%  vmstat.system.cs
    177161           -81.0%      33584 ± 22%  vmstat.system.in
    758.33           -93.6%      48.33 ± 38%  turbostat.Avg_MHz
     20.52 ±  2%     -19.3        1.26 ± 38%  turbostat.Busy%
      3714            +2.9%       3821        turbostat.Bzy_MHz
      0.58 ±  5%      -0.3        0.28 ± 15%  turbostat.C1E%
     77.81           +19.7       97.52        turbostat.C6P%
      1.03 ±  5%     -47.2%       0.54 ± 16%  turbostat.CPU%c1
     71.85           +34.6%      96.70        turbostat.CPU%c6
      0.09          +148.1%       0.22 ± 12%  turbostat.IPC
  13717342 ±  2%     -81.9%    2487380 ± 17%  turbostat.IRQ
   2543604 ±  2%     -92.5%     191525 ± 37%  turbostat.NMI
      0.00 ±141%  +26600.0%       0.89 ± 17%  turbostat.Pkg%pc6
     42.67            -7.0%      39.67 ±  3%  turbostat.PkgTmp
    176.29           -29.5%     124.32 ±  3%  turbostat.PkgWatt
    413.65           -17.2%     342.43        turbostat.SysWatt
   1281499           -34.1%     843891 ±  5%  meminfo.Active
   1281483           -34.1%     843875 ±  5%  meminfo.Active(anon)
     94233 ±  2%    +312.4%     388579 ± 15%  meminfo.Buffers
   7276429           -33.6%    4834468 ±  5%  meminfo.Cached
   3825136           -11.1%    3400293        meminfo.Committed_AS
     10958           -48.3%       5666 ± 12%  meminfo.Dirty
   2965455 ±  2%     -58.3%    1236879 ± 11%  meminfo.Inactive
   2965455 ±  2%     -58.3%    1236879 ± 11%  meminfo.Inactive(file)
    307801           -24.1%     233715 ±  3%  meminfo.KReclaimable
    289525 ±  4%     -69.2%      89094 ±  5%  meminfo.Mapped
  53840468            +5.5%   56783657        meminfo.MemFree
  11792675           -25.0%    8849486 ±  2%  meminfo.Memused
    307801           -24.1%     233715 ±  3%  meminfo.SReclaimable
    567730 ±  3%     -73.9%     148362 ± 28%  meminfo.Shmem
    834827           -10.2%     749631        meminfo.Slab
  12114122           -23.1%    9315335        meminfo.max_used_kB
   1144885 ±  3%     -77.3%     259883 ± 80%  numa-vmstat.node0.nr_dirtied
      1377 ±  4%     -51.7%     665.02 ± 40%  numa-vmstat.node0.nr_dirty
    371931 ±  5%     -62.6%     139007 ± 89%  numa-vmstat.node0.nr_inactive_file
     33532 ± 83%     -94.0%       2010 ± 43%  numa-vmstat.node0.nr_shmem
   1143795 ±  3%     -77.4%     258846 ± 80%  numa-vmstat.node0.nr_written
    371932 ±  5%     -62.6%     139007 ± 89%  numa-vmstat.node0.nr_zone_inactive_file
      1380 ±  4%     -45.0%     759.18 ± 48%  numa-vmstat.node0.nr_zone_write_pending
   1876295 ±  2%     -57.8%     791560 ± 28%  numa-vmstat.node0.numa_hit
   1736108 ±  4%     -62.2%     656657 ± 30%  numa-vmstat.node0.numa_local
   1156961 ±  3%     -74.0%     301336 ± 69%  numa-vmstat.node1.nr_dirtied
      1402 ±  4%     -47.9%     731.35 ± 38%  numa-vmstat.node1.nr_dirty
    376239           -55.0%     169294 ± 69%  numa-vmstat.node1.nr_inactive_file
     58844 ± 19%     -74.3%      15114 ± 66%  numa-vmstat.node1.nr_mapped
    107371 ± 27%     -67.3%      35143 ± 29%  numa-vmstat.node1.nr_shmem
   1155862 ±  3%     -74.0%     300209 ± 69%  numa-vmstat.node1.nr_written
    376239           -55.0%     169295 ± 69%  numa-vmstat.node1.nr_zone_inactive_file
      1407 ±  4%     -38.4%     867.09 ± 43%  numa-vmstat.node1.nr_zone_write_pending
   1987388 ±  4%     -56.2%     871468 ± 26%  numa-vmstat.node1.numa_hit
   1863545 ±  6%     -60.2%     742267 ± 24%  numa-vmstat.node1.numa_local
 3.891e+09           -86.2%  5.359e+08 ± 20%  perf-stat.i.branch-instructions
      1.96            +5.1        7.09 ±  3%  perf-stat.i.branch-miss-rate%
  75642806 ±  2%     -58.3%   31567246 ± 24%  perf-stat.i.branch-misses
      5.21            -3.4        1.78 ± 48%  perf-stat.i.cache-miss-rate%
  33947651           -83.8%    5514752 ± 71%  perf-stat.i.cache-misses
 6.555e+08 ±  2%     -60.4%  2.596e+08 ± 29%  perf-stat.i.cache-references
    233539 ±  2%     -63.8%      84450 ± 27%  perf-stat.i.context-switches
     11.51           -47.3%       6.07 ± 11%  perf-stat.i.cpi
 1.904e+11 ±  2%     -93.2%  1.287e+10 ± 36%  perf-stat.i.cpu-cycles
      5127 ±  2%     -92.3%     393.88 ±  5%  perf-stat.i.cpu-migrations
  1.68e+10           -84.4%   2.62e+09 ± 19%  perf-stat.i.instructions
      0.09          +121.0%       0.20 ±  9%  perf-stat.i.ipc
      0.17 ± 18%    -100.0%       0.00        perf-stat.i.metric.K/sec
      1.95 ±  2%      +3.9        5.87 ±  3%  perf-stat.overall.branch-miss-rate%
      5.17            -3.2        1.93 ± 42%  perf-stat.overall.cache-miss-rate%
     11.25           -57.3%       4.80 ± 13%  perf-stat.overall.cpi
      5614           -48.0%       2919 ± 32%  perf-stat.overall.cycles-between-cache-misses
      0.09          +138.1%       0.21 ± 11%  perf-stat.overall.ipc
 3.834e+09 ±  2%     -86.3%  5.247e+08 ± 20%  perf-stat.ps.branch-instructions
  74683573 ±  2%     -58.5%   30990265 ± 24%  perf-stat.ps.branch-misses
  33187741 ±  2%     -83.7%    5393405 ± 71%  perf-stat.ps.cache-misses
 6.423e+08 ±  2%     -60.3%   2.55e+08 ± 29%  perf-stat.ps.cache-references
    229849 ±  3%     -63.9%      83019 ± 28%  perf-stat.ps.context-switches
 1.863e+11 ±  2%     -93.2%  1.264e+10 ± 36%  perf-stat.ps.cpu-cycles
      5087 ±  3%     -92.4%     386.81 ±  5%  perf-stat.ps.cpu-migrations
 1.656e+10 ±  2%     -84.5%  2.565e+09 ± 19%  perf-stat.ps.instructions
 1.021e+12 ±  2%     -84.6%  1.571e+11 ± 19%  perf-stat.total.instructions
    320449           -34.2%     210967 ±  5%  proc-vmstat.nr_active_anon
    178761            -2.5%     174267        proc-vmstat.nr_anon_pages
   2301847 ±  3%     -75.6%     561212 ± 24%  proc-vmstat.nr_dirtied
      2741           -48.7%       1406 ± 12%  proc-vmstat.nr_dirty
   1409183            +2.2%    1439532        proc-vmstat.nr_dirty_background_threshold
   2821813            +2.2%    2882585        proc-vmstat.nr_dirty_threshold
   1843011           -29.2%    1305622 ±  3%  proc-vmstat.nr_file_pages
  13459604            +5.5%   14196120        proc-vmstat.nr_free_pages
  13382203            +5.3%   14088641        proc-vmstat.nr_free_pages_blocks
    741642 ±  2%     -58.3%     309064 ± 11%  proc-vmstat.nr_inactive_file
     45612            +1.5%      46278        proc-vmstat.nr_kernel_stack
     72423 ±  4%     -69.3%      22234 ±  5%  proc-vmstat.nr_mapped
    142005 ±  2%     -73.9%      37103 ± 28%  proc-vmstat.nr_shmem
     76958           -24.1%      58431 ±  3%  proc-vmstat.nr_slab_reclaimable
    131759            -2.1%     128978        proc-vmstat.nr_slab_unreclaimable
     19.97 ± 16%   +1055.7%     230.83 ±  2%  proc-vmstat.nr_writeback
   2301298 ±  3%     -75.7%     559055 ± 25%  proc-vmstat.nr_written
    320449           -34.2%     210967 ±  5%  proc-vmstat.nr_zone_active_anon
    741642 ±  2%     -58.3%     309064 ± 11%  proc-vmstat.nr_zone_inactive_file
      2756           -40.6%       1636 ± 10%  proc-vmstat.nr_zone_write_pending
     16690 ± 13%     -78.0%       3667 ± 40%  proc-vmstat.numa_hint_faults
     12314 ± 19%     -78.7%       2626 ± 66%  proc-vmstat.numa_hint_faults_local
   3868549           -56.9%    1667900 ±  7%  proc-vmstat.numa_hit
   3604519           -61.1%    1403796 ±  8%  proc-vmstat.numa_local
      7864 ±101%     -86.8%       1038 ± 45%  proc-vmstat.numa_pages_migrated
     28916 ± 21%     -55.4%      12887 ± 34%  proc-vmstat.numa_pte_updates
   3968875           -55.8%    1755531 ±  7%  proc-vmstat.pgalloc_normal
    704248            -5.3%     666744        proc-vmstat.pgfault
   3475694           -57.6%    1474961 ±  8%  proc-vmstat.pgfree
      7864 ±101%     -86.8%       1038 ± 45%  proc-vmstat.pgmigrate_success
  25102282 ±  3%     -49.4%   12690525 ± 18%  proc-vmstat.pgpgout
     35.19 ±  5%     -89.2%       3.79 ± 60%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.10 ±  9%     -77.9%       0.02 ± 15%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.27 ±  3%     -46.6%       0.15 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.10 ±  9%     -77.9%       0.02 ± 15%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.27 ±  2%     -46.4%       0.15 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
     93331 ± 12%     -92.0%       7437 ± 33%  sched_debug.cfs_rq:/.load.avg
    208047 ±  4%     -71.0%      60236 ± 18%  sched_debug.cfs_rq:/.load.stddev
     23.67 ± 99%    -100.0%       0.00        sched_debug.cfs_rq:/.load_avg.min
      0.10 ±  9%     -77.9%       0.02 ± 15%  sched_debug.cfs_rq:/.nr_queued.avg
      0.27 ±  3%     -46.6%       0.15 ±  8%  sched_debug.cfs_rq:/.nr_queued.stddev
    141.91 ±  4%     -60.2%      56.42 ±  4%  sched_debug.cfs_rq:/.runnable_avg.avg
     30.42 ± 85%    -100.0%       0.00        sched_debug.cfs_rq:/.runnable_avg.min
    139.15 ±  3%     -59.9%      55.81 ±  5%  sched_debug.cfs_rq:/.util_avg.avg
     17.26 ± 14%     -85.6%       2.48 ± 66%  sched_debug.cfs_rq:/.util_est.avg
     56.76 ± 24%     -56.1%      24.89 ± 51%  sched_debug.cfs_rq:/.util_est.stddev
     35.19 ±  5%     -89.2%       3.79 ± 60%  sched_debug.cfs_rq:/.zero_vruntime.min
    201774 ± 23%     -59.8%      81200 ± 20%  sched_debug.cpu.avg_idle.min
    110271 ± 10%     +22.9%     135555 ±  6%  sched_debug.cpu.avg_idle.stddev
      1542           -16.0%       1295 ±  3%  sched_debug.cpu.clock_task.stddev
    947.95 ± 10%     -82.7%     164.19 ± 14%  sched_debug.cpu.curr->pid.avg
      2516 ±  3%     -52.5%       1194 ±  6%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 84%     -67.0%       0.00 ± 13%  sched_debug.cpu.next_balance.stddev
      0.10 ±  9%     -80.6%       0.02 ± 16%  sched_debug.cpu.nr_running.avg
      0.28 ±  3%     -52.4%       0.13 ±  8%  sched_debug.cpu.nr_running.stddev
     28936 ±  2%     -61.4%      11160 ± 23%  sched_debug.cpu.nr_switches.avg
     18895 ± 11%     -97.5%     478.75 ± 12%  sched_debug.cpu.nr_switches.min
      2975 ± 33%    +346.7%      13293 ± 12%  sched_debug.cpu.nr_switches.stddev
      0.43 ±  2%     +18.2%       0.50        sched_debug.cpu.nr_uninterruptible.avg
    225.58 ± 14%     -66.1%      76.50 ± 29%  sched_debug.cpu.nr_uninterruptible.max
   -714.67           -97.6%     -17.50        sched_debug.cpu.nr_uninterruptible.min
     51.01 ±  8%     -82.2%       9.09 ± 13%  sched_debug.cpu.nr_uninterruptible.stddev
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.50          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.03          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
     79.78           -52.1       27.66 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     79.78           -52.1       27.67 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     57.37           -40.1       17.31 ± 11%  perf-profile.calltrace.cycles-pp.ext4_sync_file.do_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
     57.40           -40.0       17.42 ± 11%  perf-profile.calltrace.cycles-pp.do_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
     57.40           -40.0       17.44 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
     31.35 ±  2%     -29.4        1.92 ± 21%  perf-profile.calltrace.cycles-pp.jbd2_log_wait_commit.ext4_sync_file.do_fsync.__x64_sys_fsync.do_syscall_64
     29.52 ±  2%     -29.4        0.12 ±223%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.jbd2_log_wait_commit.ext4_sync_file.do_fsync.__x64_sys_fsync
     28.89 ±  2%     -28.8        0.08 ±223%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.jbd2_log_wait_commit.ext4_sync_file.do_fsync
     28.78 ±  2%     -28.8        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait_event.jbd2_log_wait_commit.ext4_sync_file
     17.62           -17.0        0.61 ±223%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_access
     20.46           -16.6        3.84 ± 40%  perf-profile.calltrace.cycles-pp.ext4_dirty_inode.__mark_inode_dirty.file_update_time_flags.ext4_buffered_write_iter.do_iter_readv_writev
     20.59           -16.6        4.01 ± 38%  perf-profile.calltrace.cycles-pp.__mark_inode_dirty.file_update_time_flags.ext4_buffered_write_iter.do_iter_readv_writev.vfs_writev
     20.69           -16.4        4.31 ± 35%  perf-profile.calltrace.cycles-pp.file_update_time_flags.ext4_buffered_write_iter.do_iter_readv_writev.vfs_writev.do_pwritev
     18.48           -16.2        2.32 ± 47%  perf-profile.calltrace.cycles-pp.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.file_update_time_flags.ext4_buffered_write_iter
     18.64 ±  3%     -13.4        5.20 ± 38%  perf-profile.calltrace.cycles-pp.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks.mpage_map_one_extent.mpage_map_and_submit_extent
     21.98           -13.2        8.83 ± 12%  perf-profile.calltrace.cycles-pp.ext4_buffered_write_iter.do_iter_readv_writev.vfs_writev.do_pwritev.do_syscall_64
     22.01           -13.1        8.90 ± 12%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.vfs_writev.do_pwritev.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.15           -12.8        9.36 ± 11%  perf-profile.calltrace.cycles-pp.vfs_writev.do_pwritev.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.00 ±  3%     -12.8        6.23 ± 32%  perf-profile.calltrace.cycles-pp.ext4_map_create_blocks.ext4_map_blocks.mpage_map_one_extent.mpage_map_and_submit_extent.ext4_do_writepages
     22.20           -12.7        9.51 ± 11%  perf-profile.calltrace.cycles-pp.do_pwritev.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.06 ±  3%     -12.7        6.40 ± 31%  perf-profile.calltrace.cycles-pp.ext4_map_blocks.mpage_map_one_extent.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages
     19.08 ±  3%     -12.7        6.42 ± 31%  perf-profile.calltrace.cycles-pp.mpage_map_one_extent.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages.do_writepages
     13.22 ±  5%     -11.9        1.36 ± 77%  perf-profile.calltrace.cycles-pp.ext4_ext_insert_extent.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks.mpage_map_one_extent
     19.44 ±  3%     -11.7        7.72 ± 25%  perf-profile.calltrace.cycles-pp.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages.do_writepages.filemap_writeback
     23.40 ±  3%     -11.2       12.15 ± 15%  perf-profile.calltrace.cycles-pp.ext4_do_writepages.ext4_writepages.do_writepages.filemap_writeback.file_write_and_wait_range
     23.43 ±  3%     -11.2       12.26 ± 14%  perf-profile.calltrace.cycles-pp.ext4_writepages.do_writepages.filemap_writeback.file_write_and_wait_range.ext4_sync_file
     23.46 ±  3%     -11.1       12.34 ± 14%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_writeback.file_write_and_wait_range.ext4_sync_file.do_fsync
     23.52 ±  3%     -11.0       12.51 ± 14%  perf-profile.calltrace.cycles-pp.filemap_writeback.file_write_and_wait_range.ext4_sync_file.do_fsync.__x64_sys_fsync
     24.22 ±  3%      -9.8       14.44 ± 11%  perf-profile.calltrace.cycles-pp.file_write_and_wait_range.ext4_sync_file.do_fsync.__x64_sys_fsync.do_syscall_64
      9.55 ±  2%      -9.1        0.46 ±162%  perf-profile.calltrace.cycles-pp.__ext4_journal_get_write_access.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty
      9.55 ±  2%      -9.1        0.46 ±162%  perf-profile.calltrace.cycles-pp.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode
      9.39 ±  2%      -9.0        0.40 ±169%  perf-profile.calltrace.cycles-pp.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_reserve_inode_write.__ext4_mark_inode_dirty
      9.01 ±  2%      -8.8        0.23 ±223%  perf-profile.calltrace.cycles-pp._raw_spin_lock.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_reserve_inode_write
      9.70 ±  2%      -8.4        1.26 ± 43%  perf-profile.calltrace.cycles-pp.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.file_update_time_flags
      8.61            -8.3        0.31 ±223%  perf-profile.calltrace.cycles-pp.__ext4_handle_dirty_metadata.ext4_do_update_inode.ext4_mark_iloc_dirty.__ext4_mark_inode_dirty.ext4_dirty_inode
      8.60            -8.3        0.31 ±223%  perf-profile.calltrace.cycles-pp.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.ext4_do_update_inode.ext4_mark_iloc_dirty.__ext4_mark_inode_dirty
      8.44            -8.2        0.25 ±223%  perf-profile.calltrace.cycles-pp._raw_spin_lock.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.ext4_do_update_inode.ext4_mark_iloc_dirty
      8.39            -8.2        0.23 ±223%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.ext4_do_update_inode
      8.77            -7.8        1.00 ± 56%  perf-profile.calltrace.cycles-pp.ext4_do_update_inode.ext4_mark_iloc_dirty.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty
      8.78            -7.8        1.01 ± 55%  perf-profile.calltrace.cycles-pp.ext4_mark_iloc_dirty.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.file_update_time_flags
      6.91 ±  4%      -6.6        0.30 ±223%  perf-profile.calltrace.cycles-pp.__ext4_journal_get_write_access.ext4_ext_insert_extent.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks
      6.91 ±  4%      -6.6        0.30 ±223%  perf-profile.calltrace.cycles-pp.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_ext_insert_extent.ext4_ext_map_blocks.ext4_map_create_blocks
      6.82 ±  4%      -6.6        0.26 ±223%  perf-profile.calltrace.cycles-pp.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_ext_insert_extent.ext4_ext_map_blocks
      6.69 ±  4%      -6.5        0.23 ±223%  perf-profile.calltrace.cycles-pp._raw_spin_lock.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_ext_insert_extent
      6.21 ±  6%      -5.9        0.27 ±223%  perf-profile.calltrace.cycles-pp.__ext4_ext_dirty.ext4_ext_insert_extent.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks
      6.15 ±  6%      -5.9        0.25 ±223%  perf-profile.calltrace.cycles-pp.__ext4_handle_dirty_metadata.__ext4_ext_dirty.ext4_ext_insert_extent.ext4_ext_map_blocks.ext4_map_create_blocks
      6.14 ±  6%      -5.9        0.25 ±223%  perf-profile.calltrace.cycles-pp.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.__ext4_ext_dirty.ext4_ext_insert_extent.ext4_ext_map_blocks
      6.02 ±  6%      -5.8        0.21 ±223%  perf-profile.calltrace.cycles-pp._raw_spin_lock.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.__ext4_ext_dirty.ext4_ext_insert_extent
      5.96 ±  6%      -5.8        0.20 ±223%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.__ext4_ext_dirty
      0.53 ±  3%      +0.6        1.09 ±  7%  perf-profile.calltrace.cycles-pp.schedule.jbd2_log_wait_commit.ext4_sync_file.do_fsync.__x64_sys_fsync
      0.00            +0.6        0.58 ± 13%  perf-profile.calltrace.cycles-pp.wake_page_function.__wake_up_common.folio_wake_bit.folio_end_writeback_no_dropbehind.folio_end_writeback
      0.00            +0.6        0.59 ±  9%  perf-profile.calltrace.cycles-pp.__get_next_timer_interrupt.tick_nohz_stop_tick.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle
      0.00            +0.6        0.61 ±  7%  perf-profile.calltrace.cycles-pp.ext4_da_update_reserve_space.ext4_es_insert_extent.ext4_map_create_blocks.ext4_map_blocks.mpage_map_one_extent
      0.00            +0.6        0.61 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_governor_latency_req.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.6        0.63 ± 12%  perf-profile.calltrace.cycles-pp.__remove_hrtimer.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart_sched_tick.tick_nohz_idle_exit
      0.00            +0.7        0.66 ± 12%  perf-profile.calltrace.cycles-pp.ext4_es_insert_delayed_extent.ext4_da_map_blocks.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin
      0.00            +0.7        0.67 ±  5%  perf-profile.calltrace.cycles-pp.__folio_end_writeback.folio_end_writeback_no_dropbehind.folio_end_writeback.ext4_finish_bio.ext4_release_io_end
      0.00            +0.7        0.68 ±  9%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      0.00            +0.7        0.69 ± 15%  perf-profile.calltrace.cycles-pp.blk_mq_dispatch_queue_requests.blk_mq_flush_plug_list.__blk_flush_plug.blk_finish_plug.ext4_do_writepages
      0.00            +0.7        0.69 ±  9%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.7        0.70 ± 12%  perf-profile.calltrace.cycles-pp.__wake_up_common.folio_wake_bit.folio_end_writeback_no_dropbehind.folio_end_writeback.ext4_finish_bio
      0.00            +0.7        0.70 ± 17%  perf-profile.calltrace.cycles-pp.blk_mq_flush_plug_list.__blk_flush_plug.blk_finish_plug.ext4_do_writepages.ext4_writepages
      0.35 ± 70%      +0.7        1.06 ±  8%  perf-profile.calltrace.cycles-pp.__schedule.schedule.jbd2_log_wait_commit.ext4_sync_file.do_fsync
      0.00            +0.7        0.72 ± 17%  perf-profile.calltrace.cycles-pp.__blk_flush_plug.blk_finish_plug.ext4_do_writepages.ext4_writepages.do_writepages
      0.00            +0.7        0.72 ± 17%  perf-profile.calltrace.cycles-pp.blk_finish_plug.ext4_do_writepages.ext4_writepages.do_writepages.filemap_writeback
      0.00            +0.7        0.74 ± 11%  perf-profile.calltrace.cycles-pp.folio_wake_bit.folio_end_writeback_no_dropbehind.folio_end_writeback.ext4_finish_bio.ext4_release_io_end
      0.00            +0.7        0.75 ±  3%  perf-profile.calltrace.cycles-pp.__tmigr_cpu_activate.tmigr_cpu_activate.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle
      0.00            +0.8        0.76 ±  8%  perf-profile.calltrace.cycles-pp.ext4_bio_write_folio.mpage_map_and_submit_buffers.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages
      0.00            +0.8        0.77 ± 10%  perf-profile.calltrace.cycles-pp.mpage_prepare_extent_to_map.ext4_do_writepages.ext4_writepages.do_writepages.filemap_writeback
      0.00            +0.8        0.79 ± 13%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +0.8        0.79 ± 15%  perf-profile.calltrace.cycles-pp.__task_pid_nr_ns.__do_sys_ioprio_get.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +0.8        0.80 ± 10%  perf-profile.calltrace.cycles-pp.find_get_block_common.bdev_getblk.__read_extent_tree_block.ext4_find_extent.ext4_ext_map_blocks
      0.00            +0.8        0.81 ± 10%  perf-profile.calltrace.cycles-pp.bdev_getblk.__read_extent_tree_block.ext4_find_extent.ext4_ext_map_blocks.ext4_map_create_blocks
      0.55 ±  2%      +0.8        1.36 ±  8%  perf-profile.calltrace.cycles-pp.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range.file_write_and_wait_range.ext4_sync_file
      0.00            +0.8        0.81 ±  8%  perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
      0.00            +0.8        0.82 ± 10%  perf-profile.calltrace.cycles-pp.__read_extent_tree_block.ext4_find_extent.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks
      0.00            +0.8        0.82 ± 12%  perf-profile.calltrace.cycles-pp.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle
      0.00            +0.9        0.88 ±  4%  perf-profile.calltrace.cycles-pp.tmigr_cpu_activate.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle.cpu_startup_entry
      0.58            +0.9        1.46 ±  8%  perf-profile.calltrace.cycles-pp.folio_wait_writeback.__filemap_fdatawait_range.file_write_and_wait_range.ext4_sync_file.do_fsync
      0.00            +0.9        0.88 ±  6%  perf-profile.calltrace.cycles-pp.__get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call
      0.00            +0.9        0.89 ± 16%  perf-profile.calltrace.cycles-pp.sched_balance_update_blocked_averages._nohz_idle_balance.handle_softirqs.do_softirq.flush_smp_call_function_queue
      0.00            +1.0        0.95 ± 11%  perf-profile.calltrace.cycles-pp.refresh_cpu_vm_stats.tick_nohz_stop_tick.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle
      0.00            +1.0        0.97 ± 26%  perf-profile.calltrace.cycles-pp.__ext4_mark_inode_dirty.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.ext4_end_io_end.ext4_end_io_rsv_work
      0.00            +1.0        0.99 ± 17%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_domains._nohz_idle_balance.handle_softirqs.do_softirq
      0.00            +1.0        1.00 ± 12%  perf-profile.calltrace.cycles-pp.hrtimer_cancel.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle.cpu_startup_entry
      0.00            +1.0        1.01 ±  5%  perf-profile.calltrace.cycles-pp.ext4_es_insert_extent.ext4_map_create_blocks.ext4_map_blocks.mpage_map_one_extent.mpage_map_and_submit_extent
      0.00            +1.0        1.02 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle.cpu_startup_entry
      0.00            +1.1        1.09 ±  9%  perf-profile.calltrace.cycles-pp.__schedule.schedule.io_schedule.folio_wait_bit_common.folio_wait_writeback
      0.65 ±  2%      +1.1        1.74 ±  8%  perf-profile.calltrace.cycles-pp.__filemap_fdatawait_range.file_write_and_wait_range.ext4_sync_file.do_fsync.__x64_sys_fsync
      0.56 ±  2%      +1.1        1.67 ±  7%  perf-profile.calltrace.cycles-pp.ext4_io_submit.ext4_do_writepages.ext4_writepages.do_writepages.filemap_writeback
      0.00            +1.1        1.11 ± 10%  perf-profile.calltrace.cycles-pp.schedule.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.00            +1.1        1.14 ± 10%  perf-profile.calltrace.cycles-pp.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range.file_write_and_wait_range
      0.00            +1.2        1.16 ± 16%  perf-profile.calltrace.cycles-pp.sched_balance_domains._nohz_idle_balance.handle_softirqs.do_softirq.flush_smp_call_function_queue
      0.00            +1.2        1.17 ± 12%  perf-profile.calltrace.cycles-pp.ext4_find_extent.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks.ext4_convert_unwritten_extents
      0.00            +1.2        1.18 ±  8%  perf-profile.calltrace.cycles-pp.mpage_map_and_submit_buffers.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages.do_writepages
      0.00            +1.2        1.20 ± 25%  perf-profile.calltrace.cycles-pp.ext4_split_convert_extents.ext4_ext_handle_unwritten_extents.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks
      0.00            +1.2        1.23 ± 24%  perf-profile.calltrace.cycles-pp.ext4_ext_handle_unwritten_extents.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks.ext4_convert_unwritten_extents
      0.00            +1.3        1.28 ± 11%  perf-profile.calltrace.cycles-pp.__filemap_get_folio_mpol.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      0.00            +1.3        1.29 ± 16%  perf-profile.calltrace.cycles-pp.need_update.quiet_vmstat.tick_nohz_stop_tick.tick_nohz_idle_stop_tick.cpuidle_idle_call
      0.00            +1.3        1.30 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +1.3        1.30 ± 11%  perf-profile.calltrace.cycles-pp.ext4_da_map_blocks.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write
      0.00            +1.3        1.33 ± 11%  perf-profile.calltrace.cycles-pp.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      0.00            +1.3        1.34 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule_idle.do_idle
      0.17 ±141%      +1.4        1.52 ±  8%  perf-profile.calltrace.cycles-pp.submit_bio_noacct_nocheck.ext4_io_submit.ext4_do_writepages.ext4_writepages.do_writepages
      0.70 ±  2%      +1.4        2.11 ±  5%  perf-profile.calltrace.cycles-pp.blk_mq_end_request_batch.nvme_irq.__handle_irq_event_percpu.handle_irq_event.handle_edge_irq
      0.00            +1.4        1.44 ±  6%  perf-profile.calltrace.cycles-pp.folio_end_writeback_no_dropbehind.folio_end_writeback.ext4_finish_bio.ext4_release_io_end.ext4_end_io_end
      0.00            +1.4        1.44 ±  7%  perf-profile.calltrace.cycles-pp.blk_mq_submit_bio.__submit_bio.submit_bio_noacct_nocheck.ext4_io_submit.ext4_do_writepages
      0.00            +1.4        1.45 ±  7%  perf-profile.calltrace.cycles-pp.__submit_bio.submit_bio_noacct_nocheck.ext4_io_submit.ext4_do_writepages.ext4_writepages
      0.00            +1.5        1.45 ±  6%  perf-profile.calltrace.cycles-pp.folio_end_writeback.ext4_finish_bio.ext4_release_io_end.ext4_end_io_end.ext4_end_io_rsv_work
      0.00            +1.5        1.48 ± 14%  perf-profile.calltrace.cycles-pp.quiet_vmstat.tick_nohz_stop_tick.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle
      0.00            +1.6        1.57 ±  7%  perf-profile.calltrace.cycles-pp.ext4_finish_bio.ext4_release_io_end.ext4_end_io_end.ext4_end_io_rsv_work.process_one_work
      0.00            +1.6        1.58 ±  8%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +1.6        1.62 ±  9%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +1.7        1.74 ±  7%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending
      0.53 ±  3%      +1.8        2.28 ±  6%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      0.00            +1.8        1.84 ±  7%  perf-profile.calltrace.cycles-pp.ext4_release_io_end.ext4_end_io_end.ext4_end_io_rsv_work.process_one_work.worker_thread
      0.84 ±  2%      +1.8        2.69 ±  8%  perf-profile.calltrace.cycles-pp.nvme_irq.__handle_irq_event_percpu.handle_irq_event.handle_edge_irq.__sysvec_posted_msi_notification
      0.00            +1.9        1.86 ± 11%  perf-profile.calltrace.cycles-pp.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      0.86 ±  3%      +1.9        2.78 ±  8%  perf-profile.calltrace.cycles-pp.__handle_irq_event_percpu.handle_irq_event.handle_edge_irq.__sysvec_posted_msi_notification.sysvec_posted_msi_notification
      0.60 ±  3%      +1.9        2.53 ±  6%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      0.90 ±  2%      +2.0        2.94 ±  9%  perf-profile.calltrace.cycles-pp.handle_irq_event.handle_edge_irq.__sysvec_posted_msi_notification.sysvec_posted_msi_notification.asm_sysvec_posted_msi_notification
      0.97 ±  2%      +2.3        3.24 ± 10%  perf-profile.calltrace.cycles-pp.handle_edge_irq.__sysvec_posted_msi_notification.sysvec_posted_msi_notification.asm_sysvec_posted_msi_notification.cpuidle_enter_state
      0.52 ±  2%      +2.3        2.82 ±  8%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.84            +2.4        3.20 ± 11%  perf-profile.calltrace.cycles-pp.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_writev
      0.71 ±  2%      +2.5        3.16 ±  7%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      0.00            +2.5        2.46 ± 13%  perf-profile.calltrace.cycles-pp.ext4_ext_map_blocks.ext4_map_create_blocks.ext4_map_blocks.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec
      1.06 ±  2%      +2.5        3.61 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_posted_msi_notification.sysvec_posted_msi_notification.asm_sysvec_posted_msi_notification.cpuidle_enter_state.cpuidle_enter
      0.92            +2.7        3.58 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_stop_tick.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.92            +2.7        3.61 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.66 ±  2%      +2.7        3.40 ±  7%  perf-profile.calltrace.cycles-pp.tick_nohz_restart_sched_tick.tick_nohz_idle_exit.do_idle.cpu_startup_entry.start_secondary
      1.14 ±  2%      +2.8        3.97 ± 11%  perf-profile.calltrace.cycles-pp.sysvec_posted_msi_notification.asm_sysvec_posted_msi_notification.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +2.8        2.84 ± 12%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.handle_softirqs.do_softirq.flush_smp_call_function_queue.do_idle
      0.00            +2.9        2.85 ± 13%  perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.00            +2.9        2.86 ± 12%  perf-profile.calltrace.cycles-pp.do_softirq.flush_smp_call_function_queue.do_idle.cpu_startup_entry.rest_init
      0.00            +2.9        2.90 ± 12%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.rest_init.start_kernel
      1.14 ±  2%      +3.0        4.11 ± 10%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      1.22            +3.1        4.28 ± 10%  perf-profile.calltrace.cycles-pp.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_writev.do_pwritev
      1.17            +3.1        4.24 ± 10%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.20 ±  2%      +3.1        4.30 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_posted_msi_notification.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +3.1        3.12 ±  9%  perf-profile.calltrace.cycles-pp.ext4_map_create_blocks.ext4_map_blocks.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.ext4_end_io_end
      0.97 ±  2%      +3.2        4.20 ±  5%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.common_startup_64
      0.36 ± 70%      +3.3        3.62 ± 10%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      1.38            +3.4        4.82 ±  3%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.08 ±  2%      +3.5        4.58 ±  4%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      0.00            +3.5        3.51 ±  8%  perf-profile.calltrace.cycles-pp.ext4_map_blocks.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.ext4_end_io_end.ext4_end_io_rsv_work
      4.46            +3.6        8.05 ± 14%  perf-profile.calltrace.cycles-pp.__do_sys_ioprio_get.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.02 ±  2%      +3.8        4.82 ±  7%  perf-profile.calltrace.cycles-pp.tick_nohz_idle_exit.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      4.71            +4.1        8.76 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      4.71            +4.1        8.77 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      4.77            +4.2        8.96 ± 13%  perf-profile.calltrace.cycles-pp.syscall
      0.73 ±  2%      +4.3        5.03 ± 11%  perf-profile.calltrace.cycles-pp.ext4_convert_unwritten_io_end_vec.ext4_end_io_end.ext4_end_io_rsv_work.process_one_work.worker_thread
      0.08 ±223%      +4.4        4.49 ± 10%  perf-profile.calltrace.cycles-pp.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.ext4_end_io_end.ext4_end_io_rsv_work.process_one_work
      1.27            +4.8        6.03 ± 17%  perf-profile.calltrace.cycles-pp.jbd2_journal_commit_transaction.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
      1.29            +4.9        6.15 ± 17%  perf-profile.calltrace.cycles-pp.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
      1.05 ±  2%      +6.1        7.20 ±  7%  perf-profile.calltrace.cycles-pp.ext4_end_io_end.ext4_end_io_rsv_work.process_one_work.worker_thread.kthread
      1.06 ±  2%      +6.2        7.26 ±  7%  perf-profile.calltrace.cycles-pp.ext4_end_io_rsv_work.process_one_work.worker_thread.kthread.ret_from_fork
      1.08 ±  2%      +6.5        7.58 ±  6%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.13 ±  2%      +7.7        8.87 ±  5%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.17 ±  2%      +8.4       10.61 ±  7%  perf-profile.calltrace.cycles-pp.intel_idle_xstate.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.52           +12.8       15.28 ±  9%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      2.52           +12.8       15.28 ±  9%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      2.52           +12.8       15.28 ±  9%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      3.90 ±  2%     +14.8       18.66 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.98 ±  2%     +14.9       18.88 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      5.96 ±  2%     +20.7       26.68 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      9.80 ±  2%     +32.0       41.84 ±  7%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      9.81 ±  2%     +32.0       41.86 ±  7%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      9.81 ±  2%     +32.1       41.87 ±  7%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     10.33           +35.2       45.48 ±  7%  perf-profile.calltrace.cycles-pp.common_startup_64
     67.48           -64.7        2.79 ±127%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     84.62           -47.6       37.06 ±  7%  perf-profile.children.cycles-pp.do_syscall_64
     84.63           -47.5       37.12 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     57.37           -40.1       17.31 ± 11%  perf-profile.children.cycles-pp.ext4_sync_file
     57.40           -40.0       17.43 ± 11%  perf-profile.children.cycles-pp.do_fsync
     57.40           -40.0       17.45 ± 11%  perf-profile.children.cycles-pp.__x64_sys_fsync
     37.42           -31.2        6.19 ± 74%  perf-profile.children.cycles-pp._raw_spin_lock
     31.35 ±  2%     -29.4        1.93 ± 21%  perf-profile.children.cycles-pp.jbd2_log_wait_commit
     29.52 ±  2%     -29.2        0.28 ± 75%  perf-profile.children.cycles-pp.prepare_to_wait_event
     29.74 ±  2%     -28.3        1.40 ± 27%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     20.69           -16.4        4.32 ± 35%  perf-profile.children.cycles-pp.file_update_time_flags
     20.66           -16.4        4.29 ± 36%  perf-profile.children.cycles-pp.ext4_dirty_inode
     20.84           -16.3        4.52 ± 34%  perf-profile.children.cycles-pp.__mark_inode_dirty
     18.61           -16.0        2.64 ± 72%  perf-profile.children.cycles-pp.do_get_write_access
     19.17           -15.8        3.34 ± 61%  perf-profile.children.cycles-pp.jbd2_journal_get_write_access
     19.17           -15.8        3.36 ± 60%  perf-profile.children.cycles-pp.__ext4_journal_get_write_access
     17.06           -15.3        1.79 ± 98%  perf-profile.children.cycles-pp.jbd2_journal_dirty_metadata
     17.11           -15.3        1.83 ± 97%  perf-profile.children.cycles-pp.__ext4_handle_dirty_metadata
     18.79           -15.1        3.68 ± 36%  perf-profile.children.cycles-pp.__ext4_mark_inode_dirty
     21.99           -13.2        8.83 ± 12%  perf-profile.children.cycles-pp.ext4_buffered_write_iter
     22.01           -13.1        8.90 ± 12%  perf-profile.children.cycles-pp.do_iter_readv_writev
     22.15           -12.8        9.36 ± 11%  perf-profile.children.cycles-pp.vfs_writev
     22.20           -12.7        9.51 ± 11%  perf-profile.children.cycles-pp.do_pwritev
     19.08 ±  3%     -12.7        6.42 ± 31%  perf-profile.children.cycles-pp.mpage_map_one_extent
     13.22 ±  5%     -11.9        1.36 ± 77%  perf-profile.children.cycles-pp.ext4_ext_insert_extent
     19.44 ±  3%     -11.7        7.72 ± 25%  perf-profile.children.cycles-pp.mpage_map_and_submit_extent
     23.40 ±  3%     -11.2       12.16 ± 14%  perf-profile.children.cycles-pp.ext4_do_writepages
     18.86 ±  3%     -11.2        7.66 ± 29%  perf-profile.children.cycles-pp.ext4_ext_map_blocks
     23.43 ±  3%     -11.2       12.26 ± 14%  perf-profile.children.cycles-pp.ext4_writepages
     23.46 ±  3%     -11.1       12.35 ± 14%  perf-profile.children.cycles-pp.do_writepages
     23.52 ±  3%     -11.0       12.52 ± 14%  perf-profile.children.cycles-pp.filemap_writeback
     19.34 ±  3%     -10.0        9.35 ± 23%  perf-profile.children.cycles-pp.ext4_map_create_blocks
     24.22 ±  3%      -9.8       14.44 ± 11%  perf-profile.children.cycles-pp.file_write_and_wait_range
     19.45 ±  3%      -9.4       10.06 ± 20%  perf-profile.children.cycles-pp.ext4_map_blocks
      9.94 ±  2%      -7.9        2.09 ± 33%  perf-profile.children.cycles-pp.ext4_reserve_inode_write
      8.83            -7.3        1.50 ± 43%  perf-profile.children.cycles-pp.ext4_do_update_inode
      8.84            -7.3        1.53 ± 42%  perf-profile.children.cycles-pp.ext4_mark_iloc_dirty
      6.24 ±  6%      -5.2        1.06 ± 55%  perf-profile.children.cycles-pp.__ext4_ext_dirty
      3.39 ±  4%      -3.1        0.34 ± 81%  perf-profile.children.cycles-pp.queued_read_lock_slowpath
      4.50 ±  9%      -2.7        1.77 ± 38%  perf-profile.children.cycles-pp.start_this_handle
      4.42 ±  8%      -2.7        1.75 ± 34%  perf-profile.children.cycles-pp.jbd2__journal_start
      2.09 ±  4%      -1.5        0.59 ±  4%  perf-profile.children.cycles-pp.update_process_times
      2.16 ±  4%      -1.4        0.74 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      2.19 ±  4%      -1.3        0.85 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.28 ±  4%      -1.3        0.99 ±  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.30 ±  4%      -1.3        1.01 ±  6%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.31 ±  5%      -1.0        0.30 ± 28%  perf-profile.children.cycles-pp.jbd2_trans_will_send_data_barrier
      2.54 ±  4%      -1.0        1.55 ±  8%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      2.62 ±  3%      -1.0        1.66 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.02 ±  6%      -0.9        0.10 ± 29%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.83 ±  8%      -0.8        0.08 ± 29%  perf-profile.children.cycles-pp.nohz_balance_exit_idle
      1.52 ± 15%      -0.6        0.90 ± 36%  perf-profile.children.cycles-pp.add_transaction_credits
      0.70 ±  6%      -0.6        0.12 ±111%  perf-profile.children.cycles-pp.queued_write_lock_slowpath
      0.56 ± 27%      -0.4        0.14 ± 62%  perf-profile.children.cycles-pp._raw_read_unlock
      0.54 ±  4%      -0.4        0.13 ± 20%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.39 ± 10%      -0.3        0.06 ± 23%  perf-profile.children.cycles-pp._find_next_and_bit
      0.52 ± 27%      -0.1        0.38 ± 31%  perf-profile.children.cycles-pp._raw_read_lock
      0.14 ±  2%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.task_tick_fair
      0.10 ± 13%      -0.0        0.05 ± 45%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.16 ±  7%      -0.0        0.14 ±  7%  perf-profile.children.cycles-pp.nohz_balance_enter_idle
      0.05 ±  8%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.wbt_done
      0.06 ± 11%      +0.0        0.11 ± 17%  perf-profile.children.cycles-pp.__rq_qos_done
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.__x64_sys_ioprio_set
      0.00            +0.1        0.06 ± 26%  perf-profile.children.cycles-pp.__pi_memcpy
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.node_dirty_ok
      0.00            +0.1        0.06 ± 18%  perf-profile.children.cycles-pp.wbc_detach_inode
      0.00            +0.1        0.06 ± 20%  perf-profile.children.cycles-pp.mnt_get_write_access_file
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.pwq_tryinc_nr_active
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.wq_select_unbound_cpu
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.xas_clear_mark
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.ext4_claim_free_clusters
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.ext4_io_end_defer_completion
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.generic_write_check_limits
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.mod_zone_page_state
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.irq_exit
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.rw_verify_area
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.account_idle_ticks
      0.00            +0.1        0.06 ± 23%  perf-profile.children.cycles-pp.capable
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.obj_cgroup_charge_account
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.tick_nohz_account_idle_time
      0.00            +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.blk_mq_rq_ctx_init
      0.00            +0.1        0.07 ± 22%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      0.00            +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.hrtimer_reprogram
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.pick_next_task
      0.00            +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.set_task_ioprio
      0.00            +0.1        0.07 ± 31%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.update_wall_time
      0.00            +0.1        0.07 ±  9%  perf-profile.children.cycles-pp.__rq_qos_done_bio
      0.00            +0.1        0.07 ± 36%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.file_remove_privs_flags
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.10 ±  8%      +0.1        0.17 ±  9%  perf-profile.children.cycles-pp.update_other_load_avgs
      0.00            +0.1        0.07 ± 23%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.file_modified
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.dquot_claim_space_nodirty
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.mpage_release_unused_pages
      0.08 ±  8%      +0.1        0.16 ± 32%  perf-profile.children.cycles-pp.unlock_buffer
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.00            +0.1        0.08 ± 13%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.timer_clear_idle
      0.00            +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.security_task_getioprio
      0.00            +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.__brelse
      0.00            +0.1        0.08 ± 28%  perf-profile.children.cycles-pp.__jbd2_journal_remove_checkpoint
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.stress_mwc16
      0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.cr4_update_irqsoff
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.ext4_mb_use_preallocated
      0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.fetch_next_timer_interrupt
      0.00            +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.wakeup_preempt_idle
      0.07 ±  5%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.rq_qos_wait
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp._Fork
      0.00            +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.check_update_overutilized_status
      0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.copy_process
      0.00            +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.inode_to_bdi
      0.00            +0.1        0.09 ± 26%  perf-profile.children.cycles-pp.irq_chip_ack_parent
      0.00            +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.inode_set_ctime_current
      0.00            +0.1        0.09 ± 17%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.06 ± 11%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp._find_first_bit
      0.00            +0.1        0.09 ± 21%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +0.1        0.09 ± 21%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +0.1        0.09 ± 22%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.1        0.09 ± 27%  perf-profile.children.cycles-pp.ext4_inode_table
      0.00            +0.1        0.09 ± 19%  perf-profile.children.cycles-pp.fsync@plt
      0.00            +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.00            +0.1        0.09 ± 26%  perf-profile.children.cycles-pp.dma_direct_map_phys
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.ext4_es_free_extent
      0.00            +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.ioprio_check_cap
      0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.1        0.09 ± 19%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.08 ±  8%      +0.1        0.18 ± 13%  perf-profile.children.cycles-pp._find_next_bit
      0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.__xa_set_mark
      0.00            +0.1        0.10 ± 17%  perf-profile.children.cycles-pp.iovec_from_user
      0.00            +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.blk_account_io_completion
      0.00            +0.1        0.10 ± 26%  perf-profile.children.cycles-pp.evsel__read_counter
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.1        0.10 ± 30%  perf-profile.children.cycles-pp.kfree
      0.04 ± 44%      +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.blk_mq_start_request
      0.00            +0.1        0.10 ± 35%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      0.00            +0.1        0.10 ± 16%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.tick_do_update_jiffies64
      0.18 ±  6%      +0.1        0.28 ± 17%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.02 ±141%      +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.inode_update_time
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.pwritev64
      0.00            +0.1        0.10 ± 12%  perf-profile.children.cycles-pp.syscall@plt
      0.00            +0.1        0.10 ± 22%  perf-profile.children.cycles-pp.dl_server_start
      0.00            +0.1        0.10 ± 28%  perf-profile.children.cycles-pp.nvme_setup_rw
      0.00            +0.1        0.10 ± 14%  perf-profile.children.cycles-pp.wq_worker_running
      0.08 ±  4%      +0.1        0.19 ± 20%  perf-profile.children.cycles-pp.ext4_read_block_bitmap
      0.08 ±  4%      +0.1        0.19 ± 20%  perf-profile.children.cycles-pp.ext4_read_block_bitmap_nowait
      0.06 ±  9%      +0.1        0.16 ±  9%  perf-profile.children.cycles-pp.fdget
      0.05            +0.1        0.16 ± 15%  perf-profile.children.cycles-pp.import_iovec
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.__dquot_alloc_space
      0.09 ±  5%      +0.1        0.20 ± 10%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.02 ± 99%      +0.1        0.13 ± 16%  perf-profile.children.cycles-pp.submit_bio_noacct
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.00            +0.1        0.11 ± 41%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.00            +0.1        0.11 ± 24%  perf-profile.children.cycles-pp.__sched_setaffinity
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.ext4_alloc_io_end_vec
      0.00            +0.1        0.11 ± 14%  perf-profile.children.cycles-pp.generic_write_checks
      0.00            +0.1        0.11 ± 26%  perf-profile.children.cycles-pp.nvme_setup_cmd
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.rb_next
      0.06 ±  8%      +0.1        0.17 ± 16%  perf-profile.children.cycles-pp.tag_pages_for_writeback
      0.00            +0.1        0.11 ± 18%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.sbitmap_find_bit
      0.00            +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.switch_hrtimer_base
      0.07 ± 10%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.get_from_partial_node
      0.00            +0.1        0.11 ± 22%  perf-profile.children.cycles-pp.add_interrupt_randomness
      0.00            +0.1        0.11 ± 32%  perf-profile.children.cycles-pp.blk_attempt_plug_merge
      0.00            +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +0.1        0.12 ± 13%  perf-profile.children.cycles-pp.ext4_generic_write_checks
      0.00            +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.__pick_eevdf
      0.00            +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.errseq_check
      0.00            +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +0.1        0.12 ±  9%  perf-profile.children.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.12 ± 37%  perf-profile.children.cycles-pp.jbd2_journal_wait_updates
      0.04 ± 71%      +0.1        0.16 ± 27%  perf-profile.children.cycles-pp.sched_update_worker
      0.01 ±223%      +0.1        0.13 ± 17%  perf-profile.children.cycles-pp.__import_iovec
      0.00            +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      0.00            +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.bprm_execve
      0.05            +0.1        0.18 ± 13%  perf-profile.children.cycles-pp.lru_add
      0.00            +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.bio_endio
      0.00            +0.1        0.13 ± 14%  perf-profile.children.cycles-pp.xas_find
      0.11 ±  3%      +0.1        0.24 ± 45%  perf-profile.children.cycles-pp.__jbd2_journal_temp_unlink_buffer
      0.00            +0.1        0.13 ± 13%  perf-profile.children.cycles-pp.__ext4_journal_start_sb
      0.00            +0.1        0.13 ± 22%  perf-profile.children.cycles-pp.__update_idle_core
      0.00            +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.bio_free
      0.08 ±  5%      +0.1        0.22 ± 11%  perf-profile.children.cycles-pp.copy_folio_from_iter_atomic
      0.00            +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.__resched_curr
      0.00            +0.1        0.13 ± 24%  perf-profile.children.cycles-pp.dma_unmap_phys
      0.06 ±  6%      +0.1        0.19 ± 26%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.06 ±  8%      +0.1        0.19 ± 15%  perf-profile.children.cycles-pp.ext4_init_io_end
      0.22 ± 11%      +0.1        0.36 ± 34%  perf-profile.children.cycles-pp.jbd2_journal_start_reserved
      0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.prepare_to_wait
      0.00            +0.1        0.14 ± 40%  perf-profile.children.cycles-pp._raw_write_lock
      0.00            +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.calc_load_nohz_start
      0.03 ±100%      +0.1        0.16 ± 16%  perf-profile.children.cycles-pp.fsync
      0.06 ±  9%      +0.1        0.19 ± 20%  perf-profile.children.cycles-pp.rmqueue
      0.05            +0.1        0.19 ± 10%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.__pi_memset
      0.00            +0.1        0.14 ± 26%  perf-profile.children.cycles-pp.blk_stat_add
      0.03 ± 70%      +0.1        0.17 ± 12%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.06 ±  8%      +0.1        0.20 ± 15%  perf-profile.children.cycles-pp.switch_fpu_return
      0.06 ± 17%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.bio_associate_blkg_from_css
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.tmigr_active_up
      0.00            +0.1        0.14 ± 13%  perf-profile.children.cycles-pp.blk_mq_sched_bio_merge
      0.06            +0.1        0.20 ± 55%  perf-profile.children.cycles-pp.__memmove
      0.00            +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.jbd2_journal_put_journal_head
      0.00            +0.1        0.14 ± 15%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.08            +0.1        0.22 ± 12%  perf-profile.children.cycles-pp.xas_find_marked
      0.00            +0.1        0.15 ± 11%  perf-profile.children.cycles-pp._raw_spin_unlock
      0.00            +0.1        0.15 ± 19%  perf-profile.children.cycles-pp.xas_store
      0.00            +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.ext4_journal_check_start
      0.00            +0.2        0.15 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
      0.00            +0.2        0.15 ± 43%  perf-profile.children.cycles-pp.__jbd2_journal_refile_buffer
      0.00            +0.2        0.15 ± 13%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.00            +0.2        0.15 ± 15%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.2        0.15 ± 11%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.16 ±  7%  perf-profile.children.cycles-pp.migrate_disable_switch
      0.07 ±  6%      +0.2        0.23 ± 10%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.2        0.16 ± 14%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.2        0.16 ± 17%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.2        0.16 ± 19%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.08            +0.2        0.24 ± 10%  perf-profile.children.cycles-pp.mpage_submit_folio
      0.00            +0.2        0.16 ± 11%  perf-profile.children.cycles-pp.hrtimer_active
      0.02 ± 99%      +0.2        0.18 ± 16%  perf-profile.children.cycles-pp.dma_map_phys
      0.08 ± 10%      +0.2        0.24 ± 15%  perf-profile.children.cycles-pp.mm_cid_switch_to
      0.06 ±  6%      +0.2        0.22 ± 12%  perf-profile.children.cycles-pp.switch_ldt
      0.00            +0.2        0.16 ± 10%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.2        0.16 ± 20%  perf-profile.children.cycles-pp.sbitmap_get
      0.00            +0.2        0.17 ±  7%  perf-profile.children.cycles-pp.cpuidle_select
      0.04 ± 44%      +0.2        0.21 ± 30%  perf-profile.children.cycles-pp.ext4_inode_csum
      0.01 ±223%      +0.2        0.18 ± 16%  perf-profile.children.cycles-pp.ext4_da_reserve_space
      0.00            +0.2        0.17 ± 29%  perf-profile.children.cycles-pp.ext4_ext_try_to_merge_right
      0.05            +0.2        0.22 ± 31%  perf-profile.children.cycles-pp.ext4_inode_csum_set
      0.02 ± 99%      +0.2        0.20 ± 15%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +0.2        0.18 ± 10%  perf-profile.children.cycles-pp.propagate_entity_load_avg
      0.05 ±  8%      +0.2        0.23 ± 19%  perf-profile.children.cycles-pp.set_next_task_idle
      0.07 ±  5%      +0.2        0.25 ± 14%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.00            +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.ext4_journal_bmap
      0.00            +0.2        0.18 ± 24%  perf-profile.children.cycles-pp.list_add_leaf_cfs_rq
      0.00            +0.2        0.18 ± 18%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +0.2        0.18 ± 23%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.00            +0.2        0.18 ± 16%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.2        0.18 ± 11%  perf-profile.children.cycles-pp.mempool_free
      0.00            +0.2        0.18 ± 17%  perf-profile.children.cycles-pp.sched_clock
      0.10            +0.2        0.28 ± 15%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.2        0.18 ± 27%  perf-profile.children.cycles-pp.io_serial_in
      0.00            +0.2        0.18 ± 27%  perf-profile.children.cycles-pp.wait_for_lsr
      0.00            +0.2        0.18 ± 19%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +0.2        0.18 ± 11%  perf-profile.children.cycles-pp.avg_vruntime
      0.00            +0.2        0.18 ± 19%  perf-profile.children.cycles-pp.execve
      0.10 ±  4%      +0.2        0.28 ± 26%  perf-profile.children.cycles-pp.stop_this_handle
      0.09 ±  4%      +0.2        0.28 ± 13%  perf-profile.children.cycles-pp.llist_reverse_order
      0.03 ± 70%      +0.2        0.22 ± 16%  perf-profile.children.cycles-pp.next_zone
      0.06 ±  7%      +0.2        0.25 ± 22%  perf-profile.children.cycles-pp.nvme_pci_complete_batch
      0.00            +0.2        0.19 ± 12%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.06            +0.2        0.25 ± 21%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.2        0.19 ± 41%  perf-profile.children.cycles-pp.jbd2_journal_file_buffer
      0.12 ±  4%      +0.2        0.32 ±  9%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.00            +0.2        0.19 ± 11%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.2        0.19 ± 11%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.00            +0.2        0.19 ± 11%  perf-profile.children.cycles-pp.jbd2_journal_bmap
      0.06 ±  7%      +0.2        0.26 ± 14%  perf-profile.children.cycles-pp.file_check_and_advance_wb_err
      0.06 ±  8%      +0.2        0.25 ± 12%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.10 ±  6%      +0.2        0.30 ± 19%  perf-profile.children.cycles-pp.mempool_alloc_noprof
      0.00            +0.2        0.20 ± 11%  perf-profile.children.cycles-pp.__xa_clear_mark
      0.00            +0.2        0.20 ±  8%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.11 ±  5%      +0.2        0.31 ± 22%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.01 ±223%      +0.2        0.21 ±  9%  perf-profile.children.cycles-pp.tick_nohz_idle_got_tick
      0.06 ±  6%      +0.2        0.26 ± 15%  perf-profile.children.cycles-pp.calc_load_nohz_stop
      0.08 ±  6%      +0.2        0.28 ± 17%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.01 ±223%      +0.2        0.21 ± 13%  perf-profile.children.cycles-pp.ext4_get_group_desc
      0.00            +0.2        0.21 ± 24%  perf-profile.children.cycles-pp.ext4_ext_try_to_merge
      0.04 ±103%      +0.2        0.25 ± 47%  perf-profile.children.cycles-pp.jbd2_journal_add_journal_head
      0.00            +0.2        0.21 ± 12%  perf-profile.children.cycles-pp.read_tsc
      0.08 ± 14%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.bio_associate_blkg
      0.00            +0.2        0.21 ± 27%  perf-profile.children.cycles-pp.vfs_read
      0.00            +0.2        0.21 ± 24%  perf-profile.children.cycles-pp.xas_start
      0.05            +0.2        0.26 ± 11%  perf-profile.children.cycles-pp.first_online_pgdat
      0.12 ±  6%      +0.2        0.33 ±  7%  perf-profile.children.cycles-pp.wbt_wait
      0.00            +0.2        0.21 ± 12%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.04 ± 44%      +0.2        0.26 ± 21%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.06 ±  9%      +0.2        0.27 ± 20%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.00            +0.2        0.22 ± 21%  perf-profile.children.cycles-pp.pick_task_fair
      0.01 ±223%      +0.2        0.22 ±  8%  perf-profile.children.cycles-pp.cpuacct_charge
      0.05            +0.2        0.27 ± 14%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.2        0.22 ± 12%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.07 ±  7%      +0.2        0.28 ± 10%  perf-profile.children.cycles-pp.ext4_block_bitmap_csum_set
      0.11 ±  3%      +0.2        0.33 ± 13%  perf-profile.children.cycles-pp.__queue_work
      0.09 ±  6%      +0.2        0.31 ± 11%  perf-profile.children.cycles-pp.stress_ioprio
      0.00            +0.2        0.22 ± 15%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.00            +0.2        0.22 ± 27%  perf-profile.children.cycles-pp.serial8250_console_write
      0.08 ±  4%      +0.2        0.31 ± 15%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.03 ± 70%      +0.2        0.26 ± 15%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.11 ±  8%      +0.2        0.34 ± 12%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.00            +0.2        0.23 ± 32%  perf-profile.children.cycles-pp.submit_bh_wbc
      0.11 ±  3%      +0.2        0.34 ± 12%  perf-profile.children.cycles-pp.queue_work_on
      0.00            +0.2        0.23 ± 24%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.00            +0.2        0.23 ± 24%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.00            +0.2        0.23 ± 24%  perf-profile.children.cycles-pp.irq_work_run
      0.00            +0.2        0.23 ± 24%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.00            +0.2        0.23 ± 25%  perf-profile.children.cycles-pp._printk
      0.00            +0.2        0.23 ± 25%  perf-profile.children.cycles-pp.console_flush_one_record
      0.00            +0.2        0.23 ± 25%  perf-profile.children.cycles-pp.console_unlock
      0.00            +0.2        0.23 ± 25%  perf-profile.children.cycles-pp.vprintk_emit
      0.17 ±  5%      +0.2        0.40 ±  8%  perf-profile.children.cycles-pp.block_commit_write
      0.00            +0.2        0.23 ± 26%  perf-profile.children.cycles-pp.ksys_read
      0.06 ±  7%      +0.2        0.30 ± 26%  perf-profile.children.cycles-pp.nvme_poll_cq
      0.00            +0.2        0.24 ± 24%  perf-profile.children.cycles-pp.irq_work_run_list
      0.06 ±  7%      +0.2        0.30 ± 11%  perf-profile.children.cycles-pp.tick_program_event
      0.08 ±  5%      +0.2        0.33 ±  9%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.2        0.24 ± 21%  perf-profile.children.cycles-pp.tick_irq_enter
      0.08 ±  6%      +0.2        0.32 ± 21%  perf-profile.children.cycles-pp.blk_mq_get_tag
      0.25 ±  3%      +0.2        0.50 ±  7%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.18 ±  2%      +0.2        0.42 ±  9%  perf-profile.children.cycles-pp.block_write_end
      0.01 ±223%      +0.2        0.26 ±  9%  perf-profile.children.cycles-pp.get_cpu_device
      0.11 ±  4%      +0.3        0.36 ± 11%  perf-profile.children.cycles-pp.find_task_by_vpid
      0.00            +0.3        0.25 ± 15%  perf-profile.children.cycles-pp.bdev_count_inflight
      0.00            +0.3        0.26 ± 16%  perf-profile.children.cycles-pp.__kmalloc_noprof
      0.00            +0.3        0.26 ± 15%  perf-profile.children.cycles-pp.bdev_count_inflight_rw
      0.00            +0.3        0.26 ± 20%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.11 ±  3%      +0.3        0.37 ± 12%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.06 ±  7%      +0.3        0.32 ±  8%  perf-profile.children.cycles-pp.menu_reflect
      0.07 ± 11%      +0.3        0.33 ± 13%  perf-profile.children.cycles-pp.__switch_to_asm
      0.11 ±  5%      +0.3        0.37 ±  9%  perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.06 ±  6%      +0.3        0.33 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.08 ±  5%      +0.3        0.35 ± 21%  perf-profile.children.cycles-pp.__blk_mq_alloc_requests
      0.00            +0.3        0.27 ± 17%  perf-profile.children.cycles-pp.journal_end_buffer_io_sync
      0.15 ±  2%      +0.3        0.42 ± 10%  perf-profile.children.cycles-pp.ext4_put_io_end_defer
      0.08 ±  4%      +0.3        0.35 ± 14%  perf-profile.children.cycles-pp.__switch_to
      0.04 ± 44%      +0.3        0.31 ± 12%  perf-profile.children.cycles-pp.update_io_ticks
      0.00            +0.3        0.27 ± 23%  perf-profile.children.cycles-pp.sched_setaffinity
      0.08 ±  5%      +0.3        0.36 ± 11%  perf-profile.children.cycles-pp.leave_mm
      0.15 ±  4%      +0.3        0.44 ± 14%  perf-profile.children.cycles-pp.mark_buffer_dirty
      0.08 ±  5%      +0.3        0.37 ± 10%  perf-profile.children.cycles-pp.clockevents_program_event
      0.06 ±  7%      +0.3        0.35 ± 20%  perf-profile.children.cycles-pp.nvme_map_data
      0.08 ± 10%      +0.3        0.37 ± 11%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.23 ± 10%      +0.3        0.52 ± 21%  perf-profile.children.cycles-pp.__ext4_journal_start_reserved
      0.20 ±  4%      +0.3        0.49 ± 10%  perf-profile.children.cycles-pp.finish_task_switch
      0.02 ±141%      +0.3        0.30 ± 21%  perf-profile.children.cycles-pp.wake_affine
      0.06 ±  7%      +0.3        0.35 ± 11%  perf-profile.children.cycles-pp.__check_block_validity
      0.09 ±  5%      +0.3        0.38 ± 10%  perf-profile.children.cycles-pp.rb_erase
      0.09 ±  4%      +0.3        0.38 ±  9%  perf-profile.children.cycles-pp.wake_bit_function
      0.08 ±  5%      +0.3        0.37 ± 10%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.34 ± 45%      +0.3        0.64 ± 33%  perf-profile.children.cycles-pp.wait_transaction_locked
      0.18 ±  2%      +0.3        0.48 ±  8%  perf-profile.children.cycles-pp.ext4_da_do_write_end
      0.08            +0.3        0.38 ± 20%  perf-profile.children.cycles-pp.memchr_inv
      0.06 ±  8%      +0.3        0.36 ± 12%  perf-profile.children.cycles-pp.tmigr_update_events
      0.00            +0.3        0.30 ± 10%  perf-profile.children.cycles-pp.kick_pool
      0.00            +0.3        0.30 ± 20%  perf-profile.children.cycles-pp.should_we_balance
      0.08 ±  6%      +0.3        0.38 ± 10%  perf-profile.children.cycles-pp.place_entity
      0.08            +0.3        0.38 ± 10%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.10 ±  5%      +0.3        0.41 ± 22%  perf-profile.children.cycles-pp.idle_cpu
      0.13            +0.3        0.44 ± 15%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.27 ±  9%      +0.3        0.58 ± 41%  perf-profile.children.cycles-pp.jbd2_journal_write_metadata_buffer
      0.13 ±  3%      +0.3        0.44 ± 11%  perf-profile.children.cycles-pp.__folio_batch_release
      0.17 ±  2%      +0.3        0.48 ± 15%  perf-profile.children.cycles-pp.jbd2_journal_stop
      0.16 ±  5%      +0.3        0.48 ±  7%  perf-profile.children.cycles-pp.__rq_qos_throttle
      0.10            +0.3        0.42 ± 13%  perf-profile.children.cycles-pp.create_empty_buffers
      0.08 ±  6%      +0.3        0.40 ± 12%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.11 ±  3%      +0.3        0.43 ± 15%  perf-profile.children.cycles-pp.filemap_get_folios_tag
      0.43 ±  4%      +0.3        0.76 ± 29%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.23            +0.3        0.56 ± 13%  perf-profile.children.cycles-pp.__ext4_journal_stop
      0.09 ±  5%      +0.3        0.42 ± 12%  perf-profile.children.cycles-pp.set_next_entity
      0.09 ±  4%      +0.3        0.42 ± 14%  perf-profile.children.cycles-pp.folio_alloc_buffers
      0.07            +0.3        0.40 ± 12%  perf-profile.children.cycles-pp.wakeup_preempt
      0.08 ±  5%      +0.3        0.42 ± 15%  perf-profile.children.cycles-pp.alloc_buffer_head
      0.08 ±  4%      +0.3        0.41 ±  9%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.09 ± 13%      +0.3        0.42 ± 29%  perf-profile.children.cycles-pp.call_function_single_prep_ipi
      0.08 ±  5%      +0.3        0.42 ± 15%  perf-profile.children.cycles-pp.blk_account_io_start
      0.14 ±  2%      +0.3        0.48 ± 15%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.00            +0.3        0.34 ± 34%  perf-profile.children.cycles-pp.__getblk_slow
      0.00            +0.3        0.34 ± 25%  perf-profile.children.cycles-pp.read_counters
      0.11 ±  6%      +0.3        0.46 ±  8%  perf-profile.children.cycles-pp.__es_tree_search
      0.00            +0.3        0.34 ± 24%  perf-profile.children.cycles-pp.process_interval
      0.08 ±  5%      +0.3        0.43 ± 13%  perf-profile.children.cycles-pp.put_prev_task_idle
      0.08 ±  6%      +0.3        0.42 ±  9%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.3        0.35 ± 24%  perf-profile.children.cycles-pp.dispatch_events
      0.26 ±  3%      +0.4        0.61 ±  7%  perf-profile.children.cycles-pp.ext4_da_update_reserve_space
      0.25 ±  5%      +0.4        0.60 ±  6%  perf-profile.children.cycles-pp.__sched_balance_update_blocked_averages
      0.05 ±  8%      +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.ext4_extent_block_csum_set
      0.11 ±  5%      +0.4        0.47 ± 20%  perf-profile.children.cycles-pp.ext4_fill_raw_inode
      0.19            +0.4        0.54 ±  8%  perf-profile.children.cycles-pp.__do_sys_ioprio_set
      0.41 ±  4%      +0.4        0.78 ± 10%  perf-profile.children.cycles-pp.mpage_prepare_extent_to_map
      0.13 ±  5%      +0.4        0.51 ± 11%  perf-profile.children.cycles-pp.lruvec_stat_mod_folio
      0.12 ±  4%      +0.4        0.49 ± 19%  perf-profile.children.cycles-pp.nvme_prep_rq
      0.09            +0.4        0.47 ± 16%  perf-profile.children.cycles-pp.folio_alloc_noprof
      0.07 ±  5%      +0.4        0.46 ±  4%  perf-profile.children.cycles-pp.tmigr_quick_check
      0.10 ±  5%      +0.4        0.48 ± 14%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.09 ±  6%      +0.4        0.48 ±  9%  perf-profile.children.cycles-pp.timerqueue_add
      0.12 ±  5%      +0.4        0.51 ±  8%  perf-profile.children.cycles-pp.wake_up_bit
      0.09 ±  5%      +0.4        0.48 ±  9%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.08 ±  5%      +0.4        0.48 ± 11%  perf-profile.children.cycles-pp.tmigr_inactive_up
      0.17 ±  6%      +0.4        0.57 ± 27%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.00            +0.4        0.40 ±  9%  perf-profile.children.cycles-pp.pwq_dec_nr_in_flight
      0.11            +0.4        0.53 ± 10%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.00            +0.4        0.42 ± 49%  perf-profile.children.cycles-pp.intel_idle
      0.05 ±  7%      +0.4        0.48 ± 20%  perf-profile.children.cycles-pp.ext4_sb_block_valid
      0.12 ±  4%      +0.4        0.54 ± 12%  perf-profile.children.cycles-pp.set_next_task_fair
      0.18 ±  2%      +0.4        0.62 ±  9%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.10 ±  4%      +0.4        0.54 ± 10%  perf-profile.children.cycles-pp.tmigr_cpu_deactivate
      0.14 ±  8%      +0.5        0.60 ± 16%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.12 ±  4%      +0.5        0.58 ± 12%  perf-profile.children.cycles-pp.timerqueue_del
      0.11 ±  4%      +0.5        0.59 ± 12%  perf-profile.children.cycles-pp.ct_idle_exit
      0.57 ±  3%      +0.5        1.06 ± 28%  perf-profile.children.cycles-pp.__wake_up
      0.22 ±  4%      +0.5        0.71 ± 22%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.19 ±  5%      +0.5        0.69 ± 15%  perf-profile.children.cycles-pp.select_task_rq
      0.23 ±  5%      +0.5        0.74 ±  8%  perf-profile.children.cycles-pp.update_se
      0.20 ±  7%      +0.5        0.72 ± 24%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.29 ±  5%      +0.5        0.81 ±  7%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.11 ±  6%      +0.5        0.62 ±  9%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.13 ±  3%      +0.5        0.65 ± 10%  perf-profile.children.cycles-pp.__es_insert_extent
      0.21 ±  3%      +0.5        0.73 ± 10%  perf-profile.children.cycles-pp.wake_page_function
      0.15 ±  3%      +0.5        0.66 ± 12%  perf-profile.children.cycles-pp.ext4_es_insert_delayed_extent
      0.13 ±  8%      +0.5        0.65 ± 14%  perf-profile.children.cycles-pp.___perf_sw_event
      0.16 ±  5%      +0.5        0.68 ± 12%  perf-profile.children.cycles-pp.ext4_es_lookup_extent
      0.28 ±  2%      +0.5        0.81 ± 15%  perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.13            +0.5        0.67 ± 12%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.14 ±  4%      +0.5        0.68 ± 10%  perf-profile.children.cycles-pp.ktime_get
      0.42 ±  4%      +0.6        0.97 ±  6%  perf-profile.children.cycles-pp.ext4_bio_write_folio
      0.00            +0.6        0.56 ±  8%  perf-profile.children.cycles-pp.end_bio_bh_io_sync
      0.22 ±  4%      +0.6        0.78 ± 17%  perf-profile.children.cycles-pp.bio_alloc_bioset
      0.37            +0.6        0.95 ± 34%  perf-profile.children.cycles-pp.__jbd2_journal_file_buffer
      0.38            +0.6        1.00 ± 11%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
      0.10 ±  5%      +0.6        0.73 ± 17%  perf-profile.children.cycles-pp.kmem_cache_free
      0.15 ±  2%      +0.6        0.78 ± 16%  perf-profile.children.cycles-pp.filemap_add_folio
      0.10            +0.6        0.74 ± 13%  perf-profile.children.cycles-pp.bit_wait_io
      0.22 ±  2%      +0.6        0.86 ±  8%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.13 ±  3%      +0.6        0.77 ±  3%  perf-profile.children.cycles-pp.__tmigr_cpu_activate
      0.20 ±  4%      +0.6        0.85 ± 17%  perf-profile.children.cycles-pp.nvme_queue_rqs
      0.31 ±  3%      +0.7        0.96 ±  9%  perf-profile.children.cycles-pp.update_curr
      0.16 ±  7%      +0.7        0.82 ± 12%  perf-profile.children.cycles-pp.prepare_task_switch
      0.25 ±  3%      +0.7        0.92 ± 10%  perf-profile.children.cycles-pp.folio_wake_bit
      0.16 ±  2%      +0.7        0.86 ± 12%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.32 ±  5%      +0.7        1.02 ± 14%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.22 ±  5%      +0.7        0.92 ± 20%  perf-profile.children.cycles-pp.blk_finish_plug
      0.24 ±  2%      +0.7        0.96 ±  9%  perf-profile.children.cycles-pp.__ext4_get_inode_loc
      0.24 ±  3%      +0.7        0.97 ±  8%  perf-profile.children.cycles-pp.ext4_get_inode_loc
      0.22 ±  5%      +0.7        0.96 ± 20%  perf-profile.children.cycles-pp.blk_mq_dispatch_queue_requests
      0.15 ±  4%      +0.8        0.90 ±  4%  perf-profile.children.cycles-pp.tmigr_cpu_activate
      0.00            +0.8        0.76 ± 31%  perf-profile.children.cycles-pp.journal_submit_commit_record
      0.18 ±  5%      +0.8        0.95 ± 10%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.22 ±  4%      +0.8        1.00 ± 21%  perf-profile.children.cycles-pp.blk_mq_flush_plug_list
      0.22 ±  4%      +0.8        1.02 ± 21%  perf-profile.children.cycles-pp.__blk_flush_plug
      0.40 ±  2%      +0.8        1.21 ±  8%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.55 ±  2%      +0.8        1.36 ±  8%  perf-profile.children.cycles-pp.folio_wait_bit_common
      0.17 ±  4%      +0.8        0.98 ± 27%  perf-profile.children.cycles-pp.crc32_lsb_vpclmul_avx512
      0.20            +0.8        1.02 ± 12%  perf-profile.children.cycles-pp.hrtimer_cancel
      0.00            +0.8        0.84 ± 28%  perf-profile.children.cycles-pp.jbd2_journal_get_descriptor_buffer
      0.25 ±  2%      +0.8        1.10 ±  8%  perf-profile.children.cycles-pp.update_load_avg
      0.23 ±  2%      +0.9        1.08 ± 12%  perf-profile.children.cycles-pp.__read_extent_tree_block
      0.23            +0.9        1.10 ± 13%  perf-profile.children.cycles-pp.__find_get_block_slow
      0.31 ±  3%      +0.9        1.18 ±  8%  perf-profile.children.cycles-pp.mpage_map_and_submit_buffers
      0.28 ±  2%      +0.9        1.16 ± 13%  perf-profile.children.cycles-pp.filemap_get_entry
      0.59            +0.9        1.49 ±  8%  perf-profile.children.cycles-pp.folio_wait_writeback
      0.25 ±  3%      +0.9        1.15 ± 16%  perf-profile.children.cycles-pp.xas_load
      0.34 ±  3%      +0.9        1.24 ±  9%  perf-profile.children.cycles-pp.dequeue_entity
      0.20 ±  5%      +0.9        1.12 ± 11%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.20 ±  4%      +0.9        1.14 ± 11%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.00            +0.9        0.94 ±  9%  perf-profile.children.cycles-pp.__wait_on_bit
      0.00            +0.9        0.94 ± 10%  perf-profile.children.cycles-pp.out_of_line_wait_on_bit
      0.33 ±  2%      +1.0        1.31 ± 11%  perf-profile.children.cycles-pp.ext4_da_map_blocks
      0.34 ±  2%      +1.0        1.33 ± 11%  perf-profile.children.cycles-pp.ext4_da_get_block_prep
      0.30            +1.0        1.32 ± 15%  perf-profile.children.cycles-pp.need_update
      0.24 ±  2%      +1.0        1.26 ± 11%  perf-profile.children.cycles-pp.__es_remove_extent
      0.23 ±  4%      +1.1        1.31 ± 15%  perf-profile.children.cycles-pp.sched_balance_domains
      0.65 ±  2%      +1.1        1.75 ±  8%  perf-profile.children.cycles-pp.__filemap_fdatawait_range
      0.10 ±  3%      +1.1        1.20 ± 25%  perf-profile.children.cycles-pp.ext4_split_convert_extents
      0.24 ±  2%      +1.1        1.34 ±  6%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.56 ±  2%      +1.1        1.67 ±  7%  perf-profile.children.cycles-pp.ext4_io_submit
      0.40            +1.1        1.52 ±  9%  perf-profile.children.cycles-pp.dequeue_entities
      0.10 ±  3%      +1.1        1.23 ± 24%  perf-profile.children.cycles-pp.ext4_ext_handle_unwritten_extents
      0.24 ±  2%      +1.1        1.38 ± 17%  perf-profile.children.cycles-pp.crc32c_arch
      0.44            +1.1        1.58 ±  9%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.33 ±  2%      +1.2        1.49 ± 14%  perf-profile.children.cycles-pp.quiet_vmstat
      0.47 ±  2%      +1.2        1.64 ±  6%  perf-profile.children.cycles-pp.ext4_es_insert_extent
      0.30 ±  2%      +1.2        1.47 ±  7%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.55 ±  3%      +1.2        1.74 ±  7%  perf-profile.children.cycles-pp.folio_end_writeback_no_dropbehind
      0.46 ±  2%      +1.2        1.65 ±  8%  perf-profile.children.cycles-pp.try_to_block_task
      0.56 ±  3%      +1.2        1.76 ±  7%  perf-profile.children.cycles-pp.folio_end_writeback
      0.36 ±  2%      +1.2        1.56 ± 15%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.26 ±  4%      +1.3        1.54 ±  7%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
      0.58 ±  2%      +1.3        1.87 ±  9%  perf-profile.children.cycles-pp.io_schedule
      0.58 ±  3%      +1.3        1.89 ±  7%  perf-profile.children.cycles-pp.ext4_finish_bio
      0.29 ±  2%      +1.3        1.62 ±  8%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.71 ±  2%      +1.3        2.06 ± 13%  perf-profile.children.cycles-pp.try_to_wake_up
      0.78            +1.4        2.13 ± 14%  perf-profile.children.cycles-pp.__wake_up_common
      0.78 ±  2%      +1.4        2.15 ±  6%  perf-profile.children.cycles-pp.blk_mq_end_request_batch
      0.48            +1.4        1.86 ± 11%  perf-profile.children.cycles-pp.ext4_block_write_begin
      0.28 ±  3%      +1.4        1.67 ± 12%  perf-profile.children.cycles-pp.sched_balance_rq
      0.49 ±  2%      +1.4        1.88 ± 11%  perf-profile.children.cycles-pp.blk_mq_submit_bio
      0.34 ±  2%      +1.4        1.76 ± 12%  perf-profile.children.cycles-pp.ext4_find_extent
      0.44 ±  3%      +1.4        1.88 ±  7%  perf-profile.children.cycles-pp.enqueue_entity
      0.50 ±  2%      +1.5        1.99 ± 12%  perf-profile.children.cycles-pp.__submit_bio
      0.45            +1.6        2.01 ± 11%  perf-profile.children.cycles-pp.bdev_getblk
      0.45            +1.6        2.02 ± 11%  perf-profile.children.cycles-pp.find_get_block_common
      0.52 ±  2%      +1.6        2.11 ± 13%  perf-profile.children.cycles-pp.submit_bio_noacct_nocheck
      0.28            +1.6        1.88 ±  7%  perf-profile.children.cycles-pp.ext4_release_io_end
      0.92 ±  2%      +1.8        2.74 ±  8%  perf-profile.children.cycles-pp.nvme_irq
      0.94 ±  2%      +1.9        2.84 ±  8%  perf-profile.children.cycles-pp.__handle_irq_event_percpu
      0.57 ±  3%      +1.9        2.47 ±  7%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.70 ±  2%      +1.9        2.60 ±  7%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.53            +1.9        2.45 ± 14%  perf-profile.children.cycles-pp.__filemap_get_folio_mpol
      0.99 ±  2%      +2.0        3.00 ±  9%  perf-profile.children.cycles-pp.handle_irq_event
      0.64 ±  3%      +2.1        2.74 ±  7%  perf-profile.children.cycles-pp.enqueue_task
      1.07 ±  2%      +2.2        3.31 ± 10%  perf-profile.children.cycles-pp.handle_edge_irq
      0.76 ±  5%      +2.2        3.01 ± 10%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.64 ±  4%      +2.3        2.92 ± 11%  perf-profile.children.cycles-pp.do_softirq
      0.52 ±  2%      +2.3        2.87 ±  8%  perf-profile.children.cycles-pp.menu_select
      0.84            +2.4        3.20 ± 11%  perf-profile.children.cycles-pp.ext4_da_write_begin
      0.94 ±  4%      +2.4        3.31 ± 10%  perf-profile.children.cycles-pp.handle_softirqs
      0.85 ±  2%      +2.4        3.28 ±  8%  perf-profile.children.cycles-pp.__pick_next_task
      1.17 ±  2%      +2.5        3.69 ± 10%  perf-profile.children.cycles-pp.__sysvec_posted_msi_notification
      0.76 ±  2%      +2.6        3.39 ±  7%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.93            +2.7        3.64 ±  6%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      0.93            +2.7        3.65 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.68 ±  2%      +2.8        3.47 ±  8%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      1.25 ±  2%      +2.8        4.06 ± 11%  perf-profile.children.cycles-pp.sysvec_posted_msi_notification
      1.30 ±  2%      +3.0        4.26 ±  5%  perf-profile.children.cycles-pp.schedule
      1.26            +3.0        4.31 ± 10%  perf-profile.children.cycles-pp.generic_perform_write
      1.31            +3.1        4.39 ± 11%  perf-profile.children.cycles-pp.asm_sysvec_posted_msi_notification
      0.52 ±  5%      +3.1        3.62 ± 10%  perf-profile.children.cycles-pp.rest_init
      1.18 ±  2%      +3.1        4.27 ± 10%  perf-profile.children.cycles-pp.schedule_idle
      0.52 ±  5%      +3.1        3.62 ± 10%  perf-profile.children.cycles-pp.start_kernel
      0.52 ±  5%      +3.1        3.62 ± 10%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.52 ±  5%      +3.1        3.62 ± 10%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.98 ±  2%      +3.2        4.23 ±  5%  perf-profile.children.cycles-pp.sched_ttwu_pending
      1.12 ±  2%      +3.5        4.63 ±  4%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      4.48            +3.6        8.11 ± 14%  perf-profile.children.cycles-pp.__do_sys_ioprio_get
      1.03 ±  2%      +3.9        4.93 ±  7%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.50            +4.0        4.49 ± 10%  perf-profile.children.cycles-pp.ext4_convert_unwritten_extents
      4.78            +4.2        8.98 ± 13%  perf-profile.children.cycles-pp.syscall
      0.73 ±  2%      +4.3        5.03 ± 11%  perf-profile.children.cycles-pp.ext4_convert_unwritten_io_end_vec
      1.27            +4.8        6.04 ± 17%  perf-profile.children.cycles-pp.jbd2_journal_commit_transaction
      1.29            +4.9        6.15 ± 17%  perf-profile.children.cycles-pp.kjournald2
      2.42            +5.9        8.33 ±  8%  perf-profile.children.cycles-pp.__schedule
      1.79            +5.9        7.73 ±  4%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      1.05 ±  2%      +6.1        7.20 ±  7%  perf-profile.children.cycles-pp.ext4_end_io_end
      1.06 ±  2%      +6.2        7.26 ±  7%  perf-profile.children.cycles-pp.ext4_end_io_rsv_work
      1.08 ±  2%      +6.5        7.58 ±  6%  perf-profile.children.cycles-pp.process_one_work
      1.13 ±  2%      +7.7        8.87 ±  5%  perf-profile.children.cycles-pp.worker_thread
      2.21 ±  2%      +8.7       10.88 ±  7%  perf-profile.children.cycles-pp.intel_idle_xstate
      2.52           +12.8       15.28 ±  9%  perf-profile.children.cycles-pp.kthread
      2.52           +12.8       15.30 ±  9%  perf-profile.children.cycles-pp.ret_from_fork
      2.52           +12.8       15.30 ±  9%  perf-profile.children.cycles-pp.ret_from_fork_asm
      4.04 ±  2%     +15.2       19.27 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter_state
      4.06 ±  2%     +15.3       19.34 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter
      6.05 ±  2%     +21.2       27.29 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
      9.81 ±  2%     +32.1       41.87 ±  7%  perf-profile.children.cycles-pp.start_secondary
     10.32           +35.1       45.47 ±  7%  perf-profile.children.cycles-pp.do_idle
     10.33           +35.2       45.48 ±  7%  perf-profile.children.cycles-pp.common_startup_64
     10.33           +35.2       45.48 ±  7%  perf-profile.children.cycles-pp.cpu_startup_entry
     66.07           -63.3        2.75 ±127%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.83 ±  8%      -0.8        0.08 ± 29%  perf-profile.self.cycles-pp.nohz_balance_exit_idle
      0.54 ± 28%      -0.4        0.14 ± 60%  perf-profile.self.cycles-pp._raw_read_unlock
      0.39 ± 10%      -0.3        0.05 ± 49%  perf-profile.self.cycles-pp._find_next_and_bit
      0.39 ±  9%      -0.1        0.25 ± 19%  perf-profile.self.cycles-pp.jbd2_log_wait_commit
      0.16 ±  7%      -0.0        0.14 ±  7%  perf-profile.self.cycles-pp.nohz_balance_enter_idle
      0.05            +0.0        0.10 ± 17%  perf-profile.self.cycles-pp.select_task_rq
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.02 ±141%      +0.1        0.07 ± 34%  perf-profile.self.cycles-pp.wait_transaction_locked
      0.00            +0.1        0.06 ± 20%  perf-profile.self.cycles-pp.__pi_memcpy
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.file_update_time_flags
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.account_idle_ticks
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.ext4_io_end_defer_completion
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.folio_account_dirtied
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.inode_set_ctime_current
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.ext4_put_io_end_defer
      0.00            +0.1        0.06 ± 18%  perf-profile.self.cycles-pp.wbc_detach_inode
      0.00            +0.1        0.06 ± 15%  perf-profile.self.cycles-pp.ext4_mb_use_preallocated
      0.00            +0.1        0.06 ± 20%  perf-profile.self.cycles-pp.mnt_get_write_access_file
      0.00            +0.1        0.06 ± 15%  perf-profile.self.cycles-pp.update_io_ticks
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.wq_select_unbound_cpu
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.xas_clear_mark
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.arch_cpu_idle_enter
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.mod_zone_page_state
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.blk_mq_rq_ctx_init
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.fsync@plt
      0.00            +0.1        0.07 ± 30%  perf-profile.self.cycles-pp.hrtimer_reprogram
      0.00            +0.1        0.07 ± 13%  perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.pick_next_task
      0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.tick_do_update_jiffies64
      0.08 ±  5%      +0.1        0.15 ± 20%  perf-profile.self.cycles-pp.jbd2__journal_start
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.pwritev64
      0.00            +0.1        0.07 ±  9%  perf-profile.self.cycles-pp.__rq_qos_done_bio
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.file_remove_privs_flags
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.07 ± 23%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.kick_pool
      0.08 ±  6%      +0.1        0.15 ± 22%  perf-profile.self.cycles-pp.__smp_call_single_queue
      0.00            +0.1        0.08 ± 18%  perf-profile.self.cycles-pp.cpuidle_enter
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.do_fsync
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.sb_mark_inode_writeback
      0.02 ±141%      +0.1        0.09 ± 21%  perf-profile.self.cycles-pp.rq_qos_wait
      0.00            +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.__brelse
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.ext4_ext_insert_extent
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp._find_next_zero_bit
      0.00            +0.1        0.08 ± 13%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.08 ± 25%  perf-profile.self.cycles-pp.sched_clock
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.timer_clear_idle
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.schedule
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.cr4_update_irqsoff
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.process_one_work
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.stress_mwc16
      0.00            +0.1        0.08 ±  7%  perf-profile.self.cycles-pp.switch_hrtimer_base
      0.08 ±  6%      +0.1        0.16 ± 32%  perf-profile.self.cycles-pp.unlock_buffer
      0.00            +0.1        0.08 ± 13%  perf-profile.self.cycles-pp.ext4_mb_new_blocks
      0.00            +0.1        0.08 ± 13%  perf-profile.self.cycles-pp.syscall
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.__xa_set_mark
      0.00            +0.1        0.08 ± 26%  perf-profile.self.cycles-pp.check_update_overutilized_status
      0.00            +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.ext4_ext_map_blocks
      0.00            +0.1        0.08 ± 23%  perf-profile.self.cycles-pp.leave_mm
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.wakeup_preempt_idle
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.__ext4_get_inode_loc
      0.00            +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.pwq_dec_nr_in_flight
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.xas_store
      0.06 ± 11%      +0.1        0.15 ± 12%  perf-profile.self.cycles-pp._find_first_bit
      0.00            +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.inode_to_bdi
      0.00            +0.1        0.09 ± 26%  perf-profile.self.cycles-pp.irq_chip_ack_parent
      0.00            +0.1        0.09 ± 15%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.07 ± 10%      +0.1        0.16 ± 10%  perf-profile.self.cycles-pp._find_next_bit
      0.00            +0.1        0.09 ± 28%  perf-profile.self.cycles-pp.__wait_on_bit
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.dma_map_phys
      0.00            +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.do_writepages
      0.00            +0.1        0.09 ± 32%  perf-profile.self.cycles-pp.ext4_inode_table
      0.00            +0.1        0.09 ± 20%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.1        0.09 ± 21%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.00            +0.1        0.09 ± 19%  perf-profile.self.cycles-pp.__handle_irq_event_percpu
      0.00            +0.1        0.09 ± 26%  perf-profile.self.cycles-pp.dma_direct_map_phys
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.ext4_finish_bio
      0.00            +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.finish_wait
      0.00            +0.1        0.09 ± 24%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.wakeup_preempt
      0.00            +0.1        0.09 ± 19%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.09 ± 19%  perf-profile.self.cycles-pp.__pcs_replace_empty_main
      0.09 ±  4%      +0.1        0.18 ± 11%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.1        0.10 ±  8%  perf-profile.self.cycles-pp.journal_end_buffer_io_sync
      0.00            +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.ext4_writepages
      0.00            +0.1        0.10 ± 22%  perf-profile.self.cycles-pp.wake_up_bit
      0.00            +0.1        0.10 ± 15%  perf-profile.self.cycles-pp.blk_account_io_start
      0.00            +0.1        0.10 ± 29%  perf-profile.self.cycles-pp.fsync
      0.00            +0.1        0.10 ± 30%  perf-profile.self.cycles-pp.kfree
      0.00            +0.1        0.10 ± 18%  perf-profile.self.cycles-pp.blk_account_io_completion
      0.12 ±  7%      +0.1        0.22 ± 15%  perf-profile.self.cycles-pp._nohz_idle_balance
      0.00            +0.1        0.10 ± 22%  perf-profile.self.cycles-pp.sysvec_posted_msi_notification
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp.__dquot_alloc_space
      0.00            +0.1        0.10 ± 21%  perf-profile.self.cycles-pp.pick_task_fair
      0.00            +0.1        0.10 ± 16%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.1        0.10 ±  6%  perf-profile.self.cycles-pp.find_task_by_vpid
      0.00            +0.1        0.10 ± 10%  perf-profile.self.cycles-pp.get_from_partial_node
      0.00            +0.1        0.10 ± 26%  perf-profile.self.cycles-pp.nvme_setup_rw
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.submit_bio_noacct
      0.00            +0.1        0.10 ± 48%  perf-profile.self.cycles-pp.mark_buffer_dirty
      0.00            +0.1        0.10 ± 12%  perf-profile.self.cycles-pp.__ext4_journal_start_reserved
      0.00            +0.1        0.10 ± 29%  perf-profile.self.cycles-pp.blk_stat_add
      0.00            +0.1        0.10 ± 22%  perf-profile.self.cycles-pp.dl_server_start
      0.05            +0.1        0.15 ± 24%  perf-profile.self.cycles-pp.ext4_fill_raw_inode
      0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.1        0.10 ± 12%  perf-profile.self.cycles-pp.syscall@plt
      0.00            +0.1        0.10 ± 16%  perf-profile.self.cycles-pp.tmigr_cpu_activate
      0.00            +0.1        0.10 ± 18%  perf-profile.self.cycles-pp.rb_next
      0.05 ±  7%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.fdget
      0.00            +0.1        0.11 ± 16%  perf-profile.self.cycles-pp.set_next_task_idle
      0.07 ±  5%      +0.1        0.18 ±  5%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.1        0.11 ±  9%  perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.00            +0.1        0.11 ± 18%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.11 ± 16%  perf-profile.self.cycles-pp.ext4_do_writepages
      0.07            +0.1        0.18 ± 17%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.1        0.11 ±  8%  perf-profile.self.cycles-pp.menu_reflect
      0.00            +0.1        0.11 ± 13%  perf-profile.self.cycles-pp.errseq_check
      0.00            +0.1        0.11 ± 17%  perf-profile.self.cycles-pp.sched_balance_update_blocked_averages
      0.00            +0.1        0.12 ± 13%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.__pick_eevdf
      0.00            +0.1        0.12 ± 14%  perf-profile.self.cycles-pp.tick_nohz_idle_enter
      0.00            +0.1        0.12 ± 14%  perf-profile.self.cycles-pp._raw_spin_unlock
      0.00            +0.1        0.12 ± 25%  perf-profile.self.cycles-pp.handle_edge_irq
      0.00            +0.1        0.12 ± 11%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.12 ± 25%  perf-profile.self.cycles-pp.__update_idle_core
      0.00            +0.1        0.12 ± 26%  perf-profile.self.cycles-pp.next_zone
      0.00            +0.1        0.12 ±  9%  perf-profile.self.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.12 ± 16%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.01 ±223%      +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.wbt_wait
      0.00            +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.folio_wait_writeback
      0.04 ± 71%      +0.1        0.16 ± 30%  perf-profile.self.cycles-pp.sched_update_worker
      0.00            +0.1        0.12 ± 36%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.00            +0.1        0.12 ±  8%  perf-profile.self.cycles-pp.lru_add_drain_cpu
      0.11 ±  3%      +0.1        0.24 ± 44%  perf-profile.self.cycles-pp.__jbd2_journal_temp_unlink_buffer
      0.00            +0.1        0.13 ± 12%  perf-profile.self.cycles-pp.__folio_end_writeback
      0.00            +0.1        0.13 ± 26%  perf-profile.self.cycles-pp.__queue_work
      0.00            +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.calc_load_nohz_start
      0.00            +0.1        0.13 ± 10%  perf-profile.self.cycles-pp.first_online_pgdat
      0.00            +0.1        0.13 ± 13%  perf-profile.self.cycles-pp.rb_insert_color
      0.06            +0.1        0.19 ± 16%  perf-profile.self.cycles-pp.sched_balance_domains
      0.00            +0.1        0.13 ± 10%  perf-profile.self.cycles-pp.tmigr_inactive_up
      0.02 ±142%      +0.1        0.15 ± 14%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.05            +0.1        0.18 ± 18%  perf-profile.self.cycles-pp.__find_get_block_slow
      0.00            +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.__resched_curr
      0.00            +0.1        0.13 ± 39%  perf-profile.self.cycles-pp._raw_write_lock
      0.00            +0.1        0.13 ± 26%  perf-profile.self.cycles-pp.blk_mq_get_tag
      0.08 ±  5%      +0.1        0.21 ± 10%  perf-profile.self.cycles-pp.copy_folio_from_iter_atomic
      0.00            +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.ct_idle_exit
      0.00            +0.1        0.13 ± 23%  perf-profile.self.cycles-pp.__pi_memset
      0.00            +0.1        0.13 ± 24%  perf-profile.self.cycles-pp.dma_unmap_phys
      0.01 ±223%      +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.1        0.13 ±  9%  perf-profile.self.cycles-pp.tmigr_active_up
      0.00            +0.1        0.14 ±  9%  perf-profile.self.cycles-pp.set_next_task_fair
      0.01 ±223%      +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.__rq_qos_throttle
      0.00            +0.1        0.14 ± 19%  perf-profile.self.cycles-pp.try_to_wake_up
      0.05 ±  8%      +0.1        0.19 ± 26%  perf-profile.self.cycles-pp.folio_mark_accessed
      0.00            +0.1        0.14 ± 20%  perf-profile.self.cycles-pp.__es_remove_extent
      0.00            +0.1        0.14 ± 18%  perf-profile.self.cycles-pp.schedule_idle
      0.08 ±  5%      +0.1        0.22 ± 24%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.1        0.14 ±  8%  perf-profile.self.cycles-pp.jbd2_journal_put_journal_head
      0.06 ± 17%      +0.1        0.20 ±  5%  perf-profile.self.cycles-pp.bio_associate_blkg_from_css
      0.08 ±  6%      +0.1        0.22 ± 12%  perf-profile.self.cycles-pp.xas_find_marked
      0.00            +0.1        0.14 ±  9%  perf-profile.self.cycles-pp.folio_wait_bit_common
      0.00            +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.00            +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.00            +0.1        0.14 ± 11%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.blk_mq_sched_bio_merge
      0.02 ±141%      +0.1        0.16 ± 19%  perf-profile.self.cycles-pp.ext4_mb_mark_context
      0.00            +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.x64_sys_call
      0.06            +0.1        0.20 ± 55%  perf-profile.self.cycles-pp.__memmove
      0.00            +0.1        0.14 ± 15%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.00            +0.1        0.15 ± 10%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.15 ± 13%  perf-profile.self.cycles-pp.ext4_journal_check_start
      0.00            +0.1        0.15 ± 17%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.2        0.15 ± 19%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.00            +0.2        0.15 ± 15%  perf-profile.self.cycles-pp.__es_insert_extent
      0.00            +0.2        0.15 ± 11%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.15 ± 11%  perf-profile.self.cycles-pp.hrtimer_active
      0.01 ±223%      +0.2        0.16 ± 20%  perf-profile.self.cycles-pp.blk_mq_end_request_batch
      0.00            +0.2        0.16 ±  7%  perf-profile.self.cycles-pp.migrate_disable_switch
      0.00            +0.2        0.16 ± 14%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.2        0.16 ± 17%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.05            +0.2        0.21 ± 12%  perf-profile.self.cycles-pp.put_prev_task_idle
      0.01 ±223%      +0.2        0.17 ±  8%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.08 ± 10%      +0.2        0.24 ± 15%  perf-profile.self.cycles-pp.mm_cid_switch_to
      0.06 ±  6%      +0.2        0.22 ± 12%  perf-profile.self.cycles-pp.switch_ldt
      0.08 ± 10%      +0.2        0.24 ± 13%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.02 ± 99%      +0.2        0.19 ± 18%  perf-profile.self.cycles-pp.lruvec_stat_mod_folio
      0.02 ±141%      +0.2        0.18 ± 11%  perf-profile.self.cycles-pp.file_check_and_advance_wb_err
      0.07 ± 16%      +0.2        0.23 ± 14%  perf-profile.self.cycles-pp.vfs_writev
      0.00            +0.2        0.17 ±  7%  perf-profile.self.cycles-pp.cpuidle_select
      0.07 ± 11%      +0.2        0.24 ± 14%  perf-profile.self.cycles-pp.ext4_sync_file
      0.07 ±  5%      +0.2        0.24 ± 13%  perf-profile.self.cycles-pp.blk_mq_submit_bio
      0.07 ±  5%      +0.2        0.24 ± 34%  perf-profile.self.cycles-pp.ext4_do_update_inode
      0.00            +0.2        0.17 ± 36%  perf-profile.self.cycles-pp.bio_alloc_bioset
      0.00            +0.2        0.17 ± 12%  perf-profile.self.cycles-pp.tick_nohz_idle_exit
      0.08 ±  4%      +0.2        0.26 ± 27%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.2        0.17 ±  8%  perf-profile.self.cycles-pp.propagate_entity_load_avg
      0.06 ±  6%      +0.2        0.23 ± 22%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.2        0.18 ± 24%  perf-profile.self.cycles-pp.list_add_leaf_cfs_rq
      0.00            +0.2        0.18 ± 10%  perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.2        0.18 ±  5%  perf-profile.self.cycles-pp.quiet_vmstat
      0.00            +0.2        0.18 ± 11%  perf-profile.self.cycles-pp.avg_vruntime
      0.05 ±  8%      +0.2        0.23 ± 18%  perf-profile.self.cycles-pp.nvme_queue_rqs
      0.00            +0.2        0.18 ± 27%  perf-profile.self.cycles-pp.io_serial_in
      0.00            +0.2        0.18 ± 11%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.00            +0.2        0.19 ± 24%  perf-profile.self.cycles-pp.crc32c_arch
      0.09 ±  4%      +0.2        0.28 ± 13%  perf-profile.self.cycles-pp.llist_reverse_order
      0.00            +0.2        0.19 ± 11%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.07 ±  5%      +0.2        0.26 ± 28%  perf-profile.self.cycles-pp.__sysvec_posted_msi_notification
      0.07 ±  9%      +0.2        0.26 ± 11%  perf-profile.self.cycles-pp.enqueue_task
      0.00            +0.2        0.19 ± 11%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.00            +0.2        0.19 ± 21%  perf-profile.self.cycles-pp.xas_start
      0.00            +0.2        0.20 ± 33%  perf-profile.self.cycles-pp.filemap_get_folios_tag
      0.06 ±  9%      +0.2        0.25 ± 12%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.2        0.20 ± 11%  perf-profile.self.cycles-pp.read_tsc
      0.11 ±  5%      +0.2        0.31 ± 22%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.01 ±223%      +0.2        0.21 ±  9%  perf-profile.self.cycles-pp.tick_nohz_idle_got_tick
      0.00            +0.2        0.20 ± 13%  perf-profile.self.cycles-pp.__get_next_timer_interrupt
      0.01 ±223%      +0.2        0.21 ± 12%  perf-profile.self.cycles-pp.ext4_get_group_desc
      0.08 ±  4%      +0.2        0.28 ± 13%  perf-profile.self.cycles-pp.stress_ioprio
      0.06 ±  6%      +0.2        0.26 ± 15%  perf-profile.self.cycles-pp.calc_load_nohz_stop
      0.00            +0.2        0.20 ± 15%  perf-profile.self.cycles-pp.update_curr_dl_se
      0.04 ±105%      +0.2        0.24 ± 48%  perf-profile.self.cycles-pp.jbd2_journal_add_journal_head
      0.00            +0.2        0.20 ± 13%  perf-profile.self.cycles-pp.sched_balance_rq
      0.00            +0.2        0.20 ± 24%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.21 ±  2%      +0.2        0.41 ± 12%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.08 ±  5%      +0.2        0.29 ±  9%  perf-profile.self.cycles-pp.update_load_avg
      0.06 ±  9%      +0.2        0.26 ± 13%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.2        0.21 ± 13%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.12 ±  5%      +0.2        0.33 ±  5%  perf-profile.self.cycles-pp.__sched_balance_update_blocked_averages
      0.04 ± 45%      +0.2        0.26 ± 21%  perf-profile.self.cycles-pp.mod_memcg_lruvec_state
      0.06 ±  6%      +0.2        0.27 ± 14%  perf-profile.self.cycles-pp.dequeue_entities
      0.04 ± 44%      +0.2        0.26 ± 12%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.01 ±223%      +0.2        0.22 ± 11%  perf-profile.self.cycles-pp.tmigr_update_events
      0.02 ±141%      +0.2        0.24 ± 16%  perf-profile.self.cycles-pp.__dequeue_entity
      0.00            +0.2        0.22 ±  9%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.2        0.22 ± 13%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.2        0.22 ± 14%  perf-profile.self.cycles-pp.__kmalloc_noprof
      0.07            +0.2        0.29 ± 10%  perf-profile.self.cycles-pp.finish_task_switch
      0.06            +0.2        0.28 ± 26%  perf-profile.self.cycles-pp.nvme_poll_cq
      0.05 ±  8%      +0.2        0.28 ± 11%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.08 ±  7%      +0.2        0.30 ± 15%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.00            +0.2        0.23 ± 11%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.2        0.23 ± 15%  perf-profile.self.cycles-pp.bdev_count_inflight_rw
      0.10 ±  4%      +0.2        0.34 ± 11%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.06 ±  7%      +0.2        0.30 ± 11%  perf-profile.self.cycles-pp.tick_program_event
      0.08 ±  5%      +0.2        0.32 ±  9%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.08 ±  6%      +0.2        0.32 ± 18%  perf-profile.self.cycles-pp.__pick_next_task
      0.01 ±223%      +0.2        0.26 ±  9%  perf-profile.self.cycles-pp.get_cpu_device
      0.07 ± 11%      +0.3        0.33 ± 13%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.3        0.26 ± 19%  perf-profile.self.cycles-pp.__wake_up_common
      0.06            +0.3        0.32 ±  7%  perf-profile.self.cycles-pp.native_sched_clock
      0.08 ±  4%      +0.3        0.35 ± 14%  perf-profile.self.cycles-pp.__switch_to
      0.08 ±  9%      +0.3        0.35 ± 12%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.00            +0.3        0.28 ± 37%  perf-profile.self.cycles-pp.jbd2_journal_write_metadata_buffer
      0.00            +0.3        0.28 ± 23%  perf-profile.self.cycles-pp.wake_affine
      0.08 ±  5%      +0.3        0.37 ± 10%  perf-profile.self.cycles-pp.rb_erase
      0.08 ±  5%      +0.3        0.37 ± 10%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.10 ±  7%      +0.3        0.39 ± 23%  perf-profile.self.cycles-pp.idle_cpu
      0.10 ±  8%      +0.3        0.40 ±  9%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08            +0.3        0.38 ± 20%  perf-profile.self.cycles-pp.memchr_inv
      0.09 ±  7%      +0.3        0.39 ± 17%  perf-profile.self.cycles-pp.update_se
      0.08            +0.3        0.38 ± 10%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.07 ±  8%      +0.3        0.40 ±  9%  perf-profile.self.cycles-pp.timerqueue_add
      0.09 ± 13%      +0.3        0.42 ± 30%  perf-profile.self.cycles-pp.call_function_single_prep_ipi
      0.11 ±  6%      +0.3        0.45 ±  8%  perf-profile.self.cycles-pp.__es_tree_search
      0.07            +0.3        0.42 ± 19%  perf-profile.self.cycles-pp.ext4_find_extent
      0.16 ±  4%      +0.3        0.50 ± 10%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.09 ±  5%      +0.4        0.44 ±  8%  perf-profile.self.cycles-pp.ktime_get
      0.07 ±  5%      +0.4        0.45 ±  4%  perf-profile.self.cycles-pp.tmigr_quick_check
      0.12 ±  3%      +0.4        0.50 ± 17%  perf-profile.self.cycles-pp.ext4_es_lookup_extent
      0.29 ±  2%      +0.4        0.68        perf-profile.self.cycles-pp.__schedule
      0.19            +0.4        0.59 ±  9%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.05            +0.4        0.47 ± 20%  perf-profile.self.cycles-pp.ext4_sb_block_valid
      0.00            +0.4        0.42 ± 49%  perf-profile.self.cycles-pp.intel_idle
      0.25            +0.4        0.68 ± 34%  perf-profile.self.cycles-pp.__jbd2_journal_file_buffer
      0.14 ±  2%      +0.4        0.57 ± 15%  perf-profile.self.cycles-pp.need_update
      0.11 ±  9%      +0.5        0.58 ± 14%  perf-profile.self.cycles-pp.___perf_sw_event
      0.11 ±  6%      +0.5        0.62 ± 10%  perf-profile.self.cycles-pp.menu_select
      0.36            +0.5        0.87 ± 11%  perf-profile.self.cycles-pp.refresh_cpu_vm_stats
      0.66 ±  5%      +0.5        1.16 ± 22%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.27 ±  3%      +0.5        0.79 ± 15%  perf-profile.self.cycles-pp.__task_pid_nr_ns
      0.10 ±  5%      +0.5        0.64 ±  5%  perf-profile.self.cycles-pp.__tmigr_cpu_activate
      0.08 ±  6%      +0.6        0.63 ± 18%  perf-profile.self.cycles-pp.kmem_cache_free
      0.17 ±  2%      +0.6        0.73 ±  8%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.16 ±  3%      +0.6        0.73 ± 17%  perf-profile.self.cycles-pp.find_get_block_common
      0.09 ±  5%      +0.6        0.67 ± 41%  perf-profile.self.cycles-pp.jbd2_journal_commit_transaction
      0.16 ±  5%      +0.7        0.86 ± 10%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.24 ±  3%      +0.7        0.93 ± 17%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.21 ±  3%      +0.7        0.94 ± 15%  perf-profile.self.cycles-pp.xas_load
      0.17 ±  3%      +0.8        0.96 ± 28%  perf-profile.self.cycles-pp.crc32_lsb_vpclmul_avx512
      0.22 ±  3%      +1.0        1.20 ± 15%  perf-profile.self.cycles-pp.cpuidle_enter_state
      1.73            +3.2        4.88 ± 18%  perf-profile.self.cycles-pp.__do_sys_ioprio_get
      2.20 ±  2%      +8.6       10.85 ±  7%  perf-profile.self.cycles-pp.intel_idle_xstate




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


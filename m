Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7C80C07
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706714403; cv=fail; b=Kg7KLDGg3a39XiWUYztO13GKd3qNvNFYXLnjmtv68dyaVxJ7CIVbgcYmzUs99wcW4RlZyyV7AL9gnh+rzYfgyw/iCg638jhKNDZ1EXuYabG82qGYjr6/kHpcTsExEemtn/g1P4pFRTH474gfzfmHdeMKEkHnB0b0nPNKbkAixOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706714403; c=relaxed/simple;
	bh=0LMrfvV9C448t58mKVoSVaTROExIBYJgfodDJmB+LnA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WgCGEAlPe6cY21DxlXXQutomh/utN1MnBo5nlAgdQXhEu46NxQr7qdEq3PTi1D1hCK7GicuZhSSYzaUjj1/s19eMJnSXRa8lJZqg2lti+ZEMPAHdjBatn4iHpl0o9sTTiJsZFQgvZ2cKpZCqZgzurd0PLV6H9vApmqVt5HcwkPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjoBbsA/; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjoBbsA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706714398; x=1738250398;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0LMrfvV9C448t58mKVoSVaTROExIBYJgfodDJmB+LnA=;
  b=DjoBbsA/IFP+83iLuvBiRDrqhKAejgKBLkFqLp2BMpPOqQYXLzMd6Sk7
   Tq0w21xUuF5/g4xiNl1wvoQS3wbN242DFSecGM9Z708CK+9tfuGWgAT27
   eq0gG90sC4TPuT3upmScCkHrM4qUVk5Wj/+wyMNKBRloYvYKUOyj6hzrt
   dk9CBvHR9VoGrL5Vs7bI5AEW7zoBgXJlXP03FBk3etFtVq6UGzwG6RHCK
   o6FGZaomZgbZLqbtslRYxWHUzhv2F8vqUZBiIj7QEBfvB28xMJrkrM9qY
   u84272w7pKTzTT6CqOIRaF4gGM8NHK6jD0FXHpc15yrhJnxlBNZBqKj8c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10265073"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10265073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 07:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="30258714"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 07:18:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 07:18:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 07:18:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 07:18:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 07:18:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkZRfsRisGCMPdkpDctbuNIo7fVuX7JVDmSs0hzyAPl6mhYQgRvgcVYt4t3L+5ZtgVhKOhtrzi822RXRUnZQipGid0Hgbvt5QXWIRLQxfjyja9GtPSYqv0q5UMntFv3P33sytn3UCI7mXuCjAPz0aKHCho6QPn4trFt7EPVL8KNMGTR+xN3W1Z/AXrkhvsv3yGglMNW3fWcTlHZ5ILvZ0MNxVgN7UDObacFobZs6N13J8KLWr1zOFlLBdZOgNTVX9A7E95Nu1wHtiRjL3x6dz/12lUTAd3H/wU6WuWjIE/7tSDwMEs61t5RAa1OeME7yd2WSilxEAXcQJTd5kGbz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi2SS6W+r27k6TJB6HOmxpcnUmC4nwFTGvcEjjpue2o=;
 b=MIWfCMNWtIC52pulZvS7/lbgloLRRCdPoq2/ejWgUTZcOeqpPkln6Q8pNlPNQm6WqvDEP6E1OuzZ12z629AgAvKLQsi+wzep5HKgXHm3rs/Qe+/Xg44h8I2rzw4x2nj1AmbgIbdh4UxZk4QJaPwrFCokoWLGmvPdsXqGPKGJSpLAS8KslDaauOSjEzppKedy7DEZ1YQQ/rI2EsqripeLLWh32E9zrEuRUq7/5IIvwvWmLiNMgBBNhyx6TWw2Sva/SHfb6/cJQrG0+amcH6Zhz/QpBfK6bk0LLhX5Pvx7NAZGXxTs28ClY4KujdveeYf/OBB9735hbVArsABo2bX7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 15:18:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 15:18:04 +0000
Date: Wed, 31 Jan 2024 23:17:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_v3_0113] 5e887f0037:
 stress-ng.sync-file.ops_per_sec -6.8% regression
Message-ID: <202401312212.f0f4517c-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: bca9c287-59d2-4573-152d-08dc226fd232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ik+NnJwqv1EaYpmB1x6zVfuvr3lfNXVNCAtzMqu6NGJMLEX0tswmtrotPsBK+FR8Jx9GWxP+3+kNeM5ZhXXVufCXPp9rq2HLiXmmT/angq5Ts9NvZzJ2CrMajFnGG8RYWCpFyw0qwehNqygwT0vxSpvudMGCQeA9lbxRMkM2mEbq3xMc6Uq2WLP54iK0qs8AVQZy9LVFtIp71bs7k2TKrIwyjmu7fJI+Fob/1r+ufa7LDS9+ERz/A68wjyxOoTFTSdCO0xrdIp0rf7C9Rcc/ql0tg0vPjlavtlxx9NJ4bmQq4htAlVzz6iufAbUX9S+jEt8IO/e9Jfh9sLo6b72HyH6DS9eDBTNSxq8SS9tGojybtfhHVUjMAiRIfNAOvFHLLEA1TCBDP4vKPZUQldVfBsLz9F+o2gylOM6py2mCk3DAUspNik+axCpqKSQRbigQu7r7r1oRrZMhaUfuy6RFS5b9YuCazQwe0iFV6Zp06lmbTvKEJiN8yW0/4H3el5NClvir2WovJ3MRwHE3q8Md4nLwxJTt/iAjgW6RBLnVCR9nYNh274pQnIB4CwR1nDKPDPrAfhfpNPm/cd9+HZ8YjvTOO7j45BJ6yQ+dmruUuBFYSIRmvigxTWFm2yXD38qq4bI7Qg+idbxyQvf2kVIGJwyJSJ1icjUPiXMu/h41f/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230473577357003)(230373577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(26005)(1076003)(107886003)(41300700001)(66476007)(966005)(6916009)(316002)(478600001)(36756003)(6512007)(6506007)(83380400001)(6666004)(6486002)(38100700002)(66556008)(82960400001)(5660300002)(8936002)(30864003)(2906002)(86362001)(66946007)(19627235002)(8676002)(4326008)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fNWRgl4YHHEblbwcgkNoszWuuMNwvhKeaTiGjAQGOfksqiJqFpZBtDUrRI?=
 =?iso-8859-1?Q?CvDa+qEJuYJTpyx5Upf8cUD2bwegeq7jbQmihhn3TJOT1mN6Z9gYvIpSHj?=
 =?iso-8859-1?Q?mJGZGUNXx3IIf/3mEyOwdrxc1MWd0nWPY7+3jj/UmD50Ximpkfm2bfqS8S?=
 =?iso-8859-1?Q?axErjVphEzQUXUPfJorEiteMVGN8JJB1ULy/O32tszE0427UWULAiTCa0u?=
 =?iso-8859-1?Q?AdbGYK3PMwiNdstEMvskv7n2rvdx+iOGRgG0IkGthXShVHyfpNs8KF+BF0?=
 =?iso-8859-1?Q?NH2J+Iq0/4iL0x6Y+Mb/u13yKGKhglCviWDGwb5umCjhb6wMQslF1WsqdO?=
 =?iso-8859-1?Q?Z/tVjsZ+ewIIq/bjjbv05HDsonDIjQy2xOCH0/OkUqDAgsVltWAVtbEQF6?=
 =?iso-8859-1?Q?3whOS/Xy44/e9MJYoNOlHrrV5z/stp4XUhN/RPi184p06TJTNUxFVDIwQs?=
 =?iso-8859-1?Q?Rd+29PKQ4cHkuaSW48gSnQzA/DEzyaF+Q65AqhsjqfglUY8rZihV+fKStM?=
 =?iso-8859-1?Q?eHtrLJNuiZ3MJVPmO+cT8wDeLRfTSmce0WGp7sxVafvtgf8JDOfmhXGksp?=
 =?iso-8859-1?Q?Y5lUsfpdNmUBJjKre0jZ8X/vSXrB2gAhmIFNEfzRuXzKk8ikRbQdEbggxY?=
 =?iso-8859-1?Q?wz9zRMcIfkPDdBT+YDM6slyV0hUGz3809CMCRgaSRj6Qyb2LvbykjKxXXK?=
 =?iso-8859-1?Q?/BJSFOk+GYUDfQYlmysr0KjJKAixYZmqfhVfNYAajEJK9VWYhoXzhrg0v4?=
 =?iso-8859-1?Q?8MAszIG4UQez+avC5sQ/d3pa7ehwJlrhOxtZMLEioF56T7Y2Y5eA/NmiuR?=
 =?iso-8859-1?Q?OrJ0frWqb5eJxFEVdq+4X7u74QvxzA+VCSdNZ9SyhCzPT4ALS3yNgtU7mh?=
 =?iso-8859-1?Q?dj2lQpqhOEJTWYLkBvjksCkdicN2t20/djngJZR+Th1GpKM7M1pzzJ342e?=
 =?iso-8859-1?Q?w2IhyOZy4W/BXP1dv1fsPiDz0n2QRmn1U08vUBxDVmoDL9rEKgedcs2EoP?=
 =?iso-8859-1?Q?UZHH5slp8bYTd5rJ15AjDJKxSS+4ijcSX4Syb23sWuOWsfw4Ckq3e0MDJe?=
 =?iso-8859-1?Q?vMX0WfX35VueJVLrfc/uaU2vTQQxfB6g05HCwa2bBxt9vM/xEog1BWGIms?=
 =?iso-8859-1?Q?KXXjG5UdneFZLi0WUl/hUdEV1RKyxCwqj00H7F6VtZ/G9T/yMHOCdMGyyl?=
 =?iso-8859-1?Q?XlMSUhJfW0iRUfuirdIK/mMz0dmbJZusq0aE0WbmxYUUXHh9jnLzKhkp98?=
 =?iso-8859-1?Q?Ms1RPkmH2XAzWU9Pxt23RExCl+uWnkw6Qx7wL3NifN7hp04ry81brjV7H7?=
 =?iso-8859-1?Q?h9XN+FsPQh5JVMSCsLIlreFcD5DhqGdvwo5UfrNH2g7ah1XVOfcPGJdkgT?=
 =?iso-8859-1?Q?bfayYlJ2TaGH6wypf2qfBfmP/nF2Wmam2h2oE0wf+bLBdWiGlg/wOMNbrX?=
 =?iso-8859-1?Q?yd1AN2afXFi2w0EfmFw5M3az+dy79/HPaYea8UMq/21R9ChKOWaCR9rR5Z?=
 =?iso-8859-1?Q?lN+rJz+wWCtwTJBrFQEm+8LEDfrpUmJuYMMonJC3ofQ1LfGSd7PuM0KiBz?=
 =?iso-8859-1?Q?H+iNi0MzMecpmYeBSyka8WUO/5R+AAmbHCyYyKsTcPI8Doi/quSdAPE2p7?=
 =?iso-8859-1?Q?rgYj0l+fPv/LZUEswwKuoQTV1eJyYeNEiXmSxoQs8l5Ba9zHhbkqi+mA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bca9c287-59d2-4573-152d-08dc226fd232
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 15:18:04.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFM1xr6Pvg14XD4Rqj3AlgE0SyC4cRdspsb50FbO+yi6RPPyJPC8YqDM1sjwjxPJQgLWajHPtYtDaXens+xXgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -6.8% regression of stress-ng.sync-file.ops_per_sec on:


commit: 5e887f00379ac36883e4ef0ef418b2401686ebc9 ("pcp alloc opt")
https://github.com/gestionlin/linux.git page_frag_v3_0113

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 10%
	disk: 1HDD
	testtime: 60s
	fs: xfs
	test: sync-file
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput -4.2% regression                                         |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory        |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | runtime=300s                                                                                       |
|                  | size=256G                                                                                          |
|                  | test=lru-shm-rand                                                                                  |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps 27.9% improvement                                                 |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory         |
| test parameters  | cluster=cs-localhost                                                                               |
|                  | cpufreq_governor=performance                                                                       |
|                  | ip=ipv4                                                                                            |
|                  | nr_threads=50%                                                                                     |
|                  | runtime=300s                                                                                       |
|                  | send_size=10K                                                                                      |
|                  | test=SCTP_STREAM_MANY                                                                              |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sync-file.ops_per_sec -7.7% regression                                        |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory          |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | disk=1HDD                                                                                          |
|                  | fs=ext4                                                                                            |
|                  | nr_threads=10%                                                                                     |
|                  | test=sync-file                                                                                     |
|                  | testtime=60s                                                                                       |
+------------------+----------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202401312212.f0f4517c-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240131/202401312212.f0f4517c-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/1HDD/xfs/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp8/sync-file/stress-ng/60s

commit: 
  afc3b8a755 ("per_cpu")
  5e887f0037 ("pcp alloc opt")

afc3b8a755764a29 5e887f00379ac36883e4ef0ef41 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    204988 ±  6%     -28.0%     147644 ± 11%  meminfo.DirectMap4k
      0.06 ±  2%      +0.0        0.07 ±  3%  mpstat.cpu.all.soft%
     87.67 ± 26%     +52.7%     133.83 ±  6%  perf-c2c.DRAM.local
     98.22            -2.7%      95.56        turbostat.RAMWatt
 1.873e+08 ± 10%     -21.7%  1.466e+08 ± 11%  numa-numastat.node1.local_node
 1.876e+08 ± 10%     -21.8%  1.467e+08 ± 11%  numa-numastat.node1.numa_hit
      2631            -6.8%       2452        stress-ng.sync-file.ops
     43.85            -6.8%      40.86        stress-ng.sync-file.ops_per_sec
    249651 ± 31%     -48.0%     129815 ± 58%  numa-meminfo.node0.Inactive
    249553 ± 31%     -48.0%     129681 ± 58%  numa-meminfo.node0.Inactive(anon)
     81810 ± 16%     -63.5%      29839 ± 71%  numa-meminfo.node0.Mapped
      3920 ± 10%     -21.9%       3060 ± 19%  numa-meminfo.node0.PageTables
     26183 ± 50%    +200.1%      78587 ± 27%  numa-meminfo.node1.Mapped
 3.498e+08            -5.1%  3.321e+08        proc-vmstat.numa_hit
 3.492e+08            -5.1%  3.315e+08        proc-vmstat.numa_local
     29609            +3.0%      30495 ±  3%  proc-vmstat.pgactivate
  3.46e+08            -6.8%  3.224e+08        proc-vmstat.pgalloc_normal
  3.46e+08            -6.9%  3.223e+08        proc-vmstat.pgfree
  3.45e+08            -6.8%  3.215e+08        proc-vmstat.unevictable_pgs_culled
     62389 ± 31%     -48.0%      32422 ± 58%  numa-vmstat.node0.nr_inactive_anon
     20453 ± 16%     -63.5%       7460 ± 71%  numa-vmstat.node0.nr_mapped
    980.09 ± 10%     -22.0%     764.68 ± 19%  numa-vmstat.node0.nr_page_table_pages
     62389 ± 31%     -48.0%      32422 ± 58%  numa-vmstat.node0.nr_zone_inactive_anon
      6549 ± 50%    +200.0%      19649 ± 27%  numa-vmstat.node1.nr_mapped
 1.876e+08 ± 10%     -21.8%  1.467e+08 ± 11%  numa-vmstat.node1.numa_hit
 1.873e+08 ± 10%     -21.7%  1.466e+08 ± 11%  numa-vmstat.node1.numa_local
      0.10 ±  9%     +41.5%       0.14 ±  8%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.48 ±  3%     +26.0%       0.60 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
    408.49 ±  3%      +9.9%     449.00 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     31.17 ± 11%     -45.5%      17.00 ± 72%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
    270.67 ±  4%     -12.5%     236.83 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
    834.33 ±  2%      -9.3%     756.33 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.72 ± 15%     +65.9%       4.52 ± 45%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.48 ±  3%     +26.0%       0.60 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.44 ± 10%     +28.4%       0.57 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
    408.39 ±  3%      +9.9%     448.86 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.48 ± 12%     +65.4%       2.46 ± 20%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
      2.72 ± 15%     +65.9%       4.52 ± 45%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.61 ± 25%     +58.3%       2.55 ± 16%  perf-sched.wait_time.max.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      4.04            +3.7%       4.19        perf-stat.i.MPKI
 5.308e+09            -5.0%   5.04e+09        perf-stat.i.branch-instructions
 1.057e+08            -1.3%  1.043e+08        perf-stat.i.cache-misses
 4.153e+08            -2.4%  4.051e+08        perf-stat.i.cache-references
      0.88            +4.8%       0.92        perf-stat.i.cpi
    218.99            +1.1%     221.33        perf-stat.i.cycles-between-cache-misses
 6.794e+09            -4.6%  6.482e+09        perf-stat.i.dTLB-loads
      0.00 ±  4%      +0.0        0.00 ±  3%  perf-stat.i.dTLB-store-miss-rate%
     28496 ±  4%     +57.8%      44975 ±  3%  perf-stat.i.dTLB-store-misses
 3.899e+09            -4.4%  3.726e+09        perf-stat.i.dTLB-stores
  2.63e+10            -4.8%  2.503e+10        perf-stat.i.instructions
      1.14            -4.6%       1.09        perf-stat.i.ipc
    256.41            -4.6%     244.51        perf-stat.i.metric.M/sec
     42.88           -27.4       15.50 ±  3%  perf-stat.i.node-load-miss-rate%
    741862 ±  2%     -29.2%     525345 ±  2%  perf-stat.i.node-load-misses
    989721          +193.3%    2902517        perf-stat.i.node-loads
  49824539 ±  2%      -5.6%   47017945        perf-stat.i.node-stores
      4.02            +3.7%       4.17        perf-stat.overall.MPKI
      0.88            +4.8%       0.92        perf-stat.overall.cpi
    218.42            +1.0%     220.69        perf-stat.overall.cycles-between-cache-misses
      0.00 ±  4%      +0.0        0.00 ±  3%  perf-stat.overall.dTLB-store-miss-rate%
      1.14            -4.6%       1.09        perf-stat.overall.ipc
     42.84           -27.5       15.33 ±  3%  perf-stat.overall.node-load-miss-rate%
 5.218e+09            -5.0%  4.955e+09        perf-stat.ps.branch-instructions
 1.039e+08            -1.3%  1.026e+08        perf-stat.ps.cache-misses
 4.084e+08            -2.4%  3.984e+08        perf-stat.ps.cache-references
  6.68e+09            -4.6%  6.374e+09        perf-stat.ps.dTLB-loads
     27977 ±  4%     +57.9%      44186 ±  3%  perf-stat.ps.dTLB-store-misses
 3.834e+09            -4.4%  3.664e+09        perf-stat.ps.dTLB-stores
 2.586e+10            -4.8%  2.461e+10        perf-stat.ps.instructions
    729530 ±  2%     -29.2%     516638 ±  2%  perf-stat.ps.node-load-misses
    973123          +193.3%    2854405        perf-stat.ps.node-loads
  48991354 ±  2%      -5.6%   46231679        perf-stat.ps.node-stores
 1.571e+12            -4.6%  1.498e+12        perf-stat.total.instructions
     37.13 ±  5%      -2.7       34.46 ±  3%  perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      6.85            -0.4        6.50        perf-profile.calltrace.cycles-pp.folio_add_lru.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write
      6.28            -0.3        5.94        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio.simple_write_begin
      5.35            -0.3        5.06        perf-profile.calltrace.cycles-pp.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      5.28            -0.3        5.00        perf-profile.calltrace.cycles-pp.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache.simple_setattr
      1.79 ±  5%      -0.3        1.51 ±  4%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      3.96 ±  2%      -0.2        3.75        perf-profile.calltrace.cycles-pp.lru_add_fn.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio
      0.77 ± 12%      -0.2        0.60 ±  8%  perf-profile.calltrace.cycles-pp.get_mem_cgroup_from_mm.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      1.26 ±  5%      -0.2        1.10 ±  3%  perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache
      4.16            -0.2        4.00        perf-profile.calltrace.cycles-pp.delete_from_page_cache_batch.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      0.92 ±  7%      -0.2        0.75 ±  4%  perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release.truncate_inode_pages_range
      0.59 ±  3%      -0.1        0.45 ± 44%  perf-profile.calltrace.cycles-pp.xas_create.xas_store.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      0.71 ±  8%      -0.1        0.58 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release
      1.33 ±  3%      -0.1        1.22 ±  4%  perf-profile.calltrace.cycles-pp.xas_store.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      1.04 ±  6%      -0.1        0.93 ±  5%  perf-profile.calltrace.cycles-pp.filemap_unaccount_folio.delete_from_page_cache_batch.truncate_inode_pages_range.truncate_pagecache.simple_setattr
      0.86 ±  7%      -0.1        0.76 ±  6%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.filemap_unaccount_folio.delete_from_page_cache_batch.truncate_inode_pages_range.truncate_pagecache
      1.66            -0.1        1.56 ±  2%  perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.43            -0.1        1.35 ±  2%  perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      1.39 ±  2%      -0.1        1.31        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      1.12 ±  3%      -0.1        1.06 ±  2%  perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      0.64 ±  2%      -0.1        0.59 ±  3%  perf-profile.calltrace.cycles-pp.release_pages.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio
      0.62 ±  3%      -0.0        0.57 ±  3%  perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      1.32 ±  2%      +0.1        1.46 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page_list.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.notify_change.do_truncate.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.simple_setattr.notify_change.do_truncate.do_sys_ftruncate.do_syscall_64
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.do_truncate.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.truncate_pagecache.simple_setattr.notify_change.do_truncate.do_sys_ftruncate
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.88            +0.4       14.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.88            +0.4       14.33        perf-profile.calltrace.cycles-pp.ftruncate64
     13.82            +0.4       14.26        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change.do_truncate
     18.10            +0.5       18.60        perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.free_unref_page_commit.free_unref_page_list.release_pages.__folio_batch_release.truncate_inode_pages_range
     10.74            +0.9       11.63        perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write
      2.40            +1.0        3.36        perf-profile.calltrace.cycles-pp.find_lock_entries.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      0.00            +1.4        1.40 ± 14%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages
      3.65 ±  2%      +1.5        5.14 ±  2%  perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      1.62 ±  2%      +1.7        3.36 ±  2%  perf-profile.calltrace.cycles-pp.mem_cgroup_commit_charge.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      4.74            +1.9        6.62 ±  4%  perf-profile.calltrace.cycles-pp.folio_alloc.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      4.46            +1.9        6.37 ±  5%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc.__filemap_get_folio.simple_write_begin.generic_perform_write
      3.66            +2.0        5.62 ±  6%  perf-profile.calltrace.cycles-pp.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio.simple_write_begin
      2.60            +2.1        4.74 ±  7%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
     25.34            +2.2       27.56        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     25.00            +2.3       27.26        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      1.72            +2.3        4.00 ±  8%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_mpol.folio_alloc
      0.00            +3.6        3.59 ±  9%  perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_mpol
     37.22 ±  5%      -2.7       34.54 ±  3%  perf-profile.children.cycles-pp.simple_write_end
      2.77 ±  5%      -0.4        2.37 ±  4%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      6.87            -0.3        6.53        perf-profile.children.cycles-pp.folio_add_lru
      5.99            -0.3        5.65        perf-profile.children.cycles-pp.release_pages
      6.32            -0.3        5.98        perf-profile.children.cycles-pp.folio_batch_move_lru
      5.35            -0.3        5.07        perf-profile.children.cycles-pp.__folio_batch_release
      4.11 ±  2%      -0.2        3.89        perf-profile.children.cycles-pp.lru_add_fn
      0.80 ± 11%      -0.2        0.62 ±  7%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      4.25            -0.2        4.08        perf-profile.children.cycles-pp.delete_from_page_cache_batch
      1.30 ±  5%      -0.2        1.14 ±  3%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.92 ±  7%      -0.2        0.76 ±  4%  perf-profile.children.cycles-pp.uncharge_batch
      3.42            -0.2        3.26 ±  2%  perf-profile.children.cycles-pp.xas_store
      0.72 ±  8%      -0.1        0.59 ±  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.12 ±  5%      -0.1        0.99 ±  5%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      1.72            -0.1        1.62 ±  2%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.61 ±  4%      -0.1        0.51 ±  3%  perf-profile.children.cycles-pp.__count_memcg_events
      1.53 ±  2%      -0.1        1.44 ±  2%  perf-profile.children.cycles-pp.fault_in_readable
      0.19 ±  4%      -0.1        0.10 ± 15%  perf-profile.children.cycles-pp.propagate_protected_usage
      1.55 ±  2%      -0.1        1.48 ±  2%  perf-profile.children.cycles-pp.xas_descend
      1.43 ±  2%      -0.1        1.36        perf-profile.children.cycles-pp.filemap_get_entry
      1.10 ±  3%      -0.1        1.02        perf-profile.children.cycles-pp.folio_unlock
      0.62 ±  4%      -0.1        0.56 ±  3%  perf-profile.children.cycles-pp.xas_create
      0.94 ±  3%      -0.1        0.88 ±  2%  perf-profile.children.cycles-pp.xas_find_conflict
      0.65 ±  4%      -0.1        0.60 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.81            -0.1        0.75 ±  2%  perf-profile.children.cycles-pp.folio_mapping
      0.55 ±  4%      -0.0        0.50 ±  3%  perf-profile.children.cycles-pp.sync_file_range
      0.38 ±  8%      -0.0        0.34 ±  3%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.30 ±  4%      -0.0        0.26 ±  6%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      0.27 ±  6%      -0.0        0.24 ±  7%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.30 ±  4%      -0.0        0.27 ±  6%  perf-profile.children.cycles-pp.xas_alloc
      0.06 ±  7%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      0.13 ±  5%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.__slab_free
      0.22 ±  5%      +0.0        0.24 ±  4%  perf-profile.children.cycles-pp.memcg_check_events
      0.08 ± 13%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp.write@plt
      0.16 ±  9%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.shim_emulate_fallocate
      0.29 ±  7%      +0.1        0.35 ±  5%  perf-profile.children.cycles-pp.__free_one_page
      1.37 ±  2%      +0.1        1.51 ±  2%  perf-profile.children.cycles-pp.free_unref_page_list
      0.52 ±  8%      +0.2        0.68 ±  6%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.92 ±  3%      +0.2        1.11 ±  4%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.00            +0.3        0.26 ±  6%  perf-profile.children.cycles-pp._find_next_bit
      0.24 ±  5%      +0.3        0.52 ±  4%  perf-profile.children.cycles-pp.rmqueue_bulk
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.notify_change
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.simple_setattr
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.do_sys_ftruncate
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.do_truncate
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.truncate_inode_pages_range
     13.88            +0.4       14.32        perf-profile.children.cycles-pp.truncate_pagecache
     13.88            +0.4       14.33        perf-profile.children.cycles-pp.ftruncate64
     18.17            +0.5       18.67        perf-profile.children.cycles-pp.filemap_add_folio
     11.02            +0.9       11.89        perf-profile.children.cycles-pp.__filemap_add_folio
      0.61 ±  3%      +0.9        1.53 ± 14%  perf-profile.children.cycles-pp._raw_spin_trylock
      2.42            +1.0        3.39        perf-profile.children.cycles-pp.find_lock_entries
      3.78 ±  2%      +1.5        5.27 ±  2%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      1.70 ±  2%      +1.7        3.44        perf-profile.children.cycles-pp.mem_cgroup_commit_charge
      4.82            +1.9        6.70 ±  4%  perf-profile.children.cycles-pp.folio_alloc
      4.55            +1.9        6.47 ±  5%  perf-profile.children.cycles-pp.alloc_pages_mpol
      3.77            +2.0        5.75 ±  5%  perf-profile.children.cycles-pp.__alloc_pages
      2.68            +2.2        4.83 ±  7%  perf-profile.children.cycles-pp.get_page_from_freelist
     25.38            +2.2       27.61        perf-profile.children.cycles-pp.simple_write_begin
     25.13            +2.2       27.38        perf-profile.children.cycles-pp.__filemap_get_folio
      1.79            +2.3        4.07 ±  8%  perf-profile.children.cycles-pp.rmqueue
      0.00            +3.7        3.71 ±  9%  perf-profile.children.cycles-pp.rmqueue_pcplist
     35.33 ±  5%      -2.5       32.80 ±  3%  perf-profile.self.cycles-pp.simple_write_end
      0.67 ±  2%      -0.3        0.33 ±  5%  perf-profile.self.cycles-pp.rmqueue
      1.01 ±  5%      -0.3        0.75 ±  5%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      0.77 ± 12%      -0.2        0.59 ±  8%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      2.66            -0.2        2.51        perf-profile.self.cycles-pp.lru_add_fn
      0.86            -0.2        0.71 ±  3%  perf-profile.self.cycles-pp.__alloc_pages
      0.91 ±  3%      -0.1        0.78 ±  3%  perf-profile.self.cycles-pp.get_page_from_freelist
      1.54 ±  2%      -0.1        1.42        perf-profile.self.cycles-pp.release_pages
      1.62            -0.1        1.52 ±  2%  perf-profile.self.cycles-pp.__filemap_add_folio
      1.50 ±  2%      -0.1        1.41 ±  2%  perf-profile.self.cycles-pp.fault_in_readable
      0.18 ±  3%      -0.1        0.09 ± 14%  perf-profile.self.cycles-pp.propagate_protected_usage
      1.04 ±  2%      -0.1        0.97        perf-profile.self.cycles-pp.folio_unlock
      0.44 ±  3%      -0.1        0.38 ±  5%  perf-profile.self.cycles-pp.__count_memcg_events
      0.85            -0.1        0.79 ±  2%  perf-profile.self.cycles-pp.xas_load
      0.79 ±  4%      -0.1        0.74 ±  3%  perf-profile.self.cycles-pp.vfs_write
      0.71 ±  2%      -0.0        0.66        perf-profile.self.cycles-pp.folio_mapping
      0.48 ±  2%      -0.0        0.44 ±  4%  perf-profile.self.cycles-pp.write
      0.34 ±  4%      -0.0        0.31 ±  5%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.25 ±  4%      -0.0        0.22 ±  5%  perf-profile.self.cycles-pp.policy_nodemask
      0.21 ±  3%      -0.0        0.19 ±  7%  perf-profile.self.cycles-pp.inode_needs_update_time
      0.13 ±  5%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.__slab_free
      0.11 ±  9%      -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.generic_write_check_limits
      0.38 ±  3%      +0.0        0.41 ±  2%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.12 ±  7%      +0.0        0.16 ±  7%  perf-profile.self.cycles-pp.memcg_check_events
      0.16 ±  9%      +0.0        0.19 ±  7%  perf-profile.self.cycles-pp.shim_emulate_fallocate
      0.25 ±  7%      +0.1        0.32 ±  6%  perf-profile.self.cycles-pp.__free_one_page
      0.08 ± 14%      +0.1        0.17 ±  7%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.00            +0.2        0.21 ±  7%  perf-profile.self.cycles-pp._find_next_bit
      0.20 ±  5%      +0.2        0.44 ±  5%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.58 ±  3%      +0.9        1.49 ± 14%  perf-profile.self.cycles-pp._raw_spin_trylock
      2.06            +1.0        3.02        perf-profile.self.cycles-pp.find_lock_entries
      0.00            +1.5        1.54 ±  9%  perf-profile.self.cycles-pp.rmqueue_pcplist
      0.99 ±  6%      +1.8        2.79        perf-profile.self.cycles-pp.mem_cgroup_commit_charge


***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/300s/256G/lkp-spr-2sp4/lru-shm-rand/vm-scalability

commit: 
  afc3b8a755 ("per_cpu")
  5e887f0037 ("pcp alloc opt")

afc3b8a755764a29 5e887f00379ac36883e4ef0ef41 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.05            +1.5%       0.05        vm-scalability.free_time
     74324            -4.3%      71155        vm-scalability.median
  16632308            -4.2%   15927315        vm-scalability.throughput
     81.76           +16.3%      95.12        vm-scalability.time.elapsed_time
     81.76           +16.3%      95.12        vm-scalability.time.elapsed_time.max
      9670           -10.0%       8700        vm-scalability.time.percent_of_cpu_this_job_got
    931.90           +45.3%       1354        vm-scalability.time.system_time
 1.058e+10 ±  3%     +23.7%  1.308e+10        cpuidle..time
  11198306 ±  3%     +22.4%   13707081        cpuidle..usage
      5.25 ±  2%      +1.3        6.51        mpstat.cpu.all.sys%
     37.57 ±  2%      -5.4       32.22        mpstat.cpu.all.usr%
    140.96            +9.7%     154.58        uptime.boot
     22345 ±  2%     +11.9%      25003        uptime.idle
  52242400           -10.6%   46730497        numa-meminfo.node0.Mapped
  52355074 ±  2%     -12.0%   46080612        numa-meminfo.node1.Mapped
    115343 ±  2%      -9.6%     104239        numa-meminfo.node1.PageTables
  13063712           -10.6%   11682925        numa-vmstat.node0.nr_mapped
  13088676 ±  2%     -12.0%   11518777        numa-vmstat.node1.nr_mapped
     28828 ±  2%      -9.6%      26048        numa-vmstat.node1.nr_page_table_pages
     36.66 ±  2%     -14.0%      31.51        vmstat.cpu.us
     96.15 ±  2%      -9.4%      87.10        vmstat.procs.r
      4102            -5.6%       3872        vmstat.system.cs
      8491 ±  2%     +25.0%      10617        meminfo.Active
      8270 ±  2%     +25.7%      10398        meminfo.Active(anon)
 1.048e+08 ±  2%     -11.5%   92750738        meminfo.Mapped
    232375            -9.3%     210727        meminfo.PageTables
      1266            -9.2%       1150        turbostat.Avg_MHz
     43.84            -4.1       39.78        turbostat.Busy%
   5355637 ±  3%     +21.3%    6496114        turbostat.C1E
     25.24            +1.8       27.05        turbostat.C1E%
   5848983 ±  3%     +24.0%    7251098        turbostat.C6
     65.18 ± 41%     -56.5%      28.36 ± 48%  turbostat.IPC
  19277893           +15.1%   22181145        turbostat.IRQ
    530.36            -2.3%     518.17        turbostat.PkgWatt
     41.33            -4.8%      39.36        turbostat.RAMWatt
      2067 ±  2%     +25.5%       2594        proc-vmstat.nr_active_anon
     99529            -1.2%      98316        proc-vmstat.nr_anon_pages
   8283292            +4.0%    8618668        proc-vmstat.nr_dirty_background_threshold
  16586837            +4.0%   17258409        proc-vmstat.nr_dirty_threshold
  46942513            -6.3%   43997272        proc-vmstat.nr_file_pages
  83499833            +4.0%   86858509        proc-vmstat.nr_free_pages
  46340785            -6.4%   43393704        proc-vmstat.nr_inactive_anon
  26192887 ±  2%     -11.3%   23226244        proc-vmstat.nr_mapped
     58086            -9.2%      52754        proc-vmstat.nr_page_table_pages
  46245798            -6.4%   43300554        proc-vmstat.nr_shmem
    146192            -3.8%     140584        proc-vmstat.nr_slab_reclaimable
      2067 ±  2%     +25.5%       2594        proc-vmstat.nr_zone_active_anon
  46340785            -6.4%   43393703        proc-vmstat.nr_zone_inactive_anon
      3.25 ± 25%      -1.8        1.46 ± 78%  perf-profile.calltrace.cycles-pp.arch_show_interrupts.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
      1.51 ±127%      +5.0        6.46 ± 36%  perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      1.51 ±127%      +5.0        6.46 ± 36%  perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      9.84 ± 28%      +7.4       17.24 ± 19%  perf-profile.calltrace.cycles-pp.__libc_write.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist
      9.84 ± 28%      +7.4       17.24 ± 19%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.writen.record__pushfn
      9.84 ± 28%      +7.4       17.24 ± 19%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.writen.record__pushfn.perf_mmap__push
      9.84 ± 28%      +7.7       17.51 ± 19%  perf-profile.calltrace.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record
      9.84 ± 28%      +7.7       17.51 ± 19%  perf-profile.calltrace.cycles-pp.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.writen
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      3.25 ± 25%      -1.8        1.46 ± 78%  perf-profile.children.cycles-pp.arch_show_interrupts
      1.51 ±127%      +5.0        6.46 ± 36%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      1.51 ±127%      +5.0        6.46 ± 36%  perf-profile.children.cycles-pp.shmem_write_begin
     13.29 ± 20%      +5.8       19.08 ± 19%  perf-profile.children.cycles-pp.perf_mmap__push
     13.29 ± 20%      +5.8       19.08 ± 19%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      9.84 ± 28%      +7.7       17.51 ± 19%  perf-profile.children.cycles-pp.record__pushfn
      9.84 ± 28%      +7.7       17.51 ± 19%  perf-profile.children.cycles-pp.writen
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.children.cycles-pp.generic_perform_write
      9.42 ± 25%      +7.8       17.24 ± 19%  perf-profile.children.cycles-pp.shmem_file_write_iter
      9.84 ± 28%      +7.9       17.72 ± 20%  perf-profile.children.cycles-pp.__libc_write
     10.34 ± 25%      +9.6       19.98 ± 42%  perf-profile.children.cycles-pp.ksys_write
     10.34 ± 25%      +9.6       19.98 ± 42%  perf-profile.children.cycles-pp.vfs_write
    403607 ±223%    +470.4%    2302360 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.14 ±129%    +294.0%       0.53        sched_debug.cfs_rq:/.h_nr_running.avg
    376.75 ±223%    +507.3%       2288        sched_debug.cfs_rq:/.load.min
      1937 ± 32%     -57.7%     819.05 ± 71%  sched_debug.cfs_rq:/.load_avg.avg
     79521 ± 20%     -48.0%      41385 ±  6%  sched_debug.cfs_rq:/.load_avg.max
     11175 ± 22%     -55.6%       4966 ± 42%  sched_debug.cfs_rq:/.load_avg.stddev
    403607 ±223%    +470.4%    2302360 ± 10%  sched_debug.cfs_rq:/.min_vruntime.min
      0.13 ±128%    +293.1%       0.53        sched_debug.cfs_rq:/.nr_running.avg
    487.58 ± 18%     -53.9%     224.92 ± 44%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     66.12 ± 22%     -49.5%      33.37 ± 57%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    487.42 ± 18%     -53.9%     224.92 ± 44%  sched_debug.cfs_rq:/.removed.util_avg.max
     66.11 ± 22%     -49.5%      33.37 ± 57%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      1206 ± 11%     +26.8%       1529 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
     81.92 ±223%    +464.6%     462.50 ± 15%  sched_debug.cfs_rq:/.util_avg.min
     48.09 ±170%    +384.2%     232.83 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     83.63 ± 11%     +30.8%     109.39 ±  9%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
      7641 ±143%   +2373.8%     189026 ± 21%  sched_debug.cpu.avg_idle.min
    180140 ± 10%     -20.1%     143883 ±  5%  sched_debug.cpu.avg_idle.stddev
     63347 ± 16%     +40.5%      89031        sched_debug.cpu.clock.avg
     63364 ± 16%     +40.6%      89069        sched_debug.cpu.clock.max
     63324 ± 16%     +40.5%      88990        sched_debug.cpu.clock.min
     10.14 ± 37%    +118.1%      22.11 ± 11%  sched_debug.cpu.clock.stddev
     63165 ± 15%     +40.3%      88592        sched_debug.cpu.clock_task.avg
     63289 ± 15%     +40.2%      88756        sched_debug.cpu.clock_task.max
     50355 ± 20%     +50.2%      75631        sched_debug.cpu.clock_task.min
      1125 ±172%    +398.2%       5606        sched_debug.cpu.curr->pid.avg
      5745 ± 21%     +47.7%       8484        sched_debug.cpu.curr->pid.max
    420.17 ±223%   +1028.4%       4741 ± 20%  sched_debug.cpu.curr->pid.min
    781441 ± 15%     -21.5%     613097 ± 14%  sched_debug.cpu.max_idle_balance_cost.max
     29081 ± 70%     -68.6%       9139 ± 74%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 69%    +336.2%       0.00 ± 16%  sched_debug.cpu.next_balance.stddev
      0.13 ±130%    +298.6%       0.54        sched_debug.cpu.nr_running.avg
     63330 ± 16%     +40.5%      88993        sched_debug.cpu_clk
     62120 ± 16%     +41.3%      87783        sched_debug.ktime
     64295 ± 15%     +40.0%      89987        sched_debug.sched_clk
 2.073e+10           -13.0%  1.803e+10        perf-stat.i.branch-instructions
      0.33 ±  6%      +0.1        0.41        perf-stat.i.branch-miss-rate%
     49.70           +14.9       64.57        perf-stat.i.cache-miss-rate%
 1.437e+09           -15.4%  1.216e+09        perf-stat.i.cache-misses
 1.699e+09           -14.0%  1.461e+09        perf-stat.i.cache-references
      3840            -6.4%       3593        perf-stat.i.context-switches
 2.852e+11           -11.4%  2.529e+11 ±  2%  perf-stat.i.cpu-cycles
    715.84 ±  9%     -52.1%     342.61        perf-stat.i.cycles-between-cache-misses
      1.52            -0.2        1.31        perf-stat.i.dTLB-load-miss-rate%
 8.309e+08           -14.4%  7.111e+08        perf-stat.i.dTLB-load-misses
 2.569e+10           -13.2%   2.23e+10        perf-stat.i.dTLB-loads
      0.05 ±  3%      +0.0        0.08        perf-stat.i.dTLB-store-miss-rate%
   7029895           -12.7%    6137679 ±  5%  perf-stat.i.dTLB-store-misses
 8.742e+09           -13.6%  7.552e+09        perf-stat.i.dTLB-stores
 8.925e+10           -13.0%  7.769e+10        perf-stat.i.instructions
      0.71 ±  2%      -7.1%       0.66 ±  2%  perf-stat.i.ipc
      1.23           -11.6%       1.09 ±  2%  perf-stat.i.metric.GHz
    250.42           -13.4%     216.75 ±  2%  perf-stat.i.metric.M/sec
   1541521 ±  2%     -17.6%    1270246 ±  6%  perf-stat.i.minor-faults
 1.287e+09           -15.2%  1.091e+09        perf-stat.i.node-loads
   1541522 ±  2%     -17.6%    1270246 ±  6%  perf-stat.i.page-faults
     16.10            -3.1%      15.59        perf-stat.overall.MPKI
      0.10 ±  2%      +0.0        0.11        perf-stat.overall.branch-miss-rate%
     84.59            -1.5       83.07        perf-stat.overall.cache-miss-rate%
      3.20            +1.9%       3.26        perf-stat.overall.cpi
    198.59            +5.2%     208.89        perf-stat.overall.cycles-between-cache-misses
      3.12            -0.1        3.07        perf-stat.overall.dTLB-load-miss-rate%
      0.08            +0.0        0.09        perf-stat.overall.dTLB-store-miss-rate%
      0.31            -1.9%       0.31        perf-stat.overall.ipc
      0.55 ± 22%      +0.2        0.79 ± 20%  perf-stat.overall.node-load-miss-rate%
     12372            +2.8%      12714        perf-stat.overall.path-length
 2.062e+10           -11.5%  1.826e+10        perf-stat.ps.branch-instructions
  19971825            +3.9%   20758260        perf-stat.ps.branch-misses
  1.43e+09 ±  2%     -14.1%  1.228e+09        perf-stat.ps.cache-misses
  1.69e+09 ±  2%     -12.5%  1.478e+09        perf-stat.ps.cache-references
      3745            -5.1%       3555        perf-stat.ps.context-switches
 2.839e+11 ±  2%      -9.7%  2.564e+11        perf-stat.ps.cpu-cycles
 8.231e+08 ±  2%     -13.2%  7.143e+08        perf-stat.ps.dTLB-load-misses
 2.555e+10           -11.6%  2.257e+10        perf-stat.ps.dTLB-loads
   7271370            -9.6%    6572655        perf-stat.ps.dTLB-store-misses
 8.707e+09           -12.0%  7.663e+09        perf-stat.ps.dTLB-stores
 8.881e+10           -11.4%  7.872e+10        perf-stat.ps.instructions
   1602854 ±  2%     -13.7%    1382939        perf-stat.ps.minor-faults
 1.273e+09 ±  2%     -14.2%  1.093e+09        perf-stat.ps.node-loads
   1602855 ±  2%     -13.7%    1382939        perf-stat.ps.page-faults
 7.341e+12            +2.8%  7.544e+12        perf-stat.total.instructions



***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-8.3/50%/debian-11.1-x86_64-20220510.cgz/300s/10K/lkp-icl-2sp2/SCTP_STREAM_MANY/netperf

commit: 
  afc3b8a755 ("per_cpu")
  5e887f0037 ("pcp alloc opt")

afc3b8a755764a29 5e887f00379ac36883e4ef0ef41 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     89848 ± 25%     +59.1%     142954 ± 16%  numa-meminfo.node1.Mapped
     34427           -19.0%      27895        uptime.idle
 2.871e+10           -22.1%  2.237e+10 ±  2%  cpuidle..time
 4.764e+08           +13.8%   5.42e+08        cpuidle..usage
    112.33 ±  8%     +62.2%     182.17 ±  6%  perf-c2c.DRAM.remote
      4580 ±  8%     +96.4%       8994 ±  6%  perf-c2c.HITM.local
      4612 ±  7%     +96.0%       9043 ±  6%  perf-c2c.HITM.total
 1.053e+09           +23.6%  1.302e+09 ±  2%  numa-numastat.node0.local_node
 1.053e+09           +23.7%  1.303e+09 ±  2%  numa-numastat.node0.numa_hit
  1.03e+09 ±  2%     +32.8%  1.368e+09 ±  2%  numa-numastat.node1.local_node
  1.03e+09 ±  2%     +32.9%  1.369e+09 ±  2%  numa-numastat.node1.numa_hit
     73.69           -16.3       57.39 ±  2%  mpstat.cpu.all.idle%
      1.70            +0.4        2.06        mpstat.cpu.all.irq%
      4.09            +1.6        5.68 ±  2%  mpstat.cpu.all.soft%
     19.75           +14.0       33.71 ±  2%  mpstat.cpu.all.sys%
      0.77            +0.4        1.16 ±  2%  mpstat.cpu.all.usr%
 1.053e+09           +23.7%  1.303e+09 ±  2%  numa-vmstat.node0.numa_hit
 1.053e+09           +23.6%  1.302e+09 ±  2%  numa-vmstat.node0.numa_local
     22450 ± 25%     +59.4%      35793 ± 16%  numa-vmstat.node1.nr_mapped
  1.03e+09 ±  2%     +32.9%  1.369e+09 ±  2%  numa-vmstat.node1.numa_hit
  1.03e+09 ±  2%     +32.8%  1.368e+09 ±  2%  numa-vmstat.node1.numa_local
     73.85           -21.9%      57.67 ±  2%  vmstat.cpu.id
   6193872           +13.0%    6997780        vmstat.memory.cache
     33.14           +62.6%      53.87 ±  2%  vmstat.procs.r
   2973530           +18.3%    3516631        vmstat.system.cs
   1613978           +16.3%    1876508        vmstat.system.in
   3271400 ±  3%     +24.1%    4060790        meminfo.Active
   3270731 ±  3%     +24.1%    4060150        meminfo.Active(anon)
   6067206           +13.2%    6866472        meminfo.Cached
   3920735 ±  2%     +20.5%    4723477        meminfo.Committed_AS
   9597875 ± 10%     -23.2%    7375319 ± 15%  meminfo.DirectMap2M
    179804 ±  4%     -26.2%     132752 ±  9%  meminfo.DirectMap4k
    132089           +35.7%     179253 ±  6%  meminfo.Mapped
   8016432            +9.7%    8797599        meminfo.Memused
   3281953 ±  3%     +24.4%    4083014        meminfo.Shmem
    759.50           +57.6%       1197 ±  2%  turbostat.Avg_MHz
     29.28           +16.9       46.15 ±  2%  turbostat.Busy%
 4.764e+08           +13.8%  5.419e+08        turbostat.C1
     73.98           -16.4       57.62 ±  2%  turbostat.C1%
     70.72           -23.9%      53.85 ±  2%  turbostat.CPU%c1
      0.31           -17.7%       0.26        turbostat.IPC
 4.911e+08           +16.5%  5.719e+08        turbostat.IRQ
      3119 ±184%   +1623.5%      53767 ±  9%  turbostat.POLL
    354.94           +11.0%     393.98        turbostat.PkgWatt
      6888           +27.9%       8807        netperf.ThroughputBoth_Mbps
    440860           +27.9%     563662        netperf.ThroughputBoth_total_Mbps
      6888           +27.9%       8807        netperf.Throughput_Mbps
    440860           +27.9%     563662        netperf.Throughput_total_Mbps
     89346           +67.0%     149205 ±  3%  netperf.time.involuntary_context_switches
      1658           +71.7%       2847 ±  2%  netperf.time.percent_of_cpu_this_job_got
      4865           +72.2%       8379 ±  2%  netperf.time.system_time
    134.70           +49.4%     201.28        netperf.time.user_time
    300236          +137.1%     711957 ±  7%  netperf.time.voluntary_context_switches
 1.614e+09           +27.9%  2.064e+09        netperf.workload
    817727 ±  3%     +24.1%    1015098        proc-vmstat.nr_active_anon
   1516854           +13.2%    1716690        proc-vmstat.nr_file_pages
    109396            +3.2%     112948        proc-vmstat.nr_inactive_anon
     32969 ±  2%     +36.0%      44827 ±  6%  proc-vmstat.nr_mapped
    820539 ±  3%     +24.4%    1020824        proc-vmstat.nr_shmem
     30840            +1.6%      31345        proc-vmstat.nr_slab_reclaimable
    817727 ±  3%     +24.1%    1015098        proc-vmstat.nr_zone_active_anon
    109396            +3.2%     112948        proc-vmstat.nr_zone_inactive_anon
    140772 ±  4%     +23.3%     173522 ± 17%  proc-vmstat.numa_hint_faults
     63692 ± 12%     +41.4%      90062 ± 18%  proc-vmstat.numa_hint_faults_local
 2.084e+09           +28.2%  2.672e+09        proc-vmstat.numa_hit
 2.083e+09           +28.2%   2.67e+09        proc-vmstat.numa_local
    352699 ±  3%     +13.0%     398449 ±  9%  proc-vmstat.numa_pte_updates
    131428 ±  8%     +53.6%     201825 ±  6%  proc-vmstat.pgactivate
 1.199e+10           +27.8%  1.533e+10        proc-vmstat.pgalloc_normal
   1238418            +4.2%    1290268 ±  2%  proc-vmstat.pgfault
 1.199e+10           +25.9%   1.51e+10        proc-vmstat.pgfree
      0.00 ± 14%     +57.1%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.sctp_chunkify._sctp_make_chunk.sctp_make_datafrag_empty
      0.06 ± 18%    +134.5%       0.14 ± 40%  perf-sched.sch_delay.avg.ms.schedule_timeout.sctp_wait_for_sndbuf.sctp_sendmsg_to_asoc.sctp_sendmsg
      0.51 ±  3%     -21.3%       0.40        perf-sched.total_wait_and_delay.average.ms
   3642022 ±  3%     +25.1%    4556618        perf-sched.total_wait_and_delay.count.ms
      0.51 ±  3%     -21.5%       0.40        perf-sched.total_wait_time.average.ms
      9.83 ± 25%     +39.4%      13.71 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__release_sock.release_sock.sctp_sendmsg.____sys_sendmsg
     14.15 ±  7%     -28.1%      10.17 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.08 ±  4%     -21.3%       0.06        perf-sched.wait_and_delay.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     16.36 ±  7%     +15.7%      18.93 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sctp_wait_for_sndbuf.sctp_sendmsg_to_asoc.sctp_sendmsg
    261.72 ±  3%     -15.5%     221.10 ±  2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     56.50 ± 11%     +34.5%      76.00 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc.sock_kmalloc.____sys_sendmsg
    986.33 ±  4%     +31.2%       1294 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.sctp_sendmsg.____sys_sendmsg
     30.00 ± 71%    +150.0%      75.00 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.sctp_chunkify._sctp_make_chunk.sctp_make_datafrag_empty
    276.67 ±  4%     +41.4%     391.17 ±  4%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    348.83 ±  8%     +39.3%     485.83 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
   3619793 ±  3%     +25.3%    4537101        perf-sched.wait_and_delay.count.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     13582 ±  7%     -26.9%       9933 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.sctp_wait_for_sndbuf.sctp_sendmsg_to_asoc.sctp_sendmsg
      2564 ±  3%     +19.3%       3060 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.00 ±141%    +262.3%      14.49 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty
      1.53 ±218%    +597.5%      10.66 ± 61%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
      0.10 ± 86%     -90.7%       0.01 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
     14.14 ±  7%     -28.1%      10.16 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ±  4%     -22.4%       0.06 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     16.30 ±  7%     +15.2%      18.79 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.sctp_wait_for_sndbuf.sctp_sendmsg_to_asoc.sctp_sendmsg
    261.62 ±  3%     -15.6%     220.85 ±  2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.16 ± 76%     -93.7%       0.01 ± 39%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
    812257 ±  9%    +229.6%    2677230 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.avg
    925295 ±  8%    +217.0%    2932766 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
    696233 ± 10%    +246.0%    2409157 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.min
     45372 ± 21%    +256.3%     161644 ± 34%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.24 ±  6%     +66.9%       0.40 ±  6%  sched_debug.cfs_rq:/.h_nr_running.avg
     12001 ± 16%    +291.5%      46980 ± 27%  sched_debug.cfs_rq:/.left_vruntime.avg
    776750 ± 11%    +253.8%    2748495 ±  7%  sched_debug.cfs_rq:/.left_vruntime.max
     92174 ± 10%    +267.9%     339124 ± 13%  sched_debug.cfs_rq:/.left_vruntime.stddev
    812257 ±  9%    +229.6%    2677230 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
    925295 ±  8%    +217.0%    2932766 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
    696233 ± 10%    +246.0%    2409157 ±  5%  sched_debug.cfs_rq:/.min_vruntime.min
     45372 ± 21%    +256.3%     161644 ± 34%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.24 ±  5%     +67.5%       0.40 ±  6%  sched_debug.cfs_rq:/.nr_running.avg
      0.42 ±  2%     +11.0%       0.46        sched_debug.cfs_rq:/.nr_running.stddev
     12001 ± 16%    +291.5%      46980 ± 27%  sched_debug.cfs_rq:/.right_vruntime.avg
    776750 ± 11%    +253.8%    2748495 ±  7%  sched_debug.cfs_rq:/.right_vruntime.max
     92174 ± 10%    +267.9%     339124 ± 13%  sched_debug.cfs_rq:/.right_vruntime.stddev
    258.82 ±  3%     +54.4%     399.65 ±  6%  sched_debug.cfs_rq:/.runnable_avg.avg
    311.12           +14.6%     356.63 ±  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
    258.26 ±  3%     +54.5%     398.95 ±  6%  sched_debug.cfs_rq:/.util_avg.avg
    310.38           +14.7%     356.05 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
    135.44 ±  6%    +101.2%     272.49 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    266.31 ±  2%     +30.7%     348.05        sched_debug.cfs_rq:/.util_est_enqueued.stddev
    614660 ±  4%     -36.2%     392133 ±  9%  sched_debug.cpu.avg_idle.avg
    847.04 ±  6%     +11.9%     947.80 ±  9%  sched_debug.cpu.clock_task.stddev
      1241 ±  6%     +66.3%       2064 ±  7%  sched_debug.cpu.curr->pid.avg
      2170 ±  2%     +10.9%       2407        sched_debug.cpu.curr->pid.stddev
      0.00 ±  3%     +20.4%       0.00 ±  5%  sched_debug.cpu.next_balance.stddev
      0.24 ±  6%     +63.1%       0.40 ±  7%  sched_debug.cpu.nr_running.avg
      0.42 ±  2%     +10.1%       0.46        sched_debug.cpu.nr_running.stddev
   2892628 ±  9%     +42.1%    4111613        sched_debug.cpu.nr_switches.avg
   3971505 ± 11%     +28.2%    5089555 ±  2%  sched_debug.cpu.nr_switches.max
   1971023 ± 11%     +59.3%    3140793 ±  5%  sched_debug.cpu.nr_switches.min
      0.35            -5.1%       0.33        perf-stat.i.MPKI
 1.669e+10           +30.1%  2.171e+10        perf-stat.i.branch-instructions
      0.59            +0.1        0.65        perf-stat.i.branch-miss-rate%
  97973937           +43.4%  1.405e+08 ±  2%  perf-stat.i.branch-misses
      1.35            -0.3        1.10        perf-stat.i.cache-miss-rate%
  31508355           +23.1%   38776946 ±  2%  perf-stat.i.cache-misses
 2.414e+09           +55.2%  3.747e+09        perf-stat.i.cache-references
   3003838           +18.4%    3555788        perf-stat.i.context-switches
      1.12           +20.5%       1.35        perf-stat.i.cpi
 1.008e+11           +57.0%  1.583e+11 ±  2%  perf-stat.i.cpu-cycles
    696.59           +99.2%       1387 ±  7%  perf-stat.i.cpu-migrations
      3217           +27.1%       4088        perf-stat.i.cycles-between-cache-misses
   1152364 ± 24%     +57.8%    1818570 ±  4%  perf-stat.i.dTLB-load-misses
 2.484e+10           +29.9%  3.227e+10        perf-stat.i.dTLB-loads
      0.00 ±  6%      -0.0        0.00 ± 13%  perf-stat.i.dTLB-store-miss-rate%
  1.56e+10           +29.0%  2.011e+10        perf-stat.i.dTLB-stores
 9.007e+10           +29.9%   1.17e+11        perf-stat.i.instructions
      0.90           -16.5%       0.75        perf-stat.i.ipc
      0.79           +57.0%       1.24 ±  2%  perf-stat.i.metric.GHz
     84.13           +31.5%     110.60 ±  3%  perf-stat.i.metric.K/sec
    465.13           +30.7%     608.04        perf-stat.i.metric.M/sec
      3544            +5.4%       3736 ±  2%  perf-stat.i.minor-faults
     93.00            +0.9       93.85        perf-stat.i.node-load-miss-rate%
   3288672 ±  3%     +44.3%    4746995 ±  6%  perf-stat.i.node-load-misses
    244306 ±  3%     +26.1%     308008 ±  4%  perf-stat.i.node-loads
     80.71            -3.3       77.41 ±  2%  perf-stat.i.node-store-miss-rate%
   3217614 ±  2%     +27.4%    4097768 ±  3%  perf-stat.i.node-store-misses
    795208 ±  8%     +53.3%    1218786 ± 10%  perf-stat.i.node-stores
      3544            +5.4%       3736 ±  2%  perf-stat.i.page-faults
      0.35            -5.3%       0.33        perf-stat.overall.MPKI
      0.59            +0.1        0.65        perf-stat.overall.branch-miss-rate%
      1.31            -0.3        1.03        perf-stat.overall.cache-miss-rate%
      1.12           +20.8%       1.35        perf-stat.overall.cpi
      3200           +27.6%       4083        perf-stat.overall.cycles-between-cache-misses
      0.00 ±  6%      -0.0        0.00 ± 15%  perf-stat.overall.dTLB-store-miss-rate%
      0.89           -17.2%       0.74        perf-stat.overall.ipc
     16773            +1.8%      17069        perf-stat.overall.path-length
 1.664e+10           +30.1%  2.164e+10        perf-stat.ps.branch-instructions
  97650348           +43.5%  1.401e+08 ±  2%  perf-stat.ps.branch-misses
  31407476           +23.1%   38652058 ±  2%  perf-stat.ps.cache-misses
 2.406e+09           +55.3%  3.736e+09        perf-stat.ps.cache-references
   2994313           +18.4%    3545090        perf-stat.ps.context-switches
 1.005e+11           +57.0%  1.578e+11 ±  2%  perf-stat.ps.cpu-cycles
    694.31           +99.3%       1383 ±  7%  perf-stat.ps.cpu-migrations
   1148396 ± 24%     +57.8%    1812380 ±  4%  perf-stat.ps.dTLB-load-misses
 2.476e+10           +29.9%  3.217e+10        perf-stat.ps.dTLB-loads
 1.555e+10           +29.0%  2.005e+10        perf-stat.ps.dTLB-stores
 8.978e+10           +29.9%  1.166e+11        perf-stat.ps.instructions
      3523            +5.0%       3698 ±  2%  perf-stat.ps.minor-faults
   3278182 ±  3%     +44.4%    4732211 ±  6%  perf-stat.ps.node-load-misses
    243529 ±  3%     +26.1%     307099 ±  4%  perf-stat.ps.node-loads
   3207140 ±  2%     +27.4%    4084518 ±  3%  perf-stat.ps.node-store-misses
    792488 ±  8%     +53.3%    1214527 ± 10%  perf-stat.ps.node-stores
      3523            +5.0%       3699 ±  2%  perf-stat.ps.page-faults
 2.708e+13           +30.1%  3.524e+13        perf-stat.total.instructions
     17.22            -1.1       16.16        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     17.21            -1.1       16.14        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     17.16            -1.1       16.10        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     17.34            -1.0       16.30        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     19.42            -1.0       18.38        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     15.66            -1.0       14.65        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     14.92            -1.0       13.93        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     14.81            -1.0       13.83        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     14.52            -1.0       13.55        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     25.36            -0.5       24.90        perf-profile.calltrace.cycles-pp.recvmsg
     24.34            -0.4       23.89        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvmsg
     24.26            -0.4       23.82        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
      2.36 ±  3%      -0.4        1.92 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     23.42            -0.4       22.99        perf-profile.calltrace.cycles-pp.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
     13.79            -0.4       13.36        perf-profile.calltrace.cycles-pp.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm
     23.90            -0.4       23.48        perf-profile.calltrace.cycles-pp.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
     13.36            -0.4       12.96        perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter
     13.26            -0.4       12.86        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_flush
     12.98            -0.4       12.60        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.sctp_packet_transmit
     12.92            -0.4       12.54        perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit
     12.14            -0.4       11.76        perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__do_softirq
     12.40            -0.4       12.03        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.__do_softirq.do_softirq.__local_bh_enable_ip
     11.66            -0.4       11.29        perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     11.64            -0.4       11.27        perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
      5.86            -0.4        5.49        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     11.52            -0.4       11.15        perf-profile.calltrace.cycles-pp.sctp_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
     22.04            -0.4       21.68        perf-profile.calltrace.cycles-pp.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.86            -0.3       20.52        perf-profile.calltrace.cycles-pp.sctp_recvmsg.inet_recvmsg.sock_recvmsg.____sys_recvmsg.___sys_recvmsg
     20.95            -0.3       20.62        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg
     21.28            -0.3       20.96        perf-profile.calltrace.cycles-pp.sock_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64
      0.60 ±  2%      -0.2        0.36 ± 70%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
     10.02            -0.2        9.82        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg.sock_recvmsg.____sys_recvmsg
     18.88            -0.2       18.68        perf-profile.calltrace.cycles-pp.sctp_backlog_rcv.__release_sock.release_sock.sctp_sendmsg.____sys_sendmsg
      9.98            -0.2        9.78        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg.sock_recvmsg
     18.94            -0.2       18.74        perf-profile.calltrace.cycles-pp.__release_sock.release_sock.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
      8.72            -0.2        8.54        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg
      3.47            -0.2        3.31        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      2.51            -0.1        2.39        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter
      0.55 ±  2%      -0.1        0.44 ± 44%  perf-profile.calltrace.cycles-pp.move_addr_to_kernel.__copy_msghdr.copy_msghdr_from_user.___sys_sendmsg.__sys_sendmsg
      2.31            -0.1        2.20        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt
      2.22            -0.1        2.12        perf-profile.calltrace.cycles-pp.sctp_ulpq_tail_event.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv
      0.85 ±  4%      -0.1        0.75 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      2.03            -0.1        1.93        perf-profile.calltrace.cycles-pp.sctp_data_ready.sctp_ulpq_tail_event.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm
      1.62            -0.1        1.54        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sctp_data_ready.sctp_ulpq_tail_event.sctp_ulpq_tail_data
      0.62 ±  2%      -0.1        0.54 ±  4%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter
      1.68            -0.1        1.61        perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sctp_data_ready.sctp_ulpq_tail_event.sctp_ulpq_tail_data.sctp_cmd_interpreter
      1.69            -0.1        1.62        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      1.59            -0.1        1.53        perf-profile.calltrace.cycles-pp.copy_msghdr_from_user.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61 ±  2%      -0.1        0.55 ±  3%  perf-profile.calltrace.cycles-pp.__free_pages_ok.skb_release_data.kfree_skb_reason.sctp_recvmsg.inet_recvmsg
      1.44            -0.0        1.40 ±  2%  perf-profile.calltrace.cycles-pp.sctp_outq_flush_data.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND
      1.05            -0.0        1.01        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
      0.94            -0.0        0.90        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.59            -0.0        0.57        perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending
      0.90            +0.0        0.94        perf-profile.calltrace.cycles-pp.__slab_free.sctp_recvmsg.inet_recvmsg.sock_recvmsg.____sys_recvmsg
      0.56 ±  2%      +0.1        0.66 ±  2%  perf-profile.calltrace.cycles-pp.sctp_chunkify._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc
      1.52            +0.1        1.66 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter
      0.34 ± 70%      +0.2        0.54        perf-profile.calltrace.cycles-pp.sctp_chunk_free.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv
      4.40            +0.5        4.86        perf-profile.calltrace.cycles-pp.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg
      3.88            +0.5        4.36        perf-profile.calltrace.cycles-pp._copy_from_iter.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc.sctp_chunkify._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user
     15.04            +0.6       15.60        perf-profile.calltrace.cycles-pp.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
     12.91            +0.6       13.52        perf-profile.calltrace.cycles-pp.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_asoc
     11.46            +0.6       12.10        perf-profile.calltrace.cycles-pp.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND
      9.81            +0.6       10.46        perf-profile.calltrace.cycles-pp.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg
      9.96            +0.7       10.62        perf-profile.calltrace.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg
      1.78            +0.7        2.48 ±  3%  perf-profile.calltrace.cycles-pp.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm
      1.51            +0.7        2.22 ±  2%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter
      1.44            +0.7        2.16 ±  2%  perf-profile.calltrace.cycles-pp.__kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sctp_packet_transmit
      1.46            +0.7        2.18 ±  2%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sctp_packet_transmit.sctp_outq_flush
      2.31            +1.1        3.43 ±  2%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty
      2.38            +1.1        3.50 ±  2%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user
      3.11            +1.1        4.24 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc
      2.25            +1.1        3.38 ±  2%  perf-profile.calltrace.cycles-pp.__kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb._sctp_make_chunk
      4.15            +1.2        5.36 ±  2%  perf-profile.calltrace.cycles-pp.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg
      3.80            +1.2        5.02 ±  2%  perf-profile.calltrace.cycles-pp._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg
      0.00            +1.4        1.42 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages
     53.22            +1.5       54.69        perf-profile.calltrace.cycles-pp.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendmsg
     51.14            +1.6       52.70        perf-profile.calltrace.cycles-pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
     48.76            +1.7       50.43        perf-profile.calltrace.cycles-pp.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
      3.29            +1.8        5.10 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_pages.__kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.87 ± 28%      +1.9        2.74 ±  3%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.__kmalloc_large_node.__kmalloc_node_track_caller
      2.77 ±  6%      +1.9        4.69 ±  3%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.__kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve
      9.64            +1.9       11.57        perf-profile.calltrace.cycles-pp.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
     53.28            +2.0       55.25        perf-profile.calltrace.cycles-pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendmsg.main
      0.00            +2.3        2.33 ±  3%  perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages.__kmalloc_large_node
     27.14            +2.4       29.56        perf-profile.calltrace.cycles-pp.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg
     17.22            -1.1       16.16        perf-profile.children.cycles-pp.start_secondary
     17.34            -1.0       16.30        perf-profile.children.cycles-pp.cpu_startup_entry
     17.34            -1.0       16.30        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     17.29            -1.0       16.26        perf-profile.children.cycles-pp.do_idle
     15.77            -1.0       14.79        perf-profile.children.cycles-pp.cpuidle_idle_call
     14.92            -1.0       13.96        perf-profile.children.cycles-pp.cpuidle_enter_state
     15.02            -1.0       14.05        perf-profile.children.cycles-pp.cpuidle_enter
     14.60            -1.0       13.65        perf-profile.children.cycles-pp.acpi_safe_halt
     14.62            -0.9       13.67        perf-profile.children.cycles-pp.acpi_idle_enter
     11.62            -0.6       11.04        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
     14.48            -0.5       13.96        perf-profile.children.cycles-pp.__ip_queue_xmit
     24.76            -0.5       24.26        perf-profile.children.cycles-pp.sctp_assoc_bh_rcv
     13.28            -0.5       12.79        perf-profile.children.cycles-pp.__do_softirq
     13.92            -0.5       13.43        perf-profile.children.cycles-pp.ip_finish_output2
     13.78            -0.5       13.30        perf-profile.children.cycles-pp.__dev_queue_xmit
     25.62            -0.5       25.14        perf-profile.children.cycles-pp.recvmsg
     13.42            -0.5       12.95        perf-profile.children.cycles-pp.__local_bh_enable_ip
     13.20            -0.5       12.74        perf-profile.children.cycles-pp.do_softirq
     12.82            -0.5       12.36        perf-profile.children.cycles-pp.net_rx_action
     12.42            -0.5       11.96        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     12.64            -0.5       12.18        perf-profile.children.cycles-pp.process_backlog
     12.68            -0.5       12.22        perf-profile.children.cycles-pp.__napi_poll
     11.92            -0.4       11.48        perf-profile.children.cycles-pp.ip_local_deliver_finish
     11.90            -0.4       11.46        perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
     11.81            -0.4       11.36        perf-profile.children.cycles-pp.sctp_rcv
     23.45            -0.4       23.02        perf-profile.children.cycles-pp.___sys_recvmsg
     23.92            -0.4       23.50        perf-profile.children.cycles-pp.__sys_recvmsg
     22.06            -0.4       21.70        perf-profile.children.cycles-pp.____sys_recvmsg
     21.24            -0.3       20.89        perf-profile.children.cycles-pp.sctp_recvmsg
     20.97            -0.3       20.64        perf-profile.children.cycles-pp.inet_recvmsg
     21.30            -0.3       20.98        perf-profile.children.cycles-pp.sock_recvmsg
     19.26            -0.3       18.94        perf-profile.children.cycles-pp.sctp_backlog_rcv
     19.33            -0.3       19.02        perf-profile.children.cycles-pp.__release_sock
     19.76            -0.3       19.45        perf-profile.children.cycles-pp.release_sock
      1.97 ±  2%      -0.3        1.71 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      5.86            -0.2        5.65        perf-profile.children.cycles-pp.sctp_ulpq_tail_data
     10.03            -0.2        9.82        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      9.99            -0.2        9.79        perf-profile.children.cycles-pp.__skb_datagram_iter
      1.42            -0.2        1.22        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      8.74            -0.2        8.55        perf-profile.children.cycles-pp._copy_to_iter
      0.70 ±  2%      -0.2        0.52        perf-profile.children.cycles-pp.free_unref_page_commit
      0.80 ±  3%      -0.2        0.62 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      8.36            -0.2        8.20        perf-profile.children.cycles-pp.sctp_packet_pack
      3.51            -0.2        3.35        perf-profile.children.cycles-pp.sysvec_call_function_single
      7.77            -0.1        7.62        perf-profile.children.cycles-pp.__memcpy
      3.62            -0.1        3.49        perf-profile.children.cycles-pp.sctp_skb_recv_datagram
      2.30            -0.1        2.18        perf-profile.children.cycles-pp.sctp_ulpq_tail_event
      2.08            -0.1        1.97        perf-profile.children.cycles-pp.sctp_data_ready
      2.68            -0.1        2.56        perf-profile.children.cycles-pp.copy_msghdr_from_user
      2.54            -0.1        2.43        perf-profile.children.cycles-pp.__sysvec_call_function_single
      2.34            -0.1        2.24        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      1.17 ±  2%      -0.1        1.08 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.37            -0.1        1.28        perf-profile.children.cycles-pp.free_unref_page
      1.72            -0.1        1.64        perf-profile.children.cycles-pp.__wake_up_sync_key
      1.66            -0.1        1.57        perf-profile.children.cycles-pp.__wake_up_common
      1.56            -0.1        1.48        perf-profile.children.cycles-pp._copy_from_user
      2.84            -0.1        2.76        perf-profile.children.cycles-pp.__schedule
      3.24            -0.1        3.16        perf-profile.children.cycles-pp.sctp_ulpevent_make_rcvmsg
      0.16 ±  5%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__free_one_page
      1.72            -0.1        1.65        perf-profile.children.cycles-pp.sched_ttwu_pending
      0.90 ±  2%      -0.1        0.84 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.88 ±  2%      -0.1        0.81 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.35            -0.1        1.29        perf-profile.children.cycles-pp.try_to_wake_up
      1.54            -0.1        1.48        perf-profile.children.cycles-pp.kmem_cache_free
      1.40            -0.1        1.34        perf-profile.children.cycles-pp.autoremove_wake_function
      0.76 ±  2%      -0.1        0.71 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.62 ±  2%      -0.1        0.57 ±  3%  perf-profile.children.cycles-pp.__free_pages_ok
      0.36 ±  3%      -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.perf_event_task_tick
      1.00 ±  2%      -0.0        0.95        perf-profile.children.cycles-pp.lock_sock_nested
      0.36 ±  3%      -0.0        0.31 ±  3%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.80            -0.0        0.75 ±  2%  perf-profile.children.cycles-pp.__sctp_rcv_lookup
      0.60            -0.0        0.55 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.77            -0.0        0.72 ±  2%  perf-profile.children.cycles-pp.sctp_addrs_lookup_transport
      0.60            -0.0        0.56 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.54            -0.0        0.50 ±  2%  perf-profile.children.cycles-pp.scheduler_tick
      0.60 ±  4%      -0.0        0.55 ±  3%  perf-profile.children.cycles-pp.ktime_get
      0.59            -0.0        0.55 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.72            -0.0        0.68 ±  2%  perf-profile.children.cycles-pp.__copy_msghdr
      1.07            -0.0        1.04        perf-profile.children.cycles-pp.ttwu_do_activate
      0.44 ±  5%      -0.0        0.41        perf-profile.children.cycles-pp.menu_select
      0.49            -0.0        0.46        perf-profile.children.cycles-pp.__cond_resched
      0.10 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.24 ±  3%      -0.0        0.21 ±  5%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.59 ±  2%      -0.0        0.56        perf-profile.children.cycles-pp.move_addr_to_kernel
      0.64 ±  2%      -0.0        0.61 ±  2%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.08 ±  7%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.switch_fpu_return
      0.68            -0.0        0.66 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.67 ±  2%      -0.0        0.64        perf-profile.children.cycles-pp._raw_spin_lock
      0.34 ±  2%      -0.0        0.31 ±  2%  perf-profile.children.cycles-pp.kmalloc_trace
      0.27 ±  3%      -0.0        0.24        perf-profile.children.cycles-pp.irq_exit_rcu
      0.40 ±  3%      -0.0        0.37 ±  2%  perf-profile.children.cycles-pp.loopback_xmit
      0.10 ± 24%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.__check_heap_object
      0.35 ±  3%      -0.0        0.33 ±  2%  perf-profile.children.cycles-pp.__switch_to
      0.39            -0.0        0.36 ±  2%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.44            -0.0        0.41        perf-profile.children.cycles-pp.native_irq_return_iret
      0.42            -0.0        0.40 ±  2%  perf-profile.children.cycles-pp.select_task_rq
      0.32            -0.0        0.29 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.49 ±  2%      -0.0        0.47        perf-profile.children.cycles-pp.sched_clock_cpu
      0.34            -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.wakeup_preempt
      0.30            -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.select_idle_sibling
      0.44            -0.0        0.42        perf-profile.children.cycles-pp.native_sched_clock
      0.15 ±  3%      -0.0        0.13 ±  4%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.30 ±  2%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.resched_curr
      0.43            -0.0        0.41        perf-profile.children.cycles-pp.sched_clock
      0.27            -0.0        0.25 ±  2%  perf-profile.children.cycles-pp.available_idle_cpu
      0.32            -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.llist_reverse_order
      0.20 ±  3%      -0.0        0.18        perf-profile.children.cycles-pp.netif_rx_internal
      0.14 ±  3%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.30 ±  3%      -0.0        0.28        perf-profile.children.cycles-pp.sctp_sendmsg_parse
      0.20 ±  2%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.sctp_ulpq_order
      0.21 ±  3%      -0.0        0.19        perf-profile.children.cycles-pp.__netif_rx
      0.19            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.20 ±  3%      -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.sctp_chunk_abandoned
      0.53            +0.0        0.55        perf-profile.children.cycles-pp.sctp_datamsg_put
      0.28 ±  2%      +0.0        0.31 ±  2%  perf-profile.children.cycles-pp.memset_orig
      0.10 ±  7%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.36 ±  3%      +0.0        0.40        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.04            +0.1        1.10        perf-profile.children.cycles-pp.kmem_cache_alloc
      3.28            +0.1        3.36        perf-profile.children.cycles-pp.skb_release_data
      0.42 ±  2%      +0.1        0.49 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.90            +0.1        0.98        perf-profile.children.cycles-pp.sctp_chunkify
      0.46 ±  2%      +0.1        0.56        perf-profile.children.cycles-pp.free_large_kmalloc
      0.20 ±  4%      +0.1        0.31 ±  2%  perf-profile.children.cycles-pp.__free_pages
      0.48            +0.1        0.62        perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp._find_next_bit
     15.32            +0.3       15.66        perf-profile.children.cycles-pp.sctp_primitive_SEND
      4.50            +0.4        4.94        perf-profile.children.cycles-pp.sctp_user_addto_chunk
      3.96            +0.5        4.43        perf-profile.children.cycles-pp._copy_from_iter
     78.48            +1.1       79.58        perf-profile.children.cycles-pp.do_syscall_64
     78.68            +1.1       79.81        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.19            +1.2        5.40        perf-profile.children.cycles-pp._sctp_make_chunk
      4.24            +1.2        5.45        perf-profile.children.cycles-pp.sctp_make_datafrag_empty
      0.34 ±  4%      +1.4        1.76        perf-profile.children.cycles-pp._raw_spin_trylock
     53.82            +1.5       55.27        perf-profile.children.cycles-pp.__sys_sendmsg
     53.25            +1.5       54.71        perf-profile.children.cycles-pp.___sys_sendmsg
     51.19            +1.6       52.75        perf-profile.children.cycles-pp.____sys_sendmsg
     55.21            +1.6       56.80        perf-profile.children.cycles-pp.sendmsg
     49.22            +1.7       50.88        perf-profile.children.cycles-pp.sctp_sendmsg
      9.85            +1.8       11.64        perf-profile.children.cycles-pp.sctp_datamsg_from_user
      5.37            +1.8        7.18        perf-profile.children.cycles-pp.__alloc_skb
      3.38            +1.8        5.20        perf-profile.children.cycles-pp.__alloc_pages
      4.08            +1.8        5.91        perf-profile.children.cycles-pp.kmalloc_reserve
      3.85            +1.8        5.69        perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      2.95            +1.8        4.79        perf-profile.children.cycles-pp.get_page_from_freelist
      3.78            +1.8        5.63        perf-profile.children.cycles-pp.__kmalloc_large_node
      1.40            +1.9        3.28        perf-profile.children.cycles-pp.rmqueue
     27.53            +2.1       29.62        perf-profile.children.cycles-pp.sctp_sendmsg_to_asoc
     55.78            +2.1       57.92        perf-profile.children.cycles-pp.main
      0.00            +2.4        2.42        perf-profile.children.cycles-pp.rmqueue_pcplist
      9.60            -0.6        8.95        perf-profile.self.cycles-pp.acpi_safe_halt
      8.70            -0.2        8.52        perf-profile.self.cycles-pp._copy_to_iter
      0.79 ±  3%      -0.2        0.62 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      7.71            -0.1        7.57        perf-profile.self.cycles-pp.__memcpy
      1.52            -0.1        1.44        perf-profile.self.cycles-pp._copy_from_user
      1.51            -0.1        1.45        perf-profile.self.cycles-pp.kmem_cache_free
      0.11 ±  7%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__free_one_page
      0.34 ±  3%      -0.0        0.30 ±  2%  perf-profile.self.cycles-pp.___sys_recvmsg
      0.58            -0.0        0.54        perf-profile.self.cycles-pp.rmqueue
      0.10 ±  4%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.24 ±  3%      -0.0        0.21 ±  5%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.52 ±  2%      -0.0        0.48 ±  3%  perf-profile.self.cycles-pp.__rhashtable_lookup
      0.49            -0.0        0.45        perf-profile.self.cycles-pp.sctp_skb_recv_datagram
      0.45            -0.0        0.42 ±  2%  perf-profile.self.cycles-pp.skb_release_data
      0.42 ±  2%      -0.0        0.39        perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.34 ±  2%      -0.0        0.31        perf-profile.self.cycles-pp.sctp_data_ready
      0.36            -0.0        0.33 ±  3%  perf-profile.self.cycles-pp.__ip_queue_xmit
      0.36            -0.0        0.34 ±  3%  perf-profile.self.cycles-pp.mem_cgroup_charge_skmem
      0.28 ±  2%      -0.0        0.25 ±  4%  perf-profile.self.cycles-pp.__genradix_ptr
      0.44            -0.0        0.41        perf-profile.self.cycles-pp.native_irq_return_iret
      0.07 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.switch_fpu_return
      0.34 ±  3%      -0.0        0.32 ±  3%  perf-profile.self.cycles-pp.__switch_to
      0.26 ±  3%      -0.0        0.24 ±  2%  perf-profile.self.cycles-pp.__wake_up_common
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.30 ±  3%      -0.0        0.27        perf-profile.self.cycles-pp.____sys_sendmsg
      0.37 ±  3%      -0.0        0.35        perf-profile.self.cycles-pp.__alloc_pages
      0.30 ±  3%      -0.0        0.28        perf-profile.self.cycles-pp.__zone_watermark_ok
      0.26            -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.available_idle_cpu
      0.32            -0.0        0.30 ±  3%  perf-profile.self.cycles-pp.llist_reverse_order
      0.12 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.28 ±  2%      -0.0        0.26        perf-profile.self.cycles-pp.sctp_assoc_bh_rcv
      0.30            -0.0        0.28 ±  2%  perf-profile.self.cycles-pp.resched_curr
      0.29            -0.0        0.28        perf-profile.self.cycles-pp.sctp_transport_put
      0.12 ±  4%      -0.0        0.10 ±  6%  perf-profile.self.cycles-pp.__free_pages_ok
      0.17 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.11 ±  3%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.sctp_chunkify
      0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.sctp_assoc_rwnd_increase
      0.07 ± 10%      +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.26 ±  2%      +0.0        0.29 ±  2%  perf-profile.self.cycles-pp.memset_orig
      0.08 ±  8%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.21            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.34 ±  2%      +0.0        0.38        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.19 ±  5%      +0.1        0.30 ±  2%  perf-profile.self.cycles-pp.__free_pages
      0.00            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp._find_next_bit
      0.46            +0.1        0.61        perf-profile.self.cycles-pp.__mod_node_page_state
      0.78            +0.2        0.94        perf-profile.self.cycles-pp.sctp_datamsg_from_user
      3.93            +0.5        4.40        perf-profile.self.cycles-pp._copy_from_iter
      0.00            +0.8        0.82 ±  2%  perf-profile.self.cycles-pp.rmqueue_pcplist
      0.32 ±  4%      +1.4        1.72        perf-profile.self.cycles-pp._raw_spin_trylock



***************************************************************************************************
lkp-icl-2sp8: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp8/sync-file/stress-ng/60s

commit: 
  afc3b8a755 ("per_cpu")
  5e887f0037 ("pcp alloc opt")

afc3b8a755764a29 5e887f00379ac36883e4ef0ef41 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    184849 ± 14%     -29.0%     131260 ± 13%  meminfo.DirectMap4k
      0.06 ±  3%      +0.0        0.07 ±  3%  mpstat.cpu.all.soft%
     79.50 ± 16%     +97.1%     156.67 ± 12%  perf-c2c.DRAM.local
    182.67 ±  7%     +32.6%     242.17 ± 17%  perf-c2c.HITM.local
      2631            -7.7%       2429        stress-ng.sync-file.ops
     43.84            -7.7%      40.49        stress-ng.sync-file.ops_per_sec
    289.08            -1.2%     285.74        turbostat.PkgWatt
     97.92            -2.6%      95.40        turbostat.RAMWatt
      3609 ± 14%      -9.4%       3269 ±  3%  proc-vmstat.nr_inactive_file
      3609 ± 14%      -9.4%       3269 ±  3%  proc-vmstat.nr_zone_inactive_file
 3.489e+08            -5.9%  3.282e+08        proc-vmstat.numa_hit
 3.489e+08            -6.1%  3.274e+08        proc-vmstat.numa_local
  3.46e+08            -7.6%  3.196e+08        proc-vmstat.pgalloc_normal
 3.459e+08            -7.7%  3.194e+08        proc-vmstat.pgfree
 3.449e+08            -7.6%  3.186e+08        proc-vmstat.unevictable_pgs_culled
      0.09 ±  7%     +33.4%       0.13 ± 12%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 15%     +40.4%       0.01 ± 17%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ± 17%     +34.4%       0.03 ±  8%  perf-sched.total_sch_delay.average.ms
      4.00           +46.3%       5.85 ± 55%  perf-sched.total_sch_delay.max.ms
      0.49 ±  4%     +25.0%       0.61 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.47 ±  8%     +41.3%       0.66 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      1.60 ± 49%     +74.5%       2.79 ± 10%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
      2.32 ± 13%     +48.3%       3.44 ± 11%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.90 ± 18%     +58.1%       3.00 ± 16%  perf-sched.wait_and_delay.max.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      0.49 ±  4%     +25.0%       0.61 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.47 ±  8%     +41.3%       0.66 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      2.04 ± 21%     +36.4%       2.79 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
      2.32 ± 13%     +48.3%       3.44 ± 11%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.90 ± 18%     +58.1%       3.00 ± 16%  perf-sched.wait_time.max.ms.__cond_resched.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      4.08            +4.3%       4.25        perf-stat.i.MPKI
 5.232e+09            -5.4%  4.949e+09        perf-stat.i.branch-instructions
      0.21            +0.0        0.21        perf-stat.i.branch-miss-rate%
  11050330            -2.3%   10799457        perf-stat.i.branch-misses
     25.44            +0.5       25.90        perf-stat.i.cache-miss-rate%
 1.055e+08            -1.1%  1.043e+08        perf-stat.i.cache-misses
 4.151e+08            -2.9%  4.029e+08        perf-stat.i.cache-references
      0.88            +5.5%       0.93        perf-stat.i.cpi
    216.82            +1.2%     219.38        perf-stat.i.cycles-between-cache-misses
 6.724e+09            -5.1%  6.384e+09        perf-stat.i.dTLB-loads
      0.00            +0.0        0.00 ±  3%  perf-stat.i.dTLB-store-miss-rate%
     27055           +64.7%      44572 ±  4%  perf-stat.i.dTLB-store-misses
 3.878e+09            -5.1%  3.682e+09        perf-stat.i.dTLB-stores
 2.593e+10            -5.2%  2.458e+10        perf-stat.i.instructions
      1.13            -5.2%       1.07        perf-stat.i.ipc
    253.84            -5.1%     240.87        perf-stat.i.metric.M/sec
     43.15 ±  2%     -28.4       14.79 ±  3%  perf-stat.i.node-load-miss-rate%
    739405 ±  2%     -31.8%     504595 ±  2%  perf-stat.i.node-load-misses
    976647 ±  2%    +202.4%    2953680 ±  2%  perf-stat.i.node-loads
    723282 ±  4%      -7.0%     672681 ±  3%  perf-stat.i.node-store-misses
  49591071            -4.5%   47368723        perf-stat.i.node-stores
      4.07            +4.3%       4.24        perf-stat.overall.MPKI
      0.21            +0.0        0.22        perf-stat.overall.branch-miss-rate%
     25.42            +0.5       25.90        perf-stat.overall.cache-miss-rate%
      0.88            +5.5%       0.93        perf-stat.overall.cpi
    216.57            +1.2%     219.11        perf-stat.overall.cycles-between-cache-misses
      0.00            +0.0        0.00 ±  4%  perf-stat.overall.dTLB-store-miss-rate%
      1.13            -5.2%       1.08        perf-stat.overall.ipc
     43.09 ±  2%     -28.5       14.59 ±  3%  perf-stat.overall.node-load-miss-rate%
 5.145e+09            -5.4%  4.867e+09        perf-stat.ps.branch-instructions
  10865403            -2.3%   10619474        perf-stat.ps.branch-misses
 4.082e+08            -2.9%  3.962e+08        perf-stat.ps.cache-references
 6.612e+09            -5.1%  6.278e+09        perf-stat.ps.dTLB-loads
     26566           +64.9%      43795 ±  4%  perf-stat.ps.dTLB-store-misses
 3.814e+09            -5.1%  3.621e+09        perf-stat.ps.dTLB-stores
  2.55e+10            -5.2%  2.417e+10        perf-stat.ps.instructions
    727099 ±  2%     -31.8%     496114 ±  2%  perf-stat.ps.node-load-misses
    960464 ±  2%    +202.5%    2904978 ±  2%  perf-stat.ps.node-loads
    711308 ±  4%      -7.0%     661582 ±  3%  perf-stat.ps.node-store-misses
  48765056            -4.5%   46579811        perf-stat.ps.node-stores
 1.556e+12            -5.3%  1.475e+12        perf-stat.total.instructions
      6.92            -0.5        6.43        perf-profile.calltrace.cycles-pp.folio_add_lru.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write
      6.35            -0.5        5.86 ±  2%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio.simple_write_begin
     78.62            -0.4       78.23        perf-profile.calltrace.cycles-pp.write
     77.86            -0.4       77.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      4.00            -0.4        3.65 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_fn.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio
     77.67            -0.3       77.32        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     77.27            -0.3       76.93        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      5.37 ±  2%      -0.3        5.09        perf-profile.calltrace.cycles-pp.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      5.30 ±  2%      -0.3        5.02        perf-profile.calltrace.cycles-pp.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache.simple_setattr
     76.58            -0.3       76.31        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.94 ±  9%      -0.2        0.72 ±  4%  perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release.truncate_inode_pages_range
      1.28 ±  6%      -0.2        1.07 ±  2%  perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache
      4.18            -0.2        3.98 ±  2%  perf-profile.calltrace.cycles-pp.delete_from_page_cache_batch.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      1.72 ±  3%      -0.2        1.53 ±  6%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      0.74 ± 10%      -0.2        0.56 ±  6%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_list.release_pages.__folio_batch_release
      1.42 ±  2%      -0.2        1.25        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      1.14            -0.1        1.00        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      1.32 ±  2%      -0.1        1.20        perf-profile.calltrace.cycles-pp.xas_store.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      0.98            -0.1        0.87 ±  2%  perf-profile.calltrace.cycles-pp.try_charge_memcg.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      1.17 ±  2%      -0.1        1.06 ±  2%  perf-profile.calltrace.cycles-pp.truncate_cleanup_folio.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
      0.66 ±  3%      -0.1        0.57        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
      1.36 ±  3%      -0.1        1.29        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.83 ±  5%      -0.1        0.76 ±  2%  perf-profile.calltrace.cycles-pp.xas_find_conflict.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      0.65            -0.1        0.59        perf-profile.calltrace.cycles-pp.release_pages.folio_batch_move_lru.folio_add_lru.filemap_add_folio.__filemap_get_folio
      0.72            -0.1        0.67 ±  3%  perf-profile.calltrace.cycles-pp.xas_load.xa_get_order.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      0.94            -0.0        0.90 ±  2%  perf-profile.calltrace.cycles-pp.xa_get_order.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      1.30 ±  5%      +0.2        1.51 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page_list.release_pages.__folio_batch_release.truncate_inode_pages_range.truncate_pagecache
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.notify_change.do_truncate.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.do_truncate.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ftruncate64
     13.91            +0.4       14.28        perf-profile.calltrace.cycles-pp.truncate_pagecache.simple_setattr.notify_change.do_truncate.do_sys_ftruncate
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.ftruncate64
     13.92            +0.4       14.28        perf-profile.calltrace.cycles-pp.simple_setattr.notify_change.do_truncate.do_sys_ftruncate.do_syscall_64
     13.86            +0.4       14.22        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change.do_truncate
     18.07            +0.5       18.62        perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.00            +0.6        0.60 ±  5%  perf-profile.calltrace.cycles-pp.free_unref_page_commit.free_unref_page_list.release_pages.__folio_batch_release.truncate_inode_pages_range
      2.37            +1.0        3.40 ±  2%  perf-profile.calltrace.cycles-pp.find_lock_entries.truncate_inode_pages_range.truncate_pagecache.simple_setattr.notify_change
     10.65            +1.1       11.71        perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin.generic_perform_write
      3.62            +1.7        5.30        perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.simple_write_begin
      0.00            +1.7        1.70 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages
      1.64 ±  2%      +1.8        3.46 ±  5%  perf-profile.calltrace.cycles-pp.mem_cgroup_commit_charge.__mem_cgroup_charge.__filemap_add_folio.filemap_add_folio.__filemap_get_folio
      4.72            +2.4        7.16 ±  3%  perf-profile.calltrace.cycles-pp.folio_alloc.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      4.44            +2.5        6.91 ±  3%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc.__filemap_get_folio.simple_write_begin.generic_perform_write
      3.63            +2.6        6.18 ±  4%  perf-profile.calltrace.cycles-pp.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio.simple_write_begin
      2.59            +2.7        5.28 ±  5%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.alloc_pages_mpol.folio_alloc.__filemap_get_folio
     25.34            +2.7       28.07        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     25.01            +2.8       27.77        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      1.72 ±  2%      +2.8        4.56 ±  5%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_mpol.folio_alloc
      0.00            +4.1        4.14 ±  6%  perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_mpol
      6.95            -0.5        6.46        perf-profile.children.cycles-pp.folio_add_lru
      6.39            -0.5        5.90 ±  2%  perf-profile.children.cycles-pp.folio_batch_move_lru
     79.05            -0.4       78.62        perf-profile.children.cycles-pp.write
      4.15            -0.4        3.79        perf-profile.children.cycles-pp.lru_add_fn
      6.02 ±  2%      -0.3        5.68        perf-profile.children.cycles-pp.release_pages
     77.33            -0.3       77.00        perf-profile.children.cycles-pp.ksys_write
      5.37 ±  2%      -0.3        5.09        perf-profile.children.cycles-pp.__folio_batch_release
     76.68            -0.3       76.40        perf-profile.children.cycles-pp.vfs_write
      2.68 ±  3%      -0.3        2.42 ±  6%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      4.27            -0.2        4.05 ±  2%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.95 ±  8%      -0.2        0.73 ±  4%  perf-profile.children.cycles-pp.uncharge_batch
      1.32 ±  6%      -0.2        1.11 ±  3%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      2.44            -0.2        2.23        perf-profile.children.cycles-pp.xas_load
      3.44            -0.2        3.24        perf-profile.children.cycles-pp.xas_store
      1.48            -0.2        1.29        perf-profile.children.cycles-pp.filemap_get_entry
      0.75 ± 10%      -0.2        0.56 ±  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.57 ±  2%      -0.2        1.42        perf-profile.children.cycles-pp.xas_descend
      1.22            -0.1        1.11 ±  2%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      1.02            -0.1        0.90 ±  2%  perf-profile.children.cycles-pp.try_charge_memcg
      0.21 ± 10%      -0.1        0.10 ±  8%  perf-profile.children.cycles-pp.propagate_protected_usage
      0.94 ±  4%      -0.1        0.86        perf-profile.children.cycles-pp.xas_find_conflict
      1.40 ±  2%      -0.1        1.32        perf-profile.children.cycles-pp.__generic_file_write_iter
      0.58 ±  3%      -0.1        0.50 ±  3%  perf-profile.children.cycles-pp.__count_memcg_events
      0.39 ±  5%      -0.1        0.32 ±  6%  perf-profile.children.cycles-pp.policy_nodemask
      0.65            -0.1        0.58 ±  3%  perf-profile.children.cycles-pp.__folio_cancel_dirty
      0.54 ±  3%      -0.1        0.48 ±  4%  perf-profile.children.cycles-pp.sync_file_range
      0.79 ±  4%      -0.1        0.73 ±  4%  perf-profile.children.cycles-pp.folio_mapping
      0.59 ±  4%      -0.1        0.53 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.64 ±  4%      -0.1        0.59 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.50 ±  3%      -0.1        0.44 ±  6%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.99            -0.0        0.94 ±  2%  perf-profile.children.cycles-pp.xa_get_order
      0.07 ± 12%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.__mem_cgroup_threshold
      0.65 ±  4%      -0.0        0.61 ±  4%  perf-profile.children.cycles-pp.folio_mark_dirty
      0.36 ±  2%      -0.0        0.31 ±  2%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.71 ±  3%      -0.0        0.66 ±  3%  perf-profile.children.cycles-pp.xas_start
      0.36 ±  3%      -0.0        0.32 ±  3%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.52 ±  2%      -0.0        0.48 ±  5%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.22 ±  5%      -0.0        0.19 ±  5%  perf-profile.children.cycles-pp.__x64_sys_sync_file_range
      0.14 ±  7%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp._find_first_bit
      0.16 ±  9%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.shim_emulate_fallocate
      0.07 ± 12%      +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.write@plt
      0.29 ±  4%      +0.1        0.35 ±  5%  perf-profile.children.cycles-pp.__free_one_page
      0.52 ±  4%      +0.2        0.67 ±  5%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.92 ±  5%      +0.2        1.10 ±  3%  perf-profile.children.cycles-pp.free_unref_page_commit
      1.36 ±  4%      +0.2        1.56 ±  2%  perf-profile.children.cycles-pp.free_unref_page_list
      0.24 ±  3%      +0.3        0.53 ±  4%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.00            +0.3        0.29 ±  5%  perf-profile.children.cycles-pp._find_next_bit
     13.92            +0.4       14.28        perf-profile.children.cycles-pp.notify_change
     13.92            +0.4       14.28        perf-profile.children.cycles-pp.ftruncate64
     13.92            +0.4       14.28        perf-profile.children.cycles-pp.do_sys_ftruncate
     13.92            +0.4       14.28        perf-profile.children.cycles-pp.do_truncate
     13.91            +0.4       14.28        perf-profile.children.cycles-pp.truncate_inode_pages_range
     13.91            +0.4       14.28        perf-profile.children.cycles-pp.truncate_pagecache
     13.92            +0.4       14.28        perf-profile.children.cycles-pp.simple_setattr
     18.14            +0.6       18.69        perf-profile.children.cycles-pp.filemap_add_folio
      2.40            +1.0        3.42 ±  2%  perf-profile.children.cycles-pp.find_lock_entries
     10.93            +1.1       11.98        perf-profile.children.cycles-pp.__filemap_add_folio
      0.62 ±  3%      +1.2        1.85 ±  8%  perf-profile.children.cycles-pp._raw_spin_trylock
      3.75            +1.7        5.42        perf-profile.children.cycles-pp.__mem_cgroup_charge
      1.72            +1.8        3.54 ±  5%  perf-profile.children.cycles-pp.mem_cgroup_commit_charge
      4.79            +2.4        7.22 ±  3%  perf-profile.children.cycles-pp.folio_alloc
      4.53            +2.5        7.00 ±  3%  perf-profile.children.cycles-pp.alloc_pages_mpol
      3.74            +2.6        6.29 ±  4%  perf-profile.children.cycles-pp.__alloc_pages
      2.67            +2.7        5.37 ±  5%  perf-profile.children.cycles-pp.get_page_from_freelist
     25.40            +2.7       28.12        perf-profile.children.cycles-pp.simple_write_begin
     25.14            +2.7       27.89        perf-profile.children.cycles-pp.__filemap_get_folio
      1.81 ±  2%      +2.8        4.62 ±  5%  perf-profile.children.cycles-pp.rmqueue
      0.00            +4.3        4.26 ±  6%  perf-profile.children.cycles-pp.rmqueue_pcplist
      0.70 ±  3%      -0.4        0.32 ±  2%  perf-profile.self.cycles-pp.rmqueue
      1.00 ±  3%      -0.3        0.74 ±  5%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      2.70 ±  2%      -0.2        2.47        perf-profile.self.cycles-pp.lru_add_fn
      1.56            -0.2        1.40 ±  2%  perf-profile.self.cycles-pp.release_pages
      1.65            -0.2        1.48 ±  2%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.85 ±  2%      -0.1        0.71        perf-profile.self.cycles-pp.__alloc_pages
      1.83            -0.1        1.70        perf-profile.self.cycles-pp.xas_store
      1.36            -0.1        1.23        perf-profile.self.cycles-pp.xas_descend
      0.20 ± 11%      -0.1        0.09 ± 13%  perf-profile.self.cycles-pp.propagate_protected_usage
      0.88            -0.1        0.78 ±  3%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.84 ±  2%      -0.1        0.76 ±  3%  perf-profile.self.cycles-pp.generic_perform_write
      0.44 ±  4%      -0.1        0.36 ±  3%  perf-profile.self.cycles-pp.__count_memcg_events
      0.85 ±  2%      -0.1        0.77 ±  4%  perf-profile.self.cycles-pp.xas_load
      0.63            -0.1        0.56 ±  4%  perf-profile.self.cycles-pp.try_charge_memcg
      0.44 ±  4%      -0.1        0.38 ±  5%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.68            -0.1        0.63 ±  3%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.57 ±  3%      -0.1        0.52 ±  4%  perf-profile.self.cycles-pp.truncate_cleanup_folio
      0.48 ±  3%      -0.0        0.43 ±  6%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.32 ±  4%      -0.0        0.28 ±  3%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.25 ±  7%      -0.0        0.20 ±  8%  perf-profile.self.cycles-pp.policy_nodemask
      0.07 ± 14%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.__mem_cgroup_threshold
      0.48 ±  5%      -0.0        0.43 ±  3%  perf-profile.self.cycles-pp.write
      0.48 ±  2%      -0.0        0.44 ±  4%  perf-profile.self.cycles-pp.__folio_cancel_dirty
      0.64 ±  4%      -0.0        0.60 ±  3%  perf-profile.self.cycles-pp.__filemap_get_folio
      0.60 ±  3%      -0.0        0.57 ±  2%  perf-profile.self.cycles-pp.xas_start
      0.51 ±  3%      -0.0        0.47 ±  5%  perf-profile.self.cycles-pp.delete_from_page_cache_batch
      0.34 ±  4%      -0.0        0.31 ±  6%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.29 ±  3%      -0.0        0.26 ±  7%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.16 ±  6%      -0.0        0.14 ±  5%  perf-profile.self.cycles-pp.__vfs_getxattr
      0.12 ±  6%      +0.0        0.16 ± 11%  perf-profile.self.cycles-pp.memcg_check_events
      0.15 ± 12%      +0.0        0.19 ±  7%  perf-profile.self.cycles-pp.shim_emulate_fallocate
      0.26 ±  4%      +0.1        0.32 ±  4%  perf-profile.self.cycles-pp.__free_one_page
      0.09 ±  6%      +0.1        0.18 ±  9%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.00            +0.2        0.24 ±  3%  perf-profile.self.cycles-pp._find_next_bit
      0.21 ±  2%      +0.2        0.45 ±  4%  perf-profile.self.cycles-pp.rmqueue_bulk
      2.06            +1.0        3.08 ±  2%  perf-profile.self.cycles-pp.find_lock_entries
      0.59 ±  3%      +1.2        1.79 ±  9%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +1.8        1.76 ±  5%  perf-profile.self.cycles-pp.rmqueue_pcplist
      1.03            +1.9        2.89 ±  7%  perf-profile.self.cycles-pp.mem_cgroup_commit_charge



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


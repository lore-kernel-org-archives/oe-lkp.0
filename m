Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32F17C7A3
	for <oe-lkp@lists.linux.dev>; Wed,  9 Oct 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460229; cv=fail; b=EoARAsrnDvm7ykJplUx3oWZeBSlyibXyd8lBRVsGGa/0NObAKsxqYB6R/wLJ8xuiguxV0vqxwS8jWfy+0WHIUMs7fe+VnEtQLXECdeaCfRHoD1HC35sG+9PQJ/4x8oSOh4mfZ379jjZDvo9y7pZG31Y1kDkt3P8D/FmtLVVkcCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460229; c=relaxed/simple;
	bh=Nopo2ysV9mkCmym2Q8jDreOmZgv4Rbm4u1b1KwKvXGc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fS/yXKhimjf56suCp9Q63lwzvCt3blKuaan1VRqAkNvxXyeFu+lyJK3n3K+Uh2bZgMxWZnIik+7rj++fYwiIWzPaJfCfSX68PpXoELqLVfhISFAohfvJRo/+Q7UT+XNTT+7JCL1Ni9bkNS0WsYCO+w5ioblyPSpeBBk+WBvoT7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBGMcfC+; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBGMcfC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728460225; x=1759996225;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Nopo2ysV9mkCmym2Q8jDreOmZgv4Rbm4u1b1KwKvXGc=;
  b=EBGMcfC+HwEZrpSfLVDhDN801x7h5CQjuQQqtk8OwvwJWz2caGFkX55K
   mMad99pbQpX+7H/0VQoc28+Zuppw7OpC+e2KgIeX2du8uFzLHvP++/Xg2
   sqQZUjaSy8nOwwXmB4xgRXsKtEwch0g4XgBu3PVKqd5wCLV8zEVz0euC1
   zv0O8aJ4QqDWckcFSp0zChjoSkNg5y96M1BJ6r+Y4heudrSx8kvFALuPX
   639Hd+u4QQ3Dwyz+163ZwBx7fAoXem9R/N+4feQDf9YwBU9r5KkJ6k3hW
   6U+WT6oNCNSLHuAnzkJRmt0Z8nMG8QUPNrV8pqc7yK2LJXaoO4/AbHZwM
   A==;
X-CSE-ConnectionGUID: Kks9cpH2Q1yJjMXd0V2jvQ==
X-CSE-MsgGUID: vwjm1VFHTC2gDTB+orELvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38307727"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38307727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 00:50:24 -0700
X-CSE-ConnectionGUID: V4fIgTQSQ2usd9FH2fxHXQ==
X-CSE-MsgGUID: kpPM6brnS1SsCVuVx5a+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76482074"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2024 00:50:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:50:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:50:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 00:50:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 00:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6axbrjwzJuDLoe3PrD4lPqqTBkmSeznWFKeWx2QsHcB1MjKvNQN0h+baXjf7jGfnDsFzZ92DGPRGRMaYzRf0L4LXDu3mLTmue2q1sYjOI2TZO9/Av/y9+NfhuSwH1y6ksJaIJllBLdTv4BRvysDltGaxjsFxn2vYWmplrlZsJFPwspPZI4e+WkCkP2gJ6CdtRR2F1ilNHPpMI4tlkQt+7S1CH9+LmJHWSPSBMOJ4LZ2DqvMJTUtw2EO3AMqOEq6dvZtZfZQsBE3dVkIYP/YKdtgzVrS+PX8RQklnl4VsCV9fzAR5SQ7ROmH5u6DFkzJMcNTt0HZzZB7e3Av5VOgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3f26vIOV91+6KfVn5oIsad5otRDhK8nyiuJQAPcQMQ=;
 b=aeryp97polfmGIDj6o20QcNe4y7zVBNykEjx5BkQu78IxUYzxa0yUfKhrAE7zQnCMifZmYVjnG6bcZgWG/U/dNr1MnksFShNUzb6k8fb1zwyL5M4BeCHcJilHPlJu3acpm1LHh1B1+BnYY2ONOwb8Jfn9YpzX/r1eMRblE16YUa6aw0YJPjPYDHAtL295oRefHRfyePrPwVp4hmzH3mKZcC1NHYZt1q4RSbstFcl3r7tTilGR7f3flJadTPcWAlq81rnT4LQMf98u+7aoHYpyV1cB9fSjrJsmYComgQ/PHA5t5WW+S1iGRr0kDPMybVDB0IIQ3W6HWEQ70+6x+WzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 07:50:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:50:07 +0000
Date: Wed, 9 Oct 2024 15:49:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <wu.zheng@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [net]  c770815b03:  netperf.Throughput_Mbps
 -70.4% regression
Message-ID: <202410091558.901d7359-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c53c88-1821-4461-9a2c-08dce836fdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?f957KX6CjXr5lqHLoLKY6LNrcr2cKal1qs99j4mVj0k4gOLUEA/6O9cFvB?=
 =?iso-8859-1?Q?zfzTY7mjVDf33f73wSW7qwHWB+uif0LSjAoGE7g2FE2TjOh6MteMt9zygJ?=
 =?iso-8859-1?Q?oPzGAQEmFNRPX4I5O2qIK28AEGZ8BaPohIHW8ILfeBUpE+7sAOBGI9vEcK?=
 =?iso-8859-1?Q?topBIMsaZZI78ZSV1CylVXzxp+2OEJf/VzSgtZxPvBt8VMpQJoLkVZ2/8o?=
 =?iso-8859-1?Q?EjGWubN2/EkcM3OIh5EnPYT+jUFP0qGcBJ/a92hpq+oAFLcNdaBK4sp4gm?=
 =?iso-8859-1?Q?6WdGpXIIrUg3O/xU63OCM93ujp/m2ioX78RZRIST+L3zRxVpDoYldVdbA0?=
 =?iso-8859-1?Q?lzLzxAcG36vbplGAq3ZpqOEhmr582QhzrqRoVO7JkSjxLsB/eJh6zULVRO?=
 =?iso-8859-1?Q?h+W9stV1TJmnsvIB2T7LgliKHJ0pUcdUFIijrWASOOp+eLnGCjQjfQpAJ/?=
 =?iso-8859-1?Q?Hqry7jqTw+08i4TpraOquxo2y+D73dZK5QbK5wGi4zNPl7PUHltDbiauCo?=
 =?iso-8859-1?Q?2ksT2p01bCjLhrEV5OYp2AKhxRSV612L/VdiFLas8cRmcIk1M/xvjZVlfB?=
 =?iso-8859-1?Q?NFdDbsys4Lon8D8E0F66mtFmdD0LaMh7Q/w7A+HcjeX/NaTVGURDtoG9Re?=
 =?iso-8859-1?Q?14lOv49L/ilUGjXVZg0paNujtXMGd+3I/AtOOmBpuEXEDyKn+9ZbLBMm/f?=
 =?iso-8859-1?Q?fEZ6TlM5qE8KfbVYqEeBHnUydi8A3xBVeSzjwSYgAEZc1I/KMAppKUXd7q?=
 =?iso-8859-1?Q?divkP8j28yQUL9U6sX1hHUGkrj+CIzo/nRJdE1Sbsw6wa6ZE4KfLSzNL8k?=
 =?iso-8859-1?Q?1KAOIIjxasSM504upcL3taS9m9VNs23rsfsvwDgsTjv/i5U/Y9zGYwhmw5?=
 =?iso-8859-1?Q?7OCdEKIIb657mlYqpNpt2cCgUMuLni+YtYYUYmpFHVlWQoUuxIg+vvdZtu?=
 =?iso-8859-1?Q?c2RiPhcg7OcZqrkv6sNknmkllZZnS8GUk6e4eS28pszm8nBznjoCMBQHY7?=
 =?iso-8859-1?Q?jxjZKuiv6xG+FRl3RedLosDPr02eETbyXJcFzCM/kEDEzN8/k/YsJ9NwOi?=
 =?iso-8859-1?Q?iJq0h++BCT/F/AdPGYYaKDqyTcQEqHh9lbZP/VXWVe1EZa9F9YV7hgc3Kp?=
 =?iso-8859-1?Q?d50kRziCveskzzsa/tXIr7oeE2/AMJVtN7ptDO5p4OF3oVWqutp+ilARab?=
 =?iso-8859-1?Q?fMEL8t1ag3ZhECh8XPI2oAi2m9VCohBf2OMqqpPas9jXtUNRCGSvqQ4zzS?=
 =?iso-8859-1?Q?RrFDrumqQGL0OzDxEu4/dV3eMuclkVk7WG16ai9mH7CA0044NOmX+K6sRD?=
 =?iso-8859-1?Q?31ZrEuF0XsNZtlxpdM5C0bYkiUMr30voBYuhGVmdBF+NZCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QlKRofEU23Nsk3MR4PoA05LYJE7QNqwTdNE9+5co7OQIaVEiNjoWl08APc?=
 =?iso-8859-1?Q?PZ+PZ767rSQUGonpdz4SCcASUjYYU/h6867DbasZFYj30w5Kcfji/p85VU?=
 =?iso-8859-1?Q?wpkKiknwmQdcm41VqrZrcR0brrgHg9rFe8Kia1YFxQvxqDFYXsx2gSdglW?=
 =?iso-8859-1?Q?cqvmKwPC1kYNGF2SlXMN+L3H2YlVoCpBNbzBidUVd2dfz0Zz3Y6JRfD1SO?=
 =?iso-8859-1?Q?29Oj6YLk/cIJCTvUQ8bXbEOa7/V1P/5xFN5LImDBg0xYksIqo38dcsyU87?=
 =?iso-8859-1?Q?pc6N1OXT+3CROPxT/ljfut152O5tUJ5VXK5N26JMFaCiGNccipM2pwtwGe?=
 =?iso-8859-1?Q?c7XZXfb47M34pFaBD7AsRvIzZcuVHX6SuF5Ylb/+XXZgjBaZiWBw62IE/l?=
 =?iso-8859-1?Q?8B0FSs6D6Yf/Dam8UQcP7K5RzymIIDIp/ktUKr30ZQodajmvz22lnzxXsz?=
 =?iso-8859-1?Q?nz14j7TG3TDCKYscDozQS4Ohol8IiXi2zHR1GOpId/Q2GB4MkBdcjmMipt?=
 =?iso-8859-1?Q?+uyo2om7spVESfVnpliuFXOgUQuCZd7bUDfkXrScDb5Xy4YaRMTpKwL6VZ?=
 =?iso-8859-1?Q?6H4dldm8ycMpcgp0cJfsqV1ZdqBA/Y2DnqgNXdae0CjfeV44MddzkkoXD1?=
 =?iso-8859-1?Q?gK/PKgqz+OVKY5VxpoASpSmLK2s44zTU53adSnZeOh2EqVcCLdWiE0QVf/?=
 =?iso-8859-1?Q?c0V2SblB5ofByJmwTrvimxeK/qy/0b4b7KVHUIzwU1GsFqrZjPDYSpMqyf?=
 =?iso-8859-1?Q?1KK2wal81SNYf2V/FOIVFvOdECY/aNQxB1Xw0wuUpnoPyYTTxLauLWjOlL?=
 =?iso-8859-1?Q?sa24cC3oXnEFax3fiZ6Q5E2d5y4lDyTcLMd/f0f7sITP+9m2QEgwF0uTpQ?=
 =?iso-8859-1?Q?wWsFNbAjbXXWyXkoRxabDn5hFcDR2iktP12iXkoUFmBNdLvGeqF55wkXdf?=
 =?iso-8859-1?Q?+Qn6VqOBkcP7bBTxdQQw2RjFmngWtiP9pVQHiRv1i7lsw/VEfky+3la8O5?=
 =?iso-8859-1?Q?Vubs3mMGDU2Yldc4ZQX9kaxNR+6hwkaPZ/QXayOEEplKimCltbmUFaUaPC?=
 =?iso-8859-1?Q?RXP4HhiYCB91TlCSPSfPGe/TJYRVvRMvJndHLAKLR/AzeHthfY0HWVUaQ9?=
 =?iso-8859-1?Q?uQq8ZdKh+OjBZDjqn0IL2igYiSjGq2yTnE30kSFTfAYhMz4GYf/vNZG257?=
 =?iso-8859-1?Q?y5/owmHpAIEmTS1KzWb1EsrcC2cnqJlTQGjzUOUykXz0dh6y4Xz1sWyfqS?=
 =?iso-8859-1?Q?KnEpzAYgh7ymFKKjAAfMw7ZIeSrZbkBSzV2yK1ICgcwL/YbfnIjoHB7+I3?=
 =?iso-8859-1?Q?AS6wNh5EG5EGvb6yHTuMDIB5FPP37rbEVKnzve8yNtQzhTLkvjYXwE/MWb?=
 =?iso-8859-1?Q?hDnTh2fr7MvcuE2TKYYhU9Umh8OzW9uv9tLCFtYF/DPDqs8YzJNBmur1HN?=
 =?iso-8859-1?Q?XRImmeK8zDODzAP00g95o96ioR9eN5J2/3lDOfJLQCRJ69Y9gsELkjwlpX?=
 =?iso-8859-1?Q?cHB6uAOOgPK2GF9g69NXIVN6KBH3jmzULcgozJTE9DQR+/TanGIQXuZWh6?=
 =?iso-8859-1?Q?73Xh8/2C1+YbB1ebaIgvaSQ+8+9dJjrkCUkMF57LzoKdWFFJq8AwksL7lm?=
 =?iso-8859-1?Q?aPMype8tQjOxNdO5wKclTC7qk3M2Je+kkD1a2dQUxMHJOauVR4lX7BCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c53c88-1821-4461-9a2c-08dce836fdd2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:50:06.9411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml/58e8z+YYGk25LCK6WY8DhWN7RAN9upbZiAsIdlUQ8cmOPgmBcH6u2ZKprdYbvLMI7dfk4tF/3PsJUxAsBJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -70.4% regression of netperf.Throughput_Mbps on:


commit: c770815b0360341459d9cd75c05e35d805396034 ("net: keep sk->sk_forward_alloc as small as possible")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	send_size: 10K
	test: TCP_SENDFILE
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091558.901d7359-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091558.901d7359-oliver.sang@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/200%/debian-12-x86_64-20240206.cgz/300s/10K/lkp-gnr-1ap1/TCP_SENDFILE/netperf

commit: 
  21346146a6 ("net: implement per-cpu reserves for memory_allocated")
  c770815b03 ("net: keep sk->sk_forward_alloc as small as possible")

21346146a624758f c770815b0360341459d9cd75c05 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  10283622 ±  3%     -67.7%    3319999 ±  7%  cpuidle..usage
  56762085           -70.8%   16546201 ±  4%  vmstat.system.cs
    418699           -23.8%     319242        vmstat.system.in
     16.93           +15.1       32.03        mpstat.cpu.all.soft%
     75.87           -11.8       64.10        mpstat.cpu.all.sys%
      5.13            -3.3        1.83        mpstat.cpu.all.usr%
   2390248 ±  7%     -63.1%     881603 ± 37%  meminfo.Active
   2390248 ±  7%     -63.1%     881603 ± 37%  meminfo.Active(anon)
  12201984 ±  3%     -13.1%   10600789 ±  9%  meminfo.DirectMap2M
   2275446 ±  7%     +47.7%    3361741 ±  8%  meminfo.Inactive
   2275446 ±  7%     +47.7%    3361741 ±  8%  meminfo.Inactive(anon)
    790285 ±  6%    +104.9%    1618912 ±  3%  meminfo.Mapped
   3692511           -12.4%    3236269        meminfo.Shmem
      9429           -70.4%       2791 ±  4%  netperf.ThroughputBoth_Mbps
   4525998           -70.4%    1340001 ±  4%  netperf.ThroughputBoth_total_Mbps
      9429           -70.4%       2791 ±  4%  netperf.Throughput_Mbps
   4525998           -70.4%    1340001 ±  4%  netperf.Throughput_total_Mbps
 8.789e+09           -70.8%  2.564e+09 ±  4%  netperf.time.involuntary_context_switches
     12892           +34.6%      17350        netperf.time.percent_of_cpu_this_job_got
     37273           +40.7%      52455        netperf.time.system_time
      2027           -66.1%     686.98 ±  3%  netperf.time.user_time
    115734 ±  4%    +280.4%     440309 ± 15%  netperf.time.voluntary_context_switches
 1.657e+10           -70.4%  4.907e+09 ±  4%  netperf.workload
    597017 ±  7%     -63.1%     220377 ± 37%  proc-vmstat.nr_active_anon
    243768            +3.4%     252125        proc-vmstat.nr_anon_pages
   1805766            -6.3%    1691990        proc-vmstat.nr_file_pages
    568881 ±  7%     +47.7%     840168 ±  8%  proc-vmstat.nr_inactive_anon
    197471 ±  6%    +105.0%     404831 ±  4%  proc-vmstat.nr_mapped
    922571           -12.3%     808810        proc-vmstat.nr_shmem
     49622            -1.5%      48888        proc-vmstat.nr_slab_reclaimable
    597017 ±  7%     -63.1%     220377 ± 37%  proc-vmstat.nr_zone_active_anon
    568881 ±  7%     +47.7%     840168 ±  8%  proc-vmstat.nr_zone_inactive_anon
   2390109            -1.8%    2347422        proc-vmstat.numa_hit
   2390108            -1.8%    2347425        proc-vmstat.numa_local
   1024853           -40.5%     610287 ± 55%  proc-vmstat.pgactivate
   2415096            -1.7%    2373030        proc-vmstat.pgalloc_normal
      0.02 ±  7%     +39.9%       0.02 ±  7%  perf-stat.i.MPKI
 1.874e+11           -68.0%      6e+10 ±  3%  perf-stat.i.branch-instructions
      0.48            +0.0        0.51        perf-stat.i.branch-miss-rate%
 9.032e+08           -66.6%  3.017e+08 ±  4%  perf-stat.i.branch-misses
      0.75 ±  4%      +0.1        0.85 ±  3%  perf-stat.i.cache-miss-rate%
   1444223           -11.0%    1284879 ±  5%  perf-stat.i.cache-misses
  2.55e+08 ±  4%     -40.3%  1.523e+08 ±  3%  perf-stat.i.cache-references
  57419957           -71.0%   16662532 ±  4%  perf-stat.i.context-switches
      0.75          +261.9%       2.70 ±  4%  perf-stat.i.cpi
 6.912e+11           +15.9%  8.011e+11        perf-stat.i.cpu-cycles
      3289 ±  3%     -48.3%       1700 ±  5%  perf-stat.i.cpu-migrations
  10711605 ±  5%     -20.1%    8556489 ±  9%  perf-stat.i.cycles-between-cache-misses
 9.428e+11           -68.0%  3.017e+11 ±  4%  perf-stat.i.instructions
      1.36           -71.8%       0.38 ±  4%  perf-stat.i.ipc
    239.25           -71.0%      69.45 ±  4%  perf-stat.i.metric.K/sec
      3500            +7.1%       3749 ±  5%  perf-stat.i.minor-faults
      3502            +7.1%       3751 ±  5%  perf-stat.i.page-faults
      5325 ±222%    +642.2%      39521 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.avg
   1277889 ±222%    +642.2%    9484187 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.max
     82319 ±222%    +642.2%     610941 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      2.03            -9.8%       1.83        sched_debug.cfs_rq:/.h_nr_running.avg
      5325 ±222%    +642.2%      39521 ± 44%  sched_debug.cfs_rq:/.max_vruntime.avg
   1277889 ±222%    +642.2%    9484187 ± 44%  sched_debug.cfs_rq:/.max_vruntime.max
     82319 ±222%    +642.2%     610941 ± 44%  sched_debug.cfs_rq:/.max_vruntime.stddev
  36484567           -14.8%   31067726        sched_debug.cfs_rq:/.min_vruntime.avg
  31521338           -22.4%   24469834 ±  7%  sched_debug.cfs_rq:/.min_vruntime.min
      2104           -10.6%       1881        sched_debug.cfs_rq:/.runnable_avg.avg
   -699055         +1031.3%   -7908282        sched_debug.cfs_rq:/.spread0.avg
   8414237 ± 31%     -65.7%    2884598 ± 93%  sched_debug.cfs_rq:/.spread0.max
  -5652697          +157.5%  -14558239        sched_debug.cfs_rq:/.spread0.min
    480.17 ± 10%     -22.1%     373.83 ± 13%  sched_debug.cfs_rq:/.util_avg.min
    300.42 ±  4%     -10.3%     269.41 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    232246 ±  5%     +95.6%     454184 ±  6%  sched_debug.cpu.avg_idle.avg
      3347 ± 61%    +206.5%      10259 ± 35%  sched_debug.cpu.avg_idle.min
    237216 ± 10%     +41.5%     335613 ±  4%  sched_debug.cpu.avg_idle.stddev
     78.68 ± 12%    +443.9%     427.95 ± 26%  sched_debug.cpu.clock.stddev
     78.68 ± 12%    +443.9%     427.95 ± 26%  sched_debug.cpu.clock_task.stddev
      0.00 ± 10%    +429.5%       0.00 ± 25%  sched_debug.cpu.next_balance.stddev
      2.04           -10.5%       1.83        sched_debug.cpu.nr_running.avg
      0.56 ±  2%      -9.3%       0.51 ±  4%  sched_debug.cpu.nr_running.stddev
  36236175           -76.5%    8506095 ±  4%  sched_debug.cpu.nr_switches.avg
  37933773           -75.7%    9231670 ±  3%  sched_debug.cpu.nr_switches.max
  32932632           -81.7%    6039483 ± 13%  sched_debug.cpu.nr_switches.min
    838549 ±  5%     -47.6%     439262 ±  4%  sched_debug.cpu.nr_switches.stddev
      0.02 ± 82%    +562.5%       0.13 ± 44%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sk_stream_alloc_skb
      1.09 ±  2%     +65.5%       1.80 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     17.62 ± 10%     -28.1%      12.67 ± 31%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
      0.34 ±  4%     +23.9%       0.42 ±  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      0.03 ± 89%   +1028.0%       0.30 ± 68%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sk_stream_alloc_skb
      4422 ±  8%     +22.6%       5420 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      5009 ±  5%     +10.3%       5525 ±  8%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    522.32 ±219%     -99.1%       4.79 ± 65%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.04 ± 89%    +135.5%       0.08 ± 51%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.57           +21.1%       0.69 ±  7%  perf-sched.total_sch_delay.average.ms
      5012 ±  5%     +12.6%       5644 ±  7%  perf-sched.total_sch_delay.max.ms
      1.73           +25.2%       2.16 ±  7%  perf-sched.total_wait_and_delay.average.ms
   4236094           -25.7%    3147248        perf-sched.total_wait_and_delay.count.ms
     10025 ±  5%     +12.6%      11289 ±  7%  perf-sched.total_wait_and_delay.max.ms
      1.16           +27.3%       1.47 ±  7%  perf-sched.total_wait_time.average.ms
      2.17 ±  2%     +65.5%       3.59 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     36.48 ±  5%     -26.9%      26.68 ± 24%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
      1.24           +29.7%       1.61 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
    245.13 ±  4%     -25.7%     182.04 ±  4%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    420624           -25.6%     312800        perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
    858.67 ± 29%     -69.9%     258.50 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.__splice_from_pipe.generic_splice_sendpage.direct_splice_actor.splice_direct_to_actor
      4.50 ± 37%     +77.8%       8.00 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
    420550           -25.7%     312576        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.sk_stream_alloc_skb.tcp_build_frag
   1263718           -25.7%     938807        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
   2123814           -25.9%    1573595        perf-sched.wait_and_delay.count.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      5324 ±  4%     +29.6%       6901 ±  7%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
      8844 ±  8%     +22.6%      10840 ±  8%  perf-sched.wait_and_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     10018 ±  5%     +10.3%      11051 ±  8%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.02 ± 82%    +562.5%       0.13 ± 44%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sk_stream_alloc_skb
      1.09 ±  2%     +65.5%       1.80 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     18.86           -25.8%      14.00 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
      0.90           +31.8%       1.19 ±  8%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
    244.58 ±  4%     -25.7%     181.77 ±  4%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.03 ± 89%   +1028.0%       0.30 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sk_stream_alloc_skb
      4422 ±  8%     +22.6%       5420 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      5009 ±  5%     +10.3%       5525 ±  8%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      4873 ±  6%     +15.0%       5603 ±  7%  perf-sched.wait_time.max.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
     37.53           -14.3       23.22        perf-profile.calltrace.cycles.accept_connection.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles.process_requests.spawn_child.accept_connection.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles.spawn_child.accept_connection.accept_connections.main
     37.08           -14.0       23.06        perf-profile.calltrace.cycles.recv.process_requests.spawn_child.accept_connection.accept_connections
     36.24           -13.4       22.84        perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.recv.process_requests.spawn_child.accept_connection
     36.12           -13.4       22.74        perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.process_requests.spawn_child
     33.60           -13.2       20.36        perf-profile.calltrace.cycles.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     34.93           -13.2       21.71        perf-profile.calltrace.cycles.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv
     34.10           -13.2       20.93        perf-profile.calltrace.cycles.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     34.18           -13.0       21.16        perf-profile.calltrace.cycles.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.74           -12.0       21.74        perf-profile.calltrace.cycles.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.process_requests
     10.69            -8.0        2.74 ±  4%  perf-profile.calltrace.cycles.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     10.72            -7.9        2.79 ±  4%  perf-profile.calltrace.cycles.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      6.88            -6.9        0.00        perf-profile.calltrace.cycles.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      6.74            -6.7        0.00        perf-profile.calltrace.cycles.__wake_up_common_lock.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      6.44            -6.4        0.00        perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv
      8.60            -6.4        2.17 ±  4%  perf-profile.calltrace.cycles._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      6.26            -6.3        0.00        perf-profile.calltrace.cycles.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_rcv_established
      7.76            -5.8        1.97 ±  3%  perf-profile.calltrace.cycles.copy_user_enhanced_fast_string._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
     10.32            -5.5        4.86 ±  2%  perf-profile.calltrace.cycles.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      9.08            -4.7        4.36 ±  2%  perf-profile.calltrace.cycles.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      8.63            -4.5        4.17 ±  2%  perf-profile.calltrace.cycles.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
      8.39            -4.3        4.07 ±  2%  perf-profile.calltrace.cycles.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      8.15            -4.2        4.00 ±  2%  perf-profile.calltrace.cycles.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
     11.82            -4.1        7.70 ±  2%  perf-profile.calltrace.cycles.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
     11.77            -4.1        7.66 ±  2%  perf-profile.calltrace.cycles.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      5.88            -3.5        2.41 ±  2%  perf-profile.calltrace.cycles.generic_file_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64
      9.28            -3.4        5.88        perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
     10.20            -3.2        7.04 ±  2%  perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage
      5.16            -3.0        2.16 ±  2%  perf-profile.calltrace.cycles.filemap_read.generic_file_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile
      5.28            -3.0        2.28 ±  9%  perf-profile.calltrace.cycles.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.02            -3.0        2.03 ± 10%  perf-profile.calltrace.cycles.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile
      8.45            -2.9        5.59        perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      3.73            -2.7        1.04 ±  2%  perf-profile.calltrace.cycles.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable
      3.69            -2.7        1.00 ±  2%  perf-profile.calltrace.cycles.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lock
      4.42            -2.7        1.74 ±  3%  perf-profile.calltrace.cycles.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream
      9.22            -2.7        6.56 ±  2%  perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendpages
      7.31            -2.6        4.75        perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      3.14            -2.2        0.92        perf-profile.calltrace.cycles.tcp_send_mss.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
      2.86            -2.0        0.81        perf-profile.calltrace.cycles.tcp_current_mss.tcp_send_mss.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      3.08            -2.0        1.06 ±  5%  perf-profile.calltrace.cycles.recv
      5.49            -1.8        3.73        perf-profile.calltrace.cycles.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      2.90            -1.7        1.24        perf-profile.calltrace.cycles.sendfile
      3.14 ±  2%      -1.6        1.51 ± 14%  perf-profile.calltrace.cycles.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.02 ±  2%      -1.5        1.47 ± 15%  perf-profile.calltrace.cycles.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      2.24            -1.3        0.97 ±  2%  perf-profile.calltrace.cycles.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.process_requests
      2.19            -1.2        0.95 ±  2%  perf-profile.calltrace.cycles.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv
      1.96 ±  2%      -1.2        0.80 ±  2%  perf-profile.calltrace.cycles.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_up_common
      1.78            -1.1        0.67 ±  2%  perf-profile.calltrace.cycles.copy_page_to_iter.filemap_read.generic_file_splice_read.splice_direct_to_actor.do_splice_direct
      2.09            -1.0        1.07 ±  3%  perf-profile.calltrace.cycles.dequeue_task_fair.__schedule.schedule.schedule_timeout.wait_woken
      1.59            -0.9        0.73 ±  2%  perf-profile.calltrace.cycles.filemap_get_pages.filemap_read.generic_file_splice_read.splice_direct_to_actor.do_splice_direct
      1.51            -0.8        0.66 ±  3%  perf-profile.calltrace.cycles.psi_task_switch.__schedule.schedule.schedule_timeout.wait_woken
      1.40            -0.8        0.65 ±  2%  perf-profile.calltrace.cycles.filemap_get_read_batch.filemap_get_pages.filemap_read.generic_file_splice_read.splice_direct_to_actor
      2.00            -0.7        1.31 ±  2%  perf-profile.calltrace.cycles.__alloc_skb.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages.tcp_sendpage
      1.30            -0.6        0.70        perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile
      1.30            -0.6        0.70        perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.sendfile
      1.50 ±  4%      -0.6        0.93        perf-profile.calltrace.cycles.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      0.78            -0.4        0.34 ± 70%  perf-profile.calltrace.cycles.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile
      1.08 ±  2%      -0.4        0.66 ±  2%  perf-profile.calltrace.cycles.kmem_cache_alloc_node.__alloc_skb.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages
      0.88            -0.4        0.53        perf-profile.calltrace.cycles.pick_next_task.__schedule.schedule.schedule_timeout.wait_woken
      0.63 ±  2%      -0.1        0.57 ±  2%  perf-profile.calltrace.cycles.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      1.37            +0.1        1.44 ±  2%  perf-profile.calltrace.cycles.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      0.96            +0.3        1.24        perf-profile.calltrace.cycles.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
     11.21            +3.0       14.18        perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames
      0.00            +3.7        3.73 ±  2%  perf-profile.calltrace.cycles.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.sk_stream_alloc_skb.tcp_build_frag
     93.54            +3.7       97.26        perf-profile.calltrace.cycles.main
      0.00            +4.0        3.96 ±  2%  perf-profile.calltrace.cycles.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue
      0.00            +4.1        4.11 ±  2%  perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established
      0.00            +4.2        4.21 ±  2%  perf-profile.calltrace.cycles.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      0.00            +4.3        4.27 ±  2%  perf-profile.calltrace.cycles.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      1.26            +4.5        5.80 ±  2%  perf-profile.calltrace.cycles.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      1.10            +4.5        5.65 ±  2%  perf-profile.calltrace.cycles.skb_release_head_state.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      0.00            +4.8        4.78 ±  2%  perf-profile.calltrace.cycles.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.skb_release_head_state
      3.68            +4.8        8.46        perf-profile.calltrace.cycles.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      0.00            +4.8        4.79 ±  2%  perf-profile.calltrace.cycles.drain_stock.refill_stock.__sk_mem_reduce_allocated.skb_release_head_state.__kfree_skb
      3.66            +4.8        8.46        perf-profile.calltrace.cycles.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
      0.00            +4.8        4.84 ±  2%  perf-profile.calltrace.cycles.refill_stock.__sk_mem_reduce_allocated.skb_release_head_state.__kfree_skb.tcp_recvmsg_locked
      3.24            +5.1        8.32        perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv
      2.94            +5.2        8.19        perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established
      0.00            +5.4        5.36 ±  2%  perf-profile.calltrace.cycles.__sk_mem_reduce_allocated.skb_release_head_state.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg
      2.33            +5.7        8.02        perf-profile.calltrace.cycles.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      0.00            +6.2        6.20 ±  2%  perf-profile.calltrace.cycles.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule
      0.00            +6.2        6.21        perf-profile.calltrace.cycles.try_charge_memcg.mem_cgroup_charge_skmem.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages
      0.00            +6.3        6.30        perf-profile.calltrace.cycles.mem_cgroup_charge_skmem.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages.tcp_sendpage
      5.11            +6.4       11.52 ±  2%  perf-profile.calltrace.cycles.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      4.74            +6.8       11.50 ±  2%  perf-profile.calltrace.cycles.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendpage
      1.81            +8.4       10.23 ±  3%  perf-profile.calltrace.cycles.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      1.44 ±  2%      +8.6       10.06 ±  3%  perf-profile.calltrace.cycles.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
      0.00            +9.7        9.75 ±  3%  perf-profile.calltrace.cycles.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue
      0.00            +9.8        9.76 ±  3%  perf-profile.calltrace.cycles.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack
      0.00            +9.8        9.81 ±  3%  perf-profile.calltrace.cycles.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      0.00            +9.9        9.88 ±  2%  perf-profile.calltrace.cycles.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_build_frag
      0.00           +10.2       10.20 ±  3%  perf-profile.calltrace.cycles.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      0.00           +10.5       10.48 ±  2%  perf-profile.calltrace.cycles.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_build_frag.do_tcp_sendpages
      0.00           +10.7       10.67 ±  2%  perf-profile.calltrace.cycles.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_build_frag.do_tcp_sendpages.tcp_sendpage
      0.00           +10.7       10.70 ±  2%  perf-profile.calltrace.cycles.__sk_mem_schedule.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      8.64           +11.2       19.88        perf-profile.calltrace.cycles.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
      7.57           +11.9       19.47        perf-profile.calltrace.cycles.__release_sock.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage
      4.19           +12.8       17.02        perf-profile.calltrace.cycles.tcp_write_xmit.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
      3.74           +13.1       16.87        perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_write_xmit.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      0.00           +13.2       13.17 ±  2%  perf-profile.calltrace.cycles.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.tcp_data_queue.tcp_rcv_established
      3.38           +13.4       16.74        perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.do_tcp_sendpages.tcp_sendpage
      3.14           +13.5       16.65        perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.do_tcp_sendpages
     17.19           +15.5       32.71        perf-profile.calltrace.cycles.do_softirq.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb
      4.05           +15.5       19.60        perf-profile.calltrace.cycles.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
     16.89           +15.7       32.54        perf-profile.calltrace.cycles.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit
     16.58           +15.8       32.40        perf-profile.calltrace.cycles.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_output2
     16.30           +15.8       32.13        perf-profile.calltrace.cycles.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable_ip
     16.23           +15.9       32.10        perf-profile.calltrace.cycles.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq
     15.43           +16.4       31.81        perf-profile.calltrace.cycles.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start
     13.51           +16.9       30.44        perf-profile.calltrace.cycles.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     13.48           +16.9       30.43        perf-profile.calltrace.cycles.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
     13.28           +17.1       30.34        perf-profile.calltrace.cycles.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
     11.78           +17.2       29.00        perf-profile.calltrace.cycles.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     55.96           +18.0       73.95        perf-profile.calltrace.cycles.sendfile_tcp_stream.main
     10.33           +18.4       28.70        perf-profile.calltrace.cycles.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
     10.58           +18.4       28.96        perf-profile.calltrace.cycles.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
     54.87           +18.7       73.59        perf-profile.calltrace.cycles.sendfile.sendfile_tcp_stream.main
     53.36           +19.7       73.10        perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream.main
     53.05           +20.0       73.02        perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream.main
      0.00           +21.1       21.06 ±  2%  perf-profile.calltrace.cycles.try_charge_memcg.mem_cgroup_charge_skmem.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      0.00           +21.3       21.26 ±  2%  perf-profile.calltrace.cycles.mem_cgroup_charge_skmem.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
     24.09           +21.5       45.62        perf-profile.calltrace.cycles.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
     48.29           +22.9       71.19        perf-profile.calltrace.cycles.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream
     47.51           +23.3       70.80        perf-profile.calltrace.cycles.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile
     45.62           +24.5       70.15        perf-profile.calltrace.cycles.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.45           +24.7       70.10        perf-profile.calltrace.cycles.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64
      0.00           +26.4       26.36        perf-profile.calltrace.cycles.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
     38.38           +28.9       67.32        perf-profile.calltrace.cycles.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64
     38.26           +29.0       67.29        perf-profile.calltrace.cycles.generic_splice_sendpage.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfile
     37.93           +29.2       67.17        perf-profile.calltrace.cycles.__splice_from_pipe.generic_splice_sendpage.direct_splice_actor.splice_direct_to_actor.do_splice_direct
     36.27           +30.3       66.56        perf-profile.calltrace.cycles.pipe_to_sendpage.__splice_from_pipe.generic_splice_sendpage.direct_splice_actor.splice_direct_to_actor
     35.97           +30.5       66.45        perf-profile.calltrace.cycles.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.generic_splice_sendpage.direct_splice_actor
     35.83           +30.6       66.39        perf-profile.calltrace.cycles.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.generic_splice_sendpage
     35.53           +30.8       66.30        perf-profile.calltrace.cycles.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from_pipe
     35.06           +31.1       66.16        perf-profile.calltrace.cycles.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage
     40.15           -16.0       24.12        perf-profile.children.cycles.recv
     37.53           -14.3       23.22        perf-profile.children.cycles.accept_connection
     37.53           -14.3       23.22        perf-profile.children.cycles.accept_connections
     37.53           -14.3       23.22        perf-profile.children.cycles.process_requests
     37.53           -14.3       23.22        perf-profile.children.cycles.spawn_child
     35.04           -12.9       22.14        perf-profile.children.cycles.__x64_sys_recvfrom
     33.60           -12.8       20.76        perf-profile.children.cycles.tcp_recvmsg_locked
     34.93           -12.8       22.11        perf-profile.children.cycles.__sys_recvfrom
     34.10           -12.8       21.34        perf-profile.children.cycles.tcp_recvmsg
     34.18           -12.6       21.56        perf-profile.children.cycles.inet_recvmsg
     10.69            -8.0        2.74 ±  4%  perf-profile.children.cycles.__skb_datagram_iter
     10.72            -7.9        2.79 ±  4%  perf-profile.children.cycles.skb_copy_datagram_iter
      8.60            -6.4        2.17 ±  4%  perf-profile.children.cycles._copy_to_iter
     13.13            -6.1        7.02 ±  2%  perf-profile.children.cycles.__schedule
      8.00            -5.8        2.16        perf-profile.children.cycles.copy_user_enhanced_fast_string
     11.53            -5.4        6.16 ±  2%  perf-profile.children.cycles.schedule
     10.32            -5.1        5.26 ±  2%  perf-profile.children.cycles.sk_wait_data
      9.08            -4.3        4.76 ±  2%  perf-profile.children.cycles.wait_woken
      7.44            -4.2        3.22 ±  2%  perf-profile.children.cycles.syscall_exit_to_user_mode
      7.21            -4.1        3.15 ±  2%  perf-profile.children.cycles.exit_to_user_mode_prepare
      8.63            -4.1        4.57 ±  2%  perf-profile.children.cycles.schedule_timeout
      5.88            -3.5        2.41 ±  2%  perf-profile.children.cycles.generic_file_splice_read
      5.16            -3.0        2.16 ±  2%  perf-profile.children.cycles.filemap_read
      5.28            -2.8        2.45 ±  2%  perf-profile.children.cycles.exit_to_user_mode_loop
      6.88            -2.6        4.26 ±  2%  perf-profile.children.cycles.sock_def_readable
      6.74            -2.5        4.21 ±  2%  perf-profile.children.cycles.__wake_up_common_lock
      6.44            -2.3        4.11 ±  2%  perf-profile.children.cycles.__wake_up_common
      6.26            -2.3        3.96 ±  2%  perf-profile.children.cycles.try_to_wake_up
      3.14            -2.2        0.92        perf-profile.children.cycles.tcp_send_mss
      2.98            -2.1        0.86        perf-profile.children.cycles.tcp_current_mss
      3.69            -1.9        1.75 ±  2%  perf-profile.children.cycles.enqueue_task
      3.73            -1.9        1.80 ±  2%  perf-profile.children.cycles.ttwu_do_activate
      2.19            -1.8        0.42 ±  3%  perf-profile.children.cycles.ipv4_mtu
      2.26            -1.6        0.69 ±  4%  perf-profile.children.cycles.load_new_mm_cr3
      3.08            -1.5        1.54 ±  2%  perf-profile.children.cycles.switch_mm_irqs_off
      2.64            -1.4        1.28 ±  3%  perf-profile.children.cycles.__cond_resched
      2.26            -1.2        1.03 ±  3%  perf-profile.children.cycles._raw_spin_lock_bh
      1.41 ±  2%      -1.2        0.20 ±  4%  perf-profile.children.cycles.dst_release
      2.97            -1.2        1.78 ±  2%  perf-profile.children.cycles.__alloc_skb
      1.62            -1.1        0.50 ±  3%  perf-profile.children.cycles.switch_fpu_return
      1.92            -1.1        0.79 ±  3%  perf-profile.children.cycles.psi_task_switch
      1.78            -1.1        0.67 ±  2%  perf-profile.children.cycles.copy_page_to_iter
      3.63 ±  4%      -1.1        2.54        perf-profile.children.cycles.__dev_queue_xmit
      1.44            -1.1        0.36 ±  5%  perf-profile.children.cycles.__rseq_handle_notify_resume
      2.41 ±  2%      -1.1        1.36 ±  2%  perf-profile.children.cycles.enqueue_task_fair
      1.70            -1.0        0.66 ±  4%  perf-profile.children.cycles.psi_group_change
      1.82 ±  2%      -1.0        0.80 ±  2%  perf-profile.children.cycles.update_curr
      2.09            -1.0        1.08 ±  2%  perf-profile.children.cycles.dequeue_task_fair
      2.07            -1.0        1.05 ±  2%  perf-profile.children.cycles.pick_next_task
      1.34            -1.0        0.33 ±  3%  perf-profile.children.cycles.restore_fpregs_from_fpstate
      1.96            -1.0        0.96 ±  2%  perf-profile.children.cycles.pick_next_task_fair
      1.39            -1.0        0.40 ±  4%  perf-profile.children.cycles.ktime_get
      1.28            -0.9        0.35 ±  5%  perf-profile.children.cycles.simple_copy_to_iter
      1.59            -0.9        0.73 ±  2%  perf-profile.children.cycles.filemap_get_pages
      1.53            -0.9        0.67 ±  3%  perf-profile.children.cycles.update_load_avg
      1.18            -0.9        0.32 ±  5%  perf-profile.children.cycles.__check_object_size
      1.74 ±  7%      -0.8        0.93 ±  2%  perf-profile.children.cycles.dev_hard_start_xmit
      1.56            -0.8        0.75 ±  2%  perf-profile.children.cycles.skb_release_data
      1.31            -0.8        0.50 ±  4%  perf-profile.children.cycles._raw_spin_lock
      1.68 ±  8%      -0.8        0.88 ±  2%  perf-profile.children.cycles.xmit_one
      1.54 ±  8%      -0.8        0.78 ±  2%  perf-profile.children.cycles.loopback_xmit
      1.40            -0.8        0.65 ±  2%  perf-profile.children.cycles.filemap_get_read_batch
      1.04            -0.7        0.29 ±  4%  perf-profile.children.cycles.__entry_text_start
      1.08            -0.7        0.34 ±  3%  perf-profile.children.cycles.touch_atime
      0.99            -0.7        0.25 ±  4%  perf-profile.children.cycles.rseq_ip_fixup
      1.04            -0.7        0.31 ±  5%  perf-profile.children.cycles.__switch_to_asm
      0.98 ±  2%      -0.7        0.26 ±  3%  perf-profile.children.cycles.ipv4_dst_check
      0.98            -0.7        0.29 ±  4%  perf-profile.children.cycles.save_fpregs_to_fpstate
      0.96            -0.7        0.30 ±  4%  perf-profile.children.cycles.psi_task_change
      0.90            -0.6        0.26 ±  4%  perf-profile.children.cycles.__fget_light
      1.47            -0.6        0.83 ±  2%  perf-profile.children.cycles.kmem_cache_alloc_node
      1.00 ±  3%      -0.6        0.37 ±  4%  perf-profile.children.cycles.dequeue_entity
      0.85            -0.6        0.22 ±  5%  perf-profile.children.cycles.read_tsc
      1.25            -0.6        0.62 ±  3%  perf-profile.children.cycles.lock_sock_nested
      0.86            -0.6        0.25 ±  2%  perf-profile.children.cycles.atime_needs_update
      0.84            -0.6        0.24 ±  4%  perf-profile.children.cycles.kmem_cache_free
      0.84            -0.6        0.25 ±  3%  perf-profile.children.cycles.tcp_mstamp_refresh
      0.88            -0.6        0.29 ±  3%  perf-profile.children.cycles._raw_spin_lock_irqsave
      1.42 ±  2%      -0.6        0.83 ±  2%  perf-profile.children.cycles.ip_rcv
      0.90            -0.6        0.33 ±  4%  perf-profile.children.cycles.sched_clock_cpu
      0.80            -0.5        0.26 ±  2%  perf-profile.children.cycles.native_sched_clock
      0.72            -0.5        0.19 ±  4%  perf-profile.children.cycles.__put_user_nocheck_8
      1.23 ±  5%      -0.5        0.71 ±  3%  perf-profile.children.cycles.enqueue_entity
      0.67            -0.5        0.17 ±  4%  perf-profile.children.cycles.__virt_addr_valid
      0.83            -0.5        0.35 ±  3%  perf-profile.children.cycles.__inet_lookup_established
      0.95 ±  3%      -0.5        0.47 ±  3%  perf-profile.children.cycles.ip_rcv_finish_core
      0.85            -0.5        0.38 ±  2%  perf-profile.children.cycles.set_next_entity
      0.66            -0.5        0.20 ±  5%  perf-profile.children.cycles._copy_from_user
      0.68            -0.4        0.24 ±  4%  perf-profile.children.cycles.page_cache_pipe_buf_release
      1.08            -0.4        0.66 ±  2%  perf-profile.children.cycles.__switch_to
      0.99 ±  4%      -0.4        0.59 ±  4%  perf-profile.children.cycles.prepare_task_switch
      0.52            -0.4        0.13 ±  6%  perf-profile.children.cycles.rseq_get_rseq_cs
      0.50 ±  8%      -0.4        0.12 ±  6%  perf-profile.children.cycles.update_min_vruntime
      0.56            -0.4        0.19 ±  4%  perf-profile.children.cycles.tcp_event_new_data_sent
      0.56            -0.4        0.19 ±  4%  perf-profile.children.cycles.kfree
      0.46            -0.3        0.11 ±  4%  perf-profile.children.cycles.__get_user_8
      0.52            -0.3        0.17 ±  4%  perf-profile.children.cycles.sk_reset_timer
      0.53 ±  2%      -0.3        0.19 ±  3%  perf-profile.children.cycles.__sk_dst_check
      0.52            -0.3        0.19 ±  3%  perf-profile.children.cycles.netperf_sendfile
      0.54            -0.3        0.22 ±  4%  perf-profile.children.cycles.put_prev_entity
      0.74            -0.3        0.42        perf-profile.children.cycles.__tcp_send_ack
      0.44            -0.3        0.12 ±  3%  perf-profile.children.cycles.sockfd_lookup_light
      0.47            -0.3        0.16 ±  2%  perf-profile.children.cycles.__mod_timer
      0.43            -0.3        0.12 ±  5%  perf-profile.children.cycles.__wrgsbase_inactive
      0.42            -0.3        0.12 ±  4%  perf-profile.children.cycles.tcp_schedule_loss_probe
      0.42            -0.3        0.12 ±  4%  perf-profile.children.cycles.do_splice_to
      0.44            -0.3        0.15 ±  3%  perf-profile.children.cycles.recv_tcp_stream
      0.42            -0.3        0.12 ±  6%  perf-profile.children.cycles.syscall_return_via_sysret
      0.40            -0.3        0.11 ±  3%  perf-profile.children.cycles.current_time
      0.48            -0.3        0.20 ±  2%  perf-profile.children.cycles.tcp_established_options
      0.60 ±  3%      -0.3        0.32 ±  4%  perf-profile.children.cycles.___perf_sw_event
      0.38            -0.3        0.12 ±  4%  perf-profile.children.cycles.tcp_rcv_space_adjust
      0.35 ±  2%      -0.2        0.10 ±  4%  perf-profile.children.cycles.ip_rcv_core
      0.38 ±  2%      -0.2        0.14 ±  3%  perf-profile.children.cycles.update_cfs_group
      0.64            -0.2        0.40 ±  2%  perf-profile.children.cycles.netif_rx
      0.46            -0.2        0.23 ±  3%  perf-profile.children.cycles.__update_load_avg_se
      0.32            -0.2        0.09 ±  5%  perf-profile.children.cycles.__ip_finish_output
      0.61            -0.2        0.39 ±  2%  perf-profile.children.cycles.netif_rx_internal
      0.67            -0.2        0.46        perf-profile.children.cycles.ip_local_out
      0.70 ±  6%      -0.2        0.49 ±  2%  perf-profile.children.cycles.reweight_entity
      0.28            -0.2        0.07 ±  5%  perf-profile.children.cycles.slab_free_freelist_hook
      0.38            -0.2        0.16 ±  4%  perf-profile.children.cycles.raw_spin_rq_lock_nested
      0.60            -0.2        0.39 ±  3%  perf-profile.children.cycles.update_rq_clock
      0.29            -0.2        0.08 ±  7%  perf-profile.children.cycles.copy_user_generic_unrolled
      0.24 ±  2%      -0.2        0.04 ± 44%  perf-profile.children.cycles.ip_skb_dst_mtu
      0.30            -0.2        0.10 ±  5%  perf-profile.children.cycles.fsnotify_perm
      0.38            -0.2        0.18 ±  5%  perf-profile.children.cycles.__ksize
      0.28            -0.2        0.09 ±  5%  perf-profile.children.cycles.memcg_slab_free_hook
      0.56            -0.2        0.37 ±  2%  perf-profile.children.cycles.enqueue_to_backlog
      0.33 ±  2%      -0.2        0.14 ±  2%  perf-profile.children.cycles.ip_send_check
      0.32            -0.2        0.13        perf-profile.children.cycles.__fsnotify_parent
      0.64            -0.2        0.45        perf-profile.children.cycles.__ip_local_out
      0.26 ±  3%      -0.2        0.07 ±  5%  perf-profile.children.cycles.tcp_add_backlog
      0.27            -0.2        0.09 ±  5%  perf-profile.children.cycles.iterate_groups
      0.39 ±  2%      -0.2        0.22 ±  2%  perf-profile.children.cycles.__update_load_avg_cfs_rq
      0.34            -0.2        0.17 ±  4%  perf-profile.children.cycles.__skb_clone
      0.22 ±  7%      -0.2        0.06 ±  8%  perf-profile.children.cycles.set_next_buddy
      0.25            -0.2        0.09 ±  7%  perf-profile.children.cycles.xas_load
      0.45 ±  7%      -0.2        0.30 ±  2%  perf-profile.children.cycles.perf_trace_sched_wakeup_template
      0.23 ± 20%      -0.2        0.08 ± 12%  perf-profile.children.cycles.perf_trace_sched_switch
      0.24 ±  2%      -0.2        0.09 ±  6%  perf-profile.children.cycles.select_idle_sibling
      0.23            -0.1        0.08        perf-profile.children.cycles.__tcp_select_window
      0.20            -0.1        0.06        perf-profile.children.cycles.remove_wait_queue
      0.19            -0.1        0.05        perf-profile.children.cycles.rcu_all_qs
      0.21            -0.1        0.07 ±  5%  perf-profile.children.cycles.sock_put
      0.16 ±  2%      -0.1        0.02 ± 99%  perf-profile.children.cycles.syscall_enter_from_user_mode
      0.29            -0.1        0.16 ±  3%  perf-profile.children.cycles.tcp_wfree
      0.25            -0.1        0.12        perf-profile.children.cycles.sanity
      0.62            -0.1        0.50        perf-profile.children.cycles.kmalloc_reserve
      0.18 ±  2%      -0.1        0.06 ±  7%  perf-profile.children.cycles.add_wait_queue
      0.23 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles.tcp_queue_rcv
      0.17 ±  3%      -0.1        0.06 ±  8%  perf-profile.children.cycles.inet_ehashfn
      0.25            -0.1        0.14 ±  3%  perf-profile.children.cycles.__build_skb_around
      0.16            -0.1        0.05        perf-profile.children.cycles.pick_next_entity
      0.16 ±  2%      -0.1        0.05        perf-profile.children.cycles.tcp_v4_fill_cb
      0.50            -0.1        0.39 ±  3%  perf-profile.children.cycles.select_task_rq_fair
      0.16 ±  3%      -0.1        0.05        perf-profile.children.cycles.rcu_read_unlock_strict
      0.20            -0.1        0.10 ±  3%  perf-profile.children.cycles.tcp_ack_update_rtt
      0.20 ±  3%      -0.1        0.10 ±  3%  perf-profile.children.cycles.__sock_wfree
      0.15            -0.1        0.05        perf-profile.children.cycles.kfree_skbmem
      0.22            -0.1        0.12 ±  4%  perf-profile.children.cycles.__rdgsbase_inactive
      0.16 ±  7%      -0.1        0.06 ±  6%  perf-profile.children.cycles.perf_tp_event
      0.56            -0.1        0.48        perf-profile.children.cycles.__kmalloc_node_track_caller
      0.71            -0.1        0.62 ±  2%  perf-profile.children.cycles.__cgroup_bpf_run_filter_skb
      0.13 ±  8%      -0.1        0.05        perf-profile.children.cycles.perf_trace_buf_alloc
      0.15 ±  3%      -0.1        0.07 ±  7%  perf-profile.children.cycles.native_load_tls
      0.13            -0.1        0.05        perf-profile.children.cycles.psi_flags_change
      0.13 ±  3%      -0.1        0.05 ±  8%  perf-profile.children.cycles.xas_start
      0.19 ±  5%      -0.1        0.11 ±  3%  perf-profile.children.cycles.mark_page_accessed
      0.13 ±  4%      -0.1        0.05 ±  8%  perf-profile.children.cycles.select_idle_cpu
      0.11            -0.1        0.03 ± 70%  perf-profile.children.cycles.woken_wake_function
      0.46            -0.1        0.38 ±  4%  perf-profile.children.cycles.sk_filter_trim_cap
      0.13            -0.1        0.06 ±  6%  perf-profile.children.cycles._raw_spin_unlock_irqrestore
      0.09 ±  5%      -0.1        0.03 ± 70%  perf-profile.children.cycles.tcp_rearm_rto
      0.15 ±  3%      -0.1        0.09 ±  5%  perf-profile.children.cycles.splice_from_pipe_next
      0.16 ±  2%      -0.1        0.10 ±  7%  perf-profile.children.cycles.tcp_skb_entail
      0.12            -0.0        0.08 ±  4%  perf-profile.children.cycles.tcp_rtt_estimator
      0.22            -0.0        0.18 ±  3%  perf-profile.children.cycles.tcp_check_space
      0.08            -0.0        0.05        perf-profile.children.cycles.rb_insert_color
      0.12            -0.0        0.09 ±  7%  perf-profile.children.cycles.resched_curr
      0.12 ±  4%      -0.0        0.09 ±  6%  perf-profile.children.cycles.migrate_disable
      0.10            -0.0        0.08 ±  6%  perf-profile.children.cycles.tcp_update_pacing_rate
      0.12 ±  3%      -0.0        0.10        perf-profile.children.cycles.rb_erase
      0.06 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles.tcp_update_skb_after_send
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles.ip_output
      0.09            -0.0        0.08 ±  6%  perf-profile.children.cycles.tcp_push
      0.07            +0.0        0.08        perf-profile.children.cycles.tcp_chrono_stop
      0.18 ±  6%      +0.0        0.20 ±  3%  perf-profile.children.cycles.__calc_delta
      0.38            +0.0        0.40        perf-profile.children.cycles.__netif_receive_skb_core
      0.04 ± 44%      +0.0        0.08 ±  6%  perf-profile.children.cycles.tcp_send_delayed_ack
      0.15 ±  2%      +0.0        0.19 ±  2%  perf-profile.children.cycles.netif_skb_features
      0.10 ±  6%      +0.0        0.14 ±  9%  perf-profile.children.cycles.native_queued_spin_lock_slowpath
      0.12 ±  4%      +0.0        0.16 ±  6%  perf-profile.children.cycles.is_cpu_allowed
      0.12 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles.migrate_enable
      0.07            +0.0        0.12 ±  4%  perf-profile.children.cycles.skb_network_protocol
      0.06 ±  6%      +0.0        0.11 ±  5%  perf-profile.children.cycles.mem_cgroup_handle_over_high
      0.00            +0.1        0.05        perf-profile.children.cycles.__xfrm_policy_check2
      0.00            +0.1        0.05        perf-profile.children.cycles.perf_swevent_event
      0.05            +0.1        0.10 ±  3%  perf-profile.children.cycles.qdisc_pkt_len_init
      0.00            +0.1        0.06        perf-profile.children.cycles.tcp_urg
      0.05 ±  7%      +0.1        0.11 ±  4%  perf-profile.children.cycles.security_sock_rcv_skb
      0.44            +0.1        0.50        perf-profile.children.cycles.ip_finish_output
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles.sk_forced_mem_schedule
      0.05            +0.1        0.13 ± 37%  perf-profile.children.cycles.copy_page_from_iter_atomic
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles.perf_trace_run_bpf_submit
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles.shmem_getpage_gfp
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles.shmem_write_begin
      0.00            +0.1        0.09 ± 14%  perf-profile.children.cycles.shmem_write_end
      0.07 ±  6%      +0.1        0.17        perf-profile.children.cycles.kmalloc_slab
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles.switch_ldt
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles.tcp_ack_update_window
      0.09            +0.1        0.21 ±  3%  perf-profile.children.cycles.tcp_event_data_recv
      0.00            +0.1        0.12 ± 10%  perf-profile.children.cycles.cgroup_rstat_updated
      0.00            +0.1        0.13 ±  5%  perf-profile.children.cycles.cr4_update_irqsoff
      0.05            +0.1        0.19 ±  3%  perf-profile.children.cycles.sock_recvmsg
      0.00            +0.1        0.14 ±  5%  perf-profile.children.cycles.security_socket_recvmsg
      0.00            +0.1        0.15 ±  2%  perf-profile.children.cycles.arch_local_irq_enable
      0.22 ±  2%      +0.2        0.37 ±  8%  perf-profile.children.cycles.record__pushfn
      0.22 ±  2%      +0.2        0.37 ±  8%  perf-profile.children.cycles.writen
      0.22            +0.2        0.37 ±  8%  perf-profile.children.cycles.write
      0.00            +0.2        0.16 ± 15%  perf-profile.children.cycles.tcp_try_rmem_schedule
      0.12            +0.2        0.28 ±  2%  perf-profile.children.cycles.sock_rfree
      0.20 ±  2%      +0.2        0.37 ±  9%  perf-profile.children.cycles.ksys_write
      0.35            +0.2        0.53        perf-profile.children.cycles.finish_task_switch
      0.18 ±  2%      +0.2        0.36 ±  9%  perf-profile.children.cycles.vfs_write
      0.17 ±  2%      +0.2        0.36 ± 10%  perf-profile.children.cycles.new_sync_write
      0.17 ±  2%      +0.2        0.36 ± 10%  perf-profile.children.cycles.generic_file_write_iter
      0.16 ±  3%      +0.2        0.36 ± 11%  perf-profile.children.cycles.__generic_file_write_iter
      0.15 ±  3%      +0.2        0.36 ± 10%  perf-profile.children.cycles.generic_perform_write
      0.46            +0.2        0.69 ±  2%  perf-profile.children.cycles.ttwu_do_wakeup
      0.44            +0.2        0.67 ±  2%  perf-profile.children.cycles.check_preempt_curr
      0.34            +0.3        0.64        perf-profile.children.cycles.check_preempt_wakeup
      0.31 ±  2%      +0.4        0.68 ±  2%  perf-profile.children.cycles.validate_xmit_skb
      0.00            +0.4        0.44 ±  6%  perf-profile.children.cycles.mem_cgroup_uncharge_skmem
     15.55            +0.6       16.17        perf-profile.children.cycles.__tcp_push_pending_frames
      0.00            +1.1        1.08 ±  5%  perf-profile.children.cycles.__mod_memcg_state
      0.00            +1.7        1.69 ± 30%  perf-profile.children.cycles.propagate_protected_usage
      3.01            +3.5        6.48        perf-profile.children.cycles.__kfree_skb
     94.00            +3.7       97.66        perf-profile.children.cycles.main
      1.39            +4.3        5.72 ±  2%  perf-profile.children.cycles.skb_release_head_state
     92.39            +5.0       97.42        perf-profile.children.cycles.entry_SYSCALL_64_after_hwframe
     91.97            +5.3       97.25        perf-profile.children.cycles.do_syscall_64
      2.60            +5.5        8.12        perf-profile.children.cycles.sk_stream_alloc_skb
      3.18            +8.7       11.92 ±  2%  perf-profile.children.cycles.tcp_ack
      2.39            +8.9       11.30 ±  2%  perf-profile.children.cycles.tcp_clean_rtx_queue
      0.00           +11.2       11.17 ±  2%  perf-profile.children.cycles.__sk_mem_raise_allocated
      0.00           +11.2       11.20 ±  2%  perf-profile.children.cycles.__sk_mem_schedule
      9.27           +11.2       20.52        perf-profile.children.cycles.release_sock
     26.50           +11.6       38.12        perf-profile.children.cycles.__tcp_transmit_skb
      7.84           +12.2       19.99        perf-profile.children.cycles.__release_sock
     24.03           +13.1       37.09        perf-profile.children.cycles.__ip_queue_xmit
     19.68           +13.5       33.15        perf-profile.children.cycles.tcp_write_xmit
     21.67           +13.9       35.59        perf-profile.children.cycles.ip_finish_output2
      0.00           +14.5       14.54 ±  3%  perf-profile.children.cycles.page_counter_uncharge
      0.00           +14.6       14.56 ±  3%  perf-profile.children.cycles.drain_stock
      0.00           +14.7       14.68 ±  3%  perf-profile.children.cycles.refill_stock
     17.72           +15.2       32.88        perf-profile.children.cycles.__local_bh_enable_ip
      4.32           +15.4       19.69        perf-profile.children.cycles.tcp_build_frag
     17.20           +15.5       32.72        perf-profile.children.cycles.do_softirq
      0.00           +15.6       15.56 ±  2%  perf-profile.children.cycles.__sk_mem_reduce_allocated
     16.91           +15.7       32.57        perf-profile.children.cycles.__softirqentry_text_start
     16.58           +15.8       32.40        perf-profile.children.cycles.net_rx_action
     16.30           +15.8       32.13        perf-profile.children.cycles.__napi_poll
     16.24           +15.9       32.10        perf-profile.children.cycles.process_backlog
     15.43           +16.4       31.81        perf-profile.children.cycles.__netif_receive_skb_one_core
     13.52           +16.9       30.44        perf-profile.children.cycles.ip_local_deliver_finish
     13.48           +17.0       30.43        perf-profile.children.cycles.ip_protocol_deliver_rcu
     57.77           +17.1       74.83        perf-profile.children.cycles.sendfile
     13.28           +17.1       30.35        perf-profile.children.cycles.tcp_v4_rcv
     55.96           +18.0       73.95        perf-profile.children.cycles.sendfile_tcp_stream
     24.36           +21.4       45.71        perf-profile.children.cycles.do_tcp_sendpages
     48.80           +22.6       71.38        perf-profile.children.cycles.__x64_sys_sendfile64
     47.51           +23.5       71.00        perf-profile.children.cycles.do_sendfile
      0.00           +23.6       23.57 ±  2%  perf-profile.children.cycles.page_counter_try_charge
     45.62           +24.7       70.34        perf-profile.children.cycles.do_splice_direct
     45.45           +24.8       70.30        perf-profile.children.cycles.splice_direct_to_actor
     15.71           +25.2       40.90        perf-profile.children.cycles.tcp_v4_do_rcv
     15.09           +25.5       40.62        perf-profile.children.cycles.tcp_rcv_established
      0.00           +26.8       26.77        perf-profile.children.cycles.tcp_data_queue
     38.38           +29.1       67.52        perf-profile.children.cycles.direct_splice_actor
     38.26           +29.2       67.48        perf-profile.children.cycles.generic_splice_sendpage
     37.93           +29.4       67.36        perf-profile.children.cycles.__splice_from_pipe
     36.27           +30.5       66.75        perf-profile.children.cycles.pipe_to_sendpage
     35.97           +30.7       66.65        perf-profile.children.cycles.sock_sendpage
     35.83           +30.8       66.59        perf-profile.children.cycles.kernel_sendpage
     35.52           +31.0       66.50        perf-profile.children.cycles.inet_sendpage
     35.06           +31.3       66.36        perf-profile.children.cycles.tcp_sendpage
      0.00           +38.0       37.95 ±  2%  perf-profile.children.cycles.try_charge_memcg
      0.00           +39.0       38.96 ±  2%  perf-profile.children.cycles.mem_cgroup_charge_skmem
      7.98            -5.8        2.16        perf-profile.self.cycles.copy_user_enhanced_fast_string
      2.18 ±  2%      -1.8        0.42 ±  3%  perf-profile.self.cycles.ipv4_mtu
      2.26            -1.6        0.69 ±  4%  perf-profile.self.cycles.load_new_mm_cr3
      2.16            -1.3        0.89 ±  3%  perf-profile.self.cycles._raw_spin_lock_bh
      1.41 ±  2%      -1.2        0.20 ±  4%  perf-profile.self.cycles.dst_release
      1.70            -1.0        0.66 ±  4%  perf-profile.self.cycles.psi_group_change
      1.33            -1.0        0.33 ±  3%  perf-profile.self.cycles.restore_fpregs_from_fpstate
      1.43            -0.9        0.52 ±  3%  perf-profile.self.cycles.copy_page_to_iter
      1.30            -0.8        0.50 ±  4%  perf-profile.self.cycles._raw_spin_lock
      1.52            -0.8        0.75 ±  2%  perf-profile.self.cycles.tcp_build_frag
      1.04            -0.7        0.29 ±  4%  perf-profile.self.cycles.__entry_text_start
      1.04            -0.7        0.31 ±  5%  perf-profile.self.cycles.__switch_to_asm
      1.24            -0.7        0.51 ±  3%  perf-profile.self.cycles.__tcp_transmit_skb
      0.98 ±  2%      -0.7        0.26 ±  3%  perf-profile.self.cycles.ipv4_dst_check
      1.30            -0.7        0.58 ±  2%  perf-profile.self.cycles.filemap_read
      0.98            -0.7        0.29 ±  4%  perf-profile.self.cycles.save_fpregs_to_fpstate
      1.39            -0.6        0.75        perf-profile.self.cycles.__dev_queue_xmit
      0.90            -0.6        0.26 ±  4%  perf-profile.self.cycles.__fget_light
      0.85            -0.6        0.22 ±  5%  perf-profile.self.cycles.read_tsc
      0.79 ± 10%      -0.6        0.19 ±  5%  perf-profile.self.cycles._copy_to_iter
      0.88            -0.6        0.29 ±  3%  perf-profile.self.cycles._raw_spin_lock_irqsave
      1.13            -0.6        0.55 ±  2%  perf-profile.self.cycles.filemap_get_read_batch
      0.84 ±  2%      -0.6        0.29 ±  3%  perf-profile.self.cycles.do_sendfile
      0.80            -0.5        0.26 ±  2%  perf-profile.self.cycles.native_sched_clock
      0.72            -0.5        0.19 ±  4%  perf-profile.self.cycles.__put_user_nocheck_8
      0.66            -0.5        0.17 ±  4%  perf-profile.self.cycles.__virt_addr_valid
      0.95 ±  3%      -0.5        0.47 ±  3%  perf-profile.self.cycles.ip_rcv_finish_core
      0.67            -0.5        0.19 ±  5%  perf-profile.self.cycles.__skb_datagram_iter
      0.68            -0.5        0.22 ±  2%  perf-profile.self.cycles.update_load_avg
      0.69 ±  8%      -0.5        0.24 ±  3%  perf-profile.self.cycles.tcp_recvmsg_locked
      0.71 ±  2%      -0.4        0.27 ±  4%  perf-profile.self.cycles.ip_finish_output2
      0.68            -0.4        0.24 ±  4%  perf-profile.self.cycles.page_cache_pipe_buf_release
      0.98            -0.4        0.56 ±  2%  perf-profile.self.cycles.skb_release_data
      1.08            -0.4        0.66 ±  2%  perf-profile.self.cycles.__switch_to
      0.64            -0.4        0.24 ±  4%  perf-profile.self.cycles.__splice_from_pipe
      0.66            -0.4        0.26 ±  3%  perf-profile.self.cycles.do_tcp_sendpages
      0.67 ±  2%      -0.4        0.28        perf-profile.self.cycles.update_curr
      1.00 ±  2%      -0.4        0.62 ±  3%  perf-profile.self.cycles.__schedule
      0.50 ±  8%      -0.4        0.12 ±  6%  perf-profile.self.cycles.update_min_vruntime
      0.66            -0.4        0.29 ±  3%  perf-profile.self.cycles.__inet_lookup_established
      0.52            -0.4        0.15 ±  4%  perf-profile.self.cycles.kmem_cache_free
      0.52            -0.4        0.16 ±  4%  perf-profile.self.cycles.__local_bh_enable_ip
      0.54            -0.4        0.18 ±  3%  perf-profile.self.cycles.ktime_get
      0.46            -0.3        0.11 ±  4%  perf-profile.self.cycles.__get_user_8
      0.56            -0.3        0.22 ±  4%  perf-profile.self.cycles.exit_to_user_mode_loop
      0.45            -0.3        0.11 ±  6%  perf-profile.self.cycles.__rseq_handle_notify_resume
      0.48            -0.3        0.14 ±  5%  perf-profile.self.cycles.sendfile_tcp_stream
      0.52            -0.3        0.19 ±  3%  perf-profile.self.cycles.netperf_sendfile
      0.46            -0.3        0.14 ±  4%  perf-profile.self.cycles.atime_needs_update
      0.62            -0.3        0.31 ±  3%  perf-profile.self.cycles.tcp_write_xmit
      0.43            -0.3        0.12 ±  5%  perf-profile.self.cycles.__wrgsbase_inactive
      0.51            -0.3        0.20        perf-profile.self.cycles.sendfile
      0.44            -0.3        0.14 ±  9%  perf-profile.self.cycles.__check_object_size
      0.44            -0.3        0.15 ±  3%  perf-profile.self.cycles.recv_tcp_stream
      0.42            -0.3        0.12 ±  6%  perf-profile.self.cycles.syscall_return_via_sysret
      0.48            -0.3        0.20 ±  2%  perf-profile.self.cycles.tcp_established_options
      0.53 ±  3%      -0.3        0.26 ±  5%  perf-profile.self.cycles.___perf_sw_event
      0.32 ±  4%      -0.3        0.05        perf-profile.self.cycles.sk_stream_alloc_skb
      0.38 ± 13%      -0.3        0.13 ±  3%  perf-profile.self.cycles.sk_wait_data
      0.36 ± 11%      -0.3        0.11 ±  4%  perf-profile.self.cycles.inet_sendpage
      0.42            -0.3        0.17 ±  5%  perf-profile.self.cycles.entry_SYSCALL_64_after_hwframe
      0.45            -0.3        0.20 ±  2%  perf-profile.self.cycles.wait_woken
      0.35 ±  2%      -0.2        0.10 ±  4%  perf-profile.self.cycles.ip_rcv_core
      0.36            -0.2        0.12 ±  4%  perf-profile.self.cycles.schedule
      0.38 ±  2%      -0.2        0.14 ±  3%  perf-profile.self.cycles.update_cfs_group
      0.32            -0.2        0.08 ±  5%  perf-profile.self.cycles.do_syscall_64
      0.41 ±  5%      -0.2        0.18 ±  4%  perf-profile.self.cycles.enqueue_entity
      0.46            -0.2        0.23 ±  3%  perf-profile.self.cycles.__update_load_avg_se
      0.48            -0.2        0.26        perf-profile.self.cycles.__cond_resched
      0.31            -0.2        0.09 ±  5%  perf-profile.self.cycles.kernel_sendpage
      0.28            -0.2        0.07 ±  5%  perf-profile.self.cycles.slab_free_freelist_hook
      0.29            -0.2        0.08 ±  4%  perf-profile.self.cycles.recv
      0.29            -0.2        0.08 ±  7%  perf-profile.self.cycles.copy_user_generic_unrolled
      0.30            -0.2        0.10 ±  5%  perf-profile.self.cycles.process_backlog
      0.24 ±  2%      -0.2        0.04 ± 44%  perf-profile.self.cycles.ip_skb_dst_mtu
      0.38            -0.2        0.18 ±  5%  perf-profile.self.cycles.__ksize
      0.30            -0.2        0.10 ±  5%  perf-profile.self.cycles.fsnotify_perm
      0.30            -0.2        0.10 ±  4%  perf-profile.self.cycles.generic_splice_sendpage
      0.28            -0.2        0.09 ±  5%  perf-profile.self.cycles.memcg_slab_free_hook
      0.34 ±  4%      -0.2        0.15 ±  3%  perf-profile.self.cycles.__alloc_skb
      0.31            -0.2        0.12 ±  4%  perf-profile.self.cycles.kfree
      0.29            -0.2        0.10 ±  3%  perf-profile.self.cycles.splice_direct_to_actor
      0.32            -0.2        0.13        perf-profile.self.cycles.__fsnotify_parent
      0.33 ±  2%      -0.2        0.14 ±  2%  perf-profile.self.cycles.ip_send_check
      0.29            -0.2        0.10 ±  4%  perf-profile.self.cycles.pipe_to_sendpage
      0.45            -0.2        0.27        perf-profile.self.cycles.__kmalloc_node_track_caller
      0.27            -0.2        0.09 ±  5%  perf-profile.self.cycles.iterate_groups
      0.47            -0.2        0.29        perf-profile.self.cycles.tcp_current_mss
      0.40            -0.2        0.22 ±  2%  perf-profile.self.cycles.tcp_v4_rcv
      0.25            -0.2        0.07 ±  5%  perf-profile.self.cycles.current_time
      0.39 ±  2%      -0.2        0.22 ±  2%  perf-profile.self.cycles.__update_load_avg_cfs_rq
      0.32            -0.2        0.14 ±  3%  perf-profile.self.cycles.__softirqentry_text_start
      0.22 ±  7%      -0.2        0.06 ±  8%  perf-profile.self.cycles.set_next_buddy
      0.22 ±  2%      -0.2        0.05 ±  7%  perf-profile.self.cycles.tcp_sendpage
      0.27            -0.2        0.11 ±  4%  perf-profile.self.cycles.tcp_send_mss
      0.22 ±  2%      -0.2        0.07 ±  5%  perf-profile.self.cycles.__mod_timer
      0.28            -0.2        0.13 ±  4%  perf-profile.self.cycles.generic_file_splice_read
      0.22 ±  5%      -0.2        0.06 ±  7%  perf-profile.self.cycles.psi_task_change
      0.22            -0.2        0.07 ±  7%  perf-profile.self.cycles._copy_from_user
      0.23 ± 20%      -0.2        0.08 ± 12%  perf-profile.self.cycles.perf_trace_sched_switch
      0.23 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles.__tcp_select_window
      0.37 ±  2%      -0.1        0.22 ±  3%  perf-profile.self.cycles.tcp_clean_rtx_queue
      0.21            -0.1        0.06 ±  7%  perf-profile.self.cycles.touch_atime
      0.20            -0.1        0.06 ±  8%  perf-profile.self.cycles.tcp_event_new_data_sent
      0.31 ±  3%      -0.1        0.17 ±  2%  perf-profile.self.cycles.psi_task_switch
      0.19            -0.1        0.05        perf-profile.self.cycles.rcu_all_qs
      0.21            -0.1        0.07 ±  5%  perf-profile.self.cycles.sock_put
      0.24 ±  2%      -0.1        0.10 ±  4%  perf-profile.self.cycles.schedule_timeout
      0.30 ±  2%      -0.1        0.16 ±  3%  perf-profile.self.cycles.do_softirq
      0.29            -0.1        0.16 ±  3%  perf-profile.self.cycles.tcp_wfree
      0.25            -0.1        0.12        perf-profile.self.cycles.sanity
      0.41            -0.1        0.28 ±  3%  perf-profile.self.cycles.tcp_ack
      0.20            -0.1        0.07 ±  6%  perf-profile.self.cycles.__x64_sys_sendfile64
      0.39 ±  8%      -0.1        0.27 ±  4%  perf-profile.self.cycles.prepare_task_switch
      0.37 ±  3%      -0.1        0.25 ±  4%  perf-profile.self.cycles.enqueue_task_fair
      0.33            -0.1        0.22 ±  2%  perf-profile.self.cycles.tcp_rcv_established
      0.23 ±  2%      -0.1        0.11 ±  3%  perf-profile.self.cycles.tcp_queue_rcv
      0.17 ±  2%      -0.1        0.06 ±  8%  perf-profile.self.cycles.inet_ehashfn
      0.28            -0.1        0.17 ±  2%  perf-profile.self.cycles.switch_fpu_return
      0.16            -0.1        0.05        perf-profile.self.cycles.pick_next_entity
      0.16 ±  7%      -0.1        0.06 ± 13%  perf-profile.self.cycles.ip_protocol_deliver_rcu
      0.16 ±  2%      -0.1        0.05        perf-profile.self.cycles.tcp_v4_fill_cb
      0.19            -0.1        0.08 ±  4%  perf-profile.self.cycles.filemap_get_pages
      0.16 ±  3%      -0.1        0.05        perf-profile.self.cycles.rcu_read_unlock_strict
      0.29            -0.1        0.18 ±  2%  perf-profile.self.cycles.__ip_queue_xmit
      0.20 ±  3%      -0.1        0.10 ±  3%  perf-profile.self.cycles.__sock_wfree
      0.15            -0.1        0.05        perf-profile.self.cycles.kfree_skbmem
      0.23            -0.1        0.13 ±  4%  perf-profile.self.cycles.__skb_clone
      0.18            -0.1        0.08 ±  5%  perf-profile.self.cycles.mark_page_accessed
      0.22            -0.1        0.12 ±  4%  perf-profile.self.cycles.__rdgsbase_inactive
      0.19            -0.1        0.10 ±  3%  perf-profile.self.cycles.put_prev_entity
      0.37            -0.1        0.28 ±  2%  perf-profile.self.cycles.kmem_cache_alloc_node
      0.45            -0.1        0.36        perf-profile.self.cycles.__cgroup_bpf_run_filter_skb
      0.80            -0.1        0.71        perf-profile.self.cycles.switch_mm_irqs_off
      0.18            -0.1        0.10 ±  4%  perf-profile.self.cycles.release_sock
      0.14 ± 31%      -0.1        0.06 ±  6%  perf-profile.self.cycles.sock_sendpage
      0.15 ±  3%      -0.1        0.07 ±  7%  perf-profile.self.cycles.native_load_tls
      0.13            -0.1        0.05        perf-profile.self.cycles.psi_flags_change
      0.13 ±  3%      -0.1        0.05 ±  8%  perf-profile.self.cycles.xas_start
      0.13 ±  2%      -0.1        0.05 ±  7%  perf-profile.self.cycles.sock_def_readable
      0.11            -0.1        0.03 ± 70%  perf-profile.self.cycles.woken_wake_function
      0.16 ±  7%      -0.1        0.09 ±  7%  perf-profile.self.cycles.dequeue_entity
      0.12 ±  3%      -0.1        0.05 ±  8%  perf-profile.self.cycles.tcp_mstamp_refresh
      0.14            -0.1        0.08 ±  7%  perf-profile.self.cycles.tcp_skb_entail
      0.15 ±  3%      -0.1        0.09 ±  5%  perf-profile.self.cycles.splice_from_pipe_next
      0.11            -0.1        0.06 ±  9%  perf-profile.self.cycles._raw_spin_unlock_irqrestore
      0.24 ±  3%      -0.1        0.19        perf-profile.self.cycles.try_to_wake_up
      0.17 ±  2%      -0.0        0.12 ±  3%  perf-profile.self.cycles.set_next_entity
      0.21 ±  2%      -0.0        0.17 ±  4%  perf-profile.self.cycles.exit_to_user_mode_prepare
      0.08 ±  6%      -0.0        0.03 ± 70%  perf-profile.self.cycles.__ip_finish_output
      0.07 ±  7%      -0.0        0.02 ± 99%  perf-profile.self.cycles.__tcp_push_pending_frames
      0.33 ±  2%      -0.0        0.29        perf-profile.self.cycles.pick_next_task_fair
      0.22            -0.0        0.18 ±  3%  perf-profile.self.cycles.tcp_check_space
      0.14 ±  2%      -0.0        0.10 ±  3%  perf-profile.self.cycles.xmit_one
      0.11            -0.0        0.08 ±  6%  perf-profile.self.cycles.tcp_rtt_estimator
      0.08            -0.0        0.05        perf-profile.self.cycles.rb_insert_color
      0.12            -0.0        0.09 ±  7%  perf-profile.self.cycles.resched_curr
      0.23            -0.0        0.20 ±  2%  perf-profile.self.cycles.__sys_recvfrom
      0.12 ±  4%      -0.0        0.09 ±  6%  perf-profile.self.cycles.migrate_disable
      0.10            -0.0        0.08 ±  6%  perf-profile.self.cycles.tcp_update_pacing_rate
      0.12 ±  3%      -0.0        0.10        perf-profile.self.cycles.rb_erase
      0.19 ±  2%      -0.0        0.17 ±  4%  perf-profile.self.cycles.reweight_entity
      0.06 ±  6%      -0.0        0.04 ± 44%  perf-profile.self.cycles.tcp_update_skb_after_send
      0.07 ±  7%      -0.0        0.05        perf-profile.self.cycles.ip_output
      0.09            -0.0        0.08 ±  6%  perf-profile.self.cycles.tcp_push
      0.12 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles.__build_skb_around
      0.10 ±  3%      -0.0        0.09 ±  5%  perf-profile.self.cycles.pick_next_task
      0.08            -0.0        0.07        perf-profile.self.cycles.netif_skb_features
      0.07            +0.0        0.08        perf-profile.self.cycles.tcp_chrono_stop
      0.25            +0.0        0.26        perf-profile.self.cycles.net_rx_action
      0.18 ±  6%      +0.0        0.20 ±  3%  perf-profile.self.cycles.__calc_delta
      0.38            +0.0        0.40        perf-profile.self.cycles.__netif_receive_skb_core
      0.07            +0.0        0.10 ±  4%  perf-profile.self.cycles.__wake_up_common
      0.07 ±  7%      +0.0        0.10 ±  3%  perf-profile.self.cycles.tcp_recvmsg
      0.07 ±  5%      +0.0        0.11 ±  3%  perf-profile.self.cycles.__netif_receive_skb_one_core
      0.10 ±  6%      +0.0        0.14 ±  9%  perf-profile.self.cycles.native_queued_spin_lock_slowpath
      0.12 ±  3%      +0.0        0.16 ±  2%  perf-profile.self.cycles.migrate_enable
      0.07            +0.0        0.11 ±  4%  perf-profile.self.cycles.sk_filter_trim_cap
      0.12 ±  4%      +0.0        0.16 ±  6%  perf-profile.self.cycles.is_cpu_allowed
      0.07            +0.0        0.12 ±  4%  perf-profile.self.cycles.skb_network_protocol
      0.06            +0.0        0.11 ±  6%  perf-profile.self.cycles.mem_cgroup_handle_over_high
      0.00            +0.1        0.05        perf-profile.self.cycles.__tcp_send_ack
      0.00            +0.1        0.05        perf-profile.self.cycles.__xfrm_policy_check2
      0.00            +0.1        0.05        perf-profile.self.cycles.perf_swevent_event
      0.00            +0.1        0.05        perf-profile.self.cycles.sock_recvmsg
      0.00            +0.1        0.05        perf-profile.self.cycles.ttwu_do_activate
      0.05            +0.1        0.10 ±  3%  perf-profile.self.cycles.qdisc_pkt_len_init
      0.24 ±  3%      +0.1        0.29 ±  4%  perf-profile.self.cycles.select_task_rq_fair
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles.shmem_write_end
      0.00            +0.1        0.06        perf-profile.self.cycles.tcp_urg
      0.05 ±  7%      +0.1        0.11 ±  4%  perf-profile.self.cycles.security_sock_rcv_skb
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles.tcp_send_delayed_ack
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles.sk_forced_mem_schedule
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles.perf_trace_run_bpf_submit
      0.07 ±  6%      +0.1        0.17        perf-profile.self.cycles.kmalloc_slab
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles.switch_ldt
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles.tcp_ack_update_window
      0.00            +0.1        0.11 ±  5%  perf-profile.self.cycles.arch_local_irq_enable
      0.00            +0.1        0.11 ±  3%  perf-profile.self.cycles.tcp_data_queue
      0.00            +0.1        0.12 ±  4%  perf-profile.self.cycles.refill_stock
      0.09            +0.1        0.21 ±  3%  perf-profile.self.cycles.tcp_event_data_recv
      0.00            +0.1        0.12 ± 10%  perf-profile.self.cycles.cgroup_rstat_updated
      0.00            +0.1        0.13 ±  5%  perf-profile.self.cycles.cr4_update_irqsoff
      0.00            +0.1        0.14 ±  5%  perf-profile.self.cycles.security_socket_recvmsg
      0.08            +0.1        0.22 ±  4%  perf-profile.self.cycles.inet_recvmsg
      0.11            +0.1        0.26        perf-profile.self.cycles.ip_rcv
      0.16            +0.2        0.32        perf-profile.self.cycles.dequeue_task_fair
      0.12            +0.2        0.28 ±  3%  perf-profile.self.cycles.sock_rfree
      0.00            +0.2        0.19 ±  4%  perf-profile.self.cycles.__sk_mem_raise_allocated
      0.29            +0.2        0.50 ±  2%  perf-profile.self.cycles.finish_task_switch
      0.00            +0.3        0.29 ±  3%  perf-profile.self.cycles.mem_cgroup_charge_skmem
      0.14 ±  3%      +0.3        0.47 ±  2%  perf-profile.self.cycles.validate_xmit_skb
      0.10            +0.4        0.51 ±  2%  perf-profile.self.cycles.check_preempt_wakeup
      0.00            +0.4        0.41        perf-profile.self.cycles.__sk_mem_reduce_allocated
      0.00            +1.0        0.97 ±  6%  perf-profile.self.cycles.__mod_memcg_state
      0.00            +1.7        1.68 ± 30%  perf-profile.self.cycles.propagate_protected_usage
      0.00           +13.5       13.54        perf-profile.self.cycles.page_counter_uncharge
      0.00           +14.3       14.28        perf-profile.self.cycles.try_charge_memcg
      0.00           +22.8       22.81 ±  2%  perf-profile.self.cycles.page_counter_try_charge




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


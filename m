Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66F1946C8
	for <oe-lkp@lists.linux.dev>; Thu, 16 Jan 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012681; cv=fail; b=TbIOZ3aPMUcyyYnzcg+0tnIi+11qBYQKkrn2r+SJ3KiqyhtBRtBBBsvHOYzo00bZxsZFl/TjN+IIOPzU0/xJBf36hmP3qshGnosdbXLjCRMxjtr1Nl2cGX6yuplzAnFI6TQqppWvT2S8LjWcd2xqoZRlEdaF33MJJOOWwUeuNPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012681; c=relaxed/simple;
	bh=DzaKGleHxz/BWQpMkFC/+UtPQeVgBNwRGfQsQYfNWoU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DMOsSvZLA4QzRvIlbaXwo1AwrXX9UfCsXdK6miIvAmtJg28mU5hTpl1TWIVjxkjPYV+ZLUdnAprlB/YOXEuDhcIu3uYuID58BBKF4+43AC1A7JFhaVHgQcO0jlAJJerYRNFzJvV9KD4TFqQ4HNtXqnRlatyct1YNWUKVA9vsTSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM6cT4Zx; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM6cT4Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737012679; x=1768548679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzaKGleHxz/BWQpMkFC/+UtPQeVgBNwRGfQsQYfNWoU=;
  b=RM6cT4ZxMRQwrybcoMUJ/iON9O1YHIpuzFhs3m7cRMvmSCXctWvb29C3
   ITHoWw7WuY8e0S5kcI/mpA5lX6/1sP5JtLxWhm98Vj7mRUe96sHw6CCeE
   7z7tE82MAdfPEF9dOtuMygeTCF+NL1kUBnsvwHJyvSuRxswQlvukVWXs2
   qugZTBey6vCOL5PTXMb5Qn/d66hwvOenYDhACKRqeEIyYMd2NZxL3rP7J
   KZ1RmkHD0WfFFYSN1WOXyA8BOeCy4h7W8SMjBy8hg3Oafhk4a2RQAN8kR
   lFMMZXy9Yyt70uLZj+uQtK1/r82FFY+Btd5hMAqUACjKsfCmZTnVTWQge
   Q==;
X-CSE-ConnectionGUID: +FnS8eHBSyatyA746nWPlw==
X-CSE-MsgGUID: jdtB8jMYTs+xq6nQoPoAXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41061171"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="41061171"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 23:31:18 -0800
X-CSE-ConnectionGUID: O2XeXl8tTl6q/1EX2rosgg==
X-CSE-MsgGUID: TUOsIlSgTr6xQ2kgUr+VPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110370624"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 23:31:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 23:31:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 23:31:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 23:31:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+yNwma1eYvc1FCCux8uKdxm9gO/+mR/9ORxAOWxRrDRbvMLz/BVQ8vQfqPtZJuxrxOsaQ56QgJeb9Rs8XJ6e8vUpM/lF2oo3y8+Cqjz3F+2oDHS5tMQ2jlo9JHvuhjP+Lwd0Icdk3P+L1hlygPsg9qVqcR1xfqFLwWoxAatG3kR+zU8B03cKOE6XWmNraEzqlxyLcIW5FtrAtIgrCpasAta8bJt+yT8+XGg0A5J6V8SNBJvc4v3Ec7vFh4mXQcHoUwKOyZT0i6xBOEgHodb3GvY6nnBJpFrzfICIqAwXFNC8E72e6NArqmWgMEndGbImeaS1wdKLj03ZLNbSmaEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiyNXsMvsxyRycBYcB48RT5HrVY7ERkV4ndHgVI9r24=;
 b=R1P0+SyycOhZlPpr6hOwT9urNA1R/4OBfZxf5Ij1kLo65tsnQX2ksydarEouRxxJJlNiFi6LtAvMor8CxR33b7DTBCzlCPaJl+ENFT53SFrFEL5eXGeaW5K00BWJ+S0GMJ4fuESJD2C4POC29bW6iCw/0xzJfepqE36033f6J902vrxqcx31hNQHSPPRVAS6/dPwhI+2zNrpyWBGiXAikFuBL8p7VwUmIqkA7n4SfHjIJnowryy3gwdVIfLq1WP5j8rOxXuCfe7xNMDclY/UXJgttWrxnUZrN8v5OGdLqVo8TFW2+fvd9IW3+wIJT0udVi/gBBfnv99MdqGPcM8z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:31:10 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:31:10 +0000
Date: Thu, 16 Jan 2025 15:31:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	<linux-arm-kernel@lists.infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [net]  552b7d131a:
 BUG:KASAN:stack-out-of-bounds_in_test_cache_read
Message-ID: <202501161526.96f6702a-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 029bf388-52a7-4d7e-c88d-08dd35ffbf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?37Uyum6K4F90V5OMUp5rBtOXh/URaIC2jyW/5CXDvesYfRXjmpHy2cpS4cgG?=
 =?us-ascii?Q?0W3RXv0ZjSR0xCGG0WkGGm7/6phGpl1rwUiQIDDQaTQKQ+I+OPDiIC/mvF+E?=
 =?us-ascii?Q?90J5IUi7i2+LPalBcQUPGAKxv34G4f49PiIcu4DYvkGG9OIOsLocRuxxW2Cq?=
 =?us-ascii?Q?xoitCTAuxlXbNI5GD2WpTO8fecWI5ZtFmQKuvghDQ0cYO3gSbaRfzZfD9BBA?=
 =?us-ascii?Q?f+kYvCW9Mux3oQpz2Cia7dBUnKdDOL8HzOyI3fmQcomASd+uSd1uM0xQLjRL?=
 =?us-ascii?Q?Q9TGzQzzoQ6f1bTiDKTc/AeBFYYtkorEFd5Y/Axm3kD8S6lC/1P+fXIzV9Jb?=
 =?us-ascii?Q?8TpX8YPdHibcbEBKh4U3f84+xnH9XyjJrWYMVJoycmR2ygWQ5MtK4DdBgEl8?=
 =?us-ascii?Q?bevPqaOeaHciqeCo08IPsGc3M2dIvs+/8E6jYEog/5kL49wYktAERH52kKq0?=
 =?us-ascii?Q?e719wKRrvgNEOCVhFRz81Sz73ZhM4F/d+hc6vcenFsqgXLTkQIcrn6qw+OtO?=
 =?us-ascii?Q?hkbXgrt/6O1oHiS3gftFVdvGtOd5FCBBoHhQCTtFo979z4zxnpplRU0Q3Q29?=
 =?us-ascii?Q?sPIo1sbSGcroS3kdUJyzQdlb4/MwQItltsN9IVq565ODvSmt7NeYgsj6se8o?=
 =?us-ascii?Q?NJM/u060Hoj9XtpNz8m3yLpFm8W7NSyHOB9utIhSVaaltlKA9q6ViK3JvSog?=
 =?us-ascii?Q?OYHJcp37JTDrD0Svv8C8tqa4FafLS/EgBDLZPQeYRAfUwoF4TNCAfnTFAruE?=
 =?us-ascii?Q?PXIRib7NK+X2gnk4MdcNlYXddi4HUiL8F5lNBRU9vPN5jQHk7+LOF1rkRNPo?=
 =?us-ascii?Q?1Qjh42ccvZ2gM3QEOK0f5RyYUE6xW/Xxf9VY7rYJkXQKRlE3Rhmwyg/tYT8p?=
 =?us-ascii?Q?coz0tEvZ5Gknq8cD4mHqoyiooykowgVQA+sJoqYru2RQqdBl8nreXdMfrcJd?=
 =?us-ascii?Q?1t2w8CckAG9M4fudqkcLOp5oEF1b/bjMlepYrLEMlBvcVk5+WWYYNaEoPzJ6?=
 =?us-ascii?Q?YmvbX4tvTyRaiuZSY2gLkwq2yZP/JntF6b/H3IiHiht1TkA7IVceEghPbNiT?=
 =?us-ascii?Q?oLRmA5umXl7HxY+Z16lPAotcoo4YxFrp67j0ph28C8V3hK+fJ+PP3BPG5Bpm?=
 =?us-ascii?Q?6/kbEkt6MVvHls0cbJPdNOqY766TmbqQ5G984oyTE6HCP4qXYBuisN/rJrm+?=
 =?us-ascii?Q?F8SNSofUCK+4D0YMykoSiGLUB+G0m133RwE0b3GljR4VEWtaX5wDX242xpPa?=
 =?us-ascii?Q?YAeGMRutfVdkNhxyqWeYw6JrCerXTxzv8M8xMdrijDIUKybyRADZe9FnYsuo?=
 =?us-ascii?Q?phwunV108hg0JLXxLRQSSN+FxUxEnL2LOM3I3rcrAOxrQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USvvr/JKIiAvomc2CFRAFGNkk6q5qCEAwdcvcDsfhGrTxIUiyFzZaMiW90rn?=
 =?us-ascii?Q?zadxQfhTJ1zyOpN3lu/CtvI9pRsnL5qoeqDPnWxJ7TmVQ757jxP3DsGhCMUx?=
 =?us-ascii?Q?R5p46dxu65A75SAx9+YFQx1tv1KF/AVDSvgxPDr7CCTx2Pzb1Su1pFk3cx4i?=
 =?us-ascii?Q?46bo1yujOM1wqcKCmKE1507595O3g+fT7CDu3CtRq2p1CE/ZLLST6JwJfGMG?=
 =?us-ascii?Q?h95kJiSsthuAnkM0egHvHctj60n+sNfMQS36D9fUOt5ToW3cCDxyJs83iKRr?=
 =?us-ascii?Q?OrWo1UkvDyYyjeu3usyU00cSl4t3WtNZxAnKNa9DqS8NXR34XQe0bi1PXqHF?=
 =?us-ascii?Q?OT2fVFvjdm8uks+4l3DzzDY2ZaHZI1EeAST57GziQvP+UuwkynqAji1b9qjh?=
 =?us-ascii?Q?4yzJaB65iJ/RPzOEbxpHvRgayuvAbTDUQwGWU/HIN47KCwFMhutL55Bz6BEJ?=
 =?us-ascii?Q?OVZ925dn2q+eYA+o5uUpJOHTaieg5fOpRlPk717fYtcEwy+i4CkFYuJWpF6Q?=
 =?us-ascii?Q?6WBSJCIobq6BNpKWuIh9x92kd9J6UWShdKCyOou6LwGWw0nIghycHn1xtVz5?=
 =?us-ascii?Q?Y3jkkPHg8LL8LUwP8/5bs3WcZQRd9XfisgNuIb6wYHiVN3bf25zx9YuMYXGx?=
 =?us-ascii?Q?vCcC8/homutVP+ODbQhtdu/k5XmYpRypC1lEvaQdfo5bw5QhYwp6XBejZNor?=
 =?us-ascii?Q?7rT8YxsIDS7JA964CKFfpo/5WdGvOa2XWG6YIt6gauxiuXpdRFLbIYsgDzcp?=
 =?us-ascii?Q?EMxKgkgzmMzsO2TX1bQnu05C72sIrpmSYetZ4m+vHLaO1H8jxF7wMQpldC6e?=
 =?us-ascii?Q?kafdrqMTRwCDSp9wGtXWuDWNhJC27VOVD0OOGieeoo3UNaf3+ZVhf/tjXta0?=
 =?us-ascii?Q?DR1i5dW5RnkRzKyD1i2XGPFyK1Mt5P7RvXHHEQbwXFIh1hIfavF6YMPzGZb8?=
 =?us-ascii?Q?qtsauxr6mSO62/2VtClIZAiymrMCA25tJa658vAABR3zr8XX+gnm7RIqP++i?=
 =?us-ascii?Q?C83imF5i4y+BJ4N4IJRxO7qdFTOrSqMbqMCs9p09qo8n+ivDAwsEp2mdpUGi?=
 =?us-ascii?Q?DFMPLh++vvx51MsveToz1GK0X0RUJXm13nmVyM0q7c7tBHAJRXJV3cKIXVVo?=
 =?us-ascii?Q?7yP2OodgPMkSWY5Yfq7U4eDZEkBHLR9N7MZ9JFu3DqD2jFgkrbAnf/usGMPX?=
 =?us-ascii?Q?ve49HkIXFR6+TmcFJcz2YmrxLWOdJEMZMjR7H73ntS+GX6zqGaDw8MJGkm/5?=
 =?us-ascii?Q?KC5XMYKvvxIbu/zPHiG+wkUEvHLO0h2qaoyKiuWSZ0yeAfUH8lNiBVBrp+nl?=
 =?us-ascii?Q?jKR94XVneCxlqfaXmT5XfgVuhabj6lqRoLHCLeV1jEOvGb+YCHVpuFvkC56E?=
 =?us-ascii?Q?L405MPXKZ0xWLAe/x0NTs0csJorE93uXTy+kKsIUDudQ8F6+wmm6al2EnORQ?=
 =?us-ascii?Q?Oe6SzrvIPIy1w0wZI+aCvTXKEGFyuDwjV74UUC0IJVcs8hsypl4heqdAuXqo?=
 =?us-ascii?Q?TjbFE//tLBXVRXDqZDntFFY5AoI0dNsf1t5R1WQ8hSZWs9zLwaKtWd92fqFk?=
 =?us-ascii?Q?MCMWJ6e11iEkPIrC+A+7JFARWq3NAoz9dqe7ollZJJhiKrjQ7ehB0VKyYLs7?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 029bf388-52a7-4d7e-c88d-08dd35ffbf94
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 07:31:10.4437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5GJJGPABvuHDNKqeaXkRj4FA9ibhha1wMG/PtrgZYQDM2OYx52KmJQMq7qYQCBZ5KFJji4ABbuEcMDyQo5Gyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:stack-out-of-bounds_in_test_cache_read" on:

commit: 552b7d131aa01bcb046fb635d66e256c3e7e13ee ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      619f0b6fad524f08d493a98d55bac9ab8895e3a6]
[test failed on linux-next/master e7bb221a638962d487231ac45a6699fb9bb8f9fa]

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-os-bkc-post-si-6.6-staging-gnr-kunit
compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501161526.96f6702a-lkp@intel.com


kern :err : [  214.467063] BUG: KASAN: stack-out-of-bounds in test_cache_read (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:129) 
kern  :err   : [  214.467229] Read of size 4 at addr ffffc90000bcfe10 by task kunit_try_catch/4204

kern  :err   : [  214.467448] CPU: 0 PID: 4204 Comm: kunit_try_catch Tainted: G                 N 6.1.0-rc5-01255-g552b7d131aa0 #1
kern  :err   : [  214.467663] Hardware name: Hewlett-Packard p6-1451cx/2ADA, BIOS 8.15 02/05/2013
kern  :err   : [  214.467824] Call Trace:
kern  :err   : [  214.467899]  <TASK>
kern :err : [  214.467967] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1)) 
kern :err : [  214.468069] print_address_description+0x87/0x2b2 
kern :err : [  214.468208] print_report (mm/kasan/report.c:396) 
kern :err : [  214.468308] ? test_cache_read (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:129) 
kern :err : [  214.468415] ? test_cache_read (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:129) 
kern :err : [  214.468521] kasan_report (mm/kasan/report.c:497) 
kern :err : [  214.468620] ? test_cache_read (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:129) 
kern :err : [  214.468728] test_cache_read (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:129) 
kern :err : [  214.468832] vcap_addr_keyset (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:317) 
kern :err : [  214.468937] ? memset (mm/kasan/shadow.c:44) 
kern :err : [  214.469026] vcap_api_addr_keyset_test (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:329) 
kern :err : [  214.469145] ? vcap_api_show_admin_rule_test (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:299) 
kern :err : [  214.469271] ? rwlock_bug+0x90/0x90 
kern :err : [  214.469378] ? complete_all (kernel/sched/clock.c:364) 
kern :err : [  214.469484] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-instrumented.h:28 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_debug.c:140) 
kern :err : [  214.469594] ? __switch_to_asm (arch/x86/entry/entry_64.S:265) 
kern :err : [  214.469698] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:115) 
kern :err : [  214.469806] ? migrate_swap_stop (kernel/sched/core.c:4044) 
kern :err : [  214.469917] kunit_try_run_case (lib/kunit/test.c:394) 
kern :err : [  214.470027] ? kunit_catch_run_case (lib/kunit/test.c:379) 
kern :err : [  214.470137] ? kunit_try_catch_throw (lib/kunit/try-catch.c:25) 
kern :err : [  214.470249] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30) 
kern :err : [  214.470379] kthread (kernel/kthread.c:376) 
kern :err : [  214.470470] ? kthread_complete_and_exit (kernel/kthread.c:331) 
kern :err : [  214.470589] ret_from_fork (arch/x86/entry/entry_64.S:312) 
kern  :err   : [  214.470689]  </TASK>

kern  :err   : [  214.470810] The buggy address belongs to stack of task kunit_try_catch/4204
kern  :err   : [  214.470964]  and is located at offset 496 in frame:
kern :err : [  214.471078] vcap_api_addr_keyset_test (drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:299) 

kern  :err   : [  214.471247] This frame has 5 objects:
kern  :err   : [  214.471341]  [48, 72) '__assertion'
kern  :err   : [  214.471347]  [112, 304) 'admin'
kern  :err   : [  214.471439]  [368, 416) 'keydata'
kern  :err   : [  214.471524]  [448, 496) 'mskdata'
kern  :err   : [  214.471612]  [528, 576) 'actdata'

kern  :err   : [  214.471836] The buggy address belongs to the virtual mapping at
[ffffc90000bc8000, ffffc90000bd1000) created by:
dup_task_struct (kernel/fork.c:975) 

kern  :err   : [  214.472226] The buggy address belongs to the physical page:
kern  :warn  : [  214.472354] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10e068
kern  :warn  : [  214.472555] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
kern  :warn  : [  214.472708] raw: 0017ffffc0000000 0000000000000000 dead000000000122 0000000000000000
kern  :warn  : [  214.472877] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
kern  :warn  : [  214.473043] page dumped because: kasan: bad access detected

kern  :err   : [  214.473223] Memory state around the buggy address:
kern  :err   : [  214.473337]  ffffc90000bcfd00: 00 00 00 00 00 00 00 00 00 00 f2 f2 f2 f2 f2 f2
kern  :err   : [  214.473496]  ffffc90000bcfd80: f2 f2 00 00 00 00 00 00 f2 f2 f2 f2 00 00 00 00
kern  :err   : [  214.473654] >ffffc90000bcfe00: 00 00 f2 f2 f2 f2 00 00 00 00 00 00 f3 f3 f3 f3
kern  :err   : [  214.473811]                          ^
kern  :err   : [  214.473907]  ffffc90000bcfe80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
kern  :err   : [  214.474064]  ffffc90000bcff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
kern  :err   : [  214.474221] ==================================================================
kern  :info  : [  214.474577]     not ok 1 - vcap_api_addr_keyset_test
kern  :info  : [  214.474946] addr: 788 X6 error rule, keyset: VCAP_KFS_MAC_ETYPE
kern  :info  : [  214.475242]     ok 2 - vcap_api_show_admin_raw_test


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250116/202501161526.96f6702a-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


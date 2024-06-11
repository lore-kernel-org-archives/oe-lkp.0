Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302F171099
	for <oe-lkp@lists.linux.dev>; Tue, 11 Jun 2024 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095724; cv=fail; b=DiYLHk7bX1soMrAqrOvZNB20U5MG9jx3VJgiqjyMphl9IHvAE7oJkTLSi3PMLALiHp4uYyyzJ8GuUFBZ26fK2rjjGcZ/eiCoQi9ahloHjQkhW5iGs9JN0Vnq/S27q+8WQV/ielssoQwxh0+2YoGucpmYJRXZiWnm7vx3/ar1TbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095724; c=relaxed/simple;
	bh=Hc8B+l7z+5bYu+xzm5xckyGdfA+6ZGCe1dNYSlGblZg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XHjVCFWXUOkmEegtf1waCSQH+B2bPTTGlfoSvq524fgAwSNAYtfIZSKN5mOjD9esEdher/+OPxQQ/pqwcO09X7tR1jSbYGwdeI4cvS4OjL32DdE+k3VcYrxOohyVLpIvfCYnNdciTVq3AiVdEOP52Phgru1wQiy5VidPaZertBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L78FiBm3; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L78FiBm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718095723; x=1749631723;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=Hc8B+l7z+5bYu+xzm5xckyGdfA+6ZGCe1dNYSlGblZg=;
  b=L78FiBm3UWIuSGJDd8xiFIuN/HuUItgmlD+u3YAmF4hXSZQtWfZKhdBq
   XHSFXzvy0rY10h+IMpQllstpLPF3qCdYU8FKD5ExVGErTFV+4IINS7Nog
   oWZNlYIuQpVZkbckhf+otJXTZmbEnT0NlbCLePxvUdNsEYNIGVNcqt9Lm
   /XhdZT/sqOWT0lcrCeoHEuT0oTnfFwCiTjNcmbl/+XgS9sEGvOWaNmfLY
   laOgPaMrEP2ofVBuBlQLgSTW1g9d5gPVJjyzNKD45oDcKE3IncclvlMvp
   po6O10EP5xeqhAeacPUfn9pESQJ5C3vN2WBXt2gGdmOPJw99K2kXe9CQu
   w==;
X-CSE-ConnectionGUID: qM2pv/l7SVa/IxMMyeYRAw==
X-CSE-MsgGUID: ZdF41WMGSLeUYiDCP09Knw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14743645"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14743645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:48:42 -0700
X-CSE-ConnectionGUID: jGsnNVv+ROWL6YWpLY7OZA==
X-CSE-MsgGUID: pqy6ZrOySoCimeeM3kuffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39430322"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jun 2024 01:48:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 01:48:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 01:48:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 01:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oexf4gECR4SL+8t9220K3+ffe+rZJ2GhelRT14oFSsahV09gXlwamnaz05bohrJaCmxgH2aZQmE0SqaXHvMgp9KBKzwRc4108ApCTPFOIps/wUDsZMsNwaRjkY8RomOX9xy/oW0ygqiiQZ5GmDn1cMV+mCik89mUsC5ldxJYC42MnhJERGH5g4b6hpKWwM2gLwIDmEwuGCAxlt518IxqFmfJuewhTYW50IGgjt6MkPziEasSeUFnzJTDsCjoGHrdeOfAidhh6lKCWB13lM+OQg70DBMBQyZNYyNbLI4H0qFsc1gnM+mN4epGhcY0SGaRGlJ441YTNUtKJABivNJz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlR7ld3Qvl+tVe73xdwp3cL6WHQC3NVkI011Yjc2NP8=;
 b=XBmjbjNBktt8n5cI4XCLyBWd1LHUc1akopxh+KvXWrKt1D7YvGjjU/rO0YCsjWArpVL7NSH1hDIcd4gNqwAY4KFAC43hAU+bvbG8ZGVzjkJ12nt0DdwDIgGIh2GNx/6Jq6qJJ5VIhp2MlZUdh116BC6tX0JdVgq7LegxSSdiYsNENqn446borJV6T6VNxA1Oi/Vtn2+LQ0AITqkb1nL8/l02A1sIyepcVX0jtrc1qJOi8EJmDT4p5FQud46FCBdJUTVv8W0df+04QV5/o5+3lhhz+weq0weq7EGkaTkVySaLmLsxMeH/13JXdAhL93Vbo1j+xF5FhEMjrV90GF5PKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 08:48:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 08:48:37 +0000
Date: Tue, 11 Jun 2024 16:48:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<rppt@kernel.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<osalvador@suse.de>, Wei Yang <richard.weiyang@gmail.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] mm: increase totalram_pages on freeing to buddy system
Message-ID: <202406111644.931d379c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240601133402.2675-1-richard.weiyang@gmail.com>
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: e45825a1-1520-49a3-59cb-08dc89f348e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7HNeeB2QgAHyuYT4PrvZuFH1JcVWODRdr3+WyZwON4OgB2xnczgRywCgLUWO?=
 =?us-ascii?Q?6sUyKg5CVgz4e317a2ElnJzbOo9aGIlLLsntpOAXCzvrcKCcz/BHb0PRUXgu?=
 =?us-ascii?Q?Z5misx6zL/XUvypeYebDzjxN8jq/IapLigJGNVc7Shk0Wt/SHIM+/TOGXw0+?=
 =?us-ascii?Q?/Rn1lElg/y+Up7+sURM8rTv3fdfXB8ZYOYzJOPIdJicdOgWB16Y4LxwuvKkT?=
 =?us-ascii?Q?kBGu4ChFdirzanFQR9ETIWY3piv1qAEXuJ7pBKOdKbuodX7pFgJwFYRvni1E?=
 =?us-ascii?Q?Q6h0+0gLStFQNpQP+A1QmEhGDE+ihzdgein5y0HbDDC4pF+mxciD04v0BJ+D?=
 =?us-ascii?Q?WJZQL2j0Ka3TcMKGeY5yZwBVY/XQ5cQ+rHm9/tRQvgI7nl2H2yxM3txKQrnx?=
 =?us-ascii?Q?m97TfThPpAkK1/EqZYxqWo1pAKYyUfBJ8XjYOJ0KN+HPpdIaNUYW1s7MCnob?=
 =?us-ascii?Q?ENep5++/DqH1o/lqZuRoP9+f0NdcJBc7li7CGXdedPEGPB3czExuX2slhdku?=
 =?us-ascii?Q?xX/PBPrn8WpJXub++usdJs6yU/sqnEzAxSAdVY6gFE6FD9+0bsxNIY79xaah?=
 =?us-ascii?Q?lwadaK7AgjndJoouLNw/tY3xvHq9deHZy9JJtDqmuCNCVX54rlLxr+w3jfmD?=
 =?us-ascii?Q?SiFyp7zRtMCIPeId2kF9T8JuKK3DqbpCVhdbHvPCr+KJXasKKWAiW6njZoaN?=
 =?us-ascii?Q?ZSGh3s4W4nVzDDU4ulR9XzcJr42gDtukqmVr39yREeF9a34nqn23tlQ+4YgG?=
 =?us-ascii?Q?lYuMqvdb9O0u4uJmtfB6AVBTdIrAEfFoOQYJ6EYUCoWvDFsW7DObkdppWBpL?=
 =?us-ascii?Q?it/lsJnVPzNbyXOeERmqbZwVmXuBiOrtkHIVDQepJq0Ey8db8jAsGsos9OoN?=
 =?us-ascii?Q?f/OLA2C5wddGMQSL+7JeTnJw7c9D2j2YCyMQJuZfoHmoTYljZBRrFWkqiRaL?=
 =?us-ascii?Q?HnWMG3FO9aIiMYtiMvyPtPyAiIU0NoonDk6/5l7LQx9ZFIA+uI0OWH6a2f1R?=
 =?us-ascii?Q?n4JmwEYOg9ILKLJrgPlTts+RIQQCqpHmhOuxfEBTX7LUsYnv9Rb5bWSZMRYu?=
 =?us-ascii?Q?Y2e3KuO9YXLt7IYBT+LB2syS4Xz/4LL/b76kOmM2rVnp1vccYYTMjz8Tf/rJ?=
 =?us-ascii?Q?YVs1EVzLqdA69APLneqkn4FChptJSWaXCAYpz6r27wxtEhUUzLfCxi5+hXuO?=
 =?us-ascii?Q?s062fs8n6zrZIdtCEm1n2ZBePlvCh44xVuQm3JqfHa7toLAMCToZf8QhsTnk?=
 =?us-ascii?Q?k0+SQyFB7b6+HWg5y/abF02HGnu1Rz9V1llnLYHxww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8c9/6c5uiaeuKwas8mbdskbHyvrXiqLRB8sw5buZKAOJsG3t8Yg9QvY758RM?=
 =?us-ascii?Q?AgbWO12c35y4amcYZ87iqfW017b61SknOG/Cu+WFgUVIJySKZwYLZIayAm8O?=
 =?us-ascii?Q?uM+TkGpvFpOJatWDhTHSkgxLbnhQS6rKDqlec5Cnt0wwwcExEDk+bKt5Ltv6?=
 =?us-ascii?Q?3VP9LWKN5Wg84XPUyVwtxpa01A1PjZeoitkuAhf/i0284I6YxBPODCROGSuQ?=
 =?us-ascii?Q?BPjOK578HiGi8RUF5AkTLuggDo2PShzIVNZnI/PN7YwRHhzHrWGcfFnZKsFz?=
 =?us-ascii?Q?BxoIWj9moRbFUI57Rx64Pt8AgwuYZ1OthpxHTkg7f4F7hHuaStnoENMYuhbS?=
 =?us-ascii?Q?TfPdmwYK6en+XBlnw1+2obLTcpSk5NYD57nqbA9HOeZOS9F9FVhu8s1XHoG6?=
 =?us-ascii?Q?Ld5tR4SgUzyi1PIxNwbb5a6nelnkU1/NdsPrndnR/llIY8+FiDYQnHHIvvYs?=
 =?us-ascii?Q?idVZZrz1JXDt8R0HElne+qQBJjd3Qw3KIokB0gNKbS2ZWwF/jpXhnIN/mqHC?=
 =?us-ascii?Q?J/DYH50rMiv2q1DkRFmk1IWRnL6dY0TamVC9uzJH6kB5mJJVGh/28fELuCXE?=
 =?us-ascii?Q?ZpflknuB2r5scXJtbvJBSOX/KuhKivCgZRcMS6F3PgdRuLSb8ZTo0K6oCqrM?=
 =?us-ascii?Q?A18es4QH70qCBgr+KJlLaU75QS3MFwpS4N0fbotsjqnrbLhgMKhXH2NveNyk?=
 =?us-ascii?Q?Y1fHbH7irBwQT5/U0KXy9t8FS4oyIi6WqA6g5XN6BGSIDli2nmZM6hrlFO3V?=
 =?us-ascii?Q?4Dh8g5ne59LYWP6gGJxDd82hLRWcCLQ6jrh2TDI4dI7QWcIHpFq5CkzfwZR7?=
 =?us-ascii?Q?ect2mymtvaFZu9SxI1B3EXU+PXd3ZpC2PPZ9dOL+RtU8MO20jyLBRfd725Sz?=
 =?us-ascii?Q?rcGdCvfWmeKP/vD8u9MjZ07b6yGRYSjykFxpHvE3XXS7bu7O6VW3FSgAY+Eu?=
 =?us-ascii?Q?MZT3+Ojk0dRJj5DHMtaUVI6PYzobFvRIE2WtaCUjM6e89sBLXR7LAeZnWlGi?=
 =?us-ascii?Q?ti5VqBCxPcYRXfk+Dy7wk0q7XxtAIQo/Tg5ldqD9l+QynxQZhPBL+URLIwNy?=
 =?us-ascii?Q?ZpjQDUMokp1y0i6sHkiGtsFxD88s93viRLekOb1iMYdaJIeMX0zTfWmL/Z9R?=
 =?us-ascii?Q?Qg4qk3Ybu+rtJConJojd7xhywPrErKyFogU/9+89k9XDo3t0pD0Y3owEJz3U?=
 =?us-ascii?Q?ucUY5KXG/hSElYAQHdi+fgSPY2VN3+zFx1gll8rsNtDPpgxbBm8AppTc+8xO?=
 =?us-ascii?Q?c0/gK62kEq+tFfO6YnGSvZm/Y7SQt81Q5eL3/TOemHo6tV6p4N0JU9wdEA50?=
 =?us-ascii?Q?KdgaptwZrgR0kPvlh0AgUu1hb3lXxzJ/LEGg1z2Lcbyyy0S63cb7aFhMIwzt?=
 =?us-ascii?Q?+Wo82J18kLhVZmqL1bkttBdXj4WWtKEfOganq8AVz7/U0o/gh2WF5/PUQxyF?=
 =?us-ascii?Q?/kPyxlGRQyLG68BHwJewsyTb3Al37aVKo4ki/1dX4TlaeW+yPD4PEf7r8vy3?=
 =?us-ascii?Q?bdhgc6d++5rsGKZzJybtdoMpr6g8GvmjmgThSqa53Bzxls8J6I83h+cAMFNO?=
 =?us-ascii?Q?WHqJSlMemGDzTZAEVlTp9C4xPGVjphx9DsCEfc+SKcxaebL5wb/uEWRbOP2K?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e45825a1-1520-49a3-59cb-08dc89f348e9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 08:48:37.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCFqvqEncOl3YNhotDa8vL5BSep2tHvnCp3ePGO2U+owfEJgy1rtKaxgJOXphGYswzkubPjd7XIWLN8OKF+5vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "xfstests.generic.224.fail" on:

commit: a4722639595dc3fa15c793a5b00bb4b023a34288 ("[PATCH] mm: increase totalram_pages on freeing to buddy system")
url: https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-increase-totalram_pages-on-freeing-to-buddy-system/20240601-213533
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20240601133402.2675-1-richard.weiyang@gmail.com/
patch subject: [PATCH] mm: increase totalram_pages on freeing to buddy system

in testcase: xfstests
version: xfstests-x86_64-98379713-1_20240603
with following parameters:

	disk: 4HDD
	fs: udf
	test: generic-224



compiler: gcc-13
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406111644.931d379c-oliver.sang@intel.com

2024-06-09 06:39:08 export TEST_DIR=/fs/sda1
2024-06-09 06:39:08 export TEST_DEV=/dev/sda1
2024-06-09 06:39:08 export FSTYP=udf
2024-06-09 06:39:08 export SCRATCH_MNT=/fs/scratch
2024-06-09 06:39:08 mkdir /fs/scratch -p
2024-06-09 06:39:08 export DISABLE_UDF_TEST=1
2024-06-09 06:39:08 export SCRATCH_DEV=/dev/sda4
2024-06-09 06:39:08 echo generic/224
2024-06-09 06:39:08 ./check generic/224
FSTYP         -- udf
PLATFORM      -- Linux/x86_64 lkp-skl-d02 6.10.0-rc1-00201-ga4722639595d #1 SMP PREEMPT_DYNAMIC Fri Jun  7 19:31:50 CST 2024
MKFS_OPTIONS  -- /dev/sda4
MOUNT_OPTIONS -- /dev/sda4 /fs/scratch

generic/224       [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/224.out.bad)
    --- tests/generic/224.out	2024-06-03 12:10:00.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/224.out.bad	2024-06-09 06:41:46.383320015 +0000
    @@ -1,2 +1,34 @@
     QA output created by 224
    -*** Silence is golden ***
    +/lkp/benchmarks/xfstests/tests/generic/224: fork: retry: Resource temporarily unavailable
    +/lkp/benchmarks/xfstests/tests/generic/224: fork: retry: Resource temporarily unavailable
    +/lkp/benchmarks/xfstests/tests/generic/224: fork: retry: Resource temporarily unavailable
    +/lkp/benchmarks/xfstests/tests/generic/224: fork: retry: Resource temporarily unavailable
    +/lkp/benchmarks/xfstests/tests/generic/224: fork: retry: Resource temporarily unavailable
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/224.out /lkp/benchmarks/xfstests/results//generic/224.out.bad'  to see the entire diff)
Ran: generic/224
Failures: generic/224
Failed 1 of 1 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240611/202406111644.931d379c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


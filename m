Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E96224EA
	for <oe-lkp@lists.linux.dev>; Tue, 24 Dec 2024 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025830; cv=fail; b=REyQcI1294JPCEAbrp7jlP5Pp+AUUNkS8gb2z7MZVkkhQ2rXZ3R8Nyguk5GKIcJwiM2LuCu7FYNECpTMko23+Vd9o9kuFfBlQvcmG+SU7Nz2JykctmDmVyBospbzJcwTvlN4dpZn4nUvNrVMOkSXIlNcjQMAjqwiASu7jZqcfrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025830; c=relaxed/simple;
	bh=HGs40VbzNggKo7o5nB3ZTzbnwFSGPWrGwc/3p7AxItY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=udM45n+oBCyaj701EyHvO2kxBmN1wH/qayyp++wSl1iosgUG81clwwzKd2NIIKQp0nctN/+acdnVM1d3AxqOPS4/ws9I18DlLYdy9My8gc48kFP06HS3FbtEHKgW9E46Sm+51dk2lcVqjvani9SLxdXeWS2Ki+eMJ6OruAi3XfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RB+AvTvk; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RB+AvTvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735025828; x=1766561828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HGs40VbzNggKo7o5nB3ZTzbnwFSGPWrGwc/3p7AxItY=;
  b=RB+AvTvkNg8AoEp2TRp4KGe4Kpm/tt9Syqe1DNPy7ogk8S7fL/ySg0gS
   TdHYJFRuC9+ZxJuEpizt+YjSkJoyDUVkrlKHOWPXfw0M2GAku9LjZDgDf
   Z0/whpX9PSMyd01ef4GWnKj3BXmAemI0Yk0GSEVd2cTsqUbaVekOyeC4R
   QrTgBE0V1pY02hH8oN83Un+nyAhTOa3WDvquN3BUJPKCzpimgVOoPeqyC
   N5gh3lLxhs8uhNphZnOMGoLj6KmBcvBzMWLWUZMt64eIDMvOdzQ/SRZf3
   zZwTKlktKVy0g3GDlm1/43qRXKPSaE5n55g505o7GQWinY0CobbayIPQQ
   g==;
X-CSE-ConnectionGUID: jk4PCS+KQx2ALEAgVMAfEw==
X-CSE-MsgGUID: T5IndqyXTeqlyHGdtv0ggA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35631063"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="35631063"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 23:37:07 -0800
X-CSE-ConnectionGUID: KbFbEUYBSiyyYc5eFAYSlg==
X-CSE-MsgGUID: HzWr0v1bQw2vt68mV2jxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122694195"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 23:37:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 23:37:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 23:37:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 23:37:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upUf2/AYzk6S5fbw2SBAMZmO3k/0Xhm3xMMto/fjIVmwwYMV4uk48sD2x8V9gYOvBGdLp0fhsn7IhyKoXCqDfO2JCeXsIMHfFyiIbf800vNb46qap38Fsp8nWpI5tv/bnVuL8Qj3dzk74DXx57uczb0nsngVMwZw474bi+enGNnxSJS5qmSTa8dMXI3IWzqswIe0mAs1q3/z5xiMGZyE7oQVZH+K+SDpUsqtIO/y6VwOSjKfyVf1YnRajO6k9uSiC4vwD7b0KQYxpyfoy6BXMQgrHPJ6r+L/asLI5xSq0PdkaVF72iqZ5f6X551hM5zo7ENyUoNLT825HOyggNst3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KJEX2GVMrMUfpFJ9NTfEs1mB0GTnawDd9E8ATLuMYI=;
 b=LcWTGTkwvka+qL0CLibW6wMnVX7gv4OQdJIHwS18UB4LLR9y4NSiZloHdq1Z2gkm/+WESUpKqx9qXO+bnLYDKfJ/+QhVKyEHBn22cpOlmn+nLoROvoP+8+EqCCn9GfeGSiJImPCVGZdPVgTSnSoLMbCUEucmEznVfXVoNfSvMmiqOMp+gDZHvfuV1Fd+V9U++JPW/id/qzeuWFHqMRHWBZLthHhW6bQfKzvVNbtH5PqaGKQaH9iqouNvS3/dtiSp9IM1WQFIj/2H91bHM5um1zZPOeirsBvyeGMuuYh48E6LJd3vjwee48/20sIwkWoIKSWoU1Cq0MePhlpgOy1Ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 07:36:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 07:36:58 +0000
Date: Tue, 24 Dec 2024 15:36:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  51319c5cb6:
 BUG:sleeping_function_called_from_invalid_context_at_kernel/nsproxy.c
Message-ID: <202412241517.b81e285e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa89c37-6209-41f9-2cc2-08dd23edbf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5m1B7bWxP9XmLHSDwbiaYd5l9pPqYMFxVYOkV0LwdiT/3ZyJmdsctVWmzPrW?=
 =?us-ascii?Q?HqxlRO4Poy9+5xMBxGrIli8e2erBdxWFq6qCHcg1X4idqWTgxwYafFjSwfdt?=
 =?us-ascii?Q?nFEAoVLWQ2q3PGZ7WQChog/SUQgEKm5ap+iyDed2sOJKTPkktX7EHF2fiWn4?=
 =?us-ascii?Q?BEICZfL9q2wIA54QSF0hWXXRoHZkeC92xsMeZBrg2UBPtShiOcRFOq9VGCAW?=
 =?us-ascii?Q?LEtkv0WNfbFkkYxcxjU9TwjVZqkWVtTWbj84+REm3FQ3/0cTYYR7yJHyW3BA?=
 =?us-ascii?Q?T6JGpa3ZeuNeJY9mgQLaKH0li48CKbkDOafXSXGaxsYrBazERA51e2tlOSOs?=
 =?us-ascii?Q?Dt5IKGchH75jd2HrZ/ZpuEauUTWZiAmgX95O0MiIfCTX9sFNbZRfmj/tCWw9?=
 =?us-ascii?Q?wvD9k2FO+OQ5UXq5Q+I6Dj920KHkT4F/woPP2+O5jnEsZk/3ttfX6vFuYd6s?=
 =?us-ascii?Q?g+SsrdWeEgAUsKoN+CZ2MYLiNYcQ1965cwNdAehHzyOx0DwXXp6SoD4Q28xu?=
 =?us-ascii?Q?8QDrB+J0FYTG7kQST6bY6dvPFcTb+uAJd28cmwcj4cntBcLQR8kwG+hG9rJK?=
 =?us-ascii?Q?n+OzJaSNy9mMeb4L2cmR48iXLpAA2zbbTR1xePCpm5dctLAc9hyeNMUeH5Oc?=
 =?us-ascii?Q?BQqhOIU8ipKGRBxPiBVkRCPFNm69ieI266R0QHax3ZofURWLr77C2P08PtmW?=
 =?us-ascii?Q?x8JmdKYDsEyzyPFyYV8OO4jw4FMzRyceHa1lLB+vjIkiZIoCavttFfco4S96?=
 =?us-ascii?Q?aMa2MrrDP72HePw9As7Tf5UeatpTPtCK6q3Vu0Y9Wk1sRtVvWe06ogevM6VV?=
 =?us-ascii?Q?RtE3F0bLuIbdjeTj4lZr0MwlmxnVkCBnpSWj9Fo2w8JvWsdVpdkfOMDQtXBU?=
 =?us-ascii?Q?txHziagTgkP0U0hEKAB/Kksrpo6FJPxof9IOPx/+b65xRP/jc9RP8Vy852wD?=
 =?us-ascii?Q?zb3VIMQiehs5hdntMNy5l4yt54XuXq7w2K69U/AhDahnjoYV52ElmmWk9xkF?=
 =?us-ascii?Q?5t+kJOWKb+uhQ8xcHHpMKTGEmJDhoxfNWD6CaYOSMHjT4cV4Wahk7u35E7Rk?=
 =?us-ascii?Q?3SdRFch7bg1yBtjT1LQU0PjlI8d53Dj/5FoGXN0HbP9KO4zWioyyBkZ+/G7G?=
 =?us-ascii?Q?RrJ34OeE/XNqJ6DeA9qaomOkve73T5COUAo4Ano15nQ87b0T5Cba54DLp2QZ?=
 =?us-ascii?Q?yHm6q6nvcXmww+HeFxpcMXRl804T/fJ9nXEvi6dlVgEPuDG+e6s4DeZzzjXg?=
 =?us-ascii?Q?0t0UqFSi3wJc5qnIM3IjlddGNpvyfmxQr2jamDfRN7YX6opT84vrD4VIwsEW?=
 =?us-ascii?Q?ayo4C2boUQAw0jD5Vbsaf3wAGtJkhrutmMn0W2OpFUQ64Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sli8jAMUwV/GFfGLRneN8nLqAh82B/z2ZOUr9RafOJ+72TbJ+DXY8hpQYHdr?=
 =?us-ascii?Q?URoJCtdXCLuMpLAltz/3aZXwuD//Ulm/4H1LUkipGsjVYP6Fj+B+Ikxm0zRa?=
 =?us-ascii?Q?6Qzg8JxslUJmpwB0bcgq5wvUT2Es6Ix3V7PAhPh3G/AkmH8NEyqE8b+FlI6+?=
 =?us-ascii?Q?dGNQExJwvFEUBT8IdKqnMAzH5rCSTableaMn4tCcG5hYXqWroXi0BybC8FTK?=
 =?us-ascii?Q?x8zXv4udzi77c9pRoCwRt3vH7dAr0TMrL8QlCz4z7f9nNhetQe8LXmA/eDX8?=
 =?us-ascii?Q?yys9qFgXMsdYLytkxGuvSBvtUOeTXG6PiB5K/OUbZuIT72ocge5zWtUlUJti?=
 =?us-ascii?Q?ju6QdRLEIQVxG9pABtZEAmdSyIezwBwQ6uRZVR0pBgmFPsP8fuoqPWg4jNH7?=
 =?us-ascii?Q?wiAZYXoX8ij5ZI2bA4DcRR9PVikcguRGBRblhPQ64w2dpOWJ7060DJsrwMka?=
 =?us-ascii?Q?d4n/8JmRpJPs53sglJbz7otNOXV+xYGaDbs1b2OEOPL+JxNXh2xHdKU1lfq1?=
 =?us-ascii?Q?Gh0vCN/DFdi+5PzSbON+tjZshtfzc6qpPpQ3VVggyvYoa5fUXznGsUGcrGcJ?=
 =?us-ascii?Q?xqIWU29dpvV6QY+nVv0uNtfK5fauzJ7rBsp8rBqkdnjNI/F5Gn4S8VN5tB4P?=
 =?us-ascii?Q?daAmIOZnuxOasIRf7RdREQSbo8X8M40gHjO8NIlCq8zEA7k9ZZkre6WO4SjH?=
 =?us-ascii?Q?0BanoFoZKp6IISgsZ91bjIaD9KXvtwLrt6/kloN6BMtp7Qi90pIX2Bx1bZew?=
 =?us-ascii?Q?RXh+rcnlCDbRp2Ot5c8F05bDQjIj1zUuSA6pQ6gKEL3Ja1JCA0QCU6WXvF0X?=
 =?us-ascii?Q?73EH+aDNTTZhNqrQect2egz4TM3XDM0G11qy5itgGbcAIqR7jZ4X0CUIzLTJ?=
 =?us-ascii?Q?eNjnxa0uY/X4BWJPeCxL7JrAB5MDPusUB7J8QyrPK2VH/ase+NeKkxMbtjY+?=
 =?us-ascii?Q?2vhHLY8jLSqXXRGSPABQVjiOEzwtwRbesmXdSdn10cHoDarMO7FedpaVjErK?=
 =?us-ascii?Q?O7EPnlp+PpkYRwE+gt9ZrE0milIYfe/+45t5ZBbUvXI2VnRJZGGmI8/K1q58?=
 =?us-ascii?Q?x0LY9cebSJFfm+3SIZB2noOjgCCgygvywAHqfW4i+RBXS4XNondi4Dt0sEmm?=
 =?us-ascii?Q?CeTt3xk0IqrrxPggnmwgx94Tx/5K2mvA9LLO+yabwYSnoS/8yt4hwau/cNyz?=
 =?us-ascii?Q?HAWK8aLrUqrX8PC2ojWebiqsoeOVhOF17V6D8V3aNQpRzfHFR/BS4fpkpvUi?=
 =?us-ascii?Q?oHoz6hdqTT42Qla7ev4il9oEXX9R7VH+i5d7uhMoMxQmmsCzyDmrcSD0crx1?=
 =?us-ascii?Q?XfwGYqxe2SfeISC5LcIou9Nduy7hKBZ/r32Vwnj0Hf/5TyTWs1bqxmF8gTU0?=
 =?us-ascii?Q?27KRWv1PBW5PnFAi5w4eStYD1zEUrvfdqDMb9DN15jswahEPeQe00LO64/4m?=
 =?us-ascii?Q?bWgDrLeh2oRJpeoyh/ciaSApimu7j2gnWIf27gj5dFjnz9NturRMpvDbnrew?=
 =?us-ascii?Q?H2lLKe4yiB0XZE98PlzLlgdCeZjywFEqcsxltdqRoZ02sVTLJbW54870y+cT?=
 =?us-ascii?Q?pj1rezCPx/gNmyKox5GKLkEGnsR6arBo4ffBKEBFm/pLa07Onz0/kcajO0Sd?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa89c37-6209-41f9-2cc2-08dd23edbf55
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 07:36:58.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTQtYtGBExc6REMWoQiI2AqklnWb1tTzJmPRLdjn09R3Rh5jdtXxZsQT9GTycSrsTSJAYTjClsu4dzbrP1lhsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-OriginatorOrg: intel.com



Hello,

we reported
"[bigeasy-staging:futex_local_v4.5] [futex]  51319c5cb6: stress-ng.pthread.ops_per_sec 68.4% regression"
in
https://lore.kernel.org/all/202412201111.1290bdf8-lkp@intel.com/

now we also notice one new issue as below. it doesn't always happen, but
with considerable rate, and keeps clean on parent by more runs.

7ee6fb8b9098b494 51319c5cb6c2f84994a14d11de0
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :50          34%          17:52    dmesg.BUG:scheduling_while_atomic
           :50          34%          17:52    dmesg.BUG:sleeping_function_called_from_invalid_context_at_kernel/nsproxy.c


below full report FYI.


kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_kernel/nsproxy.c" on:

commit: 51319c5cb6c2f84994a14d11de0fc26321bed99d ("futex: Resize futex hash table based on number of threads.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

in testcase: xfstests
version: xfstests-x86_64-8467552f-1_20241215
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-scratch-reflink-06



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412241517.b81e285e-lkp@intel.com


[  145.073215][    C1] BUG: sleeping function called from invalid context at kernel/nsproxy.c:243
[  145.073222][    C1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 3374, name: xfs_repair
[  145.073224][    C1] preempt_count: 7ffffffe, expected: 0
[  145.073226][    C1] RCU nest depth: 0, expected: 0
[  145.073229][    C1] CPU: 1 UID: 0 PID: 3374 Comm: xfs_repair Tainted: G S                 6.13.0-rc1-00008-g51319c5cb6c2 #1
[  145.073234][    C1] Tainted: [S]=CPU_OUT_OF_SPEC
[  145.073235][    C1] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[  145.073236][    C1] Call Trace:
[  145.073238][    C1]  <TASK>
[ 145.073239][ C1] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[ 145.073247][ C1] __might_resched (kernel/sched/core.c:8759)
[ 145.073252][ C1] ? free_pid (kernel/pid.c:163)
[ 145.073255][ C1] switch_task_namespaces (include/linux/kernel.h:73 kernel/nsproxy.c:243)
[ 145.073259][ C1] copy_process (kernel/fork.c:2678)
[ 145.073264][ C1] ? __pfx_copy_process (kernel/fork.c:2153)
[ 145.073267][ C1] ? _inline_copy_from_user (arch/x86/include/asm/uaccess_64.h:134 arch/x86/include/asm/uaccess_64.h:134 arch/x86/include/asm/uaccess_64.h:141 include/linux/uaccess.h:178)
[ 145.073271][ C1] ? copy_clone_args_from_user (include/linux/uaccess.h:401 kernel/fork.c:2999)
[ 145.073275][ C1] kernel_clone (include/linux/random.h:26 kernel/fork.c:2832)
[ 145.073277][ C1] ? __pfx_kernel_clone (kernel/fork.c:2791)
[ 145.073279][ C1] ? __pfx___alloc_pages_noprof (mm/page_alloc.c:4717)
[ 145.073283][ C1] ? __pfx_mm_cid_get+0x10/0x10
[ 145.073286][ C1] __do_sys_clone3 (kernel/fork.c:3135)
[ 145.073289][ C1] ? __pfx___do_sys_clone3 (kernel/fork.c:3115)
[ 145.073292][ C1] ? __pfx_try_charge_memcg (mm/memcontrol.c:2186)
[ 145.073296][ C1] ? __memcg_slab_post_alloc_hook (mm/memcontrol.c:3001 (discriminator 2))
[ 145.073299][ C1] ? _raw_spin_lock_irq (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170)
[ 145.073302][ C1] ? __pfx__raw_spin_lock_irq (kernel/locking/spinlock.c:169)
[ 145.073304][ C1] ? __mod_memcg_lruvec_state (mm/memcontrol.c:583 mm/memcontrol.c:766)
[ 145.073307][ C1] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153)
[ 145.073309][ C1] ? recalc_sigpending (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:102 kernel/signal.c:180 kernel/signal.c:177)
[ 145.073313][ C1] ? sigprocmask (kernel/signal.c:3242)
[ 145.073315][ C1] ? __lruvec_stat_mod_folio (mm/memcontrol.c:811)
[ 145.073318][ C1] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
[ 145.073321][ C1] ? __pfx_sigprocmask (kernel/signal.c:3219)
[ 145.073324][ C1] ? __folio_mod_stat (mm/rmap.c:1303)
[ 145.073328][ C1] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26)
[ 145.073330][ C1] ? __x64_sys_rt_sigprocmask (kernel/signal.c:3324 kernel/signal.c:3301 kernel/signal.c:3301)
[ 145.073333][ C1] ? __pfx___x64_sys_rt_sigprocmask (kernel/signal.c:3301)
[ 145.073337][ C1] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:232 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 145.073340][ C1] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 145.073343][ C1] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[ 145.073345][ C1] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161)
[ 145.073347][ C1] ? mt_find (lib/maple_tree.c:6950)
[ 145.073350][ C1] ? try_to_wake_up (kernel/sched/core.c:4168)
[ 145.073353][ C1] ? wake_q_add (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:749 include/linux/atomic/atomic-instrumented.h:253 include/linux/refcount.h:184 include/linux/refcount.h:241 include/linux/refcount.h:258 include/linux/sched/task.h:119 kernel/sched/core.c:1024)
[ 145.073356][ C1] ? __pfx_try_to_wake_up (kernel/sched/core.c:4168)
[ 145.073359][ C1] ? rwsem_mark_wake (kernel/locking/rwsem.c:434)
[ 145.073363][ C1] ? __pfx_rwsem_mark_wake (kernel/locking/rwsem.c:412)
[ 145.073366][ C1] ? __asan_memset (mm/kasan/shadow.c:84)
[ 145.073369][ C1] ? rseq_ip_fixup (kernel/rseq.c:257 kernel/rseq.c:291)
[ 145.073373][ C1] ? __pfx_rseq_ip_fixup (kernel/rseq.c:275)
[ 145.073376][ C1] ? __pfx_mem_cgroup_handle_over_high (mm/memcontrol.c:2092)
[ 145.073379][ C1] ? do_user_addr_fault (include/linux/mmap_lock.h:171 arch/x86/mm/fault.c:1417)
[ 145.073383][ C1] ? fpregs_restore_userregs (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:102 arch/x86/kernel/fpu/context.h:79)
[ 145.073387][ C1] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  145.073391][    C1] RIP: 0033:0x7f340071d849
[ 145.073394][ C1] Code: 31 ed e9 44 ff ff ff e8 25 e9 00 00 0f 1f 44 00 00 b8 ea ff ff ff 48 85 ff 74 2c 48 85 d2 74 27 49 89 c8 b8 b3 01 00 00 0f 05 <48> 85 c0 7c 18 74 01 c3 31 ed 48 83 e4 f0 4c 89 c7 ff d2 48 89 c7
All code
========
   0:	31 ed                	xor    %ebp,%ebp
   2:	e9 44 ff ff ff       	jmp    0xffffffffffffff4b
   7:	e8 25 e9 00 00       	call   0xe931
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  16:	48 85 ff             	test   %rdi,%rdi
  19:	74 2c                	je     0x47
  1b:	48 85 d2             	test   %rdx,%rdx
  1e:	74 27                	je     0x47
  20:	49 89 c8             	mov    %rcx,%r8
  23:	b8 b3 01 00 00       	mov    $0x1b3,%eax
  28:	0f 05                	syscall
  2a:*	48 85 c0             	test   %rax,%rax		<-- trapping instruction
  2d:	7c 18                	jl     0x47
  2f:	74 01                	je     0x32
  31:	c3                   	ret
  32:	31 ed                	xor    %ebp,%ebp
  34:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  38:	4c 89 c7             	mov    %r8,%rdi
  3b:	ff d2                	call   *%rdx
  3d:	48 89 c7             	mov    %rax,%rdi

Code starting with the faulting instruction
===========================================
   0:	48 85 c0             	test   %rax,%rax
   3:	7c 18                	jl     0x1d
   5:	74 01                	je     0x8
   7:	c3                   	ret
   8:	31 ed                	xor    %ebp,%ebp
   a:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
   e:	4c 89 c7             	mov    %r8,%rdi
  11:	ff d2                	call   *%rdx
  13:	48 89 c7             	mov    %rax,%rdi
[  145.073397][    C1] RSP: 002b:00007f33b4ff8988 EFLAGS: 00000206 ORIG_RAX: 00000000000001b3
[  145.073400][    C1] RAX: ffffffffffffffda RBX: 00007f340069cef0 RCX: 00007f340071d849
[  145.073402][    C1] RDX: 00007f340069cef0 RSI: 0000000000000058 RDI: 00007f33b4ff89d0
[  145.073404][    C1] RBP: 00007f33f20fa680 R08: 00007f33f20fa680 R09: 00007f33b4ff8ac7
[  145.073405][    C1] R10: 0000000000000008 R11: 0000000000000206 R12: fffffffffffffd80
[  145.073407][    C1] R13: 0000000000000000 R14: 00007f33b4ff89d0 R15: 00007f33f18fa000
[  145.073410][    C1]  </TASK>
[  145.073416][    C1] BUG: scheduling while atomic: xfs_repair/3374/0x7fffffff
[  145.073418][    C1] Modules linked in:
[  145.073420][ T3374]  xfs btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c snd_soc_avs snd_soc_hda_codec snd_hda_codec_hdmi snd_hda_ext_core sd_mod intel_rapl_msr intel_rapl_common snd_hda_codec_realtek snd_soc_core snd_hda_codec_generic snd_hda_scodec_component x86_pkg_temp_thermal intel_powerclamp snd_compress coretemp sg snd_hda_intel snd_intel_dspcfg kvm_intel snd_intel_sdw_acpi ipmi_devintf ipmi_msghandler i915 kvm snd_hda_codec cec crct10dif_pclmul crc32_pclmul snd_hda_core intel_gtt crc32c_intel snd_hwdep drm_buddy ghash_clmulni_intel mei_wdt wmi_bmof ttm snd_pcm rapl ahci libahci intel_cstate drm_display_helper snd_timer snd drm_kms_helper video serio_raw pcspkr intel_uncore soundcore mei_me i2c_i801 intel_pmc_core intel_pch_thermal libata ie31200_edac i2c_smbus mei intel_vsec pmt_telemetry pmt_class wmi acpi_pad binfmt_misc loop fuse drm dm_mod ip_tables
[  145.448098][    C1]
[  145.448101][    C1] CPU: 1 UID: 0 PID: 3374 Comm: xfs_repair Tainted: G S      W          6.13.0-rc1-00008-g51319c5cb6c2 #1
[  145.448106][    C1] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
[  145.448107][    C1] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[  145.448108][    C1] Call Trace:
[  145.448124][    C1]  <TASK>
[ 145.448125][ C1] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[ 145.448131][ C1] __schedule_bug (kernel/sched/core.c:5930)
[ 145.448136][ C1] schedule_debug (arch/x86/include/asm/preempt.h:33 kernel/sched/core.c:5957)
[ 145.448138][ C1] ? __do_sys_clone3 (kernel/fork.c:3135)
[ 145.448141][ C1] __schedule (arch/x86/include/asm/jump_label.h:36 include/linux/jump_label.h:207 kernel/sched/features.h:57 kernel/sched/core.c:6657)
[ 145.448144][ C1] ? __pfx___schedule (kernel/sched/core.c:6637)
[ 145.448147][ C1] ? __pfx_try_charge_memcg (mm/memcontrol.c:2186)
[ 145.448164][ C1] ? __memcg_slab_post_alloc_hook (mm/memcontrol.c:3001 (discriminator 2))
[ 145.448167][ C1] ? _raw_spin_lock_irq (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170)
[ 145.448170][ C1] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6834 kernel/sched/core.c:6848)
[ 145.448173][ C1] syscall_exit_to_user_mode (kernel/entry/common.c:102 include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218)
[ 145.448176][ C1] do_syscall_64 (arch/x86/entry/common.c:102)
[ 145.448178][ C1] ? __pfx_sigprocmask (kernel/signal.c:3219)
[ 145.448181][ C1] ? __folio_mod_stat (mm/rmap.c:1303)
[ 145.448185][ C1] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26)
[ 145.448189][ C1] ? __x64_sys_rt_sigprocmask (kernel/signal.c:3324 kernel/signal.c:3301 kernel/signal.c:3301)
[ 145.448207][ C1] ? __pfx___x64_sys_rt_sigprocmask (kernel/signal.c:3301)
[ 145.448211][ C1] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:232 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 145.448213][ C1] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 145.448215][ C1] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[ 145.448218][ C1] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161)
[ 145.448233][ C1] ? mt_find (lib/maple_tree.c:6950)
[ 145.448236][ C1] ? try_to_wake_up (kernel/sched/core.c:4168)
[ 145.448239][ C1] ? wake_q_add (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:749 include/linux/atomic/atomic-instrumented.h:253 include/linux/refcount.h:184 include/linux/refcount.h:241 include/linux/refcount.h:258 include/linux/sched/task.h:119 kernel/sched/core.c:1024)
[ 145.448242][ C1] ? __pfx_try_to_wake_up (kernel/sched/core.c:4168)
[ 145.448245][ C1] ? rwsem_mark_wake (kernel/locking/rwsem.c:434)
[ 145.448249][ C1] ? __pfx_rwsem_mark_wake (kernel/locking/rwsem.c:412)
[ 145.448252][ C1] ? __asan_memset (mm/kasan/shadow.c:84)
[ 145.448256][ C1] ? rseq_ip_fixup (kernel/rseq.c:257 kernel/rseq.c:291)
[ 145.448259][ C1] ? __pfx_rseq_ip_fixup (kernel/rseq.c:275)
[ 145.448262][ C1] ? __pfx_mem_cgroup_handle_over_high (mm/memcontrol.c:2092)
[ 145.448265][ C1] ? do_user_addr_fault (include/linux/mmap_lock.h:171 arch/x86/mm/fault.c:1417)
[ 145.448268][ C1] ? fpregs_restore_userregs (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:102 arch/x86/kernel/fpu/context.h:79)
[ 145.448273][ C1] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  145.448277][    C1] RIP: 0033:0x7f340071d849
[ 145.448280][ C1] Code: 31 ed e9 44 ff ff ff e8 25 e9 00 00 0f 1f 44 00 00 b8 ea ff ff ff 48 85 ff 74 2c 48 85 d2 74 27 49 89 c8 b8 b3 01 00 00 0f 05 <48> 85 c0 7c 18 74 01 c3 31 ed 48 83 e4 f0 4c 89 c7 ff d2 48 89 c7
All code
========
   0:	31 ed                	xor    %ebp,%ebp
   2:	e9 44 ff ff ff       	jmp    0xffffffffffffff4b
   7:	e8 25 e9 00 00       	call   0xe931
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  16:	48 85 ff             	test   %rdi,%rdi
  19:	74 2c                	je     0x47
  1b:	48 85 d2             	test   %rdx,%rdx
  1e:	74 27                	je     0x47
  20:	49 89 c8             	mov    %rcx,%r8
  23:	b8 b3 01 00 00       	mov    $0x1b3,%eax
  28:	0f 05                	syscall
  2a:*	48 85 c0             	test   %rax,%rax		<-- trapping instruction
  2d:	7c 18                	jl     0x47
  2f:	74 01                	je     0x32
  31:	c3                   	ret
  32:	31 ed                	xor    %ebp,%ebp
  34:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  38:	4c 89 c7             	mov    %r8,%rdi
  3b:	ff d2                	call   *%rdx
  3d:	48 89 c7             	mov    %rax,%rdi

Code starting with the faulting instruction
===========================================
   0:	48 85 c0             	test   %rax,%rax
   3:	7c 18                	jl     0x1d
   5:	74 01                	je     0x8
   7:	c3                   	ret
   8:	31 ed                	xor    %ebp,%ebp
   a:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
   e:	4c 89 c7             	mov    %r8,%rdi
  11:	ff d2                	call   *%rdx
  13:	48 89 c7             	mov    %rax,%rdi
[  145.448282][    C1] RSP: 002b:00007f33b4ff8988 EFLAGS: 00000206 ORIG_RAX: 00000000000001b3
[  145.448285][    C1] RAX: ffffffffffffffea RBX: 00007f340069cef0 RCX: 00007f340071d849
[  145.448287][    C1] RDX: 00007f340069cef0 RSI: 0000000000000058 RDI: 00007f33b4ff89d0
[  145.448289][    C1] RBP: 00007f33f20fa680 R08: 00007f33f20fa680 R09: 00007f33b4ff8ac7
[  145.448290][    C1] R10: 0000000000000008 R11: 0000000000000206 R12: fffffffffffffd80
[  145.448292][    C1] R13: 0000000000000000 R14: 00007f33b4ff89d0 R15: 00007f33f18fa000
[  145.448295][    C1]  </TASK>
[  156.427599][  T281] _check_xfs_filesystem: filesystem on /dev/sda4 is inconsistent (r)
[  156.427609][  T281]
[  156.439078][  T281] (see /lkp/benchmarks/xfstests/results//xfs/127.full for details)
[  156.439125][  T281]
[  156.472482][  T281] _check_dmesg: something found in dmesg (see /lkp/benchmarks/xfstests/results//xfs/127.dmesg)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241224/202412241517.b81e285e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


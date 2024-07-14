Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8D79CE
	for <oe-lkp@lists.linux.dev>; Sun, 14 Jul 2024 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720924266; cv=fail; b=NPQ1GmES6Flj00FF0OJ1UN2BpZ4QihEwcq+vdGwh087ls4avyflPDqU49y9xFP6BWpObk4KHeJx7pcqN1+b4yQCAUTBEGTCQ8tJO/zDd9FXugTzoizDUiT/4u0178a6Ja1UO34TBQpwG0E2C9dc3nG+VwD7YQGsieufJRpFzk3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720924266; c=relaxed/simple;
	bh=l/xYguTqaHwkVhvDIpHuVDAR5p6IAzv+DCULJeiaHlw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BLzSmbuzWKidPHiYV+eAs3h/X1cTgJ+tQf0jL0nOj6poJJy0rKNSZUtapY8zyZRdjViBE6Boeahg2pLqJhqQWsV136ydAkK6IH1llzSbxFCWLyC5KNpRlqktrGCuQNH+S1Xdlyu+KocsY7KZqXtOBooJUv35z2T5d+KY9BvobBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miLfenJz; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miLfenJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720924262; x=1752460262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/xYguTqaHwkVhvDIpHuVDAR5p6IAzv+DCULJeiaHlw=;
  b=miLfenJzHJK1TvE14oePXZfHzB4b6eDFUsQXhBs7yeFHzM/wg3/bMJMI
   mWQMr+CBFqjwOMTLvswB/C8szpXZSga+rKdUY9vviD+KBHib2oGK9b3Yb
   ZkAxn3JKq7+P2yLirgYcBthsrAIvxMgN62M6T7zehr2SAgNwHN/wtc1kZ
   +AVUb+128FCuqwTFY1G0jytGKx/Ubg5mWBP9DTd2Zg+RflxBjKJuieI+Z
   T13QOdd7NEK+yhJIfTFp9GDKdsrK5kSzikRqr4f2WEh9KyEzaBSs3kre9
   QRafx+fx5ULb+feMirkb2nFvGj3yczcKoJUOxW9JL1I/6etnC1Zz+QIP/
   w==;
X-CSE-ConnectionGUID: cqVDM+/bTReel7lyGtgAIA==
X-CSE-MsgGUID: nf5a5lmFQ5GUpETeOtOyuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="22199906"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="22199906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 19:31:02 -0700
X-CSE-ConnectionGUID: 6MqbKvqGSvGlCJHHqOq8EQ==
X-CSE-MsgGUID: ba75faeXSvm8staN75q6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49155326"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jul 2024 19:31:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 19:31:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 19:31:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 13 Jul 2024 19:31:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZC2CQ6HQbTiQ+MVFFK59Nb/qGvlUSSojFGkuR9pi7YQycuH7zNL47VUq/jcErOu9wpGs/lCLD7ll2AY1m//QVRecPgHD3S1pFpnTfvfQPO8j9DbME6Qvjf+EQQ4s/auBS1N7pAbKxxnTo13NwQB7+OG9gh5cpiH8jo/cWRYuUrHA62vpHPU8bXT9nk/vwdD9TA51gA4mhizauSQPGkDFF42iR8gP20tt8V3EEL/L18Ocv/vmRATjCLtYe8CWH4sNQl16ShcYACBFUlgs4YuGI/9TsRFap2k0UOFEyUKMTIn19vOOrZWfmLC4HfNnazrAQl0bZKJprOksA+DF2PRA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yejEyB7bSVxNfBy6P21G3KFUnbQTnLXESv3+7I34rOI=;
 b=Pgle1wm+6wArkHhlaxV8yZQi80HsZ2pikO9CYmC25riZGbKFjmW++NrzDzvbTzF2nnWDj/OBXG365OKxHbgy2li4VkxS9DKDDBCVU2tg+84fdWDfVnBhj5Lu1yJl9wyE/Jukild9AUZ+evEwRBDFvHABzOcs4BHJdMaywfqKrhjOC6Hmd/P8khdjLx8F2mdfOp2vTC8t4pEMYbNK7nZvLCUeEf+uo8O/RceBnP9dsYX8cF9BZJCHo4YgpBa/LFLXy7V/BiicOjvYAR+whGDTPWu0So174MEzaQjQElStyCDOA8/rtwnn3u3uAscvEM/8ByHM+mM3aoPtIx6+OjB+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sun, 14 Jul
 2024 02:30:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.020; Sun, 14 Jul 2024
 02:30:58 +0000
Date: Sun, 14 Jul 2024 10:30:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Pei Li <peili.dev@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan
	<skhan@linuxfoundation.org>, David Hildenbrand <david@redhat.com>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  a132520496:
 WARNING:possible_recursive_locking_detected
Message-ID: <202407141006.2957b01a-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b181a12-4807-4f32-69d2-08dca3acfe55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aass/raNUeG3N/9si0/2+RmYSGbKNYXR5YCQejpt8/Wi4Kf0lE3HTdliLy8k?=
 =?us-ascii?Q?0lZw/bGUio0f6uX0SRPz+ZXsted3NfuYzvHgYNZsrR5b1eo5BxB7eT2GHc4h?=
 =?us-ascii?Q?RJ3D+4wxrGQYHprAFKG8OhRRO7vxTRhQLIVBY2A9f145VGieHS1PSjq0sWMn?=
 =?us-ascii?Q?g30BIyJMS4f4likyars+npisUhk2K9IET6TUnS703z2olWLVVFEORN7AWOGr?=
 =?us-ascii?Q?VvXCRvaTfMmXO9NVWGnvwvqHSQCh7R7+/mscFDJBqhKk8e5zYvetGjP95Vsl?=
 =?us-ascii?Q?9NhHAmddbId0SQcqS2mcXyx0wApPINN45i7qnH5sYO13v4BvFhh6R6NsxjsJ?=
 =?us-ascii?Q?efi4yEacKVQ9SWzzGKVQXUTIZ/wXhu2kVPs+y+Z6XvrVLX8tj1+q5hQpq9i5?=
 =?us-ascii?Q?Q94mpTo8zJFhL8Rw5FCcc7HeTQhVuMpsAFROiRN5AwUW9v/6JkhfNoUKdxdY?=
 =?us-ascii?Q?11HeEfW1dy16SfbzIm1RlqMKCj47G4oxYhmAuQmiVo21N7v2l69h33KsAIsT?=
 =?us-ascii?Q?4SS/FA72ljQotbeOBxa6bsDbk4QL3Zgj+6Wri/lYCACgwfVSzIkt3fARoyMz?=
 =?us-ascii?Q?5utqtH8fKJE2NjJxHw16ASRd7HrR0tpsWcYxKPlfLwnOXaOjm1B3Awg6FAZH?=
 =?us-ascii?Q?Mbi7rg/S8qCTBis63xo1e6SFNypOEqDUvcYE7sFWjIvxGJenStayA8mscWCz?=
 =?us-ascii?Q?jZ5/OQWY/DmoOA75MPEG+VdwOqLnJuYxeAHK4lq2sAO2AsGERRKIHruWQncZ?=
 =?us-ascii?Q?T8K7BSpxXR6sAUIhzTjadTR/saMtVY6rZRRKeqiYv+TA3Z4pLMVuJnn0k7ru?=
 =?us-ascii?Q?FivIjOX536M/kA2MOoSHdDQuBeNd94O+jph+mNxq0YXtUiMAcwJaVb+yrGPG?=
 =?us-ascii?Q?IFqaWaAOGFSAFINtLohpgfyGS7t6JlmQbgyk2o7+jWdw6P+K5qG9YbhKSkCf?=
 =?us-ascii?Q?krJKE3syIa9VZDNbHpYaOJaeaeraN4XCAaJJAPNbA6XoT4/gs86x4E/Y/0O0?=
 =?us-ascii?Q?lTZH6G9zq5wt5/NW37Hg08cJT/kKLAwnTQHH+IWPETYSqT5r35jo+kQrhaaK?=
 =?us-ascii?Q?+vnkQnTw4s4pvuy9S7xIZXRrxpBiCMZWTbgGiaLZoyWFI0otp40IruaKChoA?=
 =?us-ascii?Q?KpBr6WYZiLVydYhRvM3XbzmbNrpinJnCcHrABdhofbAQzuBijh1Y2kC7Od2f?=
 =?us-ascii?Q?VIuforONtD6FYTChya8VfvO4GVK63L4GYRc7SZmz8JIz4C7DUnW0A4Oqmio1?=
 =?us-ascii?Q?6Pqc5gebfUIatHdJWJtAni5M7nNI3CJSUa1KI7CDGF2S0Di+BawdJR6X2jeR?=
 =?us-ascii?Q?Mn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ai/4OSl4rRzVqO1XK97CXZ+7coUR9ynOn1KSfVW3ToNEc0IMHOXJAa6a8YoL?=
 =?us-ascii?Q?ZBb6ihuaGkgPmNVEOLOZ9GRexGfCQ1xQ9oseILWjJ8Rd/hr/Ul7jGxbBLApd?=
 =?us-ascii?Q?XzrFjj4pujM2LXMv8cbQUX2Tx0Fm0Lrct1Y1DL1y0f3cNiL5ZwEm+fhy8ODx?=
 =?us-ascii?Q?+9Y3FwejwSg1Xamq9Fk3AJPb+p/jR4mFSSP+9CkSUO8xaTJGq3d2fQs/OysF?=
 =?us-ascii?Q?sHgZHDYtzMi+N94UQZcT/0toQowDpHCpCIKq5odbtcATi9Ql0n3Z3wcfWmjF?=
 =?us-ascii?Q?r1CwLP2R1K/u46TTcxUqQiGWEvcxXhuDEUTwtKSYSyKXe4pxS37BQUNqrLV0?=
 =?us-ascii?Q?yJxDLqjg2ivQ4fOAEBsGwusstHjm/pP8RvUQ2e0l5TsMGY5iL9yImKQyc6C7?=
 =?us-ascii?Q?k2ZuEbtBCxFu5E+3PkQlqEO6bxQ3w+fUc0Zgz2g9VD5i8k4XKlWhaOn1AzVW?=
 =?us-ascii?Q?/qwkSlB25/a9P1mM0NjRo3JIxficHF5WuDAzwixN9ULty01BtVR4X7DGPVFA?=
 =?us-ascii?Q?QGnM7JhrYS6gqqFIZ/LXRkcK3pMtIAMENfcqYN/TY5vzj8UZPICGY9mhvEkP?=
 =?us-ascii?Q?n02hnX8/blpal/j3MOnPMbJp0dmuIOLXr4bJILQvGzoFD59YBU1JqJYW6waE?=
 =?us-ascii?Q?BSQM0xiuuO1wmOSI8GxRFQy0zzmAm3U1ykIheoIcY8DUdHnaYScObMsMmste?=
 =?us-ascii?Q?rc24RbCQf7xY5XZcB8M7YQYGGg1pwY7AWHLEHAGsFEZbBx+5oarZOpVQJfi7?=
 =?us-ascii?Q?vm/qlVl/WtJQu8yFSRnUfzE+GOTmNHAaWWoWPvCT5oLXUTwLWq6KzH7z6SBq?=
 =?us-ascii?Q?WK5w8ZvyNdYhHSGHibqHTnyaHVVGY1BpqzizSW/YpKPDqN5nF6///huE3OyJ?=
 =?us-ascii?Q?c3o3xMr+EHcYFvOb4tCZTW7uLAkmDklu4JufVROWnhZHHSqIr4I/7SPn9Qyh?=
 =?us-ascii?Q?EhwSuL+gY8aZzNj+mrX6HjE/QhjR7oFyLv9Sz6LqN4FwUUQKSCfWlbb9OG7t?=
 =?us-ascii?Q?Whi9ExolbY7wTwYqRcX7aDonkeWdlk8bbQ6JNtwwesVALdVqw5E0fauIs1ld?=
 =?us-ascii?Q?/uPA8JjdK+oVyJBSC0SWvOWrYj/ErZZREznHzRSO0gipVqziRevvTtJbLOjL?=
 =?us-ascii?Q?HM0fmNh3O3msZkm9YXwbLTusEu0EGFuIYVTOKgJs8WTxnEs7ZSOpd5aZAnGJ?=
 =?us-ascii?Q?/ba4sBU+hCoebwCB7V2TIBJ9vYi994cHRgHcxwfDS/XF31Y5nyGqu9GY1L1y?=
 =?us-ascii?Q?Uy8QsDGuRXy9qhzwXpIJb8e3g+wwOMSSXegSo2bjO99CZUpPUaovBF5rZufM?=
 =?us-ascii?Q?T2Ha8I1wI0riCTx5EXaamfbuXtXPxMW1JwusFCGqkCdHrxsazW2+wZwHlegK?=
 =?us-ascii?Q?r6fDcIIZjecoeJ78BFhrEyjOFuiyTT0KBmMAZa3yTCk0I4mXETx47TumMQvS?=
 =?us-ascii?Q?ysTQ2+h1HZHbNoRDQjbxTdHoSJHtRBv9MVegYig6m9HnaFE4422X30JYMW7X?=
 =?us-ascii?Q?7hLBGtETI6HP3UTiukahmdHHqITB9cLT9i+A6zSu/+zNA5IT4Q0Gh6EGs0X4?=
 =?us-ascii?Q?mjXioFF3I+YgwITcvxt1A7jNpFYFIUDht0EMbwgOHnvCjefaDBKRSarLwb8m?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b181a12-4807-4f32-69d2-08dca3acfe55
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 02:30:57.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFR1jEmrjq7GrEkobethANPshpw98pv4erlYU8jRK7R62QzcyRyJCGrbmySBrR1hxFalzdJ627KrnkF7DMlNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: a13252049629a8225f38a9be7d8d4fc4ff5350e8 ("mm: fix mmap_assert_locked() in follow_pte()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 3fe121b622825ff8cc995a1e6b026181c48188db]

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407141006.2957b01a-lkp@intel.com


[    5.151914][   T98] WARNING: possible recursive locking detected
[    5.152929][   T98] 6.10.0-rc6-00035-ga13252049629 #1 Tainted: G                T
[    5.154009][   T98] --------------------------------------------
[    5.154939][   T98] init/98 is trying to acquire lock:
[ 5.155818][ T98] c1012e30 (&mm->mmap_lock){++++}-{3:3}, at: mmap_read_lock (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145) 
[    5.156939][   T98]
[    5.156939][   T98] but task is already holding lock:
[ 5.158380][ T98] c1012e30 (&mm->mmap_lock){++++}-{3:3}, at: exit_mmap (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145 mm/mmap.c:3325) 
[    5.159430][   T98]
[    5.159430][   T98] other info that might help us debug this:
[    5.160863][   T98]  Possible unsafe locking scenario:
[    5.160863][   T98]
[    5.162163][   T98]        CPU0
[    5.162778][   T98]        ----
[    5.163406][   T98]   lock(&mm->mmap_lock);
[    5.164080][   T98]   lock(&mm->mmap_lock);
[    5.164854][   T98]
[    5.164854][   T98]  *** DEADLOCK ***
[    5.164854][   T98]
[    5.166540][   T98]  May be due to missing lock nesting notation
[    5.166540][   T98]
[    5.167828][   T98] 3 locks held by init/98:
[ 5.168575][ T98] #0: c31a9a80 (&sig->cred_guard_mutex){+.+.}-{3:3}, at: bprm_execve (fs/exec.c:?) 
[ 5.169659][ T98] #1: c31a9b4c (&sig->exec_update_lock){+.+.}-{3:3}, at: exec_mmap (fs/exec.c:1018) 
[ 5.170919][ T98] #2: c1012e30 (&mm->mmap_lock){++++}-{3:3}, at: exit_mmap (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145 mm/mmap.c:3325) 
[    5.172091][   T98]
[    5.172091][   T98] stack backtrace:
[    5.173262][   T98] CPU: 0 PID: 98 Comm: init Tainted: G                T  6.10.0-rc6-00035-ga13252049629 #1
[    5.174372][   T98] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    5.175533][   T98] Call Trace:
[ 5.176159][ T98] dump_stack_lvl (lib/dump_stack.c:? lib/dump_stack.c:114) 
[ 5.176864][ T98] dump_stack (lib/dump_stack.c:123) 
[ 5.177524][ T98] print_deadlock_bug (kernel/locking/lockdep.c:?) 
[ 5.178258][ T98] __lock_acquire (kernel/locking/lockdep.c:3062) 
[ 5.178967][ T98] ? lock_acquire (kernel/locking/lockdep.c:5754) 
[ 5.179663][ T98] ? __pte_offset_map_lock (include/linux/pgtable.h:324 include/linux/pgtable.h:588 mm/pgtable-generic.c:376) 
[ 5.180432][ T98] lock_acquire (kernel/locking/lockdep.c:5754) 
[ 5.181123][ T98] ? mmap_read_lock (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145) 
[ 5.181839][ T98] down_read (kernel/locking/rwsem.c:1526) 
[ 5.182525][ T98] ? mmap_read_lock (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145) 
[ 5.183238][ T98] mmap_read_lock (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145) 
[ 5.183942][ T98] unmap_single_vma (mm/memory.c:1822) 
[ 5.184678][ T98] unmap_vmas (mm/memory.c:1892) 
[ 5.185343][ T98] exit_mmap (mm/mmap.c:3341) 
[ 5.186009][ T98] __mmput (kernel/fork.c:1413 kernel/fork.c:1348) 
[ 5.186658][ T98] mmput (kernel/fork.c:1369) 
[ 5.187291][ T98] exec_mmap (fs/exec.c:?) 
[ 5.187964][ T98] begin_new_exec (fs/exec.c:1330) 
[ 5.188669][ T98] load_elf_binary (fs/binfmt_elf.c:997) 
[ 5.189344][ T98] bprm_execve (fs/exec.c:1797 fs/exec.c:1839 fs/exec.c:1891) 
[ 5.189995][ T98] do_execveat_common (fs/exec.c:?) 
[ 5.190691][ T98] __ia32_sys_execve (fs/exec.c:2143) 
[ 5.191396][ T98] ia32_sys_call (arch/x86/entry/syscall_32.c:42) 
[ 5.192085][ T98] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 5.192780][ T98] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 5.193463][ T98] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    5.194144][   T98] EIP: 0xb7e67864
[ 5.194757][ T98] Code: Unable to access opcode bytes at 0xb7e6783a.

Code starting with the faulting instruction
===========================================
[    5.195610][   T98] EAX: ffffffda EBX: bfb3a2d4 ECX: bfb3a10c EDX: 0044a360
[    5.196520][   T98] ESI: bfb3a10c EDI: bfb3a2d4 EBP: bfb3a0a8 ESP: bfb3a048
[    5.197518][   T98] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000286
[    5.198575][    C0] vkms_vblank_simulate: vblank timer overrun



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240714/202407141006.2957b01a-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


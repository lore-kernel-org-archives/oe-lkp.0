Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F163890E8
	for <oe-lkp@lists.linux.dev>; Tue, 21 Apr 2026 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757543; cv=fail; b=DZP767vWfH3YOQ+LdZIz6Mug3eeGpBT4uyZCuS/fPSOA9UfECYg1olzRnM3SJwYHRky3FwXJNZTXn1bgRVI72oW/RhRgZNRxnZ7gWUDhp40V4Ya5FsJ5BJm3CIxMmSENPz5SCaElLvrZKjWe0/uPpszk4q6F9ycoUmDIkQeatV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757543; c=relaxed/simple;
	bh=HJr0ZvhqOv5DhCed3y9fivTez/L09DeIw5CoUoMpifw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dcyR6c7rMtpf4BRE+5xKsat6BXkfEvEr11hKVcWjUVdwdKxIdqcfN++RcgNj3rWSXic6JmZuhTcGTIj2wX5ASJPm4iHv8dASc+uk70ifA1mt57Z31yNFFAOaLro9j+ngZnHg1b6MXo1qgVn7Z6H7Xklv6zbbK9CPplkiaVHmN/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyL9NYCq; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyL9NYCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776757542; x=1808293542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJr0ZvhqOv5DhCed3y9fivTez/L09DeIw5CoUoMpifw=;
  b=WyL9NYCqfh2YNCapQbFtfO37xsEYLNlsnZQPMxkc1qLdBPchmIr9zCFw
   fY9Mn9dQ7bm1sy5A0u+YTigcJKbaQPuJYr1RsBQZTUGWtE2+4EvnxV2av
   AQ38T7owYKPmFyxSmiLpuFWCS3YG3pP7owjE3+NXmerPiPQWeAPAe8sfK
   beJD2F8hGkMkD7Cwk5ziEYnVAVmDaA0dYqkiLILugd6zIL9WI/Vf7ia0+
   iDjbPh5Q7PkN4maZk919PcAZDd4eSP1QqmvenwFgLfwG7kXttlytmf9s/
   LV35MZtRuk6zdM7fJSi7UKssP+pvyuVU+gy8zNRUx+Wmh6Y2nCtXgKipQ
   g==;
X-CSE-ConnectionGUID: CtvNMMTVRZ2ZXf2u9/MsSA==
X-CSE-MsgGUID: Lqa28JepT8qwcCt/2hUlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88760961"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88760961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 00:45:41 -0700
X-CSE-ConnectionGUID: 7j1uyTwQSSSf4WrHerW7/Q==
X-CSE-MsgGUID: 8OAB5inlTsWkkipm7S78og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="227329472"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 00:45:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 00:45:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 00:45:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 00:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmHAA1ruOV6WqrMkmmoTkX/WLS9i2QyiSQBwHO/rnhPJTMfPaR8RovVLfW7SDNVu/0Vm2+xHgPmRA9v4Ra82JIynVw+jL9Q0knxvkzmDBiFxlBwZq4Lrpu1aDdyAsIgtxQki9cpH2oUPnbSrfARHyM5uj5vze7uPyov4lHJ7xsI35eR3NcEcxLGz61yQhmu8NvSI4uN4Fm3fiv1s4WvVjn2PzSwlMHXHCUzv55ZlkQFanpUr05qt97vCjmjcVZ6BxZOgfNPW805Qy6Y+GkTi4pvNDpQwezHJJrDnOodpmF4KkVtnxuN+wVjjX9JvE6+/zySZjltDpXsBhyT/t0zHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0lNgLj3RqZOddYdbsTfJVmEdt+8c44P2K3OsTSWSbY=;
 b=TbC4x2H7OE863V4Vqa5ltJ9UzBF1P7+gAfzxOxuQ9h+wYyRmnzewjME4t28BVrqfYN02+C1PDz7D60GPERaaLgwOxPRmEP1YOJqDBj2WgewjD1t+L37247yh0efjZraAvmXroaJHxrGNMy7IFehaD4fqBGogO2ePt1gHYNw2A6yM8p+a747GWAXN9DNWGdpyuTrwkWXkkrlKYr1KTD/At3T12gOlDkTCg5hwB2HV/QIxlANVQHhl9ht98M6YpI1grYN05R5yn+2ktbzKgG3K12mKqZHW2fjm9S9Wuk9bqSMLsCt2oJ/WUqVx0S/yjdsTSA/JcjCDePx8zeAcucB8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 07:45:35 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9846.011; Tue, 21 Apr 2026
 07:45:35 +0000
Date: Tue, 21 Apr 2026 15:45:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Uladzislau Rezki <urezki@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>, Alexander Potapenko <glider@google.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>, "Michal
 Hocko" <mhocko@kernel.org>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <202604211323.fac1b29e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: b3656343-9d35-4ba5-67a8-08de9f79f952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: UbJo/9FeDydo1dGAdDAjjebyn3Zmyjr742F5hvjiN/YXbRv9kq/vEzCEsI0Xt6ksjmlA7JTbBMdn/UNpD/KIVvP97SoL/8pabKvedUvfIsQ7XN5qHuSOCHM6AaNpTUoXpIp99wLoY1XYDf0Ts+A4d8S5uHKF8fPVf+CU6ZcujYLDYBAUpUrvGvh/hB2rG8XBjtn5RnocUvGNiIYRf2DdJwa9MEN4XnQyMbheI+puiRAkmtTVU6cn51swXRcPO3rRixQTAT7ETM3/f3pI0krVW6Z7f4DUU7NrZUpkbou5vWJV46LJ9p6HzFpAJdrXjoM+VVUIM/Zx2vH6gTycclUxZVs0bdqcuIj4aujuLXDMX5Vsv6CayscmGoocGoSCuopRJBTaQOWvHpc/I7dmP0/cQdy1Q+XZHMkX4pKKK7lLCNaaSgi8vta69SddKJPjPoeuoM+ecXSudowgq8CSEM+y2IyJXjWLQi4xHZSigDfhemzn5d+O0svv7ctUFSfY441sUhTNztMQlKEUKiglpqvWYl78z//FwuEaiIV60YSR3waZyUbYoHEKdHE6I3746omlLaRgn6SJFi9n9nzXrzAShmRbU4CylycBOd1B1OHAdaT16Tu8NHtHbWGjsphcbOgB/v9281JXCDZTgyVzuBYjBi1OAliRwsLmG7sF4wUqj01eVMsg+jwwzQWOTqOvDbQz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MM2m2IYQYA/RnZ32O19Cu4VEnXmWb78k5kEHFR1Co8UFg6uXoAEvzegeC6HZ?=
 =?us-ascii?Q?5qGXvQZEC93AQ+tjKdWmQg7AO/e7Gsnh/4ixGEZTpFasu9wRnNrXI0Gi+Gzs?=
 =?us-ascii?Q?NHCfDmhDjZE14GKq7T3g5W/8nsWui+oKDUMcvikbaEIvOWn1XfHn8ma/5rfF?=
 =?us-ascii?Q?Pv78PLpggI7RqtuYghJQrWItNAswFqH03JDU6lvu3kLTrypO6PvBLljw6m21?=
 =?us-ascii?Q?TVBxHmQ3taz54mbVqpqxk9KQtuIs7rj45BliWPG3CEJr7PwuXQLxoKU8aqwe?=
 =?us-ascii?Q?NlYRbIW08w5gWRvRnNGfJu8q590OS1XUKMOzncJse71wJllahlM950ABj1iZ?=
 =?us-ascii?Q?paXMqVXrNfPdsLlkLarBth9Q84CigoYbb83uetrGVzg6TBV+hCAcJ8ufTlFK?=
 =?us-ascii?Q?R5zDl6mAtoyN9f3nSKyj9NX0zF+5HddCIZ0pv6Sj0R3HnTS4UU5NgMkLiNcC?=
 =?us-ascii?Q?zil9eBL6gR7ISjzJMFgq76Tu5rgPxZ3W7o68U7qx+MCGF/Px3TaWTYmLVvsr?=
 =?us-ascii?Q?Kb2t53cFrjo0RzeiRav4JoXe87jSwDsJa+3182U5I+mapJcFZRvDHwvgwBK9?=
 =?us-ascii?Q?NYVAIsFVgPOD8zFpc/dJpHRzbzEVpAgJT2bndEnW0IImbnUYRCnr29KKFphl?=
 =?us-ascii?Q?p4stbaTldi0HLRctgqVltxr3jFbtIVuoQP17y1ZBKMmDdIKpGE/bYTVKzdpy?=
 =?us-ascii?Q?X65APRgOSwZtoYbxKOmJhag4rQ/SdEwZ/VXJo7T2qZN0T2ATPXpTkb5OB0f5?=
 =?us-ascii?Q?YrQOQEa22mUQsf3puBKtNuCVxFM8FXKMrMP0XDuscZdoDkPReb+UpDvFzCGU?=
 =?us-ascii?Q?6fowk+0w9s+x8pDkeP7uDYCScXG7Ax6vPlCsfZC16oXmBoIf5uRYiE2YRyHn?=
 =?us-ascii?Q?kY1FDrdMznojBKO08+q1eJewqQDSmZXWgt8B7lz4lu05CeJfKO0jpOhUBFud?=
 =?us-ascii?Q?8mFmbnmyaDdVUswuBSVTCV+k/RsAxp0qEbe+wEVvBH2lQOJHfhHP65eiaSmt?=
 =?us-ascii?Q?rzNSIA34TTvv819WiEvZAjYK6SobDSOmXDqZIqkeUHY0NLyhJ2D41LKr92Hr?=
 =?us-ascii?Q?JM8vKWrdMhWVnXTSbvuOvFTZgYR41l2VYKnkf6szVZ8KQS7Yi5KlgbsFvAHc?=
 =?us-ascii?Q?vgvyu3iZ2+B1I0BTg8sMEUDNx95wzBIarQwafoglaGEgEREeZiVVI95qhmUo?=
 =?us-ascii?Q?4nIvbKYfJB+j2UtSoBf/sYCfPCsxR9jZPuSyrnobHQ02T2OvpbF1VNniTFww?=
 =?us-ascii?Q?GWnTNSw9nqODlPKMse+yRUp0rKHiUb1JSo2O9GYhOuJelVkwf5riNZzsSTet?=
 =?us-ascii?Q?Tx+wPouLZY18g1mQFR00UJLX2x5fe1meT8hdBjTQhYV3PbsY0Qp6Nx2F623x?=
 =?us-ascii?Q?tlSrfQwZ0c3JH1ewBohwvHHrJ9GqwBNTkmo11mVN1wKdA0A7C1XFdgotbTWD?=
 =?us-ascii?Q?6py9fipZUTOwF8jCz2hNo8VXIy5MRZMDuD5r34AJbf3fiB9f7r14HFoiFKXp?=
 =?us-ascii?Q?LmSDsADHh/DOObs25mLNgczfMy8FFG91S2V2CIwR270yKK0pIIbp6XGMxbuZ?=
 =?us-ascii?Q?kOijfSynCHiBJ0f7rDn1zdRNLrye4E5vFVCsA75pXba0mg9qSEUu3qTxT9Kt?=
 =?us-ascii?Q?13v0yi/urBb0IDV8Kgn0h38VGV49yEp7wXlpsq1+azNDw2DuYmjN0As5Q5NB?=
 =?us-ascii?Q?x3zCMnLi26pnY9TV89BF2j1X1s3jdfTZckzkNo9n0HbhYz52E2C3HaRtqhQg?=
 =?us-ascii?Q?AugszIthSQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: IqidjEGkPaYHML6SBHpNOQTSHdzqblmlvqmeoDKPpR+1wLMU3WRch/4yGHoQa/rhtwmdsR8e08SOVDNzl/EmjOmZOT7QFoZigI9H4XCKmO0gxWW1olIis/PJWYoFzhf3jZrHiN8Y+7RuQ3aK3XygtBpbfZqlMEsZYIyYGEuebh07poCZ7EhCdwGEXzU+0woW+qX9ivVupemYAzRT8L0RwyboYomeu0f8w6NoyaHdP4F13FeDI05Fm0LvUovyT4D2LuH/OlGRwG5/yE8o3qCiRgsqWCzjj2XWdhjjKvVlYZAVNa2Gzv7Z6hIpOXZohLHT67zI/QtRcqPv5G43hELu5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3656343-9d35-4ba5-67a8-08de9f79f952
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:45:35.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1vocQfqCXpGWj/An+tEGpBSTe8GIwO7L3xVVzKI6sGcDILsPjWvTXAQ7QFVh7Rdn+fYgUsb5+6QI3OYrFHspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c" on:

commit: c6307674ed82c0c57d6e1e3408e84ac449ab8e94 ("mm: kvmalloc: add non-blocking support for vmalloc")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      40286d6379aacfcc053253ef78dc78b09addffda]
[test failed on linux-next/master 936c21068d7ade00325e40d82bfd2f3f29d9f659]

in testcase: kunit
version: 
with following parameters:

	group: group-01



config: x86_64-rhel-9.4-kunit
compiler: gcc-14
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604211323.fac1b29e-lkp@intel.com



[  149.217862][ T4054] BUG: sleeping function called from invalid context at mm/vmalloc.c:3435
[  149.226291][ T4054] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 4054, name: rhashtable_thra
[  149.235634][ T4054] preempt_count: 0, expected: 0
[  149.240353][ T4054] RCU nest depth: 1, expected: 0
[  149.245166][ T4054] CPU: 1 UID: 0 PID: 4054 Comm: rhashtable_thra Tainted: G S  B            N  6.18.0-rc5-00047-gc6307674ed82 #1 PREEMPT(voluntary)
[  149.245176][ T4054] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [N]=TEST
[  149.245178][ T4054] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[  149.245181][ T4054] Call Trace:
[  149.245185][ T4054]  <TASK>
[  149.245189][ T4054]  dump_stack_lvl (lib/dump_stack.c:122)
[  149.245200][ T4054]  __might_resched.cold (kernel/sched/core.c:8928)
[  149.245209][ T4054]  vfree (include/linux/kernel.h:61 mm/vmalloc.c:3435)
[  149.245215][ T4054]  rhashtable_try_insert (lib/rhashtable.c:476 lib/rhashtable.c:635)
[  149.245223][ T4054]  ? sysvec_apic_timer_interrupt (arch/x86/include/asm/hardirq.h:78 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discriminator 2))
[  149.245229][ T4054]  ? sysvec_apic_timer_interrupt (arch/x86/include/asm/hardirq.h:78 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discriminator 2))
[  149.245235][ T4054]  ? __pfx_rhashtable_try_insert (lib/rhashtable.c:592)
[  149.245242][ T4054]  rhashtable_insert_slow (lib/rhashtable.c:648)
[  149.245247][ T4054] insert_retry+0x257/0x630 test_rhashtable
[  149.245260][ T4054] threadfunc (lib/test_rhashtable.c:633) test_rhashtable
[  149.245269][ T4054]  ? try_to_wake_up (kernel/sched/core.c:4297)
[  149.245275][ T4054]  ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:111 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4))
[  149.245281][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
[  149.245289][ T4054]  ? __pfx_autoremove_wake_function (kernel/sched/wait.c:402)
[  149.245295][ T4054]  ? __kthread_parkme (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) kernel/kthread.c:290 (discriminator 1))
[  149.245301][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
[  149.245309][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
[  149.245317][ T4054]  kthread (kernel/kthread.c:463)
[  149.245322][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
[  149.245326][ T4054]  ? __pfx__raw_spin_lock_irq (kernel/locking/spinlock.c:169)
[  149.245331][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
[  149.245335][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
[  149.245339][ T4054]  ret_from_fork (arch/x86/kernel/process.c:164)
[  149.245344][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
[  149.245348][ T4054]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[  149.245356][ T4054]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260421/202604211323.fac1b29e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


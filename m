Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC822F755
	for <oe-lkp@lists.linux.dev>; Sun, 21 Dec 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309896; cv=fail; b=E34OGmYB4zxMBVrxJbcDct1lWVpX1LEvsr4quorjlO+TOgSRv9SVFWOqWSC7P+IZ238bfyDrhIy9NZWkZ5gzXI5kDOvENDsmYuhx2WkKcjFRwM53pDxu4OkLiVkydW4kdzZ2D7JrBT01oM1QpLfXmrHDvXh0eq7rYtYd5sxHWA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309896; c=relaxed/simple;
	bh=Q/TWO72DMMyvKoMb570b4zDx2l1mUmrhIIGIpB5uIX8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pRhsR/QPc8sUuxiwQnP+eUil9Py+riGZ3TcUxsNcU4f7Si5eSUTzwiL8gohAX0n4gQoWIeeufIdsY6gvN+s/BD1MvNWUntunECpMzXjHp9B9kwX3yfCzx9ks8+sIwWyEmUoCYwQ+j0sWROHRN3pM/hvzqAZgQqlnKwIZXexFqCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsh+qIue; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsh+qIue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766309894; x=1797845894;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q/TWO72DMMyvKoMb570b4zDx2l1mUmrhIIGIpB5uIX8=;
  b=hsh+qIueYrkdoYbTArnhGsXKfrgAOHVDi6TsuMUkW1mxwV8DNPOYgLWV
   Kdr6ZN0RejPGGaoRhn3EN3k40PEDP9rLE3J+5e8dvkgso10w2KMzyzLvN
   3DNVWEtWbQMDGE+L0iN2rNUEzEGVGO+0bt+aCPNn1DuxuyM1VLZBkLWg0
   r/sAHSVBk7BoqVMHBBAne3u6/ixQjTxdx9eue0aezTtRSS80VaRijcDse
   m9PzsfRlHyGxhVJj1hLRdvmlvJ6FakjRM1Crmu/HGll9clYbtccvdg76m
   uAdlUZQI9wRwtRIsWLDOhysMjLDNNgVkQfnsPSf9RN61fHOTs/kx+r3BV
   g==;
X-CSE-ConnectionGUID: NI7L3cpoRz2n9rNRaFMTbw==
X-CSE-MsgGUID: Loa6hFULR6mWqX/EanXg2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68180728"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68180728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 01:38:13 -0800
X-CSE-ConnectionGUID: OEsSEyfORjSdS6GtFJa2uA==
X-CSE-MsgGUID: J2eTgpQlQyCAJfr+0OVOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199022714"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 01:38:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 01:38:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 01:38:11 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 01:38:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9C40RpMrJQXYRpiO/7G5vwu3eqh8Uzfx+g4Ra0a2BX7Tef3E8aNUslcdGQiKDLEJAqnIQMiAiS3e9WMAt3I3rtYR7rAUgxQAWFh0teuWCrOwO+Njotb+q1wG89O3aeiaebVKHzu6aFrztKOp4ScztHrOIenIRYJ8ppOPMViywkVyvQjzZ61Td1iHAVuJlQHwFU8mwxTgCUfUmeZEfbJUW+NujGASOUDLIgaH08b/zir2rHAIh4u+fBl00tG2jWeHIz3jFNaj+f927aqgLIjA2TBzzD1S47h0mUxAzItV0r17TgkyIzwoKMt2z3VioNFJo1W0FI5su+mMlnNIL6d2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PDZfHmNWLgX/NyBjM2MOOm+ITw4dhVXyqPGhYSPAOQ=;
 b=wPwE3ZsACJCpqFhqKEjZagifBLotzPg0lPZzMZ9EWn/Bsdk3Jvi7ZnIlN5roZ114cFsvYeVmmL/uj5BWRJHanMqyCwKmXaklqgQ4j0sShkchhs1k0V/2lL8n/o2EMDGTsRfPRpl2m1R6X8KaNx8Vfjb9K8OWjpvRN0HPGilpP8F+X53+ULP19UCgxxA7XhVqJi/1uJaST8aIN2/6ScDeYKMB/fYwqZnJ0/Dx7Uhpehjc6WlEFBqUxbyj6GJBPADZqKmdw3NIyatY6jDaApcrbgEO8tOhQuMQFDKDhiFv6ZWNryoDMZQgA7LrDzKPoduzhq4wUB93B+M5YpMuaIiRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7487.namprd11.prod.outlook.com (2603:10b6:806:317::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 09:38:08 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 09:38:08 +0000
Date: Sun, 21 Dec 2025 17:37:57 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>, "Ingo
 Molnar" <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Juri Lelli
	<juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: Re: [tip:sched/core] [sched/fair] 089d84203a:
 pts.schbench.32.usec,_99.9th_latency_percentile 52.4% regression
Message-ID: <aUe/9VB7K1UeyT2/@xsang-OptiPlex-9020>
References: <202512181208.753b9f6e-lkp@intel.com>
 <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
 <6f0954ba-2ca7-41e8-b4f7-b0b17990f659@linux.ibm.com>
 <20251218102020.GO3707891@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218102020.GO3707891@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: cea41740-7ee0-4e7d-56ed-08de4074a63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Hmjbcse1DuwQ0NX+LA+QroNZEfdrecmTcyBCa/1s6IeT4ge2rpfFi5BhRS?=
 =?iso-8859-1?Q?fmeqEOYSIBChdd+5fGl1tKeBQJ6Hq8HjB4h3OS38kmCjLw6t8WNWcxD7c1?=
 =?iso-8859-1?Q?nX/TZkufaB5JNqt+Eczl4pRK3Pg2MWhWrIEjWtN4t3qNMgmBHoRBZ5S+N+?=
 =?iso-8859-1?Q?TygPamGydtSTGlgJHgvCoD6O5aExnJSGTZBMGeleL75A3zynt7/ZH3R3l7?=
 =?iso-8859-1?Q?FftMOW+qSLbGzUPAUYrzF0IYD5yc+LsaYV7LIDpcb/0+sZ2nlQC7upPltF?=
 =?iso-8859-1?Q?KehXciJEn9x/4hdLZjOMQgmCgaNEYDWBPTI3W1FfAtt9GWcOnRAxJzQ9nP?=
 =?iso-8859-1?Q?+XKWtIc0kMvQhCtvYlFXRWo44jovCY5G8pDk1XErYDmlEAdWnUzF+5pZv9?=
 =?iso-8859-1?Q?AD8YXZ92+1bqCqTzH5zYOA/nn3s8j5JOJcRLrVp2Mao/aZlH6gKp3Bk8Ml?=
 =?iso-8859-1?Q?zUIpWeGfBIkAe23OE4R+vx72C6iTseLcffKOHVSVlpm6A+ssDzLBQaF60n?=
 =?iso-8859-1?Q?Mmd62iqBivyjAL8wSKX/eXQf59TOeULj5mCMn7FonZdkWpJkuRZMr8/Qjc?=
 =?iso-8859-1?Q?0uWJAyuse2bL1LSlVNc4FXyXUYnRtzdyxBOmXakKD+ZztahwlDgGnced7b?=
 =?iso-8859-1?Q?ahjOr0F9JJVYT4vrybXWLPWSsMf7JarHCnO0O5NLUsESxG0p/ntA10q1Pn?=
 =?iso-8859-1?Q?2+ODRXWlZOvA/rCJuJ9iNy27VHSzIxZpT84SlLskHGbWPeTYQzj2iuvZuB?=
 =?iso-8859-1?Q?tY/t681xYdkswPe2TGXYABuaMsG9LvSh/qLKbUD4vgOcfuUA0t1MpI2gt+?=
 =?iso-8859-1?Q?leeZEyHOXh5UqKQMJKYS2JMsER7+ZIvVEqWthTAI1tUZ8+FU7oyedrX34i?=
 =?iso-8859-1?Q?mm7rn/mO8szz1OqGqKpsy8HF6QpYK3DbeNu60wzJ7b3fbqKcRdziE6NQMa?=
 =?iso-8859-1?Q?9Xphnc5x+JO++TJhn/SN19pAi9OzoZzQlVt+2XVqmpyZTgCO/oPfOZ4I+S?=
 =?iso-8859-1?Q?A5zqRY2ynQRMNvhF3nQJz734/tNC4Qt+DYCuahaEvo1+nqgi4EeZR1CMzg?=
 =?iso-8859-1?Q?Nkou4DXHLzoE5rvYAmL3JNg1/Y9sSJtLSMwOjJ/gjp6qfSFr3vnXrPQVNV?=
 =?iso-8859-1?Q?cOWtCOarwRZBQsvmWq9Zx/dbOEf6XRLcQuoxSOIzU5FjhcO/57R/ju87DN?=
 =?iso-8859-1?Q?iqFHyxsXTYeEd1HO5cKTE00+jhEehP8F3dbHT1sct6qQSd+rbxnh/2ftPa?=
 =?iso-8859-1?Q?X2DkFgbE3cNgJQflSwB+sBX/Y4nQ+EtPtdDSG31rnrtnDWKRH3SVXWourA?=
 =?iso-8859-1?Q?1yuSEi+nZf+QUP/CulzZP9wjdFfBhHhEqwVlPfnwI7FKy0lkmvCPdmoEcv?=
 =?iso-8859-1?Q?xTGZIEhvSb82jia3q/dsI9JIpe1axTfz7xcifKPhVEJ9h7qmdc1kx8cQY6?=
 =?iso-8859-1?Q?1IQ5SgAYDNbA1hYdIKrjMSEUSSXx1X/9XaswsMRxSwbrH7EkJAAZY13ACh?=
 =?iso-8859-1?Q?GguogRWP1q9U98A7HvHi0bus7VIVAPNybD52j/blcX7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TZG+0DIaX0lapxiXj11RvhZStVWqCvERotLjYRld0S1btgX6bHcdyrZrpZ?=
 =?iso-8859-1?Q?n9vQXST1ucAPc9pJMzXCbtQnaHgWgQ0Foe8ajYah7vvpT22I2VmoKxtYtC?=
 =?iso-8859-1?Q?I62vCA+mybeEjvqCfEM8JteNgWm48ULiqSEOFrRtaAXhEQ8/svxsLouMeM?=
 =?iso-8859-1?Q?RZw8wK0Fx30ygxz1clRo9TG8BAiSyLXuQ8UihlktufupkqteeDF8FhP5NQ?=
 =?iso-8859-1?Q?vliuM0fHW1Ho3wzuBULKQOOIQdUIrN3FieEFoCjJblyoRu4ZnLpGpFv76P?=
 =?iso-8859-1?Q?vjTzzu+qH/4yIUOs0gEYHAoUNklv2KL50u5TKSbptwnBKtJZXCr+HQxF42?=
 =?iso-8859-1?Q?IOdhhxD6+cs2N0u2CzueaO4ND4FORVKZ+HSsFgweJvaRh6nYd79k1TrMoD?=
 =?iso-8859-1?Q?Pfg9zCRJG1ahwL767cY3Lwso2njmb2lRwDKVa33CYGsZUZfgKvRQ4XhDC7?=
 =?iso-8859-1?Q?rHwRtShrP1bz816FaKISat0ZkrbhIlHfI2DFk8Cen7LED1s3/DL+6y3HE5?=
 =?iso-8859-1?Q?Ai0tknnLo98OJrCikEvBxDeSdILnt6C0CBjY2eKBQwXo16IKFAHci3lyGP?=
 =?iso-8859-1?Q?w3YHP5istEgn35X/opde8qttX7N13cCRbx4NCgWPTpw3wgUMzlqtN7wqoE?=
 =?iso-8859-1?Q?jqJBa+BRYbmDkkVNgNzgtsZHYRIcDD3Zyf3YD/9IKvXjEmlBNbdrsUdavv?=
 =?iso-8859-1?Q?xnLoUCXx+F9ckRX0J34B76jKrCoYaFyqk/zAHlEUipDzH/Gz2sxtlgXd+v?=
 =?iso-8859-1?Q?LGm9QuJCaEJLdee52fvVaU02R28nhPBM21Bzo4e90X6wRTWmaY7Cah6aoP?=
 =?iso-8859-1?Q?+LwG1LmiynGzsz+5OlxFV4HdfHqYvZPSJa4gpgfryhatbugfq5FZ0NgbV5?=
 =?iso-8859-1?Q?rzxRWDrdtkFcK/ukOWGy7XUFko4zK9N15CajT9DDEmIstjWYcXy0krAVoM?=
 =?iso-8859-1?Q?KLck8Gy1z0ZLgq0kOriF/KCjXoS9pH8NQ5uPueGPiXYXcdwQlQVr6f2QgV?=
 =?iso-8859-1?Q?j1UJlVMuYNUigU+g2qaiMPM6dOFnZaAUYyeTHofA37umt5igYBXTn7SZmW?=
 =?iso-8859-1?Q?bxBEkruGjkuxXBoIiCHyb0VvgRcev5kt+d9fDspvr8jV2DdN6nd0Yh94av?=
 =?iso-8859-1?Q?sO+g5zSAYsnxji5VJx9atT4kVYn+Bd4mi+sOgRc7hVpVFyL8fAw6ZIzhPG?=
 =?iso-8859-1?Q?adOca8PZsUPet1eTEdNr5vjk/h1Oo136C8fws8YP2R0pLGCoX0Ey3AnU5w?=
 =?iso-8859-1?Q?KbmKkBrUsQ5oV91JM/0nQbdbxVjO7ak4OQA5O/+d7Nvj7Oe4po2oXdjMtH?=
 =?iso-8859-1?Q?GmpD7ddxVU/KtEdkhNYQd9khGU6NeSm0UvUhysl4nW0RH6aNHdcgUiMghh?=
 =?iso-8859-1?Q?dZTmH8W6QmZz7FJoekCMCpvU+L6GCtSmag0vuAYbylTdJjCE4prq7U7oVV?=
 =?iso-8859-1?Q?esozUXnxMFTayQH04v3/u+rau9HDXiel7SffwEfpdFhqd7HSZp+Vp4HSRI?=
 =?iso-8859-1?Q?ArMgVbj7Vmt5OK7Uxwq1tjFadjTuz1vB/OwL1LufnzaliFwo/87HEIQ68a?=
 =?iso-8859-1?Q?xvD+Gr4YU8txNle34BURM4I4DXsab0+RJ2g9LA5SiMttdw2chlvR8peuNU?=
 =?iso-8859-1?Q?jSo3w7Y3RP65AmVCD/u+SaSnSmnar+q36/xjLB9WW6CQzavgmRqYzV+puw?=
 =?iso-8859-1?Q?qTPqhV4UyxsgnYCmtOZhRUEPMCdcF9t5YfSflVI7ZTa5eRmL6e6gtsBh4+?=
 =?iso-8859-1?Q?5AbCoBrJNNkHpJvfLReBXrgbZcyIvJlra1om7jjtCKjj9A0dMYrh8mDXKi?=
 =?iso-8859-1?Q?uxji3Vu4Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cea41740-7ee0-4e7d-56ed-08de4074a63f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 09:38:08.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4H6055MaiUrmucQcaSGSUv5bGfJxpUDVG1719e/NcUchieC35y3rJ8A/G5CXKXTu9nbTYtjSUGjglis4hCYUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7487
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Thu, Dec 18, 2025 at 11:20:20AM +0100, Peter Zijlstra wrote:
> On Thu, Dec 18, 2025 at 03:41:55PM +0530, Shrikanth Hegde wrote:
> > On 12/18/25 2:07 PM, Peter Zijlstra wrote:
> > > On Thu, Dec 18, 2025 at 12:59:53PM +0800, kernel test robot wrote:
> > > > 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:
> > > > 
> > > > 
> > > > commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
> > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> > > 
> > > Well, that obviously wasn't the intention. Let me pull that patch :/
> > 
> > Is it possible because it missed scaling by se_weight(se) ??
> 
> >  static inline void
> >  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> > -       cfs_rq->avg.load_avg += se->avg.load_avg;
> > -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> > +       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
> >  }
> 
> Ah, indeed, something like so then? Can the robot (Oliver/Philip)
> verify?

sorry for late. it happened that the server (Cascade Lake) used for original
bisect/report was converted for other usage. so we pick another server:

  test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory

to reproduce the regression (another improvement actually) then tested your
patch below. based on the results, the performance restored to be similar to
38a68b982d (parent of 089d84203a)
(both regression and improvement have lower pecentage on this Granite Rapids
server)

Tested-by: kernel test robot <oliver.sang@intel.com>

for the regression
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/32/2/debian-12-x86_64-phoronix/lkp-gnr-2sp3/schbench-1.1.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")
  d936730940 ("sched/fair: Fix sched_avg fold")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 d936730940bfff3f3b22770cfe9
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     18752           +16.0%      21749            -0.1%      18730        pts.schbench.32.usec,_50.0th_latency_percentile
     29493 ±  2%     +17.3%      34581            +0.3%      29568        pts.schbench.32.usec,_75.0th_latency_percentile
     40810           +15.2%      46997            +0.3%      40938        pts.schbench.32.usec,_90.0th_latency_percentile
     84437            +7.2%      90496            +1.1%      85376        pts.schbench.32.usec,_99.9th_latency_percentile

full comparison is as below [1]

BTW, in our original report https://lore.kernel.org/all/202512181208.753b9f6e-lkp@intel.com/
we also reported an improvment still on that Cascade Lake server.

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | pts: pts.stress-ng.Semaphores.bogo_ops_s 17.0% improvement                                    |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | option_a=Semaphores                                                                           |
|                  | test=stress-ng-1.11.0                                                                         |
+------------------+-----------------------------------------------------------------------------------------------+

in our tests, the performance also restored by your patch.

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/Semaphores/debian-12-x86_64-phoronix/lkp-gnr-2sp3/stress-ng-1.11.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")
  d936730940 ("sched/fair: Fix sched_avg fold")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 d936730940bfff3f3b22770cfe9
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
 3.533e+08           +11.3%  3.934e+08            +1.1%  3.573e+08        pts.stress-ng.Semaphores.bogo_ops_s

the full comparison is as below [2]


> 
> (I was going to shelf it and look at it after the holidays, but if this
> is it, we can get it fixed before I dissapear).
> 
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 76f5e4b78b30..7377f9117501 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3775,13 +3775,15 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  static inline void
>  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -	__update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
> +	__update_sa(&cfs_rq->avg, load, se->avg.load_avg,
> +		    se_weight(se) * se->avg.load_sum);
>  }
>  
>  static inline void
>  dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -	__update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
> +	__update_sa(&cfs_rq->avg, load, -se->avg.load_avg,
> +		    se_weight(se) * -se->avg.load_sum);
>  }
>  
>  static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags);

[1]
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/32/2/debian-12-x86_64-phoronix/lkp-gnr-2sp3/schbench-1.1.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")
  d936730940 ("sched/fair: Fix sched_avg fold")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 d936730940bfff3f3b22770cfe9
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      0.06 ±  2%      +0.0        0.07            -0.0        0.06 ±  2%  mpstat.cpu.all.soft%
     58411            -7.1%      54274            -0.3%      58244        vmstat.system.cs
    291141            -1.2%     287740            -0.5%     289788        vmstat.system.in
   2018606            -9.1%    1834308            -0.1%    2015969        time.involuntary_context_switches
      7153            -1.0%       7079            +0.1%       7162        time.user_time
    607814            -3.1%     589005            -0.0%     607669        time.voluntary_context_switches
     18752           +16.0%      21749            -0.1%      18730        pts.schbench.32.usec,_50.0th_latency_percentile
     29493 ±  2%     +17.3%      34581            +0.3%      29568        pts.schbench.32.usec,_75.0th_latency_percentile
     40810           +15.2%      46997            +0.3%      40938        pts.schbench.32.usec,_90.0th_latency_percentile
     84437            +7.2%      90496            +1.1%      85376        pts.schbench.32.usec,_99.9th_latency_percentile
   2018606            -9.1%    1834308            -0.1%    2015969        pts.time.involuntary_context_switches
      7153            -1.0%       7079            +0.1%       7162        pts.time.user_time
    607814            -3.1%     589005            -0.0%     607669        pts.time.voluntary_context_switches
      0.27 ±  4%      -0.1%       0.27 ±  5%      +7.9%       0.29 ±  2%  perf-stat.i.MPKI
     17.00 ±  2%      -0.8       16.23            +0.4       17.44 ±  2%  perf-stat.i.cache-miss-rate%
     60336            -7.5%      55810            -0.9%      59784        perf-stat.i.context-switches
 5.501e+11            -1.5%  5.419e+11            -0.6%  5.468e+11        perf-stat.i.cpu-cycles
      6222           +14.4%       7119            -0.7%       6178        perf-stat.i.cpu-migrations
    154698            +3.3%     159875 ±  2%      -0.1%     154599 ±  4%  perf-stat.i.cycles-between-cache-misses
    891574            -3.0%     864626            -1.4%     879513        perf-stat.i.dTLB-store-misses
      4.84 ±  5%      +6.0%       5.13            +3.2%       4.99        perf-stat.i.major-faults
      2.15            -1.6%       2.11            -0.6%       2.13        perf-stat.i.metric.GHz
     60586            -6.9%      56433            -0.8%      60112        perf-stat.ps.context-switches
      6258           +15.3%       7212            -0.6%       6221        perf-stat.ps.cpu-migrations
    888660            -2.5%     866297            -1.2%     877931        perf-stat.ps.dTLB-store-misses
      4.49 ±  5%      +4.3%       4.68            +3.0%       4.62        perf-stat.ps.major-faults
      3.94 ± 92%      -3.2        0.71 ±147%      -1.9        2.00 ±134%  perf-profile.calltrace.cycles-pp.arch_show_interrupts.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
      0.43 ±142%      +1.7        2.11 ± 42%      +1.6        2.07 ± 61%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.08 ± 77%      +2.0        3.08 ± 25%      +1.7        2.80 ± 77%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.08 ± 77%      +2.0        3.08 ± 25%      +1.7        2.80 ± 77%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     12.35 ± 67%     +10.7       23.07 ± 14%      -0.1       12.28 ±101%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     12.09 ± 71%     +11.0       23.07 ± 14%      +0.2       12.28 ±101%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.94 ± 92%      -3.2        0.71 ±147%      -1.9        2.00 ±134%  perf-profile.children.cycles-pp.arch_show_interrupts
      0.24 ±223%      +1.3        1.55 ±  9%      +0.2        0.42 ±141%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.24 ±223%      +1.3        1.55 ±  9%      +0.2        0.42 ±141%  perf-profile.children.cycles-pp.handle_softirqs
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.08 ± 77%      +1.7        2.82 ± 34%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.pv_native_safe_halt
      1.08 ± 77%      +2.0        3.08 ± 25%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.cpuidle_enter
      1.08 ± 77%      +2.0        3.08 ± 25%      +1.7        2.80 ± 77%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.24 ±147%      +3.2        4.44 ± 37%      +0.9        2.14 ± 80%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.02 ± 25%    +209.1%       0.05 ± 26%     +21.2%       0.02 ± 27%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.25 ±  6%     +36.2%       0.34 ± 10%      +0.1%       0.25 ±  6%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
      0.25 ±  7%     +35.8%       0.34 ±  9%      -0.5%       0.25 ±  6%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.21 ± 74%     -83.8%       0.03 ±136%     +92.6%       0.40 ±145%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_call_function.[unknown].[unknown]
      0.16 ± 12%     +31.2%       0.21 ± 16%      +4.4%       0.17 ± 12%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
      7.88 ± 62%     -82.6%       1.38 ±165%    +195.7%      23.31 ±174%  perf-sched.sch_delay.max.ms.irqentry_exit.asm_sysvec_call_function.[unknown].[unknown]
      0.17 ±  7%     +37.0%       0.23 ± 13%      +0.8%       0.17 ±  8%  perf-sched.total_sch_delay.average.ms
    144.28 ± 10%    +122.9%     321.60 ± 96%      +0.6%     145.18 ± 11%  perf-sched.total_sch_delay.max.ms
      8.72           +32.1%      11.51            -0.3%       8.69        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     25.19 ±  2%     +10.4%      27.81 ±  3%      +0.4%      25.30 ±  2%  perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown]
     29.05           +11.9%      32.50            +0.1%      29.06        perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
     28.93           +12.4%      32.53            +0.0%      28.94        perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    120587           -11.1%     107144            -0.4%     120153        perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
    116894           -11.0%     103989            -0.2%     116681        perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      7275 ± 13%     -47.7%       3808 ± 15%     -11.6%       6429 ± 12%  perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_call_function_single.[unknown]
      6801 ± 13%     -48.5%       3500 ± 14%     -10.9%       6059 ± 12%  perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
    811.07 ± 83%     -92.9%      57.96 ±106%      +7.6%     873.05 ± 93%  perf-sched.wait_and_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
    213.79 ±  9%     +41.7%     303.02 ± 23%      +4.5%     223.47 ±  6%  perf-sched.wait_and_delay.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
      8.27 ± 62%     -81.4%       1.54 ±150%     -35.3%       5.36 ± 66%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_huge_pmd_numa_page
      8.70           +31.7%      11.46            -0.3%       8.67        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     24.73 ± 73%    +128.9%      56.61 ± 30%     +12.5%      27.81 ± 57%  perf-sched.wait_time.avg.ms.irqentry_exit.asm_exc_page_fault.[unknown]
     25.06 ±  2%     +10.2%      27.61 ±  3%      +0.4%      25.17 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown]
     28.88           +11.8%      32.29            +0.0%      28.89        perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
     28.76           +12.3%      32.31            +0.0%      28.77        perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.98 ±140%     -99.2%       0.01 ± 11%     -32.3%       0.66 ±220%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
    203.03 ±  6%     +12.8%     229.11 ±  4%      +2.9%     208.98 ±  4%  perf-sched.wait_time.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
      1196 ±  9%     +32.8%       1589 ± 14%     +10.1%       1317 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.avg
     18675 ± 15%     +48.2%      27668 ± 31%     +20.2%      22441 ± 39%  sched_debug.cfs_rq:/.avg_vruntime.max
      2404 ±  7%     +29.7%       3118 ± 13%      +8.1%       2599 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      6.09 ± 45%    +557.7%      40.05 ± 14%     -24.1%       4.62 ± 28%  sched_debug.cfs_rq:/.load_avg.avg
      6.69 ± 34%     -33.3%       4.46 ± 33%     -47.7%       3.49 ± 39%  sched_debug.cfs_rq:/.util_est.avg
     55.43 ± 18%     -19.2%      44.80 ± 17%     -26.6%      40.69 ± 19%  sched_debug.cfs_rq:/.util_est.stddev
      1126 ±  8%     +30.1%       1464 ± 14%      +9.5%       1233 ± 15%  sched_debug.cfs_rq:/.zero_vruntime.avg
     18675 ± 15%     +48.2%      27668 ± 31%     +20.2%      22441 ± 39%  sched_debug.cfs_rq:/.zero_vruntime.max
      2293 ±  7%     +23.8%       2840 ± 11%      +7.7%       2470 ± 19%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      4.69 ± 11%   +5177.9%     247.68 ±  6%      -2.9%       4.56 ± 18%  sched_debug.cfs_rq:/system.slice.load_avg.avg
     33.33 ± 10%   +2518.5%     872.83 ± 14%      -3.5%      32.17 ± 10%  sched_debug.cfs_rq:/system.slice.load_avg.max
      7.52 ± 10%   +2180.0%     171.48 ±  6%      -1.7%       7.39 ± 14%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
     24021 ± 43%     -53.8%      11098 ± 29%      +4.4%      25077 ± 34%  sched_debug.cfs_rq:/system.slice.se->load.weight.avg
    950.50 ± 17%     -86.0%     132.83 ± 22%      -3.2%     919.67 ± 23%  sched_debug.cfs_rq:/system.slice.se->load.weight.min
      1426 ± 14%     +39.1%       1984 ± 11%     +11.7%       1593 ± 20%  sched_debug.cfs_rq:/system.slice.se->vruntime.avg
     17114 ± 14%     +61.8%      27689 ± 31%     +28.8%      22038 ± 41%  sched_debug.cfs_rq:/system.slice.se->vruntime.max
      2553 ±  7%     +45.5%       3714 ± 16%     +15.7%       2954 ± 25%  sched_debug.cfs_rq:/system.slice.se->vruntime.stddev
      2077 ± 52%   +1663.6%      36636 ±  8%     +14.1%       2369 ± 32%  sched_debug.cfs_rq:/system.slice.tg_load_avg.avg
      4280 ± 33%   +1577.3%      71794 ±  3%      +1.4%       4341 ± 23%  sched_debug.cfs_rq:/system.slice.tg_load_avg.max
      1662 ± 73%   +1347.5%      24056 ± 12%     +22.7%       2039 ± 32%  sched_debug.cfs_rq:/system.slice.tg_load_avg.min
    509.03 ± 42%   +2013.2%      10756 ±  9%     -32.2%     345.01 ± 35%  sched_debug.cfs_rq:/system.slice.tg_load_avg.stddev
     14.23 ± 60%   +1647.1%     248.69 ±  6%     +27.0%      18.07 ± 37%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.avg
     79.49 ± 68%    +117.9%     173.24 ±  7%     +41.0%     112.06 ± 25%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.stddev
      0.75 ± 37%    -198.7%      -0.74          -156.6%      -0.43        sched_debug.cfs_rq:/system.slice/containerd.service.avg_vruntime.max
      0.73 ± 17%     -84.6%       0.11 ±215%     -65.3%       0.25 ±140%  sched_debug.cfs_rq:/system.slice/containerd.service.avg_vruntime.stddev
      1.01 ± 27%     -44.6%       0.56 ± 52%     -16.0%       0.85 ± 17%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.load_avg.stddev
      0.75 ± 37%    -198.7%      -0.74          -156.6%      -0.43        sched_debug.cfs_rq:/system.slice/containerd.service.zero_vruntime.max
      0.73 ± 17%     -84.6%       0.11 ±215%     -65.3%       0.25 ±140%  sched_debug.cfs_rq:/system.slice/containerd.service.zero_vruntime.stddev
    281.30 ± 10%     +35.7%     381.81 ±  7%      -1.9%     276.09 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.load_avg.avg
     11670 ±  4%     -24.4%       8826 ±  5%      -3.3%      11288 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->load.weight.min
    386.83 ± 26%     +33.2%     515.16 ± 12%     +27.2%     492.08 ± 19%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.avg
     42031 ± 10%     +30.9%      55022 ±  8%      -0.5%      41811 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.avg
     81249 ±  4%     +39.2%     113112 ±  7%      +0.4%      81550 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.max
      9990 ±  6%     +50.0%      14989 ±  8%      +1.8%      10172 ± 15%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.stddev
    280.84 ± 11%     +31.5%     369.28 ±  5%      +0.8%     283.22 ± 14%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.avg
      2.91 ± 82%     -67.6%       0.94 ± 34%     -19.0%       2.36 ± 91%  sched_debug.cfs_rq:/system.slice/systemd-journald.service.se->sum_exec_runtime.max
    -19.83           +53.8%     -30.50           +75.6%     -34.83        sched_debug.cpu.nr_uninterruptible.min


[2]
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/Semaphores/debian-12-x86_64-phoronix/lkp-gnr-2sp3/stress-ng-1.11.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")
  d936730940 ("sched/fair: Fix sched_avg fold")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 d936730940bfff3f3b22770cfe9
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      0.04 ±  2%      +0.0        0.04 ±  3%      -0.0        0.03 ±  2%  mpstat.cpu.all.soft%
  1.71e+08 ±  3%     -12.3%    1.5e+08 ±  2%      -0.8%  1.696e+08 ±  2%  vmstat.system.cs
     59578 ± 22%     -16.5%      49752 ±  4%     -24.1%      45240 ± 22%  proc-vmstat.numa_hint_faults
     59099 ± 22%     -16.4%      49416 ±  4%     -24.3%      44745 ± 23%  proc-vmstat.numa_hint_faults_local
 8.289e+09           -13.2%  7.198e+09 ±  2%      -1.8%  8.142e+09 ±  2%  time.involuntary_context_switches
      1715            +2.9%       1764            -0.7%       1703        time.user_time
     56162 ± 15%     +79.7%     100932 ±  5%     +16.7%      65551 ±  9%  time.voluntary_context_switches
 3.533e+08           +11.3%  3.934e+08            +1.1%  3.573e+08        pts.stress-ng.Semaphores.bogo_ops_s
 8.289e+09           -13.2%  7.198e+09 ±  2%      -1.8%  8.142e+09 ±  2%  pts.time.involuntary_context_switches
      1715            +2.9%       1764            -0.7%       1703        pts.time.user_time
     56162 ± 15%     +79.7%     100932 ±  5%     +16.7%      65551 ±  9%  pts.time.voluntary_context_switches
      3.20 ± 74%      -1.8        1.44 ±101%      -2.2        1.00 ± 89%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      2.79 ± 62%      -1.4        1.44 ±101%      -1.8        1.00 ± 89%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      2.63 ± 63%      -1.2        1.44 ±101%      -1.6        1.00 ± 89%  perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.41 ± 43%      -0.5        0.86 ± 99%      -1.0        0.43 ±100%  perf-profile.calltrace.cycles-pp.shmem_add_to_page_cache.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write
      0.86 ± 45%      +0.1        0.97 ± 57%      +1.5        2.32 ± 38%  perf-profile.calltrace.cycles-pp.lookup_fast.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      2.06 ± 40%      +0.4        2.50 ± 22%      +2.2        4.22 ± 49%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.06 ± 40%      +0.4        2.50 ± 22%      +2.2        4.22 ± 49%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.06 ± 40%      +0.4        2.50 ± 22%      +2.2        4.22 ± 49%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.06 ± 40%      +0.4        2.50 ± 22%      +2.2        4.22 ± 49%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      1.19 ± 58%      +0.6        1.77 ± 52%      +2.0        3.20 ± 59%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      3.69 ± 30%      +1.4        5.11 ± 47%      +3.4        7.05 ± 29%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.69 ± 30%      +1.4        5.11 ± 47%      +3.4        7.05 ± 29%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      3.20 ± 74%      -1.8        1.44 ±101%      -2.2        1.00 ± 89%  perf-profile.children.cycles-pp.do_fault
      2.44 ± 36%      -1.5        0.92 ±104%      -1.7        0.72 ± 81%  perf-profile.children.cycles-pp.mutex_unlock
      2.63 ± 63%      -1.2        1.44 ±101%      -1.6        1.00 ± 89%  perf-profile.children.cycles-pp.do_read_fault
      2.63 ± 63%      -1.2        1.44 ±101%      -1.6        1.00 ± 89%  perf-profile.children.cycles-pp.filemap_map_pages
      1.41 ± 43%      -0.5        0.86 ± 99%      -1.0        0.43 ±100%  perf-profile.children.cycles-pp.shmem_add_to_page_cache
      0.18 ±223%      +0.6        0.77 ± 51%      +1.3        1.46 ± 46%  perf-profile.children.cycles-pp.__d_lookup_rcu
      4.21 ± 31%      +1.5        5.69 ± 45%      +3.0        7.19 ± 32%  perf-profile.children.cycles-pp.do_filp_open
      4.21 ± 31%      +1.5        5.69 ± 45%      +3.0        7.19 ± 32%  perf-profile.children.cycles-pp.path_openat
      2.44 ± 36%      -1.5        0.92 ±104%      -1.7        0.72 ± 81%  perf-profile.self.cycles-pp.mutex_unlock
      0.18 ±223%      +0.6        0.77 ± 51%      +1.3        1.46 ± 46%  perf-profile.self.cycles-pp.__d_lookup_rcu
 1.586e+11 ±  3%      +3.7%  1.644e+11            +2.2%  1.621e+11        perf-stat.i.branch-instructions
      0.30 ±  4%      -0.0        0.29            +0.1        0.37        perf-stat.i.branch-miss-rate%
 2.701e+08 ±  3%      -1.2%  2.669e+08           +68.1%   4.54e+08        perf-stat.i.branch-misses
 1.833e+08 ±  4%     -11.7%  1.619e+08 ±  2%      -0.0%  1.832e+08 ±  2%  perf-stat.i.context-switches
      1.64 ±  7%      -4.9%       1.56            -6.0%       1.55 ±  2%  perf-stat.i.cpi
    407.20           +24.9%     508.59 ±  2%      +1.3%     412.44 ±  2%  perf-stat.i.cpu-migrations
      0.02 ±  6%      -0.0        0.02 ±  3%      -0.0        0.02 ±  2%  perf-stat.i.dTLB-load-miss-rate%
  2.08e+11 ±  3%      +3.1%  2.144e+11            +2.2%  2.125e+11        perf-stat.i.dTLB-loads
    741999 ±  5%     -27.0%     541820 ±  8%     -30.3%     516965 ±  2%  perf-stat.i.dTLB-store-misses
 1.219e+11 ±  3%      +3.5%  1.262e+11            +2.6%  1.251e+11        perf-stat.i.dTLB-stores
 7.463e+11 ±  3%      +3.3%  7.707e+11            +2.2%  7.628e+11        perf-stat.i.instructions
      0.92 ±  3%      +3.9%       0.96            +2.4%       0.94        perf-stat.i.metric.G/sec
     12710            -1.8%      12482            -0.8%      12610 ±  2%  perf-stat.i.minor-faults
     12715            -1.8%      12487            -0.8%      12615 ±  2%  perf-stat.i.page-faults
      0.17            -0.0        0.16            +0.1        0.28        perf-stat.overall.branch-miss-rate%
      0.02            -0.0        0.02 ±  3%      -0.0        0.02        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  5%      -0.0        0.00 ±  8%      -0.0        0.00 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
 1.551e+11 ±  2%      +3.6%  1.606e+11            +2.1%  1.584e+11        perf-stat.ps.branch-instructions
  2.64e+08 ±  3%      -1.2%  2.607e+08           +68.0%  4.434e+08        perf-stat.ps.branch-misses
 1.791e+08 ±  4%     -11.8%   1.58e+08 ±  2%      -0.1%  1.789e+08 ±  2%  perf-stat.ps.context-switches
    398.46           +24.8%     497.28 ±  2%      +1.2%     403.37 ±  2%  perf-stat.ps.cpu-migrations
 2.033e+11 ±  3%      +3.0%  2.095e+11            +2.1%  2.076e+11        perf-stat.ps.dTLB-loads
    725199 ±  5%     -27.0%     529185 ±  8%     -30.4%     504934 ±  2%  perf-stat.ps.dTLB-store-misses
 1.192e+11 ±  3%      +3.4%  1.232e+11            +2.5%  1.222e+11        perf-stat.ps.dTLB-stores
 7.299e+11 ±  2%      +3.2%  7.531e+11            +2.1%  7.454e+11        perf-stat.ps.instructions
     12417            -1.8%      12194            -0.8%      12317 ±  2%  perf-stat.ps.minor-faults
     12422            -1.8%      12199            -0.8%      12322 ±  2%  perf-stat.ps.page-faults
 3.379e+13            +1.5%  3.431e+13            +0.4%  3.394e+13        perf-stat.total.instructions
     21355 ± 17%     +30.6%      27891 ±  9%      -9.7%      19290 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.max
      2572 ±  8%     +23.2%       3167 ± 10%      -7.0%       2391 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      3.46 ± 20%   +1005.0%      38.27 ± 20%     +22.4%       4.24 ± 44%  sched_debug.cfs_rq:/.load_avg.avg
    172.33 ± 33%    +353.4%     781.40 ± 10%     +88.5%     324.83 ± 74%  sched_debug.cfs_rq:/.load_avg.max
     14.69 ± 27%    +578.7%      99.70 ± 21%     +66.6%      24.48 ± 59%  sched_debug.cfs_rq:/.load_avg.stddev
      1391 ± 11%     -23.6%       1063 ± 16%      +9.2%       1518 ± 20%  sched_debug.cfs_rq:/system.slice.load.avg
      6227 ±  9%     -22.2%       4846 ± 13%      +4.5%       6509 ± 18%  sched_debug.cfs_rq:/system.slice.load.stddev
      4.52 ±  8%   +5661.0%     260.22 ±  7%      -5.1%       4.28 ± 11%  sched_debug.cfs_rq:/system.slice.load_avg.avg
     41.17 ± 22%   +1960.9%     848.40 ± 12%      -6.1%      38.67 ± 28%  sched_debug.cfs_rq:/system.slice.load_avg.max
      7.68 ±  8%   +2068.9%     166.64 ±  9%      -1.5%       7.57 ± 16%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
     45.50 ± 85%     -70.1%      13.60 ± 46%     +44.7%      65.83 ± 95%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.max
      6.40 ± 50%     -59.6%       2.58 ± 17%     +26.1%       8.07 ± 87%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.stddev
     23349 ± 27%     -58.9%       9596 ± 14%      -7.7%      21550 ± 32%  sched_debug.cfs_rq:/system.slice.se->load.weight.avg
    462482 ± 18%     -65.8%     158309 ± 59%      -2.9%     448934 ± 25%  sched_debug.cfs_rq:/system.slice.se->load.weight.max
      1010 ± 10%     -89.4%     107.20 ± 10%      -7.0%     939.50 ± 34%  sched_debug.cfs_rq:/system.slice.se->load.weight.min
     71887 ± 20%     -76.9%      16583 ± 50%      -8.7%      65645 ± 25%  sched_debug.cfs_rq:/system.slice.se->load.weight.stddev
      1677 ± 27%   +2348.6%      41062 ±  8%     +30.5%       2188 ± 35%  sched_debug.cfs_rq:/system.slice.tg_load_avg.avg
      4973 ± 43%   +1480.9%      78625 ±  6%      -8.8%       4538 ± 36%  sched_debug.cfs_rq:/system.slice.tg_load_avg.max
      1361 ± 27%   +1922.4%      27528 ±  6%     +37.7%       1874 ± 42%  sched_debug.cfs_rq:/system.slice.tg_load_avg.min
    554.12 ± 61%   +2079.3%      12075 ± 12%     -12.5%     484.93 ± 46%  sched_debug.cfs_rq:/system.slice.tg_load_avg.stddev
     12.35 ± 36%   +2045.2%     265.00 ±  7%     +15.0%      14.21 ± 45%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.avg
     81.21 ± 44%    +112.1%     172.28 ± 11%     +11.4%      90.50 ± 47%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.stddev
     -0.34         -1648.0%       5.20 ±122%   -2398.6%       7.72 ±181%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.min
    271.19 ±  5%     +53.5%     416.15 ± 11%      -3.8%     260.79 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.load_avg.avg
      4.52 ±  8%     -21.1%       3.56 ± 14%      -5.3%       4.28 ± 12%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.load_avg.avg
     11670 ±  2%     -27.0%       8517 ±  6%      -2.3%      11398 ±  3%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->load.weight.min
     41222 ±  5%     +48.6%      61266 ± 10%      +1.9%      41999 ± 12%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.avg
     83749 ±  7%     +44.4%     120949 ±  6%      +0.9%      84484 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.max
     28726 ±  8%     +52.0%      43652 ± 11%      -1.6%      28263 ± 12%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.min
     10569 ± 14%     +48.9%      15737 ± 13%     +11.8%      11814 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.stddev
    269.98 ±  8%     +48.4%     400.63 ± 12%      -1.7%     265.28 ± 10%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.avg


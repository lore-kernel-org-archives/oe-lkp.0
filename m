Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E0207A32
	for <oe-lkp@lists.linux.dev>; Wed, 28 Jan 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609586; cv=fail; b=U08TdrHrFVdNd7N+3luEUXOEFGIfSvJOYgZhxv2n1gUmhrGN+h/dKgz2p+0uHoCM8yMyzfrgLu3zD1byl9vCkwRSSVzH78ZuIP2gDzxj8ZEcJ8b3tM+R7JzUwpAwuP7vCCWx5NBC4kT2hCdI9D0otBVNzCKDGQ5UAFpI+rBX+HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609586; c=relaxed/simple;
	bh=qrIxpTTkPt3XJS+xvJprZhJ4PQZL4vD0xsWg+dx6rwo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Jx977ugwywImeESXqJNTcopQD+z8I0BcTJLiUCQH/c89xRn/xlZxoQXAqe6KH5WJ7NoQVXBzsVt2F18yq7tpq8KnCWqrkTggq2BUpFG+cFeWQK9T8CIapKSaZoHtdROnD0xiMlQgMZK9dceouBDUuh5zIJgCk8DTFM3nDl+ZH8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHkuQHog; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHkuQHog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769609585; x=1801145585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrIxpTTkPt3XJS+xvJprZhJ4PQZL4vD0xsWg+dx6rwo=;
  b=eHkuQHog8uCSY60LIKiqyjoTa7e5AF6cC9dnKJ1RPNRNvZCZrSCGGH1y
   9eI34tLdZy56BYZ3iML2/yScz7sq9MZevKeXX+KRLQj+c00iVum/bBwds
   2Qldu8Xt/EDKwkMo5dgVTrvX4j+OKbXlO0tyPZCC8vlrqb4C+uBmBtZ8p
   hJl1sJcdmRNDLUjXXX31qsBRr1nCdl/qXB/9xDYD6Dv7OWhuD6B/vFQXG
   UmPVX0ZAEw2gA2flSgQav641aXW2vJGUFAjF6UlVt8O8rY75AluqWA3ys
   ccbuWh/7XW/AFoj5fIlHuLEZUwiyjspJqtNLAaOXZqay44voRqNWjZFJp
   A==;
X-CSE-ConnectionGUID: 2hYr6nNKT2y3CSMlc35htg==
X-CSE-MsgGUID: zrayYZBgR7CnfgH3qXXYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81545640"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81545640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:13:04 -0800
X-CSE-ConnectionGUID: 5fqw1WxGTUKGzEFaO9TBpA==
X-CSE-MsgGUID: 0jbKG45oQTi+WRNj5vBL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212834251"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:13:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 06:13:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 06:13:03 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 06:13:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhYh00eIT9kAiDInePBQ0XYJXx/cCQ6IfaNrH7NPnDXB1rLS+iTtWS8JbZZAyDjpZXE8AH4MkPMrHxVE8GeMJzSLyQEHTSu2m5d/phqD94X+kmk2pQBph+qypMnLttGGPXjg8gOSoUhRHMDj99cRGSEh7W6FDUq7WV/vSzG8vtNJl2gqcJe6G4DSwS/ARA3jHXagZw5eVTatFy3oEKUo+qtmQDL1cUGAfHFByz10WG9fQXSR97MOPIVuIUeh3E30wFHNgS6CahV7I0y6L+qIwgxKEhcEnzYQu/kOv/M26U0tgsu+IE0440A+Pz9k4mfS1M2OKkJVW/Z1Zuv6j1fTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2Gh7P3K5t715nB8mfA2NCs1wMQrFoPfbAH588xcjr4=;
 b=yBS2sjyl0OK/BaroxrOFelXLRhpxAXwl/X8D9JOBDEm/Aaxi8J4MTtgECe/6U0CYJ7m1a65mBldk5BcOPsZ6qA67lKVXQ71II5Ss1/KNhnZXP9V4u5rJSI25SIl7Slkh0Ti4mE960Wcx8Daa8Jq7QdHleEE/FLw+VwDK7MNGU/HZ3bowQZrUxYbjWepPFfGF/P3c0kVz1eX6Xnd2eWwvilYjddwva2LCHpSNMeWXNVODEFV7FJdG5Q7JFJl0o56xC+LdSz4S+Pr4374O7uzjbW9II5/rQ87DZywpXr1kzCnNyeEkHEqRtQLD1cjAIsFF2kvMFDmdcDAa6MyXfAFRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:12:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:12:58 +0000
Date: Wed, 28 Jan 2026 22:12:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-drm-fix] [dyndbg]  80a26374d2:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Message-ID: <202601282112.3e252f09-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU0P306CA0035.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:29::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: ce32fddb-d7b9-4112-8a7f-08de5e7756bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FsJ2ZCPWxRaZZLGo4BsKhjVJJ3uOi0Gnk9j9XPnZCOSDydkvLxFSUWYi36Gq?=
 =?us-ascii?Q?o45nCGj83RwWMhx9vbOmFzZglbtzFf6M0VjxRORll7k/CNpbUziEn206hfEN?=
 =?us-ascii?Q?XCZJj9yt0OaG1NsZC+WcVq6VM/57QWqYm8cHIcPGvHgG7eyiu6MSPEybzrPA?=
 =?us-ascii?Q?4SbUgHpWYNWUP/QnZxdkN+IqBItxCtKgEu3pKobnqYdZIDIR6BT8Dm04Tqnd?=
 =?us-ascii?Q?AVce/kJjeLHMkbBSzyFMTa5l7uwz3l2I60lvJKLNtJaYDyFiNjZCwRJD+V9p?=
 =?us-ascii?Q?DXfmSeRn0+bd+HiMcGHGF7n3nPtl6GI6FDlDjQvdeTxkheoaLYLNkCBfJftJ?=
 =?us-ascii?Q?uEFB7BNbAdgHzpQzWixAE//zjNFp1oxGpvZgEBwLURjSJZ0+Y+cAQScwa1L9?=
 =?us-ascii?Q?JzR0zZpHaWHK63LIayjm0UDulLKi9pbLCXaOlkrs0CigCtgSjV+F08ySQOFy?=
 =?us-ascii?Q?J3FKwpIKHt+5RZum3HRxzKsu7UHDXPaWm9LY1JUl+4pMRHOGGvxjiyF4UlCx?=
 =?us-ascii?Q?aa6SeFnrq5jLuG53ebBMtluEaHo17Gq80XFJnT45gkVekFEAA3ySHh6dBfGN?=
 =?us-ascii?Q?MXZ+6F2qWG+OP6Ex7gQkVfYFn84xnLHt22aF12o9mkUavI97Hx/hkxal1d68?=
 =?us-ascii?Q?yMGqAH2XgNWeg6pEfJSfoERTuDXM1dyP5hSsGShpeV85GoszcfsvXzhFdSKo?=
 =?us-ascii?Q?kXUjigfPLAsiEY3sC8f1U84G7rlYk5Q17qiwOfRNoG1KzLeC56oiXNiueOnQ?=
 =?us-ascii?Q?dBtWQDIfDQGUVtSEo3jR5Rg2RWtMFiYZctmqFtTnmZuood7pcJKUY+SBMWEQ?=
 =?us-ascii?Q?Rdqxv2ww/pbnnDPMN2ZXhH/FMVU1/hqecvFqPWXD89T9AOMwTGl1Tojfp9Sl?=
 =?us-ascii?Q?PeoHjm5ZyGUhMxGrzdC5IBP0loFWpzEOenbSp1niexE0q6YRripgYF8xXSMC?=
 =?us-ascii?Q?pZ5DOF4kYhzHPoAGlu2xw/9zeJ5xRSVgNpMFjLvK19x2Jo9QSfrlpooYlKLJ?=
 =?us-ascii?Q?haNygn9OfQUJQpIxj7cnY16thVzG8WEl+xZ/HjP9yKDBvaQdOxwLHj0JIuNd?=
 =?us-ascii?Q?PLFuSmF5oI3xDrPzti0eY6v0kvrfTqBBG/oCuCZh6G6+fuNMy6dSAFTWm3bC?=
 =?us-ascii?Q?wbXfUS2FtFOwqPErBpNIfH+vvkjtlqRDI1ndtCE48P22dDQ0GoW8WP2CJHLD?=
 =?us-ascii?Q?Fum0s1UdQwfCDuCodK9zKcDNo4duEG3BhBY2o/NMOhNh1S9WArGZZC/k9e+F?=
 =?us-ascii?Q?FX067kFfnF+lCv4QLIud+APOpyPw9iuB8K1DT5tJ9b6JS91QITuvpyAB2QBe?=
 =?us-ascii?Q?zB+iYhVcUx6L2x/0EYXVqz/V3hLZWE2Pv1jI4KhxLVrFsJsuSr1w3T7j/FrT?=
 =?us-ascii?Q?CY3pBnzYhUqqPf/aQyiVOfNysk//nxFRbnken6GmWYvBxqaGzFwpLRH+ahoh?=
 =?us-ascii?Q?ZmSqu1BWCNUpFqnnxZdl0vZBQnz6pJ0E3JOaVRPG04KJU1MHOwkrqLRC2xsK?=
 =?us-ascii?Q?LI3J3a6HiRarG+nxHXXupkBk41MkI03GkWxx/wqU13CSixyzBA8e2BFQkj19?=
 =?us-ascii?Q?UbwlRROwHda/u5xeW3LWXh1+5xyzVIgxmH4NUWJo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AKR+Y2NsiUTDh3t9mtDZplKnqQbKHnrr77g4P2r6FBobvzf/SMoLg5zNYQWO?=
 =?us-ascii?Q?px4QaQHwo11mqnn0ujFsuvTSCI8AmI5KwDsuPdEqF2cnKoFebxchxBQRBdef?=
 =?us-ascii?Q?z6LAX1wR6k6v1pm+xVBltR0PmKR36W5uTEoFgZKKurqzzNLQExkGXY2k6rSK?=
 =?us-ascii?Q?PyMSSzNPWBhZiUZ1t52jv7KUpAHo0Up0Y8ifsWoG0SmuL4AO3oacGt9GV62W?=
 =?us-ascii?Q?vLzr7FuBZr0Y1inc267kEBO9328UNO7Tq60VsKnw6x2STlw29yvkawgkx3/n?=
 =?us-ascii?Q?A8QO14iSJzd6KvvDLpsZo/JkHWBvr3o9UWhhdHBSyDaH7umcjXnb6OPPMotc?=
 =?us-ascii?Q?BTXwPzOpkZhatAnWwn6/AyozO/eD5zqVXuyhZ+B8B9tCAwMM2MV5MU3IG92M?=
 =?us-ascii?Q?eIqsRD03B5D4Mpmb/Kl7LkDSltrhHdFbvY39fHAIQH4fQaepCDfWhATsTi6g?=
 =?us-ascii?Q?OLtMEYsyk2iutbZEuioWvDcHlCFxmwp/Ai6/oZ9Vf9AOXWquev8P1cclDb4R?=
 =?us-ascii?Q?XJGlEg2fEOkkM63OaJ02Iq4fOSmU/PSifeaq9LRgZS1PezTv8FeJfEMNAd87?=
 =?us-ascii?Q?BfPDXwgN/jY+ExSdFGFybIKJuNR6cN3iThTkOWdS0wAyVgmTg84q9lXYyqwN?=
 =?us-ascii?Q?h0wUdtygKDP1/ESL+bAW+KEMYkB5mefPbLMV/vWSfP3s3XP6q6SOXOaWxsgO?=
 =?us-ascii?Q?0f0ql2G8QsacqoLvkLBtQF2gJwNMf1tXOBG4UkBpWg6YY/73v5RW1qD5bysl?=
 =?us-ascii?Q?szfYH4QjdPp67OGkfplf+fzvXJDu7wiQN7S8TblsgBLD6CgzOwF6XA7IvnD9?=
 =?us-ascii?Q?ZIEoECWHh1MjWY5ItL7b3V6mmNhQmuDnAo9hbqkuOtvWLMdSrN6ADctbDV53?=
 =?us-ascii?Q?21dTNP08+SudTjWCCWtybky2443ix9mZJhvYlcN8ljaXcpijq5srOUViTuem?=
 =?us-ascii?Q?2hhBwX2tCIQFxVFZGSs4o8nehgtUt586Ev71h9tohq6sHTKnBDICW0g9Aqns?=
 =?us-ascii?Q?oh4d224DdX0xggLQeUyBO85/4y9ctI80PJ/y2dsDYXaxNjAUAjFTcE43Wa67?=
 =?us-ascii?Q?dBY7c48HANTpX5WN4P1NWj505D92DeFCE84l6S/0RZ7T6dYuAqsTEkQvE3NB?=
 =?us-ascii?Q?QeHR+EpfDdJ+elvxGVs8ZLo9Gj0GZ6T4oQs+2NOVvC+q5ClMeU9SCBy0D+bm?=
 =?us-ascii?Q?jYHUpCV8ChjqWmwmZHf+yDu1pYQuLOpibtZzyzT0hh1LhLpbZZL1jn8FX8O+?=
 =?us-ascii?Q?V7o7hSBJ6GEIjC+fakR211Tn6QU3tTbkCV0Fh591dmW9krihjvKJlPLkRGwy?=
 =?us-ascii?Q?WIMZduma0QkTH33dkCdM7VtOHfIe/mdKzXrBRaENn4BStLrl6OTs7EQkbMmc?=
 =?us-ascii?Q?u/7kJVhSEMdTBiPDBEtiNdWrfE5t2Hj2jREakZKPlpe6mGEMeetu5GW+9kE3?=
 =?us-ascii?Q?9VNMOpkkReDSiBx4JI6N+8PZGjysuxKFJsSdqfcS+zXJlDcIODgqA3cb5hOO?=
 =?us-ascii?Q?0CqJXgECGiiYnGiCAIVt2YTThb48i+ClgX7N1uDAZ5Gle86rQOlkTIeHZ0QY?=
 =?us-ascii?Q?CMAXGriblNyDAHCVY7Rq55+i/okwvzNBGm7GelaLQ/GStN1QuVjuH5x+7lz8?=
 =?us-ascii?Q?7aF28EQ3rjh+7OZ0LSmrgeUJ31/TgFd1ybSdC0cQtqWVDLtd6Uj/1x6ZvStj?=
 =?us-ascii?Q?jkSpE9Sj/cXmEkvt7oDGW7RC04CPVud9ka+XmgvCu3EvEZxmMRB6vasRcnQf?=
 =?us-ascii?Q?9ycRA3EY8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce32fddb-d7b9-4112-8a7f-08de5e7756bf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:12:58.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJmdFtl4J9i8VhY6D8eT+6Xztl/mpHnB2szdx/4vE//Vnj6X7UnOlsJ83DxRZqQNHl4Y3u6GAcYo5b6DxSk9lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:

commit: 80a26374d24c6a7ca964ad427e3a54852f0803b8 ("dyndbg: walk dd_mod_map intervals in dynamic_debug_init()")
https://github.com/jimc/linux.git dd-drm-fix

in testcase: boot

config: i386-randconfig-012-20260127
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------------------+------------+------------+
|                                                                               | bd091f80c8 | 80a26374d2 |
+-------------------------------------------------------------------------------+------------+------------+
| BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h | 0          | 12         |
+-------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601282112.3e252f09-lkp@intel.com



[    0.666972][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:323
[    0.668055][    T1] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
[    0.669517][    T1] preempt_count: 0, expected: 0
[    0.670309][    T1] RCU nest depth: 1, expected: 0
[    0.671155][    T1] 1 lock held by swapper/0/1:
[    0.672117][    T1]  #0: b2887bcc (rcu_read_lock){....}-{1:3}, at: dynamic_debug_init (lib/dynamic_debug.c:1797)
[    0.673765][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc7-00040-g80a26374d24c #1 PREEMPT(lazy)  e69b6cee1a878dce1581dfa5f5bb5383e6db0395
[    0.676021][    T1] Call Trace:
[    0.676021][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[    0.676021][    T1]  dump_stack (lib/dump_stack.c:130)
[    0.676021][    T1]  __might_resched (kernel/sched/core.c:8830)
[    0.676021][    T1]  ? mtree_store_range (lib/maple_tree.c:5938)
[    0.676021][    T1]  __might_sleep (kernel/sched/core.c:8759 (discriminator 17))
[    0.676021][    T1]  __kmalloc_cache_noprof (include/linux/kernel.h:61 include/linux/sched/mm.h:323 mm/slub.c:4904 mm/slub.c:5239 mm/slub.c:5775)
[    0.676021][    T1]  ? ddebug_add_module (include/linux/slab.h:957 (discriminator 3) include/linux/slab.h:1094 (discriminator 3) lib/dynamic_debug.c:1577 (discriminator 3))
[    0.676021][    T1]  ddebug_add_module (include/linux/slab.h:957 (discriminator 3) include/linux/slab.h:1094 (discriminator 3) lib/dynamic_debug.c:1577 (discriminator 3))
[    0.676021][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1811)
[    0.676021][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1769)
[    0.676021][    T1]  do_one_initcall (init/main.c:1378)
[    0.676021][    T1]  ? __register_sysctl_init (fs/proc/proc_sysctl.c:1467)
[    0.676021][    T1]  ? rest_init (init/main.c:1570)
[    0.676021][    T1]  ? init_mm_internals (mm/vmstat.c:2304)
[    0.676021][    T1]  ? rest_init (init/main.c:1570)
[    0.676021][    T1]  kernel_init_freeable (init/main.c:1483 init/main.c:1677)
[    0.676021][    T1]  kernel_init (init/main.c:1580)
[    0.676021][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.676021][    T1]  ? rest_init (init/main.c:1570)
[    0.676021][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.676021][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    0.676134][    T1]
[    0.676575][    T1] =============================
[    0.677188][    T1] [ BUG: Invalid wait context ]
[    0.677997][    T1] 6.19.0-rc7-00040-g80a26374d24c #1 Tainted: G        W
[    0.679361][    T1] -----------------------------
[    0.680021][    T1] swapper/0/1 is trying to lock:
[    0.680021][    T1] b29409d4 (ddebug_lock){....}-{4:4}, at: ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.680021][    T1] other info that might help us debug this:
[    0.680021][    T1] context-{5:5}
[    0.680021][    T1] 1 lock held by swapper/0/1:
[    0.680021][    T1]  #0: b2887bcc (rcu_read_lock){....}-{1:3}, at: dynamic_debug_init (lib/dynamic_debug.c:1797)
[    0.680021][    T1] stack backtrace:
[    0.680021][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.19.0-rc7-00040-g80a26374d24c #1 PREEMPT(lazy)  e69b6cee1a878dce1581dfa5f5bb5383e6db0395
[    0.680021][    T1] Tainted: [W]=WARN
[    0.680021][    T1] Call Trace:
[    0.680021][    T1]  dump_stack_lvl (lib/dump_stack.c:124)
[    0.680021][    T1]  dump_stack (lib/dump_stack.c:130)
[    0.680021][    T1]  __lock_acquire (kernel/locking/lockdep.c:4832 kernel/locking/lockdep.c:4902 kernel/locking/lockdep.c:5187)
[    0.680021][    T1]  ? trace_preempt_on (kernel/trace/trace_preemptirq.c:122)
[    0.680021][    T1]  lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[    0.680021][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.680021][    T1]  ? __mutex_lock (kernel/locking/mutex.c:614 kernel/locking/mutex.c:776)
[    0.680021][    T1]  __mutex_lock (arch/x86/include/asm/jump_label.h:37 include/trace/events/lock.h:95 kernel/locking/mutex.c:616 kernel/locking/mutex.c:776)
[    0.680021][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.680021][    T1]  ? ddebug_condense_sites (lib/dynamic_debug.c:1555)
[    0.680021][    T1]  ? ddebug_get_filename (lib/dynamic_debug.c:1520)
[    0.680021][    T1]  mutex_lock_nested (kernel/locking/mutex.c:829)
[    0.680021][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.680021][    T1]  ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.680021][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1811)
[    0.680021][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1769)
[    0.680021][    T1]  do_one_initcall (init/main.c:1378)
[    0.680021][    T1]  ? __register_sysctl_init (fs/proc/proc_sysctl.c:1467)
[    0.680021][    T1]  ? rest_init (init/main.c:1570)
[    0.680021][    T1]  ? init_mm_internals (mm/vmstat.c:2304)
[    0.680021][    T1]  ? rest_init (init/main.c:1570)
[    0.680021][    T1]  kernel_init_freeable (init/main.c:1483 init/main.c:1677)
[    0.680021][    T1]  kernel_init (init/main.c:1580)
[    0.680021][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.680021][    T1]  ? rest_init (init/main.c:1570)
[    0.680021][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.680021][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    0.684801][    T1] Memory: 2985172K/3145208K available (15891K kernel code, 5186K rwdata, 5772K rodata, 1056K init, 7324K bss, 154192K reserved, 0K cma-reserved, 1978248K highmem)
[    0.688021][    T1] devtmpfs: initialized


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260128/202601282112.3e252f09-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


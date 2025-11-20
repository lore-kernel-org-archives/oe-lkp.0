Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870CC247DE1
	for <oe-lkp@lists.linux.dev>; Thu, 20 Nov 2025 02:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607390; cv=fail; b=mXFWSpphcjmExQC62zgJSHtbXwfsfmD9amMgiWXO3Ws2sLq4uy5hu7x6uYhwM+EGw6FEnP0I2eH1v8nJUwdAPld6Q/tKezCEXgp972Mjw4udkBAdNhwECfSH6T+BLNOEwzE1Khypounj8lnu98ONRJA4ivkqT+fwobqa48PliEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607390; c=relaxed/simple;
	bh=fKCc8HEt6SQgIFsDZaldgKtW+9BBnf5R+J1PhwZmSJQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KEsWmM+m7AfV1cc56XICj3xhcNMoYH0qunePuzGJXC1m69udX6o0GNH2DMTP17HBBlqqR4+xaeJTMZyBoRkyxAQsaQ8SX7MWUjMjcggfH4QwZ0l3btiA5nORgEpwZbnzdOX/3582cVwKAgH4+kW5u4uwQy9zF0kiR/LZtSEFtGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meJ5lTxd; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meJ5lTxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763607388; x=1795143388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKCc8HEt6SQgIFsDZaldgKtW+9BBnf5R+J1PhwZmSJQ=;
  b=meJ5lTxdlD7vtntdfZYgWoNCN/idMnrSZSrQOxx8Nsldi+6tyiWlzVhD
   eX1pT2+e0s0eOjpAwKIaqZvhOql/fX01KMKPAv4gNEDE/9bvVCMhnes3U
   rAIsCaDzHOhAGsH6CR8ww4S0dl89DZVuKAHMhOoBhjQH9UhqzAKf1hfwP
   NXKAfpzI0eGRdPRa4XDonGFRIsJlUmVU/+JuEkdujyDFRtSMwlyO1GESd
   2Q3Qpqf++CuqmUtbmV6g5reYqrb6/6jtaHL9GkrE8C8tkRWyAXMpa7v0K
   vOBdRarP4+ti+j37n/UE3aULTdLSM/fvXISDEi60XUlnoGhuxQ1DaKGDk
   A==;
X-CSE-ConnectionGUID: ZIJqggiPSriE62TnWT2fqA==
X-CSE-MsgGUID: P9Vs6o9tRsKOi21EnSyukQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65822658"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65822658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 18:56:28 -0800
X-CSE-ConnectionGUID: NFJrF54wTpS0cEP3Pd4HHg==
X-CSE-MsgGUID: rzGdacniTOCLWWGbybeB6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="196367964"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 18:56:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 18:56:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 18:56:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 18:56:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG472OJEKgvEpui0M2/kBxOMBeks5k6HEXsgH/rTfuFigWCtk1vA+nKr0JZqyw8voM74emHxyV8u9IZEEzmG2PKjHdS9bCZ4TORiJ6MMT828eTbNwONAYtIcXkLgrW2RsKEz4+LAhdqwctJF+s85CBlcniCeNiyc/piLNOZyXl8GH3fWyX7doQyLOUWpo8yGoXo2JYYf3Of+kobJxYB3qCgkNldiHy11rF5vv2ruX1shKvv5R8grD2WK28XmHEZ30yrVBLuplc68uZ+koH8avMUouRw6lAnSzLK+nlvw1nhNRiqbiAv2WR0hhSFcLzGqOQNbzq+ftn4LPLb9X1gnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAIgUcCxfAzSmNO8/PEMWDtfttwiXF7KuYIwGJIOOug=;
 b=ivOdaSPFm+ooB6CdJql+Pueipxc5HLSrwNpesknNZXUytCZBB16KH1+FcHmjjs1tO1HEk75FfTTqFMGqReAxA1RNwLLfza5Fl6nm2S7EjceYwi2DHno4vap6+wmZZ0Y0L4aw2xVzev+59YwhHL2xIXT06svLnLxBWB4jdo4Z/Ew4tN9LxhNIzNPAGb+bDAlrcbMPjm5Isx1WSQzI+20D047P2Fne7n4SIJJ9oHb4Od7wbcAoVtUAJMhquiFOrDwjx3xlaCCD7lWf/TZuw0A1omiN1n8kWmLn+q5q+iKzWOz9ueUvRg8P0p9c3jkfWp7VXDG+lx62Myc2aQpbZtGtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 02:56:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 02:56:20 +0000
Date: Thu, 20 Nov 2025 10:56:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Dave Hansen
	<dave.hansen@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [daveh-devel:old-ucode-platform] [x86/microcode]  19fb9a6d87:
 UBSAN:shift-out-of-bounds_in_arch/x86/kernel/cpu/match.c
Message-ID: <202511200314.3033cba4-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 5351083e-1eec-48f4-9e75-08de27e061c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TjGRlhthzT4nllY96DZYkiyw8daEWkro51DQZms2f+o00HB3kfWpHh7VIHAZ?=
 =?us-ascii?Q?Gc43p1A8hOnJYqEgHSTCC+c15Ppe0pUB2eTitRiVlq80w+E2Ljjlc8z+FDia?=
 =?us-ascii?Q?nwlD6nbVg9x6Q5uwGTPPw7TA3eoFvpllKzZPObDID03dQSSwacFD/S0YmMUo?=
 =?us-ascii?Q?ejczE/QtkCCwz7Px15bAM7wk4u5ITWqx4MwHQ3IUqFI0abOjjMIaUXFml+2G?=
 =?us-ascii?Q?A155c2xn6eME4HSCEfSCXT4k9VpbkTkzWGb1BblBvbpDyEdvGJzpojVco/Un?=
 =?us-ascii?Q?mErykrcGpY6gZZPF4VMXRnAKRMcUeUbZ/WvsTtqWao1I4RkMDgEOo4sWRdpJ?=
 =?us-ascii?Q?Z18IHWCA8RzVgloqbLZcHxZ7P3/55B5RhN1sxaO9q5ya4nv5eUMeKTQD+37N?=
 =?us-ascii?Q?OOb5Y9G3vyPdAMPRAJOjDEOIM63zXsNvvC6/xE17Os3lePhIdbzLY+cWGQCS?=
 =?us-ascii?Q?Dhn2kal1wSxtunoP8FYCfZj7Rl0ZlURUZi2VYM26OtYjQ0+CPeGUHb5ql3Fj?=
 =?us-ascii?Q?IqQk3n0jb/lRsBs9lq4nShaUWLAzuaW+VjjMtQqX926TuI5fdgbhfiL29Ul8?=
 =?us-ascii?Q?XXSC7P+mWcIoriz/jMT/tfjfYuAICxR1G+NhzltlbIgLuUNxekgWLJ6VME5u?=
 =?us-ascii?Q?roV3P0vbZWiNkgIV0qu+ulgWpCXcZ+X9RtZVcZrJcJh0ZXAUqEJM5GAzkwZQ?=
 =?us-ascii?Q?QBzWxrviyQZoN6N7C8/d7ySdRXdxVOF/IotCW1R26q+D3Rid/gTl2IUrq9P2?=
 =?us-ascii?Q?9B+sSf8fSXN5JHc8zm1g3rRDeRPvd/5CEZpx6BH/XlQobxM+YGOwspk3xlyD?=
 =?us-ascii?Q?K1lTR2O3q+ZM7tMvgDO8yfGbYFAeEgQ+nJeQUanTndDn485i3ybZBtXNfy8m?=
 =?us-ascii?Q?XNj+Da1s3PwYfda56p3N84Z+65BivJtWQr4AYDnkxYe/9xE1PHPCfdkeWM2y?=
 =?us-ascii?Q?2pvJeUhBWc4CWTkKCBqB9ofY9E+MnLSvAOFOAyiPgWauBgH0HujdfZ9qkG5M?=
 =?us-ascii?Q?gtSeT1ZjwF+t5E7KDYWSJ4zG4udUBT7gYI3RZfgW83MOdhA+cP6k+2g8UX13?=
 =?us-ascii?Q?C6Rore6ygw5Kg4YIW8AQvG9xWQUKMzo3NL92XI1tle2Cnkz5oJaKg5sgZEmW?=
 =?us-ascii?Q?iEYdX7lxJsruaTcuzzwHtMEkrOljX3pshUOgmlGM4IuPuRiJfnfj44Cu1hb4?=
 =?us-ascii?Q?cpfjpUurQaPD3UhbcKIgCoe80pmbY7/1HowWQ/TnvBOo7PnNUyJQKjDYRvuo?=
 =?us-ascii?Q?ftl3DG/Q2om7RYLCbwDlawZAfhXxdLTdlLKHvdLWLgA0y5iKNn1udj9KJbwe?=
 =?us-ascii?Q?V35fauxxqPmT6ZugxUr7bFHCWu4dWw3fxzymXpgxp6mBe7L2fML0ZpCg1C/e?=
 =?us-ascii?Q?/PqVEj576HuyfzH4LPdTrAhSwfccxAH9N0ELqDdQVLqFCpUKuoUozSVp+CVI?=
 =?us-ascii?Q?8Z8/BSg5MJYNR8QZOXzJbtJlAXQsGvmdIeqCFogWZbwXzHbFzaZfwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4riIRjeAGYSyRYHcOc9F9LN6NunLPPPBBGhHUSlXmENzyaWuZ+5IMfduKFna?=
 =?us-ascii?Q?kRDrmBAJQ0xtNFdVQQGZ/ZXauQLEWxQFGuyXfKgPnBusGvBeK0vrRuUe3HJU?=
 =?us-ascii?Q?2oUDwhgWnhKmrYqx7AcS3yrkHNH4rCjPVn/6BU+2T6EM/9u8lFbYyDLcGXOO?=
 =?us-ascii?Q?nenre/6UGgXYMYDwenZVi4yHteN9V1otRSAOKHeyQ61iO4dU9e1YrwUR98Jp?=
 =?us-ascii?Q?GzoF8abHd7BqO8auPCkV5f6apu2kjOuj6K0cujfzbegcuyuMg8epqFh/OuU5?=
 =?us-ascii?Q?qLaUFbOCZcWDCICmMo7T1xPlq5NNRCaeD/6QAiBq++rHWeQhr46xaCkntagY?=
 =?us-ascii?Q?G8KrS7x15EE0RuqBIeM4h7THI1Ad7M9/IlneMdms2jMBM3/6VfPNBRXMq1Cr?=
 =?us-ascii?Q?jijP4uUURDyGKPq7hBT/b+WTN6zCM/tDmb+XotKO91y+i/pZ7yI4nPXSEjyI?=
 =?us-ascii?Q?XJFOWy2AHMed85xj1MPPwblUQhqItXEjmiwYn2hH8HZD5bWg0kZ8MnzO4XwY?=
 =?us-ascii?Q?hzFg+ARiTok0T76j5o4IiQuPXymI6IKHx6IHMb1X6aTVRMklEBJoai9CVUrL?=
 =?us-ascii?Q?7v9LHZ1kfb6KL1Cva77tDjC9LH0WGokiDCcAULc/kBP5UGEyMhUd+vrPVVK8?=
 =?us-ascii?Q?jAQEQD2GMHBj6Ez00Pur3gPi+6Z/xJUn/KVQKWoIbr0rA0KjI0Z/NTdM8rkh?=
 =?us-ascii?Q?wa4eY8BpgFJ2cayk5RCQKfiBGt6gTgxxc0bVwEk2PJEOsztXoFPT68mxagtJ?=
 =?us-ascii?Q?qpuTeled/VPfTsbbeRRXN6W/ojnsioloQMbp92XEN5Mj/B/2vM1t5WyH0bZl?=
 =?us-ascii?Q?q+QdPc5woR6RPC03ni+NPZt3qZaKaHs6qag6d0xSAMoJNZPcPyxqAQyagdfH?=
 =?us-ascii?Q?1J6tfLWV7X2waPfV6lA2pE/avG4se+5JmW/bwlkxvGdj7Vyyqv+AXulNIQEy?=
 =?us-ascii?Q?I29kjwxHO4j+vaf6LEwbcfHvWLNPCkqZTx3WPMUX+CmeGVbhNv7KhZsiCu4F?=
 =?us-ascii?Q?HrfRYZCb2XbSi7fL4RhlCaYsGa1zcgpQYJ15+4O48mMf8/knkS3JXcb+A0hH?=
 =?us-ascii?Q?DXzaQH97vKPv9zOz7Atf6CIZYbH4TOeJYv1SXmWVPO+p25nH0258I9NyvGec?=
 =?us-ascii?Q?8IXkviPK4CnNY/mWdBz2s/Orc3eBxiLtSHCOdfnUuK6OEktGBFRa2A2Kovp8?=
 =?us-ascii?Q?63JiBdN9KG3NHIAKuvK0tEqYHgVBYFC7mE7OBuHl+lg2ELONcoCDc29DSh0H?=
 =?us-ascii?Q?qb4sAfWIKm5vbhV9xwV3TIahjAOR4zW+5b/AICS8tCXFt+IXbEI5z8bycsZX?=
 =?us-ascii?Q?RcnI90FVv/b7sm8+4ZyLsIiQLxPTM2lQqzqk+/A0xqcynQFLM9rD9TVpFoLe?=
 =?us-ascii?Q?Ae0WFZPsQGTDP9JmBLbrwznCLDQAIVlVfamp+RkwX3KFrLlkyTRjnroqkeGm?=
 =?us-ascii?Q?I2g069tIBqQSunUQyocIXZDAvzf9X5ZMZzHtzK7sQZXfZoJJL+FMKSrN7Oab?=
 =?us-ascii?Q?qaXdWD28564zOcx5DT0J2pljQWND6EbJLo8UnFfSI91gi1bQ8bbodN6ByDCH?=
 =?us-ascii?Q?U1bX3UW9rRYR4VOixRG00StOl31+vcJjqVcGIJ314ImgUhy/lWIj3ALqhd36?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5351083e-1eec-48f4-9e75-08de27e061c7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 02:56:20.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xIXSCaU/vP2e2cXRHUOZdKWQCoeaSyLBmZwmR6OoryJKLjAgg3+GJZ+/ygPb6xlV+gQlpYNNeJURU0xDfwkBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_arch/x86/kernel/cpu/match.c" on:

commit: 19fb9a6d870e83926b240ba86a3e35870fa2e578 ("x86/microcode: Add platform mask to Intel microcode version list")
https://git.kernel.org/cgit/linux/kernel/git/daveh/devel.git old-ucode-platform

in testcase: lkvs
version: lkvs-x86_64-6d7ca2c-1_20251014
with following parameters:

	test: cstate-client



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 22 threads 1 sockets Intel(R) Core(TM) Ultra 9 185H @ 4.5GHz (Meteor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511200314.3033cba4-lkp@intel.com


kern  :warn  : [    0.000000] [      T0] ------------[ cut here ]------------
kern  :err   : [    0.000000] [      T0] UBSAN: shift-out-of-bounds in arch/x86/kernel/cpu/match.c:80:9
kern  :err   : [    0.000000] [      T0] shift exponent 128 is too large for 64-bit type 'long unsigned int'
kern  :warn  : [    0.000000] [      T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.0-rc5-00007-g19fb9a6d870e #1 PREEMPT(undef)
kern  :warn  : [    0.000000] [      T0] Call Trace:
kern  :warn  : [    0.000000] [      T0]  <TASK>
kern  :warn  : [    0.000000] [      T0]  ? dump_stack_lvl (lib/dump_stack.c:122)
kern  :warn  : [    0.000000] [      T0]  ? ubsan_epilogue (lib/ubsan.c:234 (discriminator 1))
kern  :warn  : [    0.000000] [      T0]  ? __ubsan_handle_shift_out_of_bounds.cold (lib/ubsan.c:494)
kern  :warn  : [    0.000000] [      T0]  ? __pfx_check_cpufeature_deps (arch/x86/kernel/cpu/cpuid-deps.c:172)
kern  :warn  : [    0.000000] [      T0]  ? x86_match_cpu.cold (arch/x86/kernel/cpu/match.c:80)
kern  :warn  : [    0.000000] [      T0]  ? cpu_set_bug_bits+0x18/0x1980
kern  :warn  : [    0.000000] [      T0]  ? early_identify_cpu+0x1d2/0x270
kern  :warn  : [    0.000000] [      T0]  ? setup_arch (arch/x86/kernel/setup.c:934)
kern  :warn  : [    0.000000] [      T0]  ? mutex_lock (arch/x86/include/asm/atomic64_64.h:101 (discriminator 5) include/linux/atomic/atomic-arch-fallback.h:4296 (discriminator 5) include/linux/atomic/atomic-long.h:1482 (discriminator 5) include/linux/atomic/atomic-instrumented.h:4458 (discriminator 5) kernel/locking/mutex.c:157 (discriminator 5) kernel/locking/mutex.c:273 (discriminator 5))
kern  :warn  : [    0.000000] [      T0]  ? __pfx_setup_arch (arch/x86/kernel/setup.c:881)
kern  :warn  : [    0.000000] [      T0]  ? _printk (kernel/printk/printk.c:2443)
kern  :warn  : [    0.000000] [      T0]  ? __pfx__printk (kernel/printk/printk.c:2443)
kern  :warn  : [    0.000000] [      T0]  ? cgroup_init_early (kernel/cgroup/cgroup.c:6327 (discriminator 3))
kern  :warn  : [    0.000000] [      T0]  ? start_kernel (init/main.c:934)
kern  :warn  : [    0.000000] [      T0]  ? x86_64_start_reservations (arch/x86/kernel/head64.c:310)
kern  :warn  : [    0.000000] [      T0]  ? x86_64_start_kernel (??:?)
kern  :warn  : [    0.000000] [      T0]  ? common_startup_64 (arch/x86/kernel/head_64.S:419)
kern  :warn  : [    0.000000] [      T0]  </TASK>
kern  :warn  : [    0.000000] [      T0] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251120/202511200314.3033cba4-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


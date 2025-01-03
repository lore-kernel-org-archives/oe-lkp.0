Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B31C4A29
	for <oe-lkp@lists.linux.dev>; Fri,  3 Jan 2025 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895120; cv=fail; b=raZQ07I9ShXHBm618NdsQXkGeXaWVTuQiGFkmlxdqmrsQ2IxqtDP8X695fiGlNxOaoF9pCPHl33PdtPKlT2byBhqcHGmPolG9y4ugylkHdOTdyLMkgZBo1vcY1HKHwxwMT8lPhkip8sGkJeXnKvKce4UTdhLIjWIL3wC8RsAGY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895120; c=relaxed/simple;
	bh=K2J3EiZRXySgAGrT6t6tZNv7/hrbKS7enuS8jlrtV4E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bfRnpEatnJBow7emr+4QmRXAMrEzTMJRTI58JSWOsm+YeJE9bnzzcdx5KCt64Mg169ZaQFF47SN/T7Z+5LF4Q+3x35eveX/znoRzSVnV9wNg8Wq79MLo6Cyk56EZ6PJKknZSyicRLMIc86g6KoL670dvIM2GHPddwl5VNZY8GQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwKaEifZ; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwKaEifZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735895119; x=1767431119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2J3EiZRXySgAGrT6t6tZNv7/hrbKS7enuS8jlrtV4E=;
  b=OwKaEifZj5cjInsXOzZuk/opKnWip5OpoSPCKXAoS3tOqDhb380QiIzL
   oammEKkXTSkcQJ2i0I9rVD60jbvjBO1plCUpzai0WlsBJn0Mq4cZGSTLh
   Rpre6MpGBxiMwTXXO5tr90XgWEwYFSC8wpolgzgmcLlTSbuAFaTVOl5ko
   uoaF6Q/WkIjXkucpc95ZUtTEap9WUTjqy25RahQvG7w0MK9Bg5vf8gfW2
   xbEg4FoLLXTaOCk1CQvgpf3ZvXvtbhyH0IVaD5PgsYHlIREga1VkbfYGd
   tpE8oStUBD3mujWe1iejagtrnGsHNJRYCeTMn8mLPX1+mXXmx5UwMfdhj
   A==;
X-CSE-ConnectionGUID: PXXhvyiRRs65UEX/ZDqOog==
X-CSE-MsgGUID: 3un3LLfxQUqIlNGORaj01w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36256870"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36256870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:05:14 -0800
X-CSE-ConnectionGUID: zAwVpRZARDO+/CnfWDP/7A==
X-CSE-MsgGUID: Zd7e2oVRRc+aPgnQFEGCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106784243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2025 01:05:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 01:05:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 01:05:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 01:05:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnGz2bznbZ2foPkRWqAMUkoDABb/HqfkDGXlvevheLUHRwTUxNf/+zUkF5yRJtXYmgSngps0oZGiii7PwZ0GnDzIsNjdjRw6S3x1/daAjJzxE7xqCN+2w4eAk35ygZEwC3YBBUT1jYPZ00Y+2fVc1fe661AE0EHPtW3Xv5XXcId8XZLI2BRKTKpLo2A6nCj7uWwxIbqFInwel5kBikZZ6Rzox8zOy5OgpDaGTCzLRuh+mrojgUb4MCcvTz2/VWM+EegUBt+Nw7zWvOKtPk9Gn60gDaR2GhYHQfwJ+wFAgDrOAqzggJryp5X4KY6oQ7WljKri4GC1bWkUVLNMCq1kIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw/sy4RsKIRdoF+xt5uBZ5F2hdEKhmbq0WgVnfRxBDY=;
 b=ytU3m5h3YJ5R+U6QjO+GxdOV1hSgfrb3fkBdDjQl5YIOiwcHEnal2u9RaBVdwPLaWTBeIp9AmFWaK2ra9/SPokTIJFJJi2LKIjtXwHLHWxpN1IT6Lo8aGIC7EwL/FuwiiRC8I/8av1BXWMgRqcsubtjA7pYc7CNxp/umcCgG8NTEqAI+7ygPKozfGR+jgRZDXj6qrj4ppi/DlCWbKEZ3Muizl5vtU3ZxLaV2DvvNPBtu5u13V6XMSzO80VtewoQOC6JJk1pSWnfletu2sHDXSc2G71bB8bGd5vi/DtL9FM/hI9E7eOjr7ki4VESI9nfv6gdxPEJaCvysK05kXQXtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 09:05:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 09:05:06 +0000
Date: Fri, 3 Jan 2025 17:04:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [timers]  7ee9887703: hwsim.ap_ft_ptk_rekey.fail
Message-ID: <202501031602.d67a065d-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b8e36e-f159-4bc4-2875-08dd2bd5b784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pyjdba8hWj4TWXBOHc+BUfhUjKEZ2oac01KJuKUslDVyLlKKmOz2fHgAN/0Z?=
 =?us-ascii?Q?Z1i9HV/eWDrkrvHqD0k7e11ND09GyAl+77BEM+/DD4tIRhUS8fsCMPZU6LWA?=
 =?us-ascii?Q?cXj9PT2aYFyAX1Sw+q/uRNz0g5TDn72ohR77aRiAFgLsWBW81WJjqF2bHWjG?=
 =?us-ascii?Q?XsQMgk2FUpYjYf9Sff6I/Sqot+3IWFJM+otVNF8iNwtNgbSAAarwGjvKJOlJ?=
 =?us-ascii?Q?s7+XqpBDa+T3TcqCf0ujzHLIB9f10KBYwtUjFh7Y+CMA9LWUgT8aT6fPMOoG?=
 =?us-ascii?Q?lhbntJOUG2Xj1WWyiASTAq5ZvEv69J4tCzs0SEc+mrc1YRs3kHEonuiF9oF9?=
 =?us-ascii?Q?N6fonB2RgolEWHBNsm5O+UdgaXxHxq3O/HTHmcnlqk7elxhtKxj7gpeM2EI3?=
 =?us-ascii?Q?KyYeEv97lES+/3zu9LknCSEtF5QK/GpRFUxdAwg9dtKaQrcFAno76mfU2NOk?=
 =?us-ascii?Q?/kreMLnJWgGdmqrb8rD7Y8tX5+yVbkrp1EDkoJBoZ+e9dIT1rpDsOJGnZIbC?=
 =?us-ascii?Q?jTqfRCDMyLwmDE8NmnLUioN3Y03pdcR9CR2C7Awmn9Hs8H4U25SlPQuWyJyA?=
 =?us-ascii?Q?odWlTmLB6h+ZRjgaRl8uRK8FhwcEonNHgz3WGlkQ28vQlAMc7gZxAUoxP7jr?=
 =?us-ascii?Q?TUt2FENnROhRJ6o/7MRf8bS9KVd3PInorp1I6PgxxuC8aG4eG8HFxzKi3LA9?=
 =?us-ascii?Q?x2KQLIO7KKrY3e7YFuZPBMQFI5k23eOb1GoJZU7fCEeHrf2nevEh0uql6wOV?=
 =?us-ascii?Q?WYCLrQLJFWl7aQdbhTMRMriocuWVRHgLr6h39jgtTyoqwBUoSP5wmfW3qnl2?=
 =?us-ascii?Q?+0+S+K7D9FBc/o3QjF7lo5BR2U77zw4CCTQD0QAZStzRMYFf2t5/NSIZ41l4?=
 =?us-ascii?Q?qHtT3vTWtqv9ia/U40fxbDQwaIoPso+Cl07BvdTiK/oDCtaq10gLqDinHP/N?=
 =?us-ascii?Q?v+zaRBwfvMaGW7+i0jDMmJdv0gB3cDG59uxWQPZidQTLREtBD1NML6d10VSe?=
 =?us-ascii?Q?+8Fiz8h0D2Gbvv75zKgQlQiDkKW3nH0ZxF1yZV+YdtvVxsn/HN8p7zc+KqNq?=
 =?us-ascii?Q?6uIgggaaUDtyOzPgPk54hYFdf8ETXfXP+SPb6x8vVUzONP7m84koQQQiSaTG?=
 =?us-ascii?Q?qKR+pnvhf3XuxB5O73srMg2NyjfL1BfgeLjG0X81DQNgt9y9L3uFfBJtg6eJ?=
 =?us-ascii?Q?MpLLzyVmXbeNFPuXGogQqg2Nq99xtAqEEBGAIeKH2PSFzyvwzb4KO7GsbwO5?=
 =?us-ascii?Q?IPJLf5Vils6R69KK4QM7pyVAdskNUGijjgyZAPlmwS9XwNBEqPxyGesmM+CC?=
 =?us-ascii?Q?1LwHNg5rRk/Qz/QVOQKM3I7ZTDu6oaqTFmJW2Q6+Z78+LQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gtpYKjuvrxQtaczUK7u/OBpOHCKP7hp2n04dh8IT+cB8ihiu8Rn5u4+vPoZV?=
 =?us-ascii?Q?vzEMTKtaHqGeS0XVB7CRy/4QnC6dmq6c4lEsQRK0NOEEeekuqYvkoB5HuHgm?=
 =?us-ascii?Q?9BVSkq3G/jGQW0lkgErnrdjJ8PQUkYjkaLgStIBtUTGehUFdVgVhkVmFNsUC?=
 =?us-ascii?Q?W7j/MLSK1vTGbk+aTT6q6lp1psH0zsldhrD1En+tus9H+UedDmq9B0gDtzb1?=
 =?us-ascii?Q?omvYUQ/6uOpR+xUg48OHPzTdRe8sXtid+mFmqPFh4tc1ebI08l2D2aNxLZTx?=
 =?us-ascii?Q?b7JqLsk8rLe6UyjUGiosPy7NkaAQF9XowEFGAUzjRhwOy4gaLxVWklHH470h?=
 =?us-ascii?Q?PLOn1x++Xie4Ty9+4xokjCx578kbzhY/sKvCPKHIO36LleTxXRqv+8Y20kWe?=
 =?us-ascii?Q?aezdAcmhnpX1Xx+30arHg8RKj97Ait5svpqRWw8jz8H+9UP2mmB19lp4WLEw?=
 =?us-ascii?Q?eAA9PZukxl19qdCBGBSrmVH+soj43E1rFe0aX/hfweUwVFBnM84NnjS/3gJC?=
 =?us-ascii?Q?lHkz7S1fNI7AEYe/ZGNRV2lzUOMnPZVxmRX4jLwv+oe4R9AOz91KmxetDWA5?=
 =?us-ascii?Q?M2HYljeMea15mW+8F5z3p2Oyt2HN4dYmugivWCJgJkRN8H83KrXwN+gqFHCs?=
 =?us-ascii?Q?rZADbxbYMqjcn6+a7aIKYoPsPxZLRQRd+G6YzdKuPCH6DeAkUY3TM41r6CJF?=
 =?us-ascii?Q?D19XJpeTaGSa7fOvVoIArPqW4hVu8YKSSpsndKzqReg3tJaLpkI5KXP5Ak4j?=
 =?us-ascii?Q?5iT8tMbUrXWhmDwR9xIebG/WhpR1o/zI16UHcHCmnYQjIMebjABcP695JilD?=
 =?us-ascii?Q?wNWmuciPqj+/q5Tr/ehrKGHwLK1bdGFYlWw1TBFQJnWrUlspOUFajjsfffa/?=
 =?us-ascii?Q?yDaC4Db0igq8Ougs42HGshOBAnjgJYZDV0t6hsFr0WQbj5n3lMZcpQKzU4uf?=
 =?us-ascii?Q?bOc1dXH7hzbxAQ0mQ0rPBqWhvEpFoRAz01OKTF3DXhotWnBpWhOASBUCJo7H?=
 =?us-ascii?Q?swmmVTpuHF155K0rtGkA2VuLhx2myKclZxaBcK8CFnuA4DxYS1ccKnm6qYi3?=
 =?us-ascii?Q?AX5oEwMObviFugrV1odtB6k/lTbuKJFCoNL4ZKoqV6osVBlcV88R/g8Ii/SY?=
 =?us-ascii?Q?CSOBPUfnnraa8oonGP7Rjduv9GNHOFaAXcJteRNnlOSjROtRDqzGdLz7tudk?=
 =?us-ascii?Q?6oa3/TA9JKOYTUstkSwjKXdekoT9EYlUwiOSWROoTByzs3AQYiBDMqPB+bt5?=
 =?us-ascii?Q?EO4nphUfIHHdt8l7v8Uq6b8TjCfWdXVaOlt82J+mm0LrCpzHr1zRUQ+Vx7tu?=
 =?us-ascii?Q?13VHMmqN2/264p+H7YC/dNovavkqB9eXq+QB8vioeO4RJUtGXBb/NYryl2B1?=
 =?us-ascii?Q?M1NIULSceScZdfCNjNb/qYU1t7lfNmivZAhfEtff3MIPZrmzpjSQxStFBOGz?=
 =?us-ascii?Q?odxAXUR3n10Cdo/so5JYjpIAan2DUXaZuqFJ++nO6U1YfZK5+6y/kC6UdQdh?=
 =?us-ascii?Q?dU/zTziw51nHhW0Oe1MDCd+PdrgXeTRvln1/Qn3Lln2BJmRpD9Wt6v5gdWx2?=
 =?us-ascii?Q?dxOxXzo7l5RVkUj73Nfy8J6vWTOOSVM/qUtCzJF61tCsvoZcX3cYbe/pKiuk?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b8e36e-f159-4bc4-2875-08dd2bd5b784
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:05:06.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0wfEcaFzCoqZxxLp5tn3vfFBMqKKiizv0r3cXheEe/iBYHE8sptukdPj6G/izWbAhqyff2TP2XP5g9S96D/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "hwsim.ap_ft_ptk_rekey.fail" on:

commit: 7ee988770326fca440472200c3eb58935fe712f6 ("timers: Implement the hierarchical pull model")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      ccb98ccef0e543c2bd4ef1a72270461957f3d8d0]
[test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]
[test failed on fix commit        10a0e6f3d3db7dcfe36e578923e5f038f1d2b72a]

in testcase: hwsim
version: hwsim-x86_64-4ea2c336d-1_20241103
with following parameters:

	test: ap_ft_ptk_rekey



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

in our tests,
the case still has random chance to pass on 7ee9887703, though fail mostly.
the case keeps pass on parent.

57e95a5c4117dc6a 7ee988770326fca440472200c3e
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :30          90%          27:30    hwsim.ap_ft_ptk_rekey.fail



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501031602.d67a065d-lkp@intel.com

group: , test: ap_ft_ptk_rekey
2025-01-02 08:18:54 export USER=root
2025-01-02 08:18:54 ./build.sh
Building TNC testing tools
Building wlantest
Building hs20-osu-client
Building hostapd
Building wpa_supplicant
2025-01-02 08:19:27 ./start.sh
2025-01-02 08:19:28 ./run-tests.py ap_ft_ptk_rekey
DEV: wlan0: 02:00:00:00:00:00
DEV: wlan1: 02:00:00:00:01:00
DEV: wlan2: 02:00:00:00:02:00
APDEV: wlan3
APDEV: wlan4
START ap_ft_ptk_rekey 1/1
Test: WPA2-PSK-FT PTK rekeying triggered by station after roam
Starting AP wlan3
Starting AP wlan4
Connect to first AP
Connect STA wlan0 to AP
Roam to the second AP
Roam back to the first AP
No event received after roam
Traceback (most recent call last):
  File "/lkp/benchmarks/hwsim/tests/hwsim/./run-tests.py", line 591, in main
    t(dev, apdev)
  File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_ft.py", line 3087, in test_ap_ft_ptk_rekey
    check_ptk_rekey(dev[0], hapd0, hapd1)
  File "/lkp/benchmarks/hwsim/tests/hwsim/test_ap_ft.py", line 3070, in check_ptk_rekey
    raise Exception("No event received after roam")
Exception: No event received after roam
FAIL ap_ft_ptk_rekey 8.199333 2025-01-02 08:19:38.095711
passed 0 test case(s)
skipped 0 test case(s)
failed tests: ap_ft_ptk_rekey



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250103/202501031602.d67a065d-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


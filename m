Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269B1F03E5
	for <oe-lkp@lists.linux.dev>; Tue,  4 Mar 2025 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741064493; cv=fail; b=JTAScyrldUpOQhrG8Rl+dje6MPgHyscOlYezBTpfUE5KZy6fhHeSUV6kU6x85scowqj1BY8zUCQe+pjfZtsRuvealofGxOiqfULLi/6MPUfjZK/nFpgAJKP4XQcec0HAUMbrnAwEuFwYcILQP889Q7GxSKmfxol6EO75h6e7Yz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741064493; c=relaxed/simple;
	bh=P0q4EsHw8ZAWHpHYhJJp8axxEfFp8o3TzfhyIEAJlVs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lMTg/RPZ6tsAAiGd1mreSAWgXa0JLhupXRYsu1Pb5h+g+3cmU26mtM44uOiouEsclSZtAYZpALTfpeKABlwkx5mb4HnvvgmhyhqTE+LjYZXvr/du+2VIY7oCVql6mTvHz2sHGw9k8vdJwHm0ZOSGXbxkOsJFb49T4A9KEQpCrJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgXj1imM; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgXj1imM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741064492; x=1772600492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0q4EsHw8ZAWHpHYhJJp8axxEfFp8o3TzfhyIEAJlVs=;
  b=RgXj1imMuYLSUbCpYQgiyQthiFoaytOYZ68RfMxrT+X3jKrLCWHkj1lM
   BYYR72nt+0Zvn37fvCXdqqS5FoMrQCJfGeFHI7muuhHHbH6I3lXqagtFY
   eSRTs0Vnr5EDrFU+T3xEwpXuYKNZYz5JTce2tk4CYHj3AHuzbFWCCR1DS
   8YgplzE1LRDnb7BBoXYxrzmh1LkJ+ZCpvOMvrcRbrWbcKoBOqGkwu1W5d
   OxH27w9WsILijCCtBTDlKLn3MQ7sOgdGH14Ny6t+Lg+1Dm8LFyuv8hMnv
   uLm6lEm5oOmESOFEsWTnOcXgWfhfZRHipid0vVB9llKedWJVV8v2iqkFC
   w==;
X-CSE-ConnectionGUID: hyaK2KD5QM6uzT2OqeMqTg==
X-CSE-MsgGUID: WT9AoaSwQ2mOctIVMnn+ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="67334675"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="67334675"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:01:30 -0800
X-CSE-ConnectionGUID: KBZk41GbSPSZssUJfDKeIg==
X-CSE-MsgGUID: 1+cU146RR0CEImwIvXYGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118238906"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2025 21:01:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 21:01:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 21:01:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 21:01:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeNQ/dw3RLiy8uFfvP82HNJlZxjSXYu908H3TfbJjPo6FgnA+xE5Sr29g28LIdISaffIKLY0eMf1llppvjeLOsSh2nNTohdntEFcT/7H9IMo+I3pfHEHJL2F0wG6M/gFS7BK8B8pLDsxaR/w1VW02zGXQbydKFHLxenR4JIuVwl+cm7mV97zrT+hhdUyEDzHnThDBRngKweys+sLqCyw0thK4VMZAHhPgHtR46ZtFp5rmi7ADG9MMW1MY9EHfMjcRvxWZK3jIbDPge/n1lxhPfymQwn2cnOu4InaltrwqVVT/2eLbJ6caUmIetAeTD5X8oEmUmUgp+7c0MCLTsbkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGSifxjaifXSAy67rtOPKsgnr+vdzurAiymoZguo3yg=;
 b=AxkT1LF3dpiYpgS65x5qobXLjCW1mV8HIr3GQW59CbpEmISC4uMjobpOmPhbegFtLVg3XtPk8uPGynXSQo/M4QUUYgqySwhdBhhzzplg9cMT2vlSHzglX2bUKoh9KJ7MD73Z5SNtUqYwodipggkkPegUOYwZVNxq+O4GkMScFkr+fJUMymKkFAiG3rhUIX1FKKgTDQW4zQWG2P45iyb5h1Ou1MMLhPVrHeppkO5r/3Cz1g8/8k2s3DiOmDrlMWFVu1gi4GGoirUlpPG0pRUrOLnKqvcCt9aWc/X03ngQbsaAge+E73CXFWy7DmFUvzGvZYwT+oXDC/Wjhy40BQlpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 05:00:56 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 05:00:55 +0000
Date: Tue, 4 Mar 2025 13:00:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/posix] [posix]  b4492e38f4:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_KASAN
Message-ID: <202503041039.d6c1edfa-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 448860c8-d9e7-4a55-5fc7-08dd5ad98bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+5BWB9L95cJGXQlCtWpGTmM2kqVDohHjhQsray8wWu/25JkgILtp2rNHdUKP?=
 =?us-ascii?Q?q8CxsgDAOHjXfrscx4swm7AO/muHP4if73oRGckkdc7dIeZIZlqLdGt2uobJ?=
 =?us-ascii?Q?AlVerZ1aR0qzpqoj5PGF/Z5fKjDjQb02UZJAwn4J/LH09Vs6bTZNXmZkeRIx?=
 =?us-ascii?Q?xso5CKpmC3KBwSZflqkA42hhyIjxIWWCPiKzFFSb7kcScxql5v927KSy78kC?=
 =?us-ascii?Q?GW42gMxqfU+PPcUIUrk5N/guWfnPgG+YLFjgdnbBVOxICh92gvHA32ozMXgJ?=
 =?us-ascii?Q?V7IdgBsgob71o+vZMzUqe46GELlPtcwI87KiZoxrCqCEdgiHewGfKi2y+kXh?=
 =?us-ascii?Q?uXaZm4tNc7/Z5Wu9fuX/1SkCXHJDH1G8joi4IsnXw5UDD+ntDaZhodDH34E3?=
 =?us-ascii?Q?HdmBYfCN91wYi9DZ/qIVhRJ+tkvM3s0f9xjyqT2YKaqC7YxG86ntFKtfuUrf?=
 =?us-ascii?Q?w/G2+XydjHYIWBSMv2xgq76mhX8oHN4lrYTpfA/8NHsPhwSyMPoOu/vIKkcM?=
 =?us-ascii?Q?HwZBnlpeP+q7iae3r8Nmu477RvHArVDPL0isq43EdQkHjDMbLSRwvlX9IQRM?=
 =?us-ascii?Q?NJPinv2jnh9znXI+VwU/HBVKHk0JCGq6KS0tgnh/dEM0jVFb+Y+t6/oOUJUJ?=
 =?us-ascii?Q?Q8ttq/6pOZnv2GAl7OXpvbSaHdqvr8fwkzVXm5JL3+yMjUmEPVKS3puKarTD?=
 =?us-ascii?Q?QdNkdsYHnG9y4MITgD7u4hiFieMvHjhdw5ABzvsPtcINK5eG2jd4Bkx8SgLs?=
 =?us-ascii?Q?RkAlD4Av5mEzwTUmPamQ8srHCZ8xXFeCcHWtLQ0vhuKcjL904OBBEVjwx0dr?=
 =?us-ascii?Q?97KMu6QjdXLj0xtjVgfypDEu/XpNvFCAtLesw3c3cQ7YE4M2QAb4fFPsvJXD?=
 =?us-ascii?Q?4T0ZteAzwJowgAxvDMjkjfVe03Om9f36BB63tuaZSLuQ47bA3r+B9VBSgO5F?=
 =?us-ascii?Q?zgPFcKEvGHDHGkk3l95n+AR4nwTBVxorG8EyQF0g8Cyi39C/WWz3A3I19Dbe?=
 =?us-ascii?Q?CVWU3w3E2sufyaIbcHciyKQYnYamUB7m8nLGdPyt1MGWIXNensZqoT3fuCEK?=
 =?us-ascii?Q?Y1EUHEWtsqH8xQXGRGgmp0fu3+TI7614ePi9R+J1NsrOMxkDb3ZSPFkdH1ws?=
 =?us-ascii?Q?nDcOikhtPqbPO1ugKB8VrBiASFp8ZmtzBCYKDbFHj9pESlFoc4QCyPC/PlWF?=
 =?us-ascii?Q?Gcb3j0QXF088R0a1uNsAOvvq6MPgw0Q0PQ3PVf92vT0N1v00Z7QiloigkwSN?=
 =?us-ascii?Q?0B8GBvO127tSK1F72Jgdk0fK77XrmyxtBUisoAQEk67zVKLKlprjvQZuRe/m?=
 =?us-ascii?Q?GoS3d4ZSKFW2qcYMEO/FPEhIya3nhQma4Z39/e1Vpqa5sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aA0Za7G7/ptwiQ1N8ibPX3NfsLYjgGgzGvhKVa6h41gORC4dMIv/rgKd8hVA?=
 =?us-ascii?Q?r4gesCK4xmYntfO/r75au5yNfkxpor0MjfzT63yWh0eJT0oNGpgrVlIR1z0b?=
 =?us-ascii?Q?yg5EtU88EZUj8PcoY3JC4YUnuRCKCCdJ+PxaOScRUXe3GA8jJWaqAKoC8KrP?=
 =?us-ascii?Q?G8az4ndb7wOgqANJi6+LVs6tVhhlmfVu9n+zBAWJwIj0NAsnvG7eHqXYtt16?=
 =?us-ascii?Q?r8+I0BsuqwkXeZS3+iML2JB0woRB/UhaFYId32tHqjyE0q/7J/ULeF/XxjVF?=
 =?us-ascii?Q?0xG7B9g6QbffFnDYYOU27J35kSmo8ZOyuyZPC01J34aX/IcXYt63o3YsQyS8?=
 =?us-ascii?Q?bW5fNvMZ2FkiyeD9/ktOA4E+OPTb+7s1I+M4JgfZjHu3RdtfC+UuqTbkL3ah?=
 =?us-ascii?Q?bGoMzWisYKDFmcOoMFCe78ittxO57lIZi3HgybMQwC5z+6rBKsU2YwlZML1R?=
 =?us-ascii?Q?UAdVkg3oaBWgZzHWGPkt4wfJ1aEofeTpcNE+3Kryf4yVsvwxLXnVkn05xZuJ?=
 =?us-ascii?Q?26xwB3QIb4Vih74/DbTmwHtp+Vy1SwHkVuphEjeUYpTWWXPF8nUGn2z/GIUl?=
 =?us-ascii?Q?G3qgViAKGLLR9I3xXUlZdMUjzUS92Lj1IWH5V43e9kxHB4UIpqzqC65gFXFL?=
 =?us-ascii?Q?b96BVqaQqmOCeDOYS5sOUWkzoRGvOZLMAXrkCEFHH7nVOXdX2seUBo/gRwlR?=
 =?us-ascii?Q?A7M06JMaqpNLk0C/GUoWpnr1TSlWv+NvuHE78HkORcyYzFgkwaBxJgynACkB?=
 =?us-ascii?Q?wQcbDs8j/Wrsy+sUCBkvK9pg+jyDH1qzU/A1wogST7rM/x8XVqQOzjUtqYOs?=
 =?us-ascii?Q?GL+IRWH7zCFu58hiz5PImsfhbuCEw4IIIGwsqAFpRL2ON/O//xQJAp4BnQ2C?=
 =?us-ascii?Q?U5PsKPqMBrJ3QHADF327ouKDzL45VQWzFCJu5RyuGpI9cuFGihSA1AkBqlUS?=
 =?us-ascii?Q?TqDndpY/fdzKK6WCif82vKECZpx69m78yvqpzevpJNlH0rfDmhOdzADfYH9b?=
 =?us-ascii?Q?6b9sxEeIpOCI8EulGtRhmSPC/3dlj/nOZTigQO5tjc20+i5tiBzekMPd66Tt?=
 =?us-ascii?Q?L7R3Y0vSPeOtEp2OA03XNm1TYmfZvPR8wxzTjBDTmkJwIA8RRfMo7uVbvyTJ?=
 =?us-ascii?Q?XmOjaK/siSBNB0r6xNpEra5br8nqJzGCa2a5vFcjzFHSu01njnX/cLVJiMoH?=
 =?us-ascii?Q?LjcuJQTN92mFl8any85kkp9ITuKfg5tFcduy9XlU/bxM3jbw7dd15AGQfm48?=
 =?us-ascii?Q?FfVmGhLlM6D6PZkoU4r5UEqvvw5V3AcqCXmXoqFIhtWPbC0Ge9woxxmEko1T?=
 =?us-ascii?Q?IqH42jcdBDjxP8cYmijS5TTcjvQIiP501W11NaGMs2ONc9w6Y7pjY6+3XT5v?=
 =?us-ascii?Q?2DZlF7i8o4A7jhc7b8uage2wEdUA02E+lySXsouZCBAWCZlLDxdUNFHuluFH?=
 =?us-ascii?Q?sCQ7zES5ayWnElT2qwJGKKF2TWOBQT5W1ywCLaPDDgOhTBXzVDmH5rQ5BB0f?=
 =?us-ascii?Q?3ONX4SCI8aFPgaEYGFon6YDHVxIQaNTyblkQPtqzlfxUZMVfeY1m6CGj88bt?=
 =?us-ascii?Q?d6s56rk+5E3n8w8M1R7k+Vh/U35qlRmkg7vXR8f2SM0UjE7Ew3QBBzHvtD4c?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 448860c8-d9e7-4a55-5fc7-08dd5ad98bde
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 05:00:55.8734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlJ2OTTqfk4duXY6QIO1JYvrMgIAD1oMsYHF45T6n2/71dAuW6Du9ue3TkYJ9kzAkmmR0xpDPe2AEulkuqh3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_KASAN" on:

commit: b4492e38f44ec9240fd9d88b6ea5f1fc9d0d2a80 ("posix-timers: Make lock_timer() use guard()")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/posix

in testcase: trinity
version: trinity-x86_64-ba2360ed-1_20241228
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



config: x86_64-randconfig-007-20250302
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------------------+------------+------------+
|                                                                                      | d31af90f24 | b4492e38f4 |
+--------------------------------------------------------------------------------------+------------+------------+
| Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_KASAN | 0          | 6          |
| KASAN:null-ptr-deref_in_range[#-#]                                                   | 0          | 6          |
| RIP:lock_release                                                                     | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception                                             | 0          | 6          |
+--------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503041039.d6c1edfa-lkp@intel.com



[  333.334612][ T4187] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000009: 0000 [#1] PREEMPT KASAN
[  333.338378][ T4187] KASAN: null-ptr-deref in range [0x0000000000000048-0x000000000000004f]
[  333.341067][ T4187] CPU: 0 UID: 65534 PID: 4187 Comm: trinity-c0 Tainted: G                T  6.14.0-rc2-00012-gb4492e38f44e #1 cddf1a8251be3c953fa0074c450c81e57a7368e6
[  333.345862][ T4187] Tainted: [T]=RANDSTRUCT
[  333.347374][ T4187] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 333.350646][ T4187] RIP: 0010:lock_release (kbuild/src/consumer/kernel/locking/lockdep.c:5864 (discriminator 1)) 
[ 333.352450][ T4187] Code: 8d b7 ac 06 00 00 4c 89 f0 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 cb 03 00 00 41 83 3e 00 0f 85 1b 02 00 00 4c 89 e8 48 c1 e8 03 <80> 3c 18 00 74 0e 49 89 fe 4c 89 ef e8 a2 2f 4c 00 4c 89 f7 49 81
All code
========
   0:	8d b7 ac 06 00 00    	lea    0x6ac(%rdi),%esi
   6:	4c 89 f0             	mov    %r14,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
  11:	84 c0                	test   %al,%al
  13:	0f 85 cb 03 00 00    	jne    0x3e4
  19:	41 83 3e 00          	cmpl   $0x0,(%r14)
  1d:	0f 85 1b 02 00 00    	jne    0x23e
  23:	4c 89 e8             	mov    %r13,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)		<-- trapping instruction
  2e:	74 0e                	je     0x3e
  30:	49 89 fe             	mov    %rdi,%r14
  33:	4c 89 ef             	mov    %r13,%rdi
  36:	e8 a2 2f 4c 00       	call   0x4c2fdd
  3b:	4c 89 f7             	mov    %r14,%rdi
  3e:	49                   	rex.WB
  3f:	81                   	.byte 0x81

Code starting with the faulting instruction
===========================================
   0:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   4:	74 0e                	je     0x14
   6:	49 89 fe             	mov    %rdi,%r14
   9:	4c 89 ef             	mov    %r13,%rdi
   c:	e8 a2 2f 4c 00       	call   0x4c2fb3
  11:	4c 89 f7             	mov    %r14,%rdi
  14:	49                   	rex.WB
  15:	81                   	.byte 0x81
[  333.358298][ T4187] RSP: 0018:ffffc9000286fe18 EFLAGS: 00010206
[  333.360327][ T4187] RAX: 0000000000000009 RBX: dffffc0000000000 RCX: dffffc0000000000
[  333.362970][ T4187] RDX: 0000000000000000 RSI: ffffffff8164109c RDI: ffff888148de9a80
[  333.365828][ T4187] RBP: ffffc9000286fe80 R08: ffffffff865400c7 R09: 1ffffffff0ca8018
[  333.368534][ T4187] R10: dffffc0000000000 R11: fffffbfff0ca8019 R12: dffffc0000000000
[  333.371134][ T4187] R13: 0000000000000048 R14: ffff888148dea12c R15: ffffffff8164109c
[  333.373773][ T4187] FS:  00007effe1975740(0000) GS:ffffffff852c1000(0000) knlGS:0000000000000000
[  333.376629][ T4187] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  333.378772][ T4187] CR2: 00007effe1344ec8 CR3: 000000011833a000 CR4: 00000000000406b0
[  333.381439][ T4187] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  333.384087][ T4187] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  333.386680][ T4187] Call Trace:
[  333.387918][ T4187]  <TASK>
[ 333.389112][ T4187] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421) 
[ 333.390651][ T4187] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:?) 
[ 333.392173][ T4187] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751) 
[ 333.394054][ T4187] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:617) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250304/202503041039.d6c1edfa-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


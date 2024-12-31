Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDF18C03A
	for <oe-lkp@lists.linux.dev>; Tue, 31 Dec 2024 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634519; cv=fail; b=XQTKtS+8dB56svoQaWFJFbk0TlIt/jbePs7J0/eTLXHWhK3g+BCBy2gMw9BwRonlJ+7wtexmfqH+2QqwAqMjRecWQujq1tvXCrAqOpBX2RV/wM+ScuGEbyCcXIDcMPiwMGfpYtux/+R4g6v92M3wLCQLApVlGQKfK8cnvDOwMCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634519; c=relaxed/simple;
	bh=UkM+XS3JMFSD8U6FqvGyftkdFytlD6jZG/oGxinLNqM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TTey48koSs2lULGITklL2Qv01mSijoz8rBx+Pqcazu+zhBrRjXsl9YFzzo/TM3PLF4UkJjAZqaT5i1anLg3j1f6Ly8wO6cvkoUjnmmWu1sfTzqKp/aoMBnHsNvE4rYvbSzJApEK6PGHF8vQwB0S8P489JCHpCOPY4oUwmmRIpzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTTHZoSu; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTTHZoSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735634518; x=1767170518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UkM+XS3JMFSD8U6FqvGyftkdFytlD6jZG/oGxinLNqM=;
  b=mTTHZoSudDYBLeiHA+TxYRBtneporDfY7wtpp9HdXonWJHyQKwLc6VbH
   K26Pn5T/mUL+9y3HdqF9/v7GCMRf3RJ2XqHaacdYY7NlG3jzBR7Lg6iuo
   Xxvm59D2yRNvtImHa+q/MjVoJyhnWZx2cPVANGH6XrDMvRr+kh8CJKl9X
   JXk/L4kMO2rAI3lqMCzjv7Z5OesOG8JZlYa6lcmEcnPGnaV5ziKzVZwBO
   fGjojZGdkAMhjjRoAtjk0Dew5aFtgkzytZNzTR1q1Hp9Ev77E8wFlH7fw
   wHnqnbVCybga2RZY/1PjBQQ6plzaIO8wcHyZATZ+qWrzECJEBzLnOm8kV
   A==;
X-CSE-ConnectionGUID: +9OeX/6+Qt2pWS8vGUp21A==
X-CSE-MsgGUID: psvPHgfTQwiqmqLeNsO6sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36026697"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36026697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:41:57 -0800
X-CSE-ConnectionGUID: jlMbGiTxSlKhzF9mE9f2ZQ==
X-CSE-MsgGUID: p/W91oGSR6+SEVNAyIh1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101849193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Dec 2024 00:41:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 31 Dec 2024 00:41:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 31 Dec 2024 00:41:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 31 Dec 2024 00:41:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJVk8K6xf6oHkgFWyKVWy68BUrYkA9ML+Gl9PFk5SUgsKxS0eAG/q6RqBcBh4scn4VsITAXMwXJowumdsGY0BMTXizjGRmwGp+9i9patH70sqm9SYGGtoyOc90QMN/Krgg8i532zT8G3ZcLDsWioBcj2LCe8eRK6BF2KasASSxHtWZzJshfOG7k98MhY9AZbb2LG/gYdEcYWYB5Tf/1aKiDyaopMH4BKyhZxfxM7Aku5JoSwlSQAAye9U+43t/hPq70kTUkEkcXexvY5mBGktE0gdmA++btrSIDfQCw2BW/juHgh/1VUyIOUVpElC+16a4660p8LAmboqOpLgR5qZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMpBzi1y4HLsVkou4/EP2AHgqN8EbKBiPF4vLF1Epck=;
 b=ObWjhEqJSSdHaflAvQBhbPUkJC5orlnaAzGcV6NeH4SLQOX7A9j2I5aS9Ue7zwFJPtdZ8/+lGHRgztrWl29e5KB3bJdtBM30hVxh+Yt/mZvTTrSGl/9f7aQxx/G3RBPEefllqYaiigHZjO7Hcy17DaU3KJXEShwQz/OpxHmGyeYjBQC2GnTEShx7XrPS72JxOKkPcwFLTDyAgj/5AZGW+4un4TcCPvx7NKyK8DRHIxpuFA6txWBmQHQhpZEdMmG17BQcoL9G+igLvM0fEyvjjZaZkoPT7fg4s6JTB2h2pxVtBFzQIVC5vMKtoFyNmRMe3LINdYWvePOXSqANxpp9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 08:41:48 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%4]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 08:41:48 +0000
Date: Tue, 31 Dec 2024 16:41:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v6] [futex]  865221325b:
 WARNING:at_lib/rcuref.c:#rcuref_put_slowpath
Message-ID: <202412311453.9d7636a2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4c8737-a31d-441a-2282-08dd2976f6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4n4JHuH2zXTGHn/gNH/0VVjYCApBF/fV7m/cAs6LMFw+40ejY4G3YdtZM+bk?=
 =?us-ascii?Q?eDMJnpXLUc8TBOR2UqOIbeZCknwiDREzmqTH61xIMngGeFWXytw7Bo6odtcq?=
 =?us-ascii?Q?2d/tTMhBio2BmFsqUTZZI/eW1XJJhgt+IqGyw5xhy/6fsYmTCzSjP8RvAGDn?=
 =?us-ascii?Q?rK3VftAVsRSvhzNQQtTJspOlUPIzo+6bVv0Bk8odgmrkQTtR5UV4j+l+6bQl?=
 =?us-ascii?Q?7xNXJrTB5Y/7kigO/zeMEoUS0IPNvq/BKKEaWGBfXQISpEqp4r+5mtHvii6+?=
 =?us-ascii?Q?YphUmFOY7o7fSA7iBdzXnC+G4y9nyshnNRsBUJoAOtu0XNIBkC71iHaDRHRO?=
 =?us-ascii?Q?uaiR3CjeiQcl0jmaSj7W9bY7ek1ohtmHuYn5UUCgN1CHigf6ee79mdnu4Joe?=
 =?us-ascii?Q?ZvnenJSACLUDkhpLMCZDBy+qJPS26Mi5yBC4EeztonJaZy3WZfOGf88HE62A?=
 =?us-ascii?Q?3huA+jv8/QidSnVfBOzuEhiqHAhUi0Fq+dZMzTV3mqqra+ozXt1n4JeT+SH8?=
 =?us-ascii?Q?xzSOlF0eu2Mk3AKguEDtb8vxV5mpRfz9E+8ZIs4sgTWdT4X4WOCGTkF0on7d?=
 =?us-ascii?Q?bdP7JMr/z5ZG7bEwJA8ufe/HWzXB8vxjR+Yqrj4/GhecqkVuelfOIwMszKID?=
 =?us-ascii?Q?T0tPRA0e8LKiH+dpO7uFX9b9BUAno7UCHRYv+OQED500rT47Le/Xp5iXuhf/?=
 =?us-ascii?Q?wwsL4OqnItqAb9G9jNEsX7fcXrhML4RhPV9yL0d/vAum96iKPktqsLus066U?=
 =?us-ascii?Q?ZRr2jezfpdOKn0vbuzrresLktf9V5eBiklQ8fpQPPbX2PvStVtV6Vi5SvMK7?=
 =?us-ascii?Q?RcDwT1dHldJ5L5WglrLSYuidknSX9dVKwLgqW7i8MpYnvDpI8wwFqLGGJ0zg?=
 =?us-ascii?Q?MeucJTx3qbDAauYwt/DDqAjYSXhOIcxkFS+a/EsQEtGWN2NnngnNLBouG3hN?=
 =?us-ascii?Q?2spxYIgHlxcBuv9PpwzzpbT4Lsgi4gWqtXmmbfbdbCaFjad5hL+8OTUsxnLM?=
 =?us-ascii?Q?zJmJNJZCADpYgCydWYsh2NhljU0WVFOzzsfLQRY5otOJjBstXu6Zf5La5VRp?=
 =?us-ascii?Q?zL3Ojlaz5/vb1qj7XJHifFNLerRM6Y06iFaup7SJ5sBStty0OnZg7zLgrJ2s?=
 =?us-ascii?Q?WDx3yDvXxzkm+fI5SfQtaRk9Ib+WxpR0dqH/2WEf0nJ8H1LGW6R3Mf5SWsC5?=
 =?us-ascii?Q?B8BStnEDN5ZjA/AuPuZtdGd6+mz6BQhgbHpFeevr6c8qAXseb3+vbXlsr1Sv?=
 =?us-ascii?Q?sxCHByKPKYysHMpFBYsrd+DJU15/JbqBa08C7JZ+RBG+cJeq62idxp0GuoJI?=
 =?us-ascii?Q?4NueSjMqoL+3FjNcANbEMR3ijnv12gD2bUPsLsjEMu4Q8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKCTT+tLTECf6cw9jmPqDcNy0cafRxRl7i6GlaQSBh3qWpi79ka2NoB35lpF?=
 =?us-ascii?Q?9jEx20q5+vwle+uLCbg+hTlnQUvSjArHvB4W0QBg3F8V+uJIq5yci4V2rt3c?=
 =?us-ascii?Q?z5o/riIqHYxvPCEJocPigkujqSXQq7d2fWllkzrFqPlU5bcMjN+5CUveoeaa?=
 =?us-ascii?Q?5VsbIEge43KTNBXfUTBWH1D3e80cMMTE8pu1gvLTYWNkWm/DTDTtoqS3ZcQc?=
 =?us-ascii?Q?dG0a0BWNC0IbvNA+4IxMLQSU94rU4/fscnv9rm2KK91j+vCfUPE3MK9ufpNG?=
 =?us-ascii?Q?CJ3cYPqHcyQsoPKI5HilMIIBM3XQVAg68bA1hr6Ux8DTV5N3mmk70+KFbZck?=
 =?us-ascii?Q?6/8/WorhQ2Y3KHxMrbiKPctY1QbgJ7JNyqMAp3eRJ1EtGTRXmB6F5h/uH8YD?=
 =?us-ascii?Q?DFLrMTjPDoCWj0BGZkCP2JsYtMYicOTeWTnWhNIOp/QTFZPDtgYPhtNncafa?=
 =?us-ascii?Q?7V051QyQmZXIFTNT9X0R7hYb6q1GSUAKMlkZbD6zJ3o6lg3Izuwi2MdqPmYQ?=
 =?us-ascii?Q?2uxTCRc1rVrtRuBOl4b//+B5A3l9Wur2J63nSfu/zAvYwgR1oEU/MRQ42VKb?=
 =?us-ascii?Q?oDw3oaVaTebKSzw2C5LmEDLqetioLvvJZnOSsWu9zXJexf0INB7a55DSPDIM?=
 =?us-ascii?Q?FrfEyrb8asF1rMJgHCncWISPDg6gldQYRImM6uh+IqD+LZATdA2uvB+TruKT?=
 =?us-ascii?Q?v4oyoGsvIk2dghvs+dMZH9vp75oqTP41i8+qTqRRgUoCtDyX0fF2EJX62JUz?=
 =?us-ascii?Q?XsjBjy/LHCExFcdZ+a9rHghHXcP8g3x2Tu9ccbpGEWG45ZXNh2hiC8TeATby?=
 =?us-ascii?Q?MKcQO5HHmHEPqh+Ih9M9pCtFFYvPRM8QSq1aqS8Svq87xgY7R+oaRMkAIE9H?=
 =?us-ascii?Q?d1XkBSx5dDm/pbGXvsLaUkOp4XNaCh3F9MGe6YKpM4TarGYExAEqwLU76G9O?=
 =?us-ascii?Q?8roU6ndmzZQNgJ4+VCUC5/bYeNCpEl+VYpBWmwRF/CxzJ5Ct/bUiV/FwD8w6?=
 =?us-ascii?Q?Ssixb+ojlb8MWw6lcz0peJMU6fJEzhPpdona4+t8lxnKd7gXJAfKdOicekrC?=
 =?us-ascii?Q?5G9PHTGITL/Fwa2CHxipl36crMVC18a5LeannwFhx5Fa+BlC1ZmAL10wf62v?=
 =?us-ascii?Q?olc6Ox+a85uV5IgEqVST6riRFsZ+rE4/G7ijKROxWK4cd71u2GTFuNP5aJ5v?=
 =?us-ascii?Q?69HPmwKBh5Mjfd192fkKMhMrRhYThKxvQhgFnvSKQ9H1LlqR4JhU1bWhKcUh?=
 =?us-ascii?Q?GkkRQ+uvQ++QeIqE1+8ckJuiMQZ9PHN368Hk6z0KlXn/D9hDHpGMenC9wges?=
 =?us-ascii?Q?zCN48DUfygcDrofMlqf5+FOm7R3VrgN/f3X31xb09SCVNNqFadPyxTOOA3Df?=
 =?us-ascii?Q?qSVv2gR7gsjWq/EotTAvvfWGO0T7pka7Ohbm5c/W5JapRU2Y0fsRK6Wk6Ooe?=
 =?us-ascii?Q?Shdrqig26uveFLEL5wjCqN6pUs3Lo77gysGMxitOXNANyGQBkLMETV0zllSt?=
 =?us-ascii?Q?JlOgRodKpii7eKXh17u1xCmwchF41ZX2u3CSNzxihQKVUbgGlvxgMluA4zRK?=
 =?us-ascii?Q?zetzXM3oSwXSbUHRY+J1z0Itp+6fXm/0GuMhNmF/oK9AUiaKtARZyLysjGmX?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4c8737-a31d-441a-2282-08dd2976f6dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:41:48.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCKl2WuSJk3Y7Xh9dl/psiFaWzCXvpySfqSNpDQsoAEQ8TitbvrpOiXjlp/XznSygyc4CDY/LA4K+uWqs/6p9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_lib/rcuref.c:#rcuref_put_slowpath" on:

commit: 865221325b6a45c5d0777614ccad2e49aa82722b ("futex: Resize local futex hash table based on number of threads.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v6

in testcase: phoronix-test-suite
version: 
with following parameters:

	test: build-erlang-1.2.0
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412311453.9d7636a2-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241231/202412311453.9d7636a2-lkp@intel.com


[  184.835701][T52159] ------------[ cut here ]------------
[  184.841511][T52159] rcuref - imbalanced put()
[  184.841536][T52159] WARNING: CPU: 64 PID: 52159 at lib/rcuref.c:267 rcuref_put_slowpath+0x66/0x70
[  184.855547][T52159] Modules linked in: xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype nft_compat nf_tables nfnetlink br_netfilter bridge stp llc dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio qrtr sg binfmt_misc fuse loop dm_mod ip_tables overlay btrfs blake2b_generic xor raid6_pq libcrc32c intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common skx_edac skx_edac_common nfit libnvdimm x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irdma ast sd_mod crct10dif_pclmul crc32_pclmul drm_client_lib crc32c_intel ice snd_pcm drm_shmem_helper ghash_clmulni_intel snd_timer ipmi_ssif gnss drm_kms_helper ahci rapl snd ib_uverbs libahci intel_cstate mei_me acpi_power_meter soundcore ioatdma i2c_i801 intel_uncore drm ib_core libata mei pcspkr ipmi_si acpi_ipmi lpc_ich joydev intel_pch_thermal i2c_smbus dca wmi ipmi_devintf ipmi_msghandler acpi_pad
[  184.944417][T52159] CPU: 64 UID: 0 PID: 52159 Comm: 1_aux Tainted: G S                 6.13.0-rc3-00011-g865221325b6a #1
[  184.955911][T52159] Tainted: [S]=CPU_OUT_OF_SPEC
[  184.961148][T52159] Hardware name: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620.86B.02.01.0008.031920191559 03/19/2019
[  184.972898][T52159] RIP: 0010:rcuref_put_slowpath+0x66/0x70
[  184.979101][T52159] Code: 31 c0 eb f0 80 3d 76 fb bd 01 00 74 0a c7 03 00 00 00 e0 31 c0 eb dd 48 c7 c7 02 4e b6 82 c6 05 5c fb bd 01 01 e8 da 49 96 ff <0f> 0b eb df 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90
[  184.999849][T52159] RSP: 0018:ffffc90025ef7ca0 EFLAGS: 00010282
[  185.006454][T52159] RAX: 0000000000000000 RBX: ffff88c0a1e54000 RCX: 0000000000000027
[  185.014975][T52159] RDX: ffff88bf7fe20c08 RSI: 0000000000000001 RDI: ffff88bf7fe20c00
[  185.023484][T52159] RBP: ffffc90025ef7ce8 R08: 0000000000000000 R09: 0000000000000003
[  185.031952][T52159] R10: ffffc90025ef7b40 R11: ffffffff831e10c8 R12: 0000000000000000
[  185.040433][T52159] R13: ffff88c10e034080 R14: 00000000ffffffff R15: 00000000ffffffff
[  185.048952][T52159] FS:  00007f8fcb36a6c0(0000) GS:ffff88bf7fe00000(0000) knlGS:0000000000000000
[  185.058426][T52159] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  185.065570][T52159] CR2: 00007f8fcd37f5d0 CR3: 00000041449c0003 CR4: 00000000007726f0
[  185.074137][T52159] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  185.082692][T52159] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  185.091244][T52159] PKRU: 55555554
[  185.095270][T52159] Call Trace:
[  185.099146][T52159]  <TASK>
[  185.102658][T52159]  ? __warn+0x85/0x130
[  185.107272][T52159]  ? rcuref_put_slowpath+0x66/0x70
[  185.112930][T52159]  ? report_bug+0x150/0x170
[  185.117954][T52159]  ? prb_read_valid+0x1b/0x30
[  185.122926][T52159]  ? handle_bug+0x53/0xb0
[  185.127813][T52159]  ? exc_invalid_op+0x17/0x70
[  185.133022][T52159]  ? asm_exc_invalid_op+0x1a/0x20
[  185.138520][T52159]  ? rcuref_put_slowpath+0x66/0x70
[  185.144224][T52159]  futex_hash_put+0x2c/0x30
[  185.149286][T52159]  futex_wait_queue+0x4a/0xb0
[  185.154497][T52159]  __futex_wait+0x146/0x1b0
[  185.159536][T52159]  ? __pfx_futex_wake_mark+0x10/0x10
[  185.165341][T52159]  futex_wait+0x6c/0x130
[  185.170135][T52159]  ? __handle_mm_fault+0x2f6/0x6f0
[  185.175497][T52159]  do_futex+0x11d/0x1f0
[  185.179885][T52159]  __x64_sys_futex+0x77/0x1f0
[  185.184795][T52159]  do_syscall_64+0x7d/0x170
[  185.189523][T52159]  ? do_user_addr_fault+0x342/0x670
[  185.194951][T52159]  ? clear_bhb_loop+0x45/0xa0
[  185.199852][T52159]  ? clear_bhb_loop+0x45/0xa0
[  185.204743][T52159]  ? clear_bhb_loop+0x45/0xa0
[  185.209631][T52159]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  185.215723][T52159] RIP: 0033:0x7f900e516719
[  185.220324][T52159] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
[  185.240399][T52159] RSP: 002b:00007f8fcb369d28 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
[  185.248987][T52159] RAX: ffffffffffffffda RBX: 00007f8fcdc305d0 RCX: 00007f900e516719
[  185.257134][T52159] RDX: 00000000ffffffff RSI: 0000000000000080 RDI: 00007f8fcdc305d0
[  185.265258][T52159] RBP: 00007f8fcb369d90 R08: 0000000000000000 R09: 0000000000000000
[  185.273369][T52159] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8fcdc305c0
[  185.281471][T52159] R13: 0000000000000000 R14: 0000000000000002 R15: 00007f8fcb369e30
[  185.289572][T52159]  </TASK>
[  185.292733][T52159] ---[ end trace 0000000000000000 ]---


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


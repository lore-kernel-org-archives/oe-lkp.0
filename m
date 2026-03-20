Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C92D3739
	for <oe-lkp@lists.linux.dev>; Fri, 20 Mar 2026 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971660; cv=fail; b=aUa/LozSc8a5LT8e03ZPpNQNmHBWew2e1EHs3ENIEW18CzY+nHDFIVjfY3II9yuS91P8UraLcq2II3Y9m3gYq8o1r5PU2UBHIifCPpzbo8de8qiKrNf+YcK09YWoOca22I6B2WubcRoUNavFQe1sUwaTPjABKHPaEdE0aC+hkCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971660; c=relaxed/simple;
	bh=vB7urt5jvRNAVSrY3PISPWbNQhBykRu6OgEG/U5fAqs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aBt0FsT21dDXKE7yXJheWVCZdoTfgqUCW93AYUKnJ07BRQXJWpXfwz5pUAFJuSHjvxceQr8vILDA7LUZCqYwdgi9nbQO+ck8fyFqIN1CSmUicC8guSjfoYBh44U9Gs0vEEkk6iuWV1Y+ofZlgSftSW6tZBMOAmCRCe8r703nNBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2xtsvn5; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2xtsvn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773971653; x=1805507653;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=vB7urt5jvRNAVSrY3PISPWbNQhBykRu6OgEG/U5fAqs=;
  b=F2xtsvn5sc8Hp3fc+iNLnVQCw942qoh4XpO3PpJ3YQVwQeHf1Pg+Mwb/
   x3aFW9w2WnUeEymTdirEryiUp8pk8RtlIjPgObDXBlhpI8bRgN18KI+Q+
   p4D1SWotE4vLJ72K2UU7/mpI6GCDeF4fm0ETivAzoG5sN1frfWkCJYyIE
   GrzUqvD2s3P1ovWILQoemIOaoKIHK1JxWRJC3LuZT9nY3jOomYlxmPYRn
   8yJ/3sLQveqHLK46SytyKFfsS56TGngptXZUCW5CY9p6dRDYWNf5jxOm3
   TQiv5E17z9IjJ/7DDFUo0YFjq6tarKmyX+TtTNBdAF7KcFnHL/efS2ORr
   A==;
X-CSE-ConnectionGUID: hkCc8jzDQEGMsV9a6faW5g==
X-CSE-MsgGUID: ZpZIKML/R/29fTqIoitWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85369676"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85369676"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 18:54:12 -0700
X-CSE-ConnectionGUID: KOh9vpJpTOmSbguVAlpVyg==
X-CSE-MsgGUID: z3GOXH/zR4unTPC57egPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218998074"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 18:54:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 18:54:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 18:54:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 18:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1+010lNBLLDT5gVEd+gbxeCdL5QbK5nGAGE6QJYuY333CHq/v+VcbofR0prn4ohnXz2eTjj7tnQunWaBs12og8SaevOuSescpNX3caPMoZzIB8IzDF06qMM5KHVgNzW29k9od7lAqjNlDi5tTiYISpTOL3VwP1+fECNLaoTHrjPnZpb2GNY1lnK4UPojoHEjxtp51Y1CSwBCfAwLUBVuaC3iWpUhuROReospRfNwcII+YgtORuwh1Z2oktX5ONvXQcpnTSYqJgVTnNfXqMzPik8Go/EHaZmVMB77nRWRA2M0XiHOzVaToIkh9C/NOmse5nNfBkQ54tt+T6zlOS0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0TBUAq4fHQ/8KdfP49DhXVcnhWzU5Ke/7zSwm1aje0=;
 b=HcaOgFYkhYD3zhJUNFe7z10mNN71HHJQ6dH8pJ5OP35yoflol9vhqG9Z65yYiJiDyYlCeMaf5SjP52yzQaIOfP9aii9IifdHbmrejMeu1DuFQPzB0Y1VjeyDeWkFqaj+994stDPMIZO/vKXt9ys1LbWQl2OQOW214UKh3NephSk03bavh/qPjvPqFUSRowW5WIdwlft+fHAQnoECV6hL/rYAYsh1l/Cf1/RDXG13DXMzDrUkBbUmuG4tAFkwFgrHpGUCWtOiwV2zLMFaxiXqlUExylermoJmJpYATYL0fM8htVZC0uHA5RmF5hcaktkaxufY7TznQo1nHAc2QzVMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 01:54:08 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 01:54:07 +0000
Date: Fri, 20 Mar 2026 09:53:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] lib/vsprintf: Validate sleepable context during
 restrictred pointer formatting
Message-ID: <202603191629.80fc4e2b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260317-restricted-pointers-final-v1-1-b4dca0ed6483@linutronix.de>
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b5ca47-2112-4bf9-a2d4-08de8623919c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: amgNNaJ1O+hURcsEvgbd/YT0aNlrCii8EuSBV7LpyNMd8wpeDJj1zi0MLqjRqCPFA8h6BPjkJ85i/UsMam2ssQzqSxrA8gG5RJJjdpNp5d8UHsr554ff95fYIQxYr6R0zEV4rZwW0ZDGJ8s+jnNCEcCTzDv06ySHoJ4jE+Xg94ksLrEZzQryI1SjM28neTtoV9kUEStuLElvJOxXYZG0+dAHvVBAoFxXs4EYBlEHew/3LUtnKqKS/NC9C92nm2a/UKmXVqCzvfn8Zo8TJumJ7g2XlTNtl0o4oyYlmAOCYAlvb9GNrGraq//v/wJLLUPVzrbjoPW7hOTc9YoyZXJsKoLkega0FVpVSCrYlBo90J7FJuUpnAQolOWGF73ms6IaDaVrtKDwtYOYEXNLdLCs2JqIvkMw1u5I9rjRWiImUtlqlZWNG20Xdpi4irE+Nf2XI5KEPHvkczqmIOjverlg9kaC/axRSTT2kfHR7RZfQ5uAHmxseKt07M+uZo8ywzMxgPo5M5tucIyqyIJNyRh7GQThL57ljSZstIUQ2g9456atrNBjt8E4x7ENrTjzB2lb8O2Ok/d+PCsGzoRc7wawRcuokLBdCuc2yaroVZhfJU29Se9rB/F5eRfYBxAZazBn1OSEcNxyU6DJDuhFEjxDV/z5WSdMm+iNDZb7aqEUmGH0ENrSd48XCcprm0Exww2y+iu2XLaED0mLhopSObUM2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opzO8tKZci2nq2dv476X6RSf/3CQaBoxwnPrnfZHVg1P+dE+QiO6lwiswq4i?=
 =?us-ascii?Q?nQ8ntJUsdyYuRmxPDKsFRM1YUHrtGPA+/bFE7ikle6brJEHZ4SpMJCxftaf3?=
 =?us-ascii?Q?pYJq0vyMyOAa2BUeSI4pdB/dE/I5mFY7EwDB2Yhg9HLmkEvSfDukHkFeAbUV?=
 =?us-ascii?Q?ldzJ+vJkMYPqf4ELrEDE43rz81GvN6cBoFNYCQB66nEKIsCnS6kM9c9MKAda?=
 =?us-ascii?Q?lPsAG8CsaWL05kembaVCJ8hcQmu/VZ+kX5w+vKBjHLhMUwiIcr6PJioUOeSQ?=
 =?us-ascii?Q?uGRuZyxyQdznkGaxkdoE/9nRKTI3YKUFDKEzeljsFWLru7m3WAIqk93yA466?=
 =?us-ascii?Q?0hyZbxPYgYmRU/qZn4CpocxLqaRFei5Lk/W8VexJ/vEIo/cFbHqW/3WATOxL?=
 =?us-ascii?Q?Kuxxcj+jlVSiwkpK7hjE+Knsoeyq35uR6cCazIpp3xC23B880FSxH1oeuV1I?=
 =?us-ascii?Q?miLNn56pFY9dJinqKH8vv5rqqdi+XDvDkUoEsQviPz9LUC29mtfaLa8nSVFh?=
 =?us-ascii?Q?fUVsoF7Uync49nCpjTBBNHvVIKaLQ3dkb+XNZbMSq6F8bi4JolSPAu2gBSLy?=
 =?us-ascii?Q?zoOefWtWwvhMtkWIWl9yZ+BBwGgiq+h2zksPObW5e37jlLTgJDP6a8iUg5Oo?=
 =?us-ascii?Q?C/0/DMEJTxqkCDcrvlm2JLqxxwouhAWeJDn7LpcyUGF3bpGAgpaZGGY8UGmM?=
 =?us-ascii?Q?4d2YvpeMpB9M6hIZVS62Z8je+XMFYX8/iQGlk150/4AAIARDTtCYfb9Jsblw?=
 =?us-ascii?Q?vyJZt2wfhCwa8ghvPnz0zKwyHvUNcOwvDqq2bGSn+3oFLfzFPns7Q9CfUsab?=
 =?us-ascii?Q?E1qAWhj4ClZNiU2j8iAQYFs/MKZMjuyLZBLmGPYOphJJHoDs2PlLk6ZnCnN8?=
 =?us-ascii?Q?pSrKteMMU91ctNlTO8kf7B6bkut1ZL2dQcjClJ6vPsu5X9Z9WJQTW0SDUsfd?=
 =?us-ascii?Q?FSGo1FrN/bzKqJEMP5RLSlUC4qPX3yroJWBevU5w3deG63H2YTmL81knTmgi?=
 =?us-ascii?Q?f0m4yQ+EmrMvBAgrUmKpfScajbuCfAgbIC4x8YoiVONPWB9qGHIclKb8+8pd?=
 =?us-ascii?Q?iK4tmUxlZKA6UahsrnttXZgcttKGp+2TeXqJQ+6c67DBkpr7E2Rr8mcp7IX9?=
 =?us-ascii?Q?vCpZYcdmFCGivMthMhv/itAHFRbNXJoyaSnLrVFvsV5cFkKjiQqeYY8qRHE2?=
 =?us-ascii?Q?my86KjboWEz9avMLSIZisYYswWpo0EjGTK3tOslInJtF1rXQBDmO70W1z4Y6?=
 =?us-ascii?Q?xsL9qsCFT1pKJP0Vh2/3ZtQ53fO7tS5Phsrxe5wfLUToSTfNecdiH+bWzqHu?=
 =?us-ascii?Q?OExOncPweO8cafkcDiW/Yw1vdOozzGLGspHZFyR+hzPkzddKlPNh6pohgjlQ?=
 =?us-ascii?Q?h9DTymBF6Cgt2BZ2De2AGdESUAVVrY8tTdPvODiMShOYk+wK426vhmMR3K5c?=
 =?us-ascii?Q?yil3OT7dB8SUgq4ZSTpE7SucqmO2S3WMv5KyDV0IsYl0HgDrYE0UOXa2a5Fo?=
 =?us-ascii?Q?9dqdEK2DVJSRZ7GzWZQz/ldV0xjN0uHAILr3T3NZBixsQMA5etx1V1Gpx9w/?=
 =?us-ascii?Q?Ie43JZUXmQ/E1r6UIZJG0hLZUq8JJO0ITAoFGrNJflYI0TNVfc3MWBM0L05T?=
 =?us-ascii?Q?kK4Z2kbfS5t8FIjoIHdQ1nLyFL1fglPODly7loZuU0nvJ1aq8AL5CFubdyhu?=
 =?us-ascii?Q?nBJUPhLMbeECswISFYuQyCJFOC56Pk+erGIjZi1EeWk1+xOGFTVlnRJnLevR?=
 =?us-ascii?Q?wJxbNt+DUA=3D=3D?=
X-Exchange-RoutingPolicyChecked: QlRi5bt7UxrC7WtCHOvXcW0xouJznsnJM1f628Usc6eJA4uQFLwJievdiACPsUi1KpZg998YoETBsoFe7oQ03hWZ2WXtxuoZiJdC782yvOexf3Us0oR7twULKvA+oTrI1KYj9stODdfnol6FQ8RntGL6yBvt9xtNkcr78K7FFlBE2LgjRWjYbmKBr5LAfcMKifFPp7LDAI1Ht6ha4K9xpQhJgBEAIdLmZm6pVMxxrAMz+9ywuROfqpr0M7vismA8llbzR5HZuZ5LEZDQMT8QgTema0YgGruLfkBtra+8qI1NQY7OqOZvIN0UyP2Pi9XFNAphJfB6KVWUZj5wjiXQEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b5ca47-2112-4bf9-a2d4-08de8623919c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 01:54:07.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iq+3+v+DIoZs2uLYU+NHKsWw+yfIAHLXHUkqT9hhT2fGcCb/BKWBLV88la82owp0SFyM6tJ8WOCnRRVs3rujFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_lib/vsprintf.c" on:

commit: a3aa148a203538960cf380021ba5605a35dd573b ("[PATCH] lib/vsprintf: Validate sleepable context during restrictred pointer formatting")
url: https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/lib-vsprintf-Validate-sleepable-context-during-restrictred-pointer-formatting/20260318-000650
patch link: https://lore.kernel.org/all/20260317-restricted-pointers-final-v1-1-b4dca0ed6483@linutronix.de/
patch subject: [PATCH] lib/vsprintf: Validate sleepable context during restrictred pointer formatting

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------------------+------------+------------+
|                                                                     | 2d1373e424 | a3aa148a20 |
+---------------------------------------------------------------------+------------+------------+
| BUG:sleeping_function_called_from_invalid_context_at_lib/vsprintf.c | 0          | 12         |
+---------------------------------------------------------------------+------------+------------+

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603191629.80fc4e2b-lkp@intel.com



[  103.203896][ T6289] BUG: sleeping function called from invalid context at lib/vsprintf.c:866
[  103.218966][ T6289] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 6289, name: trinity-c6
[  103.270174][ T6289] preempt_count: 2, expected: 0
[  103.288514][ T6289] RCU nest depth: 0, expected: 0
[  103.310869][ T6289] CPU: 1 UID: 65534 PID: 6289 Comm: trinity-c6 Not tainted 7.0.0-rc4-00006-ga3aa148a2035 #1 PREEMPT(lazy)
[  103.310904][ T6289] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  103.310929][ T6289] Call Trace:
[  103.311096][ T6289]  <TASK>
[  103.311126][ T6289]  dump_stack_lvl (lib/dump_stack.c:123)
[  103.311160][ T6289]  __might_resched (kernel/sched/core.c:8889)
[  103.311196][ T6289]  restricted_pointer (include/linux/kernel.h:58 lib/vsprintf.c:866)
[  103.311228][ T6289]  pointer (lib/vsprintf.c:2624)
[  103.311261][ T6289]  ? vsnprintf (lib/vsprintf.c:?)
[  103.311295][ T6289]  vsnprintf (lib/vsprintf.c:2955)
[  103.311327][ T6289]  seq_vprintf (fs/seq_file.c:393)
[  103.311359][ T6289]  seq_printf (fs/seq_file.c:409)
[  103.311388][ T6289]  ? rep_movs_alternative (arch/x86/lib/copy_user_64.S:46)
[  103.311423][ T6289]  unix_seq_show (net/unix/af_unix.c:3540)
[  103.311458][ T6289]  seq_read_iter (fs/seq_file.c:273)
[  103.311491][ T6289]  seq_read (fs/seq_file.c:164)
[  103.311524][ T6289]  proc_reg_read (fs/proc/inode.c:308 fs/proc/inode.c:320)
[  103.311580][ T6289]  vfs_read (fs/read_write.c:572)
[  103.311611][ T6289]  ? do_setitimer (include/linux/spinlock.h:?)
[  103.311643][ T6289]  ksys_read (fs/read_write.c:717)
[  103.311674][ T6289]  do_syscall_64 (arch/x86/entry/syscall_64.c:?)
[  103.311708][ T6289]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  103.311739][ T6289] RIP: 0033:0x453b29
[  103.311749][ T6289] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 3b 84 00 00 c3 66 2e 0f 1f 84 00 00 00 00
All code
========
   0:	00 f3                	add    %dh,%bl
   2:	c3                   	ret
   3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   a:	00 00 00 
   d:	0f 1f 40 00          	nopl   0x0(%rax)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	0f 83 3b 84 00 00    	jae    0x8471
  36:	c3                   	ret
  37:	66                   	data16
  38:	2e                   	cs
  39:	0f                   	.byte 0xf
  3a:	1f                   	(bad)
  3b:	84 00                	test   %al,(%rax)
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	0f 83 3b 84 00 00    	jae    0x8447
   c:	c3                   	ret
   d:	66                   	data16
   e:	2e                   	cs
   f:	0f                   	.byte 0xf
  10:	1f                   	(bad)
  11:	84 00                	test   %al,(%rax)
  13:	00 00                	add    %al,(%rax)
	...
[  103.311777][ T6289] RSP: 002b:00007ffe20169d38 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[  103.311807][ T6289] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000453b29
[  103.311812][ T6289] RDX: 0000000000001000 RSI: 00007f14e38d0000 RDI: 00000000000000b6
[  103.311837][ T6289] RBP: 00007ffe20169de0 R08: 000000000000ffff R09: 23c080ca08458805
[  103.311842][ T6289] R10: fffffffffffffffd R11: 0000000000000246 R12: 0000000000000002
[  103.311846][ T6289] R13: 00007f14e41df058 R14: 00000000010a2830 R15: 00007f14e41df000
[  103.311877][ T6289]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260319/202603191629.80fc4e2b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


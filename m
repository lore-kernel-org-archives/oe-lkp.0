Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18B4D599
	for <oe-lkp@lists.linux.dev>; Thu,  8 May 2025 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691318; cv=fail; b=k2cY+KSR81nGk/+G66W7/aDghvsUNHlF9UVfM14Wwqganc2rJL23jI9xHIy513duZC3fG03gn9QC3S0N0QWXHLLkqmOEJqVAap/JbpENztTj3/z9PiWMjIfCnOhl8g+QmB7GelmzhxYLgTJKH3TVAXJ4pEaekKLVYAXXtW99nxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691318; c=relaxed/simple;
	bh=LCzbP9bTxJs35QXJhNwAcMbM4MbvNa08thxqjP8J7ik=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=C2DOh5gDJXvAx09F7Pv1I5hZqotiLwEHQcrGQGLd6fZJs/psRSOkQc8vMZsgJOLqczB6Oe3x5u3oeI0d9sKzM4Ewn6pvhB7yDUeLpq2aWHBInYVNkwD6aXc71ETWEHEijvRNtzr/l+uaTOti1w3QezoGGZie1JlB2loKrLvKjKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSp8Mlq2; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSp8Mlq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746691316; x=1778227316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCzbP9bTxJs35QXJhNwAcMbM4MbvNa08thxqjP8J7ik=;
  b=OSp8Mlq26WpApDIpavm61tgTGwb6JsjKdxfHkqSmWzu8qqrcAh2O6agu
   o8/E7CLe5i4QCASDWddqob0oYFts3spcUu9X3QT8zKjFO1zxMV6Bx2r7t
   GpvJ5gbdJ9OyCqsaFzeV3HfW29rCCEULa3n9zMs6pCXiTsnPu2CzjnyDn
   dlGJzcZ9VX7Forms2AQc/nfl09+BcjuI1coWUMh0tTYxJ6H83iyLvYFJx
   gKCVO2Ns2iRKVZmefUNdNFgsMk0n2UnPOjHZoEC2c2cBwlPSUFyYFumq6
   559R4eZVZ1XOodsoyCtSueaLX7xXd4X3iq9ryUxcHOqgQyupJtypCx268
   A==;
X-CSE-ConnectionGUID: 5+m7V6SfRJanPXEG3xmHqA==
X-CSE-MsgGUID: clFa7YE3QduBM5kHOYzRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47560675"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47560675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:01:54 -0700
X-CSE-ConnectionGUID: cpETzsgWSp2ThBtVk2KBww==
X-CSE-MsgGUID: yBLwfmZiTFOVN3GjHMNw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135918441"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:01:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 01:01:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 01:01:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 01:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeKGWMlyu5GkNAfYbGi4Eian9HSJNIIG9wNbZ8++e0Mz6ztddO40ML5ru7H71Zp6cs6zQxELJ/x9Q6gSI3vy92Ex+CFU/kKCn0LYI3j6mQt/JAfqlDSAaW2ofq8HzEKCMXfdXsVJN/3qFaH3Yyrmv3/pBz4gpEuBDg5rJw2PrjqzqKx4lR19EJwN8yOYMQKVyqEkfy7mE7ozYltF9vMAaDrYvBjjpoNHG9ZDRyInUEbullEmkDfrWJClEOnmbOgrVMS6wrdke0Z3Iev3VONIQH8n14C3m1i/iNX6dbB1vyd4/eWe4agT6JEfm0XxJfI+5USzmNa+5ail9orQ/sIvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCG2DLKB+zcz8ZyFRgJy3aOxCMQcc2DE+k2dQYzKCZg=;
 b=aky4r8NKEXvkEPXmLtclfP5v13dM8WT7EEI/mRg0+iWq4rvtDgMF3Rvy+1jhJL8lWCLaD5WkZz2A0tMja58JYGdgYnpmK/wAS1Uq0fGFG4W/ZAAF1vQDcrEFtxsRIDl4ea84fQnD/OVlWozKmQxiY1P5SBcd+pFWBz4FolqMuc7s3NMd70Iv83rb4+MRUOrHiVAsf2mjfRK5geQ1E5wJ/0BI7G3ZHTHTtTDHZ5M1DtQdh/DeedMzYaAm2ex+PtINR8/xPZPpFx3F24jMqa3TRAgGt0jHgqNvo6Q1kgr31npcpQhOsBlL1BGGdnvz4uq7oLJIvhgDnOn5F54IMF3WDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 08:01:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 08:01:45 +0000
Date: Thu, 8 May 2025 16:01:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [koverstreet-bcachefs:bcachefs-put-folio-assert] [bcachefs]
 0718bafa21: last_state.incomplete
Message-ID: <202505081551.92a07edd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1P15301CA0052.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 754f8e48-49f7-44ab-608a-08dd8e0693ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uK5cnYx8fyLZiOuVXl0GyIJDSoyOWMg21XMffXb1Ok7+AmeSiRK6c1X4J5M0?=
 =?us-ascii?Q?QjWGLhZGhgBdWerYisDmkpR3TFnKm1VoGaUwC9yM410YJUajXNkgv9iLPW8v?=
 =?us-ascii?Q?OVhiU4/cKeqUDh/ThGwdjoHWWHedDBda1KuIZn14SeHue6qSljMWZ2inf1rJ?=
 =?us-ascii?Q?ThtJ57F/Ync51VUN6bJS04c+E9O/xFnrgdkKlwDAI3yVF7pSA6+FmT+icjqV?=
 =?us-ascii?Q?zw4f0SUPUWWbaRgRY6h+EoD7hV1VyQGDQJS+qNjOHvaySc7r2PfJbEzWZqkm?=
 =?us-ascii?Q?5qoSn/DKvWtpNBTxiVe/AHF92UPNJMm0wp0BtKdIiZ4XhG87og/IFZoJcp3Z?=
 =?us-ascii?Q?t04TkRpjH8n9lyqgRc16MI2UK+caB68/WIoE/kO9QOtgKkaB15wav62pdBD9?=
 =?us-ascii?Q?oV7ahPREJZ0ak2tf9OQCpVpaZl+bMEqGE/x94aLz3AMQHtmN+SWovKZY5Rb8?=
 =?us-ascii?Q?IFni8fG1dFPBB3SlUMise6qfrbXdQGnJS16NovYoKzGsl+yqJU5xamYar0fw?=
 =?us-ascii?Q?E1frFyE5fH2b4KddjGAfo5Jv8yldSE/rrBXqW5anyKD3QPiGpADrRhKQEvzN?=
 =?us-ascii?Q?S5vMb5PQWYhsi2holB433SCfLKS+tOChDK9IID2BarTI+q4q4kSy2Z6GPkpY?=
 =?us-ascii?Q?gycj0R2OWx1Mn8OHA6vfKokWR5AX/OZKBxGEJpcXp4Ff8IYVHUN4vbJ7SsUE?=
 =?us-ascii?Q?UaBe21dzRUyJs5qbeaTDJjjbkLHnnDLtFOyQaf0ITpRfhs92Wo8TTHa119mI?=
 =?us-ascii?Q?D36A+SA2oJpRzNJhQboo3z9gW1ZG1sOkHXcuTfMlqgWS5p2k1+f0RbTfg7II?=
 =?us-ascii?Q?IEtgWVfBCjyC1HMwx/DrrI4XCKlqt3jzHyVKTQs6geesMVOSe/UGaXt3iZh4?=
 =?us-ascii?Q?hECVwOviGgoIdY3K8th2rz8w0cdY5G6C0H8RcAOvTH0uAGAsmu2i5+NrXhuX?=
 =?us-ascii?Q?YQcivadrKjYxRrG6Avwt3OJVar+u8tdkKL3iopxj6yrYGTwcWCV7gNgiY8T0?=
 =?us-ascii?Q?/qnO8k8+DIaoVIbEN1mf3Ru2K+gunO1bbgTHm3EDxt06CC5ZaMgj9jshBGQt?=
 =?us-ascii?Q?ToAlc4sRWyemCrkFrIEQxW9vAo2LVxrc5WUpcVaMwNE/ImTYjsdbO384TO5m?=
 =?us-ascii?Q?OXuNNrm0uB1gEkabhNYFaudb5j1cG3V5p8ENvbmeAWE0iZd8UFXW1zEGJRLf?=
 =?us-ascii?Q?pmSVU5VYv17e1axc3t+BulxSBzmsUpUNtwJmQBaEr2syBikVe+B51nho+Tml?=
 =?us-ascii?Q?qd72xSSR9vqkbFokw6tuHyNsRcw+UZen55j5MiqotQrm+GLevXK+rfDinCdu?=
 =?us-ascii?Q?qgmDmTZUi++BTNeHcK7Wpo4ENT585vJnt2Zg8UO2zFeOrwI+bmBVaTj/rjFz?=
 =?us-ascii?Q?xyt1YsfOTDOTyQptbQolf/gwmyy7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRo+SDVH6LcGY81Rzkt/RqlNBs/u32BZ6mRcUROAOiLAf9tvhhCjLJSW0A9e?=
 =?us-ascii?Q?fgknHJ+Q3zm816pB56ahXDTVKBWBmBU3AkQX2YNCCWiJNu3kfkv7S1tEylxQ?=
 =?us-ascii?Q?EoE4haOPkeeAwwJPY9sByd6e3CaKBp9DQGJWEFVK2VriU/7kJ/LB0pkz/M6E?=
 =?us-ascii?Q?G4FcZpHcd5fssBJ90evJeOsggas5Fokzd0BxvaVs3mUU3OvzdfZWjxECaTOe?=
 =?us-ascii?Q?YmL1m7pvNMaL7Orz4md+eG1Gi7BfmPcbZzSTr3M6SoE6gtfU7v/WXFwyVtMr?=
 =?us-ascii?Q?9LdEjrTsi/t0tfmDrWU4qyxPxu58zZICHRMg5ENxxkPbxQyOEOLt1rHyYDfv?=
 =?us-ascii?Q?zAe4lYhNrni8Al7Pi4Bp3Pd9LyAG0xmKnIcG43qQcWd3mBdXVWGGkgk69PYS?=
 =?us-ascii?Q?vhaQTXNj7j5+6xBfLaz6a5FGrWNkgT+JmcMxOWiEGh87olN0v6LeEufnLIIZ?=
 =?us-ascii?Q?vATjuK9icAFOkkkFENLuKf8Yyq5GAb9vb26IVAowKc3h4FE7LcTzOpedJQ74?=
 =?us-ascii?Q?x0pD6kDFjQyNBRGr744etmJOUgzEinpUv5Bw4hS9wR2YEAb/6bV7JtASfNeL?=
 =?us-ascii?Q?p/zhHhk9fDlTd29waSxS9y8u80ztxOWbqufVsVIIFTY7fPPuT1hkRwuefHRo?=
 =?us-ascii?Q?QsA9o8TKCYtfebDiNlRldFN8eyTbhULKz3BK6VZRK7SZW1x25HXsX9bsEe+w?=
 =?us-ascii?Q?L5CcGK7LP5ASK1oziCWBkwQMT4t27vHGXrUcN/NfBR0hiNE7DgVBBkSejv7I?=
 =?us-ascii?Q?JfHE6TUQnkXcBAmDSZqrm5HOhWwU1mgO3X15UXaRUri0apz+pzuqGESoccns?=
 =?us-ascii?Q?VXEG0DfwYRlT/jGfjRno7T/QoWHbz2iWgqInDaQh+QfDoR0Dh+OW4nmrmap2?=
 =?us-ascii?Q?YzOYeegvcbu1vjqL9Zs/iAAdp7WyQeO0YyhEcJwogvls8gqqRJ3m0Cu1MoH4?=
 =?us-ascii?Q?u0eYovhEPYX6T3r8vPIqAuUtmRkHLpbYEIwy3zmonQb8p50+nAULRUWWCHxP?=
 =?us-ascii?Q?O31Jg89ZbpTIEH16yL8htCimjkU1a8JElnPRW1fw7R4f/FU28QO0mmUNoV0Q?=
 =?us-ascii?Q?nB6nrgC3koQy7TlFY6Zkq3GqJKECAZ8oT4S7EfgI7sJEEaPZBqQo+oFohKs8?=
 =?us-ascii?Q?lyz/jxVv9xTesR+KSlFReEsP4p6uojRWDUom3eqbYao6RVP1BsfGGAmVACGr?=
 =?us-ascii?Q?J3hBzShsbpMCOI27iBNGQ8cDVF+E045blaQdYJlk5xEQelVVxqSY823NPv0F?=
 =?us-ascii?Q?FXo+6wljj5ZE9L67hFeofQYwKuVuLMGGf20t2KkdEdr4pG5VX9YRvacyXNeY?=
 =?us-ascii?Q?qnqsQpczPFYlPQmuaAmw0l/2E15HOx3Sy3uYWRjsxC9ZJ5BZGIfG2EbgskpD?=
 =?us-ascii?Q?E9+2SxW9G+l4JN5lxMGJb+iiV3LLvkmu0cBioxwEKnro1MO+QGYvedZB0UzB?=
 =?us-ascii?Q?wS3Cy7G53++0KAH5VGMrVUT/6JKDQCUK6SWFoXF/vHqGZO4uO1ijFsn6TeIi?=
 =?us-ascii?Q?sph5Ke1FDgVpsL8nSuioa7CjSz7/OUV4vXV/6p9/39AD4fbxEnXJVnS7cfnT?=
 =?us-ascii?Q?fODP5i5GqjXLwFIgz37RyP5+c33iv38aEtF8BZEVLMZlW9DlMDGkGJufyvkj?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754f8e48-49f7-44ab-608a-08dd8e0693ad
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 08:01:45.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qt3P/mXka4OKgQAN4tq0zOL8nYRZbAexPydKGJrZDxDbXaE3CG2gbHbuZGO8Fz/93AMyDU7G2UCXAbzi9duyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "last_state.incomplete" on:

commit: 0718bafa21dbd0eba0a3c80ae05d79e246927c17 ("bcachefs: Single err message for btree node reads")
https://github.com/koverstreet/bcachefs bcachefs-put-folio-assert

in testcase: xfstests
version: xfstests-x86_64-8467552f-1_20241215
with following parameters:

	disk: 4HDD
	fs: bcachefs
	test: generic-387


config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505081551.92a07edd-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250508/202505081551.92a07edd-lkp@intel.com


we don't see any Call Trace in dmesg we uploaded in above link, but see below
informations, not sure if they are useful.
due to this error, the xfstests doesn't really run, that's the reason of
"last_state.incomplete" in the title.


[   77.031073][ T2608] bcachefs (sdb1): starting version 1.13: inode_has_child_snapshots
[   77.031073][ T2608]   allowing incompatible features above 0.0: (unknown version)

[   77.049184][ T2608] bcachefs (sdb1): recovering from clean shutdown, journal seq 21

[   77.057471][ T2608] bcachefs (sdb1): Doing compatible version upgrade from 1.13: inode_has_child_snapshots to 1.25: extent_flags
[   77.057471][ T2608]   running recovery passes: check_allocations,check_extents_to_backpointers

[   77.168574][ T2608] bcachefs (sdb1): error reading btree root btree=accounting level=0: btree_node_read_error, fixing

[   77.179289][ T2608] bcachefs (sdb1): bch2_fs_recovery(): error btree_node_read_error

[   77.185482][ T2608] bcachefs (sdb1): bch2_fs_start(): error starting filesystem btree_node_read_error


[   80.187629][ T2608] bcachefs: bch2_fs_get_tree() error: btree_node_read_error

[   85.405810][ T1536] mount: /fs/sdb1: can't read superblock on /dev/sdb1.
[   85.405823][ T1536] 
[   87.331561][ T1536]        dmesg(1) may have more information after failed mount system call.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


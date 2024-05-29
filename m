Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE4167D9F
	for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968421; cv=fail; b=HZXfZpARTMzXlsrXyk6/2tRMJGw7bFiZhXELWEwq8oEN8Q9u7I/8nQAuJ0Sd0jL8tmfxQxWUSydlbzzH4zA6UHkyhoMR3oO3tTN4R4Ychr70HE9LceGi7PBbwNrummCyEB8gHKrRqGarT+bK5+GlmJHk4Htg16mXT0/IWHrXV5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968421; c=relaxed/simple;
	bh=2wtCvGXVJSfDLfS/pxW/3hT5jApB7vdjNYkOPH/evf4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NwdPWfQZpGn4vpmzyVteCZuWF8+8ttavRPGGk5W68e7Lj+ckOmdXHLDjoQSXBPWajIg/ZV7IPGpUDJD2cg0EZclLhyFRC03vCUhP6vH8HlzqZyxoWqKtoNHrJCFb0yOR+5Bt9jEYmljxEs6w8LZKynye29n33OsHt1N0iuECSP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcAb+k+v; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcAb+k+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716968418; x=1748504418;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2wtCvGXVJSfDLfS/pxW/3hT5jApB7vdjNYkOPH/evf4=;
  b=jcAb+k+vIE+BzLoHY9pfTpVozOgsLZMFajcwRF+UO83WOHFZOP6XMGMo
   9gFCcUhV4KvdE0wSKJari+sh14NVWpQ5TqURGSH1HfAKuFUAGal1mJ5O9
   RzQDedziMRkrki+o/wL3osRVGfJKzA7KK+HcWHBnu+2qQFMkDKl1p4zJs
   5YPftIZav8GmPXUBCco1fMT5x0SsCAeIQKThW3K+9x4qBcRGKL1s8jxF6
   xho/RHoF++cwKEo0+2G1RJp2KVOewUrw2rnBAUrQl6EzJQSVlRoxsLW90
   /nEVAxUy9kZoZoqYVCAOhEzg7LalPb4Qe7SL6ZMIY1zyUBE1rYZTH7ybZ
   g==;
X-CSE-ConnectionGUID: KCa95SM5TdCTa7Om6k1mow==
X-CSE-MsgGUID: tK1f99DSQa+NDfFeTrM33g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13473806"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13473806"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 00:40:17 -0700
X-CSE-ConnectionGUID: ELR2n3cmRYSB9zz//1C2Cw==
X-CSE-MsgGUID: kZQnnp0ITeCl28CPff4lwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35428409"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 00:40:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 00:40:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 00:40:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 00:40:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 00:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo5x4vLVKs3IxHPo43Gdrc0mOmtqNkR7iqlcS3A8oxQOHoQXC9g7s8RqIzYXBJwfK9+pvSdUzVOFOagwSI+LFs56zwqUuu1andH/nUbJiTR6faPidC5ZxpnyKQ7QNjTla0ZQyCy2oFdCIGjAgxn/yEvurz8Cg5UAhBf/ZZBphZMBl1aBI48jnS2zyIqnbuWu13anyR3a18w45op0vdCJ36f9Cz3KD2zCiSBSjvJmStHXvJgQiVh5+AkPxOq6ILrNbpHjk7T4j5fxDvAII4tJ1v72NOZ+RwApWFI05nRSJJWEwCp3CWcITcnWPRnAr5SX8q5LCVza97ljfwWMQTAPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrPtpCLfW6penObdcj15pNMeeLfr71MbpcsCc6uiskE=;
 b=j5fT8TWpNRdk9oXl0ajcOeYsvemsp0QEugkdroZeIFXx3d0cn1IolPwIoS/74c7cpEjAi/y+qmBfQdVu3g4Fo4Hl+4xOa6JiaxqpJxiKrN2444jvlsoF7qN9YWHRk1w1tzdwwjEitJ5GtZKufigF6dKAW2IzyL+Yi1nP08riL9kpPgqtep5xOK4dYauEdfLBNLHkZbBwYOqAGqn4jRyj0wnC+eGw21vF+MsqN+T+79LUBSu352gCuhByJb31TQnEAp8PgaWqOb7yu3zQePgLNSOUlrjhIS85QY75uCIDpv/za/dA+7JF1hN36MSA2IQjjdJWSdHYLZbY/XSHXjUeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB8199.namprd11.prod.outlook.com (2603:10b6:208:455::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 07:40:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Wed, 29 May 2024
 07:40:12 +0000
Date: Wed, 29 May 2024 15:40:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:nfs-large-folio] [nfs]  9349d8ed5c:  fsmark.files_per_sec
 20.2% improvement
Message-ID: <202405291523.d708cc69-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bda6e75-9582-4343-40c9-08dc7fb292ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?k4ThLlBGt+FpBSb8ApvKhky5I0ZyJbCiWtRfaoCrakC0zGkXJEXYVl9+ka?=
 =?iso-8859-1?Q?dQzjClNl7vPi8BHR33U53bafwshmFH1HQNJwLvmEvLWeAdowmsv1CE4tyl?=
 =?iso-8859-1?Q?4ai3DYyp850LIu/UXMFdrUSJ15rg6rJlL18XxpJNbQKMt7XEcxeSz/iaCl?=
 =?iso-8859-1?Q?wf6eHQ1P6EPfwiWxwDNS/7me/MZ+Uc1KiD7nv73zDjeJqm+jvScTDAawon?=
 =?iso-8859-1?Q?mDq6d8qjgRQIY40rSsBREchRcXdFJfigdoXbu1hVTBrISLlNeZflHCFLwx?=
 =?iso-8859-1?Q?igMQTt34mqCJnbQh3MGpc9xY3jFkp4W0ceY48az6ouKXpRep5Vy2tELAWM?=
 =?iso-8859-1?Q?OLDtIGZfG+pCzT1Srk+r4qzRXNQ1AkBB24NOHErWPWBci14B0v89kF3PIY?=
 =?iso-8859-1?Q?rPgqwqH/mhNMCzZ5FKWFW/L1+7BvN1drfwlyGtm9KHs6GPPSGNxNqFyPBu?=
 =?iso-8859-1?Q?yjDhhTIheDieHHb+3euxtUBMX0Xy0Vf9739AsbppqfRVFeWT/M1ylwcWWZ?=
 =?iso-8859-1?Q?Q59efc2LAXjlQCfdDGZEIwcpPlbfji2CR4lCjxHoP38lFiUKP3XGNvr8eP?=
 =?iso-8859-1?Q?1oidpVaNg3eQK2Sl4OwwzdZPpLdHsvqe0oFz3YwjOJb8pjDw7uTRt9DbHf?=
 =?iso-8859-1?Q?0b53f9MeiLbYudD/k2SgIdh1BCzZDXls4gCtiRVIZvFGFJE1yov33b6vth?=
 =?iso-8859-1?Q?Pt72/aTpMsel+XH71xTlIpNTaDDEWWF2pCGTOSwytsvXjOfjBVTyOjeDBf?=
 =?iso-8859-1?Q?iPO5MU0cmGdBKiAepElWfYNh8BWN3fOTjNwoRcfSojd08DDyuQgp3XQplb?=
 =?iso-8859-1?Q?pPeDWRrCprWykMnOYmMXGF9YUUlmNppwix2TklKiDN+Eef/vT0AymV52Fm?=
 =?iso-8859-1?Q?eHauJwpNDZ3Rb6F3SqZeJ14zTxoh/KgkEzKiBgpQPvRaJG4lmJFuuS9MgC?=
 =?iso-8859-1?Q?bZ+wNEOYQH5gbTQavbFSf2WQ/PECGGUkH7k7E4ostqYPnsJAd0nXVmBUVk?=
 =?iso-8859-1?Q?3wp4I8ScY5xKGCBGLO0MwLXGqaqNhVph9P2MP2vl2fpBwYaJ3/is4PGbfM?=
 =?iso-8859-1?Q?j+o8uYso+lJYwrd2X0Aux8bQrHO4806mHkYThw4uMD+yiyMe5aYsg/+Aco?=
 =?iso-8859-1?Q?Jfe20pPQaypqMV5oOVBu3GKEdVbsJvTHOlKkSCh3o1e+bc5rtUXFvu0Vo3?=
 =?iso-8859-1?Q?R0adS/YRtH9jvZ8eX8oLiXT1sahDoKiTL6HDb/69qNFia0od29jZ0rr6h6?=
 =?iso-8859-1?Q?BRMPrV18jir2TVzsrwthTcuZlbcC+D/XNpt+jL/70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mk0f6gd0iVFkFrfDtgPlFvsxul2BOTbfgHU7n6zENgmbMWv+EC6gT/rg3q?=
 =?iso-8859-1?Q?uAP8EiFk9RLmMqJnjOoNdR3sthg0rgzHmCE48SQ8yCW87eJaHJHYb7fzol?=
 =?iso-8859-1?Q?PB4DLhOtIzPwQCAadbR1EOCxh6nMbjZIn0wuyajNXtuF5MZp2j9cYU00Iu?=
 =?iso-8859-1?Q?Tteuy+3H+5+noyNBsuBW1TVTDWiihH2OpZLuUcK3SbQZ0yA+UFIdrMTjLG?=
 =?iso-8859-1?Q?7hqChiKeR39eiW1JA/n3bt3ir3tNy5+fZpFfTZgT8A28/MslJ8aV+qNc39?=
 =?iso-8859-1?Q?3GVqPOPvL0+je+afqJ6uBg0QnMmAcGsytmOFZx+Q5iqNv2jN2dcY0PDBHn?=
 =?iso-8859-1?Q?5Vk1oAXraTmb9c5iOwmvVLMy1uCHN3rpgKpFjHJeJBlcY9JZJI+trPs0LN?=
 =?iso-8859-1?Q?v+76lRknrvUQWPhS4qQYbTWhw1OO7vtvA1DjNJUTHDR4nr1AZfXLrP7I3x?=
 =?iso-8859-1?Q?gq62/8Lq1Mo/NFrPjeNeXVKVRnmsJSTW/toZhZ1wfouST3hIH1ByE/kv7I?=
 =?iso-8859-1?Q?Co/WYMEfxRfAjRl8VBaCZeh5OWhd8hQfeS9QPkrKaFRDPYKAm85aFkvh/W?=
 =?iso-8859-1?Q?2yBLUQitWKuOqS5oettmjkGmKVvZ7B6t1yNZfkpTad1+Br/WWUBpl+g1n8?=
 =?iso-8859-1?Q?q5EAv+CorYxvhzFfeCi+Uj4OPm3pFWn4TLCAob7EjaMfwMMfm8/nju8sk0?=
 =?iso-8859-1?Q?66KFsGrGc7GcrLqXxGRLtugp17obAWTdJErZaXuqdLQ8oqZs4dEmfXtHdr?=
 =?iso-8859-1?Q?PplU98SeQdkwVb4D3JG2feKzMSBr+JX+eMpk/3t0uKA24HTIYusKetFMnN?=
 =?iso-8859-1?Q?gd7BygRLMHYuVM1EbAwF6QAjv7wJvB3aKoodR8udDXMmLKMOqo5XIxcsuH?=
 =?iso-8859-1?Q?z2FaxYM6ofHc3n8d2rsidNdRAcP+/ezDZHxBUOvgnCN8Oe5nn0VUEthA/F?=
 =?iso-8859-1?Q?ns/TFdSEA2fOtKEUcRQtzrE/i8VlRSmIihLWIx/Z5CoyXOO2Lq6WlMjbh2?=
 =?iso-8859-1?Q?/Qp8iVeuOirBIBVxZHu+uAqsrN1xuPEV5dRLzSK868MTiJdwFSTggyacvZ?=
 =?iso-8859-1?Q?AvxfDL7xZWWRxK81fshvH6/1Pdps0Pq2nDRM0jpvWQm4ch1SQRL8j/b506?=
 =?iso-8859-1?Q?TQ8Es2ANmEYPKIMA0u0oRar1bv/WFED84dz2YHzZIW22zxu+U02xQcPUvx?=
 =?iso-8859-1?Q?DRtJZCzjIB3QU/S91k8AWH4bSn+slLBkZ2SpO1RRzPsgzO2ImMDUCAIyjo?=
 =?iso-8859-1?Q?BE77d0Ywv/On3rukgFpTKv5/U0BIKTPe/LsC+O706SDeSjuGVLFv4trX9X?=
 =?iso-8859-1?Q?EEQXmZbiE+z5GAcguiB0TpkWD6DxlF5d89N9NlHtjmMLn5zbbK2CbdKiOD?=
 =?iso-8859-1?Q?HLuHHhXZxBXBKpX6YSXZdN/4cegEkcH3CgsQ4YPzU6CTBpvxqbznMFjBmA?=
 =?iso-8859-1?Q?//mHJP14SFogmc5+3NP+gSmNk8ENqn+56iaBELQ2crJtJxeNwtNC4Y7Pz/?=
 =?iso-8859-1?Q?mebFgsBLmIOofqUF8A4DuCPmKPRZbKzMsifletYr2Rhsujh8ZyuLwOo5Hm?=
 =?iso-8859-1?Q?nGielHpkQRNIU/5ZcEV4ap2oYqlATwSFkcuI6j3i2IEIyx4UPyxXOY8rhA?=
 =?iso-8859-1?Q?7rmX/JNsuLkfp205ODbQh4uZtkOTY+Kccvgkljz9a1jiJdk7gh6WUPrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bda6e75-9582-4343-40c9-08dc7fb292ad
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 07:40:12.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcA1H8gv3VtGoIXWVhNVdVwL1r3RmzOpmd62rp4h2yZff4kcq9rTJ9nu5SVTuGm2SWXwE/sLBI0LHBnlCtp6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8199
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 20.2% improvement of fsmark.files_per_sec on:


commit: 9349d8ed5c28fa454a373af3435762d6828e6c2d ("nfs: add support for large folios")
git://git.infradead.org/users/hch/misc.git nfs-large-folio

testcase: fsmark
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
parameters:

	iterations: 1x
	nr_threads: 1t
	disk: 1BRD_48G
	fs: ext4
	fs2: nfsv4
	filesize: 4M
	test_size: 24G
	sync_method: fsyncBeforeClose
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240529/202405291523.d708cc69-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-13/performance/1BRD_48G/4M/nfsv4/ext4/1x/x86_64-rhel-8.3/1t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-csl-2sp3/24G/fsmark

commit: 
  84c6edb7ce ("filemap: Convert generic_perform_write() to support large folios")
  9349d8ed5c ("nfs: add support for large folios")

84c6edb7ce79f62e 9349d8ed5c28fa454a373af3435 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.943e+09 ±  4%     -16.9%  3.277e+09 ±  5%  cpuidle..time
   2448614 ±  2%     -23.6%    1869696 ±  3%  cpuidle..usage
      0.23 ± 11%      +0.1        0.34 ±  5%  mpstat.cpu.all.iowait%
      0.05 ± 12%      +0.0        0.06 ±  7%  mpstat.cpu.all.soft%
     79007 ±  4%     -19.2%      63858 ±  3%  meminfo.Active
     24660 ±  8%     -53.6%      11438 ±  9%  meminfo.Active(anon)
     37977 ±  6%     -47.0%      20135 ± 12%  meminfo.Shmem
    907413 ±100%    +193.0%    2658813 ± 29%  numa-meminfo.node0.Unevictable
     20125 ± 47%     -68.0%       6437 ± 57%  numa-meminfo.node1.Mapped
   2232220 ± 41%     -78.5%     480821 ±161%  numa-meminfo.node1.Unevictable
    582180 ±  4%     +19.2%     693739 ±  5%  vmstat.io.bo
      0.24 ± 22%     +34.8%       0.32 ±  8%  vmstat.procs.b
     60361 ±  4%     -40.3%      36063 ±  5%  vmstat.system.cs
    226853 ±100%    +193.0%     664703 ± 29%  numa-vmstat.node0.nr_unevictable
    226853 ±100%    +193.0%     664703 ± 29%  numa-vmstat.node0.nr_zone_unevictable
      5156 ± 47%     -67.3%       1688 ± 53%  numa-vmstat.node1.nr_mapped
    558055 ± 41%     -78.5%     120205 ±161%  numa-vmstat.node1.nr_unevictable
    558055 ± 41%     -78.5%     120205 ±161%  numa-vmstat.node1.nr_zone_unevictable
    156.97 ±  4%     +20.2%     188.70 ±  5%  fsmark.files_per_sec
     40.32 ±  4%     -17.9%      33.11 ±  5%  fsmark.time.elapsed_time
     40.32 ±  4%     -17.9%      33.11 ±  5%  fsmark.time.elapsed_time.max
     38.33           -37.0%      24.17 ±  2%  fsmark.time.percent_of_cpu_this_job_got
     15.16 ±  2%     -49.5%       7.66 ±  2%  fsmark.time.system_time
    901484 ±  4%     -72.6%     247009 ±  3%  fsmark.time.voluntary_context_switches
      6167 ±  8%     -55.7%       2731 ± 10%  proc-vmstat.nr_active_anon
   7167212 ±  3%      -4.4%    6851507        proc-vmstat.nr_file_pages
  21549200            +2.1%   22004157        proc-vmstat.nr_free_pages
   6359856 ±  4%      -4.9%    6049312 ±  2%  proc-vmstat.nr_inactive_file
      9508 ±  6%     -48.0%       4941 ± 10%  proc-vmstat.nr_shmem
      6167 ±  8%     -55.7%       2731 ± 10%  proc-vmstat.nr_zone_active_anon
   6359866 ±  4%      -4.9%    6049314 ±  2%  proc-vmstat.nr_zone_inactive_file
  21779997 ±  8%     -14.5%   18618378 ±  3%  proc-vmstat.numa_hit
  21641144 ±  8%     -14.6%   18487630 ±  3%  proc-vmstat.numa_local
    868.50 ±121%   +1028.5%       9800 ± 92%  proc-vmstat.numa_pages_migrated
     28100 ± 17%     -87.0%       3660        proc-vmstat.pgactivate
 1.626e+09 ±  2%     -11.6%  1.437e+09 ±  5%  perf-stat.i.branch-instructions
     64021 ±  4%     -39.7%      38588 ±  5%  perf-stat.i.context-switches
      1.25           +11.4%       1.39 ±  2%  perf-stat.i.cpi
  8.21e+09 ±  2%     -11.1%    7.3e+09 ±  5%  perf-stat.i.instructions
      0.84            -9.5%       0.76 ±  2%  perf-stat.i.ipc
      5314 ±  4%     +13.7%       6042 ±  4%  perf-stat.i.minor-faults
      5314 ±  4%     +13.7%       6042 ±  4%  perf-stat.i.page-faults
      3.33 ±  6%      +0.3        3.64 ±  2%  perf-stat.overall.branch-miss-rate%
      1.18 ±  2%      +9.4%       1.30 ±  2%  perf-stat.overall.cpi
      0.85 ±  2%      -8.6%       0.77 ±  2%  perf-stat.overall.ipc
 1.586e+09 ±  2%     -12.2%  1.393e+09 ±  5%  perf-stat.ps.branch-instructions
     62456 ±  4%     -40.0%      37443 ±  5%  perf-stat.ps.context-switches
 8.008e+09 ±  2%     -11.6%  7.076e+09 ±  5%  perf-stat.ps.instructions
      5160 ±  4%     +13.0%       5832 ±  4%  perf-stat.ps.minor-faults
      5160 ±  4%     +13.0%       5832 ±  4%  perf-stat.ps.page-faults
  3.37e+11 ±  6%     -27.8%  2.434e+11 ±  3%  perf-stat.total.instructions
      3.20 ±  9%      -2.2        1.04 ±  6%  perf-profile.calltrace.cycles-pp.rpc_async_release.process_one_work.worker_thread.kthread.ret_from_fork
      3.20 ±  9%      -2.2        1.04 ±  6%  perf-profile.calltrace.cycles-pp.rpc_free_task.rpc_async_release.process_one_work.worker_thread.kthread
      2.64 ±  4%      -2.0        0.62 ±  5%  perf-profile.calltrace.cycles-pp.nfs_write_end.generic_perform_write.nfs_file_write.vfs_write.ksys_write
      6.16 ±  3%      -2.0        4.19 ±  2%  perf-profile.calltrace.cycles-pp.generic_perform_write.nfs_file_write.vfs_write.ksys_write.do_syscall_64
      6.22 ±  3%      -2.0        4.25 ±  2%  perf-profile.calltrace.cycles-pp.nfs_file_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.74 ±  4%      -1.8        0.90 ±  4%  perf-profile.calltrace.cycles-pp.fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.calltrace.cycles-pp.nfs_file_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
     11.34 ±  2%      -1.7        9.68 ±  2%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     11.40 ±  2%      -1.7        9.75 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     11.41 ±  2%      -1.6        9.76 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     11.37 ±  2%      -1.6        9.72 ±  2%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     11.69 ±  2%      -1.6       10.08 ±  2%  perf-profile.calltrace.cycles-pp.write
      2.26 ± 13%      -1.5        0.73 ±  8%  perf-profile.calltrace.cycles-pp.nfs_write_completion.rpc_free_task.rpc_async_release.process_one_work.worker_thread
      2.27 ±  2%      -1.5        0.76 ±  5%  perf-profile.calltrace.cycles-pp.file_write_and_wait_range.nfs_file_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.44 ±  4%      -1.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.nfs_file_fsync.__x64_sys_fsync.do_syscall_64
      1.44 ±  4%      -1.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.nfs_file_fsync.__x64_sys_fsync
      1.43 ±  4%      -1.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.nfs_file_fsync
      1.43 ±  4%      -1.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.nfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range
      1.42 ±  4%      -1.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.write_cache_pages.nfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      1.35 ±  4%      -0.8        0.59 ±  3%  perf-profile.calltrace.cycles-pp.nfs_write_begin.generic_perform_write.nfs_file_write.vfs_write.ksys_write
      1.29 ±  4%      -0.7        0.57 ±  3%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.nfs_write_begin.generic_perform_write.nfs_file_write.vfs_write
      1.43 ±  4%      -0.6        0.88 ± 13%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.55 ±  4%      +0.1        0.67 ±  7%  perf-profile.calltrace.cycles-pp.folio_end_writeback.ext4_finish_bio.ext4_release_io_end.ext4_put_io_end.ext4_do_writepages
      0.74 ±  7%      +0.1        0.86 ±  4%  perf-profile.calltrace.cycles-pp.mpage_submit_folio.mpage_map_and_submit_buffers.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages
      0.72 ±  6%      +0.1        0.86 ±  7%  perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      0.98 ±  7%      +0.2        1.14 ±  4%  perf-profile.calltrace.cycles-pp.mpage_map_and_submit_buffers.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages.do_writepages
      0.76 ±  6%      +0.2        0.93 ±  4%  perf-profile.calltrace.cycles-pp.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      0.74 ±  6%      +0.2        0.91 ±  4%  perf-profile.calltrace.cycles-pp.ext4_da_map_blocks.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write
      1.04 ±  6%      +0.2        1.21 ±  3%  perf-profile.calltrace.cycles-pp.mpage_map_and_submit_extent.ext4_do_writepages.ext4_writepages.do_writepages.filemap_fdatawrite_wbc
      0.75 ±  3%      +0.2        0.94 ±  5%  perf-profile.calltrace.cycles-pp.ext4_finish_bio.ext4_release_io_end.ext4_put_io_end.ext4_do_writepages.ext4_writepages
      0.76 ±  3%      +0.2        0.94 ±  5%  perf-profile.calltrace.cycles-pp.ext4_release_io_end.ext4_put_io_end.ext4_do_writepages.ext4_writepages.do_writepages
      0.64 ±  4%      +0.2        0.83 ±  2%  perf-profile.calltrace.cycles-pp.__block_commit_write.block_write_end.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter
      0.78 ±  2%      +0.2        0.97 ±  5%  perf-profile.calltrace.cycles-pp.ext4_put_io_end.ext4_do_writepages.ext4_writepages.do_writepages.filemap_fdatawrite_wbc
      0.64 ±  4%      +0.2        0.84 ±  2%  perf-profile.calltrace.cycles-pp.block_write_end.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      1.21 ±  4%      +0.3        1.46 ±  3%  perf-profile.calltrace.cycles-pp.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      0.48 ± 45%      +0.3        0.74 ±  4%  perf-profile.calltrace.cycles-pp.__alloc_pages_noprof.alloc_pages_mpol_noprof.brd_insert_page.brd_submit_bio.__submit_bio
      0.74 ±  5%      +0.3        1.00 ±  2%  perf-profile.calltrace.cycles-pp.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_iter_write
      1.27 ±  5%      +0.3        1.54 ±  6%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      0.52 ± 45%      +0.3        0.80 ±  3%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol_noprof.brd_insert_page.brd_submit_bio.__submit_bio.__submit_bio_noacct
      5.29 ±  6%      +0.4        5.68 ±  2%  perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread
      5.49 ±  6%      +0.5        5.95        perf-profile.calltrace.cycles-pp.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread
      5.49 ±  6%      +0.5        5.95        perf-profile.calltrace.cycles-pp.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread.ret_from_fork
      2.08 ±  6%      +0.5        2.57 ±  7%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.18 ±141%      +0.5        0.67 ±  6%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_noprof.alloc_pages_mpol_noprof.brd_insert_page.brd_submit_bio
      2.16 ±  6%      +0.5        2.66 ±  8%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet6_recvmsg
      2.29 ±  6%      +0.5        2.79 ±  7%  perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet6_recvmsg.sock_recvmsg.svc_tcp_sock_recv_cmsg
      2.16 ±  6%      +0.5        2.66 ±  8%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet6_recvmsg.sock_recvmsg
      2.19 ±  4%      +0.5        2.71 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.brd_insert_page.brd_submit_bio.__submit_bio.__submit_bio_noacct
      2.43 ±  6%      +0.5        2.96 ±  7%  perf-profile.calltrace.cycles-pp.svc_tcp_read_msg.svc_tcp_recvfrom.svc_handle_xprt.svc_recv.nfsd
      2.41 ±  6%      +0.5        2.94 ±  7%  perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet6_recvmsg.sock_recvmsg.svc_tcp_sock_recv_cmsg.svc_tcp_read_msg
      2.41 ±  6%      +0.5        2.94 ±  7%  perf-profile.calltrace.cycles-pp.inet6_recvmsg.sock_recvmsg.svc_tcp_sock_recv_cmsg.svc_tcp_read_msg.svc_tcp_recvfrom
      2.42 ±  6%      +0.5        2.95 ±  7%  perf-profile.calltrace.cycles-pp.sock_recvmsg.svc_tcp_sock_recv_cmsg.svc_tcp_read_msg.svc_tcp_recvfrom.svc_handle_xprt
      2.42 ±  6%      +0.5        2.95 ±  7%  perf-profile.calltrace.cycles-pp.svc_tcp_sock_recv_cmsg.svc_tcp_read_msg.svc_tcp_recvfrom.svc_handle_xprt.svc_recv
      2.52 ±  4%      +0.5        3.05 ±  4%  perf-profile.calltrace.cycles-pp.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_iter_write
      1.65 ±  3%      +0.6        2.20 ±  7%  perf-profile.calltrace.cycles-pp.copy_to_brd.brd_submit_bio.__submit_bio.__submit_bio_noacct.ext4_io_submit
      2.66 ±  6%      +0.6        3.24 ±  7%  perf-profile.calltrace.cycles-pp.svc_tcp_recvfrom.svc_handle_xprt.svc_recv.nfsd.kthread
      0.00            +0.6        0.58 ±  7%  perf-profile.calltrace.cycles-pp.__folio_end_writeback.folio_end_writeback.ext4_finish_bio.ext4_release_io_end.ext4_put_io_end
      3.56 ± 15%      +0.7        4.24 ±  5%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.ext4_buffered_write_iter
      2.99 ±  4%      +0.7        3.74        perf-profile.calltrace.cycles-pp.brd_insert_page.brd_submit_bio.__submit_bio.__submit_bio_noacct.ext4_io_submit
      2.30 ±  7%      +0.9        3.16 ±  7%  perf-profile.calltrace.cycles-pp.memcpy_orig.copy_page_from_iter_atomic.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev
      2.36 ±  7%      +0.9        3.24 ±  7%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_iter_write
      1.88            +0.9        2.80 ±  2%  perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.generic_perform_write.nfs_file_write.vfs_write
      1.96            +0.9        2.89 ±  2%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.nfs_file_write.vfs_write.ksys_write
      4.69 ±  3%      +1.3        5.99 ±  2%  perf-profile.calltrace.cycles-pp.ext4_io_submit.ext4_do_writepages.ext4_writepages.do_writepages.filemap_fdatawrite_wbc
      4.69 ±  3%      +1.3        5.99 ±  2%  perf-profile.calltrace.cycles-pp.__submit_bio.__submit_bio_noacct.ext4_io_submit.ext4_do_writepages.ext4_writepages
      4.69 ±  3%      +1.3        5.99 ±  2%  perf-profile.calltrace.cycles-pp.__submit_bio_noacct.ext4_io_submit.ext4_do_writepages.ext4_writepages.do_writepages
      4.69 ±  3%      +1.3        5.99 ±  2%  perf-profile.calltrace.cycles-pp.brd_submit_bio.__submit_bio.__submit_bio_noacct.ext4_io_submit.ext4_do_writepages
      5.67 ±  5%      +1.7        7.37 ±  2%  perf-profile.calltrace.cycles-pp.generic_perform_write.ext4_buffered_write_iter.do_iter_readv_writev.vfs_iter_write.nfsd_vfs_write
      7.04 ±  3%      +1.8        8.82        perf-profile.calltrace.cycles-pp.ext4_sync_file.nfsd_commit.nfsd4_commit.nfsd4_proc_compound.nfsd_dispatch
      7.04 ±  3%      +1.8        8.82        perf-profile.calltrace.cycles-pp.nfsd_commit.nfsd4_commit.nfsd4_proc_compound.nfsd_dispatch.svc_process_common
      7.02 ±  3%      +1.8        8.80        perf-profile.calltrace.cycles-pp.file_write_and_wait_range.ext4_sync_file.nfsd_commit.nfsd4_commit.nfsd4_proc_compound
      7.02 ±  4%      +1.8        8.80        perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.ext4_sync_file.nfsd_commit.nfsd4_commit
      7.02 ±  4%      +1.8        8.80        perf-profile.calltrace.cycles-pp.ext4_do_writepages.ext4_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      7.02 ±  4%      +1.8        8.80        perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.ext4_sync_file.nfsd_commit
      7.06 ±  4%      +1.8        8.84        perf-profile.calltrace.cycles-pp.nfsd4_commit.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_process
      7.02 ±  4%      +1.8        8.80        perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.ext4_sync_file
      7.02 ±  4%      +1.8        8.80        perf-profile.calltrace.cycles-pp.ext4_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range
     10.10 ± 11%      +2.5       12.63 ±  2%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.vfs_iter_write.nfsd_vfs_write.nfsd4_write.nfsd4_proc_compound
     10.11 ± 11%      +2.5       12.64 ±  2%  perf-profile.calltrace.cycles-pp.vfs_iter_write.nfsd_vfs_write.nfsd4_write.nfsd4_proc_compound.nfsd_dispatch
     10.10 ± 11%      +2.5       12.63 ±  2%  perf-profile.calltrace.cycles-pp.ext4_buffered_write_iter.do_iter_readv_writev.vfs_iter_write.nfsd_vfs_write.nfsd4_write
     10.11 ± 11%      +2.5       12.64 ±  2%  perf-profile.calltrace.cycles-pp.nfsd_vfs_write.nfsd4_write.nfsd4_proc_compound.nfsd_dispatch.svc_process_common
     10.14 ± 11%      +2.5       12.68 ±  2%  perf-profile.calltrace.cycles-pp.nfsd4_write.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_process
     33.94            +4.4       38.31 ±  2%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     33.94            +4.4       38.31 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     33.94            +4.4       38.31 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     17.51 ±  7%      +4.4       21.91        perf-profile.calltrace.cycles-pp.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_process.svc_handle_xprt
     17.60 ±  7%      +4.4       22.02        perf-profile.calltrace.cycles-pp.nfsd_dispatch.svc_process_common.svc_process.svc_handle_xprt.svc_recv
     17.65 ±  7%      +4.4       22.08        perf-profile.calltrace.cycles-pp.svc_process.svc_handle_xprt.svc_recv.nfsd.kthread
     17.65 ±  7%      +4.4       22.08        perf-profile.calltrace.cycles-pp.svc_process_common.svc_process.svc_handle_xprt.svc_recv.nfsd
     20.62 ±  6%      +5.1       25.69        perf-profile.calltrace.cycles-pp.svc_handle_xprt.svc_recv.nfsd.kthread.ret_from_fork
     20.84 ±  6%      +5.1       25.95        perf-profile.calltrace.cycles-pp.svc_recv.nfsd.kthread.ret_from_fork.ret_from_fork_asm
     20.84 ±  6%      +5.1       25.96        perf-profile.calltrace.cycles-pp.nfsd.kthread.ret_from_fork.ret_from_fork_asm
     14.97 ±  3%      -3.5       11.49 ±  3%  perf-profile.children.cycles-pp.do_syscall_64
     14.98 ±  3%      -3.5       11.51 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.20 ±  9%      -2.2        1.05 ±  6%  perf-profile.children.cycles-pp.rpc_free_task
      3.20 ±  9%      -2.2        1.04 ±  6%  perf-profile.children.cycles-pp.rpc_async_release
      2.65 ±  4%      -2.0        0.62 ±  5%  perf-profile.children.cycles-pp.nfs_write_end
      6.22 ±  3%      -2.0        4.25 ±  2%  perf-profile.children.cycles-pp.nfs_file_write
      2.74 ±  4%      -1.8        0.90 ±  4%  perf-profile.children.cycles-pp.fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.children.cycles-pp.__x64_sys_fsync
      2.70 ±  4%      -1.8        0.88 ±  4%  perf-profile.children.cycles-pp.nfs_file_fsync
     11.36 ±  2%      -1.7        9.70 ±  2%  perf-profile.children.cycles-pp.vfs_write
     11.39 ±  2%      -1.6        9.74 ±  2%  perf-profile.children.cycles-pp.ksys_write
     11.72 ±  2%      -1.6       10.12 ±  2%  perf-profile.children.cycles-pp.write
      2.27 ± 13%      -1.5        0.73 ±  9%  perf-profile.children.cycles-pp.nfs_write_completion
      1.40 ±  3%      -0.9        0.45 ±  4%  perf-profile.children.cycles-pp.nfs_update_folio
      1.43 ±  4%      -0.9        0.50 ±  7%  perf-profile.children.cycles-pp.nfs_writepages
      1.42 ±  4%      -0.9        0.48 ±  6%  perf-profile.children.cycles-pp.write_cache_pages
      1.32 ±  3%      -0.9        0.43 ±  5%  perf-profile.children.cycles-pp.nfs_writepage_setup
      1.19 ±  9%      -0.8        0.39 ± 10%  perf-profile.children.cycles-pp.nfs_page_end_writeback
      1.35 ±  4%      -0.8        0.59 ±  3%  perf-profile.children.cycles-pp.nfs_write_begin
      0.96 ±  4%      -0.6        0.33 ± 10%  perf-profile.children.cycles-pp.nfs_writepages_callback
      0.93 ±  2%      -0.6        0.31 ±  5%  perf-profile.children.cycles-pp.nfs_commit_release
      0.93 ±  2%      -0.6        0.31 ±  5%  perf-profile.children.cycles-pp.nfs_commit_release_pages
      0.91 ±  4%      -0.6        0.31 ± 10%  perf-profile.children.cycles-pp.nfs_page_async_flush
      1.63 ±  6%      -0.6        1.03 ±  4%  perf-profile.children.cycles-pp.folio_end_writeback
      0.82 ± 19%      -0.6        0.23 ± 12%  perf-profile.children.cycles-pp.nfs_scan_commit
      0.83 ± 19%      -0.6        0.24 ± 12%  perf-profile.children.cycles-pp.__nfs_commit_inode
      1.46 ±  5%      -0.6        0.88 ± 13%  perf-profile.children.cycles-pp.poll_idle
      0.83 ± 10%      -0.6        0.26 ±  8%  perf-profile.children.cycles-pp.__filemap_fdatawait_range
      2.58 ±  4%      -0.4        2.14 ±  5%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.50            -0.4        0.14 ±  9%  perf-profile.children.cycles-pp.nfs_page_create_from_folio
      0.51 ± 10%      -0.3        0.17 ±  8%  perf-profile.children.cycles-pp.folio_wait_writeback
      0.45 ±  6%      -0.3        0.15 ± 14%  perf-profile.children.cycles-pp.writeback_iter
      0.42 ± 20%      -0.3        0.12 ± 17%  perf-profile.children.cycles-pp.__mutex_lock
      0.42 ± 19%      -0.3        0.12 ± 17%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.43 ± 11%      -0.3        0.14 ±  4%  perf-profile.children.cycles-pp.nfs_page_group_sync_on_bit
      0.40 ± 19%      -0.3        0.11 ± 13%  perf-profile.children.cycles-pp.nfs_scan_commit_list
      1.48 ±  5%      -0.3        1.20 ±  6%  perf-profile.children.cycles-pp.filemap_add_folio
      0.42 ±  4%      -0.3        0.14 ± 11%  perf-profile.children.cycles-pp.nfs_page_group_destroy
      0.40 ± 19%      -0.3        0.12 ± 12%  perf-profile.children.cycles-pp.nfs_io_completion_put
      0.41 ±  6%      -0.3        0.13 ± 12%  perf-profile.children.cycles-pp.folio_wait_bit_common
      0.44 ±  7%      -0.3        0.17 ± 10%  perf-profile.children.cycles-pp.filemap_dirty_folio
      1.06 ±  5%      -0.3        0.80 ±  5%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.34 ±  5%      -0.3        0.08 ± 10%  perf-profile.children.cycles-pp.nfs_page_create
      0.39 ±  9%      -0.3        0.13 ± 14%  perf-profile.children.cycles-pp.writeback_get_folio
      0.36 ±  9%      -0.2        0.12 ± 15%  perf-profile.children.cycles-pp.folio_wake_bit
      0.34 ± 26%      -0.2        0.10 ± 12%  perf-profile.children.cycles-pp.nfs_request_add_commit_list
      0.33 ±  4%      -0.2        0.10 ± 17%  perf-profile.children.cycles-pp.nfs_lock_and_join_requests
      0.32 ±  4%      -0.2        0.11 ± 13%  perf-profile.children.cycles-pp.nfs_inode_remove_request
      0.29 ±  5%      -0.2        0.10 ± 13%  perf-profile.children.cycles-pp.io_schedule
      0.34 ±  9%      -0.2        0.14 ± 17%  perf-profile.children.cycles-pp.__wake_up_common
      0.92 ±  8%      -0.2        0.73 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.44 ± 11%      -0.2        0.25 ±  6%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.28 ± 14%      -0.2        0.10 ± 10%  perf-profile.children.cycles-pp.nfs_page_group_sync_on_bit_locked
      0.27 ±  7%      -0.2        0.10 ± 13%  perf-profile.children.cycles-pp.wake_page_function
      0.26 ± 32%      -0.2        0.08 ± 19%  perf-profile.children.cycles-pp.nfs_request_remove_commit_list
      0.68 ±  6%      -0.2        0.50 ±  8%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.77 ±  4%      -0.2        0.62 ±  6%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.23 ± 14%      -0.2        0.08 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.43 ±  8%      -0.1        0.28 ± 11%  perf-profile.children.cycles-pp.try_to_wake_up
      0.18 ± 11%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.nfs_page_clear_headlock
      0.34 ± 10%      -0.1        0.20 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.19 ± 10%      -0.1        0.06 ± 13%  perf-profile.children.cycles-pp.nfs_inode_add_request
      0.15 ±  7%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.nfs_unlock_request
      0.71 ±  7%      -0.1        0.59 ±  7%  perf-profile.children.cycles-pp.schedule
      0.17 ± 12%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.nfs_page_set_headlock
      0.22 ± 11%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.nfs_pageio_add_request
      0.68 ±  7%      -0.1        0.56 ±  4%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.45 ± 12%      -0.1        0.34 ±  7%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.17 ± 17%      -0.1        0.05 ± 46%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.37 ± 24%      -0.1        0.26 ±  9%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.17 ± 31%      -0.1        0.06 ± 13%  perf-profile.children.cycles-pp.mutex_lock
      0.20 ±  9%      -0.1        0.09 ± 11%  perf-profile.children.cycles-pp.__nfs_pageio_add_request
      0.44 ± 12%      -0.1        0.34 ±  5%  perf-profile.children.cycles-pp.filemap_get_folios_tag
      0.20 ±  7%      -0.1        0.10 ± 18%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.62 ±  6%      -0.1        0.53 ±  5%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.48 ±  7%      -0.1        0.38 ±  3%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.27 ± 10%      -0.1        0.18 ±  8%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.22 ±  9%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.18 ± 11%      -0.1        0.09 ± 14%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.19 ± 12%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.21 ± 11%      -0.1        0.12 ± 19%  perf-profile.children.cycles-pp.kmem_cache_free
      0.38 ±  6%      -0.1        0.30 ±  8%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.19 ± 12%      -0.1        0.12 ±  8%  perf-profile.children.cycles-pp.activate_task
      0.16 ± 12%      -0.1        0.08 ± 13%  perf-profile.children.cycles-pp.dequeue_entity
      0.24 ±  8%      -0.1        0.16 ± 11%  perf-profile.children.cycles-pp.schedule_idle
      0.16 ± 14%      -0.1        0.09 ± 12%  perf-profile.children.cycles-pp.enqueue_entity
      0.40 ±  6%      -0.1        0.33 ±  6%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.14 ±  8%      -0.1        0.07 ± 14%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.13 ± 12%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__slab_free
      0.09 ±  7%      -0.1        0.03 ±101%  perf-profile.children.cycles-pp.llist_add_batch
      0.15 ± 17%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.update_load_avg
      0.22 ±  4%      -0.1        0.17 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
      0.27 ±  6%      -0.1        0.22 ±  9%  perf-profile.children.cycles-pp.lru_add_fn
      0.28 ±  3%      -0.0        0.24 ±  6%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.24 ±  6%      -0.0        0.20 ± 10%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.14 ± 11%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.16 ±  7%      -0.0        0.11 ± 14%  perf-profile.children.cycles-pp.allocate_slab
      0.14 ± 12%      -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.xas_find_marked
      0.13 ±  7%      -0.0        0.10 ± 16%  perf-profile.children.cycles-pp.shuffle_freelist
      0.08 ± 19%      -0.0        0.05 ± 47%  perf-profile.children.cycles-pp.prepare_task_switch
      0.08 ±  8%      -0.0        0.06 ± 48%  perf-profile.children.cycles-pp.__count_memcg_events
      0.14 ±  5%      -0.0        0.11 ± 10%  perf-profile.children.cycles-pp.__xa_set_mark
      0.08 ±  8%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.xas_find_conflict
      0.05 ±  8%      +0.0        0.08 ± 16%  perf-profile.children.cycles-pp.__es_insert_extent
      0.04 ± 45%      +0.0        0.07 ± 13%  perf-profile.children.cycles-pp.svc_pool_wake_idle_thread
      0.12 ± 12%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.__xa_insert
      0.17 ±  7%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.fast_imageblit
      0.18 ±  7%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.sys_imageblit
      0.22 ±  7%      +0.0        0.26 ±  4%  perf-profile.children.cycles-pp.bit_putcs
      0.18 ±  7%      +0.0        0.21 ±  6%  perf-profile.children.cycles-pp.drm_fbdev_generic_defio_imageblit
      0.26 ±  6%      +0.0        0.31 ±  9%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.22 ±  8%      +0.0        0.26 ±  4%  perf-profile.children.cycles-pp.fbcon_putcs
      0.25 ±  8%      +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.vt_console_print
      0.24 ±  8%      +0.0        0.28 ±  3%  perf-profile.children.cycles-pp.fbcon_redraw
      0.24 ±  8%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.con_scroll
      0.24 ±  8%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.fbcon_scroll
      0.24 ±  8%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.lf
      0.27 ± 10%      +0.1        0.32 ± 10%  perf-profile.children.cycles-pp.svc_tcp_sendmsg
      0.17 ±  7%      +0.1        0.22 ±  9%  perf-profile.children.cycles-pp.drm_fbdev_generic_damage_blit_real
      0.13 ± 16%      +0.1        0.19 ± 11%  perf-profile.children.cycles-pp.__dquot_alloc_space
      0.27 ±  9%      +0.1        0.33 ±  9%  perf-profile.children.cycles-pp.svc_tcp_sendto
      0.24 ± 12%      +0.1        0.30 ±  4%  perf-profile.children.cycles-pp.ext4_da_reserve_space
      0.39 ±  4%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.create_empty_buffers
      0.18 ± 23%      +0.1        0.26 ±  9%  perf-profile.children.cycles-pp.irq_work_run_list
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.irq_work_single
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp._printk
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.irq_work_run
      0.18 ± 24%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.39 ± 10%      +0.1        0.48 ±  3%  perf-profile.children.cycles-pp.mpage_prepare_extent_to_map
      0.41 ±  6%      +0.1        0.53 ±  4%  perf-profile.children.cycles-pp.mark_buffer_dirty
      0.74 ±  7%      +0.1        0.86 ±  3%  perf-profile.children.cycles-pp.mpage_submit_folio
      1.17 ±  6%      +0.1        1.30 ±  3%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.98 ±  6%      +0.2        1.14 ±  4%  perf-profile.children.cycles-pp.mpage_map_and_submit_buffers
      0.76 ±  6%      +0.2        0.93 ±  4%  perf-profile.children.cycles-pp.ext4_da_get_block_prep
      0.74 ±  6%      +0.2        0.92 ±  4%  perf-profile.children.cycles-pp.ext4_da_map_blocks
      1.04 ±  6%      +0.2        1.21 ±  3%  perf-profile.children.cycles-pp.mpage_map_and_submit_extent
      0.75 ±  3%      +0.2        0.94 ±  5%  perf-profile.children.cycles-pp.ext4_finish_bio
      0.76 ±  3%      +0.2        0.94 ±  5%  perf-profile.children.cycles-pp.ext4_release_io_end
      0.64 ±  4%      +0.2        0.83 ±  2%  perf-profile.children.cycles-pp.__block_commit_write
      0.78 ±  2%      +0.2        0.97 ±  5%  perf-profile.children.cycles-pp.ext4_put_io_end
      0.65 ±  4%      +0.2        0.84 ±  2%  perf-profile.children.cycles-pp.block_write_end
      1.21 ±  4%      +0.3        1.46 ±  3%  perf-profile.children.cycles-pp.ext4_block_write_begin
      0.74 ±  5%      +0.3        1.00 ±  2%  perf-profile.children.cycles-pp.ext4_da_write_end
      5.28 ±  6%      +0.4        5.66 ±  2%  perf-profile.children.cycles-pp.memcpy_toio
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail_rpm
      5.32 ±  6%      +0.4        5.71 ±  2%  perf-profile.children.cycles-pp.drm_fb_memcpy
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.children.cycles-pp.commit_tail
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.children.cycles-pp.drm_atomic_commit
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      5.32 ±  6%      +0.4        5.72 ±  2%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      5.49 ±  6%      +0.5        5.95        perf-profile.children.cycles-pp.drm_fbdev_generic_helper_fb_dirty
      5.49 ±  6%      +0.5        5.95        perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      3.00 ±  4%      +0.5        3.48        perf-profile.children.cycles-pp._raw_spin_lock
      2.10 ±  6%      +0.5        2.58 ±  7%  perf-profile.children.cycles-pp._copy_to_iter
      2.18 ±  6%      +0.5        2.68 ±  8%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      2.18 ±  6%      +0.5        2.68 ±  8%  perf-profile.children.cycles-pp.__skb_datagram_iter
      2.38 ±  5%      +0.5        2.89 ±  7%  perf-profile.children.cycles-pp.tcp_recvmsg_locked
      2.43 ±  6%      +0.5        2.96 ±  7%  perf-profile.children.cycles-pp.svc_tcp_read_msg
      2.52 ±  4%      +0.5        3.05 ±  4%  perf-profile.children.cycles-pp.ext4_da_write_begin
      2.45 ±  6%      +0.5        3.00 ±  7%  perf-profile.children.cycles-pp.svc_tcp_sock_recv_cmsg
      2.52 ±  6%      +0.5        3.07 ±  7%  perf-profile.children.cycles-pp.inet6_recvmsg
      2.52 ±  6%      +0.5        3.07 ±  7%  perf-profile.children.cycles-pp.tcp_recvmsg
      2.53 ±  5%      +0.6        3.08 ±  7%  perf-profile.children.cycles-pp.sock_recvmsg
      1.70 ±  2%      +0.6        2.26 ±  7%  perf-profile.children.cycles-pp.copy_to_brd
      2.66 ±  6%      +0.6        3.24 ±  7%  perf-profile.children.cycles-pp.svc_tcp_recvfrom
      3.56 ± 15%      +0.7        4.24 ±  5%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      3.00 ±  4%      +0.8        3.76        perf-profile.children.cycles-pp.brd_insert_page
      8.45 ±  4%      +0.8        9.30        perf-profile.children.cycles-pp.do_writepages
      8.45 ±  3%      +0.8        9.30        perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      8.45 ±  4%      +0.9        9.30        perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      2.50 ±  6%      +0.9        3.40 ±  6%  perf-profile.children.cycles-pp.memcpy_orig
      1.90            +0.9        2.81 ±  2%  perf-profile.children.cycles-pp.rep_movs_alternative
      4.69 ±  3%      +1.3        5.99 ±  2%  perf-profile.children.cycles-pp.ext4_io_submit
      4.75 ±  3%      +1.3        6.06 ±  2%  perf-profile.children.cycles-pp.__submit_bio
      4.75 ±  3%      +1.3        6.06 ±  2%  perf-profile.children.cycles-pp.__submit_bio_noacct
      4.75 ±  3%      +1.3        6.06 ±  2%  perf-profile.children.cycles-pp.brd_submit_bio
      7.04 ±  3%      +1.8        8.82        perf-profile.children.cycles-pp.ext4_sync_file
      7.04 ±  3%      +1.8        8.82        perf-profile.children.cycles-pp.nfsd_commit
      7.02 ±  4%      +1.8        8.80        perf-profile.children.cycles-pp.ext4_do_writepages
      7.06 ±  4%      +1.8        8.84        perf-profile.children.cycles-pp.nfsd4_commit
      7.02 ±  4%      +1.8        8.80        perf-profile.children.cycles-pp.ext4_writepages
      4.34 ±  4%      +1.8        6.13 ±  3%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
     10.10 ± 11%      +2.5       12.63 ±  2%  perf-profile.children.cycles-pp.do_iter_readv_writev
     10.11 ± 11%      +2.5       12.64 ±  2%  perf-profile.children.cycles-pp.vfs_iter_write
     10.10 ± 11%      +2.5       12.63 ±  2%  perf-profile.children.cycles-pp.ext4_buffered_write_iter
     10.11 ± 11%      +2.5       12.64 ±  2%  perf-profile.children.cycles-pp.nfsd_vfs_write
     10.14 ± 11%      +2.5       12.68 ±  2%  perf-profile.children.cycles-pp.nfsd4_write
     33.94            +4.4       38.31 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
     33.94            +4.4       38.31 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
     33.94            +4.4       38.31 ±  2%  perf-profile.children.cycles-pp.kthread
     17.51 ±  7%      +4.4       21.91        perf-profile.children.cycles-pp.nfsd4_proc_compound
     17.60 ±  7%      +4.4       22.02        perf-profile.children.cycles-pp.nfsd_dispatch
     17.65 ±  7%      +4.4       22.08        perf-profile.children.cycles-pp.svc_process
     17.65 ±  7%      +4.4       22.08        perf-profile.children.cycles-pp.svc_process_common
     20.62 ±  6%      +5.1       25.69        perf-profile.children.cycles-pp.svc_handle_xprt
     20.84 ±  6%      +5.1       25.95        perf-profile.children.cycles-pp.svc_recv
     20.85 ±  6%      +5.1       25.96        perf-profile.children.cycles-pp.nfsd
      1.17 ±  6%      -1.0        0.15 ± 11%  perf-profile.self.cycles-pp.nfs_write_end
      1.36 ±  4%      -0.5        0.86 ± 13%  perf-profile.self.cycles-pp.poll_idle
      0.42 ± 20%      -0.3        0.12 ± 17%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.27 ± 13%      -0.2        0.10 ± 13%  perf-profile.self.cycles-pp.nfs_page_group_sync_on_bit_locked
      0.26 ± 31%      -0.2        0.08 ± 19%  perf-profile.self.cycles-pp.nfs_request_remove_commit_list
      0.18 ± 11%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.nfs_page_clear_headlock
      0.15 ±  6%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.__filemap_fdatawait_range
      0.17 ± 12%      -0.1        0.04 ± 45%  perf-profile.self.cycles-pp.nfs_page_set_headlock
      0.15 ±  8%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.nfs_unlock_request
      0.16 ±  9%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.nfs_inode_add_request
      0.17 ± 32%      -0.1        0.05 ± 46%  perf-profile.self.cycles-pp.mutex_lock
      0.31 ±  6%      -0.1        0.20 ±  7%  perf-profile.self.cycles-pp.__folio_end_writeback
      0.21 ±  9%      -0.1        0.11 ± 11%  perf-profile.self.cycles-pp.folio_end_writeback
      0.45 ±  7%      -0.1        0.36 ±  4%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.09 ±  7%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.llist_add_batch
      0.12 ± 12%      -0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__slab_free
      0.27 ± 10%      -0.1        0.22 ±  6%  perf-profile.self.cycles-pp.filemap_get_folios_tag
      0.29 ±  9%      -0.1        0.24 ± 10%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.22 ±  8%      -0.0        0.18 ± 11%  perf-profile.self.cycles-pp.folios_put_refs
      0.16 ±  8%      -0.0        0.11 ±  9%  perf-profile.self.cycles-pp.lru_add_fn
      0.24 ±  5%      -0.0        0.19 ±  9%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.14 ± 12%      -0.0        0.10 ± 11%  perf-profile.self.cycles-pp.xas_find_marked
      0.18 ±  5%      -0.0        0.15 ± 12%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.09 ± 14%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.__schedule
      0.12 ± 12%      -0.0        0.09 ± 10%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.09 ±  8%      -0.0        0.06 ± 47%  perf-profile.self.cycles-pp.shuffle_freelist
      0.08 ± 12%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.__switch_to_asm
      0.09 ± 12%      +0.0        0.11 ±  9%  perf-profile.self.cycles-pp.mpage_prepare_extent_to_map
      0.17 ±  7%      +0.0        0.21 ±  5%  perf-profile.self.cycles-pp.fast_imageblit
      0.26 ±  6%      +0.0        0.31 ±  9%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.04 ± 45%      +0.0        0.09 ± 20%  perf-profile.self.cycles-pp.ext4_da_write_end
      0.00            +0.1        0.07 ± 21%  perf-profile.self.cycles-pp.folio_alloc_noprof
      0.12 ± 15%      +0.2        0.29 ± 72%  perf-profile.self.cycles-pp.intel_idle_irq
      5.14 ±  6%      +0.4        5.50        perf-profile.self.cycles-pp.memcpy_toio
      2.08 ±  6%      +0.5        2.54 ±  6%  perf-profile.self.cycles-pp._copy_to_iter
      2.93 ±  3%      +0.5        3.41        perf-profile.self.cycles-pp._raw_spin_lock
      1.62 ±  2%      +0.6        2.17 ±  7%  perf-profile.self.cycles-pp.copy_to_brd
      3.52 ± 15%      +0.7        4.20 ±  5%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      2.48 ±  6%      +0.9        3.36 ±  6%  perf-profile.self.cycles-pp.memcpy_orig
      1.88            +0.9        2.80 ±  2%  perf-profile.self.cycles-pp.rep_movs_alternative




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


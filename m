Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E768F18C03A
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 05:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093224; cv=fail; b=i0rEGXkzuecOEXVOKL++YJrMhjJS1HnD2J/xdS0Lp+/xXfF5cz6BQOBArTAZNzVHZ214YWqw6TPYdENrS27203/wDnIo4VheKF18m7T0QX7P02JxTpoHosS8dEQORg4R9FVQ3QJyuztz2rBe4MadgLHzaOIJGtmLDzHB4hYHOp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093224; c=relaxed/simple;
	bh=cgqk/F6vgFqyY9v4f6EFE37A2jbCHLtbE1U/ojtnZAk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ijdsxJnKJADIyLPEcEtd8+GdZayrogqlSvmICmkpMLqv2/sfMl1ewgGk4h4htOmIJDpnsT7HnJlxNA6Bk17TiaGLesc9Ep6WC2gpGGtnyQUNDVRwfrOkvVVI0ONiwyU5MK8KvMBIacf1tFcEfENWAys2rmGZK1Uau8H6p1Sb2I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwOd+u8w; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwOd+u8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730093221; x=1761629221;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=cgqk/F6vgFqyY9v4f6EFE37A2jbCHLtbE1U/ojtnZAk=;
  b=RwOd+u8wBQf5x0Diako54btg9TXxEMfxjFVjssyuTUho6aesFFubOggH
   8iXu0BXXI5tMBQnUp06anxNIA14Dulm/6LxE7YDUSnlo9Cr3avGseu2S9
   afZePul35XjYpF9FzSJytMaWF7ldFrPdw2dOHkhKa3Y4cHTbYPig6ZHY9
   LWWM76ZSFawYmHsTcBb+sENQX9hHHf6fWT/SJhmubtXEbjZfNG6DyCc9+
   JkG04/+ifuzPIHzNUOaGwSWriyfH+LKCNSAphvSs1JDfhXz0YOCynXe+b
   14cqMd6Pnr79PJOFdu4fFObxP43gfW9CPdOWM7o6+h4I9Fg7lv9D3PymW
   A==;
X-CSE-ConnectionGUID: Wh2t0kecTfiB0Ax4aHMk2Q==
X-CSE-MsgGUID: gKrl8rKNSUiMXWStEm/B3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29638733"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29638733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 22:26:59 -0700
X-CSE-ConnectionGUID: NYe8NAuVTZKbteaJUD3MqQ==
X-CSE-MsgGUID: YUHFB4RPSx2zOq1kkS8y7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86297127"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Oct 2024 22:27:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 27 Oct 2024 22:26:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 27 Oct 2024 22:26:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 27 Oct 2024 22:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0fIZ3Dl30j74lnITIVdb/8/AOko4QfesM9Q0wjgpmGE98185mBAAcaPyij1imJgKezI1hgiD8ZSxznXeqv2lHJoVIie2QkBGb/PuCl4lDb5xorN01XT0+IYJ9uLKvG7w0p2IcStALzxy7BTzFh06C2IwvvzYGVG7ywkfofCvwfzRfaBxR8adeT+ZCuk8dHcpWaH7FcMU6cGZBpck1eBwFKKPerBnbPFtgaUZputQO+Hskip1w2KEVAudWo8SyyNfKjL18O/Dtaym2tVbOCyt9hwWvpzASzflJ0gLzw1GDLUjyUJdjjYAaPa6biArHMf7gGoGWO1knG87epQJ31yVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hnbpDfBjGHCgUaXFjdP1vnC8MM1UWAz3EDL8VJ7hB0=;
 b=fWZc/WTYG9QN6wuQSRyrDaEbYXibjr3+s49Uc2Yrgm/Y60accrrNG7AJXFYRrckEibW8SDTJEDBJwbZP6561Hi5hCtlO1PWsbWw8R4bF7+RRW00B6O8LZvYB6GD2xSZBcUPSsjfp5jh9NEoCkh0K0IDftCaqcFxFE9Qrt1LpuTqSK7FEO9pp5a66OsXea4C5T3UgYJ+3pf2o1+7ppWZaXXWh4c/CF6aVd42oP0GisNdvqXOxosyPHPdiVjjTHF9Yu4inMuohVns2AzCz/1S9zWKYE+AEbi18uhQwtYrAPNH6b1kD21xL28tvnjCqSEDKii7nJj3rAdcZGK7RhUGM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 05:26:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:26:55 +0000
Date: Mon, 28 Oct 2024 13:26:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jpoimboe:uaccess-hardening] [x86/uaccess]  e3e3698c7b:
 will-it-scale.per_thread_ops 2.6% improvement
Message-ID: <202410281344.d02c72a2-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 28529b61-d6bc-4c1c-1e2c-08dcf711231e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YLj7H9Hqk/uxefMLX6bFlVsACqroq5UEjb93gNVcpVSk2GXpIOs7mcaElm?=
 =?iso-8859-1?Q?yX6tgVDELA0rwD4iWFwHiMRwcSSwR7epxSHan+GSk40S/rRH5VtdUXpigM?=
 =?iso-8859-1?Q?f8P0IRDhnCDZnhNtVTcWecMRic8hV1Q/kXCfXztQ4SqQKblDxmZTKeA7fi?=
 =?iso-8859-1?Q?8UtBbll2AseZ0TovxqGhzpnl9jVBjZ8XKNd2/cUdsLxq5+HOzfzKhgd9Pe?=
 =?iso-8859-1?Q?NjVQU+NUlwoGTLWEy1rU7P3oVpRL5BnaC+JBGbGlgq1Qj9VYLV+HvgxNF+?=
 =?iso-8859-1?Q?eEjtxbIcDrDmgQe0W7Q0RD3YI39lDzIS1oRIP2j1MEwYUV2vyhy2rfmopV?=
 =?iso-8859-1?Q?fmyTKB7XK1N2eevkMwZkHGqZcT6sCg4WQMSqgOsrktQodc95tMk12MxjZD?=
 =?iso-8859-1?Q?l83fdWZRopcDXBqczmB+geiKFLbaHbhYaTGPR5/dAsLgzcy7wIGQxrhE9G?=
 =?iso-8859-1?Q?dqTiUsfYknEnbFdAazl0OHDAtrdpRuHo8ZNTfLJxYwHeRD9+qGYGdvlfZr?=
 =?iso-8859-1?Q?9Su/ligdJYsDa/xR83HdVcWbI40vdI+5kTRLwELq5tkAj9jUs/HAi7T4x2?=
 =?iso-8859-1?Q?P4Yfty8Vd1Z+L1VQE5XGijwoJU18y0mNpNJr9B/eO5V6p0Sjwrpeb2eCEH?=
 =?iso-8859-1?Q?QCnNLjByfHq1QPuWeIA4WdAn2jUZ4KCWnotQl1vo+1F95YwvbKlu3ftdmO?=
 =?iso-8859-1?Q?8PtrZ1ZwmkZyaeJ7zwxksgZ9sjkJx4sR6uBjFXoC+Ma05lvEIiGzezDDYj?=
 =?iso-8859-1?Q?ulixPXuDQczp4klzSX38BETkOrKh4TwsKD7GzbDGa5hnQwOjWO66H6h8L6?=
 =?iso-8859-1?Q?oR8j//EBhnOqKxNqJqar+3bf0nLSQudmqohyNHn2Efwg7Rwode3Rsyy4aU?=
 =?iso-8859-1?Q?AL2U4HPe8pKDF5Ux7SSjO3iz2QEHZKyIzospe3EZqyMlqFEQ8pNlXXaohb?=
 =?iso-8859-1?Q?9iDiDxuF3zuNCAQ4qbUHFAjjKGqvNvVsPAnXAKHKZmzz1llkm0WLpZFUEh?=
 =?iso-8859-1?Q?Q9EMQczzNWnX3y9MUhHejIUpmQtNsL31Y5PFpYmuJhUpd2u0vDUk/voJSk?=
 =?iso-8859-1?Q?tnB+s2rlYBmvugciVWetTP2WcHCBLN0brSQxd98RFzQFE0HkFBiabqDfhm?=
 =?iso-8859-1?Q?rOSHQs0uEKpczBjvGFtdzkJ+RxiG3OXiNJx5SY9azz8qr5ln/E7HiFnAl5?=
 =?iso-8859-1?Q?4/X7tj81sVB3gvrmMVPiVBAiFLeIZkUSUxImGsSyYG8GTGACc9DckRQ5/h?=
 =?iso-8859-1?Q?HZIYrsLiiQeuXmCt8DS0Do2QKqitBbDCge+21CI5q4yESx2hj2YUGBCh0e?=
 =?iso-8859-1?Q?3XlOy5qnijUX93LS8DsHan2jwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vrZXh1oWuuCIjYXsaqNiLeDftkDSBs+4MHcC493pxRYixb0mEDMvDj3Zt2?=
 =?iso-8859-1?Q?xniw/2IlrakWvqlKKAabea8QmWEYEKGwIap5LmVdBpJuASFEAq5COcW7aR?=
 =?iso-8859-1?Q?0M295ZBNYmng9htT6taNfJqzpksfEQ9//wvweNF6kH83WjeJ6LgLN1RW2r?=
 =?iso-8859-1?Q?bfCDgHjgFidR3i5xbKqrhowuwVTIEEpCiiX3qunbf8Yf8VLaKGs3TDpg5N?=
 =?iso-8859-1?Q?Y2uvwUj4hIftHoILWD5Z/TjCHaXpn+PxG3zMeaZNWgYrliA+jyv/qB92GV?=
 =?iso-8859-1?Q?6lCcsQ6B3RBWGqWdX0R5P4Lq/W74zUY8JV2czMMZcuPviHlxj7B/B7Guff?=
 =?iso-8859-1?Q?zUMzE9bfHZzY5zwunixACriKA0k5Snqdg9wS+v5bSNPqWsbo/opa8lokjT?=
 =?iso-8859-1?Q?ES9nthDwj/InoAfR79oTnjJAMzQhTUKFvpm2ATg6lSxIrdwpX2d9X7SpNI?=
 =?iso-8859-1?Q?dNUIWsr4g+OI5u8HqKxKzzKJTTcHujm73jXu1nfobmxg/F8xQKocuBI/Hc?=
 =?iso-8859-1?Q?SUey3nmMVWKjYaWcKoL4lsaWfJ+y6AqZNrf4KeqP/nhZt4sdo1UIZnnTvn?=
 =?iso-8859-1?Q?zHxhHCUaeo8RvlSCxITtrXoY8rzxFzZnWGWlH6ruNsJmwLFG+TnnpklURA?=
 =?iso-8859-1?Q?bMCwKTIV3RGGuK1M5h3FchrTwXydDv3JXTUAmjP+gras/uWqE9UfoQv+QZ?=
 =?iso-8859-1?Q?VNWiHVPtjZYxBjhnW89cHTqC2zOP+J8tLpggoiTa1vmXLf8GK5TCusiC5e?=
 =?iso-8859-1?Q?6OkbazrEthApb70ghXK00Xxao9TewXlf7aq8tP+WM1r9hRqPKDoxrDHt++?=
 =?iso-8859-1?Q?fayelgDw2eN4yvCtgb8uarTDE1Roa/mILbIwZVhr89SdzGauLX6RqF+3Z4?=
 =?iso-8859-1?Q?zGzrW7M1fUfInqTLKa4zo2perD0eix2XJhiMJDNREbQ9NFlX7+aZziT1pG?=
 =?iso-8859-1?Q?Zkj8RFOVxtGtLgzv/lDD87UVdux4MHDIKQkqzquuasqV4JrAHuH/npnrYk?=
 =?iso-8859-1?Q?o2GdWhg5osJa5bizk5wn7TYvVDlGOa9Yje75vm8Oc/iZhodNIcv/vkeSZP?=
 =?iso-8859-1?Q?iUCoTZCG/Ab3KrH7wBPKo81IQNI6qx4O3nIfHqsQbl6Mi1Um6WwMs5hcbf?=
 =?iso-8859-1?Q?ciwww42EkRHhNsoWROCDMt7257rNfg/+gpofjnwf0DozbfH04CqIPMmFDf?=
 =?iso-8859-1?Q?CAOpfAGT+2w1vPi2J7vf2ciOJxgjZVZvjr5/m1B9QgwbXvIspu9sYLErvP?=
 =?iso-8859-1?Q?xtS9yhev1g5oYo4rJJZxXD7Pefsry1UiDiPimeC3krVvxWodn75iM24w/j?=
 =?iso-8859-1?Q?NkswVcyPNbM8mmFcVweyTmIuueei8EtEEzr1FWQf+OLbjdxQbvpBOlORjT?=
 =?iso-8859-1?Q?qlTAXB7IA/mwAiX/MtkqfmSxMNVtj86aZpW4f3mZ3Bgx2nNk5yZ5Ldjw0H?=
 =?iso-8859-1?Q?+3VhWiWTMov9QIDZyccIiAqdbdk1verdWAoV1tU2DQpd891SbcTeRCq/8v?=
 =?iso-8859-1?Q?oOER1AZuXi/tH8NLaeGLxhmE7qQVAEAK+l++1gxAPP9mi8MYCuk67svAax?=
 =?iso-8859-1?Q?a1oVjyyMslz626AnUESMR/IeIN2KxZCcfRO64wbuHp0L3d1QIH+qK2aE99?=
 =?iso-8859-1?Q?b5Ii7CxB9U3JV5M0OLQAFS5kxczRNSFXR8Z1jYzWY5322kd9nwYKNkhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28529b61-d6bc-4c1c-1e2c-08dcf711231e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 05:26:55.8630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Hus3ngkXyez5F5DlJ3qO9+4L7CF3zzn9/e2nefmLNzxcDfxrhN2GkimFqATrF6E1F9yxxyj/09G+xGcD7Jk6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.6% improvement of will-it-scale.per_thread_ops on:


commit: e3e3698c7b891811bb1133cc7fde9a30c8b0e00a ("x86/uaccess: Avoid barrier_nospec() in copy_from_user()")
https://git.kernel.org/cgit/linux/kernel/git/jpoimboe/linux.git uaccess-hardening

testcase: will-it-scale
config: x86_64-rhel-8.3
compiler: gcc-12
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
parameters:

	nr_task: 100%
	mode: thread
	test: eventfd1
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241028/202410281344.d02c72a2-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/thread/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp1/eventfd1/will-it-scale

commit: 
  v6.12-rc2
  e3e3698c7b ("x86/uaccess: Avoid barrier_nospec() in copy_from_user()")

       v6.12-rc2 e3e3698c7b891811bb1133cc7fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 6.236e+08            +2.6%  6.395e+08        will-it-scale.256.threads
   2435801            +2.6%    2497931        will-it-scale.per_thread_ops
 6.236e+08            +2.6%  6.395e+08        will-it-scale.workload
 1.676e+11            +2.5%  1.718e+11        perf-stat.i.branch-instructions
      0.81            -2.6%       0.79        perf-stat.i.cpi
 8.218e+11            +2.7%  8.437e+11        perf-stat.i.instructions
      1.24            +2.7%       1.28        perf-stat.i.ipc
      0.80            -2.6%       0.78        perf-stat.overall.cpi
      1.24            +2.7%       1.28        perf-stat.overall.ipc
  1.67e+11            +2.5%  1.712e+11        perf-stat.ps.branch-instructions
 8.191e+11            +2.7%  8.409e+11        perf-stat.ps.instructions
 2.489e+14            +2.7%  2.557e+14        perf-stat.total.instructions
      9.35            -2.3        7.08        perf-profile.calltrace.cycles-pp._copy_from_user.eventfd_write.vfs_write.ksys_write.do_syscall_64
     12.94            -2.2       10.74        perf-profile.calltrace.cycles-pp.eventfd_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.55            -2.2       13.38        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     21.51            -2.0       19.47        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     24.17            -2.0       22.18        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     25.37            -2.0       23.40        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     53.54            -1.3       52.28        perf-profile.calltrace.cycles-pp.write
      1.01            +0.0        1.03        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.69            +0.0        0.71        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.00            +0.0        1.02        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.83            +0.1        1.88        perf-profile.calltrace.cycles-pp.fput.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      2.03            +0.1        2.09        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.read
      1.78            +0.1        1.84        perf-profile.calltrace.cycles-pp.fput.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.03            +0.1        2.09        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.write
      2.09            +0.1        2.15        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.eventfd_read.vfs_read.ksys_read.do_syscall_64
      0.58 ±  4%      +0.1        0.66 ±  2%  perf-profile.calltrace.cycles-pp.testcase
     15.59            +0.3       15.86        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
      8.82            +0.3        9.16        perf-profile.calltrace.cycles-pp._copy_to_iter.eventfd_read.vfs_read.ksys_read.do_syscall_64
     15.58            +0.4       15.94        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
     12.34            +0.4       12.74        perf-profile.calltrace.cycles-pp.eventfd_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.36            +0.6       19.97        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     25.33            +0.8       26.10        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     27.97            +0.8       28.80        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     29.16            +0.9       30.02        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     57.34            +1.5       58.82        perf-profile.calltrace.cycles-pp.read
      9.68            -2.3        7.42        perf-profile.children.cycles-pp._copy_from_user
     13.11            -2.2       10.91        perf-profile.children.cycles-pp.eventfd_write
     15.78            -2.2       13.61        perf-profile.children.cycles-pp.vfs_write
     21.73            -2.0       19.69        perf-profile.children.cycles-pp.ksys_write
     53.02            -1.3       51.70        perf-profile.children.cycles-pp.write
     52.44            -1.2       51.29        perf-profile.children.cycles-pp.do_syscall_64
     54.76            -1.1       53.64        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.32 ±  2%      +0.0        0.35 ±  2%  perf-profile.children.cycles-pp.read@plt
      2.06            +0.0        2.10        perf-profile.children.cycles-pp.x64_sys_call
      0.97 ±  3%      +0.1        1.08        perf-profile.children.cycles-pp.testcase
      3.66            +0.1        3.77        perf-profile.children.cycles-pp.fput
      4.37            +0.1        4.49        perf-profile.children.cycles-pp._raw_spin_lock_irq
      8.83            +0.3        9.17        perf-profile.children.cycles-pp._copy_to_iter
     12.43            +0.4       12.84        perf-profile.children.cycles-pp.eventfd_read
     20.48            +0.4       20.90        perf-profile.children.cycles-pp.entry_SYSCALL_64
     16.41            +0.4       16.84        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     19.41            +0.6       20.02        perf-profile.children.cycles-pp.vfs_read
     25.35            +0.8       26.12        perf-profile.children.cycles-pp.ksys_read
     56.65            +1.5       58.12        perf-profile.children.cycles-pp.read
      9.64            -2.3        7.38        perf-profile.self.cycles-pp._copy_from_user
      0.70            +0.0        0.71        perf-profile.self.cycles-pp.ksys_read
      0.73            +0.0        0.75        perf-profile.self.cycles-pp.rw_verify_area
      2.01            +0.0        2.04        perf-profile.self.cycles-pp.x64_sys_call
      1.66            +0.0        1.70        perf-profile.self.cycles-pp.do_syscall_64
      2.03            +0.0        2.07        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.91            +0.1        0.98        perf-profile.self.cycles-pp.testcase
      3.59            +0.1        3.71        perf-profile.self.cycles-pp.fput
      4.20            +0.1        4.32        perf-profile.self.cycles-pp._raw_spin_lock_irq
      8.08            +0.2        8.24        perf-profile.self.cycles-pp.write
      5.59            +0.2        5.77        perf-profile.self.cycles-pp.vfs_read
      9.74            +0.2        9.93        perf-profile.self.cycles-pp.entry_SYSCALL_64
      8.08            +0.2        8.30        perf-profile.self.cycles-pp.read
      8.77            +0.3        9.10        perf-profile.self.cycles-pp._copy_to_iter
     16.36            +0.4       16.79        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


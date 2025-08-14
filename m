Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76EA2D781B
	for <oe-lkp@lists.linux.dev>; Thu, 14 Aug 2025 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158693; cv=fail; b=ld9tL2JogiXM7ojo+Um0CpPsOlmgPFlvuy8KJeXVxhNGiGP2MMOIHGoeSDbpYgw2wEg7WmJla2656kSobpzA3aHvam/dHxgb2cjJ+DqKWWjojd1jh9RGH84YkSeLjC/+fKVKIlWwB7N2K0vdx3ZuFYvGp9qsVlVzOYWEloUBBgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158693; c=relaxed/simple;
	bh=DJnpWiD7rin13NR9cdyQqnG3rrvfzIJIA+rMfEuk+m4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JTuMcvyygbLhZ64BORMR5LSXpH5eT47f8XcpeQgR44VSutzJ7D5Xo6VauGgIvaFoaEmkTlZ4pmxXuL707z2Fq2KtLwWLsePwK4pAfDrd6N+hHYiMXS5GV3QkZ1RBL762Tld2oCy35WQx9PAQsi5FYcdNezpkfnXQiybqOdkOP7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7qJ2Ev5; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7qJ2Ev5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755158692; x=1786694692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJnpWiD7rin13NR9cdyQqnG3rrvfzIJIA+rMfEuk+m4=;
  b=J7qJ2Ev5RXcn0URB8tggzZs7EPtGqg/We8GVnvwwP5vOyOK+jV3rMHrQ
   gq3E2YcknkCmYEU7tnhT9QsKYOcbde8tMvfRQZNGRmaCdVov0EwJQGHET
   6uNsyB/WRRy5sje8pmJ7NO5xmHpEIywl7PEv3J9PIJnllcLPpsWhYERdW
   rzpuv3/aF8XjiRrnQ8HweJeoOFWOCFk+Z1cu5NU9mPBtdkgshfn5sTOzL
   hg3BgtxhFSRaKP7E8EIenXLekRvvJfivIIiitxdkVJH9Wtd/3sRmBDjsV
   5iaxkzJ+mIOJTfg+HRBCd9vTAnRrpZ9OKFpzuy+ygEplg6wa6hGGDhmVk
   A==;
X-CSE-ConnectionGUID: vygrQmIvS8uej+1ddPaRIA==
X-CSE-MsgGUID: ZIoY6tSaTL6qF6nyPi7I3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57584678"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57584678"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:04:51 -0700
X-CSE-ConnectionGUID: EtsTEdbwSD2dvlTgcIeYhQ==
X-CSE-MsgGUID: J2tyAR92T5+ZIEBkLbUF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171151155"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:04:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:04:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 01:04:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.89) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2Mfd8SH/1Kq00V4UHqgkUhcbWMTcQPJrdm9MHm86Ffs5sIFE4SOXd9gFOtPWITrpafNNF4CIR8KzdaSa2TDPou7RHJO9nWhLLP798HyrUT5jfLh0FG6aSoIXbs3OY+X8hKlN4+lde/74ftRsJ4x8nvwSFPqTdb2kkvxRpPlmFDwn+5Gq+WoMTqWJ5r74OEVBln3z0y5lnHh07XwmmzwV23VcZ6/i4qhwEeD4kWNNYTp+F2Uden22cdazUX1F3lLlSot8cI4vVatBO+r2fx3LHlHoHf5ia+MfqSi6iYpBsfdHEkAbIDp7rnudrlCKMcI3h9IrXnHvMbXb4zPXpsdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bfBg7VxbaNJ7BRgM0ZNJG8Kc5xges9/OecS3zGI64I=;
 b=Liap6+TVIpzsKTLmhwGkJvjE8xV+1+Ca49/pn3Pq9ddXopfQzpPYvQM3ySZiI1JgBd+/SnPOlGWY/2x5Jzs6NUQwSGbCo1/pJN13vozTKJNLJzzskhT9pr5t1pwT7/Nj5/WW75OiTcKcI7Ukb4kUVAX5w4w5qUrkO6cpwMEi6NZi7Ff02NfyIg83kHTkZ06Vsc3b7bX7H3A5jDckZgs2LIJ8g+Oi1N/8IxtSXzlNnUSeaQ/oXq1Fi6gWERjCXWGw6N//AmIPz6MoD191UPOcVuBTpIOu3S43DEqlljH2kPHDnwd3EJB7a/G70oOQWoH6dD8p0z+5ZrbgvAhH7MXEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 08:04:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:04:47 +0000
Date: Thu, 14 Aug 2025 16:04:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jlelli:upstream/misc-deadline] [sched/deadline]  a7638eaec9:
 ltp.cpuhotplug04.fail
Message-ID: <202508140925.59df4ce8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 81545d9a-985a-4cfd-ba2b-08dddb093c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CZpSFRzIv0VwqiEeZ3QtDJl7inyo+l1mP8v7rNfIEHdGMhU1DnrUsTLKkI3Z?=
 =?us-ascii?Q?Jf3VG9LZ+H0sG+JtD1BAfU+Vfa+6O+sVUrR2+HUkNOYxG2em46FHfiYGWGht?=
 =?us-ascii?Q?aOMATt9z+esatDePrPS6tuqfvMTL9/OxMikDE+TCyOrFPzKcAZ+P1067uqlK?=
 =?us-ascii?Q?bnA6Gt9cS0h94SYudRDeJyf8rrJiX0fDXfJN6Sp4L7qn1YGxOUESrh+TL1kZ?=
 =?us-ascii?Q?I7uhfEmmaxi1MEsuAD82raQbqsfqXdR0F+als2qIkeRx25UG5v/mUABwwXz6?=
 =?us-ascii?Q?fwDbvIZ98pATEMZjtKhR+6OZ2cdTuT+aIVZuuPO+g+vG8vqFEUx9dn1qJQdt?=
 =?us-ascii?Q?S/66aB4hlzmbmjO8ulRV7XbNFPztdxb+m2Z8fLHUoofD4uT7hOdZqs/463kt?=
 =?us-ascii?Q?IwyD3jUnRXrfQl8v8Bdr0nNYnwXZY5QwsNzvh7+nxvXurXaq+P/sStd1YBfL?=
 =?us-ascii?Q?+jhFjD02eMG4fV9frlHgXZgFG77/OpxJxFBNvxvyRziBjuzckK28qkODnvNf?=
 =?us-ascii?Q?WziJEeOaVRFACe4q2tFXDmrhbw3r6Foh3m8yIqud9uCrj8cUpw/l1W/eeeYo?=
 =?us-ascii?Q?DCB5qDTg9qMme5PtZ5TiZFs9oVJUIiOv4Enqac54o9qcWUfAAlKxtlQafoI/?=
 =?us-ascii?Q?QaD7UedLOr2A3+N3d/cWwAa6Zm92WhQvdWPGzvnNlj6yaeo56KDycMsNe+90?=
 =?us-ascii?Q?YHJeG1QguZG54Wu5WQ+sk47S5ZJuHAHJ67pLP0ClWv4FTpZmnNPU/BamBKhD?=
 =?us-ascii?Q?iQnbIABPHXKSBWFYW+EOoRcnUvfDKhPzAVq6plyp8o4Py02u5Dxcjd4b33Xl?=
 =?us-ascii?Q?7Q0hNTHGPbZcH5CqV/BMfhobC2COcWNYP1EWJjvLdvuEcSOTZJtGyIwJiLZA?=
 =?us-ascii?Q?XrdBjdOIV7tqqMHi5e6HQT/C/8FZ4zhDH69HTijEi4xvuL1AbUSqKYqQ6FH4?=
 =?us-ascii?Q?AWKPGG15ocpOhHFvdFAkLy+gFdTs4lLdfm4XtJRIG/n1NjuZwPAYbfie7+25?=
 =?us-ascii?Q?o59y+DtywZgOXIK2TvNdMzC7XkG4yJf08iruM6bZsNzihoA41rC2iaLCF1P5?=
 =?us-ascii?Q?vpkFA3SbmF/i1JEq+1q+VjUjFXgyIsU1KNU77JScjxRiLEHYOcTcadvqec5c?=
 =?us-ascii?Q?NAU7FbhYL/0tTokUGki2RNC2mmTbDi/kl2DK2cXRW2CPViSJG6hLrTQE/mDa?=
 =?us-ascii?Q?WgWDhHot05KCb55+SiPsc0fkUnIf0MIZWiCoT4xGby3TvSmA8Ve8bCQ1CC7z?=
 =?us-ascii?Q?tCGU5oCtUFc4khEBs5n7otIKeSrFRK/q883CLG+Ul3WP9fQUpOsTkmam+LHI?=
 =?us-ascii?Q?YTQNMVL0uHfZW9xcLbWds+S+Cv7IOz3H6kNmkQedu+EWmy6+Gbkd2km4+OvC?=
 =?us-ascii?Q?2vykzm69vnDBfDNdtemTej2NWOyh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i1i4JYjHqk0B5p/fHGhH+79DnUtBGgB6RwLJdM8Z4yqMOVHKd3E7AbuvJOYs?=
 =?us-ascii?Q?3Ktkn8GVmFeXEuEDKZANGSUw+482ClAH+R36mnHxTNFhQxIt5nf2HzuINFzJ?=
 =?us-ascii?Q?T1kUWiTfhnXhQb6ZKR2Qwc3JdhyUzVXIFXVtOi1crUcFW9RZdY6VhlgcDStW?=
 =?us-ascii?Q?DA+9UKk7dHsUuAOH43E+TlMJe7jxoGCjZGeoKgDsSATRKBRfpqis82N7xw44?=
 =?us-ascii?Q?2aGuxiErHdwBwQhUTwqiqW3C1lRaAFQc/UkpGYEJQyoI1oS+zyxcsLNJsZs5?=
 =?us-ascii?Q?1xVTB1iz4e/AfsGWLNs1Ff54mv3E4p5QYjHr+Hz0g+CzcVblktA+vQAlK4z7?=
 =?us-ascii?Q?XHj359abvEGF1w6lDea2I4GYWT/f5YnYScw0FtpTdOd1x0QapwDTEjAlWS8b?=
 =?us-ascii?Q?1Tz60y+Ek1Y2hrHd02D9jbaeh0CjfN2dB7xUsf8JFsLDYan6/iMwbIxBKoKQ?=
 =?us-ascii?Q?fmJjGOfKz8i1cOtWw8ippWDVqG5OwEk/IEgGaKxPS+IrnP0DpZ/3a0VsPkdW?=
 =?us-ascii?Q?5LwURsLeZynY7H3qkax1OBUe2V/DShcsI0Zr+qOr6LXLFiygHSD5oenpuyS/?=
 =?us-ascii?Q?tFSPeeT63LvF15pzYb9g/UI9In1fWPlw8ovgK5+dReB0xhVQWX78nd9aub/5?=
 =?us-ascii?Q?Soa0EUGJDkpH0JzqxQoU33M5SJET25JLcPldoCnSfh0nEeKk8OjCpnzRls8W?=
 =?us-ascii?Q?3MfMshg0cY8QUBqsAUaWhbNild/oP3yfe3hirievywGMiYRrM6oaDXz5qjkN?=
 =?us-ascii?Q?UBoWUokhR65DPIWv4Vkf+djYFuoOTF1LRS4SBIdQ3Birq3wMcI7hOHP1byYF?=
 =?us-ascii?Q?SSiHoWmfxkhuB0h0XJIAAqA9tjZNHI06nMcAc9IjxdipwxjZ+mghanmLbXYq?=
 =?us-ascii?Q?OlvlpLvPmMARn6W4fCjC8GtgLnHbitLR5RuYObztQk7RMX0tiW7/sUg6nUYE?=
 =?us-ascii?Q?4PPkM2Ub7v5b4UMj8Qe2S6UbMLs02HBLUvr1Pb6w2EMRmD2+vpY62ir5equi?=
 =?us-ascii?Q?gZTycA/QWKDCCCj+W8tFB6D4Uw93zbIJpxZmROKqIud74uMREx+zI1ojkWDR?=
 =?us-ascii?Q?RihDgutCytKNB2+SJDD17S9rx1oZySpgMwj/M+YJ3oRtXuUSJF3UbRRjBYVd?=
 =?us-ascii?Q?YDddjsjPWHH80Cz+dBt5yvwFOQnGqxwmHkCxkK0oqb/MUmbil4iRPqvW3CXf?=
 =?us-ascii?Q?TyS/0Abzfur+dq+MWdFI5gx7m3MhWCi5u4ojXcRQmM3aGREDrtm3to2G2jlN?=
 =?us-ascii?Q?5pDwegSoUkcHpKMuXYoDMF7tMqK90EG5tArQKBLUoDYV+28UDBTagVYnIdTU?=
 =?us-ascii?Q?3ElHKtlQYs3d/6o2sYa0QVPYmSKCUTaqvOVBsiEve9c/ihvyk2d97qBLcudx?=
 =?us-ascii?Q?THGgtXwLM2DgPBDO0BsJC3PPJ3losy17KGk2AZnoTz3ck68U0X9wYqQdzBB7?=
 =?us-ascii?Q?nEnrTuJ/jSk/qjX3xEOdhSJJsfW19GCuCjarHS9he8AC512wAleykJTCeifX?=
 =?us-ascii?Q?OEMsne4l/WFxWxi1JYzrY0gmUz59wu2C3CzKFr+bN3aMaS4dO9O83qdWpkbw?=
 =?us-ascii?Q?3mCDD3EoeKOqFtFdYR+CavQX9uhkLbbz/Nzw+dSkYSo/qryGquLgU7w9tvmE?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81545d9a-985a-4cfd-ba2b-08dddb093c7f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:04:47.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqbP8vJrKCNhDRzoV5j9q4gUAANyzeTSl0yoxACAiU2WA0ECAcSPh1V4lE3WAMQoF9nTxBsncxcvtj3olvdbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.cpuhotplug04.fail" on:

commit: a7638eaec90980336c840c44bdf09ab5d9c775f9 ("sched/deadline: Remove fair-servers from real-time task's bandwidth accounting")
https://github.com/jlelli/linux.git upstream/misc-deadline

in testcase: ltp
version: ltp-x86_64-9f512c1d8-1_20250809
with following parameters:

	test: cpuhotplug/cpuhotplug04



config: x86_64-rhel-9.4-ltp
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (Ivy Bridge) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508140925.59df4ce8-lkp@intel.com



Running tests.......
<<<test_start>>>
tag=cpuhotplug04 stime=1755069332
cmdline="cpuhotplug04.sh -l 1"
contacts=""
analysis=exit
<<<test_output>>>
Name:   cpuhotplug04
Date:   Wed Aug 13 07:15:32 UTC 2025
Desc:   Does it prevent us from offlining the last CPU?

/lkp/benchmarks/ltp/testcases/bin/cpuhotplug04.sh: 99: echo: echo: I/O error
cpuhotplug04 1 TFAIL: Could not offline cpu1
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=1 corefile=no
cutime=2 cstime=42
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20250530-141-g9f512c1d8

       ###############################################################

            Done executing testcases.
            LTP Version:  20250530-141-g9f512c1d8
       ###############################################################


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250814/202508140925.59df4ce8-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


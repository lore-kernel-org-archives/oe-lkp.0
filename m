Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972391EB5F4
	for <oe-lkp@lists.linux.dev>; Tue, 25 Mar 2025 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891430; cv=fail; b=HQStPMgin/N5vSwB72YFbCnQJqhbfyBSrw3VpFoZKgfmK0Stnkg9U/pHZZEdRYs+U/vs4LyZhSQlMJifZUkuMLHtddZ4UpsDDIXS5d8oJ55G8jnGUEIZRAbT7WUZfV/rpz6Bh2BDvyYx4n+8yJir0O9910CfUgbHoWAwhEqN8Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891430; c=relaxed/simple;
	bh=egaWBc+JJwmnewf77ooKZN9uAeGrTdC9hDHn6QvgPM4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Y8BqqdgWZdrMF3XQlxWlcnsZtENwKsVkzu1BGf0J1TYZNWkrE6Fgn9vU6Kfdpmn8jcPFKLu+uTTGGi1t4naX/qrGOLc2k6KjQox4olAKZqI36agneTaCi3BBWCBiUj2xZwv4ZFQEhu50mOWrJUJ5ld0nU4R1kuXRJOU5Uz5syT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/aT089p; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/aT089p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742891425; x=1774427425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=egaWBc+JJwmnewf77ooKZN9uAeGrTdC9hDHn6QvgPM4=;
  b=H/aT089pQT8J3QAEVzi77IbTGCMhHPNeH/gNA7iZ8UdvWfrdb2Vcq/UE
   1e0O3ID23sskrWfUYVW/belPK2hlBkZTAli8zgVPGem53p1SzbT138R/V
   Y2u7xb3T0bTRx61+jBSUSguWQ40GPxKjQTBf8qOR9BENTomPU8lCBLA48
   c2VILBzPjSJ0HLPuchXipoh0PnBnX6SNkdGxuQPi1cWQ/x0Umy5s3q6Qk
   ux0I/tdQ8V5of8koB6nXS/bZ8OMd9vcxvIHVrA5Nzh9NsF0PttO8VVFWk
   g0SGq19CN0mq4t5oRvG+j0aCsRDWOLm/0fR7bw9+H/Nazm717Ypc3kFgY
   g==;
X-CSE-ConnectionGUID: pI47Z4iTS/uIHtfuBk+ddw==
X-CSE-MsgGUID: gm4WKKkHRmOmgxWXn+YQYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55505466"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="55505466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 01:30:24 -0700
X-CSE-ConnectionGUID: cn+EsGYbQU+JxnaL9aL3Vw==
X-CSE-MsgGUID: NrpTCYdDQA2+FztGKUpPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129489065"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Mar 2025 01:30:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 01:30:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 01:30:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 01:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQqxhCwhpVH8oPlcCIZC+C2hCM1B58UAxAMnseiwR8ugKOJqejROpZqJ/wnOPRIuFJ6koni3uhFrNMnpL9XjcK0JoeEIRZl/JFokzcU6l17YBrTz908R4Bf/RUHddwuhqDh+LHl5sngnTv09VFnTMbxJwbFBihRfe2Eb5B6E8zGYF42nhZ4dbRDP68/30cXq2QigoARojJl0x2iiq9e80/b71kcTD70i2bjO9R7kRrhFO/5sKk/1qfc5qrhx2S4UeFh12QH6YWub0xlXtrSAFxfkeqF45uCp12FTUsHRLvSu32SeOoWQBI/z3ZScJB04/rIqUSQurOOBWvfHErfmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m8Rtzqo7VAwuBMUYk4vwG6VeqTU0Wxnr0CtcwDsZ30=;
 b=iJ0hM6ZKPlT7I39FyJiKAQhwKBl96pgIGOdfVdfQja1klLyNwCzuZo6WLCnZyqJVqRXvWffpSLUOZXIQdMPUpK1uURKOCBCBBzz6BnddUVuIDI2xPVn0uD1533HwnB0LPtgJuZkXu0QtEoQcoz3gZI0Pt8Wf2tFHkIc/7WBMR1Xj6VhEbymPAONqHHuOS6cbzBBSwb4xPqc82d0vAh1XOl8n+WbnhwCiyt/zJq+SHWD8snzsHYY6L9yEsu7qR6rnGfguNCQfNLB0O6NHymV3xbMvBu5HO+61ovd+UFrJyv7ya9L6WpiRsz8Ei8YNzJDOXmS51LvT4kQbmVNoG7u5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF93A1BBECD.namprd11.prod.outlook.com (2603:10b6:f:fc02::3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:30:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 08:30:21 +0000
Date: Tue, 25 Mar 2025 16:30:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:shift] [bitmap]  c061d07ca7:
 stderr.netperf:data_send_error:No_such_process
Message-ID: <202503251628.297db24d-lkp@intel.com>
Content-Type: multipart/mixed; boundary="RjmeHVVu++HFeLki"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF93A1BBECD:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c71555-f089-4ef3-d00c-08dd6b7747f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PLNxiOvygmR/zfVSfQUIRfJGu55eK5OLMxWHK0+p5+1VfPVbppwSGudOX6D7?=
 =?us-ascii?Q?Tx66XuFfYB4suiKbSxfWc2JbmyE8l6UR/B4n40O3eVTFVbAmj5uSzRFtAcNH?=
 =?us-ascii?Q?ukzm++erwkEfbKDltUL/y8r9SPhpViRA3rSCRetG+IwJOeBQA3mJP6KCGqZg?=
 =?us-ascii?Q?mfdK3X3BHvy4UfgaCTcSuFLdEPjDZKG9zZC30d8an56rWiLcSG8AqVgbr0d9?=
 =?us-ascii?Q?8ljy+wC5pEpydY2HsZFPGd+qjZBzJlZxiG2G0bBhUEjIF4QFTOdA8Q/9bWRE?=
 =?us-ascii?Q?DHMC8tb73MRiyb7kHYFJFvMdozmwSqzeF3foGCwp8ox3924OvPPd/D6FBP4E?=
 =?us-ascii?Q?/BcH0SvOJVEJz7KUebIkOsOuf+PBOCA+hV4R7sh0TyjTWdTD8YzfEYUCLpIZ?=
 =?us-ascii?Q?7Dj1B/4udTQUuicCs4eAKBrH99g9+zaTPeuagaL3nIcXCSWF5atNaq8veEWp?=
 =?us-ascii?Q?it0v+QloSMRsyUV3CstXZXKB7sHXwg9yyeGspHD9JVYnY6USRLt1TYA0IlaJ?=
 =?us-ascii?Q?6TLNIrtg5ahgE4utIzlctbezaWHEe9pbDoTbmuM7rUPcSj7hLhIyPa2o7/Jj?=
 =?us-ascii?Q?hzGvjmPLHg/BUQ6ciYdRvNbmEEXo6Oz2P6CK2xVXG1i7ITnjAAX42Qw3SDMT?=
 =?us-ascii?Q?181jTIt3dlGfZlHidib1EaGNle7lrxItOAnpqUVOkSn3PUMoTUpsQou4Vx5n?=
 =?us-ascii?Q?QEmLItEQCDuTbY3BgTlbUlHsJz07K6PZGnpY/ZDOo30SwYkY5AtJ363ORnPk?=
 =?us-ascii?Q?+SaPtxdBdSKy+8XhYPoqGqLl2h7R3gfZ/mOPT+3CcGkkIOw0SPbqt0KjEsvA?=
 =?us-ascii?Q?TGQG3npby3uarvZTrTqfAx1QYvT14vCNv+IC2FuQUiP4vipCqr3Asr8PR7GN?=
 =?us-ascii?Q?mzsqSArOfQ+yBwDOJRfcbkc/YUe/DxmJ1a3JllIYs9eFK3DXV9cC/mRLok/M?=
 =?us-ascii?Q?V1sJlDzIaU5m0cdmCGpDYGYht5SkvTpe1+y4O+jCKUcpoCJN5P03Ba/IRiG1?=
 =?us-ascii?Q?dFznEpr/BGzECHJefN5i8qIgGahC3U97VQ1ZzMqvXoNphGramrMTQNv3p1QK?=
 =?us-ascii?Q?aElGtQmwC1+BE4VNxafsY/w8dqv7Ys9I3SqH4PcU2cZTXB0LAENmAqFimtZ1?=
 =?us-ascii?Q?m3d3pNKOU4WIri+n274eHDwKo+TUS+jG29SWEnFKRvtUbTNUFywVfDpP8gbJ?=
 =?us-ascii?Q?lT3sfI2twYXBYFCjKb0Y0+fT4J3AsfPw820tG2P5fnPfujpgJahoHC88Q+ob?=
 =?us-ascii?Q?93EVNtUfyM1EdrmjD95gKSHuVOiprT+uNIWtVFr/FOKAZ43Ro50+L5auNpX8?=
 =?us-ascii?Q?tDjLmNMELI7y4gnCtc3gra92LMx0jPt4oGXd1o08xSnNkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iLdF7k2m4/z+U0DEihqfyKjHd03b4ChsPWrFua/KI8GDe5C1v+3/WysZifLv?=
 =?us-ascii?Q?2HIRoCU/YmswfH7aPFiOFMhquodRCEFgHnwJ7Kv/t6aA6J77xqOIYA+FzH2D?=
 =?us-ascii?Q?raAs0xtDTc2b/d3kmQ93w6WUbAl68qeXKkANtmr38t8xi7Sjz6mCmFam4ZOA?=
 =?us-ascii?Q?Z1WhzYWeqeFOjhZg16pJQI7O+HZb2tdGerLNP7anfPtKcnyBAfopubo2Lkp3?=
 =?us-ascii?Q?V0UPIOHmw8QjjTY7wmgvWBHK4cgtEXjUw43dVPbDyUFU9C/aL4Q+TnWzEdGG?=
 =?us-ascii?Q?oEUZG1CVQXKzh+uwDK/UaG9cg2HFEJ6l5Od5dkbMoaGDLe421uVQekUuYxXK?=
 =?us-ascii?Q?i5fphqk9PJg+aE0UJOVYKY6BZi7trK6UAI0hZVw96DiR2PnPJRZbP+ppCC8H?=
 =?us-ascii?Q?CLzJx8gJ5hsqvGJRwgc7Bzd2cdfnwCDE4WmPMI/1gJ8Z8rL2mYmiPHPR8/IW?=
 =?us-ascii?Q?C3pFmG7+DOtPM7qtt5RefOVrFKGO+G3XGWtSqqP5WKNp+fMgAVVXEEUj0chN?=
 =?us-ascii?Q?TMyTi1PyqEpzaVmpL14TephfmduT/W6eu885pSFC+V6nJ3YAfDPY4MbT9bOk?=
 =?us-ascii?Q?jCbIf7GeMtiAYyV0x+I5GI47NGACVDXLnz/f8ddIzDkZcSZJZbFV1/0FxIiI?=
 =?us-ascii?Q?H8Nfp0DVsRZbhWAyR+NviCgaiT45N3bIHKJgQzx8EYObyfbYST6R26q89xEV?=
 =?us-ascii?Q?4Ic/3cLN1Wsd83czxrWny3YEaR1yqJMzsj+3QV2JMTipSfkXqnRrT1ngxYdo?=
 =?us-ascii?Q?BbU6V7YhngzhIfJADxz4CxQ4JUMYLGa0byo6qyM4PKOZ/+j2z6vdrMGBEHLr?=
 =?us-ascii?Q?2Sse01OjLgyEuMty/kGILB5wOhjhBTnN/qM+SB3gXnJWU8ay1kQf/FBRhA5b?=
 =?us-ascii?Q?pGZpNVLOUHzoC7ddL6Uo8de8N1AZ+hRZH8ON/GpTaOiMk7GOqDhSr1WZ6kA6?=
 =?us-ascii?Q?RKQXLXzuCKcD0662mmoktZ13DZnjruDgP7AsnPWsPKhjFz/2T26jtxoh8Dcm?=
 =?us-ascii?Q?enQNg7WiIjYV7SQ7Cv6r/0iLqzA4sHer6OQYx+cpV/PqbiYoqEqud7MG0IZ4?=
 =?us-ascii?Q?xhkpkDk9SiqgXzLNOAcXd0UbZ3O5ppIgx7Y3weSwyAQGUn20tOJ6NI6gLaUB?=
 =?us-ascii?Q?nmDmcDOBpTeYPK8B9dvUx4o5y5TTGG7wRIZWHIwpB48c3VLNJnWHtM+w2nG+?=
 =?us-ascii?Q?PiO5tu7WZxza7YMFRoSF4309NHAy2GjA8naEBF6iQHbVweGy4D+7qsHk/GrX?=
 =?us-ascii?Q?kF0OTn99oFvEa/ncdOfcnfkQxaKLAq4yWrasENr7OTYwy/SqZ5oj3jWjIbWA?=
 =?us-ascii?Q?4xDvwHMaLcWCVhTcJ+SHLUpb7lEak/1nVLEPXxciXo1gzPbp03CwHXNnRYV/?=
 =?us-ascii?Q?PTciJqi+oQDxeSaCJbFeGlNlBRfdEHdNGmrKqFCDLG9xZkIaI7JOf8uxguiP?=
 =?us-ascii?Q?iSF4ZTll6k90QxGymZWbJet2sEKMsBzfMdA9ndpTlnM8Ey+gP7J5NikX2rEo?=
 =?us-ascii?Q?NdJFa5vxLllRk0y9BObC0vNpvOJwIgN/0Xsqbp0L53XrwUKlvMb8E4kLt5KA?=
 =?us-ascii?Q?JHfgYA2g+xcflCTRL+ZXJvQsQDGrxlKjVvDKTNDoIl6rWPC8hghY7cPAN/aH?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c71555-f089-4ef3-d00c-08dd6b7747f9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:30:21.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88GvtUk5R9FE4nWjUTEm3i495gZkcpfL3z64cKXhKUTSP4b6mTbsU2ZQIOx/1D2VnoD5nf4/i21EBnYhTjQDrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF93A1BBECD
X-OriginatorOrg: intel.com

--RjmeHVVu++HFeLki
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi, Yury Norov,

we found a strange issue upon this commit

bb9854b1b053934a c061d07ca7f619a389972f5204f
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :10         100%          10:10    stderr.has_stderr
           :10         100%          10:10    stderr.netperf:data_send_error:No_such_process

one output during tests is attached.
for parent, netperf can run successfully and give out reasonable results.
but we didn't captured any useful information from dmesg.

below is full report FYI.

Hello,

kernel test robot noticed "stderr.netperf:data_send_error:No_such_process" on:

commit: c061d07ca7f619a389972f5204f990e49746578d ("bitmap: use bitmap_{read,write} where appropriate")
https://github.com/norov/linux shift

in testcase: netperf
version: netperf-x86_64-2.7-0_20241103
with following parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	send_size: 10K
	test: SCTP_STREAM_MANY
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503251628.297db24d-lkp@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250325/202503251628.297db24d-lkp@intel.com


2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 wait

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

....


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--RjmeHVVu++HFeLki
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="output"

==> /tmp/stdout <==

==> /tmp/stderr <==

==> /tmp/stdout <==
RESULT_ROOT=/result/netperf/cs-localhost-performance-ipv4-200%-300s-10K-SCTP_STREAM_MANY/lkp-icl-2sp2/debian-12-x86_64-20240206.cgz/x86_64-rhel-9.4/gcc-12/c061d07ca7f619a389972f5204f990e49746578d/0
job=/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-10K-SCTP_STREAM_MANY-debian-12-x86_64-20240206.cgz-c061d07ca7f6-20250324-3904740-11of7s5-4.yaml
result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESULT_ROOT: /internal-lkp-server/result/netperf/cs-localhost-performance-ipv4-200%-300s-10K-SCTP_STREAM_MANY/lkp-icl-2sp2/debian-12-x86_64-20240206.cgz/x86_64-rhel-9.4/gcc-12/c061d07ca7f619a389972f5204f990e49746578d/0, TMP_RESULT_ROOT: /tmp/lkp/result
run-job /lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-10K-SCTP_STREAM_MANY-debian-12-x86_64-20240206.cgz-c061d07ca7f6-20250324-3904740-11of7s5-4.yaml
/usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%25-300s-10K-SCTP_STREAM_MANY-debian-12-x86_64-20240206.cgz-c061d07ca7f6-20250324-3904740-11of7s5-4.yaml&job_state=running -O /dev/null
target ucode: 0xd0003a5
LKP: stdout: 2505: current_version: d0003a5, target_version: d0003a5
2025-03-24 07:58:30 
for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file="$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file="$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

check_nr_cpu
CPU(s):                               128
On-line CPU(s) list:                  0-127
Thread(s) per core:                   2
Core(s) per socket:                   32
Socket(s):                            2
CPU(s) scaling MHz:                   96%
NUMA node(s):                         2
NUMA node0 CPU(s):                    0-31,64-95
NUMA node1 CPU(s):                    32-63,96-127
2025-03-24 07:58:30 netserver -4 -D
Starting netserver with host 'IN(6)ADDR_ANY' port '12865' and family AF_INET
perf version 6.12.rc5.g11066801dd4b

==> /tmp/stderr <==
Events disabled
Events disabled

==> /tmp/stdout <==
2025-03-24 07:58:31 modprobe sctp
IPMI Device Information
perf version 6.12.rc5.g11066801dd4b
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:32 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 netperf -4 -H 127.0.0.1 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K  &
2025-03-24 07:58:33 wait

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
BMC ARP Control         : ARP Responses Enabled, Gratuitous ARP Disabled

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
Events enabled
netperf: data send error: No such process

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
len was -1

==> /tmp/stderr <==
[ perf record: Woken up 76 times to write data ]
[ perf record: Captured and wrote 179.674 MB /tmp/lkp/perf-sched.data (636033 samples) ]
Events enabled
[ perf record: Woken up 17 times to write data ]
Warning:
Processed 215529 events and lost 15 chunks!

Check IO/CPU overload!

Warning:
Processed 65753 samples and lost 87.29%!

[ perf record: Captured and wrote 26.701 MB /tmp/lkp/perf_c2c.data (8355 samples) ]

==> /tmp/stdout <==
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 127.0.0.1 () port 0 AF_INET : demo
Recv   Send    Send                          Utilization       Service Demand
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remote
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

212992 212992  10240    300.00     17265.47   5.23     5.23     3.177   3.175 

--RjmeHVVu++HFeLki--

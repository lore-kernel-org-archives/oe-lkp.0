Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6CE3F20E2
	for <oe-lkp@lists.linux.dev>; Mon, 11 May 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507684; cv=fail; b=SUucv/6u8DmhSJuOECetN+jPsDzrK0AbLHxrwNxRUjLy0vCPCrC3qxn9D71iB4V7KJwGPqHHWO2nEOAvJX26jsLfX6Wf6azFnu90UBV9oZ1tOpj3+r1L6itwcUCPS0lmg8zbQdhY1Z6xK3L2scomoZnhvKq2rdvEB+FfBWKF9zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507684; c=relaxed/simple;
	bh=dmj5gjL0ofWXQSMvQnUFL8tvhOWw7YFoYPC+kW7B7PA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JRd7HQMWoMhvKarKEDGkhXzQsDizNd/M4j8g/+GvxaEh3NK8FfCfkl2PF41AFuoV22yBJd8Ykt5E13seOeOBh4aTcTVkWzgRiFzxUxfRzexl8qGlK1MoGWm6AexpSKpGtxGLlbRuGU9QC7C8TxLAXbPerUMTqk6kxnX6fxtfVnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxCtGar2; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxCtGar2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778507678; x=1810043678;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=dmj5gjL0ofWXQSMvQnUFL8tvhOWw7YFoYPC+kW7B7PA=;
  b=dxCtGar2fwIoQvEkyx9SaAXIAsgqAP77Ej6oOghl+UOHqq89h2DKHktl
   oxzKXpkwmAdvvFWxu8uAvgG5v/3yEAVmUEYif/GRjqlSszaLa1yq8uP+E
   1iOEzVEtIjDFDumy3uB+mTGj3KuE/8aDolwP4PG4Yh0enhXtoSmaQX6S9
   /KkHc8jGUylQykHmO9aDcrRVxqrZPxZJkULaOKlNy5ShH4r///9gH39j4
   g37Ny8wYucFvSEoKxAH6WJaESZ3rdJ0b+X2R54IaEhA82lftfEDOnAirS
   zibvYLUWGwX7Oh/Jo9qUk8Q+8Jx88lwKiL6CznPhx1m4pBGAEzFzIIbTD
   w==;
X-CSE-ConnectionGUID: vbBSxx/4Qn22iebD4FhvxQ==
X-CSE-MsgGUID: w6hMhPKiTFaO4uxVbtjz7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83007636"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83007636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:54:37 -0700
X-CSE-ConnectionGUID: siIWq0dAQHGUW08S97zAwg==
X-CSE-MsgGUID: H9NUFCZVSdSKfhcl3kKpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237413040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:54:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 06:54:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 06:54:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 06:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jj41R3DffuOJMUTOGiRTPkH3Ev1hOFvjwb49m6khDkXi5kelBq0nOAgZaY07ev3XM0madrLJ1F14qZWrvpQ1lf9s6pqtzkI663xvqq0U5EP4exzN2PPJkWrcY/bGwMq8A7NzhMKtqv+ATmy3lX5BJPl0UTkAPvk/HvYEdfbyNwUS8CfoY8GmSPl1JmEPPCWa9lknww+hAC0CJYh3qBJNEigwJwKzXlSXmItOuynN7e3BkgEBuyI99t42n+hBBEgGRw2CgMenWiiC58iX3c/rsO6tn9VLfTLcOnzFXfIddFvz5Bn5fNkgoGQgdpbX0DrZYKShMeW3htG/DbM/b18oOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrX8pdQzjcf3rLPM7kBPJ3VuHYZGQquE7v4gAyfy4dA=;
 b=AeNtsnqsbH4/PTg0b+Sl76ENB01nm9j9v+tqxb+QGs4hSzkNstDRdRQDTvwVAhg/L45HPd1C8ITAkLjGg/K4CshMjHphFvYmxk95jypAuilTxIsB0jSfdEGtDyGVXF815DRoX0tRpZ8CrE6c0M2yzRe2Qp5TVQsXd9jdg4EvWCNiiPAH1wg/AMFKlQxqNtJj7vJyHzlqnoWM8CQ0ASzJBG23Yuex8dKLhVkVEk2VZ7xQTaew3043UvlJ+z/OGcejq+swuQmFNu1p0BYPXtPm5CkuIBiUSpxYDNm7mRY7yMYoRh1ire9f/TF0pbhon9Q62Cut8a+RyjhM2xUPfmRxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:54:26 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.019; Mon, 11 May 2026
 13:54:26 +0000
Date: Mon, 11 May 2026 21:54:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Calvin Owens <calvin@wbinvd.org>, Frederic Weisbecker
	<frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:timers/core] [hrtimer]  b40c927345:
 stress-ng.min-nanosleep.ops_per_sec 16.8% improvement
Message-ID: <202605112155.81306167-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 462baa8f-3034-4c8c-1f00-08deaf64cfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: EJCnxWoBqE4VfRmDsXCR3oGExe5s/InxH/QAAXDf8IaW41nH4dMTVKG6U0z/0ICiceVtXTdAcfjRq96WSChWFifvxeBjx5FoBvVvitnx0nTvYqGXIERgAg4Z4ikdIk9iSNDrASWL08UjZut3BE1+ojDA5sp5mWW0+z2oFVuznVTEveMtYFOX4xGmyd/TERYD7wpbgG77Xcaqgz4fwUiAQ1sy0fgKj1cax7Iec+kPyMK0npQg4wJY4XxSJfEMJ51JHwLCiRU03DP1ma7DywKLRLctgt/UOnW2AqNV5dBmi4gRsRX+T9upXMDC0ynAg8Y8WpIsBcbN7ybBMHLLyY/jKghlMTQXpC4U5tJ87EFpORxl+YB58XUHzIQEd1CukC2517FKbPV9iM3+NKw52Omtyx0bOHvyZcBKl2TvEJ6jE/fc+5Pl5Yp3CNJTw6lUOWlXM7YLzWfh7GY6dXkeHSGqJXru+cmjW7gSGsl/Ek3Ohnkpkd8up+hInQtimBLQkkcoAzUCCwO0/2qBcPoYJjTfngXb4WWfhjpUuxAm7zVB2n6qnjUohZVEL5BAVYkG1G9M0Jt71BD9PybQC2RumscrvErku98KFyH3vkKHLSZYtpAtGcq5cGgwYQvUM2Rfk/BRDabnOUrbpi5SEAXvTj+Isg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SWWO3Xr4KNDW1/EEglUGJFd0n5evn8eEXbQvmZrZvl0kfvBCBkN3mrO6I3?=
 =?iso-8859-1?Q?YiwNKC28/g9GrBAAV0kP3vC6VPZRGDj37iSUSfNIs4vfn7HzMfXf/NlLrp?=
 =?iso-8859-1?Q?e0b/DGDk9xzhT/ac0fP7RgwhS+PD4Fxngnm6aFJQHlprtdEebJfMKRJqj0?=
 =?iso-8859-1?Q?sSArvOTqXOuSBLd5sjLwP6aLc/hGJERZ5uhkcNPlIWgD88osWU1tiungmw?=
 =?iso-8859-1?Q?txg0xIpoiCkSukJ7eBaJB2iQL5OFKlqBroZVqR6tWjaNbTl7r8gphdFNWq?=
 =?iso-8859-1?Q?ctejqyzd7poXxZVmGnJP+L8YbzEjXzgjgwk6ktv0n01Yj26e5Q6tnNNili?=
 =?iso-8859-1?Q?RgESLfgiJBfnk+ogouQSL5xT8vBfemw3Ac3o9ifVLzmONmzP/eMXsNTdQM?=
 =?iso-8859-1?Q?JLsEGZl9VBChkH4Uw1ixrIquVZuMUnf1oH2fMJHX7Bgcn64AGgFjP7GRqt?=
 =?iso-8859-1?Q?FvLSsLoVG58T2eNKDdNWRNdW2cuZU6LJHpLZ+4oPeed+6rnFw0QgLeDvoi?=
 =?iso-8859-1?Q?1aq5nC6T42ldI2+/sUn2C62kRH24o/8gRLreOLCY476gKTIGPKfN2+XqWY?=
 =?iso-8859-1?Q?+11Kq7rJrBL0EeDWQ3HqxbNlQHNy0Wpq92zEGJLjA5XDM3R01aLurvVxXo?=
 =?iso-8859-1?Q?+Qwbl1tJzJtrZZsd6IorUzdMZjY8wIPl4pkd+tOyLIcRO/0YXo/hjbb+nX?=
 =?iso-8859-1?Q?qwai1F0RvJG9/mUy13GxHho0fdG71QZGVeQxUp5mgZk2bBvRXWxXjl2lts?=
 =?iso-8859-1?Q?HPYFgBuO9d26UvKOVZi/0t4SaDEWV3slasbkYgCxNZqqPnwz1RHbqLk++R?=
 =?iso-8859-1?Q?Y2r7zxrjRi81vDH8wEQureWsO+ioKwOf7vR10yyvHVp2foBrTAo3x52lZW?=
 =?iso-8859-1?Q?nqCjR7YKRmu3vtfiN/M3tvTE4eYj5GzUBPWS3Yb/xFPtjSPoQQ4xrAnV/c?=
 =?iso-8859-1?Q?ZMSBucHZ3lTOuFqVieE6wFAWHauFd8QcTtjy95GxjNjm1++QDqYrjbKZ1J?=
 =?iso-8859-1?Q?Dmd+IucmVq28EF+UC7UDGC8PYn8pkQ418ZmIQQZV+ltYCXGPtmwF+JoCUN?=
 =?iso-8859-1?Q?YMcNADHxcLWFbS0lkkD2WJwc1YwmYl6EbjX76wWTwjiPVfqXM4Ky5T0c+r?=
 =?iso-8859-1?Q?RTP9O/9IK0XI40iJAEpOnF+QZWaAzcPr16eMbg9ivvoRJQ32Hdu9QEx8l+?=
 =?iso-8859-1?Q?csvoS0jp1yDkEYZJzVZ4j9YIYa636gUjtFOHbaldj/0ijO6oRoyEW6lrMM?=
 =?iso-8859-1?Q?gNY7Pn3KNOdkWuYgQvMJRG9oI/xMAs/CReIO25ObTVynr6AsX5Xui3vXcu?=
 =?iso-8859-1?Q?BLPOD4BGUFMP2SE/8SO424crGR7C/4sG9AN/DxVIcMaKifpKTgRJAGB4Hy?=
 =?iso-8859-1?Q?/P2/ZhI2l4R/FWXzRy6ZoX9EyktHE8UZujuYIJznEfkZjqjh6IAYiP4ozm?=
 =?iso-8859-1?Q?Mjo3DBZl5WH6PEj/M8tZteUof4TajIAgnERjA6jyNFXgZrHcel2wHfRNcD?=
 =?iso-8859-1?Q?njAa4tnRlVFP+Oy3wEkn2p2uTsO1wcLfTbs2XxRMESONqGeGe0daHMh/Jf?=
 =?iso-8859-1?Q?q1YzUfCDX/NQbbJaRsUnrZ6+/HC7NN32GhKiAKAcMgnTHWR0YAsxd9jP9J?=
 =?iso-8859-1?Q?Zif1djN6RxPzJNpU205l1eDl74TpcDnNbHmJZQITkxXMM1t89yaSiNpkG8?=
 =?iso-8859-1?Q?ulAg2YRs/z859/KA6FO00Wj647+QdsL4qdufBZCJktSpoPShROE+q4Qpyh?=
 =?iso-8859-1?Q?jZas9zttJ9YbQ/IKL2vBkuCY1CsdcFqiPE5Q2QnCMc8TV7SYw3Uo/rViBx?=
 =?iso-8859-1?Q?v27/JFXO5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: Cm3ypARnCzJY3xaTHx1TpBdLfgEDtCHvDZeW/AxIiCa3LsTIrAkVw2Sbp0a8xucrI0lwYULXdcfit4LrxFgPGOTZLw0H9cd/M2zLpo3vBlwo7Hg7fKCm/3qzyzEmzOaylhLX4jNlsvSPdqiDpOG/qu285ePYrkRjtwEuQBVRL1EfebrMduLAkjoey99LL9beqlLefomOrVMdwuPtqFsjTD9mRpKfjKpgbceYi4PRiEI/k2U4jgPvq3aqNvA1nXT03i3kdeV5FxOVpns+v+PsHASaTjvhF4rFPT+PpUPwggKsO6hJYBHWTFvEpFq/+deWR+F9VCUkyu6VC6vls4hmVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 462baa8f-3034-4c8c-1f00-08deaf64cfe7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:54:26.0109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8NPXo6bTq5HqsWG0O5fLZW3lGwixzCAAJ9G/hZjByXNegQCy76Gub8Kc1x4t0aQwNAdOmXBNfLLypWeRIR20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 16.8% improvement of stress-ng.min-nanosleep.ops_per_sec on:


commit: b40c927345a91e687eac4c3c5ca03a99643cd0c4 ("hrtimer: Use hrtimer_start_expires_user() for hrtimer sleepers")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: min-nanosleep
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.alarm.ops_per_sec 63.0% improvement         |
| test parameters  | cpufreq_governor=performance                                     |
|                  | nr_threads=100%                                                  |
|                  | test=alarm                                                       |
|                  | testtime=60s                                                     |
+------------------+------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.poll.ops_per_sec 553.9% improvement         |
| test parameters  | cpufreq_governor=performance                                     |
|                  | nr_threads=100%                                                  |
|                  | test=poll                                                        |
|                  | testtime=60s                                                     |
+------------------+------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.min-nanosleep.ops_per_sec 17.9% improvement |
| test parameters  | cpufreq_governor=performance                                     |
|                  | nr_threads=100%                                                  |
|                  | test=min-nanosleep                                               |
|                  | testtime=60s                                                     |
+------------------+------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260511/202605112155.81306167-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/min-nanosleep/stress-ng/60s

commit: 
  bd5956166d ("hrtimer: Provide hrtimer_start_range_ns_user()")
  b40c927345 ("hrtimer: Use hrtimer_start_expires_user() for hrtimer sleepers")

bd5956166d20adbd b40c927345a91e687eac4c3c5ca 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    344027           +16.8%     401909        stress-ng.min-nanosleep.ops
      5734           +16.8%       6699        stress-ng.min-nanosleep.ops_per_sec
 1.156e+08           -17.0%   95892619        stress-ng.time.voluntary_context_switches
 1.196e+08           -16.2%  1.003e+08        cpuidle..usage
   2460509           -14.8%    2097006 ±  6%  numa-numastat.node1.local_node
   2549518           -12.4%    2234106 ±  4%  numa-numastat.node1.numa_hit
      0.72 ±  3%      -0.1        0.60 ±  3%  mpstat.cpu.all.irq%
      0.42 ±  2%      +0.1        0.48        mpstat.cpu.all.sys%
      4.02 ±  3%      -7.6%       3.71 ±  3%  mpstat.max_utilization_pct
  10056496           -10.1%    9044036        vmstat.memory.cache
   3632679           -17.5%    2998593        vmstat.system.cs
   1962882           -17.0%    1629714        vmstat.system.in
   6461377 ±  2%     -15.1%    5488570 ±  5%  numa-meminfo.node1.Active
   6461368 ±  2%     -15.1%    5488567 ±  5%  numa-meminfo.node1.Active(anon)
   7893547 ± 21%     -35.0%    5134639 ±  2%  numa-meminfo.node1.FilePages
  10005208 ± 15%     -29.1%    7094882 ±  5%  numa-meminfo.node1.MemUsed
   6030883           -16.5%    5032835        numa-meminfo.node1.Shmem
    566457            +5.2%     596162        sched_debug.cpu.avg_idle.avg
    228492 ±  6%     +10.6%     252803 ±  3%  sched_debug.cpu.avg_idle.stddev
    593373           -17.0%     492651        sched_debug.cpu.nr_switches.avg
    841736 ±  5%     -10.5%     753615 ±  2%  sched_debug.cpu.nr_switches.max
     14960 ± 79%     -82.3%       2654 ±163%  sched_debug.cpu.nr_switches.min
   1615562 ±  2%     -15.1%    1370807 ±  5%  numa-vmstat.node1.nr_active_anon
   1973609 ± 21%     -35.0%    1282323 ±  2%  numa-vmstat.node1.nr_file_pages
   1507943           -16.6%    1256872        numa-vmstat.node1.nr_shmem
   1615555 ±  2%     -15.1%    1370805 ±  5%  numa-vmstat.node1.nr_zone_active_anon
   2549939           -12.4%    2234197 ±  4%  numa-vmstat.node1.numa_hit
   2460930           -14.8%    2097097 ±  6%  numa-vmstat.node1.numa_local
      0.24           +17.4%       0.28 ±  2%  perf-sched.total_wait_and_delay.average.ms
   9391112           -16.9%    7806989        perf-sched.total_wait_and_delay.count.ms
      0.24           +17.1%       0.28 ±  2%  perf-sched.total_wait_time.average.ms
      0.24           +17.4%       0.28 ±  2%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   9391112           -16.9%    7806989        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.24           +17.1%       0.28 ±  2%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   6749159           -14.8%    5749013        meminfo.Active
   6749143           -14.8%    5748997        meminfo.Active(anon)
   9835277           -10.1%    8838144        meminfo.Cached
   8380297           -12.0%    7372914        meminfo.Committed_AS
  13914462            -7.3%   12898316        meminfo.Memused
   6035201           -16.5%    5038026        meminfo.Shmem
  13993515            -7.3%   12969465        meminfo.max_used_kB
    700.83           -31.2%     482.17        turbostat.Avg_MHz
     21.89            -6.8       15.06        turbostat.Busy%
     78.99            +6.8       85.82        turbostat.C1%
     77.96            +8.8%      84.82        turbostat.CPU%c1
      0.28           +22.4%       0.34        turbostat.IPC
 1.248e+08           -16.6%  1.041e+08        turbostat.IRQ
   2947248           -27.2%    2144636        turbostat.NMI
     18.53            -6.6       11.94        turbostat.POLL%
    204.34            -4.6%     194.96        turbostat.PkgWatt
   1687466           -14.8%    1437448        proc-vmstat.nr_active_anon
   2459004           -10.1%    2209736        proc-vmstat.nr_file_pages
   1508984           -16.5%    1259706        proc-vmstat.nr_shmem
     37134            -1.7%      36504        proc-vmstat.nr_slab_reclaimable
   1687466           -14.8%    1437448        proc-vmstat.nr_zone_active_anon
      9510 ±  5%     -13.3%       8240 ±  7%  proc-vmstat.numa_hint_faults
      9137 ±  6%     -14.7%       7798 ±  7%  proc-vmstat.numa_hint_faults_local
   2875031           -11.1%    2555226 ±  4%  proc-vmstat.numa_hit
   2676335           -12.0%    2355365 ±  4%  proc-vmstat.numa_local
     12088 ±  5%     -14.2%      10374 ±  6%  proc-vmstat.numa_pte_updates
   2928652           -12.9%    2552184        proc-vmstat.pgalloc_normal
 8.679e+09           -18.2%  7.102e+09        perf-stat.i.branch-instructions
      0.50            +0.0        0.52        perf-stat.i.branch-miss-rate%
  39835631           -13.9%   34316048        perf-stat.i.branch-misses
   9257123 ±  4%     -14.6%    7901001 ±  5%  perf-stat.i.cache-misses
  28038712           -11.3%   24862239 ±  3%  perf-stat.i.cache-references
   3796841           -17.0%    3150693        perf-stat.i.context-switches
      3.99           -17.7%       3.28        perf-stat.i.cpi
 1.381e+11           -30.5%  9.595e+10        perf-stat.i.cpu-cycles
     59118 ±  3%     -16.3%      49454 ±  5%  perf-stat.i.cycles-between-cache-misses
 3.762e+10           -15.7%  3.172e+10        perf-stat.i.instructions
      0.27           +20.6%       0.33        perf-stat.i.ipc
     19.79           -17.1%      16.41        perf-stat.i.metric.K/sec
      0.46            +0.0        0.48        perf-stat.overall.branch-miss-rate%
      3.68           -17.7%       3.03        perf-stat.overall.cpi
     15234 ±  5%     -19.0%      12337 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.27           +21.5%       0.33        perf-stat.overall.ipc
 8.535e+09           -18.1%  6.987e+09        perf-stat.ps.branch-instructions
  39052908           -13.8%   33660279        perf-stat.ps.branch-misses
   8949389 ±  4%     -14.2%    7679130 ±  5%  perf-stat.ps.cache-misses
  27483398           -11.3%   24366872 ±  3%  perf-stat.ps.cache-references
   3737062           -17.0%    3100763        perf-stat.ps.context-switches
  1.36e+11           -30.6%  9.443e+10        perf-stat.ps.cpu-cycles
 3.698e+10           -15.6%   3.12e+10        perf-stat.ps.instructions
  2.28e+12           -15.6%  1.926e+12        perf-stat.total.instructions
     85.54            -5.8       79.70        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     91.17            -3.4       87.77        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     90.68            -3.2       87.47        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     91.42            -3.0       88.46        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     93.11            -2.8       90.31        perf-profile.calltrace.cycles-pp.common_startup_64
     92.52            -2.7       89.82        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     92.51            -2.7       89.80        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     92.54            -2.7       89.83        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.56 ±  2%      -0.1        0.44 ± 44%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle
      1.10            -0.1        1.02 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.78 ±  2%      -0.1        0.73 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter
      0.64 ±  2%      -0.0        0.60 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state
      0.62            +0.1        0.76        perf-profile.calltrace.cycles-pp.os_xsave
      0.62 ±  2%      +0.1        0.76        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.64 ±  2%      +0.2        0.80        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.60 ±  4%      +0.2        0.78 ±  2%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.44 ± 45%      +0.2        0.66 ±  3%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__pick_next_task.__schedule.schedule
      0.46 ± 45%      +0.2        0.68 ±  3%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.do_nanosleep
      0.63 ±  2%      +0.2        0.86        perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.83 ±  4%      +0.3        1.17 ±  2%  perf-profile.calltrace.cycles-pp.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.84 ±  4%      +0.3        1.18 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.14 ±  9%      +0.4        1.56 ±  4%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.60 ±  2%      +0.4        2.04        perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.64 ±  2%      +0.4        2.09        perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.34 ±  8%      +0.5        1.83 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt
      0.08 ±223%      +0.5        0.62 ±  3%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt
      1.48 ±  7%      +0.5        2.03 ±  4%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt
      0.00            +0.6        0.55        perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.do_nanosleep
      0.00            +0.6        0.59        perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      1.14 ±  4%      +0.6        1.75 ±  9%  perf-profile.calltrace.cycles-pp.add_callchain_ip.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit
      1.18 ±  4%      +0.6        1.81 ±  9%  perf-profile.calltrace.cycles-pp.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event
      1.82 ±  6%      +0.7        2.50 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      0.00            +0.8        0.82 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +0.8        0.83 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.24 ±  2%      +0.8        3.08 ±  2%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      1.49 ±  6%      +0.9        2.35 ±  5%  perf-profile.calltrace.cycles-pp.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush
      1.52 ±  6%      +0.9        2.39 ±  5%  perf-profile.calltrace.cycles-pp.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event
      2.30 ±  5%      +0.9        3.20 ±  2%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.60 ±  5%      +0.9        2.52 ±  5%  perf-profile.calltrace.cycles-pp.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event.reader__read_event
      2.43 ±  2%      +0.9        3.38        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.44 ±  2%      +1.0        3.39        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.70 ±  4%      +1.0        2.67 ±  5%  perf-profile.calltrace.cycles-pp.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event.reader__read_event.perf_session__process_events
      1.71 ±  4%      +1.0        2.68 ±  5%  perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_user_event.reader__read_event.perf_session__process_events.record__finish_output
      1.71 ±  4%      +1.0        2.68 ±  5%  perf-profile.calltrace.cycles-pp.perf_session__process_user_event.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      2.29            +1.0        3.33        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      2.29            +1.0        3.34        perf-profile.calltrace.cycles-pp.cmd_record
      2.29            +1.0        3.34        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.cmd_record
      2.29            +1.0        3.34        perf-profile.calltrace.cycles-pp.record__finish_output.cmd_record
      2.64 ±  2%      +1.1        3.71        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.88 ±  2%      +1.2        4.10 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.90 ±  2%      +1.2        4.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.94 ±  2%      +2.5        7.39        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      4.93 ±  2%      +2.5        7.38        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      4.95 ±  2%      +2.5        7.41        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      7.20 ±  2%      +3.8       10.97        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
     85.99            -5.9       80.12        perf-profile.children.cycles-pp.poll_idle
     91.24            -3.3       87.93        perf-profile.children.cycles-pp.cpuidle_enter_state
     91.25            -3.3       87.93        perf-profile.children.cycles-pp.cpuidle_enter
     91.99            -3.1       88.93        perf-profile.children.cycles-pp.cpuidle_idle_call
     93.09            -2.8       90.28        perf-profile.children.cycles-pp.do_idle
     93.11            -2.8       90.31        perf-profile.children.cycles-pp.common_startup_64
     93.11            -2.8       90.31        perf-profile.children.cycles-pp.cpu_startup_entry
     92.54            -2.7       89.83        perf-profile.children.cycles-pp.start_secondary
      0.06            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.error_entry
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.ct_idle_exit
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.11 ±  5%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.06 ± 11%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.08 ±  6%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.finish_task_switch
      0.05 ±  8%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.08 ±  8%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.07            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.09 ±  5%      +0.0        0.11        perf-profile.children.cycles-pp.irqentry_enter
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.set_next_entity
      0.17 ±  6%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.update_se
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.13 ±  3%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.set_next_task_fair
      0.04 ± 45%      +0.0        0.07        perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.12 ±  4%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.tick_irq_enter
      0.08 ±  8%      +0.0        0.11 ±  9%  perf-profile.children.cycles-pp.__resched_curr
      0.06 ±  8%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.sched_balance_domains
      0.12            +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.07 ±  5%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.13 ±  2%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.08 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.___perf_sw_event
      0.11 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.19            +0.0        0.22        perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.04 ± 44%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.hrtimer_active
      0.12 ±  3%      +0.0        0.15 ±  4%  perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.09 ± 14%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.11 ±  3%      +0.0        0.15 ±  7%  perf-profile.children.cycles-pp.wakeup_preempt
      0.11 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
      0.12 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.20 ±  3%      +0.0        0.24        perf-profile.children.cycles-pp.__hrtimer_rearm_deferred
      0.15 ±  7%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.select_task_rq
      0.17            +0.0        0.21        perf-profile.children.cycles-pp.update_rq_clock
      0.22            +0.0        0.26 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.20 ±  5%      +0.0        0.24        perf-profile.children.cycles-pp.update_curr
      0.10 ±  3%      +0.0        0.14 ± 15%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.06 ± 19%      +0.0        0.11 ±  8%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.19 ±  2%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.19 ±  2%      +0.0        0.24 ±  4%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.09 ±  7%      +0.0        0.14 ±  5%  perf-profile.children.cycles-pp.handle_softirqs
      0.10 ±  3%      +0.0        0.15 ± 13%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.10 ±  7%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.thread__get
      0.05 ± 47%      +0.0        0.10 ±  8%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.22 ±  2%      +0.0        0.26 ±  2%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.25            +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.timerqueue_linked_add
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.09 ±  4%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.thread__put
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.threads__find
      0.27 ±  2%      +0.1        0.33        perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.maps__refcnt
      0.34 ±  2%      +0.1        0.40        perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.machine__findnew_thread
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.08 ± 17%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.08 ±  6%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.19 ±  3%      +0.1        0.26 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.12 ±  4%      +0.1        0.19 ±  9%  perf-profile.children.cycles-pp.maps__find
      0.25 ±  4%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.update_load_avg
      0.21 ±  3%      +0.1        0.28 ±  2%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.09 ± 13%      +0.1        0.16 ±  9%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.31 ±  2%      +0.1        0.38        perf-profile.children.cycles-pp.__switch_to
      0.11 ±  6%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp._copy_from_user
      0.09 ±  5%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.__hrtimer_setup
      0.31            +0.1        0.38        perf-profile.children.cycles-pp.sched_clock
      0.33            +0.1        0.40        perf-profile.children.cycles-pp.sched_clock_cpu
      0.12 ±  6%      +0.1        0.20        perf-profile.children.cycles-pp.get_timespec64
      0.11            +0.1        0.19        perf-profile.children.cycles-pp.hrtimer_setup_sleeper_on_stack
      0.32 ±  6%      +0.1        0.40 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      0.17 ±  7%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.map_symbol__copy
      0.64            +0.1        0.73        perf-profile.children.cycles-pp.native_sched_clock
      0.12 ±  4%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.37 ±  5%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.15 ±  9%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.14 ± 10%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.switch_fpu_return
      0.39 ±  4%      +0.1        0.48 ±  4%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.21 ±  2%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.39 ±  4%      +0.1        0.49 ±  4%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.13 ± 15%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.21 ±  6%      +0.1        0.32 ±  9%  perf-profile.children.cycles-pp.callchain_cursor_append
      0.39            +0.1        0.50        perf-profile.children.cycles-pp.dequeue_entity
      0.56 ±  7%      +0.1        0.67 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.44 ±  2%      +0.1        0.55        perf-profile.children.cycles-pp.dequeue_entities
      0.43 ±  4%      +0.1        0.54 ±  4%  perf-profile.children.cycles-pp.sched_balance_rq
      0.45            +0.1        0.57        perf-profile.children.cycles-pp.dequeue_task_fair
      0.25 ± 19%      +0.1        0.37 ±  9%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.58 ±  6%      +0.1        0.70 ±  3%  perf-profile.children.cycles-pp.enqueue_task
      0.28 ±  3%      +0.1        0.40        perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.47            +0.1        0.59        perf-profile.children.cycles-pp.try_to_block_task
      0.25 ±  7%      +0.1        0.38 ±  9%  perf-profile.children.cycles-pp.maps__get
      0.62            +0.1        0.76        perf-profile.children.cycles-pp.os_xsave
      0.24 ±  3%      +0.1        0.38 ±  9%  perf-profile.children.cycles-pp.addr_location__exit
      0.53 ±  5%      +0.1        0.67 ±  3%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.66 ±  2%      +0.2        0.80        perf-profile.children.cycles-pp.schedule_idle
      0.70 ±  6%      +0.2        0.86 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.25 ±  4%      +0.2        0.43 ± 10%  perf-profile.children.cycles-pp.map__put
      0.75 ±  5%      +0.2        0.94 ±  2%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.38 ±  4%      +0.2        0.58 ± 10%  perf-profile.children.cycles-pp.thread__find_map
      0.35 ± 12%      +0.2        0.56 ±  7%  perf-profile.children.cycles-pp.maps__put
      0.83 ±  3%      +0.2        1.05 ±  2%  perf-profile.children.cycles-pp.__pick_next_task
      0.64 ±  2%      +0.2        0.87        perf-profile.children.cycles-pp.menu_select
      0.45 ± 18%      +0.3        0.72 ±  9%  perf-profile.children.cycles-pp.ktime_get
      0.46 ± 20%      +0.3        0.76 ± 15%  perf-profile.children.cycles-pp.map_symbol__exit
      1.27 ±  4%      +0.3        1.59 ±  3%  perf-profile.children.cycles-pp.hrtimer_wakeup
      1.26 ±  4%      +0.3        1.58 ±  3%  perf-profile.children.cycles-pp.try_to_wake_up
      1.62 ±  7%      +0.4        2.02 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.65 ±  2%      +0.4        2.10        perf-profile.children.cycles-pp.schedule
      1.93 ±  6%      +0.5        2.38 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.16 ±  6%      +0.5        2.66 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.24 ±  2%      +0.6        2.82        perf-profile.children.cycles-pp.__schedule
      1.14 ±  4%      +0.6        1.76 ±  9%  perf-profile.children.cycles-pp.add_callchain_ip
      2.64 ±  5%      +0.6        3.27 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.18 ±  4%      +0.6        1.81 ±  9%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      0.00            +0.8        0.82 ±  4%  perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      0.00            +0.8        0.83 ±  4%  perf-profile.children.cycles-pp.hrtimer_sleeper_start_expires
      2.26 ±  2%      +0.8        3.10 ±  2%  perf-profile.children.cycles-pp.do_nanosleep
      1.49 ±  6%      +0.9        2.35 ±  5%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      1.52 ±  6%      +0.9        2.40 ±  5%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      1.60 ±  5%      +0.9        2.52 ±  5%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      2.46 ±  2%      +0.9        3.40        perf-profile.children.cycles-pp.common_nsleep
      2.43 ±  2%      +1.0        3.39        perf-profile.children.cycles-pp.hrtimer_nanosleep
      1.70 ±  4%      +1.0        2.67 ±  5%  perf-profile.children.cycles-pp.perf_session__deliver_event
      1.71 ±  4%      +1.0        2.68 ±  5%  perf-profile.children.cycles-pp.__ordered_events__flush
      1.71 ±  4%      +1.0        2.68 ±  5%  perf-profile.children.cycles-pp.perf_session__process_user_event
      2.29            +1.0        3.34        perf-profile.children.cycles-pp.reader__read_event
      2.29            +1.0        3.34        perf-profile.children.cycles-pp.perf_session__process_events
      2.29            +1.0        3.34        perf-profile.children.cycles-pp.record__finish_output
      2.32            +1.0        3.38        perf-profile.children.cycles-pp.cmd_record
      2.65 ±  2%      +1.1        3.71        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      2.94 ±  2%      +1.2        4.16        perf-profile.children.cycles-pp.do_syscall_64
      2.95 ±  2%      +1.2        4.20        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.79 ±  2%      +2.2        8.00        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      4.96 ±  2%      +2.5        7.43        perf-profile.children.cycles-pp.acpi_safe_halt
      4.96 ±  2%      +2.5        7.43        perf-profile.children.cycles-pp.pv_native_safe_halt
      4.97 ±  2%      +2.5        7.44        perf-profile.children.cycles-pp.acpi_idle_do_entry
      4.98 ±  2%      +2.5        7.46        perf-profile.children.cycles-pp.acpi_idle_enter
     84.70            -5.8       78.92        perf-profile.self.cycles-pp.poll_idle
      0.06            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.error_entry
      0.07            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.enqueue_entity
      0.06 ±  7%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.___perf_sw_event
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.11            +0.0        0.13 ±  5%  perf-profile.self.cycles-pp.do_idle
      0.10 ±  3%      +0.0        0.12        perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.08 ±  6%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.try_to_wake_up
      0.07            +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.08 ±  8%      +0.0        0.11 ±  9%  perf-profile.self.cycles-pp.__resched_curr
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.11            +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.18 ±  2%      +0.0        0.22        perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.08 ± 10%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.dequeue_entity
      0.08 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.07 ±  5%      +0.0        0.11 ± 12%  perf-profile.self.cycles-pp.map_symbol__copy
      0.22            +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.07 ±  6%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.08 ±  4%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.do_nanosleep
      0.02 ± 99%      +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.switch_fpu_return
      0.06 ±  8%      +0.0        0.10 ± 10%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.10 ±  7%      +0.0        0.14 ± 12%  perf-profile.self.cycles-pp.thread__get
      0.19 ±  2%      +0.0        0.23 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.13 ±  9%      +0.0        0.18 ±  7%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.19 ±  2%      +0.0        0.24 ±  4%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.22 ±  2%      +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.24            +0.0        0.29        perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.maps__refcnt
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.schedule
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.select_task_rq
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.update_rq_clock_task
      0.32            +0.1        0.37        perf-profile.self.cycles-pp.clockevents_program_event
      0.09 ±  6%      +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.thread__put
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.do_perf_trace_sched_wakeup_template
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.hrtimer_active
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.thread__find_map
      0.10 ±  7%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.add_callchain_ip
      0.26 ±  2%      +0.1        0.32        perf-profile.self.cycles-pp.__switch_to
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.do_syscall_64
      0.11 ±  3%      +0.1        0.17 ±  8%  perf-profile.self.cycles-pp.maps__find
      0.08 ±  6%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.18 ±  2%      +0.1        0.25        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.09 ±  5%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__hrtimer_setup
      0.09 ± 13%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.11 ±  6%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      0.27 ±  2%      +0.1        0.35        perf-profile.self.cycles-pp.__schedule
      0.34 ±  6%      +0.1        0.42 ±  5%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.64            +0.1        0.73        perf-profile.self.cycles-pp.native_sched_clock
      0.12 ±  4%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.32 ±  3%      +0.1        0.41        perf-profile.self.cycles-pp.menu_select
      0.24 ±  6%      +0.1        0.36 ± 10%  perf-profile.self.cycles-pp.maps__get
      0.62            +0.1        0.76        perf-profile.self.cycles-pp.os_xsave
      0.25 ±  4%      +0.2        0.42 ± 10%  perf-profile.self.cycles-pp.map__put
      0.34 ± 11%      +0.2        0.54 ±  7%  perf-profile.self.cycles-pp.maps__put
      0.45 ± 18%      +0.3        0.72 ±  9%  perf-profile.self.cycles-pp.ktime_get
      2.65            +1.6        4.21        perf-profile.self.cycles-pp.pv_native_safe_halt


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/alarm/stress-ng/60s

commit: 
  bd5956166d ("hrtimer: Provide hrtimer_start_range_ns_user()")
  b40c927345 ("hrtimer: Use hrtimer_start_expires_user() for hrtimer sleepers")

bd5956166d20adbd b40c927345a91e687eac4c3c5ca 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  4.52e+08           +63.0%  7.369e+08        stress-ng.alarm.ops
   7533290           +63.0%   12282030        stress-ng.alarm.ops_per_sec
  35365831           -17.1%   29330029        stress-ng.time.involuntary_context_switches
     10042            -7.8%       9256        stress-ng.time.percent_of_cpu_this_job_got
      5247            -7.4%       4858        stress-ng.time.system_time
    794.80           -10.5%     711.33        stress-ng.time.user_time
 5.721e+08            -3.0%   5.55e+08        stress-ng.time.voluntary_context_switches
 7.715e+09            +8.1%  8.341e+09        cpuidle..time
      5.72            -1.2        4.53        mpstat.cpu.all.irq%
      3.92            -0.2        3.68        mpstat.cpu.all.usr%
     51.52            -8.6%      47.09        mpstat.max_utilization_pct
    125.26 ±  2%      -8.6%     114.53 ±  2%  vmstat.procs.r
  18212690            -3.3%   17604524        vmstat.system.cs
   4989000           -21.1%    3937958        vmstat.system.in
     83596           -13.1%      72622        sched_debug.cfs_rq:/.avg_vruntime.avg
     97234 ±  7%     -15.6%      82109 ±  5%  sched_debug.cfs_rq:/.left_deadline.max
     97233 ±  7%     -15.6%      82095 ±  5%  sched_debug.cfs_rq:/.left_vruntime.max
     97233 ±  7%     -15.6%      82095 ±  5%  sched_debug.cfs_rq:/.right_vruntime.max
    291.62            -6.8%     271.82 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    264.36            -6.1%     248.22 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
     83596           -13.1%      72622        sched_debug.cfs_rq:/.zero_vruntime.avg
      1564            -7.2%       1452        turbostat.Avg_MHz
     56.33            -3.9       52.47        turbostat.Busy%
      1.66 ±  2%      -0.1        1.57        turbostat.C1%
     40.79            +4.2       44.98        turbostat.C1E%
     12.45           +29.8%      16.16 ±  2%  turbostat.CPU%c1
      0.44           +11.8%       0.49        turbostat.IPC
 3.199e+08           -21.3%  2.517e+08        turbostat.IRQ
   8488382            -5.6%    8012773 ±  2%  turbostat.NMI
      2.15 ±  2%      +0.2        2.40        turbostat.POLL%
      3.55            -8.9%       3.23        perf-stat.i.MPKI
 3.819e+10            +3.6%  3.956e+10        perf-stat.i.branch-instructions
      0.74            -0.1        0.67        perf-stat.i.branch-miss-rate%
 2.472e+08            -4.5%  2.361e+08        perf-stat.i.branch-misses
 5.998e+08            -4.3%  5.739e+08        perf-stat.i.cache-misses
 1.505e+09            -5.3%  1.425e+09        perf-stat.i.cache-references
  19260127            -3.4%   18601737        perf-stat.i.context-switches
      2.25           -11.8%       1.98        perf-stat.i.cpi
 3.773e+11            -7.0%  3.509e+11        perf-stat.i.cpu-cycles
   5954882            -7.9%    5483068        perf-stat.i.cpu-migrations
 1.892e+11            +3.4%  1.955e+11        perf-stat.i.instructions
      0.49           +11.3%       0.54        perf-stat.i.ipc
     98.47            -4.5%      94.05        perf-stat.i.metric.K/sec
      3.22            -7.5%       2.98        perf-stat.overall.MPKI
      0.66            -0.1        0.60        perf-stat.overall.branch-miss-rate%
      2.03           -10.3%       1.82        perf-stat.overall.cpi
      0.49           +11.4%       0.55        perf-stat.overall.ipc
 3.621e+10            +3.8%  3.758e+10        perf-stat.ps.branch-instructions
 2.373e+08            -4.6%  2.265e+08        perf-stat.ps.branch-misses
 5.785e+08            -4.2%  5.542e+08        perf-stat.ps.cache-misses
 1.456e+09            -5.3%  1.378e+09        perf-stat.ps.cache-references
  18685933            -3.4%   18042928        perf-stat.ps.context-switches
 3.646e+11            -7.1%  3.388e+11        perf-stat.ps.cpu-cycles
   5784749            -7.9%    5324973        perf-stat.ps.cpu-migrations
 1.796e+11            +3.6%   1.86e+11        perf-stat.ps.instructions
 1.074e+13            +2.9%  1.105e+13        perf-stat.total.instructions
     19.30            -2.5       16.82 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.kill
     18.00            -2.5       15.51 ±  2%  perf-profile.calltrace.cycles-pp.do_send_sig_info.kill_pid_info_type.__x64_sys_kill.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.68            -2.5       17.19 ±  2%  perf-profile.calltrace.cycles-pp.kill
     19.26            -2.5       16.77 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.kill
     18.56            -2.5       16.09 ±  2%  perf-profile.calltrace.cycles-pp.kill_pid_info_type.__x64_sys_kill.do_syscall_64.entry_SYSCALL_64_after_hwframe.kill
     19.08            -2.5       16.61 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_kill.do_syscall_64.entry_SYSCALL_64_after_hwframe.kill
     11.60            -2.4        9.19 ±  2%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.48            -2.3        8.23 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     15.83            -1.9       13.91 ±  2%  perf-profile.calltrace.cycles-pp.__send_signal_locked.do_send_sig_info.kill_pid_info_type.__x64_sys_kill.do_syscall_64
      3.13 ±  8%      -1.1        2.02 ±  3%  perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.sig_get_ucounts.__send_signal_locked.do_send_sig_info.kill_pid_info_type
      3.14 ±  8%      -1.1        2.04 ±  2%  perf-profile.calltrace.cycles-pp.sig_get_ucounts.__send_signal_locked.do_send_sig_info.kill_pid_info_type.__x64_sys_kill
     12.92            -0.9       11.98 ±  2%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.60            -0.9       12.74        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.82 ±  8%      -0.8        1.98 ±  2%  perf-profile.calltrace.cycles-pp.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      2.82 ±  8%      -0.8        1.97 ±  2%  perf-profile.calltrace.cycles-pp.dec_rlimit_put_ucounts.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.97 ±  4%      -0.4        0.59 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.do_send_sig_info.kill_pid_info_type.__x64_sys_kill
      1.45 ±  2%      -0.4        1.08 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.do_send_sig_info.kill_pid_info_type.__x64_sys_kill.do_syscall_64
      1.76            -0.3        1.44        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_signal_ignore_handler
      1.76            -0.3        1.44        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_signal_ignore_handler
      1.47            -0.3        1.15        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_signal_ignore_handler
      1.67            -0.3        1.36        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_signal_ignore_handler
      1.02 ±  2%      -0.3        0.71        perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.78 ±  2%      -0.1        0.66 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      0.88 ±  2%      -0.1        0.77        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.do_setitimer.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.25            -0.1        4.14        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.60            -0.1        2.48        perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.do_nanosleep
      2.67            -0.1        2.56        perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      2.47            -0.1        2.37        perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      2.61            -0.1        2.52        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      2.24            -0.1        2.15        perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.43            -0.1        2.34        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.48            -0.1        2.38        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.60            -0.1        0.52        perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq.try_to_wake_up.complete_signal.__send_signal_locked
      2.99            -0.1        2.92        perf-profile.calltrace.cycles-pp.__sched_yield
      0.66            -0.1        0.58        perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      3.74            -0.1        3.66        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.06            -0.1        1.99        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      3.27            -0.1        3.21        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.68            -0.1        0.62        perf-profile.calltrace.cycles-pp.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq.try_to_wake_up
      1.78            -0.0        1.73        perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.73            -0.0        1.68        perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.78            -0.0        0.74        perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.select_task_rq.try_to_wake_up.hrtimer_wakeup
      0.69            +0.0        0.71        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.84            +0.0        0.86        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.64            +0.0        0.67        perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.93            +0.0        0.96        perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule_idle.do_idle.cpu_startup_entry
      1.26            +0.0        1.30        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      0.63            +0.0        0.68        perf-profile.calltrace.cycles-pp.stress_alarm
      1.62            +0.1        1.68        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.70            +0.1        0.76        perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      1.97            +0.1        2.03        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.66            +0.1        0.73 ±  2%  perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.complete_signal.__send_signal_locked.do_send_sig_info
      2.54            +0.1        2.61        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      2.38            +0.1        2.48        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      1.53            +0.1        1.63        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_sigmask
      2.65            +0.1        2.75        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.53            +0.1        0.67 ±  2%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.do_setitimer.__x64_sys_alarm.do_syscall_64
      0.59 ± 44%      +0.2        0.76        perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.60 ± 44%      +0.2        0.78        perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      1.51            +0.2        1.70        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.61 ± 44%      +0.2        0.79        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      0.61 ± 44%      +0.2        0.79        perf-profile.calltrace.cycles-pp.cmd_record
      0.61 ± 44%      +0.2        0.79        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.cmd_record
      0.61 ± 44%      +0.2        0.79        perf-profile.calltrace.cycles-pp.record__finish_output.cmd_record
      0.63            +0.2        0.84        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.do_setitimer.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.23 ±  2%      +0.2        1.46        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.do_nanosleep
      1.06 ±  3%      +0.2        1.29        perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__pick_next_task.__schedule.schedule
      0.84            +0.4        1.19        perf-profile.calltrace.cycles-pp.__hrtimer_get_remaining.do_setitimer.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.30            +0.4        3.67        perf-profile.calltrace.cycles-pp.pthread_sigmask
     12.20            +0.4       12.60        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      4.44            +0.5        4.95        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.alarm
     10.76            +0.5       11.30        perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.pthread_sigmask
      4.52            +0.6        5.07        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.alarm
      0.00            +0.6        0.56 ±  3%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_newidle.pick_next_task_fair.__pick_next_task.__schedule
     11.14            +0.6       11.73        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.hrtimer_try_to_cancel.do_setitimer.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.18            +0.6       11.77        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.88            +0.7       12.53        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.65        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__hrtimer_get_remaining.do_setitimer.__x64_sys_alarm.do_syscall_64
      0.00            +0.7        0.71        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns_user.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep
      3.26            +0.7        3.98        perf-profile.calltrace.cycles-pp.do_setitimer.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe.alarm
      3.88 ±  3%      +0.8        4.64 ±  2%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      3.34            +0.8        4.11        perf-profile.calltrace.cycles-pp.__x64_sys_alarm.do_syscall_64.entry_SYSCALL_64_after_hwframe.alarm
      4.99            +0.9        5.86        perf-profile.calltrace.cycles-pp.alarm
     21.64            +1.0       22.66        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     21.19            +1.0       22.24        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     22.85            +1.1       23.91        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     31.20            +1.2       32.37        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     31.17            +1.2       32.34        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     31.32            +1.2       32.50        perf-profile.calltrace.cycles-pp.common_startup_64
     31.04            +1.2       32.22        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +1.7        1.74        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +1.8        1.79        perf-profile.calltrace.cycles-pp.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     59.58            -2.6       56.94        perf-profile.children.cycles-pp.do_syscall_64
     59.84            -2.5       57.30        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     18.01            -2.5       15.53 ±  2%  perf-profile.children.cycles-pp.do_send_sig_info
     19.84            -2.5       17.36 ±  2%  perf-profile.children.cycles-pp.kill
     19.10            -2.5       16.62 ±  2%  perf-profile.children.cycles-pp.__x64_sys_kill
     18.56            -2.5       16.10 ±  2%  perf-profile.children.cycles-pp.kill_pid_info_type
     16.18            -2.0       14.14        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     15.84            -1.9       13.92 ±  2%  perf-profile.children.cycles-pp.__send_signal_locked
     16.91            -1.9       15.01        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     11.73            -1.7       10.02 ±  2%  perf-profile.children.cycles-pp.get_signal
     10.60            -1.6        8.99 ±  3%  perf-profile.children.cycles-pp.dequeue_signal
      3.14 ±  8%      -1.1        2.04 ±  2%  perf-profile.children.cycles-pp.sig_get_ucounts
      3.13 ±  8%      -1.1        2.02 ±  2%  perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
      3.29 ±  8%      -1.1        2.19 ±  2%  perf-profile.children.cycles-pp.__sigqueue_free
      3.28 ±  8%      -1.1        2.18 ±  2%  perf-profile.children.cycles-pp.dec_rlimit_put_ucounts
      1.97            -1.1        0.90        perf-profile.children.cycles-pp.hrtimer_start_range_ns
      3.03 ±  3%      -1.0        2.00 ±  3%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      7.33            -0.7        6.60        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      6.37            -0.6        5.78        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.90            -0.6        5.34        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      5.72            -0.5        5.18        perf-profile.children.cycles-pp.hrtimer_interrupt
      2.80            -0.5        2.30        perf-profile.children.cycles-pp._raw_spin_lock_irq
      5.25            -0.5        4.76        perf-profile.children.cycles-pp.__hrtimer_run_queues
      4.72            -0.5        4.27        perf-profile.children.cycles-pp.hrtimer_wakeup
      7.50            -0.4        7.08        perf-profile.children.cycles-pp.try_to_wake_up
      2.49            -0.3        2.16        perf-profile.children.cycles-pp.stress_signal_ignore_handler
      1.05 ±  2%      -0.3        0.73 ±  2%  perf-profile.children.cycles-pp.signal_setup_done
      2.61            -0.3        2.30        perf-profile.children.cycles-pp.select_idle_sibling
      2.04            -0.3        1.72        perf-profile.children.cycles-pp.select_idle_cpu
      1.82            -0.3        1.52        perf-profile.children.cycles-pp.select_idle_core
      3.32            -0.3        3.06        perf-profile.children.cycles-pp.select_task_rq
      1.03            -0.2        0.79 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irq
      0.76 ±  2%      -0.2        0.60 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      1.16            -0.1        1.02        perf-profile.children.cycles-pp.finish_task_switch
      0.43            -0.1        0.28        perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      9.28            -0.1        9.15        perf-profile.children.cycles-pp.schedule
      3.54            -0.1        3.42        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      2.53            -0.1        2.41        perf-profile.children.cycles-pp.dequeue_entities
      2.68            -0.1        2.57        perf-profile.children.cycles-pp.try_to_block_task
      2.60            -0.1        2.50        perf-profile.children.cycles-pp.dequeue_task_fair
      0.40            -0.1        0.30        perf-profile.children.cycles-pp.irqentry_exit
      2.24            -0.1        2.16        perf-profile.children.cycles-pp.__x64_sys_sched_yield
      0.38            -0.1        0.30        perf-profile.children.cycles-pp.clockevents_program_event
      0.15 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.hrtimer_reprogram
      2.12            -0.1        2.04        perf-profile.children.cycles-pp.dequeue_entity
      3.17            -0.1        3.10        perf-profile.children.cycles-pp.__sched_yield
      0.47            -0.1        0.40        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.93            -0.1        0.88        perf-profile.children.cycles-pp.native_irq_return_iret
      0.37            -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.33            -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.44            -0.0        0.40        perf-profile.children.cycles-pp.do_sched_yield
      0.20 ±  2%      -0.0        0.17 ±  7%  perf-profile.children.cycles-pp.shim_nanosleep_uint64
      0.62            -0.0        0.58        perf-profile.children.cycles-pp.set_task_cpu
      0.24 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.__hrtimer_rearm_deferred
      0.25            -0.0        0.21 ±  2%  perf-profile.children.cycles-pp._find_next_bit
      0.22 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.46            -0.0        0.43        perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.11 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.x2apic_send_IPI
      0.06            -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.ktime_expiry_to_cycles
      0.12 ±  3%      -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.put_prev_entity
      0.18 ±  2%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.set_current_blocked
      0.08 ±  4%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.kick_process
      0.13 ±  2%      -0.0        0.11        perf-profile.children.cycles-pp.set_next_task_idle
      0.23            -0.0        0.21        perf-profile.children.cycles-pp.remove_entity_load_avg
      0.54            -0.0        0.52        perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.09 ±  8%      -0.0        0.07        perf-profile.children.cycles-pp.__update_idle_core
      0.28            -0.0        0.26        perf-profile.children.cycles-pp.perf_tp_event
      0.13 ±  2%      -0.0        0.12        perf-profile.children.cycles-pp.irqtime_account_irq
      0.10            -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.yield_task_fair
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.put_prev_task_fair
      0.14            -0.0        0.13        perf-profile.children.cycles-pp.enqueue_hrtimer
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.rb_insert_color
      0.13            +0.0        0.14        perf-profile.children.cycles-pp.handle_softirqs
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.sigemptyset
      0.31            +0.0        0.32        perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.07            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.06 ±  7%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.58            +0.0        0.60        perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.35            +0.0        0.36        perf-profile.children.cycles-pp.recalc_sigpending
      0.23            +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.15 ±  2%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.ct_idle_exit
      0.20 ±  2%      +0.0        0.21 ±  2%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.sigaddset
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.task_h_load
      0.31            +0.0        0.33        perf-profile.children.cycles-pp.wake_affine
      0.14 ±  3%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.48            +0.0        0.50        perf-profile.children.cycles-pp.select_task_rq_fair
      0.19            +0.0        0.21 ±  2%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.14            +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__hrtimer_setup
      0.89            +0.0        0.92        perf-profile.children.cycles-pp.geteuid
      0.78            +0.0        0.80        perf-profile.children.cycles-pp.sched_clock_cpu
      0.06            +0.0        0.09        perf-profile.children.cycles-pp.sigprocmask
      0.17 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.hrtimer_setup_sleeper_on_stack
      0.06            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.ns_to_timespec64
      0.14 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.put_timespec64
      0.12 ±  4%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.update_other_load_avgs
      0.15 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.nanosleep_copyout
      0.02 ±141%      +0.0        0.06 ±  8%  perf-profile.children.cycles-pp.sched_yield@plt
      0.12            +0.0        0.16 ±  5%  perf-profile.children.cycles-pp._copy_to_user
      0.26 ±  2%      +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      0.01 ±223%      +0.0        0.06 ± 13%  perf-profile.children.cycles-pp.clock_nanosleep
      0.06            +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.arch_scale_cpu_capacity
      0.92            +0.1        0.97        perf-profile.children.cycles-pp.hrtimer_active
      0.71            +0.1        0.77        perf-profile.children.cycles-pp.queue_event
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__hrtimer_cb_get_time
      0.71            +0.1        0.76        perf-profile.children.cycles-pp.ordered_events__queue
      0.72            +0.1        0.78        perf-profile.children.cycles-pp.process_simple
      0.72            +0.1        0.78        perf-profile.children.cycles-pp.stress_alarm
      0.73            +0.1        0.79        perf-profile.children.cycles-pp.perf_session__process_events
      0.73            +0.1        0.79        perf-profile.children.cycles-pp.reader__read_event
      0.01 ±223%      +0.1        0.08        perf-profile.children.cycles-pp.__get_next_timer_interrupt
      0.08 ±  4%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.24 ±  5%      +0.1        0.31 ±  2%  perf-profile.children.cycles-pp.__sched_balance_update_blocked_averages
      0.22 ±  2%      +0.1        0.29        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.37 ±  2%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.get_timespec64
      0.43 ±  3%      +0.1        0.52 ±  2%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.44 ±  4%      +0.1        0.54 ±  3%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.45 ±  3%      +0.1        0.54 ±  2%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.30 ±  2%      +0.1        0.39        perf-profile.children.cycles-pp.prandom_u32_state
      0.50 ±  4%      +0.1        0.61 ±  3%  perf-profile.children.cycles-pp.sched_balance_rq
      0.49            +0.1        0.59        perf-profile.children.cycles-pp.timerqueue_linked_add
      0.43            +0.1        0.54        perf-profile.children.cycles-pp.rb_erase
      1.56            +0.1        1.68        perf-profile.children.cycles-pp.__x64_sys_rt_sigprocmask
      0.50            +0.1        0.62        perf-profile.children.cycles-pp.rb_erase_linked
      0.31            +0.1        0.43        perf-profile.children.cycles-pp.stress_alarm_stress_bogo_inc
      0.33            +0.1        0.47        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.65            +0.2        0.82        perf-profile.children.cycles-pp.__remove_hrtimer
      0.67 ± 38%      +0.2        0.85        perf-profile.children.cycles-pp.cmd_record
      3.00            +0.2        3.18        perf-profile.children.cycles-pp.__pick_next_task
      0.61 ± 44%      +0.2        0.79        perf-profile.children.cycles-pp.record__finish_output
      0.94            +0.2        1.16        perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      2.60            +0.2        2.83        perf-profile.children.cycles-pp.pick_next_task_fair
      1.09 ±  3%      +0.2        1.33        perf-profile.children.cycles-pp.sched_balance_newidle
      0.74 ±  2%      +0.3        1.01 ±  2%  perf-profile.children.cycles-pp._copy_from_user
      1.14            +0.3        1.45        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.81            +0.4        1.16        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.85            +0.4        1.22        perf-profile.children.cycles-pp.__hrtimer_get_remaining
      0.94            +0.4        1.32        perf-profile.children.cycles-pp.ktime_get
     12.26            +0.4       12.65        perf-profile.children.cycles-pp.intel_idle
     10.81            +0.5       11.34        perf-profile.children.cycles-pp.do_nanosleep
     11.24            +0.6       11.81        perf-profile.children.cycles-pp.common_nsleep
      3.60            +0.6        4.18        perf-profile.children.cycles-pp.pthread_sigmask
      1.47            +0.6        2.05        perf-profile.children.cycles-pp.entry_SYSCALL_64
     11.16            +0.6       11.75        perf-profile.children.cycles-pp.hrtimer_nanosleep
     11.89            +0.7       12.55        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      3.30            +0.8        4.05        perf-profile.children.cycles-pp.do_setitimer
      3.92 ±  3%      +0.8        4.70 ±  2%  perf-profile.children.cycles-pp.poll_idle
      3.35            +0.8        4.13        perf-profile.children.cycles-pp.__x64_sys_alarm
     21.70            +1.0       22.72        perf-profile.children.cycles-pp.cpuidle_enter_state
     21.73            +1.0       22.76        perf-profile.children.cycles-pp.cpuidle_enter
      5.24            +1.1        6.31        perf-profile.children.cycles-pp.alarm
     22.97            +1.1       24.04        perf-profile.children.cycles-pp.cpuidle_idle_call
     31.20            +1.2       32.37        perf-profile.children.cycles-pp.start_secondary
     31.32            +1.2       32.50        perf-profile.children.cycles-pp.common_startup_64
     31.32            +1.2       32.50        perf-profile.children.cycles-pp.cpu_startup_entry
     31.21            +1.2       32.40        perf-profile.children.cycles-pp.do_idle
      0.00            +1.8        1.77        perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      0.00            +1.8        1.80        perf-profile.children.cycles-pp.hrtimer_sleeper_start_expires
      3.12 ±  8%      -1.1        2.02 ±  2%  perf-profile.self.cycles-pp.inc_rlimit_get_ucounts
      3.27 ±  8%      -1.1        2.18 ±  2%  perf-profile.self.cycles-pp.dec_rlimit_put_ucounts
      3.01 ±  3%      -1.0        1.98 ±  3%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      3.34 ±  6%      -0.4        2.96 ±  5%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      1.54            -0.3        1.27        perf-profile.self.cycles-pp.select_idle_core
      1.64 ±  6%      -0.2        1.40 ±  5%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.17 ±  2%      -0.1        0.05        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.14 ±  3%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.hrtimer_reprogram
      0.33            -0.1        0.26        perf-profile.self.cycles-pp.clockevents_program_event
      0.93            -0.1        0.88        perf-profile.self.cycles-pp.native_irq_return_iret
      0.52            -0.0        0.48        perf-profile.self.cycles-pp.dequeue_entity
      0.41            -0.0        0.37        perf-profile.self.cycles-pp.dequeue_entities
      0.22 ±  2%      -0.0        0.19 ±  3%  perf-profile.self.cycles-pp._find_next_bit
      0.22            -0.0        0.19        perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.66 ±  2%      -0.0        0.63        perf-profile.self.cycles-pp.cpuidle_enter_state
      0.14 ±  2%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.12            -0.0        0.09        perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.11 ±  4%      -0.0        0.08        perf-profile.self.cycles-pp.x2apic_send_IPI
      0.31            -0.0        0.28        perf-profile.self.cycles-pp._raw_spin_unlock_irq
      0.48            -0.0        0.45        perf-profile.self.cycles-pp.finish_task_switch
      0.19            -0.0        0.17        perf-profile.self.cycles-pp.prepare_task_switch
      0.08 ±  9%      -0.0        0.06        perf-profile.self.cycles-pp.__update_idle_core
      0.21            -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.try_to_wake_up
      0.12 ±  4%      -0.0        0.10        perf-profile.self.cycles-pp.__bitmap_andnot
      0.24            -0.0        0.23        perf-profile.self.cycles-pp.complete_signal
      0.08 ±  6%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.common_nsleep
      0.50            -0.0        0.49        perf-profile.self.cycles-pp.menu_select
      0.24 ±  2%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.prepare_signal
      0.11            -0.0        0.10        perf-profile.self.cycles-pp.__send_signal_locked
      0.09 ±  5%      +0.0        0.10        perf-profile.self.cycles-pp.get_timespec64
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.get_signal
      0.06 ±  7%      +0.0        0.08        perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.21            +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.31            +0.0        0.33        perf-profile.self.cycles-pp.check_kill_permission
      0.26            +0.0        0.28        perf-profile.self.cycles-pp.task_h_load
      0.19            +0.0        0.21        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.06 ±  6%      +0.0        0.08        perf-profile.self.cycles-pp.rb_erase_linked
      0.24 ±  2%      +0.0        0.25        perf-profile.self.cycles-pp.sched_balance_newidle
      0.05            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.__x64_sys_alarm
      0.08            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.36            +0.0        0.38 ±  2%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.70            +0.0        0.72        perf-profile.self.cycles-pp.native_sched_clock
      0.08 ±  4%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__sched_balance_update_blocked_averages
      0.17 ±  3%      +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.stress_mwc32
      0.33            +0.0        0.36        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.13            +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__hrtimer_setup
      0.12 ±  3%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp._copy_to_user
      0.23            +0.0        0.27        perf-profile.self.cycles-pp.select_task_rq
      0.14 ±  2%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.__hrtimer_get_remaining
      0.08 ±  5%      +0.0        0.12        perf-profile.self.cycles-pp.hrtimer_try_to_cancel
      0.22 ±  2%      +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.x64_sys_call
      0.03 ± 70%      +0.0        0.08        perf-profile.self.cycles-pp.ns_to_timespec64
      0.15            +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.26 ±  4%      +0.0        0.31 ±  4%  perf-profile.self.cycles-pp.__x64_sys_rt_sigprocmask
      0.85            +0.0        0.90        perf-profile.self.cycles-pp.hrtimer_active
      0.70            +0.1        0.76        perf-profile.self.cycles-pp.queue_event
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.sigprocmask
      0.38            +0.1        0.44        perf-profile.self.cycles-pp.do_nanosleep
      0.63            +0.1        0.70        perf-profile.self.cycles-pp.stress_alarm
      0.24            +0.1        0.31        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.21 ±  2%      +0.1        0.29 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.86 ±  2%      +0.1        0.94        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.38 ±  4%      +0.1        0.46 ±  3%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.22            +0.1        0.30        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.26            +0.1        0.36 ±  2%  perf-profile.self.cycles-pp.prandom_u32_state
      0.38 ±  2%      +0.1        0.47        perf-profile.self.cycles-pp.timerqueue_linked_add
      0.17 ±  2%      +0.1        0.26        perf-profile.self.cycles-pp.do_setitimer
      0.26            +0.1        0.37 ±  2%  perf-profile.self.cycles-pp.stress_alarm_stress_bogo_inc
      0.42            +0.1        0.53        perf-profile.self.cycles-pp.rb_erase
      0.28            +0.1        0.39        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.46 ±  2%      +0.2        0.64        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.03            +0.2        1.22        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.28            +0.2        0.48        perf-profile.self.cycles-pp.alarm
      0.76            +0.2        0.96        perf-profile.self.cycles-pp.do_syscall_64
      2.31            +0.2        2.52        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.39 ±  2%      +0.3        0.65        perf-profile.self.cycles-pp.pthread_sigmask
      0.71 ±  2%      +0.3        0.98 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      0.00            +0.3        0.29        perf-profile.self.cycles-pp.hrtimer_start_range_ns_user
      0.79            +0.3        1.13        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.92            +0.4        1.30        perf-profile.self.cycles-pp.ktime_get
     12.26            +0.4       12.65        perf-profile.self.cycles-pp.intel_idle
      3.69 ±  3%      +0.7        4.36 ±  2%  perf-profile.self.cycles-pp.poll_idle



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/poll/stress-ng/60s

commit: 
  bd5956166d ("hrtimer: Provide hrtimer_start_range_ns_user()")
  b40c927345 ("hrtimer: Use hrtimer_start_expires_user() for hrtimer sleepers")

bd5956166d20adbd b40c927345a91e687eac4c3c5ca 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 8.605e+08          +554.0%  5.628e+09        stress-ng.poll.ops
  14354753          +553.9%   93867002        stress-ng.poll.ops_per_sec
     15084 ±  2%   +1793.2%     285581        stress-ng.time.involuntary_context_switches
     33537 ±  2%      +7.4%      36035        stress-ng.time.minor_page_faults
      2610          +545.8%      16857        stress-ng.time.percent_of_cpu_this_job_got
      1213          +579.0%       8241        stress-ng.time.system_time
    355.33          +432.2%       1891        stress-ng.time.user_time
 2.153e+08           -94.3%   12293943        stress-ng.time.voluntary_context_switches
     68278           -11.8%      60233        uptime.idle
 9.892e+09           -84.4%  1.541e+09        cpuidle..time
  2.14e+08           -96.3%    7941686        cpuidle..usage
    330173 ±  9%     +65.2%     545286 ± 16%  numa-numastat.node0.numa_hit
   4318680 ±  7%     -84.7%     659263 ± 17%  numa-numastat.node1.local_node
   4423570 ±  6%     -83.8%     715223 ± 12%  numa-numastat.node1.numa_hit
      5487 ±  8%   +1331.0%      78517        perf-c2c.HITM.local
    563.33 ±  6%     +34.0%     754.67 ± 12%  perf-c2c.HITM.remote
      6050 ±  7%   +1210.2%      79272        perf-c2c.HITM.total
     86.77           -62.2       24.53        mpstat.cpu.all.idle%
      1.83            -0.3        1.56        mpstat.cpu.all.irq%
      0.03 ±  7%      +0.1        0.15 ±  2%  mpstat.cpu.all.soft%
      8.30 ±  6%     +45.9       54.24        mpstat.cpu.all.sys%
      3.07 ±  4%     +16.5       19.52        mpstat.cpu.all.usr%
     26.23          +207.5%      80.65        mpstat.max_utilization_pct
     87.13           -69.9%      26.20 ±  2%  vmstat.cpu.id
      9.92 ±  6%    +451.9%      54.73        vmstat.cpu.sy
      3.01 ±  4%    +532.4%      19.03        vmstat.cpu.us
  14998366 ±  5%     -65.8%    5134634        vmstat.memory.cache
     30.79 ±  5%    +687.9%     242.64        vmstat.procs.r
   6770551           -95.4%     314134        vmstat.system.cs
   3544136           -87.3%     451535        vmstat.system.in
  11707971 ±  7%     -83.3%    1952385        meminfo.Active
  11707954 ±  7%     -83.3%    1952369        meminfo.Active(anon)
  14723940 ±  5%     -66.2%    4975624        meminfo.Cached
  14665097 ±  5%     -66.5%    4910724        meminfo.Committed_AS
    160975           -14.0%     138477        meminfo.KReclaimable
    664807 ±  7%     -22.5%     515108 ±  2%  meminfo.Mapped
  18974070 ±  4%     -51.5%    9197786        meminfo.Memused
    160975           -14.0%     138477        meminfo.SReclaimable
  10923834 ±  7%     -89.2%    1175549        meminfo.Shmem
  19019151 ±  4%     -51.4%    9240108        meminfo.max_used_kB
    180854 ± 77%    +300.6%     724555 ± 25%  numa-meminfo.node0.Active
    180847 ± 77%    +300.6%     724543 ± 25%  numa-meminfo.node0.Active(anon)
     16306 ± 83%   +2440.7%     414306 ± 45%  numa-meminfo.node0.Shmem
  11533032 ±  7%     -89.3%    1229018 ± 15%  numa-meminfo.node1.Active
  11533023 ±  7%     -89.3%    1229014 ± 15%  numa-meminfo.node1.Active(anon)
  11600274 ± 14%     -72.5%    3188067 ± 42%  numa-meminfo.node1.FilePages
    592229 ± 10%     -39.0%     360969 ± 27%  numa-meminfo.node1.Mapped
 1.141e+08            +7.5%  1.226e+08        numa-meminfo.node1.MemFree
  13831741 ± 11%     -61.6%    5314094 ± 26%  numa-meminfo.node1.MemUsed
  10913073 ±  7%     -93.0%     762015 ± 25%  numa-meminfo.node1.Shmem
      2035           +35.7%       2761        turbostat.Avg_MHz
     63.72           +22.5       86.26        turbostat.Busy%
     37.30           -23.3       13.99        turbostat.C1%
     36.03           -62.5%      13.52        turbostat.CPU%c1
      0.41          +191.1%       1.20        turbostat.IPC
  2.25e+08           -87.3%   28623204        turbostat.IRQ
   6108471           +26.9%    7748858        turbostat.NMI
     45.75           -45.8        0.00 ±223%  turbostat.POLL%
    269.45           +27.1%     342.43        turbostat.PkgWatt
     15.32            -1.7%      15.06        turbostat.RAMWatt
      0.02           +58.3%       0.03 ± 11%  turbostat.SysWatt
     45224 ± 77%    +300.7%     181196 ± 25%  numa-vmstat.node0.nr_active_anon
      4082 ± 83%   +2438.6%     103638 ± 45%  numa-vmstat.node0.nr_shmem
     45224 ± 77%    +300.7%     181196 ± 25%  numa-vmstat.node0.nr_zone_active_anon
    330762 ±  9%     +65.0%     545680 ± 16%  numa-vmstat.node0.numa_hit
   2883708 ±  7%     -89.3%     307453 ± 15%  numa-vmstat.node1.nr_active_anon
   2900507 ± 14%     -72.5%     797208 ± 42%  numa-vmstat.node1.nr_file_pages
  28527732            +7.5%   30657373        numa-vmstat.node1.nr_free_pages
  28499307            +7.5%   30636438        numa-vmstat.node1.nr_free_pages_blocks
    148183 ± 10%     -39.0%      90412 ± 27%  numa-vmstat.node1.nr_mapped
   2728708 ±  7%     -93.0%     190695 ± 25%  numa-vmstat.node1.nr_shmem
   2883702 ±  7%     -89.3%     307452 ± 15%  numa-vmstat.node1.nr_zone_active_anon
   4423735 ±  6%     -83.8%     715492 ± 12%  numa-vmstat.node1.numa_hit
   4318759 ±  7%     -84.7%     659503 ± 17%  numa-vmstat.node1.numa_local
   2927327 ±  7%     -83.3%     488222        proc-vmstat.nr_active_anon
   5979187            +4.1%    6223258        proc-vmstat.nr_dirty_background_threshold
  11972995            +4.1%   12461733        proc-vmstat.nr_dirty_threshold
   3681321 ±  5%     -66.2%    1244010        proc-vmstat.nr_file_pages
  60162089            +4.1%   62606375        proc-vmstat.nr_free_pages
  60074973            +4.1%   62548866        proc-vmstat.nr_free_pages_blocks
    166286 ±  7%     -22.5%     128944 ±  2%  proc-vmstat.nr_mapped
   2731294 ±  7%     -89.2%     293990        proc-vmstat.nr_shmem
     40244           -14.0%      34621        proc-vmstat.nr_slab_reclaimable
   2927327 ±  7%     -83.3%     488222        proc-vmstat.nr_zone_active_anon
   4757860 ±  6%     -73.4%    1265604        proc-vmstat.numa_hit
   4557950 ±  6%     -76.6%    1065429        proc-vmstat.numa_local
      2960 ± 10%     -18.3%       2418 ±  9%  proc-vmstat.numa_pages_migrated
   4816104 ±  6%     -72.7%    1316651        proc-vmstat.pgalloc_normal
      2960 ± 10%     -18.3%       2418 ±  9%  proc-vmstat.pgmigrate_success
      0.11 ±  4%     -83.1%       0.02 ±  8%  perf-stat.i.MPKI
  3.51e+10          +255.0%  1.246e+11        perf-stat.i.branch-instructions
      0.22 ±  3%      -0.2        0.05 ±  2%  perf-stat.i.branch-miss-rate%
  76027018 ±  3%     -13.7%   65613160 ±  2%  perf-stat.i.branch-misses
     12.93 ±  2%      -8.9        4.01 ±  9%  perf-stat.i.cache-miss-rate%
  21772292 ±  5%     -56.2%    9527948 ± 10%  perf-stat.i.cache-misses
 1.232e+08          +106.4%  2.543e+08        perf-stat.i.cache-references
   7037595           -95.4%     325592        perf-stat.i.context-switches
      2.45           -66.2%       0.83        perf-stat.i.cpi
 4.015e+11           +35.4%  5.434e+11        perf-stat.i.cpu-cycles
    343311           -86.2%      47298        perf-stat.i.cpu-migrations
     52414 ±  3%     +29.0%      67608 ± 12%  perf-stat.i.cycles-between-cache-misses
 1.668e+11          +293.6%  6.563e+11        perf-stat.i.instructions
      0.42          +186.0%       1.21        perf-stat.i.ipc
     38.43           -95.6%       1.69        perf-stat.i.metric.K/sec
      0.12 ±  5%     -88.4%       0.01 ± 10%  perf-stat.overall.MPKI
      0.22 ±  3%      -0.2        0.05 ±  2%  perf-stat.overall.branch-miss-rate%
     16.28 ±  3%     -12.6        3.72 ± 10%  perf-stat.overall.cache-miss-rate%
      2.42           -65.8%       0.83        perf-stat.overall.cpi
     19560 ±  5%    +196.5%      58002 ± 10%  perf-stat.overall.cycles-between-cache-misses
      0.41          +192.0%       1.21        perf-stat.overall.ipc
  3.38e+10          +257.1%  1.207e+11        perf-stat.ps.branch-instructions
  74487405 ±  3%     -13.1%   64724310 ±  2%  perf-stat.ps.branch-misses
  19931724 ±  5%     -53.9%    9185888 ± 10%  perf-stat.ps.cache-misses
 1.224e+08          +101.9%   2.47e+08        perf-stat.ps.cache-references
   6822887           -95.4%     315645        perf-stat.ps.context-switches
 3.888e+11           +35.6%  5.271e+11        perf-stat.ps.cpu-cycles
    340809           -86.5%      45889        perf-stat.ps.cpu-migrations
 1.606e+11          +295.8%  6.357e+11        perf-stat.ps.instructions
 9.545e+12          +297.6%  3.795e+13        perf-stat.total.instructions
      7186 ±  2%    +245.7%      24846        sched_debug.cfs_rq:/.avg_vruntime.avg
     39584 ±  8%     +17.3%      46445 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.max
      4450 ±  5%    +313.8%      18416 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.min
      4433 ±  4%     -12.1%       3895 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.14 ±  9%    +396.2%       0.69        sched_debug.cfs_rq:/.h_nr_queued.avg
      1.58 ± 11%     +57.9%       2.50 ± 11%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.33 ±  5%     +45.5%       0.48 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.14 ± 10%    +399.4%       0.68 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.25 ± 30%    +100.0%       2.50 ± 11%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.32 ±  6%     +47.6%       0.47 ±  4%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    271.30 ± 24%   +3177.6%       8892 ±  5%  sched_debug.cfs_rq:/.left_deadline.avg
     12454 ± 18%    +173.4%      34045 ±  7%  sched_debug.cfs_rq:/.left_deadline.max
      1417 ± 14%    +712.6%      11521        sched_debug.cfs_rq:/.left_deadline.stddev
    271.12 ± 24%   +3179.6%       8891 ±  5%  sched_debug.cfs_rq:/.left_vruntime.avg
     12431 ± 18%    +173.9%      34043 ±  7%  sched_debug.cfs_rq:/.left_vruntime.max
      1415 ± 14%    +713.6%      11520        sched_debug.cfs_rq:/.left_vruntime.stddev
    111761 ±  8%    +520.3%     693214 ±  2%  sched_debug.cfs_rq:/.load.avg
   1162733 ± 39%     +81.7%    2112854 ± 14%  sched_debug.cfs_rq:/.load.max
    227916 ±  9%     +73.4%     395250 ±  5%  sched_debug.cfs_rq:/.load.stddev
    705.35 ± 35%    +116.7%       1528 ± 27%  sched_debug.cfs_rq:/.load_avg.avg
      0.14 ± 11%    +398.7%       0.69        sched_debug.cfs_rq:/.nr_queued.avg
      0.33 ±  7%     +44.4%       0.48 ±  4%  sched_debug.cfs_rq:/.nr_queued.stddev
      9.13 ± 38%     +67.0%      15.25 ± 21%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    311.50          +109.3%     652.08 ± 24%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     47.80 ± 18%     +71.1%      81.81 ± 13%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    311.50           +75.9%     548.00 ± 16%  sched_debug.cfs_rq:/.removed.util_avg.max
     47.48 ± 18%     +54.2%      73.20 ± 10%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    271.12 ± 24%   +3179.6%       8891 ±  5%  sched_debug.cfs_rq:/.right_vruntime.avg
     12431 ± 18%    +173.9%      34043 ±  7%  sched_debug.cfs_rq:/.right_vruntime.max
      1415 ± 14%    +713.6%      11520        sched_debug.cfs_rq:/.right_vruntime.stddev
    150.19 ±  5%    +401.0%     752.54 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
      1046 ± 27%    +120.6%       2309 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
    164.63 ±  8%    +155.5%     420.56 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
 8.843e+08 ±155%   +2618.5%  2.404e+10 ± 14%  sched_debug.cfs_rq:/.sum_w_vruntime.avg
 1.221e+10 ±155%    +551.3%  7.951e+10 ± 21%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
     19872 ± 22%   +1033.4%     225245 ±  7%  sched_debug.cfs_rq:/.sum_weight.avg
    626329 ± 31%    +137.4%    1486751 ± 13%  sched_debug.cfs_rq:/.sum_weight.max
    100556 ± 12%    +215.1%     316833 ±  5%  sched_debug.cfs_rq:/.sum_weight.stddev
    146.40 ±  5%    +269.2%     540.46 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
    960.17 ± 10%     +70.4%       1635 ±  5%  sched_debug.cfs_rq:/.util_avg.max
    150.91 ±  6%     +98.6%     299.69 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
     13.45 ± 17%   +3857.6%     532.24 ±  2%  sched_debug.cfs_rq:/.util_est.avg
    724.75 ± 12%    +168.5%       1945 ±  8%  sched_debug.cfs_rq:/.util_est.max
     61.64 ± 14%    +446.0%     336.58 ±  4%  sched_debug.cfs_rq:/.util_est.stddev
      7186 ±  2%    +245.7%      24846        sched_debug.cfs_rq:/.zero_vruntime.avg
     39583 ±  8%     +17.3%      46445 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.max
      4450 ±  5%    +313.8%      18416 ± 12%  sched_debug.cfs_rq:/.zero_vruntime.min
      4433 ±  4%     -12.1%       3895 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    473353           +15.8%     548318        sched_debug.cpu.avg_idle.avg
    575351 ±  9%     +73.4%     997457        sched_debug.cpu.avg_idle.max
    100100 ± 10%     +99.6%     199753 ±  6%  sched_debug.cpu.avg_idle.stddev
     11.73 ±  4%     +50.3%      17.64 ±  9%  sched_debug.cpu.clock.stddev
      1078 ±  8%    +293.6%       4246 ±  2%  sched_debug.cpu.curr->pid.avg
      2578 ±  6%     -22.0%       2009 ±  9%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 15%     +32.1%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
      0.13 ±  8%    +416.5%       0.69 ±  2%  sched_debug.cpu.nr_running.avg
      0.33 ±  6%     +42.1%       0.47 ±  5%  sched_debug.cpu.nr_running.stddev
   1101707           -95.2%      52459        sched_debug.cpu.nr_switches.avg
   1155764 ±  2%     -92.6%      84975 ± 12%  sched_debug.cpu.nr_switches.max
    432615 ±  7%     -91.8%      35542 ± 10%  sched_debug.cpu.nr_switches.min
     63902 ±  2%     -93.4%       4240 ± 14%  sched_debug.cpu.nr_switches.stddev
     78.19           -77.5        0.74        perf-profile.calltrace.cycles-pp.common_startup_64
     77.79           -77.1        0.73        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     77.78           -77.0        0.73        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     77.76           -77.0        0.73        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     76.81           -76.2        0.66        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     76.34           -75.7        0.62        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     76.34           -75.7        0.62        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     73.85           -73.8        0.00        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.07 ± 12%      -1.5        0.55        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      2.03            -1.4        0.61        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.02            -1.4        0.61        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.01            -1.4        0.61        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.79            -1.0        0.84        perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.76            -0.9        0.84        perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.44            -0.9        0.57        perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.13 ±  2%      -0.7        0.42 ± 44%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      2.20            -0.2        2.00        perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.75 ±  2%      -0.1        0.60        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.66            -0.1        0.54        perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__pick_next_task.__schedule.schedule
      0.68 ±  2%      -0.1        0.59        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.do_nanosleep
      2.32            +0.1        2.40        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.32            +0.1        2.42        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.48            +0.4        2.89        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.mutex_spin_on_owner.__mutex_lock.anon_pipe_read.vfs_read.ksys_read
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.anon_pipe_write.vfs_write.ksys_write
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_poll.stress_run
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.set_user_sigmask.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.poll_freewait.do_sys_poll.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.stress_poll.stress_run
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.__mutex_lock.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.6        0.65        perf-profile.calltrace.cycles-pp.poll_freewait.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.66        perf-profile.calltrace.cycles-pp.__mutex_lock.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.7        0.67        perf-profile.calltrace.cycles-pp.pipe_poll.do_poll.do_sys_poll.__x64_sys_ppoll.do_syscall_64
      0.00            +0.7        0.67        perf-profile.calltrace.cycles-pp._copy_from_user.set_user_sigmask.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.68        perf-profile.calltrace.cycles-pp._copy_from_user.__do_sys_prlimit64.do_syscall_64.entry_SYSCALL_64_after_hwframe.setrlimit64
      0.00            +0.7        0.70 ±  5%  perf-profile.calltrace.cycles-pp.pipe_read.stress_poll.stress_run
      0.00            +0.7        0.73 ±  2%  perf-profile.calltrace.cycles-pp.pipe_poll.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp.poll_select_finish.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.8        0.81        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +0.8        0.82        perf-profile.calltrace.cycles-pp.__do_sys_prlimit64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__getrlimit.stress_run
      0.00            +0.9        0.90 ± 27%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.poll_freewait.do_select.core_sys_select
      0.00            +0.9        0.91        perf-profile.calltrace.cycles-pp.poll_select_finish.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +0.9        0.92        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.stress_run
      0.00            +0.9        0.92        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +0.9        0.94        perf-profile.calltrace.cycles-pp.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +1.0        0.98        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__getrlimit.stress_run
      0.00            +1.0        1.01        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.stress_poll.stress_run
      0.00            +1.0        1.02        perf-profile.calltrace.cycles-pp._copy_from_user.get_timespec64.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        1.04        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__getrlimit.stress_run
      0.00            +1.1        1.11        perf-profile.calltrace.cycles-pp.poll_select_finish.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +1.1        1.14        perf-profile.calltrace.cycles-pp.set_user_sigmask.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +1.2        1.17        perf-profile.calltrace.cycles-pp.get_timespec64.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +1.2        1.17        perf-profile.calltrace.cycles-pp.remove_wait_queue.poll_freewait.do_select.core_sys_select.__x64_sys_pselect6
      0.00            +1.3        1.28        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_sync_key.anon_pipe_write.vfs_write.ksys_write
      0.00            +1.3        1.29        perf-profile.calltrace.cycles-pp.__pi_memset.core_sys_select.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.3        1.32        perf-profile.calltrace.cycles-pp.mutex_unlock.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +1.4        1.36        perf-profile.calltrace.cycles-pp.do_poll.do_sys_poll.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.4        1.43        perf-profile.calltrace.cycles-pp.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.5        1.50        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.stress_run
      0.00            +1.5        1.55        perf-profile.calltrace.cycles-pp.__do_sys_prlimit64.do_syscall_64.entry_SYSCALL_64_after_hwframe.setrlimit64.stress_run
      0.00            +1.6        1.56        perf-profile.calltrace.cycles-pp.mutex_unlock.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +1.6        1.65        perf-profile.calltrace.cycles-pp.poll_freewait.do_select.core_sys_select.__x64_sys_pselect6.do_syscall_64
      0.00            +1.9        1.86        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.setrlimit64.stress_run
      0.00            +1.9        1.94        perf-profile.calltrace.cycles-pp.__wake_up_sync_key.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +2.0        1.98        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.setrlimit64.stress_run
      0.00            +2.0        2.03 ±  3%  perf-profile.calltrace.cycles-pp.pipe_poll.do_select.core_sys_select.__x64_sys_pselect6.do_syscall_64
      0.00            +2.1        2.11        perf-profile.calltrace.cycles-pp.__getrlimit.stress_run
      0.69            +2.2        2.88        perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +2.4        2.42        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_poll.stress_run
      0.84            +2.5        3.32        perf-profile.calltrace.cycles-pp.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +2.7        2.75        perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.76            +3.2        4.01        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.anon_pipe_write.vfs_write.ksys_write
      0.81            +3.4        4.17        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_run
      0.72            +3.5        4.19        perf-profile.calltrace.cycles-pp.setrlimit64.stress_run
      0.82            +3.5        4.32        perf-profile.calltrace.cycles-pp.copy_page_from_iter.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      1.03 ± 23%      +3.6        4.66        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.anon_pipe_read.vfs_read.ksys_read
      0.77            +3.6        4.40        perf-profile.calltrace.cycles-pp.core_sys_select.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +3.7        3.66        perf-profile.calltrace.cycles-pp.mutex_lock.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.84            +3.7        4.56        perf-profile.calltrace.cycles-pp.core_sys_select.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.09 ± 22%      +3.9        5.00        perf-profile.calltrace.cycles-pp.copy_page_to_iter.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +4.1        4.14        perf-profile.calltrace.cycles-pp.mutex_lock.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      1.28            +4.9        6.18        perf-profile.calltrace.cycles-pp.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.52            +5.2        5.76        perf-profile.calltrace.cycles-pp.do_select.core_sys_select.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.10            +5.3        9.44        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.33            +5.4        6.71        perf-profile.calltrace.cycles-pp.__x64_sys_ppoll.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      4.13            +5.4        9.57        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.33            +5.6        6.98        perf-profile.calltrace.cycles-pp.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      1.99 ± 12%     +11.2       13.21        perf-profile.calltrace.cycles-pp.anon_pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.40 ±  9%     +12.2       14.61        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_poll
      2.55 ±  9%     +12.8       15.34        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_poll.stress_run
      2.86 ±  8%     +14.1       16.99        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_poll.stress_run
      2.99 ±  7%     +14.6       17.60        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_poll.stress_run
      2.09           +15.0       17.13        perf-profile.calltrace.cycles-pp.anon_pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.36           +16.2       18.52        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      2.50           +16.8       19.25        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      5.68 ±  4%     +26.2       31.84        perf-profile.calltrace.cycles-pp.stress_poll.stress_run
      6.50           +32.5       39.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      6.70           +33.2       39.92        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_run
     16.38           +75.4       91.77        perf-profile.calltrace.cycles-pp.stress_run
     78.19           -77.5        0.74        perf-profile.children.cycles-pp.common_startup_64
     78.19           -77.5        0.74        perf-profile.children.cycles-pp.cpu_startup_entry
     78.17           -77.4        0.74        perf-profile.children.cycles-pp.do_idle
     77.79           -77.1        0.73        perf-profile.children.cycles-pp.start_secondary
     77.21           -76.5        0.67        perf-profile.children.cycles-pp.cpuidle_idle_call
     76.74           -76.1        0.63        perf-profile.children.cycles-pp.cpuidle_enter
     76.74           -76.1        0.63        perf-profile.children.cycles-pp.cpuidle_enter_state
     74.51           -74.5        0.00        perf-profile.children.cycles-pp.poll_idle
      3.29            -2.3        1.01        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.04            -1.4        0.62        perf-profile.children.cycles-pp.acpi_idle_enter
      2.03            -1.4        0.62        perf-profile.children.cycles-pp.acpi_idle_do_entry
      2.35            -1.4        0.94        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      2.02            -1.4        0.62        perf-profile.children.cycles-pp.acpi_safe_halt
      2.02            -1.4        0.62        perf-profile.children.cycles-pp.pv_native_safe_halt
      1.51            -1.3        0.19        perf-profile.children.cycles-pp.hrtimer_wakeup
      2.34            -1.3        1.04        perf-profile.children.cycles-pp.__schedule
      2.07            -1.2        0.84        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.51            -1.2        0.36        perf-profile.children.cycles-pp.try_to_wake_up
      1.93            -1.1        0.83        perf-profile.children.cycles-pp.hrtimer_interrupt
      1.72            -1.0        0.68        perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.80            -0.8        0.98        perf-profile.children.cycles-pp.schedule
      0.94            -0.8        0.14 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.80            -0.7        0.11        perf-profile.children.cycles-pp.enqueue_task
      0.77            -0.7        0.10        perf-profile.children.cycles-pp.enqueue_task_fair
      0.61 ±  2%      -0.6        0.05        perf-profile.children.cycles-pp.schedule_idle
      0.53 ±  4%      -0.4        0.13 ±  3%  perf-profile.children.cycles-pp.try_to_block_task
      0.52 ±  4%      -0.4        0.16 ±  3%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.40 ±  2%      -0.3        0.06        perf-profile.children.cycles-pp.enqueue_entity
      0.49 ±  4%      -0.3        0.16 ±  2%  perf-profile.children.cycles-pp.dequeue_entities
      0.57 ± 10%      -0.3        0.27 ± 19%  perf-profile.children.cycles-pp.ordered_events__queue
      0.57 ± 10%      -0.3        0.27 ± 19%  perf-profile.children.cycles-pp.queue_event
      0.58 ± 10%      -0.3        0.28 ± 19%  perf-profile.children.cycles-pp.process_simple
      0.41 ±  6%      -0.3        0.12 ±  3%  perf-profile.children.cycles-pp.dequeue_entity
      0.96 ±  2%      -0.2        0.73        perf-profile.children.cycles-pp.__pick_next_task
      2.20            -0.2        2.00        perf-profile.children.cycles-pp.do_nanosleep
      0.22 ±  2%      -0.2        0.03 ± 70%  perf-profile.children.cycles-pp.update_load_avg
      0.88 ±  2%      -0.2        0.72        perf-profile.children.cycles-pp.pick_next_task_fair
      0.22 ±  5%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.select_task_rq
      0.77 ±  5%      -0.2        0.61 ±  6%  perf-profile.children.cycles-pp.record__finish_output
      0.78 ±  4%      -0.2        0.63        perf-profile.children.cycles-pp.perf_session__process_events
      0.78 ±  4%      -0.2        0.63        perf-profile.children.cycles-pp.reader__read_event
      0.20            -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.19 ±  4%      -0.1        0.08        perf-profile.children.cycles-pp.update_curr
      0.16 ±  4%      -0.1        0.06        perf-profile.children.cycles-pp.update_se
      0.13 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.26            -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.08 ±  4%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.finish_task_switch
      0.09 ±  5%      -0.0        0.07        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.12            -0.0        0.10        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.44            +0.0        0.47        perf-profile.children.cycles-pp.update_sd_lb_stats
      0.43            +0.0        0.46        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.44            +0.0        0.48        perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.detach_tasks
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.get_jiffies_update
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.sched_balance_domains
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__set_task_blocked
      0.01 ±223%      +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.thread__find_map
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.timerqueue_linked_add
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.timespec64_add_safe
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__fdelt_chk@plt
      0.02 ± 99%      +0.1        0.09        perf-profile.children.cycles-pp.handle_softirqs
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp._find_next_and_bit
      2.35            +0.1        2.42        perf-profile.children.cycles-pp.common_nsleep
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.check_stack_object
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.write@plt
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.handle_internal_command
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.kill_fasync
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.main
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.run_builtin
      0.12 ± 24%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.add_callchain_ip
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.recalc_sigpending
      0.12 ± 26%      +0.1        0.21 ±  9%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      2.32            +0.1        2.41        perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.00            +0.1        0.10        perf-profile.children.cycles-pp._raw_spin_unlock_irq
      0.00            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.sched_tick
      0.19 ± 31%      +0.1        0.32 ± 15%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.00            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.__fdelt_warn
      0.20 ± 30%      +0.1        0.34 ± 15%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.20 ± 30%      +0.1        0.34 ± 15%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.02 ±142%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.__select
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.pselect
      0.00            +0.2        0.15 ±  4%  perf-profile.children.cycles-pp.kick_ilb
      0.00            +0.2        0.16 ±  3%  perf-profile.children.cycles-pp.osq_lock
      0.00            +0.2        0.17        perf-profile.children.cycles-pp.__check_object_size
      0.47            +0.2        0.64        perf-profile.children.cycles-pp.sched_balance_rq
      0.05 ±  7%      +0.2        0.23        perf-profile.children.cycles-pp.security_file_permission
      0.03 ±100%      +0.2        0.21 ±  6%  perf-profile.children.cycles-pp.read
      0.01 ±223%      +0.2        0.21 ±  5%  perf-profile.children.cycles-pp.ppoll
      0.00            +0.2        0.20        perf-profile.children.cycles-pp.pollwake
      0.22 ±  2%      +0.2        0.44        perf-profile.children.cycles-pp._raw_spin_lock
      0.06 ±  7%      +0.2        0.32 ±  3%  perf-profile.children.cycles-pp.write
      0.06 ±  6%      +0.3        0.32        perf-profile.children.cycles-pp.__hrtimer_setup
      0.07            +0.3        0.34        perf-profile.children.cycles-pp.hrtimer_setup_sleeper_on_stack
      0.10            +0.3        0.41        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.11            +0.3        0.44        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.11 ±  4%      +0.3        0.44        perf-profile.children.cycles-pp.update_process_times
      0.14 ±  2%      +0.3        0.48        perf-profile.children.cycles-pp.tick_nohz_handler
      0.09            +0.4        0.44        perf-profile.children.cycles-pp.__set_current_blocked
      0.13            +0.4        0.50        perf-profile.children.cycles-pp.fdget
      0.11 ±  4%      +0.4        0.48        perf-profile.children.cycles-pp.do_prlimit
      0.00            +0.4        0.38        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.19 ±  2%      +0.4        0.58        perf-profile.children.cycles-pp.ktime_get
      2.48            +0.4        2.89        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.10 ±  4%      +0.5        0.60        perf-profile.children.cycles-pp.fput
      0.18            +0.5        0.68        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.16 ±  2%      +0.5        0.67        perf-profile.children.cycles-pp.rw_verify_area
      0.04 ± 44%      +0.5        0.57        perf-profile.children.cycles-pp.__wake_up_common
      0.18 ± 11%      +0.6        0.82 ±  7%  perf-profile.children.cycles-pp.pipe_read
      0.16 ±  2%      +0.7        0.84        perf-profile.children.cycles-pp.prandom_u32_state
      0.18 ±  2%      +0.7        0.93        perf-profile.children.cycles-pp.fdget_pos
      0.19 ±  2%      +0.8        0.98 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.20 ±  2%      +0.8        1.01 ±  3%  perf-profile.children.cycles-pp.__pollwait
      0.00            +0.8        0.82        perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.22            +0.9        1.12        perf-profile.children.cycles-pp.put_timespec64
      0.18 ±  2%      +0.9        1.10        perf-profile.children.cycles-pp.add_wait_queue
      0.00            +0.9        0.93        perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      0.00            +0.9        0.94        perf-profile.children.cycles-pp.hrtimer_sleeper_start_expires
      0.26            +1.0        1.30        perf-profile.children.cycles-pp.__pi_memset
      0.27            +1.1        1.40        perf-profile.children.cycles-pp._copy_to_user
      0.05 ±  7%      +1.2        1.30        perf-profile.children.cycles-pp.__mutex_lock
      0.38            +1.3        1.63        perf-profile.children.cycles-pp.select_estimate_accuracy
      0.29 ±  4%      +1.3        1.58        perf-profile.children.cycles-pp.x64_sys_call
      0.37            +1.4        1.73        perf-profile.children.cycles-pp.set_user_sigmask
      0.40            +1.7        2.06        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.30            +1.7        2.02        perf-profile.children.cycles-pp.__wake_up_sync_key
      0.20            +1.9        2.08        perf-profile.children.cycles-pp.remove_wait_queue
      0.48 ±  2%      +1.9        2.37        perf-profile.children.cycles-pp.__do_sys_prlimit64
      0.47            +1.9        2.38        perf-profile.children.cycles-pp.get_timespec64
      0.48 ±  2%      +1.9        2.39        perf-profile.children.cycles-pp.__getrlimit
      0.67            +2.2        2.82        perf-profile.children.cycles-pp.do_poll
      0.59            +2.2        2.77        perf-profile.children.cycles-pp.poll_select_finish
      0.96            +2.4        3.39        perf-profile.children.cycles-pp.ktime_get_ts64
      0.86            +2.5        3.34        perf-profile.children.cycles-pp.__x64_sys_poll
      0.43            +2.5        2.91        perf-profile.children.cycles-pp.mutex_unlock
      0.34            +2.5        2.89        perf-profile.children.cycles-pp.poll_freewait
      0.66 ±  2%      +2.8        3.44 ±  2%  perf-profile.children.cycles-pp.pipe_poll
      0.77            +3.2        4.02        perf-profile.children.cycles-pp._copy_from_iter
      0.83 ±  2%      +3.3        4.14        perf-profile.children.cycles-pp.setrlimit64
      0.84            +3.5        4.38        perf-profile.children.cycles-pp.copy_page_from_iter
      1.03 ± 23%      +3.6        4.67        perf-profile.children.cycles-pp._copy_to_iter
      0.70            +3.7        4.42        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.10 ± 21%      +3.9        5.01        perf-profile.children.cycles-pp.copy_page_to_iter
      1.08            +4.3        5.33        perf-profile.children.cycles-pp._copy_from_user
      1.19            +4.5        5.68        perf-profile.children.cycles-pp.do_sys_poll
      0.98            +4.8        5.78        perf-profile.children.cycles-pp.do_select
      1.33            +5.4        6.72        perf-profile.children.cycles-pp.__x64_sys_ppoll
      1.66            +6.9        8.54        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.74            +7.1        7.85        perf-profile.children.cycles-pp.mutex_lock
      1.63            +7.5        9.09        perf-profile.children.cycles-pp.core_sys_select
      2.37            +9.8       12.20        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.62           +10.6       13.23        perf-profile.children.cycles-pp.__x64_sys_pselect6
      2.00 ± 11%     +11.2       13.25        perf-profile.children.cycles-pp.anon_pipe_read
      2.40 ±  9%     +12.2       14.64        perf-profile.children.cycles-pp.vfs_read
      2.55 ±  9%     +12.8       15.36        perf-profile.children.cycles-pp.ksys_read
      2.09           +15.1       17.15        perf-profile.children.cycles-pp.anon_pipe_write
      2.39           +16.2       18.63        perf-profile.children.cycles-pp.vfs_write
      2.52           +16.8       19.32        perf-profile.children.cycles-pp.ksys_write
      5.14 ±  4%     +23.8       28.96        perf-profile.children.cycles-pp.stress_poll
     14.12           +54.3       68.45        perf-profile.children.cycles-pp.do_syscall_64
     14.46           +55.7       70.20        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     15.49           +71.7       87.17        perf-profile.children.cycles-pp.stress_run
     72.91           -72.9        0.00        perf-profile.self.cycles-pp.poll_idle
      0.57 ± 10%      -0.3        0.26 ± 19%  perf-profile.self.cycles-pp.queue_event
      0.29            -0.2        0.05        perf-profile.self.cycles-pp.__schedule
      0.05            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.05 ± 13%      +0.0        0.08 ± 25%  perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.41            +0.0        0.44        perf-profile.self.cycles-pp.update_sg_lb_stats
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.get_jiffies_update
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.timerqueue_linked_add
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__set_task_blocked
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.kill_fasync
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.timespec64_add_safe
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__x64_sys_poll
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.check_stack_object
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.recalc_sigpending
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.pollwake
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.put_timespec64
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.kick_ilb
      0.00            +0.1        0.10 ±  5%  perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.1        0.10 ±  5%  perf-profile.self.cycles-pp._raw_spin_unlock_irq
      0.00            +0.1        0.10        perf-profile.self.cycles-pp.__check_object_size
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.add_wait_queue
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.__fdelt_warn
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.do_prlimit
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.poll_freewait
      0.02 ±141%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__select
      0.06            +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.do_nanosleep
      0.00            +0.1        0.14 ± 25%  perf-profile.self.cycles-pp.pselect
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.__wake_up_sync_key
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.00            +0.2        0.16 ±  3%  perf-profile.self.cycles-pp.osq_lock
      0.00            +0.2        0.16 ±  3%  perf-profile.self.cycles-pp.__x64_sys_ppoll
      0.21            +0.2        0.37 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.04 ± 44%      +0.2        0.21        perf-profile.self.cycles-pp.security_file_permission
      0.02 ±141%      +0.2        0.20 ±  6%  perf-profile.self.cycles-pp.read
      0.03 ± 70%      +0.2        0.22        perf-profile.self.cycles-pp.get_timespec64
      0.04 ± 44%      +0.2        0.23        perf-profile.self.cycles-pp.set_user_sigmask
      0.05            +0.2        0.24        perf-profile.self.cycles-pp.ksys_read
      0.00            +0.2        0.19        perf-profile.self.cycles-pp.remove_wait_queue
      0.00            +0.2        0.20 ±  5%  perf-profile.self.cycles-pp.ppoll
      0.06 ±  9%      +0.2        0.26        perf-profile.self.cycles-pp.poll_select_finish
      0.02 ± 99%      +0.2        0.24 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.06 ±  6%      +0.2        0.30 ±  3%  perf-profile.self.cycles-pp.write
      0.06 ±  6%      +0.3        0.32        perf-profile.self.cycles-pp.__hrtimer_setup
      0.07 ±  7%      +0.3        0.33        perf-profile.self.cycles-pp.copy_page_to_iter
      0.09            +0.3        0.36        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.08            +0.3        0.36 ±  2%  perf-profile.self.cycles-pp.do_poll
      0.06            +0.3        0.36        perf-profile.self.cycles-pp.__getrlimit
      0.07            +0.3        0.37        perf-profile.self.cycles-pp.copy_page_from_iter
      0.00            +0.3        0.30        perf-profile.self.cycles-pp.__mutex_lock
      0.00            +0.3        0.32        perf-profile.self.cycles-pp.__wake_up_common
      0.10 ±  3%      +0.3        0.44        perf-profile.self.cycles-pp.rw_verify_area
      0.10            +0.3        0.44        perf-profile.self.cycles-pp.select_estimate_accuracy
      0.12 ±  3%      +0.4        0.48        perf-profile.self.cycles-pp.fdget
      0.10 ±  8%      +0.4        0.47        perf-profile.self.cycles-pp.__x64_sys_pselect6
      0.00            +0.4        0.38        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.19 ±  2%      +0.4        0.58        perf-profile.self.cycles-pp.ktime_get
      0.10            +0.5        0.59        perf-profile.self.cycles-pp.fput
      0.18            +0.5        0.67        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.15 ± 11%      +0.6        0.70 ±  9%  perf-profile.self.cycles-pp.pipe_read
      0.15 ± 12%      +0.6        0.71        perf-profile.self.cycles-pp.setrlimit64
      0.15 ±  2%      +0.6        0.80        perf-profile.self.cycles-pp.prandom_u32_state
      0.16 ±  2%      +0.7        0.83        perf-profile.self.cycles-pp.__do_sys_prlimit64
      0.20 ±  3%      +0.7        0.88        perf-profile.self.cycles-pp.do_sys_poll
      0.18 ±  2%      +0.7        0.92        perf-profile.self.cycles-pp.fdget_pos
      0.31            +0.8        1.06        perf-profile.self.cycles-pp.vfs_read
      0.19 ±  2%      +0.8        0.97 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.20 ±  2%      +0.8        0.98        perf-profile.self.cycles-pp.do_select
      0.20 ±  3%      +0.8        1.00 ±  3%  perf-profile.self.cycles-pp.__pollwait
      0.00            +0.8        0.82        perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.22 ±  2%      +0.9        1.14        perf-profile.self.cycles-pp.vfs_write
      0.24            +1.0        1.22        perf-profile.self.cycles-pp.__pi_memset
      0.26 ±  4%      +1.0        1.27 ±  5%  perf-profile.self.cycles-pp.pipe_poll
      0.26            +1.0        1.31        perf-profile.self.cycles-pp.core_sys_select
      0.27            +1.1        1.40        perf-profile.self.cycles-pp._copy_to_user
      0.31            +1.2        1.54        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.29 ±  3%      +1.3        1.54        perf-profile.self.cycles-pp.x64_sys_call
      0.31            +1.3        1.57        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.51            +2.0        2.51        perf-profile.self.cycles-pp.do_syscall_64
      0.28            +2.2        2.51        perf-profile.self.cycles-pp.anon_pipe_read
      0.49 ±  3%      +2.4        2.85        perf-profile.self.cycles-pp.stress_poll
      0.96            +2.4        3.36        perf-profile.self.cycles-pp.ktime_get_ts64
      0.43            +2.5        2.88        perf-profile.self.cycles-pp.mutex_unlock
      0.76            +3.2        3.95        perf-profile.self.cycles-pp._copy_from_iter
      0.68            +3.4        4.09        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.02 ± 23%      +3.6        4.67        perf-profile.self.cycles-pp._copy_to_iter
      0.30            +3.7        3.98        perf-profile.self.cycles-pp.anon_pipe_write
      1.07            +4.2        5.32        perf-profile.self.cycles-pp._copy_from_user
      1.51            +6.2        7.74        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.73            +7.1        7.82        perf-profile.self.cycles-pp.mutex_lock
      2.36            +9.8       12.16        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/min-nanosleep/stress-ng/60s

commit: 
  bd5956166d ("hrtimer: Provide hrtimer_start_range_ns_user()")
  b40c927345 ("hrtimer: Use hrtimer_start_expires_user() for hrtimer sleepers")

bd5956166d20adbd b40c927345a91e687eac4c3c5ca 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    450806           +17.8%     531264        stress-ng.min-nanosleep.ops
      7514           +17.9%       8856        stress-ng.min-nanosleep.ops_per_sec
 1.515e+08           -17.7%  1.246e+08        stress-ng.time.voluntary_context_switches
 1.575e+08           -16.6%  1.314e+08        cpuidle..usage
    769195 ±  6%     +11.8%     859776 ±  4%  numa-meminfo.node3.Mapped
    192598 ±  6%     +11.8%     215250 ±  4%  numa-vmstat.node3.nr_mapped
  12040943           -12.2%   10574365        vmstat.memory.cache
   4710967           -17.3%    3895982        vmstat.system.cs
   2485101           -17.7%    2045599        vmstat.system.in
      0.71 ±  2%      -0.1        0.60 ±  3%  mpstat.cpu.all.irq%
      0.75            -0.3        0.47        mpstat.cpu.all.sys%
      0.58            -0.1        0.50        mpstat.cpu.all.usr%
      3.74 ±  2%     -16.5%       3.12        mpstat.max_utilization_pct
      0.13 ±100%    +142.5%       0.31 ±  2%  perf-sched.total_wait_and_delay.average.ms
      0.13 ±100%    +142.6%       0.31 ±  2%  perf-sched.total_wait_time.average.ms
      0.13 ±100%    +142.5%       0.31 ±  2%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.13 ±100%    +142.6%       0.31 ±  2%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.03 ± 17%     +30.0%       0.04 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.17 ±  8%     +14.9%       0.19 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    208183 ±  4%     +14.7%     238704 ±  3%  sched_debug.cpu.avg_idle.stddev
    582588           -17.7%     479500        sched_debug.cpu.nr_switches.avg
    176212 ± 30%     -89.5%      18533 ±158%  sched_debug.cpu.nr_switches.min
    134024 ± 16%     +30.2%     174461 ±  9%  sched_debug.cpu.nr_switches.stddev
   8707900           -16.5%    7270859        meminfo.Active
   8707884           -16.5%    7270843        meminfo.Active(anon)
  11803536           -12.2%   10369090        meminfo.Cached
  11827937           -12.2%   10389120        meminfo.Committed_AS
    856252            +9.7%     939201 ±  2%  meminfo.Mapped
  16168049            -9.1%   14703988        meminfo.Memused
   8003355           -17.9%    6568947        meminfo.Shmem
  16311370            -8.8%   14878005        meminfo.max_used_kB
   2174767           -16.4%    1817870        proc-vmstat.nr_active_anon
   2948639           -12.1%    2592430        proc-vmstat.nr_file_pages
    213179           +10.2%     234918 ±  2%  proc-vmstat.nr_mapped
   1998593           -17.8%    1642394        proc-vmstat.nr_shmem
     41310            -2.0%      40502        proc-vmstat.nr_slab_reclaimable
   2174767           -16.4%    1817870        proc-vmstat.nr_zone_active_anon
   3968535 ±  4%     -15.5%    3353756        proc-vmstat.numa_hit
   3487223           -15.2%    2958859        proc-vmstat.numa_local
   3976614           -13.4%    3444381        proc-vmstat.pgalloc_normal
    648.67           -35.5%     418.50        turbostat.Avg_MHz
     22.68            -8.0       14.62        turbostat.Busy%
     11.96 ±  9%      +4.5       16.50 ± 13%  turbostat.C6%
     53.90           +19.7%      64.49        turbostat.CPU%c1
      5.44 ± 12%     +49.3%       8.13 ± 17%  turbostat.CPU%c6
      0.31           +22.6%       0.38        turbostat.IPC
 1.591e+08           -18.3%    1.3e+08        turbostat.IRQ
   2413647 ±  3%     -32.4%    1632648 ±  8%  turbostat.NMI
     18.16            -7.9       10.30        turbostat.POLL%
    430.90            -7.1%     400.51        turbostat.PkgWatt
     19.74            -3.6%      19.02        turbostat.RAMWatt
 1.301e+10           -24.7%  9.798e+09        perf-stat.i.branch-instructions
      0.55            +0.1        0.62 ±  2%  perf-stat.i.branch-miss-rate%
  65272862           -15.2%   55355425        perf-stat.i.branch-misses
   4984755           -17.1%    4131107        perf-stat.i.context-switches
      3.34           -18.5%       2.73        perf-stat.i.cpi
 1.659e+11           -35.7%  1.067e+11        perf-stat.i.cpu-cycles
     17765 ± 10%     -37.5%      11110 ± 14%  perf-stat.i.cycles-between-cache-misses
 5.373e+10           -21.1%  4.242e+10        perf-stat.i.instructions
      0.32           +19.8%       0.39        perf-stat.i.ipc
     19.47           -17.1%      16.13        perf-stat.i.metric.K/sec
      0.27 ±  7%     +24.5%       0.34 ± 13%  perf-stat.overall.MPKI
      0.50            +0.1        0.56        perf-stat.overall.branch-miss-rate%
      3.10           -18.8%       2.52        perf-stat.overall.cpi
     11421 ±  8%     -34.1%       7525 ± 12%  perf-stat.overall.cycles-between-cache-misses
      0.32           +23.1%       0.40        perf-stat.overall.ipc
 1.275e+10           -24.7%  9.605e+09        perf-stat.ps.branch-instructions
  63590737           -15.4%   53783178        perf-stat.ps.branch-misses
   4906407           -17.2%    4062144        perf-stat.ps.context-switches
 1.634e+11           -35.8%  1.049e+11        perf-stat.ps.cpu-cycles
 5.264e+10           -21.0%  4.158e+10        perf-stat.ps.instructions
 3.229e+12           -21.5%  2.533e+12        perf-stat.total.instructions
     82.32            -8.7       73.66        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     90.71            -4.4       86.32        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     91.28            -4.1       87.22        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     92.36            -3.6       88.78        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     94.17            -3.1       91.11        perf-profile.calltrace.cycles-pp.common_startup_64
     93.79            -3.0       90.75        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     93.81            -3.0       90.77        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     93.73            -3.0       90.70        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.28            -0.1        1.15        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.79            -0.1        0.71        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter
      0.65            -0.1        0.58        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state
      0.52            +0.1        0.65        perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.do_nanosleep
      0.56            +0.1        0.70        perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.61            +0.2        0.78 ±  2%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.71 ±  2%      +0.3        0.97 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.78 ±  2%      +0.3        1.06 ±  2%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.86 ±  5%      +0.4        1.28 ±  2%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.69 ±  3%      +0.4        1.12 ±  2%  perf-profile.calltrace.cycles-pp.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.71 ±  3%      +0.4        1.14 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.do_nanosleep
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      1.73            +0.6        2.28        perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.08 ±223%      +0.6        0.65        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      1.82            +0.6        2.40        perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.73 ±  2%      +0.6        1.32        perf-profile.calltrace.cycles-pp.add_callchain_ip.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit
      0.00            +0.6        0.60 ±  5%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      1.10 ±  8%      +0.6        1.72 ±  5%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      0.77            +0.6        1.39        perf-profile.calltrace.cycles-pp.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event
      0.00            +0.7        0.72 ±  4%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.53 ± 10%      +0.7        2.26 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.94            +0.8        1.70 ±  2%  perf-profile.calltrace.cycles-pp.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush
      0.96            +0.8        1.73 ±  2%  perf-profile.calltrace.cycles-pp.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event
      1.02            +0.8        1.84        perf-profile.calltrace.cycles-pp.build_id__mark_dso_hit.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event.reader__read_event
      1.71 ±  9%      +0.8        2.54 ±  6%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.08            +0.9        1.94        perf-profile.calltrace.cycles-pp.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event.reader__read_event.perf_session__process_events
      2.34 ±  8%      +1.1        3.41 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +1.2        1.16        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +1.2        1.19        perf-profile.calltrace.cycles-pp.hrtimer_sleeper_start_expires.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.63            +1.2        3.84        perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      2.73            +1.3        4.01        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.75            +1.3        4.03        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.92            +1.4        4.33        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.16            +1.6        4.73        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.18            +1.6        4.78        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.70 ±  5%      +1.8        5.54 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      4.52            +2.7        7.24        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     83.12            -8.8       74.35        perf-profile.children.cycles-pp.poll_idle
     91.62            -4.1       87.52        perf-profile.children.cycles-pp.cpuidle_enter_state
     91.64            -4.1       87.54        perf-profile.children.cycles-pp.cpuidle_enter
     92.73            -3.6       89.12        perf-profile.children.cycles-pp.cpuidle_idle_call
     94.17            -3.1       91.11        perf-profile.children.cycles-pp.common_startup_64
     94.17            -3.1       91.11        perf-profile.children.cycles-pp.cpu_startup_entry
     94.12            -3.1       91.07        perf-profile.children.cycles-pp.do_idle
     93.81            -3.0       90.77        perf-profile.children.cycles-pp.start_secondary
      0.64            -0.0        0.62        perf-profile.children.cycles-pp.local_clock_noinstr
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.set_next_task_idle
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.perf_tp_event
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.06 ±  7%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.05 ±  7%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.05            +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.07            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.06            +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.error_entry
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.09            +0.0        0.11        perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__nanosleep
      0.06            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.05 ± 13%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.07 ±  5%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.07            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.08 ±  6%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.09 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.__update_load_avg_se
      0.10 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.set_next_entity
      0.08 ±  5%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.ct_idle_exit
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.stress_min_nanosleep
      0.12            +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.08 ±  4%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.05 ±  8%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.hrtimer_active
      0.12 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.07 ± 10%      +0.0        0.11 ±  8%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.12 ±  4%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.set_next_task_fair
      0.13 ±  2%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.11 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.13 ±  2%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.05            +0.0        0.09        perf-profile.children.cycles-pp.__hrtimer_setup
      0.05            +0.0        0.09        perf-profile.children.cycles-pp.thread__get
      0.05            +0.0        0.09 ±  6%  perf-profile.children.cycles-pp.thread__put
      0.10 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__resched_curr
      0.16 ±  4%      +0.0        0.20 ±  3%  perf-profile.children.cycles-pp.update_se
      0.14 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.finish_task_switch
      0.07 ±  7%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.hrtimer_setup_sleeper_on_stack
      0.07 ±  7%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.sched_balance_domains
      0.05            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.02 ±141%      +0.0        0.06        perf-profile.children.cycles-pp.ct_kernel_exit
      0.06 ±  9%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.maps__refcnt
      0.14            +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.os_xsave
      0.04 ± 44%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.timerqueue_linked_add
      0.12 ±  6%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.wakeup_preempt
      0.17 ±  2%      +0.0        0.22 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      0.15 ±  3%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.update_rq_clock
      0.01 ±223%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.clock_nanosleep
      0.00            +0.1        0.05        perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.migrate_disable_switch
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.put_prev_task_idle
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.rb_erase_linked
      0.02 ± 99%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.evlist__event2evsel
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp._raw_spin_unlock
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.mm_cid_switch_to
      0.09 ± 10%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.03 ±100%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.14 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.24 ±  3%      +0.1        0.29 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.pick_task_fair
      0.04 ± 45%      +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.07 ±  6%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.map_symbol__copy
      0.02 ±141%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.select_idle_sibling
      0.01 ±223%      +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.18 ±  2%      +0.1        0.24 ±  2%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
      0.10 ± 16%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.sched_tick
      0.02 ±141%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.07            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.11 ±  9%      +0.1        0.17 ±  5%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.19            +0.1        0.25        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.07 ± 15%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.13 ±  7%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.22 ±  3%      +0.1        0.30 ±  2%  perf-profile.children.cycles-pp.__switch_to
      0.13 ±  8%      +0.1        0.21 ±  5%  perf-profile.children.cycles-pp.select_task_rq
      0.12 ±  6%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.handle_softirqs
      0.08 ±  5%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.maps__find
      0.18 ±  2%      +0.1        0.26        perf-profile.children.cycles-pp.irqtime_account_irq
      0.24 ±  2%      +0.1        0.31 ±  2%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.26            +0.1        0.34        perf-profile.children.cycles-pp._raw_spin_lock
      0.10 ±  4%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.callchain_cursor_append
      0.10 ±  4%      +0.1        0.18 ±  3%  perf-profile.children.cycles-pp._copy_from_user
      0.21 ± 11%      +0.1        0.30 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.25 ±  3%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      0.66            +0.1        0.76        perf-profile.children.cycles-pp.native_sched_clock
      0.12 ±  4%      +0.1        0.21 ±  3%  perf-profile.children.cycles-pp.get_timespec64
      0.27 ±  2%      +0.1        0.37 ±  2%  perf-profile.children.cycles-pp.update_load_avg
      0.34 ±  4%      +0.1        0.44 ±  4%  perf-profile.children.cycles-pp.__hrtimer_rearm_deferred
      0.25 ±  3%      +0.1        0.35        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.39 ±  3%      +0.1        0.50 ±  3%  perf-profile.children.cycles-pp.irqentry_exit
      0.21 ±  4%      +0.1        0.32 ±  2%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.29            +0.1        0.41        perf-profile.children.cycles-pp.sched_clock
      0.44            +0.1        0.55        perf-profile.children.cycles-pp.dequeue_entity
      0.14 ±  3%      +0.1        0.26        perf-profile.children.cycles-pp.maps__get
      0.10 ± 27%      +0.1        0.22 ±  8%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.35 ±  2%      +0.1        0.47 ±  2%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.33            +0.1        0.45 ±  2%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.24 ±  3%      +0.1        0.36 ±  3%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.23 ±  2%      +0.1        0.35 ±  2%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.16 ±  3%      +0.1        0.28 ±  2%  perf-profile.children.cycles-pp.addr_location__exit
      0.37 ±  3%      +0.1        0.50 ±  2%  perf-profile.children.cycles-pp.enqueue_task
      0.50            +0.1        0.63        perf-profile.children.cycles-pp.dequeue_entities
      0.51 ±  2%      +0.1        0.64 ±  3%  perf-profile.children.cycles-pp.clockevents_program_event
      0.26 ±  3%      +0.1        0.39 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.17 ±  2%      +0.1        0.30 ±  2%  perf-profile.children.cycles-pp.map__put
      0.17 ±  2%      +0.1        0.30 ±  4%  perf-profile.children.cycles-pp.callchain_cursor_reset
      0.52            +0.1        0.66        perf-profile.children.cycles-pp.dequeue_task_fair
      0.48            +0.1        0.62        perf-profile.children.cycles-pp.native_irq_return_iret
      0.36 ±  5%      +0.1        0.50        perf-profile.children.cycles-pp.sched_balance_newidle
      0.56            +0.2        0.71        perf-profile.children.cycles-pp.try_to_block_task
      0.31 ±  7%      +0.2        0.46        perf-profile.children.cycles-pp.sched_balance_rq
      0.61            +0.2        0.79 ±  2%  perf-profile.children.cycles-pp.queue_event
      0.21 ±  3%      +0.2        0.39 ±  3%  perf-profile.children.cycles-pp.maps__put
      0.61            +0.2        0.79 ±  2%  perf-profile.children.cycles-pp.ordered_events__queue
      0.51 ±  3%      +0.2        0.70 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.24 ±  3%      +0.2        0.44 ±  2%  perf-profile.children.cycles-pp.thread__find_map
      0.64            +0.2        0.84 ±  2%  perf-profile.children.cycles-pp.process_simple
      0.28 ±  2%      +0.2        0.50 ±  3%  perf-profile.children.cycles-pp.map_symbol__exit
      0.61            +0.2        0.84        perf-profile.children.cycles-pp.pick_next_task_fair
      0.29 ±  9%      +0.2        0.53 ±  2%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.36 ± 11%      +0.2        0.61 ±  5%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.73            +0.3        0.99        perf-profile.children.cycles-pp.__pick_next_task
      0.46 ±  8%      +0.3        0.74 ±  4%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.80 ±  2%      +0.3        1.08 ±  2%  perf-profile.children.cycles-pp.schedule_idle
      0.66 ± 16%      +0.4        1.04 ±  2%  perf-profile.children.cycles-pp.ktime_get
      1.09 ±  3%      +0.4        1.49 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
      1.10 ±  3%      +0.4        1.50 ±  2%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.88 ±  4%      +0.4        1.31 ±  2%  perf-profile.children.cycles-pp.menu_select
      1.57 ±  6%      +0.6        2.14 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.82            +0.6        2.40        perf-profile.children.cycles-pp.schedule
      0.75 ±  2%      +0.6        1.35        perf-profile.children.cycles-pp.add_callchain_ip
      0.77            +0.6        1.40        perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      2.12 ±  7%      +0.7        2.80 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.94            +0.8        1.71        perf-profile.children.cycles-pp.__thread__resolve_callchain
      2.39 ±  7%      +0.8        3.15 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.96            +0.8        1.74        perf-profile.children.cycles-pp.sample__for_each_callchain_node
      1.02            +0.8        1.84 ±  2%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      2.50            +0.8        3.32        perf-profile.children.cycles-pp.__schedule
      1.09            +0.9        1.95        perf-profile.children.cycles-pp.__ordered_events__flush
      1.08            +0.9        1.94        perf-profile.children.cycles-pp.perf_session__deliver_event
      1.09            +0.9        1.96        perf-profile.children.cycles-pp.perf_session__process_user_event
      3.18 ±  6%      +1.0        4.18 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.74            +1.1        2.82        perf-profile.children.cycles-pp.reader__read_event
      1.74            +1.1        2.82        perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +1.2        1.18        perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      0.00            +1.2        1.19        perf-profile.children.cycles-pp.hrtimer_sleeper_start_expires
      2.65            +1.2        3.87        perf-profile.children.cycles-pp.do_nanosleep
      2.74            +1.3        4.02        perf-profile.children.cycles-pp.hrtimer_nanosleep
      2.75            +1.3        4.04        perf-profile.children.cycles-pp.common_nsleep
      4.50 ±  4%      +1.4        5.91 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.92            +1.4        4.34        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      3.21            +1.6        4.81        perf-profile.children.cycles-pp.do_syscall_64
      3.23            +1.6        4.85        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.53            +2.7        7.27        perf-profile.children.cycles-pp.intel_idle
     81.54            -8.6       72.94        perf-profile.self.cycles-pp.poll_idle
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.cpu_startup_entry
      0.05            +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.dequeue_entities
      0.08 ±  5%      +0.0        0.10        perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.06 ±  6%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.error_entry
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.enqueue_entity
      0.08 ±  4%      +0.0        0.10        perf-profile.self.cycles-pp.dequeue_entity
      0.08 ±  4%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.07            +0.0        0.09        perf-profile.self.cycles-pp.try_to_wake_up
      0.05 ±  8%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.prepare_task_switch
      0.08 ±  6%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.___perf_sw_event
      0.07            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.schedule
      0.07            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.update_load_avg
      0.06 ±  8%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.schedule_idle
      0.05 ±  7%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.06            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.07 ±  6%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.07 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.07            +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.08 ±  4%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.switch_fpu_return
      0.07 ±  5%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.08 ±  4%      +0.0        0.11        perf-profile.self.cycles-pp.__update_load_avg_se
      0.06            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.03 ± 70%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.12 ±  3%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.finish_task_switch
      0.06 ± 14%      +0.0        0.10 ± 10%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.09 ±  7%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.06            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.06            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      0.13            +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.09 ±  7%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__resched_curr
      0.05            +0.0        0.09        perf-profile.self.cycles-pp.__hrtimer_setup
      0.14            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.03 ± 70%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.map_symbol__exit
      0.04 ± 44%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.thread__get
      0.08 ± 12%      +0.0        0.12 ±  7%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.06            +0.1        0.11        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.clock_nanosleep
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.ct_kernel_enter
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.map_symbol__copy
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.update_cfs_rq_load_avg
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.17 ±  2%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.mm_cid_switch_to
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.update_curr
      0.17 ±  2%      +0.1        0.22        perf-profile.self.cycles-pp.do_idle
      0.02 ±141%      +0.1        0.07        perf-profile.self.cycles-pp.stress_min_nanosleep
      0.02 ±141%      +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__get_next_timer_interrupt
      0.07            +0.1        0.13        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.07 ±  5%      +0.1        0.13 ±  4%  perf-profile.self.cycles-pp.maps__find
      0.02 ±141%      +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.evlist__event2evsel
      0.06 ± 46%      +0.1        0.12 ± 16%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.hrtimer_active
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.timerqueue_linked_add
      0.02 ±141%      +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.maps__refcnt
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.02 ±141%      +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.thread__put
      0.21 ±  2%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.__switch_to
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.13 ±  2%      +0.1        0.20 ±  4%  perf-profile.self.cycles-pp.do_nanosleep
      0.08 ±  5%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.add_callchain_ip
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.hrtimer_start_range_ns_user
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.thread__find_map
      0.23 ±  2%      +0.1        0.31 ±  2%  perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.10 ±  5%      +0.1        0.17 ±  5%  perf-profile.self.cycles-pp._copy_from_user
      0.24 ±  2%      +0.1        0.32        perf-profile.self.cycles-pp._raw_spin_lock
      0.17 ±  4%      +0.1        0.25 ±  2%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.64            +0.1        0.72        perf-profile.self.cycles-pp.native_sched_clock
      0.12 ±  4%      +0.1        0.23 ±  2%  perf-profile.self.cycles-pp.maps__get
      0.33 ±  4%      +0.1        0.44        perf-profile.self.cycles-pp.__schedule
      0.42            +0.1        0.53        perf-profile.self.cycles-pp.clockevents_program_event
      0.10 ± 28%      +0.1        0.22 ±  8%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.16 ±  2%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.map__put
      0.24 ±  3%      +0.1        0.37 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.38 ±  2%      +0.1        0.52        perf-profile.self.cycles-pp.menu_select
      0.48            +0.1        0.62        perf-profile.self.cycles-pp.native_irq_return_iret
      0.19 ±  4%      +0.2        0.34 ±  3%  perf-profile.self.cycles-pp.maps__put
      0.61            +0.2        0.78 ±  3%  perf-profile.self.cycles-pp.queue_event
      0.65 ± 16%      +0.4        1.03 ±  2%  perf-profile.self.cycles-pp.ktime_get
      0.80            +0.4        1.24        perf-profile.self.cycles-pp.cpuidle_enter_state
      4.53            +2.7        7.26        perf-profile.self.cycles-pp.intel_idle





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


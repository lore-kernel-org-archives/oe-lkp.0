Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA122E229F
	for <oe-lkp@lists.linux.dev>; Wed, 18 Feb 2026 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771388043; cv=fail; b=Kle9U1L6JsPqW7jfY9BLUTUgv2jdyM8pjUbcDIyNng3dd1hwJJpmg3jJghpYUN+x519p1zJel3v9II88XDWt4hZzXp26T1Rfq61KkJQWonjbwx8Dd8tfeSvWb9PtKdXmg3rjCBrQG1ftD5yGBceXANzao5BxACOcbkVGq+jhQ0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771388043; c=relaxed/simple;
	bh=ijObchd4mvjKQbQjY1nFKihhPUG9Mv/pxHwxkHLLZhc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=g5WSrznGAFLOsmNYJ5D8k3Pi6y43v/T+zt9uTn8jMKKO5SInNNGebPvdMYatSLvMvb3D8gPZCzUFSTJ8xorCDHeFLx8K8tX4UpXxeLCtFE+YKc3ImOxj/yfouT+d2RoIGTZQyd7BRJjZUkItzWuJ/l9RSBlIZpihXixTSo783Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLIpId+p; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLIpId+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771388042; x=1802924042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijObchd4mvjKQbQjY1nFKihhPUG9Mv/pxHwxkHLLZhc=;
  b=DLIpId+pVQkt5A7CxsSAdFARootupeoQ3SYR4VFKdhCQi2FF7t1lwZaS
   SOS7y+XMZ9vuwGXyFpd/f7vrVolt8uMoK1hPTeM2t1X2eZdUAk2xaEGsw
   QAYMx8W3lR/DhQkmG1WWsuyRR3MmEG6xqNyZ+b8BnuMj/4DK6d/AD54A/
   c9teRkRfPX1RFoucy77TMBJxhdSBAlxIgC5eEwB+1syN+5FoFZbotpdWl
   JLDR+oCKS583km7WyvX+nHSQpmumijUBsR7hI86yOAqlIONKK72ZdMY6i
   KOGJuY2TGrxEDGlIKAtHpevaJxqgJg4Np3q9QVR82SXAxp09l1UP90f3n
   Q==;
X-CSE-ConnectionGUID: vHwGpbRGTW2Dt7ZruvFSTg==
X-CSE-MsgGUID: HkScXpHFSOC69Hj2jUQurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72176811"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72176811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:14:01 -0800
X-CSE-ConnectionGUID: CDY3FyeTQGmn9T691QiEew==
X-CSE-MsgGUID: DhMwwTl9QdmgSUXqdrO+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="217956098"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:14:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:14:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 20:14:01 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK090TYptRAXNFnYY3KmwfWJR5ih/QDOwppVe/s/+tTqvfREdV1r/ZR/mNZXfz/IRx7RSElI6NMHaNKIkKv1DfTRjJoAbh1TKv3vRFu4ZXKwm9eNv8gCcCc19gFaryGcrPDXU6er3cpqFcV/l3rq8UJWGA920ErC3tMLiPq9i7Dsrs3XHfsBigxicH+24wdQf2/amXtpitGFX8HlTkXoRZ20vXjefyWj5y+4jQGEMizzee8ro0MC3qa56M6Pvhdl8RiIGXLvBEl7Yu8E5d4zwnizP/JZd96XZo3ACxlsl1AaFwFG3rErEt/8NqWlTUzQxnImhxkXyeXBVCgHA5dsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl53R3aI7677aotOw7Ap/P7XNwPqcdmKpv7B93i30Fw=;
 b=C3l47JsklVCv57FI1aUbbBoSsL4GcntaggBtaXVac32WhYFRzR2Rz59uoHi5Bh9PyYye43LPseWDh/N+dyHOlDrNRwiuhSgmZmp+O4AK+igHAymiXVS2mRXzUHPjjtapNuTmSM/lS6/A+JP+cVuPe7irbHgV+It07OAU5cZXSCUBP4uNUdpQ0nDIW3XwD2/+hx+dRLQMC/Y7j5KkfnYmBWdsHFbNpJasnH5tndNqxz2w/ycK864RkfKe/qvor7ccOk7ABTRlhHdK3yttL73j+j+olLC2jiUeIkNXq/K3o+AmufMn+r+S8hqdW3fjzWSbbw1N4mNMvsHTBZ0F1YKcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 04:13:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:13:58 +0000
Date: Wed, 18 Feb 2026 12:13:51 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:sched/hrtick] [x86/apic]  acefed487a:
 Oops:divide_error:#[##]KASAN
Message-ID: <202602181118.929e4694-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 5480965f-3570-4af4-84a5-08de6ea423ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wdWiZWYsc6sdDCnUboQXywgXSWh+I53Ue0Ztfssjx0ZNvFprQ+5l+OStH5YJ?=
 =?us-ascii?Q?isbGJb24uf2T92t5ABd0om+9mM929vyHHHYIyITDUHNiXAY0gejxC13sAYes?=
 =?us-ascii?Q?m6Ty7LhT2bZ+3cfaQilFipDgvIu7WLeNNR16UlZUV/R+Sr8tzL8Aa6GN57uS?=
 =?us-ascii?Q?tFa09q9mc6P84fpIgL0DTEX3KfXZFe5SAoQWe+y/qMeLzi0mq8UCRi50wW2C?=
 =?us-ascii?Q?GcXaVGtm/yyur8jSVVe4hpf204gD9TQ8yqsdEUzQoybsSkgWF7PtXA4ra2GU?=
 =?us-ascii?Q?FLscmQKQAhKmjHF/0M2mdYGIkaozbdCDN3Y+25xUhaLGmL1MrF2sZ2TwhU6e?=
 =?us-ascii?Q?CR0ry4YGuPLpLjXVLnDqJHjKDDZTykXanw8pExSzGYbXqdI+x70shEUCRAZg?=
 =?us-ascii?Q?rbpWDngaF3HkJx9BUTYB6iYWe8YyXHNl1mPFps3EPYqeUXYN2LZ4MRewib0q?=
 =?us-ascii?Q?Y1PfAAt027n13J78XqqiZUEQ1EMgjAXTFOSafCw0uddm97d8F6Yqg26N9Jh4?=
 =?us-ascii?Q?HpDrUccPkubsvjmyXUXw6R/PSa+m6qY8IxjlMHM5+fV1+jnCCa3JNS4KUxwO?=
 =?us-ascii?Q?3/7AShgfmtYQhgPqXWj29wGVO69Iz89fD5bUDv0kAyIi+OChgYEwY/v0eEdp?=
 =?us-ascii?Q?tUgVjCIgJsoEySwkfeYChhJ/Ui4dI6A7V0N8r8c8TGun8v+BiXIGP+I/gYqB?=
 =?us-ascii?Q?dCxulAfQxhzqpRNIJA84wHwU+hKFOp/xj3GJ/M2nwk5rRtuSky80qj+FbBXO?=
 =?us-ascii?Q?CwNpPzT4RcmLcV3uqG38kgSdsGLPwfsK5dUVw9qqLQrFN4cN9Us5UA5q1Mrp?=
 =?us-ascii?Q?R6kOkNPHrAvhBXwSAJ/D94s9gVRE+W4BRonqNmMQq0GvPLy6XEUXgkIYXUac?=
 =?us-ascii?Q?shcN/9rfQP0eLdDjhq07GefSpcTRLOzOOK9xydaamaO8xShSChdXnBBMQTKP?=
 =?us-ascii?Q?FGjyKQww2/mOr8H38wwJ312FDJ79XBtCH4gaDtngUpYY4/pGdYbCCunZ1HFh?=
 =?us-ascii?Q?ypHngOpvN0zggZdKyaWR4AmfGTzargC49OhtKJaTM31I2DMl0huGmnMehtD/?=
 =?us-ascii?Q?a+Oa4xg0iobA/9oBTxrkylCnt9Q8ecpe8dqNDXOckhVI+1YXY+aJn8wiXt/+?=
 =?us-ascii?Q?BBv6UBjjUbtk3QQXrCrk8j9kObusjdHqQZw+rFt/5rP4gS+rqP3aAH7lJlOY?=
 =?us-ascii?Q?b+NWCkXUtih+zihrDy+aBZRvSWJYCO32mVi87Kh+DEop7U6n8awgzW+lcWWN?=
 =?us-ascii?Q?BEkYIYwcIeqwXsw86bIKA9snEhjMIkDonEkGVfMjoUWOzBw+MKx9AQe22JRM?=
 =?us-ascii?Q?Pp+aXe4RhM4xCUn3fomYf8c7lrRZ9d9iP9RmUZnA+vA2eUochj6OnFWRvrCJ?=
 =?us-ascii?Q?oXHIDYt3GHVek3NdiorNDIhb2EJdmJjFzb6drW10mfxlJ1FLaW7uMUvx5Pq0?=
 =?us-ascii?Q?AsDBMi7/V21J4uoG96IVuyBKBJH1WMCKjQ1n5LyrWfRSHOmb05wKKso+5hPt?=
 =?us-ascii?Q?4MBmkdcv9ui/DS8BjU2AzeNGx1bzQ+26bP9seNgd25ijWfY65DbMOqGZ2MC8?=
 =?us-ascii?Q?hOlanMFqb9brACw24Jw5YKp+6o8usdxP8gTPYB6U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Amj2Ht4Hd3Di3g1P2mrfcFgfT7PHVgdUeXmidpZQXK+fP1Hu8V452tPMgEHx?=
 =?us-ascii?Q?6k8D/eqSTqQNRUc9K//lDLdgAx0nfbwo//NbCRBiatrgM5iwbQdVUC7gY+td?=
 =?us-ascii?Q?jgXv1MlROSvYaRMdT4C5NXLb6VPsIBMbnlJ9eGVwzxkFPaNSlAVvXO6a2BoS?=
 =?us-ascii?Q?pB6+Af9elvebG7R1bSvVmqPfTnRcA0pG0gGuAxLbzKaODxJGy4Cfk5kmdBS/?=
 =?us-ascii?Q?1/9gcGMWg6nRYWrLSZKOk0iGhRjmhnP+CZrirw4S6qx6esNFgOxkGBx+S5Ru?=
 =?us-ascii?Q?C7VujaZAjSbF65lNvo35FpgBgEdxeSz69YlEHY4q29+U6K+0rB43/Reto18s?=
 =?us-ascii?Q?qSCFJVvYTdJIvV+mTHG4+mPNzARtewkVYIXCTCEn1M7MojXAWUVGjinsjY7x?=
 =?us-ascii?Q?PcHEKAa/JEYY9fXnoUWiTFRlrHbp/OGiNdnJQ89Il6ddgfjZikZsboIabZho?=
 =?us-ascii?Q?fgxN7f0bDQdFvQwCWmv+6r75L9BTGAiRoQfdfL7/jLfqBPXHDMr4GPYBY2Lb?=
 =?us-ascii?Q?STWxqmsNcewwPxFlwiFRFkRslzq4IQ8yRTGnl1mOFD0L0q/o4yIIlk43rYO1?=
 =?us-ascii?Q?ptrsNYv+BGIFh1z8Z+BCOtO3T9LTECWabZQsbgt9hz7/RzdlzqHkHUvjUGhg?=
 =?us-ascii?Q?7u3DK0bog7uGAAtGozU4ZoScK02Ogrs+eofKmwY2SENaYvnrfU0bCd06qkJL?=
 =?us-ascii?Q?EBXYMLIr1O2n9JlK2dWvsg100LY33UzclNNmW0bYk6mgV4Gf5PRlH5DnpQ09?=
 =?us-ascii?Q?XFQLwWvbSz0pFuQQm51GgyrzSarmcjF/4wRyRnIU94RMznfKfyOZRo2yujBL?=
 =?us-ascii?Q?kHJedTml3DRWUdhChPd/BEIBBY8zofftPey6k+DH7qTf0VEAgUsiXguuKuP6?=
 =?us-ascii?Q?kRGxUeV2mortvismCxF5Wc3gOSDTx9fkpGqU5HDIA4PvJHZGRJmQoPnRzDCG?=
 =?us-ascii?Q?H1u5olSRfOVeLJaHM25kNOW2FMJZyKFvUUgtSkhAzZICjWgY6JIZyd1JDmxC?=
 =?us-ascii?Q?8mMLU6D9/DJ5WciSMNCT0cCiXWtkZk89/HEovAmR1TBEJDY/xvfjoX6TYP5W?=
 =?us-ascii?Q?z5jXLnjEFIDO9tFkmQ5M++PfHkRrbGROfZUUU77u8oEjevPi5EBr+bIRb78v?=
 =?us-ascii?Q?riAJz8GhgNhOB2kiTsZBe3E6nWbZesd5P6FeEURTppIyIOZfC8O/s6HMXgZc?=
 =?us-ascii?Q?fvJ7sN+eoWni9Wqw+EB6tZJQsTA3F8DOXse1pinZxCf+K29fVkF37k9nFrKz?=
 =?us-ascii?Q?oavm6yWfp/JLTfGbVvG6wHaHy18CyA+mocuLGNui6J2MOUV7WhKPsB+4gMz/?=
 =?us-ascii?Q?Kk9vimKe/GUTgEyJ9lo+WHGXW6j2HKOpcLnNts9189NIoeZslnJjA+cp97GA?=
 =?us-ascii?Q?MeZ8vG7xxBiID2neB/0H6rmJn/ENU4q1AiIYbhWFy8Mpp5vw2YsWuVkMdPMW?=
 =?us-ascii?Q?8iUY3t6aTyd8jsswjbmm43NIVd9Ov3Mtk1n6XWlSvCCLkMmxtS8ERTFszjog?=
 =?us-ascii?Q?XyOkwm3/62s1EYW5VQxOS6q+FUPePNC2Q+o/nPxSL07bVeL9ePJ5V1CHRgCh?=
 =?us-ascii?Q?WnyB2FlnC7gwvTFaW/OoKVu2ba2TZ5eQSFm6QafRIZi/PQEmpKfQ94/Hx3Sf?=
 =?us-ascii?Q?qcLw/7dp2LBMGOzO4L0NC/2Szl0k+0DP1dNIkL62qpWj3Ch4t6UfQmojF0Sr?=
 =?us-ascii?Q?eyXGItfO+0jyzorqIlwoT0JrzhKbXwIpWmx33+glnApitOzYj73OPViMj+s/?=
 =?us-ascii?Q?596gabx1HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5480965f-3570-4af4-84a5-08de6ea423ab
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:13:58.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY4GTlWaVfr1jG5nPKnRIibdnB0x3hKT/ZRtlrI4dFLa8yaa4MfydIwhcfsceQ60ktM930HQ4Do0GResSMiHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:divide_error:#[##]KASAN" on:

commit: acefed487add38662f5d12bc7550b215d577aeb1 ("x86/apic: Enable TSC coupled programming mode")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git sched/hrtick

in testcase: boot

config: x86_64-randconfig-003-20260217
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | c903d71146 | acefed487a |
+------------------------------------------+------------+------------+
| boot_failures                            | 0          | 12         |
| Oops:divide_error:#[##]KASAN             | 0          | 12         |
| RIP:timekeeping_update_from_shadow       | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602181118.929e4694-lkp@intel.com



[    5.888967][    T1] e820: register RAM buffer resource [mem 0xbffe0000-0xbfffffff]
[    5.890270][    T1] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    5.890772][    T1] pci 0000:00:02.0: vgaarb: bridge control possible
[    5.891232][    T1] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    5.891888][    T1] vgaarb: loaded
[    5.893016][    T1] Oops: divide error: 0000 [#1] KASAN
[    5.893403][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.19.0-09386-gacefed487add #1 PREEMPT
[    5.894230][    T1] Tainted: [T]=RANDSTRUCT
[    5.894533][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.894554][    T1] RIP: 0010:timekeeping_update_from_shadow (kbuild/src/consumer/include/linux/math64.h:29 kbuild/src/consumer/include/linux/math64.h:130 kbuild/src/consumer/kernel/time/timekeeping.c:762 kbuild/src/consumer/kernel/time/timekeeping.c:799)
[    5.894554][    T1] Code: 2a 49 8d 7f 08 48 89 fa 48 c1 ea 03 80 3c 02 00 74 05 e8 47 d0 25 00 49 8b 47 08 31 d2 45 89 e4 48 8d bb 30 02 00 00 48 89 f9 <49> f7 f4 ba ff ff 37 00 48 c1 e9 03 48 c1 e2 2a 80 3c 11 00 74 0d
All code
========
   0:	2a 49 8d             	sub    -0x73(%rcx),%cl
   3:	7f 08                	jg     0xd
   5:	48 89 fa             	mov    %rdi,%rdx
   8:	48 c1 ea 03          	shr    $0x3,%rdx
   c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  10:	74 05                	je     0x17
  12:	e8 47 d0 25 00       	call   0x25d05e
  17:	49 8b 47 08          	mov    0x8(%r15),%rax
  1b:	31 d2                	xor    %edx,%edx
  1d:	45 89 e4             	mov    %r12d,%r12d
  20:	48 8d bb 30 02 00 00 	lea    0x230(%rbx),%rdi
  27:	48 89 f9             	mov    %rdi,%rcx
  2a:*	49 f7 f4             	div    %r12		<-- trapping instruction
  2d:	ba ff ff 37 00       	mov    $0x37ffff,%edx
  32:	48 c1 e9 03          	shr    $0x3,%rcx
  36:	48 c1 e2 2a          	shl    $0x2a,%rdx
  3a:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
  3e:	74 0d                	je     0x4d

Code starting with the faulting instruction
===========================================
   0:	49 f7 f4             	div    %r12
   3:	ba ff ff 37 00       	mov    $0x37ffff,%edx
   8:	48 c1 e9 03          	shr    $0x3,%rcx
   c:	48 c1 e2 2a          	shl    $0x2a,%rdx
  10:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
  14:	74 0d                	je     0x23
[    5.894554][    T1] RSP: 0000:ffffc9000001fc18 EFLAGS: 00010046
[    5.894554][    T1] RAX: ffffffffffffffff RBX: ffffffff9fa5fc40 RCX: ffffffff9fa5fe70
[    5.894554][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff9fa5fe70
[    5.894554][    T1] RBP: ffffc9000001fc48 R08: 0000000000000000 R09: 0000000000000000
[    5.894554][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    5.894554][    T1] R13: ffffffff9fa5fda8 R14: 0000000000000003 R15: ffffffff9e1328e0
[    5.894554][    T1] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    5.894554][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.894554][    T1] CR2: ffff88883ffff000 CR3: 00000003a3eb0000 CR4: 00000000000406f0
[    5.894554][    T1] Call Trace:
[    5.894554][    T1]  <TASK>
[    5.894554][    T1]  timekeeping_notify (kbuild/src/consumer/include/linux/spinlock.h:570 kbuild/src/consumer/kernel/time/timekeeping.c:1723 kbuild/src/consumer/include/linux/stop_machine.h:171 kbuild/src/consumer/include/linux/stop_machine.h:179 kbuild/src/consumer/kernel/time/timekeeping.c:1760)
[    5.894554][    T1]  ? lockdep_hardirqs_on (kbuild/src/consumer/kernel/locking/lockdep.c:4474)
[    5.894554][    T1]  __clocksource_select (kbuild/src/consumer/kernel/time/clocksource.c:1069 (discriminator 1))
[    5.894554][    T1]  ? __clocksource_watchdog_kthread (kbuild/src/consumer/kernel/time/clocksource.c:716)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260218/202602181118.929e4694-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


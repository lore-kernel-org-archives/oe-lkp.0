Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EA33998
	for <oe-lkp@lists.linux.dev>; Sun, 26 Jan 2025 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737879974; cv=fail; b=TBnYdnK+i5VYMPDmJuexECbMUaydt486SegkwkylG8PuL8eDZz2BkU4AHr7enwFErlxM0Y2swByUCkaXGhk8jDAfpJlgThhH9uyMLM/UVSfMItXl4Qi79fk9viOi+/fQau0KPxYDyOIklqC6+GYjuXEIXoUIK02iU0Mizgfk24g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737879974; c=relaxed/simple;
	bh=g2zUwvT2x5asVsGN/G8QEKFYKI8JtsEIR7l9AwzkoGY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CrZ2GOVO/Km650b0XDE0Pw5f477QtCrt7qmBV5J2uIbVGhnxniwWiay9t2kRFqXnnxS6yBqOzbYqYbq9WWke2cgK7bgHyDyXUMvxmGxGCus/LMQwlrP6MvAAExxDiNaWANhXCOdD2VMhRDDPa1vL+8uEKbtGSFmwnUdi+lNEeW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAnwKjTx; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAnwKjTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737879973; x=1769415973;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=g2zUwvT2x5asVsGN/G8QEKFYKI8JtsEIR7l9AwzkoGY=;
  b=KAnwKjTxiiDlncNhUynKGwZzuZpLfnPZaGgYMPVgFVWx0FK3mQciOy5w
   INEg4g2zZ7xGsiF0OpdwW30WZElayyPEk355UUltKpNfgeB0xI7A3tZS9
   K7OtGMRps3K5picBUzexZ7S2v+qyhRMCgzKNwmsSI+EzQluwe4bO/9hN3
   D2R/61JgmaZbPO8h2TRfJm8Dgj8GJ+lfypYyM2N+/pt1n58LUnnIuP2sO
   dCjjk7zw3wsNocKNFcz8EzdHL079smgmAaVxJGp+uuQtTl94y9ykLNTJE
   TGPyRkYJI7YfkZQbytBBJRDQk2F6EPifwKnWViiBuneJ17kyPXeU/lEc3
   A==;
X-CSE-ConnectionGUID: P8a5Aff3SlWpTizfANS4xw==
X-CSE-MsgGUID: qolggzmTR969xWqYrihWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="48866657"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="48866657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 00:26:12 -0800
X-CSE-ConnectionGUID: vD9Z8w+ESwiVa7h0EJScjQ==
X-CSE-MsgGUID: XK7KhC7lQE6Li/uWHlKcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108014833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Jan 2025 00:26:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 00:26:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 00:26:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 00:26:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsowliVOVb5NbVzoJ+KwQNnMoJJHIcl29vC1RB8q0KiBu1n9DV7tt1a//gwEQkZ7pDqSoKGhTX9viIFRG4jqYvh9GMozN7agkFHiWhtYXLq59rCFLL42bknVCQ9/gzjInGZkiGtPOaYuujUW8RIcv0OBaeHrZ8lxuSuZUf8cyjFyk3kYV2MGUoD3Ycj/pBANdE03e0q7ezgZ4ZexdDHbhJP2Nxee1r9Rf487oj/UaBykaZelA0u0Ccg0LxhwNw8bJIXk5+oH9TE90iToHa7Ae7XrMhXQAniinb9h6zYLo/2yd+31vo4hb7VONFaym3TWmprr37AMSm1U2ateRtftbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFsdHXuT0VTFmVV4PlcuJxifQ+Y2vheYn4lxlGNV+NE=;
 b=bwhmkwqQp7PZgiCUWFymZm81tXWfBR164+sVrmyVRkS3UsZA+CSNE6H7Rq5X4hMz+++JURHWHPVjSF3HsiRfvuH9JKo32iKh3A9UzNZlNLxBTlrvDJipth/czp1lhrLL4bCsCSOBbrb1+RXIUOM67FFuniOnRzZYstYjBFHV/Y6vC/XtAtYb/c9/DNHMv0hboUy1f5fG97PxHZxifR32BF7p3yp8gAtVgFooaF2WTsoR7xmWPJihTKU1I8vJ6BhdXEO4R7p0vmwGCu/9+M/jmX9aXsXCErjVrtCFicXAT6a+oQ+KcBlAtPIKmrYUwQaToBSU/YmA8/VHsrGoHInk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sun, 26 Jan
 2025 08:26:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.009; Sun, 26 Jan 2025
 08:26:07 +0000
Date: Sun, 26 Jan 2025 16:25:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	John Stultz <jstultz@google.com>, <oliver.sang@intel.com>
Subject: [linus:master] [timekeeping]  ee3283c608:
 will-it-scale.per_process_ops 4.8% regression
Message-ID: <202501261527.c3bf4764-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddca168-9d37-420f-8afb-08dd3de31498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nyIflFLbFjOO1cVo5UQj/uGQjCKzrZUGluvcSzCO9ljbejBjkPXQR0nAob?=
 =?iso-8859-1?Q?ca0TVlG/HacwfgoIWwZPJsdzWIgFRclOi5yuK77HFEU8PbgGqObCP8RSTn?=
 =?iso-8859-1?Q?hLrgPuOzayBdboMYmrad7WuPrrroGFbm10SkuHNQ6R13CRnw+LHwE8emww?=
 =?iso-8859-1?Q?KF7xWAXH36At16ZfucWoHylfsGF2nh7SxyJlqZPtj+seEwMfE2Scja/S50?=
 =?iso-8859-1?Q?MAlu7ZD2CJ9knESY7CSQNaptw1BPJL5OX6ihZNchXH6fg48SBGbyToD8cU?=
 =?iso-8859-1?Q?aMSLBBCvcURnBapKaVouajJ2pUO4oLL3sxqQCsOY/AiSkhPLeWtCUaJHi2?=
 =?iso-8859-1?Q?G2QVrFMJ/pM1n8doloW7qsFEiYrv7MlFkfzzoaLUMgxGgoAnfDC8rNvlOS?=
 =?iso-8859-1?Q?YzVjleobqxCzCMT/mL0zZYddArEQuxjCxahJDk2OrkjvKNu4mIY0cgpvtD?=
 =?iso-8859-1?Q?8DDD3vZ2w8Z1rA9vAksJ4UDQi0b+evBJm5we5/3hjH3sz5jo8dZ5JA74X+?=
 =?iso-8859-1?Q?4BxWkkPX6DGe73I4ffLItdJf8O3WB16HgRxiliqUUC+0DVx0TINbgL/Xm+?=
 =?iso-8859-1?Q?71VBHg+DA0pg0oJ6SlsxzltVOC+1yuPBuPx+DdEQdu5T08DQ+59lgPKyr2?=
 =?iso-8859-1?Q?2lLSEYfz2AY4h6pDHlMEPkxHGIZYnAVLybHRCC9VpPeLBRjn96QG7tc6at?=
 =?iso-8859-1?Q?7CTkpUGRRAk+/dZmW+vXKszRKasq9OesOgMlaaiaCZ3WZcWTHw3FghbpsX?=
 =?iso-8859-1?Q?NaitMCS1rBhQECwgxkJoxi5j+Eb2oqMiMSMFwxsNS5hPpstjVBoQHHbEac?=
 =?iso-8859-1?Q?PWTkw/niepwvWW2/UJh0vHGc/yCSNA2awwTn9Frk2JjjrCmBAhnrb8MDpt?=
 =?iso-8859-1?Q?Zv0wGw1ujBS2IzKuLAe20gTmLAij+ri6Yypk0yoReyOMD+saE6nJI2lFrJ?=
 =?iso-8859-1?Q?N7NaU0e5zJ+0eP79z7HlVhcG8wPoablbIKIQG2oNsgyf2qoXTwAmQTieV/?=
 =?iso-8859-1?Q?SEwSvoXU+EHF9p4sTjSMF4h98sFGOvDPZKZA/U06SP5WNlL9K4UdvmQ7Mg?=
 =?iso-8859-1?Q?8ZzWQtSRVP7DkZFW0EzCsBvmpAcmK8c+74ewhp+CvRXS9wE5SHZNC1yboB?=
 =?iso-8859-1?Q?ne3nptUuqAwsld3sIPNL4V/gzpi291jzl7SF3ghMwnjv2r1EWlh7+oIYdA?=
 =?iso-8859-1?Q?OK/rAzcoljbD+fVu6N7YiQZv2XZdcV7b784xdPMyUVluWJiKSImsGsZN64?=
 =?iso-8859-1?Q?lOsd/bR1ux0EF0GdLNxxzYPiXIWQ9+cVRyIe49VdQPx9nlGFya7efTvd7v?=
 =?iso-8859-1?Q?SEt3kEfyhItp38RF/qfCsjs3v//3Y7zaT3xR1LqsOVFEhMy0118RYndPWq?=
 =?iso-8859-1?Q?VbsTSFvvtKMbX8zAS531ZFFzFpHY7PKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y+0CRCI/tr//4scWDSYM+V2eNIQM114cPXQ3DvEoSEvBe8QawcKSJQ8E15?=
 =?iso-8859-1?Q?ojbZe0mx2MNf5y6MtoGg0KEtLV/C7d40duyZGQQngUw5AQb6aC/mREwC36?=
 =?iso-8859-1?Q?iR9lPmqQcVe293Qh3jVIRABBQbRKOx2ba0m37ZO3D8o/aFxNPBDm1Tm4j+?=
 =?iso-8859-1?Q?IvMPMMZYPHEMccHmCYlizP5CEcBrorAwghjbabK5okpCfG5b2LiECg3lRb?=
 =?iso-8859-1?Q?Z+cX5cfe32JCcs4xC430K5lCpUQXa+KnyYI+bXYpr9EzoM0Szp2OWDhsYj?=
 =?iso-8859-1?Q?uMZfbmFybL7usYWnsEKDCIFRnS+BUijqTMAW66wWtXXuaKKEO87/oFocAC?=
 =?iso-8859-1?Q?1ThUKCTALm2IpW6qSSXyl/wa/gNCiUkTB6bF0xkUO65wmLSEBP752myYdA?=
 =?iso-8859-1?Q?tsBZyRbk09xL8dt+a8WkV22sP0M4NDotsHdqi8aH1GAi+nVfYsU7b9uLFX?=
 =?iso-8859-1?Q?M7sPA8GUlFrx9P0rjPEDykvi9vd+Wq3PPGq9rA5vbfXwumUGYQDkcIsYHK?=
 =?iso-8859-1?Q?ldMnSonltf8VynDs1BBm3f+UEt/vkckW4+Sb/MKQiKDrguaxEP4CLqOpXW?=
 =?iso-8859-1?Q?TN20jbnifWskWgXEhEK3JRZsysWoeF+ElvfMoJ+hNoEMir3p16Ctb9UxX7?=
 =?iso-8859-1?Q?/0c/DMeGBSyGDyZTuuqqBDiH2tU1NJfRJ1oBgXS86xFkhft9zCk460Ogm9?=
 =?iso-8859-1?Q?gMf9RCjRp70nj/J5Is1o8h6EAyYX7rR4s+SLmbAJSyexneoLcjQZ5Br9xi?=
 =?iso-8859-1?Q?/TGo2+29fE6mqcNL0/vnVK8BerdwGkNOswqG2umCNnY9Pp8Pd2wEs7ffJ4?=
 =?iso-8859-1?Q?pYtAmW34i+OuPkuq0sEWdfsMNEjZYDZ9YuXJ6YuPeGsP3DgDZkOOhO2vTf?=
 =?iso-8859-1?Q?hOj0DeT2PjsVAGVYamW8qANB7aQKG3OOO8IFSrsTNWDBVNuL0Sty6D0q08?=
 =?iso-8859-1?Q?Oy13JDvfoN2Ft8SYT0tHV6QDCK1rZ6bGD2sjHG7rMeS3hFXlb+sTJd5J6c?=
 =?iso-8859-1?Q?3WHtMkE4DAnOBb7iwJadGqowelPB38h5l6f5Lq9IJtex7YVpBHI7+ObdtB?=
 =?iso-8859-1?Q?juxdsUSmG+IWUw8AVlyDHIO/PptXZBQJLQtVvMsmSX2K5LIQ8rxjHyjA5E?=
 =?iso-8859-1?Q?8Mfghno3sac+b5TPW1Ifnc5YmnTSUZCW513+r70YXImGR30S7GB3aSJdyi?=
 =?iso-8859-1?Q?zIILQDGLv5L8VoBK1Pu6UGEsCRtfsImoIELoTSCvnELJ4V37oCPiZXwv75?=
 =?iso-8859-1?Q?vdi1KfOHfoRVfj/81PI4/Mbl9rHAFKA1kcTg2Sqie3VEEOSrAm0yvRjoY1?=
 =?iso-8859-1?Q?d1OKnNclW4LituGs/dB6Zg9akw6RRr5BkJTzcoYacuFJiNiIjwrdcriD2+?=
 =?iso-8859-1?Q?v+npJTnyfkMZZTEQKjPn4hqbyejso6GOB7D8xlKrs2mFz/5+aSiAtDjg7/?=
 =?iso-8859-1?Q?V4fte0N61XAcdmEU3zX1QBSt0zrVNJV0dPfgdrYj3SGkGNj+mcKhwKewKZ?=
 =?iso-8859-1?Q?+P6agRjgc60qREAzk5vJTh3j8tgQ9T9jFficMCfeibGu2fR7QMVGmSGt/V?=
 =?iso-8859-1?Q?nXCWfm1xJMhyfES2PN9dcbJM6m4LVgh67zVUrwgc0VCk57cg9MC8WpRCoa?=
 =?iso-8859-1?Q?PxOFDn601bXs9TLn4e4B7gLg8lltvA2viqL64mFExfwFnovxNKWA8wjQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddca168-9d37-420f-8afb-08dd3de31498
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 08:26:07.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvgxIQzNnLhU61TrZj0WpVnLD5Sw+PyS3PjpzEpG/csJsiIJzjxJcr+GJeDQQ2CosLxuYyIdO7zteQjKq44vNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
X-OriginatorOrg: intel.com


hi, Jeff Layton,


we make out below report just FYI since the results is stable in our tests.
we don't have enough knowledge if this regression is due to align.

+static __cacheline_aligned_in_smp atomic64_t mg_floor;

if low value, please just ignore. thanks a lot.


Hello,

kernel test robot noticed a 4.8% regression of will-it-scale.per_process_ops on:


commit: ee3283c608dfa21251b0821d7bb198c7ae3189f6 ("timekeeping: Add interfaces for handling timestamps with a floor value")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17]
[test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b183]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: pwrite1
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501261527.c3bf4764-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250126/202501261527.c3bf4764-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/pwrite1/will-it-scale

commit: 
  v6.12-rc2
  ee3283c608 ("timekeeping: Add interfaces for handling timestamps with a floor value")

       v6.12-rc2 ee3283c608dfa21251b0821d7bb 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  57550068            -4.8%   54794800        will-it-scale.104.processes
    553365            -4.8%     526872        will-it-scale.per_process_ops
  57550068            -4.8%   54794800        will-it-scale.workload
     43.00 ± 27%     -60.0%      17.20 ± 27%  perf-c2c.DRAM.local
    251.20 ± 23%     -57.5%     106.80 ± 16%  perf-c2c.DRAM.remote
    520.00 ± 33%     -70.3%     154.20 ± 13%  perf-c2c.HITM.local
    218.50 ± 25%     -55.2%      97.80 ± 18%  perf-c2c.HITM.remote
      0.03 ± 14%     +48.4%       0.04 ±  9%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.18 ±  4%     +21.5%       5.08        perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    653.70 ±  5%     +50.5%     983.70 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
    913.40 ±  6%     -24.8%     686.80 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.29 ± 81%  +42618.3%     552.09 ± 74%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.58 ± 81%  +65403.1%       1692 ± 72%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
 1.721e+10            -4.8%  1.639e+10        perf-stat.i.branch-instructions
      1.66            +0.1        1.72        perf-stat.i.branch-miss-rate%
 2.852e+08            -1.2%  2.818e+08        perf-stat.i.branch-misses
      3.29            +4.9%       3.45        perf-stat.i.cpi
 8.743e+10            -4.8%  8.327e+10        perf-stat.i.instructions
      0.30            -4.7%       0.29        perf-stat.i.ipc
      1.66            +0.1        1.72        perf-stat.overall.branch-miss-rate%
      3.29            +4.9%       3.45        perf-stat.overall.cpi
      0.30            -4.7%       0.29        perf-stat.overall.ipc
 1.715e+10            -4.8%  1.634e+10        perf-stat.ps.branch-instructions
 2.842e+08            -1.2%  2.809e+08        perf-stat.ps.branch-misses
 8.714e+10            -4.8%    8.3e+10        perf-stat.ps.instructions
 2.632e+13            -4.7%  2.508e+13        perf-stat.total.instructions
     10.62            -4.8        5.81        perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      8.89 ±  2%      -4.6        4.25        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      5.98 ±  3%      -4.2        1.79 ±  2%  perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
     13.24            -1.4       11.88        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.__libc_pwrite
     16.62            -1.2       15.42        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__libc_pwrite
      2.90            -1.2        1.74        perf-profile.calltrace.cycles-pp.file_update_time.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      2.38 ±  2%      -0.9        1.44        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      1.68 ±  2%      -0.9        0.79        perf-profile.calltrace.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.42 ± 13%      -0.8        0.64 ±  3%  perf-profile.calltrace.cycles-pp.file_remove_privs_flags.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      5.69            -0.7        4.99 ±  2%  perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      6.91            -0.4        6.53        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_pwrite
      1.23 ±  2%      -0.2        1.01        perf-profile.calltrace.cycles-pp.fdget.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      1.41            -0.2        1.26        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      0.87            -0.1        0.79 ±  2%  perf-profile.calltrace.cycles-pp.up_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      0.79 ±  2%      -0.1        0.74        perf-profile.calltrace.cycles-pp.noop_dirty_folio.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.15 ±  2%      +0.1        1.26 ±  2%  perf-profile.calltrace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      0.54            +0.2        0.73        perf-profile.calltrace.cycles-pp.folio_mark_accessed.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      0.82 ±  2%      +0.4        1.26 ±  5%  perf-profile.calltrace.cycles-pp.folio_mark_dirty.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      0.00            +0.7        0.67        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      2.10            +1.2        3.35        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write
      2.36            +1.3        3.69        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
     46.08            +2.8       48.91        perf-profile.calltrace.cycles-pp.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     43.76            +3.3       47.02        perf-profile.calltrace.cycles-pp.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     58.89            +3.4       62.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     38.55            +3.5       42.07        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     49.37            +3.7       53.09        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     29.41            +5.6       34.99        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      4.60            +7.7       12.30        perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.vfs_write
      6.68           +10.3       16.96        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
     10.69            -4.8        5.86        perf-profile.children.cycles-pp.shmem_write_begin
      8.99 ±  2%      -4.6        4.35        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      6.00 ±  3%      -4.2        1.81 ±  2%  perf-profile.children.cycles-pp.filemap_get_entry
     14.20            -1.4       12.77        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.62 ±  9%      -1.3        0.37 ±  5%  perf-profile.children.cycles-pp.xas_load
     16.76            -1.2       15.54        perf-profile.children.cycles-pp.syscall_return_via_sysret
      2.96            -1.2        1.79        perf-profile.children.cycles-pp.file_update_time
      2.47 ±  2%      -1.0        1.51        perf-profile.children.cycles-pp.inode_needs_update_time
      1.69 ±  2%      -0.9        0.79        perf-profile.children.cycles-pp.folio_unlock
      1.44 ± 13%      -0.8        0.65 ±  3%  perf-profile.children.cycles-pp.file_remove_privs_flags
      5.94            -0.7        5.24 ±  2%  perf-profile.children.cycles-pp.shmem_write_end
      7.17            -0.5        6.67        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.77            -0.4        1.42        perf-profile.children.cycles-pp.__cond_resched
      0.67 ±  3%      -0.3        0.41        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      1.68 ±  9%      -0.2        1.42 ±  4%  perf-profile.children.cycles-pp.generic_write_checks
      1.25            -0.2        1.03        perf-profile.children.cycles-pp.fdget
      1.44            -0.2        1.28        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.38 ±  3%      -0.1        0.27 ±  2%  perf-profile.children.cycles-pp.timestamp_truncate
      0.37 ±  4%      -0.1        0.26        perf-profile.children.cycles-pp.rw_verify_area
      0.69 ±  3%      -0.1        0.60        perf-profile.children.cycles-pp.rcu_all_qs
      0.90            -0.1        0.82 ±  2%  perf-profile.children.cycles-pp.up_write
      0.23 ±  5%      -0.1        0.16 ±  2%  perf-profile.children.cycles-pp.xas_start
      0.85            -0.1        0.80        perf-profile.children.cycles-pp.noop_dirty_folio
      0.23 ±  4%      -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.x64_sys_call
      0.15 ±  5%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.security_file_permission
      0.28 ±  2%      -0.0        0.26        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.17 ±  5%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.sched_tick
      1.18            +0.1        1.28 ±  2%  perf-profile.children.cycles-pp.down_write
      0.35 ±  3%      +0.1        0.48 ±  6%  perf-profile.children.cycles-pp.folio_mapping
      0.50 ±  2%      +0.2        0.69        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.55 ±  2%      +0.2        0.75        perf-profile.children.cycles-pp.folio_mark_accessed
      1.75 ±  2%      +0.4        2.10 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.90            +0.5        1.36 ±  5%  perf-profile.children.cycles-pp.folio_mark_dirty
      2.17            +1.2        3.41        perf-profile.children.cycles-pp.fault_in_readable
      2.40            +1.4        3.75        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
     46.10            +2.8       48.93        perf-profile.children.cycles-pp.__x64_sys_pwrite64
     43.86            +3.2       47.10        perf-profile.children.cycles-pp.vfs_write
     39.00            +3.4       42.41        perf-profile.children.cycles-pp.shmem_file_write_iter
     59.15            +3.4       62.56        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     49.50            +3.7       53.21        perf-profile.children.cycles-pp.do_syscall_64
     29.56            +5.6       35.14        perf-profile.children.cycles-pp.generic_perform_write
      4.74            +8.3       13.02        perf-profile.children.cycles-pp.rep_movs_alternative
      6.85            +9.6       16.44        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      4.34 ±  2%      -2.9        1.43 ±  2%  perf-profile.self.cycles-pp.filemap_get_entry
     14.06            -1.4       12.65        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
     16.74            -1.2       15.53        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.39 ± 10%      -1.2        0.21 ±  8%  perf-profile.self.cycles-pp.xas_load
      1.49 ±  3%      -0.9        0.58        perf-profile.self.cycles-pp.folio_unlock
      2.72 ±  2%      -0.9        1.83        perf-profile.self.cycles-pp.__libc_pwrite
      1.42 ± 13%      -0.8        0.61 ±  3%  perf-profile.self.cycles-pp.file_remove_privs_flags
      1.42            -0.6        0.83        perf-profile.self.cycles-pp.inode_needs_update_time
      1.92 ±  5%      -0.5        1.44        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      6.24            -0.4        5.81        perf-profile.self.cycles-pp.entry_SYSCALL_64
      9.82            -0.3        9.50        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.64 ±  3%      -0.3        0.38        perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      1.06 ±  2%      -0.3        0.79        perf-profile.self.cycles-pp.__cond_resched
      1.74 ±  5%      -0.2        1.52 ±  2%  perf-profile.self.cycles-pp.shmem_write_begin
      1.24 ±  2%      -0.2        1.03        perf-profile.self.cycles-pp.fdget
      0.45 ±  3%      -0.2        0.25        perf-profile.self.cycles-pp.file_update_time
      0.98 ±  2%      -0.2        0.79 ±  2%  perf-profile.self.cycles-pp.__x64_sys_pwrite64
      2.73 ±  2%      -0.2        2.54 ±  2%  perf-profile.self.cycles-pp.shmem_write_end
      0.72 ±  5%      -0.1        0.58 ±  4%  perf-profile.self.cycles-pp.generic_write_checks
      1.14            -0.1        1.02        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.36 ±  3%      -0.1        0.25 ±  2%  perf-profile.self.cycles-pp.timestamp_truncate
      0.23 ±  4%      -0.1        0.15 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.60 ±  3%      -0.1        0.53        perf-profile.self.cycles-pp.rcu_all_qs
      0.81            -0.1        0.74        perf-profile.self.cycles-pp.noop_dirty_folio
      0.20 ±  4%      -0.1        0.14 ±  2%  perf-profile.self.cycles-pp.xas_start
      0.81            -0.1        0.75 ±  2%  perf-profile.self.cycles-pp.up_write
      0.21 ±  3%      -0.0        0.18 ±  3%  perf-profile.self.cycles-pp.x64_sys_call
      0.26 ±  2%      -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 ±  6%      -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.security_file_permission
      0.21 ±  4%      +0.0        0.24        perf-profile.self.cycles-pp.testcase
      0.77 ±  2%      +0.0        0.82 ±  3%  perf-profile.self.cycles-pp.down_write
      0.24 ±  3%      +0.1        0.36        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.30 ±  3%      +0.1        0.43 ±  6%  perf-profile.self.cycles-pp.folio_mapping
      0.35 ±  2%      +0.2        0.54        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      2.74            +0.2        2.93 ±  2%  perf-profile.self.cycles-pp.generic_perform_write
      0.52            +0.2        0.72        perf-profile.self.cycles-pp.folio_mark_accessed
      0.55 ±  2%      +0.3        0.87 ±  5%  perf-profile.self.cycles-pp.folio_mark_dirty
      0.56            +0.5        1.10 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.48 ±  2%      +1.1        2.55 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      2.14            +1.2        3.35        perf-profile.self.cycles-pp.fault_in_readable
      2.20            +1.3        3.51 ±  2%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      4.59            +8.2       12.80        perf-profile.self.cycles-pp.rep_movs_alternative




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58233439F
	for <oe-lkp@lists.linux.dev>; Wed, 18 Feb 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405875; cv=fail; b=UWUGuLzFhKWNczLbk840/g76KixuZbvXS2UWGY8Sj9RCdSB0/L/TqWl3BgrHLyy2sr4JhAIdhKi0tCvA+mo53vxD1kOES6s/D1/MMRBC9ypI/0RL+o+tddLm6pPcEyE52CsxHj1/maExuhCTcQEULbQRMBycXy94TVe93VeXG9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405875; c=relaxed/simple;
	bh=sDDBAF5upBauNAOzDqqJTO2WJ5ebLoEhzqnejLVTi98=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KvgBMWVBZ+Y7+upPSO5Umr9ZSjqxLXbliCKapnu/hHE1YuqoMh9RixMaotpqCMX8VE4AtHfZCpqEmR2O/DGe5Eud+k9e3qwqDYTUU0A/wp2UXvUdbblo9VHkaluXt82zO8i6qQdqTo+xnPT3JiyauH0HGmr9RJANdLmW6/nWEvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBjt7o0i; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBjt7o0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771405874; x=1802941874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDDBAF5upBauNAOzDqqJTO2WJ5ebLoEhzqnejLVTi98=;
  b=gBjt7o0iATa0BDHJUpqYL9thA099tzLiVvrcA4GGhKceg4TX/6EHKwPp
   p3cz35aLKfvuS3BTwm64EROI5ah3eEWNkPqrkOoDiYgnVSw6AtcAY1SCL
   CG27e8rZNbosEabdT7w5mwlj2AOMnRf62NoJT3NG5J6WrcH1L8uGIgCZ1
   uVJN8mQZnRtNlI4Hwa6hm4fuloYI8vLdJ9IridH8GBFZp02jNDaPhWvT2
   Wyzz2iXs8srrf0Di1/fdEEjyk6KYaWAe7O5C57lbaRJh3/MksdxtQTKCL
   2H2xPWUV8j9E1rixeAka0cBWo7P96R6pRjKQAUQ80E4BSu6z/lHImrchu
   A==;
X-CSE-ConnectionGUID: sZU7UBVSRvu8uVApeYkAOA==
X-CSE-MsgGUID: N1yFlJpkRaKl/U8DCTqV1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72524756"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72524756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:11:14 -0800
X-CSE-ConnectionGUID: B6M/ccE8T4+ZUzSdW+ZG1Q==
X-CSE-MsgGUID: P+LoEOZLT82VHu0/kYeOKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="242984298"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:11:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 01:11:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 01:11:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 01:11:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzHtUSY7uUiVIv57iSRCyfuBtfSV05n3g3rdmZGbKOskPR9T7jCGf2oLV5KFMHxBOjch5CSQbsAYPYJjNCO0uTPZ0JLTbxGEADlCiAmVLxQUCItLUtmbZBtffBzNUyKbafRb59/QEOu66hkFmZunsnxIKpwjYC5yVhAFal2YhFeMTD9aAjjg0pVbNFYz7aZ263f550gS/qSPROwjR/5tNidN2OToLv28RXbiF0T8hmRHhUf4EYmEEMRK0Sz4a6Ih6uAirH+2nH4ZuTey0Em/4pYCx85IUQMO/R+1YZE/H4qpZuK3/RaUlzaiczCWqFGI2mvD7VocW7bPdA4HYGSM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lW0Ydlm5C8kCF3lBNWYVJQIT7ePN2ElkKLeEIZjfcjo=;
 b=ZCkDTx1cSmcpV3umjPj0YZnEK4dD/2w37/+0tnGwuxYVy0AK5G2uPRrYaklaLiAD7dRzWHIAwbuWvwrVi9+1E4Q3B5SisbStkpyJ6N1S4J0mywUSBNqF8GLYShKAguOEJyGGabhLGeZ9Qjwdv6R5XrJk/GzOssoNiqOxy7gnOBJ0XucLikJ8JWGiTLzQqVa6Ynxbvf7w0yaXS+9iKOQYTkA7ZU8XaGzFkRM3GHCCNr8eDEauIfHCELSIfYTVm6vHocdCPc7HMuo91l8wjCQgYrJ9CRZiro1lMgIYjXgrnXlJ1ARdVBtQodi//aYHyrsGddvbyvtX8Ad+aPFN0wWRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:11:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 09:11:09 +0000
Date: Wed, 18 Feb 2026 17:10:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kuen-Han Tsai <khtsai@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [usb]  56a512a9b4:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
Message-ID: <202602181727.fd76c561-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1P15301CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 64aded1d-39f1-4631-2d6e-08de6ecda7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JXsb2lvowyV99c8+dHCUg2STWgqukYu1B7KCIp86B/ucpgIsHe57Poq/vpBU?=
 =?us-ascii?Q?8F7OmitlJ2FowDnsjYO0TLK3dvmFATWh8qUX42IuPmw/2I/JJWBdEA6k6XaT?=
 =?us-ascii?Q?7ZIqiQGb0Clr1k/qRwxfy0KTREnLwg9B0+HE6DskVtAMkEh5g1syQIuyiyhf?=
 =?us-ascii?Q?Ssnf8NfRv8TkfT9nyDdUPXHiB9kuajFTriXoGEUkme9f2W/DnfFV23ZCYS2l?=
 =?us-ascii?Q?Mqn+/LtPucSnwYNSBqzGYwRqcq6ChuL5EnZZskbLT1DbWToTuV9phGjga2Gh?=
 =?us-ascii?Q?kMwElgdgAlIChxsLv1yRneh/IWAh+7nGCTdtI18GvJv66VHvVHomhaxkjKq1?=
 =?us-ascii?Q?PpXSXFnssUUqy9pfCWd/RgD5oVh6vA10NZoFEb0fCy79bo8Yw3RWhY6UyqW2?=
 =?us-ascii?Q?j6CwAsKIoFXIgubXhDpM0gAQ8ohLN8nAQxJZDoWfh/WtcU1Xw3Dwx7nnIcq3?=
 =?us-ascii?Q?2+XKVF1OAcy2/9y8upQzLqS7+LqqlYgWUa/zuH/y7TSit0KSIoXpWdgc2k8X?=
 =?us-ascii?Q?41y3B8eS/pe8VzWBL9KokTwe2vZeojcsFSIWO4rzI6bht7/48n7Fa5mdN/9M?=
 =?us-ascii?Q?OwFFlsRpNHlD5NIial4sty0vAWXXUFFFq71qWtCCnnJD0Kuyzp6Mr4NwbpWV?=
 =?us-ascii?Q?2oXZosiCqFbj8tLRJz1FotFP7hbGx4xO6ulFS6Z1UP/ixlnfOV+rIOoXVkw2?=
 =?us-ascii?Q?oJ8c9exP7y8om3YF3GtOrhBDycPBE/oKxU5IZuoFRZ7TydzWFjlmHe57jqsL?=
 =?us-ascii?Q?uoA0uLv/EPNHHUSVtax8JFAGrMh2eod4ykOZItFSWBQTwYHsE7J2kcfdwbu5?=
 =?us-ascii?Q?VBHpO4PvpV1X30YHBoIE5qRaGNnl/1Cr2I4Jrl9zhds6HkwLSmdsWPG+YPX1?=
 =?us-ascii?Q?uLTtwGyVDUgtYtyFR6RwfaSnvZhdc2kdAbUMpjg6RJw8fCkDWX4IBy8GqjPD?=
 =?us-ascii?Q?yIQK//POk9zTIg0FA6totYPPDHqZDLOOsTMkf8z6KvcqFEHOue+bjqO7Av/B?=
 =?us-ascii?Q?84YTpPnyY61YjzSZtLEYPzXleevTl7ztE0cPxWz4ZwyoEM7bu1Nd/3h1XzQB?=
 =?us-ascii?Q?Dx75WyCQi4swoHkTf4TM+NN7rKQ5t8SoioZ0OELRlQlVyHqgK1Mjch5Cme0x?=
 =?us-ascii?Q?urDGuelJPvRmZRPmz2Y99TY/pVrKPP1hPlOXJCJMvyHjknJEdX9/iUaSfBhZ?=
 =?us-ascii?Q?3yvaAOxmVkcQP6hLjX9GUGdCLgjcspI69zG6vwfFl6UV++OLPE0qQrNkr0vG?=
 =?us-ascii?Q?Eg+lF8seaEMfDyoYpjuvBDjNGcOUpTRmR8IpSLk+DWn00nzLrVquI0wPpmIO?=
 =?us-ascii?Q?TTU/PW66k54TriSJhtzj671aQs8vDxYiZgVOnX65GnLk7Aivr1A9uDsr3fXy?=
 =?us-ascii?Q?gNGNrg4Gf7Tki3tyz/aSdeO1M+99q8H5ni8xS1EbtfrPwSMVaQ33fIa8LAV8?=
 =?us-ascii?Q?gciFxFddD50zRMN7sFo2VEi372JLgtI6LjKNZaEgKe0TdrrQS39mwcuy+WcZ?=
 =?us-ascii?Q?Q9Tyu2e6ltI4rpACx4o+4NRScp5PIs6nIBfRAE66jAmZm3zNkOQfEEoSr7kQ?=
 =?us-ascii?Q?qezd2aMyM6bVRLzgNDzYZpRBXg6ljKAU8KTlG2iN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtjULTjXGckqSviSvr34WJPaY4Z/QW1ShjV7eJqTAp4wt5ppmu8syFMIZWpE?=
 =?us-ascii?Q?3UtHEaeF8u82LAdgWUmSCPAc2ogk4qPTgq8AU6xyoQaKNrPm+7mF/xqe5Jw1?=
 =?us-ascii?Q?jeJMDzWEWmtHEVSgEyBhcmdWDbNqmoYYePukhpvvx5BaCOpAqW9OUVmtV9Mg?=
 =?us-ascii?Q?L6f4UaR8lKsq+uY3ZIw90HvnEP4LBWtTSILQbrkLI9P1+xEuRyRrq0cUuxh5?=
 =?us-ascii?Q?maN8igFAs9Hs9fCKd2C18GcDaq3EjbLkQ7WFwXwwe8L8IvvxNxIEAAJ9NOev?=
 =?us-ascii?Q?xlDH444rrWL8/zg7j0rDUQWlzer4N0LoE3I3a90sWK1jYbBIPEYT20hQdsBt?=
 =?us-ascii?Q?Z9BsjPuAUcmiRU2YsysxcNqD46LWdK/nJr5egEsVEst7q6QXcDTL9e0Evz20?=
 =?us-ascii?Q?5lSbnaDV6QitBn6cuRlLCV5dAGwZ18fj0Rb+KBPhEtgGvFfrLhmdOPA0cR+Z?=
 =?us-ascii?Q?VjjJvnqEDNNig6bE2/HuVKN7srSUPTQ3V7ZqcIliLjdENOMkRKKsB7fT48Km?=
 =?us-ascii?Q?8SV0y11Z6/yCcgqbi/32whDsz/Lzhots02TBcHdNpwyos7RyrZf/LeBXCGfB?=
 =?us-ascii?Q?hY0XNzH9rwwE3bq+WIjuCBKicYTB5lF4o59X0/3uNuVzzCBGU1uAIP/81xiN?=
 =?us-ascii?Q?xesvPtgD6zaoyUWR/4CzVeAU19jVAvKdSYaHWZil/liqoOlvhjW53J47NGxy?=
 =?us-ascii?Q?dkiEjo25VDEEFPfIaoAdzBvLUWRlzZufcMc4CP+vZV++JANW+HsL0NLUWdwk?=
 =?us-ascii?Q?rafldCdVT1Owlx5LysCU9jS+vN8Y26gsAzTcW77us/db5fLy67nHKVTd4UN7?=
 =?us-ascii?Q?o8qVdIvaDt7HrbBVAGQz+E9JHo319jfC+UqEJ4D3oyQKGGyuqJ/LwYgPNNIC?=
 =?us-ascii?Q?8HTzAb0txUMbd6KyU5kAUY3sj/lxevINici3HdZw3MgZ9tNGeZWepQkUIk5z?=
 =?us-ascii?Q?FC2BNkONkvvF3aE2016dLd9J6RVmRSgVACgu7HSbjE+RUAWvylPcJ0O4zyVF?=
 =?us-ascii?Q?IWG235f51hkrCSlAjVBrBRguidhlGiabl2QaeoMYr0k1molVzXaAH6nQg6ox?=
 =?us-ascii?Q?L4p+DfUtHHi35ZeDTMXms/ddN7jNp25JBL12D9E+H4arHm5+xTBkLB5+dGqo?=
 =?us-ascii?Q?kGxgPkTapcNwovcBiAw/6OCplP3uh06/B0NmYWdpMJ8kYl+h5VT4dluWDHaD?=
 =?us-ascii?Q?aM+Kt9rbaA5dEHq9Of5vYPKzwTuTxll/C6rnemjKmILr40Kw+6Vui+cfzaHz?=
 =?us-ascii?Q?WSi4jWtwja7Ty4uN2uj2nCjWs/Vu00/MUZXE6udPzyaaArj9rafw3eFUzEXF?=
 =?us-ascii?Q?1JHJ+/KkesVuSZA4IEFXKalZ23UIi/AB9aM35I7msrINAHyF8OPGGGJruUnp?=
 =?us-ascii?Q?ukB41ndCzasFUwbJ0y1clvEir3r8pLrbEdyG2+EtI3s3Wc/6aD8p0EQBOw1H?=
 =?us-ascii?Q?dITN0QtR2URd9r2evtVpIpI43wPo9abonF21aNDxZF+eWGIuyTnv8ru+FlL0?=
 =?us-ascii?Q?fbZVjJfatzMuhGR8NtLqirMjygDvmFPVWsVGdAnJq7ze3cKTqDPhZdLvqYJN?=
 =?us-ascii?Q?OALHPJ9ay08BW7mIbVmB3+9ho+GpsEonr78DZHYKlsXhAmpyzCZbyonHtCaK?=
 =?us-ascii?Q?95azPzV2+w0V3YLw51JuyPH9TgotUElShbQH4TkdZUkPIywZx6Q/Ld3rdGAs?=
 =?us-ascii?Q?Vf19Cdqij892ahmeyqyFaWNo1KRucZzLK9zhGDGJbuYbjdzQqGQE/qWrEdJB?=
 =?us-ascii?Q?QV3i1BwCCQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aded1d-39f1-4631-2d6e-08de6ecda7d5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:11:09.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GogUSVQUqsElRt22Vo7CgF1mmZIJEI6YoG8t9Zik4ntniLq+1lUIy7rjefEUF5OQjxOHEBkRYU2reCnWLrn2mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN" on:

commit: 56a512a9b4107079f68701e7d55da8507eb963d9 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


in testcase: boot

config: x86_64-randconfig-002-20260217
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602181727.fd76c561-lkp@intel.com



[    8.960483][    T1] usb usb1: SerialNumber: dummy_hcd.0
[    8.962200][    T1] hub 1-0:1.0: USB hub found
[    8.963048][    T1] hub 1-0:1.0: 1 port detected
[    8.967283][    T1] file system registered
[    8.968024][    T1] udc dummy_udc.0: binding gadget driver [g_ncm]
[    8.968851][    T1] Oops: general protection fault, probably for non-canonical address 0xdffffc00000001a3: 0000 [#1] SMP KASAN
[    8.970049][    T1] KASAN: null-ptr-deref in range [0x0000000000000d18-0x0000000000000d1f]
[    8.970973][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.19.0-rc3-00025-g56a512a9b410 #1 PREEMPTLAZY
[    8.971938][    T1] Tainted: [T]=RANDSTRUCT
[    8.971938][    T1] RIP: 0010:gether_set_qmult (kbuild/src/consumer/drivers/usb/gadget/function/u_ether.c:988)
[    8.971938][    T1] Code: 00 00 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 56 53 48 81 c7 18 0d 00 00 48 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <0f> b6 04 08 84 c0 75 07 89 37 5b 41 5e 5d c3 89 f9 80 e1 07 80 c1
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	f3 0f 1e fa          	endbr64
   6:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   b:	55                   	push   %rbp
   c:	48 89 e5             	mov    %rsp,%rbp
   f:	41 56                	push   %r14
  11:	53                   	push   %rbx
  12:	48 81 c7 18 0d 00 00 	add    $0xd18,%rdi
  19:	48 89 f8             	mov    %rdi,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df 
  2a:*	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax		<-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	75 07                	jne    0x39
  32:	89 37                	mov    %esi,(%rdi)
  34:	5b                   	pop    %rbx
  35:	41 5e                	pop    %r14
  37:	5d                   	pop    %rbp
  38:	c3                   	ret
  39:	89 f9                	mov    %edi,%ecx
  3b:	80 e1 07             	and    $0x7,%cl
  3e:	80                   	.byte 0x80
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
   4:	84 c0                	test   %al,%al
   6:	75 07                	jne    0xf
   8:	89 37                	mov    %esi,(%rdi)
   a:	5b                   	pop    %rbx
   b:	41 5e                	pop    %r14
   d:	5d                   	pop    %rbp
   e:	c3                   	ret
   f:	89 f9                	mov    %edi,%ecx
  11:	80 e1 07             	and    $0x7,%cl
  14:	80                   	.byte 0x80
  15:	c1                   	.byte 0xc1
[    8.971938][    T1] RSP: 0018:ffff8881009df660 EFLAGS: 00010206
[    8.971938][    T1] RAX: 00000000000001a3 RBX: ffff8881020fd400 RCX: dffffc0000000000
[    8.971938][    T1] RDX: 0000000000000001 RSI: 0000000000000005 RDI: 0000000000000d18
[    8.971938][    T1] RBP: ffff8881009df670 R08: ffff8881009df5ef R09: 1ffff1102013bebd
[    8.971938][    T1] R10: dffffc0000000000 R11: ffffed102013bebe R12: dffffc0000000000
[    8.971938][    T1] R13: 1ffff11020105216 R14: ffff8881296b4c00 R15: ffff8881008290b0
[    8.971938][    T1] FS:  0000000000000000(0000) GS:ffff88879974e000(0000) knlGS:0000000000000000
[    8.971938][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.971938][    T1] CR2: 00007f70208af0ac CR3: 0000000004a7c000 CR4: 00000000000406f0
[    8.971938][    T1] Call Trace:
[    8.971938][    T1]  <TASK>
[    8.971938][    T1]  gncm_bind (kbuild/src/consumer/drivers/usb/gadget/legacy/ncm.c:140)
[    8.971938][    T1]  ? gadget_bind_driver (kbuild/src/consumer/drivers/usb/gadget/udc/core.c:1629 (discriminator 1024))
[    8.971938][    T1]  composite_bind (kbuild/src/consumer/drivers/usb/gadget/composite.c:2553)
[    8.971938][    T1]  ? suspended_show (kbuild/src/consumer/drivers/usb/gadget/composite.c:2529)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260218/202602181727.fd76c561-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1825F798
	for <oe-lkp@lists.linux.dev>; Wed, 17 Dec 2025 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980941; cv=fail; b=idC/jF+8ttMxL/xcixE7ikqcUA2PwwVK7Bqxzf6VWl9X8U/CySAvQqAZY5Xtxo2zVNDsG0+Ot8Ruk0L3r4sLGOcpkps3JCQtBIRErH09S3C23ytynWVEoziBdpSlfbBUme+AWzMXEcn/LHTa/W43uVCKupypCtRj+ubpqKfHDLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980941; c=relaxed/simple;
	bh=ipsa/nxq481PU127qhhAZhYGGyQ/qX9muYH6vvPn2po=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EZfqEsQETWsCHjwYOp8if0SR14jrbgG2odOL9NnHQn6dimU1/T8tEb32erd78/SrzbagUS8Ev2e7pNvWtb1ssFrmVKQu+YfKqMBDuVf+smEi+A2heXCWVkMpal8Nf8sp4g5XyGfrEbNOovKMpAOuWsYnUY9hRPt9HZlQEhPwBbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKisFYZT; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKisFYZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765980938; x=1797516938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipsa/nxq481PU127qhhAZhYGGyQ/qX9muYH6vvPn2po=;
  b=cKisFYZTNfjaQnf5PIhBwGv2Z6qGZcqSq6OFpbzRXNMnR790al11YemB
   4ByhK86SRwI8gf/kOD54M2OpfGqQ3I2t1WZjmzd7WuSjIU2SUGxLZPrYi
   GGLCf+sQ4znHHrEfAPFm6L9YhRN6w79KHGTgTYIJTUinLsZ+dmCoFdM2/
   qDdHylT94Tr6adnydc3r0BBAVsvlTIOYFOy8N5bqApssecUqhEu6FHWfh
   VMKshkJ1Sgohr/HyfRVDhfTGxmciqfIO/irUFU8mT4AcsLW7Vhr6aQ7Sc
   PShn0jT8O+phPc54nTK+4C3ybrHa730YMZDxYf/kFMd05l6YlWsgWD3KE
   A==;
X-CSE-ConnectionGUID: xqHSTWTdRKiwgxw4wYLnIA==
X-CSE-MsgGUID: hh92g/HtRrGbTB5VEOhl+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85334651"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="85334651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:15:37 -0800
X-CSE-ConnectionGUID: g2i9X4xOTP2m9AiyBP3BWg==
X-CSE-MsgGUID: DSxGnFt9T3Kv1gIz8BgsXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198801425"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:15:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 06:15:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 06:15:36 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 06:15:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/juRP8R3eiSBlzuTeYWV5FlwLXfG9DTkKxPZCfL0O5e2Ns+qH/v7t3ltcY6CztozJo2h9/MQmP9+Ax1IQhW3EjMMgUtu28r/NBHoVl9hTilCJ0c6GaqPjNzn8AKpKkl91GllSYGpbZ4g/phbQAZBAeFAq+JMZJGLa5yIQJd2XvDzj3pndbHZKy42T6roZ3rDQIOzkQc8xI7SRNM8kqPXY8Lml8/TqbJ6kCHSFy8gtXfOHtt5UyWrcCwElGUOG0Ob1EbDNeaa69Urh+qXCWpiSstc+dMD8Ud2+F4xxMq1LMr/F3qNCnNO3prpCVd6BZYkG4dpLQnpczzDy2lxd/xIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGpZ9pmLUhzEMZ8f8835hUOOgJeKPBzItH5m3mmFHcQ=;
 b=L7C4zl1Py/GRrx0lL9D09QJFfqMQoHGkhjpG5LPtRO4fQTU3YhUyrWpeg4215Z0nbodhlzAvEWC50607eyqOE6OcZhCrrydXaZzszvdUdcL1Fe/zOKmMM0Z0Q8zLo4/PA4k2xUp/79pB63BNGD94ZnFlpR/MX9MALckTayUaYzCdEm1bY41kCHGqLmigKWiWuvCwsHosIKCrqfaA0tCeScO/BunKhyDu4jDOrAh+d3LRc3MjN1ilh9svlFIXLcAA+l2Zkv9yFT6jGeoU0NwJn3dwwkr69k9xOza90VPfWvdm+/phvImneINNpt/EZ64QWgvyrCTVFqVCrxnIdoa6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 14:15:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 14:15:33 +0000
Date: Wed, 17 Dec 2025 22:15:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jirislaby:devel] [serial]  2dd9c2acfb: WARNING:held_lock_freed
Message-ID: <202512172240.63ac762f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f7694c-a826-45d5-46e1-08de3d76bdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H8i/hmMMulqfA+bMITsDxePHjpjT10Y4KXgEMvtMZ/5Z//KGUGn7nyn5v04O?=
 =?us-ascii?Q?NDA+PT+jhhPrXzw8lFussdWSG86kFXZGxIMqqzk88uQll4+1dkJHOwq4jtoU?=
 =?us-ascii?Q?o6jDvCuZCwPcZoeQ7LP5FwvXOTUCKyLVf5qhIAcp7tlOGnBGc3WoWOy+SNUs?=
 =?us-ascii?Q?H/fyVA4hqC6r6IXW+PvPcIO7JYi+dsetaWGu+dMHPft6h82KpjixgySSlzXR?=
 =?us-ascii?Q?MEy8VihgTGhuvIxa1KFzYYHgrLX+4DZIDKY4UUeOPbCj4ENncoqmu0BTbX8J?=
 =?us-ascii?Q?qiZu2C9g8BV0j5WiMb57uex/VonFeFBHtj9lbuxAyden72yZBtIuvNlVEYRN?=
 =?us-ascii?Q?M3pu+HEHk7320QIiixZ9Aujo94FFZHshFSXqccQxoTXobhFFDI/ATI69UOeS?=
 =?us-ascii?Q?AWRopKBt9kpfPJ15sH3nbhoKVE2Wg9NLtebHFc11f1sEy0kSPF5OWcySO1+c?=
 =?us-ascii?Q?WUnKkO2mFMonN4R2NTpzNUbeN/ss1H+m4kOGwScQse7nI+GWu/8s7GjcKDAI?=
 =?us-ascii?Q?sIQxQHVUqgrtychqx6SkZjCxDhzsEjJXEmjeRxe8HwYbEB2xqMpk0itJWw+7?=
 =?us-ascii?Q?eIATPJyWZ5PpjxUH1G//CekCeq9ugU3mxM4RRdYHS+uuTWJ7UCIlTqKyWjPI?=
 =?us-ascii?Q?hfvY7WE3cCJ7ltzZvukR9hHFw6mvE1jIgO4yFJxRaDHPMRQ4xLJ/sM6fk6sV?=
 =?us-ascii?Q?4hz4KpcSnsUcWDqMw46hTfR4w/0OGYsm8wsg9mihkq/qrEbITaxRgitR0zmM?=
 =?us-ascii?Q?b3Z3m7oy7zNXdTYDigU8WdyQ5oJ9i5nLdCOKuw74FR4Qn4XynYkUMMAJ8Otd?=
 =?us-ascii?Q?QwWWbP0b0RuNIPryLmMF0gNHo+vARwBa2rYyWg3cIRjGRK5AQoGbFspmc5an?=
 =?us-ascii?Q?gAvVXKJ3DrAc6yju041PPD/6+Xc4HPXIlIKzHxR6wOYBZolLIz6OydmToREY?=
 =?us-ascii?Q?f5dqGOPturxVPIceU3Tr091ryhFFV1IBcrRAW1SAqEDVgyaSpJsTMBo46UZP?=
 =?us-ascii?Q?P8Ebwnwm3vzvL7TEFAoQHBajp0qz73QJlcPSWza0bQCnttbIlWUjPSKDSpo5?=
 =?us-ascii?Q?Y17jgR7nIplD2MGBIzKMh7jIX3pYtxoYPkeph8GvlXPCfPMI9uNSyWPbvz0+?=
 =?us-ascii?Q?3Qy8k+yWmD9MkKoZ5z8IHzjFhOJD0Lty9xHSmRlR0uAM/+HLKaLsk6UcFzWx?=
 =?us-ascii?Q?C2PS1tE2QBi6lcCBQL0tLNiMf5K9mZuadanaFT7VHfs9Y0Xpk7luRs3ZEKWR?=
 =?us-ascii?Q?bY+gFZT2ATHY51QrkaSzVXjr853YmgE9eqACmQPNClfQyYndN2UOcpyLVbkG?=
 =?us-ascii?Q?ofR9WFGI9IuLr1UFBJgsPyW1Ix7wUKW+9sosw9aMeEBQHLY6P7JKf8r18C/4?=
 =?us-ascii?Q?aQfg43hodoKXr3BTlhxlf2QhoCWvZCdofIMvkhei82Fg/KIrYcK9OL+mLrvo?=
 =?us-ascii?Q?Cv5b1o+6J5dA4GRC85vDd9r6KzjBOJo574gFuIFkYZmFUhzkZN3vhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MKs4W/IFZ4qq0XgB3huamng4xn88rRR7JAc7DRxy7BoW8jl4gC0GK+IZQsH3?=
 =?us-ascii?Q?8aqgT72J/4rwpVc44+CUq4JZbOeA2kwp4mTs0BCa0g31j5fdb5yqSe0MxlGr?=
 =?us-ascii?Q?WtVppaQ228ChofEHP6iuDI46H7hpFINNurXgaGMHrz80g10Fu3SvgVflWKOt?=
 =?us-ascii?Q?b3PApiWzqDkQoX6YYnfHGEcW6kQgg6LeT8S8hfBhVMV4VxfjNJz7PYctbnJf?=
 =?us-ascii?Q?sLNR2UdGP2Q2QUwIjuLPk44vFpgD5kvrfVx5rwH1ABhyUDnP1C/qU8GAi1kG?=
 =?us-ascii?Q?dUX8pSaSixXKcEgxfHFe2tpa6rQy+Dc8i5FP9Fw5uVouiR8QYBhc7Esczjzs?=
 =?us-ascii?Q?5k4PdEIADFP7V4uQiYEFN3iZPRBxYmsvCzcSxlJsSjoi3KZfcxkQ5yBjX5h2?=
 =?us-ascii?Q?WGkMJfXulX3As3d8Bf3gMhz2y3TAGt99o80FiVYnkSY0DQgtyGIu1X5Xfq1i?=
 =?us-ascii?Q?EJjOxYZHqD24YOMUpyYBnEKpMJALGCslxDOnSSA7/craQUfcgNj+0vin0wzx?=
 =?us-ascii?Q?zTcnFyE61lM2Ixs97gybhtLaAQRTbh17gz5B+FNvzYFyaDre0nQ5d6fZfHzQ?=
 =?us-ascii?Q?Y5Uj9yrnQqawnxmpJF2AvW2TfzEpbxMxfmp1mTSg4+2t87k3AWQyEW9UGIvD?=
 =?us-ascii?Q?5eYsxF/W3I/HcVTNg82fcCCHBe0AVijDROlP/cGbCUHblefQXgPzB7OWIrmD?=
 =?us-ascii?Q?QFNxaGRYMGaAwSnpGBYCwAEESLNkVOZ81TL78XRylRaPhnW/SMMmDMeTCB5q?=
 =?us-ascii?Q?qp8lJyjg/vfazzSFDKawHJMBAq4xIhebibkKrsOXoZovfzwbht1sLq1J++oh?=
 =?us-ascii?Q?RQd+5w8oOA80Zz9rMRrgLsvl60Tnx8l1swZUiEOqgS0IquixcxrIDZxTuys4?=
 =?us-ascii?Q?FHQbUuHXcvhWlYMgAkQnaF/WaAA3t9gADIk0Im8Clg1lESKM+SVdbI7YCVe0?=
 =?us-ascii?Q?sBVhcvWMakj6LvP2lwHJo9TGBCg2FPeVsZ7xBFYLGzCnA+phpEz2++dma0MQ?=
 =?us-ascii?Q?UjKZMJ6/dJdzlY/mlmYcoZNBwmfmu0bhSW4TZCKjXygaT3dXQlfzFizhKWgn?=
 =?us-ascii?Q?OikbdZjYABvag6LmIgk0w6sSbCoieH/7sbcjSGAGnDn2X1YEBebC/sqcwGZw?=
 =?us-ascii?Q?hQlbD1U45ow/GPtyj0912LN7WUqfZJl2KVNn5Co0G6KlaajzJFv3WWgMdcyF?=
 =?us-ascii?Q?Iomh0V5Silregyo0a8dGi6c/7bfXVp1yMhyzMBQSVB6XzGKeiLYb24vs+HqY?=
 =?us-ascii?Q?0JxRXletwT1nxpCla3qke0LZlNgS2OQErDZM0uQLOWQx6+y2y3hudfDyf4BV?=
 =?us-ascii?Q?KfIZfc/IOZI6BkNYijUXYJTXad1/3hTucO5daL3FmkgpcpA7L9nBYWYvz9hJ?=
 =?us-ascii?Q?BT87In/fefYTbMN7RSUruyIuElMCl5lb0mjiby0FtjKStwtu/ZrE7D9QsZ0a?=
 =?us-ascii?Q?Cd5UC5LF6wKz8IJO/3v6RdYS74zEiKoBS8SsBnlzEKMCFd/IV/NxMUBjeVxA?=
 =?us-ascii?Q?/6cTq91KGotcxAqY3t7Gyl+UYk3xiYwef/poWQcFhJHRbymT10TLLzuhjcvO?=
 =?us-ascii?Q?eBtccQYAL71/wBbYNwfMG9PMDkEo9HONZFaQbkVtVNMguZIW1yx3qopknQUH?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f7694c-a826-45d5-46e1-08de3d76bdf8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 14:15:33.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNslLf1NhJAxYeEzszsC/4jpDxm7Nko3ZArxml0L5uPsPQ9py7MeAS3CR/IWNxLCnympSdufVVuF7/LypCGilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:held_lock_freed" on:

commit: 2dd9c2acfb03ee7a076cbd16ae9d3ee6f29bcd70 ("serial: drv->state -> xarray")
https://git.kernel.org/cgit/linux/kernel/git/jirislaby/linux.git devel

in testcase: boot

config: i386-randconfig-141-20251214
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | bd332738e0 | 2dd9c2acfb |
+---------------------------------------------------+------------+------------+
| WARNING:held_lock_freed                           | 0          | 12         |
| is_freeing_memory#-#,with_a_lock_still_held_there | 0          | 12         |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512172240.63ac762f-lkp@intel.com


[    1.149928][    T1] WARNING: held lock freed!
[    1.150447][    T1] 6.18.0-next-20251209-00027-g2dd9c2acfb03 #1 Not tainted
[    1.150960][    T1] -------------------------
[    1.150960][    T1] swapper/0/1 is freeing memory 43dba800-43dbabff, with a lock still held there!
[    1.150960][    T1] 43dba9ac (&port->mutex){+.+.}-{4:4}, at: serial_core_unregister_port (arch/x86/include/asm/atomic.h:85 include/linux/atomic/atomic-arch-fallback.h:787 include/linux/atomic/atomic-arch-fallback.h:1238 include/linux/atomic/atomic-instrumented.h:611 drivers/tty/serial/serial_core.c:3151 drivers/tty/serial/serial_core.c:3312)
[    1.150960][    T1] 4 locks held by swapper/0/1:
[    1.150960][    T1]  #0: 427e8b40 (&dev->mutex){....}-{4:4}, at: __device_attach (drivers/base/dd.c:1007)
[    1.150960][    T1]  #1: 427e8240 (serial_mutex){+.+.}-{4:4}, at: serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:637 drivers/tty/serial/8250/8250_core.c:700)
[    1.150960][    T1]  #2: 427e7930 (port_mutex){+.+.}-{4:4}, at: serial_core_unregister_port (drivers/tty/serial/serial_core.c:3310)
[    1.150960][    T1]  #3: 43dba9ac (&port->mutex){+.+.}-{4:4}, at: serial_core_unregister_port (arch/x86/include/asm/atomic.h:85 include/linux/atomic/atomic-arch-fallback.h:787 include/linux/atomic/atomic-arch-fallback.h:1238 include/linux/atomic/atomic-instrumented.h:611 drivers/tty/serial/serial_core.c:3151 drivers/tty/serial/serial_core.c:3312)
[    1.150960][    T1]
[    1.150960][    T1] stack backtrace:
[    1.150960][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-next-20251209-00027-g2dd9c2acfb03 #1 PREEMPT(none)
[    1.150960][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    1.150960][    T1] Call Trace:
[    1.150960][    T1]  ? __dump_stack (lib/dump_stack.c:95)
[    1.150960][    T1]  ? dump_stack_lvl (lib/dump_stack.c:123)
[    1.150960][    T1]  ? vprintk (kernel/printk/printk_safe.c:82)
[    1.150960][    T1]  ? dump_stack (lib/dump_stack.c:129)
[    1.150960][    T1]  ? debug_check_no_locks_freed (kernel/locking/lockdep.c:6695 kernel/locking/lockdep.c:6728)
[    1.150960][    T1]  ? serial_core_unregister_port (include/linux/mutex.h:253 drivers/tty/serial/serial_core.c:3114 drivers/tty/serial/serial_core.c:3312)
[    1.150960][    T1]  ? kfree (mm/slub.c:6671 mm/slub.c:6876)
[    1.150960][    T1]  ? serial_core_unregister_port (include/linux/mutex.h:253 drivers/tty/serial/serial_core.c:3114 drivers/tty/serial/serial_core.c:3312)
[    1.150960][    T1]  ? serial_ctrl_unregister_port (drivers/tty/serial/serial_ctrl.c:47)
[    1.150960][    T1]  ? uart_remove_one_port (drivers/tty/serial/serial_port.c:150)
[    1.150960][    T1]  ? serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:719)
[    1.150960][    T1]  ? serial8250_probe (include/linux/err.h:78 drivers/tty/serial/8250/8250_platform.c:196 drivers/tty/serial/8250/8250_platform.c:218)
[    1.150960][    T1]  ? platform_probe (drivers/base/platform.c:?)
[    1.150960][    T1]  ? really_probe (drivers/base/dd.c:583 drivers/base/dd.c:659)
[    1.150960][    T1]  ? __driver_probe_device (drivers/base/dd.c:801)
[    1.150960][    T1]  ? driver_probe_device (drivers/base/dd.c:831)
[    1.150960][    T1]  ? platform_match (drivers/base/platform.c:?)
[    1.150960][    T1]  ? __device_attach_driver (drivers/base/dd.c:960)
[    1.150960][    T1]  ? bus_for_each_drv (drivers/base/bus.c:500)
[    1.150960][    T1]  ? __pm_runtime_resume (drivers/base/power/runtime.c:1200)
[    1.150960][    T1]  ? __device_attach (drivers/base/dd.c:1031)
[    1.150960][    T1]  ? deferred_devs_show (drivers/base/dd.c:923)
[    1.150960][    T1]  ? device_initial_probe (drivers/base/dd.c:?)
[    1.150960][    T1]  ? bus_probe_device (drivers/base/bus.c:576)
[    1.150960][    T1]  ? device_add (drivers/base/core.c:3696)
[    1.150960][    T1]  ? dev_set_name (drivers/base/core.c:3494)
[    1.150960][    T1]  ? platform_device_add (drivers/base/platform.c:757)
[    1.150960][    T1]  ? platform_device_register (drivers/base/platform.c:820)
[    1.150960][    T1]  ? exar_init (drivers/tty/serial/8250/8250_exar_st16c554.c:33)
[    1.150960][    T1]  ? do_one_initcall (init/main.c:1378)
[    1.150960][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    1.150960][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    1.150960][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    1.150960][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674 kernel/locking/lockdep.c:5191)
[    1.150960][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    1.150960][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    1.150960][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    1.150960][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    1.150960][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    1.150960][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    1.150960][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:95 kernel/sched/clock.c:319)
[    1.150960][    T1]  ? irqtime_account_irq (kernel/sched/cputime.c:?)
[    1.150960][    T1]  ? irqtime_account_delta (include/linux/seqlock.h:452 include/linux/seqlock.h:524 include/linux/u64_stats_sync.h:152 include/linux/u64_stats_sync.h:188 kernel/sched/cputime.c:49)
[    1.150960][    T1]  ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:80)
[    1.150960][    T1]  ? irqentry_exit (kernel/entry/common.c:?)
[    1.150960][    T1]  ? common_interrupt (arch/x86/kernel/irq.c:319)
[    1.150960][    T1]  ? asm_common_interrupt (arch/x86/include/asm/idtentry.h:688)
[    1.150960][    T1]  ? strlen (arch/x86/lib/string_32.c:?)
[    1.150960][    T1]  ? next_arg (lib/cmdline.c:273)
[    1.150960][    T1]  ? parameq (kernel/params.c:90 kernel/params.c:99)
[    1.150960][    T1]  ? exar_pci_driver_init (drivers/tty/serial/8250/8250_exar_st16c554.c:32)
[    1.150960][    T1]  ? do_initcall_level (init/main.c:1439)
[    1.150960][    T1]  ? do_initcalls (init/main.c:1453)
[    1.150960][    T1]  ? rest_init (init/main.c:1570)
[    1.150960][    T1]  ? do_basic_setup (init/main.c:1476)
[    1.150960][    T1]  ? kernel_init_freeable (init/main.c:1690)
[    1.150960][    T1]  ? kernel_init (init/main.c:1580)
[    1.150960][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:164)
[    1.150960][    T1]  ? __switch_to_asm (arch/x86/entry/entry_32.S:704)
[    1.150960][    T1]  ? __switch_to_asm (arch/x86/entry/entry_32.S:704)
[    1.150960][    T1]  ? rest_init (init/main.c:1570)
[    1.150960][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    1.150960][    T1]  ? entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    1.368042][    T1] CHRDEV "ttyARC" minor range requested (0-4294967294) is out of range of maximum range (0-1048575) for a single major
[    1.369474][    T1] CHRDEV "ttyLP" minor range requested (0-4294967294) is out of range of maximum range (0-1048575) for a single major
[    1.370859][    T1] CHRDEV "ttySIF" minor range requested (0-4294967294) is out of range of maximum range (0-1048575) for a single major
[    1.385171][    T1] Rounding down aligned max_sectors from 4294967295 to 4294967288
[    1.387226][    T1] db_root: cannot open: /etc/target



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251217/202512172240.63ac762f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


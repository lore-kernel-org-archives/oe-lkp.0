Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88EC4C74
	for <oe-lkp@lists.linux.dev>; Thu, 22 May 2025 04:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889754; cv=fail; b=h1Rq56PvfJD2KFJO8qV0WbiDvjfvBqmezoHIniUIY2jo2GTcF2nqtfL3WqpG5w8GKXQS1/yjA7DjL9afrpBtqVkMOFkaIc/g4Ej76u24tyaJ/7wFKi7gH8kSGYY6p1BkexQlvGUmktny47a5PDdddJPFf4+4ihUQE2VtrCmH3Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889754; c=relaxed/simple;
	bh=6N90oct3D68T87Q6joDSJnbRFJkyCE2nRR3vF8C8ZtY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UPtHPOQyaGnxfsDlEpZWxDThL4zIvl5B+jWOoiMD4kRWpWvnPtmr3ajw6n5rDoYXcYqy9G4/o0ZCSQKm5p9rqPqKHHnFjlE0iAwqbQ/Uo9Pp6FkJlLREgheEFaVhOoeY7qXc3TtUuHcGfDkYHwguJFhwJo5qb+a8rLEpwF07Kp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYXTOgMH; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYXTOgMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747889752; x=1779425752;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=6N90oct3D68T87Q6joDSJnbRFJkyCE2nRR3vF8C8ZtY=;
  b=SYXTOgMHKsNI2EA//OZh324CWGMQuqxc9f6FS2rN+E/cewEGuPuibBkK
   W9OegyQPVl0dL3LsK4dmMOq9rsAYbxcm+6f1HDxoJCOThYc/2usCpMtNt
   XxXJmZx0KLrRgGj2KlOABKKU1eO6Nj3otVyO4hPOmXTa6izwmRVQtXY+8
   5eK7fIiGbdy7mUYDK3GKcCvPGgvatUShJWBWsiUkCkr4nNf6PDQwS/H9z
   0fF0zolaxQtC/mxqDOVJ6FhO7Ro0LMEH8SzFFzC7JjMY/dZCRgxu3y+Uq
   MLfwmpmwrkRHcJLP3P+mvyAE10Y2xkdCfUp9dnewMPbXDfZ4XjiOpq+Zx
   A==;
X-CSE-ConnectionGUID: xuan80JORYaBner/601RqA==
X-CSE-MsgGUID: EHZz9HRwQmqblHCUQsHJRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61302362"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61302362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:55:51 -0700
X-CSE-ConnectionGUID: aUvyxT06S9W5gGRVU6PUdg==
X-CSE-MsgGUID: vRfJn2SAS5eAMWvltVEgNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141469082"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:55:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 21:55:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 21:55:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 21:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHHRS2FuI/EBb4KuwFD+h+Sk4Yz/dN4C3RqGm6kSyA5k0qFVQw+7HPEE0UBCWG1U4Zwo7bh0DpuoHPmYK39soUjWcb6LexIa1NVMl8abAmglIpotmIvrh2Dyse58WHJVOBdrBLrB8iAKamRIyLPvcHUwcTRMtNwrcRkaE3i5O7sZ69iH8QBxFjOrbU6WoE4HGQOLbYbsHt446TJm8hgWSSH7KK+KvmDpPr9AKWW/fS87y9owb7p7VALkXT6MmDs9yVDZ7usD63S3g+VLH7eQzRUXFHM4iE8COem/tJ1Ru0/R8bejTlyXi6cUyIURLL86NaVYcPmhQTymJZc3XG0rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjF11U+K768MbWhInuICBB4eJ4Hb+aO6gcwBGPHvYWA=;
 b=e2SJAZb/T2Yw3+5oXDueW0q+ZNwoiIuScFBmHMegKM2m9SItdC0ynYGicPYBBl2ycfaEcoeh1vF+bM0hD4jOQ8FSyyW0bn9w11uRg/c0mBsqDXpkm9sKGHU2H2UQrHaNnSuqXdccqZpxwZFt8PE/93HTK2BnGOfb8sX1I6x8JAkLqzW/VNsZNBh2zBiVmDAOqT5VBHGzjAV20H+Lvjp/NBJvgr0UhWYwsXiuYLPIwP9nbK3TZOsHsXtu9RoBeR0HcZoTJFQz13RImJ6wXNd7aAeMkUrP6r5xxIbQYpKmnV3uNY9LbLHsQBQXxSi0qzdVVfhj/IQaFGnlBSu6zkANnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 22 May
 2025 04:55:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:55:01 +0000
Date: Thu, 22 May 2025 12:54:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm, slab]  6431f06eec:
 WARNING:at_include/linux/mm.h:#skb_append_pagefrags
Message-ID: <202505221248.595a9117-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fd992d-c0fb-45f6-5850-08dd98eccefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3D+nZtFpZtypGg99acgdDoe9au7ywSU1FLAhXl65pQipR0pbR/d886OHcRGY?=
 =?us-ascii?Q?ugee9yTsg9Cy3/UPZ0Pzv2rlLXIgG1S79iH87nauLAeldM61HR+9uiwm7tc1?=
 =?us-ascii?Q?xte7PUKeAdauIlvgLxXWq7lAtsaxrMWyxcX4k9B15gujmWe1iIxo8k39YMmH?=
 =?us-ascii?Q?XVZL2HRFwTpELOPgeZjLXuBkngbmVNVYwuvfAb+HIqikug2nHBFahNdTNF1b?=
 =?us-ascii?Q?ZGhf3PPyPoyJz3G/C0zmrIUFZ9pgv6ZtvPE83uSkgrT+SdGFhKhtu+RePiGR?=
 =?us-ascii?Q?q4051auwaJKGPPh/tuD9UuY8HtP6pFebi1SiNgB5iKLQKI/jujbZhhuOuK1q?=
 =?us-ascii?Q?wWd6H4hlt6ukkK80fU7Yvv40hxsB/FMPK29FK3Th1dVITzHsa4ExI1ReWJWs?=
 =?us-ascii?Q?Ay8SGaPltZn4yzv8qzdND1zHWpFlZvZakLKdEUs1BVkaUlt4WDreEx2E9tzT?=
 =?us-ascii?Q?jHZ9QRfm/4JUt2dtr8k138T+rJZpOu67r+NzG5ybAgAhDGid8q/muH6jWzSY?=
 =?us-ascii?Q?XKps1hRZdVLvK1K7oD7w3tA5PU00yNo3NLD1fawpG10EiLwMVLQkIScPYj4E?=
 =?us-ascii?Q?b+Z0DczcOETPzSW+6zvRqeIUGn/n52iaqfoXVVcSXMMgyVUP8BIYo83tzNY0?=
 =?us-ascii?Q?K+rHwaILzvjKpOhYQDradsiWjdSyhmJ4dNxGYumA5ZmkSnLT3+4fBOH3XN/0?=
 =?us-ascii?Q?/auJu8r+2yNHykZ0mTTvC0yplnRiVDo6uSo9Oe8WwX5Mwtw/Il6ICZZjyvy8?=
 =?us-ascii?Q?5VmdhC/pZI3T/n9tBK/VJ69D6xax5qeSEoYBm7U6RWoedCK0RiPfrzMKEO7v?=
 =?us-ascii?Q?Y0Rjxi4H3ExBvSojwSFPfRJwWCE+y8EOvB77QYuaMPAB20eZ/PUmzoJZY1/P?=
 =?us-ascii?Q?Fc50jBT6+Y3FxXMKUwtK0QIUfKPdim64CjEEXcMW5Srjm042BcjVgkDJIErN?=
 =?us-ascii?Q?32366jNMR5xJjxQK3/r8Cs3H4Rb81JiYs5caWPyIPkzWu4AazEMPHnUPmnIJ?=
 =?us-ascii?Q?OSg47AzvWvUbZ1X1M/FBPx4stJ0N7lIL1B3fyK/xfexsn8vqQmnVO7MdkFV5?=
 =?us-ascii?Q?m+eYfOksdrhI8ZQNkcdkd2nShfDYqK+DkCjIjIgx/jjC2LdJTp+n2wgtYO8g?=
 =?us-ascii?Q?+aiSA4NewGewBfEcOCkjVDKJTN9Jton5dHkYNmPFo/P5g4VjbF5QtL3GvnGS?=
 =?us-ascii?Q?e+vSVx2DGdNXqnfJwDrCYvp1zhV1OpBKMoi/oI9LqHWIGSlRaqbVmROCWSag?=
 =?us-ascii?Q?PXweiQ9+AUuJnwmOkTXNnXpvUVebPNFmYFO14aCJ6hC9DawDyrq+0XoxQGx3?=
 =?us-ascii?Q?6hsCChOMAVYHSEo+YzNvOI0kOuWykZXZyqAcYvO0lWcPjDnjejgcWd3BO9aV?=
 =?us-ascii?Q?fyKySVw6nt1NvdtvhbhR1ythEJ1D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zvz/w087dWnS4kJhkczVqwzV5qbXJnMbEDqyv+606TJnvpQWyaaeChc5l9QQ?=
 =?us-ascii?Q?sm400me7OZKSHIPbDpKSaBhIbfcn6LlrLtRIB6k3lNrEvobkOHg0af/yCpw6?=
 =?us-ascii?Q?9zAuv2xrgeRxto0rmS17wLoT7eYbZXZ/V0Vkn4rMUst4ymvMUR8w+ZSHo6Gg?=
 =?us-ascii?Q?ofdwOuCtFDMbD5tMpzA0liCaVryVhDtyQTajYCKw3Qd4pZ4i/FmJewuR2SjU?=
 =?us-ascii?Q?OmsudFHjeEokERwItiyhB0UMBksaNhdM+vFpV+iYIJhzHKXmvZSlB9vz22+1?=
 =?us-ascii?Q?gePNEYm9p7t78SHQZaX7rQqq/ZHH2R4yYQL3eB4DYjrM/5lHkR5OG4hLem0X?=
 =?us-ascii?Q?5cpGeUYeiMke7juH76EfU7rNtBKG8yhVzFAI2q7AnfP5uX4/hwNZTHmcrAjX?=
 =?us-ascii?Q?T3YW2jqbBm/hJlIDrFm+vlMYj6XXvQYUP1GJgWYnAVbACR06h3aZh4A2EjAv?=
 =?us-ascii?Q?gV9dnu8hHJCs6uFNlFlrtPk8UWSaxxeQh/6w/y9asoK4HvlK57rCkdgWf7Zg?=
 =?us-ascii?Q?ybklCHwuz8plhe04aA7jh3FsVJAbrFhJdSfaeY3K8f0XbL056dPq5IJwmrRj?=
 =?us-ascii?Q?qFpEZDoKYpt340HwQ1DOemM/MQGpTvLufc5Oh2Qjt1v9JvlyPz4yb/Bl1O7h?=
 =?us-ascii?Q?E8Ebtka9c2l7QGVS9Fbx3Oom0vuCOBnw+XJiB+NnUbV5yOBdU+TAj27MC/vb?=
 =?us-ascii?Q?I4Io99BXVqFVSfsbP9niOBKzeNr229yQiN5NhRQwwxK+EZppR/XPKGpi9M0d?=
 =?us-ascii?Q?/mpnKopWr7ldX973SmoK89dRjzFsh0G1m8bttv79P4Jc+eDSoYvN3HG/Mt69?=
 =?us-ascii?Q?mFESHlkCc/+N9nsQVKTZmwf6dGmItBXX4ZmkiuSpslv1NIr0NAAeQvzMZYMK?=
 =?us-ascii?Q?kUjoF4NwB/dYCh7UiUh6WjIvn2OHkjU/5CxcYriMoh8C3O+CSh3YzdfafxfO?=
 =?us-ascii?Q?jyeQG6HkkBwPYaeVOKet4vUygC+36ot1D+XPJTrVnn8LcAqHtQ8jd0M9FaUa?=
 =?us-ascii?Q?xSJgQkfsWwRdfcOcg7cjDzFTTYOPVaSspdZglCnCNiYtZQ3sFInvtwm7tSdZ?=
 =?us-ascii?Q?8hH+oyoYHghgwnFpjdwAi5eXKQW19MaAWOSvutcL6oHXZyOmYywhhglpXk+F?=
 =?us-ascii?Q?lUfJ3Px5oNxbLNpa6njsGxI6ZFWk2jWFk7W28UEEXTRqkj6du4q/dNu/eQaV?=
 =?us-ascii?Q?rTZUpZTvpb3Q26G0a6XeRU1YW+W3s6jLK9NxYSDFT1S9hB2YgfY6fXhcwHOm?=
 =?us-ascii?Q?m3/DiJr4kIEPKZTXMsX3WbRdsX0UUKTJni0Z1RH7MSG56tp7yWSPUdzzg4C0?=
 =?us-ascii?Q?G97GD4+tPWUAdXMftsr+hxaRI0rLUAT28wCJG3dqTDgnlVoKz/Zm+y1JEdVz?=
 =?us-ascii?Q?xrAChG87znH77As5742uo6hQ5ITWlHm9NhQTmFQAqJ7Ir1/1hDPjbRpxkJNQ?=
 =?us-ascii?Q?qXF5N/pu7Z+fKTTcNHr51EdPybWTok+SCc3nmFR19Q7JiTJ4QXQR0qJ0t1+6?=
 =?us-ascii?Q?u93ClJfff2lDHyN+LreASuwWO4jHPBqFxJ+m9cyDrdJ+FtJlNtLdS+fpt0Ej?=
 =?us-ascii?Q?kyi6xDTmRyo4pPIZjxEwiaFAQ5JpeELuQVR6/vAHkyfbwcuM6d42c+z53/71?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fd992d-c0fb-45f6-5850-08dd98eccefe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:55:01.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOpQFUJGhIOaXMgsB5Y5oL7/QrKBi3dXUe6yu5rC7etMIN72ZKJHiAoSAubC1LEEP9GjGzpg1IUIc2nsTvpE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-OriginatorOrg: intel.com



Hello,


we noticed the WARN added in this commit is hit in our tests. not sure if i=
t's
expected. below full report FYI.


kernel test robot noticed "WARNING:at_include/linux/mm.h:#skb_append_pagefr=
ags" on:

commit: 6431f06eecf44e7b8d42237cb0e166a456f491ad ("mm, slab: warn when incr=
easing refcount on large kmalloc page")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 7bac2c97af4078d7a627500c9bcdd5b033f97718]

in testcase: blktests
version: blktests-x86_64-613b837-1_20250520
with following parameters:

	disk: 1SSD
	test: nvme-group-00
	nvme_trtype: rdma
	use_siw: true



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) w=
ith 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505221248.595a9117-lkp@intel.co=
m


[  130.177740][ T2674] ------------[ cut here ]------------
[ 130.183066][ T2674] WARNING: CPU: 6 PID: 2674 at include/linux/mm.h:1552 =
skb_append_pagefrags (kbuild/obj/consumer/x86_64-rhel-9.4-func/include/linu=
x/mm.h:1552 kbuild/obj/consumer/x86_64-rhel-9.4-func/net/core/skbuff.c:4518=
)=20
[  130.192642][ T2674] Modules linked in: siw ib_uverbs nvmet_rdma nvmet nv=
me_rdma nvme_fabrics rdma_cm nvme_auth nvme_core iw_cm ib_cm ib_core xfs dm=
_multipath btrfs blake2b_generic xor zstd_compress raid6_pq intel_rapl_msr =
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp snd_soc_avs snd_hda=
_codec_hdmi coretemp snd_soc_hda_codec snd_hda_ext_core sd_mod snd_ctl_led =
snd_soc_core sg snd_hda_codec_realtek kvm_intel snd_hda_codec_generic snd_c=
ompress ipmi_devintf snd_hda_scodec_component ipmi_msghandler i915 kvm snd_=
hda_intel snd_intel_dspcfg snd_intel_sdw_acpi intel_gtt snd_hda_codec cec i=
rqbypass ghash_clmulni_intel drm_buddy snd_hda_core sha512_ssse3 ttm snd_hw=
dep sha256_ssse3 drm_display_helper sha1_ssse3 snd_pcm ahci mei_wdt drm_cli=
ent_lib drm_kms_helper rapl libahci mei_me snd_timer intel_cstate video wmi=
_bmof i2c_i801 snd intel_uncore mei pcspkr soundcore i2c_smbus libata serio=
_raw intel_pmc_core intel_pch_thermal intel_vsec pmt_telemetry wmi acpi_pad=
 pmt_class binfmt_misc drm fuse loop dm_mod ip_tables
[  130.192875][ T2674]  [last unloaded: ib_uverbs]
[  130.286562][ T2674] CPU: 6 UID: 0 PID: 2674 Comm: siw_tx/6 Tainted: G S =
                 6.15.0-rc3-00001-g6431f06eecf4 #1 PREEMPT(voluntary)
[  130.299313][ T2674] Tainted: [S]=3DCPU_OUT_OF_SPEC
[  130.303929][ T2674] Hardware name: HP HP Z240 SFF Workstation/802E, BIOS=
 N51 Ver. 01.63 10/05/2017
[ 130.312877][ T2674] RIP: 0010:skb_append_pagefrags (kbuild/obj/consumer/x=
86_64-rhel-9.4-func/include/linux/mm.h:1552 kbuild/obj/consumer/x86_64-rhel=
-9.4-func/net/core/skbuff.c:4518)=20
[ 130.318708][ T2674] Code: a2 ff ff 48 8b 4c 24 18 4c 8b 4c 24 10 8b 54 24=
 08 4c 8b 14 24 e9 1b fb ff ff 4c 8d 60 ff e9 47 fb ff ff 0f 0b e9 bb fb ff=
 ff <0f> 0b e9 7b fb ff ff b8 a6 ff ff ff e9 d7 fc ff ff 0f 0b 31 ff e9
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	a2 ff ff 48 8b 4c 24 	movabs %al,0x4c18244c8b48ffff
   7:	18 4c=20
   9:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   d:	8b 54 24 08          	mov    0x8(%rsp),%edx
  11:	4c 8b 14 24          	mov    (%rsp),%r10
  15:	e9 1b fb ff ff       	jmp    0xfffffffffffffb35
  1a:	4c 8d 60 ff          	lea    -0x1(%rax),%r12
  1e:	e9 47 fb ff ff       	jmp    0xfffffffffffffb6a
  23:	0f 0b                	ud2
  25:	e9 bb fb ff ff       	jmp    0xfffffffffffffbe5
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 7b fb ff ff       	jmp    0xfffffffffffffbac
  31:	b8 a6 ff ff ff       	mov    $0xffffffa6,%eax
  36:	e9 d7 fc ff ff       	jmp    0xfffffffffffffd12
  3b:	0f 0b                	ud2
  3d:	31 ff                	xor    %edi,%edi
  3f:	e9                   	.byte 0xe9

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	0f 0b                	ud2
   2:	e9 7b fb ff ff       	jmp    0xfffffffffffffb82
   7:	b8 a6 ff ff ff       	mov    $0xffffffa6,%eax
   c:	e9 d7 fc ff ff       	jmp    0xfffffffffffffce8
  11:	0f 0b                	ud2
  13:	31 ff                	xor    %edi,%edi
  15:	e9                   	.byte 0xe9
[  130.338106][ T2674] RSP: 0018:ffffc90000ec7220 EFLAGS: 00010246
[  130.344005][ T2674] RAX: 00000000000000f8 RBX: ffffea00086b0000 RCX: fff=
f8883ffd08840
[  130.351795][ T2674] RDX: 0000000000000001 RSI: 1ffffd40010d6006 RDI: fff=
fea00086b0030
[  130.359609][ T2674] RBP: ffff8883ffd08780 R08: 0000000000000011 R09: fff=
f8883ffd08848
[  130.367426][ T2674] R10: 0000000000000001 R11: 0000000000000001 R12: fff=
fea00086b0000
[  130.375247][ T2674] R13: 0000000000000001 R14: 0000000000001000 R15: 000=
0000000000000
[  130.383044][ T2674] FS:  0000000000000000(0000) GS:ffff888426d45000(0000=
) knlGS:0000000000000000
[  130.391798][ T2674] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  130.398234][ T2674] CR2: 000055b575c2cd28 CR3: 000000043c06e004 CR4: 000=
00000003726f0
[  130.406050][ T2674] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[  130.413861][ T2674] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[  130.421668][ T2674] Call Trace:
[  130.424805][ T2674]  <TASK>
[ 130.427594][ T2674] ? __pfx_tcp_established_options (kbuild/obj/consumer/=
x86_64-rhel-9.4-func/net/ipv4/tcp_output.c:989)=20
[ 130.433409][ T2674] skb_splice_from_iter (kbuild/obj/consumer/x86_64-rhel=
-9.4-func/net/core/skbuff.c:7256)=20
[ 130.438455][ T2674] ? __pfx_skb_splice_from_iter (kbuild/obj/consumer/x86=
_64-rhel-9.4-func/net/core/skbuff.c:7223)=20
[ 130.444015][ T2674] ? __sk_mem_raise_allocated (kbuild/obj/consumer/x86_6=
4-rhel-9.4-func/net/core/sock.c:3335)=20
[ 130.449674][ T2674] ? __sk_mem_schedule (kbuild/obj/consumer/x86_64-rhel-=
9.4-func/net/core/sock.c:3353)=20
[ 130.454470][ T2674] tcp_sendmsg_locked (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/net/ipv4/tcp.c:1275)=20
[ 130.459521][ T2674] ? tcp_sendmsg (kbuild/obj/consumer/x86_64-rhel-9.4-fu=
nc/net/ipv4/tcp.c:1370)=20
[ 130.463786][ T2674] ? sock_sendmsg (kbuild/obj/consumer/x86_64-rhel-9.4-f=
unc/net/socket.c:712 kbuild/obj/consumer/x86_64-rhel-9.4-func/net/socket.c:=
727 kbuild/obj/consumer/x86_64-rhel-9.4-func/net/socket.c:750)=20
[ 130.468307][ T2674] ? __pfx_tcp_sendmsg_locked (kbuild/obj/consumer/x86_6=
4-rhel-9.4-func/net/ipv4/tcp.c:1061)=20
[ 130.473697][ T2674] ? __pfx_sock_sendmsg (kbuild/obj/consumer/x86_64-rhel=
-9.4-func/net/socket.c:739)=20
[ 130.478561][ T2674] ? _raw_spin_lock_bh (kbuild/obj/consumer/x86_64-rhel-=
9.4-func/arch/x86/include/asm/atomic.h:107 kbuild/obj/consumer/x86_64-rhel-=
9.4-func/include/linux/atomic/atomic-arch-fallback.h:2170 kbuild/obj/consum=
er/x86_64-rhel-9.4-func/include/linux/atomic/atomic-instrumented.h:1302 kbu=
ild/obj/consumer/x86_64-rhel-9.4-func/include/asm-generic/qspinlock.h:111 k=
build/obj/consumer/x86_64-rhel-9.4-func/include/linux/spinlock.h:187 kbuild=
/obj/consumer/x86_64-rhel-9.4-func/include/linux/spinlock_api_smp.h:127 kbu=
ild/obj/consumer/x86_64-rhel-9.4-func/kernel/locking/spinlock.c:178)=20
[ 130.483350][ T2674] ? __pfx_tcp_release_cb (kbuild/obj/consumer/x86_64-rh=
el-9.4-func/net/ipv4/tcp_output.c:1151)=20
[ 130.488394][ T2674] siw_tcp_sendpages+0x1f1/0x4f0 siw=20
[ 130.494322][ T2674] ? __pfx_siw_tcp_sendpages+0x10/0x10 siw=20
[ 130.500763][ T2674] siw_tx_hdt (kbuild/obj/consumer/x86_64-rhel-9.4-func/=
drivers/infiniband/sw/siw/siw_qp_tx.c:379 kbuild/obj/consumer/x86_64-rhel-9=
.4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:586) siw=20
[ 130.505558][ T2674] ? __pfx_sched_balance_find_src_group (kbuild/obj/cons=
umer/x86_64-rhel-9.4-func/kernel/sched/fair.c:11298)=20
[ 130.511811][ T2674] ? __pfx_siw_tx_hdt (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:431) siw=20
[ 130.517045][ T2674] ? sched_balance_rq (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/kernel/sched/fair.c:11770)=20
[ 130.521998][ T2674] ? dl_scaled_delta_exec (kbuild/obj/consumer/x86_64-rh=
el-9.4-func/kernel/sched/deadline.c:1481)=20
[ 130.527133][ T2674] ? place_entity (kbuild/obj/consumer/x86_64-rhel-9.4-f=
unc/kernel/sched/fair.c:5206)=20
[ 130.531567][ T2674] ? __pfx__raw_spin_lock (kbuild/obj/consumer/x86_64-rh=
el-9.4-func/kernel/locking/spinlock.c:153)=20
[ 130.536606][ T2674] ? pick_eevdf (kbuild/obj/consumer/x86_64-rhel-9.4-fun=
c/kernel/sched/fair.c:946)=20
[ 130.540970][ T2674] ? __resched_curr (kbuild/obj/consumer/x86_64-rhel-9.4=
-func/arch/x86/include/asm/bitops.h:60 kbuild/obj/consumer/x86_64-rhel-9.4-=
func/include/asm-generic/bitops/instrumented-atomic.h:29 kbuild/obj/consume=
r/x86_64-rhel-9.4-func/include/linux/thread_info.h:97 kbuild/obj/consumer/x=
86_64-rhel-9.4-func/kernel/sched/core.c:1113)=20
[ 130.545678][ T2674] ? update_curr (kbuild/obj/consumer/x86_64-rhel-9.4-fu=
nc/kernel/sched/fair.c:1236)=20
[ 130.550031][ T2674] ? xas_load (kbuild/obj/consumer/x86_64-rhel-9.4-func/=
include/linux/xarray.h:175 kbuild/obj/consumer/x86_64-rhel-9.4-func/include=
/linux/xarray.h:1264 kbuild/obj/consumer/x86_64-rhel-9.4-func/lib/xarray.c:=
241)=20
[ 130.554136][ T2674] ? xa_load (kbuild/obj/consumer/x86_64-rhel-9.4-func/l=
ib/xarray.c:1613)=20
[ 130.558136][ T2674] ? __pfx_xa_load (kbuild/obj/consumer/x86_64-rhel-9.4-=
func/lib/xarray.c:1613)=20
[ 130.562569][ T2674] ? ttwu_do_activate (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/kernel/sched/core.c:3705 kbuild/obj/consumer/x86_64-rhel-9.4-func/k=
ernel/sched/core.c:3735)=20
[ 130.567431][ T2674] ? update_rq_clock_task (kbuild/obj/consumer/x86_64-rh=
el-9.4-func/kernel/sched/sched.h:1325 kbuild/obj/consumer/x86_64-rhel-9.4-f=
unc/kernel/sched/pelt.h:120 kbuild/obj/consumer/x86_64-rhel-9.4-func/kernel=
/sched/core.c:797)=20
[ 130.572650][ T2674] ? siw_mem_id2obj (kbuild/obj/consumer/x86_64-rhel-9.4=
-func/drivers/infiniband/sw/siw/siw_mem.c:52) siw=20
[ 130.577866][ T2674] ? __pfx_siw_try_1seg (kbuild/obj/consumer/x86_64-rhel=
-9.4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:50) siw=20
[ 130.583264][ T2674] ? __pfx_try_to_wake_up (kbuild/obj/consumer/x86_64-rh=
el-9.4-func/kernel/sched/core.c:4175)=20
[ 130.588310][ T2674] ? finish_task_switch+0x155/0x750=20
[ 130.593957][ T2674] siw_qp_sq_proc_tx (kbuild/obj/consumer/x86_64-rhel-9.=
4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:882) siw=20
[ 130.599352][ T2674] ? siw_activate_tx (kbuild/obj/consumer/x86_64-rhel-9.=
4-func/drivers/infiniband/sw/siw/siw_qp.c:996) siw=20
[ 130.604670][ T2674] siw_qp_sq_process (kbuild/obj/consumer/x86_64-rhel-9.=
4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:1038) siw=20
[ 130.609905][ T2674] siw_sq_resume (kbuild/obj/consumer/x86_64-rhel-9.4-fu=
nc/drivers/infiniband/sw/siw/siw_qp_tx.c:1170) siw=20
[ 130.614789][ T2674] siw_run_sq (kbuild/obj/consumer/x86_64-rhel-9.4-func/=
drivers/infiniband/sw/siw/siw_qp_tx.c:1258) siw=20
[ 130.619508][ T2674] ? __pfx_siw_run_sq (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:1236) siw=20
[ 130.624735][ T2674] ? __pfx__raw_spin_lock_irqsave (kbuild/obj/consumer/x=
86_64-rhel-9.4-func/kernel/locking/spinlock.c:161)=20
[ 130.630482][ T2674] ? __pfx_autoremove_wake_function (kbuild/obj/consumer=
/x86_64-rhel-9.4-func/kernel/sched/wait.c:383)=20
[ 130.636383][ T2674] ? __kthread_parkme (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/arch/x86/include/asm/bitops.h:206 (discriminator 15) kbuild/obj/con=
sumer/x86_64-rhel-9.4-func/arch/x86/include/asm/bitops.h:238 (discriminator=
 15) kbuild/obj/consumer/x86_64-rhel-9.4-func/include/asm-generic/bitops/in=
strumented-non-atomic.h:142 (discriminator 15) kbuild/obj/consumer/x86_64-r=
hel-9.4-func/kernel/kthread.c:291 (discriminator 15))=20
[ 130.641160][ T2674] ? __pfx_siw_run_sq (kbuild/obj/consumer/x86_64-rhel-9=
.4-func/drivers/infiniband/sw/siw/siw_qp_tx.c:1236) siw=20
[ 130.646377][ T2674] kthread (kbuild/obj/consumer/x86_64-rhel-9.4-func/ker=
nel/kthread.c:464)=20
[ 130.650291][ T2674] ? __pfx_kthread (kbuild/obj/consumer/x86_64-rhel-9.4-=
func/kernel/kthread.c:413)=20
[ 130.654724][ T2674] ? __pfx__raw_spin_lock_irq (kbuild/obj/consumer/x86_6=
4-rhel-9.4-func/kernel/locking/spinlock.c:169)=20
[ 130.660098][ T2674] ? __pfx_kthread (kbuild/obj/consumer/x86_64-rhel-9.4-=
func/kernel/kthread.c:413)=20
[ 130.664534][ T2674] ret_from_fork (kbuild/obj/consumer/x86_64-rhel-9.4-fu=
nc/arch/x86/kernel/process.c:159)=20
[ 130.668809][ T2674] ? __pfx_kthread (kbuild/obj/consumer/x86_64-rhel-9.4-=
func/kernel/kthread.c:413)=20
[ 130.673247][ T2674] ret_from_fork_asm (kbuild/obj/consumer/x86_64-rhel-9.=
4-func/arch/x86/entry/entry_64.S:258)=20
[  130.677869][ T2674]  </TASK>
[  130.680755][ T2674] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250522/202505221248.595a9117-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


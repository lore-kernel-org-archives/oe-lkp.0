Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B725165EE2
	for <oe-lkp@lists.linux.dev>; Mon,  7 Oct 2024 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294482; cv=fail; b=i7x6pg5Nn/wQRinizcZAVj6QPW/jR+gJOPwVQRAeA4ss4T5McogmYP5kAcJrea+MiWD9NOjhFPbbGXYWlsy78F9Iwh6I8idTaSjaSRDGAI7z3hdXYdOsRgXT1uIZpIJjzWv1Bu+qLgpgu0PrYw5APiC29Yn+B6IRTBTTa7I93uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294482; c=relaxed/simple;
	bh=u35OV8KBP5gJxuijUJNzeTcPnMRgogJkSqrpFnfwqJg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rl77jYQFt2WyINdDqgI2dqInWsk4ZBcqJ9vajDXSakAlAoAN7xR7qnNojr0inmJGM0vPhjuQi6pE8w96H6upPLccCjcE9XKwgF5WZ5V6nXjNGlAv7Z2iulxt+BwBCtC6I81wdAYv5ARSyrMcvEqX1JwlJ1M82WCHVzxm9ovZW+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei0ApKyH; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei0ApKyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728294480; x=1759830480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u35OV8KBP5gJxuijUJNzeTcPnMRgogJkSqrpFnfwqJg=;
  b=Ei0ApKyHIdBwFYVJ7elNMwDW/u/OWDd8Y3G3bWuBFYJ23RRJHBPvkO5E
   dVXe8nEwbQe9OVNapTG6OVJT9240F8Y3p7Qcmtw85NbAp8nA4ngaWW1z1
   fKdddXNWlFeoTp7JXghgUpkWVrbrdt0KVK4W4m7GXy2F082AGZiSb6Hy5
   t/D3+xdyZGJ9iG6PsxLU0CrNk/BtOtHYXCySAhcBAXmeGfh6vOXSUBr3b
   bgCCIQfGNZj+Y1Ule9+hRJRj/FDFv4IwF+w1MX647dq/HC5EXvj3iF2kY
   mc+uewgczS9OBO3GEFexRNqzNZhtCBYOdVFaLfhwmbbI4VM2H3Lhg/frv
   w==;
X-CSE-ConnectionGUID: opcEtc2FRLC3oiRcM1R0Fg==
X-CSE-MsgGUID: k/DWVapLRiS1wj9qeSGRUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38088726"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38088726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 02:47:59 -0700
X-CSE-ConnectionGUID: 8lhSi01BTNiqOwNI8hszsA==
X-CSE-MsgGUID: NC5LjOJ7TJ+csmiWB4/RQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75428615"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 02:47:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 02:47:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 02:47:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 02:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/cGmOdz/Snq5zMYsy1HB3mkJ2IDLe2BcCJAJFNTbUnl4lzVrXV6rYrApF8iQzfrHFbNwhJqIaS+pF2jW+ig4wGWZSb0XkDt8HBiRkdFPF8Jb27QPHcjxp1KE/4Exy3/MGtU0bZHETOaSQuNk/+x5G8lvemyHfG/9FNpcgeSb8qtz2u6i3xvVFLnZTM1xGklr5uDmrPjfvjI5lCpjjM4PZiqNH2rN/5nQ4jXDUKFo+x4H2QqNY3ECaqg1dHScKpmTKh11p32svoZE0NcRcgUv1VRUEwANU0i8/dRxO5LW5tLxcwhmXUPfNA8P60vMzkH+E+gbZoCNZcmBFwL9rGVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0k+OhHAtNhvJah+k9xCo8dUjdt6Q/XJbuG5fUvKUjs=;
 b=EjQNa3WbpHS6KOMNE/+EUf49o/bJF94DIigszpLTLsjSS7og6FA5Ax0PHtBYGhVOL+Ki13JRAR6EzSJxncY1THOTzqTBl9VCLA6ImFyeRWF9Sa6wrSjsbr9EJYr3OilTUaEZbOLfuQYAQHU6SPlNpw631xcEv6PyQfLcuLzWMm6jjHLXE1yFEO8DTOoGf3oaNysf8vQfhtZygNdTdsxQS+nlsDY6OvVMJWSyjhTGhQ1NozZytuI2j8fWXieDiMbOXx9Qy0xyYTEnnn0cSAJ1xQ7vfxd0SjGGvnE/IDGum2NmnLYqpvYTQhAqd3DGx5PeDhJ6zHzwSvNlIhHEYlG1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 09:47:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 09:47:56 +0000
Date: Mon, 7 Oct 2024 17:47:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Alex Shi
	<alexs@kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  0e654ac65a:
 kernel_BUG_at_include/linux/page-flags.h
Message-ID: <202410071738.73daae42-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6d3f7b-252b-49c9-d612-08dce6b51ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0dI/shWHKviwIh7YEP9vBxrKDDVNvduWKpd0D60kQcJT7U8J8/ookS1HJIuc?=
 =?us-ascii?Q?5vO3sWqZRRmF2IVHRx9U0lvhT/TSDzx5ObszztdCTRVnX45ohzZEQXM9e6Uo?=
 =?us-ascii?Q?R6fSbixoeN5mDccTFkFuqTgiCHU5n2V0SzxiJt/pkEn6TQBP63o+rjIPZ6ni?=
 =?us-ascii?Q?JbKhylFuXbMFFweSqRmPR8i0hA1FbUwyw7dYM1wXS2cixAbopnUhchu97KFP?=
 =?us-ascii?Q?JNkCl2T2gmY0Bjytm8xmbpX70ws5ZtZb9RSoiuXMCjVoIyPNHhn12nBxMUJi?=
 =?us-ascii?Q?AbrzC9NzDboq95E+y4mOK00ufiHCF5M0OA5blm8ljZUYp1YkcWR/GEVX+oeg?=
 =?us-ascii?Q?1Jh2kgY0kbQTLVvyCtX4fQOg8cTHQ1e7e+AIssn0kR1s7yAMRk+2qLgF3801?=
 =?us-ascii?Q?hftc/gl6mFUjmGH57Lz119CimGkvvbVy0yadIZOMLC+bYJx6NYNKUOuD5+Ls?=
 =?us-ascii?Q?4ubN1rLKOHTYiAE6CIgMztN3EOHM8plWgc79ibIsSMflHb8xspRT+iMqO8wm?=
 =?us-ascii?Q?F/OCyxFwgsRwKFPEWEIdPSQbbM5o+qgbJjOgHf7aRn+4Bx3OPKn66phQfHBK?=
 =?us-ascii?Q?BHw7YlG1bNsXL+sUTAkfgQdn9GQ4HGJUD7TftFC8kcy9y0knUETGNHS6MCPs?=
 =?us-ascii?Q?X3Pd1kcxfvbz4lCvJGpq79UbdSMZlmtTVyJhHFjaRhgNzd+6waC8xBvbWMnn?=
 =?us-ascii?Q?dl/joUyWphrU9or3d5yhE7cSVZ37NxMNyyIXsvnlocXnXGPl8jZf3Cg+BIMW?=
 =?us-ascii?Q?MjqP2fgOzQ8VSva9ccV0QmUADdYpUm4Ew2Bf0aSIc0Sd02bdOdcKCHlUvzS2?=
 =?us-ascii?Q?VXF6wBihu+eXPhpUa2mJ4/L1+uga9te/rvpcWDsapY5Qb7had/fjklRBV023?=
 =?us-ascii?Q?LmahWJqIqznErCKyuHfyokyCDwFa03vPbWwkx0+BVLhCmb/iX+/P301hVvBF?=
 =?us-ascii?Q?Er+krvySAnEsuOHXdytKofoM/p9D7VfcizKynpTEhb8SvD7SscR17SvXEL4H?=
 =?us-ascii?Q?utx+wNdYjOtuail9boz5rs6XGFSUFiZH3wvsEq8hiIAmN91flySnXBkzoNz+?=
 =?us-ascii?Q?TcqXSE3ckGOhzWvywG68E2w7ishLUFckStWWpFnIx1AjOEFdhP9qFzbhMDGp?=
 =?us-ascii?Q?Xzf9nmKYo3uI17uJJknsUQLHKR7c0aZWWmfr9LEusVmMpD7F5X4GwLkUywmL?=
 =?us-ascii?Q?lqMysRel+3/YcyiPTYpOCZi6kK70NqJmQdNaLgUImMg8V7uXWDI25qgR9tHP?=
 =?us-ascii?Q?qSBF14Sf6lbh+0Th5f6Il4RbapkPN51fpN1zd7Rx5ELeILbj0Rp0RTNvYZLF?=
 =?us-ascii?Q?Nt0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NjtTuX1DA0oO3a2fGDYORtf0NyWEgTfY0DaXOpVn298PKvYzLQXgw/lo2LVF?=
 =?us-ascii?Q?VDaPjH1drh8S4xDAU4lii1hXX29XhswMz+xMuLNY7KqUAE49BElcjjgokKMd?=
 =?us-ascii?Q?h5WGT1Z/W8cwrjzgAKUpvGw4vpMqAkEZ6zXLrj3GGpi1d8tJOFeW5BXvMGy0?=
 =?us-ascii?Q?0nWJ/mG16NyC1+x3qj4Tk9F65dIqK6erzLZpXzmsbQZCiUqyFLZab5b756rS?=
 =?us-ascii?Q?ODWsrokI/0k4Cjo0a33EaVWZnuCs7CIh2XI0K3xmhQuV/EOm9XaTAKFbU+m1?=
 =?us-ascii?Q?h+fAXvlTH43Q+wY3Z7FRjSa7XxAb4DcgRnFTXVjkRRa2nFnb0rg/bWJOuuhZ?=
 =?us-ascii?Q?wJEfJF1FQ0Ua+TBZwXMJNYUym4GFYe3SIN2YVuHEwEjfD8gzVsP2rFxeJf3w?=
 =?us-ascii?Q?L03Pu7vL+1B/uYtVGCnFPxTUhf2VyPzjCoNSq4h5dN+KyLq7ZhGMZ+OKlkeh?=
 =?us-ascii?Q?IkPLwGJEWgYAgc3P21YG5M++7CF3V+1mAFCxu0D/Sm3m7IAz9YZOT75P0uCB?=
 =?us-ascii?Q?z8VPSyRg945GW88dfX/XIQrgXPHhGFtP+NdZJVfqE+dqDLHCph3FcShCXn+m?=
 =?us-ascii?Q?hzPj0il3EGh3doQxGxkckaz9Ju/ihTAKr9YSB8narIvYwOkPkNbpBrsKUOzl?=
 =?us-ascii?Q?foKDo0yISHFlGJXpJWT2Z5lO/YwD1fogymdkUVBhkP7cB5i6dLp4p7DhRNUV?=
 =?us-ascii?Q?5i2wwtzQKqBI08z4qCHHNHNWWAI2arGKwmNCcYPociL4bUWpIobbqQ6O3hvy?=
 =?us-ascii?Q?A3fj1HmuKJ1RL6sDVo+/lvZyxwt7S6QaUGc5a6s2Csoo0h+8/BjxyINjx6fG?=
 =?us-ascii?Q?n88qeyAzoTxe5twRwkK6KuYb5jPmKDJehMD+8YLu+tN6SeY7xw7r3/Bu1tfn?=
 =?us-ascii?Q?tztouIVUqSgammWBSU84feE0gGU1AIWntHmSJ8CG//i5u5KiTV0ebW7ZQDIn?=
 =?us-ascii?Q?Me0Pf8KYOauj3z5w9vlXXh6cSGDMW1/vnEyq3i3wkf4HVYJqK58Tg5jwbD1d?=
 =?us-ascii?Q?Yw+R0MnbVV+eFJ0sy0Q+kWujrQ5SPMKnjdJy/u0qp0ZWOZUkjQk66l21ifnf?=
 =?us-ascii?Q?/u62+nedhcFfEY6mFidLV9r7PZ1TsuUu9ZzntRwAdg7Rg2yo7py4v4Xe6pyU?=
 =?us-ascii?Q?m33cKvi15W5uXcZiG3uSs9dlK9rjx5OZy5mTRPjlLnWFxMRd6eZRINQwTjmK?=
 =?us-ascii?Q?cwCgANHEQbnx44cdesyb27dobcIONYBiiuFPR/xJyhITbEE8ka+SUWRNYKuB?=
 =?us-ascii?Q?efbw5GIVSGJuTO7u1BGb7/eodgD8T0NUN/CPT32gKLCIjfu9SwxCQ6dCuEvs?=
 =?us-ascii?Q?lEO18AKwFXmtJqTw+j1TJ6DNtHCUsG01LxMd8I4/v33k/cZFH2IHrrTFDzKT?=
 =?us-ascii?Q?C1cD5EQ+Trd4L8FtCABSOXpsyLdY/MmeOLP6ivlAIVoEQq8Jb3KLi41OFsZQ?=
 =?us-ascii?Q?ApppdPCQ3vCVdaYBMcnfe+nIn4gpd/uzTEl0QBliM/0VGHQVqS6Ze9cY481b?=
 =?us-ascii?Q?VBui1j14I4OwRnUQzf/K4x5MHfYUEFS4uIm3kTbZVKHIKcgI43YXAapJ+saZ?=
 =?us-ascii?Q?Mvb6Sn0mwLvPWu+apVz0midLewgNUtp1zvxJDswdV5tl5wMncMIBVenhHzuW?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6d3f7b-252b-49c9-d612-08dce6b51ed1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 09:47:56.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz29rTtz+tXp9BmFniy+N4/6KBIhATHh/8+jRbKit3CretCeus02KK8KKI2vhNdkVxSXO0fOrqTPVAP2CA1wSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:

commit: 0e654ac65afb5559d9d61edc47082af601a81878 ("mm: add PageAnonNotKsm()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 58ca61c1a866bfdaa5e19fb19a2416764f847d75]

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410071738.73daae42-lkp@intel.com


[   21.471410][    T1] ------------[ cut here ]------------
[   21.471807][    T1] kernel BUG at include/linux/page-flags.h:1139!
[   21.472273][    T1] Oops: invalid opcode: 0000 [#1] KASAN
[   21.472695][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-rc1-00086-g0e654ac65afb #1
[   21.473367][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 21.474104][ T1] RIP: 0010:folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.474549][ T1] Code: 08 00 00 4c 8b 63 48 41 f6 c4 01 0f 84 87 f9 ff ff 49 83 ec 01 e9 81 f9 ff ff 48 c7 c6 e0 2c 0f 89 48 89 df e8 37 71 f9 ff 90 <0f> 0b 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 80 3c 02
All code
========
   0:	08 00                	or     %al,(%rax)
   2:	00 4c 8b 63          	add    %cl,0x63(%rbx,%rcx,4)
   6:	48                   	rex.W
   7:	41 f6 c4 01          	test   $0x1,%r12b
   b:	0f 84 87 f9 ff ff    	je     0xfffffffffffff998
  11:	49 83 ec 01          	sub    $0x1,%r12
  15:	e9 81 f9 ff ff       	jmp    0xfffffffffffff99b
  1a:	48 c7 c6 e0 2c 0f 89 	mov    $0xffffffff890f2ce0,%rsi
  21:	48 89 df             	mov    %rbx,%rdi
  24:	e8 37 71 f9 ff       	call   0xfffffffffff97160
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  33:	fc ff df 
  36:	48 89 da             	mov    %rbx,%rdx
  39:	48 c1 ea 03          	shr    $0x3,%rdx
  3d:	80                   	.byte 0x80
  3e:	3c 02                	cmp    $0x2,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   9:	fc ff df 
   c:	48 89 da             	mov    %rbx,%rdx
   f:	48 c1 ea 03          	shr    $0x3,%rdx
  13:	80                   	.byte 0x80
  14:	3c 02                	cmp    $0x2,%al
[   21.475889][    T1] RSP: 0000:ffff888103277930 EFLAGS: 00010246
[   21.476304][    T1] RAX: 0000000000000000 RBX: ffffea000928ffc0 RCX: 0000000000000000
[   21.476840][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   21.477379][    T1] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
[   21.477894][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffffea000928ffc0
[   21.478424][    T1] R13: ffffea000928ffc0 R14: 0000000000000001 R15: ffffea000928fff0
[   21.478968][    T1] FS:  0000000000000000(0000) GS:ffffffff89ca3000(0000) knlGS:0000000000000000
[   21.479551][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.479997][    T1] CR2: ffff88843ffff000 CR3: 000000024a47d000 CR4: 00000000000406f0
[   21.480530][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   21.481084][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   21.481626][    T1] Call Trace:
[   21.481864][    T1]  <TASK>
[ 21.482069][ T1] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 21.482358][ T1] ? do_trap (arch/x86/kernel/traps.c:156 arch/x86/kernel/traps.c:197) 
[ 21.482675][ T1] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.483116][ T1] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:218) 
[ 21.483472][ T1] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.483908][ T1] ? handle_invalid_op (arch/x86/kernel/traps.c:256) 
[ 21.484289][ T1] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.484736][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:315) 
[ 21.485107][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 21.485513][ T1] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.485958][ T1] do_anonymous_page (mm/memory.c:4842) 
[ 21.486342][ T1] handle_pte_fault (mm/memory.c:5778) 
[ 21.486697][ T1] ? do_pte_missing (mm/memory.c:5735) 
[ 21.487066][ T1] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:84 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 21.487422][ T1] ? __pmd_alloc (mm/memory.c:6355) 
[ 21.487728][ T1] __handle_mm_fault (mm/memory.c:5921) 
[ 21.488063][ T1] ? mt_find (lib/maple_tree.c:6946) 
[ 21.488358][ T1] ? handle_pte_fault (mm/memory.c:5830) 
[ 21.488706][ T1] handle_mm_fault (mm/memory.c:6089) 
[ 21.489028][ T1] faultin_page (mm/gup.c:1189 (discriminator 2)) 
[ 21.489334][ T1] __get_user_pages (mm/gup.c:1487) 
[ 21.489666][ T1] ? follow_pmd_mask+0x360/0x360 
[ 21.490114][ T1] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 21.490430][ T1] ? get_arg_page (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:261 include/linux/jump_label.h:273 include/linux/mmap_lock.h:35 include/linux/mmap_lock.h:145 fs/exec.c:219) 
[ 21.490738][ T1] get_user_pages_remote (mm/gup.c:1753 mm/gup.c:2618) 
[ 21.491101][ T1] ? __get_user_pages (mm/gup.c:2611) 
[ 21.491435][ T1] get_arg_page (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:261 include/linux/jump_label.h:273 include/linux/mmap_lock.h:41 include/linux/mmap_lock.h:170 fs/exec.c:228) 
[ 21.491735][ T1] ? get_user_arg_ptr+0x70/0x70 
[ 21.492098][ T1] ? __bprm_mm_init (fs/exec.c:295) 
[ 21.492447][ T1] copy_string_kernel (fs/exec.c:685) 
[ 21.492792][ T1] kernel_execve (fs/exec.c:2000) 
[ 21.493115][ T1] ? rest_init (init/main.c:1461) 
[ 21.493425][ T1] kernel_init (init/main.c:1496) 
[ 21.493730][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 21.494087][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 21.494419][ T1] ? rest_init (init/main.c:1461) 
[ 21.494732][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   21.495085][    T1]  </TASK>
[   21.495305][    T1] Modules linked in:
[   21.495604][    T1] ---[ end trace 0000000000000000 ]---
[ 21.495969][ T1] RIP: 0010:folio_add_new_anon_rmap (include/linux/page-flags.h:1139 mm/rmap.c:1442) 
[ 21.496431][ T1] Code: 08 00 00 4c 8b 63 48 41 f6 c4 01 0f 84 87 f9 ff ff 49 83 ec 01 e9 81 f9 ff ff 48 c7 c6 e0 2c 0f 89 48 89 df e8 37 71 f9 ff 90 <0f> 0b 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 80 3c 02
All code
========
   0:	08 00                	or     %al,(%rax)
   2:	00 4c 8b 63          	add    %cl,0x63(%rbx,%rcx,4)
   6:	48                   	rex.W
   7:	41 f6 c4 01          	test   $0x1,%r12b
   b:	0f 84 87 f9 ff ff    	je     0xfffffffffffff998
  11:	49 83 ec 01          	sub    $0x1,%r12
  15:	e9 81 f9 ff ff       	jmp    0xfffffffffffff99b
  1a:	48 c7 c6 e0 2c 0f 89 	mov    $0xffffffff890f2ce0,%rsi
  21:	48 89 df             	mov    %rbx,%rdi
  24:	e8 37 71 f9 ff       	call   0xfffffffffff97160
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  33:	fc ff df 
  36:	48 89 da             	mov    %rbx,%rdx
  39:	48 c1 ea 03          	shr    $0x3,%rdx
  3d:	80                   	.byte 0x80
  3e:	3c 02                	cmp    $0x2,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   9:	fc ff df 
   c:	48 89 da             	mov    %rbx,%rdx
   f:	48 c1 ea 03          	shr    $0x3,%rdx
  13:	80                   	.byte 0x80
  14:	3c 02                	cmp    $0x2,%al


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241007/202410071738.73daae42-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


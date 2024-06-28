Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B522D05E
	for <oe-lkp@lists.linux.dev>; Fri, 28 Jun 2024 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559722; cv=fail; b=vGr5PHva34iSEkcs+vC99ZhFHh1OHHSq/mUyhI6jYybnwzjTAKmNU9rcqLtXV904rvEYtr2hU5+bRL8rv/bMnjNSe9xaMCTpvg2fSFBMZJHBHLXdwZcpMruKfxIzDauD7j8WgVxc2bn7gC4gA3M8c2DjqGpehlImK354xNwLvJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559722; c=relaxed/simple;
	bh=x1UrLccMfJR3G9lQtd81gRb3pQB509RR/OFVKl3BGvU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BDoPE1yjunaWjdMzWHcUElheJ1VrkGvrPcDMV04oy/1VSDdH4bpshSKpQqd62kLBmJPa6p1gM8Yb26bMdHcpYUizVTcSAy1hPKm8pzQ98QFOwlvqIOMWdpX1oX9UHRjcRNQ0+j0NZXVrQl/mR9r6tcQg8s0TuAwXtN/SP4wGmzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN95KBe2; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN95KBe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719559721; x=1751095721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1UrLccMfJR3G9lQtd81gRb3pQB509RR/OFVKl3BGvU=;
  b=UN95KBe2PhcJCg7vcM3cZMnIqtMz94qCH5yLhMWy70GzlgzKpBrK4dn5
   OtX6zHzgqyAm2zbw/lU1kRSdpM18NG0MLQsG6GEEu02y09oJ6PR9vmor0
   JpCnPNRnzuEreczpbMWcZBlxnGQCqGkiQMJs18HY/nWZDgVZpV/2FUUfa
   CU2helhsee5ioOV/TY1L9XSM+CxpOnWKpUT+h2n8RBK9ITTLBUBM8ox4+
   qyP8GCAc0zld8h801irqW779D1fMkqhZvgkCSUyMm51ftU9J42u2FpsQk
   V867mOaoEgwkww7pnJlITj5gP/JmNkkCGRl4z52A29Jl4bk0+TS5ei67m
   w==;
X-CSE-ConnectionGUID: SYMrtkRlQCGiE+V9xzFU8g==
X-CSE-MsgGUID: qugu+7eBQreq1Nu2WljmtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28130017"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="28130017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 00:28:40 -0700
X-CSE-ConnectionGUID: j6E9OLVoQmG7MLFUPfhaag==
X-CSE-MsgGUID: ovNrwCIRQdiOYTyBcPl3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49249690"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 00:28:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 00:28:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 00:28:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 00:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrArGAkmJae3F1Fv9dirB7JLhjy0oiUVIP1A1jAY006R466q+Au7C/YEoJuS1rNKBd/DtjGxG7acH6omuckA9bvwks5qP07jyu7Z8D6k7ZhoJ2SyxPhV7gN29SDoNct6Fn+2rwRkNQbPBzoW9O8qcx3PapEG7edKLJsqJiFEgEPxGtMyg6yUfzi7tJ2ICI43w4Og84ODsti9bY/rtbZnFkCGRyZYib8+Pzv/ait7MKIHtuxK549QXs66QkV5VBlD4sidv7c19C/ay2mOmaBofH7X1AfPHcSiex/Z3/svsTrRJ37Lk9hYuF445X3s/4BCfR6rw5r0gImQOHH5QSOx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze7w3U8PH7tL2vUCc1CEAoFa2wrRe9XyAo8XzoSnO38=;
 b=A8Sbzt8vItmn3C90Dc625Yx6284G6VOO4nGCKMYU+3ayw3iVGJVrIJeJTNFlBdisRHyaFXgP3Ozn/PnNHXcR0z3mXU8azlEQ6KXHTNtiTjxZcdcbRFN2cbNSDqaqvJi+IPi9xxW8EMNN63xp+EhARuxblgg8YjvYtVXkNTsCMEUSvjfkTyIqKMH8k9Fzb3eDfxyK7LbdL5f9nh0+rixNCGwhsBQMv3Ju6tFUzZ0XFWWjaHACIqqdgImPOTRONniWQmdIJYGF2Mefy0bjXJnW6F6yZQBqRLBbfhik1s4ttoXvv6G99UMUAaUT6jO92BazTPoHb0EcUig0so9sckHuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 07:28:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 07:28:36 +0000
Date: Fri, 28 Jun 2024 15:28:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [chrome-os:chromeos-6.1] [FROMLIST]  a49bf5f754:
 is_trying_to_release_lock(&vkms_crtc->enabled_lock)at
Message-ID: <202406281529.877b621c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa994e4-acfd-407f-4662-08dc9743ec30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HMp6I0OP+SRQjhUzUP9ONrrd6bzZfEScEjtWwYcHR7QTSEUsAddxg7mI0qwH?=
 =?us-ascii?Q?etdZsQ3/dHyBhxUOAkwNA1VcOgHah9yy4sqKx/QV5zBAC4rWiljFHZdbxuLQ?=
 =?us-ascii?Q?qxnDODqv85i+67zzcVO+FaiMZZVXhCEvgo1HIie5Ii6IYYhPJbifrR3xdSd8?=
 =?us-ascii?Q?y3r6B10NhLXVra8VU74nqVt08JDlXCHLCVz66Nl7eUXZdBDTqxvUfl5sbyZH?=
 =?us-ascii?Q?RKYG06d8yyvo6kiNyieYnRmolnTHRZ1oETR+XqfmOEupjk+4RZXJS9bgOUoF?=
 =?us-ascii?Q?hOSDasPBoXNWg0pVZ8uhxMlMS8fi74S8jek4RaOhCndz8PFkvMDguekOmzWv?=
 =?us-ascii?Q?Zg8rtO69ldPzmCTxLXjw9nbaltFPmtNOGKioHsOe3uZZHwbVCMNEViTS/7Zd?=
 =?us-ascii?Q?7HFHAxrfUcrMugOrlHU22fAEDYTZ55p6Qej/DsgQCJulWfNEZy1XYkBlqcys?=
 =?us-ascii?Q?v1Rxn89o3h/FvCPEi3kqSQsoT8+YMHvY85//JA5U/qoVo5CxZfEL2OOIp7IF?=
 =?us-ascii?Q?qFw/JnVl+AkOicOsBiO2JGRslZ/d9XgBok9C4ro1bHWDHE8aFwpY+zh1EeU9?=
 =?us-ascii?Q?kNaRUilzB3BIod1GtsXQmzCLxpHhbtS3m9lwoHAKpBT1aBlM9kEf94Bmr/FL?=
 =?us-ascii?Q?Gsx66DIqlhUzlqyRHhRr1TAAiCYSGf7d2aeSRvmoxGTdYyFsJpuXX9KKLYMM?=
 =?us-ascii?Q?TuPdcU1L6xaos/JtA7tObRf9vAcB7R3QTZH0f+BkKhQAoBVS3qsiFMFr4gAs?=
 =?us-ascii?Q?Xw7u73UQ8ePONqXXG5i96+E1Fs3RBc8TAiCg/tOyEB5/+JJhdnjcr5RPtUVz?=
 =?us-ascii?Q?Ow/qKTMjPcpUnnv7JReHbKAOQDHyvh66HLIrrPhcqTKskLJ0gbno2tm2/Pka?=
 =?us-ascii?Q?fipAOc7QpJ9wSIa0oS8S8ilubkPEcFnU3zyoyJR2aWPqN0DSlvYekpliSVgS?=
 =?us-ascii?Q?D4gV4JxCvYpF5VIQXQ8vpPHtg5LwJPJjIzKx1byP0IO0yoD5DUCIHQ5BqFYz?=
 =?us-ascii?Q?lfhPjhgQZ1GPYwKBTpo4wTryKHrsPGuAYYIM5yI7ICxJeeojkW6m2irOtHMV?=
 =?us-ascii?Q?taayjvZDzNC08YieDU8LlKRipresuwv2gDCsCITXGXRoJaTTFL0ZFvXpNYcJ?=
 =?us-ascii?Q?xvIDovpoRZ909HVqHSKhjJOrlNllAU/e7qpT29OucWPAVO++ya3dK8N1UmYB?=
 =?us-ascii?Q?N1xytWdFH0CqxTZcjmL57Q79dJztaKh5Jsf5CaWdZR4ysNiEBrxihWfGpNrs?=
 =?us-ascii?Q?nM/kthP8TanOMfyNRi/sU7GZP1GHzYblX1isonVRJsjHKPB34uLsbwPDfoQ2?=
 =?us-ascii?Q?gs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4h/pScu+gdbxNhYiYhDJuNDHgh4kB9vhszC1Y2pT7Dl/KB15O78SbMv1Jvh?=
 =?us-ascii?Q?KrXcaZ2mG08IoQNg/Els7XPaB5ugPV2vcSBjxvoGifcNtmoUvuC62ywVRqth?=
 =?us-ascii?Q?7/TAwhEMwjxuqHHYaic51jSi+RGF+0/H0nlaNdoOOgV+SCgpvDdgxcpzJvRJ?=
 =?us-ascii?Q?ekXHTE/wcZxiPCTdagCtUluWjpyV2qaODg29hDamQQx9ad3HIiVBMMpc6mbS?=
 =?us-ascii?Q?8+jhDR8OMFqQKL71qtiLirW6tySCTglj+QE41S/xFziDek/qnO8kO3iurtKw?=
 =?us-ascii?Q?kobg9BKdc71PKoHEXmyCXqbpfK0ZkPsLDjWY8n3W8nbuXrJgBCOmWvDyKRWC?=
 =?us-ascii?Q?kbF3h43alFkh3ZBlTvIoaIQk1GsE4HT5cJ8QPOGVFyq/MPY5EXUVkhGce+0o?=
 =?us-ascii?Q?jqyieVaFt8LbQdr++ycV1agrado98Am1twspcnA0fGEDFDfzDu4NZTJZYT8M?=
 =?us-ascii?Q?EluDumiwsw+HLwOeLWybhdYwOgmKap+AUmxIIBzqCqA2AYuB8AAi9y9KZ+ht?=
 =?us-ascii?Q?OY0ReIoyC2m29Xp3/k2utI5MgASUcHjTyjKNWcvn01G7xXEXgCWLeJEvHDZ2?=
 =?us-ascii?Q?IkcqcUhnqKlD7rfGSd4hyM+onggznmtMsyoWw9qkJa+OTMvM+GbuQ1WVaGgs?=
 =?us-ascii?Q?yFdyGTGJ5BqNV1dF3yd++8q7s7JdjnTFORXiufD7s3ObzEY6mSr06keL/tU2?=
 =?us-ascii?Q?NtbXkdFuRRwgADxQX6aUHH5lVc6SNEZ+O4+XpJnHMcGVYtc5d/b5g90w/XKU?=
 =?us-ascii?Q?g+e1x2VQOBcdpLtITQQw85NJjC93fw2dZkvAasHXSA3t/0irRLaYYtg/65XN?=
 =?us-ascii?Q?DLJCcCTipCab1r+gWgMYgdzneztod+3B4xFuQ45F+2THCa/z6llN/HRm9rq5?=
 =?us-ascii?Q?mDw6HummduCDKn28p3oUPs8cdfTYajvilaiRqj3gTj47oKz6BAeFlkG8O5y6?=
 =?us-ascii?Q?c4jvwV+WiDkRbAVsPNlHdmVeJTuAjTVodzntNcyWOp0phtAY8lTcm4zfSbLY?=
 =?us-ascii?Q?P8GrnTFeOwDxBuP9DfuRcAYkfL/C0w8nybPjGg+7OfmD5G71azf4sxiOBrTV?=
 =?us-ascii?Q?r7+vGN3wSPuSDvxTjT4WAShfYv8claQ0J3TsAsrPJ3SpzP4ivYxaaBT7ulUA?=
 =?us-ascii?Q?7iogK/xrfYwdFhfrPx8IoYdclg8HBpm+QPAL3uKj7ZLyQfA1ZKu3W9mdge4k?=
 =?us-ascii?Q?RuXvnUxfMV5adLyr6WrhSqBAADkcg82RQoFxIU0WF10fI5j7djrD3o8XSb6O?=
 =?us-ascii?Q?nQEvXOPFXa+gaQm2Nv88mM3OmUnc3oLmogF81EsOtCkpkSJWBcsR+I7bqFCG?=
 =?us-ascii?Q?NmthWxHkz3K+gVAzb9dBCbc3J+QpYU+zK1i3QXHRYqYMbkjcq2jH7qj2QLBr?=
 =?us-ascii?Q?nUR6byQcbgBA8QqOxWwER5+O8MvFXuqDtDehsPNcXF+Yw72B5kjjxdF9sByp?=
 =?us-ascii?Q?Dy119uG4f0EoVACwb9hvPPlm6ZV364ep4DoJ92xPYTIIqVVZnxHJmV1wKpHU?=
 =?us-ascii?Q?JFXswBLnqQ2Kp7GTAUEwtHvWg78jvo3ZhHrEduMxOk7VlIXYm1nQSh0s2apt?=
 =?us-ascii?Q?iXRBJZisP7AoI6boIs4KSaIyOO8if2u/L+N9Wx2I73vVxXH6C8rIECpJSJZk?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa994e4-acfd-407f-4662-08dc9743ec30
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 07:28:36.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpE5N5OorsRgtL8XJaWnf7iAhKsEJw02jE79mi+lNfrrNy3dIDWtP2KM8MDQMnGk/yy5oy2fVgrDXMfrYsHF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-OriginatorOrg: intel.com



Hello,

as we understand, this commit is not the root cause of this issue. the issue
just changes the form from (2) to (1) by this commit.

b0b32be302dbb7b5 a49bf5f754271c5a2c8154c2372
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     dmesg.is_trying_to_release_lock(&vkms_crtc->enabled_lock)at   <--- (1)
          6:6         -100%            :6     dmesg.is_trying_to_release_lock(&vkms_out->enabled_lock)at    <--- (2)


however, we failed to bisect the issue (2) to find out the real first bad commit

below report is just FYI what we observed in our tests.


kernel test robot noticed "is_trying_to_release_lock(&vkms_crtc->enabled_lock)at" on:

commit: a49bf5f754271c5a2c8154c2372d01cd06e1a31a ("FROMLIST: drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device")
https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1

in testcase: boot

compiler: gcc-10
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406281529.877b621c-oliver.sang@intel.com


[   14.694327][    C0] WARNING: bad unlock balance detected!
[   14.694329][    C0] 6.1.49-05308-ga49bf5f75427 #1 Tainted: G                T
[   14.694332][    C0] -------------------------------------
[   14.694333][    C0] swapper/0 is trying to release lock (&vkms_crtc->enabled_lock) at:
[ 14.694340][ C0] vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[   14.695188][    C0] but there are no more locks to release!
[   14.695189][    C0]
[   14.695189][    C0] other info that might help us debug this:
[   14.695190][    C0] no locks held by swapper/0.
[   14.695192][    C0]
[   14.695192][    C0] stack backtrace:
[   14.695194][    C0] CPU: 0 PID: 0 Comm: swapper Tainted: G                T  6.1.49-05308-ga49bf5f75427 #1 0e052e91df9189c0224d2991061b13f5653ceabd
[   14.695199][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   14.695201][    C0] Call Trace:
[   14.695204][    C0]  <IRQ>
[ 14.695206][ C0] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4)) 
[ 14.695211][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 14.695214][ C0] __lock_release.cold (kernel/locking/lockdep.c:3964 kernel/locking/lockdep.c:5346) 
[ 14.695220][ C0] ? lock_downgrade (kernel/locking/lockdep.c:5321) 
[ 14.695225][ C0] ? drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:1984) 
[ 14.695230][ C0] ? __lock_release (kernel/locking/lockdep.c:5345) 
[ 14.695234][ C0] ? lock_downgrade (kernel/locking/lockdep.c:5321) 
[ 14.695238][ C0] ? vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 14.695241][ C0] lock_release (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5691) 
[ 14.695245][ C0] __mutex_unlock_slowpath (include/linux/instrumented.h:72 include/linux/atomic/atomic-instrumented.h:1265 kernel/locking/mutex.c:916) 
[ 14.695250][ C0] ? drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:1984) 
[ 14.695254][ C0] ? bit_wait_timeout (kernel/locking/mutex.c:902) 
[ 14.695258][ C0] vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:36) 
[ 14.695261][ C0] ? vkms_atomic_crtc_destroy_state (drivers/gpu/drm/vkms/vkms_crtc.c:14) 
[ 14.695264][ C0] __run_hrtimer+0x2a3/0x4d0 
[ 14.695269][ C0] __hrtimer_run_queues+0x11a/0x1b0 
[ 14.695273][ C0] ? __run_hrtimer+0x4d0/0x4d0 
[ 14.695276][ C0] ? ktime_get_update_offsets_now (kernel/time/timekeeping.c:292 (discriminator 4) kernel/time/timekeeping.c:388 (discriminator 4) kernel/time/timekeeping.c:2330 (discriminator 4)) 
[ 14.695280][ C0] hrtimer_run_queues (kernel/time/hrtimer.c:1925) 
[ 14.695284][ C0] update_process_times (kernel/time/timer.c:2049 kernel/time/timer.c:2070) 
[ 14.695287][ C0] tick_nohz_handler (kernel/time/tick-sched.c:255 kernel/time/tick-sched.c:1387) 
[ 14.695292][ C0] __sysvec_apic_timer_interrupt (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/kernel/apic/apic.c:1113) 
[ 14.695298][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1106 (discriminator 14)) 
[   14.695303][    C0]  </IRQ>
[   14.695304][    C0]  <TASK>
[ 14.695305][ C0] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:649) 
[ 14.695309][ C0] RIP: 0010:native_safe_halt (arch/x86/include/asm/irqflags.h:52) 
[ 14.695313][ C0] Code: 34 24 eb e3 e8 02 90 6e fd eb ae e8 bb 8f 6e fd e9 75 ff ff ff 66 0f 1f 44 00 00 f3 0f 1e fa eb 07 0f 00 2d 63 02 57 00 fb f4 <c3> cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa eb
All code
========
   0:	34 24                	xor    $0x24,%al
   2:	eb e3                	jmp    0xffffffffffffffe7
   4:	e8 02 90 6e fd       	callq  0xfffffffffd6e900b
   9:	eb ae                	jmp    0xffffffffffffffb9
   b:	e8 bb 8f 6e fd       	callq  0xfffffffffd6e8fcb
  10:	e9 75 ff ff ff       	jmpq   0xffffffffffffff8a
  15:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  1b:	f3 0f 1e fa          	endbr64 
  1f:	eb 07                	jmp    0x28
  21:	0f 00 2d 63 02 57 00 	verw   0x570263(%rip)        # 0x57028b
  28:	fb                   	sti    
  29:	f4                   	hlt    
  2a:*	c3                   	retq   		<-- trapping instruction
  2b:	cc                   	int3   
  2c:	cc                   	int3   
  2d:	cc                   	int3   
  2e:	cc                   	int3   
  2f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  36:	00 00 00 00 
  3a:	90                   	nop
  3b:	f3 0f 1e fa          	endbr64 
  3f:	eb                   	.byte 0xeb

Code starting with the faulting instruction
===========================================
   0:	c3                   	retq   
   1:	cc                   	int3   
   2:	cc                   	int3   
   3:	cc                   	int3   
   4:	cc                   	int3   
   5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
   c:	00 00 00 00 
  10:	90                   	nop
  11:	f3 0f 1e fa          	endbr64 
  15:	eb                   	.byte 0xeb
[   14.695316][    C0] RSP: 0000:ffffffff85607e58 EFLAGS: 00000206
[   14.695320][    C0] RAX: ffffffff83f04ed0 RBX: ffffffff8569c180 RCX: 1ffffffff0d300d9
[   14.695323][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff83f052d3
[   14.695325][    C0] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff8569c187
[   14.695327][    C0] R10: fffffbfff0ad3830 R11: 0000000000000001 R12: 0000000000000000
[   14.695329][    C0] R13: ffffffff8569c180 R14: dffffc0000000000 R15: 0000000000000000
[ 14.695331][ C0] ? __sched_text_end (arch/x86/kernel/process.c:729) 
[ 14.695334][ C0] ? default_idle_call (kernel/sched/idle.c:104) 
[ 14.695338][ C0] default_idle (arch/x86/include/asm/paravirt.h:173 arch/x86/kernel/process.c:730) 
[ 14.695340][ C0] default_idle_call (arch/x86/include/asm/paravirt.h:699 kernel/sched/idle.c:117) 
[ 14.695343][ C0] cpuidle_idle_call (kernel/sched/idle.c:192) 
[ 14.695348][ C0] ? arch_cpu_idle_exit+0x40/0x40 
[ 14.695352][ C0] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4556) 
[ 14.695357][ C0] do_idle (kernel/sched/idle.c:303) 
[ 14.695361][ C0] cpu_startup_entry (kernel/sched/idle.c:399 (discriminator 1)) 
[ 14.695365][ C0] rest_init (init/main.c:727) 
[ 14.695368][ C0] ? acpi_subsystem_init (drivers/acpi/bus.c:1256) 
[ 14.695372][ C0] arch_call_rest_init+0xe/0x44 
[ 14.695377][ C0] start_kernel (init/main.c:1135) 
[ 14.695382][ C0] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:358) 
[   14.695386][    C0]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240628/202406281529.877b621c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


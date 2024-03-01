Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB36A356
	for <oe-lkp@lists.linux.dev>; Fri,  1 Mar 2024 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709285660; cv=fail; b=hBGb6J17D8tBKriy4AV2jOW6ixj7gt7jLXG5YWxLOJTa4gspGL6nFpRfd4gnRXasziMJwDSse11niA/Nk1TNTKZKoB1QRn6CJF6V4BKg8kd8jVhwRaxUs14CKldhy2Ab/9+osQNMFThhhPESRoqVmKQxcr16Q3CnKXBlZPLT/+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709285660; c=relaxed/simple;
	bh=U2uCXcVBLfIeegRwfKFzezYcLCgIX1kZuyZ86qQHUYY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eprCE/iYaDhx5U2jSxDbg4zI6gajzIB3olcbmpSHW9/wiv6J8L9zkNzAcFESftZk4XqzZXArkrEh/38tRqCoQYPU+IjupW2h9ilCT/O9Yd+Ri9hYlCUaqlyL78hfJpAKrudtYoaXb3NUPEJlwGwXda6mKN/0MlMME82J0YDYUHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQry2pSM; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQry2pSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709285658; x=1740821658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2uCXcVBLfIeegRwfKFzezYcLCgIX1kZuyZ86qQHUYY=;
  b=cQry2pSMfnt8Xd8QRORaBxehYa9c5QxSrdXeJdz/zHe05zKmE13iKOrG
   lxpjmWbAHai5wc7/LcrrWv2RdAgCgKhSisxfZgTHgfqFc2kDRh/CU5O8C
   vjyeTDp54zNj3kyZVFQnQgyCCoyq3DrGJVof+f74KDtOqzvxyzR5zixBb
   ugVly7MIVCHGE1KjEM1cB8siDz640ZmG7lG/HNK4elgNqdUzJXMzTD4EH
   BFC0c1iPwxpQhP+yuRt8uwF7VfN5E4euTTBlx0R5Ub4o7wC7YgCtLb8+M
   D7Nw6YVVKIo1owI7888XM50GMGiiijDfVM/l3RgXzCp+e5OphD65GSEgn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14385442"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="14385442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 01:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8380834"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Mar 2024 01:34:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 01:34:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 01:34:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 01:34:15 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 01:34:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYGtWlCrk+ghpWHRFRRfFaj5E5nD1x9OvKaVVHFO1gUa6XMahMo7FYbIDJ1KV/+6/nqhpbq+f5rjZ6dqETpjNBZeGBZDb8htqFl7uAFMwKK3g+4NdG9ZMlb8iKYTabOwVR1W6jrol4AGrO3RszGoTM5NqYA2u3InS6FERw6oo0Pg8/CGLYqVwJz4199A/zSP30j8Fh3HwPhaMce/Ttd+zfRZ7hFZVMV5io//E5LfJAYHdo9lKRA7S/P8G722JZAGtblMEg0NS7pR+eKBQ3gQJNQEHy0hQWGAefN6uAb8cnsU0u44Nd8q826bONRLCRCo2+42Om+qBTMcEHiWpI9/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFyM6aELSnPmniTK3nnRqMvIi0wmstI9i3xCwk42Xg0=;
 b=QAJLH4EBEB+LIjXUpIKDJkKZ8A9xpTgRJ89aSUFovEqNcfxmIFM+Pj4lHMM44yy81SV5mqcjgmbwS3riKsYucGCfwmJ0D8NRryrL5YdmCYslGihMJ3OH/zrE4+Pzkx+vqeiRbtZVlNvdDQ4PF/XEZBdWKm1r4zQyBYpFFk85QWV0OwMlw9FDJqzKMkZYt4JsW9LJVT5qdvNsjThm2WWVCXdVur86ARDTku495YV+xIHGPngUGOTWas2iwe3VBUdqvK8Mgw5jhYc700doLEvWTq85jZFpiySnsRVzVG8E+NAicDirD2skbAaTE3r9dAWroVXgelEpybgMj6pVw7ShVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 09:34:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 09:34:12 +0000
Date: Fri, 1 Mar 2024 17:34:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Oscar Salvador <osalvador@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Marco Elver
	<elver@google.com>, Vlastimil Babka <vbabka@suse.cz>, Andrey Konovalov
	<andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, Michal Hocko
	<mhocko@suse.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm,page_owner]  217b2119b9:
 WARNING:at_lib/refcount.c:#refcount_warn_saturate
Message-ID: <202403011746.b71e99d5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f08d9c-b7a6-4487-cf34-08dc39d2c092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j5IsNXH8NPit1gRDAJIPIlNVFn8yWt3D59Yl7FxbQVenqK7vqEEvWzgSnAuJrB3KR81iz1hl23QrLRLSOBBBPSwHX+1R/1ZZO7lkCLectsx8fnsL81OooJPkwjUHIqNtp9j5OO8HSbRXuDtC6LGHgBRhiIKlQxOZzY8rhcAdGAbz3e0npNxJncDhR7Y/2FFP8Zu8TSqKFXwTefLYxbsekQYcN1QSkSi5fYEdeQ4Gg762EFAN2+NCVtycc7ootvHYzD+T5z+cQlpJ/3OR7QtZlHfeblr7In3LWDl5AWB4qxT20kNIh7T0LW4ktxp27v1IxyBYvuR1Qb15XrgqbqA9mggTFJ3Swu2SJkWvC2fVJdNnsEwXgkkey4wyup4hGPFI5pLJ2s98yp3gPrUkyP/dfMx9IggaJ57suCjPKh4LrvvoIF/aqgckHDqs6ZF0i8WGzvkM3zvzZm6xS11ti4uHU24fUbFb+WBLW+4y/7ZxwY36Sb4ww3bebZ5kOonl6/LX60EVqapdqapq8yWVZPY9iL0Ty+q+h/bHsJD9VUoKKyQteJChdL7eSREm27Fip5jth0kHVQOiBys12FI9LsrfV0n6aUJnydaH+LpFP/iEfKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tjjTJ6db8v6Kl7Pn12MJZmY+Qdz7XzgHVo/ba+m4OGX14ZUzjhWplJPIHWhv?=
 =?us-ascii?Q?BbQzN5yQtFfgSMtojQQxbR6021sjmFQx5dnvsGp+WKir+17HqeEArFF6SldG?=
 =?us-ascii?Q?tIjxikteLyHIb5sBRiMx/XPLYvV6e1ntyoYPtZT4II+ph27xBddVYYQ8fRvq?=
 =?us-ascii?Q?cXvBYxtTYSj851S9h0BhovqNYG2AlJsgZHfKUqlvNhY521IaD8RFkDsGo/bV?=
 =?us-ascii?Q?R4UXXr70clJAchpJSEo3j1NZZqS45aYXHbLiBvA7qrAvrHn93BIb6bmTvSqP?=
 =?us-ascii?Q?GY8JLlAfeLwY8CKG7eJRcgCTgb0IbkLyB2axdUiTpk8fM8j6Zzqm4BeD97Mr?=
 =?us-ascii?Q?omaM5Cmp1ngYlDZhdIrj0sF8dJnX8dGOWU1FckFq62HCGx9ieqaPYfV0yJ96?=
 =?us-ascii?Q?Ukb2SFJ2JQK1Kgv7+Z3ViSqY8r3Ufgt7SMffhxN8blW/g+BBA6sa602MK+Hp?=
 =?us-ascii?Q?MLNuYxtTfyLdsiU/SE2BcajGNazXQrzwu0ZJ2ShWEDjKVruK6zqbXU4nsW3r?=
 =?us-ascii?Q?5+9s7tkFAmeb9lQEgcx6CQtFKasHAZNEV7kpeky/a6zG8+b8ldQifIkzsWa0?=
 =?us-ascii?Q?VCi5xyBO6swEqagWSYLl9zMDJsepmSRBzQUMr1/v03NFoP+HM0cYeLgBw+/e?=
 =?us-ascii?Q?d9d0uymfP/+nx+0xF8i7Vbad2gPCfCT8ARh6cFehu2ahMKC8jmfrtZBLfVXk?=
 =?us-ascii?Q?UMQftNycAj2Pxov/pSg1svshtRUt1PVjKC8K0eSYaAs2TQi49PTNRGEY47md?=
 =?us-ascii?Q?PTrugFO85D23sFZE9FAiPhxTV356z5nCfTzn1SQW/Ytk3B5qGLkSo0cWg+N7?=
 =?us-ascii?Q?LnlBayxaM/TbPAlcYxLlM5S8Z2qq5KrAK2YMI8H9wYdgw3B53YD+i8N7y6Tc?=
 =?us-ascii?Q?JI/4t1/k/SEAC3ngSx9aRdcWGxgi+0A7lnBPZC1Az+gwA1SkmQgCrJSDTIdp?=
 =?us-ascii?Q?ZCjg6w+n8GMz4FQ/iNx1r859Nxl/CLZq5SIjsH9FyN9W1qBwBdjK9Xo2iFh+?=
 =?us-ascii?Q?8ECNwzvAgc5w+9T1ij5x0cBM503qfBVPTjg4J6lgGq5IvSXQBVHoRMahnUf0?=
 =?us-ascii?Q?87qkWxWbBruppzyHVwjRCnCfNkrLaBsXw0IZjuCx2xjkKs+7BqH+g5+lSKGN?=
 =?us-ascii?Q?wUEdvZoqgVRWUpFv+QQ9DMyyfi5ftruRrbIFk4JrPOsTAbV3l8ziVb4YxHN5?=
 =?us-ascii?Q?jJikqox+1QOmS572NQPPYrJtKkcYsv9Vg064FoF7M1wOhjipmSEq2steCddc?=
 =?us-ascii?Q?iBngZs3WcgyFBASMDOSpNoUCZ7WmmFrMoHUBAwDMj4KZuMB/Orozshtfzk9l?=
 =?us-ascii?Q?Ln5kLgKqRfIPTKa/3etEiPJPTesS55spVMge3GKcTwbEa1g8A3g24WJKcE2i?=
 =?us-ascii?Q?z4aSRxGrkhv2F5av/pnx7uftN9xeh6ttC+BFKE892Z/s8Vk/cIKRLODfY1Gh?=
 =?us-ascii?Q?MSI0rnqI51H0B1EGNmX8cSkbWbqOVd9QQfFsKhPlp06Pjjdpd8NLLd6Lx8r4?=
 =?us-ascii?Q?r9pjiuuEcHNg2TPqB7tAOnd1l/v0GYTNDuwpTBn1j7taqsWfqv03WbDrQ1X7?=
 =?us-ascii?Q?51neyAg9P7ao5Sn6wDydjJS/kT6JP2DGGIoAC+wzfqemfkdYad6FUmLag6jh?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f08d9c-b7a6-4487-cf34-08dc39d2c092
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 09:34:11.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eSdN5iSi66AoA5WdmsXaKaniiEtO48IKqrg9DjtbTxG7CIXe7z/jO8RK/yh035G4U7FmiW1UgvzxICRTZAzKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_lib/refcount.c:#refcount_warn_saturate" on:

commit: 217b2119b9e260609958db413876f211038f00ee ("mm,page_owner: implement the tracking of the stacks count")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f303a3e2bcfba900efb5aee55236d17030e9f882]

in testcase: boot

compiler: clang-17
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 4bedfb314b | 217b2119b9 |
+---------------------------------------------------+------------+------------+
| WARNING:at_lib/refcount.c:#refcount_warn_saturate | 0          | 6          |
| RIP:refcount_warn_saturate                        | 0          | 6          |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403011746.b71e99d5-lkp@intel.com


[    4.132173][    T1] ------------[ cut here ]------------
[    4.133153][    T1] refcount_t: decrement hit 0; leaking memory.
[ 4.134206][ T1] WARNING: CPU: 1 PID: 1 at lib/refcount.c:31 refcount_warn_saturate (lib/refcount.c:31) 
[    4.135726][    T1] Modules linked in:
[    4.136540][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.8.0-rc5-00257-g217b2119b9e2 #1 e0c7826819574aeba2e92ce6a75f2ad963cf125b
[    4.138506][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 4.140291][ T1] RIP: 0010:refcount_warn_saturate (lib/refcount.c:31) 
[ 4.141315][ T1] Code: 00 83 fb 04 0f 85 b8 00 00 00 80 3d 22 14 ce 02 00 0f 85 b4 00 00 00 c6 05 15 14 ce 02 01 48 c7 c7 e0 8d f0 83 e8 ea 30 b1 fe <0f> 0b e9 9a 00 00 00 85 db 74 6d 83 fb 01 0f 85 84 00 00 00 80 3d
All code
========
   0:	00 83 fb 04 0f 85    	add    %al,-0x7af0fb05(%rbx)
   6:	b8 00 00 00 80       	mov    $0x80000000,%eax
   b:	3d 22 14 ce 02       	cmp    $0x2ce1422,%eax
  10:	00 0f                	add    %cl,(%rdi)
  12:	85 b4 00 00 00 c6 05 	test   %esi,0x5c60000(%rax,%rax,1)
  19:	15 14 ce 02 01       	adc    $0x102ce14,%eax
  1e:	48 c7 c7 e0 8d f0 83 	mov    $0xffffffff83f08de0,%rdi
  25:	e8 ea 30 b1 fe       	call   0xfffffffffeb13114
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 9a 00 00 00       	jmp    0xcb
  31:	85 db                	test   %ebx,%ebx
  33:	74 6d                	je     0xa2
  35:	83 fb 01             	cmp    $0x1,%ebx
  38:	0f 85 84 00 00 00    	jne    0xc2
  3e:	80                   	.byte 0x80
  3f:	3d                   	.byte 0x3d

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 9a 00 00 00       	jmp    0xa1
   7:	85 db                	test   %ebx,%ebx
   9:	74 6d                	je     0x78
   b:	83 fb 01             	cmp    $0x1,%ebx
   e:	0f 85 84 00 00 00    	jne    0x98
  14:	80                   	.byte 0x80
  15:	3d                   	.byte 0x3d
[    4.144492][    T1] RSP: 0000:ffffc9000001f910 EFLAGS: 00010246
[    4.145506][    T1] RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000000000
[    4.146847][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    4.151525][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[    4.152918][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    4.154267][    T1] R13: 0000000000000000 R14: ffff88810129f82c R15: ffffea0004006440
[    4.155622][    T1] FS:  0000000000000000(0000) GS:ffff8883af100000(0000) knlGS:0000000000000000
[    4.157117][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.158206][    T1] CR2: 0000000000000000 CR3: 0000000004872000 CR4: 00000000000406b0
[    4.159557][    T1] Call Trace:
[    4.160182][    T1]  <TASK>
[ 4.160753][ T1] ? __warn (kernel/panic.c:236 kernel/panic.c:677) 
[ 4.161495][ T1] ? refcount_warn_saturate (lib/refcount.c:31) 
[ 4.162430][ T1] ? refcount_warn_saturate (lib/refcount.c:31) 
[ 4.163372][ T1] ? report_bug (lib/bug.c:?) 
[ 4.164178][ T1] ? console_unlock (kernel/printk/printk.c:3055) 
[ 4.165032][ T1] ? handle_bug (arch/x86/kernel/traps.c:238) 
[ 4.165799][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:259) 
[ 4.166609][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 4.167490][ T1] ? refcount_warn_saturate (lib/refcount.c:31) 
[ 4.168438][ T1] __free_pages_ok (include/linux/page_owner.h:?) 
[ 4.169280][ T1] make_alloc_exact (mm/page_alloc.c:4810) 
[ 4.170112][ T1] alloc_large_system_hash (mm/mm_init.c:2529) 
[ 4.171054][ T1] inet_hashinfo2_init (net/ipv4/inet_hashtables.c:1171) 
[ 4.171933][ T1] tcp_init (net/ipv4/tcp.c:4711) 
[ 4.172669][ T1] inet_init (net/ipv4/af_inet.c:2031) 
[ 4.173424][ T1] do_one_initcall (init/main.c:1237) 
[ 4.174255][ T1] ? ipv4_offload_init (include/net/raw.h:52 net/ipv4/af_inet.c:1961) 
[ 4.175119][ T1] ? kasan_save_track (arch/x86/include/asm/current.h:42 mm/kasan/common.c:60 mm/kasan/common.c:69) 
[ 4.175978][ T1] ? kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68) 
[ 4.176817][ T1] ? __kasan_kmalloc (mm/kasan/common.c:391) 
[ 4.177656][ T1] ? __kmalloc (include/linux/kasan.h:211 mm/slub.c:3981 mm/slub.c:3994) 
[ 4.178433][ T1] ? do_initcalls (init/main.c:1309) 
[ 4.179231][ T1] ? kernel_init_freeable (init/main.c:1557) 
[ 4.180152][ T1] ? kernel_init (init/main.c:1445) 
[ 4.180940][ T1] ? ret_from_fork (arch/x86/kernel/process.c:153) 
[ 4.181745][ T1] ? ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[ 4.182620][ T1] ? parameq (include/linux/fortify-string.h:210 kernel/params.c:99) 
[ 4.183361][ T1] ? do_initcall_level (init/main.c:1284) 
[ 4.184245][ T1] ? parse_args (kernel/params.c:?) 
[ 4.185051][ T1] do_initcall_level (init/main.c:1298) 
[ 4.185906][ T1] ? kernel_init (init/main.c:1445) 
[ 4.186687][ T1] do_initcalls (init/main.c:1312) 
[ 4.187455][ T1] kernel_init_freeable (init/main.c:1557) 
[ 4.188362][ T1] ? rest_init (init/main.c:1441) 
[ 4.189145][ T1] kernel_init (init/main.c:1445) 
[ 4.189901][ T1] ? rest_init (init/main.c:1441) 
[ 4.190666][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 4.191452][ T1] ? rest_init (init/main.c:1441) 
[ 4.192256][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[    4.193098][    T1]  </TASK>
[    4.193666][    T1] irq event stamp: 458467
[ 4.194429][ T1] hardirqs last enabled at (458477): console_unlock (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 arch/x86/include/asm/irqflags.h:135 kernel/printk/printk.c:341 kernel/printk/printk.c:2706 kernel/printk/printk.c:3038) 
[ 4.196026][ T1] hardirqs last disabled at (458488): console_unlock (kernel/printk/printk.c:339) 
[ 4.197593][ T1] softirqs last enabled at (458442): irq_exit_rcu (kernel/softirq.c:646) 
[ 4.199121][ T1] softirqs last disabled at (458437): irq_exit_rcu (kernel/softirq.c:646) 
[    4.200648][    T1] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240301/202403011746.b71e99d5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


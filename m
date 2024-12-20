Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF26566A
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734662811; cv=fail; b=XlYXVUwevK/8Dso0ViaLjSfUvu5AcKpL1BVARJZWy7KOfyG1HINw7nnYrSJ67jI/lZ2jcknKt9LH8LPF2OYxzsPtCZztCQ1rpV5+HZpymGhLcYFusmpbTJH5ySDfiMF3fvBAreaNf3iIm7q39AoDA5WWNj8R+My0vn1+fudyrq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734662811; c=relaxed/simple;
	bh=9NsIBCoEQGj/nREiNy0Yk/vhQQtvvO6Hf3E3yWTdneg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=vGhQUcIeNpOD8OPal1DmKKPRWfA9KTsmMqIn6L1FRrsqdlcofgTR415qCL2cFS9XXROLtdkyyA/rMRvX37R3nDXJKPpvNX45kRSsNyAtCk7ktfU4WiY8bOkcLDGLli+Y4qxFuJNfMGPcD+jU5mryVG6APqp65n5jRZgQ/Vh5uag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms+d4ZeV; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms+d4ZeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734662809; x=1766198809;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=9NsIBCoEQGj/nREiNy0Yk/vhQQtvvO6Hf3E3yWTdneg=;
  b=ms+d4ZeVq2Ff9hrwwUZt0CGrx/uIlw7KOAdmC/rFQYVVFTo6xiZiZ5HG
   jDWmiMCcS9WeFSHTMLdo6njy4Dx2EJR6EiC10U/xuHzm2iErxpm8jQH8e
   ZoCyXcSck6CfU8Ozae9Z/1WgLSHzArdkuZuuDt65Omij2mqKi3ZZg4n+W
   4Eb3ziuVrWcRs5fCGwTThgM/2vLqkxGE/eVkrQZbrVTGiwhZkQIBcWS1W
   smsGweUzD+9Jc8eJN1bWN0uLDRcXcl9GiwHdIvPIw5ell0oDJld0oFzkY
   24tMw7WU2xJ9/QXo17oZaDI37s8BB8exI972+qnso8zIQGg47DgqAb2V/
   w==;
X-CSE-ConnectionGUID: GisurWHETlW1jcQtodhGiQ==
X-CSE-MsgGUID: mw8H/pcwT+aPIjtoehM+Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35088392"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35088392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:46:49 -0800
X-CSE-ConnectionGUID: ForKSAL6QJ2DmvzdW9B7TA==
X-CSE-MsgGUID: /T3AsUpbQ9aZESUBQ8FE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129346791"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 18:46:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 18:46:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 18:46:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 18:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkWvhNKYNYcDyehz2NjBqZAHoUiceTfpjzthxKiDH22sFL7G2bgi9k1tYGgV+Uv74yC5FllSqPqiSSaTe3TmqZ4oy0eoikkBb34u4z0Uq9Qp3Pqtzy9u9ONpHFU4eUxST0Fitr53lr9+ker22+1QZI67/MXPAPGDV/gSHaTZKcpYqGjeM6vUvY8LEg7E/mkn8FBCt/Kzg1XlUQsl8WjfsRk532SghDcUWCrajRXlrzv0rDnA2019fM2k/nUmDIuJ+N8hjFrTJmEOTzan+2Z5MU0JG/F3+wCKq+R9p5jVLigDakZBB2spiAQyaSXLG4DBvjLDGkZFiqWjdePvGeXCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McbdG5csynKRmkEK9hI21i0hqNedyKrCMp6491SuBWg=;
 b=Lhw73x4flrY+unW06ip9acnGTj/NLhThMk6T3dWBukltgJ+iF9wzUGo4xRzaXaaLy/BrhreTe5P5tnsnKoDOfQEMGGTpQaklN/2oiHS3KKrgeo2j9x8VHk4Q9fyy7sL5m6n5Vf3PqKmaBv7LaoIBICKVbXYkOiYFF1w/KXLQrg2B0gdCl/Bm7dKkIF+nTLVzDjTUOeJ0kcnYaQW9Je/rUFumS1ZEEOq56tSL5wU8e6vCjknoYt5P60LImIIWFUZP+GSWC7zVE0a4FKolpd0BxvoHuw+lZORthBs/NU/+9nlpWb7ckQA4OTf8oHQMFSlPA8pB34EP/mFIqRPw8j6RSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Fri, 20 Dec
 2024 02:46:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 02:46:45 +0000
Date: Fri, 20 Dec 2024 10:46:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/core]  ea9cffc0a1: stream.triad_bandwidth_MBps
 1.1% improvement
Message-ID: <202412201007.aa43a5fa-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: f36eb891-66e5-4838-1d23-08dd20a08aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h5sQLWeTJyujF13xs5b4tzozeip3salImtm9MPEPvtg29tmYK0uHJSbfK7?=
 =?iso-8859-1?Q?vd/My7FgrlL3gXB3tD3nmp44BkInPUW2GGmZPfICBPyeUP6bDFAj9gfkvU?=
 =?iso-8859-1?Q?pgVhCI7C5XqgpZy1jWHo7uwHTRoLZ/a514brRaCW/uzE57IVJE0n7XeHi4?=
 =?iso-8859-1?Q?BE4CA/qJVu+mzAvShi3SnUy1vg46n+HlTLfig1A+YT/QohhkZk7sz8mt8l?=
 =?iso-8859-1?Q?4I6svI4r7ERUftYp0QMhOY5QGcP0JXwBBbnhN49BgY3IT926Ha2zJkxa50?=
 =?iso-8859-1?Q?8WpoYiLKdDyBXbrbeU3seVWFocm8KTqytFw8ppKS0fc/GjASVELzrPpoec?=
 =?iso-8859-1?Q?QAcBk6/ZOPIrBEjPcjclJh6TLlYW4PcIjXR/5TwPpyasIctEtH1CYrgOUE?=
 =?iso-8859-1?Q?gPFIdtqw46Ts8K1INFN2z8DYPtyZHFkedXbFyvPkvmeQJhX39+6CcvoMi1?=
 =?iso-8859-1?Q?yDNnaT94lX/cBySWezIF0JkGFzEfcEBcqLu9j4gTlv87NMS0Pw7xNMzGTC?=
 =?iso-8859-1?Q?5yCHklvjA2xwejGMcjl8c0q7yJVEAGs1wvZp+fN0t+c34VorTKvPTBA71J?=
 =?iso-8859-1?Q?IJUhJ7fOjpwRyqn33UXKNZ+wAPIBZmls6N8JoC7bqF+kFVqvQ5QMO5dthS?=
 =?iso-8859-1?Q?ccwvfyvzzdgZL07zGiBWbDRYwYy/XuGCSIWhyiSXiUpQsMBY3YJ4kIkkw7?=
 =?iso-8859-1?Q?rHVIFFDVvgDCvB2fcha+okVukyjkFXcrrl44kde7Kq+q/9TqiDJCmVlnd3?=
 =?iso-8859-1?Q?Om6x49AHjaGzkLFs9SkU7OGyQh/QyC8vpbVq6Z9RjgfdKVWW+nVb3dwmhH?=
 =?iso-8859-1?Q?QzS7pzFKoBE7ZprVfafo+OQ94B+r0FSII8ykRwmaPwO+Mm7akGLLg4rYOn?=
 =?iso-8859-1?Q?sa1YCf3DVdW1EkqAeN/mW8YPumnQAdd39IMF8231QmhPQ0JsbiSVRIJf0T?=
 =?iso-8859-1?Q?QhrM7REShs5G3HXUOowzjXLOhxk30w+8WUrpDV7qAdqipsS7C3SXv0V6da?=
 =?iso-8859-1?Q?U48mXfsSOtNnx87NZ6+V+PTJf/jx89rHN4mfU6EQRp6N0fOrwxdRLWRagj?=
 =?iso-8859-1?Q?2Nt5ctJP5TK2krZrjM5hLGFLBvPxGIeqSIzj/LdDkZiCwygNPZu3G9R6be?=
 =?iso-8859-1?Q?9MQBA6Ozof9pg+23ewlYd2VuzarzBKUUooINfNnhfUvTIbbeC9G9w8+ya+?=
 =?iso-8859-1?Q?AVqnyfPU8QPl5cCFzlOqOaqIcact+WXjJI6qM8K+Kr2NFtKFpzaRozVAJV?=
 =?iso-8859-1?Q?rNf/y+WhWz8JB6D00y1U7vgHShGOPCSJR1R4D7F369zE+dGT2fNYWm5UUs?=
 =?iso-8859-1?Q?EiTr1zOhaGIWDhLz7obwdm3AtPV4h8pY8spL8FZWoAzdA0HuMw/+2NTSFe?=
 =?iso-8859-1?Q?pJoBbcMIF4uCnw5bmXOhlJ74AS1LZuTRarvyHBzLJp4zlnD3nlHd1ksfSp?=
 =?iso-8859-1?Q?2OH4TsaAjasIm+bYG8yxbUELWfc4PPqHCSOfqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NVYu9TzOUDn8UDn86X1xQANJRsG3D6teAx0KvVG4AUM1eZEqzGxyBENQ6D?=
 =?iso-8859-1?Q?O7joVC1DUgzF0mJ4e9U3SJUIRNmltYpTv4+DF4+CC1rFpQsG3AEHVyjKsh?=
 =?iso-8859-1?Q?OOojIsRzHgV6UBcBJ4VUTpnN8Hv7o6YSKDOukE+iXiiM3D48hFw7dyvtgr?=
 =?iso-8859-1?Q?0Q//qLm/XspHqEJ13cxJXqFiRUstbJHsyRs3GzOVnABAjYJUnLy0DPlNEQ?=
 =?iso-8859-1?Q?wwD+D7SN3ci7NqN5R2APgvBrWr/ntzE2EKta9bWAbqmOZdqhcK4fR6sKZE?=
 =?iso-8859-1?Q?Wh4Z1e7l0SXSb7ekyV5jdvX5iu9CwOQd+6Btm8Z/l1LskEY7q9YzIyCxBL?=
 =?iso-8859-1?Q?a+GsH4pqSHWVAPXhcR12pWOK2px87GPOhMNlu5yX+SumgBGS5lY1Cw4unu?=
 =?iso-8859-1?Q?HASVQNKqeM6/bYasgKi0xiD48IItTHBKdwYaHQmXWHX1HHP9OSwPn0jI75?=
 =?iso-8859-1?Q?EGgaU5xVRT1TwU7RxTLNDozs4sU7vcw8EFTwcQCKe57eX+BwiaMAg3GjZ4?=
 =?iso-8859-1?Q?pXQO95lssiy8V8QoepttJFyrrASxp3R83GTxxsSKDscnXs07KYsZuzB8rL?=
 =?iso-8859-1?Q?/NhlvFQxwrTGwIEzZUgFnq6KIrywrN6uuN1sF0yuaiJN0+YrSCWcOYuvjS?=
 =?iso-8859-1?Q?ywf3KGKkxyNm0D5qeRaRzpke1FAg50KEpEjemBgw/gQ1VBND+oS4JwQJqf?=
 =?iso-8859-1?Q?2ToA4l8psSGLKQ1XCrjDVIksQLF7KoSQ/lE/TeQy6y8i6I5WsAVyS3xR7m?=
 =?iso-8859-1?Q?Bv6S5byIB6fCYZDmaSW5d30m9sZ/r0xnMrFNGoePZDY/csOQot/gWc+l4Q?=
 =?iso-8859-1?Q?Z+2lmcQsKjYVg6ZCOYp3tLKh6Z1vkiFwtZToB4j3MEmzkOkMNwC4wSfHvu?=
 =?iso-8859-1?Q?PqowoanXBnFTf6MOLBFnr0ekYVS/fndf4zVdEaaOjA/EuWckynlXpl62ll?=
 =?iso-8859-1?Q?s0z2orEHX+y21Yb75Gs+X2Y9mqpB0zEhDxrbHyaRX2u0b8N+k2fQwgBZmI?=
 =?iso-8859-1?Q?vYu5+zl/2TiXhmK4jhz7JHPPS9xFYBxyN0YzRMf60AqNMU5bg4AA6PV8SG?=
 =?iso-8859-1?Q?rHCBdlmLTTfhaA63RODMJVj9ZjxBzPwZUn9HpQ02NWnCxbfnFM8Ey8G8MQ?=
 =?iso-8859-1?Q?me0tKVxwkT8ufeq5JTnDhBZiOPhM0F78e67PHKOJII+4FpQ9SqidtNODa4?=
 =?iso-8859-1?Q?U4gdh1zRaKIDx7mI4gTpjglY5t4WJ6SbWuy+RtBSSjMdsZByIln4XjCw8L?=
 =?iso-8859-1?Q?Q+mnKB7xmuMNc1y7bw3tMFSuMlFGrOq50XwVpGpfgIYkdAVSOkSsZrALw0?=
 =?iso-8859-1?Q?yjxBhc95/aRSI7gCIHYDUKVmk+H52dJBHFxjA+5VJKrX492Gzr5iLmrsBK?=
 =?iso-8859-1?Q?dQvdbaVWUjeQPEatklFLX91A0tfOZGAIjHYgWH0k6/qt9Og5oPxd67fOhc?=
 =?iso-8859-1?Q?KLqORySytiQ9yneLRbxBwLH4e1G2bYevf+uYDHLzsnXjx3ZAiTGWmIYRxH?=
 =?iso-8859-1?Q?qbODYTUjNxMMHQ443v6ECn5As7olCVW0/ONbk4xt0Lye6njObQPIG4cQTK?=
 =?iso-8859-1?Q?A+SiKlK26sih2ft5wC1TTf2UjWc1UjR23QmHBlRV9kVbztwHe+CZ1sz3DF?=
 =?iso-8859-1?Q?5D9nw0Smoc/sj4+ooS2QRISwbSlRQaXHoH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36eb891-66e5-4838-1d23-08dd20a08aab
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 02:46:45.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9EZ9l5/XtkHO4EiMRa8QxiEC9QShR9384nolWEzkdUHU+SBtaQEUMyryBovXW7JYG7XHvqIrTJujg6a3jegMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 1.1% improvement of stream.triad_bandwidth_MBps on:


commit: ea9cffc0a154124821531991d5afdd7e8b20d7aa ("sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stream
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
parameters:

	nr_threads: 50%
	iterations: 10x
	array_size: 50000000
	loop: 100
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201007.aa43a5fa-lkp@intel.com

=========================================================================================
array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/rootfs/tbox_group/testcase:
  50000000/gcc-12/performance/10x/x86_64-rhel-9.4/100/50%/debian-12-x86_64-20240206.cgz/lkp-skl-d02/stream

commit: 
  6675ce2004 ("softirq: Allow raising SCHED_SOFTIRQ from SMP-call-function on RT kernel")
  ea9cffc0a1 ("sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()")

6675ce20046d149e ea9cffc0a154124821531991d5a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     15264           +23.1%      18793        meminfo.Shmem
      0.02 ±  4%      +0.0        0.03 ±  4%  mpstat.cpu.all.soft%
      3818           +23.1%       4700        proc-vmstat.nr_shmem
    587.28          +302.4%       2363        vmstat.system.cs
      2577            -3.5%       2488        vmstat.system.in
     36673 ±  2%    +164.6%      97051 ±  2%  sched_debug.cpu.nr_switches.avg
     53585 ± 10%    +332.2%     231568 ± 16%  sched_debug.cpu.nr_switches.max
     12003 ± 23%    +578.7%      81463 ± 24%  sched_debug.cpu.nr_switches.stddev
    578.05          +310.5%       2372        perf-stat.i.context-switches
     14.72 ±  4%     +10.8%      16.30        perf-stat.i.cpu-migrations
      0.04 ±  5%    +268.8%       0.15        perf-stat.i.metric.K/sec
    575.63          +310.5%       2363        perf-stat.ps.context-switches
     14.65 ±  4%     +10.8%      16.23        perf-stat.ps.cpu-migrations
     18760            +1.0%      18950        stream.add_bandwidth_MBps
     18759            +1.0%      18948        stream.add_bandwidth_MBps_harmonicMean
     14581            +1.2%      14751        stream.scale_bandwidth_MBps
     14580            +1.2%      14748        stream.scale_bandwidth_MBps_harmonicMean
     18289            +1.1%      18487        stream.triad_bandwidth_MBps
     18287            +1.1%      18484        stream.triad_bandwidth_MBps_harmonicMean
      0.02 ± 12%     -32.3%       0.01 ± 16%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ± 42%     -48.6%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.10 ± 70%    +332.7%       0.44 ± 95%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     65.81 ±  3%     -68.0%      21.05 ±  3%  perf-sched.total_wait_and_delay.average.ms
      2011          +229.0%       6618 ±  4%  perf-sched.total_wait_and_delay.count.ms
     65.80 ±  3%     -68.0%      21.04 ±  3%  perf-sched.total_wait_time.average.ms
      3.86 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    500.54           +24.3%     622.17 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    497.31 ± 14%     -98.6%       6.72 ±  7%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 15%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     19.83 ± 22%    -100.0%       0.00        perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     53.83 ±  9%   +8594.4%       4680 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.00          -100.0%       0.00        perf-sched.wait_and_delay.count.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3666 ± 51%     -72.7%       1000        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      4.04          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1001          +136.0%       2362 ±  8%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.05 ± 37%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    500.52           +24.3%     622.15 ±  5%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    497.29 ± 14%     -98.7%       6.71 ±  7%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±165%    +525.0%       0.00 ± 68%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3666 ± 51%     -72.7%       1000        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1001          +136.0%       2362 ±  8%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.01 ±142%    +247.8%       0.04 ± 54%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     97.56            -0.4       97.12        perf-profile.calltrace.cycles-pp.main
      1.17 ±  2%      +0.2        1.42 ±  6%  perf-profile.calltrace.cycles-pp.common_startup_64
     97.61            -0.4       97.17        perf-profile.children.cycles-pp.main
      0.02 ±141%      +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.poll_idle
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.dl_server_start
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.06 ± 21%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.__pick_next_task
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.dequeue_entities
      0.00            +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.11 ± 18%  perf-profile.children.cycles-pp.try_to_block_task
      0.01 ±223%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.enqueue_task
      0.00            +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.01 ±223%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.05 ±  7%      +0.2        0.20 ± 11%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.2        0.18 ± 11%  perf-profile.children.cycles-pp.try_to_wake_up
      0.07 ± 14%      +0.2        0.25 ± 18%  perf-profile.children.cycles-pp.kthread
      0.07 ±  8%      +0.2        0.25 ± 18%  perf-profile.children.cycles-pp.ret_from_fork
      0.07 ±  8%      +0.2        0.25 ± 19%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.02 ±141%      +0.2        0.20 ± 20%  perf-profile.children.cycles-pp.schedule
      0.00            +0.2        0.19 ± 24%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.05 ±  8%      +0.2        0.25 ± 21%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      1.17 ±  2%      +0.2        1.42 ±  6%  perf-profile.children.cycles-pp.common_startup_64
      1.17 ±  2%      +0.2        1.42 ±  6%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.17 ±  2%      +0.2        1.42 ±  6%  perf-profile.children.cycles-pp.do_idle
      0.09 ± 39%      +0.2        0.34 ± 20%  perf-profile.children.cycles-pp.__schedule
     97.30            -0.4       96.86        perf-profile.self.cycles-pp.main
      0.02 ±141%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.poll_idle




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AF3C3C
	for <oe-lkp@lists.linux.dev>; Fri, 29 Nov 2024 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732849264; cv=fail; b=JuBsYWgiYG4WJguRAwF1n61yPiUHUvHt1orIG35WAekEjGzyuuNW8sGv2x4PD7s7ne7ufTsTyRUuJP6OMWc1tRU+JtoqRlpqti9+Sf5f3J7+mz1mLwFnVYFXhDOPGeFuQUSGvldT3vPoIRpdN03me0wlHG/eWNOJDfQxsQ0lGkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732849264; c=relaxed/simple;
	bh=12rTUzOyyWyVx1afLVsWa+hOkC6CtUwXYRjTz5XAsDY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GewUZjR9Gkk0iV6d1/1eb4n+cyqNlk+AJHqQCf/S2IILF5OKIlaLPISSfDpzUL/ye0yRcVfB2XmP2GPf34RW9tetVSlw8Em1o/PWMFQFHP+O6LTlsVbx8bFT5q3iW8AzAWyD48KCe4ibZE9909YiGQ6+AJbpU8Uw0Jrj2+g9XnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhA1pQTp; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhA1pQTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732849262; x=1764385262;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=12rTUzOyyWyVx1afLVsWa+hOkC6CtUwXYRjTz5XAsDY=;
  b=OhA1pQTp4H70mL3/FXD7nb9DA8GRJ8+ftMz8dLPEskufbBVDBH7MvLsO
   9BcrHeGag9rUUeaNVBXxPHHwnXeXV8c0zzl2yN9qSDydd+/vi/F3Md5nO
   9dM+vm9h8hbHdjfbPayQtJ3Auq7VEKnfLIke93U+xICB1mKg+wiY0u04A
   6HwAZk4vVmMYNB0WZYWSYHVNAg0kMkHJ1rCJjfrsiEi84D47SM/0nw1Eb
   bQPw3YcPpCUL5xghOlyGFLtyORyYZS+PvnoyIQUyUts7GFNGcJp8bXCpt
   y4ys9p/dMFB7rWucvV76oHOu2gDOpaSYlcWJd/PbK3V6PmDrcRL+mDCSR
   Q==;
X-CSE-ConnectionGUID: GOSvwN4KTBuAuykDt0oGEg==
X-CSE-MsgGUID: 7umD/aLQQHymDVKt6nSg9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32446553"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="32446553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 19:00:58 -0800
X-CSE-ConnectionGUID: EG3LhvvzSaiaWWORzOqA3Q==
X-CSE-MsgGUID: lL2lnS3uTRCSiEYiR2a5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="115657043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2024 19:00:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 19:00:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 19:00:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 18:59:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfbNV/qHn7ghXmw+3AMYw3lhKbQxfMXGuvrDksvstdd8kcToMrydWcityO1Y35EXeyaopVyaJHTmWhn1qIZ7dc8WJ3LtFmBif9HjmiOpRdyQMfpL6ZoAzFUhrYdI2vNMT5PPTfwKEPg/U9O1Z/Iq88UoD85lVNrF3Fr9/UHO3aJmfbQLnBwIkkNrFzBU3zDZWICCuJeNqF31zotwtDGTq1ctDGG3RrQHp73hxFlgX1Rye6V+lJshBapnCQPAywRpQg+4LoWmNTHZasa2ASIHXdAmqRDHF8Mq7a0KfL2xcw7MIfexLJTKp0NOKBG+HsDbErxQL9omuqjmRJgHuwZLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la3qdMd3Yy6LS6lML3IgHr+HJSwFtPOtBB+0v8gsmGs=;
 b=nRP1hjljfNhrFu6YuWiRtfMe7QCynYrT8pfMxDZrGDT37oggqDnVxfHfXvN/b95hwqBkMd84CTNMHGMzwIJgzrSHU6M2dqr+qguNZSf84ReTC4qAgKObtGXyVCwM30mZs4D7uvJq96+j9ylVIHJLiCmZT2X3ewySYmaMKWRvxfZdUzltqXO/0ZgDIj8yUPVBRMixvTTkpU0/RNckWgYu5mW4kQXjZL6DwfsjXSmPHIxlF1Ta3+ERExpEzbkpUTC+vIIt95k6+qfAuR8y3BYrszWKWu+2IwITzPEhCe4aHVZARWTnDAjXzm6tLi/47fGdl69WGBGaxhKaNFWjQj5OIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 02:59:48 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 02:59:48 +0000
Date: Fri, 29 Nov 2024 10:59:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dev Jain <dev.jain@arm.com>
CC: <oe-lkp@lists.linux.dev>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  1ced09e033: pmbench.throughput.aps 3.5%
 improvement
Message-ID: <202411291031.595ea459-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1aa566-96ef-491c-cb95-08dd1021e2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+AYKs1hbI34oD4f7YhatbbA0lj8OUOvOeMQI/1JCH/baowlcP+i054TTCS?=
 =?iso-8859-1?Q?jFnOMOp3p98waTa/0y2qo38y6UxwYDtiqYrQFj7y2dGbVQonfUFp345J88?=
 =?iso-8859-1?Q?PadNlo7ItjchvJP1CHq5SkIJ64oZQpkkgnqkqBbQ356WzLGjs8fNdFZ0zh?=
 =?iso-8859-1?Q?9bgUZjnNAfykx4xOHYKmPNyVdRV+EXt7feG3qr6/Pi7dJfy6grkPEzVN6/?=
 =?iso-8859-1?Q?/ApMHJ+B4ssRHz+TmiWGtxRF3fOJwRSbaPu5JHZs5Mx2AqQRUT2o1805+d?=
 =?iso-8859-1?Q?9ErF4QlqMXEDxvVcroFScOa3vO4P+DfLFGSpk1WOfU7/jSj3p4IrqlahzL?=
 =?iso-8859-1?Q?yN71zCFIVsvOzjK7q9ni1k9KjYGE0s9TxinniW6VKoUaD6e6Y5wIyilzZu?=
 =?iso-8859-1?Q?T42ikVZJ2BIGnwYWmA+Cp2ExWQAUFAIKZBlzH3BoHW7pQqerSFtncLIo03?=
 =?iso-8859-1?Q?aedqFNSB4WZvksrgkui5G5uqhr3WKZOxfEJ4JKekC8V512n2oQJFNJcMTt?=
 =?iso-8859-1?Q?VN0iHZm/HxnO2o/Y+XPuPE2mUYkxOgksS6szFmwh5cE1xCVOHO6+NkH5uE?=
 =?iso-8859-1?Q?ERjD2iXxYTPzpBqzKbbhSyd124ZhEvhw38p3NCgmkg42+k52IVhh+JwLtC?=
 =?iso-8859-1?Q?Pb27llfjZ888RwF8dKOU/j3tgUZh5gZASp3BHG9FUGjsHLGhAbyD6c+snZ?=
 =?iso-8859-1?Q?bayVaKtI3db2nH234iHoceFcbeY/iRfJZo1DAZZL9pTT8dxcONFQ2gfAhq?=
 =?iso-8859-1?Q?Nvqwsa+MJzchwzHXXZ7e+kl14+ReiX+tVlEGtiibkwNfFRVSYIUIjuaDrN?=
 =?iso-8859-1?Q?6r9H+nopwj5/sDC6ghGIF233cz8CrhrwllI8er8NyLoF6319sC5Yc75rt9?=
 =?iso-8859-1?Q?GiUD/MrJ99LIfR9UmtIdW+uiEMnbw9X62cYa9xkJSmEuMq6JjvWLtM4pYF?=
 =?iso-8859-1?Q?HOxu3ZIGDfBUdUHD8c/S4pwCUVzlH0Giee+C1DqV0fpqwKr1C6eN3kWZSb?=
 =?iso-8859-1?Q?HzFtcTO1qNurS6+9m31F4ENsdbgqVJP2xQ3O+gWR9VGM6REJTdvGy3fX0J?=
 =?iso-8859-1?Q?E9fwRjDZ9kmagNe+EWBZmWauIIIbUb/xL6m+9isPbaHbAVUGInqTZW0yh6?=
 =?iso-8859-1?Q?0tJjtVxj2MGjk8lbNt98RGvBDPHN6sqlyNGhj0Ad+PIHG78f1qk3aPcC8Z?=
 =?iso-8859-1?Q?+Ggxnqy7V40f1kfPZPrt8kkwUMmKSqlmNM1ZuFjHTF7G1B4qlp4rXro8ze?=
 =?iso-8859-1?Q?S3o/1Dq0mOdau2oYqjpasPo6gavIsMUB4jrgGXOlh63aQDGXAo6Zgf+DG5?=
 =?iso-8859-1?Q?r9Q7B/5R8QUm3xyHkoz4xUoXYA+9uGMYD75/up5luT1FtQ0I4XZ2qlrtwl?=
 =?iso-8859-1?Q?MjxUcgEF8+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Xdha66prQpYq/FZA6nDBRhqIqNZ6xaU2h8eo16xb4zywQf+O4j0wMPYiav?=
 =?iso-8859-1?Q?snsYY+RGux4pFsg0jvN+Wj0dbr4kBqbs/ZSfzy3YMBPpNpeioJu/77U7jR?=
 =?iso-8859-1?Q?NadkmjaeM+We/tBojWFGXN+5MaP8HCdUrSOiZYutrinQh8MFY00ClVq4nm?=
 =?iso-8859-1?Q?LahI8Pw1xLZPJcqJBAshGnUwyG7VEbdBMHHLwzdDppjeRQOuN3RfvxwXM4?=
 =?iso-8859-1?Q?ZBLbzK64IWDCTN7I9XkeJFEAQttF4bh/MGXs/y8LNj9ec+ox7jWDC686VX?=
 =?iso-8859-1?Q?GwHTqe5UBr25E6vkNQXdWO2ZuxWVI15TUX2vvrB4vZXZBBKPNtLQh8QBBe?=
 =?iso-8859-1?Q?S308hqKujRta4hCTbzUddInao2pUTQLRSUchRWTUd0jPfWqWR4WVfhfcXu?=
 =?iso-8859-1?Q?tzwUwXItpgh10/xwaQqluq5iUc7y5BGYZk7RaUqfsLyHbpJgp8BRl1bqHT?=
 =?iso-8859-1?Q?hun0hPC8SMDVpad7O+KGQTC1ZkWcW0X94hFO/pSNDhjuI7AKOWL/StnGX+?=
 =?iso-8859-1?Q?J18QviCjzBEreT6V6hUgyjF6y7vzAPoni0YA/QO+tLJspdWxt7pofuL0Di?=
 =?iso-8859-1?Q?vosySqd4QkD8y1Ur7qrSKOikDmXO93UMkog8FD1dBJ6bQUD16si69fY7tT?=
 =?iso-8859-1?Q?+kpupFhegjMkj/D7U+792X4FdKQGxHLbpxkD5EepdoIgzJChaYhVRgrVB6?=
 =?iso-8859-1?Q?e+hBfQw+BFn4batIcSIrQR99qm+oPGeUkGgT8MsMbqCydyqjsevlq/ogl7?=
 =?iso-8859-1?Q?+3jikfVVNRtbnknklJt89ihe7fE/+OSWEoYzT+fk8i8RrWFQA3ZLDAxCxv?=
 =?iso-8859-1?Q?A9/ue0zn7m5dqcj6dib5XkMn8bqqwvm7b5Gmio4wqIrE9asynKwG0odb8P?=
 =?iso-8859-1?Q?RIRmQfAE740oaTWEVOJq6edPlRZAh47ou0I+gfnI+Q5gyJI1sfl6+sEqOj?=
 =?iso-8859-1?Q?ndhSBBxZ4OMUTUTzWzwjIWMG7i6uziucIcB1sRQVAp+SXdHIQp7RPBquAB?=
 =?iso-8859-1?Q?b4H2TaqjvgIatoF1jHolbX+ycGhNAkjC9AhZCi1QKvnyU5YW911vLaKHTj?=
 =?iso-8859-1?Q?+ezV5rI2U5zp9Bx/ylTmacb4P/5cBjtNXEtwAOsz0/D5v3wfMaULB1yHok?=
 =?iso-8859-1?Q?Z5j+fmW030Thk3W1fkeGu0gj31F6fYl2Go+L97ZfeisJzYgtMSoceXHqi0?=
 =?iso-8859-1?Q?2LeqN/TY4Naot6zmyA3upTtiVWIXrDLJ40gGWs7EKKhKXTbzr5U5lORQqk?=
 =?iso-8859-1?Q?dD8P0wfMxS629MwIiRQnIHMJCLCuvZShlPp5hu/gBt2FrNV2YHv/Vfjmui?=
 =?iso-8859-1?Q?pv9ON7nktx2gc3RMWFRW+KuMxnAQPb0Z/LwFmNU3+xXM+KYMSxklX2oLmq?=
 =?iso-8859-1?Q?+PvuT0FJdjveKaJm7ghTQgpy5DnKYgydFE1dP4obhL+Q4ejdHnZSTBsttZ?=
 =?iso-8859-1?Q?ipLqIF5cCLf8WKWdjVZiSpemD8DL+vSPL66Q51+NYKWCaoPOQE/Sn5nj5R?=
 =?iso-8859-1?Q?gyKfTO9bYWFBD9fiYh5rUamrewj8NZ3+A7CrMeBjh48kmiSeZZBdLZOX/B?=
 =?iso-8859-1?Q?XNpOoS/rWCHthg3JFxfoD080cwgtmdqQuTVGCsYXiKNij3mOZmCP58+ITC?=
 =?iso-8859-1?Q?cvHo4rIG/ItZ4nq3pPzJVGypXkM6ELQ11XYesPUzK6uNTe2Vv+iHkWyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1aa566-96ef-491c-cb95-08dd1021e2e9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 02:59:48.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyHnoXW8CysYwI1WYgzM4sR/CR6QuaTS7VgWxNBPs52NKn0VlLCLQ0SJ9snZNn8IhSNRSAXCN8xf6nI5pfFeRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.5% improvement of pmbench.throughput.aps on:

commit: 1ced09e0331f6cc4ca7eae75bc0ef03957129a94 ("mm: allocate THP on hugezeropage wp-fault")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: pmbench
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake-E) with 32G memory
parameters:

	runtime: 300s
	nr_threads: 100%
	mapsize: 75%
	cold: 1
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241129/202411291031.595ea459-lkp@intel.com

=========================================================================================
cold/compiler/cpufreq_governor/kconfig/mapsize/nr_threads/rootfs/runtime/tbox_group/testcase:
  1/gcc-12/performance/x86_64-rhel-9.4/75%/100%/debian-12-x86_64-20240206.cgz/300s/lkp-cfl-e1/pmbench

commit: 
  ebcfc63d6b ("mm: abstract THP allocation")
  1ced09e033 ("mm: allocate THP on hugezeropage wp-fault")

ebcfc63d6bca3cce 1ced09e0331f6cc4ca7eae75bc0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    293877           +26.1%     370613 ±  2%  meminfo.AnonHugePages
    114.20 ± 12%     +37.3%     156.80 ±  8%  perf-c2c.HITM.local
     19618            -1.4%      19349        vmstat.system.in
     84.80 ±  9%     -19.1%      68.60 ± 13%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    162.00 ± 11%     -19.1%     131.10 ± 14%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    389089            -5.8%     366424        proc-vmstat.numa_hit
    389089            -5.8%     366424        proc-vmstat.numa_local
    486747            -4.8%     463625        proc-vmstat.pgfault
     94.78            -3.3%      91.62 ±  2%  pmbench.latency.ns.average
      0.01            -0.0        0.01 ±  3%  pmbench.read.latency.ns.2K-4K%
      0.40            +0.0        0.45 ± 14%  pmbench.read.latency.ns.512-1K%
     21835 ±  6%     -95.1%       1067        pmbench.time.minor_page_faults
      0.00 ±  5%      -0.0        0.00 ±  9%  pmbench.write.latency.ns.128K-256K%
      0.00 ±  8%      +0.0        0.00 ± 14%  pmbench.write.latency.ns.1M-2M%
      0.00 ±  9%      -0.0        0.00        pmbench.write.latency.ns.256-512%
      0.00 ±  3%      -0.0        0.00        pmbench.write.latency.ns.2K-4K%
      0.00 ±  4%      -0.0        0.00 ± 31%  pmbench.write.latency.ns.2M-4M%
      0.00 ±  5%      -0.0        0.00 ±  3%  pmbench.write.latency.ns.32K-64K%
      0.00 ±  3%      -0.0        0.00 ±  8%  pmbench.write.latency.ns.4K-8K%
      0.00 ± 18%      -0.0        0.00 ± 14%  pmbench.write.latency.ns.512-1K%
      0.00 ±  7%      -0.0        0.00 ±  6%  pmbench.write.latency.ns.512K-1M%
      0.00 ±  8%      -0.0        0.00 ±  6%  pmbench.write.latency.ns.64K-128K%
      0.00 ± 13%      -0.0        0.00 ± 14%  pmbench.write.latency.ns.8K-16K%
 1.688e+08            +3.5%  1.747e+08        pmbench.throughput.aps
      0.44 ±  4%      -0.0        0.39 ± 15%  pmbench.throughput.std_dev%
 4.161e+09            +3.9%  4.322e+09        perf-stat.i.branch-instructions
 1.198e+08            +4.5%  1.253e+08        perf-stat.i.branch-misses
     68.01           +18.3       86.33        perf-stat.i.cache-miss-rate%
 5.197e+08            +3.9%    5.4e+08        perf-stat.i.cache-misses
 7.617e+08           -18.2%  6.228e+08        perf-stat.i.cache-references
      3.41            -4.2%       3.27        perf-stat.i.cpi
 1.973e+10            +3.9%   2.05e+10        perf-stat.i.instructions
      0.30            +4.4%       0.31        perf-stat.i.ipc
      0.01 ± 12%    -100.0%       0.00        perf-stat.i.metric.K/sec
      1293            -5.0%       1228        perf-stat.i.minor-faults
      1293            -5.0%       1228        perf-stat.i.page-faults
     68.24           +18.5       86.71        perf-stat.overall.cache-miss-rate%
      3.40            -4.0%       3.26        perf-stat.overall.cpi
    129.03            -4.0%     123.85        perf-stat.overall.cycles-between-cache-misses
      0.29            +4.2%       0.31        perf-stat.overall.ipc
 4.145e+09            +3.9%  4.306e+09        perf-stat.ps.branch-instructions
 1.194e+08            +4.5%  1.248e+08        perf-stat.ps.branch-misses
 5.176e+08            +3.9%   5.38e+08        perf-stat.ps.cache-misses
 7.587e+08           -18.2%  6.204e+08        perf-stat.ps.cache-references
 1.966e+10            +3.9%  2.042e+10        perf-stat.ps.instructions
      1290            -5.0%       1224        perf-stat.ps.minor-faults
      1290            -5.0%       1224        perf-stat.ps.page-faults
      3.48 ±  5%      -2.9        0.60        perf-profile.calltrace.cycles-pp.access_histogram._ops_rdtsc_init_base_freq
     14.48            -2.4       12.10        perf-profile.calltrace.cycles-pp._ops_rdtsc_init_base_freq
      0.64 ±  2%      +0.0        0.67        perf-profile.calltrace.cycles-pp.roll_dice
      1.10            +0.1        1.18 ±  3%  perf-profile.calltrace.cycles-pp.record_histogram
      4.88            +0.3        5.14        perf-profile.calltrace.cycles-pp.main_bm_thread
      7.46            +0.4        7.85        perf-profile.calltrace.cycles-pp.access_histogram
      9.86            +0.4       10.29        perf-profile.calltrace.cycles-pp._ops_rdtscp
     52.15            +0.5       52.70        perf-profile.calltrace.cycles-pp.measure_read
     11.64            +0.6       12.23        perf-profile.calltrace.cycles-pp._ops_rdtscp._ops_rdtsc_init_base_freq
      8.85            +0.6        9.47        perf-profile.calltrace.cycles-pp.uniform_get_number
     11.18            -2.4        8.76        perf-profile.children.cycles-pp.access_histogram
     14.48            -2.4       12.10        perf-profile.children.cycles-pp._ops_rdtsc_init_base_freq
      0.71            +0.0        0.74        perf-profile.children.cycles-pp.roll_dice
      6.21            +0.3        6.54        perf-profile.children.cycles-pp.main_bm_thread
     52.43            +0.6       52.99        perf-profile.children.cycles-pp.measure_read
      8.85            +0.6        9.48        perf-profile.children.cycles-pp.uniform_get_number
     20.90            +0.9       21.83        perf-profile.children.cycles-pp._ops_rdtscp
     10.27 ±  2%      -2.5        7.80        perf-profile.self.cycles-pp.access_histogram
      0.54 ±  2%      +0.0        0.58 ±  2%  perf-profile.self.cycles-pp.roll_dice
      5.92            +0.3        6.26        perf-profile.self.cycles-pp.main_bm_thread
     51.97            +0.5       52.51        perf-profile.self.cycles-pp.measure_read
      8.67            +0.6        9.28        perf-profile.self.cycles-pp.uniform_get_number
     19.98            +0.8       20.81        perf-profile.self.cycles-pp._ops_rdtscp




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B756E169AFF
	for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971177; cv=fail; b=D7F0ZndsyyukMruT+tlw1DIjSZJBVQC+8QHqGZQgGhLYxqeUahhIfXwS4+kYbprwwcUIqhqKRztXAspLO8DwzQXu8RP+4Ms9SQMzYJkFPKQEa6sVm5PrUUZx4gbLbURHY9Myd2jYfDEIbU+X23L4AkSip0OZTSEPUkZgs4t576U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971177; c=relaxed/simple;
	bh=4/YWsTZ3flGXat0mmIPFRoLJTHnEOjehwjNmffb3pZo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HwlyXcvob1vR+LpCNktRqr4Ka+h7MOEYq7Wjas9uUWq1oN/HwGVRYYE77KAjI6dyYZTv4cBq1oG6hvtko5dmDoGD+8evqofEwbIYWN0GiBH1S4k1AXFqJ0HD5yX1eC/Q67FHukTvx/xFaIq8nlIoHZcWGq+J+epO5WK2lH9/MDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPq9LqSN; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPq9LqSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716971174; x=1748507174;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=4/YWsTZ3flGXat0mmIPFRoLJTHnEOjehwjNmffb3pZo=;
  b=KPq9LqSN/Ar56vY1w/EfS6/b8KXUf9sfOiE1e8lv9eGu49LhzFg3oZ5I
   oooL+5bbGE42ronAN7mBBc5hePG7Bq688VcKA8CIu+7/pcJ/wVrk+ntmy
   KBs3fFeKeZ60RjeePFxYC+kJyOaWfZt0K/ehYpL8B/2Z5SCvjumBvA4wP
   ZDvD4iQtd8i7KzNJ5ZWdQ10mVCr5JDbX+YQ79S02ISWhCLt3H8UJvmI8I
   Mp2AUzl+LfkfpBlVGea0KsV+7BvHcR0ehVBNEQXEuHx2+Ht67QEBhaeCV
   lk1RAK9he0KhkVxWZSCkvs0l3kX1NAYhEkkRnIIArJtpHV1D7peWiN5xz
   w==;
X-CSE-ConnectionGUID: Y+t2zS3zT9WiQcmPFYQe3A==
X-CSE-MsgGUID: HMe8OyjVQjK5er6eiDIA3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13307925"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13307925"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 01:26:14 -0700
X-CSE-ConnectionGUID: I3jzofgZTFy22w8eOeZVtQ==
X-CSE-MsgGUID: jqKbvl99S5e/RDtnUJkqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35898016"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 01:26:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:26:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:26:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 01:26:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 01:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRXNfPHp5EputWYxNHs7kVNl8bZpC28gogUmmrcAdB5uHm0fnFO2Q1/jmQ9LltxxSHnmDF0bNIegRKDNhJCsDMWut1VhuV4oLQRHWry9APBpPbDjoxrLVOyZCNt5PWZ2u7aopnBeFClQcwnZSlMr8m0M+zmDwaWlvXIwcgjxe67vJ55RBNhMgcNhhb06tXoM8MdLD0fHOpCx4rtusm1jpjpR/MUU+6mEuw6Jrke9vBo6Rto8Fv6Y2ND/wqeSJxtwqB9wz3yIQTseQVzP6POVaMb3iXK1pP202Fg221aZfI5vY4HYZkcMJ8ihVndBcr1ONWdXq/EhTevQKI9aY5lD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAXQGbbLOxTksREgx9G0EmjvOeGXz4lX50fYUaALQ+w=;
 b=LOM67dlALsgvew4AsY2UNjI3BQKBQs+0svWpFIJB1kKBEymB3hTqTvMa+atgzrWK7unsrrsIA1PftAfUMVX5EDNQsowhfvqnucwBmRPNoz1+VQ2c6oODY1raC6DA8m8znBYDm9lT30NRg7lC0zv+HRqL6ZsbitaGKic0lMlMj9fTglbGel6uoLdArly1nDzSgWlEemOUiElzbGoz7O5ZCjSI0ZX9ud7GRztWPhsebNF6gnYYdpAyogWC5hTWIF5EmhwQGdgcAHr3vsdvEtloWRnt8UAsSoxwIipXnHX33gA9TeHyEMhm+YHnthOJzT2eyqdLOZIZKwuDAYofjj8okg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 08:26:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Wed, 29 May 2024
 08:26:06 +0000
Date: Wed, 29 May 2024 16:25:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:sb_write_barrier] [fanotify]  9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <202405291640.2016ebfe-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a80ace-283c-45e0-e995-08dc7fb8fbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?X4Ooiaf659/xsL6Xq0CuDpdYwPHuycmsoK4QOYcOMP3j7bKOPEAdqUIpTf?=
 =?iso-8859-1?Q?BpKSfIr+ciDcvpGaurh2uArLerSvqyxlARbq5Zhm7BgHzxG7lSdroy2Ux1?=
 =?iso-8859-1?Q?VpqsDa6HO1j+9Ol5/2UojoChiQooCfia+x7HcUhzN0oflMD/6cIJSo0Cot?=
 =?iso-8859-1?Q?9ZbBCYjcS7bE67P2mNUUPx3tAjtIGw5+M4wfg0jPKmX+HoDJwuFJPnbYc1?=
 =?iso-8859-1?Q?1DXAdFqlm80dq1hf3VY6scjuIv/iAMggr6Txc1tV6MFN+zibh/0h5XTWc8?=
 =?iso-8859-1?Q?PIXDe7YtaImItGNzqfgd/P8TKo/ec9l0SVHs4sbSvSW8Bj90Tnk9zyujye?=
 =?iso-8859-1?Q?X2RAf3JbAowwFDOAPmZJPwmxSkisNczkkTivYqsdEbGIQ4iZKpXnqBSJ2z?=
 =?iso-8859-1?Q?15rhrmJbZLLIICsAQjbN529amkJIw8452gEF7L1gwyI5Zn0xX7WtwV7JEF?=
 =?iso-8859-1?Q?G1t+t8CC77Z7Txo2/za85QH3y7qaNH4Q2G/5W0BwZ+6F805gjTYOPRjjN9?=
 =?iso-8859-1?Q?MI6BEI6GhZ7XvFDGp3nIYDtjVJbYg/ex6Ch5LG+R1xJrn/AhFINdf85dVw?=
 =?iso-8859-1?Q?97i6BfyFY5vCd+fhEidv3/tCcWb3ooRaER66OBggswHU1ndLD9YU4fAV/L?=
 =?iso-8859-1?Q?iuR8wVT2L6DoEvxhpaYVjjJXv/b3kS6CdPfaw2M7Fk8dHmac9PO3tQfBWD?=
 =?iso-8859-1?Q?+WpCzkJe05zf28rRbC/CqeYMIw1Gv1IamJj4uYJK8h/qllYOcOM2H4yCN1?=
 =?iso-8859-1?Q?PfzO61LXzD9cRPHkL+YkNZD1/HhbtAvZKFXvlfBKSl9mmpGiXB75zP8ekV?=
 =?iso-8859-1?Q?iSCZu2AeL5faJloD+Qpcy6GbSl3gvoNhhnVHgq01RdBoqz5QmA97Za4tHV?=
 =?iso-8859-1?Q?ymkB4SOKggDQtIRayS3bJtQmPsCKXK+VylimNuwWruExgjMkaGPvcqysb/?=
 =?iso-8859-1?Q?Ljg+zQG3qZqusKygIoEDxx74V+GvYSPul5LC5+hge6CHCJV9YA99zt5mfK?=
 =?iso-8859-1?Q?hP6PviPFmOoqAjGRCzhUZxPz9UxM3/BJcimi8PWzMTj44Xy8JFAkXm3QoV?=
 =?iso-8859-1?Q?EgbrukkXJwunY3HuPAS44qG65xT8WGF+AQ1kWl5SdOw5w8hR0KdU85KTGr?=
 =?iso-8859-1?Q?bBplLq0SPXFtTW4D+3ubYTkLe+RAeorKS3mpnkxevgAxHl9Tm+uwc59M56?=
 =?iso-8859-1?Q?nPBKdkdy4G3873dv9SBXknIP8Ef92Mqj9NIePFmIW+cWxST6bu8hZopk09?=
 =?iso-8859-1?Q?tsUmDJ4rwsIpigK7DTcOiIWA4nwsJ0N0D2Q61NfYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Kp0c0uPTdtF/6ZM++ttdBsnNHCF2pGhrRK50X3e8FEEJGh4mlaDrOez9/n?=
 =?iso-8859-1?Q?TV4Xflr6DEn+p1pc8N7lVrp9SUOn/ihk7cFfV179t88hO4iswV4vrDR709?=
 =?iso-8859-1?Q?zLo+94exPolIKIrkRCWG7/ATeu2ru8N8pOnLWV0vP8ZvMx/QpVVmZ2YeA6?=
 =?iso-8859-1?Q?Vh234n21uAipQPZSghWwCV/zr+tP46Y0FPGNCOCkYnCJ+OMzehdoVzU4V9?=
 =?iso-8859-1?Q?81UMPO2MOBhQQ95BfMqdl5Ij+1ZoSsW5f5RKb0xQUTBOCir2l9hwkMvZ9J?=
 =?iso-8859-1?Q?Da8X2fnvKu8oiGsTUvGARm1z0LxWsDoDqsnF9RuD5MoixWgtpyA3mgohgW?=
 =?iso-8859-1?Q?uqdSuGVmSUO6OW8nNaOQlz+TrMioI9tGFDyDc6HXWGeyZPoFO+gLDQFXaK?=
 =?iso-8859-1?Q?/SYVHLzAHMe+fBIAEqwai+fjnnYMgHnDiYN1iqkOx5wm6nwQFL1i65V1Cm?=
 =?iso-8859-1?Q?ULKNsuzX/NUpWDeMeqMZRlX+Rex9VTdBz5Wt7GP+kMn2QZ9EuKjU4E33gz?=
 =?iso-8859-1?Q?je/KHhVnjgxyOZCjOGJv7t/H4A5llQqeLBMqhw476whcZs7cLahOuaCODK?=
 =?iso-8859-1?Q?JMzD7YI2PhTTrstKm9sVi2uWDkdSjlhqoHVRpdq1ZQFWxdJy4UAs7/YTRB?=
 =?iso-8859-1?Q?qUp9r1H0/z5yB0EX4uv0hSHUH/oTrSc6DljGxLhlevCHp30EV3EIIy7D3X?=
 =?iso-8859-1?Q?OofC6qrFhuq+UTCR1jpdCty9LaI4UouU1kZ8UYg9FsO/Nwj/sYipEJ2BvX?=
 =?iso-8859-1?Q?/Hp57QJnZ/ULTIT/NQ1gEQD382p2uzWdGT91GosV/iBRG+6jtkQOFKAPeI?=
 =?iso-8859-1?Q?hQi+UJPXKa9fJWKx5171ChUhczEbk86AFLTuctFFMVHfwfWI04AGAa5/io?=
 =?iso-8859-1?Q?WwdYGw5GVV6iwSnLXpO7SSrOoJnOFUvs+uV1Lj0jTLovaes5SZaa69PIXR?=
 =?iso-8859-1?Q?JIsRJPN5GBI4iNbT/pTN0gVkiKDbwb8EjxpN4nK8gD44YYbrnbAyscH+Gd?=
 =?iso-8859-1?Q?x/Jq8ihjH415p5lg23ghkeWZGidSM0D3m8IQWqjjWKqbXRRgjxAfZrJn85?=
 =?iso-8859-1?Q?64BjU6p+md/0gat4nGSx3t1pihtqyoB6t6NR8PULii54V0YXoWdkiXBAzx?=
 =?iso-8859-1?Q?11CQh2uaQOXeEZFz+aMFW98dbVDU+Gocm+Iwszk+YheLEEGCsDOl3/VIzo?=
 =?iso-8859-1?Q?bQaNzcP0BfQ6kcBNo23AbDBocYvONHIpIK6fULIzG0HBjMo+XPiySMnc3S?=
 =?iso-8859-1?Q?9ASoUmW9bfPSKlalfSu1GC75srE075lvWiCjs0+QSk45K1DicPO50V3KjO?=
 =?iso-8859-1?Q?SCNS9qGOLVuXpITbR8I3BISks7XlRRg3apNAmdBrtUNWg1AUqvSjB5e/Jr?=
 =?iso-8859-1?Q?dwTjtX+cVGsQRRodPPvGhK3voc25cMZGNd+N25hQa9A7FqQeFzx1ON2POY?=
 =?iso-8859-1?Q?Heehp+GhYan3XSpnMVG3aiSMd/5GY0eNxH4QNW8HXlqfS2WyHh2aLeRPAb?=
 =?iso-8859-1?Q?Ee2GoPczLEQXHE/p8DEQBDn7O99E//VDMJnSNkv6CqPp3zvi/oupqHTCOx?=
 =?iso-8859-1?Q?KpCPlhdXO2sQJdJqDXCdZdpFyr8fw2On+6dqeHCgJn2PzBwLxbqfGjuv7R?=
 =?iso-8859-1?Q?2+x122gY3Tso+xFsbDy5L+wRRYTg47aJPji6WSS/mY9v+kZYrxHyyf+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a80ace-283c-45e0-e995-08dc7fb8fbeb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:26:05.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UglOYVnqP+7AD0rFXN5pMUXFEo0Vv4buLCCQFCTWiIMV+ZJkA5szWsZ2L+RXXOEmZw1CSbtork2Ft9SgR1iYtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -7.9% regression of unixbench.throughput on:


commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
https://github.com/amir73il/linux sb_write_barrier

testcase: unixbench
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: fsbuffer-w
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405291640.2016ebfe-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240529/202405291640.2016ebfe-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit: 
  00c423c0d8 ("fanotify: introduce FAN_PRE_MODIFY permission event")
  9d1fd61f1d ("fanotify: pass optional file access range in pre-content event")

00c423c0d82eabad 9d1fd61f1d9bb74e44bdcc8767b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  1.23e+08            -7.9%  1.133e+08        unixbench.throughput
      6169            -7.7%       5694        unixbench.time.user_time
 4.566e+10            -7.9%  4.206e+10        unixbench.workload
 1.513e+11            -4.5%  1.445e+11        perf-stat.i.branch-instructions
   6891152            +4.8%    7221484        perf-stat.i.branch-misses
  29764445 ±  2%      -7.4%   27565609 ±  3%  perf-stat.i.cache-references
      0.91            +2.0%       0.93        perf-stat.i.cpi
 7.187e+11            -2.7%  6.996e+11        perf-stat.i.instructions
      1.26            -2.6%       1.23        perf-stat.i.ipc
      0.00            +0.0        0.01        perf-stat.overall.branch-miss-rate%
      0.73            +2.7%       0.75        perf-stat.overall.cpi
      1.37            -2.6%       1.34        perf-stat.overall.ipc
      5828            +5.7%       6162        perf-stat.overall.path-length
 1.505e+11            -4.5%  1.437e+11        perf-stat.ps.branch-instructions
   6873687            +4.8%    7203107        perf-stat.ps.branch-misses
  29721957 ±  2%      -7.3%   27538369 ±  3%  perf-stat.ps.cache-references
 7.148e+11            -2.6%   6.96e+11        perf-stat.ps.instructions
 2.662e+14            -2.6%  2.592e+14        perf-stat.total.instructions
     57.79            -2.0       55.78        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.58            -2.0       35.63        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
     13.06            -1.0       12.04        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
     13.81            -1.0       12.83        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.72            -0.9       11.78        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      7.00            -0.5        6.47        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      6.53            -0.5        6.02        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      5.36            -0.5        4.89        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      3.66            -0.4        3.28        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      2.68            -0.3        2.36        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      6.57            -0.2        6.34        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      2.36 ±  2%      -0.2        2.18 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.83            -0.2        1.66        perf-profile.calltrace.cycles-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      2.92            -0.2        2.76        perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      2.65            -0.2        2.49        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      3.95            -0.1        3.83        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      1.62            -0.1        1.50        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.74            -0.1        0.64        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.26            -0.1        3.17        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
      3.57            -0.1        3.49        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.61            -0.1        1.53        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.93            -0.1        0.85        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.05            -0.1        0.99        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
      0.61            -0.1        0.55        perf-profile.calltrace.cycles-pp.w_test
      0.64            -0.1        0.58        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.87            -0.1        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
      2.50            -0.1        2.44        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
      0.62            -0.1        0.56        perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
      0.74            -0.0        0.69        perf-profile.calltrace.cycles-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.91            -0.0        0.86        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.84            -0.0        0.79        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      0.68            -0.0        0.64        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.74            -0.0        0.71        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      0.62            -0.0        0.59        perf-profile.calltrace.cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.97            +0.0        1.00        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      0.91            +0.1        0.97        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      0.86 ±  3%      +0.1        0.94        perf-profile.calltrace.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write
      0.58 ±  2%      +0.1        0.66 ±  7%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
     11.24            +0.1       11.36        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      2.01 ±  2%      +0.1        2.14        perf-profile.calltrace.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      6.04            +0.2        6.24        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      5.17            +0.2        5.42        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
     96.75            +0.3       97.03        perf-profile.calltrace.cycles-pp.write
      2.57            +0.4        2.92        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
      3.20            +0.4        3.57        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
     84.82            +1.1       85.88        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     83.38            +1.2       84.56        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     78.73            +1.5       80.20        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     74.54            +1.8       76.32        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +4.0        3.99        perf-profile.calltrace.cycles-pp.__fsnotify_parent.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      5.32            +4.2        9.48        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     58.42            -2.0       56.38        perf-profile.children.cycles-pp.generic_file_write_iter
     38.46            -2.0       36.50        perf-profile.children.cycles-pp.generic_perform_write
     13.99            -1.0       13.01        perf-profile.children.cycles-pp.simple_write_begin
     13.11            -1.0       12.15        perf-profile.children.cycles-pp.__filemap_get_folio
      7.23            -0.6        6.66        perf-profile.children.cycles-pp.entry_SYSCALL_64
      7.12            -0.5        6.59        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      6.73            -0.5        6.21        perf-profile.children.cycles-pp.filemap_get_entry
      5.76            -0.5        5.26        perf-profile.children.cycles-pp.simple_write_end
      4.05            -0.4        3.64        perf-profile.children.cycles-pp.security_file_permission
      2.93            -0.3        2.59        perf-profile.children.cycles-pp.apparmor_file_permission
      4.32            -0.3        4.04        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      4.20            -0.3        3.92        perf-profile.children.cycles-pp.__cond_resched
      6.91            -0.2        6.67        perf-profile.children.cycles-pp.file_remove_privs_flags
      2.43            -0.2        2.24        perf-profile.children.cycles-pp.rcu_all_qs
      3.10            -0.2        2.92        perf-profile.children.cycles-pp.xas_load
      2.47 ±  2%      -0.2        2.29 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      1.92            -0.2        1.74        perf-profile.children.cycles-pp.folio_unlock
      3.11            -0.2        2.94        perf-profile.children.cycles-pp.down_write
      4.18            -0.1        4.04        perf-profile.children.cycles-pp.security_inode_need_killpriv
      1.68            -0.1        1.56        perf-profile.children.cycles-pp.up_write
      3.48            -0.1        3.38        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      1.96            -0.1        1.87        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.28            -0.1        1.18        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.92            -0.1        0.84        perf-profile.children.cycles-pp.w_test
      3.14            -0.1        3.06        perf-profile.children.cycles-pp.__vfs_getxattr
      1.00            -0.1        0.92        perf-profile.children.cycles-pp.aa_file_perm
      1.29            -0.1        1.22        perf-profile.children.cycles-pp.xas_descend
      0.76            -0.1        0.70        perf-profile.children.cycles-pp.x64_sys_call
      0.87            -0.1        0.80        perf-profile.children.cycles-pp.setattr_should_drop_suidgid
      1.07            -0.1        1.01        perf-profile.children.cycles-pp.xattr_resolve_name
      1.10            -0.1        1.04        perf-profile.children.cycles-pp.folio_wait_stable
      1.05            -0.1        1.00        perf-profile.children.cycles-pp.folio_mapping
      0.73            -0.1        0.67        perf-profile.children.cycles-pp.xas_start
      0.93            -0.1        0.88        perf-profile.children.cycles-pp.folio_mark_dirty
      0.50            -0.0        0.46        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.60            -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
      0.43            -0.0        0.39        perf-profile.children.cycles-pp.write@plt
      0.36            -0.0        0.33        perf-profile.children.cycles-pp.amd_clear_divider
      0.37            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
      0.33            -0.0        0.31        perf-profile.children.cycles-pp.noop_dirty_folio
      0.36            -0.0        0.34        perf-profile.children.cycles-pp.is_bad_inode
      0.24            -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.file_remove_privs
      1.18            +0.0        1.21        perf-profile.children.cycles-pp.strcmp
      1.02            +0.1        1.08        perf-profile.children.cycles-pp.timestamp_truncate
     99.01            +0.1       99.09        perf-profile.children.cycles-pp.write
      0.98 ±  3%      +0.1        1.06        perf-profile.children.cycles-pp.generic_write_check_limits
      0.68 ±  2%      +0.1        0.77 ±  6%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
     11.58            +0.1       11.69        perf-profile.children.cycles-pp.__generic_file_write_iter
      2.36 ±  2%      +0.1        2.50        perf-profile.children.cycles-pp.generic_write_checks
      5.57            +0.2        5.75        perf-profile.children.cycles-pp.fault_in_readable
      6.28            +0.2        6.49        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      2.98            +0.4        3.33        perf-profile.children.cycles-pp.inode_needs_update_time
      3.51            +0.4        3.89        perf-profile.children.cycles-pp.file_update_time
     85.24            +1.1       86.31        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     84.05            +1.2       85.21        perf-profile.children.cycles-pp.do_syscall_64
     79.32            +1.5       80.78        perf-profile.children.cycles-pp.ksys_write
     75.49            +1.7       77.21        perf-profile.children.cycles-pp.vfs_write
      3.64            +4.0        7.64        perf-profile.children.cycles-pp.__fsnotify_parent
      5.68            +4.3       10.03        perf-profile.children.cycles-pp.rw_verify_area
      6.96            -0.5        6.44        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      6.52            -0.5        6.01        perf-profile.self.cycles-pp.write
      6.92            -0.4        6.48        perf-profile.self.cycles-pp.vfs_write
      3.59            -0.3        3.24        perf-profile.self.cycles-pp.filemap_get_entry
      4.41            -0.3        4.09        perf-profile.self.cycles-pp.__filemap_get_folio
      4.23            -0.3        3.95        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.79            -0.3        2.52        perf-profile.self.cycles-pp.simple_write_end
      1.76            -0.2        1.52        perf-profile.self.cycles-pp.apparmor_file_permission
      2.32 ±  2%      -0.2        2.16 ±  2%  perf-profile.self.cycles-pp.__fdget_pos
      1.79            -0.2        1.62        perf-profile.self.cycles-pp.folio_unlock
      2.05            -0.2        1.89        perf-profile.self.cycles-pp.down_write
      2.35            -0.1        2.22        perf-profile.self.cycles-pp.__cond_resched
      1.89            -0.1        1.77        perf-profile.self.cycles-pp.do_syscall_64
      1.38            -0.1        1.26        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.56            -0.1        1.45        perf-profile.self.cycles-pp.up_write
      1.30            -0.1        1.19        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.42            -0.1        1.31        perf-profile.self.cycles-pp.rcu_all_qs
      1.12            -0.1        1.02        perf-profile.self.cycles-pp.security_file_permission
      1.46            -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
      0.90            -0.1        0.83        perf-profile.self.cycles-pp.aa_file_perm
      1.29            -0.1        1.22        perf-profile.self.cycles-pp.xas_load
      0.74            -0.1        0.67        perf-profile.self.cycles-pp.w_test
      1.08            -0.1        1.01        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.98            -0.1        1.92        perf-profile.self.cycles-pp.file_remove_privs_flags
      1.30            -0.1        1.24        perf-profile.self.cycles-pp.__vfs_getxattr
      1.06            -0.1        1.00        perf-profile.self.cycles-pp.xas_descend
      0.80            -0.1        0.74        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.63            -0.1        0.58        perf-profile.self.cycles-pp.x64_sys_call
      0.74            -0.1        0.69        perf-profile.self.cycles-pp.setattr_should_drop_suidgid
      0.63            -0.0        0.58        perf-profile.self.cycles-pp.xas_start
      0.87            -0.0        0.83        perf-profile.self.cycles-pp.folio_mapping
      0.50            -0.0        0.46        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.60            -0.0        0.57        perf-profile.self.cycles-pp.xattr_resolve_name
      0.48            -0.0        0.44        perf-profile.self.cycles-pp.folio_mark_dirty
      0.68            -0.0        0.65        perf-profile.self.cycles-pp.security_inode_need_killpriv
      0.36            -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.inode_to_bdi
      0.52            -0.0        0.49        perf-profile.self.cycles-pp.folio_wait_stable
      0.34            -0.0        0.32        perf-profile.self.cycles-pp.cap_inode_need_killpriv
      0.89            -0.0        0.87        perf-profile.self.cycles-pp.simple_write_begin
      0.25            -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
      0.23 ±  2%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.amd_clear_divider
      0.23 ±  2%      -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_folio
      0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.write@plt
      0.24            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.is_bad_inode
      0.62            +0.0        0.65        perf-profile.self.cycles-pp.file_update_time
      0.86            +0.0        0.90        perf-profile.self.cycles-pp.strcmp
      0.69            +0.0        0.74        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.75 ±  3%      +0.1        0.81        perf-profile.self.cycles-pp.generic_write_check_limits
      1.42 ±  2%      +0.1        1.48        perf-profile.self.cycles-pp.generic_write_checks
      0.82            +0.1        0.89        perf-profile.self.cycles-pp.timestamp_truncate
      0.58 ±  3%      +0.1        0.66 ±  6%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      5.44            +0.2        5.60        perf-profile.self.cycles-pp.fault_in_readable
      1.36            +0.2        1.55        perf-profile.self.cycles-pp.inode_needs_update_time
      1.76 ±  3%      +0.9        2.64        perf-profile.self.cycles-pp.rw_verify_area
      3.46            +3.8        7.25        perf-profile.self.cycles-pp.__fsnotify_parent




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


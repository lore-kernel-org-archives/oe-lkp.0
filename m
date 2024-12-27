Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7D19A
	for <oe-lkp@lists.linux.dev>; Fri, 27 Dec 2024 03:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735268772; cv=fail; b=VgADua0gJcqqf1WrvTvqapZjSDloU+YSFBQklvnEwHYISMg0+OgrpzcbbSIfisbLS+GxahiWYrwgF7vudqyDALwywZN/o9ieFNPDhSBpMjiwMzEfgAzoIswPZt0S4M30q2nwRBmAVQMjTZX+J0UO3Mi/yW/ZvO8G2OGbbQisf/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735268772; c=relaxed/simple;
	bh=vRzNJLn9tk+PO8COors4Gyt1ruxzjx531asPDDWxcLE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NfQppm7x07tWzIBe80nDYMxVxMPiE+bLltJcQUI/pNwxGcerI58X4a2lt6cUOYpLYS4+se50Zx1xNQP9t4Zh5ezamA1Gy17RqZPOUbKlsTHzrd/2tB/eWiWHw1P7yOvTCju5zu6pyTUUm54JQcQbjxpz6+2QQrc5p1LbqcmZANw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3oAuceF; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3oAuceF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735268770; x=1766804770;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=vRzNJLn9tk+PO8COors4Gyt1ruxzjx531asPDDWxcLE=;
  b=K3oAuceFaPLZCQVNvjuqmhtusxyvOUPzwocP0UMlcF5RKl7inEnTtyvw
   cVe13p3LVNeeZn+M0I92pMi1+hGufjLN7Y7HmSqGBr0MRDYuAgraI5BWL
   NVNKmpNBm7myuFgkUl+Rm9zeQ0Sk80f8CNlBPikpo2nVr/GnCyenO5SL6
   a8ZHsXw6cfpx+Y639xkrxrx8qapAAxTIrLqlEBFEbpb0uFXua7Z07Xg93
   W27ZrvAnwcFXC/95eClLBgIawieiTAowfcjHAIMekWYNe6WquHJVPhPWu
   cMmR9t3uUvQAZjgoEZ4bF+IAqK1Z3yRT5t+l+a5q8qs4Em9wfGn+Np5FJ
   Q==;
X-CSE-ConnectionGUID: l19LXDBqScWXTiyMNqDFjg==
X-CSE-MsgGUID: 9MHoLr1QTo+Bhny8lxzpDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35565734"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35565734"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 19:06:09 -0800
X-CSE-ConnectionGUID: rVafj/XoR46WnXeiqjAGtQ==
X-CSE-MsgGUID: Sd/cfZ2BS6m+VqxtSHoFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="99812104"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Dec 2024 19:06:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 26 Dec 2024 19:06:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 26 Dec 2024 19:06:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 26 Dec 2024 19:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkcQW3gNdIjESCvs1s4Bx5NbIttoZpKvE87m9jyIo2r5IMX2dV+hTlalG6kBqKrOaViMJe2BUrisxOuZ6QZBImpTnDl0TXbJ1HoEREyq9T/Zivq3k+vZh98iFZdBLmIqRdeC8RSRS6zkbmf6cOXKHUMIMxGpAoJOYGJUaY3jTVNmuT9m+S7QqgzlTWgA8KofRYFXNv5VUK95BMN0XTU3LzMwaOyvZIEjxUG47YVmIger3Ag56HEfAptgS1lMNqkiFpPnkPG7JcQSBPZVWONkOGIH+aPEHGVp9P+wvG0exGWN/12eUajd9bPW8kf970w8lXk2yvpIygf/OfgGx+wD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCjopiP8QAyo2VeR3XImkk8FB7ZDK4P/NUeuXb/8zgk=;
 b=eDvBRS4QishIXqtRROR3v2/4YK3f8dKqsuuHlsccguXgUM91CYrzn7x79a7qiFWIUOEbpzfvL4ph+wL68+/r/aOAn/wmH1aenRuaMAMQGl0GoLWDSvA6nGVfH8aI4ub3s6/VeLNuBtf4YClT31UQqxS0E2K8EHJGwij0jyI35IbZQYoxe5KEk2sc/Oxg13mJKbv5XS3YizPiLK8csMdIwiHNKcumtR72E0QTLT7jUCFjv6e2ODh14j+ZZQ0HVavTMhVyJSS4RewhyOI2DUNNeFf5lKN8ufrjHLs4/6e/OhuA/gX0BVB0OZE+1aSk4ptK9Po7NNA4tzs+c9z+76MIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Fri, 27 Dec
 2024 03:05:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 03:05:47 +0000
Date: Fri, 27 Dec 2024 11:05:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Koichiro Den <koichiro.den@canonical.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Aristeu Rozanski <aris@ruivo.org>, "Aristeu
 Rozanski" <aris@redhat.com>, David Hildenbrand <david@redhat.com>, Muchun
 Song <muchun.song@linux.dev>, Vishal Moola <vishal.moola@gmail.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [hugetlb]  44818d6e3e: vm-scalability.throughput
 78.3% improvement
Message-ID: <202412271037.59a4097d-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: e130f41c-e298-4263-1d0c-08dd26235c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o7JNqHeVw+eSPexIjU6qCNcQ7ybjNPnEZrUJhUeQs3XYXfTP2TrIF2RqmU?=
 =?iso-8859-1?Q?VzGlBbDlZgA0tjzo6O3aDB+s0ASWy0MIdhlPJYZ19seeA+RHYjjTyFOg2v?=
 =?iso-8859-1?Q?dtSGqFQL0rK7wT0lf5HphDPXa/6wB36/nXoGctdOZEAEhTSsU5sv9932kz?=
 =?iso-8859-1?Q?d2yYiONPhA5bXwlbAwOvyPwQfAyOfg09ru+Un1UTaIUqXn2m+bpdgybhqd?=
 =?iso-8859-1?Q?afFr3YgD0bYDxQFeuDqkECfIoQsW1IP0quxd/Y/OGDj5tPxMtZKD2D3tE4?=
 =?iso-8859-1?Q?d0OEzsS2L/zBNmiCj7AnvE09aSD3yTQFbutICaLmd2PO1a8NFKSOWq6lnp?=
 =?iso-8859-1?Q?HWawSRvFOJjTLDeu6NF3LwShxiixCVDYKk39i0d+4E6cnc08Uj8NLY+NDU?=
 =?iso-8859-1?Q?hSpAJqhKR/p3/zlERmZpLcybF9aTA306TaUUun63FnXHYP186r0IJeG+fG?=
 =?iso-8859-1?Q?Phbzrai6GwJHEBPtfsgaPW9ZeDQ3UzjrbF8pC3Hwbu+f/KPVurQ02Z1BrC?=
 =?iso-8859-1?Q?7caToTHhv4Olt8TDO1KMW8B9HU1aoVqqlpD0q3nN1WRKGteo0An+1YB/AD?=
 =?iso-8859-1?Q?Ygyfzz6s5UGBqhN58soFa0QmAPQIao4Ll/IwEZA1ksc14Psr456yuOxZ9e?=
 =?iso-8859-1?Q?eJxS6isXq2khmq74y06DCg5eZ6WeeeT87uoub9Z5xaOUru3LN0Sf2eL1fn?=
 =?iso-8859-1?Q?lCLUeCuGT07b915cfhiG8TibsB/L/5GiyrP1ZLVCxxvqrYe6Z1n19wgLM8?=
 =?iso-8859-1?Q?ddUT/1QTBjrhS0rrh41wa77ZNG6tHL0o6kmBiBSIxzboiH4sr0pohbQ6Jp?=
 =?iso-8859-1?Q?H4vTHZK93IO0FazptC/QZF7Jp3W6UdF89DMxHiiXGvMlKQYpda153rbCvU?=
 =?iso-8859-1?Q?q/VPk1TYLD9RVvvnUeze3RP6FDCAcggpG1Zl5AIoKn0wDnHUC9vLaX1Nbu?=
 =?iso-8859-1?Q?8YI1dReyYqqAE63eTgGzc1QSXxvJUSOVAV5F6lXNBVpAmt3UF7DPqv62Mc?=
 =?iso-8859-1?Q?SdZEIHeO2TzlmfTQMQvY0GeeVfkMOYTb2PWzx0mSQUGF2yTBMslB86btd9?=
 =?iso-8859-1?Q?kVjpFhJjiFQjLFLCk71E0C3h5u8HkuLXuZxh+hMV9ci2GQwoJ79lf5oyg6?=
 =?iso-8859-1?Q?V3hUoZH55IIFf6j8N+wuN3XMhaUuZ2xNIdNwSztNWwmJgMJKz8lL8OJ2cn?=
 =?iso-8859-1?Q?qWBp3TQ1vpI08DQpi7CTvUMsfDlopxV1cBcI/iErdQwfPJOOj8tSRjFMnl?=
 =?iso-8859-1?Q?Z2fgNvp7Xxy/uI4E9LWEDnILEz0YgFKL03eam2QyoLJi9y2LyiwAqDfMvw?=
 =?iso-8859-1?Q?zXXyNAocPwbR2fL1VPfvwWAoat2VpkTn5SeJCKRiLj0vxJ2YcP2FVLd9Au?=
 =?iso-8859-1?Q?gZdaUqJtfE/9M9d5kpPxv/BDWy6GzyJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4U5GjXNBNui+pDbe9zt0j6rEQ6E8pG9N5CM2a6UPOTZ5dCYycZ/6AQZHlD?=
 =?iso-8859-1?Q?4XwpxAKsJORKPVtCdxGcr3FWsKr8czb5MQrAVzPsSRrPtM9bnajGN3Zdd9?=
 =?iso-8859-1?Q?YjjpS1RwbrrS4RZak4sQyinlKvlvfrmqIDa1zSJ/jxY/gp/XWZgJcpl5/z?=
 =?iso-8859-1?Q?8E7B5G2ECRlrpt8ikAtRsNByJ4/evlxkKj4peoCOvOlQAFk4oMDzlvpUtL?=
 =?iso-8859-1?Q?UjaRIzcJsnvvDA8oHv+Il366zWf6+/YTP770/0tP+WZKJHjI66pD2HNjbE?=
 =?iso-8859-1?Q?o9GF3GL9WLdpGgfnC/M49w3cuz22t+ZDhlx3zsx6lerTpv5SUsVKOQ4aBa?=
 =?iso-8859-1?Q?8n0ILC0hLFLH2EYDdT+FuRXR6kqQxGaBWlg7fS18y/jj9OvxybeEiqrCse?=
 =?iso-8859-1?Q?k796HXEM9xXyN2+jjAK6DxCLPt3Lpq8E12ufVQg19LbQeEFbsrvuxsDgBO?=
 =?iso-8859-1?Q?aTY9d3nShE0KTCkc08wYhVyVy269TbYoigm7hM2l2VYxM/WRkg1meNklYX?=
 =?iso-8859-1?Q?ivMwkKwMXs3fWWq43KdpvienN29A1Wv1w9s8sSi9DBp3y32ctelpGjhRxg?=
 =?iso-8859-1?Q?ubtGXQJzq1tnXz1MzQrABH2iez1neR5y4cXxQCXykdRN+cuH4OrwLgxb/S?=
 =?iso-8859-1?Q?HzZJ+0IX6YbNuaqQD3MhZq8XTGler2yy6kg7ZGvunug8llsh/gNbDZxBfK?=
 =?iso-8859-1?Q?RChngJaCLwvxMfI5GyRsVH0wTJmZ0/+iiJHCyhTsfjctf7pgasO8/x/Ohe?=
 =?iso-8859-1?Q?tW6kQvjiWyKr9Ww+wjEzYzrSbMuey6mHQgf3//VVv5HAniUM2ZxtddDumv?=
 =?iso-8859-1?Q?m4jbZOrY1PWMpQBIL5gk6LCR+KpGwP4oP+U2s0qcM8swRyNyA7lnaCLGVa?=
 =?iso-8859-1?Q?pBfHct50VpTlYsoGGytkCl5qTtXyK5Kn6S1FV/QOqPM0gZ3yTwIFOtRrJ+?=
 =?iso-8859-1?Q?cvzh22UMJUb/pdNl+g2W15Ncnm+LYOIvZbOHgdfi/smmsv3c4Fs5SkEuu+?=
 =?iso-8859-1?Q?KW2ZlCs9+UnIwBFcDs/mZ/nVNq5kg6tlr/T3/oAgwZwaGo+eFymcD6Xpcp?=
 =?iso-8859-1?Q?xDSOt5be4ijDZeBf11j86q/4h/mA56lnr9OlOs9z2Rdhl4PAkuC1ijhzQW?=
 =?iso-8859-1?Q?ABB9sXk9Iuic7wA6PWJvvTiYdKzH0GmGQMob/9E7hqXtgmqbGvmuG+Nb07?=
 =?iso-8859-1?Q?sXthF4urFo1HBjlNRUtJVUSKtYx2npISb4zY0w/MSfFQWxtaKS0JdMQPCN?=
 =?iso-8859-1?Q?IoEBQNqfEyaj5mhJwIfXEfy98iAZjWP8j/rUF7xUopGodHXGUjSQGVWvrR?=
 =?iso-8859-1?Q?L1cxT3pahpufu1ORytsGz/851WQgjvQ3mJuE5W8xI4WH3Xo7QgjXdTJQaG?=
 =?iso-8859-1?Q?Un72hUlfF7yFKZGVlJ6XHyIyxUsVyjD4BhuWvkQpXhiOgsJ8FnkjAuZObr?=
 =?iso-8859-1?Q?XArGwkmOSDYK+i74nmsd91Pdu7NAQ55lQk1jKaAexd/4Z7238MhcFw3BEI?=
 =?iso-8859-1?Q?VYyi3i2sDvP8KO42XIr6EKhs4qi2+Zu6JSJtG+HiKHY6k73+63XVZ7xzOW?=
 =?iso-8859-1?Q?PDXlz/lKr7jNdJxGeSvRtb8fyZIzwKBOMI686hoI3cygAz6447sMZoJNf0?=
 =?iso-8859-1?Q?Fm51jmAa4QZ7u9ds05ltIsqi5wS8fKMyWRLh0DhALlfu+ZAaQEZniXVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e130f41c-e298-4263-1d0c-08dd26235c51
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 03:05:47.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmPju1lHAzybAVPO6o2HxKkPmQSMFgwA541ifdt6fvut7RHK8SNQrY5Xl/ToVx00glbzn59gU+zQhPVhFH1oLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 78.3% improvement of vm-scalability.throughput on:


commit: 44818d6e3eb5b6fdb4960e1b53a98b0b74fdb85a ("hugetlb: prioritize surplus allocation from current node")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master


testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	size: 8T
	test: anon-w-seq-hugetlb
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241227/202412271037.59a4097d-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/8T/lkp-icl-2sp2/anon-w-seq-hugetlb/vm-scalability

commit: 
  a297fa1dd6 ("readahead: properly shorten readahead when falling back to do_page_cache_ra()")
  44818d6e3e ("hugetlb: prioritize surplus allocation from current node")

a297fa1dd6b37376 44818d6e3eb5b6fdb4960e1b53a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1868 ± 34%     -45.4%       1019 ± 66%  perf-c2c.HITM.remote
      8733 ±  6%     +15.5%      10087 ±  6%  uptime.idle
 2.836e+09 ± 18%     +35.1%  3.831e+09 ± 12%  cpuidle..time
   1267776 ±  4%     +21.6%    1541787        cpuidle..usage
      7.13 ± 18%      +2.5        9.67 ± 11%  mpstat.cpu.all.idle%
      0.09 ±  4%      -0.0        0.07 ±  8%  mpstat.cpu.all.soft%
      5109 ±  6%     +51.3%       7729 ± 12%  vmstat.system.cs
    151097            -2.5%     147260        vmstat.system.in
     29547 ±  2%     -13.5%      25558 ±  3%  meminfo.HugePages_Free
     29548 ±  2%     -13.5%      25559 ±  3%  meminfo.HugePages_Rsvd
     86746 ± 61%    -100.0%       0.00        meminfo.Inactive(anon)
    137371 ± 28%     -95.4%       6295 ± 82%  numa-numastat.node0.numa_foreign
   1577394 ± 42%     -95.5%      71023 ± 59%  numa-numastat.node0.other_node
    751460 ±  6%    +334.8%    3267469 ± 41%  numa-numastat.node1.local_node
    746936 ±  7%    +347.8%    3344651 ± 40%  numa-numastat.node1.numa_hit
    137371 ± 28%     -95.4%       6295 ± 82%  numa-numastat.node1.numa_miss
    193678 ±  2%     +78.1%     345017 ± 10%  vm-scalability.median
      5.65 ± 93%     +24.6       30.21 ±  9%  vm-scalability.median_stddev%
      9.15 ± 88%     +19.8       28.96 ± 10%  vm-scalability.stddev%
  25455097 ±  4%     +78.3%   45377627 ±  8%  vm-scalability.throughput
   3515955 ±  2%     +59.9%    5621813 ±  9%  vm-scalability.time.minor_page_faults
     11676            -2.7%      11364        vm-scalability.time.percent_of_cpu_this_job_got
     18157            -8.3%      16643        vm-scalability.time.system_time
     17234            +4.4%      17986        vm-scalability.time.user_time
     31462 ±  5%     +38.4%      43539 ±  4%  vm-scalability.time.voluntary_context_switches
 7.245e+09 ±  2%     +60.2%  1.161e+10 ±  9%  vm-scalability.workload
   2040555 ± 27%    +687.1%   16062067 ± 47%  numa-vmstat.node0.nr_free_pages
  14747440 ±  3%     -38.7%    9040252 ± 34%  numa-vmstat.node0.nr_hugetlb
     21511 ± 60%    -100.0%       0.00        numa-vmstat.node0.nr_inactive_anon
     21511 ± 60%    -100.0%       0.00        numa-vmstat.node0.nr_zone_inactive_anon
    137371 ± 28%     -95.4%       6295 ± 82%  numa-vmstat.node0.numa_foreign
   1577394 ± 42%     -95.5%      71023 ± 59%  numa-vmstat.node0.numa_other
  31231173           -44.3%   17391522 ± 45%  numa-vmstat.node1.nr_free_pages
   1023247 ± 33%    +705.1%    8238183 ± 45%  numa-vmstat.node1.nr_hugetlb
    746539 ±  7%    +347.9%    3343775 ± 40%  numa-vmstat.node1.numa_hit
    751062 ±  6%    +334.9%    3266583 ± 41%  numa-vmstat.node1.numa_local
    137371 ± 28%     -95.4%       6295 ± 82%  numa-vmstat.node1.numa_miss
   8058778 ± 37%     -34.8%    5256544 ± 27%  sched_debug.cfs_rq:/.avg_vruntime.stddev
   8058779 ± 37%     -34.8%    5256544 ± 27%  sched_debug.cfs_rq:/.min_vruntime.stddev
    452243 ± 13%     -30.8%     312801 ± 32%  sched_debug.cpu.avg_idle.min
    179738 ± 22%     -19.6%     144435 ±  2%  sched_debug.cpu.avg_idle.stddev
     10523 ±  5%     +20.3%      12654 ±  4%  sched_debug.cpu.curr->pid.max
      1700 ± 34%     +73.5%       2951 ± 28%  sched_debug.cpu.curr->pid.stddev
     69760 ± 48%     -40.4%      41570 ± 11%  sched_debug.cpu.max_idle_balance_cost.stddev
      6803 ±  6%     +38.7%       9434 ±  9%  sched_debug.cpu.nr_switches.avg
     30627 ± 12%     +30.6%      40002 ± 11%  sched_debug.cpu.nr_switches.max
      2809 ±  9%     +26.7%       3560 ± 11%  sched_debug.cpu.nr_switches.min
      4583 ±  9%     +42.3%       6520 ±  4%  sched_debug.cpu.nr_switches.stddev
     28729 ±  3%     -53.2%      13433 ± 70%  numa-meminfo.node0.HugePages_Free
     58184 ±  2%     -46.1%      31385 ± 50%  numa-meminfo.node0.HugePages_Surp
     58184 ±  2%     -46.1%      31385 ± 50%  numa-meminfo.node0.HugePages_Total
     86568 ± 60%     -99.5%     443.64 ±115%  numa-meminfo.node0.Inactive
     86480 ± 60%    -100.0%       0.00        numa-meminfo.node0.Inactive(anon)
   8479775 ± 25%    +656.9%   64186465 ± 48%  numa-meminfo.node0.MemFree
 1.232e+08           -45.2%   67498215 ± 46%  numa-meminfo.node0.MemUsed
     17.66 ±113%  +67092.2%      11869 ± 71%  numa-meminfo.node1.HugePages_Free
      2016 ± 34%   +1286.9%      27962 ± 56%  numa-meminfo.node1.HugePages_Surp
      2016 ± 34%   +1286.9%      27962 ± 56%  numa-meminfo.node1.HugePages_Total
 1.249e+08           -44.1%   69824972 ± 44%  numa-meminfo.node1.MemFree
   7114401 ±  2%    +774.7%   62230355 ± 49%  numa-meminfo.node1.MemUsed
 6.716e+08 ± 30%     -95.2%   32119866 ± 99%  proc-vmstat.compact_daemon_free_scanned
 6.716e+08 ± 30%     -95.2%   32119866 ± 99%  proc-vmstat.compact_free_scanned
     83155 ± 29%     -52.9%      39134 ± 30%  proc-vmstat.compact_isolated
   3150336 ±  2%     +60.2%    5048064 ±  9%  proc-vmstat.htlb_buddy_alloc_success
  15894009            +7.3%   17057392 ±  3%  proc-vmstat.nr_hugetlb
     21591 ± 61%    -100.0%       0.00        proc-vmstat.nr_inactive_anon
     25925            -1.2%      25622        proc-vmstat.nr_kernel_stack
     27603 ±  2%      +5.2%      29044        proc-vmstat.nr_slab_reclaimable
     68217            +2.3%      69790        proc-vmstat.nr_slab_unreclaimable
     21591 ± 61%    -100.0%       0.00        proc-vmstat.nr_zone_inactive_anon
    137371 ± 28%     -84.7%      21019 ± 51%  proc-vmstat.numa_foreign
   4426766           +49.3%    6609025 ±  8%  proc-vmstat.numa_hit
   2853943 ± 24%    +126.9%    6475543 ±  8%  proc-vmstat.numa_local
    137371 ± 28%     -84.7%      21019 ± 51%  proc-vmstat.numa_miss
   1710242 ± 39%     -91.0%     154545 ±  6%  proc-vmstat.numa_other
    317740 ± 26%     +40.3%     445933 ± 17%  proc-vmstat.numa_pte_updates
    111196 ±  9%     -83.9%      17920 ± 96%  proc-vmstat.pgalloc_dma
  18541178 ±  2%     -83.2%    3111103 ± 97%  proc-vmstat.pgalloc_dma32
 1.596e+09 ±  2%     +61.9%  2.583e+09 ± 10%  proc-vmstat.pgalloc_normal
   4517187           +46.7%    6627031 ±  8%  proc-vmstat.pgfault
 1.614e+09 ±  2%     +60.2%  2.586e+09 ±  9%  proc-vmstat.pgfree
     64134 ±  2%     +23.9%      79452 ±  5%  proc-vmstat.pgreuse
    568.17 ± 62%    -100.0%       0.00        proc-vmstat.pgscan_file
    568.17 ± 62%    -100.0%       0.00        proc-vmstat.pgscan_kswapd
     27985 ± 44%    -100.0%       0.00        proc-vmstat.slabs_scanned
      5033           +48.2%       7459 ±  5%  proc-vmstat.unevictable_pgs_culled
      1.81 ± 57%     -80.2%       0.36 ±173%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      3.05 ± 68%     -73.9%       0.80 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.05 ± 20%     -57.0%       0.02 ± 62%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.37 ± 49%     -48.5%       0.19 ± 25%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3.06 ± 29%     -85.1%       0.46 ±173%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      0.11 ± 10%     -61.9%       0.04 ± 74%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     27.66 ±181%     -95.7%       1.20 ±136%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
     14.17 ± 38%    +477.1%      81.78 ±110%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
      0.33 ±110%  +76908.2%     252.59 ±172%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    180.99 ± 70%     -86.4%      24.68 ± 70%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     23645 ± 25%     +32.3%      31287 ± 11%  perf-sched.total_wait_and_delay.count.ms
    301.09 ± 63%    +115.8%     649.76 ± 33%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.03 ± 53%    +338.6%      17.65 ± 26%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    235.84 ±  5%     +32.3%     311.97 ± 13%  perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     11.17 ± 23%     +79.1%      20.00 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    182.41 ± 89%   +1102.2%       2192 ± 29%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.90 ± 30%    +446.9%     163.55 ±110%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
      1.69 ± 78%    +156.2%       4.32 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.allocate_file_region_entries.region_chg.__vma_reservation_common
      1.81 ± 57%     -80.2%       0.36 ±173%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      4.92 ± 16%     +28.7%       6.32 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.gather_surplus_pages.hugetlb_acct_memory.part.0
      3.04 ± 68%     -73.8%       0.80 ±111%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
    299.81 ± 63%     +95.6%     586.43 ± 21%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.10 ± 31%    +301.8%      16.49 ± 20%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    235.76 ±  5%     +32.3%     311.80 ± 13%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.06 ± 29%     -85.1%       0.46 ±173%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
    182.48 ± 87%   +1101.3%       2192 ± 29%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1256 ± 18%     +84.7%       2321 ± 35%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
 2.639e+10 ±  2%     +62.5%  4.288e+10 ± 11%  perf-stat.i.branch-instructions
      0.05 ±  7%      -0.0        0.04 ±  5%  perf-stat.i.branch-miss-rate%
   9062629 ±  2%      +5.6%    9569988 ±  2%  perf-stat.i.branch-misses
 5.914e+08 ±  2%     +63.5%  9.672e+08 ± 12%  perf-stat.i.cache-misses
 6.515e+08 ±  2%     +63.5%  1.065e+09 ± 11%  perf-stat.i.cache-references
      5231 ±  7%     +53.1%       8010 ± 13%  perf-stat.i.context-switches
      3.97           -27.4%       2.88 ±  8%  perf-stat.i.cpi
    562.71           -21.8%     440.10 ± 14%  perf-stat.i.cycles-between-cache-misses
 8.316e+10 ±  2%     +61.9%  1.347e+11 ± 11%  perf-stat.i.instructions
      0.26 ±  2%     +61.8%       0.43 ±  9%  perf-stat.i.ipc
      0.36 ± 27%     +42.1%       0.51 ±  5%  perf-stat.i.major-faults
     15175 ±  2%     +50.7%      22862 ± 10%  perf-stat.i.minor-faults
     15175 ±  2%     +50.7%      22863 ± 10%  perf-stat.i.page-faults
      0.03 ±  2%      -0.0        0.02 ±  7%  perf-stat.overall.branch-miss-rate%
      3.88 ±  2%     -37.3%       2.43 ±  9%  perf-stat.overall.cpi
    546.77 ±  2%     -37.7%     340.65 ± 10%  perf-stat.overall.cycles-between-cache-misses
      0.26 ±  2%     +60.7%       0.41 ±  9%  perf-stat.overall.ipc
      3336            -1.4%       3289        perf-stat.overall.path-length
 2.521e+10 ±  2%     +57.4%  3.967e+10 ± 10%  perf-stat.ps.branch-instructions
 5.635e+08 ±  2%     +58.4%  8.926e+08 ± 11%  perf-stat.ps.cache-misses
 6.223e+08 ±  2%     +58.4%  9.855e+08 ± 10%  perf-stat.ps.cache-references
      5044 ±  7%     +52.1%       7674 ± 12%  perf-stat.ps.context-switches
 7.941e+10 ±  2%     +56.9%  1.246e+11 ± 10%  perf-stat.ps.instructions
      0.34 ± 28%     +41.8%       0.49 ±  3%  perf-stat.ps.major-faults
     14448           +47.0%      21235 ±  8%  perf-stat.ps.minor-faults
     14448           +47.0%      21236 ±  8%  perf-stat.ps.page-faults
 2.417e+13 ±  2%     +57.9%  3.817e+13 ±  9%  perf-stat.total.instructions
     47.00            -4.2       42.80 ±  6%  perf-profile.calltrace.cycles-pp.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault
     48.14            -4.1       44.00 ±  6%  perf-profile.calltrace.cycles-pp.hugetlb_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     48.18            -4.1       44.04 ±  6%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     48.31            -4.1       44.16 ±  6%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     48.24            -4.1       44.11 ±  6%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     48.24            -4.1       44.11 ±  6%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     46.69            -4.0       42.71 ±  6%  perf-profile.calltrace.cycles-pp.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     41.81            -2.9       38.88 ±  5%  perf-profile.calltrace.cycles-pp.clear_page_erms.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      2.43 ±  2%      -0.7        1.76 ± 19%  perf-profile.calltrace.cycles-pp.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      1.42            -0.7        0.75 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.clear_page_erms.folio_zero_user.hugetlb_no_page.hugetlb_fault
      1.42            -0.2        1.24 ±  8%  perf-profile.calltrace.cycles-pp.__mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      1.38            -0.2        1.21 ±  8%  perf-profile.calltrace.cycles-pp.mutex_spin_on_owner.__mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.20 ±144%      +0.5        0.75 ± 30%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap
      0.20 ±144%      +0.6        0.76 ± 30%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput.exit_mm
      0.20 ±144%      +0.6        0.76 ± 30%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.20 ±144%      +0.6        0.76 ± 30%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.exit_mm.do_exit
      0.21 ±143%      +0.6        0.78 ± 30%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      0.21 ±143%      +0.6        0.78 ± 30%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.21 ±143%      +0.6        0.78 ± 30%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      0.21 ±143%      +0.6        0.80 ± 29%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.21 ±143%      +0.6        0.80 ± 29%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      0.21 ±143%      +0.6        0.80 ± 29%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.21 ±143%      +0.6        0.80 ± 29%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.22 ±143%      +0.6        0.81 ± 29%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.22 ±143%      +0.6        0.81 ± 29%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     86.37            +1.0       87.32        perf-profile.calltrace.cycles-pp.do_access
     28.67            +1.8       30.52 ±  4%  perf-profile.calltrace.cycles-pp.do_rw_once
     48.22            -4.2       44.07 ±  6%  perf-profile.children.cycles-pp.handle_mm_fault
     48.14            -4.1       44.00 ±  6%  perf-profile.children.cycles-pp.hugetlb_fault
     48.35            -4.1       44.21 ±  6%  perf-profile.children.cycles-pp.asm_exc_page_fault
     48.28            -4.1       44.14 ±  6%  perf-profile.children.cycles-pp.do_user_addr_fault
     48.28            -4.1       44.14 ±  6%  perf-profile.children.cycles-pp.exc_page_fault
     46.39            -4.0       42.38 ±  6%  perf-profile.children.cycles-pp.folio_zero_user
     46.69            -4.0       42.71 ±  6%  perf-profile.children.cycles-pp.hugetlb_no_page
     43.18            -3.3       39.90 ±  5%  perf-profile.children.cycles-pp.clear_page_erms
      2.74 ±  2%      -0.7        2.02 ± 18%  perf-profile.children.cycles-pp.__cond_resched
      0.34 ± 22%      -0.2        0.16 ± 29%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.34 ± 22%      -0.2        0.16 ± 30%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.33 ± 24%      -0.2        0.15 ± 31%  perf-profile.children.cycles-pp.__folio_alloc_noprof
      0.33 ± 24%      -0.2        0.15 ± 31%  perf-profile.children.cycles-pp.alloc_buddy_hugetlb_folio
      1.42            -0.2        1.24 ±  8%  perf-profile.children.cycles-pp.__mutex_lock
      1.38            -0.2        1.21 ±  8%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      1.82 ±  2%      -0.1        1.67 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.48            -0.1        0.40 ± 11%  perf-profile.children.cycles-pp.rcu_all_qs
      0.14 ±  3%      -0.0        0.10 ± 13%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.16 ±  3%      -0.0        0.12 ± 16%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  3%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.handle_softirqs
      0.17 ± 12%      +0.1        0.23 ± 11%  perf-profile.children.cycles-pp.io_serial_in
      0.05 ± 13%      +0.1        0.12 ± 34%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.1        0.07 ± 19%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.20 ± 11%      +0.1        0.26 ± 11%  perf-profile.children.cycles-pp.wait_for_lsr
      0.02 ±141%      +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.22 ± 12%      +0.1        0.30 ± 11%  perf-profile.children.cycles-pp.serial8250_console_write
      0.84 ±  3%      +0.1        0.94 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.10 ± 11%      +0.1        0.20 ±  7%  perf-profile.children.cycles-pp.generic_perform_write
      0.10 ± 13%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.11 ± 12%      +0.1        0.22 ±  6%  perf-profile.children.cycles-pp.record__pushfn
      0.11 ± 12%      +0.1        0.22 ±  6%  perf-profile.children.cycles-pp.writen
      0.17 ± 11%      +0.1        0.28 ±  5%  perf-profile.children.cycles-pp.__cmd_record
      0.17 ± 11%      +0.1        0.28 ±  5%  perf-profile.children.cycles-pp.cmd_record
      0.18 ±  9%      +0.1        0.29 ±  5%  perf-profile.children.cycles-pp.handle_internal_command
      0.18 ±  9%      +0.1        0.29 ±  5%  perf-profile.children.cycles-pp.main
      0.18 ±  9%      +0.1        0.29 ±  5%  perf-profile.children.cycles-pp.run_builtin
      0.14 ± 11%      +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.perf_mmap__push
      0.14 ± 11%      +0.1        0.27 ±  6%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.53 ± 10%      +0.2        0.70 ±  6%  perf-profile.children.cycles-pp.vfs_write
      0.53 ± 10%      +0.2        0.70 ±  6%  perf-profile.children.cycles-pp.ksys_write
      0.54 ± 10%      +0.2        0.72 ±  6%  perf-profile.children.cycles-pp.write
      0.42 ± 35%      +0.3        0.75 ± 30%  perf-profile.children.cycles-pp.folios_put_refs
      0.43 ± 34%      +0.3        0.76 ± 30%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.43 ± 34%      +0.3        0.76 ± 30%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.43 ± 34%      +0.3        0.76 ± 30%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.45 ± 34%      +0.3        0.78 ± 30%  perf-profile.children.cycles-pp.__mmput
      0.45 ± 34%      +0.3        0.78 ± 30%  perf-profile.children.cycles-pp.exit_mmap
      0.44 ± 33%      +0.3        0.78 ± 30%  perf-profile.children.cycles-pp.exit_mm
      0.45 ± 32%      +0.3        0.80 ± 29%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.45 ± 32%      +0.3        0.80 ± 29%  perf-profile.children.cycles-pp.do_exit
      0.45 ± 32%      +0.3        0.80 ± 29%  perf-profile.children.cycles-pp.do_group_exit
      0.45 ± 32%      +0.3        0.80 ± 29%  perf-profile.children.cycles-pp.x64_sys_call
     43.21            +3.8       46.97 ±  4%  perf-profile.children.cycles-pp.do_rw_once
     42.71            -3.3       39.45 ±  6%  perf-profile.self.cycles-pp.clear_page_erms
      2.31 ±  2%      -0.7        1.66 ± 20%  perf-profile.self.cycles-pp.__cond_resched
      1.37            -0.2        1.20 ±  8%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.20 ±  2%      -0.1        0.14 ± 20%  perf-profile.self.cycles-pp.rcu_all_qs
      0.16 ±  3%      -0.0        0.12 ± 16%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.17 ± 12%      +0.1        0.23 ± 11%  perf-profile.self.cycles-pp.io_serial_in
      0.04 ± 47%      +0.1        0.12 ± 34%  perf-profile.self.cycles-pp.ktime_get
      0.02 ±141%      +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
     41.00            +2.9       43.86 ±  3%  perf-profile.self.cycles-pp.do_rw_once




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18927083C
	for <oe-lkp@lists.linux.dev>; Fri, 24 Oct 2025 05:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284347; cv=fail; b=pC72wvakXOd4BaUo7wlaqW5Qrfch45CnseULiw9sPvlvIYD9N8glZrqVDinKj29DhLrjp/JXoWD3r8q5mBLI7ZFav84JFJuKYErwScHBLFbIxNwLZzXOnoKhQvrA/QRBkl6ZrQAWmrunsBB6wZxrIm9hsnbIh243NtlCbFjBa7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284347; c=relaxed/simple;
	bh=R9PWFgxUAdx4necMLOwJXGd2QcndqBjEvcswelB5/C8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Y5ZUyrdfvMBs89oS8pMQeraanDcAK4oy0rxFeqFWItVsOkCpIwi1v5PmdxjRyw2Z9yzPZttblwhC5atcXY0SeZQ7xK+78D0lbxc1D3fFe8a6mrYUBugrUgd+osUsN6W2VuaPRX06rZ7B/gVosZO0SEbrqhfW3RK3lsSu0CTsBmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGQ9DWGZ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGQ9DWGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761284343; x=1792820343;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=R9PWFgxUAdx4necMLOwJXGd2QcndqBjEvcswelB5/C8=;
  b=hGQ9DWGZtXeV0I0qhI9zsY1bYe0WOW0xLZ1YE9Hje9qs4+4+MLWZp/oV
   0afo/a1idVhnl9DnzGR3bwJLuPUA8fP85zUgodonW4Q7ibjr4FnkySiul
   fLWWziv2XFWSqCuNofOdm/HHMsxIKEVQiVJluuvGb7vJoICwurjqH30yG
   4ePKUhdnnIReR7YzqokknUwSrrFLef0sSrjMaKSEmaR5FIJ3TO2dj0aYv
   MDSZXDdBa6vTcF13YRJ1pog1/dqXQoCTKifMluxK0vUVJ7y1t6A1T/hxK
   afGL4k35HUtXRQ5H3wolHb6wlvjnPjwgVHbdAhYhXE93mAnj/UGpXMwYh
   g==;
X-CSE-ConnectionGUID: uoZzUU69T++VrQ7dsdTwlg==
X-CSE-MsgGUID: 83HAbyhTS+2yBZPthsk4Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63386897"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63386897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:39:03 -0700
X-CSE-ConnectionGUID: tgRdijtgR2Gh9+Oiimb/nQ==
X-CSE-MsgGUID: GKChe9ZqQTWkZg4jqCfFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188638205"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:39:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:39:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 22:39:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQWMUvseHuBZ0VtyEfZH1rW/TBEg3Dc58cZXb7f4aQKI/3Ki07L3F2bR9l0ZuXWubyeQ7nLmtdc5QvQEn152Mf+YCGbfGYHg/u3OADYBHDNUb6TpimZZ1O5a70jlB9h4k6Hx47ybT5bpkMdfFcBWFga5VW08qISRZhkZNUZyAObouDEgjtYQjiDuVJ7CTeBNbRld44e26jwHkOD68f8MBJhVohbBah1lqtPhOOt20p/ht3tGir00kB2uWlUTkZu7qGKyYpEGLcwWKUZ/aYD11G7htz6supiIvse9U7PXdi7WaliSaL6gAIIXt3AN4NhJOkJ/a08fwsy+c4Ubx2AwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXmgyj7j0U0sjC3d1998pHvEFoRTdXX/dmsvtgNYLVw=;
 b=OTUO22o2pg/hr7ZBn2+G0CwsDdJnB3B7h8EQ/BSgv8s2/l3L4aoYMIiszKAimvENPrZ7r6cOIG/5Tqyf0fqBYhNxVolz7GY0nhS+/hUNqmZjFVG2qKk3jucfO+v0NhLyht1o8UJLFec6L+a4dcnXplTkyb1aLqIVSDQVLCGjD4VuMOo+V/AAcoHDjqpeTQ4jqNfi6IOCvBLXrJshaFZQ3MSE/aBp72Y9aDc9lpkwF3cOX3UjAXuPVXt4HwGr1qU9nFVTDmDWAZfboXIbVNH0dtf2hGFZ3CTgUBV1Q3MkFEJ1/K3ndp/9HzIN3bzbEfFR/piD+OBUHk5APJOM6UdT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 05:38:54 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 05:38:54 +0000
Date: Fri, 24 Oct 2025 13:38:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [mm/page_alloc]  70a0ba8eec:
 netperf.Throughput_Mbps 157.8% improvement
Message-ID: <202510241319.250f4fef-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PUZP153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a83f01-3a79-41fc-aadf-08de12bf9ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gyrVbqWB7IULz4w47ZekZb1opf+W+q+0KjmIJYVgDHT2kNzHVaJ6oX8QSX?=
 =?iso-8859-1?Q?gOZszzYgvCgrBvCzWzUt0bLXV7tnja/9ibNFmJ1AaqpuROMeV6Hon1daHg?=
 =?iso-8859-1?Q?W7enOodhxGtZEtx58CtGl0rQWi61YwvyoGXLYeVYBCN8Q2znxTkp/2w9yf?=
 =?iso-8859-1?Q?1XV0BFeWztSkT9/sqjhaO1itSF75roJIonIhuloShTagQFaRKfhSUp3Sf7?=
 =?iso-8859-1?Q?jUnb/0adT+Oc1UqrfucfyBrnFMAkqADa0xrU/nH2R/NVWt2msVnTwBhZMF?=
 =?iso-8859-1?Q?sMccm/Xq5m5mgIvkcV8rNrEaVw25XbOB95mwwq14oI2KDeyiAaPo+X0eUq?=
 =?iso-8859-1?Q?KWLlYFu42OD7RxKZD68UScpjATuRxiTtuay2OEXpazwTAQMgl4UyEvqoLp?=
 =?iso-8859-1?Q?uu3LV374OJiPmfNZswgEt7ZUYQpERWBuM5lQu1Qj0tAC09LEpvWLZ46Ly7?=
 =?iso-8859-1?Q?85zOGB49Okhu0ZFMi47CYuJQnU0NTh18CEN0JR8WpR6Hpa2x0R0cfpgWr5?=
 =?iso-8859-1?Q?8fCp0R+gwkujuUBito7KJet8pHjWt7hVspriqwbSa5MvZhvwiL2SjnkGAv?=
 =?iso-8859-1?Q?8nXFIbCYfb56uVL+4TlDpxcapzTxu4TIF1R4+f9exoVGS6UWbNrF1dC0km?=
 =?iso-8859-1?Q?Mjt2wNZgcHI1KeUZ8hLQ8dKyp+DFbS4Bb9LkfOP28GyLSS19jEEd3QKCTY?=
 =?iso-8859-1?Q?Sx0T2xIc5FlQwLMMLmtru/dthYEf2uo/RDyptwgd8wRzfdC7KTgwPOz/Yl?=
 =?iso-8859-1?Q?wnamRWhi6scAP0zDBE8rPjIPr1Jsxl8Ki2ac6FfTEA5DKDdQpvza7nNJa+?=
 =?iso-8859-1?Q?3LRxjeYAV4uTMQu3kqN45YC6YZnSdVU7rkLDdg9EOXze9l6WhV11oQeT38?=
 =?iso-8859-1?Q?ilPWe9nt08t/bzFD9STgFUK+qfc3fOflH8pQJ9QxS+CZ92B69vYZZyHi9s?=
 =?iso-8859-1?Q?v7+bOOEO5qiyFSwlcrR3Ck/w/nH0kc/puQFe5xPGmQzZijDLXufVxv9QsU?=
 =?iso-8859-1?Q?06jByn7Vqs6OgV3gdeqwUzi41eqBrRws5AWrlVVSnGZPzlqMPP/0w/A/JS?=
 =?iso-8859-1?Q?VLbvBeyv1KRMzWQ0arYofD9Ns50bq7WVWsEBn5FurZKn3nobcsP6vSlZYF?=
 =?iso-8859-1?Q?c3HPQte4WpCKYkyJh3VOGepxfwB28MBrB2mFpjn7ekNYyFtdLn4RP9mcGU?=
 =?iso-8859-1?Q?VhhEGsxMv10MFgUGgoFIaU0VTBJHznFE0dSEBkPIdpIfzLfsy013dlFQ/7?=
 =?iso-8859-1?Q?nFjD8jLAjCY1eFqVAhZGX0c1mVLcudStqtxeovD+BTSAUa0tWrBjtMaLNE?=
 =?iso-8859-1?Q?5QgU3wPMR8iQQZTyt9eK1x7ieZnBZQwsOkTR0V80MY+YT3N9Sf9NxV1sge?=
 =?iso-8859-1?Q?BJtP/6oaVQ/CZqNMGH0XtW9icLqvV/NmCxC53vikbPHHT0gefWIeRC72L7?=
 =?iso-8859-1?Q?QqhIetFStQi2dVEZgqpj14Sfp7NthTwCrRbTvgpovE/6Y/YKfAPFTqlpXp?=
 =?iso-8859-1?Q?dDvUxbWAyg8Eo6aSjkVer4r5jVWTQ5Kcnfatm4wviaRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZxKpepueSizD5GdmTnxiwbhChungEsb54N0F4iiUSCaUsCNpNihLfsr6ae?=
 =?iso-8859-1?Q?wkblrnnli87VIndv6nPl4TELbIqnJMhlWAqGuZU7BxX/2e9CB2N1DPcODB?=
 =?iso-8859-1?Q?QE0ZsMv9dCwcdK/RMB+fbaOtxQXaVsMRnAbcpkQz7SByYx4/zqaGfN8vpD?=
 =?iso-8859-1?Q?snYGnt33RdrfpB2in06ekyoWe9a2lQxSLTZXfQ/wPiuOh1IFe/QJIe1qs+?=
 =?iso-8859-1?Q?8z2YbwCWj47lUk3W+RYAVp+PslOPX/zK4kCqm/wbCWlLSq0rgpjjdY8S8O?=
 =?iso-8859-1?Q?RZvqseseHPbZoS6AWtq9hQR8ZWvHjlNEqQaNoUZJFHTdI1p78FMHKbfp+z?=
 =?iso-8859-1?Q?ToCJbILfDnjZ/aP6sLQL3KHFIAW6EEj9MuygEo7sfEoSbVOm/dgt13LtLL?=
 =?iso-8859-1?Q?qShZZ6QHq+KapHvBClF8Y8ePXlH9G+4Y+U8t6X9MCW3xoIe38p+uRAzfuy?=
 =?iso-8859-1?Q?ZPO2baQwr6dErZEAkN1PwwOxGjSIVgZEY3yM5IHSOfTvKyWSYeoNngZXb1?=
 =?iso-8859-1?Q?wq7LYuvkRJ1gx1t9gTKG7ceeG9W43K9mzb696OkCUckogbckwtP/8UoVoC?=
 =?iso-8859-1?Q?l7Q8sYbR50rQcJNjrH3Poc6ONMlR84GDuqEEy0vRrx5appzd/gaJeke0qZ?=
 =?iso-8859-1?Q?nUkj2zgkR+MKOEcXIgi859CtkhEsbOL2jAYZ4uUclfe/lz3gxNUcCQzM87?=
 =?iso-8859-1?Q?AQQTziROXGjeNkib8JhX7vUsb++Q2I1sFaL6ZZ5Uu/FYPicVHwNBFNpccl?=
 =?iso-8859-1?Q?aqgYTmqRABU1ala1cViJOsXMnPwvJBEEE0x07Dr8c/nFrgEF+BZFBu6Tsr?=
 =?iso-8859-1?Q?3g4rvRhVhcx4R8kDhsiNBZhiO7SCQ3pWcqbJJ/nGeJPEBfdLnA/nus3e8i?=
 =?iso-8859-1?Q?CkaiQvWIeKR4M319Cedh2AfsNv9Dlisi+r87/UCDaHsXT4P8I9HXBhGiZv?=
 =?iso-8859-1?Q?SJO8zJiEKtPK0fgoPh0sRhj7dsQO8Rk+AKgMZLzXz4BCmpa5M1gu3YcwFJ?=
 =?iso-8859-1?Q?4p0U6ifQyInz6crTmqI+zpIObLYMToPBB96hV8myqIXl+0MPS6Tnaa7bOg?=
 =?iso-8859-1?Q?yirhyCpF20g8j4bnXjiN14EbF9W/4axOUI/Gya63oJeXMqmA85Ddcz9wgH?=
 =?iso-8859-1?Q?BDgWCGEyvwHea4oOzewy32vkOQmy52Wy/MNv45rNStRXV7VJQa1YF2p9RC?=
 =?iso-8859-1?Q?ahO44/qKspQhhItRV/2VIyRJ6e/T9d3PcJyoHxFKZ13jKjMJce5yIex+Ie?=
 =?iso-8859-1?Q?QKUgrL8eWlLz3Tw/B10lWZoX6dROIIaEgSkZorMWOrRqyLNAfzjjrS1FSs?=
 =?iso-8859-1?Q?TxVyRVahWQFhCJAyOqyeb2UX0CXSrTfDp5Ut2ZzM0g/Gmip/H6SV1lLgsK?=
 =?iso-8859-1?Q?YRQNyPCMX+qc2e9AxVdvnRCrIiWX4vRYuRirxs0zzdRjshlatrVjOaZIFR?=
 =?iso-8859-1?Q?TCM+9sAcjmnleDtCAnu7PiJ0C76sIJr0tQXtCWBzm/sKPRSQKU8tG7uTm2?=
 =?iso-8859-1?Q?UXP/YqvYbJYwAjryf44QYR34B0GzMA12UQBld+pX8MM5WKUuOCGaiPXe7d?=
 =?iso-8859-1?Q?k0igrLZLWYLFEefcXoWGVV2HQXuBempqsxwcUJyEQvFBrxvBRPYizaWjS1?=
 =?iso-8859-1?Q?soXW+I2V7kVkX4um2zPgDp3zSi5op1hYjFKjuVtD7T+WWJHRUUp/5oQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a83f01-3a79-41fc-aadf-08de12bf9ec0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 05:38:54.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1mRjib58gJeOoNVYYWYWdqjfxuI4yang2Ks0FMlxQERChyHdBYuHhlvo+VYh1pQbPBGMsrDGn59xXIxup43uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 157.8% improvement of netperf.Throughput_Mbps on:


commit: 70a0ba8eec7fecbbdf4d0aab45233a10ec83ab31 ("mm/page_alloc: limit number of high-order pages on PCP during bulk free")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	test: UDP_STREAM
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241319.250f4fef-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/50%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp3/UDP_STREAM/netperf

commit: 
  55140b0d44 ("mm/page_alloc: free pages in a single pass during bulk free")
  70a0ba8eec ("mm/page_alloc: limit number of high-order pages on PCP during bulk free")

55140b0d4411f37e 70a0ba8eec7fecbbdf4d0aab452 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     86953           -21.7%      68097        uptime.idle
 2.148e+10 ±  3%     -88.9%  2.383e+09 ±  2%  cpuidle..time
 3.947e+08 ±  3%     -99.8%     927032 ±  8%  cpuidle..usage
    840.50 ± 13%     -72.2%     233.83 ± 13%  perf-c2c.DRAM.local
    132713           -73.1%      35759 ± 11%  perf-c2c.HITM.local
      2944 ±  2%     +92.3%       5663 ± 16%  perf-c2c.HITM.remote
    135657           -69.5%      41423 ±  8%  perf-c2c.HITM.total
     27.73 ±  2%     -24.8        2.90 ±  7%  mpstat.cpu.all.idle%
     15.95 ±  8%     -14.7        1.26 ±  4%  mpstat.cpu.all.soft%
     55.64           +39.9       95.49        mpstat.cpu.all.sys%
      0.68            -0.3        0.35 ±  5%  mpstat.cpu.all.usr%
    264.67 ±  6%     -51.6%     128.17 ± 60%  mpstat.max_utilization.seconds
     75.80           +31.5%      99.71        mpstat.max_utilization_pct
      2640           +32.0%       3484        turbostat.Avg_MHz
     73.34           +23.4       96.79        turbostat.Busy%
     27.42 ±  2%     -24.4        2.98 ±  2%  turbostat.C1%
      0.12 ±  4%     -14.3%       0.10        turbostat.IPC
 4.817e+08 ±  2%     -78.7%  1.025e+08        turbostat.IRQ
  11472272           +10.7%   12705147        turbostat.NMI
      0.02 ± 17%      -0.0        0.00        turbostat.POLL%
    645.37            -7.6%     596.50        turbostat.PkgWatt
     21473           +41.6%      30408 ±  2%  netperf.ThroughputBoth_Mbps
   2748559           +41.6%    3892308 ±  2%  netperf.ThroughputBoth_total_Mbps
     10543           -78.8%       2230 ±  4%  netperf.ThroughputRecv_Mbps
   1349560           -78.8%     285540 ±  4%  netperf.ThroughputRecv_total_Mbps
     10929 ±  3%    +157.8%      28177 ±  2%  netperf.Throughput_Mbps
   1398999 ±  3%    +157.8%    3606768 ±  2%  netperf.Throughput_total_Mbps
    114930 ± 19%  +19082.1%   22046105 ± 19%  netperf.time.involuntary_context_switches
     88.44 ±  3%     +81.4%     160.43 ±  3%  netperf.time.user_time
 1.573e+09           +41.6%  2.228e+09 ±  2%  netperf.workload
      0.75 ±  5%    +669.2%       5.78 ± 53%  perf-sched.total_wait_and_delay.average.ms
   3961911           -85.2%     587653 ± 65%  perf-sched.total_wait_and_delay.count.ms
      7677 ± 14%     -48.0%       3989 ± 13%  perf-sched.total_wait_and_delay.max.ms
      0.66 ±  4%    +763.7%       5.74 ± 52%  perf-sched.total_wait_time.average.ms
      4976           -24.1%       3776 ±  7%  perf-sched.total_wait_time.max.ms
      0.75 ±  5%    +669.2%       5.78 ± 53%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   3961911           -85.2%     587653 ± 65%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      7677 ± 14%     -48.0%       3989 ± 13%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.66 ±  4%    +763.7%       5.74 ± 52%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      4976           -24.1%       3776 ±  7%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   1013810 ±  2%     +72.7%    1751139 ± 12%  meminfo.Active
   1013235 ±  2%     +72.8%    1750563 ± 12%  meminfo.Active(anon)
    965784           -16.9%     802110        meminfo.AnonPages
   9128042           -40.8%    5407071 ±  4%  meminfo.Cached
   6772256           -57.5%    2880600 ±  8%  meminfo.Committed_AS
   5551502           -83.4%     919631 ±  3%  meminfo.Inactive
   5551354           -83.4%     919483 ±  3%  meminfo.Inactive(anon)
   3549531           -89.1%     386805 ± 12%  meminfo.Mapped
  13247319           -35.6%    8534127 ±  3%  meminfo.Memused
     22057           -29.8%      15491        meminfo.PageTables
   5602172           -66.4%    1881201 ± 12%  meminfo.Shmem
  13376418           -33.9%    8846841 ±  2%  meminfo.max_used_kB
    931.16 ± 23%   +4921.5%      46758 ±146%  numa-vmstat.node0.nr_active_anon
    124950           -72.8%      34006 ± 14%  numa-vmstat.node0.nr_mapped
      1449 ± 19%   +3512.1%      52351 ±144%  numa-vmstat.node0.nr_shmem
    931.16 ± 23%   +4921.4%      46757 ±146%  numa-vmstat.node0.nr_zone_active_anon
    252137 ±  2%     +55.1%     391082 ± 10%  numa-vmstat.node1.nr_active_anon
   1412738 ±  2%     -67.5%     458528 ± 14%  numa-vmstat.node1.nr_file_pages
   1234368 ±  4%     -89.9%     125143 ± 61%  numa-vmstat.node1.nr_inactive_anon
    764116           -91.8%      62578 ± 18%  numa-vmstat.node1.nr_mapped
      3359 ±  8%     -41.6%       1960 ± 14%  numa-vmstat.node1.nr_page_table_pages
   1399125           -70.1%     418018 ± 10%  numa-vmstat.node1.nr_shmem
    252137 ±  2%     +55.1%     391081 ± 10%  numa-vmstat.node1.nr_zone_active_anon
   1234367 ±  4%     -89.9%     125143 ± 61%  numa-vmstat.node1.nr_zone_inactive_anon
      4204 ± 23%   +4347.7%     186988 ±146%  numa-meminfo.node0.Active
      3724 ± 23%   +4913.0%     186700 ±146%  numa-meminfo.node0.Active(anon)
    498738           -72.7%     136034 ± 14%  numa-meminfo.node0.Mapped
      5798 ± 19%   +3511.2%     209412 ±144%  numa-meminfo.node0.Shmem
   1009339 ±  2%     +55.0%    1564631 ± 10%  numa-meminfo.node1.Active
   1009243 ±  2%     +55.0%    1564344 ± 10%  numa-meminfo.node1.Active(anon)
   5650898 ±  2%     -67.5%    1834433 ± 14%  numa-meminfo.node1.FilePages
   4936718 ±  4%     -89.9%     500899 ± 61%  numa-meminfo.node1.Inactive
   4936693 ±  4%     -89.9%     500825 ± 61%  numa-meminfo.node1.Inactive(anon)
   3053490           -91.7%     252553 ± 17%  numa-meminfo.node1.Mapped
   7486356 ±  4%     -55.7%    3316775 ± 16%  numa-meminfo.node1.MemUsed
     13431 ±  8%     -41.6%       7845 ± 14%  numa-meminfo.node1.PageTables
   5596446           -70.1%    1672391 ± 10%  numa-meminfo.node1.Shmem
    253460 ±  2%     +72.7%     437631 ± 12%  proc-vmstat.nr_active_anon
    241472           -16.9%     200542        proc-vmstat.nr_anon_pages
   6120877            +1.9%    6238602        proc-vmstat.nr_dirty_background_threshold
  12256721            +1.9%   12492458        proc-vmstat.nr_dirty_threshold
   2282483           -40.8%    1351838 ±  4%  proc-vmstat.nr_file_pages
  61581025            +1.9%   62759954        proc-vmstat.nr_free_pages
   1388160           -83.4%     229959 ±  3%  proc-vmstat.nr_inactive_anon
    889178           -89.0%      97383 ± 12%  proc-vmstat.nr_mapped
      5523           -29.9%       3872        proc-vmstat.nr_page_table_pages
   1401014           -66.4%     470370 ± 12%  proc-vmstat.nr_shmem
     49237            -3.8%      47374        proc-vmstat.nr_slab_reclaimable
    125948            -1.3%     124255        proc-vmstat.nr_slab_unreclaimable
    253460 ±  2%     +72.7%     437631 ± 12%  proc-vmstat.nr_zone_active_anon
   1388160           -83.4%     229959 ±  3%  proc-vmstat.nr_zone_inactive_anon
 1.576e+09           +40.2%   2.21e+09 ±  2%  proc-vmstat.numa_hit
 1.576e+09           +40.2%   2.21e+09 ±  2%  proc-vmstat.numa_local
    162736 ± 14%     +85.7%     302272 ± 18%  proc-vmstat.pgactivate
 1.573e+09           +40.4%  2.208e+09 ±  2%  proc-vmstat.pgalloc_normal
   1585512           -16.9%    1318078        proc-vmstat.pgfault
  1.57e+09           +40.6%  2.208e+09 ±  2%  proc-vmstat.pgfree
     38581           +16.9%      45092        proc-vmstat.pgreuse
      1.36 ±  4%     -20.2%       1.08 ± 14%  perf-stat.i.MPKI
 1.716e+10 ±  2%      +7.4%  1.843e+10 ±  2%  perf-stat.i.branch-instructions
      0.31            -0.2        0.09        perf-stat.i.branch-miss-rate%
  53096999           -72.6%   14544729 ±  2%  perf-stat.i.branch-misses
      1.83 ±  6%      +6.9        8.69 ± 22%  perf-stat.i.cache-miss-rate%
 6.645e+09           -81.8%  1.207e+09 ±  8%  perf-stat.i.cache-references
   2618496 ±  3%     -94.5%     143522 ± 18%  perf-stat.i.context-switches
      8.58 ±  2%     +14.4%       9.82 ±  2%  perf-stat.i.cpi
 6.869e+11           +30.1%  8.935e+11        perf-stat.i.cpu-cycles
     46520 ± 26%     -99.5%     255.07        perf-stat.i.cpu-migrations
      6419 ±  3%     +67.7%      10764 ± 16%  perf-stat.i.cycles-between-cache-misses
     8e+10 ±  2%     +12.5%  8.997e+10 ±  2%  perf-stat.i.instructions
      0.12 ±  2%      -9.8%       0.11 ±  2%  perf-stat.i.ipc
     10.23 ±  3%     -98.6%       0.14 ± 58%  perf-stat.i.metric.K/sec
      4878           -18.2%       3988        perf-stat.i.minor-faults
      4881           -18.2%       3991        perf-stat.i.page-faults
      1.34 ±  4%     -19.4%       1.08 ± 14%  perf-stat.overall.MPKI
      0.31            -0.2        0.08        perf-stat.overall.branch-miss-rate%
      1.61 ±  2%      +6.6        8.22 ± 22%  perf-stat.overall.cache-miss-rate%
      8.57 ±  2%     +15.7%       9.91 ±  2%  perf-stat.overall.cpi
      6420 ±  3%     +46.8%       9428 ± 16%  perf-stat.overall.cycles-between-cache-misses
      0.12 ±  2%     -13.6%       0.10 ±  2%  perf-stat.overall.ipc
     15502           -20.0%      12401        perf-stat.overall.path-length
 1.717e+10 ±  2%      +7.6%  1.848e+10 ±  2%  perf-stat.ps.branch-instructions
  53004191           -72.4%   14638673 ±  2%  perf-stat.ps.branch-misses
 6.631e+09           -81.9%  1.203e+09 ±  8%  perf-stat.ps.cache-references
   2614035 ±  3%     -94.4%     146411 ± 18%  perf-stat.ps.context-switches
 6.853e+11           +30.4%  8.935e+11        perf-stat.ps.cpu-cycles
     46475 ± 25%     -99.5%     247.55        perf-stat.ps.cpu-migrations
 8.003e+10           +12.7%  9.022e+10 ±  2%  perf-stat.ps.instructions
      4755           -18.9%       3859        perf-stat.ps.minor-faults
      4758           -18.8%       3862        perf-stat.ps.page-faults
 2.439e+13           +13.3%  2.763e+13 ±  2%  perf-stat.total.instructions
    228146 ± 27%     -96.7%       7597 ±141%  sched_debug.cfs_rq:/.MIN_vruntime.avg
  22331084 ± 10%     -91.3%    1944137 ±141%  sched_debug.cfs_rq:/.MIN_vruntime.max
   2069150 ± 17%     -94.1%     121288 ±141%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.62           +34.6%       0.84        sched_debug.cfs_rq:/.h_nr_running.avg
      0.40           -79.2%       0.08 ±  9%  sched_debug.cfs_rq:/.h_nr_running.stddev
    228146 ± 27%     -96.7%       7597 ±141%  sched_debug.cfs_rq:/.max_vruntime.avg
  22331084 ± 10%     -91.3%    1944137 ±141%  sched_debug.cfs_rq:/.max_vruntime.max
   2069150 ± 17%     -94.1%     121288 ±141%  sched_debug.cfs_rq:/.max_vruntime.stddev
  21297524 ±  7%     +83.4%   39059246        sched_debug.cfs_rq:/.min_vruntime.avg
  29255285 ±  7%     +35.0%   39484619        sched_debug.cfs_rq:/.min_vruntime.max
  12149520 ±  8%     +90.3%   23117001 ± 11%  sched_debug.cfs_rq:/.min_vruntime.min
   3965031 ± 13%     -60.4%    1568773 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.62           +34.7%       0.84        sched_debug.cfs_rq:/.nr_running.avg
      0.40           -82.8%       0.07 ±  9%  sched_debug.cfs_rq:/.nr_running.stddev
    642.64           +35.1%     868.05        sched_debug.cfs_rq:/.runnable_avg.avg
     12.72 ±196%   +1646.5%     222.19 ± 33%  sched_debug.cfs_rq:/.runnable_avg.min
    272.63           -72.3%      75.64 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
   1510202 ± 86%    -109.2%    -139483        sched_debug.cfs_rq:/.spread0.avg
   9468217 ± 17%     -96.9%     288852 ±192%  sched_debug.cfs_rq:/.spread0.max
  -7640223          +110.5%  -16085770        sched_debug.cfs_rq:/.spread0.min
   3965570 ± 13%     -60.4%    1568865 ± 11%  sched_debug.cfs_rq:/.spread0.stddev
    641.82           +34.9%     865.99        sched_debug.cfs_rq:/.util_avg.avg
      1107 ±  5%      -9.7%     999.89        sched_debug.cfs_rq:/.util_avg.max
     11.22 ±215%   +1672.3%     198.89 ± 33%  sched_debug.cfs_rq:/.util_avg.min
    271.63           -72.1%      75.66 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
    282.84 ±  2%     +83.2%     518.08 ±  3%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    196.82           +10.1%     216.79 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    538212           +42.0%     764052 ±  2%  sched_debug.cpu.avg_idle.avg
    424676           -32.0%     288955 ±  3%  sched_debug.cpu.avg_idle.stddev
      6049           +36.3%       8247        sched_debug.cpu.curr->pid.avg
      3855           -80.9%     736.09 ±  5%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 49%    +117.2%       0.00 ± 50%  sched_debug.cpu.next_balance.stddev
      0.62           +35.0%       0.84        sched_debug.cpu.nr_running.avg
      0.41           -78.0%       0.09 ±  9%  sched_debug.cpu.nr_running.stddev
   1506613 ± 10%     -94.2%      88111 ± 18%  sched_debug.cpu.nr_switches.avg
    726658 ± 14%     -52.6%     344629 ± 24%  sched_debug.cpu.nr_switches.stddev
     46.92 ±  4%     -33.6       13.30 ±  2%  perf-profile.calltrace.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.__sock_sendmsg.__sys_sendto
     40.10 ±  4%     -32.5        7.55        perf-profile.calltrace.cycles-pp.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg.__sock_sendmsg
     40.08 ±  4%     -32.5        7.53        perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg
     39.59 ±  4%     -32.3        7.31        perf-profile.calltrace.cycles-pp.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb
     39.52 ±  4%     -32.3        7.26        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data
     39.09 ±  4%     -32.1        6.98        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill
     38.76 ±  4%     -32.1        6.70        perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill
     38.32 ±  5%     -31.7        6.64        perf-profile.calltrace.cycles-pp._raw_spin_lock.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
     38.23 ±  5%     -31.6        6.63        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.rmqueue.get_page_from_freelist
     18.60 ±  7%     -18.6        0.00        perf-profile.calltrace.cycles-pp.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu
     18.72 ±  7%     -17.8        0.92 ±  6%  perf-profile.calltrace.cycles-pp.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
     18.70 ±  7%     -17.8        0.90 ±  6%  perf-profile.calltrace.cycles-pp.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
     18.78 ±  7%     -17.8        1.03 ±  5%  perf-profile.calltrace.cycles-pp.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
     18.80 ±  7%     -17.8        1.04 ±  6%  perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
     18.80 ±  7%     -17.8        1.05 ±  6%  perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     18.87 ±  7%     -17.7        1.16 ±  5%  perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start
     18.91 ±  7%     -17.7        1.23 ±  5%  perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq
     18.92 ±  7%     -17.7        1.24 ±  5%  perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable_ip
     18.93 ±  7%     -17.7        1.27 ±  5%  perf-profile.calltrace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_output2
     18.95 ±  7%     -17.6        1.30 ±  5%  perf-profile.calltrace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_send_skb
     18.97 ±  7%     -17.6        1.32 ±  5%  perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg
     18.97 ±  7%     -17.6        1.32 ±  5%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_send_skb.udp_send_skb
     66.78           -17.4       49.36        perf-profile.calltrace.cycles-pp.udp_sendmsg.__sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     66.80           -17.4       49.40        perf-profile.calltrace.cycles-pp.__sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.14 ±  7%     -17.4        1.78 ±  7%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg.__sock_sendmsg
     66.91           -17.3       49.58        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
     66.91           -17.3       49.59        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream
     66.95           -17.3       49.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream.main
     66.93           -17.3       49.66        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream.main
     67.06           -17.2       49.84        perf-profile.calltrace.cycles-pp.send_omni_inner.send_udp_stream.main
     67.06           -17.2       49.84        perf-profile.calltrace.cycles-pp.send_udp_stream.main
     19.20 ±  7%     -17.1        2.05 ±  8%  perf-profile.calltrace.cycles-pp.ip_send_skb.udp_send_skb.udp_sendmsg.__sock_sendmsg.__sys_sendto
     19.22 ±  7%     -17.0        2.19 ± 10%  perf-profile.calltrace.cycles-pp.udp_send_skb.udp_sendmsg.__sock_sendmsg.__sys_sendto.__x64_sys_sendto
     14.66 ±  7%     -14.7        0.00        perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv
     14.29 ±  7%     -14.3        0.00        perf-profile.calltrace.cycles-pp.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb
     13.68 ±  7%     -13.7        0.00        perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb
     11.15 ±  8%     -11.1        0.00        perf-profile.calltrace.cycles-pp.__skb_recv_udp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      8.46 ±  9%      -8.5        0.00        perf-profile.calltrace.cycles-pp.udp_rmem_release.__skb_recv_udp.udp_recvmsg.inet_recvmsg.__sys_recvfrom
      8.22 ±  7%      -8.2        0.00        perf-profile.calltrace.cycles-pp.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__udp_enqueue_schedule_skb
      7.52 ±  7%      -7.5        0.00        perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.udp_rmem_release.__skb_recv_udp.udp_recvmsg.inet_recvmsg
      6.82 ±  8%      -6.8        0.00        perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.udp_rmem_release.__skb_recv_udp.udp_recvmsg
      6.74 ±  8%      -6.7        0.00        perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.udp_rmem_release.__skb_recv_udp
      6.68 ±  8%      -6.7        0.00        perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.udp_rmem_release
      7.52            -6.4        1.14 ±  6%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      7.51            -6.4        1.14 ±  6%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.__sys_recvfrom
      6.80            -5.8        1.05 ±  6%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg
      6.70            -5.7        1.03 ±  6%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg
      5.59 ±  2%      -0.7        4.94 ±  4%  perf-profile.calltrace.cycles-pp._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg
      5.37 ±  2%      -0.6        4.73 ±  4%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb
      5.69            -0.6        5.08 ±  4%  perf-profile.calltrace.cycles-pp.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg.__sock_sendmsg
     96.28            +3.3       99.62        perf-profile.calltrace.cycles-pp.main
     28.41 ±  2%     +21.4       49.78        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     28.41 ±  2%     +21.4       49.78        perf-profile.calltrace.cycles-pp.accept_connections.main
     28.41 ±  2%     +21.4       49.78        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     28.41 ±  2%     +21.4       49.78        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     28.41 ±  2%     +21.4       49.78        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     28.14 ±  2%     +21.6       49.76        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child.accept_connection
     28.12 ±  2%     +21.6       49.76        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child
     27.97 ±  2%     +21.8       49.74        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
     27.96 ±  2%     +21.8       49.74        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
     27.71 ±  2%     +22.0       49.71        perf-profile.calltrace.cycles-pp.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     27.70 ±  2%     +22.0       49.71        perf-profile.calltrace.cycles-pp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
      0.00           +33.2       33.16        perf-profile.calltrace.cycles-pp.ip_idents_reserve.__ip_select_ident.__ip_make_skb.ip_make_skb.udp_sendmsg
      0.00           +33.4       33.36        perf-profile.calltrace.cycles-pp.__ip_select_ident.__ip_make_skb.ip_make_skb.udp_sendmsg.__sock_sendmsg
      0.00           +33.5       33.46        perf-profile.calltrace.cycles-pp.__ip_make_skb.ip_make_skb.udp_sendmsg.__sock_sendmsg.__sys_sendto
      8.89 ±  4%     +39.4       48.33        perf-profile.calltrace.cycles-pp.skb_release_data.__consume_stateless_skb.udp_recvmsg.inet_recvmsg.__sys_recvfrom
      8.89 ±  4%     +39.4       48.33        perf-profile.calltrace.cycles-pp.__consume_stateless_skb.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      8.44 ±  4%     +39.5       47.99        perf-profile.calltrace.cycles-pp.free_unref_page.skb_release_data.__consume_stateless_skb.udp_recvmsg.inet_recvmsg
      7.98 ±  5%     +39.9       47.86        perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page.skb_release_data.__consume_stateless_skb.udp_recvmsg
      7.64 ±  5%     +40.1       47.71        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.free_unref_page.skb_release_data
      7.65 ±  5%     +40.1       47.79        perf-profile.calltrace.cycles-pp._raw_spin_lock.free_pcppages_bulk.free_unref_page.skb_release_data.__consume_stateless_skb
     46.92 ±  4%     -33.6       13.31 ±  2%  perf-profile.children.cycles-pp.__ip_append_data
     40.10 ±  4%     -32.5        7.55        perf-profile.children.cycles-pp.sk_page_frag_refill
     40.08 ±  4%     -32.5        7.54        perf-profile.children.cycles-pp.skb_page_frag_refill
     39.63 ±  4%     -32.3        7.37        perf-profile.children.cycles-pp.__alloc_pages
     39.56 ±  4%     -32.2        7.32        perf-profile.children.cycles-pp.get_page_from_freelist
     39.14 ±  4%     -32.1        7.03        perf-profile.children.cycles-pp.rmqueue
     38.79 ±  4%     -32.0        6.75        perf-profile.children.cycles-pp.rmqueue_bulk
     18.61 ±  7%     -18.4        0.17 ±  9%  perf-profile.children.cycles-pp.__udp_enqueue_schedule_skb
     18.72 ±  7%     -17.8        0.92 ±  6%  perf-profile.children.cycles-pp.udp_unicast_rcv_skb
     18.70 ±  7%     -17.8        0.91 ±  6%  perf-profile.children.cycles-pp.udp_queue_rcv_one_skb
     18.79 ±  7%     -17.8        1.03 ±  6%  perf-profile.children.cycles-pp.__udp4_lib_rcv
     18.80 ±  7%     -17.8        1.05 ±  5%  perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
     18.80 ±  7%     -17.8        1.05 ±  6%  perf-profile.children.cycles-pp.ip_local_deliver_finish
     19.03 ±  7%     -17.7        1.31 ±  5%  perf-profile.children.cycles-pp.__softirqentry_text_start
     18.87 ±  7%     -17.7        1.16 ±  5%  perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     18.92 ±  7%     -17.7        1.24 ±  5%  perf-profile.children.cycles-pp.__napi_poll
     18.92 ±  7%     -17.7        1.24 ±  5%  perf-profile.children.cycles-pp.process_backlog
     18.93 ±  7%     -17.7        1.27 ±  5%  perf-profile.children.cycles-pp.net_rx_action
     18.98 ±  7%     -17.6        1.33 ±  5%  perf-profile.children.cycles-pp.__local_bh_enable_ip
     18.97 ±  7%     -17.6        1.32 ±  5%  perf-profile.children.cycles-pp.do_softirq
     66.79           -17.4       49.37        perf-profile.children.cycles-pp.udp_sendmsg
     66.80           -17.4       49.40        perf-profile.children.cycles-pp.__sock_sendmsg
     19.14 ±  7%     -17.4        1.78 ±  7%  perf-profile.children.cycles-pp.ip_finish_output2
     66.91           -17.3       49.59        perf-profile.children.cycles-pp.__sys_sendto
     66.91           -17.3       49.59        perf-profile.children.cycles-pp.__x64_sys_sendto
     67.06           -17.2       49.84        perf-profile.children.cycles-pp.send_omni_inner
     67.06           -17.2       49.84        perf-profile.children.cycles-pp.send_udp_stream
     19.20 ±  7%     -17.1        2.05 ±  8%  perf-profile.children.cycles-pp.ip_send_skb
     19.22 ±  7%     -17.0        2.20 ± 10%  perf-profile.children.cycles-pp.udp_send_skb
     14.66 ±  7%     -14.6        0.10 ± 10%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
     14.30 ±  7%     -14.2        0.07 ± 10%  perf-profile.children.cycles-pp.mem_cgroup_charge_skmem
     13.70 ±  7%     -13.7        0.04 ± 45%  perf-profile.children.cycles-pp.try_charge_memcg
     11.15 ±  8%     -11.0        0.20 ± 21%  perf-profile.children.cycles-pp.__skb_recv_udp
      8.46 ±  9%      -8.4        0.10 ±  7%  perf-profile.children.cycles-pp.udp_rmem_release
      8.24 ±  7%      -8.2        0.00        perf-profile.children.cycles-pp.page_counter_try_charge
      7.52 ±  7%      -7.4        0.09 ±  5%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      6.82 ±  8%      -6.8        0.04 ± 45%  perf-profile.children.cycles-pp.refill_stock
      6.74 ±  8%      -6.7        0.01 ±223%  perf-profile.children.cycles-pp.drain_stock
      6.68 ±  8%      -6.7        0.00        perf-profile.children.cycles-pp.page_counter_uncharge
      7.52            -6.4        1.14 ±  6%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      7.51            -6.4        1.14 ±  6%  perf-profile.children.cycles-pp.__skb_datagram_iter
     12.24            -6.3        5.92 ±  4%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      6.81            -5.8        1.05 ±  6%  perf-profile.children.cycles-pp._copy_to_iter
      1.12 ±  7%      -1.1        0.04 ± 44%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.88            -0.8        0.09 ± 61%  perf-profile.children.cycles-pp.__schedule
      0.82            -0.8        0.05 ±102%  perf-profile.children.cycles-pp.__skb_wait_for_more_packets
      0.88 ±  4%      -0.7        0.13 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.82 ±  4%      -0.7        0.13 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.81 ±  4%      -0.7        0.12 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.76 ±  4%      -0.7        0.09        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.75 ±  4%      -0.7        0.09 ±  4%  perf-profile.children.cycles-pp.tick_sched_timer
      5.60 ±  2%      -0.7        4.94 ±  4%  perf-profile.children.cycles-pp._copy_from_iter
      0.71            -0.7        0.05 ±102%  perf-profile.children.cycles-pp.schedule_timeout
      0.73 ±  4%      -0.7        0.08        perf-profile.children.cycles-pp.tick_sched_handle
      0.73 ±  4%      -0.7        0.08        perf-profile.children.cycles-pp.update_process_times
      0.97 ±  4%      -0.6        0.34 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      5.70 ±  2%      -0.6        5.09 ±  4%  perf-profile.children.cycles-pp.ip_generic_getfrag
      0.66            -0.6        0.09 ± 61%  perf-profile.children.cycles-pp.schedule
      0.54            -0.5        0.06 ± 11%  perf-profile.children.cycles-pp.simple_copy_to_iter
      0.81 ±  4%      -0.5        0.32 ± 10%  perf-profile.children.cycles-pp.handle_internal_command
      0.81 ±  4%      -0.5        0.32 ± 10%  perf-profile.children.cycles-pp.run_builtin
      0.80 ±  4%      -0.5        0.32 ± 10%  perf-profile.children.cycles-pp.cmd_record
      0.63            -0.4        0.20 ±  3%  perf-profile.children.cycles-pp.__check_object_size
      0.28            -0.2        0.05        perf-profile.children.cycles-pp.__free_one_page
      0.28 ±  4%      -0.1        0.14 ± 12%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.38            -0.1        0.25 ±  5%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.12 ±  3%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.__ksize
      0.19 ±  2%      -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.free_pcp_prepare
      0.15 ±  2%      -0.1        0.06 ± 49%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.13            -0.1        0.04 ± 74%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.26            -0.1        0.20 ±  6%  perf-profile.children.cycles-pp.__alloc_skb
      0.27            -0.1        0.20 ±  6%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.12            -0.1        0.06        perf-profile.children.cycles-pp.__slab_free
      0.12 ±  6%      -0.1        0.06        perf-profile.children.cycles-pp.scheduler_tick
      0.12 ±  3%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.sockfd_lookup_light
      0.11 ±  3%      -0.0        0.06        perf-profile.children.cycles-pp.__fget_light
      0.18            -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.kfree
      0.09            -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__udp4_lib_lookup
      0.18 ± 11%      +0.0        0.22 ±  9%  perf-profile.children.cycles-pp.generic_perform_write
      0.18 ± 12%      +0.0        0.22 ±  9%  perf-profile.children.cycles-pp.generic_file_write_iter
      0.19 ± 12%      +0.0        0.23 ± 10%  perf-profile.children.cycles-pp.vfs_write
      0.20 ± 11%      +0.0        0.24 ± 10%  perf-profile.children.cycles-pp.ksys_write
      0.06 ±  6%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      0.05 ±  7%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.move_addr_to_kernel
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__mkroute_output
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.ip_finish_output
      0.21 ± 15%      +0.1        0.26 ± 11%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.sk_filter_trim_cap
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.enqueue_to_backlog
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.ip_rcv
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.netif_rx_internal
      0.11 ±  6%      +0.1        0.17 ±  5%  perf-profile.children.cycles-pp.fib_table_lookup
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.netif_rx
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp._copy_from_user
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.__cgroup_bpf_run_filter_skb
      0.12 ±  4%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.ip_route_output_key_hash_rcu
      0.17 ±  4%      +0.1        0.28 ±  5%  perf-profile.children.cycles-pp.ip_route_output_flow
      0.00            +0.1        0.12 ± 28%  perf-profile.children.cycles-pp.udp4_hwcsum
      0.18 ±  4%      +0.1        0.33 ± 13%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.00            +0.1        0.15 ± 29%  perf-profile.children.cycles-pp.ip_send_check
      0.00            +0.2        0.17 ± 25%  perf-profile.children.cycles-pp.__ip_local_out
      0.09 ±  8%      +0.2        0.28 ± 22%  perf-profile.children.cycles-pp.loopback_xmit
      0.00            +0.2        0.20 ± 30%  perf-profile.children.cycles-pp.sock_wfree
      0.09 ±  4%      +0.2        0.30 ± 22%  perf-profile.children.cycles-pp.xmit_one
      0.10 ±  6%      +0.2        0.30 ± 20%  perf-profile.children.cycles-pp.dev_hard_start_xmit
      0.14 ±  2%      +0.3        0.40 ± 16%  perf-profile.children.cycles-pp.__dev_queue_xmit
      0.00            +0.6        0.55 ±  8%  perf-profile.children.cycles-pp.kfree_skb_reason
     51.74 ±  3%      +2.9       54.59        perf-profile.children.cycles-pp._raw_spin_lock
     51.51 ±  3%      +2.9       54.39        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     96.28            +3.7       99.95        perf-profile.children.cycles-pp.main
     95.33            +4.4       99.71        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     95.30            +4.4       99.70        perf-profile.children.cycles-pp.do_syscall_64
     28.41 ±  2%     +21.4       49.78        perf-profile.children.cycles-pp.accept_connection
     28.41 ±  2%     +21.4       49.78        perf-profile.children.cycles-pp.accept_connections
     28.41 ±  2%     +21.4       49.78        perf-profile.children.cycles-pp.process_requests
     28.41 ±  2%     +21.4       49.78        perf-profile.children.cycles-pp.recv_omni
     28.41 ±  2%     +21.4       49.78        perf-profile.children.cycles-pp.spawn_child
     27.98 ±  2%     +21.8       49.76        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     27.97 ±  2%     +21.8       49.76        perf-profile.children.cycles-pp.__sys_recvfrom
     27.71 ±  2%     +22.0       49.72        perf-profile.children.cycles-pp.inet_recvmsg
     27.70 ±  2%     +22.0       49.72        perf-profile.children.cycles-pp.udp_recvmsg
      0.36 ±  6%     +33.0       33.32        perf-profile.children.cycles-pp.ip_idents_reserve
      0.38 ±  5%     +33.0       33.37        perf-profile.children.cycles-pp.__ip_select_ident
      0.42 ±  5%     +33.0       33.46        perf-profile.children.cycles-pp.__ip_make_skb
      8.89 ±  4%     +39.4       48.33        perf-profile.children.cycles-pp.__consume_stateless_skb
      8.00 ±  5%     +39.9       47.86        perf-profile.children.cycles-pp.free_pcppages_bulk
      8.45 ±  4%     +40.0       48.42        perf-profile.children.cycles-pp.free_unref_page
      8.90 ±  4%     +40.0       48.88        perf-profile.children.cycles-pp.skb_release_data
      7.36 ±  6%      -7.4        0.00        perf-profile.self.cycles-pp.page_counter_try_charge
     12.06            -6.2        5.91 ±  4%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      5.58 ±  6%      -5.6        0.00        perf-profile.self.cycles-pp.page_counter_uncharge
      5.39 ±  7%      -5.4        0.00        perf-profile.self.cycles-pp.try_charge_memcg
      1.10 ±  7%      -1.1        0.04 ± 44%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.50            -0.4        0.11 ±  4%  perf-profile.self.cycles-pp.__check_object_size
      0.38 ±  2%      -0.3        0.05 ±  8%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.74 ±  2%      -0.3        0.42 ±  6%  perf-profile.self.cycles-pp.__ip_append_data
      0.47 ±  2%      -0.3        0.20 ±  8%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.28 ±  3%      -0.1        0.14 ± 11%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.19 ±  3%      -0.1        0.10 ±  3%  perf-profile.self.cycles-pp.free_pcp_prepare
      0.12            -0.1        0.06        perf-profile.self.cycles-pp.__slab_free
      0.10            -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.__fget_light
      0.22            -0.0        0.20 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock
      0.06 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.__alloc_pages
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__cgroup_bpf_run_filter_skb
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.kfree
      0.23 ±  5%      +0.1        0.29 ±  4%  perf-profile.self.cycles-pp.skb_release_data
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.free_unref_page
      0.09 ±  6%      +0.1        0.15 ±  5%  perf-profile.self.cycles-pp.fib_table_lookup
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.send_omni_inner
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.udp_sendmsg
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__ip_make_skb
      0.00            +0.1        0.12 ± 29%  perf-profile.self.cycles-pp.udp4_hwcsum
      0.18 ±  4%      +0.1        0.33 ± 13%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.00            +0.1        0.15 ± 28%  perf-profile.self.cycles-pp.ip_send_check
      0.00            +0.2        0.18 ± 34%  perf-profile.self.cycles-pp.sock_wfree
     51.44 ±  3%      +2.9       54.39        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.35 ±  5%     +32.9       33.27        perf-profile.self.cycles-pp.ip_idents_reserve




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


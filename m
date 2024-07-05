Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69626ECF
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jul 2024 02:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145375; cv=fail; b=DFcL24ad32ElENBUAIwqGQgm+QeYv9uQMUpHSKY3dMWYoXToMc94IcJ/VtUcCku5g/7zmOkgV5akzob0w28wwIRsTD1faFhT8Zl3visDvNXjsey1Qp5otCaVriAClkgYDn28zbJ1qxI0BbX3UKqOtZ8eYNG2Qb78Bm4MnXCIpC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145375; c=relaxed/simple;
	bh=H+x9D7+ajR+V4g8EGA5umn5dsS3ytPaje66OYkgIAu4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bNTINVSzLJhxFdY75C6f03hGeQKjxUKLKSinweqer6L7KHMaI5R8nWZ+nWfvFQJuS0FyH7m9weCVjYYihb98dCr/wCAOYU270kC0+8tVJK85o12s9meZ/ClUKN5xXaEKJkYEZJO8z+/cxl5sgGbgm+7qLIyMiXbMTwwMUu7MEro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpBo2QO4; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpBo2QO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720145373; x=1751681373;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H+x9D7+ajR+V4g8EGA5umn5dsS3ytPaje66OYkgIAu4=;
  b=FpBo2QO4T4agABzhssHTZxpjHjJAcbiZ1VMsEoj3D/ZHsL6gyG1D+ovb
   vJxziaugQMmAQEB4zwTwzk+eOhbasqZ9cxsKdQ97tky4nnTIEykUv5iy5
   YV+rY4CPN1FTiyQDznc9ITM6iQXS/Rdwajz9T1NuQAYhCf37kWMlnkOlp
   rnzzRDD+D3eXL/MYRasRTbJjOJ3tRdXA6HCXt/apix2FCn3lDF+T33TN2
   giBDRNqGcNvzgFoHiXcI2iW4iIevM2IYAQ7o86a8KGGjHBvPPlIJADW58
   xkQ3fG3NrUH0+aibE94YgmUCe/oRY5JDWS1iQuPJWuBggZkeQrNDZj6AW
   g==;
X-CSE-ConnectionGUID: bSUjtE2tSnGkh3IOPZH3Ow==
X-CSE-MsgGUID: v3werzqKSqqGGocicYJ9Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17571859"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17571859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:09:32 -0700
X-CSE-ConnectionGUID: M+BSdVMFQyuQmP0jbOts/g==
X-CSE-MsgGUID: fY9elIhsSpSqLMP3/Uq2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47389420"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jul 2024 19:09:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 19:09:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 4 Jul 2024 19:09:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 19:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJO9z80VyZkHei3UgjhdlCB+iclX7tX6jkqkNfVDOYuDb1KS50AlNXJafgA5I0d0tTTq8M1LeHqV392riNAjcOQO9Kuxmruqiyy8leDpEMhLj0jWOl/sCqcUJyppJze5aiescmcrDFpXeGaUwtcDHC9zhBEP5XecE+UpPJGtcxgD0KJHBijs8hc9N/a6nAEF/TMC8aauMnH79YMON6kNn3k6Cu7TR9zgP68620Fzh8l6eWtylN6F55L7xDmnd5ivJAqYbNdGc5sMNmIjI5qfkzWDQx/0nUYnKD0EPrO+oIfGqxHoV6gjt+5cM1flNFOYBtI3SHCnPkjL26W+QJgOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlL8r2jaQvi8XAibT+P9wl1BpEXUmEbe1SnaKo7UqNs=;
 b=mDRjkwMqEenYmGfcMx4R6QMVNT3e14dKFRIsoDNz4PlkejxV4woP4jllxbslj4gn0qt14GAkfVidzPP5Qn4j/SaSXgkeaBl+xFmFMuVP4/oP3jbYqyzpvU3lHyCrCGyNecL/XxUpFoDJvXopqDf6b+UepcE2foicKKYAJPxE3VViBzfYUaDuT1txhpNSGj13yJMWbds6A/YOUeNxZWb9HOlA2r+BhkW0S3D0z7DPX1Tvm3JVfPc+MF3GvHniEI8uR25z7iX975SAcz+jyJ36FXfy9AMJ6cVMUqfMqVmuNwY+LNYq8D+MfMcKp8dW3dvlYFLxNma6EF9bRNVKsaz51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 02:09:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.7741.025; Fri, 5 Jul 2024
 02:09:23 +0000
Date: Fri, 5 Jul 2024 10:09:13 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
 <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
 <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: c7586c77-3e75-4e3c-fecf-08dc9c977ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5SsvO2YV4G4IE/zBLcCZhN1qWeupdFyXqMnmwwJdjTVmJxV9Ncgxl1kffE?=
 =?iso-8859-1?Q?sN7iXvV8XVKKbnREAUokN2pQ5jmifhX1jOeZ/k4c+LPpygyQnoD8OwGtg2?=
 =?iso-8859-1?Q?tJNKotUIehb3c20ScGN7D+u2SwzsoYs5t50ZshUfST+EmQ/CIapOQXMixd?=
 =?iso-8859-1?Q?5JC+a6lxHHm8VSxz/qL69lgwk4JZBYLInE6Vb9C4hrQ7rQQUdSHZLxJzJw?=
 =?iso-8859-1?Q?ODjZxs5UkGFmP8jmzRwDISVo8yqDuYK9Cy5n4xzxM5jJI7oaqd5si9Wq7P?=
 =?iso-8859-1?Q?WahgbVXq6M12mw7r9Oocigb1mOq9xJ3OcYy8rXkZ8t6Mab5i9cH+jKKeDk?=
 =?iso-8859-1?Q?OVEGUWdzqt8oYIlPezAY4yUiUTtXelqGIyS7dB9k4REFm5kqjD+I88orJO?=
 =?iso-8859-1?Q?oZRFhffJNCGOr2qrB23EsBT3o6NSuwtgLU9+Bf8Z48xi37fMb0suAe0ipe?=
 =?iso-8859-1?Q?HBHi8uDDDwJsAKU0t40wJFx/v6M1g+RG5DgHI8l378sn94VFtPjfhfncwX?=
 =?iso-8859-1?Q?CXLqYWzB0MTrfwsbIxianBmcfRXPX8IRhbiQ0pVHFgJyjKXO2YGm1z2lUj?=
 =?iso-8859-1?Q?j+533WcQ0a3/cmPeFOa/YwkuLr0uFFfVaHTjWpegO5fb85kjlwap7qPM46?=
 =?iso-8859-1?Q?keLXzsmbBwzlDaAF5KGe77sKYBXo/aUPvOZ2AgdoIE6YTB0IVRybxJ3zgc?=
 =?iso-8859-1?Q?9Wo0kUx5nyHIXCnsQWYjiF9XFca9ko2yXevlRQj96DwL+OCYt2+dSlz/xl?=
 =?iso-8859-1?Q?OJ9yb1G8D69rGowHQ1QsV7hODfdnigIVZkIk9NfSItWfZcWVWWzagesHEo?=
 =?iso-8859-1?Q?oox0RP+hnMnu7B35Bn9e0PauVcljePjfOGp00zcBwmSdusYfcr8sOKd3uP?=
 =?iso-8859-1?Q?L/fdHq1e/deWbQAIKV+nM68ovXBg51BB66vCXkc6ho/WbexRouqwxDWF/d?=
 =?iso-8859-1?Q?OsHRw/NnLkonZIgYdqY31KlfrQUfFvo/XElrwe1Ov7mSsqQoCkg16A5g8s?=
 =?iso-8859-1?Q?WagrIHi20BlnUbNiPpMebkCkwTHhGW04kLhYaFkez/Of6zPnbdEeH+TnuA?=
 =?iso-8859-1?Q?DejYcMLWbRTM4FE9P0k/AlF+b0x3XHkn5HrZphNmu+3ilKCgZmqyYbdfhr?=
 =?iso-8859-1?Q?1uIpEBnWZ5/2pGa8t+dP/TKnMTcJH+Neai5DoTOKZg19WQIUjkWHnFSXNM?=
 =?iso-8859-1?Q?1LozMSd4cswptxSp6NWcCXNptxsb2F4o3bBoelU4Ynk9w6re/RgwWgrj+D?=
 =?iso-8859-1?Q?gIzgFG2oebEuVHj948WeYQU9zzzQW49DzQX8J3sqxVohJtdKPhqdd1sA3c?=
 =?iso-8859-1?Q?1Kse9pwVB1YsiAnLu/EXT4quQk0e1SKP5mxnWIylxSCMWYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n4IvgG4iWKfOWM/GyUSfmrnpNf0aGkxselpWtK48cqjPoxl5G7GE8hb+KG?=
 =?iso-8859-1?Q?lavlKiwVdKoTTEQlF1WSIpdcfIyfkju64SrOtIudRw4OpakIXWl8fbgXu5?=
 =?iso-8859-1?Q?gTCGYvuvlcKCynO+aV98bSrPvNryqahTK9/SmaofiXvvqHzF5B74TiVx0y?=
 =?iso-8859-1?Q?zR15k43rmSMVN4n2qUg6vmKY542CaQC4ocWYxs57211Tm8i2t8LelBeria?=
 =?iso-8859-1?Q?WU1tvtYH8rnj7lT4At+Q3PgH3mZND81dI0sbKxR+3Xg7zWzkgAYlCn2vSi?=
 =?iso-8859-1?Q?bXc7LxquGima3uS5PDm01RAzRfki5NHalPpD85ZM+RRd1cU9WnR+wOETzT?=
 =?iso-8859-1?Q?Mswg2gGgNGp9TsH2PSckV49PRqmlOwVBl2QERb3HmTXt6poP0qgxshvn6s?=
 =?iso-8859-1?Q?N5n2XyCGfLlUyA7J3KgwHW2GAFo3VW0YlMB6H/zU6Fyw5pTaD0gPxR3RIF?=
 =?iso-8859-1?Q?LKdopf0PX842p+hldfZgvtgGYTVApwnJfwrGvgGAliYnvWq3oIaqVQwk/f?=
 =?iso-8859-1?Q?s1o/AXnuwhChkAhk3wJVGha0IV/cxGXR3arGYkdebP/oVCQwG+MdweXMtC?=
 =?iso-8859-1?Q?X6MwNqSBw7apFoOtIXT6ynZdjlEW5KGS+ipQmmZmCUbq3U2pbxC4S7bMX3?=
 =?iso-8859-1?Q?UI9UN57MJPcb+1YUj+6LuKcRkok2dEXGVusLT0C0xQHpnDQ275UsVohInB?=
 =?iso-8859-1?Q?Y0oYg9HbowawBBeSgFa58OzUKWAjtXC4Q92XHb1M6yjIvw+2x8m2U3dgju?=
 =?iso-8859-1?Q?BszJjglRuxrYgWLoQYInJFfr4Tqs0NXXYltqEK8WsdwMXx5tzAythMonpz?=
 =?iso-8859-1?Q?yp0eaXtk96vTpofA09vbvOkW618/qDWpK0ZyFJkfGJOBBIzU9ABoYjqJNI?=
 =?iso-8859-1?Q?4ZhyXxZYd+wid/ePo9OikGsG/0Umh4rbuUpeGjYe8Xkh4WAvkEi1CQWZiI?=
 =?iso-8859-1?Q?0A2kIIQSi2sq0IOmGzioqHBRUT5tp1zwjH7wvFEsyAsciHBeMsG3K7hKqw?=
 =?iso-8859-1?Q?sxc2oMqsfmeYmxNuPVnnXoUogV/LAKkTK7I4pM43EW8jgxcT7nKDCP4PYa?=
 =?iso-8859-1?Q?h5fEzosI316rJOx7kfhtWO2TyyqggpH4NZ/1DFBwG0hBUbJ3vPlXbwVXXk?=
 =?iso-8859-1?Q?yzXxDR599KA/J02142GkzoYrcM2Vu7j+ysEufe6T0f/UylhiBaFh2QafQr?=
 =?iso-8859-1?Q?d1cKWLLF+9CqyyUuC6XkgKBs6TTCSCmSsUcr5gT8bIjl6Ka3il9d3oN/ii?=
 =?iso-8859-1?Q?vp2TRaiwIi5r2YA1GQezQtT8asQCYmucNfuqQ3XisxZu0k+zHQ6d4KLw4k?=
 =?iso-8859-1?Q?QKXoGWdT+4jp39GrlkgkTmguv/yJpj0/Dj9nCY6zVoqMgFaEGMHFd30oJ7?=
 =?iso-8859-1?Q?TyVB6YcmeQmoa8MPKNHwwMkwISLVAhxL/oCHw4KcQEhA0mwcoH+ZMUjTLt?=
 =?iso-8859-1?Q?d7Yv8QHVMfctafjgSwrNBxWXxNoDbCbSAAjjoF0bMnmgFkQ0cos0mT7tSr?=
 =?iso-8859-1?Q?K7z6St+IGTn3VHm3cVllQ8sDBogKvjvqzoP1Zb9Gw/SK3thBU0l+3mZtVd?=
 =?iso-8859-1?Q?J+tmzBIhHTfG4YhNpppMh+XEitAkbe9VedNs58zV5Mi+1Vl7zUuMRUGnTY?=
 =?iso-8859-1?Q?KshBrVMlfSgMf9h2R35vFut8KqkKzEZYnglb8JJyMzqOATRmWz5i5Q6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7586c77-3e75-4e3c-fecf-08dc9c977ce5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 02:09:23.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UL5zeuH67AF/zbUGMksBNnSuM50MaRDlVnZnUdsMui0tTOCeh43rBPrFwADJvEVs7+MwFpfiyhE66BP8iTujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
X-OriginatorOrg: intel.com

hi, Amir,

On Wed, Jul 03, 2024 at 07:20:49PM +0300, Amir Goldstein wrote:

[...]

> > the data in our tests seem quite stable for a commit, such like for v6.10-rc1:
> >   "unixbench.throughput": [
> >     121545292.8,
> >     121629889.4,
> >     121598992.0,
> >     121492095.5,
> >     121645038.1,
> >     121556286.9
> >   ],
> >
> 
> Are all those runs from the same boot?

no. we reboot machine before each run.

> 
> > for the branch tip a82fd282befc7:
> >   "unixbench.throughput": [
> >     116675606.7,
> >     116840611.2,
> >     116738966.0,
> >     116956953.1,
> >     116704901.9,
> >     116997628.3,
> >     117141733.7,
> >     116660495.4
> >   ],
> >
> 
> And these run?

same.

> 
> Otherwise, we might have a fluctuation that happens at boot time
> or at mount time or something.
> 
> >
> > let me combine the results from this branch together:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   v6.10-rc1
> >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> >   64108c0b47db9 fanotify: pass optional file access range in pre-content event
> >   a82fd282befc7 fanotify: report file range info with pre-content
> >
> >        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> > ---------------- --------------------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \          |                \
> >  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08            -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.throughput
> >
> >
> > one thing I want to mention is the "%change" is always comparing to the first
> > column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comparing to
> > v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.10-rc1,
> > and so on.
> 
> Thanks for clarifying - I did not read it this way.
> 
> >
> > then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9 has about
> > -2.4% regression compareing to 94167e071109d.
> >
> > from above table, along the branch, the performance is kind of fluctuating,
> > dropped most on 64108c0b47db9, but then recovered a little on tip.
> >
> 
> I can understand why 64108c0b47db91b would regress performance, but I
> cannot think
> of any possible explanation why a82fd282befc should improve performance,
> so I have to wonder if the regression to -6.6% is not a fluke of some
> specific boot/mount?
> 
> I pushed a test branch to
> https://github.com/amir73il/linux/commits/fsnotify_for_lkp
> with an extra patch that un-inlines some helpers to help bisect the
> perf report better.
> Maybe produce the report with this commit and it sheds some light.

since

* 388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify helpers
* a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events
* f301cd18006c3 fanotify: rename a misnamed constant
* 64108c0b47db9 fanotify: pass optional file access range in pre-content event
* 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
* 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
* 83af0c89527ab fsnotify: generate pre-content permission event on exec
* aca4084213276 fsnotify: generate pre-content permission event on open
* 93656e196b006 fsnotify: introduce pre-content permission event
* 1613e604df0cd (tag: v6.10-rc1,

we run tests upon new commit. summary report is as below:

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events
  388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify helpers

       v6.10-rc1 a82fd282befc71d99106bf31066 388baed2ddef701fe2f07ea0360
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
 1.216e+08            -3.9%  1.168e+08            -4.1%  1.166e+08        unixbench.throughput


since Jan mentioned in a later mail that perf profiles are useful, I put details
as below

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events
  388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify helpers

       v6.10-rc1 a82fd282befc71d99106bf31066 388baed2ddef701fe2f07ea0360
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      9.50 ± 24%     +55.3%      14.75 ± 24%     +53.9%      14.62 ± 24%  perf-c2c.DRAM.local
    261842            +0.6%     263433            +1.5%     265837        time.involuntary_context_switches
      6199            -5.7%       5843            -2.3%       6054        time.user_time
 1.216e+08            -3.9%  1.168e+08            -4.1%  1.166e+08        unixbench.throughput
    261842            +0.6%     263433            +1.5%     265837        unixbench.time.involuntary_context_switches
      6199            -5.7%       5843            -2.3%       6054        unixbench.time.user_time
 4.513e+10            -3.8%  4.339e+10            -4.0%  4.331e+10        unixbench.workload
    167317 ±  5%     -39.3%     101518 ± 47%     -30.5%     116276 ± 39%  numa-vmstat.node1.nr_anon_pages
    112.92 ± 28%     -53.9%      52.06 ± 99%     -39.8%      67.98 ± 64%  numa-vmstat.node1.nr_anon_transparent_hugepages
     78069          +506.3%     473340 ± 77%    +495.2%     464673 ± 77%  numa-vmstat.node1.nr_file_pages
    167460 ±  5%     -39.3%     101568 ± 47%     -30.5%     116461 ± 39%  numa-vmstat.node1.nr_inactive_anon
     10649 ±  6%   +3703.3%     405022 ± 90%   +3625.1%     396698 ± 90%  numa-vmstat.node1.nr_unevictable
    167460 ±  5%     -39.3%     101568 ± 47%     -30.5%     116461 ± 39%  numa-vmstat.node1.nr_zone_inactive_anon
     10649 ±  6%   +3703.4%     405022 ± 90%   +3625.2%     396698 ± 90%  numa-vmstat.node1.nr_zone_unevictable
     15473 ±125%    +567.1%     103220 ± 85%    +366.5%      72185 ±110%  numa-meminfo.node0.AnonHugePages
    220234 ± 13%    +116.8%     477532 ± 37%    +101.8%     444469 ± 42%  numa-meminfo.node0.AnonPages.max
    231368 ± 28%     -53.9%     106616 ± 98%     -39.8%     139307 ± 64%  numa-meminfo.node1.AnonHugePages
    668949 ±  5%     -39.3%     405873 ± 47%     -30.5%     464919 ± 39%  numa-meminfo.node1.AnonPages
    836146 ±  6%     -34.5%     547503 ± 38%     -28.1%     601279 ± 34%  numa-meminfo.node1.AnonPages.max
    312276          +506.3%    1893321 ± 77%    +495.2%    1858788 ± 77%  numa-meminfo.node1.FilePages
    669489 ±  5%     -39.3%     406110 ± 47%     -30.4%     465687 ± 39%  numa-meminfo.node1.Inactive
    669489 ±  5%     -39.4%     406010 ± 47%     -30.5%     465628 ± 39%  numa-meminfo.node1.Inactive(anon)
     42552 ±  6%   +3707.3%    1620116 ± 90%   +3628.9%    1586760 ± 90%  numa-meminfo.node1.Unevictable
 1.458e+11            -2.7%  1.419e+11            -3.8%  1.402e+11        perf-stat.i.branch-instructions
   7347431            -1.3%    7251270 ±  2%      -2.8%    7140090        perf-stat.i.branch-misses
     11.47 ±  6%      +2.8       14.29 ±  9%      +2.5       13.99 ±  6%  perf-stat.i.cache-miss-rate%
   3915539 ±  8%    +513.8%   24032895 ± 10%    +500.6%   23516538 ±  7%  perf-stat.i.cache-misses
  32425619 ±  3%    +391.9%  1.595e+08 ±  5%    +388.7%  1.585e+08 ±  4%  perf-stat.i.cache-references
      2196            +0.4%       2206            +2.4%       2249        perf-stat.i.context-switches
    151202 ± 16%     -77.0%      34851 ± 59%     -75.9%      36442 ± 38%  perf-stat.i.cycles-between-cache-misses
 6.961e+11            -1.9%  6.829e+11            -3.4%  6.724e+11        perf-stat.i.instructions
      1.22            -1.3%       1.20            -2.5%       1.19        perf-stat.i.ipc
      0.01 ±  9%    +523.5%       0.04 ± 11%    +518.2%       0.03 ±  7%  perf-stat.overall.MPKI
     12.09 ±  6%      +3.0       15.08 ±  8%      +2.7       14.83 ±  5%  perf-stat.overall.cache-miss-rate%
      0.75            +2.0%       0.77            +2.6%       0.77        perf-stat.overall.cpi
    133775 ±  8%     -83.6%      21976 ± 11%     -83.4%      22156 ±  7%  perf-stat.overall.cycles-between-cache-misses
      1.33            -1.9%       1.31            -2.5%       1.30        perf-stat.overall.ipc
      5721            +2.0%       5835            +1.8%       5821        perf-stat.overall.path-length
 1.452e+11            -2.7%  1.413e+11            -3.9%  1.395e+11        perf-stat.ps.branch-instructions
   7332734            -1.3%    7238853 ±  3%      -2.9%    7119552        perf-stat.ps.branch-misses
   3921138 ±  8%    +511.4%   23972111 ± 11%    +496.7%   23398300 ±  7%  perf-stat.ps.cache-misses
  32415461 ±  3%    +389.9%  1.588e+08 ±  5%    +386.6%  1.577e+08 ±  4%  perf-stat.ps.cache-references
      2192            +0.4%       2201            +2.3%       2243        perf-stat.ps.context-switches
 6.932e+11            -1.9%  6.798e+11            -3.5%  6.691e+11        perf-stat.ps.instructions
 2.582e+14            -1.9%  2.532e+14            -2.3%  2.521e+14        perf-stat.total.instructions
     13.19            -0.7       12.50            -0.4       12.75        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      7.01            -0.2        6.80            -0.1        6.88        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.11            -0.2        0.91            -0.0        1.11 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.write
      2.50            -0.2        2.35            +0.1        2.58        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      2.81            -0.1        2.71 ±  2%      +0.1        2.94        perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.68            -0.1        1.59            -0.0        1.64        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.73            -0.1        3.64            +0.0        3.76        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.62            -0.1        1.55            -0.1        1.55        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      2.18            -0.1        2.12            -0.1        2.13        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      3.34            -0.1        3.28            +0.2        3.54        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      0.65            -0.1        0.60 ±  2%      +0.0        0.68        perf-profile.calltrace.cycles-pp.w_test
      0.92            -0.0        0.87            -0.0        0.88        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.70            -0.0        0.66            -0.0        0.69        perf-profile.calltrace.cycles-pp.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.86            -0.0        0.82            -0.0        0.84        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
      0.92            -0.0        0.88            -0.0        0.88        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.63            -0.0        0.59            -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.86            -0.0        0.83            -0.0        0.81        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      3.53            -0.0        3.50            -0.2        3.37        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
      0.68            -0.0        0.66            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.53            -0.0        0.51            -0.0        0.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.write
      4.23            -0.0        4.22            -0.2        4.05        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.72            -0.0        0.71            -0.0        0.71        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.62            -0.0        0.61            -0.0        0.59        perf-profile.calltrace.cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2.71            +0.0        2.71            -0.1        2.58        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
      0.89            +0.0        0.89 ±  2%      +0.1        1.00        perf-profile.calltrace.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write
      0.96            +0.0        0.98            -0.1        0.90        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      0.75            +0.0        0.77            +0.0        0.75        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      6.88            +0.0        6.91            -0.2        6.67        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      1.13            +0.0        1.17            -0.1        1.08        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      1.92            +0.0        1.96            +0.3        2.18        perf-profile.calltrace.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.30            +0.1        5.36            +0.0        5.32        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2.12 ±  3%      +0.1        2.18            +0.1        2.25 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      5.30            +0.1        5.39            -0.4        4.92        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      6.17            +0.1        6.27            -0.5        5.66        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     96.84            +0.1       96.98            -0.0       96.81        perf-profile.calltrace.cycles-pp.write
      0.78 ±  2%      +0.3        1.12 ±  7%      +0.0        0.80 ±  3%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      2.97            +0.6        3.57            -0.2        2.81        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
      3.63            +0.6        4.24            -0.2        3.42        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
     12.01            +0.6       12.63            -0.5       11.54        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      4.32            +0.6        4.95            +0.8        5.12        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.28            +0.8       38.12            +0.0       37.32        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
     84.26            +0.9       85.20            +0.4       84.65        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     13.39            +1.0       14.36            +1.0       14.35        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.30            +1.0       13.30            +1.0       13.33        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
     82.83            +1.0       83.84            +0.5       83.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     57.94            +1.3       59.20            -0.0       57.92        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.99            +1.3        7.25 ±  2%      +1.3        7.27        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
     78.13            +1.3       79.39            +0.7       78.83        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     74.26            +1.3       75.58            +0.6       74.90        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      7.43            -0.4        7.06            -0.2        7.19        perf-profile.children.cycles-pp.entry_SYSCALL_64
      4.42            -0.2        4.18            -0.2        4.25        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.21            -0.2        1.01            -0.0        1.19        perf-profile.children.cycles-pp.syscall_return_via_sysret
      7.14            -0.2        6.95            -0.1        7.02        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      4.18            -0.2        4.00            -0.2        4.03        perf-profile.children.cycles-pp.__cond_resched
      2.74            -0.2        2.58            +0.1        2.82        perf-profile.children.cycles-pp.apparmor_file_permission
      2.42            -0.1        2.30            -0.1        2.31        perf-profile.children.cycles-pp.rcu_all_qs
      3.82            -0.1        3.72            +0.0        3.84        perf-profile.children.cycles-pp.__fsnotify_parent
      2.98            -0.1        2.88 ±  2%      +0.1        3.12        perf-profile.children.cycles-pp.down_write
      1.74            -0.1        1.65            -0.0        1.70        perf-profile.children.cycles-pp.up_write
      1.99            -0.1        1.89            -0.1        1.90        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.71            -0.1        3.63            +0.2        3.90        perf-profile.children.cycles-pp.security_file_permission
      0.99            -0.1        0.91            +0.0        1.02        perf-profile.children.cycles-pp.w_test
      2.47            -0.1        2.40            -0.1        2.42        perf-profile.children.cycles-pp.xas_load
      1.12            -0.1        1.06            -0.0        1.08        perf-profile.children.cycles-pp.folio_wait_stable
      1.26            -0.1        1.20            -0.1        1.21        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.75            -0.0        0.71            -0.0        0.71        perf-profile.children.cycles-pp.x64_sys_call
      0.98            -0.0        0.94            -0.0        0.95        perf-profile.children.cycles-pp.aa_file_perm
      0.46            -0.0        0.42            +0.0        0.46        perf-profile.children.cycles-pp.write@plt
      1.10            -0.0        1.06            -0.1        1.04        perf-profile.children.cycles-pp.xattr_resolve_name
      0.36            -0.0        0.33            -0.0        0.35        perf-profile.children.cycles-pp.amd_clear_divider
      3.76            -0.0        3.73            -0.2        3.59        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      0.59            -0.0        0.56            -0.0        0.57        perf-profile.children.cycles-pp.inode_to_bdi
      0.38            -0.0        0.35            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
      1.05            -0.0        1.03            -0.0        1.03        perf-profile.children.cycles-pp.folio_mapping
      3.41            -0.0        3.38            -0.2        3.25        perf-profile.children.cycles-pp.__vfs_getxattr
      0.56            -0.0        0.53            -0.0        0.54        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      4.47            -0.0        4.45            -0.2        4.28        perf-profile.children.cycles-pp.security_inode_need_killpriv
      0.25            -0.0        0.24 ±  2%      -0.0        0.24        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      0.36            -0.0        0.35            -0.0        0.35        perf-profile.children.cycles-pp.is_bad_inode
      0.64            -0.0        0.63            -0.0        0.61        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      1.00            +0.0        1.00 ±  2%      +0.1        1.12        perf-profile.children.cycles-pp.generic_write_check_limits
      1.38            +0.0        1.40            -0.1        1.31        perf-profile.children.cycles-pp.strcmp
      0.93            +0.0        0.95            -0.0        0.93        perf-profile.children.cycles-pp.folio_mark_dirty
      1.07            +0.0        1.09            -0.1        1.00        perf-profile.children.cycles-pp.timestamp_truncate
      7.23            +0.0        7.26            -0.2        7.01        perf-profile.children.cycles-pp.file_remove_privs_flags
      2.25            +0.0        2.29            +0.3        2.53        perf-profile.children.cycles-pp.generic_write_checks
      5.70            +0.0        5.74            +0.0        5.70        perf-profile.children.cycles-pp.simple_write_end
      2.24 ±  3%      +0.1        2.30            +0.1        2.37 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
     98.96            +0.1       99.02            -0.0       98.92        perf-profile.children.cycles-pp.write
      5.69            +0.1        5.76            -0.5        5.22        perf-profile.children.cycles-pp.fault_in_readable
      6.42            +0.1        6.53            -0.5        5.89        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.89            +0.3        1.23 ±  6%      +0.0        0.91 ±  2%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      3.39            +0.6        3.97            -0.2        3.20        perf-profile.children.cycles-pp.inode_needs_update_time
      3.96            +0.6        4.57            -0.2        3.73        perf-profile.children.cycles-pp.file_update_time
     12.35            +0.6       12.96            -0.5       11.86        perf-profile.children.cycles-pp.__generic_file_write_iter
      4.56            +0.8        5.32            +0.9        5.48        perf-profile.children.cycles-pp.rw_verify_area
     38.16            +0.8       39.01            +0.0       38.18        perf-profile.children.cycles-pp.generic_perform_write
     84.67            +0.9       85.62            +0.4       85.06        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     13.58            +1.0       14.53            +0.9       14.52        perf-profile.children.cycles-pp.simple_write_begin
     83.50            +1.0       84.49            +0.4       83.94        perf-profile.children.cycles-pp.do_syscall_64
     12.68            +1.0       13.68            +1.0       13.71        perf-profile.children.cycles-pp.__filemap_get_folio
     78.74            +1.2       79.99            +0.7       79.42        perf-profile.children.cycles-pp.ksys_write
     58.52            +1.3       59.78            -0.0       58.52        perf-profile.children.cycles-pp.generic_file_write_iter
      6.18            +1.3        7.44 ±  2%      +1.3        7.46        perf-profile.children.cycles-pp.filemap_get_entry
     75.13            +1.3       76.41            +0.6       75.74        perf-profile.children.cycles-pp.vfs_write
      7.25            -0.6        6.64            -0.3        6.95        perf-profile.self.cycles-pp.vfs_write
      6.45            -0.4        6.09            -0.2        6.28        perf-profile.self.cycles-pp.write
      4.32            -0.2        4.09            -0.2        4.16        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.21            -0.2        1.01            -0.0        1.19        perf-profile.self.cycles-pp.syscall_return_via_sysret
      6.98            -0.2        6.79            -0.1        6.86        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      4.52            -0.2        4.35            -0.2        4.35        perf-profile.self.cycles-pp.__filemap_get_folio
      2.34            -0.1        2.22            -0.1        2.26        perf-profile.self.cycles-pp.__cond_resched
      1.60            -0.1        1.49 ±  2%      +0.1        1.71 ±  2%  perf-profile.self.cycles-pp.apparmor_file_permission
      1.90            -0.1        1.79            -0.1        1.80        perf-profile.self.cycles-pp.do_syscall_64
      3.65            -0.1        3.56            +0.0        3.68        perf-profile.self.cycles-pp.__fsnotify_parent
      1.47            -0.1        1.38            -0.1        1.41        perf-profile.self.cycles-pp.ksys_write
      1.62            -0.1        1.53            -0.0        1.59        perf-profile.self.cycles-pp.up_write
      1.09            -0.1        1.02            -0.1        1.04        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.80            -0.1        1.74            -0.1        1.74        perf-profile.self.cycles-pp.xas_load
      0.79            -0.1        0.73            +0.0        0.83        perf-profile.self.cycles-pp.w_test
      1.10            -0.1        1.04            -0.0        1.08        perf-profile.self.cycles-pp.security_file_permission
      1.25            -0.1        1.20            -0.1        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.66            -0.1        1.60            -0.1        1.61        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.41            -0.1        1.36            -0.0        1.36        perf-profile.self.cycles-pp.rcu_all_qs
      0.90            -0.0        0.86            -0.1        0.81        perf-profile.self.cycles-pp.simple_write_begin
      0.88            -0.0        0.84            -0.0        0.85        perf-profile.self.cycles-pp.aa_file_perm
      0.80            -0.0        0.76            -0.0        0.76        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.62            -0.0        0.59            -0.0        0.59        perf-profile.self.cycles-pp.x64_sys_call
      1.39            -0.0        1.36            -0.1        1.34        perf-profile.self.cycles-pp.__vfs_getxattr
      0.53            -0.0        0.50            -0.0        0.51        perf-profile.self.cycles-pp.folio_wait_stable
      1.69            -0.0        1.67            +0.1        1.81        perf-profile.self.cycles-pp.generic_file_write_iter
      0.87            -0.0        0.85            -0.0        0.85        perf-profile.self.cycles-pp.folio_mapping
      0.56            -0.0        0.53            -0.0        0.53        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.93            -0.0        1.91 ±  2%      +0.2        2.10        perf-profile.self.cycles-pp.down_write
      0.24            -0.0        0.22            -0.0        0.23        perf-profile.self.cycles-pp.amd_clear_divider
      0.25            -0.0        0.23            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.__x64_sys_write
      0.35            -0.0        0.34            -0.0        0.34        perf-profile.self.cycles-pp.inode_to_bdi
      1.15            -0.0        1.13            -0.0        1.11        perf-profile.self.cycles-pp.__generic_file_write_iter
      0.61            -0.0        0.60            -0.0        0.59        perf-profile.self.cycles-pp.xattr_resolve_name
      0.22            -0.0        0.21            -0.0        0.21 ±  2%  perf-profile.self.cycles-pp.noop_dirty_folio
      0.35            -0.0        0.34            -0.0        0.34        perf-profile.self.cycles-pp.cap_inode_need_killpriv
      0.79            -0.0        0.79 ±  2%      +0.1        0.88        perf-profile.self.cycles-pp.generic_write_check_limits
      0.52            +0.0        0.52            -0.0        0.49        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      3.36            +0.0        3.36            -0.2        3.16        perf-profile.self.cycles-pp.generic_perform_write
      0.70            +0.0        0.71            -0.0        0.68        perf-profile.self.cycles-pp.security_inode_need_killpriv
      1.30            +0.0        1.32            +0.2        1.46        perf-profile.self.cycles-pp.generic_write_checks
      0.66            +0.0        0.69            -0.0        0.62        perf-profile.self.cycles-pp.file_update_time
      1.03            +0.0        1.06            -0.1        0.97        perf-profile.self.cycles-pp.strcmp
      2.75            +0.0        2.79            +0.0        2.76        perf-profile.self.cycles-pp.simple_write_end
      0.72            +0.0        0.77            -0.1        0.66        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.87            +0.1        0.93            -0.1        0.82        perf-profile.self.cycles-pp.timestamp_truncate
      2.10 ±  3%      +0.1        2.16            +0.1        2.23 ±  2%  perf-profile.self.cycles-pp.__fdget_pos
      2.04            +0.1        2.09            -0.0        1.99        perf-profile.self.cycles-pp.file_remove_privs_flags
      5.54            +0.1        5.60            -0.5        5.08        perf-profile.self.cycles-pp.fault_in_readable
      1.51            +0.2        1.69            -0.1        1.37        perf-profile.self.cycles-pp.inode_needs_update_time
      0.78 ±  2%      +0.3        1.11 ±  7%      +0.0        0.80 ±  2%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.84            +1.0        1.81            +0.8        1.69        perf-profile.self.cycles-pp.rw_verify_area
      3.66            +1.3        4.98 ±  4%      +1.3        4.99        perf-profile.self.cycles-pp.filemap_get_entry




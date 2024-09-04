Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8428BE49
	for <oe-lkp@lists.linux.dev>; Wed,  4 Sep 2024 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416768; cv=fail; b=jQ0gT3cEjiNnqtWjWZ2bl/s/urbnD2Kj5Y0uxmc/y5CbA+fh4WrFoh1UY792EF7+59Kiw0qmRRT8WeXZiaqkZkwcilbiDCEpcyBJltWPTW+CCscpXUacZA/SjjyYTMWFQYrWYlxyWxtWdrskOirUHmqxMFNLtrwOJMLGEtHacjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416768; c=relaxed/simple;
	bh=EKhVdZBycPJZHxDYU89EZGAzIK+HraiYkWr/WI7r37Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6uubD5au9loBIiZKsMmvPJm6rXzKSRMlEsoHxrhROZL9KvO4K1G+gvWKK3NjTImZrwONtA93O9JuGNY8NELU25gkO3L4fHA8lF73RT2d5niWk8zYMEXdf+VzzcRg7h//udYNiHmNVbIG6LKSVKdtZ5n1zE22oiYs8FMijvngRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXbF0cqJ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXbF0cqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725416767; x=1756952767;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EKhVdZBycPJZHxDYU89EZGAzIK+HraiYkWr/WI7r37Q=;
  b=kXbF0cqJlBcX1iBR+lstOePEwPztSG7xFCdlTpdOjV07Rj1u9IK+ZvI9
   XwtnSRzUnVf3SKSvaeQiwuYYiC9xO+WXVgHOp2bBkonMITnk+2RiWGHIw
   7i/GNLD9MqD07dEa0oJQa2QP56y1bieOSVdTMLB7kIU5zDnwFOGBD1PEE
   4VIsER7KBV6dxvMVoIewywZgYaO/T1GSKww3PFeIiYPnq9ObS8yF9Mvds
   CfoVDuanVCH1lr5PZooOUESNQSrzxcWZmh7SJ2yLUa+n2GPaZtI0TzJlN
   +GOTw5K83uVpak9+dOeI6GZ6x5zLJhgOGt3evi6znaX60gPHXv6Q0RPc+
   Q==;
X-CSE-ConnectionGUID: Fx1JA/I7SGm8R0IjUMKDvg==
X-CSE-MsgGUID: XPDV62BeS5aBc0ygEU8Wkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34713844"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="34713844"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 19:26:06 -0700
X-CSE-ConnectionGUID: 2gg3jnSAQZWyKh2v9sfL9g==
X-CSE-MsgGUID: G3nbsEKjTxKVBMhZAQcjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65831463"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Sep 2024 19:26:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 19:26:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 19:26:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 19:26:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 19:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYCVddxbkaszVS4JP/pBUvck+oOn0+aDalVSfbMcGREmpsS4ksTjBAOL4HuZS7VKU/OwRfq4F7BfaOhMjFS3KAe1yMxsz72+X1xY+747JveBA5Wfvzc9k1C56+cdS8f0ZZUNDzJR8ik1e7pa5serd4yRBUN9cNoNBZkCW1m06xiBHucq3ehv+wmiZgBVhCPcZBQIuZRDy//MuS+znUr1eyLNisIFhZ/+adP2YzCugWcpP+5Qwwpi0VdLstX9bL/tXdz5zGIvEmpjRU0pObQ5LGkxDfQB4o5RYCzmahtXYR8WLNdPV0yBbyxk4GkMiLmsjkO2FjmmdQ6HjwHCR92i2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq4y1Qr3bzPb5JmUEXFyIf3pTb1/d12vAOmV+t4pKA4=;
 b=aO7ewYPbs8Por2XWK/UUT6KaG6pZ4qRszasggYoP1VtdIT9oqdOtn84DfuJStfZP3tdjD7iUDl3iVMXSbIWEdodLullCdhUhkz4e7nJnJFtSR4GkUXDC67QThXYGOT11bZOSzlwmT27Vm3+QFV6cJ82CNJUiNEbf5oOeRw3iVOIOWBSPVf9Q6WHXx9oKQL1wEIPxKKkqJSpKAd7j79aG+/XXl4m4ku7B/Ae357zUE/689cnQr8cRSm2asTx6IOcylsXHm/yV58xK3tZ4NDN5MnxJH8dzs6igWlV9CsDmxKRhEMna2ZVCe59JlwFSDxox8Z2FAvlhBS6BsOidcR+x2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 02:26:01 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 02:26:01 +0000
Date: Wed, 4 Sep 2024 10:25:50 +0800
From: Feng Tang <feng.tang@intel.com>
To: Oliver Sang <oliver.sang@intel.com>
CC: "Zheng, Wu" <wu.zheng@intel.com>, "Liu, Aure" <aurelianliu@tencent.com>,
	=?utf-8?B?amFzcGVyd2FuZyjnjovkvbMp?= <jasperwang@tencent.com>,
	=?utf-8?B?a2FpeHV4aWEo5aSP5byA5petKQ==?= <kaixuxia@tencent.com>, "Liu, Frank"
	<frankjpliu@tencent.com>, =?utf-8?B?a2Fzb25nKOWui+aBuuedvyk=?=
	<kasong@tencent.com>, "Chen, Saga" <sagazchen@tencent.com>,
	=?utf-8?B?a2VybmVseGluZyjpgqLkuIfph4wp?= <kernelxing@tencent.com>,
	=?utf-8?B?ZGVzaGVuZ3d1KOWQtOW+t+iDnCk=?= <deshengwu@tencent.com>,
	=?utf-8?B?Zmx5aW5ncGVuZyjlva3mtakp?= <flyingpeng@tencent.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Jia, Yingbao" <yingbao.jia@intel.com>, "Jia, Pei P"
	<pei.p.jia@intel.com>, oe-lkp <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW0ludGVybmV0XVtv?=
 =?utf-8?Q?pencloudos=3Anext=5D_=5Bhrtimers?= =?utf-8?Q?=5D?=  53f408cad0:
 stress-ng.sockfd.ops_per_sec 13.8% improvement
Message-ID: <ZtfFLlFhu4AwALJv@feng-clx.sh.intel.com>
References: <tencent_0072AD566D2F623120E0A213@qq.com>
 <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
 <ZtfBePyM0Ki/0TzR@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtfBePyM0Ki/0TzR@xsang-OptiPlex-9020>
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 7177fcfd-562b-4bf7-df79-08dccc88eb32
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWc2RGgzOFNsOTZaeHl3eGE0TC9DZE5Sb3l2dUJtZy93dVVObkc3VnhuWHNs?=
 =?utf-8?B?L05NZ2kxaXBiTmJEQm5ZblZHRVhob2E0ZElYWDdwU2RUZHNhL3RuTWFhbDcy?=
 =?utf-8?B?VGZpdFp6cjQ4a0tBSzRUV0lBK2VjWXZMWmhjNXM3a3FSMjByU0h4RlRBbjVT?=
 =?utf-8?B?REpWdExxWDVhMzJFVWRsY1BEMm1rNDV1amR3Y09velNoOXB6ZHlMWE1ldE83?=
 =?utf-8?B?ZFhYamkrY21Dc21FcnpkRHNLQUp1NDZRUGlLZzN2anYzZ2FsazFVOUxpWXgw?=
 =?utf-8?B?L0k4SHMzNGd4RVhESS9xRTJWeEtSRDFzbnJLSndoSCt1cTdybVVDdy9iMHRH?=
 =?utf-8?B?aFpQSk5ReVNqc1BybkFrSGdTVThmSjJNYThtRVlvb3ptdlVtR1AvSGM4OUVW?=
 =?utf-8?B?TlFZWnA5K09xU0s5c1NzeHN0Mi9DVmhJUzJhTTBlVDFNSnJrOTVMWVdJSWh2?=
 =?utf-8?B?RWFRT0JmNWhLSzZrTTErS29Fa0NUZ0VNMWtUR29ZOG5sSGl0OGI5cWJSaWFt?=
 =?utf-8?B?VHYvZlROMFFOOVRwazYwWE05R3paRG9MSnN2YVI4Zy9PL3dMOStxNGRzOE8v?=
 =?utf-8?B?WUhEcjFNRXJDakpaQS9GbXBLbmRkUm1GOXZnM3EyU0FZUlJtZHByWGJ1NFNn?=
 =?utf-8?B?ODBhSGx1V2hTQktkTHdMRGNDYmg2OEtwWlgrak1uOGl2YjM0a1dpb01ReDJu?=
 =?utf-8?B?UkdrZWdUU1R0RjBkdGlQRWJPc3I5eGlCZjdrMFl3RkZJakVwKzJ4MTFtOTBz?=
 =?utf-8?B?S1pyTmFCVGJzM3FtQmhTbDZ3NkdlcDVZcnZlRHh6dFhLL3BiaERreGZKQnJx?=
 =?utf-8?B?bU5jeFBoT1hYeWh1UEJiRU9ZUWdtWm8vR0gyeHVxdXdnM3FhRnlpWVNGd1kv?=
 =?utf-8?B?WmJGMFpkOHJCS0pFMEdkaTMyVGpENVprRFRJaldFVDczUmswaW9Eb0NvQWEx?=
 =?utf-8?B?T0ZEMUU2ZTk3UG8zYWtQcHNaRXJ5akMyK1l2eVJuaVNmT0o1K0kxWTB4L1Rj?=
 =?utf-8?B?Qjl3d2xZL01uYW5HZCtzaFVvbzloV2d4YkJ5RTIyN0NRWkp1NWpmRE1KUTBU?=
 =?utf-8?B?YUZ4aXY0UGVmTVArQUs4alNxY2E0YytNZGZEMXJ1bGYvbDNKazN5UFFZNzJh?=
 =?utf-8?B?MFhtbkZsRC8zN2orTjhPTkJHNjNPT0dxdGZ3dEl0MGJOREJGRCthd2VFdXdk?=
 =?utf-8?B?ZVJmYi9DeThoYWtUNDY5MGhaVHU1RkhCSm81QXlCOWJPSEZHeTV1amIvc2Fm?=
 =?utf-8?B?NU1iNFpWU08xdnJFYk80K3JSYVVmSHE4aWszUnBPS3NvajZvTDB6WGtORHRt?=
 =?utf-8?B?YWJsNzRtRUdYYjRvejFlQTVMMnllUGczaHhxMklQSHd5b0lvNjNIdS9pbTJu?=
 =?utf-8?B?cVVKU01MVnNQTldsVmZMUGxIcmxwMFhWWGg4cUhGMDdaSHI2T3kxYWVQc1hy?=
 =?utf-8?B?TFY5OVREK01HS3pVcVNuM3U4VWE2Y25oOUZXM0g4ZFFhOUd3SjFJM1V0S1V3?=
 =?utf-8?B?UjIyaVZjQ1cvVEFHMTBIbWtzL3ROSW9XN3QwZXlDQVF6MDM0ODBxVjVtb01O?=
 =?utf-8?B?V2NLNkNZZXNkYmMvOVhKSEIxTXI1OHA5ck5QVGNpYzNxL28vTTdwaHVGTWs3?=
 =?utf-8?B?R05qOFRRRzIxTHZxRllQVGdGblFDbEswbWtzTk1vQ0pIQytOaVVZYTBINkdn?=
 =?utf-8?B?SldhU1VzV2VsRUdwSElGRldlMnVsY3BvSGw2Q3gwOFY0RDBwdTJPUVo4bDNT?=
 =?utf-8?Q?j8/zKQ55Mo794zw+no=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2JTclZ5NnhwbnFHKy9oRlFYOVUwLzU3Wkc0MlhNMnRZOUNMWjJPR0k0Y0Zl?=
 =?utf-8?B?U1oxanFRSm5oaTFTenlWTDJBSjYrajNTR1Budkk2OVB2TTluU2gxdlQxcUtr?=
 =?utf-8?B?ZTREUFQxakdIVTNoaWZuUmUxQ1ZUKzRTOU1NSG0vMTlVeWhqdjQ0cUJZYnhT?=
 =?utf-8?B?bTVWVzNXcFBpcnBjUGhLN2pLZ0xDM1hqM3RVZm1rZjhPemxmZ0ZzYjFXV1Jq?=
 =?utf-8?B?NmpRZXdQWElyNXNQTHlJakpIVkVVOEJTWjRvc2ZodDV2RHl0M2xwR2M0ZERK?=
 =?utf-8?B?aVZTakpNZWI0ei93RkVjeWxRa0tWV1EwZGQzWGxBQ0lQZHRySXRJN25WR2hx?=
 =?utf-8?B?ZWRlZ2FxWitUWERMZGxjNUkxbDlkUGhYUmY0ZS9tczMweC93UnZtQzdMWko0?=
 =?utf-8?B?RTBOdTY1STBKSEY3bUpjUk1rYmlIK3p6U0pTQTNvYWw4N0thZEpaYk9Ub2Ju?=
 =?utf-8?B?cnBHZjgxK3R0Y2J5ODFCSjc4cXVMYVMxenpTVkQ0UG9yT1VYUkh0L2MvbDE0?=
 =?utf-8?B?UitTWlAwWDRjNGZmUlJpMEpVNXNTcXNTUW5tN05aNjh5TWV6OFR0VHgvWWlR?=
 =?utf-8?B?QXlpVkxUWGlabTAzcW1LRnQ0QXdaTmpjaWNUMk41NnA4a09Gd24yODVLWTh4?=
 =?utf-8?B?OUZ4ZUhsTVdVUHljM2FZOFF4UENlekl6b01sTFAzb2lrVjRsQjArUTdhTHFJ?=
 =?utf-8?B?YmhzTHQ4RkNub3p4eFhweDN6SCtVMVBWSC9qVzF3blpLendzc3JCazg3STl6?=
 =?utf-8?B?Mzd3VHFxYS9tUlY5c3E3VmhxYXNaY0xrSEx1ZnZWaGxqN1JnTU5LU2U4dFg2?=
 =?utf-8?B?SW95K2tnc1NqcG4vak8yQlIvRFBFRXdVNUllbmROYjFxYXNNVnVoZ3VQYTVu?=
 =?utf-8?B?RExBNjY1dGQ4S0J4cjZkYU1sd25RVkFYajUvNXVnUFVpMGFzcHdRdU9ZdUY2?=
 =?utf-8?B?L0dJcStFNmNDVzFPUm10dlpjeFhIN1lOdlYvWFB3Wkg1cGZyKyt2Ukc0Z3Mv?=
 =?utf-8?B?amwwZk96WkNjWEY5RVppSDliT3MzT1M5ZjBYTzZoTHpMekRNV3NYb3pyTzV0?=
 =?utf-8?B?TEhhQVZTUWpOdTdDQ0ZxcTBYSVA5V1N2Y1BBNDRTaHc0T2h0OUxPMVVCRi9Y?=
 =?utf-8?B?R29NM2ZPV2d6ZDdmK3AySGZQSkt4eGdHdWw1NFNYWHZlL3RCZGVIVVZqdXFU?=
 =?utf-8?B?NFVoakNSaUxxcmo1ZnlXN0x6SXN4Q2wyWURyK3ZJQnZZdk5UZDA3eWgzQ1I0?=
 =?utf-8?B?TlpNV29yMFcrRUNBakREdnJBcXR3VVNUNVNSakFWd3p2L01qMktpcWlRTGJq?=
 =?utf-8?B?dVpxYzg4VjhxYzRTanhLd0NtSFgxRHZMbGlRcEFoeG1FbnR0K2FzSHkrdWhX?=
 =?utf-8?B?a3FXVlJaYStUVTIvR1M2M0Ivc2FEUmp2bWdLUXRzVW5XQjZXSU1CS2tJQWZJ?=
 =?utf-8?B?aUd6ZmExRW5ZSGNBRnhuczdDeVAxWkVoR0xxd0FDbmFsN2MvWndhZGdSMndS?=
 =?utf-8?B?ekVYdmh0WVN2YnN5S1VuL3l2NWJMWFRBQnBJREQxMThaK3d1S1pieUpsaFNE?=
 =?utf-8?B?YmJ6clFrU2pZWEdSUG9NalBKTHUwMWY2cUh2cXJoNlByKzkydHR5SUNkY0tx?=
 =?utf-8?B?bzJwcm5MckhocUZxL1EreWt5cElQUEZ3ZGYyQ3paK1VUSURsd05oak5WU01x?=
 =?utf-8?B?TmhwQnZCaEE1U2xpNml3QmVNZnFhcUpmcm8wNko0amdLcVV5ZkVydkV5dVIw?=
 =?utf-8?B?WDNwSU1Tc2ZsUGsxQ1JweGUzaUMvT2E2M0xVdk5EQmZSQmp1eENNTnZER1JX?=
 =?utf-8?B?cVpKS1dVTllQUjJtU0RMNnViODA5alBHYnI5WEQxVnF1UERjYjJmVndyQVlL?=
 =?utf-8?B?LzJ1S0NwZUNRSC9rWkJFRzl0dDVkbm0xWGk2M0duVFFYOHdnUGZZeUc4Rkpo?=
 =?utf-8?B?cnlQVC9lWk12ZjJmZDlwakordjc3V1FCSFkrNWFRdGszU2kvMHBxSWpSRDRF?=
 =?utf-8?B?VGRoM0pMcFJ4aWF3cERTMHRmeERadnFYZUx2dGU2T0dYVnY5YzMzY3dTZVRS?=
 =?utf-8?B?N0Q4Y2dlTXB1UlpiUHZOeTVQcVhtbHltZlB4WjA4UzdKMXMrb1MyWEwrVm1r?=
 =?utf-8?Q?pS+P2zleEruPpfOoDtij9pO7j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7177fcfd-562b-4bf7-df79-08dccc88eb32
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 02:26:01.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkrpM4sZUbtqds6Sii3m5YCQbLwCT81Bj6y3f9OSkXy3bXSxva7dSmT2UpKrK6/pRYZxlD+qNWDZjWbsVtve3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
X-OriginatorOrg: intel.com

On Wed, Sep 04, 2024 at 10:10:00AM +0800, Oliver Sang wrote:
> hi, all,
> 
> On Wed, Aug 21, 2024 at 11:45:45AM +0800, Zheng, Wu wrote:
> > >Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> > hotplug，是不是不应该有性能变化
> > 
> > 查看了一下代码，确实应该只有在cpu hotplug的时候，才会运行patch中修改的代码。
> > 
> > 不过，在patch中新增加了对cpu状态CPUHP_AP_HRTIMERS_DYING的一个handle，
> > 
> > 是否这个improving performance的原因。
> > 
> > 另外，和Oliver对过了，这个improving的data应该是多次测试后的结果。
> 
> Wu, you are right!
> for original report, both 53f408cad0 and parent tested 6 times.
> (in fact, for all performance report from 0day, 6 is mininum run times for a
> commit)
> 
> the data for 53f408cad0:
>   "stress-ng.sockfd.ops_per_sec": [
>     806893.21,   <--- one unstable data, but still distinct enough comparing to c94c44685d
>     890668.75,
>     890737.88,
>     890370.42,
>     888873.71,
>     892069.45
>   ],
> 
> the data for parent (c94c44685d):
>   "stress-ng.sockfd.ops_per_sec": [
>     772950.12,
>     774262.88,
>     748388.34,
>     774652.04,
>     776115.25,
>     777131.75
>   ],
> 
> 
> based on your feedback, we checked code alignment further. by attached patch
> from Feng Tang (Cced, our expert about code alignment issues, and is working
> on patch-set for mitigating this kind of issues, Thanks a lot, Feng!)
> 
> and we run tests up to 20 times for both commits, the performance difference
> is just in noise now. so the original report is less meaningful. sorry for
> any confusion caused.
[...]
> 
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s
> 
> commit:
>   620c3bf8aa2f2e ("scsi: sd: Fix sshdr use in sd_suspend_common()")
>   f8057ff406bab9 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")
> 
> 620c3bf8aa2f2e37 f8057ff406bab9ca3e6c19548fc
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>          20:20           0%          20:20    stress-ng.sockfd.pass
>          %stddev     %change         %stddev
>              \          |                \
>   53177039 ±  3%      -1.5%   52396229 ±  5%  stress-ng.sockfd.ops
>     886042 ±  3%      -1.5%     873038 ±  5%  stress-ng.sockfd.ops_per_sec
> 
> 
> also captured raw data as below FYI.
> 
> although there are random unstable data, generally speaking, there is no obvious
> performance difference between these 2 new commits now.

Yes, and this kind of strang performance change case is pretty normal
in 0day's test, and they are mostly caused by alignment change in text,
data, bss, percpu etc. sections.

We have discussed this in LPC 2021 with doc:
https://lpc.events/event/11/contributions/895/attachments/770/1603/Strange_kernel_performance_changes_lpc_2021.pdf

And we'll post patches to migigate it.

Thanks,
Feng

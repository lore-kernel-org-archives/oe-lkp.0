Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7B395249
	for <oe-lkp@lists.linux.dev>; Tue,  7 Apr 2026 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546822; cv=fail; b=HpJuS9E/zoak71aBA3s5MlnkgdvQ+YBDAk5yP6YOylFgp9NsZ+HnflaMyC+/60la7kIid74zBZZuarpSIzLfa/Wu/wwVdrAo+lkpuD+YfTIr3fTueHeA+bd2aRGHSkXrrweXpGFJXeSdMYXRuJtqJr5rGrBlqrk7SGL7mpa8lsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546822; c=relaxed/simple;
	bh=J02JcfkRTYTKNZFNde2HBoIHTHuBzRVoV0td7sv9U40=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cak2EqiNQ4twzGVqC83n3NszkEZt5yXkfDAoUi4VuEy5f/yKAbUfyqBneZMB0//Wr0h0SPSy7xFdU2N30i6PQ4yINw4PCLFpgXAU5zLszxj8yPwl+jHe7KblYQ1q4sxhQGcI6CzHJqGuyc1dXU9Qp8rv9dbXBOQcMfmDZCFvuWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw1zzb4q; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw1zzb4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775546819; x=1807082819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J02JcfkRTYTKNZFNde2HBoIHTHuBzRVoV0td7sv9U40=;
  b=Xw1zzb4qov2xiRbhBXGQg6r3ChSj5LhwY1N2g9oBuqO2QM8pIqoNEUKV
   t9H/IooeODF9yFUWAoi0LhCqV6ldrLQfsPDWZd9y2dOuuU2qj7mEZf1Mn
   sK8jLI0kqy8pIsvH3RUJRKhU0cnC7WNqj4spuLQi7aWZFmVb29GZEo1Mw
   pLlQZxUptV04K4O5d0UHOs5P2aKdYfa5vrhkOYQ8AMsywIsfC/sZhC31L
   hPw9rQ1eZqvjKYiYvTHu1pzS/AmEs3R4o7y6QsajG3oQrqCyEJijOHcvN
   IRhyXn6LKlcM9aiLxMvVfPqftJyh9evcwVPjy/OjNr64mbX0vufbT71dt
   A==;
X-CSE-ConnectionGUID: RHqkBmN8TpOc0P3bmz+kmA==
X-CSE-MsgGUID: SX5zoYgfT9SXy+JeLZwokA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86796678"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86796678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:26:57 -0700
X-CSE-ConnectionGUID: 8XOSw3vWRnSgSzF2yQOdJQ==
X-CSE-MsgGUID: SjSM4/0TTz6EwW9ej2PG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223298442"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:26:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:26:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 00:26:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfM/y2bT2XoDeswxQuRnsep9l9a+rBerzbH+2RttiQXmgh+V0RXOluA/ZgcKQXmq6jeQ+56OGiNdT1LVr/ZMNH7i41KbXqJjF1GwqhNSuW+fqbdYqjN4VbbkykY1HIuWNP5QCfAjHGdDLuB5FaCuUVwWfwNo9m5C9xXfSTcj9CCUISoaywIEZh1/E6P3GiByCZFcYVD9AtOBbXh+IYygpIxc1qgyh3UJHPbzsLhmMxlIKGgLrTT8JsvANVbtEnlcG7K3O3Jb+q9PaYNAzw8F4kS7QkyINh2Ekb8iZjz0AIuBkzFumB0uEh3RACXnpzjylvlMTJQeX32UjxG5ddVqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k5FuEblqWs6CAwrPCla5wgSPn7fOlAPKcT2+rhNm4w=;
 b=eNkRoH9uMtzQ6bFT47vNoCh9WaLHMr1H/fhhngjRhbJLAd5ZI838OULs8u537YmDK2UBg/qEWCKqF9GAo995Gavd1iE8Un6RWTIpGtY+lW9+BPpAUDsrFoK/aIHUBlUfm5PXuAY3V21okqHEzpxzs4Rtdf4DGfmYCzKZE+2vouoNQlNQwPYbHMBEKivLCdbA+3k8rq8cLuWAS+GAsdiI5e2Lzs57wlgB2TWnr5tu62XqkMJUalZfrQlkwSHAEizDzJmk2cwFAWFsrqOXy93wlY+xUCZHTBPamdEEm4Epo/gpaIY/yYoAWw2tayr76dhvfMhGBA3W9ZwTE6nig9Ic5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:26:54 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9769.006; Tue, 7 Apr 2026
 07:26:54 +0000
Date: Tue, 7 Apr 2026 15:26:48 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <lkp@intel.com>, <oe-lkp@lists.linux.dev>, <oliver.sang@intel.com>
Subject: Re: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr] BUILD
 REGRESSION f45ad0a3230a0f2acba54b0bd76d897a9b68f4da
Message-ID: <adSxuKfrTABhE7PT@xsang-OptiPlex-9020>
References: <202604061512.WALUGsDn-lkp@intel.com>
 <13675fdf-35eb-4d18-9bf4-3bd8fbe2a05f@t-8ch.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13675fdf-35eb-4d18-9bf4-3bd8fbe2a05f@t-8ch.de>
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH0PR11MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fd8411-6e48-422d-b2ff-08de94770b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6utZHVkDIilM3t9qyy7OYaPvWyov2cgIZ8pSiA2wbjv3jMB89a8JQXkz9cpbrHMWNUEe7y+4arNGH8EkGGMN7veVF6VuozUHz0Vr2IihxWAmTokHQHeKOFr9hBRDnThJvJZA2T17NwRgAB0RwIAHnHEW+S/7WfL14BcK9BnHyZLwt03WqKotBVkdgWKOhNuxDnVXxUdfuQKT9nIHZjha9tdm/z0F4edPbLe/VLNeoymfzJMDN1tyqvKp+e8CIcCOatMvU+R8DXKXf7NLy+kOqcFqgk3V7e1PsVPw4gjuhHlMbrZDeJ4AeYhYGtALkAY0PfomDFKKgNe8PzXy/T3s87Feo9F4iy4REZLyZzgHBmmkW3ojobl5UqVorxILhbxSGTLQ0kl+j0X22iizNm8g2x+p70x09mUZ77TqmXGbqmZf46aTuDsw3oIlYZ01YA2Ks2vqwytCrH+SN5Ruf2n13rcqaz7cQ/SSmb8iVf1AjPv/baxXqBhk4ehxf9v6r7+dSLHO+aYpSQT51XykyURlz13Je9+Ka5hME87o/lRUslNMuYw78bgMW3KyitkhezrrWaDLCYOV6Y1UQi5TJRQjQdAiwh2SiohY+bEcfqhcp7QHRY7aieZNVM9ibsQmT/CaThB1uOO8H2NSHwPkNbSjPmNHOXn/wUbu1PPgSSFjKCZj57LP/B9hoKmX2Wf0VRxUpWp/7zTJVtjH7yjW7IA30Mi4mHQmcVCSV9okbhAqBdgKmyAMRAx1UJBIjRULZQ/t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H9RFZvG+PFmWmN/IXKKtTnHcX7OhGE0IIyrxge74fribhyJdExNaFqxFk/?=
 =?iso-8859-1?Q?gD+55mDW0nMUmu1Rs2cwprAHcDPRJ5uWz1lzbca/P+edh++cJawDF2KdE/?=
 =?iso-8859-1?Q?9c3tEp9QOLF1ln/ehgNaeKcNjxH0/wPWCmyjFlYbepCuNGuiKc1hcvHnw9?=
 =?iso-8859-1?Q?iJ2W7ODThqZHjNuOEF5Yxn6PnR6cyH7fGBEsF2jRERc8cyVlPF3OFDbJtR?=
 =?iso-8859-1?Q?8Sw3eh4ZWF7vW8N289TGvpvEgo5F8uXyP9MJHDDIATfeCy4zXqbvaWElAX?=
 =?iso-8859-1?Q?SJjimSyRX077VzIgwT+2dAEXtbs6J5/r7acBbsS92Xnj9FULmm0d4ihht0?=
 =?iso-8859-1?Q?p0abm0UwM2TPJjz3fVirKO3jC7/89PrBth4eqQsqz00vAlHQZ/Z+VNAUF8?=
 =?iso-8859-1?Q?EgJj8PX3IBazfuasTphSqulxlNKlvACn/22FrJAMppBt+E2epM+pfLM7jP?=
 =?iso-8859-1?Q?rNs8AYQuLcQUce7wFCuERKflVFdUveIXxpwVyn0M5wEhCzTMrrBvInTX0w?=
 =?iso-8859-1?Q?jIG0fF1KlV8pejJs8fJwnPlWGdKmZqauegZcAHSdQfnmKigX3Qen5UJld/?=
 =?iso-8859-1?Q?nATm3XP1TPIY+qqwkk40tC1dTBvrAA61jIfHDm+ymYIM87GjpM6pvX2s1l?=
 =?iso-8859-1?Q?RtEqBdUvDA+ljIt5dUPDbQn/vZ5bQ8bSmtREBA8tuXMg46tz58vIdlqfDH?=
 =?iso-8859-1?Q?/EKgKvwRp1b4IAht6RqybE4rd9flvGRcLzGraNPDaepbZx5OzDggnLY/mD?=
 =?iso-8859-1?Q?hRMTnWk7ShGClgGdfs1G9b3D8ZqQq78Dw9IisCUAwznyJ94zv47f5K/p0k?=
 =?iso-8859-1?Q?gCMx9cHQ5hsWcQ/WvQczSur6Fm+2y+6b5a6sW0s3F7g4JGvMGuRZoyqWlM?=
 =?iso-8859-1?Q?BU011jz3cTNn9n0D9qLuhib3EvKYjYIlmQvs+vO6IFAbC4qOmbkleJ9d/8?=
 =?iso-8859-1?Q?7r1GvcPxkyMc+vvB6CA8C1T7ybZxISljaDve7bWc27iszdlShtFQnI+/QH?=
 =?iso-8859-1?Q?D+/dOavSpF8i+2BaojnFCHbPeL2Z/aGYCl7SdseqizARfTpJ+cMf58N+EC?=
 =?iso-8859-1?Q?vnHqFpywnVCI6JNUZafUHjypjAH4BKVMdHiSaB3M8E/5U4JB34Ms7Y9nrM?=
 =?iso-8859-1?Q?ihdKS/NNXaa9Qz8lrjav868YqpBFgyOxcFXe8wVInH7mIFh6So400og+7k?=
 =?iso-8859-1?Q?FZcjwNL2d2LMMWUzzejOiy6iZQuET+3vRY7DcrLptgoxa1zN9o18Ynu+qN?=
 =?iso-8859-1?Q?f0yCTQ+cfyCc28+qbBGclVvJqoFc6RKfE1T7sLc1gCiL5W9YA6jP1YFr8O?=
 =?iso-8859-1?Q?5e0o6TuToyYcuxosHX/YWC62np/m0zxlcErXrJNYinea8WXdZWoRcGKDP/?=
 =?iso-8859-1?Q?3QuGqYBo4f4bhCCgjmeFj4aZYCoKc78QprKQY7xxQMASdLbsPnN09sojMg?=
 =?iso-8859-1?Q?gHkjypVw6Ufe5gWoW/bJA7DtblGBnd92hXP/VRFLNgZVSAKXXbAR4Fm+Yy?=
 =?iso-8859-1?Q?eUllgHN5XcUGVxpvoVgctRDq/gWmnrn6aymAci7LExitvuYghBPRPrQa0C?=
 =?iso-8859-1?Q?SfIDQDNi94lkJiIdQVMbtP+JeLz97ETyMP6VCdEsq+MllfoaJ7FKStPz5H?=
 =?iso-8859-1?Q?XbrwT6hgnwttVpkxiwFuCr+gRz1muopMvzrFRpf+UYs8afBlAG3XkVikiU?=
 =?iso-8859-1?Q?oxo8IlgnwcTgPvRS3mVQQ+VzfpUvQE6+5NvvBvCUAQaQBykqZArG5z6A8W?=
 =?iso-8859-1?Q?58YHQF6afMHO5npU6YQ85Pyr+yo3u6jLj5/QwhUthUPkVPb231QC7O7Rrg?=
 =?iso-8859-1?Q?lwMXk32hEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: hlJSBPRE1TfsmaTp0UQeljtZLec0mJMDmsFPkViTkVWIt0Q5vMHKqO+NqUIscf0Bz+SCwerUvbCfkJGWj6lQuhNkrmBA60QHMMOOdTdTz4TCB/tJozTl8hOKvIDIXm41ST6SKrZEG+QH8lk/S4tpL98I+wQNjff6Y9VGeiBY1k4yWjiJwb1Iz5ya+btOpNkfVCEPeTv6p9k7TsCZMRwCpJwUnEbeHDk2p8rmXAhfrqRWeP2H9WVlwajeHmW9yrphF1OhJkf7+Og3vqQhIP4ARuAWG+woqhr7TPjvZ9F3Fq0JKw9LubwnMklpXV2kEUqafwgjx6u5mOVzrfWPCTTNJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fd8411-6e48-422d-b2ff-08de94770b45
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:26:54.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wnap0OrG7PhPhlxPqYjYTWGjJUBzBs4/VftyU/Q+62T4qxGJCJyIo1EaGzKjbRQ9BJUvzv4VWraJqiFfOfTtag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
X-OriginatorOrg: intel.com

hi, Thomas,

On Mon, Apr 06, 2026 at 11:10:54AM +0200, Thomas Weißschuh wrote:
> Hi Oliver and the LKP team,
> 
> On 2026-04-06 15:27:22+0800, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
> > branch HEAD: f45ad0a3230a0f2acba54b0bd76d897a9b68f4da  uncore
> > 
> > Error/Warning (recently discovered and may have been fixed):
> > 
> >     https://lore.kernel.org/oe-kbuild-all/202604040309.wwvKyW4x-lkp@intel.com
> >     https://lore.kernel.org/oe-kbuild-all/202604051945.yvQXxV6C-lkp@intel.com
> 
> These links don't seem to work. I am specifically interested in the
> reproducer for "initialized field overwritten".

sorry that our related services have some problems recently. now fixed.

above links and links within them related with config and reproducer
(https://download.01.org/0day-ci/archive/****) are all valid now.

if you still found problems, please kindly let us know. thanks!

> 
> And thanks again for your service!

you are welcome!

> 
> 
> Thomas
> 
> >     arch/powerpc/perf/hv-24x7.c:464:18: error: assignment to 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
> >     arch/powerpc/perf/hv-24x7.c:464:25: error: assignment to 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Wincompatible-pointer-types]
> >     include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
> >     include/linux/device.h:161:27: error: initialized field overwritten [-Werror=override-init]
> > 
> > Error/Warning ids grouped by kconfigs:
> > 
> > recent_errors
> > |-- i386-randconfig-002-20260405
> > |   `-- include-linux-device.h:error:initialized-field-overwritten
> > |-- i386-randconfig-051-20260406
> > |   `-- include-linux-device.h:error:initialized-field-overwritten
> > |-- powerpc-allmodconfig
> > |   `-- arch-powerpc-perf-hv-24x7.c:error:assignment-to-ssize_t-(-)(struct-device-struct-device_attribute-char-)-aka-long-int-(-)(struct-device-struct-device_attribute-char-)-from-incompatible-pointer-type-ss
> > |-- powerpc64-randconfig-r053-20260405
> > |   `-- arch-powerpc-perf-hv-24x7.c:error:assignment-to-ssize_t-(-)(struct-device-struct-device_attribute-char-)-aka-long-int-(-)(struct-device-struct-device_attribute-char-)-from-incompatible-pointer-type-ss
> > `-- x86_64-randconfig-103-20260405
> >     `-- include-linux-device.h:error:initialized-field-overwritten
> 
> (...)

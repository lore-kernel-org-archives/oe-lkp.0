Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFC18C33E
	for <oe-lkp@lists.linux.dev>; Wed, 16 Oct 2024 05:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057093; cv=fail; b=g3gG+XW5emKp+9VCk+7VOUSk0ivjLbu9KFm87TagRURWPBZ3y9L65EMPTHLt2pOKFVl65p0QHMMgbQ/T2HWYLCMNaV1qE9HXL6DmomeYgEOJ/fH8DvdK4UEE9xgogKQnBTu3jJXJIZmMut7GyES57ZHVC0M6EaPGOuwt5LZRI4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057093; c=relaxed/simple;
	bh=C569+9QMtaf+d6n6IeRsFDeCtpyKl1s4mMz5JQQUZ4g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sEORC8uMBBDsm74trTU51KhSmMvrASOmu9CJ3c27BFHKpt2I+C05qBRbQXEMAE6lruu22fRndy8lt2tNq0V5LOIiCIk90J0HqUqZS8TRl5XQSVH1o7ISg/zH8IVdUEW0pYpBPgKVhQHZJ8Sl4fa6uNplGCz6EHrBHWjvXWw4nTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgl7sZHu; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgl7sZHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729057091; x=1760593091;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=C569+9QMtaf+d6n6IeRsFDeCtpyKl1s4mMz5JQQUZ4g=;
  b=Kgl7sZHux2gtoKz8qSluseGHlMMClmDG0XeQX+mWjoR/GboYo03tmzt1
   YsegYbJAHgPkzxjIuhgLXe/P6iNMXeg5du9hFvTa6uG1jwl0ihkc7159v
   +v53JHZ/y5caE/vpLV2rucOvH1AYDqo3VJAKDaG58rZvm6i0IQa5qHhas
   30HLDaHk3X0CgpbrhdcQtvvpl++sg7mTFeTo+FWVIeSwiRBa0LHO7E7bu
   25hmGAGllYwDLVgQrB6KGhdE6XEXOODO3F+6urBGvvKmIWa9T5ZRfk1oT
   rlZzzHqsuMofPPNxYgICnojucLMcJ3m9Ikg/tPAIN1qUtw52LnZotKEqa
   g==;
X-CSE-ConnectionGUID: 4MU5x6OmS5+tVNYJhJylRw==
X-CSE-MsgGUID: 3T41/5+JT2a/O9AzfI2/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28363510"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="28363510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 22:38:10 -0700
X-CSE-ConnectionGUID: RAWLdibfSqSqgc7OWGhnoQ==
X-CSE-MsgGUID: Md3qN+gpTjeFim5MH9GSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78011705"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Oct 2024 22:38:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:38:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:38:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 22:38:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 22:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBAKmoGGqFTP/bx/KEscltf3t6419pwBnZOXlCf6FKv0Sdw8qtvQXWnqnigzBbgw+xkaSfb/WUkHZkUNG0k9mZUI+sSub9lpn4Vu6bIAnIl5+SzFbwvzG7yBmOpQtSgjgvmvw0hyV2hiEVNPWB78KgNEXXNeJ+RNeJzkqt0w9vedwBRibkHjvWqGIIsoDrPaB5NysZk9UCZPiI/IeWW7PrmbD3RTn8Elv+sMD4vNhJJz4NZilq/mLx+w5Qbz5lfqbuieysE8UPyS3do81lueHBsUk2n7VvXoW9E1bqILc/6hGnwnDLI5rVvkA5IVwHhgcD6NOpYad1gP1Xe6LAe5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cJPct+keL0jlIn+3kDqsom1N9T0liwOVQp7PLrP8UU=;
 b=ZbZJ9vI/wFyHClla1fkkBo+cXXcbXcEoGZkT1agEy7Om3Vwo54NLce6iS3mcpnM5vd6i/srQIxSlxyE0FpnL0RJkKSO6WSKrMK+Ui7F3qhZ0KVJc8GVYoujK53EfaadEGWlLOMi2zyPRv1lvoyt/tsKgSay8HRLxLJc1RqfBll8yX4kcwN9pe5+f0pisIMloGrijsh/BGITqbbqAnLYads3IahGW0S62+7xMJu6PIf5AIKhCW0rpJMMx6PH8zpMNTzDdChnQ42KJptIqHM1jtgoBAcPQwhUqgXfs1sLpEcgoWEASibpia2M/8vj4lmrIKuyMSC6jIO0S4ldt6pZuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 05:38:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 05:38:04 +0000
Date: Wed, 16 Oct 2024 13:37:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kaixuxia@tencent.com>, <frankjpliu@tencent.com>, <kasong@tencent.com>,
	<sagazchen@tencent.com>, <kernelxing@tencent.com>, <aurelianliu@tencent.com>,
	<deshengwu@tencent.com>, <flyingpeng@tencent.com>, <jingqunli@tencent.com>,
	<jason.zeng@intel.com>, <wu.zheng@intel.com>, <yingbao.jia@intel.com>,
	<pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [mm]  0f76dc379d:  vm-scalability.throughput
 -14.1% regression
Message-ID: <202410161119.c0df2023-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8bb6e7-0454-4e0e-89e9-08dceda4a860
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tb49iw6PgwdHIcoQ9oVT6oiAWuxVExqFHcgB1dRz6vlKwQWyc8FGGylK8h?=
 =?iso-8859-1?Q?cVTivu/TQArdpZR+d+m1FEm8rcGgZLi0VyiafpfxagYJ6D4QEmQlXYIUJl?=
 =?iso-8859-1?Q?cOztOCkdy+zeZ4dEGDSPNgdy3+uCEGs/E9CPU8+YkJtnAlf4u3AgLhzz2L?=
 =?iso-8859-1?Q?q7Rr86ndqhAsPXjgZPPElXVi+DOOKOip5H7F/y6Ji+ICOIdIdtA3INB33D?=
 =?iso-8859-1?Q?3m+5batkcyEdtdNMe7ptIPj6aaB0L6roHE4jpc2kK2Qtlsijsr3JR8GPGf?=
 =?iso-8859-1?Q?H/fwM6A6T/YEkgIlyN2IzmjpvISqGnFkf1YbdNPhUwraoEpCIYMPj7m8ue?=
 =?iso-8859-1?Q?a7Ve5k9gGbOOn4hjFJxjhLhVVxj7WwNmUyjehARxSFm3YFeOFcll2FwrmM?=
 =?iso-8859-1?Q?0EvNURMIj/p5Iw6j4hMKsZ+ly+cmqsgfYFkPBRZSl00SKk8mQ4vdgDTo/F?=
 =?iso-8859-1?Q?l9Jdwmzd+K3oi0nX6dV45j0U3mRY65JO4SjocKXnojEcMIgL2EQnspCriQ?=
 =?iso-8859-1?Q?1N4smQRFVkepQEE4sn7pGjRsWHd4wsyPK3FpAyJfwqSSOWgmlpLshh8Rcf?=
 =?iso-8859-1?Q?esceO5iXtIveoMcgOfMEUC5AXPFayiHFwNtZ81S3sdGapFeTXnpuXWsSqX?=
 =?iso-8859-1?Q?ZiZKt8zNfGduKfX30Lg3UTDcYc46FLo37nfXUmfZgN/FXHD9g+52a1+Zve?=
 =?iso-8859-1?Q?m+20O4M5AX1tpuQjGrloob+RGJbQCpQztvXcGQybbVHgiJ+BR/utDYWj6a?=
 =?iso-8859-1?Q?T68Rws5kPS0mOX31uafPK33BJG9MMg+2IJZuicEc0o92X27hSnHMj6P/7M?=
 =?iso-8859-1?Q?FiPi8nLsylqysJ2quBwR58Hs1LU6Y+fBHb9NQKiUypE1oeA8yOrSt4cpx7?=
 =?iso-8859-1?Q?BAF5ApD+SZrHRUOpODYsxquOE3cImPFLdcWEaoxoxcChEnJkTzuu7uT/2J?=
 =?iso-8859-1?Q?6+ETO4a/DQtxew+bypnMQMjRXKoEtOmtP7lUo5OgbhLlhC05Q7LozkPdmT?=
 =?iso-8859-1?Q?MQbPwO8B0EoP+r/GJ2C1NUYyba/ayVIDPzDXCYMw10kN6URNKnRwhV92xE?=
 =?iso-8859-1?Q?SYk5nxpQAQO8NmuRlFCuYvuqESh3oHNdpYrv76VnJEzTk+6XyETeG0XXmk?=
 =?iso-8859-1?Q?n/uVB4rDk2ZveVaIS63EUvd41b/xktSezod6oJ27LbmnlJx/44TzC44dY1?=
 =?iso-8859-1?Q?lF+14IPRuN3wcMFI/+tBqdxEAsS17FDOYOzwDzkbBXD+m82CUKOttiDXJq?=
 =?iso-8859-1?Q?RcvAWodBaWKHv4oNWRdthp1cmUKw7mm7oVGLzvfXhbDvUXfoIUCVLljQEv?=
 =?iso-8859-1?Q?Ef3mVCm45k9lnFO7ma6GFHJuwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tcs3WF3bZ9LfRRXSpHK0TnfHOink+f8pCkQhFqhT+QXVbuvn2HJnO+Igl2?=
 =?iso-8859-1?Q?Otu2cdXLROVD3QhaPz1qpsZ2VNz8nm/72LMnpFys0Hv51I4eXnVwyi1OEA?=
 =?iso-8859-1?Q?aRX4DHGlc/0idR2UU7ucndk7b3VKNhkJwIR9D4zTqB1pDC+hbBKrE0W16F?=
 =?iso-8859-1?Q?kvhPSDkUqWn5b0J2L46kT5nGEhJ+m+tUyEQTZIaLCxxjuC+YL74UdtYQjj?=
 =?iso-8859-1?Q?o5gRypqxJ121kU2WWBk2k2isau9oURtxPzva+PqH6SDKwnRBsm3yxasbtu?=
 =?iso-8859-1?Q?6aHvIgQWoVRW05Bdk5b5moSCqVu2xAuImiLHRTZRINwQeGa0+5rx0HcGHs?=
 =?iso-8859-1?Q?r2OOLMqV2L9BotUEydjbjQnsdfQcdcBSbMTPLb4lcIgouKvOiW/bI5t8x+?=
 =?iso-8859-1?Q?gMu+50sygl043Cah/JD1MK79BQzol8xY1P9WTVARsAFfN8vfMf7U3FZsxx?=
 =?iso-8859-1?Q?8lb9MAqK5FlM6vXoPX7K+QB1740Wu4uC7ZG4n04Bmk37clwNLQWYZlV9GV?=
 =?iso-8859-1?Q?NE+PsrDaFqZepFTuDIl+mHBZvcHFtvlUv6vV69ZGVNlm4REcnqHmaYOMXv?=
 =?iso-8859-1?Q?NRJtH086JhCVv19Fx1DX3K6CT/x1eA9Wdz0qPh/qADD226qOT/PQG1xfQq?=
 =?iso-8859-1?Q?mq+zuMIShgOVbq/o22a5XSALJcxLKaDCVlgnSo2npydEk3fms5CzGMTKuH?=
 =?iso-8859-1?Q?E0fa8sqrnEzn364GsDvtM1AU0Bdnid3p7ZSyqakZgVQIp1lMTHE7vS+lOZ?=
 =?iso-8859-1?Q?v2RiC/J5+IB3sNhisAhjpFN+fw3fz6wySji4Rf444bHkjKxDpsWbGDwxkG?=
 =?iso-8859-1?Q?iqgoIQTe2k6Vnprjm6VGEocjqB+SmdMFQivYNSp3T0D/r6+qUSyiN4Ctgr?=
 =?iso-8859-1?Q?Pt+WxHW0ZU4ST/wm5RDR8yP9U9gjXsRZY6CvT3aUCM/5auJwCK7Z2mTLVp?=
 =?iso-8859-1?Q?WMwfjdu15Dk5LNUiQCZ4irTwXYdXGN9RlyXO2UHfgyNxCuUOplj/kSzs/n?=
 =?iso-8859-1?Q?huSPHDao0xdSOC40i4g1If3RN7VGuBMxKPeM7a/vfFW9Qu22SRajnrT1Sa?=
 =?iso-8859-1?Q?kRKdChtdj/vW1OdqxIHX3pq7Fcm2ashxTSUCieRSK8Od4KapCPXBdr7LJ0?=
 =?iso-8859-1?Q?H8knRcyQxK6v9BSdvexDDQofSPDwQTsnzCNCnBqK+IjxRX4TnZ+VR1LmsU?=
 =?iso-8859-1?Q?NoSy1WiBVcEGCl3Ks9YQs6ZUhStgoWFa+rHE9/xdm4W5q8N7EdYYsmZ2u6?=
 =?iso-8859-1?Q?FxgaGK7Hw2vT+3J62R7LdnoINo7G5nbmLXjzAnJjmo1L97IPJGnbgef3YM?=
 =?iso-8859-1?Q?gC0bJ26VmNdMNeiLW7CT8JHugDSwXBKfHK97TdMHq0ZzwrLziKulAfAqkw?=
 =?iso-8859-1?Q?VThzg+LXWzWP6RNzm1TLOrZKUMm2vW454t6Tz0YR7PzlTNgXWpj6MAfKhV?=
 =?iso-8859-1?Q?IYyzjvFkcks3EAZZdZpalA3VkM1hhcc1apbQaPjCgxCGta5um/P00PmpCO?=
 =?iso-8859-1?Q?dzwIstTZ3QNqZYyKumbBLtO6tzm0Yg7Z0L1qgskCIxDwkWRv2lKoqKItFP?=
 =?iso-8859-1?Q?OZw9I2nwbJjHMKs9IwVBmRsmVxWdQ1YU921pmkY5PXApK/11lUiKI3ix/s?=
 =?iso-8859-1?Q?IiO8vhWXgYY16q22jAZFfAYFcgJohahQ2/k+nI3uSaI98uFAPWQ1sh3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8bb6e7-0454-4e0e-89e9-08dceda4a860
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 05:37:43.6871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01ha75xjuFs8I0PoDVWW3KdOjpKEv5Nuiad9vdrI4aggacQTfD8IpaoEqyn56EV3RsAaLgEIHtIcp6jYuGhw0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
X-OriginatorOrg: intel.com



Hello,

some extra information besides below formal report FYI.

for this commit, we reported
"[linus:master] [mm]  8d59d2214c:  vm-scalability.throughput -36.6% regression"
in
https://lore.kernel.org/all/202401221624.cb53a8ca-oliver.sang@intel.com/

and there is fix in mainline later:
9cee7e8ef3e31 mm: memcg: optimize parent iteration in memcg_rstat_updated()

we noticed the fix is also ported to next branch in OpenCloudOS-Kernel repo,
4486196118e20 mm: memcg: optimize parent iteration in memcg_rstat_updated()

unfortunately, the regression is not recovered on this commit, average data
is 45406623 (close to 0f76dc379d which has 45860861)

not recovered on tip of next branch when this bisect finished, either,
6c7ba3824d4ec Merge linux 6.6.52
the average data is 45417330.


below is formal report.


kernel test robot noticed a -14.1% regression of vm-scalability.throughput on:


commit: 0f76dc379dd65508b7935ee714de6b01457ec1e2 ("mm: memcg: make stats flushing threshold per-memcg")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: vm-scalability
config: x86_64-oc_stream_base_config
compiler: gcc-12
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	runtime: 300s
	test: lru-file-mmap-read
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410161119.c0df2023-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241016/202410161119.c0df2023-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-oc_stream_base_config/debian-12-x86_64-20240206.cgz/300s/lkp-emr-2sp1/lru-file-mmap-read/vm-scalability

commit: 
  e3b1808e92 ("mm: memcg: move vmstats structs definition above flushing code")
  0f76dc379d ("mm: memcg: make stats flushing threshold per-memcg")

e3b1808e927f988c 0f76dc379dd65508b7935ee714d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  28765810 ±  2%     -10.2%   25822944 ±  2%  meminfo.MemFree
      5.00            -0.5        4.45 ±  2%  mpstat.cpu.all.usr%
    654663            -8.6%     598231 ±  3%  vmstat.system.in
   7315498 ±  2%      -9.0%    6659568 ±  4%  numa-meminfo.node1.MemFree
   7403246 ±  4%     -12.3%    6489125 ±  3%  numa-meminfo.node3.MemFree
  18755850 ±  7%     -12.5%   16409530 ±  5%  numa-numastat.node3.numa_miss
  18874924 ±  7%     -12.5%   16520097 ±  5%  numa-numastat.node3.other_node
   1914600 ±  3%     -10.2%    1718760 ±  2%  numa-vmstat.node3.nr_free_pages
  18755850 ±  7%     -12.5%   16409530 ±  5%  numa-vmstat.node3.numa_miss
  18874922 ±  7%     -12.5%   16520097 ±  5%  numa-vmstat.node3.numa_other
    206047           -14.1%     176975 ±  7%  vm-scalability.median
  53379008           -14.1%   45860861 ±  6%  vm-scalability.throughput
    113.83           +14.1%     129.91 ±  7%  vm-scalability.time.elapsed_time
    113.83           +14.1%     129.91 ±  7%  vm-scalability.time.elapsed_time.max
    232416           +14.8%     266726 ±  5%  vm-scalability.time.involuntary_context_switches
     20022            +2.5%      20523        vm-scalability.time.percent_of_cpu_this_job_got
     21361           +18.1%      25224 ±  7%  vm-scalability.time.system_time
      1.77 ± 25%      +1.0        2.81 ± 23%  perf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.__x64_sys_mmap
      0.96 ± 47%      -0.6        0.31 ± 46%  perf-profile.children.cycles-pp.__call_rcu_common
      0.96 ± 47%      -0.6        0.31 ± 46%  perf-profile.children.cycles-pp.call_rcu
      0.16 ±151%      +0.9        1.06 ± 32%  perf-profile.children.cycles-pp.vma_interval_tree_insert
      3.36 ±  7%      +1.1        4.48 ± 16%  perf-profile.children.cycles-pp.__schedule
      2.23 ±  9%      +1.4        3.58 ± 30%  perf-profile.children.cycles-pp.mmap_region
      2.54 ± 16%      +1.4        3.96 ± 29%  perf-profile.children.cycles-pp.do_mmap
      2.60 ± 14%      +1.4        4.04 ± 27%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.16 ±151%      +0.8        0.98 ± 42%  perf-profile.self.cycles-pp.vma_interval_tree_insert
  55820187            +1.0%   56383202        proc-vmstat.nr_file_pages
   7180724 ±  2%      -8.2%    6594348 ±  2%  proc-vmstat.nr_free_pages
  47914103            +2.5%   49132277        proc-vmstat.nr_mapped
    855108            +2.7%     878377 ±  2%  proc-vmstat.nr_page_table_pages
  72185637 ±  2%      -5.9%   67918615 ±  3%  proc-vmstat.numa_foreign
  72162601 ±  2%      -5.9%   67899471 ±  3%  proc-vmstat.numa_miss
  72558638 ±  2%      -5.9%   68295912 ±  3%  proc-vmstat.numa_other
  46304299            +5.2%   48703128 ±  2%  proc-vmstat.pgskip_normal
  12005192 ±  2%     -10.3%   10763578 ±  3%  proc-vmstat.slabs_scanned
      1.38 ± 13%    +111.8%       2.93 ±101%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.ifs_alloc.isra
      0.06 ± 21%     +72.8%       0.10 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.31 ± 35%     +55.0%       2.04 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      0.09 ±  5%     +87.4%       0.17 ± 94%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.47 ± 18%     +31.3%       5.87 ± 22%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
      3.67 ± 15%    +121.0%       8.11 ±106%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_pages
    857.83 ±  9%     +61.0%       1381 ± 33%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_pages
    325.67 ±  8%     +62.3%     528.67 ± 28%  perf-sched.wait_and_delay.count.__cond_resched.rmap_walk_file.try_to_unmap.shrink_folio_list.evict_folios
    354.56 ±128%    +487.9%       2084 ±137%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_pages
      2.03 ± 27%    +126.9%       4.60 ± 97%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_pages
      1.38 ± 13%    +111.9%       2.93 ±101%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.ifs_alloc.isra
      5.48 ±  8%    +197.5%      16.30 ±133%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
    344.03 ±134%    +300.0%       1376 ± 96%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_pages
 6.119e+10            -9.1%  5.564e+10 ±  5%  perf-stat.i.branch-instructions
  57502277           -10.7%   51364983 ±  5%  perf-stat.i.branch-misses
     57.22            -1.3       55.96        perf-stat.i.cache-miss-rate%
  5.86e+08            -9.6%  5.294e+08 ±  6%  perf-stat.i.cache-misses
 1.058e+09            -8.7%   9.66e+08 ±  6%  perf-stat.i.cache-references
      2.45           +14.2%       2.80 ±  4%  perf-stat.i.cpi
    853.29           +16.3%     991.96 ±  6%  perf-stat.i.cycles-between-cache-misses
 2.118e+11            -8.6%  1.935e+11 ±  4%  perf-stat.i.instructions
      0.58 ±  3%     -11.0%       0.51 ±  8%  perf-stat.i.ipc
    301258 ±  2%     -11.5%     266686 ±  7%  perf-stat.i.major-faults
      4.35 ±  3%     -18.1%       3.56 ± 16%  perf-stat.i.metric.K/sec
    302076 ±  2%     -11.2%     268175 ±  7%  perf-stat.i.minor-faults
    603335 ±  2%     -11.3%     534861 ±  7%  perf-stat.i.page-faults
      0.09            -0.0        0.09        perf-stat.overall.branch-miss-rate%
     55.42            -0.6       54.81        perf-stat.overall.cache-miss-rate%
      2.79           +10.9%       3.10        perf-stat.overall.cpi
      1004           +12.3%       1127 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.36            -9.8%       0.32 ±  2%  perf-stat.overall.ipc
 6.104e+10            -9.7%  5.512e+10 ±  4%  perf-stat.ps.branch-instructions
  56686906           -11.9%   49959672 ±  5%  perf-stat.ps.branch-misses
 5.876e+08           -10.3%  5.274e+08 ±  5%  perf-stat.ps.cache-misses
  1.06e+09            -9.3%  9.623e+08 ±  5%  perf-stat.ps.cache-references
 2.112e+11            -9.2%  1.917e+11 ±  4%  perf-stat.ps.instructions
    300744           -12.2%     264036 ±  6%  perf-stat.ps.major-faults
    300295           -12.0%     264366 ±  6%  perf-stat.ps.minor-faults
    601040           -12.1%     528402 ±  6%  perf-stat.ps.page-faults
   2384591          +134.9%    5602232 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.avg
   2487480          +136.2%    5874980 ± 19%  sched_debug.cfs_rq:/.avg_vruntime.max
    294133 ±  4%    +107.3%     609757 ± 32%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.05 ±  9%     +48.2%       0.07 ± 18%  sched_debug.cfs_rq:/.h_nr_running.stddev
      3104 ± 14%     +80.9%       5616 ± 23%  sched_debug.cfs_rq:/.load.avg
   2384591          +134.9%    5602232 ± 20%  sched_debug.cfs_rq:/.min_vruntime.avg
   2487480          +136.2%    5874980 ± 19%  sched_debug.cfs_rq:/.min_vruntime.max
    294133 ±  4%    +107.3%     609757 ± 32%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.03 ± 12%     +79.6%       0.05 ± 21%  sched_debug.cfs_rq:/.nr_running.stddev
     36.18 ±  8%     +48.9%      53.88 ± 25%  sched_debug.cfs_rq:/.util_avg.stddev
     41.31 ±  5%     +33.0%      54.96 ± 23%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    228160           +32.2%     301718 ± 19%  sched_debug.cpu.avg_idle.avg
     51630 ±  7%     +65.4%      85419 ± 48%  sched_debug.cpu.avg_idle.min
     17377           +79.2%      31138 ± 16%  sched_debug.cpu.clock.avg
     17389           +79.1%      31149 ± 16%  sched_debug.cpu.clock.max
     17365           +79.2%      31125 ± 16%  sched_debug.cpu.clock.min
     17377           +79.2%      31138 ± 16%  sched_debug.cpu.clock_task.avg
     17389           +79.1%      31149 ± 16%  sched_debug.cpu.clock_task.max
     17365           +79.2%      31125 ± 16%  sched_debug.cpu.clock_task.min
      1761 ±  5%     +61.4%       2844 ± 19%  sched_debug.cpu.curr->pid.max
    222.57 ±  3%     +58.9%     353.62 ± 34%  sched_debug.cpu.curr->pid.stddev
    125027           +28.7%     160896 ± 18%  sched_debug.cpu.max_idle_balance_cost.avg
    131668 ± 11%     +44.7%     190497 ± 17%  sched_debug.cpu.max_idle_balance_cost.max
      1073           +28.6%       1380 ± 18%  sched_debug.cpu.next_balance.avg
      1073           +28.6%       1380 ± 18%  sched_debug.cpu.next_balance.max
      1073           +28.6%       1380 ± 18%  sched_debug.cpu.next_balance.min
    341.33           +79.9%     614.09 ± 18%  sched_debug.cpu.nr_switches.avg
     88.98 ±  4%    +107.0%     184.19 ± 20%  sched_debug.cpu.nr_switches.min
    518.41 ±  8%     +32.9%     689.06 ± 19%  sched_debug.cpu.nr_switches.stddev
     17365           +79.3%      31129 ± 16%  sched_debug.cpu_clk
 1.074e+09           +28.6%   1.38e+09 ± 18%  sched_debug.jiffies
     17065           +80.2%      30745 ± 16%  sched_debug.ktime
     17823           +82.6%      32539 ± 18%  sched_debug.sched_clk




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


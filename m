Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F810A1F
	for <oe-lkp@lists.linux.dev>; Tue, 22 Apr 2025 03:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745290966; cv=fail; b=Dg94gD/MPtppA77DG/C9Ps+ZzJk/8pHfc+hDpcjUuveH4/OfBqqsK3A6ANg7XRMt9PrDM09QvUYQ16yRXZ7LzxttPeQIPYWLMjNJ7+0chgycpj9zg7JtCdm+l+3y5Hm1cmgh0NOS4qb2LuiRy4NiBiff1wdjd+dNPMwvfMj56Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745290966; c=relaxed/simple;
	bh=2nf7o5bb9F1I7NBa25WtIAs1skMzL5CyuFaiwAHHuCo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jqfxd8hQ20BNP92ZgkLxsXLtw7SJtc9re7sDI82FMzBlNdUY4D9y4V48UCLQ8TG/2/jxXCKLeRtrK2Wcb5issBQ65ppdMO3zXOpVjeAA7fa2I/SNfSKM9AJHK4QCPxuSUFs2j7TyLUNEDToVqogCPBcayIozKCZGorbfLNRzpGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqRJXFT8; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqRJXFT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745290965; x=1776826965;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2nf7o5bb9F1I7NBa25WtIAs1skMzL5CyuFaiwAHHuCo=;
  b=QqRJXFT8tZ3HmrYHGzMBKSqohWRiyf/pc3y+Y8KXrUgeTLK5iHx+bc8Z
   XYM2/F/Cm/hyy3mk0m4orc9HAww2ZctpvJTZZKc4NX+wgWPZQobo+Wlw+
   SPTHdXzY40gxCPJn2+qENVSclPhqm9xLSSEIntLvWQq6LCvFFJoKVFmXc
   kewlO5ampSicn8i0u020JvPjqs0oC7iLkOtGNYPkouiDjXYm/LvOnF7SE
   HFXdIZrntyEkP6eowb05ojuxSlCTUYkzvmskWQx9+lkfguNdFU5cXbgc+
   rleWER/DiuLOC8XynXTsXv4Rs2+o/u/VKZWyupjR+yQ8eRjCSB8xHSYLM
   Q==;
X-CSE-ConnectionGUID: eViZ58rDQZ6pMUYyDk7vZw==
X-CSE-MsgGUID: 6ZfDqBbUR7eE+FOh271C/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57816646"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="57816646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 20:02:43 -0700
X-CSE-ConnectionGUID: 8Dck2nrvTNqfT5mvgqi5fg==
X-CSE-MsgGUID: IozDqo7XSjCwvNBV5lMtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="131734133"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 20:02:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 20:02:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 20:02:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 20:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsB0MQUPuFO4RpMhKTcjiy64JbIwQiqxal+eHGofzl6J0cNnx21hvGtdsLT7sRJl0U7CsB0elsYSEQ6U4GNtHTNrAN4PixjGIfcI8Kpn8ocSAlzQKzar86s6f8jaWkmE0bQ1LFxWR6bd2anaH8DV5QJcP+s0CtuOopLS72mBiaU9zCvlHWuDrQ9uM5hv30mukiDUA+Xf+/w09VGroudjrlJrIQdgK3LF9PKuSyB6R3T2U+tjcWVxSuKb6n+jnGZotvWuptZ3l/giAs2pAx7tPNYu6rA6RYnlHL1eq5k2927pls81G21oLfGtEPpWy1scCyg/KYby3NDm17rXznbRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0j8unlQySuWCXsqmO3Aj4NZ17yliXL+LVlAJUNPzZbo=;
 b=TecuLrZlW5DAR3dRhU0i02WFlpvv2fLISXjGpNFAnJwva/fdfpIsgSojgiw8JNneFnIECE/hhTEEsAWQcja1uXHBPji8gRnZflDUfvW7n0fAlosllFStLLHzrulUlf8GO/Ro+GAlzOdWNZPw7v1MeLPfJUZPGLVCuLs9DnUiWiunqlrKHBQkR78+RlAMrCv8Y8xjfBoCDKC3YoOtRKEmRSScRxsDlYPx/38OKcPOaDk1dnjAe5qO7BjQok0UtPBi0o8nxBQT8CCgpXTspjuVosXQ3aDSyefAS59dkjA3ib1vw0SxAcS5p/JS/F8wC/eM2DgCN5FcCjQHPDIw4ZqK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PPFEF920636F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 03:02:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 03:02:39 +0000
Date: Tue, 22 Apr 2025 11:02:31 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-lkp@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: RFB: unrolled inline memset and memcpy
Message-ID: <aAcGx4Pw/1Pqv2gp@xsang-OptiPlex-9020>
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
 <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
 <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020>
 <CAGudoHGD0EhEajMCxdQ3f5sjzsSJhZUb6c+rfAjFGx_9S7hqoA@mail.gmail.com>
 <aAHGFnIUoRbv1ppd@xsang-OptiPlex-9020>
 <CAGudoHEPkKy6b7u_0LaYUqHJRtyggacbhTtnA8sNuZpELr-ocg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="yGp0anQ6OcOxfAnY"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHEPkKy6b7u_0LaYUqHJRtyggacbhTtnA8sNuZpELr-ocg@mail.gmail.com>
X-ClientProxiedBy: KL1PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:820::26) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PPFEF920636F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1b8bc7-4a7a-4821-2c92-08dd814a244e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmdWK3R1aTVDd3Y4SG85cy9zVE5lNlFyUGR2YlNzZkVuSWJWaEdoR0RmTElm?=
 =?utf-8?B?UDlBK3dxY1lIQjNyU3d6YUk0TGwvQnZ1SGNaYVpwK2lVMUNCcDJPZjkwK2JT?=
 =?utf-8?B?Y0FITWMzWk5JcS9yZU9rZnBpK09meDRDVnNkK1laTUdrdktUd3h5SFRHdGZH?=
 =?utf-8?B?b1ZZTUtHWEZMRnR0NUhwVm1uS1l3bjBMaEozMUgxTEVPUnpXQytzMTJlMXNk?=
 =?utf-8?B?VjFrclFRalE2M1Q4RDRRZXFWWXNxMFpwQ0pISndZcUdYR01kK045TzY4MVZi?=
 =?utf-8?B?eDM0TE5qYzQ1SjlnWFl4VHdiTG5CbDZPalNKbWQzeFZ2MlNNblhFUURPRHVu?=
 =?utf-8?B?aS84R251ZUI0WTdFNmg3ZmlKeS9kdlU5N1V2bFhTc0VLZU1md1pzcEw5anE1?=
 =?utf-8?B?MzYwS3Q1MG8zby9BTzc3aU1qY291WURQNHo2aGZ1NHlyMmtGV043TGEwVCtk?=
 =?utf-8?B?Q3V0eGJBM0JKNmZxWjBvQUtSRDgrc0t4bEplZ2Rta2hzcGFtdjVLY3pHUEdD?=
 =?utf-8?B?M2lFMGdoNExaZmNzTDJTNThGVEw1UElENVdnNnZpN0ZCcy9xYXQ2MkdKRXg5?=
 =?utf-8?B?MkduaytYSkVCVFRYOHFoNCtyWU9EYm9UMVBDMkFVOEpXMWR5a0ZRZGxYWjVi?=
 =?utf-8?B?c2xHQXZtT1grbmdmK0RhM2Q5YTNkKzU0Mkh1K25JdWlKTXM1SEp2TjlDMEx0?=
 =?utf-8?B?Z2lKL3NvNGJPTUtTMjRDb3lDdmV4cTZTU0oyVElDbW1YT3MzK0NqWCt1ZXE0?=
 =?utf-8?B?bHZ1Y1dpNm1INWlTOGR6TFF0N0ZFbFRDQTM4dkxBcXRxWXl6RHVDL2ZaUnVw?=
 =?utf-8?B?UDY4RmwxZC9tc00yT1M4cUc0ZER6TnBQTjBwTktjSmtla2NjamIwT3haZGpR?=
 =?utf-8?B?RjBuSDd2c1E1cWMwUnkzUlF1UzZTSnQ5T01vTTRzeXQrN0U2MXBGSE5MZFlH?=
 =?utf-8?B?ZHBwWitUeE9WV0Q2amRpcnlXR3JmWllKdldsd293ZW1YYmliMEZXcVo1dWJl?=
 =?utf-8?B?L3hNM205OXZGYXNCNS92U2ZVdHg1MmtLZEdNK3MvVmNFdGx0d2trdUlROW1w?=
 =?utf-8?B?N0lLR1REbGJlNGU0eTB5bklGQW9uZjFBVnRrQjFNRUZhNHVhaXdnNXBJRFdP?=
 =?utf-8?B?S2dOVkhDTEdnUVNEM3lhWXc2Z2VmVXhubUI4cWVYVUhUcFZuOU1HL2Z3SW9G?=
 =?utf-8?B?TWlCdFdJSmhHbnVPS1c4Y1VyQmRVTjQzOENBT2NzOVNTZi9DS3oyL2w5WUtH?=
 =?utf-8?B?akVCekdzc0ZLQUtJaWpkMGpxOUtKcmd6UVp2L0FTVm1aazE5dUpnakZTOHVE?=
 =?utf-8?B?M2tWV01Vc3N6cXhJQkNwMWp1RnBKUi90ZHpjdkhFZWVPNEdGM3BLS1U0REFz?=
 =?utf-8?B?VEYzU2FkVVpzemMwWW5icXV1VTEzekFDTnZlZGtHeUZsa2t5QXFBUWsrQ1pz?=
 =?utf-8?B?ZzNZK0crVGcydG50eVp5MlFXY2hZL05yMXBxQ1pQRGp0V0Z6ejlLMWZJNEZo?=
 =?utf-8?B?QzZldzRSck0xS1VUWWtiQ2JyZFpKT1lxZUh3R1VTUHpaRm9KOTZUMzZFWWo4?=
 =?utf-8?B?N2RVZ1pFYm00cE9CdW9zTkkrUTc3bzFrYVdOQnpnRTlxN3dpYWdzVDBKc2lF?=
 =?utf-8?B?YXhxUkdyandIZnhhMnZOcjVpOXNFLytsbXBIQjA0VHI3VTIwSGFxZDAxVW9q?=
 =?utf-8?B?aUtiYVZrbUFySzNOeXcrem5IV01RWE85RkxBZTY1eEd6QWZkR0MxaWpkelRp?=
 =?utf-8?B?VW1lTTA1TUdaZ1kzQmZHNFBuN3pVYVBlZkErY0dlSXV0bVhqbmpqdVlUUFdv?=
 =?utf-8?Q?OO5SpOkR85G2ADfrB/DraHHZQyxZa5i78ccBI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkIyNi9halVhNFgvRDFsL1B6NzJKeWRuUHNBbFZhTndYOHY3OS9vajJHZGpY?=
 =?utf-8?B?eUJ5bHRJODlhdnhGVFdnQ0VTalN0VmV6RDJrS3Ewc2F1WFVWR3h4dmJTYWVq?=
 =?utf-8?B?UTB5ZjErRVBZZFdPTVpNL1g2MU1FVVVYcVZxU2tGNzNCZzh1SVA4Q2dvSlJO?=
 =?utf-8?B?RFhrdnRaOHIrWU5LT3B6K1YyNTRaZ2IrVUg4WkJ6K2laYTF2SjJ1NjU3WmF1?=
 =?utf-8?B?d2ZMa0NmQjN5aTcwU1FwNHhvcHNpLzF1b052VExGK2hBcGVUa3lrdmlaZGxa?=
 =?utf-8?B?YTFPN3ErSnlpMTFESTA4UmU4Q3k2alBVc0kwMitVL005V0NMTzl4dyt3V3g1?=
 =?utf-8?B?ZU1QbWdCenJYZ0JYcWV0OE9PY0RmSnV4R0pOZUFZUXY3NHJON0tvdUc3Ylhl?=
 =?utf-8?B?TzFnZ1Z0bnhXNDlWWE1GcnFVeUY1QWlCblNrZG4yUXdSWCtIeEJYK2YxUzhW?=
 =?utf-8?B?eVZDTXJsQkVPYktVd05seDE2K290d1B4emhGQW5PQnJUb08zcUhRd2hSdWpk?=
 =?utf-8?B?L1EzYnVaVWNPelNqcUV6REQ0Uk9hVDN0Y2FuaFlXOGlOVk1RSGI1TXB3ek9z?=
 =?utf-8?B?c0dmdUJiSDZ2WHNrMHBhTlNqMGtyS2NFYVdyWUZUcWlTUDJhd0U4VW1Lc2p6?=
 =?utf-8?B?VW5HRE9MOWE4cGt4d1JRdXpNaGM2anR4cjlQeGZDNjVtZ08wUDRuRzVmaXRq?=
 =?utf-8?B?L0JvcWNvTjdneGQxVWRKSTEvRU00dzkzWTlOTDZUaFI1NExwZVFhSFlzQkN3?=
 =?utf-8?B?cjlZWmo0K29BSk11dk9XUWFpcUt5QzFRZ3VNRjFsZEpjODhZRUZqME9xODkr?=
 =?utf-8?B?RTRFZE1UMkozelhJM0ZTUVNzdUJUYzRiL0htcHlEcy9QMnV4d05VRkpnakdS?=
 =?utf-8?B?cUhIZHdWQm1pQVZQWkR5MEo5Vi9jSG9ISWhSOVdTcFkvU2ppNEc4emNVU0lV?=
 =?utf-8?B?RXdQRWZnNkxFZmg5Qmc5NHNWdGlFOVRLSzV4OU9xeVlkOEtvcHovaDNRUVM1?=
 =?utf-8?B?R2poaEVrN0pyTmVPbXVVdm9DeEtsem5VWkRKSDZEcmNxZXZjZTRWcEduTXpC?=
 =?utf-8?B?eStUblJvYUxYWldUK2xsM0hqVVdrc0RoMUJoelMxTk8wRjNmdjluM05WdmtY?=
 =?utf-8?B?QjNOcitlUzViWkltK09GUktiWTIwWUhLVFY1bVExYnhSY0VzWGR3bkxzNXlk?=
 =?utf-8?B?a1NwQVR3SUExQ2JkcUZNcTBkMzlHanJJNUE4Mkw5VldvNFE1azBzVnUxYVJW?=
 =?utf-8?B?cVg4d3pZcG1EaWRUUmUxWGVLMFZzZFUxelZUTmtmbzhBcklHUDNMb1JPLzB2?=
 =?utf-8?B?Ym5CTFl6U0g2QjRoZjRRYkVnVHk4RUZLdHNWdUtFSk8xYWJBOFdaNG8yWUZK?=
 =?utf-8?B?M0ZSVTEvY3hONVpiRUI4SjB3SGZIdnZiU1Y3UWV3aVV2eVlvZ0szOG8zSnNN?=
 =?utf-8?B?YXp6NjFaSDgvVjB6TnRzbDlBd0taNmNzaG1XUVZrRWVqd2VuMDViQkY4dUox?=
 =?utf-8?B?YzVwR01UNDhtcU82aWJqUlVMc3I3U1d4ZGo4cmRmMnhtT3h3SUc0K2JWNG5S?=
 =?utf-8?B?UXFhdkhZV09PRGZOeGdJMGd0ZGlqUFMrQ29wYytmSy8wVENZU3hvQVdpK2ti?=
 =?utf-8?B?TllkUGQvUC9iNFhnb2ZkZ0puZElxR3psMFVWN25JUHR0UUNFOTlPM2NSMjc5?=
 =?utf-8?B?Qlp1bnFubGNJdFFBdzNQM1E0bTdza0dGdXJPR1B3d1BrazI4UHZlVEIyaFh0?=
 =?utf-8?B?T0tIQ2lZVTFXSUwrYXNoVUZzQVZ3RTZaWEV2d0lFZEpSdmhtZDRwK1JQTzR2?=
 =?utf-8?B?akNTSU5uZDQxaXNYcnV4VlFLdzdyMG9vNG1lNHdPcWtuWVRRR3h3d1oxMzFs?=
 =?utf-8?B?SVJuNnorUWdFM2VPem1PQnQwcWpIdXIyT2RobUlvMDd5UVB6eTUrUlA2Rno0?=
 =?utf-8?B?R1NKOXJDZ3NBRThsWEFFMUlFalFLM3pPWWF4OGEweWQ2THl2eHUrWXQvOTlq?=
 =?utf-8?B?bHlkZmZyalRpcEcrSmxHb1A0MTNadWhOcmFaQTFRbFNRQlQyQjNQMVcxbFkr?=
 =?utf-8?B?c1R6QzN5Z295TkE4UWc0THZSVFVuQndmWkVBWXVvTE5NcC9ocEt1ZGxJZk1n?=
 =?utf-8?B?dEdWTHF1UVM5L2Nma2xYY0ZQUzBuYW94ODJLUnBDZlh3aDhTWnhVY1UxZWlV?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1b8bc7-4a7a-4821-2c92-08dd814a244e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 03:02:39.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdBjNwB3Mv6vDPS6clHnIurhP5MsSZazluS0h2olYmxd5dMeorhuY609XYYTm2t7aQ5Ix1Li0C4cZBLkHfdp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEF920636F
X-OriginatorOrg: intel.com

--yGp0anQ6OcOxfAnY
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

hi, Mateusz Guzik,

On Fri, Apr 18, 2025 at 10:06:08PM +0200, Mateusz Guzik wrote:
> On Fri, Apr 18, 2025 at 5:25 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > for 76a45d86f78bc (mjguzik/lkp-bench) x86: prevent gcc from emitting rep movsq/stosq for inlined ops
> > the report spots out several small improvements on different platforms, both on
> > Cooper Lake which does not support FSRM, and Sapphire Rapids/Ice Lake which can.
> >
> > there is also a small regression from lmbench3 test, but in fact:
> >       0.13            -4.3%       0.12        lmbench3.syscall.fstat.latency.us
> 
> fstat getting faster lines up with my own measurements
> 
> >       0.47            +1.5%       0.48        lmbench3.syscall.open/close.latency.us
> >
> 
> this does not
> 
> can you share the kernel config + filesystems used + the file being
> passed to open?

we uploaded the config and reproducer in
https://download.01.org/0day-ci/archive/20250422/202504221059.58105fc3-lkp@intel.com

we are using debian-12.

not sure what's "the file being passed to open"?

I attached on lmbench3 log, there is
[FILE: /var/tmp/XXX]
within it. but it seems we don't log this XXX file.

is it generated by lmbench3 testcase itself?


> 
> 
> 
> -- 
> Mateusz Guzik <mjguzik gmail.com>

--yGp0anQ6OcOxfAnY
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="lmbench3"

cd src && make
make[1]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Nothing to be done for 'all'.
gmake[2]: Leaving directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Nothing to be done for 'opt'.
gmake[2]: Leaving directory '/lkp/benchmarks/lmbench3/src'
make[1]: Leaving directory '/lkp/benchmarks/lmbench3/src'
2025-04-16 09:41:57 
	(
		echo 1
		echo 1
		echo 10240
		echo development

		echo yes
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no
		echo no

		echo yes
		echo
		echo
		echo
		[ 1 -eq 1 ] && echo
		echo no
	) | make results 
cd src && make results
make[1]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Nothing to be done for 'all'.
gmake[2]: Leaving directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Entering directory '/lkp/benchmarks/lmbench3/src'
gmake[2]: Nothing to be done for 'opt'.
gmake[2]: Leaving directory '/lkp/benchmarks/lmbench3/src'
=====================================================================

		L M B E N C H   C ON F I G U R A T I O N
		----------------------------------------

You need to configure some parameters to lmbench.  Once you have configured
these parameters, you may do multiple runs by saying

	"make rerun"

in the src subdirectory.

NOTICE: please do not have any other activity on the system if you can
help it.  Things like the second hand on your xclock or X perfmeters
are not so good when benchmarking.  In fact, X is not so good when
benchmarking.

=====================================================================

Hang on, we are calculating your timing granularity.
OK, it looks like you can time stuff down to 10000 usec resolution.

Hang on, we are calculating your timing overhead.
OK, it looks like your gettimeofday() costs 0 usecs.

Hang on, we are calculating your loop overhead.
OK, it looks like your benchmark loop costs 0.00000000 usecs.

=====================================================================

If you are running on an MP machine and you want to try running
multiple copies of lmbench in parallel, you can specify how many here.

Using this option will make the benchmark run 100x slower (sorry).

NOTE:  WARNING! This feature is experimental and many results are 
	known to be incorrect or random!

MULTIPLE COPIES [default 1] Options to control job placement
1) Allow scheduler to place jobs
2) Assign each benchmark process with any attendent child processes
   to its own processor
3) Assign each benchmark process with any attendent child processes
   to its own processor, except that it will be as far as possible
   from other processes
4) Assign each benchmark and attendent processes to their own
   processors
5) Assign each benchmark and attendent processes to their own
   processors, except that they will be as far as possible from
   each other and other processes
6) Custom placement: you assign each benchmark process with attendent
   child processes to processors
7) Custom placement: you assign each benchmark and attendent
   processes to processors

Note: some benchmarks, such as bw_pipe, create attendent child
processes for each benchmark process.  For example, bw_pipe
needs a second process to send data down the pipe to be read
by the benchmark process.  If you have three copies of the
benchmark process running, then you actually have six processes;
three attendent child processes sending data down the pipes and 
three benchmark processes reading data and doing the measurements.

Job placement selection: =====================================================================

Several benchmarks operate on a range of memory.  This memory should be
sized such that it is at least 4 times as big as the external cache[s]
on your system.   It should be no more than 80% of your physical memory.

The bigger the range, the more accurate the results, but larger sizes
take somewhat longer to run the benchmark.

MB [default 360535] Checking to see if you have 10240 MB; please wait for a moment...
Hang on, we are calculating your cache line size.
OK, it looks like your cache line is  bytes.

=====================================================================

lmbench measures a wide variety of system performance, and the full suite
of benchmarks can take a long time on some platforms.  Consequently, we
offer the capability to run only predefined subsets of benchmarks, one
for operating system specific benchmarks and one for hardware specific
benchmarks.  We also offer the option of running only selected benchmarks
which is useful during operating system development.

Please remember that if you intend to publish the results you either need
to do a full run or one of the predefined OS or hardware subsets.

SUBSET (ALL|HARWARE|OS|DEVELOPMENT) [default all] =====================================================================
SYSCALL [default yes] SELECT [default yes] PROCESS CREATION [default yes] PAGEFAULT [default yes] FILE [default yes] MMAP [default yes] CONTEXT SWITCH [default yes] PIPE [default yes] UNIX socket [default yes] UDP [default yes] TCP [default yes] TCP CONNECT [default yes] RPC [default yes] HTTP [default yes] BCOPY [default yes] MEMORY HIERARCHY [default yes] CPU OPERATIONS [default yes] =====================================================================

This benchmark measures, by default, file system latency.  That can
take a long time on systems with old style file systems (i.e., UFS,
FFS, etc.).  Linux' ext2fs and Sun's tmpfs are fast enough that this
test is not painful.

If you are planning on sending in these results, please don't do a fast
run.

If you want to skip the file system latency tests, answer "yes" below.

SLOWFS [default no] =====================================================================

If you are running on an idle network and there are other, identically
configured systems, on the same wire (no gateway between you and them),
and you have rsh access to them, then you should run the network part
of the benchmarks to them.  Please specify any such systems as a space
separated list such as: ether-host fddi-host hippi-host.

REMOTE [default none] =====================================================================

Calculating mhz, please wait for a moment...
I think your CPU mhz is 

	3794 MHz, 0.2636 nanosec clock
	
but I am frequently wrong.  If that is the wrong Mhz, type in your
best guess as to your processor speed.  It doesn't have to be exact,
but if you know it is around 800, say 800.  

Please note that some processors, such as the P4, have a core which
is double-clocked, so on those processors the reported clock speed
will be roughly double the advertised clock rate.  For example, a
1.8GHz P4 may be reported as a 3592MHz processor.

Processor mhz [default 3794 MHz, 0.2636 nanosec clock] =====================================================================

We need a place to store a 10240 Mbyte file as well as create and delete a
large number of small files.  We default to /usr/tmp.  If /usr/tmp is a
memory resident file system (i.e., tmpfs), pick a different place.
Please specify a directory that has enough space and is a local file
system.

FSDIR [default /var/tmp] =====================================================================

lmbench outputs status information as it runs various benchmarks.
By default this output is sent to /dev/tty, but you may redirect
it to any file you wish (such as /dev/null...).

Status output file [default /dev/tty] =====================================================================

There is a database of benchmark results that is shipped with new
releases of lmbench.  Your results can be included in the database
if you wish.  The more results the better, especially if they include
remote networking.  If your results are interesting, i.e., for a new
fast box, they may be made available on the lmbench web page, which is

	http://www.bitmover.com/lmbench

Mail results [default yes] OK, no results mailed.
=====================================================================

Confguration done, thanks.

There is a mailing list for discussing lmbench hosted at BitMover. 
Send mail to majordomo@bitmover.com to join the list.

make[1]: Leaving directory '/lkp/benchmarks/lmbench3/src'
[lmbench3.0 results for Linux lkp-spr-2sp4 6.15.0-rc1-00066-g76a45d86f78b #1 SMP Wed Apr 16 16:05:01 CST 2025 x86_64 GNU/Linux]
[LMBENCH_VER: ]
[BENCHMARK_HARDWARE: NO]
[BENCHMARK_OS: NO]
[ALL: 512 1k 2k 4k 8k 16k 32k 64k 128k 256k 512k 1m 2m 4m 8m 16m 32m 64m 128m 256m 512m 1024m 2048m 4096m 8192m]
[DISKS: ]
[DISK_DESC: ]
[ENOUGH: 10000]
[FAST: ]
[FASTMEM: NO]
[FILE: /var/tmp/XXX]
[FSDIR: /var/tmp]
[HALF: 512 1k 2k 4k 8k 16k 32k 64k 128k 256k 512k 1m 2m 4m 8m 16m 32m 64m 128m 256m 512m 1024m 2048m 4096m]
[INFO: INFO.lkp-spr-2sp4]
[LINE_SIZE: ]
[LOOP_O: 0.00000000]
[MB: 10240]
[MHZ: 3794 MHz, 0.2636 nanosec clock]
[MOTHERBOARD: ]
[NETWORKS: ]
[PROCESSORS: 224]
[REMOTE: ]
[SLOWFS: YES]
[OS: x86_64-linux-gnu]
[SYNC_MAX: 1]
[LMBENCH_SCHED: DEFAULT]
[TIMING_O: 0]
[LMBENCH VERSION: lmbench-3alpha4]
[USER: ]
[HOSTNAME: lkp-spr-2sp4]
[NODENAME: lkp-spr-2sp4]
[SYSNAME: Linux]
[PROCESSOR: unknown]
[MACHINE: x86_64]
[RELEASE: 6.15.0-rc1-00066-g76a45d86f78b]
[VERSION: #1 SMP Wed Apr 16 16:05:01 CST 2025]
[Wed Apr 16 09:42:21 UTC 2025]
[ 09:42:21 up 1 min, 0 user, load average: 3.35, 1.04, 0.37]
[net: Kernel Interface table]
Kernel: error fetching interface information: Device not found
[net: Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg]
Iface: error fetching interface information: Device not found
[net: eth0             1500       49      0     25 0            27      0      0      0 BMRU]
[if: eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500]
[if: inet 192.168.3.215  netmask 255.255.255.0  broadcast 192.168.3.255]
[if: inet6 fe80::527c:6fff:fe51:8754  prefixlen 64  scopeid 0x20<link>]
[if: ether 50:7c:6f:51:87:54  txqueuelen 1000  (Ethernet)]
[if: RX packets 49  bytes 8038 (7.8 KiB)]
[if: RX errors 0  dropped 25  overruns 0  frame 0]
[if: TX packets 27  bytes 4966 (4.8 KiB)]
[if: TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0]
[if: device memory 0xe1500000-e15fffff]
[if: ]
[net: lo              65536        0      0      0 0             0      0      0      0 LRU]
[if: lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536]
[if: inet 127.0.0.1  netmask 255.0.0.0]
[if: inet6 ::1  prefixlen 128  scopeid 0x10<host>]
[if: loop  txqueuelen 1000  (Local Loopback)]
[if: RX packets 0  bytes 0 (0.0 B)]
[if: RX errors 0  dropped 0  overruns 0  frame 0]
[if: TX packets 0  bytes 0 (0.0 B)]
[if: TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0]
[if: ]
[mount: rootfs on / type rootfs (rw)]
[mount: proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)]
[mount: sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)]
[mount: devtmpfs on /dev type devtmpfs (rw,nosuid,size=263092748k,nr_inodes=65773187,mode=755,inode64)]
[mount: securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)]
[mount: tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,inode64)]
[mount: devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)]
[mount: tmpfs on /run type tmpfs (rw,nosuid,nodev,size=105482616k,nr_inodes=819200,mode=755,inode64)]
[mount: tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k,inode64)]
[mount: cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate,memory_recursiveprot)]
[mount: none on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime)]
[mount: efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)]
[mount: bpf on /sys/fs/bpf type bpf (rw,nosuid,nodev,noexec,relatime,mode=700)]
[mount: systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=30,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=78910)]
[mount: hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,pagesize=2M)]
[mount: mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)]
[mount: debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime)]
[mount: tracefs on /sys/kernel/tracing type tracefs (rw,nosuid,nodev,noexec,relatime)]
[mount: configfs on /sys/kernel/config type configfs (rw,nosuid,nodev,noexec,relatime)]
[mount: ramfs on /run/credentials/systemd-sysctl.service type ramfs (ro,nosuid,nodev,noexec,relatime,mode=700)]
[mount: ramfs on /run/credentials/systemd-sysusers.service type ramfs (ro,nosuid,nodev,noexec,relatime,mode=700)]
[mount: fusectl on /sys/fs/fuse/connections type fusectl (rw,nosuid,nodev,noexec,relatime)]
[mount: ramfs on /run/credentials/systemd-tmpfiles-setup-dev.service type ramfs (ro,nosuid,nodev,noexec,relatime,mode=700)]
[mount: ramfs on /run/credentials/systemd-tmpfiles-setup.service type ramfs (ro,nosuid,nodev,noexec,relatime,mode=700)]
[mount: sunrpc on /run/rpc_pipefs type rpc_pipefs (rw,relatime)]
[mount: binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,nosuid,nodev,noexec,relatime)]
[mount: tmp on /tmp type tmpfs (rw,relatime,inode64)]
[mount: /dev/nvme0n1p4 on /opt/rootfs type btrfs (rw,relatime,ssd,discard=async,noacl,space_cache,subvolid=5,subvol=/)]
Simple syscall: 0.0665 microseconds
Simple read: 0.1009 microseconds
Simple write: 0.0794 microseconds
Simple stat: 0.2641 microseconds
Simple fstat: 0.1247 microseconds
Simple open/close: 0.4741 microseconds

[Wed Apr 16 09:42:26 UTC 2025]

--yGp0anQ6OcOxfAnY--

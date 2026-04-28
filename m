Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4B274B23
	for <oe-lkp@lists.linux.dev>; Tue, 28 Apr 2026 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355450; cv=fail; b=qjH8kRoOP+hsWoYMbzhCOKo6lXy+W+GXuBUjaY47QncFb+JjzMJYuVz3+uOxI2kMoSl6xahlNOfC1+vxl2tRM1CuDwo0N8364UaQm4H21th4PwEWlSkrdHZdKFiUzotS8Vemd0WmJW7soD/AnPX1Tgrx0AVdHyKtIMTB40sN/r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355450; c=relaxed/simple;
	bh=IPLwNvSkIpPi9BALtTM/ZrGkg86Jixg+Ic2SmVkokrQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kC/yQ095FfrT9kyUp8d5Kp5IAjS9BM6xhsS1oyONGnMUwOvc5eMj0JS0kig8+Khzf8pDuyR1tiZ8MhmNpScaZiZDXZPLPIL5Uq/iFNPNgefr67pAhb80yje/SsMVyvjinP2h9oHjKxCT/H8Ew+GGjemlBnkPOjUwhYQMe8J4KLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzHgfmBE; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzHgfmBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777355448; x=1808891448;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=IPLwNvSkIpPi9BALtTM/ZrGkg86Jixg+Ic2SmVkokrQ=;
  b=lzHgfmBEEpvGXl/K5rTYxbg3IuLFdDBPreRHD2FVv+SrooCkwtVHT0OJ
   XP+JzuKf2b2Fk5tdmY1smScwbDaOASccxW79HvS712LQzxvR1m/MH0DpA
   NqJ/clO7TfyGpS+eoia0WioG66cPP1u0Z72atesdOV1pTTNO0mjuRirAl
   6KI/psrFEWDaoEfLagi74ahZEuLXPpDqhGCL5yj2AfiLZQObPgen2l2lA
   5Ax1CXwENSdDEnQsDB1HSVTEBPOcrinkxxLC+wVdujEP+uoIlaNdRm/0R
   SfW2r9GeLZduxfqLk7q2CwZo89GAANWigjwEkiZlfdfC0UaceJgo+hNJn
   Q==;
X-CSE-ConnectionGUID: o3xxTpM/T5eizlpFIChV2w==
X-CSE-MsgGUID: bpQ5kwNcRNmObTFDXSG8/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65784010"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="65784010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 22:50:47 -0700
X-CSE-ConnectionGUID: 0bT1Xy4HQS62glaUpVWV2Q==
X-CSE-MsgGUID: z9tyaMHLTU2LP2sfzKw+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="230685715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 22:50:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 22:50:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 22:50:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 22:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgGmGwnOUt65aKBSImtuN1b6vKC8rPbudc6fyVGQkLTD9j7ZE0/uECjW+LMtSs8IJW5AN7cSfYTw+lTYnAPfXe2hU6OV0TUooMv9CV5UJymREKHCMqA768fcRl2PL/OdAMLIhtDZBSbZ2A9/8Ub+uonOo1TGT7ePR/v7y20TMTIqCZ7G5PfgnQHKolL/UTwT56eh/WmU80S75CiuRFjQH+UlIMgmW6GkckrjjlOINza4LqNg2XOO+O7hn5tGm/9lIJoIFqYOFroIOYeRnATrz5fUcqWejA72AJk8/pbP68A9h2neYeC0k4+u3mDCMKJb+By060A1/HYE4MnBlSZ1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O024Y/nXG+H+hbvT6Xc7RVHJunrXgUZbs0paKkX4DCo=;
 b=Tf0lc8jR8aqfJtw/IF3Xhuyy2oSboM0aAvB+EUWO+bsoth6puHlqUCcQMtRKuUec0eMy5rP27loIC9Fen4syoLg926qG7Wcc44pGQn77IZ7bHIJm4ZD+e5pfCB3z5nO0W4+OzeShDTp8FbZMFYK/4fd9Gq6UoHFo/KTaWQY7V4rACYd0rwZlhV4r0s9HjeUdrK0hIzO3sNf26O1wMdpnlvV/efRbUmGIPU5MWYM/TXIypBJ4achmOXp/RQ8Q5vTLA4yyfZhk+2JPGjRg0+TvoN8CATwvoPCxRfXIoNnStw9TdDgrYPZQBwt9+azNw+TW/xXgdTAKpwz9uR6BxSey9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA7PR11MB9593.namprd11.prod.outlook.com (2603:10b6:806:4cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 05:50:39 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 05:50:39 +0000
Date: Tue, 28 Apr 2026 13:50:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:vfs-7.0.misc.2] [pidfs]  ab89060fbc:
 ltp.ioctl_pidfd06.fail
Message-ID: <202604281337.eb35bd49-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU2P306CA0009.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::16) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA7PR11MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c77c647-d8b9-4ba8-3774-08dea4ea1372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: YyXmJ2CjdT67b5titQnDywNA/UOJlmGYJslvfJ1rSZUqucClO7+Usr3pOi0Pan9262gFcYTLCArOCdfVas48PEq96YbiY7+VpcNlfTZv6y/jo2e7VLkRgiDbGQX6JuP593iQUjy9Mm8azvE9ajX5qu85p/86OkW2Er2Kd3w+etISmFjMLtPNv0+Qod1dBOx3VGK+nhmlckjM9JteV9Uat7JYaj1eINbizV8lAEGHG9NlkEvSy9NabgC5xeVhjiDxAyVXookZbZY9iC8lPyxtjiyzo/SDm0mJiNXFFZ61TRQIXG7anew0dS2T/wlp+KnqMMcPKweR3uKvA3cENubYcG463N3IPkEHPC2MipEMB4WL2NrxCNNTzNADBjD6lcJMfdG++q0N6/KzjjfmKwvHkOmrmMNEPNYcMXa+NJyoL3+nY/XdbW761Vrd/M7VwDX0cpUp8tJAbCg/qMnrNp6SpSLyAw2zoebDLNquuOVlqAILTxlsVEb5zzesrxEoWPeAMfqdp+tqR+YArnd3IRty054IW4ax5FfR9XXMVakb1BKjPUA68bZfMyr78250PUNeDKMY+xYdsQqcAOAfyLmmReUdJgXdsEP7EmxrraIIgZ+ZRwEvRA+PuJSSX5iXGHK/Dm1++qBIBrGHlNra/fEWomtIKit0Xfqpx/D9PdyQRYLDbAc1s2VdQep2F6TxEPX4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZjRkhsQURzMlBhRll3cWc1RC9iU3dPN05sdk9RSGU5cXJOVXJrdXhUY3VE?=
 =?utf-8?B?SVovOVVWOHg1VUxTY0FPS0J4ODdwdmgvNmgxL2NxN052Y2U1T1NJNmdWT2dK?=
 =?utf-8?B?ejhFVkI0bGxzTmNPTDZlSWExY1gxMU54aUkwZGFpaFhZRDFHQ1dkWXNDK2VH?=
 =?utf-8?B?Wk95OWpJSjlvaDdUazR4UGJZbDJtVElSZU1mS090OXgyU3d4aDR6WU4rRjY0?=
 =?utf-8?B?M2VIcTI2U3BNMU9Rb20vTjh3VWl6UGExZWZNd21JNnE3SWdpWTlmbCt1eHNH?=
 =?utf-8?B?SVZoek5FQmE5RHdudkIyVWxqc3pjdmRvVW94dzVJbG9kOFBEeElHYXVHbzF1?=
 =?utf-8?B?QS84cElBSjVCQldiYlI4Y1QySlM2eG5ZM0sxQzhyaWtwU2hOM2xybmg0dUtX?=
 =?utf-8?B?VzNmWkVPRW5VekZTZUxtOUJud28ybzZQMmdEMnBVQ2pTS3FPcWM1MmppZWRl?=
 =?utf-8?B?S3ZuelVSalZzMmhUQUpacFZjNzhBZS8zOFRmVmFTSzFadnlvUUs3cUxpZ3py?=
 =?utf-8?B?VGxqMGdpcGlaQVNzby84K0pXN3hXTGZDMldaRXFCUG1EcEFjbWFhcE5PYXRj?=
 =?utf-8?B?dnVRQ0o3bFAwV0ppRWVHWEtVVGllUnVCMTBJRFRiMHdpdkY0RFFrNzdIaFJC?=
 =?utf-8?B?UVJhVTJ4NENzK1NHTHFVVVlXRFNBK09helJYYS9BM2VlV05pV0JuTDRXNWtk?=
 =?utf-8?B?akZKVkUwbWJSQnZQZWFxQ25ZZ04xdUY5S0Rjdm9IcE82UjdEdGkzNmxSaXBY?=
 =?utf-8?B?djlUaTZOMExWTDVESG1OT2pyVERHUlZWeEIvejA2N1JES2c5dmhsSmhqQ0F6?=
 =?utf-8?B?VDAzZFpwTUFwTmdyMlhKUU8zditDa2NKSittUERMamFSMkdxTUpFRVE0MW90?=
 =?utf-8?B?bG5rM01FcWJmQUovakNFenU5bjRQM3JHZGtjQVRBLzM1UlgxeG1qb3ZrL1Vj?=
 =?utf-8?B?clcyOGcxT2hGRGJnUEpRblpNQ2JtanVRRHZUcDdaaGNoV1VUNkpqQWRZL1FB?=
 =?utf-8?B?QmJqK25ueE1VdFBZaUFWUEF5b29lRlAwelpCKy9zVkZmbnErUWRnVm91Vmxu?=
 =?utf-8?B?dXlZUFJZZEc2cGVqcGhxdE5VZG1oRzM1cllrdG1XTDlaaVkzOWNDTHYybmE2?=
 =?utf-8?B?VjY0Tmx3UW1XTXlIQTYwa3NWdksvZDkzb0RrUnN6d0JRWXUyL21RV05IMUY5?=
 =?utf-8?B?UlhQTWN2dlpzbFBjWUVXSnM5ZkswUkJmTVVCb1RRQ21xcXFvMUtKUk9vN1BR?=
 =?utf-8?B?NDRtN0dCNGZmYllndjJ5VmozcGxmRm5maTRzMlRWRUZFZENZUXlYZTJxUHN0?=
 =?utf-8?B?d3BDYTVpTG1ydlpHZk1semtFaGlJTzFjUUZaM0pvWTlOZHRtZWN2VmlzN2t2?=
 =?utf-8?B?dFRpUnJTbi9uNmh6dXI1NGdRcVFjbmZwa1VOaVY0d05CQXUrV0M5L3Y1NXdX?=
 =?utf-8?B?SUcwZ0dVRSs5ckk5akVENFl0RFpTNWFYSEw2cWs3UnVPdzd5dklySDdRaFFy?=
 =?utf-8?B?RXpnSFVkWVIyTEpYMktPNjRCamFvY1pla2VrWWFIYjJTSXB6MGlOV1E0T2ow?=
 =?utf-8?B?ZDlndHI0ZEhudjFyREhQSHd2ZWl1SHhnUVl2RDJrUXZQVHZVd1JiZEt4MnZx?=
 =?utf-8?B?VFZFbkhMeGN4WWwreWQwNDBBVmd5NXI3TFNYWm1BUlhhelN0bmZoVjlnRWFX?=
 =?utf-8?B?SkRoYUl6b1RPZnUzTnhBZjA2ZnhRYUJPMm5LdUpXYnFlbTFaUjJGL2VRY2Qr?=
 =?utf-8?B?SG9RU3hyWXN6Vzk3bVdGRStJenZJaHRuWklmZ3hrcUxsems5anZkUmZaOVBt?=
 =?utf-8?B?ZW1zS3dSdzE2VVZSN1IrbHVZa1dKVkFVSmVCdG5qZkxhNHkwTnJJeG1GYVRa?=
 =?utf-8?B?ckQrTmlBdFFOZjN1NzFYZi81Vjg4WTN1WE1jekExdE53OTBNeE9LUU8rV0Zn?=
 =?utf-8?B?WHQ1UzZpbktNQXFreXdqNjFUTUpWYS9XTGxyK2tudm8xSUZFTGhiT2lHakhw?=
 =?utf-8?B?M2RINkh2clBWVXpxMjJTeDRwcUlyamRMNzV4cmtlU1dyNVhpOUFaalE0NlRU?=
 =?utf-8?B?Mi9Wd1BUc2grZjVHSnMrUDY1SldHbzdFTUxxTW5rcXhVQXlwU3p4c01NUHd0?=
 =?utf-8?B?aWhya2V1Sy9kSjF0dmx4b3ArNDk2dlR4cXJ1a3VCNWg1RGxQNEV0UUJBUlRL?=
 =?utf-8?B?YkVjUGxORys4ZTlkTjVYbElYYlFUNFZNRnROejNkVkZhMUVjdkZrVXZLOHhK?=
 =?utf-8?B?RGRqMDh6dzNuQzR6enFSdFNBenV5V3VsZSsvWXlkZDROd3hyeDZkSXdVY25C?=
 =?utf-8?B?MlpSdHhnS1JkVkhUUTFJK0l1V3g4LzN5MWFIMnBJTHJEaUN1TmNQUT09?=
X-Exchange-RoutingPolicyChecked: IYWV1SkwYnYpS29Ik4hoDE+UsI3pTr3kjqZT64BIr+LLW54zOyGwA36xgXUApMdBflRVx9TXplwdrZzsTrLrFksjRpnXqZUdMQ4C2efMeCPdbyzJ66pEs+f8D3UhTT6+GSXi3x/NlJyX+MU1BccstT7xCfeRCwJDZCbuBcg5i2humdk/PXIq7R23jD9ERUNFaKmpx8gW3E/fIUgnoB9bhqVJxtt84tMFY1nAbfossjaLylPfGEfYxQ7YI6fwNfJRhe0chsSP6RxD2BPk0+shD8Ns0CqrZ6xzybiM+satis0rpY0mOQbUUSBmqlHyXxpQ6axMNQ8mK+5TaK1/zV/yFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c77c647-d8b9-4ba8-3774-08dea4ea1372
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 05:50:38.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X02LCsLLqek26Jkq4LVyGQO5Bj5PI4ogCEluf+ICQN3E+5LmLV9C97POLVGczqJgdH5QSg4nWD6PR1VzrWb+WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9593
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.ioctl_pidfd06.fail" on:

commit: ab89060fbc92edd6e852bf0f533f29140afabe0e ("pidfs: return -EREMOTE w=
hen PIDFD_GET_INFO is called on another ns")
https://github.com/brauner/linux.git vfs-7.0.misc.2


in testcase: ltp
version:=20
with following parameters:

	disk: 1SSD
	fs: ext4
	test: syscalls-00/ioctl_pidfd06



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (=
Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604281337.eb35bd49-lkp@intel.co=
m


2026-04-24 14:31:03 export LTP_RUNTIME_MUL=3D2
2026-04-24 14:31:03 export LTPROOT=3D/lkp/benchmarks/ltp
2026-04-24 14:31:03 kirk -f temp_single_test --tmp-dir /fs/sdb1/tmpdir
Host information
	Hostname:   lkp-ivb-d04
	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
	Directory:  /fs/sdb1/tmpdir/kirk.root/tmpks9yg0hx

Connecting to SUT: default

Suite: temp_single_test
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
=1B[1;37mioctl_pidfd06: =1B[0m=1B[1;31mfail=1B[0m | =1B[1;33mtainted=1B[0m =
 (0.025s)

Execution time: 0.088s

Disconnecting from SUT: default

Target information
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80
Kernel:   Linux 6.19.0-rc1-00045-gab89060fbc92 #1 SMP PREEMPT_DYNAMIC Fri A=
pr 24 22:01:15 CST 2026
Cmdline:  ip=3D::::lkp-ivb-d04::dhcp
          root=3D/dev/ram0
          RESULT_ROOT=3D/result/ltp/1SSD-ext4-syscalls-00_ioctl_pidfd06/lkp=
-ivb-d04/debian-13-x86_64-20250902.cgz/x86_64-rhel-9.4-ltp/gcc-14/ab89060fb=
c92edd6e852bf0f533f29140afabe0e/0
          BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-9.4-ltp/gcc-14/ab89060fbc92ed=
d6e852bf0f533f29140afabe0e/vmlinuz-6.19.0-rc1-00045-gab89060fbc92
          branch=3Dlinus/master
          job=3D/lkp/jobs/scheduled/lkp-ivb-d04/ltp-1SSD-ext4-syscalls-00_i=
octl_pidfd06-debian-13-x86_64-20250902.cgz-ab89060fbc92-20260424-25885-171w=
hff-0.yaml
          user=3Dlkp
          ARCH=3Dx86_64
          kconfig=3Dx86_64-rhel-9.4-ltp
          commit=3Dab89060fbc92edd6e852bf0f533f29140afabe0e
          intremap=3Dposted_msi
          max_uptime=3D14400
          LKP_SERVER=3Dinternal-lkp-server
          nokaslr
          selinux=3D0
          debug
          apic=3Ddebug
          sysrq_always_enabled
          rcupdate.rcu_cpu_stall_timeout=3D100
          net.ifnames=3D0
          printk.devkmsg=3Don
          panic=3D-1
          softlockup_panic=3D1
          nmi_watchdog=3Dpanic
          oops=3Dpanic
          load_ramdisk=3D2
          prompt_ramdisk=3D0
          drbd.minor_count=3D8
          systemd.log_level=3Derr
          ignore_loglevel
          console=3Dtty0
          earlyprintk=3DttyS0,115200
          console=3DttyS0,115200
          vga=3Dnormal
          rw
          keep_initrds=3D/osimage/pkg/debian-13-x86_64-20250902.cgz/ltp-x86=
_64-92ea0639e-1_20260301.cgz
Machine:  unknown
Arch:     x86_64
RAM:      6899584 kB
Swap:     0 kB
Distro:   debian 13

=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
      TEST SUMMARY
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
Suite:   temp_single_test
Runtime: 0.025s
Runs:    1

Results:
    Passed:   0
    Failed:   1
    Broken:   0
    Skipped:  0
    Warnings: 0

=1B[1;31mFailures:=1B[0m
    =E2=80=A2 ioctl_pidfd06




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260428/202604281337.eb35bd49-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


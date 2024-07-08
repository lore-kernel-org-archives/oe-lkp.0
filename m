Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C4BA45
	for <oe-lkp@lists.linux.dev>; Mon,  8 Jul 2024 05:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720417233; cv=fail; b=eJArq7EoqimTEK9rtZiBxdmsz6JOcSEKpYOB0wTsL7xOTvy002xYZRhcyOpkTsXh/Iuo82DygpYgFxQIvoyJFi0xal8bgEPmOvf5OIg/Jv+Hi5IksTM7Mc0w+ZeSH0SLMw9EchyJBXHiUv0zr/GLeTmEadKbk4Po3J41YOsE5wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720417233; c=relaxed/simple;
	bh=FAfvt9l/zTW/EoDLuyPr4iVogKup45hg7ThdcmcAL3s=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bZRHgFsS6FLH4uC4sX2GxPULZnBw4+poZXZi1zh9ofosjLnPjwgFWEBmO2lEgdZG1clmF6jhltyZhbX+PMTp97ZgsUniUUhgh7/UwTyKT9qKyKS3i28gqGlcOpujvG+IJN29fWb8Of9pfVjYqJfwJ35sCIrZh8EpYq12e/ADOcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJKTwyUG; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJKTwyUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720417230; x=1751953230;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FAfvt9l/zTW/EoDLuyPr4iVogKup45hg7ThdcmcAL3s=;
  b=TJKTwyUG519TDjTgAd6IBEg5eqqyGqkOYlUt1onsczSS3TZiVk/d8fom
   KyLx1g/aUrHD+UXXm8oKEk1+d6FW3Hfd5c32bl3CAkmWM+Bsnm+lAZ4Vz
   fngfwNbc7liECfaVuuPjBLgb/z2hfs9cyWT9bjYoESDZsucPOBh9uKtFp
   lQw4/GbnRyUEMHFNS0sRBRmJl4SQXCArs0kZ2+Les7ioDN7RZnIX2ooFN
   FK6E8MEVwKXQSzYaWaAQZ1FP3252libRtezjTL6WBZAVseKVNBCnZYC5v
   0MDRCMTIadC4W5NfinBieabxiqNwuQwPxZzYjGZlEYRPsQUPV/cZ4cSgi
   Q==;
X-CSE-ConnectionGUID: KEUaASdnTjeFy/JssSTScQ==
X-CSE-MsgGUID: bzWeom7JRkyQ26DfCaTglg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17433147"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17433147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 22:40:29 -0700
X-CSE-ConnectionGUID: O30pu109RbWPvjwhDAsILQ==
X-CSE-MsgGUID: yw/OJtruSeahj4hdvUrl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47500800"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jul 2024 22:40:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 22:40:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 7 Jul 2024 22:40:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 7 Jul 2024 22:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTBn0S29LPx/nEXrQMEmHs6ysoLmjML+TDSfB63UysGvFQfOxYU1lvpSaDP4zRgpo7+hY8qgmiz5pkMmROKqRAfe1+Al3O6E1QoujQ8ySzDGSr1/Oy0ZXIT8mZfEan+5z0HxwAAON8Yh5vSLWQaJWtvl/bycx8ZBu1EvrIYDWA8X/2UJcZYuskr213WB6wOUhXBTedB374WTTz8+i9BxF7rVsxabRGhgsnUkcLRDQneFFOguapXTL8LhCw/p1xPL/EJlimg4y6GSSLpMSCmMhHVSXQRgxU5VmtG81G2idwuV8Yi65VnFfivOO9h3yL8Nx4Rgintg/+IpvDefYxQLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSN4qSaTdzPxve5AmE4tNxA3Tfj3oY+o02ZWSB/b4Sg=;
 b=knvLfFFPVH7aJWO9JivoXLHqMdg+Y+pftpPA0saz2ErVXyqpT7k5Hk80s9ETc7VYsDexJw0tZa3YCJKDWtLIzGiTkNxi/A2jL0xu1rGMFpyzw+mTh8aeXOMgj1Nuf9+GYIkrl0C32E/e834gR3wCOHgvFhpxw54O5Vgb5QKsYY2zbYanpaZPDIoHLw0gP2/LfarF3q+hv3hNWp6WnPVuHVLQAhB865djmHosTLOh7bAOB0JWV4AA0W/UoKG3sJi7pMD2SJZnIY3VN8Jj3feOGwb1Jztz+hNjeVNY5bG2ipjCPe3E77jCHqOx2qVi/GcAn4epY46QMdWiNCgJ6Jh3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 05:40:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 05:40:23 +0000
Date: Mon, 8 Jul 2024 13:40:15 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <Zot7v3RACCb1T0gh@xsang-OptiPlex-9020>
References: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
 <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
 <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
 <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020>
 <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 243d0691-a0a7-4bc9-5052-08dc9f107655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KezDS9KssbOKAUZsyP46EI+KyLr2ovnv2CxcmTFAOKYRFssPPjKDAF6aRP?=
 =?iso-8859-1?Q?kSFGGQ3Dx+8ULJ/mIJp/hu/3jHy6mK8jpUZ2jfZK7Yhq10AhZYuQ+RD2rl?=
 =?iso-8859-1?Q?55lN8lBr0NAnWNz9AsP/JlAOUOmABHYXwzGu35q+JAZg9Z95SnPqcOBogN?=
 =?iso-8859-1?Q?KC2xEDzgsy/WNVI9DlGjEQrTAFdJb20O7yEyPrGB8l79STyQVDhUFN9ady?=
 =?iso-8859-1?Q?xLwFoa4zNdE2xRDKrHWLOXC1Bb57WDN0XfytHdAjsLbMHx0T4sVW4d0BBH?=
 =?iso-8859-1?Q?67EiXtN+UqaKS/69LEjQ0VpChwtlhg5LytrV/wllAZ53dPG4cxf0G0UGJh?=
 =?iso-8859-1?Q?cEIN0gi+SEouvmuIGnXBs3ftg8TVlu2HA1Iz4Fum7izODdb4f8ZS+JVXFY?=
 =?iso-8859-1?Q?HEYxHCYgk26SUYFLiM3wVgjsE79wkVS7/jIHrxWvMNQbxOen4zHnMWrEL2?=
 =?iso-8859-1?Q?Ji1l7cKvlwiNDp7LpBGTzEwkzfRSUmjxj7FfxVeIkwbGI6gltLVyeNTiXx?=
 =?iso-8859-1?Q?ANpPRsYkwDkAXfeQCQzKsogjhT72wHmveBkVuj8Oq5vOg4OcQuwvUF7feK?=
 =?iso-8859-1?Q?IsU+M0EANe4YdX3kfPLgaY0Pjr/txsQKJE2drL9sY+h4kXqa0TRDzIsqLv?=
 =?iso-8859-1?Q?VYVP5978ySzpYrmw1lJ5AnNfWKTD3W49d9vMmSstA7oVKInKHSbC77PCXM?=
 =?iso-8859-1?Q?wkyOkNg/e1ZYEN49YlfbkS+yyUdov0EMA+rdtC1PMbkCN4U7s+64P60Tdk?=
 =?iso-8859-1?Q?n9PlDXkFfgHnic5IC0GdFVJzm7lAfQ66qbys7JKAHPf6x5B4OGi852wrYq?=
 =?iso-8859-1?Q?IzLhJMuitUp9nQy5LfLZwxbmXb7T8BDAO2bBUCxRsBIu5Yl1k+gmA8C5UV?=
 =?iso-8859-1?Q?A1YwP5qcR1UAcy5e1I8hVIykmKYTFElhJG1frqtqFY3qKxpUh/On7RJD6i?=
 =?iso-8859-1?Q?qRy3ZrDxJNwzkace8dm6YPs4AX/+L40/Dqh6+hdL3QFz7E4t/vj2HQRt8F?=
 =?iso-8859-1?Q?jHyLzgUdj+S9aq6flAxy6lMACVwKM426LFcO9HZI/qKhiuLBDPc9/9cWjl?=
 =?iso-8859-1?Q?vfRAfxJi86eNqsVNAxN6ILdplBBgQC1eOqU+tXREKRxUYu5B4kmshm3ul5?=
 =?iso-8859-1?Q?NN5vkAjfjE7By8hfRZWmwjUkHMCQrg3oYAPV1NnDPdNbdAeH6cYJNLCqVJ?=
 =?iso-8859-1?Q?CeX8pWvuDPRXc8bAEInZLiqbr503EaFSxkUcFwtk7Wi3F+CM39AmkPwj6D?=
 =?iso-8859-1?Q?3WLovyVhfRccdoVDPZys91+qMOrPCmOa6cILZ6WM5pdIoRhLCMznluEFby?=
 =?iso-8859-1?Q?3BHa3hOhL7lpaAbnxwfOdg+8GE3k/K2SGU5WtRXAaRjTCSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0xwW7pYo+sGWgiAhKTlSMMxUoojQOMhBQIxTJlIGjkvD+j3NgmDImfJ7bR?=
 =?iso-8859-1?Q?zAsgysrWBPDlGP7cjxjeCI31fL7l4uUN7oTkJG2a2ogDTUQXf5xRuvjGzb?=
 =?iso-8859-1?Q?/MQq2VpZnAteKZKd3dm3gPWGS+YS+ByL1fKFYuB+tMe2/SWmEsGVcd9Lt+?=
 =?iso-8859-1?Q?yNm0rnCv/At/9oHQ6jOPLgRDAe/22h/AYkRnF+vGP+0mQ9Ju/+9rswlWVW?=
 =?iso-8859-1?Q?DPqy1HVH1O20b9/q8XUoWA4FnX7X3Zla6v+3qVxl3IBa3gRkMjQvFgbWWK?=
 =?iso-8859-1?Q?5muCCmMXnLgUR6JGHljxmZoRQSnibvHC0p1ez9MrQxibWxOzQ5Z3FNF+e7?=
 =?iso-8859-1?Q?sZ/T9Uanj1421xUfuldN55ikAhMXmWFNXlTvZMuoWVr7u24P+WE4fvvR7e?=
 =?iso-8859-1?Q?o524M4tI/acHavr2ayOtDbVZIJSoIrpxrKCubAdSPLUG7t3bPEfpaVwjsa?=
 =?iso-8859-1?Q?zzETCYiIUUOWpwweHz8oRDmwhhMcCieYHlxTRvaDFjOnlDVaN2YMrusk71?=
 =?iso-8859-1?Q?1VKnzvMpXSWnCrfCxoL+gAEs2W3BOCC9oc1FKEQeqiIdBJqnQstXEB8uiP?=
 =?iso-8859-1?Q?AABuj2WS9VMFvA3MchIDGRwxezyJfqnsMHEpcBW90qW1eixY6zvFOl1Jty?=
 =?iso-8859-1?Q?LC7daa/2eP8Ep5pXW8mhcjrhmc2XAL99grF6xQhm75aao4+0QpzcZncSi/?=
 =?iso-8859-1?Q?Jv2cBODquSxK3ggqHv4lXhwlzInT6NYNClgZPsCREKikvAzYXl2fRgS2mh?=
 =?iso-8859-1?Q?Z1UXZJ6GrbZNgNM1G1Nnp0azYKV8f1ZdcdAthhwt4JdUl1kB94masdXikH?=
 =?iso-8859-1?Q?2VzJ+T/RKehkQbPLr62ZmS8iRpI/FQQKaUZ1tVc7ZMtxVxnXkGO11v8iwG?=
 =?iso-8859-1?Q?otvQAzS/B8F7TWISxFbf9xw8foSr5yNyVdjy4jCo7TjgOQS3g9Onse+ZkB?=
 =?iso-8859-1?Q?l3FxyEZ9Tl1kHWbdUYqioIDCEj2LrT+fEhLc464G1jIxXeo5K/i5SGY6Bs?=
 =?iso-8859-1?Q?aKm4ONGPEmiR8uxM2ehwTYaYRNn8YPEtTPgJAgNWjINPISaRINM88RiYB3?=
 =?iso-8859-1?Q?X5ndKN+2moSyCrF2kM5Cq2Bhuap9x8R/VfPQFwCKoZIdq2j9kKGiWilEg+?=
 =?iso-8859-1?Q?FcuYizPe+X7ymDvYFZIjIfcQ3+9y7JxuiAYXEJeR/sNBNeOitQCNveL5GX?=
 =?iso-8859-1?Q?ZkxM5yz1JeboQc8glrd7EwH9RFwLu9kmlm9OY+668aZDV6f+oLb5PgH/UO?=
 =?iso-8859-1?Q?eaf2Z9XuTxNuIyY33g0T/PpLUv91sNM8NtFAWysQcxhTPn28JAHtg3WyQq?=
 =?iso-8859-1?Q?GFr3ZQNO1SMkxXG9UG7NMyNMLILpzpSgzvVKVN01MmzTb/+ccf4Rx9mfr0?=
 =?iso-8859-1?Q?LBxiT6knIlRa/Lvd6XWiA1ufq6PXr8QoctLT1XGy3uhjIC252fUBBH0Htz?=
 =?iso-8859-1?Q?CrjpIdttspjLMqS5wmjzAw9poQE+QTL//l8nurnCkYuVRYxpS2BpHsHx76?=
 =?iso-8859-1?Q?xLM/37EIaxn782iuYXj7aaXUXNlKE0B++Cy4s06mJNgRVkb9h/6AT+RxSS?=
 =?iso-8859-1?Q?p0XMBWh11B2yvuVo6Dw9EarcHA9XqbOCjPUEAqlIlECCk5axgSHRgtyAI8?=
 =?iso-8859-1?Q?EfCU7jax96w22WOwC3WqlzY8eFrIH/VbBvBZqVJ4ce+VaZK/s3uYFBIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 243d0691-a0a7-4bc9-5052-08dc9f107655
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 05:40:23.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+hgxQOsWq7AIgaCA2c4fNkKUb9+CN4Skb4vlrQPxKIub3IEfW39KbOWhBhcxqQNFj/lTAe+F3Ul8aD1K8jpCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
X-OriginatorOrg: intel.com

hi, Amir,

On Fri, Jul 05, 2024 at 08:48:28AM +0300, Amir Goldstein wrote:

[...]

> 
> Thanks.
> That clarifies that the cycles are spent in the "optimization code" itself.
> 
> I pushed a new version to the fsnotify_for_lkp branch with a possible fix commit
> at the base of the branch.
> 
> Hopefully, with this fix, the compiler will be able to optimize smarter and
> the generated fast path code will be less sensitive to code alignment ???
> 
> If it works, it may eliminate some of the regressions throughout this branch and
> may also improve the stress-ng regression that you reported on v6.10-rc1 [1].
> 
> * e0aaae806edc - (fsnotify_for_lkp) fanotify: report file range info
> with pre-content events
> * a28c32866bb3 - fanotify: rename a misnamed constant
> * 61baabbdceaa - fanotify: pass optional file access range in pre-content event
> * 72e76d909afd - fanotify: introduce FAN_PRE_MODIFY permission event
> * 1c71a12ff3ce - fanotify: introduce FAN_PRE_ACCESS permission event
> * 38a903de931a - fsnotify: generate pre-content permission event on exec
> * 70be29706389 - fsnotify: generate pre-content permission event on open
> * 96768b7d6721 - fsnotify: introduce pre-content permission event
> * 28d5b4a88241 - fsnotify: avoid multiple fsnotify_sb_info() access in
> permission hooks
> 
> Fingers crossed...

unfortunately, seems no luck. I combine the results with 96768b7d6721 and its
parent since 96768b7d6721 introduces most regression.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  28d5b4a88241d fsnotify: avoid multiple fsnotify_sb_info() access in permission hooks
  96768b7d67219 fsnotify: introduce pre-content permission event
  e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range info with pre-content events

       v6.10-rc1 28d5b4a88241d36788173a41211 96768b7d672192594d54b474077 e0aaae806edc3411d84dc0d66fe
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 1.218e+08            -0.3%  1.214e+08            -7.6%  1.125e+08            -6.4%   1.14e+08        unixbench.throughput

detail is as below [2]


> 
> Thanks,
> Amir.
> 
> [1] https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel.com/

for this report, I also retest on new branch. seems the regression reduced to
around 10%, but we cannot get stable data on this new branch, so we cannot say
if it really becomes better now.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/full/stress-ng/60s

commit:
  v6.10-rc1
  e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range info with pre-content events

       v6.10-rc1 e0aaae806edc3411d84dc0d66fe
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 1.161e+08 ±  5%      -9.5%   1.05e+08 ± 10%  stress-ng.full.ops
   1934587 ±  5%      -9.5%    1750464 ± 10%  stress-ng.full.ops_per_sec



[2]
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  28d5b4a88241d fsnotify: avoid multiple fsnotify_sb_info() access in permission hooks
  96768b7d67219 fsnotify: introduce pre-content permission event
  e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range info with pre-content events

       v6.10-rc1 28d5b4a88241d36788173a41211 96768b7d672192594d54b474077 e0aaae806edc3411d84dc0d66fe
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
      6215            +0.1%       6223            -8.9%       5661            -7.9%       5724        time.user_time
      0.58            -0.0        0.54 ± 18%      -0.1        0.52            -0.0        0.55 ± 11%  mpstat.cpu.all.irq%
      0.01 ±  4%      -0.0        0.01 ± 13%      -0.0        0.00 ±  2%      -0.0        0.01 ±  6%  mpstat.cpu.all.soft%
      7.59 ± 59%     -58.7%       3.14 ± 63%     -61.7%       2.90 ± 52%     -33.4%       5.06 ± 50%  sched_debug.cfs_rq:/.util_est.min
      0.00 ± 72%    -148.0%      -0.00           -50.9%       0.00 ±244%     +12.3%       0.00 ±102%  sched_debug.cpu.nr_uninterruptible.avg
 1.218e+08            -0.3%  1.214e+08            -7.6%  1.125e+08            -6.4%   1.14e+08        unixbench.throughput
      6215            +0.1%       6223            -8.9%       5661            -7.9%       5724        unixbench.time.user_time
 4.521e+10            -0.3%  4.506e+10            -7.7%  4.172e+10            -6.4%  4.231e+10        unixbench.workload
 1.458e+11            -7.5%   1.35e+11 ± 18%      -6.8%  1.359e+11            -9.5%   1.32e+11 ± 11%  perf-stat.i.branch-instructions
   3742171 ±  4%     -16.8%    3112873 ± 20%     +80.4%    6752235 ±  7%    +403.3%   18836125 ± 14%  perf-stat.i.cache-misses
  32402657 ±  3%     -19.5%   26094697 ± 16%     +77.8%   57627688 ±  4%    +356.5%  1.479e+08 ± 11%  perf-stat.i.cache-references
      0.95            +9.8%       1.04 ± 20%      +5.8%       1.00 ±  2%      +9.3%       1.03 ± 13%  perf-stat.i.cpi
    161794 ±  8%      -2.2%     158309 ± 20%     -49.9%      81139 ± 15%     -77.3%      36784 ± 54%  perf-stat.i.cycles-between-cache-misses
 6.963e+11            -7.4%  6.445e+11 ± 18%      -6.5%  6.513e+11            -8.8%  6.353e+11 ± 11%  perf-stat.i.instructions
      1.22            -4.7%       1.16 ± 10%      -6.3%       1.14            -6.5%       1.14 ±  6%  perf-stat.i.ipc
      0.01 ±  4%     -10.3%       0.00 ±  6%     +92.9%       0.01 ±  7%    +453.4%       0.03 ± 14%  perf-stat.overall.MPKI
      0.75            +0.0%       0.75            +6.8%       0.80            +4.3%       0.78        perf-stat.overall.cpi
    139258 ±  4%     +11.8%     155626 ±  6%     -44.5%      77325 ±  7%     -80.8%      26737 ± 14%  perf-stat.overall.cycles-between-cache-misses
      1.33            -0.0%       1.33            -6.3%       1.25            -4.1%       1.28        perf-stat.overall.ipc
      5722            +0.3%       5738            +1.6%       5811            +2.6%       5869        perf-stat.overall.path-length
 1.452e+11            -7.4%  1.343e+11 ± 18%      -6.8%  1.352e+11            -9.5%  1.314e+11 ± 11%  perf-stat.ps.branch-instructions
   3742620 ±  4%     -16.7%    3117570 ± 20%     +80.4%    6752430 ±  7%    +401.2%   18758290 ± 14%  perf-stat.ps.cache-misses
  32374621 ±  3%     -19.4%   26088859 ± 16%     +77.6%   57486380 ±  4%    +354.8%  1.473e+08 ± 11%  perf-stat.ps.cache-references
  6.93e+11            -7.4%  6.415e+11 ± 18%      -6.5%  6.481e+11            -8.8%  6.323e+11 ± 11%  perf-stat.ps.instructions
 2.587e+14            -0.0%  2.586e+14            -6.3%  2.425e+14            -4.0%  2.484e+14        perf-stat.total.instructions
      2.85            -0.2        2.62            -0.3        2.55 ±  3%      +0.0        2.86        perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.99            -0.1        5.86            +0.1        6.09            +1.1        7.10        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
     12.29            -0.1       12.16            -0.3       11.97            +0.8       13.04        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
     13.39            -0.1       13.28            -0.4       12.96            +0.7       14.12        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     13.18            -0.1       13.08            -0.9       12.24            -1.0       12.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      1.98 ±  5%      -0.1        1.88            -0.0        1.96 ±  3%      +0.2        2.20        perf-profile.calltrace.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.27 ±  4%      -0.1        3.20            +4.7        7.99 ±  6%      -0.1        3.21        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      2.42 ±  6%      -0.1        2.37            +4.7        7.16 ±  7%      -0.1        2.28        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      3.72            -0.1        3.67            -0.4        3.37            +0.1        3.81        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     58.06            -0.0       58.01            -2.5       55.53            +0.7       58.76        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     74.32            -0.0       74.28            +1.8       76.16            +1.4       75.67        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.90 ±  5%      -0.0        0.87            -0.0        0.87 ±  3%      +0.1        1.00        perf-profile.calltrace.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write
      0.70            -0.0        0.66            -0.0        0.68            -0.0        0.68        perf-profile.calltrace.cycles-pp.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      5.30            -0.0        5.27            -0.2        5.06            -0.1        5.25        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.11            -0.0        1.08            -0.1        0.97            -0.2        0.94        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.write
      1.81            -0.0        1.80            -0.1        1.72            -0.1        1.76        perf-profile.calltrace.cycles-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      1.62            -0.0        1.62            -0.1        1.49            -0.1        1.52        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.92            -0.0        0.91            -0.1        0.84            -0.1        0.86        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      2.18            -0.0        2.17            -0.1        2.09            -0.1        2.12        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      0.62            -0.0        0.62            -0.0        0.58            -0.0        0.60        perf-profile.calltrace.cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.63            -0.0        0.63            -0.0        0.58            -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.92            -0.0        0.92            -0.1        0.84            -0.0        0.87        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.68            +0.0        1.68            -0.1        1.56            -0.1        1.60        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.68            +0.0        0.69            -0.0        0.64            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.72 ±  2%      +0.0        0.72            -0.0        0.69            -0.0        0.70        perf-profile.calltrace.cycles-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.85            +0.0        0.86            -0.0        0.81            -0.0        0.81        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      0.74            +0.0        0.75            -0.0        0.70            +0.0        0.77        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      0.86            +0.0        0.86            +0.0        0.88            -0.0        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
     84.29            +0.0       84.30            +1.2       85.47            +1.1       85.34        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      7.00            +0.0        7.02            -0.4        6.59            -0.1        6.89        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     82.86            +0.0       82.87            +1.3       84.15            +1.1       83.98        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.73            +0.0        0.74            -0.0        0.71            -0.0        0.70        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.64            +0.0        0.66 ±  2%      -0.1        0.57            -0.1        0.58        perf-profile.calltrace.cycles-pp.w_test
     78.16            +0.0       78.18            +1.7       79.81            +1.4       79.57        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     96.83            +0.0       96.86            +0.2       97.07            +0.3       97.12        perf-profile.calltrace.cycles-pp.write
      0.78 ±  3%      +0.0        0.82 ±  2%      +0.1        0.88 ±  3%      +0.3        1.05 ±  8%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      1.12 ±  2%      +0.0        1.16            -0.1        1.02            -0.0        1.11        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      4.23            +0.0        4.27            -0.3        3.94            -0.1        4.13        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      2.70            +0.0        2.74            -0.2        2.50            -0.1        2.63        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
      3.52            +0.0        3.57            -0.3        3.26            -0.1        3.41        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
      6.89            +0.1        6.94            -0.4        6.47            -0.1        6.77        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      2.10 ±  5%      +0.1        2.15 ±  3%      -0.1        2.03 ±  4%      +0.2        2.25 ±  3%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      2.96            +0.1        3.06            +0.1        3.08            +0.4        3.36 ±  2%  perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
      3.61            +0.1        3.72            +0.1        3.71            +0.4        4.00 ±  2%  perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
     37.30            +0.1       37.42            -1.6       35.66            +0.2       37.50        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.32            +0.2        5.48            -0.1        5.18            -0.1        5.21        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      4.26 ±  3%      +0.2        4.42            +5.4        9.61 ±  5%      +0.7        4.98        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.20            +0.2        6.37            -0.2        5.98            -0.2        6.03        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.00            +0.2       12.19            -0.4       11.61            +0.2       12.25        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.02            -0.2        2.79            -0.3        2.72 ±  3%      +0.0        3.04        perf-profile.children.cycles-pp.down_write
      6.18            -0.1        6.05            +0.1        6.28            +1.1        7.28        perf-profile.children.cycles-pp.filemap_get_entry
     12.68            -0.1       12.56            -0.3       12.34            +0.7       13.42        perf-profile.children.cycles-pp.__filemap_get_folio
     13.58            -0.1       13.47            -0.5       13.13            +0.7       14.29        perf-profile.children.cycles-pp.simple_write_begin
     58.65            -0.1       58.58            -2.5       56.11            +0.7       59.36        perf-profile.children.cycles-pp.generic_file_write_iter
      3.64 ±  3%      -0.1        3.58            +4.7        8.36 ±  6%      -0.1        3.56        perf-profile.children.cycles-pp.security_file_permission
      4.19            -0.1        4.14            -0.2        3.96            -0.2        3.98        perf-profile.children.cycles-pp.__cond_resched
      2.67 ±  5%      -0.1        2.61            +4.7        7.40 ±  6%      -0.2        2.51        perf-profile.children.cycles-pp.apparmor_file_permission
      3.81            -0.1        3.75            -0.4        3.45            +0.1        3.90        perf-profile.children.cycles-pp.__fsnotify_parent
      2.42            -0.0        2.38            -0.2        2.23            -0.2        2.25        perf-profile.children.cycles-pp.rcu_all_qs
      7.43            -0.0        7.39            -0.5        6.91            -0.5        6.92        perf-profile.children.cycles-pp.entry_SYSCALL_64
     98.97            -0.0       98.94            +0.1       99.06            +0.1       99.04        perf-profile.children.cycles-pp.write
      5.69            -0.0        5.66            -0.3        5.44            -0.1        5.62        perf-profile.children.cycles-pp.simple_write_end
      1.21            -0.0        1.18            -0.1        1.06            -0.2        1.04        perf-profile.children.cycles-pp.syscall_return_via_sysret
     75.19            -0.0       75.17            +1.8       76.99            +1.3       76.53        perf-profile.children.cycles-pp.vfs_write
      1.12            -0.0        1.11            -0.1        1.03            -0.1        1.04        perf-profile.children.cycles-pp.folio_wait_stable
      1.90            -0.0        1.88            -0.1        1.80            -0.1        1.84        perf-profile.children.cycles-pp.folio_unlock
      1.99            -0.0        1.98            -0.2        1.82            -0.1        1.86        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.76            -0.0        0.75            -0.1        0.70            -0.1        0.70        perf-profile.children.cycles-pp.x64_sys_call
      0.23            -0.0        0.23 ±  2%      -0.0        0.22            -0.0        0.22        perf-profile.children.cycles-pp.file_remove_privs
      2.47            -0.0        2.46            -0.1        2.37            -0.1        2.41        perf-profile.children.cycles-pp.xas_load
      0.64            -0.0        0.64            -0.1        0.58            -0.0        0.60        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.37            -0.0        0.37            -0.0        0.35            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
      0.36            -0.0        0.36            -0.0        0.33            -0.0        0.34        perf-profile.children.cycles-pp.amd_clear_divider
      1.26            -0.0        1.26            -0.1        1.16            -0.1        1.19        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.59            -0.0        0.59            -0.1        0.54            -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
      1.74            -0.0        1.74            -0.1        1.62            -0.1        1.66        perf-profile.children.cycles-pp.up_write
      1.05            -0.0        1.05            -0.1        0.97            -0.0        1.01        perf-profile.children.cycles-pp.folio_mapping
      0.36            +0.0        0.36            -0.0        0.34            -0.0        0.34        perf-profile.children.cycles-pp.is_bad_inode
      0.33            +0.0        0.33            -0.0        0.30            -0.0        0.31        perf-profile.children.cycles-pp.noop_dirty_folio
      0.25            +0.0        0.25            -0.0        0.23            -0.0        0.23        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      1.10            +0.0        1.10            -0.1        1.04            -0.1        1.04        perf-profile.children.cycles-pp.xattr_resolve_name
      0.85            +0.0        0.85            -0.0        0.80            -0.0        0.82        perf-profile.children.cycles-pp.setattr_should_drop_suidgid
      0.55            +0.0        0.55            -0.0        0.52            -0.0        0.52        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.92            +0.0        0.94            -0.1        0.87            +0.0        0.95        perf-profile.children.cycles-pp.folio_mark_dirty
      0.97            +0.0        0.98            +0.0        0.99            -0.0        0.93        perf-profile.children.cycles-pp.aa_file_perm
     83.54            +0.0       83.55            +1.3       84.79            +1.1       84.63        perf-profile.children.cycles-pp.do_syscall_64
      7.14            +0.0        7.15            -0.4        6.72            -0.1        7.03        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.45 ±  2%      +0.0        0.47            -0.0        0.41            -0.0        0.41        perf-profile.children.cycles-pp.write@plt
     84.71            +0.0       84.72            +1.2       85.88            +1.1       85.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.41            +0.0        4.43            -0.3        4.11            -0.3        4.16        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.98            +0.0        1.00            -0.1        0.87            -0.1        0.89        perf-profile.children.cycles-pp.w_test
     78.77            +0.0       78.80            +1.6       80.39            +1.4       80.17        perf-profile.children.cycles-pp.ksys_write
      0.89 ±  3%      +0.0        0.93            +0.1        0.97 ±  3%      +0.3        1.16 ±  7%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      1.37            +0.0        1.42            -0.1        1.24            -0.0        1.34        perf-profile.children.cycles-pp.strcmp
      4.46            +0.0        4.51            -0.3        4.15            -0.1        4.35        perf-profile.children.cycles-pp.security_inode_need_killpriv
      3.75            +0.0        3.80            -0.3        3.47            -0.1        3.63        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      7.24            +0.1        7.30            -0.4        6.81            -0.1        7.11        perf-profile.children.cycles-pp.file_remove_privs_flags
      3.39            +0.1        3.45            -0.2        3.15            -0.1        3.29        perf-profile.children.cycles-pp.__vfs_getxattr
      3.38            +0.1        3.48            +0.1        3.46            +0.4        3.74 ±  2%  perf-profile.children.cycles-pp.inode_needs_update_time
      3.94            +0.1        4.05            +0.1        4.02            +0.4        4.32        perf-profile.children.cycles-pp.file_update_time
     38.19            +0.1       38.33            -1.7       36.51            +0.2       38.39        perf-profile.children.cycles-pp.generic_perform_write
      5.71            +0.2        5.87            -0.2        5.49            -0.2        5.54        perf-profile.children.cycles-pp.fault_in_readable
      4.50 ±  3%      +0.2        4.67            +5.4        9.86 ±  4%      +0.9        5.35        perf-profile.children.cycles-pp.rw_verify_area
      6.45            +0.2        6.64            -0.2        6.22            -0.2        6.28        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
     12.34            +0.2       12.53            -0.4       11.93            +0.2       12.58        perf-profile.children.cycles-pp.__generic_file_write_iter
      1.98 ±  3%      -0.2        1.79            -0.2        1.74 ±  4%      +0.1        2.04        perf-profile.self.cycles-pp.down_write
      3.66            -0.1        3.54            +0.2        3.86            +1.2        4.82 ±  2%  perf-profile.self.cycles-pp.filemap_get_entry
      3.64            -0.1        3.57            -0.4        3.28            +0.1        3.73        perf-profile.self.cycles-pp.__fsnotify_parent
      1.54 ±  9%      -0.1        1.47 ±  2%      +4.7        6.22 ±  8%      -0.1        1.44        perf-profile.self.cycles-pp.apparmor_file_permission
      1.71 ±  2%      -0.1        1.65            -0.0        1.69 ±  2%      +0.1        1.82        perf-profile.self.cycles-pp.generic_file_write_iter
      6.45            -0.1        6.39            -0.5        5.95            -0.5        6.00        perf-profile.self.cycles-pp.write
      7.25            -0.1        7.20            -0.6        6.64            -0.3        6.98        perf-profile.self.cycles-pp.vfs_write
      2.35            -0.0        2.31            -0.1        2.25            -0.1        2.22        perf-profile.self.cycles-pp.__cond_resched
      2.76            -0.0        2.72            -0.1        2.65            -0.0        2.72        perf-profile.self.cycles-pp.simple_write_end
      0.80 ±  4%      -0.0        0.78 ±  2%      -0.1        0.76 ±  2%      +0.1        0.88        perf-profile.self.cycles-pp.generic_write_check_limits
      1.20            -0.0        1.18            -0.1        1.06            -0.2        1.03        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.41            -0.0        1.39            -0.1        1.30            -0.1        1.34        perf-profile.self.cycles-pp.rcu_all_qs
      1.76            -0.0        1.75            -0.1        1.68            -0.0        1.72        perf-profile.self.cycles-pp.folio_unlock
      1.90            -0.0        1.90            -0.1        1.76            -0.1        1.78        perf-profile.self.cycles-pp.do_syscall_64
      0.54            -0.0        0.53            -0.0        0.50            -0.0        0.50        perf-profile.self.cycles-pp.folio_wait_stable
      1.80            -0.0        1.80            -0.1        1.72            -0.0        1.75        perf-profile.self.cycles-pp.xas_load
      1.10            -0.0        1.09            -0.0        1.06            -0.1        1.02        perf-profile.self.cycles-pp.security_file_permission
      1.48            -0.0        1.47            -0.1        1.36            -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
      0.62            -0.0        0.62            -0.0        0.58            -0.0        0.58        perf-profile.self.cycles-pp.x64_sys_call
      0.35            -0.0        0.35            -0.0        0.32            -0.0        0.33        perf-profile.self.cycles-pp.cap_inode_need_killpriv
      0.24            -0.0        0.24            -0.0        0.23 ±  2%      -0.0        0.23        perf-profile.self.cycles-pp.is_bad_inode
      0.87            -0.0        0.87            -0.1        0.80            -0.0        0.83        perf-profile.self.cycles-pp.folio_mapping
      0.24            -0.0        0.24            -0.0        0.22            -0.0        0.22        perf-profile.self.cycles-pp.amd_clear_divider
      0.70            -0.0        0.70            -0.0        0.67            +0.0        0.72        perf-profile.self.cycles-pp.security_inode_need_killpriv
      0.52            -0.0        0.52            -0.0        0.47            -0.0        0.49        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      1.62            +0.0        1.62            -0.1        1.51            -0.1        1.55        perf-profile.self.cycles-pp.up_write
      0.22            +0.0        0.22            -0.0        0.21 ±  2%      -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_folio
      1.09            +0.0        1.10            -0.1        1.01            -0.1        1.02        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.35            +0.0        0.36            -0.0        0.32            -0.0        0.34        perf-profile.self.cycles-pp.inode_to_bdi
      1.25            +0.0        1.25            -0.1        1.16            -0.0        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.25            +0.0        0.25            -0.0        0.23            -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
      0.79            +0.0        0.80            -0.1        0.74            -0.0        0.75        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      2.04            +0.0        2.04            -0.1        1.95            +0.0        2.04        perf-profile.self.cycles-pp.file_remove_privs_flags
      0.55            +0.0        0.55            -0.0        0.52            -0.0        0.52        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.61            +0.0        0.62            -0.0        0.58            -0.0        0.59        perf-profile.self.cycles-pp.xattr_resolve_name
      0.73            +0.0        0.73            -0.0        0.69            -0.0        0.70        perf-profile.self.cycles-pp.setattr_should_drop_suidgid
      4.51            +0.0        4.52            -0.3        4.23            -0.2        4.27        perf-profile.self.cycles-pp.__filemap_get_folio
      0.47            +0.0        0.48            -0.0        0.45            +0.0        0.49        perf-profile.self.cycles-pp.folio_mark_dirty
      0.87            +0.0        0.88            +0.0        0.89            -0.0        0.83        perf-profile.self.cycles-pp.aa_file_perm
      6.97            +0.0        6.98            -0.4        6.56            -0.1        6.86        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      1.39            +0.0        1.40            -0.1        1.30            -0.0        1.34        perf-profile.self.cycles-pp.__vfs_getxattr
      1.65            +0.0        1.67            -0.1        1.56            -0.1        1.60        perf-profile.self.cycles-pp.entry_SYSCALL_64
      4.32            +0.0        4.34            -0.3        4.02            -0.3        4.06        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.90            +0.0        0.92            -0.1        0.80            -0.0        0.87        perf-profile.self.cycles-pp.simple_write_begin
      0.66            +0.0        0.68            -0.0        0.64            +0.0        0.67        perf-profile.self.cycles-pp.file_update_time
      1.15            +0.0        1.18            -0.0        1.10            -0.0        1.15        perf-profile.self.cycles-pp.__generic_file_write_iter
      0.78            +0.0        0.81            -0.1        0.69            -0.1        0.71        perf-profile.self.cycles-pp.w_test
      1.02 ±  2%      +0.0        1.06            -0.1        0.91            -0.0        1.00        perf-profile.self.cycles-pp.strcmp
      1.50            +0.0        1.53            +0.0        1.52            +0.1        1.58        perf-profile.self.cycles-pp.inode_needs_update_time
      0.78 ±  4%      +0.0        0.82            +0.1        0.86 ±  3%      +0.3        1.05 ±  8%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      3.35            +0.1        3.44            -0.2        3.18            -0.0        3.31        perf-profile.self.cycles-pp.generic_perform_write
      5.56            +0.2        5.72            -0.2        5.33            -0.2        5.38        perf-profile.self.cycles-pp.fault_in_readable
      0.85            +0.2        1.09            +0.7        1.50            +1.1        1.92        perf-profile.self.cycles-pp.rw_verify_area



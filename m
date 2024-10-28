Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8223646
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 05:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093053; cv=fail; b=mYTV26WOPpLM+fhH90g7KUGs6L9qug493yEA1XULEjVdsBvd6Vs0GbSXnCFGiKBxbUnJqtvOapRC7Hhv/nMqddOTUufNcFmVb3PB4lBtC9sutL7sMCRUKArkx7B0q3pU2vsGnA6y4blbnhh9c7PA1N0SHGinbfHQhAeXj3W97B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093053; c=relaxed/simple;
	bh=qbl1+n0FzxvperHlony1DV7Jq8ikO5+qGbRd+U58++c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kNrIbKSue5GGHlnY+jrZ3rpjupywQd6zULL6DyEfpR8YrsNyRXP/QWqLup4DeE0vuUUYeR5iyKqiKa9Vxi9GskZzHWBMBCz37N4IHoX8r0KWF7ZShUmM09Y5HzfDVCJgAO1XWrQIGXERy9F7x1dXUUwvssup00LT1Hr+GjZKJY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDiFOkvJ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDiFOkvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730093051; x=1761629051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbl1+n0FzxvperHlony1DV7Jq8ikO5+qGbRd+U58++c=;
  b=XDiFOkvJmX+f8E7oLjbNOSoG2+oBUXvxZNTeT0iJmJjyczX1u/+U3lmB
   ZuJP1/o/vOrRyQ9k8yRqldcqPnpQTJosW1gJkLXVb7b41/W4b+mzXRUwM
   eP40JIZSV4h+xgOKmQRlNpVBySy9oOxRQ3KIQbydAyEptlkY4RNWeW4Au
   bsFXhzF4xa61lUDLFED4jVmUj57IIIlzCTd4juN/ZQ2xCt1it3Cg2asdM
   FRFDnqCuizx4zgsXofo+g+UU3qS3RMbtQ4G+7ySgD8RXSCZU0uSMF6lZ6
   2yOmFVl1WE8jSZ3AsUx1OOBJdvpY0ZNWThnOwSqBxr/2ci2LkDKGe/TQ1
   g==;
X-CSE-ConnectionGUID: 1fCxeFT5RfiWoTlnHBK12Q==
X-CSE-MsgGUID: CxTSKoEpSTmCXL6Wb8a0CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29584360"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="29584360"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 22:24:10 -0700
X-CSE-ConnectionGUID: FBBlDYLaRpSylJTbmM3hhA==
X-CSE-MsgGUID: qIzLLStnTyO0OnwmGjJSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="118969120"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Oct 2024 22:24:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 27 Oct 2024 22:24:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 27 Oct 2024 22:24:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 27 Oct 2024 22:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7ijsdVeUNs3UzzETXEoG99Nw8fJbzKkQk6oYFZzWWII8Tkbi3FRIqv7Jn7Gb1437/BDyw3/UCHZYgp09pZnpY/YYZyVp2cH8fII/rLZEkQTfKC16z2m/H5Y6RGzVJch4+7FOhphYMX/EbYFu3LOLjLPbbmZVO5dDuEB8gs0ddono4j3MgvsDeEItR4i/ds/hReUVud6iFL/olwdMdq6OXqQ3ack/Zs8EQQIkCm7w/hahBQ2ITcLHx7GinbIcRKABzOQbf4gJLYw6MdaH/wH4jIiEq7clvvyvYms9p1AbohrqcRRMJ7lzfQaM4dEA7bcktHg4nbzh40aMShpy+QzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z51G4w9LVsEziQHkDK/KUp4NJoR/hCQrrid1a9MgizY=;
 b=NfkdQ2SN93SWGn/Ui6W1Uwt+z02FV+cyNbJtIB3WOF0AoHP2Ep/qDWLD/tXGJ+wB0efFBpdU5eacIk7oGxQeDuzEqvYLU/RSVhzjl3nJMWYBGGrvgWxp1yjSQ9nObbjrie6CGw3BYuRWfghoGk14OKWDpqkNguMFw1glk11RXD43v2mGjL8wUxrECQ9HpEIk0Hzb6RZk7DonFPXuv3Rg52VvVJxjkKpq8YNejeLWW2n3Rwt7+SSlIYJ48sSQ3khqX+eL3z1kwKLEMC455ThTrrwbcJl56wqkqKdKBq1ujge2KpvtbjeXrbO7UoeA/gxhyliuqqwvPgZlD3UoXMcPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 05:24:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:24:07 +0000
Date: Mon, 28 Oct 2024 13:23:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ritesh Harjani <ritesh.list@gmail.com>, Ritesh Harjani
	<riteshh@linux.ibm.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [riteshharjani:atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1]
 2eda7299be: xfstests.generic.350.fail
Message-ID: <202410281346.cfd98861-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 908e2a31-6438-4139-a71f-08dcf710bea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wR6ZzEucECWIVeXTtLdjhhFOb/fZBPu1lItI5NfgCZYufcNBROGOA5GA0eeN?=
 =?us-ascii?Q?y/HD0QXfzIU7xJLBBF/cAl5wAWpeO4ibtUmfoViwbFV87WDsDhjI87BbuFqH?=
 =?us-ascii?Q?HezODfkMfbtJIbUpS5gHATGSVKqDr4FST3pMEElLOqB79MBmiACxjcUG4SOA?=
 =?us-ascii?Q?yJ7KdJ4gg4ymvU/y3oPWxSsE2OWADgpErh5vkG7/Yn2UIJRVCiDrNmIM+/he?=
 =?us-ascii?Q?sdLanvMyitx2d132sIUSxf3rps8o4xqXeolLnTJQT+b8W9iVgFvarmJbqbSE?=
 =?us-ascii?Q?ohVFXRy8YeqEXKjYOU9NevhyvbztocoT+cAjrUL/2EDIV9XdIyVKshIY9Z5L?=
 =?us-ascii?Q?Yg1iCxz20hQxeV2flhahE4O99Zj2lnHfUDXmMolZLs7piZ7WiQgugMQYJO9n?=
 =?us-ascii?Q?DUH/VYcE1e+vBCu06KV3v9aMzU9vq/osJRKPCxcXLgbJB2qY1Tg2FImT3rKb?=
 =?us-ascii?Q?rrl50eSCyFvl5ARPeN9Rdx0wUiHHXbFmI+IC6XDytGmgoaA5nBOfpuUnzU7w?=
 =?us-ascii?Q?S19BWMK7w07O3QX437UIUt8DMs9IwVTDtnZOP8fHhTv/qaiajsYMlRoA7SOr?=
 =?us-ascii?Q?y325sGlcnitnqlvKH8NdRkstlKhHka1970Fg0P2QdXzkJYabgd4gtH1d6fGL?=
 =?us-ascii?Q?Td+5LnUqk/GnO+2Lk0kqUZKFkC4mI97+fGI5gnoyTF0f3gcmxMJZs0zyvg7i?=
 =?us-ascii?Q?kIDtkVGW7HaC3MgwByzDtdy5WjYP2QJyRRPFA1gFM71TbYtbGM5LCAzqVRTU?=
 =?us-ascii?Q?j+UteDptGFYINWa94bpIr71fA5HjKGVOIld/r/VPx/0EhsHRfss8h4DXNpfx?=
 =?us-ascii?Q?sDqIImyn4JWffuDeqHoulLfnmbiExyJuyteSHvyH6zWK9dqYzUE8Dl/CQ4xq?=
 =?us-ascii?Q?rEkrpT0VuWKa1T5HmRJupC+597OKCECpS8mgASAdVa9vkInToeJf0r28Xetf?=
 =?us-ascii?Q?9l6ABskxbgrf0yJ7TtKrNewinDoWng2q6Pntzbl7TN8FlXPPC3jfpj0Y97/h?=
 =?us-ascii?Q?nbKgCoNfXxyIDGVSWCEkJhGLiIqvh/b1nGwSjn1hLOrBoOm+zGVF1Qs6iXnN?=
 =?us-ascii?Q?hrhEtrvAcU2RzcOWwcTXnHipQL7sB84d+peqvW7YL01cgN2lJsdM79YR6i/B?=
 =?us-ascii?Q?ePPI9GqB90cheanOtjz9YpwvSLVs8NRFIXl5uRwxrNXCi52Yc/ltu66Gss3W?=
 =?us-ascii?Q?F5bcCXVNuI7JKb49q6pEiGrZeFRqPzxlx846f3wkVAzoooYHYMEUOE2te5hg?=
 =?us-ascii?Q?fRB5D/QOScoRefmSp+UxO8Rs1S1QZQEvgG/9+0Om+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sPHQTVIBdqqaMR8cnFJKiNNWE1fYmtRoeK0NqHZce7e0FpctJ0fMfGSKP7sF?=
 =?us-ascii?Q?HKA2IhaJeGhsveK3Uv+QV8irEdLf+eakqxKdwEG9szAmwm+oLFZtzlsfysXq?=
 =?us-ascii?Q?ItCXx03tz3ZGzuySzoBWNWn4knXX8T+lq4kdTZ2Kr+VTvHI2FwYP7+WKRndD?=
 =?us-ascii?Q?lnw9P2MP9ioeDKaTWo0D2W+6qRp5yaksD0yWiPCa7wl+MGebmWbfc5NpOgKp?=
 =?us-ascii?Q?p9vKzfql+kEwshs0vBvpfVNRXGFBXgb/fY1u9FDHpD1Pq6aAW5dDfdavQ01j?=
 =?us-ascii?Q?aQYFwgrwM+i5i4mkcYt4xVsV/Gic5+3IxXGZGb3uCzJRZbJUt7OYCBS0x/sm?=
 =?us-ascii?Q?KbSrzvJKfrftdLfebkNPojSBxV1EJ4NK9h9zt0eWm3BPTkHMV91GDhlMMPip?=
 =?us-ascii?Q?vXlVFhzgaa9inVBESgzeivc4BtwcD8PseWY67FTp9cAUxhU5IIBEz8Rnhwi0?=
 =?us-ascii?Q?03V5sgcrQX53KAHqZoSUS2YNhax26JQsALiRMrxolZeaEhBvu/QoG4+muzEd?=
 =?us-ascii?Q?L7CzkoTj8WfGDMIDHZevoo9I900jZfsCRYa/of4+mW9DpXxknxcw0vUoxK2O?=
 =?us-ascii?Q?MY9K+V3KSx4FsDOjgM+g5AEiuc+hm5j34dba18lOGEeb6GNGJFG8kvcnkDz/?=
 =?us-ascii?Q?pa9Wt/zTOWArH/WS+/gXtI8cG3EeFbhg4a9Mag0FVtdw3DlnFW8G5JJEONhd?=
 =?us-ascii?Q?5m8OnyEkRJvi6LPauTAwJj1QrLtinx2wvqIYGWqJb+SMvTVHmyT1jTSS5jCf?=
 =?us-ascii?Q?q8T4ZgNLasmQv2uXJ3nyNjBmm7Yc+0ZW5yUmZaabWmZq7FnQH9BElqUkB3Te?=
 =?us-ascii?Q?RHlRXhXUC1jdUiNy5ZMjHepMtgYViOjy3h0XJAQCtCboxp8uj4ijVlO4Jtum?=
 =?us-ascii?Q?nsueDC7s6HEIHK9ZG39zFKu2QfVfEI2DYLX8DZdaJfOlQJ5wEH8x1jPzJK2O?=
 =?us-ascii?Q?mBEhdjjKUe9O/2mPh9T4S4Gd3VO2ktVndIKZrk/7yOuLvd6QEMYeANh/M8EH?=
 =?us-ascii?Q?JDizLeLsbYYhY8hv/2N+k1TGjKes8DYPj/gvbP+K1Bl7rkTvFpp1r2LjDxM6?=
 =?us-ascii?Q?FshCKJ7/htLCoFQPRe6oZNO8EM5W05BzeYaGVvg2H8FY0zsItVxIEweHEY4Y?=
 =?us-ascii?Q?vuY7AGmSNn3iof3CjEtIJr/iZJI9d9lRUMgGBI/KTkZgAlsEBy8nPiGAlx0i?=
 =?us-ascii?Q?2uX7TGgJ6TedCUfMsRvuQOnUaM7HlAaqLxKQI5GB6xQZU5TCCDpf0dlRb+7F?=
 =?us-ascii?Q?7p1nWH30GbunpBGp7J1BSwkdjDlZAhQAfz/EznRO8tcPbMcPNfrwXiHmqmBj?=
 =?us-ascii?Q?RDW2nhU1PTeSArJdk96AchIul2UcJdrSH4XlzHmKwma2vreBmkF5IAE7XJqu?=
 =?us-ascii?Q?6BRzCnWc2IKueRl0eBsgSbFqgLA96nEs0FsY+wSCCHGGOPgMLwTiNT3nhKFn?=
 =?us-ascii?Q?lJUg9MidcJwZXt1CrpH8TJt6OuJZk7vxXbzgPLpduiLzd04k6/V+OimnrIHx?=
 =?us-ascii?Q?ylPKuL2/nSe93bnoX4esi4QygYJDDH1etTEsWZfMnag8sz1zLPIcjRDAudT9?=
 =?us-ascii?Q?ltqtzi2jc3tP2mbZkdy6a84YBPrKzZyX+oit9V9kUFM761SYIsn8QpWUw2gO?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 908e2a31-6438-4139-a71f-08dcf710bea1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 05:24:07.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4naWp5hIEpKKb4rRu4sYSLOoaXPeT7LQV7EwEXYnbNlIM3UT3x0JJYkZiyA4+HwFC/TR5vAI0F5FoODi6pP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-OriginatorOrg: intel.com



Hello,


it seems a debug patch to us, below report just FYI what we observed in our
tests.


kernel test robot noticed "xfstests.generic.350.fail" on:

commit: 2eda7299be1daa307b815b480cb9dd0b14ad062b ("scsi debug 350mb device and 2x shosts and DEF_PER_HOST_STORE=true")
https://github.com/riteshharjani/linux atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1

in testcase: xfstests
version: xfstests-x86_64-f71228e3-1_20240930
with following parameters:

	disk: 4HDD
	fs: ext4
	fs2: smbv3
	test: generic-350



config: x86_64-rhel-8.3-func
compiler: gcc-12
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410281346.cfd98861-oliver.sang@intel.com

2024-10-24 11:26:11 mount /dev/sda1 /fs/sda1
2024-10-24 11:26:12 mkdir -p /smbv3//cifs/sda1
2024-10-24 11:26:12 export FSTYP=cifs
2024-10-24 11:26:12 export TEST_DEV=//localhost/fs/sda1
2024-10-24 11:26:12 export TEST_DIR=/smbv3//cifs/sda1
2024-10-24 11:26:12 export CIFS_MOUNT_OPTIONS=-ousername=root,password=pass,noperm,vers=3.0,mfsymlinks,actimeo=0
2024-10-24 11:26:12 echo generic/350
2024-10-24 11:26:12 ./check -E tests/cifs/exclude.incompatible-smb3.txt -E tests/cifs/exclude.very-slow.txt generic/350
FSTYP         -- cifs
PLATFORM      -- Linux/x86_64 lkp-skl-d05 6.12.0-rc2-00029-g2eda7299be1d #1 SMP PREEMPT_DYNAMIC Thu Oct 24 12:37:44 CST 2024

generic/350       - output mismatch (see /lkp/benchmarks/xfstests/results//generic/350.out.bad)
    --- tests/generic/350.out	2024-09-30 21:13:44.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/350.out.bad	2024-10-24 11:26:14.507852855 +0000
    @@ -1,10 +1,13 @@
     QA output created by 350
     Create and format
     Zero punch
    +fallocate: Operation not supported
     Punch range past EOD
    +fallocate: Operation not supported
     Check contents
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/350.out /lkp/benchmarks/xfstests/results//generic/350.out.bad'  to see the entire diff)
Ran: generic/350
Failures: generic/350
Failed 1 of 1 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241028/202410281346.cfd98861-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


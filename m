Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BFC2D8767
	for <oe-lkp@lists.linux.dev>; Tue, 10 Feb 2026 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766233; cv=fail; b=OftgrnoUGOGTO47bl/vrnJIyBnYz0yqokeeL1yj8atMiOvg7anZVNudErlUS/khyE+/ISoylQqi0PmtPSCatNexOSrm9LE9q3TSUmGlcqs2MTxCk6W8lyCrJ/akJzHY5rqkZ7BcLRiYIWfrvZyXM5xjMbPzbCA47/LquVZq0hNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766233; c=relaxed/simple;
	bh=FshLr0UBej8xV94CnfvqlIKEstoB8kEX7m9UFEc2AAs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=H0HuT4vuHe3kdKiLNcViYGeS9lrINjzTIqI55iQENRDIRu5uetYLnn6dW2SWZyIJe4SOpyW5/tsCCdSdl7cxYWGPDy4xkMNGUHgYpyXXmFFUS7R+2VT9IE8scdx3j8uorn1TWkhzlhTEhfMw4XgmLeyNEnv5KAdH8ix8ZnidAxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGsFXPQp; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGsFXPQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770766232; x=1802302232;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=FshLr0UBej8xV94CnfvqlIKEstoB8kEX7m9UFEc2AAs=;
  b=HGsFXPQpxWSLJPKiW07a3Q8y1n6bJc1R0FNjFipi1Alss07EKN0daVYi
   9JjCPGjQaDXb3xdomREFBFxPfUOvQkeKf8UUJo4PKyI4CKbQE7IFWdIxX
   fDCMcosvVdue5RvauecJScGEDoqd/XUECsvjYG4zt98EIo25azGWzhV4u
   g3pamZTEKjjXG6DeK20C62hJL3EQOxpEFAoKNdpqFK7VpWBitwmAFzgPD
   uFqXyOKydAD45LDnox+HJxPz3hMD1FKk5VRENF8+cjCss0AcQaYpC2oBP
   NuvW264ote3yVBlMwLqIF0iZsLa507WKCOJ5vtx8EwsRWr3LYlMZj7eqI
   g==;
X-CSE-ConnectionGUID: VpLlFzobReSwhf1EyEoCBw==
X-CSE-MsgGUID: iUrRVmF7SbSGiIMFS8/bNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71802291"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71802291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:30:31 -0800
X-CSE-ConnectionGUID: ClqcsAKFQYKF1b0LYzaeyg==
X-CSE-MsgGUID: GShZyCIuSpuqeiDt54Fbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211065235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:30:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 15:30:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 15:30:29 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 15:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVzbxXXLyF6RO6ld2n64wabMGq3jbD0CLuGyuh5BuZzVqJLk56ZivirWTUxpF9gTQJYGC67T0Aijtm6gHLi3glB3ClGfI00jha5j5tNFZVuJyKbfCJ9lXsSjGuuY7oi14IeBSYTxsP5sND82MT4Ls56h1IPUj9EqQtMckkqrE8RjXsXGO5YzznF0vX5KEVNWIkp0pM+iWb5ldHTdBJJaww8Jz/Pc1nHZGdWk0z5s43Z4K7JU2TjD4uMKas1m8zYdILDBjnmusKCdwI9w8WaIB6mnIQ5p+d4O/4H1O7USBu0KFz7Grwa5ycv2F3zdmzqTEm2zX6B2nJLdF7OBr3jCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/ZoWxHws+BlJRLdUQszP/zBJj19yE00fJeET/RyoDY=;
 b=dcDyOsyyYrg4u0EwrcHGCHdwDOS/0Cpcof2ynTzeyZEtQAyrRXwG/7ZvYyxQWzvPa86JK1Cm2s6kYy7F/dKjfsyCy+DLnV0aqzTq2hoWgpjJCjzPuT4eyO43xUBYIJW1d7XTu+OHpTEQ+s6h/WycjUn/dNbLi5YoK/D4APdujrtgJx9GHe632srSrSMqmpgpcAlaBCnhkdw/pmdsKsqd32lO+iGnow3fHm/NYsxHDnL8oi70dc9kZ4EUgHIF7afYuQ1CASt9ssDy+l7gm8ZMLkTFl/0ETpgEGTpIA1UBF7bAEFnSuniaNNst/dXs22pj19UaVsiclI6cQXrFUgiSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 23:30:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:30:27 +0000
Date: Wed, 11 Feb 2026 07:30:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:deferred.namespace-7.0] [mount]  4f5ba37ddc:
 ltp.fsmount02.fail
Message-ID: <202602110647.174d25cc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0050.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d0cad8-ee1a-4081-1f4c-08de68fc5ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHK4mEyCacKaxtg1hsk/vqI7KyqSMZ4OCb06zbpYRfcld4c7VOnbAWp31ZUZ?=
 =?us-ascii?Q?1V2J2wb4jw0lUufg64dk8Jyn/5F7Gg3XmDKOfqEHXKM2rdBHZ8+S3k/Cm8Jx?=
 =?us-ascii?Q?HfGf3M8gLtTEDxh2PHnQN/P63hxAhEhY0IWxHBG0jUFftSN0raXIsgRtFWFt?=
 =?us-ascii?Q?brz0uWZJMK1DEDevP3Eh9bJVMCZFsXG9YfGXdiodobaZjIx9zxal4rG5OLH/?=
 =?us-ascii?Q?Nd6Blt0AROVp4IMPvGSjuMs2v9Evk1zz8BWzF19i+3otHkQzAy6CFcEkKoTh?=
 =?us-ascii?Q?rI3djM8DEj5PUKW2sqMOX/TrlGQ5sGMNDFQdoTFPvqpQkB7PBIfyVZx73hXw?=
 =?us-ascii?Q?6FZEViW17RktWuxrffh+z0PMfB4rTffcGG7iVJYkTq4PJCSw+/11p+XMOLmD?=
 =?us-ascii?Q?0WkSw4GOq/v2qi8RFP8eMCXDbDRRBHI+uil4y7Ag6pr+8WQKIQMXE+Ny50oJ?=
 =?us-ascii?Q?VPyLpteMq9prJEhKhmtQxCiJ1xIyit2JEkltERaFvyLdMC16x5fYnmrG3qBa?=
 =?us-ascii?Q?N1ZzQZExdss3iY7YGj/vS2wu0pQXIYg0t/yvJeRoVJ03nWM71IShWC/+wFO7?=
 =?us-ascii?Q?m5tLMYHxvTHKNYuzYiLaXgXv/yf6WBZFkLRTOvMqdq/jlsIzfrE7Zv31d1q+?=
 =?us-ascii?Q?Wcfzp5Eq5YPpkogoI3omvDLTQqZYOOg1MjdIi7z6hGplziI3g6+Za2dVd3nI?=
 =?us-ascii?Q?pp22UfBuYWADSN8j4JcacHT7wrjgCiddFNDOzwYjUcrFx2kmmkLmgTo5yVWr?=
 =?us-ascii?Q?/viewyMeM0nidOmp3O1FLTSJ70YJDqEuzP0Esmyix4lJnWDZC2proxN3MzJu?=
 =?us-ascii?Q?41fiiZMb59ir7wdvnI6SR984NhkTLOVFPlH4pfwoW2uqu6b2+4VK96my/Gxh?=
 =?us-ascii?Q?7si3VdyY+u4rUwaME85JfpgP5ZAhGJ6fjiHjqcgxT1CP4+C+i0VESX9ApK3T?=
 =?us-ascii?Q?OCTa4Otw99bjZjo5veu3q2qjRzth0oy+hg3+E1yutoi3XGYqYUUYysEJpBs/?=
 =?us-ascii?Q?lsunuuNfVwBBgqbbN1yGBj0ao6CX12IfUhVu2pgasBGrYtq/Jrflw93caTz6?=
 =?us-ascii?Q?8SAFB309fs55c0an3aaBbqI2ODZxiN4avM0QwfO1eSiW023ZtzcttXGiKX0O?=
 =?us-ascii?Q?9/ZXF7sVDdZfUfg63jpHcN3EZLfMaPAXI/VLNN2GkcAZk/ofVTumKQz20SO7?=
 =?us-ascii?Q?h0cCiEcSCzYAwqRCvQ6XktzFTsr0ClU4V/HLL5kGOs16ndfyM71qOCYr7+Tr?=
 =?us-ascii?Q?1a7b0D4hN0kgKcJ1uL89+rIVMRPrBsTwWMIfR1TfcVkW6z3yTqZ2I/BqUSHB?=
 =?us-ascii?Q?3a3Y61Nm4sJERZO5bi8WwMhkXjvVqY+o7Jtu3aYoq5EZeXFrTmABXT0clifB?=
 =?us-ascii?Q?ihFZxlPd1rm5yZAVGaFPBVLerXwDPipPgK6A9UizhRP9L4q5mIbFQaa1q9xx?=
 =?us-ascii?Q?B7xPbA83n4+SVgm2o7yWdvKJlhWo31f+kKwvVYcPtjK6PscNhWqQYTna12lt?=
 =?us-ascii?Q?fygw8EPfEU2y74HxFJYJz88Qo/bScvw6EywY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rIxclmHHfTQm+FnI/r6xaKjfQWBTSeNJxvUQk8alNNr/vK8xZZCMFq6B2Fa1?=
 =?us-ascii?Q?VSurRKUj5yb6a7jhUOTD9tdXm0aaTrVEoME5+Cb2u8dJe6XyjNvyAIc3NA3o?=
 =?us-ascii?Q?Jw2UxWn9mCkdrQwny27MnYvcdXNVuFjscLQemb8B5R20BmWmTdoIuSBour0F?=
 =?us-ascii?Q?CZMvhF3Lrmg3P8WooYYO7FbuyhVWzFyFPk2Evt/w/GsWx7deKxzP8qd+q97h?=
 =?us-ascii?Q?KbVd/R/HziaV28M50dLB8VeM7S0NvVwHZ98VzQ/ZASiI6l0jlCSO5fL2k+aj?=
 =?us-ascii?Q?0YqNVeZTUOUtf/+Rkj6ErVDndxxhh3wUb3LVDIMz/avoJIPthjpRt++GY546?=
 =?us-ascii?Q?jsjnkgrQNnrQ0iuURisNvP+8YddQsqjYjq88r4pZ4HdtSTIH+MKb8Ak+D/y9?=
 =?us-ascii?Q?pRKybVUAgkFa5yzdooDWveUWJsgwrYRCrS0D/b2chk/hR+ZqRIeLVbKsF7vN?=
 =?us-ascii?Q?/DZ2P7hemAlYViiHp+KzTQzXOhnQIBzg2rpB/0XaS3Xc42Gkhqf66SCSsWMP?=
 =?us-ascii?Q?j54nR5OCXmnzluFjZIHVjls/NjlAxBdEOZZlWqVv7Bs4OoPU5JT7UW6Jxqxm?=
 =?us-ascii?Q?jhmw+UFh1M1teQc3rMhTZbLSMGv/gKepeS1Cn4fxlNtqSFMmEaJz2nfrSV8U?=
 =?us-ascii?Q?4HBOEhSodHGVGQdRDveBagHyuKa0y2GuXgxVLjRrIYszr3D18KxKnqPDweod?=
 =?us-ascii?Q?5Vb3FJ/ASS9/aP2or6WwJ6DPtElKQx3SwqJwsqg6kVmJwm3rE+Hsmb6lUxbx?=
 =?us-ascii?Q?Wlmmsz5jeZMnohdcm1s398j+XteIqnlZa4cvPFzASm7ZHzjRPb/71jm+6qcH?=
 =?us-ascii?Q?Yn3LrAbtAfvc2fn7jpNy8nGRcsF4kcez+SUUSaayrHjQ7KOYuU0RXLHzuOm+?=
 =?us-ascii?Q?lKvw3SJ+VBsjx3Qv/oK+YJgxNjEMIA9XdrUlchlHeXwcEwr0dHaGnMftJmWu?=
 =?us-ascii?Q?448XHXAji+yNeAa6R0bY4YzZy4mvyd7ygqvhVqkLCqfuiPn4N3RkVGM1OMYX?=
 =?us-ascii?Q?1a+BX9yYX3OI2Z3IbulaTq4bTGhmq/UQMbJ3e2Fw4nsxOC8rRySWEmcPgxDM?=
 =?us-ascii?Q?CrBSMnAYeqYy2euSu2WyQQDpVLjM6e5OGyf+GjB5a8hJ5wRVuJpbo9DxuQl9?=
 =?us-ascii?Q?BxKXqr9eABFiHYh61c/GpVr/MQ/SiQVBkIy3P3gx2oBimNsbUFroTgTL2xwK?=
 =?us-ascii?Q?gtniobOE6fy4Sj21DkzAGlXcmQQSsyxyc4Ti/ayqORwS4SBag07cbf04qzwa?=
 =?us-ascii?Q?pLQH5rc/LmU773wUwJcurKWN/eX5SBacu1HyCSZ4jJ+ylijLiHE2+Tq5W03S?=
 =?us-ascii?Q?wqSho+9n3JhFQdqxpdbE/EJhOlJEK03dJECEP8/wwoB7k+uAEL6Dv2QLchmt?=
 =?us-ascii?Q?BjIVCj90lw5sMT2RBLhLq/5vtkTGiB1GpJssWaMBh8XqMqPu/JxQI6M+D2Yd?=
 =?us-ascii?Q?UN37pLQ6dKhW/V8FrSpf1fccNbK+3sNqNT16xziFHtfnyyWSjb1M7ODxu/yr?=
 =?us-ascii?Q?VtpEFD6Bh2WA2+hphCgHtyjzUMUxwX0O0vlzh/NNhTdZTOpBK6rfux9TBbSt?=
 =?us-ascii?Q?O+iHQEuwosb5WLQm+U/OkI6SjjKWhuRDQwUhTzORzqKjVAkvlM+vDuaSs3QP?=
 =?us-ascii?Q?6/Nuf/FvJrlJg4uvAjtsefUzO/bCzm7aUg7CDf4MeLYO2PN+Dp1NcXKyE1TC?=
 =?us-ascii?Q?V1dSgeWRmDcktEg2VbyXYxAdwPtrjJhM3qTlWg0rEYHqRYzB+w6Za71wYXJD?=
 =?us-ascii?Q?Muv0cygpbw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d0cad8-ee1a-4081-1f4c-08de68fc5ee2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:30:27.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqDmz24s9MLOkXbYKYqyP7rOrFEUe+KWeDpT3gYohaHXoLQ4RMlXvabcaktE2LHyqWzo3sDNlbOoP8ZrYXKy8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.fsmount02.fail" on:

commit: 4f5ba37ddcdf5eaac2408178050183345d56b2d3 ("mount: add FSMOUNT_NAMES=
PACE")
https://github.com/brauner/linux.git deferred.namespace-7.0

in testcase: ltp
version:=20
with following parameters:

	disk: 1HDD
	fs: xfs
	test: syscalls-01/fsmount02



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (=
Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602110647.174d25cc-lkp@intel.co=
m


2026-02-08 03:11:35 export LTP_RUNTIME_MUL=3D2
2026-02-08 03:11:35 export LTPROOT=3D/lkp/benchmarks/ltp
2026-02-08 03:11:35 kirk -U ltp -f temp_single_test --env TMPDIR=3D/fs/sda2=
/tmpdir
Host information

	Hostname:   lkp-ivb-d04
	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
	Directory:  /tmp/kirk.root/tmpzfihn7lw

Connecting to SUT: default

Starting suite: temp_single_test
---------------------------------
=1B[1;37mfsmount02: =1B[0m=1B[1;31mfail=1B[0m | =1B[1;33mtainted=1B[0m  (2.=
728s)
                                                                           =
                                                    =20
Execution time: 2.793s

	Suite:       temp_single_test
	Total runs:  1
	Runtime:     2.728s
	Passed:      16
	Failed:      8
	Skipped:     0
	Broken:      0
	Warnings:    0
	Kernel:      Linux 6.19.0-rc1-00011-g4f5ba37ddcdf #1 SMP PREEMPT_DYNAMIC S=
un Feb  8 10:38:35 CST 2026
	Machine:     unknown
	Arch:        x86_64
	RAM:         6899608 kB
	Swap:        0 kB
	Distro:      debian 13

Disconnecting from SUT: default
Session stopped



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260211/202602110647.174d25cc-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


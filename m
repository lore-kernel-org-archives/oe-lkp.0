Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D954C98
	for <oe-lkp@lists.linux.dev>; Thu, 19 Dec 2024 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734575564; cv=fail; b=QyoU1IzWnQqRwkkjg2L5Yft4+eivyD0/KzAUUiBy8KAEZ8r3F+gXnHPfCGPZfghMmrT5LjfHxPvIXZQ6qSYKu3gJuIGy2zZzBWCDwoB3EAxDEK/BuxkflWZjaRwfvhoPBUtQjcuimLd835Rriy22DoPEZcEOS51cgP4S7GmSwaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734575564; c=relaxed/simple;
	bh=KExA4L92IAbRZizzu27f+qEk9nV1CeVxaVJU1BB4X1g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rpwgNvrDQHohp26mAlXoESUDcsC5q5L6VaMu7zaCEuG/xM3sJGLbi+uwb7SFf03wwEO0nbOqz9liybMEsu6PhuponowqFU2D2ykRs+x8hO82HWn2x4jNiPd7iV73IIZ6rtOlQo5hzxDfFNtuluKSJcuwYPFqvzLMnplcQDTB7dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuDqXvcN; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuDqXvcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734575563; x=1766111563;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KExA4L92IAbRZizzu27f+qEk9nV1CeVxaVJU1BB4X1g=;
  b=NuDqXvcNuNnoCt7amoRZxKH1nrsIkfFfT4dZ3qlja7u/X3rzokY1NgB4
   08W06XNFLSOMKT5qpqyZ6ak5ukmTs7tZELIbyiMYdPwvgbkJsKUYUpAvJ
   gK1rNSTjxeJQU2+iM0BpDDdyt3MIAIfbhSDMhgXB/oBZfStJF6+7/BWWy
   k2f1GfKVs6lzICGJNjOIKUaQkwGw77sb8gmyOxVnOfxP34rSxCDU5Fsm5
   nMemK9VOt2niCzx6+LtJ+3yPOa4djzXxQtM5ymwPM8YV8+3pEAROO2fpg
   WO803i1szGRq8VzzSzBySyW1R764I+Dp1l6s6ny1xj7wx5PncgeH5I+SZ
   g==;
X-CSE-ConnectionGUID: qSHsBcR5TdOzxVSUUSnp3w==
X-CSE-MsgGUID: cvAN+IQcSm2SrqY3kmMU9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="39011031"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="39011031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 18:32:42 -0800
X-CSE-ConnectionGUID: Y4VLaRrhS3ecyqV/tdILTQ==
X-CSE-MsgGUID: 8iJjFY+6QvSoVBXt/R/Xeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="97847011"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 18:32:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 18:32:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 18:32:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 18:32:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frjB/Rhyw62XKeHpMmX5+ZGTjcQLNesi+bQeWfc9JF4sZrd9BSLXal6wATlf1d/h6vR5G/EoVR3Vpf9ZCKup72HuENFzubVBRmpyRqNh8vIgpLA09AX+QXdbUcPcFFa7vn7ASnR1up36/7/5ykIzVF28IJW9JQ/jb5afh5BQkwoX5krjiHhWWrHqHUQdFBedT10X1cUJYtjEJdftRe5HqTfhjBcx9m4gKeg6eOS8e48YyCuAysQF43HWR5O5QPhthn/nShUkVg7pnpI6ILsNs1riZwrW+rIZfHmUuCOQX+HCFrM0Zect2X1D7CZhJ3p5kunP24tndX4dvNgwp8yCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD/fysy6ddnEDDG6GjdkP1VASLMA4yw8lQL4peWfbR8=;
 b=pe8NGEy64WFCq301rYdjs9RC3RU8V21QnrmrgfKDZrsOOKiw/4xs6CF07IDnxBR8K2NoIPgm89RFzmPLQpA4dOXB8ObEjU6E0rKjj24V5/X9g0ma/7AYaFpL0GkhqfV8jqZ+enBxcTEN8ENLVoiB0wCD3Tz8FJpO3cYI0TNLrhP5NVwF0uXN/0u1FWGcehutW3RZIgxqxBObrUsQqzh2KSwR5cZaJo/ZFbQZBQtsHtFWXJwNmaGk11VBIiX0oYNe8C62J1+G6m2nVsf7nq7s7Py/ZtlFH3vU0dWhr6sqIymfklc21+Bxs4MYCnzpuq4R3kGUISnB/6zSDXOQCj10RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 02:32:38 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 02:32:38 +0000
Date: Thu, 19 Dec 2024 10:32:31 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd] b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <Z2OFv5DMu8ZzPrac@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
 <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
 <5fa3f3cf-2f95-4f0d-9625-8a171a10459f@oracle.com>
 <Z1Jilj43Pw/rblhR@xsang-OptiPlex-9020>
 <1e5c1ecd-7910-4033-a43a-c32007be55a3@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e5c1ecd-7910-4033-a43a-c32007be55a3@oracle.com>
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: a441bb43-68f3-4f99-3560-08dd1fd567b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GkGVC5MK0KoGB/k3svxpIxJ6oZ2gS4u3GgmU+mX/uUc+lOx7pnjuZZQ7Fy?=
 =?iso-8859-1?Q?z975+4AHKjJLTzju2Ug3FDwNEk5Cp2oYnx+lWSufzAAOfcY1KvKqcw+5Hw?=
 =?iso-8859-1?Q?3SeK6WdMtbfwNEVaiHWWFNkETVupR0Y4uVeSdrRNEWMHWOi4Jal/oPnDPC?=
 =?iso-8859-1?Q?qzOeh5QiYbRpY88o1AP85UF/59KbS2gZlAcFkp+iMvHMZblA8n2woF63Xo?=
 =?iso-8859-1?Q?NnANdvfN7ywn7MFcPoMzls2Re7We72EXvTNZ1YSyiN7W/vheio1W9B8VER?=
 =?iso-8859-1?Q?+hT8HiIy97bVKNVa/vgOR2B/M/v/Ef9yz5SAcolyFXyscN0BWdZlCjToAg?=
 =?iso-8859-1?Q?uYCxnSlQdnjOY4+QxoEMeflnE4cp+Y05xGGqXMbxSA8sCsiPvV6Gj8iXLl?=
 =?iso-8859-1?Q?U2JIA8expBhKlAQ/K1QFUYkwaCA8wztayv35WtGtcZZCHEdpRoy4o9aWD0?=
 =?iso-8859-1?Q?ZYnOUXoKxT4o/na3zQy0mkW83eY152Ljzhr/v9+8brEN7ow+R5PHa2WvNs?=
 =?iso-8859-1?Q?sKRCuxoUzLIXgblK9qGLgmiPgGAyjWo02ubVMavMkfKlY6If93iYfaVvsl?=
 =?iso-8859-1?Q?7Nc5NNkJfgnSsZu38ZYU14660gqSZFdaaiQomCsMZ/pEbZ7XhOUnBP/tMl?=
 =?iso-8859-1?Q?j6BAKVFuLNOa8sXLj7GZjUfigbYEK8LeLNLwpfc6b5i9yjduGYXu6mZwWI?=
 =?iso-8859-1?Q?BT5srit3CCxJOdvY1tBb3tGXgay4Vw1IEY+jeD5KBDY34Yua27EdpoLjAJ?=
 =?iso-8859-1?Q?L+4S7kCOhmXSga0QbocAMK/fBMOBkiYltr2OdhiQuHM9fSj8S4WVeEB2+2?=
 =?iso-8859-1?Q?Pslf88TqdbHIt+MQs1rHUFJmelCBv2psB82c8Ddkm1ectEFHfOQSqbb04Z?=
 =?iso-8859-1?Q?FB/KXdt3xcKx14g7lj66jsooTLAfc3lfeBlZ8oB2KqsQE4I+DRJ+xUJW94?=
 =?iso-8859-1?Q?ntrqvsgqGyOQdHmBh3f8RQ/qSog3Jc/WBvKPA70nmkTxRP3j+lIx8iE46T?=
 =?iso-8859-1?Q?pZC4SsJHdlyK1wG4hkOsWstwPFJG7A5ZcTRVU3v+obsl2sSeS8NM7kXAUq?=
 =?iso-8859-1?Q?NeLaiS2otoNrcBrX5iOMd6RSv8Vew4yFtVQceP9eKIJFk1p0Mmf/8RmQNj?=
 =?iso-8859-1?Q?7aRUFHqRZXOH0lm8JrPHrgyGvnHLOyi0D3xbCMv33+Yw+L6+vMlZ6nOlTJ?=
 =?iso-8859-1?Q?c15HVwLA58AZSkWJU3sdikQKNSXsKE5VXVE/8cfKj8/9sN6IyZ2x5qQcSK?=
 =?iso-8859-1?Q?Z6XrIOVqddmDrMALqU4Up63QRYTTG3PT49VUS8kA13UF+OJN+vIgAk2lid?=
 =?iso-8859-1?Q?xzeFw9KrSRv/SQLhSYEVPWxpgTNSl25MvDWSgMBx6NzGdkK/YMyi7F0Ucu?=
 =?iso-8859-1?Q?YFdrb+XgiyxY0xNnUC/z5W2NiUe5tuMxHC1Z+AJYc9DP4LAXuyApDeGus2?=
 =?iso-8859-1?Q?dOlDknf7+DRbz8l8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+HoHXblQYzaxy7R8VVhZNFdkoV+P+xfjbdDATzziiOT6I3K9xViqdp0TRz?=
 =?iso-8859-1?Q?Z8yl3duMOCAH/GSq84sJYLWiZXNF9NO6i/t3qBgrC48RNE3g0Ic8jUHobc?=
 =?iso-8859-1?Q?UXxhvUiZuMyAnot/pM/fasSAi4SeNePhTSsWPHax8gF5ESho3J3HxPRGgy?=
 =?iso-8859-1?Q?XyjWmfdZcuIkaCJNyL4Nwdhc2/WagPBQjpweSr633zhfxSLHT2HXGFMIyy?=
 =?iso-8859-1?Q?WJHGGUzJ3ZrLFYh3LlZ07aGhhe58PV73TZWrh84faBNUfNni5XDTtKxm6N?=
 =?iso-8859-1?Q?mVvXVyN3ZHnvQnj29EdzAMb0h/0UGaupPN5upUiOkNgJEypzEU2oNZC+8w?=
 =?iso-8859-1?Q?ttfm9/D9CYD6J815jyn2PeYGZOPTZMIEaA0iVCa8P2sf0oDXd4/lmNHYA5?=
 =?iso-8859-1?Q?dhBkBScOuFljZ4fH6hFjPsDTusmYLUiOWo38HiG4pDIpgURwhEwBBPaly6?=
 =?iso-8859-1?Q?Oyk7IL4WFu/oqlgwtsJ3yznwbj1ZLOvpJkoTz+oyuP1IwYe1JwAZqMWyP+?=
 =?iso-8859-1?Q?jUWedkWQV/bpQxMcTi3zY2JTmWC7OLEcvhi8F6wqzEsnWPivFSfW4peuqL?=
 =?iso-8859-1?Q?jDpsXLbo8GBNAWdOTMSgUvwovb/2LpsCHHwu0x0t3LQrM2SmWTKH5mxD/x?=
 =?iso-8859-1?Q?oPSLFcxqHMrDDdbMTLObnIK+GXpIJ5AhoPuAikP998XG9w0RZDKkSBBvBu?=
 =?iso-8859-1?Q?Z+VNchcOckViyVnCooOG2+iK3WdjvFcoYhM00iTeBeII/tGYWqFlxc8Cx3?=
 =?iso-8859-1?Q?djJKI5EB5Hqy8flKXQTWbReC010NPrIl/YUY/s0JYWn6jfJwa0t6YB06K1?=
 =?iso-8859-1?Q?176UxWdQRK2vEqZ4tZSaYx5emmJ39YtOAljT7D4DZNcFk17icJ2pVs3jCn?=
 =?iso-8859-1?Q?AKpVSzuuaJivbp43fMG/ZrMgEoP7pBG+zjgcKGC3NkvC2cZDJU5ekLg1l1?=
 =?iso-8859-1?Q?x3y/HPZlNncDWS0PvX90//pNune/pn7Lql2H/sEg5m956n5F697CTxBvTi?=
 =?iso-8859-1?Q?QbdtDdXwijDYT0GWU8E53Ne8sn6XJOk4YWze/T1SDqJEE9ew/Ohj2GHEej?=
 =?iso-8859-1?Q?XtiPOf9ncgRueku2Q0V7/B4qU7v97arm5dns7s8bFZaLs5OhsIPZtqFv5H?=
 =?iso-8859-1?Q?hzFtgLK/sFhFXEln2aGFlWBzalVVPnsRGnUG2gxJhaNIf26ViLn0MDg31S?=
 =?iso-8859-1?Q?iZ11Rqc63+7XIL1Q9grPSR8PXuPlW6CmJhujV4X1dDoNp5/ZdJ1feTxk+p?=
 =?iso-8859-1?Q?LeTmN8q3scXTaRzE5Tcld9Fj42DQ/I4hSqlqqEs9tEDg2KHSS/z9vzgIVN?=
 =?iso-8859-1?Q?S80mw0uDZ2qnZCa/13ke1dfY+a4212OgTAfpyGIylGhBZ9uuYLL1x5VMSJ?=
 =?iso-8859-1?Q?uBYBRZHugqQRbDKCQK+dt3QVwZmoDe36YpdDQ/NvJc+G+ikOFqs+xi89gL?=
 =?iso-8859-1?Q?rWoHtSYeHNAlhkOLGKxy292Z2m6RIS5oOMg6cJLaLavC3Yu7/sRlaDLePe?=
 =?iso-8859-1?Q?e1zVyIxZlCEsern5qTk9p9DmO6FjInuuf38dDORX9RpdWKx/odFaJpCdOQ?=
 =?iso-8859-1?Q?pjcWjQJgayhmKFiczirkg/1oYa9KxuJ/DKm8g279Ga0kJuY1MscVfH9ONB?=
 =?iso-8859-1?Q?mJt+OgbVZjpg0yGItvVrHdM/Wb86T2UkJo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a441bb43-68f3-4f99-3560-08dd1fd567b6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 02:32:38.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z20jAGTHeaNuGc41TGl5nODszzTUH99IWkvKf9aPzcxJAUZKVIK+lZSDNa1eLSEBriVFK4QGGWPe8uGejF5ojQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-OriginatorOrg: intel.com

hi, Chuck Lever,

On Mon, Dec 16, 2024 at 05:23:48PM -0500, Chuck Lever wrote:
> On 12/5/24 9:33 PM, Oliver Sang wrote:
> > hi, Chuck Lever,
> > 
> > On Thu, Dec 05, 2024 at 10:37:10AM -0500, Chuck Lever wrote:
> > 
> > [...]
> > 
> > > 
> > > Earlier this week I thought I had the full set of patches to
> > > test and could just apply them on v6.13-rc1, but it turns out
> > > that I don't have them all yet. There are one or two that I
> > > broke while trying to prepare for v6.12, and I've misplaced
> > > Jeff's originals.
> > > 
> > > I will let you know when that branch is ready for a retest.
> > > Sorry for the noise!
> > 
> > Not at all! always our great pleasure that we can supply any help.
> > 
> > got it. just wait your notification. thanks!
> 
> The series currently in the nfsd-testing branch is complete and stable
> enough for you to benchmark.

FYI. we compared the branch tip with v6.13-rc3, the fsmark.app_overhead
regression are less now. while fsmark.files_per_sec keeps not being impacted.

if bisect can succeed to spot out one commit, we will also send out a report.

=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-12/performance/1HDD/4K/nfsv4/btrfs/1x/x86_64-rhel-9.4/1fpd/1t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-icl-2sp6/40M/fsmark

commit:
  v6.13-rc3
  8d5b7358ea7c0 ("nfsd: add shrinker to reduce number of slots allocated per session")

       v6.13-rc3 8d5b7358ea7c07b69c44f0af21e
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   2790150 ± 52%     -60.6%    1099116 ±120%  numa-meminfo.node1.FilePages
    697551 ± 52%     -60.6%     274783 ±120%  numa-vmstat.node1.nr_file_pages
      1176 ± 71%   +2210.3%      27185 ±247%  sched_debug.cpu.max_idle_balance_cost.stddev
      2882            -7.1%       2677        vmstat.system.cs
   3064384           +57.8%    4834169        fsmark.app_overhead
     18.58            -0.2%      18.54        fsmark.files_per_sec
     53429           -17.3%      44169        fsmark.time.voluntary_context_switches
      2805            -7.4%       2598        perf-stat.i.context-switches
      2800            -7.4%       2594        perf-stat.ps.context-switches
   1750049            -1.2%    1729157        proc-vmstat.numa_hit
   1617582            -1.3%    1596589        proc-vmstat.numa_local
      2.03 ±  2%      +5.5%       2.14        time.system_time
     53429           -17.3%      44169        time.voluntary_context_switches
      0.80 ± 11%      -0.3        0.52 ± 56%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.80 ± 11%      -0.2        0.59 ± 39%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.svc_tcp_sendmsg
      0.39 ± 23%      -0.2        0.19 ± 53%  perf-profile.children.cycles-pp.__close
      0.39 ± 20%      -0.2        0.20 ± 47%  perf-profile.children.cycles-pp.__x64_sys_close
      0.14 ± 15%      -0.1        0.06 ± 79%  perf-profile.children.cycles-pp.syscall_return_via_sysret

> 
> 
> -- 
> Chuck Lever

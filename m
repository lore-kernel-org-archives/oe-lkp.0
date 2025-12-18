Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670F3BBF0
	for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 04:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766032690; cv=fail; b=mx1nivniLeEjyKR5obxAiBlm+dcWrGMgPjXNDtZ9zyGoJ6d87tQV8t5AxwyEH3dOPtJ+3TuNpndrXdG1tkQCWfiR/JYY0rHRWYv+ndwUjqAzlsMwMQMhMyL9IvGrdqF3gOvOhy7eIc0XCF7wg8KRvpfJnAbJqr+NY5Fp7YFPZJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766032690; c=relaxed/simple;
	bh=jvnets43fjedcRlZzoHI9nXEqVDq2Au7RVRrL0G55TE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pcQ64c29vqpRlVbaa+RRLWE5Iv1rEnAt8ELemqKYGkia4L0yJyd5AcnLg5a4Dp04K9h44FjKiNpg0gRKWiQ7nlrsIhzNur8waxdZjFMp4665SOVLvFTRkj56xXPAdXqHdul/wEPWNRxmNKgBTfwsOA5L6eLyyJ24j+d1+ne4xCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeoFeBWL; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeoFeBWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766032689; x=1797568689;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jvnets43fjedcRlZzoHI9nXEqVDq2Au7RVRrL0G55TE=;
  b=PeoFeBWLoFtU/Rpvp7UGPbk659MZv6wKqwtcekNLDiSKU7XzYq4gB8LM
   8xbdL4/0yjjz/YlA4620GAscxSX0LSTSsPNvvNzAc+peSP2hHs6b99iRy
   xuWLi9x1hb04juD+UCCWzzHyOF6QPKr4FWvB1WTatDS1NQCZ9evkIVuTp
   uTGFcVqcYb07emerZrUo1fSsiTJbugOE8MOC9DkG/QcdNcHUjV+9DS5h8
   Ew2gyMLDxJfTRkzZ3Wa9Mql2ijXPfcdTIPnKxFNdOeHLMvU0Wd9qG83PV
   8SllgCfP7yhIkjTR33yAg3v7sEUCrSUoCJN1T3+wvsLksDi1HLvVfvd4Q
   g==;
X-CSE-ConnectionGUID: OqktoeNpR1adZQ9daobmJw==
X-CSE-MsgGUID: eGDB+DCKQpWfSN6cqG/3eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78693727"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78693727"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:38:07 -0800
X-CSE-ConnectionGUID: yDFZj5IZS92oXEYrZGIVLA==
X-CSE-MsgGUID: ZmO783PdRlq0xXLhApQLhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198251938"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:38:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 20:38:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 20:38:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 20:38:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4/ZmIVOLwGYWEQT+CI7B55zSvn49OLTzF9AjNrR5yCe0Ifz+Ipu8tOXlwVtz4QwiNT2l7D3IlvUhY4tOy+1DJetjUx/GyHARJzBBp8Q75d+2K7jOPiaVXTIBsXG3yTg7xQZU0K4dCKCPmGYA2YhZi2DzekXMoUlw/Ij6WrfkjAP8OD/J9WGEVC5J4+MG4WObbGrTVpyuKVBoprj9zYe9yBJWEUTrwp2PwkbCG3lBlB0S9lcl3ejzg+vzMMg94ggRKmk2h9XhnWR/ENg+NeAhH+QOOjDLurNChwuy/s4tRikfapGZ2tDmpX5wEy8WTf+TKdNPapn0OqrNNvdKkvvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6bBVwr0tO+ks/PVOt76nCUny2pgQq3R+UsehNEwmPM=;
 b=T1QN0IBS6PcBHJdqlP42vbh7mP92DXuVVP/8erYs2g/XWllIiKfC5N1EjW/Dh3bLh7TUMIY1tNNb31nISiJA+y8SHuPfDyNbXG4iqk6Nd3vTpA/wlc+hUtwi3oZTID4VKqR0aqzNfLjqJfWz0gGYabAmQ0LAVe+HNUNib3RB/Y7nF8kggnVTxFS9qgZgU85iAMpv0O2rcp2XmPw/Odq23HOJYTRj95XgnfwfVgN/YcmG30bqoVJoOkgwatTqKLe4GoY33FCgNFaY5HRvhxz1rOlrNGlOxQd2qZpIjQEtVQ9wETb+/NaEubY66rodYDgUtra2EKtq5wxJMVe2LkHWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 04:37:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 04:37:56 +0000
Date: Thu, 18 Dec 2025 12:37:46 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Uladzislau Rezki <urezki@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>, Alexander Potapenko <glider@google.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>, "Michal
 Hocko" <mhocko@kernel.org>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [mm/vmalloc]  9c47753167:
 stress-ng.bigheap.realloc_calls_per_sec 21.3% regression
Message-ID: <aUOFGneXSVE+DItX@xsang-OptiPlex-9020>
References: <202512121138.986f6a6b-lkp@intel.com>
 <aT_8woTbtklin3Bh@milan>
 <aUI/MZ8sGDt8toOC@xsang-OptiPlex-9020>
 <aUKONAP3CZn1kZw6@milan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUKONAP3CZn1kZw6@milan>
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f093f95-e18f-4970-20b1-08de3def3708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UT93M4L+FnR2ORjvI3twLv9GEtkgrpnvrV1XadUUKzZU/XTLxHjciT1tW07H?=
 =?us-ascii?Q?DpT+/hhtAZNaGKtAM9H86RulTDm2UH4Yr8oea4kYseCEw8Rk8SQuogGL8/rB?=
 =?us-ascii?Q?Daxl9qqNPlBl2L6gvLrpSRTFZMncotZsYWakaeJPRM1JBLpuI1XNwiB7MgJn?=
 =?us-ascii?Q?pMqIlTOIDAu6YHpdPj99RpCycttuU7g6C/gh6WbegjIEB1vxsl6FQ4wkmIat?=
 =?us-ascii?Q?nwuLBx1VqGaw0HIpEkjp5Obkcgnl8Wz16hNTvPVGyWYYrPYS+azgqt0e2RlK?=
 =?us-ascii?Q?/L3sHhVejrBe/ptmd4vhTHcQvjn1M1xWtzOpzM7zWOYoXHeWoEG9OtdRrCJr?=
 =?us-ascii?Q?91lUik6DDI6hdYTftXfRFA26fZPU6Dxh+pwOhtBP0alLDoM9N28qtNZqudbZ?=
 =?us-ascii?Q?FdCxsql/cS4Xg/+31QdchwoRbs8XYzmzspP4np5Wm+zuyyql23eJNIMghvhN?=
 =?us-ascii?Q?glp2goy78nU5E12EyjSgHVbV4GP1b9JKiJjaH/Ph9DMv2rMC9pRoDVF2jOfJ?=
 =?us-ascii?Q?3oVQ77igb/whBAsFPU00kWQPKdtxp56dMF/bpsoTJTui5VfnA4VCe0zsqioM?=
 =?us-ascii?Q?dKJ6h9UV0fjyxDsp6tDrd/HTtr8+/UFyanHwNJHfPO4K55hQmszoYHdkh50W?=
 =?us-ascii?Q?aWfkAF2yNUHY5hb4tRkE9BtapzhI3IwkP7msbY36Fqi+BTWpPPhM4b7KnRmN?=
 =?us-ascii?Q?P4UdG5YFI+a4wesvbeYEd9VqXFOB/ZCmBnNRe89L2ELU9oDVK1DaKUjC0G4l?=
 =?us-ascii?Q?OPJ+raWKQwZwtSCJRv5q92VnGkrtgMVVzlmYPJKrcagiexlNEXTklmHZq3+E?=
 =?us-ascii?Q?emfbgz15VtOJ5KFzLj8u4rhTkWWQJgSPQTm5pLkgIsvCbiEIEmJ7wIbo0igg?=
 =?us-ascii?Q?ioSN2Z2gyICMRXVIGB31rOYqYMSGFeppaIyNpT3N4S7UQI3vsbVxWIVWr+Lf?=
 =?us-ascii?Q?3LVYRcRqEC3iQSeVwkBWNyZ2TB+GRLI4tr7/wfqOlZQs2uYAiMD81sjhTz/N?=
 =?us-ascii?Q?KT3UJKW5dSIS5yDGVU/1PFZQID5XSf56x0a0O2KEZc7VuxW0TX/osAY8SWQn?=
 =?us-ascii?Q?8XpitNC9LD7wwNVMoG8A9+LklnxBA9QfuS1n1XHI9pY9A0o2yL3tkSOU4TU8?=
 =?us-ascii?Q?BPomfZVXh1TNY4PWi18Jp9O9gIsahNDNkChps7fnfbZIQ4xLlR0vhQFTC2cl?=
 =?us-ascii?Q?So7qdcDlssoQNTcVB842dtpgWJ8+lKJV6cR8uoSQnVXeh0hXi0xtE6D20zbi?=
 =?us-ascii?Q?MxukKWutXd9xWY9F9k0cO8xJ+Zng4QMR8Y+1K2tBAlMvK0Hzugwku/MbbZbB?=
 =?us-ascii?Q?+G6l+E0iI3X1l0KRnWkY/PrAc8aQxSt/JRHxDGwQT8hYhsIETJTH1vnHOkYv?=
 =?us-ascii?Q?E5Y5We4lT3uHTOcNchDuojjUN4vnpdPo8QIdQFASq3jshzOVZx7jPbVHe8Sy?=
 =?us-ascii?Q?t9KjwbaHEjhCNPTkLg+AdvqdUErSSxA4oU9OjFr1sCIER5iVdgwJVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3+GKzGzX2JxMiIS7hE+fZWa05ZX0PjOUt9JcRmgSslwE5rpDC3pR3Sp/Vj8i?=
 =?us-ascii?Q?P7gTqqsbvVYokz0U9fhNF6ZUaPM0WL6q2EKCjn0uBy/iDVFGMVQCGkI3dBSE?=
 =?us-ascii?Q?hu8VBC7cidSx/KY3NS1UohAizDkparfyqFqy4e2zZnedF0yAN2G4UpBzsyO2?=
 =?us-ascii?Q?MXbQ6XAEWVzkzM3SnEhIRddqkzIZcg/TdVF3zQT/C+n1jnDnHVy9UuwDEra8?=
 =?us-ascii?Q?rCWBgsOY5SMbqYGM9Mi4bYSJ+b6ImaR3BK2AWWDoScHk8A745kfNkNmVqgAo?=
 =?us-ascii?Q?rkTliG/M0d0jxXJfMp/OHFEXE927Uqnv2GXLZZHfhE7+OkksE+F0D6ksrYp8?=
 =?us-ascii?Q?5hvdTDMbAgWJODMipugy38rBOSwkIXuRF7wDJ6ZCnpCOeiK+nyJdqmsX3Dej?=
 =?us-ascii?Q?N+g7ZJZXUit+C2KC4d7Sdg+RrhIrcIh0dEOoWEunmC4v3GIt9FOJyAk32Yz+?=
 =?us-ascii?Q?za6Po8IFDFY+/5IoJws0mHfCWBc2N4aPGH4hFJeigdiqWEIj4t4ICs7jZTre?=
 =?us-ascii?Q?WhCMYrPi44xCsmkE5r3qbdEfXUtI+9wDpQZJkekVHlUdOKB+O5Ka6fN+uEnR?=
 =?us-ascii?Q?q0eQ69a7V2j1pDYKhuyxQHFxNFkdgXMY2q23XvCqWPuVnT7n77dqOi6njSZL?=
 =?us-ascii?Q?Xa/ojpCvN91cwh6z7zSMo5pMVBKle9XdlOPeBSmAHkit9+AqDMxu1ZMEVtPU?=
 =?us-ascii?Q?s3PYmdh3vQshqJNnLsyDyujRazFuZRLm8vU5o3dAqIfHTnithKSMqw2ltFKK?=
 =?us-ascii?Q?snYhgATkNd3b4Mp8VWXfux/SLMbOrZVHEXZtMUr58GmNN3WnyfKgitltnkaE?=
 =?us-ascii?Q?KhZ7r/vBBp2lwA5ky/6gzzKppUR03r3Q4+0nyB6wNTtqffij+c29hmUF+xVe?=
 =?us-ascii?Q?AzTLHCykHxQlfH5ub9XtvmVL/s/ycEnofhTSu4rHCsiafjPW46hrf0GOA1L5?=
 =?us-ascii?Q?q1xH9B91yNZpUN6UvHYJQRTPlht5QTZ1vwNWxNiOw4a5cvh1qwbPrptkJbGO?=
 =?us-ascii?Q?e1qfCRvgyHod7PquQr4IFQ/+x2wEEpZoIk7UEYCLlhEZ0/+z7thaqmrW6Mev?=
 =?us-ascii?Q?9t0cyfD/dlGdL5B8FztOnYXVW8gc56A0A1GfTyjsWwhBOvvqrmls+xYLCtnz?=
 =?us-ascii?Q?VOlzD/zveHtd7xqYoluqxfzDKXZNah1GOrtD2LZO5Np5GV7xLkHONS8vvyo7?=
 =?us-ascii?Q?ByTmBbv3ikwgnrC7Ck7mzPxJZj7RR6yV1aQfp3T7YdMi1M+dFVQRxXzzcP1N?=
 =?us-ascii?Q?tNwRdSEplhOi/Xg89AH8BhMlDaYUOLlKdx/Hir98r++d/cuqim2QU/5rhUEH?=
 =?us-ascii?Q?P1HFdtA3IKOVRATFZK268C9foERp2LcX24pLz7NFOOqoBqtVE5wztUNXp9ya?=
 =?us-ascii?Q?7Wvm46IKjxXVx1jstokgUxuFShl24ZpbwOATPT1RVvA28qLiLx9je/HaWT4a?=
 =?us-ascii?Q?0ZmKfFeTPG91NG6YnhD+DZ05Wy5eNU8DcmR85g710iqPZVGGrTVJcj/PJP0Q?=
 =?us-ascii?Q?wxEPEhfabG4rWv6qppeWCuIe27MqGaOvL7vblxjsxuo6j3eqYVb8X59ohORb?=
 =?us-ascii?Q?9FGSSm07lRsHtOif5lXuND6sxMNNc9SxPWzjt8BksTachYMNi1/R2RUP3Q7i?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f093f95-e18f-4970-20b1-08de3def3708
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 04:37:56.4360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI/Wb7BDUC0PfEz40ihvzXSD5hToMThuI/h5Ox/d+dEBg6V+bPLBlQIdHmX6Pp1lVg/GCc+vT+lQfFpANdv/SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-OriginatorOrg: intel.com

hi, Uladzislau Rezki,

On Wed, Dec 17, 2025 at 12:04:20PM +0100, Uladzislau Rezki wrote:
> Hello, Oliver.
> 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed a 21.3% regression of stress-ng.bigheap.realloc_calls_per_sec on:
> > > > 
> > > > 
> > > > commit: 9c47753167a6a585d0305663c6912f042e131c2d ("mm/vmalloc: defer freeing partly initialized vm_struct")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > > 
> > > > [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]
> > > > [still regression on linux-next/master 008d3547aae5bc86fac3eda317489169c3fda112]
> > > > 
> > > > testcase: stress-ng
> > > > config: x86_64-rhel-9.4
> > > > compiler: gcc-14
> > > > test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
> > > > parameters:
> > > > 
> > > > 	nr_threads: 100%
> > > > 	testtime: 60s
> > > > 	test: bigheap
> > > > 	cpufreq_governor: performance
> > > > 
> > > > 
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202512121138.986f6a6b-lkp@intel.com
> > > > 
> > > > 
> > 
> > [...]
> > 
> > > > 
> > > Could you please test below patch and confirm if it solves regression:
> > 
> > we directly apply the patch upon 9c47753167, so our test branch looks like below
> > 
> > * f7991e8a0136cb <---- below patch from you
> > * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> > * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()
> > 
> > but found it has little performance impacts
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> >   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/bigheap/stress-ng/60s
> > 
> > 86e968d8ca6dc823 9c47753167a6a585d0305663c69 f7991e8a0136cb0fdf35f11e28a
> > ---------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \
> >   48320196           -10.9%   43072080           -10.8%   43116499        stress-ng.bigheap.ops
> >     785159            -9.8%     708390            -9.7%     708644        stress-ng.bigheap.ops_per_sec
> >     879805           -21.3%     692805           -20.7%     697312        stress-ng.bigheap.realloc_calls_per_sec
> > 
> Thank you for testing. I had same expectations. No difference.
> Honestly i can not figure out how: 
> 
> * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vmap_area()
> 
> can effect performance. I am not doing anything related to performance.
> I would like to ask you if you could test one more thing. I see that
> 
> [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397d62e7c91]
> 
> contains also below patch:
> 
> <snip>
> commit a0615780439938e8e61343f1f92a4c54a71dc6a5
>     mm/vmalloc: request large order pages from buddy allocator
> <snip>
> 
> where we try to use larger order for vmalloc. Could you please revert
> it and rerun same tests?
> 
> Thank you in advance!

we've seen comments from Mateusz Guzik in
https://lore.kernel.org/all/e4b6sjeh22uqhxhxudsbanlnyo2potwowuy7mkrp6tvxnftjn4@mcjyes2s3eu6/
that this could be related with cacheline bouncing.

not sure if you still want us to do the test you mentioned?

if so, sorry that I cannot make a clean covert of a061578043993 on
c9b47175e9131. could you prepare a patch for us? thanks



> 
> --
> Uladzislau Rezki

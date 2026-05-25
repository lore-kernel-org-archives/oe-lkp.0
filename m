Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6F3D1AB5
	for <oe-lkp@lists.linux.dev>; Mon, 25 May 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693835; cv=fail; b=M8S35VJ5/8GuIgy3anTAR9CkL24YLvAkV1Cc2LPpDE3V/SFvMvRGdiYTtKwiU39CDPSqd97ADkM45v8fx/G9uawjsgEAiIwOQElLuVGq0MsGhXD7oZpCbUVENIh0pph3uATZqstrOudBIZcqxadvu0tHCthugCm3ZFMWJT62+Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693835; c=relaxed/simple;
	bh=Xsm3vjK7B83qJztDo7QLPp/SbTVI0tFmaTHNiWbO0z0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tk79kE7dHZY8yNRkJZ1L6gP4Ltv58fLXEu5cYKeZHMgb3CkGjKJEgASVu8XZ6nw3Bx8oyzFYu3dgblBhcKcxYUk4RSCqjtADM+ueGWOD2MK15c3LHiPJbkrEHheUpkGnVBHRQFyS60/wTewppi6JOqAT6POp5oO7xAQg9mC7pvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrLLt9H/; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrLLt9H/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779693832; x=1811229832;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xsm3vjK7B83qJztDo7QLPp/SbTVI0tFmaTHNiWbO0z0=;
  b=LrLLt9H/NsIzehgn9Eks7nQrjMP4HQLnkIvEt3opIzYLca5/94oyzp/z
   94pXPTFcu34sQrh9nG3u60ZVszWKL7ZXztFTf5WP13hIp5E2vuzy9k8pi
   58eDoK9TFXF1mvaT7OPlmzAZa8/tYApgcPStxQMXj1JOXmUOWLN9Jz5lN
   eyRS4DrhvqWNVIViN7Eo/ZGfdiKKXGiNaiNog2omIlbQmKhtOWHnDmFpg
   l7bWXyEKUGJ1HwsRYB/1boYB+aqbGUF9A6abzZ8/7shHvSgskU2+tQgjo
   hIMfUQIPk+9R74doRNuTf7pfKvEzfUMkZKk/DpoewujQV8s7jAN+BQfXs
   g==;
X-CSE-ConnectionGUID: Uy0OV/GMT76uzP7+GFq2eg==
X-CSE-MsgGUID: AyCjVzy7TSGO5SBtJ9z+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80567111"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80567111"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:23:50 -0700
X-CSE-ConnectionGUID: 5f48RAj+RbmFZo596vyCcg==
X-CSE-MsgGUID: sY67/ZdpR2uYmiWz73DNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237326941"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:23:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 00:23:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 00:23:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 00:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7hiE5UgQo/DwwIfgz3oahZenO5QAYzW41JT8cf51urt4nOGA/euLsUHV35lghZq/azYq0BMGjyP9p9L5KlHnTxOPw4LhKQjkIWfKa6KdWPzNAQs/JcuHloWPRh6dLclgWvYyQ7SP04lD5gkcZzkT1IzWZQG/aVmJTUZH4o2NUtMj5nSBnYndfBFeV7PfFsQCWLDQ1YvzxoIoCc7aoQD2vqJCqPkUEfst61ICmuUXgk2YXLJDgFjtuMjHZeBSFjSDOoypbQDI+nZc6IXrW/9GMoyeO01yCW0ZU0/fIgnA037stUkPcFN7+FnKfMRvnV1ob0b+IOFS5GpiwOkh5vrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96/hzepYrZBueO7YV7JbAuIamQr5BENS297IOZ1BEKw=;
 b=KNWhhOyxwWr0Qii4v+K6doESwOv0HgqW4nHF6MZXuZEqXIPOj+QTaSeeWFhHA7ZhUOBLDHbBROXmCCr30N3MAgplMInLiswU/Hxpl7zfYsxJ/HYhVUFLCZCQlYFIyzs72gWHJ5YS91E/C7kdnHI0HrpBKw2dd37fkXaJqasFNNs+y11egYVk9/+bYV3ZIAs/nwsFBFgN+Ebu7z6oqehaRchTSNrczwC6pvz7QjhOQqtIRG1mFGhnWwbUrKEFAesIqnst56pJNkO1ZAGTOBPB9OGJ1sNV+H6MIOdPsmPObDvhSRzf1RT9xwCj9CsJJYwxkvzfsrOoDx0WP7+l7Fu4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 07:23:44 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 07:23:44 +0000
Date: Mon, 25 May 2026 15:23:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Christian Kujau <lists@nerdbynature.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Matthew Wilcox <willy@infradead.org>, SeongJae Park <sj@kernel.org>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, Suren Baghdasaryan
	<surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	<maple-tree@lists.infradead.org>, <linux-mm@kvack.org>
Subject: Re: [linus:master] [maple_tree]  280b792cac:
 will-it-scale.per_process_ops 6.0% regression
Message-ID: <ahP49NBb15KfCHhZ@xsang-OptiPlex-9020>
References: <202605131554.92e7df6b-lkp@intel.com>
 <22y6gvr7yzwdocwpd3wxrxfykmpvhbxytiiuht32db3dh7w522@pglkrpqognjk>
 <agV3Q2fBlQrB5v9w@xsang-OptiPlex-9020>
 <g7pvhqnuloifqhbvjgtgydbitcrvmxibferexj7cunsmagttps@oxjvs3aa3l3s>
 <ahFciGk6LfkOU2en@xsang-OptiPlex-9020>
 <wbgsjfbbiwmx2glp72ifomyb6fb7uc4lwffwg5z2inv4tzskbf@ufgets7hbskz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wbgsjfbbiwmx2glp72ifomyb6fb7uc4lwffwg5z2inv4tzskbf@ufgets7hbskz>
X-ClientProxiedBy: SI3PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:297::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f8ca88-260d-4920-050d-08deba2e8dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|56012099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: i6yovwgH0BKOSBCrhr9KvAJuN1s+MK/hRWFsbklobmhft/abis4c4aWSCd4esynzinWXzDHkW7ZP0MThhtcgjtw64kl68sLlMusYkrtyqlklj0hCjVWAh45/4jJBkgz6mBsP3TBMjGxR/txubBeXvSjrX/4h1mQZuvIyLHLT60Zb8A1437MuOFyp0xOjoTPbaHC+zNNCrEsL1pJ9m46gEmSjaK8aZ4AjbRxZ45Yefj/COjAIzcohdl51/rZh0on1Pnj/7yYXLdlCRhUSsPpS4gbQ3pRWVenvyJfV/TTTb6SP2wKPi992wzvgvPuAqOhwbe8DXbSyJqeUffmpMuywD1tLk1/aNlGmF6soaB5QMsKdlo3ceBHC28L3tFB8hyKjSIMA8Wx07+J13o0Oil3rdExW75d3AaP7DVx5pS1vp/R+UlfpFVg9difphm+lidbPrFm67/lNK+vz+Xw0Fq2Sjd5MUC5doSaZvRgD6xShfE342rRu0qvVkFFm412zQrCrZj+WfrUrALgMiwa8IqgcrBfEE6iq81E9QHyCwMELFkHVv9ArKzPNnn/oO2BK7TmfYWr+jVeTy2t5N3Rqa+cQTssHjzuWeD/8eDBsCOXR6+F3irTvXntu4wH+YMaHI5tfPUvpyCAwBKqwLDQIAgAGKAJouBmfhRK7LS+DGGNgeIY5koLe2pHVaTG5zJh2n4JY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9TZpEV9SZ51AdDyAimK2nmjpfRoMUxFPZGhg/4nQV5Rt7crk7L3aDnjROtc0?=
 =?us-ascii?Q?s7RXtXzrVKXNLQ7thjVX4I2KZQ6qx5YgOyl9BkJA2P4GeflM8vqL0Nw4VQHo?=
 =?us-ascii?Q?rVrQVRspOuQ2sdFapoHZUF1jW4HNyD+dYcK1FaIuHpHSNomEqR4TxEC8LJmk?=
 =?us-ascii?Q?pDcDX6Riyy/i6ABw/P67l8O/ScRDG7GcCjn+j/ry4jV5xoMzyT/JT8FNjwq/?=
 =?us-ascii?Q?EYyEyCKyMMz63DFifSY6MvZcXbxE0gAJZfhV0x6whQKyHVIlVs/uPBOvjTVf?=
 =?us-ascii?Q?gKIgtMuVo268gwVPKLRlLjXMD7RXjjwgfX5pscdRqAbtdJNSVB7s85lbwmh8?=
 =?us-ascii?Q?tSp9zZltXsnrWTM3eiYAN4wnCnxtCcNsJXRjVnZGJOLYdBMzHQHKwhQsMVs2?=
 =?us-ascii?Q?/e92i9Jo5BKjr2lssdIskxt7h4+R5s5Hejw3Cb0J09lQBwdXp3EWbgDRoG1J?=
 =?us-ascii?Q?WMDO6jCKIH23lcn1OPhkFwfRemVaql7zDG1L6BUL/qW0IS5kF3kc4zdnp3aj?=
 =?us-ascii?Q?8wn4fmIHPAJ/isBqPmlRFumv966mIWHZ8XJmXyrxDOFD8oUWdGmvwf/zRBEq?=
 =?us-ascii?Q?6XqmtyVWRB1mDQxUtWWX05LoX2nGoD2Kmz+jyM0mJAnNAg8cfbpwnETRB1SG?=
 =?us-ascii?Q?TGfW4shVE3GrBl0POiIYTISMx1rSye604aQ6BG1T1Sln6z+jGXWc6vbTHjMQ?=
 =?us-ascii?Q?8bkukceyI6EnoII0BX3fK/M7Uj50IA/Tks1OtSF45Iyopx6mgPX+gizfYkmP?=
 =?us-ascii?Q?VLwN57TrXFd47TB1LABmXrMOw0Ra0FE2x+DE4pZNf8baLBrmKVrElVctTcUe?=
 =?us-ascii?Q?Ek+YJ9gH4kJM8JgTaW6s9nC5Xaj0SzjK/sZjKJTzsmyzgP3S665hwXDJq4Ik?=
 =?us-ascii?Q?X8X0EHJebrsshpFo0YxzhblEDgx2lIPtSDzxprxqHqU1h+Pm0u6HFSUKwaLK?=
 =?us-ascii?Q?LP3Z9lrz9GNyBw0DqBnu5erpa0iATqJoVN6vw38YqNNWYmBrEAUaTGJorc/5?=
 =?us-ascii?Q?auTBPHkVnjOFUhr73IZAX61WIIeJU17m2NEfTobulbqFCCY3z7wk3ApetJ/p?=
 =?us-ascii?Q?wv1yd+AYVbvjiQQQGX/PDx131AVIGYJLZfPxqQXqP7GWKZo6Yrk30SuOEEuR?=
 =?us-ascii?Q?rVmlkzEhHkAQBVqKiNrBQaheGewxjtFIA42rBA7HPaKa/Je3LgbnSzSTCfjn?=
 =?us-ascii?Q?9KYNK7zfFcZSS4hUOdKfQ/2Ot7KHEyG8+G8qC9bOHM9zHkrD9E8LcxJQ68O/?=
 =?us-ascii?Q?MIis95o42i6jsgDKaFuDaPjqtTGs/KE/UT+1A1jFWUevY/nhi1ToOIKEDVJJ?=
 =?us-ascii?Q?dhA9t4hAS72rxNO89K66jPQx6a4hsrtSEZ6tmvllDQSfJvEe93DLnGOTu7kw?=
 =?us-ascii?Q?KfziBov4WDMKF2GytSlo7dU8Q4FMMazarNY9uq5bA8cOny29ADGxbJGFPRBZ?=
 =?us-ascii?Q?ZVVWk5YVbrl864HFbj/A6RyE6Aaz87SbAPXcypJWjcH7GBHhSunaFA7/AKvJ?=
 =?us-ascii?Q?JSKumxu1KRTBUbIpiLStBg52ufzLezgqVnVHqvNqURx2SwUZWm52BqLNM5Wx?=
 =?us-ascii?Q?bOEd4KVAJzK6ptSKS5NIJSVE5vrqVFcaDQ1qwPgSB0hJNdoHNd6oAUkj5+ar?=
 =?us-ascii?Q?6oFx9TmDeJG6nHeLtf+DGz1NF69Ne3RvvZQo/Z+vMvpLzVINHJ6MMYDrK469?=
 =?us-ascii?Q?7wIG5Tu8IiDNsl+/tu0pk37pAfr0REK+xgjYybmtBkPQhYJT+cCHTf6hMxNG?=
 =?us-ascii?Q?6YHzfcLAcQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: EXnHYeNI8MLcmgNXpw3t/IFqEnNBtCwA5ZPLnwe8+GAJ5JbtxCYFLQrutXncldaln7HGHQyvbpbMyefjID/SQfKdhhe4EQ5A2Z5LoAOPXhbkOm56pQhgUokxPB6aI2JILbL5C1LAk8OIjokTmvF4LjAOZhgQ6D9sLFW7CbzPQiEH3DEAhRKJt9SLAAKSfSShaHO72+mb4+CZnzdrQL3mlYR1SKk6TAheqXGplapGvxqtpolOxDzmN4QzW/3Hdke/4Jdsq/uI4g/uSeja1aI9C4+SmHSfp2j4BglFSTdRFVFgRJPByxne9nXG233bVaB83LwmnhrLkoPcRrYU9w7jcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f8ca88-260d-4920-050d-08deba2e8dcc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 07:23:44.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRY3pr+vrrUlVyoyuAmxLhgAH6V2Sn2AqtIU/Wl7+WIK173BPeOYivV8ibYktxRgib1bcV0qQPLSWxhU4F+GaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-OriginatorOrg: intel.com

hi, Liam,

On Sat, May 23, 2026 at 11:12:24AM -0400, Liam R. Howlett wrote:

[...]

> > 
> > I appled your patch upon below mainline tip commit when I checked.
> > 6779b50faa562 ("Merge tag 'pci-v7.1-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci")
> > 
> > then build kernels with attached config.
> > 
> > but found a big regression introduced by your patch.
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
> >   gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/mmap2/will-it-scale
> > 
> > commit:
> >   6779b50faa562 ("Merge tag 'pci-v7.1-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci")
> >   942596e1c1037 ("maple_tree: Restore old tree layout using new scatter-gather node copy")
> > 
> > 6779b50faa562e6c 942596e1c1037f014638541bce4
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >    7023559           -42.9%    4007886        will-it-scale.48.processes
> >     146323           -42.9%      83497        will-it-scale.per_process_ops
> >    7023559           -42.9%    4007886        will-it-scale.workload
> 
> 
> How many runs did you do?  The same 6 runs with 48 processes on a 48
> thread machine?  My results vary from this dramatically (+13% increase,
> minus the 6% regression so 7% gain over what existed before).

right, on same machine, and with same test. run 8 times for both 6779b50faa562
and 942596e1c1037 (your patch), the data is stable:

6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json:  "will-it-scale.per_process_ops": [
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146187,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146227,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146559,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    147168,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146561,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    145606,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146257,
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-    146025
6779b50faa562e6cca1aa6a4649a4d764c6c7e28/matrix.json-  ],


942596e1c1037f014638541bce448b5926be4fb6/matrix.json:  "will-it-scale.per_process_ops": [
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83600,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83477,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83510,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83335,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83700,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83361,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83761,
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-    83233
942596e1c1037f014638541bce448b5926be4fb6/matrix.json-  ],

> 
> > 
> > 
> > full comparison is as below [1]
> > 
> > however, it seems the performance regression is really recovered at commit
> > 6779b50faa562, though the configs are not same.
> 
> I do not understand your statement here.
> 
> Are you saying that the current code isn't producing the regression
> after 6779b50faa562?  Because 6779b50faa562 has nothing to do with my
> code, so I don't understand why that affects the results at all.

this is kind of out of our report criteria. when our bisect point to a 'fbc'
in mainline which causing performance regression comparing to its parent, we
will further check mainline and linux-next/master tip to see if the data is
still similar to 'fbc', i.e. if the regression is still persistent in latest
code. so in our original report, you could see statements as below:

[still regression on linus/master      5d6919055dec134de3c40167a490f33c74c12581]
[still regression on linux-next/master e98d21c170b01ddef366f023bbfcf6b31509fa83]

in order to avoid wrong report as much as possible, if the regression didn't
exist on mainline or linux-next/master tip, we wouldn't report at all.

since you said to apply your patch to latest mainline, 6779b50faa562 when I
check, we tested the performance on 6779b50faa562 as well, and found it's data
is almost similar to 11e7f22f5e (parent of 280b792cac), that's the reason I
say we cannot see regression on latest mainline for now.

> 
> > list the regression we reported
> > for refererence.
> 
> Are you listing the regression in the applied patch for reference, or
> was the initial report for reference?

I listed both.

below is from what you requested us to test.

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/mmap2/will-it-scale

commit:
  6779b50faa562 ("Merge tag 'pci-v7.1-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci")
  942596e1c1037 ("maple_tree: Restore old tree layout using new scatter-gather node copy")

6779b50faa562e6c 942596e1c1037f014638541bce4
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   7023559           -42.9%    4007886        will-it-scale.48.processes
    146323           -42.9%      83497        will-it-scale.per_process_ops
   7023559           -42.9%    4007886        will-it-scale.workload


below is just from original report that I think maybe easier to compare with
above.

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/mmap2/will-it-scale

commit: 
  11e7f22f5e ("maple_tree: add cp_converged() helper")
  280b792cac ("maple_tree: use maple copy node for mas_wr_split()")

11e7f22f5e85058b 280b792cac62ddadca2935766ca 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   6885401            -6.0%    6472359        will-it-scale.48.processes
    143445            -6.0%     134840        will-it-scale.per_process_ops
   6885401            -6.0%    6472359        will-it-scale.workload


> 
> This also means that I don't need to work on this now, right?  Because
> there is no regression?

just from our test results perspective, you are right.

> I'd like to clarify that before I spend more
> time trying to fix this, especially since I saw nether of these
> regressions in my testing - that is, I cannot reproduce your findings in
> either code base.

[...]

> 
> >       0.00           +14.8       14.81        perf-profile.calltrace.cycles-pp.mas_wr_split.mas_store_prealloc.__mmap_new_vma.__mmap_region.do_mmap
> >       8.17            -8.2        0.00        perf-profile.children.cycles-pp.mas_wr_node_store
> 
> It looks like the slow path is taken 100% of the time in your run, for
> all processes, always.
> 
> I understand why that is happening and I can work to avoid it (nudging
> the write deeper into a split node), but I'd like clarification of my
> questions above before I keep going here.

sorry that we cannot supply deep enough technical analysis such like why
mainline tip (at least 6779b50faa562) has no regression already.

but in case you want to dig this deep, you could request us to test any
fix/debug patch, whatever upon your last patch, current mainline tip, or
280b792cac. we just want to be able to supply any assistant to improve
linux kernel code quality. thanks

> 
> ...
> 
> Thanks,
> Liam
> 

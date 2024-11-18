Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73415C0
	for <oe-lkp@lists.linux.dev>; Mon, 18 Nov 2024 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731916418; cv=fail; b=VBAdDpBFFDb3KzgpDAyQh1Ik0I3jmAiRiFSTTrabOt4Zs8D3uViyS8gcZrc82pphr5XZuXc9FZwgO08ApQKXUlbruZgaDGmlaIbhu2owgPGJ3il53r/hQPARUen8ENg4pTQ5DeeaOzQ+SjbShH/jbJyEakrwmRVS/9WWxIhqOyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731916418; c=relaxed/simple;
	bh=IvnzmSbG0xP2vQ+dQgaNXxPcH92IhhwzJvQlbQeWUVU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W0oSVVNkOKakVuxGFOkBDhbyabu2GXE+gWlHs9fYd0vycrLC2yRETtcG6Ve/BAcz6CvKe7wP/laLZBGtav6jFNBEXNEfF8ImKD4qEN3XVb1jCTNVMGRFS5rCUenreheZ9gngbJ0AXtcA1oL7suzA3conMWNd5jjofEk/cdAIyb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVx+c/Tq; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVx+c/Tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731916416; x=1763452416;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IvnzmSbG0xP2vQ+dQgaNXxPcH92IhhwzJvQlbQeWUVU=;
  b=KVx+c/Tq3xGXDa7VhNj0GaQ43gVp3//zqWJjDdsA/TVUN4b6+w3FxNic
   hzrW/S13vqxl/yMQR7qlOpRKUR1dgVx0n8I9Fz8Rdd1oxJDMU1/qUZXTp
   cI4W0sdTVAZTgpIDH9qm5alEYU82sifLPTqX2raqXYatJrEen1OQq1SlD
   EwTuDL3SgkIUi0wMaAU9qBCgsui6Q29ZmfB6by/k+dK7y2VqmqZPi+Xm4
   MZLjDr8U3zgS0rMUP5AZqcCLj1wHOxR16Z/qQ0zzojlXsXO5txDvDRpau
   t1CztuPqxpNBrre0giPYrebefb7VhqMZAZ8H8sk7c0970q7r9GC7GOctA
   g==;
X-CSE-ConnectionGUID: nDGcF6uARheJL4IPuGDQsg==
X-CSE-MsgGUID: cOrvoy8zTvqYg+7WbijWIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49390137"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49390137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 23:53:35 -0800
X-CSE-ConnectionGUID: LgVbmiuqSeOHDMH2UarJIQ==
X-CSE-MsgGUID: 7b+D7YcfRmiS2Bcdu/jzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89301825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2024 23:53:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 23:53:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 23:53:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 23:53:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhUqMkxEHeW1Cus6HQA++66UaItYepYwYAmHZuwYVaE9y703xTjpqIR4rvZOMW2Wl/E8pXBDvcTdA2vd8nq0MzRBmV8Px7bn/uXomNJKl3NeCRpfuJ+QfT6YEtQN0JVxE4pjHtXKTRYzPTqmQTkLgiTt5yDOc7/aQmt+/cVHAgNqV55gFK1yvecAsnn8btq6Rj8KJDzBt0xS7dQdR9Wv67+QDaTknBCo+ePZSYQW6boID2vV5Y9SCg7FiH/gJw1RqHTtbCl0ZRmVeQ1QcCiU97S/pW9k7G+/jhZOUQQORzFMZsSaqznWLekhY3RUEfZ+NNoI1O4+S2n1rJ7+B/TVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiGzpIDhRJ+BSsMCiankwi21WOKjf2vJDNG49xJ13CM=;
 b=Bhp3VOubMSZTmW1OYM3dn4eJZWVs2QqUqI/QzKaF/SDA0xbdQuNqq8DJPXg95SXrFrh7qU5RqEX/oedIJv9S2qD+f44yvyjAm0j1R3Ywk65DBvPVN4bcq8nfEWiLmcQMhVnJtZ+fsHKP5sprUqZGOecBtrklOkKmq7eribcFK3sRDbAoHtR33G9HnDLFtUIuUYuAIP7Z6GTLI8Zwg3ZVeCir/xS0DAYZAsyeOE36/b/Tz5E2ydAWGk+SKuQw1Pyc/GPYgmlGPHVyprLITkLazIsEP1h3gARN4LkfSeFd1X7k+NvtC09uCy/boaWgEWB9WbAWx6uJ/xw8K2h3z0nvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 07:53:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:53:33 +0000
Date: Mon, 18 Nov 2024 15:53:24 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c751746-a1e3-488a-f45b-08dd07a61978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o5JZijlNC4D4KHBkawggNVZwutyLVkUeTjBoQAS/25NLxnYjLU2d41sN14?=
 =?iso-8859-1?Q?t7eAtCMkAtthQW/e3Yiui1Lk4i/xCglMQr35dpY2I2C0MHEZIXvBrZh5fl?=
 =?iso-8859-1?Q?1FRvSyKVm+UKSmyBBQ6grzupWVjNzmQ+LnllmYGjK262iGbX8xqd6Ft+xu?=
 =?iso-8859-1?Q?/UCn7Bw8Pb4qHPBsM46HE8tc3ZqSp4NVLgnNBe18lqQvD8GqxsyECGWdwd?=
 =?iso-8859-1?Q?hSf0HFAZr8v2YD07P60fARDmFtv7ylHITBNDEagooIMSeFVMnaUDpgHvcg?=
 =?iso-8859-1?Q?RupLvjxrst2m2OzKo+nTYNKOLv+5FApB59LDdPM1HLFtRAIXiSoVNay/Dm?=
 =?iso-8859-1?Q?zDGelf42RTuMPFxP0E/hc4u1lzsJvmippOiLeUqsE/OG1qNKPUE8gQrbQv?=
 =?iso-8859-1?Q?bYaHWOu5xdrvDZtFUlYtIlYAm+nvlw8YzBk/xPE65R33sOp8ujt1L8la97?=
 =?iso-8859-1?Q?OV8mWCyPnMoKmIt9Wd5YFmdVGVVeTR9q6gedkooLE4KT131Jsdwg0Y8pNG?=
 =?iso-8859-1?Q?MjQtQlpDEyKcWHuDuQQp2KaCp7I4jRUxz+FBvMwA6CAIynrCx+CJk4ohDW?=
 =?iso-8859-1?Q?stSQ8xYrb7Wx/qd5HHZkWljhPqSpj7raHDWNVS5OVg79N/7n4O6QkdHTbI?=
 =?iso-8859-1?Q?V+w3MINkoBewvpjW+v8+YtimR4pse1YTPYPQqVeruDSL61WZL/17YYZtVJ?=
 =?iso-8859-1?Q?EJRmE3JkFfQhXt1R+p9OazW4Tn/DOWgVGfQOWiXdIEaf6rdtsnRnKHW/FN?=
 =?iso-8859-1?Q?gMAOw+QjPIQm5oxolXiTym1gaN5Oq6lIVPpNyf6CCcAK+ScBpcG0JI6dVM?=
 =?iso-8859-1?Q?wHzFhNYdgoSFapQ7+R84Xafj1BNJ26S+xJlyCNExU0wGAYEDiE6a4jCKac?=
 =?iso-8859-1?Q?kJfMrZRsuf1B/sGw9gXAocestdFZO9zkz1/z4Q7XemcSytAKJ/y4GOGT5t?=
 =?iso-8859-1?Q?tQ7IVLsEyvEVmkDYgqG5gfaqU1D7ROpXxZBnG40GQ1lKLZOSwqR7dIzOqi?=
 =?iso-8859-1?Q?gMm7OH9dm0UHnCqcpD4GRI7B4Z7BkD/9VmLzz67vLdDyBbcOrcZqj3nSWe?=
 =?iso-8859-1?Q?aYYH+QsF45l/EMqyvrFxwexSfSrpy0bhu+3fcqmQS7/+oYqmTTjqrY7eQk?=
 =?iso-8859-1?Q?PYv1IDb7w1tFWEJNNdIhA4RxdpwIjU+3bwWajBirx/HeL5tEV6edhx4TxL?=
 =?iso-8859-1?Q?46Aby40mA3eZGJ3ZszXT+biTEalc9NYPruSHYrHp/EnbkXzz8gUzr++rd4?=
 =?iso-8859-1?Q?Ept9Q4ipKFnVxj85K6ae3awcVje85FeqGPQMTfAZ1+O2+M2tuQ8POHX3l6?=
 =?iso-8859-1?Q?ivlf+rCt/TSkgScbZW6kmoaozkmVnxvMqe0Cz+IY7R+kXg6a0KV7n0vt25?=
 =?iso-8859-1?Q?sDOlquIthY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5UsreSFFwPaNKXdFgydLc1U9tq1dSw387uIZyEfwszbz4LRsJHEXrxqb2t?=
 =?iso-8859-1?Q?KaikJbnRKQ53ep6dj44vbl3M4EO+JYZdZ/oC1tFSxe2JKXgnGaCW421sh+?=
 =?iso-8859-1?Q?0aQ83vHoCenpxJgvPmLwuenb8sCvXulpLZpTfpAiakjTux510PJzMKlvLF?=
 =?iso-8859-1?Q?X9dfbubl1q6FmZJ2fLyluHB1EE4ZO2B0FNymVVCPohV7HrCZ1uxzt8UlT2?=
 =?iso-8859-1?Q?u3jcitF38gcnhUOrJeWGbDaL1CA/nA9cvM1+0/j2Wz999oIv/sb077wbhU?=
 =?iso-8859-1?Q?zNuJYDr/GxIivCmH032yzyjGyEKHMu56KtrsbcqSG9opaSrNG4XAMKELav?=
 =?iso-8859-1?Q?iVThBINZuaNH+aI7CYe1MmRpFcI+mB0cYoFqI2/Z8i+cGuTH1QxdZctfJ1?=
 =?iso-8859-1?Q?lsCGwNgmI9/EEv41Pt6vz7loC+X/z4AMXBQQWw8iF2L4DQDeybLYcrt4pn?=
 =?iso-8859-1?Q?Pl5e9ZrUGe2Q+vRX2qZ8vuMoa1EujckVe6qPwR/XMM5XfmQn0KgmptUeRR?=
 =?iso-8859-1?Q?iq5ZeLEyWfDg+FF2SQW01fmMau2KEPl4x9yRfOM729yw57CyldqFDy8MC4?=
 =?iso-8859-1?Q?QLYvGs7hQ6yk38hBjR451zpDB0oPTJRH4MLUx917GdnA/qdsTw8GwctuRd?=
 =?iso-8859-1?Q?lwKQtAvqKzOwAbsIcmOgx+TqfLnQtUvZrExAuzHQlZl7PfqiRmufleNNGX?=
 =?iso-8859-1?Q?So8eEqXESzRXs/CFAYEpAz+dtp1w0kbl7PDDlANoB3ZELaj6x8yxgaJwZQ?=
 =?iso-8859-1?Q?ulGvOh/yW/D2Gz1GGAhqJSppj4ovk30MaJZQl7qwDWpRHZS9p/+VOO8vgW?=
 =?iso-8859-1?Q?o2A+bOmbvrfQKBjVVHgcwshZ8+si3DqOiBdB1JxUldvxvBY45wvNKXL/2L?=
 =?iso-8859-1?Q?JEsDgUB5WEgtGDhw9+7jT+9Ng9EgyIp798UkxAWQ3IJE+HS4wW2ErngLcW?=
 =?iso-8859-1?Q?nr7le2Ix/hKEH1ppSWCm5HwksGt+0gWultOdNxWSUC9w/RTkNslhAwOv1Y?=
 =?iso-8859-1?Q?2quDLa2dO1pZFDcbbywIaSWHiYTZir/l3ZzBphgbwTpekwqBxiZZ8QmMgc?=
 =?iso-8859-1?Q?DtuSL3x/0rAZi6eiw/CW709pBcSriaUSLKbCxwHL/LtIgZnnBh4Ozl9/5Y?=
 =?iso-8859-1?Q?JmaAK2hrM9WAyZ0ENMuXgj47RfMC2DhOFH/bjIvFsZSWMvd61DobFetGHA?=
 =?iso-8859-1?Q?83qubEhhVnO6CcSlyZbWzqIZNqup+cr0I3bSHsLjz65c5lI6WD0yYLcJV6?=
 =?iso-8859-1?Q?pruEHdhcZDW0t3np7vZ0CVpTBzcdHE0xjpTJsE8Dfev17qLWlF44SXxR+I?=
 =?iso-8859-1?Q?4xO9KTRKqXDDeN6LMANNeBYpg3nTRL882zbcLu0BCJ6UUD+1pQ+kl2W6AT?=
 =?iso-8859-1?Q?0njClmu1qUCKBt/4l6LA1WWJ+cLk4Krca+m70vXwow+eRanuhtpjNSFIml?=
 =?iso-8859-1?Q?SJromdKvQBvZSjQkgMCCZFcjdkemPBJHHu+MoEkKxsVVMoFYfw6Tyl3qFs?=
 =?iso-8859-1?Q?nanxRPvFQdnpu1MNUaepqBvHYYfADjVZ4B8Y3aHw/noVT76Z06MQNn40Pz?=
 =?iso-8859-1?Q?AMGRyiu0jEFLASliV2UMgvrrjpmuyHwOYSBInq052g/VsXTAIDkwaHxTWA?=
 =?iso-8859-1?Q?RXdpdVkq3ORB2j/5/Ly/m+gvrIJ6fPyc74pWrJkZZPqqcxfp3AJAP9Cg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c751746-a1e3-488a-f45b-08dd07a61978
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:53:33.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbfRG/lXPySfRix/y1tZ+xxHIZOfztGR1d0meNiGXHflbTdG9onkxXdzsmNX3v8K/+AqU1kpiKdZ4TWVixgWWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
X-OriginatorOrg: intel.com

hi, Chuck Lever,

On Thu, Nov 14, 2024 at 09:37:30AM -0500, Chuck Lever wrote:
> On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wrote:
> > 
> > hi, Jeff Layton,
> > 
> > in commit message, it is mentioned the change is expected to solve the
> > "App Overhead" on the fs_mark test we reported in
> > https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
> > 
> > however, in our tests, there is sill similar regression. at the same
> > time, there is still no performance difference for fsmark.files_per_sec
> > 
> >    2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
> >      18.57            +0.0%      18.57        fsmark.files_per_sec
> 
> Because the most recent version of this commit does not appear to
> address the reported regression, Jeff suggested dropping it. I've
> done that in the branch below, which is being prepared for v6.13.
> 
> 
> > another thing is our bot bisect to this commit in repo/branch as below detail
> > information. if there is a more porper repo/branch to test the patch, could
> > you let us know? thanks a lot!
> 
> The proper branch to test is:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-next

thanks for information! this repo is under bot's monitoring.
unfortunately, our cluster run into problems these days and need some time
to full back. so if there is still regression reports, maybe will delay to
a later time.

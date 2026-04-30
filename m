Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A013358B6
	for <oe-lkp@lists.linux.dev>; Thu, 30 Apr 2026 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777517764; cv=fail; b=XEzeu8xcEPMBKvAHECBnXCHyJ13Z2vFBf81xMKw3WYlBhjD735+FF2fGIu1iK4oJFvA/9hQCQUYqKIse7BlKFqcdaG2Tdjvcj5Q4BW57l9qCzC5/mwjMTayXZcQ6r9KPg3hb77zwi0ZeJsB85Mum9hMGgjgA6V8gsyTyc68PkH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777517764; c=relaxed/simple;
	bh=vlj+JWjqask95lPt3tlyccI6SsBptAmIxJ8zFkU6dno=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MEAd+dtvJeVLPqpukidBEEPjILUc3PJfv+Og1J++ccei7uYvL+Sgmgzm7EJxCpk/FxNAnKNoDZLBZnYBdHk2Wo/PWPPsj6Gf/ZuYZAzqqLsm1HzW7MMMmqgLOwCyziGuZPK2itw2yhradqqyg16q8rO0ngWPQ1TlWqT9Ywq1qJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqQY+3Rh; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqQY+3Rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777517762; x=1809053762;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=vlj+JWjqask95lPt3tlyccI6SsBptAmIxJ8zFkU6dno=;
  b=HqQY+3RhjY6Rn1zJbEX/bpn5O8tnD6C+kR08yIlouiWSxXeB74xMnnof
   p9DaamGylRXfiCqKSaxoWYAJ1y+oNORByCd5895wOx+LzQkEhwtx2T5OI
   YPmNhPL2Tacjabzi0ssoBAgZs52yXDgLyUpX674ivXmYSyXYytfBDITb1
   qfP5ptBZesh7fz92wqgqz+TzfoyQheqeexiBeD3S21YWCjpMmiJ58Z01/
   rHhbmXnBUbsXQVwBsju2UxDFeLKLHZ0PRhJ4N43Nw7pASICfI9jxew13F
   eLqSIjPjb88YU8F0b4Re+055ociu6rqMOf7M9tSDETvq5hXXVMM85zpPb
   g==;
X-CSE-ConnectionGUID: qzrLo/t7Qi2KG2Sb9F/ECg==
X-CSE-MsgGUID: 5wWNq/s+Qr+Lg8khExkB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78483358"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78483358"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:56:01 -0700
X-CSE-ConnectionGUID: rNnQoVWdQxan9YrkOxC8iQ==
X-CSE-MsgGUID: nh962pcISxu6zC05VIhKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236217033"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:56:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:55:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 19:55:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG1cKQWSPfrNdprv9cITFIuHyPlri8q1fm2lFzgPVn+oBrXgxOs/yjw9a6/9iGOuV6THZ7eJ+5tjhgWnDyKFtM50rtANdPCKkNhZA8UI2DMJ5xLtgjUAUlk8V8sYUgvroIZHLy5OsN/AxtD2Ny/rCu7dGbp/w1BUtdU2HEf2jF5FEMbCLrkeuA/2hCIdoYnNdXCzFQytqhhjUxERz1i/4z9LbH3Gl+S1jiS5eebyAqMlEK2UDLq7TXtSO0EvQLwvMr5YNcVJlTkTNiri9mXgUbSSapvXNiP4u0eQH+N9zgv5v12aetfk1sSKIY6XVqRcYtbEeTifSNpAy+xGzyUhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr13BPRfrEh0yj+xSi25O8/BAdNGBgL8es5PIR3RG+c=;
 b=NHK7uPlYq3eOEfiNfwWHPJeUH97W0uTj6ZRSybxJsfMy5gKtuoh3DkVJwsajs2ZjQ/B/9yHBr3yJZOCtBRwkepo/Nj0czXn8SPaRGFCb0LG9s1HFa+w0nYW0fbVBhNujTAfUq908DBS7n2OAGDuqGmrDRNWIwxTicVwWYov1diOqjLoau1EJiBTzD8Oe3opKJxTVCAGEHz7yN0HFyl8TaOX1A0PBxNAtNoKpjOEN4tfCni00YMnqaM0odFQxn/7RFKNDU/JPV5Wo5B6DNs8aJLKm3MRdQ8UZs6z438q93iEv38l9k314FJ0tgWZNfN6xX/Nl35lW/SQL5Rn1w7D9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH8PR11MB9723.namprd11.prod.outlook.com (2603:10b6:510:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 02:55:58 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 02:55:58 +0000
Date: Thu, 30 Apr 2026 10:55:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Calvin Owens <calvin@wbinvd.org>, Borislav Petkov
	<bp@alien8.de>, <oliver.sang@intel.com>
Subject: [tip:timers/core] [clockevents]  d6e152d905:
 stress-ng.timermix.ops_per_sec 4.8% regression
Message-ID: <202604301034.20678030-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH8PR11MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c140a67-54f1-4d2b-3654-08dea6640112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: qgmBB4NinFEkaB0SpMFRmdVqRvf4YQ8h5WrI+glvXO321PpIDddMpBdGepijGu96zbVoG4hBHVi+tis6StXzco1W1A7W36FtDGpmv/1/V1SATwjjym6C4cBzYSNuE/Trqvth3YYCr1okKikbSaMwKWU8dWhExJsOwGh5U3DoZhhtYC3dPFsdW2KTu51HQy/ggtzj4JQqV9PZRvcc9PNsm1JF4SBco3CN5t054YBO7PlMQCoxNPydbr2AceilrkwtM217OzyFDsiS3RDQeIHLJwQG3R4cf6EOkT8ZS7vHRoBmOfpfXYgRFTsLI5hU/dL8Fth7CNwmUfaFZx9WLycyMJ8gxClMDmOkiyTBhDk1qZ8Rs9uWg1/LnZ50Xu9/OKj2vssa9JA76JZ0eeH+k2QkA9lqNpWGrF9rcKfIqQnoW+xAo2A9HhjXn3gRzGbDXgBy9ZxyGYjwnOoCKYhiCPtzdRmbdPpwJEbjjjMQrjOavm2X0oxbH3tym1osUzEx9Q4mv/JgD9bxqlCD3BF0D8UVNhD31DhJyA15Mpez8EULocDXUvTUd0nP9XYpY6b9qVZi/UsYsWp0AUGlER7BBjqXLglYWALs/5DEPJ+398PYZEL3+lTibk34DaMKQKUDne8iJQHLpKilYON18DfhMpXbFKabjBXUyadFemus1h+ekBcRFxd7znFLZX1hLBi1f1Au
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?urcYOUFi4xxqu20bYln+onB7BD8dhu3+meOV6clKZ1ENAmqgZJ/tKVTrVL?=
 =?iso-8859-1?Q?9HUUr6v6U2j/tKYDqTbU/HJAOM/nmKQDBWEO/pLA5kIUAmhm0NLcCrwFnY?=
 =?iso-8859-1?Q?iqwlo9VvJfqj1fToHsp7O3ZMS4JqgsXDw3H4yVTpHtfQYf5dD7u8iJKFFu?=
 =?iso-8859-1?Q?34QlpioxweR0jFjQdsBUzMCogDbuXBfzMhNz50F9wQNs79HRv+ml3voqsu?=
 =?iso-8859-1?Q?fixIOpdlSmAq0O/yz5psvtFM8FSlRJZZPWjd4QonIaaYCsppQXcKOAeGDs?=
 =?iso-8859-1?Q?o92fVURW8o6LijIQ8Sq6r6mo3TdZtm+9xp2lUIVg0p7ibT3auSW+jIw6TM?=
 =?iso-8859-1?Q?mTBniEvvf1bGQ9MHB6r5ZO3YmNWcMmiYqnl3fD3ezI4jAt6Gbsu6kVJBWe?=
 =?iso-8859-1?Q?bZ9rm84tl/cU2UDN7CGFBal4tCyemJpimRm+gd66npcj34BdjdpzVViUf/?=
 =?iso-8859-1?Q?7fifWFZ65L/VynDu2Y4U+fLMlT4UEmwqKVX7mjoFXUT1SAja3TpdlgJXb0?=
 =?iso-8859-1?Q?FirCKVwgm1pZ2N9ddS1Src4yqgCC2o6vhb3/wqoo1BH8xA/Y+vGSWzAfGF?=
 =?iso-8859-1?Q?YPInnMdm4CKK/SI62WZpCQKhKY5dxvOPfScdTtALwq7JWgdi7InWfNHxSx?=
 =?iso-8859-1?Q?Dz17ZiSzKgCW073jWF2WO50v7J6NDt7W2eiFegG6ZpebexeK5kyUyUE2aV?=
 =?iso-8859-1?Q?aL3cwqDbAxRx+0G2RNJDCacp8ecHTJCD/88BqfeBrm7ynB8q83/W0Otbkq?=
 =?iso-8859-1?Q?dQ32taaOYtr1g5uVziW6A0uYRb87/MBnyss30w8gTedbdTBCeezgK+Xe7T?=
 =?iso-8859-1?Q?HX8sSrKnaVYJVwUs31JtDY142FLzqLkBTZQftnO7P1S4TaNWNn/qQOE0q5?=
 =?iso-8859-1?Q?7DM+i1h0dIIKopbJ2ZOARszDQMJy3eWx5UKaeo5H+TrCOQm/EjgGsW22mv?=
 =?iso-8859-1?Q?FyifuRPDFV+E9Wl0lTiKpOZYd6Qvwap08tmbDcegbIP2wyoiwJiwJwGrEr?=
 =?iso-8859-1?Q?WtCY/tGRa9Gi6kP64re0GNju+dio1ozKG6WK8Va3nNjFE8xqQALwSAOuCG?=
 =?iso-8859-1?Q?lFjO8HJKnFjnZbx0RLmvVcxRcq72OpXhv8sHZrOpBLdKbJiGdQBaLd87dO?=
 =?iso-8859-1?Q?w0kWPviGtpH2UvGUWh64Xlo1gkYQcgNxDc5ssph0krgraOPaN+Wbce5WPE?=
 =?iso-8859-1?Q?Cmep021sJBd56SNWumuf3oQ6QXUauLVfNFW7IYs7+K7ag3ifIxuulC3bbi?=
 =?iso-8859-1?Q?49PE37HHrj6OB0BmhrLYrhkGEIZt8r+nK5MSIKu0MgFlj702gdPwAUTI/d?=
 =?iso-8859-1?Q?Hm0/m9biTVXh8ORRDwDrt0X78ZaBcFQvaCmhDu/l+tyMpZ/a/8AwREcQrc?=
 =?iso-8859-1?Q?rC+P30cGj+omBK307Ixbk1uNZnm8dhH91sHvJ42/WmZ/o4hZR/aVVcfCwi?=
 =?iso-8859-1?Q?3A1sk6csJOPHH7f6iOqz1ftIH1Xj6K7NpxUTUlaFydtDAcZSCaJIuge3tU?=
 =?iso-8859-1?Q?wjvo+Ea1bjoRNh5DEy4KLOw04W9/6nPAp1WDG2fcKmtXtD/3lE08/iTwTP?=
 =?iso-8859-1?Q?gBoGkZhKl3CvbLOnZT9Ms52DqCnCuMFy3nDrzg4NgbOAbVU36p3tjFzaAB?=
 =?iso-8859-1?Q?nCcJXzW+hgN2hnjoXWuwXS67o694DbzpXq/w8eoB7PpcYjjV/g334BdVTr?=
 =?iso-8859-1?Q?ZRMfZEvGETEIRxI5RWO1bpUDmsck5eSI/MsBstj1i6Plemi0TgDNObVvOg?=
 =?iso-8859-1?Q?R0NzRqGqMFNBy2ARcXudEu2LR0Ilfrbd/qk6DXlxk+k/3FoaGycBB+crgd?=
 =?iso-8859-1?Q?gjJCU8BWKw=3D=3D?=
X-Exchange-RoutingPolicyChecked: EBM8bZhN4gZGvVgVF+kRZlmdKulOKpODJ99yRVyk1jlMo5bsv/nKEZd3HBiDChes8JLOYmgz/CJpUtc5en2SSgtscHIAQ7K6X819XnIk/TkcfXHXTyoMbl4kWueqe5MkC9q+JODR96ZKCQl3jJAk5YXwZNl91Lxn824V3LrdP91eOUUBOXQhV6phwYypuw57cSMxGm/LvhJFF14IXGGcN3bm6+47Toh3bEuUIku25ebvQHVjE8mpHzMfyi5WFxPOrmJf2ui5yXSWqxds2k7EWu5+IgnM6h3xKhPGTPk3KZZCVpTUdvwzLGnPCQpNsLNtOurD3yNT4luj3RoaFnP25w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c140a67-54f1-4d2b-3654-08dea6640112
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:55:58.1326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XZqT8xckEOkizbCBDUfA5pN5otCFO6sT42/WJzIVZwgoss2X8JIDvkgxSWd3af+5TyHF2JYvr7tlL/5HluDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9723
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.8% regression of stress-ng.timermix.ops_per_sec on:


commit: d6e152d905bdb1f32f9d99775e2f453350399a6a ("clockevents: Prevent timer interrupt starvation")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timermix
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.schedmix.ops_per_sec 63.1% improvement |
| test parameters  | cpufreq_governor=performance                                |
|                  | nr_threads=100%                                             |
|                  | test=schedmix                                               |
|                  | testtime=60s                                                |
+------------------+-------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604301034.20678030-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260430/202604301034.20678030-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/timermix/stress-ng/60s

commit: 
  82b915051d ("tick/nohz: Fix inverted return value in check_tick_dependency() fast path")
  timers-urgent-2026-04-12

82b915051d32a68e    timers-urgent-2026-04-12 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     56512 ±  5%    +108.2%     117631 ± 13%  stress-ng.time.involuntary_context_switches
     16770            -3.4%      16208        stress-ng.time.percent_of_cpu_this_job_got
      4985 ± 12%     +89.5%       9447        stress-ng.time.system_time
      5096 ± 12%     -94.2%     295.08        stress-ng.time.user_time
     68249 ± 32%   +1830.1%    1317280 ±  8%  stress-ng.time.voluntary_context_switches
    113521            -4.9%     107945        stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
    113637            -4.9%     108029        stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
    113732            -4.8%     108294        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
    113484            -5.0%     107848        stress-ng.timermix.CLOCK_TAI_ticks_per_sec
      0.28 ±118%   +6352.0%      17.87        stress-ng.timermix.ITIMER_PROF_ticks_per_sec
      0.45 ±201%  +1.3e+05%     585.15        stress-ng.timermix.ITIMER_REAL_ticks_per_sec
      0.81 ±161%   +1954.0%      16.62        stress-ng.timermix.ITIMER_VIRTUAL_ticks_per_sec
 5.246e+09            -4.8%  4.996e+09        stress-ng.timermix.ops
  87471312            -4.8%   83288894        stress-ng.timermix.ops_per_sec
    104627 ± 22%    +776.3%     916799 ± 11%  cpuidle..usage
    187659            +4.6%     196280        proc-vmstat.nr_shmem
 5.228e+09           +21.4%  6.347e+09        turbostat.IRQ
   8982112            -5.6%    8475011        turbostat.NMI
     11.65            +2.8       14.40        mpstat.cpu.all.irq%
     41.93 ± 12%     +37.5       79.45        mpstat.cpu.all.sys%
     43.20 ± 12%     -40.3        2.86        mpstat.cpu.all.usr%
      3.30 ± 13%     +48.5%       4.90 ±  6%  mpstat.max_utilization.seconds
     51.91 ±  9%     +75.4%      91.07        vmstat.cpu.sy
     41.95 ± 12%     -93.5%       2.75 ±  2%  vmstat.cpu.us
      5058 ± 13%    +783.6%      44690 ±  8%  vmstat.system.cs
  81826210           +21.4%   99328233        vmstat.system.in
    487.42 ±  2%      +6.4%     518.44        sched_debug.cfs_rq:/.util_est.avg
    440.85 ± 29%     +24.6%     549.18 ±  3%  sched_debug.cpu.clock_task.stddev
      2406 ±  7%    +272.1%       8954 ±  7%  sched_debug.cpu.nr_switches.avg
     53222 ± 22%    +108.1%     110764 ± 14%  sched_debug.cpu.nr_switches.max
    526.55 ± 11%    +344.3%       2339 ± 30%  sched_debug.cpu.nr_switches.min
      4740 ± 22%    +165.8%      12599 ± 20%  sched_debug.cpu.nr_switches.stddev
 6.482e+10            +3.7%  6.724e+10        perf-stat.i.branch-instructions
      0.28            -0.0        0.27        perf-stat.i.branch-miss-rate%
 1.819e+08            -3.9%  1.749e+08        perf-stat.i.branch-misses
      4929 ± 14%    +926.9%      50624 ±  9%  perf-stat.i.context-switches
      1.78            -2.3%       1.74        perf-stat.i.cpi
    282.76 ±  2%      +7.0%     302.66 ±  2%  perf-stat.i.cpu-migrations
 3.382e+11            +3.7%  3.506e+11        perf-stat.i.instructions
      0.56            +3.6%       0.58        perf-stat.i.ipc
      0.28            -0.0        0.26        perf-stat.overall.branch-miss-rate%
      1.78            -3.6%       1.72        perf-stat.overall.cpi
      0.56            +3.7%       0.58        perf-stat.overall.ipc
 6.263e+10            +4.4%  6.536e+10        perf-stat.ps.branch-instructions
  1.75e+08            -3.1%  1.696e+08        perf-stat.ps.branch-misses
      4607 ± 15%    +912.4%      46647 ±  8%  perf-stat.ps.context-switches
    264.68 ±  2%      +7.9%     285.56 ±  2%  perf-stat.ps.cpu-migrations
 3.267e+11            +4.3%  3.408e+11        perf-stat.ps.instructions
 1.974e+13            +4.1%  2.055e+13        perf-stat.total.instructions
     22.90 ± 12%     -22.9        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.sigpending
     11.28 ± 12%     -11.3        0.00        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      9.50 ± 12%      -9.5        0.00        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      7.45 ± 12%      -7.5        0.00        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      3.05 ± 71%      -1.4        1.63 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.33 ± 12%      +0.3        2.66 ±  3%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.91 ± 12%      +0.5        1.41 ±  3%  perf-profile.calltrace.cycles-pp.posixtimer_send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      1.31 ± 12%      +0.5        1.82 ±  3%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.61 ±  7%      +0.7        3.26 ±  4%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.7        0.67 ± 29%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      3.62 ±  7%      +1.0        4.60 ±  4%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      3.53 ± 18%      +1.6        5.14 ±  8%  perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      3.54 ± 18%      +1.6        5.16 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.00            +2.1        2.08 ±  4%  perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
     19.93 ± 10%      +8.0       27.93 ± 10%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
     20.73 ± 10%      +9.0       29.69 ±  7%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
      0.07 ±300%      +9.4        9.46 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.00           +12.2       12.23 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
     17.53 ± 21%     +13.6       31.13 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
     17.21 ± 21%     +13.8       30.96 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      9.38 ± 20%     +14.1       23.52 ±  8%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.00           +14.5       14.53 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
      9.90 ± 17%     +15.0       24.89 ±  9%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.00           +21.2       21.16 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      8.41 ±  6%     +26.3       34.74        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +27.1       27.06 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     43.33 ±  7%      -6.8       36.53 ±  7%  perf-profile.children.cycles-pp.sigpending
      3.20 ± 70%      -1.5        1.65 ±  4%  perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
     12.96 ±  2%      -1.0       11.96        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      0.93 ±  6%      -0.5        0.45        perf-profile.children.cycles-pp.__irqentry_text_end
      4.72            -0.2        4.50        perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.82 ±  2%      -0.2        1.64        perf-profile.children.cycles-pp.__put_user_nocheck_8
      0.92 ±  5%      -0.2        0.77        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      1.78 ±  2%      -0.2        1.63        perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.22 ±  9%      -0.2        0.07        perf-profile.children.cycles-pp.irqentry_exit
      0.19 ±  3%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.timerqueue_del
      1.65            -0.1        1.59        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.10 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.rb_erase
      0.70            -0.0        0.66        perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.94            -0.0        0.90        perf-profile.children.cycles-pp.recalc_sigpending
      0.18 ±  3%      -0.0        0.16        perf-profile.children.cycles-pp.get_xsave_addr_user
      0.42 ±  2%      -0.0        0.40        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.07 ±  5%      -0.0        0.05 ±  5%  perf-profile.children.cycles-pp.__set_task_blocked
      0.20 ±  3%      -0.0        0.19        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.09 ±  5%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.08 ±  8%      +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.06 ±  9%      +0.1        0.11        perf-profile.children.cycles-pp.prepare_signal
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.try_to_wake_up
      0.14 ±  3%      +0.1        0.23 ±  3%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.12 ±  2%  perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.18 ±  2%      +0.1        0.33 ±  3%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      1.44            +0.2        1.59        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.89 ±  2%      +0.2        1.08        perf-profile.children.cycles-pp.native_sched_clock
      1.20 ±  2%      +0.2        1.43        perf-profile.children.cycles-pp.sched_clock_cpu
      0.96 ±  3%      +0.2        1.19        perf-profile.children.cycles-pp.__irq_exit_rcu
      1.04 ±  2%      +0.3        1.31        perf-profile.children.cycles-pp.sched_clock
      0.90 ±  2%      +0.3        1.19 ±  2%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      2.59 ±  2%      +0.3        2.94        perf-profile.children.cycles-pp.read_tsc
      1.32 ±  2%      +0.4        1.69        perf-profile.children.cycles-pp.irqtime_account_irq
      0.06 ±  7%      +0.4        0.48        perf-profile.children.cycles-pp.complete_signal
      2.65 ±  2%      +0.5        3.10        perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.03 ±  2%      +0.6        1.62        perf-profile.children.cycles-pp.posixtimer_send_sigqueue
      1.46 ±  2%      +0.6        2.08        perf-profile.children.cycles-pp.posix_timer_fn
      6.06 ±  2%      +0.7        6.72        perf-profile.children.cycles-pp.lapic_next_deadline
      2.08 ±  3%      +0.7        2.74        perf-profile.children.cycles-pp.native_apic_msr_eoi
      7.84 ±  3%      +1.4        9.21        perf-profile.children.cycles-pp.clockevents_program_event
      8.37 ±  2%      +2.5       10.83        perf-profile.children.cycles-pp.hrtimer_interrupt
     10.64 ±  2%      +3.2       13.84        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     12.62 ±  2%      +3.7       16.31        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     19.91 ±  2%      +3.9       23.80        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     28.96 ± 10%      +7.6       36.54 ±  7%  perf-profile.children.cycles-pp.stress_timermix_itimer_action
     67.73 ±  6%     +23.3       90.99        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     67.37 ±  6%     +23.3       90.65        perf-profile.children.cycles-pp.do_syscall_64
     43.74 ±  4%     +24.8       68.53        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     43.59 ±  4%     +24.8       68.38        perf-profile.children.cycles-pp.arch_do_signal_or_restart
      9.42 ±  6%     +26.6       36.03        perf-profile.children.cycles-pp.get_signal
      0.47 ±112%     +26.7       27.20        perf-profile.children.cycles-pp._raw_spin_unlock_irq
      5.92 ± 11%      -4.9        0.97        perf-profile.self.cycles-pp.sigpending
      9.60 ±  3%      -0.7        8.86        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      0.92 ±  6%      -0.5        0.45        perf-profile.self.cycles-pp.__irqentry_text_end
      2.11 ±  3%      -0.2        1.88        perf-profile.self.cycles-pp.x64_setup_rt_frame
      4.56            -0.2        4.36        perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.53 ±  4%      -0.2        1.35        perf-profile.self.cycles-pp.copy_siginfo_to_user
      1.75 ±  2%      -0.2        1.57        perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.91 ±  5%      -0.2        0.76        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.63 ± 10%      -0.2        0.48        perf-profile.self.cycles-pp.do_syscall_64
      1.72 ±  2%      -0.1        1.58        perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.26 ± 33%      -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.54 ±  3%      -0.1        0.41        perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.95            -0.1        0.89        perf-profile.self.cycles-pp.fpregs_mark_activate
      0.24 ±  5%      -0.1        0.18        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      1.62            -0.1        1.57        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.16 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.70            -0.0        0.65        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.92            -0.0        0.89        perf-profile.self.cycles-pp.recalc_sigpending
      0.09 ±  5%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.irqentry_exit
      0.20 ±  3%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.07 ±  5%      -0.0        0.05 ±  5%  perf-profile.self.cycles-pp.__set_task_blocked
      0.14 ±  3%      -0.0        0.12 ±  2%  perf-profile.self.cycles-pp.get_xsave_addr_user
      0.32 ±  2%      -0.0        0.30        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.14 ±  3%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.62 ±  2%      +0.0        0.66        perf-profile.self.cycles-pp.ktime_get
      0.28 ±  3%      +0.0        0.32 ±  2%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.06 ±  9%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.16            +0.1        0.21        perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.06 ±  9%      +0.1        0.11        perf-profile.self.cycles-pp.prepare_signal
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.15 ±  3%      +0.1        0.22 ±  3%  perf-profile.self.cycles-pp.sched_clock
      0.46 ±  2%      +0.1        0.53        perf-profile.self.cycles-pp.posixtimer_send_sigqueue
      0.20 ±  2%      +0.1        0.28        perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.try_to_wake_up
      0.25 ±  2%      +0.1        0.33        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.13 ±  4%      +0.1        0.22 ±  4%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.55 ±  5%      +0.1        0.66        perf-profile.self.cycles-pp.get_signal
      0.00            +0.1        0.12 ±  2%  perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.24 ±  3%      +0.1        0.36        perf-profile.self.cycles-pp.hrtimer_interrupt
      0.12 ±  4%      +0.1        0.27        perf-profile.self.cycles-pp.irqtime_account_irq
      1.42            +0.2        1.57        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.07 ± 30%      +0.2        0.24        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.88 ±  2%      +0.2        1.07        perf-profile.self.cycles-pp.native_sched_clock
      1.58 ±  3%      +0.2        1.77        perf-profile.self.cycles-pp.get_sigframe
      0.83 ±  4%      +0.2        1.04        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.06            +0.3        0.38        perf-profile.self.cycles-pp.complete_signal
      2.56 ±  2%      +0.4        2.92        perf-profile.self.cycles-pp.read_tsc
      6.06 ±  2%      +0.7        6.71        perf-profile.self.cycles-pp.lapic_next_deadline
      2.08 ±  3%      +0.7        2.73        perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.27 ± 46%      +6.3        6.61        perf-profile.self.cycles-pp._raw_spin_unlock_irq


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/schedmix/stress-ng/60s

commit: 
  82b915051d ("tick/nohz: Fix inverted return value in check_tick_dependency() fast path")
  timers-urgent-2026-04-12

82b915051d32a68e    timers-urgent-2026-04-12 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3727996 ±  2%     +63.3%    6086179 ±  2%  stress-ng.schedmix.ops
     62046 ±  2%     +63.1%     101211 ±  2%  stress-ng.schedmix.ops_per_sec
 3.706e+08 ± 10%    +161.6%  9.696e+08 ±  4%  stress-ng.time.involuntary_context_switches
   6706225 ±  2%     +59.2%   10675958 ±  3%  stress-ng.time.minor_page_faults
     10384 ±  7%     +52.1%      15792 ±  3%  stress-ng.time.percent_of_cpu_this_job_got
      7633 ±  2%     +33.4%      10181        stress-ng.time.system_time
    799.27 ±  3%     +34.3%       1073 ±  2%  stress-ng.time.user_time
     30210 ± 11%     +43.4%      43336 ± 14%  perf-c2c.HITM.local
     36806 ±  3%      -9.7%      33246        uptime.idle
 7.243e+09 ± 18%     -48.2%  3.749e+09 ± 14%  cpuidle..time
  68067197 ±  8%     -36.7%   43065856 ±  6%  cpuidle..usage
      5080 ±  3%     -44.4%       2827 ± 81%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5080 ±  3%     -44.4%       2827 ± 81%  perf-sched.total_sch_delay.max.ms
   6258064 ±  9%     +24.1%    7768194 ±  6%  numa-meminfo.node1.Active
   6258058 ±  9%     +24.1%    7768188 ±  6%  numa-meminfo.node1.Active(anon)
   5388416 ± 11%     +29.3%    6966039 ±  5%  numa-meminfo.node1.Shmem
   2684543 ±  5%     +60.6%    4312022 ±  5%  numa-numastat.node0.local_node
   2824724 ±  5%     +57.0%    4433597 ±  4%  numa-numastat.node0.numa_hit
   4847047 ±  4%     +41.4%    6855842 ±  3%  numa-numastat.node1.local_node
   4959261 ±  4%     +40.9%    6985718 ±  3%  numa-numastat.node1.numa_hit
     40.98 ± 10%     -38.7%      25.11 ±  9%  vmstat.cpu.id
   9407108 ±  6%     +17.2%   11028272 ±  3%  vmstat.memory.cache
    298.23 ± 11%    +203.3%     904.51 ±  9%  vmstat.procs.r
  10557412 ± 10%     +78.6%   18850266 ±  4%  vmstat.system.cs
   3610309 ±  7%     +71.2%    6181556 ±  3%  vmstat.system.in
     39.54 ± 12%     -16.5       23.00 ± 10%  mpstat.cpu.all.idle%
     11.07 ± 12%      -4.5        6.53 ±  4%  mpstat.cpu.all.irq%
      4.43 ±  9%      +2.1        6.49 ±  4%  mpstat.cpu.all.nice%
      0.10 ± 10%      -0.0        0.08 ±  4%  mpstat.cpu.all.soft%
     44.40 ±  7%     +19.1       63.46 ±  3%  mpstat.cpu.all.sys%
      0.46            -0.0        0.43 ±  2%  mpstat.cpu.all.usr%
   6841708 ±  8%     +24.5%    8515254 ±  4%  meminfo.Active
   6841691 ±  8%     +24.5%    8515238 ±  4%  meminfo.Active(anon)
   1394289            +5.7%    1473069        meminfo.AnonPages
   9220886 ±  6%     +17.3%   10815935 ±  3%  meminfo.Cached
  15366259 ±  3%     +12.7%   17311630 ±  2%  meminfo.Memused
   5430240 ± 11%     +29.4%    7025294 ±  5%  meminfo.Shmem
  16005793 ±  4%     +10.3%   17662114 ±  2%  meminfo.max_used_kB
   2824792 ±  5%     +56.9%    4433070 ±  4%  numa-vmstat.node0.numa_hit
   2684642 ±  5%     +60.6%    4311400 ±  5%  numa-vmstat.node0.numa_local
   1565643 ±  9%     +24.1%    1942732 ±  6%  numa-vmstat.node1.nr_active_anon
   1348189 ± 11%     +29.2%    1742213 ±  5%  numa-vmstat.node1.nr_shmem
   1565639 ±  9%     +24.1%    1942728 ±  6%  numa-vmstat.node1.nr_zone_active_anon
   4959670 ±  4%     +40.8%    6985135 ±  3%  numa-vmstat.node1.numa_hit
   4847444 ±  4%     +41.4%    6855259 ±  3%  numa-vmstat.node1.numa_local
      1767 ±  7%     +24.5%       2200 ±  3%  turbostat.Avg_MHz
     61.28 ±  7%     +15.1       76.34 ±  3%  turbostat.Busy%
     10.88 ±  9%      -5.1        5.75 ±  6%  turbostat.C1E%
      4.42 ±  9%     -34.4%       2.90 ±  6%  turbostat.CPU%c1
      0.56 ±  2%     +28.1%       0.72        turbostat.IPC
 3.088e+08           +52.2%  4.699e+08 ±  2%  turbostat.IRQ
      7.24 ± 12%      +7.6       14.84 ± 13%  turbostat.PKG_%
      0.11 ± 17%      -0.1        0.01        turbostat.POLL%
    543.09 ±  3%     +12.1%     608.86        turbostat.PkgWatt
     19.24            +7.2%      20.62        turbostat.RAMWatt
   1710215 ±  9%     +24.4%    2126686 ±  4%  proc-vmstat.nr_active_anon
    348541            +5.6%     368112        proc-vmstat.nr_anon_pages
   2305042 ±  6%     +17.2%    2701998 ±  3%  proc-vmstat.nr_file_pages
   1357379 ± 11%     +29.2%    1754337 ±  5%  proc-vmstat.nr_shmem
     41479            +3.6%      42980        proc-vmstat.nr_slab_reclaimable
   1710215 ±  9%     +24.4%    2126685 ±  4%  proc-vmstat.nr_zone_active_anon
   7790140 ±  3%     +46.7%   11424460 ±  3%  proc-vmstat.numa_hit
   7537688 ±  3%     +48.2%   11172836 ±  3%  proc-vmstat.numa_local
   8254354 ±  2%     +45.5%   12009164 ±  3%  proc-vmstat.pgalloc_normal
   7666528           +51.0%   11578012 ±  3%  proc-vmstat.pgfault
   5897586 ±  2%     +53.1%    9027456 ±  3%  proc-vmstat.pgfree
    682469 ±  4%     +59.9%    1090978 ±  7%  proc-vmstat.pgreuse
      0.57 ± 25%     -48.2%       0.30 ± 12%  perf-stat.i.MPKI
 3.713e+10 ± 14%    +102.8%   7.53e+10 ±  5%  perf-stat.i.branch-instructions
 1.358e+08 ± 14%     +91.6%  2.602e+08 ±  4%  perf-stat.i.branch-misses
     24.76 ±  2%      -4.6       20.13 ±  2%  perf-stat.i.cache-miss-rate%
  33705317 ± 11%    +110.9%   71077249 ±  5%  perf-stat.i.cache-misses
 1.391e+08 ± 13%    +190.4%   4.04e+08 ±  6%  perf-stat.i.cache-references
   8033233 ± 17%    +127.4%   18268090 ±  6%  perf-stat.i.context-switches
      1.52 ±  6%     -15.8%       1.28 ±  4%  perf-stat.i.cpi
 2.288e+11            -1.2%  2.261e+11        perf-stat.i.cpu-clock
 3.052e+11 ± 14%     +55.6%  4.749e+11 ±  5%  perf-stat.i.cpu-cycles
    216206 ± 20%    +437.8%    1162782 ±  7%  perf-stat.i.cpu-migrations
 1.735e+11 ± 14%    +102.5%  3.513e+11 ±  5%  perf-stat.i.instructions
     35.89 ± 17%    +140.0%      86.14 ±  6%  perf-stat.i.metric.K/sec
     74366 ± 13%    +103.3%     151200 ±  5%  perf-stat.i.minor-faults
     74367 ± 13%    +103.3%     151201 ±  5%  perf-stat.i.page-faults
 2.288e+11            -1.2%  2.261e+11        perf-stat.i.task-clock
      0.19 ±  2%      +8.0%       0.20        perf-stat.overall.MPKI
      0.35            -0.0        0.35        perf-stat.overall.branch-miss-rate%
     24.37 ±  4%      -7.1       17.29 ±  3%  perf-stat.overall.cache-miss-rate%
      1.77           -22.1%       1.37        perf-stat.overall.cpi
      9464 ±  3%     -27.9%       6820 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.57           +28.4%       0.73        perf-stat.overall.ipc
 4.947e+10 ±  7%     +59.6%  7.893e+10 ±  3%  perf-stat.ps.branch-instructions
 1.755e+08 ±  8%     +56.2%  2.742e+08 ±  3%  perf-stat.ps.branch-misses
  43084205 ±  5%     +72.4%   74277312 ±  4%  perf-stat.ps.cache-misses
 1.773e+08 ±  7%    +142.6%  4.301e+08 ±  5%  perf-stat.ps.cache-references
  10844621 ± 10%     +79.3%   19445632 ±  4%  perf-stat.ps.context-switches
  4.08e+11 ±  7%     +24.1%  5.062e+11 ±  3%  perf-stat.ps.cpu-cycles
    292224 ± 16%    +330.6%    1258364 ±  7%  perf-stat.ps.cpu-migrations
  2.31e+11 ±  7%     +59.4%  3.682e+11 ±  3%  perf-stat.ps.instructions
     91544 ±  7%     +72.6%     157971 ±  4%  perf-stat.ps.minor-faults
     91545 ±  7%     +72.6%     157972 ±  4%  perf-stat.ps.page-faults
 1.907e+13           +40.1%  2.671e+13        perf-stat.total.instructions
 1.718e+08 ± 13%    +136.9%  4.071e+08 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.avg
 3.769e+08 ± 13%    +108.7%  7.866e+08 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
  48634927 ± 25%    +115.4%  1.048e+08 ± 28%  sched_debug.cfs_rq:/.avg_vruntime.min
  74986535 ± 14%    +100.1%    1.5e+08 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.39 ± 37%    +259.4%       1.39 ± 28%  sched_debug.cfs_rq:/.h_nr_idle.avg
      4.80 ± 41%    +332.3%      20.75 ± 33%  sched_debug.cfs_rq:/.h_nr_idle.max
      0.71 ± 35%    +313.1%       2.95 ± 26%  sched_debug.cfs_rq:/.h_nr_idle.stddev
      0.62 ± 26%    +169.3%       1.68 ± 23%  sched_debug.cfs_rq:/.h_nr_queued.avg
      5.70 ± 35%    +279.8%      21.65 ± 31%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.88 ± 27%    +254.3%       3.12 ± 23%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.62 ± 26%    +170.1%       1.67 ± 23%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      5.70 ± 35%    +279.8%      21.65 ± 31%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.87 ± 28%    +256.4%       3.12 ± 24%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
  57622096 ± 27%    +302.7%  2.321e+08 ± 13%  sched_debug.cfs_rq:/.left_deadline.avg
 3.627e+08 ± 15%    +108.3%  7.553e+08 ±  8%  sched_debug.cfs_rq:/.left_deadline.max
  92455131 ± 16%    +162.1%  2.423e+08 ±  3%  sched_debug.cfs_rq:/.left_deadline.stddev
  57622012 ± 27%    +302.7%  2.321e+08 ± 13%  sched_debug.cfs_rq:/.left_vruntime.avg
 3.627e+08 ± 15%    +108.3%  7.553e+08 ±  8%  sched_debug.cfs_rq:/.left_vruntime.max
  92455021 ± 16%    +162.1%  2.423e+08 ±  3%  sched_debug.cfs_rq:/.left_vruntime.stddev
      0.63 ± 26%    +168.9%       1.68 ± 23%  sched_debug.cfs_rq:/.nr_queued.avg
      5.70 ± 35%    +281.6%      21.75 ± 31%  sched_debug.cfs_rq:/.nr_queued.max
      0.88 ± 27%    +254.1%       3.13 ± 23%  sched_debug.cfs_rq:/.nr_queued.stddev
      1035 ± 20%     +62.4%       1680 ± 33%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    105.83 ± 15%     +71.5%     181.48 ± 36%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
  57622037 ± 27%    +302.7%  2.321e+08 ± 13%  sched_debug.cfs_rq:/.right_vruntime.avg
 3.627e+08 ± 15%    +108.3%  7.553e+08 ±  8%  sched_debug.cfs_rq:/.right_vruntime.max
  92455052 ± 16%    +162.1%  2.423e+08 ±  3%  sched_debug.cfs_rq:/.right_vruntime.stddev
    569.22 ± 24%    +190.0%       1650 ± 25%  sched_debug.cfs_rq:/.runnable_avg.avg
      4483 ± 42%    +385.2%      21757 ± 30%  sched_debug.cfs_rq:/.runnable_avg.max
    642.04 ± 33%    +373.6%       3040 ± 26%  sched_debug.cfs_rq:/.runnable_avg.stddev
     24.03 ± 67%    +426.5%     126.53 ± 32%  sched_debug.cfs_rq:/.spread.avg
    644.06 ± 22%     +58.6%       1021 ± 15%  sched_debug.cfs_rq:/.spread.max
     87.60 ± 35%    +150.2%     219.19 ± 14%  sched_debug.cfs_rq:/.spread.stddev
      2078 ± 36%    +117.9%       4529 ± 25%  sched_debug.cfs_rq:/.util_est.max
    300.09 ± 36%    +103.7%     611.39 ± 21%  sched_debug.cfs_rq:/.util_est.stddev
 1.718e+08 ± 13%    +136.9%  4.071e+08 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.avg
 3.769e+08 ± 13%    +108.7%  7.866e+08 ±  6%  sched_debug.cfs_rq:/.zero_vruntime.max
  48634926 ± 25%    +115.4%  1.048e+08 ± 28%  sched_debug.cfs_rq:/.zero_vruntime.min
  74986534 ± 14%    +100.1%    1.5e+08 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.stddev
     15303 ± 17%    +100.1%      30616 ± 24%  sched_debug.cpu.curr->pid.avg
     78142           +57.0%     122666 ±  2%  sched_debug.cpu.curr->pid.max
     18773 ± 22%    +118.2%      40959 ± 17%  sched_debug.cpu.curr->pid.stddev
      0.78 ± 21%    +143.4%       1.89 ± 20%  sched_debug.cpu.nr_running.avg
      6.20 ± 31%    +251.6%      21.80 ± 30%  sched_debug.cpu.nr_running.max
      0.93 ± 25%    +238.0%       3.13 ± 23%  sched_debug.cpu.nr_running.stddev
   1966597 ±  4%     +57.8%    3103539 ±  3%  sched_debug.cpu.nr_switches.avg
   2751186 ±  8%    +137.1%    6524123 ±  4%  sched_debug.cpu.nr_switches.max
    288900 ± 10%    +297.6%    1148712 ±  5%  sched_debug.cpu.nr_switches.stddev
      6.98           -16.5%       5.82 ±  6%  sched_debug.cpu.nr_uninterruptible.avg
     97.35 ± 13%    +158.0%     251.20 ±  9%  sched_debug.cpu.nr_uninterruptible.max
    -76.60          +188.6%    -221.10        sched_debug.cpu.nr_uninterruptible.min
     31.10 ± 21%    +178.4%      86.59 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


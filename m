Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFB3CBE97
	for <oe-lkp@lists.linux.dev>; Wed, 18 Mar 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838952; cv=fail; b=LXwl3qLcYVpiHJaf7lb+6Vg8tix4906n5O2kC7fnODVMzfUdPytUmlvf9R0xByh5/5xbEQxm74lK5t5cw/Gbld0o5raII+XP3WTMQ11JDj5P+lGw0secqzDUl9iSmume8qM6Q6EPl8ViC5BGG5vrjz0PldqQ756ODvPC+HnQKI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838952; c=relaxed/simple;
	bh=sJq4eKMWxYkgEw4yPq6GDV/infBEYuG60lU9Fz73AOA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aNmcYNyFkl82xKEMlJpIIU9SaPIR5I2Q3j0DMXtBsQXPBdERoLdor2Xh//VcoTJdZTCCvfp6GlI/4E53bOoMMBbscsTwSuuFq+WCl+GmJnVQ2XSSCepbva+2mM8JT3dL8SZvFtM5r3UP9yJxD4efBCPXlRQ4gx/OnQBupezVBps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmWt8V0U; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmWt8V0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773838949; x=1805374949;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=sJq4eKMWxYkgEw4yPq6GDV/infBEYuG60lU9Fz73AOA=;
  b=jmWt8V0UGq+ts4LN8+nyGA+SJD6sZC/ABVbXJCXuFHGDakvwED8589Mu
   K0iNrl7hI4YwbJ5etgexT0aUznCHVHUQJz7qj+6SijXG703xs3zLGnrtS
   JrnLJYv0KzU/3Jxxf4VywW9mI7Mf00YFmJKrwYrckdF6Ojr+Mv5/IDHEn
   DekaN6G5fv0lUipdbL9VfX+9Hn6QQu9zIX7/eRrwF4/Cw7aVyhyCR4kHO
   bycIdB5WW+stiFQDYGeaivWT82MzwDueeAtF2KFvI5ppRHrIb5/OD+Tzp
   GWwxrXJActXZ9aQTm71E7whCazIfYONkJ/XkBMdz8Tzx/u+onHPpRpRA9
   A==;
X-CSE-ConnectionGUID: cClXW6oWQWmHTO/fCOPYVA==
X-CSE-MsgGUID: Eo+jO8hUS8WF1K4XNxX6Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74920684"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74920684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:02:26 -0700
X-CSE-ConnectionGUID: 1Mx1+oFTR+mMJqu1ktRGoA==
X-CSE-MsgGUID: 4/g0DPMpQXeOMnlcdXrviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218196057"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:02:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:02:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 06:02:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWWw/MHisuCUVRf866P3G3Pzh9+wQI7YhzJbNu2m4MBDyx+W69SHyARwjJMJiNjeLHrTOYhzjwZRbywslpMzha5pb0CCehh7E9ZZPb5B86RqF2SlGd+SxDNR4LQNqj2A8k4YIX73JwVrNh4bEI0omcaWy+N695aYEkc5sm+MOweO7bApoX8f7hQMqbF+QLSARp1VM4oLM91LDbZhPOP5fNHkiIzNc1+Um+abkELm0WR1FSoyHjfvgsQ8frUlk7xQauznfcRpCVQewVusit6cxjJha013XWCGpQDsIZ8pE0ma2xsEzJQTUdJ+l/u0YQt7HSDrgmVX4APRKJkhDMdGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8VS9bfw2ZrQNkq2kJXuY2Joj1DXhE7ojqpPri65jmU=;
 b=hytZW5m3ayMvORahDZxokWyz3M4B+eVHbZcKh4PSqXSgNwHz5/GHbMQpvGe99+aC1FM2+lxh9EeB+pu0467ei7eYXRor4i1ERBefKgy0v+wZNYE4qk8tlm2l3vDFEvd0u3B3XTrWE7pNbmGL1nXXS3Cg19ewm6FV89RcEjA0b/xU8t4j8Ek5IX9nEyuD6yiKxjI6PHVIytE2rbX1nNiRn7RuxinkIHGGTxs3wRI7FU25dFeB2PybPOy/Y+Wcb9/LPNUz4ehn8cCWPbpNxM5aOIMSjIxAmd8gXQ+DSRhLo8MUlk/5uECxKUb7WK4PT5jsmDoAQTb5NwYt5T8ZIRalIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 13:01:42 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9723.013; Wed, 18 Mar 2026
 13:01:42 +0000
Date: Wed, 18 Mar 2026 21:01:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  6e3c0a4e1a:
 stress-ng.session.ops_per_sec 51.4% improvement
Message-ID: <202603182038.69cc234c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 098e02ef-692d-4c7c-b3dc-08de84ee802c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: fUhxl5vtmTk4aYuI2zwNztYXXMVkGUCJEIPKWg23qQdsE/tJo2z1wAc+XmgsPdX9Fu8iHuEVsBDo1+0KCLzPI6k5cKfq5V5qVtcb7jI6EfQUXjSSqGeU8+4HHuS2DFSQZsY5wXPyV7/LqrkbEk4tC69vAHaMllfC65qNuS2kyQ2n2i5/TrJq98JqNRcEXC5/uqkUHWjLRdOSzRw1K95uXNSxzYWVBdijmZRkMQlcF3NCUV5pXHFm/0PpNpdIdLt+O4aWq883CKTuUCAMq8KRQJ+xe0qhtsxUyAmv1U210iYRKP99WOE2bG1em+Hm1O1/YyKrV5zzEfXPuNJVk1D82wCa7smAhmSS7pinssgx/HtIEyrwP2BumVVNAH0IhLzKuoXGof1d6gdHNDyLTQ75HJmugfoUB2X9ulvU+/UT8mhQEqDzgtOsdb2SZ4Wp7y3U5xxHAknCEP5IUPbctmZSFIMjvNvxJbX0P6oJE+vQv8d+z58kU5LqhBVKXcm4uUyd64dZqvtTNgV/TegtWDLRjGXJFDaYfhkQ2Iw4P1xNlCLVxfKLkRGOmYJo9Fg+3sQ640XpRqZYkTy/+UCKNTQlh0nlQ2zV0Ns+3477MXfDQygGh5sxZzmOKvu6MBMuUBdi0HA9GmZaDuKiMnHNAjaHP6Pr1nRAknDwGkxsfTfrmR0HzNpng7dAFWK+d9vDOy4d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YzeZpgy3I13r0Zdr7GN4nxNETVG9z11JaDET2pUktPt7DM2pe0fZQqvArr?=
 =?iso-8859-1?Q?ampopsD4c2V0BqJEFlGOkNIQjZmFZGMRl89Qtpi34xiCwHS+GWW2GOD3fQ?=
 =?iso-8859-1?Q?b7mX7HXS+oj+VOYTNSJYZoJ4sQBlDOt+xSwNYp3DDpTjiGE9lLxfV+t1W6?=
 =?iso-8859-1?Q?ZxIM+PlwOLc3ukyhPIGyssab7s55vVtKcZmYH0mwMppa3BiVkNM3/Jolvk?=
 =?iso-8859-1?Q?hDKOHjtS7kJz4uJnIVsbBQqfU7miPudzDPtFNUBBrTF5wGEUBy/nOqqvVk?=
 =?iso-8859-1?Q?fapm86i2putmSTlcf7CnlhJh+UPq09VZm6JJmu5olbRLDdDFXRsJ9eQZ+z?=
 =?iso-8859-1?Q?/fh3NQBDle0FzWaNGqxIPcI1/ng0y7fA4Lrb+MoEjBZYb30Gu2Kc4+30xX?=
 =?iso-8859-1?Q?dzpYPx7uHvgHfxeIQhQ40llm+jGygik/hyfqXHvNieQ6u0P7WORy0oo7Rz?=
 =?iso-8859-1?Q?M7n4FZW8OD4knSCGp7X9+hOp4mE3jfBAnmpSkFWzuzsmMTx6w0zG5HvdEq?=
 =?iso-8859-1?Q?fuZPFimrnzXxAzD8xPa6y3SGoYjSEawQCAAB45aCC/UP+JFFK9in44Sg93?=
 =?iso-8859-1?Q?oEXB1khR/oDZy23RBqAJuyQdbkuAuXzSfd59ModAmHdiwjEp/Ih6uvf/yS?=
 =?iso-8859-1?Q?aXTzsp64JDE7Lu6LOf8VvOVH9gPQyu6MaaAdUam1z1W3KRqcL1zbOksSw5?=
 =?iso-8859-1?Q?PUTdO6xXNsXOG3tE0Sl2duN/s1LY5+NKSvM5N6+Qlb58Fp4AY0D7Yo3csw?=
 =?iso-8859-1?Q?1XgSfimYjfLxEaclV9+Ej3LOVFCEn0qffeVETmOcj31Gn3GUpWaBbjdYOP?=
 =?iso-8859-1?Q?F7XLJEJ/MBLlHmBkQLsKjBnikq+kBgw6oGcAmVCxHBHTfdrhhxvB8cAzEb?=
 =?iso-8859-1?Q?RboT7TD74e7BH+oTu7RXMAi4Uel6YaqtasxlpDLeeCyiuFV5l9YI04hB/4?=
 =?iso-8859-1?Q?GHhcbxky40txUvVnM1h4oRmg+TYnsNnR3W4wrg0FTL0ANxemBd1OBujOnE?=
 =?iso-8859-1?Q?ZIfCalOin9O24y78qPnw9lCFZrR8c+OUH/XOyCbrznd1Fblg/ffmNO3o4l?=
 =?iso-8859-1?Q?GGvZsIQ37NYKclbIVYlvPhN2uLIhXXgNvJDaFSa7k11ripIxgAqWW6W3/4?=
 =?iso-8859-1?Q?6d2ZMaycXdrq/caUmAx/5YU6o8p7be9zMzXmbQPrMYT45SZgfgsGutE5MS?=
 =?iso-8859-1?Q?babN2wkLr7V6Soa+yM+Lmsi50Q8FA9pbOFTgtkk/iw+2/X0Vo4p7AfcqIf?=
 =?iso-8859-1?Q?zvn7bZvjqH7ZPKYXXiXlT3ikIrlyPqGONxSA9Dz4PGCBxwIUOSOP/5Tcxu?=
 =?iso-8859-1?Q?xaNChhrUuT2Csnndky9sHqEAakiTfglq3ZzNPFqjFfiUAIVq34LmitQudh?=
 =?iso-8859-1?Q?zHmTN1LaJkeuA/cHbrH/CLyWjsIadcPGsMNrk41F4LmOuepzIR7pCHNKZr?=
 =?iso-8859-1?Q?LVLdSwE/UB+hXpuCLuLf0zdBfz2HjhGu57rDP6NWSB7zAi1U+bpW10xjKh?=
 =?iso-8859-1?Q?TUP7IT5kPDWgF3gQcoveIWBYhMbI/yj+5Xjan2VBHlaYADdj6YVnVNe+2B?=
 =?iso-8859-1?Q?R5ZgHEno2ufETe3TOBXH7SYhB5NzS9wsHXs+OBF2N6TZA7d9jhRD8LYqc7?=
 =?iso-8859-1?Q?IFoEKf14DwXw2msIFN4nkG9baW57pVJ3hse0myT/8m7DYabKVvs7oA0YJh?=
 =?iso-8859-1?Q?lnPPVhYhM1kLV6n5i7j/zpHCBMWc9daky8uytvyh4mwMyYZkPjVc1qJ0bt?=
 =?iso-8859-1?Q?x1yft+8gHEDU3Iy9aeO4QAF8Yu4inXv3UzEzAKO7NGGOx/M8BvFlRTjIWX?=
 =?iso-8859-1?Q?jLaSkfUN7Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: h9toeI4IICoQ9NeQj9j45YvjH+h12IIt55xkrBBhfA04ZLKi2VBgZErI7lB1giHMP5ZYQq1PCDFaCQ/2jSs7ZUy/1EYFbzaQTUUQku+Swj6J0diJjJt7I9sMML/1LqgDLKz6pM2O7NBtYW6rvtz6n1PsahUeisSr7GtxhHILm+4ATaKY8uerQRI0ZH2bdkZ/3ooz3a6AXm/lqE2/uAl2V3fGyn87wJVM3JRNg7XLzLjn3LC6HYM27qq6NvDjaVxA38GAG0z3MTpKXjzF6xJYTOL91d9YSB48cSKSzQ+SaY+3JMY0dAKsWumjnIYKmOcd0rD48kGFH8DSPZup3XJD9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 098e02ef-692d-4c7c-b3dc-08de84ee802c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:01:42.4892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiotLF/BkJMXBcHHS4AebGPBZrzQy3+zDSXsp7SQWbiBpD1TN/wjd2ChVrSIPykGXCnbAKiisnYRHey0fX0LtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 51.4% improvement of stress-ng.session.ops_per_sec on:


commit: 6e3c0a4e1ad1e0455b7880fad02b3ee179f56c09 ("sched/fair: Fix lag clamp")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: session
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260318/202603182038.69cc234c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/session/stress-ng/60s

commit: 
  ff38424030 ("sched/eevdf: Update se->vprot in reweight_entity()")
  6e3c0a4e1a ("sched/fair: Fix lag clamp")

ff38424030f98976 6e3c0a4e1ad1e0455b7880fad02 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    478254           +51.4%     723840        stress-ng.session.ops
      7980           +51.4%      12079        stress-ng.session.ops_per_sec
    656194 ±  2%     +12.6%     738630        stress-ng.time.involuntary_context_switches
      5029 ± 51%    +156.8%      12918 ± 38%  stress-ng.time.major_page_faults
  58213485 ±  2%     +51.7%   88335329 ±  2%  stress-ng.time.minor_page_faults
     16275            -3.1%      15770        stress-ng.time.percent_of_cpu_this_job_got
      9759            -3.3%       9441        stress-ng.time.system_time
     23.87           +57.0%      37.48 ±  2%  stress-ng.time.user_time
   1831193           +59.6%    2922879        stress-ng.time.voluntary_context_switches
   2570608 ±  2%     +39.2%    3577083        cpuidle..usage
     74656           +52.7%     114033        vmstat.system.cs
    437837            +9.1%     477664        vmstat.system.in
      0.29            +0.0        0.33        mpstat.cpu.all.irq%
      4.94            +2.3        7.21        mpstat.cpu.all.soft%
      0.79            +0.1        0.91        mpstat.cpu.all.usr%
     45425 ± 20%     +60.6%      72939 ± 17%  perf-c2c.DRAM.remote
    112908 ± 21%     +93.3%     218229 ± 16%  perf-c2c.HITM.local
     32975 ± 20%     +51.9%      50091 ± 17%  perf-c2c.HITM.remote
    145884 ± 21%     +83.9%     268320 ± 16%  perf-c2c.HITM.total
      0.11           +27.3%       0.14        turbostat.IPC
  28695444           +10.8%   31799344        turbostat.IRQ
   6879930            +7.5%    7392786        turbostat.NMI
    323.40            +3.6%     335.06        turbostat.PkgWatt
     21.06           +17.8%      24.82        turbostat.RAMWatt
      0.26 ±  3%     -13.0%       0.22 ±  2%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.26 ±  3%     -13.0%       0.22 ±  2%  perf-sched.total_sch_delay.average.ms
     13.73 ±  2%     -29.1%       9.73        perf-sched.total_wait_and_delay.average.ms
    262247           +46.9%     385362        perf-sched.total_wait_and_delay.count.ms
     13.47 ±  2%     -29.4%       9.51        perf-sched.total_wait_time.average.ms
     13.73 ±  2%     -29.1%       9.73        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    262247           +46.9%     385362        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     13.47 ±  2%     -29.4%       9.51        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3.65           +40.8%       5.14        perf-stat.i.MPKI
 1.261e+10           +22.7%  1.547e+10        perf-stat.i.branch-instructions
      0.46            +0.2        0.61        perf-stat.i.branch-miss-rate%
  57235407           +63.7%   93698591        perf-stat.i.branch-misses
     35.37            +4.7       40.09        perf-stat.i.cache-miss-rate%
 2.165e+08 ±  2%     +80.4%  3.907e+08        perf-stat.i.cache-misses
 6.154e+08 ±  2%     +58.9%  9.777e+08        perf-stat.i.cache-references
     78047           +52.7%     119160        perf-stat.i.context-switches
      9.30           -22.5%       7.21        perf-stat.i.cpi
 5.577e+11            -1.0%   5.52e+11        perf-stat.i.cpu-cycles
     18887           +55.1%      29287        perf-stat.i.cpu-migrations
      2555           -45.1%       1403        perf-stat.i.cycles-between-cache-misses
 5.952e+10           +27.7%  7.599e+10        perf-stat.i.instructions
      0.11           +28.3%       0.14        perf-stat.i.ipc
     10.12 ±  2%     +50.3%      15.20        perf-stat.i.metric.K/sec
    971562 ±  2%     +50.3%    1459851        perf-stat.i.minor-faults
    971648 ±  2%     +50.3%    1460068        perf-stat.i.page-faults
      3.64           +41.5%       5.15        perf-stat.overall.MPKI
      0.45            +0.2        0.60        perf-stat.overall.branch-miss-rate%
     35.22            +4.8       40.04        perf-stat.overall.cache-miss-rate%
      9.32           -22.3%       7.24        perf-stat.overall.cpi
      2561           -45.1%       1406        perf-stat.overall.cycles-between-cache-misses
      0.11           +28.7%       0.14        perf-stat.overall.ipc
 1.222e+10           +23.7%  1.512e+10        perf-stat.ps.branch-instructions
  55259322           +65.3%   91335073        perf-stat.ps.branch-misses
 2.101e+08 ±  2%     +82.0%  3.824e+08        perf-stat.ps.cache-misses
 5.966e+08 ±  2%     +60.1%  9.552e+08        perf-stat.ps.cache-references
     75720           +53.7%     116353        perf-stat.ps.context-switches
     18024           +57.6%      28406        perf-stat.ps.cpu-migrations
 5.771e+10           +28.7%  7.427e+10        perf-stat.ps.instructions
     81.41 ± 51%    +156.0%     208.37 ± 38%  perf-stat.ps.major-faults
    938211 ±  2%     +51.7%    1423513        perf-stat.ps.minor-faults
    938293 ±  2%     +51.7%    1423721        perf-stat.ps.page-faults
 3.493e+12           +29.5%  4.525e+12        perf-stat.total.instructions
     70.40           -22.2       48.23        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_cache_node_noprof
     70.53           -22.1       48.43        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_cache_node_noprof.alloc_fair_sched_group
     75.80           -20.8       54.96        perf-profile.calltrace.cycles-pp.get_from_partial_node.___slab_alloc.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group
     76.00           -20.7       55.30        perf-profile.calltrace.cycles-pp.___slab_alloc.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group.sched_autogroup_create_attach
     81.53           -16.2       65.30        perf-profile.calltrace.cycles-pp.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group.sched_autogroup_create_attach.ksys_setsid
     81.90           -16.0       65.94        perf-profile.calltrace.cycles-pp.alloc_fair_sched_group.sched_create_group.sched_autogroup_create_attach.ksys_setsid.__x64_sys_setsid
     81.91           -16.0       65.95        perf-profile.calltrace.cycles-pp.sched_create_group.sched_autogroup_create_attach.ksys_setsid.__x64_sys_setsid.do_syscall_64
     83.08           -15.2       67.87        perf-profile.calltrace.cycles-pp.sched_autogroup_create_attach.ksys_setsid.__x64_sys_setsid.do_syscall_64.entry_SYSCALL_64_after_hwframe
     83.10           -15.2       67.90        perf-profile.calltrace.cycles-pp.__x64_sys_setsid.do_syscall_64.entry_SYSCALL_64_after_hwframe.setsid
     83.10           -15.2       67.90        perf-profile.calltrace.cycles-pp.ksys_setsid.__x64_sys_setsid.do_syscall_64.entry_SYSCALL_64_after_hwframe.setsid
     83.10           -15.2       67.91        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.setsid
     83.10           -15.2       67.91        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.setsid
     83.10           -15.2       67.92        perf-profile.calltrace.cycles-pp.setsid
      0.54            +0.0        0.56        perf-profile.calltrace.cycles-pp.cmd_record
      0.54            +0.0        0.56        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.cmd_record
      0.54            +0.0        0.56        perf-profile.calltrace.cycles-pp.record__finish_output.cmd_record
      0.53            +0.0        0.56        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      0.51            +0.1        0.65        perf-profile.calltrace.cycles-pp.unregister_fair_sched_group.sched_unregister_group_rcu.rcu_do_batch.rcu_core.handle_softirqs
      0.51            +0.1        0.65        perf-profile.calltrace.cycles-pp.sched_unregister_group_rcu.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      0.84 ±  2%      +0.2        1.03 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.__kmem_cache_free_bulk.sheaf_flush_unused
      0.85 ±  2%      +0.2        1.04 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.__kmem_cache_free_bulk.sheaf_flush_unused.__pcs_replace_full_main
      0.90 ±  2%      +0.2        1.09 ±  2%  perf-profile.calltrace.cycles-pp.__slab_free.__kmem_cache_free_bulk.sheaf_flush_unused.__pcs_replace_full_main.kfree
      0.91 ±  2%      +0.2        1.11 ±  2%  perf-profile.calltrace.cycles-pp.__kmem_cache_free_bulk.sheaf_flush_unused.__pcs_replace_full_main.kfree.free_fair_sched_group
      0.93 ±  2%      +0.2        1.17 ±  2%  perf-profile.calltrace.cycles-pp.sheaf_flush_unused.__pcs_replace_full_main.kfree.free_fair_sched_group.sched_free_group_rcu
      0.94 ±  2%      +0.2        1.18 ±  2%  perf-profile.calltrace.cycles-pp.__pcs_replace_full_main.kfree.free_fair_sched_group.sched_free_group_rcu.rcu_do_batch
      0.64 ± 21%      +0.3        0.98 ±  3%  perf-profile.calltrace.cycles-pp.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap.dup_mm
      0.71 ± 18%      +0.4        1.09 ±  3%  perf-profile.calltrace.cycles-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
      0.72 ± 19%      +0.4        1.10 ±  3%  perf-profile.calltrace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
      0.58            +0.4        1.01 ±  3%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.60            +0.4        1.02 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.18 ±  2%      +0.5        2.64 ±  9%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kfree.free_fair_sched_group
      0.68            +0.5        1.17 ±  3%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.69            +0.5        1.17 ±  3%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      0.74            +0.5        1.25 ±  3%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.remove_entity_load_avg.unregister_fair_sched_group.sched_unregister_group_rcu.rcu_do_batch.rcu_core
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.__pi_memset.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group.sched_autogroup_create_attach
      0.96            +0.5        1.48        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork
      0.00            +0.5        0.54 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      0.00            +0.5        0.54 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.__vma_start_write.dup_mmap.dup_mm.copy_process.kernel_clone
      2.20 ±  2%      +0.6        2.75 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kfree.free_fair_sched_group.sched_free_group_rcu
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.__vma_start_write.free_pgtables.exit_mmap.__mmput.exit_mm
      0.00            +0.6        0.56 ±  8%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.dup_mmap.dup_mm
      0.95 ± 13%      +0.6        1.52 ±  2%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +0.6        0.58 ±  5%  perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault
      0.00            +0.6        0.58 ±  4%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      0.00            +0.6        0.59        perf-profile.calltrace.cycles-pp.vm_area_dup.dup_mmap.dup_mm.copy_process.kernel_clone
      0.00            +0.6        0.59 ±  3%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +0.6        0.59 ±  3%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.6        0.59 ±  3%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.00            +0.6        0.60        perf-profile.calltrace.cycles-pp.__anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.57 ±  9%      +0.6        1.16 ±  5%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput.exit_mm
      0.57 ±  9%      +0.6        1.16 ±  5%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.6        0.62 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      4.37            +0.6        4.99        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.get_from_partial_node.___slab_alloc.__kmalloc_cache_node_noprof
      4.38            +0.6        5.00        perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.get_from_partial_node.___slab_alloc.__kmalloc_cache_node_noprof.alloc_fair_sched_group
      4.34            +0.6        4.97        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.get_from_partial_node.___slab_alloc
      0.64 ±  8%      +0.6        1.27 ±  5%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.exit_mm.do_exit
      4.17            +0.7        4.84        perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.get_from_partial_node
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.common_startup_64
      0.17 ±141%      +0.7        0.88 ±  4%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.17 ±141%      +0.7        0.88 ±  4%  perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.14            +0.7        1.85        perf-profile.calltrace.cycles-pp.online_fair_sched_group.sched_autogroup_create_attach.ksys_setsid.__x64_sys_setsid.do_syscall_64
      0.08 ±223%      +0.7        0.81 ±  3%  perf-profile.calltrace.cycles-pp.unlink_file_vma_batch_add.free_pgtables.exit_mmap.__mmput.exit_mm
      0.00            +0.7        0.74 ±  7%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.dup_mmap.dup_mm.copy_process
      0.08 ±223%      +0.7        0.83 ±  4%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.00            +0.7        0.75 ±  5%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.__put_anon_vma.unlink_anon_vmas
      0.00            +0.8        0.75        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.online_fair_sched_group.sched_autogroup_create_attach.ksys_setsid
      0.00            +0.8        0.77        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.online_fair_sched_group.sched_autogroup_create_attach.ksys_setsid.__x64_sys_setsid
      2.45            +0.8        3.23        perf-profile.calltrace.cycles-pp.__slab_free.kfree.free_fair_sched_group.sched_free_group_rcu.rcu_do_batch
      0.00            +0.8        0.79 ±  7%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap
      0.00            +0.8        0.81 ±  6%  perf-profile.calltrace.cycles-pp.down_write.dup_mmap.dup_mm.copy_process.kernel_clone
      1.24 ± 11%      +0.8        2.06 ±  2%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      1.25 ± 11%      +0.8        2.08 ±  2%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      1.26 ± 11%      +0.8        2.10 ±  2%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.00            +0.9        0.91 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.__put_anon_vma.unlink_anon_vmas.free_pgtables
      1.40 ± 10%      +0.9        2.31 ±  2%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      0.00            +0.9        0.92 ±  4%  perf-profile.calltrace.cycles-pp.down_write.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00            +1.1        1.07 ±  4%  perf-profile.calltrace.cycles-pp.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.00            +1.1        1.12 ±  2%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.__refill_objects_node
      1.71            +1.1        2.84        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.__refill_objects_node.refill_objects
      0.00            +1.1        1.15 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.__refill_objects_node.refill_objects
      1.72            +1.1        2.87        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.__refill_objects_node.refill_objects.__pcs_replace_empty_main
      0.00            +1.2        1.15 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.__refill_objects_node.refill_objects.__pcs_replace_empty_main.__kmalloc_cache_node_noprof
      0.00            +1.2        1.15 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore.__refill_objects_node.refill_objects.__pcs_replace_empty_main
      1.74            +1.2        2.91        perf-profile.calltrace.cycles-pp.__slab_free.__refill_objects_node.refill_objects.__pcs_replace_empty_main.__kmalloc_cache_node_noprof
      0.66 ±  4%      +1.2        1.91 ±  6%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.68 ±  4%      +1.3        1.96 ±  6%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_fork.dup_mmap.dup_mm.copy_process
      3.52            +1.4        4.90        perf-profile.calltrace.cycles-pp.kfree.free_fair_sched_group.sched_free_group_rcu.rcu_do_batch.rcu_core
      3.54            +1.4        4.91        perf-profile.calltrace.cycles-pp.sched_free_group_rcu.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      3.52            +1.4        4.91        perf-profile.calltrace.cycles-pp.free_fair_sched_group.sched_free_group_rcu.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +1.5        1.48 ±  6%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap
      4.16            +1.8        5.96        perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      1.01 ±  7%      +1.9        2.93 ±  2%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables
      2.62            +2.1        4.68        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__refill_objects_node.refill_objects.__pcs_replace_empty_main
      2.63            +2.1        4.69        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__refill_objects_node.refill_objects.__pcs_replace_empty_main.__kmalloc_cache_node_noprof
      4.14            +2.1        6.28 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      4.16            +2.1        6.29 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.15 ±  5%      +2.1        3.29 ±  2%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork
      1.24 ±  6%      +2.2        3.46 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.29 ±  6%      +2.3        3.55 ±  2%  perf-profile.calltrace.cycles-pp.down_write.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      1.48 ±  4%      +2.5        3.94 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      1.56 ±  4%      +2.5        4.08 ±  2%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      3.31 ±  2%      +3.5        6.82        perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      2.72 ±  3%      +3.6        6.28 ±  2%  perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.exit_mm
      5.14            +4.1        9.22        perf-profile.calltrace.cycles-pp.refill_objects.__pcs_replace_empty_main.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group
      5.12            +4.1        9.21        perf-profile.calltrace.cycles-pp.__refill_objects_node.refill_objects.__pcs_replace_empty_main.__kmalloc_cache_node_noprof.alloc_fair_sched_group
      5.15            +4.1        9.24        perf-profile.calltrace.cycles-pp.__pcs_replace_empty_main.__kmalloc_cache_node_noprof.alloc_fair_sched_group.sched_create_group.sched_autogroup_create_attach
      3.59 ±  2%      +4.2        7.78 ±  2%  perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      4.38 ±  2%      +5.0        9.41 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
      5.96            +5.9       11.89        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      5.97            +5.9       11.91        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      5.98            +5.9       11.92        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      6.15            +6.1       12.21        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.15            +6.1       12.21        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      6.15            +6.1       12.21        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.15            +6.1       12.21        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.45            +6.3       12.73        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      6.44            +6.3       12.73        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.09            +6.9       14.02        perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
      7.35            +7.1       14.45        perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      7.54            +7.2       14.76        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.73            +7.4       15.09        perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      7.73            +7.4       15.09        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      7.73            +7.4       15.10        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      7.73            +7.4       15.10        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      7.93            +7.5       15.43        perf-profile.calltrace.cycles-pp._Fork
     75.80           -20.8       54.96        perf-profile.children.cycles-pp.get_from_partial_node
     76.00           -20.7       55.30        perf-profile.children.cycles-pp.___slab_alloc
     79.50           -17.2       62.28        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     79.30           -17.2       62.10        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     81.53           -16.2       65.30        perf-profile.children.cycles-pp.__kmalloc_cache_node_noprof
     81.91           -16.0       65.95        perf-profile.children.cycles-pp.alloc_fair_sched_group
     81.91           -16.0       65.95        perf-profile.children.cycles-pp.sched_create_group
     83.08           -15.2       67.87        perf-profile.children.cycles-pp.sched_autogroup_create_attach
     83.10           -15.2       67.90        perf-profile.children.cycles-pp.__x64_sys_setsid
     83.10           -15.2       67.90        perf-profile.children.cycles-pp.ksys_setsid
     83.10           -15.2       67.92        perf-profile.children.cycles-pp.setsid
     97.47            -1.5       96.02        perf-profile.children.cycles-pp.do_syscall_64
     97.47            -1.5       96.02        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.22 ±  2%      -0.2        0.05        perf-profile.children.cycles-pp.init_entity_runnable_average
      0.12            +0.0        0.13        perf-profile.children.cycles-pp.sched_tick
      0.05 ±  7%      +0.0        0.07        perf-profile.children.cycles-pp.update_curr
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.16            +0.0        0.18        perf-profile.children.cycles-pp.update_process_times
      0.54            +0.0        0.56        perf-profile.children.cycles-pp.perf_session__process_events
      0.54            +0.0        0.56        perf-profile.children.cycles-pp.reader__read_event
      0.54            +0.0        0.56        perf-profile.children.cycles-pp.record__finish_output
      0.17            +0.0        0.19 ±  2%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.21            +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.58            +0.0        0.61        perf-profile.children.cycles-pp.cmd_record
      0.05            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.alloc_thread_stack_node
      0.04 ± 44%      +0.0        0.07        perf-profile.children.cycles-pp.mas_walk
      0.26            +0.0        0.29        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.09            +0.0        0.12        perf-profile.children.cycles-pp.attach_entity_load_avg
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.refill_obj_stock
      0.25            +0.0        0.28        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.12 ± 13%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.kthread
      0.06 ±  9%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.setproctitle
      0.06            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.mas_next_slot
      0.06 ±  6%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.rmqueue
      0.07 ±  7%      +0.0        0.10        perf-profile.children.cycles-pp.do_task_dead
      0.07 ±  7%      +0.0        0.10        perf-profile.children.cycles-pp.mas_store
      0.04 ± 44%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.06 ±  9%      +0.0        0.09        perf-profile.children.cycles-pp.pte_offset_map_lock
      0.03 ± 70%      +0.0        0.07        perf-profile.children.cycles-pp.__free_frozen_pages
      0.06 ±  7%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.__mt_dup
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.06 ± 21%      +0.0        0.10 ± 23%  perf-profile.children.cycles-pp.__libc_fork
      0.05 ±  7%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.folio_add_file_rmap_ptes
      0.09 ±  4%      +0.0        0.13        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.09            +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.09            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.05            +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.exit_notify
      0.07            +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.mas_find
      0.06 ±  7%      +0.0        0.11        perf-profile.children.cycles-pp.pthread_rwlock_unlock
      0.08 ±  4%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.07 ±  7%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.set_pte_range
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__vmalloc_node_noprof
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__vmalloc_node_range_noprof
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.autogroup_move_group
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.do_notify_parent
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.update_se
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.worker_thread
      0.09 ±  5%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.__wp_page_copy_user
      0.09 ±  5%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.09 ±  5%      +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.vm_area_init_from
      0.05 ±  7%      +0.1        0.10 ±  7%  perf-profile.children.cycles-pp.wait_task_zombie
      0.08 ±  8%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.stress_session
      0.07 ±  6%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.remove_vma
      0.07            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.fput
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.do_wp_page
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__snprintf_chk
      0.10            +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.acct_collect
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__account_obj_stock
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.stress_proc_state_set
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__put_user_4
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.dequeue_entities
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.try_to_wake_up
      0.02 ± 99%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.unlink_file_vma_batch_final
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.update_irq_load_avg
      0.03 ± 70%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
      0.12 ±  4%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.sched_balance_rq
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.08 ±  4%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.vma_interval_tree_insert_after
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.shim_waitpid
      0.06 ±  8%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.__put_task_struct
      0.16 ±  3%      +0.1        0.22        perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.16 ±  3%      +0.1        0.22        perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.11            +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.11            +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.unmap_single_vma
      0.11            +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mas_dup_alloc
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.sched_move_task
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.schedule_idle
      0.18 ±  2%      +0.1        0.25        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.13 ±  2%      +0.1        0.20        perf-profile.children.cycles-pp._exit
      0.11            +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.schedule_tail
      0.13 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.__pick_next_task
      0.02 ±141%      +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.release_task
      0.12 ±  4%      +0.1        0.20        perf-profile.children.cycles-pp.pick_next_task_fair
      0.13            +0.1        0.21 ±  2%  perf-profile.children.cycles-pp.__percpu_counter_sum
      0.02 ± 99%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.sched_autogroup_exit
      0.11            +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.06            +0.1        0.14        perf-profile.children.cycles-pp.osq_unlock
      0.14            +0.1        0.22        perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.02 ±141%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.sched_release_group
      0.14 ±  5%      +0.1        0.23 ±  4%  perf-profile.children.cycles-pp.wp_page_copy
      0.14            +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.sched_balance_find_dst_group
      0.10 ± 10%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.__pte_alloc
      0.16            +0.1        0.25        perf-profile.children.cycles-pp.vma_interval_tree_remove
      0.07 ±  5%      +0.1        0.16 ±  7%  perf-profile.children.cycles-pp.__do_wait
      0.14 ±  3%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.prep_new_page
      0.14 ±  5%      +0.1        0.23 ±  3%  perf-profile.children.cycles-pp.kernel_init_pages
      0.16 ±  3%      +0.1        0.26        perf-profile.children.cycles-pp.__mmdrop
      0.18 ±  2%      +0.1        0.28        perf-profile.children.cycles-pp.__rb_erase_color
      0.16 ±  2%      +0.1        0.26        perf-profile.children.cycles-pp.select_task_rq_fair
      0.18 ±  2%      +0.1        0.28        perf-profile.children.cycles-pp.__rb_insert_augmented
      0.14 ±  5%      +0.1        0.24        perf-profile.children.cycles-pp.pte_alloc_one
      0.17 ±  2%      +0.1        0.28        perf-profile.children.cycles-pp.schedule
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.queued_write_lock_slowpath
      0.24 ±  6%      +0.1        0.35        perf-profile.children.cycles-pp.ret_from_fork
      0.24 ±  6%      +0.1        0.35        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.19 ±  2%      +0.1        0.31        perf-profile.children.cycles-pp.finish_task_switch
      0.18 ±  2%      +0.1        0.31        perf-profile.children.cycles-pp.wake_up_new_task
      0.27            +0.1        0.40        perf-profile.children.cycles-pp.attach_entity_cfs_rq
      0.20 ±  4%      +0.1        0.33 ±  3%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.27            +0.1        0.42        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.27            +0.2        0.42        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.22 ±  2%      +0.2        0.37 ±  3%  perf-profile.children.cycles-pp.pcpu_alloc_noprof
      0.13 ± 14%      +0.2        0.28 ±  9%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.22 ±  4%      +0.2        0.38 ±  3%  perf-profile.children.cycles-pp.alloc_pages_noprof
      0.24 ±  4%      +0.2        0.40 ±  3%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.24 ±  4%      +0.2        0.40 ±  3%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.24 ±  2%      +0.2        0.41 ±  2%  perf-profile.children.cycles-pp.mm_init
      0.35            +0.2        0.52        perf-profile.children.cycles-pp.update_rq_clock_task
      0.23 ±  2%      +0.2        0.41        perf-profile.children.cycles-pp.__update_load_avg_blocked_se
      0.30            +0.2        0.48        perf-profile.children.cycles-pp.__schedule
      0.22            +0.2        0.41 ±  2%  perf-profile.children.cycles-pp.do_wait
      0.31            +0.2        0.49        perf-profile.children.cycles-pp.tear_down_vmas
      0.23            +0.2        0.42 ±  2%  perf-profile.children.cycles-pp.kernel_wait4
      0.38            +0.2        0.60        perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.37            +0.2        0.59        perf-profile.children.cycles-pp.vm_area_dup
      0.32 ±  6%      +0.2        0.55        perf-profile.children.cycles-pp.process_simple
      0.32 ±  5%      +0.2        0.54        perf-profile.children.cycles-pp.ordered_events__queue
      0.32 ±  5%      +0.2        0.54        perf-profile.children.cycles-pp.queue_event
      0.34 ± 28%      +0.2        0.57 ± 11%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.35            +0.3        0.61        perf-profile.children.cycles-pp.__vma_start_exclude_readers
      0.30 ±  3%      +0.3        0.59 ±  3%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.30 ±  3%      +0.3        0.59 ±  3%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.30 ±  3%      +0.3        0.59 ±  3%  perf-profile.children.cycles-pp.pv_native_safe_halt
      0.30 ±  3%      +0.3        0.60 ±  3%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.40            +0.3        0.70        perf-profile.children.cycles-pp.up_write
      0.53            +0.3        0.84        perf-profile.children.cycles-pp.kmem_cache_free
      0.30 ±  3%      +0.3        0.60 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      0.30 ±  3%      +0.3        0.60 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.31 ±  3%      +0.3        0.62 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.07            +0.3        0.38        perf-profile.children.cycles-pp.init_tg_cfs_entry
      0.64 ± 21%      +0.3        0.98 ±  3%  perf-profile.children.cycles-pp.copy_pte_range
      0.35 ±  3%      +0.3        0.70 ±  3%  perf-profile.children.cycles-pp.start_secondary
      0.35 ±  3%      +0.3        0.70 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      0.35 ±  3%      +0.3        0.70 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.35 ±  3%      +0.3        0.70 ±  3%  perf-profile.children.cycles-pp.do_idle
      0.46 ±  7%      +0.4        0.81 ±  3%  perf-profile.children.cycles-pp.unlink_file_vma_batch_add
      0.48            +0.4        0.84        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.71 ± 18%      +0.4        1.09 ±  3%  perf-profile.children.cycles-pp.copy_p4d_range
      0.56            +0.4        0.94        perf-profile.children.cycles-pp.remove_entity_load_avg
      0.72 ± 19%      +0.4        1.10 ±  3%  perf-profile.children.cycles-pp.copy_page_range
      0.51 ±  3%      +0.4        0.92 ±  5%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.43            +0.4        0.85        perf-profile.children.cycles-pp.__pi_memset
      0.58            +0.4        1.02 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.68            +0.4        1.11        perf-profile.children.cycles-pp.__vma_start_write
      0.70            +0.5        1.16        perf-profile.children.cycles-pp.sched_unregister_group_rcu
      0.70            +0.5        1.16        perf-profile.children.cycles-pp.unregister_fair_sched_group
      0.96            +0.5        1.48        perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      0.47 ± 11%      +0.5        1.00 ±  7%  perf-profile.children.cycles-pp.folios_put_refs
      0.94            +0.5        1.48        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.73 ±  3%      +0.6        1.30 ±  5%  perf-profile.children.cycles-pp.filemap_map_pages
      0.95 ± 13%      +0.6        1.53 ±  2%  perf-profile.children.cycles-pp.zap_present_ptes
      0.78 ±  2%      +0.6        1.38 ±  5%  perf-profile.children.cycles-pp.do_fault
      0.78 ±  2%      +0.6        1.38 ±  5%  perf-profile.children.cycles-pp.do_read_fault
      0.64 ±  8%      +0.6        1.27 ±  5%  perf-profile.children.cycles-pp.tlb_finish_mmu
      1.23 ±  2%      +0.7        1.90 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_free_bulk
      0.37 ±  5%      +0.7        1.07 ±  4%  perf-profile.children.cycles-pp.__put_anon_vma
      1.14            +0.7        1.85        perf-profile.children.cycles-pp.online_fair_sched_group
      1.01 ±  2%      +0.7        1.74 ±  4%  perf-profile.children.cycles-pp.__handle_mm_fault
      1.25 ±  2%      +0.7        1.99 ±  2%  perf-profile.children.cycles-pp.sheaf_flush_unused
      0.70 ±  8%      +0.7        1.45 ±  5%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.70 ±  8%      +0.7        1.45 ±  5%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      1.03 ±  2%      +0.7        1.77 ±  4%  perf-profile.children.cycles-pp.handle_mm_fault
      1.26 ±  2%      +0.8        2.02 ±  2%  perf-profile.children.cycles-pp.__pcs_replace_full_main
      0.76 ±  2%      +0.8        1.57 ±  2%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      1.24 ± 11%      +0.8        2.06 ±  2%  perf-profile.children.cycles-pp.zap_pte_range
      1.25 ± 11%      +0.8        2.08 ±  2%  perf-profile.children.cycles-pp.zap_pmd_range
      1.26 ± 11%      +0.8        2.10 ±  2%  perf-profile.children.cycles-pp.unmap_page_range
      1.18 ±  2%      +0.8        2.03 ±  3%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.18 ±  2%      +0.9        2.04 ±  3%  perf-profile.children.cycles-pp.exc_page_fault
      1.40 ± 10%      +0.9        2.31 ±  2%  perf-profile.children.cycles-pp.unmap_vmas
      1.31 ±  2%      +0.9        2.22 ±  3%  perf-profile.children.cycles-pp.asm_exc_page_fault
      4.89            +1.4        6.28        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      4.72            +1.9        6.59        perf-profile.children.cycles-pp.free_fair_sched_group
      4.72            +1.9        6.60        perf-profile.children.cycles-pp.kfree
      4.72            +1.9        6.60        perf-profile.children.cycles-pp.sched_free_group_rcu
      5.57            +2.5        8.04        perf-profile.children.cycles-pp.rcu_core
      5.55            +2.5        8.03        perf-profile.children.cycles-pp.rcu_do_batch
      5.53            +2.5        8.01        perf-profile.children.cycles-pp.__irq_exit_rcu
      5.60            +2.5        8.09        perf-profile.children.cycles-pp.handle_softirqs
      5.79            +2.5        8.30        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.83            +2.5        8.34        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      6.39            +3.0        9.37        perf-profile.children.cycles-pp.__slab_free
      3.32 ±  2%      +3.5        6.82        perf-profile.children.cycles-pp.anon_vma_clone
      2.72 ±  3%      +3.6        6.28 ±  2%  perf-profile.children.cycles-pp.unlink_anon_vmas
      3.59 ±  2%      +4.2        7.78        perf-profile.children.cycles-pp.free_pgtables
      5.80            +4.4       10.24        perf-profile.children.cycles-pp.refill_objects
      5.79            +4.5       10.24        perf-profile.children.cycles-pp.__pcs_replace_empty_main
      5.78            +4.5       10.23        perf-profile.children.cycles-pp.__refill_objects_node
      4.38 ±  2%      +5.0        9.41 ±  2%  perf-profile.children.cycles-pp.anon_vma_fork
      5.96            +5.9       11.89        perf-profile.children.cycles-pp.exit_mmap
      5.97            +5.9       11.91        perf-profile.children.cycles-pp.__mmput
      5.98            +5.9       11.92        perf-profile.children.cycles-pp.exit_mm
      6.28            +6.1       12.40        perf-profile.children.cycles-pp.__x64_sys_exit_group
      6.28            +6.1       12.40        perf-profile.children.cycles-pp.do_group_exit
      6.28            +6.1       12.41        perf-profile.children.cycles-pp.x64_sys_call
      6.27            +6.1       12.40        perf-profile.children.cycles-pp.do_exit
      3.21 ±  4%      +6.2        9.38 ±  3%  perf-profile.children.cycles-pp.osq_lock
      7.10            +6.9       14.02        perf-profile.children.cycles-pp.dup_mmap
      7.35            +7.1       14.45        perf-profile.children.cycles-pp.dup_mm
      4.15 ±  3%      +7.2       11.36 ±  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      7.54            +7.2       14.76        perf-profile.children.cycles-pp.copy_process
      7.73            +7.4       15.09        perf-profile.children.cycles-pp.__do_sys_clone
      7.73            +7.4       15.09        perf-profile.children.cycles-pp.kernel_clone
      4.38 ±  3%      +7.4       11.77 ±  3%  perf-profile.children.cycles-pp.down_write
      7.95            +7.5       15.46        perf-profile.children.cycles-pp._Fork
     79.30           -17.2       62.09        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.21 ±  2%      -0.2        0.05        perf-profile.self.cycles-pp.init_entity_runnable_average
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.09            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.attach_entity_load_avg
      0.05            +0.0        0.09 ±  7%  perf-profile.self.cycles-pp.folio_add_file_rmap_ptes
      0.05 ±  8%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.online_fair_sched_group
      0.08            +0.0        0.12        perf-profile.self.cycles-pp.acct_collect
      0.08            +0.0        0.12        perf-profile.self.cycles-pp.update_sg_lb_stats
      0.08 ±  4%      +0.0        0.12        perf-profile.self.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.06            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.08 ±  5%      +0.0        0.13        perf-profile.self.cycles-pp.remove_entity_load_avg
      0.08 ±  5%      +0.0        0.13 ±  6%  perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      0.07            +0.0        0.12        perf-profile.self.cycles-pp.fput
      0.11            +0.1        0.16        perf-profile.self.cycles-pp.kmem_cache_free
      0.08            +0.1        0.13        perf-profile.self.cycles-pp.vm_area_init_from
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.mas_next_slot
      0.08            +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.vma_interval_tree_insert_after
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.copy_pte_range
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__put_anon_vma
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.mas_store
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.update_irq_load_avg
      0.12 ±  3%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.11            +0.1        0.17        perf-profile.self.cycles-pp.unmap_single_vma
      0.14            +0.1        0.20        perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.01 ±223%      +0.1        0.07        perf-profile.self.cycles-pp.mas_walk
      0.10            +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.attach_entity_cfs_rq
      0.11 ±  6%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.zap_pte_range
      0.12            +0.1        0.19        perf-profile.self.cycles-pp.unlink_anon_vmas
      0.14 ±  3%      +0.1        0.21        perf-profile.self.cycles-pp.unregister_fair_sched_group
      0.06 ±  6%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.osq_unlock
      0.15 ±  2%      +0.1        0.23        perf-profile.self.cycles-pp.__rb_erase_color
      0.13            +0.1        0.21        perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.15 ±  3%      +0.1        0.24        perf-profile.self.cycles-pp.vma_interval_tree_remove
      0.13 ±  3%      +0.1        0.21 ±  5%  perf-profile.self.cycles-pp.filemap_map_pages
      0.13 ±  5%      +0.1        0.22 ±  4%  perf-profile.self.cycles-pp.kernel_init_pages
      0.14            +0.1        0.23        perf-profile.self.cycles-pp.__kmalloc_cache_node_noprof
      0.17 ±  2%      +0.1        0.26        perf-profile.self.cycles-pp.__rb_insert_augmented
      0.22            +0.1        0.33        perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.07            +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.alloc_fair_sched_group
      0.20 ±  2%      +0.1        0.33        perf-profile.self.cycles-pp.anon_vma_clone
      0.23 ±  2%      +0.1        0.36        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.12            +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.rwsem_down_write_slowpath
      0.17            +0.1        0.31        perf-profile.self.cycles-pp.kfree
      0.32            +0.2        0.47        perf-profile.self.cycles-pp.update_rq_clock_task
      0.22 ±  2%      +0.2        0.39        perf-profile.self.cycles-pp.down_write
      0.31            +0.2        0.48        perf-profile.self.cycles-pp.__vma_start_write
      0.22 ±  2%      +0.2        0.41        perf-profile.self.cycles-pp.__update_load_avg_blocked_se
      0.37 ±  2%      +0.2        0.56        perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.22 ±  3%      +0.2        0.42 ±  3%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.35            +0.2        0.56        perf-profile.self.cycles-pp._raw_spin_lock
      0.33 ± 28%      +0.2        0.54 ± 11%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.09 ±  5%      +0.2        0.31        perf-profile.self.cycles-pp.___slab_alloc
      0.32 ±  6%      +0.2        0.54        perf-profile.self.cycles-pp.queue_event
      0.40 ±  5%      +0.2        0.64 ±  4%  perf-profile.self.cycles-pp.copy_present_ptes
      0.33            +0.2        0.57        perf-profile.self.cycles-pp.__vma_start_exclude_readers
      0.38            +0.3        0.64        perf-profile.self.cycles-pp.up_write
      0.46            +0.3        0.74        perf-profile.self.cycles-pp.dup_mmap
      0.07            +0.3        0.36        perf-profile.self.cycles-pp.init_tg_cfs_entry
      0.46            +0.3        0.75        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.57 ± 13%      +0.3        0.88 ±  8%  perf-profile.self.cycles-pp.zap_present_ptes
      0.53            +0.4        0.89        perf-profile.self.cycles-pp.__slab_free
      0.48 ±  3%      +0.4        0.84 ±  6%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.41            +0.4        0.80        perf-profile.self.cycles-pp.__pi_memset
      0.91            +0.5        1.37        perf-profile.self.cycles-pp.__refill_objects_node
      0.42 ± 13%      +0.5        0.88 ±  7%  perf-profile.self.cycles-pp.folios_put_refs
      0.92            +0.5        1.40        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.86            +0.6        1.48        perf-profile.self.cycles-pp.get_from_partial_node
      0.73 ±  2%      +0.8        1.49 ±  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      3.13 ±  4%      +6.0        9.10 ±  3%  perf-profile.self.cycles-pp.osq_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


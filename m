Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1722628C037
	for <oe-lkp@lists.linux.dev>; Mon, 25 Aug 2025 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105545; cv=fail; b=JNJUOFJekyKic6RBcn55WXkfMxRsK/WZEUP5guA8M1/9cJO2/3uFhpj4eNTWHgsqt0QaVqyRgRawq2hGMjc95ChzOP1wct76eg8WixtmhOnG1rrgIIB4XypJXdTnl/s1lMzz5Y9ap4DrupqDewgUz0dUcFu6ZmpFjIv/PZ7iCcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105545; c=relaxed/simple;
	bh=y0zXBHNOuVn0nj2uNUWECWm9KbYfwQkXijG/r8bBzKs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uyuVMl8xr0rkknEs3LAkMCi+qLTXNz9PTUZxD+CybF7T+T0oaZolBo/s3P7BqM58gc+Ebe6J2YtnCv5Dyr3kJ6CpSxz/utq8618cGowjDlpqE2BJskq2z9hBwIFLeEcPFvBVQ7NlbW0U4DzOL0GgBuH2MBgHWTDF2im3qP+XayE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWx1S7ls; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWx1S7ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756105541; x=1787641541;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=y0zXBHNOuVn0nj2uNUWECWm9KbYfwQkXijG/r8bBzKs=;
  b=ZWx1S7ls4kgPj7jmgo7eic9enBCrj/roYwFUIRhEoQtQlwsEOlk49V2H
   EfN4IKaMFD11boEZVz28Cu6Nn51YbhxqRG/PJ4oqZTTRM7hw03dtjN2Fs
   b5j/wGw7IE+OibvMKj8LoVFwg46+pLdnFMJxUvzlAzAnDL59h+hv/dm8N
   z4hFGcQ1zNqtsOE1MtO+okjsgIF5yRGMszNiVn5vaTFiARl9q9+7z0L+Y
   5B2R9tcek+8CC8kK6bLYhf6uqKc7z6z5wlusba2NHqiLa6xo5lVArDGDY
   LDSAH7C/sBZROA1/A0cyOIN5cH3UfAKP5jlt/ihMIyADgPvn8S40FKFdf
   w==;
X-CSE-ConnectionGUID: 1YluYU8QQ0WQFmSjeLR2Kg==
X-CSE-MsgGUID: 5NJnN71BTo6Pt8bi4PX3QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75908008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75908008"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:05:40 -0700
X-CSE-ConnectionGUID: fI0hbt/FRmyxmZJvfItXWg==
X-CSE-MsgGUID: wGkjIga6TFm+vrD5yTfiow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169612353"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:05:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:05:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 00:05:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuowquPZTbWtpB7vyPvN6Zgw6EFYYTyDzKR/AAj8Yxpaz9oPyfg1llMmELgTw0ZKw6RB9YA6LATwiQsJqVessvIcYiOc9av9pwX81oWCBjMkuf6+Dm1FbIMrOs7lMsI6tG3bnWH47yjhmKq5UOLkte16P8Jb2d61Ot8IY+E6055KgZf1qdFo8rZzfaSO+dBdOtm0fcV2ko5GTDhv+eqAU9OgCquGwd1Urg7ouoL1QA+Bz7jQAyYPVWPIeBYy3IW/XDfee/mUpITNBMqfrcra783oNHdewetGt5st2JFhJ0bxe/uE8tcfbbQYFzBbm+kpOPTeJoqVqH2EYYxlv9k5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtTpaenNKEUeJK0LjMFDqqjn4pnCc83zTEjCE72VxvQ=;
 b=jnGRTRavveQlY4ngENC7gsrB5mHK/sY1VEdCmbi8S/Qmm0pIlaOQcAwyA1WmNE8O+WbjTrC3rFO7/QsQjfcW/PEYkQf3WxUsr2ie9adKeuT2oCaTTsbEliKXEE4eEnuTseZhJJUZy1F+iz3OIEIWAHA5nFYL2optS4Plbb5zhuM9I9AV8VNhTtS8mBuZLJQg/8UU6wdSXhNIQEpejKFxKWT2hnwCqHxEQYKjc1fjYOUECapUHk9l7kqdz55NwvRV7p6lwPSWHQaMUSxQlkRtgRj+3w80A8oCksAfx4wpMwtzXgdG8uNd06JbzUhO8mj3QW70GVc8tTSNtf/LPfH1bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 07:05:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 07:05:35 +0000
Date: Mon, 25 Aug 2025 15:05:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [mm]  bf31671edf:  netperf.Throughput_Mbps
 11.0% regression
Message-ID: <202508251443.3f803480-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaa0f15-6fd0-4253-d1a5-08dde3a5c9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jplz3K5cO60vU1dAOgI0jPVzktvgIfqFxWfQ2gaD+d8rJpbHP1958KK0a4?=
 =?iso-8859-1?Q?mwd/CoH/8oowUaqe3Etws99yFl8JFleorfTaOhDs82auW3VcP2R4hmEu4y?=
 =?iso-8859-1?Q?IrVc08//LBqo2RN6/viy4xj6WAX7z18KGgRTSGPeC4nyjRW+5pmGmEeVZS?=
 =?iso-8859-1?Q?WWP3VgcsMXXxHvnaH37pihG0SToMtk48lPso84bKMdM6T02JYqmZytLOxn?=
 =?iso-8859-1?Q?nkhYi1AnCGHo3+aifBVvAOei84ghBcZnjzThXdWp0vIB2TRpNAR2tmz/dI?=
 =?iso-8859-1?Q?Pj0HTXWvCC1ADgIlKGvwvHRTbyQqReUT3sNGKB8qRo/qehZYqKz1dRb9U5?=
 =?iso-8859-1?Q?vCB7WncI8XeuLFTtCMkRGwEtQr8+5otLciNIq98lz8FvG2V7MCZCSB4pwk?=
 =?iso-8859-1?Q?STRoXENndKIK41kyHpnc52T7L9nch5PTTJ0DuJJDizAK6gjfq12+m0Y3Oc?=
 =?iso-8859-1?Q?YZDDurUavJpZ7Ed59p+KVB964LBtYQGEb2EOAs80RNRCJ5h/lw5TJwNP5E?=
 =?iso-8859-1?Q?ZxdLv9jq45gJKjpHsOdDOdgjBbKpPlkBAuy063sMhCryRAOh4s61xwP5Sa?=
 =?iso-8859-1?Q?Y95Lq20iYFUDtWSUIonZsNXtSeUUUQ/OMY2S/2+fK+a197nPHnIQbcPwGk?=
 =?iso-8859-1?Q?eGvgyNsXf/z1liQeMNTc2BGr2Gtrjog5edDOByviw6rEDcZLCo/lVlLFnL?=
 =?iso-8859-1?Q?sbQ6xvAwbcsMjPahaIgCF4WoZ7+AxMILYwfoWaL+mXQKJmBH5LW8yr6xp1?=
 =?iso-8859-1?Q?+sGTmunP8hhtT808JBn5ZsCqstvU8D2l/hUID7KNPX8FqbY6e+yQcmN/8I?=
 =?iso-8859-1?Q?YDUHIXvu2Fx407F1Mvzpgi7961RF1I0w5LC5dkJTz8exr/UOQWObPY/xuo?=
 =?iso-8859-1?Q?EO6Vw8HueufwWoExlrEuiYX5jhlSgzpGnrwl5jrDhO2yBd4+doax8mjXzm?=
 =?iso-8859-1?Q?/3Vqn5AgnLqMVPjq0oP9ejsZgTmq18nqsj6WCP77djse5txLs9ctXweLom?=
 =?iso-8859-1?Q?ZstbPgvGgvEINdmlPm4ZbTrD1xbk06cb3fEIbKVyiZ8VqszjJRGY2Kx2Jn?=
 =?iso-8859-1?Q?2KOoZPtmVR3Tr8Zm7jlNl9PnLeuJILaR7AvJch/EqhkHpoq+hLcHtMrZe8?=
 =?iso-8859-1?Q?rJdWVh3MCp4BKCCvB1N08nIjbNbIXlqQ0TTfPc/7tJIHGCLeHTE57KKWlw?=
 =?iso-8859-1?Q?xDUb8hxFXYuvdVP5TXOjQNvPGopIQRGNwicQnUIXRzlL1AQnWvm4UfTj9Q?=
 =?iso-8859-1?Q?YwJxlvU4bjW8Fy6Al9nobDnE3o7lsPsp7LD9wHa4Ba+r1zZk3Iq4iIdDk8?=
 =?iso-8859-1?Q?iyGxBqtYyoZAV4hHvETmEm1+eMN8UGedoPOW2V3oUx/zQ3cRQph26WCDAe?=
 =?iso-8859-1?Q?Hn63l/eTrBV0zDuoHI/UI3ZrME72hMY1d6Bmhw/VXr+e1a7XGQ760TaNv+?=
 =?iso-8859-1?Q?K0dbw32rnkZ3WL8F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SZMGnMFYlTdZawvN4u6HvLqQVu2/QnTKi6ZRyCAVsAAfpQU3bKGSg1g0R9?=
 =?iso-8859-1?Q?hWtv8h7Wdzj3zmkxd06KgrVrxEjPeXGWegMkwWXkG0RMVyGt+a4PL6f2Yd?=
 =?iso-8859-1?Q?fNB13Vt9wsEKVI+2YgHkpJvnWiwyc5trzL5NTLI7dPJ9dfFnIs0i3lKCGZ?=
 =?iso-8859-1?Q?bQPxYWl3YjUm4FfnuDW+7whBckXplaPKVGeMAt0F1xEG2iwq6mXqki/S3X?=
 =?iso-8859-1?Q?KC79dhq08inB+i511z6p/JQ1LOKS8pBeDtwB7NZ/JR3EZ593qrx/1YASNz?=
 =?iso-8859-1?Q?8Lg2En81GBlZ4xXZKxJvrwY1RnOC2XpVjm5kabNGriWJ5eucpHYwRQEKYU?=
 =?iso-8859-1?Q?ZVmlYzV7V9bVyDFFHH2kEDx5sOptpamzf4nVoPn0jP6PzeYMZBOFO1HEzu?=
 =?iso-8859-1?Q?0rgs90oVSpD0D35uLot7Bm2XJzFNk5RMBTc5ioe0bGXXO1BE70VKcHYRPC?=
 =?iso-8859-1?Q?ajbuiHGpp4s0Q3xLZQVJtONS4i8L12o8X6fPpGaVEmt/ae9LLpb+wnMv16?=
 =?iso-8859-1?Q?tJoaEWcP1ZVPBtEWNMhL7okIIG1PjbPdIfuCX0NiNPIgJbn8KhI+umlK9J?=
 =?iso-8859-1?Q?3Q0BVSPn+HmOSJKsOPBMYTiW0EEdZ5rjPYsB/SRm+U6RuRu67WFLN163QG?=
 =?iso-8859-1?Q?iTKVVaYWwOne2MfLKqAiPwTPIYJxAB138nIZ2GKuovzBO75Lg7LFLDn9iK?=
 =?iso-8859-1?Q?zguwKrsDRKfv14qc/nLb20N1VvYFYBy+mAT38I+cSPjWnr1P0QHxiOXSbd?=
 =?iso-8859-1?Q?CPBjzUY7uB7otUflSnNzqAg0maSnKnd+obqadGpgWhi+Xeaglh1EnKVGz6?=
 =?iso-8859-1?Q?X4r1I0wQTdoBHoATWQStqQl1KuGcnZLDSrz0UHMj9Ra61xVzLnikdINgqG?=
 =?iso-8859-1?Q?sX1HY8WlMbiPzaHi4lP0M7uXMOqdyjFdgAMyRwiu8RzewgfP92mC/5OT4C?=
 =?iso-8859-1?Q?/dveYI+ivyusUBhfmiIbRZl4+EXCg0r1yiQog26acSClMc3bjbb+wYIEwy?=
 =?iso-8859-1?Q?pDH/R37puUBtoY2GFdy0uLDOz+WGF1CGRJ3ClNnMhaSYYrW5+jhfJVJGnO?=
 =?iso-8859-1?Q?+XLCXiQK0lcypkGzBi8exSL4DqbNPbLA2SW6cMWE7jopSqrPKfxj+B6W3r?=
 =?iso-8859-1?Q?zsVZiBIvED7zFv/smvFoKcqR3wjtF+lE/so9FF24cUtnIlH2sV25xVYAL1?=
 =?iso-8859-1?Q?CBsXZkOkbC/Joz4FGgw64jPGnP5vRi779seQUuPFNqw/13WfDkhCW8YOqS?=
 =?iso-8859-1?Q?bG5qDPo9lAUUuPEw5OY25gEMzinRfNUUQ6OK0Bvvqvdb/4lr0NNej4gopG?=
 =?iso-8859-1?Q?F7LLcUtogpgqTgjYyWqKW3gkYA5udCWpYk7f2vAXrgZhRs0GCBQYhI+KqE?=
 =?iso-8859-1?Q?nQMpYRvGHopD0BFEAN4AZjhsIdj/pmFBhuYP73Vaj2MsgEzJTenbdwqc47?=
 =?iso-8859-1?Q?PtDAsK6wPaN7ClMaehf7gvCNp9GBGnGzCHO4bYWPmbuWK/e38YtUpVKdXV?=
 =?iso-8859-1?Q?/xXvnel8lGRX7PlFDtNRvA+oKCTAKmx0Hxt6nQMoa7eTI2/X1euUy97Sh4?=
 =?iso-8859-1?Q?XnMZHUHA2GFg1UwS3M/xIJRToa7b6QDMYbz69H8eaRyG5Ht+jxX5VIRjEe?=
 =?iso-8859-1?Q?EqmcVxwL8IBrrYKfMymEO6Gz/qzObMH97mfI3ctOwlwKIZg2darXniEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaa0f15-6fd0-4253-d1a5-08dde3a5c9c7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 07:05:35.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbPuxI0M9qNFStsB6Xpp/dZB9ct+HYhHrZA7IE4aDO0h2u/y60Lp6D5XX/pdN883OOCXRxJCnMOY5i4slzpurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 11.0% regression of netperf.Throughput_Mbps on:


commit: bf31671edffe7ea925baa93caff59a860f1ddfa8 ("mm: memcg: make stats flushing threshold per-memcg")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	send_size: 10K
	test: SCTP_STREAM_MANY
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508251443.3f803480-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250825/202508251443.3f803480-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/200%/debian-12-x86_64-20240206.cgz/300s/10K/lkp-gnr-2sp3/SCTP_STREAM_MANY/netperf

commit: 
  69642f5099 ("mm: memcg: move vmstats structs definition above flushing code")
  bf31671edf ("mm: memcg: make stats flushing threshold per-memcg")

69642f5099423baf bf31671edffe7ea925baa93caff 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  85772547 ±  4%     -10.4%   76821561        cpuidle..usage
    135.00 ±  9%     -16.8%     112.33 ±  8%  perf-c2c.HITM.remote
      7.04 ± 81%     -83.3%       1.18 ±177%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.kthread.ret_from_fork
    521963 ±  4%     -11.2%     463279        vmstat.system.cs
    309897 ±  3%     -10.7%     276864        vmstat.system.in
      1.65 ±  5%      -0.2        1.42 ±  2%  mpstat.cpu.all.soft%
      5.69 ±  5%      -0.7        4.96        mpstat.cpu.all.sys%
      9.42 ±  4%     -12.8%       8.21 ±  5%  mpstat.max_utilization_pct
    302723 ± 10%     -19.0%     245225 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
    266650 ± 14%     -26.2%     196867 ± 18%  sched_debug.cfs_rq:/.spread0.max
    305935 ±  4%     -11.2%     271568        sched_debug.cpu.nr_switches.avg
 4.854e+08 ±  4%     -11.0%  4.318e+08        proc-vmstat.numa_hit
 4.851e+08 ±  4%     -11.0%  4.315e+08        proc-vmstat.numa_local
 2.726e+09 ±  4%     -11.1%  2.424e+09        proc-vmstat.pgalloc_normal
 2.726e+09 ±  4%     -11.1%  2.424e+09        proc-vmstat.pgfree
   4.9e+09 ±  4%     -10.3%  4.394e+09        perf-stat.i.branch-instructions
  19860290 ±  8%     -11.5%   17582329        perf-stat.i.branch-misses
  13095483 ±  4%     -10.0%   11784812 ±  3%  perf-stat.i.cache-misses
 7.297e+08 ±  4%     -10.4%   6.54e+08        perf-stat.i.cache-references
    527531 ±  4%     -11.2%     468461        perf-stat.i.context-switches
 8.112e+10 ±  5%     -11.7%  7.163e+10        perf-stat.i.cpu-cycles
 2.417e+10 ±  4%     -10.5%  2.164e+10        perf-stat.i.instructions
      2.06 ±  4%     -11.3%       1.83        perf-stat.i.metric.K/sec
    202.69 ±  4%     -11.0%     180.30        netperf.ThroughputBoth_Mbps
    103778 ±  4%     -11.0%      92315        netperf.ThroughputBoth_total_Mbps
    202.69 ±  4%     -11.0%     180.30        netperf.Throughput_Mbps
    103778 ±  4%     -11.0%      92315        netperf.Throughput_total_Mbps
     23850 ±  2%      -6.9%      22200        netperf.time.involuntary_context_switches
      1145 ±  5%     -12.0%       1008        netperf.time.percent_of_cpu_this_job_got
      3443 ±  5%     -12.0%       3031        netperf.time.system_time
  11648832 ±  3%      -9.8%   10509763        netperf.time.voluntary_context_switches
   3.8e+08 ±  4%     -11.0%  3.381e+08        netperf.workload
     20.64            -0.7       19.94        perf-profile.calltrace.cycles-pp.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv
     17.64            -0.5       17.19        perf-profile.calltrace.cycles-pp.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_backlog_rcv
      1.98 ±  3%      -0.4        1.57 ± 19%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_pages.kmalloc_large_node
      1.14 ± 22%      -0.3        0.86 ±  8%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.kmalloc_large_node
     48.45            -0.2       48.21        perf-profile.calltrace.cycles-pp.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
     49.16            -0.2       48.93        perf-profile.calltrace.cycles-pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.92 ±  2%      -0.2        2.71 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page.skb_release_data.kfree_skb_reason.sctp_recvmsg.inet_recvmsg
      2.84 ±  2%      -0.2        2.63 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page_commit.free_unref_page.skb_release_data.kfree_skb_reason.sctp_recvmsg
      2.71 ±  2%      -0.2        2.51 ±  2%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page_commit.free_unref_page.skb_release_data.kfree_skb_reason
      9.25            -0.2        9.06        perf-profile.calltrace.cycles-pp.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
      8.87            -0.2        8.69        perf-profile.calltrace.cycles-pp.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm
      8.60            -0.2        8.42        perf-profile.calltrace.cycles-pp.memcpy_erms.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter
      4.86            -0.1        4.71        perf-profile.calltrace.cycles-pp.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg
      4.75            -0.1        4.61        perf-profile.calltrace.cycles-pp._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg
      4.19            -0.1        4.08        perf-profile.calltrace.cycles-pp.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc
      3.61            -0.1        3.50        perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty
      3.62            -0.1        3.51        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user
      3.58            -0.1        3.48        perf-profile.calltrace.cycles-pp.kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb._sctp_make_chunk
      0.64            -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.66            -0.1        0.60 ±  3%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      1.30            +0.1        1.40        perf-profile.calltrace.cycles-pp.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.sock_recvmsg.____sys_recvmsg
      1.56            +0.2        1.76 ±  5%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg
      1.58            +0.2        1.77 ±  4%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.sctp_sendmsg_to_asoc.sctp_sendmsg.____sys_sendmsg.___sys_sendmsg
      0.58 ±  2%      +0.2        0.83 ±  6%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_put
      3.48            +0.3        3.76 ±  3%  perf-profile.calltrace.cycles-pp.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_backlog_rcv
      1.64            +0.3        1.98        perf-profile.calltrace.cycles-pp.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_outq_sack
      1.74            +0.3        2.07        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter
      8.18            +0.5        8.65        perf-profile.calltrace.cycles-pp.kfree_skb_reason.sctp_recvmsg.inet_recvmsg.sock_recvmsg.____sys_recvmsg
      0.88 ±  2%      +0.5        1.41 ±  4%  perf-profile.calltrace.cycles-pp.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.sctp_sendmsg_to_asoc.sctp_sendmsg
      0.93 ±  2%      +0.8        1.74 ±  5%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.skb_release_head_state.kfree_skb_reason.sctp_recvmsg.inet_recvmsg
      1.55            +0.8        2.38 ±  4%  perf-profile.calltrace.cycles-pp.skb_release_head_state.kfree_skb_reason.sctp_recvmsg.inet_recvmsg.sock_recvmsg
      0.00            +0.9        0.88 ±  5%  perf-profile.calltrace.cycles-pp.__mod_memcg_state.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.sctp_sendmsg_to_asoc
      0.00            +1.2        1.22 ±  5%  perf-profile.calltrace.cycles-pp.__mod_memcg_state.mem_cgroup_uncharge_skmem.__sk_mem_reduce_allocated.skb_release_head_state.kfree_skb_reason
      0.00            +1.3        1.28 ±  5%  perf-profile.calltrace.cycles-pp.mem_cgroup_uncharge_skmem.__sk_mem_reduce_allocated.skb_release_head_state.kfree_skb_reason.sctp_recvmsg
     30.64            -0.6       30.00        perf-profile.children.cycles-pp.sctp_packet_transmit
     32.46            -0.6       31.87        perf-profile.children.cycles-pp.sctp_outq_flush
     48.58            -0.2       48.34        perf-profile.children.cycles-pp.sctp_sendmsg
     49.18            -0.2       48.94        perf-profile.children.cycles-pp.____sys_sendmsg
      9.26            -0.2        9.07        perf-profile.children.cycles-pp.sctp_datamsg_from_user
      9.00            -0.2        8.82        perf-profile.children.cycles-pp.memcpy_erms
      9.53            -0.2        9.36        perf-profile.children.cycles-pp.sctp_packet_pack
      5.01            -0.2        4.86        perf-profile.children.cycles-pp._sctp_make_chunk
      4.87            -0.1        4.72        perf-profile.children.cycles-pp.sctp_make_datafrag_empty
      0.52 ±  2%      -0.1        0.46 ±  4%  perf-profile.children.cycles-pp.drain_stock
      0.51 ±  3%      -0.1        0.45 ±  4%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.66 ±  2%      -0.1        0.60 ±  4%  perf-profile.children.cycles-pp.refill_stock
      0.66            -0.1        0.61 ±  3%  perf-profile.children.cycles-pp.schedule_idle
      0.45            -0.0        0.40 ±  4%  perf-profile.children.cycles-pp.psi_group_change
      0.57 ±  2%      -0.0        0.53        perf-profile.children.cycles-pp.__free_one_page
      0.35 ±  2%      -0.0        0.31 ±  4%  perf-profile.children.cycles-pp.psi_task_switch
      0.71 ±  2%      -0.0        0.68        perf-profile.children.cycles-pp.__skb_clone
      0.09 ±  5%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.finish_task_switch
      0.06 ± 11%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.netif_rx
      0.10 ±  5%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.arch_local_irq_enable
      0.82            +0.0        0.85 ±  2%  perf-profile.children.cycles-pp.ipv4_dst_check
      2.63            +0.1        2.69        perf-profile.children.cycles-pp.sctp_outq_flush_data
      1.31            +0.1        1.41        perf-profile.children.cycles-pp.sctp_ulpevent_free
      2.53            +0.3        2.87 ±  5%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
      2.55            +0.3        2.89 ±  5%  perf-profile.children.cycles-pp.__sk_mem_schedule
      1.76            +0.4        2.11        perf-profile.children.cycles-pp.sctp_wfree
      8.19            +0.5        8.66        perf-profile.children.cycles-pp.kfree_skb_reason
      1.63            +0.7        2.36 ±  5%  perf-profile.children.cycles-pp.mem_cgroup_charge_skmem
      1.72            +1.2        2.90 ±  4%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      3.62            +1.2        4.81 ±  2%  perf-profile.children.cycles-pp.skb_release_head_state
      0.75            +1.2        1.99 ±  5%  perf-profile.children.cycles-pp.mem_cgroup_uncharge_skmem
      1.30            +2.0        3.28 ±  5%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.84 ±  2%      -0.4        0.46 ±  5%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
      8.91            -0.2        8.73        perf-profile.self.cycles-pp.memcpy_erms
      0.42 ±  3%      -0.1        0.35 ±  4%  perf-profile.self.cycles-pp.page_counter_uncharge
      1.75            -0.1        1.69        perf-profile.self.cycles-pp.get_page_from_freelist
      0.44 ±  2%      -0.0        0.40 ±  3%  perf-profile.self.cycles-pp.psi_group_change
      0.16 ±  5%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.48            -0.0        0.45        perf-profile.self.cycles-pp.__free_one_page
      0.46            -0.0        0.43 ±  3%  perf-profile.self.cycles-pp.sctp_chunkify
      0.23 ±  3%      -0.0        0.21 ±  4%  perf-profile.self.cycles-pp.sctp_inq_pop
      0.81            +0.0        0.84 ±  2%  perf-profile.self.cycles-pp.ipv4_dst_check
      0.25 ±  3%      +0.0        0.30 ±  4%  perf-profile.self.cycles-pp.sctp_chunk_put
      1.22            +2.0        3.20 ±  5%  perf-profile.self.cycles-pp.__mod_memcg_state




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


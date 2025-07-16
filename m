Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F98634A
	for <oe-lkp@lists.linux.dev>; Wed, 16 Jul 2025 06:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646228; cv=fail; b=iH3dLrjdilC0xMXWDIpPERhO0+225p/iUqbQjCwLjU3oc6FVMBEOk24LeTIkYpt7ybJyiKRogQB0Gxq4FLKiQEARc20Xb44qYF6cGc2BZSAJzTYZC7+7YCDTKDhjHa6Q5d2gl8hAmvusuW3m1GTjxAL94b/N8q+aPty5n9w+rvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646228; c=relaxed/simple;
	bh=kH8qO7+WNgWguM52lw9XV+IBbmgfFDye5UvetVIk+54=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PMY/8HfQenyNVGn4VdUY6EHc2vCWUzprgxMzf1qpEkI1z+mSCwd5VHV5b7gst0HiU1Zx6ML04QmDjGdHRjvLCrcFLfLNVkBnBeFadePkxFJVNzhxhyYAS8YEZQ7GsQTu5650R0/7kC51Bli4PWPwV2RIWz0dwQlW24Q2cJyx2fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD4NdEeh; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD4NdEeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752646225; x=1784182225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kH8qO7+WNgWguM52lw9XV+IBbmgfFDye5UvetVIk+54=;
  b=bD4NdEehsRRjZlbiU66qacRawVMvaAGqS0p33/5VvcaO09eYbv4P5gvy
   YA+Pu/jFP/Z/vvwEajhyrNkVHLkiCrbTCVPsejTo2Knkql+OMGyckM4Jh
   A7aBY86GMXDLcYsn8ps4ZKiU/PGPf2NgNHtPzuqJCAG8xwEiUUsI3PcrW
   fwLdXNH3LsrpnXaWUSYmWwF2HnYLpUg8aiOipySBaWUuL4Q0XlmM14fIi
   OIv7z6I4Kl8tAQb/CpQCeh88mCZ+tEA8/00MotlB0vVJpjxRgORkRxWyv
   g41OFaml4RgbTcb9FadgcDrjLHhhQlETUJ1euv9BvXxSU1L3K2UHTcwi+
   A==;
X-CSE-ConnectionGUID: uRWg5/kfThS5sNGHM1yPJA==
X-CSE-MsgGUID: 0iaWh3JbQlitPYdNWsBKqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54817194"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="54817194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:10:25 -0700
X-CSE-ConnectionGUID: 98tgQGfDRQu/7pYntYLFJg==
X-CSE-MsgGUID: qKgjiaJ2TL+oiy2ul2EC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161726037"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:10:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 23:10:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 23:10:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 23:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNypRpDnD2Ui98C1zj6rlUl0LdhFdLyORPmWz1AE/xIXtkbOrXKySQM0v4dfq8M8WSP4ETTU59z+Yi8CE1Iyr+QdatJNqaOjyJHOn2G3Qw0cOTYneEVD5BGZ6SEgOECLXTDW70I9YOEpL9wFfuKV+OuMZ/p3q2lzQdjt839KJjuXYVKQsdRqXO1QyZjZQXtv3SMjEv0aeF0t5jhEqdj2XmAoSHy9GWL2xZGF01D5XK0sLh+oQLjrY9k9yshfO2zkNWuGdWJnaQ5zwqPerjcFvCe5OXX7zIMMdB+iZnvAHwJgOZLa5b5yX3A52VLQNzgIu/mRCKiYGd0fe6Wxg41xOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQM7YtojdXg8u+Fob/uLS8eBUVjpeekEj1sW7rj+vp8=;
 b=wHNZpb/RgxlAmIA0ZIVkHtf8JfyDOklmM6tDt70g6y8gFY7z9CWqw/oLx9xmnJge3YX5SvZsGKWYrLntZzID5F8vqCwpyG9F1TAO2wIhpIdtKu0lr73R96oNLxhm20jA9QFrrN3iV5pFyPemLnXZGfkFwJDNw1xt9PgcsMV0W25cF8YKJzgJyNzYDMKShcF+F4kg0hKm4unr5pv5XNlPCT/VF4biX93fGA1xmTCjPDSYH4QedyHDeh5j6t0eUJFE7E2wDqqA9DiQYe4TPeIkP3Jc7hP0o3tjjYCWQBVEb0c7vvaJX7fGBLJO/kLFOrC1eCiAEp6Vk1ypmjt5sJEVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 06:10:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8901.018; Wed, 16 Jul 2025
 06:10:15 +0000
Date: Wed, 16 Jul 2025 14:10:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steev Klimaszewski <steev@kali.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [steev:lenovo-x13s-6.16.0-rc5] [linux6.15.y] e9c2688b12:
 WARNING:possible_recursive_locking_detected
Message-ID: <202507160735.72c4502b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0243.apcprd06.prod.outlook.com
 (2603:1096:4:ac::27) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 50275832-244a-4487-ffaf-08ddc42f6e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TRvsgROwvGzyEzVUlB7dMp7y7PPd+uZIglYDJRCiV3+IvQB20GMG12u1Q7v8?=
 =?us-ascii?Q?wxmgWtvD4kNhlgPZmpSBM2pNK+xgQa0XGM2/8+eXPyRmBH+DO+elHxq3qN94?=
 =?us-ascii?Q?Q7w+jyaJ7vXIuYUXSg0D9Wbq63wUKTGb74kcU1oNQDoDf1ocIgq8uVu2fyQD?=
 =?us-ascii?Q?mJcwskEpVRurs9kIYuFexIjFfNqMOrmpErjDEd0clrDicB/Umd+P8HuLtMax?=
 =?us-ascii?Q?w8hIG9q8wzOm1P/8MueVejSW95xIwzunNWIR6eN6RtXdFWzt2utmuvmsXXIB?=
 =?us-ascii?Q?5lec70wJ2iHLGaK2MP6c6LY+ExNluTsMfIOCux8LJSeKCLY1NRHvWKUAfTlg?=
 =?us-ascii?Q?IcSYS8PQkHN0kzOWav/Vhs9tm5Ld0vNZG96/Ah+57RbCn0neYSe0ajc5Qvoa?=
 =?us-ascii?Q?H7FDlIBtm2GKIowrVY9qtu+iwFnzEXs89zkuDWleYtoTH0ywORF0t6ZM/6aw?=
 =?us-ascii?Q?LNxLXWcI3FEW88uuNsDhmvvmlPJt+xwWJ1ZJVsi5jUQXQAby6xZWfCKj68Je?=
 =?us-ascii?Q?4FA2PPfVcyXdbd7XFJ9nVUeewLph9vFllA78u/zjrCpeaChWGNHID5kNke7B?=
 =?us-ascii?Q?Hts4OMh9muhy68eITMz85+pXMnC84Nwz6LBgufbfZf9qD7gcI1R2RfJgB4jQ?=
 =?us-ascii?Q?Zk+se+zvRu0fS/obE3xiHe6Nd2lblE2Agv7bKlf991E7JJJ7btFku0fk10dh?=
 =?us-ascii?Q?LPl2e/nPoF0Wiu5KEoOv79LqwdFxdLGNcoKOt5i8FGKzfgam8OQoeg6JirIJ?=
 =?us-ascii?Q?TzxC3Xi+d05ITgKWuDlc+rDrfgBA1h57NTmUSPnpj7FHKs2/Roam7wthCfeh?=
 =?us-ascii?Q?SYXYIystK3wucN6aA0UXDAUaUUMUPk/UFwUhNJb2IEenQAbxiXDCnpyus469?=
 =?us-ascii?Q?XiEA8mWluwPf7EKL/IlOLyEriF8wsMPDXFwGxC+Cgri+w7KOqFCpyA4QrOoq?=
 =?us-ascii?Q?mqcB3Qwg7DSbEqrUFJR0mil1UYT8p3B9y3P11cKyDdBUw8xOpp0py+sknhhu?=
 =?us-ascii?Q?U4tNIh2HSZGf7eE8ImQTJC6ZnStiR+gSdf3uLLGp/43P+TzGQ1KTVeV3h9NJ?=
 =?us-ascii?Q?m7PccVMeiLh7Hg8MfwyPhZAJPhp/qiY1hVNNUJCYqT4iYOkScrukOF0p9eDU?=
 =?us-ascii?Q?m88k7zn5eNgJ7YZXUhFBy9ImDTAARofcF2C+KFs6eVkAajHs6nbOmENm7lEU?=
 =?us-ascii?Q?TkhK8WuYGdO42zfCIi8ck1777KO7k7L4rZG/nRknJcPB+xs81eyIA9hfUQsq?=
 =?us-ascii?Q?dqzWGpLbR8VxjOLyHVA4Lzr6yO0RTO1xpjKs03MjP7HpnPtw8vzOZokjNHMW?=
 =?us-ascii?Q?UeVs4/xe0g+Wjj+Ux5WVsjAUB+yz52ZqyvYGpBG5bUvgHg5Z2dBt5wZYkjTr?=
 =?us-ascii?Q?Fa4Ih62bskNuEuyskIwCy0yGxXSu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5K6hWpDYUN9+PXu6aSRlS09muTKQ3uw+EJQvre7O5G8LZR1mkJle5zOGE1kt?=
 =?us-ascii?Q?1mc6cYyvzsgC7zgD2cwJQVVyEMHTGhhmMqf4cfGPKfUtsDYkmZFfuU9tfJ+s?=
 =?us-ascii?Q?ergod49sNlWf/W4sOkZhsAG+vJS8tfRScF23Iq9aukJVYwUbi3u+GrqeEotY?=
 =?us-ascii?Q?EDXBRBGPfBZF3mHtGMwMpCS9doi9M+ut/nuh1DpzVyLNeLcveOg69g013xVO?=
 =?us-ascii?Q?KJ2VtN/CSHe5NGDLJoSOl/U4LdsCTeI6L6/Z40JlezDZlDUmhJ/JRdUYRzr+?=
 =?us-ascii?Q?cN3uI/Oy9F9aT+yhceJjxc4BaV20gXASbn5BDImI+EnPgrjCop83NrkYbjSp?=
 =?us-ascii?Q?rWgVeZK3vYzViCqXglhCdbnYqj5RAcgF6Oyp0muvjX4Hy3AD5BfEmPx7X+nw?=
 =?us-ascii?Q?0td+6t31HWvNG2Knj0t+KBEC9LhLf5LiPrgnpt8iHq95D+cRcAaoZ2vEfGg3?=
 =?us-ascii?Q?oV+9btwu8GJU/iiGk8gNzo+oxTItXwaAx5qBc6jdnU4j9zCSgwPLlnwxSwRB?=
 =?us-ascii?Q?+ikvvcI9omF4CEYOoOrnbLr7o9/J/8NA9X3PP4u8g25pZ3KUHjwp4t8JNlB2?=
 =?us-ascii?Q?ZUQoZPPSWw4MZOhwH3/e1QTGgPuqpCzK9O/CaftsP1g+If5N7Zs3ROcGVal6?=
 =?us-ascii?Q?za1puv3FJ76khv9EeUg/yQDDzsGJs+wwlpd1M+XIyGLEy+1J2GxGwDLJHexh?=
 =?us-ascii?Q?EcOgt85ZiE3ug+NBXErV/YrN8G90MaHClbhnogcLCnA1rSwsF2Z0xF+t6xel?=
 =?us-ascii?Q?cW3j1PvOcuXxo/9K1IqQPBwFvbmI/s6kkZ0QSEYyqcKJ5bLb87wLvHYuk2RG?=
 =?us-ascii?Q?BuDN5CvvN9f5qvd1j4l7PnY5poa0O4xVYpdc/LXxNdj4TLrnpJQu1rvoFQ6b?=
 =?us-ascii?Q?Z5HK8bsTyfTzSYkGOLAhOoXjs6mvPt7k+Cny5fso5sQ9sVz+cec80dYU2a33?=
 =?us-ascii?Q?Tn2lncyCdZB+gP/TB7G/jDKbMPfP2GZtbTVfbfqFBannKi2WtI0KB5kL9dcT?=
 =?us-ascii?Q?RmGFBE8T5Gxs8LXX28GOw16+uJt0xj501rjlAV+o5fgIcrk7fl3HR1/h2anr?=
 =?us-ascii?Q?17hAqKP1aIscNdZ+iNgGL0k0ph4zd+nUSoQfbFDfYEjROwU+xqbOi38PGU4C?=
 =?us-ascii?Q?MUrNGkxy9qnTahqgEn/mGleVJRjDqWAbAVAcRUZxymGGl+VspnjOqaUo79nc?=
 =?us-ascii?Q?IfZbr1X/7LNqxSk6/1hQOYbKG/X861dz9HDT+dy4TylSvcm/+VhTfwWyOjc9?=
 =?us-ascii?Q?M1AeJDbH3dFtDLR3gdyhS4B8f8W4jYeXZ/FTT11ujzAyuuSPewz4pznNIaQF?=
 =?us-ascii?Q?TeatJiRtIjrfu9kXgQVW5ocYEF9vXF7oJgx2plB4asJZRf99skQM1RHi8jEf?=
 =?us-ascii?Q?H+R0Al/11w+bgXHSYHJa7uXOytU+DXG5O2JOo3VtI722CCBHXWcB2+pCq3AV?=
 =?us-ascii?Q?i0UZcfucxJDYxnMgad/x1cPk1JKkiRFFQkukbTeeL/uFt4BJVsH0QMagu5IH?=
 =?us-ascii?Q?CBhjdbyHnZUPai6VtO2Jd9OJcOZ2eHCc6wsw+AnzkAg88iRsIFNtPZKYeKH3?=
 =?us-ascii?Q?QzO9eennz60eatqOQS3IeDIM6UDBKv4XYtDMmupvKRQ0bYRf/UDxI3m6UDS3?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50275832-244a-4487-ffaf-08ddc42f6e9e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 06:10:15.6832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F7V9mtO4B8XgxKmK+UaVlpBYtEYlFiMciFbUnf2zLc1RiCsSL6NXhqn3oAnejeARibb8YXsUpdsN5bH33dj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: e9c2688b128a46792eb108d001cd0e56b247cf27 ("linux6.15.y-bore5.9.6")
https://github.com/steev/linux lenovo-x13s-6.16.0-rc5

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 600s



config: x86_64-randconfig-r111-20250712
compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507160735.72c4502b-lkp@intel.com


[   12.932716][    T1] WARNING: possible recursive locking detected
[   12.933071][    T1] 6.16.0-rc5-00115-ge9c2688b128a #1 Not tainted
[   12.933429][    T1] --------------------------------------------
[   12.933782][    T1] systemd/1 is trying to acquire lock:
[ 12.934096][ T1] ffff9adac0328130 (&p->se.child_burst.lock){+.+.}-{3:3}, at: update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[   12.934756][    T1]
[   12.934756][    T1] but task is already holding lock:
[ 12.935175][ T1] ffffffff9061f3f0 (&p->se.child_burst.lock){+.+.}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:168 kernel/sched/bore.c:266 kernel/sched/bore.c:312) 
[   12.935747][    T1]
[   12.935747][    T1] other info that might help us debug this:
[   12.936214][    T1]  Possible unsafe locking scenario:
[   12.936214][    T1]
[   12.936638][    T1]        CPU0
[   12.936829][    T1]        ----
[   12.937020][    T1]   lock(&p->se.child_burst.lock);
[   12.937313][    T1]   lock(&p->se.child_burst.lock);
[   12.937607][    T1]
[   12.937607][    T1]  *** DEADLOCK ***
[   12.937607][    T1]
[   12.938066][    T1]  May be due to missing lock nesting notation
[   12.938066][    T1]
[   12.950833][    T1] 3 locks held by systemd/1:
[ 12.951242][ T1] #0: ffffffff90ac9c20 (cgroup_threadgroup_rwsem){++++}-{0:0}, at: cgroup_can_fork (kernel/cgroup/cgroup.c:6671) 
[ 12.952118][ T1] #1: ffffffff906080d8 (tasklist_lock){.+.+}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:311) 
[ 12.952919][ T1] #2: ffffffff9061f3f0 (&p->se.child_burst.lock){+.+.}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:168 kernel/sched/bore.c:266 kernel/sched/bore.c:312) 
[   12.953794][    T1]
[   12.953794][    T1] stack backtrace:
[   12.954284][    T1] CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.16.0-rc5-00115-ge9c2688b128a #1 PREEMPT(full)
[   12.954289][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   12.954291][    T1] Call Trace:
[   12.954295][    T1]  <TASK>
[ 12.954298][ T1] dump_stack_lvl (lib/dump_stack.c:123) 
[ 12.955284][ T1] print_deadlock_bug (kernel/locking/lockdep.c:3047) 
[ 12.955291][ T1] validate_chain (kernel/locking/lockdep.c:3901) 
[ 12.955295][ T1] __lock_acquire (kernel/locking/lockdep.c:5240) 
[ 12.955299][ T1] ? print_bad_irq_dependency (kernel/locking/lockdep.c:2600) 
[ 12.955303][ T1] lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873) 
[ 12.955306][ T1] ? update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 12.955312][ T1] ? lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873) 
[ 12.955316][ T1] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 12.955320][ T1] ? update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 12.955324][ T1] update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 12.955329][ T1] sched_clone_bore (kernel/sched/bore.c:267 kernel/sched/bore.c:312) 
[ 12.955334][ T1] copy_process (kernel/fork.c:2321) 
[ 12.955341][ T1] kernel_clone (include/linux/random.h:26 kernel/fork.c:2606) 
[ 12.955344][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 12.955347][ T1] ? local_clock_noinstr (kernel/sched/clock.c:301) 
[ 12.955350][ T1] ? local_clock (arch/x86/include/asm/preempt.h:95 kernel/sched/clock.c:316) 
[ 12.955352][ T1] ? __lock_release+0x12c/0x240 
[ 12.955356][ T1] ? trace_preempt_on (include/trace/events/preemptirq.h:53 kernel/trace/trace_preemptirq.c:120) 
[ 12.955363][ T1] __do_compat_sys_ia32_clone (arch/x86/kernel/sys_ia32.c:254) 
[ 12.955371][ T1] do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172) 
[ 12.955379][ T1] ? trace_irq_disable+0x25/0xc0 
[ 12.955382][ T1] ? do_int80_emulation (include/linux/entry-common.h:119 arch/x86/entry/syscall_32.c:145) 
[ 12.955386][ T1] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[   12.955390][    T1] RIP: 0023:0xf7f1e092
[ 12.955395][ T1] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   12.955398][    T1] RSP: 002b:00000000ffddbf1c EFLAGS: 00200282 ORIG_RAX: 0000000000000078
[   12.955401][    T1] RAX: ffffffffffffffda RBX: 0000000001200011 RCX: 0000000000000000
[   12.955403][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000f72808a8
[   12.955405][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   12.955406][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   12.955407][    T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   12.955412][    T1]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250716/202507160735.72c4502b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


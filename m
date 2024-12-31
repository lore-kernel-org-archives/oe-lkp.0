Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664010F1
	for <oe-lkp@lists.linux.dev>; Tue, 31 Dec 2024 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634902; cv=fail; b=YiM3ng7JnmxvEGMTSNlX5hpaDoDBS/pnDb9Bwz+NrStKmoHPHznc/yhQbgurg9szMPH9d/3uG6/FQAXq086NO8eYK+AR/QoTyvuPFlYGOhS2ktfOdzbPtwODoqV/Bfdjoerh5RG/Zs3hZ6Q5tzBwmMwkeKjABuYK2kDXzykBCks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634902; c=relaxed/simple;
	bh=LjZAuTCerNghhoc9DtUVdZeFlw9+oo1YfXOhNPS4o5g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hoGyQLqLclS+J2/qyBSZcwZkv1OcUZQAtDg9BVOPfpip5w6n+V9btpWYdp0YZzkaQ12bB46t3XOOR7xzBCaSuGckdydlzHGdQzRcqKjhMgfSlWoN8CBeCRu9w3jr9p0fFu03LvOR4+xs6EMEwjscKU3m9z8ce9lkxmgfsI65rI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGTDvQR1; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGTDvQR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735634900; x=1767170900;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=LjZAuTCerNghhoc9DtUVdZeFlw9+oo1YfXOhNPS4o5g=;
  b=oGTDvQR13dfRyTOPOynPl4ktUkFH5r1KQDt9YJbT+snCTX/oQUxpk8a8
   GNN5oyBy8rv1NfgN2l/C4tpuQW1fw7mcr3eSr93+srUSdbWOMx09SBCbY
   nroQYH68NkuqdSmOuYxp36SW2pIVAEDZ+Iqnq1qUoZO6Q5i4ONgMvP4rS
   YeKrlv76sgK/3+tIM3EblzOyh+8DtAmklWfJEAUWGNxaqTGV51an+aKQQ
   Rhmu9DqWbBD2y++yniOBVIgz+Lhc5sgFtW57jqU82lDp4m98gug8mKWP5
   XZqdRlD2SaWYj154s3YFZVQmyqyMaBnPcv0usBZ0CJv6VzIDWchmpYtHN
   Q==;
X-CSE-ConnectionGUID: GXl8Xcc+Tpy9kJd/MbJ4Fw==
X-CSE-MsgGUID: Urc03baXSy6Zhhg8nCUSYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46503950"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="46503950"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:48:18 -0800
X-CSE-ConnectionGUID: Agxror1/S8GN43rlW1ufkg==
X-CSE-MsgGUID: KV6YlPj5R6Kh9cRHqPfRxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100838298"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Dec 2024 00:48:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 31 Dec 2024 00:48:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 31 Dec 2024 00:48:17 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 31 Dec 2024 00:48:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEdfYuGk2mypHxjEspoxwNjkezALQtV5/DCoM4ixoOuA1Q3LSWxJrhu6E3BPA8j0ChTbCBHbgctpNRw2lVmZexPo/I9zvcRn5z2xSAGP4WB20PgYYHqf05LkdTKe1FqwvsB2ZT9kJN3RZGIUNdeEF/yIKsjT6e4AyeeNCG/HsiZyEPCLk4m7eOrQCv5cm73KSF//hjW1gwwAnkaZW7WjggcbFnCQUPgEPe7nDaR3k5xZPMNCNbZBhynOOTX9BEzQwkuiwZa0AmJXpRkZ3UbDurQZplCekiO6ruZ0Nz6qAVOMCaeO+XhXm03svKWm/daB9QCkIhPbBkJ7B8OKIlKytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB8cOzuaKB+cudEF9tZHVxV+kkxkrdj4pZ5bBUb6GXU=;
 b=Zx2+sMRxmUzUMone9l6t3Et9j+KXikF78yGc3VhyUcG1PiIC/tbSQ9w9J7l+ydihbrS4JEp8xraEHiYBLLUAB3f6CfliYFOdMmQ6o6/VnmZHWFXuP7sc6GmzX4db6g8Yz6EpckNQnpOwnNAoCAXhY/Aye8N6iC+B8xBHxdDPGy/GtnSDOr3CLva2yT+er1y2zUnZM7ic2QxH8RlXClob0/xgNMiiYHwCHXvdy5D4fKGMgp3HDBQu1GkMj2TquLcaCW7CtoVLdHUxR5N8PiTxJVnEG3WYNYR2roe8qmMsxYGxg43YRTO/YutgYTWC6v/e5iZEUIvXeOqmkin0D9qzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 08:48:10 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%4]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 08:48:10 +0000
Date: Tue, 31 Dec 2024 16:47:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v6] [futex]  99b9906f6c:
 will-it-scale.per_thread_ops 97.8% regression
Message-ID: <202412311453.4232da5f-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbbc5bb-336e-4ac3-5dd8-08dd2977da8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ES3S7+5nOLVfsKV8WhTetlySqwSgKDlN7ZO4bI3tduk3jC8wqXMZcTw/zV?=
 =?iso-8859-1?Q?V028DM7roX0GL/SnO4S5lYETlCKI3KvurxEpQ1qRWpDBnfZVFLqnak6nAY?=
 =?iso-8859-1?Q?gJdgf010h/j/Jv8emvZCNRMo+LB/5InS/2dqpHs8rBv/fWBwOcb/hkgE0J?=
 =?iso-8859-1?Q?kNgCCAR9xw4ke+uaOh2VIIH/fViMJ6BHMfgn5F7wP4PUcWMlYHP9wSPgR1?=
 =?iso-8859-1?Q?5A6c4f0mrd7kz+4LEvN1P262RPvd+wwiLVGwBvVxnKlplVKhV7aFqH1fTY?=
 =?iso-8859-1?Q?FGpJVXa15mNLCeFpSzytgObrXsPg5NIn8SSdl22qjihwDVjis4DAbcgKRX?=
 =?iso-8859-1?Q?+1dLupx61vnRlXr9cdz3/6DE7vAjlV1M3p9vt7uKLZZS2ZkhG4jIlNjbTa?=
 =?iso-8859-1?Q?6e78e5hd3GTVlDVw4vhi2xAsSdjrAo/x5MYTxFW1hOgpaZFrTW8wfwFOPx?=
 =?iso-8859-1?Q?qv1PQ73ChecUtDAduC2CnG1OYYnKm6A1JDNwEJEXPh63G4PW9wrkJziqSn?=
 =?iso-8859-1?Q?jC9SZ/A9L41QRt7EPKnFG45U3/zDZtTjBqR5xNfiYxk3ofCWnxFu3NSQwf?=
 =?iso-8859-1?Q?1xK1EsZ7qJEUMg5725NlXfmSj/x1QHvnEVoM14Ki28vyMheDZaHMwM/hCW?=
 =?iso-8859-1?Q?ym2YKJUe4r5FhhMzH9dtbEoW/Whm2mg+R1zjtcWmoUZA3qj7SVU+F1UHEh?=
 =?iso-8859-1?Q?YjBlFoGSK+qEEvrpC6PxCLf3siJzb7uUrPZOXlINGuiX+QsPVhTA46Wvfo?=
 =?iso-8859-1?Q?hsuYrs+/cQx89DHGXLE8wW7+iP7Qxh9skXXN7A03yExDnDSJwsHvOKnLjz?=
 =?iso-8859-1?Q?OKS7f6ki+iR1n6L9uzh6lD0mu2vnuHkJUN8aGoVQMgNtCdr/T3Gw7vz1XA?=
 =?iso-8859-1?Q?f9y+rG7tfhXTJduE3Xh9MxFavy1tsiZ3Ao4qa2ahjzGdJs84BWEzToegQS?=
 =?iso-8859-1?Q?Rq6DzmkyarW6L4zLXxxuf+ArBbos5wfDHy0of97mknhn5VHh/EmxqvyEy+?=
 =?iso-8859-1?Q?tgNdrUCrjUg3xnjafFE2Y73PNEDj5lLVjVXzddp+VWr93sgtnNh6UaPcEq?=
 =?iso-8859-1?Q?NNCSKWj+B26GorC05e//q3MIn+vDbAK83aAX920srNpzXTD9DxadHLP3Av?=
 =?iso-8859-1?Q?aOlEygV0zVNMUGIYJIn57W8RU+S9Kv6LJC5YGh5mK/bVbXyzbpd7LsEaza?=
 =?iso-8859-1?Q?WyIWqjIAT5jp29GbGTrE4AegA6PQBcXCyGsgQNb2mMrvDr10/Z86j3tO5W?=
 =?iso-8859-1?Q?fK7C9ytdMqpWWpNeA9cK6ZBlQwah8lZeCeAzgqlnnqz86odZVULLZy/F39?=
 =?iso-8859-1?Q?m4c+xP/nuLCuAEuHKesnRgGqJYIvH6bGCaXz+G0ka4QGEnNbidYvTBB25W?=
 =?iso-8859-1?Q?HwVKEH/4PpkGZblTaNzkMhgJAB6yHHBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lsaGyqH661KNtUIyk8Bt38KBnEANEswSqHtZ+k7ZwJURKs8J7wYdSNqgKM?=
 =?iso-8859-1?Q?e9pwPa/Wr3IjkeTOzHZOBGkffWCGGceF9KqJ7IlP6YgmfbGsF6FeU9FLZi?=
 =?iso-8859-1?Q?JJ8ymxks++oZO26BlRsbQw8KOLIeC58//rgUAg6cNhO3VuO+b0I8QgWSvQ?=
 =?iso-8859-1?Q?X6fH3uk61wO0RJGS4kg08khkh9gDy8FUuTBEhi5fp+/DpY1FMP1iTdbCi8?=
 =?iso-8859-1?Q?5/RLhMyGXYsgjik0cWdjAZ5JYufyOw457WSlRrx6uBAJJ8EEUOp1EVMla3?=
 =?iso-8859-1?Q?8j16HfyH+RZeKt1N9qtn7dZRnrLJmt3z4XZb2VG6hRUWg1W4dfkBcyKc2O?=
 =?iso-8859-1?Q?LMajM9UrCZFvmlJdSnl3ATnTmkFGeevxFH5CgxR/BcC5gwVZkVNdCxGi71?=
 =?iso-8859-1?Q?qufsYgDlCGvsG6p3naqqLa24yIp1Ff4VxLtuV4hVGPqPz6OmWmqCAzSpIw?=
 =?iso-8859-1?Q?HFjALbHtObuNR0+L+OqkDrEPPedKJdTkvMVICNy7F3G/OvagBjS4yeAEPg?=
 =?iso-8859-1?Q?obhnULwlsghuJ2qquPOWz/D+Ffaa6FjlUuiLKS+ystTTsORnJQ8u0N8V/y?=
 =?iso-8859-1?Q?5Jy2bgbHrTsW8ILbXDBl0hH9PszMIg9WTnG2gmIQaJaVV5jyVQzJQI+b5n?=
 =?iso-8859-1?Q?nrM1rmcvg4eL2C47N0qMbWPg2gNrjJH0viZn4McYYc0/VgmlsxXhHZke0p?=
 =?iso-8859-1?Q?lIErmFHJyZDNemY1bhTiG4i0IiqNEHlib0V3vpN07YKjx4Cv+ynIb3mVtX?=
 =?iso-8859-1?Q?4UWuo7kdFV+pGFyzptNyal1kZLEWUA4GVnf9z9um6IxMXSQWjQ37w3koK5?=
 =?iso-8859-1?Q?HdUYaY5ykeWlIPWiU7bT/D7FwSx6mT8tWVEAokPWzrnSCTDTuafunlLc8E?=
 =?iso-8859-1?Q?C/Yg+omRPYxmLSjM3R/MEHWK/PYHG7rQAPiA3Fk21kPEO5DG9DwnOi5rTQ?=
 =?iso-8859-1?Q?dH6m4WBTW8NhCCbjmzI/iD6aouGemFZni3j/xjAR5x80MpErIgFC8tmVp1?=
 =?iso-8859-1?Q?UAA96YRuDzk4elovvzmM9claoeozoBpCSHRJMeVDCclHGR5nhNQOyuonUS?=
 =?iso-8859-1?Q?sxsu1gpD0WdbFZ9iONOXFekmXW8pZydzWQMhew2Wj2NLpBBBrd2eRMVBKV?=
 =?iso-8859-1?Q?RhKmUd+Gweb4ahd2dgrdTKK4JfOFtSOEQnSMqIGkezTfS0a0uLqQeD2E57?=
 =?iso-8859-1?Q?YlFpjydgnAq4Byao9aXyW2aFfgy5u/ghkwUuAfvjpQNcPqxo72r7cBRo7M?=
 =?iso-8859-1?Q?tK5aG7/3ZnsekaZSf6CjZA8rslNK+UYnt67bLDmktA8U5Pf1xrfZ5x9PP9?=
 =?iso-8859-1?Q?veNlw2DneFEqzigN7gq8LjoBpE8Dz0cyvM5MHuhGsc1eYTTLyCoh11UphM?=
 =?iso-8859-1?Q?zM9RwlJCDYS2h3KJeDCn35quHfSCoCFQaMvKhA8qijjw0iBsYWkX/o+TNo?=
 =?iso-8859-1?Q?dZAv8QX7nnjw5s7Ng1S8StS8fFLLNQ8Ii/WzepITNI0rBJN1xi9HoOvLcp?=
 =?iso-8859-1?Q?D8uClzUrIz4OWVZhuqVrQEnE+Qd2JtFVI55145jbluRUJhPNtEolx1PGxc?=
 =?iso-8859-1?Q?waoMhU2OsqEIf9rPWimZND5b97BGgM3MaWaql7l9Km5OjVVrUM7eL6B3d9?=
 =?iso-8859-1?Q?tbXF8YXAdHCIfx+jpU7yZ3Y/tvvUzdWi8CWBekgJwPXXRTyhqQe3Jn9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbbc5bb-336e-4ac3-5dd8-08dd2977da8b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:48:10.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk+REN+rC1OsiBbThr6ghIiwHazQGDwogTWhzh94ZIplEa2x6tnqc6mbUM1oaqngJfv4irjqqCYB3JVzy3gUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 97.8% regression of will-it-scale.per_thread_ops on:


commit: 99b9906f6cb6c689ccccef3b8e0a7a5af7f80960 ("futex: Allow automatic allocation of process wide futex hash.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v6

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex4
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412311453.4232da5f-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241231/202412311453.4232da5f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/futex4/will-it-scale

commit: 
  1cb2a2d0d7 ("futex: Add basic infrastructure for local task local hash.")
  99b9906f6c ("futex: Allow automatic allocation of process wide futex hash.")

1cb2a2d0d7bad8ea 99b9906f6cb6c689ccccef3b8e0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    137104 ±  4%     +32.0%     181042 ±  5%  meminfo.Mapped
   1181264           +11.2%    1314118        meminfo.Shmem
     72.61           +34.8%      97.86        vmstat.cpu.sy
     25.61           -96.1%       0.99        vmstat.cpu.us
 1.156e+09           -97.8%   25626505        will-it-scale.224.threads
   5159474           -97.8%     114403        will-it-scale.per_thread_ops
 1.156e+09           -97.8%   25626505        will-it-scale.workload
      0.42 ±  4%      -0.1        0.34        mpstat.cpu.all.irq%
      0.01 ±  6%      -0.0        0.00 ± 10%  mpstat.cpu.all.soft%
     72.43           +25.9       98.35        mpstat.cpu.all.sys%
     25.90           -25.2        0.67        mpstat.cpu.all.usr%
     14.50 ± 21%   +1918.4%     292.67 ± 10%  perf-c2c.DRAM.local
    712.67 ± 49%  +25244.0%     180618 ±  3%  perf-c2c.DRAM.remote
    575.17 ± 27%  +41178.0%     237417 ±  2%  perf-c2c.HITM.local
    677.50 ± 51%  +25438.2%     173021 ±  3%  perf-c2c.HITM.remote
      1252 ± 28%  +32665.2%     410438 ±  3%  perf-c2c.HITM.total
    229056 ± 66%    +168.1%     614175 ± 21%  numa-meminfo.node0.Active
    229056 ± 66%    +168.1%     614175 ± 21%  numa-meminfo.node0.Active(anon)
   1731085 ±  8%     -14.4%    1481532 ±  9%  numa-meminfo.node1.Active
   1731085 ±  8%     -14.4%    1481532 ±  9%  numa-meminfo.node1.Active(anon)
    169873 ± 56%     -54.8%      76863 ±135%  numa-meminfo.node1.AnonHugePages
     69383 ± 52%     +82.5%     126612 ± 27%  numa-meminfo.node1.Mapped
     57260 ± 66%    +168.2%     153546 ± 21%  numa-vmstat.node0.nr_active_anon
     57259 ± 66%    +168.2%     153546 ± 21%  numa-vmstat.node0.nr_zone_active_anon
    432835 ±  8%     -14.4%     370456 ±  9%  numa-vmstat.node1.nr_active_anon
     82.98 ± 56%     -54.7%      37.56 ±135%  numa-vmstat.node1.nr_anon_transparent_hugepages
     17168 ± 53%     +85.9%      31921 ± 27%  numa-vmstat.node1.nr_mapped
    432834 ±  8%     -14.4%     370456 ±  9%  numa-vmstat.node1.nr_zone_active_anon
  63231066 ± 14%     -23.1%   48613348 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
  63231066 ± 14%     -23.1%   48613348 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
   2363398 ± 76%     -48.5%    1217003 ± 12%  sched_debug.cpu.avg_idle.max
    152445 ± 64%     -40.5%      90724 ± 13%  sched_debug.cpu.avg_idle.stddev
    680860 ± 33%     -21.7%     532874 ±  3%  sched_debug.cpu.max_idle_balance_cost.max
     13728 ±103%     -74.6%       3490 ± 69%  sched_debug.cpu.max_idle_balance_cost.stddev
    490095            +6.9%     524105        proc-vmstat.nr_active_anon
   1171706            +2.8%    1204774        proc-vmstat.nr_file_pages
     34114 ±  4%     +32.9%      45347 ±  5%  proc-vmstat.nr_mapped
    295322           +11.2%     328395        proc-vmstat.nr_shmem
    490095            +6.9%     524105        proc-vmstat.nr_zone_active_anon
   1714481            +2.8%    1761991        proc-vmstat.numa_hit
   1482692            +3.2%    1530183        proc-vmstat.numa_local
     38309 ± 18%     -44.4%      21282 ± 29%  proc-vmstat.numa_pages_migrated
     38309 ± 18%     -44.4%      21282 ± 29%  proc-vmstat.pgmigrate_success
      0.00 ± 20%     +95.5%       0.01 ± 23%  perf-sched.sch_delay.avg.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.09 ± 58%     -96.7%       0.00 ±180%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.00           +54.2%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00           +66.7%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ±  7%   +6803.4%       0.67 ± 69%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 27%    +139.1%       0.01 ± 26%  perf-sched.sch_delay.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.59 ± 30%     -39.8%       3.36 ± 42%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      1.81 ± 75%     -99.7%       0.00 ±187%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ±  7%    +151.6%       0.01 ± 15%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      2.93 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     12.18 ±  7%     -46.2%       6.55 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    613.33 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    391.67 ±  5%     +95.9%     767.17 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    863.81          +110.2%       1815 ± 37%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     11.17 ± 30%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    454.33 ±  6%     -28.3%     325.83 ± 10%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.09 ± 58%     -96.7%       0.00 ±180%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      2.86 ± 10%     -30.5%       1.99        perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     12.17 ±  7%     -46.2%       6.55 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    863.81          +110.2%       1815 ± 37%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      5.59 ± 30%     -39.8%       3.36 ± 42%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      1.81 ± 75%     -99.7%       0.00 ±187%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      5.00           -53.4%       2.33 ± 32%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    454.32 ±  6%     -28.3%     325.82 ± 10%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.02 ±108%   +5957.2%       1.40        perf-stat.i.MPKI
 1.092e+11           -87.4%  1.373e+10        perf-stat.i.branch-instructions
      0.03 ± 72%      +0.2        0.26        perf-stat.i.branch-miss-rate%
   8332453          +314.7%   34555257        perf-stat.i.branch-misses
   2840046 ± 77%   +2954.6%   86752119        perf-stat.i.cache-misses
   9562648 ± 32%   +1852.1%  1.867e+08        perf-stat.i.cache-references
      0.89         +1072.3%      10.39        perf-stat.i.cpi
    294.53            -4.9%     280.02        perf-stat.i.cpu-migrations
    560955 ± 57%     -98.7%       7456        perf-stat.i.cycles-between-cache-misses
 7.327e+11           -91.5%  6.224e+10        perf-stat.i.instructions
      1.13           -91.3%       0.10        perf-stat.i.ipc
      0.00 ± 77%  +35611.7%       1.39        perf-stat.overall.MPKI
      0.01 ±  2%      +0.2        0.25        perf-stat.overall.branch-miss-rate%
      0.88         +1083.5%      10.40        perf-stat.overall.cpi
    367727 ± 50%     -98.0%       7462        perf-stat.overall.cycles-between-cache-misses
      1.14           -91.6%       0.10        perf-stat.overall.ipc
    192321          +280.7%     732210        perf-stat.overall.path-length
 1.088e+11           -87.4%  1.369e+10        perf-stat.ps.branch-instructions
   8267617          +316.3%   34415093        perf-stat.ps.branch-misses
   2845099 ± 77%   +2939.7%   86483187        perf-stat.ps.cache-misses
   9576433 ± 32%   +1844.0%  1.862e+08        perf-stat.ps.cache-references
    292.67            -4.8%     278.67        perf-stat.ps.cpu-migrations
 7.301e+11           -91.5%  6.204e+10        perf-stat.ps.instructions
 2.223e+14           -91.6%  1.876e+13        perf-stat.total.instructions
     30.26           -30.3        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      9.36            -9.4        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      4.89            -2.7        2.21 ±  4%  perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     91.58            +7.8       99.41        perf-profile.calltrace.cycles-pp.syscall
     66.02           +33.0       98.98        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     63.05           +35.9       98.92        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     46.61           +52.0       98.58        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     43.11           +55.4       98.51        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     40.51           +57.9       98.45        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     36.03           +62.3       98.37        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     30.30           +67.9       98.25        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     10.94           +84.8       95.72        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      3.54           +91.2       94.70        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
      0.00           +94.5       94.51        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait
     16.73           -16.4        0.37        perf-profile.children.cycles-pp.entry_SYSCALL_64
      9.92            -9.7        0.22        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      7.78            -7.6        0.19        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.81            -3.7        0.08        perf-profile.children.cycles-pp.futex_hash
      5.09            -2.9        2.21 ±  4%  perf-profile.children.cycles-pp.futex_q_unlock
      2.80            -2.7        0.07        perf-profile.children.cycles-pp.get_futex_key
      2.64            -2.6        0.05        perf-profile.children.cycles-pp.x64_sys_call
      2.38            -2.3        0.06        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.36 ±  4%      -0.1        0.24 ± 11%  perf-profile.children.cycles-pp.__cmd_record
      0.36 ±  4%      -0.1        0.24 ± 11%  perf-profile.children.cycles-pp.cmd_record
      0.36 ±  4%      -0.1        0.24 ± 11%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.36 ±  4%      -0.1        0.24 ± 10%  perf-profile.children.cycles-pp.handle_internal_command
      0.36 ±  4%      -0.1        0.24 ± 10%  perf-profile.children.cycles-pp.main
      0.36 ±  4%      -0.1        0.24 ± 10%  perf-profile.children.cycles-pp.run_builtin
      0.34 ±  5%      -0.1        0.23 ± 11%  perf-profile.children.cycles-pp.perf_mmap__push
      0.22 ±  4%      -0.1        0.12 ±  7%  perf-profile.children.cycles-pp.record__pushfn
      0.22 ±  5%      -0.1        0.13 ± 10%  perf-profile.children.cycles-pp.writen
      0.22 ±  4%      -0.1        0.13 ± 10%  perf-profile.children.cycles-pp.write
      0.47 ±  6%      -0.1        0.39 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.19 ±  5%      -0.1        0.11 ± 11%  perf-profile.children.cycles-pp.ksys_write
      0.44 ±  6%      -0.1        0.36 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.42 ±  6%      -0.1        0.34 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.43 ±  6%      -0.1        0.35 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.18 ±  5%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.vfs_write
      0.17 ±  6%      -0.1        0.10 ± 11%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.16 ±  6%      -0.1        0.09 ±  9%  perf-profile.children.cycles-pp.generic_perform_write
      0.11 ± 11%      -0.0        0.07 ± 10%  perf-profile.children.cycles-pp.ktime_get
      0.11 ± 14%      -0.0        0.08 ±  7%  perf-profile.children.cycles-pp.clockevents_program_event
      0.24 ±  5%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.25 ±  4%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.07 ±  5%      -0.0        0.04 ± 45%  perf-profile.children.cycles-pp.ring_buffer_read_head
      0.09 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.get_jiffies_update
      0.09 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.08 ±  6%      -0.0        0.06 ± 13%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.21 ±  3%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.update_process_times
     98.27            +1.4       99.72        perf-profile.children.cycles-pp.syscall
     66.44           +32.7       99.11        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     64.06           +35.0       99.06        perf-profile.children.cycles-pp.do_syscall_64
     47.21           +51.4       98.59        perf-profile.children.cycles-pp.__x64_sys_futex
     43.97           +54.6       98.53        perf-profile.children.cycles-pp.do_futex
     40.72           +57.7       98.46        perf-profile.children.cycles-pp.futex_wait
     36.50           +61.9       98.38        perf-profile.children.cycles-pp.__futex_wait
     31.35           +66.9       98.27        perf-profile.children.cycles-pp.futex_wait_setup
     11.59           +84.1       95.73        perf-profile.children.cycles-pp.futex_q_lock
      3.73           +91.0       94.73        perf-profile.children.cycles-pp._raw_spin_lock
      0.03 ±147%     +94.5       94.54        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     17.41           -17.0        0.38        perf-profile.self.cycles-pp.syscall
     12.41           -12.1        0.28        perf-profile.self.cycles-pp.futex_wait_setup
      8.53            -8.3        0.19        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      7.57            -7.4        0.18 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      5.08            -5.0        0.10 ±  4%  perf-profile.self.cycles-pp.__futex_wait
      4.61            -4.5        0.10        perf-profile.self.cycles-pp.do_syscall_64
      3.60            -3.5        0.08        perf-profile.self.cycles-pp.futex_hash
      3.54            -3.5        0.07        perf-profile.self.cycles-pp.do_futex
      3.55            -3.3        0.20 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      3.31            -3.2        0.07        perf-profile.self.cycles-pp.futex_wait
      3.24            -3.2        0.06        perf-profile.self.cycles-pp.__x64_sys_futex
      3.19            -3.1        0.07        perf-profile.self.cycles-pp.entry_SYSCALL_64
      3.97 ±  3%      -3.1        0.92 ±  2%  perf-profile.self.cycles-pp.futex_q_lock
      4.82            -2.6        2.20 ±  4%  perf-profile.self.cycles-pp.futex_q_unlock
      2.56            -2.5        0.06        perf-profile.self.cycles-pp.get_futex_key
      2.55            -2.5        0.05 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.38            -2.3        0.06        perf-profile.self.cycles-pp.syscall_return_via_sysret
      2.34            -2.3        0.02 ± 99%  perf-profile.self.cycles-pp.x64_sys_call
      0.06 ±  7%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.ring_buffer_read_head
      0.10 ± 15%      -0.0        0.07 ±  8%  perf-profile.self.cycles-pp.ktime_get
      0.09 ±  4%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.get_jiffies_update
      0.03 ±147%     +94.1       94.18        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


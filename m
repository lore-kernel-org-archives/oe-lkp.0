Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D772C9D
	for <oe-lkp@lists.linux.dev>; Mon,  7 Apr 2025 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008371; cv=fail; b=SBxDcXlN3JkvFhjzYjLi7F4Rhn++SvSaIdcmie22zeEF3nYhAS2fqnl8YodpyYPyqrZlf/DG/gNN2UYXtqrVDGAwuEG9zyyrCnlAUX89I8N/NRQZtWOOL502pfFCOEjdtfBkYLVwEcfGUyUZD9V/HgcAY/zjOr2F01ouTc4tlfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008371; c=relaxed/simple;
	bh=KeMC2Ko58dAiMaVBIN4GdUzXRZGiY53XY+Va1DnkKlw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FICdprvVT6Q5rj4bFLxfftL7J7SfxghZiRLn26fhCmdVYdSWnhOhqhlEWuGd6nsGKyuRpLagFBd9Z0cIvcupB4Hlse4q/xHSyusEoHVfea2XUC5HMidyf8qC8htUj7W3V96UhdIALTKDCHHPjSMG5EsxV7zCnXXlOrJLJr6k1vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBFol3uR; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBFol3uR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744008367; x=1775544367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeMC2Ko58dAiMaVBIN4GdUzXRZGiY53XY+Va1DnkKlw=;
  b=oBFol3uR7GPqyBv2wpuIyGM558xBb2kEN33PJUE+zhSY6O5wXSVFOc7E
   CLfGyQw4/t2nkqI8Umil4VmAu60RFKVe1Ie8Vz0TGqnthwK6DtQetQlbE
   uXJ/duJPrymahf/xwTryKopbNVMUnaABgbxFzImnffdgmKuDuR73y7Shj
   I4jcrd0zwUYcKCQDLPOnlGdlnqphXKtc5BOLOkkn2YxXsZuD8rBf2x9fF
   Xr6cWD6wknA/JzMqDk5Z75eg19gRW4JH69bTOrOYvWHJ9aULJ08KycKAV
   6ZHYWplhnFFXsQzH8ZqzwQa3qTYKKhNV9O150HEZ4eiBZWAxmmPHBTkVE
   A==;
X-CSE-ConnectionGUID: kYRXmOBsSAu280Hx9mOHYA==
X-CSE-MsgGUID: pBFsdyKXQFGde2UPWScrXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45466791"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45466791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:46:06 -0700
X-CSE-ConnectionGUID: gc8PomAPSxinDz5O1ImW1A==
X-CSE-MsgGUID: FSo229F8Q/KHzD+XXoCN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127853478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Apr 2025 23:46:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 23:46:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:46:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:46:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS/jwU+r09zRU8YX4txi50AmYrg3PYCwBgVRmXlZjhmfOa5feA8b0zKOr0v4hprLES/TQ39EwCnlD4/H90BYlCIezaFuk4ZM7KIH2IY71cye8yeA9JVdzBWMM97PUFvw89cGhfZJDIOdNC4C5beX2u9OkslzeJggzuI6tY5S37tgyjEPAgLqWPCJQzKJOKMA1FpuFfv73bm+mSOjOeK+SXRrdMipCpZwe+tgcCbbYO086faKpvrb3RlIP/Pdnc13EUJarqcLl9pcTDwVdYL72NTvHc+fo7IDiJInOe4v9Wbck8dY2JaVPQ81/moq0z+DDAYz+4J1Er7a6zeN4qqiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LatyBhdiiXvXr1bFqtAtYZEFtax+i+OMW9XXRLmVWVI=;
 b=ZKLEuL6bSYuRUeRrI5z2IVL6mpk/8Lg8X+m6bqe+9dwtbCBLM6uBhbvO5C+o6cCxD1TuXSyn/9JetNTEAuNQAZ9/f0O96EyT+JlUE5qwAhJhHtgIGYro+EcqP1fHh+YS7nLMybXyXsgon/iPkBWeVWYotFgFC9pZQuYwe7E/g5uFLJfTFRXFKr8dYWPdY8Z03O4CQVM9d5YBKWsAAuv2qvVVyrHGW6JfNdDFEa+nijXaj0dJSQLgo38koPOyeoP47whcnlRyLfzZO1QIP1VvPOtY3TEUWYHQ6qQ6Hojw9lBoJ8SqyL9dM0VMC7/msCZBQ96nZzLkHsj+UtJXV1qgPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 06:45:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 06:45:49 +0000
Date: Mon, 7 Apr 2025 14:45:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:vfs-6.16.async.dir]  e6e4bf924a:
 WARNING:at_fs/namei.c:#try_lookup_noperm
Message-ID: <202504071333.e64c1de0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:820:f::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b95da4e-4975-451b-ded3-08dd759fd51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jI5fSeAAfeleiGCZgW9r6DInECzPEOsklG9utKP7equoEvSIjW5GknByfXcP?=
 =?us-ascii?Q?Ix25dVWplM6tWTcDRDHDmH30u+rkdaW9k/81+IfF12ZalkCCshAhbM8F1cbn?=
 =?us-ascii?Q?VfMtnT35JHZOJz4ksiSoIZ7UxIQT82qLVHajwpc79bbYv4Ajzd9eA/Fzlfq8?=
 =?us-ascii?Q?FxCf47cvt5WY8kgv8sQS70jWPmO4C5YlyXosC4QBqzLGigVHxVV6NKLj7zrq?=
 =?us-ascii?Q?trJn5stkr+hBFxD4CO5+hlXovFUvOEI8El6wzQqoDWe+QlV16UjN9YKsLVX0?=
 =?us-ascii?Q?4jKx8GEZBghZ+qqPjuXGvZrptPjs4mv1JeftESBO7Tm26OHb2WQFfIVd0Z1w?=
 =?us-ascii?Q?BiyfbtSyto2ryoT0NlGbjW8lmzLDgw2KksbL9nvINQZqS1AmTUhJBpubTpgv?=
 =?us-ascii?Q?EgT7lQ4LkDqJEo22Ffg6zA5ZpZAKLpfDqnspK96uAbJCJQnqGr9mUahxGre9?=
 =?us-ascii?Q?sCRqDbMlyvWghhBKRqhGX3O5XseR2FfYIbbnrpvX3cp2/ofj67RFbYatIdkj?=
 =?us-ascii?Q?V2cAvAHDxTuje/6jmEjVKAmql20oMw4kkYlNnJs3xIwyS33JhM0Z5VZ1lGQq?=
 =?us-ascii?Q?JRRw8/OWSMYerFGoyl+kL6tRDGfVFQtimsshlNoqy6iVCHFxzPVFGeoGmH/x?=
 =?us-ascii?Q?URSWrynFoRm7YXZAXtRLBXq5TGSyR4eduucr3/X47muDF1/dVeQF/KcUjHbd?=
 =?us-ascii?Q?oeKQikbZg+fULT6i0aopDbBCjlk//QqZ7SWOfKU2kjcIDf4LgHqmwqHfjt4h?=
 =?us-ascii?Q?ksl6vQMV2VasoGOrmWD1ym+H8s+Ntpd7jlsQrbPW5NRXTfresOkaDPVce+Jl?=
 =?us-ascii?Q?YkBKmrVaMl9DGn8CBwI+VrFacTD5aPngI2fPMWwc7KGaFiTBwPoryfppgG93?=
 =?us-ascii?Q?3pHgvQgLklxHojmAoRCSphFK/+vG6vNKjxdD8NzPxfMzXeeW8AD772Kzp4S+?=
 =?us-ascii?Q?S40BPfK1SjRXr3puFbfqTAPESnbCeHmrgwhLD/7k8JIvVkHG1BRs9G5j09f1?=
 =?us-ascii?Q?TRHRfoVr0GdWVbPNoPw58G3UP7d7UJROK+yaIT6M4PK7kX7455+PZS/QtV85?=
 =?us-ascii?Q?LLcWwAdhXIHY7ZnLaxMrNgnNDl5t3GGZ/uBn52iiBFNbxrfJWxqk61ER31oa?=
 =?us-ascii?Q?k/TgRoz7CNirs8DpgVKP/TZDKrGVPJK+t+5fyZkUJMSqUYvDvrkM8Idmg2Iy?=
 =?us-ascii?Q?ZZsu+k539QxmQm7ju51ptXTJCC+vQJP42rf5r94S1Ui8riwdttSfUPpa1o9k?=
 =?us-ascii?Q?qCRWVS0YRl8e0TE5Ok5LD8e9gLqH1SkOE/QLLeZ1+Hgi9L6Mw17OIyY5FftU?=
 =?us-ascii?Q?/8Yn7G53al6vAo+WFenv75x/pkp/2r4X8tW4CNIpkE+HaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wsdcZSuKX8ylroAKPBJqykmlCX1MB3reUYANky8Fo4isiL8NR6oDvFttyECD?=
 =?us-ascii?Q?87UlqtaO1hTnhuvlvDFiLo/9jMExU6NygLY0JUFTAwmBQD3pwXMaIWXdpMpz?=
 =?us-ascii?Q?LhZOAIzxK0FD8SySj18LzkwUQd/Jx4T+j5lefPAhSqCQAW/OhvVhOSvCiCYf?=
 =?us-ascii?Q?j+wutf2GFfvcGe3xO3VLUdo8QvrofDNzCQdauxuStn5xzL3Uz+UJsh9g2g3S?=
 =?us-ascii?Q?nLR11GR9Ko1Ryzpx28mt99oTR5n2BK7J6+Fmu5igNBtaWhKi8OGvHFVv+Rzm?=
 =?us-ascii?Q?m3Nrocl3BKFfZXoxspRr45gj3avvTdfR/ywwxjjt7e1ewx3tP9kcfBIzdp7U?=
 =?us-ascii?Q?oin1XUDGgQSKM9oJWNDv6HUR/WMHQyOIHRUclkZ7caQgfrpzT+fW8o5hkXR1?=
 =?us-ascii?Q?sqdOmAgOqvAa5XEqhayxkgD5pf5cHX4FQCVFER9PTI+1NZy9JlNEXLzi1kGJ?=
 =?us-ascii?Q?1ESAblZ6f/yNO1K+rPlknBo7yO/e34mSXoX5x0CBevqBmHErPjCNHyLp9Drq?=
 =?us-ascii?Q?q1vz1HU2KW9S52cGOGTYtYH46l6dKDOXCz3Ub3EXoxKmEpJamxZRuN1OP1c7?=
 =?us-ascii?Q?/hG5bFJ2txqLjRgo/E5XmEDl5UpYO3mFpsV0QIdYeSShOIqhOHkpG6CzXTE1?=
 =?us-ascii?Q?s5BKmKHBdLNODf7dEUdwBMDpG1Cix+/MWeYHe+CfguK1H+9GzhiFSnaoSPAm?=
 =?us-ascii?Q?TjWoGdkp2I6DQEHkc/rwEcwFODnsUOWTS0DzcBE5Z9Ph8Gv7sVi3J4yBAWut?=
 =?us-ascii?Q?XZjIglOb9BLV1ZPQJPmA4zVOgtN/TozcuZXrq1BNXLf5EAESWkfPowgZ28o9?=
 =?us-ascii?Q?xrmrr3PIR6Smq+nXjy/EyqN52wX1Lo699nx1R0je0Wtw6Uww55uG7R4iV7au?=
 =?us-ascii?Q?IbeS49hmL+HYUP6Ck4YNtnk6HXTD/Sh/A8Jn3XKUk+Hs8xCTS+aFqJSOZRDI?=
 =?us-ascii?Q?kIyI0zaEJJqBHX8DhFXH7FWArqpqgBQ7GPCRVGUflNXU4NTLUaysgIHkdR+N?=
 =?us-ascii?Q?Sl/x4Qx8rMWX3VQiaNr8MYxHwLGjUe2X0R0tn1LRNnzNYANEHSLVViF5X9AD?=
 =?us-ascii?Q?DOR1EUaUcVsodRtw637FUn8lMz1j9LInf5dVVb/27prO9WRGNXFhd1tPUItf?=
 =?us-ascii?Q?DgosiHJ6TYH+iSen7cM8j7GRh5hXwBBPx30cdpZ+GAvoEGTe+DlXf/PEdhMh?=
 =?us-ascii?Q?Y2LZss65szgk91SbroncyB7Myi4RF6HvGlGfIE2V46f8aKNF72RUctw2oIMX?=
 =?us-ascii?Q?9lf8okfmaXM33C9g8l4uB/J2tjBw3WF3oivTtX3w/vU8n2CPKsCtrdCTyJfU?=
 =?us-ascii?Q?h6eZCs57hd9irnOWGWs7Wv1wvSzf/tfJsPKk8AxID5PBD0NYYhAYKD/jQgHM?=
 =?us-ascii?Q?nhM4YDSnQv/ByIQcnm6QrUhSO1bREzdsq6fG285iJ10rsFhkohiaBDecRz4t?=
 =?us-ascii?Q?DKDE2ryeKAG5e2IkLKrjyr8YF9gEaluS7H/yTZ8+WYZC8eeZNx7SQdDKZlHo?=
 =?us-ascii?Q?1IhBksCLIuZpVavs08Qm1+lMJfJdEf3lv3yJ30cLt7HmtK9qrw4KEchEdJwO?=
 =?us-ascii?Q?0riJTf2EFERtIk+zGOnlz/ofzF3yOyFL6/zUG6s404Wj2P3pdYilwQvnc9fv?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b95da4e-4975-451b-ded3-08dd759fd51d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:45:49.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcPmd4bGDeIjiVLQPDCXRDocgnbVAbEvZHnhR3MG0jQonxe+Zzpdc8J+73M641/dkMhjMiZ5q8vYQl8Cn9iVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_fs/namei.c:#try_lookup_noperm" on:

commit: e6e4bf924acef70084f8a097f638aa277d17b13f ("Use try_lookup_noperm() instead of d_hash_and_lookup() outside of VFS")
https://github.com/brauner/linux.git vfs-6.16.async.dir

in testcase: boot

config: x86_64-randconfig-161-20250405
compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | c9088d9e29 | e6e4bf924a |
+------------------------------------------+------------+------------+
| WARNING:at_fs/namei.c:#try_lookup_noperm | 0          | 12         |
| RIP:try_lookup_noperm                    | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504071333.e64c1de0-lkp@intel.com


[   29.765773][  T112] ------------[ cut here ]------------
[ 29.766687][ T112] WARNING: CPU: 1 PID: 112 at fs/namei.c:2894 try_lookup_noperm (fs/namei.c:2894 (discriminator 1)) 
[   29.767857][  T112] Modules linked in:
[   29.768479][  T112] CPU: 1 UID: 0 PID: 112 Comm: mount Not tainted 6.14.0-rc4-00021-ge6e4bf924ace #1
[   29.769685][  T112] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 29.771035][ T112] RIP: 0010:try_lookup_noperm (fs/namei.c:2894 (discriminator 1)) 
[ 29.771900][ T112] Code: 8d 7e 70 48 89 fa 48 c1 ea 03 80 3c 02 00 74 05 e8 1f ed fa ff 49 8b 45 70 48 8d b8 e0 00 00 00 e8 e8 ef ff ff 85 c0 75 04 90 <0f> 0b 90 49 8d 7c 24 04 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1
All code
========
   0:	8d 7e 70             	lea    0x70(%rsi),%edi
   3:	48 89 fa             	mov    %rdi,%rdx
   6:	48 c1 ea 03          	shr    $0x3,%rdx
   a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   e:	74 05                	je     0x15
  10:	e8 1f ed fa ff       	call   0xfffffffffffaed34
  15:	49 8b 45 70          	mov    0x70(%r13),%rax
  19:	48 8d b8 e0 00 00 00 	lea    0xe0(%rax),%rdi
  20:	e8 e8 ef ff ff       	call   0xfffffffffffff00d
  25:	85 c0                	test   %eax,%eax
  27:	75 04                	jne    0x2d
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	49 8d 7c 24 04       	lea    0x4(%r12),%rdi
  32:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  37:	48 89 fa             	mov    %rdi,%rdx
  3a:	48 c1 e0 2a          	shl    $0x2a,%rax
  3e:	48                   	rex.W
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	49 8d 7c 24 04       	lea    0x4(%r12),%rdi
   8:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
   d:	48 89 fa             	mov    %rdi,%rdx
  10:	48 c1 e0 2a          	shl    $0x2a,%rax
  14:	48                   	rex.W
  15:	c1                   	.byte 0xc1
[   29.776142][  T112] RSP: 0018:ffff88814232f9f0 EFLAGS: 00010246
[   29.777023][  T112] RAX: 0000000000000000 RBX: 1ffff11028465f3e RCX: ffffed10270e3f35
[   29.778114][  T112] RDX: 1ffff110270e3f34 RSI: 0000000000000008 RDI: ffff88813871f9a0
[   29.779192][  T112] RBP: ffff88814232fa78 R08: 0000000000000008 R09: 0000000000000000
[   29.780295][  T112] R10: ffffed10270e3f35 R11: ffffffff817cb416 R12: ffff88814232fac0
[   29.781422][  T112] R13: ffff88813874a620 R14: ffff88814232fa50 R15: ffff88810be6f540
[   29.782839][  T112] FS:  0000000000000000(0000) GS:ffff8883aee00000(0063) knlGS:00000000f7b89e80
[   29.783988][  T112] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   29.784841][  T112] CR2: 00000000ffd9298b CR3: 0000000141445000 CR4: 00000000000406b0
[   29.785958][  T112] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   29.787046][  T112] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   29.788130][  T112] Call Trace:
[   29.788657][  T112]  <TASK>
[ 29.789158][ T112] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 29.789763][ T112] ? try_lookup_noperm (fs/namei.c:2894 (discriminator 1)) 
[ 29.790465][ T112] ? __warn (kernel/panic.c:748) 
[ 29.791038][ T112] ? lock_contended (kernel/locking/lockdep.c:6064) 
[ 29.791786][ T112] ? try_lookup_noperm (fs/namei.c:2894 (discriminator 1)) 
[ 29.792749][ T112] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 29.793423][ T112] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 29.794079][ T112] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 29.794777][ T112] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:574) 
[ 29.795511][ T112] ? rwsem_is_locked (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/rwsem.h:75) 
[ 29.796213][ T112] ? try_lookup_noperm (fs/namei.c:2894 (discriminator 1)) 
[ 29.796924][ T112] ? lookup_one_qstr_excl (fs/namei.c:2890) 
[ 29.797967][ T112] ? up_write (kernel/locking/rwsem.c:1631) 
[ 29.797995][ T112] ? rpc_populate+0x155/0x1ab 
Starting Load Kernel Module drm...
[ 29.800180][ T112] rpc_fill_super (net/sunrpc/rpc_pipe.c:1304 net/sunrpc/rpc_pipe.c:1376) 
[ 29.800871][ T112] ? shrinker_register (arch/x86/include/asm/atomic.h:28 include/linux/atomic/atomic-arch-fallback.h:503 include/linux/atomic/atomic-instrumented.h:68 include/linux/refcount.h:125 mm/shrinker.c:757) 
[ 29.801690][ T112] ? sget_fc (fs/super.c:788) 
[ 29.802571][ T112] ? rpc_populate+0x1ab/0x1ab 
[ 29.803392][ T112] vfs_get_super (fs/super.c:1281) 
[ 29.804050][ T112] ? rpc_populate+0x1ab/0x1ab 
[ 29.804848][ T112] get_tree_keyed (fs/super.c:1318) 
[ 29.805547][ T112] rpc_fs_get_tree (net/sunrpc/rpc_pipe.c:1418) 
[ 29.806247][ T112] vfs_get_tree (fs/super.c:1814) 
[ 29.806907][ T112] do_new_mount (fs/namespace.c:3561) 
[ 29.807578][ T112] ? do_add_mount (fs/namespace.c:3515) 
[ 29.808263][ T112] ? ns_capable_common (kernel/capability.c:358) 
[ 29.808990][ T112] path_mount (fs/namespace.c:3887) 
[ 29.809627][ T112] ? kmem_cache_free (mm/slub.c:4609 mm/slub.c:4711) 
[ 29.810367][ T112] ? finish_automount (fs/namespace.c:3814) 
[ 29.811112][ T112] ? putname (fs/namei.c:297) 
[ 29.811827][ T112] do_mount (fs/namespace.c:3901) 
[ 29.812506][ T112] ? path_mount (fs/namespace.c:3893) 
[ 29.813116][ T112] ? memdup_user (mm/util.c:222) 
[ 29.813775][ T112] __do_sys_mount (fs/namespace.c:4113) 
[ 29.814474][ T112] __ia32_sys_mount (fs/namespace.c:4088) 
[ 29.815159][ T112] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-161-20250405/./arch/x86/include/generated/asm/syscalls_32.h:22) 
[ 29.815820][ T112] __do_fast_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:386) 
[ 29.816553][ T112] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
[ 29.817233][ T112] do_SYSENTER_32 (arch/x86/entry/common.c:450) 
[ 29.817887][ T112] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[   29.818735][  T112] RIP: 0023:0xf7f39579
[ 29.819343][ T112] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250407/202504071333.e64c1de0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


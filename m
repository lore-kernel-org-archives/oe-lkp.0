Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E343219ED
	for <oe-lkp@lists.linux.dev>; Fri, 18 Apr 2025 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744944420; cv=fail; b=ZB8BE5lY6rT9SacpM30zCxIn0MfrMF+8mkqXAzftPrqGiwP5IsiuAcmeqvN5Al5zFXcv/Bg1hUs4yzWncBS0azHXmZEDCWfDT6XxYMWsgehM3EDVKLahVmLenjmfCJlBVMhByyYMMCmKZz7Jc8AAMU/2bPA25yxjYnnuqe8KrqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744944420; c=relaxed/simple;
	bh=wLXwGrtz1jBSAX2fqxeXcUYVnRcxfd3VZYHXNcEbzew=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dlJxTbDdR4Afve85v9TM9fIJd7LJwzF0MkZ9jMlsKsrjViphZl5pllsLIy1ClETGNvPu3s34rHg1HBMlIpfVQxOnSNcTX+ADmi/uVcYFB0gMHQaN+Oi3IBMRwAW3IMGWyJLFoJLYNfgXtdu7vQ8IMeTtvgZfnURDrdPvjFgRD0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKQgLL+e; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKQgLL+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744944417; x=1776480417;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=wLXwGrtz1jBSAX2fqxeXcUYVnRcxfd3VZYHXNcEbzew=;
  b=hKQgLL+e2xSluBT0xUUX/MCxLgD4fyRY3U0ltoimMOQAYlCD6hBwvNhn
   OYrAJiAWnKRtunkYGrTFnc3xTcERPFz87/Vi4OprcpeJuOsi8Vy6xvkdo
   SvcxneqDz0ecWlXZjGkkIaOFDCiYEgKZBazyn80etRrTw4CcgaJM6eXpv
   IO2FrVfi2gK6UfM99nkSlnrqE9TnB7RGgXs2N/EBEahXV9BIkEts4ymdA
   UJEZ7VP1SEFkGOuDSdlNGCAWkKwCPd87vZKrE6bhuiFsYlbEukh0PZabG
   K/gPGKjJULEXnvt2FL7GoP3FvnlnzKV1d36UjTljlALb39V4YWZwzIGDz
   A==;
X-CSE-ConnectionGUID: RmE2ILElRC6KphtkWukgcQ==
X-CSE-MsgGUID: yieEeB8AQai5R2yQSzhuzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45808620"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="45808620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:46:56 -0700
X-CSE-ConnectionGUID: htOgpQwNSlWkRsjQK/RrNw==
X-CSE-MsgGUID: CnCV+9bORQGF0LZzPO5ejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="135849137"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:46:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 19:46:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 19:46:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 19:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZNO5LRizEOK87+EnxcjqtE3/gQpsw7B4rPUl7AivKAf4EczGxwmJ+RH967mwyxkWfAYURmKHhxVXc/97E6rGV64eFRt8O6tl1mnC2Ys5iLRFTmLTcyocL3LQSDcA17Fm4W3cXVEUI1yNDM/UET7kxbXu7pae+FXNRLJwBxbuTvzPH2xAoD9cCVLZqO9xPbRPKHClkdGNAjyMdFOUIGHNPlJiXuw5rhga17hfAs1jHfPFxbundh+MrmBQ+yiLZEq3dLc/mpaCLhjjO9b7Xb0S8n9GGONA60z0P9w3QDbqFxI4TVzIwgCw+7yxTgnMXHcK8WQvXZiG0DAg+wFHNhJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdBdUURdNSfwF2mBi1Z0ZFoONhDsrPxmghwtVAgLGJ0=;
 b=tiw5RBhPcyQ06vlPQMIRBU/KcVLgcX7TIl6ZuxouaSNOD4VqO19RmaG1judzlIe0NuPmYTvWKycETzjA/mbQXpRLMtBZSKKRgX8MLvv6JP+IZAuNUctH+FaOBvb72rOm4iaAGXNQxVyUE3zQMoac+F9fgXN0KXfPBlPpsHTPl2VtC17aP1ZsrN17PO2rFlhR8BatbOBOP/W8XikRfaUwrhnFa0c1vK1OY7kd0smnYWIqDrA5hydfnd8Ojjok1pDgNzBNNv7uzbyhSGDd/cAQ/1e17kKACgaZObbW8LJls+3LPrIp5U9bGqU/GDQWVVcQ8iKraON2aFObOTyk9RokXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 02:46:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.035; Fri, 18 Apr 2025
 02:46:45 +0000
Date: Fri, 18 Apr 2025 10:46:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [mjguzik:lkp-bench] [x86]  76a45d86f7: will-it-scale.per_process_ops
 8.3% improvement
Message-ID: <202504181042.54ea2b8a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a14ebd-2230-450c-1e6e-08dd7e2341fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yMZStyHDr5WEoUtvocLr20GP/XkAFUw8HFYH+TaYk9YqSLEur+sdJa2Fpy?=
 =?iso-8859-1?Q?Ppj4PmLU9HSv3qpN7w9YujskXIgy2KMpdSRAFhvawOcp4BLpKC23O78TEc?=
 =?iso-8859-1?Q?crnv0aTrll4qKbRMmYOFU97mkPyl2fTdMrNjKAeTJiUeu1asoupnKw+gkk?=
 =?iso-8859-1?Q?iAPMdXVA4Hfs9tHg6jaT2PoyUpQK3KOeEZPnRAiN8BbER/zI57boHBo25z?=
 =?iso-8859-1?Q?IyLD6huBcKbGuRx+JF4RxT0/5GGmtTjt5/gcPiH1htefFSpB1HjwY7rLUh?=
 =?iso-8859-1?Q?84Blz3JnLgOt7QSu+zzJ5sKEz3PMgLYpAI3tvlLFQkQTdJb88i1RYEzuOH?=
 =?iso-8859-1?Q?KjO5q42diEgYxHOCWmYar64+lvA6VxEAbYi3fRPCxlcUdUWpAO/MA406Uv?=
 =?iso-8859-1?Q?crR0G+nrSHvs/WV0M8lsoBkWt4PFWSc1rEC0bYdrlK8r865eLMpaGKl7Ik?=
 =?iso-8859-1?Q?ukCjrHW6A0BDtmBdmV+lXVO5vtw0z/G971HB++Njed+Ma+Psjg34EkW7wg?=
 =?iso-8859-1?Q?TZuEHSKwfL7cO7Me0Pjwc32PXW+fneJSRCr8iWqUTryzNGT3mMGKwz+8WK?=
 =?iso-8859-1?Q?n+ITsw3iL8iU7zJ2LPIMKkkpRZlwYeotO3R4zQZRGpP5wbyqi5ME2unvG2?=
 =?iso-8859-1?Q?zEULe0OEIoRfNEj2XfOoCNvpp6e1Icob27auGbw7u7YZJDfWffBgl0Xh96?=
 =?iso-8859-1?Q?fHqcuNe0nJVVITnGjKcIVVimDH/CfSCvidhbcism4T7XgMLGomBbz6kM3H?=
 =?iso-8859-1?Q?VZ0ybN0/PwOT8f88IUzc5jp+lEE1kifDdsiAjFJWbLT2VYOQQZ/mrVQGfr?=
 =?iso-8859-1?Q?I7VlFyspVsr1AUCaSmAQhjvzJgkCX471Zu03W3bw9FUPynKDjrfXk6clMX?=
 =?iso-8859-1?Q?A7lW8Mk1pHRF0hdKtQI9r/c98JYXESjTc6f21Naaw2XwGOZc6s097yeY87?=
 =?iso-8859-1?Q?Mv/uC7GjfsE6XUPVg4INsn2oVS2zmdTqyfjA8Y1dko3IfDg7pGAo7RlaMU?=
 =?iso-8859-1?Q?dNdMP6lREKzcgOTbn5BjL/UiFWbxRAn4WyFtRyNGeYcQZbpVN8NDveRn2a?=
 =?iso-8859-1?Q?RAUvc0gHH4bhOkm4dDe8IeaeZBTPpDLUa0UDDuCS2HssVpL9YRtZZXuVHj?=
 =?iso-8859-1?Q?MXaBHx1SFKFJ3w5TSMlUGgEyoLa3ZpJAi2j4IOkeZJU8OEgkbn0KKvTHoh?=
 =?iso-8859-1?Q?swVTCMx7Z7LpoT8VBz17IrS7023nh0K6gJUOAbK+YljfqgRfj31T5Z+Ih6?=
 =?iso-8859-1?Q?SSgv4fCyv9vnNFq4zXQn21cZfq/LbYFJhHqWSYMmzmxMe0fOVrtk+ECyZ3?=
 =?iso-8859-1?Q?ljuje29WH/paJXI6TF4Iw8TcX/DhGL3IuK8A+aZNF9PeCyzCMjtp8yuqKQ?=
 =?iso-8859-1?Q?SBIdULor4p1pPt6HWIFWrLg7Ayn0QMPVw6uIFXHCEMEbQmbz6Qd+N7R6hc?=
 =?iso-8859-1?Q?rG/cVUnKdoDlVF77?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8dGou6l0DDnKepC3QVH72TE9Hwc2QTv3gpJyVE/OoubMnhcfa6IZtwfL0G?=
 =?iso-8859-1?Q?ae8Ejo1U6Id9Et72rRYs/3X8aG4Aiz0NWow000oXwuAXzuC9W3bUKFwjg0?=
 =?iso-8859-1?Q?n5a94BjA/pr+f5aDxQjGen4HV3l37BqPkkoKRPs2b9lZKyyeV5Y3r931qC?=
 =?iso-8859-1?Q?MHze/IpEJ1wy5fV7QKn8W27pdv453Rt8G/C03AwP0mJ4V7uNb6JTFN5Trz?=
 =?iso-8859-1?Q?v8F93e0Y+cklnyO7g8S/XMZ5DgtBK38zU+DBWYFLfgQRroSiTmliu0147E?=
 =?iso-8859-1?Q?+wVZQYT71kwZC1ot3SgwCOCYZas6ha2PWZD3PogCLgaQq0nwa6Gw8nxlF5?=
 =?iso-8859-1?Q?QFJ0nRC9VSNurJSzQQCO5ajFwY0loqUiLeUKJthIWlboyUeMX+N37MI3J1?=
 =?iso-8859-1?Q?GhQKVKV4ShJeaqRGnsl3VRxNz4knyqhtpElGWBtrghOoNYUlajCOqrT4xV?=
 =?iso-8859-1?Q?InrKRswGcd1lLfPykEVzH+prEMHUy2bKP/+4nSpZQxrx3v+7rnsUT+auTb?=
 =?iso-8859-1?Q?c2foi9PPji82i91cMNc3amoGRC2AE4bDlexFFtQbSZWzGE3EGjuW+Uag3N?=
 =?iso-8859-1?Q?GiLmG8/up4E39zDxFL8RkuHrNDL+BoKyGXG058y8R9rKYUsaoJN+7z8tYm?=
 =?iso-8859-1?Q?/aZTVxPgmWcf/KBFi7kLSDFE4jup/YECPj/2J04eg4gvgrgQ62PCVRyGY8?=
 =?iso-8859-1?Q?ifHRck4WF+cYOGACwZwHSVztQqfhz/tDhIgUj5VCRs9xvMngyaejd7vHD1?=
 =?iso-8859-1?Q?DsAvoP87wiEqjaIIdWRPh33NNG6eJFoNY6HneSsf5Tq2NAGADnlbcVGT+K?=
 =?iso-8859-1?Q?47y/7ohBeHDNJsIfd0InLLIgMRzWZIz/2HxCcsTdD8jyZZWFxikPOKvNXP?=
 =?iso-8859-1?Q?5d2CbtunrVE3z+7LbTCdgrD0Uuqt2AKbfRC6Vj3QCY4lVDZNlncFIAVAsQ?=
 =?iso-8859-1?Q?LREW38KL+3gjkyW764oVhM4VFqvwsMnSnNQcs1N27PeGqtj9vjLz8nXs+B?=
 =?iso-8859-1?Q?3Ff/rjP/GXsIGBSxg3BYh1Pb/QZMbVPChuBw7fK+Y+UEIiqG7umUWpaS7L?=
 =?iso-8859-1?Q?4qF1/W+r6fuQO13R4+JmCL7YYlE3iQcrNjju9sXzzBFML1VzB+LliKYPIR?=
 =?iso-8859-1?Q?FuCQGO2uL4FbVqoHwISnF3VH7LjLL7vZ+yBx8nCAz9f11/t97mLa9gvMiH?=
 =?iso-8859-1?Q?fsrnFVrGhkUEUYx21jMp+NJR3XGYVpoQYWz+CZiB3z8O/qDkcBQA+c7awc?=
 =?iso-8859-1?Q?5LZBtjyeVUchzXrZfuxf8MgR2+PIvUgekLrxWVKccxqO+gAzZlsEgReUst?=
 =?iso-8859-1?Q?sLgeyAJDL8MX0p0VsoXf+x+n6h9LqHFVlvbH54Cqx7fDF8dnW8lQGv6Pv3?=
 =?iso-8859-1?Q?umWBR2R3kIhzoGxHqj3C9fR42/HMiR08zSQVO8a6u7No/a0VNnoLxbEyco?=
 =?iso-8859-1?Q?ti/JEurVmf/JCngnRpP2r4Qr9g2qb1OjxTYYu3gVt+j7djBM6uQLZtCa8g?=
 =?iso-8859-1?Q?uB0d4Mz/pbF2ftxvCnnBEO+dnybEpJ+pWdqeLNxdRwFlV5p8ZEPpT+2IxB?=
 =?iso-8859-1?Q?yfBhPf40++MDkunvvsaoqWCMllluvbRLfoOVdx2imnM56rnwgTenk54wZR?=
 =?iso-8859-1?Q?mA0Wfkix1F3sf7ZiDbYcnTSOzNnj0Z4ub20V2QYpQ3heg2g/qSNSsofQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a14ebd-2230-450c-1e6e-08dd7e2341fb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 02:46:45.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGTyqiYAQWf/OSv/OjB+DVVmDNqr2HTpnXrCp7Aru5LNDLzW+XUpT1gvZ9uO1I0Bf/BWqlEVEoTaWdUbGjsMHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 8.3% improvement of will-it-scale.per_process_ops on:


commit: 76a45d86f78bc61a27e382c287a3ed4f046755bb ("x86: prevent gcc from emitting rep movsq/stosq for inlined ops")
https://github.com/mjguzik/linux lkp-bench

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: page_fault3
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | lmbench3: lmbench3.TCP.socket.bandwidth.64B.MB/sec 3.7% improvement                         |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | mode=development                                                                            |
|                  | nr_threads=50%                                                                              |
|                  | test=TCP                                                                                    |
|                  | test_memory_size=50%                                                                        |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | lmbench3: lmbench3.syscall.open/close.latency.us 1.5% regression                            |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | mode=development                                                                            |
|                  | nr_threads=1                                                                                |
|                  | test=SYSCALL                                                                                |
|                  | test_memory_size=50%                                                                        |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.icache.ops_per_sec 3.4% improvement                                    |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory   |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=icache                                                                                 |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250418/202504181042.54ea2b8a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/page_fault3/will-it-scale

commit: 
  3b07108ada ("Merge tag 'linux_kselftest-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest")
  76a45d86f7 ("x86: prevent gcc from emitting rep movsq/stosq for inlined ops")

3b07108ada81a8eb 76a45d86f78bc61a27e382c287a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.831e+08            +8.3%  1.982e+08        will-it-scale.224.processes
    817312            +8.3%     884836        will-it-scale.per_process_ops
 1.831e+08            +8.3%  1.982e+08        will-it-scale.workload
 1.199e+08            +7.6%  1.291e+08        proc-vmstat.numa_hit
 1.196e+08            +7.7%  1.287e+08        proc-vmstat.numa_local
 1.201e+08            +7.6%  1.293e+08        proc-vmstat.pgalloc_normal
 5.507e+10            +8.3%  5.962e+10        proc-vmstat.pgfault
 1.184e+08 ±  2%      +8.8%  1.288e+08        proc-vmstat.pgfree
      0.99            -3.0%       0.96        perf-stat.i.MPKI
 1.093e+11            +9.9%    1.2e+11        perf-stat.i.branch-instructions
      0.11            +0.0        0.11        perf-stat.i.branch-miss-rate%
 1.011e+08           +17.4%  1.187e+08        perf-stat.i.branch-misses
 5.488e+08            +8.0%  5.929e+08        perf-stat.i.cache-misses
 6.914e+08            +8.0%  7.466e+08        perf-stat.i.cache-references
      1.38           -10.5%       1.23        perf-stat.i.cpi
      1388            -7.6%       1282        perf-stat.i.cycles-between-cache-misses
  5.54e+11           +11.5%  6.176e+11        perf-stat.i.instructions
      0.73           +11.7%       0.81        perf-stat.i.ipc
      1626            +8.3%       1760        perf-stat.i.metric.K/sec
 1.822e+08            +8.3%  1.972e+08        perf-stat.i.minor-faults
 1.822e+08            +8.3%  1.972e+08        perf-stat.i.page-faults
      0.99            -3.1%       0.96        perf-stat.overall.MPKI
      0.09            +0.0        0.10        perf-stat.overall.branch-miss-rate%
      1.38           -10.5%       1.23        perf-stat.overall.cpi
      1390            -7.6%       1284        perf-stat.overall.cycles-between-cache-misses
      0.73           +11.7%       0.81        perf-stat.overall.ipc
    913121            +3.0%     940467        perf-stat.overall.path-length
 1.089e+11            +9.9%  1.196e+11        perf-stat.ps.branch-instructions
 1.008e+08           +17.4%  1.183e+08        perf-stat.ps.branch-misses
  5.47e+08            +8.0%  5.909e+08        perf-stat.ps.cache-misses
 6.891e+08            +8.0%  7.441e+08        perf-stat.ps.cache-references
 5.521e+11           +11.5%  6.155e+11        perf-stat.ps.instructions
 1.816e+08            +8.3%  1.966e+08        perf-stat.ps.minor-faults
 1.816e+08            +8.3%  1.966e+08        perf-stat.ps.page-faults
 1.672e+14           +11.5%  1.864e+14        perf-stat.total.instructions
      6.56            -5.4        1.16        perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.testcase
     75.84            -2.3       73.50        perf-profile.calltrace.cycles-pp.testcase
      5.01            -0.5        4.56        perf-profile.calltrace.cycles-pp.lock_vma_under_rcu.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      0.57            +0.0        0.59        perf-profile.calltrace.cycles-pp.___pte_offset_map.pte_offset_map_rw_nolock.handle_pte_fault.__handle_mm_fault.handle_mm_fault
      0.58            +0.0        0.60        perf-profile.calltrace.cycles-pp.access_error.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      0.92            +0.0        0.96        perf-profile.calltrace.cycles-pp.pte_offset_map_rw_nolock.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.21            +0.0        2.25        perf-profile.calltrace.cycles-pp.__perf_sw_event.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      0.66            +0.1        0.71        perf-profile.calltrace.cycles-pp.folio_unlock.fault_dirty_shared_page.do_shared_fault.do_pte_missing.__handle_mm_fault
      1.46            +0.1        1.52        perf-profile.calltrace.cycles-pp.___perf_sw_event.__perf_sw_event.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.71            +0.1        0.77        perf-profile.calltrace.cycles-pp._raw_spin_lock.__pte_offset_map_lock.finish_fault.do_shared_fault.do_pte_missing
      1.60            +0.1        1.66        perf-profile.calltrace.cycles-pp.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.63            +0.1        0.70        perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range
      0.84            +0.1        0.92        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault.testcase
      1.46            +0.1        1.56        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.fault_dirty_shared_page.do_shared_fault.do_pte_missing
      1.71            +0.1        1.81        perf-profile.calltrace.cycles-pp.__pte_offset_map_lock.finish_fault.do_shared_fault.do_pte_missing.__handle_mm_fault
      0.93            +0.1        1.03        perf-profile.calltrace.cycles-pp.__mod_memcg_lruvec_state.__lruvec_stat_mod_folio.folio_remove_rmap_ptes.tlb_flush_rmap_batch.tlb_flush_rmaps
      0.95            +0.1        1.05        perf-profile.calltrace.cycles-pp.error_entry.testcase
      1.66            +0.1        1.77        perf-profile.calltrace.cycles-pp.file_update_time.fault_dirty_shared_page.do_shared_fault.do_pte_missing.__handle_mm_fault
      0.97            +0.1        1.07        perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      0.99            +0.1        1.10        perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range
      0.99            +0.1        1.10        perf-profile.calltrace.cycles-pp.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      1.42            +0.1        1.54        perf-profile.calltrace.cycles-pp.___perf_sw_event.__perf_sw_event.handle_mm_fault.do_user_addr_fault.exc_page_fault
      1.51            +0.2        1.67        perf-profile.calltrace.cycles-pp.__lruvec_stat_mod_folio.folio_remove_rmap_ptes.tlb_flush_rmap_batch.tlb_flush_rmaps.zap_pte_range
      2.08            +0.2        2.27        perf-profile.calltrace.cycles-pp.__perf_sw_event.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.71            +0.2        2.90        perf-profile.calltrace.cycles-pp.mas_walk.lock_vma_under_rcu.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.46            +0.2        2.66        perf-profile.calltrace.cycles-pp.tlb_flush_rmap_batch.tlb_flush_rmaps.zap_pte_range.zap_pmd_range.unmap_page_range
      2.28            +0.2        2.49        perf-profile.calltrace.cycles-pp.folio_remove_rmap_ptes.tlb_flush_rmap_batch.tlb_flush_rmaps.zap_pte_range.zap_pmd_range
      2.48            +0.2        2.68        perf-profile.calltrace.cycles-pp.tlb_flush_rmaps.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      2.73            +0.2        2.94        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.shmem_get_folio_gfp.shmem_fault.__do_fault
      3.40            +0.3        3.65        perf-profile.calltrace.cycles-pp.fault_dirty_shared_page.do_shared_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      4.28 ±  3%      +0.3        4.56 ±  3%  perf-profile.calltrace.cycles-pp.set_pte_range.finish_fault.do_shared_fault.do_pte_missing.__handle_mm_fault
      2.99            +0.3        3.34        perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      8.47            +0.6        9.04        perf-profile.calltrace.cycles-pp.finish_fault.do_shared_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      6.49            +0.6        7.11        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_fault.__do_fault.do_shared_fault
    106.00            +0.6      106.64        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.testcase
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      7.05            +0.7        7.76        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.__munmap
      7.10            +0.7        7.82        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.09            +0.7        7.81        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      7.09            +0.7        7.81        perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      7.09            +0.7        7.81        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      7.11            +0.7        7.83        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      7.10            +0.7        7.82        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      8.32            +0.8        9.08        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_shared_fault.do_pte_missing
      9.07            +0.8        9.89        perf-profile.calltrace.cycles-pp.shmem_fault.__do_fault.do_shared_fault.do_pte_missing.__handle_mm_fault
      9.57            +0.9       10.42        perf-profile.calltrace.cycles-pp.__do_fault.do_shared_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
     44.51            +1.3       45.83        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.testcase
     27.32            +1.4       28.76        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     43.61            +1.5       45.07        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     22.07            +1.7       23.78        perf-profile.calltrace.cycles-pp.do_shared_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     22.67            +1.8       24.42        perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     33.46            +1.9       35.35        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      6.75            -5.6        1.16        perf-profile.children.cycles-pp.sync_regs
     79.90            -1.8       78.06        perf-profile.children.cycles-pp.asm_exc_page_fault
     92.80            -0.7       92.08        perf-profile.children.cycles-pp.testcase
      5.06            -0.4        4.61        perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.18 ±  2%      -0.0        0.17        perf-profile.children.cycles-pp.irqentry_enter
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.22            +0.0        0.24        perf-profile.children.cycles-pp.__cond_resched
      0.21 ±  2%      +0.0        0.23        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.11 ±  4%      +0.0        0.13        perf-profile.children.cycles-pp.free_swap_cache
      0.10 ±  5%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.queued_spin_unlock
      0.22 ±  2%      +0.0        0.24        perf-profile.children.cycles-pp.pte_alloc_one
      0.21 ±  2%      +0.0        0.23        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.21 ±  2%      +0.0        0.23        perf-profile.children.cycles-pp.alloc_pages_noprof
      0.31 ±  2%      +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.perf_exclude_event
      0.18            +0.0        0.20        perf-profile.children.cycles-pp.__tlb_remove_folio_pages_size
      0.43            +0.0        0.46        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64_mg
      0.26 ±  3%      +0.0        0.29        perf-profile.children.cycles-pp.folio_mapping
      0.20            +0.0        0.23 ±  2%  perf-profile.children.cycles-pp.vm_normal_page
      0.20            +0.0        0.23        perf-profile.children.cycles-pp.folio_mark_accessed
      1.03            +0.0        1.06        perf-profile.children.cycles-pp.___pte_offset_map
      0.64            +0.0        0.67        perf-profile.children.cycles-pp.access_error
      0.32            +0.0        0.35        perf-profile.children.cycles-pp.__irqentry_text_end
      0.98            +0.0        1.02        perf-profile.children.cycles-pp.pte_offset_map_rw_nolock
      0.66            +0.1        0.71        perf-profile.children.cycles-pp.folio_unlock
      0.29 ±  2%      +0.1        0.34        perf-profile.children.cycles-pp.noop_dirty_folio
      0.76            +0.1        0.83        perf-profile.children.cycles-pp._raw_spin_lock
      1.62            +0.1        1.68        perf-profile.children.cycles-pp.handle_pte_fault
      0.63            +0.1        0.70        perf-profile.children.cycles-pp.folios_put_refs
      0.69 ±  2%      +0.1        0.77        perf-profile.children.cycles-pp.folio_mark_dirty
      0.70            +0.1        0.78        perf-profile.children.cycles-pp.__mod_node_page_state
      0.85            +0.1        0.93        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      1.52            +0.1        1.61        perf-profile.children.cycles-pp.inode_needs_update_time
      1.78            +0.1        1.88        perf-profile.children.cycles-pp.__pte_offset_map_lock
      1.70            +0.1        1.81        perf-profile.children.cycles-pp.file_update_time
      0.99            +0.1        1.10        perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.99            +0.1        1.10        perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.99            +0.1        1.10        perf-profile.children.cycles-pp.tlb_flush_mmu
      1.12            +0.1        1.26        perf-profile.children.cycles-pp.error_entry
      2.74            +0.2        2.94        perf-profile.children.cycles-pp.mas_walk
      3.03            +0.2        3.23        perf-profile.children.cycles-pp.___perf_sw_event
      2.48            +0.2        2.68        perf-profile.children.cycles-pp.tlb_flush_rmaps
      2.32            +0.2        2.52        perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      2.48            +0.2        2.68        perf-profile.children.cycles-pp.tlb_flush_rmap_batch
      2.76            +0.2        2.98        perf-profile.children.cycles-pp.xas_load
      4.33            +0.2        4.56        perf-profile.children.cycles-pp.__perf_sw_event
      3.47            +0.3        3.74        perf-profile.children.cycles-pp.fault_dirty_shared_page
      4.35 ±  3%      +0.3        4.63 ±  2%  perf-profile.children.cycles-pp.set_pte_range
      3.07            +0.4        3.42        perf-profile.children.cycles-pp.zap_present_ptes
      8.59            +0.6        9.16        perf-profile.children.cycles-pp.finish_fault
      6.52            +0.6        7.15        perf-profile.children.cycles-pp.filemap_get_entry
      7.12            +0.7        7.83        perf-profile.children.cycles-pp.__munmap
      7.09            +0.7        7.81        perf-profile.children.cycles-pp.unmap_vmas
      7.10            +0.7        7.82        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      7.09            +0.7        7.81        perf-profile.children.cycles-pp.zap_pte_range
      7.11            +0.7        7.83        perf-profile.children.cycles-pp.do_vmi_align_munmap
      7.11            +0.7        7.83        perf-profile.children.cycles-pp.do_vmi_munmap
      7.09            +0.7        7.81        perf-profile.children.cycles-pp.unmap_page_range
      7.09            +0.7        7.81        perf-profile.children.cycles-pp.zap_pmd_range
      7.17            +0.7        7.89        perf-profile.children.cycles-pp.do_syscall_64
      7.11            +0.7        7.83        perf-profile.children.cycles-pp.__vm_munmap
      7.11            +0.7        7.83        perf-profile.children.cycles-pp.__x64_sys_munmap
      7.10            +0.7        7.82        perf-profile.children.cycles-pp.vms_clear_ptes
      7.17            +0.7        7.89        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      8.35            +0.8        9.11        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      9.37            +0.8       10.18        perf-profile.children.cycles-pp.native_irq_return_iret
      9.10            +0.8        9.92        perf-profile.children.cycles-pp.shmem_fault
      9.60            +0.9       10.45        perf-profile.children.cycles-pp.__do_fault
     44.64            +1.3       45.90        perf-profile.children.cycles-pp.exc_page_fault
     27.47            +1.4       28.91        perf-profile.children.cycles-pp.__handle_mm_fault
     43.78            +1.4       45.23        perf-profile.children.cycles-pp.do_user_addr_fault
     22.14            +1.7       23.85        perf-profile.children.cycles-pp.do_shared_fault
     22.69            +1.8       24.44        perf-profile.children.cycles-pp.do_pte_missing
     33.56            +1.9       35.46        perf-profile.children.cycles-pp.handle_mm_fault
      6.72            -5.6        1.11        perf-profile.self.cycles-pp.sync_regs
      2.27            -0.6        1.64        perf-profile.self.cycles-pp.lock_vma_under_rcu
      3.17            -0.4        2.78        perf-profile.self.cycles-pp.__handle_mm_fault
      0.72            -0.2        0.54        perf-profile.self.cycles-pp.exc_page_fault
      1.32            -0.1        1.23        perf-profile.self.cycles-pp.asm_exc_page_fault
      0.09            +0.0        0.10        perf-profile.self.cycles-pp.clear_page_erms
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.error_return
      0.07 ±  6%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.queued_spin_unlock
      0.10 ±  4%      +0.0        0.11        perf-profile.self.cycles-pp.free_swap_cache
      0.23 ±  3%      +0.0        0.25        perf-profile.self.cycles-pp.folio_mapping
      0.16 ±  2%      +0.0        0.18        perf-profile.self.cycles-pp.__tlb_remove_folio_pages_size
      0.44            +0.0        0.46        perf-profile.self.cycles-pp.pte_offset_map_rw_nolock
      0.18            +0.0        0.20        perf-profile.self.cycles-pp.folio_mark_accessed
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.vm_normal_page
      0.40            +0.0        0.42        perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64_mg
      0.26            +0.0        0.28        perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.96            +0.0        0.98        perf-profile.self.cycles-pp.___pte_offset_map
      0.56            +0.0        0.59        perf-profile.self.cycles-pp.handle_pte_fault
      0.62            +0.0        0.65        perf-profile.self.cycles-pp.access_error
      0.30            +0.0        0.34        perf-profile.self.cycles-pp.__irqentry_text_end
      0.59            +0.0        0.63        perf-profile.self.cycles-pp.__pte_offset_map_lock
      1.25            +0.0        1.29        perf-profile.self.cycles-pp.__perf_sw_event
      0.76            +0.0        0.81        perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.54 ±  2%      +0.0        0.59 ±  2%  perf-profile.self.cycles-pp.do_pte_missing
      0.43 ±  2%      +0.0        0.48        perf-profile.self.cycles-pp.folio_mark_dirty
      0.62            +0.1        0.67        perf-profile.self.cycles-pp.folio_unlock
      0.25 ±  2%      +0.1        0.30        perf-profile.self.cycles-pp.noop_dirty_folio
      0.53            +0.1        0.58        perf-profile.self.cycles-pp.zap_pte_range
      0.73 ±  2%      +0.1        0.79        perf-profile.self.cycles-pp.shmem_fault
      0.72            +0.1        0.79        perf-profile.self.cycles-pp._raw_spin_lock
      0.83 ±  2%      +0.1        0.89        perf-profile.self.cycles-pp.folio_add_file_rmap_ptes
      0.62            +0.1        0.69        perf-profile.self.cycles-pp.folios_put_refs
      0.67            +0.1        0.74        perf-profile.self.cycles-pp.__mod_node_page_state
      0.79            +0.1        0.87        perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      1.62            +0.1        1.73        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      1.76            +0.1        1.89        perf-profile.self.cycles-pp.finish_fault
      1.04            +0.1        1.17        perf-profile.self.cycles-pp.error_entry
      2.74            +0.2        2.91        perf-profile.self.cycles-pp.handle_mm_fault
      2.27            +0.2        2.45        perf-profile.self.cycles-pp.___perf_sw_event
      2.71            +0.2        2.89        perf-profile.self.cycles-pp.mas_walk
      2.26            +0.2        2.45        perf-profile.self.cycles-pp.xas_load
      2.15            +0.2        2.38        perf-profile.self.cycles-pp.zap_present_ptes
      3.74            +0.4        4.16        perf-profile.self.cycles-pp.filemap_get_entry
      9.36            +0.8       10.16        perf-profile.self.cycles-pp.native_irq_return_iret
     28.42            +2.6       31.02        perf-profile.self.cycles-pp.testcase


***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase:
  gcc-12/performance/x86_64-rhel-9.4/development/50%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/TCP/50%/lmbench3

commit: 
  3b07108ada ("Merge tag 'linux_kselftest-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest")
  76a45d86f7 ("x86: prevent gcc from emitting rep movsq/stosq for inlined ops")

3b07108ada81a8eb 76a45d86f78bc61a27e382c287a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     16039            +3.7%      16639        lmbench3.TCP.socket.bandwidth.64B.MB/sec
      4.85 ±  2%      -1.7        3.18 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_bh.release_sock.tcp_sendmsg.sock_write_iter.vfs_write
      2.65            -0.5        2.16        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      2.22            -0.5        1.76        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      1.54            -0.4        1.16        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.76            -0.1        2.62 ±  2%  perf-profile.calltrace.cycles-pp.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.sock_write_iter.vfs_write
      2.04 ±  2%      -0.1        1.92 ±  2%  perf-profile.calltrace.cycles-pp.tcp_current_mss.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.sock_write_iter
      0.61            -0.0        0.58        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.tcp_recvmsg.inet_recvmsg.sock_recvmsg.sock_read_iter
      0.66            -0.0        0.64        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.tcp_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.73            +0.0        0.74        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.71            +0.0        0.74        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.59            +0.0        0.61        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.write
      0.56            +0.0        0.59        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.read
      1.83            +0.0        1.87        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.84            +0.0        0.88        perf-profile.calltrace.cycles-pp._raw_spin_lock_bh.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.02            +0.0        2.07        perf-profile.calltrace.cycles-pp.ktime_get.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      1.52            +0.0        1.57        perf-profile.calltrace.cycles-pp.read_tsc.ktime_get.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked
      1.91            +0.0        1.96        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.50            +0.1        1.58        perf-profile.calltrace.cycles-pp.read_tsc.ktime_get.tcp_mstamp_refresh.tcp_rcv_space_adjust.tcp_recvmsg_locked
      0.67            +0.1        0.74 ±  4%  perf-profile.calltrace.cycles-pp.__virt_addr_valid.check_heap_object.__check_object_size.skb_do_copy_data_nocache.tcp_sendmsg_locked
      1.89            +0.1        1.97        perf-profile.calltrace.cycles-pp.ktime_get.tcp_mstamp_refresh.tcp_rcv_space_adjust.tcp_recvmsg_locked.tcp_recvmsg
      2.21            +0.1        2.31        perf-profile.calltrace.cycles-pp.tcp_mstamp_refresh.tcp_rcv_space_adjust.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      2.63            +0.1        2.74        perf-profile.calltrace.cycles-pp.tcp_rcv_space_adjust.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      1.64            +0.1        1.78        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg
      2.38            +0.1        2.52        perf-profile.calltrace.cycles-pp.__check_object_size.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_write_iter
      6.00            +0.2        6.18        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      3.06            +0.2        3.27        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_write_iter
      5.78            +0.3        6.06        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
      6.06            +0.4        6.42        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_write_iter.vfs_write
     32.23            +0.5       32.69        perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      6.06 ±  2%      +1.4        7.46        perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.sock_write_iter.vfs_write.ksys_write
      7.64            -0.7        6.91        perf-profile.children.cycles-pp._raw_spin_lock_bh
      2.80            -0.5        2.31        perf-profile.children.cycles-pp.simple_copy_to_iter
     83.66            -0.4       83.25        perf-profile.children.cycles-pp.do_syscall_64
     84.74            -0.4       84.35        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.31            -0.3        4.97        perf-profile.children.cycles-pp.__check_object_size
      3.46            -0.3        3.19        perf-profile.children.cycles-pp.check_heap_object
      2.85            -0.1        2.71 ±  2%  perf-profile.children.cycles-pp.tcp_send_mss
      2.26 ±  2%      -0.1        2.14 ±  2%  perf-profile.children.cycles-pp.tcp_current_mss
      0.91            -0.1        0.80        perf-profile.children.cycles-pp.__cond_resched
      1.32            -0.1        1.21 ±  2%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.27 ±  6%      -0.1        0.18 ± 10%  perf-profile.children.cycles-pp.__alloc_skb
      0.49            -0.1        0.43        perf-profile.children.cycles-pp.rcu_all_qs
      0.16 ±  8%      -0.1        0.11 ± 10%  perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      0.12 ±  6%      -0.0        0.09 ±  8%  perf-profile.children.cycles-pp.__tcp_send_ack
      0.36            -0.0        0.34        perf-profile.children.cycles-pp.is_vmalloc_addr
      0.50            -0.0        0.48        perf-profile.children.cycles-pp.tcp_push
      0.19 ±  2%      +0.0        0.21 ±  2%  perf-profile.children.cycles-pp.read@plt
      0.04 ± 33%      +0.0        0.06        perf-profile.children.cycles-pp.kfree_skbmem
      0.18 ±  2%      +0.0        0.20        perf-profile.children.cycles-pp.inet_send_prepare
      0.67            +0.0        0.68        perf-profile.children.cycles-pp.security_file_permission
      1.04            +0.0        1.06        perf-profile.children.cycles-pp.x64_sys_call
      0.40            +0.0        0.43 ±  2%  perf-profile.children.cycles-pp.source
      0.47 ±  2%      +0.0        0.50        perf-profile.children.cycles-pp.inet_sendmsg
      0.47 ±  2%      +0.0        0.50 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.48 ±  2%      +0.0        0.51 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.56            +0.0        0.60        perf-profile.children.cycles-pp.loop_transfer
      1.66            +0.1        1.71        perf-profile.children.cycles-pp.rw_verify_area
      0.35            +0.1        0.40        perf-profile.children.cycles-pp.security_socket_sendmsg
      1.17            +0.1        1.22        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.37            +0.1        0.43        perf-profile.children.cycles-pp.security_socket_recvmsg
      3.95            +0.1        4.04        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.93            +0.1        3.02        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.36            +0.1        2.46        perf-profile.children.cycles-pp.tcp_mstamp_refresh
      2.72            +0.1        2.83        perf-profile.children.cycles-pp.tcp_rcv_space_adjust
      3.21            +0.1        3.33        perf-profile.children.cycles-pp.read_tsc
      4.41            +0.1        4.55        perf-profile.children.cycles-pp.ktime_get
      3.11            +0.2        3.32        perf-profile.children.cycles-pp._copy_from_iter
      6.96            +0.2        7.21        perf-profile.children.cycles-pp.entry_SYSCALL_64
      6.25            +0.4        6.61        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
     32.48            +0.5       32.94        perf-profile.children.cycles-pp.tcp_sendmsg
      9.63            +0.6       10.22        perf-profile.children.cycles-pp.release_sock
      1.74            -0.6        1.15        perf-profile.self.cycles-pp.sock_read_iter
      2.22            -0.5        1.72        perf-profile.self.cycles-pp.sock_write_iter
      1.76            -0.1        1.63        perf-profile.self.cycles-pp.check_heap_object
      1.21 ±  2%      -0.1        1.11 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      1.19            -0.1        1.11        perf-profile.self.cycles-pp.__skb_datagram_iter
      3.85            -0.1        3.78        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      1.46 ±  2%      -0.1        1.39        perf-profile.self.cycles-pp.__check_object_size
      1.32            -0.1        1.26        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.55            -0.1        0.49        perf-profile.self.cycles-pp.lock_sock_nested
      0.50            -0.1        0.44        perf-profile.self.cycles-pp.__cond_resched
      0.38 ±  9%      -0.0        0.33 ±  4%  perf-profile.self.cycles-pp.tcp_rate_check_app_limited
      0.83            -0.0        0.79        perf-profile.self.cycles-pp.tcp_current_mss
      0.30            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.66            -0.0        0.63        perf-profile.self.cycles-pp.tcp_tso_segs
      0.12 ±  4%      -0.0        0.10 ±  6%  perf-profile.self.cycles-pp.tcp_ack
      0.27            -0.0        0.25        perf-profile.self.cycles-pp.is_vmalloc_addr
      0.35            -0.0        0.34        perf-profile.self.cycles-pp._raw_spin_unlock_bh
      0.40            -0.0        0.39        perf-profile.self.cycles-pp.tcp_push
      0.11            +0.0        0.12        perf-profile.self.cycles-pp.__x64_sys_read
      0.55            +0.0        0.57        perf-profile.self.cycles-pp.security_file_permission
      0.36            +0.0        0.37        perf-profile.self.cycles-pp.tcp_release_cb
      0.38            +0.0        0.39        perf-profile.self.cycles-pp.tcp_rcv_space_adjust
      0.28            +0.0        0.30        perf-profile.self.cycles-pp.tcp_mstamp_refresh
      0.93            +0.0        0.95        perf-profile.self.cycles-pp.x64_sys_call
      0.77            +0.0        0.79        perf-profile.self.cycles-pp.ksys_write
      0.04 ± 50%      +0.0        0.06        perf-profile.self.cycles-pp.kfree_skbmem
      1.18            +0.0        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.30            +0.0        0.33 ±  2%  perf-profile.self.cycles-pp.source
      0.37            +0.0        0.40        perf-profile.self.cycles-pp.inet_recvmsg
      0.58            +0.0        0.61        perf-profile.self.cycles-pp.sock_recvmsg
      0.76            +0.0        0.79        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.25            +0.0        0.28        perf-profile.self.cycles-pp.security_socket_sendmsg
      0.98            +0.0        1.01        perf-profile.self.cycles-pp.rw_verify_area
      1.82            +0.0        1.86        perf-profile.self.cycles-pp.do_syscall_64
      1.69            +0.0        1.73        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.45            +0.0        0.49        perf-profile.self.cycles-pp.loop_transfer
      0.26            +0.1        0.32        perf-profile.self.cycles-pp.security_socket_recvmsg
      3.33            +0.1        3.40        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      3.03            +0.1        3.10        perf-profile.self.cycles-pp.write
      2.85            +0.1        2.94        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.00            +0.1        3.11        perf-profile.self.cycles-pp.read_tsc
      2.98            +0.1        3.09        perf-profile.self.cycles-pp.read
      4.48            +0.1        4.60        perf-profile.self.cycles-pp._raw_spin_lock_bh
      2.99            +0.2        3.20        perf-profile.self.cycles-pp._copy_from_iter
      4.48 ±  2%      +0.4        4.92 ±  3%  perf-profile.self.cycles-pp.release_sock



***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase:
  gcc-12/performance/x86_64-rhel-9.4/development/1/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/SYSCALL/50%/lmbench3

commit: 
  3b07108ada ("Merge tag 'linux_kselftest-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest")
  76a45d86f7 ("x86: prevent gcc from emitting rep movsq/stosq for inlined ops")

3b07108ada81a8eb 76a45d86f78bc61a27e382c287a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  44464148 ±  5%      -4.0%   42700356        perf-stat.ps.cache-misses
      0.13            -4.3%       0.12        lmbench3.syscall.fstat.latency.us
      0.47            +1.5%       0.48        lmbench3.syscall.open/close.latency.us
      2.08 ± 57%      +1.8        3.88 ± 32%  perf-profile.calltrace.cycles-pp.open64
      3.54 ± 56%      +2.6        6.17 ± 17%  perf-profile.calltrace.cycles-pp.get_cpu_sleep_time_us.get_idle_time.uptime_proc_show.seq_read_iter.vfs_read
      4.15 ± 57%      +2.7        6.90 ± 18%  perf-profile.calltrace.cycles-pp.get_idle_time.uptime_proc_show.seq_read_iter.vfs_read.ksys_read
      2.15 ± 58%      +1.8        3.96 ± 32%  perf-profile.children.cycles-pp.open64
      3.54 ± 56%      +2.7        6.25 ± 16%  perf-profile.children.cycles-pp.get_cpu_sleep_time_us
      4.15 ± 57%      +2.7        6.90 ± 18%  perf-profile.children.cycles-pp.get_idle_time
      2.58 ± 60%      +2.1        4.64 ± 17%  perf-profile.self.cycles-pp.get_cpu_sleep_time_us



***************************************************************************************************
lkp-icl-2sp7: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/icache/stress-ng/60s

commit: 
  3b07108ada ("Merge tag 'linux_kselftest-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest")
  76a45d86f7 ("x86: prevent gcc from emitting rep movsq/stosq for inlined ops")

3b07108ada81a8eb 76a45d86f78bc61a27e382c287a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    144451 ± 20%     +60.0%     231102 ± 28%  proc-vmstat.numa_pte_updates
    602712 ±  6%     +13.7%     685178 ±  8%  proc-vmstat.pgfault
   1140689            +3.4%    1179295        stress-ng.icache.ops
     19011            +3.4%      19654        stress-ng.icache.ops_per_sec
 3.932e+10            +4.0%   4.09e+10        perf-stat.i.branch-instructions
      1.02            -4.2%       0.98        perf-stat.i.cpi
  1.91e+11            +4.5%  1.995e+11        perf-stat.i.instructions
      0.98            +4.4%       1.02        perf-stat.i.ipc
      7998 ±  8%     +16.3%       9301 ±  9%  perf-stat.i.minor-faults
      7998 ±  8%     +16.3%       9301 ±  9%  perf-stat.i.page-faults
      1.02            -4.1%       0.98        perf-stat.overall.cpi
      0.98            +4.3%       1.02        perf-stat.overall.ipc
 3.862e+10            +4.0%  4.018e+10        perf-stat.ps.branch-instructions
 1.876e+11            +4.5%   1.96e+11        perf-stat.ps.instructions
      7789 ±  7%     +17.5%       9148 ±  9%  perf-stat.ps.minor-faults
      7789 ±  7%     +17.5%       9149 ±  9%  perf-stat.ps.page-faults
 1.157e+13            +3.9%  1.202e+13        perf-stat.total.instructions





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


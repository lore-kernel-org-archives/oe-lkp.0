Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B024BD1A
	for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 06:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764311439; cv=fail; b=m+4TNGL0H8KB+gbhr4e1I42I506LKFePuxVe9KyjHflOn6v+DRS6QIzMKCI09ir3sB/3JmnTIPg/+eolIxKn+kHKxYJ87PZMLKo2tkwzc71YSwBXcpmD3rlUMTcZpMA2PWn1iN1v6TZ30R0o/xAr/lGppWEm7cycZj26qAQtfQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764311439; c=relaxed/simple;
	bh=RErS1exQd8iNV/OfUYGqhsWU7TBZlEWkkOnCEeW7dNo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ix9EBzqd8AYms2vPvePGOzrDbKKwIPomqAC4lbuGI5KGBjLPavamLA54JHst4UrtjCDmNCS67Hk9W1YTURIQ6MLv2BakX0ANEacgcZi6TDpV5CXoyO/O9iFWKbQO7WZ4x0AKJpwI0gNvOYFr1Vffj0M8J+OS/U0TzXaXfUmvJLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVVqEjh6; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVVqEjh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764311437; x=1795847437;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=RErS1exQd8iNV/OfUYGqhsWU7TBZlEWkkOnCEeW7dNo=;
  b=TVVqEjh6bAMj/rL0PmoIecDYK60cCnJRGJEMk3vrMic+zqiF9TSCxtZu
   9uNopHE38grVVsLM7DyGC05nu3k2gMWxDKksXeVSAAFYxmVj5tCH0iCvQ
   uoR2fvXzqdoVrhiEgwnfbfV1TI8zH2a30GQTEQF/dwCv5bT+odX6cuxYS
   tzCykiDWnC/RLuUJRKlgVOf86sPPn+k/XGQ4tt8QnZBXvHNZxn4BR3ava
   0roYXE1EzZ5PBJHFcYcCa/YOlrq0SwKJ33gwi3UJO1MrD5l7FNH+SI4g+
   jU09lWaRuTtDd8ai4PmezMWJuY4tNX8mt1OOW9IKV3duhxKlzYRupYO8t
   g==;
X-CSE-ConnectionGUID: 4+o+ijNmQxabyf+zh4zpbQ==
X-CSE-MsgGUID: EAdpsBLrRhSs/PKTQvj4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65532643"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="65532643"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:30:36 -0800
X-CSE-ConnectionGUID: JbAT1BS8QKCOS/O/Gk7YZA==
X-CSE-MsgGUID: zEF0hskNRhiCrvD53hByDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197715303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:30:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:30:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 22:30:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:30:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3IsTHK49nKUDb66GZHWJkkvq3D9z2osbFmJda7vQL3EMS6VJCmASpy5jHdJctuKVRJ7/LXSwksTjx9pYh/1l0Dhjmofqo4NZbCQ9+tGERctAJZhiWjDoqLGJHycaIhipZziqYfo9lFhAgW/YqHannj1ZFbAE69j89+8vLWxBkc2OMxS6XVJZOzpouRQceS6JvRbhAuWCsWiNwpOKGfS0IExwg6FENtx9sGworyA+ffKpy7QTSewiDtugwtxG2FJ02nK4zap/yj+P4751pVWi0m6UvRWF8h+LcJY8cjwBueZKm1XMeE44dETnY/gzmHUgqfh8X7bjw2AwhfgseHgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZWDUe1wHox7WsAV63FSRfu51altX/1dUJYFZqGwoHM=;
 b=TbtZtq5LbixyhIPm/UsgONj6Ctf7qpdy9Z7jzDg9wtaNocjGoi3GrbVsoMBg281MTJjFWPnqwOqZ2ZsIo3QFvw2OVES+EXy+U/uf/cVq73yU9OTlrOvwcXyZhbii7WzjRFWv7awbkTagTdxDp1NtV1iYOS6asHdSzqeCsGbHVU/2ZKuY/EYjU+Ws7W2RO8iHnM/bSOsnwD/XHvYaSVP3wcD+J5baCYAx28GpU+PV2y2Icm7LcMvO8L8NyfVDu46fA4mThd8D5RwcZOe1JDVQqc3d5pcZLpBgQbmAaTIYDPbWL8HKPTU2m6mBpC/fw7pc6kGHlAkru8GfMQiV0x+DkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 06:30:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:30:31 +0000
Date: Fri, 28 Nov 2025 14:30:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, Mateusz Guzik <mjguzik@gmail.com>,
	<oliver.sang@intel.com>
Subject: [linus:master] [x86]  284922f4c5:  stress-ng.sockfd.ops_per_sec 6.1%
 improvement
Message-ID: <202511281306.51105b46-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a8db08-6d37-4494-e10b-08de2e47a14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?v0ec2oZb/LuR+Onyfak1WZtuQM7R1UKX7PIHK6CqE76wQHe066KV1aM/yt?=
 =?iso-8859-1?Q?jW5PpJfPcUR1Wi2jfDMCkCNT8L/FD7UnA+PeAOrR5HT8RkN+EvHvLO3cGz?=
 =?iso-8859-1?Q?94iBF6hXG67gCPxN/O32R0uJntRWgn24mNImovXKcIuSf/KaRYe/IvhCLf?=
 =?iso-8859-1?Q?LXGTIwzijEHfvc5UoBHKNJSlFFqTOAuObFjjUM9MT9ggflyk6HKJp0sbxt?=
 =?iso-8859-1?Q?eu5e3b0ucpOJE+xQnd8m1pNAeWbnNYQp4xug/qRMdBDNpItTMW5xR5IYYo?=
 =?iso-8859-1?Q?syd+z8HoJx3oaM4DKpkt8lyuJ7cF0Y8RFiH/HmmukpXW9fDcFidhEKso9V?=
 =?iso-8859-1?Q?7UizK2rd8J9A1us719BMzIwL9+2V2gw1W2ae5mhY0j7HbjXY/1sjzxgmmp?=
 =?iso-8859-1?Q?EeLoiKNu9FNBtdv+PO//xBkM/RKRW0asFygdhKciviDqDFO22XktKfbqEM?=
 =?iso-8859-1?Q?8hCBXUUNpG7Kln0739RkFSXtHqxgKql/QMdv36+cQRXeOjMs1YCHM9y7ZH?=
 =?iso-8859-1?Q?9b9cWfl9/hEOcdgU5CED4c22+FGXdHBgkygfYBMnkMoMirwbZsLt9bynyR?=
 =?iso-8859-1?Q?uyJUTnMOypvn4Hx/0kXQc5R/eSJSfsjJV0G296eJ/jcZ4WN/MkbgREz1Bm?=
 =?iso-8859-1?Q?Y5wXvMDltpiIsn9h80dhdARfVHRrGQMNsZnGNSZeyLhE04TXUwVxSunS4Y?=
 =?iso-8859-1?Q?+SxO6tEF1YzKufJkLtuLFJFX5xmu+R6VlWQPfE9BGq/t2vL1/vN1uZnJyG?=
 =?iso-8859-1?Q?XgDmKIUjCK8H47Z24yeEJyKvDDGcaX6I9eJ8h28MEPwDDwCqIxyIt6rLOQ?=
 =?iso-8859-1?Q?lf5tQN7e4snI8KscrFhRa71NP452PBX6ThcXS8aK7HKrq0CARkH8HCqGUD?=
 =?iso-8859-1?Q?F9lgizhwg8OLiy7sr6KG3aJ24/CoNPZNuJq3oOVh5+BQO8Pfpfu/fGtbp9?=
 =?iso-8859-1?Q?Sq+6XEziq6Gz1zyDo4MvhLIsP/LxvSrLw7I+aIMAs94z7Gh+yKE5AqNet7?=
 =?iso-8859-1?Q?htsI4uKPQQXyoYKwNy6acPkBB+SHiYIYNGp8ZU7HHR8II5D41ihX8f/11g?=
 =?iso-8859-1?Q?onq/05B566uSnMk4g/6Ynm5lUf0sjAxcYy0nozid1JANEDj2WzQxyVDy+D?=
 =?iso-8859-1?Q?YKia2WIOBe4QPkbSJa8msX7gX6keR8rxupszlVUM0GO/r6QxspVUoW108d?=
 =?iso-8859-1?Q?f5nGJwvyhvuj6N9xu0oZCqgpBLkQ7DyJeNIsjvk7jmu+l9MnCG4e4+Yq8s?=
 =?iso-8859-1?Q?aS2Cxaxn9PFj1zzAnrabAJk8pIOLLlEOis2bVbaME+rXCZqS6OvyhEQR3c?=
 =?iso-8859-1?Q?XSNcRvvhOPyajVNK09b8b1zIKeeRjYl3Va54aqfmc7A0ZWZ4+darIFVTiv?=
 =?iso-8859-1?Q?K/FsNZyVsQkWRho/R0vOznOxjy3iuL/b2cplMRVmxUhT08W0KYLJHgM+13?=
 =?iso-8859-1?Q?nLw3S3B1orc2N1waSfT8x3Yftf9uHoNa3/L4Bfac9mcaJ+nSHJTSdQgwwa?=
 =?iso-8859-1?Q?ggsd5KaLamybOe1lPmI9WF3GzHg1Ax3N2uMEM/S8bugg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k8sfrEkv1n0j7kiPagVu6bZMifB0zr6GfnEjeMboUlmlMti2J8g9kvX0qF?=
 =?iso-8859-1?Q?zoFlQJPloLBT1h6YUvNEBBYPzD1Ar+KPTG9keE+0aBob9MbkN8U9vycrR2?=
 =?iso-8859-1?Q?2zSJAQAWm2Q6KGpxaoH0PhtUjn0b8YWhFMtQv+NpOSZsOIgOogV13qAWHP?=
 =?iso-8859-1?Q?hQbL2WCbkA5o3WqApQZeBlOB2tRQL5dMFVFDk8TCI2pg5cofozbEd5Drip?=
 =?iso-8859-1?Q?FwznC2evIdi+3c3ZKwHLYT+puyTiXzJ6xGDCwOs7VGJia7VD6sv8h0qXTU?=
 =?iso-8859-1?Q?gc4q0N/5reaGEcgH4stdi5fSxzh/nrflHnFE/qd8ytLTRSXUih2W30eiI2?=
 =?iso-8859-1?Q?fQLIef5HPC7+Oxr6qrBT8MeiChACuDV66HYQy8TzqrySR8lJAyMF3CF4Yp?=
 =?iso-8859-1?Q?LEMM389AM8rHnW4j29b4ZXJ1MmhjLHPO08m6gKU66cRY7WNyUPtvF4SgAQ?=
 =?iso-8859-1?Q?71zXdDtQPzDpqt/vq5K5fkUTZZoNGnwFtUnw623ll9xKlNukvZ3f398umh?=
 =?iso-8859-1?Q?oKg4G8o++qNgqsutZL68HUs8U68wzEkOT2po84xWlMIFRmVqNSZk7o9uNm?=
 =?iso-8859-1?Q?FhhqodCXcNRt+U1KjQ/nwQBSwLeUVLNELoYs+hd32hix8tycUmBKZjWejK?=
 =?iso-8859-1?Q?xQmQPOc1rXJ2CPDKkW+IU90/qLUJ6FM9/ORJWLXcISi8vDVtqHcRugGfPm?=
 =?iso-8859-1?Q?JZlmVxTrVm1sMqvPQv2u7kYJnE7pbfi/8kDOGVYkHMKwIrvVvx00qsTuUX?=
 =?iso-8859-1?Q?QU7VANYiAr3k0smmOYJeJ/wedU2ftjGMAwzSoMZDVLa/CXC65sn0Lu5tb+?=
 =?iso-8859-1?Q?KxmD1EHag5oxlZkGx0qczyTVFaOVTtRLz27Gbq96X2MKioXnGWgObDij+r?=
 =?iso-8859-1?Q?gRz4J0NzDNTYW3KRPWTPjC0rPW1ewHA7wuYYvaXYQQ6KFB6f+EpC94Acvp?=
 =?iso-8859-1?Q?iV6/2Jri6YIOyBIfSIdZOdAhBOOVBIMTE23c8PxLrbx5dnidpPldwJQKJv?=
 =?iso-8859-1?Q?V5LmUpjwIAa8wmZ8fdzmJhFjaVX5iDQc+CX7vOeScx5K6xrmJI+c9Z/wbt?=
 =?iso-8859-1?Q?IpfgilHE1GZNGa6kWbYrOF8+vyW4LYQhv1a/+v84ESTbTEDsnjhc8+SpuL?=
 =?iso-8859-1?Q?EoP1YcX4Lhr+eDlHkjhj/NR+FCeTVOPWYscBj8503FW3LuWkLQJCTaoAFW?=
 =?iso-8859-1?Q?qbzkkC75ENWlVOGU63xYtFlrF9IQW24Sh0KBDCf1fMAdK4uVNlg8fIMQZK?=
 =?iso-8859-1?Q?FIzLScqsqVrfumraIS2kBQVJIt/iepmd1tyqjvmc7eaek2ebuLAR7RlINd?=
 =?iso-8859-1?Q?BrctUkZ0Zy7uymIlcDrIgVZFtKqeUYIfZ1cpf9esct4/+rHmulN1ldqagy?=
 =?iso-8859-1?Q?GOOgDzZ/sAip/cCZkz6VfhB20dGtsKIRZmCamZ4d+CjkMflZRNDjg5p7V6?=
 =?iso-8859-1?Q?0dosJk8VxGsmC0Cbik+uUbYmPvieyiB9NYMgItAkGwqmZDq+DkrzSHLj0j?=
 =?iso-8859-1?Q?pgYvC9DE16VTTFwvahutljBNaECNu+tZZbv+yaeh1vj2m8j553ROtL+vMz?=
 =?iso-8859-1?Q?vxFKKQRXyeoeiQ56nBaPiObjfGuuJsGIcijyXf8hpa6dvrkGL5smj6qqzU?=
 =?iso-8859-1?Q?CHTEdYAryu7M3qvktn88+TiaSHv/hkhmkHBvQybkEjwMNFmbRPiMdbnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a8db08-6d37-4494-e10b-08de2e47a14e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:30:31.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEFfKGRbF8fJ6kvIs2gPUI6PjL3Yx6H/QzrohNqmjZzuhfAn1BqsNr/D4iE5hElmMVxxcqTMoT6V7vAi016HbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 6.1% improvement of stress-ng.sockfd.ops_per_sec on:


commit: 284922f4c563aa3a8558a00f2a05722133237fe8 ("x86: uaccess: don't use runtime-const rewriting in modules")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sockfd
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251128/202511281306.51105b46-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sockfd/stress-ng/60s

commit: 
  17d85f33a8 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma")
  284922f4c5 ("x86: uaccess: don't use runtime-const rewriting in modules")

17d85f33a83b84e7 284922f4c563aa3a8558a00f2a0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  55674763            +6.1%   59075135        stress-ng.sockfd.ops
    927326            +6.1%     983845        stress-ng.sockfd.ops_per_sec
      3555 ±  3%     +10.6%       3932 ±  3%  perf-c2c.DRAM.remote
      4834 ±  3%     +12.0%       5415 ±  3%  perf-c2c.HITM.local
      2714 ±  2%     +12.5%       3054 ±  3%  perf-c2c.HITM.remote
      0.51            +3.9%       0.53        perf-stat.i.MPKI
  34903541            +5.2%   36715161        perf-stat.i.cache-misses
 1.072e+08            +5.8%  1.133e+08        perf-stat.i.cache-references
     18971            -5.5%      17932        perf-stat.i.cycles-between-cache-misses
      0.46 ± 30%     +13.6%       0.52        perf-stat.overall.MPKI
  31330827 ± 30%     +14.9%   36004895        perf-stat.ps.cache-misses
  96530576 ± 30%     +15.3%  1.113e+08        perf-stat.ps.cache-references
     48.32            -0.2       48.16        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     48.23            -0.2       48.07        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg
     48.34            -0.2       48.18        perf-profile.calltrace.cycles-pp.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
      0.56 ±  4%      +0.1        0.65 ±  9%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.62 ±  3%      +0.1        0.71 ±  8%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_sockfd
      0.56 ±  3%      +0.1        0.65 ±  8%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     48.34            -0.2       48.18        perf-profile.children.cycles-pp.unix_del_edges
      0.15 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__scm_recv_common
      0.08 ±  7%      +0.0        0.10 ±  7%  perf-profile.children.cycles-pp.lockref_put_return
      0.09 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__fput
      0.35 ±  5%      +0.1        0.43 ± 12%  perf-profile.children.cycles-pp.do_open
      0.63 ±  3%      +0.1        0.72 ±  8%  perf-profile.children.cycles-pp.do_sys_openat2
      0.56 ±  3%      +0.1        0.65 ±  8%  perf-profile.children.cycles-pp.do_filp_open




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


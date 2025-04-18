Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBBD18871F
	for <oe-lkp@lists.linux.dev>; Fri, 18 Apr 2025 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946753; cv=fail; b=HJDI9eE9aqY1cDAvJImV/LvObgHYLoRIHDAJNHis79+CMtzdnlKZIDBNUZUCHAbec19JRRi1qLGMNgGZGVo06npWNIUJrmZ7AyDl3hU4e2R7+dhnKY8p0hHrpHE5/b5wE86KF1JvBtf55FA70Io/ThH/xAkxyDVb3ObTxZ9GyDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946753; c=relaxed/simple;
	bh=05egAs1EclbSahgX/cGQY5TRDqUBVFHYG3JpStTJWVc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jFWd22175ERTuAg4elilR0ub6egdb8Ci4kNO9snEmL3IXyczk5rYsX6Cpde88aH8yvccVrWjlfCh7R8ppAhAw9r94KsqfNaCOAReMB24WtSohJ8RrDhhlO6IM+Zsw8+56DYCLMx2hIrCAWKQS7R8OcT6JNIz1oknLl/V87yx85k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9NNCOLs; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9NNCOLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744946752; x=1776482752;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=05egAs1EclbSahgX/cGQY5TRDqUBVFHYG3JpStTJWVc=;
  b=E9NNCOLsYsBCgk1Ptf1pEEmd9e5RDMn7E9Wou6Ioyk0p6Vb9FkYkcDUL
   1NLWZ2gGwg6P+363qMWNTQzj8SwQPLj1IFBdWaODSeybNqVQkTrmyBuou
   BXwgtzByH2QVEvEj/bmyymUZgNb7CDmPLRHxdPN3ms+BYasf2Aa0wMGTo
   X/2V0sxFu7QLvQpIYQqZDYL1S2m5IZOnOhjHx4Pr6kvzK6S5Vu4pWPlFK
   s9dSjst8x0ZnmkbLQLCoXsVR+PF7oTMlVkC/eOda6rUpvZOUGKafXmRXz
   HRFoRBFzFF680tem8ht6Ou/9fMWQ61P2WDDJfoPjnQ55BF3tyXEqT8kI8
   g==;
X-CSE-ConnectionGUID: 27eDEVtnSNiGC228UD63XA==
X-CSE-MsgGUID: gxJ3XfpNT1CiXcX0XiGlTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46494342"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="46494342"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 20:25:51 -0700
X-CSE-ConnectionGUID: x2ucFDKYS7Gsj8tKLS3s2g==
X-CSE-MsgGUID: XbxzyJzpRgiIesPVYsqDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="135860184"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 20:25:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 20:25:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 20:25:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 20:25:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz+xUyNrBhU+Ikv768Qlxayi4bkRzhOKu6RTOl6D71zHbHtm1uPiSMz0ueefzIe2Y1qdrYugMqTbhbAYXqUfxDH8lQEA/WtYs0c8p8MmcgXnJHUhBX8ZEtHXINVIgYJuSm9d4qk26os99sxuao8zS6QYq3KqSd7soxrmp/gdoSXf87GtkxYhJ1zsu8UKN0vCHilwd12XrR2uAdbcRjmbIEbsBN/Gb5utHXTL/zRQoF/Vt3/qMxdGcFiEvcBjtDmIuH2tvgtglIa3J5E+PN72x6+NcxVUOiIYUIhE9UEmQx1GB1wAA2AyZZEMgeKEaff0FJ0gG3eJfskUc1Eibruw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYCqcmS14jTAaxQdFDPDEJ9EoJJLcMJFvGZC5uEhqRw=;
 b=TCsqEJSTR3nMo+94uj5HmwGlP5BSD6zdbMdOJEuJ7bTSLryMMU6+PpgKMIdpetxft5aZvGK5hOWLC2GHMA2+cBm12x8wSI+FW0/b44o+3rnFRnS7upg1lyL0om1LL8z9NN4Zs/BF6lAId/vOrhm61YOFUK1soLUBFMp9bKzW1iykOLG23mYuYMeJ11+5CfO79CmF5EUZBRe+jFxP8sY3OpVpxldnjxRd2wBE8uyOGGD/nczukF3aAsYfId1tBo1EhMXGjqJxQ+1dOYOTuORJ0ENypfcMynfii+wspxz/JN12N3/5NsFEZBewvHXpyf/vWWUjlFKOZbWjJ/JZ1CY9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 03:25:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.035; Fri, 18 Apr 2025
 03:25:19 +0000
Date: Fri, 18 Apr 2025 11:25:10 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-lkp@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: RFB: unrolled inline memset and memcpy
Message-ID: <aAHGFnIUoRbv1ppd@xsang-OptiPlex-9020>
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
 <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
 <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020>
 <CAGudoHGD0EhEajMCxdQ3f5sjzsSJhZUb6c+rfAjFGx_9S7hqoA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHGD0EhEajMCxdQ3f5sjzsSJhZUb6c+rfAjFGx_9S7hqoA@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 70857f7e-e2dd-4bf2-ac24-08dd7e28a546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bElXbnhrblZUTnJENWdISVAwSWU4ekNEZTV0bHJDQTlERzJOMzhyUXdyb3VH?=
 =?utf-8?B?eUFKYzdvZ3hlOVNPVTBrMlIyek9EaGhKbWV4bEZGalYwUHg1ekQ3c1pJaCt5?=
 =?utf-8?B?cit1b1BDR21TeVZUcHdzT2xCSFNkeXZ6WGV5a3dVUW5zSUd2eDhrRXQwdEdu?=
 =?utf-8?B?aDV5Z0pzVVU3a2Z6S3dhTkNLUjlXdmNOZXIySXpGRTF3MFNoVWZQeHZMWGN0?=
 =?utf-8?B?Ukt5QXRTWGFXZUx4VUxVMks3OXhOcDVVNkp5aWJaQldzQ2Z5Rytza3JpS1JD?=
 =?utf-8?B?d3BYVEV4bEFvL3JNa3RyRW1oVEF3dndsQXlLeDN1cjd5Vlljb2wvbFZuQmwz?=
 =?utf-8?B?bzRjaTYwMWxEb1FTN0FTbnY4RmY5OVhobXdmZmVoMzhQd2tGM1dzb01kVHVN?=
 =?utf-8?B?Z3NQVDlMSjZzaENwREdrTHBpcUlwL1BvRUhIVXMxdWFveTRaSG5NTHg0bE5s?=
 =?utf-8?B?R2dxWjRXclUvaEo5VHlJcUMvdGkwMVJ1Z3F2VVkvSlF2V0JMd2JwNjBtLy9G?=
 =?utf-8?B?Nm5ic3pLaS9tOGZ1dEVoRFdaWVMrVmJCaTk0cXlXU2NKN1RKZElUVDBEL0hI?=
 =?utf-8?B?ZFJ6QjBEZ1BsZHlhVEEvenBHOUphSWJub3ErTkI1bGwvZU1EdzVmMmlQWlNp?=
 =?utf-8?B?dlR1OXFBOGhjVEE2WUJTZWhnYU5ZVXh6cDJYbU95b2dJeUJnaVNxZmVoQTZD?=
 =?utf-8?B?dTltUHV4TjR2OVo5em5SOHB6ZXgwZFhuSFFCUE1HcGtLd0RZdHluQ21zNndv?=
 =?utf-8?B?SkcvYUprWjJLSm05ZERhUW1CRUE0TUszSGdoUnRHdnZCYjdvckFuQU9YK1ZV?=
 =?utf-8?B?cHoyWGpkY0l1WU9pMlVCdVdrOU9uNEc0VWVlR2ZHTzR3VUI5ZGZIQWN6MExz?=
 =?utf-8?B?dDRtTU92VUgwMmwwdlBQTnNPTk5DK3kwbDZqTWNUU25YQ3JLanRhb0V5OGMx?=
 =?utf-8?B?cytrK2xGdExaUkdsVmVCSWlBOHZsK2pJaGJmazVNVi8xYmNMbG5FOTJ6TThy?=
 =?utf-8?B?ZGUrdE0vTkZxdEQ3NW5aaUkwN2ptL2FmanFVNjNMVlF2c2d5QVBheGgyT0lw?=
 =?utf-8?B?cmViTklqNWVhVEdoalJoZGZJZjVlRnN3TC8yUnM2R3ZHNWJ0MVJJNVBPYzNm?=
 =?utf-8?B?SmQzVmNqNlVOdjIwcldYL1hqTGlJTHpiUEh6bWMyVzdqRDFTTE5DdjVvaW15?=
 =?utf-8?B?NmphMU82bndnTGZaZTZzWDdmYnNaNkRBSUFFM3RUdmRPTFNqL2YxcmtlVnF4?=
 =?utf-8?B?QzdFMG9Lem1YUFhERmRJQmpCcXBGYTR1dUxyS2lOS0pKZVZaQU94dENQR3Y4?=
 =?utf-8?B?S3E5SDZ0WUdXQ3BBdWpuTmUzYlFicVZqc3FCak9IcUw3QmZWenBybFZqaVBY?=
 =?utf-8?B?NDZRL3d3TlZmaklncEpWUHpWeEI2YlhDUUh6Um5WenN6a0k4WWhNNEZKMUd4?=
 =?utf-8?B?N09aTGRRQjNWQk1YNjd5TnZrZHFpb0VPSWJXd09JYnBrN3RPc0loQ0s5THps?=
 =?utf-8?B?L3o0MVBCdjN0cXc2NHVVaVRJcDdvTUsvOU84RXE5QUxWUXVvOGlkalNFODNN?=
 =?utf-8?B?Zkc3S3liR3hPekdiVTcwSW9lb1pqQkhnU3dpdWNKN0VFU0pDbGdWNlVQaUx4?=
 =?utf-8?B?cHViRW1GRkg2aXRtNzZuaXd1azRWaDlwMzc2Vk5Cc3hZejdBbU5iR0I5YXFz?=
 =?utf-8?B?dHlQaXNUa1ZWNEZiTFExdm9OVEdzOVRJeDE3WlQxKzZlZnRjNUZGL2ZwbHQy?=
 =?utf-8?B?ekd4MmxodDBZK3JINVBweFFCVmVqdTJEbmFpbXhldHFjOGUyd2E0Z0xhZEJP?=
 =?utf-8?B?RjV4elQ1SGxkYmx1VFlRUXpLV1RYWjIyQlp6NFpFb2VYOG1Ya2tYR1luMWY1?=
 =?utf-8?Q?G1B2JDhFtBOwQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmpUZW5YaE5iVS9ZQ1dzTmFCRUlUSWhmSWZ5Z0NlN2hoTkZMRWJQT3AvMnVE?=
 =?utf-8?B?U0NqdzV5cFc5OHNvczQyK3VUQmFoZzMxSUpyZ1J5ZnEzVWcxckdZRGVDNkYz?=
 =?utf-8?B?cUY1UExCdGxOaWVpS2c0aHRTWDgrRTZVY3FBNEQwODY3L0NFUmtSdnVpVVN4?=
 =?utf-8?B?bzMrUFZ3L1lTNHFEN2xISHlpby9wdElTOHEwU3J6RUFLRjFyMUhJbGNxVGpC?=
 =?utf-8?B?TGZPbFBzLzFXbktDVWJXZ0I5dlFwVWlEM1A4cG41MmVaM1hxWHR6cXQ5THk4?=
 =?utf-8?B?cjcvUEIwb2NpNTQ0VGVWWTh2Z2FWZWp5emJ5TzVaZDFwR2FRalI4R3dMSk12?=
 =?utf-8?B?UmFZM3R0UnpXNStidzM0L2RoY2trcFFsSUVxWDR6ZXlBN3k2aktIZVkyLzFP?=
 =?utf-8?B?M20vMlRMajhrMGlWZUFLV0VMTFFUSWw3QlVmUFF5blpUUFo5ajBGOHNpQU9K?=
 =?utf-8?B?TkRsSmdtUEU4bXBVWE9QTFRTTjFIRklyWVBtME1tcEZjMjIzWEZsZzUyZWlr?=
 =?utf-8?B?M3RXcmpEckFzNEFORW1zYkVDKzk2dEFkaHVuQmhYZHJUdzV5Q0lBRTBJZGxF?=
 =?utf-8?B?c2p6eG4wdUpwUldsaHFobDVWM013aWVHR3ZmWGlYbkh3ajNLR1N3QWFJSnY1?=
 =?utf-8?B?eEhtK2pyMTRRaFpxdFp2OFgrMnl5NmN0eG5Td0pIRHNUZGYrTGJTaDlJakt5?=
 =?utf-8?B?dVhsK2preFlYNUdTeEc1UnBiaXFQbzh6ZElKYlNwYnova2oweU5sSHBrcUx5?=
 =?utf-8?B?Um9GM2MwWmlvRGc0WjJvUjNXS1NpSXNZb2RMNU1EemNoTWZzd0M5cHE0NEZF?=
 =?utf-8?B?N1FNcTVDcm9GZHNNdHFjWFlESFZFVmFXMFcvUWJQaXN5dWdFNkx3eExwMk9Q?=
 =?utf-8?B?MWtJT0NmNEdvSmpIVS9wZ0ljZHIzTlo5V2dRQi9oQkcxUDJVZ2NQd20xNml1?=
 =?utf-8?B?MXYvY0NwUlVHNG92ZnZXSk5WcklhVzJDaDV0NHB2MGJXcUU4TXR1NGs2Tkkw?=
 =?utf-8?B?eTk5SE5aNThabm5kakJSR2FHTVg1cklFZEozUXdPUWl4a25UbUowSllvUVN4?=
 =?utf-8?B?UFhVLzdiNWlMWFpmL1lhMEEzbDNkdVJyMjVMQ0VlSlpESnREdkV5eTAwOEVM?=
 =?utf-8?B?dnNuMXhjNTdpQUpUbGRBcW9MQWU5MG53YXpJVnB2cmtSQWdtUlgrVGh0OHFu?=
 =?utf-8?B?SXlQckR4SFdTVks1ZGRyU3Z2SEp5TlVPcDJwTjBNcDV2ZURZWFNrVE5tV0NX?=
 =?utf-8?B?YUdyNThqak1uOEpFOCtaQzZ1SFJEM1cvVkJVeFdEYlNBaDZ1TXUwZS91Q0t1?=
 =?utf-8?B?ZStUTjdBa1gyZC9xeHRlRHVmbWF2YTVLWmIxTlpZRWZUTnFjVUttYjVNb1Bq?=
 =?utf-8?B?ZFh6RmgyVFhBdllkTXdNOUhYcDc0Y3gzdUJncnI0MnBPMXpYbmgvT1dUTVhy?=
 =?utf-8?B?M3hDajdOTGdGYmErZkRIR2FuaFBoam9PZmRac3lkenV0THI1VWRuazUxOHgz?=
 =?utf-8?B?UU56NDVnV3ArTWN4TWpycExHdnE5YlczVi9nNGFQc2JYbnhDc21rZllRRWsz?=
 =?utf-8?B?K0VYTVYxSFZFZ0J1REVGWTR3SlFqdHRuaE52ZzRlMC9pMitVTjE2Skt6bXBY?=
 =?utf-8?B?d0h2N1FaK1BvYThmd1cwa0tFNWI3OTUrZDQxK0l2RDBCMUVQQkVxVGhvRzR3?=
 =?utf-8?B?WlZQSVphQ1Q2ek02R2gxcWIrajRVMkJwcGZjWktMOTQwaUJia3JHSGd3NWwy?=
 =?utf-8?B?VEdRT0NYVVJhbmppUVp2STludWtkRUM1SFVOZEg1cUNSOSs4Sk1IOGdvQlFG?=
 =?utf-8?B?UmE3dWE1MnZQNzJCSGRFSlA2Z2FSaEFqdU1WdXIvS0RjK1BKc2haYjN5cTJJ?=
 =?utf-8?B?RDU5SnJaTTNzb3RnMWs0clNFTTBFaUcrVTRZd1dGeG9PU3JiS0N3R1o4Umgx?=
 =?utf-8?B?em9rKzZoTkgrMW1mRDFTeEUwTnl4L3dDY1pzUU5VNEdURmFtTXNOejFoQ1Fw?=
 =?utf-8?B?eHJvZjlueGhudlBIVkxXSTVKT0VVM1hqMWQxYTF5OTFZOWZjV1N2YXFEWkxp?=
 =?utf-8?B?WDcwa2RPcGhmSFBRQWYrZDVYNmVJWGtPWHVScEw3UDl5VytKb1hSNXFKRzh6?=
 =?utf-8?B?eXl3Z0dRWVdEbWVJWWQxRGlBQnlzZVpyazFYaTV6NUVKejdtZHJyVCswUUV4?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70857f7e-e2dd-4bf2-ac24-08dd7e28a546
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 03:25:19.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsOcXKddemnee2bE2fHQGHpTLfZE5KfZahFf7WPS/B2KIsX1VlwCdh7bpUgjJUyZ7EdEPcHF4FF0jgFV5zNPrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Thu, Apr 10, 2025 at 06:01:12AM +0200, Mateusz Guzik wrote:
> On Thu, Apr 10, 2025 at 3:49 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Mateusz Guzik,
> >
> > On Wed, Apr 09, 2025 at 03:17:38PM +0200, Mateusz Guzik wrote:
> > >
> > > > is it possible to push below change to a branch that we can access? if so, the
> > > > change could be merged into our so-called hourly kernel, which could have bigger
> > > > coverage. otherwise, we need to use on-demand performance tests, which only
> > > > cover some tests on part of our machine pool. [1]
> > > >
> > >
> > > will a branch on github do the trick?
> >
> > yes, that will be great. one benefit is if you want test new changes in the
> > future, you just need force push to overwrite old patch, or create new branch,
> > we can detect the update then try to merge into our hourly kernels. if merge
> > is ok, the test will be triggered.
> >
> 
> https://github.com/mjguzik/linux/tree/lkp-bench
> 
> based on master

we just send a report
"[mjguzik:lkp-bench] [x86]  76a45d86f7: will-it-scale.per_process_ops 8.3% improvement"
(https://lore.kernel.org/all/202504181042.54ea2b8a-lkp@intel.com/)
to you.

for 76a45d86f78bc (mjguzik/lkp-bench) x86: prevent gcc from emitting rep movsq/stosq for inlined ops
the report spots out several small improvements on different platforms, both on
Cooper Lake which does not support FSRM, and Sapphire Rapids/Ice Lake which can.

there is also a small regression from lmbench3 test, but in fact:
      0.13            -4.3%       0.12        lmbench3.syscall.fstat.latency.us
      0.47            +1.5%       0.48        lmbench3.syscall.open/close.latency.us

we don't have good idea how your commit is expected to impact performance, so
we just report all results to you in case the data is stable.

there also could be more results in next 1-2 weeks, if so, we will update you.

NOTE
one thing we want to mention is 0day only tests micro benckmark for now, some
of which are sensitive then sometimes give out some false positive, so, since
your change is about build flags, we doubt it could have some overall impact,
our results by limited micro benchmarks on limited machines are only FYI.

> 
> -- 
> Mateusz Guzik <mjguzik gmail.com>

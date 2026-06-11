Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B435DA6C
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jun 2026 05:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154156; cv=fail; b=StZwiQ8zZ4KvBOG+Ff45WiRQO3sv38U5ISXxJ5i3dI4Z5TP7nwqNuxeVYBME0XUCmgP8Y2yLLfF0llt181x9YvRsJqx6iMnRUYtZDgJ/+FsAI6/eJpQQAWqsRw8nZdUxvY+G63KcRI7hpHJGJO0QJSNeenNv4XU2HnMo34EKMCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154156; c=relaxed/simple;
	bh=t8rH7Ldjp/N0A+i6R8CQCANSUVJpW8m6yjIbPFIvdYg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IMILazG5iNYAXHLfZu94wDyJIQfsE+NiOZgBnMdpujUH41FVDF9WjHZFRqPEml9VWZIjwzb+JslNJOUrROu91JH9wyX85Xl+5Lvt9KEsADrT3NmGVXbTq/ozrfl9u9rfn/mQIB5anq1fTSQj5FIDHUcy3rezIFhYHDV1jqPvfXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGp45N1l; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGp45N1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781154151; x=1812690151;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t8rH7Ldjp/N0A+i6R8CQCANSUVJpW8m6yjIbPFIvdYg=;
  b=OGp45N1l7P0RyOtGiRJkdv0MACKEzyWU5ZxYdNsJrX+YHNvdrH9NEOZ2
   o7iOsDJ3C/UzaRML486DqPPgEOH0ouVAMIKH37J2cQpSJUKGO5esLyjMB
   Pasz9hIL2HFKkF+Y5lKXhLOwAgaw207FJTSlIayEkNatM5ZmGKT69P8SM
   YlY3F/TvQE6Oe0puj4qPGWFmVEmmCf6klt2BLkALJwJ5pTEOrG+rN/fMC
   rd0W8iS5/+joT9/CEbcfnetb3levFO78Eoa6IreqfPpAcVordx5Qp5g6L
   k/U2yfFGTfiWpNjcvY/r6Ls1aG3eVMoIOhBETqV+e+xY0SCIUH3duu0ma
   w==;
X-CSE-ConnectionGUID: OLwC7m0tRzyf14uk6iLUVQ==
X-CSE-MsgGUID: 6CSb0E9qQNSWX4AXJ2O2aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84532241"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84532241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:02:29 -0700
X-CSE-ConnectionGUID: yt/BC4JXRv+Oth5b453GAw==
X-CSE-MsgGUID: gSQHWJ0ZToijkNEDtG2sGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251472648"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:02:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:02:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 22:02:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y15wC3aggDg0QqP2JgfOAfWF3xUjDG1YY6eJNt/G/CQX+59J5a6iDkrL7s3IRmtl0H2zL0VTvRgDhFzqV9JmtRUcl7m7ffvHhDnuHudqFIvB+4SvsLwnj4+or8BOUNH+uoMqYbKQ/+Vm6JqfMre4Znlv31EYXEvk0POfldufSTDJ3RK0zhTXw2urbyqG++Bwi7FAjpS3kpKnmRCki3mGnqE84RL6IijBmz2LGRQEfD4jQflxm6USLV7iYfw02IuTAD0yVOpdsOtr+VWMQsCNu/rOBwtgXSQVvtH8j9hInTX5rJtSgy7im6aif08qtUCO9XS2Qpvs5/fLlOHAIRcreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJRRNrsh05lK/Uj1cvmwpgKijkvAtl1rdBCguwlnFEQ=;
 b=gKX/ZLoj2UVw5frkRCujIGKqv59mnoige8CUYALxtBx7dw6yP44rXHDLQ+AQaN4nfxrqhai1X3BY89W7xX6nZcZgVhbwPbPvMLPTpLctu+mH3gTMTd+FJre50fpi8uh7ryUFlctxw6hHX5K5eq4nKGkR0IREbqwiM+UE6c9ISoBflXgMJvgZQM5JA/0Z8YazPj/bf3UBjpElVVuJXE4y53sYCQ2XzI/O5dsngGDu8Espx9FxliIYA83gr1xNq3TjUCsPJgtlbTnHWiMOp0wxPL2q8wLMhhOJlDuiCOj3oLThhlJa7o9st+armwmY25s1Vzb+1hRP3LpYGjAUj2huzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Thu, 11 Jun 2026 05:02:07 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 05:02:07 +0000
Message-ID: <3de9f11b-d10f-4a1e-9239-e3cccdd36ce5@intel.com>
Date: Thu, 11 Jun 2026 13:01:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:sched/core] [sched/topology] 9e005ed211:
 stress-ng.kill.ops_per_sec 4.6% regression
To: kernel test robot <oliver.sang@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra
	<peterz@infradead.org>, Andrea Righi <arighi@nvidia.com>,
	<aubrey.li@linux.intel.com>
References: <202606111053.c484a580-lkp@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <202606111053.c484a580-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 71553cc5-b40f-4d09-9296-08dec7769616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: oIonxhXbCOYXcRX6KbQ06R6jnMUHhXvuCeN8IB1XfRCRd6oVD0Vr/CpHr6+jQWH9HXN4qwtcPWnitZDWsmNIQk3Y7DMdOc556vxzen2VLRWudczN7gDlMuCytYdQiG1pBavi3eLON+wMy+5VdVxEyYj9RRdaR0kjFwGGzZ5yrDK8WeBLeqi3axKwPmocxB3cEfp3SyUDbxVBbxizXgOUQxjKRy7R2uC1XBCiGyVcLXeRjwxOiyaYweJwBV0jkRuLaaGTdEBaknb7Y2c5iz8VVaHg5pBgqTi99LogVYO6bd1nMMfiMQaHNPCxOR3a7MrdvXqI/KVQi9YnUOWdVhY3mAzj09e1UMe3gEW9YqrWPmQJPkzya/14cEl0Ql2aOfYPopFCthnsU67C4MiiwB8LgmQjxbzpSv8rEAdldesu9l/K5UsvwAf4igs77vYpItWVKO1/BzS7owoZckjR9amX6K2d+2SlsNEMNCAicamDktkX9hxSskeQvnplyPnryAr/JrrCps2cz1AIy0l5p69nA7+Bkj9aJu1mXSJwM9+M4VTY2e1Kv+FrvQ21wpqWA6nTGnWJZh1VAE5F7TkI/QYqoUUwkc2e6YH+14Fagf4cxP3UMgsdm5noP30FtIWDNXgmnWsb7B+5FaxwaYNwE93gHyuKOp1t4ZJ9EyvcnDxqT/sTKF1aa1A6+/ZJFtixGvF2ibpPXk19cPbp4A14QLsM5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzkwZlA4T0x0bnFIMHo5T1ZvN2RJdmVwbEJrakFGUkJ1azlBR2lMOGIwTlYy?=
 =?utf-8?B?bkMwMDlTcHFQMlhTZFB2TFhmZHRTSkxZVEVHOXhCQk9WQmNpQVB0V0RiMGFn?=
 =?utf-8?B?S0FRREdrVGFtY01UWXJzSTVrUC8vS1JqSUFiYnY5YVA0Y1NMUUluOTNJQWky?=
 =?utf-8?B?dHgzUm1kYkF3dWo0Tk9HeUtqaVBCZEl1YTY4MERKY2YvYWlPbFZvMWlkTGVR?=
 =?utf-8?B?ZXA0eDBFMFFzMW5YcnMvbklPczR2MUpFdGh1Qkl0NWlHc3dpUjZxVzM1YkdJ?=
 =?utf-8?B?Wm1SQXU5bjZKUktDOFZWU2poa1BjSGUvekFZZkxHRmNsYmpvSFJBWW15MU8x?=
 =?utf-8?B?OXIrNjU2VnZ4c1F4NzluNWxMR2o3SDdDUE9COGpkQktLWEJpZ3FDTWJaaHEr?=
 =?utf-8?B?eEM4NHhpODRWbnUvbGgvVnJ6ZVk4UUNKREt2MmtNQUd2YVZvMnU4cGJMY21r?=
 =?utf-8?B?TVo4NlBMNy96TjJkTllDRFlMZm1oWEgvc0d5MjBUMUlwZzFacldzalFsVldk?=
 =?utf-8?B?WUJWMW02UUNRcGtRZEpBZVV5VVkyY3pwbVRFeGRtZW1rMkdRTG1EcnNqU205?=
 =?utf-8?B?V2xWUXpGOHB1N3djeitYQmE4Y3NqNnZMYXk4dWUxQWxMaVpPRXRzY3lWamtw?=
 =?utf-8?B?OUhjVVdiWGY0WFVIWXBGalMybm91NmpvQXJCK1U5elNtTmduL0hHcjNxMTM4?=
 =?utf-8?B?RkhpSjNkUzdIdWJkaVUvQkxxNkg4VFcvUGo3WjFmVTVIb1lSRktDS0xwMith?=
 =?utf-8?B?R1Bkd0N0UE5HWVZTY0psYkFnZHRueGZML3Azd1NiK1JVbXNWckRUWHlzSDRh?=
 =?utf-8?B?aEoxSTRNN1V5d0EwK3I1MzNoZ0VBQW11UWhxblVybEY4SUlTMUtjSGl3UCtq?=
 =?utf-8?B?ajQ4UjcwcWd0S1hMci9SalRhMUY2TkIyOEhWaEF3YUtKWGcvN2wvaFZDNUxq?=
 =?utf-8?B?TFJscnc5YzNrMmlPMXVhWEQ2OTJUMjlPTVRHT290TzhkZG9FRDc2MWgvRmVL?=
 =?utf-8?B?UlBOdnlNWXNQQndoamthUkpoUXFYNlFQMjdNbVN1VjdxcFJSZDNjeTJrSmZq?=
 =?utf-8?B?UkJ4dXpaUFlPNFlIaXpxRzlMNXNnUTF3QmFWQWZ3T1RjLzE5bE5GdG1CYTVp?=
 =?utf-8?B?cW1mUjVVQk9OWlBoM24xd0hUYWJvTUNQc2c0VGU5S3dLQlgvNTFLNGE0Vlkw?=
 =?utf-8?B?NDlMeVdHUVZtZ2k5d0hMZC9aQi82S3pFSWFLbm1IYUttdDVtak5uSWdkazh4?=
 =?utf-8?B?TFU0M3B0MmphV2dsOTFUaVZjY0VaRUJyNk55U09Ecll2ck5Vck9jdy8wUVhn?=
 =?utf-8?B?enZmLzU1SDJGRGFkcFhZWkVmdDJGZVNZa003MEJyQjd6SDRyM2I2K0hkcGlZ?=
 =?utf-8?B?aXlqUGN5L1ZBdWh1SFRxd3dvM2o3VDVMb2UrTjZxTjZWejlTOG5nNm5tOU91?=
 =?utf-8?B?YnlabGRDOFJ0RFVLZ1d1N3VMOGxCK0l3R1RNc2dQUDBRNklGY01UbmtxMlZZ?=
 =?utf-8?B?bUtqazJMZDZ2LzZYZFcwTUR3K3ZqbTNUOGRuVHpjZ2ptUWZKWGI0Rm9KY21r?=
 =?utf-8?B?ZmdvcWE5WkdkcTV6WFY5alFCNDh0YVN1akkyQkxJSGxtN0NxOFhHZGMzSGNm?=
 =?utf-8?B?N0ZyQW1GT2dTeTJybXhaaFVHbDVFelpOdzFYU1c5dDBMeVFBSytuZnhEcWVV?=
 =?utf-8?B?UkcwSUpJTmdVb2didWZWM3UyTnJlUDI5azgyWDNzQXhKaWZUWEZ3NytLWDgv?=
 =?utf-8?B?ZEpkekhqYmNHaksrOFFRbVJIRVY4NGgvY1QzQ2FIUmcrRzltVld3bXoxTDdk?=
 =?utf-8?B?bkhsK0pnNm4wN3JNRE9Ka1RuZGt4K0V4MXJIaGFXMlFkMXVVblJCTzBZVDh3?=
 =?utf-8?B?aDVCdnZKZVNsV1ltcDAxVkIwU1FUbmtsM1h6U29iSmNUcFFjWnVPOHVWZ3kw?=
 =?utf-8?B?dkw4czVIZ3A2ZkZHY0Z5MUFRNFFKdzZQeXcrNU1PS0N1dS9SczA2SzRFSzUr?=
 =?utf-8?B?RlovMU40Q2hxUExWb1ZhM1B4SUd0cUxXbGZmQ2RTaVFtbkp1M0kxdDhwRExP?=
 =?utf-8?B?Y1ZTSkJOME8zSHRJOW81cGtZdEtYQUt5MmU0dGxaSnFtVTZtR3YwOUEvWHo1?=
 =?utf-8?B?YjUzVUlIamJoeFdrbWlISkJoNExuZ3JiOTVLVFJqV203WUJsa0xpV0FUcVRJ?=
 =?utf-8?B?ZlF3cjg3YW5jdXFvSkRqM2dBTmkyMVdkOWFqN3BKbmF6eXhGekpWUXEwdVJK?=
 =?utf-8?B?R0gwc3lXQTg5NHJUUlFQZGZUbWI0TzRjY2E5K0lReElJazZFNmNWTGtFZ1dI?=
 =?utf-8?B?dGgxalVuTTlCZWJ2VGozdUlaaGxBWElLalZSRHpscHhSR2RNSzlxUT09?=
X-Exchange-RoutingPolicyChecked: lyfTIZFNdrtFW81tEJq3n/Q+hHhJhbOB+wXwVNg+Y5KIQIUyIX4lyb211SdedQkBUfldLH/3HnHzCBhPjLWYgxAM/MkgGU8G+q09j99tlsqO5NiZ176Zwlv9TQiDZCOIl/r7FegmJ6HLjyTz3iTKTL4vwlPVNdXm/I2EP5OrPotFnRwJ9TpNrqQSk4nhqg2BP8sPgTNGtKEGd4B169nrvKa8bXa2Hg6dUd05Cdk/u3xGH6asYGphRFHVUJULgdPyOOwkv275myhK8+s+dLguy3BTxQuNdhhUJSbsI3TIOBEOAGSkhn7l9PcAnCfuCGCARltkXtWYNrAR2275SV7LLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71553cc5-b40f-4d09-9296-08dec7769616
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:02:07.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugpcc7IyOOHJOOulEp5li5uh9rVW7kQ3CvuatH8TVEGomb3cMpSJ02kWGyLfLlDlQEZp/kJi58/WqZG6w2V8oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
X-OriginatorOrg: intel.com

On 6/11/2026 10:19 AM, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 4.6% regression of stress-ng.kill.ops_per_sec on:
> 
> 
> commit: 9e005ed21152d4a4bb0ceea71045ff8a642a6feb ("sched/topology: Allow multiple domains to claim sched_domain_shared")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> 
> 
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: kill
> 	cpufreq_governor: performance
> 
> 

This 4.6% difference is very small and within normal run-to-run variance 
IMO, as
the commit has no functional changes.

BTW the commit log indicates nr_idle_scan is
initialized to a stale value 512, sds->alloc_flags = SD_SHARE_LLC, the 
wakeup
before the next period LB in this LLC domain might have slight higher 
latency though.
But consider your test last for 60 seconds which is much longer than the 
first period LB,
this should not be a problem.

thanks,
Chenyu

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01137406D
	for <oe-lkp@lists.linux.dev>; Mon,  1 Jul 2024 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819762; cv=fail; b=TrEa2VJT6aBV0Vaku6Q0xfR45l10izsv05H/aUj04I9LDe5qba7yQ6JLMSzcig6Hi+0oTVDclzEvPapIDzuniE9AWWJ6Frhwom5m/ebvIv03CJ8CdmdBPPYK3a3oAIsxgsDr1OlQZxHQiGtr4o5K+ZtsahX/4efuW4XPsN/RwGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819762; c=relaxed/simple;
	bh=Fb4Ie0FvZYi5s9LbDhXwqgeKgE3eJ8xGAyIWR1LCcLY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j00FqmSnjNGlsSMdBTokQP7OZGCs7co/8eN0+Xtp3BPSzCetaMywTa3aAzZK14AXJBo1uDY4V732zleuCBTiiMmQ3MWbIoOw0eNgehBux+8P4N1SedrWTKIM4cBxYHTWARoxlQS9OlE6xSNB/btQt/t0WMnS9YKUks7qhGlWJz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6eAfIJv; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6eAfIJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719819760; x=1751355760;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fb4Ie0FvZYi5s9LbDhXwqgeKgE3eJ8xGAyIWR1LCcLY=;
  b=X6eAfIJvTaHVT9J2RfD9cl5Y+/DP4k+H/O/zu2jtiLWHeLyunDmodIlT
   lX9xjbsi/CBsTvVZRxHd/II0VqV6PESfoqhgmJSajDND+2KqtxCkrj93G
   M+TtXYsZ9XbrpOFU8DMMmFXjsjej/zfa5fZJ+3jgtQ34ZradH4gjGiprd
   7eIQKqdFgciJXVR4Ts1yj1YZi+B7PC6Fx6cg59MQm3VicDc7+xdEySBjj
   1UQiKSphIYTFJ/auAdbrcHIX3suav3zoFr2XAwRBBTYYxnMb89X+lbyWd
   QC/kBbXN+GACnSVZfvxQsmr0ORtmTBRqSg5iq9hO6R+ponm08QWxWIC4e
   w==;
X-CSE-ConnectionGUID: Z+bNN8NvQ6uJkpQRrkQdmw==
X-CSE-MsgGUID: 4UhdvUJ8QW643GKJmQuWoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28325721"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="28325721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 00:42:39 -0700
X-CSE-ConnectionGUID: EuEQxFedSge/bjrEZavo5Q==
X-CSE-MsgGUID: ztX8ilaRSxSQ2XRegW+JcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="50311922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Jul 2024 00:42:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 00:42:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 00:42:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 00:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJxmzbiQVFmygH2jOrxAWhxzPjSLw6kZ906hGZBZ7sSirbUQTcNFCtYYrosdTcC1pCpdt+bOOWeDLw7RwI5fnRH58GTtJKWr/QtDeBHnZIYuNlFJUrhBEsiwKkjNi0V/VqbicK+1EIDFttQD/GI5eN95Z1wvKZEJLiWEHVDPlxaRSUzMPP2Qx4WhUOpoRWUrppf9QuBqsZq4Zq/+oZZTYeyL7y4CqO/270yszRTSLBlj6BfK0K5AHijrqJO5E4tXGV7tq2HQiw/Ylon+TUtjbfNJ/n78PpLduhP1pM91d4iUJ88IGfebmN7wN+ip+Pqkta74GkRUBPs7nz8ycKAwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sw17ThhkJAltBjf6l3GFGlLijBdXEW8CVt11EFIROcs=;
 b=Wtgau1keUmjapILP+5K/wXqkvo3NSACA4una8n6n+fDhtusEKc9PsFetgCi+LTJLAONCoBJdcNeVXuoonI8zi0UM3b5GY4mRGsIzqxlSQkFuFkoEsaTgc3hWGsfzY575Evu8M7Tu3/HhU/L2M5S6qlm1chgOUwYM8fdUTggfgr3yjXDzsFsPHKu8SfMDUKzg8fEFSkOSPDvJFX82b0eqBqvxxcu24HehLm+cFJqAo+6m/lJWj4rWI27fL06GmCvLETOh3MoarP7SdfuTVd953SS82l7LhmwN1xOyvD86J9jD1pWHP34YsUASRmitnEZOmpm3TPA3um142sGsORsSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 07:42:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 07:42:35 +0000
Date: Mon, 1 Jul 2024 15:42:26 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f691d40-cc1f-47bd-012f-08dc99a15fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0FIOUJUY1M2SkxXZldkUk5SdnlYYk1vR25SK1dvRjVaWlFqVTJKOVQxNnFs?=
 =?utf-8?B?SUF5aUUwdy9naGcxaHRXcFhLTTdZK0FGMmlmNklYWnF3ekJBQ0xwRVYycVd5?=
 =?utf-8?B?U3dDUDNBcU1WYnVkQTFQcEhUMlVJMlhneXFiN2ladytzUVRWUkRsdXQyODBG?=
 =?utf-8?B?eXU1VU9TVzkrUnJ5SWkvK1h1cmFpQUhtWXVLbllXQUpaRi9wbVYxRGMxVkpz?=
 =?utf-8?B?eVVXZ0pNL253ZFpQZWpYbE9KWXNEa2Z2SW1BcVZ2RXAyemtPMXk0NFh2YU9P?=
 =?utf-8?B?WnM4dkpnaU5VbFljcnBtbk54aHJvQzMvVS9SQmxmZ1JGWjdGdUJUdy9IZjZu?=
 =?utf-8?B?Rk5paUd5cEFtcjlFaklDZS8wcFM0UkJKYWJrNXR2bU9Ia3NaR1ZyMVp1c0hB?=
 =?utf-8?B?eEFzaWdHUUQva0ZDUHMvYmtBNDA5N2hPYWZJTzRkU3FSeEV5amlrdGhVYlVJ?=
 =?utf-8?B?K0FjNXZUV1hLc1dBN0Z4VVhQdXNScWVvdFNibjg5QVMrNG1odUsxb0gvanBC?=
 =?utf-8?B?RUs0WnRRWTZSQW4vTEJDVC8yUWxEbUE0VWl1Yy9LYTZoMmYxV0NaYXF1dXN0?=
 =?utf-8?B?NDAvUzcvb0JmMVp6MmRnSWMwb0NQNEN6cldsNjZuSXMrVmIwdm9XRzdNT25S?=
 =?utf-8?B?QTVETUFNYnZvNVA0VDJpdHBKZTIrVWd1Tm14TW45bWh0bkZCZXg1ZDFWQWtF?=
 =?utf-8?B?NUxGd3NxUFdKVzJtN0VJaXVjU2hyV1l4RDhNblZIZWVSWEVPU2JGSnpwUDJL?=
 =?utf-8?B?dDFoNHNLN0lCNVhDa2huR1dIblE5b1hKcmQzcmVpbldGYlR2enZFWnFxMnlS?=
 =?utf-8?B?LzJJcllNenBPWGphVWdTOXVBN21MTXhvNnhGU3NWb1RmVGQrZkdPaDZ1L3hx?=
 =?utf-8?B?WGVyeG1qNTdmQmVLbWtFa0dWUmFpVWRZcXdja1RIK0JGRFNySDNnVS9Kbkdp?=
 =?utf-8?B?dnU1c1cxeHVZTjNTeHVWWitiTjlPVnl2TGUrRERFbFplVUtDa1lCR0c4Y2w0?=
 =?utf-8?B?RGxoNDhFay9Kd0ZPaW9rTWZ3OGZtZHRKOE1QQjErSFZDS3FoclNpQys0WEM5?=
 =?utf-8?B?VkxlZENhdGIwYTJ3VTNCYW9SUzM4YlFmRWlhSVk1OTZPVTA3bDVyWWUyaSth?=
 =?utf-8?B?cjFBT2xBMy9oS1dSL0Q3WTlJaHRkbVJoM1g0Z0ZpcFJFRU5MaWdyWTJtQ2lq?=
 =?utf-8?B?aWxWTnQ4bW5CU2tlUUdtSWhJZmZkbWRpc1hIb3lVUFhvcjJjUlg0eG4rdUh0?=
 =?utf-8?B?bndFOE13S0lIZ0RTODhMaFVQcEJuZzZUelgzZHVDV0FMcHZVOU1oMHNFMUU4?=
 =?utf-8?B?VHdwSldvb2hYR3hjRTRHQnd1c20xcEtGMzNYWjF3KzVseW5RbytvVENvWWZl?=
 =?utf-8?B?OXNYcE9kS2loUk9IanRDRGZWckRSRXpjdXN1dVJjdW1NUFJJbkduQzhOZGwv?=
 =?utf-8?B?SGx6SUJuYUovdlQ5YkxkQjV3VG15cE9ZMkpUY3doeGFtSXlKZGxTc0F6SDZW?=
 =?utf-8?B?OFVrRGlzRVlqa0FPY0pqNzF0MjZpenJvY05aWk9tMkFuZXhEcjVXYmtybm5Z?=
 =?utf-8?B?K2VTemMvRWw0dlZXUjN0NDZTUFhwWXN0ZmpLT3NIY0tKcnJUNzhJVUl3Yk85?=
 =?utf-8?B?VkhpRmdZR1R2RGYwdWZLaGlJQkNhcnF1T0s4UE1xVFFCR1Z1V1kxeFNjeTR1?=
 =?utf-8?B?dmFwaDRaVjU3RVg4TWhNNFcxMmpORzdJa2xpb3pKUjNhYXJNRmRGeWlDV3p4?=
 =?utf-8?Q?mk130H6qUjP2hFywbkF8fwMWYShrPbYhN/xKi3+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SENOQ0xHdk5nR29VU25NVy9WajEzN1d5cUd6M2tXSU82VUNkVUlPcmNrWHJB?=
 =?utf-8?B?VTlLM2pRRy9Jakc2NTBhSkZpSmNVelF1dFZJY2xkTGdLT3EzMlJjckJwR1hU?=
 =?utf-8?B?UjFyR1hhbzkxdVhrMjhhTUZLSU9WVGNzRzk3WVJ3OGUxbnFQQmhFOHdKcWZE?=
 =?utf-8?B?d20vQStJRzBpeWJEUlU1b1BRQUU2UEE4OEVsR0pUTEl0dmU1Rm04ZWw0MjFx?=
 =?utf-8?B?T09vK1JLK3JsSW1pRmZ4L0hpOStiMDNmWWRhbmNSRVhFeVRRdmVGVlJ5Q281?=
 =?utf-8?B?Q2hQajBZVi9JcmtVVnJ3YzBqZ3pvYVg1OU5FakxGd2ZUSzBVd0VORk1Tc1Vu?=
 =?utf-8?B?M2xyMWdTK3pLUkRGc1BLa2R5R0pxbzRMZTM3dU9aVExSYzJsZ2ZpUDg0N2ZW?=
 =?utf-8?B?ZVplM0RBVUhoQWI1OWpJRS9jVkxPMjRBeEt6T2JiSUxvWkFRL0plOG52UG1Z?=
 =?utf-8?B?bHVOUG5NZlNBUG9GTTFyS25sK0RNV09tWEErbWhnT3BxMER4Z2hTSE9PQ09i?=
 =?utf-8?B?Y09UUFhZZmhhSHkwOFkvRHR4N2VydENwK0pBS3R2NUdvc21MbFZsQ29hb0hi?=
 =?utf-8?B?eFo3dnE0MDhKVndUVVZhMGhDVWlBVTYwSk9kc3B3cm56cUx5SUJFNDBPNlpF?=
 =?utf-8?B?cTRGRnNxby8vK2hrSUNnWlYrblR5TVB2L1pXWXQ2MlFrNWVoeDNLTEcxUlZl?=
 =?utf-8?B?d3crckNZbzlPMXFsdXprbTE1TWJpTC9jWndRaTkwWTlwK2Q0SElReENTbU94?=
 =?utf-8?B?blRvbUh5MW9pZWJ4REx4cEtmdEE5cHk0emNKdk96ZkJJVU5lNVZlQzVnRDJM?=
 =?utf-8?B?L3NVdDNwQWJDZmx0VHM4QTk2cWtvSE9jb0pLKzNrOXpvUFVZdlREZFV5cHZl?=
 =?utf-8?B?S0JzSTAvdWRaemJUeEZWeDJXdkRDOWNkc3d3bEFkeVZSN3dtTlQ2VGJRR2kx?=
 =?utf-8?B?aTZyN2ZuOTRpYW1SNkIzbVBsc3lCVzFPSzhSWXQ3blJVb2VFZXFhWFh1R29r?=
 =?utf-8?B?MzZlZTR6UEV2NHBaU3NTQmVuc3hHdjBUN1ZqL3RCKzNjQVZqb21Ca2ZOd0dp?=
 =?utf-8?B?d3dXK3NpcEJWVkQrN1E1bVpPblZYRnBBSyt0cEpreFZrYndGVktnQ2FUOUVK?=
 =?utf-8?B?d2FQczhzT0RVZFJIRDJ0SnFITnVFWHdDZXRVK0Z1NVVFZXZKaC9lTzZqWlRv?=
 =?utf-8?B?QXpCMUJIemg1OEpvZnNpYjMvVUJBRUhZZXA1dm10MStoUkh1aVpWU3VRUjFR?=
 =?utf-8?B?QnZMczdsei9mMExKMGlUYmNFbG1mMERwVGlzTTJBaVR5Sld1emM4aDlqVllN?=
 =?utf-8?B?b2NJVnptclQxZW5UMWl2enFJc2FXUlMrYXZXRGU5Qjh3alJvNGlNekZEbTQv?=
 =?utf-8?B?dUpTNHJWOCtBcTdteFF4YktzbFpnSkliaElFR0VTSUZWZnAzcS9GZmM5Zmxu?=
 =?utf-8?B?T0RSbWF3Zkhkd0dOUElOSzRRU3RGY1VyQ2hqTzBVeCs2S3A3WUxTQTlQbCt5?=
 =?utf-8?B?QVdHYXN0VnBucjJyRit3TFhYYTZSZm14ckdSNEpxUWc5dlJXbnRLMmxGMVBW?=
 =?utf-8?B?ZFdmQ1lpMWJvRDVyZ3BVZURtTVJyNjNOaU1UK1dDZ0YrbVlmNlROWVd2QzNN?=
 =?utf-8?B?T0EvNkIwZ0pZVE9PRjB3K2ZQc0RNdVMxT3N6dVlTekc5NzlYWHlNdEZoY2Zt?=
 =?utf-8?B?cTBiS3QxSU1nZmhhQURqb1JNSXROUVdhWkpNZ1pKemh5TG9Ua1phajZmUloy?=
 =?utf-8?B?YkFUSEtpL25HcXFqNlNXZUVmRi9wN2laTjZMQmlrVnk0a3lIdStqYWVNc0I0?=
 =?utf-8?B?aVVERzVZSzlMcVF1enJYRWlMcFVtY3FYZlppRmFVQVI1bXdtS1BOcEFMZlNF?=
 =?utf-8?B?LzRHOTh0YlUvM2paTFg4WUp6QzVtM29PU0gzS081WHpxRm13aFovVUFUN3Y1?=
 =?utf-8?B?ZURuVVVBWDlRa2tIb09jaG5XcGZzV1dOYXErQlJvYUxDVXNTTHJHT2llcDRj?=
 =?utf-8?B?bGFaci9BNVBwRkJKd1hYZko1bVh5RW1xSUFZaGNxZVg1L0tvQWpPbjBKOFBZ?=
 =?utf-8?B?cTREYms0VW13K1R2ZmVHMy9LTnUwWWF1dUlSb0xnZlhyRTlYSytmMFhkZCtR?=
 =?utf-8?B?UE5KK1VyTW11ZWs3T3lkamw2M1ZCQkIxa3YyM2tMWVdGdXZqMERUVWRjQnpR?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f691d40-cc1f-47bd-012f-08dc99a15fb2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 07:42:35.7030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3AXopqeBdGnPCh8zRlHTGBdL9wzzpOdnQ0QI6odjxBbCHGW+1fv1GUmS+75Tq8pfAspUdqtyUWWy2TIOn5N0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
X-OriginatorOrg: intel.com

hi, Amir,

sorry for quite late.

On Tue, Jun 04, 2024 at 03:33:39PM +0300, Amir Goldstein wrote:
> On Mon, Jun 3, 2024 at 11:13 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > > On Fri, May 31, 2024 at 6:15 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > >
> > > > hi, Amir,
> > > >
> > > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > > > On Wed, May 29, 2024 at 11:26 AM kernel test robot
> > > > > <oliver.sang@intel.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > kernel test robot noticed a -7.9% regression of unixbench.throughput on:
> > > > > >
> > > > > >
> > > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
> > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > >
> > > > >
> > > > > Jan,
> > > > >
> > > > > I speculate that the regression is due to the fact that we store and pass the
> > > > > path information on struct file_range on the stack before the optimizations
> > > > > in fsnotify_parent(), so rw_verify_area() pays some price for the stores
> > > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > > >
> > > > > Luckily, we already have the way to check
> > > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > > >                                                FSNOTIFY_PRIO_PRE_CONTENT))
> > > > > so now I used it to optimize out the fsnotify_file_range() inline
> > > > > code entirely.
> > > > >
> > > > > Oliver,
> > > > >
> > > > > Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> > > > >
> > > > > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > > > > with pre-content events
> > > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > > * 64108c0b47db - fanotify: pass optional file access range in pre-content event
> > > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> > > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> > > > > * 83af0c89527a - fsnotify: generate pre-content permission event on exec
> > > > > * aca408421327 - fsnotify: generate pre-content permission event on open
> > > > > * 93656e196b00 - fsnotify: introduce pre-content permission event
> > > > >
> > > > > The optimization was done in the first commit (fsnotify: introduce
> > > > > pre-content permission event),
> > > > > but impacts the regressing commit (fanotify: pass optional file access
> > > > > range in pre-content event).
> > > > > no need to test all middle commits.
> > > >
> > > > I directly compare the tip with v6.10-rc1, still a regression but better now
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > >
> > > > commit:
> > > >   v6.10-rc1
> > > >   a82fd282befc7 ("fanotify: report file range info with pre-content events")
> > > >
> > > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
> > > >
> > > > full data is as below [1]
> > > >
> > > >
> > > > then I checked new "64108c0b47db - fanotify: pass optional file access range in pre-content event"
> > > >
> > > > it also has a small regression comparing to its parent, but better also.
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > >
> > > > commit:
> > > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > > >   64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")
> > > >
> > > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> > > >
> > > > full data is as below [2]
> > > >
> > >
> > > Ok, this looks sane, the small overhead in the write path makes sense.
> 
> On second look, while a small regression from 64108c0b47db9 could make
> sense, because it changes the inline fsnotify hooks, the extra regression from
> the tip of the branch a82fd282befc7 makes no sense at all, as it does not
> touch any code that affects the executed functions, so I have to wonder how
> reliable are those results.
> 
> Could you re-test the commits 94167e071109d..a82fd282befc7?

since the branch is:

* a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events  <---
* f301cd18006c3 fanotify: rename a misnamed constant
* 64108c0b47db9 fanotify: pass optional file access range in pre-content event
* 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event           <---
* 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event           <--- parent of 94167e071109d
* 83af0c89527ab fsnotify: generate pre-content permission event on exec
* aca4084213276 fsnotify: generate pre-content permission event on open
* 93656e196b006 fsnotify: introduce pre-content permission event
* 1613e604df0cd (tag: v6.10-rc1,


I made below comparison, which shows little difference among 3 commits:

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
  94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
  a82fd282befc7 fanotify: report file range info with pre-content events

68e04c2451ba03a1 94167e071109d573a5fc1ff3061 a82fd282befc71d99106bf31066
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
 1.174e+08            -0.9%  1.163e+08            -0.5%  1.168e+08        unixbench.throughput


> 
> > > It may have been a "tactic mistake" merging this optimization to v6.10-rc1
> > > a5e57b4d370c ("fsnotify: optimize the case of no permission event watchers")
> > > before the rest of the pre-content infrastructure, because together they
> > > would still be a performance win.
> > >
> > > Can you please compare this branch to v6.9?
> >
> > there is no obvious diff between v6.9 and v6.10-rc1 for this test in our tests.
> >
> 
> This is a bit surprising to me, because a5e57b4d370c should have been a pretty
> big performance win for the common case.

in our this unixbench tests, a5e57b4d370c introduce a small regression comparing
to its parent (477cf917dd028).

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.9
  477cf917dd028 fsnotify: use an enum for group priority constants
  a5e57b4d370c6 fsnotify: optimize the case of no permission event watchers
  v6.10-rc1

            v6.9 477cf917dd02853ba78a73cdeb6 a5e57b4d370c6d320e5bfb0c919                   v6.10-rc1
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 1.219e+08            +2.8%  1.253e+08            +0.4%  1.224e+08            -0.2%  1.216e+08        unixbench.throughput


BTW, for a5e57b4d370c, there is another regression report in
https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel.com/
which also includes some unixbench improvement results, but different sub-tests
on different platform.


> 
> Especially, considering that here [1] you reported in pre-merge testing that an
> identical commit has improved the fstime-r/unixbench workload
> (although with gcc-12):
> [1] https://lore.kernel.org/oe-lkp/Zfj3wxDHolB1qCGO@xsang-OptiPlex-9020/
> and here [2] that a similar commit had improved writeseek1/will-it-scale
> [2] https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/
> 
> Judging by simple_write_begin() in this regression perf report, and
> shmem_file_write_iter in the reports above, may I assume that this report
> was with a kernel with non-default config !CONFIG_SHMEM?
> Is that correct? Is this an intended config change?

we always set CONFIG_SHMEM.

> 
> Thanks,
> Amir.

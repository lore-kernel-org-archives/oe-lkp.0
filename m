Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356914D5AB
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jun 2024 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401428; cv=fail; b=OaFGyVi/QA2ocSc/XfSXvKxzSOnMFwNSM3Xuw9fa1iCKY1umxWIvljsYMECoEP2QJAOBTqSTbpOqXy+yhaMhbsC4qE4CNdOpYc46RuaOMjHE0LUoEit8OrymUlL133XGe/zr/iEEReH3HleF2SIyauoW9ah4Z2FC//CQlgxWjMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401428; c=relaxed/simple;
	bh=ObhRE+orDxgD5Kems/Uq/RYqlSHNP+773C0QfItN5LE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=acDCHXe5cGxDGtV4FPOnDww5s6AvYmpjGTyOeWpcDSd9C9h0eI8B7hM74jvGRg2GyjxlKEKYYpPKgSNOvbwIFcpmqx6tFjxbL6M7jIVvIfIV/s+M4LkqIqbJPIwfookNDLNEK/5SeViWhgFn2IAxqQ0mUWAT+pTy9JilRn6yV7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPBgz+JF; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPBgz+JF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717401427; x=1748937427;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ObhRE+orDxgD5Kems/Uq/RYqlSHNP+773C0QfItN5LE=;
  b=XPBgz+JFscsXNW7OPviT2Zy/QaZhjqG5WHrMNzEUE8dkO79nhMxXSviN
   LCgjYTHZ4YRxRxEsKUSOEmMrOAedD0s6D2ekGQo+uzLb2UgJnyLaNXcmz
   XhKD1E6BPVTsibgiUeCWBgds4Ly/cFvVQ3oMGkNknKf2aFn1P6PqgMPky
   aO0ItmbMYYU8ad3QJYr/94eaMKC1B0C5mdLO6ENvd26dTls8HYKynuh6O
   xd6jWoXxD9H1j6lLBU64ayopicg+mZ5c89XleI9HavOB3bEIWfEY2m92u
   +kMeSui0kvo+GimgKlqaNYJ7O/RLc2tTWaSIto+OFDgeJoJrf3kBK5fI6
   Q==;
X-CSE-ConnectionGUID: 13W50Dg4ToyM0bc7J3KK0Q==
X-CSE-MsgGUID: v21ai4OlQpOs1aLisVQVIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14003837"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14003837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:57:06 -0700
X-CSE-ConnectionGUID: r9aS5uzcQ2ScIbiwefR9aw==
X-CSE-MsgGUID: hE3mQz5WS6mO1EJHmrEkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37396526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 00:57:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 00:57:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 00:57:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 00:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6Xcz93etr6bp2SSTT5pIjbcfxragYnmAHoXa2ELuHyaw0QmPL1k0wIms81NVJ1a9qWxBNZsw4qJM3RTOAmbFvyRJJb3d62EpHicTUpNgP1z9TozJa/0xUQRuhuw/cTS+bU5htou5cZBNqUPYfxEY6v1gl3i8NgAEwZo9P99H1hA4zoWLxG+Wz5Ex6Dh+67I1+EviVS+ba8Qqgow8uEO+PWVQlUTizPVz6osibvJcvmKnY3SualQ92Pgz6XcbTZe2pBMOENformfO5PfBN7i7o/XUStnEXp5uNAV/g4JyOjity/fAsu/bX+Og+H6tqMJLd64Ozoc3gNM6pkGO2DX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqCrJQxapJB87+DQYCYrFFxSLtzPZ8gAEUKwK6eJooY=;
 b=aYySfRpM68vuCdv7zpJbsnYwBO8oAch1CjhLp2+7XPzK+2sDJIM81h3HVJm+8vs0TkBUMw5MbR1zAVkpEzUJHUKI6tkHMXpGht6gKBhcHuRABXXvLRQdOtI3Cn4rFp0vSzqgC6P04vmUB+hwQQ5o4/XX4vLOFjavt106TKBOUYmEqEuEEmca29n/hE70OqSMvhpOuuQnLYpSZo1SpufcaGOr4RQHsNpdisUF8Nodh/Vq9hVsBiWpS/0jp38BeaUo+df0Ekuwdi60evD8nKlupSZ4M12eo8gz7f8U0x1Kp2BQG7eTymTMFR0hJZFb9fF+T2hogjhdjTuu96g4ViD5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 3 Jun
 2024 07:57:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 07:57:02 +0000
Date: Mon, 3 Jun 2024 15:56:56 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 8829cb6189:
 stress-ng.fault.ops_per_sec -2.3% regression
Message-ID: <Zl13SEVfjj9orpW/@xsang-OptiPlex-9020>
References: <202405231056.66ecbb94-oliver.sang@intel.com>
 <CAOQ4uxjGE0cwmacsxSjAkh3otYB0_XRbC1b5i_1iS=iLeEyXqg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjGE0cwmacsxSjAkh3otYB0_XRbC1b5i_1iS=iLeEyXqg@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b62e527-c061-4bba-a950-08dc83a2c0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1pENjVRZmxyajI3TjFFZFZncU0yek8zU0N2eTR4VzNMd3BIWmJJMWFadTVi?=
 =?utf-8?B?dWZlQUVLQW5DaGlxcEJkcnlWb1hTNzV6RGFJd2drRUJVbHc2NThpN0Z1cVVE?=
 =?utf-8?B?anI0ZDZUaEVJQ051NjZsUlpEaVBpeCtMZUozWVhaemtzYi8zbVZkc3dZcGNi?=
 =?utf-8?B?L01lVUNzdnV6ZEFEc0svS0U2OWUrZExsNW5zcEdYRnZtRGo5NlVoaWpCSGx0?=
 =?utf-8?B?WUIvdkg0ZE9pYlRjYndjb3lzN0FNMUFkdGN0THFaZ1B2L2taOTUzSGxXZGtZ?=
 =?utf-8?B?S1dYVkVyRTBJUk4xT0pvUkNwS1FTd2lHbE5ML2huUWhCOXQ4VTYzZlZmTzl1?=
 =?utf-8?B?Y0FoMXVwYitMeGRzeWc5N3NONko5SGhwMUFmOS84YjREcDNPaHQwTlVMNXMr?=
 =?utf-8?B?YXBRZ2xVRmw2RU12akpneWlFTXUvVGNsOFFUcC8yWk9KZnpkMXhEZVA2eFlD?=
 =?utf-8?B?NEx3SXdZN3F1RzllVzQrOUlPV0Rza01vY2ZOcVVWTWJUR3U0b2Z5eVg3ZU51?=
 =?utf-8?B?WXFhdlQydUlkYkljdXZyYS9ia29kL1ovNjAxQXhmNjV1cEd0Tmo3SUlZVUhv?=
 =?utf-8?B?cGxZR2E1WHpvVHYzdTRzMFlJbWk0TTgvWlA3d1g3SldzVE5PVGtyZTQ3cDgw?=
 =?utf-8?B?b0NwU2RQNVphdW5tZ1hvQWFNeEh0TEFpYUxBZndOaVl0TVc2TzNDRzRoNU1q?=
 =?utf-8?B?a2FvR0ljRUtML3RjSTMwcm01VVlmWjJqY2k3OWhQekFKZEhYanEvN0RHQVNv?=
 =?utf-8?B?U29VVjYvUUZlR3RJNGRRdGRFYTducVRSTXJ5RDNoV29lWmNHQkd3ZTlxdDI5?=
 =?utf-8?B?d1lBbWxEWEpkcitTQUt0ZnNnZVF0R1ZhSUdLckhMVjgvbmU5OWpFNVozd2pC?=
 =?utf-8?B?OGIrYXEreXhPYzNWcjZtWlJhVlZzcHdCcDBNdU13TTJ5a2E0UmFVdHBXQm9S?=
 =?utf-8?B?WnRHdFNNQU1YTkVaY3ZLclQxZjFzRzNQMTIvckU1ZUwycGJZMnVWblhTZk5i?=
 =?utf-8?B?aW8xYUhRQUpjRHEyS1lLanpSbm9jbHVKWnZuOFI4MGJVT0tZMm81OGlzWUNN?=
 =?utf-8?B?SzZCQU85eExSNFJyZlg3c0ZKcE1oMDJ5WXhSdTNGUUNJaTk5QjhuVzJMOUF5?=
 =?utf-8?B?VEpEbG5mbnVKcHFDUHFGbDh1NFNBVE1xSDNLMmszNHZMc2ZDTFZqZUw3STVy?=
 =?utf-8?B?MHZ6cFh4Y2tLOGtkQUdFR2ZZQS9yYUczVU9MMjQ3bm96azV6QWxwVnExaFZH?=
 =?utf-8?B?eXk3b0prS0NQNXVDZjVvajE5Z3U2VVVvaG9abG5HTGhtalM4WnpSS0I3dmtq?=
 =?utf-8?B?Q2hKWDFTYnZEMmVOZjdmWGViNStqdVlPK2xOM3pWRU1xYktzNnNKNHozU211?=
 =?utf-8?B?QkRMOTZJTUF1VmNKVVlIbThoVHY3SWYxeDZaSDlSTFNyN2ZKeThlaVJBYmVZ?=
 =?utf-8?B?YVBkZzNzVmh2NTkwVVoyeEgrVTh0c2lZU3k5aEN0ZzY2NFI5NVEvM3EzNHZK?=
 =?utf-8?B?L0c0bUxPWHJHUnUxcnF0S3UzZTdBT1QrNmsxZWQ4c0N1N2RZRjYyUXEwZ2Yv?=
 =?utf-8?B?Y0N4NHZ2em1CYzVTUUVmaVZCUFVMN3pCdnRzQUxGZERtSkVBUXdQMU13YzhT?=
 =?utf-8?B?dkxHSEZEMGF2Q3BwaFZNeVdEM2xwVEdGbWlMNW5XbEpuY1hYVjRUTitmOFdY?=
 =?utf-8?B?RDk1akpZTDdkWUpvZnVYWjdjOTFtd2JRU1cxc0xSeG5ncXVQem9TMUhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldCUW1FTUNaZUN5ZjNQT2NsK1diRHZRa25QeVprYXFrMW9jRER0SEJlT2dD?=
 =?utf-8?B?YXprdXJsdnJ4UnF6Q05SRytqWnplU1VzUk14NGNEZ3pMTkRLbWhHbFhrQ0JG?=
 =?utf-8?B?TmZYS3NQYlFqeEY0NjRwL2Y4OXZnV25tQXcyZEVwTXM1MlAxb1BOcDdycTRU?=
 =?utf-8?B?a1hBTXhpRXl0aThucmkySlltb2hQVDNhaEtNWVFWY2o3NDdmayt2cEVEb3Zh?=
 =?utf-8?B?UUhCUndwVnFGck42OHhibDBiR011QXRIK2JOMW1NWkdEd0hZL1JXbVVvRDhR?=
 =?utf-8?B?RzJlOE1uTUZVcUtJSTgyVVQ3QWZYYWhlYWFMSFpVNDZoTVRKZ1ZxaGI1N2Zx?=
 =?utf-8?B?VjR4ZUYvWDBTSDFFY3dhMjNHWFJKekVRaW5sU1dMYUZxSWNOZnNKOS9mY0RQ?=
 =?utf-8?B?YkhWU0hhVjJaU08vcVV4SjhLR3hLd0pZTWJzVHd1V3cwdnBmbVo3MG1SZWw2?=
 =?utf-8?B?WXVDdm12M2NYVXIwVHNlQVpyVWduWlM1d3lLU2lvMm1DWTIybUlidHgxNjZu?=
 =?utf-8?B?Tm9PZkp2MXIzNnZBQk1XMG93WTZTRG03UnZGUStOM1dLRzZMelBLVkxyWGdx?=
 =?utf-8?B?WVMyazlZQjZIVHQvV0w1MXVlTkM5TG5nMVNmQmxSUldQSncwMCt6VWErYzNr?=
 =?utf-8?B?aElCb2NUUWhrSldwei90ME5SOHBBcjE3M3JHVGMrc2Nyc09qTGdocGNlWWFL?=
 =?utf-8?B?QTB6YmNsTUgvM1JwTnFyUEtQR1VtYjlsZzM0M1ZuMjhpOEFRNFFEWmNScUdH?=
 =?utf-8?B?d1NiUEJHVStxWDdtdlhVRVU2eDZ2WmtwbHR6ZkZ1S0NVa3dxbXV5d1JOT3g0?=
 =?utf-8?B?TmxwU0Q5RzdDb2grYUZBOU9CZ2EvT1F5ZEVXemNNZ254VnVEWVl1cUpqWVRt?=
 =?utf-8?B?TzhBMklwOXJQYnRsd3FQRlVmaEVMUVJ2citQMncvL2xrVVV4WVBORFhBNGNm?=
 =?utf-8?B?RDFrRUcyc2RYMWtPVXhtb2syYU5TRHFtOC9zTTlSRGcvb1dIZlQ0RnVyZ3d6?=
 =?utf-8?B?TjI2L3lOUUFuNmVwNUFKUm5sVk5qSmZJM1pKd1drU3ZObXhIL1lRZFphV1NB?=
 =?utf-8?B?aUdxbjdXQ1JZRXNtd09wUERzSFJyUkZkWWtEdXgySTczQnQ3cndNOVBQRlFS?=
 =?utf-8?B?V2ppSEVBS3VFd3M4L21CNWF6ZjY3MFMwL2IzQ0d4RFJaTWRpYjBRU1B3S3RH?=
 =?utf-8?B?My9jRUZWTDhRbEgzSmlvRFRVY0prMUtLSS9lc0hLamNMaFFseHhDRkNxUHNu?=
 =?utf-8?B?VWcreW5heStXZzBWZEdhU1RKZGdhVHhRVWtIMHlhMzJybHNKdEtnZjYybVcy?=
 =?utf-8?B?UG0wcjJSVU1WR2NsdWFHREJnYnlpS3hvTmFyL0cyalpxUzF6RVVsUHA4cUJo?=
 =?utf-8?B?QW1UcmMxOGs0QVFqN1JRTUJwcmJreTRoNXJFa0R0WEZqRUx5cm9nMEtzUHhF?=
 =?utf-8?B?NWFZUGFTaTYxeXRSNEU1Qlh4bXVyWjdUUllvanRTcFEzOGhTaGhEQWhzMnBX?=
 =?utf-8?B?TG4rZWt2TGVabE5YbEc0dXBSZjNGQjNIM1l3K2pxT0tLbituQVA4SVNMNDBq?=
 =?utf-8?B?SU1kZDVsY1QraVQwa2w3Y2lIYTdzMWtVYjZ0ek9QMjFLYi83RW9RdituZlhU?=
 =?utf-8?B?RGR6UFJoTkc3am1ISGt4KzlwcHNscjZTS1Y3UlFnZVhaQzYrZUloenZhdXlP?=
 =?utf-8?B?V0dRcXVIZVNHcmtRcWtLZWd4NzZkWmlZdnlOeS9ZYmVxVG5TcXg2TGc1V2pW?=
 =?utf-8?B?bldEZVpnRitxYzZWaWpvbDFrNmhmN0o0cHAvMmpJbkNmbWdDZXlsQXowdVVw?=
 =?utf-8?B?UkNFYU9seGVXcWMyRHJYVjZTQ3ZZbjV5bkg0aWtzUElydE92U0JTQTIzcDNR?=
 =?utf-8?B?OFVDclNjY0pkcTFDK0Fmbk9ldkRlcjF2bFpVWkNXWTZzZGc1RE5yWHc3OUdx?=
 =?utf-8?B?TlNkczRXbVlhVHVhSVpIM2VNU0Y5MWEvWE5HVXl2MXJvRTVXR2JyclIyWnZa?=
 =?utf-8?B?UGFRUEJpUHdNbkkxcS9hLzAzbXVXYjFXWHh2NGh1VFBnSStUckdhUHdqRnRx?=
 =?utf-8?B?VjQ5anhKNCt4Z1lCRnVGWUxhazZvc25YT2F4YUY3LzVYNGdBbHQ3RU1Vdm5T?=
 =?utf-8?B?ek42bVdPRzhMZ0VGT1NoZ1RGU2N6cEVacXdvWm9sRy90dVhza0RYV2d0am1W?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b62e527-c061-4bba-a950-08dc83a2c0e8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 07:57:02.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKy/U7o1p3JvsGj+XlEuz9SpKr8nanH/W9/kPi2Zzucsa5NVTN7lPCTV9Blj1kd2kRAUBLfXAZU8//cNrmAfFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-OriginatorOrg: intel.com

hi, Amir,

On Thu, May 30, 2024 at 04:27:57PM +0300, Amir Goldstein wrote:
> On Thu, May 23, 2024 at 5:59 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -2.3% regression of stress-ng.fault.ops_per_sec on:

[...]

> I am scratching my head to figure out why these functions are affected by
> the regressing commit, which as far as I can see only adds
> if (READ_ONCE(sb->s_write_srcu)) test in write helpers,
> which should always be false.
> 
> The only thing I can think of is that s_write_srcu on the same cache line as
> s_inode_*_lock, which impacts performance of acquiring those spinlocks,
> but this explanation seems far-fetched.
> 
> Anyway, I tried moving sb->s_write_srcu next to s_fsnotify_info and other
> read-mostly sb members to see if it makes any difference.
> Also rebased branch on v6.10-rc1:
> 
> * 1d15ffdc12d2 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
> * 5029c0cbd085 - fanotify: activate sb write barriers for pre-modify
> event watchers
> * fda0270c803d - fs: hold s_write_srcu for pre-modify permission
> events on aio write
> * e34d0ca5cdfd - fs: hold s_write_srcu for pre-modify permission events on write
> * afdd0701bfb7 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 61d0f429d8bf - fs: implement 'vfs write barriers'
> 
> Oliver,
> 
> Can you please re-test?

I compare the tip 1d15ffdc12d2 with v6.10-rc1, found there is no peformance
difference now. (if you need full comparison, please let me know). Thanks!


=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp9/fault/stress-ng/60s

       v6.10-rc1 1d15ffdc12d22e06ffa9ca34afd
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
  49171337            +0.0%   49192831        stress-ng.fault.ops
    819521            +0.0%     819879        stress-ng.fault.ops_per_sec


> 
> Thanks,
> Amir.

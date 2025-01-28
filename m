Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05C197A7A
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 03:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738034084; cv=fail; b=hs2ZfCmC98H0Kq0Sg1si5eHp1/8KqhdAe+ayeONrnN9xqi36wng+Mk7FOtjA7fuRSoDN+iYCWE+M2KVgWBKY+QsRBgzxReM+0ig8v2bO5LzsuQXWzgLEfn8d05RJRc2H21IQLEQN8nC2ZwaLGOhuZKLCzWU2GrXYVgD53jIJJD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738034084; c=relaxed/simple;
	bh=h8Onpc4cLQkyzYGxCJFGtInqeGlHSC9Ji++n/Mq8yDE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DXKlOSTQN/Na86wlBruMinwpbHOOM30AjIHWaOpKF3uHvwxyi+ECNotssZJaQoyuXLGG5FffWS4tJg+u5+TPP2gZxZyk8xAgbFAKeXXK1EG4iVggB+EzQHWcIBO/0Z2HnFNcy1znIQHSRxeWTB+Dcvc/KvA4fdAay544wFIXFP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NutMX8sp; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NutMX8sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738034081; x=1769570081;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h8Onpc4cLQkyzYGxCJFGtInqeGlHSC9Ji++n/Mq8yDE=;
  b=NutMX8spCejHeFFkLRwMJw6ygapXgF/YWixeakjnV1BPzc47/JPOFZes
   sZwtk0B4Dg8Gubwn/tyonHZ9dFRRvsT0zyF6NPs4BdR/e/UAQx5ENG6JL
   vdQV1Kxv/PNEa8SVtkaUaX7ApI0oWy1ds/ZGcg9ZEweeN+3ffvl3qBqML
   gyY55msA/3v1r2SUZlUcYzY2ettdgoV8tZpOwHgqctRw7eiDqdYC/69Zd
   iYL9JHf3m8qr2WR0P9yTW9pVsROXfWjE5fdODySvzXMhcbJvIod2YeoF4
   /urCAxFBvCmiloyhivQB3neFnnb4HeSuoNy8kkTBZ5TVIx3xzbdIQi/0/
   A==;
X-CSE-ConnectionGUID: rHvHUtj0QZyIai6dYC6c6g==
X-CSE-MsgGUID: 0+rIaR3IS5GNZjvCZLNOKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38609850"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38609850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 19:14:40 -0800
X-CSE-ConnectionGUID: k7jHbcJQTVSCfyX6x6TV/w==
X-CSE-MsgGUID: JQNdg583Qgav81fthzeTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="139501377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jan 2025 19:14:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 19:14:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 19:14:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 19:14:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVlbZsDxjlGEGQZ/GSkU5jZgq4BR9Faho6rAXmbb0BSb5dEFSRkZi2L77G4znb1RYoTHZay4nq+A2dT+7qBF8QIQNh61Qw2vQf7GmJGO9+BewXcorSfBrj9kxoV7zvqdqZKx8piAetnwAI2rFAoS9VzQxogXIS6vrjyHqpBLuotTHOJURC8mSRjMcwsemgmgaeFPxzwXAyqlLf6xfnAodiWffuek1yxeJVBA3csKoWeCbAR1N4rhuVYnaX/C1ddHCmkmceOIrcMonkcR8LCxmv0JBvfjPVsRwr8piKp3AQOkJy6leN90RzBmE234J5+7cmWbtQYPyZZkD+/egTUNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLr2+Ignt5mFZKwRVXDVLkGtErYqBsk9/K0PqArqMK8=;
 b=uSJSHGGffNkl9hNGdIgKoB4lmJroTJUbs5ccoGD2Aw/JuXsNOB3cylbOLoQdgWUta3L61ciwYrVmftb8rgr1HjQcXuhnFl7NTgbq3EN/HJDhrHHo7JMcEwQilTeYjXzcWPhM8qJ/RXDj6hK73fIjryESYppW/t3hXBZ/rZIB1xmBf9vqcQz6AVnUX1yYc6/Awfi0bMUQ7OhFVIAiM2Lr1fCgFr5Iz/EcPg13VBojSBXo1fcN87hVLrq97QEryKyZQ/mkgU51i0tMIfmstPIE8Zi7QGjyfygNggfORBN24kAFRa1691CZ7fuWr1GUk9TdZ60WtneeKgyFtHir4byIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 03:14:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 03:14:15 +0000
Date: Tue, 28 Jan 2025 11:14:03 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <Liam.Howlett@oracle.com>,
	<lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>, <jannh@google.com>,
	<willy@infradead.org>, <liushixin2@huawei.com>, <akpm@linux-foundation.org>,
	<yang@os.amperecomputing.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH] /dev/zero: make private mapping full anonymous mapping
Message-ID: <202501281038.617c6b60-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113223033.4054534-1-yang@os.amperecomputing.com>
X-ClientProxiedBy: KL1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:820:d::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 153236a8-77f6-4736-8c47-08dd3f49d80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cPj1CZI3CKJ0H1PVDp+SPCCExuwlulh324oHBfdwkRJCp0xgIOM0t9xNFX?=
 =?iso-8859-1?Q?69CzXQqXGh9rG8vv22M4bwdsVeZCHu9c1nFyUp7ld0Tp6iE2Mt8PrVw60z?=
 =?iso-8859-1?Q?/rXFxJ7c+c5gsrThpDNfedOahVuBA24G29t/YwgrVWKIuHuwBHuZ8Cj31/?=
 =?iso-8859-1?Q?2Oy4xLzCgYd2106gqascctC+ZT7mzijtMnO+DsTJ1MEIANVvOWbxLTzR1S?=
 =?iso-8859-1?Q?DE36S2agLR6fu+1AEdltSx6jZ5OD2hIL552EafGD79jHb09VklV9OFQIm2?=
 =?iso-8859-1?Q?kVoeRN0SsOnpnTl9veIzk9tJsiCqf65/+nQ4Doo7lR+5ckQ8NyZIODiy5s?=
 =?iso-8859-1?Q?wMDLRquWnRBBKSAU++u5GH+3NX88Kb8+iazuhUyiENoXaAB4bQJPB35k9e?=
 =?iso-8859-1?Q?YRj1ogqNEaZi3lzMejzb5PQk0xmSSXuRtEm+5swp4E/34uOtAmPbniorXz?=
 =?iso-8859-1?Q?HV0aaStuU9kc//rhhzVlVPJlot9cH0UfXMrNS89yC6D5S4jxr8QKbiU7Vi?=
 =?iso-8859-1?Q?J6Znv2EJ581rD3xruB3u0K0RT87GFX+OXL9LIb69wBaPE59oMxwLEI54Gx?=
 =?iso-8859-1?Q?AOatdEO8SnqxsUDRidFS0GVgDQczi5fCiTKCzfr/FDpEekCmimTgCMJ/tj?=
 =?iso-8859-1?Q?ciTanfRXblqXBTn9QZ8fU/M7Y0PVsOh+tFcRjJis5O2o4W2H0CKvXYo/o/?=
 =?iso-8859-1?Q?+3v9/uGy3oAg420P79ztQhSFJ6B+6O+3W1ItZ7DmrDTTsPbu86KN8J7Y9R?=
 =?iso-8859-1?Q?XFcFzdagn0flM6Bfn3bNxPAv2+jc49xJXRPouImvjDAYouioBMgRETGy8h?=
 =?iso-8859-1?Q?lSeovD170pDOlKvJHT0u7zpe62970XijXeM1fVKJ/gdyswRmdtQysqvYQP?=
 =?iso-8859-1?Q?zJSeDWB8ffXCov2IUgp7CKTbtnWRFmu64R9s6q0SL9dNpsrZx6Vdc+nsfz?=
 =?iso-8859-1?Q?S1egjUOpjI3AvEOWVzW80QjNEVvFHdKkYz0jEikROW1+gwj6tXW3YbeYD4?=
 =?iso-8859-1?Q?12JMYOmvX3Gl8EPg95XJ4Po0CG5XvFQaoq6ALd/qg0Kmud0vJiSWTAMV9y?=
 =?iso-8859-1?Q?qALRwV3nzG6XprfI0aSNszCUlYelHf2Y4mLPv017FfT91SQw5+jsEfsTUI?=
 =?iso-8859-1?Q?+UDnY/X7cjkaSRXE3QwlhceAXhzZXn1Zun9OnIZKK/SnQAXf78PSfm2p25?=
 =?iso-8859-1?Q?YjgDEg1YOYhbNZJBLgr/AhPp4ZAwNddiNOrhFhO341dCYB8wM743kUl0I0?=
 =?iso-8859-1?Q?wITzBkWg47Mv8Dws3ZUNJMmrXZLMAyi1RR8QWSo2dnkWbldv7Y3LDTElID?=
 =?iso-8859-1?Q?wPyX+MgMopGAmo2sMQ4/DVDK6nsv+xDFXv2c94gCk0lUagGC6/TNvxl8ut?=
 =?iso-8859-1?Q?bmhZqz2DVc4u4x82ZfwggkPYe3gk5w9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mHyzmPGQDhx2Z6/Zb5bDiIUVO82jdM1I9Hhrwp5lXS7TxJTefqVIG9BpWa?=
 =?iso-8859-1?Q?9fqw/l4vqp5UZX+LHD7xmdtg+2L/KprVS6Wv6EwUkNz/jYndgli/xGKcOQ?=
 =?iso-8859-1?Q?QstgnDoVDE+ZynKliPtRrER2+sOYxL7uB33eS1tGlrJ8U7g2WYSlMtUcpK?=
 =?iso-8859-1?Q?vS2GJwvI4n7yCPM8LK8N/2tA0vJiicFejWHMjk1NPzKIkuE8mWlCsahur2?=
 =?iso-8859-1?Q?pz4NGLHTUkTNsqdLZ4NqTc0pmMdYFZc5CfbcRgx78ZFgvuCTyxYZF7C9ET?=
 =?iso-8859-1?Q?JdXI0UY3CdeowkMuodWgZ8+NfhECI6sE9dKpNdUTxoqb9InLGpfPk3wpn2?=
 =?iso-8859-1?Q?XdFQMbEgXYoCPls6FZzmjHMc9knUgQSGdcBG5J0VzaVvTxzBtuw02sg6G6?=
 =?iso-8859-1?Q?xc8Huox9YOIg6+zrWjh7gQ72TqXfbsDe78FxH8r+NBuhKSbjeP8R4Vf4Ye?=
 =?iso-8859-1?Q?r3jlpcbnIZEe/3WvuJ605LRcliB4CLjzLYvbOa6jTpAx838V7DwurYcZPB?=
 =?iso-8859-1?Q?R3kyDNGpnxLgXGEJExST9MmEMgMJ5TqzHP1MIkFV514cjL5SrR1GEGboFr?=
 =?iso-8859-1?Q?BK/ZxooGk9FOmo1JxNe5QoKvDU/6gjhfGDxQXAgvRznAkubY9DvFcGCVHj?=
 =?iso-8859-1?Q?OvHc+lyJMRKrTgOu88IT6r1Ex2CzHCXwA+7EDuHTRx2I7z+vnYF0y2hujF?=
 =?iso-8859-1?Q?B9LuIljm5BTdZf4Q0ug2s2SPtuj0od1ale0EcSZAwLHwgvGyqn6yar3eOb?=
 =?iso-8859-1?Q?2ALooi1wisD2tC5ijx5tzHk+L5ZeOZvJw4JJpjnU7Cn1BDAfms2lL4KWdi?=
 =?iso-8859-1?Q?aXi/9BLj0Pbm8DiY4o+jFVlHyu5QY177b+heU9o1Dyp420+x1MAYhhvoM+?=
 =?iso-8859-1?Q?ZMTzbGwN/WQ5kfljsWooZ4aIcGR4uGw6Po9eyvZxu3kTZHNobRLCWSAsr/?=
 =?iso-8859-1?Q?1fVBvxryscnaFEaUmqnLEw6VIvh5wnk1e7QY+549QNVCctv6BDGLdSsUYi?=
 =?iso-8859-1?Q?KTkICm5VA1mdeb4+uJ28vI5ALpKt+2bfjJ4RqrgFf+4i5D8Yvd+r7aRLM+?=
 =?iso-8859-1?Q?KdK8HR9hMwb1TKwOdXp+SkQ81tVJISwPVSgDiN55DNtiiX7RI6nYyhSP5B?=
 =?iso-8859-1?Q?WRg+DeL52WbAIZTOt/F8E12vHN1iMs4Uha/sMEj0uFGayIM6gCchW8b676?=
 =?iso-8859-1?Q?G+iRw0uh9iSZuBu7rJ3wyRPdGZfr5U1eyPvk6DhM0Csm61oCyypcl/FayJ?=
 =?iso-8859-1?Q?b1YO2IrqjBiNdvbWSxe5UavQmNxCTL0M/NQRYYCkfpmJmb64EwDTsSUSJs?=
 =?iso-8859-1?Q?stlfymww08uSO6vAR7C3b0Nddk5pRNvn6n/9uSbAT0EK3i1SRLZ5Io58eO?=
 =?iso-8859-1?Q?zm7cZt1nM4jfra46KKMZ/sPa2YS6tLGy0H4ZbLw0UbHwGqWlBxVYb9yKjE?=
 =?iso-8859-1?Q?Ds2PPSJkDvIDyhoYiU9ZdqL6R0nJrfZOzZG32YslU11PYmRVSw58b0wpIy?=
 =?iso-8859-1?Q?viEzZ82TkciaKf+LhlL3YjEnQJLKxlIo1fMAYhPV3VkG/HC39FPlJ3UV9/?=
 =?iso-8859-1?Q?yVwitG14EvY7yP3B1rtAe3SAzKh1PJwldP3HihcKhlmDbAmF5WYqTioFzp?=
 =?iso-8859-1?Q?7wE82FTYx5b5Aqtp0MH/J/z0NtfKPhvJyAVWA48QxhMfKcVX4h3imNsQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 153236a8-77f6-4736-8c47-08dd3f49d80c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 03:14:14.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWtVbYAEDCHymG3DBifQwt3W/q7T+9ES62K8N2DLB8iXpVpNMK8dI9qzwJFXiZa6HBMQqrj3w1xjGmkUHZgY/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
X-OriginatorOrg: intel.com


hi, All,

we don't have enough knowledge to understand fully the discussion for this
patch, we saw "NACK" but there were more discussions later.
so below report is just FYI what we observed in our tests. thanks

Hello,

kernel test robot noticed a 858.5% improvement of vm-scalability.throughput on:


commit: 7143ee2391f1ea15e6791e129870473543634de2 ("[PATCH] /dev/zero: make private mapping full anonymous mapping")
url: https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/dev-zero-make-private-mapping-full-anonymous-mapping/20250114-063339
base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git a68d3cbfade64392507302f3a920113b60dc811f
patch link: https://lore.kernel.org/all/20250113223033.4054534-1-yang@os.amperecomputing.com/
patch subject: [PATCH] /dev/zero: make private mapping full anonymous mapping

testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	runtime: 300s
	test: small-allocs
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250128/202501281038.617c6b60-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/small-allocs/vm-scalability

commit: 
  a68d3cbfad ("memstick: core: fix kernel-doc notation")
  7143ee2391 ("/dev/zero: make private mapping full anonymous mapping")

a68d3cbfade64392 7143ee2391f1ea15e6791e12987 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.262e+09 ±  3%     -67.6%  1.705e+09 ±  3%  cpuidle..time
   7924008 ±  3%     -88.9%     875849 ±  3%  cpuidle..usage
   1585617 ±  5%     +13.5%    1799302 ±  2%  numa-numastat.node1.local_node
   1667793 ±  4%     +13.2%    1887467 ±  2%  numa-numastat.node1.numa_hit
    399.52           -78.0%      87.79        uptime.boot
     14507           -24.4%      10963        uptime.idle
      3408 ±  5%     -99.6%      13.00 ± 40%  perf-c2c.DRAM.local
     18076 ±  3%     -99.8%      38.67 ± 36%  perf-c2c.DRAM.remote
      8082 ±  5%     -99.8%      19.33 ± 52%  perf-c2c.HITM.local
      6544 ±  6%     -99.8%      14.17 ± 35%  perf-c2c.HITM.remote
     14627 ±  4%     -99.8%      33.50 ± 34%  perf-c2c.HITM.total
      6.49 ±  3%     +10.5       17.04 ±  7%  mpstat.cpu.all.idle%
      0.63            -0.3        0.35 ±  2%  mpstat.cpu.all.irq%
      0.03 ±  2%      +0.2        0.18 ±  6%  mpstat.cpu.all.soft%
     91.17           -29.6       61.57 ±  2%  mpstat.cpu.all.sys%
      1.68 ±  2%     +19.2       20.86 ±  2%  mpstat.cpu.all.usr%
    337.33           -95.3%      15.83 ± 35%  mpstat.max_utilization.seconds
      6.99 ±  3%    +190.2%      20.30 ±  5%  vmstat.cpu.id
     91.35           -34.8%      59.59 ±  2%  vmstat.cpu.sy
      1.71         +1073.6%      20.04 ±  2%  vmstat.cpu.us
    210.36           -12.7%     183.65        vmstat.procs.r
     34204 ±  5%     -41.8%      19899 ±  6%  vmstat.system.cs
    266575           -23.1%     205001        vmstat.system.in
   1609925           -50.9%     790974        meminfo.Active
   1609925           -50.9%     790974        meminfo.Active(anon)
    160837 ± 33%     -77.3%      36534 ± 11%  meminfo.AnonHugePages
   4435665           -18.7%    3606310        meminfo.Cached
   1775547           -44.6%     983546        meminfo.Committed_AS
    148539           -47.7%      77658 ±  2%  meminfo.Mapped
  25332110 ±  3%      -7.7%   23373667        meminfo.Memused
   4245538 ±  4%     -26.2%    3134309        meminfo.PageTables
  14166291 ±  4%     -11.9%   12484042        meminfo.SUnreclaim
    929777           -89.1%     100886        meminfo.Shmem
  14315492 ±  4%     -11.8%   12624243        meminfo.Slab
   1063552 ±  4%     -27.8%     767817 ± 12%  numa-meminfo.node0.PageTables
    125455 ±106%     -83.3%      20992 ±155%  numa-meminfo.node0.Shmem
     48482 ± 67%     -44.8%      26748 ±127%  numa-meminfo.node1.Mapped
   1062709 ±  4%     -21.9%     829672        numa-meminfo.node1.PageTables
   1058901 ±  4%     -27.5%     767469 ± 14%  numa-meminfo.node2.PageTables
    770405 ± 30%     -74.0%     200464 ± 77%  numa-meminfo.node3.Active
    770405 ± 30%     -74.0%     200464 ± 77%  numa-meminfo.node3.Active(anon)
   1146977 ±108%     -94.5%      63226 ±114%  numa-meminfo.node3.FilePages
     52663 ± 47%     -97.8%       1141 ± 55%  numa-meminfo.node3.Mapped
   6368902 ± 20%     -23.5%    4869231 ± 12%  numa-meminfo.node3.MemUsed
   1058539 ±  4%     -27.8%     764243 ± 12%  numa-meminfo.node3.PageTables
    558943 ± 14%     -97.0%      16946 ±195%  numa-meminfo.node3.Shmem
     64129 ±  4%    +885.2%     631788 ±  3%  vm-scalability.median
     45.40 ±  5%   +1368.7        1414 ±  5%  vm-scalability.stddev%
  14364828 ±  4%    +858.5%  1.377e+08 ±  3%  vm-scalability.throughput
    352.76           -88.2%      41.52 ±  3%  vm-scalability.time.elapsed_time
    352.76           -88.2%      41.52 ±  3%  vm-scalability.time.elapsed_time.max
    225965 ±  7%     +62.0%     365969 ±  2%  vm-scalability.time.involuntary_context_switches
 9.592e+08 ±  4%     +11.9%  1.074e+09        vm-scalability.time.minor_page_faults
     20852            -9.7%      18831        vm-scalability.time.percent_of_cpu_this_job_got
     72302           -91.9%       5866 ±  4%  vm-scalability.time.system_time
      1260 ±  3%     +54.9%       1953        vm-scalability.time.user_time
   5393707 ±  5%     -99.6%      21840 ± 49%  vm-scalability.time.voluntary_context_switches
 4.316e+09 ±  4%     +11.9%  4.832e+09        vm-scalability.workload
    265763 ±  4%     -27.8%     191828 ± 11%  numa-vmstat.node0.nr_page_table_pages
     31364 ±106%     -83.0%       5332 ±156%  numa-vmstat.node0.nr_shmem
     12205 ± 67%     -44.4%       6791 ±127%  numa-vmstat.node1.nr_mapped
    265546 ±  4%     -21.8%     207663        numa-vmstat.node1.nr_page_table_pages
   1667048 ±  4%     +13.2%    1886422 ±  2%  numa-vmstat.node1.numa_hit
   1584872 ±  5%     +13.5%    1798258 ±  2%  numa-vmstat.node1.numa_local
    264589 ±  4%     -27.1%     192920 ± 14%  numa-vmstat.node2.nr_page_table_pages
    192683 ± 30%     -73.9%      50195 ± 76%  numa-vmstat.node3.nr_active_anon
    286819 ±108%     -94.5%      15799 ±114%  numa-vmstat.node3.nr_file_pages
     13124 ± 49%     -97.8%     285.03 ± 55%  numa-vmstat.node3.nr_mapped
    264499 ±  4%     -27.4%     192027 ± 12%  numa-vmstat.node3.nr_page_table_pages
    139810 ± 14%     -97.0%       4229 ±195%  numa-vmstat.node3.nr_shmem
    192683 ± 30%     -73.9%      50195 ± 76%  numa-vmstat.node3.nr_zone_active_anon
    402515           -50.8%     197849        proc-vmstat.nr_active_anon
    170568            +1.8%     173597        proc-vmstat.nr_anon_pages
     78.63 ± 33%     -77.4%      17.80 ± 11%  proc-vmstat.nr_anon_transparent_hugepages
   4257257            +1.1%    4305540        proc-vmstat.nr_dirty_background_threshold
   8524925            +1.1%    8621607        proc-vmstat.nr_dirty_threshold
   1109246           -18.7%     901907        proc-vmstat.nr_file_pages
  42815276            +1.1%   43299295        proc-vmstat.nr_free_pages
     37525           -47.6%      19653 ±  2%  proc-vmstat.nr_mapped
   1059932 ±  4%     -26.0%     784175        proc-vmstat.nr_page_table_pages
    232507           -89.1%      25298        proc-vmstat.nr_shmem
     37297            -6.0%      35048        proc-vmstat.nr_slab_reclaimable
   3537843 ±  4%     -11.8%    3120130        proc-vmstat.nr_slab_unreclaimable
    402515           -50.8%     197849        proc-vmstat.nr_zone_active_anon
     61931 ±  8%     -73.8%      16233 ± 34%  proc-vmstat.numa_hint_faults
     15755 ± 21%     -89.8%       1609 ±117%  proc-vmstat.numa_hint_faults_local
    293942 ±  3%     -66.1%      99500 ± 20%  proc-vmstat.numa_pte_updates
 9.608e+08 ±  4%     +11.8%  1.074e+09        proc-vmstat.pgfault
     55981 ±  2%     -69.0%      17375 ±  8%  proc-vmstat.pgreuse
      0.82 ±  4%     -60.7%       0.32 ±  3%  perf-stat.i.MPKI
 2.714e+10 ±  2%    +413.1%  1.393e+11 ±  3%  perf-stat.i.branch-instructions
      0.11 ±  3%      +0.1        0.19 ±  2%  perf-stat.i.branch-miss-rate%
  24932893          +321.8%  1.052e+08 ±  3%  perf-stat.i.branch-misses
     64.93            -7.4       57.53        perf-stat.i.cache-miss-rate%
  88563288 ±  3%     +50.5%  1.333e+08 ±  3%  perf-stat.i.cache-misses
 1.369e+08 ±  3%     +55.8%  2.134e+08 ±  3%  perf-stat.i.cache-references
     34508 ±  4%     -39.5%      20864 ±  6%  perf-stat.i.context-switches
      7.67           -79.6%       1.57 ±  2%  perf-stat.i.cpi
 7.989e+11            -7.6%  7.383e+11 ±  2%  perf-stat.i.cpu-cycles
    696.35 ±  2%     -52.8%     328.76 ±  2%  perf-stat.i.cpu-migrations
     10834 ±  4%     -32.9%       7272 ±  4%  perf-stat.i.cycles-between-cache-misses
 1.102e+11          +310.6%  4.525e+11 ±  3%  perf-stat.i.instructions
      0.14          +426.9%       0.75 ±  2%  perf-stat.i.ipc
     24.25 ±  3%    +855.3%     231.63 ±  3%  perf-stat.i.metric.K/sec
   2722043 ±  3%    +867.7%   26340617 ±  3%  perf-stat.i.minor-faults
   2722043 ±  3%    +867.7%   26340616 ±  3%  perf-stat.i.page-faults
      0.81 ±  3%     -63.3%       0.30 ±  2%  perf-stat.overall.MPKI
      0.09            -0.0        0.07 ±  2%  perf-stat.overall.branch-miss-rate%
     64.81            -2.1       62.72        perf-stat.overall.cache-miss-rate%
      7.24           -77.5%       1.63 ±  3%  perf-stat.overall.cpi
      8933 ±  4%     -38.7%       5479 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.14          +344.4%       0.61 ±  3%  perf-stat.overall.ipc
      9012 ±  2%     -57.9%       3797        perf-stat.overall.path-length
 2.701e+10 ±  2%    +396.9%  1.342e+11 ±  3%  perf-stat.ps.branch-instructions
  24708939          +305.5%  1.002e+08 ±  4%  perf-stat.ps.branch-misses
  89032538 ±  3%     +45.9%  1.299e+08 ±  3%  perf-stat.ps.cache-misses
 1.374e+08 ±  3%     +50.8%  2.071e+08 ±  3%  perf-stat.ps.cache-references
     34266 ±  5%     -41.1%      20179 ±  7%  perf-stat.ps.context-switches
    223334            -2.2%     218529        perf-stat.ps.cpu-clock
 7.941e+11           -10.5%   7.11e+11        perf-stat.ps.cpu-cycles
    693.54 ±  2%     -54.7%     314.08 ±  2%  perf-stat.ps.cpu-migrations
 1.097e+11          +297.8%  4.362e+11 ±  3%  perf-stat.ps.instructions
   2710577 ±  3%    +836.2%   25375552 ±  3%  perf-stat.ps.minor-faults
   2710577 ±  3%    +836.2%   25375552 ±  3%  perf-stat.ps.page-faults
    223334            -2.2%     218529        perf-stat.ps.task-clock
 3.886e+13 ±  2%     -52.8%  1.835e+13        perf-stat.total.instructions
  64052898 ±  5%     -99.8%     124999 ± 22%  sched_debug.cfs_rq:/.avg_vruntime.avg
  95701822 ±  7%     -96.4%    3453252 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
  43098762 ±  6%    -100.0%     148.27 ± 21%  sched_debug.cfs_rq:/.avg_vruntime.min
   9223270 ±  9%     -94.6%     495929 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.78 ±  2%     -94.6%       0.04 ± 22%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.28 ±  7%     -28.9%       0.20 ± 10%  sched_debug.cfs_rq:/.h_nr_running.stddev
    411536 ± 58%    -100.0%       3.77 ±141%  sched_debug.cfs_rq:/.left_deadline.avg
  43049468 ± 22%    -100.0%     844.45 ±141%  sched_debug.cfs_rq:/.left_deadline.max
   3836405 ± 37%    -100.0%      56.30 ±141%  sched_debug.cfs_rq:/.left_deadline.stddev
    411536 ± 58%    -100.0%       3.62 ±141%  sched_debug.cfs_rq:/.left_vruntime.avg
  43049467 ± 22%    -100.0%     809.82 ±141%  sched_debug.cfs_rq:/.left_vruntime.max
   3836405 ± 37%    -100.0%      53.99 ±141%  sched_debug.cfs_rq:/.left_vruntime.stddev
      8792 ± 28%     -81.8%       1600 ±106%  sched_debug.cfs_rq:/.load.avg
  64052901 ±  5%     -99.8%     124999 ± 22%  sched_debug.cfs_rq:/.min_vruntime.avg
  95701822 ±  7%     -96.4%    3453252 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
  43098762 ±  6%    -100.0%     148.27 ± 21%  sched_debug.cfs_rq:/.min_vruntime.min
   9223270 ±  9%     -94.6%     495929 ± 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.77 ±  2%     -94.6%       0.04 ± 22%  sched_debug.cfs_rq:/.nr_running.avg
      0.26 ± 10%     -22.4%       0.20 ± 10%  sched_debug.cfs_rq:/.nr_running.stddev
    411536 ± 58%    -100.0%       3.62 ±141%  sched_debug.cfs_rq:/.right_vruntime.avg
  43049467 ± 22%    -100.0%     809.82 ±141%  sched_debug.cfs_rq:/.right_vruntime.max
   3836405 ± 37%    -100.0%      53.99 ±141%  sched_debug.cfs_rq:/.right_vruntime.stddev
    286633 ± 43%    +421.0%    1493420 ± 42%  sched_debug.cfs_rq:/.runnable_avg.avg
  34728895 ± 30%    +380.1%  1.667e+08 ± 27%  sched_debug.cfs_rq:/.runnable_avg.max
   2845573 ± 30%    +406.5%   14411856 ± 30%  sched_debug.cfs_rq:/.runnable_avg.stddev
    769.03           -85.4%     112.18 ±  6%  sched_debug.cfs_rq:/.util_avg.avg
      1621 ±  5%     -39.3%     983.67 ±  9%  sched_debug.cfs_rq:/.util_avg.max
    159.12 ±  8%     +26.6%     201.45 ±  6%  sched_debug.cfs_rq:/.util_avg.stddev
    724.17 ±  2%     -98.8%       8.91 ± 43%  sched_debug.cfs_rq:/.util_est.avg
      1360 ± 15%     -52.9%     640.17 ± 13%  sched_debug.cfs_rq:/.util_est.max
    234.34 ±  9%     -71.0%      67.88 ± 27%  sched_debug.cfs_rq:/.util_est.stddev
    766944 ±  3%     +18.9%     911838        sched_debug.cpu.avg_idle.avg
   1067639 ±  5%     +31.7%    1406047 ± 12%  sched_debug.cpu.avg_idle.max
    321459 ±  2%     -37.0%     202531 ±  7%  sched_debug.cpu.avg_idle.stddev
    195573           -76.7%      45494        sched_debug.cpu.clock.avg
    195596           -76.7%      45510        sched_debug.cpu.clock.max
    195548           -76.7%      45471        sched_debug.cpu.clock.min
     13.79 ±  3%     -36.2%       8.80 ±  2%  sched_debug.cpu.clock.stddev
    194424           -76.7%      45370        sched_debug.cpu.clock_task.avg
    194608           -76.6%      45496        sched_debug.cpu.clock_task.max
    181834           -81.8%      33106        sched_debug.cpu.clock_task.min
      4241 ±  2%     -96.8%     134.16 ± 27%  sched_debug.cpu.curr->pid.avg
      9799 ±  2%     -59.8%       3941        sched_debug.cpu.curr->pid.max
      1365 ± 10%     -49.6%     688.63 ± 13%  sched_debug.cpu.curr->pid.stddev
    537665 ±  4%     +31.3%     705893 ±  9%  sched_debug.cpu.max_idle_balance_cost.max
      3119 ± 56%    +590.3%      21534 ± 34%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 12%     -70.8%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
      0.78 ±  2%     -95.2%       0.04 ± 25%  sched_debug.cpu.nr_running.avg
      2.17 ±  8%     -46.2%       1.17 ± 31%  sched_debug.cpu.nr_running.max
      0.29 ±  8%     -34.0%       0.19 ± 12%  sched_debug.cpu.nr_running.stddev
     25773 ±  5%     -97.0%     783.41 ±  5%  sched_debug.cpu.nr_switches.avg
     48669 ± 10%     -76.8%      11301 ± 18%  sched_debug.cpu.nr_switches.max
     19006 ±  7%     -99.2%     156.50 ± 11%  sched_debug.cpu.nr_switches.min
      4142 ±  8%     -68.9%       1290 ± 12%  sched_debug.cpu.nr_switches.stddev
      0.07 ± 23%     -94.0%       0.00 ± 57%  sched_debug.cpu.nr_uninterruptible.avg
    240.19 ± 16%     -81.7%      44.00 ± 19%  sched_debug.cpu.nr_uninterruptible.max
    -77.92           -84.6%     -12.00        sched_debug.cpu.nr_uninterruptible.min
     37.87 ±  5%     -85.2%       5.60 ± 12%  sched_debug.cpu.nr_uninterruptible.stddev
    195549           -76.7%      45480        sched_debug.cpu_clk
    194699           -77.1%      44630        sched_debug.ktime
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.01          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
    196368           -76.4%      46311        sched_debug.sched_clk
     95.59           -95.6        0.00        perf-profile.calltrace.cycles-pp.__mmap
     95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
     94.54           -94.5        0.00        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     94.46           -94.1        0.31 ±101%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     94.14           -93.8        0.37 ±105%  perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
     93.79           -93.6        0.16 ±223%  perf-profile.calltrace.cycles-pp.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
     93.44           -93.4        0.00        perf-profile.calltrace.cycles-pp.down_write.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap
     93.40           -93.4        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma.__mmap_region
     93.33           -93.3        0.00        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma
     94.25           -93.3        0.98 ± 82%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
     94.45           -93.0        1.40 ± 51%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     92.89           -92.9        0.00        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file
      0.00            +1.7        1.73 ± 34%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.00            +1.8        1.82 ± 56%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.__mmput.exec_mmap.begin_new_exec.load_elf_binary.search_binary_handler
      0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.begin_new_exec.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve
      0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.exec_mmap.begin_new_exec.load_elf_binary.search_binary_handler.exec_binprm
      0.00            +2.3        2.28 ± 38%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +2.5        2.48 ± 25%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +2.5        2.48 ± 25%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      0.00            +2.5        2.50 ± 48%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +2.5        2.52 ± 31%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.5        2.52 ± 31%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.7        2.68 ± 27%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.00            +2.7        2.71 ± 40%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      0.00            +2.7        2.71 ± 40%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.8        2.76 ± 59%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +2.8        2.85 ± 54%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry
      0.00            +2.8        2.85 ± 54%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
      0.00            +3.0        2.96 ± 53%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64
      0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common
      0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve
      0.00            +3.0        3.03 ± 52%  perf-profile.calltrace.cycles-pp._Fork
      0.00            +3.3        3.31 ± 26%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.execve
      0.00            +3.5        3.54 ± 41%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.00            +3.5        3.54 ± 41%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      0.00            +3.7        3.69 ± 37%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.7        3.69 ± 37%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.00            +3.9        3.89 ± 50%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.00            +3.9        3.94 ± 44%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +5.5        5.54 ± 38%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      0.00            +5.8        5.85 ± 27%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.main
      0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      0.00            +9.1        9.05 ± 54%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +9.1        9.05 ± 54%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +9.4        9.38 ± 52%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +9.5        9.48 ± 52%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      0.00            +9.9        9.92 ± 57%  perf-profile.calltrace.cycles-pp.read
      0.00           +12.0       11.98 ± 50%  perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      0.00           +18.8       18.83 ± 38%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +18.8       18.83 ± 38%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.21 ±  3%     +34.3       35.50 ± 18%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.21 ±  3%     +34.8       35.97 ± 18%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.calltrace.cycles-pp.common_startup_64
      2.19 ±  3%     +49.9       52.08 ± 18%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
     95.60           -95.2        0.42 ±113%  perf-profile.children.cycles-pp.__mmap
     94.14           -93.6        0.54 ±106%  perf-profile.children.cycles-pp.__mmap_new_vma
     93.79           -93.6        0.21 ±171%  perf-profile.children.cycles-pp.vma_link_file
     93.40           -93.4        0.00        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     93.33           -93.3        0.00        perf-profile.children.cycles-pp.rwsem_optimistic_spin
     93.44           -93.2        0.24 ±178%  perf-profile.children.cycles-pp.down_write
     94.55           -93.1        1.40 ± 51%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
     94.25           -93.0        1.30 ± 59%  perf-profile.children.cycles-pp.__mmap_region
     92.91           -92.9        0.00        perf-profile.children.cycles-pp.osq_lock
     94.45           -92.7        1.72 ± 34%  perf-profile.children.cycles-pp.do_mmap
     94.46           -92.6        1.83 ± 31%  perf-profile.children.cycles-pp.vm_mmap_pgoff
     95.58           -45.3       50.30 ±  6%  perf-profile.children.cycles-pp.do_syscall_64
     95.58           -45.2       50.40 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +1.2        1.22 ± 40%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +1.3        1.26 ± 34%  perf-profile.children.cycles-pp.seq_printf
      0.00            +1.3        1.32 ± 78%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +1.6        1.60 ± 42%  perf-profile.children.cycles-pp.sched_balance_rq
      0.00            +1.7        1.73 ± 41%  perf-profile.children.cycles-pp.open_last_lookups
      0.00            +1.9        1.85 ± 31%  perf-profile.children.cycles-pp.begin_new_exec
      0.00            +1.9        1.85 ± 31%  perf-profile.children.cycles-pp.exec_mmap
      0.00            +2.1        2.09 ± 40%  perf-profile.children.cycles-pp.do_pte_missing
      0.46            +2.4        2.85 ± 54%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.53            +2.4        2.94 ± 49%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.53            +2.4        2.94 ± 49%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.00            +2.4        2.44 ±101%  perf-profile.children.cycles-pp.__evlist__enable
      0.00            +2.5        2.54 ± 45%  perf-profile.children.cycles-pp.zap_present_ptes
      0.00            +2.6        2.58 ± 54%  perf-profile.children.cycles-pp.mutex_unlock
      0.00            +2.7        2.68 ± 67%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.00            +2.7        2.71 ± 40%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +2.7        2.71 ± 40%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +3.0        2.99 ± 53%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +3.0        2.99 ± 53%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.search_binary_handler
      0.00            +3.0        3.03 ± 52%  perf-profile.children.cycles-pp._Fork
      0.00            +3.3        3.31 ± 26%  perf-profile.children.cycles-pp.bprm_execve
      0.58 ±  2%      +3.4        3.98 ± 47%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +3.5        3.52 ± 20%  perf-profile.children.cycles-pp.execve
      0.04 ± 44%      +3.7        3.72 ± 18%  perf-profile.children.cycles-pp.__schedule
      0.00            +3.7        3.72 ± 14%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +3.7        3.72 ± 14%  perf-profile.children.cycles-pp.do_execveat_common
      0.51 ±  6%      +3.7        4.25 ± 31%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +3.8        3.79 ± 40%  perf-profile.children.cycles-pp.zap_pte_range
      0.00            +3.9        3.90 ± 26%  perf-profile.children.cycles-pp.do_filp_open
      0.00            +3.9        3.90 ± 26%  perf-profile.children.cycles-pp.path_openat
      0.00            +3.9        3.91 ± 43%  perf-profile.children.cycles-pp.unmap_page_range
      0.00            +3.9        3.91 ± 43%  perf-profile.children.cycles-pp.zap_pmd_range
      1.18            +4.0        5.20 ± 19%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.19 ± 23%      +4.0        4.21 ± 32%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.77 ±  3%      +4.0        4.79 ± 27%  perf-profile.children.cycles-pp.exc_page_fault
      0.76 ±  3%      +4.0        4.79 ± 27%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +4.1        4.13 ± 38%  perf-profile.children.cycles-pp.do_sys_openat2
      0.00            +4.2        4.15 ± 35%  perf-profile.children.cycles-pp.unmap_vmas
      0.00            +4.2        4.18 ± 91%  perf-profile.children.cycles-pp.kthread
      0.00            +4.2        4.22 ± 91%  perf-profile.children.cycles-pp.ret_from_fork
      0.00            +4.2        4.22 ± 91%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +4.3        4.25 ± 37%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.00            +5.5        5.54 ± 38%  perf-profile.children.cycles-pp.exit_mm
      0.00            +6.1        6.09 ± 48%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.__cmd_record
      0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.cmd_record
      0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.handle_internal_command
      0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.main
      0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.run_builtin
      0.00            +7.3        7.28 ± 26%  perf-profile.children.cycles-pp.exit_mmap
      0.00            +7.4        7.40 ± 27%  perf-profile.children.cycles-pp.__mmput
      0.00            +8.5        8.52 ± 58%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +8.6        8.56 ± 52%  perf-profile.children.cycles-pp.__fput
      0.00            +9.1        9.05 ± 54%  perf-profile.children.cycles-pp.ksys_read
      0.00            +9.1        9.05 ± 54%  perf-profile.children.cycles-pp.vfs_read
      0.00            +9.7        9.72 ± 54%  perf-profile.children.cycles-pp.read
      0.00           +16.0       16.03 ± 41%  perf-profile.children.cycles-pp.do_exit
      0.00           +16.0       16.03 ± 41%  perf-profile.children.cycles-pp.do_group_exit
      1.70 ±  2%     +26.7       28.38 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.21 ±  3%     +35.2       36.40 ± 15%  perf-profile.children.cycles-pp.cpuidle_enter
      1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.children.cycles-pp.start_secondary
      1.22 ±  3%     +35.7       36.87 ± 15%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.common_startup_64
      1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.do_idle
     92.37           -92.4        0.00        perf-profile.self.cycles-pp.osq_lock
      1.19 ±  3%     +29.6       30.75 ± 22%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.17 ±142%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      0.19 ± 34%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      0.14 ± 55%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      0.14 ± 73%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      0.10 ± 66%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      0.11 ± 59%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
      0.04 ±132%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.07 ±101%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.02 ± 31%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.02 ±143%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      0.10 ± 44%     -99.5%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.12 ±145%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.04 ± 55%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.25 ± 41%     -95.8%       0.01 ±144%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.11 ± 59%     -99.1%       0.00 ±115%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.40 ± 50%     -99.6%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.32 ±104%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ± 12%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.08 ± 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.01 ± 42%     -90.6%       0.00 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.18 ± 57%     -99.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.03 ± 83%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.01 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.32 ± 47%     -97.1%       0.01 ± 55%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.07 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
      0.26 ± 17%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.02 ± 60%     -83.3%       0.00 ±141%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ±128%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.06 ± 31%   +1806.3%       1.16 ±127%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.00 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
     25.45 ± 94%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      4.56 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      3.55 ± 97%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      2.13 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      3.16 ± 78%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
      0.30 ±159%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.61 ±100%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.03 ± 86%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.20 ±182%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      3.51 ± 21%    -100.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.83 ±160%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.09 ± 31%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.59 ± 11%     -99.6%       0.01 ±158%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      1.60 ± 69%     -99.9%       0.00 ±104%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.81 ± 43%     -99.8%       0.00 ±223%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.02 ± 88%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.02 ±  7%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.68 ± 32%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.01 ± 49%     -92.3%       0.00 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     12.26 ±109%    -100.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      5.60 ±139%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.03 ±106%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      2.11 ± 61%     -99.6%       0.01 ±160%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    171.77 ±217%     -99.7%       0.54 ±195%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.67 ± 25%     -99.7%       0.01 ± 47%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
     37.84 ± 47%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
      4.68 ± 36%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.21 ±169%     -98.4%       0.00 ±145%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      7.92 ±131%     -99.6%       0.03 ± 75%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.36 ±186%    -100.0%       0.00        perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     33.45 ±  3%     -88.6%       3.82 ± 80%  perf-sched.total_wait_and_delay.average.ms
     97903 ±  4%     -98.0%       1998 ± 22%  perf-sched.total_wait_and_delay.count.ms
      2942 ± 23%     -96.3%     109.30 ± 43%  perf-sched.total_wait_and_delay.max.ms
     33.37 ±  3%     -88.9%       3.71 ± 83%  perf-sched.total_wait_time.average.ms
      2942 ± 23%     -97.2%      81.62 ± 52%  perf-sched.total_wait_time.max.ms
      3.97 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      3.08 ±  4%     -96.4%       0.11 ± 94%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    119.91 ± 38%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    433.73 ± 41%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    302.41 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.48 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     23.24 ± 25%     -95.7%       1.01 ± 23%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    327.16 ±  9%     -97.5%       8.12 ±202%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    369.37 ±  2%     -96.6%      12.56 ± 89%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.96 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
    453.60          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    187.66           -95.3%       8.75 ± 90%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    750.07           -99.0%       7.40 ± 73%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1831 ±  9%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      1269 ±  8%     -43.3%     719.33 ± 26%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      6.17 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     14.33 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    810.00 ± 10%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      3112 ± 24%     -96.8%     100.67 ± 72%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     40.50 ±  8%     -97.5%       1.00 ±100%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
     13.17 ±  2%     -44.3%       7.33 ± 28%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     73021 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
     40.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
      1122           -98.5%      16.33 ± 78%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     11323 ±  3%     -93.3%     756.17 ± 25%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1887 ± 45%     -99.9%       2.33 ±117%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1238           -93.4%      81.50 ± 64%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     35.19 ± 57%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      1002           -96.9%      31.26 ± 97%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    318.48 ± 65%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1000          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    966.90 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     20.79 ± 19%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      1043           -97.6%      24.88 ±123%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1240 ± 20%     -98.7%      16.23 ±202%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    500.34           -90.4%      47.79 ± 94%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     58.83 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
    505.17          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     19.77 ± 55%     -68.0%       6.33 ± 54%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1237 ± 34%     -93.3%      83.40 ± 33%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1001           -97.3%      27.51 ±141%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2794 ± 24%     -97.4%      73.62 ± 55%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     49.27 ±119%    -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
     58.17 ±187%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      3.78 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      2.99 ±  4%     -98.1%       0.06 ± 95%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.92 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      4.71 ±  8%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      1.67 ± 20%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      2.10 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
      0.01 ± 44%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.67 ± 21%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.04 ±133%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     67.14 ± 73%     -96.0%       2.67 ±208%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.65 ± 67%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      2.30 ± 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
     42.44 ±200%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    119.87 ± 38%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.80 ± 18%     -99.7%       0.01 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
    433.32 ± 41%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    250.23 ±107%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     29.19 ±  5%     -99.0%       0.30 ± 28%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    302.40 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.40 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      4.03 ±  8%     -96.6%       0.14 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     35.38 ±192%     -99.9%       0.05 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 40%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.72 ±220%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1.00 ±120%     -98.0%       0.02 ±193%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     23.07 ± 24%     -95.7%       1.00 ± 23%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    326.84 ±  9%     -97.5%       8.14 ±201%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    369.18 ±  2%     -98.0%       7.39 ±103%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.89 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
      1.17 ± 16%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.58          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4.42           -27.8%       3.19 ± 26%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    187.58           -95.4%       8.69 ± 91%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±156%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    750.01           -99.2%       6.24 ± 99%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    340.69 ±135%    -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
    535.09 ±128%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
     22.04 ± 32%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
      1001           -98.4%      15.63 ± 97%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     13.57 ± 17%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
     13.54 ± 10%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
     10.17 ± 19%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
     11.35 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
      0.01 ± 32%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
     10.62 ±  9%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.20 ±199%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      1559 ± 64%     -99.8%       2.67 ±208%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      6.93 ± 53%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
     14.42 ± 22%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
    159.10 ±148%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    391.02 ±171%     -99.3%       2.80 ±223%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
    318.43 ± 65%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     13.14 ± 21%     -99.9%       0.01 ±158%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      1000          -100.0%       0.00        perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    500.84 ± 99%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    641.50 ± 23%     -99.0%       6.41 ± 48%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     10.75 ± 98%     -93.5%       0.70 ±  9%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    966.89 ±  7%    -100.0%       0.00        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     15.80 ±  8%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     16.69 ± 10%     -99.2%       0.14 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     41.71 ±158%     -99.9%       0.05 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     11.64 ± 61%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      2.94 ±213%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    175.70 ±210%    -100.0%       0.06 ±213%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      1043           -97.6%      24.88 ±123%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1240 ± 20%     -98.7%      16.28 ±201%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    500.11           -94.3%      28.64 ±118%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     32.65 ± 33%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
     22.94 ± 56%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    505.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     12.20 ± 43%     -60.5%       4.82 ±  7%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1237 ± 34%     -94.0%      74.19 ± 53%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1000           -97.2%      27.51 ±141%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.36 ±190%    -100.0%       0.00        perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      2794 ± 24%     -98.0%      56.88 ± 94%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652E1B95B
	for <oe-lkp@lists.linux.dev>; Fri, 28 Mar 2025 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130856; cv=fail; b=hw3PsKI8sXsdnPTBFc7uMyiJ2EgFZhlcliTE+dS1abJIPDXkGrXSS+2qFAhNAYTjQNKgOpy5UkQbzcOBctv42Cqzw7WxcoqTlKGbuHvn0qnKHkZeRDKYaiJDZ59VeOanOlQAauwjQklQv8tuWXb1uYKGRdII77oQ2v0OWULlGhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130856; c=relaxed/simple;
	bh=EejcxsOCXBIFLTHTV/OPQWJwTpW5j3YFwMiCrEnLXyI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A0XLuQqfveiRECiyqktaymmQYhc08xSw/NdDEk/xDj0eu0SrXjxObW5Nu432zddwPTJl6MIvP1J5Xf/Kam+wFnTnuM5NrwhOWOXsprSOqGukUf1FNPmstVn37g/dah0ES0/Jn7aDy8O77aPGfVAypsxfGg7bMR5+Jx/uM5iUtTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqONfN5j; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqONfN5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743130854; x=1774666854;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EejcxsOCXBIFLTHTV/OPQWJwTpW5j3YFwMiCrEnLXyI=;
  b=AqONfN5jYa0pF2BXuJ3Nnk9lgR4DXdbiSuz/x9badv+8GumyHjf+SLHU
   r3TK+eSEYoKTK+7vDtNf8J0wMS58jJqo07qfLMcgxo3ZvxYcYOaA5YQH/
   LvaI0rQe13JvY5dHzjQ4IJUZHfRNaGsx1YaqifaTD0VXNWazu0ebZEsr6
   iKi6dHQKjvKd6RL0GX0DqP/GUMDMFMQtx+ri65ZkAoX+q1wHureeyQ+wh
   K/P58ZNY9gx4rDSTHvCv2D/HEjWLwkeNcApmqm7b+5PqF1efCIwa4fhOy
   S+C/p7H1tBzlO9WSz9SU7r3lg2PVlcxPh5I8nQaMur412ozqnaYRoHhbR
   g==;
X-CSE-ConnectionGUID: 6qz3HGLSTbmM+Is77PN06w==
X-CSE-MsgGUID: 2TYbn+NxTymyyv6/4Iy27g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44208524"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="44208524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 20:00:49 -0700
X-CSE-ConnectionGUID: nOQTBXEsTIyIrXftU/PhDw==
X-CSE-MsgGUID: 9t2STsohTg+RMDiozCk2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125540678"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 20:00:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 20:00:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 20:00:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oda5gpteJsfM1efPT2SvPtbgT1OxoE8ew6SAk/CKUaMfCYpyZQlqYbj60WW2qIfD9upV5dCWsmEEKqOtWQkejAyle6/8/2WEqmpIhetJeitEnaxGBi5JStRdKPyt+CHOzGcB3oFYwK1uKr5tuyFUQY8xQSI8XKjdJaIQBzFyp5vWni6pJsheBp/fyHU+I08ZTTlWf8eDk7V8yGdEBalg5kfWa/dh+kfxT/dQL2gqFK8LQJ5R0MHL9NO2BE0Iz4KN2qjYtUTzsI8NZIsD7mitrOl9Xh/JMvZn4gFkwsAQnexp+guu6YfBXu6yB0ye4HA/zVuJdrOMfXdtt5yABjojmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FU0h4wyXWVYf16onoHZUgqbskCHTxaB/oTZ5ag64gc=;
 b=ueFJ4lZ8rHqkvA/KZ2SfglwRrnlqUM9RHvpIF+HtihITfvaH3dje4HZxYR1pMa9lJugSbHfjWW4buQVbgVQb1qYm027FfIpEGewBLYZg7qYgi1pgI+Cl08sgvYPED6G33EvWQbOiOYSPdStmltFjliIkFVLpqt19Uhmt3mNKGZlpwO4qIsfgj9rdfgx2R9W5Tv9xJHdSwJD1EwLR5yhEiTB2HHOoz4tnG3HLXymleupxkYlxzlCdRr/PWx57o8t7Irp+te/Yywcu9w9xva2Af6NI/vEYxZ92xdQDhiTUxlE85Ks4rTndgVU5ObLH9hHnFA7oSNws1ihx6g6ls627Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:00:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:00:45 +0000
Date: Fri, 28 Mar 2025 11:00:37 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [landlock]  9d65581539:
 WARNING:suspicious_RCU_usage
Message-ID: <Z+YQ1Un2QgAYvmos@xsang-OptiPlex-9020>
References: <202503261510.f9652c11-lkp@intel.com>
 <20250327.ahthiSoh4Nec@digikod.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327.ahthiSoh4Nec@digikod.net>
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0068c3-f4fc-4af5-c7a3-08dd6da4bbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kL1KSMWlgPbaR0UNXlgCDuzTKj3z49t+XMP5cHO0gy7btMclbnFkWIWJxA?=
 =?iso-8859-1?Q?4QybWCB1VBMJAv9yN6iQ5+3N1i79oNgOHDiVHGGXErZRmQhMWj3hBdI+Pk?=
 =?iso-8859-1?Q?W8iUFT3YUQ8zwsXyWGsd4BS+5yviUHFwYa8CfaqdVODPDdAlnkqTFkooua?=
 =?iso-8859-1?Q?6ZMzr21TkChlLk3Jm7K3NoS+4t4t/AX69stfSdsNcmXx/h6+dPZ7nu6px4?=
 =?iso-8859-1?Q?oeEsnT0cjlwl3YSuktN3dpGdOdvRwFiwPUqhz1Li7owJ9kEQjNE83FRG66?=
 =?iso-8859-1?Q?UR3jZij1tVKHrsVcH9NRrUS0h2+CSROsfTkh9ESYGoGmU4nSXf3tOu2l3G?=
 =?iso-8859-1?Q?33G5g9M4DYPoSdvuV0qG2B7MuvBt7Chby4UBwvqFP2qYSVy2HWGssGfqPn?=
 =?iso-8859-1?Q?qgHO2D5EdqVPbIWSFa6mbnTf8BKUDzu40dY+WpvI11bvjTzcgUNXmVjnhh?=
 =?iso-8859-1?Q?6Va9z0JBIHtZunMJ+wvPfFIvAuLO/Kc4xEL4MKKFJ/4Uld1cvf8QuDt/DU?=
 =?iso-8859-1?Q?/5JSGLXUT5SrMGdAVYdqSnKBHKfvQerJiTQ+SrjHOCBXtjShRtyakpk3iq?=
 =?iso-8859-1?Q?m8aGO1D7vG8hN2uis/gPRD8Z4XeQay/6IzQhZxll1v8vbmHU9oVWCrKGAD?=
 =?iso-8859-1?Q?AYhftagcZaWq+TK4TCzg0C7n8DiO5R0GcnQn03Ewqf2MgXn9GddadlovE1?=
 =?iso-8859-1?Q?q2IiM/SA5cE3dHnQ4Y3mTIn/ixy0hNZENnti+sAw07TVLdPuGbryIxvxY4?=
 =?iso-8859-1?Q?Pske5BVZefYUkFQax957jflZxJDuK06JUh8ajUbs3KtxUcMOR7IxQe23CE?=
 =?iso-8859-1?Q?0nAxlDQpNMqBzPYnP7bCcCpKFzNKggiilWhDMPoe4QsyFuQs+w8+VT98Qo?=
 =?iso-8859-1?Q?vBIvB4Agmvv1Pn5hF+sRMklzevkw6pUka7+AxPICocjlV+A5B+3DD0z6Oh?=
 =?iso-8859-1?Q?eg5DvXMfCVVR2KOCn9nhKtbV3V7tPkHWSB2hB4MAVugO8qmk76MNHL9vi7?=
 =?iso-8859-1?Q?UYIpDl+P0VWMPhlF6gADVvztPqppGtXotUAHP73deuvbpDNveodvqZ0FPy?=
 =?iso-8859-1?Q?PzrukLFwqufQOT46mMH0mda2c7tBR2t3xl/DiLmgKD+Y8zbBD6z9T5nCBy?=
 =?iso-8859-1?Q?Ruk/0JIo0fZUH1Fvv3Tkn4qvuDfZijdNxcZjfN5ibsy+wEoUwBp0XyIUoD?=
 =?iso-8859-1?Q?xEwgulJwKMREBilA6OjN+FgN1tfuLC2+FVxhPdVQXBjaKjl5oEIOt01+YS?=
 =?iso-8859-1?Q?lX7JCumhKn9Qvx2M2422TbRqa/bUke5uszEG3C3dENXpHN7YKsXSKB24iI?=
 =?iso-8859-1?Q?47lHD3rnjQfxmTXZ8cYsftdAdNhpcNk78lXJtsgs/dNQBdxNFumyGlQxmh?=
 =?iso-8859-1?Q?y2/NR3ZTuEF5ZxdErTZ9yv6dXH4O0KxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pF4wi4bmQbQ/BX+q7o3u/WSZpcKtLJ7n4ELlddq3cU9n1NjoW96z0aJb45?=
 =?iso-8859-1?Q?8dLjr1kMq8VkLofisVwDzk9j3YM9Dh4MEpEeTueQg8Cfp7H9dfFr0g8gHZ?=
 =?iso-8859-1?Q?1IkOJnW2ecXCSB07Ucbbtke0mi7/2VyGlPAOJt7lvxhIfbKVk1zED3cHF5?=
 =?iso-8859-1?Q?nSbumafaSl75lViehUquc+ZpSMBv2udkDRvwGxM6EgdWlij3vc9fEGHY8Q?=
 =?iso-8859-1?Q?BVUegNcRlPcXWOQdZIWsfk6N8vEd3zNhwdohZV3ZhBNXTQ7HaCGTRZIvpv?=
 =?iso-8859-1?Q?TzECGyAAzxQtXCdGsB0MLWfJXXZEAo2X9PJKaEuhmTIKaJoulS3ytC51GH?=
 =?iso-8859-1?Q?oJBR4mOAyjcEVzq/iCBJX+u3peDb0e+sIWjj4TXJGSOKtnTsLTOO/ujpt9?=
 =?iso-8859-1?Q?n8Dm9WuXS3JVlS8fKYqkoV5leOmJbtfxfnNLx1CLCtNHl7dxyfVShTqt1c?=
 =?iso-8859-1?Q?Tl06m5uNQaOg1XZlpTMkDPoHZ5Ko39nmiytPxCBAUMQbuoa8qB3KEaHC9o?=
 =?iso-8859-1?Q?5Gqudq2jRuOKNe31bPanbW1NYZAG56/smigYQP+THEkWK1RuTG1p3TaPkU?=
 =?iso-8859-1?Q?HNYiDHMTLbm+ua3jDfifiwvqnQYQ0QXPP20S/1vWQi5dDV3HEN1nF8M2lB?=
 =?iso-8859-1?Q?YO2J3HgWJvE5xk7a4cXHON+neMlB7/BBY+c4YX2cpQl3k5VluN/i8dKwS9?=
 =?iso-8859-1?Q?1muwlAq8x3dYodI8YLFLMI/78Iq1JTIHzvLiT8mxW2Y3X0gwETloCnZTie?=
 =?iso-8859-1?Q?Ab3teQp7lU7xu4klIBv4k7WAGdswa0E2CCMS2KYLvDcqHAalQxeOz2o9Rd?=
 =?iso-8859-1?Q?6ome/e4l6OqlK5iPVbYXB6BXDZwIPJn3pw9vUM6ruQCAyMysinE/3i+c+G?=
 =?iso-8859-1?Q?HBGpTtg31khSIQKoZ1CDxWLt919FuO+fKIveHsJat1vbOQzK32aKTu3YmP?=
 =?iso-8859-1?Q?r8y/RqNcLG+TqoQ3tClnpdkNJMt8ZKnE1UrUfiVAyBKd111b8WeeHp+DrH?=
 =?iso-8859-1?Q?jMXsEobPwspa8HJbUC1j1uhf8I4rB59ZGHvasdXbGWz87R3O+lEiM2RLvA?=
 =?iso-8859-1?Q?J0fA2MCeVlrnTszV+NK5M6db6SMvQvptlUT/kACszm+jRGnC7Yg4qYliyj?=
 =?iso-8859-1?Q?fEeIc+Y+RDBqd3QzO25bktV7zfw26bmAsLO01yRTeIPfWGpwDBTNo79A9p?=
 =?iso-8859-1?Q?8dWOhFnX5lJ5Ukmk2rzTaXGy6Al3X92vlAwQZncAPGAguH/T/Y6Qp8cgzE?=
 =?iso-8859-1?Q?leUKceIbfmqzRyyJuwGaxBlGqncx3u/5LOKEUpBPDdrCfloaeJbR0LPae/?=
 =?iso-8859-1?Q?deDm2gFvoSywUZmeHjedjGsruU0f4TcyqSWgp8nMQlu9E2GGUHXu7/x5//?=
 =?iso-8859-1?Q?Miqj+X3j9DGdnyyWpZTm9o7dqXRzjnWDEL4GCp2QU8owMC2WENGFCZ/VV2?=
 =?iso-8859-1?Q?bb9Nla2JYJDBx+cZgzzTyIngjHn91JXxE9g/aJZW3s2+F9BLbwqGVFMLiS?=
 =?iso-8859-1?Q?ZJK6NLuhvbn/qoNnHdHwWEzV9qwhJzPZy01M/5LUujk2iSDSwEJqfmGnk3?=
 =?iso-8859-1?Q?1v1Dl2DF91+zcmjlDSMesJoyCy8zJ9cfE3JbqspTEVXaTe2HbfXnkvlbRN?=
 =?iso-8859-1?Q?AotxpNhQx+uAEet6q2K2DyLGwFqvtem5UEpU52dyrXXlSrBdhPTOUAxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0068c3-f4fc-4af5-c7a3-08dd6da4bbbf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:00:44.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCeVROCW6s+0Dw0i/Vxqh1FGNQsO0aN/mdvhswHqVxBXmvbUKTdqbUMYavFFCjA+LXw2le5NWG//rGcH42BPEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
X-OriginatorOrg: intel.com

hi, Mickaël Salaün,

On Thu, Mar 27, 2025 at 07:41:08PM +0100, Mickaël Salaün wrote:
> Hi Olivier,
> 
> I pushed an updated yesterday in linux-next that should fix this issue
> and this other issue too:
> https://lore.kernel.org/all/20250326.yee0ba6Yai3m@digikod.net/
> 
> Could you please confirm that these issues are really fixed? Or
> otherwise, please let me know when I should expect (or not) an email
> from kernel test robot. :)

ok, we've started the tests for both issues. upon the commit:
db8da9da41bce (tag: next-20250327, linux-next/master) Add linux-next specific files for 20250327

if this is not the correct commit to check, please let us know. thanks!

> 
> Regards,
>  Mickaël
> 
> On Wed, Mar 26, 2025 at 04:00:12PM +0800, kernel test robot wrote:
> > 
> > hi, Mickaël Salaün,
> > 
> > we just reported a random
> > "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN"
> > issue in
> > https://lore.kernel.org/all/202503261534.22d970e8-lkp@intel.com/
> > 
> > now we noticed this commit is also in linux-next/master.
> > 
> > we don't have enough knowledge to check the difference, but we found a
> > persistent issue for this commit.
> > 
> > 6d9ac5e4d70eba3e 9d65581539252fdb1666917a095
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage
> >            :6          100%           6:6     dmesg.boot_failures
> >            :6          100%           6:6     dmesg.kernel/pid.c:#suspicious_rcu_dereference_check()usage
> > 
> > below full report FYI.
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:suspicious_RCU_usage" on:
> > 
> > commit: 9d65581539252fdb1666917a09549c13090fe9e5 ("landlock: Always allow signals between threads of the same process")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > 
> > [test failed on linux-next/master eb4bc4b07f66f01618d9cb1aa4eaef59b1188415]
> > 
> > in testcase: trinity
> > version: trinity-x86_64-ba2360ed-1_20241228
> > with following parameters:
> > 
> > 	runtime: 300s
> > 	group: group-00
> > 	nr_groups: 5
> > 
> > 
> > 
> > config: x86_64-randconfig-101-20250325
> > compiler: gcc-12
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202503261510.f9652c11-lkp@intel.com
> > 
> > 
> > [  166.893101][ T3747] WARNING: suspicious RCU usage
> > [  166.893462][ T3747] 6.14.0-rc5-00006-g9d6558153925 #1 Not tainted
> > [  166.893895][ T3747] -----------------------------
> > [  166.894239][ T3747] kernel/pid.c:414 suspicious rcu_dereference_check() usage!
> > [  166.894747][ T3747]
> > [  166.894747][ T3747] other info that might help us debug this:
> > [  166.894747][ T3747]
> > [  166.895450][ T3747]
> > [  166.895450][ T3747] rcu_scheduler_active = 2, debug_locks = 1
> > [  166.896030][ T3747] 3 locks held by trinity-c2/3747:
> > [ 166.896415][ T3747] #0: ffff888114a5a930 (&group->mark_mutex){+.+.}-{4:4}, at: fcntl_dirnotify (include/linux/sched/mm.h:332 include/linux/sched/mm.h:386 include/linux/fsnotify_backend.h:279 fs/notify/dnotify/dnotify.c:329) 
> > [ 166.897165][ T3747] #1: ffff888148bbea60 (&mark->lock){+.+.}-{3:3}, at: fcntl_dirnotify (fs/notify/dnotify/dnotify.c:349) 
> > [ 166.897831][ T3747] #2: ffff888108a53220 (&f_owner->lock){....}-{3:3}, at: __f_setown (fs/fcntl.c:137) 
> > [  166.898481][ T3747]
> > [  166.898481][ T3747] stack backtrace:
> > [  166.898901][ T3747] CPU: 0 UID: 65534 PID: 3747 Comm: trinity-c2 Not tainted 6.14.0-rc5-00006-g9d6558153925 #1
> > [  166.898908][ T3747] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [  166.898912][ T3747] Call Trace:
> > [  166.898916][ T3747]  <TASK>
> > [ 166.898921][ T3747] dump_stack_lvl (lib/dump_stack.c:123) 
> > [ 166.898932][ T3747] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6848) 
> > [ 166.898945][ T3747] pid_task (kernel/pid.c:414 (discriminator 11)) 
> > [ 166.898954][ T3747] hook_file_set_fowner (security/landlock/fs.c:1651 (discriminator 9)) 
> > [ 166.898963][ T3747] security_file_set_fowner (arch/x86/include/asm/atomic.h:23 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:457 (discriminator 4) include/linux/jump_label.h:262 (discriminator 4) security/security.c:3062 (discriminator 4)) 
> > [ 166.898969][ T3747] __f_setown (fs/fcntl.c:145) 
> > [ 166.898980][ T3747] fcntl_dirnotify (fs/notify/dnotify/dnotify.c:233 fs/notify/dnotify/dnotify.c:371) 
> > [ 166.898996][ T3747] do_fcntl (fs/fcntl.c:539) 
> > [ 166.899002][ T3747] ? f_getown (fs/fcntl.c:448) 
> > [ 166.899007][ T3747] ? check_prev_add (kernel/locking/lockdep.c:3862) 
> > [ 166.899011][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 166.899023][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > [ 166.899038][ T3747] __x64_sys_fcntl (fs/fcntl.c:591 fs/fcntl.c:576 fs/fcntl.c:576) 
> > [ 166.899050][ T3747] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
> > [ 166.899062][ T3747] ? find_held_lock (kernel/locking/lockdep.c:5341) 
> > [ 166.899072][ T3747] ? __lock_release+0x10b/0x440 
> > [ 166.899076][ T3747] ? __task_pid_nr_ns (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 kernel/pid.c:514) 
> > [ 166.899082][ T3747] ? reacquire_held_locks (kernel/locking/lockdep.c:5502) 
> > [ 166.899087][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > [ 166.899093][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 166.899099][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 166.899111][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > [ 166.899119][ T3747] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:469 kernel/locking/lockdep.c:4409) 
> > [ 166.899124][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 166.899129][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > [ 166.899134][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 166.899139][ T3747] ? do_int80_emulation (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 arch/x86/entry/common.c:230) 
> > [ 166.899149][ T3747] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > [  166.899155][ T3747] RIP: 0033:0x7f55ad007719
> > [ 166.899159][ T3747] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
> > All code
> > ========
> >    0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
> >    6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
> >    d:	00 00 00 
> >   10:	90                   	nop
> >   11:	48 89 f8             	mov    %rdi,%rax
> >   14:	48 89 f7             	mov    %rsi,%rdi
> >   17:	48 89 d6             	mov    %rdx,%rsi
> >   1a:	48 89 ca             	mov    %rcx,%rdx
> >   1d:	4d 89 c2             	mov    %r8,%r10
> >   20:	4d 89 c8             	mov    %r9,%r8
> >   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
> >   28:	0f 05                	syscall
> >   2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
> >   30:	73 01                	jae    0x33
> >   32:	c3                   	ret
> >   33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
> >   3a:	f7 d8                	neg    %eax
> >   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
> >   3f:	48                   	rex.W
> > 
> > Code starting with the faulting instruction
> > ===========================================
> >    0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
> >    6:	73 01                	jae    0x9
> >    8:	c3                   	ret
> >    9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
> >   10:	f7 d8                	neg    %eax
> >   12:	64 89 01             	mov    %eax,%fs:(%rcx)
> >   15:	48                   	rex.W
> > [  166.899164][ T3747] RSP: 002b:00007ffff6eefb48 EFLAGS: 00000246 ORIG_RAX: 0000000000000048
> > [  166.899168][ T3747] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f55ad007719
> > [  166.899172][ T3747] RDX: 0000000000000027 RSI: 0000000000000402 RDI: 0000000000000043
> > [  166.899174][ T3747] RBP: 00007f55ab92f058 R08: 0000000099999999 R09: 00000000377dd000
> > [  166.899177][ T3747] R10: 0000000084848484 R11: 0000000000000246 R12: 0000000000000048
> > [  166.899180][ T3747] R13: 00007f55acf036c0 R14: 00007f55ab92f058 R15: 00007f55ab92f000
> > [  166.899203][ T3747]  </TASK>
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20250326/202503261510.f9652c11-lkp@intel.com
> > 
> > 
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> > 

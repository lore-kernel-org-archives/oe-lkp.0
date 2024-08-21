Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B431537D5
	for <oe-lkp@lists.linux.dev>; Wed, 21 Aug 2024 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724208980; cv=fail; b=SnB+BrHrjMZaFkFcb+XLsHf159OIU6hFivMK1gWZNEcPlGAVYuWhd3RsNUvHWxlivyr0aO9E4vKattbVDDxB4iqwNM5nO+tj0RDfbMVimlFrrSZJK5GHG9IWe0RC0Z+dCgK98v6OHRXhKEVV5xtMHGzRH3s+XhqFvJiUeu5AscM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724208980; c=relaxed/simple;
	bh=HjVD5n8VXCIBk0mSbJGZNy30h/1ZeYbvsz7EG3dpWWk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rX5Cz8+wOpiM4YJfCOf4OSi0piVO0w3uAusV7rnwTnieNCBzf2JQmQ3H6+u2Ga4vJ4wpowyRjnHCgRtPJWwjqba8ZCfkLFQkoii6+/QpfNqvR7PDJExy/kMr8fskZKR4QHnz/oERusknz3x71aBYtGaxwoSUqAMnM2XMyLmw2jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HP207L4X; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HP207L4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724208979; x=1755744979;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HjVD5n8VXCIBk0mSbJGZNy30h/1ZeYbvsz7EG3dpWWk=;
  b=HP207L4XiLxC22+Z7+DnprJjTSn18XJ6SvYbhTBOaF8KCi7+ZDa/L8Ma
   O2DUMs00eoUNe0RF2JrSSln3l6mWTF25DxsAft0Zg53QOg5wf+0cT2yz5
   lDgZtdOmyM6hOegJqdHLLsJyK+ESG/py/AXr4ujwLljGu4S3aqYU7xF+m
   hg2rLJrur1gNmTD9tKEos22hUzWPcvcclIkRCqNrBLC6OReytqyHP2m3H
   QhFYsGckH/5tykYRMXcavpqRKQ/l++4EwDkSsNeR6Fd1yBnARMULR87/J
   syA9gWyE1IkCw7K2iZHzFjyBd1M+ZgeYYyRqN8gXNf2Y82X1xLw92EQqm
   w==;
X-CSE-ConnectionGUID: 7b3c0AEBQP6OVkMOQdzbrg==
X-CSE-MsgGUID: Mni2iWjcTS21n6IL+0algw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33208271"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="33208271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 19:56:18 -0700
X-CSE-ConnectionGUID: WR2Fu9SiR76VGjwETJ9WRg==
X-CSE-MsgGUID: i1CJO+HIRSGMiXXr7P2KsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="91683720"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 19:56:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 19:56:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 19:56:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 19:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETQZ/pbTLzzyU6K/pTkEQuHzIumQPxe47KHhdRtVuDU+IAj7it93V+Ihggil10Odqxb8VVOD6ZyhL4MMVL8B42F0BggqQsJRy62s6qeEckiJoHcahcCjlUCWbCw/g01CyeNJD58A2BxoCU3GutmrN7v4E80H2mxC7bcCpqxe5EUf8CwlvRVPkNCU5yXaU8v8itM3/ltL2X0+EbJu6NdlzOYA8K8cgbYAlvH/ZQEiRZ/pe3mnxewNMer9m5sQTwpa10lNBpOiDLoVYv9F9XkypSuaV4RTdM/5OkYizJ1Yqsgk5PVJJ4mavBImGHXB5MUazD1/QyuE2VbGBb0lWj5k+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a84nRI79/iR+3UJPKUZ4HH67hA94BdclF77eUhbkBkQ=;
 b=Nn/O5316CLFwxWIzM00OLNRK58YyEPZpzXQ+GkUZfPmdla81cLPP3NdYijDFeCmZcbCKKniEMeG551A2ORFuiaxAS5K/XGpRqlb/rF8DxeOSX24ZO1LKV9SZhjqilV78wN5Lc5/nC253nIrf3DXuoedwNBxxqHZw3QX/PO3kbnZstpevEVHv9iARxAz1PxFFEEXxSA0OXRWwyrXdn3NCnLNFeJnEaAEI9YgxOOIO/eoCI+c9d/+/EHuCtKIinFOgusvaLDtfs5skeEdyzNkxVA97h3xvlG4/vNoXjCKrfl0lC+JiUoLnRvvoDcB8W19Fc/yHsQ5VvUJrC9kAQN7HrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by PH8PR11MB6856.namprd11.prod.outlook.com (2603:10b6:510:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 02:56:15 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 02:56:15 +0000
Date: Wed, 21 Aug 2024 10:56:06 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: Suren Baghdasaryan <surenb@google.com>, <oe-lkp@lists.linux.dev>, "kbuild
 test robot" <lkp@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman
	<mgorman@suse.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Lorenzo
 Stoakes" <lstoakes@gmail.com>, <pedro.falcato@gmail.com>,
	<oliver.sang@intel.com>
Subject: Re: Need your help to check perf of a patch on different archs
Message-ID: <ZsVXRt3ntH0bAv4e@xsang-OptiPlex-9020>
References: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
 <Zr2zuS5BLeJQB20e@xsang-OptiPlex-9020>
 <CAJuCfpHpmaJybByGoBUUVvs9k7_s0gBdOaOVG5G3OePwB66fBw@mail.gmail.com>
 <ZsQyI/087V34JoIt@xsang-OptiPlex-9020>
 <CAGudoHHBm8ufJ_PD9i-ANRJVFStrBbpAGKA3fmQzvZ3UT7ui9A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGudoHHBm8ufJ_PD9i-ANRJVFStrBbpAGKA3fmQzvZ3UT7ui9A@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|PH8PR11MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b703ac3-b81b-4c72-c83c-08dcc18cd2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pj+CCSLrK6Z2fvXMwNJKqvxacWB7O6W/t82fxRzw3REN0hojMRbqBpdwxPFZ?=
 =?us-ascii?Q?3t/zWH9L5NldI8IMslSBqIBl+AdfDu/XUV38f7MWPNsF/9qs6q0GZw/NOHlb?=
 =?us-ascii?Q?PyYSK0CboWjsUpNzNK5dsr+5IkMa8PLK2+J6/+vVKGMjqh0sccdMQxgeXRW5?=
 =?us-ascii?Q?KOqPy5Y39KBjSqIUgXH429Y7Z0A1k0GDGuK9wlJy8BNbL+BQlwq7V5YWN/3A?=
 =?us-ascii?Q?tWx1vOZAJAzpJv4MeVjCo5HrWRrhu/kIaCl36v5lxdww7zvIK1On2SJJP/YA?=
 =?us-ascii?Q?GQssuDJktRfFnAYosLsurBVECre1RUkvguJXVqDXDM32JSy1WjGQGNXh6whq?=
 =?us-ascii?Q?FNrY8Gt7oUnfQfDadrgK3TSPBFH8pjPRvyN/JYHN88Df4oEB1VTwFVWwH5xP?=
 =?us-ascii?Q?OzerzY/21VPC/Q+B+/gLM9gQTXJQPCdmw8NnCQBOeDbMdb2r+xAbedbNFTzW?=
 =?us-ascii?Q?8g6byNPzDL63U3i3eq4yfmTtYARRMey3dYtU1BitnYpvcDThMhFQMu+fHuej?=
 =?us-ascii?Q?XrOpzNj7UTFk6ZfdrDN3lpJFoE1DB+GfTZO9SztpOhx2cCywBZL/rUxZqcnO?=
 =?us-ascii?Q?CI2U0KVKV+wubSYULTxeXfEZSx9v9dVSFhVDelmtlB0scHGHEqMLhrdOCC8h?=
 =?us-ascii?Q?kUrH5IiFlex6mqKitp+rQI0X7ioYOHpftegpi20XgXM5RdY/mWoa+LS6EauC?=
 =?us-ascii?Q?PL4A5pY2lqDRz2htCuOdrpXkWuuC228GH38v8ReIivJqERL5hKe21IhPzuQ8?=
 =?us-ascii?Q?2d2IBV/Pt+clXet2NJhx0SprP2gKenca7pqCX90UEA9cmArzz/fB/RoPOiqS?=
 =?us-ascii?Q?TffOV5hN1jghyrPM10WFNfWNus3rGp71TJBgzIV4nj1EsrrPjWbd4vk/i+uU?=
 =?us-ascii?Q?ob7OjGW+Wh5DDlQem/wGeyFeOiZO/kO2edZcJ99wY0I0HHpQesPO8aMGOzKN?=
 =?us-ascii?Q?fVLzInL1h5Z5iKX34PecfuOiIorRL4x1QG7jXMLWxPM+MU2DtDb9ha+90fu/?=
 =?us-ascii?Q?vo6b8DxASylcQPYgjsko5ZpKT7MAoVdax1GA08JLzb0cVMDmgr0dmelsPahK?=
 =?us-ascii?Q?wzPF31xoMEnWGOxqu07PJ28wiiKVFTvHuB1QWqnINQJu+ilqI88rj5T2gM6V?=
 =?us-ascii?Q?ACvmXJ9E6QpnxslHN5lpV1VjHQ/iht88sqAmCG3Xctx0uwNA3/75nFP4cJ4k?=
 =?us-ascii?Q?SCSk0AgS0gTkacWVVhLUgpXlup2Evsl6bc/uvkBAoROHGQ0C/9I0GtGyljz8?=
 =?us-ascii?Q?IfmO4O/771NnvJZnWhIz9aLVPTqO/+N5wg4Lf79zqy3cj8y59TDX+VYNQYK0?=
 =?us-ascii?Q?zyMsskBkLdUlo6pu2LrvKeHttDqUW/NAJWINvd8JS6n7rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sU+uGk1LUbnB5PQmPB1WjQ3YiwRXhlAxqfO45YVHwBp3VenWIe2KKFCo0Oj8?=
 =?us-ascii?Q?64BVZE7zHZ+MruzS0n2X6Km5N2F8mY0RbKJR/5RFz+qF6anTBR6YtCJUvzCv?=
 =?us-ascii?Q?DNWD7mk21KIGwu5bpODZ301gvhlEGE0k97zKVs/FdoO8ejcgoPMoFksavcCL?=
 =?us-ascii?Q?qhpnZo6xZTKM/JrsmY3T8rQyChv/LotttuD2SKNxKe3XqWBGiQlkAhPwz2vp?=
 =?us-ascii?Q?oxaTwuakGAeDwvb5Sun0Z2cBuDf6mxuDCaE5vRbe+9tcS29Ks8q+6fIe6D3M?=
 =?us-ascii?Q?BFfnKTVRm4cd90lUIqI1zJxkyvxljvRs2popwvs2BzKPwxUQl3v4Q5qN5O6X?=
 =?us-ascii?Q?l2Jz3yyWzTe6zlvarb/eNXvQjg1LqQ42z/TGtt1KENKsnB+hOijqwlrVxbbw?=
 =?us-ascii?Q?CLyVIHVT8fjpnsnGQjvzc1trpSzUCKVM5bYtPZu8eap5a0SoT1EoTGbGOCKa?=
 =?us-ascii?Q?rxg0elByif/YRex/mASJACbLGronRjDwT85m/i3J5ds+vPDGP4TTv6OrN9OE?=
 =?us-ascii?Q?OmFxxwRbxklOhEi2TdZMg8/GsB/khNFUiRBO69DcrkDl/S5jMInmNQ1/ByuI?=
 =?us-ascii?Q?SzfbLQKe2Xcn+HK5muRfm3mqfFniP9LbumsqxzpFnUPMun0SQpmUCFnq8nWY?=
 =?us-ascii?Q?5NPadtYQBYqBwlahqdbgbCpnaNdS2boG2Y7ELh4C+74B08FC7BwrI0zgyseY?=
 =?us-ascii?Q?QsKhjFEVl+d6TeoxzUWSanFpAmcaI25AZC35vP+o/OG5HqjfL5ygKL4nWQ0k?=
 =?us-ascii?Q?PEvIP4jH8nKxJCYJWzz9n0W6bfYhLxR8nvxUpgl4WviSajoteHP54Z0EWQEZ?=
 =?us-ascii?Q?fSdoYdLhJy1a48AXvY7vsxcoMA9+znpgFz7kwUaMXgJ0PwdGBPjsumJH7UFe?=
 =?us-ascii?Q?04xNIaRbiYrvDvjm7WrlF0rZ3Zd2d2ghzzwKd4+MnmkAG8P660Mdi/Icw++c?=
 =?us-ascii?Q?zPGk2GCPPh2qt6qp/CxmPPiWDJIk8yaT1nVaU1Ux8jU9Gx8gxK+MiWFt/dhZ?=
 =?us-ascii?Q?z7RZa6C6IntH2qYQ1nBVrBjAEYLbpaCIcf0UR5uUsjT/wbuu5fW9SsfM6NiA?=
 =?us-ascii?Q?wF9H21p8G4UbJYs2RV2wps/9F12bCoOe6eFZVRB6ZejTEjNlcJ9dJmLczrFI?=
 =?us-ascii?Q?iRSJQt+5rxfMERuMOEQS+zCYCFMN0gViTYmBLU5ySpIlb5mY8PNrvQgrVDcB?=
 =?us-ascii?Q?K2G3M4twrAn2+ictP3ZoUbeYoVMhsCiVeRYelHZyocabIPGxwq6j9aGv2y+V?=
 =?us-ascii?Q?OA0NyzNJNtFaGd3Bywe1HBhKpXkkYfAz9yUvyrj690ctLWoLQyaHwoqXVe/O?=
 =?us-ascii?Q?8caf2vXCs5xqy1jqJZdz7IMgL3aTOc5RxAT9G85lxGHWosTflCf1grIXgCbC?=
 =?us-ascii?Q?GKCL2hITl70rcrM4k5sS4kiuemsVchi4PpdiI8yR/rBnDNbXamD29Kq3trXC?=
 =?us-ascii?Q?RQImUPic15XbRXKpefPb8k8KpAHZKYQxx4uMr7pk5R6daDUcCX7YFBRq620o?=
 =?us-ascii?Q?k8f2vwS8GaIVJZfdyK5vJeSMiQECIV6mnFD1zoEDXGxzN2hW6vnDZ/tROsOO?=
 =?us-ascii?Q?/2MKItXCW3d0SGdXuFEZcuHcgv9XfJPsKyl5NH3mU6c0HfcvbJa+mgxBRRG6?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b703ac3-b81b-4c72-c83c-08dcc18cd2b7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:56:15.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFk3z9jhnPfh4MrjiH3yIFcYSCgFu+TD6Ky6qpM85vd9u+o4UbVUiY3PqlpMT/K3JB35xX8ixlUEO5uPrlQ2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Tue, Aug 20, 2024 at 04:28:29PM +0200, Mateusz Guzik wrote:

[...]

> 
> On that note, Oliver:
> 
> > 6. Ivy Bridge-EP (ivb)
> > model: Ivy Bridge-EP
> > nr_node: 2
> > nr_cpu: 48
> > memory: 64G
> > brand: Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz
> >
> 
> May I suggest retiring Ivy Bridge? :) The answer is probably "no", 

yeah, sorry about that... resource constraint, so basically we only retire
machines when they are broken...

> but
> perhaps it would be possible for you to replace it with an arm64 box?

sorry again, kernel test bot focus on intel platform for now.

> if Intel is open to it I doubt there would be trouble arranging one
> for free (admittedly I would not take any part in any of it)
> 
> -- 
> Mateusz Guzik <mjguzik gmail.com>
> 

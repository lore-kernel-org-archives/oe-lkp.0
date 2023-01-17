Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23001FA7
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673940014; x=1705476014;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=55aRiUYG1F+uXWUMziRoUIIjIBYEkYWCtHPFVikJKAg=;
  b=H9iF1nKqtRDjgUlZ22sN0Uszlc1mA0YuQgHSPZ9KgbIk6XIBAJqGoMxn
   igRHHhXjbH+YHIuLqa0zXim6h2ObCvQZWg9Ohyr2NYnmwr59KGf/+SEhX
   QCajQp31WWy7WRBt2168G9emWoKlHRz86a/3nKIRbqj5wtrGN0rcWUpMU
   TWI4ZnvHGR3AFul4wc02LDYH3evwxyl2K+VP81HZlGyv2uhFetIzp8NIa
   596FB72HYsaL/6G+vsZvF80TIGPBWEdbEViCx24Iwj5NrlampjLyuBEE4
   PfHSHDnm0H1Tv2EyratLBtuI1/uO29Z77DjdA5aa/7eaWcqJLwXqLKwTX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="308192073"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="308192073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 23:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661194248"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="661194248"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2023 23:20:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 23:20:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 23:20:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 23:20:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 16 Jan 2023 23:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHam6UvgBgcUirPy4dR/kLZI51ivXuUNa50IJVjkLSG1M3f7Mo6997ak/OUt9MnwiECcY3nqVor0x4MhvpQxMC0zBP0JxIuCt0GYKc5YooWDakNoZFPCvfHjoMLqwzEaAtj+lfv+Hf/nPEUmhJ2bazS9CUx2u/muD04usRhypMgPLhHIGbYz+jAl0qQ/EJ+5etxie98bvhT754dJBANUTD8UmSG9gWa1KqQDgPDxgfLoqUAyiWcwXosrGRhLOliINnO5uPY8Qov8ElBL5kgpdNDNaMNVh5UB52yGXVVJbWTICUIAuSQKFOQPB0uIERUkmXkvn7HGe9NjHkIW2qqoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTmK+1a6X2ML9rFgCQtnCOq0gcvURxef4xWMVrVZaMU=;
 b=J623nw0fWPf7F8JMINgkmDW15mFuLgQtsxQp+crvINeW83//J2lVpKMbb1tx31SNIQqTCXC8h1LRofsBEC6OMT83rCjxJLH8MaEdkwfKIESYUd1uC8l3175XldpsgGd+5gBvhBDiucp39X4+eR8eVGSQDssu7zGXJXXgSPN2y0bkZqircr5dGTd+wXKCecA1TPZIGm73Zemz/d/xKOtJsPWAj47ilLeMsp5m0t8+HoKrheVqHig9SZkpgBTktrtJZYvvRBsgfI4BB1Q65MVDy60DtUi4ojJuWPiq+K0HMci2RZEBjaSGRvvEo50PCgDVRLHK08xM0o5sJbI/Vhhz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 07:20:09 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 07:20:08 +0000
Date: Tue, 17 Jan 2023 15:19:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, Mike Rapoport <rppt@linux.ibm.com>, Christoph Lameter
	<cl@linux.com>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [linus:master] [mm, slub] 0af8489b02:
 kernel_BUG_at_include/linux/mm.h
Message-ID: <Y8ZMHi4IGP+v7biC@xsang-OptiPlex-9020>
References: <41276905-b8a5-76ae-8a17-a8ec6558e988@suse.cz>
 <Y7Qxucg5le7WOzr7@xsang-OptiPlex-9020>
 <Y7VBFLHY/PMbb4XS@hyeyoo>
 <Y7Yr3kEkDEd51xns@xsang-OptiPlex-9020>
 <3f7fa3b3-9623-5c4c-94b1-a41dea6eaaf2@suse.cz>
 <Y7weKyxIY+QFYq6j@xsang-OptiPlex-9020>
 <Y71t89JMgtRoNHM/@xsang-OptiPlex-9020>
 <d024b846-9282-4ecd-eafd-2e5571932a72@suse.cz>
 <Y7+7KUyuo/9HeCF2@xsang-OptiPlex-9020>
 <bbf4fc3e-a9c2-83aa-d50a-8f7cb5b2bf4b@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bbf4fc3e-a9c2-83aa-d50a-8f7cb5b2bf4b@suse.cz>
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BY1PR11MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: f559544e-7d75-4f8c-7d3b-08daf85b4380
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oj23ksss0Q3KXH309F3fSkQGRSnM5doOD/kBVFs/vUwAfLK292QsZ8ZYWEOFsxos/GuCF0o0Lo64Y+6zPvZZsxj7GDUNaBRRbEdewylPyY0JcQDvUJYWEImkTfuq91GKu590hyiSCKKkEOPy1lQiCCWFFD0gfdYznyYiRdzkj4TNLLwpJlY4ED2+NXnYa7Xpyl6NTwxKEDKacwWalVHzMen6+GRnknBIrcqRwrDx9mJLwLff5F5htSnp7Z476G0cvYfUTIT4aFdhI+OguygKZPcA+xNWkbCc/Njvwv1MNtHjIORSOscR4kF6wRMPthQP8X9rq5oPoPy+YL6tj9QMTAezbhU0f9dpMvBsGgcj3mLhHBycR2NDXk8xzrAxfC9Gz3SDDIovUFyK8SVdzSEW2+O1T10amKb9+yi/vjfju+HNasVUhSjwFeBFaPtAI7y4+Tl80VbxYPuhyqy1trnAnTqscuwtIRk7lOXLvCgdfvPuUf9ljcvmuim5n292YrhuDnY0swA+e1tA+fu8XKG4ltAu3/PrhkbYAnu5tF9FeXMpAcRFVjnN3pdWlKmOrxwpJox2XBGLCJ6MxVyqPtZRHE7DgSUsCqokGZUFdZm/GIRV7Xi9KCPPFZtgr3dXkrkXSzie9OAcdpJtzAXLaVJG4VO9W9hFBk2k/Q8g7yweMcDPaa7IIxMrXNxgeNfSv+QebrmOM+0h4UcyRLH7arG1nu7jDGCWX856gThgMHx4Dhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199015)(9686003)(478600001)(6486002)(82960400001)(41300700001)(966005)(6512007)(38100700002)(66556008)(186003)(316002)(54906003)(86362001)(33716001)(66476007)(66946007)(26005)(5660300002)(2906002)(6506007)(6666004)(8936002)(4326008)(44832011)(4744005)(6916009)(8676002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XVh4IjefmTmIw/WgtPIrQg5IWPccwD3udmn5X/nVfB3/D4s2n7UAJkc8rM+8?=
 =?us-ascii?Q?Q8zPDxs+euNBODOF2CS1RHYTEk2feP4Y04np7LGKJ/7WN9PteWB3kFHz+hsT?=
 =?us-ascii?Q?4pHTsVb4IJtL/Bl4hTYSHY6zYYcqjdvlg5//SCPLZX5GyYsC4URhC4kWruio?=
 =?us-ascii?Q?isUXxozwF84nTjIGt6vWk4plfVaU41eyY0evwBkk79VMatNAbOLng6qSWpu2?=
 =?us-ascii?Q?ACB7qz+48aw5ijNMJC4lmfHH7D8miy1fLKP02vRC7FiJC3j+N9kKaua0RJ7F?=
 =?us-ascii?Q?gLPXm0TviWzjfE/jU3XaO7Zb0nzRLwE/Prz6DDQ9tqcERoZ0ZusoCtmGkAqx?=
 =?us-ascii?Q?sYI8kuLBdVR8Bv8TkcGmBD+OZKWnzCKIxfDUJkY2EIFCixIfVfSNGQjjM+mX?=
 =?us-ascii?Q?DZuKVKyHHfUra0NHVsBvv1UJYVBUF79Ha4fG7di7buE68JtLbLcDBhzwUWtk?=
 =?us-ascii?Q?wtD5B6CpjzMVDXO9+KIFZgncuCtVaU9F3MztwG0gxIv9ZZEfMv8PS5bw1oXt?=
 =?us-ascii?Q?l2dGstVSZiTQ0sE/2emQqR4lZJa44pPZ9eR5/zLvHCijdutzuF8hUR/CwRto?=
 =?us-ascii?Q?bEZR3Mqxp1ybgXd/7N1zeQzdshRzE81stcRCOsLB6Pmeo78+kPR6ksNzBsJT?=
 =?us-ascii?Q?MX/ewl3c8fB/7XUD9YLmeyF5Mdx6dxAPcimzN6sqciirpvRGb/Qsot2oifUi?=
 =?us-ascii?Q?DxtawEJwLouoHrUfT9jFL07LvfQ2C9XZrD3kn1lRgrujCEADhVzWXjdbYUNL?=
 =?us-ascii?Q?Awy7T74gM3cAmX5fY6LJKR4CcBSPiygQ7TSX4x/BEcD3Als+LzALHJG1GEk6?=
 =?us-ascii?Q?iQDkdw1KmxU9WHRJdowoVtaRD9/ZWXOaV8wZPKzmS/nt4tcVnON4PHvIG3pB?=
 =?us-ascii?Q?XGZr8dS9bMJrLtWKjOwuEzqnWpNs3JisWfuQovAqetYY2ZGMvW/d2bvKbocu?=
 =?us-ascii?Q?+aSIS/jI+y17TYATCJnzI+atRinb8cGlWh/Y903zf5Hu0FrFtfQJWS/KPwXS?=
 =?us-ascii?Q?F1yulxSy6Gc9OlEVgX789Djk0eenIIa4UW43Pqu+LNht3PoZEVtqcHXbkuB1?=
 =?us-ascii?Q?LWhhMXegWwjjCBaOYimMVwLZGdJh3MWH0Bd89nXOrL3oWcnGp7cPHK98W7Bi?=
 =?us-ascii?Q?stbK2/GN0dqSYNhmzGJp7MHq9YglD7ukJcOQLKCxiIL7Le8xAXbs4d1SOW3y?=
 =?us-ascii?Q?m+3tk6zKT5RTt93yG/NTaa8urHwHBh80K15eXskknJH345pV/YrvW61B+Vs0?=
 =?us-ascii?Q?nr1J5XJiwGWzv52RpxGSs6PWKMZaFkI+ZgH7rFBgPRH9KMehaKQkQMpthXaV?=
 =?us-ascii?Q?Dvi+joTPqApiOE8i/UskQfFrdDFwkHAv+shnGgkKyu1Dzx8Y2kq3S19sd/Qx?=
 =?us-ascii?Q?J2ZojFIafVBOCdn5w+qegLpaC+DIFjBrsZI9BX37njJFIitUfbSowf2fphzu?=
 =?us-ascii?Q?E9pmDK+9Vl65ABn8wdoyvao3xEDtwA4Ff75/UPeZO0HVKhuZ8SfChToFXHHe?=
 =?us-ascii?Q?Zi3wUcqSz2vWFR4CNVfIFpuTOr/pM4npGS5NHbIc41PnrI6JCGNtq5hHQ/RR?=
 =?us-ascii?Q?JdKcliyme8OyIjjC65XK8ofl8OBv7bucStwgHdwW4SRmZk6SCYwg3FHSyMpQ?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f559544e-7d75-4f8c-7d3b-08daf85b4380
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 07:20:08.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjt0thWS1Ar85kHDIEduSuciI3h0dwTojQzeYBqf/RQNzj51PyeFYGzzc+utWhw3tcy9NWdiXNPeDVKdD28DbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
X-OriginatorOrg: intel.com

Hi, Vlastimil,

On Thu, Jan 12, 2023 at 08:56:59AM +0100, Vlastimil Babka wrote:
> 
> Actually no, by "obscure" means with CONFIG_SLUB_DEBUG it wouldn't happen
> anymore. But this is the opposite, it seems to happen a lot. I would have
> preferred that slub debugging catches some slab misuse, but this seems
> useful too. With such fail rates you can perhaps try ealier kernels than 6.0
> and eventually find the truly clean and first bad release and bisect?

Thanks a lot for guidance!

yeah, we reached back to until v5.14-rc1 which still has similar issue,
and v5.13 is clean. new bisection was triggered then we got '7118fc2906'

this was already reported as
"[linus:master] [hugetlb]  7118fc2906: kernel_BUG_at_lib/list_debug.c"
at https://lore.kernel.org/all/202301170941.49728982-oliver.sang@intel.com/
and I add you, Hyeonggon, Feng and Fengwei there.

hope that would be helpful.


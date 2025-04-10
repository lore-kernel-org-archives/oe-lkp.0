Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03363596F
	for <oe-lkp@lists.linux.dev>; Thu, 10 Apr 2025 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249778; cv=fail; b=mc05y5Sz7QWYqsGGAfvdA4ACNKd/WXR0kFfnoZI4ltkQdzWJFnrp2/CtKatJBjxKtXT2Pz2hgvuf1ZqLgKrpKeoD6OmAEAxHWQvtjdBL7gIRcbJzTT8OXEOhxdV6DWkNJ3X3Qg1HxHshnlONteO4S0jCPRWKRGVm83qfKQkiqco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249778; c=relaxed/simple;
	bh=1f0BOHjUcf8t90HAnFvwEUlMkyZ/lDETpUUvl746lfc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lXP+TT/E3fMv6T413Grky+Z7I4SPJdTnTlXtS6Djc5BWFGIS9XvxSeiEHNFDfEyKeJq4e+XZfGvQ5UySTirIEJ4mo++ULoXRBZWWSG68LAjUM1R8OBMTZEB5qnZIWbPxbwNvTbkWtP5wwxKExcJlWbgBnCUU7Eccv8hvrYzVum4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjKMI2qe; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjKMI2qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744249776; x=1775785776;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1f0BOHjUcf8t90HAnFvwEUlMkyZ/lDETpUUvl746lfc=;
  b=SjKMI2qehP15VTEbxH/ferekgfSd2gxBRcHCFo/KqxEp3UB4dNTT68FZ
   gHKVq/yljmyPSDBJ3GAEnXDKdixYZpbEbRkYIz286uVbQhT6STpXRJIUP
   bfB6L/A6nVNjfYzz7wpcXn2CeTk/H+dgbqn5DIcQrRqdzhES5edKHvbPc
   pVdbqxGe9TJ48QexPsGnzDatu60aPRUCUyvb3c2+g8XpBrV/9bWHFEtCu
   pjVfdVF4hqJ7PSMmvjZ8ZB0XzknNVKdt7PqTzAsMOCaLrD6E1OVgVnzOf
   emtDYF0m4ZGPPAEaxJbTmafEz7SX7i9qSOolEWrB6Be8y7hIsKurAt3Se
   w==;
X-CSE-ConnectionGUID: 3ReXU/lwRVSMrOvckVQlMQ==
X-CSE-MsgGUID: lrQbTXxnR0OAFGOAIY/UNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45642483"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45642483"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 18:49:35 -0700
X-CSE-ConnectionGUID: GDnWKy1fTjyu9iKRfQQ3aA==
X-CSE-MsgGUID: ZN+Uleu3QnKHnsRuleQXeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128713483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 18:49:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 18:49:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 18:49:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 18:49:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhFRDDN8HrkDGw6U2UO3m3mACcvHGY7oqUxi9ea33VPZLZxoduJtonfocVU4rtCsYaNOQWfc6riSkOPYCZVZ7h1w+va3eoaJ14ZCIQAHwLx4mkLbuucyk/ZXl6oRaJ9hdsyNDltalZM1V/2Tw4uYnSiqbiZltMaLM7YBk7AuJd3flqpim1jRw06ymaTbJQO0BTvy9Aoe+rWK3/94koK0GlFHZQMz6AqTduiAAKEd29SVlS27GQC6N4Hkp8vNq4x3aNPH3iL7HenBPaGmUlAAkz2WBw+s/5DXQ0cSmqvDGOlJmvnUo92OWJEPcwDRD5h3IjhqVmiqbwmQgWx2ajbl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnjEIUrPiSWlE8201M4jQ0cnhri8Xlc8xs1c4Tc1gbA=;
 b=qrvHnfhXPAOMdUdtsM5KVXwrEPtbiZpH3n77IrIMHZdLkodMVMsi8bkWrqV9YHAml0/Y5+4wfg+jrgeyJk93QcP1+1sDuKddRQriggaPcQbb073HAfJkYEtXiGvf2GRzBj/a34zo0+1+pnh4VJAg/HWQw6dJmzxVI/dc7aE2arK/osT2/6fUuzZ8tSYeZx0GksoM0KfStwvz+ETLE+csujy7GQ99rIVikrHzBjQcyxaFJLHPZraUI6jAFdtl5dwBky7XfKh35/XyfXyLs43ECVozyZeklXPsZjXWWRwWzwsfFnKIqSGZ3/adi5LX5PF2HYyNq169M5108MQUem+Iww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 01:49:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 01:49:04 +0000
Date: Thu, 10 Apr 2025 09:48:56 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-lkp@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: RFB: unrolled inline memset and memcpy
Message-ID: <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020>
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
 <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
X-ClientProxiedBy: SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: bce02198-4d59-45a0-7474-08dd77d1dfec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sqL0HYEX5pUKERfDEIc5Kd7bTtyK4fZg8cUAvimUjmO7H3B0q1z7AAtwRlvn?=
 =?us-ascii?Q?EveONLFpUoHXvwDZ8WKNaz3iIUTFx9j6tzIIEPtab/k4NvVP0CGs5B6tzXGM?=
 =?us-ascii?Q?Mu++bHodCYif5aK+mpAsKg2JZFnlnXF2iiPGBlEtkemjjpdW3pcO0J+E4H5s?=
 =?us-ascii?Q?p6woebNgWS1T8l5wdAZphWW2H3fa8if8eRukaG4G+GhB5CwMbyClgs5yOLyt?=
 =?us-ascii?Q?inExK/y0FEQ1ZHeE87WoSakW0sXjfqJ6OerCWpXZgD64lZi2VbvDq2/txhwl?=
 =?us-ascii?Q?6A+SYN5pcj12Fpw+35Z1LMHhUTuAISDuZAHzRPDfYsiclYi3yMLPIwEvmkMF?=
 =?us-ascii?Q?GY47IrREK1Fu7GOwyzQW/yl4I5L5q+Iod4E4zxHtL+7dtJdAG/u+qNjMUvRB?=
 =?us-ascii?Q?qvEUR4ftKwSzLAs+Tyldd48fwD3TZ0y/m8+dsMwg/Se4kJB2ZqJtNRagUfEE?=
 =?us-ascii?Q?g4eIbL1l4I2wWCyXfIVzBaBp5l0AzrF7OK4mFUMOpESxaEsNFqX64Mg3hMZG?=
 =?us-ascii?Q?UTG4t5bM4/4st6z0D3bkq78JfSHBfwxU/Pvm5e++87Y61+0yRH/3CnNTqzwx?=
 =?us-ascii?Q?2JFg6iPb43SjkQGo9+EENUVow4F5rq0VhyHqzB/PuaUJ6NcE79A9BOv3fStd?=
 =?us-ascii?Q?BJ3E8BEPmfZMuO4H8ldvLjXO6BdQUMFrs9UKgQ9GWcu9J3MXNS3/OLRTfdq9?=
 =?us-ascii?Q?ZXuZRtpVkzaau0+t9+niSeOc/JqqVLKv16AapzbrvMyDG5bmUPYh7zmvLxLN?=
 =?us-ascii?Q?/XiDGKAjLID+nY71gcSnFOOVdnjxqmrWSisxUB7MlQSGo579pt9mNxoS4lKJ?=
 =?us-ascii?Q?/Aj4mgX452tq/lKx4qRaSd9vK8uOIM+foHsDQ+pGpAyLM3zIJdHeHEVyTZlj?=
 =?us-ascii?Q?PYpdHrrg0m+jKrKm588nN6vph/bu+bBzk4L2sBo953T31xQu5/t/fvUQeKGM?=
 =?us-ascii?Q?wjo1Ckbx3h4O3qmEYbmM7xtlcoO2iWsYdyYx/E77ljrBm2TFVFg2v3z3EAUc?=
 =?us-ascii?Q?OpiPUG1dZ/H2D/ApS/3b4Csl1no1GoZkfkVF2DX+ar5INFWxDDhh0oqsqWzV?=
 =?us-ascii?Q?EyklWvbJ4vvDbVY19SZ/U8d5sqQBF/lvr9F7LKh3huzJx8Slue0hn/BWxp7/?=
 =?us-ascii?Q?eXiOa1JrgyJlqmJyVn1xkRVELjO2Ez0IqWOqeRQpmLb0T25Wv35UaIla3WVM?=
 =?us-ascii?Q?ItWD8Z4gEnihF7ihK/2kvOSw8MsyZBXvsuCHgStR/ujDjLpiAPUE2T0OPXlu?=
 =?us-ascii?Q?jOcqevS8gbdU2M/wWq/BvN9hIYluR+qo1TFi9eUoElYjoFXjmIw+jY0idcKe?=
 =?us-ascii?Q?okEv3IhMNKa0oSiBruWqZ4U4lAwSySHMc//yl3PFbgCXEjeIh8OI5pepniLN?=
 =?us-ascii?Q?yfK7Sqka9TUnsxgNoMekOS5cWQgmiE7KCuPOWJ3E26NRXxz8Tq1fb19qwjm/?=
 =?us-ascii?Q?Ck/raY0Bbyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W8pU3OSOD24lByteSC773q6pwx+NogvROBW7xo+ZAUHn5IJCaOExcpBSLKWp?=
 =?us-ascii?Q?g+MRhQjTIvrCuIOiiO8eGh6reEKmm2UwWKLk6AkPNtiPsTMxvF/WN4eyMRdF?=
 =?us-ascii?Q?zaR9ineTmPSkEridsuCl4kReMuYOgRKOP14Sk8BeH7nXIricMwu7rN16kTXJ?=
 =?us-ascii?Q?S97zPr7l0GA/MhoY5iOuCJ3lo2J9FVS7zXqfc827MGY40HjOSah7CwAXdOGd?=
 =?us-ascii?Q?9i0aIuzL4okzn/8ccVAOQ62PVjeJYE//Ea+aiRIBd43Q8mRVfEr3u2wlitR4?=
 =?us-ascii?Q?mbMa6wjetSlwTh+Q1wuwKjgD499SP5zssDsJfWycge4EicTvr4gkeko0rf50?=
 =?us-ascii?Q?75AJh7tmgLYmxfjvBdMrGvtqWLZ2FBKft+xGL8RWDgJ1ocOH1n65isfvwyPu?=
 =?us-ascii?Q?n5i19K7TP8J7Pa3Wptcf3h/xGG4KcAyJBnAizxzG0zkoiZQXmJAdD/m55sxO?=
 =?us-ascii?Q?K9zPC7irvixGiaG9f/AOUUsKXaPI+diVwTlGymB3schVnN7/hjaHcIDBYzJD?=
 =?us-ascii?Q?r0M4gDfeEIA4xXIbIsy5NLZkf4eogCtwk11MLcvEA7Hik4Fl2UrRyNJf/ZsY?=
 =?us-ascii?Q?cFaIuEd/DHO5BhLcBnNiai9/wIAL87ACPbtsG6OssX3txewGB4ZgZxT2D4Ne?=
 =?us-ascii?Q?UeVgCuL9S0FnMMsa0RFTwflBdsnmkI8x18uww1ec1NY6qA0RalkCiknXAPE6?=
 =?us-ascii?Q?gcoJSPj6EdQSxFbeZiJATmooDXo94cjyR51Nv8df0WFU/jhmNjTPBQ8MAb5r?=
 =?us-ascii?Q?gduxJ1ZLbm7YKcHD8mfbOhUhHIogFl9tfaP7yPks+Av3wHsQb92OuzOzP0yT?=
 =?us-ascii?Q?rTr0EpRAqxINABVOg2nEJM4UpoKKvT0dEgqhXDK+tc6Pjh4cqSoLXfsqSoU3?=
 =?us-ascii?Q?XPd8skhb1KhkBinDHErHdm30P9mDCTx5K7HxtlWt83WKqGXHvCrsrGri5xIk?=
 =?us-ascii?Q?VY2X40gsWYys8YJHltpo9gurdNQCT7cV+ypNRb9EuOF8P+sitTEbOiV4doeN?=
 =?us-ascii?Q?TdLsyEqeUfvDnwgp9s3cUCrr6L6XSOYHdGYck5kiRHxBsYEb6QDBQxiYk67n?=
 =?us-ascii?Q?pc0c8PncyNrrd8APDG1RwUzCo4ilhq011b055TiIOMqAHAj+O6S8sU+QkVSg?=
 =?us-ascii?Q?kGLBQu+h+ozzm+SlMQh5dOSuvh2xJ9fXXMUFZvcpv0fLbet49sFHqFl62mKR?=
 =?us-ascii?Q?MS5sb5gaHj0X8zX8Sr+psQ/UI3WgzT7Acxka9fyiWP51KojnNeqQrhqU8DOi?=
 =?us-ascii?Q?9T76/4VMLBP4SCAdifQmc5YUQsQwSd1TWopKy6NwlHgHmL0ZTyJwaY0UV1Oh?=
 =?us-ascii?Q?XBnmWMTRKcLLGYz0ewLyjtnGTNIAZBCbnT9BsuSBRJdkopKTfTEe7sajTcm3?=
 =?us-ascii?Q?x6SbJ8PzVKVwmGXdLaPie5C3LecEnPGWJ+DTq2jxeVTdlkBNXrcTt5ghgjAT?=
 =?us-ascii?Q?46mXTC9BntbBItsGIBxB0QTCIYOGFm1+CW+We0bByzIzTCOGmAoD374p5w6l?=
 =?us-ascii?Q?1GRzgIFsLsBCigseFFp/lmwCiLkW6xma/xK/jMTIsDkDiDUZYz8bc7AmdkAd?=
 =?us-ascii?Q?+W/rboMnbqn6jKomELFAoalGNqdbLnKu4iFTvIkNTchUPK25vzvstBpWVQm+?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bce02198-4d59-45a0-7474-08dd77d1dfec
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:49:04.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlOvoKfFtX3m8f+yDv/spot259Fj0/hqgqt4s8As/wWQQqLdwApmrxm3wF40lBZkQr7W4tOX7kPIk9GPfPiH1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Wed, Apr 09, 2025 at 03:17:38PM +0200, Mateusz Guzik wrote:
> 
> > is it possible to push below change to a branch that we can access? if so, the
> > change could be merged into our so-called hourly kernel, which could have bigger
> > coverage. otherwise, we need to use on-demand performance tests, which only
> > cover some tests on part of our machine pool. [1]
> >
> 
> will a branch on github do the trick?

yes, that will be great. one benefit is if you want test new changes in the
future, you just need force push to overwrite old patch, or create new branch,
we can detect the update then try to merge into our hourly kernels. if merge
is ok, the test will be triggered.



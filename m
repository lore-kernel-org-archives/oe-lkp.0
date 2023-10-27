Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313656137
	for <oe-lkp@lists.linux.dev>; Fri, 27 Oct 2023 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNyFTa3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698386367; x=1729922367;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1uI5U0PK5VzSpg6dYyNFo9TY0ZPjBkV9Gs1ZnAHkWrE=;
  b=cNyFTa3ZvekeY8Raq7bHHRpqcrcYF+LF5wWe5pP5jkVroGuVr/XV/nZJ
   Ib6dgOsz81UlaNPWqL18XmShBW2whk68SNq4WEXZbLVg2g3guyP+4gziY
   FnYIyujEFLGHeH2baOApVc2uScdUIXS2Z7aL84qsT3yPPPnpFbqaPE2Rl
   3MJL9F1+FH7y9HtBiSe0XInTd3ucvVvlYHzNEH6HofHXooRFTf6RT33Zf
   60gVc7bJ5jJXTzj5zzlOdt6TK58wB6PbiWuAClTDwND67+tAZ1jJfLg6g
   grKnLyY30BJh/9FG+pKTBJSZOcK9lCEb/V/NYXQX4SUuMVxaRynvYELPt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391589542"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="391589542"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 22:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="763092276"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="763092276"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Oct 2023 22:59:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 22:59:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 22:59:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 22:59:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 22:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfZcTMhpQabqWuwRMmyFqubkCHWLo4HHznmP7W+OfnlR+FgMYk0z0ipxI3x58w/4eb4q1SYfM/bxKHB/y/Q6i5ZGk4xEl5kaiiuv7WTFxQA2h7fHvQAyKQz6n0KuohsVIgU26xEdMnx3rB2vyLXEuaDjaB5BIT18A7A5EhgZuOxcrS3cMjM3LyjZsz0kgMtQUbGq5LIhNQzsldPshRwpK1QmyAz99MJ06SANFIh8tiRfXCKII8rn+cFFgowbK2vkr4/Pxue0dVVju5QT29lCIXBkRJbRrNXA9H0FtQzimEblz8wYY/fi/o1BN5MzDB+OXtlmBKhi/rKhRuFNXu1QqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9Pi57iB41OaGQzetkf5Q0dcNn5/6zKqkhXLUIeC7ws=;
 b=Lgx+RRUBb1DFZBHAq6+CQ5mTSYxUwl6c2B44xjEPYfo56vNjfr53zdjK7hfzxwtGnSFORYjPpWMa2SkBjkMlFZtPG1jPQoKrtexfVgYNyDwFYCjdNwx5OTxr+++uMrRSK2izln/IgLAw3ONsIKAK63LtJoPShKmimHXeP7cygY+0KdCcbsGV4BVYHokSdoB7CYIpbYr8RnhCIgGV2h7Gt17WOW7h3VFvc4lCGGaERaumjyzV1mJgje3HssMqZR+rXG/+Nrxpw7jACOPAvEkIAbOBcILHgOzNJoLygY92QYmc4FUKS/qInAz7xGr8gwj5rSEMhY40M2qXJ5rqnCp30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BL1PR11MB5527.namprd11.prod.outlook.com (2603:10b6:208:317::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Fri, 27 Oct
 2023 05:59:18 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 05:59:11 +0000
Date: Fri, 27 Oct 2023 13:59:04 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>
CC: <oliver.sang@intel.com>
Subject: Re: [PATCH 2/3] maple_tree: use preallocations in mas_store_gfp()
Message-ID: <ZTtRqO+lddA+7nRv@xsang-OptiPlex-9020>
References: <20231009201639.920512-3-sidhartha.kumar@oracle.com>
 <202310251706.6e6f6c4a-oliver.sang@intel.com>
 <20231026171635.3xmpba2cuzjhkcxg@revolver>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231026171635.3xmpba2cuzjhkcxg@revolver>
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BL1PR11MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac4bea8-586a-4fbe-3d1e-08dbd6b1d768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcP4Uhtw+SvKTIns0aNh3IMihQwGAtYp5naq/QVvCpQRRiTiuzxgoE7P+wRYIYxxNRPjx7GCpMvCNtGDigKE4hdEwb3pA/xqvTXuqCT7gCWr/JhTtntHvaFYhh61Ee0MUyhXR8/5EpdhCsHF9b23OrWwVNYVE4IT7Q/uYN2l3kzqy4IJO0OxkrJdT9bfIyUnvm5IVBWwSw0UxqOu/TI3+9BRw/ySzawuTVi686Z1xgTfK8j1AVXtTkmyejFl7NbjhfyIeri/rUhKl+lZ+pcq5cpzBpj3KgHsm1bJ6MDobTzEwRV8kc8HA3yF97PNaMwa3Tv90UVgPQvjzfQkpCo0vDFs8D9pKrPH7T0sFzKpcWZRB9ylYKPAobIbjbSxfPWx83uw3+smkbPLIGTgwFJdcfgy/TE4tOkfl5Q+m/wbRBnDJMBUa5xLWAPMTLktqZwCg3PCsCn4q0FXJ7VkFPwBG+XmKpZejM07e8mh21avneQnb4Tay80oF7Z2wKPgc+HIzAP22EL6GClcUhDcKUhzAOhT/K5CiDGdwRCgTAVWLYDNC1FH3Hqgf4WR3kjn2NJc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(9686003)(6512007)(6666004)(478600001)(83380400001)(6486002)(6506007)(86362001)(38100700002)(82960400001)(33716001)(5660300002)(316002)(6636002)(66946007)(66556008)(66476007)(26005)(4744005)(2906002)(107886003)(41300700001)(44832011)(8676002)(8936002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W2RGMnaS7+kRm2WQv2twoNPkDC4DsjM5BGqG5MbVzmEBfoY6TnxHb8VWz5rB?=
 =?us-ascii?Q?C05EjEr7JGq6rNAAR1FQG/h+Y/WriCMNHEA2rxEuwc2jrFxnqfwpmPPORu3w?=
 =?us-ascii?Q?2Zt57vabeLgV7JpZ1mLiKl8AkaehsQDkUj+TBJIcgKIDoSG1H45qNDKWNT6d?=
 =?us-ascii?Q?c/go/Q8f+yYP1tn44NaoLPx6XFuSgfmlkGfYBt59Gy/TbuMzXMPOD/8v1l/n?=
 =?us-ascii?Q?wJAdeuPNKRsO+LF3PEdXrq507z4wPNlFrkPzZv+ufCDpCuzmyVIryVa9RM4O?=
 =?us-ascii?Q?YZGvNg0/EV34PDwvOLvOvTtNAFTRP3BQ1rT+DScYySRdhV2aWE+ksQdVHgna?=
 =?us-ascii?Q?8kkJS7d2Lm6SC3FeGr3eX1EOzS14WLK6fzymHtNncSzC/Bz9sL9FbPzzYaLS?=
 =?us-ascii?Q?h3E6JCzBJ3QfqCEP/7Qcnsd/vUCn+Tna8JRXyxQp8KBamGYwAd/sLLgGbCr/?=
 =?us-ascii?Q?e9TpGt5V6rBN00YrjjeC1COmw5oc0nITVbNakPEtvCmp7Lk3oxCcugL4wINQ?=
 =?us-ascii?Q?5PfLmTyMgLXyEuFj8e7bqLixDtVq61D67KNyjm5y/dp4j+xnMIH4fHcT+ai4?=
 =?us-ascii?Q?P5zp3+/FIgJJYGjYksTHDZTh2k379JoUlxshYEnlzXbl6sKVCmmSbrNENpRx?=
 =?us-ascii?Q?5W9PFHEK/dCbPYTHNNS+0Ak5mvefwFXKVFBq4yEOaCWbU+QCLT3VXMH/XopA?=
 =?us-ascii?Q?iFqfm870KChEeprd7GtIgezjFVFSADx4vIh5Og9mQfKnKoCWGWePvivz6Zac?=
 =?us-ascii?Q?LnkbXcUsUY1qOIzGT2jvP853tHNokMMhGUqRUPIjAFIid5C98ACJZEDuEZkW?=
 =?us-ascii?Q?e5CQ0sHcJrt22/GnfXZW+9z9r3U+uZjMb6CmMgLqkZmIpr2WALpl4sDnzTW5?=
 =?us-ascii?Q?i1ohcbxwUwZ2l3zrecvXFPPhWsqIY0uuPBMaskxk81JYpaXAvMbiDbCrpCMr?=
 =?us-ascii?Q?fUEIFwWiT/3XpPs/c4/EDmsC/CA+oX8EpikipcY1RDK8Jy93z0g/Vf21nCCH?=
 =?us-ascii?Q?Zyx6fChDKUlFd9IYw1IrOhHQMUGTCoFuGmi/jF8jehmx8jLPZcDlg5b1iyGa?=
 =?us-ascii?Q?poF+LzySEb5eoauBMdjB+yAp3f0UdERPAm4rcYY36oS851KM7G9S6kX3fbjy?=
 =?us-ascii?Q?EqmkXB9Ux4pE+wvTPXyVkIbK/dy1+/LDAzjaJAqiKVB5yKdTQ/BNfFtFKvZ2?=
 =?us-ascii?Q?B79sOM8stx0HeMSLQXQAyv3ufuhAADZLTtC/SB7eUQHIsR60DhUDtq+zk/eW?=
 =?us-ascii?Q?GQh/FkXTRrTvOL4OlQ6ujmCzmAbMNVy4DEZECcCR/bAW1p5KQQHCv5qUhi9q?=
 =?us-ascii?Q?oG1JfRsgAG4lkg4moXoxiHUDJemTDKs3P95RLaWBlR7EMMipNqIOAl9UWWu1?=
 =?us-ascii?Q?gU9E/mTMvVyhaoN0bSVsDfzS8Fzchbpvj8Hw6oMsYRhbsCpJOtueYN1qHjUa?=
 =?us-ascii?Q?IF5UBuD3nDnJzuzfe2MZ9L6ArCiOqANhMnGIgK+1r0Nb4RTcrJYhqojcBWgg?=
 =?us-ascii?Q?YShjCLrXIm9MM/qsdgqkdaNGSNOyWlhkO/PmJMUiL8jjFQSm7Iad6KuyG3Ne?=
 =?us-ascii?Q?Sw2YLcYTVVzkVC02cWNiEM+kPuIuaWL1wkaZSAiSHHkwO54RWaWVYqxI2vD7?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac4bea8-586a-4fbe-3d1e-08dbd6b1d768
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 05:59:11.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSTdQcxFp2AFwEQemqY4TE3aEoUpr93JAHOWedfWIUIvXDdT3gU2S3GoMLu7a3p4t7GSNlZhp1LEMylO9GZSGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5527
X-OriginatorOrg: intel.com

hi, Liam,

On Thu, Oct 26, 2023 at 01:16:35PM -0400, Liam R. Howlett wrote:
> 
> ... Dropping direct Cc's in attempt to avoid even more noise.
> 
> * kernel test robot <oliver.sang@intel.com> [231025 05:52]:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
> ...
> 
> This patch set is being revised and discussed on how to make it a more
> complete solution.

got it. we'll stop reporting for this v1 series if any further findings.

BTW, 'kernel test robot' intends to supply extra data while a patch set is
under review and discussion, unless it's already explicitly dropped or NACKed.

> 
> In the mean time, is there any way to stop the bot from emailing
> everyone and burning more power?

want to consult if it's ok to send to the mailing list but not cc any
individual mail in case we find regression for future version?

> 
> Thank you,
> Liam

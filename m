Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D838BA25
	for <oe-lkp@lists.linux.dev>; Thu, 27 Oct 2022 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666854716; x=1698390716;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q0UPWzJhz3Ue7OdFBDfLnhI7okozKNaH5CoD0NtSf24=;
  b=FSLnNnTQf65vjAmBwtwNEJU7pahxZdkNUMgyNkhtHzHbt1QN2YrSh+r+
   0006TxcN/+mBOAKImtfP4uDcgKlBdedD49DB148UYNrYm+eyvhDQTZrmF
   MKpPhqIr/PpjpH7L05MZ17sVxBvL2fWWuJTrHZvjtmaIGq627E0527Mou
   TAyynZeLnJ41CM2oR2Y/1oWHHJHNNBej7b2vgbaw+i4NR2KgCqswsPuLi
   LBHss5i6WKee10OWlr+Mj+jJXpwS1eHSeayUUc7M01H6kjwevuWoQfuR6
   U1bQu7OUDfbjwwL0HuPWoT4ttQLQwrl44Sqgb0xPzqNLs5hI8FhrWztKz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334777537"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="334777537"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 00:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="632302244"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="632302244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2022 00:11:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 00:11:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 00:11:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 00:11:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 00:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao6Umd34jw2+B0IFgfMjDB3q7TstkmESLCy49c1aKQFIRZf9JRkZnLlXrKKL8ipMmTN350tpX2Cyt7yTuG/NtWljyCT8en5aUwk+N79yws2gOEjKjA8VNsPSEZGnVR0zQCXOEmMb3Fd1iA3cCxXx5IDd2OuIgHmBSxpaHDIyIJNf3Tgr8I5PAHAMrPx7TmGgObF86Sg5ING4SbjMpsoyFPIafOtfjyY3Tq+/uTID4mIs3kYj5GQJ72G+xxaoBX0f7ZGNRB4BCkxDudvQr0qbtkBWKSngCeKmCST3KSeq6BsaSP7prynx4E88UBBZUxNpHU9DwJibkjH3NaZ3adLDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imYYUn3/bwIfrzSPbDmQX+FbSoQvBSBQhg6D7w3H798=;
 b=oQlsH4SoEhzXYGB5OTCbdTOG+RLcNNv4zjHWcLOum5up39znIBwhzq17/EQ8zDbWUCLv+MTrD9TRqzjGn0OI/YMD3HDnfQ/iG+Mi7TVI4bhvPb09w3aEBxAPwvmpou815dLnsw62Hz305f/Yk4H5p2KDQNmNB0cqSMi20C8EBamYIwK1FVMCcfpU2EPrdUhLS98F3y/G898UQK9JtM7wU4CGUDHwaroTTlDBXb2c0j07lePLHG87ioYpKFW0vWyqKcFuG4E1fo1Oz3FEH9N0VM+Ds910vOD+6pc1I6SiI458QWteA6SfVycFxL1FTi9PJdc7dg8kb0MinUPfaFi4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 07:11:38 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::a397:a46c:3d1b:c35d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::a397:a46c:3d1b:c35d%9]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 07:11:38 +0000
Date: Thu, 27 Oct 2022 15:09:53 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>
Subject: Re: [amir73il:fanotify_pre_content] [fanotify] 2731bef965:
 fxmark.ssd_xfs_MRPL_72_bufferedio.works/sec -12.0% regression
Message-ID: <Y1ouwRLR2y2Dcu4Y@yujie-X299>
References: <202210240921.4f794c80-yujie.liu@intel.com>
 <CAOQ4uxj3pxAfJHap5y=4V28v1iJbcBeeTDuWEyvTi0kVnsQ94g@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxj3pxAfJHap5y=4V28v1iJbcBeeTDuWEyvTi0kVnsQ94g@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 574520d8-3095-46da-aeb4-08dab7ea7dbe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBfk9FVHhg9r2UJwdYCWfIV3KVXvgQ9zeS/i84EjbJzVQlRoWooVIL08Incepl5TNW71Jymctxhbu/NJx4rN4lq4PwC5faWk6JgUEuPdAukjqtin/IJ1ckIiPl2LYvES0EqNzAWs6N1R50eO5PdjdbSaQ45L08MBUTbBdpD42rDCNQUnjnH8Qwd9lc8O9p0/36vzrd/sxjsiuz2QaX9zTn3en+sjzm68rbx/2MwR9YB85ejdm0YScUiV0m3fMsXkHc0TD96B8W8UjFlvynOUAkUcZa4KrU4PzrSeud2GqPHCG72yFLoAkzQMrc7dBLo9xK5LjNKGeI4wCo0EWhRu9pwX3MnHjAAW5zaBJtEZ2qnZItorGrlrJBNvSBFLLM9U4bjgi0eRS4bCW4UF1R+tSJ2+/jBvjtG8S6KC7v5ztTuSyHFogm3BhtE8/CgLOb6C+wsU/AeTXrBgna6O8b0enIjrz9d5HQCRYEBAOMwAG41pA1N7lSTn8BuLPkW0EvgDVSSx+ffGT8w6sp06Gpx0onXiv8FmqWlPTTIWHA9cooVUboVTTaEfYSaRb34Y9/2guJPw1IEu2xme/9A7Q1dGSciLhpz+Si/epHG4nj9qrNUTAZgcvDbVbFRLzl5dtu/5vi6rDJRjCnka+OIJmjXRQrY/YhCqBj8x0MH77gyfUzuAR4pJPjSPYrHc7c7CnmeJpL88wUh7P8iT5ZAVYdghV2zGK1V7mUl/c/n3MN1TXlKic/cRGNLrZ1iIG95BPl6TG8iR3p5IMyZvSm4k42IsCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(86362001)(38100700002)(82960400001)(83380400001)(53546011)(6512007)(186003)(6506007)(9686003)(26005)(2906002)(33716001)(44832011)(6486002)(966005)(8936002)(478600001)(6666004)(6916009)(8676002)(66556008)(316002)(66476007)(4326008)(66946007)(5660300002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qMEcCTakhZyIeb4vwDmVi9dTPUi0hF7yI4jeOjGAkRVwgl7PsqCCHZP462?=
 =?iso-8859-1?Q?uOokYVQid1TqmWxBYqeSL2LlNGgjgIcLx3OSX6SldgqanvKBEPIoYnnIK/?=
 =?iso-8859-1?Q?92ZNAw5RegMIc5Vv1R5HsAK1Fjx7fEdjhbUkUF7FumVuqHjpG57X9zIA37?=
 =?iso-8859-1?Q?iBy91eKxCS9FKjJKdOtBTJYHuBTmSNdWSKrpK3ehiL+1Fn/I8LlG/RmLgh?=
 =?iso-8859-1?Q?JRmNf6u8U21+5BEOET2MB6LOhyZV6nAynZq+Y7oXBZzTY4H2GLtYiXeI28?=
 =?iso-8859-1?Q?nDbpTlu+4sBjmhDxD6oAE+mlOb0oNdu2jzmrDO4ACNmnnPiudT76sL2EXW?=
 =?iso-8859-1?Q?Q08FpGhGJki7y7F3wsD9XKSEIhvEEjTUarhem4dDnXVOX97wYo+RCKFkob?=
 =?iso-8859-1?Q?BNclJsiJkOJGamGlPl40NalU4GkHSaLq5vLrh5nlcFE7wAbCz563NDEzlv?=
 =?iso-8859-1?Q?lvSJA2EjrTF3789l9nvvSPIHrK575czBoCiW4Q01hrAm2nJ5u+DrvRiGPV?=
 =?iso-8859-1?Q?TIOiYq0+320zXq9sL1j6u0ffr62h3edTHprciJZJt74ZnRdgDUVgNl73wq?=
 =?iso-8859-1?Q?Nr7WfKV1iUrqTtpzw52422wgHR83aFWlcJTME1I9gZMtjHHln4VylB56v9?=
 =?iso-8859-1?Q?h/iByQv8kRAg+JtLnZIdFFJN6Xqj2KHEmo08GY35YnmWp119Y3zYnK1dqH?=
 =?iso-8859-1?Q?VNAvpQb/TMQbmoIf9NtXQlFYlu7wTcB5gUDojYDyCUhWkL4qLuPBkYyPOC?=
 =?iso-8859-1?Q?Qgh5VZNn4YQ8HwlLawW823GFLj58D2q65hzjDCRn64W096I/KYYGnR6XVn?=
 =?iso-8859-1?Q?AjdlP9tYxX8VtlUqIVtiN6fRkQ57y/tOnfg1wM63MPHSpyjeT6eIVjNaqH?=
 =?iso-8859-1?Q?m9ZU5rnSwFnLSlvf39dVYSH6HPdCuaqXM3Ga54J0wQD3gWUK6CmpiOjCic?=
 =?iso-8859-1?Q?MDM7uRqFrKA07Adc0/BQjlxkMR6rvUrgyT+P3ACtN6Qgx7+rEHtc0BnORp?=
 =?iso-8859-1?Q?uEPNExSLtM7DC+HmFI/YwI48/w6yoQwqvf94RpTh3mG6uqIRqnNfERCic0?=
 =?iso-8859-1?Q?q7cGZJ63wePSvW/PwEVFuU48IJu/u3I9AUpD/FdevkxSJR0xlj/BfXZNgv?=
 =?iso-8859-1?Q?hvdIUj6pWGcY9Y5CJLe/l7+N4zZn8lS4TAw/GmNU6aq3wVK028jS1L9yiy?=
 =?iso-8859-1?Q?AB73NO3dZgmEsFVs2h62UFPWh5M3i6FIHsRPHtEiqrjkndJZIpeJ0mMqso?=
 =?iso-8859-1?Q?lbQViZa54vM6XiRolDkS6WjVJcr8BjcW9LDu77scCwUsHCK+05tjbJg3Lo?=
 =?iso-8859-1?Q?+bAsdq3xQ8pkbvdUE7n+DZVYDWYSaRtXwfx+dWXgC3b0h5C1u5ifiTGBvn?=
 =?iso-8859-1?Q?63C+yqUC8psZbbze6aLP2H6yHI+BxN9pGd1ST1jC90DWSRrDRRKL0vZ+dy?=
 =?iso-8859-1?Q?QSAPJg8PiPNax/3M0k35VcrkrDLMNyNiXC+6HgXy6rxI3OX61h7MGcmHdE?=
 =?iso-8859-1?Q?tlJ7MiFKC0eKiTTAdfBVzeDG5UM2gZPT8FFueVAvKPTDLFKVG+XKZgqxqr?=
 =?iso-8859-1?Q?YvnLkQaIqEPUe7G5NlX4hbyfY3gPmSX5cB4JLNx2eUo9Co00hixxp9YVLb?=
 =?iso-8859-1?Q?X2/l8Fh6S33YqKrgMIUsf2dZTnDMHVWo/5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 574520d8-3095-46da-aeb4-08dab7ea7dbe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:11:38.8256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9nnTHtBhaXClSDZzPhH029/nx/MzLSUzE0x9uBt3Ci206bxIt8oRMyzLgqKxz6bOH+3oO/r5sZ8mn4eck4Nkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
X-OriginatorOrg: intel.com

On Wed, Oct 26, 2022 at 06:06:45PM +0300, Amir Goldstein wrote:
> On Mon, Oct 24, 2022 at 4:34 AM kernel test robot <yujie.liu@intel.com> wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -12.0% regression of fxmark.ssd_xfs_MRPL_72_bufferedio.works/sec due to commit:
> >
> > commit: 2731bef9653952cab508c5eb701592ea78dc6e75 ("fanotify: introduce FAN_LOOKUP_PERM event")
> > https://github.com/amir73il/linux fanotify_pre_content
> >
> > in testcase: fxmark
> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
> > with following parameters:
> >
> >         disk: 1SSD
> >         media: ssd
> >         test: MRPL
> >         fstype: xfs
> >         directio: bufferedio
> >         cpufreq_governor: performance
> >
> > test-description: FxMark is a filesystem benchmark that test multicore scalability.
> > test-url: https://github.com/sslab-gatech/fxmark
> >
> >
> > If you fix the issue, kindly add following tag
> > | Reported-by: kernel test robot <yujie.liu@intel.com>
> >
> >
> > Details are as below:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase:
> >   gcc-11/performance/bufferedio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MRPL/fxmark
> >
> > commit:
> >   da8d464cb0 ("fanotify: allow O_PATH flag in event_f_flags")
> >   2731bef965 ("fanotify: introduce FAN_LOOKUP_PERM event")
> 
> Hello!
> 
> Thanks for the report.
> 
> Could you please run this test on branch
> https://github.com/amir73il/fan_lookup_perm
> 
>   2731bef96539 ("fanotify: introduce FAN_LOOKUP_PERM event")
>   87f9aa515fd0 ("fsnotify: optimize fsnotify_lookup_perm() hook")
> 
> To see if it fixes the reported regression?

Hi Amir,

Thanks for the fix, we tested above commits and found that the
regression has been resolved.

  Tested-by: Yujie Liu <yujie.liu@intel.com>

=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase:
  gcc-11/performance/bufferedio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MRPL/fxmark

commit:
  da8d464cb0251 ("fanotify: allow O_PATH flag in event_f_flags")
  2731bef965395 ("fanotify: introduce FAN_LOOKUP_PERM event")
  87f9aa515fd01 ("fsnotify: optimize fsnotify_lookup_perm() hook")

da8d464cb02517d3 2731bef9653952cab508c5eb701 87f9aa515fd01eabda2b1ac2707
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     44.04           -11.7%      38.90            -1.0%      43.62        fxmark.ssd_xfs_MRPL_18_bufferedio.user_sec
      4.89           -11.7%       4.32            -1.0%       4.84        fxmark.ssd_xfs_MRPL_18_bufferedio.user_util
 1.624e+09           -12.0%   1.43e+09            -0.7%  1.613e+09        fxmark.ssd_xfs_MRPL_18_bufferedio.works
  32484848           -12.0%   28590324            -0.7%   32266981        fxmark.ssd_xfs_MRPL_18_bufferedio.works/sec
      2.51 ±  4%     -12.1%       2.20 ±  3%      +0.7%       2.52 ±  2%  fxmark.ssd_xfs_MRPL_1_bufferedio.user_sec
      5.01 ±  4%     -12.1%       4.41 ±  3%      +0.7%       5.05 ±  2%  fxmark.ssd_xfs_MRPL_1_bufferedio.user_util
  91798396           -12.1%   80692995            -0.4%   91437550        fxmark.ssd_xfs_MRPL_1_bufferedio.works
   1835968           -12.1%    1613860            -0.4%    1828751        fxmark.ssd_xfs_MRPL_1_bufferedio.works/sec
 1.847e+08           -11.9%  1.627e+08            -0.6%  1.837e+08        fxmark.ssd_xfs_MRPL_2_bufferedio.works
   3694940           -11.9%    3254103            -0.6%    3673299        fxmark.ssd_xfs_MRPL_2_bufferedio.works/sec
     88.28           -11.7%      77.95            -1.0%      87.38        fxmark.ssd_xfs_MRPL_36_bufferedio.user_sec
      4.90           -11.7%       4.33            -1.0%       4.85        fxmark.ssd_xfs_MRPL_36_bufferedio.user_util
 3.055e+09           -11.9%  2.692e+09            -0.9%  3.027e+09        fxmark.ssd_xfs_MRPL_36_bufferedio.works
  61109619           -11.9%   53847415            -0.9%   60548779        fxmark.ssd_xfs_MRPL_36_bufferedio.works/sec
     10.02 ±  2%     -12.2%       8.79            -0.9%       9.93 ±  2%  fxmark.ssd_xfs_MRPL_4_bufferedio.user_sec
      5.01 ±  2%     -12.2%       4.39            -0.9%       4.96 ±  2%  fxmark.ssd_xfs_MRPL_4_bufferedio.user_util
 3.699e+08           -11.8%  3.263e+08            -0.3%  3.689e+08        fxmark.ssd_xfs_MRPL_4_bufferedio.works
   7397404           -11.8%    6525259            -0.3%    7378874        fxmark.ssd_xfs_MRPL_4_bufferedio.works/sec
    132.91 ±  2%     -12.3%     116.60            -0.8%     131.91        fxmark.ssd_xfs_MRPL_54_bufferedio.user_sec
      4.92 ±  2%     -12.3%       4.32            -0.8%       4.88        fxmark.ssd_xfs_MRPL_54_bufferedio.user_util
 4.664e+09           -12.0%  4.105e+09            -0.7%  4.629e+09        fxmark.ssd_xfs_MRPL_54_bufferedio.works
  93279586           -12.0%   82101317            -0.7%   92583640        fxmark.ssd_xfs_MRPL_54_bufferedio.works/sec
    167.55           -12.7%     146.34            -0.7%     166.45        fxmark.ssd_xfs_MRPL_72_bufferedio.user_sec
      4.65           -12.7%       4.06            -0.7%       4.62        fxmark.ssd_xfs_MRPL_72_bufferedio.user_util
   5.6e+09           -12.0%  4.926e+09            -1.1%  5.539e+09        fxmark.ssd_xfs_MRPL_72_bufferedio.works
  1.12e+08           -12.0%   98517557            -1.1%  1.108e+08        fxmark.ssd_xfs_MRPL_72_bufferedio.works/sec


--
Best Regards,
Yujie

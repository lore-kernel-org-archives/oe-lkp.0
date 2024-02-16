Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C1C8F3
	for <oe-lkp@lists.linux.dev>; Fri, 16 Feb 2024 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708051124; cv=fail; b=CkI+mFoH5EBuj2QODCubyc/IWKk2c7xE6uG8cbhPpjJVnNrLuavyynpfPl2j3BXZrkut6YiFKeFs889wMlFCtY7FsgNOPZGtJUrBNwxutTAkNlqoej3M3h4V5O7qaYQUSONiSu3MbvM5l04fuR9nRzpO+6M0QF0BkN7ywDTWdpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708051124; c=relaxed/simple;
	bh=eSLaEvvzMpCxYrThvbwvrj+DqBE/4gvMfSNPJGzy8c8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGs2LxtbCREQtYhm2W2JVkm5ZN8sUn/YrxkqB5t0EFQUbFICto8Yin4FjXi8StSCxa2O4gi+ORkxB1w7VgYovi1gapekesbDEf4NibIz6t0sbTwAKG/ZMM5TF62nhHNXNdIrX+dWYARvy6taHqhCQd1bS9kumkCkr3kdicdm8VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gn364NES; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gn364NES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708051118; x=1739587118;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eSLaEvvzMpCxYrThvbwvrj+DqBE/4gvMfSNPJGzy8c8=;
  b=gn364NESWluLY9L17n/4NbJZN3TyhMGYTNMjsNQxHk9Yh3Y6XdutlE7i
   FVQvAApy0wM16pmj1xDYj74hObK1mAg72YfVl8FN0b28/eccPOq++Ub3j
   yBeYTYIE+o9A1o8jQ4zKZN4mMOqvq9e+jhK1bs6LYADW8yuicJW4me4Da
   dVfiACAJP2RC3xy2xElbAxIplK5CH44gh2DwO/aESqY2AxVS2JMyrRKYo
   pDYXBc1z5uOjaFfyDzSod4wEvHz4arUFFn+/3gJpV0H3h/yKCB7I93RFD
   UbF3YGxAA1yrM+wxMr5qzTDHW3MCLmmlaHPSiFL9e9RctPBTCKQ32etLn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="24637716"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="24637716"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 18:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935771095"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="935771095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Feb 2024 18:38:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 18:38:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 18:38:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 18:38:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpbjWWMyO50kE970AvHJy8T/utAeYIGJ8LO9rN4sn87hQyFLazGdN2WmmKpJfxOXHfMfFz6610aZimSC0anGTt06pcZUdogneMKLe3R+a7L17JmdRFVEyXgYUCNMiDJGYRTihriiQbR1jhdC6NKJDTdeEJgRLjFoVipZpbtHa+2wNu0cXXzCsQg2gz/tYledbBcXosNUG3D8t64PTSIBNmcYvlqFi3i1/7ULrCKGYLdSv8a3n7LfHldaPBZbi434bzn185Aj1hPZxrr3dMdG204B/OtEX0DXm5JsgT9CnhaaXZIqQ+CguI9aZvyHuM7sHJQ4cuDpwqhQ+/BZziqPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrVop3eNvx+hNE4rbqF+XpHQfte3WFFC8gv5Rp841h8=;
 b=LzQQT/GienOMz4gKD1GgGKjFOF4JdyXWwUPuIcG15RXMcGogJw0ZF2o30ngg6y4mn+pVbYSIap2fWf/PBbryiEylmydg9hdZ3KaidFr+8PeZc4Y6RgEepY/grxqeLHzOa81n0klu4yZ4/F1xoPeisQ8rIZYi4Z7QSJj/WtqodWu9yZtLEJaF5+uRj2dWoRNnnQemslWzh1EMSB3ZGs7k6bDW5Jdsghh7Vt7j3YbnWeE6kzlCTzv/omx5XyxU6B7gjLCYvwvf+SLEv7Kn3vMGHrHkx4hqAXXvpNMioFL/E+1DlVunstVaxLxVh7Z1Aiw63hcVxBHRbIcgl6EIRXdyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 02:38:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 02:38:26 +0000
Date: Fri, 16 Feb 2024 10:38:18 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fsnotify] 9c13a708ef:
 will-it-scale.per_thread_ops -4.2% regression
Message-ID: <Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020>
References: <202402071553.75bfbe67-oliver.sang@intel.com>
 <CAOQ4uxghgvmSzN_twab00xyUh=+0UJ79_pn-tjW1Ob_s1-zroQ@mail.gmail.com>
 <ZcR+scdiyu7OZexO@xsang-OptiPlex-9020>
 <CAOQ4uxiF=cr5w987WbOBqotWZfdFesHt+CpnoBD=DnxncLLJ8w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiF=cr5w987WbOBqotWZfdFesHt+CpnoBD=DnxncLLJ8w@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: cd404a37-607b-4af7-a102-08dc2e985986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Znj3x6bJM97AT8LeZMzIVovJ2ryXC6KFgfhwpm4DfmBZU59FM9K1t8X48plEUjJuZM8cJJvL/FUvs/NjJht1X5W2qBcbPnrwxLrGnRHIojG/HYNbgJiRX4OeKocvlA4WlD7WqG2TYoK9dMMZvROq1ZCrRduVD13Q9PIWiavvwrwUffc8xY8Jkxs2UeUBBiY693/dHqrstyFbOsvEZra/YLY8tHqFQdjeGoqWkt0X2cBfpxKUvOY03VL6qapZEBuDIWu6LpRCSdwe8O+AoTkM7vrscujSCQMN17FKLE1tD7IxSe0R1XWMNKYwxbjF4CXr/vgwDSKR855h8GEGlhMZpdu6rRrosWkqrq0gnRBu1WXZfBQy9Kc6sXjYgCFlGzf59pLin1gh4/b9WfTq0Ly58SZhotH+toazNT7XuRCFsXCUZ5GXKiUcJuIp/gr7fC8duCtEr56MB1t3B9NNLK9Bzy52xWZN1rl79KidtDj9CIYbVyy+tNc3dalcE/GUgqL3W8/+eLnRWrVw0YhEKv1BFlS4cmip0YvYHEM6oo9gCdsWj3Qkql9Hw6mpl8NzMwwx7n0Zbl1BsjGQhm++Xv/HQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(86362001)(33716001)(4326008)(6916009)(8936002)(8676002)(82960400001)(66476007)(66556008)(66946007)(5660300002)(44832011)(2906002)(30864003)(83380400001)(38100700002)(41300700001)(6666004)(53546011)(19627235002)(316002)(26005)(107886003)(478600001)(966005)(6506007)(6512007)(6486002)(9686003)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzN1R3dyMVRuUUw2eXhna2ljMkIwTTlNdFQzNHBGR1hpN3BGcGFGbmhjblFz?=
 =?utf-8?B?Tmd3OVpQVitKVkFnSTk0YnJQUVJSMVh2QmxBcUtzQ3h6RjBPelNBalIycUk0?=
 =?utf-8?B?NEV2MGhqWmFGUlJoV0NMZVg4emlUSnhubWtKd2cwOHdSR3RwN2tJSjI4ekRx?=
 =?utf-8?B?eDVjMXhlNkt6VFVRR3pOR3hKRUJDYmJZUm9lMnhhS1R6NzZqc2VBNWRNaEZj?=
 =?utf-8?B?aGxOa202Sjgyc1BRai9OR0JHMWFKNVQxYjNxSjVzbEQzbHdOaHdodlN6RjNW?=
 =?utf-8?B?MmxYVDdpc3ZUVWRkcjFidUxFVEY1Rk1SVUFRTDNHUkpJTGoreWJndStsbVU2?=
 =?utf-8?B?bXkwdm9Fb3RWdHozWnE3WUx2OC9tNTFrbUVMZHNldWxNcWpQZmlRMlBhcVpY?=
 =?utf-8?B?UnA4OEFDcWpybjhhUjQrV1lGWWNQVlhxNk5OdGhaRkpST1A5MGFTeHdTWjZa?=
 =?utf-8?B?V1FobzVzaFlNSytxUkk5clA5ZXMwdEdUSzNHN1h4Z0ZHUEF5enFUQnd1bDlv?=
 =?utf-8?B?UWVFRW05UktGRmNmZFRvOUxGcXpZc2VENFRiQ2tqaGc0QWo4N2pQWkhxMFRE?=
 =?utf-8?B?V1Z3RC85QUpkN3hpOWQzRzlMbFNiVFBkR1p2NktLZll1WldVNFViN2QzNjRD?=
 =?utf-8?B?ODBZVDd2OCtnZGJSeVNubFkwaW0vY0NxSW54WHcxeWhwR0VmV1dTWlE2TFhK?=
 =?utf-8?B?d3cveC9nSU9hYTZBaWJrVEZkMWlxbHFxNVBONFZ0dEpRMlBXczZGblBLRUN4?=
 =?utf-8?B?Ti9obGJjTXJSVVl5ZWhjcHp4TGRRYmpJbUphWHFIUWRYLzV1ekN0aEN5UG5I?=
 =?utf-8?B?VGI2clA2Z2sxcU5SczRiQjZzQmF0T0N6R0ZCNXpBc1VuYlhaZ1RIWmluT0g0?=
 =?utf-8?B?TVNiUWdiNWlCeTdlaFFtQjZ3M1RHM05UNU11anZGVk5mT0prb044UTg1SnBL?=
 =?utf-8?B?T3VJMkZhemN1MVFQT3ZDdlJvdVZjWXNTZWx5M0dHMnZKV1ppREl6V01uSzRx?=
 =?utf-8?B?bVBGZ0RhWE5QT0pMcWlqTEl0M3FVamtINUthWkwvSVI5TFdQNzZqcjM0YkV3?=
 =?utf-8?B?WVAxMnpML3QrSmNKQzE0TXVpRmc1ZFRHdVhEcUFPR0tlVHRnamRxS24xTWpD?=
 =?utf-8?B?djlYSEFBUktDOW11VmxLYzg0N1hYWjdJZWRRM1I0NGR1OUFCV25Ha3d6cWFW?=
 =?utf-8?B?cHFLRGdmcENMSTBZQ1VuQWlBTWp2V2M2eHdDWXdTWnFoNHVucXhFUFdFRmQx?=
 =?utf-8?B?RW1RaWJKRXhaSkxBUEVTK3lDT0tVallPNHlTTEhFOWk2cnBqVHZwR3JqVFVy?=
 =?utf-8?B?eHA2ellTSi9mazZ5QmVnQ0hFM1c3MWtma2k0dlhBQ1FPN1QxdjhadExoUTQz?=
 =?utf-8?B?RFRnYTRQWkNpOUl3TDdLVFl4VXZHZEFOdGZNU2VJeGFvT1NIeFNrZVJDWjN6?=
 =?utf-8?B?azRUajVrOFBUd015S1VWOGVmenFibmxvYUpWN05CVmNEVTNPM1p3cXkyMzNK?=
 =?utf-8?B?UE5zZVJNVWRKU3NqNlVzdjdpWkkrUGp1cWR4WU4wM3hMK1Z6V2dOWkhxdCs1?=
 =?utf-8?B?VFZzcmhPd0pOMW9yaW91Mk1xeHA2MUYzcWw1NEJaRk5RSGJIazdwVXZsK0Ru?=
 =?utf-8?B?UDhNak9OV0JoNHFvb1JiTzFkdllnSEdZY3M0TWd5MUNoemY0UCs3LzQ2SXF2?=
 =?utf-8?B?OFMzSEdYbXQxcldsOWJrVWFsaHdNL0J3T3dPVi9lbnNJN24vU0xwSHBQRWZQ?=
 =?utf-8?B?d3AxSnpBZ24waDhobXd0ZnF3T0pSZERxODUxSDRSNG8zMDJhbHY3YlBhbmtE?=
 =?utf-8?B?bWZkR1BOZzdZWW9DQ3dLZGtYNUJVWDhSKzVNYUF2MHhrRDFmSER1TWNUaFVw?=
 =?utf-8?B?L3I0U05peWkwc05neDFQOERHTHdRRjdVQnpRdzhzQ0hIYmFUbkxkRjNDM0M2?=
 =?utf-8?B?enc1Q0ZqVHlEeTR5U1RHMFd5VXJPZUJRSjQwOFFVczdSbVgzQnRQQWtxMjNh?=
 =?utf-8?B?ekI4K0ZNWm9vQkxLaDhTNWRuZnJEN21rNXlQL1BjWDhPWTlyakJ4WllXNmdO?=
 =?utf-8?B?bFhSSUFpZHRPczFYTjQzZUM4dEVQQU1GaDdtRmhZdk10MGgzTmVKc1dJcUJr?=
 =?utf-8?B?THIxV0NacU5jNHM2UjlJWDFFQlZmUGZxN0dreHpnMmMrNGd4U002RmQrM1pv?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd404a37-607b-4af7-a102-08dc2e985986
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 02:38:26.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD/JjFMJulYPYcVROhD0MfmjtztHgZI2OX/gA3xaKiznoX2VMpV8UOU9W46K29WWtb5SOOKOPBIpxDh2CGOOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com

hi, Amir,

On Tue, Feb 13, 2024 at 09:13:41PM +0200, Amir Goldstein wrote:
> On Thu, Feb 8, 2024 at 9:12 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Wed, Feb 07, 2024 at 11:17:36PM +0200, Amir Goldstein wrote:
> > > On Wed, Feb 7, 2024 at 9:37 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a -4.2% regression of will-it-scale.per_thread_ops on:
> > > >
> > > >
> > > > commit: 9c13a708efa02450fb5a50fc02a6eaf060fa00a1 ("fsnotify: introduce pre-content permission event")
> > > > https://github.com/amir73il/linux sb_write_barrier
> > > >
> > > > testcase: will-it-scale
> > > > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
> > > > parameters:
> > > >
> > > >         test: writeseek1
> > > >         cpufreq_governor: performance
> > > >
> > > >
> > > >
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202402071553.75bfbe67-oliver.sang@intel.com
> > > >
> > > >
> > > > Details are as below:
> > > > -------------------------------------------------------------------------------------------------->
> > > >
> > > >
> > > > The kernel config and materials to reproduce are available at:
> > > > https://download.01.org/0day-ci/archive/20240207/202402071553.75bfbe67-oliver.sang@intel.com
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
> > > >   gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale
> > > >
> > > > commit:
> > > >   v6.8-rc2
> > > >   9c13a708ef ("fsnotify: introduce pre-content permission event")
> > > >
> > >
> > > Hi Oliver,
> > >
> > > There is an optimization patch in Jan's fsnotify branch:
> > >
> > > * 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
> > >
> > > I rebased my development branch over Jan's fsnotify branch.
> > > Can you please re-test the regressing patch.
> >
> > this doesn't fix the regression is our tests, still
> 
> Hi Oliver,
> 
> Thank you for the feedback.
> It took me some time to come up with a possible solution.
> Pushed it to branch
>  https://github.com/amir73il/linux fsnotify-perf
> 
> * 7ca5d81f2ffa - (github/fsnotify-perf) fsnotify: introduce
> pre-content permission event
> * f11cc054af02 - fsnotify: optimize the case of no permission event watchers
> * 522fcae19571 - fsnotify: use an enum for group priority constants
> * 728ae8e9aa68 - fsnotify: move s_fsnotify_connectors into sb connector
> * d04bf34990ab - fsnotify: attach sb connector for the lifetime of sb
> * dcc32fca414b - fsnotify: count watched object reference only for
> connector with marks
> * 38afb3e6393d - fsnotify: create helper fsnotify_object_sb() to get
> sb from connp
> * 2da381128528 - fsnotify: rename fsnotify_{get,put}_sb_connectors()
> * e1a893090c4b - (github/fsnotify, fsnotify) Merge remote-tracking
> branch 'jack/fsnotify' into fsnotify
> * b7dbaace3971 - (jack/fsnotify) fsnotify: Add fsnotify_sb_has_watchers() helper
> * 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
> 
> All the work up to:
> 
> f11cc054af02 fsnotify: optimize the case of no permission event watchers
> 
> should hopefully not make a difference for performance.
> I think that f11cc054af02 is going to improve this will-it-scale benchmark
> (write loop) and possibly other benchmarks (read loop) as well.
> 
> When final commit
> 
> 7ca5d81f2ffa fsnotify: introduce pre-content permission event
> 
> is applied on top of this optimization commit, I expect that it will not
> regress the will-it-scale benchmark.
> 
> Let me know if this does the job.

yes, in our tests, the regression gone now.
as you expected, we saw a better performance on f11cc054af02 comparing to
v6.8-rc2 but for will-it-scale.per_process_ops (which is not very stable in our
original report)


=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale

commit:
  v6.8-rc2
  f11cc054af ("fsnotify: optimize the case of no permission event watchers")
  7ca5d81f2f ("fsnotify: introduce pre-content permission event")

        v6.8-rc2 f11cc054af028a3cb0d3f5072f6 7ca5d81f2ffa3303ed4c1d54af3
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   2407257            +1.6%    2446078            +0.8%    2427577        will-it-scale.per_process_ops
   2078006            -0.1%    2076545            -0.7%    2063601        will-it-scale.per_thread_ops


below are full data FYI.

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale

commit:
  v6.8-rc2
  f11cc054af ("fsnotify: optimize the case of no permission event watchers")
  7ca5d81f2f ("fsnotify: introduce pre-content permission event")

        v6.8-rc2 f11cc054af028a3cb0d3f5072f6 7ca5d81f2ffa3303ed4c1d54af3
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    398.57            +0.8%     401.69            +0.0%     398.72        dmesg.timestamp:last
    173.39            +0.6%     174.51            +0.1%     173.60        kmsg.timestamp:last
 3.509e+10            +0.0%  3.511e+10            +0.1%  3.514e+10        cpuidle..time
  35725484            +0.0%   35731790            +0.1%   35758123        cpuidle..usage
    372.80            +0.3%     373.82            +0.1%     373.07        uptime.boot
     47364            +0.5%      47615            +0.2%      47445        uptime.idle
     57.93 ±  3%      +1.6%      58.89 ±  2%      +0.4%      58.14 ±  2%  boot-time.boot
     29.87            -0.7%      29.66            -0.7%      29.66        boot-time.dhcp
     11910 ±  3%      +2.0%      12144 ±  2%      +0.6%      11976 ±  2%  boot-time.idle
     50.00            +0.0       50.02            +0.0       50.04        mpstat.cpu.all.idle%
      0.84            +0.0        0.84            +0.0        0.85        mpstat.cpu.all.irq%
      0.02 ±  3%      -0.0        0.02 ±  2%      -0.0        0.02 ±  5%  mpstat.cpu.all.soft%
     42.49            -0.1       42.40            -0.2       42.34        mpstat.cpu.all.sys%
      6.65            +0.1        6.71            +0.1        6.76        mpstat.cpu.all.usr%
      8.17 ± 43%     -21.9%       6.38 ± 25%      +4.1%       8.50 ± 35%  perf-c2c.DRAM.local
     49.83 ± 24%      +0.3%      50.00 ± 17%     +22.4%      61.00 ± 25%  perf-c2c.DRAM.remote
    168.50 ± 16%      -3.5%     162.62 ±  8%      -6.1%     158.25 ± 13%  perf-c2c.HITM.local
     26.83 ± 38%      +6.7%      28.62 ± 27%     +32.3%      35.50 ± 24%  perf-c2c.HITM.remote
    195.33 ± 18%      -2.1%     191.25 ±  8%      -0.8%     193.75 ± 12%  perf-c2c.HITM.total
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    448484 ± 23%      -0.3%     446976 ± 19%      -5.3%     424715 ± 21%  numa-numastat.node0.local_node
    610456 ± 11%      -3.6%     588218 ± 10%      -7.3%     565946 ± 11%  numa-numastat.node0.numa_hit
    161962 ± 30%     -12.8%     141235 ± 51%     -12.8%     141229 ± 43%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
    749898 ± 14%      -0.7%     744465 ± 11%      +2.8%     770550 ± 11%  numa-numastat.node1.local_node
    819910 ±  9%      +1.8%     835075 ±  7%      +5.0%     861167 ±  7%  numa-numastat.node1.numa_hit
     70012 ± 70%     +29.4%      90610 ± 80%     +29.4%      90618 ± 67%  numa-numastat.node1.other_node
    312.09            -0.0%     312.08            +0.0%     312.09        time.elapsed_time
    312.09            -0.0%     312.08            +0.0%     312.09        time.elapsed_time.max
     57467            -0.0%      57457            +0.2%      57597        time.involuntary_context_switches
    261.33 ± 11%      +3.2%     269.75 ±  7%      +0.7%     263.12 ± 10%  time.major_page_faults
    347526            -0.1%     347226            +0.0%     347622        time.maximum_resident_set_size
    261028            -0.2%     260510            -0.2%     260554        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        time.page_size
      8835            -0.0%       8835            -0.0%       8834        time.percent_of_cpu_this_job_got
     23694            -0.2%      23652            -0.3%      23615        time.system_time
      3881            +1.1%       3922            +2.0%       3959        time.user_time
     14641            -0.6%      14552            -0.6%      14555        time.voluntary_context_switches
     50.43            +0.0%      50.45            +0.1%      50.47        vmstat.cpu.id
     43.07            -0.2%      42.99            -0.4%      42.88        vmstat.cpu.sy
      6.52            +0.1%       6.53            +1.8%       6.63        vmstat.cpu.us
      0.00            -0.0%       0.00            -0.1%       0.00        vmstat.io.bi
      4.00            +0.0%       4.00            +0.0%       4.00        vmstat.memory.buff
   3090983            +0.0%    3091678            +0.1%    3093331        vmstat.memory.cache
 5.221e+08            -0.0%  5.221e+08            -0.0%  5.221e+08        vmstat.memory.free
      0.00          +4e+98%       0.00 ±264%    -100.0%       0.00        vmstat.procs.b
    110.66            -0.0%     110.61            -0.1%     110.58        vmstat.procs.r
      2293            +0.0%       2293            -0.2%       2287        vmstat.system.cs
    232637            -0.1%     232498            -0.0%     232629        vmstat.system.in
      1423            -0.0%       1423            -0.0%       1423        turbostat.Avg_MHz
     50.06            -0.0       50.04            -0.0       50.02        turbostat.Busy%
      2844            -0.0%       2843            +0.0%       2844        turbostat.Bzy_MHz
     34541 ±  2%      -1.1%      34157            +0.3%      34631        turbostat.C1
  16127247            +0.0%   16130325            +0.1%   16142225        turbostat.C1E
     22.54            -0.0       22.54            +0.0       22.55        turbostat.C1E%
  19486723            +0.1%   19500367            +0.1%   19515259        turbostat.C6
     27.48            +0.0       27.50            +0.0       27.50        turbostat.C6%
     49.92            +0.0%      49.92            +0.1%      49.94        turbostat.CPU%c1
      0.03 ± 38%     +25.0%       0.04 ± 11%     +16.7%       0.04 ± 14%  turbostat.CPU%c6
     58.50            -0.4%      58.25            -0.2%      58.38        turbostat.CoreTmp
      0.80            +0.5%       0.80            +1.1%       0.81        turbostat.IPC
  73495193            -0.0%   73476738            +0.1%   73556913        turbostat.IRQ
     80.02 ±  5%      -5.4       74.60 ±  2%      +0.7       80.74        turbostat.PKG_%
     32564 ±  2%      +4.2%      33930            +0.8%      32814 ±  3%  turbostat.POLL
     59.33            +0.7%      59.75            +0.7%      59.75        turbostat.PkgTmp
    600.72            +0.0%     600.74            -0.1%     600.22        turbostat.PkgWatt
     22.09            -0.1%      22.07            +0.1%      22.10        turbostat.RAMWatt
      2000            +0.0%       2000            +0.0%       2000        turbostat.TSC_MHz
    129410            +0.3%     129781            +1.7%     131563        meminfo.Active
    129330            +0.3%     129703            +1.7%     131483        meminfo.Active(anon)
     79.98            -2.5%      78.00 ±  6%      +0.0%      80.00        meminfo.Active(file)
    293917 ±  6%      -2.9%     285371 ±  5%      -5.0%     279305 ±  4%  meminfo.AnonHugePages
    472066            +0.1%     472647            -0.1%     471496        meminfo.AnonPages
      4.00            +0.0%       4.00            +0.0%       4.00        meminfo.Buffers
   2940872            +0.0%    2941354            +0.1%    2943041        meminfo.Cached
 2.637e+08            +0.0%  2.637e+08            +0.0%  2.637e+08        meminfo.CommitLimit
   3323978            +0.1%    3327827            +0.1%    3325891        meminfo.Committed_AS
 5.253e+08            -0.1%  5.248e+08            -0.0%  5.251e+08        meminfo.DirectMap1G
  10446165 ±  8%      +5.0%   10972160 ±  8%      +2.5%   10706944 ±  9%  meminfo.DirectMap2M
    187266 ±  2%      -0.9%     185560 ±  7%      +0.7%     188632 ±  3%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    483314            +0.1%     483980            -0.1%     482735        meminfo.Inactive
    483094            +0.1%     483768            -0.1%     482523        meminfo.Inactive(anon)
    219.90 ±  3%      -3.6%     211.90            -3.6%     211.90        meminfo.Inactive(file)
    149798            +0.1%     150004            +0.1%     149969        meminfo.KReclaimable
     39387            -0.1%      39331            -0.3%      39258        meminfo.KernelStack
     36923            +0.2%      36986            -0.2%      36836        meminfo.Mapped
   5.2e+08            -0.0%    5.2e+08            -0.0%    5.2e+08        meminfo.MemAvailable
 5.221e+08            -0.0%  5.221e+08            -0.0%  5.221e+08        meminfo.MemFree
 5.274e+08            +0.0%  5.274e+08            +0.0%  5.274e+08        meminfo.MemTotal
   5326374            +0.1%    5332351            +0.2%    5336340        meminfo.Memused
     12468            +0.0%      12473            -0.1%      12457        meminfo.PageTables
    116602            -0.1%     116457            -0.0%     116555        meminfo.Percpu
    149798            +0.1%     150004            +0.1%     149969        meminfo.SReclaimable
    433981            -0.4%     432206            -0.2%     433096        meminfo.SUnreclaim
    144182            +0.3%     144669            +1.5%     146354        meminfo.Shmem
    583779            -0.3%     582211            -0.1%     583065        meminfo.Slab
   2805393            +0.0%    2805398            +0.0%    2805399        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    290748            -0.0%     290627            -0.1%     290565        meminfo.VmallocUsed
   6807520            -0.1%    6801974            +0.5%    6844685        meminfo.max_used_kB
   2743205            +2.0%    2796874            +1.5%    2783301        will-it-scale.1.linear
   2743205            +2.0%    2796874            +1.5%    2783301        will-it-scale.1.processes
     98.65            -0.0%      98.65            -0.0%      98.64        will-it-scale.1.processes_idle
   2370614            -0.3%    2362550            -0.8%    2352306        will-it-scale.1.threads
     98.66            +0.0%      98.66            -0.0%      98.66        will-it-scale.1.threads_idle
 3.072e+08            +2.0%  3.132e+08            +1.5%  3.117e+08        will-it-scale.112.linear
 3.067e+08            +1.8%  3.122e+08            +1.4%   3.11e+08        will-it-scale.112.processes
     49.86            -0.0%      49.85            -0.0%      49.85        will-it-scale.112.processes_idle
 2.649e+08            -0.1%  2.647e+08            -0.1%  2.647e+08        will-it-scale.112.threads
     49.95            -0.0%      49.94            -0.0%      49.94        will-it-scale.112.threads_idle
 4.609e+08            +2.0%  4.699e+08            +1.5%  4.676e+08        will-it-scale.168.linear
 3.433e+08            +1.5%  3.483e+08            +0.3%  3.442e+08        will-it-scale.168.processes
     25.38            +0.0%      25.38            -0.0%      25.38        will-it-scale.168.processes_idle
 2.974e+08            +0.0%  2.975e+08            -1.2%  2.938e+08        will-it-scale.168.threads
     25.50            +0.0%      25.50            +0.0%      25.51        will-it-scale.168.threads_idle
 6.145e+08            +2.0%  6.265e+08            +1.5%  6.235e+08        will-it-scale.224.linear
 3.959e+08            +0.8%  3.989e+08            -0.9%  3.925e+08        will-it-scale.224.processes
      1.16            +0.3%       1.17            +0.5%       1.17        will-it-scale.224.processes_idle
   3.4e+08            +0.1%  3.404e+08            -1.8%  3.339e+08        will-it-scale.224.threads
      1.31            +2.6%       1.35 ±  4%      +0.7%       1.32 ±  3%  will-it-scale.224.threads_idle
 1.536e+08            +2.0%  1.566e+08            +1.5%  1.559e+08        will-it-scale.56.linear
 1.537e+08            +1.7%  1.564e+08            +1.2%  1.555e+08        will-it-scale.56.processes
     74.51            -0.0%      74.50            -0.0%      74.50        will-it-scale.56.processes_idle
 1.325e+08            -0.0%  1.325e+08            -0.2%  1.323e+08        will-it-scale.56.threads
     74.50            -0.0%      74.50            -0.0%      74.49        will-it-scale.56.threads_idle
   2407257            +1.6%    2446078            +0.8%    2427577        will-it-scale.per_process_ops
   2078006            -0.1%    2076545            -0.7%    2063601        will-it-scale.per_thread_ops
      0.64            -1.2%       0.64            -2.3%       0.63        will-it-scale.scalability
    312.09            -0.0%     312.08            +0.0%     312.09        will-it-scale.time.elapsed_time
    312.09            -0.0%     312.08            +0.0%     312.09        will-it-scale.time.elapsed_time.max
     57467            -0.0%      57457            +0.2%      57597        will-it-scale.time.involuntary_context_switches
    261.33 ± 11%      +3.2%     269.75 ±  7%      +0.7%     263.12 ± 10%  will-it-scale.time.major_page_faults
    347526            -0.1%     347226            +0.0%     347622        will-it-scale.time.maximum_resident_set_size
    261028            -0.2%     260510            -0.2%     260554        will-it-scale.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        will-it-scale.time.page_size
      8835            -0.0%       8835            -0.0%       8834        will-it-scale.time.percent_of_cpu_this_job_got
     23694            -0.2%      23652            -0.3%      23615        will-it-scale.time.system_time
      3881            +1.1%       3922            +2.0%       3959        will-it-scale.time.user_time
     14641            -0.6%      14552            -0.6%      14555        will-it-scale.time.voluntary_context_switches
 2.239e+09            +0.7%  2.256e+09            -0.3%  2.233e+09        will-it-scale.workload
      2279 ± 19%     +20.5%       2746 ± 35%      +7.2%       2442 ± 14%  numa-meminfo.node0.Active
      2252 ± 19%     +19.7%       2696 ± 36%      +5.8%       2382 ± 13%  numa-meminfo.node0.Active(anon)
     26.67 ±141%     +87.5%      50.00 ± 77%    +125.0%      60.00 ± 57%  numa-meminfo.node0.Active(file)
    141269 ± 34%     -10.4%     126558 ± 41%      +2.1%     144282 ± 29%  numa-meminfo.node0.AnonHugePages
    232859 ± 30%      -9.6%     210433 ± 35%      +2.9%     239723 ± 23%  numa-meminfo.node0.AnonPages
    398592 ± 19%      -4.5%     380621 ± 18%      +3.3%     411754 ± 14%  numa-meminfo.node0.AnonPages.max
   2733493 ±  3%     -10.9%    2436355 ± 34%     -23.7%    2086407 ± 57%  numa-meminfo.node0.FilePages
    237069 ± 29%      -9.0%     215747 ± 34%      +3.3%     244885 ± 22%  numa-meminfo.node0.Inactive
    236993 ± 30%      -9.0%     215614 ± 34%      +3.3%     244728 ± 22%  numa-meminfo.node0.Inactive(anon)
     75.97 ±134%     +74.3%     132.44 ± 77%    +106.6%     156.94 ± 57%  numa-meminfo.node0.Inactive(file)
     98406 ± 10%      -8.5%      90004 ± 19%     -10.5%      88119 ± 20%  numa-meminfo.node0.KReclaimable
     19942 ±  4%      +1.4%      20229 ±  2%      -0.8%      19786 ±  4%  numa-meminfo.node0.KernelStack
     34508           -10.2%      30999 ± 32%     -21.9%      26941 ± 51%  numa-meminfo.node0.Mapped
 2.595e+08            +0.1%  2.598e+08            +0.3%  2.602e+08        numa-meminfo.node0.MemFree
 2.635e+08            +0.0%  2.635e+08            +0.0%  2.635e+08        numa-meminfo.node0.MemTotal
   3991541 ±  2%      -7.7%    3684163 ± 24%     -16.6%    3327971 ± 35%  numa-meminfo.node0.MemUsed
      6561 ±  6%      -4.4%       6270 ±  6%      -4.1%       6295 ±  4%  numa-meminfo.node0.PageTables
     98406 ± 10%      -8.5%      90004 ± 19%     -10.5%      88119 ± 20%  numa-meminfo.node0.SReclaimable
    222628 ± 22%      +7.7%     239766 ± 19%      -8.5%     203688 ± 14%  numa-meminfo.node0.SUnreclaim
     12409 ±  9%      +6.0%      13149 ± 11%      +2.3%      12691 ±  8%  numa-meminfo.node0.Shmem
    321034 ± 17%      +2.7%     329770 ± 16%      -9.1%     291807 ± 13%  numa-meminfo.node0.Slab
   2729981 ±  3%     -10.9%    2432023 ± 34%     -23.7%    2082498 ± 57%  numa-meminfo.node0.Unevictable
    127135            -0.1%     127020 ±  2%      +1.5%     129082        numa-meminfo.node1.Active
    127082            -0.1%     126992 ±  2%      +1.6%     129062        numa-meminfo.node1.Active(anon)
     53.32 ± 70%     -47.5%      28.00 ±130%     -62.5%      20.00 ±173%  numa-meminfo.node1.Active(file)
    153562 ± 40%      +4.0%     159738 ± 35%     -11.5%     135949 ± 37%  numa-meminfo.node1.AnonHugePages
    240437 ± 29%      +9.6%     263463 ± 28%      -3.1%     233042 ± 24%  numa-meminfo.node1.AnonPages
    436400 ± 18%      +4.2%     454729 ± 15%      -3.2%     422363 ± 13%  numa-meminfo.node1.AnonPages.max
    207403 ± 39%    +143.5%     505015 ±168%    +313.0%     856620 ±139%  numa-meminfo.node1.FilePages
    247575 ± 29%      +8.9%     269633 ± 28%      -3.4%     239229 ± 23%  numa-meminfo.node1.Inactive
    247431 ± 29%      +8.9%     269553 ± 28%      -3.3%     239174 ± 23%  numa-meminfo.node1.Inactive(anon)
    143.92 ± 70%     -44.8%      79.46 ±129%     -61.8%      54.96 ±165%  numa-meminfo.node1.Inactive(file)
     51391 ± 19%     +16.7%      59999 ± 29%     +20.3%      61849 ± 29%  numa-meminfo.node1.KReclaimable
     19437 ±  4%      -1.7%      19097 ±  2%      +0.2%      19468 ±  4%  numa-meminfo.node1.KernelStack
      2458 ± 21%    +146.7%       6064 ±165%    +305.2%       9963 ±140%  numa-meminfo.node1.Mapped
 2.626e+08            -0.1%  2.623e+08            -0.3%  2.619e+08        numa-meminfo.node1.MemFree
 2.639e+08            +0.0%  2.639e+08            +0.0%  2.639e+08        numa-meminfo.node1.MemTotal
   1336133 ±  5%     +23.5%    1649585 ± 54%     +50.4%    2010116 ± 58%  numa-meminfo.node1.MemUsed
      5918 ±  7%      +5.0%       6214 ±  6%      +4.1%       6160 ±  3%  numa-meminfo.node1.PageTables
     51391 ± 19%     +16.7%      59999 ± 29%     +20.3%      61849 ± 29%  numa-meminfo.node1.SReclaimable
    211354 ± 22%      -8.9%     192444 ± 24%      +8.5%     229409 ± 12%  numa-meminfo.node1.SUnreclaim
    131794            -0.2%     131533 ±  2%      +1.4%     133645        numa-meminfo.node1.Shmem
    262746 ± 20%      -3.9%     252443 ± 21%     +10.9%     291259 ± 13%  numa-meminfo.node1.Slab
     75411 ±109%    +395.1%     373375 ±227%    +858.6%     722900 ±165%  numa-meminfo.node1.Unevictable
    562.93 ± 19%     +19.7%     673.72 ± 36%      +5.8%     595.36 ± 13%  numa-vmstat.node0.nr_active_anon
      6.67 ±141%     +87.5%      12.50 ± 77%    +125.0%      15.00 ± 57%  numa-vmstat.node0.nr_active_file
     58274 ± 30%      -9.6%      52693 ± 35%      +2.9%      59991 ± 23%  numa-vmstat.node0.nr_anon_pages
     69.04 ± 34%     -10.4%      61.88 ± 41%      +2.1%      70.52 ± 29%  numa-vmstat.node0.nr_anon_transparent_hugepages
    683373 ±  3%     -10.9%     609088 ± 34%     -23.7%     521601 ± 57%  numa-vmstat.node0.nr_file_pages
  64880484            +0.1%   64957295            +0.3%   65046354        numa-vmstat.node0.nr_free_pages
     59313 ± 29%      -9.0%      53991 ± 34%      +3.3%      61255 ± 22%  numa-vmstat.node0.nr_inactive_anon
     18.99 ±134%     +74.3%      33.11 ± 77%    +106.6%      39.23 ± 57%  numa-vmstat.node0.nr_inactive_file
     19946 ±  4%      +1.4%      20232 ±  2%      -0.8%      19789 ±  4%  numa-vmstat.node0.nr_kernel_stack
      8631           -10.1%       7756 ± 32%     -21.9%       6739 ± 51%  numa-vmstat.node0.nr_mapped
      1643 ±  5%      -4.5%       1568 ±  6%      -4.0%       1578 ±  4%  numa-vmstat.node0.nr_page_table_pages
      3102 ±  9%      +6.0%       3287 ± 11%      +2.3%       3172 ±  8%  numa-vmstat.node0.nr_shmem
     24601 ± 10%      -8.5%      22501 ± 19%     -10.5%      22029 ± 20%  numa-vmstat.node0.nr_slab_reclaimable
     55656 ± 22%      +7.7%      59941 ± 19%      -8.5%      50921 ± 14%  numa-vmstat.node0.nr_slab_unreclaimable
    682495 ±  3%     -10.9%     608005 ± 34%     -23.7%     520624 ± 57%  numa-vmstat.node0.nr_unevictable
    562.93 ± 19%     +19.7%     673.72 ± 36%      +5.8%     595.36 ± 13%  numa-vmstat.node0.nr_zone_active_anon
      6.67 ±141%     +87.5%      12.50 ± 77%    +125.0%      15.00 ± 57%  numa-vmstat.node0.nr_zone_active_file
     59313 ± 29%      -9.0%      53991 ± 34%      +3.3%      61255 ± 22%  numa-vmstat.node0.nr_zone_inactive_anon
     18.99 ±134%     +74.3%      33.11 ± 77%    +106.6%      39.23 ± 57%  numa-vmstat.node0.nr_zone_inactive_file
    682495 ±  3%     -10.9%     608005 ± 34%     -23.7%     520624 ± 57%  numa-vmstat.node0.nr_zone_unevictable
    605634 ± 11%      -3.2%     586466 ± 11%      -7.4%     560777 ± 12%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    443662 ± 22%      +0.4%     445223 ± 19%      -5.4%     419545 ± 21%  numa-vmstat.node0.numa_local
    161961 ± 30%     -12.8%     141236 ± 51%     -12.8%     141230 ± 43%  numa-vmstat.node0.numa_other
     31749            -0.1%      31715 ±  2%      +1.5%      32237        numa-vmstat.node1.nr_active_anon
     13.33 ± 70%     -47.5%       7.00 ±130%     -62.5%       5.00 ±173%  numa-vmstat.node1.nr_active_file
     60154 ± 29%      +9.6%      65935 ± 28%      -3.1%      58314 ± 24%  numa-vmstat.node1.nr_anon_pages
     75.01 ± 40%      +4.0%      78.04 ± 35%     -11.4%      66.42 ± 37%  numa-vmstat.node1.nr_anon_transparent_hugepages
     51833 ± 39%    +143.5%     126225 ±168%    +313.1%     214131 ±139%  numa-vmstat.node1.nr_file_pages
      0.00       +1.2e+101%       0.12 ±264%    -100.0%       0.00        numa-vmstat.node1.nr_foll_pin_acquired
      0.00       +1.2e+101%       0.12 ±264%    -100.0%       0.00        numa-vmstat.node1.nr_foll_pin_released
  65641531            -0.1%   65563108            -0.3%   65473029        numa-vmstat.node1.nr_free_pages
     61911 ± 29%      +9.0%      67464 ± 28%      -3.3%      59861 ± 23%  numa-vmstat.node1.nr_inactive_anon
     35.98 ± 70%     -44.8%      19.87 ±129%     -61.8%      13.74 ±165%  numa-vmstat.node1.nr_inactive_file
      0.27 ±223%    -100.0%       0.00           -99.7%       0.00 ±264%  numa-vmstat.node1.nr_isolated_anon
     19446 ±  4%      -1.8%      19102 ±  2%      +0.1%      19470 ±  4%  numa-vmstat.node1.nr_kernel_stack
    620.98 ± 20%    +145.0%       1521 ±164%    +301.9%       2495 ±140%  numa-vmstat.node1.nr_mapped
      1482 ±  7%      +5.0%       1556 ±  6%      +4.2%       1544 ±  3%  numa-vmstat.node1.nr_page_table_pages
     32931            -0.2%      32854 ±  2%      +1.4%      33387        numa-vmstat.node1.nr_shmem
     12847 ± 19%     +16.7%      14999 ± 29%     +20.3%      15461 ± 29%  numa-vmstat.node1.nr_slab_reclaimable
     52837 ± 22%      -8.9%      48109 ± 24%      +8.5%      57351 ± 12%  numa-vmstat.node1.nr_slab_unreclaimable
     18852 ±109%    +395.1%      93343 ±227%    +858.6%     180725 ±165%  numa-vmstat.node1.nr_unevictable
     31749            -0.1%      31715 ±  2%      +1.5%      32237        numa-vmstat.node1.nr_zone_active_anon
     13.33 ± 70%     -47.5%       7.00 ±130%     -62.5%       5.00 ±173%  numa-vmstat.node1.nr_zone_active_file
     61911 ± 29%      +9.0%      67464 ± 28%      -3.3%      59861 ± 23%  numa-vmstat.node1.nr_zone_inactive_anon
     35.98 ± 70%     -44.8%      19.87 ±129%     -61.8%      13.74 ±165%  numa-vmstat.node1.nr_zone_inactive_file
     18852 ±109%    +395.1%      93343 ±227%    +858.6%     180725 ±165%  numa-vmstat.node1.nr_zone_unevictable
    817001 ±  8%      +2.2%     835136 ±  7%      +5.4%     860881 ±  7%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
    746988 ± 13%      -0.3%     744525 ± 11%      +3.1%     770264 ± 11%  numa-vmstat.node1.numa_local
     70012 ± 70%     +29.4%      90610 ± 80%     +29.4%      90617 ± 67%  numa-vmstat.node1.numa_other
     64.00 ±  7%      -3.9%      61.50 ±  9%      -2.9%      62.12 ±  4%  proc-vmstat.direct_map_level2_splits
      3.67 ± 25%      -4.5%       3.50 ± 20%      +9.1%       4.00 ± 30%  proc-vmstat.direct_map_level3_splits
     32333            +0.3%      32426            +1.7%      32871        proc-vmstat.nr_active_anon
     20.00            -2.5%      19.50 ±  6%      +0.0%      20.00        proc-vmstat.nr_active_file
    118253            +0.1%     118408            -0.1%     118105        proc-vmstat.nr_anon_pages
    143.87 ±  6%      -2.9%     139.72 ±  5%      -5.0%     136.74 ±  4%  proc-vmstat.nr_anon_transparent_hugepages
  12978615            -0.0%   12978467            -0.0%   12978364        proc-vmstat.nr_dirty_background_threshold
  25988964            -0.0%   25988667            -0.0%   25988460        proc-vmstat.nr_dirty_threshold
    735222            +0.0%     735342            +0.1%     735764        proc-vmstat.nr_file_pages
      0.00       +1.2e+101%       0.12 ±264%    -100.0%       0.00        proc-vmstat.nr_foll_pin_acquired
      0.00       +1.2e+101%       0.12 ±264%    -100.0%       0.00        proc-vmstat.nr_foll_pin_released
 1.305e+08            -0.0%  1.305e+08            -0.0%  1.305e+08        proc-vmstat.nr_free_pages
    121015            +0.2%     121197            -0.1%     120869        proc-vmstat.nr_inactive_anon
     54.97 ±  3%      -3.6%      52.97            -3.6%      52.97        proc-vmstat.nr_inactive_file
      0.00         +1e+101%       0.10 ±264%    +8e+98%       0.00 ±264%  proc-vmstat.nr_isolated_anon
     39387            -0.1%      39330            -0.3%      39254        proc-vmstat.nr_kernel_stack
      9236            +0.2%       9253            -0.2%       9215        proc-vmstat.nr_mapped
      3118            -0.1%       3115            -0.3%       3107        proc-vmstat.nr_page_table_pages
     36048            +0.3%      36170            +1.5%      36591        proc-vmstat.nr_shmem
     37449            +0.1%      37501            +0.1%      37492        proc-vmstat.nr_slab_reclaimable
    108495            -0.4%     108052            -0.2%     108274        proc-vmstat.nr_slab_unreclaimable
    701348            +0.0%     701349            +0.0%     701349        proc-vmstat.nr_unevictable
     32333            +0.3%      32426            +1.7%      32871        proc-vmstat.nr_zone_active_anon
     20.00            -2.5%      19.50 ±  6%      +0.0%      20.00        proc-vmstat.nr_zone_active_file
    121015            +0.2%     121197            -0.1%     120869        proc-vmstat.nr_zone_inactive_anon
     54.97 ±  3%      -3.6%      52.97            -3.6%      52.97        proc-vmstat.nr_zone_inactive_file
    701348            +0.0%     701349            +0.0%     701349        proc-vmstat.nr_zone_unevictable
     85280 ±  5%      +0.6%      85815 ±  4%      +3.8%      88514 ±  3%  proc-vmstat.numa_hint_faults
     57527 ±  5%      -0.4%      57314 ±  6%      +2.0%      58684 ±  5%  proc-vmstat.numa_hint_faults_local
   1432123            +0.5%    1439797            +0.2%    1434282        proc-vmstat.numa_hit
      1189            -0.0%       1189            -0.3%       1185        proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1200139            +0.6%    1207878            +0.2%    1202433        proc-vmstat.numa_local
    231974            -0.1%     231848            -0.1%     231850        proc-vmstat.numa_other
     31085 ± 15%      +6.6%      33122 ± 13%     +18.4%      36793 ±  9%  proc-vmstat.numa_pages_migrated
    711962            +0.4%     715071            +1.1%     719653        proc-vmstat.numa_pte_updates
     35756            +1.5%      36308 ±  3%      +1.8%      36391 ±  3%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   1863739            -0.0%    1863186            -0.0%    1863720        proc-vmstat.pgalloc_normal
   1376312            +0.1%    1377345            +0.4%    1381231        proc-vmstat.pgfault
   1780472            -0.1%    1778470            -0.1%    1778814        proc-vmstat.pgfree
     31085 ± 15%      +6.6%      33122 ± 13%     +18.4%      36793 ±  9%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgpgin
    144501            +0.5%     145200            +0.6%     145346        proc-vmstat.pgreuse
    104.83 ± 14%      -5.2%      99.38 ± 12%      -8.7%      95.75 ± 10%  proc-vmstat.thp_collapse_alloc
    567.00            +0.0%     567.00            +0.0%     567.00        proc-vmstat.thp_deferred_split_page
    623.33            -0.1%     623.00            -0.0%     623.12        proc-vmstat.thp_fault_alloc
      7.00 ± 34%     +35.7%       9.50 ± 73%    +101.8%      14.12 ± 62%  proc-vmstat.thp_migration_success
     53.50 ±  6%      -7.0%      49.75 ± 20%      +3.0%      55.12 ±  4%  proc-vmstat.thp_scan_exceed_share_pte
    567.00            +0.0%     567.00            +0.0%     567.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     37.33            -0.9%      37.00            +0.1%      37.38        proc-vmstat.unevictable_pgs_culled
      0.02 ±  6%      -2.3%       0.02 ±  6%      +3.0%       0.02 ± 13%  perf-stat.i.MPKI
  8.55e+10            +0.1%  8.561e+10            +0.3%  8.576e+10        perf-stat.i.branch-instructions
      0.07 ±  2%      +0.0        0.07 ±  2%      +0.0        0.07        perf-stat.i.branch-miss-rate%
   4545846           -10.0%    4090247            -7.7%    4196231 ±  2%  perf-stat.i.branch-misses
     10.11 ±  2%      +0.7       10.81 ± 13%      +0.1       10.17 ±  4%  perf-stat.i.cache-miss-rate%
    774557 ±  2%      +8.7%     841671 ± 14%      +1.9%     789409        perf-stat.i.cache-misses
   6033867            +1.4%    6118193 ±  2%      +1.6%    6131826 ±  2%  perf-stat.i.cache-references
      2202            -0.2%       2198            -0.3%       2195        perf-stat.i.context-switches
      0.78            -0.7%       0.77            -0.8%       0.77        perf-stat.i.cpi
    224061            +0.0%     224069            +0.0%     224064        perf-stat.i.cpu-clock
 3.155e+11            +0.1%  3.157e+11            +0.1%  3.158e+11        perf-stat.i.cpu-cycles
    260.73            -0.1%     260.57            -0.3%     260.03        perf-stat.i.cpu-migrations
    807736 ±  2%      -2.2%     789586 ±  4%      -2.1%     790573        perf-stat.i.cycles-between-cache-misses
      0.00 ±  4%      -0.0        0.00 ±  3%      -0.0        0.00 ±  2%  perf-stat.i.dTLB-load-miss-rate%
   1429967 ±  4%     -20.2%    1140533 ±  3%     -19.8%    1147272        perf-stat.i.dTLB-load-misses
 1.262e+11            +0.9%  1.273e+11            +1.3%  1.279e+11        perf-stat.i.dTLB-loads
      0.00            +0.0        0.00 ±  2%      +0.0        0.00 ±  2%  perf-stat.i.dTLB-store-miss-rate%
    198009 ±  4%      +2.4%     202823 ±  2%      +3.7%     205325        perf-stat.i.dTLB-store-misses
 7.666e+10            +0.6%  7.715e+10            +0.1%  7.674e+10        perf-stat.i.dTLB-stores
 4.229e+11            +0.8%  4.263e+11            +1.0%   4.27e+11        perf-stat.i.instructions
      1.35            +0.8%       1.36            +1.1%       1.36        perf-stat.i.ipc
      0.86 ± 13%      +3.2%       0.89 ±  7%      +4.0%       0.90 ±  9%  perf-stat.i.major-faults
      1.41            +0.0%       1.41            +0.1%       1.41        perf-stat.i.metric.GHz
     28.02            +1.7%      28.49 ±  2%      +1.8%      28.52 ±  2%  perf-stat.i.metric.K/sec
      1287            +0.6%       1295            +0.7%       1296        perf-stat.i.metric.M/sec
      3826            +0.4%       3842            +1.1%       3867        perf-stat.i.minor-faults
     95.12            +0.5       95.65            +0.4       95.57        perf-stat.i.node-load-miss-rate%
    206752 ±  3%      +8.9%     225079 ± 13%      +3.3%     213575 ±  3%  perf-stat.i.node-load-misses
     19797 ±  5%      -6.5%      18518 ±  3%      -2.8%      19237 ± 10%  perf-stat.i.node-loads
      3827            +0.4%       3843            +1.1%       3868        perf-stat.i.page-faults
    224061            +0.0%     224069            +0.0%     224064        perf-stat.i.task-clock
      0.00 ±  2%      +8.1%       0.00 ± 14%      +1.0%       0.00        perf-stat.overall.MPKI
      0.01            -0.0        0.00            -0.0        0.00 ±  2%  perf-stat.overall.branch-miss-rate%
     12.77 ±  2%      +0.9       13.68 ± 12%      +0.0       12.81 ±  3%  perf-stat.overall.cache-miss-rate%
      0.74            -0.7%       0.74            -0.9%       0.74        perf-stat.overall.cpi
    409914 ±  2%      -6.5%     383310 ± 12%      -1.9%     401951        perf-stat.overall.cycles-between-cache-misses
      0.00 ±  3%      -0.0        0.00 ±  3%      -0.0        0.00        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  4%      +0.0        0.00 ±  2%      +0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
      1.35            +0.7%       1.36            +0.9%       1.36        perf-stat.overall.ipc
     91.06            +1.1       92.17            +0.4       91.47        perf-stat.overall.node-load-miss-rate%
     59225            -0.0%      59212            +1.3%      60020        perf-stat.overall.path-length
 8.573e+10            +0.0%  8.577e+10            +0.3%    8.6e+10        perf-stat.ps.branch-instructions
   4506836           -10.2%    4046280            -7.8%    4154257 ±  2%  perf-stat.ps.branch-misses
    767955 ±  2%      +8.9%     836016 ± 14%      +2.0%     783270        perf-stat.ps.cache-misses
   6011710            +1.4%    6098215 ±  2%      +1.8%    6118311 ±  2%  perf-stat.ps.cache-references
      2188            -0.2%       2184            -0.4%       2180        perf-stat.ps.context-switches
    223290            -0.0%     223290            -0.0%     223290        perf-stat.ps.cpu-clock
 3.146e+11            -0.0%  3.146e+11            +0.1%  3.148e+11        perf-stat.ps.cpu-cycles
    259.09            -0.1%     258.83            -0.3%     258.28        perf-stat.ps.cpu-migrations
   1434727 ±  4%     -19.6%    1152815 ±  3%     -19.1%    1161146        perf-stat.ps.dTLB-load-misses
 1.265e+11            +0.8%  1.276e+11            +1.3%  1.282e+11        perf-stat.ps.dTLB-loads
    200572 ±  4%      +2.3%     205194 ±  2%      +3.8%     208118        perf-stat.ps.dTLB-store-misses
 7.687e+10            +0.6%  7.729e+10            +0.1%  7.695e+10        perf-stat.ps.dTLB-stores
  4.24e+11            +0.7%   4.27e+11            +1.0%  4.282e+11        perf-stat.ps.instructions
      0.85 ± 11%      +2.3%       0.87 ±  7%      +3.7%       0.88 ±  8%  perf-stat.ps.major-faults
      3770            +0.3%       3782            +1.0%       3808        perf-stat.ps.minor-faults
    206229 ±  3%      +8.9%     224678 ± 13%      +3.3%     212967 ±  3%  perf-stat.ps.node-load-misses
     20208 ±  5%      -6.9%      18822 ±  3%      -1.8%      19843 ±  9%  perf-stat.ps.node-loads
      3771            +0.3%       3783            +1.0%       3809        perf-stat.ps.page-faults
    223290            -0.0%     223290            -0.0%     223290        perf-stat.ps.task-clock
 1.326e+14            +0.7%  1.336e+14            +1.1%   1.34e+14        perf-stat.total.instructions
   8531252            +0.0%    8532824            +0.7%    8589374 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
  14518785 ±  2%      -4.7%   13837316 ±  3%      -2.3%   14189117 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
   2709106 ± 16%      -9.3%    2456958 ± 11%      -0.6%    2693750 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.min
   2711132 ±  3%      -0.4%    2698970 ±  2%      +2.6%    2782256 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.51 ±  6%      +1.3%       0.52 ±  5%      -0.4%       0.51 ± 11%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.25 ± 10%      -6.7%       1.17 ± 10%      -3.3%       1.21 ± 11%  sched_debug.cfs_rq:/.h_nr_running.max
      0.17            +0.0%       0.17            +0.0%       0.17        sched_debug.cfs_rq:/.h_nr_running.min
      0.29 ±  4%      -3.2%       0.28 ±  3%      +0.7%       0.29 ±  4%  sched_debug.cfs_rq:/.h_nr_running.stddev
      1.21 ±151%     -20.0%       0.97 ±183%     -77.7%       0.27 ±174%  sched_debug.cfs_rq:/.left_deadline.avg
    185.47 ±152%      -2.8%     180.35 ±170%     -67.4%      60.42 ±174%  sched_debug.cfs_rq:/.left_deadline.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_deadline.min
     13.58 ±152%      -8.9%      12.37 ±172%     -70.3%       4.03 ±174%  sched_debug.cfs_rq:/.left_deadline.stddev
      1.18 ±151%     -21.1%       0.93 ±190%     -78.7%       0.25 ±177%  sched_debug.cfs_rq:/.left_vruntime.avg
    179.30 ±151%      -3.7%     172.58 ±177%     -68.6%      56.36 ±177%  sched_debug.cfs_rq:/.left_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_vruntime.min
     13.20 ±151%     -10.2%      11.85 ±179%     -71.5%       3.76 ±177%  sched_debug.cfs_rq:/.left_vruntime.stddev
      4794 ± 20%    +161.9%      12559 ±178%     -11.4%       4249 ± 25%  sched_debug.cfs_rq:/.load.avg
    184159 ± 70%    +949.0%    1931901 ±259%     -45.7%      99973 ±130%  sched_debug.cfs_rq:/.load.max
    772.72            -0.3%     770.27            -0.6%     768.40        sched_debug.cfs_rq:/.load.min
     16293 ± 60%    +708.0%     131656 ±253%     -37.6%      10175 ± 95%  sched_debug.cfs_rq:/.load.stddev
    264.38 ± 38%     -38.3%     163.16 ± 80%     +21.4%     320.84 ± 54%  sched_debug.cfs_rq:/.load_avg.avg
     14721           -27.6%      10657 ± 53%      +0.8%      14833        sched_debug.cfs_rq:/.load_avg.max
      0.67            +0.0%       0.67            +0.0%       0.67        sched_debug.cfs_rq:/.load_avg.min
      1726 ± 23%     -36.8%       1091 ± 65%     +11.0%       1915 ± 30%  sched_debug.cfs_rq:/.load_avg.stddev
   8531252            +0.0%    8532824            +0.7%    8589374 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
  14518785 ±  2%      -4.7%   13837316 ±  3%      -2.3%   14189117 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
   2709106 ± 16%      -9.3%    2456958 ± 11%      -0.6%    2693750 ± 18%  sched_debug.cfs_rq:/.min_vruntime.min
   2711132 ±  3%      -0.4%    2698970 ±  2%      +2.6%    2782256 ±  4%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.51 ±  6%      +1.5%       0.52 ±  5%      -0.4%       0.51 ± 11%  sched_debug.cfs_rq:/.nr_running.avg
      1.08 ± 11%      -5.8%       1.02 ±  5%      -3.8%       1.04 ± 10%  sched_debug.cfs_rq:/.nr_running.max
      0.17            +0.0%       0.17            +0.0%       0.17        sched_debug.cfs_rq:/.nr_running.min
      0.27 ±  5%      -1.5%       0.27 ±  4%      +1.3%       0.27 ±  4%  sched_debug.cfs_rq:/.nr_running.stddev
     24.50 ±127%     -22.7%      18.94 ±232%     +16.5%      28.55 ±232%  sched_debug.cfs_rq:/.removed.load_avg.avg
      5044 ±136%     -61.2%       1955 ±248%     -60.4%       1998 ±242%  sched_debug.cfs_rq:/.removed.load_avg.max
    341.84 ±133%     -46.3%     183.42 ±241%     -31.9%     232.93 ±238%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      1.32 ± 43%      +8.8%       1.44 ± 90%     +47.7%       1.95 ± 59%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     86.53           -25.1%      64.83 ± 57%      +1.3%      87.69 ± 49%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     10.07 ± 22%     -12.6%       8.80 ± 68%     +21.7%      12.26 ± 49%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      1.32 ± 43%      +8.8%       1.44 ± 90%     +47.7%       1.95 ± 59%  sched_debug.cfs_rq:/.removed.util_avg.avg
     86.53           -25.1%      64.83 ± 57%      +1.3%      87.67 ± 49%  sched_debug.cfs_rq:/.removed.util_avg.max
     10.07 ± 22%     -12.6%       8.80 ± 68%     +21.6%      12.25 ± 49%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      1.18 ±151%     -21.1%       0.93 ±190%     -78.6%       0.25 ±177%  sched_debug.cfs_rq:/.right_vruntime.avg
    179.30 ±151%      -3.7%     172.58 ±177%     -68.5%      56.40 ±177%  sched_debug.cfs_rq:/.right_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.right_vruntime.min
     13.20 ±151%     -10.2%      11.85 ±179%     -71.5%       3.76 ±177%  sched_debug.cfs_rq:/.right_vruntime.stddev
    535.53 ±  6%      +1.4%     543.29 ±  5%      -0.3%     533.82 ± 10%  sched_debug.cfs_rq:/.runnable_avg.avg
      1177 ±  5%      -1.5%       1160 ±  7%      +0.9%       1187 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    170.64            -0.2%     170.38            -0.1%     170.46        sched_debug.cfs_rq:/.runnable_avg.min
    275.57 ±  4%      -1.8%     270.50 ±  5%      +1.9%     280.77 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00 ±223%    -100.0%       0.00         +3773.7%       0.00 ±264%  sched_debug.cfs_rq:/.spread.avg
      0.00 ±223%    -100.0%       0.00         +3773.7%       0.04 ±264%  sched_debug.cfs_rq:/.spread.max
      0.00 ±223%    -100.0%       0.00         +3773.7%       0.00 ±264%  sched_debug.cfs_rq:/.spread.stddev
    534.63 ±  6%      +1.4%     542.35 ±  5%      -0.3%     532.95 ± 10%  sched_debug.cfs_rq:/.util_avg.avg
      1086 ±  4%      -0.8%       1076 ±  3%      +1.1%       1097 ±  2%  sched_debug.cfs_rq:/.util_avg.max
    156.53 ± 10%     -10.5%     140.17 ± 19%      -1.9%     153.58 ± 10%  sched_debug.cfs_rq:/.util_avg.min
    270.21 ±  4%      -0.9%     267.71 ±  5%      +2.2%     276.05 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
    359.66 ± 16%      +8.2%     389.02 ± 10%      -7.8%     331.59 ± 13%  sched_debug.cfs_rq:/.util_est.avg
    856.42 ± 12%      -5.6%     808.23 ± 11%      +1.2%     866.65 ± 13%  sched_debug.cfs_rq:/.util_est.max
     34.81 ± 49%      -6.0%      32.71 ± 66%      +9.5%      38.10 ± 50%  sched_debug.cfs_rq:/.util_est.min
    206.72 ± 13%      +6.8%     220.83 ± 10%      +3.0%     212.95 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
    964734            +0.6%     970533            +0.2%     966955        sched_debug.cpu.avg_idle.avg
   1070847 ±  5%     +56.9%    1680655 ± 84%      +8.2%    1158791 ± 15%  sched_debug.cpu.avg_idle.max
    263131 ±  2%      -6.4%     246182 ± 10%      -0.3%     262387        sched_debug.cpu.avg_idle.min
     79329 ±  7%     +44.1%     114341 ± 70%      +5.1%      83364 ±  8%  sched_debug.cpu.avg_idle.stddev
    210380            +0.5%     211348            +0.0%     210456        sched_debug.cpu.clock.avg
    210410            +0.5%     211378            +0.0%     210486        sched_debug.cpu.clock.max
    210346            +0.5%     211315            +0.0%     210422        sched_debug.cpu.clock.min
     17.86 ±  9%      -0.5%      17.76 ±  8%      -0.5%      17.77 ±  7%  sched_debug.cpu.clock.stddev
    208982            +0.5%     209966            +0.0%     209070        sched_debug.cpu.clock_task.avg
    209217            +0.5%     210215            +0.0%     209311        sched_debug.cpu.clock_task.max
    194174            +0.5%     195205            -0.0%     194153        sched_debug.cpu.clock_task.min
      1001 ±  3%      -0.2%     999.87            +0.8%       1010        sched_debug.cpu.clock_task.stddev
      5975            +0.0%       5978            +0.1%       5982        sched_debug.cpu.curr->pid.avg
     11663            +0.1%      11671            +0.0%      11669        sched_debug.cpu.curr->pid.max
      2652            -0.0%       2651            -8.0%       2440 ± 22%  sched_debug.cpu.curr->pid.min
      3137            +0.2%       3143            +0.8%       3163        sched_debug.cpu.curr->pid.stddev
    500396            +1.1%     505751            +0.2%     501173        sched_debug.cpu.max_idle_balance_cost.avg
    548376 ±  5%     +66.2%     911136 ± 97%      +8.6%     595263 ± 15%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      3903 ± 57%    +692.8%      30948 ±190%    +105.7%       8030 ± 87%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 32%      -8.7%       0.00 ± 29%      -2.0%       0.00 ± 40%  sched_debug.cpu.next_balance.stddev
      0.43            -0.0%       0.43            +0.3%       0.43        sched_debug.cpu.nr_running.avg
      1.22 ± 12%      -4.5%       1.17 ± 10%      -1.1%       1.21 ± 11%  sched_debug.cpu.nr_running.max
      0.17            +0.0%       0.17            +0.0%       0.17        sched_debug.cpu.nr_running.min
      0.30 ±  2%      -1.4%       0.29 ±  2%      +0.5%       0.30 ±  2%  sched_debug.cpu.nr_running.stddev
      2839 ±  3%      -1.5%       2796            -2.0%       2783        sched_debug.cpu.nr_switches.avg
     49142 ± 18%      +8.9%      53499 ± 13%     +15.1%      56558 ± 14%  sched_debug.cpu.nr_switches.max
    832.86 ±  3%      +2.1%     850.52 ±  2%      +1.3%     843.40 ±  2%  sched_debug.cpu.nr_switches.min
      4894 ± 14%      -3.1%       4744 ±  9%      +0.3%       4907 ±  7%  sched_debug.cpu.nr_switches.stddev
      0.00 ±104%     -30.8%       0.00 ±100%    -105.8%      -0.00        sched_debug.cpu.nr_uninterruptible.avg
     37.83 ± 32%      +8.5%      41.06 ± 45%     +25.6%      47.50 ± 29%  sched_debug.cpu.nr_uninterruptible.max
    -26.67           -14.3%     -22.85           -29.2%     -18.88        sched_debug.cpu.nr_uninterruptible.min
      5.86 ± 16%      +3.2%       6.05 ± 13%     +10.3%       6.46 ± 11%  sched_debug.cpu.nr_uninterruptible.stddev
    210348            +0.5%     211316            +0.0%     210424        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
    209140            +0.5%     210109            +0.0%     209214        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.00 ± 72%     -25.4%       0.00 ±100%     +13.7%       0.00 ± 76%  sched_debug.rt_rq:.rt_time.avg
      0.04 ± 72%     -25.4%       0.03 ±100%     +13.7%       0.05 ± 76%  sched_debug.rt_rq:.rt_time.max
      0.00 ± 72%     -25.4%       0.00 ±100%     +13.7%       0.00 ± 76%  sched_debug.rt_rq:.rt_time.stddev
    211296            +0.4%     212226            +0.0%     211338        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
      3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_base_slice
   6237751            +0.0%    6237751            +0.0%    6237751        sched_debug.sysctl_sched.sysctl_sched_features
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      0.00        +6.2e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.00 ±152%     -25.0%       0.00 ±129%     -75.0%       0.00 ±264%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00        +1.1e+99%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%     +50.0%       0.00 ±264%    +125.0%       0.00 ±264%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00          -100.0%       0.00        +2.5e+98%       0.00 ±173%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      0.01 ± 14%      -0.5%       0.01 ± 15%      +5.0%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00        +6.2e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00          -100.0%       0.00        +3.8e+98%       0.00 ±264%  perf-sched.sch_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.16 ±141%     +14.7%       1.33 ±129%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.00 ± 14%     -15.6%       0.00 ± 14%     -15.6%       0.00 ± 14%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 19%      +3.8%       0.01 ± 15%      +1.2%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00            -0.0%       0.00            +4.2%       0.00 ± 10%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ±  9%      -2.2%       0.00 ± 11%      -2.2%       0.00 ± 11%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01            -0.0%       0.01            -0.0%       0.01        perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00          -100.0%       0.00        +1.4e+99%       0.00 ±195%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.00            +0.0%       0.00            +0.0%       0.00        perf-sched.sch_delay.avg.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 19%      +5.0%       0.00 ± 26%     +10.0%       0.00 ± 24%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00          +5e+98%       0.00 ±264%    +5e+98%       0.00 ±264%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00 ±152%     -75.0%       0.00 ±264%    +150.0%       0.00 ±153%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.00 ±152%     -33.3%       0.00 ±180%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      0.00            +0.0%       0.00            +0.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00 ± 22%     -17.5%       0.00 ± 15%     -17.5%       0.00 ± 15%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 13%     -11.8%       0.00 ± 20%     -11.8%       0.00 ± 20%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 11%      +2.6%       0.01 ± 13%      -5.3%       0.01 ±  8%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.00 ± 14%     -14.3%       0.00            -7.1%       0.00 ± 13%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ± 20%      +2.3%       0.00 ± 17%      +9.1%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.00 ±141%     -43.8%       0.00 ±185%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±104%    +125.0%       0.00 ± 89%     -25.0%       0.00 ±133%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.00            -0.0%       0.00            -0.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      2.48 ±144%      -6.7%       2.32 ±213%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
      0.01            +0.0%       0.01            +0.0%       0.01        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.00            -0.0%       0.00 ± 16%      +8.3%       0.00 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±100%     -20.6%       0.00 ±136%     -60.3%       0.00 ±185%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      0.00            -0.0%       0.00            -4.2%       0.00 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ± 14%      +3.6%       0.00 ± 13%     +10.7%       0.00 ± 15%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00           +87.5%       0.00 ± 62%     +50.0%       0.00 ± 47%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±  9%      -0.6%       0.01 ± 23%     +13.4%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00 ±  9%      -5.4%       0.00 ± 13%      -2.2%       0.00 ± 11%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.02 ± 32%   +2586.0%       0.41 ±253%     +34.3%       0.02 ± 19%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 21%      -9.2%       0.01 ± 11%      +6.6%       0.01 ± 42%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00        +6.2e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.00 ± 73%      -4.5%       0.00 ± 79%     -86.4%       0.00 ±264%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00        +1.1e+99%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%     -50.0%       0.00 ±264%     -25.0%       0.00 ±264%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00          -100.0%       0.00        +7.5e+98%       0.00 ±173%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      0.01 ± 21%     +11.9%       0.01 ± 18%      +8.3%       0.01 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00        +6.2e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00          -100.0%       0.00        +3.8e+98%       0.00 ±264%  perf-sched.sch_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.16 ±141%     +14.7%       1.33 ±129%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.01 ± 11%     -11.9%       0.01 ± 13%     -11.9%       0.01 ± 13%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 15%     +15.6%       0.01 ± 26%      +6.3%       0.01 ± 10%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 28%      -0.7%       0.01 ± 23%      -8.8%       0.01 ± 26%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ± 59%      -5.9%       0.01 ± 39%      +1.7%       0.01 ± 38%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ± 37%     +45.9%       0.02 ± 21%      -2.4%       0.01 ± 27%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00          -100.0%       0.00          +2e+99%       0.00 ±200%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.00            +0.0%       0.00            +0.0%       0.00        perf-sched.sch_delay.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 22%     +22.7%       0.01 ± 63%     +29.5%       0.01 ± 54%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00          +5e+98%       0.00 ±264%    +5e+98%       0.00 ±264%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00 ±159%     -67.9%       0.00 ±264%     +39.3%       0.00 ±130%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.00 ±152%     -33.3%       0.00 ±180%    -100.0%       0.00        perf-sched.sch_delay.max.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      0.02 ± 66%     -24.4%       0.02 ± 12%     -26.7%       0.02 ± 13%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 21%      -5.8%       0.01 ± 16%      +8.1%       0.01 ± 33%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 14%      +1.4%       0.01 ± 32%     +13.5%       0.01 ± 27%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 34%      -5.7%       0.01 ± 20%     -15.9%       0.01 ± 10%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ±  7%      -2.5%       0.01 ± 10%      +3.1%       0.01 ±  4%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ± 10%      -5.3%       0.01 ± 11%      +2.0%       0.01 ± 13%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.00 ±141%     -43.8%       0.00 ±185%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±104%    +125.0%       0.00 ± 89%     -25.0%       0.00 ±133%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.02 ± 14%     -14.2%       0.02 ± 35%      -8.0%       0.02 ± 24%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      2.48 ±144%      -6.7%       2.32 ±213%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
      0.01 ± 40%      +0.9%       0.01 ± 50%     +12.5%       0.01 ± 51%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 11%      -9.2%       0.01 ± 34%      +4.6%       0.01 ± 24%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±100%     -20.6%       0.00 ±136%     -60.3%       0.00 ±185%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      0.01 ± 36%     -18.8%       0.01 ± 13%     -15.8%       0.01 ± 22%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.24 ±149%     -29.9%       0.17 ±189%     -82.7%       0.04 ± 80%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 20%      +7.4%       0.01 ± 24%     +29.5%       0.01 ± 24%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 17%     +15.5%       0.01 ± 28%     +24.5%       0.01 ± 17%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01           +20.0%       0.01 ± 36%     +40.0%       0.01 ± 52%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2.99 ± 30%   +1604.1%      51.03 ±246%     +17.8%       3.53 ±  6%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 14%    +698.8%       0.03 ±230%      -6.2%       0.00 ± 10%  perf-sched.total_sch_delay.average.ms
      4.81 ± 41%    +993.5%      52.58 ±238%     -26.7%       3.53 ±  6%  perf-sched.total_sch_delay.max.ms
    183.25 ±  4%      -5.9%     172.36            -1.0%     181.37 ±  6%  perf-sched.total_wait_and_delay.average.ms
      7888 ±  3%      -1.5%       7770 ±  3%      +0.2%       7905 ±  2%  perf-sched.total_wait_and_delay.count.ms
      4976            -0.0%       4975            -0.0%       4976        perf-sched.total_wait_and_delay.max.ms
    183.25 ±  4%      -6.0%     172.33            -1.0%     181.37 ±  6%  perf-sched.total_wait_time.average.ms
      4976            -0.0%       4975            -0.0%       4976        perf-sched.total_wait_time.max.ms
      5.80            +0.6%       5.84            -0.7%       5.76        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    540.53 ± 63%     -20.7%     428.70 ± 67%     +38.0%     745.96 ± 83%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    799.68            +0.0%     799.69            +0.0%     799.71        perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    700.04            +0.0%     700.04            -1.1%     692.08 ±  3%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    231.53 ±  4%      -1.4%     228.18 ±  3%      -3.2%     224.10        perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00         +1e+104%     101.73 ±264%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      8.38            +0.0%       8.38            +0.0%       8.38        perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    399.98            -0.0%     399.93            +0.0%     400.06        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     29.75 ±  2%      -0.8%      29.51 ±  2%      +1.5%      30.18        perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    581.51 ±  2%      +0.8%     586.25 ±  2%      -1.0%     575.54        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    376.94            -1.8%     370.20            -0.3%     375.93        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.13 ± 70%      -6.5%       0.12 ± 77%     -62.5%       0.05 ±173%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.01 ±  3%      +1.5%       0.01            +1.5%       0.01        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      0.38            +0.6%       0.38 ±  2%      +1.2%       0.39 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.57            +0.0%     453.59            -0.4%     451.89        perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     30.28 ±  7%      +3.1%      31.22 ±  2%      +0.8%      30.52 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    573.67 ±  6%      -5.7%     541.11 ±  5%      -1.9%     562.52 ±  8%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    522.89 ±  4%      +2.4%     535.42 ±  2%      +3.2%     539.53 ±  4%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1494 ±  7%      -2.5%       1457 ±  7%      +3.1%       1540 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.00 ± 50%     +25.0%       3.75 ± 76%     -25.0%       2.25 ± 69%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.00            +0.0%       5.00            +0.0%       5.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     10.00            +0.0%      10.00            +1.2%      10.12 ±  3%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    126.00            +0.0%     126.00            +0.0%     126.00        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +1.2e+101%       0.12 ±264%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
    125.00            +0.0%     125.00            +0.0%     125.00        perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     10.00            +0.0%      10.00            +0.0%      10.00        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2268 ±  2%      +1.1%       2292 ±  2%      -1.1%       2244        perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     20.67 ±  2%      -0.8%      20.50 ±  2%      +1.0%      20.88        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     13.00            +0.0%      13.00            +0.0%      13.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     31.67 ± 81%     -21.4%      24.88 ± 77%     -70.0%       9.50 ±173%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      1111            +0.0%       1111            +0.3%       1114        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
     87.00            +0.0%      87.00            +0.0%      87.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     20.00            +0.0%      20.00            -3.1%      19.38 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    162.50 ±  6%      -3.5%     156.75 ±  2%      -1.0%     160.88 ±  6%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1846 ±  5%      -5.5%       1743 ±  8%      -0.5%       1836 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    446.00 ±  5%      +2.8%     458.38 ±  3%      +3.0%     459.38 ±  5%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4976            -0.0%       4975            -0.0%       4976        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1350 ± 56%     -25.6%       1005 ± 70%      +2.6%       1385 ± 62%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    999.61            +0.0%     999.63            +0.0%     999.64        perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1000            +0.0%       1000            +0.0%       1000        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1670 ± 56%     -25.1%       1251 ± 52%     -32.8%       1123 ± 29%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00         +1e+104%     101.73 ±264%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      1000            -0.0%       1000            +0.0%       1000        perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1000            +0.1%       1001            +0.1%       1001        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1010            -0.0%       1009            +0.0%       1010        perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1000            +0.0%       1000            +0.0%       1000        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    500.00            -0.0%     499.99            +0.0%     500.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.14 ± 70%      -6.7%       0.13 ± 77%     -62.0%       0.05 ±173%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.09 ±  4%      -1.9%       0.08 ±  5%      -2.2%       0.08 ±  3%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      0.85 ±  2%      +0.3%       0.85 ±  2%      +1.1%       0.86 ±  3%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    505.00            -0.0%     505.00            -0.0%     504.88        perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    491.65            +0.1%     492.24            +0.3%     493.11        perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3185 ± 11%     -25.7%       2367 ± 28%      -1.4%       3142 ± 33%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3487 ± 15%      -7.3%       3232 ± 16%      +2.7%       3583 ± 17%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.80            +0.6%       5.84            -0.7%       5.76        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00          +1e+99%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.02 ±163%     -98.3%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.06 ± 49%     -29.5%       0.04 ± 58%     -24.0%       0.05 ± 53%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00          -100.0%       0.00        +2.5e+98%       0.00 ±264%  perf-sched.wait_time.avg.ms.__cond_resched.khugepaged_wait_work.khugepaged.kthread.ret_from_fork
      0.00        +2.5e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.04 ± 58%     -38.2%       0.03 ±115%     +42.3%       0.06 ± 83%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_lseek.do_syscall_64
      0.01 ±143%     +67.3%       0.02 ±109%     +72.1%       0.02 ±156%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.08 ± 51%      -8.2%       0.07 ± 73%     -51.5%       0.04 ± 44%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
    540.52 ± 63%     -20.4%     430.07 ± 66%     +38.0%     745.95 ± 83%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ±223%     +45.0%       0.04 ±167%     +29.4%       0.04 ±185%  perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    799.68            +0.0%     799.69            +0.0%     799.70        perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.95 ±  4%      -0.6%       1.94 ±  8%      -4.6%       1.86 ±  4%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    700.04            +0.0%     700.04            -1.1%     692.08 ±  3%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    231.53 ±  4%      -1.4%     228.18 ±  3%      -3.2%     224.09        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.04 ± 11%     -60.7%       0.02 ±101%  +2.6e+05%     101.75 ±264%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      8.37            +0.0%       8.37            +0.0%       8.37        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.20            +0.1%       0.20            -0.3%       0.20        perf-sched.wait_time.avg.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
    399.98            -0.0%     399.93            +0.0%     400.06        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.03 ±130%     +15.6%       0.03 ± 60%     -48.0%       0.02 ±103%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     29.74 ±  2%      -0.8%      29.51 ±  2%      +1.5%      30.18        perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.55 ± 12%     +11.9%       3.98 ±  8%      +2.8%       3.65 ±  8%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    581.51 ±  2%      +0.8%     586.25 ±  2%      -1.0%     575.54        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1.65 ± 29%     -13.0%       1.43 ±  6%     -16.1%       1.38 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    376.94            -1.8%     370.20            -0.3%     375.93        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.19            -0.3%       0.19            -0.5%       0.19        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.01 ±147%    -100.0%       0.00           -53.7%       0.00 ±264%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.01 ±  4%      +2.1%       0.01            +2.1%       0.01        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      0.38            +0.6%       0.38 ±  2%      +1.2%       0.38 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.56            +0.0%     453.59            -0.4%     451.89        perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ±102%     -22.9%       0.00 ±104%     -70.0%       0.00 ±193%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     30.28 ±  7%      +3.1%      31.22 ±  2%      +0.8%      30.52 ±  5%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    573.67 ±  6%      -5.7%     541.10 ±  5%      -1.9%     562.51 ±  8%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.06 ± 40%     -27.4%       0.04 ± 66%      +0.5%       0.06 ± 35%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.96 ±  4%      -0.4%       1.95 ±  8%      -4.1%       1.88 ±  4%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    522.87 ±  4%      +2.3%     535.01 ±  2%      +3.2%     539.50 ±  4%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4976            -0.0%       4975            -0.0%       4976        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00          +1e+99%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.02 ±163%     -98.3%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.15 ± 39%     -19.4%       0.12 ± 61%     -33.6%       0.10 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00          -100.0%       0.00        +2.5e+98%       0.00 ±264%  perf-sched.wait_time.max.ms.__cond_resched.khugepaged_wait_work.khugepaged.kthread.ret_from_fork
      0.00        +2.5e+98%       0.00 ±264%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.05 ± 63%     -47.0%       0.03 ±114%     +50.0%       0.07 ± 90%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_lseek.do_syscall_64
      0.02 ±143%     +39.0%       0.03 ±115%     +15.9%       0.02 ±158%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.10 ± 60%     +15.2%       0.11 ± 54%     -30.3%       0.07 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1350 ± 56%     -25.2%       1009 ± 69%      +2.6%       1385 ± 62%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ±223%     +45.0%       0.04 ±167%     +38.6%       0.04 ±173%  perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    999.61            +0.0%     999.62            +0.0%     999.64        perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3.90 ±  4%      -0.5%       3.88 ±  8%      -4.6%       3.72 ±  4%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1000            +0.0%       1000            +0.0%       1000        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1670 ± 56%     -25.1%       1251 ± 52%     -32.8%       1123 ± 29%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.04 ± 11%     -60.7%       0.02 ±101%  +2.6e+05%     101.75 ±264%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      1000            -0.0%       1000            +0.0%       1000        perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.20            +0.1%       0.20            +0.1%       0.20        perf-sched.wait_time.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      1000            +0.1%       1001            +0.1%       1001        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.06 ±137%     -16.2%       0.05 ± 68%     -48.8%       0.03 ±113%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      1010            -0.0%       1009            +0.0%       1010        perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.99            +0.0%       4.99            -2.5%       4.87 ±  6%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1000            +0.0%       1000            +0.0%       1000        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      5.62 ± 48%     -18.9%       4.56 ±  5%     -21.1%       4.43 ±  3%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    499.99            -0.0%     499.99            +0.0%     499.99        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.21            +0.1%       0.21            +0.0%       0.21        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.01 ±147%    -100.0%       0.00           -53.7%       0.00 ±264%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.08 ±  4%      -1.6%       0.08 ±  3%      -0.5%       0.08 ±  3%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.rdmsr_safe_on_cpu.rdmsrl_safe_on_cpu
      0.85            +0.3%       0.85 ±  2%      +1.1%       0.85 ±  3%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    505.00            -0.0%     505.00            -0.0%     504.87        perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ±102%     -22.9%       0.00 ±104%     -70.0%       0.00 ±193%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    491.65            +0.1%     492.23            +0.3%     493.11        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3185 ± 11%     -25.7%       2367 ± 28%      -1.4%       3142 ± 33%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.15 ± 29%     -30.3%       0.10 ± 63%      +6.1%       0.16 ± 23%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3.92 ±  4%      -0.4%       3.90 ±  8%      -4.1%       3.76 ±  4%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      3487 ± 15%      -7.3%       3232 ± 16%      +2.7%       3583 ± 17%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.25 ±100%      -0.3        0.00            -0.3        0.00        perf-profile.calltrace.cycles-pp.__pthread_enable_asynccancel
      2.61            -0.1        2.52            -0.1        2.53        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     74.67            -0.1       74.58            -0.0       74.64        perf-profile.calltrace.cycles-pp.__libc_write
      0.17 ±141%      -0.0        0.13 ±173%      -0.1        0.06 ±264%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.__libc_write
      1.51 ±  4%      -0.0        1.49 ±  3%      +0.0        1.53 ±  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      1.51 ±  4%      -0.0        1.49 ±  3%      +0.0        1.53 ±  5%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      1.51 ±  4%      -0.0        1.49 ±  3%      +0.0        1.53 ±  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      1.52 ±  4%      -0.0        1.50 ±  2%      +0.0        1.53 ±  5%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      1.50 ±  4%      -0.0        1.48 ±  3%      +0.0        1.52 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      1.40 ±  3%      -0.0        1.38 ±  3%      +0.0        1.42 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.56            -0.0        1.55            -0.0        1.56        perf-profile.calltrace.cycles-pp.up_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.67            -0.0        0.66            -0.0        0.66        perf-profile.calltrace.cycles-pp.fput.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.33 ±  4%      -0.0        1.32 ±  3%      +0.0        1.35 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      2.42            -0.0        2.40            -0.0        2.40        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.97            -0.0        9.96            -0.1        9.91        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_write
      0.74 ±  2%      -0.0        0.73            -0.0        0.73        perf-profile.calltrace.cycles-pp.folio_mark_dirty.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.54            -0.0        1.53            -0.0        1.53        perf-profile.calltrace.cycles-pp.fput.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      0.89            -0.0        0.88            -0.0        0.88        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.shmem_file_write_iter.vfs_write.ksys_write
      0.57 ±  9%      -0.0        0.57 ±  7%      -0.0        0.55 ± 38%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.64 ±  8%      -0.0        0.64 ±  6%      +0.0        0.68 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.44            -0.0        2.44            -0.0        2.42        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.10            -0.0        1.09            -0.0        1.06        perf-profile.calltrace.cycles-pp.file_update_time.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.65            -0.0        0.65            -0.0        0.64        perf-profile.calltrace.cycles-pp.shmem_file_llseek.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      4.57            -0.0        4.57            -0.1        4.51        perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.40            -0.0        2.40            +0.4        2.78        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.86            -0.0        5.86            +0.0        5.87        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.0        0.00            +0.1        0.06 ±264%  perf-profile.calltrace.cycles-pp.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      1.61            +0.0        1.61            -0.0        1.61        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.66            +0.0        1.67            +0.1        1.73        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
     11.70            +0.0       11.70            -0.0       11.65        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.64            +0.0        0.65            +0.0        0.65        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.38            +0.0        1.39            +0.0        1.40        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.13            +0.0        1.14            +0.0        1.13        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      0.96            +0.0        0.96            -0.2        0.74        perf-profile.calltrace.cycles-pp.generic_write_checks.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.52 ±  2%      +0.0        0.53            +0.0        0.53        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__libc_lseek64
      1.17            +0.0        1.18            -0.0        1.12        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      0.90            +0.0        0.90            +0.0        0.91        perf-profile.calltrace.cycles-pp.testcase
      1.05            +0.0        1.06            +0.0        1.06        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.86            +0.0        1.87            +0.1        2.00        perf-profile.calltrace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      4.10            +0.0        4.11            +0.1        4.20        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.54            +0.0        1.55            +0.0        1.54        perf-profile.calltrace.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      6.00            +0.0        6.02            -0.0        5.98        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      3.76            +0.0        3.77            +0.0        3.76        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write
      1.54            +0.0        1.55            +0.0        1.54        perf-profile.calltrace.cycles-pp.folio_mark_accessed.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      6.69            +0.0        6.70            -0.0        6.69        perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.25            +0.0       10.26            -0.0       10.22        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_lseek64
      1.48            +0.0        1.50 ±  3%      +0.0        1.49        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     37.48            +0.0       37.50            -0.2       37.26        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.35            +0.0       30.38            -0.0       30.34        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.98            +0.1        6.03 ±  2%      -0.0        5.97        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      0.00            +0.1        0.06 ±264%      +0.0        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.__libc_lseek64
     10.96            +0.1       11.03            -0.0       10.95        perf-profile.calltrace.cycles-pp.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     47.54            +0.1       47.62            +0.2       47.70        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     13.90            +0.1       13.98            -0.0       13.89        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     59.97            +0.1       60.05            +0.2       60.16        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     61.08            +0.1       61.16            +0.2       61.27        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     15.07            +0.1       15.16            -0.0       15.06        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     27.08            +0.1       27.17            -0.0       27.04        perf-profile.calltrace.cycles-pp.__libc_lseek64
     57.25            +0.1       57.34            +0.2       57.42        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.1        0.12 ±264%      +0.0        0.00        perf-profile.calltrace.cycles-pp.write@plt
      2.69            -0.1        2.60            -0.1        2.61        perf-profile.children.cycles-pp.__fsnotify_parent
      5.13            -0.1        5.05            -0.1        5.06        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.58            -0.1        0.53            -0.0        0.54 ±  2%  perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      1.02            -0.0        0.97            -0.1        0.97        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.05            -0.0        0.02 ±129%      -0.0        0.02 ±129%  perf-profile.children.cycles-pp.load_balance
      3.97            -0.0        3.95            -0.0        3.93        perf-profile.children.cycles-pp.__cond_resched
      1.51 ±  4%      -0.0        1.49 ±  3%      +0.0        1.53 ±  5%  perf-profile.children.cycles-pp.start_secondary
      0.19 ±  4%      -0.0        0.17 ±  3%      -0.1        0.13 ±  6%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      1.50 ±  4%      -0.0        1.48 ±  2%      +0.0        1.52 ±  5%  perf-profile.children.cycles-pp.cpuidle_idle_call
      5.18            -0.0        5.16            -0.0        5.14        perf-profile.children.cycles-pp.mutex_lock
      1.52 ±  4%      -0.0        1.50 ±  2%      +0.0        1.53 ±  5%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.52 ±  4%      -0.0        1.50 ±  2%      +0.0        1.53 ±  5%  perf-profile.children.cycles-pp.do_idle
      1.52 ±  4%      -0.0        1.50 ±  2%      +0.0        1.53 ±  5%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.03 ±100%      -0.0        0.02 ±173%      +0.0        0.04 ± 79%  perf-profile.children.cycles-pp.tick_sched_do_timer
      1.40 ±  3%      -0.0        1.39 ±  3%      +0.0        1.42 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter
      0.43 ±  7%      -0.0        0.41 ±  4%      +0.0        0.43 ±  9%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.30 ±  3%      -0.0        0.28 ±  2%      +0.0        0.32        perf-profile.children.cycles-pp.__x64_sys_write
      1.40 ±  4%      -0.0        1.39 ±  3%      +0.0        1.42 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
     76.40            -0.0       76.38            +0.0       76.42        perf-profile.children.cycles-pp.__libc_write
      1.65            -0.0        1.63            -0.0        1.64        perf-profile.children.cycles-pp.up_write
      0.31 ± 10%      -0.0        0.30 ±  7%      +0.0        0.32 ± 11%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.56 ±  6%      -0.0        0.55 ±  4%      +0.0        0.57 ±  7%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.38            -0.0        0.37 ±  2%      -0.0        0.37 ±  2%  perf-profile.children.cycles-pp.intel_idle_xstate
      0.59 ±  6%      -0.0        0.58 ±  3%      +0.0        0.60 ±  6%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.32            -0.0        2.31            -0.0        2.31        perf-profile.children.cycles-pp.fput
      0.90 ±  7%      -0.0        0.90 ±  4%      +0.0        0.94 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.80 ±  8%      -0.0        0.80 ±  5%      +0.0        0.84 ±  8%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.09 ±  7%      -0.0        0.08 ± 11%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp.rebalance_domains
      1.23            -0.0        1.22            -0.0        1.18        perf-profile.children.cycles-pp.file_update_time
      0.57            -0.0        0.56            -0.0        0.57        perf-profile.children.cycles-pp.generic_file_llseek_size
      0.12 ±  3%      -0.0        0.12 ±  8%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.90 ±  2%      -0.0        0.90            -0.0        0.89        perf-profile.children.cycles-pp.folio_mark_dirty
      0.25 ±  7%      -0.0        0.24 ±  5%      -0.0        0.24 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.08 ±  8%      -0.0        0.08 ±  4%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.menu_select
      0.07 ±  8%      -0.0        0.07 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.49 ±  2%      -0.0        0.49 ±  2%      -0.0        0.49        perf-profile.children.cycles-pp.folio_mapping
      4.82            -0.0        4.82            -0.1        4.75        perf-profile.children.cycles-pp.shmem_write_end
      0.25            -0.0        0.24 ±  2%      -0.0        0.24        perf-profile.children.cycles-pp.noop_dirty_folio
      0.05 ±  7%      -0.0        0.05            -0.0        0.04 ± 37%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.07 ±  7%      -0.0        0.06 ±  7%      -0.0        0.07 ±  7%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.33            -0.0        0.32 ±  2%      +0.0        0.33        perf-profile.children.cycles-pp.__f_unlock_pos
      2.56            -0.0        2.56            +0.5        3.02        perf-profile.children.cycles-pp.rw_verify_area
      0.16 ±  3%      -0.0        0.16 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.lseek@plt
      0.66            -0.0        0.66            +0.0        0.67        perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      0.16 ±  4%      -0.0        0.16 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.xas_start
      0.99            -0.0        0.99            -0.0        0.97        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.73            -0.0        0.73            -0.0        0.72        perf-profile.children.cycles-pp.shmem_file_llseek
      0.00            +0.0        0.00            +0.0        0.01 ±173%  perf-profile.children.cycles-pp.perf_rotate_context
      0.30            +0.0        0.30 ±  2%      +0.0        0.33        perf-profile.children.cycles-pp.xas_load
      0.06 ±  8%      +0.0        0.06 ±  7%      -0.0        0.05 ±  9%  perf-profile.children.cycles-pp.task_tick_fair
      1.08            +0.0        1.09            -0.3        0.82        perf-profile.children.cycles-pp.generic_write_checks
      0.28 ±  2%      +0.0        0.28 ±  3%      -0.0        0.28 ±  4%  perf-profile.children.cycles-pp.intel_idle
      0.16 ±  3%      +0.0        0.17 ±  2%      -0.0        0.13 ±  6%  perf-profile.children.cycles-pp.file_remove_privs
      0.25 ±  7%      +0.0        0.25 ±  6%      +0.0        0.25 ±  5%  perf-profile.children.cycles-pp.tick_sched_handle
      0.32 ±  2%      +0.0        0.32            +0.0        0.32        perf-profile.children.cycles-pp.inode_to_bdi
      0.48            +0.0        0.48            +0.0        0.48        perf-profile.children.cycles-pp.amd_clear_divider
      2.01            +0.0        2.01            +0.1        2.10        perf-profile.children.cycles-pp.down_write
      0.18 ±  3%      +0.0        0.18 ±  3%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.scheduler_tick
      0.16 ±  3%      +0.0        0.16 ±  2%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      1.30            +0.0        1.31            -0.0        1.26        perf-profile.children.cycles-pp.apparmor_file_permission
     11.78            +0.0       11.79            -0.0       11.74        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      1.47            +0.0        1.47            +0.0        1.50        perf-profile.children.cycles-pp.filemap_get_entry
      1.91            +0.0        1.91            +0.1        1.97        perf-profile.children.cycles-pp.security_file_permission
      0.05 ±100%      +0.0        0.05 ±100%      +0.0        0.08 ± 59%  perf-profile.children.cycles-pp.tick_irq_enter
      0.05 ±100%      +0.0        0.05 ±100%      +0.0        0.09 ± 45%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.57            +0.0        0.57            +0.0        0.57        perf-profile.children.cycles-pp.write@plt
      0.99            +0.0        1.00            +0.0        1.01        perf-profile.children.cycles-pp.inode_needs_update_time
      0.51 ±  2%      +0.0        0.52 ±  2%      -0.0        0.47        perf-profile.children.cycles-pp.aa_file_perm
      0.80            +0.0        0.81            +0.0        0.81        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.35 ±  3%      +0.0        0.35 ±  3%      +0.1        0.42 ±  2%  perf-profile.children.cycles-pp.__file_remove_privs
      1.47            +0.0        1.48            +0.0        1.50        perf-profile.children.cycles-pp.testcase
      0.02 ±141%      +0.0        0.02 ±100%      -0.0        0.01 ±264%  perf-profile.children.cycles-pp.clockevents_program_event
      2.21            +0.0        2.22            -0.1        2.07        perf-profile.children.cycles-pp.rcu_all_qs
      0.32 ±  2%      +0.0        0.33            -0.0        0.32        perf-profile.children.cycles-pp.__x64_sys_lseek
      0.65            +0.0        0.66            +0.0        0.65        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      3.82            +0.0        3.83            +0.0        3.86        perf-profile.children.cycles-pp.fault_in_readable
      1.62            +0.0        1.63            -0.0        1.62        perf-profile.children.cycles-pp.folio_unlock
     11.41            +0.0       11.42            -0.1       11.36        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.38 ±  2%      +0.0        0.39 ±  2%      -0.0        0.37        perf-profile.children.cycles-pp.generic_write_check_limits
      0.01 ±223%      +0.0        0.02 ±129%      +0.0        0.02 ±129%  perf-profile.children.cycles-pp._raw_spin_trylock
      6.24            +0.0        6.25            -0.0        6.24        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.10 ± 30%      +0.0        0.11 ± 30%      +0.0        0.13 ± 24%  perf-profile.children.cycles-pp.ktime_get
      6.85            +0.0        6.86            -0.0        6.85        perf-profile.children.cycles-pp.shmem_write_begin
      4.19            +0.0        4.20            +0.1        4.29        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      1.62            +0.0        1.63            +0.0        1.62        perf-profile.children.cycles-pp.folio_mark_accessed
      2.66            +0.0        2.68            +0.0        2.67        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.31            +0.0        0.33            +0.1        0.38        perf-profile.children.cycles-pp.timestamp_truncate
      3.21            +0.0        3.24            +0.0        3.22        perf-profile.children.cycles-pp.mutex_unlock
     30.88            +0.0       30.93            -0.0       30.87        perf-profile.children.cycles-pp.generic_perform_write
     38.04            +0.0       38.08            -0.4       37.67        perf-profile.children.cycles-pp.shmem_file_write_iter
     12.32            +0.1       12.38            +0.0       12.32        perf-profile.children.cycles-pp.__fdget_pos
     11.44            +0.1       11.51            -0.0       11.43        perf-profile.children.cycles-pp.ksys_lseek
     48.12            +0.1       48.20            +0.1       48.26        perf-profile.children.cycles-pp.vfs_write
     57.55            +0.1       57.64            +0.2       57.72        perf-profile.children.cycles-pp.ksys_write
     29.12            +0.1       29.21            -0.1       29.06        perf-profile.children.cycles-pp.__libc_lseek64
     74.50            +0.2       74.66            +0.2       74.68        perf-profile.children.cycles-pp.do_syscall_64
     76.34            +0.2       76.52            +0.2       76.53        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.60            -0.1        2.51            -0.1        2.53        perf-profile.self.cycles-pp.__fsnotify_parent
      5.04            -0.1        4.98            -0.1        4.98        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50            -0.1        0.44            -0.0        0.46 ±  2%  perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      1.02            -0.0        0.97            -0.1        0.97        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.25 ±  3%      -0.0        0.22 ±  3%      -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.file_update_time
      2.15            -0.0        2.13            +0.0        2.18        perf-profile.self.cycles-pp.__cond_resched
      0.03 ±100%      -0.0        0.02 ±173%      +0.0        0.04 ± 79%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.15 ±  4%      -0.0        0.13 ±  5%      -0.0        0.13 ±  6%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      1.58            -0.0        1.56            -0.0        1.56        perf-profile.self.cycles-pp.up_write
      0.21 ±  3%      -0.0        0.20 ±  2%      +0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
      3.55            -0.0        3.54            -0.0        3.52        perf-profile.self.cycles-pp.mutex_lock
      0.59            -0.0        0.58            -0.0        0.59        perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      0.38            -0.0        0.37 ±  3%      -0.0        0.37 ±  3%  perf-profile.self.cycles-pp.intel_idle_xstate
      0.71            -0.0        0.70 ±  2%      -0.2        0.50        perf-profile.self.cycles-pp.generic_write_checks
      2.20            -0.0        2.19            -0.0        2.16        perf-profile.self.cycles-pp.shmem_write_end
      4.55            -0.0        4.55            -0.0        4.52        perf-profile.self.cycles-pp.__libc_lseek64
      2.22            -0.0        2.22            -0.0        2.22        perf-profile.self.cycles-pp.fput
      0.49            -0.0        0.48            -0.0        0.49        perf-profile.self.cycles-pp.generic_file_llseek_size
      0.71            -0.0        0.70            +0.0        0.71        perf-profile.self.cycles-pp.apparmor_file_permission
      0.41 ±  3%      -0.0        0.41 ±  2%      -0.0        0.40        perf-profile.self.cycles-pp.folio_mapping
      1.07            -0.0        1.06            +0.0        1.07        perf-profile.self.cycles-pp.ksys_write
      0.57            -0.0        0.57            +0.5        1.05        perf-profile.self.cycles-pp.rw_verify_area
      0.16 ±  2%      -0.0        0.16 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.noop_dirty_folio
      0.10 ±  9%      -0.0        0.10 ±  5%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.32 ±  2%      -0.0        0.32 ±  2%      -0.0        0.32        perf-profile.self.cycles-pp.amd_clear_divider
      0.05 ±  7%      -0.0        0.05            -0.0        0.04 ± 37%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.12 ±  4%      -0.0        0.12 ±  6%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.xas_start
      0.57            -0.0        0.56            -0.0        0.56        perf-profile.self.cycles-pp.shmem_file_llseek
      0.24 ±  3%      -0.0        0.24 ±  3%      +0.0        0.24        perf-profile.self.cycles-pp.inode_to_bdi
      0.41 ±  2%      -0.0        0.41            -0.0        0.40        perf-profile.self.cycles-pp.folio_mark_dirty
      0.08            +0.0        0.08            +0.0        0.08        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited
      0.06 ± 11%      +0.0        0.06 ±  7%      +0.0        0.07 ± 11%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.08 ±  4%      +0.0        0.08 ±  5%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.write@plt
      0.99            +0.0        0.99            -0.0        0.97        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      2.58            +0.0        2.58            -0.0        2.58        perf-profile.self.cycles-pp.do_syscall_64
      0.28 ±  2%      +0.0        0.28 ±  3%      -0.0        0.28 ±  4%  perf-profile.self.cycles-pp.intel_idle
      0.08            +0.0        0.08 ±  4%      +0.0        0.08        perf-profile.self.cycles-pp.lseek@plt
      0.16            +0.0        0.16 ±  2%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__f_unlock_pos
      0.33 ±  2%      +0.0        0.33 ±  2%      +0.1        0.39 ±  2%  perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      2.61            +0.0        2.62            +0.0        2.63        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.66            +0.0        0.66            -0.0        0.65        perf-profile.self.cycles-pp.shmem_write_begin
      1.06            +0.0        1.07            +0.0        1.07        perf-profile.self.cycles-pp.ksys_lseek
      0.14 ±  4%      +0.0        0.14 ±  3%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.xas_load
      1.18            +0.0        1.18            +0.0        1.18        perf-profile.self.cycles-pp.filemap_get_entry
      0.69            +0.0        0.69            +0.0        0.71        perf-profile.self.cycles-pp.security_file_permission
      0.48            +0.0        0.49            -0.0        0.48        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      2.02            +0.0        2.02            -0.0        2.01        perf-profile.self.cycles-pp.generic_perform_write
      1.54            +0.0        1.54            -0.0        1.54        perf-profile.self.cycles-pp.folio_unlock
     11.68            +0.0       11.68            -0.0       11.63        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.29 ±  2%      +0.0        0.29            +0.0        0.30 ±  2%  perf-profile.self.cycles-pp.timestamp_truncate
      0.23 ±  2%      +0.0        0.24 ±  2%      -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_lseek
      0.48            +0.0        0.49            -0.0        0.48        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      1.38            +0.0        1.38            -0.1        1.31        perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.0        0.01 ±264%      +0.0        0.01 ±173%  perf-profile.self.cycles-pp.file_remove_privs
      1.25            +0.0        1.26            +0.0        1.29        perf-profile.self.cycles-pp.testcase
      3.76            +0.0        3.77            +0.0        3.80        perf-profile.self.cycles-pp.fault_in_readable
      0.43 ±  2%      +0.0        0.44 ±  2%      -0.0        0.38 ±  2%  perf-profile.self.cycles-pp.aa_file_perm
      0.29            +0.0        0.30 ±  3%      -0.0        0.29 ±  2%  perf-profile.self.cycles-pp.generic_write_check_limits
      0.01 ±223%      +0.0        0.02 ±129%      +0.0        0.02 ±129%  perf-profile.self.cycles-pp._raw_spin_trylock
      1.53            +0.0        1.54            +0.0        1.54        perf-profile.self.cycles-pp.folio_mark_accessed
      2.60            +0.0        2.61            -0.0        2.58        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.30 ±  3%      +0.0        0.32 ±  2%      +0.1        0.38 ±  2%  perf-profile.self.cycles-pp.__file_remove_privs
      2.00            +0.0        2.02            +0.0        2.01        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.54            +0.0        1.55            +0.1        1.68        perf-profile.self.cycles-pp.down_write
      5.37            +0.0        5.39            -0.0        5.36        perf-profile.self.cycles-pp.__libc_write
      1.60            +0.0        1.62            +0.0        1.61        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.06 ± 78%      +0.0        0.08 ± 53%      +0.0        0.11 ± 27%  perf-profile.self.cycles-pp.ktime_get
      0.47            +0.0        0.49 ±  2%      +0.0        0.50        perf-profile.self.cycles-pp.inode_needs_update_time
      1.02            +0.0        1.05            -0.3        0.72        perf-profile.self.cycles-pp.shmem_file_write_iter
      3.04            +0.0        3.07            +0.0        3.05        perf-profile.self.cycles-pp.mutex_unlock
      7.28            +0.1        7.35 ±  2%      +0.0        7.32        perf-profile.self.cycles-pp.__fdget_pos
      4.49            +0.1        4.63            +0.1        4.60        perf-profile.self.cycles-pp.vfs_write
      2966 ±  6%     -10.2%       2664 ± 12%     -13.2%       2575 ±  8%  slabinfo.Acpi-State.active_objs
     58.17 ±  6%     -10.2%      52.25 ± 12%     -13.2%      50.50 ±  8%  slabinfo.Acpi-State.active_slabs
      2966 ±  6%     -10.2%       2664 ± 12%     -13.2%       2575 ±  8%  slabinfo.Acpi-State.num_objs
     58.17 ±  6%     -10.2%      52.25 ± 12%     -13.2%      50.50 ±  8%  slabinfo.Acpi-State.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.DCCP.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.DCCP.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.DCCP.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.DCCP.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.DCCPv6.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.DCCPv6.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.DCCPv6.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.DCCPv6.num_slabs
      2101 ± 11%      +6.7%       2243 ±  9%      +9.7%       2306 ±  6%  slabinfo.PING.active_objs
     65.68 ± 11%      +6.7%      70.11 ±  9%      +9.7%      72.06 ±  6%  slabinfo.PING.active_slabs
      2101 ± 11%      +6.7%       2243 ±  9%      +9.7%       2306 ±  6%  slabinfo.PING.num_objs
     65.68 ± 11%      +6.7%      70.11 ±  9%      +9.7%      72.06 ±  6%  slabinfo.PING.num_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        slabinfo.RAW.active_objs
     14.00            +0.0%      14.00            +0.0%      14.00        slabinfo.RAW.active_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        slabinfo.RAW.num_objs
     14.00            +0.0%      14.00            +0.0%      14.00        slabinfo.RAW.num_slabs
    281.67 ±  3%      -4.2%     269.75 ±  4%      -0.8%     279.50 ±  4%  slabinfo.RAWv6.active_objs
     10.83 ±  3%      -4.2%      10.38 ±  4%      -0.8%      10.75 ±  4%  slabinfo.RAWv6.active_slabs
    281.67 ±  3%      -4.2%     269.75 ±  4%      -0.8%     279.50 ±  4%  slabinfo.RAWv6.num_objs
     10.83 ±  3%      -4.2%      10.38 ±  4%      -0.8%      10.75 ±  4%  slabinfo.RAWv6.num_slabs
     52.03            -3.1%      50.42 ±  8%      -3.1%      50.42 ±  8%  slabinfo.TCP.active_objs
      4.00            -3.1%       3.88 ±  8%      -3.1%       3.88 ±  8%  slabinfo.TCP.active_slabs
     52.03            -3.1%      50.42 ±  8%      -3.1%      50.42 ±  8%  slabinfo.TCP.num_objs
      4.00            -3.1%       3.88 ±  8%      -3.1%       3.88 ±  8%  slabinfo.TCP.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.TCPv6.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.TCPv6.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.TCPv6.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.TCPv6.num_slabs
    108.00 ± 11%      +8.3%     117.00 ±  6%      +5.6%     114.00 ±  9%  slabinfo.UDPv6.active_objs
      4.50 ± 11%      +8.3%       4.88 ±  6%      +5.6%       4.75 ±  9%  slabinfo.UDPv6.active_slabs
    108.00 ± 11%      +8.3%     117.00 ±  6%      +5.6%     114.00 ±  9%  slabinfo.UDPv6.num_objs
      4.50 ± 11%      +8.3%       4.88 ±  6%      +5.6%       4.75 ±  9%  slabinfo.UDPv6.num_slabs
     31961 ±  4%      +3.5%      33079 ±  3%      +4.6%      33433 ±  3%  slabinfo.anon_vma.active_objs
    823.09 ±  4%      +3.5%     851.76 ±  3%      +4.6%     860.87 ±  3%  slabinfo.anon_vma.active_slabs
     32100 ±  4%      +3.5%      33218 ±  3%      +4.6%      33573 ±  3%  slabinfo.anon_vma.num_objs
    823.09 ±  4%      +3.5%     851.76 ±  3%      +4.6%     860.87 ±  3%  slabinfo.anon_vma.num_slabs
     45057 ±  2%      -1.9%      44212            -1.0%      44589 ±  2%  slabinfo.anon_vma_chain.active_objs
    709.72 ±  2%      -1.9%     696.56            -1.1%     701.87 ±  2%  slabinfo.anon_vma_chain.active_slabs
     45422 ±  2%      -1.9%      44579            -1.1%      44919 ±  2%  slabinfo.anon_vma_chain.num_objs
    709.72 ±  2%      -1.9%     696.56            -1.1%     701.87 ±  2%  slabinfo.anon_vma_chain.num_slabs
     73.33 ± 12%      -1.1%      72.50 ± 13%      +2.3%      75.00 ± 17%  slabinfo.bdev_cache.active_objs
      3.67 ± 12%      -1.1%       3.62 ± 13%      +2.3%       3.75 ± 17%  slabinfo.bdev_cache.active_slabs
     73.33 ± 12%      -1.1%      72.50 ± 13%      +2.3%      75.00 ± 17%  slabinfo.bdev_cache.num_objs
      3.67 ± 12%      -1.1%       3.62 ± 13%      +2.3%       3.75 ± 17%  slabinfo.bdev_cache.num_slabs
    480.00 ±  6%      -3.3%     464.00 ±  5%      -6.7%     448.00        slabinfo.bio-120.active_objs
      7.50 ±  6%      -3.3%       7.25 ±  5%      -6.7%       7.00        slabinfo.bio-120.active_slabs
    480.00 ±  6%      -3.3%     464.00 ±  5%      -6.7%     448.00        slabinfo.bio-120.num_objs
      7.50 ±  6%      -3.3%       7.25 ±  5%      -6.7%       7.00        slabinfo.bio-120.num_slabs
    525.00 ± 13%      -5.0%     498.75 ± 11%      -1.0%     519.75 ± 10%  slabinfo.bio-184.active_objs
     12.50 ± 13%      -5.0%      11.88 ± 11%      -1.0%      12.38 ± 10%  slabinfo.bio-184.active_slabs
    525.00 ± 13%      -5.0%     498.75 ± 11%      -1.0%     519.75 ± 10%  slabinfo.bio-184.num_objs
     12.50 ± 13%      -5.0%      11.88 ± 11%      -1.0%      12.38 ± 10%  slabinfo.bio-184.num_slabs
    128.00            -6.2%     120.00 ± 17%      +0.0%     128.00        slabinfo.bio-248.active_objs
      2.00            -6.2%       1.88 ± 17%      +0.0%       2.00        slabinfo.bio-248.active_slabs
    128.00            -6.2%     120.00 ± 17%      +0.0%     128.00        slabinfo.bio-248.num_objs
      2.00            -6.2%       1.88 ± 17%      +0.0%       2.00        slabinfo.bio-248.num_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        slabinfo.bio-296.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-296.active_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        slabinfo.bio-296.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-296.num_slabs
    133.00 ± 11%      -5.3%     126.00            +2.6%     136.50 ± 13%  slabinfo.bio-360.active_objs
      3.17 ± 11%      -5.3%       3.00            +2.6%       3.25 ± 13%  slabinfo.bio-360.active_slabs
    133.00 ± 11%      -5.3%     126.00            +2.6%     136.50 ± 13%  slabinfo.bio-360.num_objs
      3.17 ± 11%      -5.3%       3.00            +2.6%       3.25 ± 13%  slabinfo.bio-360.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        slabinfo.bio-376.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-376.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        slabinfo.bio-376.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-376.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.bio-432.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-432.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.bio-432.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-432.num_slabs
    170.00            +0.0%     170.00            +0.0%     170.00        slabinfo.bio_post_read_ctx.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.bio_post_read_ctx.active_slabs
    170.00            +0.0%     170.00            +0.0%     170.00        slabinfo.bio_post_read_ctx.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.bio_post_read_ctx.num_slabs
     37.33 ± 31%      -3.6%      36.00 ± 19%      +1.8%      38.00 ± 20%  slabinfo.biovec-128.active_objs
      2.33 ± 31%      -3.6%       2.25 ± 19%      +1.8%       2.38 ± 20%  slabinfo.biovec-128.active_slabs
     37.33 ± 31%      -3.6%      36.00 ± 19%      +1.8%      38.00 ± 20%  slabinfo.biovec-128.num_objs
      2.33 ± 31%      -3.6%       2.25 ± 19%      +1.8%       2.38 ± 20%  slabinfo.biovec-128.num_slabs
    309.33 ± 11%      -4.3%     296.00 ±  8%      -9.5%     280.00 ± 11%  slabinfo.biovec-64.active_objs
      9.67 ± 11%      -4.3%       9.25 ±  8%      -9.5%       8.75 ± 11%  slabinfo.biovec-64.active_slabs
    309.33 ± 11%      -4.3%     296.00 ±  8%      -9.5%     280.00 ± 11%  slabinfo.biovec-64.num_objs
      9.67 ± 11%      -4.3%       9.25 ±  8%      -9.5%       8.75 ± 11%  slabinfo.biovec-64.num_slabs
     57.33 ±  5%      -2.3%      56.00            -2.3%      56.00        slabinfo.biovec-max.active_objs
      7.17 ±  5%      -2.3%       7.00            -2.3%       7.00        slabinfo.biovec-max.active_slabs
     57.33 ±  5%      -2.3%      56.00            -2.3%      56.00        slabinfo.biovec-max.num_objs
      7.17 ±  5%      -2.3%       7.00            -2.3%       7.00        slabinfo.biovec-max.num_slabs
    147.33 ± 17%      -7.7%     136.00            +3.8%     153.00 ± 19%  slabinfo.btrfs_extent_buffer.active_objs
      2.17 ± 17%      -7.7%       2.00            +3.8%       2.25 ± 19%  slabinfo.btrfs_extent_buffer.active_slabs
    147.33 ± 17%      -7.7%     136.00            +3.8%     153.00 ± 19%  slabinfo.btrfs_extent_buffer.num_objs
      2.17 ± 17%      -7.7%       2.00            +3.8%       2.25 ± 19%  slabinfo.btrfs_extent_buffer.num_slabs
      0.00       +1.5e+103%      14.62 ±129%   +2e+103%      19.50 ±100%  slabinfo.btrfs_free_space.active_objs
      0.00       +3.8e+101%       0.38 ±129%   +5e+101%       0.50 ±100%  slabinfo.btrfs_free_space.active_slabs
      0.00       +1.5e+103%      14.62 ±129%   +2e+103%      19.50 ±100%  slabinfo.btrfs_free_space.num_objs
      0.00       +3.8e+101%       0.38 ±129%   +5e+101%       0.50 ±100%  slabinfo.btrfs_free_space.num_slabs
    105.00 ± 14%      -7.1%      97.50 ± 13%      +3.6%     108.75 ± 13%  slabinfo.btrfs_inode.active_objs
      3.50 ± 14%      -7.1%       3.25 ± 13%      +3.6%       3.62 ± 13%  slabinfo.btrfs_inode.active_slabs
    105.00 ± 14%      -7.1%      97.50 ± 13%      +3.6%     108.75 ± 13%  slabinfo.btrfs_inode.num_objs
      3.50 ± 14%      -7.1%       3.25 ± 13%      +3.6%       3.62 ± 13%  slabinfo.btrfs_inode.num_slabs
    239.81 ± 16%     -10.0%     215.89            -8.1%     220.39 ±  5%  slabinfo.btrfs_path.active_objs
      6.66 ± 16%     -10.0%       6.00            -8.1%       6.12 ±  5%  slabinfo.btrfs_path.active_slabs
    239.81 ± 16%     -10.0%     215.89            -8.1%     220.39 ±  5%  slabinfo.btrfs_path.num_objs
      6.66 ± 16%     -10.0%       6.00            -8.1%       6.12 ±  5%  slabinfo.btrfs_path.num_slabs
    175.50 ± 16%      -8.3%     160.88 ±  8%      +2.8%     180.38 ± 10%  slabinfo.buffer_head.active_objs
      4.50 ± 16%      -8.3%       4.12 ±  8%      +2.8%       4.62 ± 10%  slabinfo.buffer_head.active_slabs
    175.50 ± 16%      -8.3%     160.88 ±  8%      +2.8%     180.38 ± 10%  slabinfo.buffer_head.num_objs
      4.50 ± 16%      -8.3%       4.12 ±  8%      +2.8%       4.62 ± 10%  slabinfo.buffer_head.num_slabs
     76.67 ± 28%     -10.0%      69.00 ± 33%      -2.5%      74.75 ± 29%  slabinfo.configfs_dir_cache.active_objs
      1.67 ± 28%     -10.0%       1.50 ± 33%      -2.5%       1.62 ± 29%  slabinfo.configfs_dir_cache.active_slabs
     76.67 ± 28%     -10.0%      69.00 ± 33%      -2.5%      74.75 ± 29%  slabinfo.configfs_dir_cache.num_objs
      1.67 ± 28%     -10.0%       1.50 ± 33%      -2.5%       1.62 ± 29%  slabinfo.configfs_dir_cache.num_slabs
     13728 ±  2%      -0.9%      13600 ±  2%      -0.6%      13648 ±  2%  slabinfo.cred_jar.active_objs
    326.87 ±  2%      -0.9%     323.82 ±  2%      -0.6%     324.96 ±  2%  slabinfo.cred_jar.active_slabs
     13728 ±  2%      -0.9%      13600 ±  2%      -0.6%      13648 ±  2%  slabinfo.cred_jar.num_objs
    326.87 ±  2%      -0.9%     323.82 ±  2%      -0.6%     324.96 ±  2%  slabinfo.cred_jar.num_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dax_cache.active_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
    165380            +0.2%     165746            +0.2%     165661        slabinfo.dentry.active_objs
      4024            +0.4%       4039            -0.1%       4021        slabinfo.dentry.active_slabs
    169034            +0.4%     169671            -0.1%     168898        slabinfo.dentry.num_objs
      4024            +0.4%       4039            -0.1%       4021        slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.num_slabs
    453.19 ±  6%      +6.0%     480.57 ± 11%     +10.0%     498.60 ±  9%  slabinfo.dmaengine-unmap-16.active_objs
     10.79 ±  6%      +6.0%      11.44 ± 11%     +10.0%      11.87 ±  9%  slabinfo.dmaengine-unmap-16.active_slabs
    453.19 ±  6%      +6.0%     480.57 ± 11%     +10.0%     498.60 ±  9%  slabinfo.dmaengine-unmap-16.num_objs
     10.79 ±  6%      +6.0%      11.44 ± 11%     +10.0%      11.87 ±  9%  slabinfo.dmaengine-unmap-16.num_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.dmaengine-unmap-2.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-2.active_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.dmaengine-unmap-2.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-2.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.num_slabs
     25077 ±  5%      -2.5%      24451 ± 10%      -4.7%      23888 ± 10%  slabinfo.ep_head.active_objs
     97.96 ±  5%      -2.5%      95.51 ± 10%      -4.7%      93.31 ± 10%  slabinfo.ep_head.active_slabs
     25077 ±  5%      -2.5%      24451 ± 10%      -4.7%      23888 ± 10%  slabinfo.ep_head.num_objs
     97.96 ±  5%      -2.5%      95.51 ± 10%      -4.7%      93.31 ± 10%  slabinfo.ep_head.num_slabs
    721.36 ±  7%      +0.0%     721.46 ±  7%      +5.0%     757.58 ±  7%  slabinfo.file_lock_cache.active_objs
     19.50 ±  7%      +0.0%      19.50 ±  7%      +5.0%      20.48 ±  7%  slabinfo.file_lock_cache.active_slabs
    721.36 ±  7%      +0.0%     721.46 ±  7%      +5.0%     757.58 ±  7%  slabinfo.file_lock_cache.num_objs
     19.50 ±  7%      +0.0%      19.50 ±  7%      +5.0%      20.48 ±  7%  slabinfo.file_lock_cache.num_slabs
      9587 ±  2%      -1.9%       9410            -1.2%       9472        slabinfo.files_cache.active_objs
    208.43 ±  2%      -1.9%     204.57            -1.2%     205.92        slabinfo.files_cache.active_slabs
      9587 ±  2%      -1.9%       9410            -1.2%       9472        slabinfo.files_cache.num_objs
    208.43 ±  2%      -1.9%     204.57            -1.2%     205.92        slabinfo.files_cache.num_slabs
     19873            +1.3%      20135            -0.1%      19863        slabinfo.filp.active_objs
    317.02            +1.3%     321.28            +0.1%     317.38        slabinfo.filp.active_slabs
     20289            +1.3%      20561            +0.1%      20312        slabinfo.filp.num_objs
    317.02            +1.3%     321.28            +0.1%     317.38        slabinfo.filp.num_slabs
      9392 ±  3%      -1.9%       9216 ±  4%      -3.3%       9079 ±  3%  slabinfo.ftrace_event_field.active_objs
    128.67 ±  3%      -1.9%     126.25 ±  4%      -3.3%     124.38 ±  3%  slabinfo.ftrace_event_field.active_slabs
      9392 ±  3%      -1.9%       9216 ±  4%      -3.3%       9079 ±  3%  slabinfo.ftrace_event_field.num_objs
    128.67 ±  3%      -1.9%     126.25 ±  4%      -3.3%     124.38 ±  3%  slabinfo.ftrace_event_field.num_slabs
    102.00            +0.0%     102.00            +0.0%     102.00        slabinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cache.active_slabs
    102.00            +0.0%     102.00            +0.0%     102.00        slabinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cache.num_slabs
    108078            +0.0%     108114            -0.1%     107987        slabinfo.inode_cache.active_objs
      2121            +0.0%       2122            -0.1%       2120        slabinfo.inode_cache.active_slabs
    108217            +0.0%     108266            -0.1%     108150        slabinfo.inode_cache.num_objs
      2121            +0.0%       2122            -0.1%       2120        slabinfo.inode_cache.num_slabs
    194.67 ± 17%      -1.6%     191.62 ± 18%      -1.6%     191.62 ± 18%  slabinfo.ip_fib_alias.active_objs
      2.67 ± 17%      -1.6%       2.62 ± 18%      -1.6%       2.62 ± 18%  slabinfo.ip_fib_alias.active_slabs
    194.67 ± 17%      -1.6%     191.62 ± 18%      -1.6%     191.62 ± 18%  slabinfo.ip_fib_alias.num_objs
      2.67 ± 17%      -1.6%       2.62 ± 18%      -1.6%       2.62 ± 18%  slabinfo.ip_fib_alias.num_slabs
    226.67 ± 17%      -1.6%     223.12 ± 18%      -1.6%     223.12 ± 18%  slabinfo.ip_fib_trie.active_objs
      2.67 ± 17%      -1.6%       2.62 ± 18%      -1.6%       2.62 ± 18%  slabinfo.ip_fib_trie.active_slabs
    226.67 ± 17%      -1.6%     223.12 ± 18%      -1.6%     223.12 ± 18%  slabinfo.ip_fib_trie.num_objs
      2.67 ± 17%      -1.6%       2.62 ± 18%      -1.6%       2.62 ± 18%  slabinfo.ip_fib_trie.num_slabs
    169310            -0.1%     169112            -0.2%     169056        slabinfo.kernfs_node_cache.active_objs
      2645            -0.1%       2642            -0.2%       2641        slabinfo.kernfs_node_cache.active_slabs
    169312            -0.1%     169112            -0.2%     169056        slabinfo.kernfs_node_cache.num_objs
      2645            -0.1%       2642            -0.2%       2641        slabinfo.kernfs_node_cache.num_slabs
     13876 ±  3%      -2.1%      13590            -0.4%      13821 ±  2%  slabinfo.khugepaged_mm_slot.active_objs
    136.04 ±  3%      -2.1%     133.24            -0.4%     135.50 ±  2%  slabinfo.khugepaged_mm_slot.active_slabs
     13876 ±  3%      -2.1%      13590            -0.4%      13821 ±  2%  slabinfo.khugepaged_mm_slot.num_objs
    136.04 ±  3%      -2.1%     133.24            -0.4%     135.50 ±  2%  slabinfo.khugepaged_mm_slot.num_slabs
     21913            +0.4%      22000            +0.5%      22017        slabinfo.kmalloc-128.active_objs
    342.40            +0.4%     343.76            +0.5%     344.03        slabinfo.kmalloc-128.active_slabs
     21913            +0.4%      22000            +0.5%      22017        slabinfo.kmalloc-128.num_objs
    342.40            +0.4%     343.76            +0.5%     344.03        slabinfo.kmalloc-128.num_slabs
     82195            -0.6%      81708            -0.4%      81872        slabinfo.kmalloc-16.active_objs
    322.81            -0.5%     321.06            -0.3%     321.88        slabinfo.kmalloc-16.active_slabs
     82638            -0.5%      82192            -0.3%      82401        slabinfo.kmalloc-16.num_objs
    322.81            -0.5%     321.06            -0.3%     321.88        slabinfo.kmalloc-16.num_slabs
     21032            +0.2%      21067            -0.4%      20946        slabinfo.kmalloc-192.active_objs
    507.38            +0.0%     507.53            -0.3%     505.77        slabinfo.kmalloc-192.active_slabs
     21309            +0.0%      21316            -0.3%      21242        slabinfo.kmalloc-192.num_objs
    507.38            +0.0%     507.53            -0.3%     505.77        slabinfo.kmalloc-192.num_slabs
      9809            +0.1%       9823            +0.1%       9821        slabinfo.kmalloc-1k.active_objs
    307.50            +0.1%     307.75            +0.0%     307.59        slabinfo.kmalloc-1k.active_slabs
      9839            +0.1%       9847            +0.0%       9842        slabinfo.kmalloc-1k.num_objs
    307.50            +0.1%     307.75            +0.0%     307.59        slabinfo.kmalloc-1k.num_slabs
     19574            +0.5%      19664            +0.2%      19617        slabinfo.kmalloc-256.active_objs
    306.33            +0.4%     307.50            +0.1%     306.71        slabinfo.kmalloc-256.active_slabs
     19605            +0.4%      19679            +0.1%      19629        slabinfo.kmalloc-256.num_objs
    306.33            +0.4%     307.50            +0.1%     306.71        slabinfo.kmalloc-256.num_slabs
      8370            -0.5%       8330            -0.6%       8318        slabinfo.kmalloc-2k.active_objs
    531.88            -0.3%     530.19            -0.5%     529.23        slabinfo.kmalloc-2k.active_slabs
      8510            -0.3%       8483            -0.5%       8467        slabinfo.kmalloc-2k.num_objs
    531.88            -0.3%     530.19            -0.5%     529.23        slabinfo.kmalloc-2k.num_slabs
    172788            -0.1%     172581            -0.0%     172741        slabinfo.kmalloc-32.active_objs
      1350            -0.1%       1349            +0.0%       1350        slabinfo.kmalloc-32.active_slabs
    172885            -0.1%     172767            +0.0%     172923        slabinfo.kmalloc-32.num_objs
      1350            -0.1%       1349            +0.0%       1350        slabinfo.kmalloc-32.num_slabs
      3013            -0.5%       2999            -0.2%       3005        slabinfo.kmalloc-4k.active_objs
    383.57            -0.3%     382.31            -0.1%     383.03        slabinfo.kmalloc-4k.active_slabs
      3068            -0.3%       3058            -0.1%       3064        slabinfo.kmalloc-4k.num_objs
    383.57            -0.3%     382.31            -0.1%     383.03        slabinfo.kmalloc-4k.num_slabs
     31318            -0.7%      31114            -0.5%      31156        slabinfo.kmalloc-512.active_objs
    492.25            -0.4%     490.22            -0.3%     490.92        slabinfo.kmalloc-512.active_slabs
     31503            -0.4%      31373            -0.3%      31418        slabinfo.kmalloc-512.num_objs
    492.25            -0.4%     490.22            -0.3%     490.92        slabinfo.kmalloc-512.num_slabs
    174795            -0.1%     174612            -0.1%     174705        slabinfo.kmalloc-64.active_objs
      2731            -0.1%       2729            -0.0%       2730        slabinfo.kmalloc-64.active_slabs
    174834            -0.1%     174687            -0.0%     174756        slabinfo.kmalloc-64.num_objs
      2731            -0.1%       2729            -0.0%       2730        slabinfo.kmalloc-64.num_slabs
    122112            +0.2%     122303            +0.1%     122175        slabinfo.kmalloc-8.active_objs
    238.50            +0.2%     238.88            +0.1%     238.62        slabinfo.kmalloc-8.active_slabs
    122112            +0.2%     122304            +0.1%     122176        slabinfo.kmalloc-8.num_objs
    238.50            +0.2%     238.88            +0.1%     238.62        slabinfo.kmalloc-8.num_slabs
      1296            -0.0%       1296            -0.1%       1296        slabinfo.kmalloc-8k.active_objs
    331.50            -0.0%     331.47            -0.1%     331.31        slabinfo.kmalloc-8k.active_slabs
      1326            -0.0%       1325            -0.1%       1325        slabinfo.kmalloc-8k.num_objs
    331.50            -0.0%     331.47            -0.1%     331.31        slabinfo.kmalloc-8k.num_slabs
     25272 ±  2%      -1.6%      24870 ±  2%      -1.7%      24845 ±  4%  slabinfo.kmalloc-96.active_objs
    617.96 ±  2%      -1.8%     607.05 ±  2%      -1.7%     607.64 ±  4%  slabinfo.kmalloc-96.active_slabs
     25954 ±  2%      -1.8%      25496 ±  2%      -1.7%      25520 ±  4%  slabinfo.kmalloc-96.num_objs
    617.96 ±  2%      -1.8%     607.05 ±  2%      -1.7%     607.64 ±  4%  slabinfo.kmalloc-96.num_slabs
      1813 ±  3%      -2.9%       1760 ±  4%      +0.6%       1824 ±  5%  slabinfo.kmalloc-cg-128.active_objs
     28.33 ±  3%      -2.9%      27.50 ±  4%      +0.6%      28.50 ±  5%  slabinfo.kmalloc-cg-128.active_slabs
      1813 ±  3%      -2.9%       1760 ±  4%      +0.6%       1824 ±  5%  slabinfo.kmalloc-cg-128.num_objs
     28.33 ±  3%      -2.9%      27.50 ±  4%      +0.6%      28.50 ±  5%  slabinfo.kmalloc-cg-128.num_slabs
      4430 ±  3%      -1.7%       4356 ±  6%      -5.5%       4188 ±  7%  slabinfo.kmalloc-cg-16.active_objs
     17.31 ±  3%      -1.7%      17.02 ±  6%      -5.5%      16.36 ±  7%  slabinfo.kmalloc-cg-16.active_slabs
      4430 ±  3%      -1.7%       4356 ±  6%      -5.5%       4188 ±  7%  slabinfo.kmalloc-cg-16.num_objs
     17.31 ±  3%      -1.7%      17.02 ±  6%      -5.5%      16.36 ±  7%  slabinfo.kmalloc-cg-16.num_slabs
      8852 ±  3%      -3.9%       8507 ±  2%      -1.5%       8715        slabinfo.kmalloc-cg-192.active_objs
    210.77 ±  3%      -3.9%     202.55 ±  2%      -1.5%     207.51        slabinfo.kmalloc-cg-192.active_slabs
      8852 ±  3%      -3.9%       8507 ±  2%      -1.5%       8715        slabinfo.kmalloc-cg-192.num_objs
    210.77 ±  3%      -3.9%     202.55 ±  2%      -1.5%     207.51        slabinfo.kmalloc-cg-192.num_slabs
      6697 ±  2%      -4.9%       6370 ±  2%      -2.7%       6519 ±  2%  slabinfo.kmalloc-cg-1k.active_objs
    209.31 ±  2%      -4.9%     199.08 ±  2%      -2.7%     203.74 ±  2%  slabinfo.kmalloc-cg-1k.active_slabs
      6697 ±  2%      -4.9%       6370 ±  2%      -2.7%       6519 ±  2%  slabinfo.kmalloc-cg-1k.num_objs
    209.31 ±  2%      -4.9%     199.08 ±  2%      -2.7%     203.74 ±  2%  slabinfo.kmalloc-cg-1k.num_slabs
      1365 ±  3%      +1.9%       1392 ±  4%      +0.8%       1376 ±  2%  slabinfo.kmalloc-cg-256.active_objs
     21.50 ±  4%      +1.2%      21.75 ±  4%      +0.0%      21.50 ±  2%  slabinfo.kmalloc-cg-256.active_slabs
      1376 ±  4%      +1.2%       1392 ±  4%      +0.0%       1376 ±  2%  slabinfo.kmalloc-cg-256.num_objs
     21.50 ±  4%      +1.2%      21.75 ±  4%      +0.0%      21.50 ±  2%  slabinfo.kmalloc-cg-256.num_slabs
      1039 ±  4%      -4.0%     998.06 ±  4%      -5.1%     986.93 ±  4%  slabinfo.kmalloc-cg-2k.active_objs
     64.98 ±  4%      -4.0%      62.38 ±  4%      -5.1%      61.68 ±  4%  slabinfo.kmalloc-cg-2k.active_slabs
      1039 ±  4%      -4.0%     998.06 ±  4%      -5.1%     986.93 ±  4%  slabinfo.kmalloc-cg-2k.num_objs
     64.98 ±  4%      -4.0%      62.38 ±  4%      -5.1%      61.68 ±  4%  slabinfo.kmalloc-cg-2k.num_slabs
     26783 ±  3%      +1.0%      27054 ±  2%      +3.2%      27653 ±  2%  slabinfo.kmalloc-cg-32.active_objs
    209.24 ±  3%      +1.0%     211.36 ±  2%      +3.2%     216.04 ±  2%  slabinfo.kmalloc-cg-32.active_slabs
     26783 ±  3%      +1.0%      27054 ±  2%      +3.2%      27653 ±  2%  slabinfo.kmalloc-cg-32.num_objs
    209.24 ±  3%      +1.0%     211.36 ±  2%      +3.2%     216.04 ±  2%  slabinfo.kmalloc-cg-32.num_slabs
      2344            -0.0%       2344            -0.1%       2343        slabinfo.kmalloc-cg-4k.active_objs
    303.45            -0.4%     302.19            +0.0%     303.51        slabinfo.kmalloc-cg-4k.active_slabs
      2427            -0.4%       2417            +0.0%       2428        slabinfo.kmalloc-cg-4k.num_objs
    303.45            -0.4%     302.19            +0.0%     303.51        slabinfo.kmalloc-cg-4k.num_slabs
     14432            +0.1%      14440            -0.1%      14423        slabinfo.kmalloc-cg-512.active_objs
    225.50            +0.1%     225.62            -0.1%     225.37        slabinfo.kmalloc-cg-512.active_slabs
     14432            +0.1%      14440            -0.1%      14423        slabinfo.kmalloc-cg-512.num_objs
    225.50            +0.1%     225.62            -0.1%     225.37        slabinfo.kmalloc-cg-512.num_slabs
      3126 ±  4%      -3.4%       3019 ±  6%      -5.7%       2947 ±  4%  slabinfo.kmalloc-cg-64.active_objs
     48.85 ±  4%      -3.4%      47.17 ±  6%      -5.7%      46.06 ±  4%  slabinfo.kmalloc-cg-64.active_slabs
      3126 ±  4%      -3.4%       3019 ±  6%      -5.7%       2947 ±  4%  slabinfo.kmalloc-cg-64.num_objs
     48.85 ±  4%      -3.4%      47.17 ±  6%      -5.7%      46.06 ±  4%  slabinfo.kmalloc-cg-64.num_slabs
    115460            +0.1%     115574            +0.3%     115804        slabinfo.kmalloc-cg-8.active_objs
    225.51            +0.1%     225.73            +0.3%     226.18        slabinfo.kmalloc-cg-8.active_slabs
    115460            +0.1%     115574            +0.3%     115804        slabinfo.kmalloc-cg-8.num_objs
    225.51            +0.1%     225.73            +0.3%     226.18        slabinfo.kmalloc-cg-8.num_slabs
     59.53            -0.2%      59.40            -2.7%      57.93 ±  3%  slabinfo.kmalloc-cg-8k.active_objs
     14.88            -0.2%      14.85            -2.7%      14.48 ±  3%  slabinfo.kmalloc-cg-8k.active_slabs
     59.53            -0.2%      59.40            -2.7%      57.93 ±  3%  slabinfo.kmalloc-cg-8k.num_objs
     14.88            -0.2%      14.85            -2.7%      14.48 ±  3%  slabinfo.kmalloc-cg-8k.num_slabs
      1925 ±  4%      -4.9%       1830 ±  3%      -3.3%       1863 ±  5%  slabinfo.kmalloc-cg-96.active_objs
     45.85 ±  4%      -4.9%      43.59 ±  3%      -3.3%      44.36 ±  5%  slabinfo.kmalloc-cg-96.active_slabs
      1925 ±  4%      -4.9%       1830 ±  3%      -3.3%       1863 ±  5%  slabinfo.kmalloc-cg-96.num_objs
     45.85 ±  4%      -4.9%      43.59 ±  3%      -3.3%      44.36 ±  5%  slabinfo.kmalloc-cg-96.num_slabs
    309.33 ±  7%     +13.8%     352.00 ± 12%     +13.8%     352.00 ±  9%  slabinfo.kmalloc-rcl-128.active_objs
      4.83 ±  7%     +13.8%       5.50 ± 12%     +13.8%       5.50 ±  9%  slabinfo.kmalloc-rcl-128.active_slabs
    309.33 ±  7%     +13.8%     352.00 ± 12%     +13.8%     352.00 ±  9%  slabinfo.kmalloc-rcl-128.num_objs
      4.83 ±  7%     +13.8%       5.50 ± 12%     +13.8%       5.50 ±  9%  slabinfo.kmalloc-rcl-128.num_slabs
      3104 ±  4%      -3.4%       3000 ±  4%      -8.5%       2840 ±  3%  slabinfo.kmalloc-rcl-64.active_objs
     48.50 ±  4%      -3.4%      46.88 ±  4%      -8.5%      44.38 ±  3%  slabinfo.kmalloc-rcl-64.active_slabs
      3104 ±  4%      -3.4%       3000 ±  4%      -8.5%       2840 ±  3%  slabinfo.kmalloc-rcl-64.num_objs
     48.50 ±  4%      -3.4%      46.88 ±  4%      -8.5%      44.38 ±  3%  slabinfo.kmalloc-rcl-64.num_slabs
      1372 ±  8%      -5.5%       1296 ±  3%      -8.9%       1249 ±  4%  slabinfo.kmalloc-rcl-96.active_objs
     32.67 ±  8%      -5.5%      30.88 ±  3%      -8.9%      29.75 ±  4%  slabinfo.kmalloc-rcl-96.active_slabs
      1372 ±  8%      -5.5%       1296 ±  3%      -8.9%       1249 ±  4%  slabinfo.kmalloc-rcl-96.num_objs
     32.67 ±  8%      -5.5%      30.88 ±  3%      -8.9%      29.75 ±  4%  slabinfo.kmalloc-rcl-96.num_slabs
      1013 ±  4%      -0.5%       1008 ± 10%     +11.3%       1128 ±  7%  slabinfo.kmem_cache.active_objs
     15.83 ±  4%      -0.5%      15.75 ± 10%     +11.3%      17.62 ±  7%  slabinfo.kmem_cache.active_slabs
      1013 ±  4%      -0.5%       1008 ± 10%     +11.3%       1128 ±  7%  slabinfo.kmem_cache.num_objs
     15.83 ±  4%      -0.5%      15.75 ± 10%     +11.3%      17.62 ±  7%  slabinfo.kmem_cache.num_slabs
      1203 ±  3%      -0.4%       1198 ±  9%      +9.5%       1318 ±  6%  slabinfo.kmem_cache_node.active_objs
     18.83 ±  3%      -0.4%      18.75 ±  9%      +9.5%      20.62 ±  6%  slabinfo.kmem_cache_node.active_slabs
      1205 ±  3%      -0.4%       1200 ±  9%      +9.5%       1320 ±  6%  slabinfo.kmem_cache_node.num_objs
     18.83 ±  3%      -0.4%      18.75 ±  9%      +9.5%      20.62 ±  6%  slabinfo.kmem_cache_node.num_slabs
     42857            +0.5%      43068            -0.5%      42655        slabinfo.lsm_file_cache.active_objs
    258.54            +0.3%     259.40            -0.3%     257.87        slabinfo.lsm_file_cache.active_slabs
     43951            +0.3%      44098            -0.3%      43838        slabinfo.lsm_file_cache.num_objs
    258.54            +0.3%     259.40            -0.3%     257.87        slabinfo.lsm_file_cache.num_slabs
     37236            -0.4%      37081            -0.2%      37146        slabinfo.maple_node.active_objs
    589.25            -0.4%     586.76            -0.3%     587.65        slabinfo.maple_node.active_slabs
     37712            -0.4%      37552            -0.3%      37609        slabinfo.maple_node.num_objs
    589.25            -0.4%     586.76            -0.3%     587.65        slabinfo.maple_node.num_slabs
      5539            -0.1%       5533            +0.5%       5567        slabinfo.mm_struct.active_objs
    230.83            -0.1%     230.54            +0.5%     231.98        slabinfo.mm_struct.active_slabs
      5539            -0.1%       5533            +0.5%       5567        slabinfo.mm_struct.num_objs
    230.83            -0.1%     230.54            +0.5%     231.98        slabinfo.mm_struct.num_slabs
    945.00 ±  4%      +2.2%     966.00 ±  4%      -0.6%     939.75 ±  3%  slabinfo.mnt_cache.active_objs
     22.50 ±  4%      +2.2%      23.00 ±  4%      -0.6%      22.38 ±  3%  slabinfo.mnt_cache.active_slabs
    945.00 ±  4%      +2.2%     966.00 ±  4%      -0.6%     939.75 ±  3%  slabinfo.mnt_cache.num_objs
     22.50 ±  4%      +2.2%      23.00 ±  4%      -0.6%      22.38 ±  3%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.num_slabs
      1792            +0.0%       1792            +0.0%       1792        slabinfo.names_cache.active_objs
    224.00            +0.0%     224.00            +0.0%     224.00        slabinfo.names_cache.active_slabs
      1792            +0.0%       1792            +0.0%       1792        slabinfo.names_cache.num_objs
    224.00            +0.0%     224.00            +0.0%     224.00        slabinfo.names_cache.num_slabs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.net_namespace.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.net_namespace.active_slabs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.net_namespace.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.net_namespace.num_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.nfs_commit_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_commit_data.active_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.nfs_commit_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_commit_data.num_slabs
    305.11 ±  8%     +13.4%     346.05 ±  7%      +0.7%     307.11 ± 11%  slabinfo.nsproxy.active_objs
      5.45 ±  8%     +13.4%       6.18 ±  7%      +0.7%       5.48 ± 11%  slabinfo.nsproxy.active_slabs
    305.11 ±  8%     +13.4%     346.05 ±  7%      +0.7%     307.11 ± 11%  slabinfo.nsproxy.num_objs
      5.45 ±  8%     +13.4%       6.18 ±  7%      +0.7%       5.48 ± 11%  slabinfo.nsproxy.num_slabs
    240.00            +0.0%     240.00            +0.0%     240.00        slabinfo.numa_policy.active_objs
      4.00            +0.0%       4.00            +0.0%       4.00        slabinfo.numa_policy.active_slabs
    240.00            +0.0%     240.00            +0.0%     240.00        slabinfo.numa_policy.num_objs
      4.00            +0.0%       4.00            +0.0%       4.00        slabinfo.numa_policy.num_slabs
      8702            +0.1%       8715            -0.5%       8655        slabinfo.perf_event.active_objs
    355.21            +0.1%     355.56            -0.4%     353.65        slabinfo.perf_event.active_slabs
      8880            +0.1%       8888            -0.4%       8841        slabinfo.perf_event.num_objs
    355.21            +0.1%     355.56            -0.4%     353.65        slabinfo.perf_event.num_slabs
     16281            -1.5%      16037            -0.8%      16152        slabinfo.pid.active_objs
    254.66            -1.6%     250.63            -0.9%     252.38        slabinfo.pid.active_slabs
     16298            -1.6%      16040            -0.9%      16152        slabinfo.pid.num_objs
    254.66            -1.6%     250.63            -0.9%     252.38        slabinfo.pid.num_slabs
     13270            +0.1%      13286            -0.0%      13265        slabinfo.pool_workqueue.active_objs
    207.67            +0.0%     207.75            -0.0%     207.63        slabinfo.pool_workqueue.active_slabs
     13290            +0.0%      13296            -0.0%      13288        slabinfo.pool_workqueue.num_objs
    207.67            +0.0%     207.75            -0.0%     207.63        slabinfo.pool_workqueue.num_slabs
    940.85 ±  6%      -0.1%     940.17 ±  4%      -1.2%     929.83 ±  5%  slabinfo.posix_timers_cache.active_objs
     14.70 ±  6%      -0.1%      14.69 ±  4%      -1.2%      14.53 ±  5%  slabinfo.posix_timers_cache.active_slabs
    940.85 ±  6%      -0.1%     940.17 ±  4%      -1.2%     929.83 ±  5%  slabinfo.posix_timers_cache.num_objs
     14.70 ±  6%      -0.1%      14.69 ±  4%      -1.2%      14.53 ±  5%  slabinfo.posix_timers_cache.num_slabs
      4781            +0.3%       4793 ±  2%      +1.2%       4840        slabinfo.proc_dir_entry.active_objs
    113.83            +0.3%     114.12 ±  2%      +1.2%     115.25        slabinfo.proc_dir_entry.active_slabs
      4781            +0.3%       4793 ±  2%      +1.2%       4840        slabinfo.proc_dir_entry.num_objs
    113.83            +0.3%     114.12 ±  2%      +1.2%     115.25        slabinfo.proc_dir_entry.num_slabs
     29810            -0.5%      29667            -0.0%      29809        slabinfo.proc_inode_cache.active_objs
    649.12            -0.5%     645.92            -0.0%     649.02        slabinfo.proc_inode_cache.active_slabs
     29859            -0.5%      29712            -0.0%      29854        slabinfo.proc_inode_cache.num_objs
    649.12            -0.5%     645.92            -0.0%     649.02        slabinfo.proc_inode_cache.num_slabs
     40835            +0.2%      40903            +0.1%      40870        slabinfo.radix_tree_node.active_objs
    729.58            +0.3%     731.67            +0.1%     730.53        slabinfo.radix_tree_node.active_slabs
     40856            +0.3%      40973            +0.1%      40909        slabinfo.radix_tree_node.num_objs
    729.58            +0.3%     731.67            +0.1%     730.53        slabinfo.radix_tree_node.num_slabs
    354.00 ± 18%      -0.8%     351.00 ± 18%      +0.4%     355.50 ± 13%  slabinfo.request_queue.active_objs
     10.33 ± 15%      +4.0%      10.75 ± 12%      +5.2%      10.88 ±  9%  slabinfo.request_queue.active_slabs
    372.00 ± 15%      +4.0%     387.00 ± 12%      +5.2%     391.50 ±  9%  slabinfo.request_queue.num_objs
     10.33 ± 15%      +4.0%      10.75 ± 12%      +5.2%      10.88 ±  9%  slabinfo.request_queue.num_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.active_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.num_slabs
      4842            -0.6%       4816            -0.7%       4808        slabinfo.scsi_sense_cache.active_objs
     76.67            -0.5%      76.25            -0.7%      76.12        slabinfo.scsi_sense_cache.active_slabs
      4906            -0.5%       4880            -0.7%       4872        slabinfo.scsi_sense_cache.num_objs
     76.67            -0.5%      76.25            -0.7%      76.12        slabinfo.scsi_sense_cache.num_slabs
     15826            -0.1%      15810            -0.1%      15804        slabinfo.seq_file.active_objs
    235.79            -0.1%     235.58            -0.1%     235.58        slabinfo.seq_file.active_slabs
     16033            -0.1%      16019            -0.1%      16019        slabinfo.seq_file.num_objs
    235.79            -0.1%     235.58            -0.1%     235.58        slabinfo.seq_file.num_slabs
    101943            -0.4%     101564            -0.5%     101415        slabinfo.shared_policy_node.active_objs
      1199            -0.4%       1194            -0.5%       1193        slabinfo.shared_policy_node.active_slabs
    101943            -0.4%     101564            -0.5%     101415        slabinfo.shared_policy_node.num_objs
      1199            -0.4%       1194            -0.5%       1193        slabinfo.shared_policy_node.num_slabs
     10553            -0.7%      10479            -0.4%      10509        slabinfo.shmem_inode_cache.active_objs
    245.42            -0.7%     243.71            -0.4%     244.41        slabinfo.shmem_inode_cache.active_slabs
     10553            -0.7%      10479            -0.4%      10509        slabinfo.shmem_inode_cache.num_objs
    245.42            -0.7%     243.71            -0.4%     244.41        slabinfo.shmem_inode_cache.num_slabs
      5348            -0.3%       5332            -0.4%       5326        slabinfo.sighand_cache.active_objs
    356.58            -0.3%     355.59            -0.4%     355.07        slabinfo.sighand_cache.active_slabs
      5348            -0.3%       5333            -0.4%       5326        slabinfo.sighand_cache.num_objs
    356.58            -0.3%     355.59            -0.4%     355.07        slabinfo.sighand_cache.num_slabs
      8939 ±  2%      -1.8%       8780 ±  2%      -0.6%       8882 ±  2%  slabinfo.signal_cache.active_objs
    319.31 ±  2%      -1.7%     313.88 ±  2%      -0.6%     317.29 ±  2%  slabinfo.signal_cache.active_slabs
      8940 ±  2%      -1.7%       8788 ±  2%      -0.6%       8884 ±  2%  slabinfo.signal_cache.num_objs
    319.31 ±  2%      -1.7%     313.88 ±  2%      -0.6%     317.29 ±  2%  slabinfo.signal_cache.num_slabs
     11991            +0.6%      12066            +0.6%      12061        slabinfo.sigqueue.active_objs
    235.14            +0.6%     236.60            +0.6%     236.56        slabinfo.sigqueue.active_slabs
     11991            +0.6%      12066            +0.6%      12064        slabinfo.sigqueue.num_objs
    235.14            +0.6%     236.60            +0.6%     236.56        slabinfo.sigqueue.num_slabs
     15733            -0.4%      15664            -0.9%      15592        slabinfo.skbuff_head_cache.active_objs
    247.17 ±  2%      -0.6%     245.62            -1.1%     244.38        slabinfo.skbuff_head_cache.active_slabs
     15818 ±  2%      -0.6%      15720            -1.1%      15640        slabinfo.skbuff_head_cache.num_objs
    247.17 ±  2%      -0.6%     245.62            -1.1%     244.38        slabinfo.skbuff_head_cache.num_slabs
      8753 ±  6%      -2.2%       8558 ±  3%      -1.6%       8610 ±  3%  slabinfo.skbuff_small_head.active_objs
    171.64 ±  6%      -2.2%     167.81 ±  3%      -1.6%     168.84 ±  3%  slabinfo.skbuff_small_head.active_slabs
      8753 ±  6%      -2.2%       8558 ±  3%      -1.6%       8610 ±  3%  slabinfo.skbuff_small_head.num_objs
    171.64 ±  6%      -2.2%     167.81 ±  3%      -1.6%     168.84 ±  3%  slabinfo.skbuff_small_head.num_slabs
      4100 ±  6%      +3.6%       4248 ±  6%      +7.1%       4393 ±  3%  slabinfo.sock_inode_cache.active_objs
    105.14 ±  6%      +3.6%     108.92 ±  6%      +7.1%     112.66 ±  3%  slabinfo.sock_inode_cache.active_slabs
      4100 ±  6%      +3.6%       4248 ±  6%      +7.1%       4393 ±  3%  slabinfo.sock_inode_cache.num_objs
    105.14 ±  6%      +3.6%     108.92 ±  6%      +7.1%     112.66 ±  3%  slabinfo.sock_inode_cache.num_slabs
      1656 ±  5%      +1.4%       1680 ±  8%      +4.0%       1723 ±  5%  slabinfo.task_group.active_objs
     32.49 ±  5%      +1.4%      32.96 ±  8%      +4.0%      33.79 ±  5%  slabinfo.task_group.active_slabs
      1656 ±  5%      +1.4%       1680 ±  8%      +4.0%       1723 ±  5%  slabinfo.task_group.num_objs
     32.49 ±  5%      +1.4%      32.96 ±  8%      +4.0%      33.79 ±  5%  slabinfo.task_group.num_slabs
      3795            -0.6%       3774            -0.0%       3794        slabinfo.task_struct.active_objs
      1900            -0.6%       1889            -0.0%       1899        slabinfo.task_struct.active_slabs
      3801            -0.6%       3779            -0.0%       3799        slabinfo.task_struct.num_objs
      1900            -0.6%       1889            -0.0%       1899        slabinfo.task_struct.num_slabs
    410.19 ±  4%      +0.0%     410.34 ±  2%      -3.4%     396.15 ±  4%  slabinfo.taskstats.active_objs
     11.09 ±  4%      +0.0%      11.09 ±  2%      -3.4%      10.71 ±  4%  slabinfo.taskstats.active_slabs
    410.19 ±  4%      +0.0%     410.34 ±  2%      -3.4%     396.15 ±  4%  slabinfo.taskstats.num_objs
     11.09 ±  4%      +0.0%      11.09 ±  2%      -3.4%      10.71 ±  4%  slabinfo.taskstats.num_slabs
      2338            +0.4%       2346            +0.4%       2346        slabinfo.trace_event_file.active_objs
     55.67            +0.4%      55.88            +0.4%      55.88        slabinfo.trace_event_file.active_slabs
      2338            +0.4%       2346            +0.4%       2346        slabinfo.trace_event_file.num_objs
     55.67            +0.4%      55.88            +0.4%      55.88        slabinfo.trace_event_file.num_slabs
      2419            -0.8%       2400            -1.0%       2395        slabinfo.tracefs_inode_cache.active_objs
     48.38            -0.8%      48.01            -1.0%      47.91        slabinfo.tracefs_inode_cache.active_slabs
      2419            -0.8%       2400            -1.0%       2395        slabinfo.tracefs_inode_cache.num_objs
     48.38            -0.8%      48.01            -1.0%      47.91        slabinfo.tracefs_inode_cache.num_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_slabs
     74.00            +0.0%      74.00            +0.0%      74.00        slabinfo.uts_namespace.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.uts_namespace.active_slabs
     74.00            +0.0%      74.00            +0.0%      74.00        slabinfo.uts_namespace.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.uts_namespace.num_slabs
     44207            -0.5%      43983            -0.1%      44167        slabinfo.vm_area_struct.active_objs
      1009            -0.6%       1003            -0.1%       1008        slabinfo.vm_area_struct.active_slabs
     44417            -0.6%      44158            -0.1%      44356        slabinfo.vm_area_struct.num_objs
      1009            -0.6%       1003            -0.1%       1008        slabinfo.vm_area_struct.num_slabs
     62823            -1.8%      61708 ±  2%      -1.0%      62190        slabinfo.vma_lock.active_objs
    619.57            -1.7%     608.90 ±  2%      -0.8%     614.67        slabinfo.vma_lock.active_slabs
     63196            -1.7%      62107 ±  2%      -0.8%      62696        slabinfo.vma_lock.num_objs
    619.57            -1.7%     608.90 ±  2%      -0.8%     614.67        slabinfo.vma_lock.num_slabs
    821594            -0.0%     821477            +0.0%     821638        slabinfo.vmap_area.active_objs
     14671            -0.0%      14669            +0.0%      14672        slabinfo.vmap_area.active_slabs
    821595            -0.0%     821478            +0.0%     821638        slabinfo.vmap_area.num_objs
     14671            -0.0%      14669            +0.0%      14672        slabinfo.vmap_area.num_slabs
    279.24            +0.0%     279.24            +0.0%     279.24        slabinfo.x86_lbr.active_objs
     13.99            +0.0%      13.99            +0.0%      13.99        slabinfo.x86_lbr.active_slabs
    293.80            +0.0%     293.80            +0.0%     293.80        slabinfo.x86_lbr.num_objs
     13.99            +0.0%      13.99            +0.0%      13.99        slabinfo.x86_lbr.num_slabs


> 
> Thanks,
> Amir.

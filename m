Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864EC168A6
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+X8rKqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703147238; x=1734683238;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xFo2AU/5CTGqMEloQezaD647XFsyu+D8WdOFAhGfoJY=;
  b=c+X8rKqvingzImeqgcwh8DLCwh/anNiMGTXI/NbNV4pbN0n9SA+ys7R9
   5ccE1cMeTYeG7u73W7N3BATn9qdyMozaIddCLx8m9F6kAEa/XkPWP5J8D
   mtdbk0Cb4XGQYa1ZujktKU/qXzxLi2dGT/BSuAF8AFNoJqzSbwaT4KK3w
   g5u+Z6NUYLzo36Gq+gc7ICbuode0ph2Q260DxHLcQM+4FJT8erOsgRGk7
   XE6bqAu2ej5nO1uYzFvR2BkYkZpgPqCZdzEiCs+KlmUaezAhoq02K+PBI
   3T6OCWDiV8T8nqLFODbztktmnxZqMfdirdqfAYS1Vd1TyE6SazfQI6uFE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9322907"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="9322907"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 00:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="900013680"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="900013680"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Dec 2023 00:27:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 00:27:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 00:27:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 00:27:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 00:27:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFuIu6iYJan2gvvGW0SptLreQL5KdImXBqni0R8+u0TqcScpPdqVIS0z8NjYA6ldQI5YA0FP7ZpeXGoh3GMWdiSs2GMIoDSHKSspikSSAvu+9YtLDXH2QvmJR+tZrAB316OK3+ySUD6HBCf3FDV6D57Y2utJS2gkTTPzCWbP7qaDp9e3/QLq2zthkGr7JW2RXoj3VKXS559X6H98LDhaDjGS7HBSqmFuhh40/g8e8Ko99jIeeFKaG0XbESAu3PX4SX5KD693gIlD46laE6moWlWPg2bea2orlQPwtelpGsAhxW8unpY/Gtpr6YPHvJDI29gJdHlCtCC6uSGsijZ91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHaHG/xOfDb449YfcAI/uu7sg3MuUmNkhy40Z6IT+gg=;
 b=Yv/KH8qDB7AUvchHQ2psGPxmZ9UK1ri2nAXeSBfPAVPaq/9r/kdFsNORGo6UOf09VH1uRqXgsk5TS0b09H4AOOCtA361xXU6KB+btg3IcCnWs1u91/ZbPewXorgkkAdemgLBjooQJdcJWfXtGgM4Lz/zYIVyPAF9B9QB8toZ5LfHxh54EC1LvOO4A41FLHWE5rfI8uAUpM9TRwSEGgv2OEB/25LCNdSX3PXT43SXyvhTG+6pmp7QXp8vEOdJoVD2eIeMnC6erTvfXEtVMx862RHRm9OMF5D603WfF17GgzO4I8qjwZikpnGPfimO7ty6UrigUQjJDlFHa+r3MXn9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 08:27:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 08:27:12 +0000
Date: Thu, 21 Dec 2023 16:27:03 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 753d63fa0e:
 phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s -95.7% regression
Message-ID: <ZYP213WZxqsqpeil@xsang-OptiPlex-9020>
References: <202312181550.3fa030a7-oliver.sang@intel.com>
 <CAOQ4uxizaaC1RjBYTqPkPJcXj66+-8UVqQR9ArGp40+0FZR8Mg@mail.gmail.com>
 <ZYGipFO2W4VCEjxK@xsang-OptiPlex-9020>
 <CAOQ4uxjYXL7UjNH_baodAyAcBM-hVngmdcSCRxsjpP5=o_aL7w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjYXL7UjNH_baodAyAcBM-hVngmdcSCRxsjpP5=o_aL7w@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 023cf817-010d-432e-0095-08dc01fea106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2+vQd3d8hB+jB+AlYUSftIemVG+szZ4jQTyqxwKqTwIN45nQjdB3MyLL/qYtxU9+QU5a+v7oWPUymvkVdVarPt5buqWGR6Kv4C8e9jbfnQAI7ReuyvOuUG0/9Jbn9DBcBRj8VYFUWZcdvj+SWV82lcKouvYAKdCBxSZm5ITeCxY16ic53hNgnIuiJpJmh5lJkbcIr7s85Ow0tFhMCqQ/uQA409mSNodnKRG63mhvdEhAaTake6fB3dCJCRYyr250eNYytRX4hpp21NFpzRGd25QRMv4D+S/TNOeWVkfd0tYO5utmtjjkCrj7J28d/NZBMK4hCk1BRxWUgWAJZJk4yUcSwbf/5wXltD4GZSITCSXUfEqW7kZk5YexxW/g2h/F+kjlB1PAsXHUfPqyA5mdUSE7sJH9ZkfvtgIFelrMNFRk7g4xP/VoHmQm/jd51dtLc5yq/e4WuWQrfHW0Ufu4wBkvrpHi0P0Rr1QroMSz5Vr6b0eeDKTz7dtmyt2ygz8bW85tmmJPwWPIdKej5iFFD15CgbWo3Cj0WXkEPGs/aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(38100700002)(82960400001)(83380400001)(26005)(6512007)(53546011)(9686003)(6506007)(966005)(478600001)(8676002)(6916009)(66556008)(66476007)(316002)(6486002)(6666004)(66946007)(8936002)(19627235002)(33716001)(2906002)(5660300002)(4326008)(44832011)(107886003)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlgvQll6ZzArOVd2b1BDZEcwVnhvTTBlSVVQRU1wMCs1aDNGdTlpYWlLdkZl?=
 =?utf-8?B?U0VMbjBTSmVzY0c5UEVMcjFHMWZpOEpWeTg4TkVzYW5LdGJjN2I1WXZuTFVE?=
 =?utf-8?B?amVyTzc3bzFxV1AyK1B1R0FKYVdWbmFVc2dPTmNKYjV0Ym5HdVZISEVNWVFx?=
 =?utf-8?B?L0ZaS2Q5TXI0VFF1UXo4cCt1UDlNdWpVQStJS1RrMVd2ZitneWhkQ1E5dVVh?=
 =?utf-8?B?bDA3eWw4azNlSDdzdmxXZmNDdXRad2VDVkUzb2Q1bkNxWkFPMG8wRWgxcitR?=
 =?utf-8?B?MEFINnY3YkJaWTRvdEx6QlZYSjI0ZHQ5U2FRYUVjVEsyVWVLeXMxd0xBVkRM?=
 =?utf-8?B?R21YMXpCcXNtZzRTcEQ3SVV1WkltRXJWdmdPQlF3QmI3bXZNNG9ieVFvOWp2?=
 =?utf-8?B?NU1jeVR1Si9jL3RYL3hPVndwUW1DWnVvVzd2MEpBalY5Y0RpVjQ2dkVKSXJW?=
 =?utf-8?B?VlVzays5VHFFMDQzZGxqVWZ2T3BqMXBtTjlINElqZDQ5bkZ1QlJ1b3M5cldN?=
 =?utf-8?B?MnFSajkwSWpMVTRVRkxkY1hRa01jaWdJN2xLeUltNUZsNzNlNVRFNzQ2eGlo?=
 =?utf-8?B?MzlOWkRubTZPWjN1bVNXY0J1S2IwZG9vNWpndVgvb0cvSWJWcGg1RnJsMGF1?=
 =?utf-8?B?THhpQnZXcjF0NG04VElsRk5BSDg0aXhhclF3amZCVkFQS2grSWxDU0RqRzJK?=
 =?utf-8?B?b2xibGRCbloxQTFUOW8xYWFsKzdCdEtiVDIyNFl6dXBaNTVpSThlOC9VemU0?=
 =?utf-8?B?KytXaVZVQTJXT3FBaUZrdGlRblg0TVpjWVo1a0pLSzVPbDFVdTVaendoM1Fr?=
 =?utf-8?B?d1BIQzZqSW9QeGxnRjN2MXFkMDdwenpFYUJENHhEUGlpeUlzVFk0MWJmeFFm?=
 =?utf-8?B?MFo0ZHAwTWNBRFNpZHFUV1JRQVU3TS9qdG1NMHBPVVhSei95VkxaNGtXRHN6?=
 =?utf-8?B?Qk51aTRGWnlVYTJuR0RYWXJJaHlGZUs4Sk5PQjZoSFhCUjM2WmR4ZTZIUXRh?=
 =?utf-8?B?YmhQVUdHOVdlNmVjczJkU1p0R1FWdjlHUFE0UlM0VnhOY0pibmZpY2dTaHB2?=
 =?utf-8?B?ZzlYWjVOK1FCQ2NjOFM2UGpvUlYxcVBlS0hvSTUxNE9ZVXNVaWpHTXpvZmJl?=
 =?utf-8?B?UWZLeFdIeElWblBLUFo3Wm9IZ3VqNmVRLzZLNW1NQTZ0WjVqVkhIMWFoRWJh?=
 =?utf-8?B?ZHJucFgzYXRlRSswbVQ0WWM5SlVSUzhWZlFuTnRjWVNNSitkaUdVcEpYOTNF?=
 =?utf-8?B?QlErbFFQYmtEV2dubCtWSVN2ZFdrZmMwVnpoUDc1WHRPYjVINDdJeEsxN0tK?=
 =?utf-8?B?ZGg2cnJKQTlXbjNFT0Q0a1RMN0N2SURNWTNGMXJVVGNKM1gzZjJ2L0d2WHFF?=
 =?utf-8?B?d1pMUi9aNW1xMVh4UG9CSlB0OEJma3BuUi83bWtqd1ZpRHkvVHZ4VVFiajg0?=
 =?utf-8?B?SUo4d1ZWbnEzUmJGeE5WdlJjdWlwVFczY0pDN3J4K2lkRkNGRUNQUlRIN2l6?=
 =?utf-8?B?YVY2dmU2WjBYcDVYZUs3bC8xQkdIbEN6ZGc0TnBQb05EU0E2SjZLYndaM2Nx?=
 =?utf-8?B?OVRkM1V4d0FJOEExQktLL0dvdFlha0dSMlFzRDIxTUZsV3BrV3J0NmtuNEpO?=
 =?utf-8?B?ZTVlVnhTb2Q4bzBrVzk4NFNmeXFuZlVEblJrZmFMSUwvUVZLUUE3UEErd2xs?=
 =?utf-8?B?Mk9VK3FDcFVRcUlqblJqU0o1cVdVMnMwRXI1WUF2bnhRNUVBa0NFT3UrOWxT?=
 =?utf-8?B?MFdGdTBudDh4VGdYUHpqSVlyb1VRL3I4bm5VeUdRL1RITGRSbmw3NTUzQ0FB?=
 =?utf-8?B?Q2w2SUg0bm1OTlNsS3o3NStsdWVGT092Mk85ZE9zdFdGMDZ0YmlwK2d1YXVO?=
 =?utf-8?B?alZFMVJRd0RId0ZNeXA1elBaOFhGTkFCa3pmMFNwVm5FcFdwL2piL1N2UUhS?=
 =?utf-8?B?bEJ5cEd5WlNGUSsxREZSeXp2dm9tNWZTMW1LZVZHcGVQTU1hZHpzTzcwYXhO?=
 =?utf-8?B?VnlzU2hTRi8wcjUwZ05LdTBoQXlHT0xieHVNbWxiTFRHZmdZVlA5SjduaGtx?=
 =?utf-8?B?SEUrT1Y1MFBBdHdQR1JhWUpDODk2ZCt6Uk9XQUM1YWNiR2pPTExRdXZwdnVq?=
 =?utf-8?Q?nXN9PAOWggqXJ3ylGwAnh6EDn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 023cf817-010d-432e-0095-08dc01fea106
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 08:27:11.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PvQU4lS9/ajlRGVpfjqin3TaD0AMzbD9UuxN6VNOc9sIhGkoempDRE9jYmlRLJ/9L7DGYahC4W/mn1lFXKylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-OriginatorOrg: intel.com

hi, Amir,

On Tue, Dec 19, 2023 at 04:16:31PM +0200, Amir Goldstein wrote:
> On Tue, Dec 19, 2023 at 4:03 PM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Mon, Dec 18, 2023 at 01:09:40PM +0200, Amir Goldstein wrote:
> > > On Mon, Dec 18, 2023 at 10:17 AM kernel test robot
> > > <oliver.sang@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a -95.7% regression of phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s on:
> > > >
> > > >
> > > > commit: 753d63fa0e79bb7ad14f0351b800f856b5364ec3 ("fs: add srcu variants for mnt_{want,drop}_write() helpers")
> > > > https://github.com/amir73il/linux sb_write_barrier
> > >
> > > This commit had a bug in overlayfs.
> > > Does the test setup use overlayfs?
> > > Pushed fix to branch sb_write_barrier.
> > > Can you please re-test this branch:
> > >
> > > * c89fa4b25ff7 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
> > > * 0fed804d8eeb - fanotify: activate sb write barriers for pre-modify
> > > event watchers
> > > * e464fb4d26e7 - fs: hold s_write_srcu for pre-modify permission
> > > events on aio write
> > > * 5dc0c9b3e65b - fs: hold s_write_srcu for pre-modify permission events on write
> > > * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> > > * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> > > * 69e1ebcf925c - fs: implement 'vfs write barriers'
> >
> > seems you split previous 753d63fa0e to:
> > > * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> > > * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> >
> > our test confirmed the regression is caused by 0651230c4b05
> >
> 
> Doh! This is an unintentional leftover.
> commit 0651230c4b05 is still buggy.
> I now removed it from sb_write_barrier and re-pushed:
> 
> * cf924e29331a - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
> * 6ecc6ff4de46 - fanotify: activate sb write barriers for pre-modify
> event watchers
> * 402399aa79fc - fs: hold s_write_srcu for pre-modify permission
> events on aio write
> * b5a3ee5d5053 - fs: hold s_write_srcu for pre-modify permission events on write
> * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 69e1ebcf925c - fs: implement 'vfs write barriers'
> 
> 
> I would appreciate it if you could re-test the branch again.
> Sorry for the trouble.

Not at all! always our great pleasure.

the regression has gone upon new branch in our tests. for brief, I don't supply
full comparison, if you need, please let us know.

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/1MB/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

commit:
  v6.7-rc4
  69e1ebcf925c - fs: implement 'vfs write barriers'
  03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
  b5a3ee5d5053 - fs: hold s_write_srcu for pre-modify permission events on write
  cf924e29331a - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag

        v6.7-rc4 69e1ebcf925c2ec5ba2332c21ae 03da7318eb21a7d0f9ef4b6674e b5a3ee5d50536dbac360e829c31 cf924e29331a67715f8a008f53d
---------------- --------------------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \          |                \
      3025            +1.2%       3061            +0.6%       3042            +0.7%       3047            +0.9%       3051        phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s


=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/4Kb/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

commit:
  v6.7-rc4
  69e1ebcf925c - fs: implement 'vfs write barriers'
  03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
  b5a3ee5d5053 - fs: hold s_write_srcu for pre-modify permission events on write
  cf924e29331a - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag

        v6.7-rc4 69e1ebcf925c2ec5ba2332c21ae 03da7318eb21a7d0f9ef4b6674e b5a3ee5d50536dbac360e829c31 cf924e29331a67715f8a008f53d
---------------- --------------------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \          |                \
      1969            -1.0%       1950            -0.9%       1953            -1.3%       1943            -1.3%       1944        phoronix-test-suite.iozone.4Kb.2GB.WritePerformance.mb_s

> 
> Thanks,
> Amir.

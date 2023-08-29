Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A820E8
	for <oe-lkp@lists.linux.dev>; Tue, 29 Aug 2023 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693298414; x=1724834414;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QUgvNNu5dhtPIONb2t7/fZOiv3ZfWSA0eSiIb0aFYeI=;
  b=oAEq8z4ux/iY/fu17a1R0K74+CZti7zV/7G8P1vhQOfG/YyoMHe+hCbc
   I50FWar+4RhEWvt1UgSSXbH47slAsfaeZY4PPy/Owf1YJvzzowqRlNf9S
   RF3ulNjOaJswdE09TFnoZmP+3MKeHeLzojNfpDd/CYf/vWqssHJpT9H/3
   btM5LO/YL20iSWI/3DSbbwjZ0qIIYk64hkJGP9I2P0LbO3BVoXrntDPms
   NysJtmWM+UkazXua7N3skPgTyjRgeLhOU1mnV9poTPboQ5ntih7luafvL
   6Y23sDdEnXNlkBmta404F1HkspQIEi+XW5on9zt4Rdw+680fqEk6TaZGL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354826968"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="354826968"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738619724"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="738619724"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 29 Aug 2023 01:40:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 01:40:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 01:40:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 01:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTWEjYfja3pAnvDwCEF3B8rMNPRMgFFKXj7lGbPMtH7LGb5XD1WYluGUzuyo24OrdYXscO/NszUJ7eotsmyIzH68OntoPmZDI0Fg56tIkZnks3HPgXT7eAGTUhBrBNXvOyNkLR89sYm0GR0J+la0GcqHjVVDPHWmPliDwcJ67we4eIs4Bmq2y8q6vifvMcoMbYAXPddUd2nYOuwx7DgMjpKFvP9O5lpZzBsodWzi+L0bMX0ZOk1X7vX+53/Q//KfEdPMMJgpozWKFzIMt7Y4ccHraRKnyWsCaP3hUB5l5845w2UrJKghUwt73kWGK4xBcDZG2S0Xlc0Y9rIJ+14JhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zieULVc1qw66jkTYgc88Gr14H2J7WlLgjRf4N/z2R6k=;
 b=lC7Hj6j4gyL1Lk68e7jXOfqE6Hl55Q4hTB0Vpt+aosvO5gKPuko8jtkZFX1SqH46aKWuJ8zrHt3nkUB1IHqxShKyakPh+2IT6N9DlBDne1ViZ8v6uEJ3E9Q5F7b7vjKl4nzeCmgH+eFK1vdTW3lV2mmFTyry4PdxfAKVXgNiApeOwJRl0KgfJAs7fqtJVC8ZTWvMHF/rdfYo2JmDfkC/1J0iBEAESRaH7QjhgUpPe7WDjpFpxCB4r1frpfutKhNNIv8j0055ecK5Y8z8igpXAQTW4xq7zlZB+xWkaIZsfGQxvMGpKyZ7jOAP8QP446L2bDaxTaP1UajGmEPQI3Y+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 08:40:03 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 08:40:03 +0000
Date: Tue, 29 Aug 2023 16:30:17 +0800
From: Feng Tang <feng.tang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
	David Rientjes <rientjes@google.com>
CC: <yu.c.chen@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel
	<jaypatel@linux.ibm.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	lkp <lkp@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying"
	<ying.huang@intel.com>, "Yin, Fengwei" <fengwei.yin@intel.com>,
	"cl@linux.com" <cl@linux.com>, "penberg@kernel.org" <penberg@kernel.org>,
	"iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"tsahu@linux.ibm.com" <tsahu@linux.ibm.com>, "piyushs@linux.ibm.com"
	<piyushs@linux.ibm.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Message-ID: <ZO2smdi83wWwZBsm@feng-clx>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx>
 <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
 <ZL6MQXOaOHTvdGti@feng-clx>
 <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
 <ZL+R5kJpnHMUgGY2@feng-clx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZL+R5kJpnHMUgGY2@feng-clx>
X-ClientProxiedBy: KL1PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:820:f::22) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a457bbd-5ca9-4b4e-bad8-08dba86b897b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzeV9wzP+pAaAFADqbre3jDMkj+btvXoSsusEcGkrUJHg01QTFAoWI4HuFo3VbsE3HvaxiwgVILKkYCoNkR2xYcBC/DHq60WuRzDR7zw+6Eae5sHYheNtdbG7Ge35Fo1IJy5bPlx5EtOeZww62RyPpw1CqZq7GVdsalY5I0/KZW84SAgvIlTWtegiXSlWuKch+bmKNYFvzzGldwAizSweW5ScVRDz0EGCTo1wxSsDZyTVx7pO/jGWIOomOaRQVOSVk9z402JRnHOnAsWh6RG7EkBtZdaChxsrh7HxyOAsJL7WsL2Gk6JweGmDdrNV8/n0s7ZzazqXgJHgChrVF+u6sa2J7ooQ32JthmFMrDkzZ/Lq+mGOwsuL2ocHCxv5DIpdAk4lGsmI3CRX7zdaaXzVts3zerdjVxxdQPa07gVPpjwBr7NfKTDBO+0KAArM6z5C0uwh0r4GSX6AuBhPAOSSEGkneZ2rgL2ZXDAlkvssiPP9C1Y7HN+lJNzvf6YV3a0MSDfiigeVl+HIk30BkasGkC2S0FTXGxmhlV/7rvQZr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(136003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(478600001)(966005)(26005)(6486002)(9686003)(6512007)(6506007)(6666004)(86362001)(5660300002)(2906002)(82960400001)(54906003)(8936002)(38100700002)(7416002)(33716001)(66556008)(316002)(8676002)(66946007)(4326008)(66476007)(110136005)(41300700001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGU5eHRMRk8vVWpUNlloTEdWeEtxTnZ3Wkp3REUzTUZTcXVQNDQ1aVV4R3cr?=
 =?utf-8?B?dzVRS1ZwVGxVT1F0YUNtVTdncHF5YzdJbi9xRlRMZFdkbmJJMy95cEROOE8z?=
 =?utf-8?B?czE4aDhid0ljTDROdnlVVUVBR1p2MWUyOFJWTFZlWTVSaWhaZE5pelZEZjVM?=
 =?utf-8?B?eE5Fd3VGVlJaeEliekV1K09lVnZOSVZjVGVVUXBqQTNPRTlsTWh3eVNCVjQ1?=
 =?utf-8?B?R2VvZEFBM3Q3N0ZaZmVNOUF1T1Jub250WVd6emxJUlpJbTVwWEp1NEkzQTM2?=
 =?utf-8?B?eUZBeEdyb3k5WVZvcEd0Qkp4RzJPS1lwek1Bbnp5Rk1VT25vdFpub3NWcE5i?=
 =?utf-8?B?VC94MkwxaFN0YUpSSVFLWEQvdXhLWlJ1elhEeHdYOUFYY2JGOWtsS29oMGw1?=
 =?utf-8?B?aWRvV0RodUNiUVF5d2p6YTJObzRVU0JBcFh3SzBwNDRYMlJNeW5ZOGJsRThZ?=
 =?utf-8?B?U21pdFYzams3dW5JczBGTGRTaThVSEpOdnEyUU93cU1kNkRtNVZ4eldWUW1x?=
 =?utf-8?B?aFlRZ0hWZkF0Nk55bCtNSVZpVjZxV0tKbVU3SThYa1FHbEQ5djBqU29NY015?=
 =?utf-8?B?UHE4VHc3bVdkSXJMbDljdE44WVloTDBqWDFUNk1ERTlqeldEWUFlSW1oVmI5?=
 =?utf-8?B?M3BNSDJnWFdoaCtieTZMYkV0NXdMS3BkQUVmK2YwMklidlFnVjRmNzNKMDdn?=
 =?utf-8?B?WUx4VXpBQW85cTNFZjliY1hjRzMweDBVRWdtaEJ4dEt4b01nUWN5KzNBV3pY?=
 =?utf-8?B?MDdsdG9wWko4eVpjU2N6UWlUekQ0bFd3ZWhsS1hMNFVaa0F1QTU1em4wMWFZ?=
 =?utf-8?B?TzgxdlR3RzdOdVQrS0EzUDNwbTZhcXh1b1crd2h0SWpvVDdpL0ZHeHlqQUJK?=
 =?utf-8?B?dHI4dWljWmJPWmRtcFRlaE5EZk5rRjh1MzVUVnhOZUpqVkRIRVRhdXYvQjFM?=
 =?utf-8?B?ZGl4YVlFSG0yKzVoMEU1TnZSdWVTcXVKRGhHeXRHUUowcGtCdHVVd3lDV0RD?=
 =?utf-8?B?R3JzajY3dEEwUFAwVHp4RDY5cFBnT2xSdXYvMjBtaThGcE5xMUpIRjQ0MS8v?=
 =?utf-8?B?UGlPNmo2RzdQVE1iUTMzY1ZnNGtyemkrUWZnVjdGeUZLbVl1MGg4Rk12Nitw?=
 =?utf-8?B?R0o0eTlIS2JGWFZYZkFmdVU3a0N1V0VFeHMyZ09RdENtemdhamRLUnUwRVhu?=
 =?utf-8?B?NDNlZDFxSFUrdVZMcGZtU2EzSHdXbndMeENPK1FkMjZoT3BYR3U5Sjl3elo5?=
 =?utf-8?B?U01EbmtMWEJtSHNDeG1LYTB3MWg4OEZua2tnU1lqOGRiamdUM3l4VWtidG5P?=
 =?utf-8?B?aXVvNW5tSWdDNnZHWjQ1Y1FuTmpqRWovRDRMN2d1UUZYTkhUNWRSbFdwd1V0?=
 =?utf-8?B?ZldteGNSYkZyUHpHV3JRRWlmd0hESmlLYkVocTc2b01nd2dubHc1cHF2d25W?=
 =?utf-8?B?WkJkVTAxVkhBcStBQVkzZDN5N291WUhPc0g1eFhWMS9jNUx0OGMrTWw5T3RG?=
 =?utf-8?B?czJWN1RPbW1vZW10ZnJDTnczMWVsVE5CbWs5QmZiczZmY29SSlpUb3hIR1Bm?=
 =?utf-8?B?VVFDRnloa1QzTVE2eUVwR3piSDdjdi8vaTV0Y0Z6Z1QvVU8vdkRSZ0VtOFB2?=
 =?utf-8?B?ZXlqMXJQN0tkZGkxZVJpRGJSL3JMSEVoUWowMzVkUkRpK2JtWHFkN2FTMDha?=
 =?utf-8?B?ZGM3RlJMYjBxU1FOQTVYQXgvWXZjT0ZoMGdFazFCZG5KSXJaMXV3dUJQNkVs?=
 =?utf-8?B?S3U5OHFyc3JmS2lGUHpmSjNPNm42VXJXVjNDQzk4SlJvbWY0RTNjTmdVeG5Z?=
 =?utf-8?B?emRRaGlFRjdzKzhGYm9kSXhWa25mdnhYcTRqclhTM3hPZmRiMXFIUTVUZmM2?=
 =?utf-8?B?eUpBVE9hdTVXbDZLY2srOTI2NEsrbHh2UnM2T3c4VnFFNWtCVmsyY3p1N0lL?=
 =?utf-8?B?bENCNjkxRmtqSUlsVjJQUWVxekIvUDliTWh2OGVZcHRCZDVaSks4VW5BcXV1?=
 =?utf-8?B?cmU2UzRMK2Q5NEt0U0w2OHg4LzFpakpib0ZTOGYwZ0J0ZFdnejh0dmNEMkVH?=
 =?utf-8?B?YjAvdkFsbFF0U09meWtJVVlieVhscjlIR2pCMFc3OXhnZDBBS2JCVkFmM0Vi?=
 =?utf-8?Q?UCgkOP1WvoW5Q5CKBkx6cRKol?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a457bbd-5ca9-4b4e-bad8-08dba86b897b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:40:02.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6wt48IgX3ec89kLYc+z794Of2VmdzyWWWZ9Q1vYu7OU6H7wVF2R1cdP2xmp8+xY4DV3dA6DmU5PUPFbOxh+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
X-OriginatorOrg: intel.com

On Tue, Jul 25, 2023 at 05:20:01PM +0800, Tang, Feng wrote:
> On Tue, Jul 25, 2023 at 12:13:56PM +0900, Hyeonggon Yoo wrote:
> [...]
> > >
> > > I run the reproduce command in a local 2-socket box:
> > >
> > > "/usr/bin/hackbench" "-g" "128" "-f" "20" "--process" "-l" "30000" "-s" "100"
> > >
> > > And found 2 kmem_cache has been boost: 'kmalloc-cg-512' and
> > > 'skbuff_head_cache'. Only order of 'kmalloc-cg-512' was reduced
> > > from 3 to 2 with the patch, while its 'cpu_partial_slabs' was bumped
> > > from 2 to 4. The setting of 'skbuff_head_cache' was kept unchanged.
> > >
> > > And this compiled with the perf-profile info from 0Day's report, that the
> > > 'list_lock' contention is increased with the patch:
> > >
> > >     13.71%    13.70%  [kernel.kallsyms]         [k] native_queued_spin_lock_slowpath                            -      -
> > > 5.80% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;__unfreeze_partials;skb_release_data;consume_skb;unix_stream_read_generic;unix_stream_recvmsg;sock_recvmsg;sock_read_iter;vfs_read;ksys_read;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_read
> > > 5.56% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;get_partial_node.part.0;___slab_alloc.constprop.0;__kmem_cache_alloc_node;__kmalloc_node_track_caller;kmalloc_reserve;__alloc_skb;alloc_skb_with_frags;sock_alloc_send_pskb;unix_stream_sendmsg;sock_write_iter;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_write
> > 
> > Oh... neither of the assumptions were not true.
> > AFAICS it's a case of decreasing slab order increases lock contention,
> > 
> > The number of cached objects per CPU is mostly the same (not exactly same,
> > because the cpu slab is not accounted for),
> 
> Yes, this makes sense!
> 
> > but only increases the
> > number of slabs
> > to process while taking slabs (get_partial_node()), and flushing the current
> > cpu partial list. (put_cpu_partial() -> __unfreeze_partials())
> > 
> > Can we do better in this situation? improve __unfreeze_partials()?
> 
> We can check that, IMHO, current MIN_PARTIAL and MAX_PARTIAL are too
> small as a global parameter, especially for server platforms with
> hundreds of GB or TBs memory.
> 
> As for 'list_lock', I'm thinking of bumping the number of per-cpu
> objects in set_cpu_partial(), at least give user an option to do
> that for sever platforms with huge mount of memory. Will do some test
> around it, and let 0Day's peformance testing framework monitor
> for any regression.

Before this performance regression of 'hackbench', I've noticed other
cases where the per-node 'list-lock' is contended. With one processor
(socket/node) can have more and more CPUs (100+ or 200+), the scalability
problem could be much worse. So we may need to tackle it soon or later,
and surely we may need to separate the handling for large platforms
which suffer from scalability issue and small platforms who care more
about memory footprint.

For solving the scalability issue for large systems with big number
of CPU and memory, I tried 3 hacky patches for quick measurement:

1) increase the MIN_PARTIAL and MAX_PARTIAL to let each node have
   more (64) partial slabs in maxim 
2) increase the order of each slab (including changing the max slub
   order to 4)
3) increase number of per-cpu partial slabs

These patches are mostly independent over each other.

And run will-it-scale benchmark's 'mmap1' test case on a 2 socket
Sapphire Rapids server (112 cores, 224 threads) with 256 GB DRAM,
run 3 configurations with parallel test threads of 25%, 50% and
100% of number of CPUs, and the data is (base is vanilla v6.5
kernel):

		     base	            base + patch-1               base + patch-1,2            base + patch-1,2,3
config-25%	    223670            -0.0%     223641           +24.2%     277734           +37.7%     307991        per_process_ops
config-50%	    186172           +12.9%     210108           +42.4%     265028           +59.8%     297495        per_process_ops
config-100%	     89289           +11.3%      99363           +47.4%     131571           +78.1%     158991        per_process_ops

And from perf-profile data, the spinlock contention has been
greatly reduced:

     43.65            -5.8       37.81           -25.9       17.78           -34.4        9.24        self.native_queued_spin_lock_slowpath

Some more perf backtrace stack changes are:

     50.86            -4.7       46.16            -9.2       41.65           -16.3       34.57        bt.mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.99            -4.4       48.55            -8.1       44.93           -14.6       38.35        bt.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     53.79            -4.4       49.44            -7.6       46.17           -14.0       39.75        bt.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     54.11            -4.3       49.78            -7.5       46.65           -13.8       40.33        bt.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     54.21            -4.3       49.89            -7.4       46.81           -13.7       40.50        bt.entry_SYSCALL_64_after_hwframe.__mmap
     55.21            -4.2       51.00            -6.8       48.40           -13.0       42.23        bt.__mmap
     19.59            -4.1       15.44           -10.3        9.30           -12.6        7.00        bt.___slab_alloc.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate
     20.25            -4.1       16.16            -9.8       10.40           -12.1        8.15        bt.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
     20.52            -4.1       16.46            -9.7       10.80           -11.9        8.60        bt.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region.do_mmap
     21.27            -4.0       17.25            -9.4       11.87           -11.4        9.83        bt.mas_alloc_nodes.mas_preallocate.mmap_region.do_mmap.vm_mmap_pgoff
     21.34            -4.0       17.33            -9.4       11.97           -11.4        9.95        bt.mas_preallocate.mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      2.60            -2.6        0.00            -2.6        0.00            -2.6        0.00        bt.get_partial_node.get_any_partial.___slab_alloc.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk
      2.77            -2.4        0.35 ± 70%      -2.8        0.00            -2.8        0.00        bt.get_any_partial.___slab_alloc.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk.mas_alloc_nodes
     
Yu Chen also saw the similar slub lock contention in a scheduler
related 'hackbench' test, with these debug patches, the contention was
also reduced, https://lore.kernel.org/lkml/ZORaUsd+So+tnyMV@chenyu5-mobl2/

I'll think about how to only apply the changes to big systems and post
them as RFC patches.

Thanks,
Feng



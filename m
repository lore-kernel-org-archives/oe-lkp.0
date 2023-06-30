Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB8EC3
	for <oe-lkp@lists.linux.dev>; Fri, 30 Jun 2023 02:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688093029; x=1719629029;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PmaZMCzjBqHJWx4ZxTb9wNaArkTb093zBJXEXTeAQfc=;
  b=d9Jv9gVp3NKg8+BPJrtNc3XF76DS9Ujtb638aE8cNsRm1fB44RW23YFo
   adbyjGKCGY3bnwkwvRZi84srzU6GxkN5qhYtSfQ/HV23A3trS2Nf/Zv9g
   7/8hYl0D6Id9kEVKt8+wwqiDSD5ffwRMGVJVSdq7pHSonURjBvwfKY1Oe
   itXqn24MaKFSJJnLC70j/Q7EIrKWJI/fiX/uuCel8GFqDWCwVZAJPsmb+
   JYYovBzV4+u8+GeyvqfqflSwjtjbM+9Pyq5uqfWG3oeST4vUyfJoryFG7
   oEj01tDH8YCdDGSt3PnoJv3zDuipYnnO4N+DvcQMf/32dZ27yg7JU+vGO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365777663"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="365777663"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 19:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="964216980"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="964216980"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 19:43:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 19:43:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 19:43:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 19:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8nO8vKFGGYMTsbgqU0iuRhr+OytxWWgsv3lOW9V+r+BmB7RtNxeVlrR0vQDabXKlmSSm3egdq2fQDfIGdnEBvXkY861WtcSjG4YV7CePnu7HAWovsQd6HuXH2KPOaGL319Linx56G48yG8dbrb5hN9GIDON6zItbG7oKjOagEiUnkng0V/qqbZjF2YOGyOzTWI5feLWdMHfaWxtpz2nvfGOjaoIEhEATzWWeUv0c0bhp1lBBRnkw5DkXVyr/2ASstzZdF3h9ctDdaySJnAHJ4M9TM2xzuvR5OCw3zXHqXBZEOSRYTjtuaq504IPg8IxyKetWl4rjWabSfrHAecfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rn6N+MRWywy0+KKXtYfJF+8n2iVZle2r79DKDWrEsQ=;
 b=NOJriABLFOztYor2dyWeKgi+eZPv0AToh6QI10TpxO6lspLre7xgvp7m5mkAzA/NETL1pvbCIq2bbPILFJxs5StrK3CNK8LfCSZAZG6WSivIPQ1uNDpKbDgrpSqhPwq84uYeX09ZPvB7fqe4SeW3kbuhFni1TsXvrYeTte+OgGFS2AXv19fIWVcTU47eYlD2Ya9hmivHlBUEneQD31hU5fSUfgG42hRnZnfP3i4CFUVq0+A49UBqD4yxnBIe2STtIYuuS/gwzFPYTPKT+CL6ZWQQrBsZ8cr9StX8Nxh/bxrbdvfMko7NEnHT4IunUs9F9nrl2+r3uqukurZMalDLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 02:43:39 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%7]) with mapi id 15.20.6455.028; Fri, 30 Jun 2023
 02:43:38 +0000
Date: Fri, 30 Jun 2023 10:43:27 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
References: <202306192245.d77d7216-oliver.sang@intel.com>
 <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020>
 <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3>
 <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3>
 <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2d590c-e0b3-4542-51eb-08db7913ce37
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWt3BigJp9HYkID/Q2c3N07CWKs4v1Rc0D2rXOPYCIWkh8fYzomF5TGbOW3AsmoijJeuTMuvfWRJgnvemGEkeh8vHxoaKlws2kH0ZWS8BAxSRLuu/IWEJf8LOCUwMEdwWM/mtrYNWz+dEc21IjSf6/eczRAb4jkrdmGwCxs3mgXobJS6QK6+2fSi0EsWCTIrH3dGst2qYgNDYxUDyvNGViuMlJe+a92pqeZp+h7HFAsBB/lqv0wZ18i02I1NqT93xpPgXf6E+XXfyJjXSeAAkm2StV6An+Gr7lWGVYqx1pOoARfVlH/J7lYz0+qruo8AabK9bV88teRadh6Wxwtr8juxCGTIzCD4S+E8/XZATqtPCiKSk8Gkmst5Q8mDQdX7hArwerjO3DggI/TzxairKFEjvBlcv4HKM8Y1AAoGHfZArFUxIJ+8CEpBFu9l8jaxw15YNWVrhzZyjlUOzc4WbQmE8E3O6ms/Y2NwRmD+GqZTUip7HEqfRbodo/zQdMHr3kgUrfvtZAqD/5nTttVbX22AAoJudSqLzwMD6173I3/2/RK4ORoXozUscmUkGl029vPMfdiKy2KgtAjIHS7yb+Ui59Y17nDiulCjQHeEjW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199021)(83380400001)(6666004)(19627235002)(478600001)(6486002)(966005)(66946007)(2906002)(107886003)(186003)(9686003)(26005)(30864003)(66476007)(66556008)(6512007)(53546011)(33716001)(6506007)(316002)(41300700001)(44832011)(38100700002)(5660300002)(8676002)(6916009)(8936002)(4326008)(86362001)(82960400001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERQamRUb25NRmJZVjl0K0M2YlJxTUJKbWNmbHZ0d09sdDRNSWZ1ZDg2QUVo?=
 =?utf-8?B?QlZYbEdYVzBTK0dhNWpsUU0xOWZZcjU4Q0liK2htRk5vYzdlejVrWjZOczRL?=
 =?utf-8?B?d0dqcTBibWQ3T1hoVElpZU82K3pYamhhYkk5dU5SazZ5eGpEOWM3YThMTzJh?=
 =?utf-8?B?bUcxRHNxTkR5R2w5V2dkZVdyeFErOVUvMXpFaWUwZ2M2SElpTVlidS9acDRM?=
 =?utf-8?B?KzN4ZjdxNXkxNHpMZmJxUmdIemFYd0FkVlJqMXhBZ21XSitSVTFRbVJienh4?=
 =?utf-8?B?dk1BVUJCZThURVlBbFZMVlI3c3NYZzVlK09aRVdYWDhGQlN3NEFSbU1qQWEz?=
 =?utf-8?B?eUNkRXc2Zm5OcG43MzA1RnZXRGl4UVNUZUZLbEp6Z3EyQ053Uzk3L0JDcjRK?=
 =?utf-8?B?cmRPd0hzd0J0K0hQMzY3eDdUWUh4WHltZ3JkTHF2dldLQ2RLL3ptK3dDTklR?=
 =?utf-8?B?ZVMxNmYxT3dwdXBBZkpVVlJhKzZVT1hiMVMzR0lER2xEbjFUSGY3SCt4QTht?=
 =?utf-8?B?ZWhHcUR2WWFxSEJlUlBweFY2Vm92OVZPbUJVQWd4bUEyMFVOREpCdTJXcisv?=
 =?utf-8?B?c1pCdXhZZ2EwTXN0K1YweW1pVXc5bEJONmQxM1l2SzRoaFdjdFg1MVhzTVI2?=
 =?utf-8?B?YVZmcTYvQ1hCM3Q4d2VsZTdVWVIrcFpUdXgxTkxXd0JCNmdiOWh1Z3J5Z1My?=
 =?utf-8?B?eVpuTmxtRC81OS9JcjRSOHNFN1VOMGFBNTMwL0FVbnVZNTc3MkE3aktlK1ZZ?=
 =?utf-8?B?WHRVakZ0ZjNGaVBnSlN5NHl2WlRvN1pzKzdhYVc2dHhEZzVxbVpxSjh4b0p4?=
 =?utf-8?B?MFIzZ2UrcnhQYzJOVmkvLzgzdm00R1JaKzZQUUpIS0VBRGIrOFRNd3k4bXd2?=
 =?utf-8?B?R0RhN2ZRblZSY3BGQllYMVBlNzNZRU5qYnltL3NRczExT3VLdjdOYWpNc2Fo?=
 =?utf-8?B?MmRGbEFxajRmcTNEb2JYWjFVeHlqVUhQNVYvYnRObGoxWlN4RHJZdU1jRFVX?=
 =?utf-8?B?akYza3VydHdtQTdOUG9KeDdhRDZoSkY5WVBSa3NXdks5Q1FHVnJxYXpjb0Jh?=
 =?utf-8?B?cmpsQlI4WlJ0eUVyb2lJVSsxbFMwNUllakloWUV2NlpuMFpRYTgxRGp3Qk1s?=
 =?utf-8?B?SjBjMGhsbkd5eXgyWVFacndYRXQ4aXg3TDVKaStBaElCZUVMdk5KK3JYSStu?=
 =?utf-8?B?SU9TNkdvSkVlNUlMTGM4c0o3Vk5qZm9JS1RVY3RDa3lPRk5KUmtXQzF2Z3Jt?=
 =?utf-8?B?dENEZEJMa0cySGpoMW5JeWFYcTJmOFpHTVlzVlJlelQ3VzRJQ1gwMFFmUWl4?=
 =?utf-8?B?RjduRU9SUFJTQUtvVmp2KzI5SnBLVXhxZWlvbERpeGs2RUJwaDVpWVI0NHhN?=
 =?utf-8?B?NlB6ZUpReW5qb3dTT0NzRlk1akRvbW9RM0F6TERZY3lRL3RPWmxJWVQrZ1NG?=
 =?utf-8?B?T2ZLMjlHUFBpL1BQeTVJTVdrNjVaaVJlRko1SXo1d1RMc0EzY0FUS0hBWDNM?=
 =?utf-8?B?cWEvMTNwVWZ5WnJISFJxUjhWZzdoVHZKS2pHV2c1Z1ByQ0pMVmhqRmx3V2lt?=
 =?utf-8?B?cTZvKzhaMGlFM0FNVE5sZ0xSYVlwalRiTG5yb211SEwvTHpXeVA1RURrSjln?=
 =?utf-8?B?NE0zVU9vNTE1VzF1cEg3cDYzUjFLMFFlaUU3QjZYd1JxL1V0WDM2U2IzSjll?=
 =?utf-8?B?TjVUcWVVelJhK29DQ25BTG9KNnloVjlJUmVXVFZjUGpSck5wano5MWdXa3JY?=
 =?utf-8?B?L2l4RENYZ1VTVGsyd0paa1J4VTFrQVU1Q1J5WTdzOGh2VUh0WjMzc2t1MDdR?=
 =?utf-8?B?V01WNlZMUzFRcVVmZkovSVJPZkFBdndzamZxT093RUtPbWFvMmo1aDk3YWR1?=
 =?utf-8?B?SGZpVFhEVWdTd0pxNVloajYyN0taRndubW5DT01FRDVrdjFxbEN1Z0M5VjVm?=
 =?utf-8?B?Nk02ZWIrdXk5SWhPaW56VmozSTEyR2J4UE1ZU2piZyttd05KQXliYVNtS2pP?=
 =?utf-8?B?bXpZREx6MWwwVXBySHZDeEdxM3RPcG04VWZwTDlKN2ZMMWk0eWtETWExaTc4?=
 =?utf-8?B?bjdaSWVJZFFCZml5ZmpHWG1BT1VRSWloR2JRUHVET09PVkp6TmZjdlZpSkJU?=
 =?utf-8?B?OFdEUjJoc0RPSFRCUU05MU8zTVVBUTZ3MnhtNEMvN2FjVmR3Nkk0TzZza1Bt?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2d590c-e0b3-4542-51eb-08db7913ce37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 02:43:38.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFbBtauEe7XpQHAjHhDkz9UM9AMulHeYoyfs4NTDOUzqC6p4v2U0NaClbb8c5ErBeafvFNofIYMT26gP9JlaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
X-OriginatorOrg: intel.com

hi, Amir,

On Tue, Jun 27, 2023 at 12:51:00PM +0300, Amir Goldstein wrote:
> On Tue, Jun 27, 2023 at 10:54 AM Jan Kara <jack@suse.cz> wrote:
> >
> > On Mon 26-06-23 18:13:55, Amir Goldstein wrote:
> > > On Mon, Jun 26, 2023 at 4:31 PM Jan Kara <jack@suse.cz> wrote:
> > > >
> > > > Hi Amir!
> > > >
> > > > On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> > > > > On Fri, Jun 23, 2023 at 5:48 PM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > > > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> > > > > > > On Tue, Jun 20, 2023 at 4:44 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > > > > > > kernel test robot noticed a -13.0% regression of stress-ng.ramfs.ops_per_sec on:
> > > > > > > >
> > > > > > > >
> > > > > > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement 'vfs write barriers'")
> > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > >
> > > > > > >
> > > > > > > Considering that this commit only adds helpers but never uses them
> > > > > > > this regression is a bit surprising.
> > > > > > >
> > > > > > > You had reported regressions in the past on the next commit:
> > > > > > > "vfs: prepare for pre-modify permission events on write"
> > > > > > >
> > > > > > > which made sense and I had since fixed and you verified.
> > > > > > >
> > > > > > > The only suspect I can think of is that adding the new s_write_*
> > > > > > > members to struct super_block had split the frequently access
> > > > > > > members s_fsnotify_connectors and s_readonly_remount into
> > > > > > > different cachelines.
> > > > > > >
> > > > > > > I've moved those new members to another location in the
> > > > > > > super_block struct and pushed the new branch to:
> > > > > > >
> > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > >
> > > > > > > I've added another commit at the tip of this branch:
> > > > > > > 67d1802889f0 ("fsnotify: activate sb write barriers for permission
> > > > > > > event watchers")
> > > > > > >
> > > > > > > This commit also adds a new member to struct super_block,
> > > > > > > next to s_fsnotify_connectors and s_readonly_remount, but this
> > > > > > > new member is also frequently accessed.
> > > > > > >
> > > > > > > I am hoping that you can also verify that the tip commit does not
> > > > > > > cause a regression.
> > > > > >
> > > > > > I finished the test on updated branch, but seems regression not be fixed.
> > > > > >
> > > > > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
> > > > > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > > > > >   309b0dd357c60 vfs: prepare for pre-modify permission events on write
> > > > > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers
> > > > > >
> > > > > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
> > > > > > ---------------- --------------------------- --------------------------- ---------------------------
> > > > > >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> > > > > >              \          |                \          |                \          |                \
> > > > > >    1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
> > > > > >      22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > > > > >
> > > > > > all detail comparison is as below, I also attached the config to build all
> > > > > > these four kernels.
> > > > > >
> > > > >
> > > > > Thank you Oliver!
> > > > >
> > > > > Jan,
> > > > >
> > > > > Do you have an idea of what might be going on here?
> > > >
> > > > Not really.
> > > >
> > > > > The only code change in the regressing commit is the addition
> > > > > of the s_write_* members to super_block and the addition of
> > > > > init_srcu_struct() call in alloc_super().
> > > > >
> > > > > Unless I am missing something.
> > > >
> > > > No, you are right. But it could also be some code alignment changing after
> > > > adding those new functions. Can you reproduce the regression on your
> > > > machine?
> > >
> > > I have not tried yet.
> > >
> > > > If yes, you could have a look at some micro-architectural perf
> > > > counters like iTLB misses or similar to see e.g. whether code of some hot
> > > > function didn't get split among two cachelines or similar issue. There's
> > > > also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in determining
> > > > whether function alignment is the issue or not.
> > > >
> > >
> > > There is a lot of perf information in the report below, e.g.:
> > >
> > > >    1259329 ±  2%    +405.3%    6363306          +404.5%    6353871          +408.1%    6398089        perf-stat.ps.cache-misses
> > > >     182239 ±  2%     +40.1%     255227 ±  9%     +38.0%     251400 ± 14%     +23.9%     225874 ±  6%  perf-stat.ps.dTLB-load-misses
> > > >      98768 ±  6%    +131.3%     228477          +130.1%     227267 ±  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses
> >
> > Ah, OK. I got bored by turbostat, vmstat and other counters before
> > scrolling down to these ;). So looking at these stats it seems that
> > data accesses are incurring more cache misses. The truth is that struct
> > srcu_struct is huge (some 112 bytes) so maybe some frequently accessed
> > fields got split into different cachelines with its addition. Have you
> > tried putting it at the end of struct super_block just to rule this out? I
> > know you already had it elsewhere in struct super_block but I don't think
> > it was at the end.
> 
> You are right.
> Let's try that.
> 
> Oliver can you please re-test:
> 
> * aeeb99484d27 - (sb_write_barrier) fsnotify: activate sb write
> barriers for permission event watchers
> * be794cb66c8f - vfs: prepare for pre-modify permission events on aio write
> * 010093856383 - vfs: prepare for pre-modify permission events on write
> * b31ab27476aa - vfs: implement 'vfs write barriers'

we observed the regression still exists

c739513bb7c55afd b31ab27476aad4585990f14fff9 01009385638362b28c86922863b aeeb99484d2743fe77b4fa7efae
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
   1494636           -14.6%    1276216 ±  2%     -15.4%    1264758           -15.4%    1264992 ±  2%  stress-ng.ramfs.ops
     24910           -14.6%      21270 ±  2%     -15.4%      21079           -15.4%      21083 ±  2%  stress-ng.ramfs.ops_per_sec

detail data are as below [1] (in order to avoid that table looks messy, I
ignored the data for be794cb66c8f since it's similar to 010093856383,
if you still need it, please let me know)


> 
> BTW, Oliver, from your experience, are the following reports of memory
> usage increase reliable:
> 
> >      17796        +48024.2%    8564575        +47827.4%    8529539        +48034.7%    8566438        meminfo.Percpu
> >      91742          +311.6%     377568          +310.0%     376107          +311.2%     377278        meminfo.SUnreclaim
> >     187447          +152.3%     472983          +151.6%     471592          +152.1%     472612        meminfo.Slab
> >      20441         +2173.2%     464664         +2164.2%     462832         +2173.5%     464731        meminfo.VmallocUsed

let me highlight what we got this time:

     17916        +52463.1%    9417643        +52127.1%    9357436        +51529.3%    9250341        meminfo.Percpu
     91506          +343.7%     405984          +341.4%     403941          +337.6%     400384        meminfo.SUnreclaim
    187356          +167.7%     501479          +166.5%     499365          +164.7%     495855        meminfo.Slab
     20457         +2388.0%     508989         +2372.4%     505807         +2345.3%     500259        meminfo.VmallocUsed

> 
> Thanks,
> Amir.


[1]
=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s

commit:
  c739513bb7c55a (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
  b31ab27476aad4 vfs: implement 'vfs write barriers'
  01009385638362 vfs: prepare for pre-modify permission events on write
  aeeb99484d2743 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers

c739513bb7c55afd b31ab27476aad4585990f14fff9 01009385638362b28c86922863b aeeb99484d2743fe77b4fa7efae
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 2.151e+09            +0.6%  2.164e+09            +0.4%   2.16e+09            -0.2%  2.148e+09        cpuidle..time
   3459995            -0.9%    3428310            -1.1%    3421235            -1.5%    3408232        cpuidle..usage
     93.42            +0.3%      93.68            +0.6%      93.99            -0.2%      93.20        uptime.boot
      3143            +0.3%       3152            +0.7%       3164            -0.2%       3136        uptime.idle
     20.98            -1.0%      20.77            -0.3%      20.90            -1.8%      20.61        boot-time.boot
     11.37            -0.5%      11.31            +0.4%      11.41            -0.2%      11.34        boot-time.dhcp
    705.80            -1.1%     697.97            -0.3%     703.53 ±  2%      -1.9%     692.73        boot-time.idle
     15.67 ± 14%     +58.5%      24.83 ± 26%     +31.9%      20.67 ± 12%     +60.6%      25.17 ± 20%  perf-c2c.DRAM.local
    202.17 ± 13%     -11.6%     178.67 ± 10%     -24.1%     153.50 ±  9%     -22.4%     156.83 ±  9%  perf-c2c.HITM.local
    202.17 ± 13%     -11.6%     178.67 ± 10%     -24.1%     153.50 ±  9%     -22.4%     156.83 ±  9%  perf-c2c.HITM.total
     93.59            +0.0%      93.59            +0.0%      93.62            +0.0%      93.59        iostat.cpu.idle
      0.19 ± 47%      -3.5%       0.19 ± 15%     -20.5%       0.15 ± 20%      -5.6%       0.18 ± 19%  iostat.cpu.iowait
      3.59            +1.8%       3.65            +2.2%       3.67            +1.4%       3.64        iostat.cpu.system
      2.63            -2.3%       2.57            -2.8%       2.56            -1.6%       2.59        iostat.cpu.user
     93.51            +0.0       93.52            +0.0       93.55            +0.0       93.51        mpstat.cpu.all.idle%
      0.18 ± 51%      -0.0        0.17 ± 16%      -0.0        0.14 ± 21%      -0.0        0.17 ± 18%  mpstat.cpu.all.iowait%
      0.57 ±  2%      +0.0        0.58 ±  6%      +0.0        0.58 ±  4%      -0.0        0.57 ±  3%  mpstat.cpu.all.irq%
      0.14 ±  7%      -0.1        0.09 ± 41%      -0.0        0.11 ± 27%      -0.0        0.11 ± 26%  mpstat.cpu.all.soft%
      2.92            +0.1        3.03 ±  2%      +0.1        3.02            +0.1        3.01        mpstat.cpu.all.sys%
      2.67            -0.1        2.61            -0.1        2.60            -0.0        2.63        mpstat.cpu.all.usr%
     62.14            +0.0%      62.14            -0.1%      62.06            -0.1%      62.06        time.elapsed_time
     62.14            +0.0%      62.14            -0.1%      62.06            -0.1%      62.06        time.elapsed_time.max
     13.33 ± 28%     -10.0%      12.00 ± 33%     -10.0%      12.00 ± 50%     -30.0%       9.33 ± 31%  time.file_system_inputs
   1500605           -11.9%    1322337 ±  2%     -12.7%    1310670           -12.6%    1310884 ±  2%  time.involuntary_context_switches
      0.33 ±141%    +100.0%       0.67 ±111%    -100.0%       0.00            +0.0%       0.33 ±141%  time.major_page_faults
      6960            -1.4%       6864            -1.4%       6864            -0.7%       6912        time.maximum_resident_set_size
      9355            +0.2%       9376            +0.2%       9376            -0.1%       9349        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        time.page_size
     78.83            +1.3%      79.83            +1.5%      80.00            +1.1%      79.67        time.percent_of_cpu_this_job_got
     41.22            +5.2%      43.35            +5.7%      43.58            +4.6%      43.12        time.system_time
      7.93           -18.2%       6.49 ±  3%     -20.7%       6.29           -16.1%       6.66 ±  7%  time.user_time
    181989 ±  3%     -14.0%     156595 ±  4%      -9.7%     164420 ±  4%     -11.7%     160659 ±  6%  time.voluntary_context_switches
     93.00            +0.0%      93.00            +0.0%      93.00            +0.0%      93.00        vmstat.cpu.id
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        vmstat.cpu.sy
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.wa
     15.00            +0.0%      15.00            -7.8%      13.83 ± 18%      +0.0%      15.00        vmstat.io.bi
    361.00 ±  8%     +13.9%     411.00 ± 19%      +2.6%     370.33 ±  3%      +6.1%     383.17 ±  5%  vmstat.io.bo
      2066            -0.1%       2064            +0.3%       2073            +0.5%       2077        vmstat.memory.buff
   3211766            -0.4%    3197936            -0.5%    3196397            -0.6%    3193878        vmstat.memory.cache
 1.277e+08            -7.4%  1.183e+08            -7.3%  1.183e+08            -7.3%  1.184e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
      2.00            -8.3%       1.83 ± 20%      +0.0%       2.00            +0.0%       2.00        vmstat.procs.r
    137558           -10.0%     123863 ±  3%     -10.5%     123179           -10.1%     123606        vmstat.system.cs
     80524            -4.9%      76583            -5.1%      76449            -4.9%      76618        vmstat.system.in
   1494636           -14.6%    1276216 ±  2%     -15.4%    1264758           -15.4%    1264992 ±  2%  stress-ng.ramfs.ops
     24910           -14.6%      21270 ±  2%     -15.4%      21079           -15.4%      21083 ±  2%  stress-ng.ramfs.ops_per_sec
     62.14            +0.0%      62.14            -0.1%      62.06            -0.1%      62.06        stress-ng.time.elapsed_time
     62.14            +0.0%      62.14            -0.1%      62.06            -0.1%      62.06        stress-ng.time.elapsed_time.max
     13.33 ± 28%     -10.0%      12.00 ± 33%     -10.0%      12.00 ± 50%     -30.0%       9.33 ± 31%  stress-ng.time.file_system_inputs
   1500605           -11.9%    1322337 ±  2%     -12.7%    1310670           -12.6%    1310884 ±  2%  stress-ng.time.involuntary_context_switches
      0.33 ±141%    +100.0%       0.67 ±111%    -100.0%       0.00            +0.0%       0.33 ±141%  stress-ng.time.major_page_faults
      6960            -1.4%       6864            -1.4%       6864            -0.7%       6912        stress-ng.time.maximum_resident_set_size
      9355            +0.2%       9376            +0.2%       9376            -0.1%       9349        stress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        stress-ng.time.page_size
     78.83            +1.3%      79.83            +1.5%      80.00            +1.1%      79.67        stress-ng.time.percent_of_cpu_this_job_got
     41.22            +5.2%      43.35            +5.7%      43.58            +4.6%      43.12        stress-ng.time.system_time
      7.93           -18.2%       6.49 ±  3%     -20.7%       6.29           -16.1%       6.66 ±  7%  stress-ng.time.user_time
    181989 ±  3%     -14.0%     156595 ±  4%      -9.7%     164420 ±  4%     -11.7%     160659 ±  6%  stress-ng.time.voluntary_context_switches
    260.50            -0.1%     260.33            +0.1%     260.67            +0.2%     261.00        turbostat.Avg_MHz
      6.94            +0.0        6.97            +0.0        6.96            +0.0        6.95        turbostat.Busy%
      3753            -0.4%       3739            -0.2%       3744            +0.1%       3756        turbostat.Bzy_MHz
    128565           -14.2%     110319 ±  2%     -14.2%     110293 ±  2%     -11.3%     114073 ±  3%  turbostat.C1
      0.29 ±  6%      +0.0        0.30 ±  9%      +0.0        0.30 ±  5%      +0.0        0.30 ±  9%  turbostat.C1%
   1201508            -1.4%    1184713            -1.9%    1178903            -1.8%    1179410        turbostat.C1E
      6.34 ±  7%      -0.3        6.09 ±  3%      -0.4        5.97            -0.3        6.07 ±  2%  turbostat.C1E%
   2037657            +0.9%    2055662            +0.9%    2056175            +0.1%    2040573        turbostat.C6
     86.71            +0.2       86.93            +0.3       87.06            +0.2       86.95        turbostat.C6%
     92.13            -0.3%      91.86            -0.3%      91.89            +0.0%      92.16        turbostat.CPU%c1
      0.93 ± 13%     +26.7%       1.18 ± 56%     +24.3%       1.16 ± 32%      -4.8%       0.89 ± 12%  turbostat.CPU%c6
     41.50            +0.4%      41.67 ±  2%      +0.8%      41.83            +0.0%      41.50        turbostat.CoreTmp
      0.43            -1.2%       0.42            +0.0%       0.43 ±  2%      +0.8%       0.43        turbostat.IPC
   5263810            -4.7%    5017889            -4.8%    5009411            -5.1%    4995749        turbostat.IRQ
     88519 ±  4%     -17.3%      73199 ±  3%     -17.5%      73071 ±  3%     -20.3%      70570 ±  7%  turbostat.POLL
      0.02 ± 33%      -0.0        0.01            -0.0        0.01            -0.0        0.01        turbostat.POLL%
      0.52 ± 20%     +39.5%       0.73 ± 95%     +25.2%       0.66 ± 55%     -13.4%       0.45 ± 19%  turbostat.Pkg%pc2
     40.50            +0.8%      40.83            +1.6%      41.17 ±  3%      +1.6%      41.17 ±  2%  turbostat.PkgTmp
     88.50            -0.2%      88.35            -0.2%      88.36            +0.3%      88.72        turbostat.PkgWatt
     10.06           +14.8%      11.55           +14.3%      11.50           +15.4%      11.61        turbostat.RAMWatt
      3000            -0.0%       3000            -0.0%       3000            -0.0%       3000        turbostat.TSC_MHz
    278438            -4.3%     266437            -4.9%     264711            -6.0%     261851        meminfo.Active
    276326            -4.3%     264324            -5.0%     262585            -6.0%     259726        meminfo.Active(anon)
      2112            +0.0%       2112            +0.6%       2125            +0.5%       2123        meminfo.Active(file)
     52436 ± 19%      -1.5%      51662 ± 12%      +9.9%      57606 ± 13%      -2.6%      51082 ± 19%  meminfo.AnonHugePages
    304269            -0.3%     303376            +0.1%     304491            +0.3%     305184        meminfo.AnonPages
      2065            -0.1%       2063            +0.3%       2071            +0.6%       2076        meminfo.Buffers
   3113813            -0.4%    3100773            -0.5%    3098986            -0.6%    3096122        meminfo.Cached
  65801608            -0.0%   65801583            +0.0%   65801608            +0.0%   65801608        meminfo.CommitLimit
    791180            -1.7%     777441            -1.9%     775986            -2.1%     774335        meminfo.Committed_AS
 1.264e+08            -1.9%  1.239e+08 ±  2%      -0.6%  1.257e+08            -0.1%  1.262e+08        meminfo.DirectMap1G
   7259136 ± 19%     +33.4%    9680896 ± 27%      +9.7%    7963648 ± 30%      +2.6%    7446186 ± 28%  meminfo.DirectMap2M
    296864 ± 12%      +8.4%     321781 ±  8%      -1.8%     291402 ±  9%      -4.1%     284576 ± 12%  meminfo.DirectMap4k
     15.17 ± 29%      -5.5%      14.33 ± 26%      +4.4%      15.83 ± 24%     -11.0%      13.50 ± 26%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    328967            -0.6%     326964            -0.2%     328366            +0.0%     329132        meminfo.Inactive
    328780            -0.6%     326775            -0.2%     328178            +0.0%     328944        meminfo.Inactive(anon)
    186.83            +0.9%     188.50            +0.7%     188.17            +0.5%     187.83 ±  3%  meminfo.Inactive(file)
     95850            -0.4%      95494            -0.4%      95423            -0.4%      95469        meminfo.KReclaimable
      9017            +0.1%       9026            -0.2%       9003            -0.1%       9010        meminfo.KernelStack
     47082            -0.1%      47014            -1.0%      46627            -0.3%      46943        meminfo.Mapped
 1.269e+08            -7.3%  1.176e+08            -7.2%  1.177e+08            -7.2%  1.178e+08        meminfo.MemAvailable
 1.277e+08            -7.2%  1.184e+08            -7.2%  1.185e+08            -7.1%  1.186e+08        meminfo.MemFree
 1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08        meminfo.MemTotal
   3908078          +236.8%   13162351          +235.2%   13101042          +232.4%   12990710        meminfo.Memused
     11.00            -1.5%      10.83 ±  3%      -1.5%      10.83 ±  3%      +0.0%      11.00        meminfo.Mlocked
      3978            +1.4%       4033            +1.2%       4025            +1.0%       4018        meminfo.PageTables
     17916        +52463.1%    9417643        +52127.1%    9357436        +51529.3%    9250341        meminfo.Percpu
     95850            -0.4%      95494            -0.4%      95423            -0.4%      95469        meminfo.SReclaimable
     91506          +343.7%     405984          +341.4%     403941          +337.6%     400384        meminfo.SUnreclaim
    301039            -4.4%     287932            -4.9%     286142            -5.9%     283346        meminfo.Shmem
    187356          +167.7%     501479          +166.5%     499365          +164.7%     495855        meminfo.Slab
   2812531            +0.0%    2812597            +0.0%    2812596            +0.0%    2812535        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
     20457         +2388.0%     508989         +2372.4%     505807         +2345.3%     500259        meminfo.VmallocUsed
      0.00          -100.0%       0.00          -100.0%       0.00       +3.3e+101%       0.33 ±223%  meminfo.Writeback
   4085777          +222.2%   13162365          +220.7%   13101097          +218.0%   12990730        meminfo.max_used_kB
    130.00 ± 13%      +9.1%     141.83 ±  9%      -2.2%     127.17 ± 10%      -4.7%     123.83 ± 14%  proc-vmstat.direct_map_level2_splits
      3.50 ± 39%     +66.7%       5.83 ± 43%     +19.0%       4.17 ± 56%      +4.8%       3.67 ± 56%  proc-vmstat.direct_map_level3_splits
     69081            -4.3%      66080            -5.0%      65646            -6.0%      64931        proc-vmstat.nr_active_anon
    528.00            -0.0%     527.83            +0.6%     531.00            +0.5%     530.50        proc-vmstat.nr_active_file
     76067            -0.3%      75844            +0.1%      76123            +0.3%      76294        proc-vmstat.nr_anon_pages
     25.00 ± 20%      -0.7%      24.83 ± 12%     +10.0%      27.50 ± 13%      -1.3%      24.67 ± 19%  proc-vmstat.nr_anon_transparent_hugepages
     10.00 ± 11%     +51.7%      15.17 ± 85%     +53.3%      15.33 ± 89%      -1.7%       9.83 ±  9%  proc-vmstat.nr_dirtied
      3.33 ± 33%      +0.0%       3.33 ± 33%     +10.0%       3.67 ± 25%      -5.0%       3.17 ± 28%  proc-vmstat.nr_dirty
   3166552            -7.3%    2935528            -7.2%    2937060            -7.2%    2939814        proc-vmstat.nr_dirty_background_threshold
   6340847            -7.3%    5878235            -7.2%    5881301            -7.2%    5886817        proc-vmstat.nr_dirty_threshold
    778972            -0.4%     775708            -0.5%     775265            -0.6%     774549        proc-vmstat.nr_file_pages
     38.00            +0.0%      38.00            +0.0%      38.00            +0.0%      38.00        proc-vmstat.nr_foll_pin_acquired
     38.00            +0.0%      38.00            +0.0%      38.00            +0.0%      38.00        proc-vmstat.nr_foll_pin_released
  31923815            -7.2%   29610190            -7.2%   29625524            -7.1%   29653113        proc-vmstat.nr_free_pages
     82199            -0.6%      81692            -0.2%      82047            +0.0%      82235        proc-vmstat.nr_inactive_anon
     46.50            +0.7%      46.83            +0.4%      46.67            +0.0%      46.50 ±  3%  proc-vmstat.nr_inactive_file
      9018            +0.1%       9026            -0.2%       9003            -0.1%       9010        proc-vmstat.nr_kernel_stack
     11774            -0.2%      11754            -1.0%      11657            -0.3%      11735        proc-vmstat.nr_mapped
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.nr_mlock
    994.33            +1.4%       1007            +1.2%       1005            +1.0%       1004        proc-vmstat.nr_page_table_pages
     75262            -4.4%      71983            -5.0%      71536            -5.9%      70836        proc-vmstat.nr_shmem
     23962            -0.4%      23872            -0.4%      23854            -0.4%      23867        proc-vmstat.nr_slab_reclaimable
     22874          +343.7%     101495          +341.5%     100984          +337.6%     100096        proc-vmstat.nr_slab_unreclaimable
    703132            +0.0%     703149            +0.0%     703148            +0.0%     703133        proc-vmstat.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_writeback
      8.83 ± 13%      -3.8%       8.50 ± 13%      -3.8%       8.50 ± 13%     +67.9%      14.83 ± 85%  proc-vmstat.nr_written
     69081            -4.3%      66080            -5.0%      65646            -6.0%      64931        proc-vmstat.nr_zone_active_anon
    528.00            -0.0%     527.83            +0.6%     531.00            +0.5%     530.50        proc-vmstat.nr_zone_active_file
     82199            -0.6%      81692            -0.2%      82047            +0.0%      82235        proc-vmstat.nr_zone_inactive_anon
     46.50            +0.7%      46.83            +0.4%      46.67            +0.0%      46.50 ±  3%  proc-vmstat.nr_zone_inactive_file
    703132            +0.0%     703149            +0.0%     703148            +0.0%     703133        proc-vmstat.nr_zone_unevictable
      3.00 ± 27%     +11.1%       3.33 ± 33%     +16.7%       3.50 ± 21%      +5.6%       3.17 ± 28%  proc-vmstat.nr_zone_write_pending
   1264482          +349.7%    5685840 ±  2%    +346.1%    5640927          +345.7%    5635536 ±  2%  proc-vmstat.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1264401          +349.0%    5676992          +345.9%    5637774          +345.7%    5635533 ±  2%  proc-vmstat.numa_local
    103400            -4.6%      98687            -5.1%      98172            -5.6%      97610        proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2037538 ±  2%    +204.9%    6213077          +204.3%    6200353          +204.0%    6193772 ±  2%  proc-vmstat.pgalloc_normal
    209302            -0.3%     208631            -0.5%     208322            -0.8%     207641        proc-vmstat.pgfault
   1914919 ±  2%     -28.8%    1364285           -27.2%    1394718 ±  3%     -27.5%    1388620 ±  3%  proc-vmstat.pgfree
      1008            +0.0%       1008            -7.5%     932.00 ± 18%      +0.0%       1008        proc-vmstat.pgpgin
     22667 ±  9%     +13.6%      25748 ± 23%      +3.0%      23357 ±  4%      +1.5%      23006 ±  3%  proc-vmstat.pgpgout
      7533            +0.0%       7533            +0.2%       7549 ±  2%      -0.4%       7503        proc-vmstat.pgreuse
     45.50 ±  5%      +1.8%      46.33 ±  5%      +3.7%      47.17 ±  3%      -1.8%      44.67 ±  5%  proc-vmstat.thp_collapse_alloc
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%  proc-vmstat.thp_deferred_split_page
      0.67 ± 70%     -25.0%       0.50 ±100%    +200.0%       2.00 ± 40%    +200.0%       2.00 ± 76%  proc-vmstat.thp_fault_alloc
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
    152.33            +1.2%     154.17 ±  2%      +0.4%     153.00            +1.9%     155.17        proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
      2.50 ± 44%      +0.0%       2.50 ± 44%      +0.0%       2.50 ± 44%      +0.0%       2.50 ± 44%  proc-vmstat.unevictable_pgs_munlocked
      3.13 ±  3%     +45.3%       4.55 ± 38%     +19.2%       3.73           +17.3%       3.67        perf-stat.i.MPKI
 2.743e+09            -2.1%  2.686e+09            -1.8%  2.693e+09            -1.6%  2.698e+09        perf-stat.i.branch-instructions
      1.50            +0.1        1.57 ±  9%      +0.0        1.52            +0.0        1.51        perf-stat.i.branch-miss-rate%
  40822308            -1.7%   40138528            -0.4%   40666799            -0.5%   40620172        perf-stat.i.branch-misses
      3.49 ±  3%     +10.7       14.15           +10.7       14.15           +10.7       14.22 ±  2%  perf-stat.i.cache-miss-rate%
   1429291 ±  2%    +392.3%    7036197          +396.3%    7092993          +393.5%    7053216        perf-stat.i.cache-misses
  41770774           +18.7%   49572144           +20.1%   50167253           +18.9%   49654101        perf-stat.i.cache-references
    143540           -10.3%     128751 ±  3%     -10.4%     128587           -10.2%     128872 ±  2%  perf-stat.i.context-switches
      0.68           +10.9%       0.75 ± 19%      -0.0%       0.68            -0.3%       0.67        perf-stat.i.cpi
     36001            -0.0%      36001            +0.0%      36002            -0.0%      36001        perf-stat.i.cpu-clock
 9.034e+09            -0.0%  9.034e+09            +0.2%  9.054e+09            +0.2%   9.05e+09        perf-stat.i.cpu-cycles
    651.50 ±  4%      -0.3%     649.38 ± 10%      -0.8%     646.32 ±  4%      -0.5%     648.40 ±  9%  perf-stat.i.cpu-migrations
     17762 ±  5%     -92.3%       1364           -92.4%       1347           -92.3%       1360        perf-stat.i.cycles-between-cache-misses
      0.01 ± 19%      +0.0        0.02 ±113%      +0.0        0.01 ±  4%      +0.0        0.01 ±  8%  perf-stat.i.dTLB-load-miss-rate%
    183606 ± 10%     +46.9%     269691 ±  6%     +38.0%     253304 ±  4%     +40.9%     258642 ±  9%  perf-stat.i.dTLB-load-misses
 2.914e+09            +1.4%  2.953e+09            +1.9%  2.969e+09            +2.1%  2.974e+09        perf-stat.i.dTLB-loads
      0.01 ±  6%      +0.0        0.02 ± 33%      +0.0        0.01 ±  2%      +0.0        0.01 ±  4%  perf-stat.i.dTLB-store-miss-rate%
     98479 ±  4%    +136.3%     232665 ±  4%    +134.7%     231168          +130.4%     226850 ±  3%  perf-stat.i.dTLB-store-misses
 1.726e+09            +4.5%  1.804e+09            +5.3%  1.817e+09            +5.5%  1.821e+09        perf-stat.i.dTLB-stores
     65.64            -1.3       64.36            -1.1       64.59            -0.2       65.43        perf-stat.i.iTLB-load-miss-rate%
   3514645            -6.7%    3277853 ±  2%      -6.9%    3273670 ±  2%      -4.3%    3362057        perf-stat.i.iTLB-load-misses
   1818691            -1.0%    1799853 ±  2%      -2.5%    1773607 ±  2%      -3.3%    1758101        perf-stat.i.iTLB-loads
 1.345e+10            -0.6%  1.337e+10            -0.2%  1.342e+10            -0.1%  1.344e+10        perf-stat.i.instructions
      3903            +6.1%       4141            +7.5%       4196 ±  2%      +4.5%       4079        perf-stat.i.instructions-per-iTLB-miss
      1.49            -1.0%       1.47            -0.4%       1.48            -0.1%       1.48        perf-stat.i.ipc
      0.08 ± 43%    +266.6%       0.29 ± 22%    +269.7%       0.29 ± 28%    +320.7%       0.33 ± 31%  perf-stat.i.major-faults
      0.25            -0.0%       0.25            +0.2%       0.25            +0.2%       0.25        perf-stat.i.metric.GHz
     94.79 ±  4%     +96.1%     185.91 ±  7%     +79.8%     170.47 ±  4%     +81.4%     171.92 ±  7%  perf-stat.i.metric.K/sec
    206.21            +0.9%     208.11            +1.4%     209.11            +1.6%     209.49        perf-stat.i.metric.M/sec
      1851            -1.2%       1828            -1.1%       1830            -1.3%       1827        perf-stat.i.minor-faults
    202895 ±  2%     +80.9%     367099           +83.3%     371936           +82.3%     369955        perf-stat.i.node-loads
    326912 ±  4%    +843.5%    3084337 ±  8%    +806.4%    2963117 ±  5%    +815.5%    2993003 ± 10%  perf-stat.i.node-stores
      1851            -1.2%       1829            -1.1%       1831            -1.3%       1828        perf-stat.i.page-faults
     36001            -0.0%      36001            +0.0%      36002            -0.0%      36001        perf-stat.i.task-clock
      3.11           +19.4%       3.71           +20.4%       3.74           +18.9%       3.69        perf-stat.overall.MPKI
      1.49            +0.0        1.49            +0.0        1.51            +0.0        1.51        perf-stat.overall.branch-miss-rate%
      3.43 ±  3%     +10.8       14.19           +10.7       14.14           +10.8       14.21 ±  2%  perf-stat.overall.cache-miss-rate%
      0.67            +0.6%       0.68            +0.4%       0.67            +0.2%       0.67        perf-stat.overall.cpi
      6322 ±  3%     -79.7%       1283           -79.8%       1276           -79.7%       1283        perf-stat.overall.cycles-between-cache-misses
      0.01 ± 10%      +0.0        0.01 ±  6%      +0.0        0.01 ±  4%      +0.0        0.01 ±  9%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ±  4%      +0.0        0.01 ±  4%      +0.0        0.01 ±  2%      +0.0        0.01 ±  4%  perf-stat.overall.dTLB-store-miss-rate%
     65.90            -1.3       64.55            -1.0       64.85            -0.2       65.66        perf-stat.overall.iTLB-load-miss-rate%
      3827            +6.6%       4079            +7.2%       4101 ±  2%      +4.5%       3998        perf-stat.overall.instructions-per-iTLB-miss
      1.49            -0.6%       1.48            -0.4%       1.48            -0.2%       1.49        perf-stat.overall.ipc
 2.699e+09            -2.0%  2.644e+09            -1.8%   2.65e+09            -1.6%  2.655e+09        perf-stat.ps.branch-instructions
  40177680            -1.7%   39505970            -0.4%   40025613            -0.5%   39976522        perf-stat.ps.branch-misses
   1407448 ±  2%    +392.1%    6925474          +396.0%    6981242          +393.2%    6941622        perf-stat.ps.cache-misses
  41108281           +18.7%   48790366           +20.1%   49374477           +18.9%   48866474        perf-stat.ps.cache-references
    141257           -10.3%     126717 ±  3%     -10.4%     126553           -10.2%     126826 ±  2%  perf-stat.ps.context-switches
     35430            +0.0%      35434            +0.0%      35432            -0.0%      35429        perf-stat.ps.cpu-clock
 8.891e+09            +0.0%  8.891e+09            +0.2%  8.911e+09            +0.2%  8.906e+09        perf-stat.ps.cpu-cycles
    641.15 ±  4%      -0.3%     639.12 ± 10%      -0.8%     636.10 ±  4%      -0.5%     638.11 ±  9%  perf-stat.ps.cpu-migrations
    180716 ± 10%     +46.9%     265469 ±  6%     +38.0%     249314 ±  4%     +40.9%     254549 ±  9%  perf-stat.ps.dTLB-load-misses
 2.867e+09            +1.4%  2.906e+09            +1.9%  2.922e+09            +2.1%  2.927e+09        perf-stat.ps.dTLB-loads
     96918 ±  4%    +136.3%     228993 ±  4%    +134.7%     227512          +130.3%     223249 ±  3%  perf-stat.ps.dTLB-store-misses
 1.699e+09            +4.5%  1.776e+09            +5.3%  1.788e+09            +5.5%  1.792e+09        perf-stat.ps.dTLB-stores
   3458811            -6.7%    3226129 ±  2%      -6.8%    3221930 ±  2%      -4.3%    3308721        perf-stat.ps.iTLB-load-misses
   1789784            -1.0%    1771432 ±  2%      -2.5%    1745558 ±  2%      -3.3%    1730190        perf-stat.ps.iTLB-loads
 1.323e+10            -0.6%  1.316e+10            -0.2%  1.321e+10            -0.1%  1.323e+10        perf-stat.ps.instructions
      0.08 ± 43%    +266.6%       0.28 ± 22%    +269.7%       0.28 ± 28%    +320.7%       0.32 ± 31%  perf-stat.ps.major-faults
      1822            -1.2%       1800            -1.1%       1801            -1.3%       1798        perf-stat.ps.minor-faults
    199758 ±  2%     +80.9%     361351           +83.3%     366096           +82.3%     364132        perf-stat.ps.node-loads
    321839 ±  4%    +843.2%    3035717 ±  8%    +806.1%    2916343 ±  5%    +815.2%    2945595 ± 10%  perf-stat.ps.node-stores
      1822            -1.2%       1800            -1.1%       1802            -1.3%       1799        perf-stat.ps.page-faults
     35430            +0.0%      35434            +0.0%      35432            -0.0%      35429        perf-stat.ps.task-clock
 8.349e+11            +0.2%  8.365e+11            +0.3%  8.375e+11            -0.1%  8.343e+11        perf-stat.total.instructions
     13.98 ±223%    +127.2%      31.77 ±142%   +2303.0%     336.05 ±136%    +530.5%      88.18 ±127%  sched_debug.cfs_rq:/.MIN_vruntime.avg
    503.45 ±223%    +127.2%       1143 ±142%   +2064.4%      10896 ±129%    +530.5%       3174 ±127%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
     82.73 ±223%    +127.2%     187.94 ±142%   +2079.2%       1802 ±129%    +530.5%     521.68 ±127%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.36 ± 10%     +14.3%       0.41 ± 16%      +1.3%       0.36 ±  9%     +10.4%       0.39 ± 12%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.17 ± 31%      +0.0%       1.17 ± 31%     +57.1%       1.83 ± 37%     +28.6%       1.50 ± 33%  sched_debug.cfs_rq:/.h_nr_running.max
      0.49 ±  8%      +0.2%       0.50 ±  5%      +8.7%       0.54 ± 13%      +5.4%       0.52 ±  7%  sched_debug.cfs_rq:/.h_nr_running.stddev
     17588 ± 62%     +25.4%      22050 ±103%    +131.1%      40640 ± 81%     +77.9%      31284 ± 66%  sched_debug.cfs_rq:/.load.avg
    240716 ±153%     +68.2%     404944 ±186%    +207.6%     740443 ±102%    +209.4%     744720 ±100%  sched_debug.cfs_rq:/.load.max
     46421 ±123%     +55.1%      71999 ±168%    +206.6%     142336 ± 97%    +169.3%     125009 ± 95%  sched_debug.cfs_rq:/.load.stddev
    614.58 ± 22%      +9.0%     670.10 ± 10%     +11.9%     687.64 ± 11%     +12.1%     689.12 ± 12%  sched_debug.cfs_rq:/.load_avg.avg
     17259 ± 29%      +5.6%      18230 ± 12%      +5.4%      18189 ± 18%      +9.8%      18957 ± 18%  sched_debug.cfs_rq:/.load_avg.max
      0.67 ±165%    +125.0%       1.50 ±223%    -100.0%       0.00           -50.0%       0.33 ±223%  sched_debug.cfs_rq:/.load_avg.min
      2832 ± 29%      +5.4%       2985 ± 12%      +5.2%       2980 ± 18%      +9.7%       3106 ± 17%  sched_debug.cfs_rq:/.load_avg.stddev
     13.98 ±223%    +127.2%      31.77 ±142%   +2303.4%     336.11 ±136%    +530.5%      88.18 ±127%  sched_debug.cfs_rq:/.max_vruntime.avg
    503.45 ±223%    +127.2%       1143 ±142%   +2064.8%      10898 ±129%    +530.5%       3174 ±127%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
     82.73 ±223%    +127.2%     187.94 ±142%   +2079.6%       1803 ±129%    +530.5%     521.68 ±127%  sched_debug.cfs_rq:/.max_vruntime.stddev
      4299 ±  4%      +3.1%       4434            +0.5%       4319 ±  7%      +1.5%       4364 ±  4%  sched_debug.cfs_rq:/.min_vruntime.avg
     37190 ±  6%      -7.3%      34459 ± 11%      -0.3%      37092 ±  8%     -11.8%      32805 ±  8%  sched_debug.cfs_rq:/.min_vruntime.max
      1327 ± 22%     +13.5%       1506 ± 21%      +6.0%       1408 ± 23%      -3.8%       1277 ± 19%  sched_debug.cfs_rq:/.min_vruntime.min
      6410 ±  3%      -2.1%       6275 ±  4%      +0.2%       6425 ±  3%      -3.2%       6207 ±  2%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.35 ±  9%     +15.8%       0.41 ± 16%      +1.3%       0.36 ±  8%     +10.5%       0.39 ± 13%  sched_debug.cfs_rq:/.nr_running.avg
      1.17 ± 31%      +0.0%       1.17 ± 31%     +42.9%       1.67 ± 44%     +28.6%       1.50 ± 33%  sched_debug.cfs_rq:/.nr_running.max
      0.49 ±  5%      +2.1%       0.50 ±  5%      +8.8%       0.53 ± 13%      +5.4%       0.51 ±  6%  sched_debug.cfs_rq:/.nr_running.stddev
     47.11 ± 28%     +58.5%      74.65 ± 46%     +99.7%      94.07 ± 37%     +67.4%      78.87 ± 50%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1019            +0.1%       1020            +0.2%       1022            +0.4%       1024        sched_debug.cfs_rq:/.removed.load_avg.max
    211.04 ± 15%     +20.2%     253.77 ± 25%     +36.5%     288.12 ± 17%     +22.5%     258.54 ± 26%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     20.40 ± 36%     +14.7%      23.40 ± 66%     +67.2%      34.10 ± 30%     +12.6%      22.97 ± 46%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    479.00 ± 19%     -18.8%     388.83 ± 47%      +8.0%     517.17 ±  4%     -10.4%     429.17 ± 23%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     92.29 ± 25%      -9.9%      83.18 ± 54%     +22.5%     113.05 ± 14%      -7.1%      85.78 ± 29%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     20.39 ± 36%     +14.6%      23.38 ± 66%     +67.0%      34.04 ± 30%     +12.3%      22.89 ± 46%  sched_debug.cfs_rq:/.removed.util_avg.avg
    478.67 ± 19%     -18.8%     388.50 ± 47%      +7.8%     516.17 ±  4%     -10.5%     428.50 ± 23%  sched_debug.cfs_rq:/.removed.util_avg.max
     92.25 ± 25%      -9.9%      83.12 ± 54%     +22.3%     112.85 ± 14%      -7.1%      85.66 ± 29%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    621.59 ±  2%      +0.7%     625.69 ±  7%      +2.0%     633.85 ±  6%      -1.5%     612.39 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
      1946 ± 25%     -21.4%       1529 ± 11%      -8.3%       1785 ± 20%     -24.3%       1472 ± 12%  sched_debug.cfs_rq:/.runnable_avg.max
      2.67 ±103%     +31.2%       3.50 ±101%     -37.5%       1.67 ± 82%     +18.8%       3.17 ± 64%  sched_debug.cfs_rq:/.runnable_avg.min
    436.76 ± 18%      -9.1%     396.89 ±  4%      -6.8%     407.13 ± 16%     -20.7%     346.22 ± 11%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00          -100.0%       0.00       +5.7e+100%       0.06 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.avg
      0.00          -100.0%       0.00         +2e+102%       2.04 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.max
      0.00          -100.0%       0.00       +3.4e+101%       0.34 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.stddev
    -24533           -30.8%     -16988            -9.9%     -22106           -17.5%     -20239        sched_debug.cfs_rq:/.spread0.avg
      8397 ±116%     +55.4%      13046 ± 58%     +27.4%      10701 ± 83%      -1.9%       8238 ± 85%  sched_debug.cfs_rq:/.spread0.max
    -27548           -27.7%     -19927            -9.0%     -25063           -15.3%     -23346        sched_debug.cfs_rq:/.spread0.min
      6423 ±  3%      -2.2%       6282 ±  4%      +0.2%       6438 ±  3%      -3.2%       6220 ±  2%  sched_debug.cfs_rq:/.spread0.stddev
    618.75 ±  2%      +0.7%     623.19 ±  7%      +2.0%     631.15 ±  6%      -1.6%     608.83 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
      1938 ± 25%     -21.4%       1522 ± 11%      -8.4%       1775 ± 20%     -24.3%       1467 ± 12%  sched_debug.cfs_rq:/.util_avg.max
      2.67 ±103%     -12.5%       2.33 ± 76%     -31.2%       1.83 ±115%      +6.3%       2.83 ± 51%  sched_debug.cfs_rq:/.util_avg.min
    435.25 ± 18%      -9.1%     395.84 ±  4%      -6.9%     405.37 ± 16%     -20.8%     344.80 ± 10%  sched_debug.cfs_rq:/.util_avg.stddev
     39.39 ± 30%      +0.9%      39.76 ±  5%     +19.4%      47.04 ± 29%      +5.0%      41.35 ± 22%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    486.67 ±  4%      -1.0%     482.00 ±  4%      -1.4%     480.00 ±  3%      -2.5%     474.67 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.max
    122.93 ± 14%      -0.7%     122.10 ±  4%      +6.4%     130.74 ± 18%      +1.9%     125.23 ± 10%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    452191 ±  6%      +0.8%     455964 ±  7%      +3.6%     468532 ±  5%      +2.4%     463257 ±  9%  sched_debug.cpu.avg_idle.avg
    958038 ±  6%      +4.4%    1000000            +0.2%     959614 ±  9%      +0.4%     962287 ±  8%  sched_debug.cpu.avg_idle.max
      2998 ± 19%     -16.1%       2516 ±  7%     +20.0%       3598 ± 54%      -0.1%       2994 ± 20%  sched_debug.cpu.avg_idle.min
    217619 ± 14%      -0.4%     216820 ± 10%      +7.7%     234278 ± 13%      -1.3%     214848 ± 12%  sched_debug.cpu.avg_idle.stddev
     29460            -0.5%      29310            +1.0%      29767            -0.4%      29332        sched_debug.cpu.clock.avg
     29461            -0.5%      29311            +1.0%      29768            -0.4%      29333        sched_debug.cpu.clock.max
     29459            -0.5%      29308            +1.0%      29765            -0.4%      29331        sched_debug.cpu.clock.min
      0.72 ± 12%      -5.8%       0.68 ± 13%      -0.8%       0.72 ± 10%      -4.6%       0.69 ±  9%  sched_debug.cpu.clock.stddev
     29435            -0.5%      29285            +1.0%      29742            -0.4%      29307        sched_debug.cpu.clock_task.avg
     29456            -0.5%      29306            +1.0%      29763            -0.4%      29328        sched_debug.cpu.clock_task.max
     29044            -0.5%      28888            +1.1%      29352            -0.4%      28920        sched_debug.cpu.clock_task.min
     67.57            +1.3%      68.43 ±  2%      -0.4%      67.28 ±  3%      -1.1%      66.83 ±  2%  sched_debug.cpu.clock_task.stddev
      1100 ± 12%     +16.1%       1277 ± 10%      -4.8%       1048 ±  9%      +6.2%       1168 ± 13%  sched_debug.cpu.curr->pid.avg
      3298            -0.0%       3297            -0.1%       3295            -0.0%       3297        sched_debug.cpu.curr->pid.max
      1519 ±  3%      +3.0%       1565 ±  2%      -1.6%       1494 ±  2%      +0.8%       1530 ±  3%  sched_debug.cpu.curr->pid.stddev
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.avg
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      4294            -0.0%       4294            +0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            +0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.max
      4294            -0.0%       4294            +0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 12%     +16.1%       0.00 ± 33%      +6.4%       0.00 ± 27%     -12.5%       0.00 ± 20%  sched_debug.cpu.next_balance.stddev
      0.35 ± 12%     +14.5%       0.40 ± 16%      +3.9%       0.37 ± 10%     +10.5%       0.39 ± 11%  sched_debug.cpu.nr_running.avg
      1.17 ± 31%      +0.0%       1.17 ± 31%     +57.1%       1.83 ± 37%     +28.6%       1.50 ± 33%  sched_debug.cpu.nr_running.max
      0.49 ±  9%      +0.5%       0.49 ±  5%      +8.0%       0.53 ± 10%      +5.7%       0.52 ±  8%  sched_debug.cpu.nr_running.stddev
      5033            -0.1%       5030            +0.0%       5034            +0.1%       5036        sched_debug.cpu.nr_switches.avg
     31067 ± 11%      +6.3%      33033 ±  7%      +2.9%      31977 ±  6%     +15.9%      35993 ±  8%  sched_debug.cpu.nr_switches.max
    347.17 ± 12%      +6.4%     369.50 ± 15%     +19.2%     413.83 ±  8%      +9.9%     381.67 ± 15%  sched_debug.cpu.nr_switches.min
      6943 ±  8%      +6.7%       7406 ±  5%      +0.6%       6981 ±  4%      +8.6%       7540 ±  7%  sched_debug.cpu.nr_switches.stddev
 2.346e+09 ± 10%      -5.9%  2.207e+09 ±  9%     -12.7%  2.048e+09 ± 14%     -14.4%  2.008e+09 ± 13%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%    -100.0%       0.00        sched_debug.cpu.nr_uninterruptible.min
 2.123e+09            +0.6%  2.136e+09            +0.1%  2.124e+09 ±  2%      +0.2%  2.127e+09        sched_debug.cpu.nr_uninterruptible.stddev
     29459            -0.5%      29309            +1.0%      29765            -0.4%      29331        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            +0.0%  4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
     29408            -0.5%      29258            +1.0%      29714            -0.4%      29280        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
     29480            -0.5%      29331            +1.0%      29786            -0.4%      29352        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
     11.09 ±  8%      -2.2        8.91 ± 13%      -2.9        8.23 ± 15%      -2.4        8.64 ± 19%  perf-profile.calltrace.cycles-pp.umount2
     10.70 ±  8%      -2.1        8.60 ± 13%      -2.7        7.98 ± 15%      -2.4        8.34 ± 19%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
     10.66 ±  8%      -2.1        8.57 ± 13%      -2.7        7.93 ± 15%      -2.4        8.30 ± 19%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      7.23 ±  8%      -1.4        5.83 ± 15%      -1.8        5.39 ± 15%      -1.6        5.61 ± 19%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      5.03 ±  8%      -0.9        4.10 ± 14%      -1.3        3.78 ± 15%      -1.1        3.90 ± 19%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      4.39 ±  6%      -0.9        3.51 ±  9%      -1.0        3.40 ± 13%      -0.8        3.55 ± 13%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.57 ±  9%      -0.9        3.71 ± 13%      -1.2        3.41 ± 15%      -1.0        3.54 ± 18%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.31 ±  6%      -0.9        3.45 ±  9%      -1.0        3.32 ± 13%      -0.8        3.46 ± 14%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.59 ±  8%      -0.8        2.80 ± 12%      -1.0        2.58 ± 10%      -0.9        2.68 ± 20%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.11 ±  9%      -0.7        2.39 ± 13%      -0.9        2.20 ± 11%      -0.8        2.28 ± 20%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
      4.21 ± 12%      -0.7        3.49 ± 10%      -0.3        3.96 ± 12%      -0.4        3.79 ±  8%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.35 ± 10%      -0.7        2.67 ± 16%      -0.8        2.51 ± 13%      -0.6        2.75 ± 19%  perf-profile.calltrace.cycles-pp.stress_rndstr
      3.36 ±  8%      -0.7        2.68 ± 10%      -0.9        2.50 ± 14%      -0.7        2.64 ± 19%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      4.09 ± 13%      -0.7        3.41 ± 10%      -0.2        3.85 ± 12%      -0.4        3.70 ±  8%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      3.37 ±  8%      -0.7        2.69 ± 10%      -0.9        2.51 ± 14%      -0.7        2.66 ± 19%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      3.00 ±  9%      -0.7        2.34 ± 13%      -0.9        2.14 ± 11%      -0.8        2.22 ± 20%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
      2.93 ±  9%      -0.7        2.28 ± 12%      -0.8        2.09 ± 11%      -0.8        2.17 ± 21%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
      3.10 ±  8%      -0.6        2.46 ± 11%      -0.8        2.28 ± 13%      -0.7        2.44 ± 18%  perf-profile.calltrace.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      2.90 ±  8%      -0.6        2.26 ± 12%      -0.8        2.07 ± 10%      -0.8        2.15 ± 21%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
      2.57 ±  8%      -0.6        1.93 ± 13%      -0.8        1.78 ± 10%      -0.7        1.85 ± 21%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
      3.27 ±  7%      -0.6        2.69 ±  8%      -0.4        2.86 ± 13%      -0.4        2.86 ±  6%  perf-profile.calltrace.cycles-pp.open64
      3.16 ±  7%      -0.6        2.60 ±  8%      -0.4        2.76 ± 13%      -0.4        2.74 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      3.14 ±  7%      -0.6        2.58 ±  8%      -0.4        2.74 ± 13%      -0.4        2.73 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      3.08 ±  7%      -0.5        2.53 ±  8%      -0.4        2.68 ± 13%      -0.4        2.67 ±  6%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      3.10 ±  7%      -0.5        2.56 ±  8%      -0.4        2.71 ± 13%      -0.4        2.69 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.16 ±  8%      -0.5        1.68 ± 18%      -0.6        1.56 ± 14%      -0.5        1.67 ± 20%  perf-profile.calltrace.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.52 ±  8%      -0.5        1.04 ± 17%      -0.5        0.98 ±  9%      -0.5        1.04 ± 23%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
      0.71 ± 14%      -0.5        0.24 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      1.71 ±  7%      -0.5        1.24 ± 14%      -0.6        1.14 ± 11%      -0.6        1.16 ± 18%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.71 ± 14%      -0.5        0.25 ±142%      -0.6        0.10 ±223%      -0.3        0.41 ±101%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      2.34 ±  9%      -0.4        1.88 ± 17%      -0.6        1.76 ± 14%      -0.5        1.82 ± 19%  perf-profile.calltrace.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      1.38 ±  8%      -0.4        0.96 ± 17%      -0.5        0.91 ± 10%      -0.4        0.94 ± 23%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
      0.51 ± 45%      -0.4        0.09 ±223%      -0.5        0.00            -0.4        0.08 ±223%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
      2.18 ±  8%      -0.4        1.80 ± 13%      -0.6        1.61 ± 12%      -0.5        1.64 ± 19%  perf-profile.calltrace.cycles-pp.unlink
      0.47 ± 45%      -0.4        0.09 ±223%      -0.4        0.09 ±223%      -0.4        0.09 ±223%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.20 ± 22%      -0.4        2.82 ± 21%      +0.2        3.37 ± 11%      +0.0        3.21 ± 22%  perf-profile.calltrace.cycles-pp.sd_device_new_from_syspath
      2.08 ±  8%      -0.4        1.72 ± 13%      -0.5        1.55 ± 12%      -0.5        1.56 ± 19%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      2.07 ±  8%      -0.4        1.70 ± 13%      -0.5        1.53 ± 11%      -0.5        1.55 ± 20%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.05 ±  7%      -0.4        1.69 ± 13%      -0.5        1.52 ± 11%      -0.5        1.54 ± 20%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.46 ± 45%      -0.4        0.10 ±223%      -0.4        0.08 ±223%      -0.3        0.19 ±141%  perf-profile.calltrace.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work
      0.36 ± 70%      -0.4        0.00            -0.4        0.00            -0.4        0.00        perf-profile.calltrace.cycles-pp.rcu_exp_wait_wake.process_one_work.worker_thread.kthread.ret_from_fork
      0.62 ±  6%      -0.3        0.29 ±102%      -0.6        0.00            -0.4        0.20 ±141%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64
      1.37 ±  9%      -0.3        1.04 ± 20%      -0.4        0.99 ± 16%      -0.3        1.07 ± 22%  perf-profile.calltrace.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61 ±  9%      -0.3        0.28 ±100%      -0.5        0.10 ±223%      -0.4        0.19 ±141%  perf-profile.calltrace.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.82 ± 23%      -0.3        2.49 ± 21%      +0.2        2.98 ± 12%      +0.0        2.83 ± 21%  perf-profile.calltrace.cycles-pp.device_set_syspath.sd_device_new_from_syspath
      0.50 ± 46%      -0.3        0.18 ±141%      -0.4        0.09 ±223%      -0.4        0.10 ±223%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
      1.86 ±  6%      -0.3        1.53 ± 12%      -0.5        1.38 ± 12%      -0.5        1.39 ± 19%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.60 ±  8%      -0.3        0.28 ±100%      -0.3        0.27 ±100%      -0.2        0.36 ± 70%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
      1.74 ± 10%      -0.3        1.42 ±  9%      -0.4        1.31 ± 13%      -0.4        1.39 ± 15%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.53 ± 47%      -0.3        0.21 ±142%      -0.4        0.09 ±223%      -0.2        0.34 ±101%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      2.64 ± 20%      -0.3        2.33 ± 19%      +0.1        2.77 ± 12%      +0.2        2.80 ± 22%  perf-profile.calltrace.cycles-pp.read
      2.58 ± 20%      -0.3        2.27 ± 19%      +0.1        2.68 ± 11%      +0.1        2.72 ± 22%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.59 ± 20%      -0.3        2.28 ± 19%      +0.1        2.70 ± 11%      +0.1        2.74 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.59 ± 20%      -0.3        2.29 ± 19%      +0.1        2.71 ± 11%      +0.2        2.75 ± 23%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      2.56 ± 20%      -0.3        2.25 ± 18%      +0.1        2.67 ± 11%      +0.1        2.70 ± 22%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.48 ± 45%      -0.3        0.18 ±141%      -0.4        0.09 ±223%      -0.3        0.18 ±141%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      0.70 ±  8%      -0.3        0.40 ± 71%      -0.3        0.39 ± 71%      -0.2        0.47 ± 46%  perf-profile.calltrace.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      2.39 ± 20%      -0.3        2.10 ± 19%      +0.1        2.47 ± 11%      +0.1        2.52 ± 23%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.44 ±  9%      -0.3        1.16 ± 16%      -0.3        1.11 ± 15%      -0.3        1.10 ± 14%  perf-profile.calltrace.cycles-pp.__lxstat64
      0.28 ±101%      -0.3        0.00            +0.0        0.29 ±101%      -0.1        0.18 ±141%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.49 ± 47%      -0.3        0.20 ±142%      -0.5        0.00            -0.2        0.32 ±102%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      1.16 ±  9%      -0.3        0.88 ± 19%      -0.3        0.82 ± 18%      -0.3        0.91 ± 22%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
      0.28 ±101%      -0.3        0.00            +0.0        0.28 ±101%      -0.1        0.18 ±141%  perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      1.12 ±  5%      -0.3        0.85 ± 14%      -0.3        0.83 ± 12%      -0.3        0.80 ± 46%  perf-profile.calltrace.cycles-pp.mkdir
      1.60 ±  9%      -0.3        1.33 ± 14%      -0.2        1.43 ± 14%      -0.2        1.43 ±  9%  perf-profile.calltrace.cycles-pp.__close
      0.36 ± 71%      -0.3        0.10 ±223%      -0.4        0.00            -0.4        0.00        perf-profile.calltrace.cycles-pp.down_write.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      4.10 ±  6%      -0.3        3.84 ± 14%      -0.6        3.51 ± 12%      -0.5        3.60 ± 20%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
      1.05 ±  4%      -0.3        0.80 ± 15%      -0.3        0.78 ± 13%      -0.3        0.74 ± 46%  perf-profile.calltrace.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.07 ±  4%      -0.3        0.81 ± 15%      -0.3        0.80 ± 12%      -0.3        0.76 ± 46%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
      1.06 ±  4%      -0.3        0.80 ± 15%      -0.3        0.79 ± 12%      -0.3        0.76 ± 46%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.36 ±  9%      -0.2        1.12 ± 13%      -0.2        1.21 ± 15%      -0.2        1.20 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.30 ± 10%      -0.2        1.06 ± 15%      -0.3        1.02 ± 13%      -0.3        0.99 ± 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.25 ±  8%      -0.2        1.00 ± 18%      -0.4        0.87 ± 16%      -0.3        0.98 ± 19%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      1.28 ±  9%      -0.2        1.03 ± 16%      -0.3        0.98 ± 14%      -0.3        0.96 ± 15%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.32 ± 10%      -0.2        1.07 ± 16%      -0.3        1.03 ± 13%      -0.3        1.00 ± 14%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.66 ± 10%      -0.2        0.41 ± 72%      -0.4        0.29 ±100%      -0.3        0.38 ± 71%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
      1.38 ±  9%      -0.2        1.13 ± 13%      -0.2        1.22 ± 16%      -0.2        1.22 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      2.04 ± 24%      -0.2        1.80 ± 22%      +0.2        2.21 ± 12%      +0.0        2.06 ± 21%  perf-profile.calltrace.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
      0.70 ± 49%      -0.2        0.46 ± 71%      +0.1        0.79 ±  9%      +0.0        0.75 ± 22%  perf-profile.calltrace.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.70 ± 49%      -0.2        0.46 ± 71%      +0.1        0.78 ±  9%      +0.1        0.75 ± 22%  perf-profile.calltrace.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.87 ± 11%      -0.2        0.63 ± 47%      -0.2        0.71 ± 11%      -0.2        0.64 ± 46%  perf-profile.calltrace.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.95 ±  9%      -0.2        0.72 ± 17%      -0.3        0.70 ± 17%      -0.3        0.65 ± 47%  perf-profile.calltrace.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.96 ±  3%      -0.2        0.72 ± 16%      -0.3        0.70 ± 12%      -0.3        0.67 ± 46%  perf-profile.calltrace.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.89 ± 25%      -0.2        1.66 ± 22%      +0.1        2.03 ± 12%      -0.0        1.88 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      1.90 ± 25%      -0.2        1.67 ± 22%      +0.1        2.04 ± 12%      +0.0        1.90 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      0.43 ± 71%      -0.2        0.20 ±143%      -0.2        0.19 ±142%      -0.1        0.29 ±100%  perf-profile.calltrace.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64
      0.79 ± 15%      -0.2        0.56 ± 45%      -0.4        0.38 ± 70%      -0.2        0.56 ± 48%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.66 ±  8%      -0.2        1.43 ± 19%      -0.3        1.35 ± 14%      -0.3        1.38 ± 21%  perf-profile.calltrace.cycles-pp.symlink
      1.85 ± 25%      -0.2        1.62 ± 21%      +0.1        1.99 ± 11%      -0.0        1.85 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath
      1.83 ± 25%      -0.2        1.60 ± 21%      +0.1        1.97 ± 12%      -0.0        1.82 ± 22%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64
      1.12 ±  9%      -0.2        0.90 ± 15%      -0.2        0.88 ± 14%      -0.3        0.84 ± 17%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.08 ± 12%      -0.2        0.85 ±  9%      -0.3        0.76 ± 11%      -0.2        0.84 ± 15%  perf-profile.calltrace.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      1.60 ±  8%      -0.2        1.38 ± 19%      -0.3        1.30 ± 14%      -0.3        1.32 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
      0.98 ±  9%      -0.2        0.76 ± 15%      -0.3        0.70 ± 14%      -0.3        0.65 ± 45%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.72 ± 14%      -0.2        0.50 ± 46%      -0.5        0.18 ±141%      -0.3        0.41 ± 72%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      1.59 ±  9%      -0.2        1.38 ± 19%      -0.3        1.30 ± 13%      -0.3        1.32 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      1.08 ±  7%      -0.2        0.87 ± 12%      -0.1        0.95 ± 17%      -0.1        0.94 ±  6%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.02 ± 11%      -0.2        0.81 ± 10%      -0.3        0.73 ± 12%      -0.2        0.80 ± 16%  perf-profile.calltrace.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run
      1.58 ±  9%      -0.2        1.37 ± 19%      -0.3        1.29 ± 13%      -0.3        1.31 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.21 ±141%      -0.2        0.00            -0.0        0.20 ±141%      -0.1        0.12 ±223%  perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.38 ± 72%      -0.2        0.17 ±141%      +0.0        0.40 ± 72%      -0.2        0.21 ±141%  perf-profile.calltrace.cycles-pp.__xstat64
      1.07 ±  8%      -0.2        0.86 ± 12%      -0.1        0.94 ± 17%      -0.1        0.93 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.00 ±  9%      -0.2        0.79 ± 12%      -0.3        0.73 ± 15%      -0.3        0.74 ± 45%  perf-profile.calltrace.cycles-pp.stress_mwc32
      0.72 ±  7%      -0.2        0.51 ± 46%      -0.3        0.46 ± 45%      -0.2        0.50 ± 46%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.40 ±  9%      -0.2        1.20 ± 19%      -0.3        1.15 ± 13%      -0.2        1.16 ± 20%  perf-profile.calltrace.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.28 ±101%      -0.2        0.08 ±223%      +0.0        0.29 ±101%      -0.1        0.19 ±141%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
      1.82 ± 19%      -0.2        1.62 ± 21%      +0.0        1.87 ± 11%      +0.1        1.89 ± 22%  perf-profile.calltrace.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
      0.92 ± 10%      -0.2        0.72 ± 19%      -0.4        0.54 ± 46%      -0.3        0.64 ± 46%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
      0.28 ±100%      -0.2        0.09 ±223%      +0.1        0.39 ± 71%      -0.1        0.20 ±141%  perf-profile.calltrace.cycles-pp.strcmp@plt
      1.03 ±  9%      -0.2        0.84 ± 16%      -0.2        0.84 ± 12%      -0.3        0.73 ± 45%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      0.39 ± 71%      -0.2        0.20 ±141%      +0.0        0.41 ± 72%      +0.2        0.54 ±  3%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.36 ± 71%      -0.2        0.18 ±141%      +0.0        0.39 ± 71%      +0.0        0.39 ± 72%  perf-profile.calltrace.cycles-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
      1.08 ± 12%      -0.2        0.89 ± 10%      -0.3        0.78 ± 18%      -0.3        0.81 ± 15%  perf-profile.calltrace.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      0.18 ±141%      -0.2        0.00            -0.2        0.00            -0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.54 ± 46%      -0.2        0.36 ± 70%      -0.4        0.19 ±141%      -0.4        0.19 ±142%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64
      0.26 ±100%      -0.2        0.09 ±223%      -0.3        0.00            -0.2        0.10 ±223%  perf-profile.calltrace.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp
      1.17 ±  8%      -0.2        1.00 ± 11%      -0.3        0.90 ± 14%      -0.2        0.98 ± 25%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
      1.16 ±  8%      -0.2        0.99 ± 11%      -0.3        0.89 ± 15%      -0.2        0.98 ± 25%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
      0.87 ± 11%      -0.2        0.70 ± 14%      -0.2        0.69 ± 13%      -0.3        0.57 ± 47%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.73 ± 48%      -0.2        0.56 ± 47%      +0.1        0.82 ±  9%      +0.1        0.78 ± 21%  perf-profile.calltrace.cycles-pp.readlinkat
      0.71 ± 49%      -0.2        0.55 ± 47%      +0.1        0.80 ±  9%      +0.1        0.76 ± 22%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
      0.71 ± 48%      -0.2        0.55 ± 47%      +0.1        0.80 ±  9%      +0.1        0.76 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.54 ± 46%      -0.2        0.38 ± 71%      -0.0        0.50 ± 45%      -0.2        0.33 ±103%  perf-profile.calltrace.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      0.77 ±  9%      -0.2        0.62 ± 15%      -0.2        0.56 ± 48%      -0.1        0.66 ±  6%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.92 ± 13%      -0.1        0.77 ± 12%      -0.3        0.66 ± 17%      -0.3        0.60 ± 45%  perf-profile.calltrace.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount
      0.87 ± 10%      -0.1        0.72 ± 13%      -0.2        0.67 ± 17%      -0.2        0.65 ± 47%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
      0.86 ± 10%      -0.1        0.72 ± 13%      -0.2        0.66 ± 17%      -0.2        0.64 ± 47%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      1.02 ± 12%      -0.1        0.88 ±  9%      -0.2        0.80 ± 14%      -0.2        0.83 ± 21%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.91 ± 10%      -0.1        0.77 ± 12%      -0.2        0.71 ± 16%      -0.1        0.78 ± 20%  perf-profile.calltrace.cycles-pp.rmdir
      0.85 ± 10%      -0.1        0.71 ± 13%      -0.2        0.66 ± 16%      -0.2        0.64 ± 47%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      0.63 ±  8%      -0.1        0.49 ± 45%      -0.3        0.28 ±100%      -0.2        0.42 ± 71%  perf-profile.calltrace.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread
      1.29 ± 24%      -0.1        1.16 ± 16%      +0.1        1.38 ± 11%      +0.1        1.36 ± 25%  perf-profile.calltrace.cycles-pp.malloc
      0.30 ±100%      -0.1        0.19 ±141%      +0.1        0.39 ± 71%      -0.1        0.22 ±145%  perf-profile.calltrace.cycles-pp.rdrand
      3.34 ±  6%      -0.1        3.23 ± 14%      -0.4        2.90 ± 12%      -0.3        3.01 ± 20%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      1.29 ± 17%      -0.1        1.18 ± 21%      +0.1        1.43 ± 18%      +0.2        1.47 ± 19%  perf-profile.calltrace.cycles-pp.siphash24_compress
      0.75 ±  9%      -0.1        0.64 ± 12%      -0.3        0.43 ± 72%      -0.2        0.58 ± 47%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      0.72 ± 46%      -0.1        0.62 ± 48%      +0.1        0.86 ± 13%      +0.1        0.79 ± 21%  perf-profile.calltrace.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.20 ±142%      -0.1        0.09 ±223%      -0.0        0.17 ±141%      -0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      0.10 ±223%      -0.1        0.00            +0.1        0.19 ±141%      -0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.19 ±142%      -0.1        0.09 ±223%      -0.1        0.08 ±223%      -0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      0.10 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount
      0.10 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.page_symlink.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt
      0.09 ±223%      -0.1        0.00            -0.1        0.00            +0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.list_lru_destroy.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.writeback_inodes_sb.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__fxstat64
      0.28 ±100%      -0.1        0.19 ±142%      -0.3        0.00            -0.3        0.00        perf-profile.calltrace.cycles-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.08 ±223%      -0.1        0.00            -0.1        0.00            +0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64
      0.08 ±223%      -0.1        0.00            -0.0        0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ± 11%      -0.1        0.72 ± 11%      -0.3        0.47 ± 71%      -0.2        0.59 ± 47%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      0.08 ±223%      -0.1        0.00            -0.1        0.00            +0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat
      0.08 ±223%      -0.1        0.00            -0.1        0.00            +0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc
      0.73 ± 13%      -0.1        0.67 ± 45%      -0.1        0.66 ± 48%      +0.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      1.70 ± 13%      -0.1        1.65 ± 13%      -0.1        1.63 ± 18%      -0.1        1.64 ± 10%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.13 ± 12%      -0.0        1.08 ± 13%      -0.1        1.06 ± 18%      -0.0        1.10 ± 13%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      1.22 ± 13%      -0.0        1.19 ± 11%      -0.0        1.19 ± 18%      -0.1        1.17 ± 12%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.14 ± 12%      -0.0        1.10 ± 13%      -0.1        1.08 ± 17%      -0.0        1.11 ± 13%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.65 ± 12%      -0.0        0.62 ± 18%      -0.1        0.52 ± 47%      -0.2        0.45 ± 71%  perf-profile.calltrace.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle
      0.66 ± 12%      -0.0        0.64 ± 18%      -0.1        0.53 ± 47%      -0.1        0.54 ± 47%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer
      2.08 ± 12%      -0.0        2.06 ± 10%      -0.1        2.00 ± 16%      -0.1        1.99 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.90 ± 12%      -0.0        0.88 ± 15%      -0.0        0.88 ± 16%      -0.0        0.88 ± 14%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      2.06 ± 12%      -0.0        2.05 ± 10%      -0.1        1.99 ± 16%      -0.1        1.98 ± 10%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.09 ±223%      -0.0        0.08 ±223%      -0.1        0.00            -0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.__do_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath
      0.10 ±223%      -0.0        0.09 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_lock_mount.do_new_mount.__x64_sys_mount
      0.18 ±141%      -0.0        0.18 ±141%      +0.3        0.47 ± 46%      +0.0        0.21 ±145%  perf-profile.calltrace.cycles-pp.path_compare
      0.09 ±223%      -0.0        0.09 ±223%      +0.2        0.28 ±100%      +0.2        0.29 ±101%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.sysfs_kf_seq_show.seq_read_iter.vfs_read.ksys_read.do_syscall_64
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.user_path_at_empty.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.access
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.access.sd_device_new_from_syspath
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.access.sd_device_new_from_syspath
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.access.sd_device_new_from_syspath
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.access.sd_device_new_from_syspath
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.siphash24_finalize
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.89 ± 16%      +0.0        0.89 ± 18%      -0.0        0.89 ± 25%      +0.1        0.94 ± 10%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      0.81 ± 14%      +0.0        0.82 ± 18%      -0.1        0.73 ± 48%      +0.0        0.85 ± 11%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      1.00 ± 15%      +0.0        1.02 ± 18%      -0.0        1.00 ± 24%      +0.1        1.05 ± 10%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      1.00 ± 15%      +0.0        1.02 ± 18%      +0.0        1.01 ± 24%      +0.1        1.06 ± 11%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.83 ± 14%      +0.0        0.85 ± 18%      -0.1        0.75 ± 48%      +0.0        0.88 ± 11%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      1.17 ± 16%      +0.0        1.19 ± 18%      -0.0        1.15 ± 26%      +0.1        1.24 ± 10%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.18 ± 16%      +0.0        1.20 ± 18%      -0.0        1.15 ± 26%      +0.1        1.24 ± 10%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.30 ± 16%      +0.0        1.34 ± 18%      -0.0        1.27 ± 25%      +0.1        1.38 ± 12%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.30 ± 16%      +0.0        1.34 ± 18%      -0.0        1.27 ± 25%      +0.1        1.38 ± 12%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.27 ± 16%      +0.0        1.32 ± 18%      -0.0        1.24 ± 25%      +0.1        1.35 ± 12%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.33 ±101%      +0.0        0.38 ± 73%      +0.2        0.49 ± 45%      +0.1        0.48 ± 48%  perf-profile.calltrace.cycles-pp.device_read_db_internal_filename
      1.33 ± 16%      +0.1        1.39 ± 18%      -0.0        1.31 ± 26%      +0.1        1.42 ± 13%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.37 ± 16%      +0.1        1.43 ± 18%      -0.0        1.34 ± 26%      +0.1        1.44 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.45 ± 16%      +0.1        1.52 ± 18%      -0.0        1.41 ± 27%      +0.1        1.53 ± 12%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      1.35 ± 16%      +0.1        1.42 ± 18%      -0.0        1.32 ± 26%      +0.1        1.44 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.percpu_free_rwsem.destroy_super_work.process_one_work.worker_thread.kthread
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.__queue_work.queue_work_on.synchronize_rcu_expedited.namespace_unlock.do_umount
      0.00            +0.1        0.09 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.destroy_super_work.process_one_work.worker_thread.kthread.ret_from_fork
      0.00            +0.1        0.09 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.queue_work_on.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount
      0.20 ±142%      +0.1        0.30 ±100%      -0.2        0.00            -0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.1        0.14 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.free_percpu.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq
      0.00            +0.1        0.14 ±223%      +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.__slab_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      2.78 ± 15%      +0.2        2.94 ±  7%      -0.1        2.63 ± 15%      -0.2        2.63 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +0.2        0.16 ±223%      +0.1        0.10 ±223%      +0.1        0.13 ±223%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      3.07 ± 14%      +0.2        3.24 ±  6%      -0.2        2.88 ± 14%      -0.2        2.90 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.09 ±223%      +0.2        0.31 ±100%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.10 ±223%      +0.2        0.33 ±100%      -0.1        0.00            -0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.10 ±223%      +0.2        0.32 ±100%      -0.1        0.00            -0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.3        0.32 ±157%      +0.1        0.12 ±223%      +0.1        0.13 ±223%  perf-profile.calltrace.cycles-pp.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      4.81 ±  3%      +0.7        5.55 ± 28%      -0.1        4.70 ± 20%      -0.1        4.69 ± 27%  perf-profile.calltrace.cycles-pp.ret_from_fork
      4.81 ±  3%      +0.7        5.55 ± 28%      -0.1        4.70 ± 20%      -0.1        4.69 ± 27%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
      0.00            +0.9        0.90 ± 13%      +0.8        0.82 ± 18%      +0.8        0.79 ± 46%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
      0.47 ± 73%      +1.1        1.52 ± 81%      +0.5        1.00 ± 72%      +0.3        0.79 ±124%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
      0.47 ± 73%      +1.1        1.54 ± 81%      +0.6        1.02 ± 72%      +0.3        0.80 ±124%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
      0.48 ± 73%      +1.1        1.57 ± 81%      +0.6        1.04 ± 72%      +0.3        0.81 ±123%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.48 ± 73%      +1.1        1.58 ± 81%      +0.6        1.04 ± 72%      +0.3        0.82 ±123%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.52 ± 73%      +1.1        1.64 ± 79%      +0.6        1.09 ± 70%      +0.4        0.94 ±103%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +2.1        2.13 ± 35%      +2.2        2.20 ± 26%      +2.1        2.12 ± 35%  perf-profile.calltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
     32.47 ± 13%      +3.0       35.50 ± 22%      +2.7       35.13 ± 20%      +1.4       33.90 ±  7%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     34.18 ± 12%      +3.1       37.24 ± 21%      +2.7       36.86 ± 19%      +1.4       35.56 ±  7%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     28.39 ± 16%      +3.2       31.55 ± 26%      +3.2       31.62 ± 21%      +1.8       30.18 ±  8%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     32.25 ± 13%      +3.3       35.56 ± 22%      +3.1       35.36 ± 20%      +1.6       33.83 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     33.45 ± 13%      +3.3       36.79 ± 21%      +3.0       36.46 ± 19%      +1.5       34.96 ±  8%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     32.84 ± 13%      +3.3       36.18 ± 22%      +3.1       35.90 ± 19%      +1.6       34.40 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     33.47 ± 13%      +3.3       36.82 ± 21%      +3.0       36.48 ± 19%      +1.5       34.98 ±  8%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     33.47 ± 13%      +3.3       36.82 ± 21%      +3.0       36.48 ± 19%      +1.5       34.98 ±  8%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     10.82 ±  8%      +3.7       14.49 ± 18%      +3.0       13.83 ± 17%      +3.4       14.27 ± 18%  perf-profile.calltrace.cycles-pp.mount
     10.73 ±  8%      +3.7       14.42 ± 18%      +3.0       13.78 ± 17%      +3.5       14.22 ± 18%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
     10.71 ±  8%      +3.7       14.41 ± 18%      +3.1       13.76 ± 17%      +3.5       14.20 ± 18%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
     10.68 ±  8%      +3.7       14.38 ± 18%      +3.1       13.74 ± 17%      +3.5       14.18 ± 18%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      9.72 ±  8%      +3.9       13.66 ± 18%      +3.3       13.04 ± 17%      +3.7       13.44 ± 18%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      3.72 ±  8%      +5.2        8.90 ± 21%      +5.0        8.69 ± 20%      +5.2        8.88 ± 20%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
      3.75 ±  8%      +5.2        8.93 ± 21%      +5.0        8.71 ± 20%      +5.2        8.90 ± 20%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +5.3        5.31 ± 28%      +5.4        5.42 ± 25%      +5.4        5.42 ± 26%  perf-profile.calltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
      2.20 ±  8%      +5.5        7.67 ± 22%      +5.4        7.58 ± 21%      +5.6        7.78 ± 21%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      2.01 ±  8%      +5.5        7.50 ± 22%      +5.4        7.43 ± 21%      +5.6        7.60 ± 21%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
      0.00            +6.0        6.01 ± 26%      +6.1        6.05 ± 24%      +6.1        6.14 ± 24%  perf-profile.calltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
     11.16 ±  8%      -2.2        8.96 ± 13%      -2.9        8.30 ± 15%      -2.5        8.70 ± 19%  perf-profile.children.cycles-pp.umount2
      7.23 ±  8%      -1.4        5.83 ± 14%      -1.8        5.39 ± 15%      -1.6        5.61 ± 19%  perf-profile.children.cycles-pp.__x64_sys_umount
     42.58 ±  5%      -1.4       41.19 ± 12%      -1.5       41.08 ± 12%      -0.7       41.88 ±  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     42.34 ±  5%      -1.4       40.98 ± 12%      -1.5       40.84 ± 12%      -0.7       41.65 ±  8%  perf-profile.children.cycles-pp.do_syscall_64
      2.55 ±  9%      -1.1        1.45 ± 56%      -0.9        1.65 ± 33%      -0.6        1.92 ± 33%  perf-profile.children.cycles-pp.__irq_exit_rcu
      5.05 ±  5%      -1.0        4.02 ±  8%      -1.0        4.01 ± 11%      -0.9        4.12 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      4.94 ±  5%      -1.0        3.92 ±  8%      -1.0        3.91 ± 11%      -0.9        4.04 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      4.82 ±  5%      -1.0        3.86 ±  8%      -1.0        3.82 ± 12%      -0.9        3.94 ± 11%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      5.04 ±  8%      -0.9        4.10 ± 14%      -1.3        3.78 ± 15%      -1.1        3.90 ± 19%  perf-profile.children.cycles-pp.path_umount
      5.24 ±  4%      -0.9        4.31 ± 17%      -1.0        4.19 ± 12%      -0.7        4.52 ± 11%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.75 ±  4%      -0.9        4.85 ± 15%      -1.0        4.72 ± 10%      -0.7        5.04 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      4.48 ±  5%      -0.9        3.60 ±  9%      -1.0        3.53 ± 12%      -0.8        3.65 ± 12%  perf-profile.children.cycles-pp.task_work_run
      4.57 ±  9%      -0.9        3.71 ± 13%      -1.2        3.41 ± 15%      -1.0        3.54 ± 18%  perf-profile.children.cycles-pp.do_umount
      3.30 ±  8%      -0.8        2.50 ± 14%      -1.0        2.25 ± 11%      -0.9        2.40 ± 21%  perf-profile.children.cycles-pp.alloc_vfsmnt
      3.59 ±  8%      -0.8        2.80 ± 12%      -1.0        2.58 ± 10%      -0.9        2.68 ± 20%  perf-profile.children.cycles-pp.attach_recursive_mnt
      4.96 ± 13%      -0.8        4.18 ± 12%      -0.2        4.71 ± 11%      -0.4        4.52 ±  9%  perf-profile.children.cycles-pp.do_sys_openat2
      4.99 ± 13%      -0.8        4.22 ± 12%      -0.2        4.74 ± 11%      -0.4        4.57 ±  9%  perf-profile.children.cycles-pp.__x64_sys_openat
      3.11 ±  9%      -0.7        2.40 ± 13%      -0.9        2.20 ± 11%      -0.8        2.28 ± 20%  perf-profile.children.cycles-pp.propagate_mnt
      3.57 ±  9%      -0.7        2.85 ± 16%      -0.9        2.69 ± 12%      -0.6        2.92 ± 19%  perf-profile.children.cycles-pp.stress_rndstr
      4.24 ± 12%      -0.7        3.53 ± 10%      -0.2        4.00 ± 12%      -0.4        3.82 ±  9%  perf-profile.children.cycles-pp.do_filp_open
      4.14 ± 13%      -0.7        3.46 ± 11%      -0.2        3.90 ± 12%      -0.4        3.73 ±  8%  perf-profile.children.cycles-pp.path_openat
      3.00 ±  9%      -0.7        2.34 ± 13%      -0.9        2.14 ± 11%      -0.8        2.22 ± 20%  perf-profile.children.cycles-pp.propagate_one
      3.12 ±  8%      -0.7        2.46 ± 10%      -0.8        2.28 ± 13%      -0.7        2.45 ± 18%  perf-profile.children.cycles-pp.cleanup_mnt
      2.93 ±  9%      -0.7        2.28 ± 12%      -0.8        2.10 ± 11%      -0.8        2.17 ± 21%  perf-profile.children.cycles-pp.copy_tree
      2.91 ±  8%      -0.7        2.26 ± 12%      -0.8        2.08 ± 10%      -0.8        2.15 ± 20%  perf-profile.children.cycles-pp.clone_mnt
      3.24 ±  6%      -0.7        2.58 ± 13%      -0.7        2.57 ± 11%      -0.6        2.66 ±  9%  perf-profile.children.cycles-pp.user_path_at_empty
      2.78 ±  8%      -0.6        2.18 ± 14%      -0.6        2.14 ± 12%      -0.5        2.25 ± 13%  perf-profile.children.cycles-pp.getname_flags
      3.30 ±  7%      -0.6        2.71 ±  8%      -0.4        2.88 ± 13%      -0.4        2.88 ±  6%  perf-profile.children.cycles-pp.open64
      1.53 ±  7%      -0.5        1.05 ± 17%      -0.5        0.99 ±  9%      -0.5        1.05 ± 23%  perf-profile.children.cycles-pp.__percpu_init_rwsem
      3.23 ± 14%      -0.5        2.76 ± 12%      -0.2        3.00 ±  9%      -0.3        2.91 ±  7%  perf-profile.children.cycles-pp.path_lookupat
      2.38 ±  9%      -0.5        1.92 ± 16%      -0.6        1.80 ± 14%      -0.5        1.86 ± 19%  perf-profile.children.cycles-pp.namespace_unlock
      2.12 ±  8%      -0.5        1.66 ± 14%      -0.5        1.62 ± 12%      -0.4        1.74 ± 14%  perf-profile.children.cycles-pp.strncpy_from_user
      2.98 ±  8%      -0.4        2.54 ± 12%      -0.3        2.70 ±  9%      -0.4        2.63 ±  3%  perf-profile.children.cycles-pp.link_path_walk
      2.58 ± 10%      -0.4        2.15 ± 11%      -0.3        2.25 ±  9%      -0.4        2.22 ±  2%  perf-profile.children.cycles-pp.filename_lookup
      2.12 ± 12%      -0.4        1.73 ± 14%      -0.6        1.50 ± 16%      -0.5        1.62 ± 18%  perf-profile.children.cycles-pp.mnt_get_count
      2.21 ±  8%      -0.4        1.82 ± 13%      -0.6        1.62 ± 12%      -0.6        1.66 ± 19%  perf-profile.children.cycles-pp.unlink
      3.67 ±  8%      -0.4        3.29 ± 15%      -0.4        3.23 ± 14%      -0.3        3.36 ±  2%  perf-profile.children.cycles-pp.__schedule
      3.20 ± 22%      -0.4        2.82 ± 21%      +0.2        3.37 ± 11%      +0.0        3.22 ± 22%  perf-profile.children.cycles-pp.sd_device_new_from_syspath
      2.06 ±  7%      -0.4        1.69 ± 13%      -0.5        1.52 ± 11%      -0.5        1.54 ± 20%  perf-profile.children.cycles-pp.__x64_sys_unlink
      1.86 ±  7%      -0.3        1.54 ± 12%      -0.5        1.38 ± 11%      -0.5        1.39 ± 19%  perf-profile.children.cycles-pp.do_unlinkat
      1.74 ± 10%      -0.3        1.42 ±  9%      -0.4        1.31 ± 13%      -0.4        1.39 ± 15%  perf-profile.children.cycles-pp.deactivate_locked_super
      2.82 ± 23%      -0.3        2.50 ± 21%      +0.2        2.99 ± 12%      +0.0        2.83 ± 21%  perf-profile.children.cycles-pp.device_set_syspath
      2.64 ± 20%      -0.3        2.34 ± 19%      +0.1        2.78 ± 12%      +0.2        2.81 ± 22%  perf-profile.children.cycles-pp.read
      1.39 ±  8%      -0.3        1.08 ± 12%      -0.2        1.15 ± 10%      -0.2        1.17 ±  7%  perf-profile.children.cycles-pp.kmem_cache_alloc
      2.58 ± 20%      -0.3        2.28 ± 19%      +0.1        2.69 ± 11%      +0.1        2.73 ± 22%  perf-profile.children.cycles-pp.ksys_read
      2.56 ± 20%      -0.3        2.26 ± 19%      +0.1        2.68 ± 11%      +0.1        2.71 ± 22%  perf-profile.children.cycles-pp.vfs_read
      1.56 ±  8%      -0.3        1.26 ± 17%      -0.4        1.12 ± 16%      -0.3        1.21 ± 19%  perf-profile.children.cycles-pp.mntput_no_expire
      1.60 ± 13%      -0.3        1.30 ± 13%      -0.2        1.41 ± 12%      -0.3        1.34 ±  4%  perf-profile.children.cycles-pp.vfs_fstatat
      2.40 ± 20%      -0.3        2.11 ± 19%      +0.1        2.48 ± 11%      +0.1        2.53 ± 23%  perf-profile.children.cycles-pp.seq_read_iter
      0.71 ± 14%      -0.3        0.42 ± 55%      -0.3        0.38 ± 31%      -0.1        0.58 ± 42%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.71 ± 14%      -0.3        0.42 ± 55%      -0.3        0.38 ± 31%      -0.1        0.58 ± 42%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.71 ± 14%      -0.3        0.42 ± 55%      -0.3        0.38 ± 31%      -0.1        0.58 ± 42%  perf-profile.children.cycles-pp.start_kernel
      0.71 ± 14%      -0.3        0.42 ± 55%      -0.3        0.38 ± 31%      -0.1        0.58 ± 42%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.71 ± 14%      -0.3        0.42 ± 55%      -0.3        0.38 ± 31%      -0.1        0.58 ± 42%  perf-profile.children.cycles-pp.rest_init
      1.48 ±  9%      -0.3        1.20 ± 16%      -0.3        1.15 ± 14%      -0.3        1.14 ± 13%  perf-profile.children.cycles-pp.__lxstat64
      3.05 ±  9%      -0.3        2.77 ± 13%      -0.3        2.70 ± 13%      -0.2        2.85 ±  3%  perf-profile.children.cycles-pp.schedule
      1.66 ±  9%      -0.3        1.38 ± 13%      -0.2        1.49 ± 15%      -0.2        1.50 ±  9%  perf-profile.children.cycles-pp.__close
      1.14 ±  5%      -0.3        0.86 ± 14%      -0.3        0.84 ± 12%      -0.2        0.89 ± 23%  perf-profile.children.cycles-pp.mkdir
      1.50 ± 10%      -0.3        1.24 ± 14%      -0.4        1.14 ± 11%      -0.3        1.20 ± 24%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      1.49 ±  7%      -0.3        1.23 ± 13%      -0.3        1.15 ±  9%      -0.3        1.22 ± 12%  perf-profile.children.cycles-pp.dput
      4.11 ±  6%      -0.3        3.85 ± 14%      -0.6        3.51 ± 12%      -0.5        3.61 ± 20%  perf-profile.children.cycles-pp.worker_thread
      1.05 ±  4%      -0.3        0.80 ± 15%      -0.3        0.78 ± 13%      -0.2        0.82 ± 23%  perf-profile.children.cycles-pp.__x64_sys_mkdir
      2.08 ± 24%      -0.3        1.83 ± 22%      +0.2        2.26 ± 12%      +0.0        2.12 ± 21%  perf-profile.children.cycles-pp.openat64
      1.00 ±  8%      -0.2        0.76 ± 17%      -0.3        0.74 ± 16%      -0.2        0.76 ± 22%  perf-profile.children.cycles-pp.mnt_get_writers
      1.28 ±  9%      -0.2        1.04 ± 16%      -0.3        1.00 ± 13%      -0.3        0.98 ± 14%  perf-profile.children.cycles-pp.__do_sys_newlstat
      0.96 ±  3%      -0.2        0.72 ± 16%      -0.3        0.70 ± 12%      -0.2        0.74 ± 24%  perf-profile.children.cycles-pp.do_mkdirat
      1.66 ±  9%      -0.2        1.43 ± 19%      -0.3        1.36 ± 14%      -0.3        1.39 ± 22%  perf-profile.children.cycles-pp.symlink
      1.28 ± 15%      -0.2        1.05 ± 13%      -0.1        1.15 ± 10%      -0.2        1.08 ±  4%  perf-profile.children.cycles-pp.vfs_statx
      1.08 ± 12%      -0.2        0.86 ± 10%      -0.3        0.76 ± 11%      -0.2        0.84 ± 15%  perf-profile.children.cycles-pp.kill_litter_super
      1.10 ±  8%      -0.2        0.88 ± 13%      -0.3        0.82 ± 16%      -0.2        0.90 ± 19%  perf-profile.children.cycles-pp.stress_mwc32
      0.98 ±  9%      -0.2        0.76 ± 15%      -0.3        0.70 ± 14%      -0.3        0.72 ± 20%  perf-profile.children.cycles-pp.shmem_fill_super
      0.78 ± 24%      -0.2        0.56 ± 19%      -0.1        0.69 ±  9%      -0.1        0.68 ± 23%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      1.22 ±  8%      -0.2        1.00 ± 14%      -0.3        0.92 ± 11%      -0.3        0.95 ± 26%  perf-profile.children.cycles-pp.new_inode
      1.58 ±  9%      -0.2        1.37 ± 19%      -0.3        1.29 ± 13%      -0.3        1.31 ± 20%  perf-profile.children.cycles-pp.__x64_sys_symlink
      1.03 ± 11%      -0.2        0.81 ± 10%      -0.3        0.73 ± 11%      -0.2        0.80 ± 16%  perf-profile.children.cycles-pp.generic_shutdown_super
      1.10 ±  7%      -0.2        0.88 ± 25%      -0.2        0.86 ± 14%      -0.1        0.95 ± 10%  perf-profile.children.cycles-pp.kmem_cache_free
      1.40 ±  9%      -0.2        1.20 ± 19%      -0.3        1.15 ± 13%      -0.2        1.16 ± 20%  perf-profile.children.cycles-pp.do_symlinkat
      1.84 ± 19%      -0.2        1.64 ± 21%      +0.0        1.88 ± 12%      +0.1        1.90 ± 23%  perf-profile.children.cycles-pp.show_mountinfo
      1.73 ±  9%      -0.2        1.53 ± 17%      -0.3        1.42 ± 16%      -0.2        1.48 ± 19%  perf-profile.children.cycles-pp._find_next_bit
      1.02 ±  6%      -0.2        0.83 ± 11%      -0.2        0.80 ±  5%      -0.2        0.84 ± 10%  perf-profile.children.cycles-pp.__cond_resched
      0.85 ±  8%      -0.2        0.66 ± 18%      -0.2        0.63 ± 19%      -0.2        0.66 ± 16%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      1.08 ± 12%      -0.2        0.89 ± 11%      -0.3        0.78 ± 18%      -0.3        0.81 ± 16%  perf-profile.children.cycles-pp.propagate_mount_busy
      0.78 ±  9%      -0.2        0.59 ± 18%      -0.2        0.57 ± 18%      -0.2        0.60 ± 16%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      1.03 ±  9%      -0.2        0.84 ± 16%      -0.2        0.84 ± 13%      -0.2        0.80 ± 22%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
      1.04 ± 10%      -0.2        0.85 ± 17%      -0.2        0.80 ± 19%      -0.2        0.84 ± 18%  perf-profile.children.cycles-pp.down_write
      0.92 ± 14%      -0.2        0.73 ± 16%      -0.2        0.72 ± 13%      -0.1        0.78 ± 13%  perf-profile.children.cycles-pp.__check_object_size
      1.70 ±  7%      -0.2        1.51 ± 10%      -0.3        1.41 ±  9%      -0.3        1.42 ±  9%  perf-profile.children.cycles-pp._raw_spin_lock
      0.88 ± 21%      -0.2        0.69 ± 11%      -0.0        0.87 ± 12%      -0.1        0.80 ± 19%  perf-profile.children.cycles-pp.alloc_empty_file
      1.04 ±  9%      -0.2        0.86 ± 16%      -0.2        0.80 ± 12%      -0.2        0.82 ± 27%  perf-profile.children.cycles-pp.alloc_inode
      0.96 ± 10%      -0.2        0.78 ± 16%      -0.2        0.74 ± 15%      -0.2        0.73 ± 21%  perf-profile.children.cycles-pp.path_parentat
      1.04 ±  9%      -0.2        0.86 ± 16%      -0.2        0.81 ± 15%      -0.2        0.80 ± 20%  perf-profile.children.cycles-pp.__filename_parentat
      0.99 ± 10%      -0.2        0.81 ± 15%      -0.2        0.74 ± 13%      -0.2        0.80 ± 26%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
      0.91 ± 11%      -0.2        0.74 ± 14%      -0.1        0.78 ± 16%      -0.1        0.80 ±  5%  perf-profile.children.cycles-pp.__fput
      1.46 ±  4%      -0.2        1.28 ± 15%      -0.3        1.17 ± 15%      -0.2        1.25 ± 15%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.16 ±  8%      -0.2        0.99 ± 11%      -0.3        0.89 ± 15%      -0.2        0.98 ± 25%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
      1.17 ±  8%      -0.2        1.00 ± 11%      -0.3        0.90 ± 14%      -0.2        0.98 ± 25%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
      0.83 ± 26%      -0.2        0.66 ± 18%      +0.0        0.85 ±  9%      -0.0        0.82 ± 23%  perf-profile.children.cycles-pp.do_readlinkat
      0.87 ± 11%      -0.2        0.70 ± 22%      -0.2        0.71 ± 11%      -0.2        0.71 ± 23%  perf-profile.children.cycles-pp.vfs_symlink
      0.82 ± 25%      -0.2        0.64 ± 18%      +0.0        0.83 ±  9%      -0.0        0.79 ± 21%  perf-profile.children.cycles-pp.readlinkat
      0.72 ±  9%      -0.2        0.55 ± 12%      -0.1        0.64 ± 10%      -0.1        0.60 ± 11%  perf-profile.children.cycles-pp.step_into
      0.78 ± 26%      -0.2        0.62 ± 19%      +0.0        0.79 ±  9%      -0.0        0.75 ± 22%  perf-profile.children.cycles-pp.__x64_sys_readlinkat
      0.88 ±  7%      -0.2        0.72 ± 17%      -0.2        0.68 ± 19%      -0.2        0.69 ± 23%  perf-profile.children.cycles-pp.filename_create
      1.07 ± 18%      -0.2        0.92 ± 18%      -0.0        1.04 ±  9%      -0.0        1.04 ± 12%  perf-profile.children.cycles-pp.__fxstat64
      0.79 ± 15%      -0.2        0.64 ± 15%      -0.3        0.52 ± 14%      -0.2        0.62 ± 23%  perf-profile.children.cycles-pp.vfs_create_mount
      0.75 ± 17%      -0.2        0.60 ± 16%      -0.1        0.64 ± 13%      -0.1        0.65 ±  9%  perf-profile.children.cycles-pp.path_init
      0.81 ±  7%      -0.2        0.66 ± 16%      -0.2        0.60 ± 16%      -0.2        0.62 ± 17%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.74 ±  6%      -0.2        0.60 ± 13%      -0.2        0.56 ± 13%      -0.1        0.60 ± 22%  perf-profile.children.cycles-pp.__d_alloc
      0.79 ± 10%      -0.1        0.64 ± 10%      -0.2        0.59 ±  9%      -0.2        0.58 ± 27%  perf-profile.children.cycles-pp.shmem_get_inode
      1.18 ± 14%      -0.1        1.04 ± 14%      -0.0        1.16 ±  8%      -0.1        1.09 ±  6%  perf-profile.children.cycles-pp.walk_component
      1.02 ± 12%      -0.1        0.88 ±  9%      -0.2        0.81 ± 14%      -0.2        0.83 ± 21%  perf-profile.children.cycles-pp.open_last_lookups
      0.70 ±  9%      -0.1        0.56 ± 14%      -0.2        0.52 ± 18%      -0.2        0.53 ± 19%  perf-profile.children.cycles-pp.umount_tree
      0.92 ± 10%      -0.1        0.78 ± 12%      -0.2        0.72 ± 16%      -0.1        0.80 ± 20%  perf-profile.children.cycles-pp.rmdir
      1.01 ± 15%      -0.1        0.87 ± 16%      -0.0        0.99 ±  8%      -0.1        0.94 ±  8%  perf-profile.children.cycles-pp.lookup_fast
      0.85 ± 10%      -0.1        0.71 ± 13%      -0.2        0.66 ± 16%      -0.1        0.72 ± 19%  perf-profile.children.cycles-pp.__x64_sys_rmdir
      1.30 ± 23%      -0.1        1.16 ± 16%      +0.1        1.38 ± 11%      +0.1        1.38 ± 25%  perf-profile.children.cycles-pp.malloc
      2.68 ±  4%      -0.1        2.55 ± 35%      -0.4        2.28 ± 12%      -0.2        2.44 ± 18%  perf-profile.children.cycles-pp.rcu_do_batch
      0.67 ±  9%      -0.1        0.54 ± 15%      -0.1        0.58 ± 16%      -0.1        0.62 ±  9%  perf-profile.children.cycles-pp.__entry_text_start
      0.61 ±  9%      -0.1        0.48 ± 18%      -0.2        0.46 ± 18%      -0.2        0.46 ± 19%  perf-profile.children.cycles-pp.do_lock_mount
      0.74 ±  7%      -0.1        0.62 ± 12%      -0.2        0.54 ± 18%      -0.2        0.58 ± 19%  perf-profile.children.cycles-pp.dentry_kill
      0.78 ±  7%      -0.1        0.66 ± 15%      -0.1        0.67 ± 11%      -0.1        0.65 ± 15%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      2.74 ±  4%      -0.1        2.62 ± 34%      -0.4        2.33 ± 12%      -0.2        2.50 ± 18%  perf-profile.children.cycles-pp.rcu_core
      0.46 ± 13%      -0.1        0.35 ± 13%      -0.1        0.34 ± 15%      -0.1        0.36 ± 19%  perf-profile.children.cycles-pp.sync_filesystem
      0.49 ±  6%      -0.1        0.38 ± 10%      -0.1        0.36 ± 10%      -0.1        0.40 ± 23%  perf-profile.children.cycles-pp.d_alloc
      3.35 ±  6%      -0.1        3.24 ± 14%      -0.4        2.91 ± 12%      -0.3        3.02 ± 20%  perf-profile.children.cycles-pp.process_one_work
      1.32 ± 16%      -0.1        1.20 ± 20%      +0.1        1.45 ± 18%      +0.2        1.49 ± 19%  perf-profile.children.cycles-pp.siphash24_compress
      0.45 ± 12%      -0.1        0.33 ± 13%      -0.1        0.33 ± 16%      -0.1        0.35 ± 20%  perf-profile.children.cycles-pp.writeback_inodes_sb
      0.46 ± 14%      -0.1        0.35 ± 13%      -0.1        0.33 ±  9%      -0.1        0.34 ± 30%  perf-profile.children.cycles-pp.shmem_alloc_inode
      0.69 ± 16%      -0.1        0.58 ± 19%      -0.2        0.53 ± 14%      -0.1        0.56 ± 24%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      0.36 ± 30%      -0.1        0.25 ± 15%      -0.1        0.29 ± 14%      -0.1        0.29 ± 25%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      3.04 ±  5%      -0.1        2.93 ± 32%      -0.4        2.64 ± 10%      -0.3        2.78 ± 17%  perf-profile.children.cycles-pp.__do_softirq
      0.67 ±  7%      -0.1        0.56 ± 10%      -0.2        0.49 ± 19%      -0.2        0.52 ± 22%  perf-profile.children.cycles-pp.__dentry_kill
      0.52 ±  5%      -0.1        0.42 ± 24%      -0.1        0.42 ± 15%      -0.1        0.41 ± 12%  perf-profile.children.cycles-pp.mod_objcg_state
      0.75 ±  9%      -0.1        0.64 ± 12%      -0.2        0.59 ± 17%      -0.1        0.65 ± 21%  perf-profile.children.cycles-pp.do_rmdir
      0.70 ± 19%      -0.1        0.60 ± 20%      -0.0        0.69 ± 11%      -0.0        0.67 ± 11%  perf-profile.children.cycles-pp.__do_sys_newfstat
      0.43 ± 12%      -0.1        0.33 ± 14%      -0.1        0.32 ± 17%      -0.1        0.34 ± 19%  perf-profile.children.cycles-pp.get_nr_dirty_inodes
      0.41 ±  8%      -0.1        0.30 ± 20%      -0.1        0.26 ± 21%      -0.1        0.28 ± 24%  perf-profile.children.cycles-pp.vfs_unlink
      0.37 ± 12%      -0.1        0.26 ± 20%      -0.1        0.28 ± 15%      -0.1        0.29 ± 15%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.48 ± 16%      -0.1        0.38 ± 10%      -0.1        0.37 ± 12%      -0.1        0.35 ± 17%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
      0.57 ± 18%      -0.1        0.47 ± 22%      -0.1        0.49 ± 14%      -0.1        0.49 ± 21%  perf-profile.children.cycles-pp.ramfs_symlink
      0.25 ± 24%      -0.1        0.15 ± 22%      -0.1        0.17 ± 15%      -0.1        0.17 ± 26%  perf-profile.children.cycles-pp.poll_idle
      0.87 ±  6%      -0.1        0.77 ± 17%      -0.0        0.82 ± 13%      -0.1        0.77 ±  8%  perf-profile.children.cycles-pp.inode_permission
      0.40 ± 14%      -0.1        0.30 ± 13%      -0.1        0.33 ± 14%      -0.1        0.33 ± 17%  perf-profile.children.cycles-pp.check_heap_object
      0.62 ±  8%      -0.1        0.52 ± 21%      -0.1        0.48 ± 15%      -0.1        0.52 ± 23%  perf-profile.children.cycles-pp.ramfs_get_inode
      0.54 ± 24%      -0.1        0.45 ± 17%      +0.0        0.59 ± 17%      +0.0        0.56 ± 18%  perf-profile.children.cycles-pp.__xstat64
      0.58 ±  7%      -0.1        0.48 ± 13%      -0.1        0.46 ± 17%      -0.1        0.50 ± 18%  perf-profile.children.cycles-pp.schedule_timeout
      1.08 ±  7%      -0.1        0.99 ± 18%      -0.1        0.94 ± 11%      -0.2        0.92 ± 12%  perf-profile.children.cycles-pp.try_to_wake_up
      0.44 ±  5%      -0.1        0.34 ± 25%      -0.1        0.33 ± 15%      -0.1        0.36 ± 21%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.49 ± 25%      -0.1        0.40 ± 17%      +0.0        0.53 ± 16%      +0.0        0.50 ± 14%  perf-profile.children.cycles-pp.__do_sys_newstat
      0.59 ± 13%      -0.1        0.50 ± 10%      -0.1        0.47 ±  8%      -0.1        0.47 ± 16%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.44 ± 18%      -0.1        0.35 ± 19%      -0.1        0.37 ± 16%      -0.1        0.36 ± 21%  perf-profile.children.cycles-pp.page_symlink
      0.23 ± 11%      -0.1        0.14 ± 34%      -0.1        0.15 ± 22%      -0.1        0.15 ± 25%  perf-profile.children.cycles-pp.copy_mount_options
      0.81 ± 11%      -0.1        0.72 ± 11%      -0.2        0.64 ± 16%      -0.1        0.66 ± 22%  perf-profile.children.cycles-pp.lookup_open
      0.46 ±  8%      -0.1        0.38 ± 13%      -0.1        0.38 ± 12%      -0.1        0.38 ± 14%  perf-profile.children.cycles-pp.do_open
      1.10 ±  9%      -0.1        1.02 ± 13%      -0.1        0.96 ±  6%      -0.1        0.99 ±  9%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.54 ± 21%      -0.1        0.46 ± 19%      +0.0        0.58 ± 16%      +0.0        0.55 ± 20%  perf-profile.children.cycles-pp.strcmp@plt
      0.34 ± 33%      -0.1        0.26 ± 25%      +0.0        0.36 ± 14%      +0.0        0.36 ± 25%  perf-profile.children.cycles-pp.vfs_readlink
      0.27 ±  9%      -0.1        0.19 ± 10%      -0.1        0.22 ±  9%      -0.1        0.22 ± 20%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.25 ± 14%      -0.1        0.17 ± 30%      -0.1        0.18 ± 22%      -0.1        0.18 ± 31%  perf-profile.children.cycles-pp._copy_from_user
      0.37 ± 16%      -0.1        0.29 ± 22%      -0.1        0.28 ± 14%      -0.0        0.32 ±  9%  perf-profile.children.cycles-pp.__check_heap_object
      0.38 ± 29%      -0.1        0.30 ± 16%      -0.0        0.36 ± 18%      -0.0        0.33 ± 20%  perf-profile.children.cycles-pp.init_file
      0.43 ±  6%      -0.1        0.36 ± 15%      -0.1        0.32 ± 16%      -0.1        0.33 ± 25%  perf-profile.children.cycles-pp.vfs_mkdir
      0.41 ±  6%      -0.1        0.33 ± 12%      -0.1        0.33 ± 16%      -0.1        0.36 ± 15%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.30 ± 11%      -0.1        0.23 ± 19%      -0.1        0.20 ± 14%      -0.1        0.23 ± 25%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.42 ± 11%      -0.1        0.34 ± 21%      -0.1        0.32 ± 13%      -0.1        0.33 ± 24%  perf-profile.children.cycles-pp.d_make_root
      0.54 ± 10%      -0.1        0.46 ± 15%      -0.1        0.42 ± 16%      -0.1        0.48 ± 20%  perf-profile.children.cycles-pp.__wait_for_common
      0.32 ± 29%      -0.1        0.24 ± 15%      -0.1        0.26 ± 18%      -0.1        0.25 ± 18%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.45 ± 13%      -0.1        0.38 ± 15%      -0.1        0.36 ± 14%      -0.1        0.36 ± 28%  perf-profile.children.cycles-pp.xas_store
      0.16 ± 19%      -0.1        0.08 ± 22%      -0.1        0.06 ± 11%      -0.1        0.07 ± 52%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
      0.21 ± 24%      -0.1        0.14 ± 16%      -0.1        0.13 ± 21%      -0.1        0.16 ± 21%  perf-profile.children.cycles-pp.up_write
      0.29 ± 23%      -0.1        0.22 ± 20%      -0.0        0.28 ± 12%      -0.0        0.28 ± 14%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.78 ±  6%      -0.1        0.70 ± 35%      -0.2        0.60 ± 13%      -0.1        0.63 ± 20%  perf-profile.children.cycles-pp.__slab_free
      0.78 ± 18%      -0.1        0.71 ± 16%      +0.0        0.82 ± 16%      +0.1        0.86 ± 21%  perf-profile.children.cycles-pp.vsnprintf
      0.55 ±  8%      -0.1        0.48 ± 22%      -0.1        0.46 ± 16%      -0.1        0.42 ± 28%  perf-profile.children.cycles-pp.queue_work_on
      0.34 ± 24%      -0.1        0.27 ± 19%      +0.0        0.34 ± 11%      -0.0        0.34 ±  8%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.47 ± 18%      -0.1        0.40 ± 15%      -0.1        0.35 ± 18%      -0.1        0.39 ± 28%  perf-profile.children.cycles-pp.ida_alloc_range
      0.36 ± 19%      -0.1        0.29 ± 17%      -0.1        0.30 ± 19%      -0.1        0.29 ± 19%  perf-profile.children.cycles-pp.simple_write_begin
      0.52 ± 20%      -0.1        0.44 ± 23%      +0.0        0.54 ± 11%      +0.0        0.54 ± 22%  perf-profile.children.cycles-pp.rdrand
      0.23 ± 23%      -0.1        0.16 ± 17%      -0.0        0.23 ± 14%      -0.0        0.23 ± 18%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.85 ± 10%      -0.1        0.78 ±  6%      -0.2        0.68 ± 14%      -0.2        0.67 ± 22%  perf-profile.children.cycles-pp.evict
      0.62 ±  2%      -0.1        0.55 ± 16%      -0.1        0.54 ± 20%      -0.1        0.50 ± 15%  perf-profile.children.cycles-pp.__call_rcu_common
      0.35 ± 12%      -0.1        0.28 ± 17%      -0.1        0.22 ± 16%      -0.1        0.26 ± 17%  perf-profile.children.cycles-pp.shrink_dcache_for_umount
      0.48 ± 17%      -0.1        0.41 ±  9%      -0.1        0.42 ± 14%      -0.0        0.43 ±  7%  perf-profile.children.cycles-pp.__legitimize_path
      0.36 ± 15%      -0.1        0.30 ± 15%      -0.1        0.31 ± 12%      -0.1        0.31 ± 13%  perf-profile.children.cycles-pp.cp_new_stat
      0.29 ± 28%      -0.1        0.23 ± 14%      +0.0        0.30 ± 22%      -0.0        0.26 ± 21%  perf-profile.children.cycles-pp.security_file_alloc
      0.19 ± 22%      -0.1        0.12 ± 20%      -0.1        0.13 ±  9%      -0.0        0.14 ± 19%  perf-profile.children.cycles-pp.finish_task_switch
      0.34 ± 26%      -0.1        0.28 ± 18%      -0.0        0.33 ± 12%      -0.0        0.30 ± 31%  perf-profile.children.cycles-pp.down_read
      0.55 ± 16%      -0.1        0.49 ±  8%      -0.1        0.49 ± 13%      -0.0        0.51 ±  9%  perf-profile.children.cycles-pp.try_to_unlazy
      0.20 ± 16%      -0.1        0.14 ± 14%      -0.0        0.16 ± 26%      -0.1        0.14 ± 21%  perf-profile.children.cycles-pp.__lookup_mnt
      0.22 ± 16%      -0.1        0.16 ± 23%      -0.1        0.15 ± 16%      -0.1        0.16 ± 21%  perf-profile.children.cycles-pp.get_nr_inodes
      0.32 ±  4%      -0.1        0.26 ±  8%      -0.1        0.26 ± 21%      -0.0        0.28 ± 13%  perf-profile.children.cycles-pp.dequeue_entity
      0.25 ± 10%      -0.1        0.18 ± 14%      -0.1        0.15 ± 17%      -0.1        0.18 ± 23%  perf-profile.children.cycles-pp.pcpu_block_update_hint_alloc
      0.63 ±  8%      -0.1        0.57 ± 12%      -0.1        0.50 ± 16%      -0.1        0.56 ± 21%  perf-profile.children.cycles-pp.__flush_work
      0.20 ± 24%      -0.1        0.14 ± 12%      -0.0        0.18 ± 25%      -0.0        0.15 ± 22%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.58 ± 13%      -0.1        0.52 ± 15%      -0.0        0.54 ± 11%      -0.0        0.55 ± 13%  perf-profile.children.cycles-pp.kmalloc_trace
      0.65 ± 16%      -0.1        0.59 ± 21%      +0.0        0.68 ± 17%      +0.0        0.69 ± 20%  perf-profile.children.cycles-pp.seq_printf
      0.19 ± 12%      -0.1        0.13 ± 18%      -0.1        0.09 ± 19%      -0.1        0.10 ± 19%  perf-profile.children.cycles-pp._get_random_bytes
      0.22 ± 17%      -0.1        0.16 ± 15%      -0.0        0.21 ± 19%      -0.1        0.17 ± 29%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.16 ± 19%      -0.1        0.10 ± 21%      -0.1        0.08 ± 19%      -0.1        0.10 ± 18%  perf-profile.children.cycles-pp.iput
      0.25 ±  8%      -0.1        0.19 ± 27%      -0.1        0.18 ± 12%      -0.1        0.17 ± 31%  perf-profile.children.cycles-pp.shmem_symlink
      0.47 ± 12%      -0.1        0.41 ±  7%      -0.1        0.40 ± 12%      -0.1        0.35 ± 24%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.38 ± 11%      -0.1        0.32 ± 12%      -0.1        0.29 ± 16%      -0.0        0.34 ± 21%  perf-profile.children.cycles-pp.vfs_rmdir
      0.29 ± 21%      -0.1        0.24 ± 17%      +0.0        0.32 ± 17%      -0.0        0.28 ± 26%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
      0.24 ± 17%      -0.1        0.18 ± 12%      -0.1        0.19 ± 12%      -0.0        0.20 ± 19%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.27 ± 16%      -0.1        0.22 ± 20%      -0.1        0.19 ± 16%      -0.0        0.23 ± 17%  perf-profile.children.cycles-pp.ida_free
      0.22 ± 20%      -0.1        0.17 ± 21%      -0.1        0.15 ±  6%      -0.0        0.20 ± 12%  perf-profile.children.cycles-pp.rcu_all_qs
      0.51 ± 11%      -0.1        0.45 ± 21%      -0.1        0.39 ± 13%      -0.1        0.39 ± 27%  perf-profile.children.cycles-pp.ramfs_fill_super
      0.37 ± 14%      -0.1        0.31 ±  8%      -0.1        0.30 ± 26%      -0.1        0.29 ± 18%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
      0.20 ± 19%      -0.1        0.14 ± 28%      -0.0        0.14 ± 22%      -0.0        0.16 ± 14%  perf-profile.children.cycles-pp.terminate_walk
      0.44 ± 13%      -0.1        0.39 ± 11%      -0.1        0.32 ± 17%      -0.1        0.34 ± 33%  perf-profile.children.cycles-pp.shmem_mknod
      0.46 ±  8%      -0.1        0.40 ± 17%      -0.1        0.36 ± 20%      -0.1        0.38 ± 23%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
      0.12 ± 19%      -0.1        0.07 ± 18%      -0.0        0.08 ± 19%      -0.0        0.08 ± 51%  perf-profile.children.cycles-pp.path_mount
      0.28 ±  7%      -0.1        0.22 ± 16%      -0.1        0.22 ± 18%      -0.1        0.22 ± 18%  perf-profile.children.cycles-pp.ramfs_mknod
      0.75 ±  7%      -0.1        0.70 ± 21%      -0.1        0.64 ± 11%      -0.1        0.63 ± 16%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.28 ± 19%      -0.1        0.22 ± 22%      -0.1        0.20 ± 15%      -0.1        0.21 ± 18%  perf-profile.children.cycles-pp.commit_tree
      0.33 ±  5%      -0.1        0.28 ± 19%      -0.1        0.27 ± 18%      -0.1        0.27 ± 12%  perf-profile.children.cycles-pp.generic_permission
      0.31 ± 15%      -0.1        0.26 ± 12%      -0.0        0.26 ± 11%      -0.1        0.26 ± 18%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.15 ±  9%      -0.1        0.10 ± 20%      -0.0        0.12 ± 14%      -0.0        0.14 ± 12%  perf-profile.children.cycles-pp.lockref_get
      0.39 ± 12%      -0.1        0.34 ± 17%      -0.1        0.33 ± 16%      -0.1        0.33 ± 23%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.42 ±  9%      -0.1        0.36 ±  7%      -0.1        0.33 ±  7%      -0.1        0.33 ± 16%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
      0.48 ±  6%      -0.1        0.43 ± 20%      -0.1        0.41 ± 17%      -0.1        0.37 ± 29%  perf-profile.children.cycles-pp.__queue_work
      0.24 ± 11%      -0.1        0.19 ± 25%      -0.1        0.18 ± 20%      -0.1        0.18 ± 26%  perf-profile.children.cycles-pp.__percpu_counter_init
      0.16 ± 13%      -0.1        0.10 ± 23%      -0.1        0.08 ± 21%      -0.1        0.07 ± 28%  perf-profile.children.cycles-pp.uuid_gen
      0.17 ± 17%      -0.1        0.12 ± 12%      -0.0        0.12 ± 19%      -0.0        0.12 ± 25%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.05 ± 46%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.__fs_parse
      0.21 ± 22%      -0.0        0.16 ± 12%      -0.0        0.18 ± 19%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.28 ± 25%      -0.0        0.24 ± 21%      +0.0        0.29 ± 14%      +0.0        0.29 ± 23%  perf-profile.children.cycles-pp.unit_name_is_valid
      0.44 ± 13%      -0.0        0.39 ±  8%      -0.1        0.36 ± 24%      -0.1        0.37 ± 17%  perf-profile.children.cycles-pp.list_lru_destroy
      0.26 ± 13%      -0.0        0.22 ± 27%      -0.1        0.19 ± 19%      -0.0        0.23 ± 18%  perf-profile.children.cycles-pp.__switch_to_asm
      0.23 ± 23%      -0.0        0.18 ± 21%      -0.0        0.23 ± 17%      +0.0        0.25 ± 30%  perf-profile.children.cycles-pp.device_properties_prepare
      0.34 ± 13%      -0.0        0.30 ± 27%      +0.0        0.36 ± 14%      +0.0        0.36 ± 28%  perf-profile.children.cycles-pp.do_faccessat
      0.12 ± 15%      -0.0        0.08 ± 19%      -0.1        0.06 ± 47%      -0.0        0.08 ± 22%  perf-profile.children.cycles-pp._atomic_dec_and_lock
      0.17 ± 16%      -0.0        0.12 ± 32%      -0.0        0.15 ± 14%      -0.0        0.15 ± 15%  perf-profile.children.cycles-pp.refill_obj_stock
      1.90 ± 11%      -0.0        1.85 ± 16%      -0.1        1.76 ± 17%      -0.0        1.85 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.35 ± 20%      -0.0        0.30 ± 11%      -0.1        0.28 ± 13%      -0.1        0.29 ± 21%  perf-profile.children.cycles-pp.__wake_up_common
      0.07 ± 35%      -0.0        0.02 ±142%      -0.0        0.05 ± 46%      -0.0        0.07 ± 32%  perf-profile.children.cycles-pp.__libc_calloc
      0.22 ± 11%      -0.0        0.17 ± 12%      -0.0        0.18 ± 30%      -0.0        0.18 ± 22%  perf-profile.children.cycles-pp.ns_capable
      0.58 ±  9%      -0.0        0.53 ± 21%      -0.1        0.52 ± 10%      -0.1        0.50 ± 15%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.39 ± 20%      -0.0        0.35 ± 19%      +0.0        0.41 ± 15%      +0.0        0.42 ± 13%  perf-profile.children.cycles-pp.vfs_fstat
      0.16 ± 15%      -0.0        0.11 ± 14%      -0.0        0.11 ± 20%      -0.0        0.12 ± 19%  perf-profile.children.cycles-pp.ramfs_mkdir
      0.07 ± 10%      -0.0        0.02 ±143%      -0.0        0.04 ± 44%      -0.0        0.06 ± 19%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.21 ± 29%      -0.0        0.16 ± 20%      +0.0        0.22 ± 14%      -0.0        0.18 ± 35%  perf-profile.children.cycles-pp.string_escape_mem
      0.05 ±  8%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.1        0.00        perf-profile.children.cycles-pp.propagate_mount_unlock
      0.36 ± 16%      -0.0        0.32 ±  6%      -0.1        0.30 ± 20%      -0.1        0.31 ± 13%  perf-profile.children.cycles-pp.complete_walk
      0.36 ± 14%      -0.0        0.32 ± 26%      +0.0        0.38 ± 12%      +0.0        0.38 ± 28%  perf-profile.children.cycles-pp.access
      0.26 ± 18%      -0.0        0.22 ± 19%      -0.0        0.22 ± 18%      -0.0        0.22 ± 17%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.21 ± 16%      -0.0        0.16 ± 20%      -0.1        0.15 ± 17%      -0.0        0.16 ± 41%  perf-profile.children.cycles-pp.shmem_mkdir
      0.22 ± 12%      -0.0        0.18 ± 12%      -0.0        0.18 ± 29%      -0.0        0.18 ± 23%  perf-profile.children.cycles-pp.security_capable
      0.23 ± 26%      -0.0        0.18 ± 21%      +0.0        0.24 ± 15%      -0.0        0.20 ± 36%  perf-profile.children.cycles-pp.seq_escape_mem
      0.27 ±  7%      -0.0        0.22 ± 15%      -0.1        0.20 ± 11%      -0.1        0.21 ± 11%  perf-profile.children.cycles-pp.update_curr
      0.24 ± 29%      -0.0        0.19 ± 25%      +0.0        0.25 ± 15%      +0.0        0.25 ± 26%  perf-profile.children.cycles-pp.kernfs_iop_get_link
      0.23 ± 13%      -0.0        0.19 ± 21%      -0.1        0.17 ± 11%      -0.1        0.18 ± 27%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.25 ± 16%      -0.0        0.20 ± 19%      -0.0        0.21 ± 20%      -0.0        0.21 ± 18%  perf-profile.children.cycles-pp.pagecache_get_page
      0.14 ± 13%      -0.0        0.10 ± 19%      -0.0        0.11 ± 14%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.destroy_inode
      0.16 ± 18%      -0.0        0.12 ± 32%      -0.0        0.14 ± 19%      -0.0        0.13 ± 25%  perf-profile.children.cycles-pp.alloc_fs_context
      0.10 ± 18%      -0.0        0.06 ± 73%      -0.0        0.06 ± 49%      -0.0        0.07 ± 21%  perf-profile.children.cycles-pp.stress_ramfs_child
      0.06 ± 11%      -0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.05 ± 79%      -0.0        0.01 ±223%      +0.0        0.06 ± 11%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp.llist_reverse_order
      0.06 ± 14%      -0.0        0.02 ± 99%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.19 ± 17%      -0.0        0.15 ± 20%      -0.0        0.17 ± 22%      -0.0        0.17 ± 16%  perf-profile.children.cycles-pp._copy_to_user
      0.07 ± 24%      -0.0        0.03 ±101%      -0.0        0.05 ± 45%      -0.0        0.05 ± 48%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.15 ± 21%      -0.0        0.11 ± 18%      +0.0        0.16 ± 18%      -0.0        0.14 ± 23%  perf-profile.children.cycles-pp.kernfs_iop_getattr
      0.41 ± 10%      -0.0        0.37 ± 12%      -0.1        0.32 ±  6%      -0.1        0.32 ± 17%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.15 ± 14%      -0.0        0.11 ± 24%      -0.1        0.07 ± 18%      -0.1        0.08 ± 20%  perf-profile.children.cycles-pp.crng_make_state
      0.32 ± 19%      -0.0        0.29 ± 15%      -0.1        0.26 ± 13%      -0.1        0.25 ± 24%  perf-profile.children.cycles-pp.vfs_parse_fs_string
      0.21 ± 15%      -0.0        0.18 ± 24%      -0.1        0.16 ± 21%      -0.0        0.18 ± 18%  perf-profile.children.cycles-pp.__switch_to
      0.04 ± 71%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.17 ± 10%      -0.0        0.13 ± 18%      -0.0        0.13 ± 27%      -0.0        0.14 ± 26%  perf-profile.children.cycles-pp.apparmor_capable
      0.40 ± 10%      -0.0        0.36 ±  9%      -0.0        0.36 ± 17%      -0.0        0.35 ± 14%  perf-profile.children.cycles-pp.do_dentry_open
      0.04 ± 71%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_gp_kthread
      0.42 ± 10%      -0.0        0.38 ± 23%      -0.1        0.36 ± 30%      -0.1        0.36 ±  9%  perf-profile.children.cycles-pp.schedule_idle
      0.30 ± 17%      -0.0        0.26 ± 11%      -0.1        0.24 ±  9%      -0.1        0.24 ± 23%  perf-profile.children.cycles-pp.kstrdup
      0.05 ± 50%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.exp_funnel_lock
      0.08 ± 12%      -0.0        0.04 ± 76%      -0.0        0.07 ± 52%      -0.0        0.04 ±104%  perf-profile.children.cycles-pp.unregister_shrinker
      0.05 ± 73%      -0.0        0.02 ±141%      +0.0        0.05 ± 46%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.readlink_copy
      0.10 ± 26%      -0.0        0.06 ± 47%      -0.0        0.09 ± 22%      -0.0        0.08 ± 25%  perf-profile.children.cycles-pp.rcu_exp_handler
      0.17 ± 20%      -0.0        0.13 ± 23%      -0.1        0.12 ± 17%      -0.1        0.12 ± 28%  perf-profile.children.cycles-pp.propagate_umount
      0.11 ± 38%      -0.0        0.07 ± 34%      -0.0        0.08 ± 13%      -0.0        0.08 ± 25%  perf-profile.children.cycles-pp.zero_user_segments
      0.15 ± 38%      -0.0        0.11 ± 22%      +0.0        0.15 ± 21%      +0.0        0.15 ± 30%  perf-profile.children.cycles-pp.__strdup
      0.04 ± 72%      -0.0        0.01 ±223%      +0.0        0.08 ± 29%      +0.0        0.07 ± 55%  perf-profile.children.cycles-pp.unit_file_find_dropin_paths
      0.08 ± 25%      -0.0        0.04 ±104%      -0.0        0.05 ± 47%      -0.0        0.07 ± 16%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.07 ± 25%      -0.0        0.03 ±102%      +0.0        0.07 ± 10%      -0.0        0.06 ± 50%  perf-profile.children.cycles-pp.m_start
      0.28 ± 19%      -0.0        0.25 ± 20%      -0.0        0.27 ± 15%      -0.0        0.26 ± 20%  perf-profile.children.cycles-pp.__x64_sys_close
      0.14 ± 27%      -0.0        0.10 ± 32%      -0.0        0.11 ± 20%      -0.0        0.10 ± 19%  perf-profile.children.cycles-pp.may_delete
      0.06 ± 47%      -0.0        0.03 ±100%      -0.0        0.06 ±  8%      -0.0        0.04 ±107%  perf-profile.children.cycles-pp.vscnprintf
      0.06 ± 53%      -0.0        0.03 ±101%      -0.0        0.06 ± 49%      +0.0        0.08 ± 36%  perf-profile.children.cycles-pp.chase_symlinks
      0.06 ± 14%      -0.0        0.03 ±100%      -0.1        0.00            -0.0        0.04 ± 73%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.03 ±101%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.security_sb_mount
      0.22 ± 39%      -0.0        0.19 ± 17%      -0.0        0.17 ± 19%      -0.0        0.20 ±  7%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.12 ± 11%      -0.0        0.08 ± 20%      -0.0        0.07 ± 21%      -0.1        0.06 ± 51%  perf-profile.children.cycles-pp.mnt_release_group_id
      0.18 ± 16%      -0.0        0.14 ± 18%      -0.0        0.16 ±  7%      -0.0        0.14 ± 28%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.18 ± 28%      -0.0        0.14 ± 16%      -0.0        0.16 ± 18%      +0.0        0.18 ± 16%  perf-profile.children.cycles-pp.__d_path
      0.14 ± 34%      -0.0        0.10 ± 34%      +0.0        0.15 ± 19%      +0.0        0.14 ± 32%  perf-profile.children.cycles-pp.kernfs_get_target_path
      0.18 ± 10%      -0.0        0.15 ± 25%      -0.0        0.14 ± 21%      -0.0        0.16 ± 19%  perf-profile.children.cycles-pp.prepare_task_switch
      0.26 ± 29%      -0.0        0.23 ± 15%      +0.0        0.29 ± 13%      +0.1        0.32 ± 28%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      1.98 ± 11%      -0.0        1.95 ± 12%      -0.1        1.92 ± 15%      -0.0        1.96 ± 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.17 ± 20%      -0.0        0.14 ± 14%      -0.1        0.12 ± 21%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.change_mnt_propagation
      0.26 ± 19%      -0.0        0.23 ± 10%      -0.1        0.21 ± 13%      -0.0        0.22 ± 25%  perf-profile.children.cycles-pp.ep_poll_callback
      0.22 ± 17%      -0.0        0.19 ± 20%      -0.0        0.18 ± 18%      -0.0        0.20 ± 27%  perf-profile.children.cycles-pp.strndup_user
      0.09 ± 30%      -0.0        0.06 ± 72%      -0.0        0.06 ± 25%      -0.0        0.04 ± 79%  perf-profile.children.cycles-pp.vmalloc_to_page
      0.12 ± 21%      -0.0        0.09 ± 26%      -0.1        0.04 ± 72%      -0.1        0.07 ± 24%  perf-profile.children.cycles-pp.chacha_block_generic
      0.13 ± 16%      -0.0        0.10 ± 29%      -0.1        0.06 ± 50%      -0.1        0.08 ± 22%  perf-profile.children.cycles-pp.crng_fast_key_erasure
      0.05 ± 49%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.04 ± 73%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.skb_release_data
      0.10 ± 53%      -0.0        0.07 ± 50%      -0.0        0.08 ± 73%      -0.0        0.09 ± 27%  perf-profile.children.cycles-pp.swake_up_one
      0.14 ± 17%      -0.0        0.11 ± 26%      -0.0        0.12 ± 17%      -0.0        0.12 ± 21%  perf-profile.children.cycles-pp.__memset
      0.59 ±  8%      -0.0        0.56 ± 21%      -0.0        0.55 ± 11%      -0.1        0.52 ± 14%  perf-profile.children.cycles-pp.activate_task
      0.14 ± 29%      -0.0        0.10 ± 10%      -0.1        0.08 ± 24%      -0.0        0.11 ± 16%  perf-profile.children.cycles-pp.d_walk
      0.13 ± 15%      -0.0        0.10 ± 18%      -0.0        0.10 ± 20%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.__destroy_inode
      0.08 ± 14%      -0.0        0.06 ± 48%      -0.0        0.05 ± 75%      -0.0        0.05 ± 73%  perf-profile.children.cycles-pp.propagation_next
      0.10 ± 28%      -0.0        0.07 ± 50%      -0.1        0.04 ± 71%      -0.0        0.06 ± 19%  perf-profile.children.cycles-pp.chacha_permute
      0.19 ± 18%      -0.0        0.16 ± 33%      -0.0        0.15 ± 21%      -0.0        0.17 ± 39%  perf-profile.children.cycles-pp.xas_create
      0.03 ±101%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.17 ± 29%      -0.0        0.14 ± 15%      -0.0        0.14 ± 16%      +0.0        0.18 ± 16%  perf-profile.children.cycles-pp.prepend_path
      0.03 ±101%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_socket
      0.03 ±101%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__sys_socket
      0.10 ± 28%      -0.0        0.07 ± 20%      -0.0        0.09 ± 23%      -0.0        0.09 ± 20%  perf-profile.children.cycles-pp.generic_fillattr
      0.03 ±101%      -0.0        0.00            -0.0        0.02 ±146%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.radix_tree_delete_item
      0.03 ±101%      -0.0        0.00            -0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__socket
      0.16 ± 21%      -0.0        0.12 ± 21%      +0.0        0.17 ± 17%      +0.0        0.18 ± 21%  perf-profile.children.cycles-pp.device_read_uevent_file
      0.25 ± 30%      -0.0        0.22 ± 16%      +0.0        0.27 ± 12%      +0.0        0.30 ± 26%  perf-profile.children.cycles-pp.uevent_show
      0.04 ± 72%      -0.0        0.01 ±223%      +0.0        0.06 ± 19%      -0.0        0.04 ±109%  perf-profile.children.cycles-pp.sync_regs
      0.26 ± 30%      -0.0        0.22 ± 16%      +0.0        0.28 ± 12%      +0.0        0.30 ± 27%  perf-profile.children.cycles-pp.dev_attr_show
      0.14 ± 29%      -0.0        0.11 ± 20%      -0.0        0.13 ± 13%      +0.0        0.14 ± 19%  perf-profile.children.cycles-pp.memcpy_orig
      0.22 ± 16%      -0.0        0.19 ±  6%      -0.0        0.19 ± 21%      -0.1        0.17 ± 33%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.18 ± 13%      -0.0        0.15 ± 18%      -0.0        0.14 ± 14%      -0.0        0.13 ± 32%  perf-profile.children.cycles-pp.inode_init_always
      0.10 ± 21%      -0.0        0.07 ± 47%      -0.0        0.08 ± 22%      -0.0        0.08 ± 19%  perf-profile.children.cycles-pp.__srcu_read_unlock
      0.08 ± 56%      -0.0        0.05 ± 80%      -0.0        0.08 ± 21%      -0.0        0.07 ± 29%  perf-profile.children.cycles-pp._hashmap_clear
      0.05 ± 71%      -0.0        0.02 ±142%      +0.0        0.05 ± 50%      +0.0        0.07 ± 25%  perf-profile.children.cycles-pp.pick_next_entity
      0.32 ± 18%      -0.0        0.29 ± 20%      -0.1        0.26 ± 12%      -0.0        0.28 ± 12%  perf-profile.children.cycles-pp.lockref_put_return
      0.12 ± 26%      -0.0        0.09 ± 19%      -0.0        0.10 ± 15%      -0.0        0.11 ± 21%  perf-profile.children.cycles-pp.hashmap_replace
      0.12 ± 22%      -0.0        0.09 ± 33%      +0.0        0.12 ± 17%      -0.0        0.11 ± 33%  perf-profile.children.cycles-pp._IO_default_xsputn
      0.18 ± 23%      -0.0        0.15 ± 16%      +0.0        0.19 ± 19%      -0.0        0.17 ± 31%  perf-profile.children.cycles-pp.siphash24_init
      0.19 ± 17%      -0.0        0.16 ± 21%      -0.0        0.16 ± 16%      -0.0        0.18 ± 14%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.10 ± 15%      -0.0        0.08 ± 25%      -0.0        0.08 ± 16%      -0.0        0.06 ± 17%  perf-profile.children.cycles-pp.generic_parse_monolithic
      0.41 ± 23%      -0.0        0.38 ± 25%      +0.1        0.47 ±  9%      +0.1        0.48 ± 27%  perf-profile.children.cycles-pp.siphash24_finalize
      0.04 ± 73%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.inode_maybe_inc_iversion
      0.05 ± 47%      -0.0        0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.update_min_vruntime
      0.03 ±100%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__mark_inode_dirty
      0.03 ±100%      -0.0        0.00            +0.0        0.03 ± 70%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._IO_feof
      0.08 ± 30%      -0.0        0.06 ± 50%      -0.0        0.04 ± 45%      -0.1        0.02 ±142%  perf-profile.children.cycles-pp.kmemdup_nul
      0.07 ± 48%      -0.0        0.04 ±101%      -0.0        0.07 ± 13%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.__get_fs_type
      0.40 ± 12%      -0.0        0.37 ± 28%      +0.0        0.43 ± 16%      +0.0        0.44 ± 16%  perf-profile.children.cycles-pp.intel_idle_irq
      0.31 ± 23%      -0.0        0.28 ± 18%      -0.0        0.30 ± 15%      +0.0        0.34 ± 20%  perf-profile.children.cycles-pp.seq_path_root
      0.12 ± 11%      -0.0        0.10 ± 13%      -0.0        0.09 ± 27%      -0.0        0.10 ± 27%  perf-profile.children.cycles-pp.lockref_put_or_lock
      0.15 ± 20%      -0.0        0.13 ± 13%      -0.0        0.11 ± 32%      -0.0        0.15 ± 10%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.16 ± 16%      -0.0        0.14 ± 20%      -0.0        0.14 ± 14%      -0.0        0.14 ± 19%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.13 ± 23%      -0.0        0.11 ± 22%      -0.0        0.11 ± 24%      -0.0        0.11 ± 25%  perf-profile.children.cycles-pp.filemap_add_folio
      0.21 ± 10%      -0.0        0.18 ±  8%      -0.0        0.19 ± 11%      -0.0        0.16 ± 22%  perf-profile.children.cycles-pp.__pagevec_release
      0.06 ± 50%      -0.0        0.04 ±109%      -0.0        0.05 ± 45%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.file_free_rcu
      0.07 ± 15%      -0.0        0.05 ± 49%      -0.0        0.07 ±  7%      +0.0        0.08 ± 46%  perf-profile.children.cycles-pp.mnt_want_write
      0.14 ± 15%      -0.0        0.12 ± 19%      +0.0        0.14 ± 27%      +0.0        0.14 ± 30%  perf-profile.children.cycles-pp.realloc
      0.44 ± 11%      -0.0        0.42 ± 25%      -0.1        0.38 ±  7%      -0.0        0.40 ± 17%  perf-profile.children.cycles-pp.enqueue_entity
      0.32 ± 14%      -0.0        0.30 ± 17%      -0.1        0.24 ± 19%      -0.0        0.28 ± 17%  perf-profile.children.cycles-pp.smp_call_function_single
      0.29 ± 20%      -0.0        0.26 ± 20%      +0.0        0.31 ± 12%      +0.0        0.29 ± 23%  perf-profile.children.cycles-pp.format_decode
      0.25 ± 13%      -0.0        0.23 ± 12%      -0.0        0.22 ± 12%      -0.0        0.24 ± 19%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.17 ± 21%      -0.0        0.15 ± 21%      -0.0        0.15 ± 27%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
      0.16 ± 21%      -0.0        0.14 ± 13%      -0.0        0.16 ± 15%      -0.0        0.16 ± 22%  perf-profile.children.cycles-pp.security_inode_getattr
      0.08 ± 26%      -0.0        0.06 ± 75%      -0.0        0.05 ± 74%      -0.0        0.05 ± 47%  perf-profile.children.cycles-pp.consume_skb
      0.07 ± 58%      -0.0        0.05 ± 70%      -0.0        0.07 ± 23%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.shmem_getattr
      0.06 ± 50%      -0.0        0.04 ± 72%      -0.0        0.06 ±  7%      -0.0        0.06 ± 85%  perf-profile.children.cycles-pp.sysfs_emit_at
      0.05 ± 72%      -0.0        0.02 ±149%      -0.0        0.01 ±223%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.rb_erase
      0.02 ±143%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_del
      0.07 ± 20%      -0.0        0.04 ± 76%      -0.1        0.01 ±223%      -0.1        0.01 ±223%  perf-profile.children.cycles-pp.simple_acl_create
      0.13 ± 19%      -0.0        0.11 ± 12%      -0.0        0.09 ± 50%      -0.0        0.13 ±  8%  perf-profile.children.cycles-pp.rcu_pending
      0.06 ± 47%      -0.0        0.03 ±108%      -0.0        0.02 ±144%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.idr_alloc
      0.04 ± 73%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.03 ±105%  perf-profile.children.cycles-pp.d_delete
      0.08 ± 31%      -0.0        0.05 ± 49%      -0.0        0.06 ± 51%      -0.0        0.04 ± 77%  perf-profile.children.cycles-pp.shmem_unlink
      0.12 ± 21%      -0.0        0.10 ± 24%      -0.0        0.11 ± 22%      -0.0        0.09 ± 47%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.13 ± 28%      -0.0        0.11 ± 20%      +0.0        0.14 ± 16%      -0.0        0.13 ± 21%  perf-profile.children.cycles-pp.vfs_getattr_nosec
      0.04 ± 73%      -0.0        0.02 ±142%      +0.0        0.06 ± 75%      +0.0        0.07 ± 55%  perf-profile.children.cycles-pp.__kmalloc_node
      1.32 ± 10%      -0.0        1.30 ± 11%      -0.0        1.27 ± 14%      +0.0        1.32 ± 12%  perf-profile.children.cycles-pp.update_process_times
      0.10 ± 23%      -0.0        0.07 ± 33%      -0.1        0.04 ± 73%      -0.1        0.04 ± 74%  perf-profile.children.cycles-pp.dentry_unlink_inode
      0.14 ± 19%      -0.0        0.12 ± 49%      -0.0        0.10 ± 16%      -0.0        0.11 ± 27%  perf-profile.children.cycles-pp.pcpu_block_update_hint_free
      0.05 ± 47%      -0.0        0.03 ±105%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.idr_alloc_u32
      0.06 ± 53%      -0.0        0.04 ± 72%      +0.0        0.09 ± 23%      +0.0        0.09 ± 31%  perf-profile.children.cycles-pp.strspn@plt
      0.05 ± 46%      -0.0        0.03 ±105%      -0.0        0.03 ±100%      +0.0        0.06 ± 46%  perf-profile.children.cycles-pp.kmalloc_slab
      0.09 ± 24%      -0.0        0.07 ± 49%      -0.0        0.07 ± 20%      -0.0        0.07 ± 51%  perf-profile.children.cycles-pp.xa_load
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.greedy_realloc
      0.11 ± 25%      -0.0        0.08 ± 26%      -0.0        0.09 ± 21%      -0.0        0.08 ± 10%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.04 ± 72%      -0.0        0.02 ±142%      -0.0        0.03 ±100%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.02 ±142%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.10 ± 19%      -0.0        0.08 ± 16%      -0.0        0.10 ± 18%      -0.0        0.07 ± 53%  perf-profile.children.cycles-pp.close_fd
      0.02 ±146%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.d_same_name
      0.06 ± 50%      -0.0        0.04 ± 76%      -0.0        0.06 ±  7%      -0.0        0.06 ± 54%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.14 ± 19%      -0.0        0.12 ± 27%      -0.0        0.12 ± 32%      -0.0        0.12 ± 16%  perf-profile.children.cycles-pp.strlcat
      0.22 ± 15%      -0.0        0.20 ± 17%      -0.1        0.16 ± 12%      -0.1        0.17 ± 16%  perf-profile.children.cycles-pp.__kmalloc
      0.43 ±  8%      -0.0        0.41 ± 19%      -0.1        0.37 ± 10%      -0.0        0.39 ± 15%  perf-profile.children.cycles-pp.update_load_avg
      0.09 ± 26%      -0.0        0.07 ± 16%      -0.1        0.04 ± 71%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.__d_instantiate
      0.18 ± 20%      -0.0        0.16 ± 37%      -0.0        0.15 ± 27%      -0.0        0.16 ± 12%  perf-profile.children.cycles-pp.sock_recvmsg
      0.19 ± 14%      -0.0        0.17 ± 22%      -0.0        0.16 ± 21%      -0.0        0.16 ± 10%  perf-profile.children.cycles-pp.task_work_add
      0.14 ± 14%      -0.0        0.12 ± 16%      -0.0        0.12 ± 23%      -0.0        0.10 ± 28%  perf-profile.children.cycles-pp.release_pages
      0.10 ± 10%      -0.0        0.08 ± 14%      -0.0        0.08 ± 13%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.05 ± 49%      -0.0        0.03 ±100%      -0.0        0.02 ±145%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.xas_clear_mark
      0.04 ± 72%      -0.0        0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.check_stack_object
      0.08 ± 22%      -0.0        0.06 ± 48%      -0.0        0.06 ± 46%      -0.0        0.05 ± 48%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.10 ± 28%      -0.0        0.08 ± 53%      -0.0        0.08 ± 49%      -0.0        0.09 ± 31%  perf-profile.children.cycles-pp.prealloc_shrinker
      0.13 ± 19%      -0.0        0.11 ± 25%      -0.0        0.11 ± 18%      -0.0        0.12 ± 24%  perf-profile.children.cycles-pp.xas_load
      0.08 ± 48%      -0.0        0.06 ± 50%      +0.0        0.10 ± 20%      +0.0        0.11 ± 34%  perf-profile.children.cycles-pp.show_mnt_opts
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.___d_drop
      0.02 ±144%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.fsnotify_sb_delete
      0.04 ±104%      -0.0        0.02 ±144%      +0.0        0.06 ±  8%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.path_compare@plt
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±142%  perf-profile.children.cycles-pp.malloc@plt
      0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.invent_group_ids
      0.05 ± 74%      -0.0        0.03 ±100%      +0.0        0.06 ± 13%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp._ext4_show_options
      0.17 ± 22%      -0.0        0.15 ± 18%      -0.0        0.14 ± 19%      -0.0        0.14 ± 19%  perf-profile.children.cycles-pp.complete
      0.17 ±  9%      -0.0        0.15 ± 19%      -0.0        0.14 ± 17%      -0.0        0.15 ± 30%  perf-profile.children.cycles-pp.get_mountpoint
      0.13 ±  9%      -0.0        0.11 ± 27%      -0.0        0.11 ± 24%      -0.0        0.11 ± 21%  perf-profile.children.cycles-pp.___perf_sw_event
      0.15 ± 13%      -0.0        0.13 ± 27%      -0.0        0.13 ± 23%      +0.0        0.15 ± 27%  perf-profile.children.cycles-pp.memdup_user
      0.23 ± 31%      -0.0        0.21 ± 28%      +0.0        0.23 ± 24%      +0.0        0.24 ± 26%  perf-profile.children.cycles-pp.device_add_property_aux
      0.09 ± 18%      -0.0        0.07 ± 75%      +0.0        0.09 ± 31%      -0.0        0.08 ± 10%  perf-profile.children.cycles-pp._hashmap_iterate
      0.21 ± 20%      -0.0        0.19 ± 31%      -0.0        0.17 ± 26%      -0.0        0.18 ± 15%  perf-profile.children.cycles-pp.___sys_recvmsg
      0.14 ± 19%      -0.0        0.12 ± 35%      -0.0        0.11 ± 29%      -0.0        0.12 ± 33%  perf-profile.children.cycles-pp.__libc_recvmsg
      0.18 ± 21%      -0.0        0.16 ± 14%      -0.0        0.14 ± 14%      -0.0        0.16 ± 27%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.18 ± 20%      -0.0        0.16 ± 35%      -0.0        0.14 ± 29%      -0.0        0.15 ± 12%  perf-profile.children.cycles-pp.unix_stream_read_generic
      0.18 ± 20%      -0.0        0.16 ± 35%      -0.0        0.14 ± 29%      -0.0        0.15 ± 12%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      0.04 ± 73%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.should_failslab
      0.15 ± 19%      -0.0        0.14 ± 14%      -0.0        0.14 ± 14%      -0.0        0.12 ± 23%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait_once
      0.09 ±  9%      -0.0        0.07 ± 56%      +0.0        0.09 ± 10%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.path_put
      0.05 ± 76%      -0.0        0.03 ±100%      -0.0        0.02 ±141%      -0.0        0.04 ±100%  perf-profile.children.cycles-pp.deactivate_super
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.mntput
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.siphash24_init@plt
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__sock_create
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__attach_mnt
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__d_rehash
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.cap_capable
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.sched_clock
      0.06 ± 49%      -0.0        0.04 ± 73%      -0.0        0.06 ± 46%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.ep_send_events
      0.18 ± 22%      -0.0        0.17 ± 19%      -0.0        0.17 ± 14%      -0.0        0.16 ± 16%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait
      0.09 ± 32%      -0.0        0.08 ± 52%      -0.0        0.07 ± 23%      -0.0        0.08 ± 52%  perf-profile.children.cycles-pp.shuffle_freelist
      0.07 ± 46%      -0.0        0.05 ± 46%      -0.0        0.05 ± 51%      -0.0        0.06 ± 50%  perf-profile.children.cycles-pp.prepend_copy
      0.07 ± 21%      -0.0        0.05 ± 51%      -0.0        0.06 ± 47%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.rwsem_wake
      0.06 ± 53%      -0.0        0.05 ± 45%      +0.0        0.07 ± 56%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.stress_mwc1
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._raw_read_unlock_irqrestore
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__traverse_mounts
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_poll_gp_seq_start_unlocked
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.cgroup_show_path
      0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.02 ±141%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.check_cpu_stall
      0.02 ±141%      -0.0        0.00            +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._hashmap_get
      0.02 ±141%      -0.0        0.00            +0.0        0.04 ± 72%      +0.0        0.02 ±146%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.19 ± 21%      -0.0        0.18 ± 33%      -0.0        0.15 ± 27%      -0.0        0.16 ± 14%  perf-profile.children.cycles-pp.____sys_recvmsg
      0.09 ± 10%      -0.0        0.08 ± 20%      -0.0        0.06 ± 55%      -0.0        0.06 ± 45%  perf-profile.children.cycles-pp.rcu_nocb_try_bypass
      0.08 ± 16%      -0.0        0.06 ± 55%      -0.0        0.06 ± 48%      -0.0        0.05 ± 76%  perf-profile.children.cycles-pp.shmem_parse_one
      0.28 ±  5%      -0.0        0.26 ± 20%      -0.0        0.25 ± 15%      -0.0        0.26 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.14 ± 18%      -0.0        0.13 ± 23%      -0.0        0.13 ± 20%      -0.0        0.13 ± 20%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.05 ± 47%      -0.0        0.04 ±101%      -0.0        0.04 ± 72%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.06 ± 50%      -0.0        0.04 ± 72%      -0.0        0.05 ± 49%      +0.0        0.06 ± 55%  perf-profile.children.cycles-pp.copy_from_kernel_nofault
      0.12 ± 32%      -0.0        0.10 ± 31%      -0.0        0.11 ± 18%      +0.0        0.14 ± 28%  perf-profile.children.cycles-pp.security_file_free
      0.10 ± 22%      -0.0        0.08 ± 48%      +0.0        0.10 ± 20%      -0.0        0.10 ± 41%  perf-profile.children.cycles-pp.shmem_show_options
      0.18 ± 20%      -0.0        0.16 ± 21%      +0.0        0.20 ± 15%      +0.0        0.18 ± 27%  perf-profile.children.cycles-pp.show_type
      1.44 ± 11%      -0.0        1.43 ± 10%      -0.0        1.42 ± 14%      -0.0        1.43 ± 11%  perf-profile.children.cycles-pp.tick_sched_timer
      0.22 ± 20%      -0.0        0.20 ± 30%      -0.0        0.17 ± 27%      -0.0        0.19 ± 16%  perf-profile.children.cycles-pp.__sys_recvmsg
      0.12 ± 14%      -0.0        0.10 ± 30%      -0.0        0.09 ± 35%      -0.0        0.10 ± 13%  perf-profile.children.cycles-pp.mutex_lock
      0.09 ± 28%      -0.0        0.08 ± 53%      -0.0        0.08 ± 49%      -0.0        0.08 ± 34%  perf-profile.children.cycles-pp.__prealloc_shrinker
      0.14 ±  7%      -0.0        0.13 ± 23%      -0.0        0.12 ± 26%      -0.0        0.12 ± 21%  perf-profile.children.cycles-pp.mutex_lock_killable
      0.54 ± 30%      -0.0        0.52 ± 21%      +0.0        0.56 ± 16%      +0.0        0.57 ± 17%  perf-profile.children.cycles-pp.device_read_db_internal_filename
      0.22 ± 29%      -0.0        0.21 ± 20%      +0.0        0.25 ±  9%      +0.0        0.22 ± 21%  perf-profile.children.cycles-pp.__close_nocancel
      0.52 ± 20%      -0.0        0.51 ± 20%      +0.1        0.64 ± 11%      +0.1        0.60 ± 22%  perf-profile.children.cycles-pp.path_compare
      0.02 ±149%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.local_clock
      0.04 ± 71%      -0.0        0.02 ±142%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.children.cycles-pp.putname
      0.06 ± 48%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.strnlen_user
      0.10 ± 36%      -0.0        0.08 ± 25%      -0.0        0.07 ± 12%      -0.0        0.07 ± 45%  perf-profile.children.cycles-pp.d_instantiate
      0.10 ± 22%      -0.0        0.08 ± 25%      -0.0        0.08 ± 22%      -0.0        0.09 ± 18%  perf-profile.children.cycles-pp.put_fs_context
      0.06 ± 46%      -0.0        0.04 ± 72%      +0.0        0.06 ± 47%      -0.0        0.03 ±106%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.05 ± 74%      -0.0        0.03 ±103%      +0.0        0.06 ± 54%      +0.0        0.06 ± 47%  perf-profile.children.cycles-pp.getdelim
      0.06 ± 19%      -0.0        0.04 ±107%      -0.0        0.04 ± 75%      -0.0        0.05 ± 74%  perf-profile.children.cycles-pp.__bitmap_clear
      0.11 ± 28%      -0.0        0.10 ± 23%      -0.0        0.10 ± 27%      +0.0        0.12 ± 27%  perf-profile.children.cycles-pp.string_hash_func
      0.21 ± 20%      -0.0        0.19 ± 27%      -0.0        0.21 ± 19%      +0.0        0.22 ± 23%  perf-profile.children.cycles-pp.number
      0.40 ± 10%      -0.0        0.38 ± 14%      -0.0        0.37 ± 18%      -0.0        0.39 ± 10%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.20 ± 17%      -0.0        0.19 ± 14%      -0.0        0.18 ± 13%      -0.0        0.18 ± 19%  perf-profile.children.cycles-pp.vfs_parse_fs_param
      0.11 ± 29%      -0.0        0.10 ± 29%      +0.0        0.11 ± 16%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.11 ± 40%      -0.0        0.10 ± 25%      +0.0        0.13 ± 18%      +0.0        0.15 ± 33%  perf-profile.children.cycles-pp.seq_puts
      0.07 ± 49%      -0.0        0.06 ± 48%      -0.0        0.07 ± 47%      -0.0        0.06 ± 19%  perf-profile.children.cycles-pp.path_startswith
      0.04 ± 71%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.03 ±102%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.get_random_u32
      0.09 ± 17%      -0.0        0.08 ± 31%      -0.0        0.08 ± 29%      -0.0        0.08 ± 30%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
      0.03 ±102%      -0.0        0.02 ±142%      -0.0        0.02 ±144%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.try_charge_memcg
      0.16 ± 29%      -0.0        0.15 ± 23%      -0.0        0.16 ± 15%      +0.0        0.17 ± 22%  perf-profile.children.cycles-pp.filp_close
      0.07 ± 12%      -0.0        0.06 ± 48%      +0.0        0.08 ± 17%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.map_id_up
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±144%  perf-profile.children.cycles-pp.map_id_range_down
      0.01 ±223%      -0.0        0.00            +0.0        0.03 ±105%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.may_open
      0.04 ± 75%      -0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.inode_sb_list_add
      0.03 ±101%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.clear_inode
      0.07 ± 55%      -0.0        0.06 ± 46%      +0.0        0.08 ± 11%      -0.0        0.06 ± 48%  perf-profile.children.cycles-pp.kernfs_fop_release
      1.33 ± 10%      -0.0        1.32 ± 11%      -0.0        1.28 ± 14%      +0.0        1.34 ± 12%  perf-profile.children.cycles-pp.tick_sched_handle
      2.41 ± 11%      -0.0        2.40 ±  9%      -0.1        2.32 ± 14%      -0.1        2.35 ± 10%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.14 ± 30%      -0.0        0.13 ± 27%      -0.1        0.09 ± 23%      -0.0        0.10 ± 21%  perf-profile.children.cycles-pp.check_preempt_curr
      0.26 ± 26%      -0.0        0.24 ± 19%      +0.0        0.26 ± 14%      +0.0        0.27 ± 18%  perf-profile.children.cycles-pp.strlen
      0.18 ± 26%      -0.0        0.17 ± 14%      +0.0        0.21 ± 15%      +0.0        0.20 ± 20%  perf-profile.children.cycles-pp.up_read
      0.11 ± 24%      -0.0        0.10 ± 35%      -0.0        0.08 ± 12%      -0.0        0.07 ± 56%  perf-profile.children.cycles-pp.__srcu_read_lock
      0.04 ± 75%      -0.0        0.03 ±100%      -0.0        0.01 ±223%      +0.0        0.05 ± 49%  perf-profile.children.cycles-pp._dbus_marshal_read_uint32
      0.04 ± 72%      -0.0        0.03 ±141%      +0.0        0.04 ± 73%      +0.0        0.06 ± 50%  perf-profile.children.cycles-pp.wake_up_q
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.children.cycles-pp.from_kgid_munged
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.filemap_get_entry
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.hashmap_get2
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.mounts_release
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.task_tick_fair
      0.06 ± 74%      -0.0        0.04 ± 72%      +0.0        0.06 ± 50%      +0.0        0.09 ± 31%  perf-profile.children.cycles-pp.string_table_lookup
      0.24 ± 41%      -0.0        0.23 ± 44%      -0.1        0.16 ±  9%      -0.1        0.19 ± 18%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.28 ± 12%      -0.0        0.27 ± 44%      -0.1        0.23 ± 13%      -0.0        0.25 ± 21%  perf-profile.children.cycles-pp.pcpu_free_area
      0.10 ± 15%      -0.0        0.09 ± 15%      -0.0        0.05 ± 71%      -0.0        0.09 ± 57%  perf-profile.children.cycles-pp.xas_descend
      0.12 ± 19%      -0.0        0.11 ± 11%      -0.0        0.10 ± 28%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp.__list_add_valid
      0.14 ± 11%      -0.0        0.13 ± 26%      -0.0        0.13 ± 26%      -0.0        0.12 ± 28%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.14 ± 25%      -0.0        0.12 ± 33%      +0.0        0.14 ± 25%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.strlen@plt
      0.27 ± 23%      -0.0        0.26 ± 19%      +0.0        0.28 ± 14%      +0.0        0.27 ± 35%  perf-profile.children.cycles-pp.kernfs_iop_permission
      0.07 ± 53%      -0.0        0.06 ± 52%      -0.0        0.04 ± 73%      +0.0        0.08 ± 28%  perf-profile.children.cycles-pp.pcpu_next_fit_region
      0.04 ± 72%      -0.0        0.03 ±101%      -0.0        0.02 ±142%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.03 ±108%      -0.0        0.02 ±142%      +0.0        0.04 ± 77%      +0.0        0.04 ±118%  perf-profile.children.cycles-pp.btrfs_show_options
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.children.cycles-pp.note_gp_changes
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_inode_getattr
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.sd_bus_message_open_container
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.strncmp
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_sb_mount
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._hashmap_remove
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.fd_install
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.kernfs_unlink_open_file
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.place_entity
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__open64_nocancel
      0.01 ±223%      -0.0        0.00            +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.pick_link
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.04 ± 45%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.device_get_id_filename
      0.03 ±100%      -0.0        0.02 ±141%      +0.0        0.03 ± 70%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.unlock_mount
      0.10 ± 32%      -0.0        0.09 ± 26%      -0.1        0.05 ± 74%      -0.0        0.07 ± 49%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.09 ± 18%      -0.0        0.08 ± 34%      -0.0        0.07 ± 16%      -0.0        0.06 ± 55%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.08 ± 24%      -0.0        0.07 ± 23%      +0.0        0.08 ± 23%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.16 ±  9%      -0.0        0.15 ± 18%      -0.0        0.14 ± 23%      -0.0        0.14 ± 15%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.12 ± 25%      -0.0        0.12 ± 30%      -0.0        0.10 ± 25%      -0.0        0.12 ± 43%  perf-profile.children.cycles-pp.allocate_slab
      0.11 ± 16%      -0.0        0.10 ± 20%      -0.0        0.10 ± 22%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.04 ±107%      -0.0        0.03 ±102%      +0.0        0.06 ± 11%      +0.0        0.06 ± 61%  perf-profile.children.cycles-pp.__x64_sys_readlink
      0.04 ± 71%      -0.0        0.03 ±100%      -0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.free_unref_page_list
      0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.04 ± 73%  perf-profile.children.cycles-pp.__mnt_want_write
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.irq_work_run_list
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.set_cached_acl
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__init_rwsem
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ramfs_init_fs_context
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.timekeeping_advance
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.update_wall_time
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_path_mknod
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.rcu_segcblist_pend_cbs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.make_kuid
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.d_set_d_op
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.mem_cgroup_kmem_disabled
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.idr_get_free
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_close_container
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.mnt_cursor_del
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.kmalloc_reserve
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.available_idle_cpu
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__memcpy
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__skb_datagram_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sysvec_irq_work
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__sysvec_irq_work
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.irq_work_run
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.irq_work_single
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._printk
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_stream_read_actor
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.vprintk_emit
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.console_unlock
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.console_flush_all
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.refill_stock
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_sync_init
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.reweight_entity
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.security_path_unlink
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.locks_remove_posix
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.exc_page_fault
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.atime_needs_update
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.uncharge_batch
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.pick_file
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.stress_ramfs_umount
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.resched_curr
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.proc_self_get_link
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.children.cycles-pp.seq_release
      0.13 ± 12%      -0.0        0.12 ± 28%      -0.0        0.12 ± 13%      -0.0        0.13 ± 23%  perf-profile.children.cycles-pp.put_prev_entity
      0.06 ± 46%      -0.0        0.05 ± 49%      -0.0        0.04 ± 73%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.strscpy
      0.14 ± 30%      -0.0        0.13 ± 36%      +0.0        0.14 ± 17%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      2.39 ± 11%      -0.0        2.38 ±  9%      -0.1        2.31 ± 14%      -0.1        2.34 ± 10%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.26 ± 12%      -0.0        0.25 ± 22%      -0.0        0.24 ± 13%      -0.0        0.22 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.17 ± 27%      -0.0        0.16 ± 24%      -0.0        0.14 ± 14%      -0.0        0.13 ± 18%  perf-profile.children.cycles-pp.__list_lru_init
      0.15 ± 33%      -0.0        0.14 ± 23%      +0.0        0.19 ± 18%      +0.0        0.15 ± 16%  perf-profile.children.cycles-pp.sendmsg
      0.05 ± 46%      -0.0        0.05 ± 72%      -0.0        0.01 ±223%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.d_set_mounted
      0.03 ±100%      -0.0        0.02 ±144%      -0.0        0.02 ±142%      +0.0        0.04 ± 73%  perf-profile.children.cycles-pp.__isoc99_sscanf
      0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.03 ±101%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.strjoin_real
      0.04 ± 72%      -0.0        0.04 ±102%      +0.0        0.04 ± 73%      -0.0        0.04 ±107%  perf-profile.children.cycles-pp.os_xsave
      0.04 ± 75%      -0.0        0.04 ± 72%      +0.0        0.07 ± 20%      +0.0        0.07 ± 62%  perf-profile.children.cycles-pp.readlink
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp._find_first_bit
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._IO_link_in
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.04 ± 72%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.siphash24_compress@plt
      0.16 ± 13%      -0.0        0.16 ± 22%      -0.0        0.13 ± 17%      -0.0        0.13 ± 24%  perf-profile.children.cycles-pp.simple_lookup
      0.08 ± 13%      -0.0        0.08 ± 28%      -0.0        0.05 ± 71%      -0.0        0.06 ± 79%  perf-profile.children.cycles-pp.set_anon_super_fc
      0.17 ± 22%      -0.0        0.16 ± 38%      -0.0        0.16 ± 10%      -0.0        0.15 ± 18%  perf-profile.children.cycles-pp.kfree
      0.20 ± 13%      -0.0        0.20 ±  8%      -0.0        0.20 ± 12%      -0.0        0.20 ± 10%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.19 ± 21%      -0.0        0.18 ± 24%      +0.0        0.21 ± 13%      -0.0        0.18 ± 26%  perf-profile.children.cycles-pp.strchr@plt
      0.19 ± 23%      -0.0        0.18 ± 28%      +0.0        0.20 ± 15%      +0.0        0.20 ± 32%  perf-profile.children.cycles-pp.strchr
      0.04 ± 77%      -0.0        0.04 ± 71%      -0.0        0.00            -0.0        0.02 ±142%  perf-profile.children.cycles-pp.__put_mountpoint
      0.04 ± 74%      -0.0        0.04 ±107%      -0.0        0.01 ±223%      -0.0        0.04 ± 73%  perf-profile.children.cycles-pp.inode_init_once
      0.07 ± 16%      -0.0        0.06 ± 14%      -0.0        0.04 ± 73%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.security_file_open
      0.11 ± 10%      -0.0        0.11 ± 21%      -0.0        0.10 ± 14%      -0.0        0.10 ± 53%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.08 ± 19%      -0.0        0.08 ± 13%      -0.0        0.07 ± 21%      -0.1        0.03 ±102%  perf-profile.children.cycles-pp.find_lock_entries
      0.07 ± 19%      -0.0        0.06 ± 23%      +0.0        0.07 ± 19%      +0.0        0.07 ± 15%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.10 ± 31%      -0.0        0.10 ± 29%      +0.0        0.11 ± 16%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.unit_name_escape
      0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.03 ±103%      +0.0        0.04 ± 75%  perf-profile.children.cycles-pp.dbus_message_get_interface
      0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.05 ± 49%      +0.0        0.05 ± 72%  perf-profile.children.cycles-pp.kernfs_fop_open
      0.06 ± 52%      -0.0        0.05 ± 50%      +0.0        0.06 ± 11%      +0.0        0.06 ± 60%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.07 ± 49%      -0.0        0.06 ± 56%      +0.0        0.08 ± 20%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.path_simplify
      0.12 ± 28%      -0.0        0.11 ± 24%      +0.0        0.14 ± 22%      +0.0        0.15 ± 23%  perf-profile.children.cycles-pp.dev_uevent
      0.12 ± 19%      -0.0        0.12 ± 20%      -0.0        0.10 ± 12%      -0.0        0.10 ± 27%  perf-profile.children.cycles-pp.__d_add
      0.09 ± 24%      -0.0        0.09 ± 20%      -0.1        0.04 ±104%      -0.0        0.08 ± 31%  perf-profile.children.cycles-pp.__pthread_mutex_lock
      0.11 ± 20%      -0.0        0.11 ± 31%      -0.0        0.09 ± 26%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.recvmsg
      0.07 ± 24%      -0.0        0.06 ± 50%      -0.0        0.05 ± 45%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.shmem_free_in_core_inode
      0.10 ± 50%      -0.0        0.09 ± 29%      +0.0        0.10 ± 16%      +0.0        0.12 ± 30%  perf-profile.children.cycles-pp.apparmor_file_free_security
      0.09 ± 50%      -0.0        0.09 ± 25%      +0.0        0.12 ± 24%      +0.0        0.13 ± 23%  perf-profile.children.cycles-pp.add_uevent_var
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.dbus_message_get_reply_serial
      0.06 ± 58%      -0.0        0.05 ± 74%      +0.0        0.08 ± 19%      +0.0        0.08 ± 34%  perf-profile.children.cycles-pp.strcspn@plt
      0.14 ± 24%      -0.0        0.14 ± 26%      -0.0        0.12 ± 19%      -0.0        0.13 ± 22%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.10 ± 20%      -0.0        0.10 ± 33%      -0.0        0.08 ± 16%      -0.0        0.09 ± 24%  perf-profile.children.cycles-pp.get_fs_type
      0.13 ± 15%      -0.0        0.12 ±  8%      -0.0        0.11 ± 20%      -0.0        0.11 ± 20%  perf-profile.children.cycles-pp.shmem_evict_inode
      0.08 ± 16%      -0.0        0.08 ± 20%      -0.0        0.07 ± 23%      -0.0        0.07 ± 14%  perf-profile.children.cycles-pp.folio_alloc
      0.07 ± 17%      -0.0        0.06 ± 19%      -0.0        0.06 ± 46%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.xas_find
      0.07 ± 18%      -0.0        0.07 ± 19%      -0.0        0.07 ± 21%      -0.0        0.07 ± 16%  perf-profile.children.cycles-pp.__alloc_skb
      0.10 ± 10%      -0.0        0.10 ± 23%      -0.0        0.08 ± 13%      -0.0        0.09 ± 54%  perf-profile.children.cycles-pp.llist_add_batch
      0.10 ± 25%      -0.0        0.10 ± 41%      -0.0        0.10 ± 25%      -0.0        0.08 ± 61%  perf-profile.children.cycles-pp.xas_alloc
      0.51 ± 20%      -0.0        0.50 ± 24%      -0.1        0.42 ±  8%      -0.0        0.48 ± 11%  perf-profile.children.cycles-pp.menu_select
      0.10 ± 24%      -0.0        0.09 ± 18%      -0.0        0.07 ± 52%      -0.0        0.08 ± 20%  perf-profile.children.cycles-pp.security_inode_permission
      0.11 ± 17%      -0.0        0.10 ± 17%      +0.0        0.11 ± 20%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.20 ± 25%      -0.0        0.20 ± 24%      +0.0        0.21 ± 13%      +0.0        0.22 ± 12%  perf-profile.children.cycles-pp.update_blocked_averages
      0.07 ± 50%      -0.0        0.07 ± 44%      +0.0        0.10 ± 17%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.__lookup_slow
      0.23 ± 20%      -0.0        0.22 ± 20%      +0.0        0.26 ± 18%      +0.0        0.24 ± 16%  perf-profile.children.cycles-pp.____sys_sendmsg
      0.03 ±100%      -0.0        0.03 ±101%      -0.0        0.02 ±141%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.apparmor_file_open
      0.06 ± 46%      -0.0        0.06 ± 11%      -0.0        0.06 ± 52%      -0.0        0.05 ± 73%  perf-profile.children.cycles-pp.shmem_undo_range
      0.05 ± 72%      -0.0        0.05 ± 45%      -0.0        0.05 ± 47%      +0.0        0.05 ± 48%  perf-profile.children.cycles-pp.strlcpy
      0.06 ± 54%      -0.0        0.06 ± 71%      +0.0        0.08 ± 12%      +0.0        0.06 ± 45%  perf-profile.children.cycles-pp.select_task_rq
      0.06 ± 71%      -0.0        0.06 ± 58%      +0.0        0.09 ± 16%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.shmem_file_read_iter
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.set_strjoin
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ihold
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.read_counters
      0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.23 ± 14%      -0.0        0.22 ± 12%      -0.0        0.22 ± 15%      -0.0        0.21 ± 13%  perf-profile.children.cycles-pp.__legitimize_mnt
      0.14 ± 19%      -0.0        0.14 ± 24%      -0.0        0.13 ± 22%      -0.0        0.12 ± 11%  perf-profile.children.cycles-pp.rebalance_domains
      0.76 ± 10%      +0.0        0.76 ± 17%      -0.0        0.72 ± 14%      -0.0        0.74 ± 15%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.75 ± 10%      +0.0        0.75 ± 16%      -0.0        0.71 ± 14%      -0.0        0.73 ± 16%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.14 ± 22%      +0.0        0.14 ± 18%      -0.0        0.12 ± 12%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.set_root
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.pcpu_chunk_relocate
      0.39 ± 23%      +0.0        0.39 ± 26%      -0.0        0.38 ± 10%      -0.0        0.38 ± 19%  perf-profile.children.cycles-pp.cfree
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_execveat_common
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.execve
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.m_next
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ksys_write
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.vfs_write
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.rb_next
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.mnt_reset_fs
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_add
      0.04 ± 75%      +0.0        0.04 ± 70%      -0.0        0.04 ± 71%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.cpuacct_charge
      0.11 ± 27%      +0.0        0.11 ± 23%      +0.0        0.11 ± 22%      -0.0        0.10 ± 14%  perf-profile.children.cycles-pp.make_vfsuid
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__snprintf_chk
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.apparmor_path_unlink
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.string
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.errseq_sample
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mount_too_revealing
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.simple_unlink
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.alloc_pages
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sd_bus_message_append
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp._ordered_hashmap_ensure_allocated
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.path_get
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp._hashmap_size
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dentry_path
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.bprm_execve
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cg_trim
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.simple_write_end
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ktime_get_mono_fast_ns
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__x64_sys_poll
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.03 ±102%  perf-profile.children.cycles-pp.__poll
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.copy_page_to_iter
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.insert_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.locks_remove_file
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.safe_close
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.error_entry
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.wq_worker_running
      0.10 ± 24%      +0.0        0.10 ± 19%      +0.0        0.11 ± 17%      +0.0        0.10 ± 12%  perf-profile.children.cycles-pp.ct_idle_exit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.make_vfsgid
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._set_put_strdup_full
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.memcmp@plt
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ep_item_poll
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.unit_type_from_string
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.connect
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.unix_stream_connect
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.children.cycles-pp.strdup@plt
      0.07 ± 72%      +0.0        0.07 ± 16%      +0.0        0.08 ± 11%      +0.0        0.08 ± 52%  perf-profile.children.cycles-pp.xas_start
      0.04 ± 72%      +0.0        0.04 ± 72%      +0.0        0.06 ± 48%      +0.0        0.05 ± 74%  perf-profile.children.cycles-pp.mnt_fstype_is_pseudofs
      0.02 ±142%      +0.0        0.02 ±142%      +0.0        0.04 ±103%      +0.0        0.03 ±102%  perf-profile.children.cycles-pp.strcmp_ptr
      0.06 ± 80%      +0.0        0.06 ± 81%      +0.0        0.10 ± 22%      +0.0        0.09 ± 30%  perf-profile.children.cycles-pp.path_equal
      0.24 ± 20%      +0.0        0.24 ± 16%      +0.0        0.28 ± 18%      +0.0        0.25 ± 14%  perf-profile.children.cycles-pp.___sys_sendmsg
      0.22 ± 28%      +0.0        0.23 ± 19%      -0.0        0.19 ± 22%      +0.0        0.24 ± 27%  perf-profile.children.cycles-pp.ep_poll
      0.11 ± 12%      +0.0        0.11 ± 23%      -0.0        0.09 ± 11%      -0.0        0.10 ± 30%  perf-profile.children.cycles-pp.generic_exec_single
      0.12 ± 21%      +0.0        0.12 ± 18%      -0.0        0.11 ± 24%      -0.0        0.10 ± 24%  perf-profile.children.cycles-pp.mutex_unlock
      0.09 ± 14%      +0.0        0.09 ± 13%      +0.0        0.09 ± 27%      -0.0        0.07 ± 26%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.11 ± 50%      +0.0        0.12 ± 27%      +0.1        0.17 ± 22%      +0.0        0.13 ± 33%  perf-profile.children.cycles-pp._hashmap_first_key_and_value
      0.02 ±141%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.wake_up_bit
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.security_path_mknod
      0.02 ±142%      +0.0        0.02 ±144%      +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.trigger_load_balance
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.touch_atime
      0.06 ± 46%      +0.0        0.06 ± 48%      +0.0        0.06 ± 48%      -0.0        0.05 ± 78%  perf-profile.children.cycles-pp.current_time
      0.04 ± 71%      +0.0        0.04 ± 75%      +0.0        0.05 ± 46%      -0.0        0.04 ±101%  perf-profile.children.cycles-pp.strextend_with_separator
      0.22 ± 21%      +0.0        0.22 ± 20%      +0.0        0.25 ± 19%      +0.0        0.23 ± 17%  perf-profile.children.cycles-pp.sock_sendmsg
      0.24 ± 20%      +0.0        0.24 ± 16%      +0.0        0.29 ± 15%      +0.0        0.26 ± 12%  perf-profile.children.cycles-pp.__sys_sendmsg
      1.06 ± 11%      +0.0        1.06 ± 14%      -0.0        1.04 ± 13%      +0.0        1.06 ± 13%  perf-profile.children.cycles-pp.scheduler_tick
      0.10 ± 25%      +0.0        0.10 ± 23%      +0.0        0.11 ± 20%      +0.0        0.10 ± 10%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.11 ± 27%      +0.0        0.12 ± 30%      +0.0        0.13 ± 24%      +0.0        0.13 ± 25%  perf-profile.children.cycles-pp.alloc_fd
      0.16 ± 55%      +0.0        0.17 ± 57%      -0.1        0.09 ± 12%      -0.0        0.14 ± 30%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.21 ± 22%      +0.0        0.22 ± 18%      +0.0        0.24 ± 17%      +0.0        0.22 ± 15%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.04 ±102%      +0.0        0.04 ±107%      -0.0        0.00            -0.0        0.03 ±103%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.02 ±223%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.strnlen
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.posix_acl_create
      0.02 ±141%      +0.0        0.02 ±144%      +0.0        0.02 ±144%      -0.0        0.00        perf-profile.children.cycles-pp.devpts_show_options
      0.10 ± 19%      +0.0        0.11 ± 20%      -0.0        0.08 ± 27%      -0.0        0.09 ± 40%  perf-profile.children.cycles-pp.shmem_parse_options
      0.12 ± 21%      +0.0        0.12 ± 19%      +0.0        0.12 ± 22%      -0.0        0.11 ± 16%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.17 ± 19%      +0.0        0.18 ± 20%      -0.0        0.14 ± 10%      -0.0        0.15 ± 16%  perf-profile.children.cycles-pp.nd_jump_root
      0.21 ± 11%      +0.0        0.21 ± 12%      -0.0        0.18 ± 13%      -0.0        0.20 ± 17%  perf-profile.children.cycles-pp.set_next_entity
      0.09 ± 26%      +0.0        0.10 ± 34%      +0.0        0.10 ± 15%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.08 ± 14%      +0.0        0.09 ± 14%      -0.0        0.08 ± 52%      -0.0        0.05 ± 75%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.04 ± 71%      +0.0        0.05 ± 75%      +0.0        0.04 ± 71%      +0.0        0.05 ± 45%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.14 ± 21%      +0.0        0.14 ± 26%      +0.0        0.15 ± 14%      +0.0        0.15 ± 30%  perf-profile.children.cycles-pp.mangle_path
      0.07 ± 28%      +0.0        0.08 ± 45%      +0.0        0.08 ± 24%      +0.0        0.08 ± 22%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.08 ± 22%      +0.0        0.09 ± 27%      +0.0        0.09 ± 14%      +0.0        0.09 ± 49%  perf-profile.children.cycles-pp.common_perm_cond
      0.27 ± 15%      +0.0        0.28 ± 18%      -0.0        0.25 ± 12%      +0.0        0.28 ± 17%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cmd_stat
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dispatch_events
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.process_interval
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.lru_add_fn
      0.03 ±100%      +0.0        0.04 ± 73%      -0.0        0.03 ±100%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.__unfreeze_partials
      0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.02 ±144%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.build_open_flags
      0.02 ±141%      +0.0        0.02 ±143%      +0.0        0.02 ±141%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.rcu_sync_dtor
      0.04 ±109%      +0.0        0.04 ± 71%      +0.0        0.04 ± 72%      -0.0        0.04 ±109%  perf-profile.children.cycles-pp.__libc_start_main
      0.04 ±109%      +0.0        0.04 ± 71%      +0.0        0.04 ± 72%      -0.0        0.04 ±109%  perf-profile.children.cycles-pp.main
      0.04 ±109%      +0.0        0.04 ± 71%      +0.0        0.04 ± 72%      -0.0        0.04 ±109%  perf-profile.children.cycles-pp.run_builtin
      0.13 ± 21%      +0.0        0.14 ± 30%      -0.0        0.12 ± 23%      +0.0        0.14 ± 14%  perf-profile.children.cycles-pp.idle_cpu
      0.08 ± 29%      +0.0        0.09 ± 23%      +0.0        0.08 ±  8%      +0.0        0.09 ± 21%  perf-profile.children.cycles-pp._find_next_and_bit
      0.12 ± 14%      +0.0        0.13 ± 26%      +0.0        0.13 ± 25%      +0.0        0.14 ± 19%  perf-profile.children.cycles-pp.__libc_sendmsg
      0.04 ±105%      +0.0        0.04 ± 73%      -0.0        0.01 ±223%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp._dbus_first_type_in_signature
      0.24 ± 30%      +0.0        0.25 ± 16%      -0.0        0.22 ± 20%      +0.0        0.26 ± 26%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      0.10 ± 47%      +0.0        0.11 ± 25%      +0.0        0.12 ± 22%      +0.0        0.12 ± 27%  perf-profile.children.cycles-pp.fput
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.security_file_permission
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp._dbus_string_validate_utf8
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.rcu_exp_jiffies_till_stall_check
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.d_flags_for_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.__bitmap_set
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.unix_destruct_scm
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ramfs_parse_param
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.kernfs_refresh_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.handle_dots
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__errno_location
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.unit_name_from_path
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.i_callback
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._dbus_type_reader_next
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.gettid
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.00        perf-profile.children.cycles-pp.__sys_connect
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_connect
      0.02 ±142%      +0.0        0.03 ±100%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.03 ±101%      +0.0        0.04 ± 72%      +0.0        0.04 ± 72%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.12 ± 15%      +0.0        0.12 ± 17%      -0.0        0.11 ± 29%      +0.0        0.12 ± 23%  perf-profile.children.cycles-pp.lookup_dcache
      0.23 ± 29%      +0.0        0.24 ± 17%      -0.0        0.21 ± 21%      +0.0        0.25 ± 27%  perf-profile.children.cycles-pp.do_epoll_wait
      0.09 ± 49%      +0.0        0.10 ± 12%      +0.0        0.09 ± 19%      +0.0        0.10 ± 36%  perf-profile.children.cycles-pp.shmem_put_super
      0.11 ± 24%      +0.0        0.12 ± 10%      +0.0        0.12 ± 17%      +0.0        0.11 ± 27%  perf-profile.children.cycles-pp.strcmp
      0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.04 ± 71%      +0.0        0.05 ± 45%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.bus_label_unescape_n
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.simple_strntoull
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.sock_wfree
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mnt_fs_strdup_options
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.vmap_pages_pud_range
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.skb_release_head_state
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.legitimize_links
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.object_path_is_valid
      0.05 ± 76%      +0.0        0.06 ± 19%      -0.0        0.03 ±100%      +0.0        0.05 ± 77%  perf-profile.children.cycles-pp.shrink_dcache_parent
      0.02 ±142%      +0.0        0.03 ±102%      +0.0        0.02 ±142%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.03 ±101%      +0.0        0.04 ± 45%      +0.0        0.04 ± 71%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.copyout
      0.05 ± 73%      +0.0        0.06 ± 13%      +0.0        0.05 ± 48%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp._copy_to_iter
      0.14 ± 33%      +0.0        0.15 ± 28%      -0.0        0.11 ± 31%      +0.0        0.14 ± 25%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.08 ± 49%      +0.0        0.08 ± 11%      -0.0        0.07 ± 20%      +0.0        0.08 ± 52%  perf-profile.children.cycles-pp.percpu_counter_destroy
      0.10 ± 20%      +0.0        0.11 ± 15%      +0.0        0.11 ± 24%      +0.0        0.12 ±  9%  perf-profile.children.cycles-pp.perf_rotate_context
      0.08 ± 21%      +0.0        0.08 ± 13%      +0.0        0.10 ± 28%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.14 ± 12%      +0.0        0.15 ± 21%      +0.0        0.14 ± 21%      +0.0        0.16 ± 14%  perf-profile.children.cycles-pp.update_rq_clock
      0.07 ± 49%      +0.0        0.08 ± 47%      +0.0        0.08 ± 20%      +0.0        0.09 ± 32%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.04 ± 72%      +0.0        0.05 ± 47%      +0.0        0.06 ± 21%      -0.0        0.04 ± 73%  perf-profile.children.cycles-pp.perf_pmu_nop_void
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.check_spread
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.memparse
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.clear_page_erms
      0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.02 ±146%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.08 ± 21%      +0.0        0.09 ± 29%      +0.0        0.08 ±  7%      -0.0        0.07 ± 47%  perf-profile.children.cycles-pp.pcpu_block_update
      0.06 ± 49%      +0.0        0.08 ±  9%      +0.0        0.09 ± 19%      +0.0        0.08 ± 26%  perf-profile.children.cycles-pp.path_hash_func
      0.08 ± 47%      +0.0        0.10 ± 32%      +0.0        0.09 ± 16%      -0.0        0.08 ± 31%  perf-profile.children.cycles-pp.free@plt
      0.28 ±  9%      +0.0        0.29 ± 43%      -0.0        0.24 ± 14%      +0.0        0.29 ± 21%  perf-profile.children.cycles-pp.percpu_free_rwsem
      0.03 ±102%      +0.0        0.04 ± 72%      -0.0        0.02 ± 99%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.08 ± 14%      +0.0        0.09 ± 25%      +0.0        0.08 ± 17%      +0.0        0.09 ± 21%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.02 ±142%      +0.0        0.03 ±103%      +0.0        0.04 ± 71%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.23 ±  8%      +0.0        0.25 ± 19%      -0.0        0.22 ± 11%      -0.0        0.23 ±  8%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.77 ±  7%      +0.0        0.78 ± 41%      -0.1        0.66 ± 15%      -0.1        0.70 ± 23%  perf-profile.children.cycles-pp.delayed_free_vfsmnt
      0.05 ±124%      +0.0        0.07 ±101%      -0.1        0.00            -0.0        0.04 ±100%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.07 ± 52%      +0.0        0.09 ± 21%      +0.0        0.08 ± 20%      +0.0        0.09 ± 23%  perf-profile.children.cycles-pp.sock_def_readable
      0.00            +0.0        0.02 ±223%      +0.0        0.04 ± 44%      +0.0        0.00        perf-profile.children.cycles-pp.__rw_verify_area
      0.28 ± 32%      +0.0        0.30 ± 17%      -0.0        0.26 ± 19%      +0.0        0.32 ± 21%  perf-profile.children.cycles-pp.epoll_wait
      0.28 ±  9%      +0.0        0.30 ± 43%      -0.0        0.24 ± 14%      +0.0        0.29 ± 20%  perf-profile.children.cycles-pp.destroy_super_work
      0.26 ± 14%      +0.0        0.28 ±  9%      -0.0        0.25 ± 12%      -0.0        0.25 ± 15%  perf-profile.children.cycles-pp.clockevents_program_event
      0.98 ± 12%      +0.0        1.00 ± 15%      -0.0        0.94 ± 22%      +0.0        1.00 ± 10%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.01 ±223%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.autofs_show_options
      1.33 ± 15%      +0.0        1.35 ± 17%      -0.1        1.28 ± 23%      +0.0        1.35 ± 10%  perf-profile.children.cycles-pp.newidle_balance
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp._dbus_type_reader_get_current_type
      0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.04 ± 73%      +0.0        0.04 ± 80%  perf-profile.children.cycles-pp.seq_dentry
      1.26 ± 14%      +0.0        1.28 ± 14%      -0.1        1.20 ± 21%      +0.0        1.26 ±  9%  perf-profile.children.cycles-pp.load_balance
      0.29 ± 16%      +0.0        0.31 ± 18%      +0.0        0.30 ± 16%      +0.0        0.31 ± 19%  perf-profile.children.cycles-pp.___slab_alloc
      0.00            +0.0        0.02 ±142%      +0.0        0.02 ±141%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.call_cpuidle
      0.17 ± 25%      +0.0        0.19 ± 31%      +0.0        0.17 ± 30%      +0.0        0.19 ± 16%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.00            +0.0        0.02 ±143%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.radix_tree_node_rcu_free
      0.34 ± 14%      +0.0        0.36 ± 19%      +0.0        0.37 ± 12%      +0.0        0.36 ±  6%  perf-profile.children.cycles-pp.__d_lookup
      0.15 ± 12%      +0.0        0.18 ± 17%      +0.0        0.16 ± 25%      +0.0        0.17 ± 17%  perf-profile.children.cycles-pp.d_lookup
      0.14 ± 14%      +0.0        0.16 ± 18%      -0.0        0.13 ± 16%      +0.0        0.15 ±  7%  perf-profile.children.cycles-pp.read_tsc
      0.08 ± 27%      +0.0        0.10 ± 47%      -0.0        0.07 ± 24%      -0.0        0.06 ± 63%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.07 ± 52%      +0.0        0.10 ± 15%      +0.0        0.08 ± 17%      +0.0        0.09 ± 22%  perf-profile.children.cycles-pp.__fget_light
      1.13 ± 12%      +0.0        1.16 ± 15%      -0.0        1.09 ± 23%      +0.0        1.14 ± 10%  perf-profile.children.cycles-pp.find_busiest_group
      0.05 ± 74%      +0.0        0.08 ± 27%      +0.0        0.08 ± 19%      +0.0        0.08 ± 23%  perf-profile.children.cycles-pp.memcpy@plt
      1.10 ± 12%      +0.0        1.13 ± 14%      -0.0        1.06 ± 22%      +0.0        1.11 ± 10%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.04 ± 75%      +0.0        0.07 ± 12%      +0.0        0.06 ± 16%      +0.0        0.06 ± 46%  perf-profile.children.cycles-pp.lookup_constant
      0.00            +0.0        0.04 ± 71%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__vmap_pages_range_noflush
      0.00            +0.0        0.04 ± 71%      +0.0        0.04 ± 73%      +0.0        0.03 ± 70%  perf-profile.children.cycles-pp.get_partial_node
      0.70 ±  7%      +0.0        0.74 ± 36%      -0.1        0.62 ± 18%      -0.0        0.67 ± 19%  perf-profile.children.cycles-pp.free_percpu
      0.00            +0.0        0.04 ± 71%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.pcpu_map_pages
      0.00            +0.0        0.04 ± 73%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__alloc_pages_bulk
      1.30 ± 16%      +0.0        1.34 ± 18%      -0.0        1.27 ± 25%      +0.1        1.38 ± 12%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.20 ± 19%      +0.0        0.24 ± 13%      +0.0        0.20 ± 20%      +0.0        0.20 ± 23%  perf-profile.children.cycles-pp.__list_del_entry_valid
      1.27 ± 17%      +0.0        1.32 ± 18%      -0.0        1.25 ± 26%      +0.1        1.35 ± 12%  perf-profile.children.cycles-pp.do_nanosleep
      0.00            +0.0        0.05 ± 73%      +0.0        0.03 ±102%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__vmalloc_area_node
      1.31 ± 16%      +0.0        1.36 ± 18%      -0.0        1.28 ± 26%      +0.1        1.39 ± 13%  perf-profile.children.cycles-pp.common_nsleep
      1.33 ± 16%      +0.1        1.39 ± 18%      -0.0        1.31 ± 26%      +0.1        1.42 ± 13%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.00            +0.1        0.07 ± 22%      +0.0        0.03 ±102%      +0.0        0.02 ±145%  perf-profile.children.cycles-pp.pcpu_alloc_chunk
      0.00            +0.1        0.07 ± 22%      +0.0        0.03 ±102%      +0.0        0.02 ±145%  perf-profile.children.cycles-pp.__vmalloc_node
      0.12 ± 30%      +0.1        0.19 ± 36%      +0.1        0.18 ± 39%      +0.0        0.14 ± 25%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.21 ±  9%      +0.1        0.28 ± 27%      +0.0        0.24 ± 15%      +0.1        0.28 ± 15%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.07 ± 25%      +0.0        0.03 ±102%      +0.0        0.02 ±145%  perf-profile.children.cycles-pp.pcpu_create_chunk
      0.00            +0.1        0.07 ± 25%      +0.0        0.03 ±102%      +0.0        0.02 ±145%  perf-profile.children.cycles-pp.__vmalloc_node_range
      1.46 ± 16%      +0.1        1.53 ± 18%      -0.0        1.42 ± 27%      +0.1        1.54 ± 12%  perf-profile.children.cycles-pp.clock_nanosleep
      0.66 ±  6%      +0.1        0.74 ± 14%      -0.0        0.64 ±  9%      +0.0        0.66 ± 17%  perf-profile.children.cycles-pp.pcpu_alloc_area
      0.00            +0.1        0.08 ± 29%      +0.1        0.07 ± 51%      +0.0        0.05 ± 75%  perf-profile.children.cycles-pp.init_timer_key
      0.00            +0.1        0.10 ± 27%      +0.1        0.08 ± 20%      +0.1        0.07 ± 15%  perf-profile.children.cycles-pp.pcpu_next_md_free_region
      0.00            +0.1        0.10 ± 25%      +0.1        0.11 ± 26%      +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.12 ± 21%      +0.1        0.09 ± 20%      +0.1        0.09 ± 13%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
      0.19 ±102%      +0.2        0.38 ± 77%      -0.0        0.16 ± 71%      -0.0        0.16 ±110%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.35 ± 47%      +0.2        0.55 ± 47%      -0.1        0.28 ± 52%      -0.0        0.32 ± 46%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.2        0.20 ± 24%      +0.2        0.20 ± 27%      +0.2        0.18 ± 19%  perf-profile.children.cycles-pp.rmqueue
      0.00            +0.2        0.20 ± 29%      +0.2        0.19 ± 24%      +0.2        0.17 ± 15%  perf-profile.children.cycles-pp.rcu_segcblist_init
      0.17 ±118%      +0.2        0.37 ± 79%      -0.0        0.15 ± 77%      -0.0        0.15 ±118%  perf-profile.children.cycles-pp.tick_irq_enter
      0.07 ± 15%      +0.2        0.28 ± 18%      +0.2        0.31 ± 25%      +0.2        0.26 ± 20%  perf-profile.children.cycles-pp.__alloc_pages
      0.01 ±223%      +0.2        0.23 ± 19%      +0.2        0.24 ± 25%      +0.2        0.20 ± 20%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.2        0.24 ± 21%      +0.3        0.26 ± 21%      +0.2        0.20 ± 26%  perf-profile.children.cycles-pp.pcpu_alloc_pages
      0.00            +0.3        0.29 ± 18%      +0.3        0.30 ± 22%      +0.2        0.24 ± 28%  perf-profile.children.cycles-pp.pcpu_populate_chunk
      0.00            +0.4        0.36 ± 19%      +0.4        0.35 ± 20%      +0.3        0.29 ± 25%  perf-profile.children.cycles-pp.pcpu_balance_populated
      0.00            +0.4        0.36 ± 19%      +0.4        0.35 ± 21%      +0.3        0.29 ± 26%  perf-profile.children.cycles-pp.pcpu_balance_workfn
      1.80 ±  7%      +0.5        2.28 ± 14%      +0.3        2.14 ± 14%      +0.5        2.26 ± 20%  perf-profile.children.cycles-pp.memset_orig
      4.81 ±  3%      +0.7        5.55 ± 28%      -0.1        4.70 ± 20%      -0.1        4.69 ± 27%  perf-profile.children.cycles-pp.kthread
      4.81 ±  3%      +0.7        5.55 ± 28%      -0.1        4.70 ± 20%      -0.1        4.69 ± 27%  perf-profile.children.cycles-pp.ret_from_fork
      0.58 ± 38%      +1.0        1.58 ± 81%      +0.5        1.09 ± 62%      +0.4        0.96 ± 94%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.64 ± 35%      +1.0        1.64 ± 79%      +0.5        1.15 ± 59%      +0.4        1.02 ± 89%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.12 ± 26%      +2.1        2.22 ± 33%      +2.1        2.26 ± 25%      +2.1        2.22 ± 34%  perf-profile.children.cycles-pp.pcpu_find_block_fit
     34.18 ± 12%      +3.1       37.24 ± 21%      +2.7       36.86 ± 19%      +1.4       35.56 ±  7%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     34.18 ± 12%      +3.1       37.24 ± 21%      +2.7       36.86 ± 19%      +1.4       35.56 ±  7%  perf-profile.children.cycles-pp.cpu_startup_entry
     34.17 ± 12%      +3.1       37.23 ± 21%      +2.7       36.84 ± 19%      +1.4       35.55 ±  7%  perf-profile.children.cycles-pp.do_idle
     33.45 ± 13%      +3.1       36.54 ± 21%      +2.8       36.20 ± 19%      +1.4       34.88 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
     32.80 ± 13%      +3.1       35.89 ± 22%      +2.8       35.62 ± 19%      +1.5       34.27 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
     32.79 ± 13%      +3.1       35.88 ± 22%      +2.8       35.62 ± 19%      +1.5       34.26 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
     28.43 ± 16%      +3.2       31.58 ± 25%      +3.2       31.64 ± 21%      +1.8       30.20 ±  8%  perf-profile.children.cycles-pp.intel_idle
     33.47 ± 13%      +3.3       36.82 ± 21%      +3.0       36.48 ± 19%      +1.5       34.98 ±  8%  perf-profile.children.cycles-pp.start_secondary
     10.85 ±  8%      +3.7       14.50 ± 18%      +3.0       13.84 ± 17%      +3.4       14.28 ± 18%  perf-profile.children.cycles-pp.mount
     10.68 ±  8%      +3.7       14.38 ± 18%      +3.1       13.74 ± 17%      +3.5       14.18 ± 18%  perf-profile.children.cycles-pp.__x64_sys_mount
      9.72 ±  8%      +3.9       13.66 ± 18%      +3.3       13.05 ± 17%      +3.7       13.44 ± 18%  perf-profile.children.cycles-pp.do_new_mount
      3.87 ±  7%      +4.3        8.12 ± 22%      +4.1        8.00 ± 20%      +4.2        8.10 ± 20%  perf-profile.children.cycles-pp.pcpu_alloc
      3.72 ±  8%      +5.2        8.90 ± 21%      +5.0        8.69 ± 20%      +5.2        8.88 ± 20%  perf-profile.children.cycles-pp.vfs_get_super
      3.75 ±  8%      +5.2        8.93 ± 21%      +5.0        8.71 ± 20%      +5.2        8.90 ± 20%  perf-profile.children.cycles-pp.vfs_get_tree
      2.20 ±  8%      +5.5        7.68 ± 22%      +5.4        7.58 ± 21%      +5.6        7.78 ± 21%  perf-profile.children.cycles-pp.sget_fc
      2.01 ±  8%      +5.5        7.50 ± 22%      +5.4        7.43 ± 21%      +5.6        7.60 ± 21%  perf-profile.children.cycles-pp.alloc_super
      0.00            +6.0        6.02 ± 26%      +6.1        6.06 ± 24%      +6.2        6.15 ± 24%  perf-profile.children.cycles-pp.init_srcu_struct_fields
      3.28 ±  9%      -0.6        2.70 ± 15%      -0.8        2.52 ± 13%      -0.5        2.76 ± 18%  perf-profile.self.cycles-pp.stress_rndstr
      1.55 ± 12%      -0.3        1.27 ± 13%      -0.5        1.09 ± 16%      -0.3        1.20 ± 16%  perf-profile.self.cycles-pp.mnt_get_count
      1.37 ±  5%      -0.2        1.14 ± 11%      -0.3        1.03 ± 11%      -0.2        1.14 ± 15%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.24 ±  7%      -0.2        1.01 ± 14%      -0.3        0.97 ± 16%      -0.2        1.03 ± 15%  perf-profile.self.cycles-pp.strncpy_from_user
      1.57 ±  8%      -0.2        1.40 ± 10%      -0.3        1.30 ±  9%      -0.3        1.31 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock
      1.42 ±  8%      -0.2        1.26 ± 18%      -0.2        1.18 ± 16%      -0.2        1.21 ± 20%  perf-profile.self.cycles-pp._find_next_bit
      0.72 ± 10%      -0.2        0.57 ± 14%      -0.2        0.54 ± 15%      -0.2        0.55 ± 24%  perf-profile.self.cycles-pp.mnt_get_writers
      0.67 ± 10%      -0.2        0.52 ± 19%      -0.2        0.50 ± 20%      -0.1        0.53 ± 15%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.54 ± 20%      -0.1        0.39 ± 17%      -0.1        0.48 ± 16%      -0.1        0.47 ± 14%  perf-profile.self.cycles-pp.path_init
      0.84 ± 11%      -0.1        0.70 ± 12%      -0.2        0.63 ± 17%      -0.1        0.70 ± 20%  perf-profile.self.cycles-pp.stress_mwc32
      0.52 ±  5%      -0.1        0.38 ± 10%      -0.1        0.42 ± 12%      -0.1        0.42 ± 12%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.69 ±  8%      -0.1        0.56 ± 22%      -0.1        0.55 ± 14%      -0.1        0.59 ± 14%  perf-profile.self.cycles-pp.kmem_cache_free
      1.22 ± 23%      -0.1        1.10 ± 15%      +0.1        1.32 ± 11%      +0.1        1.30 ± 25%  perf-profile.self.cycles-pp.malloc
      0.74 ±  9%      -0.1        0.62 ± 14%      -0.1        0.61 ±  9%      -0.1        0.61 ± 14%  perf-profile.self.cycles-pp.link_path_walk
      0.44 ± 11%      -0.1        0.33 ± 21%      -0.1        0.32 ± 15%      -0.1        0.31 ± 23%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.41 ±  9%      -0.1        0.30 ± 18%      -0.1        0.34 ± 14%      -0.1        0.31 ± 18%  perf-profile.self.cycles-pp.step_into
      1.24 ± 17%      -0.1        1.14 ± 21%      +0.1        1.37 ± 17%      +0.2        1.41 ± 20%  perf-profile.self.cycles-pp.siphash24_compress
      0.48 ±  4%      -0.1        0.38 ± 24%      -0.1        0.38 ± 14%      -0.1        0.38 ± 14%  perf-profile.self.cycles-pp.mod_objcg_state
      0.22 ± 27%      -0.1        0.14 ± 24%      -0.1        0.16 ± 15%      -0.1        0.16 ± 27%  perf-profile.self.cycles-pp.poll_idle
      0.32 ± 15%      -0.1        0.24 ± 17%      -0.1        0.26 ± 14%      -0.1        0.26 ± 15%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.36 ± 14%      -0.1        0.28 ± 23%      -0.1        0.27 ± 15%      -0.1        0.31 ± 11%  perf-profile.self.cycles-pp.__check_heap_object
      0.77 ±  6%      -0.1        0.70 ± 34%      -0.2        0.60 ± 13%      -0.1        0.63 ± 20%  perf-profile.self.cycles-pp.__slab_free
      0.17 ± 23%      -0.1        0.10 ± 16%      -0.1        0.09 ± 13%      -0.1        0.12 ± 20%  perf-profile.self.cycles-pp.up_write
      0.50 ± 20%      -0.1        0.43 ± 22%      +0.0        0.53 ± 11%      +0.0        0.52 ± 22%  perf-profile.self.cycles-pp.rdrand
      0.07 ± 12%      -0.1        0.01 ±223%      -0.1        0.02 ±142%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.fsnotify_destroy_marks
      0.19 ± 18%      -0.1        0.13 ± 16%      -0.0        0.15 ± 29%      -0.1        0.12 ± 19%  perf-profile.self.cycles-pp.__lookup_mnt
      0.10 ± 23%      -0.1        0.05 ± 73%      -0.0        0.06 ± 48%      -0.1        0.05 ± 50%  perf-profile.self.cycles-pp.propagate_umount
      0.18 ± 21%      -0.1        0.12 ± 17%      -0.1        0.12 ± 18%      -0.0        0.13 ± 24%  perf-profile.self.cycles-pp.get_nr_inodes
      0.18 ± 27%      -0.1        0.12 ± 16%      -0.0        0.17 ± 27%      -0.0        0.14 ± 27%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.18 ± 21%      -0.1        0.13 ±  7%      -0.0        0.15 ± 25%      -0.0        0.13 ± 19%  perf-profile.self.cycles-pp.filename_lookup
      0.09 ± 14%      -0.1        0.04 ± 72%      -0.1        0.04 ± 72%      -0.0        0.06 ± 45%  perf-profile.self.cycles-pp._atomic_dec_and_lock
      0.16 ± 13%      -0.1        0.11 ± 16%      -0.1        0.10 ± 17%      -0.0        0.14 ± 12%  perf-profile.self.cycles-pp.check_heap_object
      0.54 ± 12%      -0.1        0.49 ± 16%      -0.1        0.46 ± 12%      -0.1        0.47 ± 16%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.18 ± 12%      -0.1        0.12 ± 21%      -0.0        0.15 ± 18%      -0.0        0.17 ± 11%  perf-profile.self.cycles-pp.dput
      0.05 ± 46%      -0.1        0.00            -0.0        0.03 ±100%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.21 ± 20%      -0.1        0.16 ± 16%      -0.0        0.19 ± 23%      -0.0        0.16 ± 25%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.26 ±  7%      -0.0        0.22 ± 18%      -0.1        0.20 ± 23%      -0.1        0.21 ± 14%  perf-profile.self.cycles-pp.generic_permission
      0.08 ± 20%      -0.0        0.03 ±150%      -0.1        0.03 ±100%      -0.0        0.05 ± 50%  perf-profile.self.cycles-pp.pcpu_block_update_hint_free
      0.26 ± 13%      -0.0        0.21 ± 26%      -0.1        0.19 ± 19%      -0.0        0.22 ± 20%  perf-profile.self.cycles-pp.__switch_to_asm
      0.28 ± 16%      -0.0        0.24 ± 16%      -0.0        0.24 ± 21%      -0.0        0.24 ± 14%  perf-profile.self.cycles-pp.__entry_text_start
      0.08 ± 21%      -0.0        0.03 ±100%      -0.0        0.07 ± 26%      -0.0        0.06 ± 52%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.27 ± 28%      -0.0        0.22 ± 22%      -0.0        0.26 ± 14%      +0.0        0.27 ± 22%  perf-profile.self.cycles-pp.unit_name_is_valid
      0.05 ± 54%      -0.0        0.01 ±223%      -0.1        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.propagate_mnt
      0.18 ± 20%      -0.0        0.14 ± 24%      -0.1        0.12 ± 11%      -0.0        0.16 ± 10%  perf-profile.self.cycles-pp.rcu_all_qs
      0.13 ± 27%      -0.0        0.08 ± 32%      -0.0        0.10 ± 30%      -0.0        0.10 ± 26%  perf-profile.self.cycles-pp.umount2
      0.15 ± 18%      -0.0        0.10 ± 18%      -0.0        0.12 ±  8%      -0.0        0.12 ± 24%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.14 ±  9%      -0.0        0.10 ± 21%      -0.0        0.12 ± 13%      -0.0        0.13 ± 14%  perf-profile.self.cycles-pp.lockref_get
      0.12 ± 38%      -0.0        0.08 ± 45%      -0.0        0.12 ± 18%      +0.0        0.12 ± 26%  perf-profile.self.cycles-pp.__strdup
      0.08 ± 21%      -0.0        0.04 ± 76%      +0.0        0.10 ± 15%      -0.0        0.08 ± 47%  perf-profile.self.cycles-pp.kernfs_dop_revalidate
      0.04 ± 77%      -0.0        0.00            -0.0        0.00            -0.0        0.02 ±142%  perf-profile.self.cycles-pp.__d_alloc
      0.04 ± 72%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.00        perf-profile.self.cycles-pp.complete_walk
      0.10 ± 27%      -0.0        0.06 ± 50%      -0.1        0.04 ± 71%      -0.0        0.06 ± 54%  perf-profile.self.cycles-pp.slab_pre_alloc_hook
      0.05 ± 76%      -0.0        0.01 ±223%      +0.0        0.06 ± 11%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.llist_reverse_order
      0.31 ± 16%      -0.0        0.27 ±  9%      -0.1        0.26 ± 16%      -0.1        0.24 ± 11%  perf-profile.self.cycles-pp.__cond_resched
      0.08 ± 29%      -0.0        0.04 ± 71%      -0.0        0.04 ± 70%      -0.0        0.06 ± 16%  perf-profile.self.cycles-pp.finish_task_switch
      0.08 ± 11%      -0.0        0.04 ± 75%      -0.0        0.06 ± 56%      -0.0        0.07 ± 15%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.21 ± 13%      -0.0        0.17 ± 23%      -0.1        0.16 ± 20%      -0.0        0.18 ± 17%  perf-profile.self.cycles-pp.__switch_to
      0.15 ± 19%      -0.0        0.12 ± 33%      -0.0        0.14 ± 18%      -0.0        0.14 ± 11%  perf-profile.self.cycles-pp.refill_obj_stock
      0.04 ± 71%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.commit_tree
      0.10 ± 26%      -0.0        0.06 ± 47%      -0.0        0.09 ± 22%      -0.0        0.08 ± 25%  perf-profile.self.cycles-pp.rcu_exp_handler
      0.20 ± 24%      -0.0        0.16 ± 12%      -0.0        0.18 ± 17%      -0.0        0.18 ±  6%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.27 ± 10%      -0.0        0.24 ± 12%      -0.0        0.23 ± 18%      -0.0        0.22 ± 15%  perf-profile.self.cycles-pp.__schedule
      0.16 ± 11%      -0.0        0.12 ± 20%      -0.0        0.12 ± 23%      -0.0        0.13 ± 25%  perf-profile.self.cycles-pp.apparmor_capable
      0.06 ± 58%      -0.0        0.02 ±141%      -0.0        0.03 ±100%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.worker_thread
      0.06 ± 27%      -0.0        0.03 ±100%      -0.0        0.05 ± 47%      -0.0        0.03 ±101%  perf-profile.self.cycles-pp.ep_poll_callback
      0.13 ± 36%      -0.0        0.10 ± 18%      +0.0        0.14 ± 17%      -0.0        0.10 ± 35%  perf-profile.self.cycles-pp.string_escape_mem
      0.15 ± 26%      -0.0        0.12 ± 17%      -0.0        0.11 ± 18%      -0.0        0.10 ± 25%  perf-profile.self.cycles-pp.xas_store
      0.27 ± 13%      -0.0        0.24 ± 24%      -0.1        0.21 ±  9%      -0.0        0.24 ± 24%  perf-profile.self.cycles-pp.__kmem_cache_free
      0.08 ± 21%      -0.0        0.05 ± 75%      -0.0        0.04 ± 74%      -0.0        0.06 ± 48%  perf-profile.self.cycles-pp.stress_ramfs_child
      0.03 ±103%      -0.0        0.00            +0.0        0.04 ±109%      -0.0        0.00        perf-profile.self.cycles-pp.tick_sched_do_timer
      0.05 ± 46%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.prepare_task_switch
      0.09 ± 30%      -0.0        0.06 ± 72%      -0.0        0.06 ± 25%      -0.0        0.04 ± 79%  perf-profile.self.cycles-pp.vmalloc_to_page
      0.09 ± 39%      -0.0        0.06 ± 75%      -0.0        0.07 ± 24%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.__do_sys_newfstat
      0.07 ± 54%      -0.0        0.04 ± 73%      -0.0        0.07 ± 20%      +0.0        0.07 ± 20%  perf-profile.self.cycles-pp.generic_fillattr
      0.12 ±  6%      -0.0        0.08 ± 17%      -0.0        0.10 ± 27%      -0.0        0.10 ± 18%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.17 ± 11%      -0.0        0.14 ±  6%      -0.0        0.13 ± 17%      -0.0        0.13 ± 22%  perf-profile.self.cycles-pp.get_nr_dirty_inodes
      0.21 ± 15%      -0.0        0.18 ±  5%      -0.0        0.18 ± 24%      -0.1        0.16 ± 29%  perf-profile.self.cycles-pp._find_next_zero_bit
      0.36 ± 14%      -0.0        0.33 ± 18%      -0.0        0.31 ± 14%      -0.1        0.31 ± 20%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.11 ± 25%      -0.0        0.08 ± 19%      -0.0        0.09 ± 14%      -0.0        0.10 ± 23%  perf-profile.self.cycles-pp.hashmap_replace
      0.16 ± 13%      -0.0        0.13 ± 18%      -0.0        0.14 ±  5%      -0.0        0.12 ± 29%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.04 ± 72%      -0.0        0.01 ±223%      +0.0        0.06 ± 19%      -0.0        0.04 ±109%  perf-profile.self.cycles-pp.sync_regs
      0.07 ± 52%      -0.0        0.04 ±107%      -0.0        0.06 ± 48%      -0.0        0.06 ± 52%  perf-profile.self.cycles-pp._hashmap_clear
      0.15 ± 21%      -0.0        0.12 ± 20%      +0.0        0.16 ± 20%      +0.0        0.17 ± 22%  perf-profile.self.cycles-pp.device_read_uevent_file
      0.38 ± 25%      -0.0        0.35 ± 26%      +0.1        0.43 ±  9%      +0.1        0.45 ± 28%  perf-profile.self.cycles-pp.siphash24_finalize
      0.13 ± 20%      -0.0        0.10 ± 20%      -0.0        0.10 ±  9%      -0.0        0.11 ± 17%  perf-profile.self.cycles-pp.cp_new_stat
      0.10 ± 29%      -0.0        0.07 ± 50%      -0.1        0.04 ± 71%      -0.0        0.06 ± 19%  perf-profile.self.cycles-pp.chacha_permute
      0.05 ± 82%      -0.0        0.02 ±142%      +0.0        0.05 ± 46%      -0.0        0.04 ±104%  perf-profile.self.cycles-pp.__libc_calloc
      0.03 ±100%      -0.0        0.00            -0.0        0.00            +0.0        0.03 ±100%  perf-profile.self.cycles-pp.put_prev_entity
      0.06 ± 50%      -0.0        0.03 ±100%      +0.0        0.06 ± 48%      +0.0        0.06 ± 55%  perf-profile.self.cycles-pp.kernfs_get_target_path
      0.16 ± 12%      -0.0        0.13 ± 24%      -0.0        0.12 ± 18%      -0.0        0.11 ± 50%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru
      0.37 ±  7%      -0.0        0.34 ± 18%      -0.0        0.34 ± 20%      -0.1        0.31 ± 12%  perf-profile.self.cycles-pp.__call_rcu_common
      0.17 ± 24%      -0.0        0.14 ± 18%      -0.0        0.13 ± 26%      -0.0        0.12 ± 18%  perf-profile.self.cycles-pp.getname_flags
      0.06 ± 19%      -0.0        0.04 ±102%      -0.0        0.04 ± 73%      -0.0        0.06 ± 52%  perf-profile.self.cycles-pp._copy_from_user
      0.09 ± 21%      -0.0        0.06 ± 47%      -0.0        0.07 ± 20%      -0.0        0.08 ± 22%  perf-profile.self.cycles-pp.__srcu_read_unlock
      0.10 ± 31%      -0.0        0.08 ± 29%      -0.0        0.09 ± 17%      -0.0        0.09 ± 12%  perf-profile.self.cycles-pp.__close
      0.12 ± 29%      -0.0        0.09 ± 23%      -0.0        0.12 ± 18%      -0.0        0.11 ± 23%  perf-profile.self.cycles-pp.vfs_getattr_nosec
      0.10 ± 21%      -0.0        0.08 ± 12%      +0.0        0.10 ± 14%      -0.0        0.08 ± 31%  perf-profile.self.cycles-pp.do_filp_open
      0.19 ± 21%      -0.0        0.16 ± 16%      +0.0        0.19 ± 16%      -0.0        0.18 ± 25%  perf-profile.self.cycles-pp.down_read
      0.04 ± 73%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.inode_maybe_inc_iversion
      0.03 ±100%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.check_stack_object
      0.03 ±100%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.kernfs_iop_getattr
      0.06 ± 13%      -0.0        0.03 ±106%      -0.0        0.06 ± 48%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.openat64
      0.08 ± 16%      -0.0        0.05 ± 72%      +0.0        0.08 ± 23%      -0.0        0.08 ± 27%  perf-profile.self.cycles-pp.__fxstat64
      0.12 ±  4%      -0.0        0.09 ± 22%      -0.0        0.10 ± 27%      -0.0        0.10 ± 22%  perf-profile.self.cycles-pp.___perf_sw_event
      0.16 ± 16%      -0.0        0.14 ± 21%      -0.0        0.13 ± 14%      -0.0        0.14 ± 20%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.15 ± 23%      -0.0        0.12 ± 32%      -0.0        0.12 ± 20%      -0.0        0.12 ± 29%  perf-profile.self.cycles-pp.show_mountinfo
      0.08 ± 22%      -0.0        0.05 ± 47%      -0.0        0.06 ± 48%      -0.0        0.06 ± 55%  perf-profile.self.cycles-pp.sync_rcu_exp_select_cpus
      0.13 ± 27%      -0.0        0.10 ± 23%      -0.0        0.12 ± 13%      +0.0        0.14 ± 19%  perf-profile.self.cycles-pp.memcpy_orig
      0.13 ± 18%      -0.0        0.10 ± 22%      +0.0        0.13 ± 28%      +0.0        0.13 ± 32%  perf-profile.self.cycles-pp.realloc
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.06 ± 19%      -0.0        0.04 ± 72%      -0.0        0.05 ± 48%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.rcu_nocb_try_bypass
      0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.02 ±144%      -0.0        0.03 ±105%  perf-profile.self.cycles-pp.security_inode_getattr
      0.08 ± 26%      -0.0        0.06 ± 50%      -0.0        0.07 ±  8%      -0.0        0.07 ± 16%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.04 ± 71%      -0.0        0.02 ±142%      +0.0        0.05 ± 49%      +0.0        0.05 ± 49%  perf-profile.self.cycles-pp.pick_next_entity
      0.05 ± 51%      -0.0        0.03 ±100%      -0.0        0.03 ±102%      -0.0        0.05 ± 52%  perf-profile.self.cycles-pp.copy_from_kernel_nofault
      0.06 ± 50%      -0.0        0.04 ±109%      -0.0        0.05 ± 45%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.file_free_rcu
      0.14 ± 26%      -0.0        0.11 ± 11%      +0.0        0.14 ± 24%      -0.0        0.10 ± 13%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08 ± 13%      -0.0        0.05 ± 48%      -0.0        0.04 ±101%      -0.0        0.05 ± 73%  perf-profile.self.cycles-pp.propagation_next
      0.10 ± 17%      -0.0        0.07 ± 31%      -0.0        0.06 ± 57%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp.mutex_lock
      0.25 ± 13%      -0.0        0.23 ± 12%      -0.0        0.22 ± 12%      -0.0        0.24 ± 19%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.04 ± 75%  perf-profile.self.cycles-pp.strcmp@plt
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.path_openat
      0.02 ±143%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.09 ± 22%      -0.0        0.06 ± 53%      -0.0        0.06 ± 21%      -0.0        0.08 ± 33%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.14 ± 28%      -0.0        0.12 ± 13%      -0.0        0.12 ± 17%      -0.0        0.12 ± 36%  perf-profile.self.cycles-pp.alloc_vfsmnt
      0.04 ± 72%      -0.0        0.02 ±142%      +0.0        0.05 ± 52%      +0.0        0.06 ± 59%  perf-profile.self.cycles-pp.chase_symlinks
      0.39 ± 14%      -0.0        0.37 ± 16%      -0.1        0.34 ± 12%      -0.1        0.34 ± 18%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.07 ± 15%      -0.0        0.05 ± 45%      -0.0        0.03 ±105%      -0.0        0.04 ± 73%  perf-profile.self.cycles-pp.memcg_destroy_list_lru
      0.07 ± 58%      -0.0        0.05 ± 75%      -0.0        0.07 ± 28%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.init_file
      0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.self.cycles-pp.greedy_realloc
      0.18 ± 17%      -0.0        0.15 ± 19%      -0.0        0.15 ± 15%      -0.0        0.17 ± 15%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.06 ± 50%      -0.0        0.04 ± 72%      -0.0        0.05 ± 50%      -0.0        0.05 ± 49%  perf-profile.self.cycles-pp.path_startswith
      0.07 ± 20%      -0.0        0.05 ± 45%      +0.0        0.07 ± 18%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.task_work_run
      0.11 ± 25%      -0.0        0.09 ± 33%      +0.0        0.12 ± 17%      -0.0        0.11 ± 31%  perf-profile.self.cycles-pp._IO_default_xsputn
      0.06 ± 78%      -0.0        0.04 ±100%      -0.0        0.05 ± 75%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.08 ± 20%      -0.0        0.06 ± 74%      +0.0        0.09 ± 29%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp._hashmap_iterate
      0.24 ± 18%      -0.0        0.22 ± 21%      +0.0        0.24 ± 19%      -0.0        0.24 ± 15%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.20 ± 33%      -0.0        0.18 ± 33%      +0.0        0.21 ± 27%      +0.0        0.22 ± 22%  perf-profile.self.cycles-pp.device_add_property_aux
      0.10 ± 10%      -0.0        0.08 ± 14%      -0.0        0.08 ± 17%      -0.0        0.09 ± 23%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.27 ± 19%      -0.0        0.25 ± 18%      +0.0        0.30 ± 12%      +0.0        0.28 ± 21%  perf-profile.self.cycles-pp.format_decode
      0.08 ± 22%      -0.0        0.06 ± 48%      -0.0        0.06 ± 46%      -0.0        0.05 ± 48%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      0.14 ± 21%      -0.0        0.12 ± 34%      -0.0        0.11 ± 27%      -0.0        0.12 ± 25%  perf-profile.self.cycles-pp.ida_alloc_range
      0.04 ± 71%      -0.0        0.02 ±149%      -0.0        0.01 ±223%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.rb_erase
      0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.do_open
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rcu_note_context_switch
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.___d_drop
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.update_rq_clock
      0.02 ±144%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.shmem_getattr
      0.04 ± 76%      -0.0        0.02 ±143%      +0.0        0.06 ± 54%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.getdelim
      0.39 ±  9%      -0.0        0.37 ± 14%      -0.0        0.37 ± 19%      -0.0        0.38 ±  9%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.iput
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.siphash24_init@plt
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.cap_capable
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.do_umount
      0.06 ± 48%      -0.0        0.04 ± 71%      -0.0        0.06 ± 47%      -0.0        0.03 ±101%  perf-profile.self.cycles-pp.ida_free
      0.10 ± 21%      -0.0        0.09 ± 29%      -0.0        0.09 ± 22%      -0.0        0.08 ± 32%  perf-profile.self.cycles-pp.mutex_lock_killable
      0.20 ± 21%      -0.0        0.19 ± 24%      -0.1        0.15 ± 25%      -0.0        0.18 ± 32%  perf-profile.self.cycles-pp.smp_call_function_single
      0.09 ± 31%      -0.0        0.07 ± 50%      -0.0        0.08 ± 16%      +0.0        0.10 ± 16%  perf-profile.self.cycles-pp.prepend_path
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.malloc@plt
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__d_rehash
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__kmalloc
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._raw_read_unlock_irqrestore
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp._hashmap_get
      0.02 ±141%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.02 ±141%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__legitimize_path
      0.02 ±141%      -0.0        0.00            +0.0        0.02 ±142%      -0.0        0.00        perf-profile.self.cycles-pp.synchronize_rcu_expedited
      0.02 ±141%      -0.0        0.00            +0.0        0.04 ± 72%      +0.0        0.02 ±146%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.06 ± 50%      -0.0        0.04 ± 76%      -0.1        0.01 ±223%      -0.0        0.05 ± 46%  perf-profile.self.cycles-pp.schedule
      0.06 ± 48%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.strnlen_user
      0.17 ± 20%      -0.0        0.16 ± 22%      -0.0        0.15 ± 18%      -0.0        0.15 ± 14%  perf-profile.self.cycles-pp.task_work_add
      0.13 ± 20%      -0.0        0.11 ± 12%      -0.0        0.12 ± 10%      -0.0        0.11 ± 18%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.09 ± 27%      -0.0        0.08 ± 22%      +0.0        0.09 ± 17%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp.__memset
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.xas_create
      0.03 ±100%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      -0.0        0.02 ±143%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.05 ± 47%      -0.0        0.03 ±103%      -0.0        0.02 ±141%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.vfs_create_mount
      0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.queue_work_on
      0.09 ± 15%      -0.0        0.07 ± 24%      -0.0        0.08 ± 32%      -0.0        0.08 ± 30%  perf-profile.self.cycles-pp.__pthread_mutex_unlock_usercnt
      0.06 ± 46%      -0.0        0.04 ± 72%      +0.0        0.06 ± 48%      -0.0        0.03 ±106%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.06 ± 19%      -0.0        0.04 ±107%      -0.0        0.04 ± 75%      -0.0        0.05 ± 74%  perf-profile.self.cycles-pp.__bitmap_clear
      0.11 ± 20%      -0.0        0.09 ± 13%      -0.0        0.09 ± 34%      -0.0        0.07 ± 49%  perf-profile.self.cycles-pp.__list_add_valid
      0.11 ± 14%      -0.0        0.10 ± 22%      -0.0        0.08 ± 16%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.update_curr
      0.13 ± 22%      -0.0        0.12 ± 26%      -0.0        0.11 ± 23%      -0.0        0.12 ± 32%  perf-profile.self.cycles-pp.process_one_work
      0.08 ± 20%      -0.0        0.06 ± 17%      -0.0        0.06 ± 21%      -0.0        0.05 ± 75%  perf-profile.self.cycles-pp.lockref_put_or_lock
      0.05 ± 77%      -0.0        0.04 ± 72%      +0.0        0.06 ± 47%      +0.0        0.08 ± 29%  perf-profile.self.cycles-pp.string_table_lookup
      0.04 ± 74%      -0.0        0.03 ±100%      +0.0        0.06 ± 26%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.alloc_empty_file
      0.03 ±101%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp._dbus_marshal_read_uint32
      0.03 ±105%      -0.0        0.02 ±141%      +0.0        0.06 ± 48%      +0.0        0.04 ±104%  perf-profile.self.cycles-pp.strspn@plt
      0.04 ± 72%      -0.0        0.03 ±102%      -0.0        0.03 ±100%      +0.0        0.05 ± 50%  perf-profile.self.cycles-pp.kmalloc_slab
      0.24 ± 15%      -0.0        0.23 ±  5%      -0.1        0.18 ±  9%      -0.0        0.20 ± 20%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
      0.28 ± 17%      -0.0        0.27 ± 19%      -0.1        0.23 ± 15%      -0.0        0.26 ± 12%  perf-profile.self.cycles-pp.lockref_put_return
      0.17 ±  7%      -0.0        0.16 ± 17%      -0.0        0.14 ± 16%      -0.0        0.14 ± 20%  perf-profile.self.cycles-pp.mntput_no_expire
      0.14 ± 23%      -0.0        0.12 ± 11%      -0.0        0.12 ± 14%      -0.0        0.13 ± 15%  perf-profile.self.cycles-pp.clone_mnt
      0.22 ± 25%      -0.0        0.20 ± 11%      +0.0        0.22 ± 25%      +0.0        0.26 ± 26%  perf-profile.self.cycles-pp.vsnprintf
      0.05 ± 51%      -0.0        0.04 ± 71%      -0.1        0.00            -0.0        0.02 ±141%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.09 ± 16%      -0.0        0.08 ± 20%      -0.0        0.07 ± 44%      -0.0        0.09 ± 23%  perf-profile.self.cycles-pp._copy_to_user
      0.11 ± 21%      -0.0        0.10 ± 20%      -0.0        0.11 ± 14%      -0.0        0.11 ± 30%  perf-profile.self.cycles-pp.enqueue_entity
      0.03 ±100%      -0.0        0.02 ±144%      -0.0        0.02 ±141%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.apparmor_file_open
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.map_id_range_down
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.try_charge_memcg
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.deactivate_super
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.unit_name_escape
      0.07 ± 18%      -0.0        0.06 ± 52%      -0.0        0.06 ± 65%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.__fput
      0.05 ± 49%      -0.0        0.04 ± 75%      -0.0        0.04 ± 75%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.strscpy
      0.18 ± 22%      -0.0        0.17 ± 28%      -0.0        0.18 ± 17%      -0.0        0.18 ± 20%  perf-profile.self.cycles-pp.number
      0.10 ± 14%      -0.0        0.09 ± 15%      -0.0        0.08 ± 14%      -0.0        0.07 ± 48%  perf-profile.self.cycles-pp.inode_init_always
      0.09 ± 18%      -0.0        0.08 ± 44%      +0.0        0.10 ± 22%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.make_vfsuid
      0.07 ± 53%      -0.0        0.06 ± 52%      -0.0        0.04 ± 73%      +0.0        0.08 ± 28%  perf-profile.self.cycles-pp.pcpu_next_fit_region
      0.07 ± 14%      -0.0        0.06 ± 71%      +0.0        0.07 ±  8%      +0.0        0.07 ± 19%  perf-profile.self.cycles-pp.path_lookupat
      0.06 ± 14%      -0.0        0.06 ± 50%      +0.0        0.07 ± 14%      +0.0        0.07 ± 22%  perf-profile.self.cycles-pp.map_id_up
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mount
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._hashmap_remove
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.fd_install
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.ramfs_get_inode
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.pcpu_block_refresh_hint
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.should_failslab
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.alloc_super
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.shmem_show_options
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.sd_bus_message_open_container
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp._IO_feof
      0.03 ±101%      -0.0        0.02 ±144%      -0.0        0.02 ± 99%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.terminate_walk
      0.11 ± 25%      -0.0        0.10 ± 35%      -0.0        0.07 ± 10%      -0.0        0.07 ± 58%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.14 ± 25%      -0.0        0.13 ± 15%      +0.0        0.16 ± 17%      +0.0        0.14 ± 29%  perf-profile.self.cycles-pp.siphash24_init
      0.03 ±102%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.path_umount
      0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.shmem_get_inode
      0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.__mnt_want_write
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.putname
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__lxstat64
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.apparmor_inode_getattr
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mntput
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.propagate_one
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.stress_ramfs_umount
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.apparmor_path_mknod
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.xa_load
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.strncmp
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__attach_mnt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rcu_segcblist_pend_cbs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.d_set_d_op
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.available_idle_cpu
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rb_next
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.xas_find
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.xas_load
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.update_min_vruntime
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.place_entity
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.__do_sys_newlstat
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.seq_puts
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.copy_tree
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.timerqueue_add
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.d_same_name
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.resched_curr
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.check_cpu_stall
      0.14 ± 10%      -0.0        0.13 ± 26%      -0.0        0.12 ± 24%      -0.0        0.12 ± 28%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.16 ± 10%      -0.0        0.15 ± 20%      -0.0        0.14 ± 25%      -0.0        0.13 ± 16%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.12 ± 22%      -0.0        0.11 ± 28%      -0.0        0.11 ± 37%      -0.0        0.11 ± 21%  perf-profile.self.cycles-pp.strlcat
      0.04 ±112%      -0.0        0.03 ±102%      -0.0        0.03 ±103%      -0.0        0.03 ±103%  perf-profile.self.cycles-pp.may_delete
      0.14 ± 12%      -0.0        0.13 ± 24%      +0.0        0.14 ± 13%      +0.0        0.14 ± 21%  perf-profile.self.cycles-pp.update_load_avg
      0.04 ± 73%      -0.0        0.03 ±100%      +0.0        0.04 ± 75%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.try_to_wake_up
      0.26 ±  8%      -0.0        0.25 ± 21%      +0.0        0.28 ± 16%      -0.0        0.23 ± 11%  perf-profile.self.cycles-pp.inode_permission
      0.10 ± 17%      -0.0        0.09 ± 15%      -0.0        0.05 ± 73%      -0.0        0.08 ± 77%  perf-profile.self.cycles-pp.xas_descend
      0.11 ± 27%      -0.0        0.10 ± 18%      -0.0        0.10 ± 17%      -0.0        0.10 ± 20%  perf-profile.self.cycles-pp.lookup_fast
      0.05 ± 47%      -0.0        0.04 ± 76%      +0.0        0.06 ± 50%      -0.0        0.05 ± 78%  perf-profile.self.cycles-pp.alloc_fd
      0.08 ± 17%      -0.0        0.07 ± 51%      -0.0        0.07 ± 23%      -0.0        0.05 ± 76%  perf-profile.self.cycles-pp.__filename_parentat
      0.04 ± 72%      -0.0        0.04 ±102%      +0.0        0.04 ± 73%      -0.0        0.04 ±107%  perf-profile.self.cycles-pp.os_xsave
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.wake_up_bit
      0.03 ±101%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.04 ± 74%  perf-profile.self.cycles-pp.kernfs_iop_permission
      0.05 ± 83%      -0.0        0.04 ±102%      +0.0        0.07 ± 16%      +0.0        0.06 ± 52%  perf-profile.self.cycles-pp.path_equal
      0.26 ±  5%      -0.0        0.25 ± 22%      -0.0        0.24 ± 14%      -0.0        0.25 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.20 ± 13%      -0.0        0.20 ±  8%      -0.0        0.20 ± 12%      -0.0        0.20 ± 10%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.16 ± 24%      -0.0        0.16 ± 27%      +0.0        0.18 ± 15%      +0.0        0.18 ± 29%  perf-profile.self.cycles-pp.strchr
      0.31 ± 21%      -0.0        0.31 ± 27%      +0.0        0.32 ± 10%      -0.0        0.30 ± 17%  perf-profile.self.cycles-pp.cfree
      0.24 ± 28%      -0.0        0.23 ± 18%      +0.0        0.25 ± 15%      +0.0        0.26 ± 19%  perf-profile.self.cycles-pp.strlen
      0.09 ± 26%      -0.0        0.08 ± 19%      -0.1        0.04 ±104%      -0.0        0.07 ± 35%  perf-profile.self.cycles-pp.__pthread_mutex_lock
      0.21 ± 17%      -0.0        0.21 ± 14%      -0.0        0.20 ± 20%      -0.0        0.20 ±  9%  perf-profile.self.cycles-pp.__legitimize_mnt
      0.06 ± 14%      -0.0        0.06 ± 54%      -0.0        0.05 ± 47%      -0.0        0.05 ± 48%  perf-profile.self.cycles-pp.memcg_list_lru_alloc
      0.07 ± 49%      -0.0        0.07 ± 30%      +0.0        0.08 ± 21%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.03 ±102%      -0.0        0.02 ±143%      -0.0        0.00            +0.0        0.03 ±101%  perf-profile.self.cycles-pp.inode_init_once
      0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.change_mnt_propagation
      0.03 ±100%      -0.0        0.03 ±100%      +0.0        0.05 ± 47%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp._ext4_show_options
      0.10 ± 47%      -0.0        0.09 ± 22%      +0.0        0.10 ± 26%      +0.0        0.12 ± 27%  perf-profile.self.cycles-pp.string_hash_func
      0.30 ± 12%      -0.0        0.29 ± 35%      +0.0        0.33 ± 25%      +0.0        0.32 ± 19%  perf-profile.self.cycles-pp.intel_idle_irq
      0.12 ± 18%      -0.0        0.12 ± 19%      -0.0        0.10 ± 15%      -0.0        0.10 ± 15%  perf-profile.self.cycles-pp.set_root
      0.03 ±102%      -0.0        0.03 ±100%      -0.0        0.03 ±100%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.__wake_up_common
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.strcspn@plt
      0.06 ± 48%      -0.0        0.06 ± 56%      +0.0        0.07 ± 14%      +0.0        0.08 ± 26%  perf-profile.self.cycles-pp.path_simplify
      0.14 ± 25%      -0.0        0.14 ± 24%      -0.0        0.11 ± 18%      -0.0        0.13 ± 21%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.09 ± 26%      -0.0        0.09 ± 16%      -0.0        0.07 ± 51%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp.security_inode_permission
      0.05 ± 76%      -0.0        0.05 ± 46%      -0.0        0.03 ±100%      -0.0        0.03 ±101%  perf-profile.self.cycles-pp.rcu_exp_wait_wake
      0.21 ±  7%      -0.0        0.20 ± 12%      -0.0        0.20 ± 10%      +0.0        0.21 ± 10%  perf-profile.self.cycles-pp.menu_select
      0.15 ± 26%      -0.0        0.14 ± 34%      -0.0        0.14 ± 13%      -0.0        0.14 ± 24%  perf-profile.self.cycles-pp.kfree
      0.07 ± 52%      -0.0        0.06 ± 25%      +0.0        0.07 ± 18%      -0.0        0.04 ± 75%  perf-profile.self.cycles-pp.dequeue_entity
      0.06 ± 53%      -0.0        0.06 ± 48%      -0.0        0.03 ±100%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.do_idle
      0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.04 ± 71%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.cpuacct_charge
      0.04 ± 73%      -0.0        0.04 ±121%      +0.0        0.05 ± 77%      -0.0        0.03 ±143%  perf-profile.self.cycles-pp.rcu_do_batch
      0.06 ± 75%      -0.0        0.06 ± 46%      +0.0        0.08 ±  8%      +0.0        0.07 ± 50%  perf-profile.self.cycles-pp.xas_start
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.pcpu_chunk_relocate
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.dbus_message_get_reply_serial
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.set_strjoin
      0.03 ±102%      -0.0        0.03 ±100%      -0.0        0.02 ±146%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.xas_clear_mark
      0.10 ± 25%      -0.0        0.10 ± 17%      -0.0        0.07 ± 49%      +0.0        0.11 ± 14%  perf-profile.self.cycles-pp.rcu_pending
      0.11 ± 18%      -0.0        0.11 ±  6%      -0.0        0.08 ± 24%      -0.0        0.09 ± 10%  perf-profile.self.cycles-pp.walk_component
      0.11 ± 22%      -0.0        0.11 ± 29%      -0.0        0.09 ± 17%      -0.0        0.09 ± 31%  perf-profile.self.cycles-pp.__check_object_size
      0.04 ± 72%      -0.0        0.04 ± 73%      -0.0        0.04 ± 71%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.try_to_unlazy
      0.10 ± 19%      -0.0        0.10 ± 16%      +0.0        0.11 ± 20%      +0.0        0.11 ± 16%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.03 ±100%      -0.0        0.03 ±100%      +0.0        0.04 ± 71%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.strlcpy
      0.09 ± 49%      -0.0        0.09 ± 28%      +0.0        0.10 ± 16%      +0.0        0.12 ± 28%  perf-profile.self.cycles-pp.apparmor_file_free_security
      0.04 ± 72%      -0.0        0.04 ± 73%      +0.0        0.06 ± 47%      +0.0        0.05 ± 77%  perf-profile.self.cycles-pp.mnt_fstype_is_pseudofs
      0.07 ± 51%      -0.0        0.07 ± 24%      +0.0        0.08 ± 19%      +0.0        0.08 ± 14%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.14 ± 22%      -0.0        0.14 ± 19%      +0.0        0.17 ± 19%      -0.0        0.14 ± 24%  perf-profile.self.cycles-pp.up_read
      0.42 ± 19%      -0.0        0.42 ± 21%      +0.1        0.50 ±  9%      +0.1        0.48 ± 22%  perf-profile.self.cycles-pp.path_compare
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.ihold
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.seq_printf
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.truncate_inode_pages_range
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.__flush_work
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__unfreeze_partials
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.put_fs_context
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.string
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.errseq_sample
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.mount_too_revealing
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.rcu_sync_init
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__wait_for_common
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.pick_file
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.reweight_entity
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.vfs_read
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.release_pages
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.mnt_reset_fs
      0.02 ±142%      +0.0        0.02 ±142%      +0.0        0.02 ±144%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.build_open_flags
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.fput
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__queue_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.make_vfsgid
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__destroy_inode
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.locks_remove_file
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.namespace_unlock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.show_mnt_opts
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.hashmap_get2
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.03 ± 70%      +0.0        0.05 ± 45%  perf-profile.self.cycles-pp.update_cfs_group
      0.03 ±144%      +0.0        0.03 ±102%      +0.0        0.05 ± 47%      +0.0        0.04 ± 45%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.0        0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.dbus_message_get_interface
      0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._dbus_type_reader_get_current_type
      0.24 ± 11%      +0.0        0.24 ± 20%      -0.0        0.22 ± 12%      -0.0        0.20 ± 12%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.43 ± 10%      +0.0        0.44 ± 14%      -0.0        0.42 ± 17%      -0.0        0.43 ± 17%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.09 ±  9%      +0.0        0.09 ± 17%      -0.0        0.08 ± 14%      +0.0        0.09 ± 54%  perf-profile.self.cycles-pp.llist_add_batch
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._find_first_bit
      0.02 ±142%      +0.0        0.02 ±144%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.trigger_load_balance
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.do_sys_openat2
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._IO_link_in
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.alloc_fs_context
      0.06 ± 46%      +0.0        0.06 ± 11%      -0.0        0.06 ± 48%      -0.0        0.05 ± 50%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.11 ± 17%      +0.0        0.12 ± 16%      -0.0        0.10 ± 24%      -0.0        0.10 ± 26%  perf-profile.self.cycles-pp.mutex_unlock
      0.08 ± 29%      +0.0        0.08 ± 21%      -0.0        0.08 ±  8%      +0.0        0.08 ± 26%  perf-profile.self.cycles-pp._find_next_and_bit
      0.06 ± 49%      +0.0        0.06 ± 79%      -0.0        0.04 ± 72%      -0.0        0.04 ±105%  perf-profile.self.cycles-pp.free@plt
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.self.cycles-pp.shmem_free_in_core_inode
      0.02 ±223%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.strnlen
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.unlink
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.vfs_unlink
      0.06 ± 50%      +0.0        0.06 ± 60%      -0.0        0.04 ±108%      +0.0        0.08 ± 24%  perf-profile.self.cycles-pp.strlen@plt
      0.08 ± 16%      +0.0        0.08 ± 22%      +0.0        0.09 ± 16%      +0.0        0.08 ± 47%  perf-profile.self.cycles-pp.common_perm_cond
      0.04 ± 75%      +0.0        0.04 ± 71%      +0.0        0.06 ± 52%      +0.0        0.06 ± 47%  perf-profile.self.cycles-pp.umount_tree
      0.10 ± 52%      +0.0        0.11 ± 28%      +0.1        0.16 ± 24%      +0.0        0.12 ± 32%  perf-profile.self.cycles-pp._hashmap_first_key_and_value
      0.07 ± 30%      +0.0        0.07 ± 45%      +0.0        0.08 ± 24%      +0.0        0.07 ± 48%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.10 ± 28%      +0.0        0.11 ± 15%      -0.0        0.09 ± 15%      +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.do_syscall_64
      0.04 ± 71%      +0.0        0.05 ± 75%      +0.0        0.04 ± 71%      +0.0        0.05 ± 45%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.17 ± 20%      +0.0        0.17 ± 23%      +0.0        0.19 ± 13%      +0.0        0.17 ± 24%  perf-profile.self.cycles-pp.strchr@plt
      0.27 ± 15%      +0.0        0.28 ± 18%      -0.0        0.25 ± 12%      +0.0        0.28 ± 17%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.05 ± 71%      +0.0        0.05 ± 51%      -0.0        0.02 ± 99%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.d_walk
      0.06 ± 48%      +0.0        0.07 ± 11%      +0.0        0.08 ± 24%      +0.0        0.07 ± 27%  perf-profile.self.cycles-pp.path_hash_func
      0.04 ±102%      +0.0        0.04 ± 45%      +0.0        0.05 ± 49%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.load_balance
      0.12 ± 20%      +0.0        0.13 ± 27%      -0.0        0.12 ± 23%      +0.0        0.13 ± 14%  perf-profile.self.cycles-pp.idle_cpu
      0.40 ± 27%      +0.0        0.41 ± 23%      +0.0        0.42 ± 16%      +0.0        0.42 ± 18%  perf-profile.self.cycles-pp.device_read_db_internal_filename
      0.07 ± 24%      +0.0        0.08 ± 29%      -0.0        0.06 ± 46%      -0.0        0.05 ± 76%  perf-profile.self.cycles-pp.mangle_path
      0.08 ± 19%      +0.0        0.08 ± 31%      +0.0        0.08 ±  9%      -0.0        0.07 ± 48%  perf-profile.self.cycles-pp.pcpu_block_update
      0.03 ±101%      +0.0        0.04 ± 71%      +0.0        0.05 ± 50%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.perf_pmu_nop_void
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.shmem_evict_inode
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.check_spread
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.vfs_mkdir
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.bus_label_unescape_n
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.d_flags_for_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_page_from_freelist
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.device_properties_prepare
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.__bitmap_set
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.vmap_pages_pud_range
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.pcpu_alloc_pages
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.kernfs_refresh_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.close_fd
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.i_callback
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.object_path_is_valid
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.show_type
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±144%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.locks_remove_posix
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.00        perf-profile.self.cycles-pp.attach_recursive_mnt
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.00        perf-profile.self.cycles-pp.strcmp_ptr
      0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.02 ± 99%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.newidle_balance
      0.03 ±101%      +0.0        0.04 ± 72%      +0.0        0.04 ± 72%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.evict
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.nd_jump_root
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.mnt_fs_strdup_options
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.__d_add
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_mountpoint
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.clear_page_erms
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.siphash24_compress@plt
      0.13 ± 18%      +0.0        0.14 ± 16%      +0.0        0.13 ± 21%      +0.0        0.14 ± 17%  perf-profile.self.cycles-pp.___slab_alloc
      0.10 ± 29%      +0.0        0.11 ±  7%      +0.0        0.11 ± 18%      +0.0        0.10 ± 30%  perf-profile.self.cycles-pp.strcmp
      0.08 ± 21%      +0.0        0.08 ± 13%      +0.0        0.10 ± 28%      +0.0        0.10 ± 25%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.05 ± 48%      +0.0        0.06 ± 14%      -0.0        0.03 ±101%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.find_lock_entries
      0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.04 ± 71%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.strextend_with_separator
      0.79 ± 13%      +0.0        0.80 ± 14%      -0.0        0.76 ± 25%      +0.0        0.80 ± 12%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.05 ± 81%      +0.0        0.06 ±101%      -0.0        0.04 ±100%      -0.0        0.04 ±118%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.percpu_free_rwsem
      0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.02 ±141%      +0.0        0.04 ± 75%  perf-profile.self.cycles-pp.current_time
      0.03 ±100%      +0.0        0.04 ± 77%      +0.0        0.03 ±100%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.set_next_entity
      0.05 ±124%      +0.0        0.07 ±101%      -0.1        0.00            -0.0        0.04 ±100%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.07 ± 12%      +0.0        0.09 ± 28%      -0.0        0.07 ± 14%      +0.0        0.09 ± 22%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.10 ± 20%      +0.0        0.12 ± 12%      +0.0        0.11 ± 25%      +0.0        0.10 ± 13%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.02 ±141%      +0.0        0.03 ±103%      +0.0        0.02 ±142%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.open64
      0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.02 ±141%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp._dbus_first_type_in_signature
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±102%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.strjoin_real
      0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.04 ± 72%      +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.__alloc_pages
      0.14 ± 25%      +0.0        0.16 ± 12%      -0.0        0.13 ± 25%      -0.0        0.13 ± 26%  perf-profile.self.cycles-pp.down_write
      0.07 ±  8%      +0.0        0.09 ± 15%      -0.0        0.06 ± 56%      +0.0        0.09 ± 33%  perf-profile.self.cycles-pp.pcpu_block_update_hint_alloc
      0.02 ±149%      +0.0        0.04 ± 77%      +0.0        0.04 ± 72%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__x64_sys_openat
      0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.02 ±223%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.11 ± 18%      +0.0        0.13 ± 22%      -0.0        0.09 ± 22%      -0.0        0.08 ± 18%  perf-profile.self.cycles-pp.do_dentry_open
      0.15 ±  9%      +0.0        0.17 ± 23%      -0.0        0.12 ± 19%      +0.0        0.16 ± 24%  perf-profile.self.cycles-pp.free_percpu
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.radix_tree_node_rcu_free
      0.00            +0.0        0.02 ±142%      +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.call_cpuidle
      0.02 ±141%      +0.0        0.04 ± 72%      +0.0        0.03 ±105%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.__x64_sys_umount
      0.38 ± 16%      +0.0        0.40 ± 14%      -0.0        0.34 ± 20%      -0.0        0.35 ± 17%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.04 ± 77%      +0.0        0.07 ± 28%      +0.0        0.08 ± 20%      +0.0        0.08 ± 22%  perf-profile.self.cycles-pp.memcpy@plt
      0.00            +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.rmqueue
      0.07 ± 53%      +0.0        0.10 ± 16%      +0.0        0.08 ± 15%      +0.0        0.08 ± 20%  perf-profile.self.cycles-pp.__fget_light
      0.18 ± 12%      +0.0        0.21 ± 26%      +0.0        0.20 ±  9%      +0.0        0.20 ± 19%  perf-profile.self.cycles-pp.pcpu_alloc_area
      0.13 ± 16%      +0.0        0.16 ± 18%      -0.0        0.12 ± 15%      +0.0        0.14 ± 10%  perf-profile.self.cycles-pp.read_tsc
      0.18 ± 20%      +0.0        0.22 ± 16%      +0.0        0.18 ± 19%      +0.0        0.18 ± 22%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.01 ±223%      +0.0        0.05 ± 53%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.self.cycles-pp.pcpu_free_area
      0.19 ± 20%      +0.0        0.23 ± 23%      +0.0        0.24 ± 20%      +0.1        0.24 ±  7%  perf-profile.self.cycles-pp.__d_lookup
      0.06 ± 47%      +0.0        0.10 ± 38%      +0.0        0.09 ± 14%      +0.0        0.10 ± 24%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
      0.12 ± 30%      +0.1        0.19 ± 36%      +0.1        0.18 ± 40%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.21 ± 11%      +0.1        0.28 ± 26%      +0.0        0.24 ± 16%      +0.1        0.27 ± 15%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.08 ± 28%      +0.1        0.06 ± 54%      +0.0        0.05 ± 74%  perf-profile.self.cycles-pp.init_timer_key
      0.00            +0.1        0.08 ± 23%      +0.1        0.09 ± 25%      +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.10 ± 27%      +0.1        0.08 ± 20%      +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.pcpu_next_md_free_region
      0.24 ± 74%      +0.2        0.43 ± 62%      -0.1        0.18 ± 76%      -0.0        0.21 ± 71%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.2        0.20 ± 28%      +0.2        0.18 ± 26%      +0.2        0.16 ± 15%  perf-profile.self.cycles-pp.rcu_segcblist_init
      0.00            +0.2        0.24 ± 13%      +0.2        0.23 ± 17%      +0.3        0.35 ± 19%  perf-profile.self.cycles-pp.init_srcu_struct_fields
      1.64 ±  6%      +0.5        2.17 ± 14%      +0.3        1.99 ± 14%      +0.5        2.12 ± 20%  perf-profile.self.cycles-pp.memset_orig
      0.82 ±  9%      +1.5        2.36 ± 28%      +1.6        2.41 ± 27%      +1.6        2.40 ± 23%  perf-profile.self.cycles-pp.pcpu_alloc
      0.03 ±100%      +2.1        2.15 ± 35%      +2.2        2.22 ± 25%      +2.1        2.14 ± 35%  perf-profile.self.cycles-pp.pcpu_find_block_fit
     28.43 ± 16%      +3.2       31.58 ± 25%      +3.2       31.64 ± 21%      +1.8       30.20 ±  8%  perf-profile.self.cycles-pp.intel_idle




Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE2B1DA20
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690383308; x=1721919308;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0/zMaJjXZIiyfmpMgBvNwOF3LQMi0uLDMBuH7mG/Aw0=;
  b=k6lrqtgHVkwG8o1lnQ3hG+d7wUbuTC0xBW06ReiLP870UbvsAV3FRKoy
   sbVhIJTzyVKgaF5dC6DktW28Re03C3RXT+NjHQQZSqCjLtypjRHa5YOp/
   9inFDlrxxrwJ0SCjDI2P3ATpFSuNoNnwRnVvYZ0+p9Z5S9Q4R+yqQP/Y4
   CygHcAprHjlUSem92zZEtwATGfLBv4m1GhBltZIrPcJTPtbQMb+liSCA2
   k0iHaA43lEtInFyuZ6b9nYVzL8wGpMjeMeHuot22UdXBRiuz1/qUASp5K
   /zERYJpM9tqUUBdY+AmG9Jo43F/QjJ1jLiyaGeD+BUDhXOc+1hel/lOID
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="366916768"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="366916768"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850486659"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="850486659"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 07:54:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:54:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:54:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:54:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIgMSWqcWmdLz28+jcACdcgXFQpnwbnwUqLxxQ7Z3Zzve/r/sCouAZlg/41/IWptMko5QXGS4L147Xl8L3/yxj+W17wGry+lpmBnuxYcplhOrlyvDL3odY6brvjL7ZVvw/P9nc90QRApQR9Amd0HqEUdfFoGJhWd1sx0kKsJ406C6msD+4WZYbFjrVPCDQwgetQLMpGFhq/sKc7M8AGXGiPQbhp58r8B3wDKuqSX7rESqZqYaIMLCoA7x5SW2SueMfo1GYxcBFDns5O+Z0EAgMY139zF+fJl54dXWRx/IO5O77/AMYE0CUXFNN91WVAeu30/nSvZ9gtKoJhteOFh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjLLpiH2OAa7pkjhDkyHktRaa4glOoak46AHdCKNkLI=;
 b=UUc61HfM6Ent6L/jIyH/NukINWknWvRFWsS5NRTc0qlcPIi310rtPjbrq4AFF1z/nZW9Sxv62oEZolo6S4xvCGeIoldafyeE64i1+Sj9jubuadVTWMvy1tPihV4eAab6kHGyaBZUtmHc8qmai9Tk0RW1zrXr1Blp1LoTXN1mKYpPbHZ3BCtzo+dljHXol8omjQIIVgdPQU7VeBslpz0JHVPOzx5x83gUtRPoYhuEgoI6plIXMX4IJlnET0XjfjatIKzsftrLzjxvRo24Qlt2gb8avcaJzMt/kxljp51Ft33nkpja1qqeFOlBFBJr9CHXTqfFC/TIHUI8zzezUsVWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA3PR11MB7461.namprd11.prod.outlook.com (2603:10b6:806:319::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 14:54:45 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:54:44 +0000
Date: Wed, 26 Jul 2023 22:54:35 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, <oliver.sang@intel.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
Message-ID: <ZMEzq+VJh/Onui4t@xsang-OptiPlex-9020>
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
 <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
 <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
 <ZL9XopcTAkRLawDZ@xsang-OptiPlex-9020>
 <CAMj1kXEsavv36WzUnstXqyr1VUnqZbhPRZfgriSkf1x-Xdppow@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXEsavv36WzUnstXqyr1VUnqZbhPRZfgriSkf1x-Xdppow@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA3PR11MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: bec86437-112f-4f6c-ca5f-08db8de83f5c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xvv7ztywKqED23wZjM9edD3MXgMuIE71Ki0eLSaAzcxiBHIkv7vD162ONkMJnAsABUAYqNMYa3s9IgAWhknWENYGSAocg87VWzQ9xu+SHLvIgGwPtrWcPjC2CvXPdX63IxMXgusOUfy2yxEMgT2NqVzL3O1ZRvstC8rLTo2jxG4zKOfcXLdfP+LRit0rZpocdFUm3ziXfF19ENpeqkqgZK/MiBHe/xRiK205zWJQbhQdftXH5hECG7ldjVByNTNeVoDnx7bwV+79HptHmkMkgHuxYrvJO0LbtqLgMgynuqnpEhwWRUTwOX/CNEncejO6pHBztujMHM0JMbIyIbY1s1moe3J+rz+srqilK9ZMAR+bar8IBLNFUvsM4Dwf93pLlxYHzduxENr/Chf1YkRoaR/N0OLMsGUeK5loPIYwyx7JmKQoCCx6sl9e9J5ENq+9eiLPXGAy4puhwj+/AGDx7426MXZxDT261mQt/UcTkfm5zM1Bi9IuufoPXkRTjIw4VJNosWfsbRSLmhG+BEfgf3F9LbZQLW8+UhRjQdyegylZJ/ugGkhC5qa8nh2taDlMhXozLn0tblbeAp/NkY98g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199021)(6506007)(26005)(186003)(6512007)(478600001)(9686003)(6666004)(966005)(6486002)(86362001)(83380400001)(5660300002)(33716001)(44832011)(66556008)(66946007)(6916009)(8676002)(2906002)(8936002)(82960400001)(41300700001)(66476007)(316002)(4326008)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7PcE3O1Qm0TpKtAxDNdyRg8r9fgQ0S/+gM2pfGEqqdQV5HhisjDUGsjLJDBT?=
 =?us-ascii?Q?GytBoFr0DchaEkl+RHs3MMcxbwy1475rmpXTQwJ837dIx60D8dWan+lubwxG?=
 =?us-ascii?Q?wAj9VYlvW/BFJeYD8HrwFAgQNqaX+u3GU0nFtV5K3QsoSZBwQ8fyffwTIYXG?=
 =?us-ascii?Q?OD7hj4n1wK4/HLByQJ2jIFp02oKvyK6I3Iwyoa68byPbpLokkQ79tU7pSBgb?=
 =?us-ascii?Q?8XhZ+YSYDMgWFdoG/buRq/CoDNmJsOAU8p91glMfkRU48ZzM+6+WJjkQN+LA?=
 =?us-ascii?Q?00EbP3QY7CYRhiyOgmwqyy46UwTi9MveLQ6uoJ/ih+yILoh5beATpiUXKyKL?=
 =?us-ascii?Q?UETRiK5V39KhqDn8O0McLcJy8AhIg81B/Egr236aV/aPOSorOi0YtU8l+eW1?=
 =?us-ascii?Q?o7ntgSqZAb+IAfBprzIljrRKRFr3BXoas/jhOkfjj3nNpFXtK/62INT7QnGH?=
 =?us-ascii?Q?2YllrFXDgdh/0lBZSm2BF5FVXrLIh+OC1c5lxEb1OEobfeG6Y1vzAChMZx6o?=
 =?us-ascii?Q?L2hHW5xmSgFnOPLSXDm6Vs/M2kKQ3Kba8AINGVjA0SP2Rpwut6GhRDvvAqO5?=
 =?us-ascii?Q?g98RUPGXK5MVlih26IsOkJXS4/ev7ue/+ayrlJXeUkgpE9aztwIgTFYAIBl5?=
 =?us-ascii?Q?3nHfqYXY6VKdVYv0MJ5VziepDoMoq5eedJg7tCYlrePid967IeU01hDkuijd?=
 =?us-ascii?Q?cnMOFbOxB+2E0wAzBdACnB4HQjkp/i+3YU8ePsux1SkVZCYhF/avfth0JHM5?=
 =?us-ascii?Q?Ihf1SP/tBSpjZ3/m9UO2QPnWjsgVG5SWd/znwxM9jdAHlxq6r8GnkOmEQjkk?=
 =?us-ascii?Q?VfBVfGcCsJ+g8ISdY/5BtbvnAKdYUS6inQWJVBAhUH2iweCLtclvNVcPjbKR?=
 =?us-ascii?Q?kQt73sOWXaV7ZNq3mUSHWKqkKYLERR0LQXlXBGNocPiMWXKZ64cvT7+gw6HZ?=
 =?us-ascii?Q?GMCqNjWiX60UhwaaGm20N9HUaGARPq3EUdK3wCORIXw3UgtNa0vEQDSUHrIe?=
 =?us-ascii?Q?/7OhQnA/UVF9C1yt1mXlgBtZd190A0CrFlqxCE1qBtQjvSLN0rPtLP+Dn1kJ?=
 =?us-ascii?Q?jxo6zHkGeuJGZ8cR9qrNNx9jMhJOWQ5wkDqco16J/k0YjgI10XN8UXEnGBU4?=
 =?us-ascii?Q?BMgN5uVf0WpaM0qWo6LtlpunLE5SbKPqquQOKXy6aTMLk42LS7gshVxLE93e?=
 =?us-ascii?Q?+y/jQDR0OS2Ectax0Ubp9GYLMsL7oj2VjLVGmexPwY5MVLwYuZ+RrpJrI+yl?=
 =?us-ascii?Q?vShkNj//v6SVF/IIuLUvbIhxJ07Y+3aoq3bpG9dTkqNLobfXkxz7H51bz5kp?=
 =?us-ascii?Q?iN0isJjFl6JLbyAFV8p7AY0yEMz5HpuExKLF1QyaXVDntjSEd3LbjEJ+orLL?=
 =?us-ascii?Q?qdY1tUq8cx7ZPyeEGi+Z71dEe62QRB4P3PL4EYsA9qEcBoU/+Qxr2U5IJxEo?=
 =?us-ascii?Q?wsxGqbQKTKIf5Tn9BCF8Np9SjCEHJD7IejQ1eKxcJokKxFLuCaxQmpGvRkDj?=
 =?us-ascii?Q?QnYsI3ZkDIrb7VOsADAyRuJzbKlZkDhoUfeDNmQHXZxuLYWST5FsBuhNuTi7?=
 =?us-ascii?Q?VdaBLhxZrEwxUm59ShTvMiVIUeXecyZCFzhFIhGAhYUmEesLucqnhirqtsHv?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec86437-112f-4f6c-ca5f-08db8de83f5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:54:44.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9mbMRD6u3dyyU8RwzdGmcR55mak6xGNZqAZdp96nD8ciMUnkci+0nS+7XHW7g14/ke/KNI4UPRvECylr8mHWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7461
X-OriginatorOrg: intel.com

hi, Ard Biesheuvel,

On Tue, Jul 25, 2023 at 05:46:37PM +0200, Ard Biesheuvel wrote:
> On Tue, 25 Jul 2023 at 07:03, Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Ard Biesheuvel,
> >
> > let me firstly answer your question last time.
> >
> > On Mon, Jul 24, 2023 at 03:04:00PM +0200, Ard Biesheuvel wrote:
> > >
> ...
> > > I have prepared an alternative branch here
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v6a
> > >
> > > that has the exact same changes, but split into more patches, so it
> > > should be easier to narrow down which change triggers the regression.
> > >
> > > Could you please run the same test using this branch? Thanks.
> >
> > ok, will test and bisect on this branch.
> 
> Thanks
> 
> In the meantime, I have found and fixed an issue in the patch, where
> the stack pointer could end up being truncated to 32 bits by the
> switch into compatibility mode.
> 
> If this branch works
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v7

we tested this branch, confirmed the issue disappeared.

> 
> there is no need to do the bisect against the -v6a branch.

BTW, we happened finished bisection for -v6a branch, and found the fbc is:
69e723bb4fc6 x86/decompressor: Don't switch to the trampoline stack

just FYI


> 
> Thanks.

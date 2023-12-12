Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AB910EB
	for <oe-lkp@lists.linux.dev>; Tue, 12 Dec 2023 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JV3upZp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702346815; x=1733882815;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UpnywZwLU6J2Ri2MD2I15ZvtbmLP/hYJ+EL0svGIesY=;
  b=JV3upZp6+FQJvDAyruNj3lwZeJX5o4t1vaOB+The33o/EuXGsgQ0mBNB
   9PDYwA7vBtQM9TGyNPDLjBPThyCS1eAhYqjoZT02sVxTDGWNWd1yHNp1e
   BzPH7iNv4yy1SRSzlMUE/7KhwLRabNdBhyvkbB8XPclDrfHen8X6qBcqv
   SoeVwYr/Yg/OfJ/r7So/uJnZNdPS7g0+SzrdsHB3eP1kLWGOzT67K7PXU
   l1DIMdy9URXP9/4sgOcXuGzETth7t21ZxmpXRdZWD1YvQ6Dnn9rgFeujy
   tvJw/EyOL+UCPOmHtd8lHuM72uOv4hnsVcbHf3aRuJAn1wNkom34/ZTrO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374247159"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="374247159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 18:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766624536"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="766624536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2023 18:06:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 18:06:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 18:06:46 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 18:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wf5uAFxDbiDqBtfoT4B3qJZHq5ZXhZfCCuZhsofpICjSYRiPuwMchxW+QOefsdkRYQSJ/cfmrg5MVF0gIHsOu4eKPTOWtiQbFllYmd7lFVbOL4HUGXESdbeAYWBEyWvR7bX3yTJBfihKl3J8xELgYhx6zeqdcAeIMRRAD3ycfbFnqSdmqvKvZiCDBpCxyiHDuX11PVjEKT2c/M6HytuauEUxczV9Cya1MVctThLkQtq997p+II76qbqWqURUGakVgJ2y8LYNeKAdZ/D8/3K60TkM6HzYh6FW0ufbnOmrTnehHDlYAJ3JTotmhmyF+9VsD6uUX0iA9Vczgw2uMGTmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYfeLV2003e7Vb6lURYkOzWmVZRTVvXGcpXJjg10iD4=;
 b=Rrj7QiK38EQN7Xn4c9z0+hXFd2fuQ8yC0d94k8oNEwHG0MLDT0IBkrJcSFKBdLw0blRlwyUF9WEfITQkVgnOB0QBFUdrTBvW7PLyp0eivIE4AU+wWOiM46CYoKioBd7RaQsAg3HJn2wmQGmZ4oWyObixYPfwygD9FlYAQJqWnh+ighHdB0cXddbmHd/OcwNY4N1jbZ1lM+VZaz85w2bUMe4jsM/O5EZRWxRotsMmD1HXCQfqX08RmBOwgTc8gJV2ZYLuEhBygmQpGvzZqqAoJM5unXq8/+2pp2xp9StQNe8S72namq19bWF/HrYm82De2BZOKPXEYi+bU7v/ly/QlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 02:06:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 02:06:45 +0000
Date: Tue, 12 Dec 2023 10:06:36 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [paulmck-rcu:dev.2023.11.08a] [EXP locktorture] 1254a620b4:
 WARNING:at_kernel/rcu/tree_stall.h:#rcu_stall_chain_notifier_register
Message-ID: <ZXfALH1TIHSH/7cN@xsang-OptiPlex-9020>
References: <202312071506.6eac1bac-oliver.sang@intel.com>
 <2ad1abcc-d82b-406f-a7b7-606224a24813@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ad1abcc-d82b-406f-a7b7-606224a24813@paulmck-laptop>
X-ClientProxiedBy: SG2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:3:18::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 890c9695-b624-4fd4-e316-08dbfab6fd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnFryOJEOsLNENn+M1NMEZ00M7Xx0mCfL/soxTJfQVqGGC9uHKL4ctuzO4njnZdG5gSDyhkWVtav8dPLHWgmiCzI/4noBDTkWGyqEk3gqpy/f0AXNIn3PrzG9yBI8060eF6T7w83n1daBLCtBUk54onrRB7XLN4pG1nbDaKH7L7j6EjYME9eFVo2S8IOU0nrpq4WQkwX4t++CbGFAuIzrV0udWH7DekxX5AJZdDMkQ6hyobUMQsgSNEWRFtLaxz9LYfymMFHzqE1UkTpF4kV9UHCYclMx/P9cRI3rlvHWOOnXJi0ZCTbZqK9wV/3N7WPjV8Y6BdN1plh9CwTA+yyy0kXoTti7UwMOq3u/EzKfh4uCMX78VxFnZA09PCKhJUkqyE6UfcTvfE3ekCEOu6f8meh8cOeZBj/ud4y5JW8dx0C+vg7cZxsYzkRvSxPiKkRniloer/ZglgIpznuiwnMy2V883LX6p7rRM1VDea9PIkR48wvwVkXTKpUMV0l8QUGjHLoLm43xuc0n7ttpDLWfiG+dwiYwrM6BRBaqN+TvDsIvUQqIdsk+fKDkinaPqvCC9pWq5g6kJpr2v1vLS3srNiLoKSxhf6xseKxQLyLpT1BI94XjnO1pWM5fHk8Nt3t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(8936002)(8676002)(4326008)(6916009)(66476007)(66556008)(66946007)(5660300002)(2906002)(316002)(33716001)(6506007)(6512007)(6666004)(9686003)(478600001)(966005)(6486002)(41300700001)(38100700002)(86362001)(82960400001)(83380400001)(107886003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2rpd2mNpNzhqrFKZlYmeK4IYamJbxZ16V3u/41a5RbCc7jjcFNF4p0GT4bQJ?=
 =?us-ascii?Q?YfgoyJ4isdbKuUmc2PqxV3FpwsVrKvy3l1NAXRj62rNt3OAGyu/sNBghorSb?=
 =?us-ascii?Q?/ymsYfANWWGTJv5+jNMxv1Xi9oJM4fZO+y5SQ4URsWXAut1bBMs4THSAGOCo?=
 =?us-ascii?Q?pLqgOr6Vbc/Mf4Dmmq+68fACtQsEJf5wmm6A8iWjI4956KBZIoNLlWAdY55T?=
 =?us-ascii?Q?mHVl1cl2QIBiOrh48rpYRGxuajIGDA4lTXdNcdsx7jB6M06OwUByH6iKqRb2?=
 =?us-ascii?Q?k7jUQRl524LaxNiRkzK16T0AHCgj6ZIqoJn00l3KZP+IiBohF5akPWQt2767?=
 =?us-ascii?Q?KJH5am0jD9o6i9f1U51P7hlXUZwxdgw7xesn9KbMPnCLSVcI0B4S0n6QDG69?=
 =?us-ascii?Q?neFprIsq18dsM/QQHWDHmdIu4MzhKnJw/XOdIUOqTI0DdKEkR5T7u2UIjwWU?=
 =?us-ascii?Q?/ZiETTwBBYwmv7/8w44Y25MkQUReJYvPrl7Vs33CTme3FHVH47RBTBT1LRAB?=
 =?us-ascii?Q?UKOziYlGaBvq0VJIpUkt79bsoe+Vtra6vKYJdeOb94I9CEJygEB+o3eOIvT/?=
 =?us-ascii?Q?KngbjmD3j1TR/9iLSeWcB4q09w4CFmAklB13rpO11iKLM9d4huyqotkM5Gb8?=
 =?us-ascii?Q?P8SpJWkkZd7bR11EEqf9Zx8GkJs2tE/AKrPaBfJ4U+HoLWx+SWAGyxWlzRlW?=
 =?us-ascii?Q?lUgmcNpCRGalmlao7/0yW4plwn8CTCzxTC5Rx7n+UbXN7I2QdnxxSzpxRLeg?=
 =?us-ascii?Q?kBWFZ5kzVnoz/1BltxAEdvdpyEns2PxpvEGxO7EZwyEyJ3RiFQ/iIswWrO7y?=
 =?us-ascii?Q?BCpJKX210rNobkrETIO9RO5c9bvV6n9kRJV1hDI8mXWoRAY/GAJXonpkX3uX?=
 =?us-ascii?Q?BO3Asi/s1lBYn8ZoaymojSpmL4uqdj9Nh7WDVsjR8PExQqrq+OUa1mxEzQMU?=
 =?us-ascii?Q?qO30Yz0qzmuLxXRGUVf2yC6PT1kg7U2pn6Mo6lInv4nH9LuFRGKs3kSZSQg/?=
 =?us-ascii?Q?ucwSofTLVaM1ZBYPCg79zcvfX7OXBcN9/+00lRkhlZg+p/3b3u6hzz/t1wog?=
 =?us-ascii?Q?AeaxQbXtH7E+XTETppV61bP2RbNf79NLUS9SMBxkXeP3lT/Lvjh9zo+vw/9t?=
 =?us-ascii?Q?nlq0YDcSviOIMB5nZxZlKY74CfzooV+qqZFWgTAVlYgwM5Zz17fcCmXvczTV?=
 =?us-ascii?Q?IB6EcdAIUn4IwVwOyDQKMPHomhnAnjBvkKcGk7Px2o9d85q7QFgDSIgPOJaG?=
 =?us-ascii?Q?Iltnq40R08STddeUevYUyCm1jJ8K4xbJm+PzvucH+3leQWS2uBx8Ikq/zo7i?=
 =?us-ascii?Q?7jpUULfsQb/lQ3vVNPXmFSqdbI0x8vdEJfETBgSFCVlYTVDI+m8nNAPFhgDj?=
 =?us-ascii?Q?AvXlEqvRxMAnBP2pJt7KKUe3u4HhV6mQBZnkJOk0CC7S4RUL3X0WSeGKF4Lu?=
 =?us-ascii?Q?k3BqUgWHk846Sy+o4crtvbcpNOHVYayzA/HQaZ/ovGHZpg5Q6NqTHm4oUFU2?=
 =?us-ascii?Q?SOViVqkTb7AJdSrtJt+ijTv+MxpBAiqc7+9+3qiMIiMfAFNU60ET4s0XlFQJ?=
 =?us-ascii?Q?2aQs/3f/xTCty9H1gLDhUfwCoNBg/8phPSgRe132CEuayjlzSJ1uVbUkTxAU?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 890c9695-b624-4fd4-e316-08dbfab6fd45
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 02:06:44.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdCmKKBti/ktqYiRxjr6vszw5GVOjEpb8eLBseBBQF1gG9rBW3lQi+BJvbMvAotuq1WSMSjfNIJ9yGR14rsdxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-OriginatorOrg: intel.com

hi, Paul,

On Mon, Dec 11, 2023 at 08:59:16AM -0800, Paul E. McKenney wrote:
> On Thu, Dec 07, 2023 at 04:19:56PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/rcu/tree_stall.h:#rcu_stall_chain_notifier_register" on:
> > 
> > commit: 1254a620b4a3832e65ac01bcef769b99e34515b2 ("EXP locktorture: Add RCU CPU stall-warning notifier stub")
> > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.2023.11.08a
> 
> Thank you for your testing efforts!
> 
> This one is expected behavior by explicit request from Linus Torvalds.
> The concern is that people might use this hook without understanding
> the risks of losing RCU CPU stall warnings.
> 
> One fix would be to never specify the rcupdate.rcu_cpu_stall_notifiers
> kernel boot parameter.  Another would be to forgive this warning when
> that boot parameter was specified.  Your choice!  ;-)
> 
> 							Thanx, Paul

Thanks a lot for information!

this commit (1254a620b4) is a test for this warning, am I right?
when this warning mechanism goes into upstream, do you want us still report
for similar cases? or we could just ignore them? Thanks!


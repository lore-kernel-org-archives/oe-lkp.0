Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD942067
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 04:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724820187; cv=fail; b=rsb7nlKOaNgj6z6aKcijBh+dUyYOS+YvxN586+2zcUahz8vPytT72fy/KnZpTYBwSK+GfH7yNJEX3UMsl3ZVANxC46zZ1OFeqCSs+aKDlwxCzPNGDWmQvYRw6UXgGKjC0ocZveH6ql6EG3Cwgz84z/YVumgx6zqbXEaJ3mxqxhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724820187; c=relaxed/simple;
	bh=AFMKqWn/oJLHDxULLxNSg5tM40b1NjqddEW9n4mL+Ig=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kRpP3VGS9F7Uxq+/EQUeQMluxMbWz5grlkoUS6FSo2fVfB8E5m5fhngA6ywYGuoc1gVEyZsaxwuNcJ2ueB8Awux3zd5iy7HS5pBLmIcMkQC5zbE30HkSqbj76BMD5ZaBzPgOhaSLu0yjY7v0OZlbohlfNjOfwEu6Ug1/JmZcjSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mknC82xx; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mknC82xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724820186; x=1756356186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFMKqWn/oJLHDxULLxNSg5tM40b1NjqddEW9n4mL+Ig=;
  b=mknC82xxUJnh0JaTuttxq582uKwYE0wp2OLpc42MnPzN3rR00OyPgzy9
   wK69XkD6g8f9ZElXQ+t8pkgDuT4TA7CB4/YhQ5orMbhoYKx156hSUOWFp
   s46qQouHqmY9a3Oaw5Qi0rAT8wskWzGmDDFI7v64w3OGl3Qz9rskauD5W
   DgEoUP/e0a3Q9YXuUM7aXUgrCGEK4iWFatdNdXYYQF95AIBXHhHwkh3YL
   wiNZbO98hfJJfQDoJjdWwY5tK4sJ27ddsqUG9uLbMYEPHHPmk9JNTGZTc
   BGGmz0o1NSFns229sf9oOyqtGyf5o7DSt0xkTgAYKERQHqFzH/RTan3iy
   A==;
X-CSE-ConnectionGUID: qTFa3CeBQ2ah9WSBfj9a7A==
X-CSE-MsgGUID: PJ/IefBHQC6XNEYv4qcZsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23454460"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23454460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 21:43:05 -0700
X-CSE-ConnectionGUID: uT1n1X5ERs2RgqO+fM3UaQ==
X-CSE-MsgGUID: 14jhCw2PTryrWOIujy221g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63613820"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Aug 2024 21:43:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 21:43:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 21:43:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 21:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STH8osQBuP7XkUY60ygU5VoA2PRyNj9weHcQcdMBz2CUb7Z78AbgYZljrDy/+BYgfdxij9SQvQBtxWn7j74ydknYzfTw4M2af+dAsXH19CGw/+ao7I1Tz1NDdWR7NXbVUAJaFE67ue99sYRCpKK8A4IdZ5tM25ZLXBSd3duRDmpSSvlFQwgFKz4ql4bN8vceDq2oG8wUKy5wlOuJ55Mbs1/zLvljXCNy9RpbC3XGTMA/xEODQLRVbSzlxlG6lk90FQofYVcpo3l38SV7eXTTzoO5d2a0wTQhiWdZptp5k78dNVsdH4ColhxkTOebSTE2jHC48pmMWQv+/FPTcTVQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9d8/wdZ9iluxvZqITTXtP7p4c9GCxhvHEPk7lcVVM8=;
 b=IvTRlRRITyxduJ3ApzX+sn/+zw0QkkUkQ6FTXu7iWuSanCYETvBnrc1WVyTLyCrYIiK7PJsrsrLE6rjThk4wEtmjmSiv6h2HSU1+WsGeOHM9QhVfGAAeVjmKAQw31c+B8PKqOpUeJ229PyRKmdhKou7/UyEnxRUsn670OROgrUitARk229gGnTlGyfBb1UIpyAlo2Lc0ypcpC26dHGt+5j7W7I8zWjhkGAHVxlXNnC73V3ZNyeFqqX9oOWzWCdOgMmzOQ4jnn82vsIwK61Hc+qxijPfw3s2QGEa6zIKwZB8lEOc12rVfFVppvyjeW83M3GaIQJLBJjZUlvxZspgVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Wed, 28 Aug
 2024 04:42:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 04:42:56 +0000
Date: Wed, 28 Aug 2024 12:42:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Bert Karwatzki <spasswolf@web.de>,
	"Jiri Olsa" <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>, Lorenzo
 Stoakes <lstoakes@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>, "Sidhartha
 Kumar" <sidhartha.kumar@oracle.com>, Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  [confidence: ] 131e4ef350:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202408281008.b26bed01-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9e9637-bd7e-4273-4384-08dcc71be29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6TqGewgO9C/YIOOKmnKY0AlLSGjzmxhGlwmyxTVcI0pvIq+ok9le9f1DCYtk?=
 =?us-ascii?Q?Ahn9BfFLE8SOE4h86FmvMA93TqeOs17OO/WrgAphaluAHzAy35PJNIY1iLgd?=
 =?us-ascii?Q?nhPrbXr7J7hjS8W6zSZfoUBIZS0TtTHDfhsFikjBbZEj8AulORJ+9gaFD4Lt?=
 =?us-ascii?Q?94k2C4CDc1DOsyA890B+dc9t/cWqXfQfZ7CYXp7CwqFkbvzaT8Kr3FctJsXm?=
 =?us-ascii?Q?y8kxOUZ7VwroHEtZq4+pncapZF6NEtYj4dwvFOUx2Hd9LCMUYdmHYE3r3ZeQ?=
 =?us-ascii?Q?qNihY2tvkdBsK43VbLYAAhuvjhrGw+8KseB6+HjYrCsmvesLOTomZ71x2m4m?=
 =?us-ascii?Q?/r3Eb5Yw6oqQk7sJgjSpMnL4wB4KIhq1ARW+dmx6y//+UktczFal49LImHdf?=
 =?us-ascii?Q?3GIiadlf4rwfqc27qGkzkdSx8yl48Kzfe+j9azTXSrocpdNtpf2FuhzbjfRp?=
 =?us-ascii?Q?ANCI0Y2hMAjXPeXHQ0DvSOSqq88SA1xfZfdJOyJWl3MqkgKWfQdBkdvWOhR3?=
 =?us-ascii?Q?gGiAkc/xvnxHhTLpLKTb9xqoGYMQ3WjXsA24i0eoG/98jh2EfH6xLsWkrWe3?=
 =?us-ascii?Q?I/ncQUfvleKjljKzksAe5RbhYxri13w0wVe+rbLKC4K3AVJZYjIkAsRaWEiA?=
 =?us-ascii?Q?tHhN2q7DnoaZxU3vSRU3LINaZrog1aYGM6+FPw7KdOKXv9rkqyMyFkoTA6cd?=
 =?us-ascii?Q?Fi9KvENayeFceH7Ztk6UB/ze9Hi/cVfeL7QR4TXOxu0TD9WItrC4V8C/WHZW?=
 =?us-ascii?Q?K/uW7faIrxUPWA36tr82QWG3boGnLFejzBSxaykrN15NwgFgvyElFqZZJKY8?=
 =?us-ascii?Q?o+wFb/5ov16evFdo/F0056vPh05d/Z/UKbFDuUfRcbxpbBA7vgMhOphAisNY?=
 =?us-ascii?Q?wzpz5lO3F124LH0ORGlGpnsIWZNFcJ6W4/PomdRNkaw6lsS+d+Q11YA7bjmp?=
 =?us-ascii?Q?Nlul4DeqirGch0m7aRHDqO3iVFs1gf7RUsDWahA0V3lmw7jYlGWhkJtMjs3O?=
 =?us-ascii?Q?r6z64VRknJfGTxrR+FGjlIURDJ8zTAuYAVVBGLdExFmk8SYFkPuxpdqFzEhS?=
 =?us-ascii?Q?GQnlFgNgP7inhSU9Ro33mSHJQ97bExFL/FVxA0JSFpowGM+/+KL/wR1uMHxx?=
 =?us-ascii?Q?gu9ByXXsGRpcsOM+WvgGSrJdbnyCUcCM2otq3cd8k7cQefZu2Db1C3yFCQ0U?=
 =?us-ascii?Q?O8ttoc70Unywkvv/XVvTMGStBeb/DgiGfjUW6NlFoBvfckiIiucpKhosChHz?=
 =?us-ascii?Q?G94HjEMWLjGFdTOajT/F4qS03Lz/Y2y0Rq5G/apzdWc9vC3M7JCNQMqepumr?=
 =?us-ascii?Q?sz+BC66lS14vEIuRTz2q/yCX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xarZu9zpipFBFqRHMPpRtQvESTaOPB8acN5CTt7CS0Gqg4/y67UOESf4FIAh?=
 =?us-ascii?Q?Slqwsa8FARBlaPCrBGNTOgrJfbUML+gS/H4PnwS26CgLeP2UpVhGMEQcLvEo?=
 =?us-ascii?Q?9siCukEFnuhmZUtAmgbMY5fIC4gm7d38GsRuFBw7uz65Iay99xtosdEbIymn?=
 =?us-ascii?Q?SmzSJunUreLkoJxodOmzi8Q3SJ8vS6GhyydWj77HsRwKtlDY7R02CJmnDfO4?=
 =?us-ascii?Q?bCFZOHHPJy9eya60tqo80OmRaNDSsnP9Xxolm/K0pfJpbnMCc0W5T5sa0Isp?=
 =?us-ascii?Q?On3YqmdLN+eZ6Z8mNQEV790jBWkkRNN3AWtWaTU98Tg3DUTiiuilivfeMUEb?=
 =?us-ascii?Q?YhZtjZ4lIka9AswTadpPzY61EE0waykgE2UyDHqMBQa7/WhDrlaIsxO6d6pq?=
 =?us-ascii?Q?7WriyDyw1u55/73cm+a2rAJ2HjtDLd6CVBvS7fSBeCBEHtFTY1wP0lCkK0NU?=
 =?us-ascii?Q?SkxKpQyI5c24F7HKd8oMETtcji2XiC2+EQjDy/zioFmyL4bPBGnO9Gq1655E?=
 =?us-ascii?Q?fEkOUsTaFW0tgNVs9kS6F+MOsB0N/PJtXXNeFHlSYkP1KQlv89xhXnwJxcL3?=
 =?us-ascii?Q?/WeLH0++GsOccJ7q3XCRjKRjHPteSrb9GArQNDj/Q1F0lqrskealaT/5tIxA?=
 =?us-ascii?Q?yzd3i+3x4LHL7QYHfpNU91Tyb8xLuEfXQhS4pVYXkbA8PfLQTi6mX7Z7LWFk?=
 =?us-ascii?Q?rMmP07LVa21QnO/8oqZ6sDad51u+ovPbuc1/I6y1IQ8CPZZbaBq6uSaxOBUr?=
 =?us-ascii?Q?OSFoLbFNKpv+wAChwQmLywSafbLtu/yYRUomjUyeyXyLpb4etnl+OfBPiR0s?=
 =?us-ascii?Q?gkacJM24RPMqMIi/FPMMD9qWnxVAEbEcBMH2xNhlwcqbg10JwT6OcyoLFh7o?=
 =?us-ascii?Q?p/jOzy3tlllj/SpyxctGqKdvQphmhAq6CvAzKgllY+E61k2CEvQ4cjBfddgR?=
 =?us-ascii?Q?nWPNu29PzkV9eNobr0+mSfFZAswjoC5E7ka76hXrE6iVpKkmD6W2iiDECNe1?=
 =?us-ascii?Q?MkCJue52SCoLM0OEvwTZduVYgKb/9jeZLk7EkO0fC8RAehAZ0Z5VDVJAzi1F?=
 =?us-ascii?Q?onAkVSyd6Irja5u68A/FV9ZlSnkWwaqvZarfjL/nmk995D2NKqxJa/8gKpC+?=
 =?us-ascii?Q?18OYOvsiB9tklrJlx1xg0kYcs3Jz3zvUEwxNzEhQfAU3CMTjCW6Svkuofpn6?=
 =?us-ascii?Q?zzl/W7Sy+0m55boJaQLZ+uJy0sf4PfN/91HA7ZYMAh2/tffcglV9ZDiigi4F?=
 =?us-ascii?Q?WZdxh6+sVKIRwZudacPKMEUPO9HIi+N3ONIfkVaBd0lFLBf/yb4LpOMbdbfe?=
 =?us-ascii?Q?+ZNpwUc71kQg2/Yf+TxSYXGm+9R0dJK1Bx/Au3dU4FrkrlLM378U3CTgEy+m?=
 =?us-ascii?Q?2pdaqRJc9FIqmpAiKVzoCAr1zzqDkXDP9csOXN8VR6P9NN8DP7KbxQxd7gKN?=
 =?us-ascii?Q?wTSop0L6FIJnZYveVXuJ41uV0vUNtstdqLBQ4DsgC/kqF2EtrGcC0Dr5jJ1U?=
 =?us-ascii?Q?CnosiQFV13do26YyRc81IGkBaDrhyjM5XOpOj/kXpdWMYakDrS4mEVHfj0I4?=
 =?us-ascii?Q?E6VBC7i9XhQiJrU5YocbesNzTyl4WCwEW2ELRafnppApJ53j1xgklsaV41+T?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9e9637-bd7e-4273-4384-08dcc71be29a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 04:42:56.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud2Fik/VJTi5sHc/3cgWR4jVamPu3BgVaGrvtFCWtY3ftteU0yJCJSyhx+vTnOfbCIBx3KfZZYvOyHopfN8lAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 131e4ef350fae9d7bb5077330f4a7805d429d4b7 ("mm: change failure of MAP_FIXED to restoring the gap on failure")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 6f923748057a4f6aa187e0d5b22990d633a48d12]

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------+------------+------------+
|                                                       | 80cb1398c2 | 131e4ef350 |
+-------------------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address           | 0          | 12         |
| Oops:Oops:#[##]                                       | 0          | 12         |
| EIP:mmap_region                                       | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception              | 0          | 12         |
+-------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408281008.b26bed01-lkp@intel.com


[   36.945736][ T3519] BUG: kernel NULL pointer dereference, address: 00000000
[   36.947543][ T3519] #PF: supervisor read access in kernel mode
[   36.948751][ T3519] #PF: error_code(0x0000) - not-present page
[   36.950005][ T3519] *pde = 00000000
[   36.951050][ T3519] Oops: Oops: 0000 [#1]
[   36.952388][ T3519] CPU: 0 UID: 0 PID: 3519 Comm: trinity-main Not tainted 6.11.0-rc4-00360-g131e4ef350fa #1
[   36.955401][ T3519] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 36.958508][ T3519] EIP: mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625) 
[ 36.959891][ T3519] Code: ff 8b 85 0c ff ff ff 85 c0 0f 85 17 01 00 00 8b 45 a8 85 c0 0f 84 8e fe ff ff 80 7d c1 00 0f 85 07 02 00 00 8b 9d 7c ff ff ff <a1> 00 00 00 00 83 7b 1c 01 74 0a 3b 43 04 72 49 39 43 08 72 44 8b
All code
========
   0:	ff 8b 85 0c ff ff    	decl   -0xf37b(%rbx)
   6:	ff 85 c0 0f 85 17    	incl   0x17850fc0(%rbp)
   c:	01 00                	add    %eax,(%rax)
   e:	00 8b 45 a8 85 c0    	add    %cl,-0x3f7a57bb(%rbx)
  14:	0f 84 8e fe ff ff    	je     0xfffffffffffffea8
  1a:	80 7d c1 00          	cmpb   $0x0,-0x3f(%rbp)
  1e:	0f 85 07 02 00 00    	jne    0x22b
  24:	8b 9d 7c ff ff ff    	mov    -0x84(%rbp),%ebx
  2a:*	a1 00 00 00 00 83 7b 	movabs 0x11c7b8300000000,%eax		<-- trapping instruction
  31:	1c 01 
  33:	74 0a                	je     0x3f
  35:	3b 43 04             	cmp    0x4(%rbx),%eax
  38:	72 49                	jb     0x83
  3a:	39 43 08             	cmp    %eax,0x8(%rbx)
  3d:	72 44                	jb     0x83
  3f:	8b                   	.byte 0x8b

Code starting with the faulting instruction
===========================================
   0:	a1 00 00 00 00 83 7b 	movabs 0x11c7b8300000000,%eax
   7:	1c 01 
   9:	74 0a                	je     0x15
   b:	3b 43 04             	cmp    0x4(%rbx),%eax
   e:	72 49                	jb     0x59
  10:	39 43 08             	cmp    %eax,0x8(%rbx)
  13:	72 44                	jb     0x59
  15:	8b                   	.byte 0x8b
[   36.965467][ T3519] EAX: 00000001 EBX: ec941df4 ECX: 0003d5a1 EDX: 0003d5a0
[   36.967583][ T3519] ESI: ecbf3090 EDI: ffffffed EBP: ec941ea0 ESP: ec941d94
[   36.969628][ T3519] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010246
[   36.972151][ T3519] CR0: 80050033 CR2: 00000000 CR3: 2c027000 CR4: 00040690
[   36.976717][ T3519] Call Trace:
[ 36.978114][ T3519] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 36.979568][ T3519] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 36.980890][ T3519] ? debug_locks_off (lib/debug_locks.c:44) 
[ 36.982519][ T3519] ? oops_enter (kernel/panic.c:624 kernel/panic.c:682) 
[ 36.983919][ T3519] ? page_fault_oops (arch/x86/mm/fault.c:715) 
[ 36.985598][ T3519] ? kernelmode_fixup_or_oops+0x68/0x7c 
[ 36.987717][ T3519] ? __bad_area_nosemaphore+0x11d/0x1fc 
[ 36.989674][ T3519] ? search_extable (lib/extable.c:118) 
[ 36.991264][ T3519] ? search_module_extables (kernel/module/main.c:3277) 
[ 36.992945][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625) 
[ 36.994489][ T3519] ? search_exception_tables (kernel/extable.c:64) 
[ 36.996215][ T3519] ? lock_mm_and_find_vma (mm/memory.c:5883 mm/memory.c:5938) 
[ 36.997911][ T3519] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 36.999481][ T3519] ? do_user_addr_fault (arch/x86/mm/fault.c:1452) 
[ 37.001030][ T3519] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 37.002529][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 37.004196][ T3519] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 37.005567][ T3519] ? alloc_pages_bulk_noprof (mm/page_alloc.c:4528) 
[ 37.007193][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 37.008933][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625) 
[ 37.010396][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 37.012303][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625) 
[ 37.013810][ T3519] ? mas_prev_slot (lib/maple_tree.c:760 lib/maple_tree.c:4553) 
[ 37.015420][ T3519] do_mmap (mm/mmap.c:495) 
[ 37.016772][ T3519] vm_mmap_pgoff (mm/util.c:588) 
[ 37.018235][ T3519] ksys_mmap_pgoff (mm/mmap.c:541) 
[ 37.019761][ T3519] __ia32_sys_mmap_pgoff (mm/mmap.c:548) 
[ 37.021406][ T3519] ia32_sys_call (arch/x86/entry/syscall_32.c:44) 
[ 37.022995][ T3519] __do_fast_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:386) 
[ 37.024620][ T3519] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
[ 37.026203][ T3519] do_SYSENTER_32 (arch/x86/entry/common.c:450) 
[ 37.027715][ T3519] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836) 
[   37.029275][ T3519] EIP: 0xb7ff1579
[ 37.030483][ T3519] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d 76 00             	lea    0x0(%rsi),%esi
  35:	58                   	pop    %rax
  36:	b8 77 00 00 00       	mov    $0x77,%eax
  3b:	cd 80                	int    $0x80
  3d:	90                   	nop
  3e:	8d                   	.byte 0x8d
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d 76 00             	lea    0x0(%rsi),%esi
   b:	58                   	pop    %rax
   c:	b8 77 00 00 00       	mov    $0x77,%eax
  11:	cd 80                	int    $0x80
  13:	90                   	nop
  14:	8d                   	.byte 0x8d
  15:	76                   	.byte 0x76


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240828/202408281008.b26bed01-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


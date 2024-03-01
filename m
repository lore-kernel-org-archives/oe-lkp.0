Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85A1D6BD
	for <oe-lkp@lists.linux.dev>; Fri,  1 Mar 2024 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709282730; cv=fail; b=t1L22/apn7huS6lg/hKhVOtASPTY+xfeNYXOw6MsYlXGkDrYsXj0mwSvr7HUa5e6Z7NujW2IHkKxvS4eookKNRtkgZlVsASO+BUzqCMYqUS6R1StZonF+TZK/w+A0KsgSttTmjqpQjoEMwSbbtMjecCUudG378/1M55hCPUsfM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709282730; c=relaxed/simple;
	bh=7yZTUEiLVQ8x6btOzGI5KIz9Q8kCCVU+iX/DLkmJ2F8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=H3oChJys+UQQMgR3nai+UylY3E5GCiYEpGund2kzCQV3/7SmieeXWb79k0sa2T3G4OAKvI5KVUyzeFqb86ZO2vTiNszr9+m456u8IvHXmuarJn8Z2pEYJe74HnpImmPlTtPkvmtnRZHL2whh5BKanm5Q6XB/NN1B9gSYc00QFjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJE/3rqU; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJE/3rqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709282728; x=1740818728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7yZTUEiLVQ8x6btOzGI5KIz9Q8kCCVU+iX/DLkmJ2F8=;
  b=eJE/3rqUVfQQA3QLp/AceH8IJEA1VrWAyNBS2R94YKiR2JTarmg8cp5c
   W78USZhKW5iLfCCwBMkNg7HIeqj6qN6q+Q82gItSK1sMY5Cnvj9ziTRzK
   VV2JnRTlm6vzqm/h1JoAf0Kbr6d+xWQDNSsMIo9Nnew3fjpeSjKRchSE+
   cRtsJIMIaXfNieYNHndWQdcwDSnaSzuusS6b2Zq3pl2ytM2j/JyaCQ19Q
   qzTJDmq/aI7Cf7TBy9oGPS6WrieQkxBSvjRD3SvOgK2Z0hXQahcHlmWqG
   T26zbrduqx8P0PJXUqnPjLM/ldviLjkiZlmEZUXEyE8QDjulLzkd4g011
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14449659"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="14449659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 00:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8065455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Mar 2024 00:45:26 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 00:45:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 00:45:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 00:45:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 00:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2iq6NMWAzAAjBkNExUbeR5RVPdy5fWl3dlUEutWW37nArilDNd3JnvMu24h+WQgj09GtJ5KXQN4fo/6FUQDgCWmQC4l4ALk0h2zqP/nBzhUyKDKnaeC+SyZ+hE555d5ogIvfr9GhJM2hvrcCLyKkYFSHY2t79YRiLikdPClreuBDSHDouIXfK8HVWiTd7JnSwSFitlP9rYE8Vtn+4xdOAK2uf5/+D70W5v+MkuP0PRlH8qXCaNrv/JVTzPrUinIogkmmwiU5I+r/DAvv88AJH12aza8JUx6XLczer7uE5FlK/EgblwDro3M4qqpoBEVSU6mAZzxltdG+B9zaE+9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmliGzn/ZfujCNo/UqMwy6KDEqFqTLEdIJKU9Vy+DlQ=;
 b=BawjWdsxbxDLBwbiw6ap/jPBkCdiUua70enwakdPr/GVg219DKPzmb8HwUa4lBdK8aIl9C1PaKK0HjFtnelMJdvIQefIVHKeo5/R2G+bhI57CxJFU0t3a/US/JfAMG9Ik2iqq4WKI2n9aHpDDtSEMJZf9OQ8zJFug8kEFcN+9Bvxwr0Sml9ctIVqHGpmUkjYVIaNBAgG7t8Vl4GGuELGapVuL75Jr0QjtU9k9PvUR8vE7GM2ye6mMKLesi377WPHvzFE7z1lsMbfzjThZ5dLdRhVVD3m553JJTp5oVA8VcOwxeOBGjXgLTgiFSunqQ0pbMubwaFiiCK0Ie+3+5Z1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Fri, 1 Mar
 2024 08:45:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 08:45:17 +0000
Date: Fri, 1 Mar 2024 16:45:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:tick/keep-tick-on-hrt] [fixup! tick] ea66469f96:
 WARNING:at_kernel/time/tick-sched.c:#tick_nohz_next_event
Message-ID: <202403011625.4faa42bf-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 144776e2-7c22-46f2-f30c-08dc39cbeb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiwuFEyzC21hg1SXD2ExMLuDt2DaD0Kz5QA23aGLmwdxilr2XXG58MvLTCGys2aO/fmBtMLkqCTDixfuSLv1unzMVKhjWN00h5wL9NnPt4Ug+2TTHoK/7Q4xTmmoLpDGfNrI/TPduxMzKg3SkPKO42mBgnmlaac9cGSpbdQJVtCnY2jI71E7L6M5XtVJDC153gdC41+Mil5PZeKTn7XRh/R0PyfL9E2uRoXhDeOYcel98/QmCordM8EKPQj/hDLNmezjCh+R3a0t+TKSjgz8d/j5BXXYwlv+hgGhWAE0PWkZz+pJtZMVRKza+WV7mqR4BMIbrFucbCdhWgyxT3nIzgzAV5BINb/FQ8acZPdOc/wX6HiWAKnX+SmHRhCy8N034be1dxIM9lmF9wBJPqtQq6iuZh6st2xPzq1yWPFHkSEmwl21mfwnzw/CwNLwY6kHp9t9qbVaOPLXIgT9C/3LomQo29pj6fXhhWhXX1sVaz0CXiIibaLijhZhZQ8qCwaNOiQUo0FuYqpgg1ENjwv1akfvgRyo/7r4/DsLAc/uFw8lQIJmsHkoyiEzuR9igQsorF1+t5OBOUc6mgxuW6qJJEfyc2m1NYSXFwuPVH3iXjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIxUcHfGJnny4ahhkQGP15ZSj4544VM1bn+z4R20rTh0hTRBhZaaUMo32aku?=
 =?us-ascii?Q?wVdp0/toaO0erJDHK2p98zAmyW1GUGHWuk2x/066DsHCNMG/5yNRZRn93Z2t?=
 =?us-ascii?Q?fIQliCHIe+wRi9523Ndo7Qq+N+XL7BDuDc3Skj5q7TuZtY85eCRfvBFZBb8R?=
 =?us-ascii?Q?cUGSFJ9X/m+eldmtXV7PP50CgocbYq0J0P9+qEizwmA5kVuUQ/JzSW/vQN6R?=
 =?us-ascii?Q?45RP5+G0G/IvKr2xgRZZ0WnmOaN0Q0Zzoj2W5Is8ajo9CIZisFxajZUOr0yY?=
 =?us-ascii?Q?rZwt8zTAXxZoaHyKZbfvYNcwKBd9VvfOivx1h5VQXGkEIRAHXt0gwqOPoklZ?=
 =?us-ascii?Q?1eAQY47U59IRtUSJn4vHdGdInGfPVkX1ToJq6zRUzf/d0maHI3mZnk7BsJBU?=
 =?us-ascii?Q?8ZkQiKUnFc8h/GOwPgwNiDHEo+NkVy1wgk9Rs16GMnlSDcpYakPugO+woM+D?=
 =?us-ascii?Q?RJP4jkdxsXX/jH8TdUusekILPQkcAp8mpkW7DVk1Ry0IduY5m/wfNz9yMpAK?=
 =?us-ascii?Q?7kVxBgexz9hvK4qpwgHy8N77U+TXU4MxcQ5ujTAdCfEOmPrI3ik/j2R+HrkN?=
 =?us-ascii?Q?ASoOTkvyuMEBmwI+JFSTMkdHQVGvOdftbKqOiFhpzFSBJCnwARKFnM9hlWbs?=
 =?us-ascii?Q?HD4Sj1fdkCs8Yu5FfKuauZA5kteIeIMdGZxMSI41zxkRLWB8HislXsL6zqCi?=
 =?us-ascii?Q?jnEolxF17CEVihMuR/6P41Y6PAjkpOgLi7pNi/AYIa4eQLxtT2ruRnH6N6R2?=
 =?us-ascii?Q?TNC+qF02z/c6yq4rDWVkZydb3IXrjDNugeKSiZEZWMP6PH4fA2XWA79Dhqf3?=
 =?us-ascii?Q?rW1wu1uMl09OoasskNp8/6/szcL6WExtL80VDgYNxLaX9Ly7aqOyH6DTbGCk?=
 =?us-ascii?Q?vfCyDmJMkt5wSAs6Ei7fyvWhe14p2anpf2TlAo2n4/3dNChBzUZyxpaEGzo4?=
 =?us-ascii?Q?bHQu7G+vXNxaihz5maHKBlyp3W8v3dLTSDEEK+bhsuS3SNsspJ8GeUBbYAyu?=
 =?us-ascii?Q?h6gLWl78gY88BXnHmXppZBTmrchlOLa/hg1avR6v0qz7yxtyaRKyd6qqVpzP?=
 =?us-ascii?Q?GuXprcenqIlNarpTKeUKjUNX1kWw/EAS+UPuLQusQi1GWSVYrHQVIIRIZFmF?=
 =?us-ascii?Q?YUZRnrz8a/97a4Ry6nG1cDqtzVKwFQZErH0X2+Xdpukd3tNv5of0IAzqYair?=
 =?us-ascii?Q?Yo7nIKqnJ0t7HE2N/83ENr16ptTTkY8dGzt7WEKYPQJIwWJXSJPnwR4I9eft?=
 =?us-ascii?Q?EGKeFaidkPH2/lUvhEF5xcyhesQ5g1vvXcI//jsyextxD9c2sZGcyRpAfLf4?=
 =?us-ascii?Q?IqHP/pQDkIEMPJd1MaisQwRjZWJYlXwCsHGX2lAjRMfvcqpR1WGsNEcrPQ3o?=
 =?us-ascii?Q?8CtqAPGb4MLbN1woQQdUdY0xke7YpgUM5E3yh2S9n5Cd7PG2bGfbl26K9Gp0?=
 =?us-ascii?Q?2WDhx+RV4/j+LHAbzGtWmAIdHTj4tuBbI97k1nidlC7dfvQtzKEKoebD+UoN?=
 =?us-ascii?Q?mgerbnH8/9HNVC6xTJZRK3kAOxq+6KjX6WNsac2sEbJpZUhkFDW/mkn6NPGP?=
 =?us-ascii?Q?ZQYOD3wpVUcCxW9En70587/jt0nCKcofweXEDSg5j/q4DvuDI27zuBXpCe7Z?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 144776e2-7c22-46f2-f30c-08dc39cbeb53
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:45:17.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKDSmrO6UZWVb9SX+kkVOESzSIWI5B4tr0JNJB3UKDANRwumF61z20lHJbYLl0kVCt2aZOeCmCas3YGECp/2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-OriginatorOrg: intel.com



Hello,


we noticed a WARN added in this commit is hit in our tests, below detail report
just FYI.


kernel test robot noticed "WARNING:at_kernel/time/tick-sched.c:#tick_nohz_next_event" on:

commit: ea66469f96e554d83c2e8653992ebc3e22fcc7a7 ("fixup! tick-sched: Set last_tick correctly so that timer interrupts happen less")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git tick/keep-tick-on-hrt

in testcase: boot

compiler: gcc-7
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------------------------+------------+------------+
|                                                                           | 02cfd31343 | ea66469f96 |
+---------------------------------------------------------------------------+------------+------------+
| WARNING:at_kernel/time/tick-sched.c:#tick_nohz_next_event                 | 0          | 13         |
| RIP:tick_nohz_next_event                                                  | 0          | 13         |
+---------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403011625.4faa42bf-oliver.sang@intel.com


[    6.681556][    T0] ------------[ cut here ]------------
[ 6.682152][ T0] WARNING: CPU: 0 PID: 0 at kernel/time/tick-sched.c:870 tick_nohz_next_event+0x378/0x380 
[    6.683480][    T0] Modules linked in:
[    6.683911][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-rc4-00037-gea66469f96e5 #3
[    6.684804][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 6.685518][ T0] RIP: tick_nohz_next_event+0x378/0x380 
[ 6.685518][ T0] Code: ff ff 0f 0b 48 c7 c7 90 ae c0 88 48 89 dd e8 8f e9 fe ff e8 3a d9 fe ff f6 05 43 86 c8 03 02 0f 85 8e fe ff ff e9 f4 fe ff ff <0f> 0b e9 33 fd ff ff 90 53 48 89 fb 48 c7 c7 90 ae c0 88 e8 60 e0
All code
========
   0:	ff                   	(bad)  
   1:	ff 0f                	decl   (%rdi)
   3:	0b 48 c7             	or     -0x39(%rax),%ecx
   6:	c7                   	(bad)  
   7:	90                   	nop
   8:	ae                   	scas   %es:(%rdi),%al
   9:	c0 88 48 89 dd e8 8f 	rorb   $0x8f,-0x172276b8(%rax)
  10:	e9 fe ff e8 3a       	jmpq   0x3ae90013
  15:	d9 fe                	fsin   
  17:	ff f6                	push   %rsi
  19:	05 43 86 c8 03       	add    $0x3c88643,%eax
  1e:	02 0f                	add    (%rdi),%cl
  20:	85 8e fe ff ff e9    	test   %ecx,-0x16000002(%rsi)
  26:	f4                   	hlt    
  27:	fe                   	(bad)  
  28:	ff                   	(bad)  
  29:*	ff 0f                	decl   (%rdi)		<-- trapping instruction
  2b:	0b e9                	or     %ecx,%ebp
  2d:	33 fd                	xor    %ebp,%edi
  2f:	ff                   	(bad)  
  30:	ff 90 53 48 89 fb    	callq  *-0x476b7ad(%rax)
  36:	48 c7 c7 90 ae c0 88 	mov    $0xffffffff88c0ae90,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	60                   	(bad)  
  3f:	e0                   	.byte 0xe0

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e9 33 fd ff ff       	jmpq   0xfffffffffffffd3a
   7:	90                   	nop
   8:	53                   	push   %rbx
   9:	48 89 fb             	mov    %rdi,%rbx
   c:	48 c7 c7 90 ae c0 88 	mov    $0xffffffff88c0ae90,%rdi
  13:	e8                   	.byte 0xe8
  14:	60                   	(bad)  
  15:	e0                   	.byte 0xe0
[    6.685518][    T0] RSP: 0000:ffffffff88803e20 EFLAGS: 00010087
[    6.685518][    T0] RAX: 0000000000000b96 RBX: 0000000189597b93 RCX: 0000000189a10b00
[    6.685518][    T0] RDX: 00000000000a866d RSI: ffffffff88c09848 RDI: ffffffff88826d80
[    6.685518][    T0] RBP: 0000000189968493 R08: 0000000000000001 R09: 0000000000000000
[    6.685518][    T0] R10: 0000000000000000 R11: ffffffff88c09848 R12: 00000000fffee0ef
[    6.685518][    T0] R13: ffffffff88826500 R14: ffff9a45bffed000 R15: ffffffff88825b70
[    6.685518][    T0] FS:  0000000000000000(0000) GS:ffffffff8885f000(0000) knlGS:0000000000000000
[    6.685518][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.685518][    T0] CR2: ffff9a45bffff000 CR3: 0000000030250000 CR4: 00000000000406b0
[    6.685518][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    6.685518][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    6.685518][    T0] Call Trace:
[    6.685518][    T0]  <TASK>
[ 6.685518][ T0] ? __warn (kernel/panic.c:677) 
[ 6.685518][ T0] ? tick_nohz_next_event+0x378/0x380 
[ 6.685518][ T0] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 6.685518][ T0] ? handle_bug (arch/x86/kernel/traps.c:238) 
[ 6.685518][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:259 (discriminator 1)) 
[ 6.685518][ T0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 6.685518][ T0] ? tick_nohz_next_event+0x378/0x380 
[ 6.685518][ T0] tick_nohz_idle_stop_tick (kernel/time/tick-sched.c:1195) 
[ 6.685518][ T0] do_idle (kernel/sched/idle.c:170 kernel/sched/idle.c:312) 
[ 6.685518][ T0] cpu_startup_entry (kernel/sched/idle.c:410 (discriminator 1)) 
[ 6.685518][ T0] rest_init (include/linux/rcupdate.h:751 init/main.c:701) 
[ 6.685518][ T0] arch_call_rest_init+0x5/0x40 
[ 6.685518][ T0] start_kernel (init/main.c:452 init/main.c:898) 
[ 6.685518][ T0] x86_64_start_reservations (arch/x86/kernel/head64.c:543) 
[ 6.685518][ T0] x86_64_start_kernel (arch/x86/kernel/head64.c:536) 
[ 6.685518][ T0] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:461) 
[    6.685518][    T0]  </TASK>
[    6.685518][    T0] irq event stamp: 20936
[ 6.685518][ T0] hardirqs last enabled at (20935): tick_nohz_idle_enter (arch/x86/include/asm/irqflags.h:42 (discriminator 3) arch/x86/include/asm/irqflags.h:77 (discriminator 3) kernel/time/tick-sched.c:1257 (discriminator 3)) 
[ 6.685518][ T0] hardirqs last disabled at (20936): do_idle (kernel/sched/idle.c:291 (discriminator 1)) 
[ 6.685518][ T0] softirqs last enabled at (20914): __do_softirq (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 6.685518][ T0] softirqs last disabled at (20889): irq_exit_rcu (kernel/softirq.c:427 kernel/softirq.c:632 kernel/softirq.c:644) 
[    6.685518][    T0] ---[ end trace 0000000000000000 ]---
[   10.680681][    T1] All ww mutex selftests passed
[   10.682869][    T1] torture module --- rcu:  disable_onoff_at_boot=0 ftrace_dump_at_shutdown=0 verbose_sleep_frequency=0 verbose_sleep_duration=1 random_shuffle=0
[   10.684396][    T1] rcu-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0
[   10.688512][    T1] rcu:  Start-test grace-period state: g8117 f0x2
[   10.689161][    T1] rcu_torture_write_types: Testing conditional GPs.
[   10.689818][    T1] rcu_torture_write_types: Testing conditional expedited GPs.
[   10.690599][    T1] rcu_torture_write_types: Testing conditional full-state GPs.
[   10.691390][    T1] rcu_torture_write_types: Testing expedited GPs.
[   10.692034][    T1] rcu_torture_write_types: Testing asynchronous GPs.
[   10.692709][    T1] rcu_torture_write_types: Testing polling GPs.
[   10.693339][    T1] rcu_torture_write_types: Testing polling full-state GPs.
[   10.694047][    T1] rcu_torture_write_types: Testing polling expedited GPs.
[   10.694747][    T1] rcu_torture_write_types: Testing polling full-state expedited GPs.
[   10.695586][    T1] rcu_torture_write_types: Testing normal GPs.
[   10.696208][    T1] rcu-torture: Creating rcu_torture_writer task
[   10.697041][    T1] rcu-torture: Creating rcu_torture_fakewriter task
[   10.697732][   T51] rcu-torture: rcu_torture_writer task started
[   10.698356][   T51] rcu-torture: GP expediting controlled from boot/sysfs for rcu.
[   10.699250][    T1] rcu-torture: Creating rcu_torture_fakewriter task
[   10.699936][   T52] rcu-torture: rcu_torture_fakewriter task started
[   10.702513][    T1] rcu-torture: Creating rcu_torture_fakewriter task
[   10.703213][   T53] rcu-torture: rcu_torture_fakewriter task started
[   10.703964][    T1] rcu-torture: Creating rcu_torture_fakewriter task
[   10.704667][   T54] rcu-torture: rcu_torture_fakewriter task started
[   10.706279][    T1] rcu-torture: Creating rcu_torture_reader task
[   10.706944][   T55] rcu-torture: rcu_torture_fakewriter task started
[   10.707695][    T1] rcu-torture: Creating rcu_torture_stats task
[   10.708349][   T56] rcu-torture: rcu_torture_reader task started
[   10.709073][    T1] rcu-torture: Creating torture_shuffle task
[   10.709717][   T57] rcu-torture: rcu_torture_stats task started
[   10.710393][    T1] rcu-torture: Creating torture_stutter task
[   10.711037][   T58] rcu-torture: torture_shuffle task started
[   10.711722][    T1] rcu-torture: rcu_torture_fwd_prog_init: Limiting fwd_progress to # CPUs.
[   10.711722][    T1]
[   10.712902][    T1] rcu-torture: Creating rcu_torture_fwd_prog task
[   10.713575][   T59] rcu-torture: torture_stutter task started
[   10.714247][    T1] rcu-torture: Creating rcu_torture_read_exit task
[   10.714928][   T60] rcu-torture: rcu_torture_fwd_progress task started
[   10.717646][    T1] Initialise system trusted keyrings
[   10.718285][   T61] rcu-torture: rcu_torture_read_exit: Start of test
[   10.718956][   T61] rcu-torture: rcu_torture_read_exit: Start of episode
[   10.719800][    T1] workingset: timestamp_bits=46 max_order=22 bucket_order=0
[   10.726450][    T1] zbud: loaded
[   10.729008][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   10.732681][    T1] ntfs: driver 2.1.32 [Flags: R/W].
[   10.733514][    T1] efs: 1.0a - http://aeschi.ch.eu.org/efs/
[   10.735767][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[   10.736450][    T1] QNX4 filesystem 0.2.3 registered.
[   10.737036][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
[   10.738034][    T1] fuse: init (API version 7.39)
[   10.739275][    T1] orangefs_debugfs_init: called with debug mask: :none: :0:
[   10.740377][    T1] orangefs_init: module version upstream loaded
[   10.741275][    T1] JFS: nTxBlock = 8192, nTxLock = 65536
[   10.749271][    T1] SGI XFS with security attributes, scrub, repair, fatal assert, debug enabled
[   10.752620][    T1] befs: version: 0.9.3
[   10.753413][    T1] ocfs2: Registered cluster interface o2cb
[   10.754195][    T1] OCFS2 User DLM kernel interface loaded
[   10.756729][    T1] ceph: loaded (mds proto 32)
[   10.770237][    T1] NET: Registered PF_ALG protocol family
[   10.770883][    T1] xor: automatically using best checksumming function   avx
[   10.771734][    T1] Key type asymmetric registered
[   10.772280][    T1] Asymmetric key parser 'x509' registered
[   10.772880][    T1] Asymmetric key parser 'pkcs8' registered
[   10.773651][    T1] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 239)
[   10.776797][    T1] io scheduler mq-deadline registered
[   10.777363][    T1] io scheduler kyber registered
[   10.778415][    T1] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
[   10.779028][    T1] crc32: self tests passed, processed 225944 bytes in 146946 nsec
[   10.779996][    T1] crc32c: CRC_LE_BITS = 64
[   10.780471][    T1] crc32c: self tests passed, processed 112972 bytes in 73480 nsec
[   10.792721][    T1] crc32_combine: 8373 self tests passed


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240301/202403011625.4faa42bf-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


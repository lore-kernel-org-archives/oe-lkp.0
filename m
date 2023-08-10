Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053FD366
	for <oe-lkp@lists.linux.dev>; Thu, 10 Aug 2023 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691655633; x=1723191633;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Up9Vp/rewqaV8y0RVRB43OAGn5vkySUHhx3n/S8lIFA=;
  b=kmgFZN7kmRwpbThzvsRXZ+ccWwnk3ciHsJ+FTEN6D8yGi+Mmiqfky6/d
   ik9TV5jWcJUYTfgsAQaXLA7vTYg28EjED/ZAdX135Kf3Key2kMkE6doq1
   L0gNjeHWKgxp22ezbWkxBV1DLr66k77A5Tt7Tz/FuAdL9muK4ZnykYyX3
   AJMvY632m6+ec4N95bvaEZ7mQurowU6RVWqA2Y1+l4dTZMouWbvfSg88w
   b7tXUfcjFYcU/XJ6lAU1uJbimXAul0hT/f6ODMMzyor+st8Lx+KHNxdiJ
   D2/Pz0AkUXSukuHta3ai9SbEmV67RdMiLpx1xdUuys8bvEc+6YVrDsG7u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361473829"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="361473829"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 01:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855850703"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="855850703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 01:20:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 01:20:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 01:20:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 01:20:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 01:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+kwILVtNuL5wwvBWIkosUuf94tYQXfh+f+L6hNDrxqQ+JZLQxyqFMWbIM4N7hBrrLfgu56Pus0pvN9OWJ/m+GoPG1QyZqgP6Aq15UUMH65QUDYfhshvRJEn4lsmCFze3AdT3uBytrb8Sc+i8YWjXow+DHTOlSz6qHrW8ytpRMnV12pt6FNkJXCYeLXOvQT2+FCgvOHNMzgI5FsQI514fr2AwZhSgGk0jxXpct3eT3ggeNThu7KNYIsGldipiab6T62DulkzMYqkml8AZUkvRIJ6buPJXrM2+GqFzDy5tjMA+86cT5YYugiZmEYSScerGAFt4vPP/LP83oyYBTQeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGvcqSUYeSq7sKgysNqjwt5/VLgxs7vWCcKqfxECuSY=;
 b=Gep4vasravbnAa6/7e9e7rwgtqsHJszxNlJzvXila5Cc1OYvnvPtRr1+BmZg96CPea0JaRJtizxnnsqDjXGLLx8N+YL7nLDqEZQlM+sj7/HlaWaGqttEKL3gAOkTB+UnS/RPgpM9Omp7lVSr8FMaAewSanh/h7C0MTKc/EEBad6tF59Te+Rp5rYGBnr7+eGr4RjIwIQZ+pKjp0qCH6YHFQ3RP17uemgToR+dyflq8sCtAS+BL/XONeaLjta2LorIwR5GfvMtJ7rsispdfMsiv2eCgrYNwTLBxiAHP4V3ePmWcpAu6k5h3q3FUpDVBA85w3iQn3VnJj7JgtUohUJjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:20:29 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 08:20:29 +0000
Date: Thu, 10 Aug 2023 16:20:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [lantianyu:test]  541d489f20:
 BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entry_offset:#)
Message-ID: <202308101627.704411c1-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: KL1PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::20) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: f42c2b6c-bf09-4c6f-3894-08db997aa82c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+nPe8qyntowYA0QfFNTXGqLc7cLeT6T0YRLgryBefoaT/ayjhPpgYMvyRCe5he9rGSk64V2HAGwy4ToWmRNsH62lmnbZR9NZ5YbhQN7q0AViHdCI3p7Psl9M4EvEYAsfwjQ6HuQVK1P/DuU0/omFZKn8gfBn0/Xjz8ysetyRJAs77T7uhsprUgBZhQIMlNDx/0jLe+wwDKOip1uavBANveAXRfrFD+hC+aVOiosNhI0erVHkKb8Rlg2p6FqaphBHoG6a8g4b1RyY+cKbiYsuYHoRkDGx+O0AMS5diwOhNAqwkLHtX9uUMzw+fb4Wm53HfCS6sKN273GuhWqPEV1mCluFxXyf6iIPnosULlA2QkSPVXzIurydaPiVc70EvdB5+D1hDEVhcgaJPICPquJ+6E/HeDtPfrRHlVRQdl6F0Lcuq41UsmpgE5ScJ1Gg/7O9fs7fl38HvXlqFx+kFJKYGkx1jARP6KYAr1pBZvTJATDtgHWd7nl7TvD6kmqaTo2ippbG0+BYJO7DBOsNr+t7RDNCTsvcx4g1KExiWH+OWY1GzU1EftO8qsb2u4GIDXkUbebqEIPfzN6HldeUiMw0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(1800799006)(186006)(26005)(6506007)(1076003)(8676002)(8936002)(41300700001)(107886003)(36756003)(2906002)(83380400001)(2616005)(38100700002)(86362001)(82960400001)(5660300002)(66946007)(66556008)(66476007)(4326008)(6916009)(6512007)(966005)(6666004)(478600001)(6486002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WlUElXf0Yf+hScHKgoKNGxMFUGnO6Kf8VVq6tHg9AGCgtzCI8TYKsvbJtXem?=
 =?us-ascii?Q?5SafuRoWgff2UXMCmDgHF4SQR3scSr1HNkVrbAg20Ee55hWmk1VVO/aQB5L9?=
 =?us-ascii?Q?NfhyHYC2+KYfWA9d3ux2oBw6vx/pwMZpCJRA48VnWOsZUf6WxTZ5OD1NRdy/?=
 =?us-ascii?Q?/8nRwyzeAhsHRjN8F0aw6rCSWuiiOtoQ+McRYDXuC9ZyQq98ammxVJxCg9c9?=
 =?us-ascii?Q?sH1XlsTxpGvPZx/be2gBvCYH43z2BSj78qWJzWBhxZItUbjgLVKaiFPGK37L?=
 =?us-ascii?Q?VDlhRyAwTQUTaGKVogyGeftTzkUU7b8yzOZUKysWQ1/60nzTt3wmcsqueGc1?=
 =?us-ascii?Q?BEsquRqPntvzhsXWugzI4FRG/w8qWLOiLjsIUAD6PC4V94ySzKBH54egzjO3?=
 =?us-ascii?Q?zWg8/V4+qAhiO5iuN1BuAM00Ooibk2uGUHxyDTR+DWv0Cc10BhKEG3FF5VeQ?=
 =?us-ascii?Q?CQYPwj8LieGOXzKcLTZia3O6h4J1Q0psYRG6L+rFTdnQzICNzga8T3O2m9kE?=
 =?us-ascii?Q?G6O5pdAmAGs2/XQq9ZC2PUWGaXaSsTACQFdXdHqEraeIXMpPOsCwVEN8aVKr?=
 =?us-ascii?Q?ajndzJhfb6oSUNnAtoOHU/TUNniZ6lSlY8enHaeTSYSvKhcLpsFIpD4T8CF8?=
 =?us-ascii?Q?OKvIZAHIjHlXL2shGxryD8iVNwsOkwweFFrLDjhD0Vx39Qvzc1R+4Q5Sbyly?=
 =?us-ascii?Q?0zJMEsLKG5zlBNkYdxfqFW05dC6wynbTFZBFBfvN5QA5J+6YQ69hXRDkFUEG?=
 =?us-ascii?Q?pwMTBzDAWmA8PxbgjM2mxkHreGBoJe+TJTJsK+SyM2rd/d0awJl0W240Vc5D?=
 =?us-ascii?Q?DnGVfj8C1MJvQUNr/AjCEkSt/fqbbiaL7+U6xVPOkGpZy/g1YL1HSxbTqwtS?=
 =?us-ascii?Q?94PuSeX7rw7ihyrDlLKmkvYCFbXqMcraxI+lejvV8BqWowGkOMRWHCXTLagM?=
 =?us-ascii?Q?itiyoBSFlb8bpcqkDa7GvR34UTgTm4SeirDogTawu9AcKLlPEcOCE+sysdLq?=
 =?us-ascii?Q?k0PeNuz63AL5oceKdrx4nmCnqOu6jIffreVs3a97LMe8hfzDlN5yx0xSmG0X?=
 =?us-ascii?Q?kI4MNpCYJ+3s+JIvP8CGF3Lh8osmsLOgvIqGuL8hpFTMzEaWgvQXbgpwmgWi?=
 =?us-ascii?Q?DVK1rZPRMRjlLDecyf37R3zIxIjszYgnWMurSa7UXELvOtGoLyVtRlFE5Xey?=
 =?us-ascii?Q?de6VHMjZ7aBrY2oHWwlzs40lu7kZjDfUbcPvoQz6Dc0QrpoxaS5IkDoLUG4H?=
 =?us-ascii?Q?b4WOTUH1mAck4fpryyo7IjuC2bWOlUWQg5UPY2UNyZCTrvQXSpc39VHnjOWf?=
 =?us-ascii?Q?opWYWJILVdzkCqTR3IjXBO3VDc/YimIAxsHT8YihGOBdLLW7eiby10EQzIUd?=
 =?us-ascii?Q?TPEwgqVHjmYooW8z03BXKDBtSxnkN+13DSH6MTDs8d8Kz4DiVxzRUyXg2mx2?=
 =?us-ascii?Q?zfpIlR/aAFgfUj2eV6eQQuiJ3nhabReVVd7HQ/WecKXMiP7cIWNTS2kLT4z+?=
 =?us-ascii?Q?0Iy+4YLjHRalr/vVv4dmGLyBgNJZIjsVWiFA4k+57Kgr5FptDtVTDEfTY4zm?=
 =?us-ascii?Q?3tee8J1UOHU2Qfi+ko9bTeueXIC1KYbkjxD7487t+Z8UYpFs8O1AMM+Lfwm7?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42c2b6c-bf09-4c6f-3894-08db997aa82c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:20:29.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcP9s8KYnrPokyMjysj6YNu4v2CWuf/JGt3MN3gxa6wZs/0p7g2NtwnE9Q+hzGPr0XzM5QLr7wDRHZlIOxnMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_failed_in_early-boot_stage,last_print=
k:Booting_the_kernel(entry_offset:#)" on:

commit: 541d489f20d057b7f1b262baf28fe2fc3ed39072 ("cpuid workaround")
https://github.com/lantianyu/linux test

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------=
------------+------------+------------+
|                                                                          =
            | 577e693838 | 541d489f20 |
+--------------------------------------------------------------------------=
------------+------------+------------+
| boot_successes                                                           =
            | 20         | 0          |
| boot_failures                                                            =
            | 0          | 18         |
| BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entr=
y_offset:#) | 0          | 18         |
+--------------------------------------------------------------------------=
------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308101627.704411c1-oliver.sang@=
intel.com


Physical KASLR using RDTSC...

Decompressing Linux... Parsing ELF... Performing relocations... done.
Booting the kernel (entry_offset: 0x00000000).
convert early boot stage from hang to failed
BUG: kernel failed in early-boot stage, last printk: Booting the kernel (en=
try_offset: 0x00000000).
Linux version 6.5.0-rc2-g541d489f20d0 #1
Command line: ip=3D::::vm-meta-88::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/res=
ult/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-debian-10.3/gcc-12/541=
d489f20d057b7f1b262baf28fe2fc3ed39072/3 BOOT_IMAGE=3D/pkg/linux/i386-debian=
-10.3/gcc-12/541d489f20d057b7f1b262baf28fe2fc3ed39072/vmlinuz-6.5.0-rc2-g54=
1d489f20d0 branch=3Dlantianyu/test job=3D/lkp/jobs/scheduled/vm-meta-88/boo=
t-1-debian-11.1-i386-20220923.cgz-541d489f20d0-20230810-3150-1n5gx8o-5.yaml=
 user=3Dlkp ARCH=3Di386 kconfig=3Di386-debian-10.3 commit=3D541d489f20d057b=
7f1b262baf28fe2fc3ed39072 mem=3D4G nmi_watchdog=3D0 vmalloc=3D256M initramf=
s_async=3D0 page_owner=3Don max_uptime=3D600 LKP_SERVER=3Dinternal-lkp-serv=
er selinux=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_sta=
ll_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_=
panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=
=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=
=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw m=
em=3D4G rcuperf.shutdown=3D0 watchdog_thresh=3D240

Kboot worker: lkp-worker59
Elapsed time: 780


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230810/202308101627.704411c1-oliv=
er.sang@intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


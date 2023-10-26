Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2C8F47
	for <oe-lkp@lists.linux.dev>; Thu, 26 Oct 2023 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQLT0PCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698296177; x=1729832177;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=3mMDP7kWPQ9CvqLnXpmv7iN4wE/IQf7kYyQgiwKgGYY=;
  b=hQLT0PCF8Twh5qXzEtAsybtjXst8AS6jxj05Iog/WyhJCT/Mdc7c5KaL
   bw/A9DGpwUzVS1pkl3WvcD6xR/ozvMp4XtWUzK1LnUX9+SPLqMR8cqnGu
   ZSZSqBgrtUAaegMR9pns3mcsDr5f9eOm31xBXEYE3dTyA6D1mI78HW/SK
   dKAF9NIdth8GTGs/F7ID2RR05sP/tEonxkV5y+LTpc8FsXzG4yqxV5Mya
   39xbVmrFr2H3z0LsXeqpDqSS8skT0KTtme3YZCQQYKQXBniwLL/ECDgZy
   Fdrhj6WtT0al20b60LEYOSvDThtWBRKvLd/KsE4S7VQ6b53KLyacNX22O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390317829"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390317829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 21:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752589671"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752589671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2023 21:56:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 21:56:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 21:56:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 21:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIGqVzrGTG2Um4j0R3w5tBIvZ5yuX6qBfyUcEc1jhV3IAF/JRJgm4G22nvf5uFuWrUz9F79gpynDTEPDyv/AgINJiX90Jd9A8ZHkH2uo+HH/y6XGDvvpKbg2b9HeJoJrYzyFppeqpkJzkd31fy3ucrvrmVSaBbmZ0T3fQJMNdcWGUUGFLSDfwYYXSFdRp1sHoLKwzd7/L9omz8tXkHpS5GqzYlhccVBsBIJxOhary5P63+qOfUGgXJuVSECT/XFQOp2hn2uMp+mlxZeOo1JwIm14FIGbW5CzDKDoWjf91wX+6/O8yrekyuwEqS9958dcd5k5HXLjJ0gjxA8SKsxFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JijO1YhGgFNw/0qMP7cX/Y0ZJyjPb0ikPZ/JgvcUXdw=;
 b=Q0CWfeSZc3WfjxphjWyfTw1aUz7VvK+dJIv6EduSgLEhZHboLOlxmmvyBmLQEPWxL0ASDH5I+upGqQt75Cj1YaZCHIWmrzy8w78N9vUo01+bGJe728/eyk3DqXdNo0RoEL6k8n+gg66FfrUO6FrcY/OjlGJ9rQ/sIoJDriRgig19ZQl/k8jHNhU0dQ9v7Vx/7IpbIM+85WiMIyBEzG00d5utQX+lz4P6F/kU0BxHiGu8q2wEacwWibtbSa1/1hyiSYW2wxq2n19uzjNfVoS6NBf9AS0PXsu8U1NCm8t9bQAsm8grTZYojECprFtoocnRog7LuANtHi5+WUKarA6WjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 26 Oct
 2023 04:56:12 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 04:56:12 +0000
Date: Thu, 26 Oct 2023 12:56:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Aleksander Lobakin <aleksander.lobakin@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [alobakin:pfcp] [bitmap]  f84b23853c: kernel-selftests.kvm.make.fail
Message-ID: <202310261116.c6bf98ab-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: f454894f-9b65-4f31-34f9-08dbd5dfe05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/sEWnQc5+EHHw802UIEz1CvEj6kTx0QX70l1dtm6WP+aD+YeM48SIb6sGbp5/nUbAvdsJQe9V3TNMKljS1xItEdBMXOG0QOFOVBCTePvDxAmD+0yQvufdyVRt5p/Zoh3uHzWTZSa3NCdGxn9uObvCwyBD5IbbWwvOZiU1OXqXSNRo4qACPbu+vHyeN0eitHYR6r23LL8Yw3ME5K24s17khPIrDqeeC6Q2fGzgv0673LZQpoNWkhaiYGhn7Hl12NhmbiUCRrkRWpXTCCB46DFI3vE0qnvUqgWYEy1m2IkASSOHO0z/hM4Sjj4Mv1/JPeAio6Azmy6R1w2HMt9QykANklTH0feKP9knzdd+LY+s1fTxojIcecw+7olZFO4jtNv9gMEdINs8wKMR2bQpucmkGH/Gt+QSGND1pLhz/AofJOAW3AgadfupIvthb7m/SAWiwNch1LN30U5rH6+MtncbZdxuIjDrXxYQXszXF+uMTr496uikRWkttmyv+EN0onC6K/KPPmpO4YrpHZnkIvPyXLIWRGy8tZMtId/ehuJHCoAVMyRDg9hmbKDDd1sKABTSkG1b4u/vtJaMr5Xyiejw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6636002)(8676002)(6666004)(83380400001)(6506007)(66556008)(37006003)(86362001)(66946007)(41300700001)(2906002)(6862004)(66476007)(316002)(4326008)(4001150100001)(8936002)(26005)(6512007)(478600001)(6486002)(966005)(38100700002)(36756003)(2616005)(5660300002)(107886003)(1076003)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkgr7BoRX86hbXRivk3CGX6VLmjioB2J3V6ENMhFLpSlroan7EiMT09BeDx+?=
 =?us-ascii?Q?K5aOB6cHUjU7iUVw9C04/TV+6cSc9VOhQLcNCdfcbrWiRQDAIdB+J4zMeYeJ?=
 =?us-ascii?Q?AtkUBLfRgi0yLZUdYp4aO3QKFJiQQhbfiBzWok/30Tr5Bz+RBZe0vnIjoi4Z?=
 =?us-ascii?Q?5Rs4zNmdU863tA4OcnCh7ZJ+FElAxs7uthBhsOqHfq14EJDExeypL6UdCUHx?=
 =?us-ascii?Q?/rw4viYuotS1aZuBUDvNZmeLlN5ghWH5L2rilzpYnN0Tnn8AehzjdPOGP+Mb?=
 =?us-ascii?Q?k9OPzVAZmzkUFMhRcMRynA8+eIV+EuA7Z2KSc7GibU0fkYyPOWGLVGHFGYTk?=
 =?us-ascii?Q?U55uVosRrTTR7fKzU0A3rguUca9mRa2QcEEllnJSwqgkaGTsj83jtCojiTnL?=
 =?us-ascii?Q?TqzQPXcgJUnDOfsyNkyU3LLTEDZ8iYWwfQPHE9+W2tRtCzL+xGW+meAmNApC?=
 =?us-ascii?Q?XcqsEg3gLlAFI71CDozZYHPCi4FweyZwbzMijhIQIQ+0bNQlZ9Gcwdo6NlIC?=
 =?us-ascii?Q?KwRbRYh53xottI3TxsHFFz2Ns+I8rqO4oqJiS5do1NSrAUrpEGRJrL8QS1Md?=
 =?us-ascii?Q?xHMKZNR8ZsbWE1kJQhxoGaHSSCLIN80Xruy0EdfHNffxKh4rxl4ePpItYb4z?=
 =?us-ascii?Q?/NGoHDX6TUUkdO+cYxyGEXMyQ0Zw3BjVzGcKjGRgWG5Q6CWFZuHXROf0IlGJ?=
 =?us-ascii?Q?RQeOE/1RwjivAPDV0crhjMWJTM6FzJ6UQLe0QPYDEekgtJx4mfQe41BQOrQE?=
 =?us-ascii?Q?p2meb16crhHVN8G6uxlVMr4mrxxK+Et0o5/aa2nomosb3keU7dbEgsM0wTyi?=
 =?us-ascii?Q?qlPQvazT6y1IVkEgI6hwKbb62/GLL7pYB/1R7Rjbg0ubb5+/WLcTVXBF+dST?=
 =?us-ascii?Q?3lDikVcJwh+F6aP5tVi2TRRSC1Pw9GDeKwoPKmahfCyUvWELNVdOblCo6E6y?=
 =?us-ascii?Q?7sUlXBUe1zvqQZNwzrDzUBwAkPaQYxVoik9iwZTFnYYy3k9MSsxmqVw+5Va0?=
 =?us-ascii?Q?4cJQjkeKGp6n7yFqljZb/ktzLBWZIV30dQTnK23fU7BwLB8ZXMCgkMvqA+px?=
 =?us-ascii?Q?Qdt6yn/AmS4ibpuosthYIuUVWAFlPSrB3xjlrhK3juM6bbHYFK5eMxZ0yIrI?=
 =?us-ascii?Q?PdYSBWTmPaCT4GLRH86V6AUYphOO6K2dold3FN+iiLMXYYMS6JXPgkPO+fE1?=
 =?us-ascii?Q?Rc/5U9f9Pmr4k8blQbW9Px+IV7//o5vt7ec0iJV4XHXiSFWsOK0CbA68k09i?=
 =?us-ascii?Q?HMZ1yX7qASxioOrrDHOZux/4P7aU6LSjJ5NNysOPav2k0/0wgjR5Ex0qs75U?=
 =?us-ascii?Q?s2qSlD1Fs4Pq4p71sfJdnSi2JseBQk07hDoWNi1WGPTd285opPJPafbC9Lpv?=
 =?us-ascii?Q?vKB567QvntQ/ZL3AdV7BH8OHeFthDxS2S0Vg4qokjalrBE9lCQHfF3/tF3Qt?=
 =?us-ascii?Q?MHvf65igKbf3zWok9dalM6R1wAj+8k4cN/MBSpoF76ScNDKKSrRTHYP/tfWh?=
 =?us-ascii?Q?ll9IJKealyG9wwFDor1okiqD/TDFCQA5jc0F3xBHMm6GS0AynZmWdxkrCL5I?=
 =?us-ascii?Q?xbuXu4dRhK1uP+sZhyhXF4mq3+kOmqIsXHGRr26vT2HbYukPVQ6FhRuRI7L+?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f454894f-9b65-4f31-34f9-08dbd5dfe05a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:56:12.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvmY6zSxlN1NCg2HNntkbo8ITaehI92qtiUN4MvVY/57655GZkn8uwV72qX52jU/+ylmW+qYbL5SrY1xZhzgFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.kvm.make.fail" on:

commit: f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf ("bitmap: introduce generi=
c optimized bitmap_size()")
https://github.com/alobakin/linux pfcp

in testcase: kernel-selftests
version: kernel-selftests-x86_64-60acb023-1_20230329
with following parameters:

	group: kvm



compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphi=
re Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310261116.c6bf98ab-oliver.sang@=
intel.com

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8=
.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf
2023-10-21 10:06:44 ln -sf /usr/bin/clang
2023-10-21 10:06:44 ln -sf /usr/sbin/iptables-nft /usr/bin/iptables
2023-10-21 10:06:44 ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables
2023-10-21 10:06:44 sed -i s/default_timeout=3D45/default_timeout=3D300/ ks=
elftest/runner.sh
LKP WARN miss config CONFIG_KVM_AMD=3D of kvm/config
2023-10-21 10:06:44 make -j224 -C kvm
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm'

...

gcc  -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -Wno-gnu=
-variable-sized-type-not-at-end -MD -fno-builtin-memcmp -fno-builtin-memcpy=
 -fno-builtin-memset -fno-builtin-strnlen -fno-stack-protector -fno-PIE -I/=
usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf031=
95ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include -I/usr/src/p=
erf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcd=
dd5ddf/tools/testing/selftests/../../../tools/arch/x86/include -I/usr/src/p=
erf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcd=
dd5ddf/tools/testing/selftests/../../../usr/include/ -Iinclude -Ix86_64 -Ii=
nclude/x86_64 -I ../rseq -I..  -isystem /usr/src/perf_selftests-x86_64-rhel=
-8.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/usr/include   -c x=
86_64/set_sregs_test.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/x86_=
64/set_sregs_test.o
In file included from lib/x86_64/processor.c:8:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:263: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/x=
86_64/processor.o] Error 1
make: *** Waiting for unfinished jobs....
In file included from lib/memstress.c:8:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:263: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/m=
emstress.o] Error 1
In file included from x86_64/dirty_log_page_splitting_test.c:14:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:254: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/x86_6=
4/dirty_log_page_splitting_test.o] Error 1
In file included from lib/x86_64/memstress.c:9:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:263: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/x=
86_64/memstress.o] Error 1
In file included from x86_64/hyperv_evmcs.c:13:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:254: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/x86_6=
4/hyperv_evmcs.o] Error 1
In file included from x86_64/hyperv_svm_test.c:15:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:254: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/x86_6=
4/hyperv_svm_test.o] Error 1
In file included from lib/ucall_common.c:4:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:263: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/u=
call_common.o] Error 1
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm'
2023-10-21 10:06:48 make quicktest=3D1 run_tests -C kvm
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm'
gcc  -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -Wno-gnu=
-variable-sized-type-not-at-end -MD -fno-builtin-memcmp -fno-builtin-memcpy=
 -fno-builtin-memset -fno-builtin-strnlen -fno-stack-protector -fno-PIE -I/=
usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf031=
95ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include -I/usr/src/p=
erf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcd=
dd5ddf/tools/testing/selftests/../../../tools/arch/x86/include -I/usr/src/p=
erf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcd=
dd5ddf/tools/testing/selftests/../../../usr/include/ -Iinclude -Ilib -Iincl=
ude/x86_64 -I ../rseq -I..  -isystem /usr/src/perf_selftests-x86_64-rhel-8.=
3-kselftests-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/usr/include   -c lib/=
memstress.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853=
c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/memstress.o
In file included from lib/memstress.c:8:
/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f84b23853c43a55b5d7dbf03=
195ed0cdcddd5ddf/tools/testing/selftests/../../../tools/include/linux/bitma=
p.h:5:10: fatal error: linux/align.h: No such file or directory
    5 | #include <linux/align.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:263: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm/lib/m=
emstress.o] Error 1
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests=
-f84b23853c43a55b5d7dbf03195ed0cdcddd5ddf/tools/testing/selftests/kvm'



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231026/202310261116.c6bf98ab-oliv=
er.sang@intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


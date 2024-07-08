Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5C3FB1B
	for <oe-lkp@lists.linux.dev>; Mon,  8 Jul 2024 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427324; cv=fail; b=KPuFv/7I+VRDoZ2bFPrmw5o2xga7Cq1xb8J4JmhAkdYLGkh+nObfMNVk1kTHUVCNTIktsd+VyYTqBLoMRkFIEfGkvP90f2+X63dBQlr9ZyPqo+4wk1yVLNSFAcI34sSe99LKlFGb3soB4EtdFgHdTNacKITwwnNtOCY58Qp4884=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427324; c=relaxed/simple;
	bh=BSZ8SFBf4SmB4UHNRIjmvGZmSmRRborJ5rGid1zKAU0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=prgcuo/WVflkzWgdwKRGRZHfFxyfi4KLZ1EftErEimNlmynnSl3KBgaMV1WUHjFpy+db0q61gUNFLYK8rkFrKATUDYfn5wZ3+5/yucoF2CFdlXWFUHUFeb73jw7LgjppcvC6MhIOY8X1cNBjGuAPZr3pX9/0YF7ikZm9vil0S6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdXbs0B4; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdXbs0B4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720427322; x=1751963322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BSZ8SFBf4SmB4UHNRIjmvGZmSmRRborJ5rGid1zKAU0=;
  b=hdXbs0B43BbzalHdcB6G+zz6JkWZwblG9LYJpiu7oeWmsyE3A14xmB8N
   GnuDG/JJBtLsQdiZMGGSrUkIDcs1aAAc5yFpB8+ze0Ys7eZ16PHLiDhG/
   FguIS4Hh+d9tDbs4ImhfM9DM1ins7oCMgi/zGUPp76qGCKhqxzMYZHfGI
   VGKD6RvsIbHVJxkHLjRWipgFYhEsmB6+aPUeCaYYWFCDphWjNdK9tWqWX
   y6n1euYED+ut6Kkkw7l1TxfpLUr2chDJXXdaIcSjDkyXNurev5jymsyZF
   1oT/jOOLoe4N8BpQvVYiQ0qsOWVAklhSyWIFGSV1FKUr6TdTr2e2IgUhQ
   Q==;
X-CSE-ConnectionGUID: ctYB7V7uQsKutAYo43AcIw==
X-CSE-MsgGUID: wf9S/CvPRt+C3hJceZDN9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28770304"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="28770304"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 01:28:42 -0700
X-CSE-ConnectionGUID: pTxiHurtQtCXPcungTVFVQ==
X-CSE-MsgGUID: qCIjeZuFT/uWAAnrd/m6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="78179258"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jul 2024 01:28:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 01:28:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 01:28:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 01:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKr66BXFoPMB+eELzMcXnpymV+Ab1RIRzWzEXhVNOWgz+liHbJe6+Qen0xs6SGyeLz9X78iuKaGqSk3wa21gPNQ3rHeb4sN58NkmA/UFCL1DlJ6wfoAp4bWXZrM41eFbVByVvPzJ/1NhPkoVhc2vGRKDzqqXVy9H6/h1N9jkC4TFCdEQJd8CO07y2qpM0XpnOvlwxy5JyepIXcQoZOzgfcFzOQGZ42ZgELrmqay32xVCaD/uWShEw5sDq7BMYpYStuHFNyAl51jjJfrSUiLflE/3nAtuiU9uX4lXhr7QnWoWZIWDvV7SzITmsyILQGy+t7M8HPV014FAbkiHcwDJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbPUG0hKT672PyYMttn/9FnMU7Y7Ceu+fsTZIVFZo6o=;
 b=Tle/pldWouBNHUIf9dyfhf5IcANxnbVqFLhPp6S1m9V1Fu0vnODzs2t1SFfV0afsJydbjLmPz7FiPacKtfgrWLz1FJPravtmU0U3+G4wZFC9RjqHgkyPLVInYFz2UUn8MNOwgIWaLd9MvUecEhq8JKIjhSEBeU6nKtQxQO5MTnltTS7tkGB96BSuTOa1EdCOMo+3dvdYIssTV1NvK6QF+IflIVxFPNC/HEMi3B3zbfT1EUaIoZlZnrtvZCqCGqUohdjZuTRdhRA60sBQxU71vN5XtczI0P1wq0QWOi1RRHGj122t6q9tkW3J/wDqQhPZlhCM7H1OwykawdY3UQ7Wcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 08:28:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 08:28:38 +0000
Date: Mon, 8 Jul 2024 16:28:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:dma-split-v1] [nvme]  47eb0510b0:
 ocfs2test.fill_verify_holes_2048_4096_nosparse,nounwritten,noinline-data_data=ordered_100000000_0_0.fail
Message-ID: <202407081643.2f8756a9-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d2d216-f6ad-47cb-5628-08dc9f27f72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1vOYT9tL58cfsD7x79sG6IDAx4nNRrT2V3+WIvawnLsnkWFS8ctCuCDgGfdX?=
 =?us-ascii?Q?49N6T7WQ1pnvv2ChmcqJ7Ci9RhuWptUc+PztTG7tFvI8rh5mS+COrYaZ/7zN?=
 =?us-ascii?Q?l5Gumv6O4cTWW0+YsfgcZ7HyjvhgBVH+2iio2bf4am3gs8VX4XX2nWYiLSpr?=
 =?us-ascii?Q?+INR166VSmfzCOOxsd+DIYj21+slrtYNdGGvrmpRPh0rupCrtNsX2lZGXs6E?=
 =?us-ascii?Q?6CcLRROj+D5ipNJPx3pJpEsCxOZUDjaA8tzTEK4N8HvPnl0kcF5l1CoOpdLg?=
 =?us-ascii?Q?5hi2KrVn40WNY7aJLxDwfSDlcuhFxwZnZjq8XzYLAmFV1XshJXnCaEjMsNJS?=
 =?us-ascii?Q?EslZaraChQfPpksFrtkhqwcuwC6DbcdbBCJ3TIPHHj8LU3+VZSGECoJ8gAOo?=
 =?us-ascii?Q?htLlWTC+6T9jAaMlyFcDKHGcw8IWHwED/8b0ok/P2SM/pONbe53QUH1pcx9n?=
 =?us-ascii?Q?SFcQWueohAGb+hW/oDNbbQRncf4w1EWOz7YJZxeWVHoqR+jOoOQT7u82vJkz?=
 =?us-ascii?Q?SM584Uca7G/oTUgXtFqCc3oeohCkvuOk3vPcsDMOb0mDdE601GIH50StAnvi?=
 =?us-ascii?Q?PRWyyppAQJxr2yArs/EW2DUiPQQXOTQsG0a53bi++gGq6n1bx2LquMBcxK3y?=
 =?us-ascii?Q?b3bnTRF42KS/q5QPuNoAlVihDtvB7KVJYVApGTTszPuEafWmw/9lJrsW7SC2?=
 =?us-ascii?Q?Ig4+O6ofYAPhVLzHMyKnMwpkfTxf//1syUQYQ1Oq/7AWswK3SWiH5GXGxEhX?=
 =?us-ascii?Q?q1I9QLo1vHErMNIqXjNUAERFF55f5f2V0cuYkMiqx7HunzSy1F+QBN2pxqHZ?=
 =?us-ascii?Q?rAhElpOcDwKRY+XqiPfNd5lskUFqaAdSlpWIhodrN7zFb+hsrtsAXhtE32Uq?=
 =?us-ascii?Q?XsU9YlLfwsWCxtSNwv3QMIV8zi7NkNGIekcDFBW7+alti7IMzvoAfHiejKXd?=
 =?us-ascii?Q?J+Q+tlT7CkgQHqqc/n5qxsIP2gt90Dajq277BTpc88TuFzDL2Fjbglpy+gnu?=
 =?us-ascii?Q?Zw4JuLQN4v/nyhvbsrqJdgup1wVcV2E0JHmsFcjrDbAs+YcbTSg9jyDjxqSE?=
 =?us-ascii?Q?6K/FloO/wkQPjwz+V/nvDUiSGHDiaEkPy9eptU7twuluaf5H+GrJcCO/8W2e?=
 =?us-ascii?Q?/EfkuUeDxJ9RQFch1unRsMOcQm+6BQSyYiRbO8WbA31blGg1we93VNaJzJUh?=
 =?us-ascii?Q?V6gh4Fdnfpkz6pvIJAFfiO2Rhyji2Ypys40qoUlQqtLntMLrtztsUIXuZfFT?=
 =?us-ascii?Q?ZZ1Vn6ZZynroNDCGXtUW1gBNYKiLjOdP+h2I8+u/7subo9pdCvxQ53+yOs48?=
 =?us-ascii?Q?fCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yz2tC+OIALJcXjaRkwUNvTBB2t4avUTCx3ojJ7PTZlnK4K3UnNR6pzuFtCEP?=
 =?us-ascii?Q?qJCSMwGsA1lW9qQCcDcK5Z0fCZgppJU0TiD6wBsAGnJCzSao4jNjFYkGrXJZ?=
 =?us-ascii?Q?QOBACdOEh1D0Sy+rPa9gC5H5mhN+csULMM2OP85mlGIw3K4X0R1DBxaw5nk+?=
 =?us-ascii?Q?Mj5s21VlSYXjN9Z98VfDmAmfdQqcYAFuzCjS2lYFMVbc/yCuG+iJSmRxoeOF?=
 =?us-ascii?Q?WCGDrerxGH8nvpU32PwKrdcpA5HbWWvvpFmiyizyDhAwwcNXFPPFXPiMRphT?=
 =?us-ascii?Q?5PT0PG7A8w6hWsRoysmuhxYUzfbWpAFV0MUPhG8hVmLqwz5UFfWy4D08UkQM?=
 =?us-ascii?Q?s7nvjx58EEhrxl5WyuCOMuCRCBX+wsXDsDYaTMPeKQL7AYg8CgKy32GTkSJJ?=
 =?us-ascii?Q?f59YIPWms19AplVsmT8HencQc/507Uy/Ky/jLaZOaBqqWyPCGWb38AYteIUK?=
 =?us-ascii?Q?LgUs6c3au8tLnB1pG0Jsw9GEhYBRMRjq5djS9l1OC+eICSwzks1UL+8cPylS?=
 =?us-ascii?Q?7zx48q6+BkI8MB1z3BNOc7gi76I9qyHdkf1If57mElMclW2snoczfAeibshG?=
 =?us-ascii?Q?Q+bWaQj5RIW/VAc4c3eteby6cpzs42L1ZLAhvEPmjufssHPa0Qn1d3rnA2E+?=
 =?us-ascii?Q?mqDhWVBmRW5ThiuQNtUiEFEVsyMJE8SF5aut3vEam1SkdjqFxkj+/lbcW8/H?=
 =?us-ascii?Q?SvedaM2Plkjs0xHqIOn/7aD+qfHiCleIkxi+E9waPKQ9rln/ACrPB2qqjC9x?=
 =?us-ascii?Q?rvVzopFW3fcvVpxFRgdpIhMlBTQyDZ/C2lG8zJ0N3DedjRkNJ5yCWYK0wigI?=
 =?us-ascii?Q?ac4c1kyJAF1ecAL2XWDQCk9UWCwUixCTzXQITywDhkkLb41SpIC2dl6k1NTM?=
 =?us-ascii?Q?dYjmt5ly0tIMc4DfRJO2kuhK7PnKE//myWLRmGMuud/nC7WkHEtuAUi3tEo5?=
 =?us-ascii?Q?je3yJko37wRPlubmvUbhTFtvjm4KrskPd403Kc8ysHsAmW9JDM36cqUkEZJk?=
 =?us-ascii?Q?Csy0ZJL5d03yir0zkujj/9IbWxsggLq3ra2uej3IvLc59E+/K8VoOY+Lxc5N?=
 =?us-ascii?Q?ftrS32M2GUZsVrRj5gXaHfl/qhdGKNFk7RrlxAssVMbuL/3Zw/0tO2e1zsQd?=
 =?us-ascii?Q?2NJjiPD9HfcjS+qSUOnVKtx964zRyRTz6cpkTqFVA+8O8UjwbSXRrXDEOvp8?=
 =?us-ascii?Q?MR0poLEMYTMigjShQVHuTJY+BnjiXjRLbs6NOfC4rpU0xVelWigpBgJFZeOI?=
 =?us-ascii?Q?0+IjfG+26dBKlzwM9levA/VQVRf4Y/5VoaLw1iwDt+wDsIcKH2m/f8EuMUvP?=
 =?us-ascii?Q?l9/6dkXK16Ber7ZaZ3umYAvsWt/5wzNS/oOVNxwZbotRdXBJF/pjKxnEzHS1?=
 =?us-ascii?Q?NRZNWtYl8aM7B9n1FrWOx4m00J5IJKMz2e/N7nAq03stnIXrbUldTu8qWFd6?=
 =?us-ascii?Q?pFRaQSQsLluw7SkfLG5TLCLFFS5Rz98w7X0n30i50DoyC/d2pXPjnHbAT+eh?=
 =?us-ascii?Q?Jlv7wzMZGakZvIOPmkvcWJof6vRM6zY4r7YoAkMLKcfInoQc9n1PwS50PL06?=
 =?us-ascii?Q?U1oThuEoij+z3EVwoOMPGkUhXebTqHatTdU6aUnsGtwlRo/4qggLBmEdAEvs?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d2d216-f6ad-47cb-5628-08dc9f27f72b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 08:28:38.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIl+ReO65X8Yjn/kxTurr+3hCPs5Auuqk12kik/1WVVwwMfXnenv/4/nWseQyFKb+oGWlniqGMjWrC2iBAjw4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ocfs2test.fill_verify_holes_2048_4096_nosparse,nounwritten,noinline-data_data=ordered_100000000_0_0.fail" on:

commit: 47eb0510b0a6aa52d9f5665d75fa7093dd6af53f ("nvme-pci: use new dma API")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git dma-split-v1

in testcase: ocfs2test
version: ocfs2test-x86_64-d802bf7-1_20210827
with following parameters:

	disk: 1SSD
	test: test-fillverifyholes



compiler: gcc-13
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


we also observed another case failed on this commit but pass on parent.

3649c1dc673ea0a4 47eb0510b0a6aa52d9f5665d75f
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     ocfs2test.fill_verify_holes_2048_4096_nosparse,nounwritten,noinline-data_data=ordered_100000000_0_0.fail
           :6          100%           6:6     ocfs2test.fill_verify_holes_2048_65536_sparse,unwritten,inline-data_data=writeback_2000000000_-M_-U.fail



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407081643.2f8756a9-oliver.sang@intel.com

linux-kernel/
Processing /lkp/benchmarks/ocfs2test/timing-0.0.1.tar.gz
Building wheels for collected packages: timing
  Running setup.py bdist_wheel for timing: started
  Running setup.py bdist_wheel for timing: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/46/f8/5a/63e3adfe4f4475f9bda916662054b9c4945d910b02d8ec5fce
Successfully built timing
Installing collected packages: timing
Successfully installed timing-0.0.1
Output log is /home/ocfs2test/ocfs2log/2024-07-07_03:57/single_run.log
2024-07-07 03:57:54 *** Start Single Node test ***
2024-07-07 03:57:54 run_fillverifyholes /home/ocfs2test/ocfs2log/2024-07-07_03:57 /dev/nvme0n1p1 /mnt/ocfs2
2024-07-07 03:57:54 fill_verify_holes 2048 4096 nosparse,nounwritten,noinline-data data=ordered 100000000 0 0
2024-07-07 03:58:09 FAILED (15 secs)
2024-07-07 03:58:09 fill_verify_holes 2048 65536 sparse,unwritten,inline-data data=writeback 2000000000 -M -U
2024-07-07 03:58:20 FAILED (11 secs)
2024-07-07 03:58:20 fill_verify_holes 4096 4096 sparse,unwritten,inline-data data=ordered 5000000000 0 0
2024-07-07 03:58:44 PASSED (24 secs)
2024-07-07 03:58:45 fill_verify_holes 4096 4096 sparse,unwritten,inline-data data=ordered 2000000000 -M 0
2024-07-07 03:59:13 PASSED (28 secs)
2024-07-07 03:59:14 fill_verify_holes 4096 4096 sparse,unwritten,inline-data data=ordered 5000000000 0 -U
2024-07-07 03:59:38 PASSED (24 secs)
2024-07-07 03:59:38 fill_verify_holes 4096 4096 sparse,unwritten,inline-data data=ordered 2000000000 -M -U
2024-07-07 04:00:06 PASSED (28 secs)
2024-07-07 04:00:06 fill_verify_holes 4096 8192 nosparse,nounwritten,noinline-data data=writeback 100000000 0 0
2024-07-07 04:00:29 PASSED (23 secs)
2024-07-07 04:00:29 fill_verify_holes 4096 131072 nosparse,nounwritten,noinline-data data=ordered 100000000 -M 0
2024-07-07 04:00:53 PASSED (24 secs)
2024-07-07 04:00:53 fill_verify_holes 4096 1048576 sparse,unwritten,inline-data data=writeback 2000000000 -M -U
2024-07-07 04:01:22 PASSED (29 secs)
2024-07-07 04:01:22 Total Runtime 208 seconds
2024-07-07 04:01:22 *** End Single Node test ***



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240708/202407081643.2f8756a9-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


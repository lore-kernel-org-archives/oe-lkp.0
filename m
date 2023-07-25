Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5015385
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690261433; x=1721797433;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4V7GalSez2h6j4ZNK4vW1oob2+C5z1N/FzPv+WtKdEU=;
  b=eZDpYexNoutq2tYZcWeC2hugK1ZnY4RFIW5IzJeoKFS8Qgcig7GbGHYp
   meuXhdZqnpSKi2R2V0cBfgqJKxFR3u/FOFN3niow5jMpcOCx1hyB5MA/L
   OoEhqIR3b4EP45BngfTOBYRFE8bwmo4daWaOCH7OqD0ktXL0N4qF35N1J
   bmLVFenvu243K+ExSK7etNEjq6z5YEFtEykeyNSM5uzL0Qjt2CEoP0ATQ
   A6+az+OjeJPfzskZtWxQqgY5YmVDcmLHgztTGiiZRh+jehDcln4oRc8Pc
   CEzWHtWpIn6vai8FPp0SLbG6Zy0gwJ2QtZqGbHhpRpVmrwNUjLXfZ/5rz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352517937"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="352517937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 22:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729199153"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="729199153"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 22:03:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:03:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:03:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 22:03:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 22:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bh3+h/WrIo018YO0RViIRhiMo9TI4DUh2DdPwnWv8Gdow51MVYYp0ZRmU3REnkVMfgBmbR9UvXqtSXAV6xHo4i8TOeS7UWhMBrqy4iyZ4hw3vrdwmal9C1wYJQMcuqFbzAsj8a7yOzJdonQtOY27OiA0x4UHhGsdoaGQBR9oqmBJzw1aEvLKnLQ6FGE0x5Wa4GcRR6Beg6DmuWCyBMiSLIJoE2HoHPMQYBGqPUk1Dktnz5BXblwT5TeL/FD+x8V1Wh+er2NcQvpCYMTFeXA9snaRmAkwkA7Q+eE0/FVrqbodqrXjOc9Aplp0OmmZvSfzYznKBVIVl/4vPHVu8OCAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4KRz2SUwptfqzZMOUmgh0s3hfO/71gLI7JnFQ8F+fc=;
 b=FquTuJeuAkbp+Cx41DygAaeF3plihM3VRwpmsPqoJSc99l60toEJsxN8BSefzs/0hFjP+ciyWHXZVDurADnDjptr6hB1Fk1/pnp+tzePFRqc1GcFGW48lWA9BHzMSsvS8925g7NZuEjMNw6w0DmeEdSrX1X0MkaF8H5i2rNGiBc+AW8RvBTuMzGTOZAG2CzY1qy3+Sj47E0rVxQzj0z/0KzEVxWVdqIlaz1qfDmHfi23W/bqOT7Boa3KpcRNA1yWCXTP2VTn9ikFVex4IteC1NIKpmnBFdp4Kv8gQYovzug1S+pE49mfwc+dPkp8WihslYMIXSh43ny0S8QXzS05Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Tue, 25 Jul
 2023 05:03:44 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 05:03:43 +0000
Date: Tue, 25 Jul 2023 13:03:30 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, <oliver.sang@intel.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
Message-ID: <ZL9XopcTAkRLawDZ@xsang-OptiPlex-9020>
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
 <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
 <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0183.apcprd06.prod.outlook.com (2603:1096:4:1::15)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4716c9-08b3-4c18-c4f7-08db8ccc8499
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlwyz8dF6dB3npJURa/nON+CqdTmKp5iJtP7PtNfAEcgCab6PyjCvew3tm1EL78YBRI4FBfEw8rSemTaenqKC4vz3fgU5Ef2Tm97V6OPCmVo2h0Tep+H3DBMHQ9CrCB3PmW2WHf57/DJ11qtHxh3ii/YrdOZeK75Gs7KJYVVK9NKhykJLfVO2zcSGtjTiqYN2yH7Ys03Z+nPmCUKyMcl+bLIhiACZpYcXjnKp41ANhtODcIdM5CRNhZR2TP/GKJX6rErf7lQEwX+R5Vn1nGKXW86e0YTVX7s4Luz0GV4nUCShmS/sCZmqWFzxLjL1Nzxj5FbRgT5DUjVZ54QxUKuGiU25iCDl9J0fDYBgh3/Dl0BrERBXY1PGOwHQ2jgP3vaOoTEx1/9GekaZcz6P/pCtu06ZtV4SSlQIMWzBvuiCGL9me06RHds0FQZ4qytrjbbGPmW01D8o8T+KtuwzUC+OiV+cDW1TdLXOe48GjffOpzBD3tccJ/TjoVgGX/IbzXh6fojheYW5P0BizvOCiGlz2R4wTg3Z5Y8jgxbT1Y+GGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(33716001)(41300700001)(6512007)(9686003)(478600001)(6666004)(316002)(66476007)(6486002)(4326008)(86362001)(66556008)(66946007)(6916009)(186003)(8936002)(38100700002)(83380400001)(82960400001)(44832011)(2906002)(966005)(6506007)(8676002)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xNDEGRz+lrd1qFFxynWLnX9KM3aApHp1vVpkHzYxFh/d3BZumHF6AXqutnEt?=
 =?us-ascii?Q?yh/vtEnqgsVa8MMuEnYRqLqCutCBnfuSgTKrw1qy+8gpezb4wlogclholKN/?=
 =?us-ascii?Q?tj5siXkb/PVze4zCBQhqypxI89OqxxioURbznbi1znVN9pR7ROZJVD4y+YqG?=
 =?us-ascii?Q?mRJDqiHqLOBARymlqYC3dk58FSWpujlteHSjYEISw5BUjKf1A41phbH8OrWb?=
 =?us-ascii?Q?m4ywUQy2k8AN6zU280YQVOzZbvVEAWgi6o+WwOijBVuJJWds4DoF7nkCaFhz?=
 =?us-ascii?Q?vrOLw70QY97A9W8a5VIg6mFsPFwuYvl+FazCd0qhinRKe+cfrQPSbQHQyp0T?=
 =?us-ascii?Q?c1AeBG+39S7LFwzpDUb0jUYKUeIm+D/x9Qtd9r8z07jdCWKeDk19MYnsUfKe?=
 =?us-ascii?Q?Rdcydd7CvSvANr37ASNZf6dHEvpo6O5581I/5CZn9ZfJQQ9T0L287Wiv/dXZ?=
 =?us-ascii?Q?2ibfLRNMVidVrqR/fX1JjyhJz3MaUfMKJyjU8GDbd2eBr0Qrov9fgt/RFNGC?=
 =?us-ascii?Q?LajhcFyTzkNorcRSMTF+80U1AW5GEb7brlqpKApUYFXXok/I/WSa55xxMfMd?=
 =?us-ascii?Q?SZYPgmfimAK/4wC8m0qs2b0tyKOVfUVEA7NQBj4vMkIfoRSIKoYqCvET8UmF?=
 =?us-ascii?Q?XK1gPnDGV4RVX41w0bVhXfZxrCPYN9GzABXHc8F/IXg6yOU4/f6KKuNOxfn2?=
 =?us-ascii?Q?OkLahyYpMyxXbchebznH5qyKjC7DPBQP6OgKQ0TpjEJgoC6EFJOdSGjF4dzY?=
 =?us-ascii?Q?L3O+7+QpMungVoLv/UQwDjdQKvFRHCGm1/JI+T/xTstUUKUOhQ1LlOIhN9SE?=
 =?us-ascii?Q?EWum+GPUiOtgVDfSII5R6fBJR6paRkalPVRMLgExPShjTORnNzCA7M4ZxL19?=
 =?us-ascii?Q?l9an9ZV26T5cromD8E98TF0LEFkj1bHS5+kT9neK7zgK9D6iFzPYNbiPmzDz?=
 =?us-ascii?Q?MCqIJXDVPQXOHupxQD3muPHm4k+PDJqoRC21LsayGHKK6pbEuT9Rr/hWRHGl?=
 =?us-ascii?Q?bN/BJa30KjtahiD1Ykjz/qxPZW4EZI2deVv+L1mcLsRifinhhPRy5MagEaI/?=
 =?us-ascii?Q?2sHBVDO8+xLdoutkxMG4C5D3kHrDMrmhLZ/aXHQV5nv/F/rbAs2tcs2QFhTy?=
 =?us-ascii?Q?sN/pCnqz2AOaXp7wVbPc0uWWN/67kR0YtgajkDMirZ1s2CmokL/ePIcMKHEY?=
 =?us-ascii?Q?gWcOOaQmINmb0ozc5Ux4W1IRivq8+E2ikLpnZI18Al2hJvFzV+9zXG6kWFwz?=
 =?us-ascii?Q?d7+ygB5YvmvfK3b0liIBsBo/v5nM6N984JixDyusucW3mKmSrmqLZeTRls1u?=
 =?us-ascii?Q?e+lqyJy/bAmiEtrnQls5vHvQ8TcYGKeF/Mas3VHxIAy0yVpguiYG7Xj3jyCt?=
 =?us-ascii?Q?y+xpMuHOkI+YxdGX+m/U2m0WsRfI+PKlm2CG1yDGcTaOY86VHFlWUZjUZiQL?=
 =?us-ascii?Q?rv17gR00XSSoH7+eJ6AbcK4HFrgSFZbbNX3XyAp/IUIwOC1loMjg2FYWfFR4?=
 =?us-ascii?Q?vOG1vUcnHmgO91ATVbRc21Sv4WaKs+GZGQPurtGqBU9C5oee+kdtAo0yzgNJ?=
 =?us-ascii?Q?vHfT7oyZr0IYKGKcndnKzX3olcrc3NVKroOejsBJ9l8kYbtW0fWb9oEcLKwx?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4716c9-08b3-4c18-c4f7-08db8ccc8499
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 05:03:43.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ns6yUCDIhKcW4VhZ2DCZMrH+TuTPvGgJ/I1SCSHg1Keyfgc+1AZtnHTSI2ofpUpOmQEhxr/MrJCpwKN5bEvEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
X-OriginatorOrg: intel.com

hi, Ard Biesheuvel,

let me firstly answer your question last time.

On Mon, Jul 24, 2023 at 03:04:00PM +0200, Ard Biesheuvel wrote:
> On Sun, 23 Jul 2023 at 16:29, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > (cc Kirill)
> >
> > On Sat, 22 Jul 2023 at 16:20, kernel test robot <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a kexec issue with this commit:
> > >
> > > commit: 4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a ("x86/decompressor: Avoid the need for a stack in the 32-bit trampoline")
> > > git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup-v6
> > >
> > > test machine: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ick Lake)
> > >
> > > if the kexec target kernel is with this commit, the kexec will fail.
> > > but if the target kernel is with the parent of this commit, the kexec has no
> > > problem.
> > >
> > > if you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > >
> > > below are some logs we catpured from machine serial:
> > >
> > > >>>> while in v6.5-rc1 kernel, we wget kernel image for 4cd5b5012c
> > >
> > > [  583.891936][ T1491] /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-00010-g4cd5b5012cce -N -P /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a
> > > ...
> > > [  586.421781][ T1491] /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/modules.cgz -N -P /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a
> > > [  586.421793][ T1491]
> > > [  590.795340][ T1493] 592936 blocks
> > > [  590.795353][ T1493]
> > > [  590.985102][ T1491] /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/osimage/ucode/intel-ucode-20230406.cgz -N -P /opt/rootfs/tmp/osimage/ucode
> > > [  590.985117][ T1491]
> > > [  591.072220][ T1491] /opt/rootfs/tmp/osimage/ucode/intel-ucode-20230406.cgz isn't modified
> > > [  591.072234][ T1491]
> > > [  591.893130][ T1491] LKP: kexec loading... acpi_rsdp: 0x69ffd014
> > >
> > > >>>> then kexec
> > >
> > > [  591.893144][ T1491]
> > > [  591.907051][ T1491] kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-00010-g4cd5b5012cce --initrd=/opt/rootfs/tmp/initrd-concatenated
> > > [  591.907063][ T1491]
> >
> > This is the kexec load right?

right

> >
> > > [  594.660319][ T1491] --append=ip=::::lkp-icl-2sp5::dhcp root=/dev/ram0 RESULT_ROOT=/result/boot/1/lkp-icl-2sp5/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/0 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-00010-g4cd5b5012cce branch=ardb/x86-efistub-cleanup-v6 job=/lkp/jobs/scheduled/lkp-icl-2sp5/boot-1-debian-11.1-x86_64-20220510.cgz-4cd5b5012cce-20230714-61744-1x1amw7-0.yaml user=lkp ARCH=x86_64 kconfig=x86_64-rhel-8.3 commit=4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a nmi_watchdog=0 acpi_rsdp=0x69ffd014 max_uptime=600 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignor
> > > [  594.660335][ T1491]
> > > LKP: rebooting by exec
> >
> > And the kexec exec is issued here?

yes

> >
> > That command line seems to be truncated. Could you try doing the kexec
> > with earlyprintk just like the original kernel? That way, we may get
> > some more context on what is going on.

yes, here actually just a echo <command>, since echo has length limitation,
we cannot see the full command line. but actually we enabled earlyprink.

like in both config I attached in original mail, we enabled:
CONFIG_EARLY_PRINTK_USB=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y

then add below in commandline:
earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal

could you kindly educate us if above is not sufficient?

> >
> >
> > > [  596.812805][ T8290] intel_rapl_msr intel_rapl_msr.0: shutdown
> > > [  596.832306][ T8290] platform coretemp.1: shutdown
> > > [  596.840097][ T8290] platform coretemp.0: shutdown
> > > [  596.847790][ T8290] sd 3:0:0:0: shutdown
> > > [  596.854858][ T8290] sd 3:0:0:0: [sdb] Synchronizing SCSI cache
> > > [  596.864259][ T8290] sd 2:0:0:0: shutdown
> > > [  596.870699][ T8290] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> > > [  596.879227][ T8290] sd 1:0:0:0: shutdown
> > > [  596.886046][ T8290] sd 1:0:0:0: [sda] Synchronizing SCSI cache
> > > [  596.895425][ T8290] sd 0:0:0:0: shutdown
> > > [  596.902234][ T8290] sd 0:0:0:0: [sdd] Synchronizing SCSI cache
> >
> > <snip 400 lines of irrelevant output>
> >
> > > [  599.298932][ T8290] kexec_core: Starting new kernel
> > > 3h@^@3harly console in extract_kernel
> > >
> > > <<<< however, just nothing after this "Starting new kernel",
> > > and our test machine just auto-reboot as below >>>>
> > >
> > > input_data: 0x000000207f2192dd
> > > input_len: 0x0000000000c0e1e2
> > > output: 0x000000207d000000
> > > output_len: 0x0000000002dd9224
> > > kernel_total_size: 0x0000000002c30000
> > > needed_size: 0x0000000002e00000
> > > trampoline_32bit: 0x000000000009d000
> > >
> > >
> > > KASLR disabled: 'nokaslr' on cmdline.
> > >
> > >
> > > Decompressing Linux... Parsing ELF... No relocation needed... done.
> > > Booting the kernel (entry_offset: 0x0000000000000000).
> > >
> > >
> > >
> > > sorry, maybe above information is not sufficient, but we cannot capture
> > > further information from serial.
> >
> > As I suggested above, can you please try with earlyprintk for the kexec kernel?
> >
> > I have tried to reproduce this in QEMU, using both emulation and KVM,
> > and everything works fine for me. My host CPU does not have 5 level
> > paging, but i tried QEMU emulation with LA57 enabled.
> >
> > As for the change itself: the only difference that stands out at
> > something that might trigger this behavior is the removal of the DS/SS
> > segment register assignments. Kirill: any thoughts?
> >
> > One thing that would definitely help narrow this down (if the CPU in
> > question implements LA57 support) is to build both kernels with
> > CONFIG_X86_5LEVEL disabled, and to see if the behavior is different.

the cpu has LA57 support, we tried to rebuild kernel with CONFIG_X86_5LEVEL disabled
the only diff are:
@@ -318,7 +318,7 @@ CONFIG_HAVE_INTEL_TXT=y
 CONFIG_X86_64_SMP=y
 CONFIG_ARCH_SUPPORTS_UPROBES=y
 CONFIG_FIX_EARLYCON_MEM=y
-CONFIG_PGTABLE_LEVELS=5
+CONFIG_PGTABLE_LEVELS=4
 CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

 #
@@ -414,7 +414,7 @@ CONFIG_MICROCODE_INTEL=y
 CONFIG_MICROCODE_LATE_LOADING=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
-CONFIG_X86_5LEVEL=y
+# CONFIG_X86_5LEVEL is not set
 CONFIG_X86_DIRECT_GBPAGES=y
 # CONFIG_X86_CPA_STATISTICS is not set
 CONFIG_NUMA=y

the issue still can be reproduced.

> >
> 
> I have prepared an alternative branch here
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v6a
> 
> that has the exact same changes, but split into more patches, so it
> should be easier to narrow down which change triggers the regression.
> 
> Could you please run the same test using this branch? Thanks.

ok, will test and bisect on this branch.

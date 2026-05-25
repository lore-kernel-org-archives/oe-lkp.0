Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DE1FDE31
	for <oe-lkp@lists.linux.dev>; Mon, 25 May 2026 04:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779683087; cv=fail; b=f4dPzT4LhmeEhCm8OIHPeyZarHH8HSZyA4/c/cyccWfDi/TbB0hSvNYmF62z+8kRfisFwgHvSJNzLpl+NEFWmhuSfGZxBZ9Jfrws5vi5cNiggL49YKLk/lrXX1B5SG9tPt5GuQdROs76ATdBusucCe0LzZi//VNCw/zT3t4skT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779683087; c=relaxed/simple;
	bh=Uj6BgDzlSRXmYRyRAU/HMq+pN6FToD6UaOulOjASF/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mBUGdQJV3eHObhzNdpzJVRHCXTnQP+HtpTNTHYKDkVen+/NIq6iPL2cy6h5kOUL52zheufcyc3q24wMddsTbQOm3INxENti/tgbInZRyw3nK0xJnNU0Gm3TMIxKw42HRLUfSdqG3j/obTm0EyhWAy2qGEettAcNSrCL98I6qEwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lFfnknMI; arc=fail smtp.client-ip=40.107.200.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lFfnknMI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ8+L3sNNkl+NvOjnpTIAck3QTk1jqRn27YABjvdAcZ8BobdjkXxvupnJigfj3w05cSPiIvgUvtgEbmt81vwn+6pFvO/ompKex+3q1VVR5g6ZLiPZmp6UEGFV2gnSUUriNVvwtslF/2JqHknr/OOmI6jkzzwCCRvZYy7bYD682kAHfaV8aByDg7fK1xxQ896Xwn7pc/cmCGeLtaQMGCDyCeMetIE48srodV4pCc++8/EUrenpZeoacl5LYLDFxbU+LtYy3o3Mtn25JJ2d1OMFxC5+MOTAsSHKl71XpHMu9bRG0ibi8OzJ1oDlADsFR2xjINDigBYaz5gtjz99+Hnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5J6Chx+II3Tx7M4e2mPxyzuaSeGFA/SHw4dDWsou0s=;
 b=Qe1Wdjcn0ADbVy33cx7vBtu5uyls02O3+nvTYzUDGKIjLZcrrICgOmWwfhgkYdDruEBpcLPFyFoZY59t7j8BjX4yPFDAy5ZRU5RHj8WHRF44GIjg5klZiKrcTlA4H5Nh3W1nSSE5s2Fq2vc2vBw7P5aw4WOtSf1AZ68JYI5rpK+Wu9YFAhVUDYE5krjmSSb04/mg8Lnfh1MYfneLnyhLv4OdJPpBGgmslYd9kZhPtQHOLBAo5vx4LEIlm3BilLWHJT3D7PP2W5EMfvr+22MCglX6ioXPXBU7sWhANqySwgaSH3fC1SJl3SeN/kOk7TcuM8cbggOtrBD5pTOVyv4u+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5J6Chx+II3Tx7M4e2mPxyzuaSeGFA/SHw4dDWsou0s=;
 b=lFfnknMIV0VcnRNNKL7zCiNjRf8oFRNGvcyPyV2nbnxBy/U/UBskktpkHOETM0DtZHnuGx1noRQyn3S/t+1TNMNnwLjZRce5tV9myARkmSy3OZcY0iqEGx7t+Zgd2Mj9PEL5GVoN+N+EiAc6xpJjhpV4/Ohmmliqq91+6db24x4Rs9exb+s+WGE5VL0LPdaukJhNIffjGIpvkeWtAWq7FWxX/yn8pxbEcuQ4vt1+YvT66E3A7m4QAvM1IqzkGWydMYMCyZRLu+sK98tuTKi/Enb1O6kszkSEDuASNhly8a2Uh/DSsgOkBbNAK+yyjSeO6TagpDmAoDHU7xZGnsu9sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 04:24:42 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 04:24:42 +0000
Date: Mon, 25 May 2026 06:24:30 +0200
From: Andrea Righi <arighi@nvidia.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:sched/core] [sched/fair] c9d93a73ce:
 WARNING:suspicious_RCU_usage
Message-ID: <ahPO_v4_lYGagmcW@gpd4>
References: <202605232131.cfcd45a2-lkp@intel.com>
 <9e921b33-4029-4a75-82f2-ad2891e9d3d5@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e921b33-4029-4a75-82f2-ad2891e9d3d5@intel.com>
X-ClientProxiedBy: MI1PEPF000008C8.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::436) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: b2acf2a7-7198-4b7f-9309-08deba158ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rOvuGV6u85HppjT66cApzM9O2D0CTosXcAReRkkigjyGqG/MA4K2od9Abt7xK93k68wz1uD/dXfX9fkT2Z3hYBWQgg3BxQ1KY2uS664E0FypPmd+eH0OBMdh0N0c2qtqzeKOI/n4VmZjsZjVy9xh8Cqv4oNany+BXjB7pTFgZLysy7hPAkRvQTO1Fz1STecK4Tgv1j5zCsa8vQz4IlpQRNwNCu64h3AZFBX/LbA8JLJpAx/6eBdZhiM+bNP6ESG0LkaR9jIUi0pvBh/fS3eMuzc7TOanpVvFzU5KboCEcol4ge4nIsFpcuj10M9pqgTzl9Q6TZhJOu5x3fJ0PSQTTz+S070IEoxYOSoa6vozD856IjusW5yJ5yx2wYP4RfM6ehLQxf6hWYZtXoImjoA76L6F3LqymoIgtncRBzyb2sTdxv0n2OFRsv0j1Iek320S6o7B0vBYZZuHKsDvgFXJOSFF+gMhwxW1Y3LqazZ28xqLy2cy9lM67Bp52IjV4mm9VoCJnk+n5ECL2xyBR9WT94xM/XF89UX8G07oHfrtZgYjaxfIpHUIvDBF4PcE/nWAxSl/PvFs9QSVmPt6IoZH/VBBDIh+sE1D94njT9mMnNXrs+c+JHJdJwjU9cPJ4BeDyLRoAObF2NqK/ZTfGZ0x20G0lcpRmiyaKHJHOpeE+Tq3koDirKAZ1GUWdmZrgZmReoea/vGvD0FEHXnexar4Ug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZEzlRCNxpNKChHIolnZYejZ347usIx9INlAJ3kmoJeAfQQGSRYKGGltif6N?=
 =?us-ascii?Q?BKvzCDwIjomnbwHJiRt3LLqF5rB1o0u+1Sa5e9+CbdpxTM+B/J9H5Dfzkzcm?=
 =?us-ascii?Q?nw1C/LChiZGcWceVy/wRaelhEjE5qGMdqBk4Uwp4x80myCK5vDILAv6CokEc?=
 =?us-ascii?Q?Dsly1nB3A454HugeQAq1uSd9cyL0591L8AEtVqZ0Bk+Jjtjbq/sKvGmQzF7w?=
 =?us-ascii?Q?CPbRsQzJG0f7igUpc+iq6KPl53sa6CTU0WlsZmTCerPSzHYWr1dLVa4x4YUF?=
 =?us-ascii?Q?z0RmPZ/zotKtL/ZkFa4lGvORvXtp/MoqfvfV/9A7t3+FLykvjaOGd7ybvkDR?=
 =?us-ascii?Q?z3QeqU6YL4PQS5XcMbSorjsYah0NW/vLy8UUbgi0c1XtesVK9vdRYVA6Z4Oq?=
 =?us-ascii?Q?8Op5eHwljzLkLudwNF1QYZn1Ru6Fnqvyh5rev7apFUzbVmvB2x67SOCEVPba?=
 =?us-ascii?Q?UyWUSFMr8sAvYpvFbWD2vRogrSWgecV2BD3WbM+xcuyBlTbQC+K2x5zOgDmC?=
 =?us-ascii?Q?uIXMZ9bOpNgQQ8nwlQzaoPYpXkSyMuLplRhEWAsFgbg2dnFbQ4OyoWh7TpNi?=
 =?us-ascii?Q?KbDjPeybhJ+LPjCK4xBHt53aaiveRIqboWUbqIHXKgXnXLtgAngxq7biZ12v?=
 =?us-ascii?Q?nyOny244rddkSsMKJSG0H8M6zK9bDe+r48Vy3TL48IlDZxG/+XwWtn7afAVL?=
 =?us-ascii?Q?bTXapmUpQ18EWpkHiCP6Zw5Zvsa+9TdgX6jyarQV4AvTl2J7Lpba+E7VN9+2?=
 =?us-ascii?Q?q1ruMKphBM8CvDMcecVqLQukCWG+8OVVwMMM/TfwH5vWSlfRx3c129yYgM7Q?=
 =?us-ascii?Q?VMoLMCiM1/dq1npnY0cYk4S5v05+HCgcCSf9gSgab1M6jvlKM/4jtsRuLuhf?=
 =?us-ascii?Q?9yxb+40bTzPiBjnHfsv4ond9ALyZsPcxbvZjlvuwPmxZx5hMhhiXOk4UnI2T?=
 =?us-ascii?Q?4biI/oythRgGt2cz+6h/f2jWF2YAeQDb1cwDaM50dxxm5VycCIvr0HE9DRN8?=
 =?us-ascii?Q?pWA/Ell9/1lI9XAUOoeeZA34pgW+jTxy6xGjXuZcpgBvkG5Yfwx8SfLjz4eX?=
 =?us-ascii?Q?M3sk1gnB2DUC+dUzhzDH+OJrqGi6sS3s6JN9Etnz23pxz8NmimQkKuUUrg7K?=
 =?us-ascii?Q?YBcUVpBFm7dbVGu7CJsCPn220DljDLoioO4SNFqAgW+/e1klgkL6tsgvjZrE?=
 =?us-ascii?Q?g7feNE+pboJN2s1jNK/VXgmgVgviynOT9TjwKVwkEA6MCeYWrQGWx70g0mfn?=
 =?us-ascii?Q?38pryN42xrdO9wkosSD+ocn0QzEQSknl3iqgwqu/cYnLzLimnJgW83SZZRJQ?=
 =?us-ascii?Q?upV7wznPFUVqvjWIz3Cpvqvz+EQu3xQU6BCcYe/NBy/7cKEMlszKiHDTw2NE?=
 =?us-ascii?Q?nzqY9mXCZH+k1Dnc3NiT17Fo6pqM6hJJ3NzZ5BlFGOpe+/ehLVXOlhAf8mT/?=
 =?us-ascii?Q?LW8FmAQ5+/T9dFBAKRShnjb+6OtqCI72jQPJhu/9pRknWSSVxQTNXhy1kGTT?=
 =?us-ascii?Q?eYSiKJX0LdCpzeYKv3dGbwqJ7u6jnqSS6Ki95YrPCMh0Cb9d45Xift4lr9gi?=
 =?us-ascii?Q?f5Z3MbOhbZghigtirFjRlTO5kw7QLQe5EyNrW4wfSOCKFOayoS13tSGX8stm?=
 =?us-ascii?Q?H0dCDt/MrtgpJMIp6zYAUXKfHfXwios300gPJfavydsPJmiy18FeJ1nwEsv9?=
 =?us-ascii?Q?lbFwcC/vfGnTT5IHAPE1QDP+Ii1lrNat3p/1qH/msgMuzvd9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2acf2a7-7198-4b7f-9309-08deba158ab3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 04:24:41.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70soiAKyUHbjIepYVqfX0eEMZBfSVRSDK0ryCoOb2DK2pyywGK2fM9zlH13GWP/AHU3Yl+hMPWzm0Twyhol3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159

Hello,

On Mon, May 25, 2026 at 09:53:22AM +0800, Chen, Yu C wrote:
> On 5/23/2026 9:27 PM, kernel test robot wrote:
> 
> > 
> > [  102.159951][   T23]
> > [  102.160730][   T23] =============================
> > [  102.162072][   T23] WARNING: suspicious RCU usage
> > [  102.163398][   T23] 7.1.0-rc2-00011-gc9d93a73ce87 #1 Not tainted
> > [  102.165064][   T23] -----------------------------
> > [  102.167687][   T23] kernel/sched/fair.c:12793 suspicious rcu_dereference_check() usage!
> > [  102.169994][   T23]

This should be fixed by
https://lore.kernel.org/all/20260522092523.2046095-1-arighi@nvidia.com/

Thanks,
-Andrea

> 
> sched_cpu_deactivate() does not hold RCU read lock, nor are
> preemption/IRQs/BH disabled,
> how about this:
>  static void set_cpu_sd_state_busy(int cpu)
>  {
>         struct sched_domain *sd;
> -       sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
> +       sd = rcu_dereference_all_check(per_cpu(sd_llc, cpu),
> +                                      lockdep_is_cpus_held());
> 
>         /*
>          * sd->nohz_idle only pairs with nr_busy_cpus on sd->shared; if this
> @@ -12815,7 +12817,8 @@ void nohz_balance_exit_idle(struct rq *rq)
>  static void set_cpu_sd_state_idle(int cpu)
>  {
>         struct sched_domain *sd;
> -       sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
> +       sd = rcu_dereference_all_check(per_cpu(sd_llc, cpu),
> +                                      lockdep_is_cpus_held());
> 
>         /* See set_cpu_sd_state_busy(): nohz_idle is only used with
> sd->shared. */
>         if (!sd || !sd->shared || sd->nohz_idle)

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795418205;
	b=DwYqU3Pl8cGzVZQx96/Mcj+KjAsjNKISWpni+6UGQX0ffRgLb8gYqIlor5APaLreB9u6
	 az4NuWkMDcBxVPpTOcYCZt2tVGpzPSHrXFG92783BLWywS9InkBp4z89NdaG4CwlY0443
	 FmYJqcjhsE/CiTS/QR2baTYTmC8L5jEVxPyQycYIPezB7wMiFzVphLHEazvnj8ySiIvZG
	 hl3oGmrqQ/o6mRLcJeamsC1hWRAUh16Z2fbKgI3JOu/xmvaVusP2hFmemNzkeWaszA+XH
	 SxY1gTEHxTZsQUZVbFtdJQEUl9drpJvAbxW9Kj91ezJwcxk7rFsPtP44gYW73GtZl3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418205;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WPOGAlIUtVxFKD/OOtbWbLnwwOGQKR/YelVcqB1Z4w0=;
	b=RmYFSRA1a3eqWMMtIrKtcizR8HBOR/VbhormIWXu9uWN9vIGEQpaD22jjbZrRT7aMiJF
	 XnuBr2/PIFIF77E3lsi+ezlhnGDPOilVJsHtHda2PnZqGFjdNT4EJhD/TLNjVgfCUKQFE
	 d/YYN0U84qY8Aeg17RH7Kj7P1Xzbvc3uN9/T3BnMiEniit13xYdKMFXJaDMXInCggHopD
	 6vuZYZecT5wuIYnDWfI5gnhYnesSrZsDPZ7Gy8MYrnhfcS6Qcbzs/Mi5DiTqikrDRT3Bo
	 YMhl1G7bCUtQDVh/i1x7OEja6PIuVXGNCUxEmJQ7cYNZWJxgIBag9bovITzQX5jzzig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m0M5hpvS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.48
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5878D606A31F
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 07:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5878D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m0M5hpvS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFwx0akN0ko7AlVPIiNt+o9f6Vr6N4WqvfhDIRGDAr1ko57GNIvsig7Hllc2ENTr+QJcDZfK+Bg55fII1oeymOL+YJSQzD1B69y4QpFjE9ybFSqvh7ZXBpR3BUsdAo6usoohOyYTGGweCiDT+C6rdmqD1fL1FLY5K823BDuBNAk9hQ+O/q6CiAY5wO34+JMdc3k7A+iJoO2UXZg4FpU/ZFv+btgNhnasZ+goNh8VBhNhfRYQ3WrVY+16ipKjCG0N3QtFSMMq/Vw6rRF1dm83TgeliWHP1jSA1u4W6gl1LxDrjw7q0NEl3kDBYxawJZg/biDjLCDa4lYZHQJyx4kB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPOGAlIUtVxFKD/OOtbWbLnwwOGQKR/YelVcqB1Z4w0=;
 b=NMnaUWTQCLXj0ZRPgCR3o1pTm7bbYQ+Lj0JckdUa5ynTBGbcSBOOahknTw3hN/MIb5hCUyD+PcGuhmqR3co/gFhap9HKGvHagE2cdoZ8GRE1pPHuHtf3difjquG95U8uNvyTvoiZ0LAdoVBwEYzvWcjxkLy7jrcR0ypEJUh1So5JTN2o+NgFYG6Kg213JHeGbSplbgMy7n9egsug11RCmxmu1tYNB90RCLh4aW9NsSlWmlcCJHTJ7T1xBMWN0adhpD9SnNGSkezXqWlvBOFXt2opmVrLVAShACIy6MWDzECmtYuJqqCMmFE3+Rb09ieeP66PfbvaAtPVPtwLGR1dNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPOGAlIUtVxFKD/OOtbWbLnwwOGQKR/YelVcqB1Z4w0=;
 b=m0M5hpvShl+aE4tAkTe8eCUJXc6bddLgN2wwCrge8iAz+KXz2hJT3isfLwO3Ydkei8T+yS6qmzytbQL//KN0tifZgeTILlHHZ9bjrL9jYfci0a/FROU+RNZzSndQEqRylsGVADaN73f12QkE5frxmDAymrPP/xX2WqlsHmG5b+g=
Received: from MW4PR03CA0161.namprd03.prod.outlook.com (2603:10b6:303:8d::16)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 23 Nov
 2026 07:16:40 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::3c) by MW4PR03CA0161.outlook.office365.com
 (2603:10b6:303:8d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 07:16:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 07:16:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 01:16:38 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 01:16:37 -0600
Received: from [10.136.45.121] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 01:16:35 -0600
Message-ID: <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
Date: Mon, 23 Nov 2026 12:46:29 +0530
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [sched/fair] 486c3d06b9:
 stress-ng.switch.ops_per_sec 33.3% regression
To: Chen Yu <yu.c.chen@intel.com>, kernel test robot <yi1.lai@intel.com>,
	Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, <aubrey.li@linux.intel.com>
References: <202611230853.e2e6401-lkp@intel.com> <awPjsi/FiElpwjM+@chenyu-dev>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <awPjsi/FiElpwjM+@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 1568c4af-4ab3-4c17-2885-08df4931b7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|13003099007|261026121527099003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	xbOX/m3+G1D+7iF58+pMJNp5iHhMq4nnUpcmVNVPXOE9k556rzZaKkV1QPczYIfeaeJjzSby50u1KdqcfiahuOUn/hArhozPYB04tfcu3RSm0pYhhf3448nxLZCaAxxAk8eEhhiie9Knq+xZW1gEB9gYmasVPu9GtIXF36QzSdOEbPjpIjHBrJcDo3teIpGnVqVxmQ8cHxCKsQIeqV+cUt2vOls8UsWMNtoiYaHCA/9ex+ciT4CqlszNGdiV+5Aox/8yEcaLAVufhbKJIkFDEboRnoiW3/5kzVG5D+ifafmP7wILAN/ON3Eup5KarrJFJ0w+Qf9bskmqNe+zsXbdNTCodpyJAVURTrE8gl1F0UxJ/33D2TXoQrJnVu8L4KJ2zJkofZ3xoFIel4dl0b1wxI67y+e86Yljg+vDN+21UDE579Aq68mGuRGZZZfNhn2n47A97QO/8DxEHw25EFYvbzWnclt71GUKhdUIxS/7wJUPAQYN623fXCniNk90SnaA32/bHNe87huh1rpfZA0TkAbCYmoQOw1R3xoxdf2VXylLrX5on3pAml3CWA35+Y2bbowSfZoJPS8C6E9kvMklNHlWFsMYcivvXPSiS4yJiQrfzGlnBSec20t6wbno80xnW33FSmwT/IEZMctCOVbM+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(13003099007)(261026121527099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7NOXuuzaE2J1TLP25nYO3auYaai1MrFLv2tJPYVr9qqGkQ0O4PRqTDXB64E0vI5I/aUHcooYXDy2Yu7F6nw86qAq5f5yqatDkTBcUyyW1u6vD8nyd4iSrjNs6Wu5oL6ujQ9VNRLrt2M9C6NIWPpM215GV1x0GwdHQgkzZRIC9ePZR35V24mC0bRe3yYbfBgUStgxpL/26ujjRUWBgvmxn63gMP5kgVhCZFA7SdQkWHitLyZ9E9RzPz6AjCeFa+HtQ/aZyEJGBypuzXV6eE1ZvOcJjS5cuSp5yi+1HryXUG+NXdlLPkEBwKnvd9ih29mh8tHOoAAKBlEA+WwDaKtVWXCfiGCtUDUopfDhGBEwqNcwHsTfGxa02Kzp4iMjeFdZOS9OlFxlfPzgiNfv2fq9I2aMG75evTraNHQUsTqdSVL28HjgUxg/3RGGB8jRzxr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:16:39.7773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1568c4af-4ab3-4c17-2885-08df4931b7ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839

Hello Chenyu,

On 11/23/2026 12:26 PM, Chen Yu wrote:
> I fed this to AI and asked it to reproduced it on a server, later AI told me:
> -	int h_nr_runnable = 0;
> +	int h_nr_runnable = 1;
> was missing in dequeue_hierarchy() from https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> when merging into 486c3d06b902
> 
> From 850d8788c72d6ae459034b85584cd5ea01df920e Mon Sep 17 00:00:00 2001
> From: Chen Yu <yu.c.chen@intel.com>
> Date: Mon, 23 Nov 2026 14:27:20 +0800
> Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
> 
> commit 486c3d06b902 ("sched/fair: Avoid transient double
> accounting for delayed tasks") changed the default of h_nr_runnable in
> dequeue_hierarchy() from 0 to 1 and only cleared it for an already
> delayed entity:
> 
> 	int h_nr_runnable = 1;
> 	...
> 	/* Already accounted via set_delayed(). */
> 	if (se->sched_delayed)
> 		h_nr_runnable = 0;
> 
> The adjust of h_nr_runnable to 1 was lost when merging into vanilla,
> h_nr_runnable is now 0 for every dequeue, which breaks logic consuming
> h_nr_runnable.
> 
> Bring back the adjustment for h_nr_runnable.
> 
> [1] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> 
> Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..8a55571b9719 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
>  {
>  	struct sched_entity *se = &p->se;
>  	bool task_throttled = flags & DEQUEUE_THROTTLE;
> -	int h_nr_runnable = 0;
> +	int h_nr_runnable = 1;

Sorry for not spotting that earlier on the tip! Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>

>  	int h_nr_idle = task_has_idle_policy(p);
>  	bool dequeue = true;
>  

-- 
Thanks and Regards,
Prateek


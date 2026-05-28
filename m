Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B480319847
	for <oe-lkp@lists.linux.dev>; Thu, 28 May 2026 05:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945888; cv=fail; b=YuSJkDnB3zyPhCqhb3nb48KN9CniBCnMnE1UwD8R9jFcVZZLJmQrld1ziAgmpUaqD1q4w4edrz5Xon7+afrfDs1TkiZozfFMFxqEgE6fRhg0xHWC0D12ue9m7cAXj8yPTPdrHNir08FJzotPOP1LfC1TqlJboV/QBcttpLFXMQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945888; c=relaxed/simple;
	bh=Gdu1PxNY4A1WtgcfLwyMVC7In3NUcVCSx3PeadpIWFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f402reTfmqinhI0UZ/FcvZzyyJ7S9ftgjD46x+aeTXD7495dMFVWXpa/KtIFnAJ5jchzldOAlrD74RBxiqLF4aETbwU/uS2VSPdmY8qmNjNUjhY8BwWMBeiuxH13JHTbHw3E5ZgrpgPZXq4EJnxHzHB/myTg+kWrEVjfT6k0Gl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gWFGINQJ; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gWFGINQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL5zo6tfil7SPztyWB54b+DI+mBcLRYOd1byXnWwfRv5q8+dh6dzTKY0fxAqPyyT1qHgMS4QarZSD+8zmDfHFuiPZXdkW/X4UuYmw43LJb9jRWohDOWyEOAXqyJbQU7ijIngW66j+2Hb9IRkDK2d7Irs5LEMpRK5QpNcBKSG3SeEdPGA86jyik0mFd9eykg+WrNHW2CW3OwnY3OgaeKt/expPtilBDZrXRbX8upEF/4+8Uiq9RkO4o+uAcMsYtSgfyZQr/F5GnOZGRocpKfl4sd4sj0WsKNr0NiDwjl3/1jq3++8ExWgwW4sh+Xi2qTQiaU11uMsg3IoyODHALwqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqpgNGDtdTDT6lC+yaGO6FKRqHPBnX75bVaFiL4WbZk=;
 b=zOb+gc1waDIT/kNiHDDLxC7nJ5Sn3BvJr96uDqxII7HCZZnGvwBrvJOJ3frULLjMUWYKR7B1zqaep2fL3wV1J1x6maPAHiZdi/Cf/rhLizLoxmezooX/I+FL3oVy1LbWD3GTIiIcfN/UpQsNtfXsS1wwaiDTnPZTYHqo8EbVHG0F3FKMZBRjIeDgjB1j40DdCjI+t8zXbTWmv8kgqz3rGNurB9ksz7PSorMb4o77Vq2IMXN8PI9xeG8C7Izdc6K/jKlnDTkdgXqAd6CVsT8BmugBLICPFEIlCjzUb0kdONvhThFFkiYI4Ebbs4KZ5Aw75Tr0ATCkMO3RSjDp7Y2nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqpgNGDtdTDT6lC+yaGO6FKRqHPBnX75bVaFiL4WbZk=;
 b=gWFGINQJ2EICdXQE5/BhZpKR0AbxU+Q6iva34G7kNWiwm+ygVMy7iaf+c5hDxkkxPb9wW9180IEIlLsxYHGGR0enDiP1dxclUjxBuQSblVHkectM6BCvbDaeb14FXNMwTIYzwDgbrOUeqKCvnmG8cmzIMMZQ+pdsxnttUisHaMo=
Received: from MN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:208:530::26)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 05:24:40 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::3f) by MN0PR02CA0005.outlook.office365.com
 (2603:10b6:208:530::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 05:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 05:24:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 00:24:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 00:24:37 -0500
Received: from [10.136.36.222] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 00:24:29 -0500
Message-ID: <b79c3933-495a-43d2-a68c-4e25386c9a5f@amd.com>
Date: Thu, 28 May 2026 10:54:23 +0530
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fork: Fix timer_slack_ns inheritance for RT tasks
To: kernel test robot <oliver.sang@intel.com>, Xiao Feng via B4 Relay
	<devnull+xiaofeng5.xiaomi.com@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <ltp@lists.linux.it>,
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Vlastimil
 Babka" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook
	<kees@kernel.org>, Felix Moessbauer <felix.moessbauer@siemens.com>, "Thomas
 Gleixner" <tglx@kernel.org>, <linux-mm@kvack.org>, Xiao Feng
	<xiaofeng5@xiaomi.com>
References: <202605281011.2ba77cc3-lkp@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <202605281011.2ba77cc3-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a28229-36d0-41af-573f-08debc796a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700016|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vbs/OC9iW+PLve30cxG+QYzlGxPeD7GqpN3RkCCbueDJ2TBfXYbcTXNVMNaCELWA26NE2UnppjH8ouELsQM3N7H63EYgvffJHkiAFW9TAX02Ha3OJHFZ3mo9aUVxW1k6US8fkV7Ju0t3tWx04/F7IM6XGxPj5ZLTRmDMH5afj1WMo+av2Xt9ftzOBvP2PWTvHs72fbaLG2To0aCbe6J97boJofWKXxBWTdd1x4c/uIIlnTH1ZDDCnHLrkcNuVCT/4WwtRcsibu3BfB6rJ+EFyPdNx0gAq4KVgbRF1JpcwEc5vuwK36H+10NYeZvBhlJTkfonPQorKiS8uNqWErwbFLWlH89/B+c1xPGx8nNGgSn0H52qCIXVy7C99d/uf4nnqAs6x9qLUCNICK0fy/P6ppnK5I4lBsFhynMgNjeZY+2VDNk5DZS9k/O5g6a6Z81WYJhdPZV2cEXDV7BSyI50yLzR44i+NPOYKEGVttI7jRepFXJMa09Cf+teNAYYxwburuFtoJ9fDZ6cY08r/acmTy8W1nZI5Q3OJWvyfwluJvoaynn7AwQk5G1Xs2JQFVmoHFA3TY4bJSelozFDYNPCc8F/FUYTqhf4N/CPHoPDo0/cppfBTMu2J+EhwjimcVaJKDN+sv1HOTFLKgYuNm+G5MOFKVMLl71t+pkmIh0zTwfPSewD31Ee1xoteqCLccH/qrgT21Uc57F5sKrYcqOWVkLqas9rE/tXtGbznV9yXNg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+ZqA4Qky1vOKhKwJX4a5R4FxO0xMAXSEejAzFgTHJAmVbmzSU4Z9Ri3o68Mey7k0uKU0rRiYwElJ3BGO76sPjsJyFDjB76dW2NZlBkgHmXyauGJaNPOUcfFLlp994ISrnoRicVynELyPSnhg8tmxzaeiEn8Ffez6uqOxsNpSzBgIp9tlAMc93RfsXpjfJCxYd4Gc+lxsr3ok6j97wsaBVZSzWIdts0qXI+ipHy3FR2FVwUIv3x42+lLG778U0WPrgLiSI41f1m6Tai3heB5Mmm9lpnisvXlOIKQ++iqJKGw9iofkg9lU75+t/ayQ7PbzGcvK2klq7Lhel9BaTnQPPNjIL68KYYy5rf2mgWvwF7oMwOC1RaZ83FC/hk/NsbbB25Kp/AJakb7jm5SalhiI/506sYJ5w36itzb8BMhdoVgM+Jfd0gDQTjZ+v5GvoN91
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 05:24:39.3613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a28229-36d0-41af-573f-08debc796a51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

Hello Oliver,

Thank you for the test!

On 5/28/2026 10:20 AM, kernel test robot wrote:
> Suite: syscalls-05
> ──────────────────
> 
> ...
> 
> [1;37mprctl02: [0m[1;32mpass[0m | [1;33mtainted[0m  (0.011s)
> [1;37mprctl08: [0m[1;31mfail[0m | [1;33mtainted[0m  (0.011s)   <---

I think we are failing here
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/prctl/prctl08.c#L86

for:

    {check_inherit_timerslack, 70000, 70000, "Child process"}

This checks if the default timerslack is set to the Parent's timerslack
at the time of fork and prctl(PR_SET_TIMERSLACK, 0) in the child process
expects the timer slack to go back that inherited value.

With this patch, instead of inheriting it, we are resetting it at 50us
at the time of fork. Since this is documented in man page, I believe the
test is correct and this will indeed be a behavior change.

-- 
Thanks and Regards,
Prateek


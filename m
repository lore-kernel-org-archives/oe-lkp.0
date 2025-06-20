Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F5288C19
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419242; cv=fail; b=pfg5bnmZfq348y2FPCJplCrVpZMmD6BIiy5qUuM3dFswNIhWZVmvLgH02IxdmMhsj/CdtmHAZp28t5jv9Te3hvtP/uHh5bBLplsq1rt4C90WasGu0JS2wywHXyfQv5dwiudKuhzC1OOoPve+w0PqV7C685Fb3I+qUJEQXFv8bsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419242; c=relaxed/simple;
	bh=JXpw88E7HJHDJ17uc7giLR8KlC3Aih1p/VP2nxwD96Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=THa/ljePYMANUaUJ1zKroRTmg83nRYtlQwAoKAGKaKCo3lFXAgHfp14pYtRvCcsDnMLOmiOIFd5X92v4yGMCmEed/6cXql253wv3YuQ75Ab753dx5UC88WRFbjvKEERmzkquxg1uUizPYE56jWYjO0SWhcB7LmJoO5tC9EZOaNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l929uinD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K02Yb/ml; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l929uinD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K02Yb/ml"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7fZ3A004688;
	Fri, 20 Jun 2025 11:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RexITozxlGgc9BYtwE
	mYlWEVbUfgFwOZbXk93QrZa+E=; b=l929uinDW+ESf492hCN6uVqcR4QPN0LilI
	D0yycNIFSM/+EUY3kgvkOETmX2mUkhHZxAXJLBFlRt39oDORXPJppo0OUL5niQl0
	auJz8miPem2FbK6H/7YMb9dUckpJ3DB0H4ORRxlNmJ22spiGLi//w1vtvw3zsoKu
	O3gQNmH2fnKhL5c3t3rhxD4V3vgiaSdHEZYn8hMPP+w7YgLXNhnAQNnPVW3K649n
	UfYlqMSEBAM0pgfAMzlZZOKHQCBAIJ4NCuP/ZfaLtDCbeoWKJ2mHD3o34jU3YDEc
	+SDdRgWfjdqjrUzvQeg/oNd1+vfiSw//Hc0KAF894HPc/iW67XAQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5bd6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 11:33:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KA4Irh018393;
	Fri, 20 Jun 2025 11:33:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcu5d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 11:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOTNymSathVeB+t6oVD/SRb0MUB8/rOBewrSuZAIh4Nb2so+F8p0xOqqPX5Qwn//y02Zkcrzbm3QM4E+d93mG+wsUij2aCXe1i/7wrNNvXJgecZ5Urz9jXcDw2a1xjXZ2Qf92FTlbKDqHYL6HqW46b1bmXPcRzXHFAtQOpMeZ73q8GXg1LEHR/6OLL5KRptWX+4KIGIzmI8icyhwFabfHjBWzQPQaNHMT0H6nUXJezcLiTlb6M4UQvUABLwvJxtC+yqn1/IYywor9od0BajLftcjXUCedyfW6OSwES1qdsPek4ulxUUF7E1G8H0yDiBt+o+BEYgGfX3Pg7zRpdFfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RexITozxlGgc9BYtwEmYlWEVbUfgFwOZbXk93QrZa+E=;
 b=CcwEQsM9daWm2EMHkGxaFbCZC6/tKvCRfiHg9avFQDtsaCZWRzsbjHoHwpUZNpv2RW0v3/X9sKGFXhwJdJS7F/IecQimtMYH0BgPyj4uXejYNsEkLTPbmNTFl2+7qIGWW1INuoY1OO96jSOmC/exjmFKwRIB6KKzYeK63UeAvMeTpS2kOziEL+hlm/7HrAlgwUkFey5HKihzxhKCe94M/Tu4vhqNxuHyxLaLeuzktOG+REkD5IHFwLBD/7dsJKlDtud3AeWc6J2z7jsvrTNMmz+IqHxCTRZSKRbUBvhLp9JmidvtVJxgFqViNVh+rU10hpJd2pel+DrUQtrHhbcCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RexITozxlGgc9BYtwEmYlWEVbUfgFwOZbXk93QrZa+E=;
 b=K02Yb/mlJKBwa+x0H+ApJFwOBYjjreH9M7kMuPs+tuHrNYFh9fAtm+JfCbfr4fsyjzfGNVig708f5iNuAAeSk53uvHWCK8mwB8weETiNOXTGdOQ244hfEvYa8LLPiMPsWfdvDhIxrtOfWz94PA6r9oPn9FH8oQyaMe+S1pjk2wg=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA1PR10MB6806.namprd10.prod.outlook.com (2603:10b6:208:42a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 11:33:36 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 11:33:36 +0000
Date: Fri, 20 Jun 2025 20:33:31 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, surenb@google.com, kent.overstreet@linux.dev,
        oliver.sang@intel.com, cachen@purestorage.com, linux-mm@kvack.org,
        oe-lkp@lists.linux.dev
Subject: Re: [PATCH] lib/alloc_tag: do not acquire nonexistent lock when mem
 profiling is disabled
Message-ID: <aFVHCxM6M0-zUdgo@hyeyoo>
References: <20250620004032.771289-1-harry.yoo@oracle.com>
 <625a80ab.3352.1978b4fddc8.Coremail.00107082@163.com>
 <aFU6lZxrB_3Wmywn@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFU6lZxrB_3Wmywn@hyeyoo>
X-ClientProxiedBy: SE2P216CA0111.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::11) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA1PR10MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: a63ad2af-7505-491f-32c4-08ddafee4ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5+GBnOoVSkl/elQDaIkYA3JK1XY0RQ1hFH5sc/klGckHc+eF3uUu1vwGCrud?=
 =?us-ascii?Q?pyZZxA9MOhd+2qhrgEFh/0cHlxAV/XWnbtjs3m314aDQ89MsoMV+PbTsaakF?=
 =?us-ascii?Q?/NlvnyESPVTbEq/MqI3hInCBXdXET1paRfEUyt4b46rc6B01ZUPvhLKD51xH?=
 =?us-ascii?Q?umQAyiWE0QEqLEaKA4lI3tJcJUsOVKlIMy6/XzZwSy1qu4LrmuTrdvxs++Pg?=
 =?us-ascii?Q?ec0Y924WB09vS33SMl1/6+zmo5zLoGdvStxbzzvsDkgLUN6p0PuIJVDqIW3g?=
 =?us-ascii?Q?uihs84KY1OoWkHxCFK3xbTJDZLd5iHCVpJQrrgzjkTXzrrLrwjk479XbiSUk?=
 =?us-ascii?Q?75vFkPb/s3SlvTPjJhszoAI9UiVg8bo36d31rb2ZizadfMLHRbHOHNe5xk4i?=
 =?us-ascii?Q?bF6L3w7E9mBjmD5OGwC5IncHZkJvybxa3JV3g07gDr0oiuw4BR7M6lHZJyI4?=
 =?us-ascii?Q?wkAvLkk1hL2h82wfVogzXyICdF0MWY63xrlFJxmXaYhRcM79J77zIoPc644j?=
 =?us-ascii?Q?ApciXQQONa6hK3+W24yyi0Vo7XNNVAcQsjkeb9Bk8a+NWfdcMC0d74BumWOL?=
 =?us-ascii?Q?IDj1DOCd4MWh2zQIUjJAanJkzGdQWllnnziUcmVdTDE9hKgD4QuaxipPLCZ9?=
 =?us-ascii?Q?lFktfyvXOeaUUSvqkiP6qw5vfW5mix6/g76NEqulVs6hdIvUqTkhHi4u8LmR?=
 =?us-ascii?Q?GkFnTALykBBDnO6k967TxT80C/N3EBufiPyTGpW30ef9qTGq4VI/qonYhGju?=
 =?us-ascii?Q?bqIhapWskn5n75xjm7cZcrHwSCuoIcIDfb3Ng2rU9nVgS58xcJ0AFKSLmgTx?=
 =?us-ascii?Q?7iK+n8ADRdpxioNQEwyYBqkFUVuSSeIQ3y6PE7XBz7gz3cHXB2gVDlxG9UCr?=
 =?us-ascii?Q?HmsV7LHhBisbwUUw+FoirufJPiMLeGUxS7KMJd77pjL+0uSDPXkqnChE6+5i?=
 =?us-ascii?Q?BWAqseW+Iqq0k8+A8auPOQGkrKy+ax0NcN1Nnz10H4WM7V3dZWO2ZZVBojpl?=
 =?us-ascii?Q?NiRb+Ge0KPZ7tFds4GC2YlPYAHNJt2PmGLz2FrYfkdunajn21xbntSR9Di60?=
 =?us-ascii?Q?1Kv/A4uUtZDuOWTutu+ZAUh/JhGoaUu4dM+i067D5fTpeA7mSYca/MOUOhPu?=
 =?us-ascii?Q?uroJo8zTytFMuXlZlY1JIMn87jcGlTzMtZIdMKZZMIUQzpaY3tWNuLD/rCYZ?=
 =?us-ascii?Q?4vobSchYDioeOxvkHAmXmJTQbY/Ln89qE+vOpP+mP0YVRP4vUiEMqPLP3OmO?=
 =?us-ascii?Q?sQYvgqzwxr0sIbekh1OUwVsIVN1RhWFlLY+Y0RkJLPdg93iwJaJAWiWlGNWt?=
 =?us-ascii?Q?Fe+eeY+XZKEitDbaCtIIXZvvGRw74eXkZDBUyY+A6K5rhIpooKu+vlYXpQKw?=
 =?us-ascii?Q?a9ZmZ/aaenkk36LWWyhkWk4LsyT3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3h+ONuPOrpBYX/xsCu9AX3ePyTQ322HbFlRKvB9lggrbW2bpobymB7daBcT4?=
 =?us-ascii?Q?S936fBqpJIsrM6Isldc33pYS5PfmlN4SjlFLI2KGrk6ecC9gPczGiEQJZRsf?=
 =?us-ascii?Q?oOcTKxAnwZ0q/FUCq0uB3px9SllHcRntJ/MZa2MtHEY1GyCWq7c7Oy2wWD+z?=
 =?us-ascii?Q?0/8kL3moU7al7q6Jf/+OSnMY1DAB/+CZjJb1xlLeMOIt6cQecwt8gs0UdjWD?=
 =?us-ascii?Q?KgF/OaXJ34LVWrciazxZwGUDeIjf+yYZD/4NWnj93hWGVXQCoj9lRSOhEwDh?=
 =?us-ascii?Q?TPkniSJf6W25j/Gvd3WHWWVYYU04I3PXZHTkWQs/Q8zf2hKPPvuGr5ZF/ECL?=
 =?us-ascii?Q?JoFKD/97EBALAMFC6Ma0DQliRDAnd2J/0kcrIaeF9eK4p64iKTLy0qp4N/W6?=
 =?us-ascii?Q?HscJ/oR2Izh3b9tnmFNmHf12f+rGEbbqY57Mak4SBAeb0yNcdBTSTX/VAz6i?=
 =?us-ascii?Q?1S0iJ0N4pIcZtBpCGEi+1D9k9vPpfcRQ7tEm4U8HcdAqw1W+RcqA6LSvv9X1?=
 =?us-ascii?Q?l7ZgcTnkPkLyNsA+9L705bHk4dxOTuLGkHGi6fcYLEjBY4UV4OCK1tWhwrck?=
 =?us-ascii?Q?jTu6v4+FaL19pMVBrns9B6PkkaAIHr3d5gNrR6gyLCRa7cIcMZFk7q3St1ZZ?=
 =?us-ascii?Q?6VTcAd98YoQv/H2jlG4T5MsVoxKdp5jPU4OsDEeYHkWkv2L34LP5u0+vIENo?=
 =?us-ascii?Q?nANEHsj18vXqSQpdc0nt5MMXqxG1WjzpibOvlGsQy/Ka9LCmjoQ8SNFqOx+P?=
 =?us-ascii?Q?4ZTTmxECE/U4L6EjuZGf+49B4FPBxiOvL8LE7MDEprrS4CD+D4slCqM1deBv?=
 =?us-ascii?Q?4GhTzZOBQYD3lbbVLfXAx60o1qa8h+SSa4VNgpgQ91FdYMaUg3k8oRRlEXYC?=
 =?us-ascii?Q?H6Y3PROtdZmNdGqrXgi/Ow7PmdqdgV1U35iORQFdLDP2R3k4EZhq0g3bKi2c?=
 =?us-ascii?Q?1H+wNKwnB5Q9IE6A5FGomDUDiOy9R1bIckT90Y9EqQE0e0EPMtndUtIwV7M5?=
 =?us-ascii?Q?lqeVysSborgPu4RJlU2o95Pi1rgjwHB9NAcpMmyymFy5lml75JF7eKipLrP3?=
 =?us-ascii?Q?14OaB4AfK22C/guqtTehg1HesSQ7puFuuRoRA+hdz53cA4Q2e3vfifLf1oUQ?=
 =?us-ascii?Q?hZs6IWvVCLf2j/MusTdynWUdQYvEkjujubrgElLT8AtpCxV6+MLQOJDf0Hx1?=
 =?us-ascii?Q?nzFfP51irheJp8n/chxz7NhIUyYCMhOXvNI5Ci7Ip/vOpp/KqjMf5ejtMKOf?=
 =?us-ascii?Q?vDfePjlyMJqAco6bjmGWCjtgfy84dKrUtxmlY1Ji+xq2b5Wyv0pr3VUwlnEE?=
 =?us-ascii?Q?jojQAeO8qNpPMCLybelBfFh5jXzwU3WJhhxFZJVZSAWMsf7XyM44MXVinWW9?=
 =?us-ascii?Q?l7d2WSJRU7iyO8j+EN+UW3d6x+osLMpHp2oLlTvrH+79yCSwEbZATH5eqsuc?=
 =?us-ascii?Q?enz1E67e4z/2cy7iYpsWxolt/t6BX4seNqNh7OXSYrw/ZRbrCNDgMBLRGK08?=
 =?us-ascii?Q?FId6HkDZ3yG1rm/9pbZdc6ilD5LYqDc4UObV0cBIrKdBFZVqu8qVG9DxGFJ1?=
 =?us-ascii?Q?ACgSYpJrFQEs0hVGFOtBjxDdDIUvwuN0+JbPB9j0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PdGVdzpcVU4wY87hMJDRLebbMP2yJomS1zNRP261yeK3wseJjjH/9KSWhPR1ELxmJO11pU+UxjlU42iEGKE1aVCeGwxC9v60DcpGqSr6xrs0fJmJWK4CiDA8u/tlyK4VRRNq9f/6QdCe8KKDUBiaBPCqUUlpp1yLy6iBSdD0oJzrGGQwKZFtmEMVe4YATfZBXG5bsjxRpwB9GF6DfLHfwDESnduNu3eG69t95UiWq2J5Nm/slAGQPqEu5Pbq4+cSf7AaPgYNCwFU3Z8YOvED7sXPi+L+pSeO8YXECDnz0+qAIRzPudT4lDySjjjNqxnS/TH84s/9RCBuE5gR4crVa/tK4rfyzHsMcpwDgyD1UN0rFWa/FDNoPa7uZBTnilNceVEXkGYqYgxt/vLqTvGGs432cHVu1SAspRzO+QTwWmVFAcSI/TxRk2Ml7sICDdYshnm3BZouM4SYgGxs/CavxU4vncgji9uAlbVAMaXalTjHXMpt8BmwX1s9Yt8kKvHqlsSTE9o5xzg8GDq0zY8W9W2AAbqgIqr2l2m8uMPdap5iRHrVFgNJDs7p0o4E33EcMBRckCUcguSHuxSyLgE3iqTtDmJ7Flow4xv7kHeEnmc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63ad2af-7505-491f-32c4-08ddafee4ba0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 11:33:36.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCIDZLmGwZ9xaib1RYbT77/byhqiYbci7FGgl6awR00ick6j/7mfWmYnDkhSzpl1W0XS0zVlUQbfJuG++9CVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6806
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA4NCBTYWx0ZWRfX7aU3iQPZnxMD +wRzSp05KbSDGkokYCb88wjJN40yQ7pNoICEzxlUALGrkE3s5DUGrMAtdJq0fc7V9bEQsC4s7tD utvGAwBJ0xzaQrTVQCdqkL7cGJIg831Eu5nihukEm9T3AmfnFfiRQyY6inVSUzutXZ+F7P0z58C
 /vikM4KFs9PVJlRxYh0052IBiBTlFH45T86iGJtnssjUxpDyXjKjwUy1+Sn468aPHTwsH2mDfvn row2YCJzj29drSmUxFA8mVeevjPq9dtEk59DjQB2COTQUmbitBt4iy0Q/YZSG2BkRG7Wu4AtvEv DAItqIOrP4MWLW/H3FpUqzNgJdYPPjoLnRzm45c88/Uj67jV1KTO9lIy/wf0+ts1stOw2+khjia
 kltjWNkrSif9fk7PYNc2twQjrZ35J4We1RaXsDrglOCnvJn4vYhHxlx6bdFXoLpYwILEcFz7
X-Proofpoint-GUID: wqhUN9iI3jBZjAHKv3MCbY2rSxjniE-Z
X-Proofpoint-ORIG-GUID: wqhUN9iI3jBZjAHKv3MCbY2rSxjniE-Z
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68554714 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=yPCof4ZbAAAA:8 a=vhBJT0zcg-bPOIZCk8UA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22

On Fri, Jun 20, 2025 at 07:40:21PM +0900, Harry Yoo wrote:
> On Fri, Jun 20, 2025 at 11:09:16AM +0800, David Wang wrote:
> > 
> > 
> > At 2025-06-20 08:40:32, "Harry Yoo" <harry.yoo@oracle.com> wrote:
> > >alloc_tag_top_users() attempts to acquire alloc_tag_ctype->mod_lock
> > >even when memory allocation profiling feature is disabled at runtime.
> > >If the feature is compiled in but not enabled at boot, alloc_tag_init()
> > >does not properly allocate and initialize the alloc_tag_cttype variable.
> > >
> > >This leads to a crash on memory allocation failure by attempting to
> > >acquire a semaphore that does not exist:
> > >
> > >  Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#3] SMP KASAN NOPTI
> > >  KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
> > >  CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G      D             6.16.0-rc2 #1 VOLUNTARY
> > >  Tainted: [D]=DIE
> > >  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > >  RIP: 0010:down_read_trylock+0xaa/0x3b0
> > >  Code: d0 7c 08 84 d2 0f 85 a0 02 00 00 8b 0d df 31 dd 04 85 c9 75 29 48 b8 00 00 00 00 00 fc ff df 48 8d 6b 68 48 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 88 02 00 00 48 3b 5b 68 0f 85 53 01 00 00 65 ff
> > >  RSP: 0000:ffff8881002ce9b8 EFLAGS: 00010016
> > >  RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 0000000000000000
> > >  RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> > >  RBP: 00000000000000d8 R08: 0000000000000001 R09: ffffed107dde49d1
> > >  R10: ffff8883eef24e8b R11: ffff8881002cec20 R12: 1ffff11020059d37
> > >  R13: 00000000003fff7b R14: ffff8881002cec20 R15: dffffc0000000000
> > >  FS:  00007f963f21d940(0000) GS:ffff888458ca6000(0000) knlGS:0000000000000000
> > >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >  CR2: 00007f963f5edf71 CR3: 000000010672c000 CR4: 0000000000350ef0
> > >  Call Trace:
> > >   <TASK>
> > >   codetag_trylock_module_list+0xd/0x20
> > >   alloc_tag_top_users+0x369/0x4b0
> > >   __show_mem+0x1cd/0x6e0
> > >   warn_alloc+0x2b1/0x390
> > >   __alloc_frozen_pages_noprof+0x12b9/0x21a0
> > >   alloc_pages_mpol+0x135/0x3e0
> > >   alloc_slab_page+0x82/0xe0
> > >   new_slab+0x212/0x240
> > >   ___slab_alloc+0x82a/0xe00
> > >   </TASK>
> > >
> > >As David Wang points out, this issue was introduced by commit
> > >780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init").
> > >Before the commit, alloc tagging subsystem unconditionally allocates
> > >the semaphore.
> > >
> > >After the commit, alloc_tag_top_users() must check whether it was
> > >actually initialized. Fix it by adding the appropriate check in
> > >alloc_tag_top_users().
> > >
> > >Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
> > 
> > I am not quite sure this can be closed, according to the config file
> > https://download.01.org/0day-ci/archive/20250618/202506181351.bba867dd-lkp@intel.com/config-6.15.0-rc6-00142-g2d76e79315e4
> > 
> > CONFIG_MEM_ALLOC_PROFILING=y
> > CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y  <---
> > CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> > 
> > mem_profiling_support is true on boot, and alloc_tag_ctype is properly initialized.
> > 
> > Maybe there is other issue lurking somewhere....
> 
> Oops, I thought they are all the same issues.
> I should have been more thorough and checked the config.
> Thank you for pointing it out!
> 
> I think you're right. mem_profiling_support == true doesn't necessarily
> mean it's allocated and initialized, as you demonstrated it in the other
> email.
> 
> I think it'd be more robust to set mem_profiling_support to false,
> disable mem_alloc_profiling_key at boot and enable it later when
> it is properly allocated.

Actually, we need something a bit more sophiscated than that.
IIUC memory allocation is accounted even before alloc_tag_init(),
and the logic depends on mem_alloc_profiling_key being enabled.
If we change that, some allocations during early boot stage won't be
accounted.

I think we need to introduce a separate variable to indicate whether
alloc_tag_init() has completed its initialization and check that in
alloc_tag_top_users().

> > >Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com
> > 
> > This one should not be closed, because "# CONFIG_MEM_ALLOC_PROFILING is not set".
> > https://download.01.org/0day-ci/archive/20250507/202505071555.e757f1e0-lkp@intel.com/config-6.15.0-rc2-00491-g7fc85b92db96
> 
> I assumed it was mem profiling that caused the crash, since it happened
> while printing memory info. Pretty weird coincidence...
> 
> I'll try to reproduce it and figure out why it crashed.
> 
> > >Fixes: 780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init")
> > >Signed-off-by: Harry Yoo <harry.yoo@oracle.com>
> > >---
> > >
> > >I manually confirmed that the crash in the vmalloc test module no longer
> > >occurs with this patch when the memory profiling feature is compiled
> > >but not enabled at boot.
> > >
> > >No Cc: stable because the offending commit was introduced in v6.16-rc1.
> > >
> > > lib/alloc_tag.c | 4 +++-
> > > 1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > >index 66a4628185f7..20c627191d3e 100644
> > >--- a/lib/alloc_tag.c
> > >+++ b/lib/alloc_tag.c
> > >@@ -124,7 +124,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> > > 	struct codetag_bytes n;
> > > 	unsigned int i, nr = 0;
> > > 
> > >-	if (can_sleep)
> > >+	if (!mem_profiling_support)
> > >+		return 0;
> > >+	else if (can_sleep)
> > > 		codetag_lock_module_list(alloc_tag_cttype, true);
> > > 	else if (!codetag_trylock_module_list(alloc_tag_cttype))
> > > 		return 0;
> > >-- 
> > >2.43.0
> 
> -- 
> Cheers,
> Harry / Hyeonggon
> 

-- 
Cheers,
Harry / Hyeonggon

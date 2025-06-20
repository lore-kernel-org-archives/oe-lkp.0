Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48F21C17D
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423666; cv=fail; b=uOWhlj7a2Q0cWqSkF1xojBvj9TW8HSRCWhM1DovdMvZlsSRP+wb/9LtZ1SeBs5xdLzmw7iHQYeHW6lQEpkXBuKCdcdjotNFhD68cQ7jkmF5U6lz2vBiHaJ9E+30ym1jV40MTo4IZQ7kFPI0E7dx+k0hMrCt8v2p4fmX1kdHZbXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423666; c=relaxed/simple;
	bh=RLInMKtIILm8BSCwWh3CoUGz41bgIddA7P/0EXukcjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBIOVIVhjbLwIePrkKWFlBRRymuHChulL2+gdzFxG5JMJaK3oOfD1tTF+Oo1MeFZ6xMmhrSBaGco/WmI60/ef1GPYkgKyt5zekLFx1UAAbgO6vheQSTx+rU819+/BFCPFuKBOPRPshjLLBnYUlGfBzqXfLAyetGTwMzn0vhxuL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZUoAn1cw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OcGNBhTD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZUoAn1cw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OcGNBhTD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7fecK031216;
	Fri, 20 Jun 2025 12:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Xl1LpuHiGZbg1ExRlE
	Zi8ObcmHkCsUjY5DfpkmQsYE8=; b=ZUoAn1cwUdz5+/G1sZhxbBZiiCWq9ImU4O
	tyngj7DmG7k+l8nVbwTA3a5iHD9qqT/DwJyxivKSfnNs5ecDC3phP2ezVOcGfz7D
	x3kVmR0VlIjr9GofybLy5uprQyVYUlYrqm3zqT24ItU4t4oGwu6G72JmCJZGLz5m
	XH/5EwNees04sknS5OyQsN/3lDdAraDJqa4E2Yb9s4mLkqXnQOoIRY7G+SymOzQP
	gjsSPLw2pLDFatG4fzMqd3iJXLxzOTjpFENps7E77Lgm5v2iGtsiyPt1JSpVAz9g
	KpSrE4erWNhPiHAsNNsrcmquIW7yX509KKH7LZ4X+GcP2/XEUSEQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f3md4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 12:47:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KABX7p038945;
	Fri, 20 Jun 2025 12:47:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcvryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 12:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+WC5wZbrJkvPGdV7MXJucxpWRFjNT06/fm15N7ASBKRV1Rum8Hr1Gq8DGZ5GPS5jfkYHjJzNacaTcFHKHgL5wOp8fq7x1mUFwyb7Gj9GfS0x1xqUD2ujvYn8FSsCbtzfcGj1LCEHPKjqZMQEqpkAH6jVCBlNwuKP+SJxjVy9H15qPbaPGylqcSXA7RDRaYRhagMK8WBYb4l6SUdSDESj33ZUg1ueHKz9Um166Qftqas9HQIAwXJMxipi+dm7a5EPafeKQBPGwIjriAor8VjQUiiJFLkf789bg20mcDJ8B79r0Fp+ob1BANKBvOtKWymdAY7qjdMp5IglLNOZ8Jc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl1LpuHiGZbg1ExRlEZi8ObcmHkCsUjY5DfpkmQsYE8=;
 b=ex3P4/6te0AMT13jVcLcCYxCy0zbEgBkKya9hqD4xqyruf/QdOBCrMjB/6E6hZaQcePUylumwiQ/ztp1Sjb9guMMZ2Ph33UL6NpR+1FpMs1W4WtU0uWy55HqEVTojeGE4ng98L+HXfN6hA9aWNgnLjh0wqLU8lLZ6wiBLxMVWZAjFHlClSuRI4AJ3qdOpG7SYuq8+UtmGpBxNTi5M4UJKe3CJv3npcoJ9A8/o+3AZzlnYAPiqFhBCk02X74jdAvbRqZb5OaoKjH2aVw7e7kXqLHw2z4Vs2VCponYkclNEy76qgqAo1MHwgw5Mj2xGJJM0156MAhwOFbbhPAdYdYkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl1LpuHiGZbg1ExRlEZi8ObcmHkCsUjY5DfpkmQsYE8=;
 b=OcGNBhTDoE4WLg/UJALfWsLM08+bRlHRjK5jSoR2jnW1bof0RG9XwmH0+o2DavIkz0gsppVvVJRdE3W2Gw5xdNAIPaVC23PZ0PcsAmKlZkCciLnBP9g/AeXKc/5M5jLTBu5gsshK/PiS9SgDQ1s5p59TjeDGDvzvbVtlme6+Aco=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SA2PR10MB4619.namprd10.prod.outlook.com (2603:10b6:806:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 12:47:15 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 12:47:14 +0000
Date: Fri, 20 Jun 2025 21:47:08 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, surenb@google.com, kent.overstreet@linux.dev,
        oliver.sang@intel.com, cachen@purestorage.com, linux-mm@kvack.org,
        oe-lkp@lists.linux.dev
Subject: Re: [PATCH] lib/alloc_tag: do not acquire nonexistent lock when mem
 profiling is disabled
Message-ID: <aFVYTE5PK6R7U5kt@hyeyoo>
References: <20250620004032.771289-1-harry.yoo@oracle.com>
 <625a80ab.3352.1978b4fddc8.Coremail.00107082@163.com>
 <aFU6lZxrB_3Wmywn@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFU6lZxrB_3Wmywn@hyeyoo>
X-ClientProxiedBy: SE2P216CA0021.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SA2PR10MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a6f953-1c79-48ae-62e7-08ddaff894ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D8GQO2UKlNwF59/xF9Z0VhxO5L14lsWrNrSIQfsiwbBsc2fM+ar1JLBb4wcI?=
 =?us-ascii?Q?pPIVk71feeJjJVk5EkeyvpcdNxObwO4AnxoNpRVA7Ekor90sEkJg8uH0/q5O?=
 =?us-ascii?Q?t/1czvm8xF+CtMfMk7prca2MoAGIpzxBOZjxzMPax35qzMt0AxedQKCBwGuq?=
 =?us-ascii?Q?tCRqe5JUd1iLuYK2Tj/oEw3GCRf2kJEVaBygGpTkRmzi4zqZ08yy3J3jxY+0?=
 =?us-ascii?Q?TGzq+9SqU15gCPjl0yHjhqxmiRMluHZsPd1/y7b23ak+WdLOhgOSFHpMsdp+?=
 =?us-ascii?Q?6k2EYCSmu2uxVF0YleewKCswRWxC0T9F3QO9BAUDCE2uW60uh73B9qHBW9AR?=
 =?us-ascii?Q?OH8ie3nt9c9b1oh0x+oFncDK3f3adUdpatZWKeRnlMpVTISnry9p67GRdfw9?=
 =?us-ascii?Q?KxXMFuGKvwud3fZCODC37+zvXSX8HEkprLQ3Jw0NG6SR5dcPFh8A7kX7hC+A?=
 =?us-ascii?Q?7cyqKvw1nQw13BPIU4lIcmn7nQLGsKjU31NTEeyGKUrWg+kPBVpNLtLBhJht?=
 =?us-ascii?Q?7OUuz/RyHuDr8lTkrCAUrCQU7mF25dIF8CHViyuS/zJVnRcuku99kx0jLk2Q?=
 =?us-ascii?Q?e7oQQbuNYxSYf1iGlzodc1hnE5HTuLl2449q/sMoNhMyPdJLSoPqIMfnDfwX?=
 =?us-ascii?Q?Oo8izA/8ksLrdt5Op4XGVIipM0LXkzzgjMcX2KhRhRvGHPNJy+XXTqEWAShn?=
 =?us-ascii?Q?ejsRjGt/mCmEj0dKdk8fPm+6dqZy+BlMt3/sa6LmNo9i6E3zrbNm+6petFoM?=
 =?us-ascii?Q?laac+ni6TB/hGolx4ykrHhDNOy8a9Ez+ibNDKUV6AW4eVxDqsvD3mg65G2Re?=
 =?us-ascii?Q?Er74YOrpIUiQ61RzrwS01AN4qv9Wlm/RAf+6x6tKlfqhnUE7L7M60qNW38Cq?=
 =?us-ascii?Q?m/3yMORwM+Ohe8BAcr3Vrn36SrO9BONoV4WoDrunido1ioyrijFVHUqJIZdK?=
 =?us-ascii?Q?ttsa6Rw1Q5psSEPjqx1IL2rG2kuzqovlDTFnhdukBz2wf636EPC3T5TSHEv+?=
 =?us-ascii?Q?aE0B0lz+kmt6TMakcpVkAWYxdDgVEMErHd5dzsxh7F7ucDY7v8/T+6twysQp?=
 =?us-ascii?Q?hP2BLeCGNhLMm8G0QHMLeJ2Iu3qu8CGACQUeIP0u6FZRw12bNahBlTEs5O3G?=
 =?us-ascii?Q?jGazqui/arA0FMtb/nKJInq+6kFyssbBXtq1hfIhJGI+ET0KtwPwtm3pvwJJ?=
 =?us-ascii?Q?67OLroTEIH4HGQr9RAp0/CCq1jsAWOfDm+U7oOExa8WY1VePFsUI7GvA4+4F?=
 =?us-ascii?Q?LvNELYlk1hR21KkU37ISCa1tDlYxV32w79LRF5i0hlsj/mE32L+OUeu8cnXd?=
 =?us-ascii?Q?LOAAiswJXqpCZvI4xCvqbuWmMeWsZXsnhaC8ENmzs0inZoBn38O5dUWotK3O?=
 =?us-ascii?Q?Ud0qfyj+M36Qof2DypJruY2HvVlV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T2SQNH9/OTusl+5UQU0/YWg+/q/K0F/dQkmyQmjeyTrF+9NvGPAz9Wbx8ETx?=
 =?us-ascii?Q?+8qA1kB457tPCTOWCVqxstwf8P62GpGqU7ZHysbNs7qXlcxHxwHRhnqwUmPc?=
 =?us-ascii?Q?kN57doGDacCp4JmbmKqoEQz5dNFDM8nKgxnCstsL3/ZfAc7vGFV1MmDww2E9?=
 =?us-ascii?Q?OxlYlVA+MUbDBmy5Xl5ioPvQ/zpqVdLKxmH3WprXQTk5vJJsfkF1KOFpJ0Wi?=
 =?us-ascii?Q?XiKatAyDY83WsNDce0WeLPhOfs7sv7MdV0KGCMP8fAeLIE0udgcs7pnRWRac?=
 =?us-ascii?Q?rg6u1WVF+vyCDZFgi2cS2ZI4K5gk53rlSjOst329SYJAHepQoJAtxy327w0J?=
 =?us-ascii?Q?dsHgTrvHD3QoHUye/oVIwv1DMRHmIWL5K9eNk6hwYkiyqpVo0SQxP8aNqYZF?=
 =?us-ascii?Q?joIcrG/0uSNIChWq5TcDJIZdOcwMMWfMRPvyT0hYuJa0hPmP1HnX8i5vAaLY?=
 =?us-ascii?Q?P5cEJe8cDPbVP1OgB/G+dtK179NV9CjK03NxohDU4pIXcnyi4/d/YCktOMBG?=
 =?us-ascii?Q?Q4w81yzxLOTIjVKxxfYRFMkehDGD+WNRulBNZVrXZVkJcE3Z5/64oyEw/VIB?=
 =?us-ascii?Q?suaX9t8EyVqvWqIt+ecGdggOztyeg8LTKrcB0pJRspwIJ1DYhbLcL0WKTOwq?=
 =?us-ascii?Q?AXgetkfzUQECeJd5dm0lN78b3Afjw1lbxFHyxdeaAaqrLM21CBE1UkZCb7bt?=
 =?us-ascii?Q?DfwC1aXCfP+LR6WH14VlE0DvFlZvp9YbbIMcW5RFpTxYt3Z6QWmA0TcXzN05?=
 =?us-ascii?Q?mIGNT3VaclTgiIa4df+FniPlyaKkkC1mMWi8tWZfq28m5qdpBROvn1S2SdPL?=
 =?us-ascii?Q?/hMmqZHL9ox5B9sjMSy5Fr1EqK9uM54s87GZ4s582dv8k+ec1J+0EMw0vORy?=
 =?us-ascii?Q?V3iqUvUt+9D3r3R02V/1GVlXTbR/MTnkgxepOxcmidm22pWf6oop0s8hnLSi?=
 =?us-ascii?Q?xfSR+Y0roKDiOa7nQrGuxWirIl6E+UYQ6zajgyeWvR3KsckcIzDmdQG72y/3?=
 =?us-ascii?Q?R/UnnoqwaysS3q056LOW3jENGgMsx0rjs9LQc/JhcPwR6PjRpvvnQdisLxQm?=
 =?us-ascii?Q?DJK/Ymp2p4Z/0kc7Mkphcc1dF848F72QQ3PYlDrz3ZQ4TwS1MNXxhqlWOZnf?=
 =?us-ascii?Q?XaM+8z8dwOpb5bBKNTaAVciDV76y3JNNP9hluvL4tqgZcQixlfd5DyiBPR9U?=
 =?us-ascii?Q?SgiRyv+6zsGwRpRbNbeZrPCNlQ+wrsCk0oaXhKgMyA94gc7C/s78ayIsU3uS?=
 =?us-ascii?Q?+xHYOOSLU/Zs7VPnTdjfglDb7PiTBdoVSEA0h5GWcnCNqwoR8fRHXJFwm/Q8?=
 =?us-ascii?Q?ZcZuLjYDrQP8o2RsOmvSDjHqOT8SE4yOw4LHuq4xd5J4i+uPF6bzCPrYnOFD?=
 =?us-ascii?Q?pgc/F/ZlQDWKS1Gx/gyvKueJFnSrNfYi5qXjOTZvAetCuHIMSLwevMsx74bd?=
 =?us-ascii?Q?lve5mmbjuxU8m1PrnxsYpbrZp85AP6RzKYhzyC/gKCuXa5zUeGhb2RfvqfLH?=
 =?us-ascii?Q?3n4J/u7cHUAU+uLx+zws793mIXCMEfkqFb7zdHKsUIdnwHYypUaYcKiHFgwr?=
 =?us-ascii?Q?1Fa7uS33JQwfPlxi6OBzjTy6TiJnQj5HShaa7e5M?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r/moN1qWei1aqSQn5G+pNd27INVC0p9QZ6z2Ljf+HvsDMq4wUQOP+hbVjpL3QRe0eO1rHwoV088kVc5XSwYGwPPgs8GjnvtoRbpbtzdgTHRpJ81ey3irwkn0iEGvCD0Cdq7zUZR1FQFilBzM0G4tCeiOiCnEIo7Y3BvcwOr5y5B3AIOLndtkasxQikA+8B8FZvdYHqsTesgmpQzglc3HwF+vKI3VxrHJJwzUSqpiM8IfzfSjODjXxs7XC31R7O7o7S6736gyEbpvldOGHvks9Xt8u7PK/vgO2PmG9qgCMd1fB/Ce3lhpvxppp34Y5FHh1fJr9WCMT8qj/WTsbi0M+GG8z+xN+9h9Wj1AhYkvmwvYc3PSDGZpeUOzRhnGGqD/Kh35JCHCTFYkw6n4W6TZZY1zcwP27JIi/oIsobQrLFiZr5WfQgtBJD/QdgfVrV7VxcoBYLraU9ZmTJQhKZVeOUaGs0G0iZj7fS3L8vfAQLPz5ka1VEtzJPNbme+BazlarjGbqeJsxu7rdtVySytUD+uHLtHanW8GfmzfkpjmcMZ3nq8ytOGkyUFexln81PmpY3Y5rWmD5R2KnN5I+xJJPKg4hHZ2gCJe/OFhHVrGNlc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a6f953-1c79-48ae-62e7-08ddaff894ea
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 12:47:14.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwqMSPwfG+K+9mx8PVct17lEEhmDuZoCH88rS/13qgEjWtIGnOx2BC4AFsZzV3Oqrh8MZzEJJBCJC6XshcGJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4619
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA5MCBTYWx0ZWRfX4/k7GK/0EIEu DDNK+vKRcYzhs+zDl5fK2eIyOfsjLw6x3Jp4cxLQjX/ANcGl/LtwEdWyxHXASUZ2UeljZGQ2h8C DWpNK+4iyQ2Mr2cKjOIPjRKjRDLyn1xObcI+9xaEetVg3WrZxh84vvCOxgZlSzjMLSaA9i3x8HK
 4B5wVfakNb0uuIho+ZfOW0AoTyVbNd4oFTDTzVtaCQYWkmS6K/tZSdio794uzYv5tWqU30YFceJ c6TveKtbucI15AtYPLl23qyEIR7s5VKqRvFymBFCiWgw80VLLb1XsLw7D8kKbFjVdPGiOxvSkzb YSCEPN61T0UahQXRVC0B/UIhFB4cXidy15rI6NGokmcJeuQLYPD1oXlQhoa6AMHDNsrRkCWTmId
 +/FwWyBLN6ePxXDU8juHz2+TkKy7siHWyiohkCMn/CtrtfRtjQB2bW+dt74TSopHEIWTTTbU
X-Proofpoint-ORIG-GUID: nG9CzG9gpgzK7xFbKw_Y23AaH8gLjCJr
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68555857 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=yPCof4ZbAAAA:8 a=vhBJT0zcg-bPOIZCk8UA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:13206
X-Proofpoint-GUID: nG9CzG9gpgzK7xFbKw_Y23AaH8gLjCJr

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
>  
> > >Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com
> > 
> > This one should not be closed, because "# CONFIG_MEM_ALLOC_PROFILING is not set".
> > https://download.01.org/0day-ci/archive/20250507/202505071555.e757f1e0-lkp@intel.com/config-6.15.0-rc2-00491-g7fc85b92db96
> 
> I assumed it was mem profiling that caused the crash, since it happened
> while printing memory info. Pretty weird coincidence...
> 
> I'll try to reproduce it and figure out why it crashed.

I think this one is not a bug :)

I reproduced it with the config provided and it just takes ~900 seconds
to boot because the vmalloc test module does performance testing...
and I think the boot test just timed out.

-- 
Cheers,
Harry / Hyeonggon

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

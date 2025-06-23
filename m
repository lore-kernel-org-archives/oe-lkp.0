Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB9219E0
	for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 21:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750713579; cv=fail; b=hKClz5TSiEmiWYtgh0UysWiZgrZ8PcD/RAkUTtY5Q2imyOkONdz4dkRRdlPXIKsvttXJf5Sq0GlcXHlYUkh7htvG7su6DiZnu6C9o3QjrCmWF8lAftTWJNBv4vpXNm6OBQmOmGzpYk57MB7Jy94coU9NcO2QxIir2cPytEH9IyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750713579; c=relaxed/simple;
	bh=211v1ME1YAuNbmgYc1GnrpwyCJW52QI0pn7uktZ0MqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U5FBapDDTPMAZxBRTH+WMNdZzGi26KO4ssBANbnRMUZ6m0s2T/Gjn0JzwfxsT1IuoWTzRaAq0L+1Noas0sHy1b2yzyLPuU1NYmMkACA9692fU12JKtWFLO/Gu7ywMQnZ3wFVyVlF2QhBkTa1tJZy5YsG8npXRXFpeAPAYFfI0fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ItxHkZ2p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O8hygRzK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ItxHkZ2p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O8hygRzK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGXYwm017206;
	Mon, 23 Jun 2025 21:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ky40IM7YKXOQ7/Letf
	aYEdjtBhI0F9K51dPxAP4MXiA=; b=ItxHkZ2p1GEi6R6EDwU2PnwzpekFn+Vx9f
	/TC4EsPyfwEC1lX+74lftW8d7xwXBbZRkiSsLV0E1LJO5zFprOo1L/7wg1JF4EkH
	niPLOLk4Gcp3duTt6E6JkwQhjogPTRi5xhaxlqWaaVZRdf/26vW2UCyTmWMj9hBO
	vfsn1Mu0rNF6rkSVtMAmm2j3ppCirsPxhd3Y/tLq5OjUbLwIS6gGCCJQRhlsCZ0U
	bk+XZS+B5pPYPjH2aq/gYgfuFUj/PCv3oajnmAy2UtaFwtCelR0aaufNOXt7mRkl
	LqrXdwFuz6RIc56IQy3xaqsjNAtXqsG33FpH13La0SkRKvCWiXOw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7amxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 21:19:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NL0UCW038863;
	Mon, 23 Jun 2025 21:19:13 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr3uryh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 21:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekMdyqZDMqCdfocKmLaJTa5yFFOZ9AK7nnLBere4gwriK2X7y5szDLoD8lNnTdg0b2+nxeIp+8wFUVQmnS5cXaYbxcDXrcA40JrreyiAJBaZ9lj4RpkcW9zsM6uO68UyAq2Mrpv25XjiWhYvk/DJAeudmcT8wV0m6KlQRdrIZMsZ5G1b9Dco/oXX+hYBtmBrkffZ8rSMb26kZB5WtQ4w9TMulsBcSQ2H3W1i/c+C3hJj2oC2ZWaTeE72hmcMgIe2JJDzVJZWn8H9m9b5Zm/eXY2JzXOgL0qXij1WC47PXITIwRpRmhGknMrYtsYO0OsQIpJu7NwTgWQlbbBsPjRjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky40IM7YKXOQ7/LetfaYEdjtBhI0F9K51dPxAP4MXiA=;
 b=vl8H2hgPiI+FNPI5oDC/tYEZpaOlrbFzcL/mPlSabEVHEowrvwX41j5WzlXOiYdaZpM2Mn+Ji04/hujvTWNMgLIHnND/kFJpxPx8ZVhxZ4sGpWv5L9pHojcQRTsFzUy4muO0gfWAsxDfjjonGM2WgojrcD+QMTNhBgLpWsU18TbZOgAygKz7kcO4uiNe21jMKHRMXqhJipsBYCeiJWcUjNPJRm22DOPUx8WiWnLebjrGpIAV3D0swEMDepFHRz4RI4aZq8n38t2dUr9Cnz6VzkFv6RQMY7pPVmEmlCWCsl3tR8ZBcxVrApNBZbKSFL1KFpmXEketPw7gJn4M1FUdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky40IM7YKXOQ7/LetfaYEdjtBhI0F9K51dPxAP4MXiA=;
 b=O8hygRzKy4ckgtOBOimTAwsTr8LGUkSrpiUeAFQ7EtmYF9AwRUgQaYAHNLMXfccp6BGxbJCUM70zcstjBsIm/EEmXaGsk1kv+ilAd4J0NxTU4MsfIqlZYQzMdMcEmFxrS/8dnMEEZoUHRpmQ4AKw0zRBGh+3mu7VRI0RA8XGdYY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 21:19:11 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:19:11 +0000
Date: Mon, 23 Jun 2025 17:19:07 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, Matthew Wilcox <willy@infradead.org>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [linux-next:master] [maple_tree]  540335e987:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <5f5fyv7kcaah4o4lnj6mc2zpptu5v27iajbpahykgakgzz3z2w@spevx4qf2aph>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Matthew Wilcox <willy@infradead.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org
References: <202506191556.6bfc7b93-lkp@intel.com>
 <20250619154446.e9543f52bbc47e4bbd2cec29@linux-foundation.org>
 <20250620021420.7rgehvgrveyagqdd@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620021420.7rgehvgrveyagqdd@master>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YQBPR0101CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA0PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 763fac6d-d994-4d6f-d024-08ddb29b98f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Yz5NiFmpi8Z85gElKZe1VJ/qYFeNfWHPN1OA6TwCJ7uRXAtFJCJKNResxsY?=
 =?us-ascii?Q?2Rl/vVhQ4A60u4H2nflogOhivqThFtDr6F7r48Cr9swaAe9ybdQ5D8JeSkfS?=
 =?us-ascii?Q?n3KhYTL7RNSSy/weEeqolG/cGmesX6cUDQYwoe4lGXVLU3ITk8ArMxTVPiwL?=
 =?us-ascii?Q?enQJPj78lrZXX6KuSdIy/RpRsraIDNPsX9ZYcn9z7LdjeUIk8sfVc75U46Pw?=
 =?us-ascii?Q?l0Sn7u2yU9OB398x5WX4X5/w/iFkDg8dmr4gOvAKuCgbeH91ry+FvsWh2lFo?=
 =?us-ascii?Q?d+yvrToI9D87yo0gLnVlUr+NPDIfQUJTPKNW8rGXTv6RMFnTckUtg2jImHry?=
 =?us-ascii?Q?EGsosTa59FLuTZ2VAyQwVo6yfnrzV7kMoKJdY5eUEm+at4a/oyxKQiRZXLSj?=
 =?us-ascii?Q?Tbc6FE7N6NTSvqriLiqyi/1B1Xamjcxa+GAJoPgKCKWDXlPNz3KV6qduXhaO?=
 =?us-ascii?Q?XUyAr1dj2LTM/F5qU15+Q8YVILL4XpQ+SuqQEjdt+M/9WoUkswm6RqS9o/QK?=
 =?us-ascii?Q?Ryg2to+M3IfBKRZtccAlSegtQM+7iGSck+xYkgCwjh2ZaMpdtqo3MsXm9azw?=
 =?us-ascii?Q?pZ8ejNdD78k4uE+g5or618elfazOpZy97mlIMzNXGPAs4qpXINheNwvXhz3W?=
 =?us-ascii?Q?qlfsO7LtmwE2qX70OVlHFf5X8ki8hugVu4voYDUtYCeLoyUG6/OMNt0BBkPW?=
 =?us-ascii?Q?krlqJ4x9wNwzpwB9IxmJUVwyLRyAIyMeBsVHAIaUX5+tp6HtiYL+jFhcH/q0?=
 =?us-ascii?Q?cT2uvSuZcLVeHtghUJ1UMvPkwB6laeot5bz4sNAgs8htncE8lCGVjF5C0uW0?=
 =?us-ascii?Q?dRDk2LsrO/XIxH7NPe33bYfnAugVopzP+YKUPfEnyAYM68iQee8QEChA/zOo?=
 =?us-ascii?Q?t0O/C26Ce9VeTFnrbIMEWZyXy1QKKsXrYP47HmXutpXv7OsGhAKu73k4zZZ1?=
 =?us-ascii?Q?matSWSD7GNeXE7djc2m8Y/hToXUXG4A+2NxdIvW5Cv4SwO2oNeix+1aRbkp9?=
 =?us-ascii?Q?dxGmxWRv/6AKj+vq3dBJAyBpp021dVr6GpdEKjWjAJ6dmGEdDdpgr95EXylh?=
 =?us-ascii?Q?doiPAGwBeeZ1o7j7TY6beNeUIdMcj3Hsvu4b0sFDnmtlgquhba7pz0qH35BR?=
 =?us-ascii?Q?DE4o6guaJnRjJQ3j/2ToJHm/h9T4Q553OxbX6T84/ElQEodxCdVQ//zam/e5?=
 =?us-ascii?Q?MPGT2oWbG9tMzSx2QcKLNVmV/BEhmTxL83mySPYztfhiRL+pjVSIPJxUAs3w?=
 =?us-ascii?Q?gOODTF5IH4zXsP4DrquOIwbuH4Sc37rIK1qhqm6KZCKqCU2jLfRukoFelhRu?=
 =?us-ascii?Q?fpvRum7cM8tmrDxZJXAYzo4DdtFH6eloTHQ3k64BOGr13boYY4bMCBd2vRzk?=
 =?us-ascii?Q?yWgmTng/MvelasLb7pOUBmqVNUqSVtvqOCd43RMxXnRLyNNotSvS5PF2B+b8?=
 =?us-ascii?Q?rW85QUPC06g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DlIqthP2XLx4bW5Bzd+1a3ChNRQDkyAqs2N2OT/NjwB7jvzdJpHTIcfmT73c?=
 =?us-ascii?Q?6Gaa8D/eR4nUFEsW5taF9vbvHw0C+Tb3Gh8CX7n+xhm0qhGy4RDyB3Y63Bax?=
 =?us-ascii?Q?QNXDzGf/5TuS9dyxDFotPYGvz1JoRvCdA/R6gR6cp58bFETDNHbC9vKo1CQT?=
 =?us-ascii?Q?87zLBbL1cGS+vyJZGAY7/jCOKqve+nT4urQDjnZvJLIkf2m2gk9Zd3VdxIM8?=
 =?us-ascii?Q?4FUZmb3t1k74lvsyXZBPSzxQJI8QfwLh5mogbhDUVULB/Bffn5QGm5X9Dcig?=
 =?us-ascii?Q?X8FGdnyTePo+FxP/m6AMkmZp73WR3Jks6HKL/5igbLIEZveZ+O2eU86wmUgH?=
 =?us-ascii?Q?Hux2lsjicnGdCDCFUTdRdu1Dj/g7evCjGZkRJKSOdujNsdAasqihnKjeqO+s?=
 =?us-ascii?Q?96G8cahDDjXZIJhF9ZuV9AxBwmZ2sPmxORlL4kdPOvui8DcQBOrieViJu8Gx?=
 =?us-ascii?Q?8BJDJwUevCNxuHgQM3E81ZI88SUrU5Pc98Qywp5d4vl0EdwJLUkFNgUpN1ou?=
 =?us-ascii?Q?vmsoC7lZVDDRc+jyQYMTgrkRZP6ym3/WbA51eiuA7dQQgL1tYu0tVW4LgIQ2?=
 =?us-ascii?Q?rm8Atg/hjgVvT4tmwnkheS3YZVQQ3mfA02jBH/LpLOQMUu3ugJnuuQR16Etv?=
 =?us-ascii?Q?ETOUDd7RS/+nAS9qJWf9pz5fodgXsWDS8obxgXetlpSVhuXjIa57bGHEpf7R?=
 =?us-ascii?Q?3DgDiIovEkS76/kd0zLDH4sKldAF9lquPtu3Q0iwVn+qpmOqWHQEAY0arLOY?=
 =?us-ascii?Q?0EczR8ogvghiwt9AdrGPrKeKOPIQFYOk+PZwjDkPrAHXM+IRcjJvUfal4WYY?=
 =?us-ascii?Q?44ubFS7oG1XLnUiAeGuJG4/ar8b30Il0eZGoNZHtdFL6jsIpHLgGmI9GLgaH?=
 =?us-ascii?Q?5tTSx7KZxtnMztK/NRfA2hDuagUUgSYOhEimmMgnK5Can5vsJuS1PXIXWsp7?=
 =?us-ascii?Q?9sCpXfFxXPUIfw3J6McSNKQbEaU7lEojm0TIM9mBONSAMvWj3zjf06sda1U4?=
 =?us-ascii?Q?zYHxSrlOD4KRFbFHoCPRbHkG5/yuK0HLd5XyW2mFhOupJGoQlAeXoGvpUOMp?=
 =?us-ascii?Q?pCHNkPeDSCInk1hqtDwTSAeYvjFrsYfI1BFIrMr99g34wuvdYQxeJlFZR4e3?=
 =?us-ascii?Q?t3gGSt24S9rAqpzHJXQQGrE7DdaJJwspje5uTAM2anjO5MB5/Qvv8Li/IpWX?=
 =?us-ascii?Q?nOPLWjEOyo/nPPXDb0qnZ8KjWvB815OK1/lC3Sha+6YKSFo7mIKar3pcPjhb?=
 =?us-ascii?Q?GYkDbXz2nXLFPUMa4/mRvOc8OyZJoJFnriuqUVAmXIkUWqOSeqa1kssIAJor?=
 =?us-ascii?Q?lYChpV5FDDs2+fCQSk1Fdy4fC+vW0c0KGRbegN4cM9+qG5XeMqv+zltn9sYQ?=
 =?us-ascii?Q?8GfGRoPe9E+TXj1p2TWEXson+t2khuvqvoZX2bXZlL/F8cnvubow4WegkLKt?=
 =?us-ascii?Q?W2ACEBz+pEBGBxdVq4y/eGk4LPgWDi+EAx4wuAgQX/W0BVKzd7ZQIC/sbOsC?=
 =?us-ascii?Q?a/CvMnwZfWjO14t8DIow9e0fq+QqMmeAyLBXbkyT9wBCTP44Czx/oqC/vWfp?=
 =?us-ascii?Q?1lvtjKtd/jFZ1BpbH36jsWCZZr6t1W8Q1fDgVkhy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wxlqo1wJYYlX+eJ9U4r3AdQfu6PVVEjHCi1RQNIN0ClfQc2MiScgPCmDupps2IawMB10vEPkZzt+rYS/fLhk1C1sanviiU/kc6Cjpsc+4g19yV33jGeYIOVUNbaUy8nBZ9AjsdOkER4hNcrJ8vHDKHS25wTP02dErbO6BLp/DgKVwItaO84olxI5JxnXAtc/BEwqSYCB08nxCt1PqGNHTmeXQulXAbmvHZRNoXLPoPgnLigyM2YhytJuVnd95OqnaKyTnXuDRCUEj6mgqn3fL4FloGMX8lH7EVyTU9A9jRS5KKFsNQlHIscg4tqLs7+Rj8JBXRITvtLaBbb5yh4yfRmDq0mHMtgp0f162WbNg5hhUoWmpgT+d1KG5kbKVgOKVVbxw3dmMXIo8KBdSPGveG2SQmbTqc7Ua7wCz+ZDFz+m69DJSVLyX4xvshvVnXzOt3Bm1/jHFAYo4JdVVtv3E/UCQr/G394MfVqZDLlgJenxEbLFsIWBQ61g2dpIUaS8tBo04f87biFKqDMycxqbrI0ApsCUH9LfTHvnt6gpDh1I8jZ7KpvFIyOmnrSnWsaX4UYCXzwvVavCse15j8azajOJONWujDFsAynxnfVV4uU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763fac6d-d994-4d6f-d024-08ddb29b98f4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:19:11.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW+OQs39Lx8XPOvEfvdW8vivU9qV75AolUGboB4rzhOZfhHuIHyeYImn1Ijcxz1gc+QHA6e5brDsizs6P8kYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE0MyBTYWx0ZWRfX+b/NWF5u4L8Q xMzMaTKrFywa56w39gWY6vA8rvKbhUVSZ7W2H1XRpkeBin7DadnK1rEo1+tfaXfXOJDbqfwkcsg ghB6pLCzJZoc5sxh73U8ZINyAKHg7abEOoHI2ZRdW5GvQ57ol0V7OPPmZvcN5r2oJlwXTLU2EBO
 sQ2RWBALeRYWGziO9f2/VHjA1n4WhiElfhGpXRHUB8BOyszFCegr0QZP+dnDL7l2+ALWg51255g MsdbNSsaB0T1tDhjmCL6hJYn8BT1xiF7K9sDHjb0Yun/WaGwZeN8wAIqkd3jER54xeBaTzPqnI7 J7fkromSr4ZMrCDp0IUdXxD0rdCNkWv0AVQ8//3F/mCx8WeMXybUoWQDNvZwO7QlHNKMIFaDpNq
 wfmmTgSwhBwliU/IVF/WCrGfSsisDwAxCbr7zouM4CyxaVPQmeTpjBbVKjG5Yitrt5GXeaBj
X-Proofpoint-GUID: Og6RkMYFfpOOGc3FnT604uWn3ImQc8YZ
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=6859c4d2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=RCbBSpM2XmbKTDFfq-YA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Og6RkMYFfpOOGc3FnT604uWn3ImQc8YZ

* Wei Yang <richard.weiyang@gmail.com> [250619 22:14]:
> On Thu, Jun 19, 2025 at 03:44:46PM -0700, Andrew Morton wrote:
> >On Thu, 19 Jun 2025 15:32:12 +0800 kernel test robot <oliver.sang@intel.com> wrote:
> >
> >> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> >> 
> >> commit: 540335e9878005bf238ab4e1f91e8df0e3091a03 ("maple_tree: restart walk on correct status")
> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >> 
> >> [test failed on linux-next/master 6e5ab6fee68df8c40b338baeae6e269fa25a7e25]
> >> 
> >> ...
> >>
> >> [ 85.008687][ T5293] RIP: 0010:mtree_range_walk (lib/maple_tree.c:2773) 
> >
> >Seems this is
> >
> >		if (pivots[0] >= mas->index) {
> >
> >It seems odd that mtree_range_walk() doesn't (and didn't) check for
> >ma_pivots() returning NULL.
> >
> >Oh well, thanks, the report is solid - I'll drop the series.

This will need to be addressed once the dense nodes arrive, but it
really should not happen right now.

I don't like the idea of checking this every time we walk a node, if it
can be avoided.

> 
> Sorry for the trouble. It is better to drop it.

This indicates another issue exists which was exposed with your fix.

I've tracked it down to the maple status being restored to ma_active
before the maple state node is set.  The bot looks to have hit this by
going mas_prev() on 0 and getting the status to ma_underflow, then
mas_find(), which restored it to ma_active and tried to walk when the
node was NULL in mas_find_setup().

I have a fix for this and I'll roll your change into my fix and add you
as the reporter... and add links to the resend, v3 patches, and this
thread.  Stable will be excluded because it's really not worth the risk
- the code is stable now but just suboptimal.

This still leaves your initial patch 1 and 3, which has nothing to do
with either of these bugs that you included in the patch set.  It is
best to keep patches related to each other together, but not include
things you find while developing those fixes, specifically for this
scenario.

I will grab those patches and re-examine them before sending them along,
again.

Thanks,
Liam

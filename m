Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A113B2A5
	for <oe-lkp@lists.linux.dev>; Wed, 13 Nov 2024 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512919; cv=fail; b=ZZsUoHLBU4slrkexI7Wzs0mO3Psja9sucKJBWief2kDisCF5udFw59oD/a9AB4S6sM8XikQ+e6E08KtG5Mrq4BTvlnIF4AZD70tmgs8KRgmZ52ZMxdwZzK9fWwckKvsST2AqhVn0/1J9IWw0yzG6ypucOy73wL1kmiKiT7MCDKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512919; c=relaxed/simple;
	bh=Yaue9KYB6oGfmDaK5UHVRns5Fzjtsaggne1S+yRJMw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dOSfPKvxZbvi+AR4NzZ7e00B1TfFg/bfQGbrl0Npa27VxHHtPmP9HxP7Do6OoQoFt0TVxge6hts9vHUMbNqr6uBYVw4SJ2uPIIe5Ir3nTWQGCdssRsvD6qY/ZK6Y0/QAn1x7N9QOqJTC8ExkJ+FXNNzs8g6ja1AKyEKdMF3ScF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nuu7bbGv; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yZmLs2bp reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nuu7bbGv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yZmLs2bp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADDXW0q018901;
	Wed, 13 Nov 2024 15:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TrNk+qJZPPq1LeCYDuzC1Rc3dugCXT3pl1wLEAMp2ZE=; b=
	nuu7bbGv14M6vL8793LbGkgAN0kZXMeRZNkd1A9FuaZ7Uo+UrOTJzC7YvXuByvUO
	sPINRu72YiIDgF3WIq5uT/c/brs4tzojQHxjEC3Xzar7+2x6Xs8gkdov5xuXfOCd
	7SAjTV2Jl8db6C5TKqxvDR8EZ18eUEGGmZnFxIs+AGxCWUMwkSOZ/kEp0sIXmx4A
	JKYsJhdvI4rirQak2IssCqbUuwP4KyeSJLg6msVJzQc6Va4Z4WMoc2I4hOIPAVLR
	TTB322A/tPxr93YkxJNh96PJkIGS1Yfppod2AUNUehX9EfR+BbAUBDCl2d2ODgop
	gRzQesyXWXPMCa0VOYl8Mw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwq5ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Nov 2024 15:48:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADEEiIe025914;
	Wed, 13 Nov 2024 15:48:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx69gab7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Nov 2024 15:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbRYLo5H+aUYHfml9/e7zDFjwz7cO8Kd4QXaJ9H+gVG1bzxjCj8kErku4HSWIBiQOkkCiZuOyCfF4D6otNu3QCZXxgS8UPZW6OCljYv93vx2uxwi2jUzhC2qZopiXPwU5NpCZ+wBSm2xraw0pFzRUjImcGLbmw8+HI9f0Ld4Q6u5n9/bM8MSHJU9/vgb43N9atc/t89rslydPWy8WLrhJdML6WNLzLE8g66/itLfq2WYTJeMaSqkhxX9KmKUyHro8txExXvlRbltebZCe+UKMAl0VE7z7qnSzHBp/VhgBt6HUU3APYux9cqs8fKdcV9vbmDMAvmrBIMrrqOeZVX4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLxC/eHYu0BzWoX4mfPOQ7RdniePETjtSbsMyi2ZZpI=;
 b=FyfN9aUBDl5eV06QX5N3q0DXY6PRl9sLfSUgNam5Qeka0X4r7NS6l/nieCYBwUyu4Q5pVhLDx2za1zVDhRUHSrpC07gZ0L1Moh/CJIEgFlnf+lqiyCWhPE5FdPXzSAxH0fij/Q+qmX7vTdH13hjuBQtxK0JvQP65xrrHmhv/Z9K9dUHQ7jQiqbayll9dFQ9VotEsF3tjjJUH8jrQ77Dt7EJtVM9ttooWHJeJ/yOTtEmxWQMFWi/8s9lKgRbVtoJHwYDip1V/RmTK1Lx9Sz/OGnIu3OQMCGUzGLfnuWLOTlNheTL7HFksyK4JbfdN/fyFSIsGtG+GOOEf14270oAEFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLxC/eHYu0BzWoX4mfPOQ7RdniePETjtSbsMyi2ZZpI=;
 b=yZmLs2bpZdlsC/eTlpYEwPVDBaGQUa/v4buqbhs5Mu2WVeD6ee7jvu1Z1pIdOUxgSt7ikw5r5rRFsC9JxDKIW2XpeDn3tM5RGPoSUeXRX7xZ3OOFB/a/XvASR/clYqcNoBSCRD1A9Wo9d5mg+8FHyYIXZfaq74hTMptf9fh/UI4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BN0PR10MB5046.namprd10.prod.outlook.com (2603:10b6:408:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 15:48:19 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 15:48:19 +0000
Date: Wed, 13 Nov 2024 10:48:16 -0500
From: Chuck Lever <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
        Mike Snitzer <snitzer@redhat.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <ZzTKQGYJFh7PH4Fw@tissot.1015granger.net>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <4d5d966b2efc0b5b8c59ef179e99f3f8fbf792f8.camel@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d5d966b2efc0b5b8c59ef179e99f3f8fbf792f8.camel@kernel.org>
X-ClientProxiedBy: CH2PR14CA0011.namprd14.prod.outlook.com
 (2603:10b6:610:60::21) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BN0PR10MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: be74fbfa-a67b-4685-b10c-08dd03fa9892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?f3BFmxIDUTCabO6XsROCBJer73FmMJjAt2lcOne9S685uvQkysC5WGSWnH?=
 =?iso-8859-1?Q?aqHMLe+E/mdsbZHYa9N7D9cAubEiHXtn0EYURcU5rYxyCBFoQaANjQUG2/?=
 =?iso-8859-1?Q?v7ty7+oHgLn21vzW02DGYfE4liIy3j2U85678XGnuCW1v0ryRGwV6Is+oa?=
 =?iso-8859-1?Q?ShadqIpo4UwdXMLHhpFAS+zaBp1+whNYdL98y66CHhZaFNUqGQETmvhUUL?=
 =?iso-8859-1?Q?A+EdqfYXvr/17JCRH/Yd6aCHBVabR1ffHNwz8YtkbZfP7sLrzeqWqJVcb8?=
 =?iso-8859-1?Q?SVBnIQ48tH5aJnu8BUj+EXis5fQtC1VMR10L2q3g1xwg1NAnVaudnmxOFZ?=
 =?iso-8859-1?Q?/WH1WG3rfaP5sRa7mn5WJJGG6E+Q/+zON0ZJM8SUm0v1fIYe/VoeHTeOuG?=
 =?iso-8859-1?Q?j/XYa0N33AkUrZbzVmiwKVtmLHyT9qZ9kehsM7qxnZc8B+7q0z+lM2x89A?=
 =?iso-8859-1?Q?TUeUnqAIdcDXe7CbLtDYtPFaxSpbXXlQrRHrIz7/J5f3tewz6sfYoEVU6n?=
 =?iso-8859-1?Q?5iRN2t5L5OrHlegJbYZZrITHhDSq8f9h99l9ulNZav14FHXZnLfhtCVIG1?=
 =?iso-8859-1?Q?8jY8UWF5b4806NQ8uP5DN3d12rsfzMkZ1WFPnlP4wHDjaQwBvUMFt6w125?=
 =?iso-8859-1?Q?F0GG1o6F3lhRfhTdjjnKX94iBBW9BfkMh6FC9o2L3REQcQzU86eU/4SNKx?=
 =?iso-8859-1?Q?E+7FYvFTP7oaO4IuV8cE9LQuMQnFBu//VR8a3/QUnNsqRGjKnTTFLkAAXg?=
 =?iso-8859-1?Q?yzhIng+NJ6oOl3O++5FHLmaj7OBGH9y5uC4D1YHZolZ4ZfBZdh5SRAqKB8?=
 =?iso-8859-1?Q?w5ne26fj5PXehYrzNbyQG2H/u/a798AGg4GPyXYHxvsxnIplNWezW0m8FA?=
 =?iso-8859-1?Q?ZNQeVGOM6INSX2LwsWG6dWjhqtSBIb5kzK/IBMu3qGsi2WlRsoW2WBZKmY?=
 =?iso-8859-1?Q?LYWRARNpfleoP2iL1mq88B4hcYvAsnTSNCmwQvBxE4X9eUoJ+HQuUkzrQX?=
 =?iso-8859-1?Q?5qu58z60VLc/tAaOXjnR5NcJd70q9+VRCoM/ODkrD7vsoeh6C4loeEjDXX?=
 =?iso-8859-1?Q?XlObqCq0dFSa4I7kvPgarSyYgH9WyqUHaAfyYBItv8nZrjNwk+2VSiR02r?=
 =?iso-8859-1?Q?kiAwrOlkrMbvbYVA9N/g0WYoVyis8TGDmrVSj/LMzfY4FPGfT/rB6eoIxt?=
 =?iso-8859-1?Q?tO7v8GXSD/MdmwPBBnYrfX6m1kcqUOhCcwpV2MJsYgfNI19b1HkY/sLMru?=
 =?iso-8859-1?Q?Lc2L8jrVrdehpjbHyqrRRZok5F108r3t48KBYJTI8JbP2AVF9g8NgW+EtJ?=
 =?iso-8859-1?Q?JIx0O/mNXkoZl58jakBFT9ff8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?O9IusNcRPAPCm2wUUnMwPVTntI9O1VaLwIRvHmTB5q4aMwvCzmFp904rvT?=
 =?iso-8859-1?Q?wFqyfuXQxeiWyZDRo37oqAdExy3UH8iciUNKWhh7LNHtpFZrEu+KtRNa2o?=
 =?iso-8859-1?Q?to269zioXpKqSWJhW3/A8UXcysDlNRu61T2CWhZfjqIoG7W16RYYEaaMFr?=
 =?iso-8859-1?Q?EcibhnczSaRyR3prEF9uf+OIk3sh5Qd4z+Swoo8H0AI2Ozub+arsiJ3+sn?=
 =?iso-8859-1?Q?twdDPBQiyn+PBUR58ZftkFJYinmr1U8j3ZHHSXjdZJdoLKfiWH+JYC4hGI?=
 =?iso-8859-1?Q?T0B5eiRld/eizIrEnSBTKYwyFhfwEjL1U8uTwOkxBIVUDwAw5fEnJVFBdz?=
 =?iso-8859-1?Q?Rx6EstzE/a//dw3W8/9o4vJvbnsQdAtxJRxY9te1JCgXZ55ffb7POzC5NJ?=
 =?iso-8859-1?Q?MiFv04TAcReAREwA8SKLxj+lOIg5xG86KAl5feD83Y8RSS2tdrtfF/7der?=
 =?iso-8859-1?Q?7AR3rewzDIascEP8790ObkDN18/VKGMdxGIgYN1vPjreG3mJRYCE4/c5LX?=
 =?iso-8859-1?Q?Edm4rHhpH3PNcM95aLdhFTm7AEag1S7wBfc0HiO9dTBfRzUIRd6XlK+FNF?=
 =?iso-8859-1?Q?iMslJvvYrHcUVHjKwZ0Kd0Hu3R2rOeivvDso9t+iLNuGho//IcY2i12rjF?=
 =?iso-8859-1?Q?zK6c4UBth4S0Z5kjajX/IH4hVeOH09tap07H4ZU7rovVwt9eY51ogbw2xi?=
 =?iso-8859-1?Q?MAS8gAi8FcXMCrfIrOO/mZ9C6ip691jqTS8adqsuN/uxHV0lZAazXZRYfH?=
 =?iso-8859-1?Q?bFyFNBt1lDcUFcpDwps66Hb1NRFhm+TpuPltb39bpZuEUZuNAaPnp1gBrf?=
 =?iso-8859-1?Q?59UqthAp1JTPy9ivdVhVN9uJ57EW2OX4dbV77+M5s6YK2pGJvsoVn3P9gX?=
 =?iso-8859-1?Q?dep5zqk9Ysd3uFmEkEyHDc7Eo6K0yxC5mzqwC09rCunXlaBE21+T+9k0pM?=
 =?iso-8859-1?Q?1vuLEBoulTO628OPeNWqTrhigzT6a/ETxfs5BZ09AVcJM5qcyvAKvYaXJy?=
 =?iso-8859-1?Q?wDcLLFgTaQZPIRax3MuLbTgh934bIXj3mF4W5wkb2lUSYvnSfJoGy0zde2?=
 =?iso-8859-1?Q?8toT9508nWzLZxfms5NEyoUM8czC7W9EQwhvrwzLtKRxaXb3mBA311wL9N?=
 =?iso-8859-1?Q?K/85NozermkySPU7EsO6MWgEfEJEvuCz5aFb1ueoHG6sBYpp9rMwuZINLs?=
 =?iso-8859-1?Q?LnlGBezqoPwAecLJmxcCF43MOaj5nUD+s2kEGfPBK8/ETXYsDaxkbl+yUC?=
 =?iso-8859-1?Q?uF8PTqgNEUS7VZF2ZA/kf938ts2NqRWSciUqfS0Ii04bK98JanjmyiQSLf?=
 =?iso-8859-1?Q?iV6ynsInzzA40LrKTi1vBcgYx3HzektEjv70miZloP2MpPPS2lYb4q3yBj?=
 =?iso-8859-1?Q?yNIYMDdiBbkfA5RfdstWfFmvbpc9k3eHYrlPvfhA+wgfj1YFrXDZpkBh/8?=
 =?iso-8859-1?Q?+1QwxDI3skGFNE6GhyVfFeUr+iEZhok9WhL50vqpA8H6pgjyWvceMr/UHf?=
 =?iso-8859-1?Q?yTNROmpbSkTKlwN/naxTrm8A/eNRu1tnFDa/rCJsqXDEoevKx4Cix9qCho?=
 =?iso-8859-1?Q?PqUuRaHVvOz6yJqxFmqro5gLHeUHk6O560lgTIspPbKGFXiM642WRVtnj1?=
 =?iso-8859-1?Q?VDQq3PvwqiHXy+O4LxeSRPjw3Vr9AndXASm040mNcBLzyLlmihNlUKyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MyUVJ3A0vkviYjJWlVOZXLebkT5Yk+ZrD1H9mQpuc9t/dOUSKPAi7IhE6X5uEGk4a5YZq0Zsup0GNLMnE1K+GCjWyqS9jKkDlw10Y+AcBnKyBstmyRrJjy2/Bcw3uLfcRcmcQ3uXfV3tqk7uzEVI/hhpr7ngSjjLfnq3IEgnbU7qNea3U8mI4c40VXQod/K26CZTccf2JIqfD+6q655EKPKB//VVSRUA9Pw9kFjnofxsy+r9M9UMGJyweemyvbBq9fRdH4DozuSSqcxC2y2S3ktLxOnRU0QK6rArzZRFDClHrUQ5xBaUISX9lQUskd+14gPDvjI56GR+EeslVtv5un9JO+VqikWlLSvibVd9duiTnHufN5OyVfQe5OhmU5Np2GkPR28IG5z9OYI9nhBMseHokjzI5OQlZpPkLhz5VZjhIR2EyasD6re4OvO+nAQc/RORINTihsGrURqdo6Dud0buHP7qFZkbzZsK5yLLmGmlWfwF9uqHpkvCa3njStp0x64mC/oD85QgplwiICzH0uW1KskzZ79TttDplYsV9xri7eoa10Io3M3AWrPmNA5osrYGTYejNtX3N3aYcDWQZgi6P+UYwiwc8jfo0lVpFSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be74fbfa-a67b-4685-b10c-08dd03fa9892
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 15:48:19.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5seCma/MbJl7T97EHqhqaWlbvBqJtlVBFc3GDAQlSYr5M/+NIdKdpfp8fRUbK4Ads/89WIN5p2iJoVHPxAbi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-13_08,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411130133
X-Proofpoint-GUID: l2wW-z2xdhCXXPgKHEy2KVH89JT2qMhF
X-Proofpoint-ORIG-GUID: l2wW-z2xdhCXXPgKHEy2KVH89JT2qMhF

On Thu, Nov 07, 2024 at 06:35:11AM -0500, Jeff Layton wrote:
> On Thu, 2024-11-07 at 12:55 +0800, kernel test robot wrote:
> > hi, Jeff Layton,
> > 
> > in commit message, it is mentioned the change is expected to solve the
> > "App Overhead" on the fs_mark test we reported in
> > https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
> > 
> > however, in our tests, there is sill similar regression. at the same
> > time, there is still no performance difference for fsmark.files_per_sec
> > 
> >    2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
> >      18.57            +0.0%      18.57        fsmark.files_per_sec
> > 
> > 
> > another thing is our bot bisect to this commit in repo/branch as below detail
> > information. if there is a more porper repo/branch to test the patch, could
> > you let us know? thanks a lot!
> > 
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 92.0% regression of fsmark.app_overhead on:
> > 
> > 
> > commit: b4be3ccf1c251cbd3a3cf5391a80fe3a5f6f075e ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")
> > https://git.kernel.org/cgit/linux/kernel/git/snitzer/linux.git cel-nfsd-next-6.12-rc5
> > 
> > 
> > testcase: fsmark
> > config: x86_64-rhel-8.3
> > compiler: gcc-12
> > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
> > parameters:
> > 
> > 	iterations: 1x
> > 	nr_threads: 1t
> > 	disk: 1HDD
> > 	fs: btrfs
> > 	fs2: nfsv4
> > 	filesize: 4K
> > 	test_size: 40M
> > 	sync_method: fsyncBeforeClose
> > 	nr_files_per_directory: 1fpd
> > 	cpufreq_governor: performance
> > 
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202411071017.ddd9e9e2-oliver.sang@intel.com
> > 
> > 
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20241107/202411071017.ddd9e9e2-oliver.sang@intel.com
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
> >   gcc-12/performance/1HDD/4K/nfsv4/btrfs/1x/x86_64-rhel-8.3/1fpd/1t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-icl-2sp6/40M/fsmark
> > 
> > commit: 
> >   37f27b20cd ("nfsd: add support for FATTR4_OPEN_ARGUMENTS")
> >   b4be3ccf1c ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")
> > 
> > 37f27b20cd64e2e0 b4be3ccf1c251cbd3a3cf5391a8 
> > ---------------- --------------------------- 
> >          %stddev     %change         %stddev
> >              \          |                \  
> >      97.33 ±  9%     -16.3%      81.50 ±  9%  perf-c2c.HITM.local
> >       3788 ±101%    +147.5%       9377 ±  6%  sched_debug.cfs_rq:/.load_avg.max
> >       2936            -6.2%       2755        vmstat.system.cs
> >    2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
> >      18.57            +0.0%      18.57        fsmark.files_per_sec
> >      53420           -17.3%      44185        fsmark.time.voluntary_context_switches
> >       1.50 ±  7%     +13.4%       1.70 ±  3%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
> >       3.00 ±  7%     +13.4%       3.40 ±  3%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
> >    1756957            -2.1%    1720536        proc-vmstat.numa_hit
> >    1624496            -2.2%    1588039        proc-vmstat.numa_local
> >       1.28 ±  4%      -8.2%       1.17 ±  3%  perf-stat.i.MPKI
> >       2916            -6.2%       2735        perf-stat.i.context-switches
> >       1529 ±  4%      +8.2%       1655 ±  3%  perf-stat.i.cycles-between-cache-misses
> >       2910            -6.2%       2729        perf-stat.ps.context-switches
> >       0.67 ± 15%      -0.4        0.27 ±100%  perf-profile.calltrace.cycles-pp._Fork
> >       0.95 ± 15%      +0.3        1.26 ± 11%  perf-profile.calltrace.cycles-pp.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.70 ± 47%      +0.3        1.04 ±  9%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.do_idle.cpu_startup_entry.start_secondary.common_startup_64
> >       0.52 ± 45%      +0.3        0.86 ± 15%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.72 ± 50%      +0.4        1.12 ± 18%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       1.22 ± 26%      +0.4        1.67 ± 12%  perf-profile.calltrace.cycles-pp.sched_setaffinity.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events
> >       2.20 ± 11%      +0.6        2.78 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> >       2.20 ± 11%      +0.6        2.82 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
> >       2.03 ± 13%      +0.6        2.67 ± 13%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> >       0.68 ± 15%      -0.2        0.47 ± 19%  perf-profile.children.cycles-pp._Fork
> >       0.56 ± 15%      -0.1        0.42 ± 16%  perf-profile.children.cycles-pp.tcp_v6_do_rcv
> >       0.46 ± 13%      -0.1        0.35 ± 16%  perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
> >       0.10 ± 75%      +0.2        0.29 ± 19%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
> >       0.28 ± 33%      +0.2        0.47 ± 16%  perf-profile.children.cycles-pp.show_stat
> >       0.34 ± 32%      +0.2        0.54 ± 16%  perf-profile.children.cycles-pp.fold_vm_numa_events
> >       0.37 ± 11%      +0.3        0.63 ± 23%  perf-profile.children.cycles-pp.setup_items_for_insert
> >       0.88 ± 15%      +0.3        1.16 ± 12%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
> >       0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.btrfs_writepages
> >       0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.extent_write_cache_pages
> >       0.64 ± 19%      +0.3        0.94 ± 15%  perf-profile.children.cycles-pp.btrfs_insert_empty_items
> >       0.38 ± 12%      +0.3        0.68 ± 58%  perf-profile.children.cycles-pp.btrfs_fdatawrite_range
> >       0.32 ± 23%      +0.3        0.63 ± 64%  perf-profile.children.cycles-pp.extent_writepage
> >       0.97 ± 14%      +0.3        1.31 ± 10%  perf-profile.children.cycles-pp.__sched_setaffinity
> >       1.07 ± 16%      +0.4        1.44 ± 10%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
> >       1.39 ± 18%      +0.5        1.90 ± 12%  perf-profile.children.cycles-pp.seq_read_iter
> >       0.34 ± 30%      +0.2        0.52 ± 16%  perf-profile.self.cycles-pp.fold_vm_numa_events
> > 
> > 
> > 
> > 
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> > 
> > 
> 
> This patch (b4be3ccf1c) is exceedingly simple, so I doubt it's causing
> a performance regression in the server. The only thing I can figure
> here is that this test is causing the server to recall the delegation
> that it hands out, and then the client has to go and establish a new
> open stateid in order to return it. That would likely be slower than
> just handing out both an open and delegation stateid in the first
> place.
> 
> I don't think there is anything we can do about that though, since the
> feature seems to is working as designed.

We seem to have hit this problem before. That makes me wonder
whether it is actually worth supporting the XOR flag at all. After
all, the client sends the CLOSE asynchronously; applications are not
being held up while the unneeded state ID is returned.

Can XOR support be disabled for now? I don't want to add an
administrative interface for that, but also, "no regressions" is
ringing in my ears, and 92% is a mighty noticeable one.


-- 
Chuck Lever

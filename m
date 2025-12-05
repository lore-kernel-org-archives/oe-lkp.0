Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90291350D77;
	Fri,  5 Dec 2025 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764956791; cv=fail; b=uJdZlu9W8s4ZqsxAwTRPmAPWMxtGQs+wkVqwA4V1+BL97uWth20E9aJrAMx8dd9tfzHAl0J8qsU0NcDyDEmP4NzPicMdRqygA3LKyL93ONFQp7uZTJ0ilRpSk9Drx0+l1CwwZyGgsfOfSGmwk/kPkF/mBwR0NJ547uKN6eWwZmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764956791; c=relaxed/simple;
	bh=PKxJtZ11qpwhsFLMADYSYBjcobjX7VckjYjqld9UjI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rh1ttqGUCwKe8bXhMHAiY0wRTWvOUuzzcSIlO8bCsVSRrV57CYYOKqikT3Qw8je2dbfkbqMWI/DQmuSrMZ3HnjC44J+SHDOZZdvfZQQ3A4w3tZE7MiBmHY/3hbnt/1X2CeO1t4zFjsjtApL7MWg39lpe0ZgGkfABHYL46++tWQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EUy6u4Sm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fV6IKudH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EUy6u4Sm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fV6IKudH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5Ha0h1259609;
	Fri, 5 Dec 2025 17:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PKxJtZ11qpwhsFLMAD
	YSYBjcobjX7VckjYjqld9UjI4=; b=EUy6u4SmEtNtJVT42dFUm/lC6S5TciWE82
	dRcjeiMGRKi1M133XyJg2UtyVc1ad3T4qIrwNnlWeJ7Mqp8lTGRgW3y5xWkur5q8
	qbTjzNzEGNaOdCE9C8O0rSGRL8jxN0HP9cimS0ZnWddbiNcXxDrNNILBAjntxky8
	bR8+T7fLhYsyVcdrXaGRa20Y4Eu4vKgC/G/VRaX8KR3xJ28pcN6NsMN9o3eAsvUQ
	lMTImQe0DX1G8Ak13Wdlk9RN58EkuDRCh3IQD5/go8YJU3J6D1+2+OnreuH499Yj
	xLwMoVsn3TERkLq5NnhFaQYmO0sUEdCXJOgLBRhZXLQAqvrnVobA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4av3xa00fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 17:46:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5GitYN016915;
	Fri, 5 Dec 2025 17:46:23 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9dgrse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 17:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUWSjBnfFobcmEpCwPihxYVzYtPg1v9AeEG4ilqdYQD1fM0FNdyo829PTCjHv7mF+gGHUcvdko2xLlBeA/C22bQr0YKgi4/QRbW3dwMbglOypYFZMgXFLY9xo7cfOyJewkrNP9C1V7zNfXAgaqnRiwz/wNYIl6nHoBQ8TetwMmdQfPq7DdVg71DvqDfB3hwQDzvQDZX8wwcqHh35ahJGT6BHW/NbjVcx2tmw23exq91MzJD9oCEU9dGNUNp7Tbwt8FPL5yfK2LRv2ehu8s8e85EZTgMP0sHrC8TL1bA7WThmdcslojYQE7HzQXAh2CZXVQtmtu2o5LkotmhWodI1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKxJtZ11qpwhsFLMADYSYBjcobjX7VckjYjqld9UjI4=;
 b=TMhBSUvaO8VW/9ypFuKc1YgDWkw/W3+WXKrlY33Wnd5sgt7oYnz9PNIdC8JVyN/wvD/RL4hNyaa7MNfn6pJrtv8nLWR7ERngrleqXClJOb2AY562sCk7ORWrim33USSlkQqs66chHY2UWOhvhHkVxTJFL0hwt2ytbE+D8sJTTIwiW7OksbBtRhTkPaXFHjr6ccEXZU2aH5uVZbBxpvzV+2ai1QiH/R0vtC5YMJONyR8y3fLsOCmstKFWh68ALm3KYOY8c37C2ny2adbSztAV3WHhGdpuu0K/ORZ4WgxYrQBDvpoafDJ8Em3UZWLYBpePHg9COilzkLamA1R+ccALjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKxJtZ11qpwhsFLMADYSYBjcobjX7VckjYjqld9UjI4=;
 b=fV6IKudH3RLKEaGkkIzEjPqKEQYdqxlMtRTzXpx8rPzSOQm+K6z290ijpB2v6pqTHW7DcqBbRU6Nu2YRIXCK1fDuLRgCtQh+I5e0oEHKJk5SznI7jbAzhiw/Am7qnb1pZbqArala1Bgwbx+cqgCprEc6mpQzIctIxCLwpRpMaPE=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA1PR10MB6517.namprd10.prod.outlook.com (2603:10b6:806:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 5 Dec
 2025 17:46:20 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 17:46:20 +0000
Date: Fri, 5 Dec 2025 17:46:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [mm]  2b6a3f061f:  stress-ng.msg.ops_per_sec
 34.1% regression
Message-ID: <24a84b3f-f7fc-41aa-ac44-2c0319c78e4f@lucifer.local>
References: <202512041634.150c7e4f-lkp@intel.com>
 <f35b0909-c2e7-4d28-b2c6-30725bf2011f@lucifer.local>
 <3f10e398-5bca-4b8e-aca0-750a1ecfdda8@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f10e398-5bca-4b8e-aca0-750a1ecfdda8@lucifer.local>
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA1PR10MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 292f9625-136c-46d6-a827-08de3426328d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YvtUZSYF7q/Mxn+jrxczH5sme71eR/q77IqQOhXNLMAa2PLjdxalJSd/YU8a?=
 =?us-ascii?Q?2bbznHzkTerxpVrfuxjF42VMn0AeHpCKVjfq31dcBOuCOGAjiT635fSP1gI2?=
 =?us-ascii?Q?98gHlk8AbAA3B9eQXQsl1e3AHYZ4Gc6aNaJduS6qndaXQwaiunTrEJCLg2HF?=
 =?us-ascii?Q?LokWkuWqL63XwBloPalhwXYvsbTC+dqkwVw0vLcPCTS43imglMQaUKjkv3eg?=
 =?us-ascii?Q?buYfoMOpuIysnS4s85PXJe+MzL3Y9XaTsXgojqWQict8W/ZS+/g0b7oYR1y+?=
 =?us-ascii?Q?NawkqGhYm7qrypC2idYgx6u6bUFx2d6W4sVTJlaaSv+XSsG92YswxKuLZy6r?=
 =?us-ascii?Q?UDQuUEhMYE8TyAeIOwqEhixzFEVvzq4Kdd8tVBz4ILavMlNDkC8ldeCbLCu1?=
 =?us-ascii?Q?YyasdPKvtBS5SgLqw7ZeAUeghsvIbiWAoalRidh4lwt4Q75afDHIrYpmy9w8?=
 =?us-ascii?Q?g0RPniqi3K8MzgQFZzm5PVAUeLrKbrY5FVa+xfJpUbgXnL8UzZ3ntZH/k2K1?=
 =?us-ascii?Q?XB648UGRR0upyO0xZQHmbbGjYONNgF2wjTItlqbH4xXCJ+Dulzj4h6PEni43?=
 =?us-ascii?Q?08Tgb5kcyp7rcAx8rx0CrkHTVZeBoGIErVOUedjh0ZHlSPn89E+QPTLQmk8b?=
 =?us-ascii?Q?hxjAwnogh9eSjmjEdxWIV3XX4pvuG7T9+9V9spNXYnP0aLw5YgiNRtMVC4XT?=
 =?us-ascii?Q?lBsJs9w7Wz8Zsq11P8mAqD+ROPZ5LOSUuixGkhzDydGnRYChhxQJm14KZXQ3?=
 =?us-ascii?Q?i/ZtJkLNBHKrEcFGYxqW/0Vctb3Yws6EDrgPXw8pt3nCfWXdXnuARJwhbLG2?=
 =?us-ascii?Q?PIghcXY4h4iPrmdXAhj9yTox6G0v1nrqCjpLnD1nfIsw9lsRn+q7eq+QxyFJ?=
 =?us-ascii?Q?OsjBGGLiUkvxHvJbIn2Pl9kfoY1D65rljWjC983yR1qo+p332jYAaYbrNSMV?=
 =?us-ascii?Q?UsbwRTNmeq85LaCdOajZB/ifliDo5cCBVBkwHl1NADbVy8ecx7kj9Bz/P3cu?=
 =?us-ascii?Q?AXkdTVhRxLJepoESmF8WOgMqtxoS5hjFxR978uV5ADY0KBGoGJgL6Tw9f2TJ?=
 =?us-ascii?Q?nO83iMYE2fpEmmr24BE+lSZg6qOApX+iTkoVpVbk+4Ypu7cL5K/j4QLzQ8Ui?=
 =?us-ascii?Q?X7Rhmh0XkZeyRNEXXvIZZGI8FQwQeKkHu6++yD9gqn7sQ+nkKpxxwlnNItMA?=
 =?us-ascii?Q?9eISFjSuDaRswLOQSb9srxDzTXAvpiSwLqgvIwWtlbamIG3n302YlmkIRgoJ?=
 =?us-ascii?Q?VsXgl2kAXtTEzBN/fuPfXIyR2uCybq5ApgYQFCc5JZh/6GLQw67KEqSpCk+t?=
 =?us-ascii?Q?uT5NZ78qcARiZn/RvBEhebJX3dFv3LLrr75mmGLLZlGRu67bGUcriTy0bC3c?=
 =?us-ascii?Q?E1I9l5zJgkqwLbu0NzLB26aimFtmJEDuO97ECT+4LsJbpkPhDqGHiph3Xtc7?=
 =?us-ascii?Q?4UECMv8/+yKPS/aOqjBR+1l5xj3jHegg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?751hbgZvSqRioJwBuZ7W6qcTpAVDnH8eB45v5j5WRTN7+VCmCG8BeA/Bhfn3?=
 =?us-ascii?Q?g/U4lQe0sYSw9Qp/KJwAQMir47/yWz23k6UccKmefX8qfR3pCJBocaqUz6UF?=
 =?us-ascii?Q?EXT2v80KLPf925gGo+qcTI074AyS4pXBboK1vKSv9OlgKTDA4+k0/TwUsvyv?=
 =?us-ascii?Q?fI+aBOE+Bvur7DmmrqZ5EyGgmPVCzOEshIGiUmWloB1cpq8QkGxwKtGSs7Vr?=
 =?us-ascii?Q?zxcw6Q4UnJsMc7OKP0Xn092zVd98muLlwaAxvQyn2Cf+Vrk1ItPwvMRp7MS8?=
 =?us-ascii?Q?HoZjcqONm76cOPyVga7WeyghSYvCWvX7gpOXRRCxL2x4T5rdq4MOHcavfr1G?=
 =?us-ascii?Q?byxGQ4EtXMcsfpQ9b9qeciF32d1CNYFxLppM0wq4Lmdo//xWd3oqUAElkMOq?=
 =?us-ascii?Q?tRPv42ojDGF7qaasqgvbFmHcrN4qYcikvadpdUp1Lis0pXloSetxXD2FRGBa?=
 =?us-ascii?Q?FXwrPeBWkj0hbhpWreWXOPgaqQNwvJqNc2O1q7c/isFldPYtWLG7mWtfiw5I?=
 =?us-ascii?Q?DAkf/4mQB9QHeV50BsTevnJ56KhpbMm1QyL5GT18eEuciV/7+5bqa6k/Vx9u?=
 =?us-ascii?Q?67jp4NIiBzrTWViB1Mf9adHiVP0Xf4VXrTWl2TxXU3Vtb5gl0dqrj5zuZdna?=
 =?us-ascii?Q?Bwvulv2RufJME+YqiEd4nyrlmnbHfPSD0JwCCS3tuPl19zi4KVAzYZa4dcH2?=
 =?us-ascii?Q?kXblTjCKYeL32lOpJzgE9pl5FTkHpqYT64fQUqKdfdVxlqG460nxW+eWArx7?=
 =?us-ascii?Q?R0+2bvkQijDKRGGD/y+UFdZ37moh+6jvFKmyDBQuc2ErcN6wbnyk4BXYjlUD?=
 =?us-ascii?Q?W2/1jRI/X8Ft/+QhvnAvoTZ4M4rYv4lC1tgLB84H7ndxCV52xSe/zxafgClQ?=
 =?us-ascii?Q?YXYaSRCtielDt0Ft4AUhUHUVAabf+hT0oundj4Qn/sOn6JBxHD48y7vbOH1O?=
 =?us-ascii?Q?pHzfZQnDgTHBw7YD51HaTP9HIKEWYmGOLZhXQ8lEgOUQQGEKKFRdOM86L4EM?=
 =?us-ascii?Q?KVedet6+yTu/74rqy4M34u4u4a4taME5ECrV6BOUbByk6BZ7+LxK47TL/cJ7?=
 =?us-ascii?Q?DrRLtrKLfMWTvvLxlqYqfHIb8trieejuFZ1GAZE4RsM79XF9k4y58xwofLab?=
 =?us-ascii?Q?5ktSth0j3gYvvQMSXsxMdCw+VuY58FLAzrTtikDqbwSWxp6s1gWnH83Mjxq8?=
 =?us-ascii?Q?eqOyO0PfG31+g7YSgFtNhnhIrz18uwXB/p9TYt9Rg8sTr9ZxBeC6mwavYBkX?=
 =?us-ascii?Q?1Tqy+V0m13CC+ocYZvFIydfuuOzKgrp0FTFwK8NBv11nuk2pYDuKNpVbXXmq?=
 =?us-ascii?Q?58JI86aVX6O2hg1OueHJYrwqUzYfaAnlnGAtU76SEznGFT+Ryo5EyF4ZY7Uz?=
 =?us-ascii?Q?xgaVE+6imua508z3X2R8/nbvrGy/ITaw43MjpxfsHiT42mxPWnQuSAeZQ6ML?=
 =?us-ascii?Q?z0dz3cXjCNSQUNETrn8LGRuPCJpfvSZp+WbTTszGTKQOWMxS1SvE82k7gk34?=
 =?us-ascii?Q?8EirElQhRYc2ZMFAZGAIQ5XvWLc/QVp5R87i2mb0Imm1Lmo/s2Z0YEsWC+Jc?=
 =?us-ascii?Q?E4d8y0NdP2KkHHAzuG8OUk1+N5LOtzjcMiA4dsSqDPktwK5Gwmm88j+Ui1El?=
 =?us-ascii?Q?kzUFC+e82A8vlCfEWQlAZ5vXtq8XJY1MKAb5pC/oLDsJOOOElx7490zp4AG7?=
 =?us-ascii?Q?x4vz4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I87pJi7ZbJHWvmCV4NhvkM+zYnK7oNHToszT/Q+v5po/ve9KQbW512vJk2BJYhKpCXZbzm7OB4zwLlBB3y5aEsXp7M9Wf3waO25zUu7aydOA3CXw50cO+dytN6AWXuVBI0U28oTAi6zxG33A60PXqjdNkErCF6oOFdfRtEke9UvbxNsuV0iTwvkIF26SOPfR64zhZDxFORz+6+LZn2jnlFFrsJIP4vk2Q0Erg63lIhKTNY2ILBSKf4n+HeKuuZfRdPv/F1+HjRws0DDuoFh7xgmQjbmrMlHuBnJzwj1m+AYGjcmlVM6ovB6tUlCc+eqap8wystw6FuZxW3ZNm4Hxzwz2GiogeQEdniev+DkXIwlKhGRR4EqHPrOBhbzg9MoEPlvqgmg6RlMP9SeggkMaiWd2al2POck1UZ94Li83hy45WH/PojSff4lEg6ZiD2YJUd3Cqum55fTIWNFlEHDvTt9d5nONtIVRRmLAGfW9+9c/JeQhMJ/sFxnZphn/W6Vz0cot0U0Ln9oPa/RIwPAPHKbcc2BGlQ1rs7/sZ7Me2sGxmD9Tc2lDPnenjaXf3+FU3wbcLZgcFD/2fIi+dc/Tf6QKGW8Bj+WqsMKMJoH2kvU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f9625-136c-46d6-a827-08de3426328d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 17:46:20.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luKTqRGm9AkSx+01CfitudZIfAdOe2Cxs4ItS/KQ3GsRIIQXpd45fa4EgJTOEFbiEIiOzFqAXMKIwXbmSM4NsUmmMGt7vJd4Ev4QWoTWtWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6517
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=924
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512050131
X-Proofpoint-GUID: PYzMcae6sN3_r90LS42Ck-29S_fsqJtA
X-Authority-Analysis: v=2.4 cv=KdXfcAYD c=1 sm=1 tr=0 ts=69331a70 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8bOhFG6ZJRnUmiPb9vIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: PYzMcae6sN3_r90LS42Ck-29S_fsqJtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzMSBTYWx0ZWRfX3SEbpDFlL22S
 0Sbl9PHXp8i+0sg0MOZCYmfkpsQuawZlA5PRHB5bg7lYUqzHPE+58uFHVOV5LA8UAXLlXQaWWZ3
 6Le2Nm/Cw400udqOuqaAKurD+GixYWXxf4K/YcAcBBhzxLQFjvn3nRbUERVNpegrt1L6b4kiDGt
 ir5LxMjBbK/wyWPX7jImiBScVKLLvZVQ+blUVzkiDfZbk2iCt4fabEL2U4FErPfuWVLAHtv4HpJ
 Febs0/xCrtsiTH4abKeJU7naVigYBQoOpEAfe6fKUWcWpb4i8wgz5Edm+kbAAcog03tr93vbvst
 rx7Fz10ENtdvDhokT9nW+Wf0/pYlLPl10TwRhoJ+T5FSFhqr1fG/u63F09BRCmP0Vw+xSTIT9T8
 HD+iL5J5vDbl9MIgxqGAjrYih55u+w==

On Fri, Dec 05, 2025 at 02:33:08PM +0000, Lorenzo Stoakes wrote:
> On Fri, Dec 05, 2025 at 12:11:23PM +0000, Lorenzo Stoakes wrote:
> > On Fri, Dec 05, 2025 at 09:41:37AM +0800, kernel test robot wrote:
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a 34.1% regression of stress-ng.msg.ops_per_sec on:
> > >
> > >
> > > commit: 2b6a3f061f11372af79b862d6184d43193ae927f ("mm: declare VMA flags by bit")
> >
> > This is strange, as this _should_ have no actual impact on anything.
> >
> > However, it seems that <= 32-bit flags being declared as de-facto unsigned int
> > is the delta here, and by declaring everything as an unsigned long via BIT() we
> > have inadvertantly undone this optimisation.
> >
> > We can resolve this by having two types of INIT_VM_FLAG() macro - one for 32-bit
> > flags and one for 64-bit flags and using each as appropriate.
> >
> > I will send a patch shortly.
> >
> > Cheers, Lorenzo
>
> OK, having said that, I've now been able to restore original performance to
> baseline just by making the result signed rather than unsigned :/
>
> I am digging in to why on earth this is the case, will see if I can figure out
> which flag and then which bit of code is somehow relying on this.
>
> BTW I notice reduced system time before patch/with fixup, but the actual bogo
> ops/s values are... worse before + after the patch cited as a regression here?

OK it's not even this :) it's the fact that _somehow_ the BIT() macro does
something funky which causes some imperfect macro expansion somewhere (due to
the (__force int) case). Good lord.

Patch incoming in a second.

Cheers, Lorenzo

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDF222593
	for <oe-lkp@lists.linux.dev>; Thu,  5 Dec 2024 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413044; cv=fail; b=iS8watyPytWTyP7sKpOA/WoOPvDhWQNEQqmQTvkjmuaD1jReRVeoA4suW/n7Mb+gwpPWIflShbcgGAJFv+XvWdt6nk849WlyTqPjI9ythPeMPdD+O4Gdh//P2LvND6EaJfEGKsJvwQ2w6qkrvUrYHQd8bp0bGKZZzfbErOWcuMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413044; c=relaxed/simple;
	bh=quefC2V5rnrNR+KNIn7/56SiXgNz22nNeLYvqRRVaC0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H829UxSG67F1yeePRmLBqHkHwl9pUPYWTOIQhACsQ4WOa/Xe2vL+EzaEEHH7h4DKho7k0TXG6FDDkZS97XjO/kIWzlDs2cI56n9Q/sT3dvdE7zt/gXgS50wwZpsgqsW3nxbHt4qaON8GRQNO2eSb9/2XjQxOTK/+jgAAubOUnO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TkTcDD1O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DJugMolR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TkTcDD1O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DJugMolR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Dfk9D004587;
	Thu, 5 Dec 2024 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Qbvz37xzpD2HrJtCi+rym5X4vOZ7XONdVSW8MIJWTDM=; b=
	TkTcDD1O71y9HuvVFF3hjmfr299T1+kvyCVqa3Y805qVCDbitQAMKrrzdfd3w2o/
	6CPUkbXVW95hYOxAgboj/fESsfh8XNmEwL68pJr3LU/HykAP6nlQFQlo3SGqtnZD
	Gx29bEn1oZnM9we/ii03BpiBuYsEIW1r0KJxCYrgkQ8konkfnG1cDHpGkWZF15NP
	AxJ94Nfp/pNeLvdsYBdKLS5I0RebUdQxum/IncaHd5YuitrscpZkM4T0DIFSb9L5
	/8sf9KoZQ+MbOvbn+ylKG5Hpo3jl5R/c1Lwzf6AmhceH2fYy70Hs7+5oqTm0JcVZ
	v1Hf9FOskLQlWYdJN/CYgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sa03ewr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 15:37:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EY47Z011672;
	Thu, 5 Dec 2024 15:37:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5b1shr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 15:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI9MbcS4/gu+Twn6jqlfEFA23DJdvKLptQjUpZCeYIo5tXrXboal6nXo8xOJ+/DFRLN6/9caa3V545sXluGrf7NU/5L4QIUKvPtXw9H24N1sItvh/09qx6mx+k1m0RIbIRj6nmJX/EnensjgvGhpBwv9Oc2DofduWVm4GXGLyk4Tagy1fmgdv12L8/pbAFadaFvx3KSXg9HXsYZMYY1dYT7x/mv1vr0lQgrqoxDFZkkY0fqBrlwT+KBSPCLznkJjO3UiSdRs/OHwBHnDtyqNVUJB00oaXIVgPx8q1cxJRRzgKcbgtaRH4KQGu+AbzS8it7mfTAdy/QIFch1bYdWZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbvz37xzpD2HrJtCi+rym5X4vOZ7XONdVSW8MIJWTDM=;
 b=n6WUe8P0OWV7YWoXgdkGzEf6mVUBL+3cRqRS6D5kySDYzYgOzMoIWjEUL7PvmVfsK3mBjed6pQaU1zYSQl3EukFbCgsXmRZI92ZWn9wngQA3qkP4LmNBq3fZ1AB4VUaJxuTaAxUitIhF+l6cdOrpc1zJJxzv8TTg+jIqpn3WN6LLSu3VZilHypiGXW+jzIpEaLO8DZB/D3H4AjOBxXtjHNV1GQogj4iCY3gq57Law8nl6hyYM+J089CNGQJbQOGUYiYURcXPrxFXcjNGr8AwQpjMtOvekfHYwh7DOrt3iFu33qX1LmyYUtdAo1ZcFj63TH086dTSmEpM5wfjffo5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbvz37xzpD2HrJtCi+rym5X4vOZ7XONdVSW8MIJWTDM=;
 b=DJugMolR5LKzEohk2wxSvtje+15B9TvRMD0hUxpZbByE7REdtQcGAGGn7CCMU2/DwZGJcU7h6Aqsvg3AY4u3B/YxtZdVA0Kc20foFEtLfU4ALmYSzsa6wpbuuYsNZNE2jobOohxgbJvvc87D66o9uERDum8BqDYjXnPatWpmcoU=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB5562.namprd10.prod.outlook.com (2603:10b6:510:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 15:37:13 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 15:37:12 +0000
Message-ID: <5fa3f3cf-2f95-4f0d-9625-8a171a10459f@oracle.com>
Date: Thu, 5 Dec 2024 10:37:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd] b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com" <lkp@intel.com>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
 <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::11) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH0PR10MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f21452-adb9-4f34-9ad8-08dd1542b00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck5MMVNZKy9hcVhKbFFNQ2J1cWxwVnAwamg1WnpxaUszSVUwb1lCSVZUREZ6?=
 =?utf-8?B?S2FYbUluSWNtNUI2QmlJMkpyLytic3VNSlJrSWpOS3Z6UVc2c05ONCtIZnho?=
 =?utf-8?B?NlVmY0VoRm1IYWNLRkRwUTdkRnVWZE1kSXJabG5BQm8rTStXaDR4QnczSWZl?=
 =?utf-8?B?cGV6MlZsNVlXcVBRbVdRMEZJQlQrbXExbFBjb0dIc3ZRWFAvdGJ0Q0xjN2oz?=
 =?utf-8?B?dzRSa3FRKytEK2JCRkhhWVphSUxneXFuZlpTUGltZzE5NkJVS2dXTjJhMGVv?=
 =?utf-8?B?cFdObFR6d1FDNkdYeEMwaUxKNmxJVForM1JmNXhhN242Wm50MmwvQ2FSc2Zx?=
 =?utf-8?B?QS9ocHVXSEhLK0c4ZmFGOTVmVlVTa2RRVFFQNE5WRFdFWDRGRkN0MDZZRlNs?=
 =?utf-8?B?SXoxclZrSGdTUXFjRmR2cHNxRUR6Uk9xc3V2YmJrYk9OTEcrMWJqMHVORmJ0?=
 =?utf-8?B?M21KQlJKUnFmN3NPODFxRGFhdmRraGxhbFpQMDhZK1QrT2NBSkwyVzQyaVM5?=
 =?utf-8?B?L1VxbXRZRm1jUTBtVDlnTjVPb3luRW4wUGZsaStUNlMwYTUwSTFQdWV6Vjlz?=
 =?utf-8?B?TGh6SzNMTk5uN2ViOWE0QkYzT2o3RE8ybW4wZmQ1Z1JQTFhHMm1KZGJURStQ?=
 =?utf-8?B?RmE5UXpnS0xOVlQ1MEdRZHl6VFdmNW9yU2JjWXJya2U4Q3lTSVQrQzZiMlFT?=
 =?utf-8?B?aWdqbGVJa0R6LzJERjg5dVBTZkdnRTFITGJsV3BEaVVzV2RjOEIra0UwSlJD?=
 =?utf-8?B?eHBMMlhQSHYxQU94eHYrTnRZZjVDMnFGQXJWcXZvQ1p0bjZhY1IwcEFaeEN5?=
 =?utf-8?B?K0RSSmhkWENJa3FvZ0swckxlVkJkN05FaVpCUElXT3VsTmZ6cHZGaHVscU5E?=
 =?utf-8?B?WlVCbmFrOFEzcUdTVERHTzNTNHZWaXRIdnhvRUhrMTBCMTh1Q01lbUpzMGcy?=
 =?utf-8?B?bVdPdC9oYzVyRktOdUN6MGpxei9FQU1XTVhOVE43Wk43ZGM4STh0ZUxHZHBY?=
 =?utf-8?B?akRVUHNnaVpxWTFPV1YrekQ1UXBXeXJsYzJ4Z0VCMlBENTFkOEIzU29XL0Fh?=
 =?utf-8?B?UmE1VW92UUQ1OVd2RUVoeVF4VnZ6dFB1M2dldGdjYkpLNWNkajJWVXZpdmF5?=
 =?utf-8?B?eFBiUkYwcEtOeFpnRTJOOXh6NWRyclpSck8xSkZUUURXQXdOb2oybWRWUDJM?=
 =?utf-8?B?dzdKNVEvclZRT1NiUG1kcEg4anErSFFFWWVrcVBkWTYrNzZBeWJVV05Zc2l0?=
 =?utf-8?B?QURTQzZtQlZUUGhiV0k5M0tzVzVTVGxYblNZa2JIMHpQYkZwaUJ0YlA0d3lT?=
 =?utf-8?B?RlF4MmJPSEZhTjZHT29xQkxQb0pqak1oQU05NXRwWXNodUFSUno1VzRHUnlv?=
 =?utf-8?B?R1pLeXVaSmNYZ09iZGNFcWVWRUE3Y05kdmxVQlZ3M3FrZzUzOUtxb095L044?=
 =?utf-8?B?SSsvVCthZFFTY3U3b3RXZDdsYVFpeDlDRE44cERoNDdCbmZ0SXc5cC9JM2lp?=
 =?utf-8?B?SG5lUFRhbk01a29lYkhXQUpHL1FBK29HZVVkclM5Mzloa2ZrbVJ2NkJnYWNw?=
 =?utf-8?B?Q0VYTlkzTlkvUEhxR0pOZW1jTWhXdStnL0g1SGZ4aDM3cFlvaXlSQUpkUnRJ?=
 =?utf-8?B?NmpVMENNajU5YlJMYTcrc3ZtYzUwT21QRDIwY2NmK0diYitwYVQxNTJrUE9j?=
 =?utf-8?B?MkZwd1l4NHhXbWM1K0hRWmI5Yk9pWno2REYvLy9OZHhWUGNVcnZFNDZ3YXJl?=
 =?utf-8?B?Zmk0cmttS0dubktldFBtMUcwMVhzWlYrQnZsTHl1WittUkdNVXZHTm4yRTR5?=
 =?utf-8?Q?LZiAT16N5O6/9C9uneNnBFhnJdrOoQoTH44ys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFg5bXZaem92VDljczRiOUpNbjdFdElySWtaTERlMXlkeENXK2V5MU9kcjJy?=
 =?utf-8?B?ZDBmUjZWRHg2WmVGSzlQYlhrRUFzclEyenZaNlZlTHFERGM4bGhtZVhCL0F5?=
 =?utf-8?B?T1l0enF0blhzbVJ1N0Z0bFVmeXZQUE9SOExpOXNoU0JCVjN2OVVFU3QzKzFZ?=
 =?utf-8?B?WE9MTm5PTEVtcE11Um4vb2Z6bVZnTVNvYjl5WDl3UHNsQ2VKaXNDVUptdEIz?=
 =?utf-8?B?djA5YjA5S29uWDE1ZXBYTHQwdXQzU3Zib24xRmxESThnUkpadC9PZlh5Yk9a?=
 =?utf-8?B?WVBMLzVPdk95T2ZWL3prVHY4NEtYR2svTEZ6YWNpcnY1c0I4VGVyUm5XUjE0?=
 =?utf-8?B?V29wOFg5L3BXczR1Z1BndVVVcS8zQW1zYTU3cGhIQnhIYmtNV0EyMTdVbG9M?=
 =?utf-8?B?ZHBtM3d4d0xiZFdYQXlES0J4Zm9YbDdtY09QTElVeEFsMUJEMytEcG9IUnls?=
 =?utf-8?B?OGRlN0ZwcERMcmhTNTEvS21tbGtIMUgzb1RCM1E5MkdMQnQ5dDBxajNhT2h6?=
 =?utf-8?B?bUlMZkZPSHgzUkl5enkxL1hCbW05UXFDenZqSTB0WURRN21RdTU4SUF2U1Mw?=
 =?utf-8?B?WGFZWmNocDgzUFBuMnBmdGhaU0ZKbUZvVzRVZVp1VFFzN3hCMENTaUhqcUV4?=
 =?utf-8?B?Y1BTU2l1cGJQOHRLS0ZyOUo2UW9oTk5KcUtZUTZid3p5WkpHODlyVTRKY1Zl?=
 =?utf-8?B?TDliTnQrM3ZJSmF5TFh2c0lhZmF2YWxxMVUxRnhOeklacE1ia0t6a2NReXlr?=
 =?utf-8?B?K3h2eVFkcnN3SzVvdy9LT2VJWGEwMVZ0cUZKZVVSQ0p0ZFhYTlFkYW1kMXBO?=
 =?utf-8?B?LzdNRCs1blNKMm1kZk9OYlZnc2xIYjl5UWJabDRZeFlFOU5kQ25PcTVHb2lH?=
 =?utf-8?B?NlFmekR3UDNka2xhWUpRY20vMGp3b3JUdnlicEFETXNNakxQeWE2VlZsb1RH?=
 =?utf-8?B?anZLSlZBN0dpRHpISFhYNnpYL3ZNbisrdC9XQ3MzQ3Z1MjdGVEVWNVJZUENk?=
 =?utf-8?B?MnI2QW1SZ0R2WU5UbkJobktRdFkzV204VHIwZmxqbFhPakxWd2MzWHNpeDhr?=
 =?utf-8?B?TTlyVkdRcFp5WEdTTFB1aGFvQmNwOVp5YUxvV0ZreXM0dW5ycURoTWc2Tm1l?=
 =?utf-8?B?UEdhYUw1bHcvcmZEUkdKR2J3dmhWdmJBSzR0UTFUQ0dvMnk3OHQ1VTRNQU9S?=
 =?utf-8?B?N2tXZEtXUDBXcHd3SGd4WS9BRFBXRmw2RTROTmpFVjJ5SHVBSDZacmdta2V1?=
 =?utf-8?B?SjE2N2FRTFdWUUVKOGZIeTArcEk5a29qZ2J1RWYzZEpaNmlzN0RvSlZyTlg1?=
 =?utf-8?B?ZkxyQ0t5aXN3UlEwMHU4QUlJSm9nZm1wdExsMG9mVW0rWmlVYTdhRnk4bjhW?=
 =?utf-8?B?aXE1RGtzNGhUZC9WeWM1VDVqYnZHWlRmMDdZWVl0UmNRYUk2TUNRZzlXZUtB?=
 =?utf-8?B?U2FkeE8yK0VteVVPdk9rbkVZV3ZoOGcxRSsvSUkvMzhmU0pXKzloMzNTZHVF?=
 =?utf-8?B?akVnem81bE96VGM3elBlTkJ3YWxiaVk5NzhjaVNrT1pqcTJKbURMSGZDQ0E5?=
 =?utf-8?B?RGFDdkMwSzdsR1lxeWhnZGV0dUx2YVlQY0I1aDV1NFQrNWdqVFcvSXB5UjNN?=
 =?utf-8?B?RXgwTlU3WXJ2UXFLS0dQMm9iR1dqcGk2NWNxYTVMKys2RlBqYVNFUXBGT09D?=
 =?utf-8?B?Ui84SEVsVlduY1YreDRwRWZFNks1WGpqYU5IV2N0TnVyeTA0eE5FWkVjNHpo?=
 =?utf-8?B?MkFQWGNveXJIK2NhRXhBZ1Brb0pEaS91NEpjV2FwSDE3Q2lEL3FNTUdJNFdo?=
 =?utf-8?B?aHAvdS90KzM3NE9XY2IzRTR4UzdpSHpxcEcyR2lXd2VTZGVzbnpEeUY2SjRG?=
 =?utf-8?B?UHJMOXBKV2s1ZWo5dUVOQWFOM1FvRm9Yb0Z5SjVmVkNJK0NBRm92UDJnNGlY?=
 =?utf-8?B?TXdsSW9GM3oydUdyRnJYL1hYcDlWUGxlQTNXblJSL3BGaFJRYU9kcDZIOG1M?=
 =?utf-8?B?dWRvVE16U2JNZnd1N1lqNFNNSDhaTmFkYXdUUWZmdXd2U3V1M2ZLMWthelVy?=
 =?utf-8?B?VDhIWWhCbWRVek91eFlUSktPVXdOY2pRNGJiZ1h6N3U4QzZha2JteWRmNGVJ?=
 =?utf-8?B?RGdMVFIwVUFwZCtLWUh4L1lvZHJsajdEdHQzdnVHOUQ4cU1ldlhsZllaVlZo?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GaBThoPdt4t1eKtZ6MW0rYMwY+NwuAxqp9PrZo9uLZC5k3Lx0e3SQakh7c8H/ljiBODGION3/80tyb6rBLmnCZ0jstNDQjreNG+xi0mGum6bs8AasVIpV2Z4uCq5hu2V5eGJWe/GFK+hufXD+ZH6fk1/DJThPYf23mjo56pEVYKb+xHtPGeobh0/O3ep35QGCMGtUkueDB4xcxZVzLtOAwdUZZQkgcsg0jLRN/NCMJD8B8OzrBNAy9WHn8k925R45Is2Mpk/1oL2exHux0hFY1MXAElHPtROi0divSbc7EskIR/XchiBphwn1gw/fKZIGlOxqL1F84RPDpOFoddwTkAITRA/TNHTQPiZJYUUOpK6JonZsUKhQt8ulmhu3BNPomE2zQzkc9HcFvdEShv/cfAcVL8qgZxHxORNjMGbwffDdROgK0nNME7X+5t601soxHklTp/Bd8QS09Q87XYGTtOv+0LaVmxMVGF54WEmoBVFDLNU2/A9iw/zJgFwJ2ubowCAEVDoPnZBUStoCfYsalktpR8/rxFHwWegp9MNH1ycb3soxjKeKKpXzsq/P6b2YK80AJKZyWzl45y3G9IXFMi//E4nx6/YHeN8DZRps44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f21452-adb9-4f34-9ad8-08dd1542b00c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 15:37:12.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgHd9CCFcZTYIqwcqwZacPLdSYp41CPm//kVFkV64PDQ6yE9zN5BObHerD7X4VTOUyQ56nzOakERDWpybbTV7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_13,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050113
X-Proofpoint-GUID: AFNH1KWgUJjDiazmObtgeV9v2hKolvWI
X-Proofpoint-ORIG-GUID: AFNH1KWgUJjDiazmObtgeV9v2hKolvWI

On 12/5/24 2:27 AM, Oliver Sang wrote:
> hi, Chuck Lever,
> 
> On Tue, Dec 03, 2024 at 02:54:47PM +0000, Chuck Lever III wrote:
>>
>>
>>> On Dec 3, 2024, at 12:01 AM, Oliver Sang <oliver.sang@intel.com> wrote:
>>>
>>> hi, Chuck Lever,
>>>
>>> On Mon, Dec 02, 2024 at 03:40:49PM +0000, Chuck Lever III wrote:
>>>>
>>>>
>>>>> On Nov 18, 2024, at 2:53 AM, Oliver Sang <oliver.sang@intel.com> wrote:
>>>>>
>>>>> hi, Chuck Lever,
>>>>>
>>>>> On Thu, Nov 14, 2024 at 09:37:30AM -0500, Chuck Lever wrote:
>>>>>> On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wrote:
>>>>>>>
>>>>>>> hi, Jeff Layton,
>>>>>>>
>>>>>>> in commit message, it is mentioned the change is expected to solve the
>>>>>>> "App Overhead" on the fs_mark test we reported in
>>>>>>> https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
>>>>>>>
>>>>>>> however, in our tests, there is sill similar regression. at the same
>>>>>>> time, there is still no performance difference for fsmark.files_per_sec
>>>>>>>
>>>>>>>   2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
>>>>>>>     18.57            +0.0%      18.57        fsmark.files_per_sec
>>>>>>
>>>>>> Because the most recent version of this commit does not appear to
>>>>>> address the reported regression, Jeff suggested dropping it. I've
>>>>>> done that in the branch below, which is being prepared for v6.13.
>>>>>>
>>>>>>
>>>>>>> another thing is our bot bisect to this commit in repo/branch as below detail
>>>>>>> information. if there is a more porper repo/branch to test the patch, could
>>>>>>> you let us know? thanks a lot!
>>>>>>
>>>>>> The proper branch to test is:
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-next
>>>>>
>>>>> thanks for information! this repo is under bot's monitoring.
>>>>> unfortunately, our cluster run into problems these days and need some time
>>>>> to full back. so if there is still regression reports, maybe will delay to
>>>>> a later time.
>>>>
>>>> Hello Oliver -
>>>>
>>>> To avoid regressing v6.13, we postponed this series.
>>>>
>>>> The series is now in
>>>>
>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-testing
>>>>
>>>> And I would like the robot to include that branch in regular
>>>> test runs going forward. I will try to push new patches there
>>>> first before pushing them to nfsd-next.
>>>
>>> got it. this nfsd-testing is already in our monitor.
>>>
>>> 07b2337dc158fb (cel/nfsd-testing) nfsd: add support for FATTR4_OPEN_ARGUMENTS
>>> 54b0e9c3727d2f nfs_common: make include/linux/nfs4.h include generated nfs4_1.h
>>> fcc756b92ce832 nfsd: fix handling of delegated change attr in CB_GETATTR
>>> a354743d35b49b nfsd: trace: remove redundant stateid even deleg_recall
>>> 40384c840ea194 (tag: v6.13-rc1,
>>
>> That's not yet a complete set of revised patches. We'll get
>> there in a few days.
> 
> got it. thanks for information.
> 
>>
>>
>>> at the same time, I triggered same tests for original report upon 07b2337dc158fb
>>> and v6.13-rc1, will update you results later.
> 
> if just comparing 07b2337dc158fb with v6.13-rc1, there is no big diff for
> fsmark.app_overhead.
> 
>         v6.13-rc1 07b2337dc158fb33e7af288b74c
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>     3110649            -1.3%    3070867        fsmark.app_overhead
>       18.58            -0.3%      18.52        fsmark.files_per_sec
> 
> but as above, seems the 07b2337dc158fb is not the correct commit to test?

> we noticed it's now
> 
> b95256b0edb43 (cel/nfsd-testing) nfsd: prepare delegation code for handing out *_ATTRS_DELEG delegations
> 77152578a5c16 nfsd: rename NFS4_SHARE_WANT_* constants to OPEN4_SHARE_ACCESS_WANT_*
> 019cb8ea1e9d4 nfsd: switch to autogenerated definitions for open_delegation_type4
> 07b2337dc158f nfsd: add support for FATTR4_OPEN_ARGUMENTS
> 54b0e9c3727d2 nfs_common: make include/linux/nfs4.h include generated nfs4_1.h
> fcc756b92ce83 nfsd: fix handling of delegated change attr in CB_GETATTR
> a354743d35b49 nfsd: trace: remove redundant stateid even deleg_recall
> 40384c840ea19 (tag: v6.13-rc1,
> 
> if you need us test b95256b0edb43, please let us know. or you could request us
> when the branch is ready. thanks!

Earlier this week I thought I had the full set of patches to
test and could just apply them on v6.13-rc1, but it turns out
that I don't have them all yet. There are one or two that I
broke while trying to prepare for v6.12, and I've misplaced
Jeff's originals.

I will let you know when that branch is ready for a retest.
Sorry for the noise!


-- 
Chuck Lever

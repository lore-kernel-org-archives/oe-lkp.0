Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020096.outbound.protection.outlook.com [52.101.191.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D23314D1
	for <oe-lkp@lists.linux.dev>; Tue,  6 Jan 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706795; cv=fail; b=f91VPHsN46U6jnwqNEJclm3ztgXgrL/P5oWr2Ik0LoDxeZsqpIHSUDHKF5sIDEIUM4dQJawAfFzm6cgYfoYEl8yzoBpRSB0WWFHlEPstOr3BsR5GI4fKXylwW7EF0Xsujn2Bsh0C5eSNmhiHOinRlW5AvpxbhyEe2BnRg3NzrZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706795; c=relaxed/simple;
	bh=YlPDuK7BPxIHuKfp9TvTm9AaL6hbMFbsX2vCGwrbt6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IhyP/rnswtpcC/u2c1tbY+aiFIt7XeH3jiS9WNRRmIOjXL8VBMsCtqyBtFhkWenFwBDKKxD8rIur91AzFBfftrJEjO76hSjfSdQaqz7XlQe3I9AqaJa8NRBOxLkm/L3gKuywOoz/UHIgwxRSYN6ux9JcZ7QKqHjjzvdAXktO1fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=Qgk1DeeC; arc=fail smtp.client-ip=52.101.191.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Qgk1DeeC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLGCtFrovdkq7lnGTUOczLeaC2foGL+2yLUdBm/CjjKYNfB/e5qI9f00Q6Xbx7oe4yzCibT4fvc+c+ztZ8/s4kbwSbJDBw3N5vqt06M/bmVieUsTjTxrrS8yuZS3j3G8pMiU/1fRnV3VOz4Pl4fx+jAJ6XRSniszbDx1tV2YGsiRi5Bz64eGx/WRvgTQtuWvHAOqp1leKh0TTWpZIyVSdf442LNBuZ4JHWj9Eruy0pvDElG/Ta2p5XHjghk+JwFgzJLJe/K24dZo4pTEsL+9v2p9wb8/3MCubP7NRilt3koAxgje+jLbKmGDFRPr7nG2EJAG2jz4qWTHkeu7+XbdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfU5DTwfaOeKzPJ7qtoekkfDYmGESXtaBRBuJrS1ReY=;
 b=YN/Q0sbQ3b6tIWSlglmi7nCkkiMx8EgQiAnDU/TAYB0uAfIc7jWOzbyAc8lbyMv79HulQDw1kq4WYCn4FxkCtnkT3ttoxoXuxBKYmE80KV05dnlTnUywiIrcJGBkBq+WJfIZVRG6q89asiiPIEhYfJdJ5vGO/Ec34aTwfd4jjPXNlZAGckHowRCpXNAEUOx2asoMG3Bq0beDjcfVNdaeitF/euBYavnYArSIJASyS6SJYC8wwDtCTgLIGcHcnmHsTgcFCqZz679LM4G8jQ7yWVPBWTnJT+HgqCgitBjqIY572Pu7XDsATHiq1RVy0WhZusu2RvfPVcVRt10Quvm5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfU5DTwfaOeKzPJ7qtoekkfDYmGESXtaBRBuJrS1ReY=;
 b=Qgk1DeeC58x2abjNvkFsHRYmQLRgybTHsmQ5lD/JNjw8E2cFaAy+5hq3CFAlhowHy8DmfcGPNtMHGZJntDMIE9hqZXeB4puskjAquxSus372PQO8cnx8m+B3TFRviFfjhuZy0P9NXhMq6hRZplZuE+3MYsPYr0+XyP1nrKghT09t+vgZFSHJcZ2xRoOSQnDTvBt8G6VHIYLHEJtVPD9ZGs8pygkBOCj3HKXAHpwFfg9c4rtmFBCyGowZTCK5OOWfEUqtTRNXkKYyxv6A9sHGPYX9wDQ7Qs2mviiX5rbDvZrp4iKGeqso0Ojkx2xca0AwmWQYOW11QPof2r99ryGEoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a0::18)
 by YQBPR0101MB9934.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Tue, 6 Jan
 2026 13:39:46 +0000
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31]) by YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 13:39:46 +0000
Message-ID: <2db4150b-2608-409c-8d15-ced64964c2c5@efficios.com>
Date: Tue, 6 Jan 2026 08:39:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [sched/mmcid] 77d7dc8bef:
 will-it-scale.per_thread_ops 10.4% regression
To: kernel test robot <oliver.sang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 aubrey.li@linux.intel.com, yu.c.chen@intel.com
References: <202601060955.b7b9ad22-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <202601060955.b7b9ad22-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a0::18)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB9171:EE_|YQBPR0101MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e453a4-93b5-4771-0062-08de4d290e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3VyQjVuUEtrRGU5NFI1UXFDaW1DbmxiY25FVWlsZHF3REI2WU1wZnRweU5v?=
 =?utf-8?B?Mmk1b3hXd2Y5NUhlZjhoeDczNGpBNzBCMUlpOUpRdXIzbWd1d3ZHejZDWnZk?=
 =?utf-8?B?Qm5hd3pWOExaR01GamdUaWRmN0thL0UyM2p6TnhhV0U4RUQ5TXVjZ2F4Y2J0?=
 =?utf-8?B?ZTFWRkcrMXVjMFRHRkFXYXBPV0k4MkozOEFDRjJPNTY4NU9KbFBFUnFidXp3?=
 =?utf-8?B?N0QvYUgvdnFJYXhvT3k3N0dhNHJ5S0FJR1RtbDJ2azJSWVFubkFKUjhQZy9h?=
 =?utf-8?B?KzBFMkkvaTZuOGxjTTVqOEZnVlZOZ1gwQlQ0djdWeHVORWVzZTFWMkZqTWQy?=
 =?utf-8?B?dG5UazZOZ0U1KzhaNDU3NE11dFJtcno5cFJ2R1EzM2IrcVNWalZvM0lBNUFV?=
 =?utf-8?B?dlNFNmdrMzFpNlc0RzdjS3RPSnFqUDMwTWFqQ3czNDhhUElaMjhOeHNwOEdL?=
 =?utf-8?B?M3p1QkJKd3UrOXhNVFo5UWZjZFRSZlUxc1hHQlF4c2dBbUc5akRLT0FkS3Nn?=
 =?utf-8?B?aG9ON0RWdXBLTWkraGhVYjgxZnMybmsyUEtvdjZMYmd2T1JIQStWN2ozL0Rj?=
 =?utf-8?B?bTlndHRzVmFNKzFCekk0aThlbUs2c0xpMG1qUGNDeURaUmM2T1VvL1JhVVNr?=
 =?utf-8?B?NElaVzJ2MTlaaUFZd3BiMVI1ZVc3dFhwNEIxMVVZUVNXYnVIV3BWQmRwSk4x?=
 =?utf-8?B?VXpESjNidS95MGdtclI5MlhrSHVUdVNibXlKQzZFUEVkMDhxZ2g4aTFPMGM5?=
 =?utf-8?B?Mm5XSTlBd1JkOVQ5OE53d3d0Z01pVGNXOEZheFNaTHZwdzF1b0ExZTEzajlC?=
 =?utf-8?B?aXRBK3ZLN3JuRGo0Tktya3V1M0NQc0dSdVJkbmpoU2tWUkZwZ2l5WFROTXBF?=
 =?utf-8?B?WGhSbUx2c1BHeUNjeFNXQ2dPeEJKVGYyUEZzeC9vVE5OVmZJOURlZTZMVDBM?=
 =?utf-8?B?K2o5NkViMWJjOFA0clRpeW9lRnlzcVBqbEplNTNlMTk3NzRzMEEybEFHdHJ4?=
 =?utf-8?B?MGdwTHNqODNxeE80L0twaGFEY0dhZFdET2NxWnNtaW13VS9EYWRKZnFPdWh6?=
 =?utf-8?B?bnZpOEFpbjFNcCsyMUp6NWpySG9VNHNqV1JpVVVPVUhaRFlMeDliQ2MvWTly?=
 =?utf-8?B?ZXg0V0FjYlRBZ2RNNHcxOU1pbWN2NC8xbkRoTnFWUGgrcktUcEFFQ3F3MXVL?=
 =?utf-8?B?VmJraUNDMVlINVpXUWZCMjlHMld2bzBlN2JnS3FtbG9lS1IzMXRuYndQL2h2?=
 =?utf-8?B?UW1UbEVBalhQM1dGZ2pnYnQ2WTFZV2NzZWZDWHJ3ZFpjQTdvbXIwczVJa0FH?=
 =?utf-8?B?SjhNS3BoTFQyQVV3elRHM3UzalVRQXdydDQwRVI4QlBpdzQwcTlrMjVlc1R4?=
 =?utf-8?B?RUZaMmJkN0JkREw1MGcrNXVWV2xEZEhCc2VaSGJqRHBUNmJoa2dBbUtJaVA1?=
 =?utf-8?B?bUZwOW9mZWNBeTNMN2ROdXhER2pzU1daS0E5YUZOeUwzb1c1WkluWk5PWlA1?=
 =?utf-8?B?dEpUSDVWdkRqeXg5N3l6YWRGR3VkekJVUDJLT3pHNWQzWUxqOFpTZHdoVFBm?=
 =?utf-8?B?YXV3OHhTQzhNdEx0L3JWUXk1eXVEek4rd0JWVFZFb2VxcmNvLzBab1prRVpl?=
 =?utf-8?B?enY2TGFqdjNIdjFBcEtucXBadVVTNVRYeW5wUitrb2pEZ3FsSytmZk9lUTRH?=
 =?utf-8?B?R3RXMjJXN0dmZ2dtVEI0cnhGdDczczJteVIzOTN2QjQxNUZzMnBOWWx6UlRm?=
 =?utf-8?B?U3lXV2hmdTRPVGpiVGR5WDJkN3RhMmZmWldWaWJJOUxQOTFDaEN2OWZ3Wnhw?=
 =?utf-8?B?ajRIcW0waDR6L3JoNHVJRXB6OC9qL2xVTnZUbUlCZnpCL2NZd2Q4WmRrejJX?=
 =?utf-8?B?TFdxQ1FoNStMdlphZnMwLzRjb0hJV3pRbC9WUnB1bk44dkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yythc0w1SUJVT3k0QkVqc1ZtUVpUZTBWNDYrT3ZocTRpSTQ1VGxHK3AwWXVt?=
 =?utf-8?B?bERqZ0ZpcG1Tc0pFc1hZUGgzUmlnOTlTeiswa3ZUQjhoUmw5QmFBb3NqZlQ4?=
 =?utf-8?B?VTJ5bDNoU0IyaG41RCtKOEFxSlVWOC82QWlzTDJ1Yjg1aHlBblBGWWRtYXJi?=
 =?utf-8?B?VXBaYW03M0dmanNNVUVkdis0Q0VUdndLRzlpMTVYbmtsNEJQZ0FEZjAyenlR?=
 =?utf-8?B?RjBWS3JKNDRsSHdlaFUwaVdMQUs1T2orcTBCdFVPV2w5ejJUNEFReEZER21K?=
 =?utf-8?B?UEZBMVQwbS9na1BRWHN4OTN4eVFKUXhabkN6Q2VvbmNJYnNHY3I5YWdQdURq?=
 =?utf-8?B?UnFMTldFRmRRd3ZCOGpQWkgxZFNqWXBna1BpMGloL21QSkVwU2ZCcGpJNUZC?=
 =?utf-8?B?R3hQeFpIVDhIOW8yN3VRNmhUTlU3Y1pzMHdYTmxQZ1ZZSHkzVG9NUDg4WkhS?=
 =?utf-8?B?NTRzamF5SFRoUmlMZWp1ODFiOUUvSjEzNEtXNGV5U1NaaG16NTVxT01QLzBN?=
 =?utf-8?B?YkNjTlpJOEZxd1RRakp4aTE5MFRyWFFYb0JYSndidXVsRXd4aDVKeUtiUXFX?=
 =?utf-8?B?MDJwZFFISU5aMmZYMC91dGQxK3ZXYWgxa3VjWGpNbVNRWDZ2U2lmNGw2dXE0?=
 =?utf-8?B?bTg3Z2JNN09ZOGFwU2dtcVl3NklkWGhpWCtBTnVhbk05Z1QwcXZkZExQT3lu?=
 =?utf-8?B?RlhBUHVaN0NmbmUwT0t2OWRLdmJOenhYRVRId1pFcWJWRS9oSVpqeS9MekpW?=
 =?utf-8?B?N0doOTFoMEgxTmxGZjc2YUhzUjl4R3BZbUl6MVd2d2ZKWEpRbDJZNUtUelM2?=
 =?utf-8?B?YVE5ZHh4MHNKTWFpWUNFZ21KUnc2QTJLWnROYm9rUUt6SGZZelM1ODg4M0RS?=
 =?utf-8?B?N2RWbG53cER2T2F0RyswQThzcFFHUjVYWE9sc25PVEYxVjJ2Vjc5VWVuV2tL?=
 =?utf-8?B?TFhkT1Z6bkJVM0Jra05pdDJCMit6TTVCdDNpT0dadm1wL2xYU1JqdGJuNEpN?=
 =?utf-8?B?b0M1aWQ4NnZiYUxRQTQvaG5qRWdRWjJaUEordURiWjZtL3BjUGFlaWd1dGlP?=
 =?utf-8?B?UVdJdDZ1NTRHbXJhc3pkV1ZCdFYwbW5nWlhQRkdxU0Nub0RXN3ExOHJCaFo2?=
 =?utf-8?B?N0E3VlZlZ0N4OWNkVzRyaUU3Q203djdxRnl5RUpyelRhTWYyS0p1NVZzck55?=
 =?utf-8?B?Q1BVMmZEUUlaYWRzQ3FWL3d4eHk1TFFKUFV1MHFsQnlLWE1MVjVVeVErL1hv?=
 =?utf-8?B?NXhpaEgwUzFLcFMyNk54VGpjSnV4WEpxVkI1N1lWQ3IzZlpNcFNvTjU3bncx?=
 =?utf-8?B?cm9lNFFPZnVWMEZMNllpVGlBMVRFaDI5eEg3czlreWtkQndZdVVYM3BYaHY0?=
 =?utf-8?B?YXI4VFNSRFUySjZYQnlmbUorV3U2eTNlL2pwYnlFdWJtN080aWhTM245T0Z4?=
 =?utf-8?B?ODIySmZ0ZnhzbHd5WE11RlVGL1JFS29xUW9nK1lOYkorNFJHMTdrZ0QyVTFI?=
 =?utf-8?B?bTNaK05IWFZodHgvVy9YZ1JaUlBtZnkyWVpTUHZyZU1YdWlzOTBNWEtLSXRE?=
 =?utf-8?B?Mmt2bDB2b2xTaFY5UlJjZnZRZGt4ZWlTL3R0c28xb3lpNUlVQ2ptSTFrVTdU?=
 =?utf-8?B?cEhBME1vck1UeG4raWVvYUxQc2JEZnhsZWlsVENtSnlsZHFIQXI0ZWdUaUlJ?=
 =?utf-8?B?VlR0NXZQZ0QyZWo0M05Od3Q4U1M1UEtKSkNnNmxxR1c1TjBqdWllbXA0MDZ0?=
 =?utf-8?B?SFhMZ2IzU0x5dGZsY25nWjM0NndXdDl4ZW9FUE5VbWtSNU1VVEtrU3pudGdS?=
 =?utf-8?B?MW80WW9JN1BDUzFpeXo5cUZHdTBWTVVZeUVtS3FFZlNNSDhsZHlwRkNiUTF2?=
 =?utf-8?B?N2Y4MU5vWlUxYjBlSHlpS3orelM0TTZzTkgxL2ZDUjhCcE5FRExPSjF2MG9u?=
 =?utf-8?B?VVczM29wQlUzMFkzcEo5VGdFZ1ZHdVhadmtUeWovWHBiOEtJRkZ0dHU1UGpq?=
 =?utf-8?B?ZDB1ZlJwMjh4L0x4R2E0K2RYN0Zlb2xVa2VNWXl3ZkJZcWk1SVM0UGRqRDNo?=
 =?utf-8?B?NEIxREk0bnhtaW50bitlVHhNTk5UdFRYMXNrRHhOTDRKdktHTkJEbGFFNnNh?=
 =?utf-8?B?cWxQVE5DZzN2SGdpMTM5cWYvYjFqOUFML0xzanFTVnljQ3luci9HWnlCaEhj?=
 =?utf-8?B?Z0hiNmhITEdTTjEzZlo2NDNiSjM5YWl1MFRsNEt5TmVEVjZ4eHFzNCtiSVlF?=
 =?utf-8?B?OElPQTdmaE9hbEtaSHlsQS9BQzhuQjdUNHl1SmdpL3RPSmtNbmkvTjcySnRZ?=
 =?utf-8?B?SGpNblQ5c0V1U1hxSHlVZEV4Z1ppMHJ5WE44K0NNWmU2OFR2OUt5TEZtbSs0?=
 =?utf-8?Q?Z+fmBxF8z8tvsEgw=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e453a4-93b5-4771-0062-08de4d290e16
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 13:39:46.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46lnlQwfoTZHjKOYzuhpGSklXSDZFm4E7OpH9MQi4dJLoF/WbGFl9zXZ8gqfcB+XezEaaG1r3bHCA7+RUeu5rel2WXFeUCZ+Hrx6L5za7tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9934

On 2026-01-05 21:15, kernel test robot wrote:
[...]
> now we found a regression in will-it-scale tests. report again FYI the
> performance impact of this change in our tests.
> 
> 
> kernel test robot noticed a 10.4% regression of will-it-scale.per_thread_ops on:
> 
> 
> commit: 77d7dc8bef482e987036bc204136bbda552d95cd ("sched/mmcid: Revert the complex CID management")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This is expected for this preparation patch (revert of complex mm_cid
management) from Thomas. He then builds his new implementation on top
to reduce overhead, but in a different way.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

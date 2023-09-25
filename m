Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6A1C283
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 15:24:50 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PECLvV022722;
	Mon, 25 Sep 2023 15:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=Zf/gJ51+45Xt1O3Kel/2zU/voDfS8c1E092qnIlaTZA=;
 b=OM2B50Z38wXh0L7pRzb6hmatgs0sfde0Z5AISlQdC8G0/prt80rKSAYCH8h4TJ3NJAET
 8C/CJddq1sMvflO1CJtwcw1fdRgAoJwEkCgnrEMS4N+oViE0KQrPp8Ijt5pDYch9aHyA
 5zwTzA/VPzAYo7bMcnGlkFa5PHFVur+RFv8/5YHC2/vABXOUWYWJ9KAw3VvKRzUR+hW+
 //+znS/g5UEKtOSquoNA+gYxmW3N4eHhPicAbnaQmrHV9WviO0w6Q+jmSe8DxfUOQQ4K
 dSfxPtqu7iGGCpaAf+cZjOsrKdRjqZn2qve+TpTY0TeSjnER+jISsa0dg8GnpT5syNks HQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9r2dc0jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 15:24:04 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38PEFLJC003331;
	Mon, 25 Sep 2023 15:24:03 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pf4u7dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 15:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMu+c0c5oMmQjitaG/eSW046q8dE+k3U8DaO9Vpwe1BKFX0vJJ/DMbLNjN7oC8ACk1/51AVEj7Dz2kNrkd+oidtR8n98DHLJi1Hr21/jZDbUfBru/vCrKahYZbZzQIz0IOIxo1+Yupf+vCAcRWVB4E8MMr8L/cjSs03SDaSThttqkU+G8C8mOBPQOEvxIC0Ecp/Q537hil5ZqjeWKjreRp9TvUYq4EsA+c8iv0+QsAqE0aBB1aUO8jbQLDz7iTgbQrbIH0tkovRH28WCB/dpj/ErvB/+8M51V1md5oUltl9YRLcU4e+LaSoa3A137ljT66au8f9UOTxlkz4mwPet3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf/gJ51+45Xt1O3Kel/2zU/voDfS8c1E092qnIlaTZA=;
 b=jDXRGjpsDrzNmgztm5HunTtBs2IaiGO7lnPM/dcnkscq3wk5CqkdRG+xMQO+UCEHThLxCDVRcMjo/CT+hzOwobYKThse/bChH6ROxFt8wLrJ8NF40QjhDgiyipVmGpjIn4LGgAnc3O+Ph9u1RQq+U5dZEZC0ZshShddTDSUJz0TMHSF7Bg1Xy0StJytbw42KTO1djM0xF6kz5GyKCksedYF3ujoj1zMhD2V2Z9tvO0KCj5XUhv+PfKwky3CLI0vGVeESReiyYMozTeJUiPbkqYgekWSKzSxU9j2ZWPYUEdd/KKUenePO7vzE2xaXlkshwRnCeZ05VMT1ew7V5pUcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf/gJ51+45Xt1O3Kel/2zU/voDfS8c1E092qnIlaTZA=;
 b=dcFnclgFA5Q87n/tir7VbxbqUMxhTBh1cc6wUKH69EB3g8Gz4yR5spjoig72GpMTsn7Cc8vtQK8Ha5rPAa8eSfylXyA+rJG3BljLOFDndaZI3M5tcVhI3+82xrAWggL5Gj7eJmdlO0wH1O4is2cbidluMxeNLo0K1uLASuXKnrg=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH3PR10MB6809.namprd10.prod.outlook.com (2603:10b6:610:141::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 25 Sep
 2023 15:23:56 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 15:23:56 +0000
Date: Mon, 25 Sep 2023 11:23:53 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Peng Zhang <zhangpeng.00@bytedance.com>
Cc: jason.sim@samsung.com, kernel test robot <oliver.sang@intel.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com" <lkp@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
Subject: Re: [linux-next:master] [maple_tree] 2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Message-ID: <20230925152353.zoezenruphilf2kc@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Peng Zhang <zhangpeng.00@bytedance.com>, jason.sim@samsung.com,
	kernel test robot <oliver.sang@intel.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
References: <202309242123.7ebe65b5-oliver.sang@intel.com>
 <CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>
 <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
 <08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::24) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH3PR10MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: e95f59d9-943e-49e9-204e-08dbbddb6f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rjb66VV5bFTU9qNc9YFFxnFUZ24+cvSuJ+sIhx7PnhtYPRKrt2iYmhtQtxiJ9DdCza6+rH5fS18PvEBmcMMC04fmGcACblDQdi9iKz6xCmBij/3LXrQ0gM7zaP+pkQMO7NCs22Vw/bVj1LUy47TrZvWMUcgFtzhUnH1YfgjXnpP+IDVWisWrxGVHOezB2/DDyMVlLRVadXFwAqYsPDNNgz4q5wp2s6vZr26xGvxYCAnDzoyTabswXj3x5tCVOecXQEx7sl+zD/7jWkge82XLclI3Ql+im8cro/PHi/pWSzFL87LUYHox9RDnaOUyy0AX43JX4YM9IdLD8/i8KtEhSPT0YbqFhFY7WyAYmd7anNb9dLjgQhc7zK8CS0DWNawVMGd4fy4VBT1yhzoiodzSZ03ny3OP29mLKg4FNkucUEfEfOhx7ZVQ4EOEDVPBC9pxiRasxj/F0gh686NlVYQLS6CzEOWR5Mp7XJpq9d7ucr1Th+tzmZulXzePR889XjZT4hyGC7mQDRynd6bMzcpqqZEGBx+TEnooZLmT25SH1MgNy3ubbvRtDZIgldVixTmmjv0wEl736Y+KeqecKbht9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(1800799009)(451199024)(186009)(316002)(54906003)(41300700001)(66476007)(66556008)(6916009)(66946007)(38100700002)(966005)(6666004)(33716001)(86362001)(7416002)(2906002)(5660300002)(8936002)(4326008)(26005)(8676002)(83380400001)(478600001)(1076003)(6486002)(6506007)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0hlamVxTlJTOUFPT0s1ZWtQcmZEZ3B6R3h2UWlwdXd0d2J2U1JybVJDQUt6?=
 =?utf-8?B?N3lFK1cyTnIvUDFnZVBGNXpGVG1DV05xTGVtTkJyWGdHcWVxRDVSQmZmRThm?=
 =?utf-8?B?UVVzdlExa2V0V3FtSWhXVHhWcXBIU0RYQnJvR2QrSlVMRWJ6ck50TjNFR2dy?=
 =?utf-8?B?c25ldnY5NmNBOThmclhyZzU2RHR0L0pDeE5qUmxmOGhKaUU0TTlqQUM3QWR1?=
 =?utf-8?B?SzJRTWJkMmdHYzc0QWhSZitBNzZkMXp5bmE1TjFRdGtlRnVLQmhTckszR1V5?=
 =?utf-8?B?R3laQnY3NGUrZzZvWjVHbTVtUTJFdEQ2WlAwRkJNbkpuZnJyMFZ1ZzFZR3Bj?=
 =?utf-8?B?eXlYd3lNdGVFZzVMOEhEd3UreTBSYXdDL2E3M2I5bFdlV09oS1Y1M2xyRzNq?=
 =?utf-8?B?WlpCbk5GVFFEdE9vOFg3UE05TFZYUnRvRHErakZNMGp0RFhETjZPamY2WlVr?=
 =?utf-8?B?aWo5OFZMbTFJbUd0dWlGM1VZbXY4RmRCZDV4d3M2Sit0dldsdy9QQW9yTlpO?=
 =?utf-8?B?OTR4QUtxT2dRcGdUcWh6dG5tWmNEOGI4RU02NWw5ZGFjSGRud0h0bDdQK2N0?=
 =?utf-8?B?YnhlK1phYTZLRWMxYTR5cVZqUkNSSzNPL281SGdWQkEwQjUrWnlxNTQ1QU5L?=
 =?utf-8?B?blNUS3p1SVcrakpEN05ham1qZitFdjkvVFpaaDVjNHdaeFE0MVAybzNuL25J?=
 =?utf-8?B?VDBHZnFkdVdFT2hxYmhwYVF3bVltQmVaUGhoUG1Dd2NhN2pWcC84M2RqTll3?=
 =?utf-8?B?SVFLZEdKZ1ZFQ09FMy9VaC90TVZ5SGgvNDU3WUdnUnB3NHZBZFd5OHFPTGhh?=
 =?utf-8?B?NkdGN2EwdUlKWWw1U2U0dUZxa2tlZUU4S25vZlBpYyt3aTBBdEFlRWgzUUpl?=
 =?utf-8?B?MGRoWFJBZy9SNkxzb3lmcW5KYkwyeGc1UWhqa2hCY1VvRm9PbWFKbXNzVndG?=
 =?utf-8?B?QWdnUEt3MVJxN21zczFoMjVHNkhLWCtkNkE0Ui9GMGpjMU00eHFmNXZIbmVk?=
 =?utf-8?B?RE80dEJscnM2VnR5Y204bDAvVWZkdStQSTAzNldHN0RCaHFZTnAyMVZQZTRT?=
 =?utf-8?B?NWU5dVVNRFhVNFExZXV0WlNyQ1NuOVR5M1NUaEtteXlHMi9keFY5cHVpMTlD?=
 =?utf-8?B?UXJ2dE1VOHV2SnJDRWlhWHBXbXR5ZHluWXdSV3F4dHBhN0k0VlZrWjUzVUlB?=
 =?utf-8?B?ZE4zSkdhUitUc2N0bFBkNHlMWCtpRXIvTE1tcXBocnlwZU1LcExNWnJ6d1JM?=
 =?utf-8?B?MVJlNGZjWGY5TTNBbEIvNnZXaXdDRncxR1B0c29OZDh6cDQ3SE1sMVdyWG9P?=
 =?utf-8?B?UU1YOTNOMFdlTjBTWW9sb1lTN2hVU0VuUG9pMDloYmFhUHRoMW9CeHkrc2c5?=
 =?utf-8?B?QlJILzFwMEpPeFR3ODlWcG9OUVlySXNQcUl5Qi8vTXpuWk9EOW8wM2x3eWJx?=
 =?utf-8?B?OWxIbEJjV2MxN0tubWZtK3VOdTNkZzlJUDAzMmh2alNQYnRzbTlIZWVoQXBD?=
 =?utf-8?B?MWhVSG5XL2Q2VTFhTzdjZ0pVZFpQTElLN09hekdmSTExZmRHREZRSngrSElU?=
 =?utf-8?B?NFpWU2RBeHo2Njg4WFhtOE5FdXNyQ0xTWXhlUysvMmFCdjA1a0RvUDNkeXFF?=
 =?utf-8?B?cmtPSXhmbE1zR05LMDR6eDBaUEJTWHQ3SXJNNHY5REphc1FXdDB1U3ByWXBF?=
 =?utf-8?B?cDJCVGd0ZzhRbVR0TWxQUHRuN2xaMnNuS2tndlEwL3J6c09Wby80Y1FFczJX?=
 =?utf-8?B?OXprbk9PU3RmcUZYbUdzcHBNSkNkTU1PMWJTSThWQnl6M1JCMjBidTNQUktk?=
 =?utf-8?B?K2UrVjc4aExTNWFtVVpLSGtEZWRxVTRLT1BYRnl6d21JVy9JcGQ2QVFRRTY0?=
 =?utf-8?B?S0c5MmFUU1hpUzlCbDl6UllFUlpqeDd4TC81Wjk3bm8xUk8rbndSYXg5Q1J4?=
 =?utf-8?B?cDhkZlBCZ2dGMXpReWJ2ZThJMDcwWjUyUnEyT01ncnpsQ3lXRjdlZXk1ZzJr?=
 =?utf-8?B?WGpidVU0L3BPRm5RbmEvRVF1Wm10UExreWhOOE5zZUdyV3d5NE92V3QzdEJH?=
 =?utf-8?B?ZklRUFppREcrSFQxNXpqbWliU215ZGFLMThaKzMvTlV2WTJNTENFN3N3Ris3?=
 =?utf-8?Q?jAnRa21TsB4fyQcbHxSx1az4I?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?ZXlpRGlUNHhoRXoveFptODBsalBLbDRGeWw5dU5CcHF4YnpmNUkxUE4xeUJ6?=
 =?utf-8?B?MGloWXZBTXkxRG94MFhCZmV1ZVFmVnBBZzA1VStQM2VWMnJ1VFVHNmE0aTNq?=
 =?utf-8?B?NGVzc3ZLbTBQOVREY1ZLbDF1YXZMOWhUTjJabmk0eWphQlExbGlHMC9pR2hS?=
 =?utf-8?B?ZU5MUWtkZ1FjLzBLcnJlcS9VTmxDUW5NQjZ2aTU3NGt3MTIzbU9PUmtpNjdQ?=
 =?utf-8?B?U0RSbGwwZ3ZKR2RTRUdtVWhzWWVoUUVYNjUwYUJLM0d4WFVWME1oVVBLazlQ?=
 =?utf-8?B?K3ZrM0NzOXV6OTJlNTk3OVA5K1ZQWjVCQytPM3pYV3UwcEpMeU1IemhpdVd0?=
 =?utf-8?B?cnFIdmlTVUpLclNVdklLcnRFNExvcTBBV1oyaG9NZzNSTU9kaE56MUdZaW9P?=
 =?utf-8?B?c3F2M0ttNWQ5L3I3UnNFM1MzYWVtcXlVc0NyYXkvbnl2enZSRVg1aEZpRmtH?=
 =?utf-8?B?eWk5VXpuME1xLzBHY2hpbEhSMURHVzVoUkFOQW9HYnk4akdqTzhsNU1zd011?=
 =?utf-8?B?WDgvYkY1MkRHbWdYN25wUHp6Zk1UUndmVzFCVnNEN2UrUEJibUhEZiswZjZ6?=
 =?utf-8?B?RlBaZXloaDU4YzZEbWdHSy9Idmw3YTdhcmNoZ3lqUHlsMVpGRUxYNWF2Y2dL?=
 =?utf-8?B?NVZYa24zQjZkZTd4TnIvNmZlbG5WL3JHZGVYRU9nUVJ3RDljcDJ2NEFVYml3?=
 =?utf-8?B?TG82NzdCMTdQSDExLzRNQTgwRTZwUzlZN2JJRElNMHlwbmR6M00zek0xY2ky?=
 =?utf-8?B?YXgvUnl5Si9KdUplSWRMazRZN296NHJFTDB6azk1NTBnY3JYc0VoTGNDQUkw?=
 =?utf-8?B?NTcrT0E5VUREeXErb2pTQmp6UHllVW1TeVdReXNid0tyNi9yUXJWRjZKcnJi?=
 =?utf-8?B?eXc0blBKSE0wUVNzUHgwSFJCYVpJazJEY05RZWdzNmZWRzl6Y24vTG5GMG52?=
 =?utf-8?B?TFY3dWN0a3Q5RDQvb0VTRnA0S2h6L1FVR3YxV2hJeXlSaTFLQUptRUVVK3g3?=
 =?utf-8?B?MnNyazUrYmdjQnJZcFBQK1FTUE4vNVdXZ3BTb0ZJR1d3aU1YcWdPOWppdzRP?=
 =?utf-8?B?dkE2c3ZORzZQb1pFQzk0OWkvTEVqVlhLN3RoRG42clpwQTlrVWxSQTBGbVAx?=
 =?utf-8?B?S3RUaituckdsYnRGZnpPUXBlVVdFKytZRnRMS0c2djZxZUhvY1BZMytPU0JF?=
 =?utf-8?B?NHFFaDczOGd0bWdZcXdRQkxpc0doQkxOREEwOWNkS01mS0FJbDdTZ2pnZHJi?=
 =?utf-8?B?RXJMdUcrK0xGSUdJV0VRUkRkVUh2OXB5U1VCZVJPV2RnN25TcWpvSHZKeUNK?=
 =?utf-8?B?bm9lNDliYXAyenZDaC95QjZUNUQ2eEFiL3dEV0dkNDZiZ0U3b0p6RFJvWVAw?=
 =?utf-8?B?NU8zTk5oYVEyeHhMOTBjeXptSTdOVEwxUUd6aGlkaXowc1FIeWhkeThSOUQx?=
 =?utf-8?Q?JU2ulDpr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95f59d9-943e-49e9-204e-08dbbddb6f26
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 15:23:56.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMs5XAyJxYpIe+RpFom1X8aQc0O8LRSE7ujNjnwfaa5RLCoWNzptTI4D44AAfvd8yrHD0bpfwVWPZXckRlZr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6809
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_12,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250118
X-Proofpoint-GUID: xvSOQtM0RtWDakDo7e70Oq2sR9oaI6aU
X-Proofpoint-ORIG-GUID: xvSOQtM0RtWDakDo7e70Oq2sR9oaI6aU

* Peng Zhang <zhangpeng.00@bytedance.com> [230925 08:47]:
>=20
>=20
> =E5=9C=A8 2023/9/25 20:39, Jaeseon Sim =E5=86=99=E9=81=93:
> > > Hello,
> > >=20
> > > kernel test robot noticed "BUG:sleeping_function_called_from_invalid_=
context_at_include/linux/sched/mm.h" on:
> > >=20
> > > commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use ma=
s_node_count_gfp() in mas_expected_entries()")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >=20
> > > [test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c98=
2ac59]
> > >=20
> > > in testcase: boot
> > >=20
> > > compiler: gcc-9
> > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 16G
> > >=20
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >=20
> > >=20
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver=
.sang@intel.com
> > >=20
> > >=20
> > > [  113.582828][    T1] BUG: sleeping function called from invalid con=
text at include/linux/sched/mm.h:306
> > > [  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block:=
 0, pid: 1, name: swapper/0
> > > [  113.584246][    T1] preempt_count: 1, expected: 0
> > > [  113.584613][    T1] RCU nest depth: 0, expected: 0
> > > [  113.584983][    T1] 1 lock held by swapper/0/1:
> > > [ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, a=
t: check_forking+0x1e0/0x5c0
> > Dear Liam,
> >=20
> > mas_expected_entries() in check_forking() tried to sleep while holding =
spinlock, and panic occurred.
> > I think mas_expected_entries() in lib/test_maple_tree.c need to be modi=
fied to align with commit 2041864a22d4f.
> > Do you have any idea for it? or Could you give some guide?

There are two ways we could fix this: one is to pass through the GFP
flag and use different flags in the test module, the other is to move
the testing out of the module and into the userspace tests.

Adding the GFP flag to the interface might be needed in the future but
there's no need for that now.  I was concerned about too large of a
change to the existing code, and this would increase the runtime code
changes - although not a lot.

I think the best thing would be to move the forking test out of the
module into the userspace testing (tools/testing/radix-tree/maple.c)

> This is just a test module. The work[1] I'm doing modifies this place
> and it will fix this bug.

Thanks Peng.  This is a temporary fix for upstream, but is needed for
the LTS kernels as well.  I've mentioned your patches to others, so
don't think they aren't noticed - they are eagerly awaited.

Since your patch adds the necessary GFP flag, we could move the
check_forking test back in your update, (patch 7/9 [1]) which avoids the
GFP_KERNEL flag (thanks!), if it is moved.  I think it's worth while to
do since you already have a lot of userspace tests as well that uses
GFP_KERNEL (4/9 [2]) and it's good to keep as much in the kernel module
as possible.

By the way Peng, I have gotten complaints (I cannot find a reference
quickly) from older CPUs taking a long time on the test module.  You are
making things faster, but I just wanted you to be aware of that in case
you add tests in the future that cause complaints :)  I still think it
is worth keeping as much as possible in that module - it's a more valid
test scenario and it still runs from the userspace testing.

...

> Thanks.
>=20
> [1] https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@byte=
dance.com/

...

Thanks,
Liam

[1] https://lore.kernel.org/lkml/20230925035617.84767-8-zhangpeng.00@byteda=
nce.com/
[2] https://lore.kernel.org/lkml/20230925035617.84767-5-zhangpeng.00@byteda=
nce.com/


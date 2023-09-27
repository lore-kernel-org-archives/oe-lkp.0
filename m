Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC53B288
	for <oe-lkp@lists.linux.dev>; Wed, 27 Sep 2023 15:29:45 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RDTD0A018861;
	Wed, 27 Sep 2023 15:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=YH8uL2QYby4kFYfzMTpGDD9sPb+tDSdNwxqSB8OQ4UU=;
 b=pS8GEhn9VLIDSaUn65cHgZU2dD+EtDfqxRZ7gE+WOR7E+xv8HpkVBJlGTCNGvwVQ5Yra
 naBeDotmQbzm9D9uoKJBkcXZ6i/MzkzdXGVNpHNtztIJZivw1kI4WH108ppUq34PpoKC
 4XfH13/fiLMZVkN7/g/iwams80QMz+blVblRBEeQQjiuYdurvdRFpENIVGTERirPLd8w
 PlFcmumuErA4qPTGOiViqYYMNn3L5pFruDM77WZ6SOLqBM0KGcTZy79Troze3+Ns5q4t
 29NEyVRrr7bZxoIIWy5onDCH27zBtINvZzlBcZ/4WAspTdSl0pzrgcwwgx1vj9JHeyeK dA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9qmuhva0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 15:29:06 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38REbMUk039522;
	Wed, 27 Sep 2023 15:29:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pfe5syd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 15:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayXr+X8FiqrpZsd2CHO6jUrAYfDFEbz7AbBg7XMolmK2kjd75AbOX1EwkFPfymSje5TgtQMkNNyWKQSbxx7eBcQLqG/3frh59AUinFCAGR0C7Wk97pfEmCaU2QVATbfDIh/7aLTqF1ugKBLfeG56Y6KItpaXYrtRmksQoWdsaFGVQI+nCJAJhLDeTXVEQZM+5MP/cV1+rUJv4s7lWlNBkEXCb3mH3CoAe71CPkqUBpqAkFSzRiYaBlpHlbmAit2u8OlFrB/ks9LMamIVCtPWDhpY+ZeclFBU29DX2Isok6xTeTP/KZQVFNKKFQoKUfXxyQd2QVdLxLohY39kR7deRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH8uL2QYby4kFYfzMTpGDD9sPb+tDSdNwxqSB8OQ4UU=;
 b=kt4/OPpFh743Tv6Zbi9LVH7g87FbgjOpENuH2f40AmeHFHRo/Eh3GwR1EuC+02NiT1lCTQH5BDvM87ceYsP+sAtSmkbi2DqoWC4J/FUbTuZfY67NBad9YicLKrmC0AX5odQYSTexhMxGHQA0HgWgL+jJl8U/QrV1LFt2rjwO9RpiruIZFIFl9RLoECpLUSAZYd8vezahh9YRSNGTa0JIl2qjUFcui+t8skgAjL5eISe2ikqmXDDCmmOEEkihPeB6L8OGXAYd92OKsZ4NBgaStma+EbmkBMD3uFn7qNQ5QobxNDvAZJvO+MqIjw0Kx/ouvwwsUuZmVE1qNH6HEkzM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YH8uL2QYby4kFYfzMTpGDD9sPb+tDSdNwxqSB8OQ4UU=;
 b=NKXH7/A9V8uIKTWxa4RZs6mPDpcXuq5oVtdotLRTTAAUcatnUZZlw4/dFo2XSHy97Ir1Q5ryaGfGcVb0jHH81afzfIOq6aWP20maa/m3ZlxMFEz8mk1Qxhep4wesUk66yphiiXZG+dRFBOLNQhdNMfYQiobz9rsifLXv0zH+6/I=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH2PR10MB4279.namprd10.prod.outlook.com (2603:10b6:610:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 15:29:03 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 15:29:03 +0000
Date: Wed, 27 Sep 2023 11:29:00 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Jaeseon Sim <jason.sim@samsung.com>
Cc: Peng Zhang <zhangpeng.00@bytedance.com>,
        kernel test robot <oliver.sang@intel.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com" <lkp@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
Subject: Re: [linux-next:master] [maple_tree] 2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Message-ID: <20230927152900.vioyzz7fylldlnco@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Jaeseon Sim <jason.sim@samsung.com>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	kernel test robot <oliver.sang@intel.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
References: <ee06ab24-0455-d212-e995-745f83366e00@bytedance.com>
 <202309242123.7ebe65b5-oliver.sang@intel.com>
 <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
 <08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
 <20230925152353.zoezenruphilf2kc@revolver>
 <CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>
 <20230926121501epcms1p85a8295b53a5dd25eea9eea36657472e0@epcms1p8>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926121501epcms1p85a8295b53a5dd25eea9eea36657472e0@epcms1p8>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0431.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::12) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH2PR10MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d622fdf-0619-4b3a-977a-08dbbf6e7afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/5vP9uURFt8ps8kRRDxCYkEqXnfEouUETYVfYHMW4bYl6J3oCLWt6MIRMLNe/LIb5JUnQypfo8XDAzZEJvqbQ5Mi2osHCfWwIarhi6wbbjySJuHxS/xI8bM4/o7Rm4Cq3PH8kpsIiqbt3iyy7uNBEtyISlhbV2jWh5JwvQwPuw6b9Bk/P5NFbuGwxma40xTtPtbuqjc74Tr6f0yL1uiXr2BPIb+CjlwnzGszBhr2de9UEuogjBspeGZ9JtXQbOefM6LOT7L+lJpimFC253FP92lWtr561UnOgwxea5/wE67isXyAnDoLtNRXhvz36PDu0Lt/F0B+RhNpAsG9/NIRWy9z7r2R6nbbM3QXJ0M6jMsPEqscKgLyHqpNzclQLcG1mxDAoCoy43NdEGi/WOPmxmCy2YOvQ68cGfw6hcXDBjpPBI1bM4xiNvRuHOMbMnOGp0iK5YkH2K26o0MV1t5uJte8tIt8evcUxz3c9B1lGFudSljj8bsM5ln0ptlsDouX/GjuS1b2yv40cPmU7IVDXrBwgPxFPMccaL9LAyRx47bR34LmOWi+V305QyeA1bbTwiw/X5cYGQ/D8s7Hv38cwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(83380400001)(966005)(8936002)(2906002)(5660300002)(7416002)(86362001)(478600001)(4326008)(8676002)(66476007)(66556008)(316002)(38100700002)(6916009)(41300700001)(33716001)(6512007)(9686003)(6506007)(66946007)(1076003)(54906003)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?054eBOR7QeKOw4cRI0wWiJCE6vrrssy+weBPPQqYR0FRMpVx5XtBzwDGOJCz?=
 =?us-ascii?Q?EbcKQoWWQEcatNbH1CG4ojuBtqNy0i6ly+8iT18x3JLCusqj26B/p0S3F3yn?=
 =?us-ascii?Q?8jUwIuYZwyZ5Yy3KPdjFugmAIEwuGkJbd5ggqTF1vro9WBP4FL0TPKmjjHll?=
 =?us-ascii?Q?IBw0E/cDTMdTIe25c0r5J0r2GC7QucA2hdVZejJRKDXnF8I9uihDXiDWJfPt?=
 =?us-ascii?Q?UMQ3/dxcmRPkQsTZvvxYJX676j5r5lXfI9BCPDQAtKl0iCPoTFRgso1xO5yi?=
 =?us-ascii?Q?unnpaXNXVis80bQgxJH+vE1Vhz3AmD0DPuVkzojUUor8QpPfNfm2lcFYaaTk?=
 =?us-ascii?Q?J1Ce4JlJD8aS91eDozqIx1kAAKcBXT16wFUFU8b01845Wk2zc24QJ0N5hUQC?=
 =?us-ascii?Q?/qBnkLd1V9DnQr0wOcCVfUMzrTcLyrzyiIRAQwXPWGe0sJxKzK74xRPl4uT7?=
 =?us-ascii?Q?F3lb0KvXCJ48WK9/bkItEOKVnKOQqeZYnfE2Gm3geqAkPVWeiD4d87I4u//p?=
 =?us-ascii?Q?XG9VlBE0z0AFqrEUlFqjae0wr3kUHT7+0O7lD+ZQfcKxhDgqNtX6/humVZ5m?=
 =?us-ascii?Q?d/zPtJgg4vg801jVuGiLL3uijg7yT2lWdolWYiUNcWUuwVKx/CXo3n2F5GST?=
 =?us-ascii?Q?dbtroELwPb5sn6quVeyJDSBBzaBxTqX7TV645Uy7plmbZNc1MRHGDYz6OLod?=
 =?us-ascii?Q?MrP4TIXZuJuB6VLpy4ZC9yx1MbMSYp7a6cJ9Nt8yOKQZHqaW/kVlr8o476+T?=
 =?us-ascii?Q?/gWLj2EACNSQ/duvjDaJdLdJeoq4GJ/AvQY51uzhXyvmvHZq0mXKifJsiYzY?=
 =?us-ascii?Q?rn/wcC4VGKbFnU8oCfLV1oiH1N3mPZcVNfKWQ/XTqYFBu6PnHY6U0KlVs0mK?=
 =?us-ascii?Q?NV0dhJwoJkBb/qRvVjfsAHhrq8fHww8wAVOE86bco8qC3tEaFbMwSqN3aFeC?=
 =?us-ascii?Q?CVBy+nbGb8pGUUivXWWhCqfVdn6cLT9OxXRxmzuNLitSRFz8XbtkmZWaZYxR?=
 =?us-ascii?Q?YTr1XuvFuf8/FzwIjEet3lBSfYnwUtZGYvCIp8SrSnOIqmNWFNCrvczVHLZc?=
 =?us-ascii?Q?PC1+nUKYb2SNvxxEKmhjS+tBzRUKcoysFO1STzy07tdk54n2BRWM1D8f7EKv?=
 =?us-ascii?Q?u9GNUi/sltWdwsh1IpPNHws2O/x7GSMisSgSJ/Y0qn0Vtfvb0IW4Mq1Uw3c7?=
 =?us-ascii?Q?LwTIrg5vw2TG+9uwgSVzoplRPXdCrl9bABSgGP+W3E0Eaay5q79EA/ksJIzB?=
 =?us-ascii?Q?EX9TgsQXq+TS/O94gi0C4MLAanFn2j61tLbpO/9UsBkFMi/cIKPE0hy8GzYy?=
 =?us-ascii?Q?3uTUDqC1i4jCJLscZkiJW+/nTbz3Vu65uHCwiS+QoRslYNdUulrmuaunExUr?=
 =?us-ascii?Q?JR8v/61/uuGwn7AKYNyWhnBVC4UJagrlQz37sD2EHamC1NWJ9uo3bGc8TjUQ?=
 =?us-ascii?Q?EBq5p5nUNfabGFISl6vvu/oi4ojag2/mDDNK7kpQ6ucuy7WHXsAKNjby5lyY?=
 =?us-ascii?Q?tsBpX6tNl5Vtk1lXK/XicUKm9yiDJckADNCqodXMwYSJD/k031XMhlbm/53u?=
 =?us-ascii?Q?FjoABdncqXGoVO2PpMm6xKru1SSv6M7szYuJ44A3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?us-ascii?Q?gbRd/r4YTX7K5nwbRdj5UKpPcS6keOOxKhkn9icW/aOvw3x4y197siXF+VFi?=
 =?us-ascii?Q?Vjbh9hWr0zJrSMdQ2KTKtXDb8ahiIWCcZSHSecHQ2gQJYjWUsbfaSAMJdWxs?=
 =?us-ascii?Q?HTxcSNIiqdGn+pACCaQH8HKR7aUlP1ZsUO9x8uCZ/ghsJzBIG8AtRBdv1px3?=
 =?us-ascii?Q?8ohLy+4W5ontxP0pN8O32YIqloY8KBgUbAiEJZjjzFYxvgh86LFz3OQwVZz5?=
 =?us-ascii?Q?/TMUD1TmohqSCjduFTexT7Zrs7y7MOHnmAlZMnINr/7hhqJ0qPtuSiWnBUbS?=
 =?us-ascii?Q?bgMBKfiAu3F+Q/zH28KQAms707K2GUdS1LyPnYnwyhYHKjbnQltv+C4hAh4v?=
 =?us-ascii?Q?VRYZyI4h1epPD+kuPOD7O3vUykeHARKJ4QiM3fqyvNJYhR4lpJ/y1JnOKnx8?=
 =?us-ascii?Q?0ky+y+hPbb1Uw7m7H+mZQbeY3u80vIFbhUG4cyhmuMCnftiOGdrRpUBoMJsM?=
 =?us-ascii?Q?ZymuhJtmhaeQ7jdktTmdMex3xihwqP6VPiEXKdhfchQbBRm3oTPPyoVaNnxM?=
 =?us-ascii?Q?hRTrp92hZRUCXLuOQjKZP6RP6fWD1OhSaNaEaUDqVz3PWfURb6rEGgvgRXMG?=
 =?us-ascii?Q?W8b30FW7gMDjl2TSeZfmij/5aqP6knGqGhUru4nUTE08wiPYpHKzY/K3hpN/?=
 =?us-ascii?Q?SI+jpWBugPxswLxEdyY/xFEj+EvN8k7KsUNcvo2yi98C1ihQflzUsf9az+G4?=
 =?us-ascii?Q?Cy2knOb8YyNaTtYMroHwlvyAX0MqxvYXVRWlPmVxB+m6sQN/35I6qGN7KEPA?=
 =?us-ascii?Q?1ucY8/1dCgUE27VbRdwtIjj4mE/Iw9jUff9l0uXyTIGdDpvvBNvOhO5fzT3A?=
 =?us-ascii?Q?SPBZTgBXW1jOLZyy/waxuQwEOH9avc0K3TxtvitSvSHGyS+HeB4DWdCvcBcd?=
 =?us-ascii?Q?2EWW1OoX3VYZc/GBy7l/zP4dECO2IOGqBA7lsT5I11iI/1IR2yx6QFodkjgq?=
 =?us-ascii?Q?H3Hg1UOHh5k6ZyGPfITEPN0v4ntt/ESV8bkp11FYQVE8yWJ36YoRQzzpp62c?=
 =?us-ascii?Q?fX/5181fazQXWdz1GM1rs+dT9jSGTRlse1zVWNvUVCQ0ngX8jXR5qH1e9PV6?=
 =?us-ascii?Q?74/9EIBG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d622fdf-0619-4b3a-977a-08dbbf6e7afe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:29:03.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2hbuozekkygUVig0geZ5boYLCi97Pj4rXnXN3FcGOvu8T6Mp1Jq/zhRTpW37xgviyfRfsx7FT32z00Cj4zEvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_09,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270131
X-Proofpoint-GUID: A1Kap0nqQx6MK8Y1PQvZbvMAt_xlI9kL
X-Proofpoint-ORIG-GUID: A1Kap0nqQx6MK8Y1PQvZbvMAt_xlI9kL

* Jaeseon Sim <jason.sim@samsung.com> [230926 08:15]:
...
> >>>>>> commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use mas_node_count_gfp() in mas_expected_entries()")
> >>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >>>>>>
> >>>>>> [test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c982ac59]
> >>>>>>
> >>>>>> in testcase: boot
> >>>>>>
> >>>>>> compiler: gcc-9
> >>>>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> >>>>>>
> >>>>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >>>>>> the same patch/commit), kindly add following tags
> >>>>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
> >>>>>> | Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver.sang@intel.com
> >>>>>>
> >>>>>>
> >>>>>> [  113.582828][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
> >>>>>> [  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
> >>>>>> [  113.584246][    T1] preempt_count: 1, expected: 0
> >>>>>> [  113.584613][    T1] RCU nest depth: 0, expected: 0
> >>>>>> [  113.584983][    T1] 1 lock held by swapper/0/1:
> >>>>>> [ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking+0x1e0/0x5c0
> >>>>> Dear Liam,
> >>>>>
> >>>>> mas_expected_entries() in check_forking() tried to sleep while holding spinlock, and panic occurred.
> >>>>> I think mas_expected_entries() in lib/test_maple_tree.c need to be modified to align with commit 2041864a22d4f.
> >>>>> Do you have any idea for it? or Could you give some guide?
> >>> 
> >>> There are two ways we could fix this: one is to pass through the GFP
> >>> flag and use different flags in the test module, the other is to move
> >>> the testing out of the module and into the userspace tests.
> >>Actually, there is a third method that can be used to solve this
> >>problem, which is to use an externally sleepable lock, such as
> >>rw_semaphore.

Oh yes, that's true.  There's probably even more ways than even these
three.  I didn't mean to limit the choices to just two.

We should probably also add a test for this somehow to the test suite,
so probably the best way would be to use the test module and implement
the change like Peng suggested - at least in the long run.  That way the
bots will report the potential locking issue if we ever change it again.

> >>> 
> >>> Adding the GFP flag to the interface might be needed in the future but
> >>> there's no need for that now.  I was concerned about too large of a
> >>> change to the existing code, and this would increase the runtime code
> >>> changes - although not a lot.
> >>> 
> >>> I think the best thing would be to move the forking test out of the
> >>> module into the userspace testing (tools/testing/radix-tree/maple.c)
> >>> 
> >>>> This is just a test module. The work[1] I'm doing modifies this place
> >>>> and it will fix this bug.
> >>> 
> >>> Thanks Peng.  This is a temporary fix for upstream, but is needed for
> >>> the LTS kernels as well.  I've mentioned your patches to others, so
> >>> don't think they aren't noticed - they are eagerly awaited.
> >>> 
> >>> Since your patch adds the necessary GFP flag, we could move the
> >>> check_forking test back in your update, (patch 7/9 [1]) which avoids the
> >>> GFP_KERNEL flag (thanks!), if it is moved.  I think it's worth while to
> >>> do since you already have a lot of userspace tests as well that uses
> >>> GFP_KERNEL (4/9 [2]) and it's good to keep as much in the kernel module
> >>> as possible.
> >>> 
> >>> By the way Peng, I have gotten complaints (I cannot find a reference
> >>> quickly) from older CPUs taking a long time on the test module.  You are
> >>> making things faster, but I just wanted you to be aware of that in case
> >>> you add tests in the future that cause complaints :)  I still think it
> >>> is worth keeping as much as possible in that module - it's a more valid
> >>> test scenario and it still runs from the userspace testing.
> >>I understand this now, and I will take this into consideration when
> >>adding tests in the future.
> >>> 
> >>> ...
> >>> 
> >>>> Thanks.
> >>>>
> >>>> [1] https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@bytedance.com/
> >>> 
> >>> ...
> >>> 
> >>> Thanks,
> >>> Liam
> >>> 
> >>> [1] https://lore.kernel.org/lkml/20230925035617.84767-8-zhangpeng.00@bytedance.com/
> >>> [2] https://lore.kernel.org/lkml/20230925035617.84767-5-zhangpeng.00@bytedance.com/
> >>> 
> >>> 
> 
> I think it would be better to wait for Peng's revision..
> 

Your patch is a bug fix.  What Peng has written is a new feature.  The
only reason that the new feature fixes the issue is that I raised it in
the patch review process because you reported the issue in the existing
code.  So, thank you for reporting it!

We are not backporting a new feature to an older kernel, so the fix you
submitted is incomplete, but very much necessary. For all we know, there
will be other issues with the feature that will delay getting to Linus'
branch - and possibly miss your internal release window as well.

We are currently in an RC release of the kernel.  This means we can
submit the bug fixes, but we won't be submitting new features. So your
fix will land and be backported all the way to 6.1 before Peng's feature
is added.

Even if the new feature was put into the mm branch today, it would take
a long time for it to be pushed upstream.  Even when the new feature is
landed upstream, your fix is still necessary from 6.1 - 6.6.

Between Peng and I, we have provided 3 ways to work around the test
failure.  I like Peng's suggestion the best, but since he will be
replacing the tests then we could make this change in his patchset.  For
now, I would be happy with a passing test framework to minimize the
backporting effort.

Do you think you can update the patch to incorporate one of suggested
fixes for the testing?  If not, let me know and I will add it to the
list of tasks, because it *has* to happen.

Thank you,
Liam


Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196415CD54
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724835098; cv=fail; b=Tq6DTfG3RPRzy/2P3G7upAOskf9eMQzB9PGQit9Mjjw8S+i8GoyatnfxMAJ7xyVqq6zRqew+1c6iPFxWWdla2iKT8ufAqRf68Uay6T3sdsdzQf3+eTLh1KD+7NMm1MatdHomJ53D0acmItlDOCAGzHuXViVkohJV4E8mkW28VVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724835098; c=relaxed/simple;
	bh=Qf072TMGSlHrsRAKW+vmiYxEQyRLJzQueuhtLbajMYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YblY1EhCwX4iE3MwFuTb/JgY41WiFVe1ZlXln43OZoBOcCdeQzKsGUKYKLAg6PgSo/nT5o0vL/zOO/AKb6ZCIzXTkHeD1wVoJ3fsoxgOEV/OwMKwPsl5nrJkDmjadBRhcemARsD4bhQZM7B6InI/kSMR2Jr+WxVPVqM5C3copYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EP3Dbh4e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TVPL5jzW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EP3Dbh4e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TVPL5jzW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S7tUVQ000861;
	Wed, 28 Aug 2024 08:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=2WvHo/nIIlDwwpK
	SYeYrmOwh+hAHErfZAygw1IbGQts=; b=EP3Dbh4e4Y76ttN3ogZu3sgRNKdvbU2
	PcFuCUNm0XTPgcHE5Ocyrbx5PcukoiOOQ7gn13HhNn7RX+Ri5O+5YFoc/whfCxzJ
	CQAg2FEJhrZtA5A3OgyPyhawth2AYRFbenepEWxBoz+UYdp/VkddzjWL74j9NlT1
	fLMo9r5NdhLhNebhxkeZg40yu9FXxhpWLq0E+//wReA/jDdvWqxSFUO+1lW2a96b
	/SWKGwG/68c0XEHjlOjGNzX5f4Vr0lpdQmt5TLZMq1xlUVtzZSbJxyXKDWateNhf
	3yrMnoRhmL2r9ottmUpK+uRjdg4J/D6HrVOspJeRD35jdlYtSflZY3w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugrtbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 08:51:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47S8M8mR036757;
	Wed, 28 Aug 2024 08:51:18 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jkhubn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 08:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3CaO7yUbdSYs4f9OHN4C7y9e7tMiDdRUX7+8E17yY7m1CVmm0WSX8rkwZSBr0eQwj9rCfrG8lEKkAEQS9nQFK1QX9p4fjYErNYtXTUIsiMLIqj7JiAwuB8S0oEHVvTTjCQWQPefZRWOZtYDO0c0JEqnm5FcXSXMkJczWzspWrWOddFEAgysBhhVUmgFpg4A1Z0A4LA18Fgfyh8vVncleWIiT1XWZXKKjC+/Hu2yMHluTzvr2d7DzN7UPDbg4/4Ji0LcQmoF3JnX3uBluDtzZQyKaCYXH2/ovsvh1A8ZDYdt8/qxoh+A8f1B44QJhmRK56Mb4Mhq4uCkapofStRO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WvHo/nIIlDwwpKSYeYrmOwh+hAHErfZAygw1IbGQts=;
 b=CvfemZRr+hJriNc2xa/ZQILA3EIn96W7VcJtKNpVS59n2p4gfIIZPqHlMbDm6u4BwxIffd5J1fHfknrJ9GmIczLi6ZalAL6lTMfEUPQZcTtrB1Rfc8o5M2cMHMJi9JTQpBBId9lTcclNH0jYlyA3oY+O35bNyUdTKMkfP1M8BJSyvqOaWjvxrD+61/kRDQB6o45LpwvQMg8mNFO4ZMtRfYBpSElmMU3X3HkeRles+lG1kZHWoZLwYJ7c4rE+NdryK727tDBRa7xlk3bfN5In+CdiVaNxyhVqgMHCANBFUhnZOCBTrBJAHMBXD/GT3w784ir9euKxAeWjQMVj8hzVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WvHo/nIIlDwwpKSYeYrmOwh+hAHErfZAygw1IbGQts=;
 b=TVPL5jzWj8LtbnnDysWIw7kSFy+yUrml7rhHk82ropPGBWTouFajbSc9OPAXkWonL0+/bP4/H5iYhCdjChpjazoYTCfpnR0nE7oSZZjMmi0rrGynPre8p1AXtxPUi69LdKa5z3LVbizVuZixlCNU6GpRyex8RqVL/eEREi3aftg=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by CH3PR10MB7612.namprd10.prod.outlook.com (2603:10b6:610:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 08:51:15 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 08:51:15 +0000
Date: Wed, 28 Aug 2024 09:50:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bert Karwatzki <spasswolf@web.de>, Jiri Olsa <olsajiri@gmail.com>,
        Kees Cook <kees@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linux-next:master] [mm]  [confidence: ] 131e4ef350:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <bc3b091a-c408-450d-8625-b8584d95f0ee@lucifer.local>
References: <202408281008.b26bed01-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408281008.b26bed01-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|CH3PR10MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdf4580-2c9c-4088-8405-08dcc73e937b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?shLBbA5o42JB8gNw5vuTQgLDE+jMqtCtUtudhYP8qTp4uEeHYJ+lhff/TQwf?=
 =?us-ascii?Q?KWeT6nqSAe+vAjHgJAt5IHtn4Trtx5XeHNXFmVko/CkMXFp1VGGkm+YB1QXD?=
 =?us-ascii?Q?XY6c2DBKr7Z9h1tYClM1DkxY76uwNSEdQDTYmWW0HDeEbJG2GiE5EtjMb+Dw?=
 =?us-ascii?Q?pBVvXJOr7THGppp3ruCXodkuSUmHMMIHqm7cuHiOcEijRUwwmwst89r8QgHV?=
 =?us-ascii?Q?/RNnKzRZuLV0IvdOdGJfF9ab29R7bjdSSDXU73OqcvUmf+yFnn6SNbA4IDNi?=
 =?us-ascii?Q?fqqsIxjK0I/NMrfsf0aUFw3KB13dol3h7wbns74aZXw7nV5yJvrNrlZVu+XG?=
 =?us-ascii?Q?RUL2Wl1xrXGyiztXlcu2A9HM5ljp81P0Oh0FJJU6c1hZKPUM7/ATmaBoVdRm?=
 =?us-ascii?Q?nlG8FJsubfOQ02b0Yx495i0y6xazRGvVDr8rxvL656L9eH8nj6Pl08F9sYY0?=
 =?us-ascii?Q?Nl3yhVcO9k61U1Cc3t3RubxuqmZnioJooUMphfUdfbiRXzAqNw+TfrhCM/gS?=
 =?us-ascii?Q?uid99Kw4O/CfBdeWiDcs9CvWXrlZ1xtI4LshGkfhyQtZIF54qr4DWY1rMNkN?=
 =?us-ascii?Q?iVX4PnWwvDmTkizaxWLfdnSyAEv7UZvHuRcOOO0D2KEMSfcwnZxFVvq+aaQS?=
 =?us-ascii?Q?r4gW96Lh1+QTrbVAWQ4+YZcPtXk5BO69XPDBno6yTjHNjzzvn97RCjnGvAl/?=
 =?us-ascii?Q?q6szglJPH1GU3X8uoIANRlt7SN2EOzGNPi9Htg/z1AyYmUwERomh814VOTaS?=
 =?us-ascii?Q?Z6HQp31lr1xlPHU5VHAeQAECojNMWnJKRqPgcacn2M9v3Fucb3McWTS5B9wS?=
 =?us-ascii?Q?0kj+UXLGBGmIT3zaerwhFveVNK+RFuDiUH0eaKhhbctoM5p9l/S73a0vRnDN?=
 =?us-ascii?Q?vSttK7vwAjnVhH6CpN6Bx7Qvcolj5mCi9ZOx45Hy+cBE0oUVrIZJmpwa1kIj?=
 =?us-ascii?Q?mkJQYdkxoIHcwxiyXtq3XJJ6RSbjX3voern4c96UrF9yyvRipBCFsaC0Gxok?=
 =?us-ascii?Q?mdF4ftdhocGhMZlwJe8RmKP3ReBAb4CYIvov9o8+wwyD8bqC3YYbHw1YjNZl?=
 =?us-ascii?Q?I6xZfmLcn1gicO2UFnEqd36HJmQmguatVOL8HZwLUffocTqPzMC1lKQHH8Gt?=
 =?us-ascii?Q?9CJmc9vkFBqqHbZtf515djuHMgNsk5DPgB9gygGIGZf2QYMvjEgE5zX+FDn0?=
 =?us-ascii?Q?JHaB4AX6vzX44ozEnb7f4L0cRScu5HDCFyuBrAtIBKLXWmMLgyU1FvdvpEuO?=
 =?us-ascii?Q?PRF+w0xn9OsB7Lu9WgGNs2EUO+uQNqGnsT36E3mG91I5utkUGgkVN9Ybh5so?=
 =?us-ascii?Q?zekzY7vH2RlLoeK1JWY9COY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkS0HDw3dayvu7mNhBJrGceCD+N7+DA10Hq2uhqGDBQ4f59sv91dGeqwxSep?=
 =?us-ascii?Q?j/EVNWYln1/rc3RygoL5yOqUMDAXjJppayfLppqTXbh+swSoONvB2TmJOjkV?=
 =?us-ascii?Q?L6I7LLVwqlgr0WaYGhikdXkOZMQf2h+Lo0O0Xwhgou+1ZQ11f4aReZBJGpvD?=
 =?us-ascii?Q?fsOipQl2caRu11yAs91vODTQMNqNB6EElth9nfeiH9fH+9DWhaliseywCw5w?=
 =?us-ascii?Q?wLMgFxmhLuEiyWcjUc8qTZ3EXwFwuETinnFVPYWDuvmFhtdiz8T/5qApsHc4?=
 =?us-ascii?Q?dsSiL2+oweHOLPeZ/eIXuFtdBjutScuVgRhJES38rVMWnaGhPw02QKsaN22X?=
 =?us-ascii?Q?4KOppym413Ekfv5r0aozhxDERJvjSa/WyP6rYNrISY1LqHTJn2ntftL8p/7M?=
 =?us-ascii?Q?0PBSsg0PNqkdwAyEbSu+ZH4WSXbdDUWRBkOaEBmw0E6xwGEcUcOMUy6XkU60?=
 =?us-ascii?Q?M6zeT2XfZ63tGAyWtz1G6gnXoietdIIg+n3fph0FLHrMSwbCD8DUcPDb0EUf?=
 =?us-ascii?Q?AYT6Jzawa8IAHLZZa0OiTTeD1IJPeZ42vqrMF5RtcbJxFrwl+3DlRBSXQMP0?=
 =?us-ascii?Q?dFw4/TsrCcShxoUPxjkjUrw2VHytYsGShcHOQPCoNQeauO7qMFFHOf5YzJ4T?=
 =?us-ascii?Q?IeNC4XrEFREtg78oBi8LBxdVPjT1F/WBPyYe9ty7z7t8j7dXzOo5YtnB8rRD?=
 =?us-ascii?Q?r71rveaFXqIfNjdTdDwVCT1lHR9UGHgGKYvB1gjJypkAY7aP5hU8B3jUxgRs?=
 =?us-ascii?Q?GPPi9fHhGiZvtc/ckWwUpdjQBjNL0UgxDTH+fFTLrlxaQNBOWQkvN3esrVco?=
 =?us-ascii?Q?bznckLJeqezK+8jXqhSUA7k0VNHUB6SEZoLXci+rJWv7RtMSXIiAfsbPLwUn?=
 =?us-ascii?Q?jW6LRjUe8QPf/iGpZ2GXjR9/Rj0Rp54YOfdu7CE7kyyb7BEFZOPfO/af/QWt?=
 =?us-ascii?Q?3pyrv94+OuqyOu7+YXUUW4cR4LuLrRZbZU6QJkhmyetNhtstRVjwHXEIUhNg?=
 =?us-ascii?Q?oSnWIlpZly3PGI4+SwI7j0x5AE4uUwdWKo+aGsE4BA7GWiO+OEU9R0tt6sO4?=
 =?us-ascii?Q?YsaKquPqEPgBwUjGYZ3xAfPy0ux5JALPp64foxapgruN/EZN/EbE8+5jsbYG?=
 =?us-ascii?Q?LCCPdePuH0zIOrZNh7yf0tQesPKIMKH1S4N5ctA27LS1OPuP1PWmRDAf9KVW?=
 =?us-ascii?Q?aYzq/zAHbE/HmPRYXA1uYwHkQrwXd0UvI6SiYi9vqlza1aO1r5jdTCkf+S7W?=
 =?us-ascii?Q?8R8TVZlCx3KK9F1BBRYIIRXZbfDJiTa+hcxJUDWPM56Rq9UrBwl2N/ER40BY?=
 =?us-ascii?Q?45GvXAUM36Q269HWEnJ80kKIdmi/NleOsxu5BGmEPSa7Kv/jwsBPjnlNUrNz?=
 =?us-ascii?Q?Tclqm92rDyDB0NmTtaofuwpdJUAHpcR9iavRzmI19e1nznqwBvpgvMf+BNAw?=
 =?us-ascii?Q?yNW1bzXE2w4ST+9Iro7tkNvt4B74jEDmr3Bw7VleirWnwh24X4HH0LWNNbP1?=
 =?us-ascii?Q?Br4xESSIW3zNZcoYsNyMdTF4xZD3DSEmVyPMdSZQuX3j+DakoZ/4cjcNU/aS?=
 =?us-ascii?Q?CvecgdaGuxjdaimEsZCmQrOn6tmipcRuih3WF87XJOdF1J4jffQ4ubaeg4rX?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wkffVS9cMSZCc1+ttoabanaYLLfBEmzHcyRfGPDmU5yBmScVcPUGC4/y1IuJkAlRJQIj50QKMoRg0xvS6AFoQbLM5Wjg+y0pxzWPEoXiRBNlh46wh0OSsfzCmf9577W2i0jo0J4I/pz5FLzn4oq4mlSuyKAzixGFvsxS4yW+vQXQ2/kNHxpxAPWA63TfEZZq7UlNgsaHDciBTYMas/6CYat257eK09S2SKu8ZDIWdxMVlYRjGPdiJqErxgwBdo5anhLWZ6Y5ti6IQPVSbzW8pE9reCzNYM5YJYmh/tPgy1lXVyr1dPNXJwBHxTRJwTtDnI8yy7qIEdPlZkHETwqOZWXHKKr4UIxjWRVzBsx90xGqqURkgtOHnHpAEhOecQmq8zhy8EFUOSYIhXIB4UfprC/rpuRIdf5EFxGPewGq0NfefXpZsgcLUmFUJPM9s83Glk/5ANMELhBZUqrZw5LI0QdD7jSMPvo+Y/RUGphKGewGpF7g6NGtm3kQ+mZpCFLBb/ZTIMNA09g6Rc78D212BObTNeleb1djJ+pG/aJrvA/MEX4NnW56Hbuo6zSWf+pZlWrQLmkh3P3GsqynPT5v1Lvrcvk0nEh7jf3E2FrM0oU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdf4580-2c9c-4088-8405-08dcc73e937b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:51:15.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOgyTXkJfDjDtCQcTb+n0ozcWES4P91tiML8ak7seR3Yrzx0WWOgsX+DuwX3g/ItOvfS/ZQKspi4g4MsUfrcuyAJfSwBJHfbCzybrWvFXjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280062
X-Proofpoint-GUID: i2e8KKvkvsk2nE9zgUuMKvzjDplk3tOh
X-Proofpoint-ORIG-GUID: i2e8KKvkvsk2nE9zgUuMKvzjDplk3tOh

On Wed, Aug 28, 2024 at 12:42:43PM GMT, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
>
> commit: 131e4ef350fae9d7bb5077330f4a7805d429d4b7 ("mm: change failure of MAP_FIXED to restoring the gap on failure")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 6f923748057a4f6aa187e0d5b22990d633a48d12]
>
> in testcase: trinity
> version:
> with following parameters:
>
> 	runtime: 300s
> 	group: group-03
> 	nr_groups: 5
>
>
>
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +-------------------------------------------------------+------------+------------+
> |                                                       | 80cb1398c2 | 131e4ef350 |
> +-------------------------------------------------------+------------+------------+
> | BUG:kernel_NULL_pointer_dereference,address           | 0          | 12         |
> | Oops:Oops:#[##]                                       | 0          | 12         |
> | EIP:mmap_region                                       | 0          | 12         |
> | Kernel_panic-not_syncing:Fatal_exception              | 0          | 12         |
> +-------------------------------------------------------+------------+------------+
>
>

This looks to be the already fixed [0] as the stack trace winds up in
vms_abort_munmap_vmas() at precisely the line you'd expect.

So this is already fixed!

[0]:https://lore.kernel.org/all/20240827225835.857A6C4E674@smtp.kernel.org/

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202408281008.b26bed01-lkp@intel.com
>
>
> [   36.945736][ T3519] BUG: kernel NULL pointer dereference, address: 00000000
> [   36.947543][ T3519] #PF: supervisor read access in kernel mode
> [   36.948751][ T3519] #PF: error_code(0x0000) - not-present page
> [   36.950005][ T3519] *pde = 00000000
> [   36.951050][ T3519] Oops: Oops: 0000 [#1]
> [   36.952388][ T3519] CPU: 0 UID: 0 PID: 3519 Comm: trinity-main Not tainted 6.11.0-rc4-00360-g131e4ef350fa #1
> [   36.955401][ T3519] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 36.958508][ T3519] EIP: mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625)
> [ 36.959891][ T3519] Code: ff 8b 85 0c ff ff ff 85 c0 0f 85 17 01 00 00 8b 45 a8 85 c0 0f 84 8e fe ff ff 80 7d c1 00 0f 85 07 02 00 00 8b 9d 7c ff ff ff <a1> 00 00 00 00 83 7b 1c 01 74 0a 3b 43 04 72 49 39 43 08 72 44 8b
> All code
> ========
>    0:	ff 8b 85 0c ff ff    	decl   -0xf37b(%rbx)
>    6:	ff 85 c0 0f 85 17    	incl   0x17850fc0(%rbp)
>    c:	01 00                	add    %eax,(%rax)
>    e:	00 8b 45 a8 85 c0    	add    %cl,-0x3f7a57bb(%rbx)
>   14:	0f 84 8e fe ff ff    	je     0xfffffffffffffea8
>   1a:	80 7d c1 00          	cmpb   $0x0,-0x3f(%rbp)
>   1e:	0f 85 07 02 00 00    	jne    0x22b
>   24:	8b 9d 7c ff ff ff    	mov    -0x84(%rbp),%ebx
>   2a:*	a1 00 00 00 00 83 7b 	movabs 0x11c7b8300000000,%eax		<-- trapping instruction
>   31:	1c 01
>   33:	74 0a                	je     0x3f
>   35:	3b 43 04             	cmp    0x4(%rbx),%eax
>   38:	72 49                	jb     0x83
>   3a:	39 43 08             	cmp    %eax,0x8(%rbx)
>   3d:	72 44                	jb     0x83
>   3f:	8b                   	.byte 0x8b
>
> Code starting with the faulting instruction
> ===========================================
>    0:	a1 00 00 00 00 83 7b 	movabs 0x11c7b8300000000,%eax
>    7:	1c 01
>    9:	74 0a                	je     0x15
>    b:	3b 43 04             	cmp    0x4(%rbx),%eax
>    e:	72 49                	jb     0x59
>   10:	39 43 08             	cmp    %eax,0x8(%rbx)
>   13:	72 44                	jb     0x59
>   15:	8b                   	.byte 0x8b
> [   36.965467][ T3519] EAX: 00000001 EBX: ec941df4 ECX: 0003d5a1 EDX: 0003d5a0
> [   36.967583][ T3519] ESI: ecbf3090 EDI: ffffffed EBP: ec941ea0 ESP: ec941d94
> [   36.969628][ T3519] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010246
> [   36.972151][ T3519] CR0: 80050033 CR2: 00000000 CR3: 2c027000 CR4: 00040690
> [   36.976717][ T3519] Call Trace:
> [ 36.978114][ T3519] ? show_regs (arch/x86/kernel/dumpstack.c:479)
> [ 36.979568][ T3519] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434)
> [ 36.980890][ T3519] ? debug_locks_off (lib/debug_locks.c:44)
> [ 36.982519][ T3519] ? oops_enter (kernel/panic.c:624 kernel/panic.c:682)
> [ 36.983919][ T3519] ? page_fault_oops (arch/x86/mm/fault.c:715)
> [ 36.985598][ T3519] ? kernelmode_fixup_or_oops+0x68/0x7c
> [ 36.987717][ T3519] ? __bad_area_nosemaphore+0x11d/0x1fc
> [ 36.989674][ T3519] ? search_extable (lib/extable.c:118)
> [ 36.991264][ T3519] ? search_module_extables (kernel/module/main.c:3277)
> [ 36.992945][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625)
> [ 36.994489][ T3519] ? search_exception_tables (kernel/extable.c:64)
> [ 36.996215][ T3519] ? lock_mm_and_find_vma (mm/memory.c:5883 mm/memory.c:5938)
> [ 36.997911][ T3519] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835)
> [ 36.999481][ T3519] ? do_user_addr_fault (arch/x86/mm/fault.c:1452)
> [ 37.001030][ T3519] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539)
> [ 37.002529][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
> [ 37.004196][ T3519] ? handle_exception (arch/x86/entry/entry_32.S:1047)
> [ 37.005567][ T3519] ? alloc_pages_bulk_noprof (mm/page_alloc.c:4528)
> [ 37.007193][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
> [ 37.008933][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625)

This is:

In mm/vma.h:
static inline void vms_abort_munmap_vmas(struct vma_munmap_struct *vms,
		struct ma_state *mas_detach)
{
	...
	if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) { <--- here
	...
}

In mm/mmap.c:
unsigned long mmap_region(struct file *file, unsigned long addr,
		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
		struct list_head *uf)
{
	...
abort_munmap:
	vms_abort_munmap_vmas(&vms, &mas_detach); <---- here
	...
}

> [ 37.010396][ T3519] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
> [ 37.012303][ T3519] ? mmap_region (mm/vma.h:90 mm/vma.h:187 mm/mmap.c:1625)
> [ 37.013810][ T3519] ? mas_prev_slot (lib/maple_tree.c:760 lib/maple_tree.c:4553)
> [ 37.015420][ T3519] do_mmap (mm/mmap.c:495)
> [ 37.016772][ T3519] vm_mmap_pgoff (mm/util.c:588)
> [ 37.018235][ T3519] ksys_mmap_pgoff (mm/mmap.c:541)
> [ 37.019761][ T3519] __ia32_sys_mmap_pgoff (mm/mmap.c:548)
> [ 37.021406][ T3519] ia32_sys_call (arch/x86/entry/syscall_32.c:44)
> [ 37.022995][ T3519] __do_fast_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:386)
> [ 37.024620][ T3519] do_fast_syscall_32 (arch/x86/entry/common.c:411)
> [ 37.026203][ T3519] do_SYSENTER_32 (arch/x86/entry/common.c:450)
> [ 37.027715][ T3519] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836)
> [   37.029275][ T3519] EIP: 0xb7ff1579
> [ 37.030483][ T3519] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
> All code
> ========
>    0:	b8 01 10 06 03       	mov    $0x3061001,%eax
>    5:	74 b4                	je     0xffffffffffffffbb
>    7:	01 10                	add    %edx,(%rax)
>    9:	07                   	(bad)
>    a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
>    e:	10 08                	adc    %cl,(%rax)
>   10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
> 	...
>   20:	00 51 52             	add    %dl,0x52(%rcx)
>   23:	55                   	push   %rbp
>   24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
>   26:	0f 34                	sysenter
>   28:	cd 80                	int    $0x80
>   2a:	5d                   	pop    %rbp
>   2b:	5a                   	pop    %rdx
>   2c:	59                   	pop    %rcx
>   2d:	c3                   	ret
>   2e:	90                   	nop
>   2f:	90                   	nop
>   30:	90                   	nop
>   31:	90                   	nop
>   32:	8d 76 00             	lea    0x0(%rsi),%esi
>   35:	58                   	pop    %rax
>   36:	b8 77 00 00 00       	mov    $0x77,%eax
>   3b:	cd 80                	int    $0x80
>   3d:	90                   	nop
>   3e:	8d                   	.byte 0x8d
>   3f:	76                   	.byte 0x76
>
> Code starting with the faulting instruction
> ===========================================
>    0:	5d                   	pop    %rbp
>    1:	5a                   	pop    %rdx
>    2:	59                   	pop    %rcx
>    3:	c3                   	ret
>    4:	90                   	nop
>    5:	90                   	nop
>    6:	90                   	nop
>    7:	90                   	nop
>    8:	8d 76 00             	lea    0x0(%rsi),%esi
>    b:	58                   	pop    %rax
>    c:	b8 77 00 00 00       	mov    $0x77,%eax
>   11:	cd 80                	int    $0x80
>   13:	90                   	nop
>   14:	8d                   	.byte 0x8d
>   15:	76                   	.byte 0x76
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240828/202408281008.b26bed01-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

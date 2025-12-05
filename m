Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6C31282B;
	Fri,  5 Dec 2025 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764945223; cv=fail; b=AOwTiE8nbA2XKYrfPIroB1seFEho7UmzuzWoVisr/oQpvB999nXpovJ54HEQyV8oY2LYQjWjCwqm/CeAx92qtpVCm/wH6PODpouZwsK7ifBGAgsvwFs5PDtmkL5dE0zqgpwfD8U/oNb0beaDP8mYN8yzfoPKBfUAmf/zQhu3lBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764945223; c=relaxed/simple;
	bh=TH1ZBWGoABNDZ1nnPoD3x67CE5bRCVDpYcaC6x66wpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hv9ugIu7o/j4MrQzB0X+ZtOoswxzebItoETGSPJv3Eh6oQA2Y88ZN+cRFG/X8Lbs3ErIQUnVrEauxLZZpOAmFMeD88BGdkIDQFkoi6gt3I/eawlczMiuLtcWiVcMfBTw4O+zGL2GFqT+HjH1xIUQKYtBp+YpCv0lWWXYG1WWSBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q+doPc8o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P4OwC9xS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q+doPc8o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P4OwC9xS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5ECHDo4035889;
	Fri, 5 Dec 2025 14:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ireq54OXBad89qlFmE
	QJGEHu4rpKbkS/E6NlaPkrFpE=; b=Q+doPc8obRhIFLeRACkALe8rFYwZH9OZGD
	yWaVl7fPNNJs3KyxyY/PHm0vsQEmGNmoo1A37yRubLDLKV1Au3xZWnMFfVEBowpi
	2AuR1b2lxAyF8GHDhtlEnVVAp870b4VOv8kF03MUlqkmJsM375/iIH7HTbRm7Tlr
	dQRGj2AZnAgnD5i8E9msr1Pm5a2Zvxv8n2aOI6OUTBJ1ITYQXjvftXMoYqvwlglX
	JToKIqo8wwX/C+lzdWHamfeJx+Q7BYFXLf8NQ2T8w1jyOUllB3dNCHF5JKJhvKL+
	myXloM34Iwd+fSf8uAgmhfsA4ryt3VdtnrFqrfb47Gfd2YIXQMTg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as86yj31v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 14:33:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5DTZHh004661;
	Fri, 5 Dec 2025 14:33:36 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9dgxky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 14:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqG7ScefqQw+s93tYRqy9MRRRGFSY45amXDqCmvks5xZ85p4jUn0ND9aVcDa9kNmvYeFBuuSQ6Iyoxly6QsMO9+T45bOjWf7ZLLp7TgeHC5mE1+xLUhSqIUYYveMIygzrOAe0rSLbDFO22cP/CCW94hEms1Dg13v4gQdqXvLU2FJv1rlO/HYB1s4/HFSN/7xayraLoFLaICdeA7FvC39Wwec1OgIN9qIuwTPbIVHpjqa7iyzhOPjz00B3gPY/30RZcV5PVtQjbzYn+Les3DLTOlZB7tqpol81Z42WTmVzitxVixA1bx0lbqT1BCP004w1J65pg+g4j+ZwP0AfaFZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ireq54OXBad89qlFmEQJGEHu4rpKbkS/E6NlaPkrFpE=;
 b=S8KEjgAGqZJTUDYKKVZNYwGKn6PH9pw4GeBynxN+MHs5lmVWcBubiNbKGTg0gTBYZsjpHi1TbpFkJqWEtaB0CHzOGlY9bEZy9s6Q6lzq7uoukNHN1uEg4yT1/Q2CkIlkaO+njQI/7TK5c2mOf3ozMKKM3rMihrukUs3jXUdF20oqtLsQMJMim5nxj2kEQT76HBrxbGdFZ2d5vLxwW6HQ8SMB0JsIjFuHUywpZFmEp8JzfUVYcFdhagaX2qFsHoYwWf775UsWxictpvfTHS0hvcBuZByEf6mlMCQj3a2E9BR9min+A0tQNW7fzFJfMwiIArv8TaliIxYVz0jRXtSOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ireq54OXBad89qlFmEQJGEHu4rpKbkS/E6NlaPkrFpE=;
 b=P4OwC9xS2YkoIe93gG3Rp2gT7Tgwq65zBNbCrehtoA7h9IvE8+P4Zn+4wrVdigQE7+KOwIum3VsiYh79B92A4usfDvENDFWZbOrJv8tXPY2io4kSHj++5lXM4cpxWYzaHvf5kfjqLyYITmQDegbdeqUIA733Q9Wvw06ksUst0uc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5209.namprd10.prod.outlook.com (2603:10b6:610:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 14:33:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 14:33:15 +0000
Date: Fri, 5 Dec 2025 14:33:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [mm]  2b6a3f061f:  stress-ng.msg.ops_per_sec
 34.1% regression
Message-ID: <3f10e398-5bca-4b8e-aca0-750a1ecfdda8@lucifer.local>
References: <202512041634.150c7e4f-lkp@intel.com>
 <f35b0909-c2e7-4d28-b2c6-30725bf2011f@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f35b0909-c2e7-4d28-b2c6-30725bf2011f@lucifer.local>
X-ClientProxiedBy: GVX0EPF0004F083.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::631) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe42039-0e07-43f4-852f-08de340b39e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3epNSWmmqzOzRc7VjkCxB4dGawE4bjlgyA7caeL+rlajXwyoXokj9L2fKrDH?=
 =?us-ascii?Q?DWqUZMhDWLyzEigQ10dSey5VL1EnWgBiD6apObOgxa+sjj1aDM2jME4EMaPs?=
 =?us-ascii?Q?i6vIqiKOy2tzH3Mh0vocoPHIX/o2FQTaCjB2CbqencAkF6D+dmPzMOYiHbyT?=
 =?us-ascii?Q?hmnZLD5igeSt1ou7EyLFI7iS1itHlQzFVm2scIri/31oXOvobwzz/oFkA0F4?=
 =?us-ascii?Q?9QKzkUNcvl3lv4TsCvzj/BRerpaVy/So+ubS1lBov+yLxC7rQAorpbX0uW4C?=
 =?us-ascii?Q?VDHr3fihL0k13wLDX34VPo/6GJ0wG49+7BuSQ9T2KTLIFZ6hbqBDTv16CKjq?=
 =?us-ascii?Q?KWoDyjEgJGeUpZwOAEiNpPI6XPiv8Le4WVI16/I7xWsCP6a29jGZ2Fitx16Y?=
 =?us-ascii?Q?MFc/7e2iwqvKPVCHcyb+sv2JmWK3efWyQbTtNxLQy9V8yaj0v8UjC2STenu6?=
 =?us-ascii?Q?ZmgTZKQMehy5fZVgCk9/HjH4muU+uiUPUUzgCAEfSEAFzfejX1vRQawehQmP?=
 =?us-ascii?Q?pLlZ2TZzgJvuN6CSLEFXZXXGYC6mIaD+5MxQj6rNDO53L7esiM350XSPKIv7?=
 =?us-ascii?Q?sklUDORwAOZCr2mxQGmWw3X6JGKul9x2IBGEqYPHv+sNfjDQHqw0Sw9Z7pou?=
 =?us-ascii?Q?xQPGjBl+dA7DFrhqW95cPLWq0eMtXHi1ec+rZBQQtCRq/nnV/gPPxP5ABMTZ?=
 =?us-ascii?Q?Cta8ZD9ZSqFv5Yplzq937zXNZigPChclA7WeTxvt3y8FmsswYYJyy7LsiEfy?=
 =?us-ascii?Q?O08U3IOktzPk3fxt+zG9opWcs8uPcGK/i1cDKxU7ScbXODBrf9oYk9Zs4JUc?=
 =?us-ascii?Q?uS+aaOcN7XAewOjzhyxWnjMySm/L8F6J7LH59c+IBbD6tSqCqQnHyf0O2E1D?=
 =?us-ascii?Q?gKznpFPwB0/PAJ2slYjQiH35h77gCdS6gSErJLM/ANzEVDpoHQiK//ptaAiF?=
 =?us-ascii?Q?1pateLQNoVAwWcjn+ZuJ37a72mxyY6lDCbLvYZOSd+xICQlAsvDXY17K/Uq9?=
 =?us-ascii?Q?qmX2Z3m+P6xEJwwWZnA7V7jcZViYP5NyovuEDKrgghREjOoumLXeL2mjPUqf?=
 =?us-ascii?Q?A55PyiU2PMQFOHNpqJGDY3BfQgvuKC6Q0MYllUxaHKAw0YD6oO7zggQdCQTe?=
 =?us-ascii?Q?9Ic//K/WjnkuQcNJGTK1KrSYVHrFBG2vc8Au7PbkAGTNrpZPs0zYrVW0tx0d?=
 =?us-ascii?Q?NwCgmZqj1DJNXC4d1lMSxzBQqGXML05iSTJXSE84fIxwM1RKgjyQeum5Pf/z?=
 =?us-ascii?Q?bim+Ka2C3w/JUS5ynYEYSimtvLfPU5+klSXR1MW13+ShyJfBC4gE9LNot3xk?=
 =?us-ascii?Q?O0yu+LdaPVtmsYtE4Te3EkQjJZuMvfMVQv4yW9o1sGXET79zi6aygnUAQ31A?=
 =?us-ascii?Q?vZBRIv0/MXqTbNn3hpYMAUrKAcWiILkIa2Gw+H5DVrPn1NW5bEUDPPrJMVZX?=
 =?us-ascii?Q?CSm4dYxVo2jY16ssX8RyBtQq+303E72b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m3M5OylrxCr0ByBy7TcD8hLXRIwtevOaFuwUPjL7/scNurOVVDHfZj2yjK0q?=
 =?us-ascii?Q?q3d/38h3QpBxbBUMnD/sWfeft1ZQ3HXOVD8qE5KEeHlak74ItVPk08OYe7Y9?=
 =?us-ascii?Q?2SPDddxJ+dR49/fMHPhjmuAwyIQQCbHVOwSUw9SC+hyOTTpxmCRCqCXhOd5j?=
 =?us-ascii?Q?a5A2+RE4bXoK6o+sMRGQk/myGOgQ2ZYYkrdNxf0ADGsEuEXNSAq+ttL2+8gm?=
 =?us-ascii?Q?HQhoyVyYqOFedNj6rE0UPTNNsQHnBYqVLOo26y40LaucrszPHsxidiTfMHni?=
 =?us-ascii?Q?lUTU7VzZaZ8AhIx3vMyl7PFPaPkCAp/a2+wd7RVn1/jXW3xZSJO93IW9PCMW?=
 =?us-ascii?Q?MYUFZYCImH6WF8NJbYE2jpOZjfMVZrHmxT691t902cCq2fMO1qshnCAmP3Fy?=
 =?us-ascii?Q?XT2oF9DvceWbArxb4ZoAAQsL0oHA6zWzJV0u/qjdB+mt6/FWHTukHMk+5+c3?=
 =?us-ascii?Q?808ah/Z6CqFZMO4UiE5YlD2Ah8Zk2DHDgxYolH6jhmFohIYueRXT/mF6G/DI?=
 =?us-ascii?Q?/uLPLLjF4KYTL3AkVt4NlDUfFVJF1EbMZxASDyMRfBH1+toLN9B8nVs7oc87?=
 =?us-ascii?Q?SvGqHVxw6j051SfKUzCaPEPUu/DZDwZ0pNkCXDiFVwrL4263XPLJKfKNQFyr?=
 =?us-ascii?Q?3KLhy2a6/0Gb2FS6+5FBK9QQG3LHqa99AVNwsAEiabRGjg/KU/7zshFKC+KK?=
 =?us-ascii?Q?1ywxCGQsbKit7tKwer8pzYBfItda++wxiRBYsKWmSJ16XlAGkh3ajZbJRzhR?=
 =?us-ascii?Q?iZ6oLFBb0A1sIGOT71rh0VGWURUQfqd9pHrJR/sjxL8aq/hW2IqR0NaZyQpl?=
 =?us-ascii?Q?HbF3r3sbZ9UQa8Vm9cAa8b4TOu65rh1IRrhScx4G/huyDq4SAfF4arf1AB9j?=
 =?us-ascii?Q?POmcwNYIzPwB/UWqPBn0zTj4PpOis/MqkA3q8XRqMhK5WaHpn51JBi31F7O1?=
 =?us-ascii?Q?6o2jyRXw8fTLaF4BdPuxNKNajD1doWWIDvYwSjm2poZ8OeeqHSh5rhug12AM?=
 =?us-ascii?Q?1PfY/yxKqSzqrldMUZeaGh/7KtIjVz5c5o7pYKLkK3RrteeeHCuzsZlOIZ5x?=
 =?us-ascii?Q?1pn9wzS283pJ9E5mC9G/VDqnSVg9k9EHbsTyqqnx0n85Oi8q8D546iBB65/4?=
 =?us-ascii?Q?mw72dAFWmORMruxuC3Ce/paa821Xlxy5FlzmjMZbNhvnJbtCQsbSqhicbo0l?=
 =?us-ascii?Q?iU58rnWBE1wP50AjD04o/VladXfTjU/1Yg+ryhLoxopg3AGhGSGkm9jVCfy5?=
 =?us-ascii?Q?F/0Aypq40lqS1ioLjdUnEFqoX/G62LhOZxUvs1LkhzdRlQeh/4mnw70HHItP?=
 =?us-ascii?Q?maJfxXu5YDKPG8l70bjH1FtkKsAph5SqlisxmVhpQbojicL1P9wmv5kIkI2O?=
 =?us-ascii?Q?OUpxxSaKa99CPMuG6XO9yG4OBDz1NtdGwX9kR3bF1Xz4HHM2z+NWpiqxbRMY?=
 =?us-ascii?Q?eeqoUSrQWGotblzT/dT1FB38dibwjR5F0xogWoaLKsTKBZb0Hs9kVKDBASeM?=
 =?us-ascii?Q?OgblP5J/ZUYzbbgwn3zfigdez7pJAVhV8ylgfOYNw8GJPMdGbNFERa/H6Weq?=
 =?us-ascii?Q?Ky32PmGpEkzAT6qaJsFYXF9Iqs5p6lXfqPZR4YAga5bYnJgyW7Lgs93k4thN?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iR6jt2uENk80bbbIz06cXemNip8NIXaQE47KD8upbpeYHRXx4l2S7kY6Rg+JSU/nFP+pZML3qodf//d1DvQ5KqrNlDfsJnnM4eTBRE1H90+2BIgskVEUk9REkjOTyemcerE6h8xgaXyuPcacUnq+NBHV7slkXzxs6MvFHgLf0DOe22+JOEBNxH5cvbtXFM+mXXYEipweGYN7YaOOrReqOVYtUdOZXIioPzckNlQxaPb/8gIQ7iAZ3vvbUR8CZ0/0O2N2v6pihbPRU4adVeYi6YRAqjEu87nhaEoltboMY9BMSHYO9iETSKMgEpw/ui8eDp0qxwLuQK5Wps1WWc4QSIhtYv2wo+Td5CFJeeD6jmqB4JUACJE0uNyKDyiPM+6Rsf343nLH4Kl3Wy1fxN23fONIPWToextqGRldZQNyws+E9oaiGHanYWXkpfy0xUBbyNvNeMy32Hjl6aIy250J8fGClW6aesom3LY62S2oD6joJv9NGOxkZBPDTZosyov83p3hU3Chy09nnVvo53Z3vwLSydqWlU0/HIF+JcOjgLBpw2VkySIMudE0nHLz91CVyBUbGHrAGlskQA3yIzWELWxOwqQo7gRUfV4yr4dlfPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe42039-0e07-43f4-852f-08de340b39e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 14:33:15.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZWWsNpQKAAPL9OsfdCamrqCUFIx0ohUvpDNpISvNU6OJ1O5CtJvf+x0N1CbSGO13LGYJw4R50eqkBTWp9EkAYNwoMKyhpS9myzP8erqmQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=968 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512050105
X-Proofpoint-GUID: -rvlsgLV9cNQEvUCbBPodOjr_9Fjn8uX
X-Authority-Analysis: v=2.4 cv=AaW83nXG c=1 sm=1 tr=0 ts=6932ed41 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rtf5ve0gEGRHhCDhAaoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwNCBTYWx0ZWRfX1XdrlA6lJzOz
 iJiuWwmkp+L/z1INQYA756X4bMML8agiK2ft40l4u+ZhAOyOGaeZk6hWh9ck68OOOYncoNT5RvQ
 jbfbKR+Ibnh7eELMwXA2W0F8D10CzI5sfmY04o0GAykxCOw9YgEmDxduW3Gl90YMpl/TTalNF1L
 zZO195aViCfQmRRG0CHfs4isO+z70MWa3SXre2ldDiEdkw0nzBuEnGaVLblOPke5mGr8sQU4Com
 dBaFjiMqkCImGQ9P8Gg43qIfztPXKPWwOPO2idbZWsgywfkj46foDWel9EjRbcmjDratfP8uN8r
 PLI/aO4L5W/qNVTMMVkIE6vYm6MQ85OMCl8VAEd4tl1LGKm8NGP2b9wxGeJmtxWsEaCdjJ63BHo
 9AOGRFggwyFY4n30ShdFK7PXc+mgAQ==
X-Proofpoint-ORIG-GUID: -rvlsgLV9cNQEvUCbBPodOjr_9Fjn8uX

On Fri, Dec 05, 2025 at 12:11:23PM +0000, Lorenzo Stoakes wrote:
> On Fri, Dec 05, 2025 at 09:41:37AM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 34.1% regression of stress-ng.msg.ops_per_sec on:
> >
> >
> > commit: 2b6a3f061f11372af79b862d6184d43193ae927f ("mm: declare VMA flags by bit")
>
> This is strange, as this _should_ have no actual impact on anything.
>
> However, it seems that <= 32-bit flags being declared as de-facto unsigned int
> is the delta here, and by declaring everything as an unsigned long via BIT() we
> have inadvertantly undone this optimisation.
>
> We can resolve this by having two types of INIT_VM_FLAG() macro - one for 32-bit
> flags and one for 64-bit flags and using each as appropriate.
>
> I will send a patch shortly.
>
> Cheers, Lorenzo

OK, having said that, I've now been able to restore original performance to
baseline just by making the result signed rather than unsigned :/

I am digging in to why on earth this is the case, will see if I can figure out
which flag and then which bit of code is somehow relying on this.

BTW I notice reduced system time before patch/with fixup, but the actual bogo
ops/s values are... worse before + after the patch cited as a regression here?

All very odd:

stress-ng: metrc: [1662] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s CPU used per       RSS Max
stress-ng: metrc: [1662]                           (secs)    (secs)    (secs)   (real time) (usr+sys time) instance (%)          (KB)

(before patch)
stress-ng: metrc: [1217] msg           906205725     60.00    136.42    560.81  15103193.43     1299711.65        18.74          2124
stress-ng: metrc: [1375] msg           901766456     60.00    134.85    552.39  15028736.07     1312159.76        18.47          2128

(after patch)
stress-ng: metrc:  [776] msg           1186639996     60.01    166.74    615.22  19775640.54     1517517.09        21.02          2144
stress-ng: metrc:  [942] msg           1191427646     60.00    168.62    621.92  19855980.65     1507098.28        21.25          2120

(after fixup)
stress-ng: metrc:  [771] msg           906964106     60.02    135.62    555.29  15111666.71     1312719.21        18.57          2120
stress-ng: metrc:  [934] msg           904987762     60.00    135.16    555.69  15082486.49     1309953.15        18.57          2136


Cheers, Lorenzo

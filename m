Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EC21CFE0
	for <oe-lkp@lists.linux.dev>; Tue, 27 Jan 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508382; cv=fail; b=J6ArKYVWQskJQ03wtwYj/oAcOoZxHP0kn3ypcRBhT4B1B4bxyN/aOtdAH8xU/7QleDwDYokaZcQ5Be/m+fXNdXW7bfzpmE3PQsgGZ8EMJdfM4yipHRXBbzA5PdzZUfhwuIQR+L+WnIU75cwIGJg0FwjSYFuZ0XlM85oYBjzxzCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508382; c=relaxed/simple;
	bh=DCffnZeHGGM5e3A9Zr6Zz6K++L6mMFlxFysO7jUt218=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KlF07f+TnnBhDROsAANVDKWraNXGoedMcySw4N3yeUtu/9dy9BtHadJqIbGRUaydQWkRESIdL4ASCNTVMU63yxIsCSZSGSIdmyeHrMT8MNELdd4BzklwgPLuhuT/Xu7IbOPP/7oC6WRBu94Y18vp6lu9iKXP7CJYAys+XEc3Thc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TA21VWaJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kx0+q8Tz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TA21VWaJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kx0+q8Tz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R2xaLx3025479;
	Tue, 27 Jan 2026 10:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DCffnZeHGGM5e3A9Zr
	6Zz6K++L6mMFlxFysO7jUt218=; b=TA21VWaJWNowRXcx4iON4m3TsUEs334uWO
	poW2B8+vSnofuWbxe8vl2cq1yBKhgiohpVgSHUCxis6nXjZBLdE0nubYLJF8vnNL
	HspdCwzETMABM3skz/o2Beq9wWwcDeXbzItu/NzpC36oqrebT1M/11MpUNUZGopO
	L5rG0IYFCifsZYTQRdFMkIarDxrE7GODHS1U9IP1gq6SZ6hK2hgyFjI008SqyDyI
	cBN94qEfceQHUecbcPVmf6FkYrg+orPB+P3tFjWukbspuXh0vhfsNEpk2YzryiRy
	8Y3ftldxDB6hmV46a0+mSnzlRpHEcIGTfbho/AGshyy0zwBiqNDA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmv2urrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 10:06:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60R8mu1H012770;
	Tue, 27 Jan 2026 10:06:03 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh97d8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 10:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdZfZ4VB+gGON15rhUUfnFAwsOx9a2RZ2Z2hC45DuGVhVh8SGoUVVlXB67HU3vvf568RVgQfJQgrUg7YQkshhRwrKepzgdV9WecVzx0nSeXU42MZTw6SZu68GTO8q2URJDjj6uDhHC5NeCGL6dGjnxl1GJ2Qsimyd3jX8kyNwDTMDJd6XPESrDx+kJu926uQxq1/zSVAVyGiMStIsqJHN0ufhafAKt6pBRjeiZBYpobtCxUiWSBF1ly0sRo4l3dDDBPPNa8YDq8LTZiLiLmCEtvoa+CwPyIq/f/mYuZgFBqy2JPP2JgDn65OTjKhJiKHTeqy0B+mVm8YJ0piI1tgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCffnZeHGGM5e3A9Zr6Zz6K++L6mMFlxFysO7jUt218=;
 b=FDFA1RJ6bAYJkJFcKKO8+h30k17sPL/y2IGtBOLuTQ31AOWpGYqXh2+qIBAgulBinE9b3ozWWlepcdB70TQo6TYtoj1QHjeej5NUGyvJ3/qkF1R60E/q8+XcQBxAml2qkyLe+mTa7zD6xH9V1u0P/SQkIty17TxT2/6oGq37rVS6IHRt8tdZMGPV1m4B0Ixodgx6w74fNUYURBGI3oVeAU15Vz1g78AdqnHmaIKoAKmfCun5aXgAhay+Tbj2leZVzwAqXRtT9z9LpmG7tc5j+zkqmyx/0a+KjDthU3kKKnwcHY0Yg8ZHJ1vivvhgnInWI1dMV/SD1HLCaGoLAdQsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCffnZeHGGM5e3A9Zr6Zz6K++L6mMFlxFysO7jUt218=;
 b=kx0+q8TzekKvqF0GRGR06qDscbHa+ue6HvRK8URoPe8CCIoUaYt8SkEb4gSCW/6wISmDVomDpSvO3FpMy98M2p2cRZ1FEVJB9z9GZ+s7f67wbQYaBv9dNw5fC/5URKIZWnQPUlb6ljBiSvtBaoPYhwr4MVBS0xgPGIVSJvYtk0s=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by LV2PR10MB997776.namprd10.prod.outlook.com (2603:10b6:408:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:06:00 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::4ef1:fa49:5a08:c1d9]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::4ef1:fa49:5a08:c1d9%6]) with mapi id 15.20.9499.005; Tue, 27 Jan 2026
 10:06:00 +0000
Date: Tue, 27 Jan 2026 10:05:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Barry Song <baohua@kernel.org>, David Hildenbrand <david@kernel.org>,
        Dev Jain <dev.jain@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
        Liam Howlett <liam.howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
        Damien Le Moal <dlemoal@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [tools/testing/vma]  28d7ff9930:
 ktools.vma.make.fail
Message-ID: <a87f818d-7912-4d2d-9f96-11a57ada296c@lucifer.local>
References: <202601271308.b8d3fcb6-lkp@intel.com>
 <8b1135d4-387c-4c4c-94fd-22bc433a0e6c@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b1135d4-387c-4c4c-94fd-22bc433a0e6c@lucifer.local>
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|LV2PR10MB997776:EE_
X-MS-Office365-Filtering-Correlation-Id: adfe8638-7bfa-4ea2-d5ba-08de5d8bac23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q7L2Yipob9pAr2h72k4N57CHEDWXaWChTS/K6sjMv98gGdUn8visCGnobddb?=
 =?us-ascii?Q?ZAXpY409fnnmuRS5/+SPaZ42md5VDxWv3d4+ncA1xlfPeDpPR0SMFI6Wa7c5?=
 =?us-ascii?Q?ZnewJKkB2pYIZjJETmostppE4l8/tEB1/MEdolACuI8LxHfNIEz8/jcdCazl?=
 =?us-ascii?Q?GVLoDlQxS1mZUZQjEJyCfmsBTOU2Hd9OmXsydyCjKqwr5rgCPiWYOwk53WyS?=
 =?us-ascii?Q?xe6z8scLVVeesGWL0gu0Zj+2LAMoleIzJoimhYywsrzv2FLyPasCmkXOBnw7?=
 =?us-ascii?Q?gmjONY4Zh7La9ZBml0u9KwJp55mbR7soyCEKPuVDBROA+StuhmA5f+lQuu71?=
 =?us-ascii?Q?oVbsH9JlDKoQRQ5ZHdcTGDkP5MXQQy3Ob/C9bNHnjTPmETRk1TUOILT+jTeD?=
 =?us-ascii?Q?qaa9Y4YT3WcoAbagHSfWZvb0wdqQloMkF2H2pvSALFxe21r7157S9UvuB/rh?=
 =?us-ascii?Q?ndbJkhQrnGoQGzR++bxAt++tdgkIY28DdHUs7EBnkVQANg2WYBn1HGJhMdOH?=
 =?us-ascii?Q?13bv/zdmylvSVIZu5Ko0Fg4cAR1Ca5MdL5LsTgIuyBSUxm4fQ06ivq1BMQh6?=
 =?us-ascii?Q?TN/JVWRdNoVYl8Z2UDdO9KnWcFh02QNwdJq43J2vbebtjCUkVI1YceHgxqRI?=
 =?us-ascii?Q?zvU+PGfRaqPJvs/UxQinoGYKu9ExjbHeeqRydAQSSrDBPnYEh6ye1tsZ8Gmo?=
 =?us-ascii?Q?ehB/Iu+qwfNZY4RHUUBxmbGdrMlkZzV6Kq7A9lAnWpklZLtOKFwhvysAChEC?=
 =?us-ascii?Q?hBqgXF9f7cfVUkPWR3sOGhmjhdf5E40jk06L4XTF1qlMfDwhtWalbuUzMnPM?=
 =?us-ascii?Q?/1QUzIHVu994Ig6+6DQZrSXszSaMLW/zH+Y4cNhDRx3S7+zl1QK+E2sUWXli?=
 =?us-ascii?Q?vS9mluhv/9pmC02RarK8Ga3Y4GAoJZ6AwZDEz7BYzZk97+VA72n6DaUoj3f5?=
 =?us-ascii?Q?VhLY6x2I+15fj4HUaxw+6ObhsGLH7vGBSsWUzsWNlJCwyrZuKqpbFkXIpC1Y?=
 =?us-ascii?Q?dcaDim6+5vtfbwbUGmTWeNEL0elHjcgbD3UKV6PU/d/xRd9tVoyHFOYRYESq?=
 =?us-ascii?Q?xqbcrL2DDVRO1ktdM1ti25Mw8fxBojZOI9xjQZlJSzeFgfL2PUAuuahX0c5O?=
 =?us-ascii?Q?y3206SBrItSq4LGj0gycQqW2+q5oYRMlaA+tWCOwvM5KfZ2+t2pWHdmTRz/h?=
 =?us-ascii?Q?wCbWkguMTLWVmdEt7i+662dkAo/0Y1j/k2ZYrfjAjq7VuQzNySVof+NLASF1?=
 =?us-ascii?Q?Ey+2AC7lEQByUSR/ax1cOTOPE+Pmc4yS+O7/QNFnQymEbttrpZiifFBjsWtG?=
 =?us-ascii?Q?0PZmfijGeLVc7CwY1qlHq7HyCUAX2cYeuXgLwy4Lq5gEy4lBsHJI+zqlEeOz?=
 =?us-ascii?Q?WmbX5bn8Nns/wBXaZtqKXOOgT+GvOKwHSjgzdXO7qH/vt9n7S4f58sbnwRjv?=
 =?us-ascii?Q?Z6o2IwgXDFHW3J/tAVj0umHHCjr/2FBkPN69VebyLfklYs86o/dhxcH++ePE?=
 =?us-ascii?Q?aSy/QTMz0yeGouXYy0gnT7+q9smOrp1cNGH2czoG/d1oQJGn3yymxQdbh0zW?=
 =?us-ascii?Q?o553n+b82X+U2RAKMy/R6PZ63nB62Ux9CNw0250j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HG5akGmsWJ7JqrkqlnrrYCu8ydzYd57wz9t2uRRkKyTgT/vB9B+MUIVnLWCO?=
 =?us-ascii?Q?6kRoaDE4ngwSy1xzwCIeOtE/k4xycdBODQ9Foaix/PVRTyJ48WWmBwoF9wvp?=
 =?us-ascii?Q?XLwe9lU/pHzy+kk/0oLFBvQuMpb0yRTukyZhftWG5W4F191gCeaBUDIxqyQW?=
 =?us-ascii?Q?kMU4H26XJ34iHTdJ+mM6mO3oKuh/4LnkIGMrbLVH+9HSU6KmNqps5xwzyXea?=
 =?us-ascii?Q?71kTvLe2ZsYVE7AY/saXPW2G38n4SNxhCCf4Hm+aXYbgZPDW+UobZfE1ycz/?=
 =?us-ascii?Q?t5GiFUGG+wEyND4vMK2PqwPboXFwGY2Znh0eiBR7zm/LD5AyCz8CJ85jR2eN?=
 =?us-ascii?Q?8I77t0rQR9baQFNiCa/1aaJLTVQlH3hVIKAYQ5YJAQutIEQRBNQ/9x5nvdeK?=
 =?us-ascii?Q?gVpGVSaQSAljReopvDa5s09ZTHC13EaP+w8C2nOLEfiF3xxbH5R+fEzPe7fy?=
 =?us-ascii?Q?Fru5kA07kIflPk7ZREGkrtAkTI2FKuAvQ4Yoo9tugMYtii+bZG5s4qQ+O3lV?=
 =?us-ascii?Q?R9JW0XZEfsph4KK/A7aB7fvBPDbCkgz9yDxzRVZ7kzlMQgb/juZxIIxN039G?=
 =?us-ascii?Q?4IZS7UWdAfUAd/Z4QNWOc59jhjzdxXdZ8HVjSkXt/AMsNQOI+ziURYhwP6la?=
 =?us-ascii?Q?IC4m0z8EhqZt+tOf6rgyvrXnBSWdbfQuXpxJ3yNcJD0dfrO6s4MNslvZdkyb?=
 =?us-ascii?Q?+3GTxlwYCYSFPVXRpF/gxaZjjgaE1sItFdlZxppNRXywpDBkAlyAUmzlZec/?=
 =?us-ascii?Q?U5xyEYLkIkxG5yiOeOGTio4mGEi6Ju1C2gVxvocifPdX0p4+i+RTj4hiUwzL?=
 =?us-ascii?Q?RSP1UFMt6R60fmQUh6wXY0+45DNkN98HPVJaGtBOiyivklzAKcmyCSaRipy0?=
 =?us-ascii?Q?dYAxtWiLtGrzwskNlDSPL1cCv9R4zDWxRWOcJ++qnk4bJOxIHLonLIbG7NpJ?=
 =?us-ascii?Q?D+iIx8NBeUVZMkYG2VMrmRILMpAIyC7bNGG2xMY8NRbbCtKMsll1KDcsp6GR?=
 =?us-ascii?Q?1kMbuE2GzvByvQfK2bTjLMa98LalRIFrBkfq3l5nrTsgjjaTC4J5TvZpENUD?=
 =?us-ascii?Q?OyKkNW++S2W6NGZ4Tqo4mUZdaMGY8qsHYwdNkVgEu8GbfYWcJFdU7Kv9qXpi?=
 =?us-ascii?Q?mnNK1fuBwX9grma07YzXtt6ij2q9BDGzvDm4DSeiXvlgMmT7YzV/tLCNRQnY?=
 =?us-ascii?Q?xuyS+pLe3BY3hdwQnETDLOxz5p5fxGFKHdOd0a++VTkxB1pRLMIAWG0tBC05?=
 =?us-ascii?Q?Sr0XJMqq6qa1gxGxdYdSPOZJ0fBIzFZpzetmJ/cpboswmmX16saNCbFMGEYh?=
 =?us-ascii?Q?20tg+gIltJDF9Lg4HBPaUJrywCqeppbTdSHUaydsFo+85qvjIdR5/be6MhgU?=
 =?us-ascii?Q?GIY3xXPx7MoIzIyfGbHhVZIIOxQmLzk0yAAvEdaYuqJflrLHmzJ2nGQEeYrM?=
 =?us-ascii?Q?+4QjZ83/RPE1ma0jIuIYIcIp4vnwj7tj8luthHUQzkG3j/fzx1df7qKlFOrm?=
 =?us-ascii?Q?tVekS6lMWUqbNop5K8zGylNJ0qsdEaIR4pObN/6B3XKPLsx6PsHhRmGiijFY?=
 =?us-ascii?Q?kV4fuzEy7zHEXeLeKO3PJyttkobEYRUzlhlrQ9ps5g8M+6H9X+ntu6yzOep0?=
 =?us-ascii?Q?+JYhARAIctTf2TqrTanXlboy45fJ81IjG5QYwD/t0WPXFcZnN3Ql5KeUuwTY?=
 =?us-ascii?Q?CFYoTwPrRXz64vjlfoI+ro/vneyn4xNHvR71LQTkhQkj5KgkJ30gfSuUBFg0?=
 =?us-ascii?Q?3UQyD0QtYkdE1ppgTxsMHH1F77b9Bpk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PnQFjm0ZxPXfWb/ph2kcY8I/i0mxzK9hBXypo0dV2yi2ahb67DN/EMSoj1dribXQj78CRv0qnPynHrkAdRKjuuJg/bFtqxHQoHxE5VL3VjE7yoMy7Mki1eThEwALsJOPKsHmUtZ4sov2sV9uNNrQoFHI0Rv6RN17nWkaQZh2elPRhcFUvMLZ8fC0IDIYrx/ukLTnQRz4Wh0x4YyYpUqhgUOJnaWOuAgOT4MmyL5T0AC9pIVwanIadgutyc9mCk+TOJmaUOx08vI6dqxid/0OrnTXZCm+cLRdU8+z6XJJ3PGibw0CR17aXSBRIwyGOUk5+i5ciCvLUTWlBamWHxdiJXq28x7x7yF00Q5T21cQt0loelr6ud96tPE7oE2LZGXhoiWyvwpcJdnjl8DtPMTUbLiGHlJajrnKqu7vgh7dm3hfGRg0iAFUTb4dpDCONQh7XmspsN0aEPC7vnbZoStFlapBXYBolqqN8AGEqFr2Db50SvvwSs1lp33JnznH/Kzc8OVv1cQdrSwCCFKhAWKi1P0wL6S/qvMgDPatSVkx79Kw6tnTJgfop5+Yu7ODDKT9aKysIKdvz/FuS3tePXUBF5vuWvW7QSPJIDmT9mjJU9M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adfe8638-7bfa-4ea2-d5ba-08de5d8bac23
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:06:00.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnVdMJPAFSx3aJzczDqoSptsW1x7W+sRQP9kINx2Wa4Y7WzTir1Ua8W2IRNmkMwOgKcxUReHLI9aTVdfzKRyFnuczVa825l5OTaRIl1zdR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997776
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=834 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270082
X-Proofpoint-ORIG-GUID: GuNspaJN56Tf8tngBplW53XmjwD0Hwnv
X-Proofpoint-GUID: GuNspaJN56Tf8tngBplW53XmjwD0Hwnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4MiBTYWx0ZWRfX5Fzx/LcAJThC
 F2uOtavhFZGVjw2Ys7qzktAiEJDPgLoqtAkpefpmLOzZe8ssafLdWy9Md6+yfZ2glySvELHk7NC
 kqmn8IM+JELOF9tTS4h+RhTu53Qd8KXzccHFf8t68xrC73RIqJf1mbg7TGfBKXqAIpx57lch+Ta
 fRw2x4Yziyf61Wbc9vvle4LJUHY0i325WkRJOJRYfCKufKT/n0Kb6bRQQKHHEfY43X/6LlXiqJb
 Z43MalcPyzIAga/QXeMiG0LrtWJwizRLeV3U6QFnZmi2YQK1d/ZbckqRP5IpBgWa7xG9xmtQWyf
 OlSiGqpe+2TSkERJ+ERjBnmc4euSxGEtNlwpi/Im9Htm5xD9gYXP6JwiKNPSbYI+pZVqaLxj4ka
 kCFkFOF7QLpGpBNKUx/7VKInqE5IS8VXFoArH1MVN6V+wE2Kiz2x5TTGSNKvCWZ0/DfYCF3oJpb
 uv6FFuMyQLdeJwCT5zg==
X-Authority-Analysis: v=2.4 cv=cPLtc1eN c=1 sm=1 tr=0 ts=69788e0b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=uJf-LWHaVIhMWVALWaYA:9 a=CjuIK1q_8ugA:10

On Tue, Jan 27, 2026 at 08:18:12AM +0000, Lorenzo Stoakes wrote:
> On Tue, Jan 27, 2026 at 02:13:11PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed "ktools.vma.make.fail" on:
>
> Thanks to whoever set this up :) so far VMA userland tests have not been
> exercised very much and I've had to find issues manually :)
>
> >
> > commit: 28d7ff99300f3a897eb6419efafdbcf96978f637 ("tools/testing/vma: separate out vma_internal.h into logical headers")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> Hm this is strange, this works perfectly fine locally at this commit.
>
> But it does seem this is duplicated so will fix-patch at this point in the series.

Fixed at https://lore.kernel.org/linux-mm/1e032732-61c3-485c-9aa7-6a09016fefc1@lucifer.local/

>
> I notice the build is broken however at tip on next (will bisect), I guess the
> bot hasn't got there yet? Seems somebody added a compiler directive that is not
> stubbed out yet.
>
> I might simply fix by adding to this commit as a stub to avoid hassle with
> chasing down the offending patch...

OK so the other thing needs a fix in a tools header, so will report separately.

Cheers, Lorenzo

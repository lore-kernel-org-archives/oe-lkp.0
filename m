Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3A7485
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750380058; cv=fail; b=XjJxplEGGGb/SAj12B7tMNRRpRQIjA7Wcu46V43LIe5hbIzgi3HzfX/V7hGmzGz/4BpnCYpCZrtgOFsF0bFhMK9rJPk+SSj7z3bYnzSUQlapq5N2Htz8VSCBuIy0g/cH0slXCzWywvcc6Q8uVRk2oUryoNAhNw+qepUqT3ec67Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750380058; c=relaxed/simple;
	bh=8sMUmVyqM+M5gCFEkYbmd5whUdcUqRXu0QVWJECoRI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIRi2PTthpAGyN+9EwIwIHVWK5hccRhX9QXO8WxtF+ARLMtk/RCQK9EJM5vkSWJLY4LhCbaMIKIHfhu97vtNbh87J/eI3jb9VFUIS0pdEu1AAuuwZOi1a5wDkfrG9O568UkwnfGokjWOD/5GfrRoxocNYgbodu5eVXLQC+3PH3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g6ADCixc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lt0NQlKa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g6ADCixc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lt0NQlKa"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K0Xb3V022808;
	Fri, 20 Jun 2025 00:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jDlFk5mYxC2UilMT0VTiDndD6DUWBc0HeJzuPWjM59I=; b=
	g6ADCixcalTHZ9ch43+aBV27IgnBprDWyuB5cY/mEaOeroZDVzhbLwnT6BGmQ3XV
	WYVJ1xBmjogU4oVc5Cb55hVURDcgduClGz+SdS/EAiyhy/jaom1DcrDmSrA6BMnJ
	t07BZdmvtSGSAfdnkyU+56TJsjsbBAi4ASO700yQnCJnaaKv5DqAzVC+2h1wFnoU
	wcI75mwkkJoz4Gz3NW4yyH8lZR1JnjZV5OmdElOvpYWGdLlH44aAjFLJi8Mxvl1b
	Vh69OgSXNWTFZI8x6DQtuZmNKbrvdoU0uPAy83p758OOMSmmEWY/Hj5dEhBXDFgZ
	TbxMTn/Hpt67XyteySowcA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xx9av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 00:40:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JM1FOq018265;
	Fri, 20 Jun 2025 00:40:40 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhccbp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 00:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1loWG60nkIhooCDXbZRSOl/qE6GHVZesnvfPi8Y9ZQdulb8Dt1GHGHXDM6XDW8CmWJlyrhmR3le3U7Q51C6Sn1x2fSaF4Z99GAaLbomZDbNAzG5VBKIypSplFbC4P7BEZAOTp/iJmOcUmIlGMXl5rt57BZ9O7FWWjNi/nWvU++QmcJuwGISBMkLcNCwuoCbVzCP7osydfMlbgNe4bO6nmpfJqXu/uYCJuYAULEyfgF1AuVsNbmST/BQeFAe6TyZDOPo52ioUTITUvRpYqlOKqJYsQ2TuwfVvlXVl3IXQ8hKdiNY7/rhhn8BfF6nKOI354ACYKvmZ/JISAfHMQiPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDlFk5mYxC2UilMT0VTiDndD6DUWBc0HeJzuPWjM59I=;
 b=rKWePQKqhsk4Riz9RG9sVCq0oOrpCusfJPwSeq27yvV73xsu1apSjBDLC74zcbRsULy60oB4QwgnTCF4gUT7at/Hu7KXkGkSu6Xf2Tjo1+mcWTC2T0jnu+9pGVWF0hNXaFX+15OYT3gMDfYFGERBszc0t3akIU59y59K5jl7qMXFEPb+AtBJZb33n1zJOshOo9m2SzeviD0nET3Zk133pc642BHP09YlU+0dypZyyVpBM1vi/kF6adTVD7cZEsFhFV2gmsDl5PZi1YCRcIukIKj/rar3OM6q800MF5JimCtHRPlp+H5v9qEmVSOpLrOA824vStVW5BTAcy7JzdSd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDlFk5mYxC2UilMT0VTiDndD6DUWBc0HeJzuPWjM59I=;
 b=Lt0NQlKauqT61czt0ncJk1xp1MP3IjxEowgWzkHbR8T3xJNH9zoy7Kl/3fx3cGFtDb6uMcGJrYTLC8PXrjQsccdTiS1DZIM6RYTJXlPaRaYW16q6CI3zSRuC6YzXspKmqMQEsb4xdCldAR4IHcK+KPd1cCigxxITMaD341l9pMk=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH0PR10MB5180.namprd10.prod.outlook.com (2603:10b6:610:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Fri, 20 Jun
 2025 00:40:38 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 00:40:38 +0000
From: Harry Yoo <harry.yoo@oracle.com>
To: akpm@linux-foundation.org, surenb@google.com, kent.overstreet@linux.dev
Cc: oliver.sang@intel.com, 00107082@163.com, cachen@purestorage.com,
        linux-mm@kvack.org, oe-lkp@lists.linux.dev,
        Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH] lib/alloc_tag: do not acquire nonexistent lock when mem profiling is disabled
Date: Fri, 20 Jun 2025 09:40:32 +0900
Message-ID: <20250620004032.771289-1-harry.yoo@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202506181351.bba867dd-lkp@intel.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH0PR10MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f5d5cd-102b-441d-3233-08ddaf93136e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mZloCKkFLuoTt2PJFFk6qF2CCUiG+EPQTJfWbweW3vdFYhv2c35RhJaY9WpN?=
 =?us-ascii?Q?WVigtdEK5V5ImV80XpcP49HHDY/C/Ak25dGmeQGngQMiWkZm3h6EQlQUv0Z+?=
 =?us-ascii?Q?xPgzLcqxz2RUkGT3FG/VfiDZRUgPdd9cN89WC9sxjtD2Niq0DdFrOuMBQV+C?=
 =?us-ascii?Q?7MYpGrEceuJk4OwlhrrR/P7DVycmXCvKtGX2aDFo2vQb6iZxy+ivrynroeJI?=
 =?us-ascii?Q?w4ocENis5FZ+UrbyWW8nq7lg/sUB8eVMZt0/JKt4v6CERMDyYNN/6G7r+8NV?=
 =?us-ascii?Q?cFTCo4Yh0bCgGdweDlJ1R9NUb84lQDlUSSWfrFMCKfwn8liCdobg1kCWmS0K?=
 =?us-ascii?Q?xQXi3dns2KvvwMiaHPxU58WQyEeIx0PF0nWOh4OZZfwS+zDg3F9esmmp971L?=
 =?us-ascii?Q?GVocHvilNnkVpto45msWuQzQGsFThRwhdbyBnhEH1MpsHXzkg2Z+fswDjamd?=
 =?us-ascii?Q?EmqD/cAlm7Jdz3mHNFY2h9EWQ6FflGmdj2bo5HK/II6KRQiKX69+w4K0P6R5?=
 =?us-ascii?Q?s8T4OGzROtzH76gLwayAgekvnFb6b5d4ScbNppRGuxtaAI3C8h3w/juxjIRJ?=
 =?us-ascii?Q?LhJBfDs866sO4/twqciCogxaFKOYXIAZCoP04nQAUwDYGYZHZ4AYA0IVSNd8?=
 =?us-ascii?Q?DR779fGLPDK2byDyqrNEdvjYT5IWAzBj8dkzmU/69sIVmfWB80tKAkIaaQz7?=
 =?us-ascii?Q?VIvGbfVlsU0jQHYgFCt5Bfy3O3hFJZxG0hHLa2xshpcLv6sx3UdhY5+XCq8+?=
 =?us-ascii?Q?NrCmUUqf2wpsTPjxu5m/aJdjjotCOPnz8w3suqu/C8uYG5TtkVvCjFzSZWdB?=
 =?us-ascii?Q?U95DNUA0icVj2GEAB9fIet6y3/IQmyp3CU0YU44n50lPmDC18ZhykgPnsLTm?=
 =?us-ascii?Q?tnYLwD6s2iorfViyOS+BTZq4136KFeHfuux6C++TeGswTVvi/6G9IgV/3UKt?=
 =?us-ascii?Q?BoBf3u4FsUZyDitkv6H7DwSHoJSTYDtcaUbbPMCoWK65lKq8B6qOEVb0VTOg?=
 =?us-ascii?Q?BpMzpSfZ3rbwUS3TaZuJEDknSnaVzCbSqwX0LCgQzNkDPNi99F1sl9jIqb+H?=
 =?us-ascii?Q?sSE/2l4SWokH0lmuBBY34l9OH7GRESJ+Dy9gsuVjT55onfuM31ZUmF2H/MH+?=
 =?us-ascii?Q?necS1AGcEGu0fOY0vvG60qtEgE5xCL9Hw2biQquqmUu1sNbBoK8Z/gNXqBpp?=
 =?us-ascii?Q?omW/RQb9yBKD5TZwezNHziI0Pqa+ZzKkgK2VnA/uNDiPBS/GjiO9zNvq8bIi?=
 =?us-ascii?Q?rlr2AR+f1CXYpbb1fm31TEgqpUg5AV/AUsEQis9ehgT3GD7/OFFOmGxnXIMD?=
 =?us-ascii?Q?EuXWLxRXvPLj/octBqyjgU2lopxwMYkk5QtqDQGNTyd2RjuwLAj0umEP+J6R?=
 =?us-ascii?Q?87HeTzJKvPokU+aus4pfgxgioAHbs1BHZI4c9BoFME38B9koHN5tx4ulEr92?=
 =?us-ascii?Q?qZKKXfrCjObjmU32O9b/Ohyp4pmELaDV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H7SfZABJJU4lJX7OzCbo7kvWGE6wnSKl8vlBgC6rsUybgtsGOhbRHZeO7SRg?=
 =?us-ascii?Q?4WCZ7oDwT8s9M7NHNK6lkO14Yt3jb+9n/JXRDE3LAGpDFEFA2BEW6TkuwzA2?=
 =?us-ascii?Q?8yeq+FbY3hwvLHyzhK/ztnci+A2yD51k+k3sTEaM3G1btsgH4HqdyWutNnwx?=
 =?us-ascii?Q?C1YcGzpCpSfyHpQZgXwHuITet8EKAxNfL2tYPPoewe2+j4a5XjEoenpmrUHd?=
 =?us-ascii?Q?jH/uA54dEk84HKS2radI/0/DjEPGYCkW7GU7ryczqpkC5KF77st+ZJ82NL9s?=
 =?us-ascii?Q?8k2T0FJl4YVq+MdEbMlM6WmKUDzxU+D1uEBbIiXZkjL8X+kyrYtWFtArpi4N?=
 =?us-ascii?Q?rRMXEZVLu2aAyAdWuMkDYW6JnT9RQLDa+lP4d8xxvYKjGZRQrxFr30ds7gaj?=
 =?us-ascii?Q?FY4MsPCXmc4JZ2zqKsUmpecLzygEtoEul7AcvTdlL6qsxmsNH78M39aJDx/+?=
 =?us-ascii?Q?AUV7XPVRPwDzFnK9OhX4xyQ7G9CRygIDHWTeU/hCIIyrdxUUuKtHh2mns8+q?=
 =?us-ascii?Q?ILvxmxzU/9wW151O6aA+OUBMvGKVsXge6FS3XYWMkI64wiNModI6KpB9mLtc?=
 =?us-ascii?Q?Qy+dyrHCdc3GQFdpM0IUUu0Ql9u+k+253cgnlr0VyrG0ZCdfQAh6+7K0Z8BP?=
 =?us-ascii?Q?iWBSVci1HhqfRJIndBHXcTFeNf8l0qIoJZ5MGnpzc+x99xK4PrlRgp/xJuiq?=
 =?us-ascii?Q?IHDpvmAfMSgHvyTSuTScoPf2DddtUjB5iB52Ez+9nrhBBAb9FITIxA4BmtFK?=
 =?us-ascii?Q?9qCIAG3bVvopCPo+xkiNaFwTMUTPzkWIk0mwojhSxfD3SW8/FBs3TwZmIG5k?=
 =?us-ascii?Q?Jql/DfOefCQWbp7iSNTIYg2ooSMS8FbZWUEBqc1xWfU+eaSMpLEz66bOgwmy?=
 =?us-ascii?Q?CYPkLdS4WKeJrv/19LfnCeYFwikGYw2ChtUohg6tIH5v2VZQhz0TxoFb6s43?=
 =?us-ascii?Q?HbCBgECkkQELxYPg6ppWs/hY8EZLt5eiwt+KoOoG6LF5Z4ZHJEN/dvrBvN35?=
 =?us-ascii?Q?b4Qhe6MyLQB6S6+0+Kp110bA6nYqBwQqWbRd2uumHwxgdxEVlygpWPXbhRNY?=
 =?us-ascii?Q?4AL+0x4bB6aFFIzPUQFg5E9hA8JPTwPwQIWasqr526he07xhH8Jy9dzGoIxj?=
 =?us-ascii?Q?o5tWCnacTCFnUOD7zuqtQ48l9Zr0d8etIClBLx0rUAp0Yu1gMwj4GRp38pRS?=
 =?us-ascii?Q?59SCbG6qTdbcSLyKacSSMl4UPT7Bg8SVF6G+myVAnSiJuz5whocM2/AT4Vdt?=
 =?us-ascii?Q?9hjR/YRK2gxfFTfjzBCltn234kC2IrqPZNs1H7HJ3v/DhwzFECF2Y4BEslN/?=
 =?us-ascii?Q?qDFzFJPIRV8XFW0LVaCo88mnrCjcmZs9+V+SRbfQtr6qT8CTTe6kru2LTMiZ?=
 =?us-ascii?Q?sIzux16k57pUgaIMkOmq2+cFKSh7GLRboTX2Lz22J9ofIDqiZwHn76UnD1iY?=
 =?us-ascii?Q?5TTJRJ9TMcD0mY135EWTpvux//A+2JhSG5QfI6+aTWux9kDnhdBXXGMx6On1?=
 =?us-ascii?Q?DslXc9C5WjHE6uX2rBwcCxgERz3LmJIFTZXZivSO7KyUy124UitEtXa9F59x?=
 =?us-ascii?Q?61LZuW0jq7XrwGe4k6xiWKMmvyAy6ZXwPYK3CMeE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QhbKun7epeX98Ucr3MdT0oy8PrBiiQm8/ulGDh993vIkqsSbAvdz27cXj2ViG4DRqnS0831tmAfvnlTai6VgP6ZRlGOHqEjxkxZC8JXUr08dKkBe4FHLCvJSWZx/1Z26ZsaIR/aN7Ydmq36wpy9HsKuold0+Di7yV8edAxO9vCRlXWBP/tGEqCrnMZ4AsERob5ca1K1247tPMtPwPi3je6hVlTYcSAhXWpLn5grQ4sB3rKqQEeA948WsIjNUoGdRwn7XaQDcxwRabn8sAxm1zLRHvzfiu+LbrZKPv3ZKnT0T70ywHcidd1zI73hV+hd+Aucqb+sH9KeiwbvHZa+CpmX24MOu/7NgXOiB9/ueNp4+n4QV+tlH1qb8TNhyy8dF8LBVtG4WU75etVhpKkuR98bMyG4C/sdzsmkA3LfxWHg2rRkij/4BYEtNxZEUw0CHFGWJq/x8JJtccM1d13eHnu5gMTVIcINVd+saB6Pw+qGk8HjcHwIk718uPgDfECNS0G0r+X3hvmO2tkwjP/dkLPTZYL7CNtMSqOlzn6A1lUYzXgW6rM9XNwkj8HX1smIk0YltIhU97nLyxLrHbcRu6mSNIc4yAt8ZD010jUKbTSI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f5d5cd-102b-441d-3233-08ddaf93136e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 00:40:38.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jiDFEd2Ag4A6LgKr/eDcV9FY8P++nO8Z1c41pOhvjjMdl2Upt5KIEM381Pb1GuRlSZLrvWGj2a8BTX+rMUgrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200002
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMiBTYWx0ZWRfXxmlxXz38KREX nKNiQaovcEpJ1sxXzg6G28cG96Z+ABKls3Tm+x8onthWyGZULg2k36UxFGOXDn/6lzkCk/q9WLQ 2et0KpxrkSQ+H2lx4f8BEmUEPiYzWHwGd0Qq68HRyBYhP2VGVMD1LXCDcYYZAFeJ2Y/xHiYp7dU
 3y5PZw7+wJA4WVjQYPELgrPh1SZYf873IZqSJFQfzom5m3qc9dyQ9vE8aV1PIcKiDllliOHXk2I Wf8WEWfSI3nZSO8T+Kh8VWx6oDHKKrlQ5rRyuSTT5+RLLns6KL7paLZLe6lExd5MR7A1Cm1h0nt PYvWB27AM/DwHcLpkQ4h6zpFmrvcjpZXf9i6nT6TIg8XRDe6B9cEYTtNGcap7fz0PXGig+3qXVk
 GmkCiDF/nhBZ+pU+aakJiRq9tEz79nF2xvUvy56FAT7focUzFnHFdDenN8DYHcFbsigZLDfS
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6854ae09 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=P6uJFQHU2Egvhbbf7v0A:9
X-Proofpoint-GUID: X3JB83PHt88-lvF1lvYiig8gIjvl4IGV
X-Proofpoint-ORIG-GUID: X3JB83PHt88-lvF1lvYiig8gIjvl4IGV

alloc_tag_top_users() attempts to acquire alloc_tag_ctype->mod_lock
even when memory allocation profiling feature is disabled at runtime.
If the feature is compiled in but not enabled at boot, alloc_tag_init()
does not properly allocate and initialize the alloc_tag_cttype variable.

This leads to a crash on memory allocation failure by attempting to
acquire a semaphore that does not exist:

  Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#3] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
  CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G      D             6.16.0-rc2 #1 VOLUNTARY
  Tainted: [D]=DIE
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
  RIP: 0010:down_read_trylock+0xaa/0x3b0
  Code: d0 7c 08 84 d2 0f 85 a0 02 00 00 8b 0d df 31 dd 04 85 c9 75 29 48 b8 00 00 00 00 00 fc ff df 48 8d 6b 68 48 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 88 02 00 00 48 3b 5b 68 0f 85 53 01 00 00 65 ff
  RSP: 0000:ffff8881002ce9b8 EFLAGS: 00010016
  RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 0000000000000000
  RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
  RBP: 00000000000000d8 R08: 0000000000000001 R09: ffffed107dde49d1
  R10: ffff8883eef24e8b R11: ffff8881002cec20 R12: 1ffff11020059d37
  R13: 00000000003fff7b R14: ffff8881002cec20 R15: dffffc0000000000
  FS:  00007f963f21d940(0000) GS:ffff888458ca6000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f963f5edf71 CR3: 000000010672c000 CR4: 0000000000350ef0
  Call Trace:
   <TASK>
   codetag_trylock_module_list+0xd/0x20
   alloc_tag_top_users+0x369/0x4b0
   __show_mem+0x1cd/0x6e0
   warn_alloc+0x2b1/0x390
   __alloc_frozen_pages_noprof+0x12b9/0x21a0
   alloc_pages_mpol+0x135/0x3e0
   alloc_slab_page+0x82/0xe0
   new_slab+0x212/0x240
   ___slab_alloc+0x82a/0xe00
   </TASK>

As David Wang points out, this issue was introduced by commit
780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init").
Before the commit, alloc tagging subsystem unconditionally allocates
the semaphore.

After the commit, alloc_tag_top_users() must check whether it was
actually initialized. Fix it by adding the appropriate check in
alloc_tag_top_users().

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com
Fixes: 780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init")
Signed-off-by: Harry Yoo <harry.yoo@oracle.com>
---

I manually confirmed that the crash in the vmalloc test module no longer
occurs with this patch when the memory profiling feature is compiled
but not enabled at boot.

No Cc: stable because the offending commit was introduced in v6.16-rc1.

 lib/alloc_tag.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 66a4628185f7..20c627191d3e 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -124,7 +124,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
 	struct codetag_bytes n;
 	unsigned int i, nr = 0;
 
-	if (can_sleep)
+	if (!mem_profiling_support)
+		return 0;
+	else if (can_sleep)
 		codetag_lock_module_list(alloc_tag_cttype, true);
 	else if (!codetag_trylock_module_list(alloc_tag_cttype))
 		return 0;
-- 
2.43.0


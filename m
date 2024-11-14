Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE32210FB
	for <oe-lkp@lists.linux.dev>; Thu, 14 Nov 2024 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595069; cv=fail; b=Gd16jg8RTZP/tbj408z+JNGzwwN8cYhLFjAK6a6t5xhDzcvHh7PhqQmXzo+FbxAxJxSiBIZrRTNB5tCTPXotVWM3iyUaekRnrvLf1GFhY6bfQ6+RQmMHLpiH9c4kE0qXYu4PNJamu2njmygTNZL2R7I3Mf98eb7LB/RBZ+DQb6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595069; c=relaxed/simple;
	bh=3mgmXVjvR0rHIU7p6xF3YIOx/xPuSIRqbBlmtMZwtfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r356iYx33Dg3zRIriOTPp3DAIceAMR8EjHW38mNVEuIuxPo0w+A8IGBg1WcLkpEMIzOca/3YRTA/pvP203DOWSrZJpVqfD+uckBpr6j4TYcp3Brk7o/P4/WEECVXuVx4GnX7w501t/JGBd1kOVM/LVSQgTm35nTu/YZmArqY4og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KcFvFMVG; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m7266NsI reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KcFvFMVG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m7266NsI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AECogEB015866;
	Thu, 14 Nov 2024 14:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=PIUawVLlfTPz+/ewVzSZ0HyYK6aSoM9k9WOtlT5eoGI=; b=
	KcFvFMVGuBeJzCeW/Cn54xD0/Btah9AdTEq5wc9Ux3njPFVlg6xFDLVtmPuSxI9H
	rXpDj65BQboiSXwla0UpcNLC99rL9XK+HoEHUqO4xvTDidCfJKFYJ6JC16mLbU5Z
	9waL09S08uFAk2Po/PyRFPLhktIWYZbhn4K7HuULFqf+ID1HyD5EPcsWRk8tYBQD
	WguByNShO9yQ1ERv2y3pEWnZsrz5ngabGCPHlIUvwFsIpErLW2ndcUpZ/xUEzrwr
	Suvq01Q+YpaEZ0k7OmbWZPfyBciRC43yYy24BQq/8MLkIW5lidMPQDmjFDz/T579
	JvRGJMlqa+WtgAt7gnXVMw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k29bap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 14:37:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEEFD3K036036;
	Thu, 14 Nov 2024 14:37:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6awdqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 14:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1dfdifTXXnvskjonfCbQyZ6DUVNh9xibmTNwRvibYS70EO/fUWiUkHbJysjQwJObTl6u51tBfMIrVGxTkv57fxkcQFONS57vChOzVVpIzdU8hYNM645KfBJmCT/Nan8gRECfr6Fa09AbFTslQYGU+x1925bzPC47bwCZvK8dh69kYkUPAdVNon9uKpS2ys1C7mdCei1SwYpYCchTzMlKBcKDNfrQLUvvnrZmAbbtjH3pkF648kvASPq0eW5s+VMCysN+GgTbotqvqK1f+J8M0aJjaWdt08Y0QYA+uyErlqiqj637hGew7Um4TqHG0LG62pkxhdEQ0LwwhQ241trCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWtaxLdB6trjk8z4DLoBY7bN6t5umS5s3ImvP59SXD4=;
 b=EvwT7yc5fCA08q33Br/jG6ZJhJ/wjjOboCAP5V0o9scAE+vUambJiw45ZSj6W5gc12B3EV0fw5jVNOGggYSgma2ALIecGeJz1gNdAuGyWZEczXHOUve4/W+TNsr4RjIxvUOJBgiv7mzP+oaDHbD6rX0gO9Unki5cz/F1/SB7lMhio/qFfVMLVSPEHaUxw7ZVNraN4k79vAt6hFp6dwsE1pql8jn2anQRlmshlK8r2NbjdMAt94W5+ouJJtNUea4ZjDyLzyCQtGC+7zcgNkeCAvYZmriSUyByBv8ZQ+cvUJ/BDbsuGcQhI4Zf7iVAe0EZdzwiBlZcUANF12C0ZfDbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWtaxLdB6trjk8z4DLoBY7bN6t5umS5s3ImvP59SXD4=;
 b=m7266NsIhGQyWt9hR8U9b+ItJOHDEhbg7QLQySHvEsAUYS1a7R4ZcuIE2Gsfv/WNPWv+SUcEGb7kRP+/lFK0myo5uV07e4w52NGhdCs51H4+pK9FLDUV9scWPbN0mndK54oHg8HWchaY8rrwdPRXsuNInm+cEd+Ow286NJpEcs8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB5183.namprd10.prod.outlook.com (2603:10b6:5:3a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Thu, 14 Nov
 2024 14:37:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 14:37:33 +0000
Date: Thu, 14 Nov 2024 09:37:30 -0500
From: Chuck Lever <chuck.lever@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
        oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411071017.ddd9e9e2-oliver.sang@intel.com>
X-ClientProxiedBy: CH2PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:610:53::25) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS7PR10MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 1badf950-126d-4848-fa2a-08dd04b9e040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ZlQqWdRWpmPJuE8IS4sez7bQYdH//QhaudPdslx1jX3vuNvDHSUKqwrTUH?=
 =?iso-8859-1?Q?7tidYhGQBImU8BaPcRtPzStrr4zZe6ZG8kyLGmAZEqE9NmOLFcyx8b0hbM?=
 =?iso-8859-1?Q?7hqD9sBP8TWrfcvm/8yi1YNAimdjxlCX+FUgDAsR8EIjAeLpfwcW51m6yA?=
 =?iso-8859-1?Q?ZuFXYpzTx9aDdYPuayqFLNdLf1W8a1Oz/BCOvUcfk6x3GGcpz0u71WQ13J?=
 =?iso-8859-1?Q?dxS4On2s6M1h5NMPjA/YECZ8AuBawf6iWDXrO+C7VdmrC8UPa99OFVYTS9?=
 =?iso-8859-1?Q?ybeLk2nnNRvGTwSsZBaC0cquqONqNV9PsiSSD4Unq5oStTkAQCD5FIQylv?=
 =?iso-8859-1?Q?/0Mw6NcbC4kDK9+ZfszlxCXLpBDVUhz1y00SDx2cDMq0zE2cMK2UAxiCvy?=
 =?iso-8859-1?Q?bxa7ZjjcMTgYxqBR3PbSKK0EZhDGE84gVL36TS1QB3WoAYDeODqt2Pk6gL?=
 =?iso-8859-1?Q?M+RPxSSfRlgOeWKexMD58q4w/uOFdLSmL6z94hqj8ab6BOCwiBXreSgRiv?=
 =?iso-8859-1?Q?l1rdsg0LGJiKaiA3H7hnessGCxf/RoMKKmTp2Zw+FsEiGKKV/s+qxAcxVu?=
 =?iso-8859-1?Q?6Jqjjy6b7U6WUt/2mIAMMahO2me29scC9pPu/f4ZlLrlRxdRgyxUqCCaWF?=
 =?iso-8859-1?Q?c3rnIP9SlRv9mXHQbyr4IFaX5cfDGYLoxt9AxVO2akaC0sGLFprMSwpUD2?=
 =?iso-8859-1?Q?c5+FM99XYuQK4ijhmIaYsfGnhHsXBsMs/pgIfHOyuFLpZNVGC0CFNloSDw?=
 =?iso-8859-1?Q?+QjvWfHVF86PsO+0PeHnHVbKvQTdFQuF1j65MheqWeWRYoP0vb9M3Z+rqY?=
 =?iso-8859-1?Q?SRbVtYjnf5yS8FgFBwb+I2RoyoB+6J9TKVzKjBzXGsrzf0T/Omh6f9ZrU8?=
 =?iso-8859-1?Q?ZMUPvSUBGAz9JL06xrnK1Xn9TDWvTcMFRRBjw+3Zq44zKvyt30kYx8MZBF?=
 =?iso-8859-1?Q?hVoQP7aMkGHBTi4b3ZypVqzrMNq2bVfQYmgIvxD0I+WFmH182rCDrNieSf?=
 =?iso-8859-1?Q?w26JBjBpUApQCK5q9+tXFuzUdsI3PfyPzvXIc0ev23F7/Ue339aPTKmkgb?=
 =?iso-8859-1?Q?WplLwyNP/5RWVtRzUX1pk4UO8nvNYsirOSMLIVUtE096VUEwaxu/nT1F12?=
 =?iso-8859-1?Q?w4N866AbMXos7Ku2AXQ+6rdyz+ExV00jSQQnbPbHC2besOJ3B1oFYv6nTW?=
 =?iso-8859-1?Q?80eneKkVkWeqf+405siwPsHIV1yA94f5gHEm/CMvC/09l34/KrZ169oikf?=
 =?iso-8859-1?Q?TLfJ5nXt7GsPbh9mdyaRheiDaXA9eTrMdx/wOiQqWGYhAovBa+VNLiZHzz?=
 =?iso-8859-1?Q?TmM+zGoCl2lWoEGXCHXmIwEW6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ygyk6ONM12r/CfFk3hlFDFNzNRELWFm5AZ2cZXOAuxFtkRBnG1Zfkh9vZa?=
 =?iso-8859-1?Q?0/iLqLS4ioFmRMgXf4cEBW5/MMbsrXbZgHz3oBdhWiAtF1z72sGxnuClCe?=
 =?iso-8859-1?Q?MDZVLjpNgJvydB4x1C+6FSWmJ0JcDCMwU560cgEi68QC2Z1RYhzJp3okgj?=
 =?iso-8859-1?Q?RODafy/fy+Ed8toxue7RvhVaR0BjpfY5kwqRgH4Mt+Iuvekc/y38zGAu8K?=
 =?iso-8859-1?Q?dQXGKGwzmgm98UjVYi3H1YRkBrWk5hyC9Ph8B72oPq6UYH/p4mr6baw7lD?=
 =?iso-8859-1?Q?GhIpbm5DxwXGF+RgDG31eiZh0hpGh0xMr3oSzWLfiPd+I8o3wRjV+INHoK?=
 =?iso-8859-1?Q?rYCMxkVk2IvssNcg32jSGBWSejRghIoTWfjPoK8BQXAh3fb+Ufl6P8YQXb?=
 =?iso-8859-1?Q?bkFEMZcOjUnjhLry4sPmwbWASieqmXuVBKx/V4sT5j0JNZaZl9AVBuQJpM?=
 =?iso-8859-1?Q?/gA4IEPqJLYXaNkt6RJbLFJBUAJN7kyQLv+yKZG41Dvy2WzQMQ/KUzx1Vi?=
 =?iso-8859-1?Q?buyBetvz6EIQOZGe5cqslc4kWuBuwDhPvj9C6JdkOd+uDYtwLtr+r5R9cy?=
 =?iso-8859-1?Q?4YQpqCzwHzzft2wn4vdSnmfKCEIbq4f07sNfQLNSBA7uS5gLIqQb3dtJqj?=
 =?iso-8859-1?Q?HwSI8SFyYwcJNQ4TLHlmEiNkyXVL06ESqar9GbYJ39/lDj0UjKJlRuZWaj?=
 =?iso-8859-1?Q?vtVZy9ypa6bJ16EP1/MYScmbDpFfOauajbEnK3Cvf8G4Cl4jjDYiTxlfD8?=
 =?iso-8859-1?Q?JQ0bx3YY21rJz+UhfQHEaTDiQRbHT8KnZlXLAF8wbCzyispkrUUuM7S9XB?=
 =?iso-8859-1?Q?dd9/Mn2yMlJ8y5eMpC/LiiDZzJs8QV0babxBg6S2cUQ9ai5VFJEJraXDsz?=
 =?iso-8859-1?Q?QlKcbsb9bGx3/2FopY5IbDq04MzzVnOtTVRp56CET3QMToI2HyxRVlYB2V?=
 =?iso-8859-1?Q?ZdfoRzFq57eC7ru8oECCe2noRudxi/D34xwXJIhW1BM+/55HhHd38SHkHT?=
 =?iso-8859-1?Q?BHzOLeGbsjxZvOe5I6LRhFnHsdf9Cq4p0h6a2tW4AbdfVSX6lGoWwikKBC?=
 =?iso-8859-1?Q?PqQ1O3LBwtYIfwIPZ25TywLEsMMLHVzx6TlktesvkAVFefkjxLFo5FvxEr?=
 =?iso-8859-1?Q?uWgwBU5YgGT6QKQudPlpS7rYwTU9tmmcG34aZjqBqIiPMN/Tbd5YF42OLq?=
 =?iso-8859-1?Q?m2xtQ7UpWvQVMguLfed/O5b+rrz7yGZ2GJ52vK8gCzqDdBNu85icfhweiG?=
 =?iso-8859-1?Q?R1QJPxDxLsIv+IlKbmsDbm+VfO0KIG2An9gO9K+s8zZaQlqf/vExMOwSSL?=
 =?iso-8859-1?Q?4qVXgqEcyYK+b4bHjBwCXVCMpgJWHvaa/rb0b3HwEcW+8OEXYnFJ3ZFjUx?=
 =?iso-8859-1?Q?wsTkZxoeK5NJrlqWQr43w+03ZcpICHOAx1HZ1tERoaYoKsEZDHwCjgnltm?=
 =?iso-8859-1?Q?RDcDha21XuwhySSbFchCFuuTYdP1IeK6uGDzo1fAi3y7Q03ZBuH4imeS9l?=
 =?iso-8859-1?Q?cgwYK7xqv9cQ8CqkrdFI+a0yq9Y8YME6o1akL2qctUwKcu4hMUGtT9REuO?=
 =?iso-8859-1?Q?iWlL5GW11XNqu2SUYRWWogAbGZgFNrAXt2DXADv9UvnRxwebuSOcE00TEr?=
 =?iso-8859-1?Q?xx6hdi1JSHrsRJ1GlnCnoo6VOtsoXYAO1EpgSKIrbVN8VHa+wvaB+ASw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	24lr+8Nv4wVEWZ0bmJeXbIhzCh431WLvxVVRqfctMTlnmaYGYkGC7PmqIsFmzvVtixrTcttxNl4HCc/Woc3GpeD+kXPCfHNY0cIW5sCyK00h49C30odjkJmumzM2dHoGllPY5T2rdnHmuRFfkHc2l8uJv1l8o1gg3WYA8AkniRkz+O5Nl2szuHi/mTOFPDLqzwfQvdOu9//KYO3XPCDy4kP056KuNBkxVJIwkiDvMP6VOsD0BlQlX//1cVMdu4dDDM8LeRvqkxyXem8TBB7sBuvr2ZEeI5z52dSM3RlAbz78o/Ti3JsKchlsGlh9FwcpLlF9Oe3m6dIOBlAy/umwsr2dXoYwifrpJQy5s6GCwCxSM3YKp4v+cTarGsP2YuLJU25SumkUlkTHNracTmhbLuQJ7WfTSrNwhXW0tSsZoJ/VrHzpK4Kd8bL/EsCzWAKU3KkLHIyhoA9rGDlQ3mVOQktmMn1XwCOuXpjoDJyTgIJn/gRbCq3lmuvG7dd1u6UXnMhHN2jQs8Uqr1pafzgxXnpQhXVLiMUUvUfEG7OKhqIaIlp6Jduz+ec9uywvgLxcQ8jJnaFBgOOrxw8tk+wTpT5I0jds5Hx7UjUodUPRjZM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1badf950-126d-4848-fa2a-08dd04b9e040
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:37:33.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM6WOxQ8Mkhn8I1DDV2uuD1dr+sdbIreNsuB84Tf3P65nPUyk2V6fKI2Bu//4V0OzpzBNXSAA0rIAd7N2pyRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5183
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140114
X-Proofpoint-ORIG-GUID: -Peb0ukaIfcqJ7O2WDgzcprldcaznO-y
X-Proofpoint-GUID: -Peb0ukaIfcqJ7O2WDgzcprldcaznO-y

On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wrote:
> 
> hi, Jeff Layton,
> 
> in commit message, it is mentioned the change is expected to solve the
> "App Overhead" on the fs_mark test we reported in
> https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
> 
> however, in our tests, there is sill similar regression. at the same
> time, there is still no performance difference for fsmark.files_per_sec
> 
>    2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
>      18.57            +0.0%      18.57        fsmark.files_per_sec

Because the most recent version of this commit does not appear to
address the reported regression, Jeff suggested dropping it. I've
done that in the branch below, which is being prepared for v6.13.


> another thing is our bot bisect to this commit in repo/branch as below detail
> information. if there is a more porper repo/branch to test the patch, could
> you let us know? thanks a lot!

The proper branch to test is:

https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-next


> Hello,
> 
> kernel test robot noticed a 92.0% regression of fsmark.app_overhead on:
> 
> 
> commit: b4be3ccf1c251cbd3a3cf5391a80fe3a5f6f075e ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")
> https://git.kernel.org/cgit/linux/kernel/git/snitzer/linux.git cel-nfsd-next-6.12-rc5
> 
> 
> testcase: fsmark
> config: x86_64-rhel-8.3
> compiler: gcc-12
> test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
> parameters:
> 
> 	iterations: 1x
> 	nr_threads: 1t
> 	disk: 1HDD
> 	fs: btrfs
> 	fs2: nfsv4
> 	filesize: 4K
> 	test_size: 40M
> 	sync_method: fsyncBeforeClose
> 	nr_files_per_directory: 1fpd
> 	cpufreq_governor: performance
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202411071017.ddd9e9e2-oliver.sang@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241107/202411071017.ddd9e9e2-oliver.sang@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>   gcc-12/performance/1HDD/4K/nfsv4/btrfs/1x/x86_64-rhel-8.3/1fpd/1t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-icl-2sp6/40M/fsmark
> 
> commit: 
>   37f27b20cd ("nfsd: add support for FATTR4_OPEN_ARGUMENTS")
>   b4be3ccf1c ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")
> 
> 37f27b20cd64e2e0 b4be3ccf1c251cbd3a3cf5391a8 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>      97.33 ±  9%     -16.3%      81.50 ±  9%  perf-c2c.HITM.local
>       3788 ±101%    +147.5%       9377 ±  6%  sched_debug.cfs_rq:/.load_avg.max
>       2936            -6.2%       2755        vmstat.system.cs
>    2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
>      18.57            +0.0%      18.57        fsmark.files_per_sec
>      53420           -17.3%      44185        fsmark.time.voluntary_context_switches
>       1.50 ±  7%     +13.4%       1.70 ±  3%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       3.00 ±  7%     +13.4%       3.40 ±  3%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>    1756957            -2.1%    1720536        proc-vmstat.numa_hit
>    1624496            -2.2%    1588039        proc-vmstat.numa_local
>       1.28 ±  4%      -8.2%       1.17 ±  3%  perf-stat.i.MPKI
>       2916            -6.2%       2735        perf-stat.i.context-switches
>       1529 ±  4%      +8.2%       1655 ±  3%  perf-stat.i.cycles-between-cache-misses
>       2910            -6.2%       2729        perf-stat.ps.context-switches
>       0.67 ± 15%      -0.4        0.27 ±100%  perf-profile.calltrace.cycles-pp._Fork
>       0.95 ± 15%      +0.3        1.26 ± 11%  perf-profile.calltrace.cycles-pp.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.70 ± 47%      +0.3        1.04 ±  9%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       0.52 ± 45%      +0.3        0.86 ± 15%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.72 ± 50%      +0.4        1.12 ± 18%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
>       1.22 ± 26%      +0.4        1.67 ± 12%  perf-profile.calltrace.cycles-pp.sched_setaffinity.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events
>       2.20 ± 11%      +0.6        2.78 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       2.20 ± 11%      +0.6        2.82 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       2.03 ± 13%      +0.6        2.67 ± 13%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       0.68 ± 15%      -0.2        0.47 ± 19%  perf-profile.children.cycles-pp._Fork
>       0.56 ± 15%      -0.1        0.42 ± 16%  perf-profile.children.cycles-pp.tcp_v6_do_rcv
>       0.46 ± 13%      -0.1        0.35 ± 16%  perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
>       0.10 ± 75%      +0.2        0.29 ± 19%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
>       0.28 ± 33%      +0.2        0.47 ± 16%  perf-profile.children.cycles-pp.show_stat
>       0.34 ± 32%      +0.2        0.54 ± 16%  perf-profile.children.cycles-pp.fold_vm_numa_events
>       0.37 ± 11%      +0.3        0.63 ± 23%  perf-profile.children.cycles-pp.setup_items_for_insert
>       0.88 ± 15%      +0.3        1.16 ± 12%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
>       0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.btrfs_writepages
>       0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.extent_write_cache_pages
>       0.64 ± 19%      +0.3        0.94 ± 15%  perf-profile.children.cycles-pp.btrfs_insert_empty_items
>       0.38 ± 12%      +0.3        0.68 ± 58%  perf-profile.children.cycles-pp.btrfs_fdatawrite_range
>       0.32 ± 23%      +0.3        0.63 ± 64%  perf-profile.children.cycles-pp.extent_writepage
>       0.97 ± 14%      +0.3        1.31 ± 10%  perf-profile.children.cycles-pp.__sched_setaffinity
>       1.07 ± 16%      +0.4        1.44 ± 10%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
>       1.39 ± 18%      +0.5        1.90 ± 12%  perf-profile.children.cycles-pp.seq_read_iter
>       0.34 ± 30%      +0.2        0.52 ± 16%  perf-profile.self.cycles-pp.fold_vm_numa_events
> 
> 
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Chuck Lever

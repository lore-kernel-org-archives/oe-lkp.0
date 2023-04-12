Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC0A92E
	for <oe-lkp@lists.linux.dev>; Wed, 12 Apr 2023 21:00:18 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CJT47W017333;
	Wed, 12 Apr 2023 21:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=sonhaThG94hewKZpcg3PJX6twBUf4ta2SlV+uidWvoo=;
 b=hAJ5Qu4nuVBXzlIBqZ9xVERZJ8M8bjWsdjR1yIU1AKkmanbtRFzZmUnfDJWvL/n+iyP1
 FY7dUhDvtAYFONqYUqoDAG/ZpyT7Ob2dPc9c6fAnOzX97bxgKx4V8jPt/LBma+2cpCnW
 6Bj5D7u/k2bpV/OazM19gOTRXtic4jPEh5ZkHu8py8yjEpPi/iXqj0SfXGovyhDU0mCl
 D0+tcZmOC58Qkk/NUK8q5L1nopC4QcBj2HkUf5VwQAaDUbOn25CabNJO0ypCRQMJUz5S
 XgyffZJnErKdmUcgT3Lxt9lGc/ivinU4fCtAejKU46xyGONNFieXf/02yyE3oKyiqUEF hw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bwhgy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 21:00:06 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33CKmLRZ013196;
	Wed, 12 Apr 2023 21:00:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3puw93nrjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 21:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N69IL8tubYb5BO2n1NVtljhUs5YSc2eULgrk7Bih62/6QCOKMnxwzecSAjAmJ4cuEZNjawjZXXqONsz4PKWGRM9W3A/T1+ZElfinoXlKeMvglCwju5V1fOFEYD7Ey4IIN5bTOyK0Dzcxpf9mowaRAkQQoVLB7H94C15ngKxGIxiyeDBhmUqfWcB+VI8FovrJlvE9e112CF+6Mahm/HszIUzAo79bJRuTflTlfqKq5hOg8SxLeRHTf3CGpB1tH5DgYxyCppKRzuXiBUQY/zUbYBoEHDW1LHKOMLyd/gUDn0MN5B6npGnOlQy19R/Bm8uBFqqLA4KaXeugoW3jTp9uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sonhaThG94hewKZpcg3PJX6twBUf4ta2SlV+uidWvoo=;
 b=BQnG4lWfItSvyK4mnWemLjgbXAIkpcSsX4MN0fs8ODOkFbKo/IN1HOx4VJ9NUjm8Do1CMNKC3LfEDizy3NcvKHKOoztZkROrnSaHoTK7nALDyA3fru+12Hxo0LCS0MvMYTeN+bLnR5gPWc4U3wsLNIZioW46bmRPdYTD/fXXB1ZZ4sopRqAaBnuqGvjXXctBGrcpIH1E7XcUkrNGNe9BHWCQ2r6ixTCy3coEluaEHTPvVI/nVAu/pCOJH5wJVFcn+UkvM12861hG40bgtfdjlgLTWppIaOtnF12dPKWcF6qFveMELdxIJ4O1aJLoubVrCPOClRCMSrkKkkM/JxpBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sonhaThG94hewKZpcg3PJX6twBUf4ta2SlV+uidWvoo=;
 b=nS+aYqgXaLFWQK0C+mwLb/fntKmF3iyuz9ih37KV0nhMgX9buBe/k6ruBlkAgiPBd0XdVkekQ1e4mB9c4SU/WR3b2dSFb6f89eh5PinXP2Z2LOzome9LrLSiFOCmfmcW0Iu87wo3FJpfTwmcLbl2/W2/hVWWoCE2rC2uef7j66M=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB5148.namprd10.prod.outlook.com (2603:10b6:610:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 21:00:02 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 21:00:02 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: kernel test robot <yujie.liu@intel.com>,
        "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>,
        kernel test robot <lkp@intel.com>,
        Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: [cel:topic-shmem-stable-dir-cookies] [shmem] 5fd403eb6c:
 WARNING:inconsistent_lock_state
Thread-Topic: [cel:topic-shmem-stable-dir-cookies] [shmem] 5fd403eb6c:
 WARNING:inconsistent_lock_state
Thread-Index: AQHZbA4fvdckUm+IP0Kziy9xKgnubK8n+egAgAARioCAAAEEgIAABwuAgAAX1YA=
Date: Wed, 12 Apr 2023 21:00:02 +0000
Message-ID: <6B05671F-7E27-4820-A59C-02DC9EFD8A80@oracle.com>
References: <202304101606.79aea62f-yujie.liu@intel.com>
 <4F25D1D2-7D19-49AF-80AD-F0A87BB99681@oracle.com>
 <033d313acfaef939fbfca9349768df34dec40d2b.camel@kernel.org>
 <03D6377B-0EF1-4400-84DA-336EC7CF3BE3@oracle.com>
 <bcd5eb8bd0ae863025ced85f9d0a76eb40fa64e7.camel@kernel.org>
In-Reply-To: <bcd5eb8bd0ae863025ced85f9d0a76eb40fa64e7.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH0PR10MB5148:EE_
x-ms-office365-filtering-correlation-id: be1c6e36-321e-4bd7-b9c6-08db3b98e299
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pFvYu4LX/C9adCzZC1bz668dGzOmlbH+a2aolQKd15i6H6u12C9iaZUlJToaGqWVpt1j4f08W7WT40ukY54n7VS5waQew7SxTepYtQW6I4OncoH/XUbe5M36d1dt6Lv1MPxkW7vADBKc1NzQFQ+CDr/zWDJzytCKn2Awbvsevhxx2p3B1KbUGVGGYhCbbYXvfXNN4CbSfyJHzmlcUN/qpalGMQ6Idwe/TUw//eiR1g1D4c4q5ir9sxsQFD0TL2qebZr2+Oavh+jrRa83LIjCh0EyRu0mbVYHZxT0AJmnssQf39Ft+aL/PNWMV7mdc5Wt7FCHMjV4zEjDPOckPet+/udqo+vExWNVtfjRpYHKFGQT3TwF2KTt03aLiRQ75flNa4wlhfonkCs12ETIm6yACHA9cUTg2rh1yA0J/M+JUc2Ax56ikeX9igF/grgxa6fHVvmHY24WLcfiNTlE5FLRn87i8/QIfo0skcXHNIQM+Y1ylYnGVQGMfx8xv+zIaqj7lxijXKTxJixOqH4tj+0F67HwIlWB9C4A5avOjXTASjGiXFHhNUycnLT0/av9gOVJtMM3M0znZW/9kg/50U4IHLBNWuFZLmV+Q64Av95IjPFvMjixIN4eyHQsa4yK+00wsl4PX4Nu3Hn4cy4UmFosGg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(36756003)(2906002)(38070700005)(33656002)(86362001)(71200400001)(2616005)(83380400001)(186003)(53546011)(6506007)(26005)(966005)(6512007)(122000001)(66476007)(6916009)(4326008)(64756008)(91956017)(66446008)(6486002)(316002)(76116006)(478600001)(66556008)(66946007)(8676002)(54906003)(38100700002)(8936002)(41300700001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vEqhmx/sFCluzlJvSLjhiYb4UVZJQZNhCMQvZMqLqSjcPPsqN4i/OAiyEWaE?=
 =?us-ascii?Q?jrfoao8mhnOwnaKCJEEo+8EyWApEE/Y66awsmiPxlIKf6B5SU1KfnyjDldut?=
 =?us-ascii?Q?qnZ/GHYo4/rCLagQ71bQpunnYQEf/S+dPJpq3leikAVQBXBeo7qugTB4UBXH?=
 =?us-ascii?Q?4y9dDPcxJnVpMeCQEyXpm72tmJso1ih8MqVXvLE9ZyiMTy0LNdBRsp2UFs3W?=
 =?us-ascii?Q?aITZ07FtV1nZjciieWvFbNf0bAbXQHSDK3Hcn578TDvUX+obN9S6DyZVu+9G?=
 =?us-ascii?Q?v+V4E6B4ZPNZeFlo3EijgqzTFhYU87uOuV/n4rqu5MXIH0+8meg7Pih+p4+c?=
 =?us-ascii?Q?uYIpmW6ZI8lMFdfhXDt9igjDLMnpx1/KZhRlfi2J6t2K6/P1wTi6qcE/VIgP?=
 =?us-ascii?Q?82c/CtdHIwrlkavKRqvI3/gpoYlj8KN0NIjXckUsVi7MRKtMQ8W8GCK0G1oI?=
 =?us-ascii?Q?jFg8qhazJtYrwkQnZ+kzLkuPiOkinUvYQ63kFWnIxN1bPH7DFFiQsIcht85m?=
 =?us-ascii?Q?6GF1h69aMlYY5HZ2L8cnyg8I8DLfjBklduk2m3Q4ib205nVxrk6YGtoV6kJq?=
 =?us-ascii?Q?SsZ1hEJkGUD6yjG7CUgYUgiPkKLtvmkDSNdOl/xhZ3K0dUMXy/LoXVeniNc9?=
 =?us-ascii?Q?ILkqbPSk1swSA9iceBkYnuCqI01isS/QQqHJVpbvxCFtpqyN+8n8PgvXk2zw?=
 =?us-ascii?Q?XDYeDtxWr0ALuKo/aOFJc6o1DEFFMU7ENeoJu2EDv7oh3M/5H9GxYLp9cbGc?=
 =?us-ascii?Q?K2QdBlsxK6KoPPsN0w/Noxjb24QC0Oc0PyaDF5lUr54BSfyIq3dgXPPpLc97?=
 =?us-ascii?Q?C2gjl0cIJvlIMqLNNJwBLidmbTHkbO4mbV3SUsmUoBDOAtus7FOS57FunxOO?=
 =?us-ascii?Q?aS9R+FvXw4KxWtDIhPSVKlnQAjCp/hvcaDJbz0RLZIOYFlP7pkOnN4NfwbLc?=
 =?us-ascii?Q?XoE4Byv9Y8XTmxJWN9hPpGJTXuuuUPI9SOKLYO5s8Wyk2xShIXH3gtow3WOp?=
 =?us-ascii?Q?LQE0vhd2LUzCkSoRbnYI+Cu6g3zwB0I1xgoGCfgXedWAGV+W5MfVv7IBnXXD?=
 =?us-ascii?Q?/oT2W06wECl6vD48a7g//QchTNF4ofgiRZKry92qe0nMeeadADplF/e9fP3v?=
 =?us-ascii?Q?wiK1s8ja4a/pnd3VoobGsptSL3wx+5yyjq4fYB2iadSEtAkOVi5oe2VkjZz3?=
 =?us-ascii?Q?y/KD+TJiCsRmwZeEBpTTDC8YrT7iivBPUXxttMXhunlpYGsk2Q0xt36mfHOY?=
 =?us-ascii?Q?AXPJM5+BhJ5M7Z30eKyGBiZjBCP3ULwI8poTCHl+vcUss/wpXu61Hu7ei8xs?=
 =?us-ascii?Q?Vjp2Hr+L+lf98WuOOPhcLy4ncE8V7vb1l7JqJTFQl1PquUDy5f9uWiW0jCe0?=
 =?us-ascii?Q?7I7i0SXUzPAlsRWLw5dabW3R5pQBhF0bhQEeV7LMiA8lpg7v6mmU5xWZ3sPe?=
 =?us-ascii?Q?gXIZq2A1UGekSY/rnvkuzpTKqKyIPHA9qu0muS/a2TRaOCZFourCruQkZ74a?=
 =?us-ascii?Q?80ED14tqGeFoa4YZatTFV7zE/AYOvCEUBpsfm8V6FQuUoSzAxcwsSRrs94Pu?=
 =?us-ascii?Q?iGbnGLCC2J6H1ghnxVsKgdicRA0Cznvv+WW3npaVwdM/m7s8QXnj049zdb53?=
 =?us-ascii?Q?4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01C5AF8F174A4E4584DE18CCA181C744@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rZHUEO8dYfKO7m3M6vMZFfMjUTWjw2b6rA2dqwoqQONhS3zxRZYJoule85EJYxMCmVSmEJNq48I7hfu/9U9aDbNwys5nYowdnGqK/eaKwO7k4lvEDZa6Z0d+dCEnE3wHlU4ke7ec87HhYSNiOTeOmN5yfSE66MYdQkznysrD2pR0o/JGOGnb/aw1RQ+YxhzSP4985d0IkgBjGIFFaEqbDsc7auRO+bPtlaXdiSZPH1O/VoHGcxWEBGvlUa9Lg+5kpGq3CSjAlAbWmOAqPw0ckzZdRrGP4nspuZQ9tR5ejoUpBdriehSJyEXiKQis0pcRl+sPnsi54jd4wQeS+EXQK03ACPeTBHX6U+Ls892BJK0Er2QE3myEQSb+Lziw6ORTKZfvcGsrAsJz47hHVI0fSU93ZcA02sa0yurEGXTXcIfBr2okfipXspQvZLOgRwqTfOgaJjkmS1QjezbBNfE+cvOsSKXnHOI9j7YvyGeVQ1tk9YJSJxiOWiPy1ANPhGoCTC8bhVzLLcdknknDTaRJHRzW4OxYOOFeIGCEWajnOzmXTcqvCw3q9BOOf4Mq69nuxELzces2JTACLnruGc2MG3/Em0B44grizCbxrVA9xGuFhU6TFSoe9OdU//GdUrxcz3NkWcBvuHY4JZ0fdYR3fAgaNsHaOh9p6t/TTcHu7vhiets/1yhqgVkBVJ7EZG2I8itKs1zlWJO07Qbh+B5kwFkM80ZEgKb6a2ohd69VnUt6WIw1naeaA3+JrC42DmFXKgRhMWM+xLpndPsA6l8ZfdKJxBvd9HUWzZllWXMuMi7SrL1NrikIqc4rpEftZ8KfbvLeXDzUoJALvkyuGk2TVA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1c6e36-321e-4bd7-b9c6-08db3b98e299
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 21:00:02.5706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvJacItXrkWCJMGDHORCznmTvKrdNiVrELBroTN7RhTxEnLwwT8HmElB0HaL0jISY8G2MbJXVZgzHE5lEewfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_11,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120178
X-Proofpoint-ORIG-GUID: DkEp6QYxV5-SXibA0BiDm3H1i5TTXBXi
X-Proofpoint-GUID: DkEp6QYxV5-SXibA0BiDm3H1i5TTXBXi



> On Apr 12, 2023, at 3:34 PM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Wed, 2023-04-12 at 19:09 +0000, Chuck Lever III wrote:
>>=20
>>> On Apr 12, 2023, at 3:05 PM, Jeff Layton <jlayton@kernel.org> wrote:
>>>=20
>>> On Wed, 2023-04-12 at 18:03 +0000, Chuck Lever III wrote:
>>>>=20
>>>>=20
>>>>> On Apr 10, 2023, at 8:36 PM, kernel test robot <yujie.liu@intel.com>
>>>>> wrote:
>>>>>=20
>>>>> Hello,
>>>>>=20
>>>>> kernel test robot noticed "WARNING:inconsistent_lock_state" on:
>>>>>=20
>>>>> commit: 5fd403eb6c181c63a3aacd55d92b80256a0670cf ("shmem: stable
>>>>> directory cookies")
>>>>> git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-
>>>>> stable-dir-cookies
>>>>>=20
>>>>> in testcase: boot
>>>>>=20
>>>>> compiler: gcc-11
>>>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2
>>>>> -m 16G
>>>>>=20
>>>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>>>>=20
>>>>>=20
>>>>> If you fix the issue, kindly add following tag
>>>>>> Reported-by: kernel test robot <yujie.liu@intel.com>
>>>>>> Link:
>>>>> https://lore.kernel.org/oe-lkp/202304101606.79aea62f-yujie.liu@intel.=
com
>>>>>=20
>>>>>=20
>>>>> [   21.279213][    C0] WARNING: inconsistent lock state
>>>>> [   21.279668][    C0] 6.3.0-rc5-00001-g5fd403eb6c18 #1 Not tainted
>>>>> [   21.280199][    C0] --------------------------------
>>>>> [   21.280657][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W}
>>>>> usage.
>>>>> [   21.281238][    C0] swapper/0/0 [HC0[0]:SC1[1]:HE0:SE0] takes:
>>>>> [ 21.281773][ C0] ffff8881102e9b50 (&xa->xa_lock#3){+.?.}-{2:2}, at:
>>>>> xa_destroy (lib/xarray.c:2214)
>>>>> [   21.283140][    C0] {SOFTIRQ-ON-W} state was registered at:
>>>>> [ 21.283640][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
>>>>> [ 21.284089][ C0] lock_acquire (kernel/locking/lockdep.c:467
>>>>> kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
>>>>> [ 21.284513][ C0] _raw_spin_lock
>>>>> (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
>>>>> [ 21.284937][ C0] shmem_doff_add (include/linux/xarray.h:965
>>>>> mm/shmem.c:2943)=20
>>>>> [ 21.285375][ C0] shmem_mknod (mm/shmem.c:3014)=20
>>>>> [ 21.285791][ C0] vfs_mknod (fs/namei.c:3916)=20
>>>>> [ 21.286195][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228
>>>>> drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408)
>>>>> [ 21.286653][ C0] devtmpfsd (devtmpfs.c:?)=20
>>>>> [ 21.287046][ C0] kthread (kernel/kthread.c:376)=20
>>>>> [ 21.287441][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314)=20
>>>>> [   21.287864][    C0] irq event stamp: 167451
>>>>> [ 21.288264][ C0] hardirqs last enabled at (167450):
>>>>> kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42
>>>>> (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator
>>>>> 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1)
>>>>> mm/kasan/quarantine.c:242 (discriminator 1))=20
>>>>> [ 21.289095][ C0] hardirqs last disabled at (167451):
>>>>> _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108
>>>>> kernel/locking/spinlock.c:162)
>>>>> [ 21.289969][ C0] softirqs last enabled at (167330): __do_softirq
>>>>> (kernel/softirq.c:415 kernel/softirq.c:600)
>>>>> [ 21.290755][ C0] softirqs last disabled at (167355): irq_exit_rcu
>>>>> (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640
>>>>> kernel/softirq.c:662)
>>>>> [   21.291540][    C0]
>>>>> [   21.291540][    C0] other info that might help us debug this:
>>>>> [   21.292230][    C0]  Possible unsafe locking scenario:
>>>>> [   21.292230][    C0]
>>>>> [   21.292905][    C0]        CPU0
>>>>> [   21.293235][    C0]        ----
>>>>> [   21.293575][    C0]   lock(&xa->xa_lock#3);
>>>>> [   21.293987][    C0]   <Interrupt>
>>>>> [   21.294327][    C0]     lock(&xa->xa_lock#3);
>>>>> [   21.294753][    C0]
>>>>> [   21.294753][    C0]  *** DEADLOCK ***
>>>>> [   21.294753][    C0]
>>>>> [   21.295483][    C0] 1 lock held by swapper/0/0:
>>>>> [ 21.295914][ C0] #0: ffffffff8597a260 (rcu_callback){....}-{0:0},
>>>>> at: rcu_do_batch (kernel/rcu/tree.c:2104)
>>>>=20
>>>> It appears that RCU is trying to evict a tmpfs directory inode
>>>> prematurely.
>>>> lockdep catches this because someone else is trying to add an entry to
>>>> it
>>>> while RCU is trying to free it. Classic use-after-free.
>>>>=20
>>>> Jeff, the only new iput() in this patch is the one you suggested in
>>>> shmem_symlink(). Are you sure it is needed (and also correct)?
>>>>=20
>>>=20
>>> The code in your topic-shmem-stable-dir-cookies branch looks correct to
>>> me. After shmem_get_inode, it holds an inode reference and that must be
>>> explicitly put on error, unless you attach it to the dentry (via
>>> d_instantiate).
>>>=20
>>> I'm not sure how to interpret this. The log is a bit of a mess. It look=
s
>>> it ended up in some sort of recursive call into the same xarray due to
>>> an interrupt?
>>=20
>> I think it's easier to see if you look at the dmesg.xz that was
>> attached to the original report.
>>=20
>> The thing calling xa_destroy is being invoked from i_callback,
>> which is the RCU-deferred "inode destroy" method. It's running
>> in softIRQ context.
>>=20
>=20
> Right, but why is it trying to add an entry to an xarray that is being
> destroyed?

I think because the directory inode's reference count is too low,
and it's being destroyed too early (ie, while there are still
legitimate users).


> Or maybe it isn't, and lockdep is just confused and is
> classifying the various per-inode xarrays together? I have a hard time
> interpreting these reports sometimes. :-/
>=20
>>=20
>>> One thing that looks suspicious to me is that this patch has the call t=
o
>>> shmem_doff_map_destroy in free_inode (which is the RCU callback). I
>>> think you probably want to do that in destroy_inode instead since that
>>> involves taking locks and such.
>>=20
>> I'll have a look!
>>=20
>=20
> Cool, I think that's probably safest here. In principle, the xarray
> should be empty when we get to this point so there ought not be much to
> do anyway.

I expected that shmem_free_in_core_inode() was invoked later than
shmem_destroy_inode(), after everything had been completely torn
down.

I'm shooting in the dark with the fix, though. I can't make heads
or tails of the job file that was attached, so I don't have a
reproducer.


--
Chuck Lever



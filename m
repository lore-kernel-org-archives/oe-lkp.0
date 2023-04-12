Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F33C02
	for <oe-lkp@lists.linux.dev>; Wed, 12 Apr 2023 19:09:51 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CIT6tC011222;
	Wed, 12 Apr 2023 19:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=9I3nT46YuQgErQxhEuJjG8vKEliO3fYScXZ20tNYDLI=;
 b=38vgOzR7dCjBUtE3BWSyXH/KLf3t6011GchfV5Nr+q5s083K+Y8qxMBEvhpFzZRYwdFQ
 C72IQ5S8C2umqHRV9aYLuPIUJ6qKeTY6u7IE/i0YGNKlgopHFfA3eiGaMKY7OoxX+x0Z
 xNiFa3WTa/v89wF+VdBNN+7JqvkX34BWOPV85WhyvagyZl+3sxzi5E+X8nY06Hylbq7r
 ghsfKEwY+y9+hD92WPZbGfKrLbMawtzeIF4SfFj6WkET07wt/j2jbjwfu0xbmZ3i7x9H
 ixcklmPzRemmSmM2XAfOB1ggRC5JccA+w7Gwcq3C3OypQk1USuXVow+cvjwRlrDMn5NK zg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0e7h364-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 19:09:34 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33CItGuW012620;
	Wed, 12 Apr 2023 19:09:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3puwe9j402-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 19:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf1IKfBhtLxn9X2PpcHGe3Fu/hucC1HFG8c54rFNMZjjqQoQFWVVv5bKJAA4xlrQOoJuKXxBGSOjE+T+bY2XTrnE0H4/yWJy23vaS1D+4ghuIak2WSUkuO1q8glhQ3jBsGoXX74UWiBZyONi97tAH55IvyQGPS8q9ghT/43RS5PM3fUgyl1I9TNlxlj4TpO4xHOCCA8+a/7Yki2EzKOJ1wPJ3PKG8PYsAb8ZI0djeNijY1KAhEqrz9JswMwz6qPDRTqX3QWlJxhcCWYVAzZyscfyGZvDFiKQOeVHK19TsV3mcbNsOZ9jkAtBedJGG2gZ2a3bzWJwomQybcxHYGl7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I3nT46YuQgErQxhEuJjG8vKEliO3fYScXZ20tNYDLI=;
 b=Et9NWAUWIMdtvAOFa01a/wZDhLkyOTaF14u3eWokQCKC7zReKlzqotBG+aINFLiReyUaf0Wp3xR69CVrYfcsESnTRNXNXMuuQc3rtEa6TmQbZCIZ6e2pzIIf2DyrDcIjLomX11zHpGmSl+qDO+ci/F2zM1YloK7LKHFdBT1C40UX4vA5+pH/2DH3v6ZAWsCgTDjf1yfTfivWLVe7kTkao2Zcpwz58Iz6rik3WMwQZGR0fFppuDaShYFJGJEOAqd6wOJxSCWRHLRun/MRYKh379mApClV/csXlydCtNBXpOnLIoLgOMKYjQhkSNXTJsY3nzJTamlQnuHj/Pjf/n9+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I3nT46YuQgErQxhEuJjG8vKEliO3fYScXZ20tNYDLI=;
 b=WUKjtKQsIFnvWYiffgFgWGkU9x54UwDgQuKFkMTy0fFroBPcPwhy/O2Tujn7nacHeQOhcNXEAke9LkMdg9QfOjUEW9ueVIY1jZStvUPHZMmGueQbmVfXvEdScxipi1fkoXsAeQB6Ysa2UBrwG7ztTunydM0tN+wfQkr8a3oFV+k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW4PR10MB6395.namprd10.prod.outlook.com (2603:10b6:303:1ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 19:09:31 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 19:09:31 +0000
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
Thread-Index: AQHZbA4fvdckUm+IP0Kziy9xKgnubK8n+egAgAARioCAAAEEgA==
Date: Wed, 12 Apr 2023 19:09:31 +0000
Message-ID: <03D6377B-0EF1-4400-84DA-336EC7CF3BE3@oracle.com>
References: <202304101606.79aea62f-yujie.liu@intel.com>
 <4F25D1D2-7D19-49AF-80AD-F0A87BB99681@oracle.com>
 <033d313acfaef939fbfca9349768df34dec40d2b.camel@kernel.org>
In-Reply-To: <033d313acfaef939fbfca9349768df34dec40d2b.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MW4PR10MB6395:EE_
x-ms-office365-filtering-correlation-id: 543aeb25-abad-4421-dc96-08db3b89725c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8S9MdjhQwtCqj67ZRWyrm3xpdz2jpVIGWk86DrsuAMWoFfj8b34VIcf9fJUXWvK4uvXYE5J9pPgGKapTGZjA+wGGwSzq0HwngqMeAUhZ3UBubKpIO7uVil0ZT5kJUegIAxJE1vfd1ohlHs2WAxe0AcXhA1PCw8T8oMxc8ZWyS3iUqgKQDFTCZ2DNaxwRFItl+lCYfvTvgG6KtTdvB31QAU4cAT6EQ8oP2L4ioaPv3cwdt8sJpTTFFMmWsa5nXqXZPQHhvLLuPRfD1Ck1zR/1hnYe8loCH/6hz4YSB4jcN502w008cCIpGMG3O4gBsXSyh1cqKi4HCwLxmMCRi/keJKZNaby2Ohi7p+9l91CnkPaTYpV367NuEtobhEvwjVvJxC6aqrBF9q4upAJM3/gr6P2WFx34+j/r16F+42MKCnibuxis2/NqhGUd9T0Aj3yGlfTiSLal5W69preqw6DnH+kF3ROrIps2rK+UphVEeF0moIDHa3qcLl2uokCD8G9nXo+iiCG9Si2HlWS9jSNxMsUTdfiPUSskJSLrAiubkD8FNwfz6WvBXkPJzssbC1yY/nqbrcJA0nWkCYGUQC4Ju+kUi4mf2mzFXNiERjfX+EhiNVEntrDVxNoIa96LRH4vsCvDd6YzsEmL2UW8uZmP+DOGlPXyHAtfJ3GbDKE6mshvp/d7tl/ldWiUZhhMZiS5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(316002)(41300700001)(26005)(53546011)(6506007)(122000001)(6512007)(38100700002)(38070700005)(6486002)(86362001)(966005)(71200400001)(66574015)(2616005)(83380400001)(66556008)(66476007)(66446008)(66946007)(64756008)(36756003)(4326008)(186003)(6916009)(54906003)(33656002)(91956017)(76116006)(8676002)(8936002)(5660300002)(2906002)(30864003)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aBo1zcYh+DQz5A2XX/QxwyyLNps/IOGdo0S02KhA4JveQ/+el6E+0DVyB0uO?=
 =?us-ascii?Q?nLQUVXkIcRIlU7lmwHImrhZfTIu00s9g4QSD4jDthCzvyqeoM2P0VQihoksk?=
 =?us-ascii?Q?gPGsNCIYrQKl+1qE/ntn5JH5GWr4OyMCxlK1Da0EkNh5uzXkLRoOn6AV5AKk?=
 =?us-ascii?Q?HjocLaMjy9HyF7pmRDF/CfhJ4KcARoKciWg9Z5yOvRxQTB8DXsA1V0hHDyJG?=
 =?us-ascii?Q?l+04hMjtGs4sHdbDwwkgnakX/bcSu7xQbBp2F1ze5g9AbndOQTlBUQc7FDN6?=
 =?us-ascii?Q?XipWR0wMfwmC0RClI7aeonsmrawBQTwbXs8Plp8O1+E+KQP15NgynPSSKTBN?=
 =?us-ascii?Q?8rLpknTXYOlOM6e1mIgqxP+vM3hMgyA0FHouuv/R4cQ58G1JSxw/A2yFUtWq?=
 =?us-ascii?Q?u9pORYKQFtzaE4nDd0TBmYxoUfokkuRJJukhHRdF9y15u+gOWZFml4m9U03W?=
 =?us-ascii?Q?PZu20LnhACXjvPqRENI6m48slbN8QuqljHmy5LgyMtO4LKkw5FsjxPi4Joiy?=
 =?us-ascii?Q?w6v3TtI4qnnN/Lyn/vDlfCSB0aizVvgS5tDGNRt61QxA0DKZdINMVSlC+YD3?=
 =?us-ascii?Q?eTc0YgVbTABzwS8Z/eh1StMwH82bwsYtBsso4qbTWDBgfK5yudHRnaxoKgwB?=
 =?us-ascii?Q?A0a92+7dhqmiWltZarUqbkoWKq42HWuTFyTAD4nt2sRuzjOk8TFsOJ0jUbH3?=
 =?us-ascii?Q?n6+qyYdEh/1/4swqYKFp4ykGuXiBfSSlK11NZziYS/9SrlJYyI0DpccnYrSz?=
 =?us-ascii?Q?FNT0fxuFK9rj4C6JjGC0RgE7sa24VgRELUGSFkYPV8CdsHKJT27elydTjDiK?=
 =?us-ascii?Q?tjRk2Fw/omwsVTXewF8O3sVEtVGDK4cUFZSPfCSrLBtBlxWqtj1lCyFEK7Dy?=
 =?us-ascii?Q?HJiD3r/8ayyb/YeGOMkygwrui6N+2a91zE8GN4BjIvcF8MEvFjvhkY1a0bnD?=
 =?us-ascii?Q?O2az8r5NV/lrq+hivB4Qk3/5tR8MTQzlNB3JlVNpj58JrEV2//czTSu7xm9N?=
 =?us-ascii?Q?OodcF3yPP7tcYRFl6Cl99w9Jd2gwcsQJbDoHbp0kyqFv/Jd7JguY/def0cBT?=
 =?us-ascii?Q?27tFS5UEjbMW9OdU0GJQkCqa/mLHClIEA5akPckNhADmV7dt7UUqIIIqCF+5?=
 =?us-ascii?Q?vkNlmIa8UqHK3A7m4d6OeYq5edavk5nlfmuYimGwIeLfme1A3XqeXJMk+8Wv?=
 =?us-ascii?Q?ol5ON9gV7vu2W+XUrXz8mqAOzeC3h9pR3c20Omf2rhovkkXPoy463Yt+ne08?=
 =?us-ascii?Q?kJDx9dCFHUvrTBO6hdi0Iwybn+xi4LgAlAqCxYvZ6xukZjAT42VPlucpqe6j?=
 =?us-ascii?Q?2sAEAvSf3RF3V5UEdhE4Id2qjL3xm8IOCZtIxFdZF/GpJuh7n44lKp48yz1O?=
 =?us-ascii?Q?dSeFRknCrN6n9CpO+KfDouG7jjEYfRzJoG5KV9xyhXYzzia72qjSbuGaTEni?=
 =?us-ascii?Q?vJg8SbQ1DDPMqcPGT2Gobs0LbV+J5c746TITkT7vRjF7TnRgd31z7kGY7KNg?=
 =?us-ascii?Q?0WSPs9hXzETI9vl3kJMcS61KdN9JBOBPKyv1EUBNhon4xidaINzMyjHKwJ+9?=
 =?us-ascii?Q?AUnVOqLZErAPrmULBzkVqpYSZs3nnWnWq1Th3SsEbpYARhBXVI0cox4i0M/I?=
 =?us-ascii?Q?Kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <244A3A44ED82024C8A86031AC632182E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d9UfU2sHjykKjddbeqcttYLvFvAsQotE3OKGKGiCn5SXzz2etDdqjouyGy7ZcZ0c9AD2QOQhb9NCN/8ULjJtqYP8Y/66tqMRGqALSJvUBlhKe3qw8RHwk8Z8JsjHLtkvI4dCxeIOdzzsppMSc07adRadl1EXWUSeN+TWr3pnnICCETINu9NLUr7E+bIu1V70n5FxyniahjMf3FS909laxrYFvH8QMVgig1pJG/TXpieGSJamppFSdSltFi7CUIEniJfEkF6DvlCciLuj3ftObaHpgPxNJEc27tpnOpLVpPaWej7iJLmPQuD4pOPvujAjRV1jRmlDME3uhSUJHBx144DZAbXL3XsWMyJ0vfzhfJBZVZe6muA4bCHEmJrcdTgHKPom1ExiVCjMn8hWVyPG1bku2B/lV9g/rUui3e0seNvzEXw8RfVQAn/yvtz6US3Ks27tAghJ3fSh/gMSzRs7H2nJ45sLXphGG6pdmxUNnRrgd4c71b9zdTJ13NmI2o7omrdsk42UbYqlAAoZ6liYwYWXyAVN6jcvj0hUEPC/S/DE9dGQjLLuLet6jo1/6fXf9+98zSKaRB/GQCMb1QGQsAbTdpKI6GKBKZkFl4HQ08GQ+D4b+dcT68hRi8a9x3fc6m6EEHnTSps7SwetXwUNOTmY3uL0dptjlwobd4na2FZVPfupugzOeDQfweps38kjE75NqjvkZ3s9nIsE0U8fABrRic3utne51mO0IdPKyJBQ2O23yYbjfsIsO0XrF1v9bNqA5jdT3xi+IBq1HtmcsdDBqSvk77id6mzzEztG9mwD8gjW3cx2Ejo3Ls9CXbdqA8q0PZB0RP92zOikH66+Gg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543aeb25-abad-4421-dc96-08db3b89725c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 19:09:31.7933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQOtJTPcvoZeQiPQXJwBnlrMTd3dmb6YordxP8Tb6akYkLu0jacpYrA+zrVwPGL0gH/KiChzSxynpdtWO3kogQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120165
X-Proofpoint-ORIG-GUID: OfeTMc2JqQAid-Yvio9bbNjwW3npGs9X
X-Proofpoint-GUID: OfeTMc2JqQAid-Yvio9bbNjwW3npGs9X



> On Apr 12, 2023, at 3:05 PM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Wed, 2023-04-12 at 18:03 +0000, Chuck Lever III wrote:
>>=20
>>=20
>>> On Apr 10, 2023, at 8:36 PM, kernel test robot <yujie.liu@intel.com>
>>> wrote:
>>>=20
>>> Hello,
>>>=20
>>> kernel test robot noticed "WARNING:inconsistent_lock_state" on:
>>>=20
>>> commit: 5fd403eb6c181c63a3aacd55d92b80256a0670cf ("shmem: stable
>>> directory cookies")
>>> git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-
>>> stable-dir-cookies
>>>=20
>>> in testcase: boot
>>>=20
>>> compiler: gcc-11
>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2
>>> -m 16G
>>>=20
>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>>=20
>>>=20
>>> If you fix the issue, kindly add following tag
>>> | Reported-by: kernel test robot <yujie.liu@intel.com>
>>> | Link:
>>> https://lore.kernel.org/oe-lkp/202304101606.79aea62f-yujie.liu@intel.co=
m
>>>=20
>>>=20
>>> [   21.279213][    C0] WARNING: inconsistent lock state
>>> [   21.279668][    C0] 6.3.0-rc5-00001-g5fd403eb6c18 #1 Not tainted
>>> [   21.280199][    C0] --------------------------------
>>> [   21.280657][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W}
>>> usage.
>>> [   21.281238][    C0] swapper/0/0 [HC0[0]:SC1[1]:HE0:SE0] takes:
>>> [ 21.281773][ C0] ffff8881102e9b50 (&xa->xa_lock#3){+.?.}-{2:2}, at:
>>> xa_destroy (lib/xarray.c:2214)
>>> [   21.283140][    C0] {SOFTIRQ-ON-W} state was registered at:
>>> [ 21.283640][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
>>> [ 21.284089][ C0] lock_acquire (kernel/locking/lockdep.c:467
>>> kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
>>> [ 21.284513][ C0] _raw_spin_lock
>>> (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
>>> [ 21.284937][ C0] shmem_doff_add (include/linux/xarray.h:965
>>> mm/shmem.c:2943)=20
>>> [ 21.285375][ C0] shmem_mknod (mm/shmem.c:3014)=20
>>> [ 21.285791][ C0] vfs_mknod (fs/namei.c:3916)=20
>>> [ 21.286195][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228
>>> drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408)
>>> [ 21.286653][ C0] devtmpfsd (devtmpfs.c:?)=20
>>> [ 21.287046][ C0] kthread (kernel/kthread.c:376)=20
>>> [ 21.287441][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314)=20
>>> [   21.287864][    C0] irq event stamp: 167451
>>> [ 21.288264][ C0] hardirqs last enabled at (167450):
>>> kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42
>>> (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator
>>> 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1)
>>> mm/kasan/quarantine.c:242 (discriminator 1))=20
>>> [ 21.289095][ C0] hardirqs last disabled at (167451):
>>> _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108
>>> kernel/locking/spinlock.c:162)
>>> [ 21.289969][ C0] softirqs last enabled at (167330): __do_softirq
>>> (kernel/softirq.c:415 kernel/softirq.c:600)
>>> [ 21.290755][ C0] softirqs last disabled at (167355): irq_exit_rcu
>>> (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640
>>> kernel/softirq.c:662)
>>> [   21.291540][    C0]
>>> [   21.291540][    C0] other info that might help us debug this:
>>> [   21.292230][    C0]  Possible unsafe locking scenario:
>>> [   21.292230][    C0]
>>> [   21.292905][    C0]        CPU0
>>> [   21.293235][    C0]        ----
>>> [   21.293575][    C0]   lock(&xa->xa_lock#3);
>>> [   21.293987][    C0]   <Interrupt>
>>> [   21.294327][    C0]     lock(&xa->xa_lock#3);
>>> [   21.294753][    C0]
>>> [   21.294753][    C0]  *** DEADLOCK ***
>>> [   21.294753][    C0]
>>> [   21.295483][    C0] 1 lock held by swapper/0/0:
>>> [ 21.295914][ C0] #0: ffffffff8597a260 (rcu_callback){....}-{0:0},
>>> at: rcu_do_batch (kernel/rcu/tree.c:2104)
>>=20
>> It appears that RCU is trying to evict a tmpfs directory inode
>> prematurely.
>> lockdep catches this because someone else is trying to add an entry to
>> it
>> while RCU is trying to free it. Classic use-after-free.
>>=20
>> Jeff, the only new iput() in this patch is the one you suggested in
>> shmem_symlink(). Are you sure it is needed (and also correct)?
>>=20
>=20
> The code in your topic-shmem-stable-dir-cookies branch looks correct to
> me. After shmem_get_inode, it holds an inode reference and that must be
> explicitly put on error, unless you attach it to the dentry (via
> d_instantiate).
>=20
> I'm not sure how to interpret this. The log is a bit of a mess. It looks
> it ended up in some sort of recursive call into the same xarray due to
> an interrupt?

I think it's easier to see if you look at the dmesg.xz that was
attached to the original report.

The thing calling xa_destroy is being invoked from i_callback,
which is the RCU-deferred "inode destroy" method. It's running
in softIRQ context.


> One thing that looks suspicious to me is that this patch has the call to
> shmem_doff_map_destroy in free_inode (which is the RCU callback). I
> think you probably want to do that in destroy_inode instead since that
> involves taking locks and such.

I'll have a look!


> I'm not sure that's enough to explain how it ended up here though.
>=20
>>=20
>>> [   21.296705][    C0]
>>> [   21.296705][    C0] stack backtrace:
>>> [   21.297254][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
>>> 6.3.0-rc5-00001-g5fd403eb6c18 #1
>>> [   21.298007][    C0] Hardware name: QEMU Standard PC (i440FX +
>>> PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>>> [   21.298867][    C0] Call Trace:
>>> [   21.299199][    C0]  <IRQ>
>>> [ 21.299503][ C0] dump_stack_lvl (lib/dump_stack.c:107)=20
>>> [ 21.299926][ C0] mark_lock_irq (kernel/locking/lockdep.c:232
>>> kernel/locking/lockdep.c:3976 kernel/locking/lockdep.c:4179)
>>> [ 21.300362][ C0] ? secondary_startup_64_no_verify
>>> (arch/x86/kernel/head_64.S:358)
>>> [ 21.300888][ C0] ? __pfx_mark_lock_irq
>>> (kernel/locking/lockdep.c:4170)=20
>>> [ 21.301353][ C0] ? __pfx_stack_trace_save (kernel/stacktrace.c:114)
>>> [ 21.302659][ C0] ? orc_find+0x23b/0x4d0=20
>>> [ 21.303106][ C0] ? save_trace (kernel/locking/lockdep.c:586)=20
>>> [ 21.303519][ C0] ? secondary_startup_64_no_verify
>>> (arch/x86/kernel/head_64.S:358)
>>> [ 21.304046][ C0] ? kernel_text_address (kernel/extable.c:99)=20
>>> [ 21.304507][ C0] mark_lock+0x4b8/0x13a0=20
>>> [ 21.304959][ C0] ? __pfx_mark_lock+0x10/0x10=20
>>> [ 21.305445][ C0] mark_usage (kernel/locking/lockdep.c:4530)=20
>>> [ 21.305844][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
>>> [ 21.306285][ C0] ? mark_lock+0xbc/0x13a0=20
>>> [ 21.306741][ C0] ? kasan_save_stack (mm/kasan/common.c:46)=20
>>> [ 21.307182][ C0] ? __pfx___lock_acquire
>>> (kernel/locking/lockdep.c:4914)=20
>>> [ 21.307647][ C0] ? rcu_do_batch (include/linux/rcupdate.h:332
>>> kernel/rcu/tree.c:2114)
>>> [ 21.308082][ C0] ? rcu_core (kernel/rcu/tree.c:2374)=20
>>> [ 21.308489][ C0] ? __do_softirq (arch/x86/include/asm/atomic.h:29
>>> include/linux/jump_label.h:260 include/linux/jump_label.h:270
>>> include/trace/events/irq.h:142 kernel/softirq.c:572)
>>> [ 21.308922][ C0] ? irq_exit_rcu (kernel/softirq.c:445
>>> kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662)
>>> [ 21.309353][ C0] lock_acquire (kernel/locking/lockdep.c:467
>>> kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
>>> [ 21.309771][ C0] ? xa_destroy (lib/xarray.c:2214)=20
>>> [ 21.310185][ C0] ? __pfx_lock_acquire
>>> (kernel/locking/lockdep.c:5637)=20
>>> [ 21.310639][ C0] ? __pfx___lock_acquire
>>> (kernel/locking/lockdep.c:4914)=20
>>> [ 21.311104][ C0] ? ftrace_likely_update
>>> (arch/x86/include/asm/smap.h:56 kernel/trace/trace_branch.c:229)
>>> [ 21.311571][ C0] _raw_spin_lock_irqsave
>>> (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
>>> [ 21.312040][ C0] ? xa_destroy (lib/xarray.c:2214)=20
>>> [ 21.312457][ C0] xa_destroy (lib/xarray.c:2214)=20
>>> [ 21.312859][ C0] ? lock_acquire (kernel/locking/lockdep.c:467
>>> kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
>>> [ 21.313290][ C0] ? __pfx_xa_destroy (lib/xarray.c:2208)=20
>>> [ 21.313746][ C0] shmem_free_in_core_inode (mm/shmem.c:2989
>>> mm/shmem.c:4061)=20
>>> [ 21.314231][ C0] ? __pfx_shmem_free_in_core_inode (mm/shmem.c:4058)
>>> [ 21.314763][ C0] i_callback (fs/inode.c:252)=20
>>> [ 21.315154][ C0] rcu_do_batch (include/linux/rcupdate.h:332
>>> kernel/rcu/tree.c:2114)
>>> [ 21.315580][ C0] ? __pfx_rcu_do_batch (kernel/rcu/tree.c:2051)=20
>>> [ 21.316037][ C0] ? _raw_spin_unlock_irqrestore
>>> (arch/x86/include/asm/irqflags.h:42
>>> arch/x86/include/asm/irqflags.h:77
>>> arch/x86/include/asm/irqflags.h:135
>>> include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
>>> [ 21.316550][ C0] ? rcu_report_qs_rdp (kernel/rcu/tree.c:2002)=20
>>> [ 21.317012][ C0] rcu_core (kernel/rcu/tree.c:2374)=20
>>> [ 21.317414][ C0] __do_softirq (arch/x86/include/asm/atomic.h:29
>>> include/linux/jump_label.h:260 include/linux/jump_label.h:270
>>> include/trace/events/irq.h:142 kernel/softirq.c:572)
>>> [ 21.317836][ C0] irq_exit_rcu (kernel/softirq.c:445
>>> kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662)
>>> [ 21.318251][ C0] sysvec_apic_timer_interrupt
>>> (arch/x86/kernel/apic/apic.c:1107 (discriminator 14))
>>> [   21.318749][    C0]  </IRQ>
>>> [   21.319052][    C0]  <TASK>
>>> [ 21.319355][ C0] asm_sysvec_apic_timer_interrupt
>>> (arch/x86/include/asm/idtentry.h:645)
>>> [ 21.319880][ C0] RIP: 0010:default_idle
>>> (arch/x86/include/asm/irqflags.h:37
>>> arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:704)
>>> [ 21.320344][ C0] Code: ff ff ff 90 90 90 90 90 90 90 90 90 90 90 90
>>> 90 90 90 90 f3 0f 1e fa 8b 05 f6 b4 a8 03 85 c0 7e 07 0f 00 2d 8b 96
>>> 3d 00 fb f4 <fa> c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90
>>> 90 90 90 90
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>    0: ff                    (bad)
>>>    1: ff                    (bad)
>>>    2: ff 90 90 90 90 90     call   *-0x6f6f6f70(%rax)
>>>    8: 90                    nop
>>>    9: 90                    nop
>>>    a: 90                    nop
>>>    b: 90                    nop
>>>    c: 90                    nop
>>>    d: 90                    nop
>>>    e: 90                    nop
>>>    f: 90                    nop
>>>   10: 90                    nop
>>>   11: 90                    nop
>>>   12: 90                    nop
>>>   13: f3 0f 1e fa           endbr64
>>>   17: 8b 05 f6 b4 a8 03     mov    0x3a8b4f6(%rip),%eax        #
>>> 0x3a8b513
>>>   1d: 85 c0                 test   %eax,%eax
>>>   1f: 7e 07                 jle    0x28
>>>   21: 0f 00 2d 8b 96 3d 00 verw   0x3d968b(%rip)        # 0x3d96b3
>>>   28: fb                    sti
>>>   29: f4                    hlt
>>>   2a:* fa                    cli <-- trapping instruction
>>>   2b: c3                    ret
>>>   2c: cc                    int3
>>>   2d: cc                    int3
>>>   2e: cc                    int3
>>>   2f: cc                    int3
>>>   30: 0f 1f 00              nopl   (%rax)
>>>   33: 90                    nop
>>>   34: 90                    nop
>>>   35: 90                    nop
>>>   36: 90                    nop
>>>   37: 90                    nop
>>>   38: 90                    nop
>>>   39: 90                    nop
>>>   3a: 90                    nop
>>>   3b: 90                    nop
>>>   3c: 90                    nop
>>>   3d: 90                    nop
>>>   3e: 90                    nop
>>>   3f: 90                    nop
>>>=20
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>    0: fa                    cli
>>>    1: c3                    ret
>>>    2: cc                    int3
>>>    3: cc                    int3
>>>    4: cc                    int3
>>>    5: cc                    int3
>>>    6: 0f 1f 00              nopl   (%rax)
>>>    9: 90                    nop
>>>    a: 90                    nop
>>>    b: 90                    nop
>>>    c: 90                    nop
>>>    d: 90                    nop
>>>    e: 90                    nop
>>>    f: 90                    nop
>>>   10: 90                    nop
>>>   11: 90                    nop
>>>   12: 90                    nop
>>>   13: 90                    nop
>>>   14: 90                    nop
>>>   15: 90                    nop
>>>=20
>>>=20
>>> --=20
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests
>>=20
>> --
>> Chuck Lever
>>=20
>>=20
>=20
> --=20
> Jeff Layton <jlayton@kernel.org>


--
Chuck Lever



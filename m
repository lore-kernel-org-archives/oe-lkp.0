Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3513AD1
	for <oe-lkp@lists.linux.dev>; Wed,  1 Nov 2023 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rvhhkfJu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ck3vxwqo"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1GYmwT015703;
	Wed, 1 Nov 2023 16:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=Kw4zUpL0EHCMWlC9ARMBpdw++3s/L3xDt28TaYP25v0=;
 b=rvhhkfJupWdvw5iiSbi0V/LPZObJDYZOEtBtvLGdSXRdOPp35PpC+nYWip/VbwU2TsA7
 +fviFs4JvGDuOcRBV4Li9pJsIReSjp0aerooDSDqeNIMjwXwfuAJP2P3BHtpeOqRzSNj
 2Bip+pJvvB61loeWYREOU09wAuICadN2WkH5njpNsCTT1Z7Qibnql04i2aGpXvcAEALV
 42jJAf7o1WUsXYTgbcTGDKwjV/2aMxq7IsRt0PsqP4E2YpIjdEkhSfR8OT1TInNy/4ir
 /RlvRC/ptLRNZhNdYn3MoML5AfTUKZJW6DtWcUhGlm/I8+eOcTyj+HElpbCQSU6taWSz 6g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0rw27vdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Nov 2023 16:59:35 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1Gue9Z038059;
	Wed, 1 Nov 2023 16:59:18 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rrdj305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Nov 2023 16:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrMcW/6VlxvgFObeOwWjvipatq3Y2Br6b/qhC0xN1PD4iVNiVp7FoyGk32v0yzZ7aTez//mC9cwgqYVcn+XgPxIND7ZNi5BJYg79LOcKDaO3Wf7pfF9/ccTeXOtW7IZfMDJ+Qigj64cUF7fGZoAdoNCwPA48Xei7USzf/xZ20xYvZ5wemMoZDWvqnbgLVd1/8E1872hmVPsXSDxm4cEYxmY5O0aySpj/qw/4qCoPEIenJIpPsA1Hcez54TJv3kiPAuZGMgrdTpX9Hi/FMJvLH7Gq9Pjgb2MQmiUbuJw8hlk32+54qV5DdtlXi065XG7T98U4ABK23Zxvlkw3NeL90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw4zUpL0EHCMWlC9ARMBpdw++3s/L3xDt28TaYP25v0=;
 b=Q9e4db51VDLHW5TrFwWWK64cQJKFSiPm+4LEVgHLtNVJ6FEXqkXkM/q3c8xQQoxVTV3DdfFYqehToYOvjYAS2pGf0H6JqfJcgEsuFX0IqB0MzPZ0KgtEq96qCMasaFWT8ZLmWU9B582SLlAQJJhZ/1wvGDitczJTi1Rm7bw1nGktogoJ2lwi1f+SXENbHtMBIEv49QYtGdobR9zcOGtHWQVpSCv5BQbF0DviXrk9yhSNqniShCdGh0g+VijSSh1qqeWGMZJ0sG8RlxL2HCUcpP0jt6p5wQ3rhW4o43L6sL/JruazFtCzNBtE+Z5R+pnF1Of3tr+r/QluSoHj/+M1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw4zUpL0EHCMWlC9ARMBpdw++3s/L3xDt28TaYP25v0=;
 b=ck3vxwqozwnSA/w5OJuK3GUjdAZw+hq6Q18PqoOMvrXmjAr9n7Mda6ZgNQMeUJvM96WxLAihgbY/nc3KUNdse5WX/JPDOG3ch/4CxAh7cPVm0VjcBEIDRBO92d4MoJaKbDNt0DcACK+8qUMbE2jO8GnTYqSeU6q0hlvuPw+DqjI=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN0PR10MB5030.namprd10.prod.outlook.com (2603:10b6:408:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 16:59:16 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6907.025; Wed, 1 Nov 2023
 16:59:16 +0000
Date: Wed, 1 Nov 2023 12:59:14 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [PATCH 2/3] maple_tree: use preallocations in mas_store_gfp()
Message-ID: <20231101165914.3bqsjmfbqwktlalz@revolver>
References: <20231009201639.920512-3-sidhartha.kumar@oracle.com>
 <202310251706.6e6f6c4a-oliver.sang@intel.com>
 <20231026171635.3xmpba2cuzjhkcxg@revolver>
 <ZTtRqO+lddA+7nRv@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTtRqO+lddA+7nRv@xsang-OptiPlex-9020>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::17) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BN0PR10MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: e8558a43-1848-4e45-99cf-08dbdafbe1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OMfIfqkp4GRZL05I+SO7SXoLyX41nwFV4Wa/kV8uRy8R9FZLv+ow0iefqtuIhwantlIwL9UHcfvuTdQbzCELJQyOKGai9W3jb/h8lHci5W9g397CSg5hLjfL4IKmNja9uv7a4LCwZrdqWXZi4+qDrJFLICN7Vt0N1THsPRn5NR6YqWj9DGCBimXOIkiM9mvvXYIy/rPBhZNxOTfqEQdbtSoQ3vEU67WKZ6u84XzRWBfLzijtJgfzPgl5pomJ9FGsqpVDngpEnKFwSdQUjFz2rsoNFpbUBYHEnqs++9V/hqv7Y8JoG4gFtrXHRlUC8UjsH8J88/CsKery+tqn87h41lrVnI0WT6mS6sJLoRcGGlzjkgehD0GELGybL79X9ftyXdAdIn21B6jCPKsuO5v1LSNGZda+ZrAtOMDGNsmqxTUvyvwPKJ4047TErbbulph9hRWJXwFlH0A92sXqrH4m4sv5Q6YwTtKLXcRmANy4InziWb0ca+vRhmN26l6/ufHJuvNcO/Fgk7J+0XIo6rNJh47b6FJ5ri+bOMzjQxA/e6nhn3pE4Bq9wxDtoabGl80V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(1076003)(9686003)(6512007)(86362001)(66476007)(2906002)(4326008)(5660300002)(83380400001)(478600001)(38100700002)(6506007)(6916009)(8936002)(8676002)(316002)(66556008)(33716001)(6486002)(66946007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gWhn4WDl5CR0l5Qu1TsgwnKX4lTODIVeOP0scuRqTT4OlwtIs4FuQWQE7fH/?=
 =?us-ascii?Q?hUeYhC7/+Rokv7V1SFTMIEfGE6OUBroBSws1z5/T4msRaMrJC6m2Zzz68iQ9?=
 =?us-ascii?Q?rhBZcernX01OScwZa2Wc+xK2FIZUeqhUqweCz+bdmoKP26KWrfjfOHWf8ewF?=
 =?us-ascii?Q?n4OGKzQoYG9MO66Vofda5Q76vXiuLQx13V8vtwBss+GBK6nz75NGYtunalcH?=
 =?us-ascii?Q?J5astBuDVA735jFwKw5fWrKB61B5Cf4ERHiw64La/iYLatR+gYtV4z1mipi7?=
 =?us-ascii?Q?kJyr/9TLh4SM7s3lSZE4X4GuWBCo5NTvpQ+I4EbC1zhEi1SpD2KlVJwjIUF8?=
 =?us-ascii?Q?OGkv3H/X4LSSVgvLqc+GYtgJzY+e8730yvSdK3/X6Di2F9hLvCSCPBrvx23A?=
 =?us-ascii?Q?gZknwOorZYGkzNUFYEWZKLMa4ToC5KMZUrZjIcp3YhWRoyF7wX8ax/QclXa7?=
 =?us-ascii?Q?EdJJjN3HI2huZl80SqeuDubmpRHvaYDvWUfiT4zinyXp+TmAeoFva5rYyB5t?=
 =?us-ascii?Q?C+EaQb0SktJizZcqiH1MIEc0TM0JInyXinOuXWCdK30Kzau4FoKwQHygYq5p?=
 =?us-ascii?Q?/s9R9JWCT1XK+ijMD9Zltc7oc1d6GNCSTC6xdonw0Qzeb+C/RJCW/xjODYVo?=
 =?us-ascii?Q?apgtgk6Won4IcbUPucmmvjXir/G+phVIW4xOlctAyCUTf0STap5DuPpwvCNK?=
 =?us-ascii?Q?LQci9uU9OZ8uWNTW4eQFHTnZgL3Xkp7J2FJasMBoqN9xTkQQrXsqWkqvLDxJ?=
 =?us-ascii?Q?3KlM/1fgJmeNkmpZ9X0NDXyQjaCwcQFCorcSv1gE8WfuhOjOytdhvgaNAZOZ?=
 =?us-ascii?Q?rsy2eRCyp0r72EXX3aoLHcA98aycRKKN3nCn89KGi07jOWR/DmhXc6A7ITKU?=
 =?us-ascii?Q?kTCfhj8Q9k+bAp/v14sifLcJZH+VrCyYpq2bBSTT1Jg979kmGXK1NxAYCb29?=
 =?us-ascii?Q?pgGAI6Ud2FOXteLzmkunKgD38leQn2WHCnQETpsDT3aUr80qTvwMlWP2LIqF?=
 =?us-ascii?Q?s8ycVST1JupB/D/tfphWrGjUv2d8DO8/+XhzhgkGqrpPHHMpMnZy+lE8tFP4?=
 =?us-ascii?Q?RpMAZpHeqajIiHg15RbvBGjUBHmi4hf1WSeS3mjvUPKWjgLsYZJSiUySqfzU?=
 =?us-ascii?Q?7DI/Av7rIOfGrHfYWTD2vLDfrm1n+AQPVnnn29J9yltnnBTtN44diuPIbLnd?=
 =?us-ascii?Q?TJa10owBHl+3GONu72birBJyhBJ8WegF2dKgKwFLArMO9oGoN5uOViMDJbU3?=
 =?us-ascii?Q?tZf9Af1x7UyUuxWiwtBxmeCJLQyDKZNtmp/qOCkUu4hozHlwTpJBrEs9AciX?=
 =?us-ascii?Q?8BHauZE8Cms87jpRJ2i7ZtNboPimbNQSExWBCpSMh9WZsXkG0iSvodsy0H6U?=
 =?us-ascii?Q?0qK61X5201DBCaXI2ZV6AOdH0pPoyAPE/CGUFuw6rWVSUenjWbFo8/Icfxcg?=
 =?us-ascii?Q?rh+5LllhMnWvyj+QzaTYODbtpHSrIMLgb1YLufXT+cPzbPvpHiKWeNJebyX6?=
 =?us-ascii?Q?cVvUtnSKDt2sIWU4Y73P4JyILrKZKyh7kQMVDq61O7JVlkuRdu30OfBHOCYZ?=
 =?us-ascii?Q?z4/ldmomaQcMfAA3O1s7U0su2OX+rKZCsCjCwrLY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HVbSoxTZWVYIG0hnyI20fsOGbdvouFW1vMe07uJ6sNsciZx6Xo8rEQA4ruQ2m5HmtWoxP96CjQKVTpLcEnS+mHXnWcA37sxmSDrf5g4waWedTIK9X4CovC3meYM4DkIiNIUcgGJMU8Ec0heDQ2VIf74mdD6yjHLgT9I3bXzGc6DAFkIi4EDYMLmKttY9G1jR7WvQr6QzZBxFrgKV/mpE5Yn5nEHIsCqgU+4MfQUa0mgZR9ZvwN9TMktYeUlSCef4R+3j71P7PeTtFxbnuvrocW9omVfMm2PFscmbpIUhv6tE3KCT4H7iT1UgJSFD634A7c5o8qo6ypYQcDENDHhdDb/Se7Znf9Ikc/JJXszMgzQv6pr19DfxmOQlCBnc9/1Hs00v6LpaXWseLWInN3dTjNGVpoLNa5pPOhTBmVYe9hpXWHsh5LX58dVauYyUWI7SAQlljYTjhyiyaeisOdysh9X5Y0nxHL1E4KhGXORoxcYV99woJ8yQ8JUkCPl/W7ohrXPsqitoTEJYhakRBcDmE7iMvyTvzyGU89WT3FC6PZ9N3OqO7+/lvv4gTOKWPSKNpO0t2kTKbzTY3h23U0hzw+f/3j2zStHO2N2W+ndQD5AyT3XY+AFxO0tzj9oI5RJxripw2xxqzYANk9f1xYwVxvmsfsPaEvjG8eVXIHZOKXpz3fVcT6sJAv+1q9EK2LMtQ783W0SamI87bVyTRIvNXWPWnwsOVjuqFalG9JmFeuq/pm9/jgVwGAdzQyaVn1IrNwMtK+WV8OGU2R3olYKzZwnQuqFN0iHPwzOWAlM2nos=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8558a43-1848-4e45-99cf-08dbdafbe1d2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 16:59:16.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlaJUd1alNWqbzJVRARWrnY39KkFbkQVeFo40Pdm23JHWkuLppRonSbfhyKFpNFMsRxl0a1kOfDUOr6/yWmFRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_15,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=956 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311010133
X-Proofpoint-GUID: a8HPij3TBpe5oOLZLgBVAu01J2detjSl
X-Proofpoint-ORIG-GUID: a8HPij3TBpe5oOLZLgBVAu01J2detjSl

* Oliver Sang <oliver.sang@intel.com> [231027 01:59]:
> hi, Liam,
> 
> On Thu, Oct 26, 2023 at 01:16:35PM -0400, Liam R. Howlett wrote:
> > 
> > ... Dropping direct Cc's in attempt to avoid even more noise.
> > 
> > * kernel test robot <oliver.sang@intel.com> [231025 05:52]:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
> > ...
> > 
> > This patch set is being revised and discussed on how to make it a more
> > complete solution.
> 
> got it. we'll stop reporting for this v1 series if any further findings.
> 
> BTW, 'kernel test robot' intends to supply extra data while a patch set is
> under review and discussion, unless it's already explicitly dropped or NACKed.
> 
> > 
> > In the mean time, is there any way to stop the bot from emailing
> > everyone and burning more power?
> 
> want to consult if it's ok to send to the mailing list but not cc any
> individual mail in case we find regression for future version?

No, no change needed.  I can NACK in the future.

Would it stop if I replied:

NACK - Stopping the bot from testing this further.

Thanks,
Liam

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6BD246BAF
	for <oe-lkp@lists.linux.dev>; Fri, 20 Jun 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750416060; cv=fail; b=BS0UeAV21KQPxeF3vtmmw7x45ImwH1mc7WB47qzTWBoM9VW9muivdr2WcNbyeJ+wP2/7WgInOqpgcxzTp2OgUrlLwcqittYyZtnoxsi2J2UmE03fBmobwHnjEcP2ptkYnuevQuGa3K6cVH8VGyD/LxjnavaAl0MhTEBHlDjXEz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750416060; c=relaxed/simple;
	bh=YA0VSlKtNhlCB0VcH6qwK+0yBUueUlbvixpru+/L/Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TpKGthIKIX6NUbr76qQDD+pWT4bgt269Ch6SSioIfSVnPgoLOWAR5sQr/8b5RVd76KDNQrnoB66xkA6K7I6oaLoFtTYmoCCSQl1eQNuXofiCiJ0KDddoMaBa7Rfr85ODPEjyX+hgKRYufECOgKMFvWb+j0ZRAU6WFWq4ObfqoYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MpcqCh1m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b8gdzI/3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MpcqCh1m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b8gdzI/3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7g4Lc002647;
	Fri, 20 Jun 2025 10:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jexLOSLGC4zTsFp0ky
	2F5jXDQEf9nqL4GPjn+ZBqbRc=; b=MpcqCh1mWuKrSzWWQl04GKAC2NNPrvUtWX
	TZImyjeU3LG+C1kI00VLa5xC0/CBL4w+qyY6RujJHvf/iBvgnRVk4qeqKmlgXn8z
	0QfxzAu/dM+Z6kpVOBr3qp3z1cTVE8eO0CwKZfatoMs6pGRkHtoANexrph6iOW1P
	p8G3kwhqvOhd3jWNV6LwgvMXJWzJsjGPkb5/ngxYSh8x0b0YVqlRxzdPUOaRWov1
	S7ITY7L31W7nXUIu0k9VCJm4g2g4nsGZm/Fn0NDKsd5yoVYkly4THjQm9Sx1VfXP
	IDM9l0ihmwACOAMndQZyOfR7uzpM6wZDayrP4geRMsX+16O9z9uw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8racuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 10:40:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KACK0d037413;
	Fri, 20 Jun 2025 10:40:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcj3nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 10:40:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpeFkbJ6Fwh93kxP+2SKfXuzFFPwwGHRxSjTvjASOZjEAWzKfggE+pN2b1e/YDzuNkW29AdK9zEhoAw06Sp52nafIFqQ7JwmZW3oxg+uWPTHuhcrsmI3gTYQot8zE9WyiEthhnoVki5OEZ7G2NpFLdGrpMiJivzzIyUoY6NYcXic6NKTdz95ejFzuZXPBTeNpqQ3dWPbAjFT9AgOdEaSYxvMaqftc/ho/v1QptRoDNuOWDHfmM7P1uUbswts1BhgWJwHeQT5Oq35mceKIbb7HUMlDX3+ON5phgePg3OtX4Ai9Y4NxRfg1ZJZ7oCpYN6NtV8q5FDrqCPuRIWvMWiVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jexLOSLGC4zTsFp0ky2F5jXDQEf9nqL4GPjn+ZBqbRc=;
 b=tGEjDnf4d2Sx7MkujwUD0t8P50IdZsZPOVBomR9JC4k6vfV37su3S3PTIfOM2pgRQMTCkPaKocP8rQ3O6SK+CZMyHtjHAVeKK25jpkMr9XaPZHJcZI4ngkL36Rl2Y18/mzr7tJ/YiznMUq/QQGFPT4IB5c7vQv1QrrBCL3o+q5MTzuCj8ZUiDcVSV4TM2JBSNFJgL8BhlIukz84+uCfYNlNrvWDqpP0fTv5N81iHZ7WZto9cVhPV5J9GDJkWC30EoutRJc7a+NGZoPpF3vfPksIJzXWIf0uUsX7BpaZdQufBcEoXdk+2yeRinGm+IP3rfCRrs0Fh3juIF6dbB4s5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jexLOSLGC4zTsFp0ky2F5jXDQEf9nqL4GPjn+ZBqbRc=;
 b=b8gdzI/3u1LZGspxRxhKW+DcIrHgHoM+ByWHmT/GVjU0ILJBRrGy1ZDL2+pfo1nLWiwfeB5zfg02s26x1Snjg2L+VUyQxT6qDZCqNY8mWLru3TIzEXrvl0Q5rz6rUZ9jk6jHcaIi8biBZbC7hTaDRFm/RpkWWedV6+whBcZ7Ews=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB8077.namprd10.prod.outlook.com (2603:10b6:8:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 10:40:40 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 10:40:40 +0000
Date: Fri, 20 Jun 2025 19:40:21 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, surenb@google.com, kent.overstreet@linux.dev,
        oliver.sang@intel.com, cachen@purestorage.com, linux-mm@kvack.org,
        oe-lkp@lists.linux.dev
Subject: Re: [PATCH] lib/alloc_tag: do not acquire nonexistent lock when mem
 profiling is disabled
Message-ID: <aFU6lZxrB_3Wmywn@hyeyoo>
References: <20250620004032.771289-1-harry.yoo@oracle.com>
 <625a80ab.3352.1978b4fddc8.Coremail.00107082@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625a80ab.3352.1978b4fddc8.Coremail.00107082@163.com>
X-ClientProxiedBy: SE2P216CA0041.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::20) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b7b88a-37b0-44e2-9c6e-08ddafe6e62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWQ6lPXH+QbF5kfeJYCq39U1EVPbW/VKuYLr4EIGf3qZ5ylb8OHS6zedXKhF?=
 =?us-ascii?Q?4jZPmGJ83a6vd2O6EIITvVqMyiK21qR46MuY+EqLyChy84Xm7yu+NOX3Vpoj?=
 =?us-ascii?Q?1iLYiXXlcHgYBQHLgxrzUfOQa6M2wdGZEzC1Ko5oGD2NbcqSJJOBNB9oYd/z?=
 =?us-ascii?Q?p42RGyB2UhVEEESYmIv5WUt4yDgVYRWCJmVqFCbQPxeAH/tyNfuWO+BZqgas?=
 =?us-ascii?Q?HJpnwicRyeOvW0wHrHl+4mllPOXdZnE0IhAewv1OTkOU7yNFg+tQIfALukVY?=
 =?us-ascii?Q?o2+QGqb4wUokaeE4SoJoHa3HjPsKJei+1uLS5v9sICKnu/PYaA1/uB3UDFMU?=
 =?us-ascii?Q?Xv6+qNAh6+HuP8yVo9SVq+/yWtb1IUfSyY9NmFwhyEUJCTaZ7WJXDPFx2RW1?=
 =?us-ascii?Q?AZ+1+7LZn1Fq2DELqFuchGP7K7/v7VQahf6cm010I+uBP0dEV9Ls0MmoT8bu?=
 =?us-ascii?Q?Zub2QvEfFEyvA3cL3azPXi7hBEnfHylCaKYGUSiBsFhtYoUWk2cNIsPE9nFy?=
 =?us-ascii?Q?jVjh+awOP0N/qsclYNtlYKEgOkV9gj7QgbxirfOPmJ2NiW72xkmqSPxQnmXC?=
 =?us-ascii?Q?IIuKTrbmwweppVsswQyzYzGVb5iSEl7Fy08KGYtWKQJA81TlPQA1f3Zg1h63?=
 =?us-ascii?Q?51rvE7vX4LzMblVnus14qIXXKDtUuGs7Ap9I4utIcc0NE8yvoDhy+TSflXu0?=
 =?us-ascii?Q?kdZ3BXmTW9N+yo4CQGxBVjcLpjNwK2JMcwzufpE5QnzdDIvtpipdD+42Q8qa?=
 =?us-ascii?Q?Tu8Hq0Tnh9az+KiBj441WHyLmYM11UsD4iFAvn8cWzrCFj/0vaora/3kLK9f?=
 =?us-ascii?Q?FqHh0qjBCaqnuxcaFIcDGfKwbTHYiIbZfhZqIvViPxE/WQFdybgQ1I/+C8M+?=
 =?us-ascii?Q?QGnDH1Vd8AIrpy+KWv3Her3ocEYRJvNoanz0C728iX9ZVv0u0FIA0C2g/fyM?=
 =?us-ascii?Q?JlT/ZVBMRRrIBVSPywQ8hcJnzj8WTNwdbal0iLHWQfgD/O92QIJ7abPiu6w6?=
 =?us-ascii?Q?p2F6ow/nUQkyuqHHRCrTL2uZRsGlsun0dlMffCi17ijXYCaGlAeU6q5p/U12?=
 =?us-ascii?Q?Ym8bV4VHqH21GnOr/CIykxwkRhsEaDCv8O/zn3hqxhG8X5keV9+dGQPDXP/s?=
 =?us-ascii?Q?udO2A3kF1xt4IY6aEVrHgB43lywMSAqGpiEAJdW9C5FCi0D9imH6LQWs+hqt?=
 =?us-ascii?Q?JtgePlmheZkNqx55Xg6phJcWaqhgwkHma85GIWrP9xQIm5PT9+k3N/TnWk58?=
 =?us-ascii?Q?WQY1h9G+JJZZ4SnAAHkN7KleVldTNqDjg6Ck14nlE380UKoQFRdlMBC9Ddh4?=
 =?us-ascii?Q?9+D0wvg/nP12plNJ3O55C2N2MZPif9PmUoJQzg0qrq11LyMnJNZ48koz+ot4?=
 =?us-ascii?Q?oQpoDR5p7Hhrq/9M8vsdlOphhBvS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hqAhJYQZhh8sqfBCClaemlS3HJ1QqhMV3q5DBnDEPphRPjTz2dJ7eU9zgCgk?=
 =?us-ascii?Q?LCXBKzRbV67lpyH9SMIphbR6xX+w3wLYIAadxai86hzxDVh9NFnq93rn4BkP?=
 =?us-ascii?Q?HpM3xFv+ZU9Pp9YX+H/gM7aHc1n9msg7sPRdDSGipnep/OoPbEj6iyhpIAhp?=
 =?us-ascii?Q?fXyvDZ2oktZVRRq53rqfbaYU8tfa7lltkV4a49hXFUqVx4BOqagspR875M2b?=
 =?us-ascii?Q?slrLcIVIZQ7nTJ+nCGyka0ti6SigrRQJWe2qhoV1IRENEaHSeTDo0TJn3NsQ?=
 =?us-ascii?Q?9bCwPyoFnzqc9k0GIsae9x9flfc4r9Pxg8G/Z4kQSfrKswcqRCZ+b76zJMWO?=
 =?us-ascii?Q?VHEU+bb8AnBhgdpINhsbvm83Ks8H5AHID8f8FN7qHhJLmpmvaBqBL10O4lNf?=
 =?us-ascii?Q?mmX73dWtXgF4J+oZQDghtdLBG3CyO0I0MLvCvH3Yf+3GstwxpNGBDxuE44Rv?=
 =?us-ascii?Q?0bGWPwRbfVAhYDMZQx9K6sIC/Z+7sRzcFjtRyr1EC2duHMDRFb0sq4qHzNy9?=
 =?us-ascii?Q?nn+Hn4m3LGy1IkYGhPwkJnGFVLkyBH2RDSWd1yl/Yn4Oxpk7FkKVUqt+U/nN?=
 =?us-ascii?Q?FCQ9Do/+oWasIXHTWsXo7HIk9w8wH5RIVVukDV0asryncWBXgyaRaOJmj0w0?=
 =?us-ascii?Q?QoWQNZmEtk1/TSb+A1LzSGZDqqgllxm8mm1+g6nqqysqHauHXnkhLtKbGUfw?=
 =?us-ascii?Q?Pw1vVg48TAxK8g+ex/7xUOBtc8PmOWK+FYaro8myqYaIsmeqG+rXuCMeCMKC?=
 =?us-ascii?Q?QextivFJ1jD7f1kx/EvSeiJtLINNo2JBbgo6L+wReYTZOiBh+v4V93r2cyG2?=
 =?us-ascii?Q?jIYng+3k3Y+X7f387DekiH91votZcDxi+crSYbBcSgZ8E10YgDf+y6amNTKC?=
 =?us-ascii?Q?fObffKMU8c0xRPav/wXd4nGI6ckW3VauzwvOjt+s9uZ8cwJirHQaMhw50x0d?=
 =?us-ascii?Q?Tf/a+pZg44bEl0yPtSf7uYbzyw1ufS4k4nyeUd++ZMBayb0X6WzQdLHqPlTL?=
 =?us-ascii?Q?BMJsj32u8OY8+3H3EvSkDUYjgY7mlWASd8QvoOnm4bOJdy2E/90zFAYrn8ux?=
 =?us-ascii?Q?2OpZYM4jcWQ5WfO1o92F9gmmXaHKCEBkcplSLQwsmbFGipA4JHPUSlZjtcqf?=
 =?us-ascii?Q?HP34S6sz8+EmX3/8u9CCAOw0lwfdmuCYg4tn2mUHHlr6zZxXL9xl1xzsOYaB?=
 =?us-ascii?Q?jEZw0RLL0FWCCNGG/vUTN4bQRVdkkNCyjAn1RGQcYbuKUWvsyiNvUe6xQQeS?=
 =?us-ascii?Q?/zP1FVaOXBsc2fr9NuEGAgNrw7oVb+dG1dQUtCyYhonrglDFVz/5ddV/Nh+j?=
 =?us-ascii?Q?XBpqQ4u8lKkm19fmnndVWSsa3sCTw+dt9Zc+Ia7R6izXoMMWmg51xteqMquP?=
 =?us-ascii?Q?hbgHtl2t9tjtntXh6PL7H6sXqGxWzo+hsH9lM9EZBmZKwPU5oIZ53W7o1HfN?=
 =?us-ascii?Q?jd4ylfzBlvI7/yp6HiVe3ooUVCzIPkwFcumEvayuR0SCVE9bnXxqLo1b+G7b?=
 =?us-ascii?Q?vi8L6dHjqsKeLA4gVHy9g3au3A72lQtJ5fM0gSjE8CBx34EkPDGdZeJKpiR3?=
 =?us-ascii?Q?QqoHP5R+HoiQgXNwClzlylUU8bmUZCHSNFaEyLRO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZE5JVDZ12JVkZqiTfR7kNSjxgzLSfjctUJZavske7ACxbebCfo1J3iqhmbixbysI8pspbsTe2SMaqDKGZbKY0ZshJtLZ8DKo7vF0J8umMl2tIN/07/ewFA2+K7xHghmf8Zu6DNXII5JUou2Rrz46Uj5rqp0+Cae+EJoaQTqDt/yKH4hLEIlqzO6rzPJtTpljfGVnTP4ej1vg6JtLgV/rpesV0N/6YBP8SXWuImKUTdoi1hVSlXEAjbN8ksV9867FbBVaUsYo2ndu515EVnIsIMuE1YGGLxKheuBLbn4OrPCfy31aA7V5VpIKQNeU8OSqniy7o9gEc8advE6woVHwbO8Tx1ubbyoojWVGPTbHdrwTtIt+9SAyPogbPwz3w6/YSUH3yFfk2Qzv+j6H5Wn+8h4XzP9kHhfYQNZVswus/garqw9ePMU9ptjOG9U55HatkNa0NWNA3FQ+5d9adsmKLnxpgsP1VvBZ7nrwXHtRdfQpZ9PcFPZfd1xF3gXF1LBFNE7GwkTRT1CzlnjyOPmebY5wPbOzVP88AC7VWGCEfgvAZx/m8moe4P6af29WFQ0miTLZ1XcbcTOmigJWvSdf/R0Z56fXT1QFDhIU4banPNk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b7b88a-37b0-44e2-9c6e-08ddafe6e62c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 10:40:39.8734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asotZ4fE47LjWu0KBe2fEDVnnrKZwhRVq9L8TeRcJuo8WW/sY5CAxBOUnCi5M5xp/bRSDUra/cydbO/4jtnNww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8077
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NyBTYWx0ZWRfX/QStdugwWeZG S9tLDMjXjEFw315683iy11rLDGpUbwcJHD4A2ZdULTZONMCoScOKlT9g8w0IIHe/JoNjp6tZwbp O7bfeDL6M9PQCSyycBk3ScW7/LFNC/ZsGNw8YRfToXjAzXadWHUYHUD8vshOKxs2bntXgZ6NoSj
 GjiEe56+E7tzWWLGCUV8BcZVsONPggEOzVfl5cqT3pWNj5Xf3gic1JMPWdubhB3+r9kmVH5qanQ h9F6shIh7fHQ53qnpXOBDe8dklvgMeq8CvHSQML9LpF1hez8RyvjX37nmDrk+GGBxrzMeahcPo0 KxvXSURx0v5pm889S6GIWoEpPOA7fF11HHffXi8v15gG2XtcumjwQ4zxyqcEjREyMQPVMYwWUwS
 aBRuiefCIgnTROEmTifopoTrR8qAuF00usN9UqTB9YI9wpUjFDDLzPUIprqn5L30AVZPJL8a
X-Proofpoint-GUID: KZCmlsXyZ_nRAPqZ87m9BNl_j1GddZwv
X-Proofpoint-ORIG-GUID: KZCmlsXyZ_nRAPqZ87m9BNl_j1GddZwv
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68553aac cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=yPCof4ZbAAAA:8 a=EarH1y48QNY42gMFc_4A:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22

On Fri, Jun 20, 2025 at 11:09:16AM +0800, David Wang wrote:
> 
> 
> At 2025-06-20 08:40:32, "Harry Yoo" <harry.yoo@oracle.com> wrote:
> >alloc_tag_top_users() attempts to acquire alloc_tag_ctype->mod_lock
> >even when memory allocation profiling feature is disabled at runtime.
> >If the feature is compiled in but not enabled at boot, alloc_tag_init()
> >does not properly allocate and initialize the alloc_tag_cttype variable.
> >
> >This leads to a crash on memory allocation failure by attempting to
> >acquire a semaphore that does not exist:
> >
> >  Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#3] SMP KASAN NOPTI
> >  KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
> >  CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G      D             6.16.0-rc2 #1 VOLUNTARY
> >  Tainted: [D]=DIE
> >  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> >  RIP: 0010:down_read_trylock+0xaa/0x3b0
> >  Code: d0 7c 08 84 d2 0f 85 a0 02 00 00 8b 0d df 31 dd 04 85 c9 75 29 48 b8 00 00 00 00 00 fc ff df 48 8d 6b 68 48 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 88 02 00 00 48 3b 5b 68 0f 85 53 01 00 00 65 ff
> >  RSP: 0000:ffff8881002ce9b8 EFLAGS: 00010016
> >  RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 0000000000000000
> >  RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> >  RBP: 00000000000000d8 R08: 0000000000000001 R09: ffffed107dde49d1
> >  R10: ffff8883eef24e8b R11: ffff8881002cec20 R12: 1ffff11020059d37
> >  R13: 00000000003fff7b R14: ffff8881002cec20 R15: dffffc0000000000
> >  FS:  00007f963f21d940(0000) GS:ffff888458ca6000(0000) knlGS:0000000000000000
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 00007f963f5edf71 CR3: 000000010672c000 CR4: 0000000000350ef0
> >  Call Trace:
> >   <TASK>
> >   codetag_trylock_module_list+0xd/0x20
> >   alloc_tag_top_users+0x369/0x4b0
> >   __show_mem+0x1cd/0x6e0
> >   warn_alloc+0x2b1/0x390
> >   __alloc_frozen_pages_noprof+0x12b9/0x21a0
> >   alloc_pages_mpol+0x135/0x3e0
> >   alloc_slab_page+0x82/0xe0
> >   new_slab+0x212/0x240
> >   ___slab_alloc+0x82a/0xe00
> >   </TASK>
> >
> >As David Wang points out, this issue was introduced by commit
> >780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init").
> >Before the commit, alloc tagging subsystem unconditionally allocates
> >the semaphore.
> >
> >After the commit, alloc_tag_top_users() must check whether it was
> >actually initialized. Fix it by adding the appropriate check in
> >alloc_tag_top_users().
> >
> >Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
> 
> I am not quite sure this can be closed, according to the config file
> https://download.01.org/0day-ci/archive/20250618/202506181351.bba867dd-lkp@intel.com/config-6.15.0-rc6-00142-g2d76e79315e4
> 
> CONFIG_MEM_ALLOC_PROFILING=y
> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y  <---
> CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> 
> mem_profiling_support is true on boot, and alloc_tag_ctype is properly initialized.
> 
> Maybe there is other issue lurking somewhere....

Oops, I thought they are all the same issues.
I should have been more thorough and checked the config.
Thank you for pointing it out!

I think you're right. mem_profiling_support == true doesn't necessarily
mean it's allocated and initialized, as you demonstrated it in the other
email.

I think it'd be more robust to set mem_profiling_support to false,
disable mem_alloc_profiling_key at boot and enable it later when
it is properly allocated.
 
> >Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com
> 
> This one should not be closed, because "# CONFIG_MEM_ALLOC_PROFILING is not set".
> https://download.01.org/0day-ci/archive/20250507/202505071555.e757f1e0-lkp@intel.com/config-6.15.0-rc2-00491-g7fc85b92db96

I assumed it was mem profiling that caused the crash, since it happened
while printing memory info. Pretty weird coincidence...

I'll try to reproduce it and figure out why it crashed.

> >Fixes: 780138b12381 ("alloc_tag: check mem_profiling_support in alloc_tag_init")
> >Signed-off-by: Harry Yoo <harry.yoo@oracle.com>
> >---
> >
> >I manually confirmed that the crash in the vmalloc test module no longer
> >occurs with this patch when the memory profiling feature is compiled
> >but not enabled at boot.
> >
> >No Cc: stable because the offending commit was introduced in v6.16-rc1.
> >
> > lib/alloc_tag.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >index 66a4628185f7..20c627191d3e 100644
> >--- a/lib/alloc_tag.c
> >+++ b/lib/alloc_tag.c
> >@@ -124,7 +124,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> > 	struct codetag_bytes n;
> > 	unsigned int i, nr = 0;
> > 
> >-	if (can_sleep)
> >+	if (!mem_profiling_support)
> >+		return 0;
> >+	else if (can_sleep)
> > 		codetag_lock_module_list(alloc_tag_cttype, true);
> > 	else if (!codetag_trylock_module_list(alloc_tag_cttype))
> > 		return 0;
> >-- 
> >2.43.0

-- 
Cheers,
Harry / Hyeonggon

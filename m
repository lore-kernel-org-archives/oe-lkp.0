Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E041D54EF
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741600860; cv=fail; b=Lj4mQlxyyBhcolfJuidtoLx9O2ZS1A2VKOqCzwxJzPyh8fR3cN8VnPuE5H51u8k1bmLVgH1QxmVfe/rwfa0Ol9N89MVj0zuQ3ccEw7BGQZ38K49iZoL7bBPmmV+87fUMtdVQXJjPr17XOhxHHlPmmHhgAzyzICOpAA0tjXVt3iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741600860; c=relaxed/simple;
	bh=jbDfqvDXmXqV3xxMTFlx+f3qvrrrzGayeRKOedNnxuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SC7BNrKbSDw8lvkEMD3WxnCEeGiLQbzp2+wpXTx/4KRWyd67s4oayFPhPV7TG/SHmRlmIr0I233NhMWLgzZQc8kC9z7fuOiQdMkgMrgz0bEGxvVpWCH069hljd/nUxlOungliqGAgtWmg71W+Lea4sZ29jVCotcahSKNNxauhd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dJP3MJBo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xr97SLk2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dJP3MJBo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xr97SLk2"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9BgbZ027606;
	Mon, 10 Mar 2025 10:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Ip6J9UmWN7E1CcN7Hm
	bjNKteegA4QqPflU/Pn+zvlJA=; b=dJP3MJBohyy0WbG8g1zIhUUuragj6eQK84
	aaM6GVSzubdxwsMAIRtiifyLrtcLYvfifK2iFQg1v8Vy+xthIdZSYe/Q3Hdm29mQ
	HjYeLgeK8MREeFUvQIZbOZHame6ocHzxn68q5arlWvYPoNvW+NbELN2mzLqayVBI
	Zxrq9HslKAD80HurMEAwkZV4UNQ4L5/rmPE1HSZzzDPv9fTlSXLH/v0OXoeZXAd/
	1mUsOvsR/EfAuD8ZF/FryMX2q5FfZhTbgJF3WdhpPRXoofLsBf8QojvJyOSeKRl6
	wowI3kEOT9+JvhFzxLVPbUufMx6f6Nd0NTwImtEo8jCdF7m1ZaMw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458cg0t85v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 10:00:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52A8OufP028250;
	Mon, 10 Mar 2025 10:00:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 458cb7bdj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 10:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUoUJN/+zBheoTvD7KIirm/6uUIJw+Wqa/EpDHcgo0QQjCdSFKBNPSQBB2f/2s5TGbOwfMEe9bMPmO6u2mWwEgytBdqCBQwb8msWUTwO1h6XS/OOU6ltq1t2/iuOvF7eZx4vq3U5xgUjVgfQDbOW8XUl3GUXMeLpxe6+eOWIALJct/KE32NzOw3GfUrFysZe4CsTtiQ8D0ma2BcV+8Xt+XnQorA1vNmUseEUYDasyh6lZskePm4iMuY9Qhyqq1SiAHJJmgNL4RjDtVtaZ0aIJvUDlzHx4ygDNxRKT7Vg+vbHhbfVwQMwGWZWIvGoTIclbJBvz3daqA7rYNAFjdo6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip6J9UmWN7E1CcN7HmbjNKteegA4QqPflU/Pn+zvlJA=;
 b=ZtDrCjexhyCQifQOeG5cnqYXiqh1AR233lrFfXVdicTNrguBu3NFGBygH5nHq8pnQI3ZIEo8ccpZLe3wMaYC9plJ0RjnvTe+AY5CJejjIqpZoa5oRYjg5xjbU+j1ckParRH7PdTQtS9x3t+dYVy/j8DAD1pjLpvEfLnsmNrhMAJGuir48+npuCa3CmEUaO2VE7UuPHckT++fZGNwFStQEZePH9nlpw2SxWx2m+EqvLsHAnxcBbnynkB5qsDbO/1oXRw6S2VwGBn+wy34V/UhDAkKboISlB0Pg6FHV+3ce69x3wNiVwlr7rYTJ71QFBJNhJ5I3GXQTS8/r52/VQPgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip6J9UmWN7E1CcN7HmbjNKteegA4QqPflU/Pn+zvlJA=;
 b=xr97SLk2x3W6JMj6j2iXgtofGfL8Erc+RVOXDS/RTyGWIWARiuk4glPQykp74TGHXipdtzz9ljMuP8/aTl2IK2GOjVlYuti/BxYCiSlByWgNf0UViLoeUmCFKhErBbUfjU5mGy8wnEtfsb6RTaA5TM/DkvKSPXXGkZTNTMERvLA=
Received: from MN2PR10MB4112.namprd10.prod.outlook.com (2603:10b6:208:11e::33)
 by LV3PR10MB8084.namprd10.prod.outlook.com (2603:10b6:408:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 10:00:37 +0000
Received: from MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c]) by MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c%7]) with mapi id 15.20.8489.025; Mon, 10 Mar 2025
 10:00:37 +0000
Date: Mon, 10 Mar 2025 10:00:32 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Harry Yoo <harry.yoo@oracle.com>, Jann Horn <jannh@google.com>,
        Liam Howlett <liam.howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosry.ahmed@linux.dev>,
        linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/mremap]  c1cda7af3f:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN
Message-ID: <1bd2aa44-e496-4412-a6cb-592ca6bb2a1e@lucifer.local>
References: <202503101328.442cc724-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503101328.442cc724-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0539.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::10) To MN2PR10MB4112.namprd10.prod.outlook.com
 (2603:10b6:208:11e::33)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4112:EE_|LV3PR10MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cb7117-cee5-48d6-d56d-08dd5fba6855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?psiXjay9gFmNjFdDgm3G7yCIwSv+VRbkwxi3jjPOWm09BWMmHyC7uLrHfagY?=
 =?us-ascii?Q?pfXTt7rJ13i/6Oo7DZnC3jSPGzl8YqWg8gvS8tWvhZkzVEc5+SBK56T5o1LZ?=
 =?us-ascii?Q?3fcgzn7LJc3SJO8CeRuFsHdS8kFng/jBAP08HBRuZE7vohPpo4GqF24OVojf?=
 =?us-ascii?Q?MJR0jHiLAzjL05u2Lu7WzlEq+394cNUrdSZamQi+Zc57Q9lGlfuyzBhEcnHf?=
 =?us-ascii?Q?dtbBSJGgdI8CE9rY0VE4oz+TxAQakWHoFpUZuzjUaH7fjcWeCc8VEEAXW+I4?=
 =?us-ascii?Q?HhhLBmQPXBn9rnLRq/rAHjCJz5Qg1YYpPoNKAptvm/hn7EwLovT8J1CrQvAX?=
 =?us-ascii?Q?ts/qgYtBPgQFGCBHfaAF12iwOhOq8oeFCpTJ5fMHHAbb20gJZ3ymEGjgYYTe?=
 =?us-ascii?Q?gtuFDvKBQ1fmYDD/l6BCLJctPNRv+wDwOjmPN3C85V4J8IQBNrFNDSr6u3FB?=
 =?us-ascii?Q?1Cd4da2m8lYTlgVjxwQwqq6RxxxZbYY8AcJMot5+BaEStF/GGpQNFoPJJ/Z/?=
 =?us-ascii?Q?VU85SFP0dQ6n3Et2UiT1THdrtHqNm44Pd8clc76y91WjpKrjH9WTeC+CV5Y3?=
 =?us-ascii?Q?8hMmtxM3D5u9WZDYUwTMc+i85sYwXf4nXcS8vGMfzTBbRnoZFFxrrM4UXLUR?=
 =?us-ascii?Q?j0pWXe0DTUKWYh5Dr1lmf7wI8QMS70vUUWOm4ih8RoE07S31wgY2LLLs/SCY?=
 =?us-ascii?Q?Bm7q3/+iI+ZP0ApUmGmEg0/1sBlIdHFJ2aS6tWFaQeDbJ4Bejqaeie3V3ntq?=
 =?us-ascii?Q?iDwXNLvnGvq2zyxl8V2aSWkdH8YrZZWe7KCckFj3d2tZhPDmtHvOBOENr4K5?=
 =?us-ascii?Q?bGOoDnIw8uNIQ/vg1AI6Oo/fy9F4jr9zi5c36mXg1txM7kJauMRMNV2uzFDw?=
 =?us-ascii?Q?IxCezkgFjoSNvdAGhfmVcyg7nUmmjExLyjrS0U3wjL06IajwQ0wYajqiDBZO?=
 =?us-ascii?Q?kS16AtU4M1N1Sc7GkNNbN7SY/Oy85NVODkFp5sBzInxbf2FqAm2ox9l8uHuo?=
 =?us-ascii?Q?CYLJFpkcW5D2oZZx8sLWTUIMJDYRuGDeCTupHkrgLndyg3IDW/GDTQ448sQe?=
 =?us-ascii?Q?UKc5cYIp/GYkQ8/c+OFf0gnhOoJY6jNZTBKKvOxWWxuGYAdpr0wb7CN5iS30?=
 =?us-ascii?Q?muio0yBLrUNtCLJT6+Hy3N+eCtuOSWtUdCppmS9KG1XognjdFBOhzYQschaB?=
 =?us-ascii?Q?jsi9MB5fzOE0diZWNUBGlInE2uhz8ARFwux3EUGsqD5uTgHSIg8Jg6fJD95J?=
 =?us-ascii?Q?BMTJ35zDiwu1wA5UqOxUnGKhES+5CD1NRiHKzYcvFL+Z78oobL8Y+Di8mXXy?=
 =?us-ascii?Q?++qaNELYG+MBrX4lT6lNtDsy02+C41MD2vD/aYjMvVxy7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4112.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uPBLADetc4/gKWbylnwS2QNcy5mryw816FJqjwoCb8oYuAvuxs/7lK//knIF?=
 =?us-ascii?Q?zPYtc4Or3eJ9M+OGK86i7lfk5e8tfHZ3pteWn60wFNLZu8yyLI9y8dmbgvq2?=
 =?us-ascii?Q?q07pjd4n3feAErnCQKv5HTvF/BwYJ6CwUa9JDpHKmJZXBSmRkcZ/MT3OnJkE?=
 =?us-ascii?Q?SgXf4RenjNUzFX1H0eUzwcYiq/btPZ3VxLOBTMjepeUNPjX86dFeDBXYKiTj?=
 =?us-ascii?Q?0Gbf1+50KwyqlbwXsov0Vs4x0H1taUUmVXdi2yIZpX9gmrFREjlJ/wPquFgl?=
 =?us-ascii?Q?DzGmxpkOy8xRzPstLKi03YN0yRq4uEi4xCU1whi99ZuTqRMcb6BfNcymIsaO?=
 =?us-ascii?Q?ieEVL0LNQg4u1mrVhk8YtWseO0DciNOwH7cSsH/gJnoK6UvNyIEp6zQ7tQPF?=
 =?us-ascii?Q?iE+lVMuO845nx4uvXHuD5KE/ahe6GckpYI2AdLoDIdMw13PacuLSJY9gZPZq?=
 =?us-ascii?Q?vCKe97UnmjdwDOc9MKodllUQTLRltXMr/qidl6Dl0jjr9LuYh7OAm/AxbBLF?=
 =?us-ascii?Q?f+YxjiiM56d7mU6TCjcJK5HMkBpnoCs2bi1IxdBW8p1AwX9t3ybbgWJ4qTa2?=
 =?us-ascii?Q?AXibgFe2ceibDpHTjGV7c62vXhqur9xxY129J8IPQ5CQ7TA7XKY/GUL7ZsEG?=
 =?us-ascii?Q?wn2YydeI3QArB/rIOq1bjJ4Tc8Z5NSSqXY00sf8Ij8/GudphMhGxTkcvkhNC?=
 =?us-ascii?Q?Qmm6RtQbUQLODEqsH0YSh6/F5IMWihrbx0KXn666Ltr9wACe5bsYJ772vXfl?=
 =?us-ascii?Q?XFRo4m/IFDN3XegXylZB62bFgy3FCrRlqnht7x2qbCQEaVoz3VfI72pG6o/l?=
 =?us-ascii?Q?D1OclKKxHZgnGVRxMNiZjFldaUSLHMOON7NuukNAolTfmp9BcQzBCSNKDXKb?=
 =?us-ascii?Q?MPMLpmnfXYbPkqA5QT369V7be0swVrkZdhoHgfS9OZDZ8PhNCo5GpoG7MdqP?=
 =?us-ascii?Q?S6981bTEv61eksXrSexT9vxMKSsprcf59VZdsrAuh1ikRIci8kBzH2qyBCcE?=
 =?us-ascii?Q?K19ds9n/VkvqdOcHjYXrImI7paoKSz6NSopPToyHh4C/9xXmlXBrL4NOFBy7?=
 =?us-ascii?Q?XJFCqM6G2RgTPEcuEHoFvH68WfiA9T7psVKLqK7VQ0l/zTM7FcYR4ILV/zxP?=
 =?us-ascii?Q?cGJhuEDIyh9bO9pgtVIjQza7N6s51PduzLb01NMKtkl82MRMZrMzI7X7RTse?=
 =?us-ascii?Q?C6G1EAoOEDBbees/5zGyYOi17b4SuNxwTTHDzPNqiDyUFkWGYY5TpFwx/HIx?=
 =?us-ascii?Q?qLLIMN9n4E0RJhW7RJlB3ZuXXQDELwqpiByiQFfq2E71ge5Jb5mWP96k3Epo?=
 =?us-ascii?Q?EjyxX8oCFVTB/1/bUT/9Op4Im8tf8ZmExNrQ/HPgdVj7pCgl0kGuLMUDVeZ2?=
 =?us-ascii?Q?5+Ljc+Olej5+ALvcK4c7UAwUZ/MPRPDeGgO18+zbwUcOVNdErLoReaB2x1es?=
 =?us-ascii?Q?6Zu7021u37JtlaMDYHNnUB+NhLRnbTdVViq19JXExspGhh/E7Qjm8h/5ahtc?=
 =?us-ascii?Q?Ivx94XTxLg2ZlsXXbrD8FX2yt/0Ykga8cgThcekz+E8i3iEBcZ4SlKVZ//ed?=
 =?us-ascii?Q?xLTJlV8CWybbH3B02gh2H9e3U1LpmRjFgU5e0K7w1rrcQcuIMyTftM+AgVoB?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MRFnzaPOIKTyZJqIFa5Y0hyQXDOdOGWQsDSViR2Tz5OFREu3zqrNm08e0ECQqPIct+HOLSi/uRv5WNeMEUiMHeGZ4C1Dct+qWDK5OUkpVQ/9U5vT1YAwMEblyMQ4bwdmoJtqwPpO2CbD9D9swAsiqdh5pFHt4JA24Q0RxPq4KeeCAcVzE8uyr7ZbXlal10LEhXGezSdW7F4tUNegRICjaokHAXhfI6MfUGMbmVMCFQ4QlYMrXujbY10CvIDcAJJ7bTCCEPKxsmERpbf1U9kPxN5MzWn3FElKbR3e1c1fXpanib67G2Wur3gBSFaBmRNd1gHMGhqpq1CRRW4iwbnC2rFr6nlZdaYvuSe8fTKK4TYClU0LtsmcyqVqDJJBj+U+2taB/HkoUxn6cDsnXk+deCwKZXB+U5cvSjBc3M6hk5jHUU/qSOfnJJIcG3H7DisZtAQ8fx5lYYV3JKhvG1BT/V+9xQoL7xDY/tyfhdW+Q7RhURqJSJxKwENSIT7EZfr94ZeVbHGyk9mLwESk3Vz6oFsozuOVpPWeGF51Sjsmtb/t3NO7ea1SGBFLTjSt44BeVY/aih3AvF66XaBvheoVtyqcDH3x6tDOUlWN79XjLTU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cb7117-cee5-48d6-d56d-08dd5fba6855
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4112.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:00:37.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpWHsIM7TsWpR7Lr5JtCywPrxqLIVBoen2lfYi/+xLmuTPTzdFdowzETBNqR/ydBy+ipAm0EYqV0Ch2Iy1IiN0wMGflQpsfTyvFy8Z2EZrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8084
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503100079
X-Proofpoint-GUID: KidF69POIdlQloYVD8zrVhnavZdTFe_E
X-Proofpoint-ORIG-GUID: KidF69POIdlQloYVD8zrVhnavZdTFe_E

On Mon, Mar 10, 2025 at 01:27:06PM +0800, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN" on:
>
> commit: c1cda7af3fc96879b4b2d217b1e8a4ab5fa70df5 ("mm/mremap: introduce and use vma_remap_struct threaded state")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]
>
> in testcase: trinity
> version: trinity-x86_64-ba2360ed-1_20241228
> with following parameters:
>
> 	runtime: 300s
> 	group: group-01
> 	nr_groups: 5
>
>
>
> config: x86_64-randconfig-161-20250305
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202503101328.442cc724-lkp@intel.com
>
>
> [  386.012648][T30778] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] PREEMPT SMP KASAN
> [  386.013652][T30778] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> [  386.014339][T30778] CPU: 0 UID: 65534 PID: 30778 Comm: trinity-c2 Not tainted 6.14.0-rc3-00386-gc1cda7af3fc9 #1 678ccffbca77f1cea62114cb252a9002fbee4b41
> [  386.015339][T30778] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [386.016126][T30778] RIP: 0010:resize_is_valid (kbuild/src/consumer/mm/mremap.c:1010 (discriminator 1))

This is:
	if (!old_len && !(vma->vm_flags & (VM_SHARED | VM_MAYSHARE))) {

So this suggests that vma is NULL.

I think the problem we have is we first invalidate the VMA (to avoid dangling
pointer), then re-lookup the VMA in a couple places.

In each of those we should be checking for !vma and returning -EFAULT.

Thanks for the report, will send a patch shortly!

> [ 386.016591][T30778] Code: 00 74 05 e8 7d 4a 07 00 4d 85 ff 4c 8b 73 10 0f 85 f2 00 00 00 49 8d 7c 24 20 b8 ff ff 37 00 48 c1 e0 2a 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 50 4a 07 00 41 f6 44 24 20 88 75 6a 80 3d b4
> All code
> ========
>    0:	00 74 05 e8          	add    %dh,-0x18(%rbp,%rax,1)
>    4:	7d 4a                	jge    0x50
>    6:	07                   	(bad)
>    7:	00 4d 85             	add    %cl,-0x7b(%rbp)
>    a:	ff 4c 8b 73          	decl   0x73(%rbx,%rcx,4)
>    e:	10 0f                	adc    %cl,(%rdi)
>   10:	85 f2                	test   %esi,%edx
>   12:	00 00                	add    %al,(%rax)
>   14:	00 49 8d             	add    %cl,-0x73(%rcx)
>   17:	7c 24                	jl     0x3d
>   19:	20 b8 ff ff 37 00    	and    %bh,0x37ffff(%rax)
>   1f:	48 c1 e0 2a          	shl    $0x2a,%rax
>   23:	48 89 fa             	mov    %rdi,%rdx
>   26:	48 c1 ea 03          	shr    $0x3,%rdx
>   2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
>   2e:	74 05                	je     0x35
>   30:	e8 50 4a 07 00       	call   0x74a85
>   35:	41 f6 44 24 20 88    	testb  $0x88,0x20(%r12)
>   3b:	75 6a                	jne    0xa7
>   3d:	80                   	.byte 0x80
>   3e:	3d                   	.byte 0x3d
>   3f:	b4                   	.byte 0xb4
>
> Code starting with the faulting instruction
> ===========================================
>    0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
>    4:	74 05                	je     0xb
>    6:	e8 50 4a 07 00       	call   0x74a5b
>    b:	41 f6 44 24 20 88    	testb  $0x88,0x20(%r12)
>   11:	75 6a                	jne    0x7d
>   13:	80                   	.byte 0x80
>   14:	3d                   	.byte 0x3d
>   15:	b4                   	.byte 0xb4
> [  386.018009][T30778] RSP: 0018:ffffc900088f7a78 EFLAGS: 00010202
> [  386.018494][T30778] RAX: dffffc0000000000 RBX: ffffc900088f7c08 RCX: 1ffff9200111ef89
> [  386.019127][T30778] RDX: 0000000000000004 RSI: ffffffff848b6760 RDI: 0000000000000020
> [  386.019764][T30778] RBP: ffffc900088f7aa8 R08: fffffbfff105c033 R09: 0000000000000000
> [  386.020395][T30778] R10: ffffffff8146f920 R11: fffffbfff105c032 R12: 0000000000000000
> [  386.021032][T30778] R13: 0000000000400000 R14: 0000000000001000 R15: 0000000000000000
> [  386.021676][T30778] FS:  00007f012ebf1740(0000) GS:ffff8883aec00000(0000) knlGS:0000000000000000
> [  386.022767][T30778] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  386.023585][T30778] CR2: 00007f012e8a2efc CR3: 0000000102319000 CR4: 00000000000406b0
> [  386.024598][T30778] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  386.025614][T30778] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  386.026665][T30778] Call Trace:
> [  386.027160][T30778]  <TASK>
> [386.027624][T30778] ? show_regs (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:479)
> [386.028222][T30778] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421)
> [386.028816][T30778] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:455)
> [386.029399][T30778] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751 kbuild/src/consumer/arch/x86/kernel/traps.c:693)

Rest of stack:

[  386.030146][T30778]  ? asm_exc_general_protection+0x2b/0x30
[  386.030892][T30778]  ? lock_release+0x10f/0x275
[  386.031534][T30778]  ? resize_is_valid+0xf0/0x39b
[  386.032193][T30778]  mremap_to+0x3a2/0x5d1
[  386.032781][T30778]  do_mremap+0x74d/0x9ef
[  386.033401][T30778]  ? __this_cpu_preempt_check+0x17/0x19
[  386.034138][T30778]  __do_sys_mremap+0xf6/0x11c
[  386.034773][T30778]  ? do_mremap+0x9ef/0x9ef
[  386.035426][T30778]  ? find_held_lock+0x34/0x103
[  386.036128][T30778]  ? __lock_release+0x111/0x393
[  386.036959][T30778]  __x64_sys_mremap+0xd4/0xdf
[  386.037736][T30778]  x64_sys_call+0x13ef/0x1eb0
[  386.038483][T30778]  do_syscall_64+0x144/0x1a4
[  386.039206][T30778]  ? lockdep_hardirqs_on+0xe5/0x110
[  386.039988][T30778]  ? syscall_exit_to_user_mode+0x108/0x10f
[  386.040783][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.041462][T30778]  ? debug_smp_processor_id+0x1b/0x1d
[  386.042213][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.042916][T30778]  ? __this_cpu_preempt_check+0x17/0x19
[  386.043717][T30778]  ? lockdep_hardirqs_on+0xe5/0x110
[  386.044456][T30778]  ? syscall_exit_to_user_mode+0x108/0x10f
[  386.045239][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.045923][T30778]  ? syscall_exit_to_user_mode+0x108/0x10f
[  386.046770][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.047499][T30778]  ? debug_smp_processor_id+0x1b/0x1d
[  386.048299][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.049008][T30778]  ? __this_cpu_preempt_check+0x17/0x19
[  386.049812][T30778]  ? lockdep_hardirqs_on+0xe5/0x110
[  386.050626][T30778]  ? syscall_exit_to_user_mode+0x108/0x10f
[  386.051482][T30778]  ? do_syscall_64+0x151/0x1a4
[  386.052185][T30778]  ? irqentry_exit_to_user_mode+0xfe/0x105
[  386.052983][T30778]  ? irqentry_exit+0x39/0x7f
[  386.053648][T30778]  ? exc_page_fault+0xe6/0xef
[  386.054345][T30778]  entry_SYSCALL_64_after_hwframe+0x4b/0x53


>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250310/202503101328.442cc724-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

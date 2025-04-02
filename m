Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5223BFBC
	for <oe-lkp@lists.linux.dev>; Wed,  2 Apr 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604725; cv=fail; b=RlbG+T4aZ4nH/1w1DOllTS8y0z3LZJZdeUCgGZPH7tzPs5GtdATNNaX5zyB313ul3yVJkO2rjaE00UUpg7wnOb4WG8lik/uXDg9xO1O+G36sGlSjy5eVlZVb9qyha/jApuBJgDfgMGqxX88EIQW8q1qlj3GFtVKwy0slnkvdRl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604725; c=relaxed/simple;
	bh=qxhJ0hUZ8r96E2S2/MX/TKvGJ/08v+Ig8tYHzFHFNWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aG7/n7AI55gdOpFIleu8HNRmie/IiMWQKugakhiCaKE8HNZz18CEJ3gZiVxA9a4KJXZ9YUQybLFpzHFLJItrRbdxXpyUw8Hq1S6zKTi5tVBFl0TUNfnewI1sXTZpnx1YNIbM71oPjd4zR7ihCKfQi2WgEVjVo6C8CcrfHYHU4Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T53ZgM7v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FFePjtg9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T53ZgM7v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FFePjtg9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Eb7lt018907;
	Wed, 2 Apr 2025 14:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=m53xzJ9TcrblQKft1D
	fRNAiQDBcFMYG48woADm2RvpA=; b=T53ZgM7vgYHANmz2OH87FBlToSU3pA/y7F
	W/q/tChZFlrDtfiD8NwLdAfROsylqj4YusWXMmR+NsY8sIxSIX+o4out2gY8oTde
	c3BhpwW9Rp7m3e2jnGcR/qQBbgGjvij+V7SVBK2zuxfRJOGOlwX9tBHfff4iynVm
	PbLhYfuq2EIwm2ILzT6q2CqCQ+jQrIka6KJVzGRvDCEMRJ5Xb41EcL9jnX377UFp
	OMkyQfHFTmRfOOZvs2UL0sCmvVFrdProzDQ5f81ZQ1U/2zZvtf2Npgzcm02aA7pE
	H7M5qO1OIF5BvPeBdHOgtJ+h53d75dIwN1v+sPnVLm8i7X8D09Pg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8fsawxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 14:38:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532EG76T032589;
	Wed, 2 Apr 2025 14:38:34 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aaxk91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 14:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIokXU5QcEh+xboFnVOheCigdKze4zj/J0w0It9m5rSfO/GforhzXekMt/0W1/Nx9WO13d8xpPUY3eBdu0shKzSRfBjWPDPj+UITQJISRTgU9AsGFfYSmz8pbMx76ChsQxuIx811aQzi4EE1SeKKgKgXtMwb5B3r8ffuOyT9vRgUiiEkM2QGxprw864tIANSEAOaLTp6phPEqdbvHC03Wh8M2rF50JoE5vHLOd+ZFRYdfggkgdNByaz9H0YlfMsWh1Jy6sg5vLTLviqg1BZsLTQ6Ra15N5um1uI/DFOS0hk+7s/eg+4p76fN3czQgNrx5Nl8UCBvxZoDaVtzE7Z26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m53xzJ9TcrblQKft1DfRNAiQDBcFMYG48woADm2RvpA=;
 b=CYCNTPkFktbZVq7oO65txFW+vwr7EvrPELZrlBxBXxNfXsNCKKJrHdyXj625NP2DiFi6bSTFj+xpfrnRVxWhUMrz8RTYJgWjLv7Q8+I0gK0q0hcoYapCLAkbqoyvXjFRNxlU54x5xwTq/yBPGVI0L7pp3ytDdDaQn9w6YsJsIq9pGA87a7SfWVZJPPEa+NpBEITeroLOGYRYPYwXekWH83TVPytMlmUHDhj8LDyZekJkEzOts9d34281yHW6dk16NjGfZr2lBc7d/D2uI9ergxEfM2FsoMbnsLL+9hsOBM4IyXRERcl5CrLd3L1QWC6BrOjKNngsuUOmLIdg5nHbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m53xzJ9TcrblQKft1DfRNAiQDBcFMYG48woADm2RvpA=;
 b=FFePjtg9b8CF1Lpr7efVnHYk8yyLfuXJEbzxsd94myJv9K+oHXWbr6D4Q8CUjo4LsOXdLirMeZl9Ghc8GTxRUiRCXHIDT8qZyxUam8hvVyM94Py4bxgNtUiRdEKb1RZp9u/jvjujA/+lUOZgQ+yYurR1iCGsmk/1Dvq2p+ETNDQ=
Received: from DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) by
 SA1PR10MB5821.namprd10.prod.outlook.com (2603:10b6:806:232::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Wed, 2 Apr
 2025 14:38:02 +0000
Received: from DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935]) by DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935%6]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 14:38:02 +0000
Date: Wed, 2 Apr 2025 23:37:56 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, linux-mm@kvack.org
Subject: Re: [vbabka:slub-percpu-sheaves-v3] [slab] c19bb08297:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <Z-1LxMa6smvPq0FV@harry>
References: <202503241413.afff5aa1-lkp@intel.com>
 <Z-1IU2OXez-I5H0t@harry>
 <e378b43f-487e-46c2-a33f-e8e1f12bfb07@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e378b43f-487e-46c2-a33f-e8e1f12bfb07@suse.cz>
X-ClientProxiedBy: SL2P216CA0145.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::13) To DS0PR10MB7341.namprd10.prod.outlook.com
 (2603:10b6:8:f8::22)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7341:EE_|SA1PR10MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aebcd55-9ea7-4b83-41d2-08dd71f3f891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K67Ukv40cI8ml+dq/pIO+o+G9EhBNPI287sxDPAHw9BEUoxiq3IQGTgloFU0?=
 =?us-ascii?Q?nM44uLUO+l6cng2HKBybkopoNSgKy7iTW4V4Ecp8SAxCB6zaBQJ/f6Hgx2ub?=
 =?us-ascii?Q?mSynj+EiHjgv9zIjmEzdxCjiHK0xS1bJrFG7FzzwjKz/bCYRsAPJfkN4k6Iv?=
 =?us-ascii?Q?OwZ+pTY1lshVLRu9ZWVCblGLrm8dFqLB8lF4ftNTHtr6Mm7zPVaHNBJCa4kK?=
 =?us-ascii?Q?nYsqhf2nokpDJadOsFOhNAYmXCTpL9aydH42b+3X7mo5FuRzdiftLFxkIw8F?=
 =?us-ascii?Q?9dlXl5oA3bEod0jFDVJewWMrWdyjMNekpKQifwckKnBCLo2LxXwr8liDmdgC?=
 =?us-ascii?Q?f7coIBsiqsYThkAHehLP02+mSVdtOspQl7gz6jP/8coKxcRgcC7Qlj46F4ay?=
 =?us-ascii?Q?gVDciWYeE+OkGz4UwsFK+tyF+pOkZTNsmoJ1VVRTiuClQCQyEtgvEG2Pn96Q?=
 =?us-ascii?Q?ksvJyPylqoCbjZgicnoesvbE47s4bvkaINqUxFeGAseJ59w+ZZH8Mza3ZG/f?=
 =?us-ascii?Q?i0ALS/dV98mfd3sQJrApHOC5JF6/kCQuRRX58fxNUSN2nxm6+72utPNTugR2?=
 =?us-ascii?Q?5EDvWZM2Ug2ASV4KhLm9tlMpypsLVU+q/CUMG7a6R/L36B1b69lY+nieK3Xi?=
 =?us-ascii?Q?hhV9KI3Wssa0Cx+smkjMLvhIKsHkyNip1zBOlu93hHGbZeMArkcFmfdyIXG1?=
 =?us-ascii?Q?mJ/YIAdxlNOecSRjjTVp/pOfhned6zGlbQkVvn7Y597oSleg1jAQngYi9f6a?=
 =?us-ascii?Q?GsM83IxBe9tOxLBFkRZIrQZLPQyEJF0wL4u1G43aGWj1LahroQoHIja8NFkl?=
 =?us-ascii?Q?WOWrf1PS7jUDia4b5sJz2E4eDCsh50Eup7rNy6pdlgKCRJx9KapHsGCMMpWS?=
 =?us-ascii?Q?eJy1noI223kxxUBbCnT4wArVTC7N+7fCGI9rJY9xlIhdm2B78N+EMkNqL80N?=
 =?us-ascii?Q?i9VM6ozxf4XLq/cKXBFr/UrsYu5GXgTyVelF7zHqtW0OFpY9IpSWqfPoFCxM?=
 =?us-ascii?Q?mCgEQiImRRWugWxWA/CrCN2QogXRm7wrHO3TXcY4fMgwqukJhWsMJTX+6zle?=
 =?us-ascii?Q?EPMALQmF4KmYCnM1SmPIyOOzNXBIOeOXDRv6leNkN2t48qPJcdBd9zP+Jg+b?=
 =?us-ascii?Q?ev9kVpmoHXfyIxxB8FTi61CL4F795OwEv30tblfYsaPRSvqxJBWxnWkq8KvI?=
 =?us-ascii?Q?kTaFMvjqdO7bpFnvBu4ipiDLdkmpzu7fYugpiCQ6qDRabkibS8VoINvxdzda?=
 =?us-ascii?Q?m2ZcELgoCCWNiwIeQs3tAJhM221UnegpGrMvXarUe7nP6Ns3JIawEAd7m5+w?=
 =?us-ascii?Q?+jin3j1FHZb84ab5zK4ss6nGwne4fdwyE75/dBy12Zk/4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7341.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ch1t1Ysy4gkodDu6z1jLhyYloWBSI+WurdnNVCvfNxoZgm/42MybNWt9zL8r?=
 =?us-ascii?Q?RfM+PUumfj1xzFrHI/OGGehTi9kjVYt0NpoNt8i1f7gvRCqDkqzGmfbmQxm+?=
 =?us-ascii?Q?xWFxE80qxj5EnthrTFG6BpRfTgyAsgopKG8oouwC2jpprxHQ/62Y5yc9aFRU?=
 =?us-ascii?Q?hJuI0Qalpl9k4ijdh32WhofbnM8K34W+sSZszHzQR/vWZ+rIeuuNFWWqWiOA?=
 =?us-ascii?Q?bsvOAd+ZWDWXdIj7XIjoYkonFKaae9jPA5gIe/4U/ugDRi6YESq4L1dPbVZh?=
 =?us-ascii?Q?5iYFVNCFO09g77Zxy/RTQ10/DzY4+42NUX07cMFv8JvfatrOTgAG5ts3dmV4?=
 =?us-ascii?Q?79APIsb734TECCOJsCV4boiZj2n9sCR/AEhcE28ErEG9om6NeTGzhwQwkSh8?=
 =?us-ascii?Q?wPgtJjEEYQ9qp/O71FPxfS+9GNu6RUqocuGgZvUxoJjhYqv4HrvB6mLLp8vP?=
 =?us-ascii?Q?8g/0rZwixn8OXZRK0nOBo1JOHfZOxvUvxPsgLkBpA0En9Frd1H0vwLHsV1cW?=
 =?us-ascii?Q?ZH6HsEynohu8laI0FlwBKZFgyP/XVN2F5K7vAVfU60+SW7kt0BEAPII84Ec/?=
 =?us-ascii?Q?05zGWS4jXAVVmp5H9HNmucaSDnYWk0ewc4RCSFj9l5Xn13lPs5cV4BMk0Mzz?=
 =?us-ascii?Q?kQlBYe1pjmaU1wLbgR3UHQWvJ5B21bF2/wDXW8Ya8yxbEjNwzeSAgl3MRJ/D?=
 =?us-ascii?Q?Bps9qQSNPoTPd5ITjZ5RWQJ+xR+llQEVS6lBHoatpBjQinRD8sfj8AbgGkvY?=
 =?us-ascii?Q?T9N2IS5E2QZL5OjgnHKD23EJPeI1EJ44S2yMezbmNi8EccNQkUxJg8fwC4H6?=
 =?us-ascii?Q?jlZOdDuBKPu+B1Ssb5uvvarAlVr1kzjrxIFY08Jlp3h81gaKEFAvkITADvB1?=
 =?us-ascii?Q?Hbpj2MnhsALN/3E3BlPg/kG9qdBPmA5cZGqtLFVPRAwVT2oPHDb/BVLxdTHA?=
 =?us-ascii?Q?2KfuhKYr01KFZuQu72OVWRh35y0u8Y+qwojYZZnxNOa5qQEodqkK+6lrQ2uH?=
 =?us-ascii?Q?QIeULP1G7JkPtrBBD4QNYi0BAAjwGcn272DbMAxcpvGD2GNZ9EY18ddmi5VH?=
 =?us-ascii?Q?DBFN8pn3EQlM8YHiRrWIzsOxXVlDHWab5ghOiUSwblRoNW8hyKDtF5tNvYku?=
 =?us-ascii?Q?RUFbS7IkiidDpXIJpisgg4mLRvGbqauM3ZswvJSVdD8C5YKahR6eeu3lf0Eg?=
 =?us-ascii?Q?gJOahbhq7NZXdk9W/42lsaGyuwyvKo51ehXDL8lTAcYJHRUxr3/nc9Nxrj7Z?=
 =?us-ascii?Q?Vxy6t4EbMPoHVKy+/zS8u1BjiJ+lyec5XD3U5fEM5eQsZ/Lq1iP8b8uwS+XC?=
 =?us-ascii?Q?VyLcDfKhkS8LxfX+wLoNKW1iCGJf4itsbNJMCW3uDu4WHcitK8MACdlbrPjw?=
 =?us-ascii?Q?W915WXh5P+nSJnagCW0Vch+sJIiqRMXNr3WiMEBwOKstg/xfu5PstObMbcD9?=
 =?us-ascii?Q?1Qn3Z6rfaTMDvVMXIsRiJqPSrdHvTDe7nrcpSznYj3CCvuOh0rFKR/ZxsHij?=
 =?us-ascii?Q?OlMCBFXk1//wwClJzZEKyp1ktVmDYqNl8JO3OGpdvo2N8j82hslaVsqWH995?=
 =?us-ascii?Q?q1mPABBXKm3ULhiRpaOJI6aXeg+goHbx/4a1Qfpd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bh9NrIKAYOxyaHTsZkXg03F4hqMEJR0vLL2szkOxJVBq+kY2SuKbMolxoOPhYr2kk5QjXfI3sHS9WsFtlotO1XZPp0AP6RKPMohMlyOMnfmO19sg0Y49F4XaDBLCchhF7YI/2/VL7NBOf9jfB4yTf0jD/WLIFlWnBooPemso6lrgs8F/+jT5U87S/UQELdKrCqCJbd/tNeidbxtzaj9187JVy/kxqa53AcNqHYtyLblwShoEEClo2DlOuLnuLrrQCEEzk8HsLY6t6O10G7H+DvEKR/b90MxaqtSfko2DE23mlZOXeMmlaj2B/z/cDkU6nRS32Ihslao8Cm0o2H1td00MTLhRQuMUSMuCN9XX9SgV+5Onw6hg2kIFXlJFq6O316VxG/CdMvgTGzE1i5MrO3fCdrMPHwd4w5zd58dftkGaukeV/z2MeWG9MmLEj+ekn5M3GgIIe11u3yMi+7d2BW7tToAy+cgQDuhvvGFuejgUfIZWQhtPJncG5T7J9niJ45gKlpK2AJGUfvWD7UtDTI1tOY7raPW4nOBMrGcSRq59lnZmSBzqX1X++ttbUHvDF1yJSiPoU905EQe1pwYH/nJrThoOahTdxSNCnMhd+jM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aebcd55-9ea7-4b83-41d2-08dd71f3f891
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7341.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:38:01.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BDtMb1uBHpS/rh2uhvcUUH8E+XpvwRwnYF94mjqU1BVVA0OWk38CAQgKteGIrq24H7jji0V0tEyZwOqPn+T4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5821
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020093
X-Proofpoint-ORIG-GUID: 9O6az8t3Xg1BnlL9P59dCYQvkpvtzAYL
X-Proofpoint-GUID: 9O6az8t3Xg1BnlL9P59dCYQvkpvtzAYL

On Wed, Apr 02, 2025 at 04:33:05PM +0200, Vlastimil Babka wrote:
> On 4/2/25 16:23, Harry Yoo wrote:
> > On Mon, Mar 24, 2025 at 02:18:53PM +0800, kernel test robot wrote:
> >> 
> >> 
> >> Hello,
> >> 
> >> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> >> 
> >> commit: c19bb0829736a5c7abe1d1b70d013489d720bb54 ("slab: add opt-in caching layer of percpu sheaves")
> >> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3
> > 
> > If HEAD is commit c19bb0829, no user enables sheaves.
> > That means it's trying to flush sheaves when no users enabled sheaves yet.
> > 
> > #syz test: https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3
> 
> Uh this is lkp not syzbot so likely won't do anything.

Nah, you're right :) it just slipped my mind.

> > diff --git a/mm/slub.c b/mm/slub.c
> > index 2c7b2a85c628..dfd301ce4c76 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -3853,7 +3853,8 @@ static int slub_cpu_dead(unsigned int cpu)
> >  	mutex_lock(&slab_mutex);
> >  	list_for_each_entry(s, &slab_caches, list) {
> >  		__flush_cpu_slab(s, cpu);
> > -		__pcs_flush_all_cpu(s, cpu);
> > +		if (s->cpu_sheaves)
> > +			__pcs_flush_all_cpu(s, cpu);
> >  	}
> >  	mutex_unlock(&slab_mutex);
> >  	return 0;
> 
> Thanks Harry! Will apply it and push a new branch probably called
> slub-percpu-sheaves-v4r0 for now.

Thanks!

> >> 
> >> in testcase: rcutorture
> >> version: 
> >> with following parameters:
> >> 
> >> 	runtime: 300s
> >> 	test: cpuhotplug
> >> 	torture_type: srcud
> >> 
> >> 
> >> 
> >> config: i386-randconfig-005-20250321
> >> compiler: gcc-12
> >> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> >> 
> >> (please refer to attached dmesg/kmsg for entire log/backtrace)
> >> 
> >> 
> >> +---------------------------------------------+------------+------------+
> >> |                                             | d52c71b1f1 | c19bb08297 |
> >> +---------------------------------------------+------------+------------+
> >> | boot_successes                              | 6          | 0          |
> >> | boot_failures                               | 0          | 6          |
> >> | BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
> >> | Oops                                        | 0          | 6          |
> >> | EIP:slub_cpu_dead                           | 0          | 6          |
> >> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
> >> +---------------------------------------------+------------+------------+
> >> 
> >> 
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <oliver.sang@intel.com>
> >> | Closes: https://lore.kernel.org/oe-lkp/202503241413.afff5aa1-lkp@intel.com
> >> 
> >> 
> >> [  100.813833][    T6] BUG: kernel NULL pointer dereference, address: 00000008
> >> [  100.814405][    T6] #PF: supervisor read access in kernel mode
> >> [  100.814830][    T6] #PF: error_code(0x0000) - not-present page
> >> [  100.815260][    T6] *pde = 00000000
> >> [  100.815526][    T6] Oops: Oops: 0000 [#1] SMP
> >> [  100.815856][    T6] CPU: 0 UID: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.14.0-rc1-00007-gc19bb0829736 #1
> >> [  100.816542][    T6] Workqueue: events work_for_cpu_fn
> >> [ 100.816933][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> >> [ 100.817301][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
> >> All code
> >> ========
> >>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
> >>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
> >>    b:	74 72                	je     0x7f
> >>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
> >>   10:	8d 76 00             	lea    0x0(%rsi),%esi
> >>   13:	8b 1e                	mov    (%rsi),%ebx
> >>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
> >>   19:	77 7a                	ja     0x95
> >>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
> >>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
> >>   25:	01 cb                	add    %ecx,%ebx
> >>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
> >>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
> >>   2d:	85 d2                	test   %edx,%edx
> >>   2f:	74 11                	je     0x42
> >>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
> >>   34:	89 f0                	mov    %esi,%eax
> >>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
> >>   3b:	c7                   	.byte 0xc7
> >>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
> >> 	...
> >> 
> >> Code starting with the faulting instruction
> >> ===========================================
> >>    0:	8b 57 08             	mov    0x8(%rdi),%edx
> >>    3:	85 d2                	test   %edx,%edx
> >>    5:	74 11                	je     0x18
> >>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
> >>    a:	89 f0                	mov    %esi,%eax
> >>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
> >>   11:	c7                   	.byte 0xc7
> >>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
> >> 	...
> >> [  100.819393][    T6] EAX: 00000001 EBX: a9148000 ECX: a9148000 EDX: 00000000
> >> [  100.819900][    T6] ESI: 40392e80 EDI: 00000000 EBP: 401cfe78 ESP: 401cfe68
> >> [  100.820414][    T6] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> >> [  100.820969][    T6] CR0: 80050033 CR2: 00000008 CR3: 7c8e9000 CR4: 00040690
> >> [  100.821493][    T6] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> >> [  100.822008][    T6] DR6: fffe0ff0 DR7: 00000400
> >> [  100.822356][    T6] Call Trace:
> >> [ 100.822609][ T6] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
> >> [ 100.822935][ T6] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
> >> [ 100.823237][ T6] ? page_fault_oops (arch/x86/mm/fault.c:709) 
> >> [ 100.823596][ T6] ? kernelmode_fixup_or_oops+0x58/0x70 
> >> [ 100.824081][ T6] ? __bad_area_nosemaphore+0x10f/0x1f0 
> >> [ 100.824560][ T6] ? hrtimer_interrupt (kernel/time/hrtimer.c:1877) 
> >> [ 100.824934][ T6] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
> >> [ 100.825309][ T6] ? do_user_addr_fault (arch/x86/mm/fault.c:1451) 
> >> [ 100.825686][ T6] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
> >> [ 100.826123][ T6] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
> >> [ 100.826474][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> >> [ 100.826923][ T6] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
> >> [ 100.827294][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> >> [ 100.827737][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> >> [ 100.828071][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> >> [ 100.828520][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> >> [ 100.828861][ T6] ? cpuhp_invoke_callback (kernel/cpu.c:194) 
> >> [ 100.829258][ T6] ? __wait_for_common (kernel/sched/completion.c:122) 
> >> [ 100.829631][ T6] ? hrtimer_nanosleep_restart (kernel/time/sleep_timeout.c:62) 
> >> [ 100.830069][ T6] ? kfree (mm/slub.c:3777) 
> >> [ 100.830367][ T6] ? __cpuhp_invoke_callback_range (kernel/cpu.c:967) 
> >> [ 100.830805][ T6] ? _cpu_down+0xf9/0x390 
> >> [ 100.831205][ T6] ? __cpu_down_maps_locked (kernel/cpu.c:1475) 
> >> [ 100.831611][ T6] ? work_for_cpu_fn (kernel/workqueue.c:6731) 
> >> [ 100.831966][ T6] ? process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3241) 
> >> [ 100.832338][ T6] ? worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398) 
> >> [ 100.832694][ T6] ? kthread (kernel/kthread.c:464) 
> >> [ 100.833001][ T6] ? rescuer_thread (kernel/workqueue.c:3344) 
> >> [ 100.833356][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
> >> [ 100.833733][ T6] ? ret_from_fork (arch/x86/kernel/process.c:154) 
> >> [ 100.838377][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
> >> [ 100.838752][ T6] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
> >> [ 100.839109][ T6] ? entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
> >> [  100.839472][    T6] Modules linked in: rcutorture torture
> >> [  100.839877][    T6] CR2: 0000000000000008
> >> [  100.840173][    T6] ---[ end trace 0000000000000000 ]---
> >> [ 100.840547][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> >> [ 100.840886][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
> >> All code
> >> ========
> >>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
> >>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
> >>    b:	74 72                	je     0x7f
> >>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
> >>   10:	8d 76 00             	lea    0x0(%rsi),%esi
> >>   13:	8b 1e                	mov    (%rsi),%ebx
> >>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
> >>   19:	77 7a                	ja     0x95
> >>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
> >>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
> >>   25:	01 cb                	add    %ecx,%ebx
> >>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
> >>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
> >>   2d:	85 d2                	test   %edx,%edx
> >>   2f:	74 11                	je     0x42
> >>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
> >>   34:	89 f0                	mov    %esi,%eax
> >>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
> >>   3b:	c7                   	.byte 0xc7
> >>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
> >> 	...
> >> 
> >> Code starting with the faulting instruction
> >> ===========================================
> >>    0:	8b 57 08             	mov    0x8(%rdi),%edx
> >>    3:	85 d2                	test   %edx,%edx
> >>    5:	74 11                	je     0x18
> >>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
> >>    a:	89 f0                	mov    %esi,%eax
> >>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
> >>   11:	c7                   	.byte 0xc7
> >>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
> >> 
> >> 
> >> The kernel config and materials to reproduce are available at:
> >> https://download.01.org/0day-ci/archive/20250324/202503241413.afff5aa1-lkp@intel.com
> >> 
> >> 
> >> 
> >> -- 
> >> 0-DAY CI Kernel Test Service
> >> https://github.com/intel/lkp-tests/wiki
> >> 
> > 
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)

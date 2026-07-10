Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0717D6
	for <oe-lkp@lists.linux.dev>; Fri, 10 Jul 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668099; cv=fail; b=E/wuU+njdWZ/IVIAfGoFWj42tas1pYU5jGT5cmJnY35KeeaF+rJfnmtVFXojJQG5wnd935kM7y01onLjRqNMRwJYfSf4qzeeesO/WEa+6GVWBdzJQVmqWP94Mk15PiNZ3Z4zkndhNBfXW3QgOchGQaRmUMqq756IwnYqx2rARsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668099; c=relaxed/simple;
	bh=25xX0HsOIu76MVNpvrQBfeVSNfJBMCD9X6e3Gza6uP4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HeIM+u/WYxS+TKRgd+Pz3oU/hJFxvW6SEm6F1pz26UhXkitqti+/uoY1pn/cqsRwQKt4GZ2a2upmfEp7x5aKbzFTPDPiEw6t26XliB6BDP1xg1uTkwWoYmXqc74AGtZAKw9xybwVteYBDd1aeEG9PVpAp4sWOIZ/hCXjIbxUT1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duDvQf5e; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duDvQf5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783668097; x=1815204097;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=25xX0HsOIu76MVNpvrQBfeVSNfJBMCD9X6e3Gza6uP4=;
  b=duDvQf5egX1gJKPpTvB7E0qUzdfir2E2qWMuU55TPf5CZPlOWZ/R2ef9
   mNHSP3bEbeRdo0Xz7Ozy4EhuOfldWkjOgm0hirjCN7HRTjFK+WAK9zQwS
   5KX87lYj1QDbwm02JjS5rN71PdAV0J0YJcvIKbBiR1c5pQ5RUpmOJVPON
   bRSldzDHIalD1VYf0bH66NSDoQs+C8AxBYoH7/Ar9S+af0C4M9iHAOuWs
   ShL5kbiL46nNRDzsWpD5qSq9edkS8NwwDrH5fdWrk2OQk3krmH8Ubcip1
   l2Q3VtLF6bPTSUwf2ZA4Ffs8IBgruzYYTgg/TxIKlYX24OvyPMiFfdw6g
   A==;
X-CSE-ConnectionGUID: zzk9Vm9yTNeybAGq8kmAlg==
X-CSE-MsgGUID: PliJzuyURtWiTtsKxxETpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94969565"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94969565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 00:21:36 -0700
X-CSE-ConnectionGUID: C5JRznD9RM6xhhrdNMVWVA==
X-CSE-MsgGUID: 28/TgM/1QLKRgyFmibqPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253076319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 00:21:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 00:21:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 00:21:35 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 00:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VT39Tu4KmU9GqtBnj8N4b4IEs3xBr6GyRKvL6nwHs4cATH8K+ZqJx26YCh0uEWX0f1VpIIXeqoOqJKwfGJ8P+tFe7XYMOtydISnBRyUbczNCfW8zQKXP5A4sRYZmzWUxTo0ufacxmpAK47CceMk8Hb+3mfOCO0H1CSWnlTIfloW2XHOt3MtzmoLIoqnjrcqg5LrR582+0A++quBASTVmEGwjTAWTlCC1PGfDk8LDqkqgz718ZyK+6kIZ80s6Bx/VSPq4dLFBULW7J6nImpJR07T0OQTo1Ydt7AMqk5GEe7SLCl5oS4/1l5xWqAym+hbcwOP3W7jk+QB+Qat28zG82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMZA7Ws3rlw1G0ZXwy9XoS5RDd2g8Xl6+8EcJ4VHVYs=;
 b=WgRxSdWv7leHEJDAmhPX2XqobspCxJKJzPmi8cZBuhQJHFbrpZI3gjKosnWoGYJzVI6RpVkBgoPh17OFqqn8x8O4Vm2ThHDkai5kMo2DCzEC5KQ0EhdSlK3hvf0TdIMqlQ1JXwi/UMVlPzxEw1I1WHSeJ8ft/8pjEJCytLbshl208s/zhY2qssHeQy0OMaSYIsQHYX0Db5ETDUeNQcjscAwUAmF+Or88HmqvQA3vPOp+LOu7gRsRXTkFgb2Or5q1KG9f+JU62zdt/Bvl+hLFWU0VMi+YrKGIdvn8oyfZLzikRWoM1T9BK0OqDAUg+jWrolad6JmA6BV2NlOUGTsDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM3PPF31D2DA56C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 07:21:33 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 07:21:32 +0000
Date: Fri, 10 Jul 2026 15:21:25 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Harry Yoo <harry@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Danielle Constantino
	<dconstantino@meta.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r1] [mm/slab] 6bc21472e7:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>
References: <202607091002.cdfe5a08-lkp@intel.com>
 <afe80d38-950e-44d4-a729-61aa65d3c117@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afe80d38-950e-44d4-a729-61aa65d3c117@kernel.org>
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM3PPF31D2DA56C:EE_
X-MS-Office365-Filtering-Correlation-Id: 913691ac-0bc7-42d6-b4cb-08dede53de4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: tgfbbXWffl5Dbfty/8vlFbAWLZneUPOYSBMGo0+XH9/2q3NvGhVib8pJODAzh8DatEqsL/zKuyXnGAKXsz6qmDkFJkZc31KJxPZSG4UFuqf7/Iosuw8Vc5aJxcCh+JKTCT7+x2WBndU//sC+bSoDKc8PgEh0YKA2EcRzXWYQx2iEZP5YHdMpM4y9GCHL9Ybfbe00n5URDkouhOORocR8RfmH59HoLrlx3f/e5nyFzWwqiunPEujlOs/Yn75MGHhaOuafZiNInUF3VK6y0wkoTwVJlG1XD2NHmlWbrPVAjgK7ZRhl26wg0vAMkNpcobH9NVunSN1nsTkGVqMKtprLRLA4cg6Rmga5icb2TZs5v+d6e53cSLp3kJsh3pjLEMJr2ZBJtF35Uz9DvJO+15xJv5bt0YwP8hblTz2EpTv3WEvYqPO2PHiykPHY7RY7lnPiVkZik3uRTe8bPerufFCw4vy8HXf25rrZ4vW1BneGdzWYPwsjkSTJ6kP6rHOYhE2JzGrsFP4QUegBaTf35l8kPnuqs0mYpFU/5Xyw2RkM4hhb1d8niUlifFwtcOT3sNy3EDx7CejsOVOC1sr/1bGhQtOcNhOmoqGbpcOfkXzrNy1aASK82cDmzZQsuc7A+0Tk8lpHbB9SVKVx+Exba9dnn0m/8PBEics402dCTlsbjW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtKCggzn+WOe7UzlTeROOAtI5N/0pMM0PCU43+IZezIA2v7SD7QXPfLHDil/?=
 =?us-ascii?Q?lrvsM+qRr79P+xeSMj2Q1cP2/aShXxuPGYhNKMdfevV/X6GLaMpcAeFTKOI/?=
 =?us-ascii?Q?HHYUpKwaYYZl06mRlAvsbcto+37Zuere31KKw8sdGMA94zZiy2CenrKTnodv?=
 =?us-ascii?Q?j53pHIsZqSO9RkNFUma44B+lteQA7DciRMm6YQwyg7D/jvNI3ioSPbsUeQsh?=
 =?us-ascii?Q?KeUzE4FRKH1aub5IKEOQiClt/pRvriI8z8G8RU4ESyayFePdwK2B3JvE4VC4?=
 =?us-ascii?Q?eNHX3CNBwE71mSAwM3dB7LF5IazaPVvf+qGqL0KY0AtW7iFsrNBdFPXzWTAY?=
 =?us-ascii?Q?49QXyzocs1HEtpKfeJS5pa7BtVok7qUz+vbhAmvxhvmrZ1sraVMkI0c9pGv8?=
 =?us-ascii?Q?61HNNpuwmQ9nTgf6p9YTqFJSFfI8ACWTbNYII/upUx7m3t0TqhsZ5iVLZrys?=
 =?us-ascii?Q?uJkZK9ebYlDT4h9jWGL/QWc8BE2qD+awlkrbCKiQHW1O4o6S55gIHPuvyaL/?=
 =?us-ascii?Q?PKpo8kWRJverqmi6LsqxTL4g8SvpQQV41UeyIPQAz486gk6DIwgnUtbj56ML?=
 =?us-ascii?Q?qAhQsHxZqkkQqxEvDbKBF2L9eU12mrUrz5wkXNjU+WXnC8/9r4Q15x3hz7u8?=
 =?us-ascii?Q?FASXonsicWHVhh25lUY/FIHwvrwNo9AJjBEHnEhBv/g+xP/nzLc0JMzoqPRm?=
 =?us-ascii?Q?TPEjzTkcRKbYd2FCQIpYbJYlzff3NVqRVFKVcnCdI7BGYJwN84kzTdEUCvvx?=
 =?us-ascii?Q?t8FnfK7Eat+27VJw/FtcBWZGuQqxGNQk8fMsq3OWVn0PS7iMEigBbL/Rn3H/?=
 =?us-ascii?Q?8q2khkEUm955r8vplZGHb/bvH413USVjaGLNiuRwLDTfsk1Z9MJ2KxRtCFX6?=
 =?us-ascii?Q?hzTIC0xQ2Fp9hUXr04j2Dbl9gTEc1dcoec3yWOBTyaQTxpoRNaEbVLLxFOLn?=
 =?us-ascii?Q?nAbmAiYf9SqYGBMq4Y3NPpwQH/4Cn7bVD9y9pHnBRILcxgD27ZxDwfPsmsuQ?=
 =?us-ascii?Q?KeTih7fY5Tuo8/2PIlmTlEXgBHp2nJr5vUjgUrroc2Qb01npVAt4tXzWTAc5?=
 =?us-ascii?Q?gWfkQbH3rIJ/2pgdKq0cGYctoBm66FcHpOC3Z/w8zw+FBBj5uAnahnIlN0lZ?=
 =?us-ascii?Q?zI3XPsfyl09Y2HbU4caOgk6SYYuvj4K52Edi260cmAnenaeToDIUqZM2fcdq?=
 =?us-ascii?Q?/4pjapH4uRzJMMgiyGD1vhfDaTdIvY4gAX/KKZx/Oj1syAwseg1zrz2ix+od?=
 =?us-ascii?Q?mzmW26S+Z155RSYvAKVE8xveW79kqGAbk9VKGPs6SUYvvQ6z26niEDmTMiXe?=
 =?us-ascii?Q?hL11tJTWrWaYCfyPAQgiVeRU/GVajNe7t0a2yXgcbw4dbUWS6LjnWifZPkhr?=
 =?us-ascii?Q?fxSBkfVGuDdI4MtGaPSOjdbcIF1GOpTxGQYV6Lp8C33Pj/HB4hSvIEwMrnfU?=
 =?us-ascii?Q?o3a2gi+xIvyZhuz29OWdqHpmEhFfahXcEdDHbggfWdl7Fd/7nqH0mzdUVCGe?=
 =?us-ascii?Q?3U02OFq7z1xb92/Oy0wo7zs7sPdtbwHG7/Y43mCezNRnMnGIF8irHOoLVLVN?=
 =?us-ascii?Q?DlfbmiL6bP+kzFVlDPMZ8j4TF/8QmNvGecReG4jKfT0kMMhfcjeEwXcn9KRL?=
 =?us-ascii?Q?rZVc+BpbNAooe6xp0uzSpx9E0g8svRgdMf2NaSAplee/bX1mpprmv84NGOqL?=
 =?us-ascii?Q?uR4w1ItV+j/YfhWgnx6Ty5Zjbxdcicik5liIslXLYa9B9STUUlcSkAKP7UVr?=
 =?us-ascii?Q?jJTEdIHJRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: AJGV8Nc0/KA2bm9NWbT08j0WqBREf7qGJwwocBIB9bljcDBZKSnoz+hUXVgFZnsMuVIEdWDUVg9g0HTReRcNP9wHyoAPXvryHHZ41oIJlG9MT9cl7ZzyHjV8897PIE0NResQkJFwJk8f8ECsskMP/jo5fvsK1gWPgJNf246I0348fpxBtzpgkHSSvLVTO/lqwrJzw5tDsJtNceNFmPLhefeXiE6oZFPJR0uSMbrE462gCN6q+QdQcFvGPitmVf8JoHSnJk90PpKcTJodfvx67j14l7GYsELsuTbjiis0R/+zIl/eea9SOFhNAzQd/pRoX3w7pxzR9YXcfs81YAVAOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 913691ac-0bc7-42d6-b4cb-08dede53de4f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:21:32.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fph17Auegv/P1A6YQXMCUkhryPr5nbi0zSI9gQYuYDjNx/SCrq5Z3W3vg0CeSF875/JUfP9MSiS7TR3HiDnGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31D2DA56C
X-OriginatorOrg: intel.com

hi, Harry Yoo,

On Thu, Jul 09, 2026 at 06:26:54PM +0900, Harry Yoo wrote:
> 
> 
> On 7/9/26 5:48 PM, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > 
> > commit: 6bc21472e7eb9f8c771ffdf86266aa6d9dcb1dac ("mm/slab: prevent unbounded recursion due to obj_exts in free path")
> > https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r1
> 
> This is v1r1, and I posted v1r3, because it was bootstrapping sheaves
> for normal kmalloc only. This crashed the kernel but was fixed in v1r2.
> 
> Apologies for the confusion, I discovered bugs after exposing it in my
> tree (force pushing isn't great, you know...) I should probably have
> deleted that broken one, though. :)
> 
> Will be posting v2 that fixes false warnings w/ memalloc profiling
> debug shortly.

thanks a lot for information! sorry that our bot still cannot analyze branch
version so far. we will check the latest branch in your repo before reporting
in the future.



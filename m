Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448161DA2E
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690382931; x=1721918931;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ORJzXI56k3hzd2It3jfrrNjYGMyyes9m3eY3R/Jzp3k=;
  b=OU10VUA+ekbwQs2i9CUL7it8QRK7jnbJ40/4Pcq5mfkzCamJ/whCJvVZ
   m8JAY6S4WG73uG8TQpbm9gbbf5VuTfU1mY17taoUdr0PI3iCDmymkCdJH
   TZMfo2Z8HVwueUuoa4D7AVBowsRTEPw5RrMaQANSk88bzuw4WU7nGsLsF
   TrUhIjmiwySQ/pguvxa5iAZCvPWyTJlQx17kJW7NgAVFXnWgAZ7ncB53f
   CKthbgpXAv5bntkydUNgGuhU6YlwHUyMUxmww4/zxBZC2Ei/U8ic2bNkC
   z+o/lKTGZFkQn6FauT4tOyhjHxwxYrScAzRgzDN9X0SItXZYIKw4vSqa6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347646897"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347646897"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761681888"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="761681888"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 07:48:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:48:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:48:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IryAI6R8pJfnFqgfgRW9iNZ9H1nE9x1z/l7WOxt9u1IH5WXQl0P464swZ47XWNSkcfFnMqG2JlA4uQg8Ju8skwkYf5rlupiCfl0kStAbQY6LZ1JElcUxJXpo4zTJUNytLP+VYzbMCD4+Ri/B0Gpjbr2Im4k3LKIUae3GwAAxidpKM2u7BRi0ZO/ZakF7lifG9slh3lQARK14vJcSNZc8obPioYYTLKppVbxxFzitF5bgssBaiLugrGkTN1wZgE3TWCGfYCRpVbVHNrUfC/NBMf7Nm8h/NHSm0d7vIgwMo5dvnZ98hHBMOyU/qaLDOCCq79Yl5Unq0uaInT2pmZqi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnKyf/NNtsO80/xfo1MUsNtZpJlmdGTqxkmOgYeCDBM=;
 b=RviV6yL7ouz9OIADLBHLf0lB6kH0m0lRuPrD4C7C0w4yjRb0xxSkemfgRERQoVzP9yA5JEw1pkauor1Ig126ROAV/dI+TlRP/JwZQWnwZ4VHILIiYhUe3H4xpe70i1Y8MUQEWbYjjLuwQletXNztmJEwGJHYaEvoEdViDPzy0Nbq7/Z1vOZRz7NngAE618pxxeaKZtnf/tKuaI5WUYxRhOtoQrw07qKcATl2uMFLmW2oMTyyu7sCBi5LdCdeN4dbvCOeJDZK13qmr0ouoqFKkOd+WvVQkrWnbBZgwQ89Ux0rSHIKgkl+gKVFLQHwWNXM2Nm0Ie2gLBZSIszIJpj5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 14:48:43 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:48:42 +0000
From: "Sang, Oliver" <oliver.sang@intel.com>
To: "Gao, Chao" <chao.gao@intel.com>
CC: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "Huang, Ying"
	<ying.huang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>
Subject: RE: [intel-tdx:guest-hardening-rebased] [swiotlb]  36e8ff9c97:
 kernel-selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
 improvement
Thread-Topic: [intel-tdx:guest-hardening-rebased] [swiotlb]  36e8ff9c97:
 kernel-selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
 improvement
Thread-Index: AQHZv5hfgAYuBY2TLkeEvNuGDpdrLK/Lwf4AgABeFGA=
Date: Wed, 26 Jul 2023 14:48:42 +0000
Message-ID: <PH8PR11MB6779A64F7C9B05A27B3D116CF100A@PH8PR11MB6779.namprd11.prod.outlook.com>
References: <202307261507.e3351d3f-oliver.sang@intel.com>
 <PH8PR11MB678052E2CC8D56B8D4DA83EF8D00A@PH8PR11MB6780.namprd11.prod.outlook.com>
In-Reply-To: <PH8PR11MB678052E2CC8D56B8D4DA83EF8D00A@PH8PR11MB6780.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6779:EE_|PH8PR11MB7022:EE_
x-ms-office365-filtering-correlation-id: 1f6267e9-18c3-4b53-1b26-08db8de76841
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5LKVOrUB7nN+5wsdjs9RCopk/bC8WvxTVLCj32ynf7ZF+g370HRjDfdRJzxPX8vUEogpCbMnNpRl0M+w4FuxN0OERM7pOrCgM3GGMiK8a34VS6UQfbh1+qiZ6MUhCH9LzslpeHVQq0i1a6etvPVoJRkTxvY7/IkHJg2DvYjxjjYZfnJPgwJ8Ii82069FbuIBoee3sj42ZHh39PyyVtjc4he9GkERztm/CtSwSCtkgpzudpgAMoFwR6nfLmBQPPzXBir4pfLKSgDM9nwa4A0E0q7G4EoxdW+N29RwgJLvvo2bCB390DGFrvqtoX+S7HZJnJwEnAfx61oH4wCksEN8DhVasrqmReabL9bZ6U8BxOVRfh3QtGkY0HndQYOz2n2AHyNP9FmUR67VwV82FQo/zUlEK4pxHmY65Ol9c76oWVRG/jZ5NUhStg41VNY3CY7662bYNi0thgAE6AMypGs7q6hDe4v37zlvRcM0VaVLD+kOcedE1ERrW/HuIzhoRt6j7LBr6ajen5YZbJ/o0xfZF8DdNw7BrD38BAk8h4v9aqfWuO8AnWGp8wUxauibXPxrisJYhOtYixmaJZvxRokhNHhCl27LArc5hw5BFOAr63hFFvwKyXazqjp0hjUZ+EPxI5FhseNPyzCqEB/Wn5fQzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(86362001)(38070700005)(122000001)(33656002)(82960400001)(55016003)(478600001)(2906002)(54906003)(38100700002)(186003)(6506007)(26005)(53546011)(71200400001)(107886003)(5660300002)(6862004)(7696005)(9686003)(8676002)(966005)(83380400001)(52536014)(6636002)(4326008)(66556008)(316002)(66476007)(76116006)(41300700001)(8936002)(64756008)(66946007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OFX1rnwRNV0E29jWk4S8oRJwSaU6AqF6gU5SnmieZdTDQ/0pk9kvQEGnfy?=
 =?iso-8859-1?Q?MdGzYP83gdShtcmqR15Fz4Ljj4HH//Vyi1o9E289KeKsZAcXs7npACKjZj?=
 =?iso-8859-1?Q?TEdy3AEh+uPAJ+3FWc7sCnIpBM9/DF7Hz+xVaVAuvWd3NYS8ckXEwx6UVM?=
 =?iso-8859-1?Q?X6GkNAgua35ZChwsh9cZKceJpExhiOh6jRPU0fZ7MLl7J4gGcVWueHcVhx?=
 =?iso-8859-1?Q?bQu5AOpY2jH+C7hpdtoJN6dZx3Wdvgun02kCYyyywAvCSMU6i4EANqIX+u?=
 =?iso-8859-1?Q?7ub9AN2O2Oxf7C6XzoPtept5J0CtGHcGfVDdi2EbeRApeTiXGIwavfokNO?=
 =?iso-8859-1?Q?VoUJYVvazeIFeXD56B3C0AnfeEOBwc3qCeC4iX4MvlV1uAiLFTBXnOK94H?=
 =?iso-8859-1?Q?s1zlMObOU7Cp00MVSolCiETPQONYURucmfOSa7LmSinmSbxGx0reVpltBJ?=
 =?iso-8859-1?Q?V1dl44IdVoybb6KuVAE+6Nuls9gUPg8wBXBGLkDzeDJUUsr5lUA9ZHc0CB?=
 =?iso-8859-1?Q?UzaAvkQAWv0+dQsxBlNKJmdElPKmu5UfGH+uWuzvJagw3Pfc0OtF9MAN5f?=
 =?iso-8859-1?Q?WGbkBcuf5KZMn6b6Bz78xNWZPOKTVZpcwQSuo6BmR1Q1UvkpX37X7Wkw2j?=
 =?iso-8859-1?Q?O9lmOhRZIo5xAwXAZsxyRQhKIHoV9qHaOcAZHdlflFwwOQLOk7Cd5pPm7M?=
 =?iso-8859-1?Q?yQCIxJjW5XESHCTwV+FQP44EBW4WoEvI6JOEKtD+jwDuNyocznrfICSAy7?=
 =?iso-8859-1?Q?n0ufXGMEn9a1DZEn3i2kYlxIOomHmPmR4RQFNTUhTYFch/16sHde8AUc+r?=
 =?iso-8859-1?Q?BThrGqd2hO2sNEVy+WFM+jTfh7cCXn5qYPIa3m+JXe0zjGNNrwR7SzMK3x?=
 =?iso-8859-1?Q?d9xn7AAu9Ktep2FUu/dsTW8l0/LwKilJdyJH9QdXq4W/BwhB9b0UZKqjq8?=
 =?iso-8859-1?Q?QhC8lfSlXBeId3BTOlDbOxpZv/9N//Ii+LrEsvPGrYx9BRtdmHOEKKNSCM?=
 =?iso-8859-1?Q?5g++6/mbMDsWA8Sy0hfIDN6cZ34djQ/au+ueGHQrG4tw3VmMwycT4K61Mi?=
 =?iso-8859-1?Q?2vnFDxSOZbUc6ONS41VHn0ur1HN/CAtWu9N444fKOXxGlNeyCztBSgkAKK?=
 =?iso-8859-1?Q?NXfara9uy4Y3cOwi1/NPQ+aBjaow095z58Y1V0A0PurKGyEq0R7NviEWbQ?=
 =?iso-8859-1?Q?gOeWL+nVP++Kpw5JdCpbsvOzEoWPXsnUMfJQg5dPq1E6DXNziFWKbTWAWR?=
 =?iso-8859-1?Q?N/dCiCyHfmerhlIkt7vqaPc9EsxLkEIR4qJ8zF4yXzZfAYR1qP1iwpNhvN?=
 =?iso-8859-1?Q?Dy6mb/kx2l+3rLmAM9WL+1FhwKYlqYYsqs31BYMk9ixo84PhDuvxUnAwwo?=
 =?iso-8859-1?Q?j4WeEoWuBgP5rn18Fp/gleZDiekGytZbb69dhESXNZOXe6vdcBqlrlLuo/?=
 =?iso-8859-1?Q?OUvTyvUBTPuSl1sS0EB/k8UUB790ZQ43DsCJ3yMfvqL5G/zAYQjoUzDbdB?=
 =?iso-8859-1?Q?JZ6MtIAPp2LeoX7h4BlE/o2ZRllNjxlVERQlHuFlXbGNGkWP2oC0hUwTo+?=
 =?iso-8859-1?Q?XqkJ2qR9iQTKkpy7Y14Du7s4ESb2bYG3rj0AH7V7hWlzDtwZn5tby7538Y?=
 =?iso-8859-1?Q?g6fv/2rdM7JPVt1l5mYjd3XADGkUTEJQNz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6267e9-18c3-4b53-1b26-08db8de76841
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 14:48:42.8579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmMP6cGHf8b80pKhY0mZRKdzzZ+5ZsFUBkxk56FcKDFYYfWINqPYX9HuP8SkWoY1Ve0EYzbA65PWjAmh2GjQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-OriginatorOrg: intel.com

hi, Gao, Chao,

this is latency indicator, -33.3% because the absolute value is dropped.
but since it's better if smaller for latency, so this is an improvement.

BTW, we reviewed this commit before reporting, Ying judged the improvement
is related with your change.

if you need more technical wise support, maybe Ying could help here.

Thanks!

> -----Original Message-----
> From: Gao, Chao <chao.gao@intel.com>
> Sent: Wednesday, July 26, 2023 5:07 PM
>=20
> Hi Oliver,
>=20
> How should I interpret the -33.3% improvement, i.e., is it an improvement=
 or
> regression? What's your expectation on me?
>=20
> > -----Original Message-----
> > From: Sang, Oliver <oliver.sang@intel.com>
> > Sent: Wednesday, July 26, 2023 4:08 PM
> > To: Gao, Chao <chao.gao@intel.com>
> > Cc: oe-lkp@lists.linux.dev; Sang, Oliver <oliver.sang@intel.com>
> > Subject: [intel-tdx:guest-hardening-rebased] [swiotlb] 36e8ff9c97:
> > kernel- selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
> > improvement
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -33.3% improvement of
> > kernel-selftests.dma.dma_map_benchmark.average_unmap_latency on:
> >
> >
> > commit: 36e8ff9c972448105048d404fd26be48fa4d7df1 ("swiotlb: use bitmap
> > to track free slots") https://github.com/intel/tdx.git
> > guest-hardening-rebased
> >
> > testcase: kernel-selftests
> > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @
> > 3.00GHz (Cascade Lake) with 32G memory
> > parameters:
> >
> > 	group: group-01
> >
> >
> >
> > Details are as below:
> > ----------------------------------------------------------------------
> > ----------------------------
> > >
> >
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > tbox_group/testcase/rootfs/kconfig/compiler/group:
> >
> > lkp-csl-d01/kernel-selftests/debian-12-x86_64-20220629.cgz/x86_64-rhel
> > -8.3-
> > kselftests/gcc-12/group-01
> >
> >
> > 06e94bd5b0f103a8 36e8ff9c972448105048d404fd2
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       0.40           -25.0%       0.30        kernel-
> > selftests.dma.dma_map_benchmark.average_map_latency
> >       0.30           -33.3%       0.20        kernel-
> > selftests.dma.dma_map_benchmark.average_unmap_latency
> >       0.17 =B1 26%      +0.0%       0.17 =B1 26%  kernel-
> > selftests.dma.dma_map_benchmark.average_unmap_latency_stddev
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         sudo bin/lkp install job.yaml           # job file is attached =
in
> this email
> >         bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e
> for lkp run
> >         sudo bin/lkp run generated-yaml-file
> >
> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >
> >
> >
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are
> > provided for informational purposes only. Any difference in system
> > hardware or software design or configuration may affect actual performa=
nce.
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >


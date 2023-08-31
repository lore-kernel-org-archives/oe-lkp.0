Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA0EA1
	for <oe-lkp@lists.linux.dev>; Thu, 31 Aug 2023 02:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693449497; x=1724985497;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VsmnxZbaicy+qj9dmQQ2hrDodYOpMyVfT3lY3ci9r8M=;
  b=n0Wa9ZxP4zPkGDHqxIhwvnK3oF1mGHQMLRW5oqxLCDQTocWjfRNENLUM
   +FqYAQO3DdhhiwWZ7lT2XPa0jl5cLzPpngKCFkGBQdHbqg8eDUDsZKAqg
   9twOHZE1PWrZQFP9d/pNKioOBh8nZtcxaUTZu04Qi54gjoYG5My3dKeS2
   N2cStS5y04HOtq0pe4xa3/79jhBR/iQqyEtChT7psT4IWfNd/CJ2uGuu3
   11KS/smNkxQJm46irn6MhG7X3SUBjsS93i+slP5367cG5KAbKhVRMO7gh
   9TzRchkT+Uy0YpwevSoW0tcjg2H2pNQpczY8vNyKu54cLCAdrdMxExsH+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442155356"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="442155356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 19:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774321124"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774321124"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 19:38:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 19:38:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 19:38:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 19:38:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 19:38:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaqbIv8v3jk9b9B2/J1YJxXxrYDa7XSnPu7tSwnfGrUsRqTx2JYnQ/7J1SepVAyqzAta8014VkcUOtTiRdFGx8lwHVU7KROhhO6yJpK8VJJeQ8MV/ZwYUYKhH5nxBENMEMWkL6Q9weAe7Vn+QAIYh1vGWubzPzNR8EJdz3KkbqVxR2hdxpLFLvnqO7p++WBlXGBlM2w9BoFVvt7V6vGIa5WQf7PTuLDLX1QhMPV6fRz3htUGp5wsbkkclfhr+gOUpxNiXBjGv3lIqiJnwLreph1qy0r87GiH/Y9VZg59JDlWmb6CEkKPDBBcv+COwiJUsyfmj1F1TVz/hosyfytNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsmnxZbaicy+qj9dmQQ2hrDodYOpMyVfT3lY3ci9r8M=;
 b=nmwbgm6ueU2Js1CIr2Hhu6U6DnIdhHP2jaQYJB0UmsKR3i7Hx0jMsZGL4APstnh2Sv4nTHUccoHfrBMaWZrr2QlfTYRQVq3EeD968lf+cZLGWkaY8puaK98h0gWthFiMx2p7ctiNa8+4JC7BR2TLASorhvYGgklu3HT+7m+7CI7jlYhf/+t7DQRQ9fd/C/l9LBopzuF1uDHe2sVkrQtzeP1TdMg3zgxe02W7zutJ1Xsk8vje06oN7zkC7iNHBYST1pChQMzWUc/+CzymF5CaaP+4fOG54m+WjJ+ILjR9kJm9FIuvKsRkcrKu3jue3zyYcgz6ixqxSgQed2ROxHPr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 02:38:12 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::afe6:1e86:52cc:f71d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::afe6:1e86:52cc:f71d%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 02:38:12 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: "Du, Julie" <julie.du@intel.com>, "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, "Sang, Oliver"
	<oliver.sang@intel.com>
Subject: RE: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
Thread-Topic: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
Thread-Index: AQHZ2k7Evt5rV9xEYkWYYhXNf682t7ACVvPggACBM2CAADyJAIAAnjbg
Date: Thu, 31 Aug 2023 02:38:12 +0000
Message-ID: <CY8PR11MB713451656F67EEC1E1AA882F89E5A@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <202308291502.2d535a18-oliver.sang@intel.com>
 <DS7PR11MB59651DCF238053376F5927C88FE6A@DS7PR11MB5965.namprd11.prod.outlook.com>
 <CY8PR11MB7134FE7B8ED92A94CB649B0089E6A@CY8PR11MB7134.namprd11.prod.outlook.com>
 <87il8w5ufv.ffs@tglx>
In-Reply-To: <87il8w5ufv.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|IA0PR11MB7259:EE_
x-ms-office365-filtering-correlation-id: 734f5f08-70e0-455e-86ee-08dba9cb5212
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CowKqG2tQd5Xb9NQbi5ZaC/8m7JwVdyfbUxhEfpBSqoyS/7hxW58vWbEXCjp5/rFw56wtfhTe2lDuXVT8hLuOMq/y1THK0fuGbqsK3zUTmJ9T+REWWPSjiuJ/aunt6A3QW30I4Sdai8gWd2+YcBlB++kWwsuzd6w1OnWhekW1z29HOABO61/ImVluB9jjegatib9GSRBZAffbmyj+Le3bA/GKeiwMUJs3vCn3cSVHjSCeFupApYea+ec/f9xEcWIwxeBKaMStaBMfLSfhlOerDuENBQbken9Rgf5EPYdBWDTd0u0nGtc43j66q3Bj/qor0Qa+/R1+f44UrofWj3zeSQF1h4KsHJlSVXRIisb0n4VKVGjdkYYIKcsN+4u0KMrzURktjeM4fYhIvhYkRU3bZmuIuvtSNKKhBr7SK8MIvZhf4FS+SCCmYatox+0swhZJXPRq+pk+vkUhI3r8ijtfLXSnKLltR78FyOiOhAaIsQ7JrX6mwMkNLrrrWICOrGpiqO6RnDnih+tA/1//aZW6kDDzBVQKHW6PbqBsr+qw1pIW1AaQUnDVDt/dRcP1L2+aa1zwB+JNbuZtHS2SbldF+uXHrEbSbNwQnjpDJeyPhg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(71200400001)(7696005)(6506007)(9686003)(966005)(478600001)(83380400001)(107886003)(26005)(4744005)(2906002)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(41300700001)(76116006)(52536014)(5660300002)(8936002)(4326008)(8676002)(82960400001)(55016003)(33656002)(86362001)(38100700002)(38070700005)(122000001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7KNukG9TNHktzeEJKgmD0m+rTIW8p1al2Vl4baZMezjNti8ucfLiY5T0wvzy?=
 =?us-ascii?Q?4WBi3fQDXZUYke5qw/jqFNtg+TXwFZuLt66qgPQ679byKcSGubuPpXFBkcNV?=
 =?us-ascii?Q?MVQ3opj7Kznxn/zL8D9doE+NikKkOSvBS9pagiQTkGVaSxiuB1jkb5xkq7/5?=
 =?us-ascii?Q?rZR6wx6gLZnEtxkmO0Om2issPsfQYR+vtyQwgdEivHXCclClUiT0mvkAMJ1X?=
 =?us-ascii?Q?AWJueuk+OUuboQmYFjqFl/2IgwUt4XQKJg1AleltSSfiSOsdFRnMwPH1wW0J?=
 =?us-ascii?Q?5pliPijzfad6YWY9/QO8FakLsSyZOe/rEM0tLEWlnH9CEjtNYfwQCToMviw7?=
 =?us-ascii?Q?rAH5aXOKaga6DL/CwsqziOnox6564AZt33uBGq9bVJq+6+rKoPDxoja3Y5L6?=
 =?us-ascii?Q?RXpAN9l20VJMRHXQAyv0GilLSMlKOunO56N1X5nZ8VQbTwgMpI4vI0FfUf6Y?=
 =?us-ascii?Q?G7tnX9+vID5EulYngPtxUhTJUDwHrAmx1cj7N2uEqlywdAEL6A4ItqNtX1s3?=
 =?us-ascii?Q?37vseHO3Q9xiPnAv5h7ASqXAj16z06M13d1Co6dQTAETbJw+xBV1hnnR7wnc?=
 =?us-ascii?Q?oyfHmaa5wJPLQRebn+UJCrTQL93Pd0j+ERfSEN5EIO9MBWpk3tVDQ0It6ZW7?=
 =?us-ascii?Q?+q4W5NudF5hDcOuJ3cDPeBqq12kDC9lvBkz0K9GqJRM+dR+/dvcPlIygyJQ/?=
 =?us-ascii?Q?cae0HHKNIn8O+5be3jhhmv1nE5CAHXiXQeS08ocLagMt/a6IyYu6gRlAED79?=
 =?us-ascii?Q?6oiM4jDd/7WAZVDoCrDiYUlJK2LeuCHS4ceCgkDeqJj9VPlSmZcRi+/QPlkE?=
 =?us-ascii?Q?xamUkbWelDVo840c+K5uRf5p110ZQ8ZkjPgmUtm2cWSZDJiHvv+Qugzrym6z?=
 =?us-ascii?Q?1jh2kHptZJj8VkjQ0euBjalDqDlV24474r3XwVixZU8XYckHa/S17NdrgN1Y?=
 =?us-ascii?Q?X/FbbKTSVreZs5H5l8ATpGenb6kwnfibNVE+PCVPx61k6qzLBaJnSdnoTgM0?=
 =?us-ascii?Q?8ISlOq/SQEDW8Alh8V59ODx/LVLRQgf95RcSnmdfh1YA8CFMCUV30F+hRGp1?=
 =?us-ascii?Q?0KovUtMgytSm3UWN7zPB+V5b3so6J27LwX1jenSrPZpfuT7w+3raKtre/Oj+?=
 =?us-ascii?Q?DBm3clQLBGjoRAYORbFudBhIPQDWl91C5I2aPHhisYRKxilkmlV+CJpSaYFe?=
 =?us-ascii?Q?JGMsBoE/VR1TpbyjP6f/SaTaz4NxqMAXQMVZI633vC0OrH5Qh3t0hgg8+inz?=
 =?us-ascii?Q?kEHDbXIIR6bRMjPdMfBQs4/XKp4lMUcP9eJBKC/wV5wsR0ZsRUKY+gVcKgUX?=
 =?us-ascii?Q?2SvbxviVRSkm3YwII6WEOLLbrljTKbhJYwOMmCogIcX/Y9w4CVWYwyhtAHDw?=
 =?us-ascii?Q?Fs8/WtDPg5U3TAZ5cc3FO28NI7uKoj3m3DYOfkRF1SvkYaDMzC0a0d5C7+kz?=
 =?us-ascii?Q?TQg2xyZGHrx522Nmow+9PCVD78oC9nSwuGf8DewyrAqRD6uYSS1N+D0el74y?=
 =?us-ascii?Q?2p5jp2VfPo0uUITB1ZqvBHlesushRNyhBKtrTNW2EatQW4rPxNLsFOTzqxj8?=
 =?us-ascii?Q?03tIJbNCCPBZCAmx78LP97zHCE0yNRpyGzIWiFEp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734f5f08-70e0-455e-86ee-08dba9cb5212
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 02:38:12.3404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQjeVn0GSin8rLsRn78lZTxC5VGxgdH/1zPl4sg5g0qBTOBi2HxdRU7nQuWShem1FCGqBMmzGQ2x49X+2eol+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-OriginatorOrg: intel.com

> From: Thomas Gleixner <tglx@linutronix.de>
> ...
> Ooops. I completely forgot to reply to this report. I've fixed that up to=
day in
> the morning already and pushed out an updated version into that
> x86/microcode branch. It's pretty much the same as you did +/- a detail.

Hi Thomas,

Thanks for your reply.

Re-tested your branch[1] with the top commit[2].
The issue is fixed (can't be reproduced).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/micr=
ocode
[2] 85a3feda8043 ("x86/microcode/intel: Add a minimum required revision for=
 late-loads")

-Qiuxu

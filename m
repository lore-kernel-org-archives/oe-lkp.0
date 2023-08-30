Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D05251
	for <oe-lkp@lists.linux.dev>; Wed, 30 Aug 2023 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693404302; x=1724940302;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fUTKIzDczKL1Jr3oGTHk0xbW965xvq1bSz3VupF0rMw=;
  b=QwBR4KiYSzzSaykVecFUisJDJDgDm0g31dcgOokNKrxSHy9Enk6ByS5t
   4AosiPu58BUJz5SEf0ffWdk4LZP7wO5LmsknH0IaMkmF3zTam+yhqoVA/
   02eK6DATWb+vtHPKMASzTNQETnOSEf2O9knTx1TOilIWBkljEKA9OmrzI
   9QxtbayxlMgqFdCEG5GEkQnKO75QGyzYaPRZmOsKKepP0rLUP72LdjT1Y
   nEx2w6/5MLnkhlw8c/S8hVkSSPjL4SdL1nOWpFnLlDUoRpQR84ZXxHoLM
   2taGLeEZpmuhUxTxuac46UkVC9TUrgS8egyKN4W+zTNj4NIsSQo7hesM/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406650301"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="406650301"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 07:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862617460"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="862617460"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 07:05:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 07:05:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 07:05:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 07:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiaB+EGQuZDJEMWCk9xjHFpfllxV4Vi+hCmwaWZHR9Cp1woi1ZPtOKPSEGZohpY4erxQRRwu6KyvjjLZczH9SFJAPx54Hb5U0oxkIRz6JRxooUNAoR4xAV3ckcEMKL/THFgRlkoXVQ8IXRbPohTlkvXkiPC7MpGXiOO36Mdi4T7ef0LgtmRlv0Zi6//LE42vMD4FFQNRMmux28iriG333opZ9nqYsqlpqispQDQRtvklQ+AX5iDt8bAnm6uGCGAH5wHiTdGlWr2qlbRFlGIkHZQhfDksweCynhhYQRuHkyrUiWxxF8FzVCcYeC+YEqLJDLg3hicoBGdjWr1WG7GPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT38hjuXFXe2+ls0cNViw6ctnoMMe10w1i36rTJKzxY=;
 b=ZoQnZB+3qHO3pYuaRuRXu03uu28LpZ6JeeAU/xmbZtPNz7QTNn/W6VkL8gjLQl2ijdq7EtMVxgpaOJVThBw0XAvQBpOTWkazBj92IZHOKS4VnUhTYVVdM+sSPLUxgWyYzKkfZv7Z1TUxK2MAEhHN1SEazIBuHlGdNzVwW+mdOoL1mZKWRRhAxeUPuXa1UOQe1leTFOl4U1bl/fYrM+o0ZH44Mcef0QNoOs6nF9TsZ5oZTl4+BlBkDsP1BIsYlMX5ayh8PTge9YyHIuXSRwhpa7hZUjkibpzcrNhQmWmNVARyedhRo/q3XkQ/Dge9CHY07XeJcVyZl8n1SAhAWdsHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 14:04:58 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::afe6:1e86:52cc:f71d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::afe6:1e86:52cc:f71d%4]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 14:04:58 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: "Du, Julie" <julie.du@intel.com>, "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, "Sang, Oliver"
	<oliver.sang@intel.com>
Subject: RE: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
Thread-Topic: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
Thread-Index: AQHZ2k7Evt5rV9xEYkWYYhXNf682t7ACVvPggACBM2A=
Date: Wed, 30 Aug 2023 14:04:58 +0000
Message-ID: <CY8PR11MB7134FE7B8ED92A94CB649B0089E6A@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <202308291502.2d535a18-oliver.sang@intel.com>
 <DS7PR11MB59651DCF238053376F5927C88FE6A@DS7PR11MB5965.namprd11.prod.outlook.com>
In-Reply-To: <DS7PR11MB59651DCF238053376F5927C88FE6A@DS7PR11MB5965.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|BN0PR11MB5695:EE_
x-ms-office365-filtering-correlation-id: 1ccae5a1-1d58-42b6-233f-08dba9621854
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZErbKVuDbKP1/FJdDVPVWb17nr2NCPBAvAgSQRaDqyZmsPPCA2ht2fwYi2Mvh6QgSUTPdCSgQo8EOa/hD+rj4tdk2kEK11jlMJY+pF6881V3VvHmyr301EGi06oe2lgSpQxuKMCVB/4T46/VjYK434Palb76rnMTlcq0rLzt2CpxQ/yaOXusqDvnFqJFWQ8vRYxicJmBtVDwuE49uxMZ372j4Fth2cb+7iAccEncc1Rw/Q0WaY0akT+uCrNGccKO2dfgNzsVpAlNrMIJh/PZ9c5I9EI28e1fesBKAiSK+dQc/0WU5RrG4cLR2d6UEGwfL6HFDB0xEiVft8SLMHvk9n+A71uJ29jFIZzLwXCyWXVpaxetoQvGTo6YNR726cuPr39dSQNQIFW+QBAS9cgzSxC7UA63fDsU6NFKOyp6ZG6OhTtOsK9WNfocRfjCyv5EImgiGEl5G4S8nYVlU8qcJOMvGoaBnaB5IGs75oCuyrJrY9qZ7TzRvyRzaKMuZcxRL7n9Lxd2xNkHQYvQ2yw6XL1/YGJ9A/EHWt1SOinLBeDr/VJNWcsZ/2s8LA+3tif69i3MzhxteRRczgbEZJB7cszwcFGklLEOjTiblYG/3eGbTqShQ3GpMYUMhIVFlke
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(186009)(1800799009)(451199024)(55016003)(82960400001)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(6916009)(316002)(76116006)(38100700002)(478600001)(38070700005)(122000001)(2906002)(86362001)(8936002)(8676002)(41300700001)(5660300002)(4326008)(52536014)(83380400001)(9686003)(71200400001)(53546011)(7696005)(6506007)(26005)(107886003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PheanjMokV9V0YPdtjpcYw4dS87sZ9N3b7qjmbp1Jyn8ITik5UoSgh07/88E?=
 =?us-ascii?Q?9by3aQsgecXw88dGBKGHAi9PzD+JiHxSvsynbRys2OszZINfJnE+5Z16hbbs?=
 =?us-ascii?Q?LUv5apydldS2kdm2R2rNGedJrpbhchE6BgeDJKqA/5bznAmF5Yqxr6GpWxPk?=
 =?us-ascii?Q?RQ833dQ+/TBLAt3sYuH8VD89BiKb7Ql1u9carw0VqPLWeppoLTo0H5SXD1Kh?=
 =?us-ascii?Q?eB8DEwChgqaV4rz8Po57rEQ2WPrYwXMv7AhG5/Abf/hhVOvcKRJbCUv6eAeh?=
 =?us-ascii?Q?a2JQoT2yzxzR3Lqtor5uwRIdhfHLrl3RIDvQa6cRkIFKZfIpaE5RJyIDFjmJ?=
 =?us-ascii?Q?ZARWvyWNRhHHkCjP6uWZHG1NuzO+Qy6+yTT2s4v4fMmuzmEbJuhrb0N0PI75?=
 =?us-ascii?Q?IkW68VsMpdB83R8nOiJfXJdpflQflDoYiJUQZPpD4234t6awZTAyb0EXgFPT?=
 =?us-ascii?Q?T2dzw5IO8KeHcLKk9RmwKi3gHnmuoeRjPfuLY2tPqgD5iuUIjQoWtqU/xW7B?=
 =?us-ascii?Q?TragrXDw0IuWfOA5sl2MsYPFpN6R4IWwCf2jV4TiafaItdiljg0DZfsxhAdu?=
 =?us-ascii?Q?uvJ2ro2HLhjSixg1nmVufE5JucYtEo6tSZU2bH/p9uPvNplFGbJazQLEcFrf?=
 =?us-ascii?Q?CcdgmFtREd+mQBNYXr6aG5f8v7cxHRQKEowQwDzpPMSaRJ9AQCTiK8NXmsA6?=
 =?us-ascii?Q?CcBw/QJBUhfxJOZ6rCqSFEyPgwiQawn3Sm+u/b9pqrkSO04B6EHgfq43AXp6?=
 =?us-ascii?Q?SDsc4x/iujg6NvQE6JeR3R+r9z9Akr3gTJIvDI8e3rFvaHO3ZmWwsDJWzi4E?=
 =?us-ascii?Q?rhrvwu0Mecwr24QF+2Q+Iicd0yxpfvzJi41tCkYh8PCuiIviaJb6mfivrk7p?=
 =?us-ascii?Q?ugXIdnl4kxd1Bsr46O2amnMuPbrPB+IhUq94QBfyC1ZsYzflYpXAJJvciigk?=
 =?us-ascii?Q?ptULQNKyOrfoSN7blyZeNCQIMl6FDJVu5JfS1q1NOMuwWk8qML2DF5JOXFWk?=
 =?us-ascii?Q?ElflNc24vDxFopv/gGWYDJd6jClNlzTisUgNRU795iGA8ebBSEHv+CF384CB?=
 =?us-ascii?Q?OznhNolHm5zMZheqH1zLgmyUdlQ4RRf9GAZzumHnHWs1ZePXzPWErRS7XKlx?=
 =?us-ascii?Q?2a2LHgB8zxT/aC5/dlGtKO1qPN2vHEIV6MhlAoLWA79jXRHCHN3tb7E8QqUi?=
 =?us-ascii?Q?j1U57//FL7PQDlaSuHRn34BWEJ78UM5fYbdCj6Ps0czmriyI+C4ARkk3yciK?=
 =?us-ascii?Q?ayEQnV+tiFbgn7KqM9oTOzHXp+bLmclVqCB9rXFTWwKPArt4EFGhBqxiyizX?=
 =?us-ascii?Q?ync/Isd9LZ42k0matFRSbuvQ5Qq4MIuaVITPPtqPs6ODyTFtEs3ZNcI3ZUMn?=
 =?us-ascii?Q?eMv+IgmuH6BauOo6wZfAAh/mi3YYizCcvM9KSXE/aLYvRpQ10G8mVMVG7cS2?=
 =?us-ascii?Q?S+qDm44cqf1Vpbyo6Jt68s2DyMI8NPBVZzHqMyk7eh0PPDhuFjwsAqOrBIAn?=
 =?us-ascii?Q?bHugMluwRitAHobdDg98WK3zgeX8CSxUDblaB+r7g4f+3eZ4bHhVHQUD64o0?=
 =?us-ascii?Q?QmCSq1nLq/vn8ZWCzyV4OcoRDZWQ552+cqITJPBg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccae5a1-1d58-42b6-233f-08dba9621854
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 14:04:58.2818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DRMZnLl7qyU/wNPmwbgZsKpbF1I7ql1vhsdmfXT5QNkzywJdzL+dFtAfuAVS5jhpqCSkuH/Q5llfeEPaxhgvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
X-OriginatorOrg: intel.com

Hi Thomas,

> From: Sang, Oliver <oliver.sang@intel.com>
> Sent: Tuesday, August 29, 2023 4:00 PM
> To: Thomas Gleixner <tglx@linutronix.de>
> ...
> BUG:unable_to_handle_page_fault_for_address
> ...
> [    0.139017][    T0] BUG: unable to handle page fault for address: 0270=
25c4
> ...
> [    0.139017][    T0] CR0: 80050033 CR2: 027025c4 CR3: 02cdf000 CR4:

The bit31 of CR0 was set which indicated that the paging was enabled as exp=
ected by your patch [1].

> ...
> [ 0.139017][ T0] EIP: load_ucode_ap
> (arch/x86/kernel/cpu/microcode/core.c:177
> arch/x86/kernel/cpu/microcode/core.c:187)

The fault EIP was due to accessing the following memory in the physical add=
ress:
    check_loader_disabled_ap() -> return *((bool *)__pa_nodebug(&dis_ucode_=
ldr));

Your patch [1] moved the 32-bit early ucode update after paging was enabled=
.
So, seems like all the following places need memory access in the virtual a=
ddress.

I can't reproduce the issue if I apply the following patch.
Please let me know if you want me to create a separate patch.

[1] 7f1f6ace4ce1 ("x86/microcode/32: Move early loading after paging enable=
")

Thanks!
-Qiuxu

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/mic=
rocode/core.c
index 95f5dcf87bcb..c4886552bb0d 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -86,17 +86,11 @@ static u32 final_levels[] =3D {
 static bool amd_check_current_patch_level(void)
 {
        u32 lvl, dummy, i;
-       u32 *levels;

        native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);

-       if (IS_ENABLED(CONFIG_X86_32))
-               levels =3D (u32 *)__pa_nodebug(&final_levels);
-       else
-               levels =3D final_levels;
-
-       for (i =3D 0; levels[i]; i++) {
-               if (lvl =3D=3D levels[i])
+       for (i =3D 0; final_levels[i]; i++) {
+               if (lvl =3D=3D final_levels[i])
                        return true;
        }
        return false;
@@ -104,36 +98,23 @@ static bool amd_check_current_patch_level(void)

 static bool __init check_loader_disabled_bsp(void)
 {
-       static const char *__dis_opt_str =3D "dis_ucode_ldr";
-
-#ifdef CONFIG_X86_32
-       const char *cmdline =3D (const char *)__pa_nodebug(boot_command_lin=
e);
-       const char *option  =3D (const char *)__pa_nodebug(__dis_opt_str);
-       bool *res =3D (bool *)__pa_nodebug(&dis_ucode_ldr);
-
-#else /* CONFIG_X86_64 */
-       const char *cmdline =3D boot_command_line;
-       const char *option  =3D __dis_opt_str;
-       bool *res =3D &dis_ucode_ldr;
-#endif
-
        /*
         * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
         * completely accurate as xen pv guests don't see that CPUID bit se=
t but
         * that's good enough as they don't land on the BSP path anyway.
         */
        if (native_cpuid_ecx(1) & BIT(31))
-               return *res;
+               return dis_ucode_ldr;

        if (x86_cpuid_vendor() =3D=3D X86_VENDOR_AMD) {
                if (amd_check_current_patch_level())
-                       return *res;
+                       return dis_ucode_ldr;
        }

-       if (cmdline_find_option_bool(cmdline, option) <=3D 0)
-               *res =3D false;
+       if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") <=
=3D 0)
+               dis_ucode_ldr =3D false;

-       return *res;
+       return dis_ucode_ldr;
 }

 void __init load_ucode_bsp(void)
@@ -173,11 +154,7 @@ void __init load_ucode_bsp(void)

 static bool check_loader_disabled_ap(void)
 {
-#ifdef CONFIG_X86_32
-       return *((bool *)__pa_nodebug(&dis_ucode_ldr));
-#else
        return dis_ucode_ldr;
-#endif
 }

 void load_ucode_ap(void)

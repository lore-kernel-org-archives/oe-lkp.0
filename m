Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD72C182
	for <oe-lkp@lists.linux.dev>; Thu, 15 Aug 2024 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723690451; cv=fail; b=DNdaUY2TRrIn1fkCYF8rSSoWNo4iQno6oUC8IoHWpX2jQTVLd4sU0kRifhdGRX8StiL25751lGVc6nVXcvNRH1CwoItmjHue1ZaoKDdExmeVHnYJ2GxM2u9Qw7fB1hTQJoxUKbA0RvwXeacwVvElO0HegJYe7FnGk+20QLC/q7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723690451; c=relaxed/simple;
	bh=4oam6JoEu1hfX43ggCBNbm4J6a7V2095LX1f12wFAo4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W6zMnLZwo8W0YGFMllGpc7zyW09iBQAkHUDQmQMVRm/fhK6+iKlXU7kkU6KxmUFAlhBgNrcGyxl8hmD8IwybH9E+qJdkC4V9Sgd341y3HhU/cC7t7NW1noyqk3mEjNHqw1Ub1tqiUpYkI8bM8cZNhmIh9sMteqvynOBwWZPP4Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTiSZozW; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTiSZozW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723690450; x=1755226450;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4oam6JoEu1hfX43ggCBNbm4J6a7V2095LX1f12wFAo4=;
  b=NTiSZozWjKBDdverVxT+76PT2BiI7XpYBYzbt6Sj4GMs3YlMTT0q4W9a
   P6MZKywX36M1ZoSwdvfuKh6uI3o0oL8w0BSm4m8eri5fEk8pSGfOOMh/L
   ZBQBp4AMm31PSmwWbx5jGzYoTP74De3k+g1FCP4aR0/2b6QkPc4Lf1Z/p
   Pg3lMDop+qKnEmiCY6XLO36Ski67QnyYAcAP9g2biBuVEx8XYfuRMXgu1
   sJsJYQKcFVTqhcvx8DnQSc1bU1qn2muFnD1jQbulJiDCLrzSBHPulSumn
   9YXyNVEMCPwSDnZlYhFhW+5TmgLM2aj0/un5SIYYDOZZ2ltppw+0FlE5b
   A==;
X-CSE-ConnectionGUID: H5U3MZivQ0ii+6xpn9CoRA==
X-CSE-MsgGUID: iIrGhWILQbu+vg5NmiUlUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33327088"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="33327088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:54:09 -0700
X-CSE-ConnectionGUID: oxKuzemnR0ie1N6EQDyKcg==
X-CSE-MsgGUID: nCmZTQB6Sh2420oLDAlJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="64154470"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 19:54:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:54:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:54:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 19:54:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 19:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfVh5WmsBQ8Qe1KTI0vy9KTQw2I5TOlpqHzd6DbgDQ7zhimzrsqFml6ALb5LLfnvWfft1pdhOYZbjQvU37MYe8HTCc+pW5DytQzlhJmzNInB5JOpVZAgZxYne5Mb9CZTaZtGYf7kGlQZp6N9tw5k31LeEe2F3UeqnkPHR+N1MtHvLhrW9VF9eEwOEfoc/sImQ91cDV7ifwAldyRab7v4mz+u8tt3uGJd/pRecGWD1rVxg8EBGJDxMYkPjyC36GUWWDzgYCSXRXz6zJQxQ1yIdH4cplRfJWIUmvvlQm3wA89HQ2N60/wI+jip38PeACQI7ruuBV1JWw1X85VMT1W8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxTnzjOIoO4Sji/mYU2K5aWxS6EGdymNv3jZsE1HZ7g=;
 b=h7rB2S8k33EreMDKde9aUbdOTJNgDV6k6LTqUNlJQhIDMFIh3XTMFea8NP4qs0Ky0nAUxLRtHzvhdW5pwYiZLjd5ejIeNHD23Gy4Ko0XBW7y6vFO6WKCD1xJYkZMOydVWLwTHmEo1ZT+9648zQJRB69Dqybvum2lE2JeXwt3x4aPB4Aaab3kUNX2Ke1cJftd4GiXPjmc62fIZmOqaOAt1yqNCZoQsT77Ytps7OU8nDcLLqgSUXFw/QWe487RtmGp0+KWNzbR3id1bg3pr03X0Gr8aYb+dfDLnUCxBhMfbhm+lCpy+Xg+1IyiyR1ay82m3NFFEIN5cgs3l3Vz6Z62hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 02:54:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 02:54:00 +0000
Date: Thu, 15 Aug 2024 10:53:52 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: are complete benchmark results available somewhere?
Message-ID: <Zr1twOLnOzSdfvQR@xsang-OptiPlex-9020>
References: <ahhsblwfjo6he4xnxdztjcscvuc7zhevbx4nnxneyh7qstietr@oei4nio6223d>
 <ZrsL1LqUHjPT0ZkE@xsang-OptiPlex-9020>
 <CAGudoHH+fWR9A2o0sxB1pi74udc5iBDehFkAUJ=j=mLe_+FrBg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHH+fWR9A2o0sxB1pi74udc5iBDehFkAUJ=j=mLe_+FrBg@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 0885cc5b-eabe-44af-d135-08dcbcd583f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STZPYmFOMmozOU5Rd3NoN3cwVEtRNU1aeXhQckl4NXB4VzJaUFNydm9NVnRr?=
 =?utf-8?B?U1NlRTY0WDUvTmtZSUI2SWVKdGtnU2svVGIzVzhYL2s2UXQzVGtCWVZYK25i?=
 =?utf-8?B?aWpMZStla1hqM2hYNCtPR2t6Y0hueW5GL0FUa2xkb1NlMkJ6ZXowVTIzeGR1?=
 =?utf-8?B?RHJPeHlLc05IQlJsOEoyWUE1SEpxQng4aFJSbUEvUldRYlc3RjRYRlNLdHl5?=
 =?utf-8?B?ZmJlc0tZTEx5OTl3Q3QrSFJ5YjhmNTYrTjdLVWhCUi9KaisrNmw5blRPK0kw?=
 =?utf-8?B?Z0hJdWo4bjloNVF1cWpmbDk4c2ZYZjdYeWJzekFkS2ZVbnRjdy9uSkJDVFha?=
 =?utf-8?B?UkZnRmdQdzlqQk83Y1pNdGtBTVd2Q1c1eDNjbGZ2VExoa1BEQ1JqK3BsTFFi?=
 =?utf-8?B?TmN3ZTRmMVhZb0RseWZYM2xRakNyaEFmVlFvNkFzZnlUSjA3STRUalY0a21P?=
 =?utf-8?B?UUg2OVZvS0x0QmxJSG1Eb2lRMVZHUWRLc1RXZm1vZjJSZ3YzcmxOQ3dvbEJq?=
 =?utf-8?B?eGtIUFM2VVFUTmtadlZCeERJQWJoZ3FjN2FjdGxXZ3pDSk4ySDVCYzJHNlJa?=
 =?utf-8?B?elBzcGJkWEpJZ1pKbWpkZUJ2OU54c3U1Y0plSUswM1JtakZiYm9SV29QRFBa?=
 =?utf-8?B?WXkzOTBmSGJFQndSTVlvKzFDNzhKbys0cEg4V0NzaDlKem53SmxCanpsN3Jk?=
 =?utf-8?B?OWY4cGZ4MkVEOElNTHJHV2lkY2NWa091M0tDdFpyNElBejlMUFIzaXR6dkEv?=
 =?utf-8?B?U0V5RHpSZTBMYlcvOXVFOHVvQ1VaNHVEei8yOUtEc2wwb2x0UHUyS1JpM3Yw?=
 =?utf-8?B?Q1NweEJMWk9ML2Y5Rm1LOUU5VFpRZkNSdzNZT3RXZzFyR0tIUTNINEJnNDFz?=
 =?utf-8?B?VlIyOUdXSkZQUUlmRDZBREh2dFluVlJ4V3ZHeVJtUDFRRnBpeWlSeWFTTnlO?=
 =?utf-8?B?S2taeE1IcjgwZTZrSWVwdHZ3OVlWM0pDQUtCODl1QXhzMFZySUdmYzRXUVNS?=
 =?utf-8?B?ekN6OHBZNFMvZTdTUXBaVGx6VWxyTmYvbHUwQ05jWDRYc0gvaFhNUHMycWlK?=
 =?utf-8?B?aHMyYVAzYnVla0orVkNHcWoyTkZtbmNSajkrd0pZZ0IvSXFCV0tPM0V4eGJV?=
 =?utf-8?B?M1RyZmI5YkdOZW0rQWVGeGdOOGJNTUZqWGtuYUpUVWQveFBnRUd5dDZIMFJh?=
 =?utf-8?B?L0d3My9reTdjbzMyRXZPMkdZSnFFWjMvVmdzZjRTdnVZTkdHeVFFclplRFRa?=
 =?utf-8?B?Z3hGdTFGY1ZvaWdwcEZiaVZ0aVN5WGtJSXo3OTBNbFYyd2xBRjNMZDdTVnVV?=
 =?utf-8?B?Yzd1YlI0YVhvbEFuSmJxLzlYL053Ny9selZsWGd6ZnExQ1c4N0pPbjRtK01t?=
 =?utf-8?B?UjFGT1RtUmdlSytIRXVDNnFkUU9UZ2l2NE1raWpuRzRNZHBvY1hvRUxsSlRP?=
 =?utf-8?B?VWNkSjd4bDVFYXNtNys5SzI4TTVBdTRXSkFwYkN5SlZFcDJnWFpldmdoY0t2?=
 =?utf-8?B?U3ZzWFdZUE5CTTFEYmUxQS9pQzAyUUdYR2JrZkhsVG1SSThOSkJQYkJQUWtm?=
 =?utf-8?B?UXVYZVlBYzN6UURGbUlFQ3ExVzhwb2p6TG5jWGFLbEpQcC9xVjZCbW4xelRV?=
 =?utf-8?B?MWxubU9JSisyUEdCaFk3QmZEV2R6Q09mTUJ0Q1hWRGVaUHA4Q1c5cHRQd1dM?=
 =?utf-8?B?S25XcFZjMUFiZ0JpOUYvNVEyUSthRGE2RlBYVjAwV2EwNUZJMU1uSEIva1Fy?=
 =?utf-8?B?cHB2dWdqU0Y5NGd6aFlKZVo3MmxuYTVyNVl2Zm1zSXF2d1hFaStTTVl0YnFK?=
 =?utf-8?B?c0tCVkkxdlZNNlBQbWlTUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZzRmtDY2ZhSVQwY1FKWUtaZlg0aW9WQ001NVdTTXI3eHA0d243MEQ0TnJT?=
 =?utf-8?B?Qm4xRTJWMEpndVZGU2p2OGQzb2N5ZzhrUjVUVEVoTCsvVDZHQmcycmtEbVla?=
 =?utf-8?B?emFQbkJRVzFQenpYMEgycDlCamFuWmd2aXpDYSsxakJrU3lpUWNUa0tDQkxt?=
 =?utf-8?B?WjloN0ZZSXhFWmRkdSsrMkZiMVNyVmFveGJ3QmVweklrWVZFUjFLY0pKRGh2?=
 =?utf-8?B?cjlKaklnQmxidnQ1dUtQWERPTDJrMmtOQjFvdFk3Y0ZFcnRPejVqak1WaXhS?=
 =?utf-8?B?OGtNSG94K3lvUmhMMUtrcU96Ym4zY2luUC8xQlB3Q1IvUWZpWWNmRElSTGVC?=
 =?utf-8?B?T2dSRGlZY1pPTGQ2dkYrL0NPK0ZjUGY3aDdkdks0Z0tjcFkrL1VIV0pyazhi?=
 =?utf-8?B?Y1c3Z3FGSWdPSDZlR0NFR0U3ckhKODh4T3VPU2tTVEtkRUUwNHo5REYwQzRZ?=
 =?utf-8?B?aVhEQzNIeUxIdHRoTnVVclBjZHhDdWRjNTBnbWMxSHJ5R28rcXBlSGcxbkRa?=
 =?utf-8?B?bTlPVTllTGtyY2lwQVVtWmt0dVhFazVGbnRMVjJhMENCSEgxNUk3WUFYK0l1?=
 =?utf-8?B?TUo4U0F0NjNCWmVSMW1OV0pjRFJ3R25waUNHOUVnRk4zaGsxNnNXRzI3SDhP?=
 =?utf-8?B?Ni85Mmh6MkpnVHgyYmg2SUtFODJuMnI4SW8xcTFPSEh0eUZ6WTh2d29FcGpR?=
 =?utf-8?B?d3U3RnduVmNJSGM0TldsNlE0TDRkd0x0NHhaMEY2WUt4RklkZXkwU2dRNGlP?=
 =?utf-8?B?R1dMWDdsMjVJenE3b1lYMnNCY1Q0ZXpub2c2cTh4dGFnQUgxTFAyUG1iRkVh?=
 =?utf-8?B?QXJ6ZUZSWE5MUllibUthUFZUSXF1NkthQmVBelQrSHBVaGV5akNzTDIzZjhn?=
 =?utf-8?B?amo4Z3ZnSzV3RlExOEsvWkVrV0ZiVXN6TUg1bkNveUN1emxEQ0xUWTZtay9z?=
 =?utf-8?B?TmtuV0JHeCtNbVp6aSthVEpQNVArQW1WSURNV0tIVnNjZFZxYTNwSUpkVTZM?=
 =?utf-8?B?am10eVpQeGcreEsxQmNrQTlIbWtZWlYzUW9qYXBtbXB6dExXQnVCRGQxZUxS?=
 =?utf-8?B?ekw5dnBabUY0ZEsvQlMrK0kvMUhjV2I0Yk8yRXpya3hSTGxTbzdQQUhBaDBF?=
 =?utf-8?B?bGdmc05VTmsxRnpGWEhaYXhsN2l2SHQzbWZKRXI1ejlvNlA3Q01ZcGxTdmNU?=
 =?utf-8?B?K092RSt6TXhsc2VkNmFHUGJ0UEM4dmpTbWF2RUF1cGZxMko2U2htUmJJbUhh?=
 =?utf-8?B?eDJ1WXZNZkJBVkNCa212VlpYM0E4VTlXM1NUQXljRXBIVTVjeWJnQWRaS011?=
 =?utf-8?B?b2g4U0lROHVGU28xd3E4cFlPby9KODlpWG81MjNZK0o1NDhNSWlydFAzQmdQ?=
 =?utf-8?B?OG1pQTZhTm9iN09DWXk1KzFYYXhYa2xNZUFFYUlNb1p2VmZLdG40TmRSblox?=
 =?utf-8?B?dVUzWmIrQ2I4dXdVeUwrS1c2bXc2MFB5RFdmU2tKNXBWUG5YeHd3a3pUM2ky?=
 =?utf-8?B?dms4TUFBT0ZzSUd4OFhlUDRrRGMvNWh0MElBN0RiUlVsdE9rdlNLamsrdC9t?=
 =?utf-8?B?ZW1EQ1ZEbjA1NjN3U1lFbEhjZ044bjRZeEJLUUxsVHlJV3dVblF1azdNZXli?=
 =?utf-8?B?aXQwd1J1NkdxQ3FmTTF4QmliUXovY1g1MzFNVUtVRk01VGhMWUJHM1Y4REFl?=
 =?utf-8?B?MmpQa0FYOFFacWFzbkFjbFJkR1JnYUVEU3ZvNk0vTlJzcEJuMFd2QXlxRVlB?=
 =?utf-8?B?ejVLTFowUWlqMVlQMDhuMVZTTzFLQjhvRXFqR1ZlaEpLZWI2QU1sUUdZenJq?=
 =?utf-8?B?V1ltT3RNS3BHaDErSGkyMkt4eGJjWkR3S3o0M3NGTTZhRlkwQjRHVk54YXo1?=
 =?utf-8?B?NG16aEErb0hrMjJlNmE4dWoxYW9YOFRqSjN3NEhlZGN1N0RtcXBEWVNURm53?=
 =?utf-8?B?WUxzNEQyV1V3TWFZL3pVWUZJYklZbTVkRjBLa2VjaG1Xc281WThnZHkxWHZL?=
 =?utf-8?B?RXpjVk1FenRQZ05kUFlkOS9SNXNyanRyZVVrd2RjaEZCNHJMaDZxUjkxNFBX?=
 =?utf-8?B?SUNIa3QyQ1pJY1ZseHRrRFRUMWFYc1VUL2wrYm11TmxUNHFLV0lEcVgrSzJJ?=
 =?utf-8?Q?MHnF1dBTSrbHMay5Xf77U7ETl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0885cc5b-eabe-44af-d135-08dcbcd583f9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:54:00.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjDBJnnj+Nofi27ctaGs75VVKePrFD1+eg3XtCZS0n3BV8JSVQuFbu8xAJ4PGHS8c7h3cltA9tohzThhmhCPiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Tue, Aug 13, 2024 at 09:38:38AM +0200, Mateusz Guzik wrote:
> On Tue, Aug 13, 2024 at 9:32 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Mateusz Guzik,
> >
> > On Mon, Aug 12, 2024 at 12:45:04PM +0200, Mateusz Guzik wrote:
> > > I only found results for performance changes, nothing abut the current
> > > state of things for any particular kernel and/or machine.
> >
> > do you mean for [1]?
> >
> > do you mean lastest mainline data for this test when you mentioned "current
> > state of things"?
> >
> > when we finished the bisect for this regression, we also tested head of
> > mainline at that time, confirmed regression still exists.
> >
> > # extra tests on head commit of linus/master
> > # bad: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> >
> >
> > >
> > > If this info is not pubicly available as is, can you do me a favor and a
> > > one off send me a set of results + profiles for the biggest machine you
> > > test on?
> >
> > what do you mean 'biggest machine'? the Ice Lake machine we used for origial
> > report is a reletively powerful machine in our test machine pool.
> >
> > due to resource constraint, we cannot run all tests on all machines, just allot
> > different tests to different machines. sorry that it's hard for us to allocate
> > lots of resources for one test upon one commit.
> >
> > BTW, if your request is really for [1], Fengwei has already tested your patch
> > and replied you, is that well enough?
> >
> 
> This has nothing to do with that thing.
> 
> I'm looking at removing lockref usage from dcache and I'm trying to
> find out how the profiles look like on your fleet for the tests which
> do induce significant lockref traffic.
> 
> I only found reports when there is a win or a regression and even then
> only for the affected test, 

yes, this is how our kernel test bot works - regression driven.

> no profile for "the current state of
> things" on a particular box or kernel.

it's not in our scope to publish this kind of data. we are not triditional CI.

but data could exist in our storage, generated due to running milestone release
kernels for base data, or generated while bisect.

so you could query, such like for which kernels, which type of platforms, which
tests. we could check if they exist then share with you.


> 
> -- 
> Mateusz Guzik <mjguzik gmail.com>

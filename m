Content-Type: multipart/mixed; boundary="===============5002575992802289758=="
MIME-Version: 1.0
From: Ning, Hongyu <hongyu.ning@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic.c:#dev_watchdog
Date: Tue, 24 Aug 2021 08:50:23 +0000
Message-ID: <PH0PR11MB5593FB5ED4B8C5F5DB034B01EDC59@PH0PR11MB5593.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB53214ECF6A3E866D0B1CBAC08FFE9@BN9PR11MB5321.namprd11.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5002575992802289758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oliver,

Though not exactly the same issue reproduced on my side, there are indeed s=
ome strange behaviors regarding netdev introduced by commit e2f278db42: x86=
/tdx: Implement ioremap_shared for x86

Will follow up with it in JIRA.

Thanks,
Hongyu

-----Original Message-----
From: Du, Julie <julie.du@intel.com> =

Sent: Tuesday, August 17, 2021 2:49 PM
To: Andi Kleen <ak@linux.intel.com>; Sang, Oliver <oliver.sang@intel.co=
m>; Ning, Hongyu <hongyu.ning@intel.com>
Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>
Subject: RE: [LKP] Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_gener=
ic.c:#dev_watchdog

+ Hongyu who tests TDX feature. =


-----Original Message-----
From: Andi Kleen <ak@linux.intel.com> =

Sent: Tuesday, August 17, 2021 10:53 AM
To: Sang, Oliver <oliver.sang@intel.com>
Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>
Subject: [LKP] Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic.c=
:#dev_watchdog


> e2f278db42:
> 2021-08-16 14:44:02
> 2021-08-16 14:55:41
> 2021-08-16 15:01:56
> 2021-08-16 15:10:24
> 2021-08-16 15:15:59
> 2021-08-16 15:22:01
>
>
> by checking all dmesg for 12 runs of parent and 12 runs of e2f278db42, =

> we confirmed the phenomenon are similar.


That's mysterious. The patch should really be a nop.

I just looked through it again and I don't see anything that could be a non=
 nop on non TDX or AMD SEV.

The patch should apply/work on its own. Do you see the problem too if you a=
pply it on an otherwise booting kernel.

>
> attached one dmesg for 0cc1e5f476 and one for e2f278db42 FYI
>
>
> BTW, is there a simple way to decide the test runs in 'non TDX system' =

> or not?

TDX is a future CPU feature, not in any systems that you run. It also needs=
 special setup both on the host and the guest. BTW it also changes behavior=
 on AMD SEV enabled systems, but I assume you don't have one of those eithe=
r.


-Andi

_______________________________________________
LKP mailing list -- lkp(a)lists.01.org
To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============5002575992802289758==--


Content-Type: multipart/mixed; boundary="===============9131685271079905441=="
MIME-Version: 1.0
From: Du, Julie <julie.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic.c:#dev_watchdog
Date: Tue, 17 Aug 2021 06:48:30 +0000
Message-ID: <BN9PR11MB53214ECF6A3E866D0B1CBAC08FFE9@BN9PR11MB5321.namprd11.prod.outlook.com>
In-Reply-To: <0e530745-c23d-0839-3f0f-8696aa0db818@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9131685271079905441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
--===============9131685271079905441==--


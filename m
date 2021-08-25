Content-Type: multipart/mixed; boundary="===============8605154095002303675=="
MIME-Version: 1.0
From: Ning, Hongyu <hongyu.ning@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic.c:#dev_watchdog
Date: Wed, 25 Aug 2021 02:52:21 +0000
Message-ID: <PH0PR11MB5593D266B708513C32718F6EEDC69@PH0PR11MB5593.namprd11.prod.outlook.com>
In-Reply-To: <1dc27c53-a8f2-a1e0-945d-9ee862daadc3@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8605154095002303675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andi, Oliver,

This patch fix the original issue on my side, everything looks fine now.

-=3D Hongyu

-----Original Message-----
From: Andi Kleen <ak@linux.intel.com> =

Sent: Wednesday, August 25, 2021 8:10 AM
To: Ning, Hongyu <hongyu.ning@intel.com>; Du, Julie <julie.du@intel.com=
>; Sang, Oliver <oliver.sang@intel.com>
Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>; Lai, Yi1 <yi1.lai@intel.co=
m>
Subject: Re: [LKP] Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_gener=
ic.c:#dev_watchdog


On 8/24/2021 1:50 AM, Ning, Hongyu wrote:
> Oliver,
>
> Though not exactly the same issue reproduced on my side, there are =

> indeed some strange behaviors regarding netdev introduced by commit =

> e2f278db42: x86/tdx: Implement ioremap_shared for x86


I found the bug now. ioremap_shared was using write combining instead of un=
cached, which can explain the strange effects.


Can you please check if this patch fixes it?


Thanks,

-Andi



>
> Will follow up with it in JIRA.
>
> Thanks,
> Hongyu
>
> -----Original Message-----
> From: Du, Julie <julie.du@intel.com>
> Sent: Tuesday, August 17, 2021 2:49 PM
> To: Andi Kleen <ak@linux.intel.com>; Sang, Oliver <oliver.sang@intel.=
com>; Ning, Hongyu <hongyu.ning@intel.com>
> Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>
> Subject: RE: [LKP] Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_gen=
eric.c:#dev_watchdog
>
> + Hongyu who tests TDX feature.
>
> -----Original Message-----
> From: Andi Kleen <ak@linux.intel.com>
> Sent: Tuesday, August 17, 2021 10:53 AM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>
> Subject: [LKP] Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic=
.c:#dev_watchdog
>
>
>> e2f278db42:
>> 2021-08-16 14:44:02
>> 2021-08-16 14:55:41
>> 2021-08-16 15:01:56
>> 2021-08-16 15:10:24
>> 2021-08-16 15:15:59
>> 2021-08-16 15:22:01
>>
>>
>> by checking all dmesg for 12 runs of parent and 12 runs of e2f278db42,
>> we confirmed the phenomenon are similar.
>
> That's mysterious. The patch should really be a nop.
>
> I just looked through it again and I don't see anything that could be a n=
on nop on non TDX or AMD SEV.
>
> The patch should apply/work on its own. Do you see the problem too if you=
 apply it on an otherwise booting kernel.
>
>> attached one dmesg for 0cc1e5f476 and one for e2f278db42 FYI
>>
>>
>> BTW, is there a simple way to decide the test runs in 'non TDX system'
>> or not?
> TDX is a future CPU feature, not in any systems that you run. It also nee=
ds special setup both on the host and the guest. BTW it also changes behavi=
or on AMD SEV enabled systems, but I assume you don't have one of those eit=
her.
>
>
> -Andi
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============8605154095002303675==--


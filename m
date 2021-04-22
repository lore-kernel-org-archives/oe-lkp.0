Content-Type: multipart/mixed; boundary="===============6000443666272030419=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Thu, 22 Apr 2021 10:55:10 +0100
Message-ID: <87wnsutzi9.mognet@arm.com>
In-Reply-To: <20210422074742.GE31382@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6000443666272030419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22/04/21 15:47, Oliver Sang wrote:
> hi, Valentin Schneider,
>
> On Wed, Apr 21, 2021 at 11:27:49AM +0100, Valentin Schneider wrote:
>> On 21/04/21 11:20, Oliver Sang wrote:
>> > what's the machine model you used upon which the regression cannot be =
reproduced?
>> > we could check if we have similar model then re-check on the our machi=
ne.
>> >
>> =

>> I tested this on:
>> o Ampere eMAG (arm64, 32 cores)
>> o 2-socket Xeon E5-2690 (x86, 40 cores)
>> =

>> and found at worse a -0.3% regression and at best a 2% improvement. I kn=
ow
>> that x86 box is somewhat ancient, but it's been my go-to "have I broken
>> x86?" test victim for a while :-)
>
> we don't have exactly 2-socket Xeon E5-2690 model, but we have one:
> Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (2-socket, 48 cores with 112G m=
emory)
> the test on it shows the regression is existing, too. but smaller (-5.3%)
> hope it's helpful
>

It is, thank you for trying this out on another system and figuring out
it's still visible! I'll go find myself some other x86 box and dig into it;
I'd rather not leave this hanging for too long.
--===============6000443666272030419==--


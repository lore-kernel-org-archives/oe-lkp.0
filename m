Content-Type: multipart/mixed; boundary="===============7092827965083955977=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 15:03:57 +0800
Message-ID: <87pogo8zs2.fsf@yhuang-dev.intel.com>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB5714@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7092827965083955977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Aubrey,

"Li, Aubrey" <aubrey.li@intel.com> writes:

> Hi Lei,
>
> Can you please help to grant me the access to lkp-bdw-ep2?
> I need KVM+Keyboard control as I need to tune BIOS option.
>
> Also, I need an account on lkp-bdw-ep2, better with root privilege.

For this kind of test, to avoid pollute the results of 0-Day, it is
better for you to take the machine out of 0-Day to do the test.  You can
test with lkp-tests with the same job file.

And please make sure you return the machine with exact same BIOS setup
before.

And, it is better for you to return the machine during the weekend,
because the machine will run test during the weekend for whole 48 hours
in 0-Day.

Best Regards,
Huang, Ying

> Thanks,
> -Aubrey
>
>> >> >(3) I need to dig into the test machine bios to confirm if it's
>> >> >compliant to my expected criteria, how to do that?
>> >> >
>> >>
>> >> The test machine is lkp-bdw-ep2, you may ssh into it to check?
>> >>
>> >
>> >ssh is not good enough to me. I need to change the BIOS setting.
>> >So I need KVM access (screen + keyboard) and root Privilege of that
>> >machine.
>> =

>> +Lu Lei
>> =

>> Hi, Lei
>> =

>> Can you help on this?
>> =

>> Thanks,
>> Xiaolong
>> >
>> >Thanks,
>> >-Aubrey

--===============7092827965083955977==--


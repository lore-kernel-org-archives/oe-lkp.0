Content-Type: multipart/mixed; boundary="===============3134119491273416624=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] a6211caa63: dmesg.UBSAN:signed-integer-overflow_in_arch/x86/include/asm/atomic.h
Date: Sat, 06 Jun 2020 11:03:13 +0800
Message-ID: <a33f477a-3847-f870-bf3f-845910b90665@intel.com>
In-Reply-To: <20200605140521.GD4117@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3134119491273416624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/5/2020 10:05 PM, Peter Zijlstra wrote:
> On Fri, Jun 05, 2020 at 06:17:51AM -0700, Eric Dumazet wrote:
>> On Fri, Jun 5, 2020 at 1:10 AM kernel test robot <rong.a.chen@intel.co=
m> wrote:
>> There you go.
>>
>> We decided this was a bogus report, and that UBSAN requires sane compile=
rs.
>>
>> Please read the fine comment that was added in this commit and update
>> your compiler or do not mess with compiler flags.
>>
>> +       /* If UBSAN reports an error there, please make sure your compil=
er
>> +        * supports -fno-strict-overflow before reporting it that was a =
bug
>> +        * in UBSAN, and it has been fixed in GCC-8.
>> +        */
>> +       return atomic_add_return(segs + delta, p_id) - segs;
>>>          make HOSTCC=3Dgcc-4.9 CC=3Dgcc-4.9 ARCH=3Di386 olddefconfig pr=
epare modules_prepare bzImage
> Rong, can you make sure to exclude gcc<8 for UBSAN reports ?

Got it, thank's for your warning.

Best Regards,
Rong Chen


--===============3134119491273416624==--


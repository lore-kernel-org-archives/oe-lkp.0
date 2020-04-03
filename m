Content-Type: multipart/mixed; boundary="===============7182381387658191652=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: de8f5e4f2d ("lockdep: Introduce wait-type checks"): [ 17.344674] EIP: default_idle
Date: Fri, 03 Apr 2020 14:52:58 +0800
Message-ID: <75dd6e6b-745d-23be-6d3d-1984b1f7f47d@intel.com>
In-Reply-To: <87h7y2ns2j.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7182381387658191652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/2/20 5:40 PM, Thomas Gleixner wrote:
> kernel test robot <lkp@intel.com> writes:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit de8f5e4f2dc1f032b46afda0a78cab5456974f89
>> Author:     Peter Zijlstra <peterz@infradead.org>
>> AuthorDate: Sat Mar 21 12:26:01 2020 +0100
>> Commit:     Peter Zijlstra <peterz@infradead.org>
>> CommitDate: Sat Mar 21 16:00:24 2020 +0100
>>
>>      lockdep: Introduce wait-type checks
> Can you please avoid enabling
>
>> CONFIG_PROVE_RAW_LOCK_NESTING=3Dy
> for now?
>
> As the changelog states, there are known issues and that's why the
> config is default=3Dn.

Hi Thomas,

Thanks for the advice, we have disabled CONFIG_PROVE_RAW_LOCK_NESTING.

Best Regards,
Rong Chen
--===============7182381387658191652==--


Content-Type: multipart/mixed; boundary="===============8715497122377934264=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 088fe47ce9: tests/openmp/openmp_sample: Segmentation fault
Date: Tue, 23 Oct 2018 09:01:54 +0800
Message-ID: <450ce7f2-94e9-d29a-f5cd-159661e4a822@intel.com>
In-Reply-To: <875zxygf0y.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8715497122377934264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/19/2018 10:57 PM, Eric W. Biederman wrote:
> Rong Chen <rong.a.chen@intel.com> writes:
>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 088fe47ce952542389e604e83f533811750aaf7c ("signal: Add calculate=
_sigpending()")
>> base:https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
  master
>>
>> in testcase: perf_event_tests
>> with following parameters:
>>
>> 	paranoid: disallow_cpu_events
>>
>>
>>
>> on test machine: Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with 128G mem=
ory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> * Checking OpenMP support
>>    + tests/openmp/openmp_test
>>      Testing OpenMP results...                                  PASSED
>>    + tests/openmp/openmp_overflow
>>        + tests/openmp/openmp_sample
>>      * Checking proposed interface updates (not in any released kernel)
>>
>> To reproduce:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clonehttps://github.com/=
intel/lkp-tests.git
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImage> jo=
b-script # job-script is attached
>> in this email
> I may dig into this more, but it looks like it will take a lot of
> digging to make any sense of the test code, and I don't have the time
> for that at the moment.
>
> The patch you have pinpointed may change when a SIGSEGV is delivered but
> it can not not cause a new SIGSEGV to be generated.
>
> So I strongly suspect the test case made assumptions about the exact
> time of signals that are no longer true, or that there is simply a race
> in it's operation and the change caused that race to show up.
>
> If the assumption shows up in production code rather than a test case I
> would definitely consider even a race a regression that needs to be
> fixed.  I don't know about this case.
>
> Can you provide any help tracking down what openmp_overflow is doing
> and why it is getting a SIGSEGV in a location it does not expect?
I am sorry I don't know the case either.
My workmate has created a issue on github. =

https://github.com/deater/perf_event_tests/issues/16

Best Regards,
Rong Chen

>
> If this has uncovered a unreasonable race in the test the test needs to
> get fixed.
>
> Eric


--===============8715497122377934264==--


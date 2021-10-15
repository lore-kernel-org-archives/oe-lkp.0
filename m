Content-Type: multipart/mixed; boundary="===============0281807882283456647=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
To: lkp@lists.01.org
Subject: Re: [PM] bfcc1e67ff: kernel-selftests.breakpoints.step_after_suspend_test.fail
Date: Fri, 15 Oct 2021 20:45:38 +0200
Message-ID: <d3cf18f1-2af7-5e4d-abe4-c882f25bd5c3@intel.com>
In-Reply-To: <6755cf07-fa5a-cbb7-c076-57c162a08c99@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0281807882283456647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14/2021 11:55 PM, Florian Fainelli wrote:
> On 10/14/21 12:23 PM, Rafael J. Wysocki wrote:
>> On 10/14/2021 6:26 PM, Florian Fainelli wrote:
>>> On 10/14/21 12:57 AM, kernel test robot wrote:
>>>> Greeting,
>>>>
>>>> FYI, we noticed the following commit (built with gcc-9):
>>>>
>>>> commit: bfcc1e67ff1e4aa8bfe2ca57f99390fc284c799d ("PM: sleep: Do not
>>>> assume that "mem" is always present")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>>
>>>> in testcase: kernel-selftests
>>>> version: kernel-selftests-x86_64-c8c9111a-1_20210929
>>>> with following parameters:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0group: group-00
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x11
>>>>
>>>> test-description: The kernel contains a set of "self tests" under the
>>>> tools/testing/selftests/ directory. These are intended to be small
>>>> unit tests to exercise individual code paths in the kernel.
>>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>>>
>>>>
>>>> on test machine: 288 threads 2 sockets Intel(R) Xeon Phi(TM) CPU 7295
>>>> @ 1.50GHz with 80G memory
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire
>>>> log/backtrace):
>>>>
>>>>
>>>>
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>> Thanks for your report. Assuming that the code responsible for
>>> registering the suspend operations is drivers/acpi/sleep.c for your
>>> platform, and that acpi_sleep_suspend_setup() iterated over all possible
>>> sleep states, your platform must somehow be returning that ACPI_STATE_S3
>>> is not a supported state somehow?
>>>
>>> Rafael have you ever encountered something like that?
>> Yes, there are systems with ACPI that don't support S3.
> OK and do you know what happens when we enter suspend with "mem" in
> those cases? Do we immediately return because ultimately the firmware
> does not support ACPI S3?

"mem" should not be present in the list of available strings then, so it =

should be rejected right away.


> I will rework
> tools/testing/selftests/breakpoints/step_after_suspend_test.c not to
> assume that "mem" is always available, since it may not be.


--===============0281807882283456647==--


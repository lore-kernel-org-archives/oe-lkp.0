Content-Type: multipart/mixed; boundary="===============6446133573188615398=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
To: lkp@lists.01.org
Subject: Re: [PM] bfcc1e67ff: kernel-selftests.breakpoints.step_after_suspend_test.fail
Date: Thu, 14 Oct 2021 21:23:37 +0200
Message-ID: <e526de16-5efd-6474-20e1-3f96a2e3c524@intel.com>
In-Reply-To: <51c0a15f-1941-f161-dcec-a7a9acc726f2@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6446133573188615398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14/2021 6:26 PM, Florian Fainelli wrote:
> On 10/14/21 12:57 AM, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: bfcc1e67ff1e4aa8bfe2ca57f99390fc284c799d ("PM: sleep: Do not ass=
ume that "mem" is always present")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>>
>> in testcase: kernel-selftests
>> version: kernel-selftests-x86_64-c8c9111a-1_20210929
>> with following parameters:
>>
>> 	group: group-00
>> 	ucode: 0x11
>>
>> test-description: The kernel contains a set of "self tests" under the to=
ols/testing/selftests/ directory. These are intended to be small unit tests=
 to exercise individual code paths in the kernel.
>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>
>>
>> on test machine: 288 threads 2 sockets Intel(R) Xeon Phi(TM) CPU 7295 @ =
1.50GHz with 80G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
> Thanks for your report. Assuming that the code responsible for
> registering the suspend operations is drivers/acpi/sleep.c for your
> platform, and that acpi_sleep_suspend_setup() iterated over all possible
> sleep states, your platform must somehow be returning that ACPI_STATE_S3
> is not a supported state somehow?
>
> Rafael have you ever encountered something like that?

Yes, there are systems with ACPI that don't support S3.


>>
>> TAP version 13
>> 1..2
>> # selftests: breakpoints: step_after_suspend_test
>> # TAP version 13
>> # Bail out! Failed to enter Suspend state
>> # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>> not ok 1 selftests: breakpoints: step_after_suspend_test # exit=3D1
>>
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          sudo bin/lkp install job.yaml           # job file is attached =
in this email
>>          bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
>>          sudo bin/lkp run generated-yaml-file
>>
>>          # if come across any failure that blocks the test,
>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology C=
enter
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corp=
oration
>>
>> Thanks,
>> Oliver Sang
>>
>

--===============6446133573188615398==--


Content-Type: multipart/mixed; boundary="===============2975031059552797467=="
MIME-Version: 1.0
From: Shuah Khan <shuahkh@osg.samsung.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [selftests] 26e500fe62: kernel_selftests.mqueue.mq_open_tests.fail
Date: Thu, 28 Sep 2017 09:22:52 -0600
Message-ID: <31018ce1-a437-d2b4-25ea-822dc3b9a1af@osg.samsung.com>
In-Reply-To: <ac7cd3f3-16fa-52f5-92d5-bfad4090da1f@osg.samsung.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2975031059552797467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/28/2017 09:15 AM, Shuah Khan wrote:
> On 09/28/2017 01:58 AM, kernel test robot wrote:
>>
>> FYI, we noticed the following commit:
>>
>> commit: 26e500fe628e28f2e93d397014beeb9c213d91e9 ("selftests: mqueue: Us=
e full path to run tests from Makefile")
>> https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git f=
ixes
>>
>> in testcase: kernel_selftests
>> with following parameters:
>>
>>
>> test-description: The kernel contains a set of "self tests" under the to=
ols/testing/selftests/ directory. These are intended to be small unit tests=
 to exercise individual code paths in the kernel.
>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>
>>
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>> 2017-09-27 18:35:28 make run_tests -C mqueue
>> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-26e50=
0fe628e28f2e93d397014beeb9c213d91e9/tools/testing/selftests/mqueue'
>> gcc -O2    mq_open_tests.c -lrt -lpthread -lpopt -o /usr/src/linux-selft=
ests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c213d91e9/tools/testing=
/selftests/mqueue/mq_open_tests
>> gcc -O2    mq_perf_tests.c -lrt -lpthread -lpopt -o /usr/src/linux-selft=
ests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c213d91e9/tools/testing=
/selftests/mqueue/mq_perf_tests
>> /usr/src/linux-selftests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9=
c213d91e9/tools/testing/selftests/mqueue/mq_open_tests /test1 || echo "self=
tests: mq_open_tests [FAIL]"
>> /usr/src/linux-selftests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9=
c213d91e9/tools/testing/selftests/mqueue//mq_perf_tests || echo "selftests:=
 mq_perf_tests [FAIL]"
>>
>> Initial system state:
>> 	Using queue path:		/test1
>> 	RLIMIT_MSGQUEUE(soft):		819200
>> 	RLIMIT_MSGQUEUE(hard):		819200
>> 	Maximum Message Size:		8192
>> 	Maximum Queue Size:		10
>> 	Default Message Size:		8192
>> 	Default Queue Size:		10
>>
>> Adjusted system state for testing:
>> 	RLIMIT_MSGQUEUE(soft):		819200
>> 	RLIMIT_MSGQUEUE(hard):		819200
>> 	Maximum Message Size:		8192
>> 	Maximum Queue Size:		10
>> 	Default Message Size:		8192
>> 	Default Queue Size:		10
>>
>>
> =

> Will you be able to send me the results without this change.
> I am unable to figure out the difference.

Ah I see. You are talking about the difference in the adjusted
system state. That is weird. The only change this patch makes
it the test path.

I will look into this further.

thanks,
-- Shuah

--===============2975031059552797467==--


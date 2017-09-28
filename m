Content-Type: multipart/mixed; boundary="===============5177431549667807084=="
MIME-Version: 1.0
From: Shuah Khan <shuahkh@osg.samsung.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [selftests] 26e500fe62: kernel_selftests.mqueue.mq_open_tests.fail
Date: Thu, 28 Sep 2017 09:15:37 -0600
Message-ID: <ac7cd3f3-16fa-52f5-92d5-bfad4090da1f@osg.samsung.com>
In-Reply-To: <20170928075836.GW17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5177431549667807084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/28/2017 01:58 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 26e500fe628e28f2e93d397014beeb9c213d91e9 ("selftests: mqueue: Use=
 full path to run tests from Makefile")
> https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git fi=
xes
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> 2017-09-27 18:35:28 make run_tests -C mqueue
> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-26e500=
fe628e28f2e93d397014beeb9c213d91e9/tools/testing/selftests/mqueue'
> gcc -O2    mq_open_tests.c -lrt -lpthread -lpopt -o /usr/src/linux-selfte=
sts-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c213d91e9/tools/testing/=
selftests/mqueue/mq_open_tests
> gcc -O2    mq_perf_tests.c -lrt -lpthread -lpopt -o /usr/src/linux-selfte=
sts-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c213d91e9/tools/testing/=
selftests/mqueue/mq_perf_tests
> /usr/src/linux-selftests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c=
213d91e9/tools/testing/selftests/mqueue/mq_open_tests /test1 || echo "selft=
ests: mq_open_tests [FAIL]"
> /usr/src/linux-selftests-x86_64-rhel-7.2-26e500fe628e28f2e93d397014beeb9c=
213d91e9/tools/testing/selftests/mqueue//mq_perf_tests || echo "selftests: =
mq_perf_tests [FAIL]"
> =

> Initial system state:
> 	Using queue path:		/test1
> 	RLIMIT_MSGQUEUE(soft):		819200
> 	RLIMIT_MSGQUEUE(hard):		819200
> 	Maximum Message Size:		8192
> 	Maximum Queue Size:		10
> 	Default Message Size:		8192
> 	Default Queue Size:		10
> =

> Adjusted system state for testing:
> 	RLIMIT_MSGQUEUE(soft):		819200
> 	RLIMIT_MSGQUEUE(hard):		819200
> 	Maximum Message Size:		8192
> 	Maximum Queue Size:		10
> 	Default Message Size:		8192
> 	Default Queue Size:		10
> =

> =


Will you be able to send me the results without this change.
I am unable to figure out the difference.
> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong
> =


thanks,
-- Shuah

--===============5177431549667807084==--


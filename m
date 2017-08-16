Content-Type: multipart/mixed; boundary="===============6805372685003152641=="
MIME-Version: 1.0
From: Shuah Khan <shuah@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [selftests] 83fab1816d: kernel_selftests.futex.make_fail
Date: Wed, 16 Aug 2017 10:28:07 -0600
Message-ID: <7fa9762d-3c2b-f8be-1ef8-4819d714de1a@kernel.org>
In-Reply-To: <20170816055543.GC13788@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6805372685003152641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/15/2017 11:55 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 83fab1816dadd182539d3928ea5fd53436bcbcb3 ("selftests: futex: conv=
ert test to use ksft TAP13 framework")
> url: https://github.com/0day-ci/linux/commits/Shuah-Khan/selftests-futex-=
convert-test-to-use-ksft-TAP13-framework/20170806-030533
> =

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

> =

> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-7.2-83fab1816dadd182539d3928ea5fd53436bcbcb3
> 2017-08-12 02:23:11 ln -sf /usr/bin/gcc-5 /usr/bin/gcc
> =

> ...
> =

> 2017-08-12 02:31:19 make run_tests -C futex
> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-83fab1=
816dadd182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex'
> for DIR in functional; do		\
> 	BUILD_TARGET=3D/usr/src/linux-selftests-x86_64-rhel-7.2-83fab1816dadd182=
539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/$DIR;	\
> 	mkdir $BUILD_TARGET  -p;	\
> 	make OUTPUT=3D$BUILD_TARGET -C $DIR all;\
> done
> make[1]: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-83f=
ab1816dadd182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/functio=
nal'
> gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread=
 -lrt  futex_wait_timeout.c ../include/futextest.h ../include/atomic.h ../i=
nclude/logging.h  -o /usr/src/linux-selftests-x86_64-rhel-7.2-83fab1816dadd=
182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/functional/futex_=
wait_timeout
> In file included from futex_wait_timeout.c:28:0:
> ../include/logging.h: In function 'print_result':
> ../include/logging.h:118:3: warning: implicit declaration of function 'ks=
ft_test_result_error' [-Wimplicit-function-declaration]
>    ksft_test_result_error("%s\n", test_name);
>    ^
> ../include/logging.h: In function 'print_result':
> ../include/logging.h:118:3: warning: implicit declaration of function 'ks=
ft_test_result_error' [-Wimplicit-function-declaration]
>    ksft_test_result_error("%s\n", test_name);

This patch depends on new ksft API that is in linux-kselftest next and also=
 in linux-next.
It looks like the failure is because of the missing dependent commit.

c0bb2cf40e42b2fe5c8aa1c4f6f4d09c98839d91
selftests: kselftest framework: add error counter

thanks,
-- Shuah

>    ^
> /tmp/lkp/ccC2uYVW.o: In function `print_result':
> /usr/src/linux-selftests-x86_64-rhel-7.2-83fab1816dadd182539d3928ea5fd534=
36bcbcb3/tools/testing/selftests/futex/functional/../include/logging.h:118:=
 undefined reference to `ksft_test_result_error'
> collect2: error: ld returned 1 exit status
> ../../lib.mk:62: recipe for target '/usr/src/linux-selftests-x86_64-rhel-=
7.2-83fab1816dadd182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/=
functional/futex_wait_timeout' failed
> make[1]: *** [/usr/src/linux-selftests-x86_64-rhel-7.2-83fab1816dadd18253=
9d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/functional/futex_wait_=
timeout] Error 1
> make[1]: Leaving directory '/usr/src/linux-selftests-x86_64-rhel-7.2-83fa=
b1816dadd182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex/function=
al'
> Makefile:10: recipe for target 'all' failed
> make: *** [all] Error 2
> make: Leaving directory '/usr/src/linux-selftests-x86_64-rhel-7.2-83fab18=
16dadd182539d3928ea5fd53436bcbcb3/tools/testing/selftests/futex'
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong
> =



--===============6805372685003152641==--


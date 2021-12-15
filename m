Content-Type: multipart/mixed; boundary="===============0818404760167604162=="
MIME-Version: 1.0
From: Reinette Chatre <reinette.chatre@intel.com>
To: lkp@lists.01.org
Subject: Re: [selftests/sgx] f0ff2447b8: kernel-selftests.sgx.make_fail
Date: Wed, 15 Dec 2021 07:41:19 -0800
Message-ID: <e7678d20-6dd5-dd13-fec5-1881ffbb8995@intel.com>
In-Reply-To: <20211215153206.GD34913@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0818404760167604162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On 12/15/2021 7:32 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: f0ff2447b8613b883f41ae845b6cc7540d6e5f71 ("selftests/sgx: Add a n=
ew kselftest: Unclobbered_vdso_oversubscribed")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/sgx
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-99d09ee9-1_20211206
> with following parameters:
> =

> 	group: sgx
> 	ucode: 0xde
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40=
GHz with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-8.3-kselftests-f0ff2447b8613b883f41ae845b6cc7540d6e5f71
> 2021-12-11 16:33:38 ln -sf /usr/bin/clang
> 2021-12-11 16:33:38 ln -sf /usr/bin/llc
> 2021-12-11 16:33:39 sed -i s/default_timeout=3D45/default_timeout=3D300/ =
kselftest/runner.sh
> 2021-12-11 16:33:39 make -C sgx
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselfte=
sts-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx'
> gcc -Wall -Werror -g -I../../../../tools/include -fPIC -z noexecstack -c =
main.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f0ff2447b8613b=
883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx/main.o
> main.c: In function =E2=80=98get_total_epc_mem=E2=80=99:
> main.c:275:3: error: implicit declaration of function =E2=80=98__cpuid=E2=
=80=99 [-Werror=3Dimplicit-function-declaration]
>     __cpuid(&eax, &ebx, &ecx, &edx);
>     ^~~~~~~
> cc1: all warnings being treated as errors
> make: *** [Makefile:33: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx/main=
.o] Error 1
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftes=
ts-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx'
> 2021-12-11 16:33:39 make run_tests -C sgx
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselfte=
sts-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx'
> gcc -Wall -Werror -g -I../../../../tools/include -fPIC -z noexecstack -c =
main.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-f0ff2447b8613b=
883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx/main.o
> main.c: In function =E2=80=98get_total_epc_mem=E2=80=99:
> main.c:275:3: error: implicit declaration of function =E2=80=98__cpuid=E2=
=80=99 [-Werror=3Dimplicit-function-declaration]
>     __cpuid(&eax, &ebx, &ecx, &edx);
>     ^~~~~~~
> cc1: all warnings being treated as errors
> make: *** [Makefile:33: /usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx/main=
.o] Error 1
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftes=
ts-f0ff2447b8613b883f41ae845b6cc7540d6e5f71/tools/testing/selftests/sgx'
> =


Thank you very much for the report. The fix has already been submitted:
https://lore.kernel.org/linux-sgx/20211204202355.23005-1-jarkko(a)kernel.or=
g/

Reinette



--===============0818404760167604162==--


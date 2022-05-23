Content-Type: multipart/mixed; boundary="===============6045351771283387829=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [rseq] 3bb11f3f68: kernel-selftests.rseq.make_fail
Date: Mon, 23 May 2022 15:30:37 -0400
Message-ID: <1454426300.65656.1653334237745.JavaMail.zimbra@efficios.com>
In-Reply-To: <20220523141434.GA17163@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6045351771283387829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On May 23, 2022, at 10:14 AM, kernel test robot oliver.sang(a)intel.c=
om wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 3bb11f3f6872a692759f653f90d10674deb330a4 ("rseq: Remove broken ua=
pi
> field layout on 32-bit little endian")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git
> linux-5.15.y
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-8d3977ef-1_20220520
> with following parameters:
> =

>	group: rseq
>	ucode: 0xec
> =

> test-description: The kernel contains a set of "self tests" under the
> tools/testing/selftests/ directory. These are intended to be small unit t=
ests
> to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G
> memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):

I suspect this is because commit "rseq: Remove broken uapi field layout on =
32-bit little endian"

needs to have this prior commit cherry-picked as well:

commit 5c105d55a9 ("selftests/rseq: introduce own copy of rseq uapi header")

Thanks,

Mathieu

> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> KERNEL SELFTESTS: linux_headers_dir is
> /usr/src/linux-headers-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f653=
f90d10674deb330a4
> 2022-05-21 14:37:09 ln -sf /usr/bin/clang
> 2022-05-21 14:37:09 ln -sf /usr/bin/llc
> 2022-05-21 14:37:09 sed -i s/default_timeout=3D45/default_timeout=3D300/
> kselftest/runner.sh
> 2022-05-21 14:37:09 make -C rseq
> make: Entering directory
> '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f6=
53f90d10674deb330a4/tools/testing/selftests/rseq'
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/
> -L/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f=
653f90d10674deb330a4/tools/testing/selftests/rseq
> -Wl,-rpath=3D./  -shared -fPIC rseq.c -lpthread -o
> /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f65=
3f90d10674deb330a4/tools/testing/selftests/rseq/librseq.so
> In file included from rseq.c:30:
> rseq.h: In function =E2=80=98rseq_clear_rseq_cs=E2=80=99:
> rseq.h:143:20: error: request for member =E2=80=98ptr=E2=80=99 in somethi=
ng not a structure or
> union
>  143 |  __rseq_abi.rseq_cs.ptr =3D 0;
>      |                    ^
> make: *** [Makefile:27:
> /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f65=
3f90d10674deb330a4/tools/testing/selftests/rseq/librseq.so]
> Error 1
> make: Leaving directory
> '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f6=
53f90d10674deb330a4/tools/testing/selftests/rseq'
> 2022-05-21 14:37:10 make run_tests -C rseq
> make: Entering directory
> '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f6=
53f90d10674deb330a4/tools/testing/selftests/rseq'
> gcc -O2 -Wall -g -I./ -I../../../../usr/include/
> -L/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f=
653f90d10674deb330a4/tools/testing/selftests/rseq
> -Wl,-rpath=3D./  -shared -fPIC rseq.c -lpthread -o
> /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f65=
3f90d10674deb330a4/tools/testing/selftests/rseq/librseq.so
> In file included from rseq.c:30:
> rseq.h: In function =E2=80=98rseq_clear_rseq_cs=E2=80=99:
> rseq.h:143:20: error: request for member =E2=80=98ptr=E2=80=99 in somethi=
ng not a structure or
> union
>  143 |  __rseq_abi.rseq_cs.ptr =3D 0;
>      |                    ^
> make: *** [Makefile:27:
> /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f65=
3f90d10674deb330a4/tools/testing/selftests/rseq/librseq.so]
> Error 1
> make: Leaving directory
> '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-3bb11f3f6872a692759f6=
53f90d10674deb330a4/tools/testing/selftests/rseq'
> =

> =

> =

> To reproduce:
> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        sudo bin/lkp install job.yaml           # job file is attached in =
this email
>        bin/lkp split-job --compatible job.yaml # generate the yaml file f=
or lkp run
>        sudo bin/lkp run generated-yaml-file
> =

>        # if come across any failure that blocks the test,
>        # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--===============6045351771283387829==--


Content-Type: multipart/mixed; boundary="===============6383441694193418695=="
MIME-Version: 1.0
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 2ee567d31a: kernel_selftests.kvm.make_fail
Date: Mon, 03 Jun 2019 09:54:17 +0200
Message-ID: <ca2f7911-43dc-de4c-a9e3-dce7fd8afe9b@de.ibm.com>
In-Reply-To: <20190603023112.GL22325@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6383441694193418695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03.06.19 04:31, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 2ee567d31a5812cf93c0ec943b142de252ce1cff ("KVM: selftests: enable=
 pgste option for the linker on s390")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-01
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 8=
G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>

I fixed up the offending commit.
 =

> =

> 2019-05-31 18:25:21 make run_tests -C kvm
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d=
31a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm'
> make --no-builtin-rules ARCH=3Dx86 -C ../../../.. headers_install
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-2ee5=
67d31a5812cf93c0ec943b142de252ce1cff'
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-2ee56=
7d31a5812cf93c0ec943b142de252ce1cff'
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/assert.c -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/t=
esting/selftests/kvm/lib/assert.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/elf.c -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/test=
ing/selftests/kvm/lib/elf.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/io.c -o /usr/src/perf_sel=
ftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testi=
ng/selftests/kvm/lib/io.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/kvm_util.c -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools=
/testing/selftests/kvm/lib/kvm_util.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/ucall.c -o /usr/src/perf_=
selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/te=
sting/selftests/kvm/lib/ucall.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/sparsebit.c -o /usr/src/p=
erf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tool=
s/testing/selftests/kvm/lib/sparsebit.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/processor.c=
 -o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de=
252ce1cff/tools/testing/selftests/kvm/lib/x86_64/processor.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/vmx.c -o /u=
sr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1=
cff/tools/testing/selftests/kvm/lib/x86_64/vmx.o
> ar crs /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b=
142de252ce1cff/tools/testing/selftests/kvm/libkvm.a /usr/src/perf_selftests=
-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testing/sel=
ftests/kvm/lib/assert.o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5=
812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm/lib/elf.o /usr/sr=
c/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/t=
ools/testing/selftests/kvm/lib/io.o /usr/src/perf_selftests-x86_64-rhel-7.6=
-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm/lib/k=
vm_util.o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943=
b142de252ce1cff/tools/testing/selftests/kvm/lib/ucall.o /usr/src/perf_selft=
ests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testing=
/selftests/kvm/lib/sparsebit.o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee5=
67d31a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm/lib/x86_64=
/processor.o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec=
943b142de252ce1cff/tools/testing/selftests/kvm/lib/x86_64/vmx.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-st=
ack-protector -fno-PIE -I../../../../tools/include -I../../../../usr/includ=
e/ -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie -Wl,--s390-p=
gste  x86_64/platform_info_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-2=
ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm/libkvm.=
a  -o /usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec943b142=
de252ce1cff/tools/testing/selftests/kvm/x86_64/platform_info_test
> /usr/bin/ld: unrecognized option '--s390-pgste'
> /usr/bin/ld: use the --help option for usage information
> collect2: error: ld returned 1 exit status
> ../lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-2ee567d31a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm/x86_6=
4/platform_info_test' failed
> make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d31a5812cf93c0ec=
943b142de252ce1cff/tools/testing/selftests/kvm/x86_64/platform_info_test] E=
rror 1
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-2ee567d3=
1a5812cf93c0ec943b142de252ce1cff/tools/testing/selftests/kvm'
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Thanks,
> Rong Chen
>=20

--===============6383441694193418695==--


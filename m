Content-Type: multipart/mixed; boundary="===============5079026091320260353=="
MIME-Version: 1.0
From: Willy Tarreau <w@1wt.eu>
To: lkp@lists.01.org
Subject: Re: [selftests/nolibc] 362aecb2d8: kernel-selftests.nolibc.make_fail
Date: Sun, 09 Oct 2022 17:19:05 +0200
Message-ID: <20221009151905.GA28148@1wt.eu>
In-Reply-To: <202210081618.754a77db-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5079026091320260353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 08, 2022 at 04:57:43PM +0800, kernel test robot wrote:
(...)
> 2022-10-02 10:04:53 make TARGETS=3Dnolibc
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-ksel=
ftests-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/nol=
ibc'
>   CC      nolibc-test
> /usr/bin/ld: /tmp/cccOWbdp.o: in function `printf':
> nolibc-test.c:(.text+0x369): undefined reference to `strlen'
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:31: nolibc-test] Error 1
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/noli=
bc'
> make: *** [Makefile:155: all] Error 2
> 2022-10-02 10:04:53 make -C nolibc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselfte=
sts-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/nolibc'
>   CC      nolibc-test
> /usr/bin/ld: /tmp/lkp/ccP4fovP.o: in function `printf':
> nolibc-test.c:(.text+0x369): undefined reference to `strlen'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile:31: nolibc-test] Error 1
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftes=
ts-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/nolibc'
> 2022-10-02 10:04:54 make quicktest=3D1 run_tests -C nolibc
> make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselfte=
sts-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/nolibc'
> make: *** No rule to make target 'run_tests'.  Stop.
> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftes=
ts-362aecb2d8cfad0268d6c0ae5f448e9b6eee7ffb/tools/testing/selftests/nolibc'
> =

> =

> This error only happens when build with gcc-12, while gcc-11 and gcc-9
> build fine. We are not sure whether this is a compiler issue or a kernel
> code issue, so we send this report FYI. Below link may be helpful for
> analysis:
> =

> https://www.spinics.net/lists/fedora-devel/msg296395.html
(...)

Many thanks for the detailed report and hints. Since we're only providing
include files we don't always have the luxury of enforcing build options
on the caller, so it took me quite some trial and error but I finally
found a way around it. I'm sending a updated patch to Paul for merging.

Thanks again,
Willy
--===============5079026091320260353==--

